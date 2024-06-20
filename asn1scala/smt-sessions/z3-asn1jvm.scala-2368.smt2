; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60376 () Bool)

(assert start!60376)

(declare-fun res!227989 () Bool)

(declare-fun e!193936 () Bool)

(assert (=> start!60376 (=> (not res!227989) (not e!193936))))

(declare-datatypes ((array!15458 0))(
  ( (array!15459 (arr!7697 (Array (_ BitVec 32) (_ BitVec 8))) (size!6710 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12234 0))(
  ( (BitStream!12235 (buf!7178 array!15458) (currentByte!13243 (_ BitVec 32)) (currentBit!13238 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12234)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12234 (_ BitVec 64)) Bool)

(assert (=> start!60376 (= res!227989 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60376 e!193936))

(declare-fun e!193934 () Bool)

(declare-fun inv!12 (BitStream!12234) Bool)

(assert (=> start!60376 (and (inv!12 thiss!882) e!193934)))

(assert (=> start!60376 true))

(declare-fun b!274007 () Bool)

(declare-fun lt!412013 () (_ BitVec 32))

(assert (=> b!274007 (= e!193936 (and (= (bvand (currentBit!13238 thiss!882) #b10000000000000000000000000000000) (bvand lt!412013 #b10000000000000000000000000000000)) (not (= (bvand (currentBit!13238 thiss!882) #b10000000000000000000000000000000) (bvand (bvadd (currentBit!13238 thiss!882) lt!412013) #b10000000000000000000000000000000)))))))

(assert (=> b!274007 (= lt!412013 ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!274008 () Bool)

(declare-fun array_inv!6434 (array!15458) Bool)

(assert (=> b!274008 (= e!193934 (array_inv!6434 (buf!7178 thiss!882)))))

(assert (= (and start!60376 res!227989) b!274007))

(assert (= start!60376 b!274008))

(declare-fun m!406781 () Bool)

(assert (=> start!60376 m!406781))

(declare-fun m!406783 () Bool)

(assert (=> start!60376 m!406783))

(declare-fun m!406785 () Bool)

(assert (=> b!274008 m!406785))

(check-sat (not start!60376) (not b!274008))
(check-sat)
(get-model)

(declare-fun d!93918 () Bool)

(declare-fun res!227995 () Bool)

(declare-fun e!193948 () Bool)

(assert (=> d!93918 (=> (not res!227995) (not e!193948))))

(assert (=> d!93918 (= res!227995 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6710 (buf!7178 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6710 (buf!7178 thiss!882)))))))))

(assert (=> d!93918 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!193948)))

(declare-fun b!274018 () Bool)

(declare-fun lt!412019 () (_ BitVec 64))

(assert (=> b!274018 (= e!193948 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412019) (bvsle lt!412019 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6710 (buf!7178 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!274018 (= lt!412019 (bvadd (bitIndex!0 (size!6710 (buf!7178 thiss!882)) (currentByte!13243 thiss!882) (currentBit!13238 thiss!882)) diffInBits!15))))

(assert (= (and d!93918 res!227995) b!274018))

(declare-fun m!406793 () Bool)

(assert (=> b!274018 m!406793))

(assert (=> start!60376 d!93918))

(declare-fun d!93922 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!93922 (= (inv!12 thiss!882) (invariant!0 (currentBit!13238 thiss!882) (currentByte!13243 thiss!882) (size!6710 (buf!7178 thiss!882))))))

(declare-fun bs!23669 () Bool)

(assert (= bs!23669 d!93922))

(declare-fun m!406795 () Bool)

(assert (=> bs!23669 m!406795))

(assert (=> start!60376 d!93922))

(declare-fun d!93924 () Bool)

(assert (=> d!93924 (= (array_inv!6434 (buf!7178 thiss!882)) (bvsge (size!6710 (buf!7178 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!274008 d!93924))

(check-sat (not b!274018) (not d!93922))
(check-sat)
(get-model)

(declare-fun d!93936 () Bool)

(declare-fun e!193957 () Bool)

(assert (=> d!93936 e!193957))

(declare-fun res!228007 () Bool)

(assert (=> d!93936 (=> (not res!228007) (not e!193957))))

(declare-fun lt!412042 () (_ BitVec 64))

(declare-fun lt!412040 () (_ BitVec 64))

(declare-fun lt!412039 () (_ BitVec 64))

(assert (=> d!93936 (= res!228007 (= lt!412039 (bvsub lt!412040 lt!412042)))))

(assert (=> d!93936 (or (= (bvand lt!412040 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!412042 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!412040 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!412040 lt!412042) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!93936 (= lt!412042 (remainingBits!0 ((_ sign_extend 32) (size!6710 (buf!7178 thiss!882))) ((_ sign_extend 32) (currentByte!13243 thiss!882)) ((_ sign_extend 32) (currentBit!13238 thiss!882))))))

(declare-fun lt!412043 () (_ BitVec 64))

(declare-fun lt!412038 () (_ BitVec 64))

(assert (=> d!93936 (= lt!412040 (bvmul lt!412043 lt!412038))))

(assert (=> d!93936 (or (= lt!412043 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!412038 (bvsdiv (bvmul lt!412043 lt!412038) lt!412043)))))

(assert (=> d!93936 (= lt!412038 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93936 (= lt!412043 ((_ sign_extend 32) (size!6710 (buf!7178 thiss!882))))))

(assert (=> d!93936 (= lt!412039 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13243 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13238 thiss!882))))))

(assert (=> d!93936 (invariant!0 (currentBit!13238 thiss!882) (currentByte!13243 thiss!882) (size!6710 (buf!7178 thiss!882)))))

(assert (=> d!93936 (= (bitIndex!0 (size!6710 (buf!7178 thiss!882)) (currentByte!13243 thiss!882) (currentBit!13238 thiss!882)) lt!412039)))

(declare-fun b!274031 () Bool)

(declare-fun res!228006 () Bool)

(assert (=> b!274031 (=> (not res!228006) (not e!193957))))

(assert (=> b!274031 (= res!228006 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412039))))

(declare-fun b!274032 () Bool)

(declare-fun lt!412041 () (_ BitVec 64))

(assert (=> b!274032 (= e!193957 (bvsle lt!412039 (bvmul lt!412041 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274032 (or (= lt!412041 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!412041 #b0000000000000000000000000000000000000000000000000000000000001000) lt!412041)))))

(assert (=> b!274032 (= lt!412041 ((_ sign_extend 32) (size!6710 (buf!7178 thiss!882))))))

(assert (= (and d!93936 res!228007) b!274031))

(assert (= (and b!274031 res!228006) b!274032))

(declare-fun m!406805 () Bool)

(assert (=> d!93936 m!406805))

(assert (=> d!93936 m!406795))

(assert (=> b!274018 d!93936))

(declare-fun d!93940 () Bool)

(assert (=> d!93940 (= (invariant!0 (currentBit!13238 thiss!882) (currentByte!13243 thiss!882) (size!6710 (buf!7178 thiss!882))) (and (bvsge (currentBit!13238 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13238 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13243 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13243 thiss!882) (size!6710 (buf!7178 thiss!882))) (and (= (currentBit!13238 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13243 thiss!882) (size!6710 (buf!7178 thiss!882)))))))))

(assert (=> d!93922 d!93940))

(check-sat (not d!93936))
