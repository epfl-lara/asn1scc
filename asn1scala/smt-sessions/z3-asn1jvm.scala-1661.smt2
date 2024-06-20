; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46258 () Bool)

(assert start!46258)

(declare-fun b!222736 () Bool)

(declare-fun e!151496 () Bool)

(declare-datatypes ((array!10916 0))(
  ( (array!10917 (arr!5720 (Array (_ BitVec 32) (_ BitVec 8))) (size!4790 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8682 0))(
  ( (BitStream!8683 (buf!5334 array!10916) (currentByte!10004 (_ BitVec 32)) (currentBit!9999 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8682)

(declare-fun array_inv!4531 (array!10916) Bool)

(assert (=> b!222736 (= e!151496 (array_inv!4531 (buf!5334 thiss!1870)))))

(declare-fun b!222737 () Bool)

(declare-fun res!186999 () Bool)

(declare-fun e!151494 () Bool)

(assert (=> b!222737 (=> (not res!186999) (not e!151494))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!222737 (= res!186999 (bvslt i!761 to!496))))

(declare-fun b!222739 () Bool)

(declare-fun e!151492 () Bool)

(assert (=> b!222739 (= e!151492 false)))

(declare-fun lt!351416 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!222739 (= lt!351416 (bitIndex!0 (size!4790 (buf!5334 thiss!1870)) (currentByte!10004 thiss!1870) (currentBit!9999 thiss!1870)))))

(declare-fun b!222740 () Bool)

(assert (=> b!222740 (= e!151494 e!151492)))

(declare-fun res!186995 () Bool)

(assert (=> b!222740 (=> (not res!186995) (not e!151492))))

(declare-datatypes ((tuple2!19000 0))(
  ( (tuple2!19001 (_1!10209 (_ BitVec 8)) (_2!10209 BitStream!8682)) )
))
(declare-fun lt!351415 () tuple2!19000)

(assert (=> b!222740 (= res!186995 (= (size!4790 (buf!5334 thiss!1870)) (size!4790 (buf!5334 (_2!10209 lt!351415)))))))

(declare-fun readByte!0 (BitStream!8682) tuple2!19000)

(assert (=> b!222740 (= lt!351415 (readByte!0 thiss!1870))))

(declare-fun b!222741 () Bool)

(declare-fun res!186997 () Bool)

(assert (=> b!222741 (=> (not res!186997) (not e!151494))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!222741 (= res!186997 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4790 (buf!5334 thiss!1870))) ((_ sign_extend 32) (currentByte!10004 thiss!1870)) ((_ sign_extend 32) (currentBit!9999 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!186998 () Bool)

(assert (=> start!46258 (=> (not res!186998) (not e!151494))))

(declare-fun arr!308 () array!10916)

(assert (=> start!46258 (= res!186998 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4790 arr!308))))))

(assert (=> start!46258 e!151494))

(assert (=> start!46258 true))

(assert (=> start!46258 (array_inv!4531 arr!308)))

(declare-fun inv!12 (BitStream!8682) Bool)

(assert (=> start!46258 (and (inv!12 thiss!1870) e!151496)))

(declare-fun b!222738 () Bool)

(declare-fun res!186996 () Bool)

(assert (=> b!222738 (=> (not res!186996) (not e!151492))))

(assert (=> b!222738 (= res!186996 (bvsle #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!4790 (buf!5334 (_2!10209 lt!351415))) (currentByte!10004 (_2!10209 lt!351415)) (currentBit!9999 (_2!10209 lt!351415)))))))

(assert (= (and start!46258 res!186998) b!222741))

(assert (= (and b!222741 res!186997) b!222737))

(assert (= (and b!222737 res!186999) b!222740))

(assert (= (and b!222740 res!186995) b!222738))

(assert (= (and b!222738 res!186996) b!222739))

(assert (= start!46258 b!222736))

(declare-fun m!341007 () Bool)

(assert (=> b!222739 m!341007))

(declare-fun m!341009 () Bool)

(assert (=> b!222736 m!341009))

(declare-fun m!341011 () Bool)

(assert (=> b!222740 m!341011))

(declare-fun m!341013 () Bool)

(assert (=> start!46258 m!341013))

(declare-fun m!341015 () Bool)

(assert (=> start!46258 m!341015))

(declare-fun m!341017 () Bool)

(assert (=> b!222738 m!341017))

(declare-fun m!341019 () Bool)

(assert (=> b!222741 m!341019))

(check-sat (not b!222736) (not start!46258) (not b!222741) (not b!222739) (not b!222740) (not b!222738))
