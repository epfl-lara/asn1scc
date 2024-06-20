; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73460 () Bool)

(assert start!73460)

(declare-fun res!267246 () Bool)

(declare-fun e!234854 () Bool)

(assert (=> start!73460 (=> (not res!267246) (not e!234854))))

(declare-fun currentBit!38 () (_ BitVec 32))

(declare-fun bufLength!19 () (_ BitVec 32))

(declare-fun currentByte!43 () (_ BitVec 32))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> start!73460 (= res!267246 (invariant!0 currentBit!38 currentByte!43 bufLength!19))))

(assert (=> start!73460 e!234854))

(assert (=> start!73460 true))

(declare-fun b!325650 () Bool)

(declare-fun e!234855 () Bool)

(assert (=> b!325650 (= e!234854 e!234855)))

(declare-fun res!267247 () Bool)

(assert (=> b!325650 (=> (not res!267247) (not e!234855))))

(declare-fun lt!448213 () (_ BitVec 64))

(declare-fun lt!448217 () (_ BitVec 64))

(assert (=> b!325650 (= res!267247 (or (not (= lt!448213 (bvand ((_ sign_extend 32) currentBit!38) #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!448213 (bvand (bvadd lt!448217 ((_ sign_extend 32) currentBit!38)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!325650 (= lt!448213 (bvand lt!448217 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!325650 (= lt!448217 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) currentByte!43)))))

(declare-fun lt!448214 () (_ BitVec 64))

(declare-fun lt!448215 () (_ BitVec 64))

(declare-fun b!325651 () Bool)

(declare-fun lt!448216 () (_ BitVec 64))

(assert (=> b!325651 (= e!234855 (and (not (= lt!448215 (bvand lt!448214 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= lt!448215 (bvand (bvsub lt!448216 lt!448214) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!325651 (= lt!448215 (bvand lt!448216 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!325651 (= lt!448214 (remainingBits!0 ((_ sign_extend 32) bufLength!19) ((_ sign_extend 32) currentByte!43) ((_ sign_extend 32) currentBit!38)))))

(assert (=> b!325651 (= lt!448216 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) bufLength!19)))))

(assert (= (and start!73460 res!267246) b!325650))

(assert (= (and b!325650 res!267247) b!325651))

(declare-fun m!463623 () Bool)

(assert (=> start!73460 m!463623))

(declare-fun m!463625 () Bool)

(assert (=> b!325651 m!463625))

(push 1)

(assert (not start!73460))

(assert (not b!325651))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107408 () Bool)

(assert (=> d!107408 (= (invariant!0 currentBit!38 currentByte!43 bufLength!19) (and (bvsge currentBit!38 #b00000000000000000000000000000000) (bvslt currentBit!38 #b00000000000000000000000000001000) (bvsge currentByte!43 #b00000000000000000000000000000000) (or (bvslt currentByte!43 bufLength!19) (and (= currentBit!38 #b00000000000000000000000000000000) (= currentByte!43 bufLength!19)))))))

(assert (=> start!73460 d!107408))

(declare-fun d!107410 () Bool)

(assert (=> d!107410 (= (remainingBits!0 ((_ sign_extend 32) bufLength!19) ((_ sign_extend 32) currentByte!43) ((_ sign_extend 32) currentBit!38)) (bvsub (bvmul ((_ sign_extend 32) bufLength!19) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) currentByte!43) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) currentBit!38))))))

(assert (=> b!325651 d!107410))

(push 1)

(check-sat)

