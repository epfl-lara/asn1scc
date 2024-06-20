; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16616 () Bool)

(assert start!16616)

(declare-fun b!82352 () Bool)

(declare-fun res!67858 () Bool)

(declare-fun e!54391 () Bool)

(assert (=> b!82352 (=> (not res!67858) (not e!54391))))

(declare-datatypes ((array!3710 0))(
  ( (array!3711 (arr!2334 (Array (_ BitVec 32) (_ BitVec 8))) (size!1697 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2956 0))(
  ( (BitStream!2957 (buf!2087 array!3710) (currentByte!4089 (_ BitVec 32)) (currentBit!4084 (_ BitVec 32))) )
))
(declare-fun b1!98 () BitStream!2956)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!82352 (= res!67858 (validate_offset_bits!1 ((_ sign_extend 32) (size!1697 (buf!2087 b1!98))) ((_ sign_extend 32) (currentByte!4089 b1!98)) ((_ sign_extend 32) (currentBit!4084 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!82353 () Bool)

(declare-fun e!54393 () Bool)

(assert (=> b!82353 (= e!54391 e!54393)))

(declare-fun res!67857 () Bool)

(assert (=> b!82353 (=> (not res!67857) (not e!54393))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-fun lt!130997 () (_ BitVec 64))

(declare-fun lt!130999 () (_ BitVec 64))

(assert (=> b!82353 (= res!67857 (= (bvadd lt!130997 b1b2Diff!1) lt!130999))))

(declare-fun b2!98 () BitStream!2956)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!82353 (= lt!130999 (bitIndex!0 (size!1697 (buf!2087 b2!98)) (currentByte!4089 b2!98) (currentBit!4084 b2!98)))))

(assert (=> b!82353 (= lt!130997 (bitIndex!0 (size!1697 (buf!2087 b1!98)) (currentByte!4089 b1!98) (currentBit!4084 b1!98)))))

(declare-fun b!82354 () Bool)

(declare-fun e!54395 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!82354 (= e!54395 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4084 b2!98))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4089 b2!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1697 (buf!2087 b2!98))))))))

(declare-fun b!82355 () Bool)

(declare-fun e!54390 () Bool)

(declare-fun array_inv!1543 (array!3710) Bool)

(assert (=> b!82355 (= e!54390 (array_inv!1543 (buf!2087 b1!98)))))

(declare-fun b!82356 () Bool)

(declare-fun e!54394 () Bool)

(assert (=> b!82356 (= e!54393 (not e!54394))))

(declare-fun res!67859 () Bool)

(assert (=> b!82356 (=> res!67859 e!54394)))

(declare-fun lt!131001 () (_ BitVec 64))

(assert (=> b!82356 (= res!67859 (bvsgt lt!130997 (bvsub lt!131001 b1ValidateOffsetBits!11)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!82356 (= (remainingBits!0 ((_ sign_extend 32) (size!1697 (buf!2087 b1!98))) ((_ sign_extend 32) (currentByte!4089 b1!98)) ((_ sign_extend 32) (currentBit!4084 b1!98))) (bvsub lt!131001 lt!130997))))

(assert (=> b!82356 (= lt!131001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1697 (buf!2087 b1!98)))))))

(declare-datatypes ((Unit!5503 0))(
  ( (Unit!5504) )
))
(declare-fun lt!130998 () Unit!5503)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!2956) Unit!5503)

