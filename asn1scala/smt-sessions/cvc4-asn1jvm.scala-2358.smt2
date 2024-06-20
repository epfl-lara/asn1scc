; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60196 () Bool)

(assert start!60196)

(declare-fun res!227832 () Bool)

(declare-fun e!193630 () Bool)

(assert (=> start!60196 (=> (not res!227832) (not e!193630))))

(declare-datatypes ((array!15385 0))(
  ( (array!15386 (arr!7668 (Array (_ BitVec 32) (_ BitVec 8))) (size!6681 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12176 0))(
  ( (BitStream!12177 (buf!7149 array!15385) (currentByte!13196 (_ BitVec 32)) (currentBit!13191 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12176)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12176 (_ BitVec 64)) Bool)

(assert (=> start!60196 (= res!227832 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60196 e!193630))

(declare-fun e!193632 () Bool)

(declare-fun inv!12 (BitStream!12176) Bool)

(assert (=> start!60196 (and (inv!12 thiss!882) e!193632)))

(assert (=> start!60196 true))

(declare-fun b!273749 () Bool)

(declare-fun e!193633 () Bool)

(assert (=> b!273749 (= e!193630 e!193633)))

(declare-fun res!227833 () Bool)

(assert (=> b!273749 (=> (not res!227833) (not e!193633))))

(declare-fun lt!411767 () (_ BitVec 32))

(assert (=> b!273749 (= res!227833 (and (bvsge lt!411767 #b00000000000000000000000000000000) (bvslt lt!411767 #b00000000000000000000000000001000)))))

(assert (=> b!273749 (= lt!411767 (bvadd (currentBit!13191 thiss!882) ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!273750 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!273750 (= e!193633 (not (invariant!0 lt!411767 (bvadd (currentByte!13196 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (size!6681 (buf!7149 thiss!882)))))))

(declare-fun b!273751 () Bool)

(declare-fun array_inv!6405 (array!15385) Bool)

(assert (=> b!273751 (= e!193632 (array_inv!6405 (buf!7149 thiss!882)))))

(assert (= (and start!60196 res!227832) b!273749))

(assert (= (and b!273749 res!227833) b!273750))

(assert (= start!60196 b!273751))

(declare-fun m!406519 () Bool)

(assert (=> start!60196 m!406519))

(declare-fun m!406521 () Bool)

(assert (=> start!60196 m!406521))

(declare-fun m!406523 () Bool)

(assert (=> b!273750 m!406523))

(declare-fun m!406525 () Bool)

(assert (=> b!273751 m!406525))

(push 1)

(assert (not b!273750))

(assert (not b!273751))

(assert (not start!60196))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93774 () Bool)

(assert (=> d!93774 (= (invariant!0 lt!411767 (bvadd (currentByte!13196 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (size!6681 (buf!7149 thiss!882))) (and (bvsge lt!411767 #b00000000000000000000000000000000) (bvslt lt!411767 #b00000000000000000000000000001000) (bvsge (bvadd (currentByte!13196 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000000) (or (bvslt (bvadd (currentByte!13196 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (size!6681 (buf!7149 thiss!882))) (and (= lt!411767 #b00000000000000000000000000000000) (= (bvadd (currentByte!13196 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (size!6681 (buf!7149 thiss!882)))))))))

(assert (=> b!273750 d!93774))

(declare-fun d!93776 () Bool)

(assert (=> d!93776 (= (array_inv!6405 (buf!7149 thiss!882)) (bvsge (size!6681 (buf!7149 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!273751 d!93776))

(declare-fun d!93778 () Bool)

(declare-fun res!227842 () Bool)

(declare-fun e!193642 () Bool)

(assert (=> d!93778 (=> (not res!227842) (not e!193642))))

(assert (=> d!93778 (= res!227842 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6681 (buf!7149 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6681 (buf!7149 thiss!882)))))))))

(assert (=> d!93778 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!193642)))

(declare-fun b!273763 () Bool)

(declare-fun lt!411776 () (_ BitVec 64))

(assert (=> b!273763 (= e!193642 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411776) (bvsle lt!411776 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6681 (buf!7149 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!273763 (= lt!411776 (bvadd (bitIndex!0 (size!6681 (buf!7149 thiss!882)) (currentByte!13196 thiss!882) (currentBit!13191 thiss!882)) diffInBits!15))))

(assert (= (and d!93778 res!227842) b!273763))

(declare-fun m!406535 () Bool)

(assert (=> b!273763 m!406535))

(assert (=> start!60196 d!93778))

(declare-fun d!93784 () Bool)

(assert (=> d!93784 (= (inv!12 thiss!882) (invariant!0 (currentBit!13191 thiss!882) (currentByte!13196 thiss!882) (size!6681 (buf!7149 thiss!882))))))

(declare-fun bs!23624 () Bool)

(assert (= bs!23624 d!93784))

(declare-fun m!406537 () Bool)

(assert (=> bs!23624 m!406537))

(assert (=> start!60196 d!93784))

(push 1)

(assert (not d!93784))

(assert (not b!273763))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93790 () Bool)

(assert (=> d!93790 (= (invariant!0 (currentBit!13191 thiss!882) (currentByte!13196 thiss!882) (size!6681 (buf!7149 thiss!882))) (and (bvsge (currentBit!13191 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13191 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13196 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13196 thiss!882) (size!6681 (buf!7149 thiss!882))) (and (= (currentBit!13191 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13196 thiss!882) (size!6681 (buf!7149 thiss!882)))))))))

(assert (=> d!93784 d!93790))

(declare-fun d!93792 () Bool)

(declare-fun e!193651 () Bool)

(assert (=> d!93792 e!193651))

(declare-fun res!227859 () Bool)

(assert (=> d!93792 (=> (not res!227859) (not e!193651))))

(declare-fun lt!411830 () (_ BitVec 64))

(declare-fun lt!411826 () (_ BitVec 64))

(declare-fun lt!411827 () (_ BitVec 64))

(assert (=> d!93792 (= res!227859 (= lt!411827 (bvsub lt!411826 lt!411830)))))

(assert (=> d!93792 (or (= (bvand lt!411826 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!411830 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!411826 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!411826 lt!411830) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!93792 (= lt!411830 (remainingBits!0 ((_ sign_extend 32) (size!6681 (buf!7149 thiss!882))) ((_ sign_extend 32) (currentByte!13196 thiss!882)) ((_ sign_extend 32) (currentBit!13191 thiss!882))))))

(declare-fun lt!411825 () (_ BitVec 64))

(declare-fun lt!411828 () (_ BitVec 64))

(assert (=> d!93792 (= lt!411826 (bvmul lt!411825 lt!411828))))

(assert (=> d!93792 (or (= lt!411825 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!411828 (bvsdiv (bvmul lt!411825 lt!411828) lt!411825)))))

(assert (=> d!93792 (= lt!411828 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93792 (= lt!411825 ((_ sign_extend 32) (size!6681 (buf!7149 thiss!882))))))

(assert (=> d!93792 (= lt!411827 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13196 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13191 thiss!882))))))

(assert (=> d!93792 (invariant!0 (currentBit!13191 thiss!882) (currentByte!13196 thiss!882) (size!6681 (buf!7149 thiss!882)))))

(assert (=> d!93792 (= (bitIndex!0 (size!6681 (buf!7149 thiss!882)) (currentByte!13196 thiss!882) (currentBit!13191 thiss!882)) lt!411827)))

(declare-fun b!273780 () Bool)

(declare-fun res!227860 () Bool)

(assert (=> b!273780 (=> (not res!227860) (not e!193651))))

(assert (=> b!273780 (= res!227860 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411827))))

(declare-fun b!273781 () Bool)

(declare-fun lt!411829 () (_ BitVec 64))

(assert (=> b!273781 (= e!193651 (bvsle lt!411827 (bvmul lt!411829 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!273781 (or (= lt!411829 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!411829 #b0000000000000000000000000000000000000000000000000000000000001000) lt!411829)))))

(assert (=> b!273781 (= lt!411829 ((_ sign_extend 32) (size!6681 (buf!7149 thiss!882))))))

(assert (= (and d!93792 res!227859) b!273780))

(assert (= (and b!273780 res!227860) b!273781))

(declare-fun m!406543 () Bool)

(assert (=> d!93792 m!406543))

(assert (=> d!93792 m!406537))

(assert (=> b!273763 d!93792))

(push 1)

(assert (not d!93792))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

