; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46246 () Bool)

(assert start!46246)

(declare-fun b!222628 () Bool)

(declare-fun e!151403 () Bool)

(declare-fun e!151406 () Bool)

(assert (=> b!222628 (= e!151403 e!151406)))

(declare-fun res!186908 () Bool)

(assert (=> b!222628 (=> (not res!186908) (not e!151406))))

(declare-datatypes ((array!10904 0))(
  ( (array!10905 (arr!5714 (Array (_ BitVec 32) (_ BitVec 8))) (size!4784 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8670 0))(
  ( (BitStream!8671 (buf!5328 array!10904) (currentByte!9998 (_ BitVec 32)) (currentBit!9993 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8670)

(declare-datatypes ((tuple2!18988 0))(
  ( (tuple2!18989 (_1!10203 (_ BitVec 8)) (_2!10203 BitStream!8670)) )
))
(declare-fun lt!351380 () tuple2!18988)

(assert (=> b!222628 (= res!186908 (= (size!4784 (buf!5328 thiss!1870)) (size!4784 (buf!5328 (_2!10203 lt!351380)))))))

(declare-fun readByte!0 (BitStream!8670) tuple2!18988)

(assert (=> b!222628 (= lt!351380 (readByte!0 thiss!1870))))

(declare-fun b!222629 () Bool)

(declare-fun res!186909 () Bool)

(assert (=> b!222629 (=> (not res!186909) (not e!151406))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!222629 (= res!186909 (bvsle #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!4784 (buf!5328 (_2!10203 lt!351380))) (currentByte!9998 (_2!10203 lt!351380)) (currentBit!9993 (_2!10203 lt!351380)))))))

(declare-fun b!222630 () Bool)

(declare-fun res!186905 () Bool)

(assert (=> b!222630 (=> (not res!186905) (not e!151403))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!222630 (= res!186905 (bvslt i!761 to!496))))

(declare-fun b!222631 () Bool)

(assert (=> b!222631 (= e!151406 false)))

(declare-fun lt!351379 () (_ BitVec 64))

(assert (=> b!222631 (= lt!351379 (bitIndex!0 (size!4784 (buf!5328 thiss!1870)) (currentByte!9998 thiss!1870) (currentBit!9993 thiss!1870)))))

(declare-fun res!186906 () Bool)

(assert (=> start!46246 (=> (not res!186906) (not e!151403))))

(declare-fun arr!308 () array!10904)

(assert (=> start!46246 (= res!186906 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4784 arr!308))))))

(assert (=> start!46246 e!151403))

(assert (=> start!46246 true))

(declare-fun array_inv!4525 (array!10904) Bool)

(assert (=> start!46246 (array_inv!4525 arr!308)))

(declare-fun e!151405 () Bool)

(declare-fun inv!12 (BitStream!8670) Bool)

(assert (=> start!46246 (and (inv!12 thiss!1870) e!151405)))

(declare-fun b!222632 () Bool)

(assert (=> b!222632 (= e!151405 (array_inv!4525 (buf!5328 thiss!1870)))))

(declare-fun b!222633 () Bool)

(declare-fun res!186907 () Bool)

(assert (=> b!222633 (=> (not res!186907) (not e!151403))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!222633 (= res!186907 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4784 (buf!5328 thiss!1870))) ((_ sign_extend 32) (currentByte!9998 thiss!1870)) ((_ sign_extend 32) (currentBit!9993 thiss!1870)) (bvsub to!496 i!761)))))

(assert (= (and start!46246 res!186906) b!222633))

(assert (= (and b!222633 res!186907) b!222630))

(assert (= (and b!222630 res!186905) b!222628))

(assert (= (and b!222628 res!186908) b!222629))

(assert (= (and b!222629 res!186909) b!222631))

(assert (= start!46246 b!222632))

(declare-fun m!340923 () Bool)

(assert (=> b!222628 m!340923))

(declare-fun m!340925 () Bool)

(assert (=> start!46246 m!340925))

(declare-fun m!340927 () Bool)

(assert (=> start!46246 m!340927))

(declare-fun m!340929 () Bool)

(assert (=> b!222633 m!340929))

(declare-fun m!340931 () Bool)

(assert (=> b!222631 m!340931))

(declare-fun m!340933 () Bool)

(assert (=> b!222629 m!340933))

(declare-fun m!340935 () Bool)

(assert (=> b!222632 m!340935))

(check-sat (not b!222628) (not start!46246) (not b!222629) (not b!222632) (not b!222631) (not b!222633))
