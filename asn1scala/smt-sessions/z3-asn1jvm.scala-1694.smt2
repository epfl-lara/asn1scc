; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47074 () Bool)

(assert start!47074)

(declare-fun res!188899 () Bool)

(declare-fun e!153522 () Bool)

(assert (=> start!47074 (=> (not res!188899) (not e!153522))))

(declare-datatypes ((array!11146 0))(
  ( (array!11147 (arr!5846 (Array (_ BitVec 32) (_ BitVec 8))) (size!4889 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11146)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!47074 (= res!188899 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4889 arr!308))))))

(assert (=> start!47074 e!153522))

(assert (=> start!47074 true))

(declare-fun array_inv!4630 (array!11146) Bool)

(assert (=> start!47074 (array_inv!4630 arr!308)))

(declare-datatypes ((BitStream!8880 0))(
  ( (BitStream!8881 (buf!5433 array!11146) (currentByte!10199 (_ BitVec 32)) (currentBit!10194 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8880)

(declare-fun e!153521 () Bool)

(declare-fun inv!12 (BitStream!8880) Bool)

(assert (=> start!47074 (and (inv!12 thiss!1870) e!153521)))

(declare-fun b!225082 () Bool)

(assert (=> b!225082 (= e!153522 (not true))))

(declare-fun arrayRangesEq!779 (array!11146 array!11146 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!225082 (arrayRangesEq!779 arr!308 arr!308 #b00000000000000000000000000000000 (size!4889 arr!308))))

(declare-datatypes ((Unit!16523 0))(
  ( (Unit!16524) )
))
(declare-fun lt!358304 () Unit!16523)

(declare-fun arrayRangesEqReflexiveLemma!83 (array!11146) Unit!16523)

(assert (=> b!225082 (= lt!358304 (arrayRangesEqReflexiveLemma!83 arr!308))))

(declare-fun lt!358305 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!225082 (= lt!358305 (bitIndex!0 (size!4889 (buf!5433 thiss!1870)) (currentByte!10199 thiss!1870) (currentBit!10194 thiss!1870)))))

(declare-fun b!225080 () Bool)

(declare-fun res!188900 () Bool)

(assert (=> b!225080 (=> (not res!188900) (not e!153522))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225080 (= res!188900 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4889 (buf!5433 thiss!1870))) ((_ sign_extend 32) (currentByte!10199 thiss!1870)) ((_ sign_extend 32) (currentBit!10194 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!225081 () Bool)

(declare-fun res!188901 () Bool)

(assert (=> b!225081 (=> (not res!188901) (not e!153522))))

(assert (=> b!225081 (= res!188901 (bvsge i!761 to!496))))

(declare-fun b!225083 () Bool)

(assert (=> b!225083 (= e!153521 (array_inv!4630 (buf!5433 thiss!1870)))))

(assert (= (and start!47074 res!188899) b!225080))

(assert (= (and b!225080 res!188900) b!225081))

(assert (= (and b!225081 res!188901) b!225082))

(assert (= start!47074 b!225083))

(declare-fun m!345983 () Bool)

(assert (=> start!47074 m!345983))

(declare-fun m!345985 () Bool)

(assert (=> start!47074 m!345985))

(declare-fun m!345987 () Bool)

(assert (=> b!225082 m!345987))

(declare-fun m!345989 () Bool)

(assert (=> b!225082 m!345989))

(declare-fun m!345991 () Bool)

(assert (=> b!225082 m!345991))

(declare-fun m!345993 () Bool)

(assert (=> b!225080 m!345993))

(declare-fun m!345995 () Bool)

(assert (=> b!225083 m!345995))

(check-sat (not b!225082) (not start!47074) (not b!225080) (not b!225083))
