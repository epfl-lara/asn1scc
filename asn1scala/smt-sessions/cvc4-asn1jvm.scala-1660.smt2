; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46254 () Bool)

(assert start!46254)

(declare-fun b!222700 () Bool)

(declare-fun e!151465 () Bool)

(declare-fun e!151466 () Bool)

(assert (=> b!222700 (= e!151465 e!151466)))

(declare-fun res!186968 () Bool)

(assert (=> b!222700 (=> (not res!186968) (not e!151466))))

(declare-datatypes ((array!10912 0))(
  ( (array!10913 (arr!5718 (Array (_ BitVec 32) (_ BitVec 8))) (size!4788 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8678 0))(
  ( (BitStream!8679 (buf!5332 array!10912) (currentByte!10002 (_ BitVec 32)) (currentBit!9997 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8678)

(declare-datatypes ((tuple2!18996 0))(
  ( (tuple2!18997 (_1!10207 (_ BitVec 8)) (_2!10207 BitStream!8678)) )
))
(declare-fun lt!351403 () tuple2!18996)

(assert (=> b!222700 (= res!186968 (= (size!4788 (buf!5332 thiss!1870)) (size!4788 (buf!5332 (_2!10207 lt!351403)))))))

(declare-fun readByte!0 (BitStream!8678) tuple2!18996)

(assert (=> b!222700 (= lt!351403 (readByte!0 thiss!1870))))

(declare-fun b!222701 () Bool)

(declare-fun res!186966 () Bool)

(assert (=> b!222701 (=> (not res!186966) (not e!151466))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!222701 (= res!186966 (bvsle #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!4788 (buf!5332 (_2!10207 lt!351403))) (currentByte!10002 (_2!10207 lt!351403)) (currentBit!9997 (_2!10207 lt!351403)))))))

(declare-fun b!222702 () Bool)

(declare-fun res!186965 () Bool)

(assert (=> b!222702 (=> (not res!186965) (not e!151465))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!222702 (= res!186965 (bvslt i!761 to!496))))

(declare-fun res!186967 () Bool)

(assert (=> start!46254 (=> (not res!186967) (not e!151465))))

(declare-fun arr!308 () array!10912)

(assert (=> start!46254 (= res!186967 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4788 arr!308))))))

(assert (=> start!46254 e!151465))

(assert (=> start!46254 true))

(declare-fun array_inv!4529 (array!10912) Bool)

(assert (=> start!46254 (array_inv!4529 arr!308)))

(declare-fun e!151463 () Bool)

(declare-fun inv!12 (BitStream!8678) Bool)

(assert (=> start!46254 (and (inv!12 thiss!1870) e!151463)))

(declare-fun b!222703 () Bool)

(assert (=> b!222703 (= e!151463 (array_inv!4529 (buf!5332 thiss!1870)))))

(declare-fun b!222704 () Bool)

(assert (=> b!222704 (= e!151466 false)))

(declare-fun lt!351404 () (_ BitVec 64))

(assert (=> b!222704 (= lt!351404 (bitIndex!0 (size!4788 (buf!5332 thiss!1870)) (currentByte!10002 thiss!1870) (currentBit!9997 thiss!1870)))))

(declare-fun b!222705 () Bool)

(declare-fun res!186969 () Bool)

(assert (=> b!222705 (=> (not res!186969) (not e!151465))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!222705 (= res!186969 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4788 (buf!5332 thiss!1870))) ((_ sign_extend 32) (currentByte!10002 thiss!1870)) ((_ sign_extend 32) (currentBit!9997 thiss!1870)) (bvsub to!496 i!761)))))

(assert (= (and start!46254 res!186967) b!222705))

(assert (= (and b!222705 res!186969) b!222702))

(assert (= (and b!222702 res!186965) b!222700))

(assert (= (and b!222700 res!186968) b!222701))

(assert (= (and b!222701 res!186966) b!222704))

(assert (= start!46254 b!222703))

(declare-fun m!340979 () Bool)

(assert (=> b!222700 m!340979))

(declare-fun m!340981 () Bool)

(assert (=> start!46254 m!340981))

(declare-fun m!340983 () Bool)

(assert (=> start!46254 m!340983))

(declare-fun m!340985 () Bool)

(assert (=> b!222703 m!340985))

(declare-fun m!340987 () Bool)

(assert (=> b!222705 m!340987))

(declare-fun m!340989 () Bool)

(assert (=> b!222701 m!340989))

(declare-fun m!340991 () Bool)

(assert (=> b!222704 m!340991))

(push 1)

(assert (not b!222703))

(assert (not b!222704))

(assert (not b!222701))

(assert (not b!222700))

(assert (not b!222705))

(assert (not start!46254))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

