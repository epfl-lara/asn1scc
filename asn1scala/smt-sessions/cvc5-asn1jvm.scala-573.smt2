; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16368 () Bool)

(assert start!16368)

(declare-fun b!81869 () Bool)

(declare-fun e!53924 () Bool)

(declare-fun e!53922 () Bool)

(assert (=> b!81869 (= e!53924 e!53922)))

(declare-fun res!67519 () Bool)

(assert (=> b!81869 (=> (not res!67519) (not e!53922))))

(declare-fun lt!130212 () (_ BitVec 64))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-datatypes ((array!3653 0))(
  ( (array!3654 (arr!2313 (Array (_ BitVec 32) (_ BitVec 8))) (size!1676 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2914 0))(
  ( (BitStream!2915 (buf!2066 array!3653) (currentByte!4012 (_ BitVec 32)) (currentBit!4007 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!2914)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!81869 (= res!67519 (= (bvadd lt!130212 b1b2Diff!1) (bitIndex!0 (size!1676 (buf!2066 b2!98)) (currentByte!4012 b2!98) (currentBit!4007 b2!98))))))

(declare-fun b1!98 () BitStream!2914)

(assert (=> b!81869 (= lt!130212 (bitIndex!0 (size!1676 (buf!2066 b1!98)) (currentByte!4012 b1!98) (currentBit!4007 b1!98)))))

(declare-fun b!81870 () Bool)

(declare-fun res!67518 () Bool)

(assert (=> b!81870 (=> (not res!67518) (not e!53924))))

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!81870 (= res!67518 (validate_offset_bits!1 ((_ sign_extend 32) (size!1676 (buf!2066 b1!98))) ((_ sign_extend 32) (currentByte!4012 b1!98)) ((_ sign_extend 32) (currentBit!4007 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!81871 () Bool)

(assert (=> b!81871 (= e!53922 (not (and (bvsle ((_ sign_extend 32) (size!1676 (buf!2066 b1!98))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4012 b1!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4007 b1!98)) #b0000000000000000000000000000000001111111111111111111111111111111))))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!81871 (= (remainingBits!0 ((_ sign_extend 32) (size!1676 (buf!2066 b1!98))) ((_ sign_extend 32) (currentByte!4012 b1!98)) ((_ sign_extend 32) (currentBit!4007 b1!98))) (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1676 (buf!2066 b1!98)))) lt!130212))))

(declare-datatypes ((Unit!5461 0))(
  ( (Unit!5462) )
))
(declare-fun lt!130211 () Unit!5461)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!2914) Unit!5461)

(assert (=> b!81871 (= lt!130211 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun res!67517 () Bool)

(assert (=> start!16368 (=> (not res!67517) (not e!53924))))

(assert (=> start!16368 (= res!67517 (and (= (size!1676 (buf!2066 b1!98)) (size!1676 (buf!2066 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16368 e!53924))

(declare-fun e!53921 () Bool)

(declare-fun inv!12 (BitStream!2914) Bool)

(assert (=> start!16368 (and (inv!12 b1!98) e!53921)))

(declare-fun e!53925 () Bool)

(assert (=> start!16368 (and (inv!12 b2!98) e!53925)))

(assert (=> start!16368 true))

(declare-fun b!81872 () Bool)

(declare-fun array_inv!1522 (array!3653) Bool)

(assert (=> b!81872 (= e!53925 (array_inv!1522 (buf!2066 b2!98)))))

(declare-fun b!81873 () Bool)

(assert (=> b!81873 (= e!53921 (array_inv!1522 (buf!2066 b1!98)))))

(assert (= (and start!16368 res!67517) b!81870))

(assert (= (and b!81870 res!67518) b!81869))

(assert (= (and b!81869 res!67519) b!81871))

(assert (= start!16368 b!81873))

(assert (= start!16368 b!81872))

(declare-fun m!128271 () Bool)

(assert (=> b!81869 m!128271))

(declare-fun m!128273 () Bool)

(assert (=> b!81869 m!128273))

(declare-fun m!128275 () Bool)

(assert (=> b!81870 m!128275))

(declare-fun m!128277 () Bool)

(assert (=> b!81872 m!128277))

(declare-fun m!128279 () Bool)

(assert (=> b!81873 m!128279))

(declare-fun m!128281 () Bool)

(assert (=> start!16368 m!128281))

(declare-fun m!128283 () Bool)

(assert (=> start!16368 m!128283))

(declare-fun m!128285 () Bool)

(assert (=> b!81871 m!128285))

(declare-fun m!128287 () Bool)

(assert (=> b!81871 m!128287))

(push 1)

(assert (not b!81872))

(assert (not b!81871))

(assert (not start!16368))

(assert (not b!81870))

(assert (not b!81873))

(assert (not b!81869))

(check-sat)

(pop 1)

(push 1)

(check-sat)

