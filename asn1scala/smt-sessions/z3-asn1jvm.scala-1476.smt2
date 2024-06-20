; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40858 () Bool)

(assert start!40858)

(declare-fun b!188057 () Bool)

(declare-fun e!129972 () Bool)

(declare-fun e!129975 () Bool)

(assert (=> b!188057 (= e!129972 e!129975)))

(declare-fun res!156668 () Bool)

(assert (=> b!188057 (=> res!156668 e!129975)))

(declare-datatypes ((array!9853 0))(
  ( (array!9854 (arr!5273 (Array (_ BitVec 32) (_ BitVec 8))) (size!4343 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7794 0))(
  ( (BitStream!7795 (buf!4814 array!9853) (currentByte!9080 (_ BitVec 32)) (currentBit!9075 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!16240 0))(
  ( (tuple2!16241 (_1!8765 BitStream!7794) (_2!8765 (_ BitVec 64))) )
))
(declare-fun lt!291803 () tuple2!16240)

(declare-datatypes ((tuple2!16242 0))(
  ( (tuple2!16243 (_1!8766 BitStream!7794) (_2!8766 BitStream!7794)) )
))
(declare-fun lt!291802 () tuple2!16242)

(assert (=> b!188057 (= res!156668 (not (= (_1!8765 lt!291803) (_2!8766 lt!291802))))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!291805 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7794 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16240)

(assert (=> b!188057 (= lt!291803 (readNBitsLSBFirstsLoopPure!0 (_1!8766 lt!291802) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!291805))))

(declare-datatypes ((Unit!13446 0))(
  ( (Unit!13447) )
))
(declare-datatypes ((tuple2!16244 0))(
  ( (tuple2!16245 (_1!8767 Unit!13446) (_2!8767 BitStream!7794)) )
))
(declare-fun lt!291784 () tuple2!16244)

(declare-fun lt!291792 () tuple2!16244)

(declare-fun lt!291795 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!188057 (validate_offset_bits!1 ((_ sign_extend 32) (size!4343 (buf!4814 (_2!8767 lt!291784)))) ((_ sign_extend 32) (currentByte!9080 (_2!8767 lt!291792))) ((_ sign_extend 32) (currentBit!9075 (_2!8767 lt!291792))) lt!291795)))

(declare-fun lt!291790 () Unit!13446)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7794 array!9853 (_ BitVec 64)) Unit!13446)

(assert (=> b!188057 (= lt!291790 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8767 lt!291792) (buf!4814 (_2!8767 lt!291784)) lt!291795))))

