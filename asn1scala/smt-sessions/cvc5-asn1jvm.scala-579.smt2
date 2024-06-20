; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16570 () Bool)

(assert start!16570)

(declare-fun b!82269 () Bool)

(declare-fun e!54315 () Bool)

(declare-fun e!54318 () Bool)

(assert (=> b!82269 (= e!54315 (not e!54318))))

(declare-fun res!67797 () Bool)

(assert (=> b!82269 (=> res!67797 e!54318)))

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun lt!130823 () (_ BitVec 64))

(declare-fun lt!130824 () (_ BitVec 64))

(assert (=> b!82269 (= res!67797 (bvsgt lt!130823 (bvsub lt!130824 b1ValidateOffsetBits!11)))))

(declare-datatypes ((array!3701 0))(
  ( (array!3702 (arr!2331 (Array (_ BitVec 32) (_ BitVec 8))) (size!1694 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2950 0))(
  ( (BitStream!2951 (buf!2084 array!3701) (currentByte!4076 (_ BitVec 32)) (currentBit!4071 (_ BitVec 32))) )
))
(declare-fun b1!98 () BitStream!2950)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!82269 (= (remainingBits!0 ((_ sign_extend 32) (size!1694 (buf!2084 b1!98))) ((_ sign_extend 32) (currentByte!4076 b1!98)) ((_ sign_extend 32) (currentBit!4071 b1!98))) (bvsub lt!130824 lt!130823))))

(assert (=> b!82269 (= lt!130824 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1694 (buf!2084 b1!98)))))))

(declare-datatypes ((Unit!5497 0))(
  ( (Unit!5498) )
))
(declare-fun lt!130820 () Unit!5497)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!2950) Unit!5497)

