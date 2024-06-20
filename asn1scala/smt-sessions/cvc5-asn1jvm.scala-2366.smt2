; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60302 () Bool)

(assert start!60302)

(declare-fun res!227914 () Bool)

(declare-fun e!193835 () Bool)

(assert (=> start!60302 (=> (not res!227914) (not e!193835))))

(declare-datatypes ((array!15438 0))(
  ( (array!15439 (arr!7690 (Array (_ BitVec 32) (_ BitVec 8))) (size!6703 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12220 0))(
  ( (BitStream!12221 (buf!7171 array!15438) (currentByte!13224 (_ BitVec 32)) (currentBit!13219 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12220)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12220 (_ BitVec 64)) Bool)

(assert (=> start!60302 (= res!227914 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60302 e!193835))

(declare-fun e!193836 () Bool)

(declare-fun inv!12 (BitStream!12220) Bool)

(assert (=> start!60302 (and (inv!12 thiss!882) e!193836)))

(assert (=> start!60302 true))

(declare-fun b!273905 () Bool)

(assert (=> b!273905 (= e!193835 (not (inv!12 (BitStream!12221 (buf!7171 thiss!882) (bvadd (currentByte!13224 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (currentBit!13219 thiss!882)))))))

(declare-fun b!273906 () Bool)

(declare-fun array_inv!6427 (array!15438) Bool)

(assert (=> b!273906 (= e!193836 (array_inv!6427 (buf!7171 thiss!882)))))

(assert (= (and start!60302 res!227914) b!273905))

(assert (= start!60302 b!273906))

(declare-fun m!406691 () Bool)

(assert (=> start!60302 m!406691))

(declare-fun m!406693 () Bool)

(assert (=> start!60302 m!406693))

(declare-fun m!406695 () Bool)

(assert (=> b!273905 m!406695))

(declare-fun m!406697 () Bool)

(assert (=> b!273906 m!406697))

(push 1)

(assert (not b!273906))

(assert (not b!273905))

(assert (not start!60302))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93846 () Bool)

(assert (=> d!93846 (= (array_inv!6427 (buf!7171 thiss!882)) (bvsge (size!6703 (buf!7171 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!273906 d!93846))

(declare-fun d!93848 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!93848 (= (inv!12 (BitStream!12221 (buf!7171 thiss!882) (bvadd (currentByte!13224 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (currentBit!13219 thiss!882))) (invariant!0 (currentBit!13219 (BitStream!12221 (buf!7171 thiss!882) (bvadd (currentByte!13224 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (currentBit!13219 thiss!882))) (currentByte!13224 (BitStream!12221 (buf!7171 thiss!882) (bvadd (currentByte!13224 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (currentBit!13219 thiss!882))) (size!6703 (buf!7171 (BitStream!12221 (buf!7171 thiss!882) (bvadd (currentByte!13224 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (currentBit!13219 thiss!882))))))))

(declare-fun bs!23656 () Bool)

(assert (= bs!23656 d!93848))

(declare-fun m!406721 () Bool)

(assert (=> bs!23656 m!406721))

(assert (=> b!273905 d!93848))

(declare-fun d!93854 () Bool)

(declare-fun res!227926 () Bool)

(declare-fun e!193861 () Bool)

(assert (=> d!93854 (=> (not res!227926) (not e!193861))))

(assert (=> d!93854 (= res!227926 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6703 (buf!7171 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6703 (buf!7171 thiss!882)))))))))

(assert (=> d!93854 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!193861)))

(declare-fun b!273926 () Bool)

(declare-fun lt!411878 () (_ BitVec 64))

(assert (=> b!273926 (= e!193861 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411878) (bvsle lt!411878 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6703 (buf!7171 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!273926 (= lt!411878 (bvadd (bitIndex!0 (size!6703 (buf!7171 thiss!882)) (currentByte!13224 thiss!882) (currentBit!13219 thiss!882)) diffInBits!15))))

(assert (= (and d!93854 res!227926) b!273926))

(declare-fun m!406723 () Bool)

(assert (=> b!273926 m!406723))

(assert (=> start!60302 d!93854))

(declare-fun d!93856 () Bool)

(assert (=> d!93856 (= (inv!12 thiss!882) (invariant!0 (currentBit!13219 thiss!882) (currentByte!13224 thiss!882) (size!6703 (buf!7171 thiss!882))))))

(declare-fun bs!23657 () Bool)

(assert (= bs!23657 d!93856))

(declare-fun m!406725 () Bool)

(assert (=> bs!23657 m!406725))

(assert (=> start!60302 d!93856))

(push 1)

(assert (not b!273926))

(assert (not d!93856))

(assert (not d!93848))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93870 () Bool)

(declare-fun e!193870 () Bool)

(assert (=> d!93870 e!193870))

(declare-fun res!227941 () Bool)

(assert (=> d!93870 (=> (not res!227941) (not e!193870))))

(declare-fun lt!411913 () (_ BitVec 64))

(declare-fun lt!411912 () (_ BitVec 64))

(declare-fun lt!411916 () (_ BitVec 64))

(assert (=> d!93870 (= res!227941 (= lt!411916 (bvsub lt!411913 lt!411912)))))

(assert (=> d!93870 (or (= (bvand lt!411913 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!411912 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!411913 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!411913 lt!411912) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!93870 (= lt!411912 (remainingBits!0 ((_ sign_extend 32) (size!6703 (buf!7171 thiss!882))) ((_ sign_extend 32) (currentByte!13224 thiss!882)) ((_ sign_extend 32) (currentBit!13219 thiss!882))))))

(declare-fun lt!411917 () (_ BitVec 64))

(declare-fun lt!411914 () (_ BitVec 64))

(assert (=> d!93870 (= lt!411913 (bvmul lt!411917 lt!411914))))

(assert (=> d!93870 (or (= lt!411917 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!411914 (bvsdiv (bvmul lt!411917 lt!411914) lt!411917)))))

(assert (=> d!93870 (= lt!411914 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93870 (= lt!411917 ((_ sign_extend 32) (size!6703 (buf!7171 thiss!882))))))

(assert (=> d!93870 (= lt!411916 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13224 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13219 thiss!882))))))

(assert (=> d!93870 (invariant!0 (currentBit!13219 thiss!882) (currentByte!13224 thiss!882) (size!6703 (buf!7171 thiss!882)))))

(assert (=> d!93870 (= (bitIndex!0 (size!6703 (buf!7171 thiss!882)) (currentByte!13224 thiss!882) (currentBit!13219 thiss!882)) lt!411916)))

(declare-fun b!273941 () Bool)

(declare-fun res!227940 () Bool)

(assert (=> b!273941 (=> (not res!227940) (not e!193870))))

(assert (=> b!273941 (= res!227940 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411916))))

(declare-fun b!273942 () Bool)

(declare-fun lt!411915 () (_ BitVec 64))

(assert (=> b!273942 (= e!193870 (bvsle lt!411916 (bvmul lt!411915 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!273942 (or (= lt!411915 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!411915 #b0000000000000000000000000000000000000000000000000000000000001000) lt!411915)))))

(assert (=> b!273942 (= lt!411915 ((_ sign_extend 32) (size!6703 (buf!7171 thiss!882))))))

(assert (= (and d!93870 res!227941) b!273941))

(assert (= (and b!273941 res!227940) b!273942))

(declare-fun m!406735 () Bool)

(assert (=> d!93870 m!406735))

(assert (=> d!93870 m!406725))

(assert (=> b!273926 d!93870))

(declare-fun d!93874 () Bool)

(assert (=> d!93874 (= (invariant!0 (currentBit!13219 thiss!882) (currentByte!13224 thiss!882) (size!6703 (buf!7171 thiss!882))) (and (bvsge (currentBit!13219 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13219 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13224 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13224 thiss!882) (size!6703 (buf!7171 thiss!882))) (and (= (currentBit!13219 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13224 thiss!882) (size!6703 (buf!7171 thiss!882)))))))))

(assert (=> d!93856 d!93874))

(declare-fun d!93876 () Bool)

(assert (=> d!93876 (= (invariant!0 (currentBit!13219 (BitStream!12221 (buf!7171 thiss!882) (bvadd (currentByte!13224 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (currentBit!13219 thiss!882))) (currentByte!13224 (BitStream!12221 (buf!7171 thiss!882) (bvadd (currentByte!13224 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (currentBit!13219 thiss!882))) (size!6703 (buf!7171 (BitStream!12221 (buf!7171 thiss!882) (bvadd (currentByte!13224 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (currentBit!13219 thiss!882))))) (and (bvsge (currentBit!13219 (BitStream!12221 (buf!7171 thiss!882) (bvadd (currentByte!13224 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (currentBit!13219 thiss!882))) #b00000000000000000000000000000000) (bvslt (currentBit!13219 (BitStream!12221 (buf!7171 thiss!882) (bvadd (currentByte!13224 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (currentBit!13219 thiss!882))) #b00000000000000000000000000001000) (bvsge (currentByte!13224 (BitStream!12221 (buf!7171 thiss!882) (bvadd (currentByte!13224 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (currentBit!13219 thiss!882))) #b00000000000000000000000000000000) (or (bvslt (currentByte!13224 (BitStream!12221 (buf!7171 thiss!882) (bvadd (currentByte!13224 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (currentBit!13219 thiss!882))) (size!6703 (buf!7171 (BitStream!12221 (buf!7171 thiss!882) (bvadd (currentByte!13224 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (currentBit!13219 thiss!882))))) (and (= (currentBit!13219 (BitStream!12221 (buf!7171 thiss!882) (bvadd (currentByte!13224 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (currentBit!13219 thiss!882))) #b00000000000000000000000000000000) (= (currentByte!13224 (BitStream!12221 (buf!7171 thiss!882) (bvadd (currentByte!13224 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (currentBit!13219 thiss!882))) (size!6703 (buf!7171 (BitStream!12221 (buf!7171 thiss!882) (bvadd (currentByte!13224 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (currentBit!13219 thiss!882)))))))))))

(assert (=> d!93848 d!93876))

(push 1)

(assert (not d!93870))

(check-sat)

(pop 1)

(push 1)

(check-sat)

