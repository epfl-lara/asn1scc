; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60240 () Bool)

(assert start!60240)

(declare-fun res!227863 () Bool)

(declare-fun e!193694 () Bool)

(assert (=> start!60240 (=> (not res!227863) (not e!193694))))

(declare-datatypes ((array!15402 0))(
  ( (array!15403 (arr!7675 (Array (_ BitVec 32) (_ BitVec 8))) (size!6688 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12190 0))(
  ( (BitStream!12191 (buf!7156 array!15402) (currentByte!13209 (_ BitVec 32)) (currentBit!13204 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12190)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12190 (_ BitVec 64)) Bool)

(assert (=> start!60240 (= res!227863 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60240 e!193694))

(declare-fun e!193695 () Bool)

(declare-fun inv!12 (BitStream!12190) Bool)

(assert (=> start!60240 (and (inv!12 thiss!882) e!193695)))

(assert (=> start!60240 true))

(declare-fun b!273804 () Bool)

(assert (=> b!273804 (= e!193694 (bvsge (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))

(declare-fun b!273805 () Bool)

(declare-fun array_inv!6412 (array!15402) Bool)

(assert (=> b!273805 (= e!193695 (array_inv!6412 (buf!7156 thiss!882)))))

(assert (= (and start!60240 res!227863) b!273804))

(assert (= start!60240 b!273805))

(declare-fun m!406581 () Bool)

(assert (=> start!60240 m!406581))

(declare-fun m!406583 () Bool)

(assert (=> start!60240 m!406583))

(declare-fun m!406585 () Bool)

(assert (=> b!273805 m!406585))

(push 1)

(assert (not b!273805))

(assert (not start!60240))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93802 () Bool)

(assert (=> d!93802 (= (array_inv!6412 (buf!7156 thiss!882)) (bvsge (size!6688 (buf!7156 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!273805 d!93802))

(declare-fun d!93806 () Bool)

(declare-fun res!227874 () Bool)

(declare-fun e!193719 () Bool)

(assert (=> d!93806 (=> (not res!227874) (not e!193719))))

(assert (=> d!93806 (= res!227874 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6688 (buf!7156 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6688 (buf!7156 thiss!882)))))))))

(assert (=> d!93806 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!193719)))

(declare-fun b!273824 () Bool)

(declare-fun lt!411853 () (_ BitVec 64))

(assert (=> b!273824 (= e!193719 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411853) (bvsle lt!411853 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6688 (buf!7156 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!273824 (= lt!411853 (bvadd (bitIndex!0 (size!6688 (buf!7156 thiss!882)) (currentByte!13209 thiss!882) (currentBit!13204 thiss!882)) diffInBits!15))))

(assert (= (and d!93806 res!227874) b!273824))

(declare-fun m!406599 () Bool)

(assert (=> b!273824 m!406599))

(assert (=> start!60240 d!93806))

(declare-fun d!93808 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!93808 (= (inv!12 thiss!882) (invariant!0 (currentBit!13204 thiss!882) (currentByte!13209 thiss!882) (size!6688 (buf!7156 thiss!882))))))

(declare-fun bs!23634 () Bool)

(assert (= bs!23634 d!93808))

(declare-fun m!406603 () Bool)

(assert (=> bs!23634 m!406603))

(assert (=> start!60240 d!93808))

(push 1)

(assert (not d!93808))

(assert (not b!273824))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

