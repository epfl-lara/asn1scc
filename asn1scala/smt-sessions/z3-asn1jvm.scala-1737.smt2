; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47824 () Bool)

(assert start!47824)

(declare-fun b!227573 () Bool)

(declare-fun e!155771 () Bool)

(declare-fun i!761 () (_ BitVec 32))

(assert (=> b!227573 (= e!155771 (not (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761))))))

(declare-datatypes ((array!11440 0))(
  ( (array!11441 (arr!5996 (Array (_ BitVec 32) (_ BitVec 8))) (size!5018 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11440)

(declare-datatypes ((BitStream!9132 0))(
  ( (BitStream!9133 (buf!5559 array!11440) (currentByte!10403 (_ BitVec 32)) (currentBit!10398 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!17010 0))(
  ( (Unit!17011) )
))
(declare-datatypes ((tuple3!1418 0))(
  ( (tuple3!1419 (_1!10636 Unit!17010) (_2!10636 BitStream!9132) (_3!851 array!11440)) )
))
(declare-fun lt!364011 () tuple3!1418)

(declare-fun arrayRangesEq!854 (array!11440 array!11440 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227573 (arrayRangesEq!854 arr!308 (_3!851 lt!364011) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!364010 () array!11440)

(declare-fun lt!364016 () Unit!17010)

(declare-fun arrayRangesEqTransitive!277 (array!11440 array!11440 array!11440 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17010)

(assert (=> b!227573 (= lt!364016 (arrayRangesEqTransitive!277 arr!308 lt!364010 (_3!851 lt!364011) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!227573 (arrayRangesEq!854 arr!308 lt!364010 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((tuple2!19570 0))(
  ( (tuple2!19571 (_1!10637 (_ BitVec 8)) (_2!10637 BitStream!9132)) )
))
(declare-fun lt!364008 () tuple2!19570)

(declare-fun lt!364012 () Unit!17010)

(declare-fun arrayUpdatedAtPrefixLemma!413 (array!11440 (_ BitVec 32) (_ BitVec 8)) Unit!17010)

(assert (=> b!227573 (= lt!364012 (arrayUpdatedAtPrefixLemma!413 arr!308 i!761 (_1!10637 lt!364008)))))

(declare-fun lt!364013 () (_ BitVec 64))

(declare-fun lt!364009 () (_ BitVec 64))

(declare-fun lt!364017 () (_ BitVec 64))

(declare-fun thiss!1870 () BitStream!9132)

(declare-fun lt!364014 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!227573 (and (= (bvadd lt!364009 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!364014))) lt!364017) (= (bvadd lt!364013 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!364017) (= (buf!5559 thiss!1870) (buf!5559 (_2!10636 lt!364011))) (= (size!5018 arr!308) (size!5018 (_3!851 lt!364011))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!227573 (= lt!364017 (bitIndex!0 (size!5018 (buf!5559 (_2!10636 lt!364011))) (currentByte!10403 (_2!10636 lt!364011)) (currentBit!10398 (_2!10636 lt!364011))))))

(assert (=> b!227573 (= lt!364009 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!364013))))

(assert (=> b!227573 (= lt!364009 (bitIndex!0 (size!5018 (buf!5559 (_2!10637 lt!364008))) (currentByte!10403 (_2!10637 lt!364008)) (currentBit!10398 (_2!10637 lt!364008))))))

(assert (=> b!227573 (= lt!364013 (bitIndex!0 (size!5018 (buf!5559 thiss!1870)) (currentByte!10403 thiss!1870) (currentBit!10398 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9132 array!11440 (_ BitVec 32) (_ BitVec 32)) tuple3!1418)

(assert (=> b!227573 (= lt!364011 (readByteArrayLoop!0 (_2!10637 lt!364008) lt!364010 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227573 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5018 (buf!5559 (_2!10637 lt!364008)))) ((_ sign_extend 32) (currentByte!10403 (_2!10637 lt!364008))) ((_ sign_extend 32) (currentBit!10398 (_2!10637 lt!364008))) lt!364014)))

(assert (=> b!227573 (= lt!364014 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!364015 () Unit!17010)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9132 BitStream!9132 (_ BitVec 64) (_ BitVec 32)) Unit!17010)

(assert (=> b!227573 (= lt!364015 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10637 lt!364008) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!227573 (= lt!364010 (array!11441 (store (arr!5996 arr!308) i!761 (_1!10637 lt!364008)) (size!5018 arr!308)))))

(declare-fun readByte!0 (BitStream!9132) tuple2!19570)

(assert (=> b!227573 (= lt!364008 (readByte!0 thiss!1870))))

(declare-fun b!227571 () Bool)

(declare-fun res!190916 () Bool)

(assert (=> b!227571 (=> (not res!190916) (not e!155771))))

(assert (=> b!227571 (= res!190916 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5018 (buf!5559 thiss!1870))) ((_ sign_extend 32) (currentByte!10403 thiss!1870)) ((_ sign_extend 32) (currentBit!10398 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!190918 () Bool)

(assert (=> start!47824 (=> (not res!190918) (not e!155771))))

(assert (=> start!47824 (= res!190918 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5018 arr!308))))))

(assert (=> start!47824 e!155771))

(assert (=> start!47824 true))

(declare-fun array_inv!4759 (array!11440) Bool)

(assert (=> start!47824 (array_inv!4759 arr!308)))

(declare-fun e!155772 () Bool)

(declare-fun inv!12 (BitStream!9132) Bool)

(assert (=> start!47824 (and (inv!12 thiss!1870) e!155772)))

(declare-fun b!227574 () Bool)

(assert (=> b!227574 (= e!155772 (array_inv!4759 (buf!5559 thiss!1870)))))

(declare-fun b!227572 () Bool)

(declare-fun res!190917 () Bool)

(assert (=> b!227572 (=> (not res!190917) (not e!155771))))

(assert (=> b!227572 (= res!190917 (bvslt i!761 to!496))))

(assert (= (and start!47824 res!190918) b!227571))

(assert (= (and b!227571 res!190916) b!227572))

(assert (= (and b!227572 res!190917) b!227573))

(assert (= start!47824 b!227574))

(declare-fun m!350109 () Bool)

(assert (=> b!227573 m!350109))

(declare-fun m!350111 () Bool)

(assert (=> b!227573 m!350111))

(declare-fun m!350113 () Bool)

(assert (=> b!227573 m!350113))

(declare-fun m!350115 () Bool)

(assert (=> b!227573 m!350115))

(declare-fun m!350117 () Bool)

(assert (=> b!227573 m!350117))

(declare-fun m!350119 () Bool)

(assert (=> b!227573 m!350119))

(declare-fun m!350121 () Bool)

(assert (=> b!227573 m!350121))

(declare-fun m!350123 () Bool)

(assert (=> b!227573 m!350123))

(declare-fun m!350125 () Bool)

(assert (=> b!227573 m!350125))

(declare-fun m!350127 () Bool)

(assert (=> b!227573 m!350127))

(declare-fun m!350129 () Bool)

(assert (=> b!227573 m!350129))

(declare-fun m!350131 () Bool)

(assert (=> b!227573 m!350131))

(declare-fun m!350133 () Bool)

(assert (=> b!227571 m!350133))

(declare-fun m!350135 () Bool)

(assert (=> start!47824 m!350135))

(declare-fun m!350137 () Bool)

(assert (=> start!47824 m!350137))

(declare-fun m!350139 () Bool)

(assert (=> b!227574 m!350139))

(check-sat (not b!227574) (not start!47824) (not b!227571) (not b!227573))
(check-sat)
