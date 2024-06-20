; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46248 () Bool)

(assert start!46248)

(declare-fun b!222646 () Bool)

(declare-fun e!151417 () Bool)

(assert (=> b!222646 (= e!151417 false)))

(declare-fun lt!351386 () (_ BitVec 64))

(declare-datatypes ((array!10906 0))(
  ( (array!10907 (arr!5715 (Array (_ BitVec 32) (_ BitVec 8))) (size!4785 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8672 0))(
  ( (BitStream!8673 (buf!5329 array!10906) (currentByte!9999 (_ BitVec 32)) (currentBit!9994 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8672)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!222646 (= lt!351386 (bitIndex!0 (size!4785 (buf!5329 thiss!1870)) (currentByte!9999 thiss!1870) (currentBit!9994 thiss!1870)))))

(declare-fun res!186924 () Bool)

(declare-fun e!151419 () Bool)

(assert (=> start!46248 (=> (not res!186924) (not e!151419))))

(declare-fun arr!308 () array!10906)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!46248 (= res!186924 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4785 arr!308))))))

(assert (=> start!46248 e!151419))

(assert (=> start!46248 true))

(declare-fun array_inv!4526 (array!10906) Bool)

(assert (=> start!46248 (array_inv!4526 arr!308)))

(declare-fun e!151421 () Bool)

(declare-fun inv!12 (BitStream!8672) Bool)

(assert (=> start!46248 (and (inv!12 thiss!1870) e!151421)))

(declare-fun b!222647 () Bool)

(assert (=> b!222647 (= e!151419 e!151417)))

(declare-fun res!186920 () Bool)

(assert (=> b!222647 (=> (not res!186920) (not e!151417))))

(declare-datatypes ((tuple2!18990 0))(
  ( (tuple2!18991 (_1!10204 (_ BitVec 8)) (_2!10204 BitStream!8672)) )
))
(declare-fun lt!351385 () tuple2!18990)

(assert (=> b!222647 (= res!186920 (= (size!4785 (buf!5329 thiss!1870)) (size!4785 (buf!5329 (_2!10204 lt!351385)))))))

(declare-fun readByte!0 (BitStream!8672) tuple2!18990)

(assert (=> b!222647 (= lt!351385 (readByte!0 thiss!1870))))

(declare-fun b!222648 () Bool)

(declare-fun res!186923 () Bool)

(assert (=> b!222648 (=> (not res!186923) (not e!151419))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!222648 (= res!186923 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4785 (buf!5329 thiss!1870))) ((_ sign_extend 32) (currentByte!9999 thiss!1870)) ((_ sign_extend 32) (currentBit!9994 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!222649 () Bool)

(declare-fun res!186921 () Bool)

(assert (=> b!222649 (=> (not res!186921) (not e!151419))))

(assert (=> b!222649 (= res!186921 (bvslt i!761 to!496))))

(declare-fun b!222650 () Bool)

(declare-fun res!186922 () Bool)

(assert (=> b!222650 (=> (not res!186922) (not e!151417))))

(assert (=> b!222650 (= res!186922 (bvsle #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!4785 (buf!5329 (_2!10204 lt!351385))) (currentByte!9999 (_2!10204 lt!351385)) (currentBit!9994 (_2!10204 lt!351385)))))))

(declare-fun b!222651 () Bool)

(assert (=> b!222651 (= e!151421 (array_inv!4526 (buf!5329 thiss!1870)))))

(assert (= (and start!46248 res!186924) b!222648))

(assert (= (and b!222648 res!186923) b!222649))

(assert (= (and b!222649 res!186921) b!222647))

(assert (= (and b!222647 res!186920) b!222650))

(assert (= (and b!222650 res!186922) b!222646))

(assert (= start!46248 b!222651))

(declare-fun m!340937 () Bool)

(assert (=> start!46248 m!340937))

(declare-fun m!340939 () Bool)

(assert (=> start!46248 m!340939))

(declare-fun m!340941 () Bool)

(assert (=> b!222646 m!340941))

(declare-fun m!340943 () Bool)

(assert (=> b!222648 m!340943))

(declare-fun m!340945 () Bool)

(assert (=> b!222651 m!340945))

(declare-fun m!340947 () Bool)

(assert (=> b!222650 m!340947))

(declare-fun m!340949 () Bool)

(assert (=> b!222647 m!340949))

(push 1)

