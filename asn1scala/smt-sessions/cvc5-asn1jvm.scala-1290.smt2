; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36676 () Bool)

(assert start!36676)

(declare-fun b!168312 () Bool)

(declare-fun e!116929 () Bool)

(declare-datatypes ((array!8748 0))(
  ( (array!8749 (arr!4804 (Array (_ BitVec 32) (_ BitVec 8))) (size!3883 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6922 0))(
  ( (BitStream!6923 (buf!4335 array!8748) (currentByte!8199 (_ BitVec 32)) (currentBit!8194 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!6922)

(declare-fun array_inv!3624 (array!8748) Bool)

(assert (=> b!168312 (= e!116929 (array_inv!3624 (buf!4335 thiss!1894)))))

(declare-fun b!168311 () Bool)

(declare-fun e!116931 () Bool)

(declare-fun nBits!600 () (_ BitVec 32))

(declare-fun moveBitIndexPrecond!0 (BitStream!6922 (_ BitVec 64)) Bool)

(assert (=> b!168311 (= e!116931 (not (moveBitIndexPrecond!0 thiss!1894 ((_ sign_extend 32) nBits!600))))))

(declare-fun b!168310 () Bool)

(declare-fun res!140084 () Bool)

(assert (=> b!168310 (=> (not res!140084) (not e!116931))))

(assert (=> b!168310 (= res!140084 (bvsle (bvadd (currentBit!8194 thiss!1894) nBits!600) #b00000000000000000000000000001000))))

(declare-fun res!140082 () Bool)

(assert (=> start!36676 (=> (not res!140082) (not e!116931))))

(assert (=> start!36676 (= res!140082 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!36676 e!116931))

(assert (=> start!36676 true))

(declare-fun inv!12 (BitStream!6922) Bool)

(assert (=> start!36676 (and (inv!12 thiss!1894) e!116929)))

(declare-fun b!168309 () Bool)

(declare-fun res!140083 () Bool)

(assert (=> b!168309 (=> (not res!140083) (not e!116931))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!168309 (= res!140083 (validate_offset_bits!1 ((_ sign_extend 32) (size!3883 (buf!4335 thiss!1894))) ((_ sign_extend 32) (currentByte!8199 thiss!1894)) ((_ sign_extend 32) (currentBit!8194 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(assert (= (and start!36676 res!140082) b!168309))

(assert (= (and b!168309 res!140083) b!168310))

(assert (= (and b!168310 res!140084) b!168311))

(assert (= start!36676 b!168312))

(declare-fun m!267939 () Bool)

(assert (=> b!168312 m!267939))

(declare-fun m!267941 () Bool)

(assert (=> b!168311 m!267941))

(declare-fun m!267943 () Bool)

(assert (=> start!36676 m!267943))

(declare-fun m!267945 () Bool)

(assert (=> b!168309 m!267945))

(push 1)

(assert (not b!168311))

(assert (not b!168312))

(assert (not start!36676))

(assert (not b!168309))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59257 () Bool)

(declare-fun res!140105 () Bool)

(declare-fun e!116952 () Bool)

(assert (=> d!59257 (=> (not res!140105) (not e!116952))))

(assert (=> d!59257 (= res!140105 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!3883 (buf!4335 thiss!1894)))) ((_ sign_extend 32) nBits!600)) (bvsle ((_ sign_extend 32) nBits!600) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3883 (buf!4335 thiss!1894)))))))))

(assert (=> d!59257 (= (moveBitIndexPrecond!0 thiss!1894 ((_ sign_extend 32) nBits!600)) e!116952)))

(declare-fun b!168340 () Bool)

(declare-fun lt!261592 () (_ BitVec 64))

(assert (=> b!168340 (= e!116952 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!261592) (bvsle lt!261592 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3883 (buf!4335 thiss!1894)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!168340 (= lt!261592 (bvadd (bitIndex!0 (size!3883 (buf!4335 thiss!1894)) (currentByte!8199 thiss!1894) (currentBit!8194 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(assert (= (and d!59257 res!140105) b!168340))

(declare-fun m!267967 () Bool)

(assert (=> b!168340 m!267967))

(assert (=> b!168311 d!59257))

(declare-fun d!59265 () Bool)

(assert (=> d!59265 (= (array_inv!3624 (buf!4335 thiss!1894)) (bvsge (size!3883 (buf!4335 thiss!1894)) #b00000000000000000000000000000000))))

(assert (=> b!168312 d!59265))

(declare-fun d!59267 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!59267 (= (inv!12 thiss!1894) (invariant!0 (currentBit!8194 thiss!1894) (currentByte!8199 thiss!1894) (size!3883 (buf!4335 thiss!1894))))))

(declare-fun bs!14687 () Bool)

(assert (= bs!14687 d!59267))

(declare-fun m!267969 () Bool)

(assert (=> bs!14687 m!267969))

(assert (=> start!36676 d!59267))

(declare-fun d!59269 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!59269 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3883 (buf!4335 thiss!1894))) ((_ sign_extend 32) (currentByte!8199 thiss!1894)) ((_ sign_extend 32) (currentBit!8194 thiss!1894)) ((_ sign_extend 32) nBits!600)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3883 (buf!4335 thiss!1894))) ((_ sign_extend 32) (currentByte!8199 thiss!1894)) ((_ sign_extend 32) (currentBit!8194 thiss!1894))) ((_ sign_extend 32) nBits!600)))))

(declare-fun bs!14688 () Bool)

(assert (= bs!14688 d!59269))

(declare-fun m!267973 () Bool)

(assert (=> bs!14688 m!267973))

(assert (=> b!168309 d!59269))

(push 1)

(assert (not b!168340))

(assert (not d!59269))

(assert (not d!59267))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59281 () Bool)

(declare-fun e!116961 () Bool)

(assert (=> d!59281 e!116961))

(declare-fun res!140116 () Bool)

(assert (=> d!59281 (=> (not res!140116) (not e!116961))))

(declare-fun lt!261612 () (_ BitVec 64))

(declare-fun lt!261613 () (_ BitVec 64))

(declare-fun lt!261615 () (_ BitVec 64))

(assert (=> d!59281 (= res!140116 (= lt!261612 (bvsub lt!261613 lt!261615)))))

(assert (=> d!59281 (or (= (bvand lt!261613 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!261615 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!261613 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!261613 lt!261615) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!59281 (= lt!261615 (remainingBits!0 ((_ sign_extend 32) (size!3883 (buf!4335 thiss!1894))) ((_ sign_extend 32) (currentByte!8199 thiss!1894)) ((_ sign_extend 32) (currentBit!8194 thiss!1894))))))

(declare-fun lt!261611 () (_ BitVec 64))

(declare-fun lt!261614 () (_ BitVec 64))

(assert (=> d!59281 (= lt!261613 (bvmul lt!261611 lt!261614))))

(assert (=> d!59281 (or (= lt!261611 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!261614 (bvsdiv (bvmul lt!261611 lt!261614) lt!261611)))))

(assert (=> d!59281 (= lt!261614 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!59281 (= lt!261611 ((_ sign_extend 32) (size!3883 (buf!4335 thiss!1894))))))

(assert (=> d!59281 (= lt!261612 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8199 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8194 thiss!1894))))))

(assert (=> d!59281 (invariant!0 (currentBit!8194 thiss!1894) (currentByte!8199 thiss!1894) (size!3883 (buf!4335 thiss!1894)))))

(assert (=> d!59281 (= (bitIndex!0 (size!3883 (buf!4335 thiss!1894)) (currentByte!8199 thiss!1894) (currentBit!8194 thiss!1894)) lt!261612)))

(declare-fun b!168353 () Bool)

(declare-fun res!140117 () Bool)

(assert (=> b!168353 (=> (not res!140117) (not e!116961))))

(assert (=> b!168353 (= res!140117 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!261612))))

(declare-fun b!168354 () Bool)

(declare-fun lt!261616 () (_ BitVec 64))

(assert (=> b!168354 (= e!116961 (bvsle lt!261612 (bvmul lt!261616 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!168354 (or (= lt!261616 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!261616 #b0000000000000000000000000000000000000000000000000000000000001000) lt!261616)))))

(assert (=> b!168354 (= lt!261616 ((_ sign_extend 32) (size!3883 (buf!4335 thiss!1894))))))

(assert (= (and d!59281 res!140116) b!168353))

(assert (= (and b!168353 res!140117) b!168354))

(assert (=> d!59281 m!267973))

(assert (=> d!59281 m!267969))

(assert (=> b!168340 d!59281))

(declare-fun d!59289 () Bool)

(assert (=> d!59289 (= (remainingBits!0 ((_ sign_extend 32) (size!3883 (buf!4335 thiss!1894))) ((_ sign_extend 32) (currentByte!8199 thiss!1894)) ((_ sign_extend 32) (currentBit!8194 thiss!1894))) (bvsub (bvmul ((_ sign_extend 32) (size!3883 (buf!4335 thiss!1894))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8199 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8194 thiss!1894)))))))

(assert (=> d!59269 d!59289))

(declare-fun d!59291 () Bool)

(assert (=> d!59291 (= (invariant!0 (currentBit!8194 thiss!1894) (currentByte!8199 thiss!1894) (size!3883 (buf!4335 thiss!1894))) (and (bvsge (currentBit!8194 thiss!1894) #b00000000000000000000000000000000) (bvslt (currentBit!8194 thiss!1894) #b00000000000000000000000000001000) (bvsge (currentByte!8199 thiss!1894) #b00000000000000000000000000000000) (or (bvslt (currentByte!8199 thiss!1894) (size!3883 (buf!4335 thiss!1894))) (and (= (currentBit!8194 thiss!1894) #b00000000000000000000000000000000) (= (currentByte!8199 thiss!1894) (size!3883 (buf!4335 thiss!1894)))))))))

(assert (=> d!59267 d!59291))

(push 1)

(assert (not d!59281))

(check-sat)

(pop 1)

(push 1)

(check-sat)

