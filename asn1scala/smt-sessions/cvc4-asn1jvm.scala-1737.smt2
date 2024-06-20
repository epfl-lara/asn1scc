; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47826 () Bool)

(assert start!47826)

(declare-fun b!227584 () Bool)

(declare-fun res!190926 () Bool)

(declare-fun e!155783 () Bool)

(assert (=> b!227584 (=> (not res!190926) (not e!155783))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!227584 (= res!190926 (bvslt i!761 to!496))))

(declare-fun res!190925 () Bool)

(assert (=> start!47826 (=> (not res!190925) (not e!155783))))

(declare-datatypes ((array!11442 0))(
  ( (array!11443 (arr!5997 (Array (_ BitVec 32) (_ BitVec 8))) (size!5019 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11442)

(assert (=> start!47826 (= res!190925 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5019 arr!308))))))

(assert (=> start!47826 e!155783))

(assert (=> start!47826 true))

(declare-fun array_inv!4760 (array!11442) Bool)

(assert (=> start!47826 (array_inv!4760 arr!308)))

(declare-datatypes ((BitStream!9134 0))(
  ( (BitStream!9135 (buf!5560 array!11442) (currentByte!10404 (_ BitVec 32)) (currentBit!10399 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9134)

(declare-fun e!155784 () Bool)

(declare-fun inv!12 (BitStream!9134) Bool)

(assert (=> start!47826 (and (inv!12 thiss!1870) e!155784)))

(declare-fun b!227585 () Bool)

(assert (=> b!227585 (= e!155783 (not (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761))))))

(declare-datatypes ((Unit!17012 0))(
  ( (Unit!17013) )
))
(declare-datatypes ((tuple3!1420 0))(
  ( (tuple3!1421 (_1!10638 Unit!17012) (_2!10638 BitStream!9134) (_3!852 array!11442)) )
))
(declare-fun lt!364038 () tuple3!1420)

(declare-fun arrayRangesEq!855 (array!11442 array!11442 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227585 (arrayRangesEq!855 arr!308 (_3!852 lt!364038) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!364043 () array!11442)

(declare-fun lt!364044 () Unit!17012)

(declare-fun arrayRangesEqTransitive!278 (array!11442 array!11442 array!11442 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17012)

(assert (=> b!227585 (= lt!364044 (arrayRangesEqTransitive!278 arr!308 lt!364043 (_3!852 lt!364038) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!227585 (arrayRangesEq!855 arr!308 lt!364043 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((tuple2!19572 0))(
  ( (tuple2!19573 (_1!10639 (_ BitVec 8)) (_2!10639 BitStream!9134)) )
))
(declare-fun lt!364047 () tuple2!19572)

(declare-fun lt!364039 () Unit!17012)

(declare-fun arrayUpdatedAtPrefixLemma!414 (array!11442 (_ BitVec 32) (_ BitVec 8)) Unit!17012)

(assert (=> b!227585 (= lt!364039 (arrayUpdatedAtPrefixLemma!414 arr!308 i!761 (_1!10639 lt!364047)))))

(declare-fun lt!364046 () (_ BitVec 64))

(declare-fun lt!364045 () (_ BitVec 32))

(declare-fun lt!364042 () (_ BitVec 64))

(declare-fun lt!364040 () (_ BitVec 64))

(assert (=> b!227585 (and (= (bvadd lt!364046 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!364045))) lt!364040) (= (bvadd lt!364042 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!364040) (= (buf!5560 thiss!1870) (buf!5560 (_2!10638 lt!364038))) (= (size!5019 arr!308) (size!5019 (_3!852 lt!364038))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!227585 (= lt!364040 (bitIndex!0 (size!5019 (buf!5560 (_2!10638 lt!364038))) (currentByte!10404 (_2!10638 lt!364038)) (currentBit!10399 (_2!10638 lt!364038))))))

(assert (=> b!227585 (= lt!364046 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!364042))))

(assert (=> b!227585 (= lt!364046 (bitIndex!0 (size!5019 (buf!5560 (_2!10639 lt!364047))) (currentByte!10404 (_2!10639 lt!364047)) (currentBit!10399 (_2!10639 lt!364047))))))

(assert (=> b!227585 (= lt!364042 (bitIndex!0 (size!5019 (buf!5560 thiss!1870)) (currentByte!10404 thiss!1870) (currentBit!10399 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9134 array!11442 (_ BitVec 32) (_ BitVec 32)) tuple3!1420)

(assert (=> b!227585 (= lt!364038 (readByteArrayLoop!0 (_2!10639 lt!364047) lt!364043 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227585 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5019 (buf!5560 (_2!10639 lt!364047)))) ((_ sign_extend 32) (currentByte!10404 (_2!10639 lt!364047))) ((_ sign_extend 32) (currentBit!10399 (_2!10639 lt!364047))) lt!364045)))

(assert (=> b!227585 (= lt!364045 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!364041 () Unit!17012)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9134 BitStream!9134 (_ BitVec 64) (_ BitVec 32)) Unit!17012)

(assert (=> b!227585 (= lt!364041 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10639 lt!364047) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!227585 (= lt!364043 (array!11443 (store (arr!5997 arr!308) i!761 (_1!10639 lt!364047)) (size!5019 arr!308)))))

(declare-fun readByte!0 (BitStream!9134) tuple2!19572)

(assert (=> b!227585 (= lt!364047 (readByte!0 thiss!1870))))

(declare-fun b!227583 () Bool)

(declare-fun res!190927 () Bool)

(assert (=> b!227583 (=> (not res!190927) (not e!155783))))

(assert (=> b!227583 (= res!190927 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5019 (buf!5560 thiss!1870))) ((_ sign_extend 32) (currentByte!10404 thiss!1870)) ((_ sign_extend 32) (currentBit!10399 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!227586 () Bool)

(assert (=> b!227586 (= e!155784 (array_inv!4760 (buf!5560 thiss!1870)))))

(assert (= (and start!47826 res!190925) b!227583))

(assert (= (and b!227583 res!190927) b!227584))

(assert (= (and b!227584 res!190926) b!227585))

(assert (= start!47826 b!227586))

(declare-fun m!350141 () Bool)

(assert (=> start!47826 m!350141))

(declare-fun m!350143 () Bool)

(assert (=> start!47826 m!350143))

(declare-fun m!350145 () Bool)

(assert (=> b!227585 m!350145))

(declare-fun m!350147 () Bool)

(assert (=> b!227585 m!350147))

(declare-fun m!350149 () Bool)

(assert (=> b!227585 m!350149))

(declare-fun m!350151 () Bool)

(assert (=> b!227585 m!350151))

(declare-fun m!350153 () Bool)

(assert (=> b!227585 m!350153))

(declare-fun m!350155 () Bool)

(assert (=> b!227585 m!350155))

(declare-fun m!350157 () Bool)

(assert (=> b!227585 m!350157))

(declare-fun m!350159 () Bool)

(assert (=> b!227585 m!350159))

(declare-fun m!350161 () Bool)

(assert (=> b!227585 m!350161))

(declare-fun m!350163 () Bool)

(assert (=> b!227585 m!350163))

(declare-fun m!350165 () Bool)

(assert (=> b!227585 m!350165))

(declare-fun m!350167 () Bool)

(assert (=> b!227585 m!350167))

(declare-fun m!350169 () Bool)

(assert (=> b!227583 m!350169))

(declare-fun m!350171 () Bool)

(assert (=> b!227586 m!350171))

(push 1)

(assert (not b!227583))

(assert (not b!227585))

(assert (not b!227586))

(assert (not start!47826))

(check-sat)

(pop 1)

(push 1)

(check-sat)

