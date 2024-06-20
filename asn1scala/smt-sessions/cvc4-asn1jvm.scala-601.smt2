; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17234 () Bool)

(assert start!17234)

(declare-fun res!68898 () Bool)

(declare-fun e!55864 () Bool)

(assert (=> start!17234 (=> (not res!68898) (not e!55864))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-datatypes ((array!3879 0))(
  ( (array!3880 (arr!2399 (Array (_ BitVec 32) (_ BitVec 8))) (size!1762 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3086 0))(
  ( (BitStream!3087 (buf!2152 array!3879) (currentByte!4282 (_ BitVec 32)) (currentBit!4277 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!3086)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun b1!98 () BitStream!3086)

(assert (=> start!17234 (= res!68898 (and (= (size!1762 (buf!2152 b1!98)) (size!1762 (buf!2152 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!17234 e!55864))

(declare-fun e!55860 () Bool)

(declare-fun inv!12 (BitStream!3086) Bool)

(assert (=> start!17234 (and (inv!12 b1!98) e!55860)))

(declare-fun e!55866 () Bool)

(assert (=> start!17234 (and (inv!12 b2!98) e!55866)))

(assert (=> start!17234 true))

(declare-fun lt!133746 () (_ BitVec 64))

(declare-fun e!55863 () Bool)

(declare-fun lt!133748 () (_ BitVec 64))

(declare-fun b!83819 () Bool)

(declare-fun lt!133747 () (_ BitVec 64))

(assert (=> b!83819 (= e!55863 (or (not (= lt!133748 (bvsub lt!133746 lt!133747))) (= (bvand b1ValidateOffsetBits!11 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand b1b2Diff!1 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand b1ValidateOffsetBits!11 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub b1ValidateOffsetBits!11 b1b2Diff!1) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!133743 () (_ BitVec 64))

(assert (=> b!83819 (= lt!133748 (bvsub lt!133746 lt!133743))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!83819 (= lt!133748 (remainingBits!0 ((_ sign_extend 32) (size!1762 (buf!2152 b2!98))) ((_ sign_extend 32) (currentByte!4282 b2!98)) ((_ sign_extend 32) (currentBit!4277 b2!98))))))

(assert (=> b!83819 (= lt!133746 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1762 (buf!2152 b2!98)))))))

(declare-datatypes ((Unit!5627 0))(
  ( (Unit!5628) )
))
(declare-fun lt!133744 () Unit!5627)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!3086) Unit!5627)

(assert (=> b!83819 (= lt!133744 (remainingBitsBitIndexLemma!0 b2!98))))

(declare-fun b!83820 () Bool)

(declare-fun res!68896 () Bool)

(assert (=> b!83820 (=> (not res!68896) (not e!55864))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!83820 (= res!68896 (validate_offset_bits!1 ((_ sign_extend 32) (size!1762 (buf!2152 b1!98))) ((_ sign_extend 32) (currentByte!4282 b1!98)) ((_ sign_extend 32) (currentBit!4277 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!83821 () Bool)

(declare-fun e!55865 () Bool)

(assert (=> b!83821 (= e!55865 (not e!55863))))

(declare-fun res!68897 () Bool)

(assert (=> b!83821 (=> res!68897 e!55863)))

(declare-fun lt!133749 () (_ BitVec 64))

(declare-fun lt!133745 () (_ BitVec 64))

(assert (=> b!83821 (= res!68897 (bvsgt lt!133749 (bvsub lt!133745 b1ValidateOffsetBits!11)))))

(assert (=> b!83821 (= (remainingBits!0 ((_ sign_extend 32) (size!1762 (buf!2152 b1!98))) ((_ sign_extend 32) (currentByte!4282 b1!98)) ((_ sign_extend 32) (currentBit!4277 b1!98))) (bvsub lt!133745 lt!133749))))

(assert (=> b!83821 (= lt!133745 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1762 (buf!2152 b1!98)))))))

(declare-fun lt!133742 () Unit!5627)

(assert (=> b!83821 (= lt!133742 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!83822 () Bool)

(assert (=> b!83822 (= e!55864 e!55865)))

(declare-fun res!68899 () Bool)

(assert (=> b!83822 (=> (not res!68899) (not e!55865))))

(assert (=> b!83822 (= res!68899 (= lt!133747 lt!133743))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!83822 (= lt!133743 (bitIndex!0 (size!1762 (buf!2152 b2!98)) (currentByte!4282 b2!98) (currentBit!4277 b2!98)))))

(assert (=> b!83822 (= lt!133747 (bvadd lt!133749 b1b2Diff!1))))

(assert (=> b!83822 (= lt!133749 (bitIndex!0 (size!1762 (buf!2152 b1!98)) (currentByte!4282 b1!98) (currentBit!4277 b1!98)))))

(declare-fun b!83823 () Bool)

(declare-fun array_inv!1608 (array!3879) Bool)

(assert (=> b!83823 (= e!55866 (array_inv!1608 (buf!2152 b2!98)))))

(declare-fun b!83824 () Bool)

(assert (=> b!83824 (= e!55860 (array_inv!1608 (buf!2152 b1!98)))))

(assert (= (and start!17234 res!68898) b!83820))

(assert (= (and b!83820 res!68896) b!83822))

(assert (= (and b!83822 res!68899) b!83821))

(assert (= (and b!83821 (not res!68897)) b!83819))

(assert (= start!17234 b!83824))

(assert (= start!17234 b!83823))

(declare-fun m!130451 () Bool)

(assert (=> start!17234 m!130451))

(declare-fun m!130453 () Bool)

(assert (=> start!17234 m!130453))

(declare-fun m!130455 () Bool)

(assert (=> b!83819 m!130455))

(declare-fun m!130457 () Bool)

(assert (=> b!83819 m!130457))

(declare-fun m!130459 () Bool)

(assert (=> b!83820 m!130459))

(declare-fun m!130461 () Bool)

(assert (=> b!83822 m!130461))

(declare-fun m!130463 () Bool)

(assert (=> b!83822 m!130463))

(declare-fun m!130465 () Bool)

(assert (=> b!83823 m!130465))

(declare-fun m!130467 () Bool)

(assert (=> b!83821 m!130467))

(declare-fun m!130469 () Bool)

(assert (=> b!83821 m!130469))

(declare-fun m!130471 () Bool)

(assert (=> b!83824 m!130471))

(push 1)

(assert (not b!83820))

(assert (not b!83823))

(assert (not b!83822))

(assert (not start!17234))

(assert (not b!83821))

(assert (not b!83819))

(assert (not b!83824))

(check-sat)

(pop 1)

(push 1)

(check-sat)

