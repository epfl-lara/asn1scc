; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60264 () Bool)

(assert start!60264)

(declare-fun res!227881 () Bool)

(declare-fun e!193730 () Bool)

(assert (=> start!60264 (=> (not res!227881) (not e!193730))))

(declare-datatypes ((array!15411 0))(
  ( (array!15412 (arr!7678 (Array (_ BitVec 32) (_ BitVec 8))) (size!6691 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12196 0))(
  ( (BitStream!12197 (buf!7159 array!15411) (currentByte!13212 (_ BitVec 32)) (currentBit!13207 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12196)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12196 (_ BitVec 64)) Bool)

(assert (=> start!60264 (= res!227881 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60264 e!193730))

(declare-fun e!193731 () Bool)

(declare-fun inv!12 (BitStream!12196) Bool)

(assert (=> start!60264 (and (inv!12 thiss!882) e!193731)))

(assert (=> start!60264 true))

(declare-fun b!273834 () Bool)

(assert (=> b!273834 (= e!193730 (and (bvslt (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000)))))

(declare-fun b!273835 () Bool)

(declare-fun array_inv!6415 (array!15411) Bool)

(assert (=> b!273835 (= e!193731 (array_inv!6415 (buf!7159 thiss!882)))))

(assert (= (and start!60264 res!227881) b!273834))

(assert (= start!60264 b!273835))

(declare-fun m!406611 () Bool)

(assert (=> start!60264 m!406611))

(declare-fun m!406613 () Bool)

(assert (=> start!60264 m!406613))

(declare-fun m!406615 () Bool)

(assert (=> b!273835 m!406615))

(push 1)

(assert (not start!60264))

(assert (not b!273835))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93826 () Bool)

(declare-fun res!227893 () Bool)

(declare-fun e!193756 () Bool)

(assert (=> d!93826 (=> (not res!227893) (not e!193756))))

(assert (=> d!93826 (= res!227893 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6691 (buf!7159 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6691 (buf!7159 thiss!882)))))))))

(assert (=> d!93826 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!193756)))

(declare-fun b!273855 () Bool)

(declare-fun lt!411863 () (_ BitVec 64))

(assert (=> b!273855 (= e!193756 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411863) (bvsle lt!411863 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6691 (buf!7159 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!273855 (= lt!411863 (bvadd (bitIndex!0 (size!6691 (buf!7159 thiss!882)) (currentByte!13212 thiss!882) (currentBit!13207 thiss!882)) diffInBits!15))))

(assert (= (and d!93826 res!227893) b!273855))

(declare-fun m!406633 () Bool)

(assert (=> b!273855 m!406633))

(assert (=> start!60264 d!93826))

(declare-fun d!93828 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!93828 (= (inv!12 thiss!882) (invariant!0 (currentBit!13207 thiss!882) (currentByte!13212 thiss!882) (size!6691 (buf!7159 thiss!882))))))

(declare-fun bs!23641 () Bool)

(assert (= bs!23641 d!93828))

(declare-fun m!406635 () Bool)

(assert (=> bs!23641 m!406635))

(assert (=> start!60264 d!93828))

(declare-fun d!93830 () Bool)

(assert (=> d!93830 (= (array_inv!6415 (buf!7159 thiss!882)) (bvsge (size!6691 (buf!7159 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!273835 d!93830))

(push 1)

(assert (not b!273855))

(assert (not d!93828))

(check-sat)

(pop 1)

(push 1)

(check-sat)

