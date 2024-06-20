; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60304 () Bool)

(assert start!60304)

(declare-fun res!227917 () Bool)

(declare-fun e!193844 () Bool)

(assert (=> start!60304 (=> (not res!227917) (not e!193844))))

(declare-datatypes ((array!15440 0))(
  ( (array!15441 (arr!7691 (Array (_ BitVec 32) (_ BitVec 8))) (size!6704 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12222 0))(
  ( (BitStream!12223 (buf!7172 array!15440) (currentByte!13225 (_ BitVec 32)) (currentBit!13220 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12222)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12222 (_ BitVec 64)) Bool)

(assert (=> start!60304 (= res!227917 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60304 e!193844))

(declare-fun e!193845 () Bool)

(declare-fun inv!12 (BitStream!12222) Bool)

(assert (=> start!60304 (and (inv!12 thiss!882) e!193845)))

(assert (=> start!60304 true))

(declare-fun b!273911 () Bool)

(assert (=> b!273911 (= e!193844 (not (inv!12 (BitStream!12223 (buf!7172 thiss!882) (bvadd (currentByte!13225 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (currentBit!13220 thiss!882)))))))

(declare-fun b!273912 () Bool)

(declare-fun array_inv!6428 (array!15440) Bool)

(assert (=> b!273912 (= e!193845 (array_inv!6428 (buf!7172 thiss!882)))))

(assert (= (and start!60304 res!227917) b!273911))

(assert (= start!60304 b!273912))

(declare-fun m!406699 () Bool)

(assert (=> start!60304 m!406699))

(declare-fun m!406701 () Bool)

(assert (=> start!60304 m!406701))

(declare-fun m!406703 () Bool)

(assert (=> b!273911 m!406703))

(declare-fun m!406705 () Bool)

(assert (=> b!273912 m!406705))

(check-sat (not b!273911) (not start!60304) (not b!273912))
(check-sat)
(get-model)

(declare-fun d!93842 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!93842 (= (inv!12 (BitStream!12223 (buf!7172 thiss!882) (bvadd (currentByte!13225 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (currentBit!13220 thiss!882))) (invariant!0 (currentBit!13220 (BitStream!12223 (buf!7172 thiss!882) (bvadd (currentByte!13225 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (currentBit!13220 thiss!882))) (currentByte!13225 (BitStream!12223 (buf!7172 thiss!882) (bvadd (currentByte!13225 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (currentBit!13220 thiss!882))) (size!6704 (buf!7172 (BitStream!12223 (buf!7172 thiss!882) (bvadd (currentByte!13225 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (currentBit!13220 thiss!882))))))))

(declare-fun bs!23654 () Bool)

(assert (= bs!23654 d!93842))

(declare-fun m!406715 () Bool)

(assert (=> bs!23654 m!406715))

(assert (=> b!273911 d!93842))

(declare-fun d!93844 () Bool)

(declare-fun res!227923 () Bool)

(declare-fun e!193858 () Bool)

(assert (=> d!93844 (=> (not res!227923) (not e!193858))))

(assert (=> d!93844 (= res!227923 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6704 (buf!7172 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6704 (buf!7172 thiss!882)))))))))

(assert (=> d!93844 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!193858)))

(declare-fun b!273922 () Bool)

(declare-fun lt!411875 () (_ BitVec 64))

(assert (=> b!273922 (= e!193858 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411875) (bvsle lt!411875 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6704 (buf!7172 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!273922 (= lt!411875 (bvadd (bitIndex!0 (size!6704 (buf!7172 thiss!882)) (currentByte!13225 thiss!882) (currentBit!13220 thiss!882)) diffInBits!15))))

(assert (= (and d!93844 res!227923) b!273922))

(declare-fun m!406717 () Bool)

(assert (=> b!273922 m!406717))

(assert (=> start!60304 d!93844))

(declare-fun d!93850 () Bool)

(assert (=> d!93850 (= (inv!12 thiss!882) (invariant!0 (currentBit!13220 thiss!882) (currentByte!13225 thiss!882) (size!6704 (buf!7172 thiss!882))))))

(declare-fun bs!23655 () Bool)

(assert (= bs!23655 d!93850))

(declare-fun m!406719 () Bool)

(assert (=> bs!23655 m!406719))

(assert (=> start!60304 d!93850))

(declare-fun d!93852 () Bool)

(assert (=> d!93852 (= (array_inv!6428 (buf!7172 thiss!882)) (bvsge (size!6704 (buf!7172 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!273912 d!93852))

(check-sat (not d!93842) (not b!273922) (not d!93850))
(check-sat)
(get-model)

(declare-fun d!93866 () Bool)

(assert (=> d!93866 (= (invariant!0 (currentBit!13220 (BitStream!12223 (buf!7172 thiss!882) (bvadd (currentByte!13225 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (currentBit!13220 thiss!882))) (currentByte!13225 (BitStream!12223 (buf!7172 thiss!882) (bvadd (currentByte!13225 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (currentBit!13220 thiss!882))) (size!6704 (buf!7172 (BitStream!12223 (buf!7172 thiss!882) (bvadd (currentByte!13225 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (currentBit!13220 thiss!882))))) (and (bvsge (currentBit!13220 (BitStream!12223 (buf!7172 thiss!882) (bvadd (currentByte!13225 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (currentBit!13220 thiss!882))) #b00000000000000000000000000000000) (bvslt (currentBit!13220 (BitStream!12223 (buf!7172 thiss!882) (bvadd (currentByte!13225 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (currentBit!13220 thiss!882))) #b00000000000000000000000000001000) (bvsge (currentByte!13225 (BitStream!12223 (buf!7172 thiss!882) (bvadd (currentByte!13225 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (currentBit!13220 thiss!882))) #b00000000000000000000000000000000) (or (bvslt (currentByte!13225 (BitStream!12223 (buf!7172 thiss!882) (bvadd (currentByte!13225 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (currentBit!13220 thiss!882))) (size!6704 (buf!7172 (BitStream!12223 (buf!7172 thiss!882) (bvadd (currentByte!13225 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (currentBit!13220 thiss!882))))) (and (= (currentBit!13220 (BitStream!12223 (buf!7172 thiss!882) (bvadd (currentByte!13225 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (currentBit!13220 thiss!882))) #b00000000000000000000000000000000) (= (currentByte!13225 (BitStream!12223 (buf!7172 thiss!882) (bvadd (currentByte!13225 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (currentBit!13220 thiss!882))) (size!6704 (buf!7172 (BitStream!12223 (buf!7172 thiss!882) (bvadd (currentByte!13225 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (currentBit!13220 thiss!882)))))))))))

(assert (=> d!93842 d!93866))

(declare-fun d!93868 () Bool)

(declare-fun e!193869 () Bool)

(assert (=> d!93868 e!193869))

(declare-fun res!227938 () Bool)

(assert (=> d!93868 (=> (not res!227938) (not e!193869))))

(declare-fun lt!411911 () (_ BitVec 64))

(declare-fun lt!411907 () (_ BitVec 64))

(declare-fun lt!411906 () (_ BitVec 64))

(assert (=> d!93868 (= res!227938 (= lt!411906 (bvsub lt!411907 lt!411911)))))

(assert (=> d!93868 (or (= (bvand lt!411907 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!411911 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!411907 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!411907 lt!411911) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!93868 (= lt!411911 (remainingBits!0 ((_ sign_extend 32) (size!6704 (buf!7172 thiss!882))) ((_ sign_extend 32) (currentByte!13225 thiss!882)) ((_ sign_extend 32) (currentBit!13220 thiss!882))))))

(declare-fun lt!411909 () (_ BitVec 64))

(declare-fun lt!411910 () (_ BitVec 64))

(assert (=> d!93868 (= lt!411907 (bvmul lt!411909 lt!411910))))

(assert (=> d!93868 (or (= lt!411909 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!411910 (bvsdiv (bvmul lt!411909 lt!411910) lt!411909)))))

(assert (=> d!93868 (= lt!411910 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93868 (= lt!411909 ((_ sign_extend 32) (size!6704 (buf!7172 thiss!882))))))

(assert (=> d!93868 (= lt!411906 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13225 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13220 thiss!882))))))

(assert (=> d!93868 (invariant!0 (currentBit!13220 thiss!882) (currentByte!13225 thiss!882) (size!6704 (buf!7172 thiss!882)))))

(assert (=> d!93868 (= (bitIndex!0 (size!6704 (buf!7172 thiss!882)) (currentByte!13225 thiss!882) (currentBit!13220 thiss!882)) lt!411906)))

(declare-fun b!273939 () Bool)

(declare-fun res!227939 () Bool)

(assert (=> b!273939 (=> (not res!227939) (not e!193869))))

(assert (=> b!273939 (= res!227939 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411906))))

(declare-fun b!273940 () Bool)

(declare-fun lt!411908 () (_ BitVec 64))

(assert (=> b!273940 (= e!193869 (bvsle lt!411906 (bvmul lt!411908 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!273940 (or (= lt!411908 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!411908 #b0000000000000000000000000000000000000000000000000000000000001000) lt!411908)))))

(assert (=> b!273940 (= lt!411908 ((_ sign_extend 32) (size!6704 (buf!7172 thiss!882))))))

(assert (= (and d!93868 res!227938) b!273939))

(assert (= (and b!273939 res!227939) b!273940))

(declare-fun m!406733 () Bool)

(assert (=> d!93868 m!406733))

(assert (=> d!93868 m!406719))

(assert (=> b!273922 d!93868))

(declare-fun d!93872 () Bool)

(assert (=> d!93872 (= (invariant!0 (currentBit!13220 thiss!882) (currentByte!13225 thiss!882) (size!6704 (buf!7172 thiss!882))) (and (bvsge (currentBit!13220 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13220 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13225 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13225 thiss!882) (size!6704 (buf!7172 thiss!882))) (and (= (currentBit!13220 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13225 thiss!882) (size!6704 (buf!7172 thiss!882)))))))))

(assert (=> d!93850 d!93872))

(check-sat (not d!93868))
(check-sat)
