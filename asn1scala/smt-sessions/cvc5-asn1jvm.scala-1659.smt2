; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46244 () Bool)

(assert start!46244)

(declare-fun res!186892 () Bool)

(declare-fun e!151388 () Bool)

(assert (=> start!46244 (=> (not res!186892) (not e!151388))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-datatypes ((array!10902 0))(
  ( (array!10903 (arr!5713 (Array (_ BitVec 32) (_ BitVec 8))) (size!4783 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!10902)

(assert (=> start!46244 (= res!186892 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4783 arr!308))))))

(assert (=> start!46244 e!151388))

(assert (=> start!46244 true))

(declare-fun array_inv!4524 (array!10902) Bool)

(assert (=> start!46244 (array_inv!4524 arr!308)))

(declare-datatypes ((BitStream!8668 0))(
  ( (BitStream!8669 (buf!5327 array!10902) (currentByte!9997 (_ BitVec 32)) (currentBit!9992 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8668)

(declare-fun e!151387 () Bool)

(declare-fun inv!12 (BitStream!8668) Bool)

(assert (=> start!46244 (and (inv!12 thiss!1870) e!151387)))

(declare-fun b!222610 () Bool)

(declare-fun res!186893 () Bool)

(declare-fun e!151391 () Bool)

(assert (=> b!222610 (=> (not res!186893) (not e!151391))))

(declare-datatypes ((tuple2!18986 0))(
  ( (tuple2!18987 (_1!10202 (_ BitVec 8)) (_2!10202 BitStream!8668)) )
))
(declare-fun lt!351374 () tuple2!18986)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!222610 (= res!186893 (bvsle #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!4783 (buf!5327 (_2!10202 lt!351374))) (currentByte!9997 (_2!10202 lt!351374)) (currentBit!9992 (_2!10202 lt!351374)))))))

(declare-fun b!222611 () Bool)

(assert (=> b!222611 (= e!151388 e!151391)))

(declare-fun res!186890 () Bool)

(assert (=> b!222611 (=> (not res!186890) (not e!151391))))

(assert (=> b!222611 (= res!186890 (= (size!4783 (buf!5327 thiss!1870)) (size!4783 (buf!5327 (_2!10202 lt!351374)))))))

(declare-fun readByte!0 (BitStream!8668) tuple2!18986)

(assert (=> b!222611 (= lt!351374 (readByte!0 thiss!1870))))

(declare-fun b!222612 () Bool)

(declare-fun res!186894 () Bool)

(assert (=> b!222612 (=> (not res!186894) (not e!151388))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!222612 (= res!186894 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4783 (buf!5327 thiss!1870))) ((_ sign_extend 32) (currentByte!9997 thiss!1870)) ((_ sign_extend 32) (currentBit!9992 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!222613 () Bool)

(assert (=> b!222613 (= e!151387 (array_inv!4524 (buf!5327 thiss!1870)))))

(declare-fun b!222614 () Bool)

(declare-fun res!186891 () Bool)

(assert (=> b!222614 (=> (not res!186891) (not e!151388))))

(assert (=> b!222614 (= res!186891 (bvslt i!761 to!496))))

(declare-fun b!222615 () Bool)

(assert (=> b!222615 (= e!151391 false)))

(declare-fun lt!351373 () (_ BitVec 64))

(assert (=> b!222615 (= lt!351373 (bitIndex!0 (size!4783 (buf!5327 thiss!1870)) (currentByte!9997 thiss!1870) (currentBit!9992 thiss!1870)))))

(assert (= (and start!46244 res!186892) b!222612))

(assert (= (and b!222612 res!186894) b!222614))

(assert (= (and b!222614 res!186891) b!222611))

(assert (= (and b!222611 res!186890) b!222610))

(assert (= (and b!222610 res!186893) b!222615))

(assert (= start!46244 b!222613))

(declare-fun m!340909 () Bool)

(assert (=> start!46244 m!340909))

(declare-fun m!340911 () Bool)

(assert (=> start!46244 m!340911))

(declare-fun m!340913 () Bool)

(assert (=> b!222610 m!340913))

(declare-fun m!340915 () Bool)

(assert (=> b!222615 m!340915))

(declare-fun m!340917 () Bool)

(assert (=> b!222612 m!340917))

(declare-fun m!340919 () Bool)

(assert (=> b!222611 m!340919))

(declare-fun m!340921 () Bool)

(assert (=> b!222613 m!340921))

(push 1)

(assert (not b!222611))

(assert (not b!222612))

(assert (not b!222615))

(assert (not start!46244))

(assert (not b!222613))

(assert (not b!222610))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

