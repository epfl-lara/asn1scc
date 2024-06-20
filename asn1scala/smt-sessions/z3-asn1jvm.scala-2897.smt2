; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69390 () Bool)

(assert start!69390)

(declare-fun b!312052 () Bool)

(declare-fun res!255615 () Bool)

(declare-fun e!224401 () Bool)

(assert (=> b!312052 (=> (not res!255615) (not e!224401))))

(declare-datatypes ((array!19092 0))(
  ( (array!19093 (arr!9359 (Array (_ BitVec 32) (_ BitVec 8))) (size!8279 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13662 0))(
  ( (BitStream!13663 (buf!7892 array!19092) (currentByte!14578 (_ BitVec 32)) (currentBit!14573 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13662)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!312052 (= res!255615 (validate_offset_bits!1 ((_ sign_extend 32) (size!8279 (buf!7892 b1!97))) ((_ sign_extend 32) (currentByte!14578 b1!97)) ((_ sign_extend 32) (currentBit!14573 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!312053 () Bool)

(assert (=> b!312053 (= e!224401 (bvslt (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8279 (buf!7892 b1!97)))) (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14578 b1!97))) ((_ sign_extend 32) (currentBit!14573 b1!97)))) b1ValidateOffsetBits!10))))

(declare-fun b!312054 () Bool)

(declare-fun e!224403 () Bool)

(declare-fun array_inv!7831 (array!19092) Bool)

(assert (=> b!312054 (= e!224403 (array_inv!7831 (buf!7892 b1!97)))))

(declare-fun res!255616 () Bool)

(assert (=> start!69390 (=> (not res!255616) (not e!224401))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun b2!97 () BitStream!13662)

(assert (=> start!69390 (= res!255616 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8279 (buf!7892 b1!97)) (size!8279 (buf!7892 b2!97)))))))

(assert (=> start!69390 e!224401))

(assert (=> start!69390 true))

(declare-fun inv!12 (BitStream!13662) Bool)

(assert (=> start!69390 (and (inv!12 b1!97) e!224403)))

(declare-fun e!224402 () Bool)

(assert (=> start!69390 (and (inv!12 b2!97) e!224402)))

(declare-fun b!312055 () Bool)

(declare-fun res!255617 () Bool)

(assert (=> b!312055 (=> (not res!255617) (not e!224401))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!312055 (= res!255617 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8279 (buf!7892 b1!97))) ((_ sign_extend 32) (currentByte!14578 b1!97)) ((_ sign_extend 32) (currentBit!14573 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun b!312056 () Bool)

(assert (=> b!312056 (= e!224402 (array_inv!7831 (buf!7892 b2!97)))))

(declare-fun b!312057 () Bool)

(declare-fun res!255614 () Bool)

(assert (=> b!312057 (=> (not res!255614) (not e!224401))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!312057 (= res!255614 (bvsle (bitIndex!0 (size!8279 (buf!7892 b2!97)) (currentByte!14578 b2!97) (currentBit!14573 b2!97)) (bvadd (bitIndex!0 (size!8279 (buf!7892 b1!97)) (currentByte!14578 b1!97) (currentBit!14573 b1!97)) advancedAtMostBits!9)))))

(assert (= (and start!69390 res!255616) b!312052))

(assert (= (and b!312052 res!255615) b!312057))

(assert (= (and b!312057 res!255614) b!312055))

(assert (= (and b!312055 res!255617) b!312053))

(assert (= start!69390 b!312054))

(assert (= start!69390 b!312056))

(declare-fun m!449781 () Bool)

(assert (=> b!312055 m!449781))

(declare-fun m!449783 () Bool)

(assert (=> start!69390 m!449783))

(declare-fun m!449785 () Bool)

(assert (=> start!69390 m!449785))

(declare-fun m!449787 () Bool)

(assert (=> b!312056 m!449787))

(declare-fun m!449789 () Bool)

(assert (=> b!312054 m!449789))

(declare-fun m!449791 () Bool)

(assert (=> b!312052 m!449791))

(declare-fun m!449793 () Bool)

(assert (=> b!312057 m!449793))

(declare-fun m!449795 () Bool)

(assert (=> b!312057 m!449795))

(check-sat (not b!312055) (not b!312052) (not start!69390) (not b!312057) (not b!312056) (not b!312054))
(check-sat)
(get-model)

(declare-fun d!103572 () Bool)

(assert (=> d!103572 (= (array_inv!7831 (buf!7892 b1!97)) (bvsge (size!8279 (buf!7892 b1!97)) #b00000000000000000000000000000000))))

(assert (=> b!312054 d!103572))

(declare-fun d!103574 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!103574 (= (inv!12 b1!97) (invariant!0 (currentBit!14573 b1!97) (currentByte!14578 b1!97) (size!8279 (buf!7892 b1!97))))))

(declare-fun bs!26801 () Bool)

(assert (= bs!26801 d!103574))

(declare-fun m!449813 () Bool)

(assert (=> bs!26801 m!449813))

(assert (=> start!69390 d!103574))

(declare-fun d!103576 () Bool)

(assert (=> d!103576 (= (inv!12 b2!97) (invariant!0 (currentBit!14573 b2!97) (currentByte!14578 b2!97) (size!8279 (buf!7892 b2!97))))))

(declare-fun bs!26802 () Bool)

(assert (= bs!26802 d!103576))

(declare-fun m!449815 () Bool)

(assert (=> bs!26802 m!449815))

(assert (=> start!69390 d!103576))

(declare-fun d!103578 () Bool)

(assert (=> d!103578 (= (remainingBits!0 ((_ sign_extend 32) (size!8279 (buf!7892 b1!97))) ((_ sign_extend 32) (currentByte!14578 b1!97)) ((_ sign_extend 32) (currentBit!14573 b1!97))) (bvsub (bvmul ((_ sign_extend 32) (size!8279 (buf!7892 b1!97))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14578 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14573 b1!97)))))))

(assert (=> b!312055 d!103578))

(declare-fun d!103582 () Bool)

(assert (=> d!103582 (= (array_inv!7831 (buf!7892 b2!97)) (bvsge (size!8279 (buf!7892 b2!97)) #b00000000000000000000000000000000))))

(assert (=> b!312056 d!103582))

(declare-fun d!103584 () Bool)

(declare-fun e!224426 () Bool)

(assert (=> d!103584 e!224426))

(declare-fun res!255642 () Bool)

(assert (=> d!103584 (=> (not res!255642) (not e!224426))))

(declare-fun lt!441679 () (_ BitVec 64))

(declare-fun lt!441676 () (_ BitVec 64))

(declare-fun lt!441677 () (_ BitVec 64))

(assert (=> d!103584 (= res!255642 (= lt!441679 (bvsub lt!441676 lt!441677)))))

(assert (=> d!103584 (or (= (bvand lt!441676 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441677 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441676 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441676 lt!441677) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103584 (= lt!441677 (remainingBits!0 ((_ sign_extend 32) (size!8279 (buf!7892 b2!97))) ((_ sign_extend 32) (currentByte!14578 b2!97)) ((_ sign_extend 32) (currentBit!14573 b2!97))))))

(declare-fun lt!441675 () (_ BitVec 64))

(declare-fun lt!441680 () (_ BitVec 64))

(assert (=> d!103584 (= lt!441676 (bvmul lt!441675 lt!441680))))

(assert (=> d!103584 (or (= lt!441675 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441680 (bvsdiv (bvmul lt!441675 lt!441680) lt!441675)))))

(assert (=> d!103584 (= lt!441680 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103584 (= lt!441675 ((_ sign_extend 32) (size!8279 (buf!7892 b2!97))))))

(assert (=> d!103584 (= lt!441679 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14578 b2!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14573 b2!97))))))

(assert (=> d!103584 (invariant!0 (currentBit!14573 b2!97) (currentByte!14578 b2!97) (size!8279 (buf!7892 b2!97)))))

(assert (=> d!103584 (= (bitIndex!0 (size!8279 (buf!7892 b2!97)) (currentByte!14578 b2!97) (currentBit!14573 b2!97)) lt!441679)))

(declare-fun b!312088 () Bool)

(declare-fun res!255643 () Bool)

(assert (=> b!312088 (=> (not res!255643) (not e!224426))))

(assert (=> b!312088 (= res!255643 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441679))))

(declare-fun b!312089 () Bool)

(declare-fun lt!441678 () (_ BitVec 64))

(assert (=> b!312089 (= e!224426 (bvsle lt!441679 (bvmul lt!441678 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!312089 (or (= lt!441678 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441678 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441678)))))

(assert (=> b!312089 (= lt!441678 ((_ sign_extend 32) (size!8279 (buf!7892 b2!97))))))

(assert (= (and d!103584 res!255642) b!312088))

(assert (= (and b!312088 res!255643) b!312089))

(declare-fun m!449823 () Bool)

(assert (=> d!103584 m!449823))

(assert (=> d!103584 m!449815))

(assert (=> b!312057 d!103584))

(declare-fun d!103590 () Bool)

(declare-fun e!224427 () Bool)

(assert (=> d!103590 e!224427))

(declare-fun res!255644 () Bool)

(assert (=> d!103590 (=> (not res!255644) (not e!224427))))

(declare-fun lt!441682 () (_ BitVec 64))

(declare-fun lt!441685 () (_ BitVec 64))

(declare-fun lt!441683 () (_ BitVec 64))

(assert (=> d!103590 (= res!255644 (= lt!441685 (bvsub lt!441682 lt!441683)))))

(assert (=> d!103590 (or (= (bvand lt!441682 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441683 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441682 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441682 lt!441683) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103590 (= lt!441683 (remainingBits!0 ((_ sign_extend 32) (size!8279 (buf!7892 b1!97))) ((_ sign_extend 32) (currentByte!14578 b1!97)) ((_ sign_extend 32) (currentBit!14573 b1!97))))))

(declare-fun lt!441681 () (_ BitVec 64))

(declare-fun lt!441686 () (_ BitVec 64))

(assert (=> d!103590 (= lt!441682 (bvmul lt!441681 lt!441686))))

(assert (=> d!103590 (or (= lt!441681 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441686 (bvsdiv (bvmul lt!441681 lt!441686) lt!441681)))))

(assert (=> d!103590 (= lt!441686 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103590 (= lt!441681 ((_ sign_extend 32) (size!8279 (buf!7892 b1!97))))))

(assert (=> d!103590 (= lt!441685 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14578 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14573 b1!97))))))

(assert (=> d!103590 (invariant!0 (currentBit!14573 b1!97) (currentByte!14578 b1!97) (size!8279 (buf!7892 b1!97)))))

(assert (=> d!103590 (= (bitIndex!0 (size!8279 (buf!7892 b1!97)) (currentByte!14578 b1!97) (currentBit!14573 b1!97)) lt!441685)))

(declare-fun b!312090 () Bool)

(declare-fun res!255645 () Bool)

(assert (=> b!312090 (=> (not res!255645) (not e!224427))))

(assert (=> b!312090 (= res!255645 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441685))))

(declare-fun b!312091 () Bool)

(declare-fun lt!441684 () (_ BitVec 64))

(assert (=> b!312091 (= e!224427 (bvsle lt!441685 (bvmul lt!441684 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!312091 (or (= lt!441684 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441684 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441684)))))

(assert (=> b!312091 (= lt!441684 ((_ sign_extend 32) (size!8279 (buf!7892 b1!97))))))

(assert (= (and d!103590 res!255644) b!312090))

(assert (= (and b!312090 res!255645) b!312091))

(assert (=> d!103590 m!449781))

(assert (=> d!103590 m!449813))

(assert (=> b!312057 d!103590))

(declare-fun d!103596 () Bool)

(assert (=> d!103596 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8279 (buf!7892 b1!97))) ((_ sign_extend 32) (currentByte!14578 b1!97)) ((_ sign_extend 32) (currentBit!14573 b1!97)) b1ValidateOffsetBits!10) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8279 (buf!7892 b1!97))) ((_ sign_extend 32) (currentByte!14578 b1!97)) ((_ sign_extend 32) (currentBit!14573 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun bs!26805 () Bool)

(assert (= bs!26805 d!103596))

(assert (=> bs!26805 m!449781))

(assert (=> b!312052 d!103596))

(check-sat (not d!103596) (not d!103574) (not d!103576) (not d!103584) (not d!103590))
(check-sat)
