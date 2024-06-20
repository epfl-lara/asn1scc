; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29628 () Bool)

(assert start!29628)

(declare-fun b!152758 () Bool)

(declare-fun e!102267 () Bool)

(declare-datatypes ((array!6847 0))(
  ( (array!6848 (arr!3915 (Array (_ BitVec 32) (_ BitVec 8))) (size!3092 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5442 0))(
  ( (BitStream!5443 (buf!3595 array!6847) (currentByte!6566 (_ BitVec 32)) (currentBit!6561 (_ BitVec 32))) )
))
(declare-fun bs2!18 () BitStream!5442)

(declare-fun array_inv!2881 (array!6847) Bool)

(assert (=> b!152758 (= e!102267 (array_inv!2881 (buf!3595 bs2!18)))))

(declare-fun b!152759 () Bool)

(declare-fun e!102262 () Bool)

(declare-fun e!102266 () Bool)

(assert (=> b!152759 (= e!102262 e!102266)))

(declare-fun res!128018 () Bool)

(assert (=> b!152759 (=> (not res!128018) (not e!102266))))

(declare-fun lt!239206 () (_ BitVec 64))

(declare-fun bs1!10 () BitStream!5442)

(assert (=> b!152759 (= res!128018 (bvsle lt!239206 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3092 (buf!3595 bs1!10))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!152759 (= lt!239206 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3092 (buf!3595 bs1!10)) (currentByte!6566 bs1!10) (currentBit!6561 bs1!10))))))

(declare-fun b!152760 () Bool)

(assert (=> b!152760 (= e!102266 (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!239206))))

(declare-fun b!152761 () Bool)

(declare-fun res!128019 () Bool)

(assert (=> b!152761 (=> (not res!128019) (not e!102266))))

(assert (=> b!152761 (= res!128019 (bvsle lt!239206 (bitIndex!0 (size!3092 (buf!3595 bs2!18)) (currentByte!6566 bs2!18) (currentBit!6561 bs2!18))))))

(declare-fun res!128017 () Bool)

(assert (=> start!29628 (=> (not res!128017) (not e!102262))))

(assert (=> start!29628 (= res!128017 (= (size!3092 (buf!3595 bs1!10)) (size!3092 (buf!3595 bs2!18))))))

(assert (=> start!29628 e!102262))

(declare-fun e!102264 () Bool)

(declare-fun inv!12 (BitStream!5442) Bool)

(assert (=> start!29628 (and (inv!12 bs1!10) e!102264)))

(assert (=> start!29628 (and (inv!12 bs2!18) e!102267)))

(declare-fun b!152762 () Bool)

(assert (=> b!152762 (= e!102264 (array_inv!2881 (buf!3595 bs1!10)))))

(assert (= (and start!29628 res!128017) b!152759))

(assert (= (and b!152759 res!128018) b!152761))

(assert (= (and b!152761 res!128019) b!152760))

(assert (= start!29628 b!152762))

(assert (= start!29628 b!152758))

(declare-fun m!238597 () Bool)

(assert (=> b!152759 m!238597))

(declare-fun m!238599 () Bool)

(assert (=> b!152761 m!238599))

(declare-fun m!238601 () Bool)

(assert (=> start!29628 m!238601))

(declare-fun m!238603 () Bool)

(assert (=> start!29628 m!238603))

(declare-fun m!238605 () Bool)

(assert (=> b!152758 m!238605))

(declare-fun m!238607 () Bool)

(assert (=> b!152762 m!238607))

(check-sat (not b!152758) (not start!29628) (not b!152762) (not b!152761) (not b!152759))
(check-sat)
(get-model)

(declare-fun d!50224 () Bool)

(declare-fun e!102288 () Bool)

(assert (=> d!50224 e!102288))

(declare-fun res!128034 () Bool)

(assert (=> d!50224 (=> (not res!128034) (not e!102288))))

(declare-fun lt!239227 () (_ BitVec 64))

(declare-fun lt!239225 () (_ BitVec 64))

(declare-fun lt!239223 () (_ BitVec 64))

(assert (=> d!50224 (= res!128034 (= lt!239223 (bvsub lt!239227 lt!239225)))))

