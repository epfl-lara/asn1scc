; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46256 () Bool)

(assert start!46256)

(declare-fun res!186983 () Bool)

(declare-fun e!151480 () Bool)

(assert (=> start!46256 (=> (not res!186983) (not e!151480))))

(declare-datatypes ((array!10914 0))(
  ( (array!10915 (arr!5719 (Array (_ BitVec 32) (_ BitVec 8))) (size!4789 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!10914)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!46256 (= res!186983 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4789 arr!308))))))

(assert (=> start!46256 e!151480))

(assert (=> start!46256 true))

(declare-fun array_inv!4530 (array!10914) Bool)

(assert (=> start!46256 (array_inv!4530 arr!308)))

(declare-datatypes ((BitStream!8680 0))(
  ( (BitStream!8681 (buf!5333 array!10914) (currentByte!10003 (_ BitVec 32)) (currentBit!9998 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8680)

(declare-fun e!151481 () Bool)

(declare-fun inv!12 (BitStream!8680) Bool)

(assert (=> start!46256 (and (inv!12 thiss!1870) e!151481)))

(declare-fun b!222718 () Bool)

(assert (=> b!222718 (= e!151481 (array_inv!4530 (buf!5333 thiss!1870)))))

(declare-fun b!222719 () Bool)

(declare-fun res!186982 () Bool)

(assert (=> b!222719 (=> (not res!186982) (not e!151480))))

(assert (=> b!222719 (= res!186982 (bvslt i!761 to!496))))

(declare-fun b!222720 () Bool)

(declare-fun e!151479 () Bool)

(assert (=> b!222720 (= e!151480 e!151479)))

(declare-fun res!186981 () Bool)

(assert (=> b!222720 (=> (not res!186981) (not e!151479))))

(declare-datatypes ((tuple2!18998 0))(
  ( (tuple2!18999 (_1!10208 (_ BitVec 8)) (_2!10208 BitStream!8680)) )
))
(declare-fun lt!351409 () tuple2!18998)

(assert (=> b!222720 (= res!186981 (= (size!4789 (buf!5333 thiss!1870)) (size!4789 (buf!5333 (_2!10208 lt!351409)))))))

(declare-fun readByte!0 (BitStream!8680) tuple2!18998)

(assert (=> b!222720 (= lt!351409 (readByte!0 thiss!1870))))

(declare-fun b!222721 () Bool)

(declare-fun res!186984 () Bool)

(assert (=> b!222721 (=> (not res!186984) (not e!151479))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!222721 (= res!186984 (bvsle #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!4789 (buf!5333 (_2!10208 lt!351409))) (currentByte!10003 (_2!10208 lt!351409)) (currentBit!9998 (_2!10208 lt!351409)))))))

(declare-fun b!222722 () Bool)

(declare-fun res!186980 () Bool)

(assert (=> b!222722 (=> (not res!186980) (not e!151480))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!222722 (= res!186980 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4789 (buf!5333 thiss!1870))) ((_ sign_extend 32) (currentByte!10003 thiss!1870)) ((_ sign_extend 32) (currentBit!9998 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!222723 () Bool)

(assert (=> b!222723 (= e!151479 false)))

(declare-fun lt!351410 () (_ BitVec 64))

(assert (=> b!222723 (= lt!351410 (bitIndex!0 (size!4789 (buf!5333 thiss!1870)) (currentByte!10003 thiss!1870) (currentBit!9998 thiss!1870)))))

(assert (= (and start!46256 res!186983) b!222722))

(assert (= (and b!222722 res!186980) b!222719))

(assert (= (and b!222719 res!186982) b!222720))

(assert (= (and b!222720 res!186981) b!222721))

(assert (= (and b!222721 res!186984) b!222723))

(assert (= start!46256 b!222718))

(declare-fun m!340993 () Bool)

(assert (=> b!222718 m!340993))

(declare-fun m!340995 () Bool)

(assert (=> b!222720 m!340995))

(declare-fun m!340997 () Bool)

(assert (=> b!222723 m!340997))

(declare-fun m!340999 () Bool)

(assert (=> start!46256 m!340999))

(declare-fun m!341001 () Bool)

(assert (=> start!46256 m!341001))

(declare-fun m!341003 () Bool)

(assert (=> b!222721 m!341003))

(declare-fun m!341005 () Bool)

(assert (=> b!222722 m!341005))

(push 1)

(assert (not b!222723))

(assert (not b!222722))

(assert (not start!46256))

(assert (not b!222720))

(assert (not b!222718))

(assert (not b!222721))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

