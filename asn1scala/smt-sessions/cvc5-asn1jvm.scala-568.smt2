; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16268 () Bool)

(assert start!16268)

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-datatypes ((array!3613 0))(
  ( (array!3614 (arr!2298 (Array (_ BitVec 32) (_ BitVec 8))) (size!1661 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2884 0))(
  ( (BitStream!2885 (buf!2051 array!3613) (currentByte!3982 (_ BitVec 32)) (currentBit!3977 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!2884)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun b1!98 () BitStream!2884)

(assert (=> start!16268 (and (= (size!1661 (buf!2051 b1!98)) (size!1661 (buf!2051 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11) (or (bvsgt ((_ sign_extend 32) (size!1661 (buf!2051 b1!98))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!3982 b1!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!3977 b1!98)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun e!53709 () Bool)

(declare-fun inv!12 (BitStream!2884) Bool)

(assert (=> start!16268 (and (inv!12 b1!98) e!53709)))

(declare-fun e!53711 () Bool)

(assert (=> start!16268 (and (inv!12 b2!98) e!53711)))

(assert (=> start!16268 true))

(declare-fun b!81728 () Bool)

(declare-fun array_inv!1507 (array!3613) Bool)

(assert (=> b!81728 (= e!53709 (array_inv!1507 (buf!2051 b1!98)))))

(declare-fun b!81729 () Bool)

(assert (=> b!81729 (= e!53711 (array_inv!1507 (buf!2051 b2!98)))))

(assert (= start!16268 b!81728))

(assert (= start!16268 b!81729))

(declare-fun m!128085 () Bool)

(assert (=> start!16268 m!128085))

(declare-fun m!128087 () Bool)

(assert (=> start!16268 m!128087))

(declare-fun m!128089 () Bool)

(assert (=> b!81728 m!128089))

(declare-fun m!128091 () Bool)

(assert (=> b!81729 m!128091))

(push 1)

(assert (not start!16268))

(assert (not b!81729))

(assert (not b!81728))

(check-sat)

(pop 1)

(push 1)

(check-sat)

