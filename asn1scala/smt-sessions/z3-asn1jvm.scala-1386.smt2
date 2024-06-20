; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38306 () Bool)

(assert start!38306)

(declare-fun res!142671 () Bool)

(declare-fun e!120314 () Bool)

(assert (=> start!38306 (=> (not res!142671) (not e!120314))))

(declare-fun nBits!575 () (_ BitVec 32))

(assert (=> start!38306 (= res!142671 (and (bvsge nBits!575 #b00000000000000000000000000000000) (bvsle nBits!575 #b00000000000000000000000001000000)))))

(assert (=> start!38306 e!120314))

(assert (=> start!38306 true))

(declare-datatypes ((array!9224 0))(
  ( (array!9225 (arr!5003 (Array (_ BitVec 32) (_ BitVec 8))) (size!4073 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7254 0))(
  ( (BitStream!7255 (buf!4501 array!9224) (currentByte!8562 (_ BitVec 32)) (currentBit!8557 (_ BitVec 32))) )
))
(declare-fun thiss!1817 () BitStream!7254)

(declare-fun e!120313 () Bool)

(declare-fun inv!12 (BitStream!7254) Bool)

(assert (=> start!38306 (and (inv!12 thiss!1817) e!120313)))

(declare-datatypes ((tuple2!14806 0))(
  ( (tuple2!14807 (_1!8045 (_ BitVec 64)) (_2!8045 BitStream!7254)) )
))
(declare-fun lt!265289 () tuple2!14806)

(declare-fun b!172202 () Bool)

(declare-fun e!120315 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!172202 (= e!120315 (not (= (bitIndex!0 (size!4073 (buf!4501 (_2!8045 lt!265289))) (currentByte!8562 (_2!8045 lt!265289)) (currentBit!8557 (_2!8045 lt!265289))) (bvadd (bitIndex!0 (size!4073 (buf!4501 thiss!1817)) (currentByte!8562 thiss!1817) (currentBit!8557 thiss!1817)) ((_ sign_extend 32) nBits!575)))))))

(declare-fun b!172201 () Bool)

(assert (=> b!172201 (= e!120314 e!120315)))

(declare-fun res!142669 () Bool)

(assert (=> b!172201 (=> res!142669 e!120315)))

(assert (=> b!172201 (= res!142669 (not (= (buf!4501 (_2!8045 lt!265289)) (buf!4501 thiss!1817))))))

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!7254 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!14806)

(assert (=> b!172201 (= lt!265289 (readNLeastSignificantBitsLoop!0 thiss!1817 nBits!575 #b00000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!172200 () Bool)

(declare-fun res!142670 () Bool)

(assert (=> b!172200 (=> (not res!142670) (not e!120314))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!172200 (= res!142670 (validate_offset_bits!1 ((_ sign_extend 32) (size!4073 (buf!4501 thiss!1817))) ((_ sign_extend 32) (currentByte!8562 thiss!1817)) ((_ sign_extend 32) (currentBit!8557 thiss!1817)) ((_ sign_extend 32) nBits!575)))))

(declare-fun b!172203 () Bool)

(declare-fun array_inv!3814 (array!9224) Bool)

(assert (=> b!172203 (= e!120313 (array_inv!3814 (buf!4501 thiss!1817)))))

(assert (= (and start!38306 res!142671) b!172200))

(assert (= (and b!172200 res!142670) b!172201))

(assert (= (and b!172201 (not res!142669)) b!172202))

(assert (= start!38306 b!172203))

(declare-fun m!271361 () Bool)

(assert (=> start!38306 m!271361))

(declare-fun m!271363 () Bool)

(assert (=> b!172200 m!271363))

(declare-fun m!271365 () Bool)

(assert (=> b!172201 m!271365))

(declare-fun m!271367 () Bool)

(assert (=> b!172203 m!271367))

(declare-fun m!271369 () Bool)

(assert (=> b!172202 m!271369))

(declare-fun m!271371 () Bool)

(assert (=> b!172202 m!271371))

(check-sat (not b!172202) (not b!172203) (not b!172200) (not start!38306) (not b!172201))
(check-sat)
(get-model)

(declare-fun d!61035 () Bool)

(declare-fun e!120331 () Bool)

(assert (=> d!61035 e!120331))

(declare-fun res!142685 () Bool)

(assert (=> d!61035 (=> (not res!142685) (not e!120331))))

(declare-fun lt!265310 () (_ BitVec 64))

(declare-fun lt!265308 () (_ BitVec 64))

(declare-fun lt!265307 () (_ BitVec 64))

(assert (=> d!61035 (= res!142685 (= lt!265308 (bvsub lt!265307 lt!265310)))))

(assert (=> d!61035 (or (= (bvand lt!265307 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!265310 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!265307 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!265307 lt!265310) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!61035 (= lt!265310 (remainingBits!0 ((_ sign_extend 32) (size!4073 (buf!4501 (_2!8045 lt!265289)))) ((_ sign_extend 32) (currentByte!8562 (_2!8045 lt!265289))) ((_ sign_extend 32) (currentBit!8557 (_2!8045 lt!265289)))))))

(declare-fun lt!265309 () (_ BitVec 64))

(declare-fun lt!265306 () (_ BitVec 64))

(assert (=> d!61035 (= lt!265307 (bvmul lt!265309 lt!265306))))

(assert (=> d!61035 (or (= lt!265309 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!265306 (bvsdiv (bvmul lt!265309 lt!265306) lt!265309)))))

(assert (=> d!61035 (= lt!265306 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61035 (= lt!265309 ((_ sign_extend 32) (size!4073 (buf!4501 (_2!8045 lt!265289)))))))

(assert (=> d!61035 (= lt!265308 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8562 (_2!8045 lt!265289))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8557 (_2!8045 lt!265289)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!61035 (invariant!0 (currentBit!8557 (_2!8045 lt!265289)) (currentByte!8562 (_2!8045 lt!265289)) (size!4073 (buf!4501 (_2!8045 lt!265289))))))

(assert (=> d!61035 (= (bitIndex!0 (size!4073 (buf!4501 (_2!8045 lt!265289))) (currentByte!8562 (_2!8045 lt!265289)) (currentBit!8557 (_2!8045 lt!265289))) lt!265308)))

(declare-fun b!172220 () Bool)

(declare-fun res!142686 () Bool)

(assert (=> b!172220 (=> (not res!142686) (not e!120331))))

(assert (=> b!172220 (= res!142686 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!265308))))

(declare-fun b!172221 () Bool)

(declare-fun lt!265305 () (_ BitVec 64))

(assert (=> b!172221 (= e!120331 (bvsle lt!265308 (bvmul lt!265305 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!172221 (or (= lt!265305 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!265305 #b0000000000000000000000000000000000000000000000000000000000001000) lt!265305)))))

(assert (=> b!172221 (= lt!265305 ((_ sign_extend 32) (size!4073 (buf!4501 (_2!8045 lt!265289)))))))

(assert (= (and d!61035 res!142685) b!172220))

(assert (= (and b!172220 res!142686) b!172221))

(declare-fun m!271385 () Bool)

(assert (=> d!61035 m!271385))

(declare-fun m!271387 () Bool)

(assert (=> d!61035 m!271387))

(assert (=> b!172202 d!61035))

(declare-fun d!61039 () Bool)

(declare-fun e!120332 () Bool)

(assert (=> d!61039 e!120332))

(declare-fun res!142687 () Bool)

(assert (=> d!61039 (=> (not res!142687) (not e!120332))))

(declare-fun lt!265314 () (_ BitVec 64))

(declare-fun lt!265316 () (_ BitVec 64))

(declare-fun lt!265313 () (_ BitVec 64))

(assert (=> d!61039 (= res!142687 (= lt!265314 (bvsub lt!265313 lt!265316)))))

(assert (=> d!61039 (or (= (bvand lt!265313 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!265316 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!265313 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!265313 lt!265316) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61039 (= lt!265316 (remainingBits!0 ((_ sign_extend 32) (size!4073 (buf!4501 thiss!1817))) ((_ sign_extend 32) (currentByte!8562 thiss!1817)) ((_ sign_extend 32) (currentBit!8557 thiss!1817))))))

(declare-fun lt!265315 () (_ BitVec 64))

(declare-fun lt!265312 () (_ BitVec 64))

(assert (=> d!61039 (= lt!265313 (bvmul lt!265315 lt!265312))))

(assert (=> d!61039 (or (= lt!265315 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!265312 (bvsdiv (bvmul lt!265315 lt!265312) lt!265315)))))

(assert (=> d!61039 (= lt!265312 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61039 (= lt!265315 ((_ sign_extend 32) (size!4073 (buf!4501 thiss!1817))))))

(assert (=> d!61039 (= lt!265314 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8562 thiss!1817)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8557 thiss!1817))))))

(assert (=> d!61039 (invariant!0 (currentBit!8557 thiss!1817) (currentByte!8562 thiss!1817) (size!4073 (buf!4501 thiss!1817)))))

(assert (=> d!61039 (= (bitIndex!0 (size!4073 (buf!4501 thiss!1817)) (currentByte!8562 thiss!1817) (currentBit!8557 thiss!1817)) lt!265314)))

(declare-fun b!172222 () Bool)

(declare-fun res!142688 () Bool)

(assert (=> b!172222 (=> (not res!142688) (not e!120332))))

(assert (=> b!172222 (= res!142688 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!265314))))

(declare-fun b!172223 () Bool)

(declare-fun lt!265311 () (_ BitVec 64))

(assert (=> b!172223 (= e!120332 (bvsle lt!265314 (bvmul lt!265311 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!172223 (or (= lt!265311 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!265311 #b0000000000000000000000000000000000000000000000000000000000001000) lt!265311)))))

(assert (=> b!172223 (= lt!265311 ((_ sign_extend 32) (size!4073 (buf!4501 thiss!1817))))))

(assert (= (and d!61039 res!142687) b!172222))

(assert (= (and b!172222 res!142688) b!172223))

(declare-fun m!271389 () Bool)

(assert (=> d!61039 m!271389))

(declare-fun m!271391 () Bool)

(assert (=> d!61039 m!271391))

(assert (=> b!172202 d!61039))

(declare-fun d!61041 () Bool)

(assert (=> d!61041 (= (array_inv!3814 (buf!4501 thiss!1817)) (bvsge (size!4073 (buf!4501 thiss!1817)) #b00000000000000000000000000000000))))

(assert (=> b!172203 d!61041))

(declare-fun d!61043 () Bool)

(assert (=> d!61043 (= (inv!12 thiss!1817) (invariant!0 (currentBit!8557 thiss!1817) (currentByte!8562 thiss!1817) (size!4073 (buf!4501 thiss!1817))))))

(declare-fun bs!15180 () Bool)

(assert (= bs!15180 d!61043))

(assert (=> bs!15180 m!271391))

(assert (=> start!38306 d!61043))

(declare-fun d!61045 () Bool)

(assert (=> d!61045 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4073 (buf!4501 thiss!1817))) ((_ sign_extend 32) (currentByte!8562 thiss!1817)) ((_ sign_extend 32) (currentBit!8557 thiss!1817)) ((_ sign_extend 32) nBits!575)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4073 (buf!4501 thiss!1817))) ((_ sign_extend 32) (currentByte!8562 thiss!1817)) ((_ sign_extend 32) (currentBit!8557 thiss!1817))) ((_ sign_extend 32) nBits!575)))))

(declare-fun bs!15181 () Bool)

(assert (= bs!15181 d!61045))

(assert (=> bs!15181 m!271389))

(assert (=> b!172200 d!61045))

(declare-fun b!172268 () Bool)

(declare-fun e!120353 () Bool)

(declare-fun e!120355 () Bool)

(assert (=> b!172268 (= e!120353 e!120355)))

(declare-fun res!142727 () Bool)

(assert (=> b!172268 (=> res!142727 e!120355)))

(assert (=> b!172268 (= res!142727 (bvsge #b00000000000000000000000000000000 nBits!575))))

(declare-fun b!172269 () Bool)

(declare-fun e!120354 () tuple2!14806)

(declare-fun lt!265401 () tuple2!14806)

(assert (=> b!172269 (= e!120354 (tuple2!14807 (_1!8045 lt!265401) (_2!8045 lt!265401)))))

(declare-datatypes ((tuple2!14810 0))(
  ( (tuple2!14811 (_1!8047 Bool) (_2!8047 BitStream!7254)) )
))
(declare-fun lt!265404 () tuple2!14810)

(declare-fun readBit!0 (BitStream!7254) tuple2!14810)

(assert (=> b!172269 (= lt!265404 (readBit!0 thiss!1817))))

(assert (=> b!172269 (= lt!265401 (readNLeastSignificantBitsLoop!0 (_2!8047 lt!265404) nBits!575 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor #b0000000000000000000000000000000000000000000000000000000000000000 (ite (_1!8047 lt!265404) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!575 #b00000000000000000000000000000001) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!61049 () Bool)

(assert (=> d!61049 e!120353))

(declare-fun res!142726 () Bool)

(assert (=> d!61049 (=> (not res!142726) (not e!120353))))

(declare-fun lt!265406 () tuple2!14806)

(assert (=> d!61049 (= res!142726 (= (buf!4501 (_2!8045 lt!265406)) (buf!4501 thiss!1817)))))

(assert (=> d!61049 (= lt!265406 e!120354)))

(declare-fun c!9065 () Bool)

(assert (=> d!61049 (= c!9065 (= nBits!575 #b00000000000000000000000000000000))))

(assert (=> d!61049 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 nBits!575) (bvsle nBits!575 #b00000000000000000000000001000000))))

(assert (=> d!61049 (= (readNLeastSignificantBitsLoop!0 thiss!1817 nBits!575 #b00000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) lt!265406)))

(declare-fun b!172270 () Bool)

(declare-fun res!142725 () Bool)

(assert (=> b!172270 (=> (not res!142725) (not e!120353))))

(declare-fun lt!265403 () (_ BitVec 64))

(declare-fun lt!265402 () (_ BitVec 64))

(assert (=> b!172270 (= res!142725 (= (bitIndex!0 (size!4073 (buf!4501 (_2!8045 lt!265406))) (currentByte!8562 (_2!8045 lt!265406)) (currentBit!8557 (_2!8045 lt!265406))) (bvadd lt!265402 lt!265403)))))

(assert (=> b!172270 (or (not (= (bvand lt!265402 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!265403 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!265402 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!265402 lt!265403) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!172270 (= lt!265403 ((_ sign_extend 32) (bvsub nBits!575 #b00000000000000000000000000000000)))))

(assert (=> b!172270 (or (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand (bvsub nBits!575 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!172270 (= lt!265402 (bitIndex!0 (size!4073 (buf!4501 thiss!1817)) (currentByte!8562 thiss!1817) (currentBit!8557 thiss!1817)))))

(declare-fun b!172271 () Bool)

(assert (=> b!172271 (= e!120354 (tuple2!14807 #b0000000000000000000000000000000000000000000000000000000000000000 thiss!1817))))

(declare-fun b!172272 () Bool)

(declare-fun res!142729 () Bool)

(assert (=> b!172272 (=> (not res!142729) (not e!120353))))

(declare-fun lt!265408 () (_ BitVec 64))

(declare-fun lt!265405 () (_ BitVec 64))

(assert (=> b!172272 (= res!142729 (= (bvlshr (_1!8045 lt!265406) lt!265408) (bvlshr #b0000000000000000000000000000000000000000000000000000000000000000 lt!265405)))))

(assert (=> b!172272 (and (bvsge lt!265405 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!265405 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!172272 (= lt!265405 ((_ sign_extend 32) (bvsub nBits!575 #b00000000000000000000000000000000)))))

(assert (=> b!172272 (or (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand (bvsub nBits!575 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!172272 (and (bvsge lt!265408 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!265408 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!172272 (= lt!265408 ((_ sign_extend 32) (bvsub nBits!575 #b00000000000000000000000000000000)))))

(assert (=> b!172272 (or (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand (bvsub nBits!575 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(declare-fun b!172273 () Bool)

(declare-fun lt!265407 () (_ BitVec 64))

(declare-datatypes ((tuple2!14812 0))(
  ( (tuple2!14813 (_1!8048 BitStream!7254) (_2!8048 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!7254) tuple2!14812)

(assert (=> b!172273 (= e!120355 (= (= (bvand (bvlshr (_1!8045 lt!265406) lt!265407) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!8048 (readBitPure!0 thiss!1817))))))

(assert (=> b!172273 (and (bvsge lt!265407 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!265407 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!265409 () (_ BitVec 32))

(assert (=> b!172273 (= lt!265407 ((_ sign_extend 32) (bvsub lt!265409 #b00000000000000000000000000000000)))))

(assert (=> b!172273 (or (= (bvand lt!265409 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand lt!265409 #b10000000000000000000000000000000) (bvand (bvsub lt!265409 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!172273 (= lt!265409 (bvsub nBits!575 #b00000000000000000000000000000001))))

(assert (=> b!172273 (or (= (bvand nBits!575 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand (bvsub nBits!575 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!172274 () Bool)

(declare-fun res!142728 () Bool)

(assert (=> b!172274 (=> (not res!142728) (not e!120353))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!172274 (= res!142728 (= (bvand (_1!8045 lt!265406) (onesLSBLong!0 nBits!575)) (_1!8045 lt!265406)))))

(assert (= (and d!61049 c!9065) b!172271))

(assert (= (and d!61049 (not c!9065)) b!172269))

(assert (= (and d!61049 res!142726) b!172270))

(assert (= (and b!172270 res!142725) b!172272))

(assert (= (and b!172272 res!142729) b!172274))

(assert (= (and b!172274 res!142728) b!172268))

(assert (= (and b!172268 (not res!142727)) b!172273))

(declare-fun m!271409 () Bool)

(assert (=> b!172269 m!271409))

(declare-fun m!271411 () Bool)

(assert (=> b!172269 m!271411))

(declare-fun m!271413 () Bool)

(assert (=> b!172270 m!271413))

(assert (=> b!172270 m!271371))

(declare-fun m!271415 () Bool)

(assert (=> b!172273 m!271415))

(declare-fun m!271417 () Bool)

(assert (=> b!172274 m!271417))

(assert (=> b!172201 d!61049))

(check-sat (not d!61039) (not b!172274) (not d!61045) (not b!172270) (not d!61035) (not d!61043) (not b!172273) (not b!172269))
