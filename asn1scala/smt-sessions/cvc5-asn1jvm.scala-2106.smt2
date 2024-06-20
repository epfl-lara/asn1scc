; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53406 () Bool)

(assert start!53406)

(declare-fun b!247888 () Bool)

(declare-fun res!207457 () Bool)

(declare-fun e!171750 () Bool)

(assert (=> b!247888 (=> (not res!207457) (not e!171750))))

(declare-fun from!289 () (_ BitVec 64))

(declare-datatypes ((array!13531 0))(
  ( (array!13532 (arr!6919 (Array (_ BitVec 32) (_ BitVec 8))) (size!5932 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10786 0))(
  ( (BitStream!10787 (buf!6419 array!13531) (currentByte!11835 (_ BitVec 32)) (currentBit!11830 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10786)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!247888 (= res!207457 (validate_offset_bits!1 ((_ sign_extend 32) (size!5932 (buf!6419 thiss!1005))) ((_ sign_extend 32) (currentByte!11835 thiss!1005)) ((_ sign_extend 32) (currentBit!11830 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!247889 () Bool)

(declare-fun res!207452 () Bool)

(declare-fun e!171748 () Bool)

(assert (=> b!247889 (=> (not res!207452) (not e!171748))))

(declare-datatypes ((Unit!17985 0))(
  ( (Unit!17986) )
))
(declare-datatypes ((tuple2!21252 0))(
  ( (tuple2!21253 (_1!11548 Unit!17985) (_2!11548 BitStream!10786)) )
))
(declare-fun lt!386338 () tuple2!21252)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!247889 (= res!207452 (invariant!0 (currentBit!11830 thiss!1005) (currentByte!11835 thiss!1005) (size!5932 (buf!6419 (_2!11548 lt!386338)))))))

(declare-fun b!247890 () Bool)

(declare-fun bit!26 () Bool)

(declare-datatypes ((tuple2!21254 0))(
  ( (tuple2!21255 (_1!11549 BitStream!10786) (_2!11549 BitStream!10786)) )
))
(declare-fun lt!386348 () tuple2!21254)

(declare-datatypes ((tuple2!21256 0))(
  ( (tuple2!21257 (_1!11550 BitStream!10786) (_2!11550 Bool)) )
))
(declare-fun checkBitsLoopPure!0 (BitStream!10786 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21256)

(assert (=> b!247890 (= e!171750 (not (= (_1!11550 (checkBitsLoopPure!0 (_1!11549 lt!386348) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289))) (_2!11549 lt!386348))))))

(declare-fun lt!386337 () tuple2!21252)

(declare-fun lt!386345 () (_ BitVec 64))

(assert (=> b!247890 (validate_offset_bits!1 ((_ sign_extend 32) (size!5932 (buf!6419 (_2!11548 lt!386337)))) ((_ sign_extend 32) (currentByte!11835 (_2!11548 lt!386338))) ((_ sign_extend 32) (currentBit!11830 (_2!11548 lt!386338))) lt!386345)))

(declare-fun lt!386340 () Unit!17985)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10786 array!13531 (_ BitVec 64)) Unit!17985)

(assert (=> b!247890 (= lt!386340 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11548 lt!386338) (buf!6419 (_2!11548 lt!386337)) lt!386345))))

(declare-fun lt!386343 () tuple2!21256)

(declare-fun lt!386352 () tuple2!21254)

(assert (=> b!247890 (= lt!386343 (checkBitsLoopPure!0 (_1!11549 lt!386352) nBits!297 bit!26 from!289))))

(assert (=> b!247890 (validate_offset_bits!1 ((_ sign_extend 32) (size!5932 (buf!6419 (_2!11548 lt!386337)))) ((_ sign_extend 32) (currentByte!11835 thiss!1005)) ((_ sign_extend 32) (currentBit!11830 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!386335 () Unit!17985)

(assert (=> b!247890 (= lt!386335 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6419 (_2!11548 lt!386337)) (bvsub nBits!297 from!289)))))

(declare-fun readBitPure!0 (BitStream!10786) tuple2!21256)

(assert (=> b!247890 (= (_2!11550 (readBitPure!0 (_1!11549 lt!386352))) bit!26)))

(declare-fun reader!0 (BitStream!10786 BitStream!10786) tuple2!21254)

(assert (=> b!247890 (= lt!386348 (reader!0 (_2!11548 lt!386338) (_2!11548 lt!386337)))))

(assert (=> b!247890 (= lt!386352 (reader!0 thiss!1005 (_2!11548 lt!386337)))))

(declare-fun e!171749 () Bool)

(assert (=> b!247890 e!171749))

(declare-fun res!207447 () Bool)

(assert (=> b!247890 (=> (not res!207447) (not e!171749))))

(declare-fun lt!386351 () tuple2!21256)

(declare-fun lt!386350 () tuple2!21256)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!247890 (= res!207447 (= (bitIndex!0 (size!5932 (buf!6419 (_1!11550 lt!386351))) (currentByte!11835 (_1!11550 lt!386351)) (currentBit!11830 (_1!11550 lt!386351))) (bitIndex!0 (size!5932 (buf!6419 (_1!11550 lt!386350))) (currentByte!11835 (_1!11550 lt!386350)) (currentBit!11830 (_1!11550 lt!386350)))))))

(declare-fun lt!386347 () Unit!17985)

(declare-fun lt!386339 () BitStream!10786)

(declare-fun readBitPrefixLemma!0 (BitStream!10786 BitStream!10786) Unit!17985)

(assert (=> b!247890 (= lt!386347 (readBitPrefixLemma!0 lt!386339 (_2!11548 lt!386337)))))

(assert (=> b!247890 (= lt!386350 (readBitPure!0 (BitStream!10787 (buf!6419 (_2!11548 lt!386337)) (currentByte!11835 thiss!1005) (currentBit!11830 thiss!1005))))))

(assert (=> b!247890 (= lt!386351 (readBitPure!0 lt!386339))))

(assert (=> b!247890 (= lt!386339 (BitStream!10787 (buf!6419 (_2!11548 lt!386338)) (currentByte!11835 thiss!1005) (currentBit!11830 thiss!1005)))))

(assert (=> b!247890 e!171748))

(declare-fun res!207458 () Bool)

(assert (=> b!247890 (=> (not res!207458) (not e!171748))))

(declare-fun isPrefixOf!0 (BitStream!10786 BitStream!10786) Bool)

(assert (=> b!247890 (= res!207458 (isPrefixOf!0 thiss!1005 (_2!11548 lt!386337)))))

(declare-fun lt!386354 () Unit!17985)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10786 BitStream!10786 BitStream!10786) Unit!17985)

(assert (=> b!247890 (= lt!386354 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11548 lt!386338) (_2!11548 lt!386337)))))

