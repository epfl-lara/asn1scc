; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46264 () Bool)

(assert start!46264)

(declare-fun b!222790 () Bool)

(declare-fun res!187040 () Bool)

(declare-fun e!151540 () Bool)

(assert (=> b!222790 (=> (not res!187040) (not e!151540))))

(declare-datatypes ((array!10922 0))(
  ( (array!10923 (arr!5723 (Array (_ BitVec 32) (_ BitVec 8))) (size!4793 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8688 0))(
  ( (BitStream!8689 (buf!5337 array!10922) (currentByte!10007 (_ BitVec 32)) (currentBit!10002 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8688)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!222790 (= res!187040 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4793 (buf!5337 thiss!1870))) ((_ sign_extend 32) (currentByte!10007 thiss!1870)) ((_ sign_extend 32) (currentBit!10002 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!222791 () Bool)

(declare-fun e!151537 () Bool)

(assert (=> b!222791 (= e!151540 e!151537)))

(declare-fun res!187044 () Bool)

(assert (=> b!222791 (=> (not res!187044) (not e!151537))))

(declare-datatypes ((tuple2!19006 0))(
  ( (tuple2!19007 (_1!10212 (_ BitVec 8)) (_2!10212 BitStream!8688)) )
))
(declare-fun lt!351434 () tuple2!19006)

(assert (=> b!222791 (= res!187044 (= (size!4793 (buf!5337 thiss!1870)) (size!4793 (buf!5337 (_2!10212 lt!351434)))))))

(declare-fun readByte!0 (BitStream!8688) tuple2!19006)

(assert (=> b!222791 (= lt!351434 (readByte!0 thiss!1870))))

(declare-fun b!222792 () Bool)

(declare-fun e!151539 () Bool)

(declare-fun array_inv!4534 (array!10922) Bool)

(assert (=> b!222792 (= e!151539 (array_inv!4534 (buf!5337 thiss!1870)))))

(declare-fun b!222793 () Bool)

(assert (=> b!222793 (= e!151537 false)))

(declare-fun lt!351433 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!222793 (= lt!351433 (bitIndex!0 (size!4793 (buf!5337 thiss!1870)) (currentByte!10007 thiss!1870) (currentBit!10002 thiss!1870)))))

(declare-fun res!187042 () Bool)

(assert (=> start!46264 (=> (not res!187042) (not e!151540))))

(declare-fun arr!308 () array!10922)

(assert (=> start!46264 (= res!187042 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4793 arr!308))))))

(assert (=> start!46264 e!151540))

(assert (=> start!46264 true))

(assert (=> start!46264 (array_inv!4534 arr!308)))

(declare-fun inv!12 (BitStream!8688) Bool)

(assert (=> start!46264 (and (inv!12 thiss!1870) e!151539)))

(declare-fun b!222794 () Bool)

(declare-fun res!187043 () Bool)

(assert (=> b!222794 (=> (not res!187043) (not e!151540))))

(assert (=> b!222794 (= res!187043 (bvslt i!761 to!496))))

(declare-fun b!222795 () Bool)

(declare-fun res!187041 () Bool)

(assert (=> b!222795 (=> (not res!187041) (not e!151537))))

(assert (=> b!222795 (= res!187041 (bvsle #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!4793 (buf!5337 (_2!10212 lt!351434))) (currentByte!10007 (_2!10212 lt!351434)) (currentBit!10002 (_2!10212 lt!351434)))))))

(assert (= (and start!46264 res!187042) b!222790))

(assert (= (and b!222790 res!187040) b!222794))

(assert (= (and b!222794 res!187043) b!222791))

(assert (= (and b!222791 res!187044) b!222795))

(assert (= (and b!222795 res!187041) b!222793))

(assert (= start!46264 b!222792))

(declare-fun m!341049 () Bool)

(assert (=> start!46264 m!341049))

(declare-fun m!341051 () Bool)

(assert (=> start!46264 m!341051))

(declare-fun m!341053 () Bool)

(assert (=> b!222790 m!341053))

(declare-fun m!341055 () Bool)

(assert (=> b!222793 m!341055))

(declare-fun m!341057 () Bool)

(assert (=> b!222795 m!341057))

(declare-fun m!341059 () Bool)

(assert (=> b!222792 m!341059))

(declare-fun m!341061 () Bool)

(assert (=> b!222791 m!341061))

(check-sat (not start!46264) (not b!222793) (not b!222790) (not b!222792) (not b!222791) (not b!222795))