(assert (=> b!188057 (= lt!291795 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!291785 () (_ BitVec 64))

(declare-datatypes ((tuple2!16246 0))(
  ( (tuple2!16247 (_1!8768 BitStream!7794) (_2!8768 Bool)) )
))
(declare-fun lt!291779 () tuple2!16246)

(declare-fun lt!291793 () (_ BitVec 64))

(assert (=> b!188057 (= lt!291805 (bvor lt!291785 (ite (_2!8768 lt!291779) lt!291793 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!291786 () tuple2!16242)

(declare-fun lt!291780 () tuple2!16240)

(assert (=> b!188057 (= lt!291780 (readNBitsLSBFirstsLoopPure!0 (_1!8766 lt!291786) nBits!348 i!590 lt!291785))))

(declare-fun thiss!1204 () BitStream!7794)

(declare-fun lt!291799 () (_ BitVec 64))

(assert (=> b!188057 (validate_offset_bits!1 ((_ sign_extend 32) (size!4343 (buf!4814 (_2!8767 lt!291784)))) ((_ sign_extend 32) (currentByte!9080 thiss!1204)) ((_ sign_extend 32) (currentBit!9075 thiss!1204)) lt!291799)))

(declare-fun lt!291789 () Unit!13446)

(assert (=> b!188057 (= lt!291789 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4814 (_2!8767 lt!291784)) lt!291799))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!188057 (= lt!291785 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun lt!291794 () Bool)

(assert (=> b!188057 (= (_2!8768 lt!291779) lt!291794)))

(declare-fun readBitPure!0 (BitStream!7794) tuple2!16246)

(assert (=> b!188057 (= lt!291779 (readBitPure!0 (_1!8766 lt!291786)))))

(declare-fun reader!0 (BitStream!7794 BitStream!7794) tuple2!16242)

(assert (=> b!188057 (= lt!291802 (reader!0 (_2!8767 lt!291792) (_2!8767 lt!291784)))))

(assert (=> b!188057 (= lt!291786 (reader!0 thiss!1204 (_2!8767 lt!291784)))))

(declare-fun e!129969 () Bool)

(assert (=> b!188057 e!129969))

(declare-fun res!156660 () Bool)

(assert (=> b!188057 (=> (not res!156660) (not e!129969))))

(declare-fun lt!291791 () tuple2!16246)

(declare-fun lt!291787 () tuple2!16246)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!188057 (= res!156660 (= (bitIndex!0 (size!4343 (buf!4814 (_1!8768 lt!291791))) (currentByte!9080 (_1!8768 lt!291791)) (currentBit!9075 (_1!8768 lt!291791))) (bitIndex!0 (size!4343 (buf!4814 (_1!8768 lt!291787))) (currentByte!9080 (_1!8768 lt!291787)) (currentBit!9075 (_1!8768 lt!291787)))))))

(declare-fun lt!291783 () Unit!13446)

(declare-fun lt!291782 () BitStream!7794)

(declare-fun readBitPrefixLemma!0 (BitStream!7794 BitStream!7794) Unit!13446)

(assert (=> b!188057 (= lt!291783 (readBitPrefixLemma!0 lt!291782 (_2!8767 lt!291784)))))

(assert (=> b!188057 (= lt!291787 (readBitPure!0 (BitStream!7795 (buf!4814 (_2!8767 lt!291784)) (currentByte!9080 thiss!1204) (currentBit!9075 thiss!1204))))))

(assert (=> b!188057 (= lt!291791 (readBitPure!0 lt!291782))))

(declare-fun e!129966 () Bool)

(assert (=> b!188057 e!129966))

(declare-fun res!156657 () Bool)

(assert (=> b!188057 (=> (not res!156657) (not e!129966))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!188057 (= res!156657 (invariant!0 (currentBit!9075 thiss!1204) (currentByte!9080 thiss!1204) (size!4343 (buf!4814 (_2!8767 lt!291792)))))))

(assert (=> b!188057 (= lt!291782 (BitStream!7795 (buf!4814 (_2!8767 lt!291792)) (currentByte!9080 thiss!1204) (currentBit!9075 thiss!1204)))))

(declare-fun b!188058 () Bool)

(declare-fun res!156666 () Bool)

(declare-fun e!129976 () Bool)

(assert (=> b!188058 (=> (not res!156666) (not e!129976))))

(assert (=> b!188058 (= res!156666 (not (= i!590 nBits!348)))))

(declare-fun lt!291804 () BitStream!7794)

(declare-fun e!129973 () Bool)

(declare-fun lt!291778 () (_ BitVec 64))

(declare-fun lt!291777 () (_ BitVec 64))

(declare-fun b!188059 () Bool)

(assert (=> b!188059 (= e!129973 (and (= lt!291777 (bvsub lt!291778 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!8766 lt!291802) lt!291804)) (= (_2!8765 lt!291780) (_2!8765 lt!291803)))))))

(declare-fun b!188060 () Bool)

(declare-fun res!156651 () Bool)

(assert (=> b!188060 (=> res!156651 e!129972)))

(assert (=> b!188060 (= res!156651 (not (invariant!0 (currentBit!9075 (_2!8767 lt!291784)) (currentByte!9080 (_2!8767 lt!291784)) (size!4343 (buf!4814 (_2!8767 lt!291784))))))))

(declare-fun b!188061 () Bool)

(declare-fun res!156649 () Bool)

(assert (=> b!188061 (=> res!156649 e!129972)))

(declare-fun isPrefixOf!0 (BitStream!7794 BitStream!7794) Bool)

(assert (=> b!188061 (= res!156649 (not (isPrefixOf!0 thiss!1204 (_2!8767 lt!291792))))))

(declare-fun b!188062 () Bool)

(declare-fun e!129968 () Bool)

(declare-fun lt!291781 () tuple2!16246)

(declare-fun lt!291801 () (_ BitVec 64))

(assert (=> b!188062 (= e!129968 (= (bitIndex!0 (size!4343 (buf!4814 (_1!8768 lt!291781))) (currentByte!9080 (_1!8768 lt!291781)) (currentBit!9075 (_1!8768 lt!291781))) lt!291801))))

(declare-fun b!188063 () Bool)

(declare-fun res!156669 () Bool)

(assert (=> b!188063 (=> (not res!156669) (not e!129973))))

(declare-fun lt!291800 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!7794 (_ BitVec 64)) BitStream!7794)

(assert (=> b!188063 (= res!156669 (= (_1!8766 lt!291802) (withMovedBitIndex!0 (_2!8766 lt!291802) (bvsub lt!291778 lt!291800))))))

(declare-fun b!188064 () Bool)

(declare-fun res!156658 () Bool)

(assert (=> b!188064 (=> res!156658 e!129972)))

(assert (=> b!188064 (= res!156658 (or (not (= (size!4343 (buf!4814 (_2!8767 lt!291784))) (size!4343 (buf!4814 thiss!1204)))) (not (= lt!291800 (bvsub (bvadd lt!291777 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!188065 () Bool)

(declare-fun res!156663 () Bool)

(declare-fun e!129967 () Bool)

(assert (=> b!188065 (=> (not res!156663) (not e!129967))))

(assert (=> b!188065 (= res!156663 (isPrefixOf!0 thiss!1204 (_2!8767 lt!291792)))))

(declare-fun b!188066 () Bool)

(declare-fun e!129965 () Bool)

(assert (=> b!188066 (= e!129965 e!129967)))

(declare-fun res!156662 () Bool)

(assert (=> b!188066 (=> (not res!156662) (not e!129967))))

(declare-fun lt!291788 () (_ BitVec 64))

(assert (=> b!188066 (= res!156662 (= lt!291801 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!291788)))))

(assert (=> b!188066 (= lt!291801 (bitIndex!0 (size!4343 (buf!4814 (_2!8767 lt!291792))) (currentByte!9080 (_2!8767 lt!291792)) (currentBit!9075 (_2!8767 lt!291792))))))

(assert (=> b!188066 (= lt!291788 (bitIndex!0 (size!4343 (buf!4814 thiss!1204)) (currentByte!9080 thiss!1204) (currentBit!9075 thiss!1204)))))

(declare-fun b!188067 () Bool)

(declare-fun res!156665 () Bool)

(assert (=> b!188067 (=> res!156665 e!129972)))

(assert (=> b!188067 (= res!156665 (not (isPrefixOf!0 (_2!8767 lt!291792) (_2!8767 lt!291784))))))

(declare-fun b!188068 () Bool)

(declare-fun res!156659 () Bool)

(assert (=> b!188068 (=> (not res!156659) (not e!129973))))

(assert (=> b!188068 (= res!156659 (= (_1!8766 lt!291786) (withMovedBitIndex!0 (_2!8766 lt!291786) (bvsub lt!291777 lt!291800))))))

(declare-fun b!188069 () Bool)

(declare-fun e!129977 () Bool)

(declare-fun array_inv!4084 (array!9853) Bool)

(assert (=> b!188069 (= e!129977 (array_inv!4084 (buf!4814 thiss!1204)))))

(declare-fun b!188070 () Bool)

(assert (=> b!188070 (= e!129969 (= (_2!8768 lt!291791) (_2!8768 lt!291787)))))

(declare-fun b!188071 () Bool)

(declare-fun e!129964 () Bool)

(assert (=> b!188071 (= e!129975 e!129964)))

(declare-fun res!156650 () Bool)

(assert (=> b!188071 (=> res!156650 e!129964)))

(assert (=> b!188071 (= res!156650 (not (= (_1!8766 lt!291802) lt!291804)))))

(assert (=> b!188071 e!129973))

(declare-fun res!156655 () Bool)

(assert (=> b!188071 (=> (not res!156655) (not e!129973))))

(declare-fun lt!291797 () tuple2!16240)

(assert (=> b!188071 (= res!156655 (and (= (_2!8765 lt!291780) (_2!8765 lt!291797)) (= (_1!8765 lt!291780) (_1!8765 lt!291797))))))

(declare-fun lt!291796 () Unit!13446)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7794 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13446)

(assert (=> b!188071 (= lt!291796 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8766 lt!291786) nBits!348 i!590 lt!291785))))

(assert (=> b!188071 (= lt!291797 (readNBitsLSBFirstsLoopPure!0 lt!291804 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!291805))))

(assert (=> b!188071 (= lt!291804 (withMovedBitIndex!0 (_1!8766 lt!291786) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!188072 () Bool)

(assert (=> b!188072 (= e!129966 (invariant!0 (currentBit!9075 thiss!1204) (currentByte!9080 thiss!1204) (size!4343 (buf!4814 (_2!8767 lt!291784)))))))

(declare-fun b!188073 () Bool)

(assert (=> b!188073 (= e!129964 (invariant!0 (currentBit!9075 (_2!8766 lt!291786)) (currentByte!9080 (_2!8766 lt!291786)) (size!4343 (buf!4814 (_2!8766 lt!291786)))))))

(declare-fun b!188074 () Bool)

(declare-fun e!129974 () Bool)

(assert (=> b!188074 (= e!129974 e!129976)))

(declare-fun res!156654 () Bool)

(assert (=> b!188074 (=> (not res!156654) (not e!129976))))

(assert (=> b!188074 (= res!156654 (validate_offset_bits!1 ((_ sign_extend 32) (size!4343 (buf!4814 thiss!1204))) ((_ sign_extend 32) (currentByte!9080 thiss!1204)) ((_ sign_extend 32) (currentBit!9075 thiss!1204)) lt!291799))))

(assert (=> b!188074 (= lt!291799 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!188075 () Bool)

(declare-fun e!129970 () Bool)

(assert (=> b!188075 (= e!129976 (not e!129970))))

(declare-fun res!156652 () Bool)

(assert (=> b!188075 (=> res!156652 e!129970)))

(assert (=> b!188075 (= res!156652 (not (= lt!291778 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!291777))))))

(assert (=> b!188075 (= lt!291778 (bitIndex!0 (size!4343 (buf!4814 (_2!8767 lt!291792))) (currentByte!9080 (_2!8767 lt!291792)) (currentBit!9075 (_2!8767 lt!291792))))))

(assert (=> b!188075 (= lt!291777 (bitIndex!0 (size!4343 (buf!4814 thiss!1204)) (currentByte!9080 thiss!1204) (currentBit!9075 thiss!1204)))))

(assert (=> b!188075 e!129965))

(declare-fun res!156664 () Bool)

(assert (=> b!188075 (=> (not res!156664) (not e!129965))))

(assert (=> b!188075 (= res!156664 (= (size!4343 (buf!4814 thiss!1204)) (size!4343 (buf!4814 (_2!8767 lt!291792)))))))

(declare-fun appendBit!0 (BitStream!7794 Bool) tuple2!16244)

(assert (=> b!188075 (= lt!291792 (appendBit!0 thiss!1204 lt!291794))))

(assert (=> b!188075 (= lt!291794 (not (= (bvand v!189 lt!291793) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!188075 (= lt!291793 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!188076 () Bool)

(assert (=> b!188076 (= e!129970 e!129972)))

(declare-fun res!156667 () Bool)

(assert (=> b!188076 (=> res!156667 e!129972)))

(assert (=> b!188076 (= res!156667 (not (= lt!291800 (bvsub (bvsub (bvadd lt!291778 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!188076 (= lt!291800 (bitIndex!0 (size!4343 (buf!4814 (_2!8767 lt!291784))) (currentByte!9080 (_2!8767 lt!291784)) (currentBit!9075 (_2!8767 lt!291784))))))

(assert (=> b!188076 (isPrefixOf!0 thiss!1204 (_2!8767 lt!291784))))

(declare-fun lt!291798 () Unit!13446)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7794 BitStream!7794 BitStream!7794) Unit!13446)

(assert (=> b!188076 (= lt!291798 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8767 lt!291792) (_2!8767 lt!291784)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7794 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16244)

(assert (=> b!188076 (= lt!291784 (appendBitsLSBFirstLoopTR!0 (_2!8767 lt!291792) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!188077 () Bool)

(declare-fun res!156653 () Bool)

(assert (=> b!188077 (=> (not res!156653) (not e!129976))))

(assert (=> b!188077 (= res!156653 (invariant!0 (currentBit!9075 thiss!1204) (currentByte!9080 thiss!1204) (size!4343 (buf!4814 thiss!1204))))))

(declare-fun res!156661 () Bool)

(assert (=> start!40858 (=> (not res!156661) (not e!129974))))

(assert (=> start!40858 (= res!156661 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40858 e!129974))

(assert (=> start!40858 true))

(declare-fun inv!12 (BitStream!7794) Bool)

(assert (=> start!40858 (and (inv!12 thiss!1204) e!129977)))

(declare-fun b!188078 () Bool)

(assert (=> b!188078 (= e!129967 e!129968)))

(declare-fun res!156656 () Bool)

(assert (=> b!188078 (=> (not res!156656) (not e!129968))))

(assert (=> b!188078 (= res!156656 (and (= (_2!8768 lt!291781) lt!291794) (= (_1!8768 lt!291781) (_2!8767 lt!291792))))))

(declare-fun readerFrom!0 (BitStream!7794 (_ BitVec 32) (_ BitVec 32)) BitStream!7794)

(assert (=> b!188078 (= lt!291781 (readBitPure!0 (readerFrom!0 (_2!8767 lt!291792) (currentBit!9075 thiss!1204) (currentByte!9080 thiss!1204))))))

(assert (= (and start!40858 res!156661) b!188074))

(assert (= (and b!188074 res!156654) b!188077))

(assert (= (and b!188077 res!156653) b!188058))

(assert (= (and b!188058 res!156666) b!188075))

(assert (= (and b!188075 res!156664) b!188066))

(assert (= (and b!188066 res!156662) b!188065))

(assert (= (and b!188065 res!156663) b!188078))

(assert (= (and b!188078 res!156656) b!188062))

(assert (= (and b!188075 (not res!156652)) b!188076))

(assert (= (and b!188076 (not res!156667)) b!188060))

(assert (= (and b!188060 (not res!156651)) b!188064))

(assert (= (and b!188064 (not res!156658)) b!188067))

(assert (= (and b!188067 (not res!156665)) b!188061))

(assert (= (and b!188061 (not res!156649)) b!188057))

(assert (= (and b!188057 res!156657) b!188072))

(assert (= (and b!188057 res!156660) b!188070))

(assert (= (and b!188057 (not res!156668)) b!188071))

(assert (= (and b!188071 res!156655) b!188068))

(assert (= (and b!188068 res!156659) b!188063))

(assert (= (and b!188063 res!156669) b!188059))

(assert (= (and b!188071 (not res!156650)) b!188073))

(assert (= start!40858 b!188069))

(declare-fun m!292495 () Bool)

(assert (=> b!188062 m!292495))

(declare-fun m!292497 () Bool)

(assert (=> b!188060 m!292497))

(declare-fun m!292499 () Bool)

(assert (=> start!40858 m!292499))

(declare-fun m!292501 () Bool)

(assert (=> b!188072 m!292501))

(declare-fun m!292503 () Bool)

(assert (=> b!188067 m!292503))

(declare-fun m!292505 () Bool)

(assert (=> b!188073 m!292505))

(declare-fun m!292507 () Bool)

(assert (=> b!188066 m!292507))

(declare-fun m!292509 () Bool)

(assert (=> b!188066 m!292509))

(declare-fun m!292511 () Bool)

(assert (=> b!188071 m!292511))

(declare-fun m!292513 () Bool)

(assert (=> b!188071 m!292513))

(declare-fun m!292515 () Bool)

(assert (=> b!188071 m!292515))

(assert (=> b!188075 m!292507))

(assert (=> b!188075 m!292509))

(declare-fun m!292517 () Bool)

(assert (=> b!188075 m!292517))

(declare-fun m!292519 () Bool)

(assert (=> b!188078 m!292519))

(assert (=> b!188078 m!292519))

(declare-fun m!292521 () Bool)

(assert (=> b!188078 m!292521))

(declare-fun m!292523 () Bool)

(assert (=> b!188065 m!292523))

(declare-fun m!292525 () Bool)

(assert (=> b!188069 m!292525))

(declare-fun m!292527 () Bool)

(assert (=> b!188068 m!292527))

(declare-fun m!292529 () Bool)

(assert (=> b!188076 m!292529))

(declare-fun m!292531 () Bool)

(assert (=> b!188076 m!292531))

(declare-fun m!292533 () Bool)

(assert (=> b!188076 m!292533))

(declare-fun m!292535 () Bool)

(assert (=> b!188076 m!292535))

(declare-fun m!292537 () Bool)

(assert (=> b!188063 m!292537))

(declare-fun m!292539 () Bool)

(assert (=> b!188057 m!292539))

(declare-fun m!292541 () Bool)

(assert (=> b!188057 m!292541))

(declare-fun m!292543 () Bool)

(assert (=> b!188057 m!292543))

(declare-fun m!292545 () Bool)

(assert (=> b!188057 m!292545))

(declare-fun m!292547 () Bool)

(assert (=> b!188057 m!292547))

(declare-fun m!292549 () Bool)

(assert (=> b!188057 m!292549))

(declare-fun m!292551 () Bool)

(assert (=> b!188057 m!292551))

(declare-fun m!292553 () Bool)

(assert (=> b!188057 m!292553))

(declare-fun m!292555 () Bool)

(assert (=> b!188057 m!292555))

(declare-fun m!292557 () Bool)

(assert (=> b!188057 m!292557))

(declare-fun m!292559 () Bool)

(assert (=> b!188057 m!292559))

(declare-fun m!292561 () Bool)

(assert (=> b!188057 m!292561))

(declare-fun m!292563 () Bool)

(assert (=> b!188057 m!292563))

(declare-fun m!292565 () Bool)

(assert (=> b!188057 m!292565))

(declare-fun m!292567 () Bool)

(assert (=> b!188057 m!292567))

(declare-fun m!292569 () Bool)

(assert (=> b!188057 m!292569))

(declare-fun m!292571 () Bool)

(assert (=> b!188077 m!292571))

(assert (=> b!188061 m!292523))

(declare-fun m!292573 () Bool)

(assert (=> b!188074 m!292573))

(check-sat (not b!188065) (not b!188063) (not b!188061) (not b!188072) (not start!40858) (not b!188069) (not b!188066) (not b!188057) (not b!188068) (not b!188075) (not b!188067) (not b!188074) (not b!188077) (not b!188062) (not b!188073) (not b!188071) (not b!188078) (not b!188060) (not b!188076))
(check-sat)
(get-model)

(declare-fun d!64897 () Bool)

(assert (=> d!64897 (= (invariant!0 (currentBit!9075 thiss!1204) (currentByte!9080 thiss!1204) (size!4343 (buf!4814 thiss!1204))) (and (bvsge (currentBit!9075 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9075 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9080 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9080 thiss!1204) (size!4343 (buf!4814 thiss!1204))) (and (= (currentBit!9075 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9080 thiss!1204) (size!4343 (buf!4814 thiss!1204)))))))))

(assert (=> b!188077 d!64897))

(declare-fun d!64899 () Bool)

(declare-fun e!130022 () Bool)

(assert (=> d!64899 e!130022))

(declare-fun res!156737 () Bool)

(assert (=> d!64899 (=> (not res!156737) (not e!130022))))

(declare-fun lt!291908 () (_ BitVec 64))

(declare-fun lt!291907 () (_ BitVec 64))

(declare-fun lt!291905 () (_ BitVec 64))

(assert (=> d!64899 (= res!156737 (= lt!291905 (bvsub lt!291908 lt!291907)))))

(assert (=> d!64899 (or (= (bvand lt!291908 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!291907 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!291908 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!291908 lt!291907) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!64899 (= lt!291907 (remainingBits!0 ((_ sign_extend 32) (size!4343 (buf!4814 (_2!8767 lt!291792)))) ((_ sign_extend 32) (currentByte!9080 (_2!8767 lt!291792))) ((_ sign_extend 32) (currentBit!9075 (_2!8767 lt!291792)))))))

(declare-fun lt!291909 () (_ BitVec 64))

(declare-fun lt!291910 () (_ BitVec 64))

(assert (=> d!64899 (= lt!291908 (bvmul lt!291909 lt!291910))))

(assert (=> d!64899 (or (= lt!291909 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!291910 (bvsdiv (bvmul lt!291909 lt!291910) lt!291909)))))

(assert (=> d!64899 (= lt!291910 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64899 (= lt!291909 ((_ sign_extend 32) (size!4343 (buf!4814 (_2!8767 lt!291792)))))))

(assert (=> d!64899 (= lt!291905 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9080 (_2!8767 lt!291792))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9075 (_2!8767 lt!291792)))))))

(assert (=> d!64899 (invariant!0 (currentBit!9075 (_2!8767 lt!291792)) (currentByte!9080 (_2!8767 lt!291792)) (size!4343 (buf!4814 (_2!8767 lt!291792))))))

(assert (=> d!64899 (= (bitIndex!0 (size!4343 (buf!4814 (_2!8767 lt!291792))) (currentByte!9080 (_2!8767 lt!291792)) (currentBit!9075 (_2!8767 lt!291792))) lt!291905)))

(declare-fun b!188149 () Bool)

(declare-fun res!156738 () Bool)

(assert (=> b!188149 (=> (not res!156738) (not e!130022))))

(assert (=> b!188149 (= res!156738 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!291905))))

(declare-fun b!188150 () Bool)

(declare-fun lt!291906 () (_ BitVec 64))

(assert (=> b!188150 (= e!130022 (bvsle lt!291905 (bvmul lt!291906 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!188150 (or (= lt!291906 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!291906 #b0000000000000000000000000000000000000000000000000000000000001000) lt!291906)))))

(assert (=> b!188150 (= lt!291906 ((_ sign_extend 32) (size!4343 (buf!4814 (_2!8767 lt!291792)))))))

(assert (= (and d!64899 res!156737) b!188149))

(assert (= (and b!188149 res!156738) b!188150))

(declare-fun m!292655 () Bool)

(assert (=> d!64899 m!292655))

(declare-fun m!292657 () Bool)

(assert (=> d!64899 m!292657))

(assert (=> b!188066 d!64899))

(declare-fun d!64901 () Bool)

(declare-fun e!130023 () Bool)

(assert (=> d!64901 e!130023))

(declare-fun res!156739 () Bool)

(assert (=> d!64901 (=> (not res!156739) (not e!130023))))

(declare-fun lt!291914 () (_ BitVec 64))

(declare-fun lt!291913 () (_ BitVec 64))

(declare-fun lt!291911 () (_ BitVec 64))

(assert (=> d!64901 (= res!156739 (= lt!291911 (bvsub lt!291914 lt!291913)))))

(assert (=> d!64901 (or (= (bvand lt!291914 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!291913 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!291914 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!291914 lt!291913) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64901 (= lt!291913 (remainingBits!0 ((_ sign_extend 32) (size!4343 (buf!4814 thiss!1204))) ((_ sign_extend 32) (currentByte!9080 thiss!1204)) ((_ sign_extend 32) (currentBit!9075 thiss!1204))))))

(declare-fun lt!291915 () (_ BitVec 64))

(declare-fun lt!291916 () (_ BitVec 64))

(assert (=> d!64901 (= lt!291914 (bvmul lt!291915 lt!291916))))

(assert (=> d!64901 (or (= lt!291915 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!291916 (bvsdiv (bvmul lt!291915 lt!291916) lt!291915)))))

(assert (=> d!64901 (= lt!291916 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64901 (= lt!291915 ((_ sign_extend 32) (size!4343 (buf!4814 thiss!1204))))))

(assert (=> d!64901 (= lt!291911 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9080 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9075 thiss!1204))))))

(assert (=> d!64901 (invariant!0 (currentBit!9075 thiss!1204) (currentByte!9080 thiss!1204) (size!4343 (buf!4814 thiss!1204)))))

(assert (=> d!64901 (= (bitIndex!0 (size!4343 (buf!4814 thiss!1204)) (currentByte!9080 thiss!1204) (currentBit!9075 thiss!1204)) lt!291911)))

(declare-fun b!188151 () Bool)

(declare-fun res!156740 () Bool)

(assert (=> b!188151 (=> (not res!156740) (not e!130023))))

(assert (=> b!188151 (= res!156740 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!291911))))

(declare-fun b!188152 () Bool)

(declare-fun lt!291912 () (_ BitVec 64))

(assert (=> b!188152 (= e!130023 (bvsle lt!291911 (bvmul lt!291912 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!188152 (or (= lt!291912 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!291912 #b0000000000000000000000000000000000000000000000000000000000001000) lt!291912)))))

(assert (=> b!188152 (= lt!291912 ((_ sign_extend 32) (size!4343 (buf!4814 thiss!1204))))))

(assert (= (and d!64901 res!156739) b!188151))

(assert (= (and b!188151 res!156740) b!188152))

(declare-fun m!292659 () Bool)

(assert (=> d!64901 m!292659))

(assert (=> d!64901 m!292571))

(assert (=> b!188066 d!64901))

(declare-fun d!64903 () Bool)

(declare-fun e!130024 () Bool)

(assert (=> d!64903 e!130024))

(declare-fun res!156741 () Bool)

(assert (=> d!64903 (=> (not res!156741) (not e!130024))))

(declare-fun lt!291920 () (_ BitVec 64))

(declare-fun lt!291917 () (_ BitVec 64))

(declare-fun lt!291919 () (_ BitVec 64))

(assert (=> d!64903 (= res!156741 (= lt!291917 (bvsub lt!291920 lt!291919)))))

(assert (=> d!64903 (or (= (bvand lt!291920 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!291919 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!291920 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!291920 lt!291919) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64903 (= lt!291919 (remainingBits!0 ((_ sign_extend 32) (size!4343 (buf!4814 (_2!8767 lt!291784)))) ((_ sign_extend 32) (currentByte!9080 (_2!8767 lt!291784))) ((_ sign_extend 32) (currentBit!9075 (_2!8767 lt!291784)))))))

(declare-fun lt!291921 () (_ BitVec 64))

(declare-fun lt!291922 () (_ BitVec 64))

(assert (=> d!64903 (= lt!291920 (bvmul lt!291921 lt!291922))))

(assert (=> d!64903 (or (= lt!291921 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!291922 (bvsdiv (bvmul lt!291921 lt!291922) lt!291921)))))

(assert (=> d!64903 (= lt!291922 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64903 (= lt!291921 ((_ sign_extend 32) (size!4343 (buf!4814 (_2!8767 lt!291784)))))))

(assert (=> d!64903 (= lt!291917 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9080 (_2!8767 lt!291784))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9075 (_2!8767 lt!291784)))))))

(assert (=> d!64903 (invariant!0 (currentBit!9075 (_2!8767 lt!291784)) (currentByte!9080 (_2!8767 lt!291784)) (size!4343 (buf!4814 (_2!8767 lt!291784))))))

(assert (=> d!64903 (= (bitIndex!0 (size!4343 (buf!4814 (_2!8767 lt!291784))) (currentByte!9080 (_2!8767 lt!291784)) (currentBit!9075 (_2!8767 lt!291784))) lt!291917)))

(declare-fun b!188153 () Bool)

(declare-fun res!156742 () Bool)

(assert (=> b!188153 (=> (not res!156742) (not e!130024))))

(assert (=> b!188153 (= res!156742 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!291917))))

(declare-fun b!188154 () Bool)

(declare-fun lt!291918 () (_ BitVec 64))

(assert (=> b!188154 (= e!130024 (bvsle lt!291917 (bvmul lt!291918 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!188154 (or (= lt!291918 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!291918 #b0000000000000000000000000000000000000000000000000000000000001000) lt!291918)))))

(assert (=> b!188154 (= lt!291918 ((_ sign_extend 32) (size!4343 (buf!4814 (_2!8767 lt!291784)))))))

(assert (= (and d!64903 res!156741) b!188153))

(assert (= (and b!188153 res!156742) b!188154))

(declare-fun m!292661 () Bool)

(assert (=> d!64903 m!292661))

(assert (=> d!64903 m!292497))

(assert (=> b!188076 d!64903))

(declare-fun d!64905 () Bool)

(declare-fun res!156750 () Bool)

(declare-fun e!130029 () Bool)

(assert (=> d!64905 (=> (not res!156750) (not e!130029))))

(assert (=> d!64905 (= res!156750 (= (size!4343 (buf!4814 thiss!1204)) (size!4343 (buf!4814 (_2!8767 lt!291784)))))))

(assert (=> d!64905 (= (isPrefixOf!0 thiss!1204 (_2!8767 lt!291784)) e!130029)))

(declare-fun b!188161 () Bool)

(declare-fun res!156751 () Bool)

(assert (=> b!188161 (=> (not res!156751) (not e!130029))))

(assert (=> b!188161 (= res!156751 (bvsle (bitIndex!0 (size!4343 (buf!4814 thiss!1204)) (currentByte!9080 thiss!1204) (currentBit!9075 thiss!1204)) (bitIndex!0 (size!4343 (buf!4814 (_2!8767 lt!291784))) (currentByte!9080 (_2!8767 lt!291784)) (currentBit!9075 (_2!8767 lt!291784)))))))

(declare-fun b!188162 () Bool)

(declare-fun e!130030 () Bool)

(assert (=> b!188162 (= e!130029 e!130030)))

(declare-fun res!156749 () Bool)

(assert (=> b!188162 (=> res!156749 e!130030)))

(assert (=> b!188162 (= res!156749 (= (size!4343 (buf!4814 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!188163 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9853 array!9853 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!188163 (= e!130030 (arrayBitRangesEq!0 (buf!4814 thiss!1204) (buf!4814 (_2!8767 lt!291784)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4343 (buf!4814 thiss!1204)) (currentByte!9080 thiss!1204) (currentBit!9075 thiss!1204))))))

(assert (= (and d!64905 res!156750) b!188161))

(assert (= (and b!188161 res!156751) b!188162))

(assert (= (and b!188162 (not res!156749)) b!188163))

(assert (=> b!188161 m!292509))

(assert (=> b!188161 m!292529))

(assert (=> b!188163 m!292509))

(assert (=> b!188163 m!292509))

(declare-fun m!292663 () Bool)

(assert (=> b!188163 m!292663))

(assert (=> b!188076 d!64905))

(declare-fun d!64907 () Bool)

(assert (=> d!64907 (isPrefixOf!0 thiss!1204 (_2!8767 lt!291784))))

(declare-fun lt!291925 () Unit!13446)

(declare-fun choose!30 (BitStream!7794 BitStream!7794 BitStream!7794) Unit!13446)

(assert (=> d!64907 (= lt!291925 (choose!30 thiss!1204 (_2!8767 lt!291792) (_2!8767 lt!291784)))))

(assert (=> d!64907 (isPrefixOf!0 thiss!1204 (_2!8767 lt!291792))))

(assert (=> d!64907 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8767 lt!291792) (_2!8767 lt!291784)) lt!291925)))

(declare-fun bs!16131 () Bool)

(assert (= bs!16131 d!64907))

(assert (=> bs!16131 m!292531))

(declare-fun m!292665 () Bool)

(assert (=> bs!16131 m!292665))

(assert (=> bs!16131 m!292523))

(assert (=> b!188076 d!64907))

(declare-fun b!188226 () Bool)

(declare-fun res!156813 () Bool)

(declare-fun e!130068 () Bool)

(assert (=> b!188226 (=> (not res!156813) (not e!130068))))

(declare-fun lt!292094 () (_ BitVec 64))

(declare-fun lt!292121 () tuple2!16244)

(declare-fun lt!292083 () (_ BitVec 64))

(assert (=> b!188226 (= res!156813 (= (bitIndex!0 (size!4343 (buf!4814 (_2!8767 lt!292121))) (currentByte!9080 (_2!8767 lt!292121)) (currentBit!9075 (_2!8767 lt!292121))) (bvsub lt!292094 lt!292083)))))

(assert (=> b!188226 (or (= (bvand lt!292094 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!292083 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!292094 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!292094 lt!292083) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!188226 (= lt!292083 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!292119 () (_ BitVec 64))

(declare-fun lt!292126 () (_ BitVec 64))

(assert (=> b!188226 (= lt!292094 (bvadd lt!292119 lt!292126))))

(assert (=> b!188226 (or (not (= (bvand lt!292119 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!292126 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!292119 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!292119 lt!292126) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!188226 (= lt!292126 ((_ sign_extend 32) nBits!348))))

(assert (=> b!188226 (= lt!292119 (bitIndex!0 (size!4343 (buf!4814 (_2!8767 lt!291792))) (currentByte!9080 (_2!8767 lt!291792)) (currentBit!9075 (_2!8767 lt!291792))))))

(declare-fun b!188227 () Bool)

(declare-fun e!130071 () Bool)

(declare-fun lt!292084 () tuple2!16246)

(declare-fun lt!292102 () tuple2!16246)

(assert (=> b!188227 (= e!130071 (= (_2!8768 lt!292084) (_2!8768 lt!292102)))))

(declare-fun b!188228 () Bool)

(declare-fun res!156817 () Bool)

(assert (=> b!188228 (=> (not res!156817) (not e!130068))))

(assert (=> b!188228 (= res!156817 (isPrefixOf!0 (_2!8767 lt!291792) (_2!8767 lt!292121)))))

(declare-fun b!188229 () Bool)

(declare-fun e!130072 () (_ BitVec 64))

(assert (=> b!188229 (= e!130072 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!188230 () Bool)

(declare-fun e!130070 () tuple2!16244)

(declare-fun Unit!13450 () Unit!13446)

(assert (=> b!188230 (= e!130070 (tuple2!16245 Unit!13450 (_2!8767 lt!291792)))))

(declare-fun lt!292109 () Unit!13446)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7794) Unit!13446)

(assert (=> b!188230 (= lt!292109 (lemmaIsPrefixRefl!0 (_2!8767 lt!291792)))))

(declare-fun call!3023 () Bool)

(assert (=> b!188230 call!3023))

(declare-fun lt!292135 () Unit!13446)

(assert (=> b!188230 (= lt!292135 lt!292109)))

(declare-fun b!188231 () Bool)

(declare-fun res!156809 () Bool)

(assert (=> b!188231 (=> (not res!156809) (not e!130068))))

(assert (=> b!188231 (= res!156809 (= (size!4343 (buf!4814 (_2!8767 lt!291792))) (size!4343 (buf!4814 (_2!8767 lt!292121)))))))

(declare-fun b!188232 () Bool)

(declare-fun e!130075 () Bool)

(declare-fun lt!292110 () (_ BitVec 64))

(assert (=> b!188232 (= e!130075 (validate_offset_bits!1 ((_ sign_extend 32) (size!4343 (buf!4814 (_2!8767 lt!291792)))) ((_ sign_extend 32) (currentByte!9080 (_2!8767 lt!291792))) ((_ sign_extend 32) (currentBit!9075 (_2!8767 lt!291792))) lt!292110))))

(declare-fun b!188233 () Bool)

(declare-fun e!130073 () Bool)

(assert (=> b!188233 (= e!130068 e!130073)))

(declare-fun res!156810 () Bool)

(assert (=> b!188233 (=> (not res!156810) (not e!130073))))

(declare-fun lt!292092 () tuple2!16240)

(assert (=> b!188233 (= res!156810 (= (_2!8765 lt!292092) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!292112 () tuple2!16242)

(assert (=> b!188233 (= lt!292092 (readNBitsLSBFirstsLoopPure!0 (_1!8766 lt!292112) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!292115 () Unit!13446)

(declare-fun lt!292085 () Unit!13446)

(assert (=> b!188233 (= lt!292115 lt!292085)))

(assert (=> b!188233 (validate_offset_bits!1 ((_ sign_extend 32) (size!4343 (buf!4814 (_2!8767 lt!292121)))) ((_ sign_extend 32) (currentByte!9080 (_2!8767 lt!291792))) ((_ sign_extend 32) (currentBit!9075 (_2!8767 lt!291792))) lt!292110)))

(assert (=> b!188233 (= lt!292085 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8767 lt!291792) (buf!4814 (_2!8767 lt!292121)) lt!292110))))

(assert (=> b!188233 e!130075))

(declare-fun res!156812 () Bool)

(assert (=> b!188233 (=> (not res!156812) (not e!130075))))

(assert (=> b!188233 (= res!156812 (and (= (size!4343 (buf!4814 (_2!8767 lt!291792))) (size!4343 (buf!4814 (_2!8767 lt!292121)))) (bvsge lt!292110 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!188233 (= lt!292110 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!188233 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!188233 (= lt!292112 (reader!0 (_2!8767 lt!291792) (_2!8767 lt!292121)))))

(declare-fun b!188234 () Bool)

(declare-fun res!156816 () Bool)

(declare-fun lt!292113 () tuple2!16244)

(assert (=> b!188234 (= res!156816 (= (bitIndex!0 (size!4343 (buf!4814 (_2!8767 lt!292113))) (currentByte!9080 (_2!8767 lt!292113)) (currentBit!9075 (_2!8767 lt!292113))) (bvadd (bitIndex!0 (size!4343 (buf!4814 (_2!8767 lt!291792))) (currentByte!9080 (_2!8767 lt!291792)) (currentBit!9075 (_2!8767 lt!291792))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!130074 () Bool)

(assert (=> b!188234 (=> (not res!156816) (not e!130074))))

(declare-fun b!188235 () Bool)

(declare-fun e!130067 () Bool)

(declare-fun lt!292081 () tuple2!16240)

(declare-fun lt!292103 () tuple2!16242)

(assert (=> b!188235 (= e!130067 (= (_1!8765 lt!292081) (_2!8766 lt!292103)))))

(declare-fun b!188236 () Bool)

(declare-fun lt!292118 () tuple2!16244)

(assert (=> b!188236 (= e!130070 (tuple2!16245 (_1!8767 lt!292118) (_2!8767 lt!292118)))))

(declare-fun lt!292111 () Bool)

(assert (=> b!188236 (= lt!292111 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!188236 (= lt!292113 (appendBit!0 (_2!8767 lt!291792) lt!292111))))

(declare-fun res!156811 () Bool)

(assert (=> b!188236 (= res!156811 (= (size!4343 (buf!4814 (_2!8767 lt!291792))) (size!4343 (buf!4814 (_2!8767 lt!292113)))))))

(assert (=> b!188236 (=> (not res!156811) (not e!130074))))

(assert (=> b!188236 e!130074))

(declare-fun lt!292120 () tuple2!16244)

(assert (=> b!188236 (= lt!292120 lt!292113)))

(assert (=> b!188236 (= lt!292118 (appendBitsLSBFirstLoopTR!0 (_2!8767 lt!292120) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!292129 () Unit!13446)

(assert (=> b!188236 (= lt!292129 (lemmaIsPrefixTransitive!0 (_2!8767 lt!291792) (_2!8767 lt!292120) (_2!8767 lt!292118)))))

(assert (=> b!188236 (isPrefixOf!0 (_2!8767 lt!291792) (_2!8767 lt!292118))))

(declare-fun lt!292127 () Unit!13446)

(assert (=> b!188236 (= lt!292127 lt!292129)))

(assert (=> b!188236 (invariant!0 (currentBit!9075 (_2!8767 lt!291792)) (currentByte!9080 (_2!8767 lt!291792)) (size!4343 (buf!4814 (_2!8767 lt!292120))))))

(declare-fun lt!292097 () BitStream!7794)

(assert (=> b!188236 (= lt!292097 (BitStream!7795 (buf!4814 (_2!8767 lt!292120)) (currentByte!9080 (_2!8767 lt!291792)) (currentBit!9075 (_2!8767 lt!291792))))))

(assert (=> b!188236 (invariant!0 (currentBit!9075 lt!292097) (currentByte!9080 lt!292097) (size!4343 (buf!4814 (_2!8767 lt!292118))))))

(declare-fun lt!292134 () BitStream!7794)

(assert (=> b!188236 (= lt!292134 (BitStream!7795 (buf!4814 (_2!8767 lt!292118)) (currentByte!9080 lt!292097) (currentBit!9075 lt!292097)))))

(assert (=> b!188236 (= lt!292084 (readBitPure!0 lt!292097))))

(assert (=> b!188236 (= lt!292102 (readBitPure!0 lt!292134))))

(declare-fun lt!292091 () Unit!13446)

(assert (=> b!188236 (= lt!292091 (readBitPrefixLemma!0 lt!292097 (_2!8767 lt!292118)))))

(declare-fun res!156806 () Bool)

(assert (=> b!188236 (= res!156806 (= (bitIndex!0 (size!4343 (buf!4814 (_1!8768 lt!292084))) (currentByte!9080 (_1!8768 lt!292084)) (currentBit!9075 (_1!8768 lt!292084))) (bitIndex!0 (size!4343 (buf!4814 (_1!8768 lt!292102))) (currentByte!9080 (_1!8768 lt!292102)) (currentBit!9075 (_1!8768 lt!292102)))))))

(assert (=> b!188236 (=> (not res!156806) (not e!130071))))

(assert (=> b!188236 e!130071))

(declare-fun lt!292131 () Unit!13446)

(assert (=> b!188236 (= lt!292131 lt!292091)))

(declare-fun lt!292107 () tuple2!16242)

(assert (=> b!188236 (= lt!292107 (reader!0 (_2!8767 lt!291792) (_2!8767 lt!292118)))))

(declare-fun lt!292080 () tuple2!16242)

(assert (=> b!188236 (= lt!292080 (reader!0 (_2!8767 lt!292120) (_2!8767 lt!292118)))))

(declare-fun lt!292087 () tuple2!16246)

(assert (=> b!188236 (= lt!292087 (readBitPure!0 (_1!8766 lt!292107)))))

(assert (=> b!188236 (= (_2!8768 lt!292087) lt!292111)))

(declare-fun lt!292105 () Unit!13446)

(declare-fun Unit!13451 () Unit!13446)

(assert (=> b!188236 (= lt!292105 Unit!13451)))

(declare-fun lt!292117 () (_ BitVec 64))

(assert (=> b!188236 (= lt!292117 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!292128 () (_ BitVec 64))

(assert (=> b!188236 (= lt!292128 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!292124 () Unit!13446)

(assert (=> b!188236 (= lt!292124 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8767 lt!291792) (buf!4814 (_2!8767 lt!292118)) lt!292128))))

(assert (=> b!188236 (validate_offset_bits!1 ((_ sign_extend 32) (size!4343 (buf!4814 (_2!8767 lt!292118)))) ((_ sign_extend 32) (currentByte!9080 (_2!8767 lt!291792))) ((_ sign_extend 32) (currentBit!9075 (_2!8767 lt!291792))) lt!292128)))

(declare-fun lt!292088 () Unit!13446)

(assert (=> b!188236 (= lt!292088 lt!292124)))

(declare-fun lt!292132 () tuple2!16240)

(assert (=> b!188236 (= lt!292132 (readNBitsLSBFirstsLoopPure!0 (_1!8766 lt!292107) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!292117))))

(declare-fun lt!292099 () (_ BitVec 64))

(assert (=> b!188236 (= lt!292099 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!292123 () Unit!13446)

(assert (=> b!188236 (= lt!292123 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8767 lt!292120) (buf!4814 (_2!8767 lt!292118)) lt!292099))))

(assert (=> b!188236 (validate_offset_bits!1 ((_ sign_extend 32) (size!4343 (buf!4814 (_2!8767 lt!292118)))) ((_ sign_extend 32) (currentByte!9080 (_2!8767 lt!292120))) ((_ sign_extend 32) (currentBit!9075 (_2!8767 lt!292120))) lt!292099)))

(declare-fun lt!292122 () Unit!13446)

(assert (=> b!188236 (= lt!292122 lt!292123)))

(declare-fun lt!292106 () tuple2!16240)

(assert (=> b!188236 (= lt!292106 (readNBitsLSBFirstsLoopPure!0 (_1!8766 lt!292080) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!292117 (ite (_2!8768 lt!292087) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!292082 () tuple2!16240)

(assert (=> b!188236 (= lt!292082 (readNBitsLSBFirstsLoopPure!0 (_1!8766 lt!292107) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!292117))))

(declare-fun c!9594 () Bool)

(assert (=> b!188236 (= c!9594 (_2!8768 (readBitPure!0 (_1!8766 lt!292107))))))

(declare-fun lt!292101 () tuple2!16240)

(assert (=> b!188236 (= lt!292101 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8766 lt!292107) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!292117 e!130072)))))

(declare-fun lt!292104 () Unit!13446)

(assert (=> b!188236 (= lt!292104 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8766 lt!292107) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!292117))))

(assert (=> b!188236 (and (= (_2!8765 lt!292082) (_2!8765 lt!292101)) (= (_1!8765 lt!292082) (_1!8765 lt!292101)))))

(declare-fun lt!292095 () Unit!13446)

(assert (=> b!188236 (= lt!292095 lt!292104)))

(assert (=> b!188236 (= (_1!8766 lt!292107) (withMovedBitIndex!0 (_2!8766 lt!292107) (bvsub (bitIndex!0 (size!4343 (buf!4814 (_2!8767 lt!291792))) (currentByte!9080 (_2!8767 lt!291792)) (currentBit!9075 (_2!8767 lt!291792))) (bitIndex!0 (size!4343 (buf!4814 (_2!8767 lt!292118))) (currentByte!9080 (_2!8767 lt!292118)) (currentBit!9075 (_2!8767 lt!292118))))))))

(declare-fun lt!292098 () Unit!13446)

(declare-fun Unit!13452 () Unit!13446)

(assert (=> b!188236 (= lt!292098 Unit!13452)))

(assert (=> b!188236 (= (_1!8766 lt!292080) (withMovedBitIndex!0 (_2!8766 lt!292080) (bvsub (bitIndex!0 (size!4343 (buf!4814 (_2!8767 lt!292120))) (currentByte!9080 (_2!8767 lt!292120)) (currentBit!9075 (_2!8767 lt!292120))) (bitIndex!0 (size!4343 (buf!4814 (_2!8767 lt!292118))) (currentByte!9080 (_2!8767 lt!292118)) (currentBit!9075 (_2!8767 lt!292118))))))))

(declare-fun lt!292133 () Unit!13446)

(declare-fun Unit!13453 () Unit!13446)

(assert (=> b!188236 (= lt!292133 Unit!13453)))

(assert (=> b!188236 (= (bitIndex!0 (size!4343 (buf!4814 (_2!8767 lt!291792))) (currentByte!9080 (_2!8767 lt!291792)) (currentBit!9075 (_2!8767 lt!291792))) (bvsub (bitIndex!0 (size!4343 (buf!4814 (_2!8767 lt!292120))) (currentByte!9080 (_2!8767 lt!292120)) (currentBit!9075 (_2!8767 lt!292120))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!292090 () Unit!13446)

(declare-fun Unit!13454 () Unit!13446)

(assert (=> b!188236 (= lt!292090 Unit!13454)))

(assert (=> b!188236 (= (_2!8765 lt!292132) (_2!8765 lt!292106))))

(declare-fun lt!292096 () Unit!13446)

(declare-fun Unit!13455 () Unit!13446)

(assert (=> b!188236 (= lt!292096 Unit!13455)))

(assert (=> b!188236 (invariant!0 (currentBit!9075 (_2!8767 lt!292118)) (currentByte!9080 (_2!8767 lt!292118)) (size!4343 (buf!4814 (_2!8767 lt!292118))))))

(declare-fun lt!292116 () Unit!13446)

(declare-fun Unit!13456 () Unit!13446)

(assert (=> b!188236 (= lt!292116 Unit!13456)))

(assert (=> b!188236 (= (size!4343 (buf!4814 (_2!8767 lt!291792))) (size!4343 (buf!4814 (_2!8767 lt!292118))))))

(declare-fun lt!292130 () Unit!13446)

(declare-fun Unit!13457 () Unit!13446)

(assert (=> b!188236 (= lt!292130 Unit!13457)))

(assert (=> b!188236 (= (bitIndex!0 (size!4343 (buf!4814 (_2!8767 lt!292118))) (currentByte!9080 (_2!8767 lt!292118)) (currentBit!9075 (_2!8767 lt!292118))) (bvsub (bvadd (bitIndex!0 (size!4343 (buf!4814 (_2!8767 lt!291792))) (currentByte!9080 (_2!8767 lt!291792)) (currentBit!9075 (_2!8767 lt!291792))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!292125 () Unit!13446)

(declare-fun Unit!13458 () Unit!13446)

(assert (=> b!188236 (= lt!292125 Unit!13458)))

(declare-fun lt!292100 () Unit!13446)

(declare-fun Unit!13459 () Unit!13446)

(assert (=> b!188236 (= lt!292100 Unit!13459)))

(assert (=> b!188236 (= lt!292103 (reader!0 (_2!8767 lt!291792) (_2!8767 lt!292118)))))

(declare-fun lt!292108 () (_ BitVec 64))

(assert (=> b!188236 (= lt!292108 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!292089 () Unit!13446)

(assert (=> b!188236 (= lt!292089 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8767 lt!291792) (buf!4814 (_2!8767 lt!292118)) lt!292108))))

(assert (=> b!188236 (validate_offset_bits!1 ((_ sign_extend 32) (size!4343 (buf!4814 (_2!8767 lt!292118)))) ((_ sign_extend 32) (currentByte!9080 (_2!8767 lt!291792))) ((_ sign_extend 32) (currentBit!9075 (_2!8767 lt!291792))) lt!292108)))

(declare-fun lt!292093 () Unit!13446)

(assert (=> b!188236 (= lt!292093 lt!292089)))

(assert (=> b!188236 (= lt!292081 (readNBitsLSBFirstsLoopPure!0 (_1!8766 lt!292103) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!156814 () Bool)

(assert (=> b!188236 (= res!156814 (= (_2!8765 lt!292081) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!188236 (=> (not res!156814) (not e!130067))))

(assert (=> b!188236 e!130067))

(declare-fun lt!292114 () Unit!13446)

(declare-fun Unit!13460 () Unit!13446)

(assert (=> b!188236 (= lt!292114 Unit!13460)))

(declare-fun b!188237 () Bool)

(declare-fun lt!292086 () tuple2!16246)

(assert (=> b!188237 (= lt!292086 (readBitPure!0 (readerFrom!0 (_2!8767 lt!292113) (currentBit!9075 (_2!8767 lt!291792)) (currentByte!9080 (_2!8767 lt!291792)))))))

(declare-fun res!156807 () Bool)

(assert (=> b!188237 (= res!156807 (and (= (_2!8768 lt!292086) lt!292111) (= (_1!8768 lt!292086) (_2!8767 lt!292113))))))

(declare-fun e!130069 () Bool)

(assert (=> b!188237 (=> (not res!156807) (not e!130069))))

(assert (=> b!188237 (= e!130074 e!130069)))

(declare-fun d!64909 () Bool)

(assert (=> d!64909 e!130068))

(declare-fun res!156815 () Bool)

(assert (=> d!64909 (=> (not res!156815) (not e!130068))))

(assert (=> d!64909 (= res!156815 (invariant!0 (currentBit!9075 (_2!8767 lt!292121)) (currentByte!9080 (_2!8767 lt!292121)) (size!4343 (buf!4814 (_2!8767 lt!292121)))))))

(assert (=> d!64909 (= lt!292121 e!130070)))

(declare-fun c!9595 () Bool)

(assert (=> d!64909 (= c!9595 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!64909 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!64909 (= (appendBitsLSBFirstLoopTR!0 (_2!8767 lt!291792) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!292121)))

(declare-fun bm!3020 () Bool)

(assert (=> bm!3020 (= call!3023 (isPrefixOf!0 (_2!8767 lt!291792) (ite c!9595 (_2!8767 lt!291792) (_2!8767 lt!292113))))))

(declare-fun b!188238 () Bool)

(assert (=> b!188238 (= e!130069 (= (bitIndex!0 (size!4343 (buf!4814 (_1!8768 lt!292086))) (currentByte!9080 (_1!8768 lt!292086)) (currentBit!9075 (_1!8768 lt!292086))) (bitIndex!0 (size!4343 (buf!4814 (_2!8767 lt!292113))) (currentByte!9080 (_2!8767 lt!292113)) (currentBit!9075 (_2!8767 lt!292113)))))))

(declare-fun b!188239 () Bool)

(assert (=> b!188239 (= e!130072 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!188240 () Bool)

(declare-fun res!156808 () Bool)

(assert (=> b!188240 (= res!156808 call!3023)))

(assert (=> b!188240 (=> (not res!156808) (not e!130074))))

(declare-fun b!188241 () Bool)

(assert (=> b!188241 (= e!130073 (= (_1!8765 lt!292092) (_2!8766 lt!292112)))))

(assert (= (and d!64909 c!9595) b!188230))

(assert (= (and d!64909 (not c!9595)) b!188236))

(assert (= (and b!188236 res!156811) b!188234))

(assert (= (and b!188234 res!156816) b!188240))

(assert (= (and b!188240 res!156808) b!188237))

(assert (= (and b!188237 res!156807) b!188238))

(assert (= (and b!188236 res!156806) b!188227))

(assert (= (and b!188236 c!9594) b!188239))

(assert (= (and b!188236 (not c!9594)) b!188229))

(assert (= (and b!188236 res!156814) b!188235))

(assert (= (or b!188230 b!188240) bm!3020))

(assert (= (and d!64909 res!156815) b!188231))

(assert (= (and b!188231 res!156809) b!188226))

(assert (= (and b!188226 res!156813) b!188228))

(assert (= (and b!188228 res!156817) b!188233))

(assert (= (and b!188233 res!156812) b!188232))

(assert (= (and b!188233 res!156810) b!188241))

(declare-fun m!292679 () Bool)

(assert (=> b!188226 m!292679))

(assert (=> b!188226 m!292507))

(declare-fun m!292681 () Bool)

(assert (=> b!188238 m!292681))

(declare-fun m!292683 () Bool)

(assert (=> b!188238 m!292683))

(declare-fun m!292685 () Bool)

(assert (=> b!188236 m!292685))

(declare-fun m!292687 () Bool)

(assert (=> b!188236 m!292687))

(declare-fun m!292689 () Bool)

(assert (=> b!188236 m!292689))

(declare-fun m!292691 () Bool)

(assert (=> b!188236 m!292691))

(declare-fun m!292693 () Bool)

(assert (=> b!188236 m!292693))

(declare-fun m!292695 () Bool)

(assert (=> b!188236 m!292695))

(declare-fun m!292697 () Bool)

(assert (=> b!188236 m!292697))

(declare-fun m!292699 () Bool)

(assert (=> b!188236 m!292699))

(declare-fun m!292701 () Bool)

(assert (=> b!188236 m!292701))

(declare-fun m!292703 () Bool)

(assert (=> b!188236 m!292703))

(declare-fun m!292705 () Bool)

(assert (=> b!188236 m!292705))

(assert (=> b!188236 m!292507))

(declare-fun m!292707 () Bool)

(assert (=> b!188236 m!292707))

(declare-fun m!292709 () Bool)

(assert (=> b!188236 m!292709))

(declare-fun m!292711 () Bool)

(assert (=> b!188236 m!292711))

(declare-fun m!292713 () Bool)

(assert (=> b!188236 m!292713))

(assert (=> b!188236 m!292685))

(declare-fun m!292715 () Bool)

(assert (=> b!188236 m!292715))

(declare-fun m!292717 () Bool)

(assert (=> b!188236 m!292717))

(declare-fun m!292719 () Bool)

(assert (=> b!188236 m!292719))

(declare-fun m!292721 () Bool)

(assert (=> b!188236 m!292721))

(declare-fun m!292723 () Bool)

(assert (=> b!188236 m!292723))

(declare-fun m!292725 () Bool)

(assert (=> b!188236 m!292725))

(declare-fun m!292727 () Bool)

(assert (=> b!188236 m!292727))

(declare-fun m!292729 () Bool)

(assert (=> b!188236 m!292729))

(declare-fun m!292731 () Bool)

(assert (=> b!188236 m!292731))

(declare-fun m!292733 () Bool)

(assert (=> b!188236 m!292733))

(declare-fun m!292735 () Bool)

(assert (=> b!188236 m!292735))

(declare-fun m!292737 () Bool)

(assert (=> b!188236 m!292737))

(declare-fun m!292739 () Bool)

(assert (=> b!188236 m!292739))

(declare-fun m!292741 () Bool)

(assert (=> b!188236 m!292741))

(declare-fun m!292743 () Bool)

(assert (=> b!188236 m!292743))

(declare-fun m!292745 () Bool)

(assert (=> b!188236 m!292745))

(declare-fun m!292747 () Bool)

(assert (=> b!188236 m!292747))

(declare-fun m!292749 () Bool)

(assert (=> b!188236 m!292749))

(assert (=> b!188234 m!292683))

(assert (=> b!188234 m!292507))

(declare-fun m!292751 () Bool)

(assert (=> b!188232 m!292751))

(declare-fun m!292753 () Bool)

(assert (=> b!188233 m!292753))

(declare-fun m!292755 () Bool)

(assert (=> b!188233 m!292755))

(declare-fun m!292757 () Bool)

(assert (=> b!188233 m!292757))

(declare-fun m!292759 () Bool)

(assert (=> b!188233 m!292759))

(assert (=> b!188233 m!292739))

(assert (=> b!188233 m!292703))

(declare-fun m!292761 () Bool)

(assert (=> d!64909 m!292761))

(declare-fun m!292763 () Bool)

(assert (=> b!188237 m!292763))

(assert (=> b!188237 m!292763))

(declare-fun m!292765 () Bool)

(assert (=> b!188237 m!292765))

(declare-fun m!292767 () Bool)

(assert (=> b!188230 m!292767))

(declare-fun m!292769 () Bool)

(assert (=> bm!3020 m!292769))

(declare-fun m!292771 () Bool)

(assert (=> b!188228 m!292771))

(assert (=> b!188076 d!64909))

(declare-fun d!64933 () Bool)

(assert (=> d!64933 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9075 thiss!1204) (currentByte!9080 thiss!1204) (size!4343 (buf!4814 thiss!1204))))))

(declare-fun bs!16134 () Bool)

(assert (= bs!16134 d!64933))

(assert (=> bs!16134 m!292571))

(assert (=> start!40858 d!64933))

(declare-fun d!64935 () Bool)

(declare-datatypes ((tuple2!16256 0))(
  ( (tuple2!16257 (_1!8773 Bool) (_2!8773 BitStream!7794)) )
))
(declare-fun lt!292138 () tuple2!16256)

(declare-fun readBit!0 (BitStream!7794) tuple2!16256)

(assert (=> d!64935 (= lt!292138 (readBit!0 (BitStream!7795 (buf!4814 (_2!8767 lt!291784)) (currentByte!9080 thiss!1204) (currentBit!9075 thiss!1204))))))

(assert (=> d!64935 (= (readBitPure!0 (BitStream!7795 (buf!4814 (_2!8767 lt!291784)) (currentByte!9080 thiss!1204) (currentBit!9075 thiss!1204))) (tuple2!16247 (_2!8773 lt!292138) (_1!8773 lt!292138)))))

(declare-fun bs!16135 () Bool)

(assert (= bs!16135 d!64935))

(declare-fun m!292773 () Bool)

(assert (=> bs!16135 m!292773))

(assert (=> b!188057 d!64935))

(declare-fun d!64937 () Bool)

(declare-fun e!130076 () Bool)

(assert (=> d!64937 e!130076))

(declare-fun res!156818 () Bool)

(assert (=> d!64937 (=> (not res!156818) (not e!130076))))

(declare-fun lt!292139 () (_ BitVec 64))

(declare-fun lt!292142 () (_ BitVec 64))

(declare-fun lt!292141 () (_ BitVec 64))

(assert (=> d!64937 (= res!156818 (= lt!292139 (bvsub lt!292142 lt!292141)))))

(assert (=> d!64937 (or (= (bvand lt!292142 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!292141 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!292142 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!292142 lt!292141) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64937 (= lt!292141 (remainingBits!0 ((_ sign_extend 32) (size!4343 (buf!4814 (_1!8768 lt!291787)))) ((_ sign_extend 32) (currentByte!9080 (_1!8768 lt!291787))) ((_ sign_extend 32) (currentBit!9075 (_1!8768 lt!291787)))))))

(declare-fun lt!292143 () (_ BitVec 64))

(declare-fun lt!292144 () (_ BitVec 64))

(assert (=> d!64937 (= lt!292142 (bvmul lt!292143 lt!292144))))

(assert (=> d!64937 (or (= lt!292143 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!292144 (bvsdiv (bvmul lt!292143 lt!292144) lt!292143)))))

(assert (=> d!64937 (= lt!292144 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64937 (= lt!292143 ((_ sign_extend 32) (size!4343 (buf!4814 (_1!8768 lt!291787)))))))

(assert (=> d!64937 (= lt!292139 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9080 (_1!8768 lt!291787))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9075 (_1!8768 lt!291787)))))))

(assert (=> d!64937 (invariant!0 (currentBit!9075 (_1!8768 lt!291787)) (currentByte!9080 (_1!8768 lt!291787)) (size!4343 (buf!4814 (_1!8768 lt!291787))))))

(assert (=> d!64937 (= (bitIndex!0 (size!4343 (buf!4814 (_1!8768 lt!291787))) (currentByte!9080 (_1!8768 lt!291787)) (currentBit!9075 (_1!8768 lt!291787))) lt!292139)))

(declare-fun b!188242 () Bool)

(declare-fun res!156819 () Bool)

(assert (=> b!188242 (=> (not res!156819) (not e!130076))))

(assert (=> b!188242 (= res!156819 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!292139))))

(declare-fun b!188243 () Bool)

(declare-fun lt!292140 () (_ BitVec 64))

(assert (=> b!188243 (= e!130076 (bvsle lt!292139 (bvmul lt!292140 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!188243 (or (= lt!292140 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!292140 #b0000000000000000000000000000000000000000000000000000000000001000) lt!292140)))))

(assert (=> b!188243 (= lt!292140 ((_ sign_extend 32) (size!4343 (buf!4814 (_1!8768 lt!291787)))))))

(assert (= (and d!64937 res!156818) b!188242))

(assert (= (and b!188242 res!156819) b!188243))

(declare-fun m!292775 () Bool)

(assert (=> d!64937 m!292775))

(declare-fun m!292777 () Bool)

(assert (=> d!64937 m!292777))

(assert (=> b!188057 d!64937))

(declare-fun d!64939 () Bool)

(assert (=> d!64939 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!188057 d!64939))

(declare-fun d!64941 () Bool)

(declare-fun lt!292145 () tuple2!16256)

(assert (=> d!64941 (= lt!292145 (readBit!0 (_1!8766 lt!291786)))))

(assert (=> d!64941 (= (readBitPure!0 (_1!8766 lt!291786)) (tuple2!16247 (_2!8773 lt!292145) (_1!8773 lt!292145)))))

(declare-fun bs!16136 () Bool)

(assert (= bs!16136 d!64941))

(declare-fun m!292779 () Bool)

(assert (=> bs!16136 m!292779))

(assert (=> b!188057 d!64941))

(declare-fun d!64943 () Bool)

(assert (=> d!64943 (validate_offset_bits!1 ((_ sign_extend 32) (size!4343 (buf!4814 (_2!8767 lt!291784)))) ((_ sign_extend 32) (currentByte!9080 thiss!1204)) ((_ sign_extend 32) (currentBit!9075 thiss!1204)) lt!291799)))

(declare-fun lt!292148 () Unit!13446)

(declare-fun choose!9 (BitStream!7794 array!9853 (_ BitVec 64) BitStream!7794) Unit!13446)

(assert (=> d!64943 (= lt!292148 (choose!9 thiss!1204 (buf!4814 (_2!8767 lt!291784)) lt!291799 (BitStream!7795 (buf!4814 (_2!8767 lt!291784)) (currentByte!9080 thiss!1204) (currentBit!9075 thiss!1204))))))

(assert (=> d!64943 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4814 (_2!8767 lt!291784)) lt!291799) lt!292148)))

(declare-fun bs!16137 () Bool)

(assert (= bs!16137 d!64943))

(assert (=> bs!16137 m!292563))

(declare-fun m!292781 () Bool)

(assert (=> bs!16137 m!292781))

(assert (=> b!188057 d!64943))

(declare-fun d!64945 () Bool)

(assert (=> d!64945 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4343 (buf!4814 (_2!8767 lt!291784)))) ((_ sign_extend 32) (currentByte!9080 (_2!8767 lt!291792))) ((_ sign_extend 32) (currentBit!9075 (_2!8767 lt!291792))) lt!291795) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4343 (buf!4814 (_2!8767 lt!291784)))) ((_ sign_extend 32) (currentByte!9080 (_2!8767 lt!291792))) ((_ sign_extend 32) (currentBit!9075 (_2!8767 lt!291792)))) lt!291795))))

(declare-fun bs!16138 () Bool)

(assert (= bs!16138 d!64945))

(declare-fun m!292783 () Bool)

(assert (=> bs!16138 m!292783))

(assert (=> b!188057 d!64945))

(declare-fun d!64947 () Bool)

(assert (=> d!64947 (validate_offset_bits!1 ((_ sign_extend 32) (size!4343 (buf!4814 (_2!8767 lt!291784)))) ((_ sign_extend 32) (currentByte!9080 (_2!8767 lt!291792))) ((_ sign_extend 32) (currentBit!9075 (_2!8767 lt!291792))) lt!291795)))

(declare-fun lt!292149 () Unit!13446)

(assert (=> d!64947 (= lt!292149 (choose!9 (_2!8767 lt!291792) (buf!4814 (_2!8767 lt!291784)) lt!291795 (BitStream!7795 (buf!4814 (_2!8767 lt!291784)) (currentByte!9080 (_2!8767 lt!291792)) (currentBit!9075 (_2!8767 lt!291792)))))))

(assert (=> d!64947 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8767 lt!291792) (buf!4814 (_2!8767 lt!291784)) lt!291795) lt!292149)))

(declare-fun bs!16139 () Bool)

(assert (= bs!16139 d!64947))

(assert (=> bs!16139 m!292539))

(declare-fun m!292785 () Bool)

(assert (=> bs!16139 m!292785))

(assert (=> b!188057 d!64947))

(declare-fun d!64949 () Bool)

(declare-fun e!130079 () Bool)

(assert (=> d!64949 e!130079))

(declare-fun res!156822 () Bool)

(assert (=> d!64949 (=> (not res!156822) (not e!130079))))

(declare-fun lt!292161 () tuple2!16246)

(declare-fun lt!292158 () tuple2!16246)

(assert (=> d!64949 (= res!156822 (= (bitIndex!0 (size!4343 (buf!4814 (_1!8768 lt!292161))) (currentByte!9080 (_1!8768 lt!292161)) (currentBit!9075 (_1!8768 lt!292161))) (bitIndex!0 (size!4343 (buf!4814 (_1!8768 lt!292158))) (currentByte!9080 (_1!8768 lt!292158)) (currentBit!9075 (_1!8768 lt!292158)))))))

(declare-fun lt!292159 () Unit!13446)

(declare-fun lt!292160 () BitStream!7794)

(declare-fun choose!50 (BitStream!7794 BitStream!7794 BitStream!7794 tuple2!16246 tuple2!16246 BitStream!7794 Bool tuple2!16246 tuple2!16246 BitStream!7794 Bool) Unit!13446)

(assert (=> d!64949 (= lt!292159 (choose!50 lt!291782 (_2!8767 lt!291784) lt!292160 lt!292161 (tuple2!16247 (_1!8768 lt!292161) (_2!8768 lt!292161)) (_1!8768 lt!292161) (_2!8768 lt!292161) lt!292158 (tuple2!16247 (_1!8768 lt!292158) (_2!8768 lt!292158)) (_1!8768 lt!292158) (_2!8768 lt!292158)))))

(assert (=> d!64949 (= lt!292158 (readBitPure!0 lt!292160))))

(assert (=> d!64949 (= lt!292161 (readBitPure!0 lt!291782))))

(assert (=> d!64949 (= lt!292160 (BitStream!7795 (buf!4814 (_2!8767 lt!291784)) (currentByte!9080 lt!291782) (currentBit!9075 lt!291782)))))

(assert (=> d!64949 (invariant!0 (currentBit!9075 lt!291782) (currentByte!9080 lt!291782) (size!4343 (buf!4814 (_2!8767 lt!291784))))))

(assert (=> d!64949 (= (readBitPrefixLemma!0 lt!291782 (_2!8767 lt!291784)) lt!292159)))

(declare-fun b!188246 () Bool)

(assert (=> b!188246 (= e!130079 (= (_2!8768 lt!292161) (_2!8768 lt!292158)))))

(assert (= (and d!64949 res!156822) b!188246))

(declare-fun m!292787 () Bool)

(assert (=> d!64949 m!292787))

(declare-fun m!292789 () Bool)

(assert (=> d!64949 m!292789))

(declare-fun m!292791 () Bool)

(assert (=> d!64949 m!292791))

(assert (=> d!64949 m!292545))

(declare-fun m!292793 () Bool)

(assert (=> d!64949 m!292793))

(declare-fun m!292795 () Bool)

(assert (=> d!64949 m!292795))

(assert (=> b!188057 d!64949))

(declare-fun d!64951 () Bool)

(declare-datatypes ((tuple2!16258 0))(
  ( (tuple2!16259 (_1!8774 (_ BitVec 64)) (_2!8774 BitStream!7794)) )
))
(declare-fun lt!292164 () tuple2!16258)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!7794 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16258)

(assert (=> d!64951 (= lt!292164 (readNBitsLSBFirstsLoop!0 (_1!8766 lt!291786) nBits!348 i!590 lt!291785))))

(assert (=> d!64951 (= (readNBitsLSBFirstsLoopPure!0 (_1!8766 lt!291786) nBits!348 i!590 lt!291785) (tuple2!16241 (_2!8774 lt!292164) (_1!8774 lt!292164)))))

(declare-fun bs!16140 () Bool)

(assert (= bs!16140 d!64951))

(declare-fun m!292797 () Bool)

(assert (=> bs!16140 m!292797))

(assert (=> b!188057 d!64951))

(declare-fun lt!292165 () tuple2!16258)

(declare-fun d!64953 () Bool)

(assert (=> d!64953 (= lt!292165 (readNBitsLSBFirstsLoop!0 (_1!8766 lt!291802) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!291805))))

(assert (=> d!64953 (= (readNBitsLSBFirstsLoopPure!0 (_1!8766 lt!291802) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!291805) (tuple2!16241 (_2!8774 lt!292165) (_1!8774 lt!292165)))))

(declare-fun bs!16141 () Bool)

(assert (= bs!16141 d!64953))

(declare-fun m!292799 () Bool)

(assert (=> bs!16141 m!292799))

(assert (=> b!188057 d!64953))

(declare-fun d!64955 () Bool)

(declare-fun lt!292166 () tuple2!16256)

(assert (=> d!64955 (= lt!292166 (readBit!0 lt!291782))))

(assert (=> d!64955 (= (readBitPure!0 lt!291782) (tuple2!16247 (_2!8773 lt!292166) (_1!8773 lt!292166)))))

(declare-fun bs!16142 () Bool)

(assert (= bs!16142 d!64955))

(declare-fun m!292801 () Bool)

(assert (=> bs!16142 m!292801))

(assert (=> b!188057 d!64955))

(declare-fun b!188257 () Bool)

(declare-fun e!130084 () Unit!13446)

(declare-fun lt!292220 () Unit!13446)

(assert (=> b!188257 (= e!130084 lt!292220)))

(declare-fun lt!292225 () (_ BitVec 64))

(assert (=> b!188257 (= lt!292225 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!292221 () (_ BitVec 64))

(assert (=> b!188257 (= lt!292221 (bitIndex!0 (size!4343 (buf!4814 thiss!1204)) (currentByte!9080 thiss!1204) (currentBit!9075 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9853 array!9853 (_ BitVec 64) (_ BitVec 64)) Unit!13446)

(assert (=> b!188257 (= lt!292220 (arrayBitRangesEqSymmetric!0 (buf!4814 thiss!1204) (buf!4814 (_2!8767 lt!291784)) lt!292225 lt!292221))))

(assert (=> b!188257 (arrayBitRangesEq!0 (buf!4814 (_2!8767 lt!291784)) (buf!4814 thiss!1204) lt!292225 lt!292221)))

(declare-fun b!188258 () Bool)

(declare-fun res!156830 () Bool)

(declare-fun e!130085 () Bool)

(assert (=> b!188258 (=> (not res!156830) (not e!130085))))

(declare-fun lt!292218 () tuple2!16242)

(assert (=> b!188258 (= res!156830 (isPrefixOf!0 (_2!8766 lt!292218) (_2!8767 lt!291784)))))

(declare-fun d!64957 () Bool)

(assert (=> d!64957 e!130085))

(declare-fun res!156829 () Bool)

(assert (=> d!64957 (=> (not res!156829) (not e!130085))))

(assert (=> d!64957 (= res!156829 (isPrefixOf!0 (_1!8766 lt!292218) (_2!8766 lt!292218)))))

(declare-fun lt!292213 () BitStream!7794)

(assert (=> d!64957 (= lt!292218 (tuple2!16243 lt!292213 (_2!8767 lt!291784)))))

(declare-fun lt!292224 () Unit!13446)

(declare-fun lt!292219 () Unit!13446)

(assert (=> d!64957 (= lt!292224 lt!292219)))

(assert (=> d!64957 (isPrefixOf!0 lt!292213 (_2!8767 lt!291784))))

(assert (=> d!64957 (= lt!292219 (lemmaIsPrefixTransitive!0 lt!292213 (_2!8767 lt!291784) (_2!8767 lt!291784)))))

(declare-fun lt!292210 () Unit!13446)

(declare-fun lt!292208 () Unit!13446)

(assert (=> d!64957 (= lt!292210 lt!292208)))

(assert (=> d!64957 (isPrefixOf!0 lt!292213 (_2!8767 lt!291784))))

(assert (=> d!64957 (= lt!292208 (lemmaIsPrefixTransitive!0 lt!292213 thiss!1204 (_2!8767 lt!291784)))))

(declare-fun lt!292207 () Unit!13446)

(assert (=> d!64957 (= lt!292207 e!130084)))

(declare-fun c!9598 () Bool)

(assert (=> d!64957 (= c!9598 (not (= (size!4343 (buf!4814 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!292209 () Unit!13446)

(declare-fun lt!292215 () Unit!13446)

(assert (=> d!64957 (= lt!292209 lt!292215)))

(assert (=> d!64957 (isPrefixOf!0 (_2!8767 lt!291784) (_2!8767 lt!291784))))

(assert (=> d!64957 (= lt!292215 (lemmaIsPrefixRefl!0 (_2!8767 lt!291784)))))

(declare-fun lt!292217 () Unit!13446)

(declare-fun lt!292214 () Unit!13446)

(assert (=> d!64957 (= lt!292217 lt!292214)))

(assert (=> d!64957 (= lt!292214 (lemmaIsPrefixRefl!0 (_2!8767 lt!291784)))))

(declare-fun lt!292226 () Unit!13446)

(declare-fun lt!292222 () Unit!13446)

(assert (=> d!64957 (= lt!292226 lt!292222)))

(assert (=> d!64957 (isPrefixOf!0 lt!292213 lt!292213)))

(assert (=> d!64957 (= lt!292222 (lemmaIsPrefixRefl!0 lt!292213))))

(declare-fun lt!292212 () Unit!13446)

(declare-fun lt!292211 () Unit!13446)

(assert (=> d!64957 (= lt!292212 lt!292211)))

(assert (=> d!64957 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!64957 (= lt!292211 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!64957 (= lt!292213 (BitStream!7795 (buf!4814 (_2!8767 lt!291784)) (currentByte!9080 thiss!1204) (currentBit!9075 thiss!1204)))))

(assert (=> d!64957 (isPrefixOf!0 thiss!1204 (_2!8767 lt!291784))))

(assert (=> d!64957 (= (reader!0 thiss!1204 (_2!8767 lt!291784)) lt!292218)))

(declare-fun b!188259 () Bool)

(declare-fun res!156831 () Bool)

(assert (=> b!188259 (=> (not res!156831) (not e!130085))))

(assert (=> b!188259 (= res!156831 (isPrefixOf!0 (_1!8766 lt!292218) thiss!1204))))

(declare-fun b!188260 () Bool)

(declare-fun Unit!13461 () Unit!13446)

(assert (=> b!188260 (= e!130084 Unit!13461)))

(declare-fun lt!292223 () (_ BitVec 64))

(declare-fun lt!292216 () (_ BitVec 64))

(declare-fun b!188261 () Bool)

(assert (=> b!188261 (= e!130085 (= (_1!8766 lt!292218) (withMovedBitIndex!0 (_2!8766 lt!292218) (bvsub lt!292216 lt!292223))))))

(assert (=> b!188261 (or (= (bvand lt!292216 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!292223 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!292216 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!292216 lt!292223) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!188261 (= lt!292223 (bitIndex!0 (size!4343 (buf!4814 (_2!8767 lt!291784))) (currentByte!9080 (_2!8767 lt!291784)) (currentBit!9075 (_2!8767 lt!291784))))))

(assert (=> b!188261 (= lt!292216 (bitIndex!0 (size!4343 (buf!4814 thiss!1204)) (currentByte!9080 thiss!1204) (currentBit!9075 thiss!1204)))))

(assert (= (and d!64957 c!9598) b!188257))

(assert (= (and d!64957 (not c!9598)) b!188260))

(assert (= (and d!64957 res!156829) b!188259))

(assert (= (and b!188259 res!156831) b!188258))

(assert (= (and b!188258 res!156830) b!188261))

(declare-fun m!292803 () Bool)

(assert (=> b!188259 m!292803))

(declare-fun m!292805 () Bool)

(assert (=> b!188258 m!292805))

(assert (=> b!188257 m!292509))

(declare-fun m!292807 () Bool)

(assert (=> b!188257 m!292807))

(declare-fun m!292809 () Bool)

(assert (=> b!188257 m!292809))

(declare-fun m!292811 () Bool)

(assert (=> b!188261 m!292811))

(assert (=> b!188261 m!292529))

(assert (=> b!188261 m!292509))

(declare-fun m!292813 () Bool)

(assert (=> d!64957 m!292813))

(declare-fun m!292815 () Bool)

(assert (=> d!64957 m!292815))

(declare-fun m!292817 () Bool)

(assert (=> d!64957 m!292817))

(declare-fun m!292819 () Bool)

(assert (=> d!64957 m!292819))

(declare-fun m!292821 () Bool)

(assert (=> d!64957 m!292821))

(declare-fun m!292823 () Bool)

(assert (=> d!64957 m!292823))

(declare-fun m!292825 () Bool)

(assert (=> d!64957 m!292825))

(declare-fun m!292827 () Bool)

(assert (=> d!64957 m!292827))

(declare-fun m!292829 () Bool)

(assert (=> d!64957 m!292829))

(declare-fun m!292831 () Bool)

(assert (=> d!64957 m!292831))

(assert (=> d!64957 m!292531))

(assert (=> b!188057 d!64957))

(declare-fun b!188262 () Bool)

(declare-fun e!130086 () Unit!13446)

(declare-fun lt!292240 () Unit!13446)

(assert (=> b!188262 (= e!130086 lt!292240)))

(declare-fun lt!292245 () (_ BitVec 64))

(assert (=> b!188262 (= lt!292245 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!292241 () (_ BitVec 64))

(assert (=> b!188262 (= lt!292241 (bitIndex!0 (size!4343 (buf!4814 (_2!8767 lt!291792))) (currentByte!9080 (_2!8767 lt!291792)) (currentBit!9075 (_2!8767 lt!291792))))))

(assert (=> b!188262 (= lt!292240 (arrayBitRangesEqSymmetric!0 (buf!4814 (_2!8767 lt!291792)) (buf!4814 (_2!8767 lt!291784)) lt!292245 lt!292241))))

(assert (=> b!188262 (arrayBitRangesEq!0 (buf!4814 (_2!8767 lt!291784)) (buf!4814 (_2!8767 lt!291792)) lt!292245 lt!292241)))

(declare-fun b!188263 () Bool)

(declare-fun res!156833 () Bool)

(declare-fun e!130087 () Bool)

(assert (=> b!188263 (=> (not res!156833) (not e!130087))))

(declare-fun lt!292238 () tuple2!16242)

(assert (=> b!188263 (= res!156833 (isPrefixOf!0 (_2!8766 lt!292238) (_2!8767 lt!291784)))))

(declare-fun d!64959 () Bool)

(assert (=> d!64959 e!130087))

(declare-fun res!156832 () Bool)

(assert (=> d!64959 (=> (not res!156832) (not e!130087))))

(assert (=> d!64959 (= res!156832 (isPrefixOf!0 (_1!8766 lt!292238) (_2!8766 lt!292238)))))

(declare-fun lt!292233 () BitStream!7794)

(assert (=> d!64959 (= lt!292238 (tuple2!16243 lt!292233 (_2!8767 lt!291784)))))

(declare-fun lt!292244 () Unit!13446)

(declare-fun lt!292239 () Unit!13446)

(assert (=> d!64959 (= lt!292244 lt!292239)))

(assert (=> d!64959 (isPrefixOf!0 lt!292233 (_2!8767 lt!291784))))

(assert (=> d!64959 (= lt!292239 (lemmaIsPrefixTransitive!0 lt!292233 (_2!8767 lt!291784) (_2!8767 lt!291784)))))

(declare-fun lt!292230 () Unit!13446)

(declare-fun lt!292228 () Unit!13446)

(assert (=> d!64959 (= lt!292230 lt!292228)))

(assert (=> d!64959 (isPrefixOf!0 lt!292233 (_2!8767 lt!291784))))

(assert (=> d!64959 (= lt!292228 (lemmaIsPrefixTransitive!0 lt!292233 (_2!8767 lt!291792) (_2!8767 lt!291784)))))

(declare-fun lt!292227 () Unit!13446)

(assert (=> d!64959 (= lt!292227 e!130086)))

(declare-fun c!9599 () Bool)

(assert (=> d!64959 (= c!9599 (not (= (size!4343 (buf!4814 (_2!8767 lt!291792))) #b00000000000000000000000000000000)))))

(declare-fun lt!292229 () Unit!13446)

(declare-fun lt!292235 () Unit!13446)

(assert (=> d!64959 (= lt!292229 lt!292235)))

(assert (=> d!64959 (isPrefixOf!0 (_2!8767 lt!291784) (_2!8767 lt!291784))))

(assert (=> d!64959 (= lt!292235 (lemmaIsPrefixRefl!0 (_2!8767 lt!291784)))))

(declare-fun lt!292237 () Unit!13446)

(declare-fun lt!292234 () Unit!13446)

(assert (=> d!64959 (= lt!292237 lt!292234)))

(assert (=> d!64959 (= lt!292234 (lemmaIsPrefixRefl!0 (_2!8767 lt!291784)))))

(declare-fun lt!292246 () Unit!13446)

(declare-fun lt!292242 () Unit!13446)

(assert (=> d!64959 (= lt!292246 lt!292242)))

(assert (=> d!64959 (isPrefixOf!0 lt!292233 lt!292233)))

(assert (=> d!64959 (= lt!292242 (lemmaIsPrefixRefl!0 lt!292233))))

(declare-fun lt!292232 () Unit!13446)

(declare-fun lt!292231 () Unit!13446)

(assert (=> d!64959 (= lt!292232 lt!292231)))

(assert (=> d!64959 (isPrefixOf!0 (_2!8767 lt!291792) (_2!8767 lt!291792))))

(assert (=> d!64959 (= lt!292231 (lemmaIsPrefixRefl!0 (_2!8767 lt!291792)))))

(assert (=> d!64959 (= lt!292233 (BitStream!7795 (buf!4814 (_2!8767 lt!291784)) (currentByte!9080 (_2!8767 lt!291792)) (currentBit!9075 (_2!8767 lt!291792))))))

(assert (=> d!64959 (isPrefixOf!0 (_2!8767 lt!291792) (_2!8767 lt!291784))))

(assert (=> d!64959 (= (reader!0 (_2!8767 lt!291792) (_2!8767 lt!291784)) lt!292238)))

(declare-fun b!188264 () Bool)

(declare-fun res!156834 () Bool)

(assert (=> b!188264 (=> (not res!156834) (not e!130087))))

(assert (=> b!188264 (= res!156834 (isPrefixOf!0 (_1!8766 lt!292238) (_2!8767 lt!291792)))))

(declare-fun b!188265 () Bool)

(declare-fun Unit!13462 () Unit!13446)

(assert (=> b!188265 (= e!130086 Unit!13462)))

(declare-fun lt!292243 () (_ BitVec 64))

(declare-fun b!188266 () Bool)

(declare-fun lt!292236 () (_ BitVec 64))

(assert (=> b!188266 (= e!130087 (= (_1!8766 lt!292238) (withMovedBitIndex!0 (_2!8766 lt!292238) (bvsub lt!292236 lt!292243))))))

(assert (=> b!188266 (or (= (bvand lt!292236 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!292243 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!292236 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!292236 lt!292243) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!188266 (= lt!292243 (bitIndex!0 (size!4343 (buf!4814 (_2!8767 lt!291784))) (currentByte!9080 (_2!8767 lt!291784)) (currentBit!9075 (_2!8767 lt!291784))))))

(assert (=> b!188266 (= lt!292236 (bitIndex!0 (size!4343 (buf!4814 (_2!8767 lt!291792))) (currentByte!9080 (_2!8767 lt!291792)) (currentBit!9075 (_2!8767 lt!291792))))))

(assert (= (and d!64959 c!9599) b!188262))

(assert (= (and d!64959 (not c!9599)) b!188265))

(assert (= (and d!64959 res!156832) b!188264))

(assert (= (and b!188264 res!156834) b!188263))

(assert (= (and b!188263 res!156833) b!188266))

(declare-fun m!292833 () Bool)

(assert (=> b!188264 m!292833))

(declare-fun m!292835 () Bool)

(assert (=> b!188263 m!292835))

(assert (=> b!188262 m!292507))

(declare-fun m!292837 () Bool)

(assert (=> b!188262 m!292837))

(declare-fun m!292839 () Bool)

(assert (=> b!188262 m!292839))

(declare-fun m!292841 () Bool)

(assert (=> b!188266 m!292841))

(assert (=> b!188266 m!292529))

(assert (=> b!188266 m!292507))

(declare-fun m!292843 () Bool)

(assert (=> d!64959 m!292843))

(assert (=> d!64959 m!292815))

(assert (=> d!64959 m!292767))

(declare-fun m!292845 () Bool)

(assert (=> d!64959 m!292845))

(declare-fun m!292847 () Bool)

(assert (=> d!64959 m!292847))

(declare-fun m!292849 () Bool)

(assert (=> d!64959 m!292849))

(declare-fun m!292851 () Bool)

(assert (=> d!64959 m!292851))

(declare-fun m!292853 () Bool)

(assert (=> d!64959 m!292853))

(assert (=> d!64959 m!292829))

(declare-fun m!292855 () Bool)

(assert (=> d!64959 m!292855))

(assert (=> d!64959 m!292503))

(assert (=> b!188057 d!64959))

(declare-fun d!64961 () Bool)

(assert (=> d!64961 (= (invariant!0 (currentBit!9075 thiss!1204) (currentByte!9080 thiss!1204) (size!4343 (buf!4814 (_2!8767 lt!291792)))) (and (bvsge (currentBit!9075 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9075 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9080 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9080 thiss!1204) (size!4343 (buf!4814 (_2!8767 lt!291792)))) (and (= (currentBit!9075 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9080 thiss!1204) (size!4343 (buf!4814 (_2!8767 lt!291792))))))))))

(assert (=> b!188057 d!64961))

(declare-fun d!64963 () Bool)

(assert (=> d!64963 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4343 (buf!4814 (_2!8767 lt!291784)))) ((_ sign_extend 32) (currentByte!9080 thiss!1204)) ((_ sign_extend 32) (currentBit!9075 thiss!1204)) lt!291799) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4343 (buf!4814 (_2!8767 lt!291784)))) ((_ sign_extend 32) (currentByte!9080 thiss!1204)) ((_ sign_extend 32) (currentBit!9075 thiss!1204))) lt!291799))))

(declare-fun bs!16143 () Bool)

(assert (= bs!16143 d!64963))

(declare-fun m!292857 () Bool)

(assert (=> bs!16143 m!292857))

(assert (=> b!188057 d!64963))

(declare-fun d!64965 () Bool)

(declare-fun e!130088 () Bool)

(assert (=> d!64965 e!130088))

(declare-fun res!156835 () Bool)

(assert (=> d!64965 (=> (not res!156835) (not e!130088))))

(declare-fun lt!292249 () (_ BitVec 64))

(declare-fun lt!292247 () (_ BitVec 64))

(declare-fun lt!292250 () (_ BitVec 64))

(assert (=> d!64965 (= res!156835 (= lt!292247 (bvsub lt!292250 lt!292249)))))

(assert (=> d!64965 (or (= (bvand lt!292250 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!292249 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!292250 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!292250 lt!292249) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64965 (= lt!292249 (remainingBits!0 ((_ sign_extend 32) (size!4343 (buf!4814 (_1!8768 lt!291791)))) ((_ sign_extend 32) (currentByte!9080 (_1!8768 lt!291791))) ((_ sign_extend 32) (currentBit!9075 (_1!8768 lt!291791)))))))

(declare-fun lt!292251 () (_ BitVec 64))

(declare-fun lt!292252 () (_ BitVec 64))

(assert (=> d!64965 (= lt!292250 (bvmul lt!292251 lt!292252))))

(assert (=> d!64965 (or (= lt!292251 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!292252 (bvsdiv (bvmul lt!292251 lt!292252) lt!292251)))))

(assert (=> d!64965 (= lt!292252 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64965 (= lt!292251 ((_ sign_extend 32) (size!4343 (buf!4814 (_1!8768 lt!291791)))))))

(assert (=> d!64965 (= lt!292247 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9080 (_1!8768 lt!291791))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9075 (_1!8768 lt!291791)))))))

(assert (=> d!64965 (invariant!0 (currentBit!9075 (_1!8768 lt!291791)) (currentByte!9080 (_1!8768 lt!291791)) (size!4343 (buf!4814 (_1!8768 lt!291791))))))

(assert (=> d!64965 (= (bitIndex!0 (size!4343 (buf!4814 (_1!8768 lt!291791))) (currentByte!9080 (_1!8768 lt!291791)) (currentBit!9075 (_1!8768 lt!291791))) lt!292247)))

(declare-fun b!188267 () Bool)

(declare-fun res!156836 () Bool)

(assert (=> b!188267 (=> (not res!156836) (not e!130088))))

(assert (=> b!188267 (= res!156836 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!292247))))

(declare-fun b!188268 () Bool)

(declare-fun lt!292248 () (_ BitVec 64))

(assert (=> b!188268 (= e!130088 (bvsle lt!292247 (bvmul lt!292248 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!188268 (or (= lt!292248 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!292248 #b0000000000000000000000000000000000000000000000000000000000001000) lt!292248)))))

(assert (=> b!188268 (= lt!292248 ((_ sign_extend 32) (size!4343 (buf!4814 (_1!8768 lt!291791)))))))

(assert (= (and d!64965 res!156835) b!188267))

(assert (= (and b!188267 res!156836) b!188268))

(declare-fun m!292859 () Bool)

(assert (=> d!64965 m!292859))

(declare-fun m!292861 () Bool)

(assert (=> d!64965 m!292861))

(assert (=> b!188057 d!64965))

(declare-fun d!64967 () Bool)

(declare-fun lt!292253 () tuple2!16256)

(assert (=> d!64967 (= lt!292253 (readBit!0 (readerFrom!0 (_2!8767 lt!291792) (currentBit!9075 thiss!1204) (currentByte!9080 thiss!1204))))))

(assert (=> d!64967 (= (readBitPure!0 (readerFrom!0 (_2!8767 lt!291792) (currentBit!9075 thiss!1204) (currentByte!9080 thiss!1204))) (tuple2!16247 (_2!8773 lt!292253) (_1!8773 lt!292253)))))

(declare-fun bs!16144 () Bool)

(assert (= bs!16144 d!64967))

(assert (=> bs!16144 m!292519))

(declare-fun m!292863 () Bool)

(assert (=> bs!16144 m!292863))

(assert (=> b!188078 d!64967))

(declare-fun d!64969 () Bool)

(declare-fun e!130091 () Bool)

(assert (=> d!64969 e!130091))

(declare-fun res!156840 () Bool)

(assert (=> d!64969 (=> (not res!156840) (not e!130091))))

(assert (=> d!64969 (= res!156840 (invariant!0 (currentBit!9075 (_2!8767 lt!291792)) (currentByte!9080 (_2!8767 lt!291792)) (size!4343 (buf!4814 (_2!8767 lt!291792)))))))

(assert (=> d!64969 (= (readerFrom!0 (_2!8767 lt!291792) (currentBit!9075 thiss!1204) (currentByte!9080 thiss!1204)) (BitStream!7795 (buf!4814 (_2!8767 lt!291792)) (currentByte!9080 thiss!1204) (currentBit!9075 thiss!1204)))))

(declare-fun b!188271 () Bool)

(assert (=> b!188271 (= e!130091 (invariant!0 (currentBit!9075 thiss!1204) (currentByte!9080 thiss!1204) (size!4343 (buf!4814 (_2!8767 lt!291792)))))))

(assert (= (and d!64969 res!156840) b!188271))

(assert (=> d!64969 m!292657))

(assert (=> b!188271 m!292557))

(assert (=> b!188078 d!64969))

(declare-fun d!64971 () Bool)

(declare-fun res!156842 () Bool)

(declare-fun e!130092 () Bool)

(assert (=> d!64971 (=> (not res!156842) (not e!130092))))

(assert (=> d!64971 (= res!156842 (= (size!4343 (buf!4814 (_2!8767 lt!291792))) (size!4343 (buf!4814 (_2!8767 lt!291784)))))))

(assert (=> d!64971 (= (isPrefixOf!0 (_2!8767 lt!291792) (_2!8767 lt!291784)) e!130092)))

(declare-fun b!188272 () Bool)

(declare-fun res!156843 () Bool)

(assert (=> b!188272 (=> (not res!156843) (not e!130092))))

(assert (=> b!188272 (= res!156843 (bvsle (bitIndex!0 (size!4343 (buf!4814 (_2!8767 lt!291792))) (currentByte!9080 (_2!8767 lt!291792)) (currentBit!9075 (_2!8767 lt!291792))) (bitIndex!0 (size!4343 (buf!4814 (_2!8767 lt!291784))) (currentByte!9080 (_2!8767 lt!291784)) (currentBit!9075 (_2!8767 lt!291784)))))))

(declare-fun b!188273 () Bool)

(declare-fun e!130093 () Bool)

(assert (=> b!188273 (= e!130092 e!130093)))

(declare-fun res!156841 () Bool)

(assert (=> b!188273 (=> res!156841 e!130093)))

(assert (=> b!188273 (= res!156841 (= (size!4343 (buf!4814 (_2!8767 lt!291792))) #b00000000000000000000000000000000))))

(declare-fun b!188274 () Bool)

(assert (=> b!188274 (= e!130093 (arrayBitRangesEq!0 (buf!4814 (_2!8767 lt!291792)) (buf!4814 (_2!8767 lt!291784)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4343 (buf!4814 (_2!8767 lt!291792))) (currentByte!9080 (_2!8767 lt!291792)) (currentBit!9075 (_2!8767 lt!291792)))))))

(assert (= (and d!64971 res!156842) b!188272))

(assert (= (and b!188272 res!156843) b!188273))

(assert (= (and b!188273 (not res!156841)) b!188274))

(assert (=> b!188272 m!292507))

(assert (=> b!188272 m!292529))

(assert (=> b!188274 m!292507))

(assert (=> b!188274 m!292507))

(declare-fun m!292865 () Bool)

(assert (=> b!188274 m!292865))

(assert (=> b!188067 d!64971))

(declare-fun d!64973 () Bool)

(assert (=> d!64973 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4343 (buf!4814 thiss!1204))) ((_ sign_extend 32) (currentByte!9080 thiss!1204)) ((_ sign_extend 32) (currentBit!9075 thiss!1204)) lt!291799) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4343 (buf!4814 thiss!1204))) ((_ sign_extend 32) (currentByte!9080 thiss!1204)) ((_ sign_extend 32) (currentBit!9075 thiss!1204))) lt!291799))))

(declare-fun bs!16145 () Bool)

(assert (= bs!16145 d!64973))

(assert (=> bs!16145 m!292659))

(assert (=> b!188074 d!64973))

(declare-fun d!64975 () Bool)

(declare-fun e!130096 () Bool)

(assert (=> d!64975 e!130096))

(declare-fun res!156846 () Bool)

(assert (=> d!64975 (=> (not res!156846) (not e!130096))))

(declare-fun lt!292259 () (_ BitVec 64))

(declare-fun lt!292258 () BitStream!7794)

(assert (=> d!64975 (= res!156846 (= (bvadd lt!292259 (bvsub lt!291778 lt!291800)) (bitIndex!0 (size!4343 (buf!4814 lt!292258)) (currentByte!9080 lt!292258) (currentBit!9075 lt!292258))))))

(assert (=> d!64975 (or (not (= (bvand lt!292259 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!291778 lt!291800) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!292259 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!292259 (bvsub lt!291778 lt!291800)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64975 (= lt!292259 (bitIndex!0 (size!4343 (buf!4814 (_2!8766 lt!291802))) (currentByte!9080 (_2!8766 lt!291802)) (currentBit!9075 (_2!8766 lt!291802))))))

(declare-fun moveBitIndex!0 (BitStream!7794 (_ BitVec 64)) tuple2!16244)

(assert (=> d!64975 (= lt!292258 (_2!8767 (moveBitIndex!0 (_2!8766 lt!291802) (bvsub lt!291778 lt!291800))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!7794 (_ BitVec 64)) Bool)

(assert (=> d!64975 (moveBitIndexPrecond!0 (_2!8766 lt!291802) (bvsub lt!291778 lt!291800))))

(assert (=> d!64975 (= (withMovedBitIndex!0 (_2!8766 lt!291802) (bvsub lt!291778 lt!291800)) lt!292258)))

(declare-fun b!188277 () Bool)

(assert (=> b!188277 (= e!130096 (= (size!4343 (buf!4814 (_2!8766 lt!291802))) (size!4343 (buf!4814 lt!292258))))))

(assert (= (and d!64975 res!156846) b!188277))

(declare-fun m!292867 () Bool)

(assert (=> d!64975 m!292867))

(declare-fun m!292869 () Bool)

(assert (=> d!64975 m!292869))

(declare-fun m!292871 () Bool)

(assert (=> d!64975 m!292871))

(declare-fun m!292873 () Bool)

(assert (=> d!64975 m!292873))

(assert (=> b!188063 d!64975))

(declare-fun d!64977 () Bool)

(declare-fun res!156848 () Bool)

(declare-fun e!130097 () Bool)

(assert (=> d!64977 (=> (not res!156848) (not e!130097))))

(assert (=> d!64977 (= res!156848 (= (size!4343 (buf!4814 thiss!1204)) (size!4343 (buf!4814 (_2!8767 lt!291792)))))))

(assert (=> d!64977 (= (isPrefixOf!0 thiss!1204 (_2!8767 lt!291792)) e!130097)))

(declare-fun b!188278 () Bool)

(declare-fun res!156849 () Bool)

(assert (=> b!188278 (=> (not res!156849) (not e!130097))))

(assert (=> b!188278 (= res!156849 (bvsle (bitIndex!0 (size!4343 (buf!4814 thiss!1204)) (currentByte!9080 thiss!1204) (currentBit!9075 thiss!1204)) (bitIndex!0 (size!4343 (buf!4814 (_2!8767 lt!291792))) (currentByte!9080 (_2!8767 lt!291792)) (currentBit!9075 (_2!8767 lt!291792)))))))

(declare-fun b!188279 () Bool)

(declare-fun e!130098 () Bool)

(assert (=> b!188279 (= e!130097 e!130098)))

(declare-fun res!156847 () Bool)

(assert (=> b!188279 (=> res!156847 e!130098)))

(assert (=> b!188279 (= res!156847 (= (size!4343 (buf!4814 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!188280 () Bool)

(assert (=> b!188280 (= e!130098 (arrayBitRangesEq!0 (buf!4814 thiss!1204) (buf!4814 (_2!8767 lt!291792)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4343 (buf!4814 thiss!1204)) (currentByte!9080 thiss!1204) (currentBit!9075 thiss!1204))))))

(assert (= (and d!64977 res!156848) b!188278))

(assert (= (and b!188278 res!156849) b!188279))

(assert (= (and b!188279 (not res!156847)) b!188280))

(assert (=> b!188278 m!292509))

(assert (=> b!188278 m!292507))

(assert (=> b!188280 m!292509))

(assert (=> b!188280 m!292509))

(declare-fun m!292875 () Bool)

(assert (=> b!188280 m!292875))

(assert (=> b!188065 d!64977))

(assert (=> b!188075 d!64899))

(assert (=> b!188075 d!64901))

(declare-fun b!188290 () Bool)

(declare-fun res!156861 () Bool)

(declare-fun e!130103 () Bool)

(assert (=> b!188290 (=> (not res!156861) (not e!130103))))

(declare-fun lt!292269 () (_ BitVec 64))

(declare-fun lt!292270 () tuple2!16244)

(declare-fun lt!292268 () (_ BitVec 64))

(assert (=> b!188290 (= res!156861 (= (bitIndex!0 (size!4343 (buf!4814 (_2!8767 lt!292270))) (currentByte!9080 (_2!8767 lt!292270)) (currentBit!9075 (_2!8767 lt!292270))) (bvadd lt!292269 lt!292268)))))

(assert (=> b!188290 (or (not (= (bvand lt!292269 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!292268 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!292269 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!292269 lt!292268) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!188290 (= lt!292268 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!188290 (= lt!292269 (bitIndex!0 (size!4343 (buf!4814 thiss!1204)) (currentByte!9080 thiss!1204) (currentBit!9075 thiss!1204)))))

(declare-fun d!64979 () Bool)

(assert (=> d!64979 e!130103))

(declare-fun res!156859 () Bool)

(assert (=> d!64979 (=> (not res!156859) (not e!130103))))

(assert (=> d!64979 (= res!156859 (= (size!4343 (buf!4814 thiss!1204)) (size!4343 (buf!4814 (_2!8767 lt!292270)))))))

(declare-fun choose!16 (BitStream!7794 Bool) tuple2!16244)

(assert (=> d!64979 (= lt!292270 (choose!16 thiss!1204 lt!291794))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!64979 (validate_offset_bit!0 ((_ sign_extend 32) (size!4343 (buf!4814 thiss!1204))) ((_ sign_extend 32) (currentByte!9080 thiss!1204)) ((_ sign_extend 32) (currentBit!9075 thiss!1204)))))

(assert (=> d!64979 (= (appendBit!0 thiss!1204 lt!291794) lt!292270)))

(declare-fun b!188292 () Bool)

(declare-fun e!130104 () Bool)

(assert (=> b!188292 (= e!130103 e!130104)))

(declare-fun res!156858 () Bool)

(assert (=> b!188292 (=> (not res!156858) (not e!130104))))

(declare-fun lt!292271 () tuple2!16246)

(assert (=> b!188292 (= res!156858 (and (= (_2!8768 lt!292271) lt!291794) (= (_1!8768 lt!292271) (_2!8767 lt!292270))))))

(assert (=> b!188292 (= lt!292271 (readBitPure!0 (readerFrom!0 (_2!8767 lt!292270) (currentBit!9075 thiss!1204) (currentByte!9080 thiss!1204))))))

(declare-fun b!188291 () Bool)

(declare-fun res!156860 () Bool)

(assert (=> b!188291 (=> (not res!156860) (not e!130103))))

(assert (=> b!188291 (= res!156860 (isPrefixOf!0 thiss!1204 (_2!8767 lt!292270)))))

(declare-fun b!188293 () Bool)

(assert (=> b!188293 (= e!130104 (= (bitIndex!0 (size!4343 (buf!4814 (_1!8768 lt!292271))) (currentByte!9080 (_1!8768 lt!292271)) (currentBit!9075 (_1!8768 lt!292271))) (bitIndex!0 (size!4343 (buf!4814 (_2!8767 lt!292270))) (currentByte!9080 (_2!8767 lt!292270)) (currentBit!9075 (_2!8767 lt!292270)))))))

(assert (= (and d!64979 res!156859) b!188290))

(assert (= (and b!188290 res!156861) b!188291))

(assert (= (and b!188291 res!156860) b!188292))

(assert (= (and b!188292 res!156858) b!188293))

(declare-fun m!292877 () Bool)

(assert (=> b!188293 m!292877))

(declare-fun m!292879 () Bool)

(assert (=> b!188293 m!292879))

(declare-fun m!292881 () Bool)

(assert (=> d!64979 m!292881))

(declare-fun m!292883 () Bool)

(assert (=> d!64979 m!292883))

(declare-fun m!292885 () Bool)

(assert (=> b!188291 m!292885))

(assert (=> b!188290 m!292879))

(assert (=> b!188290 m!292509))

(declare-fun m!292887 () Bool)

(assert (=> b!188292 m!292887))

(assert (=> b!188292 m!292887))

(declare-fun m!292889 () Bool)

(assert (=> b!188292 m!292889))

(assert (=> b!188075 d!64979))

(assert (=> b!188061 d!64977))

(declare-fun d!64981 () Bool)

(declare-fun lt!292287 () tuple2!16240)

(declare-fun lt!292288 () tuple2!16240)

(assert (=> d!64981 (and (= (_2!8765 lt!292287) (_2!8765 lt!292288)) (= (_1!8765 lt!292287) (_1!8765 lt!292288)))))

(declare-fun lt!292289 () (_ BitVec 64))

(declare-fun lt!292286 () Unit!13446)

(declare-fun lt!292284 () Bool)

(declare-fun lt!292285 () BitStream!7794)

(declare-fun choose!56 (BitStream!7794 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!16240 tuple2!16240 BitStream!7794 (_ BitVec 64) Bool BitStream!7794 (_ BitVec 64) tuple2!16240 tuple2!16240 BitStream!7794 (_ BitVec 64)) Unit!13446)

(assert (=> d!64981 (= lt!292286 (choose!56 (_1!8766 lt!291786) nBits!348 i!590 lt!291785 lt!292287 (tuple2!16241 (_1!8765 lt!292287) (_2!8765 lt!292287)) (_1!8765 lt!292287) (_2!8765 lt!292287) lt!292284 lt!292285 lt!292289 lt!292288 (tuple2!16241 (_1!8765 lt!292288) (_2!8765 lt!292288)) (_1!8765 lt!292288) (_2!8765 lt!292288)))))

(assert (=> d!64981 (= lt!292288 (readNBitsLSBFirstsLoopPure!0 lt!292285 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!292289))))

(assert (=> d!64981 (= lt!292289 (bvor lt!291785 (ite lt!292284 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64981 (= lt!292285 (withMovedBitIndex!0 (_1!8766 lt!291786) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!64981 (= lt!292284 (_2!8768 (readBitPure!0 (_1!8766 lt!291786))))))

(assert (=> d!64981 (= lt!292287 (readNBitsLSBFirstsLoopPure!0 (_1!8766 lt!291786) nBits!348 i!590 lt!291785))))

(assert (=> d!64981 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8766 lt!291786) nBits!348 i!590 lt!291785) lt!292286)))

(declare-fun bs!16147 () Bool)

(assert (= bs!16147 d!64981))

(declare-fun m!292891 () Bool)

(assert (=> bs!16147 m!292891))

(declare-fun m!292893 () Bool)

(assert (=> bs!16147 m!292893))

(assert (=> bs!16147 m!292569))

(assert (=> bs!16147 m!292565))

(assert (=> bs!16147 m!292515))

(assert (=> b!188071 d!64981))

(declare-fun d!64983 () Bool)

(declare-fun lt!292290 () tuple2!16258)

(assert (=> d!64983 (= lt!292290 (readNBitsLSBFirstsLoop!0 lt!291804 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!291805))))

(assert (=> d!64983 (= (readNBitsLSBFirstsLoopPure!0 lt!291804 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!291805) (tuple2!16241 (_2!8774 lt!292290) (_1!8774 lt!292290)))))

(declare-fun bs!16148 () Bool)

(assert (= bs!16148 d!64983))

(declare-fun m!292895 () Bool)

(assert (=> bs!16148 m!292895))

(assert (=> b!188071 d!64983))

(declare-fun d!64985 () Bool)

(declare-fun e!130105 () Bool)

(assert (=> d!64985 e!130105))

(declare-fun res!156862 () Bool)

(assert (=> d!64985 (=> (not res!156862) (not e!130105))))

(declare-fun lt!292292 () (_ BitVec 64))

(declare-fun lt!292291 () BitStream!7794)

(assert (=> d!64985 (= res!156862 (= (bvadd lt!292292 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4343 (buf!4814 lt!292291)) (currentByte!9080 lt!292291) (currentBit!9075 lt!292291))))))

(assert (=> d!64985 (or (not (= (bvand lt!292292 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!292292 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!292292 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64985 (= lt!292292 (bitIndex!0 (size!4343 (buf!4814 (_1!8766 lt!291786))) (currentByte!9080 (_1!8766 lt!291786)) (currentBit!9075 (_1!8766 lt!291786))))))

(assert (=> d!64985 (= lt!292291 (_2!8767 (moveBitIndex!0 (_1!8766 lt!291786) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!64985 (moveBitIndexPrecond!0 (_1!8766 lt!291786) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!64985 (= (withMovedBitIndex!0 (_1!8766 lt!291786) #b0000000000000000000000000000000000000000000000000000000000000001) lt!292291)))

(declare-fun b!188294 () Bool)

(assert (=> b!188294 (= e!130105 (= (size!4343 (buf!4814 (_1!8766 lt!291786))) (size!4343 (buf!4814 lt!292291))))))

(assert (= (and d!64985 res!156862) b!188294))

(declare-fun m!292897 () Bool)

(assert (=> d!64985 m!292897))

(declare-fun m!292899 () Bool)

(assert (=> d!64985 m!292899))

(declare-fun m!292901 () Bool)

(assert (=> d!64985 m!292901))

(declare-fun m!292903 () Bool)

(assert (=> d!64985 m!292903))

(assert (=> b!188071 d!64985))

(declare-fun d!64987 () Bool)

(assert (=> d!64987 (= (invariant!0 (currentBit!9075 (_2!8767 lt!291784)) (currentByte!9080 (_2!8767 lt!291784)) (size!4343 (buf!4814 (_2!8767 lt!291784)))) (and (bvsge (currentBit!9075 (_2!8767 lt!291784)) #b00000000000000000000000000000000) (bvslt (currentBit!9075 (_2!8767 lt!291784)) #b00000000000000000000000000001000) (bvsge (currentByte!9080 (_2!8767 lt!291784)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9080 (_2!8767 lt!291784)) (size!4343 (buf!4814 (_2!8767 lt!291784)))) (and (= (currentBit!9075 (_2!8767 lt!291784)) #b00000000000000000000000000000000) (= (currentByte!9080 (_2!8767 lt!291784)) (size!4343 (buf!4814 (_2!8767 lt!291784))))))))))

(assert (=> b!188060 d!64987))

(declare-fun d!64989 () Bool)

(assert (=> d!64989 (= (invariant!0 (currentBit!9075 (_2!8766 lt!291786)) (currentByte!9080 (_2!8766 lt!291786)) (size!4343 (buf!4814 (_2!8766 lt!291786)))) (and (bvsge (currentBit!9075 (_2!8766 lt!291786)) #b00000000000000000000000000000000) (bvslt (currentBit!9075 (_2!8766 lt!291786)) #b00000000000000000000000000001000) (bvsge (currentByte!9080 (_2!8766 lt!291786)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9080 (_2!8766 lt!291786)) (size!4343 (buf!4814 (_2!8766 lt!291786)))) (and (= (currentBit!9075 (_2!8766 lt!291786)) #b00000000000000000000000000000000) (= (currentByte!9080 (_2!8766 lt!291786)) (size!4343 (buf!4814 (_2!8766 lt!291786))))))))))

(assert (=> b!188073 d!64989))

(declare-fun d!64991 () Bool)

(declare-fun e!130106 () Bool)

(assert (=> d!64991 e!130106))

(declare-fun res!156863 () Bool)

(assert (=> d!64991 (=> (not res!156863) (not e!130106))))

(declare-fun lt!292295 () (_ BitVec 64))

(declare-fun lt!292296 () (_ BitVec 64))

(declare-fun lt!292293 () (_ BitVec 64))

(assert (=> d!64991 (= res!156863 (= lt!292293 (bvsub lt!292296 lt!292295)))))

(assert (=> d!64991 (or (= (bvand lt!292296 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!292295 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!292296 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!292296 lt!292295) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64991 (= lt!292295 (remainingBits!0 ((_ sign_extend 32) (size!4343 (buf!4814 (_1!8768 lt!291781)))) ((_ sign_extend 32) (currentByte!9080 (_1!8768 lt!291781))) ((_ sign_extend 32) (currentBit!9075 (_1!8768 lt!291781)))))))

(declare-fun lt!292297 () (_ BitVec 64))

(declare-fun lt!292298 () (_ BitVec 64))

(assert (=> d!64991 (= lt!292296 (bvmul lt!292297 lt!292298))))

(assert (=> d!64991 (or (= lt!292297 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!292298 (bvsdiv (bvmul lt!292297 lt!292298) lt!292297)))))

(assert (=> d!64991 (= lt!292298 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64991 (= lt!292297 ((_ sign_extend 32) (size!4343 (buf!4814 (_1!8768 lt!291781)))))))

(assert (=> d!64991 (= lt!292293 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9080 (_1!8768 lt!291781))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9075 (_1!8768 lt!291781)))))))

(assert (=> d!64991 (invariant!0 (currentBit!9075 (_1!8768 lt!291781)) (currentByte!9080 (_1!8768 lt!291781)) (size!4343 (buf!4814 (_1!8768 lt!291781))))))

(assert (=> d!64991 (= (bitIndex!0 (size!4343 (buf!4814 (_1!8768 lt!291781))) (currentByte!9080 (_1!8768 lt!291781)) (currentBit!9075 (_1!8768 lt!291781))) lt!292293)))

(declare-fun b!188295 () Bool)

(declare-fun res!156864 () Bool)

(assert (=> b!188295 (=> (not res!156864) (not e!130106))))

(assert (=> b!188295 (= res!156864 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!292293))))

(declare-fun b!188296 () Bool)

(declare-fun lt!292294 () (_ BitVec 64))

(assert (=> b!188296 (= e!130106 (bvsle lt!292293 (bvmul lt!292294 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!188296 (or (= lt!292294 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!292294 #b0000000000000000000000000000000000000000000000000000000000001000) lt!292294)))))

(assert (=> b!188296 (= lt!292294 ((_ sign_extend 32) (size!4343 (buf!4814 (_1!8768 lt!291781)))))))

(assert (= (and d!64991 res!156863) b!188295))

(assert (= (and b!188295 res!156864) b!188296))

(declare-fun m!292905 () Bool)

(assert (=> d!64991 m!292905))

(declare-fun m!292907 () Bool)

(assert (=> d!64991 m!292907))

(assert (=> b!188062 d!64991))

(declare-fun d!64993 () Bool)

(assert (=> d!64993 (= (invariant!0 (currentBit!9075 thiss!1204) (currentByte!9080 thiss!1204) (size!4343 (buf!4814 (_2!8767 lt!291784)))) (and (bvsge (currentBit!9075 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9075 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9080 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9080 thiss!1204) (size!4343 (buf!4814 (_2!8767 lt!291784)))) (and (= (currentBit!9075 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9080 thiss!1204) (size!4343 (buf!4814 (_2!8767 lt!291784))))))))))

(assert (=> b!188072 d!64993))

(declare-fun d!64995 () Bool)

(assert (=> d!64995 (= (array_inv!4084 (buf!4814 thiss!1204)) (bvsge (size!4343 (buf!4814 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!188069 d!64995))

(declare-fun d!64997 () Bool)

(declare-fun e!130107 () Bool)

(assert (=> d!64997 e!130107))

(declare-fun res!156865 () Bool)

(assert (=> d!64997 (=> (not res!156865) (not e!130107))))

(declare-fun lt!292299 () BitStream!7794)

(declare-fun lt!292300 () (_ BitVec 64))

(assert (=> d!64997 (= res!156865 (= (bvadd lt!292300 (bvsub lt!291777 lt!291800)) (bitIndex!0 (size!4343 (buf!4814 lt!292299)) (currentByte!9080 lt!292299) (currentBit!9075 lt!292299))))))

(assert (=> d!64997 (or (not (= (bvand lt!292300 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!291777 lt!291800) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!292300 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!292300 (bvsub lt!291777 lt!291800)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64997 (= lt!292300 (bitIndex!0 (size!4343 (buf!4814 (_2!8766 lt!291786))) (currentByte!9080 (_2!8766 lt!291786)) (currentBit!9075 (_2!8766 lt!291786))))))

(assert (=> d!64997 (= lt!292299 (_2!8767 (moveBitIndex!0 (_2!8766 lt!291786) (bvsub lt!291777 lt!291800))))))

(assert (=> d!64997 (moveBitIndexPrecond!0 (_2!8766 lt!291786) (bvsub lt!291777 lt!291800))))

(assert (=> d!64997 (= (withMovedBitIndex!0 (_2!8766 lt!291786) (bvsub lt!291777 lt!291800)) lt!292299)))

(declare-fun b!188297 () Bool)

(assert (=> b!188297 (= e!130107 (= (size!4343 (buf!4814 (_2!8766 lt!291786))) (size!4343 (buf!4814 lt!292299))))))

(assert (= (and d!64997 res!156865) b!188297))

(declare-fun m!292909 () Bool)

(assert (=> d!64997 m!292909))

(declare-fun m!292911 () Bool)

(assert (=> d!64997 m!292911))

(declare-fun m!292913 () Bool)

(assert (=> d!64997 m!292913))

(declare-fun m!292915 () Bool)

(assert (=> d!64997 m!292915))

(assert (=> b!188068 d!64997))

(check-sat (not b!188266) (not b!188280) (not d!64965) (not b!188238) (not b!188271) (not b!188163) (not d!64945) (not d!64985) (not b!188161) (not d!64901) (not b!188262) (not b!188257) (not d!64963) (not b!188290) (not b!188293) (not b!188259) (not d!64981) (not b!188292) (not d!64983) (not b!188272) (not d!64947) (not d!64907) (not d!64975) (not d!64909) (not d!64959) (not b!188232) (not d!64953) (not d!64933) (not d!64969) (not b!188274) (not b!188233) (not d!64951) (not d!64957) (not d!64973) (not d!64949) (not b!188278) (not b!188226) (not b!188264) (not d!64967) (not d!64943) (not d!64941) (not b!188291) (not d!64903) (not d!64991) (not b!188237) (not b!188263) (not d!64937) (not b!188258) (not d!64955) (not d!64979) (not b!188236) (not d!64935) (not d!64899) (not b!188261) (not d!64997) (not b!188228) (not bm!3020) (not b!188230) (not b!188234))
