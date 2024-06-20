; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16468 () Bool)

(assert start!16468)

(declare-fun b!82068 () Bool)

(declare-fun res!67655 () Bool)

(declare-fun e!54119 () Bool)

(assert (=> b!82068 (=> (not res!67655) (not e!54119))))

(declare-datatypes ((array!3677 0))(
  ( (array!3678 (arr!2322 (Array (_ BitVec 32) (_ BitVec 8))) (size!1685 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2932 0))(
  ( (BitStream!2933 (buf!2075 array!3677) (currentByte!4043 (_ BitVec 32)) (currentBit!4038 (_ BitVec 32))) )
))
(declare-fun b1!98 () BitStream!2932)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!82068 (= res!67655 (validate_offset_bits!1 ((_ sign_extend 32) (size!1685 (buf!2075 b1!98))) ((_ sign_extend 32) (currentByte!4043 b1!98)) ((_ sign_extend 32) (currentBit!4038 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!82069 () Bool)

(declare-fun e!54115 () Bool)

(declare-fun b2!98 () BitStream!2932)

(declare-fun array_inv!1531 (array!3677) Bool)

(assert (=> b!82069 (= e!54115 (array_inv!1531 (buf!2075 b2!98)))))

(declare-fun b!82070 () Bool)

(declare-fun e!54116 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!82070 (= e!54116 (not (invariant!0 (currentBit!4038 b1!98) (currentByte!4043 b1!98) (size!1685 (buf!2075 b1!98)))))))

(declare-fun lt!130499 () (_ BitVec 64))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!82070 (= (remainingBits!0 ((_ sign_extend 32) (size!1685 (buf!2075 b1!98))) ((_ sign_extend 32) (currentByte!4043 b1!98)) ((_ sign_extend 32) (currentBit!4038 b1!98))) (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1685 (buf!2075 b1!98)))) lt!130499))))

(declare-datatypes ((Unit!5479 0))(
  ( (Unit!5480) )
))
(declare-fun lt!130500 () Unit!5479)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!2932) Unit!5479)

