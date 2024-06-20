; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4744 () Bool)

(assert start!4744)

(declare-fun res!16456 () Bool)

(declare-fun e!12204 () Bool)

(assert (=> start!4744 (=> (not res!16456) (not e!12204))))

(declare-datatypes ((array!1317 0))(
  ( (array!1318 (arr!997 (Array (_ BitVec 32) (_ BitVec 8))) (size!556 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1317)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!4744 (= res!16456 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!556 srcBuffer!2))))))))

(assert (=> start!4744 e!12204))

(assert (=> start!4744 true))

(declare-fun array_inv!526 (array!1317) Bool)

(assert (=> start!4744 (array_inv!526 srcBuffer!2)))

(declare-datatypes ((BitStream!946 0))(
  ( (BitStream!947 (buf!856 array!1317) (currentByte!2125 (_ BitVec 32)) (currentBit!2120 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!946)

(declare-fun e!12202 () Bool)

(declare-fun inv!12 (BitStream!946) Bool)

(assert (=> start!4744 (and (inv!12 thiss!1379) e!12202)))

(declare-fun b!18795 () Bool)

(declare-fun res!16457 () Bool)

(assert (=> b!18795 (=> (not res!16457) (not e!12204))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!18795 (= res!16457 (validate_offset_bits!1 ((_ sign_extend 32) (size!556 (buf!856 thiss!1379))) ((_ sign_extend 32) (currentByte!2125 thiss!1379)) ((_ sign_extend 32) (currentBit!2120 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!18796 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!18796 (= e!12204 (not (invariant!0 (currentBit!2120 thiss!1379) (currentByte!2125 thiss!1379) (size!556 (buf!856 thiss!1379)))))))

(declare-fun b!18797 () Bool)

(assert (=> b!18797 (= e!12202 (array_inv!526 (buf!856 thiss!1379)))))

(assert (= (and start!4744 res!16456) b!18795))

(assert (= (and b!18795 res!16457) b!18796))

(assert (= start!4744 b!18797))

(declare-fun m!25249 () Bool)

(assert (=> start!4744 m!25249))

(declare-fun m!25251 () Bool)

(assert (=> start!4744 m!25251))

(declare-fun m!25253 () Bool)

(assert (=> b!18795 m!25253))

(declare-fun m!25255 () Bool)

(assert (=> b!18796 m!25255))

(declare-fun m!25257 () Bool)

(assert (=> b!18797 m!25257))

(push 1)

(assert (not b!18797))

(assert (not start!4744))

(assert (not b!18796))

(assert (not b!18795))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

