; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46276 () Bool)

(assert start!46276)

(declare-fun res!187120 () Bool)

(declare-fun e!151625 () Bool)

(assert (=> start!46276 (=> (not res!187120) (not e!151625))))

(declare-datatypes ((array!10934 0))(
  ( (array!10935 (arr!5729 (Array (_ BitVec 32) (_ BitVec 8))) (size!4799 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!10934)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!46276 (= res!187120 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4799 arr!308))))))

(assert (=> start!46276 e!151625))

(assert (=> start!46276 true))

(declare-fun array_inv!4540 (array!10934) Bool)

(assert (=> start!46276 (array_inv!4540 arr!308)))

(declare-datatypes ((BitStream!8700 0))(
  ( (BitStream!8701 (buf!5343 array!10934) (currentByte!10013 (_ BitVec 32)) (currentBit!10008 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8700)

(declare-fun e!151623 () Bool)

(declare-fun inv!12 (BitStream!8700) Bool)

(assert (=> start!46276 (and (inv!12 thiss!1870) e!151623)))

(declare-fun b!222890 () Bool)

(assert (=> b!222890 (= e!151625 (not (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761))))))

(declare-datatypes ((tuple2!19018 0))(
  ( (tuple2!19019 (_1!10218 (_ BitVec 8)) (_2!10218 BitStream!8700)) )
))
(declare-fun lt!351470 () tuple2!19018)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!222890 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4799 (buf!5343 (_2!10218 lt!351470)))) ((_ sign_extend 32) (currentByte!10013 (_2!10218 lt!351470))) ((_ sign_extend 32) (currentBit!10008 (_2!10218 lt!351470))) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!16035 0))(
  ( (Unit!16036) )
))
(declare-fun lt!351469 () Unit!16035)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8700 BitStream!8700 (_ BitVec 64) (_ BitVec 32)) Unit!16035)

(assert (=> b!222890 (= lt!351469 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10218 lt!351470) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!8700) tuple2!19018)

(assert (=> b!222890 (= lt!351470 (readByte!0 thiss!1870))))

(declare-fun b!222891 () Bool)

(assert (=> b!222891 (= e!151623 (array_inv!4540 (buf!5343 thiss!1870)))))

(declare-fun b!222888 () Bool)

(declare-fun res!187122 () Bool)

(assert (=> b!222888 (=> (not res!187122) (not e!151625))))

(assert (=> b!222888 (= res!187122 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4799 (buf!5343 thiss!1870))) ((_ sign_extend 32) (currentByte!10013 thiss!1870)) ((_ sign_extend 32) (currentBit!10008 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!222889 () Bool)

(declare-fun res!187121 () Bool)

(assert (=> b!222889 (=> (not res!187121) (not e!151625))))

(assert (=> b!222889 (= res!187121 (bvslt i!761 to!496))))

(assert (= (and start!46276 res!187120) b!222888))

(assert (= (and b!222888 res!187122) b!222889))

(assert (= (and b!222889 res!187121) b!222890))

(assert (= start!46276 b!222891))

(declare-fun m!341133 () Bool)

(assert (=> start!46276 m!341133))

(declare-fun m!341135 () Bool)

(assert (=> start!46276 m!341135))

(declare-fun m!341137 () Bool)

(assert (=> b!222890 m!341137))

(declare-fun m!341139 () Bool)

(assert (=> b!222890 m!341139))

(declare-fun m!341141 () Bool)

(assert (=> b!222890 m!341141))

(declare-fun m!341143 () Bool)

(assert (=> b!222891 m!341143))

(declare-fun m!341145 () Bool)

(assert (=> b!222888 m!341145))

(check-sat (not start!46276) (not b!222888) (not b!222891) (not b!222890))
(check-sat)