(declare-fun e!171744 () Bool)

(assert (=> b!247890 e!171744))

(declare-fun res!207448 () Bool)

(assert (=> b!247890 (=> (not res!207448) (not e!171744))))

(assert (=> b!247890 (= res!207448 (= (size!5932 (buf!6419 (_2!11548 lt!386338))) (size!5932 (buf!6419 (_2!11548 lt!386337)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10786 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21252)

(assert (=> b!247890 (= lt!386337 (appendNBitsLoop!0 (_2!11548 lt!386338) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!247890 (validate_offset_bits!1 ((_ sign_extend 32) (size!5932 (buf!6419 (_2!11548 lt!386338)))) ((_ sign_extend 32) (currentByte!11835 (_2!11548 lt!386338))) ((_ sign_extend 32) (currentBit!11830 (_2!11548 lt!386338))) lt!386345)))

(assert (=> b!247890 (= lt!386345 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!386355 () Unit!17985)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10786 BitStream!10786 (_ BitVec 64) (_ BitVec 64)) Unit!17985)

(assert (=> b!247890 (= lt!386355 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11548 lt!386338) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!171745 () Bool)

(assert (=> b!247890 e!171745))

(declare-fun res!207449 () Bool)

(assert (=> b!247890 (=> (not res!207449) (not e!171745))))

(assert (=> b!247890 (= res!207449 (= (size!5932 (buf!6419 thiss!1005)) (size!5932 (buf!6419 (_2!11548 lt!386338)))))))

(declare-fun appendBit!0 (BitStream!10786 Bool) tuple2!21252)

(assert (=> b!247890 (= lt!386338 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!247891 () Bool)

(declare-fun e!171747 () Bool)

(assert (=> b!247891 (= e!171745 e!171747)))

(declare-fun res!207456 () Bool)

(assert (=> b!247891 (=> (not res!207456) (not e!171747))))

(declare-fun lt!386342 () (_ BitVec 64))

(declare-fun lt!386353 () (_ BitVec 64))

(assert (=> b!247891 (= res!207456 (= lt!386342 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!386353)))))

(assert (=> b!247891 (= lt!386342 (bitIndex!0 (size!5932 (buf!6419 (_2!11548 lt!386338))) (currentByte!11835 (_2!11548 lt!386338)) (currentBit!11830 (_2!11548 lt!386338))))))

(assert (=> b!247891 (= lt!386353 (bitIndex!0 (size!5932 (buf!6419 thiss!1005)) (currentByte!11835 thiss!1005) (currentBit!11830 thiss!1005)))))

(declare-fun b!247892 () Bool)

(declare-fun e!171743 () Bool)

(assert (=> b!247892 (= e!171744 e!171743)))

(declare-fun res!207450 () Bool)

(assert (=> b!247892 (=> (not res!207450) (not e!171743))))

(declare-fun lt!386349 () (_ BitVec 64))

(assert (=> b!247892 (= res!207450 (= (bitIndex!0 (size!5932 (buf!6419 (_2!11548 lt!386337))) (currentByte!11835 (_2!11548 lt!386337)) (currentBit!11830 (_2!11548 lt!386337))) (bvadd (bitIndex!0 (size!5932 (buf!6419 (_2!11548 lt!386338))) (currentByte!11835 (_2!11548 lt!386338)) (currentBit!11830 (_2!11548 lt!386338))) lt!386349)))))

(assert (=> b!247892 (= lt!386349 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!247893 () Bool)

(assert (=> b!247893 (= e!171748 (invariant!0 (currentBit!11830 thiss!1005) (currentByte!11835 thiss!1005) (size!5932 (buf!6419 (_2!11548 lt!386337)))))))

(declare-fun b!247894 () Bool)

(assert (=> b!247894 (= e!171749 (= (_2!11550 lt!386351) (_2!11550 lt!386350)))))

(declare-fun res!207451 () Bool)

(assert (=> start!53406 (=> (not res!207451) (not e!171750))))

(assert (=> start!53406 (= res!207451 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53406 e!171750))

(assert (=> start!53406 true))

(declare-fun e!171752 () Bool)

(declare-fun inv!12 (BitStream!10786) Bool)

(assert (=> start!53406 (and (inv!12 thiss!1005) e!171752)))

(declare-fun b!247895 () Bool)

(declare-fun e!171751 () Bool)

(assert (=> b!247895 (= e!171747 e!171751)))

(declare-fun res!207453 () Bool)

(assert (=> b!247895 (=> (not res!207453) (not e!171751))))

(declare-fun lt!386346 () tuple2!21256)

(assert (=> b!247895 (= res!207453 (and (= (_2!11550 lt!386346) bit!26) (= (_1!11550 lt!386346) (_2!11548 lt!386338))))))

(declare-fun readerFrom!0 (BitStream!10786 (_ BitVec 32) (_ BitVec 32)) BitStream!10786)

(assert (=> b!247895 (= lt!386346 (readBitPure!0 (readerFrom!0 (_2!11548 lt!386338) (currentBit!11830 thiss!1005) (currentByte!11835 thiss!1005))))))

(declare-fun b!247896 () Bool)

(declare-fun res!207459 () Bool)

(assert (=> b!247896 (=> (not res!207459) (not e!171750))))

(assert (=> b!247896 (= res!207459 (bvslt from!289 nBits!297))))

(declare-fun b!247897 () Bool)

(declare-fun array_inv!5673 (array!13531) Bool)

(assert (=> b!247897 (= e!171752 (array_inv!5673 (buf!6419 thiss!1005)))))

(declare-fun b!247898 () Bool)

(declare-fun res!207455 () Bool)

(assert (=> b!247898 (=> (not res!207455) (not e!171747))))

(assert (=> b!247898 (= res!207455 (isPrefixOf!0 thiss!1005 (_2!11548 lt!386338)))))

(declare-fun b!247899 () Bool)

(declare-fun res!207454 () Bool)

(assert (=> b!247899 (=> (not res!207454) (not e!171743))))

(assert (=> b!247899 (= res!207454 (isPrefixOf!0 (_2!11548 lt!386338) (_2!11548 lt!386337)))))

(declare-fun b!247900 () Bool)

(assert (=> b!247900 (= e!171751 (= (bitIndex!0 (size!5932 (buf!6419 (_1!11550 lt!386346))) (currentByte!11835 (_1!11550 lt!386346)) (currentBit!11830 (_1!11550 lt!386346))) lt!386342))))

(declare-fun b!247901 () Bool)

(declare-fun lt!386341 () tuple2!21256)

(declare-fun lt!386336 () tuple2!21254)

(assert (=> b!247901 (= e!171743 (not (or (not (_2!11550 lt!386341)) (not (= (_1!11550 lt!386341) (_2!11549 lt!386336))))))))

(assert (=> b!247901 (= lt!386341 (checkBitsLoopPure!0 (_1!11549 lt!386336) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!247901 (validate_offset_bits!1 ((_ sign_extend 32) (size!5932 (buf!6419 (_2!11548 lt!386337)))) ((_ sign_extend 32) (currentByte!11835 (_2!11548 lt!386338))) ((_ sign_extend 32) (currentBit!11830 (_2!11548 lt!386338))) lt!386349)))

(declare-fun lt!386344 () Unit!17985)

(assert (=> b!247901 (= lt!386344 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11548 lt!386338) (buf!6419 (_2!11548 lt!386337)) lt!386349))))

(assert (=> b!247901 (= lt!386336 (reader!0 (_2!11548 lt!386338) (_2!11548 lt!386337)))))

(assert (= (and start!53406 res!207451) b!247888))

(assert (= (and b!247888 res!207457) b!247896))

(assert (= (and b!247896 res!207459) b!247890))

(assert (= (and b!247890 res!207449) b!247891))

(assert (= (and b!247891 res!207456) b!247898))

(assert (= (and b!247898 res!207455) b!247895))

(assert (= (and b!247895 res!207453) b!247900))

(assert (= (and b!247890 res!207448) b!247892))

(assert (= (and b!247892 res!207450) b!247899))

(assert (= (and b!247899 res!207454) b!247901))

(assert (= (and b!247890 res!207458) b!247889))

(assert (= (and b!247889 res!207452) b!247893))

(assert (= (and b!247890 res!207447) b!247894))

(assert (= start!53406 b!247897))

(declare-fun m!373539 () Bool)

(assert (=> b!247899 m!373539))

(declare-fun m!373541 () Bool)

(assert (=> b!247889 m!373541))

(declare-fun m!373543 () Bool)

(assert (=> b!247900 m!373543))

(declare-fun m!373545 () Bool)

(assert (=> b!247898 m!373545))

(declare-fun m!373547 () Bool)

(assert (=> b!247891 m!373547))

(declare-fun m!373549 () Bool)

(assert (=> b!247891 m!373549))

(declare-fun m!373551 () Bool)

(assert (=> b!247888 m!373551))

(declare-fun m!373553 () Bool)

(assert (=> b!247890 m!373553))

(declare-fun m!373555 () Bool)

(assert (=> b!247890 m!373555))

(declare-fun m!373557 () Bool)

(assert (=> b!247890 m!373557))

(declare-fun m!373559 () Bool)

(assert (=> b!247890 m!373559))

(declare-fun m!373561 () Bool)

(assert (=> b!247890 m!373561))

(declare-fun m!373563 () Bool)

(assert (=> b!247890 m!373563))

(declare-fun m!373565 () Bool)

(assert (=> b!247890 m!373565))

(declare-fun m!373567 () Bool)

(assert (=> b!247890 m!373567))

(declare-fun m!373569 () Bool)

(assert (=> b!247890 m!373569))

(declare-fun m!373571 () Bool)

(assert (=> b!247890 m!373571))

(declare-fun m!373573 () Bool)

(assert (=> b!247890 m!373573))

(declare-fun m!373575 () Bool)

(assert (=> b!247890 m!373575))

(declare-fun m!373577 () Bool)

(assert (=> b!247890 m!373577))

(declare-fun m!373579 () Bool)

(assert (=> b!247890 m!373579))

(declare-fun m!373581 () Bool)

(assert (=> b!247890 m!373581))

(declare-fun m!373583 () Bool)

(assert (=> b!247890 m!373583))

(declare-fun m!373585 () Bool)

(assert (=> b!247890 m!373585))

(declare-fun m!373587 () Bool)

(assert (=> b!247890 m!373587))

(declare-fun m!373589 () Bool)

(assert (=> b!247890 m!373589))

(declare-fun m!373591 () Bool)

(assert (=> b!247890 m!373591))

(declare-fun m!373593 () Bool)

(assert (=> b!247895 m!373593))

(assert (=> b!247895 m!373593))

(declare-fun m!373595 () Bool)

(assert (=> b!247895 m!373595))

(declare-fun m!373597 () Bool)

(assert (=> b!247893 m!373597))

(declare-fun m!373599 () Bool)

(assert (=> b!247901 m!373599))

(declare-fun m!373601 () Bool)

(assert (=> b!247901 m!373601))

(declare-fun m!373603 () Bool)

(assert (=> b!247901 m!373603))

(assert (=> b!247901 m!373585))

(declare-fun m!373605 () Bool)

(assert (=> start!53406 m!373605))

(declare-fun m!373607 () Bool)

(assert (=> b!247897 m!373607))

(declare-fun m!373609 () Bool)

(assert (=> b!247892 m!373609))

(assert (=> b!247892 m!373547))

(push 1)

(assert (not b!247889))

(assert (not b!247892))

(assert (not b!247900))

(assert (not start!53406))

(assert (not b!247901))

(assert (not b!247899))

(assert (not b!247898))

(assert (not b!247895))

(assert (not b!247888))

(assert (not b!247890))

(assert (not b!247893))

(assert (not b!247897))

(assert (not b!247891))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

