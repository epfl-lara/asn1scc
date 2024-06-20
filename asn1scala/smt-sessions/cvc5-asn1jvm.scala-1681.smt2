; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46736 () Bool)

(assert start!46736)

(declare-fun b!224195 () Bool)

(declare-fun res!188180 () Bool)

(declare-fun e!152736 () Bool)

(assert (=> b!224195 (=> (not res!188180) (not e!152736))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-datatypes ((array!11052 0))(
  ( (array!11053 (arr!5797 (Array (_ BitVec 32) (_ BitVec 8))) (size!4849 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8800 0))(
  ( (BitStream!8801 (buf!5393 array!11052) (currentByte!10121 (_ BitVec 32)) (currentBit!10116 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8800)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224195 (= res!188180 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4849 (buf!5393 thiss!1870))) ((_ sign_extend 32) (currentByte!10121 thiss!1870)) ((_ sign_extend 32) (currentBit!10116 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!188179 () Bool)

(assert (=> start!46736 (=> (not res!188179) (not e!152736))))

(declare-fun arr!308 () array!11052)

(assert (=> start!46736 (= res!188179 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4849 arr!308))))))

(assert (=> start!46736 e!152736))

(assert (=> start!46736 true))

(declare-fun array_inv!4590 (array!11052) Bool)

(assert (=> start!46736 (array_inv!4590 arr!308)))

(declare-fun e!152738 () Bool)

(declare-fun inv!12 (BitStream!8800) Bool)

(assert (=> start!46736 (and (inv!12 thiss!1870) e!152738)))

(declare-fun b!224196 () Bool)

(declare-fun res!188181 () Bool)

(assert (=> b!224196 (=> (not res!188181) (not e!152736))))

(assert (=> b!224196 (= res!188181 (bvslt i!761 to!496))))

(declare-fun b!224198 () Bool)

(assert (=> b!224198 (= e!152738 (array_inv!4590 (buf!5393 thiss!1870)))))

(declare-fun b!224197 () Bool)

(assert (=> b!224197 (= e!152736 (not true))))

(declare-datatypes ((Unit!16367 0))(
  ( (Unit!16368) )
))
(declare-datatypes ((tuple3!1224 0))(
  ( (tuple3!1225 (_1!10347 Unit!16367) (_2!10347 BitStream!8800) (_3!754 array!11052)) )
))
(declare-fun lt!355685 () tuple3!1224)

(declare-fun arrayRangesEq!745 (array!11052 array!11052 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224197 (arrayRangesEq!745 arr!308 (_3!754 lt!355685) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!355678 () Unit!16367)

(declare-fun lt!355682 () array!11052)

(declare-fun arrayRangesEqTransitive!216 (array!11052 array!11052 array!11052 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16367)

(assert (=> b!224197 (= lt!355678 (arrayRangesEqTransitive!216 arr!308 lt!355682 (_3!754 lt!355685) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!224197 (arrayRangesEq!745 arr!308 lt!355682 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((tuple2!19186 0))(
  ( (tuple2!19187 (_1!10348 (_ BitVec 8)) (_2!10348 BitStream!8800)) )
))
(declare-fun lt!355683 () tuple2!19186)

(declare-fun lt!355679 () Unit!16367)

(declare-fun arrayUpdatedAtPrefixLemma!337 (array!11052 (_ BitVec 32) (_ BitVec 8)) Unit!16367)

(assert (=> b!224197 (= lt!355679 (arrayUpdatedAtPrefixLemma!337 arr!308 i!761 (_1!10348 lt!355683)))))

(declare-fun lt!355677 () (_ BitVec 64))

(declare-fun lt!355686 () (_ BitVec 64))

(declare-fun lt!355680 () (_ BitVec 32))

(declare-fun lt!355684 () (_ BitVec 64))

(assert (=> b!224197 (and (= (bvadd lt!355684 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!355680))) lt!355677) (= (bvadd lt!355686 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!355677) (= (buf!5393 thiss!1870) (buf!5393 (_2!10347 lt!355685))) (= (size!4849 arr!308) (size!4849 (_3!754 lt!355685))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!224197 (= lt!355677 (bitIndex!0 (size!4849 (buf!5393 (_2!10347 lt!355685))) (currentByte!10121 (_2!10347 lt!355685)) (currentBit!10116 (_2!10347 lt!355685))))))

(assert (=> b!224197 (= lt!355684 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!355686))))

(assert (=> b!224197 (= lt!355684 (bitIndex!0 (size!4849 (buf!5393 (_2!10348 lt!355683))) (currentByte!10121 (_2!10348 lt!355683)) (currentBit!10116 (_2!10348 lt!355683))))))

(assert (=> b!224197 (= lt!355686 (bitIndex!0 (size!4849 (buf!5393 thiss!1870)) (currentByte!10121 thiss!1870) (currentBit!10116 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8800 array!11052 (_ BitVec 32) (_ BitVec 32)) tuple3!1224)

(assert (=> b!224197 (= lt!355685 (readByteArrayLoop!0 (_2!10348 lt!355683) lt!355682 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!224197 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4849 (buf!5393 (_2!10348 lt!355683)))) ((_ sign_extend 32) (currentByte!10121 (_2!10348 lt!355683))) ((_ sign_extend 32) (currentBit!10116 (_2!10348 lt!355683))) lt!355680)))

(assert (=> b!224197 (= lt!355680 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!355681 () Unit!16367)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8800 BitStream!8800 (_ BitVec 64) (_ BitVec 32)) Unit!16367)

(assert (=> b!224197 (= lt!355681 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10348 lt!355683) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!224197 (= lt!355682 (array!11053 (store (arr!5797 arr!308) i!761 (_1!10348 lt!355683)) (size!4849 arr!308)))))

(declare-fun readByte!0 (BitStream!8800) tuple2!19186)

(assert (=> b!224197 (= lt!355683 (readByte!0 thiss!1870))))

(assert (= (and start!46736 res!188179) b!224195))

(assert (= (and b!224195 res!188180) b!224196))

(assert (= (and b!224196 res!188181) b!224197))

(assert (= start!46736 b!224198))

(declare-fun m!343991 () Bool)

(assert (=> b!224195 m!343991))

(declare-fun m!343993 () Bool)

(assert (=> start!46736 m!343993))

(declare-fun m!343995 () Bool)

(assert (=> start!46736 m!343995))

(declare-fun m!343997 () Bool)

(assert (=> b!224198 m!343997))

(declare-fun m!343999 () Bool)

(assert (=> b!224197 m!343999))

(declare-fun m!344001 () Bool)

(assert (=> b!224197 m!344001))

(declare-fun m!344003 () Bool)

(assert (=> b!224197 m!344003))

(declare-fun m!344005 () Bool)

(assert (=> b!224197 m!344005))

(declare-fun m!344007 () Bool)

(assert (=> b!224197 m!344007))

(declare-fun m!344009 () Bool)

(assert (=> b!224197 m!344009))

(declare-fun m!344011 () Bool)

(assert (=> b!224197 m!344011))

(declare-fun m!344013 () Bool)

(assert (=> b!224197 m!344013))

(declare-fun m!344015 () Bool)

(assert (=> b!224197 m!344015))

(declare-fun m!344017 () Bool)

(assert (=> b!224197 m!344017))

(declare-fun m!344019 () Bool)

(assert (=> b!224197 m!344019))

(declare-fun m!344021 () Bool)

(assert (=> b!224197 m!344021))

(push 1)

(assert (not b!224197))

(assert (not b!224195))

(assert (not start!46736))

(assert (not b!224198))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

