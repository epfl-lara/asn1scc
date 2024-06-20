; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16310 () Bool)

(assert start!16310)

(declare-fun b!81808 () Bool)

(declare-fun e!53844 () Bool)

(declare-datatypes ((array!3637 0))(
  ( (array!3638 (arr!2308 (Array (_ BitVec 32) (_ BitVec 8))) (size!1671 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2904 0))(
  ( (BitStream!2905 (buf!2061 array!3637) (currentByte!3995 (_ BitVec 32)) (currentBit!3990 (_ BitVec 32))) )
))
(declare-fun b1!98 () BitStream!2904)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!81808 (= e!53844 (not (invariant!0 (currentBit!3990 b1!98) (currentByte!3995 b1!98) (size!1671 (buf!2061 b1!98)))))))

(declare-fun b!81810 () Bool)

(declare-fun e!53846 () Bool)

(declare-fun b2!98 () BitStream!2904)

(declare-fun array_inv!1517 (array!3637) Bool)

(assert (=> b!81810 (= e!53846 (array_inv!1517 (buf!2061 b2!98)))))

(declare-fun b!81807 () Bool)

(declare-fun res!67486 () Bool)

(assert (=> b!81807 (=> (not res!67486) (not e!53844))))

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!81807 (= res!67486 (validate_offset_bits!1 ((_ sign_extend 32) (size!1671 (buf!2061 b1!98))) ((_ sign_extend 32) (currentByte!3995 b1!98)) ((_ sign_extend 32) (currentBit!3990 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!81809 () Bool)

(declare-fun e!53843 () Bool)

(assert (=> b!81809 (= e!53843 (array_inv!1517 (buf!2061 b1!98)))))

(declare-fun res!67485 () Bool)

(assert (=> start!16310 (=> (not res!67485) (not e!53844))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(assert (=> start!16310 (= res!67485 (and (= (size!1671 (buf!2061 b1!98)) (size!1671 (buf!2061 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16310 e!53844))

(declare-fun inv!12 (BitStream!2904) Bool)

(assert (=> start!16310 (and (inv!12 b1!98) e!53843)))

(assert (=> start!16310 (and (inv!12 b2!98) e!53846)))

(assert (=> start!16310 true))

(assert (= (and start!16310 res!67485) b!81807))

(assert (= (and b!81807 res!67486) b!81808))

(assert (= start!16310 b!81809))

(assert (= start!16310 b!81810))

(declare-fun m!128187 () Bool)

(assert (=> b!81808 m!128187))

(declare-fun m!128189 () Bool)

(assert (=> b!81810 m!128189))

(declare-fun m!128191 () Bool)

(assert (=> b!81807 m!128191))

(declare-fun m!128193 () Bool)

(assert (=> start!16310 m!128193))

(declare-fun m!128195 () Bool)

(assert (=> start!16310 m!128195))

(declare-fun m!128197 () Bool)

(assert (=> b!81809 m!128197))

(check-sat (not start!16310) (not b!81809) (not b!81807) (not b!81808) (not b!81810))
(check-sat)
(get-model)

(declare-fun d!25608 () Bool)

(assert (=> d!25608 (= (array_inv!1517 (buf!2061 b2!98)) (bvsge (size!1671 (buf!2061 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!81810 d!25608))

(declare-fun d!25616 () Bool)

(assert (=> d!25616 (= (array_inv!1517 (buf!2061 b1!98)) (bvsge (size!1671 (buf!2061 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!81809 d!25616))

(declare-fun d!25618 () Bool)

(assert (=> d!25618 (= (inv!12 b1!98) (invariant!0 (currentBit!3990 b1!98) (currentByte!3995 b1!98) (size!1671 (buf!2061 b1!98))))))

(declare-fun bs!6267 () Bool)

(assert (= bs!6267 d!25618))

(assert (=> bs!6267 m!128187))

(assert (=> start!16310 d!25618))

(declare-fun d!25626 () Bool)

(assert (=> d!25626 (= (inv!12 b2!98) (invariant!0 (currentBit!3990 b2!98) (currentByte!3995 b2!98) (size!1671 (buf!2061 b2!98))))))

(declare-fun bs!6268 () Bool)

(assert (= bs!6268 d!25626))

(declare-fun m!128211 () Bool)

(assert (=> bs!6268 m!128211))

(assert (=> start!16310 d!25626))

(declare-fun d!25628 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!25628 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1671 (buf!2061 b1!98))) ((_ sign_extend 32) (currentByte!3995 b1!98)) ((_ sign_extend 32) (currentBit!3990 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1671 (buf!2061 b1!98))) ((_ sign_extend 32) (currentByte!3995 b1!98)) ((_ sign_extend 32) (currentBit!3990 b1!98))) b1ValidateOffsetBits!11))))

