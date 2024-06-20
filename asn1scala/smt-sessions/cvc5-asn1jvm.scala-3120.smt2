; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71678 () Bool)

(assert start!71678)

(declare-fun b!321949 () Bool)

(declare-fun e!232023 () Bool)

(assert (=> b!321949 (= e!232023 false)))

(declare-fun lt!444701 () (_ BitVec 64))

(declare-datatypes ((array!20524 0))(
  ( (array!20525 (arr!10027 (Array (_ BitVec 32) (_ BitVec 8))) (size!8935 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14032 0))(
  ( (BitStream!14033 (buf!8077 array!20524) (currentByte!14888 (_ BitVec 32)) (currentBit!14883 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14032)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!321949 (= lt!444701 (bitIndex!0 (size!8935 (buf!8077 thiss!1793)) (currentByte!14888 thiss!1793) (currentBit!14883 thiss!1793)))))

(declare-fun b!321950 () Bool)

(declare-fun res!264266 () Bool)

(assert (=> b!321950 (=> (not res!264266) (not e!232023))))

(declare-fun acc!161 () (_ BitVec 64))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!321950 (= res!264266 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!264267 () Bool)

(assert (=> start!71678 (=> (not res!264267) (not e!232023))))

(declare-fun nBits!548 () (_ BitVec 32))

(assert (=> start!71678 (= res!264267 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!71678 e!232023))

(assert (=> start!71678 true))

(declare-fun e!232022 () Bool)

(declare-fun inv!12 (BitStream!14032) Bool)

(assert (=> start!71678 (and (inv!12 thiss!1793) e!232022)))

(declare-fun b!321948 () Bool)

(declare-fun array_inv!8487 (array!20524) Bool)

(assert (=> b!321948 (= e!232022 (array_inv!8487 (buf!8077 thiss!1793)))))

(declare-fun b!321951 () Bool)

(declare-fun res!264265 () Bool)

(assert (=> b!321951 (=> (not res!264265) (not e!232023))))

(assert (=> b!321951 (= res!264265 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (= nBits!548 i!743)))))

(declare-fun b!321952 () Bool)

(declare-fun res!264268 () Bool)

(assert (=> b!321952 (=> (not res!264268) (not e!232023))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!321952 (= res!264268 (validate_offset_bits!1 ((_ sign_extend 32) (size!8935 (buf!8077 thiss!1793))) ((_ sign_extend 32) (currentByte!14888 thiss!1793)) ((_ sign_extend 32) (currentBit!14883 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(assert (= (and start!71678 res!264267) b!321952))

(assert (= (and b!321952 res!264268) b!321950))

(assert (= (and b!321950 res!264266) b!321951))

(assert (= (and b!321951 res!264265) b!321949))

(assert (= start!71678 b!321948))

(declare-fun m!460221 () Bool)

(assert (=> start!71678 m!460221))

(declare-fun m!460223 () Bool)

(assert (=> b!321952 m!460223))

(declare-fun m!460225 () Bool)

(assert (=> b!321949 m!460225))

(declare-fun m!460227 () Bool)

(assert (=> b!321950 m!460227))

(declare-fun m!460229 () Bool)

(assert (=> b!321948 m!460229))

(push 1)

(assert (not b!321949))

(assert (not start!71678))

(assert (not b!321952))

(assert (not b!321948))

(assert (not b!321950))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

