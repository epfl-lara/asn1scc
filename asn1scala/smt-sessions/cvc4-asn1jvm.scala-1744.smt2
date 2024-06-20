; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47928 () Bool)

(assert start!47928)

(declare-fun b!227985 () Bool)

(declare-fun res!191249 () Bool)

(declare-fun e!156152 () Bool)

(assert (=> b!227985 (=> (not res!191249) (not e!156152))))

(declare-datatypes ((array!11487 0))(
  ( (array!11488 (arr!6021 (Array (_ BitVec 32) (_ BitVec 8))) (size!5040 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9176 0))(
  ( (BitStream!9177 (buf!5581 array!11487) (currentByte!10431 (_ BitVec 32)) (currentBit!10426 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9176)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227985 (= res!191249 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5040 (buf!5581 thiss!1870))) ((_ sign_extend 32) (currentByte!10431 thiss!1870)) ((_ sign_extend 32) (currentBit!10426 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!227987 () Bool)

(assert (=> b!227987 (= e!156152 (not (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand i!761 #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000)))))))

(declare-datatypes ((tuple2!19626 0))(
  ( (tuple2!19627 (_1!10686 (_ BitVec 8)) (_2!10686 BitStream!9176)) )
))
(declare-fun lt!365226 () tuple2!19626)

(declare-datatypes ((Unit!17087 0))(
  ( (Unit!17088) )
))
(declare-datatypes ((tuple3!1462 0))(
  ( (tuple3!1463 (_1!10687 Unit!17087) (_2!10687 BitStream!9176) (_3!873 array!11487)) )
))
(declare-fun lt!365217 () tuple3!1462)

(assert (=> b!227987 (and (= (_1!10686 lt!365226) (select (arr!6021 (_3!873 lt!365217)) i!761)) (= (select (arr!6021 (_3!873 lt!365217)) i!761) (_1!10686 lt!365226)))))

(declare-fun lt!365221 () array!11487)

(declare-fun lt!365222 () Unit!17087)

(declare-fun arrayRangesEqImpliesEq!132 (array!11487 array!11487 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17087)

(assert (=> b!227987 (= lt!365222 (arrayRangesEqImpliesEq!132 lt!365221 (_3!873 lt!365217) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun arr!308 () array!11487)

(declare-fun arrayRangesEq!876 (array!11487 array!11487 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227987 (arrayRangesEq!876 arr!308 (_3!873 lt!365217) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!365216 () Unit!17087)

(declare-fun arrayRangesEqTransitive!299 (array!11487 array!11487 array!11487 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17087)

(assert (=> b!227987 (= lt!365216 (arrayRangesEqTransitive!299 arr!308 lt!365221 (_3!873 lt!365217) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!227987 (arrayRangesEq!876 arr!308 lt!365221 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!365220 () Unit!17087)

(declare-fun arrayUpdatedAtPrefixLemma!435 (array!11487 (_ BitVec 32) (_ BitVec 8)) Unit!17087)

(assert (=> b!227987 (= lt!365220 (arrayUpdatedAtPrefixLemma!435 arr!308 i!761 (_1!10686 lt!365226)))))

(declare-fun lt!365218 () (_ BitVec 64))

(declare-fun lt!365219 () (_ BitVec 64))

(declare-fun lt!365225 () (_ BitVec 32))

(declare-fun lt!365223 () (_ BitVec 64))

(assert (=> b!227987 (and (= (bvadd lt!365219 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!365225))) lt!365218) (= (bvadd lt!365223 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!365218) (= (buf!5581 thiss!1870) (buf!5581 (_2!10687 lt!365217))) (= (size!5040 arr!308) (size!5040 (_3!873 lt!365217))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!227987 (= lt!365218 (bitIndex!0 (size!5040 (buf!5581 (_2!10687 lt!365217))) (currentByte!10431 (_2!10687 lt!365217)) (currentBit!10426 (_2!10687 lt!365217))))))

(assert (=> b!227987 (= lt!365219 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!365223))))

(assert (=> b!227987 (= lt!365219 (bitIndex!0 (size!5040 (buf!5581 (_2!10686 lt!365226))) (currentByte!10431 (_2!10686 lt!365226)) (currentBit!10426 (_2!10686 lt!365226))))))

(assert (=> b!227987 (= lt!365223 (bitIndex!0 (size!5040 (buf!5581 thiss!1870)) (currentByte!10431 thiss!1870) (currentBit!10426 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9176 array!11487 (_ BitVec 32) (_ BitVec 32)) tuple3!1462)

(assert (=> b!227987 (= lt!365217 (readByteArrayLoop!0 (_2!10686 lt!365226) lt!365221 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!227987 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5040 (buf!5581 (_2!10686 lt!365226)))) ((_ sign_extend 32) (currentByte!10431 (_2!10686 lt!365226))) ((_ sign_extend 32) (currentBit!10426 (_2!10686 lt!365226))) lt!365225)))

(assert (=> b!227987 (= lt!365225 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!365224 () Unit!17087)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9176 BitStream!9176 (_ BitVec 64) (_ BitVec 32)) Unit!17087)

(assert (=> b!227987 (= lt!365224 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10686 lt!365226) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!227987 (= lt!365221 (array!11488 (store (arr!6021 arr!308) i!761 (_1!10686 lt!365226)) (size!5040 arr!308)))))

(declare-fun readByte!0 (BitStream!9176) tuple2!19626)

(assert (=> b!227987 (= lt!365226 (readByte!0 thiss!1870))))

(declare-fun b!227986 () Bool)

(declare-fun res!191250 () Bool)

(assert (=> b!227986 (=> (not res!191250) (not e!156152))))

(assert (=> b!227986 (= res!191250 (bvslt i!761 to!496))))

(declare-fun res!191251 () Bool)

(assert (=> start!47928 (=> (not res!191251) (not e!156152))))

(assert (=> start!47928 (= res!191251 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5040 arr!308))))))

(assert (=> start!47928 e!156152))

(assert (=> start!47928 true))

(declare-fun array_inv!4781 (array!11487) Bool)

(assert (=> start!47928 (array_inv!4781 arr!308)))

(declare-fun e!156153 () Bool)

(declare-fun inv!12 (BitStream!9176) Bool)

(assert (=> start!47928 (and (inv!12 thiss!1870) e!156153)))

(declare-fun b!227988 () Bool)

(assert (=> b!227988 (= e!156153 (array_inv!4781 (buf!5581 thiss!1870)))))

(assert (= (and start!47928 res!191251) b!227985))

(assert (= (and b!227985 res!191249) b!227986))

(assert (= (and b!227986 res!191250) b!227987))

(assert (= start!47928 b!227988))

(declare-fun m!351103 () Bool)

(assert (=> b!227985 m!351103))

(declare-fun m!351105 () Bool)

(assert (=> b!227987 m!351105))

(declare-fun m!351107 () Bool)

(assert (=> b!227987 m!351107))

(declare-fun m!351109 () Bool)

(assert (=> b!227987 m!351109))

(declare-fun m!351111 () Bool)

(assert (=> b!227987 m!351111))

(declare-fun m!351113 () Bool)

(assert (=> b!227987 m!351113))

(declare-fun m!351115 () Bool)

(assert (=> b!227987 m!351115))

(declare-fun m!351117 () Bool)

(assert (=> b!227987 m!351117))

(declare-fun m!351119 () Bool)

(assert (=> b!227987 m!351119))

(declare-fun m!351121 () Bool)

(assert (=> b!227987 m!351121))

(declare-fun m!351123 () Bool)

(assert (=> b!227987 m!351123))

(declare-fun m!351125 () Bool)

(assert (=> b!227987 m!351125))

(declare-fun m!351127 () Bool)

(assert (=> b!227987 m!351127))

(declare-fun m!351129 () Bool)

(assert (=> b!227987 m!351129))

(declare-fun m!351131 () Bool)

(assert (=> b!227987 m!351131))

(declare-fun m!351133 () Bool)

(assert (=> start!47928 m!351133))

(declare-fun m!351135 () Bool)

(assert (=> start!47928 m!351135))

(declare-fun m!351137 () Bool)

(assert (=> b!227988 m!351137))

(push 1)

(assert (not b!227987))

(assert (not b!227985))

(assert (not start!47928))

(assert (not b!227988))

(check-sat)

(pop 1)

(push 1)

(check-sat)

