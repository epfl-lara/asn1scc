; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61392 () Bool)

(assert start!61392)

(declare-fun res!229450 () Bool)

(declare-fun e!196039 () Bool)

(assert (=> start!61392 (=> (not res!229450) (not e!196039))))

(declare-datatypes ((array!15783 0))(
  ( (array!15784 (arr!7829 (Array (_ BitVec 32) (_ BitVec 8))) (size!6836 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12486 0))(
  ( (BitStream!12487 (buf!7304 array!15783) (currentByte!13500 (_ BitVec 32)) (currentBit!13495 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12486)

(declare-fun bs2!19 () BitStream!12486)

(assert (=> start!61392 (= res!229450 (= (size!6836 (buf!7304 bs1!11)) (size!6836 (buf!7304 bs2!19))))))

(assert (=> start!61392 e!196039))

(declare-fun e!196043 () Bool)

(declare-fun inv!12 (BitStream!12486) Bool)

(assert (=> start!61392 (and (inv!12 bs1!11) e!196043)))

(declare-fun e!196041 () Bool)

(assert (=> start!61392 (and (inv!12 bs2!19) e!196041)))

(declare-fun b!276092 () Bool)

(declare-fun array_inv!6560 (array!15783) Bool)

(assert (=> b!276092 (= e!196043 (array_inv!6560 (buf!7304 bs1!11)))))

(declare-fun b!276093 () Bool)

(assert (=> b!276093 (= e!196041 (array_inv!6560 (buf!7304 bs2!19)))))

(declare-fun b!276090 () Bool)

(declare-fun res!229449 () Bool)

(assert (=> b!276090 (=> (not res!229449) (not e!196039))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!276090 (= res!229449 (validate_offset_bit!0 ((_ sign_extend 32) (size!6836 (buf!7304 bs1!11))) ((_ sign_extend 32) (currentByte!13500 bs1!11)) ((_ sign_extend 32) (currentBit!13495 bs1!11))))))

(declare-fun b!276091 () Bool)

(declare-fun lt!414270 () (_ BitVec 64))

(declare-fun lt!414269 () (_ BitVec 64))

(assert (=> b!276091 (= e!196039 (and (= lt!414270 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= lt!414270 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!414269) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!276091 (= lt!414270 (bvand lt!414269 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!276091 (= lt!414269 (bitIndex!0 (size!6836 (buf!7304 bs1!11)) (currentByte!13500 bs1!11) (currentBit!13495 bs1!11)))))

(assert (= (and start!61392 res!229450) b!276090))

(assert (= (and b!276090 res!229449) b!276091))

(assert (= start!61392 b!276092))

(assert (= start!61392 b!276093))

(declare-fun m!409073 () Bool)

(assert (=> b!276092 m!409073))

(declare-fun m!409075 () Bool)

(assert (=> b!276091 m!409075))

(declare-fun m!409077 () Bool)

(assert (=> b!276090 m!409077))

(declare-fun m!409079 () Bool)

(assert (=> b!276093 m!409079))

(declare-fun m!409081 () Bool)

(assert (=> start!61392 m!409081))

(declare-fun m!409083 () Bool)

(assert (=> start!61392 m!409083))

(check-sat (not b!276091) (not b!276090) (not b!276092) (not b!276093) (not start!61392))
(check-sat)
(get-model)

(declare-fun d!95052 () Bool)

(declare-fun e!196064 () Bool)

(assert (=> d!95052 e!196064))

(declare-fun res!229468 () Bool)

(assert (=> d!95052 (=> (not res!229468) (not e!196064))))

(declare-fun lt!414307 () (_ BitVec 64))

(declare-fun lt!414309 () (_ BitVec 64))

(declare-fun lt!414308 () (_ BitVec 64))

(assert (=> d!95052 (= res!229468 (= lt!414307 (bvsub lt!414309 lt!414308)))))

(assert (=> d!95052 (or (= (bvand lt!414309 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!414308 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!414309 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!414309 lt!414308) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!95052 (= lt!414308 (remainingBits!0 ((_ sign_extend 32) (size!6836 (buf!7304 bs1!11))) ((_ sign_extend 32) (currentByte!13500 bs1!11)) ((_ sign_extend 32) (currentBit!13495 bs1!11))))))

(declare-fun lt!414310 () (_ BitVec 64))

(declare-fun lt!414312 () (_ BitVec 64))

(assert (=> d!95052 (= lt!414309 (bvmul lt!414310 lt!414312))))

(assert (=> d!95052 (or (= lt!414310 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!414312 (bvsdiv (bvmul lt!414310 lt!414312) lt!414310)))))

(assert (=> d!95052 (= lt!414312 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!95052 (= lt!414310 ((_ sign_extend 32) (size!6836 (buf!7304 bs1!11))))))

(assert (=> d!95052 (= lt!414307 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13500 bs1!11)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13495 bs1!11))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!95052 (invariant!0 (currentBit!13495 bs1!11) (currentByte!13500 bs1!11) (size!6836 (buf!7304 bs1!11)))))

(assert (=> d!95052 (= (bitIndex!0 (size!6836 (buf!7304 bs1!11)) (currentByte!13500 bs1!11) (currentBit!13495 bs1!11)) lt!414307)))

(declare-fun b!276116 () Bool)

(declare-fun res!229467 () Bool)

(assert (=> b!276116 (=> (not res!229467) (not e!196064))))

(assert (=> b!276116 (= res!229467 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!414307))))

(declare-fun b!276117 () Bool)

(declare-fun lt!414311 () (_ BitVec 64))

(assert (=> b!276117 (= e!196064 (bvsle lt!414307 (bvmul lt!414311 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!276117 (or (= lt!414311 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!414311 #b0000000000000000000000000000000000000000000000000000000000001000) lt!414311)))))

(assert (=> b!276117 (= lt!414311 ((_ sign_extend 32) (size!6836 (buf!7304 bs1!11))))))

(assert (= (and d!95052 res!229468) b!276116))

(assert (= (and b!276116 res!229467) b!276117))

(declare-fun m!409107 () Bool)

(assert (=> d!95052 m!409107))

(declare-fun m!409109 () Bool)

(assert (=> d!95052 m!409109))

(assert (=> b!276091 d!95052))

(declare-fun d!95068 () Bool)

(assert (=> d!95068 (= (inv!12 bs1!11) (invariant!0 (currentBit!13495 bs1!11) (currentByte!13500 bs1!11) (size!6836 (buf!7304 bs1!11))))))

(declare-fun bs!23963 () Bool)

(assert (= bs!23963 d!95068))

(assert (=> bs!23963 m!409109))

(assert (=> start!61392 d!95068))

(declare-fun d!95070 () Bool)

(assert (=> d!95070 (= (inv!12 bs2!19) (invariant!0 (currentBit!13495 bs2!19) (currentByte!13500 bs2!19) (size!6836 (buf!7304 bs2!19))))))

(declare-fun bs!23964 () Bool)

(assert (= bs!23964 d!95070))

(declare-fun m!409111 () Bool)

(assert (=> bs!23964 m!409111))

(assert (=> start!61392 d!95070))

(declare-fun d!95072 () Bool)

(assert (=> d!95072 (= (array_inv!6560 (buf!7304 bs1!11)) (bvsge (size!6836 (buf!7304 bs1!11)) #b00000000000000000000000000000000))))

(assert (=> b!276092 d!95072))

(declare-fun d!95074 () Bool)

(assert (=> d!95074 (= (array_inv!6560 (buf!7304 bs2!19)) (bvsge (size!6836 (buf!7304 bs2!19)) #b00000000000000000000000000000000))))

(assert (=> b!276093 d!95074))

(declare-fun d!95076 () Bool)

(assert (=> d!95076 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6836 (buf!7304 bs1!11))) ((_ sign_extend 32) (currentByte!13500 bs1!11)) ((_ sign_extend 32) (currentBit!13495 bs1!11))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6836 (buf!7304 bs1!11))) ((_ sign_extend 32) (currentByte!13500 bs1!11)) ((_ sign_extend 32) (currentBit!13495 bs1!11))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!23965 () Bool)

(assert (= bs!23965 d!95076))

(assert (=> bs!23965 m!409107))

(assert (=> b!276090 d!95076))

(check-sat (not d!95070) (not d!95068) (not d!95076) (not d!95052))
