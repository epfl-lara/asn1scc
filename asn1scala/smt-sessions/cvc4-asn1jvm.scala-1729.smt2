; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47724 () Bool)

(assert start!47724)

(declare-fun res!190581 () Bool)

(declare-fun e!155386 () Bool)

(assert (=> start!47724 (=> (not res!190581) (not e!155386))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-datatypes ((array!11391 0))(
  ( (array!11392 (arr!5970 (Array (_ BitVec 32) (_ BitVec 8))) (size!4995 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11391)

(assert (=> start!47724 (= res!190581 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4995 arr!308))))))

(assert (=> start!47724 e!155386))

(assert (=> start!47724 true))

(declare-fun array_inv!4736 (array!11391) Bool)

(assert (=> start!47724 (array_inv!4736 arr!308)))

(declare-datatypes ((BitStream!9086 0))(
  ( (BitStream!9087 (buf!5536 array!11391) (currentByte!10374 (_ BitVec 32)) (currentBit!10369 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9086)

(declare-fun e!155383 () Bool)

(declare-fun inv!12 (BitStream!9086) Bool)

(assert (=> start!47724 (and (inv!12 thiss!1870) e!155383)))

(declare-fun b!227154 () Bool)

(assert (=> b!227154 (= e!155383 (array_inv!4736 (buf!5536 thiss!1870)))))

(declare-fun b!227152 () Bool)

(declare-fun res!190582 () Bool)

(assert (=> b!227152 (=> (not res!190582) (not e!155386))))

(assert (=> b!227152 (= res!190582 (bvslt i!761 to!496))))

(declare-fun b!227153 () Bool)

(assert (=> b!227153 (= e!155386 (not (or (not (= (bvand i!761 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (= (bvand i!761 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)))))))

(declare-fun lt!362858 () array!11391)

(declare-fun arrayRangesEq!831 (array!11391 array!11391 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227153 (arrayRangesEq!831 arr!308 lt!362858 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((tuple2!19512 0))(
  ( (tuple2!19513 (_1!10584 (_ BitVec 8)) (_2!10584 BitStream!9086)) )
))
(declare-fun lt!362859 () tuple2!19512)

(declare-datatypes ((Unit!16933 0))(
  ( (Unit!16934) )
))
(declare-fun lt!362857 () Unit!16933)

(declare-fun arrayUpdatedAtPrefixLemma!390 (array!11391 (_ BitVec 32) (_ BitVec 8)) Unit!16933)

(assert (=> b!227153 (= lt!362857 (arrayUpdatedAtPrefixLemma!390 arr!308 i!761 (_1!10584 lt!362859)))))

(declare-fun lt!362854 () (_ BitVec 32))

(declare-datatypes ((tuple3!1372 0))(
  ( (tuple3!1373 (_1!10585 Unit!16933) (_2!10585 BitStream!9086) (_3!828 array!11391)) )
))
(declare-fun lt!362853 () tuple3!1372)

(declare-fun lt!362851 () (_ BitVec 64))

(declare-fun lt!362855 () (_ BitVec 64))

(declare-fun lt!362852 () (_ BitVec 64))

(assert (=> b!227153 (and (= (bvadd lt!362852 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!362854))) lt!362855) (= (bvadd lt!362851 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!362855) (= (buf!5536 thiss!1870) (buf!5536 (_2!10585 lt!362853))) (= (size!4995 arr!308) (size!4995 (_3!828 lt!362853))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!227153 (= lt!362855 (bitIndex!0 (size!4995 (buf!5536 (_2!10585 lt!362853))) (currentByte!10374 (_2!10585 lt!362853)) (currentBit!10369 (_2!10585 lt!362853))))))

(assert (=> b!227153 (= lt!362852 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!362851))))

(assert (=> b!227153 (= lt!362852 (bitIndex!0 (size!4995 (buf!5536 (_2!10584 lt!362859))) (currentByte!10374 (_2!10584 lt!362859)) (currentBit!10369 (_2!10584 lt!362859))))))

(assert (=> b!227153 (= lt!362851 (bitIndex!0 (size!4995 (buf!5536 thiss!1870)) (currentByte!10374 thiss!1870) (currentBit!10369 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9086 array!11391 (_ BitVec 32) (_ BitVec 32)) tuple3!1372)

(assert (=> b!227153 (= lt!362853 (readByteArrayLoop!0 (_2!10584 lt!362859) lt!362858 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227153 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4995 (buf!5536 (_2!10584 lt!362859)))) ((_ sign_extend 32) (currentByte!10374 (_2!10584 lt!362859))) ((_ sign_extend 32) (currentBit!10369 (_2!10584 lt!362859))) lt!362854)))

(assert (=> b!227153 (= lt!362854 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!362856 () Unit!16933)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9086 BitStream!9086 (_ BitVec 64) (_ BitVec 32)) Unit!16933)

(assert (=> b!227153 (= lt!362856 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10584 lt!362859) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!227153 (= lt!362858 (array!11392 (store (arr!5970 arr!308) i!761 (_1!10584 lt!362859)) (size!4995 arr!308)))))

(declare-fun readByte!0 (BitStream!9086) tuple2!19512)

(assert (=> b!227153 (= lt!362859 (readByte!0 thiss!1870))))

(declare-fun b!227151 () Bool)

(declare-fun res!190580 () Bool)

(assert (=> b!227151 (=> (not res!190580) (not e!155386))))

(assert (=> b!227151 (= res!190580 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4995 (buf!5536 thiss!1870))) ((_ sign_extend 32) (currentByte!10374 thiss!1870)) ((_ sign_extend 32) (currentBit!10369 thiss!1870)) (bvsub to!496 i!761)))))

(assert (= (and start!47724 res!190581) b!227151))

(assert (= (and b!227151 res!190580) b!227152))

(assert (= (and b!227152 res!190582) b!227153))

(assert (= start!47724 b!227154))

(declare-fun m!349191 () Bool)

(assert (=> start!47724 m!349191))

(declare-fun m!349193 () Bool)

(assert (=> start!47724 m!349193))

(declare-fun m!349195 () Bool)

(assert (=> b!227154 m!349195))

(declare-fun m!349197 () Bool)

(assert (=> b!227153 m!349197))

(declare-fun m!349199 () Bool)

(assert (=> b!227153 m!349199))

(declare-fun m!349201 () Bool)

(assert (=> b!227153 m!349201))

(declare-fun m!349203 () Bool)

(assert (=> b!227153 m!349203))

(declare-fun m!349205 () Bool)

(assert (=> b!227153 m!349205))

(declare-fun m!349207 () Bool)

(assert (=> b!227153 m!349207))

(declare-fun m!349209 () Bool)

(assert (=> b!227153 m!349209))

(declare-fun m!349211 () Bool)

(assert (=> b!227153 m!349211))

(declare-fun m!349213 () Bool)

(assert (=> b!227153 m!349213))

(declare-fun m!349215 () Bool)

(assert (=> b!227153 m!349215))

(declare-fun m!349217 () Bool)

(assert (=> b!227151 m!349217))

(push 1)

(assert (not b!227154))

(assert (not start!47724))

(assert (not b!227153))

(assert (not b!227151))

(check-sat)

(pop 1)

(push 1)

(check-sat)

