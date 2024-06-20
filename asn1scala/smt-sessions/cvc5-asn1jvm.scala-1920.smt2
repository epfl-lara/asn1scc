; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50208 () Bool)

(assert start!50208)

(declare-fun res!197082 () Bool)

(declare-fun e!162980 () Bool)

(assert (=> start!50208 (=> (not res!197082) (not e!162980))))

(declare-fun i!756 () (_ BitVec 32))

(declare-fun nBits!593 () (_ BitVec 32))

(assert (=> start!50208 (= res!197082 (and (bvsle #b00000000000000000000000000000000 i!756) (bvsle i!756 nBits!593) (bvsle nBits!593 #b00000000000000000000000001000000)))))

(assert (=> start!50208 e!162980))

(assert (=> start!50208 true))

(declare-datatypes ((array!12426 0))(
  ( (array!12427 (arr!6445 (Array (_ BitVec 32) (_ BitVec 8))) (size!5458 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9880 0))(
  ( (BitStream!9881 (buf!5933 array!12426) (currentByte!11042 (_ BitVec 32)) (currentBit!11037 (_ BitVec 32))) )
))
(declare-fun thiss!1848 () BitStream!9880)

(declare-fun e!162978 () Bool)

(declare-fun inv!12 (BitStream!9880) Bool)

(assert (=> start!50208 (and (inv!12 thiss!1848) e!162978)))

(declare-fun b!235759 () Bool)

(assert (=> b!235759 (= e!162980 (bvsgt #b00000000000000000000000000000000 nBits!593))))

(declare-fun b!235758 () Bool)

(declare-fun res!197080 () Bool)

(assert (=> b!235758 (=> (not res!197080) (not e!162980))))

(declare-fun acc!174 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!235758 (= res!197080 (= (bvand acc!174 (onesLSBLong!0 (bvsub nBits!593 i!756))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!235760 () Bool)

(declare-fun array_inv!5199 (array!12426) Bool)

(assert (=> b!235760 (= e!162978 (array_inv!5199 (buf!5933 thiss!1848)))))

(declare-fun b!235757 () Bool)

(declare-fun res!197081 () Bool)

(assert (=> b!235757 (=> (not res!197081) (not e!162980))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!235757 (= res!197081 (validate_offset_bits!1 ((_ sign_extend 32) (size!5458 (buf!5933 thiss!1848))) ((_ sign_extend 32) (currentByte!11042 thiss!1848)) ((_ sign_extend 32) (currentBit!11037 thiss!1848)) ((_ sign_extend 32) (bvsub nBits!593 i!756))))))

(assert (= (and start!50208 res!197082) b!235757))

(assert (= (and b!235757 res!197081) b!235758))

(assert (= (and b!235758 res!197080) b!235759))

(assert (= start!50208 b!235760))

(declare-fun m!358431 () Bool)

(assert (=> start!50208 m!358431))

(declare-fun m!358433 () Bool)

(assert (=> b!235758 m!358433))

(declare-fun m!358435 () Bool)

(assert (=> b!235760 m!358435))

(declare-fun m!358437 () Bool)

(assert (=> b!235757 m!358437))

(push 1)

(assert (not start!50208))

(assert (not b!235758))

(assert (not b!235757))

(assert (not b!235760))

(check-sat)

(pop 1)

(push 1)

(check-sat)

