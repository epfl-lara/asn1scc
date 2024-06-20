; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17192 () Bool)

(assert start!17192)

(declare-fun b!83738 () Bool)

(declare-fun res!68836 () Bool)

(declare-fun e!55785 () Bool)

(assert (=> b!83738 (=> (not res!68836) (not e!55785))))

(declare-datatypes ((array!3870 0))(
  ( (array!3871 (arr!2396 (Array (_ BitVec 32) (_ BitVec 8))) (size!1759 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3080 0))(
  ( (BitStream!3081 (buf!2149 array!3870) (currentByte!4270 (_ BitVec 32)) (currentBit!4265 (_ BitVec 32))) )
))
(declare-fun b1!98 () BitStream!3080)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!83738 (= res!68836 (validate_offset_bits!1 ((_ sign_extend 32) (size!1759 (buf!2149 b1!98))) ((_ sign_extend 32) (currentByte!4270 b1!98)) ((_ sign_extend 32) (currentBit!4265 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun res!68839 () Bool)

(assert (=> start!17192 (=> (not res!68839) (not e!55785))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-fun b2!98 () BitStream!3080)

(assert (=> start!17192 (= res!68839 (and (= (size!1759 (buf!2149 b1!98)) (size!1759 (buf!2149 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!17192 e!55785))

(declare-fun e!55787 () Bool)

(declare-fun inv!12 (BitStream!3080) Bool)

(assert (=> start!17192 (and (inv!12 b1!98) e!55787)))

(declare-fun e!55786 () Bool)

(assert (=> start!17192 (and (inv!12 b2!98) e!55786)))

(assert (=> start!17192 true))

(declare-fun b!83739 () Bool)

(declare-fun array_inv!1605 (array!3870) Bool)

(assert (=> b!83739 (= e!55786 (array_inv!1605 (buf!2149 b2!98)))))

(declare-fun b!83740 () Bool)

(assert (=> b!83740 (= e!55787 (array_inv!1605 (buf!2149 b1!98)))))

(declare-fun b!83741 () Bool)

(declare-fun e!55789 () Bool)

(assert (=> b!83741 (= e!55785 e!55789)))

(declare-fun res!68837 () Bool)

(assert (=> b!83741 (=> (not res!68837) (not e!55789))))

(declare-fun lt!133545 () (_ BitVec 64))

(declare-fun lt!133543 () (_ BitVec 64))

(assert (=> b!83741 (= res!68837 (= lt!133545 lt!133543))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!83741 (= lt!133543 (bitIndex!0 (size!1759 (buf!2149 b2!98)) (currentByte!4270 b2!98) (currentBit!4265 b2!98)))))

(declare-fun lt!133540 () (_ BitVec 64))

(assert (=> b!83741 (= lt!133545 (bvadd lt!133540 b1b2Diff!1))))

(assert (=> b!83741 (= lt!133540 (bitIndex!0 (size!1759 (buf!2149 b1!98)) (currentByte!4270 b1!98) (currentBit!4265 b1!98)))))

(declare-fun lt!133542 () (_ BitVec 64))

(declare-fun b!83742 () Bool)

(declare-fun e!55790 () Bool)

(declare-fun lt!133544 () (_ BitVec 64))

(assert (=> b!83742 (= e!55790 (or (= lt!133544 (bvand lt!133545 #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!133544 (bvand (bvsub lt!133542 lt!133545) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!83742 (= lt!133544 (bvand lt!133542 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!83742 (= (remainingBits!0 ((_ sign_extend 32) (size!1759 (buf!2149 b2!98))) ((_ sign_extend 32) (currentByte!4270 b2!98)) ((_ sign_extend 32) (currentBit!4265 b2!98))) (bvsub lt!133542 lt!133543))))

(assert (=> b!83742 (= lt!133542 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1759 (buf!2149 b2!98)))))))

(declare-datatypes ((Unit!5621 0))(
  ( (Unit!5622) )
))
(declare-fun lt!133539 () Unit!5621)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!3080) Unit!5621)

(assert (=> b!83742 (= lt!133539 (remainingBitsBitIndexLemma!0 b2!98))))

(declare-fun b!83743 () Bool)

(assert (=> b!83743 (= e!55789 (not e!55790))))

(declare-fun res!68838 () Bool)

(assert (=> b!83743 (=> res!68838 e!55790)))

(declare-fun lt!133538 () (_ BitVec 64))

(assert (=> b!83743 (= res!68838 (bvsgt lt!133540 (bvsub lt!133538 b1ValidateOffsetBits!11)))))

(assert (=> b!83743 (= (remainingBits!0 ((_ sign_extend 32) (size!1759 (buf!2149 b1!98))) ((_ sign_extend 32) (currentByte!4270 b1!98)) ((_ sign_extend 32) (currentBit!4265 b1!98))) (bvsub lt!133538 lt!133540))))

(assert (=> b!83743 (= lt!133538 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1759 (buf!2149 b1!98)))))))

(declare-fun lt!133541 () Unit!5621)

(assert (=> b!83743 (= lt!133541 (remainingBitsBitIndexLemma!0 b1!98))))

(assert (= (and start!17192 res!68839) b!83738))

(assert (= (and b!83738 res!68836) b!83741))

(assert (= (and b!83741 res!68837) b!83743))

(assert (= (and b!83743 (not res!68838)) b!83742))

(assert (= start!17192 b!83740))

(assert (= start!17192 b!83739))

(declare-fun m!130361 () Bool)

(assert (=> b!83742 m!130361))

(declare-fun m!130363 () Bool)

(assert (=> b!83742 m!130363))

(declare-fun m!130365 () Bool)

(assert (=> b!83743 m!130365))

(declare-fun m!130367 () Bool)

(assert (=> b!83743 m!130367))

(declare-fun m!130369 () Bool)

(assert (=> b!83738 m!130369))

(declare-fun m!130371 () Bool)

(assert (=> b!83740 m!130371))

(declare-fun m!130373 () Bool)

(assert (=> b!83739 m!130373))

(declare-fun m!130375 () Bool)

(assert (=> start!17192 m!130375))

(declare-fun m!130377 () Bool)

(assert (=> start!17192 m!130377))

(declare-fun m!130379 () Bool)

(assert (=> b!83741 m!130379))

(declare-fun m!130381 () Bool)

(assert (=> b!83741 m!130381))

(push 1)

(assert (not b!83741))

(assert (not b!83739))

(assert (not start!17192))

(assert (not b!83743))

(assert (not b!83740))

(assert (not b!83742))

(assert (not b!83738))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!26864 () Bool)

(assert (=> d!26864 (= (array_inv!1605 (buf!2149 b1!98)) (bvsge (size!1759 (buf!2149 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!83740 d!26864))

(declare-fun d!26866 () Bool)

(assert (=> d!26866 (= (remainingBits!0 ((_ sign_extend 32) (size!1759 (buf!2149 b2!98))) ((_ sign_extend 32) (currentByte!4270 b2!98)) ((_ sign_extend 32) (currentBit!4265 b2!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1759 (buf!2149 b2!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4270 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4265 b2!98)))))))

(assert (=> b!83742 d!26866))

(declare-fun d!26868 () Bool)

(declare-fun lt!133644 () (_ BitVec 64))

(declare-fun lt!133647 () (_ BitVec 64))

(assert (=> d!26868 (= (remainingBits!0 ((_ sign_extend 32) (size!1759 (buf!2149 b2!98))) ((_ sign_extend 32) (currentByte!4270 b2!98)) ((_ sign_extend 32) (currentBit!4265 b2!98))) (bvsub lt!133644 lt!133647))))

(assert (=> d!26868 (or (= (bvand lt!133644 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!133647 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!133644 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!133644 lt!133647) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26868 (= lt!133647 (bitIndex!0 (size!1759 (buf!2149 b2!98)) (currentByte!4270 b2!98) (currentBit!4265 b2!98)))))

(declare-fun lt!133646 () (_ BitVec 64))

(declare-fun lt!133648 () (_ BitVec 64))

(assert (=> d!26868 (= lt!133644 (bvmul lt!133646 lt!133648))))

(assert (=> d!26868 (or (= lt!133646 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!133648 (bvsdiv (bvmul lt!133646 lt!133648) lt!133646)))))

(assert (=> d!26868 (= lt!133648 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26868 (= lt!133646 ((_ sign_extend 32) (size!1759 (buf!2149 b2!98))))))

(declare-fun lt!133645 () Unit!5621)

(declare-fun choose!23 (BitStream!3080) Unit!5621)

(assert (=> d!26868 (= lt!133645 (choose!23 b2!98))))

(assert (=> d!26868 (= (remainingBitsBitIndexLemma!0 b2!98) lt!133645)))

(declare-fun bs!6617 () Bool)

(assert (= bs!6617 d!26868))

(assert (=> bs!6617 m!130361))

(assert (=> bs!6617 m!130379))

(declare-fun m!130399 () Bool)

(assert (=> bs!6617 m!130399))

(assert (=> b!83742 d!26868))

(declare-fun d!26870 () Bool)

(declare-fun e!55802 () Bool)

(assert (=> d!26870 e!55802))

(declare-fun res!68860 () Bool)

(assert (=> d!26870 (=> (not res!68860) (not e!55802))))

(declare-fun lt!133666 () (_ BitVec 64))

(declare-fun lt!133662 () (_ BitVec 64))

(declare-fun lt!133661 () (_ BitVec 64))

(assert (=> d!26870 (= res!68860 (= lt!133662 (bvsub lt!133666 lt!133661)))))

(assert (=> d!26870 (or (= (bvand lt!133666 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!133661 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!133666 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!133666 lt!133661) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26870 (= lt!133661 (remainingBits!0 ((_ sign_extend 32) (size!1759 (buf!2149 b2!98))) ((_ sign_extend 32) (currentByte!4270 b2!98)) ((_ sign_extend 32) (currentBit!4265 b2!98))))))

(declare-fun lt!133663 () (_ BitVec 64))

(declare-fun lt!133664 () (_ BitVec 64))

(assert (=> d!26870 (= lt!133666 (bvmul lt!133663 lt!133664))))

(assert (=> d!26870 (or (= lt!133663 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!133664 (bvsdiv (bvmul lt!133663 lt!133664) lt!133663)))))

(assert (=> d!26870 (= lt!133664 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26870 (= lt!133663 ((_ sign_extend 32) (size!1759 (buf!2149 b2!98))))))

(assert (=> d!26870 (= lt!133662 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4270 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4265 b2!98))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!26870 (invariant!0 (currentBit!4265 b2!98) (currentByte!4270 b2!98) (size!1759 (buf!2149 b2!98)))))

(assert (=> d!26870 (= (bitIndex!0 (size!1759 (buf!2149 b2!98)) (currentByte!4270 b2!98) (currentBit!4265 b2!98)) lt!133662)))

(declare-fun b!83767 () Bool)

(declare-fun res!68861 () Bool)

(assert (=> b!83767 (=> (not res!68861) (not e!55802))))

(assert (=> b!83767 (= res!68861 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!133662))))

(declare-fun b!83768 () Bool)

(declare-fun lt!133665 () (_ BitVec 64))

(assert (=> b!83768 (= e!55802 (bvsle lt!133662 (bvmul lt!133665 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!83768 (or (= lt!133665 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!133665 #b0000000000000000000000000000000000000000000000000000000000001000) lt!133665)))))

(assert (=> b!83768 (= lt!133665 ((_ sign_extend 32) (size!1759 (buf!2149 b2!98))))))

(assert (= (and d!26870 res!68860) b!83767))

(assert (= (and b!83767 res!68861) b!83768))

(assert (=> d!26870 m!130361))

(declare-fun m!130401 () Bool)

(assert (=> d!26870 m!130401))

(assert (=> b!83741 d!26870))

(declare-fun d!26872 () Bool)

(declare-fun e!55803 () Bool)

(assert (=> d!26872 e!55803))

(declare-fun res!68862 () Bool)

(assert (=> d!26872 (=> (not res!68862) (not e!55803))))

(declare-fun lt!133668 () (_ BitVec 64))

(declare-fun lt!133667 () (_ BitVec 64))

(declare-fun lt!133672 () (_ BitVec 64))

(assert (=> d!26872 (= res!68862 (= lt!133668 (bvsub lt!133672 lt!133667)))))

(assert (=> d!26872 (or (= (bvand lt!133672 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!133667 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!133672 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!133672 lt!133667) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26872 (= lt!133667 (remainingBits!0 ((_ sign_extend 32) (size!1759 (buf!2149 b1!98))) ((_ sign_extend 32) (currentByte!4270 b1!98)) ((_ sign_extend 32) (currentBit!4265 b1!98))))))

(declare-fun lt!133669 () (_ BitVec 64))

(declare-fun lt!133670 () (_ BitVec 64))

(assert (=> d!26872 (= lt!133672 (bvmul lt!133669 lt!133670))))

(assert (=> d!26872 (or (= lt!133669 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!133670 (bvsdiv (bvmul lt!133669 lt!133670) lt!133669)))))

(assert (=> d!26872 (= lt!133670 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26872 (= lt!133669 ((_ sign_extend 32) (size!1759 (buf!2149 b1!98))))))

(assert (=> d!26872 (= lt!133668 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4270 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4265 b1!98))))))

(assert (=> d!26872 (invariant!0 (currentBit!4265 b1!98) (currentByte!4270 b1!98) (size!1759 (buf!2149 b1!98)))))

(assert (=> d!26872 (= (bitIndex!0 (size!1759 (buf!2149 b1!98)) (currentByte!4270 b1!98) (currentBit!4265 b1!98)) lt!133668)))

(declare-fun b!83769 () Bool)

(declare-fun res!68863 () Bool)

(assert (=> b!83769 (=> (not res!68863) (not e!55803))))

(assert (=> b!83769 (= res!68863 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!133668))))

(declare-fun b!83770 () Bool)

(declare-fun lt!133671 () (_ BitVec 64))

(assert (=> b!83770 (= e!55803 (bvsle lt!133668 (bvmul lt!133671 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!83770 (or (= lt!133671 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!133671 #b0000000000000000000000000000000000000000000000000000000000001000) lt!133671)))))

(assert (=> b!83770 (= lt!133671 ((_ sign_extend 32) (size!1759 (buf!2149 b1!98))))))

(assert (= (and d!26872 res!68862) b!83769))

(assert (= (and b!83769 res!68863) b!83770))

(assert (=> d!26872 m!130365))

(declare-fun m!130403 () Bool)

(assert (=> d!26872 m!130403))

(assert (=> b!83741 d!26872))

(declare-fun d!26874 () Bool)

(assert (=> d!26874 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1759 (buf!2149 b1!98))) ((_ sign_extend 32) (currentByte!4270 b1!98)) ((_ sign_extend 32) (currentBit!4265 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1759 (buf!2149 b1!98))) ((_ sign_extend 32) (currentByte!4270 b1!98)) ((_ sign_extend 32) (currentBit!4265 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6618 () Bool)

(assert (= bs!6618 d!26874))

(assert (=> bs!6618 m!130365))

(assert (=> b!83738 d!26874))

(declare-fun d!26876 () Bool)

(assert (=> d!26876 (= (remainingBits!0 ((_ sign_extend 32) (size!1759 (buf!2149 b1!98))) ((_ sign_extend 32) (currentByte!4270 b1!98)) ((_ sign_extend 32) (currentBit!4265 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1759 (buf!2149 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4270 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4265 b1!98)))))))

(assert (=> b!83743 d!26876))

(declare-fun d!26878 () Bool)

(declare-fun lt!133673 () (_ BitVec 64))

(declare-fun lt!133676 () (_ BitVec 64))

(assert (=> d!26878 (= (remainingBits!0 ((_ sign_extend 32) (size!1759 (buf!2149 b1!98))) ((_ sign_extend 32) (currentByte!4270 b1!98)) ((_ sign_extend 32) (currentBit!4265 b1!98))) (bvsub lt!133673 lt!133676))))

(assert (=> d!26878 (or (= (bvand lt!133673 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!133676 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!133673 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!133673 lt!133676) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26878 (= lt!133676 (bitIndex!0 (size!1759 (buf!2149 b1!98)) (currentByte!4270 b1!98) (currentBit!4265 b1!98)))))

(declare-fun lt!133675 () (_ BitVec 64))

(declare-fun lt!133677 () (_ BitVec 64))

(assert (=> d!26878 (= lt!133673 (bvmul lt!133675 lt!133677))))

(assert (=> d!26878 (or (= lt!133675 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!133677 (bvsdiv (bvmul lt!133675 lt!133677) lt!133675)))))

(assert (=> d!26878 (= lt!133677 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26878 (= lt!133675 ((_ sign_extend 32) (size!1759 (buf!2149 b1!98))))))

(declare-fun lt!133674 () Unit!5621)

(assert (=> d!26878 (= lt!133674 (choose!23 b1!98))))

(assert (=> d!26878 (= (remainingBitsBitIndexLemma!0 b1!98) lt!133674)))

(declare-fun bs!6619 () Bool)

(assert (= bs!6619 d!26878))

(assert (=> bs!6619 m!130365))

(assert (=> bs!6619 m!130381))

(declare-fun m!130405 () Bool)

(assert (=> bs!6619 m!130405))

(assert (=> b!83743 d!26878))

(declare-fun d!26880 () Bool)

(assert (=> d!26880 (= (inv!12 b1!98) (invariant!0 (currentBit!4265 b1!98) (currentByte!4270 b1!98) (size!1759 (buf!2149 b1!98))))))

(declare-fun bs!6620 () Bool)

(assert (= bs!6620 d!26880))

(assert (=> bs!6620 m!130403))

(assert (=> start!17192 d!26880))

(declare-fun d!26882 () Bool)

(assert (=> d!26882 (= (inv!12 b2!98) (invariant!0 (currentBit!4265 b2!98) (currentByte!4270 b2!98) (size!1759 (buf!2149 b2!98))))))

(declare-fun bs!6621 () Bool)

(assert (= bs!6621 d!26882))

(assert (=> bs!6621 m!130401))

(assert (=> start!17192 d!26882))

(declare-fun d!26884 () Bool)

(assert (=> d!26884 (= (array_inv!1605 (buf!2149 b2!98)) (bvsge (size!1759 (buf!2149 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!83739 d!26884))

(push 1)

(assert (not d!26880))

(assert (not d!26882))

(assert (not d!26868))

(assert (not d!26872))

(assert (not d!26874))

(assert (not d!26870))

(assert (not d!26878))

(check-sat)

(pop 1)

(push 1)

(check-sat)

