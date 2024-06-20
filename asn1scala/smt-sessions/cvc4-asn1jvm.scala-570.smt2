; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16294 () Bool)

(assert start!16294)

(declare-fun res!67474 () Bool)

(declare-fun e!53817 () Bool)

(assert (=> start!16294 (=> (not res!67474) (not e!53817))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-datatypes ((array!3631 0))(
  ( (array!3632 (arr!2306 (Array (_ BitVec 32) (_ BitVec 8))) (size!1669 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2900 0))(
  ( (BitStream!2901 (buf!2059 array!3631) (currentByte!3991 (_ BitVec 32)) (currentBit!3986 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!2900)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun b1!98 () BitStream!2900)

(assert (=> start!16294 (= res!67474 (and (= (size!1669 (buf!2059 b1!98)) (size!1669 (buf!2059 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11) (bvsle ((_ sign_extend 32) (size!1669 (buf!2059 b1!98))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!3991 b1!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!3986 b1!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!1669 (buf!2059 b1!98))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!3991 b1!98)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!3986 b1!98)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!16294 e!53817))

(declare-fun e!53815 () Bool)

(declare-fun inv!12 (BitStream!2900) Bool)

(assert (=> start!16294 (and (inv!12 b1!98) e!53815)))

(declare-fun e!53813 () Bool)

(assert (=> start!16294 (and (inv!12 b2!98) e!53813)))

(assert (=> start!16294 true))

(declare-fun b!81784 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!81784 (= e!53817 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!3986 b1!98))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!3991 b1!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1669 (buf!2059 b1!98)))))))))

(declare-fun b!81785 () Bool)

(declare-fun array_inv!1515 (array!3631) Bool)

(assert (=> b!81785 (= e!53815 (array_inv!1515 (buf!2059 b1!98)))))

(declare-fun b!81786 () Bool)

(assert (=> b!81786 (= e!53813 (array_inv!1515 (buf!2059 b2!98)))))

(assert (= (and start!16294 res!67474) b!81784))

(assert (= start!16294 b!81785))

(assert (= start!16294 b!81786))

(declare-fun m!128157 () Bool)

(assert (=> start!16294 m!128157))

(declare-fun m!128159 () Bool)

(assert (=> start!16294 m!128159))

(declare-fun m!128161 () Bool)

(assert (=> b!81784 m!128161))

(declare-fun m!128163 () Bool)

(assert (=> b!81785 m!128163))

(declare-fun m!128165 () Bool)

(assert (=> b!81786 m!128165))

(push 1)

(assert (not b!81786))

(assert (not start!16294))

(assert (not b!81785))

(assert (not b!81784))

(check-sat)

(pop 1)

(push 1)

(check-sat)

