; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71160 () Bool)

(assert start!71160)

(declare-fun b!321127 () Bool)

(declare-fun e!231217 () Bool)

(declare-datatypes ((array!20306 0))(
  ( (array!20307 (arr!9941 (Array (_ BitVec 32) (_ BitVec 8))) (size!8849 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13860 0))(
  ( (BitStream!13861 (buf!7991 array!20306) (currentByte!14744 (_ BitVec 32)) (currentBit!14739 (_ BitVec 32))) )
))
(declare-fun thiss!1780 () BitStream!13860)

(declare-fun array_inv!8401 (array!20306) Bool)

(assert (=> b!321127 (= e!231217 (array_inv!8401 (buf!7991 thiss!1780)))))

(declare-fun e!231219 () Bool)

(declare-fun b!321126 () Bool)

(declare-fun lt!444394 () (_ BitVec 64))

(declare-fun lt!444395 () (_ BitVec 64))

(declare-fun nBits!542 () (_ BitVec 32))

(assert (=> b!321126 (= e!231219 (and (= lt!444394 (bvand ((_ sign_extend 32) nBits!542) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!444394 (bvand (bvadd lt!444395 ((_ sign_extend 32) nBits!542)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!321126 (= lt!444394 (bvand lt!444395 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!321126 (= lt!444395 (bitIndex!0 (size!8849 (buf!7991 thiss!1780)) (currentByte!14744 thiss!1780) (currentBit!14739 thiss!1780)))))

(declare-fun b!321124 () Bool)

(declare-fun res!263745 () Bool)

(assert (=> b!321124 (=> (not res!263745) (not e!231219))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!321124 (= res!263745 (validate_offset_bits!1 ((_ sign_extend 32) (size!8849 (buf!7991 thiss!1780))) ((_ sign_extend 32) (currentByte!14744 thiss!1780)) ((_ sign_extend 32) (currentBit!14739 thiss!1780)) ((_ sign_extend 32) nBits!542)))))

(declare-fun res!263746 () Bool)

(assert (=> start!71160 (=> (not res!263746) (not e!231219))))

(assert (=> start!71160 (= res!263746 (and (bvsge nBits!542 #b00000000000000000000000000000000) (bvsle nBits!542 #b00000000000000000000000001000000)))))

(assert (=> start!71160 e!231219))

(assert (=> start!71160 true))

(declare-fun inv!12 (BitStream!13860) Bool)

(assert (=> start!71160 (and (inv!12 thiss!1780) e!231217)))

(declare-fun b!321125 () Bool)

(declare-fun res!263744 () Bool)

(assert (=> b!321125 (=> (not res!263744) (not e!231219))))

(declare-datatypes ((tuple2!23480 0))(
  ( (tuple2!23481 (_1!13369 (_ BitVec 64)) (_2!13369 BitStream!13860)) )
))
(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!13860 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!23480)

(assert (=> b!321125 (= res!263744 (= (buf!7991 (_2!13369 (readNBitsLSBFirstsLoop!0 thiss!1780 nBits!542 #b00000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))) (buf!7991 thiss!1780)))))

(assert (= (and start!71160 res!263746) b!321124))

(assert (= (and b!321124 res!263745) b!321125))

(assert (= (and b!321125 res!263744) b!321126))

(assert (= start!71160 b!321127))

(declare-fun m!459463 () Bool)

(assert (=> b!321124 m!459463))

(declare-fun m!459465 () Bool)

(assert (=> b!321125 m!459465))

(declare-fun m!459467 () Bool)

(assert (=> b!321127 m!459467))

(declare-fun m!459469 () Bool)

(assert (=> b!321126 m!459469))

(declare-fun m!459471 () Bool)

(assert (=> start!71160 m!459471))

(check-sat (not b!321127) (not b!321124) (not start!71160) (not b!321125) (not b!321126))
(check-sat)
(get-model)

(declare-fun b!321166 () Bool)

(declare-fun e!231243 () tuple2!23480)

(assert (=> b!321166 (= e!231243 (tuple2!23481 #b0000000000000000000000000000000000000000000000000000000000000000 thiss!1780))))

(declare-fun b!321167 () Bool)

(declare-fun res!263778 () Bool)

(declare-fun e!231242 () Bool)

(assert (=> b!321167 (=> (not res!263778) (not e!231242))))

(declare-fun lt!444455 () tuple2!23480)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!321167 (= res!263778 (= (bvand (_1!13369 lt!444455) (onesLSBLong!0 nBits!542)) (_1!13369 lt!444455)))))

(declare-fun b!321168 () Bool)

(declare-fun lt!444451 () tuple2!23480)

(assert (=> b!321168 (= e!231243 (tuple2!23481 (_1!13369 lt!444451) (_2!13369 lt!444451)))))

(declare-datatypes ((tuple2!23488 0))(
  ( (tuple2!23489 (_1!13373 Bool) (_2!13373 BitStream!13860)) )
))
(declare-fun lt!444454 () tuple2!23488)

(declare-fun readBit!0 (BitStream!13860) tuple2!23488)

(assert (=> b!321168 (= lt!444454 (readBit!0 thiss!1780))))

(assert (=> b!321168 (= lt!444451 (readNBitsLSBFirstsLoop!0 (_2!13373 lt!444454) nBits!542 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor #b0000000000000000000000000000000000000000000000000000000000000000 (ite (_1!13373 lt!444454) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!321169 () Bool)

(declare-fun e!231241 () Bool)

(assert (=> b!321169 (= e!231242 e!231241)))

(declare-fun res!263782 () Bool)

(assert (=> b!321169 (=> res!263782 e!231241)))

(assert (=> b!321169 (= res!263782 (not (bvslt #b00000000000000000000000000000000 nBits!542)))))

(declare-fun b!321170 () Bool)

(declare-fun res!263780 () Bool)

(assert (=> b!321170 (=> (not res!263780) (not e!231242))))

(assert (=> b!321170 (= res!263780 (= (bvand (_1!13369 lt!444455) (onesLSBLong!0 #b00000000000000000000000000000000)) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 (onesLSBLong!0 #b00000000000000000000000000000000))))))

(declare-fun b!321171 () Bool)

(declare-fun lt!444453 () (_ BitVec 64))

(declare-datatypes ((tuple2!23490 0))(
  ( (tuple2!23491 (_1!13374 BitStream!13860) (_2!13374 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!13860) tuple2!23490)

(assert (=> b!321171 (= e!231241 (= (= (bvand (bvlshr (_1!13369 lt!444455) lt!444453) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!13374 (readBitPure!0 thiss!1780))))))

(assert (=> b!321171 (and (bvsge lt!444453 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!444453 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!321171 (= lt!444453 ((_ sign_extend 32) #b00000000000000000000000000000000))))

(declare-fun b!321172 () Bool)

(declare-fun res!263781 () Bool)

(assert (=> b!321172 (=> (not res!263781) (not e!231242))))

(declare-fun lt!444452 () (_ BitVec 64))

(declare-fun lt!444450 () (_ BitVec 64))

(assert (=> b!321172 (= res!263781 (= (bitIndex!0 (size!8849 (buf!7991 (_2!13369 lt!444455))) (currentByte!14744 (_2!13369 lt!444455)) (currentBit!14739 (_2!13369 lt!444455))) (bvadd lt!444450 lt!444452)))))

(assert (=> b!321172 (or (not (= (bvand lt!444450 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!444452 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!444450 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!444450 lt!444452) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!321172 (= lt!444452 ((_ sign_extend 32) (bvsub nBits!542 #b00000000000000000000000000000000)))))

(assert (=> b!321172 (or (= (bvand nBits!542 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!542 #b10000000000000000000000000000000) (bvand (bvsub nBits!542 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!321172 (= lt!444450 (bitIndex!0 (size!8849 (buf!7991 thiss!1780)) (currentByte!14744 thiss!1780) (currentBit!14739 thiss!1780)))))

(declare-fun d!105184 () Bool)

(assert (=> d!105184 e!231242))

(declare-fun res!263779 () Bool)

(assert (=> d!105184 (=> (not res!263779) (not e!231242))))

(assert (=> d!105184 (= res!263779 (= (buf!7991 (_2!13369 lt!444455)) (buf!7991 thiss!1780)))))

(assert (=> d!105184 (= lt!444455 e!231243)))

(declare-fun c!15397 () Bool)

(assert (=> d!105184 (= c!15397 (= nBits!542 #b00000000000000000000000000000000))))

(assert (=> d!105184 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 nBits!542) (bvsle nBits!542 #b00000000000000000000000001000000))))

(assert (=> d!105184 (= (readNBitsLSBFirstsLoop!0 thiss!1780 nBits!542 #b00000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) lt!444455)))

(assert (= (and d!105184 c!15397) b!321166))

(assert (= (and d!105184 (not c!15397)) b!321168))

(assert (= (and d!105184 res!263779) b!321172))

(assert (= (and b!321172 res!263781) b!321170))

(assert (= (and b!321170 res!263780) b!321167))

(assert (= (and b!321167 res!263778) b!321169))

(assert (= (and b!321169 (not res!263782)) b!321171))

(declare-fun m!459491 () Bool)

(assert (=> b!321170 m!459491))

(declare-fun m!459493 () Bool)

(assert (=> b!321167 m!459493))

(declare-fun m!459495 () Bool)

(assert (=> b!321172 m!459495))

(assert (=> b!321172 m!459469))

(declare-fun m!459497 () Bool)

(assert (=> b!321168 m!459497))

(declare-fun m!459499 () Bool)

(assert (=> b!321168 m!459499))

(declare-fun m!459501 () Bool)

(assert (=> b!321171 m!459501))

(assert (=> b!321125 d!105184))

(declare-fun d!105202 () Bool)

(declare-fun e!231255 () Bool)

(assert (=> d!105202 e!231255))

(declare-fun res!263803 () Bool)

(assert (=> d!105202 (=> (not res!263803) (not e!231255))))

(declare-fun lt!444490 () (_ BitVec 64))

(declare-fun lt!444488 () (_ BitVec 64))

(declare-fun lt!444487 () (_ BitVec 64))

(assert (=> d!105202 (= res!263803 (= lt!444488 (bvsub lt!444487 lt!444490)))))

(assert (=> d!105202 (or (= (bvand lt!444487 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!444490 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!444487 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!444487 lt!444490) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!105202 (= lt!444490 (remainingBits!0 ((_ sign_extend 32) (size!8849 (buf!7991 thiss!1780))) ((_ sign_extend 32) (currentByte!14744 thiss!1780)) ((_ sign_extend 32) (currentBit!14739 thiss!1780))))))

(declare-fun lt!444489 () (_ BitVec 64))

(declare-fun lt!444491 () (_ BitVec 64))

(assert (=> d!105202 (= lt!444487 (bvmul lt!444489 lt!444491))))

(assert (=> d!105202 (or (= lt!444489 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!444491 (bvsdiv (bvmul lt!444489 lt!444491) lt!444489)))))

(assert (=> d!105202 (= lt!444491 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!105202 (= lt!444489 ((_ sign_extend 32) (size!8849 (buf!7991 thiss!1780))))))

(assert (=> d!105202 (= lt!444488 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14744 thiss!1780)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14739 thiss!1780))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!105202 (invariant!0 (currentBit!14739 thiss!1780) (currentByte!14744 thiss!1780) (size!8849 (buf!7991 thiss!1780)))))

(assert (=> d!105202 (= (bitIndex!0 (size!8849 (buf!7991 thiss!1780)) (currentByte!14744 thiss!1780) (currentBit!14739 thiss!1780)) lt!444488)))

(declare-fun b!321198 () Bool)

(declare-fun res!263802 () Bool)

(assert (=> b!321198 (=> (not res!263802) (not e!231255))))

(assert (=> b!321198 (= res!263802 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!444488))))

(declare-fun b!321199 () Bool)

(declare-fun lt!444486 () (_ BitVec 64))

(assert (=> b!321199 (= e!231255 (bvsle lt!444488 (bvmul lt!444486 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!321199 (or (= lt!444486 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!444486 #b0000000000000000000000000000000000000000000000000000000000001000) lt!444486)))))

(assert (=> b!321199 (= lt!444486 ((_ sign_extend 32) (size!8849 (buf!7991 thiss!1780))))))

(assert (= (and d!105202 res!263803) b!321198))

(assert (= (and b!321198 res!263802) b!321199))

(declare-fun m!459515 () Bool)

(assert (=> d!105202 m!459515))

(declare-fun m!459517 () Bool)

(assert (=> d!105202 m!459517))

(assert (=> b!321126 d!105202))

(declare-fun d!105204 () Bool)

(assert (=> d!105204 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8849 (buf!7991 thiss!1780))) ((_ sign_extend 32) (currentByte!14744 thiss!1780)) ((_ sign_extend 32) (currentBit!14739 thiss!1780)) ((_ sign_extend 32) nBits!542)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8849 (buf!7991 thiss!1780))) ((_ sign_extend 32) (currentByte!14744 thiss!1780)) ((_ sign_extend 32) (currentBit!14739 thiss!1780))) ((_ sign_extend 32) nBits!542)))))

(declare-fun bs!27662 () Bool)

(assert (= bs!27662 d!105204))

(assert (=> bs!27662 m!459515))

(assert (=> b!321124 d!105204))

(declare-fun d!105206 () Bool)

(assert (=> d!105206 (= (inv!12 thiss!1780) (invariant!0 (currentBit!14739 thiss!1780) (currentByte!14744 thiss!1780) (size!8849 (buf!7991 thiss!1780))))))

(declare-fun bs!27663 () Bool)

(assert (= bs!27663 d!105206))

(assert (=> bs!27663 m!459517))

(assert (=> start!71160 d!105206))

(declare-fun d!105208 () Bool)

(assert (=> d!105208 (= (array_inv!8401 (buf!7991 thiss!1780)) (bvsge (size!8849 (buf!7991 thiss!1780)) #b00000000000000000000000000000000))))

(assert (=> b!321127 d!105208))

(check-sat (not b!321172) (not b!321167) (not d!105204) (not d!105202) (not b!321168) (not b!321170) (not d!105206) (not b!321171))
