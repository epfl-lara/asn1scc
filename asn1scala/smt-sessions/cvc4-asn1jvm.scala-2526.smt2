; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63796 () Bool)

(assert start!63796)

(declare-fun res!235337 () Bool)

(declare-fun e!203074 () Bool)

(assert (=> start!63796 (=> (not res!235337) (not e!203074))))

(declare-datatypes ((array!16633 0))(
  ( (array!16634 (arr!8172 (Array (_ BitVec 32) (_ BitVec 8))) (size!7176 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12722 0))(
  ( (BitStream!12723 (buf!7422 array!16633) (currentByte!13774 (_ BitVec 32)) (currentBit!13769 (_ BitVec 32))) )
))
(declare-fun thiss!1929 () BitStream!12722)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63796 (= res!235337 (validate_offset_bits!1 ((_ sign_extend 32) (size!7176 (buf!7422 thiss!1929))) ((_ sign_extend 32) (currentByte!13774 thiss!1929)) ((_ sign_extend 32) (currentBit!13769 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13769 thiss!1929)) #b00000000000000000000000000000111))))))

(assert (=> start!63796 e!203074))

(declare-fun e!203075 () Bool)

(declare-fun inv!12 (BitStream!12722) Bool)

(assert (=> start!63796 (and (inv!12 thiss!1929) e!203075)))

(declare-fun b!284081 () Bool)

(assert (=> b!284081 (= e!203074 (and (not (= (currentBit!13769 thiss!1929) #b00000000000000000000000000000000)) (= (bvand (currentByte!13774 thiss!1929) #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand (currentByte!13774 thiss!1929) #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 (currentByte!13774 thiss!1929)) #b10000000000000000000000000000000)))))))

(declare-fun b!284082 () Bool)

(declare-fun array_inv!6869 (array!16633) Bool)

(assert (=> b!284082 (= e!203075 (array_inv!6869 (buf!7422 thiss!1929)))))

(assert (= (and start!63796 res!235337) b!284081))

(assert (= start!63796 b!284082))

(declare-fun m!417255 () Bool)

(assert (=> start!63796 m!417255))

(declare-fun m!417257 () Bool)

(assert (=> start!63796 m!417257))

(declare-fun m!417259 () Bool)

(assert (=> b!284082 m!417259))

(push 1)

(assert (not start!63796))

(assert (not b!284082))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97770 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!97770 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7176 (buf!7422 thiss!1929))) ((_ sign_extend 32) (currentByte!13774 thiss!1929)) ((_ sign_extend 32) (currentBit!13769 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13769 thiss!1929)) #b00000000000000000000000000000111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7176 (buf!7422 thiss!1929))) ((_ sign_extend 32) (currentByte!13774 thiss!1929)) ((_ sign_extend 32) (currentBit!13769 thiss!1929))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13769 thiss!1929)) #b00000000000000000000000000000111))))))

(declare-fun bs!24709 () Bool)

(assert (= bs!24709 d!97770))

(declare-fun m!417263 () Bool)

(assert (=> bs!24709 m!417263))

(assert (=> start!63796 d!97770))

(declare-fun d!97774 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!97774 (= (inv!12 thiss!1929) (invariant!0 (currentBit!13769 thiss!1929) (currentByte!13774 thiss!1929) (size!7176 (buf!7422 thiss!1929))))))

(declare-fun bs!24712 () Bool)

(assert (= bs!24712 d!97774))

(declare-fun m!417269 () Bool)

(assert (=> bs!24712 m!417269))

(assert (=> start!63796 d!97774))

(declare-fun d!97778 () Bool)

(assert (=> d!97778 (= (array_inv!6869 (buf!7422 thiss!1929)) (bvsge (size!7176 (buf!7422 thiss!1929)) #b00000000000000000000000000000000))))

(assert (=> b!284082 d!97778))

(push 1)

(assert (not d!97770))

(assert (not d!97774))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97788 () Bool)

(assert (=> d!97788 (= (remainingBits!0 ((_ sign_extend 32) (size!7176 (buf!7422 thiss!1929))) ((_ sign_extend 32) (currentByte!13774 thiss!1929)) ((_ sign_extend 32) (currentBit!13769 thiss!1929))) (bvsub (bvmul ((_ sign_extend 32) (size!7176 (buf!7422 thiss!1929))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13774 thiss!1929)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13769 thiss!1929)))))))

(assert (=> d!97770 d!97788))

(declare-fun d!97790 () Bool)

(assert (=> d!97790 (= (invariant!0 (currentBit!13769 thiss!1929) (currentByte!13774 thiss!1929) (size!7176 (buf!7422 thiss!1929))) (and (bvsge (currentBit!13769 thiss!1929) #b00000000000000000000000000000000) (bvslt (currentBit!13769 thiss!1929) #b00000000000000000000000000001000) (bvsge (currentByte!13774 thiss!1929) #b00000000000000000000000000000000) (or (bvslt (currentByte!13774 thiss!1929) (size!7176 (buf!7422 thiss!1929))) (and (= (currentBit!13769 thiss!1929) #b00000000000000000000000000000000) (= (currentByte!13774 thiss!1929) (size!7176 (buf!7422 thiss!1929)))))))))

(assert (=> d!97774 d!97790))

(push 1)

(check-sat)

