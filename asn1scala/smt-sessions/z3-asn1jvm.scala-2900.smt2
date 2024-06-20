; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69468 () Bool)

(assert start!69468)

(declare-fun b!312272 () Bool)

(declare-fun res!255782 () Bool)

(declare-fun e!224571 () Bool)

(assert (=> b!312272 (=> (not res!255782) (not e!224571))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-datatypes ((array!19116 0))(
  ( (array!19117 (arr!9368 (Array (_ BitVec 32) (_ BitVec 8))) (size!8288 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13680 0))(
  ( (BitStream!13681 (buf!7901 array!19116) (currentByte!14605 (_ BitVec 32)) (currentBit!14600 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13680)

(declare-fun b2!97 () BitStream!13680)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!312272 (= res!255782 (bvsle (bitIndex!0 (size!8288 (buf!7901 b2!97)) (currentByte!14605 b2!97) (currentBit!14600 b2!97)) (bvadd (bitIndex!0 (size!8288 (buf!7901 b1!97)) (currentByte!14605 b1!97) (currentBit!14600 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!312273 () Bool)

(declare-fun e!224575 () Bool)

(declare-fun e!224574 () Bool)

(assert (=> b!312273 (= e!224575 e!224574)))

(declare-fun res!255784 () Bool)

(assert (=> b!312273 (=> (not res!255784) (not e!224574))))

(declare-fun lt!441825 () (_ BitVec 64))

(declare-fun lt!441826 () (_ BitVec 64))

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun lt!441827 () (_ BitVec 64))

(assert (=> b!312273 (= res!255784 (and (bvsle lt!441826 (bvadd lt!441827 advancedAtMostBits!9)) (bvsge (bvsub lt!441825 lt!441826) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9))))))

(assert (=> b!312273 (= lt!441826 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14605 b2!97))) ((_ sign_extend 32) (currentBit!14600 b2!97))))))

(declare-fun b!312274 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!312274 (= e!224574 (bvslt (remainingBits!0 ((_ sign_extend 32) (size!8288 (buf!7901 b2!97))) ((_ sign_extend 32) (currentByte!14605 b2!97)) ((_ sign_extend 32) (currentBit!14600 b2!97))) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9)))))

(declare-fun b!312275 () Bool)

(declare-fun e!224569 () Bool)

(declare-fun array_inv!7840 (array!19116) Bool)

(assert (=> b!312275 (= e!224569 (array_inv!7840 (buf!7901 b1!97)))))

(declare-fun b!312276 () Bool)

(declare-fun res!255783 () Bool)

(assert (=> b!312276 (=> (not res!255783) (not e!224571))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!312276 (= res!255783 (validate_offset_bits!1 ((_ sign_extend 32) (size!8288 (buf!7901 b1!97))) ((_ sign_extend 32) (currentByte!14605 b1!97)) ((_ sign_extend 32) (currentBit!14600 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun res!255785 () Bool)

(assert (=> start!69468 (=> (not res!255785) (not e!224571))))

(assert (=> start!69468 (= res!255785 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8288 (buf!7901 b1!97)) (size!8288 (buf!7901 b2!97)))))))

(assert (=> start!69468 e!224571))

(assert (=> start!69468 true))

(declare-fun inv!12 (BitStream!13680) Bool)

(assert (=> start!69468 (and (inv!12 b1!97) e!224569)))

(declare-fun e!224572 () Bool)

(assert (=> start!69468 (and (inv!12 b2!97) e!224572)))

(declare-fun b!312277 () Bool)

(assert (=> b!312277 (= e!224571 e!224575)))

(declare-fun res!255780 () Bool)

(assert (=> b!312277 (=> (not res!255780) (not e!224575))))

(assert (=> b!312277 (= res!255780 (bvsge (bvsub lt!441825 lt!441827) b1ValidateOffsetBits!10))))

(assert (=> b!312277 (= lt!441827 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14605 b1!97))) ((_ sign_extend 32) (currentBit!14600 b1!97))))))

(assert (=> b!312277 (= lt!441825 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8288 (buf!7901 b1!97)))))))

(declare-fun b!312278 () Bool)

(assert (=> b!312278 (= e!224572 (array_inv!7840 (buf!7901 b2!97)))))

(declare-fun b!312279 () Bool)

(declare-fun res!255781 () Bool)

(assert (=> b!312279 (=> (not res!255781) (not e!224571))))

(assert (=> b!312279 (= res!255781 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8288 (buf!7901 b1!97))) ((_ sign_extend 32) (currentByte!14605 b1!97)) ((_ sign_extend 32) (currentBit!14600 b1!97))) b1ValidateOffsetBits!10))))

(assert (= (and start!69468 res!255785) b!312276))

(assert (= (and b!312276 res!255783) b!312272))

(assert (= (and b!312272 res!255782) b!312279))

(assert (= (and b!312279 res!255781) b!312277))

(assert (= (and b!312277 res!255780) b!312273))

