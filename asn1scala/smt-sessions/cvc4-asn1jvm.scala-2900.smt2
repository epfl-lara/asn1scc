; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69470 () Bool)

(assert start!69470)

(declare-fun b!312296 () Bool)

(declare-fun res!255803 () Bool)

(declare-fun e!224593 () Bool)

(assert (=> b!312296 (=> (not res!255803) (not e!224593))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-datatypes ((array!19118 0))(
  ( (array!19119 (arr!9369 (Array (_ BitVec 32) (_ BitVec 8))) (size!8289 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13682 0))(
  ( (BitStream!13683 (buf!7902 array!19118) (currentByte!14606 (_ BitVec 32)) (currentBit!14601 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13682)

(declare-fun b2!97 () BitStream!13682)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!312296 (= res!255803 (bvsle (bitIndex!0 (size!8289 (buf!7902 b2!97)) (currentByte!14606 b2!97) (currentBit!14601 b2!97)) (bvadd (bitIndex!0 (size!8289 (buf!7902 b1!97)) (currentByte!14606 b1!97) (currentBit!14601 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!312297 () Bool)

(declare-fun res!255801 () Bool)

(assert (=> b!312297 (=> (not res!255801) (not e!224593))))

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!312297 (= res!255801 (validate_offset_bits!1 ((_ sign_extend 32) (size!8289 (buf!7902 b1!97))) ((_ sign_extend 32) (currentByte!14606 b1!97)) ((_ sign_extend 32) (currentBit!14601 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!312298 () Bool)

(declare-fun e!224591 () Bool)

(declare-fun e!224592 () Bool)

(assert (=> b!312298 (= e!224591 e!224592)))

(declare-fun res!255800 () Bool)

(assert (=> b!312298 (=> (not res!255800) (not e!224592))))

(declare-fun lt!441834 () (_ BitVec 64))

(declare-fun lt!441836 () (_ BitVec 64))

(declare-fun lt!441835 () (_ BitVec 64))

(assert (=> b!312298 (= res!255800 (and (bvsle lt!441836 (bvadd lt!441835 advancedAtMostBits!9)) (bvsge (bvsub lt!441834 lt!441836) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9))))))

(assert (=> b!312298 (= lt!441836 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14606 b2!97))) ((_ sign_extend 32) (currentBit!14601 b2!97))))))

(declare-fun b!312299 () Bool)

(assert (=> b!312299 (= e!224593 e!224591)))

(declare-fun res!255799 () Bool)

(assert (=> b!312299 (=> (not res!255799) (not e!224591))))

(assert (=> b!312299 (= res!255799 (bvsge (bvsub lt!441834 lt!441835) b1ValidateOffsetBits!10))))

(assert (=> b!312299 (= lt!441835 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14606 b1!97))) ((_ sign_extend 32) (currentBit!14601 b1!97))))))

(assert (=> b!312299 (= lt!441834 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8289 (buf!7902 b1!97)))))))

(declare-fun b!312300 () Bool)

(declare-fun e!224594 () Bool)

(declare-fun array_inv!7841 (array!19118) Bool)

(assert (=> b!312300 (= e!224594 (array_inv!7841 (buf!7902 b1!97)))))

(declare-fun res!255802 () Bool)

(assert (=> start!69470 (=> (not res!255802) (not e!224593))))

(assert (=> start!69470 (= res!255802 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8289 (buf!7902 b1!97)) (size!8289 (buf!7902 b2!97)))))))

(assert (=> start!69470 e!224593))

(assert (=> start!69470 true))

(declare-fun inv!12 (BitStream!13682) Bool)

(assert (=> start!69470 (and (inv!12 b1!97) e!224594)))

(declare-fun e!224595 () Bool)

(assert (=> start!69470 (and (inv!12 b2!97) e!224595)))

(declare-fun b!312301 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!312301 (= e!224592 (bvslt (remainingBits!0 ((_ sign_extend 32) (size!8289 (buf!7902 b2!97))) ((_ sign_extend 32) (currentByte!14606 b2!97)) ((_ sign_extend 32) (currentBit!14601 b2!97))) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9)))))

(declare-fun b!312302 () Bool)

(declare-fun res!255798 () Bool)

(assert (=> b!312302 (=> (not res!255798) (not e!224593))))

