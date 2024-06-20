; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72080 () Bool)

(assert start!72080)

(declare-fun b!323237 () Bool)

(declare-fun res!265344 () Bool)

(declare-fun e!232889 () Bool)

(assert (=> b!323237 (=> (not res!265344) (not e!232889))))

(declare-fun acc!161 () (_ BitVec 64))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323237 (= res!265344 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!323238 () Bool)

(declare-fun res!265345 () Bool)

(assert (=> b!323238 (=> (not res!265345) (not e!232889))))

(declare-fun nBits!548 () (_ BitVec 32))

(assert (=> b!323238 (= res!265345 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (= nBits!548 i!743)))))

(declare-fun b!323239 () Bool)

(declare-fun e!232886 () Bool)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323239 (= e!232886 (not (= (bvand acc!161 (onesLSBLong!0 nBits!548)) acc!161)))))

(declare-fun b!323240 () Bool)

(declare-fun e!232890 () Bool)

(assert (=> b!323240 (= e!232890 e!232889)))

(declare-fun res!265341 () Bool)

(assert (=> b!323240 (=> (not res!265341) (not e!232889))))

(declare-datatypes ((array!20644 0))(
  ( (array!20645 (arr!10078 (Array (_ BitVec 32) (_ BitVec 8))) (size!8986 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14134 0))(
  ( (BitStream!14135 (buf!8128 array!20644) (currentByte!14993 (_ BitVec 32)) (currentBit!14988 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14134)

(declare-fun lt!445832 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!323240 (= res!265341 (validate_offset_bits!1 ((_ sign_extend 32) (size!8986 (buf!8128 thiss!1793))) ((_ sign_extend 32) (currentByte!14993 thiss!1793)) ((_ sign_extend 32) (currentBit!14988 thiss!1793)) lt!445832))))

(assert (=> b!323240 (= lt!445832 ((_ sign_extend 32) (bvsub nBits!548 i!743)))))

(declare-fun res!265343 () Bool)

(assert (=> start!72080 (=> (not res!265343) (not e!232890))))

(assert (=> start!72080 (= res!265343 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!72080 e!232890))

(assert (=> start!72080 true))

(declare-fun e!232888 () Bool)

(declare-fun inv!12 (BitStream!14134) Bool)

(assert (=> start!72080 (and (inv!12 thiss!1793) e!232888)))

(declare-fun b!323241 () Bool)

(assert (=> b!323241 (= e!232889 e!232886)))

(declare-fun res!265342 () Bool)

(assert (=> b!323241 (=> res!265342 e!232886)))

(declare-fun lt!445831 () (_ BitVec 64))

(assert (=> b!323241 (= res!265342 (not (= lt!445831 (bvadd lt!445831 lt!445832))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323241 (= lt!445831 (bitIndex!0 (size!8986 (buf!8128 thiss!1793)) (currentByte!14993 thiss!1793) (currentBit!14988 thiss!1793)))))

(declare-fun b!323242 () Bool)

(declare-fun array_inv!8538 (array!20644) Bool)

(assert (=> b!323242 (= e!232888 (array_inv!8538 (buf!8128 thiss!1793)))))

(assert (= (and start!72080 res!265343) b!323240))

(assert (= (and b!323240 res!265341) b!323237))

(assert (= (and b!323237 res!265344) b!323238))

(assert (= (and b!323238 res!265345) b!323241))

(assert (= (and b!323241 (not res!265342)) b!323239))

(assert (= start!72080 b!323242))

(declare-fun m!461379 () Bool)

(assert (=> start!72080 m!461379))

(declare-fun m!461381 () Bool)

(assert (=> b!323242 m!461381))

(declare-fun m!461383 () Bool)

(assert (=> b!323239 m!461383))

(declare-fun m!461385 () Bool)

(assert (=> b!323237 m!461385))

(declare-fun m!461387 () Bool)

(assert (=> b!323240 m!461387))

(declare-fun m!461389 () Bool)

(assert (=> b!323241 m!461389))

(push 1)

(assert (not b!323241))

(assert (not b!323239))

(assert (not start!72080))

(assert (not b!323242))

(assert (not b!323237))

(assert (not b!323240))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106024 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!106024 (= (inv!12 thiss!1793) (invariant!0 (currentBit!14988 thiss!1793) (currentByte!14993 thiss!1793) (size!8986 (buf!8128 thiss!1793))))))

(declare-fun bs!27928 () Bool)

(assert (= bs!27928 d!106024))

(declare-fun m!461417 () Bool)

(assert (=> bs!27928 m!461417))

(assert (=> start!72080 d!106024))

(declare-fun d!106030 () Bool)

(declare-fun e!232929 () Bool)

(assert (=> d!106030 e!232929))

(declare-fun res!265392 () Bool)

(assert (=> d!106030 (=> (not res!265392) (not e!232929))))

(declare-fun lt!445897 () (_ BitVec 64))

(declare-fun lt!445893 () (_ BitVec 64))

(declare-fun lt!445895 () (_ BitVec 64))

(assert (=> d!106030 (= res!265392 (= lt!445895 (bvsub lt!445893 lt!445897)))))

(assert (=> d!106030 (or (= (bvand lt!445893 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!445897 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!445893 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!445893 lt!445897) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!106030 (= lt!445897 (remainingBits!0 ((_ sign_extend 32) (size!8986 (buf!8128 thiss!1793))) ((_ sign_extend 32) (currentByte!14993 thiss!1793)) ((_ sign_extend 32) (currentBit!14988 thiss!1793))))))

(declare-fun lt!445894 () (_ BitVec 64))

(declare-fun lt!445896 () (_ BitVec 64))

(assert (=> d!106030 (= lt!445893 (bvmul lt!445894 lt!445896))))

(assert (=> d!106030 (or (= lt!445894 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!445896 (bvsdiv (bvmul lt!445894 lt!445896) lt!445894)))))

(assert (=> d!106030 (= lt!445896 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106030 (= lt!445894 ((_ sign_extend 32) (size!8986 (buf!8128 thiss!1793))))))

(assert (=> d!106030 (= lt!445895 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14993 thiss!1793)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14988 thiss!1793))))))

(assert (=> d!106030 (invariant!0 (currentBit!14988 thiss!1793) (currentByte!14993 thiss!1793) (size!8986 (buf!8128 thiss!1793)))))

(assert (=> d!106030 (= (bitIndex!0 (size!8986 (buf!8128 thiss!1793)) (currentByte!14993 thiss!1793) (currentBit!14988 thiss!1793)) lt!445895)))

(declare-fun b!323295 () Bool)

(declare-fun res!265393 () Bool)

(assert (=> b!323295 (=> (not res!265393) (not e!232929))))

(assert (=> b!323295 (= res!265393 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!445895))))

(declare-fun b!323296 () Bool)

(declare-fun lt!445898 () (_ BitVec 64))

(assert (=> b!323296 (= e!232929 (bvsle lt!445895 (bvmul lt!445898 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!323296 (or (= lt!445898 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!445898 #b0000000000000000000000000000000000000000000000000000000000001000) lt!445898)))))

(assert (=> b!323296 (= lt!445898 ((_ sign_extend 32) (size!8986 (buf!8128 thiss!1793))))))

(assert (= (and d!106030 res!265392) b!323295))

(assert (= (and b!323295 res!265393) b!323296))

(declare-fun m!461425 () Bool)

(assert (=> d!106030 m!461425))

(assert (=> d!106030 m!461417))

(assert (=> b!323241 d!106030))

(declare-fun d!106044 () Bool)

(assert (=> d!106044 (= (array_inv!8538 (buf!8128 thiss!1793)) (bvsge (size!8986 (buf!8128 thiss!1793)) #b00000000000000000000000000000000))))

(assert (=> b!323242 d!106044))

(declare-fun d!106046 () Bool)

(assert (=> d!106046 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743)) (ite (= (bvsub #b00000000000000000000000001000000 i!743) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!743))))))))

(assert (=> b!323237 d!106046))

(declare-fun d!106048 () Bool)

(assert (=> d!106048 (= (onesLSBLong!0 nBits!548) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!548))))))

(assert (=> b!323239 d!106048))

(declare-fun d!106050 () Bool)

(assert (=> d!106050 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8986 (buf!8128 thiss!1793))) ((_ sign_extend 32) (currentByte!14993 thiss!1793)) ((_ sign_extend 32) (currentBit!14988 thiss!1793)) lt!445832) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8986 (buf!8128 thiss!1793))) ((_ sign_extend 32) (currentByte!14993 thiss!1793)) ((_ sign_extend 32) (currentBit!14988 thiss!1793))) lt!445832))))

(declare-fun bs!27932 () Bool)

(assert (= bs!27932 d!106050))

(assert (=> bs!27932 m!461425))

(assert (=> b!323240 d!106050))

(push 1)

(assert (not d!106024))

(assert (not d!106030))

(assert (not d!106050))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