(assert (=> b!82070 (= lt!130500 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!82071 () Bool)

(declare-fun e!54117 () Bool)

(assert (=> b!82071 (= e!54117 (array_inv!1531 (buf!2075 b1!98)))))

(declare-fun b!82072 () Bool)

(assert (=> b!82072 (= e!54119 e!54116)))

(declare-fun res!67656 () Bool)

(assert (=> b!82072 (=> (not res!67656) (not e!54116))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!82072 (= res!67656 (= (bvadd lt!130499 b1b2Diff!1) (bitIndex!0 (size!1685 (buf!2075 b2!98)) (currentByte!4043 b2!98) (currentBit!4038 b2!98))))))

(assert (=> b!82072 (= lt!130499 (bitIndex!0 (size!1685 (buf!2075 b1!98)) (currentByte!4043 b1!98) (currentBit!4038 b1!98)))))

(declare-fun res!67657 () Bool)

(assert (=> start!16468 (=> (not res!67657) (not e!54119))))

(assert (=> start!16468 (= res!67657 (and (= (size!1685 (buf!2075 b1!98)) (size!1685 (buf!2075 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16468 e!54119))

(declare-fun inv!12 (BitStream!2932) Bool)

(assert (=> start!16468 (and (inv!12 b1!98) e!54117)))

(assert (=> start!16468 (and (inv!12 b2!98) e!54115)))

(assert (=> start!16468 true))

(assert (= (and start!16468 res!67657) b!82068))

(assert (= (and b!82068 res!67655) b!82072))

(assert (= (and b!82072 res!67656) b!82070))

(assert (= start!16468 b!82071))

(assert (= start!16468 b!82069))

(declare-fun m!128487 () Bool)

(assert (=> b!82068 m!128487))

(declare-fun m!128489 () Bool)

(assert (=> b!82070 m!128489))

(declare-fun m!128491 () Bool)

(assert (=> b!82070 m!128491))

(declare-fun m!128493 () Bool)

(assert (=> b!82070 m!128493))

(declare-fun m!128495 () Bool)

(assert (=> start!16468 m!128495))

(declare-fun m!128497 () Bool)

(assert (=> start!16468 m!128497))

(declare-fun m!128499 () Bool)

(assert (=> b!82071 m!128499))

(declare-fun m!128501 () Bool)

(assert (=> b!82069 m!128501))

(declare-fun m!128503 () Bool)

(assert (=> b!82072 m!128503))

(declare-fun m!128505 () Bool)

(assert (=> b!82072 m!128505))

(push 1)

(assert (not b!82068))

(assert (not b!82070))

(assert (not b!82072))

(assert (not start!16468))

(assert (not b!82071))

(assert (not b!82069))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!25820 () Bool)

(assert (=> d!25820 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1685 (buf!2075 b1!98))) ((_ sign_extend 32) (currentByte!4043 b1!98)) ((_ sign_extend 32) (currentBit!4038 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1685 (buf!2075 b1!98))) ((_ sign_extend 32) (currentByte!4043 b1!98)) ((_ sign_extend 32) (currentBit!4038 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6328 () Bool)

(assert (= bs!6328 d!25820))

(assert (=> bs!6328 m!128491))

(assert (=> b!82068 d!25820))

(declare-fun d!25830 () Bool)

(assert (=> d!25830 (= (invariant!0 (currentBit!4038 b1!98) (currentByte!4043 b1!98) (size!1685 (buf!2075 b1!98))) (and (bvsge (currentBit!4038 b1!98) #b00000000000000000000000000000000) (bvslt (currentBit!4038 b1!98) #b00000000000000000000000000001000) (bvsge (currentByte!4043 b1!98) #b00000000000000000000000000000000) (or (bvslt (currentByte!4043 b1!98) (size!1685 (buf!2075 b1!98))) (and (= (currentBit!4038 b1!98) #b00000000000000000000000000000000) (= (currentByte!4043 b1!98) (size!1685 (buf!2075 b1!98)))))))))

(assert (=> b!82070 d!25830))

(declare-fun d!25836 () Bool)

(assert (=> d!25836 (= (remainingBits!0 ((_ sign_extend 32) (size!1685 (buf!2075 b1!98))) ((_ sign_extend 32) (currentByte!4043 b1!98)) ((_ sign_extend 32) (currentBit!4038 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1685 (buf!2075 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4043 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4038 b1!98)))))))

(assert (=> b!82070 d!25836))

(declare-fun d!25840 () Bool)

(declare-fun lt!130565 () (_ BitVec 64))

(declare-fun lt!130569 () (_ BitVec 64))

(assert (=> d!25840 (= (remainingBits!0 ((_ sign_extend 32) (size!1685 (buf!2075 b1!98))) ((_ sign_extend 32) (currentByte!4043 b1!98)) ((_ sign_extend 32) (currentBit!4038 b1!98))) (bvsub lt!130565 lt!130569))))

(assert (=> d!25840 (or (= (bvand lt!130565 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!130569 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!130565 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!130565 lt!130569) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25840 (= lt!130569 (bitIndex!0 (size!1685 (buf!2075 b1!98)) (currentByte!4043 b1!98) (currentBit!4038 b1!98)))))

(declare-fun lt!130566 () (_ BitVec 64))

(declare-fun lt!130567 () (_ BitVec 64))

(assert (=> d!25840 (= lt!130565 (bvmul lt!130566 lt!130567))))

(assert (=> d!25840 (or (= lt!130566 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!130567 (bvsdiv (bvmul lt!130566 lt!130567) lt!130566)))))

(assert (=> d!25840 (= lt!130567 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25840 (= lt!130566 ((_ sign_extend 32) (size!1685 (buf!2075 b1!98))))))

(declare-fun lt!130568 () Unit!5479)

(declare-fun choose!23 (BitStream!2932) Unit!5479)

(assert (=> d!25840 (= lt!130568 (choose!23 b1!98))))

(assert (=> d!25840 (= (remainingBitsBitIndexLemma!0 b1!98) lt!130568)))

(declare-fun bs!6330 () Bool)

(assert (= bs!6330 d!25840))

(assert (=> bs!6330 m!128491))

(assert (=> bs!6330 m!128505))

(declare-fun m!128551 () Bool)

(assert (=> bs!6330 m!128551))

(assert (=> b!82070 d!25840))

(declare-fun d!25844 () Bool)

(assert (=> d!25844 (= (array_inv!1531 (buf!2075 b2!98)) (bvsge (size!1685 (buf!2075 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!82069 d!25844))

(declare-fun d!25846 () Bool)

(assert (=> d!25846 (= (array_inv!1531 (buf!2075 b1!98)) (bvsge (size!1685 (buf!2075 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!82071 d!25846))

(declare-fun d!25850 () Bool)

(declare-fun e!54167 () Bool)

(assert (=> d!25850 e!54167))

(declare-fun res!67697 () Bool)

(assert (=> d!25850 (=> (not res!67697) (not e!54167))))

(declare-fun lt!130616 () (_ BitVec 64))

(declare-fun lt!130613 () (_ BitVec 64))

(declare-fun lt!130615 () (_ BitVec 64))

(assert (=> d!25850 (= res!67697 (= lt!130616 (bvsub lt!130613 lt!130615)))))

(assert (=> d!25850 (or (= (bvand lt!130613 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!130615 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!130613 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!130613 lt!130615) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25850 (= lt!130615 (remainingBits!0 ((_ sign_extend 32) (size!1685 (buf!2075 b2!98))) ((_ sign_extend 32) (currentByte!4043 b2!98)) ((_ sign_extend 32) (currentBit!4038 b2!98))))))

(declare-fun lt!130617 () (_ BitVec 64))

(declare-fun lt!130618 () (_ BitVec 64))

(assert (=> d!25850 (= lt!130613 (bvmul lt!130617 lt!130618))))

(assert (=> d!25850 (or (= lt!130617 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!130618 (bvsdiv (bvmul lt!130617 lt!130618) lt!130617)))))

(assert (=> d!25850 (= lt!130618 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25850 (= lt!130617 ((_ sign_extend 32) (size!1685 (buf!2075 b2!98))))))

(assert (=> d!25850 (= lt!130616 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4043 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4038 b2!98))))))

(assert (=> d!25850 (invariant!0 (currentBit!4038 b2!98) (currentByte!4043 b2!98) (size!1685 (buf!2075 b2!98)))))

(assert (=> d!25850 (= (bitIndex!0 (size!1685 (buf!2075 b2!98)) (currentByte!4043 b2!98) (currentBit!4038 b2!98)) lt!130616)))

(declare-fun b!82126 () Bool)

(declare-fun res!67696 () Bool)

(assert (=> b!82126 (=> (not res!67696) (not e!54167))))

(assert (=> b!82126 (= res!67696 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!130616))))

(declare-fun b!82127 () Bool)

(declare-fun lt!130614 () (_ BitVec 64))

(assert (=> b!82127 (= e!54167 (bvsle lt!130616 (bvmul lt!130614 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82127 (or (= lt!130614 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!130614 #b0000000000000000000000000000000000000000000000000000000000001000) lt!130614)))))

(assert (=> b!82127 (= lt!130614 ((_ sign_extend 32) (size!1685 (buf!2075 b2!98))))))

(assert (= (and d!25850 res!67697) b!82126))

(assert (= (and b!82126 res!67696) b!82127))

(declare-fun m!128559 () Bool)

(assert (=> d!25850 m!128559))

(declare-fun m!128561 () Bool)

(assert (=> d!25850 m!128561))

(assert (=> b!82072 d!25850))

(declare-fun d!25866 () Bool)

(declare-fun e!54168 () Bool)

(assert (=> d!25866 e!54168))

(declare-fun res!67699 () Bool)

(assert (=> d!25866 (=> (not res!67699) (not e!54168))))

(declare-fun lt!130619 () (_ BitVec 64))

(declare-fun lt!130621 () (_ BitVec 64))

(declare-fun lt!130622 () (_ BitVec 64))

(assert (=> d!25866 (= res!67699 (= lt!130622 (bvsub lt!130619 lt!130621)))))

(assert (=> d!25866 (or (= (bvand lt!130619 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!130621 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!130619 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!130619 lt!130621) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25866 (= lt!130621 (remainingBits!0 ((_ sign_extend 32) (size!1685 (buf!2075 b1!98))) ((_ sign_extend 32) (currentByte!4043 b1!98)) ((_ sign_extend 32) (currentBit!4038 b1!98))))))

(declare-fun lt!130623 () (_ BitVec 64))

(declare-fun lt!130624 () (_ BitVec 64))

(assert (=> d!25866 (= lt!130619 (bvmul lt!130623 lt!130624))))

(assert (=> d!25866 (or (= lt!130623 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!130624 (bvsdiv (bvmul lt!130623 lt!130624) lt!130623)))))

(assert (=> d!25866 (= lt!130624 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25866 (= lt!130623 ((_ sign_extend 32) (size!1685 (buf!2075 b1!98))))))

(assert (=> d!25866 (= lt!130622 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4043 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4038 b1!98))))))

(assert (=> d!25866 (invariant!0 (currentBit!4038 b1!98) (currentByte!4043 b1!98) (size!1685 (buf!2075 b1!98)))))

(assert (=> d!25866 (= (bitIndex!0 (size!1685 (buf!2075 b1!98)) (currentByte!4043 b1!98) (currentBit!4038 b1!98)) lt!130622)))

(declare-fun b!82128 () Bool)

(declare-fun res!67698 () Bool)

(assert (=> b!82128 (=> (not res!67698) (not e!54168))))

(assert (=> b!82128 (= res!67698 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!130622))))

(declare-fun b!82129 () Bool)

(declare-fun lt!130620 () (_ BitVec 64))

(assert (=> b!82129 (= e!54168 (bvsle lt!130622 (bvmul lt!130620 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82129 (or (= lt!130620 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!130620 #b0000000000000000000000000000000000000000000000000000000000001000) lt!130620)))))

(assert (=> b!82129 (= lt!130620 ((_ sign_extend 32) (size!1685 (buf!2075 b1!98))))))

(assert (= (and d!25866 res!67699) b!82128))

(assert (= (and b!82128 res!67698) b!82129))

(assert (=> d!25866 m!128491))

(assert (=> d!25866 m!128489))

(assert (=> b!82072 d!25866))

(declare-fun d!25868 () Bool)

(assert (=> d!25868 (= (inv!12 b1!98) (invariant!0 (currentBit!4038 b1!98) (currentByte!4043 b1!98) (size!1685 (buf!2075 b1!98))))))

(declare-fun bs!6335 () Bool)

(assert (= bs!6335 d!25868))

(assert (=> bs!6335 m!128489))

(assert (=> start!16468 d!25868))

(declare-fun d!25870 () Bool)

(assert (=> d!25870 (= (inv!12 b2!98) (invariant!0 (currentBit!4038 b2!98) (currentByte!4043 b2!98) (size!1685 (buf!2075 b2!98))))))

(declare-fun bs!6336 () Bool)

(assert (= bs!6336 d!25870))

(assert (=> bs!6336 m!128561))

(assert (=> start!16468 d!25870))

(push 1)

(assert (not d!25870))

(assert (not d!25868))

(assert (not d!25840))

(assert (not d!25820))

(assert (not d!25866))

(assert (not d!25850))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

