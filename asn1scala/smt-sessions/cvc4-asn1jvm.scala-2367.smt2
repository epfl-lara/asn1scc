; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60342 () Bool)

(assert start!60342)

(declare-fun res!227956 () Bool)

(declare-fun e!193898 () Bool)

(assert (=> start!60342 (=> (not res!227956) (not e!193898))))

(declare-datatypes ((array!15451 0))(
  ( (array!15452 (arr!7695 (Array (_ BitVec 32) (_ BitVec 8))) (size!6708 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12230 0))(
  ( (BitStream!12231 (buf!7176 array!15451) (currentByte!13235 (_ BitVec 32)) (currentBit!13230 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12230)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12230 (_ BitVec 64)) Bool)

(assert (=> start!60342 (= res!227956 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60342 e!193898))

(declare-fun e!193900 () Bool)

(declare-fun inv!12 (BitStream!12230) Bool)

(assert (=> start!60342 (and (inv!12 thiss!882) e!193900)))

(assert (=> start!60342 true))

(declare-fun b!273965 () Bool)

(declare-fun lt!411944 () (_ BitVec 32))

(assert (=> b!273965 (= e!193898 (and (= (bvand (currentByte!13235 thiss!882) #b10000000000000000000000000000000) (bvand lt!411944 #b10000000000000000000000000000000)) (not (= (bvand (currentByte!13235 thiss!882) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!13235 thiss!882) lt!411944) #b10000000000000000000000000000000)))))))

(assert (=> b!273965 (= lt!411944 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!273966 () Bool)

(declare-fun array_inv!6432 (array!15451) Bool)

(assert (=> b!273966 (= e!193900 (array_inv!6432 (buf!7176 thiss!882)))))

(assert (= (and start!60342 res!227956) b!273965))

(assert (= start!60342 b!273966))

(declare-fun m!406751 () Bool)

(assert (=> start!60342 m!406751))

(declare-fun m!406753 () Bool)

(assert (=> start!60342 m!406753))

(declare-fun m!406755 () Bool)

(assert (=> b!273966 m!406755))

(push 1)

(assert (not b!273966))

(assert (not start!60342))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93898 () Bool)

(assert (=> d!93898 (= (array_inv!6432 (buf!7176 thiss!882)) (bvsge (size!6708 (buf!7176 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!273966 d!93898))

(declare-fun d!93900 () Bool)

(declare-fun res!227965 () Bool)

(declare-fun e!193909 () Bool)

(assert (=> d!93900 (=> (not res!227965) (not e!193909))))

(assert (=> d!93900 (= res!227965 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6708 (buf!7176 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6708 (buf!7176 thiss!882)))))))))

(assert (=> d!93900 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!193909)))

(declare-fun b!273978 () Bool)

(declare-fun lt!411953 () (_ BitVec 64))

(assert (=> b!273978 (= e!193909 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411953) (bvsle lt!411953 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6708 (buf!7176 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!273978 (= lt!411953 (bvadd (bitIndex!0 (size!6708 (buf!7176 thiss!882)) (currentByte!13235 thiss!882) (currentBit!13230 thiss!882)) diffInBits!15))))

(assert (= (and d!93900 res!227965) b!273978))

(declare-fun m!406765 () Bool)

(assert (=> b!273978 m!406765))

(assert (=> start!60342 d!93900))

(declare-fun d!93902 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!93902 (= (inv!12 thiss!882) (invariant!0 (currentBit!13230 thiss!882) (currentByte!13235 thiss!882) (size!6708 (buf!7176 thiss!882))))))

(declare-fun bs!23665 () Bool)

(assert (= bs!23665 d!93902))

(declare-fun m!406767 () Bool)

(assert (=> bs!23665 m!406767))

(assert (=> start!60342 d!93902))

(push 1)

(assert (not b!273978))

(assert (not d!93902))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93912 () Bool)

(declare-fun e!193918 () Bool)

(assert (=> d!93912 e!193918))

(declare-fun res!227983 () Bool)

(assert (=> d!93912 (=> (not res!227983) (not e!193918))))

(declare-fun lt!412006 () (_ BitVec 64))

(declare-fun lt!412003 () (_ BitVec 64))

(declare-fun lt!412002 () (_ BitVec 64))

(assert (=> d!93912 (= res!227983 (= lt!412002 (bvsub lt!412003 lt!412006)))))

(assert (=> d!93912 (or (= (bvand lt!412003 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!412006 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!412003 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!412003 lt!412006) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!93912 (= lt!412006 (remainingBits!0 ((_ sign_extend 32) (size!6708 (buf!7176 thiss!882))) ((_ sign_extend 32) (currentByte!13235 thiss!882)) ((_ sign_extend 32) (currentBit!13230 thiss!882))))))

(declare-fun lt!412005 () (_ BitVec 64))

(declare-fun lt!412007 () (_ BitVec 64))

(assert (=> d!93912 (= lt!412003 (bvmul lt!412005 lt!412007))))

(assert (=> d!93912 (or (= lt!412005 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!412007 (bvsdiv (bvmul lt!412005 lt!412007) lt!412005)))))

(assert (=> d!93912 (= lt!412007 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93912 (= lt!412005 ((_ sign_extend 32) (size!6708 (buf!7176 thiss!882))))))

(assert (=> d!93912 (= lt!412002 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13235 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13230 thiss!882))))))

(assert (=> d!93912 (invariant!0 (currentBit!13230 thiss!882) (currentByte!13235 thiss!882) (size!6708 (buf!7176 thiss!882)))))

(assert (=> d!93912 (= (bitIndex!0 (size!6708 (buf!7176 thiss!882)) (currentByte!13235 thiss!882) (currentBit!13230 thiss!882)) lt!412002)))

(declare-fun b!273995 () Bool)

(declare-fun res!227982 () Bool)

(assert (=> b!273995 (=> (not res!227982) (not e!193918))))

(assert (=> b!273995 (= res!227982 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412002))))

(declare-fun b!273996 () Bool)

(declare-fun lt!412004 () (_ BitVec 64))

(assert (=> b!273996 (= e!193918 (bvsle lt!412002 (bvmul lt!412004 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!273996 (or (= lt!412004 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!412004 #b0000000000000000000000000000000000000000000000000000000000001000) lt!412004)))))

(assert (=> b!273996 (= lt!412004 ((_ sign_extend 32) (size!6708 (buf!7176 thiss!882))))))

(assert (= (and d!93912 res!227983) b!273995))

(assert (= (and b!273995 res!227982) b!273996))

(declare-fun m!406773 () Bool)

(assert (=> d!93912 m!406773))

(assert (=> d!93912 m!406767))

(assert (=> b!273978 d!93912))

(declare-fun d!93914 () Bool)

(assert (=> d!93914 (= (invariant!0 (currentBit!13230 thiss!882) (currentByte!13235 thiss!882) (size!6708 (buf!7176 thiss!882))) (and (bvsge (currentBit!13230 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13230 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13235 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13235 thiss!882) (size!6708 (buf!7176 thiss!882))) (and (= (currentBit!13230 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13235 thiss!882) (size!6708 (buf!7176 thiss!882)))))))))

(assert (=> d!93902 d!93914))

(push 1)

(assert (not d!93912))

(check-sat)

(pop 1)

(push 1)

(check-sat)

