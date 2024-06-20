; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63636 () Bool)

(assert start!63636)

(declare-fun res!235274 () Bool)

(declare-fun e!202950 () Bool)

(assert (=> start!63636 (=> (not res!235274) (not e!202950))))

(declare-datatypes ((array!16588 0))(
  ( (array!16589 (arr!8157 (Array (_ BitVec 32) (_ BitVec 8))) (size!7161 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12692 0))(
  ( (BitStream!12693 (buf!7407 array!16588) (currentByte!13727 (_ BitVec 32)) (currentBit!13722 (_ BitVec 32))) )
))
(declare-fun thiss!1929 () BitStream!12692)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63636 (= res!235274 (validate_offset_bits!1 ((_ sign_extend 32) (size!7161 (buf!7407 thiss!1929))) ((_ sign_extend 32) (currentByte!13727 thiss!1929)) ((_ sign_extend 32) (currentBit!13722 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13722 thiss!1929)) #b00000000000000000000000000000111))))))

(assert (=> start!63636 e!202950))

(declare-fun e!202949 () Bool)

(declare-fun inv!12 (BitStream!12692) Bool)

(assert (=> start!63636 (and (inv!12 thiss!1929) e!202949)))

(declare-fun b!283972 () Bool)

(declare-fun res!235273 () Bool)

(assert (=> b!283972 (=> (not res!235273) (not e!202950))))

(assert (=> b!283972 (= res!235273 (= (currentBit!13722 thiss!1929) #b00000000000000000000000000000000))))

(declare-fun b!283973 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!283973 (= e!202950 (not (invariant!0 (currentBit!13722 thiss!1929) (currentByte!13727 thiss!1929) (size!7161 (buf!7407 thiss!1929)))))))

(declare-fun b!283974 () Bool)

(declare-fun array_inv!6854 (array!16588) Bool)

(assert (=> b!283974 (= e!202949 (array_inv!6854 (buf!7407 thiss!1929)))))

(assert (= (and start!63636 res!235274) b!283972))

(assert (= (and b!283972 res!235273) b!283973))

(assert (= start!63636 b!283974))

(declare-fun m!417097 () Bool)

(assert (=> start!63636 m!417097))

(declare-fun m!417099 () Bool)

(assert (=> start!63636 m!417099))

(declare-fun m!417101 () Bool)

(assert (=> b!283973 m!417101))

(declare-fun m!417103 () Bool)

(assert (=> b!283974 m!417103))

(push 1)

(assert (not b!283974))

(assert (not b!283973))

(assert (not start!63636))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97606 () Bool)

(assert (=> d!97606 (= (array_inv!6854 (buf!7407 thiss!1929)) (bvsge (size!7161 (buf!7407 thiss!1929)) #b00000000000000000000000000000000))))

(assert (=> b!283974 d!97606))

(declare-fun d!97610 () Bool)

(assert (=> d!97610 (= (invariant!0 (currentBit!13722 thiss!1929) (currentByte!13727 thiss!1929) (size!7161 (buf!7407 thiss!1929))) (and (bvsge (currentBit!13722 thiss!1929) #b00000000000000000000000000000000) (bvslt (currentBit!13722 thiss!1929) #b00000000000000000000000000001000) (bvsge (currentByte!13727 thiss!1929) #b00000000000000000000000000000000) (or (bvslt (currentByte!13727 thiss!1929) (size!7161 (buf!7407 thiss!1929))) (and (= (currentBit!13722 thiss!1929) #b00000000000000000000000000000000) (= (currentByte!13727 thiss!1929) (size!7161 (buf!7407 thiss!1929)))))))))

(assert (=> b!283973 d!97610))

(declare-fun d!97622 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!97622 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7161 (buf!7407 thiss!1929))) ((_ sign_extend 32) (currentByte!13727 thiss!1929)) ((_ sign_extend 32) (currentBit!13722 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13722 thiss!1929)) #b00000000000000000000000000000111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7161 (buf!7407 thiss!1929))) ((_ sign_extend 32) (currentByte!13727 thiss!1929)) ((_ sign_extend 32) (currentBit!13722 thiss!1929))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13722 thiss!1929)) #b00000000000000000000000000000111))))))

(declare-fun bs!24661 () Bool)

(assert (= bs!24661 d!97622))

(declare-fun m!417109 () Bool)

(assert (=> bs!24661 m!417109))

(assert (=> start!63636 d!97622))

(declare-fun d!97624 () Bool)

(assert (=> d!97624 (= (inv!12 thiss!1929) (invariant!0 (currentBit!13722 thiss!1929) (currentByte!13727 thiss!1929) (size!7161 (buf!7407 thiss!1929))))))

(declare-fun bs!24662 () Bool)

(assert (= bs!24662 d!97624))

(assert (=> bs!24662 m!417101))

(assert (=> start!63636 d!97624))

(push 1)

