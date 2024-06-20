; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60172 () Bool)

(assert start!60172)

(declare-fun res!227802 () Bool)

(declare-fun e!193576 () Bool)

(assert (=> start!60172 (=> (not res!227802) (not e!193576))))

(declare-datatypes ((array!15375 0))(
  ( (array!15376 (arr!7664 (Array (_ BitVec 32) (_ BitVec 8))) (size!6677 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12168 0))(
  ( (BitStream!12169 (buf!7145 array!15375) (currentByte!13190 (_ BitVec 32)) (currentBit!13185 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12168)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12168 (_ BitVec 64)) Bool)

(assert (=> start!60172 (= res!227802 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60172 e!193576))

(declare-fun e!193578 () Bool)

(declare-fun inv!12 (BitStream!12168) Bool)

(assert (=> start!60172 (and (inv!12 thiss!882) e!193578)))

(assert (=> start!60172 true))

(declare-fun b!273705 () Bool)

(declare-fun e!193579 () Bool)

(assert (=> b!273705 (= e!193576 e!193579)))

(declare-fun res!227803 () Bool)

(assert (=> b!273705 (=> (not res!227803) (not e!193579))))

(declare-fun lt!411749 () (_ BitVec 32))

(assert (=> b!273705 (= res!227803 (and (bvsge lt!411749 #b00000000000000000000000000000000) (bvslt lt!411749 #b00000000000000000000000000001000)))))

(assert (=> b!273705 (= lt!411749 (bvadd (currentBit!13185 thiss!882) ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!273706 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!273706 (= e!193579 (not (invariant!0 (currentBit!13185 thiss!882) (currentByte!13190 thiss!882) (size!6677 (buf!7145 thiss!882)))))))

(declare-fun b!273707 () Bool)

(declare-fun array_inv!6401 (array!15375) Bool)

(assert (=> b!273707 (= e!193578 (array_inv!6401 (buf!7145 thiss!882)))))

(assert (= (and start!60172 res!227802) b!273705))

(assert (= (and b!273705 res!227803) b!273706))

(assert (= start!60172 b!273707))

(declare-fun m!406483 () Bool)

(assert (=> start!60172 m!406483))

(declare-fun m!406485 () Bool)

(assert (=> start!60172 m!406485))

(declare-fun m!406487 () Bool)

(assert (=> b!273706 m!406487))

(declare-fun m!406489 () Bool)

(assert (=> b!273707 m!406489))

(check-sat (not start!60172) (not b!273706) (not b!273707))
(check-sat)
(get-model)

(declare-fun d!93740 () Bool)

(declare-fun res!227812 () Bool)

(declare-fun e!193594 () Bool)

(assert (=> d!93740 (=> (not res!227812) (not e!193594))))

(assert (=> d!93740 (= res!227812 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6677 (buf!7145 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6677 (buf!7145 thiss!882)))))))))

(assert (=> d!93740 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!193594)))

(declare-fun b!273720 () Bool)

(declare-fun lt!411755 () (_ BitVec 64))

(assert (=> b!273720 (= e!193594 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411755) (bvsle lt!411755 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6677 (buf!7145 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!273720 (= lt!411755 (bvadd (bitIndex!0 (size!6677 (buf!7145 thiss!882)) (currentByte!13190 thiss!882) (currentBit!13185 thiss!882)) diffInBits!15))))

(assert (= (and d!93740 res!227812) b!273720))

(declare-fun m!406499 () Bool)

(assert (=> b!273720 m!406499))

(assert (=> start!60172 d!93740))

(declare-fun d!93744 () Bool)

(assert (=> d!93744 (= (inv!12 thiss!882) (invariant!0 (currentBit!13185 thiss!882) (currentByte!13190 thiss!882) (size!6677 (buf!7145 thiss!882))))))

(declare-fun bs!23617 () Bool)

(assert (= bs!23617 d!93744))

(assert (=> bs!23617 m!406487))

(assert (=> start!60172 d!93744))

(declare-fun d!93748 () Bool)

(assert (=> d!93748 (= (invariant!0 (currentBit!13185 thiss!882) (currentByte!13190 thiss!882) (size!6677 (buf!7145 thiss!882))) (and (bvsge (currentBit!13185 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13185 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13190 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13190 thiss!882) (size!6677 (buf!7145 thiss!882))) (and (= (currentBit!13185 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13190 thiss!882) (size!6677 (buf!7145 thiss!882)))))))))

(assert (=> b!273706 d!93748))

(declare-fun d!93752 () Bool)

(assert (=> d!93752 (= (array_inv!6401 (buf!7145 thiss!882)) (bvsge (size!6677 (buf!7145 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!273707 d!93752))

(check-sat (not b!273720) (not d!93744))
