; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48678 () Bool)

(assert start!48678)

(declare-fun b!230505 () Bool)

(declare-fun e!158320 () Bool)

(declare-datatypes ((array!11756 0))(
  ( (array!11757 (arr!6139 (Array (_ BitVec 32) (_ BitVec 8))) (size!5152 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9400 0))(
  ( (BitStream!9401 (buf!5693 array!11756) (currentByte!10671 (_ BitVec 32)) (currentBit!10666 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9400)

(declare-fun array_inv!4893 (array!11756) Bool)

(assert (=> b!230505 (= e!158320 (array_inv!4893 (buf!5693 b2!99)))))

(declare-fun b!230506 () Bool)

(declare-fun res!193204 () Bool)

(declare-fun e!158318 () Bool)

(assert (=> b!230506 (=> (not res!193204) (not e!158318))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b1!101 () BitStream!9400)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!230506 (= res!193204 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5152 (buf!5693 b1!101))) ((_ sign_extend 32) (currentByte!10671 b1!101)) ((_ sign_extend 32) (currentBit!10666 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!230507 () Bool)

(declare-fun res!193203 () Bool)

(assert (=> b!230507 (=> (not res!193203) (not e!158318))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!230507 (= res!193203 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5152 (buf!5693 b1!101))) ((_ sign_extend 32) (currentByte!10671 b1!101)) ((_ sign_extend 32) (currentBit!10666 b1!101)) bytes!19))))

(declare-fun b!230508 () Bool)

(declare-fun e!158315 () Bool)

(assert (=> b!230508 (= e!158315 (array_inv!4893 (buf!5693 b1!101)))))

(declare-fun b!230509 () Bool)

(declare-fun lt!368136 () (_ BitVec 64))

(assert (=> b!230509 (= e!158318 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5152 (buf!5693 b1!101)))) (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10671 b1!101))) ((_ sign_extend 32) (currentBit!10666 b1!101)))) #b0000000000000000000000000000000000000000000000000000000000001000)) (not (= lt!368136 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10671 b2!99))) ((_ sign_extend 32) (currentBit!10666 b2!99)))))))))

(declare-fun b!230510 () Bool)

(declare-fun res!193205 () Bool)

(assert (=> b!230510 (=> (not res!193205) (not e!158318))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!230510 (= res!193205 (= lt!368136 (bvadd (bitIndex!0 (size!5152 (buf!5693 b1!101)) (currentByte!10671 b1!101) (currentBit!10666 b1!101)) bits!86)))))

(declare-fun res!193206 () Bool)

(declare-fun e!158319 () Bool)

(assert (=> start!48678 (=> (not res!193206) (not e!158319))))

