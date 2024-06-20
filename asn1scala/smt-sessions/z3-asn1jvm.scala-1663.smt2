; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46270 () Bool)

(assert start!46270)

(declare-fun b!222844 () Bool)

(declare-fun e!151583 () Bool)

(declare-fun e!151582 () Bool)

(assert (=> b!222844 (= e!151583 e!151582)))

(declare-fun res!187088 () Bool)

(assert (=> b!222844 (=> (not res!187088) (not e!151582))))

(declare-datatypes ((array!10928 0))(
  ( (array!10929 (arr!5726 (Array (_ BitVec 32) (_ BitVec 8))) (size!4796 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8694 0))(
  ( (BitStream!8695 (buf!5340 array!10928) (currentByte!10010 (_ BitVec 32)) (currentBit!10005 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8694)

(declare-datatypes ((tuple2!19012 0))(
  ( (tuple2!19013 (_1!10215 (_ BitVec 8)) (_2!10215 BitStream!8694)) )
))
(declare-fun lt!351451 () tuple2!19012)

(assert (=> b!222844 (= res!187088 (= (size!4796 (buf!5340 thiss!1870)) (size!4796 (buf!5340 (_2!10215 lt!351451)))))))

(declare-fun readByte!0 (BitStream!8694) tuple2!19012)

(assert (=> b!222844 (= lt!351451 (readByte!0 thiss!1870))))

(declare-fun b!222845 () Bool)

(declare-fun res!187089 () Bool)

(assert (=> b!222845 (=> (not res!187089) (not e!151583))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!222845 (= res!187089 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4796 (buf!5340 thiss!1870))) ((_ sign_extend 32) (currentByte!10010 thiss!1870)) ((_ sign_extend 32) (currentBit!10005 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!222846 () Bool)

(declare-fun e!151584 () Bool)

(declare-fun array_inv!4537 (array!10928) Bool)

(assert (=> b!222846 (= e!151584 (array_inv!4537 (buf!5340 thiss!1870)))))

(declare-fun res!187087 () Bool)

(assert (=> start!46270 (=> (not res!187087) (not e!151583))))

(declare-fun arr!308 () array!10928)

(assert (=> start!46270 (= res!187087 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4796 arr!308))))))

(assert (=> start!46270 e!151583))

(assert (=> start!46270 true))

(assert (=> start!46270 (array_inv!4537 arr!308)))

(declare-fun inv!12 (BitStream!8694) Bool)

(assert (=> start!46270 (and (inv!12 thiss!1870) e!151584)))

(declare-fun b!222847 () Bool)

(declare-fun res!187086 () Bool)

(assert (=> b!222847 (=> (not res!187086) (not e!151582))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!222847 (= res!187086 (bvsle #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!4796 (buf!5340 (_2!10215 lt!351451))) (currentByte!10010 (_2!10215 lt!351451)) (currentBit!10005 (_2!10215 lt!351451)))))))

(declare-fun b!222848 () Bool)

(assert (=> b!222848 (= e!151582 false)))

(declare-fun lt!351452 () (_ BitVec 64))

(assert (=> b!222848 (= lt!351452 (bitIndex!0 (size!4796 (buf!5340 thiss!1870)) (currentByte!10010 thiss!1870) (currentBit!10005 thiss!1870)))))

(declare-fun b!222849 () Bool)

(declare-fun res!187085 () Bool)

(assert (=> b!222849 (=> (not res!187085) (not e!151583))))

(assert (=> b!222849 (= res!187085 (bvslt i!761 to!496))))

(assert (= (and start!46270 res!187087) b!222845))

(assert (= (and b!222845 res!187089) b!222849))

(assert (= (and b!222849 res!187085) b!222844))

(assert (= (and b!222844 res!187088) b!222847))

(assert (= (and b!222847 res!187086) b!222848))

(assert (= start!46270 b!222846))

(declare-fun m!341091 () Bool)

(assert (=> start!46270 m!341091))

(declare-fun m!341093 () Bool)

(assert (=> start!46270 m!341093))

(declare-fun m!341095 () Bool)

(assert (=> b!222846 m!341095))

(declare-fun m!341097 () Bool)

(assert (=> b!222845 m!341097))

(declare-fun m!341099 () Bool)

(assert (=> b!222848 m!341099))

(declare-fun m!341101 () Bool)

(assert (=> b!222844 m!341101))

(declare-fun m!341103 () Bool)

(assert (=> b!222847 m!341103))

(check-sat (not b!222848) (not b!222846) (not b!222847) (not b!222845) (not b!222844) (not start!46270))
