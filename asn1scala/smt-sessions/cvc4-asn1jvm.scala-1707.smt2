; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47250 () Bool)

(assert start!47250)

(declare-fun b!225602 () Bool)

(declare-fun e!154043 () Bool)

(declare-datatypes ((array!11232 0))(
  ( (array!11233 (arr!5886 (Array (_ BitVec 32) (_ BitVec 8))) (size!4929 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8954 0))(
  ( (BitStream!8955 (buf!5470 array!11232) (currentByte!10254 (_ BitVec 32)) (currentBit!10249 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8954)

(declare-fun array_inv!4670 (array!11232) Bool)

(assert (=> b!225602 (= e!154043 (array_inv!4670 (buf!5470 thiss!1870)))))

(declare-fun res!189308 () Bool)

(declare-fun e!154040 () Bool)

(assert (=> start!47250 (=> (not res!189308) (not e!154040))))

(declare-fun arr!308 () array!11232)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!47250 (= res!189308 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4929 arr!308))))))

(assert (=> start!47250 e!154040))

(assert (=> start!47250 true))

(assert (=> start!47250 (array_inv!4670 arr!308)))

(declare-fun inv!12 (BitStream!8954) Bool)

(assert (=> start!47250 (and (inv!12 thiss!1870) e!154043)))

(declare-fun b!225599 () Bool)

(declare-fun res!189307 () Bool)

(assert (=> b!225599 (=> (not res!189307) (not e!154040))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225599 (= res!189307 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4929 (buf!5470 thiss!1870))) ((_ sign_extend 32) (currentByte!10254 thiss!1870)) ((_ sign_extend 32) (currentBit!10249 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!225601 () Bool)

(assert (=> b!225601 (= e!154040 (bvsge i!761 (size!4929 arr!308)))))

(declare-datatypes ((tuple2!19290 0))(
  ( (tuple2!19291 (_1!10432 (_ BitVec 8)) (_2!10432 BitStream!8954)) )
))
(declare-fun lt!358698 () tuple2!19290)

(declare-fun readByte!0 (BitStream!8954) tuple2!19290)

(assert (=> b!225601 (= lt!358698 (readByte!0 thiss!1870))))

(declare-fun b!225600 () Bool)

(declare-fun res!189309 () Bool)

(assert (=> b!225600 (=> (not res!189309) (not e!154040))))

(assert (=> b!225600 (= res!189309 (bvslt i!761 to!496))))

(assert (= (and start!47250 res!189308) b!225599))

(assert (= (and b!225599 res!189307) b!225600))

(assert (= (and b!225600 res!189309) b!225601))

(assert (= start!47250 b!225602))

(declare-fun m!346637 () Bool)

(assert (=> b!225602 m!346637))

(declare-fun m!346639 () Bool)

(assert (=> start!47250 m!346639))

(declare-fun m!346641 () Bool)

(assert (=> start!47250 m!346641))

(declare-fun m!346643 () Bool)

(assert (=> b!225599 m!346643))

(declare-fun m!346645 () Bool)

(assert (=> b!225601 m!346645))

(push 1)

(assert (not b!225601))

(assert (not b!225599))

(assert (not start!47250))

(assert (not b!225602))

(check-sat)

(pop 1)

(push 1)

(check-sat)

