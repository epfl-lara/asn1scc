; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54062 () Bool)

(assert start!54062)

(declare-fun b!251578 () Bool)

(declare-fun e!174319 () Bool)

(declare-datatypes ((array!13686 0))(
  ( (array!13687 (arr!6989 (Array (_ BitVec 32) (_ BitVec 8))) (size!6002 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10926 0))(
  ( (BitStream!10927 (buf!6504 array!13686) (currentByte!11959 (_ BitVec 32)) (currentBit!11954 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!21582 0))(
  ( (tuple2!21583 (_1!11719 BitStream!10926) (_2!11719 Bool)) )
))
(declare-fun lt!390939 () tuple2!21582)

(declare-fun lt!390938 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!251578 (= e!174319 (= (bitIndex!0 (size!6002 (buf!6504 (_1!11719 lt!390939))) (currentByte!11959 (_1!11719 lt!390939)) (currentBit!11954 (_1!11719 lt!390939))) lt!390938))))

(declare-fun b!251579 () Bool)

(declare-fun res!210704 () Bool)

(declare-fun e!174315 () Bool)

(assert (=> b!251579 (=> (not res!210704) (not e!174315))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun thiss!1005 () BitStream!10926)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!251579 (= res!210704 (validate_offset_bits!1 ((_ sign_extend 32) (size!6002 (buf!6504 thiss!1005))) ((_ sign_extend 32) (currentByte!11959 thiss!1005)) ((_ sign_extend 32) (currentBit!11954 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!251580 () Bool)

(declare-datatypes ((Unit!18152 0))(
  ( (Unit!18153) )
))
(declare-datatypes ((tuple2!21584 0))(
  ( (tuple2!21585 (_1!11720 Unit!18152) (_2!11720 BitStream!10926)) )
))
(declare-fun lt!390935 () tuple2!21584)

(assert (=> b!251580 (= e!174315 (not (= (size!6002 (buf!6504 thiss!1005)) (size!6002 (buf!6504 (_2!11720 lt!390935))))))))

(declare-datatypes ((tuple2!21586 0))(
  ( (tuple2!21587 (_1!11721 BitStream!10926) (_2!11721 BitStream!10926)) )
))
(declare-fun lt!390948 () tuple2!21586)

(declare-fun bit!26 () Bool)

(declare-fun readBitPure!0 (BitStream!10926) tuple2!21582)

(assert (=> b!251580 (= (_2!11719 (readBitPure!0 (_1!11721 lt!390948))) bit!26)))

(declare-fun lt!390943 () tuple2!21586)

(declare-fun lt!390942 () tuple2!21584)

(declare-fun reader!0 (BitStream!10926 BitStream!10926) tuple2!21586)

(assert (=> b!251580 (= lt!390943 (reader!0 (_2!11720 lt!390942) (_2!11720 lt!390935)))))

(assert (=> b!251580 (= lt!390948 (reader!0 thiss!1005 (_2!11720 lt!390935)))))

(declare-fun e!174317 () Bool)

(assert (=> b!251580 e!174317))

(declare-fun res!210697 () Bool)

(assert (=> b!251580 (=> (not res!210697) (not e!174317))))

(declare-fun lt!390940 () tuple2!21582)

(declare-fun lt!390950 () tuple2!21582)

(assert (=> b!251580 (= res!210697 (= (bitIndex!0 (size!6002 (buf!6504 (_1!11719 lt!390940))) (currentByte!11959 (_1!11719 lt!390940)) (currentBit!11954 (_1!11719 lt!390940))) (bitIndex!0 (size!6002 (buf!6504 (_1!11719 lt!390950))) (currentByte!11959 (_1!11719 lt!390950)) (currentBit!11954 (_1!11719 lt!390950)))))))

(declare-fun lt!390947 () Unit!18152)

(declare-fun lt!390944 () BitStream!10926)

(declare-fun readBitPrefixLemma!0 (BitStream!10926 BitStream!10926) Unit!18152)

(assert (=> b!251580 (= lt!390947 (readBitPrefixLemma!0 lt!390944 (_2!11720 lt!390935)))))

(assert (=> b!251580 (= lt!390950 (readBitPure!0 (BitStream!10927 (buf!6504 (_2!11720 lt!390935)) (currentByte!11959 thiss!1005) (currentBit!11954 thiss!1005))))))

(assert (=> b!251580 (= lt!390940 (readBitPure!0 lt!390944))))

(assert (=> b!251580 (= lt!390944 (BitStream!10927 (buf!6504 (_2!11720 lt!390942)) (currentByte!11959 thiss!1005) (currentBit!11954 thiss!1005)))))

(declare-fun e!174316 () Bool)

(assert (=> b!251580 e!174316))

(declare-fun res!210703 () Bool)

(assert (=> b!251580 (=> (not res!210703) (not e!174316))))

(declare-fun isPrefixOf!0 (BitStream!10926 BitStream!10926) Bool)

(assert (=> b!251580 (= res!210703 (isPrefixOf!0 thiss!1005 (_2!11720 lt!390935)))))

(declare-fun lt!390946 () Unit!18152)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10926 BitStream!10926 BitStream!10926) Unit!18152)

(assert (=> b!251580 (= lt!390946 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11720 lt!390942) (_2!11720 lt!390935)))))

(declare-fun e!174318 () Bool)

(assert (=> b!251580 e!174318))

(declare-fun res!210701 () Bool)

(assert (=> b!251580 (=> (not res!210701) (not e!174318))))

(assert (=> b!251580 (= res!210701 (= (size!6002 (buf!6504 (_2!11720 lt!390942))) (size!6002 (buf!6504 (_2!11720 lt!390935)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10926 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21584)

(assert (=> b!251580 (= lt!390935 (appendNBitsLoop!0 (_2!11720 lt!390942) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!251580 (validate_offset_bits!1 ((_ sign_extend 32) (size!6002 (buf!6504 (_2!11720 lt!390942)))) ((_ sign_extend 32) (currentByte!11959 (_2!11720 lt!390942))) ((_ sign_extend 32) (currentBit!11954 (_2!11720 lt!390942))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!390937 () Unit!18152)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10926 BitStream!10926 (_ BitVec 64) (_ BitVec 64)) Unit!18152)

(assert (=> b!251580 (= lt!390937 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11720 lt!390942) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!174312 () Bool)

(assert (=> b!251580 e!174312))

(declare-fun res!210700 () Bool)

(assert (=> b!251580 (=> (not res!210700) (not e!174312))))

(assert (=> b!251580 (= res!210700 (= (size!6002 (buf!6504 thiss!1005)) (size!6002 (buf!6504 (_2!11720 lt!390942)))))))

(declare-fun appendBit!0 (BitStream!10926 Bool) tuple2!21584)

(assert (=> b!251580 (= lt!390942 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!251581 () Bool)

(declare-fun res!210702 () Bool)

(declare-fun e!174320 () Bool)

(assert (=> b!251581 (=> (not res!210702) (not e!174320))))

(assert (=> b!251581 (= res!210702 (isPrefixOf!0 thiss!1005 (_2!11720 lt!390942)))))

(declare-fun b!251582 () Bool)

(declare-fun res!210699 () Bool)

(assert (=> b!251582 (=> (not res!210699) (not e!174315))))

(assert (=> b!251582 (= res!210699 (bvslt from!289 nBits!297))))

(declare-fun b!251583 () Bool)

(declare-fun e!174311 () Bool)

(declare-fun array_inv!5743 (array!13686) Bool)

(assert (=> b!251583 (= e!174311 (array_inv!5743 (buf!6504 thiss!1005)))))

(declare-fun b!251584 () Bool)

(declare-fun res!210705 () Bool)

(assert (=> b!251584 (=> (not res!210705) (not e!174316))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!251584 (= res!210705 (invariant!0 (currentBit!11954 thiss!1005) (currentByte!11959 thiss!1005) (size!6002 (buf!6504 (_2!11720 lt!390942)))))))

(declare-fun b!251585 () Bool)

(assert (=> b!251585 (= e!174317 (= (_2!11719 lt!390940) (_2!11719 lt!390950)))))

(declare-fun b!251586 () Bool)

(declare-fun e!174313 () Bool)

(declare-fun lt!390941 () tuple2!21582)

(declare-fun lt!390936 () tuple2!21586)

(assert (=> b!251586 (= e!174313 (not (or (not (_2!11719 lt!390941)) (not (= (_1!11719 lt!390941) (_2!11721 lt!390936))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10926 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21582)

(assert (=> b!251586 (= lt!390941 (checkBitsLoopPure!0 (_1!11721 lt!390936) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!390945 () (_ BitVec 64))

(assert (=> b!251586 (validate_offset_bits!1 ((_ sign_extend 32) (size!6002 (buf!6504 (_2!11720 lt!390935)))) ((_ sign_extend 32) (currentByte!11959 (_2!11720 lt!390942))) ((_ sign_extend 32) (currentBit!11954 (_2!11720 lt!390942))) lt!390945)))

(declare-fun lt!390951 () Unit!18152)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10926 array!13686 (_ BitVec 64)) Unit!18152)

(assert (=> b!251586 (= lt!390951 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11720 lt!390942) (buf!6504 (_2!11720 lt!390935)) lt!390945))))

(assert (=> b!251586 (= lt!390936 (reader!0 (_2!11720 lt!390942) (_2!11720 lt!390935)))))

(declare-fun res!210695 () Bool)

(assert (=> start!54062 (=> (not res!210695) (not e!174315))))

(assert (=> start!54062 (= res!210695 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54062 e!174315))

(assert (=> start!54062 true))

(declare-fun inv!12 (BitStream!10926) Bool)

(assert (=> start!54062 (and (inv!12 thiss!1005) e!174311)))

(declare-fun b!251587 () Bool)

(assert (=> b!251587 (= e!174318 e!174313)))

(declare-fun res!210698 () Bool)

(assert (=> b!251587 (=> (not res!210698) (not e!174313))))

(assert (=> b!251587 (= res!210698 (= (bitIndex!0 (size!6002 (buf!6504 (_2!11720 lt!390935))) (currentByte!11959 (_2!11720 lt!390935)) (currentBit!11954 (_2!11720 lt!390935))) (bvadd (bitIndex!0 (size!6002 (buf!6504 (_2!11720 lt!390942))) (currentByte!11959 (_2!11720 lt!390942)) (currentBit!11954 (_2!11720 lt!390942))) lt!390945)))))

(assert (=> b!251587 (= lt!390945 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!251588 () Bool)

(assert (=> b!251588 (= e!174320 e!174319)))

(declare-fun res!210694 () Bool)

(assert (=> b!251588 (=> (not res!210694) (not e!174319))))

(assert (=> b!251588 (= res!210694 (and (= (_2!11719 lt!390939) bit!26) (= (_1!11719 lt!390939) (_2!11720 lt!390942))))))

(declare-fun readerFrom!0 (BitStream!10926 (_ BitVec 32) (_ BitVec 32)) BitStream!10926)

(assert (=> b!251588 (= lt!390939 (readBitPure!0 (readerFrom!0 (_2!11720 lt!390942) (currentBit!11954 thiss!1005) (currentByte!11959 thiss!1005))))))

(declare-fun b!251589 () Bool)

(assert (=> b!251589 (= e!174316 (invariant!0 (currentBit!11954 thiss!1005) (currentByte!11959 thiss!1005) (size!6002 (buf!6504 (_2!11720 lt!390935)))))))

(declare-fun b!251590 () Bool)

(declare-fun res!210693 () Bool)

(assert (=> b!251590 (=> (not res!210693) (not e!174313))))

(assert (=> b!251590 (= res!210693 (isPrefixOf!0 (_2!11720 lt!390942) (_2!11720 lt!390935)))))

(declare-fun b!251591 () Bool)

(assert (=> b!251591 (= e!174312 e!174320)))

(declare-fun res!210696 () Bool)

(assert (=> b!251591 (=> (not res!210696) (not e!174320))))

(declare-fun lt!390949 () (_ BitVec 64))

(assert (=> b!251591 (= res!210696 (= lt!390938 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!390949)))))

(assert (=> b!251591 (= lt!390938 (bitIndex!0 (size!6002 (buf!6504 (_2!11720 lt!390942))) (currentByte!11959 (_2!11720 lt!390942)) (currentBit!11954 (_2!11720 lt!390942))))))

(assert (=> b!251591 (= lt!390949 (bitIndex!0 (size!6002 (buf!6504 thiss!1005)) (currentByte!11959 thiss!1005) (currentBit!11954 thiss!1005)))))

(assert (= (and start!54062 res!210695) b!251579))

(assert (= (and b!251579 res!210704) b!251582))

(assert (= (and b!251582 res!210699) b!251580))

(assert (= (and b!251580 res!210700) b!251591))

(assert (= (and b!251591 res!210696) b!251581))

(assert (= (and b!251581 res!210702) b!251588))

(assert (= (and b!251588 res!210694) b!251578))

(assert (= (and b!251580 res!210701) b!251587))

(assert (= (and b!251587 res!210698) b!251590))

(assert (= (and b!251590 res!210693) b!251586))

(assert (= (and b!251580 res!210703) b!251584))

(assert (= (and b!251584 res!210705) b!251589))

(assert (= (and b!251580 res!210697) b!251585))

(assert (= start!54062 b!251583))

(declare-fun m!378507 () Bool)

(assert (=> b!251583 m!378507))

(declare-fun m!378509 () Bool)

(assert (=> b!251584 m!378509))

(declare-fun m!378511 () Bool)

(assert (=> b!251590 m!378511))

(declare-fun m!378513 () Bool)

(assert (=> b!251591 m!378513))

(declare-fun m!378515 () Bool)

(assert (=> b!251591 m!378515))

(declare-fun m!378517 () Bool)

(assert (=> b!251580 m!378517))

(declare-fun m!378519 () Bool)

(assert (=> b!251580 m!378519))

(declare-fun m!378521 () Bool)

(assert (=> b!251580 m!378521))

(declare-fun m!378523 () Bool)

(assert (=> b!251580 m!378523))

(declare-fun m!378525 () Bool)

(assert (=> b!251580 m!378525))

(declare-fun m!378527 () Bool)

(assert (=> b!251580 m!378527))

(declare-fun m!378529 () Bool)

(assert (=> b!251580 m!378529))

(declare-fun m!378531 () Bool)

(assert (=> b!251580 m!378531))

(declare-fun m!378533 () Bool)

(assert (=> b!251580 m!378533))

(declare-fun m!378535 () Bool)

(assert (=> b!251580 m!378535))

(declare-fun m!378537 () Bool)

(assert (=> b!251580 m!378537))

(declare-fun m!378539 () Bool)

(assert (=> b!251580 m!378539))

(declare-fun m!378541 () Bool)

(assert (=> b!251580 m!378541))

(declare-fun m!378543 () Bool)

(assert (=> b!251580 m!378543))

(declare-fun m!378545 () Bool)

(assert (=> b!251578 m!378545))

(declare-fun m!378547 () Bool)

(assert (=> b!251586 m!378547))

(declare-fun m!378549 () Bool)

(assert (=> b!251586 m!378549))

(declare-fun m!378551 () Bool)

(assert (=> b!251586 m!378551))

(assert (=> b!251586 m!378533))

(declare-fun m!378553 () Bool)

(assert (=> start!54062 m!378553))

(declare-fun m!378555 () Bool)

(assert (=> b!251587 m!378555))

(assert (=> b!251587 m!378513))

(declare-fun m!378557 () Bool)

(assert (=> b!251579 m!378557))

(declare-fun m!378559 () Bool)

(assert (=> b!251588 m!378559))

(assert (=> b!251588 m!378559))

(declare-fun m!378561 () Bool)

(assert (=> b!251588 m!378561))

(declare-fun m!378563 () Bool)

(assert (=> b!251581 m!378563))

(declare-fun m!378565 () Bool)

(assert (=> b!251589 m!378565))

(check-sat (not b!251581) (not start!54062) (not b!251583) (not b!251589) (not b!251579) (not b!251586) (not b!251580) (not b!251590) (not b!251578) (not b!251587) (not b!251591) (not b!251588) (not b!251584))
