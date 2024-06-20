; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16922 () Bool)

(assert start!16922)

(declare-fun res!68367 () Bool)

(declare-fun e!55089 () Bool)

(assert (=> start!16922 (=> (not res!68367) (not e!55089))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-datatypes ((array!3786 0))(
  ( (array!3787 (arr!2363 (Array (_ BitVec 32) (_ BitVec 8))) (size!1726 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3014 0))(
  ( (BitStream!3015 (buf!2116 array!3786) (currentByte!4186 (_ BitVec 32)) (currentBit!4181 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!3014)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun b1!98 () BitStream!3014)

(assert (=> start!16922 (= res!68367 (and (= (size!1726 (buf!2116 b1!98)) (size!1726 (buf!2116 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16922 e!55089))

(declare-fun e!55090 () Bool)

(declare-fun inv!12 (BitStream!3014) Bool)

(assert (=> start!16922 (and (inv!12 b1!98) e!55090)))

(declare-fun e!55088 () Bool)

(assert (=> start!16922 (and (inv!12 b2!98) e!55088)))

(assert (=> start!16922 true))

(declare-fun b!83055 () Bool)

(declare-fun array_inv!1572 (array!3786) Bool)

(assert (=> b!83055 (= e!55088 (array_inv!1572 (buf!2116 b2!98)))))

(declare-fun b!83056 () Bool)

(declare-fun e!55087 () Bool)

(assert (=> b!83056 (= e!55087 (not true))))

(declare-fun lt!132363 () (_ BitVec 64))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!83056 (= (remainingBits!0 ((_ sign_extend 32) (size!1726 (buf!2116 b1!98))) ((_ sign_extend 32) (currentByte!4186 b1!98)) ((_ sign_extend 32) (currentBit!4181 b1!98))) (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1726 (buf!2116 b1!98)))) lt!132363))))

(declare-datatypes ((Unit!5561 0))(
  ( (Unit!5562) )
))
(declare-fun lt!132362 () Unit!5561)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!3014) Unit!5561)

(assert (=> b!83056 (= lt!132362 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!83057 () Bool)

(assert (=> b!83057 (= e!55089 e!55087)))

(declare-fun res!68368 () Bool)

(assert (=> b!83057 (=> (not res!68368) (not e!55087))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!83057 (= res!68368 (= (bvadd lt!132363 b1b2Diff!1) (bitIndex!0 (size!1726 (buf!2116 b2!98)) (currentByte!4186 b2!98) (currentBit!4181 b2!98))))))

(assert (=> b!83057 (= lt!132363 (bitIndex!0 (size!1726 (buf!2116 b1!98)) (currentByte!4186 b1!98) (currentBit!4181 b1!98)))))

(declare-fun b!83058 () Bool)

(declare-fun res!68366 () Bool)

(assert (=> b!83058 (=> (not res!68366) (not e!55089))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!83058 (= res!68366 (validate_offset_bits!1 ((_ sign_extend 32) (size!1726 (buf!2116 b1!98))) ((_ sign_extend 32) (currentByte!4186 b1!98)) ((_ sign_extend 32) (currentBit!4181 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!83059 () Bool)

(assert (=> b!83059 (= e!55090 (array_inv!1572 (buf!2116 b1!98)))))

(assert (= (and start!16922 res!68367) b!83058))

(assert (= (and b!83058 res!68366) b!83057))

(assert (= (and b!83057 res!68368) b!83056))

(assert (= start!16922 b!83059))

(assert (= start!16922 b!83055))

(declare-fun m!129591 () Bool)

(assert (=> b!83056 m!129591))

(declare-fun m!129593 () Bool)

(assert (=> b!83056 m!129593))

(declare-fun m!129595 () Bool)

(assert (=> b!83057 m!129595))

(declare-fun m!129597 () Bool)

(assert (=> b!83057 m!129597))

(declare-fun m!129599 () Bool)

(assert (=> b!83058 m!129599))

(declare-fun m!129601 () Bool)

(assert (=> b!83055 m!129601))

(declare-fun m!129603 () Bool)

(assert (=> b!83059 m!129603))

(declare-fun m!129605 () Bool)

(assert (=> start!16922 m!129605))

(declare-fun m!129607 () Bool)

(assert (=> start!16922 m!129607))

(push 1)

(assert (not b!83059))

(assert (not start!16922))

(assert (not b!83056))

(assert (not b!83055))

(assert (not b!83058))

(assert (not b!83057))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

