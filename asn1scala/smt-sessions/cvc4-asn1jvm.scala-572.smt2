; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16342 () Bool)

(assert start!16342)

(declare-fun b!81857 () Bool)

(declare-fun e!53906 () Bool)

(declare-datatypes ((array!3648 0))(
  ( (array!3649 (arr!2312 (Array (_ BitVec 32) (_ BitVec 8))) (size!1675 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2912 0))(
  ( (BitStream!2913 (buf!2065 array!3648) (currentByte!4005 (_ BitVec 32)) (currentBit!4000 (_ BitVec 32))) )
))
(declare-fun b1!98 () BitStream!2912)

(declare-fun array_inv!1521 (array!3648) Bool)

(assert (=> b!81857 (= e!53906 (array_inv!1521 (buf!2065 b1!98)))))

(declare-fun res!67510 () Bool)

(declare-fun e!53905 () Bool)

(assert (=> start!16342 (=> (not res!67510) (not e!53905))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-fun b2!98 () BitStream!2912)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(assert (=> start!16342 (= res!67510 (and (= (size!1675 (buf!2065 b1!98)) (size!1675 (buf!2065 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16342 e!53905))

(declare-fun inv!12 (BitStream!2912) Bool)

(assert (=> start!16342 (and (inv!12 b1!98) e!53906)))

(declare-fun e!53904 () Bool)

(assert (=> start!16342 (and (inv!12 b2!98) e!53904)))

(assert (=> start!16342 true))

(declare-fun b!81855 () Bool)

(declare-fun res!67509 () Bool)

(assert (=> b!81855 (=> (not res!67509) (not e!53905))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!81855 (= res!67509 (validate_offset_bits!1 ((_ sign_extend 32) (size!1675 (buf!2065 b1!98))) ((_ sign_extend 32) (currentByte!4005 b1!98)) ((_ sign_extend 32) (currentBit!4000 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!81858 () Bool)

(assert (=> b!81858 (= e!53904 (array_inv!1521 (buf!2065 b2!98)))))

(declare-fun b!81856 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!81856 (= e!53905 (not (invariant!0 (currentBit!4000 b2!98) (currentByte!4005 b2!98) (size!1675 (buf!2065 b2!98)))))))

(assert (= (and start!16342 res!67510) b!81855))

(assert (= (and b!81855 res!67509) b!81856))

(assert (= start!16342 b!81857))

(assert (= start!16342 b!81858))

(declare-fun m!128247 () Bool)

(assert (=> b!81855 m!128247))

(declare-fun m!128249 () Bool)

(assert (=> b!81856 m!128249))

(declare-fun m!128251 () Bool)

(assert (=> start!16342 m!128251))

(declare-fun m!128253 () Bool)

(assert (=> start!16342 m!128253))

(declare-fun m!128255 () Bool)

(assert (=> b!81858 m!128255))

(declare-fun m!128257 () Bool)

(assert (=> b!81857 m!128257))

(push 1)

(assert (not b!81858))

(assert (not b!81856))

(assert (not b!81855))

(assert (not b!81857))

(assert (not start!16342))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

