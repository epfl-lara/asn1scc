; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71122 () Bool)

(assert start!71122)

(declare-fun res!263665 () Bool)

(declare-fun e!231155 () Bool)

(assert (=> start!71122 (=> (not res!263665) (not e!231155))))

(declare-fun nBits!542 () (_ BitVec 32))

(assert (=> start!71122 (= res!263665 (and (bvsge nBits!542 #b00000000000000000000000000000000) (bvsle nBits!542 #b00000000000000000000000001000000)))))

(assert (=> start!71122 e!231155))

(assert (=> start!71122 true))

(declare-datatypes ((array!20295 0))(
  ( (array!20296 (arr!9937 (Array (_ BitVec 32) (_ BitVec 8))) (size!8845 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13852 0))(
  ( (BitStream!13853 (buf!7987 array!20295) (currentByte!14734 (_ BitVec 32)) (currentBit!14729 (_ BitVec 32))) )
))
(declare-fun thiss!1780 () BitStream!13852)

(declare-fun e!231154 () Bool)

(declare-fun inv!12 (BitStream!13852) Bool)

(assert (=> start!71122 (and (inv!12 thiss!1780) e!231154)))

(declare-fun b!321013 () Bool)

(declare-fun res!263664 () Bool)

(assert (=> b!321013 (=> (not res!263664) (not e!231155))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!321013 (= res!263664 (validate_offset_bits!1 ((_ sign_extend 32) (size!8845 (buf!7987 thiss!1780))) ((_ sign_extend 32) (currentByte!14734 thiss!1780)) ((_ sign_extend 32) (currentBit!14729 thiss!1780)) ((_ sign_extend 32) nBits!542)))))

(declare-fun b!321015 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!321015 (= e!231155 (not (invariant!0 (currentBit!14729 thiss!1780) (currentByte!14734 thiss!1780) (size!8845 (buf!7987 thiss!1780)))))))

(declare-fun b!321014 () Bool)

(declare-fun res!263663 () Bool)

(assert (=> b!321014 (=> (not res!263663) (not e!231155))))

(declare-datatypes ((tuple2!23468 0))(
  ( (tuple2!23469 (_1!13363 (_ BitVec 64)) (_2!13363 BitStream!13852)) )
))
(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!13852 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!23468)

(assert (=> b!321014 (= res!263663 (= (buf!7987 (_2!13363 (readNBitsLSBFirstsLoop!0 thiss!1780 nBits!542 #b00000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))) (buf!7987 thiss!1780)))))

(declare-fun b!321016 () Bool)

(declare-fun array_inv!8397 (array!20295) Bool)

(assert (=> b!321016 (= e!231154 (array_inv!8397 (buf!7987 thiss!1780)))))

(assert (= (and start!71122 res!263665) b!321013))

(assert (= (and b!321013 res!263664) b!321014))

(assert (= (and b!321014 res!263663) b!321015))

(assert (= start!71122 b!321016))

(declare-fun m!459375 () Bool)

(assert (=> b!321016 m!459375))

(declare-fun m!459377 () Bool)

(assert (=> b!321014 m!459377))

(declare-fun m!459379 () Bool)

(assert (=> start!71122 m!459379))

(declare-fun m!459381 () Bool)

(assert (=> b!321013 m!459381))

(declare-fun m!459383 () Bool)

(assert (=> b!321015 m!459383))

(push 1)

(assert (not b!321015))

(assert (not b!321016))

(assert (not start!71122))

(assert (not b!321014))

(assert (not b!321013))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105156 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!105156 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8845 (buf!7987 thiss!1780))) ((_ sign_extend 32) (currentByte!14734 thiss!1780)) ((_ sign_extend 32) (currentBit!14729 thiss!1780)) ((_ sign_extend 32) nBits!542)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8845 (buf!7987 thiss!1780))) ((_ sign_extend 32) (currentByte!14734 thiss!1780)) ((_ sign_extend 32) (currentBit!14729 thiss!1780))) ((_ sign_extend 32) nBits!542)))))

(declare-fun bs!27651 () Bool)

(assert (= bs!27651 d!105156))

(declare-fun m!459405 () Bool)

(assert (=> bs!27651 m!459405))

(assert (=> b!321013 d!105156))

(declare-fun b!321055 () Bool)

(declare-fun e!231181 () tuple2!23468)

(declare-fun lt!444344 () tuple2!23468)

(assert (=> b!321055 (= e!231181 (tuple2!23469 (_1!13363 lt!444344) (_2!13363 lt!444344)))))

(declare-datatypes ((tuple2!23474 0))(
  ( (tuple2!23475 (_1!13366 Bool) (_2!13366 BitStream!13852)) )
))
(declare-fun lt!444347 () tuple2!23474)

(declare-fun readBit!0 (BitStream!13852) tuple2!23474)

(assert (=> b!321055 (= lt!444347 (readBit!0 thiss!1780))))

(assert (=> b!321055 (= lt!444344 (readNBitsLSBFirstsLoop!0 (_2!13366 lt!444347) nBits!542 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor #b0000000000000000000000000000000000000000000000000000000000000000 (ite (_1!13366 lt!444347) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!321056 () Bool)

(declare-fun res!263694 () Bool)

(declare-fun e!231183 () Bool)

(assert (=> b!321056 (=> (not res!263694) (not e!231183))))

(declare-fun lt!444345 () tuple2!23468)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!321056 (= res!263694 (= (bvand (_1!13363 lt!444345) (onesLSBLong!0 #b00000000000000000000000000000000)) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 (onesLSBLong!0 #b00000000000000000000000000000000))))))

(declare-fun b!321057 () Bool)

(declare-fun res!263698 () Bool)

(assert (=> b!321057 (=> (not res!263698) (not e!231183))))

(declare-fun lt!444346 () (_ BitVec 64))

(declare-fun lt!444343 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!321057 (= res!263698 (= (bitIndex!0 (size!8845 (buf!7987 (_2!13363 lt!444345))) (currentByte!14734 (_2!13363 lt!444345)) (currentBit!14729 (_2!13363 lt!444345))) (bvadd lt!444343 lt!444346)))))

(assert (=> b!321057 (or (not (= (bvand lt!444343 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!444346 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!444343 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!444343 lt!444346) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!321057 (= lt!444346 ((_ sign_extend 32) (bvsub nBits!542 #b00000000000000000000000000000000)))))

(assert (=> b!321057 (or (= (bvand nBits!542 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!542 #b10000000000000000000000000000000) (bvand (bvsub nBits!542 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!321057 (= lt!444343 (bitIndex!0 (size!8845 (buf!7987 thiss!1780)) (currentByte!14734 thiss!1780) (currentBit!14729 thiss!1780)))))

(declare-fun b!321058 () Bool)

(declare-fun e!231182 () Bool)

(assert (=> b!321058 (= e!231183 e!231182)))

(declare-fun res!263695 () Bool)

(assert (=> b!321058 (=> res!263695 e!231182)))

(assert (=> b!321058 (= res!263695 (not (bvslt #b00000000000000000000000000000000 nBits!542)))))

(declare-fun b!321059 () Bool)

(assert (=> b!321059 (= e!231181 (tuple2!23469 #b0000000000000000000000000000000000000000000000000000000000000000 thiss!1780))))

(declare-fun d!105160 () Bool)

(assert (=> d!105160 e!231183))

(declare-fun res!263697 () Bool)

(assert (=> d!105160 (=> (not res!263697) (not e!231183))))

(assert (=> d!105160 (= res!263697 (= (buf!7987 (_2!13363 lt!444345)) (buf!7987 thiss!1780)))))

(assert (=> d!105160 (= lt!444345 e!231181)))

(declare-fun c!15388 () Bool)

(assert (=> d!105160 (= c!15388 (= nBits!542 #b00000000000000000000000000000000))))

(assert (=> d!105160 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 nBits!542) (bvsle nBits!542 #b00000000000000000000000001000000))))

(assert (=> d!105160 (= (readNBitsLSBFirstsLoop!0 thiss!1780 nBits!542 #b00000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) lt!444345)))

(declare-fun b!321060 () Bool)

(declare-fun lt!444342 () (_ BitVec 64))

(declare-datatypes ((tuple2!23476 0))(
  ( (tuple2!23477 (_1!13367 BitStream!13852) (_2!13367 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!13852) tuple2!23476)

(assert (=> b!321060 (= e!231182 (= (= (bvand (bvlshr (_1!13363 lt!444345) lt!444342) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!13367 (readBitPure!0 thiss!1780))))))

(assert (=> b!321060 (and (bvsge lt!444342 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!444342 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!321060 (= lt!444342 ((_ sign_extend 32) #b00000000000000000000000000000000))))

(declare-fun b!321061 () Bool)

(declare-fun res!263696 () Bool)

(assert (=> b!321061 (=> (not res!263696) (not e!231183))))

(assert (=> b!321061 (= res!263696 (= (bvand (_1!13363 lt!444345) (onesLSBLong!0 nBits!542)) (_1!13363 lt!444345)))))

(assert (= (and d!105160 c!15388) b!321059))

(assert (= (and d!105160 (not c!15388)) b!321055))

(assert (= (and d!105160 res!263697) b!321057))

(assert (= (and b!321057 res!263698) b!321056))

(assert (= (and b!321056 res!263694) b!321061))

(assert (= (and b!321061 res!263696) b!321058))

(assert (= (and b!321058 (not res!263695)) b!321060))

(declare-fun m!459411 () Bool)

(assert (=> b!321055 m!459411))

(declare-fun m!459413 () Bool)

(assert (=> b!321055 m!459413))

(declare-fun m!459415 () Bool)

(assert (=> b!321057 m!459415))

(declare-fun m!459417 () Bool)

(assert (=> b!321057 m!459417))

(declare-fun m!459419 () Bool)

(assert (=> b!321061 m!459419))

(declare-fun m!459421 () Bool)

(assert (=> b!321060 m!459421))

(declare-fun m!459423 () Bool)

(assert (=> b!321056 m!459423))

(assert (=> b!321014 d!105160))

(declare-fun d!105168 () Bool)

(assert (=> d!105168 (= (inv!12 thiss!1780) (invariant!0 (currentBit!14729 thiss!1780) (currentByte!14734 thiss!1780) (size!8845 (buf!7987 thiss!1780))))))

(declare-fun bs!27654 () Bool)

(assert (= bs!27654 d!105168))

(assert (=> bs!27654 m!459383))

(assert (=> start!71122 d!105168))

(declare-fun d!105170 () Bool)

(assert (=> d!105170 (= (array_inv!8397 (buf!7987 thiss!1780)) (bvsge (size!8845 (buf!7987 thiss!1780)) #b00000000000000000000000000000000))))

(assert (=> b!321016 d!105170))

(declare-fun d!105172 () Bool)

(assert (=> d!105172 (= (invariant!0 (currentBit!14729 thiss!1780) (currentByte!14734 thiss!1780) (size!8845 (buf!7987 thiss!1780))) (and (bvsge (currentBit!14729 thiss!1780) #b00000000000000000000000000000000) (bvslt (currentBit!14729 thiss!1780) #b00000000000000000000000000001000) (bvsge (currentByte!14734 thiss!1780) #b00000000000000000000000000000000) (or (bvslt (currentByte!14734 thiss!1780) (size!8845 (buf!7987 thiss!1780))) (and (= (currentBit!14729 thiss!1780) #b00000000000000000000000000000000) (= (currentByte!14734 thiss!1780) (size!8845 (buf!7987 thiss!1780)))))))))

(assert (=> b!321015 d!105172))

(push 1)

(assert (not b!321060))

(assert (not b!321056))

(assert (not d!105156))

(assert (not b!321061))

(assert (not b!321057))

(assert (not b!321055))

(assert (not d!105168))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

