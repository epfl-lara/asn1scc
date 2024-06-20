; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16338 () Bool)

(assert start!16338)

(declare-fun res!67497 () Bool)

(declare-fun e!53877 () Bool)

(assert (=> start!16338 (=> (not res!67497) (not e!53877))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-datatypes ((array!3644 0))(
  ( (array!3645 (arr!2310 (Array (_ BitVec 32) (_ BitVec 8))) (size!1673 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2908 0))(
  ( (BitStream!2909 (buf!2063 array!3644) (currentByte!4003 (_ BitVec 32)) (currentBit!3998 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!2908)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun b1!98 () BitStream!2908)

(assert (=> start!16338 (= res!67497 (and (= (size!1673 (buf!2063 b1!98)) (size!1673 (buf!2063 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16338 e!53877))

(declare-fun e!53873 () Bool)

(declare-fun inv!12 (BitStream!2908) Bool)

(assert (=> start!16338 (and (inv!12 b1!98) e!53873)))

(declare-fun e!53876 () Bool)

(assert (=> start!16338 (and (inv!12 b2!98) e!53876)))

(assert (=> start!16338 true))

(declare-fun b!81834 () Bool)

(declare-fun array_inv!1519 (array!3644) Bool)

(assert (=> b!81834 (= e!53876 (array_inv!1519 (buf!2063 b2!98)))))

(declare-fun b!81832 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!81832 (= e!53877 (not (invariant!0 (currentBit!3998 b2!98) (currentByte!4003 b2!98) (size!1673 (buf!2063 b2!98)))))))

(declare-fun b!81831 () Bool)

(declare-fun res!67498 () Bool)

(assert (=> b!81831 (=> (not res!67498) (not e!53877))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!81831 (= res!67498 (validate_offset_bits!1 ((_ sign_extend 32) (size!1673 (buf!2063 b1!98))) ((_ sign_extend 32) (currentByte!4003 b1!98)) ((_ sign_extend 32) (currentBit!3998 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!81833 () Bool)

(assert (=> b!81833 (= e!53873 (array_inv!1519 (buf!2063 b1!98)))))

(assert (= (and start!16338 res!67497) b!81831))

(assert (= (and b!81831 res!67498) b!81832))

(assert (= start!16338 b!81833))

(assert (= start!16338 b!81834))

(declare-fun m!128223 () Bool)

(assert (=> b!81832 m!128223))

(declare-fun m!128225 () Bool)

(assert (=> b!81831 m!128225))

(declare-fun m!128227 () Bool)

(assert (=> b!81833 m!128227))

(declare-fun m!128229 () Bool)

(assert (=> b!81834 m!128229))

(declare-fun m!128231 () Bool)

(assert (=> start!16338 m!128231))

(declare-fun m!128233 () Bool)

(assert (=> start!16338 m!128233))

(push 1)

(assert (not b!81831))

(assert (not b!81834))

(assert (not start!16338))

(assert (not b!81832))

(assert (not b!81833))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!25648 () Bool)

(assert (=> d!25648 (= (inv!12 b1!98) (invariant!0 (currentBit!3998 b1!98) (currentByte!4003 b1!98) (size!1673 (buf!2063 b1!98))))))

(declare-fun bs!6279 () Bool)

(assert (= bs!6279 d!25648))

(declare-fun m!128259 () Bool)

(assert (=> bs!6279 m!128259))

(assert (=> start!16338 d!25648))

(declare-fun d!25654 () Bool)

(assert (=> d!25654 (= (inv!12 b2!98) (invariant!0 (currentBit!3998 b2!98) (currentByte!4003 b2!98) (size!1673 (buf!2063 b2!98))))))

(declare-fun bs!6280 () Bool)

(assert (= bs!6280 d!25654))

(assert (=> bs!6280 m!128223))

(assert (=> start!16338 d!25654))

(declare-fun d!25656 () Bool)

(assert (=> d!25656 (= (array_inv!1519 (buf!2063 b1!98)) (bvsge (size!1673 (buf!2063 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!81833 d!25656))

(declare-fun d!25658 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!25658 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1673 (buf!2063 b1!98))) ((_ sign_extend 32) (currentByte!4003 b1!98)) ((_ sign_extend 32) (currentBit!3998 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1673 (buf!2063 b1!98))) ((_ sign_extend 32) (currentByte!4003 b1!98)) ((_ sign_extend 32) (currentBit!3998 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6281 () Bool)

(assert (= bs!6281 d!25658))

(declare-fun m!128262 () Bool)

(assert (=> bs!6281 m!128262))

(assert (=> b!81831 d!25658))

(declare-fun d!25660 () Bool)

(assert (=> d!25660 (= (invariant!0 (currentBit!3998 b2!98) (currentByte!4003 b2!98) (size!1673 (buf!2063 b2!98))) (and (bvsge (currentBit!3998 b2!98) #b00000000000000000000000000000000) (bvslt (currentBit!3998 b2!98) #b00000000000000000000000000001000) (bvsge (currentByte!4003 b2!98) #b00000000000000000000000000000000) (or (bvslt (currentByte!4003 b2!98) (size!1673 (buf!2063 b2!98))) (and (= (currentBit!3998 b2!98) #b00000000000000000000000000000000) (= (currentByte!4003 b2!98) (size!1673 (buf!2063 b2!98)))))))))

(assert (=> b!81832 d!25660))

(declare-fun d!25666 () Bool)

(assert (=> d!25666 (= (array_inv!1519 (buf!2063 b2!98)) (bvsge (size!1673 (buf!2063 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!81834 d!25666))

(push 1)

(assert (not d!25648))

(assert (not d!25654))

(assert (not d!25658))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

