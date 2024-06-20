; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16274 () Bool)

(assert start!16274)

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-datatypes ((array!3619 0))(
  ( (array!3620 (arr!2301 (Array (_ BitVec 32) (_ BitVec 8))) (size!1664 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2890 0))(
  ( (BitStream!2891 (buf!2054 array!3619) (currentByte!3985 (_ BitVec 32)) (currentBit!3980 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!2890)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun b1!98 () BitStream!2890)

(assert (=> start!16274 (and (= (size!1664 (buf!2054 b1!98)) (size!1664 (buf!2054 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11) (bvsle ((_ sign_extend 32) (size!1664 (buf!2054 b1!98))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!3985 b1!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!3980 b1!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!1664 (buf!2054 b1!98))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!3985 b1!98)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!3980 b1!98)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!53745 () Bool)

(declare-fun inv!12 (BitStream!2890) Bool)

(assert (=> start!16274 (and (inv!12 b1!98) e!53745)))

(declare-fun e!53747 () Bool)

(assert (=> start!16274 (and (inv!12 b2!98) e!53747)))

(assert (=> start!16274 true))

(declare-fun b!81746 () Bool)

(declare-fun array_inv!1510 (array!3619) Bool)

(assert (=> b!81746 (= e!53745 (array_inv!1510 (buf!2054 b1!98)))))

(declare-fun b!81747 () Bool)

(assert (=> b!81747 (= e!53747 (array_inv!1510 (buf!2054 b2!98)))))

(assert (= start!16274 b!81746))

(assert (= start!16274 b!81747))

(declare-fun m!128109 () Bool)

(assert (=> start!16274 m!128109))

(declare-fun m!128111 () Bool)

(assert (=> start!16274 m!128111))

(declare-fun m!128113 () Bool)

(assert (=> b!81746 m!128113))

(declare-fun m!128115 () Bool)

(assert (=> b!81747 m!128115))

(push 1)

(assert (not b!81747))

(assert (not b!81746))

(assert (not start!16274))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

