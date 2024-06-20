; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61390 () Bool)

(assert start!61390)

(declare-fun b!276079 () Bool)

(declare-fun e!196027 () Bool)

(declare-fun lt!414263 () (_ BitVec 64))

(declare-fun lt!414264 () (_ BitVec 64))

(assert (=> b!276079 (= e!196027 (and (= lt!414263 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= lt!414263 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!414264) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!276079 (= lt!414263 (bvand lt!414264 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((array!15781 0))(
  ( (array!15782 (arr!7828 (Array (_ BitVec 32) (_ BitVec 8))) (size!6835 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12484 0))(
  ( (BitStream!12485 (buf!7303 array!15781) (currentByte!13499 (_ BitVec 32)) (currentBit!13494 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12484)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!276079 (= lt!414264 (bitIndex!0 (size!6835 (buf!7303 bs1!11)) (currentByte!13499 bs1!11) (currentBit!13494 bs1!11)))))

(declare-fun b!276081 () Bool)

(declare-fun e!196026 () Bool)

(declare-fun bs2!19 () BitStream!12484)

(declare-fun array_inv!6559 (array!15781) Bool)

(assert (=> b!276081 (= e!196026 (array_inv!6559 (buf!7303 bs2!19)))))

(declare-fun b!276080 () Bool)

(declare-fun e!196024 () Bool)

(assert (=> b!276080 (= e!196024 (array_inv!6559 (buf!7303 bs1!11)))))

(declare-fun b!276078 () Bool)

(declare-fun res!229443 () Bool)

(assert (=> b!276078 (=> (not res!229443) (not e!196027))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!276078 (= res!229443 (validate_offset_bit!0 ((_ sign_extend 32) (size!6835 (buf!7303 bs1!11))) ((_ sign_extend 32) (currentByte!13499 bs1!11)) ((_ sign_extend 32) (currentBit!13494 bs1!11))))))

(declare-fun res!229444 () Bool)

(assert (=> start!61390 (=> (not res!229444) (not e!196027))))

(assert (=> start!61390 (= res!229444 (= (size!6835 (buf!7303 bs1!11)) (size!6835 (buf!7303 bs2!19))))))

(assert (=> start!61390 e!196027))

(declare-fun inv!12 (BitStream!12484) Bool)

(assert (=> start!61390 (and (inv!12 bs1!11) e!196024)))

(assert (=> start!61390 (and (inv!12 bs2!19) e!196026)))

(assert (= (and start!61390 res!229444) b!276078))

(assert (= (and b!276078 res!229443) b!276079))

(assert (= start!61390 b!276080))

(assert (= start!61390 b!276081))

(declare-fun m!409061 () Bool)

(assert (=> b!276081 m!409061))

(declare-fun m!409063 () Bool)

(assert (=> b!276080 m!409063))

(declare-fun m!409065 () Bool)

(assert (=> start!61390 m!409065))

(declare-fun m!409067 () Bool)

(assert (=> start!61390 m!409067))

(declare-fun m!409069 () Bool)

(assert (=> b!276079 m!409069))

(declare-fun m!409071 () Bool)

(assert (=> b!276078 m!409071))

(push 1)

(assert (not b!276078))

(assert (not b!276081))

(assert (not start!61390))

(assert (not b!276080))

(assert (not b!276079))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!95044 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!95044 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6835 (buf!7303 bs1!11))) ((_ sign_extend 32) (currentByte!13499 bs1!11)) ((_ sign_extend 32) (currentBit!13494 bs1!11))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6835 (buf!7303 bs1!11))) ((_ sign_extend 32) (currentByte!13499 bs1!11)) ((_ sign_extend 32) (currentBit!13494 bs1!11))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!23958 () Bool)

(assert (= bs!23958 d!95044))

(declare-fun m!409097 () Bool)

(assert (=> bs!23958 m!409097))

(assert (=> b!276078 d!95044))

(declare-fun d!95046 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!95046 (= (inv!12 bs1!11) (invariant!0 (currentBit!13494 bs1!11) (currentByte!13499 bs1!11) (size!6835 (buf!7303 bs1!11))))))

(declare-fun bs!23959 () Bool)

(assert (= bs!23959 d!95046))

(declare-fun m!409099 () Bool)

(assert (=> bs!23959 m!409099))

(assert (=> start!61390 d!95046))

(declare-fun d!95048 () Bool)

(assert (=> d!95048 (= (inv!12 bs2!19) (invariant!0 (currentBit!13494 bs2!19) (currentByte!13499 bs2!19) (size!6835 (buf!7303 bs2!19))))))

(declare-fun bs!23960 () Bool)

(assert (= bs!23960 d!95048))

(declare-fun m!409101 () Bool)

(assert (=> bs!23960 m!409101))

(assert (=> start!61390 d!95048))

(declare-fun d!95050 () Bool)

(declare-fun e!196061 () Bool)

(assert (=> d!95050 e!196061))

(declare-fun res!229462 () Bool)

(assert (=> d!95050 (=> (not res!229462) (not e!196061))))

(declare-fun lt!414293 () (_ BitVec 64))

(declare-fun lt!414292 () (_ BitVec 64))

(declare-fun lt!414294 () (_ BitVec 64))

(assert (=> d!95050 (= res!229462 (= lt!414294 (bvsub lt!414293 lt!414292)))))

(assert (=> d!95050 (or (= (bvand lt!414293 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!414292 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!414293 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!414293 lt!414292) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!95050 (= lt!414292 (remainingBits!0 ((_ sign_extend 32) (size!6835 (buf!7303 bs1!11))) ((_ sign_extend 32) (currentByte!13499 bs1!11)) ((_ sign_extend 32) (currentBit!13494 bs1!11))))))

(declare-fun lt!414289 () (_ BitVec 64))

(declare-fun lt!414291 () (_ BitVec 64))

(assert (=> d!95050 (= lt!414293 (bvmul lt!414289 lt!414291))))

(assert (=> d!95050 (or (= lt!414289 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!414291 (bvsdiv (bvmul lt!414289 lt!414291) lt!414289)))))

(assert (=> d!95050 (= lt!414291 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!95050 (= lt!414289 ((_ sign_extend 32) (size!6835 (buf!7303 bs1!11))))))

(assert (=> d!95050 (= lt!414294 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13499 bs1!11)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13494 bs1!11))))))

(assert (=> d!95050 (invariant!0 (currentBit!13494 bs1!11) (currentByte!13499 bs1!11) (size!6835 (buf!7303 bs1!11)))))

(assert (=> d!95050 (= (bitIndex!0 (size!6835 (buf!7303 bs1!11)) (currentByte!13499 bs1!11) (currentBit!13494 bs1!11)) lt!414294)))

(declare-fun b!276110 () Bool)

(declare-fun res!229461 () Bool)

(assert (=> b!276110 (=> (not res!229461) (not e!196061))))

(assert (=> b!276110 (= res!229461 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!414294))))

(declare-fun b!276111 () Bool)

(declare-fun lt!414290 () (_ BitVec 64))

(assert (=> b!276111 (= e!196061 (bvsle lt!414294 (bvmul lt!414290 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!276111 (or (= lt!414290 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!414290 #b0000000000000000000000000000000000000000000000000000000000001000) lt!414290)))))

(assert (=> b!276111 (= lt!414290 ((_ sign_extend 32) (size!6835 (buf!7303 bs1!11))))))

(assert (= (and d!95050 res!229462) b!276110))

(assert (= (and b!276110 res!229461) b!276111))

(assert (=> d!95050 m!409097))

(assert (=> d!95050 m!409099))

(assert (=> b!276079 d!95050))

(declare-fun d!95064 () Bool)

(assert (=> d!95064 (= (array_inv!6559 (buf!7303 bs2!19)) (bvsge (size!6835 (buf!7303 bs2!19)) #b00000000000000000000000000000000))))

(assert (=> b!276081 d!95064))

(declare-fun d!95066 () Bool)

(assert (=> d!95066 (= (array_inv!6559 (buf!7303 bs1!11)) (bvsge (size!6835 (buf!7303 bs1!11)) #b00000000000000000000000000000000))))

(assert (=> b!276080 d!95066))

(push 1)

(assert (not d!95050))

(assert (not d!95048))

(assert (not d!95046))

(assert (not d!95044))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

