; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46272 () Bool)

(assert start!46272)

(declare-fun b!222862 () Bool)

(declare-fun e!151601 () Bool)

(assert (=> b!222862 (= e!151601 false)))

(declare-fun lt!351458 () (_ BitVec 64))

(declare-datatypes ((array!10930 0))(
  ( (array!10931 (arr!5727 (Array (_ BitVec 32) (_ BitVec 8))) (size!4797 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8696 0))(
  ( (BitStream!8697 (buf!5341 array!10930) (currentByte!10011 (_ BitVec 32)) (currentBit!10006 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8696)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!222862 (= lt!351458 (bitIndex!0 (size!4797 (buf!5341 thiss!1870)) (currentByte!10011 thiss!1870) (currentBit!10006 thiss!1870)))))

(declare-fun b!222863 () Bool)

(declare-fun e!151598 () Bool)

(declare-fun array_inv!4538 (array!10930) Bool)

(assert (=> b!222863 (= e!151598 (array_inv!4538 (buf!5341 thiss!1870)))))

(declare-fun res!187103 () Bool)

(declare-fun e!151597 () Bool)

(assert (=> start!46272 (=> (not res!187103) (not e!151597))))

(declare-fun arr!308 () array!10930)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!46272 (= res!187103 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4797 arr!308))))))

(assert (=> start!46272 e!151597))

(assert (=> start!46272 true))

(assert (=> start!46272 (array_inv!4538 arr!308)))

(declare-fun inv!12 (BitStream!8696) Bool)

(assert (=> start!46272 (and (inv!12 thiss!1870) e!151598)))

(declare-fun b!222864 () Bool)

(assert (=> b!222864 (= e!151597 e!151601)))

(declare-fun res!187101 () Bool)

(assert (=> b!222864 (=> (not res!187101) (not e!151601))))

(declare-datatypes ((tuple2!19014 0))(
  ( (tuple2!19015 (_1!10216 (_ BitVec 8)) (_2!10216 BitStream!8696)) )
))
(declare-fun lt!351457 () tuple2!19014)

(assert (=> b!222864 (= res!187101 (= (size!4797 (buf!5341 thiss!1870)) (size!4797 (buf!5341 (_2!10216 lt!351457)))))))

(declare-fun readByte!0 (BitStream!8696) tuple2!19014)

(assert (=> b!222864 (= lt!351457 (readByte!0 thiss!1870))))

(declare-fun b!222865 () Bool)

(declare-fun res!187104 () Bool)

(assert (=> b!222865 (=> (not res!187104) (not e!151597))))

(assert (=> b!222865 (= res!187104 (bvslt i!761 to!496))))

(declare-fun b!222866 () Bool)

(declare-fun res!187102 () Bool)

(assert (=> b!222866 (=> (not res!187102) (not e!151597))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!222866 (= res!187102 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4797 (buf!5341 thiss!1870))) ((_ sign_extend 32) (currentByte!10011 thiss!1870)) ((_ sign_extend 32) (currentBit!10006 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!222867 () Bool)

(declare-fun res!187100 () Bool)

(assert (=> b!222867 (=> (not res!187100) (not e!151601))))

(assert (=> b!222867 (= res!187100 (bvsle #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!4797 (buf!5341 (_2!10216 lt!351457))) (currentByte!10011 (_2!10216 lt!351457)) (currentBit!10006 (_2!10216 lt!351457)))))))

(assert (= (and start!46272 res!187103) b!222866))

(assert (= (and b!222866 res!187102) b!222865))

(assert (= (and b!222865 res!187104) b!222864))

(assert (= (and b!222864 res!187101) b!222867))

(assert (= (and b!222867 res!187100) b!222862))

(assert (= start!46272 b!222863))

(declare-fun m!341105 () Bool)

(assert (=> start!46272 m!341105))

(declare-fun m!341107 () Bool)

(assert (=> start!46272 m!341107))

(declare-fun m!341109 () Bool)

(assert (=> b!222863 m!341109))

(declare-fun m!341111 () Bool)

(assert (=> b!222864 m!341111))

(declare-fun m!341113 () Bool)

(assert (=> b!222867 m!341113))

(declare-fun m!341115 () Bool)

(assert (=> b!222866 m!341115))

(declare-fun m!341117 () Bool)

(assert (=> b!222862 m!341117))

(push 1)

(assert (not b!222866))

(assert (not b!222864))

(assert (not start!46272))

(assert (not b!222867))

(assert (not b!222862))

(assert (not b!222863))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

