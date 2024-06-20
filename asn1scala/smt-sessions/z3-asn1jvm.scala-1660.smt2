; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46252 () Bool)

(assert start!46252)

(declare-fun b!222682 () Bool)

(declare-fun res!186953 () Bool)

(declare-fun e!151449 () Bool)

(assert (=> b!222682 (=> (not res!186953) (not e!151449))))

(declare-datatypes ((array!10910 0))(
  ( (array!10911 (arr!5717 (Array (_ BitVec 32) (_ BitVec 8))) (size!4787 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8676 0))(
  ( (BitStream!8677 (buf!5331 array!10910) (currentByte!10001 (_ BitVec 32)) (currentBit!9996 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!18994 0))(
  ( (tuple2!18995 (_1!10206 (_ BitVec 8)) (_2!10206 BitStream!8676)) )
))
(declare-fun lt!351398 () tuple2!18994)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!222682 (= res!186953 (bvsle #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!4787 (buf!5331 (_2!10206 lt!351398))) (currentByte!10001 (_2!10206 lt!351398)) (currentBit!9996 (_2!10206 lt!351398)))))))

(declare-fun b!222683 () Bool)

(declare-fun res!186954 () Bool)

(declare-fun e!151447 () Bool)

(assert (=> b!222683 (=> (not res!186954) (not e!151447))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!222683 (= res!186954 (bvslt i!761 to!496))))

(declare-fun b!222684 () Bool)

(declare-fun e!151451 () Bool)

(declare-fun thiss!1870 () BitStream!8676)

(declare-fun array_inv!4528 (array!10910) Bool)

(assert (=> b!222684 (= e!151451 (array_inv!4528 (buf!5331 thiss!1870)))))

(declare-fun b!222685 () Bool)

(assert (=> b!222685 (= e!151447 e!151449)))

(declare-fun res!186950 () Bool)

(assert (=> b!222685 (=> (not res!186950) (not e!151449))))

(assert (=> b!222685 (= res!186950 (= (size!4787 (buf!5331 thiss!1870)) (size!4787 (buf!5331 (_2!10206 lt!351398)))))))

(declare-fun readByte!0 (BitStream!8676) tuple2!18994)

(assert (=> b!222685 (= lt!351398 (readByte!0 thiss!1870))))

(declare-fun res!186951 () Bool)

(assert (=> start!46252 (=> (not res!186951) (not e!151447))))

(declare-fun arr!308 () array!10910)

(assert (=> start!46252 (= res!186951 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4787 arr!308))))))

(assert (=> start!46252 e!151447))

(assert (=> start!46252 true))

(assert (=> start!46252 (array_inv!4528 arr!308)))

(declare-fun inv!12 (BitStream!8676) Bool)

(assert (=> start!46252 (and (inv!12 thiss!1870) e!151451)))

(declare-fun b!222686 () Bool)

(declare-fun res!186952 () Bool)

(assert (=> b!222686 (=> (not res!186952) (not e!151447))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!222686 (= res!186952 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4787 (buf!5331 thiss!1870))) ((_ sign_extend 32) (currentByte!10001 thiss!1870)) ((_ sign_extend 32) (currentBit!9996 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!222687 () Bool)

(assert (=> b!222687 (= e!151449 false)))

(declare-fun lt!351397 () (_ BitVec 64))

(assert (=> b!222687 (= lt!351397 (bitIndex!0 (size!4787 (buf!5331 thiss!1870)) (currentByte!10001 thiss!1870) (currentBit!9996 thiss!1870)))))

(assert (= (and start!46252 res!186951) b!222686))

(assert (= (and b!222686 res!186952) b!222683))

(assert (= (and b!222683 res!186954) b!222685))

(assert (= (and b!222685 res!186950) b!222682))

(assert (= (and b!222682 res!186953) b!222687))

(assert (= start!46252 b!222684))

(declare-fun m!340965 () Bool)

(assert (=> b!222686 m!340965))

(declare-fun m!340967 () Bool)

(assert (=> b!222684 m!340967))

(declare-fun m!340969 () Bool)

(assert (=> start!46252 m!340969))

(declare-fun m!340971 () Bool)

(assert (=> start!46252 m!340971))

(declare-fun m!340973 () Bool)

(assert (=> b!222685 m!340973))

(declare-fun m!340975 () Bool)

(assert (=> b!222687 m!340975))

(declare-fun m!340977 () Bool)

(assert (=> b!222682 m!340977))

(check-sat (not b!222684) (not b!222687) (not b!222682) (not b!222685) (not start!46252) (not b!222686))
