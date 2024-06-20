; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48614 () Bool)

(assert start!48614)

(declare-fun b!230340 () Bool)

(declare-fun e!158185 () Bool)

(declare-fun e!158186 () Bool)

(assert (=> b!230340 (= e!158185 e!158186)))

(declare-fun res!193075 () Bool)

(assert (=> b!230340 (=> (not res!193075) (not e!158186))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!367980 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> b!230340 (= res!193075 (and (bvsle bits!86 lt!367980) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(declare-datatypes ((array!11739 0))(
  ( (array!11740 (arr!6133 (Array (_ BitVec 32) (_ BitVec 8))) (size!5146 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9388 0))(
  ( (BitStream!9389 (buf!5687 array!11739) (currentByte!10649 (_ BitVec 32)) (currentBit!10644 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9388)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!230340 (= lt!367980 (bitIndex!0 (size!5146 (buf!5687 b2!99)) (currentByte!10649 b2!99) (currentBit!10644 b2!99)))))

(declare-fun res!193074 () Bool)

(assert (=> start!48614 (=> (not res!193074) (not e!158185))))

(declare-fun b1!101 () BitStream!9388)

(assert (=> start!48614 (= res!193074 (and (= (size!5146 (buf!5687 b1!101)) (size!5146 (buf!5687 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48614 e!158185))

(declare-fun e!158189 () Bool)

(declare-fun inv!12 (BitStream!9388) Bool)

(assert (=> start!48614 (and (inv!12 b1!101) e!158189)))

(declare-fun e!158188 () Bool)

(assert (=> start!48614 (and (inv!12 b2!99) e!158188)))

(assert (=> start!48614 true))

(declare-fun b!230341 () Bool)

(declare-fun array_inv!4887 (array!11739) Bool)

(assert (=> b!230341 (= e!158188 (array_inv!4887 (buf!5687 b2!99)))))

(declare-fun b!230342 () Bool)

(declare-fun res!193077 () Bool)

(assert (=> b!230342 (=> (not res!193077) (not e!158186))))

(assert (=> b!230342 (= res!193077 (= lt!367980 (bvadd (bitIndex!0 (size!5146 (buf!5687 b1!101)) (currentByte!10649 b1!101) (currentBit!10644 b1!101)) bits!86)))))

(declare-fun b!230343 () Bool)

(declare-fun res!193076 () Bool)

(assert (=> b!230343 (=> (not res!193076) (not e!158186))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!230343 (= res!193076 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5146 (buf!5687 b1!101))) ((_ sign_extend 32) (currentByte!10649 b1!101)) ((_ sign_extend 32) (currentBit!10644 b1!101)) bytes!19))))

(declare-fun b!230344 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!230344 (= e!158186 (bvsgt ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5146 (buf!5687 b1!101))) ((_ sign_extend 32) (currentByte!10649 b1!101)) ((_ sign_extend 32) (currentBit!10644 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!230345 () Bool)

(assert (=> b!230345 (= e!158189 (array_inv!4887 (buf!5687 b1!101)))))

(assert (= (and start!48614 res!193074) b!230340))

(assert (= (and b!230340 res!193075) b!230343))

(assert (= (and b!230343 res!193076) b!230342))

(assert (= (and b!230342 res!193077) b!230344))

(assert (= start!48614 b!230345))

(assert (= start!48614 b!230341))

(declare-fun m!353683 () Bool)

(assert (=> b!230343 m!353683))

(declare-fun m!353685 () Bool)

(assert (=> b!230342 m!353685))

(declare-fun m!353687 () Bool)

(assert (=> b!230344 m!353687))

(declare-fun m!353689 () Bool)

(assert (=> b!230341 m!353689))

(declare-fun m!353691 () Bool)

(assert (=> b!230340 m!353691))

(declare-fun m!353693 () Bool)

(assert (=> start!48614 m!353693))

(declare-fun m!353695 () Bool)

(assert (=> start!48614 m!353695))

(declare-fun m!353697 () Bool)

(assert (=> b!230345 m!353697))

(push 1)

(assert (not b!230340))

(assert (not b!230344))

(assert (not b!230345))

(assert (not start!48614))

(assert (not b!230342))

(assert (not b!230341))

(assert (not b!230343))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!78156 () Bool)

(assert (=> d!78156 (= (array_inv!4887 (buf!5687 b1!101)) (bvsge (size!5146 (buf!5687 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!230345 d!78156))

(declare-fun d!78158 () Bool)

(declare-fun e!158232 () Bool)

(assert (=> d!78158 e!158232))

(declare-fun res!193115 () Bool)

(assert (=> d!78158 (=> (not res!193115) (not e!158232))))

(declare-fun lt!368027 () (_ BitVec 64))

(declare-fun lt!368024 () (_ BitVec 64))

(declare-fun lt!368023 () (_ BitVec 64))

(assert (=> d!78158 (= res!193115 (= lt!368024 (bvsub lt!368023 lt!368027)))))

(assert (=> d!78158 (or (= (bvand lt!368023 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!368027 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!368023 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!368023 lt!368027) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78158 (= lt!368027 (remainingBits!0 ((_ sign_extend 32) (size!5146 (buf!5687 b2!99))) ((_ sign_extend 32) (currentByte!10649 b2!99)) ((_ sign_extend 32) (currentBit!10644 b2!99))))))

(declare-fun lt!368025 () (_ BitVec 64))

(declare-fun lt!368028 () (_ BitVec 64))

(assert (=> d!78158 (= lt!368023 (bvmul lt!368025 lt!368028))))

(assert (=> d!78158 (or (= lt!368025 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!368028 (bvsdiv (bvmul lt!368025 lt!368028) lt!368025)))))

(assert (=> d!78158 (= lt!368028 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78158 (= lt!368025 ((_ sign_extend 32) (size!5146 (buf!5687 b2!99))))))

(assert (=> d!78158 (= lt!368024 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10649 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10644 b2!99))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!78158 (invariant!0 (currentBit!10644 b2!99) (currentByte!10649 b2!99) (size!5146 (buf!5687 b2!99)))))

(assert (=> d!78158 (= (bitIndex!0 (size!5146 (buf!5687 b2!99)) (currentByte!10649 b2!99) (currentBit!10644 b2!99)) lt!368024)))

(declare-fun b!230394 () Bool)

(declare-fun res!193114 () Bool)

(assert (=> b!230394 (=> (not res!193114) (not e!158232))))

(assert (=> b!230394 (= res!193114 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!368024))))

(declare-fun b!230395 () Bool)

(declare-fun lt!368026 () (_ BitVec 64))

(assert (=> b!230395 (= e!158232 (bvsle lt!368024 (bvmul lt!368026 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!230395 (or (= lt!368026 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!368026 #b0000000000000000000000000000000000000000000000000000000000001000) lt!368026)))))

(assert (=> b!230395 (= lt!368026 ((_ sign_extend 32) (size!5146 (buf!5687 b2!99))))))

(assert (= (and d!78158 res!193115) b!230394))

(assert (= (and b!230394 res!193114) b!230395))

(declare-fun m!353737 () Bool)

(assert (=> d!78158 m!353737))

(declare-fun m!353739 () Bool)

(assert (=> d!78158 m!353739))

(assert (=> b!230340 d!78158))

(declare-fun d!78160 () Bool)

(assert (=> d!78160 (= (array_inv!4887 (buf!5687 b2!99)) (bvsge (size!5146 (buf!5687 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!230341 d!78160))

(declare-fun d!78162 () Bool)

(assert (=> d!78162 (= (inv!12 b1!101) (invariant!0 (currentBit!10644 b1!101) (currentByte!10649 b1!101) (size!5146 (buf!5687 b1!101))))))

(declare-fun bs!19153 () Bool)

(assert (= bs!19153 d!78162))

(declare-fun m!353741 () Bool)

(assert (=> bs!19153 m!353741))

(assert (=> start!48614 d!78162))

(declare-fun d!78164 () Bool)

(assert (=> d!78164 (= (inv!12 b2!99) (invariant!0 (currentBit!10644 b2!99) (currentByte!10649 b2!99) (size!5146 (buf!5687 b2!99))))))

(declare-fun bs!19154 () Bool)

(assert (= bs!19154 d!78164))

(assert (=> bs!19154 m!353739))

(assert (=> start!48614 d!78164))

(declare-fun d!78166 () Bool)

(declare-fun e!158233 () Bool)

(assert (=> d!78166 e!158233))

(declare-fun res!193117 () Bool)

(assert (=> d!78166 (=> (not res!193117) (not e!158233))))

(declare-fun lt!368033 () (_ BitVec 64))

(declare-fun lt!368029 () (_ BitVec 64))

(declare-fun lt!368030 () (_ BitVec 64))

(assert (=> d!78166 (= res!193117 (= lt!368030 (bvsub lt!368029 lt!368033)))))

(assert (=> d!78166 (or (= (bvand lt!368029 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!368033 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!368029 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!368029 lt!368033) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78166 (= lt!368033 (remainingBits!0 ((_ sign_extend 32) (size!5146 (buf!5687 b1!101))) ((_ sign_extend 32) (currentByte!10649 b1!101)) ((_ sign_extend 32) (currentBit!10644 b1!101))))))

(declare-fun lt!368031 () (_ BitVec 64))

(declare-fun lt!368034 () (_ BitVec 64))

(assert (=> d!78166 (= lt!368029 (bvmul lt!368031 lt!368034))))

(assert (=> d!78166 (or (= lt!368031 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!368034 (bvsdiv (bvmul lt!368031 lt!368034) lt!368031)))))

(assert (=> d!78166 (= lt!368034 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78166 (= lt!368031 ((_ sign_extend 32) (size!5146 (buf!5687 b1!101))))))

(assert (=> d!78166 (= lt!368030 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10649 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10644 b1!101))))))

(assert (=> d!78166 (invariant!0 (currentBit!10644 b1!101) (currentByte!10649 b1!101) (size!5146 (buf!5687 b1!101)))))

(assert (=> d!78166 (= (bitIndex!0 (size!5146 (buf!5687 b1!101)) (currentByte!10649 b1!101) (currentBit!10644 b1!101)) lt!368030)))

(declare-fun b!230396 () Bool)

(declare-fun res!193116 () Bool)

(assert (=> b!230396 (=> (not res!193116) (not e!158233))))

(assert (=> b!230396 (= res!193116 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!368030))))

(declare-fun b!230397 () Bool)

(declare-fun lt!368032 () (_ BitVec 64))

(assert (=> b!230397 (= e!158233 (bvsle lt!368030 (bvmul lt!368032 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!230397 (or (= lt!368032 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!368032 #b0000000000000000000000000000000000000000000000000000000000001000) lt!368032)))))

(assert (=> b!230397 (= lt!368032 ((_ sign_extend 32) (size!5146 (buf!5687 b1!101))))))

(assert (= (and d!78166 res!193117) b!230396))

(assert (= (and b!230396 res!193116) b!230397))

(assert (=> d!78166 m!353687))

(assert (=> d!78166 m!353741))

(assert (=> b!230342 d!78166))

(declare-fun d!78168 () Bool)

(assert (=> d!78168 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5146 (buf!5687 b1!101))) ((_ sign_extend 32) (currentByte!10649 b1!101)) ((_ sign_extend 32) (currentBit!10644 b1!101)) bytes!19) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5146 (buf!5687 b1!101))) ((_ sign_extend 32) (currentByte!10649 b1!101)) ((_ sign_extend 32) (currentBit!10644 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19155 () Bool)

(assert (= bs!19155 d!78168))

(assert (=> bs!19155 m!353687))

(assert (=> b!230343 d!78168))

(declare-fun d!78170 () Bool)

(assert (=> d!78170 (= (remainingBits!0 ((_ sign_extend 32) (size!5146 (buf!5687 b1!101))) ((_ sign_extend 32) (currentByte!10649 b1!101)) ((_ sign_extend 32) (currentBit!10644 b1!101))) (bvsub (bvmul ((_ sign_extend 32) (size!5146 (buf!5687 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10649 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10644 b1!101)))))))

(assert (=> b!230344 d!78170))

(push 1)

(assert (not d!78166))

(assert (not d!78164))

(assert (not d!78162))

(assert (not d!78168))

(assert (not d!78158))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

