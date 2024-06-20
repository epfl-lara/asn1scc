; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4748 () Bool)

(assert start!4748)

(declare-fun res!16468 () Bool)

(declare-fun e!12228 () Bool)

(assert (=> start!4748 (=> (not res!16468) (not e!12228))))

(declare-datatypes ((array!1321 0))(
  ( (array!1322 (arr!999 (Array (_ BitVec 32) (_ BitVec 8))) (size!558 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1321)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!4748 (= res!16468 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!558 srcBuffer!2))))))))

(assert (=> start!4748 e!12228))

(assert (=> start!4748 true))

(declare-fun array_inv!528 (array!1321) Bool)

(assert (=> start!4748 (array_inv!528 srcBuffer!2)))

(declare-datatypes ((BitStream!950 0))(
  ( (BitStream!951 (buf!858 array!1321) (currentByte!2127 (_ BitVec 32)) (currentBit!2122 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!950)

(declare-fun e!12226 () Bool)

(declare-fun inv!12 (BitStream!950) Bool)

(assert (=> start!4748 (and (inv!12 thiss!1379) e!12226)))

(declare-fun b!18813 () Bool)

(declare-fun res!16469 () Bool)

(assert (=> b!18813 (=> (not res!16469) (not e!12228))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!18813 (= res!16469 (validate_offset_bits!1 ((_ sign_extend 32) (size!558 (buf!858 thiss!1379))) ((_ sign_extend 32) (currentByte!2127 thiss!1379)) ((_ sign_extend 32) (currentBit!2122 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!18814 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!18814 (= e!12228 (not (invariant!0 (currentBit!2122 thiss!1379) (currentByte!2127 thiss!1379) (size!558 (buf!858 thiss!1379)))))))

(declare-fun b!18815 () Bool)

(assert (=> b!18815 (= e!12226 (array_inv!528 (buf!858 thiss!1379)))))

(assert (= (and start!4748 res!16468) b!18813))

(assert (= (and b!18813 res!16469) b!18814))

(assert (= start!4748 b!18815))

(declare-fun m!25269 () Bool)

(assert (=> start!4748 m!25269))

(declare-fun m!25271 () Bool)

(assert (=> start!4748 m!25271))

(declare-fun m!25273 () Bool)

(assert (=> b!18813 m!25273))

(declare-fun m!25275 () Bool)

(assert (=> b!18814 m!25275))

(declare-fun m!25277 () Bool)

(assert (=> b!18815 m!25277))

(push 1)

(assert (not b!18815))

(assert (not start!4748))

(assert (not b!18814))

(assert (not b!18813))

(check-sat)

(pop 1)

(push 1)

(check-sat)

