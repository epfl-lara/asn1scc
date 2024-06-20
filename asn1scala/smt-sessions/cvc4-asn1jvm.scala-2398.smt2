; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61122 () Bool)

(assert start!61122)

(declare-fun b!275260 () Bool)

(declare-fun e!195237 () Bool)

(declare-fun lt!413483 () (_ BitVec 64))

(declare-datatypes ((array!15704 0))(
  ( (array!15705 (arr!7788 (Array (_ BitVec 32) (_ BitVec 8))) (size!6801 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12416 0))(
  ( (BitStream!12417 (buf!7269 array!15704) (currentByte!13436 (_ BitVec 32)) (currentBit!13431 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12416)

(assert (=> b!275260 (= e!195237 (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!413483) (bvsgt lt!413483 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6801 (buf!7269 bs1!11)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!275260 (= lt!413483 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6801 (buf!7269 bs1!11)) (currentByte!13436 bs1!11) (currentBit!13431 bs1!11))))))

(declare-fun b!275262 () Bool)

(declare-fun e!195238 () Bool)

(declare-fun bs2!19 () BitStream!12416)

(declare-fun array_inv!6525 (array!15704) Bool)

(assert (=> b!275262 (= e!195238 (array_inv!6525 (buf!7269 bs2!19)))))

(declare-fun b!275259 () Bool)

(declare-fun res!228864 () Bool)

(assert (=> b!275259 (=> (not res!228864) (not e!195237))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!275259 (= res!228864 (validate_offset_bit!0 ((_ sign_extend 32) (size!6801 (buf!7269 bs1!11))) ((_ sign_extend 32) (currentByte!13436 bs1!11)) ((_ sign_extend 32) (currentBit!13431 bs1!11))))))

(declare-fun b!275261 () Bool)

(declare-fun e!195241 () Bool)

(assert (=> b!275261 (= e!195241 (array_inv!6525 (buf!7269 bs1!11)))))

(declare-fun res!228865 () Bool)

(assert (=> start!61122 (=> (not res!228865) (not e!195237))))

(assert (=> start!61122 (= res!228865 (= (size!6801 (buf!7269 bs1!11)) (size!6801 (buf!7269 bs2!19))))))

(assert (=> start!61122 e!195237))

(declare-fun inv!12 (BitStream!12416) Bool)

(assert (=> start!61122 (and (inv!12 bs1!11) e!195241)))

(assert (=> start!61122 (and (inv!12 bs2!19) e!195238)))

(assert (= (and start!61122 res!228865) b!275259))

(assert (= (and b!275259 res!228864) b!275260))

(assert (= start!61122 b!275261))

(assert (= start!61122 b!275262))

(declare-fun m!407845 () Bool)

(assert (=> b!275259 m!407845))

(declare-fun m!407847 () Bool)

(assert (=> start!61122 m!407847))

(declare-fun m!407849 () Bool)

(assert (=> start!61122 m!407849))

(declare-fun m!407851 () Bool)

(assert (=> b!275262 m!407851))

(declare-fun m!407853 () Bool)

(assert (=> b!275260 m!407853))

(declare-fun m!407855 () Bool)

(assert (=> b!275261 m!407855))

(push 1)

(assert (not b!275262))

(assert (not b!275261))

(assert (not b!275259))

(assert (not b!275260))

(assert (not start!61122))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94684 () Bool)

(declare-fun e!195250 () Bool)

(assert (=> d!94684 e!195250))

(declare-fun res!228882 () Bool)

(assert (=> d!94684 (=> (not res!228882) (not e!195250))))

(declare-fun lt!413532 () (_ BitVec 64))

(declare-fun lt!413533 () (_ BitVec 64))

(declare-fun lt!413534 () (_ BitVec 64))

(assert (=> d!94684 (= res!228882 (= lt!413532 (bvsub lt!413534 lt!413533)))))

(assert (=> d!94684 (or (= (bvand lt!413534 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!413533 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!413534 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!413534 lt!413533) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94684 (= lt!413533 (remainingBits!0 ((_ sign_extend 32) (size!6801 (buf!7269 bs1!11))) ((_ sign_extend 32) (currentByte!13436 bs1!11)) ((_ sign_extend 32) (currentBit!13431 bs1!11))))))

(declare-fun lt!413535 () (_ BitVec 64))

(declare-fun lt!413537 () (_ BitVec 64))

(assert (=> d!94684 (= lt!413534 (bvmul lt!413535 lt!413537))))

(assert (=> d!94684 (or (= lt!413535 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!413537 (bvsdiv (bvmul lt!413535 lt!413537) lt!413535)))))

(assert (=> d!94684 (= lt!413537 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94684 (= lt!413535 ((_ sign_extend 32) (size!6801 (buf!7269 bs1!11))))))

(assert (=> d!94684 (= lt!413532 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13436 bs1!11)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13431 bs1!11))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!94684 (invariant!0 (currentBit!13431 bs1!11) (currentByte!13436 bs1!11) (size!6801 (buf!7269 bs1!11)))))

(assert (=> d!94684 (= (bitIndex!0 (size!6801 (buf!7269 bs1!11)) (currentByte!13436 bs1!11) (currentBit!13431 bs1!11)) lt!413532)))

(declare-fun b!275279 () Bool)

(declare-fun res!228883 () Bool)

(assert (=> b!275279 (=> (not res!228883) (not e!195250))))

(assert (=> b!275279 (= res!228883 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413532))))

(declare-fun b!275280 () Bool)

(declare-fun lt!413536 () (_ BitVec 64))

(assert (=> b!275280 (= e!195250 (bvsle lt!413532 (bvmul lt!413536 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!275280 (or (= lt!413536 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!413536 #b0000000000000000000000000000000000000000000000000000000000001000) lt!413536)))))

(assert (=> b!275280 (= lt!413536 ((_ sign_extend 32) (size!6801 (buf!7269 bs1!11))))))

(assert (= (and d!94684 res!228882) b!275279))

(assert (= (and b!275279 res!228883) b!275280))

(declare-fun m!407869 () Bool)

(assert (=> d!94684 m!407869))

(declare-fun m!407871 () Bool)

(assert (=> d!94684 m!407871))

(assert (=> b!275260 d!94684))

(declare-fun d!94686 () Bool)

(assert (=> d!94686 (= (array_inv!6525 (buf!7269 bs1!11)) (bvsge (size!6801 (buf!7269 bs1!11)) #b00000000000000000000000000000000))))

(assert (=> b!275261 d!94686))

(declare-fun d!94688 () Bool)

(assert (=> d!94688 (= (array_inv!6525 (buf!7269 bs2!19)) (bvsge (size!6801 (buf!7269 bs2!19)) #b00000000000000000000000000000000))))

(assert (=> b!275262 d!94688))

(declare-fun d!94690 () Bool)

(assert (=> d!94690 (= (inv!12 bs1!11) (invariant!0 (currentBit!13431 bs1!11) (currentByte!13436 bs1!11) (size!6801 (buf!7269 bs1!11))))))

(declare-fun bs!23852 () Bool)

(assert (= bs!23852 d!94690))

(assert (=> bs!23852 m!407871))

(assert (=> start!61122 d!94690))

(declare-fun d!94692 () Bool)

(assert (=> d!94692 (= (inv!12 bs2!19) (invariant!0 (currentBit!13431 bs2!19) (currentByte!13436 bs2!19) (size!6801 (buf!7269 bs2!19))))))

(declare-fun bs!23853 () Bool)

(assert (= bs!23853 d!94692))

(declare-fun m!407873 () Bool)

(assert (=> bs!23853 m!407873))

(assert (=> start!61122 d!94692))

(declare-fun d!94694 () Bool)

(assert (=> d!94694 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6801 (buf!7269 bs1!11))) ((_ sign_extend 32) (currentByte!13436 bs1!11)) ((_ sign_extend 32) (currentBit!13431 bs1!11))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6801 (buf!7269 bs1!11))) ((_ sign_extend 32) (currentByte!13436 bs1!11)) ((_ sign_extend 32) (currentBit!13431 bs1!11))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!23854 () Bool)

(assert (= bs!23854 d!94694))

(assert (=> bs!23854 m!407869))

(assert (=> b!275259 d!94694))

(push 1)

(assert (not d!94684))

(assert (not d!94694))

(assert (not d!94690))

(assert (not d!94692))

(check-sat)

(pop 1)

(push 1)

(check-sat)

