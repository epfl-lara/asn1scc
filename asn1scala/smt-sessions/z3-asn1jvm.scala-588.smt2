; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16914 () Bool)

(assert start!16914)

(declare-fun b!82991 () Bool)

(declare-fun res!68326 () Bool)

(declare-fun e!55013 () Bool)

(assert (=> b!82991 (=> (not res!68326) (not e!55013))))

(declare-datatypes ((array!3778 0))(
  ( (array!3779 (arr!2359 (Array (_ BitVec 32) (_ BitVec 8))) (size!1722 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3006 0))(
  ( (BitStream!3007 (buf!2112 array!3778) (currentByte!4182 (_ BitVec 32)) (currentBit!4177 (_ BitVec 32))) )
))
(declare-fun b1!98 () BitStream!3006)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!82991 (= res!68326 (validate_offset_bits!1 ((_ sign_extend 32) (size!1722 (buf!2112 b1!98))) ((_ sign_extend 32) (currentByte!4182 b1!98)) ((_ sign_extend 32) (currentBit!4177 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun res!68329 () Bool)

(assert (=> start!16914 (=> (not res!68329) (not e!55013))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-fun b2!98 () BitStream!3006)

(assert (=> start!16914 (= res!68329 (and (= (size!1722 (buf!2112 b1!98)) (size!1722 (buf!2112 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16914 e!55013))

(declare-fun e!55015 () Bool)

(declare-fun inv!12 (BitStream!3006) Bool)

(assert (=> start!16914 (and (inv!12 b1!98) e!55015)))

(declare-fun e!55012 () Bool)

(assert (=> start!16914 (and (inv!12 b2!98) e!55012)))

(assert (=> start!16914 true))

(declare-fun b!82992 () Bool)

(declare-fun e!55011 () Bool)

(declare-fun e!55016 () Bool)

(assert (=> b!82992 (= e!55011 (not e!55016))))

(declare-fun res!68327 () Bool)

(assert (=> b!82992 (=> res!68327 e!55016)))

(declare-fun lt!132326 () (_ BitVec 64))

(declare-fun lt!132330 () (_ BitVec 64))

(assert (=> b!82992 (= res!68327 (bvsgt lt!132330 (bvsub lt!132326 b1ValidateOffsetBits!11)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!82992 (= (remainingBits!0 ((_ sign_extend 32) (size!1722 (buf!2112 b1!98))) ((_ sign_extend 32) (currentByte!4182 b1!98)) ((_ sign_extend 32) (currentBit!4177 b1!98))) (bvsub lt!132326 lt!132330))))

(assert (=> b!82992 (= lt!132326 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1722 (buf!2112 b1!98)))))))

(declare-datatypes ((Unit!5553 0))(
  ( (Unit!5554) )
))
(declare-fun lt!132329 () Unit!5553)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!3006) Unit!5553)

(assert (=> b!82992 (= lt!132329 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!82993 () Bool)

(assert (=> b!82993 (= e!55016 true)))

(declare-fun lt!132328 () (_ BitVec 64))

(assert (=> b!82993 (= (remainingBits!0 ((_ sign_extend 32) (size!1722 (buf!2112 b2!98))) ((_ sign_extend 32) (currentByte!4182 b2!98)) ((_ sign_extend 32) (currentBit!4177 b2!98))) (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1722 (buf!2112 b2!98)))) lt!132328))))

(declare-fun lt!132327 () Unit!5553)

(assert (=> b!82993 (= lt!132327 (remainingBitsBitIndexLemma!0 b2!98))))

(declare-fun b!82994 () Bool)

(assert (=> b!82994 (= e!55013 e!55011)))

(declare-fun res!68328 () Bool)

(assert (=> b!82994 (=> (not res!68328) (not e!55011))))

(assert (=> b!82994 (= res!68328 (= (bvadd lt!132330 b1b2Diff!1) lt!132328))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!82994 (= lt!132328 (bitIndex!0 (size!1722 (buf!2112 b2!98)) (currentByte!4182 b2!98) (currentBit!4177 b2!98)))))

(assert (=> b!82994 (= lt!132330 (bitIndex!0 (size!1722 (buf!2112 b1!98)) (currentByte!4182 b1!98) (currentBit!4177 b1!98)))))

(declare-fun b!82995 () Bool)

(declare-fun array_inv!1568 (array!3778) Bool)

(assert (=> b!82995 (= e!55012 (array_inv!1568 (buf!2112 b2!98)))))

(declare-fun b!82996 () Bool)

(assert (=> b!82996 (= e!55015 (array_inv!1568 (buf!2112 b1!98)))))

(assert (= (and start!16914 res!68329) b!82991))

(assert (= (and b!82991 res!68326) b!82994))

(assert (= (and b!82994 res!68328) b!82992))

(assert (= (and b!82992 (not res!68327)) b!82993))

(assert (= start!16914 b!82996))

(assert (= start!16914 b!82995))

(declare-fun m!129511 () Bool)

(assert (=> b!82993 m!129511))

(declare-fun m!129513 () Bool)

(assert (=> b!82993 m!129513))

(declare-fun m!129515 () Bool)

(assert (=> b!82994 m!129515))

(declare-fun m!129517 () Bool)

(assert (=> b!82994 m!129517))

(declare-fun m!129519 () Bool)

(assert (=> b!82995 m!129519))

(declare-fun m!129521 () Bool)

(assert (=> b!82996 m!129521))

(declare-fun m!129523 () Bool)

(assert (=> start!16914 m!129523))

(declare-fun m!129525 () Bool)

(assert (=> start!16914 m!129525))

(declare-fun m!129527 () Bool)

(assert (=> b!82991 m!129527))

(declare-fun m!129529 () Bool)

(assert (=> b!82992 m!129529))

(declare-fun m!129531 () Bool)

(assert (=> b!82992 m!129531))

(check-sat (not b!82995) (not b!82991) (not start!16914) (not b!82994) (not b!82996) (not b!82993) (not b!82992))
