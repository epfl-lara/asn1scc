; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48788 () Bool)

(assert start!48788)

(declare-fun b!230918 () Bool)

(declare-fun res!193484 () Bool)

(declare-fun e!158718 () Bool)

(assert (=> b!230918 (=> (not res!193484) (not e!158718))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-datatypes ((array!11808 0))(
  ( (array!11809 (arr!6161 (Array (_ BitVec 32) (_ BitVec 8))) (size!5174 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9444 0))(
  ( (BitStream!9445 (buf!5715 array!11808) (currentByte!10710 (_ BitVec 32)) (currentBit!10705 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9444)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!230918 (= res!193484 (bvsle bits!86 (bitIndex!0 (size!5174 (buf!5715 b2!99)) (currentByte!10710 b2!99) (currentBit!10705 b2!99))))))

(declare-fun b!230921 () Bool)

(declare-fun e!158716 () Bool)

(declare-fun array_inv!4915 (array!11808) Bool)

(assert (=> b!230921 (= e!158716 (array_inv!4915 (buf!5715 b2!99)))))

(declare-fun b!230919 () Bool)

(assert (=> b!230919 (= e!158718 (bvsge (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))

(declare-fun b!230920 () Bool)

(declare-fun e!158720 () Bool)

(declare-fun b1!101 () BitStream!9444)

(assert (=> b!230920 (= e!158720 (array_inv!4915 (buf!5715 b1!101)))))

(declare-fun res!193485 () Bool)

(assert (=> start!48788 (=> (not res!193485) (not e!158718))))

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> start!48788 (= res!193485 (and (= (size!5174 (buf!5715 b1!101)) (size!5174 (buf!5715 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48788 e!158718))

(declare-fun inv!12 (BitStream!9444) Bool)

(assert (=> start!48788 (and (inv!12 b1!101) e!158720)))

(assert (=> start!48788 (and (inv!12 b2!99) e!158716)))

(assert (=> start!48788 true))

(assert (= (and start!48788 res!193485) b!230918))

(assert (= (and b!230918 res!193484) b!230919))

(assert (= start!48788 b!230920))

(assert (= start!48788 b!230921))

(declare-fun m!354147 () Bool)

(assert (=> b!230918 m!354147))

(declare-fun m!354149 () Bool)

(assert (=> b!230921 m!354149))

(declare-fun m!354151 () Bool)

(assert (=> b!230920 m!354151))

(declare-fun m!354153 () Bool)

(assert (=> start!48788 m!354153))

(declare-fun m!354155 () Bool)

(assert (=> start!48788 m!354155))

(check-sat (not b!230918) (not b!230920) (not start!48788) (not b!230921))
(check-sat)
(get-model)

(declare-fun d!78346 () Bool)

(declare-fun e!158738 () Bool)

(assert (=> d!78346 e!158738))

(declare-fun res!193497 () Bool)

(assert (=> d!78346 (=> (not res!193497) (not e!158738))))

(declare-fun lt!368408 () (_ BitVec 64))

(declare-fun lt!368405 () (_ BitVec 64))

(declare-fun lt!368406 () (_ BitVec 64))

(assert (=> d!78346 (= res!193497 (= lt!368408 (bvsub lt!368406 lt!368405)))))

(assert (=> d!78346 (or (= (bvand lt!368406 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!368405 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!368406 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!368406 lt!368405) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!78346 (= lt!368405 (remainingBits!0 ((_ sign_extend 32) (size!5174 (buf!5715 b2!99))) ((_ sign_extend 32) (currentByte!10710 b2!99)) ((_ sign_extend 32) (currentBit!10705 b2!99))))))

(declare-fun lt!368404 () (_ BitVec 64))

(declare-fun lt!368407 () (_ BitVec 64))

(assert (=> d!78346 (= lt!368406 (bvmul lt!368404 lt!368407))))

(assert (=> d!78346 (or (= lt!368404 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!368407 (bvsdiv (bvmul lt!368404 lt!368407) lt!368404)))))

(assert (=> d!78346 (= lt!368407 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78346 (= lt!368404 ((_ sign_extend 32) (size!5174 (buf!5715 b2!99))))))

(assert (=> d!78346 (= lt!368408 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10710 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10705 b2!99))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!78346 (invariant!0 (currentBit!10705 b2!99) (currentByte!10710 b2!99) (size!5174 (buf!5715 b2!99)))))

(assert (=> d!78346 (= (bitIndex!0 (size!5174 (buf!5715 b2!99)) (currentByte!10710 b2!99) (currentBit!10705 b2!99)) lt!368408)))

(declare-fun b!230938 () Bool)

(declare-fun res!193496 () Bool)

(assert (=> b!230938 (=> (not res!193496) (not e!158738))))

(assert (=> b!230938 (= res!193496 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!368408))))

(declare-fun b!230939 () Bool)

(declare-fun lt!368409 () (_ BitVec 64))

(assert (=> b!230939 (= e!158738 (bvsle lt!368408 (bvmul lt!368409 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!230939 (or (= lt!368409 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!368409 #b0000000000000000000000000000000000000000000000000000000000001000) lt!368409)))))

(assert (=> b!230939 (= lt!368409 ((_ sign_extend 32) (size!5174 (buf!5715 b2!99))))))

(assert (= (and d!78346 res!193497) b!230938))

(assert (= (and b!230938 res!193496) b!230939))

(declare-fun m!354167 () Bool)

(assert (=> d!78346 m!354167))

(declare-fun m!354169 () Bool)

(assert (=> d!78346 m!354169))

(assert (=> b!230918 d!78346))

(declare-fun d!78348 () Bool)

(assert (=> d!78348 (= (array_inv!4915 (buf!5715 b1!101)) (bvsge (size!5174 (buf!5715 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!230920 d!78348))

(declare-fun d!78350 () Bool)

(assert (=> d!78350 (= (inv!12 b1!101) (invariant!0 (currentBit!10705 b1!101) (currentByte!10710 b1!101) (size!5174 (buf!5715 b1!101))))))

(declare-fun bs!19213 () Bool)

(assert (= bs!19213 d!78350))

(declare-fun m!354171 () Bool)

(assert (=> bs!19213 m!354171))

(assert (=> start!48788 d!78350))

(declare-fun d!78352 () Bool)

(assert (=> d!78352 (= (inv!12 b2!99) (invariant!0 (currentBit!10705 b2!99) (currentByte!10710 b2!99) (size!5174 (buf!5715 b2!99))))))

(declare-fun bs!19214 () Bool)

(assert (= bs!19214 d!78352))

(assert (=> bs!19214 m!354169))

(assert (=> start!48788 d!78352))

(declare-fun d!78354 () Bool)

(assert (=> d!78354 (= (array_inv!4915 (buf!5715 b2!99)) (bvsge (size!5174 (buf!5715 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!230921 d!78354))

(check-sat (not d!78350) (not d!78346) (not d!78352))
