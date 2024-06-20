; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16272 () Bool)

(assert start!16272)

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-datatypes ((array!3617 0))(
  ( (array!3618 (arr!2300 (Array (_ BitVec 32) (_ BitVec 8))) (size!1663 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2888 0))(
  ( (BitStream!2889 (buf!2053 array!3617) (currentByte!3984 (_ BitVec 32)) (currentBit!3979 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!2888)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun b1!98 () BitStream!2888)

(assert (=> start!16272 (and (= (size!1663 (buf!2053 b1!98)) (size!1663 (buf!2053 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11) (or (bvsgt ((_ sign_extend 32) (size!1663 (buf!2053 b1!98))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!3984 b1!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!3979 b1!98)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun e!53733 () Bool)

(declare-fun inv!12 (BitStream!2888) Bool)

(assert (=> start!16272 (and (inv!12 b1!98) e!53733)))

(declare-fun e!53735 () Bool)

(assert (=> start!16272 (and (inv!12 b2!98) e!53735)))

(assert (=> start!16272 true))

(declare-fun b!81740 () Bool)

(declare-fun array_inv!1509 (array!3617) Bool)

(assert (=> b!81740 (= e!53733 (array_inv!1509 (buf!2053 b1!98)))))

(declare-fun b!81741 () Bool)

(assert (=> b!81741 (= e!53735 (array_inv!1509 (buf!2053 b2!98)))))

(assert (= start!16272 b!81740))

(assert (= start!16272 b!81741))

(declare-fun m!128101 () Bool)

(assert (=> start!16272 m!128101))

(declare-fun m!128103 () Bool)

(assert (=> start!16272 m!128103))

(declare-fun m!128105 () Bool)

(assert (=> b!81740 m!128105))

(declare-fun m!128107 () Bool)

(assert (=> b!81741 m!128107))

(push 1)

(assert (not b!81741))

(assert (not b!81740))

(assert (not start!16272))

(check-sat)

(pop 1)

(push 1)

(check-sat)

