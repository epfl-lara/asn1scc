; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69504 () Bool)

(assert start!69504)

(declare-fun b!312351 () Bool)

(declare-fun e!224637 () Bool)

(declare-datatypes ((array!19125 0))(
  ( (array!19126 (arr!9371 (Array (_ BitVec 32) (_ BitVec 8))) (size!8291 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13686 0))(
  ( (BitStream!13687 (buf!7904 array!19125) (currentByte!14617 (_ BitVec 32)) (currentBit!14612 (_ BitVec 32))) )
))
(declare-fun b2!97 () BitStream!13686)

(declare-fun array_inv!7843 (array!19125) Bool)

(assert (=> b!312351 (= e!224637 (array_inv!7843 (buf!7904 b2!97)))))

(declare-fun b!312348 () Bool)

(declare-fun res!255838 () Bool)

(declare-fun e!224638 () Bool)

(assert (=> b!312348 (=> (not res!255838) (not e!224638))))

(declare-fun b1!97 () BitStream!13686)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!312348 (= res!255838 (validate_offset_bits!1 ((_ sign_extend 32) (size!8291 (buf!7904 b1!97))) ((_ sign_extend 32) (currentByte!14617 b1!97)) ((_ sign_extend 32) (currentBit!14612 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun b!312349 () Bool)

(declare-fun lt!441920 () (_ BitVec 64))

(declare-fun lt!441919 () (_ BitVec 64))

(assert (=> b!312349 (= e!224638 (and (= lt!441920 (bvand advancedAtMostBits!9 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!441920 (bvand (bvadd lt!441919 advancedAtMostBits!9) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!312349 (= lt!441920 (bvand lt!441919 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!312349 (= lt!441919 (bitIndex!0 (size!8291 (buf!7904 b1!97)) (currentByte!14617 b1!97) (currentBit!14612 b1!97)))))

(declare-fun res!255839 () Bool)

(assert (=> start!69504 (=> (not res!255839) (not e!224638))))

(assert (=> start!69504 (= res!255839 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8291 (buf!7904 b1!97)) (size!8291 (buf!7904 b2!97)))))))

(assert (=> start!69504 e!224638))

(assert (=> start!69504 true))

(declare-fun e!224634 () Bool)

(declare-fun inv!12 (BitStream!13686) Bool)

(assert (=> start!69504 (and (inv!12 b1!97) e!224634)))

(assert (=> start!69504 (and (inv!12 b2!97) e!224637)))

(declare-fun b!312350 () Bool)

(assert (=> b!312350 (= e!224634 (array_inv!7843 (buf!7904 b1!97)))))

(assert (= (and start!69504 res!255839) b!312348))

(assert (= (and b!312348 res!255838) b!312349))

(assert (= start!69504 b!312350))

(assert (= start!69504 b!312351))

(declare-fun m!450023 () Bool)

(assert (=> start!69504 m!450023))

(declare-fun m!450025 () Bool)

(assert (=> start!69504 m!450025))

(declare-fun m!450027 () Bool)

(assert (=> b!312349 m!450027))

(declare-fun m!450029 () Bool)

(assert (=> b!312351 m!450029))

(declare-fun m!450031 () Bool)

(assert (=> b!312348 m!450031))

(declare-fun m!450033 () Bool)

(assert (=> b!312350 m!450033))

(check-sat (not b!312349) (not b!312348) (not start!69504) (not b!312350) (not b!312351))
(check-sat)
(get-model)

(declare-fun d!103730 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!103730 (= (inv!12 b1!97) (invariant!0 (currentBit!14612 b1!97) (currentByte!14617 b1!97) (size!8291 (buf!7904 b1!97))))))

(declare-fun bs!26840 () Bool)

(assert (= bs!26840 d!103730))

(declare-fun m!450047 () Bool)

(assert (=> bs!26840 m!450047))

(assert (=> start!69504 d!103730))

(declare-fun d!103732 () Bool)

(assert (=> d!103732 (= (inv!12 b2!97) (invariant!0 (currentBit!14612 b2!97) (currentByte!14617 b2!97) (size!8291 (buf!7904 b2!97))))))

(declare-fun bs!26841 () Bool)

(assert (= bs!26841 d!103732))

(declare-fun m!450049 () Bool)

(assert (=> bs!26841 m!450049))

(assert (=> start!69504 d!103732))

(declare-fun d!103734 () Bool)

(declare-fun e!224656 () Bool)

(assert (=> d!103734 e!224656))

(declare-fun res!255850 () Bool)

(assert (=> d!103734 (=> (not res!255850) (not e!224656))))

(declare-fun lt!441944 () (_ BitVec 64))

(declare-fun lt!441941 () (_ BitVec 64))

(declare-fun lt!441942 () (_ BitVec 64))

(assert (=> d!103734 (= res!255850 (= lt!441942 (bvsub lt!441941 lt!441944)))))

(assert (=> d!103734 (or (= (bvand lt!441941 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441944 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441941 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441941 lt!441944) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!103734 (= lt!441944 (remainingBits!0 ((_ sign_extend 32) (size!8291 (buf!7904 b1!97))) ((_ sign_extend 32) (currentByte!14617 b1!97)) ((_ sign_extend 32) (currentBit!14612 b1!97))))))

(declare-fun lt!441939 () (_ BitVec 64))

(declare-fun lt!441940 () (_ BitVec 64))

(assert (=> d!103734 (= lt!441941 (bvmul lt!441939 lt!441940))))

(assert (=> d!103734 (or (= lt!441939 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441940 (bvsdiv (bvmul lt!441939 lt!441940) lt!441939)))))

(assert (=> d!103734 (= lt!441940 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103734 (= lt!441939 ((_ sign_extend 32) (size!8291 (buf!7904 b1!97))))))

(assert (=> d!103734 (= lt!441942 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14617 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14612 b1!97))))))

(assert (=> d!103734 (invariant!0 (currentBit!14612 b1!97) (currentByte!14617 b1!97) (size!8291 (buf!7904 b1!97)))))

(assert (=> d!103734 (= (bitIndex!0 (size!8291 (buf!7904 b1!97)) (currentByte!14617 b1!97) (currentBit!14612 b1!97)) lt!441942)))

(declare-fun b!312368 () Bool)

(declare-fun res!255851 () Bool)

(assert (=> b!312368 (=> (not res!255851) (not e!224656))))

(assert (=> b!312368 (= res!255851 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441942))))

(declare-fun b!312369 () Bool)

(declare-fun lt!441943 () (_ BitVec 64))

(assert (=> b!312369 (= e!224656 (bvsle lt!441942 (bvmul lt!441943 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!312369 (or (= lt!441943 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441943 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441943)))))

(assert (=> b!312369 (= lt!441943 ((_ sign_extend 32) (size!8291 (buf!7904 b1!97))))))

(assert (= (and d!103734 res!255850) b!312368))

(assert (= (and b!312368 res!255851) b!312369))

(declare-fun m!450053 () Bool)

(assert (=> d!103734 m!450053))

(assert (=> d!103734 m!450047))

(assert (=> b!312349 d!103734))

(declare-fun d!103744 () Bool)

(assert (=> d!103744 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8291 (buf!7904 b1!97))) ((_ sign_extend 32) (currentByte!14617 b1!97)) ((_ sign_extend 32) (currentBit!14612 b1!97)) b1ValidateOffsetBits!10) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8291 (buf!7904 b1!97))) ((_ sign_extend 32) (currentByte!14617 b1!97)) ((_ sign_extend 32) (currentBit!14612 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun bs!26843 () Bool)

(assert (= bs!26843 d!103744))

(assert (=> bs!26843 m!450053))

(assert (=> b!312348 d!103744))

(declare-fun d!103746 () Bool)

(assert (=> d!103746 (= (array_inv!7843 (buf!7904 b2!97)) (bvsge (size!8291 (buf!7904 b2!97)) #b00000000000000000000000000000000))))

(assert (=> b!312351 d!103746))

(declare-fun d!103748 () Bool)

(assert (=> d!103748 (= (array_inv!7843 (buf!7904 b1!97)) (bvsge (size!8291 (buf!7904 b1!97)) #b00000000000000000000000000000000))))

(assert (=> b!312350 d!103748))

(check-sat (not d!103734) (not d!103730) (not d!103744) (not d!103732))
