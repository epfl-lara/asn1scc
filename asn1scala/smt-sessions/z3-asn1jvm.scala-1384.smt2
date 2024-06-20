; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38234 () Bool)

(assert start!38234)

(declare-fun b!171987 () Bool)

(declare-fun e!120193 () Bool)

(declare-datatypes ((array!9206 0))(
  ( (array!9207 (arr!4997 (Array (_ BitVec 32) (_ BitVec 8))) (size!4067 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7242 0))(
  ( (BitStream!7243 (buf!4495 array!9206) (currentByte!8544 (_ BitVec 32)) (currentBit!8539 (_ BitVec 32))) )
))
(declare-fun thiss!1817 () BitStream!7242)

(declare-fun array_inv!3808 (array!9206) Bool)

(assert (=> b!171987 (= e!120193 (array_inv!3808 (buf!4495 thiss!1817)))))

(declare-fun b!171986 () Bool)

(declare-fun e!120192 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!171986 (= e!120192 (not (invariant!0 (currentBit!8539 thiss!1817) (currentByte!8544 thiss!1817) (size!4067 (buf!4495 thiss!1817)))))))

(declare-fun res!142509 () Bool)

(assert (=> start!38234 (=> (not res!142509) (not e!120192))))

(declare-fun nBits!575 () (_ BitVec 32))

(assert (=> start!38234 (= res!142509 (and (bvsge nBits!575 #b00000000000000000000000000000000) (bvsle nBits!575 #b00000000000000000000000001000000)))))

(assert (=> start!38234 e!120192))

(assert (=> start!38234 true))

(declare-fun inv!12 (BitStream!7242) Bool)

(assert (=> start!38234 (and (inv!12 thiss!1817) e!120193)))

(declare-fun b!171984 () Bool)

(declare-fun res!142507 () Bool)

(assert (=> b!171984 (=> (not res!142507) (not e!120192))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!171984 (= res!142507 (validate_offset_bits!1 ((_ sign_extend 32) (size!4067 (buf!4495 thiss!1817))) ((_ sign_extend 32) (currentByte!8544 thiss!1817)) ((_ sign_extend 32) (currentBit!8539 thiss!1817)) ((_ sign_extend 32) nBits!575)))))

(declare-fun b!171985 () Bool)

(declare-fun res!142508 () Bool)

(assert (=> b!171985 (=> (not res!142508) (not e!120192))))

(declare-datatypes ((tuple2!14770 0))(
  ( (tuple2!14771 (_1!8027 (_ BitVec 64)) (_2!8027 BitStream!7242)) )
))
(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!7242 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!14770)

(assert (=> b!171985 (= res!142508 (= (buf!4495 (_2!8027 (readNLeastSignificantBitsLoop!0 thiss!1817 nBits!575 #b00000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))) (buf!4495 thiss!1817)))))

(assert (= (and start!38234 res!142509) b!171984))

(assert (= (and b!171984 res!142507) b!171985))

(assert (= (and b!171985 res!142508) b!171986))

(assert (= start!38234 b!171987))

(declare-fun m!271215 () Bool)

(assert (=> start!38234 m!271215))

(declare-fun m!271217 () Bool)

(assert (=> b!171984 m!271217))

(declare-fun m!271219 () Bool)

(assert (=> b!171986 m!271219))

(declare-fun m!271221 () Bool)

(assert (=> b!171987 m!271221))

(declare-fun m!271223 () Bool)

(assert (=> b!171985 m!271223))

(check-sat (not b!171987) (not b!171986) (not start!38234) (not b!171984) (not b!171985))
(check-sat)
(get-model)

(declare-fun d!60971 () Bool)

(assert (=> d!60971 (= (inv!12 thiss!1817) (invariant!0 (currentBit!8539 thiss!1817) (currentByte!8544 thiss!1817) (size!4067 (buf!4495 thiss!1817))))))

(declare-fun bs!15162 () Bool)

(assert (= bs!15162 d!60971))

(assert (=> bs!15162 m!271219))

(assert (=> start!38234 d!60971))

(declare-fun lt!265108 () tuple2!14770)

(declare-fun e!120221 () Bool)

(declare-fun b!172042 () Bool)

(declare-fun lt!265110 () (_ BitVec 64))

(declare-datatypes ((tuple2!14774 0))(
  ( (tuple2!14775 (_1!8029 BitStream!7242) (_2!8029 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!7242) tuple2!14774)

(assert (=> b!172042 (= e!120221 (= (= (bvand (bvlshr (_1!8027 lt!265108) lt!265110) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!8029 (readBitPure!0 thiss!1817))))))

(assert (=> b!172042 (and (bvsge lt!265110 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!265110 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!265106 () (_ BitVec 32))

(assert (=> b!172042 (= lt!265110 ((_ sign_extend 32) (bvsub lt!265106 #b00000000000000000000000000000000)))))

(assert (=> b!172042 (or (= (bvand lt!265106 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand lt!265106 #b10000000000000000000000000000000) (bvand (bvsub lt!265106 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!172042 (= lt!265106 (bvsub nBits!575 #b00000000000000000000000000000001))))

(assert (=> b!172042 (or (= (bvand nBits!575 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand (bvsub nBits!575 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!172043 () Bool)

(declare-fun res!142550 () Bool)

(declare-fun e!120222 () Bool)

(assert (=> b!172043 (=> (not res!142550) (not e!120222))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!172043 (= res!142550 (= (bvand (_1!8027 lt!265108) (onesLSBLong!0 nBits!575)) (_1!8027 lt!265108)))))

(declare-fun d!60975 () Bool)

(assert (=> d!60975 e!120222))

(declare-fun res!142551 () Bool)

(assert (=> d!60975 (=> (not res!142551) (not e!120222))))

(assert (=> d!60975 (= res!142551 (= (buf!4495 (_2!8027 lt!265108)) (buf!4495 thiss!1817)))))

(declare-fun e!120223 () tuple2!14770)

(assert (=> d!60975 (= lt!265108 e!120223)))

(declare-fun c!9049 () Bool)

(assert (=> d!60975 (= c!9049 (= nBits!575 #b00000000000000000000000000000000))))

(assert (=> d!60975 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 nBits!575) (bvsle nBits!575 #b00000000000000000000000001000000))))

(assert (=> d!60975 (= (readNLeastSignificantBitsLoop!0 thiss!1817 nBits!575 #b00000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) lt!265108)))

(declare-fun b!172044 () Bool)

(assert (=> b!172044 (= e!120222 e!120221)))

(declare-fun res!142553 () Bool)

(assert (=> b!172044 (=> res!142553 e!120221)))

(assert (=> b!172044 (= res!142553 (bvsge #b00000000000000000000000000000000 nBits!575))))

(declare-fun b!172045 () Bool)

(declare-fun res!142552 () Bool)

(assert (=> b!172045 (=> (not res!142552) (not e!120222))))

(declare-fun lt!265105 () (_ BitVec 64))

(declare-fun lt!265111 () (_ BitVec 64))

(assert (=> b!172045 (= res!142552 (= (bvlshr (_1!8027 lt!265108) lt!265105) (bvlshr #b0000000000000000000000000000000000000000000000000000000000000000 lt!265111)))))

(assert (=> b!172045 (and (bvsge lt!265111 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!265111 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!172045 (= lt!265111 ((_ sign_extend 32) (bvsub nBits!575 #b00000000000000000000000000000000)))))

(assert (=> b!172045 (or (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand (bvsub nBits!575 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!172045 (and (bvsge lt!265105 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!265105 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!172045 (= lt!265105 ((_ sign_extend 32) (bvsub nBits!575 #b00000000000000000000000000000000)))))

(assert (=> b!172045 (or (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand (bvsub nBits!575 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(declare-fun b!172046 () Bool)

(declare-fun res!142549 () Bool)

(assert (=> b!172046 (=> (not res!142549) (not e!120222))))

(declare-fun lt!265104 () (_ BitVec 64))

(declare-fun lt!265112 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!172046 (= res!142549 (= (bitIndex!0 (size!4067 (buf!4495 (_2!8027 lt!265108))) (currentByte!8544 (_2!8027 lt!265108)) (currentBit!8539 (_2!8027 lt!265108))) (bvadd lt!265104 lt!265112)))))

(assert (=> b!172046 (or (not (= (bvand lt!265104 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!265112 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!265104 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!265104 lt!265112) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!172046 (= lt!265112 ((_ sign_extend 32) (bvsub nBits!575 #b00000000000000000000000000000000)))))

(assert (=> b!172046 (or (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand (bvsub nBits!575 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!172046 (= lt!265104 (bitIndex!0 (size!4067 (buf!4495 thiss!1817)) (currentByte!8544 thiss!1817) (currentBit!8539 thiss!1817)))))

(declare-fun b!172047 () Bool)

(declare-fun lt!265109 () tuple2!14770)

(assert (=> b!172047 (= e!120223 (tuple2!14771 (_1!8027 lt!265109) (_2!8027 lt!265109)))))

(declare-datatypes ((tuple2!14780 0))(
  ( (tuple2!14781 (_1!8032 Bool) (_2!8032 BitStream!7242)) )
))
(declare-fun lt!265107 () tuple2!14780)

(declare-fun readBit!0 (BitStream!7242) tuple2!14780)

(assert (=> b!172047 (= lt!265107 (readBit!0 thiss!1817))))

(assert (=> b!172047 (= lt!265109 (readNLeastSignificantBitsLoop!0 (_2!8032 lt!265107) nBits!575 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor #b0000000000000000000000000000000000000000000000000000000000000000 (ite (_1!8032 lt!265107) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!575 #b00000000000000000000000000000001) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!172048 () Bool)

(assert (=> b!172048 (= e!120223 (tuple2!14771 #b0000000000000000000000000000000000000000000000000000000000000000 thiss!1817))))

(assert (= (and d!60975 c!9049) b!172048))

(assert (= (and d!60975 (not c!9049)) b!172047))

(assert (= (and d!60975 res!142551) b!172046))

(assert (= (and b!172046 res!142549) b!172045))

(assert (= (and b!172045 res!142552) b!172043))

(assert (= (and b!172043 res!142550) b!172044))

(assert (= (and b!172044 (not res!142553)) b!172042))

(declare-fun m!271235 () Bool)

(assert (=> b!172042 m!271235))

(declare-fun m!271237 () Bool)

(assert (=> b!172043 m!271237))

(declare-fun m!271239 () Bool)

(assert (=> b!172046 m!271239))

(declare-fun m!271241 () Bool)

(assert (=> b!172046 m!271241))

(declare-fun m!271243 () Bool)

(assert (=> b!172047 m!271243))

(declare-fun m!271245 () Bool)

(assert (=> b!172047 m!271245))

(assert (=> b!171985 d!60975))

(declare-fun d!60991 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!60991 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4067 (buf!4495 thiss!1817))) ((_ sign_extend 32) (currentByte!8544 thiss!1817)) ((_ sign_extend 32) (currentBit!8539 thiss!1817)) ((_ sign_extend 32) nBits!575)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4067 (buf!4495 thiss!1817))) ((_ sign_extend 32) (currentByte!8544 thiss!1817)) ((_ sign_extend 32) (currentBit!8539 thiss!1817))) ((_ sign_extend 32) nBits!575)))))

(declare-fun bs!15165 () Bool)

(assert (= bs!15165 d!60991))

(declare-fun m!271247 () Bool)

(assert (=> bs!15165 m!271247))

(assert (=> b!171984 d!60991))

(declare-fun d!60993 () Bool)

(assert (=> d!60993 (= (invariant!0 (currentBit!8539 thiss!1817) (currentByte!8544 thiss!1817) (size!4067 (buf!4495 thiss!1817))) (and (bvsge (currentBit!8539 thiss!1817) #b00000000000000000000000000000000) (bvslt (currentBit!8539 thiss!1817) #b00000000000000000000000000001000) (bvsge (currentByte!8544 thiss!1817) #b00000000000000000000000000000000) (or (bvslt (currentByte!8544 thiss!1817) (size!4067 (buf!4495 thiss!1817))) (and (= (currentBit!8539 thiss!1817) #b00000000000000000000000000000000) (= (currentByte!8544 thiss!1817) (size!4067 (buf!4495 thiss!1817)))))))))

(assert (=> b!171986 d!60993))

(declare-fun d!60995 () Bool)

(assert (=> d!60995 (= (array_inv!3808 (buf!4495 thiss!1817)) (bvsge (size!4067 (buf!4495 thiss!1817)) #b00000000000000000000000000000000))))

(assert (=> b!171987 d!60995))

(check-sat (not b!172042) (not b!172043) (not d!60991) (not b!172046) (not b!172047) (not d!60971))