(assert (=> b!82356 (= lt!130998 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!82358 () Bool)

(declare-fun e!54389 () Bool)

(assert (=> b!82358 (= e!54389 (array_inv!1543 (buf!2087 b2!98)))))

(declare-fun res!67860 () Bool)

(assert (=> start!16616 (=> (not res!67860) (not e!54391))))

(assert (=> start!16616 (= res!67860 (and (= (size!1697 (buf!2087 b1!98)) (size!1697 (buf!2087 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16616 e!54391))

(declare-fun inv!12 (BitStream!2956) Bool)

(assert (=> start!16616 (and (inv!12 b1!98) e!54390)))

(assert (=> start!16616 (and (inv!12 b2!98) e!54389)))

(assert (=> start!16616 true))

(declare-fun b!82357 () Bool)

(assert (=> b!82357 (= e!54394 e!54395)))

(declare-fun res!67861 () Bool)

(assert (=> b!82357 (=> res!67861 e!54395)))

(assert (=> b!82357 (= res!67861 (or (bvsgt ((_ sign_extend 32) (size!1697 (buf!2087 b2!98))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4089 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4084 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvslt ((_ sign_extend 32) (size!1697 (buf!2087 b2!98))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!4089 b2!98)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!4084 b2!98)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!82357 (= (remainingBits!0 ((_ sign_extend 32) (size!1697 (buf!2087 b2!98))) ((_ sign_extend 32) (currentByte!4089 b2!98)) ((_ sign_extend 32) (currentBit!4084 b2!98))) (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1697 (buf!2087 b2!98)))) lt!130999))))

(declare-fun lt!131000 () Unit!5503)

(assert (=> b!82357 (= lt!131000 (remainingBitsBitIndexLemma!0 b2!98))))

(assert (= (and start!16616 res!67860) b!82352))

(assert (= (and b!82352 res!67858) b!82353))

(assert (= (and b!82353 res!67857) b!82356))

(assert (= (and b!82356 (not res!67859)) b!82357))

(assert (= (and b!82357 (not res!67861)) b!82354))

(assert (= start!16616 b!82355))

(assert (= start!16616 b!82358))

(declare-fun m!128799 () Bool)

(assert (=> start!16616 m!128799))

(declare-fun m!128801 () Bool)

(assert (=> start!16616 m!128801))

(declare-fun m!128803 () Bool)

(assert (=> b!82355 m!128803))

(declare-fun m!128805 () Bool)

(assert (=> b!82356 m!128805))

(declare-fun m!128807 () Bool)

(assert (=> b!82356 m!128807))

(declare-fun m!128809 () Bool)

(assert (=> b!82352 m!128809))

(declare-fun m!128811 () Bool)

(assert (=> b!82353 m!128811))

(declare-fun m!128813 () Bool)

(assert (=> b!82353 m!128813))

(declare-fun m!128815 () Bool)

(assert (=> b!82357 m!128815))

(declare-fun m!128817 () Bool)

(assert (=> b!82357 m!128817))

(declare-fun m!128819 () Bool)

(assert (=> b!82358 m!128819))

(declare-fun m!128821 () Bool)

(assert (=> b!82354 m!128821))

(push 1)

(assert (not b!82356))

(assert (not b!82355))

(assert (not b!82352))

(assert (not b!82354))

(assert (not b!82353))

(assert (not start!16616))

(assert (not b!82357))

(assert (not b!82358))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!26038 () Bool)

(assert (=> d!26038 (= (remainingBits!0 ((_ sign_extend 32) (size!1697 (buf!2087 b1!98))) ((_ sign_extend 32) (currentByte!4089 b1!98)) ((_ sign_extend 32) (currentBit!4084 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1697 (buf!2087 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4089 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4084 b1!98)))))))

(assert (=> b!82356 d!26038))

(declare-fun d!26040 () Bool)

(declare-fun lt!131088 () (_ BitVec 64))

(declare-fun lt!131087 () (_ BitVec 64))

(assert (=> d!26040 (= (remainingBits!0 ((_ sign_extend 32) (size!1697 (buf!2087 b1!98))) ((_ sign_extend 32) (currentByte!4089 b1!98)) ((_ sign_extend 32) (currentBit!4084 b1!98))) (bvsub lt!131088 lt!131087))))

(assert (=> d!26040 (or (= (bvand lt!131088 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!131087 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!131088 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!131088 lt!131087) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26040 (= lt!131087 (bitIndex!0 (size!1697 (buf!2087 b1!98)) (currentByte!4089 b1!98) (currentBit!4084 b1!98)))))

(declare-fun lt!131086 () (_ BitVec 64))

(declare-fun lt!131090 () (_ BitVec 64))

(assert (=> d!26040 (= lt!131088 (bvmul lt!131086 lt!131090))))

(assert (=> d!26040 (or (= lt!131086 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!131090 (bvsdiv (bvmul lt!131086 lt!131090) lt!131086)))))

(assert (=> d!26040 (= lt!131090 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26040 (= lt!131086 ((_ sign_extend 32) (size!1697 (buf!2087 b1!98))))))

(declare-fun lt!131089 () Unit!5503)

(declare-fun choose!23 (BitStream!2956) Unit!5503)

(assert (=> d!26040 (= lt!131089 (choose!23 b1!98))))

(assert (=> d!26040 (= (remainingBitsBitIndexLemma!0 b1!98) lt!131089)))

(declare-fun bs!6383 () Bool)

(assert (= bs!6383 d!26040))

(assert (=> bs!6383 m!128805))

(assert (=> bs!6383 m!128813))

(declare-fun m!128879 () Bool)

(assert (=> bs!6383 m!128879))

(assert (=> b!82356 d!26040))

(declare-fun d!26044 () Bool)

(assert (=> d!26044 (= (array_inv!1543 (buf!2087 b1!98)) (bvsge (size!1697 (buf!2087 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!82355 d!26044))

(declare-fun d!26046 () Bool)

(assert (=> d!26046 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4084 b2!98))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4089 b2!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1697 (buf!2087 b2!98))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4084 b2!98))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4084 b2!98))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4089 b2!98))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4089 b2!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1697 (buf!2087 b2!98))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4084 b2!98))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4089 b2!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1697 (buf!2087 b2!98)))))))))))

