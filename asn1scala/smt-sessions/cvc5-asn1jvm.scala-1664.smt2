; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46274 () Bool)

(assert start!46274)

(declare-fun res!187112 () Bool)

(declare-fun e!151612 () Bool)

(assert (=> start!46274 (=> (not res!187112) (not e!151612))))

(declare-datatypes ((array!10932 0))(
  ( (array!10933 (arr!5728 (Array (_ BitVec 32) (_ BitVec 8))) (size!4798 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!10932)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!46274 (= res!187112 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4798 arr!308))))))

(assert (=> start!46274 e!151612))

(assert (=> start!46274 true))

(declare-fun array_inv!4539 (array!10932) Bool)

(assert (=> start!46274 (array_inv!4539 arr!308)))

(declare-datatypes ((BitStream!8698 0))(
  ( (BitStream!8699 (buf!5342 array!10932) (currentByte!10012 (_ BitVec 32)) (currentBit!10007 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8698)

(declare-fun e!151613 () Bool)

(declare-fun inv!12 (BitStream!8698) Bool)

(assert (=> start!46274 (and (inv!12 thiss!1870) e!151613)))

(declare-fun b!222879 () Bool)

(assert (=> b!222879 (= e!151613 (array_inv!4539 (buf!5342 thiss!1870)))))

(declare-fun b!222878 () Bool)

(assert (=> b!222878 (= e!151612 (not (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761))))))

(declare-datatypes ((tuple2!19016 0))(
  ( (tuple2!19017 (_1!10217 (_ BitVec 8)) (_2!10217 BitStream!8698)) )
))
(declare-fun lt!351463 () tuple2!19016)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!222878 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4798 (buf!5342 (_2!10217 lt!351463)))) ((_ sign_extend 32) (currentByte!10012 (_2!10217 lt!351463))) ((_ sign_extend 32) (currentBit!10007 (_2!10217 lt!351463))) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!16033 0))(
  ( (Unit!16034) )
))
(declare-fun lt!351464 () Unit!16033)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8698 BitStream!8698 (_ BitVec 64) (_ BitVec 32)) Unit!16033)

(assert (=> b!222878 (= lt!351464 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10217 lt!351463) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!8698) tuple2!19016)

(assert (=> b!222878 (= lt!351463 (readByte!0 thiss!1870))))

(declare-fun b!222877 () Bool)

(declare-fun res!187113 () Bool)

(assert (=> b!222877 (=> (not res!187113) (not e!151612))))

(assert (=> b!222877 (= res!187113 (bvslt i!761 to!496))))

(declare-fun b!222876 () Bool)

(declare-fun res!187111 () Bool)

(assert (=> b!222876 (=> (not res!187111) (not e!151612))))

(assert (=> b!222876 (= res!187111 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4798 (buf!5342 thiss!1870))) ((_ sign_extend 32) (currentByte!10012 thiss!1870)) ((_ sign_extend 32) (currentBit!10007 thiss!1870)) (bvsub to!496 i!761)))))

(assert (= (and start!46274 res!187112) b!222876))

(assert (= (and b!222876 res!187111) b!222877))

(assert (= (and b!222877 res!187113) b!222878))

(assert (= start!46274 b!222879))

(declare-fun m!341119 () Bool)

(assert (=> start!46274 m!341119))

(declare-fun m!341121 () Bool)

(assert (=> start!46274 m!341121))

(declare-fun m!341123 () Bool)

(assert (=> b!222879 m!341123))

(declare-fun m!341125 () Bool)

(assert (=> b!222878 m!341125))

(declare-fun m!341127 () Bool)

(assert (=> b!222878 m!341127))

(declare-fun m!341129 () Bool)

(assert (=> b!222878 m!341129))

(declare-fun m!341131 () Bool)

(assert (=> b!222876 m!341131))

(push 1)

(assert (not b!222879))

(assert (not b!222878))

(assert (not start!46274))

(assert (not b!222876))

(check-sat)

(pop 1)

(push 1)

(check-sat)

