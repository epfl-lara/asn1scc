; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69268 () Bool)

(assert start!69268)

(declare-fun b!311743 () Bool)

(declare-fun e!224159 () Bool)

(declare-datatypes ((array!19059 0))(
  ( (array!19060 (arr!9347 (Array (_ BitVec 32) (_ BitVec 8))) (size!8267 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13638 0))(
  ( (BitStream!13639 (buf!7880 array!19059) (currentByte!14535 (_ BitVec 32)) (currentBit!14530 (_ BitVec 32))) )
))
(declare-fun b2!97 () BitStream!13638)

(assert (=> b!311743 (= e!224159 (and (bvsle ((_ sign_extend 32) (size!8267 (buf!7880 b2!97))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14535 b2!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14530 b2!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!8267 (buf!7880 b2!97))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!14535 b2!97)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!14530 b2!97)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!311744 () Bool)

(declare-fun e!224164 () Bool)

(declare-fun e!224162 () Bool)

(assert (=> b!311744 (= e!224164 e!224162)))

(declare-fun res!255378 () Bool)

(assert (=> b!311744 (=> (not res!255378) (not e!224162))))

(declare-fun lt!441366 () (_ BitVec 64))

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun lt!441367 () (_ BitVec 64))

(assert (=> b!311744 (= res!255378 (bvsge (bvsub lt!441366 lt!441367) b1ValidateOffsetBits!10))))

(declare-fun b1!97 () BitStream!13638)

(assert (=> b!311744 (= lt!441367 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14535 b1!97))) ((_ sign_extend 32) (currentBit!14530 b1!97))))))

(assert (=> b!311744 (= lt!441366 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8267 (buf!7880 b1!97)))))))

(declare-fun b!311745 () Bool)

(declare-fun res!255380 () Bool)

(assert (=> b!311745 (=> (not res!255380) (not e!224164))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!311745 (= res!255380 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8267 (buf!7880 b1!97))) ((_ sign_extend 32) (currentByte!14535 b1!97)) ((_ sign_extend 32) (currentBit!14530 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun b!311746 () Bool)

(declare-fun res!255381 () Bool)

(assert (=> b!311746 (=> (not res!255381) (not e!224159))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(assert (=> b!311746 (= res!255381 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8267 (buf!7880 b2!97))) ((_ sign_extend 32) (currentByte!14535 b2!97)) ((_ sign_extend 32) (currentBit!14530 b2!97))) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9)))))

(declare-fun res!255383 () Bool)

(assert (=> start!69268 (=> (not res!255383) (not e!224164))))

(assert (=> start!69268 (= res!255383 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8267 (buf!7880 b1!97)) (size!8267 (buf!7880 b2!97)))))))

(assert (=> start!69268 e!224164))

(assert (=> start!69268 true))

(declare-fun e!224158 () Bool)

(declare-fun inv!12 (BitStream!13638) Bool)

(assert (=> start!69268 (and (inv!12 b1!97) e!224158)))

(declare-fun e!224160 () Bool)

(assert (=> start!69268 (and (inv!12 b2!97) e!224160)))

(declare-fun b!311747 () Bool)

(declare-fun res!255377 () Bool)

(assert (=> b!311747 (=> (not res!255377) (not e!224164))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!311747 (= res!255377 (validate_offset_bits!1 ((_ sign_extend 32) (size!8267 (buf!7880 b1!97))) ((_ sign_extend 32) (currentByte!14535 b1!97)) ((_ sign_extend 32) (currentBit!14530 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!311748 () Bool)

(declare-fun array_inv!7819 (array!19059) Bool)

(assert (=> b!311748 (= e!224158 (array_inv!7819 (buf!7880 b1!97)))))

(declare-fun b!311749 () Bool)

(assert (=> b!311749 (= e!224162 e!224159)))

(declare-fun res!255379 () Bool)

(assert (=> b!311749 (=> (not res!255379) (not e!224159))))

(declare-fun lt!441368 () (_ BitVec 64))

(assert (=> b!311749 (= res!255379 (and (bvsle lt!441368 (bvadd lt!441367 advancedAtMostBits!9)) (bvsge (bvsub lt!441366 lt!441368) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9))))))

(assert (=> b!311749 (= lt!441368 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14535 b2!97))) ((_ sign_extend 32) (currentBit!14530 b2!97))))))

(declare-fun b!311750 () Bool)

(declare-fun res!255382 () Bool)