(assert (= (and b!312273 res!255784) b!312274))

(assert (= start!69468 b!312275))

(assert (= start!69468 b!312278))

(declare-fun m!449963 () Bool)

(assert (=> b!312278 m!449963))

(declare-fun m!449965 () Bool)

(assert (=> b!312272 m!449965))

(declare-fun m!449967 () Bool)

(assert (=> b!312272 m!449967))

(declare-fun m!449969 () Bool)

(assert (=> start!69468 m!449969))

(declare-fun m!449971 () Bool)

(assert (=> start!69468 m!449971))

(declare-fun m!449973 () Bool)

(assert (=> b!312275 m!449973))

(declare-fun m!449975 () Bool)

(assert (=> b!312276 m!449975))

(declare-fun m!449977 () Bool)

(assert (=> b!312279 m!449977))

(declare-fun m!449979 () Bool)

(assert (=> b!312274 m!449979))

(check-sat (not b!312276) (not b!312278) (not b!312272) (not b!312275) (not start!69468) (not b!312274) (not b!312279))
(check-sat)
(get-model)

(declare-fun d!103674 () Bool)

(assert (=> d!103674 (= (remainingBits!0 ((_ sign_extend 32) (size!8288 (buf!7901 b1!97))) ((_ sign_extend 32) (currentByte!14605 b1!97)) ((_ sign_extend 32) (currentBit!14600 b1!97))) (bvsub (bvmul ((_ sign_extend 32) (size!8288 (buf!7901 b1!97))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14605 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14600 b1!97)))))))

(assert (=> b!312279 d!103674))

(declare-fun d!103676 () Bool)

(assert (=> d!103676 (= (remainingBits!0 ((_ sign_extend 32) (size!8288 (buf!7901 b2!97))) ((_ sign_extend 32) (currentByte!14605 b2!97)) ((_ sign_extend 32) (currentBit!14600 b2!97))) (bvsub (bvmul ((_ sign_extend 32) (size!8288 (buf!7901 b2!97))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14605 b2!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14600 b2!97)))))))

(assert (=> b!312274 d!103676))

(declare-fun d!103678 () Bool)

