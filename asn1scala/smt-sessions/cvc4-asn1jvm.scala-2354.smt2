; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60072 () Bool)

(assert start!60072)

(declare-fun res!227691 () Bool)

(declare-fun e!193435 () Bool)

(assert (=> start!60072 (=> (not res!227691) (not e!193435))))

(declare-datatypes ((array!15350 0))(
  ( (array!15351 (arr!7656 (Array (_ BitVec 32) (_ BitVec 8))) (size!6669 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12152 0))(
  ( (BitStream!12153 (buf!7137 array!15350) (currentByte!13167 (_ BitVec 32)) (currentBit!13162 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12152)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12152 (_ BitVec 64)) Bool)

(assert (=> start!60072 (= res!227691 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60072 e!193435))

(declare-fun e!193437 () Bool)

(declare-fun inv!12 (BitStream!12152) Bool)

(assert (=> start!60072 (and (inv!12 thiss!882) e!193437)))

(assert (=> start!60072 true))

(declare-fun b!273561 () Bool)

(declare-fun e!193436 () Bool)

(assert (=> b!273561 (= e!193435 e!193436)))

(declare-fun res!227692 () Bool)

(assert (=> b!273561 (=> (not res!227692) (not e!193436))))

(declare-fun lt!411590 () (_ BitVec 32))

(assert (=> b!273561 (= res!227692 (bvslt (bvadd (currentBit!13162 thiss!882) lt!411590) #b00000000000000000000000000000000))))

(assert (=> b!273561 (= lt!411590 ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!273562 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!273562 (= e!193436 (not (invariant!0 (bvadd #b00000000000000000000000000001000 lt!411590 (currentBit!13162 thiss!882)) (bvsub (bvadd (currentByte!13167 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (size!6669 (buf!7137 thiss!882)))))))

(declare-fun b!273563 () Bool)

(declare-fun array_inv!6393 (array!15350) Bool)

(assert (=> b!273563 (= e!193437 (array_inv!6393 (buf!7137 thiss!882)))))

(assert (= (and start!60072 res!227691) b!273561))

(assert (= (and b!273561 res!227692) b!273562))

(assert (= start!60072 b!273563))

(declare-fun m!406377 () Bool)

(assert (=> start!60072 m!406377))

(declare-fun m!406379 () Bool)

(assert (=> start!60072 m!406379))

(declare-fun m!406381 () Bool)

(assert (=> b!273562 m!406381))

(declare-fun m!406383 () Bool)

(assert (=> b!273563 m!406383))

(push 1)

(assert (not start!60072))

(assert (not b!273562))

(assert (not b!273563))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93654 () Bool)

(declare-fun res!227701 () Bool)

(declare-fun e!193447 () Bool)

(assert (=> d!93654 (=> (not res!227701) (not e!193447))))

(assert (=> d!93654 (= res!227701 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6669 (buf!7137 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6669 (buf!7137 thiss!882)))))))))

(assert (=> d!93654 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!193447)))

(declare-fun b!273575 () Bool)

(declare-fun lt!411599 () (_ BitVec 64))

(assert (=> b!273575 (= e!193447 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411599) (bvsle lt!411599 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6669 (buf!7137 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!273575 (= lt!411599 (bvadd (bitIndex!0 (size!6669 (buf!7137 thiss!882)) (currentByte!13167 thiss!882) (currentBit!13162 thiss!882)) diffInBits!15))))

(assert (= (and d!93654 res!227701) b!273575))

(declare-fun m!406393 () Bool)

(assert (=> b!273575 m!406393))

(assert (=> start!60072 d!93654))

(declare-fun d!93656 () Bool)

(assert (=> d!93656 (= (inv!12 thiss!882) (invariant!0 (currentBit!13162 thiss!882) (currentByte!13167 thiss!882) (size!6669 (buf!7137 thiss!882))))))

(declare-fun bs!23602 () Bool)

(assert (= bs!23602 d!93656))

(declare-fun m!406395 () Bool)

(assert (=> bs!23602 m!406395))

(assert (=> start!60072 d!93656))

(declare-fun d!93658 () Bool)

(assert (=> d!93658 (= (invariant!0 (bvadd #b00000000000000000000000000001000 lt!411590 (currentBit!13162 thiss!882)) (bvsub (bvadd (currentByte!13167 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (size!6669 (buf!7137 thiss!882))) (and (bvsge (bvadd #b00000000000000000000000000001000 lt!411590 (currentBit!13162 thiss!882)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000001000 lt!411590 (currentBit!13162 thiss!882)) #b00000000000000000000000000001000) (bvsge (bvsub (bvadd (currentByte!13167 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (or (bvslt (bvsub (bvadd (currentByte!13167 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (size!6669 (buf!7137 thiss!882))) (and (= (bvadd #b00000000000000000000000000001000 lt!411590 (currentBit!13162 thiss!882)) #b00000000000000000000000000000000) (= (bvsub (bvadd (currentByte!13167 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (size!6669 (buf!7137 thiss!882)))))))))

(assert (=> b!273562 d!93658))

(declare-fun d!93660 () Bool)

(assert (=> d!93660 (= (array_inv!6393 (buf!7137 thiss!882)) (bvsge (size!6669 (buf!7137 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!273563 d!93660))

(push 1)

(assert (not d!93656))

(assert (not b!273575))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93670 () Bool)

(assert (=> d!93670 (= (invariant!0 (currentBit!13162 thiss!882) (currentByte!13167 thiss!882) (size!6669 (buf!7137 thiss!882))) (and (bvsge (currentBit!13162 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13162 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13167 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13167 thiss!882) (size!6669 (buf!7137 thiss!882))) (and (= (currentBit!13162 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13167 thiss!882) (size!6669 (buf!7137 thiss!882)))))))))

(assert (=> d!93656 d!93670))

(declare-fun d!93672 () Bool)

(declare-fun e!193456 () Bool)

(assert (=> d!93672 e!193456))

(declare-fun res!227719 () Bool)

(assert (=> d!93672 (=> (not res!227719) (not e!193456))))

(declare-fun lt!411651 () (_ BitVec 64))

(declare-fun lt!411650 () (_ BitVec 64))

(declare-fun lt!411653 () (_ BitVec 64))

(assert (=> d!93672 (= res!227719 (= lt!411651 (bvsub lt!411650 lt!411653)))))

(assert (=> d!93672 (or (= (bvand lt!411650 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!411653 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!411650 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!411650 lt!411653) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!93672 (= lt!411653 (remainingBits!0 ((_ sign_extend 32) (size!6669 (buf!7137 thiss!882))) ((_ sign_extend 32) (currentByte!13167 thiss!882)) ((_ sign_extend 32) (currentBit!13162 thiss!882))))))

(declare-fun lt!411652 () (_ BitVec 64))

(declare-fun lt!411649 () (_ BitVec 64))

(assert (=> d!93672 (= lt!411650 (bvmul lt!411652 lt!411649))))

(assert (=> d!93672 (or (= lt!411652 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!411649 (bvsdiv (bvmul lt!411652 lt!411649) lt!411652)))))

(assert (=> d!93672 (= lt!411649 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93672 (= lt!411652 ((_ sign_extend 32) (size!6669 (buf!7137 thiss!882))))))

(assert (=> d!93672 (= lt!411651 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13167 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13162 thiss!882))))))

(assert (=> d!93672 (invariant!0 (currentBit!13162 thiss!882) (currentByte!13167 thiss!882) (size!6669 (buf!7137 thiss!882)))))

(assert (=> d!93672 (= (bitIndex!0 (size!6669 (buf!7137 thiss!882)) (currentByte!13167 thiss!882) (currentBit!13162 thiss!882)) lt!411651)))

(declare-fun b!273592 () Bool)

(declare-fun res!227718 () Bool)

(assert (=> b!273592 (=> (not res!227718) (not e!193456))))

(assert (=> b!273592 (= res!227718 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411651))))

(declare-fun b!273593 () Bool)

(declare-fun lt!411648 () (_ BitVec 64))

(assert (=> b!273593 (= e!193456 (bvsle lt!411651 (bvmul lt!411648 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!273593 (or (= lt!411648 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!411648 #b0000000000000000000000000000000000000000000000000000000000001000) lt!411648)))))

(assert (=> b!273593 (= lt!411648 ((_ sign_extend 32) (size!6669 (buf!7137 thiss!882))))))

(assert (= (and d!93672 res!227719) b!273592))

(assert (= (and b!273592 res!227718) b!273593))

(declare-fun m!406401 () Bool)

(assert (=> d!93672 m!406401))

(assert (=> d!93672 m!406395))

(assert (=> b!273575 d!93672))

(push 1)

(assert (not d!93672))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

