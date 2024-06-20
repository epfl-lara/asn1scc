; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16308 () Bool)

(assert start!16308)

(declare-fun b!81797 () Bool)

(declare-fun e!53831 () Bool)

(declare-datatypes ((array!3635 0))(
  ( (array!3636 (arr!2307 (Array (_ BitVec 32) (_ BitVec 8))) (size!1670 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2902 0))(
  ( (BitStream!2903 (buf!2060 array!3635) (currentByte!3994 (_ BitVec 32)) (currentBit!3989 (_ BitVec 32))) )
))
(declare-fun b1!98 () BitStream!2902)

(declare-fun array_inv!1516 (array!3635) Bool)

(assert (=> b!81797 (= e!53831 (array_inv!1516 (buf!2060 b1!98)))))

(declare-fun b!81798 () Bool)

(declare-fun e!53832 () Bool)

(declare-fun b2!98 () BitStream!2902)

(assert (=> b!81798 (= e!53832 (array_inv!1516 (buf!2060 b2!98)))))

(declare-fun b!81795 () Bool)

(declare-fun res!67479 () Bool)

(declare-fun e!53830 () Bool)

(assert (=> b!81795 (=> (not res!67479) (not e!53830))))

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!81795 (= res!67479 (validate_offset_bits!1 ((_ sign_extend 32) (size!1670 (buf!2060 b1!98))) ((_ sign_extend 32) (currentByte!3994 b1!98)) ((_ sign_extend 32) (currentBit!3989 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!81796 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!81796 (= e!53830 (not (invariant!0 (currentBit!3989 b1!98) (currentByte!3994 b1!98) (size!1670 (buf!2060 b1!98)))))))

(declare-fun res!67480 () Bool)

(assert (=> start!16308 (=> (not res!67480) (not e!53830))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(assert (=> start!16308 (= res!67480 (and (= (size!1670 (buf!2060 b1!98)) (size!1670 (buf!2060 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16308 e!53830))

(declare-fun inv!12 (BitStream!2902) Bool)

(assert (=> start!16308 (and (inv!12 b1!98) e!53831)))

(assert (=> start!16308 (and (inv!12 b2!98) e!53832)))

(assert (=> start!16308 true))

(assert (= (and start!16308 res!67480) b!81795))

(assert (= (and b!81795 res!67479) b!81796))

(assert (= start!16308 b!81797))

(assert (= start!16308 b!81798))

(declare-fun m!128175 () Bool)

(assert (=> b!81797 m!128175))

(declare-fun m!128177 () Bool)

(assert (=> start!16308 m!128177))

(declare-fun m!128179 () Bool)

(assert (=> start!16308 m!128179))

(declare-fun m!128181 () Bool)

(assert (=> b!81798 m!128181))

(declare-fun m!128183 () Bool)

(assert (=> b!81796 m!128183))

(declare-fun m!128185 () Bool)

(assert (=> b!81795 m!128185))

(push 1)

(assert (not b!81797))

(assert (not b!81795))

(assert (not start!16308))

(assert (not b!81798))

(assert (not b!81796))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!25610 () Bool)

(assert (=> d!25610 (= (array_inv!1516 (buf!2060 b2!98)) (bvsge (size!1670 (buf!2060 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!81798 d!25610))

(declare-fun d!25614 () Bool)

(assert (=> d!25614 (= (invariant!0 (currentBit!3989 b1!98) (currentByte!3994 b1!98) (size!1670 (buf!2060 b1!98))) (and (bvsge (currentBit!3989 b1!98) #b00000000000000000000000000000000) (bvslt (currentBit!3989 b1!98) #b00000000000000000000000000001000) (bvsge (currentByte!3994 b1!98) #b00000000000000000000000000000000) (or (bvslt (currentByte!3994 b1!98) (size!1670 (buf!2060 b1!98))) (and (= (currentBit!3989 b1!98) #b00000000000000000000000000000000) (= (currentByte!3994 b1!98) (size!1670 (buf!2060 b1!98)))))))))

(assert (=> b!81796 d!25614))

(declare-fun d!25620 () Bool)

(assert (=> d!25620 (= (array_inv!1516 (buf!2060 b1!98)) (bvsge (size!1670 (buf!2060 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!81797 d!25620))

(declare-fun d!25624 () Bool)

(assert (=> d!25624 (= (inv!12 b1!98) (invariant!0 (currentBit!3989 b1!98) (currentByte!3994 b1!98) (size!1670 (buf!2060 b1!98))))))

(declare-fun bs!6270 () Bool)

(assert (= bs!6270 d!25624))

(assert (=> bs!6270 m!128183))

(assert (=> start!16308 d!25624))

(declare-fun d!25632 () Bool)

(assert (=> d!25632 (= (inv!12 b2!98) (invariant!0 (currentBit!3989 b2!98) (currentByte!3994 b2!98) (size!1670 (buf!2060 b2!98))))))

(declare-fun bs!6271 () Bool)

(assert (= bs!6271 d!25632))

(declare-fun m!128215 () Bool)

(assert (=> bs!6271 m!128215))

(assert (=> start!16308 d!25632))

(declare-fun d!25634 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!25634 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1670 (buf!2060 b1!98))) ((_ sign_extend 32) (currentByte!3994 b1!98)) ((_ sign_extend 32) (currentBit!3989 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1670 (buf!2060 b1!98))) ((_ sign_extend 32) (currentByte!3994 b1!98)) ((_ sign_extend 32) (currentBit!3989 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6272 () Bool)

(assert (= bs!6272 d!25634))

(declare-fun m!128217 () Bool)

(assert (=> bs!6272 m!128217))

(assert (=> b!81795 d!25634))

(push 1)

(assert (not d!25634))

(assert (not d!25624))

(assert (not d!25632))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