(assert (=> d!103678 (= (array_inv!7840 (buf!7901 b2!97)) (bvsge (size!8288 (buf!7901 b2!97)) #b00000000000000000000000000000000))))

(assert (=> b!312278 d!103678))

(declare-fun d!103680 () Bool)

(declare-fun e!224599 () Bool)

(assert (=> d!103680 e!224599))

(declare-fun res!255809 () Bool)

(assert (=> d!103680 (=> (not res!255809) (not e!224599))))

(declare-fun lt!441854 () (_ BitVec 64))

(declare-fun lt!441852 () (_ BitVec 64))

(declare-fun lt!441849 () (_ BitVec 64))

(assert (=> d!103680 (= res!255809 (= lt!441854 (bvsub lt!441849 lt!441852)))))

(assert (=> d!103680 (or (= (bvand lt!441849 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441852 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441849 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441849 lt!441852) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103680 (= lt!441852 (remainingBits!0 ((_ sign_extend 32) (size!8288 (buf!7901 b2!97))) ((_ sign_extend 32) (currentByte!14605 b2!97)) ((_ sign_extend 32) (currentBit!14600 b2!97))))))

(declare-fun lt!441853 () (_ BitVec 64))

(declare-fun lt!441851 () (_ BitVec 64))

(assert (=> d!103680 (= lt!441849 (bvmul lt!441853 lt!441851))))

(assert (=> d!103680 (or (= lt!441853 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441851 (bvsdiv (bvmul lt!441853 lt!441851) lt!441853)))))

(assert (=> d!103680 (= lt!441851 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103680 (= lt!441853 ((_ sign_extend 32) (size!8288 (buf!7901 b2!97))))))

(assert (=> d!103680 (= lt!441854 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14605 b2!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14600 b2!97))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!103680 (invariant!0 (currentBit!14600 b2!97) (currentByte!14605 b2!97) (size!8288 (buf!7901 b2!97)))))

(assert (=> d!103680 (= (bitIndex!0 (size!8288 (buf!7901 b2!97)) (currentByte!14605 b2!97) (currentBit!14600 b2!97)) lt!441854)))

(declare-fun b!312308 () Bool)

(declare-fun res!255808 () Bool)

(assert (=> b!312308 (=> (not res!255808) (not e!224599))))

(assert (=> b!312308 (= res!255808 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441854))))

(declare-fun b!312309 () Bool)

(declare-fun lt!441850 () (_ BitVec 64))

(assert (=> b!312309 (= e!224599 (bvsle lt!441854 (bvmul lt!441850 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!312309 (or (= lt!441850 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441850 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441850)))))

(assert (=> b!312309 (= lt!441850 ((_ sign_extend 32) (size!8288 (buf!7901 b2!97))))))

(assert (= (and d!103680 res!255809) b!312308))

(assert (= (and b!312308 res!255808) b!312309))

(assert (=> d!103680 m!449979))

(declare-fun m!449999 () Bool)

(assert (=> d!103680 m!449999))

(assert (=> b!312272 d!103680))

(declare-fun d!103682 () Bool)

(declare-fun e!224600 () Bool)

(assert (=> d!103682 e!224600))

(declare-fun res!255811 () Bool)

(assert (=> d!103682 (=> (not res!255811) (not e!224600))))

(declare-fun lt!441860 () (_ BitVec 64))

(declare-fun lt!441855 () (_ BitVec 64))

(declare-fun lt!441858 () (_ BitVec 64))

(assert (=> d!103682 (= res!255811 (= lt!441860 (bvsub lt!441855 lt!441858)))))

(assert (=> d!103682 (or (= (bvand lt!441855 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441858 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441855 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441855 lt!441858) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103682 (= lt!441858 (remainingBits!0 ((_ sign_extend 32) (size!8288 (buf!7901 b1!97))) ((_ sign_extend 32) (currentByte!14605 b1!97)) ((_ sign_extend 32) (currentBit!14600 b1!97))))))

(declare-fun lt!441859 () (_ BitVec 64))

(declare-fun lt!441857 () (_ BitVec 64))

(assert (=> d!103682 (= lt!441855 (bvmul lt!441859 lt!441857))))

(assert (=> d!103682 (or (= lt!441859 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441857 (bvsdiv (bvmul lt!441859 lt!441857) lt!441859)))))

(assert (=> d!103682 (= lt!441857 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103682 (= lt!441859 ((_ sign_extend 32) (size!8288 (buf!7901 b1!97))))))

(assert (=> d!103682 (= lt!441860 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14605 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14600 b1!97))))))

(assert (=> d!103682 (invariant!0 (currentBit!14600 b1!97) (currentByte!14605 b1!97) (size!8288 (buf!7901 b1!97)))))

(assert (=> d!103682 (= (bitIndex!0 (size!8288 (buf!7901 b1!97)) (currentByte!14605 b1!97) (currentBit!14600 b1!97)) lt!441860)))

(declare-fun b!312310 () Bool)

(declare-fun res!255810 () Bool)

(assert (=> b!312310 (=> (not res!255810) (not e!224600))))

(assert (=> b!312310 (= res!255810 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441860))))

(declare-fun b!312311 () Bool)

(declare-fun lt!441856 () (_ BitVec 64))

(assert (=> b!312311 (= e!224600 (bvsle lt!441860 (bvmul lt!441856 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!312311 (or (= lt!441856 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441856 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441856)))))

(assert (=> b!312311 (= lt!441856 ((_ sign_extend 32) (size!8288 (buf!7901 b1!97))))))

(assert (= (and d!103682 res!255811) b!312310))

(assert (= (and b!312310 res!255810) b!312311))

(assert (=> d!103682 m!449977))

(declare-fun m!450001 () Bool)

(assert (=> d!103682 m!450001))

(assert (=> b!312272 d!103682))

(declare-fun d!103684 () Bool)

(assert (=> d!103684 (= (inv!12 b1!97) (invariant!0 (currentBit!14600 b1!97) (currentByte!14605 b1!97) (size!8288 (buf!7901 b1!97))))))

(declare-fun bs!26828 () Bool)

(assert (= bs!26828 d!103684))

(assert (=> bs!26828 m!450001))

(assert (=> start!69468 d!103684))

(declare-fun d!103686 () Bool)

(assert (=> d!103686 (= (inv!12 b2!97) (invariant!0 (currentBit!14600 b2!97) (currentByte!14605 b2!97) (size!8288 (buf!7901 b2!97))))))

(declare-fun bs!26829 () Bool)

(assert (= bs!26829 d!103686))

(assert (=> bs!26829 m!449999))

(assert (=> start!69468 d!103686))

(declare-fun d!103688 () Bool)

(assert (=> d!103688 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8288 (buf!7901 b1!97))) ((_ sign_extend 32) (currentByte!14605 b1!97)) ((_ sign_extend 32) (currentBit!14600 b1!97)) b1ValidateOffsetBits!10) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8288 (buf!7901 b1!97))) ((_ sign_extend 32) (currentByte!14605 b1!97)) ((_ sign_extend 32) (currentBit!14600 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun bs!26830 () Bool)

(assert (= bs!26830 d!103688))

(assert (=> bs!26830 m!449977))

(assert (=> b!312276 d!103688))

(declare-fun d!103690 () Bool)

(assert (=> d!103690 (= (array_inv!7840 (buf!7901 b1!97)) (bvsge (size!8288 (buf!7901 b1!97)) #b00000000000000000000000000000000))))

(assert (=> b!312275 d!103690))

(check-sat (not d!103686) (not d!103682) (not d!103680) (not d!103688) (not d!103684))
(check-sat)
