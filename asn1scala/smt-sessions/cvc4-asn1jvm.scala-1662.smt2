; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46266 () Bool)

(assert start!46266)

(declare-fun b!222808 () Bool)

(declare-fun e!151556 () Bool)

(declare-fun e!151554 () Bool)

(assert (=> b!222808 (= e!151556 e!151554)))

(declare-fun res!187058 () Bool)

(assert (=> b!222808 (=> (not res!187058) (not e!151554))))

(declare-datatypes ((array!10924 0))(
  ( (array!10925 (arr!5724 (Array (_ BitVec 32) (_ BitVec 8))) (size!4794 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8690 0))(
  ( (BitStream!8691 (buf!5338 array!10924) (currentByte!10008 (_ BitVec 32)) (currentBit!10003 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8690)

(declare-datatypes ((tuple2!19008 0))(
  ( (tuple2!19009 (_1!10213 (_ BitVec 8)) (_2!10213 BitStream!8690)) )
))
(declare-fun lt!351439 () tuple2!19008)

(assert (=> b!222808 (= res!187058 (= (size!4794 (buf!5338 thiss!1870)) (size!4794 (buf!5338 (_2!10213 lt!351439)))))))

(declare-fun readByte!0 (BitStream!8690) tuple2!19008)

(assert (=> b!222808 (= lt!351439 (readByte!0 thiss!1870))))

(declare-fun b!222809 () Bool)

(assert (=> b!222809 (= e!151554 false)))

(declare-fun lt!351440 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!222809 (= lt!351440 (bitIndex!0 (size!4794 (buf!5338 thiss!1870)) (currentByte!10008 thiss!1870) (currentBit!10003 thiss!1870)))))

(declare-fun b!222810 () Bool)

(declare-fun res!187057 () Bool)

(assert (=> b!222810 (=> (not res!187057) (not e!151554))))

(assert (=> b!222810 (= res!187057 (bvsle #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!4794 (buf!5338 (_2!10213 lt!351439))) (currentByte!10008 (_2!10213 lt!351439)) (currentBit!10003 (_2!10213 lt!351439)))))))

(declare-fun res!187055 () Bool)

(assert (=> start!46266 (=> (not res!187055) (not e!151556))))

(declare-fun arr!308 () array!10924)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!46266 (= res!187055 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4794 arr!308))))))

(assert (=> start!46266 e!151556))

(assert (=> start!46266 true))

(declare-fun array_inv!4535 (array!10924) Bool)

(assert (=> start!46266 (array_inv!4535 arr!308)))

(declare-fun e!151555 () Bool)

(declare-fun inv!12 (BitStream!8690) Bool)

(assert (=> start!46266 (and (inv!12 thiss!1870) e!151555)))

(declare-fun b!222811 () Bool)

(declare-fun res!187059 () Bool)

(assert (=> b!222811 (=> (not res!187059) (not e!151556))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!222811 (= res!187059 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4794 (buf!5338 thiss!1870))) ((_ sign_extend 32) (currentByte!10008 thiss!1870)) ((_ sign_extend 32) (currentBit!10003 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!222812 () Bool)

(assert (=> b!222812 (= e!151555 (array_inv!4535 (buf!5338 thiss!1870)))))

(declare-fun b!222813 () Bool)

(declare-fun res!187056 () Bool)

(assert (=> b!222813 (=> (not res!187056) (not e!151556))))

(assert (=> b!222813 (= res!187056 (bvslt i!761 to!496))))

(assert (= (and start!46266 res!187055) b!222811))

(assert (= (and b!222811 res!187059) b!222813))

(assert (= (and b!222813 res!187056) b!222808))

(assert (= (and b!222808 res!187058) b!222810))

(assert (= (and b!222810 res!187057) b!222809))

(assert (= start!46266 b!222812))

(declare-fun m!341063 () Bool)

(assert (=> b!222808 m!341063))

(declare-fun m!341065 () Bool)

(assert (=> b!222810 m!341065))

(declare-fun m!341067 () Bool)

(assert (=> b!222811 m!341067))

(declare-fun m!341069 () Bool)

(assert (=> start!46266 m!341069))

(declare-fun m!341071 () Bool)

(assert (=> start!46266 m!341071))

(declare-fun m!341073 () Bool)

(assert (=> b!222809 m!341073))

(declare-fun m!341075 () Bool)

(assert (=> b!222812 m!341075))

(push 1)