(assert (=> b!311750 (=> (not res!255382) (not e!224164))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!311750 (= res!255382 (bvsle (bitIndex!0 (size!8267 (buf!7880 b2!97)) (currentByte!14535 b2!97) (currentBit!14530 b2!97)) (bvadd (bitIndex!0 (size!8267 (buf!7880 b1!97)) (currentByte!14535 b1!97) (currentBit!14530 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!311751 () Bool)

(assert (=> b!311751 (= e!224160 (array_inv!7819 (buf!7880 b2!97)))))

(assert (= (and start!69268 res!255383) b!311747))

(assert (= (and b!311747 res!255377) b!311750))

(assert (= (and b!311750 res!255382) b!311745))

(assert (= (and b!311745 res!255380) b!311744))

(assert (= (and b!311744 res!255378) b!311749))

(assert (= (and b!311749 res!255379) b!311746))

(assert (= (and b!311746 res!255381) b!311743))

(assert (= start!69268 b!311748))

(assert (= start!69268 b!311751))

(declare-fun m!449537 () Bool)

(assert (=> b!311748 m!449537))

(declare-fun m!449539 () Bool)

(assert (=> b!311745 m!449539))

(declare-fun m!449541 () Bool)

(assert (=> b!311750 m!449541))

(declare-fun m!449543 () Bool)

(assert (=> b!311750 m!449543))

(declare-fun m!449545 () Bool)

(assert (=> b!311747 m!449545))

(declare-fun m!449547 () Bool)

(assert (=> b!311751 m!449547))

(declare-fun m!449549 () Bool)

(assert (=> b!311746 m!449549))

(declare-fun m!449551 () Bool)

(assert (=> start!69268 m!449551))

(declare-fun m!449553 () Bool)

(assert (=> start!69268 m!449553))

(check-sat (not b!311748) (not b!311745) (not b!311747) (not start!69268) (not b!311751) (not b!311750) (not b!311746))
(check-sat)
(get-model)

(declare-fun d!103398 () Bool)

(assert (=> d!103398 (= (array_inv!7819 (buf!7880 b1!97)) (bvsge (size!8267 (buf!7880 b1!97)) #b00000000000000000000000000000000))))

(assert (=> b!311748 d!103398))

(declare-fun d!103400 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!103400 (= (inv!12 b1!97) (invariant!0 (currentBit!14530 b1!97) (currentByte!14535 b1!97) (size!8267 (buf!7880 b1!97))))))

(declare-fun bs!26762 () Bool)

(assert (= bs!26762 d!103400))

(declare-fun m!449573 () Bool)

(assert (=> bs!26762 m!449573))

(assert (=> start!69268 d!103400))

(declare-fun d!103402 () Bool)

(assert (=> d!103402 (= (inv!12 b2!97) (invariant!0 (currentBit!14530 b2!97) (currentByte!14535 b2!97) (size!8267 (buf!7880 b2!97))))))

(declare-fun bs!26763 () Bool)

(assert (= bs!26763 d!103402))

(declare-fun m!449575 () Bool)

(assert (=> bs!26763 m!449575))

(assert (=> start!69268 d!103402))

(declare-fun d!103404 () Bool)

(assert (=> d!103404 (= (array_inv!7819 (buf!7880 b2!97)) (bvsge (size!8267 (buf!7880 b2!97)) #b00000000000000000000000000000000))))

(assert (=> b!311751 d!103404))

(declare-fun d!103406 () Bool)

(declare-fun e!224188 () Bool)

(assert (=> d!103406 e!224188))

(declare-fun res!255409 () Bool)

(assert (=> d!103406 (=> (not res!255409) (not e!224188))))

(declare-fun lt!441395 () (_ BitVec 64))

(declare-fun lt!441392 () (_ BitVec 64))

(declare-fun lt!441390 () (_ BitVec 64))

(assert (=> d!103406 (= res!255409 (= lt!441395 (bvsub lt!441392 lt!441390)))))

(assert (=> d!103406 (or (= (bvand lt!441392 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441390 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441392 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441392 lt!441390) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103406 (= lt!441390 (remainingBits!0 ((_ sign_extend 32) (size!8267 (buf!7880 b2!97))) ((_ sign_extend 32) (currentByte!14535 b2!97)) ((_ sign_extend 32) (currentBit!14530 b2!97))))))

(declare-fun lt!441393 () (_ BitVec 64))

(declare-fun lt!441391 () (_ BitVec 64))

(assert (=> d!103406 (= lt!441392 (bvmul lt!441393 lt!441391))))

(assert (=> d!103406 (or (= lt!441393 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441391 (bvsdiv (bvmul lt!441393 lt!441391) lt!441393)))))

(assert (=> d!103406 (= lt!441391 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103406 (= lt!441393 ((_ sign_extend 32) (size!8267 (buf!7880 b2!97))))))

(assert (=> d!103406 (= lt!441395 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14535 b2!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14530 b2!97))))))

(assert (=> d!103406 (invariant!0 (currentBit!14530 b2!97) (currentByte!14535 b2!97) (size!8267 (buf!7880 b2!97)))))

(assert (=> d!103406 (= (bitIndex!0 (size!8267 (buf!7880 b2!97)) (currentByte!14535 b2!97) (currentBit!14530 b2!97)) lt!441395)))

(declare-fun b!311783 () Bool)

(declare-fun res!255410 () Bool)

(assert (=> b!311783 (=> (not res!255410) (not e!224188))))

(assert (=> b!311783 (= res!255410 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441395))))

(declare-fun b!311784 () Bool)

(declare-fun lt!441394 () (_ BitVec 64))

(assert (=> b!311784 (= e!224188 (bvsle lt!441395 (bvmul lt!441394 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!311784 (or (= lt!441394 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441394 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441394)))))

(assert (=> b!311784 (= lt!441394 ((_ sign_extend 32) (size!8267 (buf!7880 b2!97))))))

(assert (= (and d!103406 res!255409) b!311783))

(assert (= (and b!311783 res!255410) b!311784))

(assert (=> d!103406 m!449549))

(assert (=> d!103406 m!449575))

(assert (=> b!311750 d!103406))

(declare-fun d!103412 () Bool)

(declare-fun e!224189 () Bool)

(assert (=> d!103412 e!224189))

(declare-fun res!255411 () Bool)

(assert (=> d!103412 (=> (not res!255411) (not e!224189))))

(declare-fun lt!441398 () (_ BitVec 64))

(declare-fun lt!441401 () (_ BitVec 64))

(declare-fun lt!441396 () (_ BitVec 64))

(assert (=> d!103412 (= res!255411 (= lt!441401 (bvsub lt!441398 lt!441396)))))

(assert (=> d!103412 (or (= (bvand lt!441398 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441396 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441398 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441398 lt!441396) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103412 (= lt!441396 (remainingBits!0 ((_ sign_extend 32) (size!8267 (buf!7880 b1!97))) ((_ sign_extend 32) (currentByte!14535 b1!97)) ((_ sign_extend 32) (currentBit!14530 b1!97))))))

(declare-fun lt!441399 () (_ BitVec 64))

(declare-fun lt!441397 () (_ BitVec 64))

(assert (=> d!103412 (= lt!441398 (bvmul lt!441399 lt!441397))))

(assert (=> d!103412 (or (= lt!441399 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441397 (bvsdiv (bvmul lt!441399 lt!441397) lt!441399)))))

(assert (=> d!103412 (= lt!441397 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103412 (= lt!441399 ((_ sign_extend 32) (size!8267 (buf!7880 b1!97))))))

(assert (=> d!103412 (= lt!441401 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14535 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14530 b1!97))))))

(assert (=> d!103412 (invariant!0 (currentBit!14530 b1!97) (currentByte!14535 b1!97) (size!8267 (buf!7880 b1!97)))))

(assert (=> d!103412 (= (bitIndex!0 (size!8267 (buf!7880 b1!97)) (currentByte!14535 b1!97) (currentBit!14530 b1!97)) lt!441401)))

(declare-fun b!311785 () Bool)

(declare-fun res!255412 () Bool)

(assert (=> b!311785 (=> (not res!255412) (not e!224189))))

(assert (=> b!311785 (= res!255412 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441401))))

(declare-fun b!311786 () Bool)

(declare-fun lt!441400 () (_ BitVec 64))

(assert (=> b!311786 (= e!224189 (bvsle lt!441401 (bvmul lt!441400 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!311786 (or (= lt!441400 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441400 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441400)))))

(assert (=> b!311786 (= lt!441400 ((_ sign_extend 32) (size!8267 (buf!7880 b1!97))))))

(assert (= (and d!103412 res!255411) b!311785))

(assert (= (and b!311785 res!255412) b!311786))

(assert (=> d!103412 m!449539))

(assert (=> d!103412 m!449573))

(assert (=> b!311750 d!103412))

(declare-fun d!103414 () Bool)

(assert (=> d!103414 (= (remainingBits!0 ((_ sign_extend 32) (size!8267 (buf!7880 b1!97))) ((_ sign_extend 32) (currentByte!14535 b1!97)) ((_ sign_extend 32) (currentBit!14530 b1!97))) (bvsub (bvmul ((_ sign_extend 32) (size!8267 (buf!7880 b1!97))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14535 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14530 b1!97)))))))

(assert (=> b!311745 d!103414))

(declare-fun d!103416 () Bool)

(assert (=> d!103416 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8267 (buf!7880 b1!97))) ((_ sign_extend 32) (currentByte!14535 b1!97)) ((_ sign_extend 32) (currentBit!14530 b1!97)) b1ValidateOffsetBits!10) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8267 (buf!7880 b1!97))) ((_ sign_extend 32) (currentByte!14535 b1!97)) ((_ sign_extend 32) (currentBit!14530 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun bs!26765 () Bool)

(assert (= bs!26765 d!103416))

(assert (=> bs!26765 m!449539))

(assert (=> b!311747 d!103416))

(declare-fun d!103418 () Bool)

(assert (=> d!103418 (= (remainingBits!0 ((_ sign_extend 32) (size!8267 (buf!7880 b2!97))) ((_ sign_extend 32) (currentByte!14535 b2!97)) ((_ sign_extend 32) (currentBit!14530 b2!97))) (bvsub (bvmul ((_ sign_extend 32) (size!8267 (buf!7880 b2!97))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14535 b2!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14530 b2!97)))))))

(assert (=> b!311746 d!103418))

(check-sat (not d!103406) (not d!103402) (not d!103412) (not d!103416) (not d!103400))
