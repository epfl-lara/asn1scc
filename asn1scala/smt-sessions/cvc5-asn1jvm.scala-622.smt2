; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17632 () Bool)

(assert start!17632)

(declare-fun b!85029 () Bool)

(declare-fun e!56684 () Bool)

(declare-datatypes ((array!4035 0))(
  ( (array!4036 (arr!2460 (Array (_ BitVec 32) (_ BitVec 8))) (size!1823 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3208 0))(
  ( (BitStream!3209 (buf!2213 array!4035) (currentByte!4401 (_ BitVec 32)) (currentBit!4396 (_ BitVec 32))) )
))
(declare-fun thiss!1151 () BitStream!3208)

(declare-fun array_inv!1669 (array!4035) Bool)

(assert (=> b!85029 (= e!56684 (array_inv!1669 (buf!2213 thiss!1151)))))

(declare-fun b!85030 () Bool)

(declare-fun res!69764 () Bool)

(declare-fun e!56685 () Bool)

(assert (=> b!85030 (=> (not res!69764) (not e!56685))))

(declare-fun thiss!1152 () BitStream!3208)

(declare-fun i!576 () (_ BitVec 32))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!85030 (= res!69764 (= (bitIndex!0 (size!1823 (buf!2213 thiss!1152)) (currentByte!4401 thiss!1152) (currentBit!4396 thiss!1152)) (bvadd (bitIndex!0 (size!1823 (buf!2213 thiss!1151)) (currentByte!4401 thiss!1151) (currentBit!4396 thiss!1151)) ((_ sign_extend 32) i!576))))))

(declare-fun b!85031 () Bool)

(declare-fun res!69769 () Bool)

(assert (=> b!85031 (=> (not res!69769) (not e!56685))))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!85031 (= res!69769 (and (bvsle i!576 nBits!336) (= (size!1823 (buf!2213 thiss!1152)) (size!1823 (buf!2213 thiss!1151)))))))

(declare-fun b!85032 () Bool)

(declare-fun res!69766 () Bool)

(assert (=> b!85032 (=> (not res!69766) (not e!56685))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!85032 (= res!69766 (invariant!0 (currentBit!4396 thiss!1151) (currentByte!4401 thiss!1151) (size!1823 (buf!2213 thiss!1151))))))

(declare-fun b!85033 () Bool)

(declare-fun res!69763 () Bool)

