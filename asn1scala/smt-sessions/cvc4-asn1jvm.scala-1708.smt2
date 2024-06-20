; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47256 () Bool)

(assert start!47256)

(declare-fun res!189336 () Bool)

(declare-fun e!154076 () Bool)

(assert (=> start!47256 (=> (not res!189336) (not e!154076))))

(declare-datatypes ((array!11238 0))(
  ( (array!11239 (arr!5889 (Array (_ BitVec 32) (_ BitVec 8))) (size!4932 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11238)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!47256 (= res!189336 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4932 arr!308))))))

(assert (=> start!47256 e!154076))

(assert (=> start!47256 true))

(declare-fun array_inv!4673 (array!11238) Bool)

(assert (=> start!47256 (array_inv!4673 arr!308)))

(declare-datatypes ((BitStream!8960 0))(
  ( (BitStream!8961 (buf!5473 array!11238) (currentByte!10257 (_ BitVec 32)) (currentBit!10252 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8960)

(declare-fun e!154078 () Bool)

(declare-fun inv!12 (BitStream!8960) Bool)

(assert (=> start!47256 (and (inv!12 thiss!1870) e!154078)))

(declare-fun b!225637 () Bool)

(assert (=> b!225637 (= e!154076 (and (not (= (bvand to!496 #b10000000000000000000000000000000) (bvand i!761 #b10000000000000000000000000000000))) (not (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000)))))))

(declare-datatypes ((tuple2!19296 0))(
  ( (tuple2!19297 (_1!10435 (_ BitVec 8)) (_2!10435 BitStream!8960)) )
))
(declare-fun lt!358707 () tuple2!19296)

(declare-fun readByte!0 (BitStream!8960) tuple2!19296)

(assert (=> b!225637 (= lt!358707 (readByte!0 thiss!1870))))

(declare-fun b!225638 () Bool)

(assert (=> b!225638 (= e!154078 (array_inv!4673 (buf!5473 thiss!1870)))))

(declare-fun b!225636 () Bool)

(declare-fun res!189335 () Bool)

(assert (=> b!225636 (=> (not res!189335) (not e!154076))))

(assert (=> b!225636 (= res!189335 (bvslt i!761 to!496))))

(declare-fun b!225635 () Bool)

(declare-fun res!189334 () Bool)

(assert (=> b!225635 (=> (not res!189334) (not e!154076))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225635 (= res!189334 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4932 (buf!5473 thiss!1870))) ((_ sign_extend 32) (currentByte!10257 thiss!1870)) ((_ sign_extend 32) (currentBit!10252 thiss!1870)) (bvsub to!496 i!761)))))

(assert (= (and start!47256 res!189336) b!225635))

(assert (= (and b!225635 res!189334) b!225636))

(assert (= (and b!225636 res!189335) b!225637))

(assert (= start!47256 b!225638))

(declare-fun m!346667 () Bool)

(assert (=> start!47256 m!346667))

(declare-fun m!346669 () Bool)

(assert (=> start!47256 m!346669))

(declare-fun m!346671 () Bool)

(assert (=> b!225637 m!346671))

(declare-fun m!346673 () Bool)

(assert (=> b!225638 m!346673))

(declare-fun m!346675 () Bool)

(assert (=> b!225635 m!346675))

(push 1)

(assert (not b!225637))

(assert (not b!225635))

(assert (not start!47256))

(assert (not b!225638))

(check-sat)

(pop 1)

(push 1)

(check-sat)

