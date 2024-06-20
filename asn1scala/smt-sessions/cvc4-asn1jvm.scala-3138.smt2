; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72084 () Bool)

(assert start!72084)

(declare-fun b!323273 () Bool)

(declare-fun e!232916 () Bool)

(declare-fun e!232920 () Bool)

(assert (=> b!323273 (= e!232916 e!232920)))

(declare-fun res!265375 () Bool)

(assert (=> b!323273 (=> res!265375 e!232920)))

(declare-fun lt!445843 () (_ BitVec 64))

(declare-fun lt!445844 () (_ BitVec 64))

(assert (=> b!323273 (= res!265375 (not (= lt!445843 (bvadd lt!445843 lt!445844))))))

(declare-datatypes ((array!20648 0))(
  ( (array!20649 (arr!10080 (Array (_ BitVec 32) (_ BitVec 8))) (size!8988 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14138 0))(
  ( (BitStream!14139 (buf!8130 array!20648) (currentByte!14995 (_ BitVec 32)) (currentBit!14990 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14138)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323273 (= lt!445843 (bitIndex!0 (size!8988 (buf!8130 thiss!1793)) (currentByte!14995 thiss!1793) (currentBit!14990 thiss!1793)))))

(declare-fun b!323274 () Bool)

(declare-fun acc!161 () (_ BitVec 64))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323274 (= e!232920 (not (= (bvand acc!161 (onesLSBLong!0 nBits!548)) acc!161)))))

(declare-fun b!323275 () Bool)

(declare-fun e!232917 () Bool)

(assert (=> b!323275 (= e!232917 e!232916)))

(declare-fun res!265374 () Bool)

(assert (=> b!323275 (=> (not res!265374) (not e!232916))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!323275 (= res!265374 (validate_offset_bits!1 ((_ sign_extend 32) (size!8988 (buf!8130 thiss!1793))) ((_ sign_extend 32) (currentByte!14995 thiss!1793)) ((_ sign_extend 32) (currentBit!14990 thiss!1793)) lt!445844))))

(declare-fun i!743 () (_ BitVec 32))

(assert (=> b!323275 (= lt!445844 ((_ sign_extend 32) (bvsub nBits!548 i!743)))))

(declare-fun res!265372 () Bool)

(assert (=> start!72084 (=> (not res!265372) (not e!232917))))

(assert (=> start!72084 (= res!265372 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!72084 e!232917))

(assert (=> start!72084 true))

(declare-fun e!232918 () Bool)

(declare-fun inv!12 (BitStream!14138) Bool)

(assert (=> start!72084 (and (inv!12 thiss!1793) e!232918)))

(declare-fun b!323276 () Bool)

(declare-fun res!265373 () Bool)

(assert (=> b!323276 (=> (not res!265373) (not e!232916))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323276 (= res!265373 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!323277 () Bool)

(declare-fun res!265371 () Bool)

(assert (=> b!323277 (=> (not res!265371) (not e!232916))))

(assert (=> b!323277 (= res!265371 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (= nBits!548 i!743)))))

(declare-fun b!323278 () Bool)

(declare-fun array_inv!8540 (array!20648) Bool)

(assert (=> b!323278 (= e!232918 (array_inv!8540 (buf!8130 thiss!1793)))))

(assert (= (and start!72084 res!265372) b!323275))

(assert (= (and b!323275 res!265374) b!323276))

(assert (= (and b!323276 res!265373) b!323277))

(assert (= (and b!323277 res!265371) b!323273))

(assert (= (and b!323273 (not res!265375)) b!323274))

(assert (= start!72084 b!323278))

(declare-fun m!461403 () Bool)

(assert (=> b!323276 m!461403))

(declare-fun m!461405 () Bool)

(assert (=> b!323278 m!461405))

(declare-fun m!461407 () Bool)

(assert (=> start!72084 m!461407))

(declare-fun m!461409 () Bool)

(assert (=> b!323275 m!461409))

(declare-fun m!461411 () Bool)

(assert (=> b!323274 m!461411))

(declare-fun m!461413 () Bool)

(assert (=> b!323273 m!461413))

(push 1)

(assert (not b!323278))

(assert (not start!72084))

(assert (not b!323275))

(assert (not b!323276))

(assert (not b!323273))

(assert (not b!323274))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106020 () Bool)

(assert (=> d!106020 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743)) (ite (= (bvsub #b00000000000000000000000001000000 i!743) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!743))))))))

(assert (=> b!323276 d!106020))

(declare-fun d!106022 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!106022 (= (inv!12 thiss!1793) (invariant!0 (currentBit!14990 thiss!1793) (currentByte!14995 thiss!1793) (size!8988 (buf!8130 thiss!1793))))))

(declare-fun bs!27927 () Bool)

(assert (= bs!27927 d!106022))

(declare-fun m!461415 () Bool)

(assert (=> bs!27927 m!461415))

(assert (=> start!72084 d!106022))

(declare-fun d!106026 () Bool)

(assert (=> d!106026 (= (array_inv!8540 (buf!8130 thiss!1793)) (bvsge (size!8988 (buf!8130 thiss!1793)) #b00000000000000000000000000000000))))

(assert (=> b!323278 d!106026))

(declare-fun d!106028 () Bool)

(declare-fun e!232926 () Bool)

(assert (=> d!106028 e!232926))

(declare-fun res!265386 () Bool)

(assert (=> d!106028 (=> (not res!265386) (not e!232926))))

(declare-fun lt!445878 () (_ BitVec 64))

(declare-fun lt!445876 () (_ BitVec 64))

(declare-fun lt!445880 () (_ BitVec 64))

(assert (=> d!106028 (= res!265386 (= lt!445880 (bvsub lt!445876 lt!445878)))))

(assert (=> d!106028 (or (= (bvand lt!445876 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!445878 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!445876 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!445876 lt!445878) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!106028 (= lt!445878 (remainingBits!0 ((_ sign_extend 32) (size!8988 (buf!8130 thiss!1793))) ((_ sign_extend 32) (currentByte!14995 thiss!1793)) ((_ sign_extend 32) (currentBit!14990 thiss!1793))))))

(declare-fun lt!445875 () (_ BitVec 64))

(declare-fun lt!445879 () (_ BitVec 64))

(assert (=> d!106028 (= lt!445876 (bvmul lt!445875 lt!445879))))

(assert (=> d!106028 (or (= lt!445875 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!445879 (bvsdiv (bvmul lt!445875 lt!445879) lt!445875)))))

(assert (=> d!106028 (= lt!445879 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106028 (= lt!445875 ((_ sign_extend 32) (size!8988 (buf!8130 thiss!1793))))))

(assert (=> d!106028 (= lt!445880 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14995 thiss!1793)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14990 thiss!1793))))))

(assert (=> d!106028 (invariant!0 (currentBit!14990 thiss!1793) (currentByte!14995 thiss!1793) (size!8988 (buf!8130 thiss!1793)))))

(assert (=> d!106028 (= (bitIndex!0 (size!8988 (buf!8130 thiss!1793)) (currentByte!14995 thiss!1793) (currentBit!14990 thiss!1793)) lt!445880)))

(declare-fun b!323289 () Bool)

(declare-fun res!265387 () Bool)

(assert (=> b!323289 (=> (not res!265387) (not e!232926))))

(assert (=> b!323289 (= res!265387 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!445880))))

(declare-fun b!323290 () Bool)

(declare-fun lt!445877 () (_ BitVec 64))

(assert (=> b!323290 (= e!232926 (bvsle lt!445880 (bvmul lt!445877 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!323290 (or (= lt!445877 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!445877 #b0000000000000000000000000000000000000000000000000000000000001000) lt!445877)))))

(assert (=> b!323290 (= lt!445877 ((_ sign_extend 32) (size!8988 (buf!8130 thiss!1793))))))

(assert (= (and d!106028 res!265386) b!323289))

(assert (= (and b!323289 res!265387) b!323290))

(declare-fun m!461423 () Bool)

(assert (=> d!106028 m!461423))

(assert (=> d!106028 m!461415))

(assert (=> b!323273 d!106028))

(declare-fun d!106040 () Bool)

(assert (=> d!106040 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8988 (buf!8130 thiss!1793))) ((_ sign_extend 32) (currentByte!14995 thiss!1793)) ((_ sign_extend 32) (currentBit!14990 thiss!1793)) lt!445844) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8988 (buf!8130 thiss!1793))) ((_ sign_extend 32) (currentByte!14995 thiss!1793)) ((_ sign_extend 32) (currentBit!14990 thiss!1793))) lt!445844))))

(declare-fun bs!27931 () Bool)

(assert (= bs!27931 d!106040))

(assert (=> bs!27931 m!461423))

(assert (=> b!323275 d!106040))

(declare-fun d!106042 () Bool)

(assert (=> d!106042 (= (onesLSBLong!0 nBits!548) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!548))))))

(assert (=> b!323274 d!106042))

(push 1)

(assert (not d!106040))

(assert (not d!106022))

(assert (not d!106028))

(check-sat)

(pop 1)

(push 1)

(check-sat)

