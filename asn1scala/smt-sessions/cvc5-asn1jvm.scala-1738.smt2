; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47828 () Bool)

(assert start!47828)

(declare-fun b!227596 () Bool)

(declare-fun res!190936 () Bool)

(declare-fun e!155794 () Bool)

(assert (=> b!227596 (=> (not res!190936) (not e!155794))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!227596 (= res!190936 (bvslt i!761 to!496))))

(declare-fun b!227598 () Bool)

(declare-fun e!155795 () Bool)

(declare-datatypes ((array!11444 0))(
  ( (array!11445 (arr!5998 (Array (_ BitVec 32) (_ BitVec 8))) (size!5020 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9136 0))(
  ( (BitStream!9137 (buf!5561 array!11444) (currentByte!10405 (_ BitVec 32)) (currentBit!10400 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9136)

(declare-fun array_inv!4761 (array!11444) Bool)

(assert (=> b!227598 (= e!155795 (array_inv!4761 (buf!5561 thiss!1870)))))

(declare-fun b!227597 () Bool)

(assert (=> b!227597 (= e!155794 (not true))))

(declare-fun arr!308 () array!11444)

(declare-datatypes ((Unit!17014 0))(
  ( (Unit!17015) )
))
(declare-datatypes ((tuple3!1422 0))(
  ( (tuple3!1423 (_1!10640 Unit!17014) (_2!10640 BitStream!9136) (_3!853 array!11444)) )
))
(declare-fun lt!364070 () tuple3!1422)

(declare-fun arrayRangesEq!856 (array!11444 array!11444 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227597 (arrayRangesEq!856 arr!308 (_3!853 lt!364070) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!364072 () Unit!17014)

(declare-fun lt!364076 () array!11444)

(declare-fun arrayRangesEqTransitive!279 (array!11444 array!11444 array!11444 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17014)

(assert (=> b!227597 (= lt!364072 (arrayRangesEqTransitive!279 arr!308 lt!364076 (_3!853 lt!364070) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!227597 (arrayRangesEq!856 arr!308 lt!364076 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!364077 () Unit!17014)

(declare-datatypes ((tuple2!19574 0))(
  ( (tuple2!19575 (_1!10641 (_ BitVec 8)) (_2!10641 BitStream!9136)) )
))
(declare-fun lt!364069 () tuple2!19574)

(declare-fun arrayUpdatedAtPrefixLemma!415 (array!11444 (_ BitVec 32) (_ BitVec 8)) Unit!17014)

(assert (=> b!227597 (= lt!364077 (arrayUpdatedAtPrefixLemma!415 arr!308 i!761 (_1!10641 lt!364069)))))

(declare-fun lt!364071 () (_ BitVec 64))

(declare-fun lt!364074 () (_ BitVec 64))

(declare-fun lt!364075 () (_ BitVec 64))

(declare-fun lt!364073 () (_ BitVec 32))

(assert (=> b!227597 (and (= (bvadd lt!364074 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!364073))) lt!364075) (= (bvadd lt!364071 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!364075) (= (buf!5561 thiss!1870) (buf!5561 (_2!10640 lt!364070))) (= (size!5020 arr!308) (size!5020 (_3!853 lt!364070))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!227597 (= lt!364075 (bitIndex!0 (size!5020 (buf!5561 (_2!10640 lt!364070))) (currentByte!10405 (_2!10640 lt!364070)) (currentBit!10400 (_2!10640 lt!364070))))))

(assert (=> b!227597 (= lt!364074 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!364071))))

(assert (=> b!227597 (= lt!364074 (bitIndex!0 (size!5020 (buf!5561 (_2!10641 lt!364069))) (currentByte!10405 (_2!10641 lt!364069)) (currentBit!10400 (_2!10641 lt!364069))))))

(assert (=> b!227597 (= lt!364071 (bitIndex!0 (size!5020 (buf!5561 thiss!1870)) (currentByte!10405 thiss!1870) (currentBit!10400 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9136 array!11444 (_ BitVec 32) (_ BitVec 32)) tuple3!1422)

(assert (=> b!227597 (= lt!364070 (readByteArrayLoop!0 (_2!10641 lt!364069) lt!364076 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227597 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5020 (buf!5561 (_2!10641 lt!364069)))) ((_ sign_extend 32) (currentByte!10405 (_2!10641 lt!364069))) ((_ sign_extend 32) (currentBit!10400 (_2!10641 lt!364069))) lt!364073)))

(assert (=> b!227597 (= lt!364073 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!364068 () Unit!17014)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9136 BitStream!9136 (_ BitVec 64) (_ BitVec 32)) Unit!17014)

(assert (=> b!227597 (= lt!364068 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10641 lt!364069) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!227597 (= lt!364076 (array!11445 (store (arr!5998 arr!308) i!761 (_1!10641 lt!364069)) (size!5020 arr!308)))))

(declare-fun readByte!0 (BitStream!9136) tuple2!19574)

(assert (=> b!227597 (= lt!364069 (readByte!0 thiss!1870))))

(declare-fun b!227595 () Bool)

(declare-fun res!190935 () Bool)

(assert (=> b!227595 (=> (not res!190935) (not e!155794))))

(assert (=> b!227595 (= res!190935 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5020 (buf!5561 thiss!1870))) ((_ sign_extend 32) (currentByte!10405 thiss!1870)) ((_ sign_extend 32) (currentBit!10400 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!190934 () Bool)

(assert (=> start!47828 (=> (not res!190934) (not e!155794))))

(assert (=> start!47828 (= res!190934 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5020 arr!308))))))

(assert (=> start!47828 e!155794))

(assert (=> start!47828 true))

(assert (=> start!47828 (array_inv!4761 arr!308)))

(declare-fun inv!12 (BitStream!9136) Bool)

(assert (=> start!47828 (and (inv!12 thiss!1870) e!155795)))

(assert (= (and start!47828 res!190934) b!227595))

(assert (= (and b!227595 res!190935) b!227596))

(assert (= (and b!227596 res!190936) b!227597))

(assert (= start!47828 b!227598))

(declare-fun m!350173 () Bool)

(assert (=> b!227598 m!350173))

(declare-fun m!350175 () Bool)

(assert (=> b!227597 m!350175))

(declare-fun m!350177 () Bool)

(assert (=> b!227597 m!350177))

(declare-fun m!350179 () Bool)

(assert (=> b!227597 m!350179))

(declare-fun m!350181 () Bool)

(assert (=> b!227597 m!350181))

(declare-fun m!350183 () Bool)

(assert (=> b!227597 m!350183))

(declare-fun m!350185 () Bool)

(assert (=> b!227597 m!350185))

(declare-fun m!350187 () Bool)

(assert (=> b!227597 m!350187))

(declare-fun m!350189 () Bool)

(assert (=> b!227597 m!350189))

(declare-fun m!350191 () Bool)

(assert (=> b!227597 m!350191))

(declare-fun m!350193 () Bool)

(assert (=> b!227597 m!350193))

(declare-fun m!350195 () Bool)

(assert (=> b!227597 m!350195))

(declare-fun m!350197 () Bool)

(assert (=> b!227597 m!350197))

(declare-fun m!350199 () Bool)

(assert (=> b!227595 m!350199))

(declare-fun m!350201 () Bool)

(assert (=> start!47828 m!350201))

(declare-fun m!350203 () Bool)

(assert (=> start!47828 m!350203))

(push 1)

(assert (not b!227595))

(assert (not b!227597))

(assert (not b!227598))

(assert (not start!47828))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

