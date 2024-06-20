; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16378 () Bool)

(assert start!16378)

(declare-fun b!81944 () Bool)

(declare-fun e!54011 () Bool)

(declare-datatypes ((array!3663 0))(
  ( (array!3664 (arr!2318 (Array (_ BitVec 32) (_ BitVec 8))) (size!1681 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2924 0))(
  ( (BitStream!2925 (buf!2071 array!3663) (currentByte!4017 (_ BitVec 32)) (currentBit!4012 (_ BitVec 32))) )
))
(declare-fun b1!98 () BitStream!2924)

(assert (=> b!81944 (= e!54011 (not (or (bvsgt ((_ sign_extend 32) (size!1681 (buf!2071 b1!98))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4017 b1!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4012 b1!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (and (bvsge ((_ sign_extend 32) (size!1681 (buf!2071 b1!98))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4017 b1!98)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4012 b1!98)) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!130241 () (_ BitVec 64))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!81944 (= (remainingBits!0 ((_ sign_extend 32) (size!1681 (buf!2071 b1!98))) ((_ sign_extend 32) (currentByte!4017 b1!98)) ((_ sign_extend 32) (currentBit!4012 b1!98))) (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1681 (buf!2071 b1!98)))) lt!130241))))

(declare-datatypes ((Unit!5471 0))(
  ( (Unit!5472) )
))
(declare-fun lt!130242 () Unit!5471)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!2924) Unit!5471)

(assert (=> b!81944 (= lt!130242 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!81945 () Bool)

(declare-fun e!54010 () Bool)

(declare-fun array_inv!1527 (array!3663) Bool)

(assert (=> b!81945 (= e!54010 (array_inv!1527 (buf!2071 b1!98)))))

(declare-fun res!67564 () Bool)

(declare-fun e!54012 () Bool)

(assert (=> start!16378 (=> (not res!67564) (not e!54012))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-fun b2!98 () BitStream!2924)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(assert (=> start!16378 (= res!67564 (and (= (size!1681 (buf!2071 b1!98)) (size!1681 (buf!2071 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16378 e!54012))

(declare-fun inv!12 (BitStream!2924) Bool)

(assert (=> start!16378 (and (inv!12 b1!98) e!54010)))

(declare-fun e!54015 () Bool)

(assert (=> start!16378 (and (inv!12 b2!98) e!54015)))

(assert (=> start!16378 true))

(declare-fun b!81946 () Bool)

(assert (=> b!81946 (= e!54015 (array_inv!1527 (buf!2071 b2!98)))))

(declare-fun b!81947 () Bool)

(assert (=> b!81947 (= e!54012 e!54011)))

(declare-fun res!67562 () Bool)

(assert (=> b!81947 (=> (not res!67562) (not e!54011))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!81947 (= res!67562 (= (bvadd lt!130241 b1b2Diff!1) (bitIndex!0 (size!1681 (buf!2071 b2!98)) (currentByte!4017 b2!98) (currentBit!4012 b2!98))))))

(assert (=> b!81947 (= lt!130241 (bitIndex!0 (size!1681 (buf!2071 b1!98)) (currentByte!4017 b1!98) (currentBit!4012 b1!98)))))

(declare-fun b!81948 () Bool)

(declare-fun res!67563 () Bool)

(assert (=> b!81948 (=> (not res!67563) (not e!54012))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!81948 (= res!67563 (validate_offset_bits!1 ((_ sign_extend 32) (size!1681 (buf!2071 b1!98))) ((_ sign_extend 32) (currentByte!4017 b1!98)) ((_ sign_extend 32) (currentBit!4012 b1!98)) b1ValidateOffsetBits!11))))

(assert (= (and start!16378 res!67564) b!81948))

(assert (= (and b!81948 res!67563) b!81947))

(assert (= (and b!81947 res!67562) b!81944))

(assert (= start!16378 b!81945))

(assert (= start!16378 b!81946))

(declare-fun m!128361 () Bool)

(assert (=> b!81945 m!128361))

(declare-fun m!128363 () Bool)

(assert (=> b!81946 m!128363))

(declare-fun m!128365 () Bool)

(assert (=> b!81944 m!128365))

(declare-fun m!128367 () Bool)

(assert (=> b!81944 m!128367))

(declare-fun m!128369 () Bool)

(assert (=> b!81948 m!128369))

(declare-fun m!128371 () Bool)

(assert (=> b!81947 m!128371))

(declare-fun m!128373 () Bool)

(assert (=> b!81947 m!128373))

(declare-fun m!128375 () Bool)

(assert (=> start!16378 m!128375))

(declare-fun m!128377 () Bool)

(assert (=> start!16378 m!128377))

(push 1)

(assert (not b!81945))

(assert (not b!81948))

(assert (not b!81947))

(assert (not start!16378))

(assert (not b!81946))

(assert (not b!81944))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!25706 () Bool)

(assert (=> d!25706 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1681 (buf!2071 b1!98))) ((_ sign_extend 32) (currentByte!4017 b1!98)) ((_ sign_extend 32) (currentBit!4012 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1681 (buf!2071 b1!98))) ((_ sign_extend 32) (currentByte!4017 b1!98)) ((_ sign_extend 32) (currentBit!4012 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6298 () Bool)

(assert (= bs!6298 d!25706))

(assert (=> bs!6298 m!128365))

(assert (=> b!81948 d!25706))

(declare-fun d!25708 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!25708 (= (inv!12 b1!98) (invariant!0 (currentBit!4012 b1!98) (currentByte!4017 b1!98) (size!1681 (buf!2071 b1!98))))))

(declare-fun bs!6299 () Bool)

(assert (= bs!6299 d!25708))

(declare-fun m!128387 () Bool)

(assert (=> bs!6299 m!128387))

(assert (=> start!16378 d!25708))

(declare-fun d!25710 () Bool)

(assert (=> d!25710 (= (inv!12 b2!98) (invariant!0 (currentBit!4012 b2!98) (currentByte!4017 b2!98) (size!1681 (buf!2071 b2!98))))))

(declare-fun bs!6300 () Bool)

(assert (= bs!6300 d!25710))

(declare-fun m!128389 () Bool)

(assert (=> bs!6300 m!128389))

(assert (=> start!16378 d!25710))

(declare-fun d!25712 () Bool)

(declare-fun e!54026 () Bool)

(assert (=> d!25712 e!54026))

(declare-fun res!67585 () Bool)

(assert (=> d!25712 (=> (not res!67585) (not e!54026))))

(declare-fun lt!130319 () (_ BitVec 64))

(declare-fun lt!130323 () (_ BitVec 64))

(declare-fun lt!130320 () (_ BitVec 64))

(assert (=> d!25712 (= res!67585 (= lt!130319 (bvsub lt!130320 lt!130323)))))

(assert (=> d!25712 (or (= (bvand lt!130320 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!130323 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!130320 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!130320 lt!130323) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25712 (= lt!130323 (remainingBits!0 ((_ sign_extend 32) (size!1681 (buf!2071 b2!98))) ((_ sign_extend 32) (currentByte!4017 b2!98)) ((_ sign_extend 32) (currentBit!4012 b2!98))))))

(declare-fun lt!130318 () (_ BitVec 64))

(declare-fun lt!130322 () (_ BitVec 64))

(assert (=> d!25712 (= lt!130320 (bvmul lt!130318 lt!130322))))

(assert (=> d!25712 (or (= lt!130318 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!130322 (bvsdiv (bvmul lt!130318 lt!130322) lt!130318)))))

(assert (=> d!25712 (= lt!130322 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25712 (= lt!130318 ((_ sign_extend 32) (size!1681 (buf!2071 b2!98))))))

(assert (=> d!25712 (= lt!130319 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4017 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4012 b2!98))))))

(assert (=> d!25712 (invariant!0 (currentBit!4012 b2!98) (currentByte!4017 b2!98) (size!1681 (buf!2071 b2!98)))))

(assert (=> d!25712 (= (bitIndex!0 (size!1681 (buf!2071 b2!98)) (currentByte!4017 b2!98) (currentBit!4012 b2!98)) lt!130319)))

(declare-fun b!81970 () Bool)

(declare-fun res!67586 () Bool)

(assert (=> b!81970 (=> (not res!67586) (not e!54026))))

(assert (=> b!81970 (= res!67586 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!130319))))

(declare-fun b!81971 () Bool)

(declare-fun lt!130321 () (_ BitVec 64))

(assert (=> b!81971 (= e!54026 (bvsle lt!130319 (bvmul lt!130321 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!81971 (or (= lt!130321 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!130321 #b0000000000000000000000000000000000000000000000000000000000001000) lt!130321)))))

(assert (=> b!81971 (= lt!130321 ((_ sign_extend 32) (size!1681 (buf!2071 b2!98))))))

(assert (= (and d!25712 res!67585) b!81970))

(assert (= (and b!81970 res!67586) b!81971))

(declare-fun m!128397 () Bool)

(assert (=> d!25712 m!128397))

(assert (=> d!25712 m!128389))

(assert (=> b!81947 d!25712))

(declare-fun d!25722 () Bool)

(declare-fun e!54027 () Bool)

(assert (=> d!25722 e!54027))

(declare-fun res!67587 () Bool)

(assert (=> d!25722 (=> (not res!67587) (not e!54027))))

(declare-fun lt!130325 () (_ BitVec 64))

(declare-fun lt!130326 () (_ BitVec 64))

(declare-fun lt!130329 () (_ BitVec 64))

(assert (=> d!25722 (= res!67587 (= lt!130325 (bvsub lt!130326 lt!130329)))))

(assert (=> d!25722 (or (= (bvand lt!130326 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!130329 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!130326 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!130326 lt!130329) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25722 (= lt!130329 (remainingBits!0 ((_ sign_extend 32) (size!1681 (buf!2071 b1!98))) ((_ sign_extend 32) (currentByte!4017 b1!98)) ((_ sign_extend 32) (currentBit!4012 b1!98))))))

(declare-fun lt!130324 () (_ BitVec 64))

(declare-fun lt!130328 () (_ BitVec 64))

(assert (=> d!25722 (= lt!130326 (bvmul lt!130324 lt!130328))))

(assert (=> d!25722 (or (= lt!130324 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!130328 (bvsdiv (bvmul lt!130324 lt!130328) lt!130324)))))

(assert (=> d!25722 (= lt!130328 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25722 (= lt!130324 ((_ sign_extend 32) (size!1681 (buf!2071 b1!98))))))

(assert (=> d!25722 (= lt!130325 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4017 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4012 b1!98))))))

(assert (=> d!25722 (invariant!0 (currentBit!4012 b1!98) (currentByte!4017 b1!98) (size!1681 (buf!2071 b1!98)))))

(assert (=> d!25722 (= (bitIndex!0 (size!1681 (buf!2071 b1!98)) (currentByte!4017 b1!98) (currentBit!4012 b1!98)) lt!130325)))

(declare-fun b!81972 () Bool)

(declare-fun res!67588 () Bool)

(assert (=> b!81972 (=> (not res!67588) (not e!54027))))

(assert (=> b!81972 (= res!67588 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!130325))))

(declare-fun b!81973 () Bool)

(declare-fun lt!130327 () (_ BitVec 64))

(assert (=> b!81973 (= e!54027 (bvsle lt!130325 (bvmul lt!130327 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!81973 (or (= lt!130327 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!130327 #b0000000000000000000000000000000000000000000000000000000000001000) lt!130327)))))

(assert (=> b!81973 (= lt!130327 ((_ sign_extend 32) (size!1681 (buf!2071 b1!98))))))

(assert (= (and d!25722 res!67587) b!81972))

(assert (= (and b!81972 res!67588) b!81973))

(assert (=> d!25722 m!128365))

(assert (=> d!25722 m!128387))

(assert (=> b!81947 d!25722))

(declare-fun d!25726 () Bool)

(assert (=> d!25726 (= (remainingBits!0 ((_ sign_extend 32) (size!1681 (buf!2071 b1!98))) ((_ sign_extend 32) (currentByte!4017 b1!98)) ((_ sign_extend 32) (currentBit!4012 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1681 (buf!2071 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4017 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4012 b1!98)))))))

(assert (=> b!81944 d!25726))

(declare-fun d!25728 () Bool)

(declare-fun lt!130359 () (_ BitVec 64))

(declare-fun lt!130355 () (_ BitVec 64))

(assert (=> d!25728 (= (remainingBits!0 ((_ sign_extend 32) (size!1681 (buf!2071 b1!98))) ((_ sign_extend 32) (currentByte!4017 b1!98)) ((_ sign_extend 32) (currentBit!4012 b1!98))) (bvsub lt!130359 lt!130355))))

(assert (=> d!25728 (or (= (bvand lt!130359 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!130355 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!130359 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!130359 lt!130355) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25728 (= lt!130355 (bitIndex!0 (size!1681 (buf!2071 b1!98)) (currentByte!4017 b1!98) (currentBit!4012 b1!98)))))

(declare-fun lt!130356 () (_ BitVec 64))

(declare-fun lt!130358 () (_ BitVec 64))

(assert (=> d!25728 (= lt!130359 (bvmul lt!130356 lt!130358))))

(assert (=> d!25728 (or (= lt!130356 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!130358 (bvsdiv (bvmul lt!130356 lt!130358) lt!130356)))))

(assert (=> d!25728 (= lt!130358 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25728 (= lt!130356 ((_ sign_extend 32) (size!1681 (buf!2071 b1!98))))))

(declare-fun lt!130357 () Unit!5471)

(declare-fun choose!23 (BitStream!2924) Unit!5471)

(assert (=> d!25728 (= lt!130357 (choose!23 b1!98))))

(assert (=> d!25728 (= (remainingBitsBitIndexLemma!0 b1!98) lt!130357)))

(declare-fun bs!6304 () Bool)

(assert (= bs!6304 d!25728))

(assert (=> bs!6304 m!128365))

(assert (=> bs!6304 m!128373))

(declare-fun m!128401 () Bool)

(assert (=> bs!6304 m!128401))

(assert (=> b!81944 d!25728))

(declare-fun d!25732 () Bool)

(assert (=> d!25732 (= (array_inv!1527 (buf!2071 b1!98)) (bvsge (size!1681 (buf!2071 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!81945 d!25732))

(declare-fun d!25734 () Bool)

(assert (=> d!25734 (= (array_inv!1527 (buf!2071 b2!98)) (bvsge (size!1681 (buf!2071 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!81946 d!25734))

(push 1)

(assert (not d!25712))

(assert (not d!25706))

(assert (not d!25728))

(assert (not d!25708))

(assert (not d!25710))

(assert (not d!25722))

(check-sat)

(pop 1)

(push 1)

(check-sat)

