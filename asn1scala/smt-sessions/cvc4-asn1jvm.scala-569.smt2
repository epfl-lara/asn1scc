; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16278 () Bool)

(assert start!16278)

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-datatypes ((array!3623 0))(
  ( (array!3624 (arr!2303 (Array (_ BitVec 32) (_ BitVec 8))) (size!1666 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2894 0))(
  ( (BitStream!2895 (buf!2056 array!3623) (currentByte!3987 (_ BitVec 32)) (currentBit!3982 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!2894)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun b1!98 () BitStream!2894)

(assert (=> start!16278 (and (= (size!1666 (buf!2056 b1!98)) (size!1666 (buf!2056 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11) (bvsle ((_ sign_extend 32) (size!1666 (buf!2056 b1!98))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!3987 b1!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!3982 b1!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!1666 (buf!2056 b1!98))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!3987 b1!98)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!3982 b1!98)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!53769 () Bool)

(declare-fun inv!12 (BitStream!2894) Bool)

(assert (=> start!16278 (and (inv!12 b1!98) e!53769)))

(declare-fun e!53771 () Bool)

(assert (=> start!16278 (and (inv!12 b2!98) e!53771)))

(assert (=> start!16278 true))

(declare-fun b!81758 () Bool)

(declare-fun array_inv!1512 (array!3623) Bool)

(assert (=> b!81758 (= e!53769 (array_inv!1512 (buf!2056 b1!98)))))

(declare-fun b!81759 () Bool)

(assert (=> b!81759 (= e!53771 (array_inv!1512 (buf!2056 b2!98)))))

(assert (= start!16278 b!81758))

(assert (= start!16278 b!81759))

(declare-fun m!128125 () Bool)

(assert (=> start!16278 m!128125))

(declare-fun m!128127 () Bool)

(assert (=> start!16278 m!128127))

(declare-fun m!128129 () Bool)

(assert (=> b!81758 m!128129))

(declare-fun m!128131 () Bool)

(assert (=> b!81759 m!128131))

(push 1)

(assert (not b!81759))

(assert (not b!81758))

(assert (not start!16278))

(check-sat)

(pop 1)

(push 1)

(check-sat)