(assert (=> b!312302 (= res!255798 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8289 (buf!7902 b1!97))) ((_ sign_extend 32) (currentByte!14606 b1!97)) ((_ sign_extend 32) (currentBit!14601 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun b!312303 () Bool)

(assert (=> b!312303 (= e!224595 (array_inv!7841 (buf!7902 b2!97)))))

(assert (= (and start!69470 res!255802) b!312297))

(assert (= (and b!312297 res!255801) b!312296))

(assert (= (and b!312296 res!255803) b!312302))

(assert (= (and b!312302 res!255798) b!312299))

(assert (= (and b!312299 res!255799) b!312298))

(assert (= (and b!312298 res!255800) b!312301))

(assert (= start!69470 b!312300))

(assert (= start!69470 b!312303))

(declare-fun m!449981 () Bool)

(assert (=> b!312303 m!449981))

(declare-fun m!449983 () Bool)

(assert (=> b!312300 m!449983))

(declare-fun m!449985 () Bool)

(assert (=> b!312296 m!449985))

(declare-fun m!449987 () Bool)

(assert (=> b!312296 m!449987))

(declare-fun m!449989 () Bool)

(assert (=> b!312301 m!449989))

(declare-fun m!449991 () Bool)

(assert (=> start!69470 m!449991))

(declare-fun m!449993 () Bool)

(assert (=> start!69470 m!449993))

(declare-fun m!449995 () Bool)

(assert (=> b!312302 m!449995))

(declare-fun m!449997 () Bool)

(assert (=> b!312297 m!449997))

(push 1)

(assert (not b!312297))

(assert (not b!312296))

(assert (not b!312302))

(assert (not b!312303))

(assert (not b!312300))

(assert (not b!312301))

(assert (not start!69470))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!103708 () Bool)

(assert (=> d!103708 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8289 (buf!7902 b1!97))) ((_ sign_extend 32) (currentByte!14606 b1!97)) ((_ sign_extend 32) (currentBit!14601 b1!97)) b1ValidateOffsetBits!10) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8289 (buf!7902 b1!97))) ((_ sign_extend 32) (currentByte!14606 b1!97)) ((_ sign_extend 32) (currentBit!14601 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun bs!26834 () Bool)

(assert (= bs!26834 d!103708))

(assert (=> bs!26834 m!449995))

(assert (=> b!312297 d!103708))

(declare-fun d!103710 () Bool)

(assert (=> d!103710 (= (remainingBits!0 ((_ sign_extend 32) (size!8289 (buf!7902 b1!97))) ((_ sign_extend 32) (currentByte!14606 b1!97)) ((_ sign_extend 32) (currentBit!14601 b1!97))) (bvsub (bvmul ((_ sign_extend 32) (size!8289 (buf!7902 b1!97))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14606 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14601 b1!97)))))))

(assert (=> b!312302 d!103710))

(declare-fun d!103712 () Bool)

(assert (=> d!103712 (= (remainingBits!0 ((_ sign_extend 32) (size!8289 (buf!7902 b2!97))) ((_ sign_extend 32) (currentByte!14606 b2!97)) ((_ sign_extend 32) (currentBit!14601 b2!97))) (bvsub (bvmul ((_ sign_extend 32) (size!8289 (buf!7902 b2!97))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14606 b2!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14601 b2!97)))))))

(assert (=> b!312301 d!103712))

(declare-fun d!103714 () Bool)

(declare-fun e!224607 () Bool)

(assert (=> d!103714 e!224607))

(declare-fun res!255825 () Bool)

(assert (=> d!103714 (=> (not res!255825) (not e!224607))))

(declare-fun lt!441897 () (_ BitVec 64))

(declare-fun lt!441899 () (_ BitVec 64))

(declare-fun lt!441902 () (_ BitVec 64))

(assert (=> d!103714 (= res!255825 (= lt!441902 (bvsub lt!441897 lt!441899)))))