(assert (=> b!82354 d!26046))

(declare-fun d!26048 () Bool)

(declare-fun e!54455 () Bool)

(assert (=> d!26048 e!54455))

(declare-fun res!67913 () Bool)

(assert (=> d!26048 (=> (not res!67913) (not e!54455))))

(declare-fun lt!131130 () (_ BitVec 64))

(declare-fun lt!131127 () (_ BitVec 64))

(declare-fun lt!131128 () (_ BitVec 64))

(assert (=> d!26048 (= res!67913 (= lt!131130 (bvsub lt!131127 lt!131128)))))

(assert (=> d!26048 (or (= (bvand lt!131127 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!131128 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!131127 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!131127 lt!131128) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26048 (= lt!131128 (remainingBits!0 ((_ sign_extend 32) (size!1697 (buf!2087 b2!98))) ((_ sign_extend 32) (currentByte!4089 b2!98)) ((_ sign_extend 32) (currentBit!4084 b2!98))))))

(declare-fun lt!131129 () (_ BitVec 64))

(declare-fun lt!131132 () (_ BitVec 64))

(assert (=> d!26048 (= lt!131127 (bvmul lt!131129 lt!131132))))

(assert (=> d!26048 (or (= lt!131129 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!131132 (bvsdiv (bvmul lt!131129 lt!131132) lt!131129)))))

(assert (=> d!26048 (= lt!131132 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26048 (= lt!131129 ((_ sign_extend 32) (size!1697 (buf!2087 b2!98))))))

(assert (=> d!26048 (= lt!131130 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4089 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4084 b2!98))))))

(assert (=> d!26048 (invariant!0 (currentBit!4084 b2!98) (currentByte!4089 b2!98) (size!1697 (buf!2087 b2!98)))))

(assert (=> d!26048 (= (bitIndex!0 (size!1697 (buf!2087 b2!98)) (currentByte!4089 b2!98) (currentBit!4084 b2!98)) lt!131130)))

(declare-fun b!82423 () Bool)

(declare-fun res!67912 () Bool)

(assert (=> b!82423 (=> (not res!67912) (not e!54455))))

