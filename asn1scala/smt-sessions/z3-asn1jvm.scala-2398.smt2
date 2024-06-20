; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61120 () Bool)

(assert start!61120)

(declare-fun b!275250 () Bool)

(declare-fun e!195222 () Bool)

(declare-datatypes ((array!15702 0))(
  ( (array!15703 (arr!7787 (Array (_ BitVec 32) (_ BitVec 8))) (size!6800 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12414 0))(
  ( (BitStream!12415 (buf!7268 array!15702) (currentByte!13435 (_ BitVec 32)) (currentBit!13430 (_ BitVec 32))) )
))
(declare-fun bs2!19 () BitStream!12414)

(declare-fun array_inv!6524 (array!15702) Bool)

(assert (=> b!275250 (= e!195222 (array_inv!6524 (buf!7268 bs2!19)))))

(declare-fun res!228858 () Bool)

(declare-fun e!195226 () Bool)

(assert (=> start!61120 (=> (not res!228858) (not e!195226))))

(declare-fun bs1!11 () BitStream!12414)

(assert (=> start!61120 (= res!228858 (= (size!6800 (buf!7268 bs1!11)) (size!6800 (buf!7268 bs2!19))))))

(assert (=> start!61120 e!195226))

(declare-fun e!195224 () Bool)

(declare-fun inv!12 (BitStream!12414) Bool)

(assert (=> start!61120 (and (inv!12 bs1!11) e!195224)))

(assert (=> start!61120 (and (inv!12 bs2!19) e!195222)))

(declare-fun b!275249 () Bool)

(assert (=> b!275249 (= e!195224 (array_inv!6524 (buf!7268 bs1!11)))))

(declare-fun b!275248 () Bool)

(declare-fun lt!413480 () (_ BitVec 64))

(assert (=> b!275248 (= e!195226 (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!413480) (bvsgt lt!413480 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6800 (buf!7268 bs1!11)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!275248 (= lt!413480 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6800 (buf!7268 bs1!11)) (currentByte!13435 bs1!11) (currentBit!13430 bs1!11))))))

(declare-fun b!275247 () Bool)

(declare-fun res!228859 () Bool)

(assert (=> b!275247 (=> (not res!228859) (not e!195226))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!275247 (= res!228859 (validate_offset_bit!0 ((_ sign_extend 32) (size!6800 (buf!7268 bs1!11))) ((_ sign_extend 32) (currentByte!13435 bs1!11)) ((_ sign_extend 32) (currentBit!13430 bs1!11))))))

(assert (= (and start!61120 res!228858) b!275247))

(assert (= (and b!275247 res!228859) b!275248))

(assert (= start!61120 b!275249))

(assert (= start!61120 b!275250))

(declare-fun m!407833 () Bool)

(assert (=> b!275249 m!407833))

(declare-fun m!407835 () Bool)

(assert (=> b!275250 m!407835))

(declare-fun m!407837 () Bool)

(assert (=> start!61120 m!407837))

(declare-fun m!407839 () Bool)

(assert (=> start!61120 m!407839))

(declare-fun m!407841 () Bool)

(assert (=> b!275248 m!407841))

(declare-fun m!407843 () Bool)

(assert (=> b!275247 m!407843))

(check-sat (not b!275250) (not b!275249) (not b!275248) (not start!61120) (not b!275247))
(check-sat)
(get-model)

(declare-fun d!94660 () Bool)

(assert (=> d!94660 (= (array_inv!6524 (buf!7268 bs1!11)) (bvsge (size!6800 (buf!7268 bs1!11)) #b00000000000000000000000000000000))))

(assert (=> b!275249 d!94660))

(declare-fun d!94662 () Bool)

(assert (=> d!94662 (= (array_inv!6524 (buf!7268 bs2!19)) (bvsge (size!6800 (buf!7268 bs2!19)) #b00000000000000000000000000000000))))

(assert (=> b!275250 d!94662))

(declare-fun d!94664 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!94664 (= (inv!12 bs1!11) (invariant!0 (currentBit!13430 bs1!11) (currentByte!13435 bs1!11) (size!6800 (buf!7268 bs1!11))))))

(declare-fun bs!23846 () Bool)

(assert (= bs!23846 d!94664))

(declare-fun m!407857 () Bool)

(assert (=> bs!23846 m!407857))

(assert (=> start!61120 d!94664))

(declare-fun d!94666 () Bool)

(assert (=> d!94666 (= (inv!12 bs2!19) (invariant!0 (currentBit!13430 bs2!19) (currentByte!13435 bs2!19) (size!6800 (buf!7268 bs2!19))))))

(declare-fun bs!23847 () Bool)

(assert (= bs!23847 d!94666))

(declare-fun m!407859 () Bool)

(assert (=> bs!23847 m!407859))

(assert (=> start!61120 d!94666))

(declare-fun d!94668 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94668 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6800 (buf!7268 bs1!11))) ((_ sign_extend 32) (currentByte!13435 bs1!11)) ((_ sign_extend 32) (currentBit!13430 bs1!11))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6800 (buf!7268 bs1!11))) ((_ sign_extend 32) (currentByte!13435 bs1!11)) ((_ sign_extend 32) (currentBit!13430 bs1!11))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!23848 () Bool)

(assert (= bs!23848 d!94668))

(declare-fun m!407861 () Bool)

(assert (=> bs!23848 m!407861))

(assert (=> b!275247 d!94668))

(declare-fun d!94670 () Bool)

(declare-fun e!195244 () Bool)

(assert (=> d!94670 e!195244))

(declare-fun res!228871 () Bool)

(assert (=> d!94670 (=> (not res!228871) (not e!195244))))

(declare-fun lt!413500 () (_ BitVec 64))

(declare-fun lt!413497 () (_ BitVec 64))

(declare-fun lt!413499 () (_ BitVec 64))

(assert (=> d!94670 (= res!228871 (= lt!413500 (bvsub lt!413499 lt!413497)))))

(assert (=> d!94670 (or (= (bvand lt!413499 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!413497 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!413499 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!413499 lt!413497) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!94670 (= lt!413497 (remainingBits!0 ((_ sign_extend 32) (size!6800 (buf!7268 bs1!11))) ((_ sign_extend 32) (currentByte!13435 bs1!11)) ((_ sign_extend 32) (currentBit!13430 bs1!11))))))

(declare-fun lt!413498 () (_ BitVec 64))

(declare-fun lt!413501 () (_ BitVec 64))

(assert (=> d!94670 (= lt!413499 (bvmul lt!413498 lt!413501))))

(assert (=> d!94670 (or (= lt!413498 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!413501 (bvsdiv (bvmul lt!413498 lt!413501) lt!413498)))))

(assert (=> d!94670 (= lt!413501 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94670 (= lt!413498 ((_ sign_extend 32) (size!6800 (buf!7268 bs1!11))))))

(assert (=> d!94670 (= lt!413500 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13435 bs1!11)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13430 bs1!11))))))

(assert (=> d!94670 (invariant!0 (currentBit!13430 bs1!11) (currentByte!13435 bs1!11) (size!6800 (buf!7268 bs1!11)))))

(assert (=> d!94670 (= (bitIndex!0 (size!6800 (buf!7268 bs1!11)) (currentByte!13435 bs1!11) (currentBit!13430 bs1!11)) lt!413500)))

(declare-fun b!275267 () Bool)

(declare-fun res!228870 () Bool)

(assert (=> b!275267 (=> (not res!228870) (not e!195244))))

(assert (=> b!275267 (= res!228870 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413500))))

(declare-fun b!275268 () Bool)

(declare-fun lt!413496 () (_ BitVec 64))

(assert (=> b!275268 (= e!195244 (bvsle lt!413500 (bvmul lt!413496 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!275268 (or (= lt!413496 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!413496 #b0000000000000000000000000000000000000000000000000000000000001000) lt!413496)))))

(assert (=> b!275268 (= lt!413496 ((_ sign_extend 32) (size!6800 (buf!7268 bs1!11))))))

(assert (= (and d!94670 res!228871) b!275267))

(assert (= (and b!275267 res!228870) b!275268))

(assert (=> d!94670 m!407861))

(assert (=> d!94670 m!407857))

(assert (=> b!275248 d!94670))

(check-sat (not d!94664) (not d!94670) (not d!94668) (not d!94666))
(check-sat)
