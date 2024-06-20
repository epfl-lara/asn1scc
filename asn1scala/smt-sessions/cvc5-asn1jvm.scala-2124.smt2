; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53730 () Bool)

(assert start!53730)

(declare-fun b!250084 () Bool)

(declare-fun res!209342 () Bool)

(declare-fun e!173342 () Bool)

(assert (=> b!250084 (=> (not res!209342) (not e!173342))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!250084 (= res!209342 (bvslt from!289 nBits!297))))

(declare-fun b!250085 () Bool)

(declare-fun e!173341 () Bool)

(declare-datatypes ((array!13639 0))(
  ( (array!13640 (arr!6970 (Array (_ BitVec 32) (_ BitVec 8))) (size!5983 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10888 0))(
  ( (BitStream!10889 (buf!6476 array!13639) (currentByte!11907 (_ BitVec 32)) (currentBit!11902 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!21450 0))(
  ( (tuple2!21451 (_1!11650 BitStream!10888) (_2!11650 Bool)) )
))
(declare-fun lt!388664 () tuple2!21450)

(declare-fun lt!388665 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!250085 (= e!173341 (= (bitIndex!0 (size!5983 (buf!6476 (_1!11650 lt!388664))) (currentByte!11907 (_1!11650 lt!388664)) (currentBit!11902 (_1!11650 lt!388664))) lt!388665))))

(declare-fun b!250086 () Bool)

(declare-fun e!173340 () Bool)

(assert (=> b!250086 (= e!173340 e!173341)))

(declare-fun res!209338 () Bool)

(assert (=> b!250086 (=> (not res!209338) (not e!173341))))

(declare-fun bit!26 () Bool)

(declare-datatypes ((Unit!18102 0))(
  ( (Unit!18103) )
))
(declare-datatypes ((tuple2!21452 0))(
  ( (tuple2!21453 (_1!11651 Unit!18102) (_2!11651 BitStream!10888)) )
))
(declare-fun lt!388663 () tuple2!21452)

(assert (=> b!250086 (= res!209338 (and (= (_2!11650 lt!388664) bit!26) (= (_1!11650 lt!388664) (_2!11651 lt!388663))))))

(declare-fun thiss!1005 () BitStream!10888)

(declare-fun readBitPure!0 (BitStream!10888) tuple2!21450)

(declare-fun readerFrom!0 (BitStream!10888 (_ BitVec 32) (_ BitVec 32)) BitStream!10888)

(assert (=> b!250086 (= lt!388664 (readBitPure!0 (readerFrom!0 (_2!11651 lt!388663) (currentBit!11902 thiss!1005) (currentByte!11907 thiss!1005))))))

(declare-fun b!250087 () Bool)

(declare-fun res!209343 () Bool)

(assert (=> b!250087 (=> (not res!209343) (not e!173340))))

(declare-fun isPrefixOf!0 (BitStream!10888 BitStream!10888) Bool)

(assert (=> b!250087 (= res!209343 (isPrefixOf!0 thiss!1005 (_2!11651 lt!388663)))))

(declare-fun res!209335 () Bool)

(assert (=> start!53730 (=> (not res!209335) (not e!173342))))

(assert (=> start!53730 (= res!209335 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53730 e!173342))

(assert (=> start!53730 true))

(declare-fun e!173338 () Bool)

(declare-fun inv!12 (BitStream!10888) Bool)

(assert (=> start!53730 (and (inv!12 thiss!1005) e!173338)))

(declare-fun b!250088 () Bool)

(declare-fun e!173339 () Bool)

(declare-fun e!173335 () Bool)

(assert (=> b!250088 (= e!173339 e!173335)))

(declare-fun res!209341 () Bool)

(assert (=> b!250088 (=> (not res!209341) (not e!173335))))

(declare-fun lt!388666 () (_ BitVec 64))

(declare-fun lt!388661 () tuple2!21452)

(assert (=> b!250088 (= res!209341 (= (bitIndex!0 (size!5983 (buf!6476 (_2!11651 lt!388661))) (currentByte!11907 (_2!11651 lt!388661)) (currentBit!11902 (_2!11651 lt!388661))) (bvadd (bitIndex!0 (size!5983 (buf!6476 (_2!11651 lt!388663))) (currentByte!11907 (_2!11651 lt!388663)) (currentBit!11902 (_2!11651 lt!388663))) lt!388666)))))

(assert (=> b!250088 (= lt!388666 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!250089 () Bool)

(assert (=> b!250089 (= e!173342 (not true))))

(assert (=> b!250089 (isPrefixOf!0 thiss!1005 (_2!11651 lt!388661))))

(declare-fun lt!388669 () Unit!18102)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10888 BitStream!10888 BitStream!10888) Unit!18102)

(assert (=> b!250089 (= lt!388669 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11651 lt!388663) (_2!11651 lt!388661)))))

(assert (=> b!250089 e!173339))

(declare-fun res!209337 () Bool)

(assert (=> b!250089 (=> (not res!209337) (not e!173339))))

(assert (=> b!250089 (= res!209337 (= (size!5983 (buf!6476 (_2!11651 lt!388663))) (size!5983 (buf!6476 (_2!11651 lt!388661)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10888 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21452)

(assert (=> b!250089 (= lt!388661 (appendNBitsLoop!0 (_2!11651 lt!388663) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!250089 (validate_offset_bits!1 ((_ sign_extend 32) (size!5983 (buf!6476 (_2!11651 lt!388663)))) ((_ sign_extend 32) (currentByte!11907 (_2!11651 lt!388663))) ((_ sign_extend 32) (currentBit!11902 (_2!11651 lt!388663))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!388667 () Unit!18102)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10888 BitStream!10888 (_ BitVec 64) (_ BitVec 64)) Unit!18102)

(assert (=> b!250089 (= lt!388667 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11651 lt!388663) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!173337 () Bool)

(assert (=> b!250089 e!173337))

(declare-fun res!209339 () Bool)

(assert (=> b!250089 (=> (not res!209339) (not e!173337))))

(assert (=> b!250089 (= res!209339 (= (size!5983 (buf!6476 thiss!1005)) (size!5983 (buf!6476 (_2!11651 lt!388663)))))))

(declare-fun appendBit!0 (BitStream!10888 Bool) tuple2!21452)

(assert (=> b!250089 (= lt!388663 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!250090 () Bool)

(declare-fun res!209336 () Bool)

(assert (=> b!250090 (=> (not res!209336) (not e!173335))))

(assert (=> b!250090 (= res!209336 (isPrefixOf!0 (_2!11651 lt!388663) (_2!11651 lt!388661)))))

(declare-fun b!250091 () Bool)

(assert (=> b!250091 (= e!173337 e!173340)))

(declare-fun res!209334 () Bool)

(assert (=> b!250091 (=> (not res!209334) (not e!173340))))

(declare-fun lt!388670 () (_ BitVec 64))

(assert (=> b!250091 (= res!209334 (= lt!388665 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!388670)))))

(assert (=> b!250091 (= lt!388665 (bitIndex!0 (size!5983 (buf!6476 (_2!11651 lt!388663))) (currentByte!11907 (_2!11651 lt!388663)) (currentBit!11902 (_2!11651 lt!388663))))))

(assert (=> b!250091 (= lt!388670 (bitIndex!0 (size!5983 (buf!6476 thiss!1005)) (currentByte!11907 thiss!1005) (currentBit!11902 thiss!1005)))))

(declare-fun b!250092 () Bool)

(declare-fun array_inv!5724 (array!13639) Bool)

(assert (=> b!250092 (= e!173338 (array_inv!5724 (buf!6476 thiss!1005)))))

(declare-fun b!250093 () Bool)

(declare-fun res!209340 () Bool)

(assert (=> b!250093 (=> (not res!209340) (not e!173342))))

(assert (=> b!250093 (= res!209340 (validate_offset_bits!1 ((_ sign_extend 32) (size!5983 (buf!6476 thiss!1005))) ((_ sign_extend 32) (currentByte!11907 thiss!1005)) ((_ sign_extend 32) (currentBit!11902 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!250094 () Bool)

(declare-fun lt!388668 () tuple2!21450)

(declare-datatypes ((tuple2!21454 0))(
  ( (tuple2!21455 (_1!11652 BitStream!10888) (_2!11652 BitStream!10888)) )
))
(declare-fun lt!388671 () tuple2!21454)

(assert (=> b!250094 (= e!173335 (not (or (not (_2!11650 lt!388668)) (not (= (_1!11650 lt!388668) (_2!11652 lt!388671))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10888 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21450)

(assert (=> b!250094 (= lt!388668 (checkBitsLoopPure!0 (_1!11652 lt!388671) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!250094 (validate_offset_bits!1 ((_ sign_extend 32) (size!5983 (buf!6476 (_2!11651 lt!388661)))) ((_ sign_extend 32) (currentByte!11907 (_2!11651 lt!388663))) ((_ sign_extend 32) (currentBit!11902 (_2!11651 lt!388663))) lt!388666)))

(declare-fun lt!388662 () Unit!18102)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10888 array!13639 (_ BitVec 64)) Unit!18102)

(assert (=> b!250094 (= lt!388662 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11651 lt!388663) (buf!6476 (_2!11651 lt!388661)) lt!388666))))

(declare-fun reader!0 (BitStream!10888 BitStream!10888) tuple2!21454)

(assert (=> b!250094 (= lt!388671 (reader!0 (_2!11651 lt!388663) (_2!11651 lt!388661)))))

(assert (= (and start!53730 res!209335) b!250093))

(assert (= (and b!250093 res!209340) b!250084))

(assert (= (and b!250084 res!209342) b!250089))

(assert (= (and b!250089 res!209339) b!250091))

(assert (= (and b!250091 res!209334) b!250087))

(assert (= (and b!250087 res!209343) b!250086))

(assert (= (and b!250086 res!209338) b!250085))

(assert (= (and b!250089 res!209337) b!250088))

(assert (= (and b!250088 res!209341) b!250090))

(assert (= (and b!250090 res!209336) b!250094))

(assert (= start!53730 b!250092))

(declare-fun m!376485 () Bool)

(assert (=> start!53730 m!376485))

(declare-fun m!376487 () Bool)

(assert (=> b!250094 m!376487))

(declare-fun m!376489 () Bool)

(assert (=> b!250094 m!376489))

(declare-fun m!376491 () Bool)

(assert (=> b!250094 m!376491))

(declare-fun m!376493 () Bool)

(assert (=> b!250094 m!376493))

(declare-fun m!376495 () Bool)

(assert (=> b!250088 m!376495))

(declare-fun m!376497 () Bool)

(assert (=> b!250088 m!376497))

(declare-fun m!376499 () Bool)

(assert (=> b!250092 m!376499))

(assert (=> b!250091 m!376497))

(declare-fun m!376501 () Bool)

(assert (=> b!250091 m!376501))

(declare-fun m!376503 () Bool)

(assert (=> b!250093 m!376503))

(declare-fun m!376505 () Bool)

(assert (=> b!250087 m!376505))

(declare-fun m!376507 () Bool)

(assert (=> b!250089 m!376507))

(declare-fun m!376509 () Bool)

(assert (=> b!250089 m!376509))

(declare-fun m!376511 () Bool)

(assert (=> b!250089 m!376511))

(declare-fun m!376513 () Bool)

(assert (=> b!250089 m!376513))

(declare-fun m!376515 () Bool)

(assert (=> b!250089 m!376515))

(declare-fun m!376517 () Bool)

(assert (=> b!250089 m!376517))

(declare-fun m!376519 () Bool)

(assert (=> b!250090 m!376519))

(declare-fun m!376521 () Bool)

(assert (=> b!250085 m!376521))

(declare-fun m!376523 () Bool)

(assert (=> b!250086 m!376523))

(assert (=> b!250086 m!376523))

(declare-fun m!376525 () Bool)

(assert (=> b!250086 m!376525))

(push 1)

(assert (not b!250091))

(assert (not b!250086))

(assert (not b!250088))

(assert (not b!250087))

(assert (not b!250090))

(assert (not b!250093))

(assert (not b!250094))

(assert (not b!250085))

(assert (not b!250089))

(assert (not b!250092))

(assert (not start!53730))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

