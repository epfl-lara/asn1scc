; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46250 () Bool)

(assert start!46250)

(declare-fun b!222664 () Bool)

(declare-fun res!186938 () Bool)

(declare-fun e!151434 () Bool)

(assert (=> b!222664 (=> (not res!186938) (not e!151434))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!222664 (= res!186938 (bvslt i!761 to!496))))

(declare-fun b!222665 () Bool)

(declare-fun res!186939 () Bool)

(declare-fun e!151435 () Bool)

(assert (=> b!222665 (=> (not res!186939) (not e!151435))))

(declare-datatypes ((array!10908 0))(
  ( (array!10909 (arr!5716 (Array (_ BitVec 32) (_ BitVec 8))) (size!4786 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8674 0))(
  ( (BitStream!8675 (buf!5330 array!10908) (currentByte!10000 (_ BitVec 32)) (currentBit!9995 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!18992 0))(
  ( (tuple2!18993 (_1!10205 (_ BitVec 8)) (_2!10205 BitStream!8674)) )
))
(declare-fun lt!351392 () tuple2!18992)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!222665 (= res!186939 (bvsle #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!4786 (buf!5330 (_2!10205 lt!351392))) (currentByte!10000 (_2!10205 lt!351392)) (currentBit!9995 (_2!10205 lt!351392)))))))

(declare-fun b!222666 () Bool)

(assert (=> b!222666 (= e!151434 e!151435)))

(declare-fun res!186935 () Bool)

(assert (=> b!222666 (=> (not res!186935) (not e!151435))))

(declare-fun thiss!1870 () BitStream!8674)

(assert (=> b!222666 (= res!186935 (= (size!4786 (buf!5330 thiss!1870)) (size!4786 (buf!5330 (_2!10205 lt!351392)))))))

(declare-fun readByte!0 (BitStream!8674) tuple2!18992)

(assert (=> b!222666 (= lt!351392 (readByte!0 thiss!1870))))

(declare-fun b!222667 () Bool)

(assert (=> b!222667 (= e!151435 false)))

(declare-fun lt!351391 () (_ BitVec 64))

(assert (=> b!222667 (= lt!351391 (bitIndex!0 (size!4786 (buf!5330 thiss!1870)) (currentByte!10000 thiss!1870) (currentBit!9995 thiss!1870)))))

(declare-fun res!186937 () Bool)

(assert (=> start!46250 (=> (not res!186937) (not e!151434))))

(declare-fun arr!308 () array!10908)

(assert (=> start!46250 (= res!186937 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4786 arr!308))))))

(assert (=> start!46250 e!151434))

(assert (=> start!46250 true))

(declare-fun array_inv!4527 (array!10908) Bool)

(assert (=> start!46250 (array_inv!4527 arr!308)))

(declare-fun e!151433 () Bool)

(declare-fun inv!12 (BitStream!8674) Bool)

(assert (=> start!46250 (and (inv!12 thiss!1870) e!151433)))

(declare-fun b!222668 () Bool)

(assert (=> b!222668 (= e!151433 (array_inv!4527 (buf!5330 thiss!1870)))))

(declare-fun b!222669 () Bool)

(declare-fun res!186936 () Bool)

(assert (=> b!222669 (=> (not res!186936) (not e!151434))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!222669 (= res!186936 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4786 (buf!5330 thiss!1870))) ((_ sign_extend 32) (currentByte!10000 thiss!1870)) ((_ sign_extend 32) (currentBit!9995 thiss!1870)) (bvsub to!496 i!761)))))

(assert (= (and start!46250 res!186937) b!222669))

(assert (= (and b!222669 res!186936) b!222664))

(assert (= (and b!222664 res!186938) b!222666))

(assert (= (and b!222666 res!186935) b!222665))

(assert (= (and b!222665 res!186939) b!222667))

(assert (= start!46250 b!222668))

(declare-fun m!340951 () Bool)

(assert (=> b!222668 m!340951))

(declare-fun m!340953 () Bool)

(assert (=> b!222665 m!340953))

(declare-fun m!340955 () Bool)

(assert (=> b!222667 m!340955))

(declare-fun m!340957 () Bool)

(assert (=> start!46250 m!340957))

(declare-fun m!340959 () Bool)

(assert (=> start!46250 m!340959))

(declare-fun m!340961 () Bool)

(assert (=> b!222666 m!340961))

(declare-fun m!340963 () Bool)

(assert (=> b!222669 m!340963))

(push 1)

(assert (not b!222666))

(assert (not start!46250))

(assert (not b!222665))

(assert (not b!222667))

(assert (not b!222668))

(assert (not b!222669))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

