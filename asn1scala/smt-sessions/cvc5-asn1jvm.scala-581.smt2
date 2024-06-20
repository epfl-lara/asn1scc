; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16664 () Bool)

(assert start!16664)

(declare-fun b!82440 () Bool)

(declare-fun res!67924 () Bool)

(declare-fun e!54476 () Bool)

(assert (=> b!82440 (=> (not res!67924) (not e!54476))))

(declare-datatypes ((array!3719 0))(
  ( (array!3720 (arr!2337 (Array (_ BitVec 32) (_ BitVec 8))) (size!1700 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2962 0))(
  ( (BitStream!2963 (buf!2090 array!3719) (currentByte!4104 (_ BitVec 32)) (currentBit!4099 (_ BitVec 32))) )
))
(declare-fun b1!98 () BitStream!2962)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!82440 (= res!67924 (validate_offset_bits!1 ((_ sign_extend 32) (size!1700 (buf!2090 b1!98))) ((_ sign_extend 32) (currentByte!4104 b1!98)) ((_ sign_extend 32) (currentBit!4099 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!82441 () Bool)

(declare-fun e!54472 () Bool)

(assert (=> b!82441 (= e!54476 e!54472)))

(declare-fun res!67926 () Bool)

(assert (=> b!82441 (=> (not res!67926) (not e!54472))))

(declare-fun lt!131177 () (_ BitVec 64))

(declare-fun lt!131174 () (_ BitVec 64))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(assert (=> b!82441 (= res!67926 (= (bvadd lt!131177 b1b2Diff!1) lt!131174))))

(declare-fun b2!98 () BitStream!2962)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!82441 (= lt!131174 (bitIndex!0 (size!1700 (buf!2090 b2!98)) (currentByte!4104 b2!98) (currentBit!4099 b2!98)))))

(assert (=> b!82441 (= lt!131177 (bitIndex!0 (size!1700 (buf!2090 b1!98)) (currentByte!4104 b1!98) (currentBit!4099 b1!98)))))

(declare-fun b!82442 () Bool)

(declare-fun e!54477 () Bool)

(declare-fun array_inv!1546 (array!3719) Bool)

(assert (=> b!82442 (= e!54477 (array_inv!1546 (buf!2090 b1!98)))))

(declare-fun b!82444 () Bool)

(declare-fun e!54473 () Bool)

(assert (=> b!82444 (= e!54473 (array_inv!1546 (buf!2090 b2!98)))))

(declare-fun b!82445 () Bool)

(declare-fun e!54475 () Bool)

(assert (=> b!82445 (= e!54472 (not e!54475))))

(declare-fun res!67927 () Bool)

(assert (=> b!82445 (=> res!67927 e!54475)))

(declare-fun lt!131176 () (_ BitVec 64))

(assert (=> b!82445 (= res!67927 (bvsgt lt!131177 (bvsub lt!131176 b1ValidateOffsetBits!11)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!82445 (= (remainingBits!0 ((_ sign_extend 32) (size!1700 (buf!2090 b1!98))) ((_ sign_extend 32) (currentByte!4104 b1!98)) ((_ sign_extend 32) (currentBit!4099 b1!98))) (bvsub lt!131176 lt!131177))))

(assert (=> b!82445 (= lt!131176 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1700 (buf!2090 b1!98)))))))

(declare-datatypes ((Unit!5509 0))(
  ( (Unit!5510) )
))
(declare-fun lt!131178 () Unit!5509)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!2962) Unit!5509)

