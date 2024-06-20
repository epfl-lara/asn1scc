; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16472 () Bool)

(assert start!16472)

(declare-fun res!67674 () Bool)

(declare-fun e!54152 () Bool)

(assert (=> start!16472 (=> (not res!67674) (not e!54152))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-datatypes ((array!3681 0))(
  ( (array!3682 (arr!2324 (Array (_ BitVec 32) (_ BitVec 8))) (size!1687 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2936 0))(
  ( (BitStream!2937 (buf!2077 array!3681) (currentByte!4045 (_ BitVec 32)) (currentBit!4040 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!2936)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun b1!98 () BitStream!2936)

(assert (=> start!16472 (= res!67674 (and (= (size!1687 (buf!2077 b1!98)) (size!1687 (buf!2077 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16472 e!54152))

(declare-fun e!54156 () Bool)

(declare-fun inv!12 (BitStream!2936) Bool)

(assert (=> start!16472 (and (inv!12 b1!98) e!54156)))

(declare-fun e!54154 () Bool)

(assert (=> start!16472 (and (inv!12 b2!98) e!54154)))

(assert (=> start!16472 true))

(declare-fun b!82098 () Bool)

(declare-fun e!54151 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!82098 (= e!54151 (not (invariant!0 (currentBit!4040 b1!98) (currentByte!4045 b1!98) (size!1687 (buf!2077 b1!98)))))))

(declare-fun lt!130512 () (_ BitVec 64))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!82098 (= (remainingBits!0 ((_ sign_extend 32) (size!1687 (buf!2077 b1!98))) ((_ sign_extend 32) (currentByte!4045 b1!98)) ((_ sign_extend 32) (currentBit!4040 b1!98))) (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1687 (buf!2077 b1!98)))) lt!130512))))

(declare-datatypes ((Unit!5483 0))(
  ( (Unit!5484) )
))
(declare-fun lt!130511 () Unit!5483)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!2936) Unit!5483)

(assert (=> b!82098 (= lt!130511 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!82099 () Bool)

(declare-fun array_inv!1533 (array!3681) Bool)

(assert (=> b!82099 (= e!54154 (array_inv!1533 (buf!2077 b2!98)))))

(declare-fun b!82100 () Bool)

(declare-fun res!67675 () Bool)

(assert (=> b!82100 (=> (not res!67675) (not e!54152))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!82100 (= res!67675 (validate_offset_bits!1 ((_ sign_extend 32) (size!1687 (buf!2077 b1!98))) ((_ sign_extend 32) (currentByte!4045 b1!98)) ((_ sign_extend 32) (currentBit!4040 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!82101 () Bool)

(assert (=> b!82101 (= e!54152 e!54151)))

(declare-fun res!67673 () Bool)

(assert (=> b!82101 (=> (not res!67673) (not e!54151))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!82101 (= res!67673 (= (bvadd lt!130512 b1b2Diff!1) (bitIndex!0 (size!1687 (buf!2077 b2!98)) (currentByte!4045 b2!98) (currentBit!4040 b2!98))))))

(assert (=> b!82101 (= lt!130512 (bitIndex!0 (size!1687 (buf!2077 b1!98)) (currentByte!4045 b1!98) (currentBit!4040 b1!98)))))

(declare-fun b!82102 () Bool)

(assert (=> b!82102 (= e!54156 (array_inv!1533 (buf!2077 b1!98)))))

(assert (= (and start!16472 res!67674) b!82100))

(assert (= (and b!82100 res!67675) b!82101))

(assert (= (and b!82101 res!67673) b!82098))

(assert (= start!16472 b!82102))

(assert (= start!16472 b!82099))

(declare-fun m!128527 () Bool)

(assert (=> b!82099 m!128527))

(declare-fun m!128529 () Bool)

(assert (=> b!82102 m!128529))

(declare-fun m!128531 () Bool)

(assert (=> start!16472 m!128531))

(declare-fun m!128533 () Bool)

(assert (=> start!16472 m!128533))

(declare-fun m!128535 () Bool)

(assert (=> b!82100 m!128535))

(declare-fun m!128537 () Bool)

(assert (=> b!82098 m!128537))

(declare-fun m!128539 () Bool)

(assert (=> b!82098 m!128539))

(declare-fun m!128541 () Bool)

(assert (=> b!82098 m!128541))

(declare-fun m!128543 () Bool)

(assert (=> b!82101 m!128543))

(declare-fun m!128545 () Bool)

(assert (=> b!82101 m!128545))

(push 1)

(assert (not b!82102))

(assert (not b!82100))

(assert (not b!82098))

(assert (not start!16472))

(assert (not b!82101))

(assert (not b!82099))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!25818 () Bool)

(assert (=> d!25818 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1687 (buf!2077 b1!98))) ((_ sign_extend 32) (currentByte!4045 b1!98)) ((_ sign_extend 32) (currentBit!4040 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1687 (buf!2077 b1!98))) ((_ sign_extend 32) (currentByte!4045 b1!98)) ((_ sign_extend 32) (currentBit!4040 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6327 () Bool)

(assert (= bs!6327 d!25818))

(assert (=> bs!6327 m!128539))

(assert (=> b!82100 d!25818))

(declare-fun d!25826 () Bool)

(assert (=> d!25826 (= (array_inv!1533 (buf!2077 b2!98)) (bvsge (size!1687 (buf!2077 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!82099 d!25826))

(declare-fun d!25832 () Bool)

(declare-fun e!54163 () Bool)

(assert (=> d!25832 e!54163))

(declare-fun res!67689 () Bool)

(assert (=> d!25832 (=> (not res!67689) (not e!54163))))

(declare-fun lt!130581 () (_ BitVec 64))

(declare-fun lt!130583 () (_ BitVec 64))

(declare-fun lt!130582 () (_ BitVec 64))

(assert (=> d!25832 (= res!67689 (= lt!130583 (bvsub lt!130582 lt!130581)))))

(assert (=> d!25832 (or (= (bvand lt!130582 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!130581 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!130582 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!130582 lt!130581) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25832 (= lt!130581 (remainingBits!0 ((_ sign_extend 32) (size!1687 (buf!2077 b2!98))) ((_ sign_extend 32) (currentByte!4045 b2!98)) ((_ sign_extend 32) (currentBit!4040 b2!98))))))

(declare-fun lt!130579 () (_ BitVec 64))

(declare-fun lt!130584 () (_ BitVec 64))

(assert (=> d!25832 (= lt!130582 (bvmul lt!130579 lt!130584))))

(assert (=> d!25832 (or (= lt!130579 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!130584 (bvsdiv (bvmul lt!130579 lt!130584) lt!130579)))))

(assert (=> d!25832 (= lt!130584 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25832 (= lt!130579 ((_ sign_extend 32) (size!1687 (buf!2077 b2!98))))))

(assert (=> d!25832 (= lt!130583 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4045 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4040 b2!98))))))

(assert (=> d!25832 (invariant!0 (currentBit!4040 b2!98) (currentByte!4045 b2!98) (size!1687 (buf!2077 b2!98)))))

(assert (=> d!25832 (= (bitIndex!0 (size!1687 (buf!2077 b2!98)) (currentByte!4045 b2!98) (currentBit!4040 b2!98)) lt!130583)))

(declare-fun b!82117 () Bool)

(declare-fun res!67688 () Bool)

(assert (=> b!82117 (=> (not res!67688) (not e!54163))))

(assert (=> b!82117 (= res!67688 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!130583))))

(declare-fun b!82118 () Bool)

(declare-fun lt!130580 () (_ BitVec 64))

(assert (=> b!82118 (= e!54163 (bvsle lt!130583 (bvmul lt!130580 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82118 (or (= lt!130580 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!130580 #b0000000000000000000000000000000000000000000000000000000000001000) lt!130580)))))

(assert (=> b!82118 (= lt!130580 ((_ sign_extend 32) (size!1687 (buf!2077 b2!98))))))

(assert (= (and d!25832 res!67689) b!82117))

(assert (= (and b!82117 res!67688) b!82118))

(declare-fun m!128555 () Bool)

(assert (=> d!25832 m!128555))

(declare-fun m!128557 () Bool)

(assert (=> d!25832 m!128557))

(assert (=> b!82101 d!25832))

(declare-fun d!25852 () Bool)

(declare-fun e!54164 () Bool)

(assert (=> d!25852 e!54164))

(declare-fun res!67691 () Bool)

(assert (=> d!25852 (=> (not res!67691) (not e!54164))))

(declare-fun lt!130587 () (_ BitVec 64))

(declare-fun lt!130588 () (_ BitVec 64))

(declare-fun lt!130589 () (_ BitVec 64))

(assert (=> d!25852 (= res!67691 (= lt!130589 (bvsub lt!130588 lt!130587)))))

(assert (=> d!25852 (or (= (bvand lt!130588 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!130587 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!130588 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!130588 lt!130587) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25852 (= lt!130587 (remainingBits!0 ((_ sign_extend 32) (size!1687 (buf!2077 b1!98))) ((_ sign_extend 32) (currentByte!4045 b1!98)) ((_ sign_extend 32) (currentBit!4040 b1!98))))))

(declare-fun lt!130585 () (_ BitVec 64))

(declare-fun lt!130590 () (_ BitVec 64))

(assert (=> d!25852 (= lt!130588 (bvmul lt!130585 lt!130590))))

(assert (=> d!25852 (or (= lt!130585 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!130590 (bvsdiv (bvmul lt!130585 lt!130590) lt!130585)))))

(assert (=> d!25852 (= lt!130590 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25852 (= lt!130585 ((_ sign_extend 32) (size!1687 (buf!2077 b1!98))))))

(assert (=> d!25852 (= lt!130589 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4045 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4040 b1!98))))))

(assert (=> d!25852 (invariant!0 (currentBit!4040 b1!98) (currentByte!4045 b1!98) (size!1687 (buf!2077 b1!98)))))

(assert (=> d!25852 (= (bitIndex!0 (size!1687 (buf!2077 b1!98)) (currentByte!4045 b1!98) (currentBit!4040 b1!98)) lt!130589)))

(declare-fun b!82119 () Bool)

(declare-fun res!67690 () Bool)

(assert (=> b!82119 (=> (not res!67690) (not e!54164))))

(assert (=> b!82119 (= res!67690 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!130589))))

(declare-fun b!82120 () Bool)

(declare-fun lt!130586 () (_ BitVec 64))

(assert (=> b!82120 (= e!54164 (bvsle lt!130589 (bvmul lt!130586 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82120 (or (= lt!130586 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!130586 #b0000000000000000000000000000000000000000000000000000000000001000) lt!130586)))))

(assert (=> b!82120 (= lt!130586 ((_ sign_extend 32) (size!1687 (buf!2077 b1!98))))))

(assert (= (and d!25852 res!67691) b!82119))

(assert (= (and b!82119 res!67690) b!82120))

(assert (=> d!25852 m!128539))

(assert (=> d!25852 m!128537))

(assert (=> b!82101 d!25852))

(declare-fun d!25854 () Bool)

(assert (=> d!25854 (= (inv!12 b1!98) (invariant!0 (currentBit!4040 b1!98) (currentByte!4045 b1!98) (size!1687 (buf!2077 b1!98))))))

(declare-fun bs!6332 () Bool)

(assert (= bs!6332 d!25854))

(assert (=> bs!6332 m!128537))

(assert (=> start!16472 d!25854))

(declare-fun d!25856 () Bool)

(assert (=> d!25856 (= (inv!12 b2!98) (invariant!0 (currentBit!4040 b2!98) (currentByte!4045 b2!98) (size!1687 (buf!2077 b2!98))))))

(declare-fun bs!6333 () Bool)

(assert (= bs!6333 d!25856))

(assert (=> bs!6333 m!128557))

(assert (=> start!16472 d!25856))

(declare-fun d!25858 () Bool)

(assert (=> d!25858 (= (array_inv!1533 (buf!2077 b1!98)) (bvsge (size!1687 (buf!2077 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!82102 d!25858))

(declare-fun d!25860 () Bool)

(assert (=> d!25860 (= (invariant!0 (currentBit!4040 b1!98) (currentByte!4045 b1!98) (size!1687 (buf!2077 b1!98))) (and (bvsge (currentBit!4040 b1!98) #b00000000000000000000000000000000) (bvslt (currentBit!4040 b1!98) #b00000000000000000000000000001000) (bvsge (currentByte!4045 b1!98) #b00000000000000000000000000000000) (or (bvslt (currentByte!4045 b1!98) (size!1687 (buf!2077 b1!98))) (and (= (currentBit!4040 b1!98) #b00000000000000000000000000000000) (= (currentByte!4045 b1!98) (size!1687 (buf!2077 b1!98)))))))))

(assert (=> b!82098 d!25860))

(declare-fun d!25862 () Bool)

(assert (=> d!25862 (= (remainingBits!0 ((_ sign_extend 32) (size!1687 (buf!2077 b1!98))) ((_ sign_extend 32) (currentByte!4045 b1!98)) ((_ sign_extend 32) (currentBit!4040 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1687 (buf!2077 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4045 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4040 b1!98)))))))

(assert (=> b!82098 d!25862))

(declare-fun d!25864 () Bool)

(declare-fun lt!130628 () (_ BitVec 64))

(declare-fun lt!130626 () (_ BitVec 64))

(assert (=> d!25864 (= (remainingBits!0 ((_ sign_extend 32) (size!1687 (buf!2077 b1!98))) ((_ sign_extend 32) (currentByte!4045 b1!98)) ((_ sign_extend 32) (currentBit!4040 b1!98))) (bvsub lt!130628 lt!130626))))

(assert (=> d!25864 (or (= (bvand lt!130628 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!130626 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!130628 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!130628 lt!130626) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25864 (= lt!130626 (bitIndex!0 (size!1687 (buf!2077 b1!98)) (currentByte!4045 b1!98) (currentBit!4040 b1!98)))))

(declare-fun lt!130629 () (_ BitVec 64))

(declare-fun lt!130627 () (_ BitVec 64))

(assert (=> d!25864 (= lt!130628 (bvmul lt!130629 lt!130627))))

(assert (=> d!25864 (or (= lt!130629 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!130627 (bvsdiv (bvmul lt!130629 lt!130627) lt!130629)))))

(assert (=> d!25864 (= lt!130627 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25864 (= lt!130629 ((_ sign_extend 32) (size!1687 (buf!2077 b1!98))))))

(declare-fun lt!130625 () Unit!5483)

(declare-fun choose!23 (BitStream!2936) Unit!5483)

(assert (=> d!25864 (= lt!130625 (choose!23 b1!98))))

(assert (=> d!25864 (= (remainingBitsBitIndexLemma!0 b1!98) lt!130625)))

(declare-fun bs!6334 () Bool)

(assert (= bs!6334 d!25864))

(assert (=> bs!6334 m!128539))

(assert (=> bs!6334 m!128545))

(declare-fun m!128563 () Bool)

(assert (=> bs!6334 m!128563))

(assert (=> b!82098 d!25864))

(push 1)

