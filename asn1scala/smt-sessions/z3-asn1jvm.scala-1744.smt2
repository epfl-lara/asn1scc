; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47926 () Bool)

(assert start!47926)

(declare-fun b!227973 () Bool)

(declare-fun res!191240 () Bool)

(declare-fun e!156139 () Bool)

(assert (=> b!227973 (=> (not res!191240) (not e!156139))))

(declare-datatypes ((array!11485 0))(
  ( (array!11486 (arr!6020 (Array (_ BitVec 32) (_ BitVec 8))) (size!5039 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9174 0))(
  ( (BitStream!9175 (buf!5580 array!11485) (currentByte!10430 (_ BitVec 32)) (currentBit!10425 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9174)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227973 (= res!191240 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5039 (buf!5580 thiss!1870))) ((_ sign_extend 32) (currentByte!10430 thiss!1870)) ((_ sign_extend 32) (currentBit!10425 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!227976 () Bool)

(declare-fun e!156142 () Bool)

(declare-fun array_inv!4780 (array!11485) Bool)

(assert (=> b!227976 (= e!156142 (array_inv!4780 (buf!5580 thiss!1870)))))

(declare-fun res!191242 () Bool)

(assert (=> start!47926 (=> (not res!191242) (not e!156139))))

(declare-fun arr!308 () array!11485)

(assert (=> start!47926 (= res!191242 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5039 arr!308))))))

(assert (=> start!47926 e!156139))

(assert (=> start!47926 true))

(assert (=> start!47926 (array_inv!4780 arr!308)))

(declare-fun inv!12 (BitStream!9174) Bool)

(assert (=> start!47926 (and (inv!12 thiss!1870) e!156142)))

(declare-fun b!227975 () Bool)

(assert (=> b!227975 (= e!156139 (not (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand i!761 #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000)))))))

(declare-datatypes ((tuple2!19624 0))(
  ( (tuple2!19625 (_1!10684 (_ BitVec 8)) (_2!10684 BitStream!9174)) )
))
(declare-fun lt!365186 () tuple2!19624)

(declare-datatypes ((Unit!17085 0))(
  ( (Unit!17086) )
))
(declare-datatypes ((tuple3!1460 0))(
  ( (tuple3!1461 (_1!10685 Unit!17085) (_2!10685 BitStream!9174) (_3!872 array!11485)) )
))
(declare-fun lt!365191 () tuple3!1460)

(assert (=> b!227975 (and (= (_1!10684 lt!365186) (select (arr!6020 (_3!872 lt!365191)) i!761)) (= (select (arr!6020 (_3!872 lt!365191)) i!761) (_1!10684 lt!365186)))))

(declare-fun lt!365188 () Unit!17085)

(declare-fun lt!365193 () array!11485)

(declare-fun arrayRangesEqImpliesEq!131 (array!11485 array!11485 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17085)

(assert (=> b!227975 (= lt!365188 (arrayRangesEqImpliesEq!131 lt!365193 (_3!872 lt!365191) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun arrayRangesEq!875 (array!11485 array!11485 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227975 (arrayRangesEq!875 arr!308 (_3!872 lt!365191) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!365183 () Unit!17085)

(declare-fun arrayRangesEqTransitive!298 (array!11485 array!11485 array!11485 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17085)

(assert (=> b!227975 (= lt!365183 (arrayRangesEqTransitive!298 arr!308 lt!365193 (_3!872 lt!365191) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!227975 (arrayRangesEq!875 arr!308 lt!365193 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!365184 () Unit!17085)

(declare-fun arrayUpdatedAtPrefixLemma!434 (array!11485 (_ BitVec 32) (_ BitVec 8)) Unit!17085)

(assert (=> b!227975 (= lt!365184 (arrayUpdatedAtPrefixLemma!434 arr!308 i!761 (_1!10684 lt!365186)))))

(declare-fun lt!365190 () (_ BitVec 32))

(declare-fun lt!365189 () (_ BitVec 64))

(declare-fun lt!365185 () (_ BitVec 64))

(declare-fun lt!365192 () (_ BitVec 64))

(assert (=> b!227975 (and (= (bvadd lt!365192 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!365190))) lt!365189) (= (bvadd lt!365185 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!365189) (= (buf!5580 thiss!1870) (buf!5580 (_2!10685 lt!365191))) (= (size!5039 arr!308) (size!5039 (_3!872 lt!365191))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!227975 (= lt!365189 (bitIndex!0 (size!5039 (buf!5580 (_2!10685 lt!365191))) (currentByte!10430 (_2!10685 lt!365191)) (currentBit!10425 (_2!10685 lt!365191))))))

(assert (=> b!227975 (= lt!365192 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!365185))))

(assert (=> b!227975 (= lt!365192 (bitIndex!0 (size!5039 (buf!5580 (_2!10684 lt!365186))) (currentByte!10430 (_2!10684 lt!365186)) (currentBit!10425 (_2!10684 lt!365186))))))

(assert (=> b!227975 (= lt!365185 (bitIndex!0 (size!5039 (buf!5580 thiss!1870)) (currentByte!10430 thiss!1870) (currentBit!10425 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9174 array!11485 (_ BitVec 32) (_ BitVec 32)) tuple3!1460)

(assert (=> b!227975 (= lt!365191 (readByteArrayLoop!0 (_2!10684 lt!365186) lt!365193 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!227975 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5039 (buf!5580 (_2!10684 lt!365186)))) ((_ sign_extend 32) (currentByte!10430 (_2!10684 lt!365186))) ((_ sign_extend 32) (currentBit!10425 (_2!10684 lt!365186))) lt!365190)))

(assert (=> b!227975 (= lt!365190 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!365187 () Unit!17085)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9174 BitStream!9174 (_ BitVec 64) (_ BitVec 32)) Unit!17085)

(assert (=> b!227975 (= lt!365187 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10684 lt!365186) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!227975 (= lt!365193 (array!11486 (store (arr!6020 arr!308) i!761 (_1!10684 lt!365186)) (size!5039 arr!308)))))

(declare-fun readByte!0 (BitStream!9174) tuple2!19624)

(assert (=> b!227975 (= lt!365186 (readByte!0 thiss!1870))))

(declare-fun b!227974 () Bool)

(declare-fun res!191241 () Bool)

(assert (=> b!227974 (=> (not res!191241) (not e!156139))))

(assert (=> b!227974 (= res!191241 (bvslt i!761 to!496))))

(assert (= (and start!47926 res!191242) b!227973))

(assert (= (and b!227973 res!191240) b!227974))

(assert (= (and b!227974 res!191241) b!227975))

(assert (= start!47926 b!227976))

(declare-fun m!351067 () Bool)

(assert (=> b!227973 m!351067))

(declare-fun m!351069 () Bool)

(assert (=> b!227976 m!351069))

(declare-fun m!351071 () Bool)

(assert (=> start!47926 m!351071))

(declare-fun m!351073 () Bool)

(assert (=> start!47926 m!351073))

(declare-fun m!351075 () Bool)

(assert (=> b!227975 m!351075))

(declare-fun m!351077 () Bool)

(assert (=> b!227975 m!351077))

(declare-fun m!351079 () Bool)

(assert (=> b!227975 m!351079))

(declare-fun m!351081 () Bool)

(assert (=> b!227975 m!351081))

(declare-fun m!351083 () Bool)

(assert (=> b!227975 m!351083))

(declare-fun m!351085 () Bool)

(assert (=> b!227975 m!351085))

(declare-fun m!351087 () Bool)

(assert (=> b!227975 m!351087))

(declare-fun m!351089 () Bool)

(assert (=> b!227975 m!351089))

(declare-fun m!351091 () Bool)

(assert (=> b!227975 m!351091))

(declare-fun m!351093 () Bool)

(assert (=> b!227975 m!351093))

(declare-fun m!351095 () Bool)

(assert (=> b!227975 m!351095))

(declare-fun m!351097 () Bool)

(assert (=> b!227975 m!351097))

(declare-fun m!351099 () Bool)

(assert (=> b!227975 m!351099))

(declare-fun m!351101 () Bool)

(assert (=> b!227975 m!351101))

(check-sat (not b!227976) (not start!47926) (not b!227975) (not b!227973))
(check-sat)