(assert (=> b!82445 (= lt!131178 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun res!67925 () Bool)

(assert (=> start!16664 (=> (not res!67925) (not e!54476))))

(assert (=> start!16664 (= res!67925 (and (= (size!1700 (buf!2090 b1!98)) (size!1700 (buf!2090 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16664 e!54476))

(declare-fun inv!12 (BitStream!2962) Bool)

(assert (=> start!16664 (and (inv!12 b1!98) e!54477)))

(assert (=> start!16664 (and (inv!12 b2!98) e!54473)))

(assert (=> start!16664 true))

(declare-fun b!82443 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!82443 (= e!54475 (invariant!0 (currentBit!4099 b1!98) (currentByte!4104 b1!98) (size!1700 (buf!2090 b1!98))))))

(assert (=> b!82443 (= (remainingBits!0 ((_ sign_extend 32) (size!1700 (buf!2090 b2!98))) ((_ sign_extend 32) (currentByte!4104 b2!98)) ((_ sign_extend 32) (currentBit!4099 b2!98))) (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1700 (buf!2090 b2!98)))) lt!131174))))

(declare-fun lt!131175 () Unit!5509)

(assert (=> b!82443 (= lt!131175 (remainingBitsBitIndexLemma!0 b2!98))))

(assert (= (and start!16664 res!67925) b!82440))

(assert (= (and b!82440 res!67924) b!82441))

(assert (= (and b!82441 res!67926) b!82445))

(assert (= (and b!82445 (not res!67927)) b!82443))

(assert (= start!16664 b!82442))

(assert (= start!16664 b!82444))

(declare-fun m!128895 () Bool)

(assert (=> b!82440 m!128895))

(declare-fun m!128897 () Bool)

(assert (=> b!82442 m!128897))

(declare-fun m!128899 () Bool)

(assert (=> start!16664 m!128899))

(declare-fun m!128901 () Bool)

(assert (=> start!16664 m!128901))

(declare-fun m!128903 () Bool)

(assert (=> b!82444 m!128903))

(declare-fun m!128905 () Bool)

(assert (=> b!82445 m!128905))

(declare-fun m!128907 () Bool)

(assert (=> b!82445 m!128907))

(declare-fun m!128909 () Bool)

(assert (=> b!82443 m!128909))

(declare-fun m!128911 () Bool)

(assert (=> b!82443 m!128911))

(declare-fun m!128913 () Bool)

(assert (=> b!82443 m!128913))

(declare-fun m!128915 () Bool)

(assert (=> b!82441 m!128915))

(declare-fun m!128917 () Bool)

(assert (=> b!82441 m!128917))

(push 1)

(assert (not b!82440))

(assert (not b!82442))

(assert (not start!16664))

(assert (not b!82444))

(assert (not b!82441))

(assert (not b!82445))

(assert (not b!82443))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!26112 () Bool)

(declare-fun e!54528 () Bool)

(assert (=> d!26112 e!54528))

(declare-fun res!67968 () Bool)

(assert (=> d!26112 (=> (not res!67968) (not e!54528))))

(declare-fun lt!131275 () (_ BitVec 64))

(declare-fun lt!131278 () (_ BitVec 64))

(declare-fun lt!131277 () (_ BitVec 64))

(assert (=> d!26112 (= res!67968 (= lt!131277 (bvsub lt!131275 lt!131278)))))

(assert (=> d!26112 (or (= (bvand lt!131275 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!131278 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!131275 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!131275 lt!131278) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26112 (= lt!131278 (remainingBits!0 ((_ sign_extend 32) (size!1700 (buf!2090 b2!98))) ((_ sign_extend 32) (currentByte!4104 b2!98)) ((_ sign_extend 32) (currentBit!4099 b2!98))))))

(declare-fun lt!131279 () (_ BitVec 64))

(declare-fun lt!131276 () (_ BitVec 64))

(assert (=> d!26112 (= lt!131275 (bvmul lt!131279 lt!131276))))

(assert (=> d!26112 (or (= lt!131279 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!131276 (bvsdiv (bvmul lt!131279 lt!131276) lt!131279)))))

(assert (=> d!26112 (= lt!131276 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26112 (= lt!131279 ((_ sign_extend 32) (size!1700 (buf!2090 b2!98))))))

(assert (=> d!26112 (= lt!131277 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4104 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4099 b2!98))))))

(assert (=> d!26112 (invariant!0 (currentBit!4099 b2!98) (currentByte!4104 b2!98) (size!1700 (buf!2090 b2!98)))))

(assert (=> d!26112 (= (bitIndex!0 (size!1700 (buf!2090 b2!98)) (currentByte!4104 b2!98) (currentBit!4099 b2!98)) lt!131277)))

(declare-fun b!82499 () Bool)

(declare-fun res!67969 () Bool)

(assert (=> b!82499 (=> (not res!67969) (not e!54528))))

(assert (=> b!82499 (= res!67969 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!131277))))

(declare-fun b!82500 () Bool)

(declare-fun lt!131280 () (_ BitVec 64))

(assert (=> b!82500 (= e!54528 (bvsle lt!131277 (bvmul lt!131280 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82500 (or (= lt!131280 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!131280 #b0000000000000000000000000000000000000000000000000000000000001000) lt!131280)))))

(assert (=> b!82500 (= lt!131280 ((_ sign_extend 32) (size!1700 (buf!2090 b2!98))))))

(assert (= (and d!26112 res!67968) b!82499))

(assert (= (and b!82499 res!67969) b!82500))

(assert (=> d!26112 m!128911))

(declare-fun m!128973 () Bool)

(assert (=> d!26112 m!128973))

(assert (=> b!82441 d!26112))

(declare-fun d!26116 () Bool)

(declare-fun e!54529 () Bool)

(assert (=> d!26116 e!54529))

(declare-fun res!67970 () Bool)

(assert (=> d!26116 (=> (not res!67970) (not e!54529))))

(declare-fun lt!131283 () (_ BitVec 64))

(declare-fun lt!131286 () (_ BitVec 64))

(declare-fun lt!131285 () (_ BitVec 64))

(assert (=> d!26116 (= res!67970 (= lt!131285 (bvsub lt!131283 lt!131286)))))

(assert (=> d!26116 (or (= (bvand lt!131283 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!131286 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!131283 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!131283 lt!131286) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26116 (= lt!131286 (remainingBits!0 ((_ sign_extend 32) (size!1700 (buf!2090 b1!98))) ((_ sign_extend 32) (currentByte!4104 b1!98)) ((_ sign_extend 32) (currentBit!4099 b1!98))))))

(declare-fun lt!131287 () (_ BitVec 64))

(declare-fun lt!131284 () (_ BitVec 64))

(assert (=> d!26116 (= lt!131283 (bvmul lt!131287 lt!131284))))

(assert (=> d!26116 (or (= lt!131287 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!131284 (bvsdiv (bvmul lt!131287 lt!131284) lt!131287)))))

(assert (=> d!26116 (= lt!131284 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26116 (= lt!131287 ((_ sign_extend 32) (size!1700 (buf!2090 b1!98))))))

(assert (=> d!26116 (= lt!131285 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4104 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4099 b1!98))))))

(assert (=> d!26116 (invariant!0 (currentBit!4099 b1!98) (currentByte!4104 b1!98) (size!1700 (buf!2090 b1!98)))))

(assert (=> d!26116 (= (bitIndex!0 (size!1700 (buf!2090 b1!98)) (currentByte!4104 b1!98) (currentBit!4099 b1!98)) lt!131285)))

(declare-fun b!82501 () Bool)

(declare-fun res!67971 () Bool)

(assert (=> b!82501 (=> (not res!67971) (not e!54529))))

(assert (=> b!82501 (= res!67971 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!131285))))

(declare-fun b!82502 () Bool)

(declare-fun lt!131288 () (_ BitVec 64))

(assert (=> b!82502 (= e!54529 (bvsle lt!131285 (bvmul lt!131288 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82502 (or (= lt!131288 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!131288 #b0000000000000000000000000000000000000000000000000000000000001000) lt!131288)))))

(assert (=> b!82502 (= lt!131288 ((_ sign_extend 32) (size!1700 (buf!2090 b1!98))))))

(assert (= (and d!26116 res!67970) b!82501))

(assert (= (and b!82501 res!67971) b!82502))

(assert (=> d!26116 m!128905))

(assert (=> d!26116 m!128909))

(assert (=> b!82441 d!26116))

(declare-fun d!26118 () Bool)

(assert (=> d!26118 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1700 (buf!2090 b1!98))) ((_ sign_extend 32) (currentByte!4104 b1!98)) ((_ sign_extend 32) (currentBit!4099 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1700 (buf!2090 b1!98))) ((_ sign_extend 32) (currentByte!4104 b1!98)) ((_ sign_extend 32) (currentBit!4099 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6401 () Bool)

(assert (= bs!6401 d!26118))

(assert (=> bs!6401 m!128905))

(assert (=> b!82440 d!26118))

(declare-fun d!26120 () Bool)

(assert (=> d!26120 (= (remainingBits!0 ((_ sign_extend 32) (size!1700 (buf!2090 b1!98))) ((_ sign_extend 32) (currentByte!4104 b1!98)) ((_ sign_extend 32) (currentBit!4099 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1700 (buf!2090 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4104 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4099 b1!98)))))))

(assert (=> b!82445 d!26120))

(declare-fun d!26128 () Bool)

(declare-fun lt!131325 () (_ BitVec 64))

(declare-fun lt!131321 () (_ BitVec 64))

(assert (=> d!26128 (= (remainingBits!0 ((_ sign_extend 32) (size!1700 (buf!2090 b1!98))) ((_ sign_extend 32) (currentByte!4104 b1!98)) ((_ sign_extend 32) (currentBit!4099 b1!98))) (bvsub lt!131325 lt!131321))))

(assert (=> d!26128 (or (= (bvand lt!131325 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!131321 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!131325 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!131325 lt!131321) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26128 (= lt!131321 (bitIndex!0 (size!1700 (buf!2090 b1!98)) (currentByte!4104 b1!98) (currentBit!4099 b1!98)))))

(declare-fun lt!131324 () (_ BitVec 64))

(declare-fun lt!131322 () (_ BitVec 64))

(assert (=> d!26128 (= lt!131325 (bvmul lt!131324 lt!131322))))

(assert (=> d!26128 (or (= lt!131324 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!131322 (bvsdiv (bvmul lt!131324 lt!131322) lt!131324)))))

(assert (=> d!26128 (= lt!131322 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26128 (= lt!131324 ((_ sign_extend 32) (size!1700 (buf!2090 b1!98))))))

(declare-fun lt!131323 () Unit!5509)

(declare-fun choose!23 (BitStream!2962) Unit!5509)

(assert (=> d!26128 (= lt!131323 (choose!23 b1!98))))

(assert (=> d!26128 (= (remainingBitsBitIndexLemma!0 b1!98) lt!131323)))

(declare-fun bs!6402 () Bool)

(assert (= bs!6402 d!26128))

(assert (=> bs!6402 m!128905))

(assert (=> bs!6402 m!128917))

(declare-fun m!128977 () Bool)

(assert (=> bs!6402 m!128977))

(assert (=> b!82445 d!26128))

(declare-fun d!26132 () Bool)

(assert (=> d!26132 (= (array_inv!1546 (buf!2090 b2!98)) (bvsge (size!1700 (buf!2090 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!82444 d!26132))

(declare-fun d!26134 () Bool)

(assert (=> d!26134 (= (inv!12 b1!98) (invariant!0 (currentBit!4099 b1!98) (currentByte!4104 b1!98) (size!1700 (buf!2090 b1!98))))))

(declare-fun bs!6404 () Bool)

(assert (= bs!6404 d!26134))

(assert (=> bs!6404 m!128909))

(assert (=> start!16664 d!26134))

(declare-fun d!26138 () Bool)

(assert (=> d!26138 (= (inv!12 b2!98) (invariant!0 (currentBit!4099 b2!98) (currentByte!4104 b2!98) (size!1700 (buf!2090 b2!98))))))

(declare-fun bs!6405 () Bool)

(assert (= bs!6405 d!26138))

(assert (=> bs!6405 m!128973))

(assert (=> start!16664 d!26138))

(declare-fun d!26140 () Bool)

(assert (=> d!26140 (= (invariant!0 (currentBit!4099 b1!98) (currentByte!4104 b1!98) (size!1700 (buf!2090 b1!98))) (and (bvsge (currentBit!4099 b1!98) #b00000000000000000000000000000000) (bvslt (currentBit!4099 b1!98) #b00000000000000000000000000001000) (bvsge (currentByte!4104 b1!98) #b00000000000000000000000000000000) (or (bvslt (currentByte!4104 b1!98) (size!1700 (buf!2090 b1!98))) (and (= (currentBit!4099 b1!98) #b00000000000000000000000000000000) (= (currentByte!4104 b1!98) (size!1700 (buf!2090 b1!98)))))))))

(assert (=> b!82443 d!26140))

(declare-fun d!26146 () Bool)

(assert (=> d!26146 (= (remainingBits!0 ((_ sign_extend 32) (size!1700 (buf!2090 b2!98))) ((_ sign_extend 32) (currentByte!4104 b2!98)) ((_ sign_extend 32) (currentBit!4099 b2!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1700 (buf!2090 b2!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4104 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4099 b2!98)))))))

(assert (=> b!82443 d!26146))

(declare-fun d!26150 () Bool)

(declare-fun lt!131335 () (_ BitVec 64))

(declare-fun lt!131331 () (_ BitVec 64))

(assert (=> d!26150 (= (remainingBits!0 ((_ sign_extend 32) (size!1700 (buf!2090 b2!98))) ((_ sign_extend 32) (currentByte!4104 b2!98)) ((_ sign_extend 32) (currentBit!4099 b2!98))) (bvsub lt!131335 lt!131331))))

(assert (=> d!26150 (or (= (bvand lt!131335 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!131331 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!131335 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!131335 lt!131331) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26150 (= lt!131331 (bitIndex!0 (size!1700 (buf!2090 b2!98)) (currentByte!4104 b2!98) (currentBit!4099 b2!98)))))

(declare-fun lt!131334 () (_ BitVec 64))

(declare-fun lt!131332 () (_ BitVec 64))

(assert (=> d!26150 (= lt!131335 (bvmul lt!131334 lt!131332))))

(assert (=> d!26150 (or (= lt!131334 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!131332 (bvsdiv (bvmul lt!131334 lt!131332) lt!131334)))))

(assert (=> d!26150 (= lt!131332 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26150 (= lt!131334 ((_ sign_extend 32) (size!1700 (buf!2090 b2!98))))))

(declare-fun lt!131333 () Unit!5509)

(assert (=> d!26150 (= lt!131333 (choose!23 b2!98))))

(assert (=> d!26150 (= (remainingBitsBitIndexLemma!0 b2!98) lt!131333)))

(declare-fun bs!6409 () Bool)

(assert (= bs!6409 d!26150))

(assert (=> bs!6409 m!128911))

(assert (=> bs!6409 m!128915))

(declare-fun m!128981 () Bool)

(assert (=> bs!6409 m!128981))

(assert (=> b!82443 d!26150))

(declare-fun d!26154 () Bool)

(assert (=> d!26154 (= (array_inv!1546 (buf!2090 b1!98)) (bvsge (size!1700 (buf!2090 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!82442 d!26154))

(push 1)

