; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16816 () Bool)

(assert start!16816)

(declare-fun b!82783 () Bool)

(declare-fun e!54812 () Bool)

(declare-fun e!54813 () Bool)

(assert (=> b!82783 (= e!54812 e!54813)))

(declare-fun res!68174 () Bool)

(assert (=> b!82783 (=> (not res!68174) (not e!54813))))

(declare-fun lt!131892 () (_ BitVec 64))

(declare-fun lt!131887 () (_ BitVec 64))

(assert (=> b!82783 (= res!68174 (= lt!131892 lt!131887))))

(declare-datatypes ((array!3756 0))(
  ( (array!3757 (arr!2351 (Array (_ BitVec 32) (_ BitVec 8))) (size!1714 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2990 0))(
  ( (BitStream!2991 (buf!2104 array!3756) (currentByte!4152 (_ BitVec 32)) (currentBit!4147 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!2990)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!82783 (= lt!131887 (bitIndex!0 (size!1714 (buf!2104 b2!98)) (currentByte!4152 b2!98) (currentBit!4147 b2!98)))))

(declare-fun lt!131889 () (_ BitVec 64))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(assert (=> b!82783 (= lt!131892 (bvadd lt!131889 b1b2Diff!1))))

(declare-fun b1!98 () BitStream!2990)

(assert (=> b!82783 (= lt!131889 (bitIndex!0 (size!1714 (buf!2104 b1!98)) (currentByte!4152 b1!98) (currentBit!4147 b1!98)))))

(declare-fun b!82784 () Bool)

(declare-fun e!54816 () Bool)

(assert (=> b!82784 (= e!54813 (not e!54816))))

(declare-fun res!68175 () Bool)

(assert (=> b!82784 (=> res!68175 e!54816)))

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun lt!131891 () (_ BitVec 64))

(assert (=> b!82784 (= res!68175 (bvsgt lt!131889 (bvsub lt!131891 b1ValidateOffsetBits!11)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!82784 (= (remainingBits!0 ((_ sign_extend 32) (size!1714 (buf!2104 b1!98))) ((_ sign_extend 32) (currentByte!4152 b1!98)) ((_ sign_extend 32) (currentBit!4147 b1!98))) (bvsub lt!131891 lt!131889))))

(assert (=> b!82784 (= lt!131891 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1714 (buf!2104 b1!98)))))))

(declare-datatypes ((Unit!5537 0))(
  ( (Unit!5538) )
))
(declare-fun lt!131886 () Unit!5537)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!2990) Unit!5537)

(assert (=> b!82784 (= lt!131886 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!82785 () Bool)

(declare-fun e!54814 () Bool)

(declare-fun array_inv!1560 (array!3756) Bool)

(assert (=> b!82785 (= e!54814 (array_inv!1560 (buf!2104 b1!98)))))

(declare-fun b!82786 () Bool)

(declare-fun e!54810 () Bool)

(assert (=> b!82786 (= e!54810 (array_inv!1560 (buf!2104 b2!98)))))

(declare-fun res!68173 () Bool)

(assert (=> start!16816 (=> (not res!68173) (not e!54812))))

(assert (=> start!16816 (= res!68173 (and (= (size!1714 (buf!2104 b1!98)) (size!1714 (buf!2104 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16816 e!54812))

(declare-fun inv!12 (BitStream!2990) Bool)

(assert (=> start!16816 (and (inv!12 b1!98) e!54814)))

(assert (=> start!16816 (and (inv!12 b2!98) e!54810)))

(assert (=> start!16816 true))

(declare-fun lt!131885 () (_ BitVec 64))

(declare-fun b!82787 () Bool)

(declare-fun lt!131890 () (_ BitVec 64))

(assert (=> b!82787 (= e!54816 (or (not (= lt!131885 (bvsub lt!131890 lt!131892))) (bvslt lt!131885 (bvsub b1ValidateOffsetBits!11 b1b2Diff!1)) (and (bvsle ((_ sign_extend 32) (size!1714 (buf!2104 b2!98))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4152 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4147 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111))))))

(assert (=> b!82787 (= lt!131885 (bvsub lt!131890 lt!131887))))

(assert (=> b!82787 (= lt!131885 (remainingBits!0 ((_ sign_extend 32) (size!1714 (buf!2104 b2!98))) ((_ sign_extend 32) (currentByte!4152 b2!98)) ((_ sign_extend 32) (currentBit!4147 b2!98))))))

(assert (=> b!82787 (= lt!131890 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1714 (buf!2104 b2!98)))))))

(declare-fun lt!131888 () Unit!5537)

(assert (=> b!82787 (= lt!131888 (remainingBitsBitIndexLemma!0 b2!98))))

(declare-fun b!82788 () Bool)

(declare-fun res!68176 () Bool)

(assert (=> b!82788 (=> (not res!68176) (not e!54812))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!82788 (= res!68176 (validate_offset_bits!1 ((_ sign_extend 32) (size!1714 (buf!2104 b1!98))) ((_ sign_extend 32) (currentByte!4152 b1!98)) ((_ sign_extend 32) (currentBit!4147 b1!98)) b1ValidateOffsetBits!11))))

(assert (= (and start!16816 res!68173) b!82788))

(assert (= (and b!82788 res!68176) b!82783))

(assert (= (and b!82783 res!68174) b!82784))

(assert (= (and b!82784 (not res!68175)) b!82787))

(assert (= start!16816 b!82785))

(assert (= start!16816 b!82786))

(declare-fun m!129281 () Bool)

(assert (=> b!82783 m!129281))

(declare-fun m!129283 () Bool)

(assert (=> b!82783 m!129283))

(declare-fun m!129285 () Bool)

(assert (=> b!82787 m!129285))

(declare-fun m!129287 () Bool)

(assert (=> b!82787 m!129287))

(declare-fun m!129289 () Bool)

(assert (=> b!82785 m!129289))

(declare-fun m!129291 () Bool)

(assert (=> b!82784 m!129291))

(declare-fun m!129293 () Bool)

(assert (=> b!82784 m!129293))

(declare-fun m!129295 () Bool)

(assert (=> start!16816 m!129295))

(declare-fun m!129297 () Bool)

(assert (=> start!16816 m!129297))

(declare-fun m!129299 () Bool)

(assert (=> b!82788 m!129299))

(declare-fun m!129301 () Bool)

(assert (=> b!82786 m!129301))

(push 1)

(assert (not start!16816))

(assert (not b!82783))

(assert (not b!82787))

(assert (not b!82786))

(assert (not b!82785))

(assert (not b!82784))

(assert (not b!82788))

(check-sat)

(pop 1)

(push 1)

(check-sat)

