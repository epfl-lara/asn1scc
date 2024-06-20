; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53732 () Bool)

(assert start!53732)

(declare-fun b!250117 () Bool)

(declare-fun e!173361 () Bool)

(declare-datatypes ((array!13641 0))(
  ( (array!13642 (arr!6971 (Array (_ BitVec 32) (_ BitVec 8))) (size!5984 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10890 0))(
  ( (BitStream!10891 (buf!6477 array!13641) (currentByte!11908 (_ BitVec 32)) (currentBit!11903 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10890)

(declare-fun array_inv!5725 (array!13641) Bool)

(assert (=> b!250117 (= e!173361 (array_inv!5725 (buf!6477 thiss!1005)))))

(declare-fun b!250118 () Bool)

(declare-fun e!173364 () Bool)

(declare-datatypes ((tuple2!21456 0))(
  ( (tuple2!21457 (_1!11653 BitStream!10890) (_2!11653 Bool)) )
))
(declare-fun lt!388697 () tuple2!21456)

(declare-datatypes ((tuple2!21458 0))(
  ( (tuple2!21459 (_1!11654 BitStream!10890) (_2!11654 BitStream!10890)) )
))
(declare-fun lt!388694 () tuple2!21458)

(assert (=> b!250118 (= e!173364 (not (or (not (_2!11653 lt!388697)) (not (= (_1!11653 lt!388697) (_2!11654 lt!388694))))))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun bit!26 () Bool)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!10890 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21456)

(assert (=> b!250118 (= lt!388697 (checkBitsLoopPure!0 (_1!11654 lt!388694) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-datatypes ((Unit!18104 0))(
  ( (Unit!18105) )
))
(declare-datatypes ((tuple2!21460 0))(
  ( (tuple2!21461 (_1!11655 Unit!18104) (_2!11655 BitStream!10890)) )
))
(declare-fun lt!388700 () tuple2!21460)

(declare-fun lt!388702 () tuple2!21460)

(declare-fun lt!388698 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!250118 (validate_offset_bits!1 ((_ sign_extend 32) (size!5984 (buf!6477 (_2!11655 lt!388700)))) ((_ sign_extend 32) (currentByte!11908 (_2!11655 lt!388702))) ((_ sign_extend 32) (currentBit!11903 (_2!11655 lt!388702))) lt!388698)))

(declare-fun lt!388699 () Unit!18104)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10890 array!13641 (_ BitVec 64)) Unit!18104)

(assert (=> b!250118 (= lt!388699 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11655 lt!388702) (buf!6477 (_2!11655 lt!388700)) lt!388698))))

(declare-fun reader!0 (BitStream!10890 BitStream!10890) tuple2!21458)

(assert (=> b!250118 (= lt!388694 (reader!0 (_2!11655 lt!388702) (_2!11655 lt!388700)))))

(declare-fun b!250119 () Bool)

(declare-fun res!209366 () Bool)

(assert (=> b!250119 (=> (not res!209366) (not e!173364))))

(declare-fun isPrefixOf!0 (BitStream!10890 BitStream!10890) Bool)

(assert (=> b!250119 (= res!209366 (isPrefixOf!0 (_2!11655 lt!388702) (_2!11655 lt!388700)))))

(declare-fun b!250120 () Bool)

(declare-fun res!209367 () Bool)

(declare-fun e!173360 () Bool)

(assert (=> b!250120 (=> (not res!209367) (not e!173360))))

(assert (=> b!250120 (= res!209367 (validate_offset_bits!1 ((_ sign_extend 32) (size!5984 (buf!6477 thiss!1005))) ((_ sign_extend 32) (currentByte!11908 thiss!1005)) ((_ sign_extend 32) (currentBit!11903 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!250121 () Bool)

(assert (=> b!250121 (= e!173360 (not true))))

(assert (=> b!250121 (isPrefixOf!0 thiss!1005 (_2!11655 lt!388700))))

(declare-fun lt!388695 () Unit!18104)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10890 BitStream!10890 BitStream!10890) Unit!18104)

(assert (=> b!250121 (= lt!388695 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11655 lt!388702) (_2!11655 lt!388700)))))

(declare-fun e!173359 () Bool)

(assert (=> b!250121 e!173359))

(declare-fun res!209371 () Bool)

(assert (=> b!250121 (=> (not res!209371) (not e!173359))))

(assert (=> b!250121 (= res!209371 (= (size!5984 (buf!6477 (_2!11655 lt!388702))) (size!5984 (buf!6477 (_2!11655 lt!388700)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10890 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21460)

(assert (=> b!250121 (= lt!388700 (appendNBitsLoop!0 (_2!11655 lt!388702) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!250121 (validate_offset_bits!1 ((_ sign_extend 32) (size!5984 (buf!6477 (_2!11655 lt!388702)))) ((_ sign_extend 32) (currentByte!11908 (_2!11655 lt!388702))) ((_ sign_extend 32) (currentBit!11903 (_2!11655 lt!388702))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!388696 () Unit!18104)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10890 BitStream!10890 (_ BitVec 64) (_ BitVec 64)) Unit!18104)

(assert (=> b!250121 (= lt!388696 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11655 lt!388702) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!173365 () Bool)

(assert (=> b!250121 e!173365))

(declare-fun res!209368 () Bool)

(assert (=> b!250121 (=> (not res!209368) (not e!173365))))

(assert (=> b!250121 (= res!209368 (= (size!5984 (buf!6477 thiss!1005)) (size!5984 (buf!6477 (_2!11655 lt!388702)))))))

(declare-fun appendBit!0 (BitStream!10890 Bool) tuple2!21460)

(assert (=> b!250121 (= lt!388702 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!250122 () Bool)

(declare-fun res!209369 () Bool)

(assert (=> b!250122 (=> (not res!209369) (not e!173360))))

(assert (=> b!250122 (= res!209369 (bvslt from!289 nBits!297))))

(declare-fun res!209372 () Bool)

(assert (=> start!53732 (=> (not res!209372) (not e!173360))))

(assert (=> start!53732 (= res!209372 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53732 e!173360))

(assert (=> start!53732 true))

(declare-fun inv!12 (BitStream!10890) Bool)

(assert (=> start!53732 (and (inv!12 thiss!1005) e!173361)))

(declare-fun b!250123 () Bool)

(declare-fun e!173363 () Bool)

(declare-fun e!173362 () Bool)

(assert (=> b!250123 (= e!173363 e!173362)))

(declare-fun res!209370 () Bool)

(assert (=> b!250123 (=> (not res!209370) (not e!173362))))

(declare-fun lt!388701 () tuple2!21456)

(assert (=> b!250123 (= res!209370 (and (= (_2!11653 lt!388701) bit!26) (= (_1!11653 lt!388701) (_2!11655 lt!388702))))))

(declare-fun readBitPure!0 (BitStream!10890) tuple2!21456)

(declare-fun readerFrom!0 (BitStream!10890 (_ BitVec 32) (_ BitVec 32)) BitStream!10890)

(assert (=> b!250123 (= lt!388701 (readBitPure!0 (readerFrom!0 (_2!11655 lt!388702) (currentBit!11903 thiss!1005) (currentByte!11908 thiss!1005))))))

(declare-fun b!250124 () Bool)

(assert (=> b!250124 (= e!173359 e!173364)))

(declare-fun res!209364 () Bool)

(assert (=> b!250124 (=> (not res!209364) (not e!173364))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!250124 (= res!209364 (= (bitIndex!0 (size!5984 (buf!6477 (_2!11655 lt!388700))) (currentByte!11908 (_2!11655 lt!388700)) (currentBit!11903 (_2!11655 lt!388700))) (bvadd (bitIndex!0 (size!5984 (buf!6477 (_2!11655 lt!388702))) (currentByte!11908 (_2!11655 lt!388702)) (currentBit!11903 (_2!11655 lt!388702))) lt!388698)))))

(assert (=> b!250124 (= lt!388698 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!250125 () Bool)

(declare-fun lt!388704 () (_ BitVec 64))

(assert (=> b!250125 (= e!173362 (= (bitIndex!0 (size!5984 (buf!6477 (_1!11653 lt!388701))) (currentByte!11908 (_1!11653 lt!388701)) (currentBit!11903 (_1!11653 lt!388701))) lt!388704))))

(declare-fun b!250126 () Bool)

(declare-fun res!209373 () Bool)

(assert (=> b!250126 (=> (not res!209373) (not e!173363))))

(assert (=> b!250126 (= res!209373 (isPrefixOf!0 thiss!1005 (_2!11655 lt!388702)))))

(declare-fun b!250127 () Bool)

(assert (=> b!250127 (= e!173365 e!173363)))

(declare-fun res!209365 () Bool)

(assert (=> b!250127 (=> (not res!209365) (not e!173363))))

(declare-fun lt!388703 () (_ BitVec 64))

(assert (=> b!250127 (= res!209365 (= lt!388704 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!388703)))))

(assert (=> b!250127 (= lt!388704 (bitIndex!0 (size!5984 (buf!6477 (_2!11655 lt!388702))) (currentByte!11908 (_2!11655 lt!388702)) (currentBit!11903 (_2!11655 lt!388702))))))

(assert (=> b!250127 (= lt!388703 (bitIndex!0 (size!5984 (buf!6477 thiss!1005)) (currentByte!11908 thiss!1005) (currentBit!11903 thiss!1005)))))

(assert (= (and start!53732 res!209372) b!250120))

(assert (= (and b!250120 res!209367) b!250122))

(assert (= (and b!250122 res!209369) b!250121))

(assert (= (and b!250121 res!209368) b!250127))

(assert (= (and b!250127 res!209365) b!250126))

(assert (= (and b!250126 res!209373) b!250123))

(assert (= (and b!250123 res!209370) b!250125))

(assert (= (and b!250121 res!209371) b!250124))

(assert (= (and b!250124 res!209364) b!250119))

(assert (= (and b!250119 res!209366) b!250118))

(assert (= start!53732 b!250117))

(declare-fun m!376527 () Bool)

(assert (=> b!250125 m!376527))

(declare-fun m!376529 () Bool)

(assert (=> b!250127 m!376529))

(declare-fun m!376531 () Bool)

(assert (=> b!250127 m!376531))

(declare-fun m!376533 () Bool)

(assert (=> b!250119 m!376533))

(declare-fun m!376535 () Bool)

(assert (=> b!250123 m!376535))

(assert (=> b!250123 m!376535))

(declare-fun m!376537 () Bool)

(assert (=> b!250123 m!376537))

(declare-fun m!376539 () Bool)

(assert (=> b!250121 m!376539))

(declare-fun m!376541 () Bool)

(assert (=> b!250121 m!376541))

(declare-fun m!376543 () Bool)

(assert (=> b!250121 m!376543))

(declare-fun m!376545 () Bool)

(assert (=> b!250121 m!376545))

(declare-fun m!376547 () Bool)

(assert (=> b!250121 m!376547))

(declare-fun m!376549 () Bool)

(assert (=> b!250121 m!376549))

(declare-fun m!376551 () Bool)

(assert (=> b!250126 m!376551))

(declare-fun m!376553 () Bool)

(assert (=> b!250118 m!376553))

(declare-fun m!376555 () Bool)

(assert (=> b!250118 m!376555))

(declare-fun m!376557 () Bool)

(assert (=> b!250118 m!376557))

(declare-fun m!376559 () Bool)

(assert (=> b!250118 m!376559))

(declare-fun m!376561 () Bool)

(assert (=> start!53732 m!376561))

(declare-fun m!376563 () Bool)

(assert (=> b!250124 m!376563))

(assert (=> b!250124 m!376529))

(declare-fun m!376565 () Bool)

(assert (=> b!250117 m!376565))

(declare-fun m!376567 () Bool)

(assert (=> b!250120 m!376567))

(check-sat (not b!250120) (not b!250123) (not b!250118) (not b!250117) (not b!250124) (not b!250119) (not b!250125) (not b!250126) (not start!53732) (not b!250121) (not b!250127))
