; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16420 () Bool)

(assert start!16420)

(declare-fun b!81989 () Bool)

(declare-fun e!54045 () Bool)

(declare-fun e!54046 () Bool)

(assert (=> b!81989 (= e!54045 (not e!54046))))

(declare-fun res!67598 () Bool)

(assert (=> b!81989 (=> res!67598 e!54046)))

(declare-datatypes ((array!3668 0))(
  ( (array!3669 (arr!2319 (Array (_ BitVec 32) (_ BitVec 8))) (size!1682 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2926 0))(
  ( (BitStream!2927 (buf!2072 array!3668) (currentByte!4028 (_ BitVec 32)) (currentBit!4023 (_ BitVec 32))) )
))
(declare-fun b1!98 () BitStream!2926)

(assert (=> b!81989 (= res!67598 (or (bvsgt ((_ sign_extend 32) (size!1682 (buf!2072 b1!98))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4028 b1!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4023 b1!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvslt ((_ sign_extend 32) (size!1682 (buf!2072 b1!98))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!4028 b1!98)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!4023 b1!98)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!130364 () (_ BitVec 64))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!81989 (= (remainingBits!0 ((_ sign_extend 32) (size!1682 (buf!2072 b1!98))) ((_ sign_extend 32) (currentByte!4028 b1!98)) ((_ sign_extend 32) (currentBit!4023 b1!98))) (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1682 (buf!2072 b1!98)))) lt!130364))))

(declare-datatypes ((Unit!5473 0))(
  ( (Unit!5474) )
))
(declare-fun lt!130365 () Unit!5473)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!2926) Unit!5473)

