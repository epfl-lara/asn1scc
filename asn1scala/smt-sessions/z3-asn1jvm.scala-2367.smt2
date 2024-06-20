; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60340 () Bool)

(assert start!60340)

(declare-fun res!227953 () Bool)

(declare-fun e!193889 () Bool)

(assert (=> start!60340 (=> (not res!227953) (not e!193889))))

(declare-datatypes ((array!15449 0))(
  ( (array!15450 (arr!7694 (Array (_ BitVec 32) (_ BitVec 8))) (size!6707 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12228 0))(
  ( (BitStream!12229 (buf!7175 array!15449) (currentByte!13234 (_ BitVec 32)) (currentBit!13229 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12228)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12228 (_ BitVec 64)) Bool)

(assert (=> start!60340 (= res!227953 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60340 e!193889))

(declare-fun e!193891 () Bool)

(declare-fun inv!12 (BitStream!12228) Bool)

(assert (=> start!60340 (and (inv!12 thiss!882) e!193891)))

(assert (=> start!60340 true))

(declare-fun b!273959 () Bool)

(declare-fun lt!411941 () (_ BitVec 32))

(assert (=> b!273959 (= e!193889 (and (= (bvand (currentByte!13234 thiss!882) #b10000000000000000000000000000000) (bvand lt!411941 #b10000000000000000000000000000000)) (not (= (bvand (currentByte!13234 thiss!882) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!13234 thiss!882) lt!411941) #b10000000000000000000000000000000)))))))

(assert (=> b!273959 (= lt!411941 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!273960 () Bool)

(declare-fun array_inv!6431 (array!15449) Bool)

(assert (=> b!273960 (= e!193891 (array_inv!6431 (buf!7175 thiss!882)))))

(assert (= (and start!60340 res!227953) b!273959))

(assert (= start!60340 b!273960))

(declare-fun m!406745 () Bool)

(assert (=> start!60340 m!406745))

(declare-fun m!406747 () Bool)

(assert (=> start!60340 m!406747))

(declare-fun m!406749 () Bool)

(assert (=> b!273960 m!406749))

(check-sat (not start!60340) (not b!273960))
(check-sat)
(get-model)

(declare-fun d!93886 () Bool)

(declare-fun res!227961 () Bool)

(declare-fun e!193905 () Bool)

(assert (=> d!93886 (=> (not res!227961) (not e!193905))))

(assert (=> d!93886 (= res!227961 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6707 (buf!7175 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6707 (buf!7175 thiss!882)))))))))

(assert (=> d!93886 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!193905)))

(declare-fun b!273973 () Bool)

(declare-fun lt!411949 () (_ BitVec 64))

(assert (=> b!273973 (= e!193905 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411949) (bvsle lt!411949 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6707 (buf!7175 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!273973 (= lt!411949 (bvadd (bitIndex!0 (size!6707 (buf!7175 thiss!882)) (currentByte!13234 thiss!882) (currentBit!13229 thiss!882)) diffInBits!15))))

(assert (= (and d!93886 res!227961) b!273973))

(declare-fun m!406757 () Bool)

(assert (=> b!273973 m!406757))

(assert (=> start!60340 d!93886))

(declare-fun d!93892 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!93892 (= (inv!12 thiss!882) (invariant!0 (currentBit!13229 thiss!882) (currentByte!13234 thiss!882) (size!6707 (buf!7175 thiss!882))))))

(declare-fun bs!23663 () Bool)

(assert (= bs!23663 d!93892))

(declare-fun m!406761 () Bool)

(assert (=> bs!23663 m!406761))

(assert (=> start!60340 d!93892))

(declare-fun d!93896 () Bool)

(assert (=> d!93896 (= (array_inv!6431 (buf!7175 thiss!882)) (bvsge (size!6707 (buf!7175 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!273960 d!93896))

(check-sat (not b!273973) (not d!93892))
(check-sat)
(get-model)

(declare-fun d!93906 () Bool)

(declare-fun e!193914 () Bool)

(assert (=> d!93906 e!193914))

(declare-fun res!227975 () Bool)

(assert (=> d!93906 (=> (not res!227975) (not e!193914))))

(declare-fun lt!411980 () (_ BitVec 64))

(declare-fun lt!411978 () (_ BitVec 64))

(declare-fun lt!411979 () (_ BitVec 64))

(assert (=> d!93906 (= res!227975 (= lt!411978 (bvsub lt!411980 lt!411979)))))

(assert (=> d!93906 (or (= (bvand lt!411980 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!411979 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!411980 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!411980 lt!411979) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!93906 (= lt!411979 (remainingBits!0 ((_ sign_extend 32) (size!6707 (buf!7175 thiss!882))) ((_ sign_extend 32) (currentByte!13234 thiss!882)) ((_ sign_extend 32) (currentBit!13229 thiss!882))))))

(declare-fun lt!411983 () (_ BitVec 64))

(declare-fun lt!411982 () (_ BitVec 64))

(assert (=> d!93906 (= lt!411980 (bvmul lt!411983 lt!411982))))

(assert (=> d!93906 (or (= lt!411983 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!411982 (bvsdiv (bvmul lt!411983 lt!411982) lt!411983)))))

(assert (=> d!93906 (= lt!411982 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93906 (= lt!411983 ((_ sign_extend 32) (size!6707 (buf!7175 thiss!882))))))

(assert (=> d!93906 (= lt!411978 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13234 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13229 thiss!882))))))

(assert (=> d!93906 (invariant!0 (currentBit!13229 thiss!882) (currentByte!13234 thiss!882) (size!6707 (buf!7175 thiss!882)))))

(assert (=> d!93906 (= (bitIndex!0 (size!6707 (buf!7175 thiss!882)) (currentByte!13234 thiss!882) (currentBit!13229 thiss!882)) lt!411978)))

(declare-fun b!273987 () Bool)

(declare-fun res!227974 () Bool)

(assert (=> b!273987 (=> (not res!227974) (not e!193914))))

(assert (=> b!273987 (= res!227974 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411978))))

(declare-fun b!273988 () Bool)

(declare-fun lt!411981 () (_ BitVec 64))

(assert (=> b!273988 (= e!193914 (bvsle lt!411978 (bvmul lt!411981 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!273988 (or (= lt!411981 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!411981 #b0000000000000000000000000000000000000000000000000000000000001000) lt!411981)))))

(assert (=> b!273988 (= lt!411981 ((_ sign_extend 32) (size!6707 (buf!7175 thiss!882))))))

(assert (= (and d!93906 res!227975) b!273987))

(assert (= (and b!273987 res!227974) b!273988))

(declare-fun m!406769 () Bool)

(assert (=> d!93906 m!406769))

(assert (=> d!93906 m!406761))

(assert (=> b!273973 d!93906))

(declare-fun d!93910 () Bool)

(assert (=> d!93910 (= (invariant!0 (currentBit!13229 thiss!882) (currentByte!13234 thiss!882) (size!6707 (buf!7175 thiss!882))) (and (bvsge (currentBit!13229 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13229 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13234 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13234 thiss!882) (size!6707 (buf!7175 thiss!882))) (and (= (currentBit!13229 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13234 thiss!882) (size!6707 (buf!7175 thiss!882)))))))))

(assert (=> d!93892 d!93910))

(check-sat (not d!93906))
(check-sat)
