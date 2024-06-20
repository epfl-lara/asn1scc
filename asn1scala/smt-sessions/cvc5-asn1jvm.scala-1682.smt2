; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46742 () Bool)

(assert start!46742)

(declare-fun b!224231 () Bool)

(declare-fun res!188208 () Bool)

(declare-fun e!152771 () Bool)

(assert (=> b!224231 (=> (not res!188208) (not e!152771))))

(declare-datatypes ((array!11058 0))(
  ( (array!11059 (arr!5800 (Array (_ BitVec 32) (_ BitVec 8))) (size!4852 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8806 0))(
  ( (BitStream!8807 (buf!5396 array!11058) (currentByte!10124 (_ BitVec 32)) (currentBit!10119 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8806)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224231 (= res!188208 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4852 (buf!5396 thiss!1870))) ((_ sign_extend 32) (currentByte!10124 thiss!1870)) ((_ sign_extend 32) (currentBit!10119 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!224234 () Bool)

(declare-fun e!152773 () Bool)

(declare-fun array_inv!4593 (array!11058) Bool)

(assert (=> b!224234 (= e!152773 (array_inv!4593 (buf!5396 thiss!1870)))))

(declare-fun res!188207 () Bool)

(assert (=> start!46742 (=> (not res!188207) (not e!152771))))

(declare-fun arr!308 () array!11058)

(assert (=> start!46742 (= res!188207 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4852 arr!308))))))

(assert (=> start!46742 e!152771))

(assert (=> start!46742 true))

(assert (=> start!46742 (array_inv!4593 arr!308)))

(declare-fun inv!12 (BitStream!8806) Bool)

(assert (=> start!46742 (and (inv!12 thiss!1870) e!152773)))

(declare-fun b!224232 () Bool)

(declare-fun res!188206 () Bool)

(assert (=> b!224232 (=> (not res!188206) (not e!152771))))

(assert (=> b!224232 (= res!188206 (bvslt i!761 to!496))))

(declare-fun b!224233 () Bool)

(assert (=> b!224233 (= e!152771 (not true))))

(declare-datatypes ((Unit!16373 0))(
  ( (Unit!16374) )
))
(declare-datatypes ((tuple3!1230 0))(
  ( (tuple3!1231 (_1!10353 Unit!16373) (_2!10353 BitStream!8806) (_3!757 array!11058)) )
))
(declare-fun lt!355769 () tuple3!1230)

(declare-fun arrayRangesEq!748 (array!11058 array!11058 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224233 (arrayRangesEq!748 arr!308 (_3!757 lt!355769) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!355773 () array!11058)

(declare-fun lt!355774 () Unit!16373)

(declare-fun arrayRangesEqTransitive!219 (array!11058 array!11058 array!11058 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16373)

(assert (=> b!224233 (= lt!355774 (arrayRangesEqTransitive!219 arr!308 lt!355773 (_3!757 lt!355769) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!224233 (arrayRangesEq!748 arr!308 lt!355773 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!355770 () Unit!16373)

(declare-datatypes ((tuple2!19192 0))(
  ( (tuple2!19193 (_1!10354 (_ BitVec 8)) (_2!10354 BitStream!8806)) )
))
(declare-fun lt!355767 () tuple2!19192)

(declare-fun arrayUpdatedAtPrefixLemma!340 (array!11058 (_ BitVec 32) (_ BitVec 8)) Unit!16373)

(assert (=> b!224233 (= lt!355770 (arrayUpdatedAtPrefixLemma!340 arr!308 i!761 (_1!10354 lt!355767)))))

(declare-fun lt!355775 () (_ BitVec 64))

(declare-fun lt!355772 () (_ BitVec 32))

(declare-fun lt!355771 () (_ BitVec 64))

(declare-fun lt!355776 () (_ BitVec 64))

(assert (=> b!224233 (and (= (bvadd lt!355776 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!355772))) lt!355771) (= (bvadd lt!355775 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!355771) (= (buf!5396 thiss!1870) (buf!5396 (_2!10353 lt!355769))) (= (size!4852 arr!308) (size!4852 (_3!757 lt!355769))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!224233 (= lt!355771 (bitIndex!0 (size!4852 (buf!5396 (_2!10353 lt!355769))) (currentByte!10124 (_2!10353 lt!355769)) (currentBit!10119 (_2!10353 lt!355769))))))

(assert (=> b!224233 (= lt!355776 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!355775))))

(assert (=> b!224233 (= lt!355776 (bitIndex!0 (size!4852 (buf!5396 (_2!10354 lt!355767))) (currentByte!10124 (_2!10354 lt!355767)) (currentBit!10119 (_2!10354 lt!355767))))))

(assert (=> b!224233 (= lt!355775 (bitIndex!0 (size!4852 (buf!5396 thiss!1870)) (currentByte!10124 thiss!1870) (currentBit!10119 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8806 array!11058 (_ BitVec 32) (_ BitVec 32)) tuple3!1230)

(assert (=> b!224233 (= lt!355769 (readByteArrayLoop!0 (_2!10354 lt!355767) lt!355773 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!224233 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4852 (buf!5396 (_2!10354 lt!355767)))) ((_ sign_extend 32) (currentByte!10124 (_2!10354 lt!355767))) ((_ sign_extend 32) (currentBit!10119 (_2!10354 lt!355767))) lt!355772)))

(assert (=> b!224233 (= lt!355772 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!355768 () Unit!16373)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8806 BitStream!8806 (_ BitVec 64) (_ BitVec 32)) Unit!16373)

(assert (=> b!224233 (= lt!355768 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10354 lt!355767) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!224233 (= lt!355773 (array!11059 (store (arr!5800 arr!308) i!761 (_1!10354 lt!355767)) (size!4852 arr!308)))))

(declare-fun readByte!0 (BitStream!8806) tuple2!19192)

(assert (=> b!224233 (= lt!355767 (readByte!0 thiss!1870))))

(assert (= (and start!46742 res!188207) b!224231))

(assert (= (and b!224231 res!188208) b!224232))

(assert (= (and b!224232 res!188206) b!224233))

(assert (= start!46742 b!224234))

(declare-fun m!344087 () Bool)

(assert (=> b!224231 m!344087))

(declare-fun m!344089 () Bool)

(assert (=> b!224234 m!344089))

(declare-fun m!344091 () Bool)

(assert (=> start!46742 m!344091))

(declare-fun m!344093 () Bool)

(assert (=> start!46742 m!344093))

(declare-fun m!344095 () Bool)

(assert (=> b!224233 m!344095))

(declare-fun m!344097 () Bool)

(assert (=> b!224233 m!344097))

(declare-fun m!344099 () Bool)

(assert (=> b!224233 m!344099))

(declare-fun m!344101 () Bool)

(assert (=> b!224233 m!344101))

(declare-fun m!344103 () Bool)

(assert (=> b!224233 m!344103))

(declare-fun m!344105 () Bool)

(assert (=> b!224233 m!344105))

(declare-fun m!344107 () Bool)

(assert (=> b!224233 m!344107))

(declare-fun m!344109 () Bool)

(assert (=> b!224233 m!344109))

(declare-fun m!344111 () Bool)

(assert (=> b!224233 m!344111))

(declare-fun m!344113 () Bool)

(assert (=> b!224233 m!344113))

(declare-fun m!344115 () Bool)

(assert (=> b!224233 m!344115))

(declare-fun m!344117 () Bool)

(assert (=> b!224233 m!344117))

(push 1)

(assert (not b!224231))

(assert (not start!46742))

(assert (not b!224234))

(assert (not b!224233))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

