; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47718 () Bool)

(assert start!47718)

(declare-fun b!227116 () Bool)

(declare-fun res!190555 () Bool)

(declare-fun e!155348 () Bool)

(assert (=> b!227116 (=> (not res!190555) (not e!155348))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!227116 (= res!190555 (bvslt i!761 to!496))))

(declare-fun b!227117 () Bool)

(declare-datatypes ((array!11385 0))(
  ( (array!11386 (arr!5967 (Array (_ BitVec 32) (_ BitVec 8))) (size!4992 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11385)

(assert (=> b!227117 (= e!155348 (not (bvslt i!761 (size!4992 arr!308))))))

(declare-fun lt!362777 () (_ BitVec 32))

(declare-fun lt!362776 () (_ BitVec 64))

(declare-datatypes ((BitStream!9080 0))(
  ( (BitStream!9081 (buf!5533 array!11385) (currentByte!10371 (_ BitVec 32)) (currentBit!10366 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9080)

(declare-datatypes ((Unit!16927 0))(
  ( (Unit!16928) )
))
(declare-datatypes ((tuple3!1366 0))(
  ( (tuple3!1367 (_1!10578 Unit!16927) (_2!10578 BitStream!9080) (_3!825 array!11385)) )
))
(declare-fun lt!362772 () tuple3!1366)

(declare-fun lt!362778 () (_ BitVec 64))

(declare-fun lt!362775 () (_ BitVec 64))

(assert (=> b!227117 (and (= (bvadd lt!362778 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!362777))) lt!362776) (= (bvadd lt!362775 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!362776) (= (buf!5533 thiss!1870) (buf!5533 (_2!10578 lt!362772))) (= (size!4992 arr!308) (size!4992 (_3!825 lt!362772))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!227117 (= lt!362776 (bitIndex!0 (size!4992 (buf!5533 (_2!10578 lt!362772))) (currentByte!10371 (_2!10578 lt!362772)) (currentBit!10366 (_2!10578 lt!362772))))))

(assert (=> b!227117 (= lt!362778 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!362775))))

(declare-datatypes ((tuple2!19506 0))(
  ( (tuple2!19507 (_1!10579 (_ BitVec 8)) (_2!10579 BitStream!9080)) )
))
(declare-fun lt!362773 () tuple2!19506)

(assert (=> b!227117 (= lt!362778 (bitIndex!0 (size!4992 (buf!5533 (_2!10579 lt!362773))) (currentByte!10371 (_2!10579 lt!362773)) (currentBit!10366 (_2!10579 lt!362773))))))

(assert (=> b!227117 (= lt!362775 (bitIndex!0 (size!4992 (buf!5533 thiss!1870)) (currentByte!10371 thiss!1870) (currentBit!10366 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9080 array!11385 (_ BitVec 32) (_ BitVec 32)) tuple3!1366)

(assert (=> b!227117 (= lt!362772 (readByteArrayLoop!0 (_2!10579 lt!362773) (array!11386 (store (arr!5967 arr!308) i!761 (_1!10579 lt!362773)) (size!4992 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227117 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4992 (buf!5533 (_2!10579 lt!362773)))) ((_ sign_extend 32) (currentByte!10371 (_2!10579 lt!362773))) ((_ sign_extend 32) (currentBit!10366 (_2!10579 lt!362773))) lt!362777)))

(assert (=> b!227117 (= lt!362777 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!362774 () Unit!16927)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9080 BitStream!9080 (_ BitVec 64) (_ BitVec 32)) Unit!16927)

(assert (=> b!227117 (= lt!362774 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10579 lt!362773) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!9080) tuple2!19506)

(assert (=> b!227117 (= lt!362773 (readByte!0 thiss!1870))))

(declare-fun res!190553 () Bool)

(assert (=> start!47718 (=> (not res!190553) (not e!155348))))

(assert (=> start!47718 (= res!190553 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4992 arr!308))))))

(assert (=> start!47718 e!155348))

(assert (=> start!47718 true))

(declare-fun array_inv!4733 (array!11385) Bool)

(assert (=> start!47718 (array_inv!4733 arr!308)))

(declare-fun e!155350 () Bool)

(declare-fun inv!12 (BitStream!9080) Bool)

(assert (=> start!47718 (and (inv!12 thiss!1870) e!155350)))

(declare-fun b!227115 () Bool)

(declare-fun res!190554 () Bool)

(assert (=> b!227115 (=> (not res!190554) (not e!155348))))

(assert (=> b!227115 (= res!190554 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4992 (buf!5533 thiss!1870))) ((_ sign_extend 32) (currentByte!10371 thiss!1870)) ((_ sign_extend 32) (currentBit!10366 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!227118 () Bool)

(assert (=> b!227118 (= e!155350 (array_inv!4733 (buf!5533 thiss!1870)))))

(assert (= (and start!47718 res!190553) b!227115))

(assert (= (and b!227115 res!190554) b!227116))

(assert (= (and b!227116 res!190555) b!227117))

(assert (= start!47718 b!227118))

(declare-fun m!349111 () Bool)

(assert (=> b!227117 m!349111))

(declare-fun m!349113 () Bool)

(assert (=> b!227117 m!349113))

(declare-fun m!349115 () Bool)

(assert (=> b!227117 m!349115))

(declare-fun m!349117 () Bool)

(assert (=> b!227117 m!349117))

(declare-fun m!349119 () Bool)

(assert (=> b!227117 m!349119))

(declare-fun m!349121 () Bool)

(assert (=> b!227117 m!349121))

(declare-fun m!349123 () Bool)

(assert (=> b!227117 m!349123))

(declare-fun m!349125 () Bool)

(assert (=> b!227117 m!349125))

(declare-fun m!349127 () Bool)

(assert (=> start!47718 m!349127))

(declare-fun m!349129 () Bool)

(assert (=> start!47718 m!349129))

(declare-fun m!349131 () Bool)

(assert (=> b!227115 m!349131))

(declare-fun m!349133 () Bool)

(assert (=> b!227118 m!349133))

(push 1)

(assert (not b!227118))

(assert (not b!227117))

(assert (not start!47718))

(assert (not b!227115))

(check-sat)

(pop 1)

(push 1)

(check-sat)

