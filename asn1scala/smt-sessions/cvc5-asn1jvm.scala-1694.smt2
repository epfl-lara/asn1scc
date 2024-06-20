; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47072 () Bool)

(assert start!47072)

(declare-fun b!225071 () Bool)

(declare-fun e!153510 () Bool)

(declare-datatypes ((array!11144 0))(
  ( (array!11145 (arr!5845 (Array (_ BitVec 32) (_ BitVec 8))) (size!4888 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8878 0))(
  ( (BitStream!8879 (buf!5432 array!11144) (currentByte!10198 (_ BitVec 32)) (currentBit!10193 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8878)

(declare-fun array_inv!4629 (array!11144) Bool)

(assert (=> b!225071 (= e!153510 (array_inv!4629 (buf!5432 thiss!1870)))))

(declare-fun res!188892 () Bool)

(declare-fun e!153512 () Bool)

(assert (=> start!47072 (=> (not res!188892) (not e!153512))))

(declare-fun arr!308 () array!11144)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!47072 (= res!188892 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4888 arr!308))))))

(assert (=> start!47072 e!153512))

(assert (=> start!47072 true))

(assert (=> start!47072 (array_inv!4629 arr!308)))

(declare-fun inv!12 (BitStream!8878) Bool)

(assert (=> start!47072 (and (inv!12 thiss!1870) e!153510)))

(declare-fun b!225068 () Bool)

(declare-fun res!188891 () Bool)

(assert (=> b!225068 (=> (not res!188891) (not e!153512))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225068 (= res!188891 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4888 (buf!5432 thiss!1870))) ((_ sign_extend 32) (currentByte!10198 thiss!1870)) ((_ sign_extend 32) (currentBit!10193 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!225070 () Bool)

(assert (=> b!225070 (= e!153512 (not true))))

(declare-fun arrayRangesEq!778 (array!11144 array!11144 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!225070 (arrayRangesEq!778 arr!308 arr!308 #b00000000000000000000000000000000 (size!4888 arr!308))))

(declare-datatypes ((Unit!16521 0))(
  ( (Unit!16522) )
))
(declare-fun lt!358299 () Unit!16521)

(declare-fun arrayRangesEqReflexiveLemma!82 (array!11144) Unit!16521)

(assert (=> b!225070 (= lt!358299 (arrayRangesEqReflexiveLemma!82 arr!308))))

(declare-fun lt!358298 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!225070 (= lt!358298 (bitIndex!0 (size!4888 (buf!5432 thiss!1870)) (currentByte!10198 thiss!1870) (currentBit!10193 thiss!1870)))))

(declare-fun b!225069 () Bool)

(declare-fun res!188890 () Bool)

(assert (=> b!225069 (=> (not res!188890) (not e!153512))))

(assert (=> b!225069 (= res!188890 (bvsge i!761 to!496))))

(assert (= (and start!47072 res!188892) b!225068))

(assert (= (and b!225068 res!188891) b!225069))

(assert (= (and b!225069 res!188890) b!225070))

(assert (= start!47072 b!225071))

(declare-fun m!345969 () Bool)

(assert (=> b!225071 m!345969))

(declare-fun m!345971 () Bool)

(assert (=> start!47072 m!345971))

(declare-fun m!345973 () Bool)

(assert (=> start!47072 m!345973))

(declare-fun m!345975 () Bool)

(assert (=> b!225068 m!345975))

(declare-fun m!345977 () Bool)

(assert (=> b!225070 m!345977))

(declare-fun m!345979 () Bool)

(assert (=> b!225070 m!345979))

(declare-fun m!345981 () Bool)

(assert (=> b!225070 m!345981))

(push 1)

(assert (not start!47072))

(assert (not b!225070))

(assert (not b!225068))

(assert (not b!225071))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

