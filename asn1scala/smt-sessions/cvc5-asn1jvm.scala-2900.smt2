; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69466 () Bool)

(assert start!69466)

(declare-fun b!312248 () Bool)

(declare-fun e!224550 () Bool)

(declare-fun e!224553 () Bool)

(assert (=> b!312248 (= e!224550 e!224553)))

(declare-fun res!255766 () Bool)

(assert (=> b!312248 (=> (not res!255766) (not e!224553))))

(declare-fun lt!441818 () (_ BitVec 64))

(declare-fun lt!441817 () (_ BitVec 64))

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(assert (=> b!312248 (= res!255766 (bvsge (bvsub lt!441817 lt!441818) b1ValidateOffsetBits!10))))

(declare-datatypes ((array!19114 0))(
  ( (array!19115 (arr!9367 (Array (_ BitVec 32) (_ BitVec 8))) (size!8287 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13678 0))(
  ( (BitStream!13679 (buf!7900 array!19114) (currentByte!14604 (_ BitVec 32)) (currentBit!14599 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13678)

(assert (=> b!312248 (= lt!441818 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14604 b1!97))) ((_ sign_extend 32) (currentBit!14599 b1!97))))))

(assert (=> b!312248 (= lt!441817 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8287 (buf!7900 b1!97)))))))

(declare-fun b!312249 () Bool)

(declare-fun e!224551 () Bool)

(assert (=> b!312249 (= e!224553 e!224551)))

(declare-fun res!255762 () Bool)

(assert (=> b!312249 (=> (not res!255762) (not e!224551))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun lt!441816 () (_ BitVec 64))

(assert (=> b!312249 (= res!255762 (and (bvsle lt!441816 (bvadd lt!441818 advancedAtMostBits!9)) (bvsge (bvsub lt!441817 lt!441816) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9))))))

(declare-fun b2!97 () BitStream!13678)

(assert (=> b!312249 (= lt!441816 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14604 b2!97))) ((_ sign_extend 32) (currentBit!14599 b2!97))))))

(declare-fun b!312250 () Bool)

(declare-fun e!224554 () Bool)

(declare-fun array_inv!7839 (array!19114) Bool)

(assert (=> b!312250 (= e!224554 (array_inv!7839 (buf!7900 b1!97)))))

(declare-fun b!312252 () Bool)

(declare-fun res!255764 () Bool)

