; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60306 () Bool)

(assert start!60306)

(declare-fun res!227920 () Bool)

(declare-fun e!193853 () Bool)

(assert (=> start!60306 (=> (not res!227920) (not e!193853))))

(declare-datatypes ((array!15442 0))(
  ( (array!15443 (arr!7692 (Array (_ BitVec 32) (_ BitVec 8))) (size!6705 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12224 0))(
  ( (BitStream!12225 (buf!7173 array!15442) (currentByte!13226 (_ BitVec 32)) (currentBit!13221 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12224)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12224 (_ BitVec 64)) Bool)

(assert (=> start!60306 (= res!227920 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60306 e!193853))

(declare-fun e!193854 () Bool)

(declare-fun inv!12 (BitStream!12224) Bool)

(assert (=> start!60306 (and (inv!12 thiss!882) e!193854)))

(assert (=> start!60306 true))

(declare-fun b!273917 () Bool)

(assert (=> b!273917 (= e!193853 (not (inv!12 (BitStream!12225 (buf!7173 thiss!882) (bvadd (currentByte!13226 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (currentBit!13221 thiss!882)))))))

(declare-fun b!273918 () Bool)

(declare-fun array_inv!6429 (array!15442) Bool)

(assert (=> b!273918 (= e!193854 (array_inv!6429 (buf!7173 thiss!882)))))

(assert (= (and start!60306 res!227920) b!273917))

(assert (= start!60306 b!273918))

(declare-fun m!406707 () Bool)

(assert (=> start!60306 m!406707))

(declare-fun m!406709 () Bool)

(assert (=> start!60306 m!406709))

(declare-fun m!406711 () Bool)

(assert (=> b!273917 m!406711))

(declare-fun m!406713 () Bool)

(assert (=> b!273918 m!406713))

(push 1)

(assert (not start!60306))

(assert (not b!273918))

(assert (not b!273917))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93858 () Bool)

(declare-fun res!227929 () Bool)

(declare-fun e!193864 () Bool)

(assert (=> d!93858 (=> (not res!227929) (not e!193864))))

(assert (=> d!93858 (= res!227929 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6705 (buf!7173 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6705 (buf!7173 thiss!882)))))))))

(assert (=> d!93858 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!193864)))

(declare-fun b!273930 () Bool)

(declare-fun lt!411881 () (_ BitVec 64))

(assert (=> b!273930 (= e!193864 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411881) (bvsle lt!411881 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6705 (buf!7173 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!273930 (= lt!411881 (bvadd (bitIndex!0 (size!6705 (buf!7173 thiss!882)) (currentByte!13226 thiss!882) (currentBit!13221 thiss!882)) diffInBits!15))))

(assert (= (and d!93858 res!227929) b!273930))

(declare-fun m!406727 () Bool)

(assert (=> b!273930 m!406727))

(assert (=> start!60306 d!93858))

(declare-fun d!93860 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!93860 (= (inv!12 thiss!882) (invariant!0 (currentBit!13221 thiss!882) (currentByte!13226 thiss!882) (size!6705 (buf!7173 thiss!882))))))

(declare-fun bs!23658 () Bool)

(assert (= bs!23658 d!93860))

(declare-fun m!406729 () Bool)

(assert (=> bs!23658 m!406729))

(assert (=> start!60306 d!93860))

(declare-fun d!93862 () Bool)

(assert (=> d!93862 (= (array_inv!6429 (buf!7173 thiss!882)) (bvsge (size!6705 (buf!7173 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!273918 d!93862))

(declare-fun d!93864 () Bool)

(assert (=> d!93864 (= (inv!12 (BitStream!12225 (buf!7173 thiss!882) (bvadd (currentByte!13226 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (currentBit!13221 thiss!882))) (invariant!0 (currentBit!13221 (BitStream!12225 (buf!7173 thiss!882) (bvadd (currentByte!13226 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (currentBit!13221 thiss!882))) (currentByte!13226 (BitStream!12225 (buf!7173 thiss!882) (bvadd (currentByte!13226 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (currentBit!13221 thiss!882))) (size!6705 (buf!7173 (BitStream!12225 (buf!7173 thiss!882) (bvadd (currentByte!13226 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (currentBit!13221 thiss!882))))))))

(declare-fun bs!23659 () Bool)

(assert (= bs!23659 d!93864))

(declare-fun m!406731 () Bool)

(assert (=> bs!23659 m!406731))

(assert (=> b!273917 d!93864))

(push 1)

(assert (not d!93860))

(assert (not d!93864))

(assert (not b!273930))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93878 () Bool)

(assert (=> d!93878 (= (invariant!0 (currentBit!13221 thiss!882) (currentByte!13226 thiss!882) (size!6705 (buf!7173 thiss!882))) (and (bvsge (currentBit!13221 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13221 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13226 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13226 thiss!882) (size!6705 (buf!7173 thiss!882))) (and (= (currentBit!13221 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13226 thiss!882) (size!6705 (buf!7173 thiss!882)))))))))

(assert (=> d!93860 d!93878))

(declare-fun d!93880 () Bool)

(assert (=> d!93880 (= (invariant!0 (currentBit!13221 (BitStream!12225 (buf!7173 thiss!882) (bvadd (currentByte!13226 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (currentBit!13221 thiss!882))) (currentByte!13226 (BitStream!12225 (buf!7173 thiss!882) (bvadd (currentByte!13226 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (currentBit!13221 thiss!882))) (size!6705 (buf!7173 (BitStream!12225 (buf!7173 thiss!882) (bvadd (currentByte!13226 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (currentBit!13221 thiss!882))))) (and (bvsge (currentBit!13221 (BitStream!12225 (buf!7173 thiss!882) (bvadd (currentByte!13226 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (currentBit!13221 thiss!882))) #b00000000000000000000000000000000) (bvslt (currentBit!13221 (BitStream!12225 (buf!7173 thiss!882) (bvadd (currentByte!13226 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (currentBit!13221 thiss!882))) #b00000000000000000000000000001000) (bvsge (currentByte!13226 (BitStream!12225 (buf!7173 thiss!882) (bvadd (currentByte!13226 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (currentBit!13221 thiss!882))) #b00000000000000000000000000000000) (or (bvslt (currentByte!13226 (BitStream!12225 (buf!7173 thiss!882) (bvadd (currentByte!13226 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (currentBit!13221 thiss!882))) (size!6705 (buf!7173 (BitStream!12225 (buf!7173 thiss!882) (bvadd (currentByte!13226 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (currentBit!13221 thiss!882))))) (and (= (currentBit!13221 (BitStream!12225 (buf!7173 thiss!882) (bvadd (currentByte!13226 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (currentBit!13221 thiss!882))) #b00000000000000000000000000000000) (= (currentByte!13226 (BitStream!12225 (buf!7173 thiss!882) (bvadd (currentByte!13226 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (currentBit!13221 thiss!882))) (size!6705 (buf!7173 (BitStream!12225 (buf!7173 thiss!882) (bvadd (currentByte!13226 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (currentBit!13221 thiss!882)))))))))))

(assert (=> d!93864 d!93880))

(declare-fun d!93882 () Bool)

(declare-fun e!193873 () Bool)

(assert (=> d!93882 e!193873))

(declare-fun res!227947 () Bool)

(assert (=> d!93882 (=> (not res!227947) (not e!193873))))

(declare-fun lt!411934 () (_ BitVec 64))

(declare-fun lt!411932 () (_ BitVec 64))

(declare-fun lt!411931 () (_ BitVec 64))

(assert (=> d!93882 (= res!227947 (= lt!411931 (bvsub lt!411934 lt!411932)))))

(assert (=> d!93882 (or (= (bvand lt!411934 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!411932 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!411934 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!411934 lt!411932) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!93882 (= lt!411932 (remainingBits!0 ((_ sign_extend 32) (size!6705 (buf!7173 thiss!882))) ((_ sign_extend 32) (currentByte!13226 thiss!882)) ((_ sign_extend 32) (currentBit!13221 thiss!882))))))

(declare-fun lt!411933 () (_ BitVec 64))

(declare-fun lt!411935 () (_ BitVec 64))

(assert (=> d!93882 (= lt!411934 (bvmul lt!411933 lt!411935))))

(assert (=> d!93882 (or (= lt!411933 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!411935 (bvsdiv (bvmul lt!411933 lt!411935) lt!411933)))))

(assert (=> d!93882 (= lt!411935 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93882 (= lt!411933 ((_ sign_extend 32) (size!6705 (buf!7173 thiss!882))))))

(assert (=> d!93882 (= lt!411931 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13226 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13221 thiss!882))))))

(assert (=> d!93882 (invariant!0 (currentBit!13221 thiss!882) (currentByte!13226 thiss!882) (size!6705 (buf!7173 thiss!882)))))

(assert (=> d!93882 (= (bitIndex!0 (size!6705 (buf!7173 thiss!882)) (currentByte!13226 thiss!882) (currentBit!13221 thiss!882)) lt!411931)))

(declare-fun b!273947 () Bool)

(declare-fun res!227946 () Bool)

(assert (=> b!273947 (=> (not res!227946) (not e!193873))))

(assert (=> b!273947 (= res!227946 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411931))))

(declare-fun b!273948 () Bool)

(declare-fun lt!411930 () (_ BitVec 64))

(assert (=> b!273948 (= e!193873 (bvsle lt!411931 (bvmul lt!411930 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!273948 (or (= lt!411930 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!411930 #b0000000000000000000000000000000000000000000000000000000000001000) lt!411930)))))

(assert (=> b!273948 (= lt!411930 ((_ sign_extend 32) (size!6705 (buf!7173 thiss!882))))))

(assert (= (and d!93882 res!227947) b!273947))

(assert (= (and b!273947 res!227946) b!273948))

(declare-fun m!406737 () Bool)

(assert (=> d!93882 m!406737))

(assert (=> d!93882 m!406729))

(assert (=> b!273930 d!93882))

(push 1)

(assert (not d!93882))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

