; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48704 () Bool)

(assert start!48704)

(declare-fun b!230603 () Bool)

(declare-fun e!158399 () Bool)

(declare-datatypes ((array!11766 0))(
  ( (array!11767 (arr!6143 (Array (_ BitVec 32) (_ BitVec 8))) (size!5156 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9408 0))(
  ( (BitStream!9409 (buf!5697 array!11766) (currentByte!10680 (_ BitVec 32)) (currentBit!10675 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9408)

(declare-fun array_inv!4897 (array!11766) Bool)

(assert (=> b!230603 (= e!158399 (array_inv!4897 (buf!5697 b2!99)))))

(declare-fun b!230604 () Bool)

(declare-fun res!193278 () Bool)

(declare-fun e!158397 () Bool)

(assert (=> b!230604 (=> (not res!193278) (not e!158397))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b1!101 () BitStream!9408)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!230604 (= res!193278 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5156 (buf!5697 b1!101))) ((_ sign_extend 32) (currentByte!10680 b1!101)) ((_ sign_extend 32) (currentBit!10675 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!230605 () Bool)

(declare-fun res!193279 () Bool)

(assert (=> b!230605 (=> (not res!193279) (not e!158397))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!368196 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!230605 (= res!193279 (= lt!368196 (bvadd (bitIndex!0 (size!5156 (buf!5697 b1!101)) (currentByte!10680 b1!101) (currentBit!10675 b1!101)) bits!86)))))

(declare-fun b!230606 () Bool)

(declare-fun res!193281 () Bool)

(assert (=> b!230606 (=> (not res!193281) (not e!158397))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!230606 (= res!193281 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5156 (buf!5697 b1!101))) ((_ sign_extend 32) (currentByte!10680 b1!101)) ((_ sign_extend 32) (currentBit!10675 b1!101)) bytes!19))))

(declare-fun b!230607 () Bool)

(declare-fun e!158394 () Bool)

(assert (=> b!230607 (= e!158394 e!158397)))

(declare-fun res!193277 () Bool)

(assert (=> b!230607 (=> (not res!193277) (not e!158397))))

(assert (=> b!230607 (= res!193277 (and (bvsle bits!86 lt!368196) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(assert (=> b!230607 (= lt!368196 (bitIndex!0 (size!5156 (buf!5697 b2!99)) (currentByte!10680 b2!99) (currentBit!10675 b2!99)))))

(declare-fun lt!368195 () (_ BitVec 64))

(declare-fun b!230609 () Bool)

(assert (=> b!230609 (= e!158397 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5156 (buf!5697 b1!101)))) lt!368195) #b0000000000000000000000000000000000000000000000000000000000001000)) (= lt!368196 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10680 b2!99))) ((_ sign_extend 32) (currentBit!10675 b2!99)))) (not (= (bvsub lt!368196 bits!86) lt!368195))))))

(assert (=> b!230609 (= lt!368195 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10680 b1!101))) ((_ sign_extend 32) (currentBit!10675 b1!101))))))

(declare-fun b!230608 () Bool)

(declare-fun e!158396 () Bool)

(assert (=> b!230608 (= e!158396 (array_inv!4897 (buf!5697 b1!101)))))

(declare-fun res!193280 () Bool)

(assert (=> start!48704 (=> (not res!193280) (not e!158394))))

(assert (=> start!48704 (= res!193280 (and (= (size!5156 (buf!5697 b1!101)) (size!5156 (buf!5697 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48704 e!158394))

(declare-fun inv!12 (BitStream!9408) Bool)

(assert (=> start!48704 (and (inv!12 b1!101) e!158396)))

(assert (=> start!48704 (and (inv!12 b2!99) e!158399)))

(assert (=> start!48704 true))

(assert (= (and start!48704 res!193280) b!230607))

(assert (= (and b!230607 res!193277) b!230606))

(assert (= (and b!230606 res!193281) b!230605))

(assert (= (and b!230605 res!193279) b!230604))

(assert (= (and b!230604 res!193278) b!230609))

(assert (= start!48704 b!230608))

(assert (= start!48704 b!230603))

(declare-fun m!353883 () Bool)

(assert (=> b!230606 m!353883))

(declare-fun m!353885 () Bool)

(assert (=> b!230605 m!353885))

(declare-fun m!353887 () Bool)

(assert (=> b!230607 m!353887))

(declare-fun m!353889 () Bool)

(assert (=> b!230603 m!353889))

(declare-fun m!353891 () Bool)

(assert (=> b!230608 m!353891))

(declare-fun m!353893 () Bool)

(assert (=> start!48704 m!353893))

(declare-fun m!353895 () Bool)

(assert (=> start!48704 m!353895))

(declare-fun m!353897 () Bool)

(assert (=> b!230604 m!353897))

(check-sat (not b!230604) (not b!230603) (not b!230607) (not start!48704) (not b!230608) (not b!230606) (not b!230605))
(check-sat)
(get-model)

(declare-fun d!78256 () Bool)

(declare-fun e!158420 () Bool)

(assert (=> d!78256 e!158420))

(declare-fun res!193301 () Bool)

(assert (=> d!78256 (=> (not res!193301) (not e!158420))))

(declare-fun lt!368215 () (_ BitVec 64))

(declare-fun lt!368220 () (_ BitVec 64))

(declare-fun lt!368216 () (_ BitVec 64))

(assert (=> d!78256 (= res!193301 (= lt!368216 (bvsub lt!368215 lt!368220)))))

(assert (=> d!78256 (or (= (bvand lt!368215 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!368220 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!368215 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!368215 lt!368220) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78256 (= lt!368220 (remainingBits!0 ((_ sign_extend 32) (size!5156 (buf!5697 b1!101))) ((_ sign_extend 32) (currentByte!10680 b1!101)) ((_ sign_extend 32) (currentBit!10675 b1!101))))))

(declare-fun lt!368218 () (_ BitVec 64))

(declare-fun lt!368217 () (_ BitVec 64))

(assert (=> d!78256 (= lt!368215 (bvmul lt!368218 lt!368217))))

(assert (=> d!78256 (or (= lt!368218 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!368217 (bvsdiv (bvmul lt!368218 lt!368217) lt!368218)))))

(assert (=> d!78256 (= lt!368217 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78256 (= lt!368218 ((_ sign_extend 32) (size!5156 (buf!5697 b1!101))))))

(assert (=> d!78256 (= lt!368216 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10680 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10675 b1!101))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!78256 (invariant!0 (currentBit!10675 b1!101) (currentByte!10680 b1!101) (size!5156 (buf!5697 b1!101)))))

(assert (=> d!78256 (= (bitIndex!0 (size!5156 (buf!5697 b1!101)) (currentByte!10680 b1!101) (currentBit!10675 b1!101)) lt!368216)))

(declare-fun b!230635 () Bool)

(declare-fun res!193302 () Bool)

(assert (=> b!230635 (=> (not res!193302) (not e!158420))))

(assert (=> b!230635 (= res!193302 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!368216))))

(declare-fun b!230636 () Bool)

(declare-fun lt!368219 () (_ BitVec 64))

(assert (=> b!230636 (= e!158420 (bvsle lt!368216 (bvmul lt!368219 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!230636 (or (= lt!368219 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!368219 #b0000000000000000000000000000000000000000000000000000000000001000) lt!368219)))))

(assert (=> b!230636 (= lt!368219 ((_ sign_extend 32) (size!5156 (buf!5697 b1!101))))))

(assert (= (and d!78256 res!193301) b!230635))

(assert (= (and b!230635 res!193302) b!230636))

(assert (=> d!78256 m!353897))

(declare-fun m!353915 () Bool)

(assert (=> d!78256 m!353915))

(assert (=> b!230605 d!78256))

(declare-fun d!78258 () Bool)

(assert (=> d!78258 (= (remainingBits!0 ((_ sign_extend 32) (size!5156 (buf!5697 b1!101))) ((_ sign_extend 32) (currentByte!10680 b1!101)) ((_ sign_extend 32) (currentBit!10675 b1!101))) (bvsub (bvmul ((_ sign_extend 32) (size!5156 (buf!5697 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10680 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10675 b1!101)))))))

(assert (=> b!230604 d!78258))

(declare-fun d!78260 () Bool)

(assert (=> d!78260 (= (array_inv!4897 (buf!5697 b1!101)) (bvsge (size!5156 (buf!5697 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!230608 d!78260))

(declare-fun d!78262 () Bool)

(assert (=> d!78262 (= (array_inv!4897 (buf!5697 b2!99)) (bvsge (size!5156 (buf!5697 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!230603 d!78262))

(declare-fun d!78264 () Bool)

(assert (=> d!78264 (= (inv!12 b1!101) (invariant!0 (currentBit!10675 b1!101) (currentByte!10680 b1!101) (size!5156 (buf!5697 b1!101))))))

(declare-fun bs!19180 () Bool)

(assert (= bs!19180 d!78264))

(assert (=> bs!19180 m!353915))

(assert (=> start!48704 d!78264))

(declare-fun d!78266 () Bool)

(assert (=> d!78266 (= (inv!12 b2!99) (invariant!0 (currentBit!10675 b2!99) (currentByte!10680 b2!99) (size!5156 (buf!5697 b2!99))))))

(declare-fun bs!19181 () Bool)

(assert (= bs!19181 d!78266))

(declare-fun m!353917 () Bool)

(assert (=> bs!19181 m!353917))

(assert (=> start!48704 d!78266))

(declare-fun d!78268 () Bool)

(declare-fun e!158421 () Bool)

(assert (=> d!78268 e!158421))

(declare-fun res!193303 () Bool)

(assert (=> d!78268 (=> (not res!193303) (not e!158421))))

(declare-fun lt!368221 () (_ BitVec 64))

(declare-fun lt!368226 () (_ BitVec 64))

(declare-fun lt!368222 () (_ BitVec 64))

(assert (=> d!78268 (= res!193303 (= lt!368222 (bvsub lt!368221 lt!368226)))))

(assert (=> d!78268 (or (= (bvand lt!368221 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!368226 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!368221 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!368221 lt!368226) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78268 (= lt!368226 (remainingBits!0 ((_ sign_extend 32) (size!5156 (buf!5697 b2!99))) ((_ sign_extend 32) (currentByte!10680 b2!99)) ((_ sign_extend 32) (currentBit!10675 b2!99))))))

(declare-fun lt!368224 () (_ BitVec 64))

(declare-fun lt!368223 () (_ BitVec 64))

(assert (=> d!78268 (= lt!368221 (bvmul lt!368224 lt!368223))))

(assert (=> d!78268 (or (= lt!368224 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!368223 (bvsdiv (bvmul lt!368224 lt!368223) lt!368224)))))

(assert (=> d!78268 (= lt!368223 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78268 (= lt!368224 ((_ sign_extend 32) (size!5156 (buf!5697 b2!99))))))

(assert (=> d!78268 (= lt!368222 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10680 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10675 b2!99))))))

(assert (=> d!78268 (invariant!0 (currentBit!10675 b2!99) (currentByte!10680 b2!99) (size!5156 (buf!5697 b2!99)))))

(assert (=> d!78268 (= (bitIndex!0 (size!5156 (buf!5697 b2!99)) (currentByte!10680 b2!99) (currentBit!10675 b2!99)) lt!368222)))

(declare-fun b!230637 () Bool)

(declare-fun res!193304 () Bool)

(assert (=> b!230637 (=> (not res!193304) (not e!158421))))

(assert (=> b!230637 (= res!193304 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!368222))))

(declare-fun b!230638 () Bool)

(declare-fun lt!368225 () (_ BitVec 64))

(assert (=> b!230638 (= e!158421 (bvsle lt!368222 (bvmul lt!368225 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!230638 (or (= lt!368225 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!368225 #b0000000000000000000000000000000000000000000000000000000000001000) lt!368225)))))

(assert (=> b!230638 (= lt!368225 ((_ sign_extend 32) (size!5156 (buf!5697 b2!99))))))

(assert (= (and d!78268 res!193303) b!230637))

(assert (= (and b!230637 res!193304) b!230638))

(declare-fun m!353919 () Bool)

(assert (=> d!78268 m!353919))

(assert (=> d!78268 m!353917))

(assert (=> b!230607 d!78268))

(declare-fun d!78270 () Bool)

(assert (=> d!78270 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5156 (buf!5697 b1!101))) ((_ sign_extend 32) (currentByte!10680 b1!101)) ((_ sign_extend 32) (currentBit!10675 b1!101)) bytes!19) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5156 (buf!5697 b1!101))) ((_ sign_extend 32) (currentByte!10680 b1!101)) ((_ sign_extend 32) (currentBit!10675 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19182 () Bool)

(assert (= bs!19182 d!78270))

(assert (=> bs!19182 m!353897))

(assert (=> b!230606 d!78270))

(check-sat (not d!78268) (not d!78264) (not d!78266) (not d!78256) (not d!78270))
(check-sat)