(assert (=> b!81989 (= lt!130365 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!81990 () Bool)

(declare-fun e!54047 () Bool)

(declare-fun array_inv!1528 (array!3668) Bool)

(assert (=> b!81990 (= e!54047 (array_inv!1528 (buf!2072 b1!98)))))

(declare-fun res!67600 () Bool)

(declare-fun e!54042 () Bool)

(assert (=> start!16420 (=> (not res!67600) (not e!54042))))

(declare-fun b2!98 () BitStream!2926)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(assert (=> start!16420 (= res!67600 (and (= (size!1682 (buf!2072 b1!98)) (size!1682 (buf!2072 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16420 e!54042))

(declare-fun inv!12 (BitStream!2926) Bool)

(assert (=> start!16420 (and (inv!12 b1!98) e!54047)))

(declare-fun e!54043 () Bool)

(assert (=> start!16420 (and (inv!12 b2!98) e!54043)))

(assert (=> start!16420 true))

(declare-fun b!81991 () Bool)

(declare-fun res!67597 () Bool)

(assert (=> b!81991 (=> (not res!67597) (not e!54042))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!81991 (= res!67597 (validate_offset_bits!1 ((_ sign_extend 32) (size!1682 (buf!2072 b1!98))) ((_ sign_extend 32) (currentByte!4028 b1!98)) ((_ sign_extend 32) (currentBit!4023 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!81992 () Bool)

(assert (=> b!81992 (= e!54043 (array_inv!1528 (buf!2072 b2!98)))))

(declare-fun b!81993 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!81993 (= e!54046 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4023 b1!98))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4028 b1!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1682 (buf!2072 b1!98))))))))

(declare-fun b!81994 () Bool)

(assert (=> b!81994 (= e!54042 e!54045)))

(declare-fun res!67599 () Bool)

(assert (=> b!81994 (=> (not res!67599) (not e!54045))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!81994 (= res!67599 (= (bvadd lt!130364 b1b2Diff!1) (bitIndex!0 (size!1682 (buf!2072 b2!98)) (currentByte!4028 b2!98) (currentBit!4023 b2!98))))))

(assert (=> b!81994 (= lt!130364 (bitIndex!0 (size!1682 (buf!2072 b1!98)) (currentByte!4028 b1!98) (currentBit!4023 b1!98)))))

(assert (= (and start!16420 res!67600) b!81991))

(assert (= (and b!81991 res!67597) b!81994))

(assert (= (and b!81994 res!67599) b!81989))

(assert (= (and b!81989 (not res!67598)) b!81993))

(assert (= start!16420 b!81990))

(assert (= start!16420 b!81992))

(declare-fun m!128403 () Bool)

(assert (=> b!81993 m!128403))

(declare-fun m!128405 () Bool)

(assert (=> b!81989 m!128405))

(declare-fun m!128407 () Bool)

(assert (=> b!81989 m!128407))

(declare-fun m!128409 () Bool)

(assert (=> b!81992 m!128409))

(declare-fun m!128411 () Bool)

(assert (=> b!81994 m!128411))

(declare-fun m!128413 () Bool)

(assert (=> b!81994 m!128413))

(declare-fun m!128415 () Bool)

(assert (=> b!81990 m!128415))

(declare-fun m!128417 () Bool)

(assert (=> start!16420 m!128417))

(declare-fun m!128419 () Bool)

(assert (=> start!16420 m!128419))

(declare-fun m!128421 () Bool)

(assert (=> b!81991 m!128421))

(push 1)

(assert (not b!81994))

(assert (not b!81991))

(assert (not b!81990))

(assert (not b!81992))

(assert (not start!16420))

(assert (not b!81989))

(assert (not b!81993))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!25766 () Bool)

(assert (=> d!25766 (= (remainingBits!0 ((_ sign_extend 32) (size!1682 (buf!2072 b1!98))) ((_ sign_extend 32) (currentByte!4028 b1!98)) ((_ sign_extend 32) (currentBit!4023 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1682 (buf!2072 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4028 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4023 b1!98)))))))

(assert (=> b!81989 d!25766))

(declare-fun d!25770 () Bool)

(declare-fun lt!130429 () (_ BitVec 64))

(declare-fun lt!130430 () (_ BitVec 64))

(assert (=> d!25770 (= (remainingBits!0 ((_ sign_extend 32) (size!1682 (buf!2072 b1!98))) ((_ sign_extend 32) (currentByte!4028 b1!98)) ((_ sign_extend 32) (currentBit!4023 b1!98))) (bvsub lt!130429 lt!130430))))

(assert (=> d!25770 (or (= (bvand lt!130429 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!130430 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!130429 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!130429 lt!130430) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25770 (= lt!130430 (bitIndex!0 (size!1682 (buf!2072 b1!98)) (currentByte!4028 b1!98) (currentBit!4023 b1!98)))))

(declare-fun lt!130427 () (_ BitVec 64))

(declare-fun lt!130431 () (_ BitVec 64))

(assert (=> d!25770 (= lt!130429 (bvmul lt!130427 lt!130431))))

(assert (=> d!25770 (or (= lt!130427 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!130431 (bvsdiv (bvmul lt!130427 lt!130431) lt!130427)))))

(assert (=> d!25770 (= lt!130431 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25770 (= lt!130427 ((_ sign_extend 32) (size!1682 (buf!2072 b1!98))))))

(declare-fun lt!130428 () Unit!5473)

(declare-fun choose!23 (BitStream!2926) Unit!5473)

(assert (=> d!25770 (= lt!130428 (choose!23 b1!98))))

(assert (=> d!25770 (= (remainingBitsBitIndexLemma!0 b1!98) lt!130428)))

(declare-fun bs!6314 () Bool)

(assert (= bs!6314 d!25770))

(assert (=> bs!6314 m!128405))

(assert (=> bs!6314 m!128413))

(declare-fun m!128471 () Bool)

(assert (=> bs!6314 m!128471))

(assert (=> b!81989 d!25770))

(declare-fun d!25780 () Bool)

(declare-fun e!54101 () Bool)

(assert (=> d!25780 e!54101))

(declare-fun res!67645 () Bool)

(assert (=> d!25780 (=> (not res!67645) (not e!54101))))

(declare-fun lt!130470 () (_ BitVec 64))

(declare-fun lt!130471 () (_ BitVec 64))

(declare-fun lt!130473 () (_ BitVec 64))

(assert (=> d!25780 (= res!67645 (= lt!130471 (bvsub lt!130473 lt!130470)))))

(assert (=> d!25780 (or (= (bvand lt!130473 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!130470 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!130473 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!130473 lt!130470) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25780 (= lt!130470 (remainingBits!0 ((_ sign_extend 32) (size!1682 (buf!2072 b2!98))) ((_ sign_extend 32) (currentByte!4028 b2!98)) ((_ sign_extend 32) (currentBit!4023 b2!98))))))

(declare-fun lt!130468 () (_ BitVec 64))

(declare-fun lt!130472 () (_ BitVec 64))

(assert (=> d!25780 (= lt!130473 (bvmul lt!130468 lt!130472))))

(assert (=> d!25780 (or (= lt!130468 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!130472 (bvsdiv (bvmul lt!130468 lt!130472) lt!130468)))))

(assert (=> d!25780 (= lt!130472 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25780 (= lt!130468 ((_ sign_extend 32) (size!1682 (buf!2072 b2!98))))))

(assert (=> d!25780 (= lt!130471 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4028 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4023 b2!98))))))

(assert (=> d!25780 (invariant!0 (currentBit!4023 b2!98) (currentByte!4028 b2!98) (size!1682 (buf!2072 b2!98)))))

(assert (=> d!25780 (= (bitIndex!0 (size!1682 (buf!2072 b2!98)) (currentByte!4028 b2!98) (currentBit!4023 b2!98)) lt!130471)))

(declare-fun b!82053 () Bool)

(declare-fun res!67646 () Bool)

(assert (=> b!82053 (=> (not res!67646) (not e!54101))))

(assert (=> b!82053 (= res!67646 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!130471))))

(declare-fun b!82054 () Bool)

(declare-fun lt!130469 () (_ BitVec 64))

(assert (=> b!82054 (= e!54101 (bvsle lt!130471 (bvmul lt!130469 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82054 (or (= lt!130469 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!130469 #b0000000000000000000000000000000000000000000000000000000000001000) lt!130469)))))

(assert (=> b!82054 (= lt!130469 ((_ sign_extend 32) (size!1682 (buf!2072 b2!98))))))

(assert (= (and d!25780 res!67645) b!82053))

(assert (= (and b!82053 res!67646) b!82054))

(declare-fun m!128479 () Bool)

(assert (=> d!25780 m!128479))

(declare-fun m!128481 () Bool)

(assert (=> d!25780 m!128481))

(assert (=> b!81994 d!25780))

(declare-fun d!25792 () Bool)

(declare-fun e!54102 () Bool)

(assert (=> d!25792 e!54102))

(declare-fun res!67647 () Bool)

(assert (=> d!25792 (=> (not res!67647) (not e!54102))))

(declare-fun lt!130479 () (_ BitVec 64))

(declare-fun lt!130477 () (_ BitVec 64))

(declare-fun lt!130476 () (_ BitVec 64))

(assert (=> d!25792 (= res!67647 (= lt!130477 (bvsub lt!130479 lt!130476)))))

(assert (=> d!25792 (or (= (bvand lt!130479 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!130476 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!130479 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!130479 lt!130476) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25792 (= lt!130476 (remainingBits!0 ((_ sign_extend 32) (size!1682 (buf!2072 b1!98))) ((_ sign_extend 32) (currentByte!4028 b1!98)) ((_ sign_extend 32) (currentBit!4023 b1!98))))))

(declare-fun lt!130474 () (_ BitVec 64))

(declare-fun lt!130478 () (_ BitVec 64))

(assert (=> d!25792 (= lt!130479 (bvmul lt!130474 lt!130478))))

(assert (=> d!25792 (or (= lt!130474 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!130478 (bvsdiv (bvmul lt!130474 lt!130478) lt!130474)))))

(assert (=> d!25792 (= lt!130478 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25792 (= lt!130474 ((_ sign_extend 32) (size!1682 (buf!2072 b1!98))))))

(assert (=> d!25792 (= lt!130477 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4028 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4023 b1!98))))))

(assert (=> d!25792 (invariant!0 (currentBit!4023 b1!98) (currentByte!4028 b1!98) (size!1682 (buf!2072 b1!98)))))

(assert (=> d!25792 (= (bitIndex!0 (size!1682 (buf!2072 b1!98)) (currentByte!4028 b1!98) (currentBit!4023 b1!98)) lt!130477)))

(declare-fun b!82055 () Bool)

(declare-fun res!67648 () Bool)

(assert (=> b!82055 (=> (not res!67648) (not e!54102))))

(assert (=> b!82055 (= res!67648 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!130477))))

(declare-fun b!82056 () Bool)

(declare-fun lt!130475 () (_ BitVec 64))

(assert (=> b!82056 (= e!54102 (bvsle lt!130477 (bvmul lt!130475 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82056 (or (= lt!130475 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!130475 #b0000000000000000000000000000000000000000000000000000000000001000) lt!130475)))))

(assert (=> b!82056 (= lt!130475 ((_ sign_extend 32) (size!1682 (buf!2072 b1!98))))))

(assert (= (and d!25792 res!67647) b!82055))

(assert (= (and b!82055 res!67648) b!82056))

(assert (=> d!25792 m!128405))

(declare-fun m!128483 () Bool)

(assert (=> d!25792 m!128483))

(assert (=> b!81994 d!25792))

(declare-fun d!25794 () Bool)

(assert (=> d!25794 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1682 (buf!2072 b1!98))) ((_ sign_extend 32) (currentByte!4028 b1!98)) ((_ sign_extend 32) (currentBit!4023 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1682 (buf!2072 b1!98))) ((_ sign_extend 32) (currentByte!4028 b1!98)) ((_ sign_extend 32) (currentBit!4023 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6317 () Bool)

(assert (= bs!6317 d!25794))

(assert (=> bs!6317 m!128405))

(assert (=> b!81991 d!25794))

(declare-fun d!25796 () Bool)

(assert (=> d!25796 (= (inv!12 b1!98) (invariant!0 (currentBit!4023 b1!98) (currentByte!4028 b1!98) (size!1682 (buf!2072 b1!98))))))

(declare-fun bs!6318 () Bool)

(assert (= bs!6318 d!25796))

(assert (=> bs!6318 m!128483))

(assert (=> start!16420 d!25796))

(declare-fun d!25798 () Bool)

(assert (=> d!25798 (= (inv!12 b2!98) (invariant!0 (currentBit!4023 b2!98) (currentByte!4028 b2!98) (size!1682 (buf!2072 b2!98))))))

(declare-fun bs!6319 () Bool)

(assert (= bs!6319 d!25798))

(assert (=> bs!6319 m!128481))

(assert (=> start!16420 d!25798))

(declare-fun d!25800 () Bool)

(assert (=> d!25800 (= (array_inv!1528 (buf!2072 b1!98)) (bvsge (size!1682 (buf!2072 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!81990 d!25800))

(declare-fun d!25802 () Bool)

(assert (=> d!25802 (= (array_inv!1528 (buf!2072 b2!98)) (bvsge (size!1682 (buf!2072 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!81992 d!25802))

(declare-fun d!25804 () Bool)

(assert (=> d!25804 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4023 b1!98))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4028 b1!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1682 (buf!2072 b1!98))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4023 b1!98))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4023 b1!98))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4028 b1!98))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4028 b1!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1682 (buf!2072 b1!98))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4023 b1!98))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4028 b1!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1682 (buf!2072 b1!98)))))))))))

(assert (=> b!81993 d!25804))

(push 1)

(assert (not d!25798))

(assert (not d!25780))

(assert (not d!25770))

(assert (not d!25796))

(assert (not d!25792))

(assert (not d!25794))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