(assert (=> b!82269 (= lt!130820 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!82270 () Bool)

(declare-fun res!67796 () Bool)

(declare-fun e!54312 () Bool)

(assert (=> b!82270 (=> (not res!67796) (not e!54312))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!82270 (= res!67796 (validate_offset_bits!1 ((_ sign_extend 32) (size!1694 (buf!2084 b1!98))) ((_ sign_extend 32) (currentByte!4076 b1!98)) ((_ sign_extend 32) (currentBit!4071 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!82271 () Bool)

(declare-fun b2!98 () BitStream!2950)

(assert (=> b!82271 (= e!54318 (or (bvsgt ((_ sign_extend 32) (size!1694 (buf!2084 b2!98))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4076 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4071 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (and (bvsge ((_ sign_extend 32) (size!1694 (buf!2084 b2!98))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4076 b2!98)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4071 b2!98)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!130821 () (_ BitVec 64))

(assert (=> b!82271 (= (remainingBits!0 ((_ sign_extend 32) (size!1694 (buf!2084 b2!98))) ((_ sign_extend 32) (currentByte!4076 b2!98)) ((_ sign_extend 32) (currentBit!4071 b2!98))) (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1694 (buf!2084 b2!98)))) lt!130821))))

(declare-fun lt!130822 () Unit!5497)

(assert (=> b!82271 (= lt!130822 (remainingBitsBitIndexLemma!0 b2!98))))

(declare-fun b!82268 () Bool)

(declare-fun e!54314 () Bool)

(declare-fun array_inv!1540 (array!3701) Bool)

(assert (=> b!82268 (= e!54314 (array_inv!1540 (buf!2084 b2!98)))))

(declare-fun res!67798 () Bool)

(assert (=> start!16570 (=> (not res!67798) (not e!54312))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(assert (=> start!16570 (= res!67798 (and (= (size!1694 (buf!2084 b1!98)) (size!1694 (buf!2084 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16570 e!54312))

(declare-fun e!54316 () Bool)

(declare-fun inv!12 (BitStream!2950) Bool)

(assert (=> start!16570 (and (inv!12 b1!98) e!54316)))

(assert (=> start!16570 (and (inv!12 b2!98) e!54314)))

(assert (=> start!16570 true))

(declare-fun b!82272 () Bool)

(assert (=> b!82272 (= e!54312 e!54315)))

(declare-fun res!67795 () Bool)

(assert (=> b!82272 (=> (not res!67795) (not e!54315))))

(assert (=> b!82272 (= res!67795 (= (bvadd lt!130823 b1b2Diff!1) lt!130821))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!82272 (= lt!130821 (bitIndex!0 (size!1694 (buf!2084 b2!98)) (currentByte!4076 b2!98) (currentBit!4071 b2!98)))))

(assert (=> b!82272 (= lt!130823 (bitIndex!0 (size!1694 (buf!2084 b1!98)) (currentByte!4076 b1!98) (currentBit!4071 b1!98)))))

(declare-fun b!82273 () Bool)

(assert (=> b!82273 (= e!54316 (array_inv!1540 (buf!2084 b1!98)))))

(assert (= (and start!16570 res!67798) b!82270))

(assert (= (and b!82270 res!67796) b!82272))

(assert (= (and b!82272 res!67795) b!82269))

(assert (= (and b!82269 (not res!67797)) b!82271))

(assert (= start!16570 b!82273))

(assert (= start!16570 b!82268))

(declare-fun m!128709 () Bool)

(assert (=> b!82271 m!128709))

(declare-fun m!128711 () Bool)

(assert (=> b!82271 m!128711))

(declare-fun m!128713 () Bool)

(assert (=> b!82272 m!128713))

(declare-fun m!128715 () Bool)

(assert (=> b!82272 m!128715))

(declare-fun m!128717 () Bool)

(assert (=> b!82270 m!128717))

(declare-fun m!128719 () Bool)

(assert (=> start!16570 m!128719))

(declare-fun m!128721 () Bool)

(assert (=> start!16570 m!128721))

(declare-fun m!128723 () Bool)

(assert (=> b!82268 m!128723))

(declare-fun m!128725 () Bool)

(assert (=> b!82273 m!128725))

(declare-fun m!128727 () Bool)

(assert (=> b!82269 m!128727))

(declare-fun m!128729 () Bool)

(assert (=> b!82269 m!128729))

(push 1)

(assert (not b!82269))

(assert (not b!82271))

(assert (not b!82270))

(assert (not start!16570))

(assert (not b!82272))

(assert (not b!82268))

(assert (not b!82273))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!25958 () Bool)

(assert (=> d!25958 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1694 (buf!2084 b1!98))) ((_ sign_extend 32) (currentByte!4076 b1!98)) ((_ sign_extend 32) (currentBit!4071 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1694 (buf!2084 b1!98))) ((_ sign_extend 32) (currentByte!4076 b1!98)) ((_ sign_extend 32) (currentBit!4071 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6363 () Bool)

(assert (= bs!6363 d!25958))

(assert (=> bs!6363 m!128727))

(assert (=> b!82270 d!25958))

(declare-fun d!25960 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!25960 (= (inv!12 b1!98) (invariant!0 (currentBit!4071 b1!98) (currentByte!4076 b1!98) (size!1694 (buf!2084 b1!98))))))

(declare-fun bs!6364 () Bool)

(assert (= bs!6364 d!25960))

(declare-fun m!128783 () Bool)

(assert (=> bs!6364 m!128783))

(assert (=> start!16570 d!25960))

(declare-fun d!25962 () Bool)

(assert (=> d!25962 (= (inv!12 b2!98) (invariant!0 (currentBit!4071 b2!98) (currentByte!4076 b2!98) (size!1694 (buf!2084 b2!98))))))

(declare-fun bs!6365 () Bool)

(assert (= bs!6365 d!25962))

(declare-fun m!128785 () Bool)

(assert (=> bs!6365 m!128785))

(assert (=> start!16570 d!25962))

(declare-fun d!25964 () Bool)

(assert (=> d!25964 (= (remainingBits!0 ((_ sign_extend 32) (size!1694 (buf!2084 b2!98))) ((_ sign_extend 32) (currentByte!4076 b2!98)) ((_ sign_extend 32) (currentBit!4071 b2!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1694 (buf!2084 b2!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4076 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4071 b2!98)))))))

(assert (=> b!82271 d!25964))

(declare-fun d!25968 () Bool)

(declare-fun lt!130909 () (_ BitVec 64))

(declare-fun lt!130911 () (_ BitVec 64))

(assert (=> d!25968 (= (remainingBits!0 ((_ sign_extend 32) (size!1694 (buf!2084 b2!98))) ((_ sign_extend 32) (currentByte!4076 b2!98)) ((_ sign_extend 32) (currentBit!4071 b2!98))) (bvsub lt!130909 lt!130911))))

(assert (=> d!25968 (or (= (bvand lt!130909 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!130911 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!130909 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!130909 lt!130911) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25968 (= lt!130911 (bitIndex!0 (size!1694 (buf!2084 b2!98)) (currentByte!4076 b2!98) (currentBit!4071 b2!98)))))

(declare-fun lt!130912 () (_ BitVec 64))

(declare-fun lt!130913 () (_ BitVec 64))

(assert (=> d!25968 (= lt!130909 (bvmul lt!130912 lt!130913))))

(assert (=> d!25968 (or (= lt!130912 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!130913 (bvsdiv (bvmul lt!130912 lt!130913) lt!130912)))))

(assert (=> d!25968 (= lt!130913 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25968 (= lt!130912 ((_ sign_extend 32) (size!1694 (buf!2084 b2!98))))))

(declare-fun lt!130910 () Unit!5497)

(declare-fun choose!23 (BitStream!2950) Unit!5497)

(assert (=> d!25968 (= lt!130910 (choose!23 b2!98))))

(assert (=> d!25968 (= (remainingBitsBitIndexLemma!0 b2!98) lt!130910)))

(declare-fun bs!6366 () Bool)

(assert (= bs!6366 d!25968))

(assert (=> bs!6366 m!128709))

(assert (=> bs!6366 m!128713))

(declare-fun m!128787 () Bool)

(assert (=> bs!6366 m!128787))

(assert (=> b!82271 d!25968))

(declare-fun d!25974 () Bool)

(declare-fun e!54371 () Bool)

(assert (=> d!25974 e!54371))

(declare-fun res!67844 () Bool)

(assert (=> d!25974 (=> (not res!67844) (not e!54371))))

(declare-fun lt!130955 () (_ BitVec 64))

(declare-fun lt!130953 () (_ BitVec 64))

(declare-fun lt!130951 () (_ BitVec 64))

(assert (=> d!25974 (= res!67844 (= lt!130955 (bvsub lt!130951 lt!130953)))))

(assert (=> d!25974 (or (= (bvand lt!130951 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!130953 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!130951 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!130951 lt!130953) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25974 (= lt!130953 (remainingBits!0 ((_ sign_extend 32) (size!1694 (buf!2084 b2!98))) ((_ sign_extend 32) (currentByte!4076 b2!98)) ((_ sign_extend 32) (currentBit!4071 b2!98))))))

(declare-fun lt!130952 () (_ BitVec 64))

(declare-fun lt!130954 () (_ BitVec 64))

(assert (=> d!25974 (= lt!130951 (bvmul lt!130952 lt!130954))))

(assert (=> d!25974 (or (= lt!130952 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!130954 (bvsdiv (bvmul lt!130952 lt!130954) lt!130952)))))

(assert (=> d!25974 (= lt!130954 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25974 (= lt!130952 ((_ sign_extend 32) (size!1694 (buf!2084 b2!98))))))

(assert (=> d!25974 (= lt!130955 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4076 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4071 b2!98))))))

(assert (=> d!25974 (invariant!0 (currentBit!4071 b2!98) (currentByte!4076 b2!98) (size!1694 (buf!2084 b2!98)))))

(assert (=> d!25974 (= (bitIndex!0 (size!1694 (buf!2084 b2!98)) (currentByte!4076 b2!98) (currentBit!4071 b2!98)) lt!130955)))

(declare-fun b!82332 () Bool)

(declare-fun res!67843 () Bool)

(assert (=> b!82332 (=> (not res!67843) (not e!54371))))

(assert (=> b!82332 (= res!67843 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!130955))))

(declare-fun b!82333 () Bool)

(declare-fun lt!130950 () (_ BitVec 64))

(assert (=> b!82333 (= e!54371 (bvsle lt!130955 (bvmul lt!130950 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82333 (or (= lt!130950 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!130950 #b0000000000000000000000000000000000000000000000000000000000001000) lt!130950)))))

(assert (=> b!82333 (= lt!130950 ((_ sign_extend 32) (size!1694 (buf!2084 b2!98))))))

(assert (= (and d!25974 res!67844) b!82332))

(assert (= (and b!82332 res!67843) b!82333))

(assert (=> d!25974 m!128709))

(assert (=> d!25974 m!128785))

(assert (=> b!82272 d!25974))

(declare-fun d!25982 () Bool)

(declare-fun e!54372 () Bool)

(assert (=> d!25982 e!54372))

(declare-fun res!67846 () Bool)

(assert (=> d!25982 (=> (not res!67846) (not e!54372))))

(declare-fun lt!130957 () (_ BitVec 64))

(declare-fun lt!130961 () (_ BitVec 64))

(declare-fun lt!130959 () (_ BitVec 64))

(assert (=> d!25982 (= res!67846 (= lt!130961 (bvsub lt!130957 lt!130959)))))

(assert (=> d!25982 (or (= (bvand lt!130957 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!130959 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!130957 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!130957 lt!130959) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25982 (= lt!130959 (remainingBits!0 ((_ sign_extend 32) (size!1694 (buf!2084 b1!98))) ((_ sign_extend 32) (currentByte!4076 b1!98)) ((_ sign_extend 32) (currentBit!4071 b1!98))))))

(declare-fun lt!130958 () (_ BitVec 64))

(declare-fun lt!130960 () (_ BitVec 64))

(assert (=> d!25982 (= lt!130957 (bvmul lt!130958 lt!130960))))

(assert (=> d!25982 (or (= lt!130958 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!130960 (bvsdiv (bvmul lt!130958 lt!130960) lt!130958)))))

(assert (=> d!25982 (= lt!130960 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25982 (= lt!130958 ((_ sign_extend 32) (size!1694 (buf!2084 b1!98))))))

(assert (=> d!25982 (= lt!130961 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4076 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4071 b1!98))))))

(assert (=> d!25982 (invariant!0 (currentBit!4071 b1!98) (currentByte!4076 b1!98) (size!1694 (buf!2084 b1!98)))))

(assert (=> d!25982 (= (bitIndex!0 (size!1694 (buf!2084 b1!98)) (currentByte!4076 b1!98) (currentBit!4071 b1!98)) lt!130961)))

(declare-fun b!82334 () Bool)

(declare-fun res!67845 () Bool)

(assert (=> b!82334 (=> (not res!67845) (not e!54372))))

(assert (=> b!82334 (= res!67845 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!130961))))

(declare-fun b!82335 () Bool)

(declare-fun lt!130956 () (_ BitVec 64))

(assert (=> b!82335 (= e!54372 (bvsle lt!130961 (bvmul lt!130956 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82335 (or (= lt!130956 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!130956 #b0000000000000000000000000000000000000000000000000000000000001000) lt!130956)))))

(assert (=> b!82335 (= lt!130956 ((_ sign_extend 32) (size!1694 (buf!2084 b1!98))))))

(assert (= (and d!25982 res!67846) b!82334))

(assert (= (and b!82334 res!67845) b!82335))

(assert (=> d!25982 m!128727))

(assert (=> d!25982 m!128783))

(assert (=> b!82272 d!25982))

(declare-fun d!25984 () Bool)

(assert (=> d!25984 (= (array_inv!1540 (buf!2084 b1!98)) (bvsge (size!1694 (buf!2084 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!82273 d!25984))

(declare-fun d!25986 () Bool)

(assert (=> d!25986 (= (array_inv!1540 (buf!2084 b2!98)) (bvsge (size!1694 (buf!2084 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!82268 d!25986))

(declare-fun d!25988 () Bool)

(assert (=> d!25988 (= (remainingBits!0 ((_ sign_extend 32) (size!1694 (buf!2084 b1!98))) ((_ sign_extend 32) (currentByte!4076 b1!98)) ((_ sign_extend 32) (currentBit!4071 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1694 (buf!2084 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4076 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4071 b1!98)))))))

(assert (=> b!82269 d!25988))

(declare-fun d!25990 () Bool)

(declare-fun lt!130962 () (_ BitVec 64))

(declare-fun lt!130964 () (_ BitVec 64))

(assert (=> d!25990 (= (remainingBits!0 ((_ sign_extend 32) (size!1694 (buf!2084 b1!98))) ((_ sign_extend 32) (currentByte!4076 b1!98)) ((_ sign_extend 32) (currentBit!4071 b1!98))) (bvsub lt!130962 lt!130964))))

(assert (=> d!25990 (or (= (bvand lt!130962 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!130964 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!130962 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!130962 lt!130964) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25990 (= lt!130964 (bitIndex!0 (size!1694 (buf!2084 b1!98)) (currentByte!4076 b1!98) (currentBit!4071 b1!98)))))

(declare-fun lt!130965 () (_ BitVec 64))

(declare-fun lt!130966 () (_ BitVec 64))

(assert (=> d!25990 (= lt!130962 (bvmul lt!130965 lt!130966))))

(assert (=> d!25990 (or (= lt!130965 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!130966 (bvsdiv (bvmul lt!130965 lt!130966) lt!130965)))))

(assert (=> d!25990 (= lt!130966 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25990 (= lt!130965 ((_ sign_extend 32) (size!1694 (buf!2084 b1!98))))))

(declare-fun lt!130963 () Unit!5497)

(assert (=> d!25990 (= lt!130963 (choose!23 b1!98))))

(assert (=> d!25990 (= (remainingBitsBitIndexLemma!0 b1!98) lt!130963)))

(declare-fun bs!6367 () Bool)

(assert (= bs!6367 d!25990))

(assert (=> bs!6367 m!128727))

(assert (=> bs!6367 m!128715))

(declare-fun m!128793 () Bool)

(assert (=> bs!6367 m!128793))

(assert (=> b!82269 d!25990))

(push 1)

(assert (not d!25958))

(assert (not d!25982))

(assert (not d!25968))

(assert (not d!25962))

(assert (not d!25990))

(assert (not d!25960))

(assert (not d!25974))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(assert (=> d!25958 d!25988))

(declare-fun d!26004 () Bool)

(assert (=> d!26004 (= (invariant!0 (currentBit!4071 b1!98) (currentByte!4076 b1!98) (size!1694 (buf!2084 b1!98))) (and (bvsge (currentBit!4071 b1!98) #b00000000000000000000000000000000) (bvslt (currentBit!4071 b1!98) #b00000000000000000000000000001000) (bvsge (currentByte!4076 b1!98) #b00000000000000000000000000000000) (or (bvslt (currentByte!4076 b1!98) (size!1694 (buf!2084 b1!98))) (and (= (currentBit!4071 b1!98) #b00000000000000000000000000000000) (= (currentByte!4076 b1!98) (size!1694 (buf!2084 b1!98)))))))))

(assert (=> d!25960 d!26004))

(assert (=> d!25968 d!25964))

(assert (=> d!25968 d!25974))

(declare-fun d!26006 () Bool)

(assert (=> d!26006 (= (remainingBits!0 ((_ sign_extend 32) (size!1694 (buf!2084 b2!98))) ((_ sign_extend 32) (currentByte!4076 b2!98)) ((_ sign_extend 32) (currentBit!4071 b2!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1694 (buf!2084 b2!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bitIndex!0 (size!1694 (buf!2084 b2!98)) (currentByte!4076 b2!98) (currentBit!4071 b2!98))))))

(assert (=> d!26006 true))

(declare-fun _$4!30 () Unit!5497)

(assert (=> d!26006 (= (choose!23 b2!98) _$4!30)))

(declare-fun bs!6373 () Bool)

(assert (= bs!6373 d!26006))

(assert (=> bs!6373 m!128709))

(assert (=> bs!6373 m!128713))

(assert (=> d!25968 d!26006))

(assert (=> d!25982 d!25988))

(assert (=> d!25982 d!26004))

(assert (=> d!25990 d!25988))

(assert (=> d!25990 d!25982))

(declare-fun d!26008 () Bool)

(assert (=> d!26008 (= (remainingBits!0 ((_ sign_extend 32) (size!1694 (buf!2084 b1!98))) ((_ sign_extend 32) (currentByte!4076 b1!98)) ((_ sign_extend 32) (currentBit!4071 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1694 (buf!2084 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bitIndex!0 (size!1694 (buf!2084 b1!98)) (currentByte!4076 b1!98) (currentBit!4071 b1!98))))))

(assert (=> d!26008 true))

(declare-fun _$4!31 () Unit!5497)

(assert (=> d!26008 (= (choose!23 b1!98) _$4!31)))

(declare-fun bs!6374 () Bool)

(assert (= bs!6374 d!26008))

(assert (=> bs!6374 m!128727))

(assert (=> bs!6374 m!128715))

(assert (=> d!25990 d!26008))

(declare-fun d!26010 () Bool)

(assert (=> d!26010 (= (invariant!0 (currentBit!4071 b2!98) (currentByte!4076 b2!98) (size!1694 (buf!2084 b2!98))) (and (bvsge (currentBit!4071 b2!98) #b00000000000000000000000000000000) (bvslt (currentBit!4071 b2!98) #b00000000000000000000000000001000) (bvsge (currentByte!4076 b2!98) #b00000000000000000000000000000000) (or (bvslt (currentByte!4076 b2!98) (size!1694 (buf!2084 b2!98))) (and (= (currentBit!4071 b2!98) #b00000000000000000000000000000000) (= (currentByte!4076 b2!98) (size!1694 (buf!2084 b2!98)))))))))

(assert (=> d!25962 d!26010))

(assert (=> d!25974 d!25964))

(assert (=> d!25974 d!26010))

(push 1)

(assert (not d!26006))

(assert (not d!26008))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

