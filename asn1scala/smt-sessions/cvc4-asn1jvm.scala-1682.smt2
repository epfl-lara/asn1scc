; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46746 () Bool)

(assert start!46746)

(declare-fun b!224257 () Bool)

(declare-fun e!152795 () Bool)

(assert (=> b!224257 (= e!152795 (not true))))

(declare-datatypes ((array!11062 0))(
  ( (array!11063 (arr!5802 (Array (_ BitVec 32) (_ BitVec 8))) (size!4854 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11062)

(declare-datatypes ((BitStream!8810 0))(
  ( (BitStream!8811 (buf!5398 array!11062) (currentByte!10126 (_ BitVec 32)) (currentBit!10121 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!16377 0))(
  ( (Unit!16378) )
))
(declare-datatypes ((tuple3!1234 0))(
  ( (tuple3!1235 (_1!10357 Unit!16377) (_2!10357 BitStream!8810) (_3!759 array!11062)) )
))
(declare-fun lt!355827 () tuple3!1234)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun arrayRangesEq!750 (array!11062 array!11062 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224257 (arrayRangesEq!750 arr!308 (_3!759 lt!355827) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!355831 () array!11062)

(declare-fun lt!355833 () Unit!16377)

(declare-fun arrayRangesEqTransitive!221 (array!11062 array!11062 array!11062 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16377)

(assert (=> b!224257 (= lt!355833 (arrayRangesEqTransitive!221 arr!308 lt!355831 (_3!759 lt!355827) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!224257 (arrayRangesEq!750 arr!308 lt!355831 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!355836 () Unit!16377)

(declare-datatypes ((tuple2!19196 0))(
  ( (tuple2!19197 (_1!10358 (_ BitVec 8)) (_2!10358 BitStream!8810)) )
))
(declare-fun lt!355832 () tuple2!19196)

(declare-fun arrayUpdatedAtPrefixLemma!342 (array!11062 (_ BitVec 32) (_ BitVec 8)) Unit!16377)

(assert (=> b!224257 (= lt!355836 (arrayUpdatedAtPrefixLemma!342 arr!308 i!761 (_1!10358 lt!355832)))))

(declare-fun lt!355830 () (_ BitVec 64))

(declare-fun lt!355829 () (_ BitVec 32))

(declare-fun thiss!1870 () BitStream!8810)

(declare-fun to!496 () (_ BitVec 32))

(declare-fun lt!355828 () (_ BitVec 64))

(declare-fun lt!355834 () (_ BitVec 64))

(assert (=> b!224257 (and (= (bvadd lt!355830 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!355829))) lt!355828) (= (bvadd lt!355834 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!355828) (= (buf!5398 thiss!1870) (buf!5398 (_2!10357 lt!355827))) (= (size!4854 arr!308) (size!4854 (_3!759 lt!355827))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!224257 (= lt!355828 (bitIndex!0 (size!4854 (buf!5398 (_2!10357 lt!355827))) (currentByte!10126 (_2!10357 lt!355827)) (currentBit!10121 (_2!10357 lt!355827))))))

(assert (=> b!224257 (= lt!355830 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!355834))))

(assert (=> b!224257 (= lt!355830 (bitIndex!0 (size!4854 (buf!5398 (_2!10358 lt!355832))) (currentByte!10126 (_2!10358 lt!355832)) (currentBit!10121 (_2!10358 lt!355832))))))

(assert (=> b!224257 (= lt!355834 (bitIndex!0 (size!4854 (buf!5398 thiss!1870)) (currentByte!10126 thiss!1870) (currentBit!10121 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8810 array!11062 (_ BitVec 32) (_ BitVec 32)) tuple3!1234)

(assert (=> b!224257 (= lt!355827 (readByteArrayLoop!0 (_2!10358 lt!355832) lt!355831 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224257 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4854 (buf!5398 (_2!10358 lt!355832)))) ((_ sign_extend 32) (currentByte!10126 (_2!10358 lt!355832))) ((_ sign_extend 32) (currentBit!10121 (_2!10358 lt!355832))) lt!355829)))

(assert (=> b!224257 (= lt!355829 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!355835 () Unit!16377)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8810 BitStream!8810 (_ BitVec 64) (_ BitVec 32)) Unit!16377)

(assert (=> b!224257 (= lt!355835 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10358 lt!355832) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!224257 (= lt!355831 (array!11063 (store (arr!5802 arr!308) i!761 (_1!10358 lt!355832)) (size!4854 arr!308)))))

(declare-fun readByte!0 (BitStream!8810) tuple2!19196)

(assert (=> b!224257 (= lt!355832 (readByte!0 thiss!1870))))

(declare-fun res!188224 () Bool)

(assert (=> start!46746 (=> (not res!188224) (not e!152795))))

(assert (=> start!46746 (= res!188224 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4854 arr!308))))))

(assert (=> start!46746 e!152795))

(assert (=> start!46746 true))

(declare-fun array_inv!4595 (array!11062) Bool)

(assert (=> start!46746 (array_inv!4595 arr!308)))

(declare-fun e!152796 () Bool)

(declare-fun inv!12 (BitStream!8810) Bool)

(assert (=> start!46746 (and (inv!12 thiss!1870) e!152796)))

(declare-fun b!224258 () Bool)

(assert (=> b!224258 (= e!152796 (array_inv!4595 (buf!5398 thiss!1870)))))

(declare-fun b!224255 () Bool)

(declare-fun res!188226 () Bool)

(assert (=> b!224255 (=> (not res!188226) (not e!152795))))

(assert (=> b!224255 (= res!188226 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4854 (buf!5398 thiss!1870))) ((_ sign_extend 32) (currentByte!10126 thiss!1870)) ((_ sign_extend 32) (currentBit!10121 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!224256 () Bool)

(declare-fun res!188225 () Bool)

(assert (=> b!224256 (=> (not res!188225) (not e!152795))))

(assert (=> b!224256 (= res!188225 (bvslt i!761 to!496))))

(assert (= (and start!46746 res!188224) b!224255))

(assert (= (and b!224255 res!188226) b!224256))

(assert (= (and b!224256 res!188225) b!224257))

(assert (= start!46746 b!224258))

(declare-fun m!344151 () Bool)

(assert (=> b!224257 m!344151))

(declare-fun m!344153 () Bool)

(assert (=> b!224257 m!344153))

(declare-fun m!344155 () Bool)

(assert (=> b!224257 m!344155))

(declare-fun m!344157 () Bool)

(assert (=> b!224257 m!344157))

(declare-fun m!344159 () Bool)

(assert (=> b!224257 m!344159))

(declare-fun m!344161 () Bool)

(assert (=> b!224257 m!344161))

(declare-fun m!344163 () Bool)

(assert (=> b!224257 m!344163))

(declare-fun m!344165 () Bool)

(assert (=> b!224257 m!344165))

(declare-fun m!344167 () Bool)

(assert (=> b!224257 m!344167))

(declare-fun m!344169 () Bool)

(assert (=> b!224257 m!344169))

(declare-fun m!344171 () Bool)

(assert (=> b!224257 m!344171))

(declare-fun m!344173 () Bool)

(assert (=> b!224257 m!344173))

(declare-fun m!344175 () Bool)

(assert (=> start!46746 m!344175))

(declare-fun m!344177 () Bool)

(assert (=> start!46746 m!344177))

(declare-fun m!344179 () Bool)

(assert (=> b!224258 m!344179))

(declare-fun m!344181 () Bool)

(assert (=> b!224255 m!344181))

(push 1)

(assert (not start!46746))

(assert (not b!224258))

(assert (not b!224257))