(assert (=> start!48678 (= res!193206 (and (= (size!5152 (buf!5693 b1!101)) (size!5152 (buf!5693 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48678 e!158319))

(declare-fun inv!12 (BitStream!9400) Bool)

(assert (=> start!48678 (and (inv!12 b1!101) e!158315)))

(assert (=> start!48678 (and (inv!12 b2!99) e!158320)))

(assert (=> start!48678 true))

(declare-fun b!230511 () Bool)

(assert (=> b!230511 (= e!158319 e!158318)))

(declare-fun res!193207 () Bool)

(assert (=> b!230511 (=> (not res!193207) (not e!158318))))

(assert (=> b!230511 (= res!193207 (and (bvsle bits!86 lt!368136) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(assert (=> b!230511 (= lt!368136 (bitIndex!0 (size!5152 (buf!5693 b2!99)) (currentByte!10671 b2!99) (currentBit!10666 b2!99)))))

(assert (= (and start!48678 res!193206) b!230511))

(assert (= (and b!230511 res!193207) b!230507))

(assert (= (and b!230507 res!193203) b!230510))

(assert (= (and b!230510 res!193205) b!230506))

(assert (= (and b!230506 res!193204) b!230509))

(assert (= start!48678 b!230508))

(assert (= start!48678 b!230505))

(declare-fun m!353809 () Bool)

(assert (=> b!230505 m!353809))

(declare-fun m!353811 () Bool)

(assert (=> b!230506 m!353811))

(declare-fun m!353813 () Bool)

(assert (=> b!230510 m!353813))

(declare-fun m!353815 () Bool)

(assert (=> b!230511 m!353815))

(declare-fun m!353817 () Bool)

(assert (=> start!48678 m!353817))

(declare-fun m!353819 () Bool)

(assert (=> start!48678 m!353819))

(declare-fun m!353821 () Bool)

(assert (=> b!230507 m!353821))

(declare-fun m!353823 () Bool)

(assert (=> b!230508 m!353823))

(push 1)

(assert (not b!230507))

(assert (not b!230511))

(assert (not b!230510))

(assert (not start!48678))

(assert (not b!230505))

(assert (not b!230506))

(assert (not b!230508))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!78226 () Bool)

(assert (=> d!78226 (= (array_inv!4893 (buf!5693 b1!101)) (bvsge (size!5152 (buf!5693 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!230508 d!78226))

(declare-fun d!78228 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!78228 (= (inv!12 b1!101) (invariant!0 (currentBit!10666 b1!101) (currentByte!10671 b1!101) (size!5152 (buf!5693 b1!101))))))

(declare-fun bs!19171 () Bool)

(assert (= bs!19171 d!78228))

(declare-fun m!353857 () Bool)

(assert (=> bs!19171 m!353857))

(assert (=> start!48678 d!78228))

(declare-fun d!78230 () Bool)

(assert (=> d!78230 (= (inv!12 b2!99) (invariant!0 (currentBit!10666 b2!99) (currentByte!10671 b2!99) (size!5152 (buf!5693 b2!99))))))

(declare-fun bs!19172 () Bool)

(assert (= bs!19172 d!78230))

(declare-fun m!353859 () Bool)

(assert (=> bs!19172 m!353859))

(assert (=> start!48678 d!78230))

(declare-fun d!78232 () Bool)

(assert (=> d!78232 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5152 (buf!5693 b1!101))) ((_ sign_extend 32) (currentByte!10671 b1!101)) ((_ sign_extend 32) (currentBit!10666 b1!101)) bytes!19) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5152 (buf!5693 b1!101))) ((_ sign_extend 32) (currentByte!10671 b1!101)) ((_ sign_extend 32) (currentBit!10666 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19173 () Bool)

(assert (= bs!19173 d!78232))

(assert (=> bs!19173 m!353811))

(assert (=> b!230507 d!78232))

(declare-fun d!78234 () Bool)

(assert (=> d!78234 (= (remainingBits!0 ((_ sign_extend 32) (size!5152 (buf!5693 b1!101))) ((_ sign_extend 32) (currentByte!10671 b1!101)) ((_ sign_extend 32) (currentBit!10666 b1!101))) (bvsub (bvmul ((_ sign_extend 32) (size!5152 (buf!5693 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10671 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10666 b1!101)))))))

(assert (=> b!230506 d!78234))

(declare-fun d!78236 () Bool)

(declare-fun e!158359 () Bool)

(assert (=> d!78236 e!158359))

(declare-fun res!193243 () Bool)

(assert (=> d!78236 (=> (not res!193243) (not e!158359))))

(declare-fun lt!368156 () (_ BitVec 64))

(declare-fun lt!368155 () (_ BitVec 64))

(declare-fun lt!368158 () (_ BitVec 64))

(assert (=> d!78236 (= res!193243 (= lt!368158 (bvsub lt!368155 lt!368156)))))

(assert (=> d!78236 (or (= (bvand lt!368155 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!368156 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!368155 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!368155 lt!368156) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78236 (= lt!368156 (remainingBits!0 ((_ sign_extend 32) (size!5152 (buf!5693 b2!99))) ((_ sign_extend 32) (currentByte!10671 b2!99)) ((_ sign_extend 32) (currentBit!10666 b2!99))))))

(declare-fun lt!368157 () (_ BitVec 64))

(declare-fun lt!368159 () (_ BitVec 64))

(assert (=> d!78236 (= lt!368155 (bvmul lt!368157 lt!368159))))

(assert (=> d!78236 (or (= lt!368157 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!368159 (bvsdiv (bvmul lt!368157 lt!368159) lt!368157)))))

(assert (=> d!78236 (= lt!368159 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78236 (= lt!368157 ((_ sign_extend 32) (size!5152 (buf!5693 b2!99))))))

(assert (=> d!78236 (= lt!368158 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10671 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10666 b2!99))))))

(assert (=> d!78236 (invariant!0 (currentBit!10666 b2!99) (currentByte!10671 b2!99) (size!5152 (buf!5693 b2!99)))))

(assert (=> d!78236 (= (bitIndex!0 (size!5152 (buf!5693 b2!99)) (currentByte!10671 b2!99) (currentBit!10666 b2!99)) lt!368158)))

(declare-fun b!230558 () Bool)

(declare-fun res!193242 () Bool)

(assert (=> b!230558 (=> (not res!193242) (not e!158359))))

(assert (=> b!230558 (= res!193242 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!368158))))

(declare-fun b!230559 () Bool)

(declare-fun lt!368160 () (_ BitVec 64))

(assert (=> b!230559 (= e!158359 (bvsle lt!368158 (bvmul lt!368160 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!230559 (or (= lt!368160 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!368160 #b0000000000000000000000000000000000000000000000000000000000001000) lt!368160)))))

(assert (=> b!230559 (= lt!368160 ((_ sign_extend 32) (size!5152 (buf!5693 b2!99))))))

(assert (= (and d!78236 res!193243) b!230558))

(assert (= (and b!230558 res!193242) b!230559))

(declare-fun m!353861 () Bool)

(assert (=> d!78236 m!353861))

(assert (=> d!78236 m!353859))

(assert (=> b!230511 d!78236))

(declare-fun d!78238 () Bool)

(assert (=> d!78238 (= (array_inv!4893 (buf!5693 b2!99)) (bvsge (size!5152 (buf!5693 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!230505 d!78238))

(declare-fun d!78240 () Bool)

(declare-fun e!158360 () Bool)

(assert (=> d!78240 e!158360))

(declare-fun res!193245 () Bool)

(assert (=> d!78240 (=> (not res!193245) (not e!158360))))

(declare-fun lt!368164 () (_ BitVec 64))

(declare-fun lt!368162 () (_ BitVec 64))

(declare-fun lt!368161 () (_ BitVec 64))

(assert (=> d!78240 (= res!193245 (= lt!368164 (bvsub lt!368161 lt!368162)))))

(assert (=> d!78240 (or (= (bvand lt!368161 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!368162 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!368161 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!368161 lt!368162) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78240 (= lt!368162 (remainingBits!0 ((_ sign_extend 32) (size!5152 (buf!5693 b1!101))) ((_ sign_extend 32) (currentByte!10671 b1!101)) ((_ sign_extend 32) (currentBit!10666 b1!101))))))

(declare-fun lt!368163 () (_ BitVec 64))

(declare-fun lt!368165 () (_ BitVec 64))

(assert (=> d!78240 (= lt!368161 (bvmul lt!368163 lt!368165))))

(assert (=> d!78240 (or (= lt!368163 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!368165 (bvsdiv (bvmul lt!368163 lt!368165) lt!368163)))))

(assert (=> d!78240 (= lt!368165 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78240 (= lt!368163 ((_ sign_extend 32) (size!5152 (buf!5693 b1!101))))))

(assert (=> d!78240 (= lt!368164 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10671 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10666 b1!101))))))

(assert (=> d!78240 (invariant!0 (currentBit!10666 b1!101) (currentByte!10671 b1!101) (size!5152 (buf!5693 b1!101)))))

(assert (=> d!78240 (= (bitIndex!0 (size!5152 (buf!5693 b1!101)) (currentByte!10671 b1!101) (currentBit!10666 b1!101)) lt!368164)))

(declare-fun b!230560 () Bool)

(declare-fun res!193244 () Bool)

(assert (=> b!230560 (=> (not res!193244) (not e!158360))))

(assert (=> b!230560 (= res!193244 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!368164))))

(declare-fun b!230561 () Bool)

(declare-fun lt!368166 () (_ BitVec 64))

(assert (=> b!230561 (= e!158360 (bvsle lt!368164 (bvmul lt!368166 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!230561 (or (= lt!368166 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!368166 #b0000000000000000000000000000000000000000000000000000000000001000) lt!368166)))))

(assert (=> b!230561 (= lt!368166 ((_ sign_extend 32) (size!5152 (buf!5693 b1!101))))))

(assert (= (and d!78240 res!193245) b!230560))

(assert (= (and b!230560 res!193244) b!230561))

(assert (=> d!78240 m!353811))

(assert (=> d!78240 m!353857))

(assert (=> b!230510 d!78240))

(push 1)

(assert (not d!78240))

(assert (not d!78228))

(assert (not d!78232))

(assert (not d!78236))

(assert (not d!78230))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

