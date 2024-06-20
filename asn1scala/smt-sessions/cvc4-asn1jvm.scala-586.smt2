; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16822 () Bool)

(assert start!16822)

(declare-fun b!82837 () Bool)

(declare-fun e!54876 () Bool)

(declare-datatypes ((array!3762 0))(
  ( (array!3763 (arr!2354 (Array (_ BitVec 32) (_ BitVec 8))) (size!1717 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2996 0))(
  ( (BitStream!2997 (buf!2107 array!3762) (currentByte!4155 (_ BitVec 32)) (currentBit!4150 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!2996)

(declare-fun array_inv!1563 (array!3762) Bool)

(assert (=> b!82837 (= e!54876 (array_inv!1563 (buf!2107 b2!98)))))

(declare-fun res!68212 () Bool)

(declare-fun e!54874 () Bool)

(assert (=> start!16822 (=> (not res!68212) (not e!54874))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun b1!98 () BitStream!2996)

(assert (=> start!16822 (= res!68212 (and (= (size!1717 (buf!2107 b1!98)) (size!1717 (buf!2107 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16822 e!54874))

(declare-fun e!54879 () Bool)

(declare-fun inv!12 (BitStream!2996) Bool)

(assert (=> start!16822 (and (inv!12 b1!98) e!54879)))

(assert (=> start!16822 (and (inv!12 b2!98) e!54876)))

(assert (=> start!16822 true))

(declare-fun b!82838 () Bool)

(assert (=> b!82838 (= e!54879 (array_inv!1563 (buf!2107 b1!98)))))

(declare-fun b!82839 () Bool)

(declare-fun e!54878 () Bool)

(assert (=> b!82839 (= e!54874 e!54878)))

(declare-fun res!68209 () Bool)

(assert (=> b!82839 (=> (not res!68209) (not e!54878))))

(declare-fun lt!131957 () (_ BitVec 64))

(declare-fun lt!131960 () (_ BitVec 64))

(assert (=> b!82839 (= res!68209 (= lt!131957 lt!131960))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!82839 (= lt!131960 (bitIndex!0 (size!1717 (buf!2107 b2!98)) (currentByte!4155 b2!98) (currentBit!4150 b2!98)))))

(declare-fun lt!131959 () (_ BitVec 64))

(assert (=> b!82839 (= lt!131957 (bvadd lt!131959 b1b2Diff!1))))

(assert (=> b!82839 (= lt!131959 (bitIndex!0 (size!1717 (buf!2107 b1!98)) (currentByte!4155 b1!98) (currentBit!4150 b1!98)))))

(declare-fun lt!131962 () (_ BitVec 64))

(declare-fun lt!131964 () (_ BitVec 64))

(declare-fun e!54877 () Bool)

(declare-fun b!82840 () Bool)

(assert (=> b!82840 (= e!54877 (or (not (= lt!131962 (bvsub lt!131964 lt!131957))) (bvslt lt!131962 (bvsub b1ValidateOffsetBits!11 b1b2Diff!1)) (bvsgt ((_ sign_extend 32) (size!1717 (buf!2107 b2!98))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4155 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4150 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (and (bvsge ((_ sign_extend 32) (size!1717 (buf!2107 b2!98))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4155 b2!98)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4150 b2!98)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!82840 (= lt!131962 (bvsub lt!131964 lt!131960))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!82840 (= lt!131962 (remainingBits!0 ((_ sign_extend 32) (size!1717 (buf!2107 b2!98))) ((_ sign_extend 32) (currentByte!4155 b2!98)) ((_ sign_extend 32) (currentBit!4150 b2!98))))))

(assert (=> b!82840 (= lt!131964 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1717 (buf!2107 b2!98)))))))

(declare-datatypes ((Unit!5543 0))(
  ( (Unit!5544) )
))
(declare-fun lt!131958 () Unit!5543)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!2996) Unit!5543)

(assert (=> b!82840 (= lt!131958 (remainingBitsBitIndexLemma!0 b2!98))))

(declare-fun b!82841 () Bool)

(assert (=> b!82841 (= e!54878 (not e!54877))))

(declare-fun res!68211 () Bool)

(assert (=> b!82841 (=> res!68211 e!54877)))

(declare-fun lt!131963 () (_ BitVec 64))

(assert (=> b!82841 (= res!68211 (bvsgt lt!131959 (bvsub lt!131963 b1ValidateOffsetBits!11)))))

(assert (=> b!82841 (= (remainingBits!0 ((_ sign_extend 32) (size!1717 (buf!2107 b1!98))) ((_ sign_extend 32) (currentByte!4155 b1!98)) ((_ sign_extend 32) (currentBit!4150 b1!98))) (bvsub lt!131963 lt!131959))))

(assert (=> b!82841 (= lt!131963 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1717 (buf!2107 b1!98)))))))

(declare-fun lt!131961 () Unit!5543)

(assert (=> b!82841 (= lt!131961 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!82842 () Bool)

(declare-fun res!68210 () Bool)

(assert (=> b!82842 (=> (not res!68210) (not e!54874))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!82842 (= res!68210 (validate_offset_bits!1 ((_ sign_extend 32) (size!1717 (buf!2107 b1!98))) ((_ sign_extend 32) (currentByte!4155 b1!98)) ((_ sign_extend 32) (currentBit!4150 b1!98)) b1ValidateOffsetBits!11))))

(assert (= (and start!16822 res!68212) b!82842))

(assert (= (and b!82842 res!68210) b!82839))

(assert (= (and b!82839 res!68209) b!82841))

(assert (= (and b!82841 (not res!68211)) b!82840))

(assert (= start!16822 b!82838))

(assert (= start!16822 b!82837))

(declare-fun m!129347 () Bool)

(assert (=> b!82841 m!129347))

(declare-fun m!129349 () Bool)

(assert (=> b!82841 m!129349))

(declare-fun m!129351 () Bool)

(assert (=> b!82840 m!129351))

(declare-fun m!129353 () Bool)

(assert (=> b!82840 m!129353))

(declare-fun m!129355 () Bool)

(assert (=> start!16822 m!129355))

(declare-fun m!129357 () Bool)

(assert (=> start!16822 m!129357))

(declare-fun m!129359 () Bool)

(assert (=> b!82838 m!129359))

(declare-fun m!129361 () Bool)

(assert (=> b!82837 m!129361))

(declare-fun m!129363 () Bool)

(assert (=> b!82839 m!129363))

(declare-fun m!129365 () Bool)

(assert (=> b!82839 m!129365))

(declare-fun m!129367 () Bool)

(assert (=> b!82842 m!129367))

(push 1)

(assert (not b!82842))

(assert (not b!82840))

(assert (not b!82837))

(assert (not start!16822))

(assert (not b!82838))

(assert (not b!82839))

(assert (not b!82841))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!26360 () Bool)

(assert (=> d!26360 (= (array_inv!1563 (buf!2107 b1!98)) (bvsge (size!1717 (buf!2107 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!82838 d!26360))

(declare-fun d!26362 () Bool)

(assert (=> d!26362 (= (array_inv!1563 (buf!2107 b2!98)) (bvsge (size!1717 (buf!2107 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!82837 d!26362))

(declare-fun d!26364 () Bool)

(declare-fun e!54890 () Bool)

(assert (=> d!26364 e!54890))

(declare-fun res!68233 () Bool)

(assert (=> d!26364 (=> (not res!68233) (not e!54890))))

(declare-fun lt!132066 () (_ BitVec 64))

(declare-fun lt!132067 () (_ BitVec 64))

(declare-fun lt!132069 () (_ BitVec 64))

(assert (=> d!26364 (= res!68233 (= lt!132067 (bvsub lt!132066 lt!132069)))))

(assert (=> d!26364 (or (= (bvand lt!132066 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!132069 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!132066 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!132066 lt!132069) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26364 (= lt!132069 (remainingBits!0 ((_ sign_extend 32) (size!1717 (buf!2107 b2!98))) ((_ sign_extend 32) (currentByte!4155 b2!98)) ((_ sign_extend 32) (currentBit!4150 b2!98))))))

(declare-fun lt!132070 () (_ BitVec 64))

(declare-fun lt!132065 () (_ BitVec 64))

(assert (=> d!26364 (= lt!132066 (bvmul lt!132070 lt!132065))))

(assert (=> d!26364 (or (= lt!132070 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!132065 (bvsdiv (bvmul lt!132070 lt!132065) lt!132070)))))

(assert (=> d!26364 (= lt!132065 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26364 (= lt!132070 ((_ sign_extend 32) (size!1717 (buf!2107 b2!98))))))

(assert (=> d!26364 (= lt!132067 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4155 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4150 b2!98))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!26364 (invariant!0 (currentBit!4150 b2!98) (currentByte!4155 b2!98) (size!1717 (buf!2107 b2!98)))))

(assert (=> d!26364 (= (bitIndex!0 (size!1717 (buf!2107 b2!98)) (currentByte!4155 b2!98) (currentBit!4150 b2!98)) lt!132067)))

(declare-fun b!82865 () Bool)

(declare-fun res!68234 () Bool)

(assert (=> b!82865 (=> (not res!68234) (not e!54890))))

(assert (=> b!82865 (= res!68234 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!132067))))

(declare-fun b!82866 () Bool)

(declare-fun lt!132068 () (_ BitVec 64))

(assert (=> b!82866 (= e!54890 (bvsle lt!132067 (bvmul lt!132068 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82866 (or (= lt!132068 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!132068 #b0000000000000000000000000000000000000000000000000000000000001000) lt!132068)))))

(assert (=> b!82866 (= lt!132068 ((_ sign_extend 32) (size!1717 (buf!2107 b2!98))))))

(assert (= (and d!26364 res!68233) b!82865))

(assert (= (and b!82865 res!68234) b!82866))

(assert (=> d!26364 m!129351))

(declare-fun m!129385 () Bool)

(assert (=> d!26364 m!129385))

(assert (=> b!82839 d!26364))

(declare-fun d!26366 () Bool)

(declare-fun e!54891 () Bool)

(assert (=> d!26366 e!54891))

(declare-fun res!68235 () Bool)

(assert (=> d!26366 (=> (not res!68235) (not e!54891))))

(declare-fun lt!132075 () (_ BitVec 64))

(declare-fun lt!132073 () (_ BitVec 64))

(declare-fun lt!132072 () (_ BitVec 64))

(assert (=> d!26366 (= res!68235 (= lt!132073 (bvsub lt!132072 lt!132075)))))

(assert (=> d!26366 (or (= (bvand lt!132072 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!132075 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!132072 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!132072 lt!132075) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26366 (= lt!132075 (remainingBits!0 ((_ sign_extend 32) (size!1717 (buf!2107 b1!98))) ((_ sign_extend 32) (currentByte!4155 b1!98)) ((_ sign_extend 32) (currentBit!4150 b1!98))))))

(declare-fun lt!132076 () (_ BitVec 64))

(declare-fun lt!132071 () (_ BitVec 64))

(assert (=> d!26366 (= lt!132072 (bvmul lt!132076 lt!132071))))

(assert (=> d!26366 (or (= lt!132076 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!132071 (bvsdiv (bvmul lt!132076 lt!132071) lt!132076)))))

(assert (=> d!26366 (= lt!132071 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26366 (= lt!132076 ((_ sign_extend 32) (size!1717 (buf!2107 b1!98))))))

(assert (=> d!26366 (= lt!132073 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4155 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4150 b1!98))))))

(assert (=> d!26366 (invariant!0 (currentBit!4150 b1!98) (currentByte!4155 b1!98) (size!1717 (buf!2107 b1!98)))))

(assert (=> d!26366 (= (bitIndex!0 (size!1717 (buf!2107 b1!98)) (currentByte!4155 b1!98) (currentBit!4150 b1!98)) lt!132073)))

(declare-fun b!82867 () Bool)

(declare-fun res!68236 () Bool)

(assert (=> b!82867 (=> (not res!68236) (not e!54891))))

(assert (=> b!82867 (= res!68236 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!132073))))

(declare-fun b!82868 () Bool)

(declare-fun lt!132074 () (_ BitVec 64))

(assert (=> b!82868 (= e!54891 (bvsle lt!132073 (bvmul lt!132074 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82868 (or (= lt!132074 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!132074 #b0000000000000000000000000000000000000000000000000000000000001000) lt!132074)))))

(assert (=> b!82868 (= lt!132074 ((_ sign_extend 32) (size!1717 (buf!2107 b1!98))))))

(assert (= (and d!26366 res!68235) b!82867))

(assert (= (and b!82867 res!68236) b!82868))

(assert (=> d!26366 m!129347))

(declare-fun m!129387 () Bool)

(assert (=> d!26366 m!129387))

(assert (=> b!82839 d!26366))

(declare-fun d!26368 () Bool)

(assert (=> d!26368 (= (remainingBits!0 ((_ sign_extend 32) (size!1717 (buf!2107 b2!98))) ((_ sign_extend 32) (currentByte!4155 b2!98)) ((_ sign_extend 32) (currentBit!4150 b2!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1717 (buf!2107 b2!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4155 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4150 b2!98)))))))

(assert (=> b!82840 d!26368))

(declare-fun d!26370 () Bool)

(declare-fun lt!132089 () (_ BitVec 64))

(declare-fun lt!132087 () (_ BitVec 64))

(assert (=> d!26370 (= (remainingBits!0 ((_ sign_extend 32) (size!1717 (buf!2107 b2!98))) ((_ sign_extend 32) (currentByte!4155 b2!98)) ((_ sign_extend 32) (currentBit!4150 b2!98))) (bvsub lt!132089 lt!132087))))

(assert (=> d!26370 (or (= (bvand lt!132089 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!132087 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!132089 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!132089 lt!132087) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26370 (= lt!132087 (bitIndex!0 (size!1717 (buf!2107 b2!98)) (currentByte!4155 b2!98) (currentBit!4150 b2!98)))))

(declare-fun lt!132090 () (_ BitVec 64))

(declare-fun lt!132088 () (_ BitVec 64))

(assert (=> d!26370 (= lt!132089 (bvmul lt!132090 lt!132088))))

(assert (=> d!26370 (or (= lt!132090 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!132088 (bvsdiv (bvmul lt!132090 lt!132088) lt!132090)))))

(assert (=> d!26370 (= lt!132088 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26370 (= lt!132090 ((_ sign_extend 32) (size!1717 (buf!2107 b2!98))))))

(declare-fun lt!132091 () Unit!5543)

(declare-fun choose!23 (BitStream!2996) Unit!5543)

(assert (=> d!26370 (= lt!132091 (choose!23 b2!98))))

(assert (=> d!26370 (= (remainingBitsBitIndexLemma!0 b2!98) lt!132091)))

(declare-fun bs!6468 () Bool)

(assert (= bs!6468 d!26370))

(assert (=> bs!6468 m!129351))

(assert (=> bs!6468 m!129363))

(declare-fun m!129389 () Bool)

(assert (=> bs!6468 m!129389))

(assert (=> b!82840 d!26370))

(declare-fun d!26372 () Bool)

(assert (=> d!26372 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1717 (buf!2107 b1!98))) ((_ sign_extend 32) (currentByte!4155 b1!98)) ((_ sign_extend 32) (currentBit!4150 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1717 (buf!2107 b1!98))) ((_ sign_extend 32) (currentByte!4155 b1!98)) ((_ sign_extend 32) (currentBit!4150 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6469 () Bool)

(assert (= bs!6469 d!26372))

(assert (=> bs!6469 m!129347))

(assert (=> b!82842 d!26372))

(declare-fun d!26374 () Bool)

(assert (=> d!26374 (= (inv!12 b1!98) (invariant!0 (currentBit!4150 b1!98) (currentByte!4155 b1!98) (size!1717 (buf!2107 b1!98))))))

(declare-fun bs!6470 () Bool)

(assert (= bs!6470 d!26374))

(assert (=> bs!6470 m!129387))

(assert (=> start!16822 d!26374))

(declare-fun d!26376 () Bool)

(assert (=> d!26376 (= (inv!12 b2!98) (invariant!0 (currentBit!4150 b2!98) (currentByte!4155 b2!98) (size!1717 (buf!2107 b2!98))))))

(declare-fun bs!6471 () Bool)

(assert (= bs!6471 d!26376))

(assert (=> bs!6471 m!129385))

(assert (=> start!16822 d!26376))

(declare-fun d!26378 () Bool)

(assert (=> d!26378 (= (remainingBits!0 ((_ sign_extend 32) (size!1717 (buf!2107 b1!98))) ((_ sign_extend 32) (currentByte!4155 b1!98)) ((_ sign_extend 32) (currentBit!4150 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1717 (buf!2107 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4155 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4150 b1!98)))))))

(assert (=> b!82841 d!26378))

(declare-fun d!26380 () Bool)

(declare-fun lt!132094 () (_ BitVec 64))

(declare-fun lt!132092 () (_ BitVec 64))

(assert (=> d!26380 (= (remainingBits!0 ((_ sign_extend 32) (size!1717 (buf!2107 b1!98))) ((_ sign_extend 32) (currentByte!4155 b1!98)) ((_ sign_extend 32) (currentBit!4150 b1!98))) (bvsub lt!132094 lt!132092))))

(assert (=> d!26380 (or (= (bvand lt!132094 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!132092 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!132094 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!132094 lt!132092) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26380 (= lt!132092 (bitIndex!0 (size!1717 (buf!2107 b1!98)) (currentByte!4155 b1!98) (currentBit!4150 b1!98)))))

(declare-fun lt!132095 () (_ BitVec 64))

(declare-fun lt!132093 () (_ BitVec 64))

(assert (=> d!26380 (= lt!132094 (bvmul lt!132095 lt!132093))))

(assert (=> d!26380 (or (= lt!132095 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!132093 (bvsdiv (bvmul lt!132095 lt!132093) lt!132095)))))

(assert (=> d!26380 (= lt!132093 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26380 (= lt!132095 ((_ sign_extend 32) (size!1717 (buf!2107 b1!98))))))

(declare-fun lt!132096 () Unit!5543)

(assert (=> d!26380 (= lt!132096 (choose!23 b1!98))))

(assert (=> d!26380 (= (remainingBitsBitIndexLemma!0 b1!98) lt!132096)))

(declare-fun bs!6472 () Bool)

(assert (= bs!6472 d!26380))

(assert (=> bs!6472 m!129347))

(assert (=> bs!6472 m!129365))

(declare-fun m!129391 () Bool)

(assert (=> bs!6472 m!129391))

(assert (=> b!82841 d!26380))

(push 1)

(assert (not d!26372))

(assert (not d!26376))

(assert (not d!26370))

(assert (not d!26364))

(assert (not d!26380))

(assert (not d!26374))

(assert (not d!26366))

(check-sat)

(pop 1)

(push 1)

(check-sat)

