; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54058 () Bool)

(assert start!54058)

(declare-fun b!251494 () Bool)

(declare-fun e!174257 () Bool)

(declare-datatypes ((array!13682 0))(
  ( (array!13683 (arr!6987 (Array (_ BitVec 32) (_ BitVec 8))) (size!6000 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10922 0))(
  ( (BitStream!10923 (buf!6502 array!13682) (currentByte!11957 (_ BitVec 32)) (currentBit!11952 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10922)

(declare-fun array_inv!5741 (array!13682) Bool)

(assert (=> b!251494 (= e!174257 (array_inv!5741 (buf!6502 thiss!1005)))))

(declare-fun b!251495 () Bool)

(declare-fun res!210619 () Bool)

(declare-fun e!174260 () Bool)

(assert (=> b!251495 (=> (not res!210619) (not e!174260))))

(declare-datatypes ((Unit!18148 0))(
  ( (Unit!18149) )
))
(declare-datatypes ((tuple2!21570 0))(
  ( (tuple2!21571 (_1!11713 Unit!18148) (_2!11713 BitStream!10922)) )
))
(declare-fun lt!390838 () tuple2!21570)

(declare-fun lt!390839 () tuple2!21570)

(declare-fun isPrefixOf!0 (BitStream!10922 BitStream!10922) Bool)

(assert (=> b!251495 (= res!210619 (isPrefixOf!0 (_2!11713 lt!390838) (_2!11713 lt!390839)))))

(declare-fun b!251496 () Bool)

(declare-fun e!174253 () Bool)

(declare-fun e!174255 () Bool)

(assert (=> b!251496 (= e!174253 e!174255)))

(declare-fun res!210620 () Bool)

(assert (=> b!251496 (=> (not res!210620) (not e!174255))))

(declare-fun lt!390840 () (_ BitVec 64))

(declare-fun lt!390845 () (_ BitVec 64))

(assert (=> b!251496 (= res!210620 (= lt!390840 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!390845)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!251496 (= lt!390840 (bitIndex!0 (size!6000 (buf!6502 (_2!11713 lt!390838))) (currentByte!11957 (_2!11713 lt!390838)) (currentBit!11952 (_2!11713 lt!390838))))))

(assert (=> b!251496 (= lt!390845 (bitIndex!0 (size!6000 (buf!6502 thiss!1005)) (currentByte!11957 thiss!1005) (currentBit!11952 thiss!1005)))))

(declare-fun b!251497 () Bool)

(declare-fun res!210625 () Bool)

(declare-fun e!174252 () Bool)

(assert (=> b!251497 (=> (not res!210625) (not e!174252))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!251497 (= res!210625 (validate_offset_bits!1 ((_ sign_extend 32) (size!6000 (buf!6502 thiss!1005))) ((_ sign_extend 32) (currentByte!11957 thiss!1005)) ((_ sign_extend 32) (currentBit!11952 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!251498 () Bool)

(declare-fun res!210618 () Bool)

(assert (=> b!251498 (=> (not res!210618) (not e!174255))))

(assert (=> b!251498 (= res!210618 (isPrefixOf!0 thiss!1005 (_2!11713 lt!390838)))))

(declare-fun res!210627 () Bool)

(assert (=> start!54058 (=> (not res!210627) (not e!174252))))

(assert (=> start!54058 (= res!210627 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54058 e!174252))

(assert (=> start!54058 true))

(declare-fun inv!12 (BitStream!10922) Bool)

(assert (=> start!54058 (and (inv!12 thiss!1005) e!174257)))

(declare-fun b!251499 () Bool)

(declare-fun e!174258 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!251499 (= e!174258 (invariant!0 (currentBit!11952 thiss!1005) (currentByte!11957 thiss!1005) (size!6000 (buf!6502 (_2!11713 lt!390839)))))))

(declare-fun b!251500 () Bool)

(declare-fun res!210616 () Bool)

(assert (=> b!251500 (=> (not res!210616) (not e!174252))))

(assert (=> b!251500 (= res!210616 (bvslt from!289 nBits!297))))

(declare-fun b!251501 () Bool)

(declare-fun e!174251 () Bool)

(assert (=> b!251501 (= e!174251 e!174260)))

(declare-fun res!210615 () Bool)

(assert (=> b!251501 (=> (not res!210615) (not e!174260))))

(declare-fun lt!390833 () (_ BitVec 64))

(assert (=> b!251501 (= res!210615 (= (bitIndex!0 (size!6000 (buf!6502 (_2!11713 lt!390839))) (currentByte!11957 (_2!11713 lt!390839)) (currentBit!11952 (_2!11713 lt!390839))) (bvadd (bitIndex!0 (size!6000 (buf!6502 (_2!11713 lt!390838))) (currentByte!11957 (_2!11713 lt!390838)) (currentBit!11952 (_2!11713 lt!390838))) lt!390833)))))

(assert (=> b!251501 (= lt!390833 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!251502 () Bool)

(declare-fun e!174259 () Bool)

(declare-datatypes ((tuple2!21572 0))(
  ( (tuple2!21573 (_1!11714 BitStream!10922) (_2!11714 Bool)) )
))
(declare-fun lt!390846 () tuple2!21572)

(declare-fun lt!390842 () tuple2!21572)

(assert (=> b!251502 (= e!174259 (= (_2!11714 lt!390846) (_2!11714 lt!390842)))))

(declare-fun b!251503 () Bool)

(declare-fun res!210624 () Bool)

(assert (=> b!251503 (=> (not res!210624) (not e!174258))))

(assert (=> b!251503 (= res!210624 (invariant!0 (currentBit!11952 thiss!1005) (currentByte!11957 thiss!1005) (size!6000 (buf!6502 (_2!11713 lt!390838)))))))

(declare-fun b!251504 () Bool)

(assert (=> b!251504 (= e!174252 (not (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((tuple2!21574 0))(
  ( (tuple2!21575 (_1!11715 BitStream!10922) (_2!11715 BitStream!10922)) )
))
(declare-fun lt!390849 () tuple2!21574)

(declare-fun bit!26 () Bool)

(declare-fun readBitPure!0 (BitStream!10922) tuple2!21572)

(assert (=> b!251504 (= (_2!11714 (readBitPure!0 (_1!11715 lt!390849))) bit!26)))

(declare-fun lt!390848 () tuple2!21574)

(declare-fun reader!0 (BitStream!10922 BitStream!10922) tuple2!21574)

(assert (=> b!251504 (= lt!390848 (reader!0 (_2!11713 lt!390838) (_2!11713 lt!390839)))))

(assert (=> b!251504 (= lt!390849 (reader!0 thiss!1005 (_2!11713 lt!390839)))))

(assert (=> b!251504 e!174259))

(declare-fun res!210622 () Bool)

(assert (=> b!251504 (=> (not res!210622) (not e!174259))))

(assert (=> b!251504 (= res!210622 (= (bitIndex!0 (size!6000 (buf!6502 (_1!11714 lt!390846))) (currentByte!11957 (_1!11714 lt!390846)) (currentBit!11952 (_1!11714 lt!390846))) (bitIndex!0 (size!6000 (buf!6502 (_1!11714 lt!390842))) (currentByte!11957 (_1!11714 lt!390842)) (currentBit!11952 (_1!11714 lt!390842)))))))

(declare-fun lt!390835 () Unit!18148)

(declare-fun lt!390834 () BitStream!10922)

(declare-fun readBitPrefixLemma!0 (BitStream!10922 BitStream!10922) Unit!18148)

(assert (=> b!251504 (= lt!390835 (readBitPrefixLemma!0 lt!390834 (_2!11713 lt!390839)))))

(assert (=> b!251504 (= lt!390842 (readBitPure!0 (BitStream!10923 (buf!6502 (_2!11713 lt!390839)) (currentByte!11957 thiss!1005) (currentBit!11952 thiss!1005))))))

(assert (=> b!251504 (= lt!390846 (readBitPure!0 lt!390834))))

(assert (=> b!251504 (= lt!390834 (BitStream!10923 (buf!6502 (_2!11713 lt!390838)) (currentByte!11957 thiss!1005) (currentBit!11952 thiss!1005)))))

(assert (=> b!251504 e!174258))

(declare-fun res!210621 () Bool)

(assert (=> b!251504 (=> (not res!210621) (not e!174258))))

(assert (=> b!251504 (= res!210621 (isPrefixOf!0 thiss!1005 (_2!11713 lt!390839)))))

(declare-fun lt!390836 () Unit!18148)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10922 BitStream!10922 BitStream!10922) Unit!18148)

(assert (=> b!251504 (= lt!390836 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11713 lt!390838) (_2!11713 lt!390839)))))

(assert (=> b!251504 e!174251))

(declare-fun res!210626 () Bool)

(assert (=> b!251504 (=> (not res!210626) (not e!174251))))

(assert (=> b!251504 (= res!210626 (= (size!6000 (buf!6502 (_2!11713 lt!390838))) (size!6000 (buf!6502 (_2!11713 lt!390839)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10922 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21570)

(assert (=> b!251504 (= lt!390839 (appendNBitsLoop!0 (_2!11713 lt!390838) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!251504 (validate_offset_bits!1 ((_ sign_extend 32) (size!6000 (buf!6502 (_2!11713 lt!390838)))) ((_ sign_extend 32) (currentByte!11957 (_2!11713 lt!390838))) ((_ sign_extend 32) (currentBit!11952 (_2!11713 lt!390838))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!390844 () Unit!18148)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10922 BitStream!10922 (_ BitVec 64) (_ BitVec 64)) Unit!18148)

(assert (=> b!251504 (= lt!390844 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11713 lt!390838) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!251504 e!174253))

(declare-fun res!210623 () Bool)

(assert (=> b!251504 (=> (not res!210623) (not e!174253))))

(assert (=> b!251504 (= res!210623 (= (size!6000 (buf!6502 thiss!1005)) (size!6000 (buf!6502 (_2!11713 lt!390838)))))))

(declare-fun appendBit!0 (BitStream!10922 Bool) tuple2!21570)

(assert (=> b!251504 (= lt!390838 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!251505 () Bool)

(declare-fun e!174256 () Bool)

(declare-fun lt!390843 () tuple2!21572)

(assert (=> b!251505 (= e!174256 (= (bitIndex!0 (size!6000 (buf!6502 (_1!11714 lt!390843))) (currentByte!11957 (_1!11714 lt!390843)) (currentBit!11952 (_1!11714 lt!390843))) lt!390840))))

(declare-fun b!251506 () Bool)

(declare-fun lt!390837 () tuple2!21572)

(declare-fun lt!390847 () tuple2!21574)

(assert (=> b!251506 (= e!174260 (not (or (not (_2!11714 lt!390837)) (not (= (_1!11714 lt!390837) (_2!11715 lt!390847))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10922 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21572)

(assert (=> b!251506 (= lt!390837 (checkBitsLoopPure!0 (_1!11715 lt!390847) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!251506 (validate_offset_bits!1 ((_ sign_extend 32) (size!6000 (buf!6502 (_2!11713 lt!390839)))) ((_ sign_extend 32) (currentByte!11957 (_2!11713 lt!390838))) ((_ sign_extend 32) (currentBit!11952 (_2!11713 lt!390838))) lt!390833)))

(declare-fun lt!390841 () Unit!18148)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10922 array!13682 (_ BitVec 64)) Unit!18148)

(assert (=> b!251506 (= lt!390841 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11713 lt!390838) (buf!6502 (_2!11713 lt!390839)) lt!390833))))

(assert (=> b!251506 (= lt!390847 (reader!0 (_2!11713 lt!390838) (_2!11713 lt!390839)))))

(declare-fun b!251507 () Bool)

(assert (=> b!251507 (= e!174255 e!174256)))

(declare-fun res!210617 () Bool)

(assert (=> b!251507 (=> (not res!210617) (not e!174256))))

(assert (=> b!251507 (= res!210617 (and (= (_2!11714 lt!390843) bit!26) (= (_1!11714 lt!390843) (_2!11713 lt!390838))))))

(declare-fun readerFrom!0 (BitStream!10922 (_ BitVec 32) (_ BitVec 32)) BitStream!10922)

(assert (=> b!251507 (= lt!390843 (readBitPure!0 (readerFrom!0 (_2!11713 lt!390838) (currentBit!11952 thiss!1005) (currentByte!11957 thiss!1005))))))

(assert (= (and start!54058 res!210627) b!251497))

(assert (= (and b!251497 res!210625) b!251500))

(assert (= (and b!251500 res!210616) b!251504))

(assert (= (and b!251504 res!210623) b!251496))

(assert (= (and b!251496 res!210620) b!251498))

(assert (= (and b!251498 res!210618) b!251507))

(assert (= (and b!251507 res!210617) b!251505))

(assert (= (and b!251504 res!210626) b!251501))

(assert (= (and b!251501 res!210615) b!251495))

(assert (= (and b!251495 res!210619) b!251506))

(assert (= (and b!251504 res!210621) b!251503))

(assert (= (and b!251503 res!210624) b!251499))

(assert (= (and b!251504 res!210622) b!251502))

(assert (= start!54058 b!251494))

(declare-fun m!378387 () Bool)

(assert (=> b!251505 m!378387))

(declare-fun m!378389 () Bool)

(assert (=> b!251501 m!378389))

(declare-fun m!378391 () Bool)

(assert (=> b!251501 m!378391))

(declare-fun m!378393 () Bool)

(assert (=> b!251498 m!378393))

(declare-fun m!378395 () Bool)

(assert (=> b!251504 m!378395))

(declare-fun m!378397 () Bool)

(assert (=> b!251504 m!378397))

(declare-fun m!378399 () Bool)

(assert (=> b!251504 m!378399))

(declare-fun m!378401 () Bool)

(assert (=> b!251504 m!378401))

(declare-fun m!378403 () Bool)

(assert (=> b!251504 m!378403))

(declare-fun m!378405 () Bool)

(assert (=> b!251504 m!378405))

(declare-fun m!378407 () Bool)

(assert (=> b!251504 m!378407))

(declare-fun m!378409 () Bool)

(assert (=> b!251504 m!378409))

(declare-fun m!378411 () Bool)

(assert (=> b!251504 m!378411))

(declare-fun m!378413 () Bool)

(assert (=> b!251504 m!378413))

(declare-fun m!378415 () Bool)

(assert (=> b!251504 m!378415))

(declare-fun m!378417 () Bool)

(assert (=> b!251504 m!378417))

(declare-fun m!378419 () Bool)

(assert (=> b!251504 m!378419))

(declare-fun m!378421 () Bool)

(assert (=> b!251504 m!378421))

(declare-fun m!378423 () Bool)

(assert (=> b!251497 m!378423))

(assert (=> b!251496 m!378391))

(declare-fun m!378425 () Bool)

(assert (=> b!251496 m!378425))

(declare-fun m!378427 () Bool)

(assert (=> b!251494 m!378427))

(declare-fun m!378429 () Bool)

(assert (=> b!251495 m!378429))

(declare-fun m!378431 () Bool)

(assert (=> b!251506 m!378431))

(declare-fun m!378433 () Bool)

(assert (=> b!251506 m!378433))

(declare-fun m!378435 () Bool)

(assert (=> b!251506 m!378435))

(assert (=> b!251506 m!378397))

(declare-fun m!378437 () Bool)

(assert (=> start!54058 m!378437))

(declare-fun m!378439 () Bool)

(assert (=> b!251503 m!378439))

(declare-fun m!378441 () Bool)

(assert (=> b!251499 m!378441))

(declare-fun m!378443 () Bool)

(assert (=> b!251507 m!378443))

(assert (=> b!251507 m!378443))

(declare-fun m!378445 () Bool)

(assert (=> b!251507 m!378445))

(push 1)

(assert (not b!251504))

(assert (not b!251495))

(assert (not b!251501))

(assert (not b!251503))

(assert (not b!251505))

(assert (not b!251499))

(assert (not b!251506))

(assert (not start!54058))

(assert (not b!251497))

(assert (not b!251498))

(assert (not b!251496))

(assert (not b!251494))

(assert (not b!251507))

(check-sat)

(pop 1)

(push 1)

(check-sat)

