; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61118 () Bool)

(assert start!61118)

(declare-fun res!228853 () Bool)

(declare-fun e!195207 () Bool)

(assert (=> start!61118 (=> (not res!228853) (not e!195207))))

(declare-datatypes ((array!15700 0))(
  ( (array!15701 (arr!7786 (Array (_ BitVec 32) (_ BitVec 8))) (size!6799 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12412 0))(
  ( (BitStream!12413 (buf!7267 array!15700) (currentByte!13434 (_ BitVec 32)) (currentBit!13429 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12412)

(declare-fun bs2!19 () BitStream!12412)

(assert (=> start!61118 (= res!228853 (= (size!6799 (buf!7267 bs1!11)) (size!6799 (buf!7267 bs2!19))))))

(assert (=> start!61118 e!195207))

(declare-fun e!195209 () Bool)

(declare-fun inv!12 (BitStream!12412) Bool)

(assert (=> start!61118 (and (inv!12 bs1!11) e!195209)))

(declare-fun e!195208 () Bool)

(assert (=> start!61118 (and (inv!12 bs2!19) e!195208)))

(declare-fun b!275237 () Bool)

(declare-fun array_inv!6523 (array!15700) Bool)

(assert (=> b!275237 (= e!195209 (array_inv!6523 (buf!7267 bs1!11)))))

(declare-fun b!275236 () Bool)

(declare-fun lt!413477 () (_ BitVec 64))

(assert (=> b!275236 (= e!195207 (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!413477) (bvsgt lt!413477 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6799 (buf!7267 bs1!11)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!275236 (= lt!413477 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6799 (buf!7267 bs1!11)) (currentByte!13434 bs1!11) (currentBit!13429 bs1!11))))))

(declare-fun b!275235 () Bool)

(declare-fun res!228852 () Bool)

(assert (=> b!275235 (=> (not res!228852) (not e!195207))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!275235 (= res!228852 (validate_offset_bit!0 ((_ sign_extend 32) (size!6799 (buf!7267 bs1!11))) ((_ sign_extend 32) (currentByte!13434 bs1!11)) ((_ sign_extend 32) (currentBit!13429 bs1!11))))))

(declare-fun b!275238 () Bool)

(assert (=> b!275238 (= e!195208 (array_inv!6523 (buf!7267 bs2!19)))))

(assert (= (and start!61118 res!228853) b!275235))

(assert (= (and b!275235 res!228852) b!275236))

(assert (= start!61118 b!275237))

(assert (= start!61118 b!275238))

(declare-fun m!407821 () Bool)

(assert (=> b!275235 m!407821))

(declare-fun m!407823 () Bool)

(assert (=> b!275237 m!407823))

(declare-fun m!407825 () Bool)

(assert (=> b!275236 m!407825))

(declare-fun m!407827 () Bool)

(assert (=> b!275238 m!407827))

(declare-fun m!407829 () Bool)

(assert (=> start!61118 m!407829))

(declare-fun m!407831 () Bool)

(assert (=> start!61118 m!407831))

(push 1)

(assert (not b!275238))

(assert (not b!275235))

(assert (not b!275236))

(assert (not start!61118))

(assert (not b!275237))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94672 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!94672 (= (inv!12 bs1!11) (invariant!0 (currentBit!13429 bs1!11) (currentByte!13434 bs1!11) (size!6799 (buf!7267 bs1!11))))))

(declare-fun bs!23849 () Bool)

(assert (= bs!23849 d!94672))

(declare-fun m!407863 () Bool)

(assert (=> bs!23849 m!407863))

(assert (=> start!61118 d!94672))

(declare-fun d!94674 () Bool)

(assert (=> d!94674 (= (inv!12 bs2!19) (invariant!0 (currentBit!13429 bs2!19) (currentByte!13434 bs2!19) (size!6799 (buf!7267 bs2!19))))))

(declare-fun bs!23850 () Bool)

(assert (= bs!23850 d!94674))

(declare-fun m!407865 () Bool)

(assert (=> bs!23850 m!407865))

(assert (=> start!61118 d!94674))

(declare-fun d!94676 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94676 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6799 (buf!7267 bs1!11))) ((_ sign_extend 32) (currentByte!13434 bs1!11)) ((_ sign_extend 32) (currentBit!13429 bs1!11))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6799 (buf!7267 bs1!11))) ((_ sign_extend 32) (currentByte!13434 bs1!11)) ((_ sign_extend 32) (currentBit!13429 bs1!11))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!23851 () Bool)

