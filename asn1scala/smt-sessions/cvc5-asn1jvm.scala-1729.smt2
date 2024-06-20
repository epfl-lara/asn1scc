; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47720 () Bool)

(assert start!47720)

(declare-fun res!190562 () Bool)

(declare-fun e!155360 () Bool)

(assert (=> start!47720 (=> (not res!190562) (not e!155360))))

(declare-datatypes ((array!11387 0))(
  ( (array!11388 (arr!5968 (Array (_ BitVec 32) (_ BitVec 8))) (size!4993 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11387)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!47720 (= res!190562 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4993 arr!308))))))

(assert (=> start!47720 e!155360))

(assert (=> start!47720 true))

(declare-fun array_inv!4734 (array!11387) Bool)

(assert (=> start!47720 (array_inv!4734 arr!308)))

(declare-datatypes ((BitStream!9082 0))(
  ( (BitStream!9083 (buf!5534 array!11387) (currentByte!10372 (_ BitVec 32)) (currentBit!10367 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9082)

(declare-fun e!155362 () Bool)

(declare-fun inv!12 (BitStream!9082) Bool)

(assert (=> start!47720 (and (inv!12 thiss!1870) e!155362)))

(declare-fun b!227128 () Bool)

(declare-fun res!190564 () Bool)

(assert (=> b!227128 (=> (not res!190564) (not e!155360))))

(assert (=> b!227128 (= res!190564 (bvslt i!761 to!496))))

(declare-fun b!227129 () Bool)

(assert (=> b!227129 (= e!155360 (not (or (not (= (bvand i!761 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (= (bvand i!761 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)))))))

(declare-fun lt!362804 () array!11387)

(declare-fun arrayRangesEq!829 (array!11387 array!11387 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227129 (arrayRangesEq!829 arr!308 lt!362804 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((tuple2!19508 0))(
  ( (tuple2!19509 (_1!10580 (_ BitVec 8)) (_2!10580 BitStream!9082)) )
))
(declare-fun lt!362800 () tuple2!19508)

(declare-datatypes ((Unit!16929 0))(
  ( (Unit!16930) )
))
(declare-fun lt!362797 () Unit!16929)

(declare-fun arrayUpdatedAtPrefixLemma!388 (array!11387 (_ BitVec 32) (_ BitVec 8)) Unit!16929)

(assert (=> b!227129 (= lt!362797 (arrayUpdatedAtPrefixLemma!388 arr!308 i!761 (_1!10580 lt!362800)))))

(declare-fun lt!362801 () (_ BitVec 64))

(declare-fun lt!362805 () (_ BitVec 32))

(declare-fun lt!362803 () (_ BitVec 64))

(declare-fun lt!362798 () (_ BitVec 64))

(declare-datatypes ((tuple3!1368 0))(
  ( (tuple3!1369 (_1!10581 Unit!16929) (_2!10581 BitStream!9082) (_3!826 array!11387)) )
))
(declare-fun lt!362799 () tuple3!1368)

(assert (=> b!227129 (and (= (bvadd lt!362798 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!362805))) lt!362803) (= (bvadd lt!362801 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!362803) (= (buf!5534 thiss!1870) (buf!5534 (_2!10581 lt!362799))) (= (size!4993 arr!308) (size!4993 (_3!826 lt!362799))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!227129 (= lt!362803 (bitIndex!0 (size!4993 (buf!5534 (_2!10581 lt!362799))) (currentByte!10372 (_2!10581 lt!362799)) (currentBit!10367 (_2!10581 lt!362799))))))

(assert (=> b!227129 (= lt!362798 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!362801))))

(assert (=> b!227129 (= lt!362798 (bitIndex!0 (size!4993 (buf!5534 (_2!10580 lt!362800))) (currentByte!10372 (_2!10580 lt!362800)) (currentBit!10367 (_2!10580 lt!362800))))))

(assert (=> b!227129 (= lt!362801 (bitIndex!0 (size!4993 (buf!5534 thiss!1870)) (currentByte!10372 thiss!1870) (currentBit!10367 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9082 array!11387 (_ BitVec 32) (_ BitVec 32)) tuple3!1368)

(assert (=> b!227129 (= lt!362799 (readByteArrayLoop!0 (_2!10580 lt!362800) lt!362804 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227129 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4993 (buf!5534 (_2!10580 lt!362800)))) ((_ sign_extend 32) (currentByte!10372 (_2!10580 lt!362800))) ((_ sign_extend 32) (currentBit!10367 (_2!10580 lt!362800))) lt!362805)))

(assert (=> b!227129 (= lt!362805 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!362802 () Unit!16929)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9082 BitStream!9082 (_ BitVec 64) (_ BitVec 32)) Unit!16929)

(assert (=> b!227129 (= lt!362802 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10580 lt!362800) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!227129 (= lt!362804 (array!11388 (store (arr!5968 arr!308) i!761 (_1!10580 lt!362800)) (size!4993 arr!308)))))

(declare-fun readByte!0 (BitStream!9082) tuple2!19508)

(assert (=> b!227129 (= lt!362800 (readByte!0 thiss!1870))))

(declare-fun b!227130 () Bool)

(assert (=> b!227130 (= e!155362 (array_inv!4734 (buf!5534 thiss!1870)))))

(declare-fun b!227127 () Bool)

(declare-fun res!190563 () Bool)

(assert (=> b!227127 (=> (not res!190563) (not e!155360))))

(assert (=> b!227127 (= res!190563 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4993 (buf!5534 thiss!1870))) ((_ sign_extend 32) (currentByte!10372 thiss!1870)) ((_ sign_extend 32) (currentBit!10367 thiss!1870)) (bvsub to!496 i!761)))))

(assert (= (and start!47720 res!190562) b!227127))

(assert (= (and b!227127 res!190563) b!227128))

(assert (= (and b!227128 res!190564) b!227129))

(assert (= start!47720 b!227130))

(declare-fun m!349135 () Bool)

(assert (=> start!47720 m!349135))

(declare-fun m!349137 () Bool)

(assert (=> start!47720 m!349137))

(declare-fun m!349139 () Bool)

(assert (=> b!227129 m!349139))

(declare-fun m!349141 () Bool)

(assert (=> b!227129 m!349141))

(declare-fun m!349143 () Bool)

(assert (=> b!227129 m!349143))

(declare-fun m!349145 () Bool)

(assert (=> b!227129 m!349145))

(declare-fun m!349147 () Bool)

(assert (=> b!227129 m!349147))

(declare-fun m!349149 () Bool)

(assert (=> b!227129 m!349149))

(declare-fun m!349151 () Bool)

(assert (=> b!227129 m!349151))

(declare-fun m!349153 () Bool)

(assert (=> b!227129 m!349153))

(declare-fun m!349155 () Bool)

(assert (=> b!227129 m!349155))

(declare-fun m!349157 () Bool)

(assert (=> b!227129 m!349157))

(declare-fun m!349159 () Bool)

(assert (=> b!227130 m!349159))

(declare-fun m!349161 () Bool)

(assert (=> b!227127 m!349161))

(push 1)

(assert (not b!227127))

(assert (not b!227130))

(assert (not start!47720))

(assert (not b!227129))

(check-sat)

(pop 1)

(push 1)

(check-sat)

