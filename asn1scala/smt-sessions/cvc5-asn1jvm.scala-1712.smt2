; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47336 () Bool)

(assert start!47336)

(declare-fun b!225833 () Bool)

(declare-fun res!189510 () Bool)

(declare-fun e!154263 () Bool)

(assert (=> b!225833 (=> (not res!189510) (not e!154263))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!225833 (= res!189510 (bvslt i!761 to!496))))

(declare-fun b!225834 () Bool)

(declare-fun e!154267 () Bool)

(assert (=> b!225834 (= e!154267 false)))

(declare-fun lt!358932 () (_ BitVec 64))

(declare-datatypes ((array!11264 0))(
  ( (array!11265 (arr!5899 (Array (_ BitVec 32) (_ BitVec 8))) (size!4942 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8980 0))(
  ( (BitStream!8981 (buf!5483 array!11264) (currentByte!10279 (_ BitVec 32)) (currentBit!10274 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!19328 0))(
  ( (tuple2!19329 (_1!10451 (_ BitVec 8)) (_2!10451 BitStream!8980)) )
))
(declare-fun lt!358931 () tuple2!19328)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!225834 (= lt!358932 (bitIndex!0 (size!4942 (buf!5483 (_2!10451 lt!358931))) (currentByte!10279 (_2!10451 lt!358931)) (currentBit!10274 (_2!10451 lt!358931))))))

(declare-fun b!225835 () Bool)

(assert (=> b!225835 (= e!154263 e!154267)))

(declare-fun res!189509 () Bool)

(assert (=> b!225835 (=> (not res!189509) (not e!154267))))

(declare-fun thiss!1870 () BitStream!8980)

(assert (=> b!225835 (= res!189509 (= (size!4942 (buf!5483 thiss!1870)) (size!4942 (buf!5483 (_2!10451 lt!358931)))))))

(declare-fun readByte!0 (BitStream!8980) tuple2!19328)

(assert (=> b!225835 (= lt!358931 (readByte!0 thiss!1870))))

(declare-fun b!225836 () Bool)

(declare-fun e!154265 () Bool)

(declare-fun array_inv!4683 (array!11264) Bool)

(assert (=> b!225836 (= e!154265 (array_inv!4683 (buf!5483 thiss!1870)))))

(declare-fun b!225837 () Bool)

(declare-fun res!189508 () Bool)

(assert (=> b!225837 (=> (not res!189508) (not e!154263))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225837 (= res!189508 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4942 (buf!5483 thiss!1870))) ((_ sign_extend 32) (currentByte!10279 thiss!1870)) ((_ sign_extend 32) (currentBit!10274 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!189511 () Bool)

(assert (=> start!47336 (=> (not res!189511) (not e!154263))))

(declare-fun arr!308 () array!11264)

(assert (=> start!47336 (= res!189511 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4942 arr!308))))))

(assert (=> start!47336 e!154263))

(assert (=> start!47336 true))

(assert (=> start!47336 (array_inv!4683 arr!308)))

(declare-fun inv!12 (BitStream!8980) Bool)

(assert (=> start!47336 (and (inv!12 thiss!1870) e!154265)))

(assert (= (and start!47336 res!189511) b!225837))

(assert (= (and b!225837 res!189508) b!225833))

(assert (= (and b!225833 res!189510) b!225835))

(assert (= (and b!225835 res!189509) b!225834))

(assert (= start!47336 b!225836))

(declare-fun m!346879 () Bool)

(assert (=> b!225836 m!346879))

(declare-fun m!346881 () Bool)

(assert (=> start!47336 m!346881))

(declare-fun m!346883 () Bool)

(assert (=> start!47336 m!346883))

(declare-fun m!346885 () Bool)

(assert (=> b!225835 m!346885))

(declare-fun m!346887 () Bool)

(assert (=> b!225837 m!346887))

(declare-fun m!346889 () Bool)

(assert (=> b!225834 m!346889))

(push 1)

(assert (not b!225836))

(assert (not start!47336))

(assert (not b!225837))

(assert (not b!225835))

(assert (not b!225834))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