(assert (=> d!103714 (or (= (bvand lt!441897 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441899 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441897 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441897 lt!441899) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103714 (= lt!441899 (remainingBits!0 ((_ sign_extend 32) (size!8289 (buf!7902 b2!97))) ((_ sign_extend 32) (currentByte!14606 b2!97)) ((_ sign_extend 32) (currentBit!14601 b2!97))))))

(declare-fun lt!441900 () (_ BitVec 64))

(declare-fun lt!441901 () (_ BitVec 64))

(assert (=> d!103714 (= lt!441897 (bvmul lt!441900 lt!441901))))

(assert (=> d!103714 (or (= lt!441900 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441901 (bvsdiv (bvmul lt!441900 lt!441901) lt!441900)))))

(assert (=> d!103714 (= lt!441901 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103714 (= lt!441900 ((_ sign_extend 32) (size!8289 (buf!7902 b2!97))))))

(assert (=> d!103714 (= lt!441902 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14606 b2!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14601 b2!97))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!103714 (invariant!0 (currentBit!14601 b2!97) (currentByte!14606 b2!97) (size!8289 (buf!7902 b2!97)))))

(assert (=> d!103714 (= (bitIndex!0 (size!8289 (buf!7902 b2!97)) (currentByte!14606 b2!97) (currentBit!14601 b2!97)) lt!441902)))

(declare-fun b!312324 () Bool)

(declare-fun res!255824 () Bool)

(assert (=> b!312324 (=> (not res!255824) (not e!224607))))

(assert (=> b!312324 (= res!255824 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441902))))

(declare-fun b!312325 () Bool)

(declare-fun lt!441898 () (_ BitVec 64))

(assert (=> b!312325 (= e!224607 (bvsle lt!441902 (bvmul lt!441898 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!312325 (or (= lt!441898 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441898 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441898)))))

(assert (=> b!312325 (= lt!441898 ((_ sign_extend 32) (size!8289 (buf!7902 b2!97))))))

(assert (= (and d!103714 res!255825) b!312324))

(assert (= (and b!312324 res!255824) b!312325))

(assert (=> d!103714 m!449989))

(declare-fun m!450007 () Bool)

(assert (=> d!103714 m!450007))

(assert (=> b!312296 d!103714))

(declare-fun d!103718 () Bool)

(declare-fun e!224608 () Bool)

(assert (=> d!103718 e!224608))

(declare-fun res!255827 () Bool)

(assert (=> d!103718 (=> (not res!255827) (not e!224608))))

(declare-fun lt!441903 () (_ BitVec 64))

(declare-fun lt!441908 () (_ BitVec 64))

(declare-fun lt!441905 () (_ BitVec 64))

(assert (=> d!103718 (= res!255827 (= lt!441908 (bvsub lt!441903 lt!441905)))))

(assert (=> d!103718 (or (= (bvand lt!441903 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441905 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441903 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441903 lt!441905) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103718 (= lt!441905 (remainingBits!0 ((_ sign_extend 32) (size!8289 (buf!7902 b1!97))) ((_ sign_extend 32) (currentByte!14606 b1!97)) ((_ sign_extend 32) (currentBit!14601 b1!97))))))

(declare-fun lt!441906 () (_ BitVec 64))

(declare-fun lt!441907 () (_ BitVec 64))

(assert (=> d!103718 (= lt!441903 (bvmul lt!441906 lt!441907))))

(assert (=> d!103718 (or (= lt!441906 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441907 (bvsdiv (bvmul lt!441906 lt!441907) lt!441906)))))

(assert (=> d!103718 (= lt!441907 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103718 (= lt!441906 ((_ sign_extend 32) (size!8289 (buf!7902 b1!97))))))

(assert (=> d!103718 (= lt!441908 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14606 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14601 b1!97))))))

(assert (=> d!103718 (invariant!0 (currentBit!14601 b1!97) (currentByte!14606 b1!97) (size!8289 (buf!7902 b1!97)))))

(assert (=> d!103718 (= (bitIndex!0 (size!8289 (buf!7902 b1!97)) (currentByte!14606 b1!97) (currentBit!14601 b1!97)) lt!441908)))

(declare-fun b!312326 () Bool)

(declare-fun res!255826 () Bool)

(assert (=> b!312326 (=> (not res!255826) (not e!224608))))

(assert (=> b!312326 (= res!255826 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441908))))

(declare-fun b!312327 () Bool)

(declare-fun lt!441904 () (_ BitVec 64))

(assert (=> b!312327 (= e!224608 (bvsle lt!441908 (bvmul lt!441904 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!312327 (or (= lt!441904 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441904 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441904)))))

(assert (=> b!312327 (= lt!441904 ((_ sign_extend 32) (size!8289 (buf!7902 b1!97))))))

(assert (= (and d!103718 res!255827) b!312326))

(assert (= (and b!312326 res!255826) b!312327))

(assert (=> d!103718 m!449995))

(declare-fun m!450009 () Bool)

(assert (=> d!103718 m!450009))

(assert (=> b!312296 d!103718))

(declare-fun d!103720 () Bool)

(assert (=> d!103720 (= (inv!12 b1!97) (invariant!0 (currentBit!14601 b1!97) (currentByte!14606 b1!97) (size!8289 (buf!7902 b1!97))))))

(declare-fun bs!26835 () Bool)

(assert (= bs!26835 d!103720))

(assert (=> bs!26835 m!450009))

(assert (=> start!69470 d!103720))

(declare-fun d!103722 () Bool)

(assert (=> d!103722 (= (inv!12 b2!97) (invariant!0 (currentBit!14601 b2!97) (currentByte!14606 b2!97) (size!8289 (buf!7902 b2!97))))))

(declare-fun bs!26836 () Bool)

(assert (= bs!26836 d!103722))

(assert (=> bs!26836 m!450007))

(assert (=> start!69470 d!103722))

(declare-fun d!103724 () Bool)

(assert (=> d!103724 (= (array_inv!7841 (buf!7902 b1!97)) (bvsge (size!8289 (buf!7902 b1!97)) #b00000000000000000000000000000000))))

(assert (=> b!312300 d!103724))

(declare-fun d!103726 () Bool)

(assert (=> d!103726 (= (array_inv!7841 (buf!7902 b2!97)) (bvsge (size!8289 (buf!7902 b2!97)) #b00000000000000000000000000000000))))

(assert (=> b!312303 d!103726))

(push 1)

(assert (not d!103714))

(assert (not d!103718))

(assert (not d!103708))

(assert (not d!103720))

(assert (not d!103722))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

