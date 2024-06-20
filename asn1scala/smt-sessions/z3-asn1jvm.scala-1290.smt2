; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36678 () Bool)

(assert start!36678)

(declare-fun b!168324 () Bool)

(declare-fun e!116939 () Bool)

(declare-datatypes ((array!8750 0))(
  ( (array!8751 (arr!4805 (Array (_ BitVec 32) (_ BitVec 8))) (size!3884 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6924 0))(
  ( (BitStream!6925 (buf!4336 array!8750) (currentByte!8200 (_ BitVec 32)) (currentBit!8195 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!6924)

(declare-fun array_inv!3625 (array!8750) Bool)

(assert (=> b!168324 (= e!116939 (array_inv!3625 (buf!4336 thiss!1894)))))

(declare-fun res!140092 () Bool)

(declare-fun e!116940 () Bool)

(assert (=> start!36678 (=> (not res!140092) (not e!116940))))

(declare-fun nBits!600 () (_ BitVec 32))

(assert (=> start!36678 (= res!140092 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!36678 e!116940))

(assert (=> start!36678 true))

(declare-fun inv!12 (BitStream!6924) Bool)

(assert (=> start!36678 (and (inv!12 thiss!1894) e!116939)))

(declare-fun b!168321 () Bool)

(declare-fun res!140093 () Bool)

(assert (=> b!168321 (=> (not res!140093) (not e!116940))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!168321 (= res!140093 (validate_offset_bits!1 ((_ sign_extend 32) (size!3884 (buf!4336 thiss!1894))) ((_ sign_extend 32) (currentByte!8200 thiss!1894)) ((_ sign_extend 32) (currentBit!8195 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(declare-fun b!168322 () Bool)

(declare-fun res!140091 () Bool)

(assert (=> b!168322 (=> (not res!140091) (not e!116940))))

(assert (=> b!168322 (= res!140091 (bvsle (bvadd (currentBit!8195 thiss!1894) nBits!600) #b00000000000000000000000000001000))))

(declare-fun b!168323 () Bool)

(declare-fun moveBitIndexPrecond!0 (BitStream!6924 (_ BitVec 64)) Bool)

(assert (=> b!168323 (= e!116940 (not (moveBitIndexPrecond!0 thiss!1894 ((_ sign_extend 32) nBits!600))))))

(assert (= (and start!36678 res!140092) b!168321))

(assert (= (and b!168321 res!140093) b!168322))

(assert (= (and b!168322 res!140091) b!168323))

(assert (= start!36678 b!168324))

(declare-fun m!267947 () Bool)

(assert (=> b!168324 m!267947))

(declare-fun m!267949 () Bool)

(assert (=> start!36678 m!267949))

(declare-fun m!267951 () Bool)

(assert (=> b!168321 m!267951))

(declare-fun m!267953 () Bool)

(assert (=> b!168323 m!267953))

(check-sat (not b!168323) (not b!168321) (not start!36678) (not b!168324))
(check-sat)
(get-model)

(declare-fun d!59255 () Bool)

(declare-fun res!140111 () Bool)

(declare-fun e!116958 () Bool)

(assert (=> d!59255 (=> (not res!140111) (not e!116958))))

(assert (=> d!59255 (= res!140111 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!3884 (buf!4336 thiss!1894)))) ((_ sign_extend 32) nBits!600)) (bvsle ((_ sign_extend 32) nBits!600) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3884 (buf!4336 thiss!1894)))))))))

(assert (=> d!59255 (= (moveBitIndexPrecond!0 thiss!1894 ((_ sign_extend 32) nBits!600)) e!116958)))

(declare-fun b!168348 () Bool)

(declare-fun lt!261598 () (_ BitVec 64))

(assert (=> b!168348 (= e!116958 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!261598) (bvsle lt!261598 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3884 (buf!4336 thiss!1894)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!168348 (= lt!261598 (bvadd (bitIndex!0 (size!3884 (buf!4336 thiss!1894)) (currentByte!8200 thiss!1894) (currentBit!8195 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(assert (= (and d!59255 res!140111) b!168348))

(declare-fun m!267975 () Bool)

(assert (=> b!168348 m!267975))

(assert (=> b!168323 d!59255))

(declare-fun d!59273 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!59273 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3884 (buf!4336 thiss!1894))) ((_ sign_extend 32) (currentByte!8200 thiss!1894)) ((_ sign_extend 32) (currentBit!8195 thiss!1894)) ((_ sign_extend 32) nBits!600)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3884 (buf!4336 thiss!1894))) ((_ sign_extend 32) (currentByte!8200 thiss!1894)) ((_ sign_extend 32) (currentBit!8195 thiss!1894))) ((_ sign_extend 32) nBits!600)))))

(declare-fun bs!14689 () Bool)

(assert (= bs!14689 d!59273))

(declare-fun m!267977 () Bool)

(assert (=> bs!14689 m!267977))

(assert (=> b!168321 d!59273))

(declare-fun d!59275 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!59275 (= (inv!12 thiss!1894) (invariant!0 (currentBit!8195 thiss!1894) (currentByte!8200 thiss!1894) (size!3884 (buf!4336 thiss!1894))))))

(declare-fun bs!14690 () Bool)

(assert (= bs!14690 d!59275))

(declare-fun m!267979 () Bool)

(assert (=> bs!14690 m!267979))

(assert (=> start!36678 d!59275))

(declare-fun d!59277 () Bool)

(assert (=> d!59277 (= (array_inv!3625 (buf!4336 thiss!1894)) (bvsge (size!3884 (buf!4336 thiss!1894)) #b00000000000000000000000000000000))))

(assert (=> b!168324 d!59277))

(check-sat (not d!59275) (not d!59273) (not b!168348))
(check-sat)
(get-model)

(declare-fun d!59279 () Bool)

(assert (=> d!59279 (= (invariant!0 (currentBit!8195 thiss!1894) (currentByte!8200 thiss!1894) (size!3884 (buf!4336 thiss!1894))) (and (bvsge (currentBit!8195 thiss!1894) #b00000000000000000000000000000000) (bvslt (currentBit!8195 thiss!1894) #b00000000000000000000000000001000) (bvsge (currentByte!8200 thiss!1894) #b00000000000000000000000000000000) (or (bvslt (currentByte!8200 thiss!1894) (size!3884 (buf!4336 thiss!1894))) (and (= (currentBit!8195 thiss!1894) #b00000000000000000000000000000000) (= (currentByte!8200 thiss!1894) (size!3884 (buf!4336 thiss!1894)))))))))

(assert (=> d!59275 d!59279))

(declare-fun d!59283 () Bool)

(assert (=> d!59283 (= (remainingBits!0 ((_ sign_extend 32) (size!3884 (buf!4336 thiss!1894))) ((_ sign_extend 32) (currentByte!8200 thiss!1894)) ((_ sign_extend 32) (currentBit!8195 thiss!1894))) (bvsub (bvmul ((_ sign_extend 32) (size!3884 (buf!4336 thiss!1894))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8200 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8195 thiss!1894)))))))

(assert (=> d!59273 d!59283))

(declare-fun d!59285 () Bool)

(declare-fun e!116964 () Bool)

(assert (=> d!59285 e!116964))

(declare-fun res!140123 () Bool)

(assert (=> d!59285 (=> (not res!140123) (not e!116964))))

(declare-fun lt!261634 () (_ BitVec 64))

(declare-fun lt!261632 () (_ BitVec 64))

(declare-fun lt!261630 () (_ BitVec 64))

(assert (=> d!59285 (= res!140123 (= lt!261630 (bvsub lt!261632 lt!261634)))))

(assert (=> d!59285 (or (= (bvand lt!261632 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!261634 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!261632 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!261632 lt!261634) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!59285 (= lt!261634 (remainingBits!0 ((_ sign_extend 32) (size!3884 (buf!4336 thiss!1894))) ((_ sign_extend 32) (currentByte!8200 thiss!1894)) ((_ sign_extend 32) (currentBit!8195 thiss!1894))))))

(declare-fun lt!261631 () (_ BitVec 64))

(declare-fun lt!261633 () (_ BitVec 64))

(assert (=> d!59285 (= lt!261632 (bvmul lt!261631 lt!261633))))

(assert (=> d!59285 (or (= lt!261631 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!261633 (bvsdiv (bvmul lt!261631 lt!261633) lt!261631)))))

(assert (=> d!59285 (= lt!261633 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!59285 (= lt!261631 ((_ sign_extend 32) (size!3884 (buf!4336 thiss!1894))))))

(assert (=> d!59285 (= lt!261630 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8200 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8195 thiss!1894))))))

(assert (=> d!59285 (invariant!0 (currentBit!8195 thiss!1894) (currentByte!8200 thiss!1894) (size!3884 (buf!4336 thiss!1894)))))

(assert (=> d!59285 (= (bitIndex!0 (size!3884 (buf!4336 thiss!1894)) (currentByte!8200 thiss!1894) (currentBit!8195 thiss!1894)) lt!261630)))

(declare-fun b!168359 () Bool)

(declare-fun res!140122 () Bool)

(assert (=> b!168359 (=> (not res!140122) (not e!116964))))

(assert (=> b!168359 (= res!140122 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!261630))))

(declare-fun b!168360 () Bool)

(declare-fun lt!261629 () (_ BitVec 64))

(assert (=> b!168360 (= e!116964 (bvsle lt!261630 (bvmul lt!261629 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!168360 (or (= lt!261629 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!261629 #b0000000000000000000000000000000000000000000000000000000000001000) lt!261629)))))

(assert (=> b!168360 (= lt!261629 ((_ sign_extend 32) (size!3884 (buf!4336 thiss!1894))))))

(assert (= (and d!59285 res!140123) b!168359))

(assert (= (and b!168359 res!140122) b!168360))

(assert (=> d!59285 m!267977))

(assert (=> d!59285 m!267979))

(assert (=> b!168348 d!59285))

(check-sat (not d!59285))
(check-sat)
