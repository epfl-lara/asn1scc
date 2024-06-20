; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61394 () Bool)

(assert start!61394)

(declare-fun b!276104 () Bool)

(declare-fun e!196056 () Bool)

(declare-datatypes ((array!15785 0))(
  ( (array!15786 (arr!7830 (Array (_ BitVec 32) (_ BitVec 8))) (size!6837 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12488 0))(
  ( (BitStream!12489 (buf!7305 array!15785) (currentByte!13501 (_ BitVec 32)) (currentBit!13496 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12488)

(declare-fun array_inv!6561 (array!15785) Bool)

(assert (=> b!276104 (= e!196056 (array_inv!6561 (buf!7305 bs1!11)))))

(declare-fun b!276105 () Bool)

(declare-fun e!196058 () Bool)

(declare-fun bs2!19 () BitStream!12488)

(assert (=> b!276105 (= e!196058 (array_inv!6561 (buf!7305 bs2!19)))))

(declare-fun res!229456 () Bool)

(declare-fun e!196057 () Bool)

(assert (=> start!61394 (=> (not res!229456) (not e!196057))))

(assert (=> start!61394 (= res!229456 (= (size!6837 (buf!7305 bs1!11)) (size!6837 (buf!7305 bs2!19))))))

(assert (=> start!61394 e!196057))

(declare-fun inv!12 (BitStream!12488) Bool)

(assert (=> start!61394 (and (inv!12 bs1!11) e!196056)))

(assert (=> start!61394 (and (inv!12 bs2!19) e!196058)))

(declare-fun b!276102 () Bool)

(declare-fun res!229455 () Bool)

(assert (=> b!276102 (=> (not res!229455) (not e!196057))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!276102 (= res!229455 (validate_offset_bit!0 ((_ sign_extend 32) (size!6837 (buf!7305 bs1!11))) ((_ sign_extend 32) (currentByte!13501 bs1!11)) ((_ sign_extend 32) (currentBit!13496 bs1!11))))))

(declare-fun b!276103 () Bool)

(declare-fun lt!414275 () (_ BitVec 64))

(declare-fun lt!414276 () (_ BitVec 64))

(assert (=> b!276103 (= e!196057 (and (= lt!414275 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= lt!414275 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!414276) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!276103 (= lt!414275 (bvand lt!414276 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!276103 (= lt!414276 (bitIndex!0 (size!6837 (buf!7305 bs1!11)) (currentByte!13501 bs1!11) (currentBit!13496 bs1!11)))))

(assert (= (and start!61394 res!229456) b!276102))

(assert (= (and b!276102 res!229455) b!276103))

(assert (= start!61394 b!276104))

(assert (= start!61394 b!276105))

(declare-fun m!409085 () Bool)

(assert (=> b!276104 m!409085))

(declare-fun m!409087 () Bool)

(assert (=> b!276103 m!409087))

(declare-fun m!409089 () Bool)

(assert (=> b!276105 m!409089))

(declare-fun m!409091 () Bool)

(assert (=> start!61394 m!409091))

(declare-fun m!409093 () Bool)

(assert (=> start!61394 m!409093))

(declare-fun m!409095 () Bool)

(assert (=> b!276102 m!409095))

(push 1)

(assert (not b!276102))

(assert (not b!276105))

(assert (not b!276104))

(assert (not b!276103))

(assert (not start!61394))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!95054 () Bool)

(assert (=> d!95054 (= (array_inv!6561 (buf!7305 bs1!11)) (bvsge (size!6837 (buf!7305 bs1!11)) #b00000000000000000000000000000000))))

(assert (=> b!276104 d!95054))

(declare-fun d!95056 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!95056 (= (inv!12 bs1!11) (invariant!0 (currentBit!13496 bs1!11) (currentByte!13501 bs1!11) (size!6837 (buf!7305 bs1!11))))))

(declare-fun bs!23961 () Bool)

(assert (= bs!23961 d!95056))

(declare-fun m!409103 () Bool)

(assert (=> bs!23961 m!409103))

(assert (=> start!61394 d!95056))

(declare-fun d!95058 () Bool)

(assert (=> d!95058 (= (inv!12 bs2!19) (invariant!0 (currentBit!13496 bs2!19) (currentByte!13501 bs2!19) (size!6837 (buf!7305 bs2!19))))))

(declare-fun bs!23962 () Bool)

(assert (= bs!23962 d!95058))

(declare-fun m!409105 () Bool)

(assert (=> bs!23962 m!409105))

(assert (=> start!61394 d!95058))

(declare-fun d!95060 () Bool)

(assert (=> d!95060 (= (array_inv!6561 (buf!7305 bs2!19)) (bvsge (size!6837 (buf!7305 bs2!19)) #b00000000000000000000000000000000))))

(assert (=> b!276105 d!95060))

(declare-fun d!95062 () Bool)

(declare-fun e!196067 () Bool)

(assert (=> d!95062 e!196067))

(declare-fun res!229474 () Bool)

(assert (=> d!95062 (=> (not res!229474) (not e!196067))))

(declare-fun lt!414330 () (_ BitVec 64))

(declare-fun lt!414329 () (_ BitVec 64))

(declare-fun lt!414328 () (_ BitVec 64))

(assert (=> d!95062 (= res!229474 (= lt!414329 (bvsub lt!414330 lt!414328)))))

(assert (=> d!95062 (or (= (bvand lt!414330 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!414328 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!414330 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!414330 lt!414328) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!95062 (= lt!414328 (remainingBits!0 ((_ sign_extend 32) (size!6837 (buf!7305 bs1!11))) ((_ sign_extend 32) (currentByte!13501 bs1!11)) ((_ sign_extend 32) (currentBit!13496 bs1!11))))))

(declare-fun lt!414325 () (_ BitVec 64))

(declare-fun lt!414326 () (_ BitVec 64))

(assert (=> d!95062 (= lt!414330 (bvmul lt!414325 lt!414326))))

(assert (=> d!95062 (or (= lt!414325 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!414326 (bvsdiv (bvmul lt!414325 lt!414326) lt!414325)))))

(assert (=> d!95062 (= lt!414326 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!95062 (= lt!414325 ((_ sign_extend 32) (size!6837 (buf!7305 bs1!11))))))

(assert (=> d!95062 (= lt!414329 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13501 bs1!11)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13496 bs1!11))))))

(assert (=> d!95062 (invariant!0 (currentBit!13496 bs1!11) (currentByte!13501 bs1!11) (size!6837 (buf!7305 bs1!11)))))

(assert (=> d!95062 (= (bitIndex!0 (size!6837 (buf!7305 bs1!11)) (currentByte!13501 bs1!11) (currentBit!13496 bs1!11)) lt!414329)))

(declare-fun b!276122 () Bool)

(declare-fun res!229473 () Bool)

(assert (=> b!276122 (=> (not res!229473) (not e!196067))))

(assert (=> b!276122 (= res!229473 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!414329))))

(declare-fun b!276123 () Bool)

(declare-fun lt!414327 () (_ BitVec 64))

(assert (=> b!276123 (= e!196067 (bvsle lt!414329 (bvmul lt!414327 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!276123 (or (= lt!414327 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!414327 #b0000000000000000000000000000000000000000000000000000000000001000) lt!414327)))))

(assert (=> b!276123 (= lt!414327 ((_ sign_extend 32) (size!6837 (buf!7305 bs1!11))))))

(assert (= (and d!95062 res!229474) b!276122))

(assert (= (and b!276122 res!229473) b!276123))

(declare-fun m!409113 () Bool)

(assert (=> d!95062 m!409113))

(assert (=> d!95062 m!409103))

(assert (=> b!276103 d!95062))

(declare-fun d!95078 () Bool)

(assert (=> d!95078 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6837 (buf!7305 bs1!11))) ((_ sign_extend 32) (currentByte!13501 bs1!11)) ((_ sign_extend 32) (currentBit!13496 bs1!11))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6837 (buf!7305 bs1!11))) ((_ sign_extend 32) (currentByte!13501 bs1!11)) ((_ sign_extend 32) (currentBit!13496 bs1!11))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!23966 () Bool)

(assert (= bs!23966 d!95078))

(assert (=> bs!23966 m!409113))

(assert (=> b!276102 d!95078))

(push 1)

(assert (not d!95058))

(assert (not d!95062))

(assert (not d!95078))

(assert (not d!95056))

(check-sat)

(pop 1)

(push 1)

(check-sat)

