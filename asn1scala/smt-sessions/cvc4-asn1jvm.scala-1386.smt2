; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38308 () Bool)

(assert start!38308)

(declare-fun res!142680 () Bool)

(declare-fun e!120325 () Bool)

(assert (=> start!38308 (=> (not res!142680) (not e!120325))))

(declare-fun nBits!575 () (_ BitVec 32))

(assert (=> start!38308 (= res!142680 (and (bvsge nBits!575 #b00000000000000000000000000000000) (bvsle nBits!575 #b00000000000000000000000001000000)))))

(assert (=> start!38308 e!120325))

(assert (=> start!38308 true))

(declare-datatypes ((array!9226 0))(
  ( (array!9227 (arr!5004 (Array (_ BitVec 32) (_ BitVec 8))) (size!4074 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7256 0))(
  ( (BitStream!7257 (buf!4502 array!9226) (currentByte!8563 (_ BitVec 32)) (currentBit!8558 (_ BitVec 32))) )
))
(declare-fun thiss!1817 () BitStream!7256)

(declare-fun e!120328 () Bool)

(declare-fun inv!12 (BitStream!7256) Bool)

(assert (=> start!38308 (and (inv!12 thiss!1817) e!120328)))

(declare-datatypes ((tuple2!14808 0))(
  ( (tuple2!14809 (_1!8046 (_ BitVec 64)) (_2!8046 BitStream!7256)) )
))
(declare-fun lt!265292 () tuple2!14808)

(declare-fun e!120327 () Bool)

(declare-fun b!172214 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!172214 (= e!120327 (not (= (bitIndex!0 (size!4074 (buf!4502 (_2!8046 lt!265292))) (currentByte!8563 (_2!8046 lt!265292)) (currentBit!8558 (_2!8046 lt!265292))) (bvadd (bitIndex!0 (size!4074 (buf!4502 thiss!1817)) (currentByte!8563 thiss!1817) (currentBit!8558 thiss!1817)) ((_ sign_extend 32) nBits!575)))))))

(declare-fun b!172213 () Bool)

(assert (=> b!172213 (= e!120325 e!120327)))

(declare-fun res!142679 () Bool)

(assert (=> b!172213 (=> res!142679 e!120327)))

(assert (=> b!172213 (= res!142679 (not (= (buf!4502 (_2!8046 lt!265292)) (buf!4502 thiss!1817))))))

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!7256 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!14808)

(assert (=> b!172213 (= lt!265292 (readNLeastSignificantBitsLoop!0 thiss!1817 nBits!575 #b00000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!172215 () Bool)

(declare-fun array_inv!3815 (array!9226) Bool)

(assert (=> b!172215 (= e!120328 (array_inv!3815 (buf!4502 thiss!1817)))))

(declare-fun b!172212 () Bool)

(declare-fun res!142678 () Bool)

(assert (=> b!172212 (=> (not res!142678) (not e!120325))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!172212 (= res!142678 (validate_offset_bits!1 ((_ sign_extend 32) (size!4074 (buf!4502 thiss!1817))) ((_ sign_extend 32) (currentByte!8563 thiss!1817)) ((_ sign_extend 32) (currentBit!8558 thiss!1817)) ((_ sign_extend 32) nBits!575)))))

(assert (= (and start!38308 res!142680) b!172212))

(assert (= (and b!172212 res!142678) b!172213))

(assert (= (and b!172213 (not res!142679)) b!172214))

(assert (= start!38308 b!172215))

(declare-fun m!271373 () Bool)

(assert (=> b!172214 m!271373))

(declare-fun m!271375 () Bool)

(assert (=> b!172214 m!271375))

(declare-fun m!271377 () Bool)

(assert (=> b!172213 m!271377))

(declare-fun m!271379 () Bool)

(assert (=> start!38308 m!271379))

(declare-fun m!271381 () Bool)

(assert (=> b!172215 m!271381))

(declare-fun m!271383 () Bool)

(assert (=> b!172212 m!271383))

(push 1)

(assert (not b!172213))

(assert (not start!38308))

(assert (not b!172215))

(assert (not b!172214))

(assert (not b!172212))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!61047 () Bool)

(declare-fun e!120339 () Bool)

(assert (=> d!61047 e!120339))

(declare-fun res!142701 () Bool)

(assert (=> d!61047 (=> (not res!142701) (not e!120339))))

(declare-fun lt!265353 () (_ BitVec 64))

(declare-fun lt!265355 () (_ BitVec 64))

(declare-fun lt!265357 () (_ BitVec 64))

(assert (=> d!61047 (= res!142701 (= lt!265353 (bvsub lt!265355 lt!265357)))))

(assert (=> d!61047 (or (= (bvand lt!265355 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!265357 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!265355 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!265355 lt!265357) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!61047 (= lt!265357 (remainingBits!0 ((_ sign_extend 32) (size!4074 (buf!4502 (_2!8046 lt!265292)))) ((_ sign_extend 32) (currentByte!8563 (_2!8046 lt!265292))) ((_ sign_extend 32) (currentBit!8558 (_2!8046 lt!265292)))))))

(declare-fun lt!265358 () (_ BitVec 64))

(declare-fun lt!265354 () (_ BitVec 64))

(assert (=> d!61047 (= lt!265355 (bvmul lt!265358 lt!265354))))

(assert (=> d!61047 (or (= lt!265358 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!265354 (bvsdiv (bvmul lt!265358 lt!265354) lt!265358)))))

(assert (=> d!61047 (= lt!265354 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61047 (= lt!265358 ((_ sign_extend 32) (size!4074 (buf!4502 (_2!8046 lt!265292)))))))

(assert (=> d!61047 (= lt!265353 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8563 (_2!8046 lt!265292))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8558 (_2!8046 lt!265292)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!61047 (invariant!0 (currentBit!8558 (_2!8046 lt!265292)) (currentByte!8563 (_2!8046 lt!265292)) (size!4074 (buf!4502 (_2!8046 lt!265292))))))

(assert (=> d!61047 (= (bitIndex!0 (size!4074 (buf!4502 (_2!8046 lt!265292))) (currentByte!8563 (_2!8046 lt!265292)) (currentBit!8558 (_2!8046 lt!265292))) lt!265353)))

(declare-fun b!172236 () Bool)

(declare-fun res!142702 () Bool)

(assert (=> b!172236 (=> (not res!142702) (not e!120339))))

(assert (=> b!172236 (= res!142702 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!265353))))

(declare-fun b!172237 () Bool)

(declare-fun lt!265356 () (_ BitVec 64))

(assert (=> b!172237 (= e!120339 (bvsle lt!265353 (bvmul lt!265356 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!172237 (or (= lt!265356 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!265356 #b0000000000000000000000000000000000000000000000000000000000001000) lt!265356)))))

(assert (=> b!172237 (= lt!265356 ((_ sign_extend 32) (size!4074 (buf!4502 (_2!8046 lt!265292)))))))

(assert (= (and d!61047 res!142701) b!172236))

(assert (= (and b!172236 res!142702) b!172237))

(declare-fun m!271401 () Bool)

(assert (=> d!61047 m!271401))

(declare-fun m!271403 () Bool)

(assert (=> d!61047 m!271403))

(assert (=> b!172214 d!61047))

(declare-fun d!61061 () Bool)

(declare-fun e!120340 () Bool)

(assert (=> d!61061 e!120340))

(declare-fun res!142703 () Bool)

(assert (=> d!61061 (=> (not res!142703) (not e!120340))))

(declare-fun lt!265361 () (_ BitVec 64))

(declare-fun lt!265363 () (_ BitVec 64))

(declare-fun lt!265359 () (_ BitVec 64))

(assert (=> d!61061 (= res!142703 (= lt!265359 (bvsub lt!265361 lt!265363)))))

(assert (=> d!61061 (or (= (bvand lt!265361 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!265363 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!265361 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!265361 lt!265363) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61061 (= lt!265363 (remainingBits!0 ((_ sign_extend 32) (size!4074 (buf!4502 thiss!1817))) ((_ sign_extend 32) (currentByte!8563 thiss!1817)) ((_ sign_extend 32) (currentBit!8558 thiss!1817))))))

(declare-fun lt!265364 () (_ BitVec 64))

(declare-fun lt!265360 () (_ BitVec 64))

(assert (=> d!61061 (= lt!265361 (bvmul lt!265364 lt!265360))))

(assert (=> d!61061 (or (= lt!265364 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!265360 (bvsdiv (bvmul lt!265364 lt!265360) lt!265364)))))

(assert (=> d!61061 (= lt!265360 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61061 (= lt!265364 ((_ sign_extend 32) (size!4074 (buf!4502 thiss!1817))))))

(assert (=> d!61061 (= lt!265359 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8563 thiss!1817)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8558 thiss!1817))))))