(assert (= bs!23851 d!94676))

(declare-fun m!407867 () Bool)

(assert (=> bs!23851 m!407867))

(assert (=> b!275235 d!94676))

(declare-fun d!94678 () Bool)

(declare-fun e!195247 () Bool)

(assert (=> d!94678 e!195247))

(declare-fun res!228877 () Bool)

(assert (=> d!94678 (=> (not res!228877) (not e!195247))))

(declare-fun lt!413519 () (_ BitVec 64))

(declare-fun lt!413515 () (_ BitVec 64))

(declare-fun lt!413517 () (_ BitVec 64))

(assert (=> d!94678 (= res!228877 (= lt!413519 (bvsub lt!413515 lt!413517)))))

(assert (=> d!94678 (or (= (bvand lt!413515 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!413517 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!413515 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!413515 lt!413517) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!94678 (= lt!413517 (remainingBits!0 ((_ sign_extend 32) (size!6799 (buf!7267 bs1!11))) ((_ sign_extend 32) (currentByte!13434 bs1!11)) ((_ sign_extend 32) (currentBit!13429 bs1!11))))))

(declare-fun lt!413518 () (_ BitVec 64))

(declare-fun lt!413514 () (_ BitVec 64))

(assert (=> d!94678 (= lt!413515 (bvmul lt!413518 lt!413514))))

(assert (=> d!94678 (or (= lt!413518 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!413514 (bvsdiv (bvmul lt!413518 lt!413514) lt!413518)))))

(assert (=> d!94678 (= lt!413514 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94678 (= lt!413518 ((_ sign_extend 32) (size!6799 (buf!7267 bs1!11))))))

(assert (=> d!94678 (= lt!413519 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13434 bs1!11)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13429 bs1!11))))))

(assert (=> d!94678 (invariant!0 (currentBit!13429 bs1!11) (currentByte!13434 bs1!11) (size!6799 (buf!7267 bs1!11)))))

(assert (=> d!94678 (= (bitIndex!0 (size!6799 (buf!7267 bs1!11)) (currentByte!13434 bs1!11) (currentBit!13429 bs1!11)) lt!413519)))

(declare-fun b!275273 () Bool)

(declare-fun res!228876 () Bool)

(assert (=> b!275273 (=> (not res!228876) (not e!195247))))

(assert (=> b!275273 (= res!228876 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413519))))

(declare-fun b!275274 () Bool)

(declare-fun lt!413516 () (_ BitVec 64))

(assert (=> b!275274 (= e!195247 (bvsle lt!413519 (bvmul lt!413516 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!275274 (or (= lt!413516 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!413516 #b0000000000000000000000000000000000000000000000000000000000001000) lt!413516)))))

(assert (=> b!275274 (= lt!413516 ((_ sign_extend 32) (size!6799 (buf!7267 bs1!11))))))

(assert (= (and d!94678 res!228877) b!275273))

(assert (= (and b!275273 res!228876) b!275274))

(assert (=> d!94678 m!407867))

(assert (=> d!94678 m!407863))

(assert (=> b!275236 d!94678))

(declare-fun d!94680 () Bool)

(assert (=> d!94680 (= (array_inv!6523 (buf!7267 bs1!11)) (bvsge (size!6799 (buf!7267 bs1!11)) #b00000000000000000000000000000000))))

(assert (=> b!275237 d!94680))

(declare-fun d!94682 () Bool)

(assert (=> d!94682 (= (array_inv!6523 (buf!7267 bs2!19)) (bvsge (size!6799 (buf!7267 bs2!19)) #b00000000000000000000000000000000))))

(assert (=> b!275238 d!94682))

(push 1)

(assert (not d!94678))

(assert (not d!94674))

(assert (not d!94676))

(assert (not d!94672))

(check-sat)

(pop 1)

(push 1)

(check-sat)

