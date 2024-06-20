; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47922 () Bool)

(assert start!47922)

(declare-datatypes ((array!11481 0))(
  ( (array!11482 (arr!6018 (Array (_ BitVec 32) (_ BitVec 8))) (size!5037 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9170 0))(
  ( (BitStream!9171 (buf!5578 array!11481) (currentByte!10428 (_ BitVec 32)) (currentBit!10423 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!17081 0))(
  ( (Unit!17082) )
))
(declare-datatypes ((tuple3!1456 0))(
  ( (tuple3!1457 (_1!10680 Unit!17081) (_2!10680 BitStream!9170) (_3!870 array!11481)) )
))
(declare-fun lt!365123 () tuple3!1456)

(declare-fun e!156116 () Bool)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun b!227951 () Bool)

(declare-datatypes ((tuple2!19620 0))(
  ( (tuple2!19621 (_1!10681 (_ BitVec 8)) (_2!10681 BitStream!9170)) )
))
(declare-fun lt!365120 () tuple2!19620)

(assert (=> b!227951 (= e!156116 (not (= (select (arr!6018 (_3!870 lt!365123)) i!761) (_1!10681 lt!365120))))))

(assert (=> b!227951 (= (_1!10681 lt!365120) (select (arr!6018 (_3!870 lt!365123)) i!761))))

(declare-fun lt!365117 () Unit!17081)

(declare-fun lt!365126 () array!11481)

(declare-fun arrayRangesEqImpliesEq!129 (array!11481 array!11481 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17081)

(assert (=> b!227951 (= lt!365117 (arrayRangesEqImpliesEq!129 lt!365126 (_3!870 lt!365123) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun arr!308 () array!11481)

(declare-fun arrayRangesEq!873 (array!11481 array!11481 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227951 (arrayRangesEq!873 arr!308 (_3!870 lt!365123) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!365127 () Unit!17081)

(declare-fun arrayRangesEqTransitive!296 (array!11481 array!11481 array!11481 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17081)

(assert (=> b!227951 (= lt!365127 (arrayRangesEqTransitive!296 arr!308 lt!365126 (_3!870 lt!365123) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!227951 (arrayRangesEq!873 arr!308 lt!365126 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!365118 () Unit!17081)

(declare-fun arrayUpdatedAtPrefixLemma!432 (array!11481 (_ BitVec 32) (_ BitVec 8)) Unit!17081)

(assert (=> b!227951 (= lt!365118 (arrayUpdatedAtPrefixLemma!432 arr!308 i!761 (_1!10681 lt!365120)))))

(declare-fun lt!365124 () (_ BitVec 32))

(declare-fun lt!365125 () (_ BitVec 64))

(declare-fun lt!365119 () (_ BitVec 64))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun lt!365121 () (_ BitVec 64))

(declare-fun thiss!1870 () BitStream!9170)

(assert (=> b!227951 (and (= (bvadd lt!365125 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!365124))) lt!365119) (= (bvadd lt!365121 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!365119) (= (buf!5578 thiss!1870) (buf!5578 (_2!10680 lt!365123))) (= (size!5037 arr!308) (size!5037 (_3!870 lt!365123))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!227951 (= lt!365119 (bitIndex!0 (size!5037 (buf!5578 (_2!10680 lt!365123))) (currentByte!10428 (_2!10680 lt!365123)) (currentBit!10423 (_2!10680 lt!365123))))))

(assert (=> b!227951 (= lt!365125 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!365121))))

(assert (=> b!227951 (= lt!365125 (bitIndex!0 (size!5037 (buf!5578 (_2!10681 lt!365120))) (currentByte!10428 (_2!10681 lt!365120)) (currentBit!10423 (_2!10681 lt!365120))))))

(assert (=> b!227951 (= lt!365121 (bitIndex!0 (size!5037 (buf!5578 thiss!1870)) (currentByte!10428 thiss!1870) (currentBit!10423 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9170 array!11481 (_ BitVec 32) (_ BitVec 32)) tuple3!1456)

(assert (=> b!227951 (= lt!365123 (readByteArrayLoop!0 (_2!10681 lt!365120) lt!365126 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227951 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5037 (buf!5578 (_2!10681 lt!365120)))) ((_ sign_extend 32) (currentByte!10428 (_2!10681 lt!365120))) ((_ sign_extend 32) (currentBit!10423 (_2!10681 lt!365120))) lt!365124)))

(assert (=> b!227951 (= lt!365124 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!365122 () Unit!17081)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9170 BitStream!9170 (_ BitVec 64) (_ BitVec 32)) Unit!17081)

(assert (=> b!227951 (= lt!365122 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10681 lt!365120) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!227951 (= lt!365126 (array!11482 (store (arr!6018 arr!308) i!761 (_1!10681 lt!365120)) (size!5037 arr!308)))))

(declare-fun readByte!0 (BitStream!9170) tuple2!19620)

(assert (=> b!227951 (= lt!365120 (readByte!0 thiss!1870))))

(declare-fun b!227949 () Bool)

(declare-fun res!191224 () Bool)

(assert (=> b!227949 (=> (not res!191224) (not e!156116))))

(assert (=> b!227949 (= res!191224 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5037 (buf!5578 thiss!1870))) ((_ sign_extend 32) (currentByte!10428 thiss!1870)) ((_ sign_extend 32) (currentBit!10423 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!227950 () Bool)

(declare-fun res!191223 () Bool)

(assert (=> b!227950 (=> (not res!191223) (not e!156116))))

(assert (=> b!227950 (= res!191223 (bvslt i!761 to!496))))

(declare-fun b!227952 () Bool)

(declare-fun e!156118 () Bool)

(declare-fun array_inv!4778 (array!11481) Bool)

(assert (=> b!227952 (= e!156118 (array_inv!4778 (buf!5578 thiss!1870)))))

(declare-fun res!191222 () Bool)

(assert (=> start!47922 (=> (not res!191222) (not e!156116))))

(assert (=> start!47922 (= res!191222 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5037 arr!308))))))

(assert (=> start!47922 e!156116))

(assert (=> start!47922 true))

(assert (=> start!47922 (array_inv!4778 arr!308)))

(declare-fun inv!12 (BitStream!9170) Bool)

(assert (=> start!47922 (and (inv!12 thiss!1870) e!156118)))

(assert (= (and start!47922 res!191222) b!227949))

(assert (= (and b!227949 res!191224) b!227950))

(assert (= (and b!227950 res!191223) b!227951))

(assert (= start!47922 b!227952))

(declare-fun m!350995 () Bool)

(assert (=> b!227951 m!350995))

(declare-fun m!350997 () Bool)

(assert (=> b!227951 m!350997))

(declare-fun m!350999 () Bool)

(assert (=> b!227951 m!350999))

(declare-fun m!351001 () Bool)

(assert (=> b!227951 m!351001))

(declare-fun m!351003 () Bool)

(assert (=> b!227951 m!351003))

(declare-fun m!351005 () Bool)

(assert (=> b!227951 m!351005))

(declare-fun m!351007 () Bool)

(assert (=> b!227951 m!351007))

(declare-fun m!351009 () Bool)

(assert (=> b!227951 m!351009))

(declare-fun m!351011 () Bool)

(assert (=> b!227951 m!351011))

(declare-fun m!351013 () Bool)

(assert (=> b!227951 m!351013))

(declare-fun m!351015 () Bool)

(assert (=> b!227951 m!351015))

(declare-fun m!351017 () Bool)

(assert (=> b!227951 m!351017))

(declare-fun m!351019 () Bool)

(assert (=> b!227951 m!351019))

(declare-fun m!351021 () Bool)

(assert (=> b!227951 m!351021))

(declare-fun m!351023 () Bool)

(assert (=> b!227949 m!351023))

(declare-fun m!351025 () Bool)

(assert (=> b!227952 m!351025))

(declare-fun m!351027 () Bool)

(assert (=> start!47922 m!351027))

(declare-fun m!351029 () Bool)

(assert (=> start!47922 m!351029))

(push 1)

(assert (not b!227951))

(assert (not start!47922))

(assert (not b!227949))

(assert (not b!227952))

(check-sat)

(pop 1)

