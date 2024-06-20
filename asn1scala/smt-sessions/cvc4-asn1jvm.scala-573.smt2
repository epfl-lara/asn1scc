; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16372 () Bool)

(assert start!16372)

(declare-fun b!81899 () Bool)

(declare-fun res!67537 () Bool)

(declare-fun e!53957 () Bool)

(assert (=> b!81899 (=> (not res!67537) (not e!53957))))

(declare-datatypes ((array!3657 0))(
  ( (array!3658 (arr!2315 (Array (_ BitVec 32) (_ BitVec 8))) (size!1678 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2918 0))(
  ( (BitStream!2919 (buf!2068 array!3657) (currentByte!4014 (_ BitVec 32)) (currentBit!4009 (_ BitVec 32))) )
))
(declare-fun b1!98 () BitStream!2918)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!81899 (= res!67537 (validate_offset_bits!1 ((_ sign_extend 32) (size!1678 (buf!2068 b1!98))) ((_ sign_extend 32) (currentByte!4014 b1!98)) ((_ sign_extend 32) (currentBit!4009 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!81900 () Bool)

(declare-fun e!53959 () Bool)

(assert (=> b!81900 (= e!53959 (not (and (bvsle ((_ sign_extend 32) (size!1678 (buf!2068 b1!98))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4014 b1!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4009 b1!98)) #b0000000000000000000000000000000001111111111111111111111111111111))))))

(declare-fun lt!130224 () (_ BitVec 64))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!81900 (= (remainingBits!0 ((_ sign_extend 32) (size!1678 (buf!2068 b1!98))) ((_ sign_extend 32) (currentByte!4014 b1!98)) ((_ sign_extend 32) (currentBit!4009 b1!98))) (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1678 (buf!2068 b1!98)))) lt!130224))))

(declare-datatypes ((Unit!5465 0))(
  ( (Unit!5466) )
))
(declare-fun lt!130223 () Unit!5465)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!2918) Unit!5465)

(assert (=> b!81900 (= lt!130223 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun res!67536 () Bool)

(assert (=> start!16372 (=> (not res!67536) (not e!53957))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-fun b2!98 () BitStream!2918)

(assert (=> start!16372 (= res!67536 (and (= (size!1678 (buf!2068 b1!98)) (size!1678 (buf!2068 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16372 e!53957))

(declare-fun e!53961 () Bool)

(declare-fun inv!12 (BitStream!2918) Bool)

(assert (=> start!16372 (and (inv!12 b1!98) e!53961)))

(declare-fun e!53958 () Bool)

(assert (=> start!16372 (and (inv!12 b2!98) e!53958)))

(assert (=> start!16372 true))

(declare-fun b!81901 () Bool)

(declare-fun array_inv!1524 (array!3657) Bool)

(assert (=> b!81901 (= e!53958 (array_inv!1524 (buf!2068 b2!98)))))

(declare-fun b!81902 () Bool)

(assert (=> b!81902 (= e!53957 e!53959)))

(declare-fun res!67535 () Bool)

(assert (=> b!81902 (=> (not res!67535) (not e!53959))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!81902 (= res!67535 (= (bvadd lt!130224 b1b2Diff!1) (bitIndex!0 (size!1678 (buf!2068 b2!98)) (currentByte!4014 b2!98) (currentBit!4009 b2!98))))))

(assert (=> b!81902 (= lt!130224 (bitIndex!0 (size!1678 (buf!2068 b1!98)) (currentByte!4014 b1!98) (currentBit!4009 b1!98)))))

(declare-fun b!81903 () Bool)

(assert (=> b!81903 (= e!53961 (array_inv!1524 (buf!2068 b1!98)))))

(assert (= (and start!16372 res!67536) b!81899))

(assert (= (and b!81899 res!67537) b!81902))

(assert (= (and b!81902 res!67535) b!81900))

(assert (= start!16372 b!81903))

(assert (= start!16372 b!81901))

(declare-fun m!128307 () Bool)

(assert (=> b!81903 m!128307))

(declare-fun m!128309 () Bool)

(assert (=> start!16372 m!128309))

(declare-fun m!128311 () Bool)

(assert (=> start!16372 m!128311))

(declare-fun m!128313 () Bool)

(assert (=> b!81900 m!128313))

(declare-fun m!128315 () Bool)

(assert (=> b!81900 m!128315))

(declare-fun m!128317 () Bool)

(assert (=> b!81902 m!128317))

(declare-fun m!128319 () Bool)

(assert (=> b!81902 m!128319))

(declare-fun m!128321 () Bool)

(assert (=> b!81899 m!128321))

(declare-fun m!128323 () Bool)

(assert (=> b!81901 m!128323))

(push 1)

(assert (not b!81903))

(assert (not b!81900))

(assert (not b!81899))

(assert (not b!81902))

(assert (not start!16372))

(assert (not b!81901))

(check-sat)

(pop 1)

(push 1)

(check-sat)