(assert (=> d!50224 (or (= (bvand lt!239227 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!239225 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!239227 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!239227 lt!239225) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!50224 (= lt!239225 (remainingBits!0 ((_ sign_extend 32) (size!3092 (buf!3595 bs1!10))) ((_ sign_extend 32) (currentByte!6566 bs1!10)) ((_ sign_extend 32) (currentBit!6561 bs1!10))))))

(declare-fun lt!239222 () (_ BitVec 64))

(declare-fun lt!239226 () (_ BitVec 64))

(assert (=> d!50224 (= lt!239227 (bvmul lt!239222 lt!239226))))

(assert (=> d!50224 (or (= lt!239222 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!239226 (bvsdiv (bvmul lt!239222 lt!239226) lt!239222)))))

(assert (=> d!50224 (= lt!239226 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50224 (= lt!239222 ((_ sign_extend 32) (size!3092 (buf!3595 bs1!10))))))

(assert (=> d!50224 (= lt!239223 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6566 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6561 bs1!10))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!50224 (invariant!0 (currentBit!6561 bs1!10) (currentByte!6566 bs1!10) (size!3092 (buf!3595 bs1!10)))))

(assert (=> d!50224 (= (bitIndex!0 (size!3092 (buf!3595 bs1!10)) (currentByte!6566 bs1!10) (currentBit!6561 bs1!10)) lt!239223)))

(declare-fun b!152782 () Bool)

(declare-fun res!128033 () Bool)

(assert (=> b!152782 (=> (not res!128033) (not e!102288))))

(assert (=> b!152782 (= res!128033 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!239223))))

(declare-fun b!152783 () Bool)

(declare-fun lt!239224 () (_ BitVec 64))

(assert (=> b!152783 (= e!102288 (bvsle lt!239223 (bvmul lt!239224 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!152783 (or (= lt!239224 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!239224 #b0000000000000000000000000000000000000000000000000000000000001000) lt!239224)))))

(assert (=> b!152783 (= lt!239224 ((_ sign_extend 32) (size!3092 (buf!3595 bs1!10))))))

(assert (= (and d!50224 res!128034) b!152782))

(assert (= (and b!152782 res!128033) b!152783))

(declare-fun m!238621 () Bool)

(assert (=> d!50224 m!238621))

(declare-fun m!238623 () Bool)

(assert (=> d!50224 m!238623))

(assert (=> b!152759 d!50224))

(declare-fun d!50226 () Bool)

(assert (=> d!50226 (= (inv!12 bs1!10) (invariant!0 (currentBit!6561 bs1!10) (currentByte!6566 bs1!10) (size!3092 (buf!3595 bs1!10))))))

(declare-fun bs!12281 () Bool)

(assert (= bs!12281 d!50226))

(assert (=> bs!12281 m!238623))

(assert (=> start!29628 d!50226))

(declare-fun d!50232 () Bool)

(assert (=> d!50232 (= (inv!12 bs2!18) (invariant!0 (currentBit!6561 bs2!18) (currentByte!6566 bs2!18) (size!3092 (buf!3595 bs2!18))))))

(declare-fun bs!12282 () Bool)

(assert (= bs!12282 d!50232))

(declare-fun m!238625 () Bool)

(assert (=> bs!12282 m!238625))

(assert (=> start!29628 d!50232))

(declare-fun d!50234 () Bool)

(declare-fun e!102289 () Bool)

(assert (=> d!50234 e!102289))

(declare-fun res!128036 () Bool)

(assert (=> d!50234 (=> (not res!128036) (not e!102289))))

(declare-fun lt!239229 () (_ BitVec 64))

(declare-fun lt!239231 () (_ BitVec 64))

(declare-fun lt!239233 () (_ BitVec 64))

(assert (=> d!50234 (= res!128036 (= lt!239229 (bvsub lt!239233 lt!239231)))))

(assert (=> d!50234 (or (= (bvand lt!239233 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!239231 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!239233 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!239233 lt!239231) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50234 (= lt!239231 (remainingBits!0 ((_ sign_extend 32) (size!3092 (buf!3595 bs2!18))) ((_ sign_extend 32) (currentByte!6566 bs2!18)) ((_ sign_extend 32) (currentBit!6561 bs2!18))))))

(declare-fun lt!239228 () (_ BitVec 64))

(declare-fun lt!239232 () (_ BitVec 64))

(assert (=> d!50234 (= lt!239233 (bvmul lt!239228 lt!239232))))

(assert (=> d!50234 (or (= lt!239228 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!239232 (bvsdiv (bvmul lt!239228 lt!239232) lt!239228)))))

(assert (=> d!50234 (= lt!239232 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50234 (= lt!239228 ((_ sign_extend 32) (size!3092 (buf!3595 bs2!18))))))

(assert (=> d!50234 (= lt!239229 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6566 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6561 bs2!18))))))

(assert (=> d!50234 (invariant!0 (currentBit!6561 bs2!18) (currentByte!6566 bs2!18) (size!3092 (buf!3595 bs2!18)))))

(assert (=> d!50234 (= (bitIndex!0 (size!3092 (buf!3595 bs2!18)) (currentByte!6566 bs2!18) (currentBit!6561 bs2!18)) lt!239229)))

(declare-fun b!152784 () Bool)

(declare-fun res!128035 () Bool)

(assert (=> b!152784 (=> (not res!128035) (not e!102289))))

(assert (=> b!152784 (= res!128035 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!239229))))

(declare-fun b!152785 () Bool)

(declare-fun lt!239230 () (_ BitVec 64))

(assert (=> b!152785 (= e!102289 (bvsle lt!239229 (bvmul lt!239230 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!152785 (or (= lt!239230 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!239230 #b0000000000000000000000000000000000000000000000000000000000001000) lt!239230)))))

(assert (=> b!152785 (= lt!239230 ((_ sign_extend 32) (size!3092 (buf!3595 bs2!18))))))

(assert (= (and d!50234 res!128036) b!152784))

(assert (= (and b!152784 res!128035) b!152785))

(declare-fun m!238627 () Bool)

(assert (=> d!50234 m!238627))

(assert (=> d!50234 m!238625))

(assert (=> b!152761 d!50234))

(declare-fun d!50236 () Bool)

(assert (=> d!50236 (= (array_inv!2881 (buf!3595 bs1!10)) (bvsge (size!3092 (buf!3595 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!152762 d!50236))

(declare-fun d!50238 () Bool)

(assert (=> d!50238 (= (array_inv!2881 (buf!3595 bs2!18)) (bvsge (size!3092 (buf!3595 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!152758 d!50238))

(check-sat (not d!50226) (not d!50224) (not d!50232) (not d!50234))