(assert (=> b!312252 (=> (not res!255764) (not e!224550))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!312252 (= res!255764 (validate_offset_bits!1 ((_ sign_extend 32) (size!8287 (buf!7900 b1!97))) ((_ sign_extend 32) (currentByte!14604 b1!97)) ((_ sign_extend 32) (currentBit!14599 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!312253 () Bool)

(declare-fun e!224552 () Bool)

(assert (=> b!312253 (= e!224552 (array_inv!7839 (buf!7900 b2!97)))))

(declare-fun b!312254 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!312254 (= e!224551 (bvslt (remainingBits!0 ((_ sign_extend 32) (size!8287 (buf!7900 b2!97))) ((_ sign_extend 32) (currentByte!14604 b2!97)) ((_ sign_extend 32) (currentBit!14599 b2!97))) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9)))))

(declare-fun b!312255 () Bool)

(declare-fun res!255765 () Bool)

(assert (=> b!312255 (=> (not res!255765) (not e!224550))))

(assert (=> b!312255 (= res!255765 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8287 (buf!7900 b1!97))) ((_ sign_extend 32) (currentByte!14604 b1!97)) ((_ sign_extend 32) (currentBit!14599 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun res!255767 () Bool)

(assert (=> start!69466 (=> (not res!255767) (not e!224550))))

(assert (=> start!69466 (= res!255767 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8287 (buf!7900 b1!97)) (size!8287 (buf!7900 b2!97)))))))

(assert (=> start!69466 e!224550))

(assert (=> start!69466 true))

(declare-fun inv!12 (BitStream!13678) Bool)

(assert (=> start!69466 (and (inv!12 b1!97) e!224554)))

(assert (=> start!69466 (and (inv!12 b2!97) e!224552)))

(declare-fun b!312251 () Bool)

(declare-fun res!255763 () Bool)

(assert (=> b!312251 (=> (not res!255763) (not e!224550))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!312251 (= res!255763 (bvsle (bitIndex!0 (size!8287 (buf!7900 b2!97)) (currentByte!14604 b2!97) (currentBit!14599 b2!97)) (bvadd (bitIndex!0 (size!8287 (buf!7900 b1!97)) (currentByte!14604 b1!97) (currentBit!14599 b1!97)) advancedAtMostBits!9)))))

(assert (= (and start!69466 res!255767) b!312252))

(assert (= (and b!312252 res!255764) b!312251))

(assert (= (and b!312251 res!255763) b!312255))

(assert (= (and b!312255 res!255765) b!312248))

(assert (= (and b!312248 res!255766) b!312249))

(assert (= (and b!312249 res!255762) b!312254))

(assert (= start!69466 b!312250))

(assert (= start!69466 b!312253))

(declare-fun m!449945 () Bool)

(assert (=> b!312251 m!449945))

(declare-fun m!449947 () Bool)

(assert (=> b!312251 m!449947))

(declare-fun m!449949 () Bool)

(assert (=> b!312252 m!449949))

(declare-fun m!449951 () Bool)

(assert (=> b!312253 m!449951))

(declare-fun m!449953 () Bool)

(assert (=> b!312255 m!449953))

(declare-fun m!449955 () Bool)

(assert (=> b!312250 m!449955))

(declare-fun m!449957 () Bool)

(assert (=> start!69466 m!449957))

(declare-fun m!449959 () Bool)

(assert (=> start!69466 m!449959))

(declare-fun m!449961 () Bool)

(assert (=> b!312254 m!449961))

(push 1)

(assert (not b!312254))

(assert (not start!69466))

(assert (not b!312252))

(assert (not b!312250))

(assert (not b!312253))

(assert (not b!312251))

(assert (not b!312255))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!103692 () Bool)

(assert (=> d!103692 (= (array_inv!7839 (buf!7900 b1!97)) (bvsge (size!8287 (buf!7900 b1!97)) #b00000000000000000000000000000000))))

(assert (=> b!312250 d!103692))

(declare-fun d!103694 () Bool)

(assert (=> d!103694 (= (remainingBits!0 ((_ sign_extend 32) (size!8287 (buf!7900 b1!97))) ((_ sign_extend 32) (currentByte!14604 b1!97)) ((_ sign_extend 32) (currentBit!14599 b1!97))) (bvsub (bvmul ((_ sign_extend 32) (size!8287 (buf!7900 b1!97))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14604 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14599 b1!97)))))))

(assert (=> b!312255 d!103694))

(declare-fun d!103696 () Bool)

(assert (=> d!103696 (= (remainingBits!0 ((_ sign_extend 32) (size!8287 (buf!7900 b2!97))) ((_ sign_extend 32) (currentByte!14604 b2!97)) ((_ sign_extend 32) (currentBit!14599 b2!97))) (bvsub (bvmul ((_ sign_extend 32) (size!8287 (buf!7900 b2!97))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14604 b2!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14599 b2!97)))))))

(assert (=> b!312254 d!103696))

(declare-fun d!103698 () Bool)

(assert (=> d!103698 (= (array_inv!7839 (buf!7900 b2!97)) (bvsge (size!8287 (buf!7900 b2!97)) #b00000000000000000000000000000000))))

(assert (=> b!312253 d!103698))

(declare-fun d!103700 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!103700 (= (inv!12 b1!97) (invariant!0 (currentBit!14599 b1!97) (currentByte!14604 b1!97) (size!8287 (buf!7900 b1!97))))))

(declare-fun bs!26831 () Bool)

(assert (= bs!26831 d!103700))

(declare-fun m!450003 () Bool)

(assert (=> bs!26831 m!450003))

(assert (=> start!69466 d!103700))

(declare-fun d!103702 () Bool)

(assert (=> d!103702 (= (inv!12 b2!97) (invariant!0 (currentBit!14599 b2!97) (currentByte!14604 b2!97) (size!8287 (buf!7900 b2!97))))))

(declare-fun bs!26832 () Bool)

(assert (= bs!26832 d!103702))

(declare-fun m!450005 () Bool)

(assert (=> bs!26832 m!450005))

(assert (=> start!69466 d!103702))

(declare-fun d!103704 () Bool)

(assert (=> d!103704 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8287 (buf!7900 b1!97))) ((_ sign_extend 32) (currentByte!14604 b1!97)) ((_ sign_extend 32) (currentBit!14599 b1!97)) b1ValidateOffsetBits!10) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8287 (buf!7900 b1!97))) ((_ sign_extend 32) (currentByte!14604 b1!97)) ((_ sign_extend 32) (currentBit!14599 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun bs!26833 () Bool)

(assert (= bs!26833 d!103704))

(assert (=> bs!26833 m!449953))

(assert (=> b!312252 d!103704))

(declare-fun d!103706 () Bool)

(declare-fun e!224603 () Bool)

(assert (=> d!103706 e!224603))

(declare-fun res!255816 () Bool)

(assert (=> d!103706 (=> (not res!255816) (not e!224603))))

(declare-fun lt!441873 () (_ BitVec 64))

(declare-fun lt!441877 () (_ BitVec 64))

(declare-fun lt!441878 () (_ BitVec 64))

(assert (=> d!103706 (= res!255816 (= lt!441877 (bvsub lt!441873 lt!441878)))))

(assert (=> d!103706 (or (= (bvand lt!441873 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441878 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441873 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441873 lt!441878) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103706 (= lt!441878 (remainingBits!0 ((_ sign_extend 32) (size!8287 (buf!7900 b2!97))) ((_ sign_extend 32) (currentByte!14604 b2!97)) ((_ sign_extend 32) (currentBit!14599 b2!97))))))

(declare-fun lt!441876 () (_ BitVec 64))

(declare-fun lt!441875 () (_ BitVec 64))

(assert (=> d!103706 (= lt!441873 (bvmul lt!441876 lt!441875))))

(assert (=> d!103706 (or (= lt!441876 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441875 (bvsdiv (bvmul lt!441876 lt!441875) lt!441876)))))

(assert (=> d!103706 (= lt!441875 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103706 (= lt!441876 ((_ sign_extend 32) (size!8287 (buf!7900 b2!97))))))

(assert (=> d!103706 (= lt!441877 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14604 b2!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14599 b2!97))))))

(assert (=> d!103706 (invariant!0 (currentBit!14599 b2!97) (currentByte!14604 b2!97) (size!8287 (buf!7900 b2!97)))))

(assert (=> d!103706 (= (bitIndex!0 (size!8287 (buf!7900 b2!97)) (currentByte!14604 b2!97) (currentBit!14599 b2!97)) lt!441877)))

(declare-fun b!312316 () Bool)

(declare-fun res!255817 () Bool)

(assert (=> b!312316 (=> (not res!255817) (not e!224603))))

(assert (=> b!312316 (= res!255817 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441877))))

(declare-fun b!312317 () Bool)

(declare-fun lt!441874 () (_ BitVec 64))

(assert (=> b!312317 (= e!224603 (bvsle lt!441877 (bvmul lt!441874 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!312317 (or (= lt!441874 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441874 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441874)))))

(assert (=> b!312317 (= lt!441874 ((_ sign_extend 32) (size!8287 (buf!7900 b2!97))))))

(assert (= (and d!103706 res!255816) b!312316))

(assert (= (and b!312316 res!255817) b!312317))

(assert (=> d!103706 m!449961))

(assert (=> d!103706 m!450005))

(assert (=> b!312251 d!103706))

(declare-fun d!103716 () Bool)

(declare-fun e!224604 () Bool)

(assert (=> d!103716 e!224604))

(declare-fun res!255818 () Bool)

(assert (=> d!103716 (=> (not res!255818) (not e!224604))))

(declare-fun lt!441885 () (_ BitVec 64))

(declare-fun lt!441881 () (_ BitVec 64))

(declare-fun lt!441886 () (_ BitVec 64))

(assert (=> d!103716 (= res!255818 (= lt!441885 (bvsub lt!441881 lt!441886)))))

(assert (=> d!103716 (or (= (bvand lt!441881 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441886 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441881 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441881 lt!441886) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103716 (= lt!441886 (remainingBits!0 ((_ sign_extend 32) (size!8287 (buf!7900 b1!97))) ((_ sign_extend 32) (currentByte!14604 b1!97)) ((_ sign_extend 32) (currentBit!14599 b1!97))))))

(declare-fun lt!441884 () (_ BitVec 64))

(declare-fun lt!441883 () (_ BitVec 64))

(assert (=> d!103716 (= lt!441881 (bvmul lt!441884 lt!441883))))

(assert (=> d!103716 (or (= lt!441884 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441883 (bvsdiv (bvmul lt!441884 lt!441883) lt!441884)))))

(assert (=> d!103716 (= lt!441883 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103716 (= lt!441884 ((_ sign_extend 32) (size!8287 (buf!7900 b1!97))))))

(assert (=> d!103716 (= lt!441885 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14604 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14599 b1!97))))))

(assert (=> d!103716 (invariant!0 (currentBit!14599 b1!97) (currentByte!14604 b1!97) (size!8287 (buf!7900 b1!97)))))

(assert (=> d!103716 (= (bitIndex!0 (size!8287 (buf!7900 b1!97)) (currentByte!14604 b1!97) (currentBit!14599 b1!97)) lt!441885)))

(declare-fun b!312318 () Bool)

(declare-fun res!255819 () Bool)

(assert (=> b!312318 (=> (not res!255819) (not e!224604))))

(assert (=> b!312318 (= res!255819 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441885))))

(declare-fun b!312319 () Bool)

(declare-fun lt!441882 () (_ BitVec 64))

(assert (=> b!312319 (= e!224604 (bvsle lt!441885 (bvmul lt!441882 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!312319 (or (= lt!441882 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441882 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441882)))))

(assert (=> b!312319 (= lt!441882 ((_ sign_extend 32) (size!8287 (buf!7900 b1!97))))))

(assert (= (and d!103716 res!255818) b!312318))

(assert (= (and b!312318 res!255819) b!312319))

(assert (=> d!103716 m!449953))

(assert (=> d!103716 m!450003))

(assert (=> b!312251 d!103716))

(push 1)

(assert (not d!103702))

(assert (not d!103704))

(assert (not d!103706))

(assert (not d!103700))

(assert (not d!103716))

(check-sat)

(pop 1)

(push 1)

(check-sat)

