; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16568 () Bool)

(assert start!16568)

(declare-fun b!82250 () Bool)

(declare-fun e!54293 () Bool)

(declare-fun e!54294 () Bool)

(assert (=> b!82250 (= e!54293 e!54294)))

(declare-fun res!67785 () Bool)

(assert (=> b!82250 (=> (not res!67785) (not e!54294))))

(declare-fun lt!130806 () (_ BitVec 64))

(declare-fun lt!130809 () (_ BitVec 64))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(assert (=> b!82250 (= res!67785 (= (bvadd lt!130809 b1b2Diff!1) lt!130806))))

(declare-datatypes ((array!3699 0))(
  ( (array!3700 (arr!2330 (Array (_ BitVec 32) (_ BitVec 8))) (size!1693 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2948 0))(
  ( (BitStream!2949 (buf!2083 array!3699) (currentByte!4075 (_ BitVec 32)) (currentBit!4070 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!2948)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!82250 (= lt!130806 (bitIndex!0 (size!1693 (buf!2083 b2!98)) (currentByte!4075 b2!98) (currentBit!4070 b2!98)))))

(declare-fun b1!98 () BitStream!2948)

(assert (=> b!82250 (= lt!130809 (bitIndex!0 (size!1693 (buf!2083 b1!98)) (currentByte!4075 b1!98) (currentBit!4070 b1!98)))))

(declare-fun b!82251 () Bool)

(declare-fun e!54297 () Bool)

(declare-fun array_inv!1539 (array!3699) Bool)

(assert (=> b!82251 (= e!54297 (array_inv!1539 (buf!2083 b1!98)))))

(declare-fun b!82252 () Bool)

(declare-fun e!54291 () Bool)

(assert (=> b!82252 (= e!54291 (array_inv!1539 (buf!2083 b2!98)))))

(declare-fun b!82254 () Bool)

(declare-fun e!54296 () Bool)

(assert (=> b!82254 (= e!54294 (not e!54296))))

(declare-fun res!67783 () Bool)

(assert (=> b!82254 (=> res!67783 e!54296)))

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun lt!130808 () (_ BitVec 64))

(assert (=> b!82254 (= res!67783 (bvsgt lt!130809 (bvsub lt!130808 b1ValidateOffsetBits!11)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!82254 (= (remainingBits!0 ((_ sign_extend 32) (size!1693 (buf!2083 b1!98))) ((_ sign_extend 32) (currentByte!4075 b1!98)) ((_ sign_extend 32) (currentBit!4070 b1!98))) (bvsub lt!130808 lt!130809))))

(assert (=> b!82254 (= lt!130808 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1693 (buf!2083 b1!98)))))))

(declare-datatypes ((Unit!5495 0))(
  ( (Unit!5496) )
))
(declare-fun lt!130807 () Unit!5495)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!2948) Unit!5495)

(assert (=> b!82254 (= lt!130807 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!82255 () Bool)

(assert (=> b!82255 (= e!54296 (and (bvsle ((_ sign_extend 32) (size!1693 (buf!2083 b2!98))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4075 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4070 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> b!82255 (= (remainingBits!0 ((_ sign_extend 32) (size!1693 (buf!2083 b2!98))) ((_ sign_extend 32) (currentByte!4075 b2!98)) ((_ sign_extend 32) (currentBit!4070 b2!98))) (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1693 (buf!2083 b2!98)))) lt!130806))))

(declare-fun lt!130805 () Unit!5495)

(assert (=> b!82255 (= lt!130805 (remainingBitsBitIndexLemma!0 b2!98))))

(declare-fun b!82253 () Bool)

(declare-fun res!67784 () Bool)

(assert (=> b!82253 (=> (not res!67784) (not e!54293))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!82253 (= res!67784 (validate_offset_bits!1 ((_ sign_extend 32) (size!1693 (buf!2083 b1!98))) ((_ sign_extend 32) (currentByte!4075 b1!98)) ((_ sign_extend 32) (currentBit!4070 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun res!67786 () Bool)

(assert (=> start!16568 (=> (not res!67786) (not e!54293))))

(assert (=> start!16568 (= res!67786 (and (= (size!1693 (buf!2083 b1!98)) (size!1693 (buf!2083 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16568 e!54293))

(declare-fun inv!12 (BitStream!2948) Bool)

(assert (=> start!16568 (and (inv!12 b1!98) e!54297)))

(assert (=> start!16568 (and (inv!12 b2!98) e!54291)))

(assert (=> start!16568 true))

(assert (= (and start!16568 res!67786) b!82253))

(assert (= (and b!82253 res!67784) b!82250))

(assert (= (and b!82250 res!67785) b!82254))

(assert (= (and b!82254 (not res!67783)) b!82255))

(assert (= start!16568 b!82251))

(assert (= start!16568 b!82252))

(declare-fun m!128687 () Bool)

(assert (=> b!82254 m!128687))

(declare-fun m!128689 () Bool)

(assert (=> b!82254 m!128689))

(declare-fun m!128691 () Bool)

(assert (=> b!82253 m!128691))

(declare-fun m!128693 () Bool)

(assert (=> b!82250 m!128693))

(declare-fun m!128695 () Bool)

(assert (=> b!82250 m!128695))

(declare-fun m!128697 () Bool)

(assert (=> b!82255 m!128697))

(declare-fun m!128699 () Bool)

(assert (=> b!82255 m!128699))

(declare-fun m!128701 () Bool)

(assert (=> start!16568 m!128701))

(declare-fun m!128703 () Bool)

(assert (=> start!16568 m!128703))

(declare-fun m!128705 () Bool)

(assert (=> b!82251 m!128705))

(declare-fun m!128707 () Bool)

(assert (=> b!82252 m!128707))

(push 1)

(assert (not b!82251))

(assert (not start!16568))

(assert (not b!82254))

(assert (not b!82250))

(assert (not b!82253))

(assert (not b!82252))

(assert (not b!82255))

(check-sat)

(pop 1)

(push 1)

(check-sat)

