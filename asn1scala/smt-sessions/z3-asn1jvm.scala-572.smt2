; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16340 () Bool)

(assert start!16340)

(declare-fun res!67504 () Bool)

(declare-fun e!53892 () Bool)

(assert (=> start!16340 (=> (not res!67504) (not e!53892))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-datatypes ((array!3646 0))(
  ( (array!3647 (arr!2311 (Array (_ BitVec 32) (_ BitVec 8))) (size!1674 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2910 0))(
  ( (BitStream!2911 (buf!2064 array!3646) (currentByte!4004 (_ BitVec 32)) (currentBit!3999 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!2910)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun b1!98 () BitStream!2910)

(assert (=> start!16340 (= res!67504 (and (= (size!1674 (buf!2064 b1!98)) (size!1674 (buf!2064 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16340 e!53892))

(declare-fun e!53890 () Bool)

(declare-fun inv!12 (BitStream!2910) Bool)

(assert (=> start!16340 (and (inv!12 b1!98) e!53890)))

(declare-fun e!53891 () Bool)

(assert (=> start!16340 (and (inv!12 b2!98) e!53891)))

(assert (=> start!16340 true))

(declare-fun b!81844 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!81844 (= e!53892 (not (invariant!0 (currentBit!3999 b2!98) (currentByte!4004 b2!98) (size!1674 (buf!2064 b2!98)))))))

(declare-fun b!81845 () Bool)

(declare-fun array_inv!1520 (array!3646) Bool)

(assert (=> b!81845 (= e!53890 (array_inv!1520 (buf!2064 b1!98)))))

(declare-fun b!81846 () Bool)

(assert (=> b!81846 (= e!53891 (array_inv!1520 (buf!2064 b2!98)))))

(declare-fun b!81843 () Bool)

(declare-fun res!67503 () Bool)

(assert (=> b!81843 (=> (not res!67503) (not e!53892))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!81843 (= res!67503 (validate_offset_bits!1 ((_ sign_extend 32) (size!1674 (buf!2064 b1!98))) ((_ sign_extend 32) (currentByte!4004 b1!98)) ((_ sign_extend 32) (currentBit!3999 b1!98)) b1ValidateOffsetBits!11))))

(assert (= (and start!16340 res!67504) b!81843))

(assert (= (and b!81843 res!67503) b!81844))

(assert (= start!16340 b!81845))

(assert (= start!16340 b!81846))

(declare-fun m!128235 () Bool)

(assert (=> b!81846 m!128235))

(declare-fun m!128237 () Bool)

(assert (=> b!81844 m!128237))

(declare-fun m!128239 () Bool)

(assert (=> start!16340 m!128239))

(declare-fun m!128241 () Bool)

(assert (=> start!16340 m!128241))

(declare-fun m!128243 () Bool)

(assert (=> b!81843 m!128243))

(declare-fun m!128245 () Bool)

(assert (=> b!81845 m!128245))

(check-sat (not b!81844) (not b!81846) (not b!81843) (not b!81845) (not start!16340))
(check-sat)
(get-model)

(declare-fun d!25646 () Bool)

(assert (=> d!25646 (= (array_inv!1520 (buf!2064 b2!98)) (bvsge (size!1674 (buf!2064 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!81846 d!25646))

(declare-fun d!25650 () Bool)

(assert (=> d!25650 (= (array_inv!1520 (buf!2064 b1!98)) (bvsge (size!1674 (buf!2064 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!81845 d!25650))

(declare-fun d!25652 () Bool)

(assert (=> d!25652 (= (inv!12 b1!98) (invariant!0 (currentBit!3999 b1!98) (currentByte!4004 b1!98) (size!1674 (buf!2064 b1!98))))))

(declare-fun bs!6282 () Bool)

(assert (= bs!6282 d!25652))

(declare-fun m!128263 () Bool)

(assert (=> bs!6282 m!128263))

(assert (=> start!16340 d!25652))

(declare-fun d!25662 () Bool)

(assert (=> d!25662 (= (inv!12 b2!98) (invariant!0 (currentBit!3999 b2!98) (currentByte!4004 b2!98) (size!1674 (buf!2064 b2!98))))))

(declare-fun bs!6283 () Bool)

(assert (= bs!6283 d!25662))

(assert (=> bs!6283 m!128237))

(assert (=> start!16340 d!25662))

(declare-fun d!25664 () Bool)

(assert (=> d!25664 (= (invariant!0 (currentBit!3999 b2!98) (currentByte!4004 b2!98) (size!1674 (buf!2064 b2!98))) (and (bvsge (currentBit!3999 b2!98) #b00000000000000000000000000000000) (bvslt (currentBit!3999 b2!98) #b00000000000000000000000000001000) (bvsge (currentByte!4004 b2!98) #b00000000000000000000000000000000) (or (bvslt (currentByte!4004 b2!98) (size!1674 (buf!2064 b2!98))) (and (= (currentBit!3999 b2!98) #b00000000000000000000000000000000) (= (currentByte!4004 b2!98) (size!1674 (buf!2064 b2!98)))))))))

(assert (=> b!81844 d!25664))

(declare-fun d!25668 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!25668 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1674 (buf!2064 b1!98))) ((_ sign_extend 32) (currentByte!4004 b1!98)) ((_ sign_extend 32) (currentBit!3999 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1674 (buf!2064 b1!98))) ((_ sign_extend 32) (currentByte!4004 b1!98)) ((_ sign_extend 32) (currentBit!3999 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6284 () Bool)

(assert (= bs!6284 d!25668))

(declare-fun m!128265 () Bool)

(assert (=> bs!6284 m!128265))

(assert (=> b!81843 d!25668))

(check-sat (not d!25668) (not d!25662) (not d!25652))