(assert (=> b!85033 (=> (not res!69763) (not e!56685))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!85033 (= res!69763 (validate_offset_bits!1 ((_ sign_extend 32) (size!1823 (buf!2213 thiss!1151))) ((_ sign_extend 32) (currentByte!4401 thiss!1151)) ((_ sign_extend 32) (currentBit!4396 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!85034 () Bool)

(declare-fun res!69765 () Bool)

(assert (=> b!85034 (=> (not res!69765) (not e!56685))))

(assert (=> b!85034 (= res!69765 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!85035 () Bool)

(declare-fun e!56686 () Bool)

(assert (=> b!85035 (= e!56686 (array_inv!1669 (buf!2213 thiss!1152)))))

(declare-fun b!85036 () Bool)

(assert (=> b!85036 (= e!56685 (and (bvsle ((_ sign_extend 32) (size!1823 (buf!2213 thiss!1152))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4401 thiss!1152)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4396 thiss!1152)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!1823 (buf!2213 thiss!1152))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!4401 thiss!1152)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!4396 thiss!1152)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!85028 () Bool)

(declare-fun res!69767 () Bool)

(assert (=> b!85028 (=> (not res!69767) (not e!56685))))

(assert (=> b!85028 (= res!69767 (invariant!0 (currentBit!4396 thiss!1152) (currentByte!4401 thiss!1152) (size!1823 (buf!2213 thiss!1152))))))

(declare-fun res!69768 () Bool)

(assert (=> start!17632 (=> (not res!69768) (not e!56685))))

(assert (=> start!17632 (= res!69768 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17632 e!56685))

(assert (=> start!17632 true))

(declare-fun inv!12 (BitStream!3208) Bool)

(assert (=> start!17632 (and (inv!12 thiss!1151) e!56684)))

(assert (=> start!17632 (and (inv!12 thiss!1152) e!56686)))

(assert (= (and start!17632 res!69768) b!85033))

(assert (= (and b!85033 res!69763) b!85032))

(assert (= (and b!85032 res!69766) b!85034))

(assert (= (and b!85034 res!69765) b!85028))

(assert (= (and b!85028 res!69767) b!85031))

(assert (= (and b!85031 res!69769) b!85030))

(assert (= (and b!85030 res!69764) b!85036))

(assert (= start!17632 b!85029))

(assert (= start!17632 b!85035))

(declare-fun m!131339 () Bool)

(assert (=> b!85032 m!131339))

(declare-fun m!131341 () Bool)

(assert (=> b!85029 m!131341))

(declare-fun m!131343 () Bool)

(assert (=> b!85035 m!131343))

(declare-fun m!131345 () Bool)

(assert (=> b!85030 m!131345))

(declare-fun m!131347 () Bool)

(assert (=> b!85030 m!131347))

(declare-fun m!131349 () Bool)

(assert (=> b!85033 m!131349))

(declare-fun m!131351 () Bool)

(assert (=> start!17632 m!131351))

(declare-fun m!131353 () Bool)

(assert (=> start!17632 m!131353))

(declare-fun m!131355 () Bool)

(assert (=> b!85028 m!131355))

(push 1)

(assert (not b!85030))

(assert (not b!85033))

(assert (not start!17632))

(assert (not b!85032))

(assert (not b!85028))

(assert (not b!85029))

(assert (not b!85035))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!27262 () Bool)

(assert (=> d!27262 (= (invariant!0 (currentBit!4396 thiss!1152) (currentByte!4401 thiss!1152) (size!1823 (buf!2213 thiss!1152))) (and (bvsge (currentBit!4396 thiss!1152) #b00000000000000000000000000000000) (bvslt (currentBit!4396 thiss!1152) #b00000000000000000000000000001000) (bvsge (currentByte!4401 thiss!1152) #b00000000000000000000000000000000) (or (bvslt (currentByte!4401 thiss!1152) (size!1823 (buf!2213 thiss!1152))) (and (= (currentBit!4396 thiss!1152) #b00000000000000000000000000000000) (= (currentByte!4401 thiss!1152) (size!1823 (buf!2213 thiss!1152)))))))))

(assert (=> b!85028 d!27262))

(declare-fun d!27264 () Bool)

(assert (=> d!27264 (= (array_inv!1669 (buf!2213 thiss!1151)) (bvsge (size!1823 (buf!2213 thiss!1151)) #b00000000000000000000000000000000))))

(assert (=> b!85029 d!27264))

(declare-fun d!27266 () Bool)

(assert (=> d!27266 (= (array_inv!1669 (buf!2213 thiss!1152)) (bvsge (size!1823 (buf!2213 thiss!1152)) #b00000000000000000000000000000000))))

(assert (=> b!85035 d!27266))

(declare-fun d!27268 () Bool)

(declare-fun e!56723 () Bool)

(assert (=> d!27268 e!56723))

(declare-fun res!69821 () Bool)

(assert (=> d!27268 (=> (not res!69821) (not e!56723))))

(declare-fun lt!134587 () (_ BitVec 64))

(declare-fun lt!134586 () (_ BitVec 64))

(declare-fun lt!134588 () (_ BitVec 64))

(assert (=> d!27268 (= res!69821 (= lt!134587 (bvsub lt!134588 lt!134586)))))

(assert (=> d!27268 (or (= (bvand lt!134588 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!134586 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!134588 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!134588 lt!134586) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!27268 (= lt!134586 (remainingBits!0 ((_ sign_extend 32) (size!1823 (buf!2213 thiss!1152))) ((_ sign_extend 32) (currentByte!4401 thiss!1152)) ((_ sign_extend 32) (currentBit!4396 thiss!1152))))))

(declare-fun lt!134584 () (_ BitVec 64))

(declare-fun lt!134583 () (_ BitVec 64))

(assert (=> d!27268 (= lt!134588 (bvmul lt!134584 lt!134583))))

(assert (=> d!27268 (or (= lt!134584 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!134583 (bvsdiv (bvmul lt!134584 lt!134583) lt!134584)))))

(assert (=> d!27268 (= lt!134583 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27268 (= lt!134584 ((_ sign_extend 32) (size!1823 (buf!2213 thiss!1152))))))

(assert (=> d!27268 (= lt!134587 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4401 thiss!1152)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4396 thiss!1152))))))

(assert (=> d!27268 (invariant!0 (currentBit!4396 thiss!1152) (currentByte!4401 thiss!1152) (size!1823 (buf!2213 thiss!1152)))))

(assert (=> d!27268 (= (bitIndex!0 (size!1823 (buf!2213 thiss!1152)) (currentByte!4401 thiss!1152) (currentBit!4396 thiss!1152)) lt!134587)))

(declare-fun b!85099 () Bool)

(declare-fun res!69820 () Bool)

(assert (=> b!85099 (=> (not res!69820) (not e!56723))))

(assert (=> b!85099 (= res!69820 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!134587))))

(declare-fun b!85100 () Bool)

(declare-fun lt!134585 () (_ BitVec 64))

(assert (=> b!85100 (= e!56723 (bvsle lt!134587 (bvmul lt!134585 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!85100 (or (= lt!134585 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!134585 #b0000000000000000000000000000000000000000000000000000000000001000) lt!134585)))))

(assert (=> b!85100 (= lt!134585 ((_ sign_extend 32) (size!1823 (buf!2213 thiss!1152))))))

(assert (= (and d!27268 res!69821) b!85099))

(assert (= (and b!85099 res!69820) b!85100))

(declare-fun m!131393 () Bool)

(assert (=> d!27268 m!131393))

(assert (=> d!27268 m!131355))

(assert (=> b!85030 d!27268))

(declare-fun d!27272 () Bool)

(declare-fun e!56726 () Bool)

(assert (=> d!27272 e!56726))

(declare-fun res!69827 () Bool)

(assert (=> d!27272 (=> (not res!69827) (not e!56726))))

(declare-fun lt!134603 () (_ BitVec 64))

(declare-fun lt!134602 () (_ BitVec 64))

(declare-fun lt!134604 () (_ BitVec 64))

(assert (=> d!27272 (= res!69827 (= lt!134603 (bvsub lt!134604 lt!134602)))))

(assert (=> d!27272 (or (= (bvand lt!134604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!134602 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!134604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!134604 lt!134602) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27272 (= lt!134602 (remainingBits!0 ((_ sign_extend 32) (size!1823 (buf!2213 thiss!1151))) ((_ sign_extend 32) (currentByte!4401 thiss!1151)) ((_ sign_extend 32) (currentBit!4396 thiss!1151))))))

(declare-fun lt!134600 () (_ BitVec 64))

(declare-fun lt!134599 () (_ BitVec 64))

(assert (=> d!27272 (= lt!134604 (bvmul lt!134600 lt!134599))))

(assert (=> d!27272 (or (= lt!134600 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!134599 (bvsdiv (bvmul lt!134600 lt!134599) lt!134600)))))

(assert (=> d!27272 (= lt!134599 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27272 (= lt!134600 ((_ sign_extend 32) (size!1823 (buf!2213 thiss!1151))))))

(assert (=> d!27272 (= lt!134603 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4401 thiss!1151)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4396 thiss!1151))))))

(assert (=> d!27272 (invariant!0 (currentBit!4396 thiss!1151) (currentByte!4401 thiss!1151) (size!1823 (buf!2213 thiss!1151)))))

(assert (=> d!27272 (= (bitIndex!0 (size!1823 (buf!2213 thiss!1151)) (currentByte!4401 thiss!1151) (currentBit!4396 thiss!1151)) lt!134603)))

(declare-fun b!85105 () Bool)

(declare-fun res!69826 () Bool)

(assert (=> b!85105 (=> (not res!69826) (not e!56726))))

(assert (=> b!85105 (= res!69826 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!134603))))

(declare-fun b!85106 () Bool)

(declare-fun lt!134601 () (_ BitVec 64))

(assert (=> b!85106 (= e!56726 (bvsle lt!134603 (bvmul lt!134601 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!85106 (or (= lt!134601 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!134601 #b0000000000000000000000000000000000000000000000000000000000001000) lt!134601)))))

(assert (=> b!85106 (= lt!134601 ((_ sign_extend 32) (size!1823 (buf!2213 thiss!1151))))))

(assert (= (and d!27272 res!69827) b!85105))

(assert (= (and b!85105 res!69826) b!85106))

(declare-fun m!131395 () Bool)

(assert (=> d!27272 m!131395))

(assert (=> d!27272 m!131339))

(assert (=> b!85030 d!27272))

(declare-fun d!27274 () Bool)

(assert (=> d!27274 (= (inv!12 thiss!1151) (invariant!0 (currentBit!4396 thiss!1151) (currentByte!4401 thiss!1151) (size!1823 (buf!2213 thiss!1151))))))

(declare-fun bs!6751 () Bool)

(assert (= bs!6751 d!27274))

(assert (=> bs!6751 m!131339))

(assert (=> start!17632 d!27274))

(declare-fun d!27278 () Bool)

(assert (=> d!27278 (= (inv!12 thiss!1152) (invariant!0 (currentBit!4396 thiss!1152) (currentByte!4401 thiss!1152) (size!1823 (buf!2213 thiss!1152))))))

(declare-fun bs!6752 () Bool)

(assert (= bs!6752 d!27278))

(assert (=> bs!6752 m!131355))

(assert (=> start!17632 d!27278))

(declare-fun d!27282 () Bool)

(assert (=> d!27282 (= (invariant!0 (currentBit!4396 thiss!1151) (currentByte!4401 thiss!1151) (size!1823 (buf!2213 thiss!1151))) (and (bvsge (currentBit!4396 thiss!1151) #b00000000000000000000000000000000) (bvslt (currentBit!4396 thiss!1151) #b00000000000000000000000000001000) (bvsge (currentByte!4401 thiss!1151) #b00000000000000000000000000000000) (or (bvslt (currentByte!4401 thiss!1151) (size!1823 (buf!2213 thiss!1151))) (and (= (currentBit!4396 thiss!1151) #b00000000000000000000000000000000) (= (currentByte!4401 thiss!1151) (size!1823 (buf!2213 thiss!1151)))))))))

(assert (=> b!85032 d!27282))

(declare-fun d!27284 () Bool)

(assert (=> d!27284 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1823 (buf!2213 thiss!1151))) ((_ sign_extend 32) (currentByte!4401 thiss!1151)) ((_ sign_extend 32) (currentBit!4396 thiss!1151)) ((_ sign_extend 32) nBits!336)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1823 (buf!2213 thiss!1151))) ((_ sign_extend 32) (currentByte!4401 thiss!1151)) ((_ sign_extend 32) (currentBit!4396 thiss!1151))) ((_ sign_extend 32) nBits!336)))))

(declare-fun bs!6753 () Bool)

(assert (= bs!6753 d!27284))

(assert (=> bs!6753 m!131395))

(assert (=> b!85033 d!27284))

(push 1)

(assert (not d!27268))

(assert (not d!27278))

(assert (not d!27284))

(assert (not d!27274))

(assert (not d!27272))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

