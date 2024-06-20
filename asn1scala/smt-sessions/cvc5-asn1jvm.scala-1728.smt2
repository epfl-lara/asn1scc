; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47714 () Bool)

(assert start!47714)

(declare-fun b!227091 () Bool)

(declare-fun res!190536 () Bool)

(declare-fun e!155324 () Bool)

(assert (=> b!227091 (=> (not res!190536) (not e!155324))))

(declare-datatypes ((array!11381 0))(
  ( (array!11382 (arr!5965 (Array (_ BitVec 32) (_ BitVec 8))) (size!4990 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9076 0))(
  ( (BitStream!9077 (buf!5531 array!11381) (currentByte!10369 (_ BitVec 32)) (currentBit!10364 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9076)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227091 (= res!190536 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4990 (buf!5531 thiss!1870))) ((_ sign_extend 32) (currentByte!10369 thiss!1870)) ((_ sign_extend 32) (currentBit!10364 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!190535 () Bool)

(assert (=> start!47714 (=> (not res!190535) (not e!155324))))

(declare-fun arr!308 () array!11381)

(assert (=> start!47714 (= res!190535 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4990 arr!308))))))

(assert (=> start!47714 e!155324))

(assert (=> start!47714 true))

(declare-fun array_inv!4731 (array!11381) Bool)

(assert (=> start!47714 (array_inv!4731 arr!308)))

(declare-fun e!155323 () Bool)

(declare-fun inv!12 (BitStream!9076) Bool)

(assert (=> start!47714 (and (inv!12 thiss!1870) e!155323)))

(declare-fun b!227093 () Bool)

(assert (=> b!227093 (= e!155324 (not (bvslt i!761 (size!4990 arr!308))))))

(declare-fun lt!362732 () (_ BitVec 64))

(declare-fun lt!362734 () (_ BitVec 64))

(declare-fun lt!362733 () (_ BitVec 64))

(declare-fun lt!362731 () (_ BitVec 32))

(declare-datatypes ((Unit!16923 0))(
  ( (Unit!16924) )
))
(declare-datatypes ((tuple3!1362 0))(
  ( (tuple3!1363 (_1!10574 Unit!16923) (_2!10574 BitStream!9076) (_3!823 array!11381)) )
))
(declare-fun lt!362735 () tuple3!1362)

(assert (=> b!227093 (and (= (bvadd lt!362732 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!362731))) lt!362734) (= (bvadd lt!362733 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!362734) (= (buf!5531 thiss!1870) (buf!5531 (_2!10574 lt!362735))) (= (size!4990 arr!308) (size!4990 (_3!823 lt!362735))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!227093 (= lt!362734 (bitIndex!0 (size!4990 (buf!5531 (_2!10574 lt!362735))) (currentByte!10369 (_2!10574 lt!362735)) (currentBit!10364 (_2!10574 lt!362735))))))

(assert (=> b!227093 (= lt!362732 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!362733))))

(declare-datatypes ((tuple2!19502 0))(
  ( (tuple2!19503 (_1!10575 (_ BitVec 8)) (_2!10575 BitStream!9076)) )
))
(declare-fun lt!362736 () tuple2!19502)

(assert (=> b!227093 (= lt!362732 (bitIndex!0 (size!4990 (buf!5531 (_2!10575 lt!362736))) (currentByte!10369 (_2!10575 lt!362736)) (currentBit!10364 (_2!10575 lt!362736))))))

(assert (=> b!227093 (= lt!362733 (bitIndex!0 (size!4990 (buf!5531 thiss!1870)) (currentByte!10369 thiss!1870) (currentBit!10364 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9076 array!11381 (_ BitVec 32) (_ BitVec 32)) tuple3!1362)

(assert (=> b!227093 (= lt!362735 (readByteArrayLoop!0 (_2!10575 lt!362736) (array!11382 (store (arr!5965 arr!308) i!761 (_1!10575 lt!362736)) (size!4990 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!227093 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4990 (buf!5531 (_2!10575 lt!362736)))) ((_ sign_extend 32) (currentByte!10369 (_2!10575 lt!362736))) ((_ sign_extend 32) (currentBit!10364 (_2!10575 lt!362736))) lt!362731)))

(assert (=> b!227093 (= lt!362731 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!362730 () Unit!16923)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9076 BitStream!9076 (_ BitVec 64) (_ BitVec 32)) Unit!16923)

(assert (=> b!227093 (= lt!362730 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10575 lt!362736) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!9076) tuple2!19502)

(assert (=> b!227093 (= lt!362736 (readByte!0 thiss!1870))))

(declare-fun b!227094 () Bool)

(assert (=> b!227094 (= e!155323 (array_inv!4731 (buf!5531 thiss!1870)))))

(declare-fun b!227092 () Bool)

(declare-fun res!190537 () Bool)

(assert (=> b!227092 (=> (not res!190537) (not e!155324))))

(assert (=> b!227092 (= res!190537 (bvslt i!761 to!496))))

(assert (= (and start!47714 res!190535) b!227091))

(assert (= (and b!227091 res!190536) b!227092))

(assert (= (and b!227092 res!190537) b!227093))

(assert (= start!47714 b!227094))

(declare-fun m!349063 () Bool)

(assert (=> b!227091 m!349063))

(declare-fun m!349065 () Bool)

(assert (=> start!47714 m!349065))

(declare-fun m!349067 () Bool)

(assert (=> start!47714 m!349067))

(declare-fun m!349069 () Bool)

(assert (=> b!227093 m!349069))

(declare-fun m!349071 () Bool)

(assert (=> b!227093 m!349071))

(declare-fun m!349073 () Bool)

(assert (=> b!227093 m!349073))

(declare-fun m!349075 () Bool)

(assert (=> b!227093 m!349075))

(declare-fun m!349077 () Bool)

(assert (=> b!227093 m!349077))

(declare-fun m!349079 () Bool)

(assert (=> b!227093 m!349079))

(declare-fun m!349081 () Bool)

(assert (=> b!227093 m!349081))

(declare-fun m!349083 () Bool)

(assert (=> b!227093 m!349083))

(declare-fun m!349085 () Bool)

(assert (=> b!227094 m!349085))

(push 1)

(assert (not b!227094))

(assert (not b!227093))

(assert (not start!47714))

(assert (not b!227091))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

