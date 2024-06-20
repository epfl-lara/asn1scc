; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54118 () Bool)

(assert start!54118)

(declare-fun b!252770 () Bool)

(declare-fun e!175159 () Bool)

(declare-fun e!175162 () Bool)

(assert (=> b!252770 (= e!175159 e!175162)))

(declare-fun res!211802 () Bool)

(assert (=> b!252770 (=> (not res!211802) (not e!175162))))

(declare-datatypes ((array!13742 0))(
  ( (array!13743 (arr!7017 (Array (_ BitVec 32) (_ BitVec 8))) (size!6030 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10982 0))(
  ( (BitStream!10983 (buf!6532 array!13742) (currentByte!11987 (_ BitVec 32)) (currentBit!11982 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!18208 0))(
  ( (Unit!18209) )
))
(declare-datatypes ((tuple2!21750 0))(
  ( (tuple2!21751 (_1!11803 Unit!18208) (_2!11803 BitStream!10982)) )
))
(declare-fun lt!392547 () tuple2!21750)

(declare-datatypes ((tuple2!21752 0))(
  ( (tuple2!21753 (_1!11804 BitStream!10982) (_2!11804 Bool)) )
))
(declare-fun lt!392557 () tuple2!21752)

(declare-fun bit!26 () Bool)

(assert (=> b!252770 (= res!211802 (and (= (_2!11804 lt!392557) bit!26) (= (_1!11804 lt!392557) (_2!11803 lt!392547))))))

(declare-fun thiss!1005 () BitStream!10982)

(declare-fun readBitPure!0 (BitStream!10982) tuple2!21752)

(declare-fun readerFrom!0 (BitStream!10982 (_ BitVec 32) (_ BitVec 32)) BitStream!10982)

(assert (=> b!252770 (= lt!392557 (readBitPure!0 (readerFrom!0 (_2!11803 lt!392547) (currentBit!11982 thiss!1005) (currentByte!11987 thiss!1005))))))

(declare-fun b!252771 () Bool)

(declare-fun e!175165 () Bool)

(declare-fun lt!392550 () tuple2!21752)

(declare-datatypes ((tuple2!21754 0))(
  ( (tuple2!21755 (_1!11805 BitStream!10982) (_2!11805 BitStream!10982)) )
))
(declare-fun lt!392548 () tuple2!21754)

(assert (=> b!252771 (= e!175165 (not (or (not (_2!11804 lt!392550)) (not (= (_1!11804 lt!392550) (_2!11805 lt!392548))))))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!10982 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21752)

(assert (=> b!252771 (= lt!392550 (checkBitsLoopPure!0 (_1!11805 lt!392548) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!392552 () tuple2!21750)

(declare-fun lt!392551 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!252771 (validate_offset_bits!1 ((_ sign_extend 32) (size!6030 (buf!6532 (_2!11803 lt!392552)))) ((_ sign_extend 32) (currentByte!11987 (_2!11803 lt!392547))) ((_ sign_extend 32) (currentBit!11982 (_2!11803 lt!392547))) lt!392551)))

(declare-fun lt!392564 () Unit!18208)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10982 array!13742 (_ BitVec 64)) Unit!18208)

(assert (=> b!252771 (= lt!392564 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11803 lt!392547) (buf!6532 (_2!11803 lt!392552)) lt!392551))))

(declare-fun reader!0 (BitStream!10982 BitStream!10982) tuple2!21754)

(assert (=> b!252771 (= lt!392548 (reader!0 (_2!11803 lt!392547) (_2!11803 lt!392552)))))

(declare-fun b!252772 () Bool)

(declare-fun e!175169 () Bool)

(declare-fun lt!392567 () tuple2!21752)

(declare-fun lt!392565 () tuple2!21752)

(assert (=> b!252772 (= e!175169 (= (_2!11804 lt!392567) (_2!11804 lt!392565)))))

(declare-fun b!252773 () Bool)

(declare-fun res!211813 () Bool)

(declare-fun e!175160 () Bool)

(assert (=> b!252773 (=> (not res!211813) (not e!175160))))

(assert (=> b!252773 (= res!211813 (validate_offset_bits!1 ((_ sign_extend 32) (size!6030 (buf!6532 thiss!1005))) ((_ sign_extend 32) (currentByte!11987 thiss!1005)) ((_ sign_extend 32) (currentBit!11982 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!252774 () Bool)

(declare-fun e!175163 () Bool)

(assert (=> b!252774 (= e!175163 e!175159)))

(declare-fun res!211809 () Bool)

(assert (=> b!252774 (=> (not res!211809) (not e!175159))))

(declare-fun lt!392563 () (_ BitVec 64))

(declare-fun lt!392559 () (_ BitVec 64))

(assert (=> b!252774 (= res!211809 (= lt!392563 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!392559)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!252774 (= lt!392563 (bitIndex!0 (size!6030 (buf!6532 (_2!11803 lt!392547))) (currentByte!11987 (_2!11803 lt!392547)) (currentBit!11982 (_2!11803 lt!392547))))))

(assert (=> b!252774 (= lt!392559 (bitIndex!0 (size!6030 (buf!6532 thiss!1005)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005)))))

(declare-fun b!252775 () Bool)

(declare-fun res!211806 () Bool)

(declare-fun e!175168 () Bool)

(assert (=> b!252775 (=> res!211806 e!175168)))

(declare-fun lt!392560 () tuple2!21754)

(declare-fun lt!392558 () tuple2!21754)

(declare-fun withMovedBitIndex!0 (BitStream!10982 (_ BitVec 64)) BitStream!10982)

(assert (=> b!252775 (= res!211806 (not (= (_1!11805 lt!392560) (withMovedBitIndex!0 (_1!11805 lt!392558) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!252776 () Bool)

(declare-fun res!211804 () Bool)

(declare-fun e!175161 () Bool)

(assert (=> b!252776 (=> (not res!211804) (not e!175161))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!252776 (= res!211804 (invariant!0 (currentBit!11982 thiss!1005) (currentByte!11987 thiss!1005) (size!6030 (buf!6532 (_2!11803 lt!392547)))))))

(declare-fun b!252777 () Bool)

(declare-fun e!175167 () Bool)

(declare-fun array_inv!5771 (array!13742) Bool)

(assert (=> b!252777 (= e!175167 (array_inv!5771 (buf!6532 thiss!1005)))))

(declare-fun b!252778 () Bool)

(declare-fun e!175166 () Bool)

(assert (=> b!252778 (= e!175166 e!175165)))

(declare-fun res!211801 () Bool)

(assert (=> b!252778 (=> (not res!211801) (not e!175165))))

(assert (=> b!252778 (= res!211801 (= (bitIndex!0 (size!6030 (buf!6532 (_2!11803 lt!392552))) (currentByte!11987 (_2!11803 lt!392552)) (currentBit!11982 (_2!11803 lt!392552))) (bvadd (bitIndex!0 (size!6030 (buf!6532 (_2!11803 lt!392547))) (currentByte!11987 (_2!11803 lt!392547)) (currentBit!11982 (_2!11803 lt!392547))) lt!392551)))))

(assert (=> b!252778 (= lt!392551 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun res!211811 () Bool)

(assert (=> start!54118 (=> (not res!211811) (not e!175160))))

(assert (=> start!54118 (= res!211811 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54118 e!175160))

(assert (=> start!54118 true))

(declare-fun inv!12 (BitStream!10982) Bool)

(assert (=> start!54118 (and (inv!12 thiss!1005) e!175167)))

(declare-fun b!252779 () Bool)

(assert (=> b!252779 (= e!175162 (= (bitIndex!0 (size!6030 (buf!6532 (_1!11804 lt!392557))) (currentByte!11987 (_1!11804 lt!392557)) (currentBit!11982 (_1!11804 lt!392557))) lt!392563))))

(declare-fun b!252780 () Bool)

(declare-fun res!211803 () Bool)

(assert (=> b!252780 (=> (not res!211803) (not e!175159))))

(declare-fun isPrefixOf!0 (BitStream!10982 BitStream!10982) Bool)

(assert (=> b!252780 (= res!211803 (isPrefixOf!0 thiss!1005 (_2!11803 lt!392547)))))

(declare-fun b!252781 () Bool)

(declare-fun res!211805 () Bool)

(assert (=> b!252781 (=> (not res!211805) (not e!175165))))

(assert (=> b!252781 (= res!211805 (isPrefixOf!0 (_2!11803 lt!392547) (_2!11803 lt!392552)))))

(declare-fun b!252782 () Bool)

(assert (=> b!252782 (= e!175161 (invariant!0 (currentBit!11982 thiss!1005) (currentByte!11987 thiss!1005) (size!6030 (buf!6532 (_2!11803 lt!392552)))))))

(declare-fun b!252783 () Bool)

(assert (=> b!252783 (= e!175160 (not e!175168))))

(declare-fun res!211807 () Bool)

(assert (=> b!252783 (=> res!211807 e!175168)))

(declare-fun lt!392555 () tuple2!21752)

(assert (=> b!252783 (= res!211807 (not (= (_1!11804 lt!392555) (_2!11805 lt!392560))))))

(assert (=> b!252783 (= lt!392555 (checkBitsLoopPure!0 (_1!11805 lt!392560) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!392568 () (_ BitVec 64))

(assert (=> b!252783 (validate_offset_bits!1 ((_ sign_extend 32) (size!6030 (buf!6532 (_2!11803 lt!392552)))) ((_ sign_extend 32) (currentByte!11987 (_2!11803 lt!392547))) ((_ sign_extend 32) (currentBit!11982 (_2!11803 lt!392547))) lt!392568)))

(declare-fun lt!392549 () Unit!18208)

(assert (=> b!252783 (= lt!392549 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11803 lt!392547) (buf!6532 (_2!11803 lt!392552)) lt!392568))))

(declare-fun lt!392556 () tuple2!21752)

(assert (=> b!252783 (= lt!392556 (checkBitsLoopPure!0 (_1!11805 lt!392558) nBits!297 bit!26 from!289))))

(assert (=> b!252783 (validate_offset_bits!1 ((_ sign_extend 32) (size!6030 (buf!6532 (_2!11803 lt!392552)))) ((_ sign_extend 32) (currentByte!11987 thiss!1005)) ((_ sign_extend 32) (currentBit!11982 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!392562 () Unit!18208)

(assert (=> b!252783 (= lt!392562 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6532 (_2!11803 lt!392552)) (bvsub nBits!297 from!289)))))

(assert (=> b!252783 (= (_2!11804 (readBitPure!0 (_1!11805 lt!392558))) bit!26)))

(assert (=> b!252783 (= lt!392560 (reader!0 (_2!11803 lt!392547) (_2!11803 lt!392552)))))

(assert (=> b!252783 (= lt!392558 (reader!0 thiss!1005 (_2!11803 lt!392552)))))

(assert (=> b!252783 e!175169))

(declare-fun res!211814 () Bool)

(assert (=> b!252783 (=> (not res!211814) (not e!175169))))

(assert (=> b!252783 (= res!211814 (= (bitIndex!0 (size!6030 (buf!6532 (_1!11804 lt!392567))) (currentByte!11987 (_1!11804 lt!392567)) (currentBit!11982 (_1!11804 lt!392567))) (bitIndex!0 (size!6030 (buf!6532 (_1!11804 lt!392565))) (currentByte!11987 (_1!11804 lt!392565)) (currentBit!11982 (_1!11804 lt!392565)))))))

(declare-fun lt!392553 () Unit!18208)

(declare-fun lt!392566 () BitStream!10982)

(declare-fun readBitPrefixLemma!0 (BitStream!10982 BitStream!10982) Unit!18208)

(assert (=> b!252783 (= lt!392553 (readBitPrefixLemma!0 lt!392566 (_2!11803 lt!392552)))))

(assert (=> b!252783 (= lt!392565 (readBitPure!0 (BitStream!10983 (buf!6532 (_2!11803 lt!392552)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005))))))

(assert (=> b!252783 (= lt!392567 (readBitPure!0 lt!392566))))

(assert (=> b!252783 (= lt!392566 (BitStream!10983 (buf!6532 (_2!11803 lt!392547)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005)))))

(assert (=> b!252783 e!175161))

(declare-fun res!211810 () Bool)

(assert (=> b!252783 (=> (not res!211810) (not e!175161))))

(assert (=> b!252783 (= res!211810 (isPrefixOf!0 thiss!1005 (_2!11803 lt!392552)))))

(declare-fun lt!392561 () Unit!18208)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10982 BitStream!10982 BitStream!10982) Unit!18208)

(assert (=> b!252783 (= lt!392561 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11803 lt!392547) (_2!11803 lt!392552)))))

(assert (=> b!252783 e!175166))

(declare-fun res!211808 () Bool)

(assert (=> b!252783 (=> (not res!211808) (not e!175166))))

(assert (=> b!252783 (= res!211808 (= (size!6030 (buf!6532 (_2!11803 lt!392547))) (size!6030 (buf!6532 (_2!11803 lt!392552)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10982 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21750)

(assert (=> b!252783 (= lt!392552 (appendNBitsLoop!0 (_2!11803 lt!392547) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!252783 (validate_offset_bits!1 ((_ sign_extend 32) (size!6030 (buf!6532 (_2!11803 lt!392547)))) ((_ sign_extend 32) (currentByte!11987 (_2!11803 lt!392547))) ((_ sign_extend 32) (currentBit!11982 (_2!11803 lt!392547))) lt!392568)))

(assert (=> b!252783 (= lt!392568 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!392554 () Unit!18208)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10982 BitStream!10982 (_ BitVec 64) (_ BitVec 64)) Unit!18208)

(assert (=> b!252783 (= lt!392554 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11803 lt!392547) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!252783 e!175163))

(declare-fun res!211815 () Bool)

(assert (=> b!252783 (=> (not res!211815) (not e!175163))))

(assert (=> b!252783 (= res!211815 (= (size!6030 (buf!6532 thiss!1005)) (size!6030 (buf!6532 (_2!11803 lt!392547)))))))

(declare-fun appendBit!0 (BitStream!10982 Bool) tuple2!21750)

(assert (=> b!252783 (= lt!392547 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!252784 () Bool)

(declare-fun res!211812 () Bool)

(assert (=> b!252784 (=> (not res!211812) (not e!175160))))

(assert (=> b!252784 (= res!211812 (bvslt from!289 nBits!297))))

(declare-fun b!252785 () Bool)

(assert (=> b!252785 (= e!175168 (= (_2!11804 lt!392556) (_2!11804 lt!392555)))))

(assert (= (and start!54118 res!211811) b!252773))

(assert (= (and b!252773 res!211813) b!252784))

(assert (= (and b!252784 res!211812) b!252783))

(assert (= (and b!252783 res!211815) b!252774))

(assert (= (and b!252774 res!211809) b!252780))

(assert (= (and b!252780 res!211803) b!252770))

(assert (= (and b!252770 res!211802) b!252779))

(assert (= (and b!252783 res!211808) b!252778))

(assert (= (and b!252778 res!211801) b!252781))

(assert (= (and b!252781 res!211805) b!252771))

(assert (= (and b!252783 res!211810) b!252776))

(assert (= (and b!252776 res!211804) b!252782))

(assert (= (and b!252783 res!211814) b!252772))

(assert (= (and b!252783 (not res!211807)) b!252775))

(assert (= (and b!252775 (not res!211806)) b!252785))

(assert (= start!54118 b!252777))

(declare-fun m!380335 () Bool)

(assert (=> b!252778 m!380335))

(declare-fun m!380337 () Bool)

(assert (=> b!252778 m!380337))

(declare-fun m!380339 () Bool)

(assert (=> b!252773 m!380339))

(declare-fun m!380341 () Bool)

(assert (=> b!252776 m!380341))

(declare-fun m!380343 () Bool)

(assert (=> b!252777 m!380343))

(declare-fun m!380345 () Bool)

(assert (=> b!252780 m!380345))

(declare-fun m!380347 () Bool)

(assert (=> b!252771 m!380347))

(declare-fun m!380349 () Bool)

(assert (=> b!252771 m!380349))

(declare-fun m!380351 () Bool)

(assert (=> b!252771 m!380351))

(declare-fun m!380353 () Bool)

(assert (=> b!252771 m!380353))

(declare-fun m!380355 () Bool)

(assert (=> b!252775 m!380355))

(assert (=> b!252774 m!380337))

(declare-fun m!380357 () Bool)

(assert (=> b!252774 m!380357))

(declare-fun m!380359 () Bool)

(assert (=> b!252783 m!380359))

(declare-fun m!380361 () Bool)

(assert (=> b!252783 m!380361))

(declare-fun m!380363 () Bool)

(assert (=> b!252783 m!380363))

(declare-fun m!380365 () Bool)

(assert (=> b!252783 m!380365))

(declare-fun m!380367 () Bool)

(assert (=> b!252783 m!380367))

(declare-fun m!380369 () Bool)

(assert (=> b!252783 m!380369))

(declare-fun m!380371 () Bool)

(assert (=> b!252783 m!380371))

(declare-fun m!380373 () Bool)

(assert (=> b!252783 m!380373))

(declare-fun m!380375 () Bool)

(assert (=> b!252783 m!380375))

(assert (=> b!252783 m!380353))

(declare-fun m!380377 () Bool)

(assert (=> b!252783 m!380377))

(declare-fun m!380379 () Bool)

(assert (=> b!252783 m!380379))

(declare-fun m!380381 () Bool)

(assert (=> b!252783 m!380381))

(declare-fun m!380383 () Bool)

(assert (=> b!252783 m!380383))

(declare-fun m!380385 () Bool)

(assert (=> b!252783 m!380385))

(declare-fun m!380387 () Bool)

(assert (=> b!252783 m!380387))

(declare-fun m!380389 () Bool)

(assert (=> b!252783 m!380389))

(declare-fun m!380391 () Bool)

(assert (=> b!252783 m!380391))

(declare-fun m!380393 () Bool)

(assert (=> b!252783 m!380393))

(declare-fun m!380395 () Bool)

(assert (=> b!252783 m!380395))

(declare-fun m!380397 () Bool)

(assert (=> start!54118 m!380397))

(declare-fun m!380399 () Bool)

(assert (=> b!252770 m!380399))

(assert (=> b!252770 m!380399))

(declare-fun m!380401 () Bool)

(assert (=> b!252770 m!380401))

(declare-fun m!380403 () Bool)

(assert (=> b!252779 m!380403))

(declare-fun m!380405 () Bool)

(assert (=> b!252781 m!380405))

(declare-fun m!380407 () Bool)

(assert (=> b!252782 m!380407))

(push 1)

(assert (not b!252782))

(assert (not b!252774))

(assert (not b!252770))

(assert (not b!252775))

(assert (not b!252777))

(assert (not start!54118))

(assert (not b!252779))

(assert (not b!252776))

(assert (not b!252781))

(assert (not b!252783))

(assert (not b!252771))

(assert (not b!252773))

(assert (not b!252780))

(assert (not b!252778))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!84314 () Bool)

(assert (=> d!84314 (= (invariant!0 (currentBit!11982 thiss!1005) (currentByte!11987 thiss!1005) (size!6030 (buf!6532 (_2!11803 lt!392552)))) (and (bvsge (currentBit!11982 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11982 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11987 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11987 thiss!1005) (size!6030 (buf!6532 (_2!11803 lt!392552)))) (and (= (currentBit!11982 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11987 thiss!1005) (size!6030 (buf!6532 (_2!11803 lt!392552))))))))))

(assert (=> b!252782 d!84314))

(declare-fun d!84318 () Bool)

(declare-datatypes ((tuple2!21758 0))(
  ( (tuple2!21759 (_1!11807 Bool) (_2!11807 BitStream!10982)) )
))
(declare-fun lt!392730 () tuple2!21758)

(declare-fun checkBitsLoop!0 (BitStream!10982 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21758)

(assert (=> d!84318 (= lt!392730 (checkBitsLoop!0 (_1!11805 lt!392548) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!84318 (= (checkBitsLoopPure!0 (_1!11805 lt!392548) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21753 (_2!11807 lt!392730) (_1!11807 lt!392730)))))

(declare-fun bs!21372 () Bool)

(assert (= bs!21372 d!84318))

(declare-fun m!380537 () Bool)

(assert (=> bs!21372 m!380537))

(assert (=> b!252771 d!84318))

(declare-fun d!84320 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!84320 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6030 (buf!6532 (_2!11803 lt!392552)))) ((_ sign_extend 32) (currentByte!11987 (_2!11803 lt!392547))) ((_ sign_extend 32) (currentBit!11982 (_2!11803 lt!392547))) lt!392551) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6030 (buf!6532 (_2!11803 lt!392552)))) ((_ sign_extend 32) (currentByte!11987 (_2!11803 lt!392547))) ((_ sign_extend 32) (currentBit!11982 (_2!11803 lt!392547)))) lt!392551))))

(declare-fun bs!21373 () Bool)

(assert (= bs!21373 d!84320))

(declare-fun m!380539 () Bool)

(assert (=> bs!21373 m!380539))

(assert (=> b!252771 d!84320))

(declare-fun d!84322 () Bool)

(assert (=> d!84322 (validate_offset_bits!1 ((_ sign_extend 32) (size!6030 (buf!6532 (_2!11803 lt!392552)))) ((_ sign_extend 32) (currentByte!11987 (_2!11803 lt!392547))) ((_ sign_extend 32) (currentBit!11982 (_2!11803 lt!392547))) lt!392551)))

(declare-fun lt!392733 () Unit!18208)

(declare-fun choose!9 (BitStream!10982 array!13742 (_ BitVec 64) BitStream!10982) Unit!18208)

(assert (=> d!84322 (= lt!392733 (choose!9 (_2!11803 lt!392547) (buf!6532 (_2!11803 lt!392552)) lt!392551 (BitStream!10983 (buf!6532 (_2!11803 lt!392552)) (currentByte!11987 (_2!11803 lt!392547)) (currentBit!11982 (_2!11803 lt!392547)))))))

(assert (=> d!84322 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11803 lt!392547) (buf!6532 (_2!11803 lt!392552)) lt!392551) lt!392733)))

(declare-fun bs!21374 () Bool)

(assert (= bs!21374 d!84322))

(assert (=> bs!21374 m!380349))

(declare-fun m!380541 () Bool)

(assert (=> bs!21374 m!380541))

(assert (=> b!252771 d!84322))

(declare-fun b!252879 () Bool)

(declare-fun e!175221 () Unit!18208)

(declare-fun lt!392819 () Unit!18208)

(assert (=> b!252879 (= e!175221 lt!392819)))

(declare-fun lt!392803 () (_ BitVec 64))

(assert (=> b!252879 (= lt!392803 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!392806 () (_ BitVec 64))

(assert (=> b!252879 (= lt!392806 (bitIndex!0 (size!6030 (buf!6532 (_2!11803 lt!392547))) (currentByte!11987 (_2!11803 lt!392547)) (currentBit!11982 (_2!11803 lt!392547))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13742 array!13742 (_ BitVec 64) (_ BitVec 64)) Unit!18208)

(assert (=> b!252879 (= lt!392819 (arrayBitRangesEqSymmetric!0 (buf!6532 (_2!11803 lt!392547)) (buf!6532 (_2!11803 lt!392552)) lt!392803 lt!392806))))

(declare-fun arrayBitRangesEq!0 (array!13742 array!13742 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!252879 (arrayBitRangesEq!0 (buf!6532 (_2!11803 lt!392552)) (buf!6532 (_2!11803 lt!392547)) lt!392803 lt!392806)))

(declare-fun b!252880 () Bool)

(declare-fun res!211898 () Bool)

(declare-fun e!175220 () Bool)

(assert (=> b!252880 (=> (not res!211898) (not e!175220))))

(declare-fun lt!392804 () tuple2!21754)

(assert (=> b!252880 (= res!211898 (isPrefixOf!0 (_1!11805 lt!392804) (_2!11803 lt!392547)))))

(declare-fun b!252882 () Bool)

(declare-fun Unit!18212 () Unit!18208)

(assert (=> b!252882 (= e!175221 Unit!18212)))

(declare-fun b!252883 () Bool)

(declare-fun lt!392811 () (_ BitVec 64))

(declare-fun lt!392802 () (_ BitVec 64))

(assert (=> b!252883 (= e!175220 (= (_1!11805 lt!392804) (withMovedBitIndex!0 (_2!11805 lt!392804) (bvsub lt!392802 lt!392811))))))

(assert (=> b!252883 (or (= (bvand lt!392802 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!392811 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!392802 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!392802 lt!392811) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!252883 (= lt!392811 (bitIndex!0 (size!6030 (buf!6532 (_2!11803 lt!392552))) (currentByte!11987 (_2!11803 lt!392552)) (currentBit!11982 (_2!11803 lt!392552))))))

(assert (=> b!252883 (= lt!392802 (bitIndex!0 (size!6030 (buf!6532 (_2!11803 lt!392547))) (currentByte!11987 (_2!11803 lt!392547)) (currentBit!11982 (_2!11803 lt!392547))))))

(declare-fun d!84324 () Bool)

(assert (=> d!84324 e!175220))

(declare-fun res!211899 () Bool)

(assert (=> d!84324 (=> (not res!211899) (not e!175220))))

(assert (=> d!84324 (= res!211899 (isPrefixOf!0 (_1!11805 lt!392804) (_2!11805 lt!392804)))))

(declare-fun lt!392810 () BitStream!10982)

(assert (=> d!84324 (= lt!392804 (tuple2!21755 lt!392810 (_2!11803 lt!392552)))))

(declare-fun lt!392814 () Unit!18208)

(declare-fun lt!392815 () Unit!18208)

(assert (=> d!84324 (= lt!392814 lt!392815)))

(assert (=> d!84324 (isPrefixOf!0 lt!392810 (_2!11803 lt!392552))))

(assert (=> d!84324 (= lt!392815 (lemmaIsPrefixTransitive!0 lt!392810 (_2!11803 lt!392552) (_2!11803 lt!392552)))))

(declare-fun lt!392813 () Unit!18208)

(declare-fun lt!392801 () Unit!18208)

(assert (=> d!84324 (= lt!392813 lt!392801)))

(assert (=> d!84324 (isPrefixOf!0 lt!392810 (_2!11803 lt!392552))))

(assert (=> d!84324 (= lt!392801 (lemmaIsPrefixTransitive!0 lt!392810 (_2!11803 lt!392547) (_2!11803 lt!392552)))))

(declare-fun lt!392816 () Unit!18208)

(assert (=> d!84324 (= lt!392816 e!175221)))

(declare-fun c!11633 () Bool)

(assert (=> d!84324 (= c!11633 (not (= (size!6030 (buf!6532 (_2!11803 lt!392547))) #b00000000000000000000000000000000)))))

(declare-fun lt!392809 () Unit!18208)

(declare-fun lt!392800 () Unit!18208)

(assert (=> d!84324 (= lt!392809 lt!392800)))

(assert (=> d!84324 (isPrefixOf!0 (_2!11803 lt!392552) (_2!11803 lt!392552))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10982) Unit!18208)

(assert (=> d!84324 (= lt!392800 (lemmaIsPrefixRefl!0 (_2!11803 lt!392552)))))

(declare-fun lt!392818 () Unit!18208)

(declare-fun lt!392812 () Unit!18208)

(assert (=> d!84324 (= lt!392818 lt!392812)))

(assert (=> d!84324 (= lt!392812 (lemmaIsPrefixRefl!0 (_2!11803 lt!392552)))))

(declare-fun lt!392817 () Unit!18208)

(declare-fun lt!392808 () Unit!18208)

(assert (=> d!84324 (= lt!392817 lt!392808)))

(assert (=> d!84324 (isPrefixOf!0 lt!392810 lt!392810)))

(assert (=> d!84324 (= lt!392808 (lemmaIsPrefixRefl!0 lt!392810))))

(declare-fun lt!392807 () Unit!18208)

(declare-fun lt!392805 () Unit!18208)

(assert (=> d!84324 (= lt!392807 lt!392805)))

(assert (=> d!84324 (isPrefixOf!0 (_2!11803 lt!392547) (_2!11803 lt!392547))))

(assert (=> d!84324 (= lt!392805 (lemmaIsPrefixRefl!0 (_2!11803 lt!392547)))))

(assert (=> d!84324 (= lt!392810 (BitStream!10983 (buf!6532 (_2!11803 lt!392552)) (currentByte!11987 (_2!11803 lt!392547)) (currentBit!11982 (_2!11803 lt!392547))))))

(assert (=> d!84324 (isPrefixOf!0 (_2!11803 lt!392547) (_2!11803 lt!392552))))

(assert (=> d!84324 (= (reader!0 (_2!11803 lt!392547) (_2!11803 lt!392552)) lt!392804)))

(declare-fun b!252881 () Bool)

(declare-fun res!211897 () Bool)

(assert (=> b!252881 (=> (not res!211897) (not e!175220))))

(assert (=> b!252881 (= res!211897 (isPrefixOf!0 (_2!11805 lt!392804) (_2!11803 lt!392552)))))

(assert (= (and d!84324 c!11633) b!252879))

(assert (= (and d!84324 (not c!11633)) b!252882))

(assert (= (and d!84324 res!211899) b!252880))

(assert (= (and b!252880 res!211898) b!252881))

(assert (= (and b!252881 res!211897) b!252883))

(assert (=> b!252879 m!380337))

(declare-fun m!380563 () Bool)

(assert (=> b!252879 m!380563))

(declare-fun m!380565 () Bool)

(assert (=> b!252879 m!380565))

(declare-fun m!380567 () Bool)

(assert (=> b!252880 m!380567))

(declare-fun m!380569 () Bool)

(assert (=> d!84324 m!380569))

(declare-fun m!380571 () Bool)

(assert (=> d!84324 m!380571))

(declare-fun m!380573 () Bool)

(assert (=> d!84324 m!380573))

(declare-fun m!380575 () Bool)

(assert (=> d!84324 m!380575))

(declare-fun m!380577 () Bool)

(assert (=> d!84324 m!380577))

(assert (=> d!84324 m!380405))

(declare-fun m!380579 () Bool)

(assert (=> d!84324 m!380579))

(declare-fun m!380581 () Bool)

(assert (=> d!84324 m!380581))

(declare-fun m!380583 () Bool)

(assert (=> d!84324 m!380583))

(declare-fun m!380585 () Bool)

(assert (=> d!84324 m!380585))

(declare-fun m!380587 () Bool)

(assert (=> d!84324 m!380587))

(declare-fun m!380589 () Bool)

(assert (=> b!252883 m!380589))

(assert (=> b!252883 m!380335))

(assert (=> b!252883 m!380337))

(declare-fun m!380591 () Bool)

(assert (=> b!252881 m!380591))

(assert (=> b!252771 d!84324))

(declare-fun d!84334 () Bool)

(declare-fun lt!392835 () tuple2!21758)

(declare-fun readBit!0 (BitStream!10982) tuple2!21758)

(assert (=> d!84334 (= lt!392835 (readBit!0 (readerFrom!0 (_2!11803 lt!392547) (currentBit!11982 thiss!1005) (currentByte!11987 thiss!1005))))))

(assert (=> d!84334 (= (readBitPure!0 (readerFrom!0 (_2!11803 lt!392547) (currentBit!11982 thiss!1005) (currentByte!11987 thiss!1005))) (tuple2!21753 (_2!11807 lt!392835) (_1!11807 lt!392835)))))

(declare-fun bs!21379 () Bool)

(assert (= bs!21379 d!84334))

(assert (=> bs!21379 m!380399))

(declare-fun m!380605 () Bool)

(assert (=> bs!21379 m!380605))

(assert (=> b!252770 d!84334))

(declare-fun d!84340 () Bool)

(declare-fun e!175228 () Bool)

(assert (=> d!84340 e!175228))

(declare-fun res!211908 () Bool)

(assert (=> d!84340 (=> (not res!211908) (not e!175228))))

(assert (=> d!84340 (= res!211908 (invariant!0 (currentBit!11982 (_2!11803 lt!392547)) (currentByte!11987 (_2!11803 lt!392547)) (size!6030 (buf!6532 (_2!11803 lt!392547)))))))

(assert (=> d!84340 (= (readerFrom!0 (_2!11803 lt!392547) (currentBit!11982 thiss!1005) (currentByte!11987 thiss!1005)) (BitStream!10983 (buf!6532 (_2!11803 lt!392547)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005)))))

(declare-fun b!252891 () Bool)

(assert (=> b!252891 (= e!175228 (invariant!0 (currentBit!11982 thiss!1005) (currentByte!11987 thiss!1005) (size!6030 (buf!6532 (_2!11803 lt!392547)))))))

(assert (= (and d!84340 res!211908) b!252891))

(declare-fun m!380611 () Bool)

(assert (=> d!84340 m!380611))

(assert (=> b!252891 m!380341))

(assert (=> b!252770 d!84340))

(declare-fun d!84342 () Bool)

(declare-fun res!211915 () Bool)

(declare-fun e!175234 () Bool)

(assert (=> d!84342 (=> (not res!211915) (not e!175234))))

(assert (=> d!84342 (= res!211915 (= (size!6030 (buf!6532 (_2!11803 lt!392547))) (size!6030 (buf!6532 (_2!11803 lt!392552)))))))

(assert (=> d!84342 (= (isPrefixOf!0 (_2!11803 lt!392547) (_2!11803 lt!392552)) e!175234)))

(declare-fun b!252898 () Bool)

(declare-fun res!211917 () Bool)

(assert (=> b!252898 (=> (not res!211917) (not e!175234))))

(assert (=> b!252898 (= res!211917 (bvsle (bitIndex!0 (size!6030 (buf!6532 (_2!11803 lt!392547))) (currentByte!11987 (_2!11803 lt!392547)) (currentBit!11982 (_2!11803 lt!392547))) (bitIndex!0 (size!6030 (buf!6532 (_2!11803 lt!392552))) (currentByte!11987 (_2!11803 lt!392552)) (currentBit!11982 (_2!11803 lt!392552)))))))

(declare-fun b!252899 () Bool)

(declare-fun e!175233 () Bool)

(assert (=> b!252899 (= e!175234 e!175233)))

(declare-fun res!211916 () Bool)

(assert (=> b!252899 (=> res!211916 e!175233)))

(assert (=> b!252899 (= res!211916 (= (size!6030 (buf!6532 (_2!11803 lt!392547))) #b00000000000000000000000000000000))))

(declare-fun b!252900 () Bool)

(assert (=> b!252900 (= e!175233 (arrayBitRangesEq!0 (buf!6532 (_2!11803 lt!392547)) (buf!6532 (_2!11803 lt!392552)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6030 (buf!6532 (_2!11803 lt!392547))) (currentByte!11987 (_2!11803 lt!392547)) (currentBit!11982 (_2!11803 lt!392547)))))))

(assert (= (and d!84342 res!211915) b!252898))

(assert (= (and b!252898 res!211917) b!252899))

(assert (= (and b!252899 (not res!211916)) b!252900))

(assert (=> b!252898 m!380337))

(assert (=> b!252898 m!380335))

(assert (=> b!252900 m!380337))

(assert (=> b!252900 m!380337))

(declare-fun m!380613 () Bool)

(assert (=> b!252900 m!380613))

(assert (=> b!252781 d!84342))

(declare-fun d!84344 () Bool)

(declare-fun res!211918 () Bool)

(declare-fun e!175236 () Bool)

(assert (=> d!84344 (=> (not res!211918) (not e!175236))))

(assert (=> d!84344 (= res!211918 (= (size!6030 (buf!6532 thiss!1005)) (size!6030 (buf!6532 (_2!11803 lt!392547)))))))

(assert (=> d!84344 (= (isPrefixOf!0 thiss!1005 (_2!11803 lt!392547)) e!175236)))

(declare-fun b!252901 () Bool)

(declare-fun res!211920 () Bool)

(assert (=> b!252901 (=> (not res!211920) (not e!175236))))

(assert (=> b!252901 (= res!211920 (bvsle (bitIndex!0 (size!6030 (buf!6532 thiss!1005)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005)) (bitIndex!0 (size!6030 (buf!6532 (_2!11803 lt!392547))) (currentByte!11987 (_2!11803 lt!392547)) (currentBit!11982 (_2!11803 lt!392547)))))))

(declare-fun b!252902 () Bool)

(declare-fun e!175235 () Bool)

(assert (=> b!252902 (= e!175236 e!175235)))

(declare-fun res!211919 () Bool)

(assert (=> b!252902 (=> res!211919 e!175235)))

(assert (=> b!252902 (= res!211919 (= (size!6030 (buf!6532 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!252903 () Bool)

(assert (=> b!252903 (= e!175235 (arrayBitRangesEq!0 (buf!6532 thiss!1005) (buf!6532 (_2!11803 lt!392547)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6030 (buf!6532 thiss!1005)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005))))))

(assert (= (and d!84344 res!211918) b!252901))

(assert (= (and b!252901 res!211920) b!252902))

(assert (= (and b!252902 (not res!211919)) b!252903))

(assert (=> b!252901 m!380357))

(assert (=> b!252901 m!380337))

(assert (=> b!252903 m!380357))

(assert (=> b!252903 m!380357))

(declare-fun m!380615 () Bool)

(assert (=> b!252903 m!380615))

(assert (=> b!252780 d!84344))

(declare-fun d!84346 () Bool)

(declare-fun e!175239 () Bool)

(assert (=> d!84346 e!175239))

(declare-fun res!211925 () Bool)

(assert (=> d!84346 (=> (not res!211925) (not e!175239))))

(declare-fun lt!392854 () (_ BitVec 64))

(declare-fun lt!392856 () (_ BitVec 64))

(declare-fun lt!392859 () (_ BitVec 64))

(assert (=> d!84346 (= res!211925 (= lt!392856 (bvsub lt!392854 lt!392859)))))

(assert (=> d!84346 (or (= (bvand lt!392854 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!392859 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!392854 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!392854 lt!392859) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84346 (= lt!392859 (remainingBits!0 ((_ sign_extend 32) (size!6030 (buf!6532 (_2!11803 lt!392547)))) ((_ sign_extend 32) (currentByte!11987 (_2!11803 lt!392547))) ((_ sign_extend 32) (currentBit!11982 (_2!11803 lt!392547)))))))

(declare-fun lt!392857 () (_ BitVec 64))

(declare-fun lt!392858 () (_ BitVec 64))

(assert (=> d!84346 (= lt!392854 (bvmul lt!392857 lt!392858))))

(assert (=> d!84346 (or (= lt!392857 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!392858 (bvsdiv (bvmul lt!392857 lt!392858) lt!392857)))))

(assert (=> d!84346 (= lt!392858 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84346 (= lt!392857 ((_ sign_extend 32) (size!6030 (buf!6532 (_2!11803 lt!392547)))))))

(assert (=> d!84346 (= lt!392856 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11987 (_2!11803 lt!392547))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11982 (_2!11803 lt!392547)))))))

(assert (=> d!84346 (invariant!0 (currentBit!11982 (_2!11803 lt!392547)) (currentByte!11987 (_2!11803 lt!392547)) (size!6030 (buf!6532 (_2!11803 lt!392547))))))

(assert (=> d!84346 (= (bitIndex!0 (size!6030 (buf!6532 (_2!11803 lt!392547))) (currentByte!11987 (_2!11803 lt!392547)) (currentBit!11982 (_2!11803 lt!392547))) lt!392856)))

(declare-fun b!252908 () Bool)

(declare-fun res!211926 () Bool)

(assert (=> b!252908 (=> (not res!211926) (not e!175239))))

(assert (=> b!252908 (= res!211926 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!392856))))

(declare-fun b!252909 () Bool)

(declare-fun lt!392855 () (_ BitVec 64))

(assert (=> b!252909 (= e!175239 (bvsle lt!392856 (bvmul lt!392855 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!252909 (or (= lt!392855 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!392855 #b0000000000000000000000000000000000000000000000000000000000001000) lt!392855)))))

(assert (=> b!252909 (= lt!392855 ((_ sign_extend 32) (size!6030 (buf!6532 (_2!11803 lt!392547)))))))

(assert (= (and d!84346 res!211925) b!252908))

(assert (= (and b!252908 res!211926) b!252909))

(declare-fun m!380617 () Bool)

(assert (=> d!84346 m!380617))

(assert (=> d!84346 m!380611))

(assert (=> b!252774 d!84346))

(declare-fun d!84348 () Bool)

(declare-fun e!175240 () Bool)

(assert (=> d!84348 e!175240))

(declare-fun res!211927 () Bool)

(assert (=> d!84348 (=> (not res!211927) (not e!175240))))

(declare-fun lt!392860 () (_ BitVec 64))

(declare-fun lt!392865 () (_ BitVec 64))

(declare-fun lt!392862 () (_ BitVec 64))

(assert (=> d!84348 (= res!211927 (= lt!392862 (bvsub lt!392860 lt!392865)))))

(assert (=> d!84348 (or (= (bvand lt!392860 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!392865 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!392860 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!392860 lt!392865) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84348 (= lt!392865 (remainingBits!0 ((_ sign_extend 32) (size!6030 (buf!6532 thiss!1005))) ((_ sign_extend 32) (currentByte!11987 thiss!1005)) ((_ sign_extend 32) (currentBit!11982 thiss!1005))))))

(declare-fun lt!392863 () (_ BitVec 64))

(declare-fun lt!392864 () (_ BitVec 64))

(assert (=> d!84348 (= lt!392860 (bvmul lt!392863 lt!392864))))

(assert (=> d!84348 (or (= lt!392863 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!392864 (bvsdiv (bvmul lt!392863 lt!392864) lt!392863)))))

(assert (=> d!84348 (= lt!392864 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84348 (= lt!392863 ((_ sign_extend 32) (size!6030 (buf!6532 thiss!1005))))))

(assert (=> d!84348 (= lt!392862 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11987 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11982 thiss!1005))))))

(assert (=> d!84348 (invariant!0 (currentBit!11982 thiss!1005) (currentByte!11987 thiss!1005) (size!6030 (buf!6532 thiss!1005)))))

(assert (=> d!84348 (= (bitIndex!0 (size!6030 (buf!6532 thiss!1005)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005)) lt!392862)))

(declare-fun b!252910 () Bool)

(declare-fun res!211928 () Bool)

(assert (=> b!252910 (=> (not res!211928) (not e!175240))))

(assert (=> b!252910 (= res!211928 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!392862))))

(declare-fun b!252911 () Bool)

(declare-fun lt!392861 () (_ BitVec 64))

(assert (=> b!252911 (= e!175240 (bvsle lt!392862 (bvmul lt!392861 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!252911 (or (= lt!392861 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!392861 #b0000000000000000000000000000000000000000000000000000000000001000) lt!392861)))))

(assert (=> b!252911 (= lt!392861 ((_ sign_extend 32) (size!6030 (buf!6532 thiss!1005))))))

(assert (= (and d!84348 res!211927) b!252910))

(assert (= (and b!252910 res!211928) b!252911))

(declare-fun m!380619 () Bool)

(assert (=> d!84348 m!380619))

(declare-fun m!380621 () Bool)

(assert (=> d!84348 m!380621))

(assert (=> b!252774 d!84348))

(declare-fun d!84350 () Bool)

(assert (=> d!84350 (= (inv!12 thiss!1005) (invariant!0 (currentBit!11982 thiss!1005) (currentByte!11987 thiss!1005) (size!6030 (buf!6532 thiss!1005))))))

(declare-fun bs!21380 () Bool)

(assert (= bs!21380 d!84350))

(assert (=> bs!21380 m!380621))

(assert (=> start!54118 d!84350))

(declare-fun d!84352 () Bool)

(assert (=> d!84352 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6030 (buf!6532 thiss!1005))) ((_ sign_extend 32) (currentByte!11987 thiss!1005)) ((_ sign_extend 32) (currentBit!11982 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6030 (buf!6532 thiss!1005))) ((_ sign_extend 32) (currentByte!11987 thiss!1005)) ((_ sign_extend 32) (currentBit!11982 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!21381 () Bool)

(assert (= bs!21381 d!84352))

(assert (=> bs!21381 m!380619))

(assert (=> b!252773 d!84352))

(declare-fun d!84354 () Bool)

(declare-fun e!175245 () Bool)

(assert (=> d!84354 e!175245))

(declare-fun res!211937 () Bool)

(assert (=> d!84354 (=> (not res!211937) (not e!175245))))

(declare-fun lt!392877 () tuple2!21750)

(assert (=> d!84354 (= res!211937 (= (size!6030 (buf!6532 thiss!1005)) (size!6030 (buf!6532 (_2!11803 lt!392877)))))))

(declare-fun choose!16 (BitStream!10982 Bool) tuple2!21750)

(assert (=> d!84354 (= lt!392877 (choose!16 thiss!1005 bit!26))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!84354 (validate_offset_bit!0 ((_ sign_extend 32) (size!6030 (buf!6532 thiss!1005))) ((_ sign_extend 32) (currentByte!11987 thiss!1005)) ((_ sign_extend 32) (currentBit!11982 thiss!1005)))))

(assert (=> d!84354 (= (appendBit!0 thiss!1005 bit!26) lt!392877)))

(declare-fun b!252921 () Bool)

(declare-fun res!211939 () Bool)

(assert (=> b!252921 (=> (not res!211939) (not e!175245))))

(declare-fun lt!392874 () (_ BitVec 64))

(declare-fun lt!392876 () (_ BitVec 64))

(assert (=> b!252921 (= res!211939 (= (bitIndex!0 (size!6030 (buf!6532 (_2!11803 lt!392877))) (currentByte!11987 (_2!11803 lt!392877)) (currentBit!11982 (_2!11803 lt!392877))) (bvadd lt!392874 lt!392876)))))

(assert (=> b!252921 (or (not (= (bvand lt!392874 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!392876 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!392874 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!392874 lt!392876) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!252921 (= lt!392876 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!252921 (= lt!392874 (bitIndex!0 (size!6030 (buf!6532 thiss!1005)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005)))))

(declare-fun b!252923 () Bool)

(declare-fun e!175246 () Bool)

(assert (=> b!252923 (= e!175245 e!175246)))

(declare-fun res!211940 () Bool)

(assert (=> b!252923 (=> (not res!211940) (not e!175246))))

(declare-fun lt!392875 () tuple2!21752)

(assert (=> b!252923 (= res!211940 (and (= (_2!11804 lt!392875) bit!26) (= (_1!11804 lt!392875) (_2!11803 lt!392877))))))

(assert (=> b!252923 (= lt!392875 (readBitPure!0 (readerFrom!0 (_2!11803 lt!392877) (currentBit!11982 thiss!1005) (currentByte!11987 thiss!1005))))))

(declare-fun b!252922 () Bool)

(declare-fun res!211938 () Bool)

(assert (=> b!252922 (=> (not res!211938) (not e!175245))))

(assert (=> b!252922 (= res!211938 (isPrefixOf!0 thiss!1005 (_2!11803 lt!392877)))))

(declare-fun b!252924 () Bool)

(assert (=> b!252924 (= e!175246 (= (bitIndex!0 (size!6030 (buf!6532 (_1!11804 lt!392875))) (currentByte!11987 (_1!11804 lt!392875)) (currentBit!11982 (_1!11804 lt!392875))) (bitIndex!0 (size!6030 (buf!6532 (_2!11803 lt!392877))) (currentByte!11987 (_2!11803 lt!392877)) (currentBit!11982 (_2!11803 lt!392877)))))))

(assert (= (and d!84354 res!211937) b!252921))

(assert (= (and b!252921 res!211939) b!252922))

(assert (= (and b!252922 res!211938) b!252923))

(assert (= (and b!252923 res!211940) b!252924))

(declare-fun m!380623 () Bool)

(assert (=> b!252922 m!380623))

(declare-fun m!380625 () Bool)

(assert (=> b!252921 m!380625))

(assert (=> b!252921 m!380357))

(declare-fun m!380627 () Bool)

(assert (=> d!84354 m!380627))

(declare-fun m!380629 () Bool)

(assert (=> d!84354 m!380629))

(declare-fun m!380631 () Bool)

(assert (=> b!252924 m!380631))

(assert (=> b!252924 m!380625))

(declare-fun m!380633 () Bool)

(assert (=> b!252923 m!380633))

(assert (=> b!252923 m!380633))

(declare-fun m!380635 () Bool)

(assert (=> b!252923 m!380635))

(assert (=> b!252783 d!84354))

(declare-fun lt!392878 () tuple2!21758)

(declare-fun d!84356 () Bool)

(assert (=> d!84356 (= lt!392878 (checkBitsLoop!0 (_1!11805 lt!392558) nBits!297 bit!26 from!289))))

(assert (=> d!84356 (= (checkBitsLoopPure!0 (_1!11805 lt!392558) nBits!297 bit!26 from!289) (tuple2!21753 (_2!11807 lt!392878) (_1!11807 lt!392878)))))

(declare-fun bs!21382 () Bool)

(assert (= bs!21382 d!84356))

(declare-fun m!380637 () Bool)

(assert (=> bs!21382 m!380637))

(assert (=> b!252783 d!84356))

(declare-fun d!84358 () Bool)

(assert (=> d!84358 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6030 (buf!6532 (_2!11803 lt!392552)))) ((_ sign_extend 32) (currentByte!11987 (_2!11803 lt!392547))) ((_ sign_extend 32) (currentBit!11982 (_2!11803 lt!392547))) lt!392568) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6030 (buf!6532 (_2!11803 lt!392552)))) ((_ sign_extend 32) (currentByte!11987 (_2!11803 lt!392547))) ((_ sign_extend 32) (currentBit!11982 (_2!11803 lt!392547)))) lt!392568))))

(declare-fun bs!21383 () Bool)

(assert (= bs!21383 d!84358))

(assert (=> bs!21383 m!380539))

(assert (=> b!252783 d!84358))

(declare-fun lt!392879 () tuple2!21758)

(declare-fun d!84360 () Bool)

(assert (=> d!84360 (= lt!392879 (checkBitsLoop!0 (_1!11805 lt!392560) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!84360 (= (checkBitsLoopPure!0 (_1!11805 lt!392560) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21753 (_2!11807 lt!392879) (_1!11807 lt!392879)))))

(declare-fun bs!21384 () Bool)

(assert (= bs!21384 d!84360))

(declare-fun m!380639 () Bool)

(assert (=> bs!21384 m!380639))

(assert (=> b!252783 d!84360))

(declare-fun d!84362 () Bool)

(declare-fun e!175247 () Bool)

(assert (=> d!84362 e!175247))

(declare-fun res!211941 () Bool)

(assert (=> d!84362 (=> (not res!211941) (not e!175247))))

(declare-fun lt!392885 () (_ BitVec 64))

(declare-fun lt!392882 () (_ BitVec 64))

(declare-fun lt!392880 () (_ BitVec 64))

(assert (=> d!84362 (= res!211941 (= lt!392882 (bvsub lt!392880 lt!392885)))))

(assert (=> d!84362 (or (= (bvand lt!392880 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!392885 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!392880 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!392880 lt!392885) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84362 (= lt!392885 (remainingBits!0 ((_ sign_extend 32) (size!6030 (buf!6532 (_1!11804 lt!392567)))) ((_ sign_extend 32) (currentByte!11987 (_1!11804 lt!392567))) ((_ sign_extend 32) (currentBit!11982 (_1!11804 lt!392567)))))))

(declare-fun lt!392883 () (_ BitVec 64))

(declare-fun lt!392884 () (_ BitVec 64))

(assert (=> d!84362 (= lt!392880 (bvmul lt!392883 lt!392884))))

(assert (=> d!84362 (or (= lt!392883 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!392884 (bvsdiv (bvmul lt!392883 lt!392884) lt!392883)))))

(assert (=> d!84362 (= lt!392884 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84362 (= lt!392883 ((_ sign_extend 32) (size!6030 (buf!6532 (_1!11804 lt!392567)))))))

(assert (=> d!84362 (= lt!392882 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11987 (_1!11804 lt!392567))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11982 (_1!11804 lt!392567)))))))

(assert (=> d!84362 (invariant!0 (currentBit!11982 (_1!11804 lt!392567)) (currentByte!11987 (_1!11804 lt!392567)) (size!6030 (buf!6532 (_1!11804 lt!392567))))))

(assert (=> d!84362 (= (bitIndex!0 (size!6030 (buf!6532 (_1!11804 lt!392567))) (currentByte!11987 (_1!11804 lt!392567)) (currentBit!11982 (_1!11804 lt!392567))) lt!392882)))

(declare-fun b!252925 () Bool)

(declare-fun res!211942 () Bool)

(assert (=> b!252925 (=> (not res!211942) (not e!175247))))

(assert (=> b!252925 (= res!211942 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!392882))))

(declare-fun b!252926 () Bool)

(declare-fun lt!392881 () (_ BitVec 64))

(assert (=> b!252926 (= e!175247 (bvsle lt!392882 (bvmul lt!392881 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!252926 (or (= lt!392881 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!392881 #b0000000000000000000000000000000000000000000000000000000000001000) lt!392881)))))

(assert (=> b!252926 (= lt!392881 ((_ sign_extend 32) (size!6030 (buf!6532 (_1!11804 lt!392567)))))))

(assert (= (and d!84362 res!211941) b!252925))

(assert (= (and b!252925 res!211942) b!252926))

(declare-fun m!380641 () Bool)

(assert (=> d!84362 m!380641))

(declare-fun m!380643 () Bool)

(assert (=> d!84362 m!380643))

(assert (=> b!252783 d!84362))

(declare-fun d!84364 () Bool)

(assert (=> d!84364 (validate_offset_bits!1 ((_ sign_extend 32) (size!6030 (buf!6532 (_2!11803 lt!392552)))) ((_ sign_extend 32) (currentByte!11987 (_2!11803 lt!392547))) ((_ sign_extend 32) (currentBit!11982 (_2!11803 lt!392547))) lt!392568)))

(declare-fun lt!392886 () Unit!18208)

(assert (=> d!84364 (= lt!392886 (choose!9 (_2!11803 lt!392547) (buf!6532 (_2!11803 lt!392552)) lt!392568 (BitStream!10983 (buf!6532 (_2!11803 lt!392552)) (currentByte!11987 (_2!11803 lt!392547)) (currentBit!11982 (_2!11803 lt!392547)))))))

(assert (=> d!84364 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11803 lt!392547) (buf!6532 (_2!11803 lt!392552)) lt!392568) lt!392886)))

(declare-fun bs!21385 () Bool)

(assert (= bs!21385 d!84364))

(assert (=> bs!21385 m!380367))

(declare-fun m!380645 () Bool)

(assert (=> bs!21385 m!380645))

(assert (=> b!252783 d!84364))

(declare-fun d!84366 () Bool)

(declare-fun res!211943 () Bool)

(declare-fun e!175249 () Bool)

(assert (=> d!84366 (=> (not res!211943) (not e!175249))))

(assert (=> d!84366 (= res!211943 (= (size!6030 (buf!6532 thiss!1005)) (size!6030 (buf!6532 (_2!11803 lt!392552)))))))

(assert (=> d!84366 (= (isPrefixOf!0 thiss!1005 (_2!11803 lt!392552)) e!175249)))

(declare-fun b!252927 () Bool)

(declare-fun res!211945 () Bool)

(assert (=> b!252927 (=> (not res!211945) (not e!175249))))

(assert (=> b!252927 (= res!211945 (bvsle (bitIndex!0 (size!6030 (buf!6532 thiss!1005)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005)) (bitIndex!0 (size!6030 (buf!6532 (_2!11803 lt!392552))) (currentByte!11987 (_2!11803 lt!392552)) (currentBit!11982 (_2!11803 lt!392552)))))))

(declare-fun b!252928 () Bool)

(declare-fun e!175248 () Bool)

(assert (=> b!252928 (= e!175249 e!175248)))

(declare-fun res!211944 () Bool)

(assert (=> b!252928 (=> res!211944 e!175248)))

(assert (=> b!252928 (= res!211944 (= (size!6030 (buf!6532 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!252929 () Bool)

(assert (=> b!252929 (= e!175248 (arrayBitRangesEq!0 (buf!6532 thiss!1005) (buf!6532 (_2!11803 lt!392552)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6030 (buf!6532 thiss!1005)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005))))))

(assert (= (and d!84366 res!211943) b!252927))

(assert (= (and b!252927 res!211945) b!252928))

(assert (= (and b!252928 (not res!211944)) b!252929))

(assert (=> b!252927 m!380357))

(assert (=> b!252927 m!380335))

(assert (=> b!252929 m!380357))

(assert (=> b!252929 m!380357))

(declare-fun m!380647 () Bool)

(assert (=> b!252929 m!380647))

(assert (=> b!252783 d!84366))

(declare-fun d!84368 () Bool)

(declare-fun e!175252 () Bool)

(assert (=> d!84368 e!175252))

(declare-fun res!211948 () Bool)

(assert (=> d!84368 (=> (not res!211948) (not e!175252))))

(assert (=> d!84368 (= res!211948 (or (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!392889 () Unit!18208)

(declare-fun choose!27 (BitStream!10982 BitStream!10982 (_ BitVec 64) (_ BitVec 64)) Unit!18208)

(assert (=> d!84368 (= lt!392889 (choose!27 thiss!1005 (_2!11803 lt!392547) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!84368 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!297 from!289)))))

(assert (=> d!84368 (= (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11803 lt!392547) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) lt!392889)))

(declare-fun b!252932 () Bool)

(assert (=> b!252932 (= e!175252 (validate_offset_bits!1 ((_ sign_extend 32) (size!6030 (buf!6532 (_2!11803 lt!392547)))) ((_ sign_extend 32) (currentByte!11987 (_2!11803 lt!392547))) ((_ sign_extend 32) (currentBit!11982 (_2!11803 lt!392547))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!84368 res!211948) b!252932))

(declare-fun m!380649 () Bool)

(assert (=> d!84368 m!380649))

(declare-fun m!380651 () Bool)

(assert (=> b!252932 m!380651))

(assert (=> b!252783 d!84368))

(assert (=> b!252783 d!84324))

(declare-fun d!84370 () Bool)

(assert (=> d!84370 (validate_offset_bits!1 ((_ sign_extend 32) (size!6030 (buf!6532 (_2!11803 lt!392552)))) ((_ sign_extend 32) (currentByte!11987 thiss!1005)) ((_ sign_extend 32) (currentBit!11982 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!392890 () Unit!18208)

(assert (=> d!84370 (= lt!392890 (choose!9 thiss!1005 (buf!6532 (_2!11803 lt!392552)) (bvsub nBits!297 from!289) (BitStream!10983 (buf!6532 (_2!11803 lt!392552)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005))))))

(assert (=> d!84370 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6532 (_2!11803 lt!392552)) (bvsub nBits!297 from!289)) lt!392890)))

(declare-fun bs!21386 () Bool)

(assert (= bs!21386 d!84370))

(assert (=> bs!21386 m!380369))

(declare-fun m!380653 () Bool)

(assert (=> bs!21386 m!380653))

(assert (=> b!252783 d!84370))

(declare-fun d!84372 () Bool)

(assert (=> d!84372 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6030 (buf!6532 (_2!11803 lt!392547)))) ((_ sign_extend 32) (currentByte!11987 (_2!11803 lt!392547))) ((_ sign_extend 32) (currentBit!11982 (_2!11803 lt!392547))) lt!392568) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6030 (buf!6532 (_2!11803 lt!392547)))) ((_ sign_extend 32) (currentByte!11987 (_2!11803 lt!392547))) ((_ sign_extend 32) (currentBit!11982 (_2!11803 lt!392547)))) lt!392568))))

(declare-fun bs!21387 () Bool)

(assert (= bs!21387 d!84372))

(assert (=> bs!21387 m!380617))

(assert (=> b!252783 d!84372))

(declare-fun d!84374 () Bool)

(declare-fun e!175255 () Bool)

(assert (=> d!84374 e!175255))

(declare-fun res!211951 () Bool)

(assert (=> d!84374 (=> (not res!211951) (not e!175255))))

(declare-fun lt!392900 () tuple2!21752)

(declare-fun lt!392901 () tuple2!21752)

(assert (=> d!84374 (= res!211951 (= (bitIndex!0 (size!6030 (buf!6532 (_1!11804 lt!392900))) (currentByte!11987 (_1!11804 lt!392900)) (currentBit!11982 (_1!11804 lt!392900))) (bitIndex!0 (size!6030 (buf!6532 (_1!11804 lt!392901))) (currentByte!11987 (_1!11804 lt!392901)) (currentBit!11982 (_1!11804 lt!392901)))))))

(declare-fun lt!392902 () BitStream!10982)

(declare-fun lt!392899 () Unit!18208)

(declare-fun choose!50 (BitStream!10982 BitStream!10982 BitStream!10982 tuple2!21752 tuple2!21752 BitStream!10982 Bool tuple2!21752 tuple2!21752 BitStream!10982 Bool) Unit!18208)

(assert (=> d!84374 (= lt!392899 (choose!50 lt!392566 (_2!11803 lt!392552) lt!392902 lt!392900 (tuple2!21753 (_1!11804 lt!392900) (_2!11804 lt!392900)) (_1!11804 lt!392900) (_2!11804 lt!392900) lt!392901 (tuple2!21753 (_1!11804 lt!392901) (_2!11804 lt!392901)) (_1!11804 lt!392901) (_2!11804 lt!392901)))))

(assert (=> d!84374 (= lt!392901 (readBitPure!0 lt!392902))))

(assert (=> d!84374 (= lt!392900 (readBitPure!0 lt!392566))))

(assert (=> d!84374 (= lt!392902 (BitStream!10983 (buf!6532 (_2!11803 lt!392552)) (currentByte!11987 lt!392566) (currentBit!11982 lt!392566)))))

(assert (=> d!84374 (invariant!0 (currentBit!11982 lt!392566) (currentByte!11987 lt!392566) (size!6030 (buf!6532 (_2!11803 lt!392552))))))

(assert (=> d!84374 (= (readBitPrefixLemma!0 lt!392566 (_2!11803 lt!392552)) lt!392899)))

(declare-fun b!252935 () Bool)

(assert (=> b!252935 (= e!175255 (= (_2!11804 lt!392900) (_2!11804 lt!392901)))))

(assert (= (and d!84374 res!211951) b!252935))

(declare-fun m!380655 () Bool)

(assert (=> d!84374 m!380655))

(assert (=> d!84374 m!380385))

(declare-fun m!380657 () Bool)

(assert (=> d!84374 m!380657))

(declare-fun m!380659 () Bool)

(assert (=> d!84374 m!380659))

(declare-fun m!380661 () Bool)

(assert (=> d!84374 m!380661))

(declare-fun m!380663 () Bool)

(assert (=> d!84374 m!380663))

(assert (=> b!252783 d!84374))

(declare-fun d!84376 () Bool)

(declare-fun e!175256 () Bool)

(assert (=> d!84376 e!175256))

(declare-fun res!211952 () Bool)

(assert (=> d!84376 (=> (not res!211952) (not e!175256))))

(declare-fun lt!392903 () (_ BitVec 64))

(declare-fun lt!392905 () (_ BitVec 64))

(declare-fun lt!392908 () (_ BitVec 64))

(assert (=> d!84376 (= res!211952 (= lt!392905 (bvsub lt!392903 lt!392908)))))

(assert (=> d!84376 (or (= (bvand lt!392903 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!392908 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!392903 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!392903 lt!392908) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84376 (= lt!392908 (remainingBits!0 ((_ sign_extend 32) (size!6030 (buf!6532 (_1!11804 lt!392565)))) ((_ sign_extend 32) (currentByte!11987 (_1!11804 lt!392565))) ((_ sign_extend 32) (currentBit!11982 (_1!11804 lt!392565)))))))

(declare-fun lt!392906 () (_ BitVec 64))

(declare-fun lt!392907 () (_ BitVec 64))

(assert (=> d!84376 (= lt!392903 (bvmul lt!392906 lt!392907))))

(assert (=> d!84376 (or (= lt!392906 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!392907 (bvsdiv (bvmul lt!392906 lt!392907) lt!392906)))))

(assert (=> d!84376 (= lt!392907 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84376 (= lt!392906 ((_ sign_extend 32) (size!6030 (buf!6532 (_1!11804 lt!392565)))))))

(assert (=> d!84376 (= lt!392905 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11987 (_1!11804 lt!392565))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11982 (_1!11804 lt!392565)))))))

(assert (=> d!84376 (invariant!0 (currentBit!11982 (_1!11804 lt!392565)) (currentByte!11987 (_1!11804 lt!392565)) (size!6030 (buf!6532 (_1!11804 lt!392565))))))

(assert (=> d!84376 (= (bitIndex!0 (size!6030 (buf!6532 (_1!11804 lt!392565))) (currentByte!11987 (_1!11804 lt!392565)) (currentBit!11982 (_1!11804 lt!392565))) lt!392905)))

(declare-fun b!252936 () Bool)

(declare-fun res!211953 () Bool)

(assert (=> b!252936 (=> (not res!211953) (not e!175256))))

(assert (=> b!252936 (= res!211953 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!392905))))

(declare-fun b!252937 () Bool)

(declare-fun lt!392904 () (_ BitVec 64))

(assert (=> b!252937 (= e!175256 (bvsle lt!392905 (bvmul lt!392904 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!252937 (or (= lt!392904 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!392904 #b0000000000000000000000000000000000000000000000000000000000001000) lt!392904)))))

(assert (=> b!252937 (= lt!392904 ((_ sign_extend 32) (size!6030 (buf!6532 (_1!11804 lt!392565)))))))

(assert (= (and d!84376 res!211952) b!252936))

(assert (= (and b!252936 res!211953) b!252937))

(declare-fun m!380665 () Bool)

(assert (=> d!84376 m!380665))

(declare-fun m!380667 () Bool)

(assert (=> d!84376 m!380667))

(assert (=> b!252783 d!84376))

(declare-fun d!84378 () Bool)

(declare-fun lt!392909 () tuple2!21758)

(assert (=> d!84378 (= lt!392909 (readBit!0 (_1!11805 lt!392558)))))

(assert (=> d!84378 (= (readBitPure!0 (_1!11805 lt!392558)) (tuple2!21753 (_2!11807 lt!392909) (_1!11807 lt!392909)))))

(declare-fun bs!21388 () Bool)

(assert (= bs!21388 d!84378))

(declare-fun m!380669 () Bool)

(assert (=> bs!21388 m!380669))

(assert (=> b!252783 d!84378))

(declare-fun d!84380 () Bool)

(assert (=> d!84380 (isPrefixOf!0 thiss!1005 (_2!11803 lt!392552))))

(declare-fun lt!392912 () Unit!18208)

(declare-fun choose!30 (BitStream!10982 BitStream!10982 BitStream!10982) Unit!18208)

(assert (=> d!84380 (= lt!392912 (choose!30 thiss!1005 (_2!11803 lt!392547) (_2!11803 lt!392552)))))

(assert (=> d!84380 (isPrefixOf!0 thiss!1005 (_2!11803 lt!392547))))

(assert (=> d!84380 (= (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11803 lt!392547) (_2!11803 lt!392552)) lt!392912)))

(declare-fun bs!21389 () Bool)

(assert (= bs!21389 d!84380))

(assert (=> bs!21389 m!380395))

(declare-fun m!380671 () Bool)

(assert (=> bs!21389 m!380671))

(assert (=> bs!21389 m!380345))

(assert (=> b!252783 d!84380))

(declare-fun d!84382 () Bool)

(declare-fun lt!392913 () tuple2!21758)

(assert (=> d!84382 (= lt!392913 (readBit!0 (BitStream!10983 (buf!6532 (_2!11803 lt!392552)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005))))))

(assert (=> d!84382 (= (readBitPure!0 (BitStream!10983 (buf!6532 (_2!11803 lt!392552)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005))) (tuple2!21753 (_2!11807 lt!392913) (_1!11807 lt!392913)))))

(declare-fun bs!21390 () Bool)

(assert (= bs!21390 d!84382))

(declare-fun m!380673 () Bool)

(assert (=> bs!21390 m!380673))

(assert (=> b!252783 d!84382))

(declare-fun d!84384 () Bool)

(declare-fun lt!392914 () tuple2!21758)

(assert (=> d!84384 (= lt!392914 (readBit!0 lt!392566))))

(assert (=> d!84384 (= (readBitPure!0 lt!392566) (tuple2!21753 (_2!11807 lt!392914) (_1!11807 lt!392914)))))

(declare-fun bs!21391 () Bool)

(assert (= bs!21391 d!84384))

(declare-fun m!380675 () Bool)

(assert (=> bs!21391 m!380675))

(assert (=> b!252783 d!84384))

(declare-fun d!84386 () Bool)

(assert (=> d!84386 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6030 (buf!6532 (_2!11803 lt!392552)))) ((_ sign_extend 32) (currentByte!11987 thiss!1005)) ((_ sign_extend 32) (currentBit!11982 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6030 (buf!6532 (_2!11803 lt!392552)))) ((_ sign_extend 32) (currentByte!11987 thiss!1005)) ((_ sign_extend 32) (currentBit!11982 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!21392 () Bool)

(assert (= bs!21392 d!84386))

(declare-fun m!380677 () Bool)

(assert (=> bs!21392 m!380677))

(assert (=> b!252783 d!84386))

(declare-fun b!252947 () Bool)

(declare-fun res!211962 () Bool)

(declare-fun e!175262 () Bool)

(assert (=> b!252947 (=> (not res!211962) (not e!175262))))

(declare-fun lt!392937 () tuple2!21750)

(assert (=> b!252947 (= res!211962 (isPrefixOf!0 (_2!11803 lt!392547) (_2!11803 lt!392937)))))

(declare-fun d!84388 () Bool)

(assert (=> d!84388 e!175262))

(declare-fun res!211964 () Bool)

(assert (=> d!84388 (=> (not res!211964) (not e!175262))))

(assert (=> d!84388 (= res!211964 (= (size!6030 (buf!6532 (_2!11803 lt!392547))) (size!6030 (buf!6532 (_2!11803 lt!392937)))))))

(declare-fun choose!51 (BitStream!10982 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21750)

(assert (=> d!84388 (= lt!392937 (choose!51 (_2!11803 lt!392547) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!84388 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!84388 (= (appendNBitsLoop!0 (_2!11803 lt!392547) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!392937)))

(declare-fun b!252949 () Bool)

(declare-fun e!175261 () Bool)

(declare-fun lt!392932 () (_ BitVec 64))

(assert (=> b!252949 (= e!175261 (validate_offset_bits!1 ((_ sign_extend 32) (size!6030 (buf!6532 (_2!11803 lt!392547)))) ((_ sign_extend 32) (currentByte!11987 (_2!11803 lt!392547))) ((_ sign_extend 32) (currentBit!11982 (_2!11803 lt!392547))) lt!392932))))

(declare-fun b!252948 () Bool)

(declare-fun lt!392938 () tuple2!21752)

(declare-fun lt!392931 () tuple2!21754)

(assert (=> b!252948 (= e!175262 (and (_2!11804 lt!392938) (= (_1!11804 lt!392938) (_2!11805 lt!392931))))))

(assert (=> b!252948 (= lt!392938 (checkBitsLoopPure!0 (_1!11805 lt!392931) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!392936 () Unit!18208)

(declare-fun lt!392935 () Unit!18208)

(assert (=> b!252948 (= lt!392936 lt!392935)))

(assert (=> b!252948 (validate_offset_bits!1 ((_ sign_extend 32) (size!6030 (buf!6532 (_2!11803 lt!392937)))) ((_ sign_extend 32) (currentByte!11987 (_2!11803 lt!392547))) ((_ sign_extend 32) (currentBit!11982 (_2!11803 lt!392547))) lt!392932)))

(assert (=> b!252948 (= lt!392935 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11803 lt!392547) (buf!6532 (_2!11803 lt!392937)) lt!392932))))

(assert (=> b!252948 e!175261))

(declare-fun res!211965 () Bool)

(assert (=> b!252948 (=> (not res!211965) (not e!175261))))

(assert (=> b!252948 (= res!211965 (and (= (size!6030 (buf!6532 (_2!11803 lt!392547))) (size!6030 (buf!6532 (_2!11803 lt!392937)))) (bvsge lt!392932 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!252948 (= lt!392932 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!252948 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!252948 (= lt!392931 (reader!0 (_2!11803 lt!392547) (_2!11803 lt!392937)))))

(declare-fun b!252946 () Bool)

(declare-fun res!211963 () Bool)

(assert (=> b!252946 (=> (not res!211963) (not e!175262))))

(declare-fun lt!392933 () (_ BitVec 64))

(declare-fun lt!392934 () (_ BitVec 64))

(assert (=> b!252946 (= res!211963 (= (bitIndex!0 (size!6030 (buf!6532 (_2!11803 lt!392937))) (currentByte!11987 (_2!11803 lt!392937)) (currentBit!11982 (_2!11803 lt!392937))) (bvadd lt!392934 lt!392933)))))

(assert (=> b!252946 (or (not (= (bvand lt!392934 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!392933 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!392934 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!392934 lt!392933) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!252946 (= lt!392933 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!252946 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!252946 (= lt!392934 (bitIndex!0 (size!6030 (buf!6532 (_2!11803 lt!392547))) (currentByte!11987 (_2!11803 lt!392547)) (currentBit!11982 (_2!11803 lt!392547))))))

(assert (= (and d!84388 res!211964) b!252946))

(assert (= (and b!252946 res!211963) b!252947))

(assert (= (and b!252947 res!211962) b!252948))

(assert (= (and b!252948 res!211965) b!252949))

(declare-fun m!380679 () Bool)

(assert (=> d!84388 m!380679))

(declare-fun m!380681 () Bool)

(assert (=> b!252948 m!380681))

(declare-fun m!380683 () Bool)

(assert (=> b!252948 m!380683))

(declare-fun m!380685 () Bool)

(assert (=> b!252948 m!380685))

(declare-fun m!380687 () Bool)

(assert (=> b!252948 m!380687))

(declare-fun m!380689 () Bool)

(assert (=> b!252947 m!380689))

(declare-fun m!380691 () Bool)

(assert (=> b!252946 m!380691))

(assert (=> b!252946 m!380337))

(declare-fun m!380693 () Bool)

(assert (=> b!252949 m!380693))

(assert (=> b!252783 d!84388))

(declare-fun b!252950 () Bool)

(declare-fun e!175264 () Unit!18208)

(declare-fun lt!392958 () Unit!18208)

(assert (=> b!252950 (= e!175264 lt!392958)))

(declare-fun lt!392942 () (_ BitVec 64))

(assert (=> b!252950 (= lt!392942 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!392945 () (_ BitVec 64))

(assert (=> b!252950 (= lt!392945 (bitIndex!0 (size!6030 (buf!6532 thiss!1005)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005)))))

(assert (=> b!252950 (= lt!392958 (arrayBitRangesEqSymmetric!0 (buf!6532 thiss!1005) (buf!6532 (_2!11803 lt!392552)) lt!392942 lt!392945))))

(assert (=> b!252950 (arrayBitRangesEq!0 (buf!6532 (_2!11803 lt!392552)) (buf!6532 thiss!1005) lt!392942 lt!392945)))

(declare-fun b!252951 () Bool)

(declare-fun res!211967 () Bool)

(declare-fun e!175263 () Bool)

(assert (=> b!252951 (=> (not res!211967) (not e!175263))))

(declare-fun lt!392943 () tuple2!21754)

(assert (=> b!252951 (= res!211967 (isPrefixOf!0 (_1!11805 lt!392943) thiss!1005))))

(declare-fun b!252953 () Bool)

(declare-fun Unit!18213 () Unit!18208)

(assert (=> b!252953 (= e!175264 Unit!18213)))

(declare-fun b!252954 () Bool)

(declare-fun lt!392950 () (_ BitVec 64))

(declare-fun lt!392941 () (_ BitVec 64))

(assert (=> b!252954 (= e!175263 (= (_1!11805 lt!392943) (withMovedBitIndex!0 (_2!11805 lt!392943) (bvsub lt!392941 lt!392950))))))

(assert (=> b!252954 (or (= (bvand lt!392941 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!392950 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!392941 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!392941 lt!392950) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!252954 (= lt!392950 (bitIndex!0 (size!6030 (buf!6532 (_2!11803 lt!392552))) (currentByte!11987 (_2!11803 lt!392552)) (currentBit!11982 (_2!11803 lt!392552))))))

(assert (=> b!252954 (= lt!392941 (bitIndex!0 (size!6030 (buf!6532 thiss!1005)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005)))))

(declare-fun d!84390 () Bool)

(assert (=> d!84390 e!175263))

(declare-fun res!211968 () Bool)

(assert (=> d!84390 (=> (not res!211968) (not e!175263))))

(assert (=> d!84390 (= res!211968 (isPrefixOf!0 (_1!11805 lt!392943) (_2!11805 lt!392943)))))

(declare-fun lt!392949 () BitStream!10982)

(assert (=> d!84390 (= lt!392943 (tuple2!21755 lt!392949 (_2!11803 lt!392552)))))

(declare-fun lt!392953 () Unit!18208)

(declare-fun lt!392954 () Unit!18208)

(assert (=> d!84390 (= lt!392953 lt!392954)))

(assert (=> d!84390 (isPrefixOf!0 lt!392949 (_2!11803 lt!392552))))

(assert (=> d!84390 (= lt!392954 (lemmaIsPrefixTransitive!0 lt!392949 (_2!11803 lt!392552) (_2!11803 lt!392552)))))

(declare-fun lt!392952 () Unit!18208)

(declare-fun lt!392940 () Unit!18208)

(assert (=> d!84390 (= lt!392952 lt!392940)))

(assert (=> d!84390 (isPrefixOf!0 lt!392949 (_2!11803 lt!392552))))

(assert (=> d!84390 (= lt!392940 (lemmaIsPrefixTransitive!0 lt!392949 thiss!1005 (_2!11803 lt!392552)))))

(declare-fun lt!392955 () Unit!18208)

(assert (=> d!84390 (= lt!392955 e!175264)))

(declare-fun c!11634 () Bool)

(assert (=> d!84390 (= c!11634 (not (= (size!6030 (buf!6532 thiss!1005)) #b00000000000000000000000000000000)))))

(declare-fun lt!392948 () Unit!18208)

(declare-fun lt!392939 () Unit!18208)

(assert (=> d!84390 (= lt!392948 lt!392939)))

(assert (=> d!84390 (isPrefixOf!0 (_2!11803 lt!392552) (_2!11803 lt!392552))))

(assert (=> d!84390 (= lt!392939 (lemmaIsPrefixRefl!0 (_2!11803 lt!392552)))))

(declare-fun lt!392957 () Unit!18208)

(declare-fun lt!392951 () Unit!18208)

(assert (=> d!84390 (= lt!392957 lt!392951)))

(assert (=> d!84390 (= lt!392951 (lemmaIsPrefixRefl!0 (_2!11803 lt!392552)))))

(declare-fun lt!392956 () Unit!18208)

(declare-fun lt!392947 () Unit!18208)

(assert (=> d!84390 (= lt!392956 lt!392947)))

(assert (=> d!84390 (isPrefixOf!0 lt!392949 lt!392949)))

(assert (=> d!84390 (= lt!392947 (lemmaIsPrefixRefl!0 lt!392949))))

(declare-fun lt!392946 () Unit!18208)

(declare-fun lt!392944 () Unit!18208)

(assert (=> d!84390 (= lt!392946 lt!392944)))

(assert (=> d!84390 (isPrefixOf!0 thiss!1005 thiss!1005)))

(assert (=> d!84390 (= lt!392944 (lemmaIsPrefixRefl!0 thiss!1005))))

(assert (=> d!84390 (= lt!392949 (BitStream!10983 (buf!6532 (_2!11803 lt!392552)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005)))))

(assert (=> d!84390 (isPrefixOf!0 thiss!1005 (_2!11803 lt!392552))))

(assert (=> d!84390 (= (reader!0 thiss!1005 (_2!11803 lt!392552)) lt!392943)))

(declare-fun b!252952 () Bool)

(declare-fun res!211966 () Bool)

(assert (=> b!252952 (=> (not res!211966) (not e!175263))))

(assert (=> b!252952 (= res!211966 (isPrefixOf!0 (_2!11805 lt!392943) (_2!11803 lt!392552)))))

(assert (= (and d!84390 c!11634) b!252950))

(assert (= (and d!84390 (not c!11634)) b!252953))

(assert (= (and d!84390 res!211968) b!252951))

(assert (= (and b!252951 res!211967) b!252952))

(assert (= (and b!252952 res!211966) b!252954))

(assert (=> b!252950 m!380357))

(declare-fun m!380695 () Bool)

(assert (=> b!252950 m!380695))

(declare-fun m!380697 () Bool)

(assert (=> b!252950 m!380697))

(declare-fun m!380699 () Bool)

(assert (=> b!252951 m!380699))

(declare-fun m!380701 () Bool)

(assert (=> d!84390 m!380701))

(assert (=> d!84390 m!380571))

(declare-fun m!380703 () Bool)

(assert (=> d!84390 m!380703))

(declare-fun m!380705 () Bool)

(assert (=> d!84390 m!380705))

(assert (=> d!84390 m!380577))

(assert (=> d!84390 m!380395))

(declare-fun m!380707 () Bool)

(assert (=> d!84390 m!380707))

(declare-fun m!380709 () Bool)

(assert (=> d!84390 m!380709))

(declare-fun m!380711 () Bool)

(assert (=> d!84390 m!380711))

(declare-fun m!380713 () Bool)

(assert (=> d!84390 m!380713))

(declare-fun m!380715 () Bool)

(assert (=> d!84390 m!380715))

(declare-fun m!380717 () Bool)

(assert (=> b!252954 m!380717))

(assert (=> b!252954 m!380335))

(assert (=> b!252954 m!380357))

(declare-fun m!380719 () Bool)

(assert (=> b!252952 m!380719))

(assert (=> b!252783 d!84390))

(declare-fun d!84392 () Bool)

(assert (=> d!84392 (= (array_inv!5771 (buf!6532 thiss!1005)) (bvsge (size!6030 (buf!6532 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!252777 d!84392))

(declare-fun d!84394 () Bool)

(assert (=> d!84394 (= (invariant!0 (currentBit!11982 thiss!1005) (currentByte!11987 thiss!1005) (size!6030 (buf!6532 (_2!11803 lt!392547)))) (and (bvsge (currentBit!11982 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11982 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11987 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11987 thiss!1005) (size!6030 (buf!6532 (_2!11803 lt!392547)))) (and (= (currentBit!11982 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11987 thiss!1005) (size!6030 (buf!6532 (_2!11803 lt!392547))))))))))

(assert (=> b!252776 d!84394))

(declare-fun d!84396 () Bool)

(declare-fun e!175267 () Bool)

(assert (=> d!84396 e!175267))

(declare-fun res!211971 () Bool)

(assert (=> d!84396 (=> (not res!211971) (not e!175267))))

(declare-fun lt!392964 () (_ BitVec 64))

(declare-fun lt!392963 () BitStream!10982)

(assert (=> d!84396 (= res!211971 (= (bvadd lt!392964 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!6030 (buf!6532 lt!392963)) (currentByte!11987 lt!392963) (currentBit!11982 lt!392963))))))

(assert (=> d!84396 (or (not (= (bvand lt!392964 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!392964 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!392964 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84396 (= lt!392964 (bitIndex!0 (size!6030 (buf!6532 (_1!11805 lt!392558))) (currentByte!11987 (_1!11805 lt!392558)) (currentBit!11982 (_1!11805 lt!392558))))))

(declare-fun moveBitIndex!0 (BitStream!10982 (_ BitVec 64)) tuple2!21750)

(assert (=> d!84396 (= lt!392963 (_2!11803 (moveBitIndex!0 (_1!11805 lt!392558) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!10982 (_ BitVec 64)) Bool)

(assert (=> d!84396 (moveBitIndexPrecond!0 (_1!11805 lt!392558) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!84396 (= (withMovedBitIndex!0 (_1!11805 lt!392558) #b0000000000000000000000000000000000000000000000000000000000000001) lt!392963)))

(declare-fun b!252957 () Bool)

(assert (=> b!252957 (= e!175267 (= (size!6030 (buf!6532 (_1!11805 lt!392558))) (size!6030 (buf!6532 lt!392963))))))

(assert (= (and d!84396 res!211971) b!252957))

(declare-fun m!380721 () Bool)

(assert (=> d!84396 m!380721))

(declare-fun m!380723 () Bool)

(assert (=> d!84396 m!380723))

(declare-fun m!380725 () Bool)

(assert (=> d!84396 m!380725))

(declare-fun m!380727 () Bool)

(assert (=> d!84396 m!380727))

(assert (=> b!252775 d!84396))

(declare-fun d!84398 () Bool)

(declare-fun e!175268 () Bool)

(assert (=> d!84398 e!175268))

(declare-fun res!211972 () Bool)

(assert (=> d!84398 (=> (not res!211972) (not e!175268))))

(declare-fun lt!392965 () (_ BitVec 64))

(declare-fun lt!392967 () (_ BitVec 64))

(declare-fun lt!392970 () (_ BitVec 64))

(assert (=> d!84398 (= res!211972 (= lt!392967 (bvsub lt!392965 lt!392970)))))

(assert (=> d!84398 (or (= (bvand lt!392965 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!392970 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!392965 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!392965 lt!392970) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84398 (= lt!392970 (remainingBits!0 ((_ sign_extend 32) (size!6030 (buf!6532 (_1!11804 lt!392557)))) ((_ sign_extend 32) (currentByte!11987 (_1!11804 lt!392557))) ((_ sign_extend 32) (currentBit!11982 (_1!11804 lt!392557)))))))

(declare-fun lt!392968 () (_ BitVec 64))

(declare-fun lt!392969 () (_ BitVec 64))

(assert (=> d!84398 (= lt!392965 (bvmul lt!392968 lt!392969))))

(assert (=> d!84398 (or (= lt!392968 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!392969 (bvsdiv (bvmul lt!392968 lt!392969) lt!392968)))))

(assert (=> d!84398 (= lt!392969 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84398 (= lt!392968 ((_ sign_extend 32) (size!6030 (buf!6532 (_1!11804 lt!392557)))))))

(assert (=> d!84398 (= lt!392967 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11987 (_1!11804 lt!392557))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11982 (_1!11804 lt!392557)))))))

(assert (=> d!84398 (invariant!0 (currentBit!11982 (_1!11804 lt!392557)) (currentByte!11987 (_1!11804 lt!392557)) (size!6030 (buf!6532 (_1!11804 lt!392557))))))

(assert (=> d!84398 (= (bitIndex!0 (size!6030 (buf!6532 (_1!11804 lt!392557))) (currentByte!11987 (_1!11804 lt!392557)) (currentBit!11982 (_1!11804 lt!392557))) lt!392967)))

(declare-fun b!252958 () Bool)

(declare-fun res!211973 () Bool)

(assert (=> b!252958 (=> (not res!211973) (not e!175268))))

(assert (=> b!252958 (= res!211973 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!392967))))

(declare-fun b!252959 () Bool)

(declare-fun lt!392966 () (_ BitVec 64))

(assert (=> b!252959 (= e!175268 (bvsle lt!392967 (bvmul lt!392966 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!252959 (or (= lt!392966 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!392966 #b0000000000000000000000000000000000000000000000000000000000001000) lt!392966)))))

(assert (=> b!252959 (= lt!392966 ((_ sign_extend 32) (size!6030 (buf!6532 (_1!11804 lt!392557)))))))

(assert (= (and d!84398 res!211972) b!252958))

(assert (= (and b!252958 res!211973) b!252959))

(declare-fun m!380729 () Bool)

(assert (=> d!84398 m!380729))

(declare-fun m!380731 () Bool)

(assert (=> d!84398 m!380731))

(assert (=> b!252779 d!84398))

(declare-fun d!84400 () Bool)

(declare-fun e!175269 () Bool)

(assert (=> d!84400 e!175269))

(declare-fun res!211974 () Bool)

(assert (=> d!84400 (=> (not res!211974) (not e!175269))))

(declare-fun lt!392971 () (_ BitVec 64))

(declare-fun lt!392976 () (_ BitVec 64))

(declare-fun lt!392973 () (_ BitVec 64))

(assert (=> d!84400 (= res!211974 (= lt!392973 (bvsub lt!392971 lt!392976)))))

(assert (=> d!84400 (or (= (bvand lt!392971 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!392976 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!392971 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!392971 lt!392976) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84400 (= lt!392976 (remainingBits!0 ((_ sign_extend 32) (size!6030 (buf!6532 (_2!11803 lt!392552)))) ((_ sign_extend 32) (currentByte!11987 (_2!11803 lt!392552))) ((_ sign_extend 32) (currentBit!11982 (_2!11803 lt!392552)))))))

(declare-fun lt!392974 () (_ BitVec 64))

(declare-fun lt!392975 () (_ BitVec 64))

(assert (=> d!84400 (= lt!392971 (bvmul lt!392974 lt!392975))))

(assert (=> d!84400 (or (= lt!392974 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!392975 (bvsdiv (bvmul lt!392974 lt!392975) lt!392974)))))

(assert (=> d!84400 (= lt!392975 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84400 (= lt!392974 ((_ sign_extend 32) (size!6030 (buf!6532 (_2!11803 lt!392552)))))))

(assert (=> d!84400 (= lt!392973 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11987 (_2!11803 lt!392552))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11982 (_2!11803 lt!392552)))))))

(assert (=> d!84400 (invariant!0 (currentBit!11982 (_2!11803 lt!392552)) (currentByte!11987 (_2!11803 lt!392552)) (size!6030 (buf!6532 (_2!11803 lt!392552))))))

(assert (=> d!84400 (= (bitIndex!0 (size!6030 (buf!6532 (_2!11803 lt!392552))) (currentByte!11987 (_2!11803 lt!392552)) (currentBit!11982 (_2!11803 lt!392552))) lt!392973)))

(declare-fun b!252960 () Bool)

(declare-fun res!211975 () Bool)

(assert (=> b!252960 (=> (not res!211975) (not e!175269))))

(assert (=> b!252960 (= res!211975 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!392973))))

(declare-fun b!252961 () Bool)

(declare-fun lt!392972 () (_ BitVec 64))

(assert (=> b!252961 (= e!175269 (bvsle lt!392973 (bvmul lt!392972 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!252961 (or (= lt!392972 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!392972 #b0000000000000000000000000000000000000000000000000000000000001000) lt!392972)))))

(assert (=> b!252961 (= lt!392972 ((_ sign_extend 32) (size!6030 (buf!6532 (_2!11803 lt!392552)))))))

(assert (= (and d!84400 res!211974) b!252960))

(assert (= (and b!252960 res!211975) b!252961))

(declare-fun m!380733 () Bool)

(assert (=> d!84400 m!380733))

(declare-fun m!380735 () Bool)

(assert (=> d!84400 m!380735))

(assert (=> b!252778 d!84400))

(assert (=> b!252778 d!84346))

(push 1)

(assert (not d!84400))

(assert (not b!252932))

(assert (not d!84352))

(assert (not b!252879))

(assert (not d!84372))

(assert (not d!84354))

(assert (not b!252952))

(assert (not d!84380))

(assert (not d!84358))

(assert (not b!252901))

(assert (not d!84370))

(assert (not d!84376))

(assert (not b!252947))

(assert (not d!84398))

(assert (not d!84360))

(assert (not d!84356))

(assert (not b!252883))

(assert (not d!84374))

(assert (not b!252929))

(assert (not b!252946))

(assert (not b!252922))

(assert (not d!84324))

(assert (not b!252921))

(assert (not b!252923))

(assert (not b!252954))

(assert (not b!252949))

(assert (not b!252951))

(assert (not b!252950))

(assert (not b!252948))

(assert (not b!252927))

(assert (not d!84334))

(assert (not b!252924))

(assert (not b!252900))

(assert (not d!84346))

(assert (not d!84382))

(assert (not b!252898))

(assert (not d!84388))

(assert (not d!84396))

(assert (not d!84318))

(assert (not d!84362))

(assert (not d!84348))

(assert (not d!84340))

(assert (not b!252880))

(assert (not d!84386))

(assert (not b!252881))

(assert (not b!252903))

(assert (not d!84368))

(assert (not d!84320))

(assert (not d!84384))

(assert (not b!252891))

(assert (not d!84364))

(assert (not d!84378))

(assert (not d!84390))

(assert (not d!84322))

(assert (not d!84350))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!84642 () Bool)

(declare-fun res!212220 () Bool)

(declare-fun e!175473 () Bool)

(assert (=> d!84642 (=> (not res!212220) (not e!175473))))

(assert (=> d!84642 (= res!212220 (= (size!6030 (buf!6532 (_2!11805 lt!392943))) (size!6030 (buf!6532 (_2!11803 lt!392552)))))))

(assert (=> d!84642 (= (isPrefixOf!0 (_2!11805 lt!392943) (_2!11803 lt!392552)) e!175473)))

(declare-fun b!253258 () Bool)

(declare-fun res!212222 () Bool)

(assert (=> b!253258 (=> (not res!212222) (not e!175473))))

(assert (=> b!253258 (= res!212222 (bvsle (bitIndex!0 (size!6030 (buf!6532 (_2!11805 lt!392943))) (currentByte!11987 (_2!11805 lt!392943)) (currentBit!11982 (_2!11805 lt!392943))) (bitIndex!0 (size!6030 (buf!6532 (_2!11803 lt!392552))) (currentByte!11987 (_2!11803 lt!392552)) (currentBit!11982 (_2!11803 lt!392552)))))))

(declare-fun b!253259 () Bool)

(declare-fun e!175472 () Bool)

(assert (=> b!253259 (= e!175473 e!175472)))

(declare-fun res!212221 () Bool)

(assert (=> b!253259 (=> res!212221 e!175472)))

(assert (=> b!253259 (= res!212221 (= (size!6030 (buf!6532 (_2!11805 lt!392943))) #b00000000000000000000000000000000))))

(declare-fun b!253260 () Bool)

(assert (=> b!253260 (= e!175472 (arrayBitRangesEq!0 (buf!6532 (_2!11805 lt!392943)) (buf!6532 (_2!11803 lt!392552)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6030 (buf!6532 (_2!11805 lt!392943))) (currentByte!11987 (_2!11805 lt!392943)) (currentBit!11982 (_2!11805 lt!392943)))))))

(assert (= (and d!84642 res!212220) b!253258))

(assert (= (and b!253258 res!212222) b!253259))

(assert (= (and b!253259 (not res!212221)) b!253260))

(declare-fun m!381245 () Bool)

(assert (=> b!253258 m!381245))

(assert (=> b!253258 m!380335))

(assert (=> b!253260 m!381245))

(assert (=> b!253260 m!381245))

(declare-fun m!381247 () Bool)

(assert (=> b!253260 m!381247))

(assert (=> b!252952 d!84642))

(declare-fun d!84644 () Bool)

(declare-fun res!212236 () Bool)

(declare-fun e!175490 () Bool)

(assert (=> d!84644 (=> res!212236 e!175490)))

(assert (=> d!84644 (= res!212236 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6030 (buf!6532 thiss!1005)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005))))))

(assert (=> d!84644 (= (arrayBitRangesEq!0 (buf!6532 thiss!1005) (buf!6532 (_2!11803 lt!392552)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6030 (buf!6532 thiss!1005)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005))) e!175490)))

(declare-fun b!253275 () Bool)

(declare-fun e!175491 () Bool)

(declare-fun e!175487 () Bool)

(assert (=> b!253275 (= e!175491 e!175487)))

(declare-fun lt!393438 () (_ BitVec 32))

(declare-fun res!212235 () Bool)

(declare-datatypes ((tuple4!298 0))(
  ( (tuple4!299 (_1!11810 (_ BitVec 32)) (_2!11810 (_ BitVec 32)) (_3!929 (_ BitVec 32)) (_4!149 (_ BitVec 32))) )
))
(declare-fun lt!393439 () tuple4!298)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!253275 (= res!212235 (byteRangesEq!0 (select (arr!7017 (buf!6532 thiss!1005)) (_3!929 lt!393439)) (select (arr!7017 (buf!6532 (_2!11803 lt!392552))) (_3!929 lt!393439)) lt!393438 #b00000000000000000000000000001000))))

(assert (=> b!253275 (=> (not res!212235) (not e!175487))))

(declare-fun b!253276 () Bool)

(declare-fun e!175486 () Bool)

(declare-fun arrayRangesEq!926 (array!13742 array!13742 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!253276 (= e!175486 (arrayRangesEq!926 (buf!6532 thiss!1005) (buf!6532 (_2!11803 lt!392552)) (_1!11810 lt!393439) (_2!11810 lt!393439)))))

(declare-fun b!253277 () Bool)

(declare-fun e!175489 () Bool)

(assert (=> b!253277 (= e!175490 e!175489)))

(declare-fun res!212234 () Bool)

(assert (=> b!253277 (=> (not res!212234) (not e!175489))))

(assert (=> b!253277 (= res!212234 e!175486)))

(declare-fun res!212233 () Bool)

(assert (=> b!253277 (=> res!212233 e!175486)))

(assert (=> b!253277 (= res!212233 (bvsge (_1!11810 lt!393439) (_2!11810 lt!393439)))))

(declare-fun lt!393440 () (_ BitVec 32))

(assert (=> b!253277 (= lt!393440 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6030 (buf!6532 thiss!1005)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253277 (= lt!393438 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!298)

(assert (=> b!253277 (= lt!393439 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6030 (buf!6532 thiss!1005)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005))))))

(declare-fun b!253278 () Bool)

(declare-fun call!3976 () Bool)

(assert (=> b!253278 (= e!175491 call!3976)))

(declare-fun b!253279 () Bool)

(declare-fun res!212237 () Bool)

(assert (=> b!253279 (= res!212237 (= lt!393440 #b00000000000000000000000000000000))))

(declare-fun e!175488 () Bool)

(assert (=> b!253279 (=> res!212237 e!175488)))

(assert (=> b!253279 (= e!175487 e!175488)))

(declare-fun bm!3973 () Bool)

(declare-fun c!11659 () Bool)

(assert (=> bm!3973 (= call!3976 (byteRangesEq!0 (ite c!11659 (select (arr!7017 (buf!6532 thiss!1005)) (_3!929 lt!393439)) (select (arr!7017 (buf!6532 thiss!1005)) (_4!149 lt!393439))) (ite c!11659 (select (arr!7017 (buf!6532 (_2!11803 lt!392552))) (_3!929 lt!393439)) (select (arr!7017 (buf!6532 (_2!11803 lt!392552))) (_4!149 lt!393439))) (ite c!11659 lt!393438 #b00000000000000000000000000000000) lt!393440))))

(declare-fun b!253280 () Bool)

(assert (=> b!253280 (= e!175488 call!3976)))

(declare-fun b!253281 () Bool)

(assert (=> b!253281 (= e!175489 e!175491)))

(assert (=> b!253281 (= c!11659 (= (_3!929 lt!393439) (_4!149 lt!393439)))))

(assert (= (and d!84644 (not res!212236)) b!253277))

(assert (= (and b!253277 (not res!212233)) b!253276))

(assert (= (and b!253277 res!212234) b!253281))

(assert (= (and b!253281 c!11659) b!253278))

(assert (= (and b!253281 (not c!11659)) b!253275))

(assert (= (and b!253275 res!212235) b!253279))

(assert (= (and b!253279 (not res!212237)) b!253280))

(assert (= (or b!253278 b!253280) bm!3973))

(declare-fun m!381249 () Bool)

(assert (=> b!253275 m!381249))

(declare-fun m!381251 () Bool)

(assert (=> b!253275 m!381251))

(assert (=> b!253275 m!381249))

(assert (=> b!253275 m!381251))

(declare-fun m!381253 () Bool)

(assert (=> b!253275 m!381253))

(declare-fun m!381255 () Bool)

(assert (=> b!253276 m!381255))

(assert (=> b!253277 m!380357))

(declare-fun m!381257 () Bool)

(assert (=> b!253277 m!381257))

(declare-fun m!381259 () Bool)

(assert (=> bm!3973 m!381259))

(declare-fun m!381261 () Bool)

(assert (=> bm!3973 m!381261))

(assert (=> bm!3973 m!381251))

(declare-fun m!381263 () Bool)

(assert (=> bm!3973 m!381263))

(assert (=> bm!3973 m!381249))

(assert (=> b!252929 d!84644))

(assert (=> b!252929 d!84348))

(declare-fun d!84646 () Bool)

(declare-fun lt!393441 () tuple2!21758)

(assert (=> d!84646 (= lt!393441 (readBit!0 (readerFrom!0 (_2!11803 lt!392877) (currentBit!11982 thiss!1005) (currentByte!11987 thiss!1005))))))

(assert (=> d!84646 (= (readBitPure!0 (readerFrom!0 (_2!11803 lt!392877) (currentBit!11982 thiss!1005) (currentByte!11987 thiss!1005))) (tuple2!21753 (_2!11807 lt!393441) (_1!11807 lt!393441)))))

(declare-fun bs!21435 () Bool)

(assert (= bs!21435 d!84646))

(assert (=> bs!21435 m!380633))

(declare-fun m!381265 () Bool)

(assert (=> bs!21435 m!381265))

(assert (=> b!252923 d!84646))

(declare-fun d!84648 () Bool)

(declare-fun e!175492 () Bool)

(assert (=> d!84648 e!175492))

(declare-fun res!212238 () Bool)

(assert (=> d!84648 (=> (not res!212238) (not e!175492))))

(assert (=> d!84648 (= res!212238 (invariant!0 (currentBit!11982 (_2!11803 lt!392877)) (currentByte!11987 (_2!11803 lt!392877)) (size!6030 (buf!6532 (_2!11803 lt!392877)))))))

(assert (=> d!84648 (= (readerFrom!0 (_2!11803 lt!392877) (currentBit!11982 thiss!1005) (currentByte!11987 thiss!1005)) (BitStream!10983 (buf!6532 (_2!11803 lt!392877)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005)))))

(declare-fun b!253282 () Bool)

(assert (=> b!253282 (= e!175492 (invariant!0 (currentBit!11982 thiss!1005) (currentByte!11987 thiss!1005) (size!6030 (buf!6532 (_2!11803 lt!392877)))))))

(assert (= (and d!84648 res!212238) b!253282))

(declare-fun m!381267 () Bool)

(assert (=> d!84648 m!381267))

(declare-fun m!381269 () Bool)

(assert (=> b!253282 m!381269))

(assert (=> b!252923 d!84648))

(declare-fun d!84650 () Bool)

(declare-fun e!175493 () Bool)

(assert (=> d!84650 e!175493))

(declare-fun res!212239 () Bool)

(assert (=> d!84650 (=> (not res!212239) (not e!175493))))

(declare-fun lt!393444 () (_ BitVec 64))

(declare-fun lt!393447 () (_ BitVec 64))

(declare-fun lt!393442 () (_ BitVec 64))

(assert (=> d!84650 (= res!212239 (= lt!393444 (bvsub lt!393442 lt!393447)))))

(assert (=> d!84650 (or (= (bvand lt!393442 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!393447 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!393442 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!393442 lt!393447) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84650 (= lt!393447 (remainingBits!0 ((_ sign_extend 32) (size!6030 (buf!6532 (_2!11803 lt!392877)))) ((_ sign_extend 32) (currentByte!11987 (_2!11803 lt!392877))) ((_ sign_extend 32) (currentBit!11982 (_2!11803 lt!392877)))))))

(declare-fun lt!393445 () (_ BitVec 64))

(declare-fun lt!393446 () (_ BitVec 64))

(assert (=> d!84650 (= lt!393442 (bvmul lt!393445 lt!393446))))

(assert (=> d!84650 (or (= lt!393445 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!393446 (bvsdiv (bvmul lt!393445 lt!393446) lt!393445)))))

(assert (=> d!84650 (= lt!393446 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84650 (= lt!393445 ((_ sign_extend 32) (size!6030 (buf!6532 (_2!11803 lt!392877)))))))

(assert (=> d!84650 (= lt!393444 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11987 (_2!11803 lt!392877))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11982 (_2!11803 lt!392877)))))))

(assert (=> d!84650 (invariant!0 (currentBit!11982 (_2!11803 lt!392877)) (currentByte!11987 (_2!11803 lt!392877)) (size!6030 (buf!6532 (_2!11803 lt!392877))))))

(assert (=> d!84650 (= (bitIndex!0 (size!6030 (buf!6532 (_2!11803 lt!392877))) (currentByte!11987 (_2!11803 lt!392877)) (currentBit!11982 (_2!11803 lt!392877))) lt!393444)))

(declare-fun b!253283 () Bool)

(declare-fun res!212240 () Bool)

(assert (=> b!253283 (=> (not res!212240) (not e!175493))))

(assert (=> b!253283 (= res!212240 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!393444))))

(declare-fun b!253284 () Bool)

(declare-fun lt!393443 () (_ BitVec 64))

(assert (=> b!253284 (= e!175493 (bvsle lt!393444 (bvmul lt!393443 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253284 (or (= lt!393443 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!393443 #b0000000000000000000000000000000000000000000000000000000000001000) lt!393443)))))

(assert (=> b!253284 (= lt!393443 ((_ sign_extend 32) (size!6030 (buf!6532 (_2!11803 lt!392877)))))))

(assert (= (and d!84650 res!212239) b!253283))

(assert (= (and b!253283 res!212240) b!253284))

(declare-fun m!381271 () Bool)

(assert (=> d!84650 m!381271))

(assert (=> d!84650 m!381267))

(assert (=> b!252921 d!84650))

(assert (=> b!252921 d!84348))

(declare-fun d!84652 () Bool)

(declare-fun res!212244 () Bool)

(declare-fun e!175498 () Bool)

(assert (=> d!84652 (=> res!212244 e!175498)))

(assert (=> d!84652 (= res!212244 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6030 (buf!6532 (_2!11803 lt!392547))) (currentByte!11987 (_2!11803 lt!392547)) (currentBit!11982 (_2!11803 lt!392547)))))))

(assert (=> d!84652 (= (arrayBitRangesEq!0 (buf!6532 (_2!11803 lt!392547)) (buf!6532 (_2!11803 lt!392552)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6030 (buf!6532 (_2!11803 lt!392547))) (currentByte!11987 (_2!11803 lt!392547)) (currentBit!11982 (_2!11803 lt!392547)))) e!175498)))

(declare-fun b!253285 () Bool)

(declare-fun e!175499 () Bool)

(declare-fun e!175495 () Bool)

(assert (=> b!253285 (= e!175499 e!175495)))

(declare-fun lt!393448 () (_ BitVec 32))

(declare-fun lt!393449 () tuple4!298)

(declare-fun res!212243 () Bool)

(assert (=> b!253285 (= res!212243 (byteRangesEq!0 (select (arr!7017 (buf!6532 (_2!11803 lt!392547))) (_3!929 lt!393449)) (select (arr!7017 (buf!6532 (_2!11803 lt!392552))) (_3!929 lt!393449)) lt!393448 #b00000000000000000000000000001000))))

(assert (=> b!253285 (=> (not res!212243) (not e!175495))))

(declare-fun b!253286 () Bool)

(declare-fun e!175494 () Bool)

(assert (=> b!253286 (= e!175494 (arrayRangesEq!926 (buf!6532 (_2!11803 lt!392547)) (buf!6532 (_2!11803 lt!392552)) (_1!11810 lt!393449) (_2!11810 lt!393449)))))

(declare-fun b!253287 () Bool)

(declare-fun e!175497 () Bool)

(assert (=> b!253287 (= e!175498 e!175497)))

(declare-fun res!212242 () Bool)

(assert (=> b!253287 (=> (not res!212242) (not e!175497))))

(assert (=> b!253287 (= res!212242 e!175494)))

(declare-fun res!212241 () Bool)

(assert (=> b!253287 (=> res!212241 e!175494)))

(assert (=> b!253287 (= res!212241 (bvsge (_1!11810 lt!393449) (_2!11810 lt!393449)))))

(declare-fun lt!393450 () (_ BitVec 32))

(assert (=> b!253287 (= lt!393450 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6030 (buf!6532 (_2!11803 lt!392547))) (currentByte!11987 (_2!11803 lt!392547)) (currentBit!11982 (_2!11803 lt!392547))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253287 (= lt!393448 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253287 (= lt!393449 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6030 (buf!6532 (_2!11803 lt!392547))) (currentByte!11987 (_2!11803 lt!392547)) (currentBit!11982 (_2!11803 lt!392547)))))))

(declare-fun b!253288 () Bool)

(declare-fun call!3977 () Bool)

(assert (=> b!253288 (= e!175499 call!3977)))

(declare-fun b!253289 () Bool)

(declare-fun res!212245 () Bool)

(assert (=> b!253289 (= res!212245 (= lt!393450 #b00000000000000000000000000000000))))

(declare-fun e!175496 () Bool)

(assert (=> b!253289 (=> res!212245 e!175496)))

(assert (=> b!253289 (= e!175495 e!175496)))

(declare-fun bm!3974 () Bool)

(declare-fun c!11660 () Bool)

(assert (=> bm!3974 (= call!3977 (byteRangesEq!0 (ite c!11660 (select (arr!7017 (buf!6532 (_2!11803 lt!392547))) (_3!929 lt!393449)) (select (arr!7017 (buf!6532 (_2!11803 lt!392547))) (_4!149 lt!393449))) (ite c!11660 (select (arr!7017 (buf!6532 (_2!11803 lt!392552))) (_3!929 lt!393449)) (select (arr!7017 (buf!6532 (_2!11803 lt!392552))) (_4!149 lt!393449))) (ite c!11660 lt!393448 #b00000000000000000000000000000000) lt!393450))))

(declare-fun b!253290 () Bool)

(assert (=> b!253290 (= e!175496 call!3977)))

(declare-fun b!253291 () Bool)

(assert (=> b!253291 (= e!175497 e!175499)))

(assert (=> b!253291 (= c!11660 (= (_3!929 lt!393449) (_4!149 lt!393449)))))

(assert (= (and d!84652 (not res!212244)) b!253287))

(assert (= (and b!253287 (not res!212241)) b!253286))

(assert (= (and b!253287 res!212242) b!253291))

(assert (= (and b!253291 c!11660) b!253288))

(assert (= (and b!253291 (not c!11660)) b!253285))

(assert (= (and b!253285 res!212243) b!253289))

(assert (= (and b!253289 (not res!212245)) b!253290))

(assert (= (or b!253288 b!253290) bm!3974))

(declare-fun m!381273 () Bool)

(assert (=> b!253285 m!381273))

(declare-fun m!381275 () Bool)

(assert (=> b!253285 m!381275))

(assert (=> b!253285 m!381273))

(assert (=> b!253285 m!381275))

(declare-fun m!381277 () Bool)

(assert (=> b!253285 m!381277))

(declare-fun m!381279 () Bool)

(assert (=> b!253286 m!381279))

(assert (=> b!253287 m!380337))

(declare-fun m!381281 () Bool)

(assert (=> b!253287 m!381281))

(declare-fun m!381283 () Bool)

(assert (=> bm!3974 m!381283))

(declare-fun m!381285 () Bool)

(assert (=> bm!3974 m!381285))

(assert (=> bm!3974 m!381275))

(declare-fun m!381287 () Bool)

(assert (=> bm!3974 m!381287))

(assert (=> bm!3974 m!381273))

(assert (=> b!252900 d!84652))

(assert (=> b!252900 d!84346))

(declare-fun b!253310 () Bool)

(declare-fun e!175512 () tuple2!21758)

(assert (=> b!253310 (= e!175512 (tuple2!21759 true (_1!11805 lt!392548)))))

(declare-fun b!253311 () Bool)

(declare-fun res!212260 () Bool)

(declare-fun e!175510 () Bool)

(assert (=> b!253311 (=> (not res!212260) (not e!175510))))

(declare-fun lt!393481 () tuple2!21758)

(assert (=> b!253311 (= res!212260 (and (= (buf!6532 (_1!11805 lt!392548)) (buf!6532 (_2!11807 lt!393481))) (or (not (= nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289))) (_1!11807 lt!393481))))))

(declare-fun lt!393476 () (_ BitVec 64))

(declare-fun b!253312 () Bool)

(declare-fun e!175514 () Bool)

(assert (=> b!253312 (= e!175514 (= (bvsub lt!393476 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (bitIndex!0 (size!6030 (buf!6532 (_2!11807 lt!393481))) (currentByte!11987 (_2!11807 lt!393481)) (currentBit!11982 (_2!11807 lt!393481)))))))

(assert (=> b!253312 (or (= (bvand lt!393476 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!393476 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!393476 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!393473 () (_ BitVec 64))

(assert (=> b!253312 (= lt!393476 (bvadd lt!393473 nBits!297))))

(assert (=> b!253312 (or (not (= (bvand lt!393473 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!393473 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!393473 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!253312 (= lt!393473 (bitIndex!0 (size!6030 (buf!6532 (_1!11805 lt!392548))) (currentByte!11987 (_1!11805 lt!392548)) (currentBit!11982 (_1!11805 lt!392548))))))

(declare-fun b!253313 () Bool)

(declare-fun e!175513 () Bool)

(assert (=> b!253313 (= e!175510 e!175513)))

(declare-fun res!212256 () Bool)

(assert (=> b!253313 (=> res!212256 e!175513)))

(assert (=> b!253313 (= res!212256 (or (not (_1!11807 lt!393481)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) nBits!297)))))

(declare-fun d!84654 () Bool)

(assert (=> d!84654 e!175510))

(declare-fun res!212258 () Bool)

(assert (=> d!84654 (=> (not res!212258) (not e!175510))))

(declare-fun lt!393475 () (_ BitVec 64))

(assert (=> d!84654 (= res!212258 (bvsge (bvsub lt!393475 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (bitIndex!0 (size!6030 (buf!6532 (_2!11807 lt!393481))) (currentByte!11987 (_2!11807 lt!393481)) (currentBit!11982 (_2!11807 lt!393481)))))))

(assert (=> d!84654 (or (= (bvand lt!393475 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!393475 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!393475 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!393477 () (_ BitVec 64))

(assert (=> d!84654 (= lt!393475 (bvadd lt!393477 nBits!297))))

(assert (=> d!84654 (or (not (= (bvand lt!393477 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!393477 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!393477 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84654 (= lt!393477 (bitIndex!0 (size!6030 (buf!6532 (_1!11805 lt!392548))) (currentByte!11987 (_1!11805 lt!392548)) (currentBit!11982 (_1!11805 lt!392548))))))

(assert (=> d!84654 (= lt!393481 e!175512)))

(declare-fun c!11666 () Bool)

(assert (=> d!84654 (= c!11666 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) nBits!297))))

(assert (=> d!84654 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!84654 (= (checkBitsLoop!0 (_1!11805 lt!392548) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!393481)))

(declare-fun b!253314 () Bool)

(declare-fun e!175511 () tuple2!21758)

(assert (=> b!253314 (= e!175512 e!175511)))

(declare-fun lt!393483 () tuple2!21758)

(assert (=> b!253314 (= lt!393483 (readBit!0 (_1!11805 lt!392548)))))

(declare-fun c!11665 () Bool)

(assert (=> b!253314 (= c!11665 (not (= (_1!11807 lt!393483) bit!26)))))

(declare-fun b!253315 () Bool)

(assert (=> b!253315 (= e!175513 (= bit!26 (_2!11804 (readBitPure!0 (_1!11805 lt!392548)))))))

(declare-fun b!253316 () Bool)

(declare-fun res!212257 () Bool)

(assert (=> b!253316 (=> (not res!212257) (not e!175510))))

(assert (=> b!253316 (= res!212257 e!175514)))

(declare-fun res!212259 () Bool)

(assert (=> b!253316 (=> res!212259 e!175514)))

(assert (=> b!253316 (= res!212259 (not (_1!11807 lt!393481)))))

(declare-fun b!253317 () Bool)

(declare-fun lt!393479 () tuple2!21758)

(assert (=> b!253317 (= lt!393479 (checkBitsLoop!0 (_2!11807 lt!393483) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!393480 () Unit!18208)

(declare-fun lt!393474 () Unit!18208)

(assert (=> b!253317 (= lt!393480 lt!393474)))

(declare-fun lt!393482 () (_ BitVec 64))

(declare-fun lt!393478 () (_ BitVec 64))

(assert (=> b!253317 (validate_offset_bits!1 ((_ sign_extend 32) (size!6030 (buf!6532 (_2!11807 lt!393483)))) ((_ sign_extend 32) (currentByte!11987 (_2!11807 lt!393483))) ((_ sign_extend 32) (currentBit!11982 (_2!11807 lt!393483))) (bvsub lt!393482 lt!393478))))

(assert (=> b!253317 (= lt!393474 (validateOffsetBitsIneqLemma!0 (_1!11805 lt!392548) (_2!11807 lt!393483) lt!393482 lt!393478))))

(assert (=> b!253317 (= lt!393478 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!253317 (= lt!393482 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!253317 (= e!175511 (tuple2!21759 (_1!11807 lt!393479) (_2!11807 lt!393479)))))

(declare-fun b!253318 () Bool)

(assert (=> b!253318 (= e!175511 (tuple2!21759 false (_2!11807 lt!393483)))))

(assert (= (and d!84654 c!11666) b!253310))

(assert (= (and d!84654 (not c!11666)) b!253314))

(assert (= (and b!253314 c!11665) b!253318))

(assert (= (and b!253314 (not c!11665)) b!253317))

(assert (= (and d!84654 res!212258) b!253311))

(assert (= (and b!253311 res!212260) b!253316))

(assert (= (and b!253316 (not res!212259)) b!253312))

(assert (= (and b!253316 res!212257) b!253313))

(assert (= (and b!253313 (not res!212256)) b!253315))

(declare-fun m!381289 () Bool)

(assert (=> b!253312 m!381289))

(declare-fun m!381291 () Bool)

(assert (=> b!253312 m!381291))

(declare-fun m!381293 () Bool)

(assert (=> b!253315 m!381293))

(assert (=> d!84654 m!381289))

(assert (=> d!84654 m!381291))

(declare-fun m!381295 () Bool)

(assert (=> b!253317 m!381295))

(declare-fun m!381297 () Bool)

(assert (=> b!253317 m!381297))

(declare-fun m!381299 () Bool)

(assert (=> b!253317 m!381299))

(declare-fun m!381301 () Bool)

(assert (=> b!253314 m!381301))

(assert (=> d!84318 d!84654))

(declare-fun d!84656 () Bool)

(assert (=> d!84656 (= (remainingBits!0 ((_ sign_extend 32) (size!6030 (buf!6532 (_2!11803 lt!392552)))) ((_ sign_extend 32) (currentByte!11987 (_2!11803 lt!392547))) ((_ sign_extend 32) (currentBit!11982 (_2!11803 lt!392547)))) (bvsub (bvmul ((_ sign_extend 32) (size!6030 (buf!6532 (_2!11803 lt!392552)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11987 (_2!11803 lt!392547))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11982 (_2!11803 lt!392547))))))))

(assert (=> d!84358 d!84656))

(declare-fun d!84658 () Bool)

(declare-fun e!175515 () Bool)

(assert (=> d!84658 e!175515))

(declare-fun res!212261 () Bool)

(assert (=> d!84658 (=> (not res!212261) (not e!175515))))

(declare-fun lt!393484 () BitStream!10982)

(declare-fun lt!393485 () (_ BitVec 64))

(assert (=> d!84658 (= res!212261 (= (bvadd lt!393485 (bvsub lt!392941 lt!392950)) (bitIndex!0 (size!6030 (buf!6532 lt!393484)) (currentByte!11987 lt!393484) (currentBit!11982 lt!393484))))))

(assert (=> d!84658 (or (not (= (bvand lt!393485 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!392941 lt!392950) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!393485 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!393485 (bvsub lt!392941 lt!392950)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84658 (= lt!393485 (bitIndex!0 (size!6030 (buf!6532 (_2!11805 lt!392943))) (currentByte!11987 (_2!11805 lt!392943)) (currentBit!11982 (_2!11805 lt!392943))))))

(assert (=> d!84658 (= lt!393484 (_2!11803 (moveBitIndex!0 (_2!11805 lt!392943) (bvsub lt!392941 lt!392950))))))

(assert (=> d!84658 (moveBitIndexPrecond!0 (_2!11805 lt!392943) (bvsub lt!392941 lt!392950))))

(assert (=> d!84658 (= (withMovedBitIndex!0 (_2!11805 lt!392943) (bvsub lt!392941 lt!392950)) lt!393484)))

(declare-fun b!253319 () Bool)

(assert (=> b!253319 (= e!175515 (= (size!6030 (buf!6532 (_2!11805 lt!392943))) (size!6030 (buf!6532 lt!393484))))))

(assert (= (and d!84658 res!212261) b!253319))

(declare-fun m!381303 () Bool)

(assert (=> d!84658 m!381303))

(assert (=> d!84658 m!381245))

(declare-fun m!381305 () Bool)

(assert (=> d!84658 m!381305))

(declare-fun m!381307 () Bool)

(assert (=> d!84658 m!381307))

(assert (=> b!252954 d!84658))

(assert (=> b!252954 d!84400))

(assert (=> b!252954 d!84348))

(assert (=> b!252891 d!84394))

(declare-fun d!84660 () Bool)

(assert (=> d!84660 (validate_offset_bits!1 ((_ sign_extend 32) (size!6030 (buf!6532 (_2!11803 lt!392547)))) ((_ sign_extend 32) (currentByte!11987 (_2!11803 lt!392547))) ((_ sign_extend 32) (currentBit!11982 (_2!11803 lt!392547))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!84660 true))

(declare-fun _$1!330 () Unit!18208)

(assert (=> d!84660 (= (choose!27 thiss!1005 (_2!11803 lt!392547) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) _$1!330)))

(declare-fun bs!21436 () Bool)

(assert (= bs!21436 d!84660))

(assert (=> bs!21436 m!380651))

(assert (=> d!84368 d!84660))

(declare-fun d!84662 () Bool)

(assert (=> d!84662 (= (invariant!0 (currentBit!11982 (_2!11803 lt!392547)) (currentByte!11987 (_2!11803 lt!392547)) (size!6030 (buf!6532 (_2!11803 lt!392547)))) (and (bvsge (currentBit!11982 (_2!11803 lt!392547)) #b00000000000000000000000000000000) (bvslt (currentBit!11982 (_2!11803 lt!392547)) #b00000000000000000000000000001000) (bvsge (currentByte!11987 (_2!11803 lt!392547)) #b00000000000000000000000000000000) (or (bvslt (currentByte!11987 (_2!11803 lt!392547)) (size!6030 (buf!6532 (_2!11803 lt!392547)))) (and (= (currentBit!11982 (_2!11803 lt!392547)) #b00000000000000000000000000000000) (= (currentByte!11987 (_2!11803 lt!392547)) (size!6030 (buf!6532 (_2!11803 lt!392547))))))))))

(assert (=> d!84340 d!84662))

(assert (=> b!252901 d!84348))

(assert (=> b!252901 d!84346))

(assert (=> d!84322 d!84320))

(declare-fun d!84664 () Bool)

(assert (=> d!84664 (validate_offset_bits!1 ((_ sign_extend 32) (size!6030 (buf!6532 (_2!11803 lt!392552)))) ((_ sign_extend 32) (currentByte!11987 (_2!11803 lt!392547))) ((_ sign_extend 32) (currentBit!11982 (_2!11803 lt!392547))) lt!392551)))

(assert (=> d!84664 true))

(declare-fun _$6!422 () Unit!18208)

(assert (=> d!84664 (= (choose!9 (_2!11803 lt!392547) (buf!6532 (_2!11803 lt!392552)) lt!392551 (BitStream!10983 (buf!6532 (_2!11803 lt!392552)) (currentByte!11987 (_2!11803 lt!392547)) (currentBit!11982 (_2!11803 lt!392547)))) _$6!422)))

(declare-fun bs!21437 () Bool)

(assert (= bs!21437 d!84664))

(assert (=> bs!21437 m!380349))

(assert (=> d!84322 d!84664))

(declare-fun d!84666 () Bool)

(declare-fun res!212265 () Bool)

(declare-fun e!175520 () Bool)

(assert (=> d!84666 (=> res!212265 e!175520)))

(assert (=> d!84666 (= res!212265 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6030 (buf!6532 thiss!1005)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005))))))

(assert (=> d!84666 (= (arrayBitRangesEq!0 (buf!6532 thiss!1005) (buf!6532 (_2!11803 lt!392547)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6030 (buf!6532 thiss!1005)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005))) e!175520)))

(declare-fun b!253320 () Bool)

(declare-fun e!175521 () Bool)

(declare-fun e!175517 () Bool)

(assert (=> b!253320 (= e!175521 e!175517)))

(declare-fun lt!393486 () (_ BitVec 32))

(declare-fun res!212264 () Bool)

(declare-fun lt!393487 () tuple4!298)

(assert (=> b!253320 (= res!212264 (byteRangesEq!0 (select (arr!7017 (buf!6532 thiss!1005)) (_3!929 lt!393487)) (select (arr!7017 (buf!6532 (_2!11803 lt!392547))) (_3!929 lt!393487)) lt!393486 #b00000000000000000000000000001000))))

(assert (=> b!253320 (=> (not res!212264) (not e!175517))))

(declare-fun b!253321 () Bool)

(declare-fun e!175516 () Bool)

(assert (=> b!253321 (= e!175516 (arrayRangesEq!926 (buf!6532 thiss!1005) (buf!6532 (_2!11803 lt!392547)) (_1!11810 lt!393487) (_2!11810 lt!393487)))))

(declare-fun b!253322 () Bool)

(declare-fun e!175519 () Bool)

(assert (=> b!253322 (= e!175520 e!175519)))

(declare-fun res!212263 () Bool)

(assert (=> b!253322 (=> (not res!212263) (not e!175519))))

(assert (=> b!253322 (= res!212263 e!175516)))

(declare-fun res!212262 () Bool)

(assert (=> b!253322 (=> res!212262 e!175516)))

(assert (=> b!253322 (= res!212262 (bvsge (_1!11810 lt!393487) (_2!11810 lt!393487)))))

(declare-fun lt!393488 () (_ BitVec 32))

(assert (=> b!253322 (= lt!393488 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6030 (buf!6532 thiss!1005)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253322 (= lt!393486 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253322 (= lt!393487 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6030 (buf!6532 thiss!1005)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005))))))

(declare-fun b!253323 () Bool)

(declare-fun call!3978 () Bool)

(assert (=> b!253323 (= e!175521 call!3978)))

(declare-fun b!253324 () Bool)

(declare-fun res!212266 () Bool)

(assert (=> b!253324 (= res!212266 (= lt!393488 #b00000000000000000000000000000000))))

(declare-fun e!175518 () Bool)

(assert (=> b!253324 (=> res!212266 e!175518)))

(assert (=> b!253324 (= e!175517 e!175518)))

(declare-fun bm!3975 () Bool)

(declare-fun c!11667 () Bool)

(assert (=> bm!3975 (= call!3978 (byteRangesEq!0 (ite c!11667 (select (arr!7017 (buf!6532 thiss!1005)) (_3!929 lt!393487)) (select (arr!7017 (buf!6532 thiss!1005)) (_4!149 lt!393487))) (ite c!11667 (select (arr!7017 (buf!6532 (_2!11803 lt!392547))) (_3!929 lt!393487)) (select (arr!7017 (buf!6532 (_2!11803 lt!392547))) (_4!149 lt!393487))) (ite c!11667 lt!393486 #b00000000000000000000000000000000) lt!393488))))

(declare-fun b!253325 () Bool)

(assert (=> b!253325 (= e!175518 call!3978)))

(declare-fun b!253326 () Bool)

(assert (=> b!253326 (= e!175519 e!175521)))

(assert (=> b!253326 (= c!11667 (= (_3!929 lt!393487) (_4!149 lt!393487)))))

(assert (= (and d!84666 (not res!212265)) b!253322))

(assert (= (and b!253322 (not res!212262)) b!253321))

(assert (= (and b!253322 res!212263) b!253326))

(assert (= (and b!253326 c!11667) b!253323))

(assert (= (and b!253326 (not c!11667)) b!253320))

(assert (= (and b!253320 res!212264) b!253324))

(assert (= (and b!253324 (not res!212266)) b!253325))

(assert (= (or b!253323 b!253325) bm!3975))

(declare-fun m!381309 () Bool)

(assert (=> b!253320 m!381309))

(declare-fun m!381311 () Bool)

(assert (=> b!253320 m!381311))

(assert (=> b!253320 m!381309))

(assert (=> b!253320 m!381311))

(declare-fun m!381313 () Bool)

(assert (=> b!253320 m!381313))

(declare-fun m!381315 () Bool)

(assert (=> b!253321 m!381315))

(assert (=> b!253322 m!380357))

(assert (=> b!253322 m!381257))

(declare-fun m!381317 () Bool)

(assert (=> bm!3975 m!381317))

(declare-fun m!381319 () Bool)

(assert (=> bm!3975 m!381319))

(assert (=> bm!3975 m!381311))

(declare-fun m!381321 () Bool)

(assert (=> bm!3975 m!381321))

(assert (=> bm!3975 m!381309))

(assert (=> b!252903 d!84666))

(assert (=> b!252903 d!84348))

(declare-fun d!84668 () Bool)

(assert (=> d!84668 (= (invariant!0 (currentBit!11982 thiss!1005) (currentByte!11987 thiss!1005) (size!6030 (buf!6532 thiss!1005))) (and (bvsge (currentBit!11982 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11982 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11987 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11987 thiss!1005) (size!6030 (buf!6532 thiss!1005))) (and (= (currentBit!11982 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11987 thiss!1005) (size!6030 (buf!6532 thiss!1005)))))))))

(assert (=> d!84350 d!84668))

(assert (=> b!252879 d!84346))

(declare-fun d!84670 () Bool)

(assert (=> d!84670 (arrayBitRangesEq!0 (buf!6532 (_2!11803 lt!392552)) (buf!6532 (_2!11803 lt!392547)) lt!392803 lt!392806)))

(declare-fun lt!393491 () Unit!18208)

(declare-fun choose!8 (array!13742 array!13742 (_ BitVec 64) (_ BitVec 64)) Unit!18208)

(assert (=> d!84670 (= lt!393491 (choose!8 (buf!6532 (_2!11803 lt!392547)) (buf!6532 (_2!11803 lt!392552)) lt!392803 lt!392806))))

(assert (=> d!84670 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!392803) (bvsle lt!392803 lt!392806))))

(assert (=> d!84670 (= (arrayBitRangesEqSymmetric!0 (buf!6532 (_2!11803 lt!392547)) (buf!6532 (_2!11803 lt!392552)) lt!392803 lt!392806) lt!393491)))

(declare-fun bs!21438 () Bool)

(assert (= bs!21438 d!84670))

(assert (=> bs!21438 m!380565))

(declare-fun m!381323 () Bool)

(assert (=> bs!21438 m!381323))

(assert (=> b!252879 d!84670))

(declare-fun d!84672 () Bool)

(declare-fun res!212270 () Bool)

(declare-fun e!175526 () Bool)

(assert (=> d!84672 (=> res!212270 e!175526)))

(assert (=> d!84672 (= res!212270 (bvsge lt!392803 lt!392806))))

(assert (=> d!84672 (= (arrayBitRangesEq!0 (buf!6532 (_2!11803 lt!392552)) (buf!6532 (_2!11803 lt!392547)) lt!392803 lt!392806) e!175526)))

(declare-fun b!253327 () Bool)

(declare-fun e!175527 () Bool)

(declare-fun e!175523 () Bool)

(assert (=> b!253327 (= e!175527 e!175523)))

(declare-fun res!212269 () Bool)

(declare-fun lt!393492 () (_ BitVec 32))

(declare-fun lt!393493 () tuple4!298)

(assert (=> b!253327 (= res!212269 (byteRangesEq!0 (select (arr!7017 (buf!6532 (_2!11803 lt!392552))) (_3!929 lt!393493)) (select (arr!7017 (buf!6532 (_2!11803 lt!392547))) (_3!929 lt!393493)) lt!393492 #b00000000000000000000000000001000))))

(assert (=> b!253327 (=> (not res!212269) (not e!175523))))

(declare-fun b!253328 () Bool)

(declare-fun e!175522 () Bool)

(assert (=> b!253328 (= e!175522 (arrayRangesEq!926 (buf!6532 (_2!11803 lt!392552)) (buf!6532 (_2!11803 lt!392547)) (_1!11810 lt!393493) (_2!11810 lt!393493)))))

(declare-fun b!253329 () Bool)

(declare-fun e!175525 () Bool)

(assert (=> b!253329 (= e!175526 e!175525)))

(declare-fun res!212268 () Bool)

(assert (=> b!253329 (=> (not res!212268) (not e!175525))))

(assert (=> b!253329 (= res!212268 e!175522)))

(declare-fun res!212267 () Bool)

(assert (=> b!253329 (=> res!212267 e!175522)))

(assert (=> b!253329 (= res!212267 (bvsge (_1!11810 lt!393493) (_2!11810 lt!393493)))))

(declare-fun lt!393494 () (_ BitVec 32))

(assert (=> b!253329 (= lt!393494 ((_ extract 31 0) (bvsrem lt!392806 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253329 (= lt!393492 ((_ extract 31 0) (bvsrem lt!392803 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253329 (= lt!393493 (arrayBitIndices!0 lt!392803 lt!392806))))

(declare-fun b!253330 () Bool)

(declare-fun call!3979 () Bool)

(assert (=> b!253330 (= e!175527 call!3979)))

(declare-fun b!253331 () Bool)

(declare-fun res!212271 () Bool)

(assert (=> b!253331 (= res!212271 (= lt!393494 #b00000000000000000000000000000000))))

(declare-fun e!175524 () Bool)

(assert (=> b!253331 (=> res!212271 e!175524)))

(assert (=> b!253331 (= e!175523 e!175524)))

(declare-fun c!11668 () Bool)

(declare-fun bm!3976 () Bool)

(assert (=> bm!3976 (= call!3979 (byteRangesEq!0 (ite c!11668 (select (arr!7017 (buf!6532 (_2!11803 lt!392552))) (_3!929 lt!393493)) (select (arr!7017 (buf!6532 (_2!11803 lt!392552))) (_4!149 lt!393493))) (ite c!11668 (select (arr!7017 (buf!6532 (_2!11803 lt!392547))) (_3!929 lt!393493)) (select (arr!7017 (buf!6532 (_2!11803 lt!392547))) (_4!149 lt!393493))) (ite c!11668 lt!393492 #b00000000000000000000000000000000) lt!393494))))

(declare-fun b!253332 () Bool)

(assert (=> b!253332 (= e!175524 call!3979)))

(declare-fun b!253333 () Bool)

(assert (=> b!253333 (= e!175525 e!175527)))

(assert (=> b!253333 (= c!11668 (= (_3!929 lt!393493) (_4!149 lt!393493)))))

(assert (= (and d!84672 (not res!212270)) b!253329))

(assert (= (and b!253329 (not res!212267)) b!253328))

(assert (= (and b!253329 res!212268) b!253333))

(assert (= (and b!253333 c!11668) b!253330))

(assert (= (and b!253333 (not c!11668)) b!253327))

(assert (= (and b!253327 res!212269) b!253331))

(assert (= (and b!253331 (not res!212271)) b!253332))

(assert (= (or b!253330 b!253332) bm!3976))

(declare-fun m!381325 () Bool)

(assert (=> b!253327 m!381325))

(declare-fun m!381327 () Bool)

(assert (=> b!253327 m!381327))

(assert (=> b!253327 m!381325))

(assert (=> b!253327 m!381327))

(declare-fun m!381329 () Bool)

(assert (=> b!253327 m!381329))

(declare-fun m!381331 () Bool)

(assert (=> b!253328 m!381331))

(declare-fun m!381333 () Bool)

(assert (=> b!253329 m!381333))

(declare-fun m!381335 () Bool)

(assert (=> bm!3976 m!381335))

(declare-fun m!381337 () Bool)

(assert (=> bm!3976 m!381337))

(assert (=> bm!3976 m!381327))

(declare-fun m!381339 () Bool)

(assert (=> bm!3976 m!381339))

(assert (=> bm!3976 m!381325))

(assert (=> b!252879 d!84672))

(declare-fun d!84674 () Bool)

(assert (=> d!84674 (= (remainingBits!0 ((_ sign_extend 32) (size!6030 (buf!6532 thiss!1005))) ((_ sign_extend 32) (currentByte!11987 thiss!1005)) ((_ sign_extend 32) (currentBit!11982 thiss!1005))) (bvsub (bvmul ((_ sign_extend 32) (size!6030 (buf!6532 thiss!1005))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11987 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11982 thiss!1005)))))))

(assert (=> d!84348 d!84674))

(assert (=> d!84348 d!84668))

(declare-fun d!84676 () Bool)

(declare-fun e!175528 () Bool)

(assert (=> d!84676 e!175528))

(declare-fun res!212272 () Bool)

(assert (=> d!84676 (=> (not res!212272) (not e!175528))))

(declare-fun lt!393500 () (_ BitVec 64))

(declare-fun lt!393497 () (_ BitVec 64))

(declare-fun lt!393495 () (_ BitVec 64))

(assert (=> d!84676 (= res!212272 (= lt!393497 (bvsub lt!393495 lt!393500)))))

(assert (=> d!84676 (or (= (bvand lt!393495 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!393500 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!393495 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!393495 lt!393500) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84676 (= lt!393500 (remainingBits!0 ((_ sign_extend 32) (size!6030 (buf!6532 lt!392963))) ((_ sign_extend 32) (currentByte!11987 lt!392963)) ((_ sign_extend 32) (currentBit!11982 lt!392963))))))

(declare-fun lt!393498 () (_ BitVec 64))

(declare-fun lt!393499 () (_ BitVec 64))

(assert (=> d!84676 (= lt!393495 (bvmul lt!393498 lt!393499))))

(assert (=> d!84676 (or (= lt!393498 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!393499 (bvsdiv (bvmul lt!393498 lt!393499) lt!393498)))))

(assert (=> d!84676 (= lt!393499 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84676 (= lt!393498 ((_ sign_extend 32) (size!6030 (buf!6532 lt!392963))))))

(assert (=> d!84676 (= lt!393497 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11987 lt!392963)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11982 lt!392963))))))

(assert (=> d!84676 (invariant!0 (currentBit!11982 lt!392963) (currentByte!11987 lt!392963) (size!6030 (buf!6532 lt!392963)))))

(assert (=> d!84676 (= (bitIndex!0 (size!6030 (buf!6532 lt!392963)) (currentByte!11987 lt!392963) (currentBit!11982 lt!392963)) lt!393497)))

(declare-fun b!253334 () Bool)

(declare-fun res!212273 () Bool)

(assert (=> b!253334 (=> (not res!212273) (not e!175528))))

(assert (=> b!253334 (= res!212273 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!393497))))

(declare-fun b!253335 () Bool)

(declare-fun lt!393496 () (_ BitVec 64))

(assert (=> b!253335 (= e!175528 (bvsle lt!393497 (bvmul lt!393496 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253335 (or (= lt!393496 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!393496 #b0000000000000000000000000000000000000000000000000000000000001000) lt!393496)))))

(assert (=> b!253335 (= lt!393496 ((_ sign_extend 32) (size!6030 (buf!6532 lt!392963))))))

(assert (= (and d!84676 res!212272) b!253334))

(assert (= (and b!253334 res!212273) b!253335))

(declare-fun m!381341 () Bool)

(assert (=> d!84676 m!381341))

(declare-fun m!381343 () Bool)

(assert (=> d!84676 m!381343))

(assert (=> d!84396 d!84676))

(declare-fun d!84678 () Bool)

(declare-fun e!175529 () Bool)

(assert (=> d!84678 e!175529))

(declare-fun res!212274 () Bool)

(assert (=> d!84678 (=> (not res!212274) (not e!175529))))

(declare-fun lt!393503 () (_ BitVec 64))

(declare-fun lt!393506 () (_ BitVec 64))

(declare-fun lt!393501 () (_ BitVec 64))

(assert (=> d!84678 (= res!212274 (= lt!393503 (bvsub lt!393501 lt!393506)))))

(assert (=> d!84678 (or (= (bvand lt!393501 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!393506 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!393501 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!393501 lt!393506) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84678 (= lt!393506 (remainingBits!0 ((_ sign_extend 32) (size!6030 (buf!6532 (_1!11805 lt!392558)))) ((_ sign_extend 32) (currentByte!11987 (_1!11805 lt!392558))) ((_ sign_extend 32) (currentBit!11982 (_1!11805 lt!392558)))))))

(declare-fun lt!393504 () (_ BitVec 64))

(declare-fun lt!393505 () (_ BitVec 64))

(assert (=> d!84678 (= lt!393501 (bvmul lt!393504 lt!393505))))

(assert (=> d!84678 (or (= lt!393504 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!393505 (bvsdiv (bvmul lt!393504 lt!393505) lt!393504)))))

(assert (=> d!84678 (= lt!393505 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84678 (= lt!393504 ((_ sign_extend 32) (size!6030 (buf!6532 (_1!11805 lt!392558)))))))

(assert (=> d!84678 (= lt!393503 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11987 (_1!11805 lt!392558))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11982 (_1!11805 lt!392558)))))))

(assert (=> d!84678 (invariant!0 (currentBit!11982 (_1!11805 lt!392558)) (currentByte!11987 (_1!11805 lt!392558)) (size!6030 (buf!6532 (_1!11805 lt!392558))))))

(assert (=> d!84678 (= (bitIndex!0 (size!6030 (buf!6532 (_1!11805 lt!392558))) (currentByte!11987 (_1!11805 lt!392558)) (currentBit!11982 (_1!11805 lt!392558))) lt!393503)))

(declare-fun b!253336 () Bool)

(declare-fun res!212275 () Bool)

(assert (=> b!253336 (=> (not res!212275) (not e!175529))))

(assert (=> b!253336 (= res!212275 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!393503))))

(declare-fun b!253337 () Bool)

(declare-fun lt!393502 () (_ BitVec 64))

(assert (=> b!253337 (= e!175529 (bvsle lt!393503 (bvmul lt!393502 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253337 (or (= lt!393502 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!393502 #b0000000000000000000000000000000000000000000000000000000000001000) lt!393502)))))

(assert (=> b!253337 (= lt!393502 ((_ sign_extend 32) (size!6030 (buf!6532 (_1!11805 lt!392558)))))))

(assert (= (and d!84678 res!212274) b!253336))

(assert (= (and b!253336 res!212275) b!253337))

(declare-fun m!381345 () Bool)

(assert (=> d!84678 m!381345))

(declare-fun m!381347 () Bool)

(assert (=> d!84678 m!381347))

(assert (=> d!84396 d!84678))

(declare-fun d!84680 () Bool)

(declare-fun lt!393521 () (_ BitVec 32))

(assert (=> d!84680 (= lt!393521 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!393519 () (_ BitVec 32))

(assert (=> d!84680 (= lt!393519 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!175534 () Bool)

(assert (=> d!84680 e!175534))

(declare-fun res!212281 () Bool)

(assert (=> d!84680 (=> (not res!212281) (not e!175534))))

(assert (=> d!84680 (= res!212281 (moveBitIndexPrecond!0 (_1!11805 lt!392558) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun Unit!18223 () Unit!18208)

(declare-fun Unit!18224 () Unit!18208)

(declare-fun Unit!18225 () Unit!18208)

(assert (=> d!84680 (= (moveBitIndex!0 (_1!11805 lt!392558) #b0000000000000000000000000000000000000000000000000000000000000001) (ite (bvslt (bvadd (currentBit!11982 (_1!11805 lt!392558)) lt!393521) #b00000000000000000000000000000000) (tuple2!21751 Unit!18223 (BitStream!10983 (buf!6532 (_1!11805 lt!392558)) (bvsub (bvadd (currentByte!11987 (_1!11805 lt!392558)) lt!393519) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!393521 (currentBit!11982 (_1!11805 lt!392558))))) (ite (bvsge (bvadd (currentBit!11982 (_1!11805 lt!392558)) lt!393521) #b00000000000000000000000000001000) (tuple2!21751 Unit!18224 (BitStream!10983 (buf!6532 (_1!11805 lt!392558)) (bvadd (currentByte!11987 (_1!11805 lt!392558)) lt!393519 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!11982 (_1!11805 lt!392558)) lt!393521) #b00000000000000000000000000001000))) (tuple2!21751 Unit!18225 (BitStream!10983 (buf!6532 (_1!11805 lt!392558)) (bvadd (currentByte!11987 (_1!11805 lt!392558)) lt!393519) (bvadd (currentBit!11982 (_1!11805 lt!392558)) lt!393521))))))))

(declare-fun b!253342 () Bool)

(declare-fun e!175535 () Bool)

(assert (=> b!253342 (= e!175534 e!175535)))

(declare-fun res!212280 () Bool)

(assert (=> b!253342 (=> (not res!212280) (not e!175535))))

(declare-fun lt!393520 () (_ BitVec 64))

(declare-fun lt!393522 () tuple2!21750)

(assert (=> b!253342 (= res!212280 (= (bvadd lt!393520 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!6030 (buf!6532 (_2!11803 lt!393522))) (currentByte!11987 (_2!11803 lt!393522)) (currentBit!11982 (_2!11803 lt!393522)))))))

(assert (=> b!253342 (or (not (= (bvand lt!393520 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!393520 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!393520 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!253342 (= lt!393520 (bitIndex!0 (size!6030 (buf!6532 (_1!11805 lt!392558))) (currentByte!11987 (_1!11805 lt!392558)) (currentBit!11982 (_1!11805 lt!392558))))))

(declare-fun lt!393523 () (_ BitVec 32))

(declare-fun lt!393524 () (_ BitVec 32))

(declare-fun Unit!18226 () Unit!18208)

(declare-fun Unit!18227 () Unit!18208)

(declare-fun Unit!18228 () Unit!18208)

(assert (=> b!253342 (= lt!393522 (ite (bvslt (bvadd (currentBit!11982 (_1!11805 lt!392558)) lt!393524) #b00000000000000000000000000000000) (tuple2!21751 Unit!18226 (BitStream!10983 (buf!6532 (_1!11805 lt!392558)) (bvsub (bvadd (currentByte!11987 (_1!11805 lt!392558)) lt!393523) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!393524 (currentBit!11982 (_1!11805 lt!392558))))) (ite (bvsge (bvadd (currentBit!11982 (_1!11805 lt!392558)) lt!393524) #b00000000000000000000000000001000) (tuple2!21751 Unit!18227 (BitStream!10983 (buf!6532 (_1!11805 lt!392558)) (bvadd (currentByte!11987 (_1!11805 lt!392558)) lt!393523 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!11982 (_1!11805 lt!392558)) lt!393524) #b00000000000000000000000000001000))) (tuple2!21751 Unit!18228 (BitStream!10983 (buf!6532 (_1!11805 lt!392558)) (bvadd (currentByte!11987 (_1!11805 lt!392558)) lt!393523) (bvadd (currentBit!11982 (_1!11805 lt!392558)) lt!393524))))))))

(assert (=> b!253342 (= lt!393524 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253342 (= lt!393523 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!253343 () Bool)

(assert (=> b!253343 (= e!175535 (and (= (size!6030 (buf!6532 (_1!11805 lt!392558))) (size!6030 (buf!6532 (_2!11803 lt!393522)))) (= (buf!6532 (_1!11805 lt!392558)) (buf!6532 (_2!11803 lt!393522)))))))

(assert (= (and d!84680 res!212281) b!253342))

(assert (= (and b!253342 res!212280) b!253343))

(assert (=> d!84680 m!380727))

(declare-fun m!381349 () Bool)

(assert (=> b!253342 m!381349))

(assert (=> b!253342 m!380723))

(assert (=> d!84396 d!84680))

(declare-fun d!84684 () Bool)

(declare-fun res!212284 () Bool)

(declare-fun e!175538 () Bool)

(assert (=> d!84684 (=> (not res!212284) (not e!175538))))

(assert (=> d!84684 (= res!212284 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6030 (buf!6532 (_1!11805 lt!392558))))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6030 (buf!6532 (_1!11805 lt!392558))))))))))

(assert (=> d!84684 (= (moveBitIndexPrecond!0 (_1!11805 lt!392558) #b0000000000000000000000000000000000000000000000000000000000000001) e!175538)))

(declare-fun b!253347 () Bool)

(declare-fun lt!393527 () (_ BitVec 64))

(assert (=> b!253347 (= e!175538 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!393527) (bvsle lt!393527 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6030 (buf!6532 (_1!11805 lt!392558))))))))))

(assert (=> b!253347 (= lt!393527 (bvadd (bitIndex!0 (size!6030 (buf!6532 (_1!11805 lt!392558))) (currentByte!11987 (_1!11805 lt!392558)) (currentBit!11982 (_1!11805 lt!392558))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!84684 res!212284) b!253347))

(assert (=> b!253347 m!380723))

(assert (=> d!84396 d!84684))

(assert (=> d!84352 d!84674))

(assert (=> d!84320 d!84656))

(declare-fun d!84686 () Bool)

(assert (=> d!84686 (= (remainingBits!0 ((_ sign_extend 32) (size!6030 (buf!6532 (_2!11803 lt!392547)))) ((_ sign_extend 32) (currentByte!11987 (_2!11803 lt!392547))) ((_ sign_extend 32) (currentBit!11982 (_2!11803 lt!392547)))) (bvsub (bvmul ((_ sign_extend 32) (size!6030 (buf!6532 (_2!11803 lt!392547)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11987 (_2!11803 lt!392547))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11982 (_2!11803 lt!392547))))))))

(assert (=> d!84346 d!84686))

(assert (=> d!84346 d!84662))

(declare-fun d!84688 () Bool)

(declare-fun e!175545 () Bool)

(assert (=> d!84688 e!175545))

(declare-fun res!212287 () Bool)

(assert (=> d!84688 (=> (not res!212287) (not e!175545))))

(declare-fun increaseBitIndex!0 (BitStream!10982) tuple2!21750)

(assert (=> d!84688 (= res!212287 (= (buf!6532 (_2!11803 (increaseBitIndex!0 (readerFrom!0 (_2!11803 lt!392547) (currentBit!11982 thiss!1005) (currentByte!11987 thiss!1005))))) (buf!6532 (readerFrom!0 (_2!11803 lt!392547) (currentBit!11982 thiss!1005) (currentByte!11987 thiss!1005)))))))

(declare-fun lt!393543 () Bool)

(assert (=> d!84688 (= lt!393543 (not (= (bvand ((_ sign_extend 24) (select (arr!7017 (buf!6532 (readerFrom!0 (_2!11803 lt!392547) (currentBit!11982 thiss!1005) (currentByte!11987 thiss!1005)))) (currentByte!11987 (readerFrom!0 (_2!11803 lt!392547) (currentBit!11982 thiss!1005) (currentByte!11987 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11982 (readerFrom!0 (_2!11803 lt!392547) (currentBit!11982 thiss!1005) (currentByte!11987 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!393548 () tuple2!21758)

(assert (=> d!84688 (= lt!393548 (tuple2!21759 (not (= (bvand ((_ sign_extend 24) (select (arr!7017 (buf!6532 (readerFrom!0 (_2!11803 lt!392547) (currentBit!11982 thiss!1005) (currentByte!11987 thiss!1005)))) (currentByte!11987 (readerFrom!0 (_2!11803 lt!392547) (currentBit!11982 thiss!1005) (currentByte!11987 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11982 (readerFrom!0 (_2!11803 lt!392547) (currentBit!11982 thiss!1005) (currentByte!11987 thiss!1005)))))) #b00000000000000000000000000000000)) (_2!11803 (increaseBitIndex!0 (readerFrom!0 (_2!11803 lt!392547) (currentBit!11982 thiss!1005) (currentByte!11987 thiss!1005))))))))

(assert (=> d!84688 (validate_offset_bit!0 ((_ sign_extend 32) (size!6030 (buf!6532 (readerFrom!0 (_2!11803 lt!392547) (currentBit!11982 thiss!1005) (currentByte!11987 thiss!1005))))) ((_ sign_extend 32) (currentByte!11987 (readerFrom!0 (_2!11803 lt!392547) (currentBit!11982 thiss!1005) (currentByte!11987 thiss!1005)))) ((_ sign_extend 32) (currentBit!11982 (readerFrom!0 (_2!11803 lt!392547) (currentBit!11982 thiss!1005) (currentByte!11987 thiss!1005)))))))

(assert (=> d!84688 (= (readBit!0 (readerFrom!0 (_2!11803 lt!392547) (currentBit!11982 thiss!1005) (currentByte!11987 thiss!1005))) lt!393548)))

(declare-fun lt!393545 () (_ BitVec 64))

(declare-fun b!253350 () Bool)

(declare-fun lt!393546 () (_ BitVec 64))

(assert (=> b!253350 (= e!175545 (= (bitIndex!0 (size!6030 (buf!6532 (_2!11803 (increaseBitIndex!0 (readerFrom!0 (_2!11803 lt!392547) (currentBit!11982 thiss!1005) (currentByte!11987 thiss!1005)))))) (currentByte!11987 (_2!11803 (increaseBitIndex!0 (readerFrom!0 (_2!11803 lt!392547) (currentBit!11982 thiss!1005) (currentByte!11987 thiss!1005))))) (currentBit!11982 (_2!11803 (increaseBitIndex!0 (readerFrom!0 (_2!11803 lt!392547) (currentBit!11982 thiss!1005) (currentByte!11987 thiss!1005)))))) (bvadd lt!393546 lt!393545)))))

(assert (=> b!253350 (or (not (= (bvand lt!393546 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!393545 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!393546 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!393546 lt!393545) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!253350 (= lt!393545 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!253350 (= lt!393546 (bitIndex!0 (size!6030 (buf!6532 (readerFrom!0 (_2!11803 lt!392547) (currentBit!11982 thiss!1005) (currentByte!11987 thiss!1005)))) (currentByte!11987 (readerFrom!0 (_2!11803 lt!392547) (currentBit!11982 thiss!1005) (currentByte!11987 thiss!1005))) (currentBit!11982 (readerFrom!0 (_2!11803 lt!392547) (currentBit!11982 thiss!1005) (currentByte!11987 thiss!1005)))))))

(declare-fun lt!393547 () Bool)

(assert (=> b!253350 (= lt!393547 (not (= (bvand ((_ sign_extend 24) (select (arr!7017 (buf!6532 (readerFrom!0 (_2!11803 lt!392547) (currentBit!11982 thiss!1005) (currentByte!11987 thiss!1005)))) (currentByte!11987 (readerFrom!0 (_2!11803 lt!392547) (currentBit!11982 thiss!1005) (currentByte!11987 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11982 (readerFrom!0 (_2!11803 lt!392547) (currentBit!11982 thiss!1005) (currentByte!11987 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!393542 () Bool)

(assert (=> b!253350 (= lt!393542 (not (= (bvand ((_ sign_extend 24) (select (arr!7017 (buf!6532 (readerFrom!0 (_2!11803 lt!392547) (currentBit!11982 thiss!1005) (currentByte!11987 thiss!1005)))) (currentByte!11987 (readerFrom!0 (_2!11803 lt!392547) (currentBit!11982 thiss!1005) (currentByte!11987 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11982 (readerFrom!0 (_2!11803 lt!392547) (currentBit!11982 thiss!1005) (currentByte!11987 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!393544 () Bool)

(assert (=> b!253350 (= lt!393544 (not (= (bvand ((_ sign_extend 24) (select (arr!7017 (buf!6532 (readerFrom!0 (_2!11803 lt!392547) (currentBit!11982 thiss!1005) (currentByte!11987 thiss!1005)))) (currentByte!11987 (readerFrom!0 (_2!11803 lt!392547) (currentBit!11982 thiss!1005) (currentByte!11987 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11982 (readerFrom!0 (_2!11803 lt!392547) (currentBit!11982 thiss!1005) (currentByte!11987 thiss!1005)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!84688 res!212287) b!253350))

(assert (=> d!84688 m!380399))

(declare-fun m!381351 () Bool)

(assert (=> d!84688 m!381351))

(declare-fun m!381353 () Bool)

(assert (=> d!84688 m!381353))

(declare-fun m!381355 () Bool)

(assert (=> d!84688 m!381355))

(declare-fun m!381357 () Bool)

(assert (=> d!84688 m!381357))

(declare-fun m!381359 () Bool)

(assert (=> b!253350 m!381359))

(assert (=> b!253350 m!381353))

(assert (=> b!253350 m!381355))

(declare-fun m!381361 () Bool)

(assert (=> b!253350 m!381361))

(assert (=> b!253350 m!380399))

(assert (=> b!253350 m!381351))

(assert (=> d!84334 d!84688))

(declare-fun d!84690 () Bool)

(declare-fun e!175548 () Bool)

(assert (=> d!84690 e!175548))

(declare-fun res!212290 () Bool)

(assert (=> d!84690 (=> (not res!212290) (not e!175548))))

(declare-fun lt!393556 () tuple2!21752)

(declare-fun lt!393557 () tuple2!21752)

(assert (=> d!84690 (= res!212290 (= (bitIndex!0 (size!6030 (buf!6532 (_1!11804 lt!393556))) (currentByte!11987 (_1!11804 lt!393556)) (currentBit!11982 (_1!11804 lt!393556))) (bitIndex!0 (size!6030 (buf!6532 (_1!11804 lt!393557))) (currentByte!11987 (_1!11804 lt!393557)) (currentBit!11982 (_1!11804 lt!393557)))))))

(declare-fun lt!393555 () BitStream!10982)

(assert (=> d!84690 (= lt!393557 (readBitPure!0 lt!393555))))

(assert (=> d!84690 (= lt!393556 (readBitPure!0 lt!392566))))

(assert (=> d!84690 (= lt!393555 (BitStream!10983 (buf!6532 (_2!11803 lt!392552)) (currentByte!11987 lt!392566) (currentBit!11982 lt!392566)))))

(assert (=> d!84690 (invariant!0 (currentBit!11982 lt!392566) (currentByte!11987 lt!392566) (size!6030 (buf!6532 (_2!11803 lt!392552))))))

(assert (=> d!84690 true))

(declare-fun _$9!108 () Unit!18208)

(assert (=> d!84690 (= (choose!50 lt!392566 (_2!11803 lt!392552) lt!392902 lt!392900 (tuple2!21753 (_1!11804 lt!392900) (_2!11804 lt!392900)) (_1!11804 lt!392900) (_2!11804 lt!392900) lt!392901 (tuple2!21753 (_1!11804 lt!392901) (_2!11804 lt!392901)) (_1!11804 lt!392901) (_2!11804 lt!392901)) _$9!108)))

(declare-fun b!253353 () Bool)

(assert (=> b!253353 (= e!175548 (= (_2!11804 lt!393556) (_2!11804 lt!393557)))))

(assert (= (and d!84690 res!212290) b!253353))

(assert (=> d!84690 m!380657))

(declare-fun m!381363 () Bool)

(assert (=> d!84690 m!381363))

(declare-fun m!381365 () Bool)

(assert (=> d!84690 m!381365))

(declare-fun m!381367 () Bool)

(assert (=> d!84690 m!381367))

(assert (=> d!84690 m!380385))

(assert (=> d!84374 d!84690))

(declare-fun d!84692 () Bool)

(assert (=> d!84692 (= (invariant!0 (currentBit!11982 lt!392566) (currentByte!11987 lt!392566) (size!6030 (buf!6532 (_2!11803 lt!392552)))) (and (bvsge (currentBit!11982 lt!392566) #b00000000000000000000000000000000) (bvslt (currentBit!11982 lt!392566) #b00000000000000000000000000001000) (bvsge (currentByte!11987 lt!392566) #b00000000000000000000000000000000) (or (bvslt (currentByte!11987 lt!392566) (size!6030 (buf!6532 (_2!11803 lt!392552)))) (and (= (currentBit!11982 lt!392566) #b00000000000000000000000000000000) (= (currentByte!11987 lt!392566) (size!6030 (buf!6532 (_2!11803 lt!392552))))))))))

(assert (=> d!84374 d!84692))

(declare-fun d!84694 () Bool)

(declare-fun e!175549 () Bool)

(assert (=> d!84694 e!175549))

(declare-fun res!212291 () Bool)

(assert (=> d!84694 (=> (not res!212291) (not e!175549))))

(declare-fun lt!393563 () (_ BitVec 64))

(declare-fun lt!393560 () (_ BitVec 64))

(declare-fun lt!393558 () (_ BitVec 64))

(assert (=> d!84694 (= res!212291 (= lt!393560 (bvsub lt!393558 lt!393563)))))

(assert (=> d!84694 (or (= (bvand lt!393558 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!393563 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!393558 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!393558 lt!393563) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84694 (= lt!393563 (remainingBits!0 ((_ sign_extend 32) (size!6030 (buf!6532 (_1!11804 lt!392901)))) ((_ sign_extend 32) (currentByte!11987 (_1!11804 lt!392901))) ((_ sign_extend 32) (currentBit!11982 (_1!11804 lt!392901)))))))

(declare-fun lt!393561 () (_ BitVec 64))

(declare-fun lt!393562 () (_ BitVec 64))

(assert (=> d!84694 (= lt!393558 (bvmul lt!393561 lt!393562))))

(assert (=> d!84694 (or (= lt!393561 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!393562 (bvsdiv (bvmul lt!393561 lt!393562) lt!393561)))))

(assert (=> d!84694 (= lt!393562 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84694 (= lt!393561 ((_ sign_extend 32) (size!6030 (buf!6532 (_1!11804 lt!392901)))))))

(assert (=> d!84694 (= lt!393560 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11987 (_1!11804 lt!392901))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11982 (_1!11804 lt!392901)))))))

(assert (=> d!84694 (invariant!0 (currentBit!11982 (_1!11804 lt!392901)) (currentByte!11987 (_1!11804 lt!392901)) (size!6030 (buf!6532 (_1!11804 lt!392901))))))

(assert (=> d!84694 (= (bitIndex!0 (size!6030 (buf!6532 (_1!11804 lt!392901))) (currentByte!11987 (_1!11804 lt!392901)) (currentBit!11982 (_1!11804 lt!392901))) lt!393560)))

(declare-fun b!253354 () Bool)

(declare-fun res!212292 () Bool)

(assert (=> b!253354 (=> (not res!212292) (not e!175549))))

(assert (=> b!253354 (= res!212292 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!393560))))

(declare-fun b!253355 () Bool)

(declare-fun lt!393559 () (_ BitVec 64))

(assert (=> b!253355 (= e!175549 (bvsle lt!393560 (bvmul lt!393559 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253355 (or (= lt!393559 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!393559 #b0000000000000000000000000000000000000000000000000000000000001000) lt!393559)))))

(assert (=> b!253355 (= lt!393559 ((_ sign_extend 32) (size!6030 (buf!6532 (_1!11804 lt!392901)))))))

(assert (= (and d!84694 res!212291) b!253354))

(assert (= (and b!253354 res!212292) b!253355))

(declare-fun m!381369 () Bool)

(assert (=> d!84694 m!381369))

(declare-fun m!381371 () Bool)

(assert (=> d!84694 m!381371))

(assert (=> d!84374 d!84694))

(declare-fun d!84696 () Bool)

(declare-fun e!175550 () Bool)

(assert (=> d!84696 e!175550))

(declare-fun res!212293 () Bool)

(assert (=> d!84696 (=> (not res!212293) (not e!175550))))

(declare-fun lt!393564 () (_ BitVec 64))

(declare-fun lt!393569 () (_ BitVec 64))

(declare-fun lt!393566 () (_ BitVec 64))

(assert (=> d!84696 (= res!212293 (= lt!393566 (bvsub lt!393564 lt!393569)))))

(assert (=> d!84696 (or (= (bvand lt!393564 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!393569 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!393564 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!393564 lt!393569) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84696 (= lt!393569 (remainingBits!0 ((_ sign_extend 32) (size!6030 (buf!6532 (_1!11804 lt!392900)))) ((_ sign_extend 32) (currentByte!11987 (_1!11804 lt!392900))) ((_ sign_extend 32) (currentBit!11982 (_1!11804 lt!392900)))))))

(declare-fun lt!393567 () (_ BitVec 64))

(declare-fun lt!393568 () (_ BitVec 64))

(assert (=> d!84696 (= lt!393564 (bvmul lt!393567 lt!393568))))

(assert (=> d!84696 (or (= lt!393567 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!393568 (bvsdiv (bvmul lt!393567 lt!393568) lt!393567)))))

(assert (=> d!84696 (= lt!393568 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84696 (= lt!393567 ((_ sign_extend 32) (size!6030 (buf!6532 (_1!11804 lt!392900)))))))

(assert (=> d!84696 (= lt!393566 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11987 (_1!11804 lt!392900))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11982 (_1!11804 lt!392900)))))))

(assert (=> d!84696 (invariant!0 (currentBit!11982 (_1!11804 lt!392900)) (currentByte!11987 (_1!11804 lt!392900)) (size!6030 (buf!6532 (_1!11804 lt!392900))))))

(assert (=> d!84696 (= (bitIndex!0 (size!6030 (buf!6532 (_1!11804 lt!392900))) (currentByte!11987 (_1!11804 lt!392900)) (currentBit!11982 (_1!11804 lt!392900))) lt!393566)))

(declare-fun b!253356 () Bool)

(declare-fun res!212294 () Bool)

(assert (=> b!253356 (=> (not res!212294) (not e!175550))))

(assert (=> b!253356 (= res!212294 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!393566))))

(declare-fun b!253357 () Bool)

(declare-fun lt!393565 () (_ BitVec 64))

(assert (=> b!253357 (= e!175550 (bvsle lt!393566 (bvmul lt!393565 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253357 (or (= lt!393565 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!393565 #b0000000000000000000000000000000000000000000000000000000000001000) lt!393565)))))

(assert (=> b!253357 (= lt!393565 ((_ sign_extend 32) (size!6030 (buf!6532 (_1!11804 lt!392900)))))))

(assert (= (and d!84696 res!212293) b!253356))

(assert (= (and b!253356 res!212294) b!253357))

(declare-fun m!381373 () Bool)

(assert (=> d!84696 m!381373))

(declare-fun m!381375 () Bool)

(assert (=> d!84696 m!381375))

(assert (=> d!84374 d!84696))

(assert (=> d!84374 d!84384))

(declare-fun d!84698 () Bool)

(declare-fun lt!393570 () tuple2!21758)

(assert (=> d!84698 (= lt!393570 (readBit!0 lt!392902))))

(assert (=> d!84698 (= (readBitPure!0 lt!392902) (tuple2!21753 (_2!11807 lt!393570) (_1!11807 lt!393570)))))

(declare-fun bs!21439 () Bool)

(assert (= bs!21439 d!84698))

(declare-fun m!381377 () Bool)

(assert (=> bs!21439 m!381377))

(assert (=> d!84374 d!84698))

(declare-fun d!84700 () Bool)

(declare-fun res!212295 () Bool)

(declare-fun e!175552 () Bool)

(assert (=> d!84700 (=> (not res!212295) (not e!175552))))

(assert (=> d!84700 (= res!212295 (= (size!6030 (buf!6532 (_2!11805 lt!392804))) (size!6030 (buf!6532 (_2!11803 lt!392552)))))))

(assert (=> d!84700 (= (isPrefixOf!0 (_2!11805 lt!392804) (_2!11803 lt!392552)) e!175552)))

(declare-fun b!253358 () Bool)

(declare-fun res!212297 () Bool)

(assert (=> b!253358 (=> (not res!212297) (not e!175552))))

(assert (=> b!253358 (= res!212297 (bvsle (bitIndex!0 (size!6030 (buf!6532 (_2!11805 lt!392804))) (currentByte!11987 (_2!11805 lt!392804)) (currentBit!11982 (_2!11805 lt!392804))) (bitIndex!0 (size!6030 (buf!6532 (_2!11803 lt!392552))) (currentByte!11987 (_2!11803 lt!392552)) (currentBit!11982 (_2!11803 lt!392552)))))))

(declare-fun b!253359 () Bool)

(declare-fun e!175551 () Bool)

(assert (=> b!253359 (= e!175552 e!175551)))

(declare-fun res!212296 () Bool)

(assert (=> b!253359 (=> res!212296 e!175551)))

(assert (=> b!253359 (= res!212296 (= (size!6030 (buf!6532 (_2!11805 lt!392804))) #b00000000000000000000000000000000))))

(declare-fun b!253360 () Bool)

(assert (=> b!253360 (= e!175551 (arrayBitRangesEq!0 (buf!6532 (_2!11805 lt!392804)) (buf!6532 (_2!11803 lt!392552)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6030 (buf!6532 (_2!11805 lt!392804))) (currentByte!11987 (_2!11805 lt!392804)) (currentBit!11982 (_2!11805 lt!392804)))))))

(assert (= (and d!84700 res!212295) b!253358))

(assert (= (and b!253358 res!212297) b!253359))

(assert (= (and b!253359 (not res!212296)) b!253360))

(declare-fun m!381379 () Bool)

(assert (=> b!253358 m!381379))

(assert (=> b!253358 m!380335))

(assert (=> b!253360 m!381379))

(assert (=> b!253360 m!381379))

(declare-fun m!381381 () Bool)

(assert (=> b!253360 m!381381))

(assert (=> b!252881 d!84700))

(declare-fun d!84702 () Bool)

(declare-fun res!212298 () Bool)

(declare-fun e!175554 () Bool)

(assert (=> d!84702 (=> (not res!212298) (not e!175554))))

(assert (=> d!84702 (= res!212298 (= (size!6030 (buf!6532 (_2!11803 lt!392547))) (size!6030 (buf!6532 (_2!11803 lt!392937)))))))

(assert (=> d!84702 (= (isPrefixOf!0 (_2!11803 lt!392547) (_2!11803 lt!392937)) e!175554)))

(declare-fun b!253361 () Bool)

(declare-fun res!212300 () Bool)

(assert (=> b!253361 (=> (not res!212300) (not e!175554))))

(assert (=> b!253361 (= res!212300 (bvsle (bitIndex!0 (size!6030 (buf!6532 (_2!11803 lt!392547))) (currentByte!11987 (_2!11803 lt!392547)) (currentBit!11982 (_2!11803 lt!392547))) (bitIndex!0 (size!6030 (buf!6532 (_2!11803 lt!392937))) (currentByte!11987 (_2!11803 lt!392937)) (currentBit!11982 (_2!11803 lt!392937)))))))

(declare-fun b!253362 () Bool)

(declare-fun e!175553 () Bool)

(assert (=> b!253362 (= e!175554 e!175553)))

(declare-fun res!212299 () Bool)

(assert (=> b!253362 (=> res!212299 e!175553)))

(assert (=> b!253362 (= res!212299 (= (size!6030 (buf!6532 (_2!11803 lt!392547))) #b00000000000000000000000000000000))))

(declare-fun b!253363 () Bool)

(assert (=> b!253363 (= e!175553 (arrayBitRangesEq!0 (buf!6532 (_2!11803 lt!392547)) (buf!6532 (_2!11803 lt!392937)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6030 (buf!6532 (_2!11803 lt!392547))) (currentByte!11987 (_2!11803 lt!392547)) (currentBit!11982 (_2!11803 lt!392547)))))))

(assert (= (and d!84702 res!212298) b!253361))

(assert (= (and b!253361 res!212300) b!253362))

(assert (= (and b!253362 (not res!212299)) b!253363))

(assert (=> b!253361 m!380337))

(assert (=> b!253361 m!380691))

(assert (=> b!253363 m!380337))

(assert (=> b!253363 m!380337))

(declare-fun m!381383 () Bool)

(assert (=> b!253363 m!381383))

(assert (=> b!252947 d!84702))

(declare-fun d!84704 () Bool)

(assert (=> d!84704 (= (remainingBits!0 ((_ sign_extend 32) (size!6030 (buf!6532 (_2!11803 lt!392552)))) ((_ sign_extend 32) (currentByte!11987 (_2!11803 lt!392552))) ((_ sign_extend 32) (currentBit!11982 (_2!11803 lt!392552)))) (bvsub (bvmul ((_ sign_extend 32) (size!6030 (buf!6532 (_2!11803 lt!392552)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11987 (_2!11803 lt!392552))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11982 (_2!11803 lt!392552))))))))

(assert (=> d!84400 d!84704))

(declare-fun d!84706 () Bool)

(assert (=> d!84706 (= (invariant!0 (currentBit!11982 (_2!11803 lt!392552)) (currentByte!11987 (_2!11803 lt!392552)) (size!6030 (buf!6532 (_2!11803 lt!392552)))) (and (bvsge (currentBit!11982 (_2!11803 lt!392552)) #b00000000000000000000000000000000) (bvslt (currentBit!11982 (_2!11803 lt!392552)) #b00000000000000000000000000001000) (bvsge (currentByte!11987 (_2!11803 lt!392552)) #b00000000000000000000000000000000) (or (bvslt (currentByte!11987 (_2!11803 lt!392552)) (size!6030 (buf!6532 (_2!11803 lt!392552)))) (and (= (currentBit!11982 (_2!11803 lt!392552)) #b00000000000000000000000000000000) (= (currentByte!11987 (_2!11803 lt!392552)) (size!6030 (buf!6532 (_2!11803 lt!392552))))))))))

(assert (=> d!84400 d!84706))

(declare-fun d!84708 () Bool)

(declare-fun e!175555 () Bool)

(assert (=> d!84708 e!175555))

(declare-fun res!212301 () Bool)

(assert (=> d!84708 (=> (not res!212301) (not e!175555))))

(declare-fun lt!393571 () BitStream!10982)

(declare-fun lt!393572 () (_ BitVec 64))

(assert (=> d!84708 (= res!212301 (= (bvadd lt!393572 (bvsub lt!392802 lt!392811)) (bitIndex!0 (size!6030 (buf!6532 lt!393571)) (currentByte!11987 lt!393571) (currentBit!11982 lt!393571))))))

(assert (=> d!84708 (or (not (= (bvand lt!393572 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!392802 lt!392811) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!393572 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!393572 (bvsub lt!392802 lt!392811)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84708 (= lt!393572 (bitIndex!0 (size!6030 (buf!6532 (_2!11805 lt!392804))) (currentByte!11987 (_2!11805 lt!392804)) (currentBit!11982 (_2!11805 lt!392804))))))

(assert (=> d!84708 (= lt!393571 (_2!11803 (moveBitIndex!0 (_2!11805 lt!392804) (bvsub lt!392802 lt!392811))))))

(assert (=> d!84708 (moveBitIndexPrecond!0 (_2!11805 lt!392804) (bvsub lt!392802 lt!392811))))

(assert (=> d!84708 (= (withMovedBitIndex!0 (_2!11805 lt!392804) (bvsub lt!392802 lt!392811)) lt!393571)))

(declare-fun b!253364 () Bool)

(assert (=> b!253364 (= e!175555 (= (size!6030 (buf!6532 (_2!11805 lt!392804))) (size!6030 (buf!6532 lt!393571))))))

(assert (= (and d!84708 res!212301) b!253364))

(declare-fun m!381385 () Bool)

(assert (=> d!84708 m!381385))

(assert (=> d!84708 m!381379))

(declare-fun m!381387 () Bool)

(assert (=> d!84708 m!381387))

(declare-fun m!381389 () Bool)

(assert (=> d!84708 m!381389))

(assert (=> b!252883 d!84708))

(assert (=> b!252883 d!84400))

(assert (=> b!252883 d!84346))

(declare-fun d!84710 () Bool)

(assert (=> d!84710 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6030 (buf!6532 (_2!11803 lt!392547)))) ((_ sign_extend 32) (currentByte!11987 (_2!11803 lt!392547))) ((_ sign_extend 32) (currentBit!11982 (_2!11803 lt!392547))) lt!392932) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6030 (buf!6532 (_2!11803 lt!392547)))) ((_ sign_extend 32) (currentByte!11987 (_2!11803 lt!392547))) ((_ sign_extend 32) (currentBit!11982 (_2!11803 lt!392547)))) lt!392932))))

(declare-fun bs!21440 () Bool)

(assert (= bs!21440 d!84710))

(assert (=> bs!21440 m!380617))

(assert (=> b!252949 d!84710))

(declare-fun d!84712 () Bool)

(declare-fun res!212302 () Bool)

(declare-fun e!175557 () Bool)

(assert (=> d!84712 (=> (not res!212302) (not e!175557))))

(assert (=> d!84712 (= res!212302 (= (size!6030 (buf!6532 thiss!1005)) (size!6030 (buf!6532 (_2!11803 lt!392877)))))))

(assert (=> d!84712 (= (isPrefixOf!0 thiss!1005 (_2!11803 lt!392877)) e!175557)))

(declare-fun b!253365 () Bool)

(declare-fun res!212304 () Bool)

(assert (=> b!253365 (=> (not res!212304) (not e!175557))))

(assert (=> b!253365 (= res!212304 (bvsle (bitIndex!0 (size!6030 (buf!6532 thiss!1005)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005)) (bitIndex!0 (size!6030 (buf!6532 (_2!11803 lt!392877))) (currentByte!11987 (_2!11803 lt!392877)) (currentBit!11982 (_2!11803 lt!392877)))))))

(declare-fun b!253366 () Bool)

(declare-fun e!175556 () Bool)

(assert (=> b!253366 (= e!175557 e!175556)))

(declare-fun res!212303 () Bool)

(assert (=> b!253366 (=> res!212303 e!175556)))

(assert (=> b!253366 (= res!212303 (= (size!6030 (buf!6532 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!253367 () Bool)

(assert (=> b!253367 (= e!175556 (arrayBitRangesEq!0 (buf!6532 thiss!1005) (buf!6532 (_2!11803 lt!392877)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6030 (buf!6532 thiss!1005)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005))))))

(assert (= (and d!84712 res!212302) b!253365))

(assert (= (and b!253365 res!212304) b!253366))

(assert (= (and b!253366 (not res!212303)) b!253367))

(assert (=> b!253365 m!380357))

(assert (=> b!253365 m!380625))

(assert (=> b!253367 m!380357))

(assert (=> b!253367 m!380357))

(declare-fun m!381391 () Bool)

(assert (=> b!253367 m!381391))

(assert (=> b!252922 d!84712))

(declare-fun d!84714 () Bool)

(assert (=> d!84714 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6030 (buf!6532 (_2!11803 lt!392547)))) ((_ sign_extend 32) (currentByte!11987 (_2!11803 lt!392547))) ((_ sign_extend 32) (currentBit!11982 (_2!11803 lt!392547))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6030 (buf!6532 (_2!11803 lt!392547)))) ((_ sign_extend 32) (currentByte!11987 (_2!11803 lt!392547))) ((_ sign_extend 32) (currentBit!11982 (_2!11803 lt!392547)))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!21441 () Bool)

(assert (= bs!21441 d!84714))

(assert (=> bs!21441 m!380617))

(assert (=> b!252932 d!84714))

(declare-fun b!253379 () Bool)

(declare-fun e!175565 () Bool)

(declare-fun lt!393585 () tuple2!21752)

(declare-fun lt!393587 () tuple2!21754)

(assert (=> b!253379 (= e!175565 (and (_2!11804 lt!393585) (= (_1!11804 lt!393585) (_2!11805 lt!393587))))))

(assert (=> b!253379 (= lt!393585 (checkBitsLoopPure!0 (_1!11805 lt!393587) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!393586 () Unit!18208)

(declare-fun lt!393584 () Unit!18208)

(assert (=> b!253379 (= lt!393586 lt!393584)))

(declare-fun _$23!36 () tuple2!21750)

(declare-fun lt!393583 () (_ BitVec 64))

(assert (=> b!253379 (validate_offset_bits!1 ((_ sign_extend 32) (size!6030 (buf!6532 (_2!11803 _$23!36)))) ((_ sign_extend 32) (currentByte!11987 (_2!11803 lt!392547))) ((_ sign_extend 32) (currentBit!11982 (_2!11803 lt!392547))) lt!393583)))

(assert (=> b!253379 (= lt!393584 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11803 lt!392547) (buf!6532 (_2!11803 _$23!36)) lt!393583))))

(assert (=> b!253379 (= lt!393583 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!253379 (= lt!393587 (reader!0 (_2!11803 lt!392547) (_2!11803 _$23!36)))))

(declare-fun d!84716 () Bool)

(assert (=> d!84716 e!175565))

(declare-fun res!212312 () Bool)

(assert (=> d!84716 (=> (not res!212312) (not e!175565))))

(assert (=> d!84716 (= res!212312 (= (size!6030 (buf!6532 (_2!11803 lt!392547))) (size!6030 (buf!6532 (_2!11803 _$23!36)))))))

(declare-fun e!175566 () Bool)

(assert (=> d!84716 (and (inv!12 (_2!11803 _$23!36)) e!175566)))

(assert (=> d!84716 (= (choose!51 (_2!11803 lt!392547) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) _$23!36)))

(declare-fun b!253378 () Bool)

(declare-fun res!212313 () Bool)

(assert (=> b!253378 (=> (not res!212313) (not e!175565))))

(assert (=> b!253378 (= res!212313 (isPrefixOf!0 (_2!11803 lt!392547) (_2!11803 _$23!36)))))

(declare-fun b!253377 () Bool)

(declare-fun res!212311 () Bool)

(assert (=> b!253377 (=> (not res!212311) (not e!175565))))

(assert (=> b!253377 (= res!212311 (= (bitIndex!0 (size!6030 (buf!6532 (_2!11803 _$23!36))) (currentByte!11987 (_2!11803 _$23!36)) (currentBit!11982 (_2!11803 _$23!36))) (bvadd (bitIndex!0 (size!6030 (buf!6532 (_2!11803 lt!392547))) (currentByte!11987 (_2!11803 lt!392547)) (currentBit!11982 (_2!11803 lt!392547))) (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))))

(declare-fun b!253376 () Bool)

(assert (=> b!253376 (= e!175566 (array_inv!5771 (buf!6532 (_2!11803 _$23!36))))))

(assert (= d!84716 b!253376))

(assert (= (and d!84716 res!212312) b!253377))

(assert (= (and b!253377 res!212311) b!253378))

(assert (= (and b!253378 res!212313) b!253379))

(declare-fun m!381393 () Bool)

(assert (=> b!253378 m!381393))

(declare-fun m!381395 () Bool)

(assert (=> d!84716 m!381395))

(declare-fun m!381397 () Bool)

(assert (=> b!253376 m!381397))

(declare-fun m!381399 () Bool)

(assert (=> b!253377 m!381399))

(assert (=> b!253377 m!380337))

(declare-fun m!381401 () Bool)

(assert (=> b!253379 m!381401))

(declare-fun m!381403 () Bool)

(assert (=> b!253379 m!381403))

(declare-fun m!381405 () Bool)

(assert (=> b!253379 m!381405))

(declare-fun m!381407 () Bool)

(assert (=> b!253379 m!381407))

(assert (=> d!84388 d!84716))

(declare-fun d!84718 () Bool)

(declare-fun res!212314 () Bool)

(declare-fun e!175568 () Bool)

(assert (=> d!84718 (=> (not res!212314) (not e!175568))))

(assert (=> d!84718 (= res!212314 (= (size!6030 (buf!6532 (_1!11805 lt!392943))) (size!6030 (buf!6532 thiss!1005))))))

(assert (=> d!84718 (= (isPrefixOf!0 (_1!11805 lt!392943) thiss!1005) e!175568)))

(declare-fun b!253380 () Bool)

(declare-fun res!212316 () Bool)

(assert (=> b!253380 (=> (not res!212316) (not e!175568))))

(assert (=> b!253380 (= res!212316 (bvsle (bitIndex!0 (size!6030 (buf!6532 (_1!11805 lt!392943))) (currentByte!11987 (_1!11805 lt!392943)) (currentBit!11982 (_1!11805 lt!392943))) (bitIndex!0 (size!6030 (buf!6532 thiss!1005)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005))))))

(declare-fun b!253381 () Bool)

(declare-fun e!175567 () Bool)

(assert (=> b!253381 (= e!175568 e!175567)))

(declare-fun res!212315 () Bool)

(assert (=> b!253381 (=> res!212315 e!175567)))

(assert (=> b!253381 (= res!212315 (= (size!6030 (buf!6532 (_1!11805 lt!392943))) #b00000000000000000000000000000000))))

(declare-fun b!253382 () Bool)

(assert (=> b!253382 (= e!175567 (arrayBitRangesEq!0 (buf!6532 (_1!11805 lt!392943)) (buf!6532 thiss!1005) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6030 (buf!6532 (_1!11805 lt!392943))) (currentByte!11987 (_1!11805 lt!392943)) (currentBit!11982 (_1!11805 lt!392943)))))))

(assert (= (and d!84718 res!212314) b!253380))

(assert (= (and b!253380 res!212316) b!253381))

(assert (= (and b!253381 (not res!212315)) b!253382))

(declare-fun m!381409 () Bool)

(assert (=> b!253380 m!381409))

(assert (=> b!253380 m!380357))

(assert (=> b!253382 m!381409))

(assert (=> b!253382 m!381409))

(declare-fun m!381411 () Bool)

(assert (=> b!253382 m!381411))

(assert (=> b!252951 d!84718))

(declare-fun d!84720 () Bool)

(declare-fun e!175569 () Bool)

(assert (=> d!84720 e!175569))

(declare-fun res!212317 () Bool)

(assert (=> d!84720 (=> (not res!212317) (not e!175569))))

(assert (=> d!84720 (= res!212317 (= (buf!6532 (_2!11803 (increaseBitIndex!0 (BitStream!10983 (buf!6532 (_2!11803 lt!392552)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005))))) (buf!6532 (BitStream!10983 (buf!6532 (_2!11803 lt!392552)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005)))))))

(declare-fun lt!393589 () Bool)

(assert (=> d!84720 (= lt!393589 (not (= (bvand ((_ sign_extend 24) (select (arr!7017 (buf!6532 (BitStream!10983 (buf!6532 (_2!11803 lt!392552)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005)))) (currentByte!11987 (BitStream!10983 (buf!6532 (_2!11803 lt!392552)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11982 (BitStream!10983 (buf!6532 (_2!11803 lt!392552)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!393594 () tuple2!21758)

(assert (=> d!84720 (= lt!393594 (tuple2!21759 (not (= (bvand ((_ sign_extend 24) (select (arr!7017 (buf!6532 (BitStream!10983 (buf!6532 (_2!11803 lt!392552)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005)))) (currentByte!11987 (BitStream!10983 (buf!6532 (_2!11803 lt!392552)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11982 (BitStream!10983 (buf!6532 (_2!11803 lt!392552)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005)))))) #b00000000000000000000000000000000)) (_2!11803 (increaseBitIndex!0 (BitStream!10983 (buf!6532 (_2!11803 lt!392552)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005))))))))

(assert (=> d!84720 (validate_offset_bit!0 ((_ sign_extend 32) (size!6030 (buf!6532 (BitStream!10983 (buf!6532 (_2!11803 lt!392552)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005))))) ((_ sign_extend 32) (currentByte!11987 (BitStream!10983 (buf!6532 (_2!11803 lt!392552)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005)))) ((_ sign_extend 32) (currentBit!11982 (BitStream!10983 (buf!6532 (_2!11803 lt!392552)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005)))))))

(assert (=> d!84720 (= (readBit!0 (BitStream!10983 (buf!6532 (_2!11803 lt!392552)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005))) lt!393594)))

(declare-fun lt!393592 () (_ BitVec 64))

(declare-fun b!253383 () Bool)

(declare-fun lt!393591 () (_ BitVec 64))

(assert (=> b!253383 (= e!175569 (= (bitIndex!0 (size!6030 (buf!6532 (_2!11803 (increaseBitIndex!0 (BitStream!10983 (buf!6532 (_2!11803 lt!392552)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005)))))) (currentByte!11987 (_2!11803 (increaseBitIndex!0 (BitStream!10983 (buf!6532 (_2!11803 lt!392552)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005))))) (currentBit!11982 (_2!11803 (increaseBitIndex!0 (BitStream!10983 (buf!6532 (_2!11803 lt!392552)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005)))))) (bvadd lt!393592 lt!393591)))))

(assert (=> b!253383 (or (not (= (bvand lt!393592 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!393591 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!393592 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!393592 lt!393591) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!253383 (= lt!393591 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!253383 (= lt!393592 (bitIndex!0 (size!6030 (buf!6532 (BitStream!10983 (buf!6532 (_2!11803 lt!392552)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005)))) (currentByte!11987 (BitStream!10983 (buf!6532 (_2!11803 lt!392552)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005))) (currentBit!11982 (BitStream!10983 (buf!6532 (_2!11803 lt!392552)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005)))))))

(declare-fun lt!393593 () Bool)

(assert (=> b!253383 (= lt!393593 (not (= (bvand ((_ sign_extend 24) (select (arr!7017 (buf!6532 (BitStream!10983 (buf!6532 (_2!11803 lt!392552)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005)))) (currentByte!11987 (BitStream!10983 (buf!6532 (_2!11803 lt!392552)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11982 (BitStream!10983 (buf!6532 (_2!11803 lt!392552)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!393588 () Bool)

(assert (=> b!253383 (= lt!393588 (not (= (bvand ((_ sign_extend 24) (select (arr!7017 (buf!6532 (BitStream!10983 (buf!6532 (_2!11803 lt!392552)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005)))) (currentByte!11987 (BitStream!10983 (buf!6532 (_2!11803 lt!392552)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11982 (BitStream!10983 (buf!6532 (_2!11803 lt!392552)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!393590 () Bool)

(assert (=> b!253383 (= lt!393590 (not (= (bvand ((_ sign_extend 24) (select (arr!7017 (buf!6532 (BitStream!10983 (buf!6532 (_2!11803 lt!392552)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005)))) (currentByte!11987 (BitStream!10983 (buf!6532 (_2!11803 lt!392552)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11982 (BitStream!10983 (buf!6532 (_2!11803 lt!392552)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!84720 res!212317) b!253383))

(declare-fun m!381413 () Bool)

(assert (=> d!84720 m!381413))

(declare-fun m!381415 () Bool)

(assert (=> d!84720 m!381415))

(declare-fun m!381417 () Bool)

(assert (=> d!84720 m!381417))

(declare-fun m!381419 () Bool)

(assert (=> d!84720 m!381419))

(declare-fun m!381421 () Bool)

(assert (=> b!253383 m!381421))

(assert (=> b!253383 m!381415))

(assert (=> b!253383 m!381417))

(declare-fun m!381423 () Bool)

(assert (=> b!253383 m!381423))

(assert (=> b!253383 m!381413))

(assert (=> d!84382 d!84720))

(declare-fun d!84722 () Bool)

(assert (=> d!84722 (= (remainingBits!0 ((_ sign_extend 32) (size!6030 (buf!6532 (_1!11804 lt!392557)))) ((_ sign_extend 32) (currentByte!11987 (_1!11804 lt!392557))) ((_ sign_extend 32) (currentBit!11982 (_1!11804 lt!392557)))) (bvsub (bvmul ((_ sign_extend 32) (size!6030 (buf!6532 (_1!11804 lt!392557)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11987 (_1!11804 lt!392557))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11982 (_1!11804 lt!392557))))))))

(assert (=> d!84398 d!84722))

(declare-fun d!84724 () Bool)

(assert (=> d!84724 (= (invariant!0 (currentBit!11982 (_1!11804 lt!392557)) (currentByte!11987 (_1!11804 lt!392557)) (size!6030 (buf!6532 (_1!11804 lt!392557)))) (and (bvsge (currentBit!11982 (_1!11804 lt!392557)) #b00000000000000000000000000000000) (bvslt (currentBit!11982 (_1!11804 lt!392557)) #b00000000000000000000000000001000) (bvsge (currentByte!11987 (_1!11804 lt!392557)) #b00000000000000000000000000000000) (or (bvslt (currentByte!11987 (_1!11804 lt!392557)) (size!6030 (buf!6532 (_1!11804 lt!392557)))) (and (= (currentBit!11982 (_1!11804 lt!392557)) #b00000000000000000000000000000000) (= (currentByte!11987 (_1!11804 lt!392557)) (size!6030 (buf!6532 (_1!11804 lt!392557))))))))))

(assert (=> d!84398 d!84724))

(declare-fun d!84726 () Bool)

(declare-fun e!175570 () Bool)

(assert (=> d!84726 e!175570))

(declare-fun res!212318 () Bool)

(assert (=> d!84726 (=> (not res!212318) (not e!175570))))

(declare-fun lt!393600 () (_ BitVec 64))

(declare-fun lt!393595 () (_ BitVec 64))

(declare-fun lt!393597 () (_ BitVec 64))

(assert (=> d!84726 (= res!212318 (= lt!393597 (bvsub lt!393595 lt!393600)))))

(assert (=> d!84726 (or (= (bvand lt!393595 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!393600 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!393595 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!393595 lt!393600) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84726 (= lt!393600 (remainingBits!0 ((_ sign_extend 32) (size!6030 (buf!6532 (_1!11804 lt!392875)))) ((_ sign_extend 32) (currentByte!11987 (_1!11804 lt!392875))) ((_ sign_extend 32) (currentBit!11982 (_1!11804 lt!392875)))))))

(declare-fun lt!393598 () (_ BitVec 64))

(declare-fun lt!393599 () (_ BitVec 64))

(assert (=> d!84726 (= lt!393595 (bvmul lt!393598 lt!393599))))

(assert (=> d!84726 (or (= lt!393598 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!393599 (bvsdiv (bvmul lt!393598 lt!393599) lt!393598)))))

(assert (=> d!84726 (= lt!393599 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84726 (= lt!393598 ((_ sign_extend 32) (size!6030 (buf!6532 (_1!11804 lt!392875)))))))

(assert (=> d!84726 (= lt!393597 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11987 (_1!11804 lt!392875))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11982 (_1!11804 lt!392875)))))))

(assert (=> d!84726 (invariant!0 (currentBit!11982 (_1!11804 lt!392875)) (currentByte!11987 (_1!11804 lt!392875)) (size!6030 (buf!6532 (_1!11804 lt!392875))))))

(assert (=> d!84726 (= (bitIndex!0 (size!6030 (buf!6532 (_1!11804 lt!392875))) (currentByte!11987 (_1!11804 lt!392875)) (currentBit!11982 (_1!11804 lt!392875))) lt!393597)))

(declare-fun b!253384 () Bool)

(declare-fun res!212319 () Bool)

(assert (=> b!253384 (=> (not res!212319) (not e!175570))))

(assert (=> b!253384 (= res!212319 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!393597))))

(declare-fun b!253385 () Bool)

(declare-fun lt!393596 () (_ BitVec 64))

(assert (=> b!253385 (= e!175570 (bvsle lt!393597 (bvmul lt!393596 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253385 (or (= lt!393596 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!393596 #b0000000000000000000000000000000000000000000000000000000000001000) lt!393596)))))

(assert (=> b!253385 (= lt!393596 ((_ sign_extend 32) (size!6030 (buf!6532 (_1!11804 lt!392875)))))))

(assert (= (and d!84726 res!212318) b!253384))

(assert (= (and b!253384 res!212319) b!253385))

(declare-fun m!381425 () Bool)

(assert (=> d!84726 m!381425))

(declare-fun m!381427 () Bool)

(assert (=> d!84726 m!381427))

(assert (=> b!252924 d!84726))

(assert (=> b!252924 d!84650))

(declare-fun d!84728 () Bool)

(declare-fun e!175571 () Bool)

(assert (=> d!84728 e!175571))

(declare-fun res!212320 () Bool)

(assert (=> d!84728 (=> (not res!212320) (not e!175571))))

(assert (=> d!84728 (= res!212320 (= (buf!6532 (_2!11803 (increaseBitIndex!0 (_1!11805 lt!392558)))) (buf!6532 (_1!11805 lt!392558))))))

(declare-fun lt!393602 () Bool)

(assert (=> d!84728 (= lt!393602 (not (= (bvand ((_ sign_extend 24) (select (arr!7017 (buf!6532 (_1!11805 lt!392558))) (currentByte!11987 (_1!11805 lt!392558)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11982 (_1!11805 lt!392558))))) #b00000000000000000000000000000000)))))

(declare-fun lt!393607 () tuple2!21758)

(assert (=> d!84728 (= lt!393607 (tuple2!21759 (not (= (bvand ((_ sign_extend 24) (select (arr!7017 (buf!6532 (_1!11805 lt!392558))) (currentByte!11987 (_1!11805 lt!392558)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11982 (_1!11805 lt!392558))))) #b00000000000000000000000000000000)) (_2!11803 (increaseBitIndex!0 (_1!11805 lt!392558)))))))

(assert (=> d!84728 (validate_offset_bit!0 ((_ sign_extend 32) (size!6030 (buf!6532 (_1!11805 lt!392558)))) ((_ sign_extend 32) (currentByte!11987 (_1!11805 lt!392558))) ((_ sign_extend 32) (currentBit!11982 (_1!11805 lt!392558))))))

(assert (=> d!84728 (= (readBit!0 (_1!11805 lt!392558)) lt!393607)))

(declare-fun b!253386 () Bool)

(declare-fun lt!393604 () (_ BitVec 64))

(declare-fun lt!393605 () (_ BitVec 64))

(assert (=> b!253386 (= e!175571 (= (bitIndex!0 (size!6030 (buf!6532 (_2!11803 (increaseBitIndex!0 (_1!11805 lt!392558))))) (currentByte!11987 (_2!11803 (increaseBitIndex!0 (_1!11805 lt!392558)))) (currentBit!11982 (_2!11803 (increaseBitIndex!0 (_1!11805 lt!392558))))) (bvadd lt!393605 lt!393604)))))

(assert (=> b!253386 (or (not (= (bvand lt!393605 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!393604 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!393605 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!393605 lt!393604) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!253386 (= lt!393604 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!253386 (= lt!393605 (bitIndex!0 (size!6030 (buf!6532 (_1!11805 lt!392558))) (currentByte!11987 (_1!11805 lt!392558)) (currentBit!11982 (_1!11805 lt!392558))))))

(declare-fun lt!393606 () Bool)

(assert (=> b!253386 (= lt!393606 (not (= (bvand ((_ sign_extend 24) (select (arr!7017 (buf!6532 (_1!11805 lt!392558))) (currentByte!11987 (_1!11805 lt!392558)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11982 (_1!11805 lt!392558))))) #b00000000000000000000000000000000)))))

(declare-fun lt!393601 () Bool)

(assert (=> b!253386 (= lt!393601 (not (= (bvand ((_ sign_extend 24) (select (arr!7017 (buf!6532 (_1!11805 lt!392558))) (currentByte!11987 (_1!11805 lt!392558)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11982 (_1!11805 lt!392558))))) #b00000000000000000000000000000000)))))

(declare-fun lt!393603 () Bool)

(assert (=> b!253386 (= lt!393603 (not (= (bvand ((_ sign_extend 24) (select (arr!7017 (buf!6532 (_1!11805 lt!392558))) (currentByte!11987 (_1!11805 lt!392558)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11982 (_1!11805 lt!392558))))) #b00000000000000000000000000000000)))))

(assert (= (and d!84728 res!212320) b!253386))

(declare-fun m!381429 () Bool)

(assert (=> d!84728 m!381429))

(declare-fun m!381431 () Bool)

(assert (=> d!84728 m!381431))

(declare-fun m!381433 () Bool)

(assert (=> d!84728 m!381433))

(declare-fun m!381435 () Bool)

(assert (=> d!84728 m!381435))

(assert (=> b!253386 m!380723))

(assert (=> b!253386 m!381431))

(assert (=> b!253386 m!381433))

(declare-fun m!381437 () Bool)

(assert (=> b!253386 m!381437))

(assert (=> b!253386 m!381429))

(assert (=> d!84378 d!84728))

(declare-fun b!253387 () Bool)

(declare-fun e!175574 () tuple2!21758)

(assert (=> b!253387 (= e!175574 (tuple2!21759 true (_1!11805 lt!392560)))))

(declare-fun b!253388 () Bool)

(declare-fun res!212325 () Bool)

(declare-fun e!175572 () Bool)

(assert (=> b!253388 (=> (not res!212325) (not e!175572))))

(declare-fun lt!393616 () tuple2!21758)

(assert (=> b!253388 (= res!212325 (and (= (buf!6532 (_1!11805 lt!392560)) (buf!6532 (_2!11807 lt!393616))) (or (not (= nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289))) (_1!11807 lt!393616))))))

(declare-fun lt!393611 () (_ BitVec 64))

(declare-fun e!175576 () Bool)

(declare-fun b!253389 () Bool)

(assert (=> b!253389 (= e!175576 (= (bvsub lt!393611 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (bitIndex!0 (size!6030 (buf!6532 (_2!11807 lt!393616))) (currentByte!11987 (_2!11807 lt!393616)) (currentBit!11982 (_2!11807 lt!393616)))))))

(assert (=> b!253389 (or (= (bvand lt!393611 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!393611 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!393611 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!393608 () (_ BitVec 64))

(assert (=> b!253389 (= lt!393611 (bvadd lt!393608 nBits!297))))

(assert (=> b!253389 (or (not (= (bvand lt!393608 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!393608 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!393608 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!253389 (= lt!393608 (bitIndex!0 (size!6030 (buf!6532 (_1!11805 lt!392560))) (currentByte!11987 (_1!11805 lt!392560)) (currentBit!11982 (_1!11805 lt!392560))))))

(declare-fun b!253390 () Bool)

(declare-fun e!175575 () Bool)

(assert (=> b!253390 (= e!175572 e!175575)))

(declare-fun res!212321 () Bool)

(assert (=> b!253390 (=> res!212321 e!175575)))

(assert (=> b!253390 (= res!212321 (or (not (_1!11807 lt!393616)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) nBits!297)))))

(declare-fun d!84730 () Bool)

(assert (=> d!84730 e!175572))

(declare-fun res!212323 () Bool)

(assert (=> d!84730 (=> (not res!212323) (not e!175572))))

(declare-fun lt!393610 () (_ BitVec 64))

(assert (=> d!84730 (= res!212323 (bvsge (bvsub lt!393610 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (bitIndex!0 (size!6030 (buf!6532 (_2!11807 lt!393616))) (currentByte!11987 (_2!11807 lt!393616)) (currentBit!11982 (_2!11807 lt!393616)))))))

(assert (=> d!84730 (or (= (bvand lt!393610 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!393610 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!393610 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!393612 () (_ BitVec 64))

(assert (=> d!84730 (= lt!393610 (bvadd lt!393612 nBits!297))))

(assert (=> d!84730 (or (not (= (bvand lt!393612 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!393612 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!393612 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84730 (= lt!393612 (bitIndex!0 (size!6030 (buf!6532 (_1!11805 lt!392560))) (currentByte!11987 (_1!11805 lt!392560)) (currentBit!11982 (_1!11805 lt!392560))))))

(assert (=> d!84730 (= lt!393616 e!175574)))

(declare-fun c!11670 () Bool)

(assert (=> d!84730 (= c!11670 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) nBits!297))))

(assert (=> d!84730 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!84730 (= (checkBitsLoop!0 (_1!11805 lt!392560) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!393616)))

(declare-fun b!253391 () Bool)

(declare-fun e!175573 () tuple2!21758)

(assert (=> b!253391 (= e!175574 e!175573)))

(declare-fun lt!393618 () tuple2!21758)

(assert (=> b!253391 (= lt!393618 (readBit!0 (_1!11805 lt!392560)))))

(declare-fun c!11669 () Bool)

(assert (=> b!253391 (= c!11669 (not (= (_1!11807 lt!393618) bit!26)))))

(declare-fun b!253392 () Bool)

(assert (=> b!253392 (= e!175575 (= bit!26 (_2!11804 (readBitPure!0 (_1!11805 lt!392560)))))))

(declare-fun b!253393 () Bool)

(declare-fun res!212322 () Bool)

(assert (=> b!253393 (=> (not res!212322) (not e!175572))))

(assert (=> b!253393 (= res!212322 e!175576)))

(declare-fun res!212324 () Bool)

(assert (=> b!253393 (=> res!212324 e!175576)))

(assert (=> b!253393 (= res!212324 (not (_1!11807 lt!393616)))))

(declare-fun lt!393614 () tuple2!21758)

(declare-fun b!253394 () Bool)

(assert (=> b!253394 (= lt!393614 (checkBitsLoop!0 (_2!11807 lt!393618) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!393615 () Unit!18208)

(declare-fun lt!393609 () Unit!18208)

(assert (=> b!253394 (= lt!393615 lt!393609)))

(declare-fun lt!393617 () (_ BitVec 64))

(declare-fun lt!393613 () (_ BitVec 64))

(assert (=> b!253394 (validate_offset_bits!1 ((_ sign_extend 32) (size!6030 (buf!6532 (_2!11807 lt!393618)))) ((_ sign_extend 32) (currentByte!11987 (_2!11807 lt!393618))) ((_ sign_extend 32) (currentBit!11982 (_2!11807 lt!393618))) (bvsub lt!393617 lt!393613))))

(assert (=> b!253394 (= lt!393609 (validateOffsetBitsIneqLemma!0 (_1!11805 lt!392560) (_2!11807 lt!393618) lt!393617 lt!393613))))

(assert (=> b!253394 (= lt!393613 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!253394 (= lt!393617 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!253394 (= e!175573 (tuple2!21759 (_1!11807 lt!393614) (_2!11807 lt!393614)))))

(declare-fun b!253395 () Bool)

(assert (=> b!253395 (= e!175573 (tuple2!21759 false (_2!11807 lt!393618)))))

(assert (= (and d!84730 c!11670) b!253387))

(assert (= (and d!84730 (not c!11670)) b!253391))

(assert (= (and b!253391 c!11669) b!253395))

(assert (= (and b!253391 (not c!11669)) b!253394))

(assert (= (and d!84730 res!212323) b!253388))

(assert (= (and b!253388 res!212325) b!253393))

(assert (= (and b!253393 (not res!212324)) b!253389))

(assert (= (and b!253393 res!212322) b!253390))

(assert (= (and b!253390 (not res!212321)) b!253392))

(declare-fun m!381439 () Bool)

(assert (=> b!253389 m!381439))

(declare-fun m!381441 () Bool)

(assert (=> b!253389 m!381441))

(declare-fun m!381443 () Bool)

(assert (=> b!253392 m!381443))

(assert (=> d!84730 m!381439))

(assert (=> d!84730 m!381441))

(declare-fun m!381445 () Bool)

(assert (=> b!253394 m!381445))

(declare-fun m!381447 () Bool)

(assert (=> b!253394 m!381447))

(declare-fun m!381449 () Bool)

(assert (=> b!253394 m!381449))

(declare-fun m!381451 () Bool)

(assert (=> b!253391 m!381451))

(assert (=> d!84360 d!84730))

(assert (=> d!84370 d!84386))

(declare-fun d!84732 () Bool)

(assert (=> d!84732 (validate_offset_bits!1 ((_ sign_extend 32) (size!6030 (buf!6532 (_2!11803 lt!392552)))) ((_ sign_extend 32) (currentByte!11987 thiss!1005)) ((_ sign_extend 32) (currentBit!11982 thiss!1005)) (bvsub nBits!297 from!289))))

(assert (=> d!84732 true))

(declare-fun _$6!423 () Unit!18208)

(assert (=> d!84732 (= (choose!9 thiss!1005 (buf!6532 (_2!11803 lt!392552)) (bvsub nBits!297 from!289) (BitStream!10983 (buf!6532 (_2!11803 lt!392552)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005))) _$6!423)))

(declare-fun bs!21442 () Bool)

(assert (= bs!21442 d!84732))

(assert (=> bs!21442 m!380369))

(assert (=> d!84370 d!84732))

(assert (=> d!84364 d!84358))

(declare-fun d!84734 () Bool)

(assert (=> d!84734 (validate_offset_bits!1 ((_ sign_extend 32) (size!6030 (buf!6532 (_2!11803 lt!392552)))) ((_ sign_extend 32) (currentByte!11987 (_2!11803 lt!392547))) ((_ sign_extend 32) (currentBit!11982 (_2!11803 lt!392547))) lt!392568)))

(assert (=> d!84734 true))

(declare-fun _$6!424 () Unit!18208)

(assert (=> d!84734 (= (choose!9 (_2!11803 lt!392547) (buf!6532 (_2!11803 lt!392552)) lt!392568 (BitStream!10983 (buf!6532 (_2!11803 lt!392552)) (currentByte!11987 (_2!11803 lt!392547)) (currentBit!11982 (_2!11803 lt!392547)))) _$6!424)))

(declare-fun bs!21443 () Bool)

(assert (= bs!21443 d!84734))

(assert (=> bs!21443 m!380367))

(assert (=> d!84364 d!84734))

(assert (=> d!84380 d!84366))

(declare-fun d!84736 () Bool)

(assert (=> d!84736 (isPrefixOf!0 thiss!1005 (_2!11803 lt!392552))))

(assert (=> d!84736 true))

(declare-fun _$15!327 () Unit!18208)

(assert (=> d!84736 (= (choose!30 thiss!1005 (_2!11803 lt!392547) (_2!11803 lt!392552)) _$15!327)))

(declare-fun bs!21444 () Bool)

(assert (= bs!21444 d!84736))

(assert (=> bs!21444 m!380395))

(assert (=> d!84380 d!84736))

(assert (=> d!84380 d!84344))

(declare-fun d!84738 () Bool)

(assert (=> d!84738 (= (remainingBits!0 ((_ sign_extend 32) (size!6030 (buf!6532 (_1!11804 lt!392567)))) ((_ sign_extend 32) (currentByte!11987 (_1!11804 lt!392567))) ((_ sign_extend 32) (currentBit!11982 (_1!11804 lt!392567)))) (bvsub (bvmul ((_ sign_extend 32) (size!6030 (buf!6532 (_1!11804 lt!392567)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11987 (_1!11804 lt!392567))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11982 (_1!11804 lt!392567))))))))

(assert (=> d!84362 d!84738))

(declare-fun d!84740 () Bool)

(assert (=> d!84740 (= (invariant!0 (currentBit!11982 (_1!11804 lt!392567)) (currentByte!11987 (_1!11804 lt!392567)) (size!6030 (buf!6532 (_1!11804 lt!392567)))) (and (bvsge (currentBit!11982 (_1!11804 lt!392567)) #b00000000000000000000000000000000) (bvslt (currentBit!11982 (_1!11804 lt!392567)) #b00000000000000000000000000001000) (bvsge (currentByte!11987 (_1!11804 lt!392567)) #b00000000000000000000000000000000) (or (bvslt (currentByte!11987 (_1!11804 lt!392567)) (size!6030 (buf!6532 (_1!11804 lt!392567)))) (and (= (currentBit!11982 (_1!11804 lt!392567)) #b00000000000000000000000000000000) (= (currentByte!11987 (_1!11804 lt!392567)) (size!6030 (buf!6532 (_1!11804 lt!392567))))))))))

(assert (=> d!84362 d!84740))

(declare-fun d!84742 () Bool)

(declare-fun e!175577 () Bool)

(assert (=> d!84742 e!175577))

(declare-fun res!212326 () Bool)

(assert (=> d!84742 (=> (not res!212326) (not e!175577))))

(assert (=> d!84742 (= res!212326 (= (buf!6532 (_2!11803 (increaseBitIndex!0 lt!392566))) (buf!6532 lt!392566)))))

(declare-fun lt!393620 () Bool)

(assert (=> d!84742 (= lt!393620 (not (= (bvand ((_ sign_extend 24) (select (arr!7017 (buf!6532 lt!392566)) (currentByte!11987 lt!392566))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11982 lt!392566)))) #b00000000000000000000000000000000)))))

(declare-fun lt!393625 () tuple2!21758)

(assert (=> d!84742 (= lt!393625 (tuple2!21759 (not (= (bvand ((_ sign_extend 24) (select (arr!7017 (buf!6532 lt!392566)) (currentByte!11987 lt!392566))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11982 lt!392566)))) #b00000000000000000000000000000000)) (_2!11803 (increaseBitIndex!0 lt!392566))))))

(assert (=> d!84742 (validate_offset_bit!0 ((_ sign_extend 32) (size!6030 (buf!6532 lt!392566))) ((_ sign_extend 32) (currentByte!11987 lt!392566)) ((_ sign_extend 32) (currentBit!11982 lt!392566)))))

(assert (=> d!84742 (= (readBit!0 lt!392566) lt!393625)))

(declare-fun b!253396 () Bool)

(declare-fun lt!393622 () (_ BitVec 64))

(declare-fun lt!393623 () (_ BitVec 64))

(assert (=> b!253396 (= e!175577 (= (bitIndex!0 (size!6030 (buf!6532 (_2!11803 (increaseBitIndex!0 lt!392566)))) (currentByte!11987 (_2!11803 (increaseBitIndex!0 lt!392566))) (currentBit!11982 (_2!11803 (increaseBitIndex!0 lt!392566)))) (bvadd lt!393623 lt!393622)))))

(assert (=> b!253396 (or (not (= (bvand lt!393623 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!393622 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!393623 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!393623 lt!393622) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!253396 (= lt!393622 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!253396 (= lt!393623 (bitIndex!0 (size!6030 (buf!6532 lt!392566)) (currentByte!11987 lt!392566) (currentBit!11982 lt!392566)))))

(declare-fun lt!393624 () Bool)

(assert (=> b!253396 (= lt!393624 (not (= (bvand ((_ sign_extend 24) (select (arr!7017 (buf!6532 lt!392566)) (currentByte!11987 lt!392566))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11982 lt!392566)))) #b00000000000000000000000000000000)))))

(declare-fun lt!393619 () Bool)

(assert (=> b!253396 (= lt!393619 (not (= (bvand ((_ sign_extend 24) (select (arr!7017 (buf!6532 lt!392566)) (currentByte!11987 lt!392566))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11982 lt!392566)))) #b00000000000000000000000000000000)))))

(declare-fun lt!393621 () Bool)

(assert (=> b!253396 (= lt!393621 (not (= (bvand ((_ sign_extend 24) (select (arr!7017 (buf!6532 lt!392566)) (currentByte!11987 lt!392566))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11982 lt!392566)))) #b00000000000000000000000000000000)))))

(assert (= (and d!84742 res!212326) b!253396))

(declare-fun m!381453 () Bool)

(assert (=> d!84742 m!381453))

(declare-fun m!381455 () Bool)

(assert (=> d!84742 m!381455))

(declare-fun m!381457 () Bool)

(assert (=> d!84742 m!381457))

(declare-fun m!381459 () Bool)

(assert (=> d!84742 m!381459))

(declare-fun m!381461 () Bool)

(assert (=> b!253396 m!381461))

(assert (=> b!253396 m!381455))

(assert (=> b!253396 m!381457))

(declare-fun m!381463 () Bool)

(assert (=> b!253396 m!381463))

(assert (=> b!253396 m!381453))

(assert (=> d!84384 d!84742))

(declare-fun d!84744 () Bool)

(assert (=> d!84744 (= (remainingBits!0 ((_ sign_extend 32) (size!6030 (buf!6532 (_1!11804 lt!392565)))) ((_ sign_extend 32) (currentByte!11987 (_1!11804 lt!392565))) ((_ sign_extend 32) (currentBit!11982 (_1!11804 lt!392565)))) (bvsub (bvmul ((_ sign_extend 32) (size!6030 (buf!6532 (_1!11804 lt!392565)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11987 (_1!11804 lt!392565))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11982 (_1!11804 lt!392565))))))))

(assert (=> d!84376 d!84744))

(declare-fun d!84746 () Bool)

(assert (=> d!84746 (= (invariant!0 (currentBit!11982 (_1!11804 lt!392565)) (currentByte!11987 (_1!11804 lt!392565)) (size!6030 (buf!6532 (_1!11804 lt!392565)))) (and (bvsge (currentBit!11982 (_1!11804 lt!392565)) #b00000000000000000000000000000000) (bvslt (currentBit!11982 (_1!11804 lt!392565)) #b00000000000000000000000000001000) (bvsge (currentByte!11987 (_1!11804 lt!392565)) #b00000000000000000000000000000000) (or (bvslt (currentByte!11987 (_1!11804 lt!392565)) (size!6030 (buf!6532 (_1!11804 lt!392565)))) (and (= (currentBit!11982 (_1!11804 lt!392565)) #b00000000000000000000000000000000) (= (currentByte!11987 (_1!11804 lt!392565)) (size!6030 (buf!6532 (_1!11804 lt!392565))))))))))

(assert (=> d!84376 d!84746))

(declare-fun d!84748 () Bool)

(declare-fun e!175578 () Bool)

(assert (=> d!84748 e!175578))

(declare-fun res!212327 () Bool)

(assert (=> d!84748 (=> (not res!212327) (not e!175578))))

(declare-fun lt!393626 () (_ BitVec 64))

(declare-fun lt!393628 () (_ BitVec 64))

(declare-fun lt!393631 () (_ BitVec 64))

(assert (=> d!84748 (= res!212327 (= lt!393628 (bvsub lt!393626 lt!393631)))))

(assert (=> d!84748 (or (= (bvand lt!393626 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!393631 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!393626 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!393626 lt!393631) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84748 (= lt!393631 (remainingBits!0 ((_ sign_extend 32) (size!6030 (buf!6532 (_2!11803 lt!392937)))) ((_ sign_extend 32) (currentByte!11987 (_2!11803 lt!392937))) ((_ sign_extend 32) (currentBit!11982 (_2!11803 lt!392937)))))))

(declare-fun lt!393629 () (_ BitVec 64))

(declare-fun lt!393630 () (_ BitVec 64))

(assert (=> d!84748 (= lt!393626 (bvmul lt!393629 lt!393630))))

(assert (=> d!84748 (or (= lt!393629 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!393630 (bvsdiv (bvmul lt!393629 lt!393630) lt!393629)))))

(assert (=> d!84748 (= lt!393630 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84748 (= lt!393629 ((_ sign_extend 32) (size!6030 (buf!6532 (_2!11803 lt!392937)))))))

(assert (=> d!84748 (= lt!393628 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11987 (_2!11803 lt!392937))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11982 (_2!11803 lt!392937)))))))

(assert (=> d!84748 (invariant!0 (currentBit!11982 (_2!11803 lt!392937)) (currentByte!11987 (_2!11803 lt!392937)) (size!6030 (buf!6532 (_2!11803 lt!392937))))))

(assert (=> d!84748 (= (bitIndex!0 (size!6030 (buf!6532 (_2!11803 lt!392937))) (currentByte!11987 (_2!11803 lt!392937)) (currentBit!11982 (_2!11803 lt!392937))) lt!393628)))

(declare-fun b!253397 () Bool)

(declare-fun res!212328 () Bool)

(assert (=> b!253397 (=> (not res!212328) (not e!175578))))

(assert (=> b!253397 (= res!212328 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!393628))))

(declare-fun b!253398 () Bool)

(declare-fun lt!393627 () (_ BitVec 64))

(assert (=> b!253398 (= e!175578 (bvsle lt!393628 (bvmul lt!393627 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253398 (or (= lt!393627 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!393627 #b0000000000000000000000000000000000000000000000000000000000001000) lt!393627)))))

(assert (=> b!253398 (= lt!393627 ((_ sign_extend 32) (size!6030 (buf!6532 (_2!11803 lt!392937)))))))

(assert (= (and d!84748 res!212327) b!253397))

(assert (= (and b!253397 res!212328) b!253398))

(declare-fun m!381465 () Bool)

(assert (=> d!84748 m!381465))

(declare-fun m!381467 () Bool)

(assert (=> d!84748 m!381467))

(assert (=> b!252946 d!84748))

(assert (=> b!252946 d!84346))

(assert (=> d!84390 d!84366))

(declare-fun d!84750 () Bool)

(declare-fun res!212329 () Bool)

(declare-fun e!175580 () Bool)

(assert (=> d!84750 (=> (not res!212329) (not e!175580))))

(assert (=> d!84750 (= res!212329 (= (size!6030 (buf!6532 (_2!11803 lt!392552))) (size!6030 (buf!6532 (_2!11803 lt!392552)))))))

(assert (=> d!84750 (= (isPrefixOf!0 (_2!11803 lt!392552) (_2!11803 lt!392552)) e!175580)))

(declare-fun b!253399 () Bool)

(declare-fun res!212331 () Bool)

(assert (=> b!253399 (=> (not res!212331) (not e!175580))))

(assert (=> b!253399 (= res!212331 (bvsle (bitIndex!0 (size!6030 (buf!6532 (_2!11803 lt!392552))) (currentByte!11987 (_2!11803 lt!392552)) (currentBit!11982 (_2!11803 lt!392552))) (bitIndex!0 (size!6030 (buf!6532 (_2!11803 lt!392552))) (currentByte!11987 (_2!11803 lt!392552)) (currentBit!11982 (_2!11803 lt!392552)))))))

(declare-fun b!253400 () Bool)

(declare-fun e!175579 () Bool)

(assert (=> b!253400 (= e!175580 e!175579)))

(declare-fun res!212330 () Bool)

(assert (=> b!253400 (=> res!212330 e!175579)))

(assert (=> b!253400 (= res!212330 (= (size!6030 (buf!6532 (_2!11803 lt!392552))) #b00000000000000000000000000000000))))

(declare-fun b!253401 () Bool)

(assert (=> b!253401 (= e!175579 (arrayBitRangesEq!0 (buf!6532 (_2!11803 lt!392552)) (buf!6532 (_2!11803 lt!392552)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6030 (buf!6532 (_2!11803 lt!392552))) (currentByte!11987 (_2!11803 lt!392552)) (currentBit!11982 (_2!11803 lt!392552)))))))

(assert (= (and d!84750 res!212329) b!253399))

(assert (= (and b!253399 res!212331) b!253400))

(assert (= (and b!253400 (not res!212330)) b!253401))

(assert (=> b!253399 m!380335))

(assert (=> b!253399 m!380335))

(assert (=> b!253401 m!380335))

(assert (=> b!253401 m!380335))

(declare-fun m!381469 () Bool)

(assert (=> b!253401 m!381469))

(assert (=> d!84390 d!84750))

(declare-fun d!84752 () Bool)

(declare-fun res!212332 () Bool)

(declare-fun e!175582 () Bool)

(assert (=> d!84752 (=> (not res!212332) (not e!175582))))

(assert (=> d!84752 (= res!212332 (= (size!6030 (buf!6532 (_1!11805 lt!392943))) (size!6030 (buf!6532 (_2!11805 lt!392943)))))))

(assert (=> d!84752 (= (isPrefixOf!0 (_1!11805 lt!392943) (_2!11805 lt!392943)) e!175582)))

(declare-fun b!253402 () Bool)

(declare-fun res!212334 () Bool)

(assert (=> b!253402 (=> (not res!212334) (not e!175582))))

(assert (=> b!253402 (= res!212334 (bvsle (bitIndex!0 (size!6030 (buf!6532 (_1!11805 lt!392943))) (currentByte!11987 (_1!11805 lt!392943)) (currentBit!11982 (_1!11805 lt!392943))) (bitIndex!0 (size!6030 (buf!6532 (_2!11805 lt!392943))) (currentByte!11987 (_2!11805 lt!392943)) (currentBit!11982 (_2!11805 lt!392943)))))))

(declare-fun b!253403 () Bool)

(declare-fun e!175581 () Bool)

(assert (=> b!253403 (= e!175582 e!175581)))

(declare-fun res!212333 () Bool)

(assert (=> b!253403 (=> res!212333 e!175581)))

(assert (=> b!253403 (= res!212333 (= (size!6030 (buf!6532 (_1!11805 lt!392943))) #b00000000000000000000000000000000))))

(declare-fun b!253404 () Bool)

(assert (=> b!253404 (= e!175581 (arrayBitRangesEq!0 (buf!6532 (_1!11805 lt!392943)) (buf!6532 (_2!11805 lt!392943)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6030 (buf!6532 (_1!11805 lt!392943))) (currentByte!11987 (_1!11805 lt!392943)) (currentBit!11982 (_1!11805 lt!392943)))))))

(assert (= (and d!84752 res!212332) b!253402))

(assert (= (and b!253402 res!212334) b!253403))

(assert (= (and b!253403 (not res!212333)) b!253404))

(assert (=> b!253402 m!381409))

(assert (=> b!253402 m!381245))

(assert (=> b!253404 m!381409))

(assert (=> b!253404 m!381409))

(declare-fun m!381471 () Bool)

(assert (=> b!253404 m!381471))

(assert (=> d!84390 d!84752))

(declare-fun d!84754 () Bool)

(declare-fun res!212335 () Bool)

(declare-fun e!175584 () Bool)

(assert (=> d!84754 (=> (not res!212335) (not e!175584))))

(assert (=> d!84754 (= res!212335 (= (size!6030 (buf!6532 thiss!1005)) (size!6030 (buf!6532 thiss!1005))))))

(assert (=> d!84754 (= (isPrefixOf!0 thiss!1005 thiss!1005) e!175584)))

(declare-fun b!253405 () Bool)

(declare-fun res!212337 () Bool)

(assert (=> b!253405 (=> (not res!212337) (not e!175584))))

(assert (=> b!253405 (= res!212337 (bvsle (bitIndex!0 (size!6030 (buf!6532 thiss!1005)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005)) (bitIndex!0 (size!6030 (buf!6532 thiss!1005)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005))))))

(declare-fun b!253406 () Bool)

(declare-fun e!175583 () Bool)

(assert (=> b!253406 (= e!175584 e!175583)))

(declare-fun res!212336 () Bool)

(assert (=> b!253406 (=> res!212336 e!175583)))

(assert (=> b!253406 (= res!212336 (= (size!6030 (buf!6532 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!253407 () Bool)

(assert (=> b!253407 (= e!175583 (arrayBitRangesEq!0 (buf!6532 thiss!1005) (buf!6532 thiss!1005) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6030 (buf!6532 thiss!1005)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005))))))

(assert (= (and d!84754 res!212335) b!253405))

(assert (= (and b!253405 res!212337) b!253406))

(assert (= (and b!253406 (not res!212336)) b!253407))

(assert (=> b!253405 m!380357))

(assert (=> b!253405 m!380357))

(assert (=> b!253407 m!380357))

(assert (=> b!253407 m!380357))

(declare-fun m!381473 () Bool)

(assert (=> b!253407 m!381473))

(assert (=> d!84390 d!84754))

(declare-fun d!84756 () Bool)

(assert (=> d!84756 (isPrefixOf!0 lt!392949 (_2!11803 lt!392552))))

(declare-fun lt!393632 () Unit!18208)

(assert (=> d!84756 (= lt!393632 (choose!30 lt!392949 thiss!1005 (_2!11803 lt!392552)))))

(assert (=> d!84756 (isPrefixOf!0 lt!392949 thiss!1005)))

(assert (=> d!84756 (= (lemmaIsPrefixTransitive!0 lt!392949 thiss!1005 (_2!11803 lt!392552)) lt!393632)))

(declare-fun bs!21445 () Bool)

(assert (= bs!21445 d!84756))

(assert (=> bs!21445 m!380713))

(declare-fun m!381475 () Bool)

(assert (=> bs!21445 m!381475))

(declare-fun m!381477 () Bool)

(assert (=> bs!21445 m!381477))

(assert (=> d!84390 d!84756))

(declare-fun d!84758 () Bool)

(assert (=> d!84758 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-fun lt!393635 () Unit!18208)

(declare-fun choose!11 (BitStream!10982) Unit!18208)

(assert (=> d!84758 (= lt!393635 (choose!11 thiss!1005))))

(assert (=> d!84758 (= (lemmaIsPrefixRefl!0 thiss!1005) lt!393635)))

(declare-fun bs!21447 () Bool)

(assert (= bs!21447 d!84758))

(assert (=> bs!21447 m!380705))

(declare-fun m!381479 () Bool)

(assert (=> bs!21447 m!381479))

(assert (=> d!84390 d!84758))

(declare-fun d!84760 () Bool)

(assert (=> d!84760 (isPrefixOf!0 lt!392949 lt!392949)))

(declare-fun lt!393636 () Unit!18208)

(assert (=> d!84760 (= lt!393636 (choose!11 lt!392949))))

(assert (=> d!84760 (= (lemmaIsPrefixRefl!0 lt!392949) lt!393636)))

(declare-fun bs!21448 () Bool)

(assert (= bs!21448 d!84760))

(assert (=> bs!21448 m!380701))

(declare-fun m!381481 () Bool)

(assert (=> bs!21448 m!381481))

(assert (=> d!84390 d!84760))

(declare-fun d!84762 () Bool)

(assert (=> d!84762 (isPrefixOf!0 (_2!11803 lt!392552) (_2!11803 lt!392552))))

(declare-fun lt!393637 () Unit!18208)

(assert (=> d!84762 (= lt!393637 (choose!11 (_2!11803 lt!392552)))))

(assert (=> d!84762 (= (lemmaIsPrefixRefl!0 (_2!11803 lt!392552)) lt!393637)))

(declare-fun bs!21449 () Bool)

(assert (= bs!21449 d!84762))

(assert (=> bs!21449 m!380571))

(declare-fun m!381483 () Bool)

(assert (=> bs!21449 m!381483))

(assert (=> d!84390 d!84762))

(declare-fun d!84764 () Bool)

(declare-fun res!212338 () Bool)

(declare-fun e!175586 () Bool)

(assert (=> d!84764 (=> (not res!212338) (not e!175586))))

(assert (=> d!84764 (= res!212338 (= (size!6030 (buf!6532 lt!392949)) (size!6030 (buf!6532 lt!392949))))))

(assert (=> d!84764 (= (isPrefixOf!0 lt!392949 lt!392949) e!175586)))

(declare-fun b!253408 () Bool)

(declare-fun res!212340 () Bool)

(assert (=> b!253408 (=> (not res!212340) (not e!175586))))

(assert (=> b!253408 (= res!212340 (bvsle (bitIndex!0 (size!6030 (buf!6532 lt!392949)) (currentByte!11987 lt!392949) (currentBit!11982 lt!392949)) (bitIndex!0 (size!6030 (buf!6532 lt!392949)) (currentByte!11987 lt!392949) (currentBit!11982 lt!392949))))))

(declare-fun b!253409 () Bool)

(declare-fun e!175585 () Bool)

(assert (=> b!253409 (= e!175586 e!175585)))

(declare-fun res!212339 () Bool)

(assert (=> b!253409 (=> res!212339 e!175585)))

(assert (=> b!253409 (= res!212339 (= (size!6030 (buf!6532 lt!392949)) #b00000000000000000000000000000000))))

(declare-fun b!253410 () Bool)

(assert (=> b!253410 (= e!175585 (arrayBitRangesEq!0 (buf!6532 lt!392949) (buf!6532 lt!392949) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6030 (buf!6532 lt!392949)) (currentByte!11987 lt!392949) (currentBit!11982 lt!392949))))))

(assert (= (and d!84764 res!212338) b!253408))

(assert (= (and b!253408 res!212340) b!253409))

(assert (= (and b!253409 (not res!212339)) b!253410))

(declare-fun m!381485 () Bool)

(assert (=> b!253408 m!381485))

(assert (=> b!253408 m!381485))

(assert (=> b!253410 m!381485))

(assert (=> b!253410 m!381485))

(declare-fun m!381487 () Bool)

(assert (=> b!253410 m!381487))

(assert (=> d!84390 d!84764))

(declare-fun d!84766 () Bool)

(assert (=> d!84766 (isPrefixOf!0 lt!392949 (_2!11803 lt!392552))))

(declare-fun lt!393638 () Unit!18208)

(assert (=> d!84766 (= lt!393638 (choose!30 lt!392949 (_2!11803 lt!392552) (_2!11803 lt!392552)))))

(assert (=> d!84766 (isPrefixOf!0 lt!392949 (_2!11803 lt!392552))))

(assert (=> d!84766 (= (lemmaIsPrefixTransitive!0 lt!392949 (_2!11803 lt!392552) (_2!11803 lt!392552)) lt!393638)))

(declare-fun bs!21450 () Bool)

(assert (= bs!21450 d!84766))

(assert (=> bs!21450 m!380713))

(declare-fun m!381489 () Bool)

(assert (=> bs!21450 m!381489))

(assert (=> bs!21450 m!380713))

(assert (=> d!84390 d!84766))

(declare-fun d!84768 () Bool)

(declare-fun res!212341 () Bool)

(declare-fun e!175588 () Bool)

(assert (=> d!84768 (=> (not res!212341) (not e!175588))))

(assert (=> d!84768 (= res!212341 (= (size!6030 (buf!6532 lt!392949)) (size!6030 (buf!6532 (_2!11803 lt!392552)))))))

(assert (=> d!84768 (= (isPrefixOf!0 lt!392949 (_2!11803 lt!392552)) e!175588)))

(declare-fun b!253411 () Bool)

(declare-fun res!212343 () Bool)

(assert (=> b!253411 (=> (not res!212343) (not e!175588))))

(assert (=> b!253411 (= res!212343 (bvsle (bitIndex!0 (size!6030 (buf!6532 lt!392949)) (currentByte!11987 lt!392949) (currentBit!11982 lt!392949)) (bitIndex!0 (size!6030 (buf!6532 (_2!11803 lt!392552))) (currentByte!11987 (_2!11803 lt!392552)) (currentBit!11982 (_2!11803 lt!392552)))))))

(declare-fun b!253412 () Bool)

(declare-fun e!175587 () Bool)

(assert (=> b!253412 (= e!175588 e!175587)))

(declare-fun res!212342 () Bool)

(assert (=> b!253412 (=> res!212342 e!175587)))

(assert (=> b!253412 (= res!212342 (= (size!6030 (buf!6532 lt!392949)) #b00000000000000000000000000000000))))

(declare-fun b!253413 () Bool)

(assert (=> b!253413 (= e!175587 (arrayBitRangesEq!0 (buf!6532 lt!392949) (buf!6532 (_2!11803 lt!392552)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6030 (buf!6532 lt!392949)) (currentByte!11987 lt!392949) (currentBit!11982 lt!392949))))))

(assert (= (and d!84768 res!212341) b!253411))

(assert (= (and b!253411 res!212343) b!253412))

(assert (= (and b!253412 (not res!212342)) b!253413))

(assert (=> b!253411 m!381485))

(assert (=> b!253411 m!380335))

(assert (=> b!253413 m!381485))

(assert (=> b!253413 m!381485))

(declare-fun m!381491 () Bool)

(assert (=> b!253413 m!381491))

(assert (=> d!84390 d!84768))

(assert (=> d!84372 d!84686))

(declare-fun lt!393639 () tuple2!21758)

(declare-fun d!84770 () Bool)

(assert (=> d!84770 (= lt!393639 (checkBitsLoop!0 (_1!11805 lt!392931) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!84770 (= (checkBitsLoopPure!0 (_1!11805 lt!392931) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21753 (_2!11807 lt!393639) (_1!11807 lt!393639)))))

(declare-fun bs!21451 () Bool)

(assert (= bs!21451 d!84770))

(declare-fun m!381493 () Bool)

(assert (=> bs!21451 m!381493))

(assert (=> b!252948 d!84770))

(declare-fun d!84772 () Bool)

(assert (=> d!84772 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6030 (buf!6532 (_2!11803 lt!392937)))) ((_ sign_extend 32) (currentByte!11987 (_2!11803 lt!392547))) ((_ sign_extend 32) (currentBit!11982 (_2!11803 lt!392547))) lt!392932) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6030 (buf!6532 (_2!11803 lt!392937)))) ((_ sign_extend 32) (currentByte!11987 (_2!11803 lt!392547))) ((_ sign_extend 32) (currentBit!11982 (_2!11803 lt!392547)))) lt!392932))))

(declare-fun bs!21452 () Bool)

(assert (= bs!21452 d!84772))

(declare-fun m!381495 () Bool)

(assert (=> bs!21452 m!381495))

(assert (=> b!252948 d!84772))

(declare-fun d!84774 () Bool)

(assert (=> d!84774 (validate_offset_bits!1 ((_ sign_extend 32) (size!6030 (buf!6532 (_2!11803 lt!392937)))) ((_ sign_extend 32) (currentByte!11987 (_2!11803 lt!392547))) ((_ sign_extend 32) (currentBit!11982 (_2!11803 lt!392547))) lt!392932)))

(declare-fun lt!393640 () Unit!18208)

(assert (=> d!84774 (= lt!393640 (choose!9 (_2!11803 lt!392547) (buf!6532 (_2!11803 lt!392937)) lt!392932 (BitStream!10983 (buf!6532 (_2!11803 lt!392937)) (currentByte!11987 (_2!11803 lt!392547)) (currentBit!11982 (_2!11803 lt!392547)))))))

(assert (=> d!84774 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11803 lt!392547) (buf!6532 (_2!11803 lt!392937)) lt!392932) lt!393640)))

(declare-fun bs!21453 () Bool)

(assert (= bs!21453 d!84774))

(assert (=> bs!21453 m!380683))

(declare-fun m!381497 () Bool)

(assert (=> bs!21453 m!381497))

(assert (=> b!252948 d!84774))

(declare-fun b!253414 () Bool)

(declare-fun e!175590 () Unit!18208)

(declare-fun lt!393660 () Unit!18208)

(assert (=> b!253414 (= e!175590 lt!393660)))

(declare-fun lt!393644 () (_ BitVec 64))

(assert (=> b!253414 (= lt!393644 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!393647 () (_ BitVec 64))

(assert (=> b!253414 (= lt!393647 (bitIndex!0 (size!6030 (buf!6532 (_2!11803 lt!392547))) (currentByte!11987 (_2!11803 lt!392547)) (currentBit!11982 (_2!11803 lt!392547))))))

(assert (=> b!253414 (= lt!393660 (arrayBitRangesEqSymmetric!0 (buf!6532 (_2!11803 lt!392547)) (buf!6532 (_2!11803 lt!392937)) lt!393644 lt!393647))))

(assert (=> b!253414 (arrayBitRangesEq!0 (buf!6532 (_2!11803 lt!392937)) (buf!6532 (_2!11803 lt!392547)) lt!393644 lt!393647)))

(declare-fun b!253415 () Bool)

(declare-fun res!212345 () Bool)

(declare-fun e!175589 () Bool)

(assert (=> b!253415 (=> (not res!212345) (not e!175589))))

(declare-fun lt!393645 () tuple2!21754)

(assert (=> b!253415 (= res!212345 (isPrefixOf!0 (_1!11805 lt!393645) (_2!11803 lt!392547)))))

(declare-fun b!253417 () Bool)

(declare-fun Unit!18229 () Unit!18208)

(assert (=> b!253417 (= e!175590 Unit!18229)))

(declare-fun lt!393652 () (_ BitVec 64))

(declare-fun lt!393643 () (_ BitVec 64))

(declare-fun b!253418 () Bool)

(assert (=> b!253418 (= e!175589 (= (_1!11805 lt!393645) (withMovedBitIndex!0 (_2!11805 lt!393645) (bvsub lt!393643 lt!393652))))))

(assert (=> b!253418 (or (= (bvand lt!393643 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!393652 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!393643 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!393643 lt!393652) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!253418 (= lt!393652 (bitIndex!0 (size!6030 (buf!6532 (_2!11803 lt!392937))) (currentByte!11987 (_2!11803 lt!392937)) (currentBit!11982 (_2!11803 lt!392937))))))

(assert (=> b!253418 (= lt!393643 (bitIndex!0 (size!6030 (buf!6532 (_2!11803 lt!392547))) (currentByte!11987 (_2!11803 lt!392547)) (currentBit!11982 (_2!11803 lt!392547))))))

(declare-fun d!84776 () Bool)

(assert (=> d!84776 e!175589))

(declare-fun res!212346 () Bool)

(assert (=> d!84776 (=> (not res!212346) (not e!175589))))

(assert (=> d!84776 (= res!212346 (isPrefixOf!0 (_1!11805 lt!393645) (_2!11805 lt!393645)))))

(declare-fun lt!393651 () BitStream!10982)

(assert (=> d!84776 (= lt!393645 (tuple2!21755 lt!393651 (_2!11803 lt!392937)))))

(declare-fun lt!393655 () Unit!18208)

(declare-fun lt!393656 () Unit!18208)

(assert (=> d!84776 (= lt!393655 lt!393656)))

(assert (=> d!84776 (isPrefixOf!0 lt!393651 (_2!11803 lt!392937))))

(assert (=> d!84776 (= lt!393656 (lemmaIsPrefixTransitive!0 lt!393651 (_2!11803 lt!392937) (_2!11803 lt!392937)))))

(declare-fun lt!393654 () Unit!18208)

(declare-fun lt!393642 () Unit!18208)

(assert (=> d!84776 (= lt!393654 lt!393642)))

(assert (=> d!84776 (isPrefixOf!0 lt!393651 (_2!11803 lt!392937))))

(assert (=> d!84776 (= lt!393642 (lemmaIsPrefixTransitive!0 lt!393651 (_2!11803 lt!392547) (_2!11803 lt!392937)))))

(declare-fun lt!393657 () Unit!18208)

(assert (=> d!84776 (= lt!393657 e!175590)))

(declare-fun c!11671 () Bool)

(assert (=> d!84776 (= c!11671 (not (= (size!6030 (buf!6532 (_2!11803 lt!392547))) #b00000000000000000000000000000000)))))

(declare-fun lt!393650 () Unit!18208)

(declare-fun lt!393641 () Unit!18208)

(assert (=> d!84776 (= lt!393650 lt!393641)))

(assert (=> d!84776 (isPrefixOf!0 (_2!11803 lt!392937) (_2!11803 lt!392937))))

(assert (=> d!84776 (= lt!393641 (lemmaIsPrefixRefl!0 (_2!11803 lt!392937)))))

(declare-fun lt!393659 () Unit!18208)

(declare-fun lt!393653 () Unit!18208)

(assert (=> d!84776 (= lt!393659 lt!393653)))

(assert (=> d!84776 (= lt!393653 (lemmaIsPrefixRefl!0 (_2!11803 lt!392937)))))

(declare-fun lt!393658 () Unit!18208)

(declare-fun lt!393649 () Unit!18208)

(assert (=> d!84776 (= lt!393658 lt!393649)))

(assert (=> d!84776 (isPrefixOf!0 lt!393651 lt!393651)))

(assert (=> d!84776 (= lt!393649 (lemmaIsPrefixRefl!0 lt!393651))))

(declare-fun lt!393648 () Unit!18208)

(declare-fun lt!393646 () Unit!18208)

(assert (=> d!84776 (= lt!393648 lt!393646)))

(assert (=> d!84776 (isPrefixOf!0 (_2!11803 lt!392547) (_2!11803 lt!392547))))

(assert (=> d!84776 (= lt!393646 (lemmaIsPrefixRefl!0 (_2!11803 lt!392547)))))

(assert (=> d!84776 (= lt!393651 (BitStream!10983 (buf!6532 (_2!11803 lt!392937)) (currentByte!11987 (_2!11803 lt!392547)) (currentBit!11982 (_2!11803 lt!392547))))))

(assert (=> d!84776 (isPrefixOf!0 (_2!11803 lt!392547) (_2!11803 lt!392937))))

(assert (=> d!84776 (= (reader!0 (_2!11803 lt!392547) (_2!11803 lt!392937)) lt!393645)))

(declare-fun b!253416 () Bool)

(declare-fun res!212344 () Bool)

(assert (=> b!253416 (=> (not res!212344) (not e!175589))))

(assert (=> b!253416 (= res!212344 (isPrefixOf!0 (_2!11805 lt!393645) (_2!11803 lt!392937)))))

(assert (= (and d!84776 c!11671) b!253414))

(assert (= (and d!84776 (not c!11671)) b!253417))

(assert (= (and d!84776 res!212346) b!253415))

(assert (= (and b!253415 res!212345) b!253416))

(assert (= (and b!253416 res!212344) b!253418))

(assert (=> b!253414 m!380337))

(declare-fun m!381499 () Bool)

(assert (=> b!253414 m!381499))

(declare-fun m!381501 () Bool)

(assert (=> b!253414 m!381501))

(declare-fun m!381503 () Bool)

(assert (=> b!253415 m!381503))

(declare-fun m!381505 () Bool)

(assert (=> d!84776 m!381505))

(declare-fun m!381507 () Bool)

(assert (=> d!84776 m!381507))

(declare-fun m!381509 () Bool)

(assert (=> d!84776 m!381509))

(assert (=> d!84776 m!380575))

(declare-fun m!381511 () Bool)

(assert (=> d!84776 m!381511))

(assert (=> d!84776 m!380689))

(assert (=> d!84776 m!380579))

(declare-fun m!381513 () Bool)

(assert (=> d!84776 m!381513))

(declare-fun m!381515 () Bool)

(assert (=> d!84776 m!381515))

(declare-fun m!381517 () Bool)

(assert (=> d!84776 m!381517))

(declare-fun m!381519 () Bool)

(assert (=> d!84776 m!381519))

(declare-fun m!381521 () Bool)

(assert (=> b!253418 m!381521))

(assert (=> b!253418 m!380691))

(assert (=> b!253418 m!380337))

(declare-fun m!381523 () Bool)

(assert (=> b!253416 m!381523))

(assert (=> b!252948 d!84776))

(declare-fun d!84778 () Bool)

(declare-fun res!212347 () Bool)

(declare-fun e!175592 () Bool)

(assert (=> d!84778 (=> (not res!212347) (not e!175592))))

(assert (=> d!84778 (= res!212347 (= (size!6030 (buf!6532 (_1!11805 lt!392804))) (size!6030 (buf!6532 (_2!11803 lt!392547)))))))

(assert (=> d!84778 (= (isPrefixOf!0 (_1!11805 lt!392804) (_2!11803 lt!392547)) e!175592)))

(declare-fun b!253419 () Bool)

(declare-fun res!212349 () Bool)

(assert (=> b!253419 (=> (not res!212349) (not e!175592))))

(assert (=> b!253419 (= res!212349 (bvsle (bitIndex!0 (size!6030 (buf!6532 (_1!11805 lt!392804))) (currentByte!11987 (_1!11805 lt!392804)) (currentBit!11982 (_1!11805 lt!392804))) (bitIndex!0 (size!6030 (buf!6532 (_2!11803 lt!392547))) (currentByte!11987 (_2!11803 lt!392547)) (currentBit!11982 (_2!11803 lt!392547)))))))

(declare-fun b!253420 () Bool)

(declare-fun e!175591 () Bool)

(assert (=> b!253420 (= e!175592 e!175591)))

(declare-fun res!212348 () Bool)

(assert (=> b!253420 (=> res!212348 e!175591)))

(assert (=> b!253420 (= res!212348 (= (size!6030 (buf!6532 (_1!11805 lt!392804))) #b00000000000000000000000000000000))))

(declare-fun b!253421 () Bool)

(assert (=> b!253421 (= e!175591 (arrayBitRangesEq!0 (buf!6532 (_1!11805 lt!392804)) (buf!6532 (_2!11803 lt!392547)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6030 (buf!6532 (_1!11805 lt!392804))) (currentByte!11987 (_1!11805 lt!392804)) (currentBit!11982 (_1!11805 lt!392804)))))))

(assert (= (and d!84778 res!212347) b!253419))

(assert (= (and b!253419 res!212349) b!253420))

(assert (= (and b!253420 (not res!212348)) b!253421))

(declare-fun m!381525 () Bool)

(assert (=> b!253419 m!381525))

(assert (=> b!253419 m!380337))

(assert (=> b!253421 m!381525))

(assert (=> b!253421 m!381525))

(declare-fun m!381527 () Bool)

(assert (=> b!253421 m!381527))

(assert (=> b!252880 d!84778))

(declare-fun d!84780 () Bool)

(assert (=> d!84780 (= (remainingBits!0 ((_ sign_extend 32) (size!6030 (buf!6532 (_2!11803 lt!392552)))) ((_ sign_extend 32) (currentByte!11987 thiss!1005)) ((_ sign_extend 32) (currentBit!11982 thiss!1005))) (bvsub (bvmul ((_ sign_extend 32) (size!6030 (buf!6532 (_2!11803 lt!392552)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11987 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11982 thiss!1005)))))))

(assert (=> d!84386 d!84780))

(declare-fun d!84782 () Bool)

(declare-fun e!175601 () Bool)

(assert (=> d!84782 e!175601))

(declare-fun res!212361 () Bool)

(assert (=> d!84782 (=> (not res!212361) (not e!175601))))

(declare-fun _$19!192 () tuple2!21750)

(assert (=> d!84782 (= res!212361 (= (size!6030 (buf!6532 thiss!1005)) (size!6030 (buf!6532 (_2!11803 _$19!192)))))))

(declare-fun e!175602 () Bool)

(assert (=> d!84782 (and (inv!12 (_2!11803 _$19!192)) e!175602)))

(assert (=> d!84782 (= (choose!16 thiss!1005 bit!26) _$19!192)))

(declare-fun b!253433 () Bool)

(declare-fun res!212359 () Bool)

(assert (=> b!253433 (=> (not res!212359) (not e!175601))))

(assert (=> b!253433 (= res!212359 (= (bitIndex!0 (size!6030 (buf!6532 (_2!11803 _$19!192))) (currentByte!11987 (_2!11803 _$19!192)) (currentBit!11982 (_2!11803 _$19!192))) (bvadd (bitIndex!0 (size!6030 (buf!6532 thiss!1005)) (currentByte!11987 thiss!1005) (currentBit!11982 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!253434 () Bool)

(declare-fun e!175604 () Bool)

(assert (=> b!253434 (= e!175601 e!175604)))

(declare-fun res!212360 () Bool)

(assert (=> b!253434 (=> (not res!212360) (not e!175604))))

(declare-fun lt!393663 () tuple2!21752)

(assert (=> b!253434 (= res!212360 (and (= (_2!11804 lt!393663) bit!26) (= (_1!11804 lt!393663) (_2!11803 _$19!192))))))

(assert (=> b!253434 (= lt!393663 (readBitPure!0 (readerFrom!0 (_2!11803 _$19!192) (currentBit!11982 thiss!1005) (currentByte!11987 thiss!1005))))))

(declare-fun b!253435 () Bool)

(assert (=> b!253435 (= e!175604 (= (bitIndex!0 (size!6030 (buf!6532 (_1!11804 lt!393663))) (currentByte!11987 (_1!11804 lt!393663)) (currentBit!11982 (_1!11804 lt!393663))) (bitIndex!0 (size!6030 (buf!6532 (_2!11803 _$19!192))) (currentByte!11987 (_2!11803 _$19!192)) (currentBit!11982 (_2!11803 _$19!192)))))))

(declare-fun b!253436 () Bool)

(declare-fun res!212358 () Bool)

(assert (=> b!253436 (=> (not res!212358) (not e!175601))))

(assert (=> b!253436 (= res!212358 (isPrefixOf!0 thiss!1005 (_2!11803 _$19!192)))))

(declare-fun b!253437 () Bool)

(assert (=> b!253437 (= e!175602 (array_inv!5771 (buf!6532 (_2!11803 _$19!192))))))

(assert (= d!84782 b!253437))

(assert (= (and d!84782 res!212361) b!253433))

(assert (= (and b!253433 res!212359) b!253436))

(assert (= (and b!253436 res!212358) b!253434))

(assert (= (and b!253434 res!212360) b!253435))

(declare-fun m!381529 () Bool)

(assert (=> b!253436 m!381529))

(declare-fun m!381531 () Bool)

(assert (=> b!253435 m!381531))

(declare-fun m!381533 () Bool)

(assert (=> b!253435 m!381533))

(declare-fun m!381535 () Bool)

(assert (=> b!253437 m!381535))

(assert (=> b!253433 m!381533))

(assert (=> b!253433 m!380357))

(declare-fun m!381537 () Bool)

(assert (=> d!84782 m!381537))

(declare-fun m!381539 () Bool)

(assert (=> b!253434 m!381539))

(assert (=> b!253434 m!381539))

(declare-fun m!381541 () Bool)

(assert (=> b!253434 m!381541))

(assert (=> d!84354 d!84782))

(declare-fun d!84784 () Bool)

(assert (=> d!84784 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6030 (buf!6532 thiss!1005))) ((_ sign_extend 32) (currentByte!11987 thiss!1005)) ((_ sign_extend 32) (currentBit!11982 thiss!1005))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6030 (buf!6532 thiss!1005))) ((_ sign_extend 32) (currentByte!11987 thiss!1005)) ((_ sign_extend 32) (currentBit!11982 thiss!1005))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!21454 () Bool)

(assert (= bs!21454 d!84784))

(assert (=> bs!21454 m!380619))

(assert (=> d!84354 d!84784))

(assert (=> b!252950 d!84348))

(declare-fun d!84786 () Bool)

(assert (=> d!84786 (arrayBitRangesEq!0 (buf!6532 (_2!11803 lt!392552)) (buf!6532 thiss!1005) lt!392942 lt!392945)))

(declare-fun lt!393664 () Unit!18208)

(assert (=> d!84786 (= lt!393664 (choose!8 (buf!6532 thiss!1005) (buf!6532 (_2!11803 lt!392552)) lt!392942 lt!392945))))

(assert (=> d!84786 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!392942) (bvsle lt!392942 lt!392945))))

(assert (=> d!84786 (= (arrayBitRangesEqSymmetric!0 (buf!6532 thiss!1005) (buf!6532 (_2!11803 lt!392552)) lt!392942 lt!392945) lt!393664)))

(declare-fun bs!21455 () Bool)

(assert (= bs!21455 d!84786))

(assert (=> bs!21455 m!380697))

(declare-fun m!381543 () Bool)

(assert (=> bs!21455 m!381543))

(assert (=> b!252950 d!84786))

(declare-fun d!84788 () Bool)

(declare-fun res!212365 () Bool)

(declare-fun e!175609 () Bool)

(assert (=> d!84788 (=> res!212365 e!175609)))

(assert (=> d!84788 (= res!212365 (bvsge lt!392942 lt!392945))))

(assert (=> d!84788 (= (arrayBitRangesEq!0 (buf!6532 (_2!11803 lt!392552)) (buf!6532 thiss!1005) lt!392942 lt!392945) e!175609)))

(declare-fun b!253438 () Bool)

(declare-fun e!175610 () Bool)

(declare-fun e!175606 () Bool)

(assert (=> b!253438 (= e!175610 e!175606)))

(declare-fun res!212364 () Bool)

(declare-fun lt!393666 () tuple4!298)

(declare-fun lt!393665 () (_ BitVec 32))

(assert (=> b!253438 (= res!212364 (byteRangesEq!0 (select (arr!7017 (buf!6532 (_2!11803 lt!392552))) (_3!929 lt!393666)) (select (arr!7017 (buf!6532 thiss!1005)) (_3!929 lt!393666)) lt!393665 #b00000000000000000000000000001000))))

(assert (=> b!253438 (=> (not res!212364) (not e!175606))))

(declare-fun e!175605 () Bool)

(declare-fun b!253439 () Bool)

(assert (=> b!253439 (= e!175605 (arrayRangesEq!926 (buf!6532 (_2!11803 lt!392552)) (buf!6532 thiss!1005) (_1!11810 lt!393666) (_2!11810 lt!393666)))))

(declare-fun b!253440 () Bool)

(declare-fun e!175608 () Bool)

(assert (=> b!253440 (= e!175609 e!175608)))

(declare-fun res!212363 () Bool)

(assert (=> b!253440 (=> (not res!212363) (not e!175608))))

(assert (=> b!253440 (= res!212363 e!175605)))

(declare-fun res!212362 () Bool)

(assert (=> b!253440 (=> res!212362 e!175605)))

(assert (=> b!253440 (= res!212362 (bvsge (_1!11810 lt!393666) (_2!11810 lt!393666)))))

(declare-fun lt!393667 () (_ BitVec 32))

(assert (=> b!253440 (= lt!393667 ((_ extract 31 0) (bvsrem lt!392945 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253440 (= lt!393665 ((_ extract 31 0) (bvsrem lt!392942 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253440 (= lt!393666 (arrayBitIndices!0 lt!392942 lt!392945))))

(declare-fun b!253441 () Bool)

(declare-fun call!3980 () Bool)

(assert (=> b!253441 (= e!175610 call!3980)))

(declare-fun b!253442 () Bool)

(declare-fun res!212366 () Bool)

(assert (=> b!253442 (= res!212366 (= lt!393667 #b00000000000000000000000000000000))))

(declare-fun e!175607 () Bool)

(assert (=> b!253442 (=> res!212366 e!175607)))

(assert (=> b!253442 (= e!175606 e!175607)))

(declare-fun bm!3977 () Bool)

(declare-fun c!11672 () Bool)

(assert (=> bm!3977 (= call!3980 (byteRangesEq!0 (ite c!11672 (select (arr!7017 (buf!6532 (_2!11803 lt!392552))) (_3!929 lt!393666)) (select (arr!7017 (buf!6532 (_2!11803 lt!392552))) (_4!149 lt!393666))) (ite c!11672 (select (arr!7017 (buf!6532 thiss!1005)) (_3!929 lt!393666)) (select (arr!7017 (buf!6532 thiss!1005)) (_4!149 lt!393666))) (ite c!11672 lt!393665 #b00000000000000000000000000000000) lt!393667))))

(declare-fun b!253443 () Bool)

(assert (=> b!253443 (= e!175607 call!3980)))

(declare-fun b!253444 () Bool)

(assert (=> b!253444 (= e!175608 e!175610)))

(assert (=> b!253444 (= c!11672 (= (_3!929 lt!393666) (_4!149 lt!393666)))))

(assert (= (and d!84788 (not res!212365)) b!253440))

(assert (= (and b!253440 (not res!212362)) b!253439))

(assert (= (and b!253440 res!212363) b!253444))

(assert (= (and b!253444 c!11672) b!253441))

(assert (= (and b!253444 (not c!11672)) b!253438))

(assert (= (and b!253438 res!212364) b!253442))

(assert (= (and b!253442 (not res!212366)) b!253443))

(assert (= (or b!253441 b!253443) bm!3977))

(declare-fun m!381545 () Bool)

(assert (=> b!253438 m!381545))

(declare-fun m!381547 () Bool)

(assert (=> b!253438 m!381547))

(assert (=> b!253438 m!381545))

(assert (=> b!253438 m!381547))

(declare-fun m!381549 () Bool)

(assert (=> b!253438 m!381549))

(declare-fun m!381551 () Bool)

(assert (=> b!253439 m!381551))

(declare-fun m!381553 () Bool)

(assert (=> b!253440 m!381553))

(declare-fun m!381555 () Bool)

(assert (=> bm!3977 m!381555))

(declare-fun m!381557 () Bool)

(assert (=> bm!3977 m!381557))

(assert (=> bm!3977 m!381547))

(declare-fun m!381559 () Bool)

(assert (=> bm!3977 m!381559))

(assert (=> bm!3977 m!381545))

(assert (=> b!252950 d!84788))

(declare-fun d!84790 () Bool)

(assert (=> d!84790 (isPrefixOf!0 (_2!11803 lt!392547) (_2!11803 lt!392547))))

(declare-fun lt!393668 () Unit!18208)

(assert (=> d!84790 (= lt!393668 (choose!11 (_2!11803 lt!392547)))))

(assert (=> d!84790 (= (lemmaIsPrefixRefl!0 (_2!11803 lt!392547)) lt!393668)))

(declare-fun bs!21456 () Bool)

(assert (= bs!21456 d!84790))

(assert (=> bs!21456 m!380575))

(declare-fun m!381561 () Bool)

(assert (=> bs!21456 m!381561))

(assert (=> d!84324 d!84790))

(assert (=> d!84324 d!84342))

(assert (=> d!84324 d!84750))

(declare-fun d!84792 () Bool)

(declare-fun res!212367 () Bool)

(declare-fun e!175612 () Bool)

(assert (=> d!84792 (=> (not res!212367) (not e!175612))))

(assert (=> d!84792 (= res!212367 (= (size!6030 (buf!6532 (_2!11803 lt!392547))) (size!6030 (buf!6532 (_2!11803 lt!392547)))))))

(assert (=> d!84792 (= (isPrefixOf!0 (_2!11803 lt!392547) (_2!11803 lt!392547)) e!175612)))

(declare-fun b!253445 () Bool)

(declare-fun res!212369 () Bool)

(assert (=> b!253445 (=> (not res!212369) (not e!175612))))

(assert (=> b!253445 (= res!212369 (bvsle (bitIndex!0 (size!6030 (buf!6532 (_2!11803 lt!392547))) (currentByte!11987 (_2!11803 lt!392547)) (currentBit!11982 (_2!11803 lt!392547))) (bitIndex!0 (size!6030 (buf!6532 (_2!11803 lt!392547))) (currentByte!11987 (_2!11803 lt!392547)) (currentBit!11982 (_2!11803 lt!392547)))))))

(declare-fun b!253446 () Bool)

(declare-fun e!175611 () Bool)

(assert (=> b!253446 (= e!175612 e!175611)))

(declare-fun res!212368 () Bool)

(assert (=> b!253446 (=> res!212368 e!175611)))

(assert (=> b!253446 (= res!212368 (= (size!6030 (buf!6532 (_2!11803 lt!392547))) #b00000000000000000000000000000000))))

(declare-fun b!253447 () Bool)

(assert (=> b!253447 (= e!175611 (arrayBitRangesEq!0 (buf!6532 (_2!11803 lt!392547)) (buf!6532 (_2!11803 lt!392547)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6030 (buf!6532 (_2!11803 lt!392547))) (currentByte!11987 (_2!11803 lt!392547)) (currentBit!11982 (_2!11803 lt!392547)))))))

(assert (= (and d!84792 res!212367) b!253445))

(assert (= (and b!253445 res!212369) b!253446))

(assert (= (and b!253446 (not res!212368)) b!253447))

(assert (=> b!253445 m!380337))

(assert (=> b!253445 m!380337))

(assert (=> b!253447 m!380337))

(assert (=> b!253447 m!380337))

(declare-fun m!381563 () Bool)

(assert (=> b!253447 m!381563))

(assert (=> d!84324 d!84792))

(declare-fun d!84794 () Bool)

(assert (=> d!84794 (isPrefixOf!0 lt!392810 (_2!11803 lt!392552))))

(declare-fun lt!393669 () Unit!18208)

(assert (=> d!84794 (= lt!393669 (choose!30 lt!392810 (_2!11803 lt!392552) (_2!11803 lt!392552)))))

(assert (=> d!84794 (isPrefixOf!0 lt!392810 (_2!11803 lt!392552))))

(assert (=> d!84794 (= (lemmaIsPrefixTransitive!0 lt!392810 (_2!11803 lt!392552) (_2!11803 lt!392552)) lt!393669)))

(declare-fun bs!21457 () Bool)

(assert (= bs!21457 d!84794))

(assert (=> bs!21457 m!380585))

(declare-fun m!381565 () Bool)

(assert (=> bs!21457 m!381565))

(assert (=> bs!21457 m!380585))

(assert (=> d!84324 d!84794))

(declare-fun d!84796 () Bool)

(declare-fun res!212370 () Bool)

(declare-fun e!175614 () Bool)

(assert (=> d!84796 (=> (not res!212370) (not e!175614))))

(assert (=> d!84796 (= res!212370 (= (size!6030 (buf!6532 (_1!11805 lt!392804))) (size!6030 (buf!6532 (_2!11805 lt!392804)))))))

(assert (=> d!84796 (= (isPrefixOf!0 (_1!11805 lt!392804) (_2!11805 lt!392804)) e!175614)))

(declare-fun b!253448 () Bool)

(declare-fun res!212372 () Bool)

(assert (=> b!253448 (=> (not res!212372) (not e!175614))))

(assert (=> b!253448 (= res!212372 (bvsle (bitIndex!0 (size!6030 (buf!6532 (_1!11805 lt!392804))) (currentByte!11987 (_1!11805 lt!392804)) (currentBit!11982 (_1!11805 lt!392804))) (bitIndex!0 (size!6030 (buf!6532 (_2!11805 lt!392804))) (currentByte!11987 (_2!11805 lt!392804)) (currentBit!11982 (_2!11805 lt!392804)))))))

(declare-fun b!253449 () Bool)

(declare-fun e!175613 () Bool)

(assert (=> b!253449 (= e!175614 e!175613)))

(declare-fun res!212371 () Bool)

(assert (=> b!253449 (=> res!212371 e!175613)))

(assert (=> b!253449 (= res!212371 (= (size!6030 (buf!6532 (_1!11805 lt!392804))) #b00000000000000000000000000000000))))

(declare-fun b!253450 () Bool)

(assert (=> b!253450 (= e!175613 (arrayBitRangesEq!0 (buf!6532 (_1!11805 lt!392804)) (buf!6532 (_2!11805 lt!392804)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6030 (buf!6532 (_1!11805 lt!392804))) (currentByte!11987 (_1!11805 lt!392804)) (currentBit!11982 (_1!11805 lt!392804)))))))

(assert (= (and d!84796 res!212370) b!253448))

(assert (= (and b!253448 res!212372) b!253449))

(assert (= (and b!253449 (not res!212371)) b!253450))

(assert (=> b!253448 m!381525))

(assert (=> b!253448 m!381379))

(assert (=> b!253450 m!381525))

(assert (=> b!253450 m!381525))

(declare-fun m!381567 () Bool)

(assert (=> b!253450 m!381567))

(assert (=> d!84324 d!84796))

(assert (=> d!84324 d!84762))

(declare-fun d!84798 () Bool)

(assert (=> d!84798 (isPrefixOf!0 lt!392810 (_2!11803 lt!392552))))

(declare-fun lt!393670 () Unit!18208)

(assert (=> d!84798 (= lt!393670 (choose!30 lt!392810 (_2!11803 lt!392547) (_2!11803 lt!392552)))))

(assert (=> d!84798 (isPrefixOf!0 lt!392810 (_2!11803 lt!392547))))

(assert (=> d!84798 (= (lemmaIsPrefixTransitive!0 lt!392810 (_2!11803 lt!392547) (_2!11803 lt!392552)) lt!393670)))

(declare-fun bs!21458 () Bool)

(assert (= bs!21458 d!84798))

(assert (=> bs!21458 m!380585))

(declare-fun m!381569 () Bool)

(assert (=> bs!21458 m!381569))

(declare-fun m!381571 () Bool)

(assert (=> bs!21458 m!381571))

(assert (=> d!84324 d!84798))

(declare-fun d!84800 () Bool)

(assert (=> d!84800 (isPrefixOf!0 lt!392810 lt!392810)))

(declare-fun lt!393671 () Unit!18208)

(assert (=> d!84800 (= lt!393671 (choose!11 lt!392810))))

(assert (=> d!84800 (= (lemmaIsPrefixRefl!0 lt!392810) lt!393671)))

(declare-fun bs!21459 () Bool)

(assert (= bs!21459 d!84800))

(assert (=> bs!21459 m!380569))

(declare-fun m!381573 () Bool)

(assert (=> bs!21459 m!381573))

(assert (=> d!84324 d!84800))

(declare-fun d!84802 () Bool)

(declare-fun res!212373 () Bool)

(declare-fun e!175616 () Bool)

(assert (=> d!84802 (=> (not res!212373) (not e!175616))))

(assert (=> d!84802 (= res!212373 (= (size!6030 (buf!6532 lt!392810)) (size!6030 (buf!6532 lt!392810))))))

(assert (=> d!84802 (= (isPrefixOf!0 lt!392810 lt!392810) e!175616)))

(declare-fun b!253451 () Bool)

(declare-fun res!212375 () Bool)

(assert (=> b!253451 (=> (not res!212375) (not e!175616))))

(assert (=> b!253451 (= res!212375 (bvsle (bitIndex!0 (size!6030 (buf!6532 lt!392810)) (currentByte!11987 lt!392810) (currentBit!11982 lt!392810)) (bitIndex!0 (size!6030 (buf!6532 lt!392810)) (currentByte!11987 lt!392810) (currentBit!11982 lt!392810))))))

(declare-fun b!253452 () Bool)

(declare-fun e!175615 () Bool)

(assert (=> b!253452 (= e!175616 e!175615)))

(declare-fun res!212374 () Bool)

(assert (=> b!253452 (=> res!212374 e!175615)))

(assert (=> b!253452 (= res!212374 (= (size!6030 (buf!6532 lt!392810)) #b00000000000000000000000000000000))))

(declare-fun b!253453 () Bool)

(assert (=> b!253453 (= e!175615 (arrayBitRangesEq!0 (buf!6532 lt!392810) (buf!6532 lt!392810) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6030 (buf!6532 lt!392810)) (currentByte!11987 lt!392810) (currentBit!11982 lt!392810))))))

(assert (= (and d!84802 res!212373) b!253451))

(assert (= (and b!253451 res!212375) b!253452))

(assert (= (and b!253452 (not res!212374)) b!253453))

(declare-fun m!381575 () Bool)

(assert (=> b!253451 m!381575))

(assert (=> b!253451 m!381575))

(assert (=> b!253453 m!381575))

(assert (=> b!253453 m!381575))

(declare-fun m!381577 () Bool)

(assert (=> b!253453 m!381577))

(assert (=> d!84324 d!84802))

(declare-fun d!84804 () Bool)

(declare-fun res!212376 () Bool)

(declare-fun e!175618 () Bool)

(assert (=> d!84804 (=> (not res!212376) (not e!175618))))

(assert (=> d!84804 (= res!212376 (= (size!6030 (buf!6532 lt!392810)) (size!6030 (buf!6532 (_2!11803 lt!392552)))))))

(assert (=> d!84804 (= (isPrefixOf!0 lt!392810 (_2!11803 lt!392552)) e!175618)))

(declare-fun b!253454 () Bool)

(declare-fun res!212378 () Bool)

(assert (=> b!253454 (=> (not res!212378) (not e!175618))))

(assert (=> b!253454 (= res!212378 (bvsle (bitIndex!0 (size!6030 (buf!6532 lt!392810)) (currentByte!11987 lt!392810) (currentBit!11982 lt!392810)) (bitIndex!0 (size!6030 (buf!6532 (_2!11803 lt!392552))) (currentByte!11987 (_2!11803 lt!392552)) (currentBit!11982 (_2!11803 lt!392552)))))))

(declare-fun b!253455 () Bool)

(declare-fun e!175617 () Bool)

(assert (=> b!253455 (= e!175618 e!175617)))

(declare-fun res!212377 () Bool)

(assert (=> b!253455 (=> res!212377 e!175617)))

(assert (=> b!253455 (= res!212377 (= (size!6030 (buf!6532 lt!392810)) #b00000000000000000000000000000000))))

(declare-fun b!253456 () Bool)

(assert (=> b!253456 (= e!175617 (arrayBitRangesEq!0 (buf!6532 lt!392810) (buf!6532 (_2!11803 lt!392552)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6030 (buf!6532 lt!392810)) (currentByte!11987 lt!392810) (currentBit!11982 lt!392810))))))

(assert (= (and d!84804 res!212376) b!253454))

(assert (= (and b!253454 res!212378) b!253455))

(assert (= (and b!253455 (not res!212377)) b!253456))

(assert (=> b!253454 m!381575))

(assert (=> b!253454 m!380335))

(assert (=> b!253456 m!381575))

(assert (=> b!253456 m!381575))

(declare-fun m!381579 () Bool)

(assert (=> b!253456 m!381579))

(assert (=> d!84324 d!84804))

(assert (=> b!252927 d!84348))

(assert (=> b!252927 d!84400))

(assert (=> b!252898 d!84346))

(assert (=> b!252898 d!84400))

(declare-fun b!253457 () Bool)

(declare-fun e!175621 () tuple2!21758)

(assert (=> b!253457 (= e!175621 (tuple2!21759 true (_1!11805 lt!392558)))))

(declare-fun b!253458 () Bool)

(declare-fun res!212383 () Bool)

(declare-fun e!175619 () Bool)

(assert (=> b!253458 (=> (not res!212383) (not e!175619))))

(declare-fun lt!393680 () tuple2!21758)

(assert (=> b!253458 (= res!212383 (and (= (buf!6532 (_1!11805 lt!392558)) (buf!6532 (_2!11807 lt!393680))) (or (not (= nBits!297 from!289)) (_1!11807 lt!393680))))))

(declare-fun e!175623 () Bool)

(declare-fun b!253459 () Bool)

(declare-fun lt!393675 () (_ BitVec 64))

(assert (=> b!253459 (= e!175623 (= (bvsub lt!393675 from!289) (bitIndex!0 (size!6030 (buf!6532 (_2!11807 lt!393680))) (currentByte!11987 (_2!11807 lt!393680)) (currentBit!11982 (_2!11807 lt!393680)))))))

(assert (=> b!253459 (or (= (bvand lt!393675 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!393675 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!393675 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!393672 () (_ BitVec 64))

(assert (=> b!253459 (= lt!393675 (bvadd lt!393672 nBits!297))))

(assert (=> b!253459 (or (not (= (bvand lt!393672 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!393672 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!393672 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!253459 (= lt!393672 (bitIndex!0 (size!6030 (buf!6532 (_1!11805 lt!392558))) (currentByte!11987 (_1!11805 lt!392558)) (currentBit!11982 (_1!11805 lt!392558))))))

(declare-fun b!253460 () Bool)

(declare-fun e!175622 () Bool)

(assert (=> b!253460 (= e!175619 e!175622)))

(declare-fun res!212379 () Bool)

(assert (=> b!253460 (=> res!212379 e!175622)))

(assert (=> b!253460 (= res!212379 (or (not (_1!11807 lt!393680)) (bvsge from!289 nBits!297)))))

(declare-fun d!84806 () Bool)

(assert (=> d!84806 e!175619))

(declare-fun res!212381 () Bool)

(assert (=> d!84806 (=> (not res!212381) (not e!175619))))

(declare-fun lt!393674 () (_ BitVec 64))

(assert (=> d!84806 (= res!212381 (bvsge (bvsub lt!393674 from!289) (bitIndex!0 (size!6030 (buf!6532 (_2!11807 lt!393680))) (currentByte!11987 (_2!11807 lt!393680)) (currentBit!11982 (_2!11807 lt!393680)))))))

(assert (=> d!84806 (or (= (bvand lt!393674 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!393674 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!393674 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!393676 () (_ BitVec 64))

(assert (=> d!84806 (= lt!393674 (bvadd lt!393676 nBits!297))))

(assert (=> d!84806 (or (not (= (bvand lt!393676 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!393676 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!393676 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84806 (= lt!393676 (bitIndex!0 (size!6030 (buf!6532 (_1!11805 lt!392558))) (currentByte!11987 (_1!11805 lt!392558)) (currentBit!11982 (_1!11805 lt!392558))))))

(assert (=> d!84806 (= lt!393680 e!175621)))

(declare-fun c!11674 () Bool)

(assert (=> d!84806 (= c!11674 (= from!289 nBits!297))))

(assert (=> d!84806 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!84806 (= (checkBitsLoop!0 (_1!11805 lt!392558) nBits!297 bit!26 from!289) lt!393680)))

(declare-fun b!253461 () Bool)

(declare-fun e!175620 () tuple2!21758)

(assert (=> b!253461 (= e!175621 e!175620)))

(declare-fun lt!393682 () tuple2!21758)

(assert (=> b!253461 (= lt!393682 (readBit!0 (_1!11805 lt!392558)))))

(declare-fun c!11673 () Bool)

(assert (=> b!253461 (= c!11673 (not (= (_1!11807 lt!393682) bit!26)))))

(declare-fun b!253462 () Bool)

(assert (=> b!253462 (= e!175622 (= bit!26 (_2!11804 (readBitPure!0 (_1!11805 lt!392558)))))))

(declare-fun b!253463 () Bool)

(declare-fun res!212380 () Bool)

(assert (=> b!253463 (=> (not res!212380) (not e!175619))))

(assert (=> b!253463 (= res!212380 e!175623)))

(declare-fun res!212382 () Bool)

(assert (=> b!253463 (=> res!212382 e!175623)))

(assert (=> b!253463 (= res!212382 (not (_1!11807 lt!393680)))))

(declare-fun lt!393678 () tuple2!21758)

(declare-fun b!253464 () Bool)

(assert (=> b!253464 (= lt!393678 (checkBitsLoop!0 (_2!11807 lt!393682) nBits!297 bit!26 (bvadd from!289 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!393679 () Unit!18208)

(declare-fun lt!393673 () Unit!18208)

(assert (=> b!253464 (= lt!393679 lt!393673)))

(declare-fun lt!393681 () (_ BitVec 64))

(declare-fun lt!393677 () (_ BitVec 64))

(assert (=> b!253464 (validate_offset_bits!1 ((_ sign_extend 32) (size!6030 (buf!6532 (_2!11807 lt!393682)))) ((_ sign_extend 32) (currentByte!11987 (_2!11807 lt!393682))) ((_ sign_extend 32) (currentBit!11982 (_2!11807 lt!393682))) (bvsub lt!393681 lt!393677))))

(assert (=> b!253464 (= lt!393673 (validateOffsetBitsIneqLemma!0 (_1!11805 lt!392558) (_2!11807 lt!393682) lt!393681 lt!393677))))

(assert (=> b!253464 (= lt!393677 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!253464 (= lt!393681 (bvsub nBits!297 from!289))))

(assert (=> b!253464 (= e!175620 (tuple2!21759 (_1!11807 lt!393678) (_2!11807 lt!393678)))))

(declare-fun b!253465 () Bool)

(assert (=> b!253465 (= e!175620 (tuple2!21759 false (_2!11807 lt!393682)))))

(assert (= (and d!84806 c!11674) b!253457))

(assert (= (and d!84806 (not c!11674)) b!253461))

(assert (= (and b!253461 c!11673) b!253465))

(assert (= (and b!253461 (not c!11673)) b!253464))

(assert (= (and d!84806 res!212381) b!253458))

(assert (= (and b!253458 res!212383) b!253463))

(assert (= (and b!253463 (not res!212382)) b!253459))

(assert (= (and b!253463 res!212380) b!253460))

(assert (= (and b!253460 (not res!212379)) b!253462))

(declare-fun m!381581 () Bool)

(assert (=> b!253459 m!381581))

(assert (=> b!253459 m!380723))

(assert (=> b!253462 m!380373))

(assert (=> d!84806 m!381581))

(assert (=> d!84806 m!380723))

(declare-fun m!381583 () Bool)

(assert (=> b!253464 m!381583))

(declare-fun m!381585 () Bool)

(assert (=> b!253464 m!381585))

(declare-fun m!381587 () Bool)

(assert (=> b!253464 m!381587))

(assert (=> b!253461 m!380669))

(assert (=> d!84356 d!84806))

(push 1)

(assert (not d!84734))

(assert (not d!84730))

(assert (not d!84762))

(assert (not b!253286))

(assert (not d!84732))

(assert (not b!253445))

(assert (not b!253451))

(assert (not d!84676))

(assert (not b!253401))

(assert (not b!253317))

(assert (not b!253450))

(assert (not b!253419))

(assert (not b!253461))

(assert (not d!84648))

(assert (not d!84678))

(assert (not d!84696))

(assert (not b!253386))

(assert (not b!253314))

(assert (not b!253363))

(assert (not d!84790))

(assert (not d!84710))

(assert (not b!253433))

(assert (not d!84690))

(assert (not b!253350))

(assert (not b!253275))

(assert (not b!253418))

(assert (not d!84646))

(assert (not b!253315))

(assert (not d!84658))

(assert (not b!253437))

(assert (not b!253459))

(assert (not bm!3973))

(assert (not b!253282))

(assert (not b!253365))

(assert (not d!84772))

(assert (not b!253276))

(assert (not b!253320))

(assert (not b!253438))

(assert (not d!84758))

(assert (not b!253391))

(assert (not b!253377))

(assert (not b!253367))

(assert (not b!253347))

(assert (not d!84798))

(assert (not d!84782))

(assert (not d!84670))

(assert (not d!84760))

(assert (not b!253453))

(assert (not b!253410))

(assert (not b!253408))

(assert (not b!253376))

(assert (not d!84776))

(assert (not b!253260))

(assert (not b!253361))

(assert (not bm!3977))

(assert (not b!253456))

(assert (not b!253448))

(assert (not d!84806))

(assert (not b!253411))

(assert (not d!84786))

(assert (not d!84742))

(assert (not d!84784))

(assert (not d!84680))

(assert (not d!84650))

(assert (not b!253358))

(assert (not b!253329))

(assert (not b!253379))

(assert (not b!253440))

(assert (not d!84688))

(assert (not b!253413))

(assert (not d!84756))

(assert (not d!84774))

(assert (not d!84664))

(assert (not b!253342))

(assert (not d!84800))

(assert (not b!253389))

(assert (not b!253312))

(assert (not b!253360))

(assert (not b!253434))

(assert (not d!84766))

(assert (not d!84714))

(assert (not b!253435))

(assert (not b!253258))

(assert (not bm!3975))

(assert (not b!253321))

(assert (not b!253399))

(assert (not b!253380))

(assert (not b!253322))

(assert (not d!84720))

(assert (not d!84748))

(assert (not b!253405))

(assert (not b!253464))

(assert (not b!253285))

(assert (not b!253277))

(assert (not b!253414))

(assert (not b!253327))

(assert (not b!253415))

(assert (not b!253462))

(assert (not b!253392))

(assert (not d!84770))

(assert (not b!253382))

(assert (not b!253421))

(assert (not b!253447))

(assert (not b!253287))

(assert (not b!253454))

(assert (not d!84728))

(assert (not d!84654))

(assert (not d!84698))

(assert (not b!253394))

(assert (not d!84708))

(assert (not b!253436))

(assert (not bm!3974))

(assert (not b!253404))

(assert (not b!253396))

(assert (not b!253383))

(assert (not d!84726))

(assert (not d!84660))

(assert (not bm!3976))

(assert (not b!253378))

(assert (not b!253328))

(assert (not d!84736))

(assert (not b!253416))

(assert (not b!253407))

(assert (not b!253402))

(assert (not d!84716))

(assert (not d!84694))

(assert (not b!253439))

(assert (not d!84794))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

