; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16270 () Bool)

(assert start!16270)

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-datatypes ((array!3615 0))(
  ( (array!3616 (arr!2299 (Array (_ BitVec 32) (_ BitVec 8))) (size!1662 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2886 0))(
  ( (BitStream!2887 (buf!2052 array!3615) (currentByte!3983 (_ BitVec 32)) (currentBit!3978 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!2886)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun b1!98 () BitStream!2886)

(assert (=> start!16270 (and (= (size!1662 (buf!2052 b1!98)) (size!1662 (buf!2052 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11) (or (bvsgt ((_ sign_extend 32) (size!1662 (buf!2052 b1!98))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!3983 b1!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!3978 b1!98)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun e!53721 () Bool)

(declare-fun inv!12 (BitStream!2886) Bool)

(assert (=> start!16270 (and (inv!12 b1!98) e!53721)))

(declare-fun e!53723 () Bool)

(assert (=> start!16270 (and (inv!12 b2!98) e!53723)))

(assert (=> start!16270 true))

(declare-fun b!81734 () Bool)

(declare-fun array_inv!1508 (array!3615) Bool)

(assert (=> b!81734 (= e!53721 (array_inv!1508 (buf!2052 b1!98)))))

(declare-fun b!81735 () Bool)

(assert (=> b!81735 (= e!53723 (array_inv!1508 (buf!2052 b2!98)))))

(assert (= start!16270 b!81734))

(assert (= start!16270 b!81735))

(declare-fun m!128093 () Bool)

(assert (=> start!16270 m!128093))

(declare-fun m!128095 () Bool)

(assert (=> start!16270 m!128095))

(declare-fun m!128097 () Bool)

(assert (=> b!81734 m!128097))

(declare-fun m!128099 () Bool)

(assert (=> b!81735 m!128099))

(check-sat (not b!81734) (not b!81735) (not start!16270))
(check-sat)
