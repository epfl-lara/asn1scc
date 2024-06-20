; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47822 () Bool)

(assert start!47822)

(declare-fun b!227561 () Bool)

(declare-fun e!155761 () Bool)

(declare-fun i!761 () (_ BitVec 32))

(assert (=> b!227561 (= e!155761 (not (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761))))))

(declare-datatypes ((array!11438 0))(
  ( (array!11439 (arr!5995 (Array (_ BitVec 32) (_ BitVec 8))) (size!5017 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11438)

(declare-datatypes ((BitStream!9130 0))(
  ( (BitStream!9131 (buf!5558 array!11438) (currentByte!10402 (_ BitVec 32)) (currentBit!10397 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!17008 0))(
  ( (Unit!17009) )
))
(declare-datatypes ((tuple3!1416 0))(
  ( (tuple3!1417 (_1!10634 Unit!17008) (_2!10634 BitStream!9130) (_3!850 array!11438)) )
))
(declare-fun lt!363983 () tuple3!1416)

(declare-fun arrayRangesEq!853 (array!11438 array!11438 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227561 (arrayRangesEq!853 arr!308 (_3!850 lt!363983) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!363980 () Unit!17008)

(declare-fun lt!363979 () array!11438)

(declare-fun arrayRangesEqTransitive!276 (array!11438 array!11438 array!11438 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17008)

(assert (=> b!227561 (= lt!363980 (arrayRangesEqTransitive!276 arr!308 lt!363979 (_3!850 lt!363983) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!227561 (arrayRangesEq!853 arr!308 lt!363979 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((tuple2!19568 0))(
  ( (tuple2!19569 (_1!10635 (_ BitVec 8)) (_2!10635 BitStream!9130)) )
))
(declare-fun lt!363985 () tuple2!19568)

(declare-fun lt!363982 () Unit!17008)

(declare-fun arrayUpdatedAtPrefixLemma!412 (array!11438 (_ BitVec 32) (_ BitVec 8)) Unit!17008)

(assert (=> b!227561 (= lt!363982 (arrayUpdatedAtPrefixLemma!412 arr!308 i!761 (_1!10635 lt!363985)))))

(declare-fun lt!363987 () (_ BitVec 64))

(declare-fun lt!363978 () (_ BitVec 32))

(declare-fun lt!363981 () (_ BitVec 64))

(declare-fun thiss!1870 () BitStream!9130)

(declare-fun to!496 () (_ BitVec 32))

(declare-fun lt!363986 () (_ BitVec 64))

(assert (=> b!227561 (and (= (bvadd lt!363981 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!363978))) lt!363986) (= (bvadd lt!363987 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!363986) (= (buf!5558 thiss!1870) (buf!5558 (_2!10634 lt!363983))) (= (size!5017 arr!308) (size!5017 (_3!850 lt!363983))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!227561 (= lt!363986 (bitIndex!0 (size!5017 (buf!5558 (_2!10634 lt!363983))) (currentByte!10402 (_2!10634 lt!363983)) (currentBit!10397 (_2!10634 lt!363983))))))

(assert (=> b!227561 (= lt!363981 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!363987))))

(assert (=> b!227561 (= lt!363981 (bitIndex!0 (size!5017 (buf!5558 (_2!10635 lt!363985))) (currentByte!10402 (_2!10635 lt!363985)) (currentBit!10397 (_2!10635 lt!363985))))))

(assert (=> b!227561 (= lt!363987 (bitIndex!0 (size!5017 (buf!5558 thiss!1870)) (currentByte!10402 thiss!1870) (currentBit!10397 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9130 array!11438 (_ BitVec 32) (_ BitVec 32)) tuple3!1416)

(assert (=> b!227561 (= lt!363983 (readByteArrayLoop!0 (_2!10635 lt!363985) lt!363979 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227561 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5017 (buf!5558 (_2!10635 lt!363985)))) ((_ sign_extend 32) (currentByte!10402 (_2!10635 lt!363985))) ((_ sign_extend 32) (currentBit!10397 (_2!10635 lt!363985))) lt!363978)))

(assert (=> b!227561 (= lt!363978 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!363984 () Unit!17008)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9130 BitStream!9130 (_ BitVec 64) (_ BitVec 32)) Unit!17008)

(assert (=> b!227561 (= lt!363984 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10635 lt!363985) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!227561 (= lt!363979 (array!11439 (store (arr!5995 arr!308) i!761 (_1!10635 lt!363985)) (size!5017 arr!308)))))

(declare-fun readByte!0 (BitStream!9130) tuple2!19568)

(assert (=> b!227561 (= lt!363985 (readByte!0 thiss!1870))))

(declare-fun b!227560 () Bool)

(declare-fun res!190907 () Bool)

(assert (=> b!227560 (=> (not res!190907) (not e!155761))))

(assert (=> b!227560 (= res!190907 (bvslt i!761 to!496))))

(declare-fun b!227562 () Bool)

(declare-fun e!155760 () Bool)

(declare-fun array_inv!4758 (array!11438) Bool)

(assert (=> b!227562 (= e!155760 (array_inv!4758 (buf!5558 thiss!1870)))))

(declare-fun res!190909 () Bool)

(assert (=> start!47822 (=> (not res!190909) (not e!155761))))

(assert (=> start!47822 (= res!190909 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5017 arr!308))))))

(assert (=> start!47822 e!155761))

(assert (=> start!47822 true))

(assert (=> start!47822 (array_inv!4758 arr!308)))

(declare-fun inv!12 (BitStream!9130) Bool)

(assert (=> start!47822 (and (inv!12 thiss!1870) e!155760)))

(declare-fun b!227559 () Bool)

(declare-fun res!190908 () Bool)

(assert (=> b!227559 (=> (not res!190908) (not e!155761))))

(assert (=> b!227559 (= res!190908 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5017 (buf!5558 thiss!1870))) ((_ sign_extend 32) (currentByte!10402 thiss!1870)) ((_ sign_extend 32) (currentBit!10397 thiss!1870)) (bvsub to!496 i!761)))))

(assert (= (and start!47822 res!190909) b!227559))

(assert (= (and b!227559 res!190908) b!227560))

(assert (= (and b!227560 res!190907) b!227561))

(assert (= start!47822 b!227562))

(declare-fun m!350077 () Bool)

(assert (=> b!227561 m!350077))

(declare-fun m!350079 () Bool)

(assert (=> b!227561 m!350079))

(declare-fun m!350081 () Bool)

(assert (=> b!227561 m!350081))

(declare-fun m!350083 () Bool)

(assert (=> b!227561 m!350083))

(declare-fun m!350085 () Bool)

(assert (=> b!227561 m!350085))

(declare-fun m!350087 () Bool)

(assert (=> b!227561 m!350087))

(declare-fun m!350089 () Bool)

(assert (=> b!227561 m!350089))

(declare-fun m!350091 () Bool)

(assert (=> b!227561 m!350091))

(declare-fun m!350093 () Bool)

(assert (=> b!227561 m!350093))

(declare-fun m!350095 () Bool)

(assert (=> b!227561 m!350095))

(declare-fun m!350097 () Bool)

(assert (=> b!227561 m!350097))

(declare-fun m!350099 () Bool)

(assert (=> b!227561 m!350099))

(declare-fun m!350101 () Bool)

(assert (=> b!227562 m!350101))

(declare-fun m!350103 () Bool)

(assert (=> start!47822 m!350103))

(declare-fun m!350105 () Bool)

(assert (=> start!47822 m!350105))

(declare-fun m!350107 () Bool)

(assert (=> b!227559 m!350107))

(push 1)

(assert (not b!227561))

(assert (not b!227562))

(assert (not start!47822))

(assert (not b!227559))

(check-sat)

(pop 1)

(push 1)

(check-sat)

