; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16312 () Bool)

(assert start!16312)

(declare-fun b!81820 () Bool)

(declare-fun e!53861 () Bool)

(declare-datatypes ((array!3639 0))(
  ( (array!3640 (arr!2309 (Array (_ BitVec 32) (_ BitVec 8))) (size!1672 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2906 0))(
  ( (BitStream!2907 (buf!2062 array!3639) (currentByte!3996 (_ BitVec 32)) (currentBit!3991 (_ BitVec 32))) )
))
(declare-fun b1!98 () BitStream!2906)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!81820 (= e!53861 (not (invariant!0 (currentBit!3991 b1!98) (currentByte!3996 b1!98) (size!1672 (buf!2062 b1!98)))))))

(declare-fun b!81822 () Bool)

(declare-fun e!53858 () Bool)

(declare-fun b2!98 () BitStream!2906)

(declare-fun array_inv!1518 (array!3639) Bool)

(assert (=> b!81822 (= e!53858 (array_inv!1518 (buf!2062 b2!98)))))

(declare-fun res!67492 () Bool)

(assert (=> start!16312 (=> (not res!67492) (not e!53861))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(assert (=> start!16312 (= res!67492 (and (= (size!1672 (buf!2062 b1!98)) (size!1672 (buf!2062 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16312 e!53861))

(declare-fun e!53859 () Bool)

(declare-fun inv!12 (BitStream!2906) Bool)

(assert (=> start!16312 (and (inv!12 b1!98) e!53859)))

(assert (=> start!16312 (and (inv!12 b2!98) e!53858)))

(assert (=> start!16312 true))

(declare-fun b!81821 () Bool)

(assert (=> b!81821 (= e!53859 (array_inv!1518 (buf!2062 b1!98)))))

(declare-fun b!81819 () Bool)

(declare-fun res!67491 () Bool)

(assert (=> b!81819 (=> (not res!67491) (not e!53861))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!81819 (= res!67491 (validate_offset_bits!1 ((_ sign_extend 32) (size!1672 (buf!2062 b1!98))) ((_ sign_extend 32) (currentByte!3996 b1!98)) ((_ sign_extend 32) (currentBit!3991 b1!98)) b1ValidateOffsetBits!11))))

(assert (= (and start!16312 res!67492) b!81819))

(assert (= (and b!81819 res!67491) b!81820))

(assert (= start!16312 b!81821))

(assert (= start!16312 b!81822))

(declare-fun m!128199 () Bool)

(assert (=> b!81822 m!128199))

(declare-fun m!128201 () Bool)

(assert (=> b!81820 m!128201))

(declare-fun m!128203 () Bool)

(assert (=> start!16312 m!128203))

(declare-fun m!128205 () Bool)

(assert (=> start!16312 m!128205))

(declare-fun m!128207 () Bool)

(assert (=> b!81819 m!128207))

(declare-fun m!128209 () Bool)

(assert (=> b!81821 m!128209))

(push 1)

(assert (not b!81820))

(assert (not start!16312))

(assert (not b!81819))

(assert (not b!81822))

(assert (not b!81821))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!25612 () Bool)

(assert (=> d!25612 (= (invariant!0 (currentBit!3991 b1!98) (currentByte!3996 b1!98) (size!1672 (buf!2062 b1!98))) (and (bvsge (currentBit!3991 b1!98) #b00000000000000000000000000000000) (bvslt (currentBit!3991 b1!98) #b00000000000000000000000000001000) (bvsge (currentByte!3996 b1!98) #b00000000000000000000000000000000) (or (bvslt (currentByte!3996 b1!98) (size!1672 (buf!2062 b1!98))) (and (= (currentBit!3991 b1!98) #b00000000000000000000000000000000) (= (currentByte!3996 b1!98) (size!1672 (buf!2062 b1!98)))))))))

(assert (=> b!81820 d!25612))

(declare-fun d!25622 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!25622 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1672 (buf!2062 b1!98))) ((_ sign_extend 32) (currentByte!3996 b1!98)) ((_ sign_extend 32) (currentBit!3991 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1672 (buf!2062 b1!98))) ((_ sign_extend 32) (currentByte!3996 b1!98)) ((_ sign_extend 32) (currentBit!3991 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6269 () Bool)

(assert (= bs!6269 d!25622))

(declare-fun m!128213 () Bool)

(assert (=> bs!6269 m!128213))

(assert (=> b!81819 d!25622))

(declare-fun d!25630 () Bool)

(assert (=> d!25630 (= (array_inv!1518 (buf!2062 b2!98)) (bvsge (size!1672 (buf!2062 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!81822 d!25630))

(declare-fun d!25636 () Bool)

(assert (=> d!25636 (= (inv!12 b1!98) (invariant!0 (currentBit!3991 b1!98) (currentByte!3996 b1!98) (size!1672 (buf!2062 b1!98))))))

(declare-fun bs!6273 () Bool)

(assert (= bs!6273 d!25636))

(assert (=> bs!6273 m!128201))

(assert (=> start!16312 d!25636))

(declare-fun d!25638 () Bool)

(assert (=> d!25638 (= (inv!12 b2!98) (invariant!0 (currentBit!3991 b2!98) (currentByte!3996 b2!98) (size!1672 (buf!2062 b2!98))))))

(declare-fun bs!6275 () Bool)

(assert (= bs!6275 d!25638))

(declare-fun m!128221 () Bool)

(assert (=> bs!6275 m!128221))

(assert (=> start!16312 d!25638))

(declare-fun d!25642 () Bool)

(assert (=> d!25642 (= (array_inv!1518 (buf!2062 b1!98)) (bvsge (size!1672 (buf!2062 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!81821 d!25642))

(push 1)