(assert (=> b!82423 (= res!67912 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!131130))))

(declare-fun b!82424 () Bool)

(declare-fun lt!131131 () (_ BitVec 64))

(assert (=> b!82424 (= e!54455 (bvsle lt!131130 (bvmul lt!131131 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82424 (or (= lt!131131 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!131131 #b0000000000000000000000000000000000000000000000000000000000001000) lt!131131)))))

(assert (=> b!82424 (= lt!131131 ((_ sign_extend 32) (size!1697 (buf!2087 b2!98))))))

(assert (= (and d!26048 res!67913) b!82423))

(assert (= (and b!82423 res!67912) b!82424))

(assert (=> d!26048 m!128815))

(declare-fun m!128885 () Bool)

(assert (=> d!26048 m!128885))

(assert (=> b!82353 d!26048))

(declare-fun d!26056 () Bool)

(declare-fun e!54456 () Bool)

(assert (=> d!26056 e!54456))

(declare-fun res!67915 () Bool)

(assert (=> d!26056 (=> (not res!67915) (not e!54456))))

(declare-fun lt!131133 () (_ BitVec 64))

(declare-fun lt!131136 () (_ BitVec 64))

(declare-fun lt!131134 () (_ BitVec 64))

(assert (=> d!26056 (= res!67915 (= lt!131136 (bvsub lt!131133 lt!131134)))))

(assert (=> d!26056 (or (= (bvand lt!131133 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!131134 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!131133 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!131133 lt!131134) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26056 (= lt!131134 (remainingBits!0 ((_ sign_extend 32) (size!1697 (buf!2087 b1!98))) ((_ sign_extend 32) (currentByte!4089 b1!98)) ((_ sign_extend 32) (currentBit!4084 b1!98))))))

(declare-fun lt!131135 () (_ BitVec 64))

(declare-fun lt!131138 () (_ BitVec 64))

(assert (=> d!26056 (= lt!131133 (bvmul lt!131135 lt!131138))))

(assert (=> d!26056 (or (= lt!131135 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!131138 (bvsdiv (bvmul lt!131135 lt!131138) lt!131135)))))

(assert (=> d!26056 (= lt!131138 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26056 (= lt!131135 ((_ sign_extend 32) (size!1697 (buf!2087 b1!98))))))

(assert (=> d!26056 (= lt!131136 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4089 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4084 b1!98))))))

(assert (=> d!26056 (invariant!0 (currentBit!4084 b1!98) (currentByte!4089 b1!98) (size!1697 (buf!2087 b1!98)))))

(assert (=> d!26056 (= (bitIndex!0 (size!1697 (buf!2087 b1!98)) (currentByte!4089 b1!98) (currentBit!4084 b1!98)) lt!131136)))

(declare-fun b!82425 () Bool)

(declare-fun res!67914 () Bool)

(assert (=> b!82425 (=> (not res!67914) (not e!54456))))

(assert (=> b!82425 (= res!67914 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!131136))))

(declare-fun b!82426 () Bool)

(declare-fun lt!131137 () (_ BitVec 64))

(assert (=> b!82426 (= e!54456 (bvsle lt!131136 (bvmul lt!131137 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82426 (or (= lt!131137 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!131137 #b0000000000000000000000000000000000000000000000000000000000001000) lt!131137)))))

(assert (=> b!82426 (= lt!131137 ((_ sign_extend 32) (size!1697 (buf!2087 b1!98))))))

(assert (= (and d!26056 res!67915) b!82425))

(assert (= (and b!82425 res!67914) b!82426))

(assert (=> d!26056 m!128805))

(declare-fun m!128887 () Bool)

(assert (=> d!26056 m!128887))

(assert (=> b!82353 d!26056))

(declare-fun d!26058 () Bool)

(assert (=> d!26058 (= (array_inv!1543 (buf!2087 b2!98)) (bvsge (size!1697 (buf!2087 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!82358 d!26058))

(declare-fun d!26060 () Bool)

(assert (=> d!26060 (= (inv!12 b1!98) (invariant!0 (currentBit!4084 b1!98) (currentByte!4089 b1!98) (size!1697 (buf!2087 b1!98))))))

(declare-fun bs!6384 () Bool)

(assert (= bs!6384 d!26060))

(assert (=> bs!6384 m!128887))

(assert (=> start!16616 d!26060))

(declare-fun d!26064 () Bool)

(assert (=> d!26064 (= (inv!12 b2!98) (invariant!0 (currentBit!4084 b2!98) (currentByte!4089 b2!98) (size!1697 (buf!2087 b2!98))))))

(declare-fun bs!6385 () Bool)

(assert (= bs!6385 d!26064))

(assert (=> bs!6385 m!128885))

(assert (=> start!16616 d!26064))

(declare-fun d!26066 () Bool)

(assert (=> d!26066 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1697 (buf!2087 b1!98))) ((_ sign_extend 32) (currentByte!4089 b1!98)) ((_ sign_extend 32) (currentBit!4084 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1697 (buf!2087 b1!98))) ((_ sign_extend 32) (currentByte!4089 b1!98)) ((_ sign_extend 32) (currentBit!4084 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6388 () Bool)

(assert (= bs!6388 d!26066))

(assert (=> bs!6388 m!128805))

(assert (=> b!82352 d!26066))

(declare-fun d!26072 () Bool)

(assert (=> d!26072 (= (remainingBits!0 ((_ sign_extend 32) (size!1697 (buf!2087 b2!98))) ((_ sign_extend 32) (currentByte!4089 b2!98)) ((_ sign_extend 32) (currentBit!4084 b2!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1697 (buf!2087 b2!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4089 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4084 b2!98)))))))

(assert (=> b!82357 d!26072))

(declare-fun d!26074 () Bool)

(declare-fun lt!131141 () (_ BitVec 64))

(declare-fun lt!131140 () (_ BitVec 64))

(assert (=> d!26074 (= (remainingBits!0 ((_ sign_extend 32) (size!1697 (buf!2087 b2!98))) ((_ sign_extend 32) (currentByte!4089 b2!98)) ((_ sign_extend 32) (currentBit!4084 b2!98))) (bvsub lt!131141 lt!131140))))

(assert (=> d!26074 (or (= (bvand lt!131141 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!131140 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!131141 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!131141 lt!131140) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26074 (= lt!131140 (bitIndex!0 (size!1697 (buf!2087 b2!98)) (currentByte!4089 b2!98) (currentBit!4084 b2!98)))))

(declare-fun lt!131139 () (_ BitVec 64))

(declare-fun lt!131143 () (_ BitVec 64))

(assert (=> d!26074 (= lt!131141 (bvmul lt!131139 lt!131143))))

(assert (=> d!26074 (or (= lt!131139 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!131143 (bvsdiv (bvmul lt!131139 lt!131143) lt!131139)))))

(assert (=> d!26074 (= lt!131143 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26074 (= lt!131139 ((_ sign_extend 32) (size!1697 (buf!2087 b2!98))))))

(declare-fun lt!131142 () Unit!5503)

(assert (=> d!26074 (= lt!131142 (choose!23 b2!98))))

(assert (=> d!26074 (= (remainingBitsBitIndexLemma!0 b2!98) lt!131142)))

(declare-fun bs!6389 () Bool)

(assert (= bs!6389 d!26074))

(assert (=> bs!6389 m!128815))

(assert (=> bs!6389 m!128811))

(declare-fun m!128889 () Bool)

(assert (=> bs!6389 m!128889))

(assert (=> b!82357 d!26074))

(push 1)

(assert (not d!26074))

(assert (not d!26060))

(assert (not d!26066))

(assert (not d!26056))

(assert (not d!26064))

(assert (not d!26048))

(assert (not d!26040))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

