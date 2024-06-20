; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17144 () Bool)

(assert start!17144)

(declare-fun b!83603 () Bool)

(declare-fun e!55647 () Bool)

(declare-datatypes ((array!3855 0))(
  ( (array!3856 (arr!2390 (Array (_ BitVec 32) (_ BitVec 8))) (size!1753 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3068 0))(
  ( (BitStream!3069 (buf!2143 array!3855) (currentByte!4255 (_ BitVec 32)) (currentBit!4250 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!3068)

(declare-fun array_inv!1599 (array!3855) Bool)

(assert (=> b!83603 (= e!55647 (array_inv!1599 (buf!2143 b2!98)))))

(declare-fun b!83604 () Bool)

(declare-fun res!68743 () Bool)

(declare-fun e!55649 () Bool)

(assert (=> b!83604 (=> (not res!68743) (not e!55649))))

(declare-fun b1!98 () BitStream!3068)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!83604 (= res!68743 (validate_offset_bits!1 ((_ sign_extend 32) (size!1753 (buf!2143 b1!98))) ((_ sign_extend 32) (currentByte!4255 b1!98)) ((_ sign_extend 32) (currentBit!4250 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!83605 () Bool)

(declare-fun e!55648 () Bool)

(declare-fun e!55651 () Bool)

(assert (=> b!83605 (= e!55648 (not e!55651))))

(declare-fun res!68740 () Bool)

(assert (=> b!83605 (=> res!68740 e!55651)))

(declare-fun lt!133277 () (_ BitVec 64))

(declare-fun lt!133274 () (_ BitVec 64))

(assert (=> b!83605 (= res!68740 (bvsgt lt!133274 (bvsub lt!133277 b1ValidateOffsetBits!11)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!83605 (= (remainingBits!0 ((_ sign_extend 32) (size!1753 (buf!2143 b1!98))) ((_ sign_extend 32) (currentByte!4255 b1!98)) ((_ sign_extend 32) (currentBit!4250 b1!98))) (bvsub lt!133277 lt!133274))))

(assert (=> b!83605 (= lt!133277 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1753 (buf!2143 b1!98)))))))

(declare-datatypes ((Unit!5609 0))(
  ( (Unit!5610) )
))
(declare-fun lt!133278 () Unit!5609)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!3068) Unit!5609)

(assert (=> b!83605 (= lt!133278 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!83606 () Bool)

(declare-fun lt!133273 () (_ BitVec 64))

(assert (=> b!83606 (= e!55651 (or (= ((_ sign_extend 32) (size!1753 (buf!2143 b2!98))) #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv lt!133273 ((_ sign_extend 32) (size!1753 (buf!2143 b2!98)))))))))

(declare-fun lt!133276 () (_ BitVec 64))

(assert (=> b!83606 (= (remainingBits!0 ((_ sign_extend 32) (size!1753 (buf!2143 b2!98))) ((_ sign_extend 32) (currentByte!4255 b2!98)) ((_ sign_extend 32) (currentBit!4250 b2!98))) (bvsub lt!133273 lt!133276))))

(assert (=> b!83606 (= lt!133273 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1753 (buf!2143 b2!98)))))))

(declare-fun lt!133275 () Unit!5609)

(assert (=> b!83606 (= lt!133275 (remainingBitsBitIndexLemma!0 b2!98))))

(declare-fun res!68742 () Bool)

(assert (=> start!17144 (=> (not res!68742) (not e!55649))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(assert (=> start!17144 (= res!68742 (and (= (size!1753 (buf!2143 b1!98)) (size!1753 (buf!2143 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!17144 e!55649))

(declare-fun e!55650 () Bool)

(declare-fun inv!12 (BitStream!3068) Bool)

(assert (=> start!17144 (and (inv!12 b1!98) e!55650)))

(assert (=> start!17144 (and (inv!12 b2!98) e!55647)))

(assert (=> start!17144 true))

(declare-fun b!83607 () Bool)

(assert (=> b!83607 (= e!55650 (array_inv!1599 (buf!2143 b1!98)))))

(declare-fun b!83608 () Bool)

(assert (=> b!83608 (= e!55649 e!55648)))

(declare-fun res!68741 () Bool)

(assert (=> b!83608 (=> (not res!68741) (not e!55648))))

(assert (=> b!83608 (= res!68741 (= (bvadd lt!133274 b1b2Diff!1) lt!133276))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!83608 (= lt!133276 (bitIndex!0 (size!1753 (buf!2143 b2!98)) (currentByte!4255 b2!98) (currentBit!4250 b2!98)))))

(assert (=> b!83608 (= lt!133274 (bitIndex!0 (size!1753 (buf!2143 b1!98)) (currentByte!4255 b1!98) (currentBit!4250 b1!98)))))

(assert (= (and start!17144 res!68742) b!83604))

(assert (= (and b!83604 res!68743) b!83608))

(assert (= (and b!83608 res!68741) b!83605))

(assert (= (and b!83605 (not res!68740)) b!83606))

(assert (= start!17144 b!83607))

(assert (= start!17144 b!83603))

(declare-fun m!130205 () Bool)

(assert (=> b!83604 m!130205))

(declare-fun m!130207 () Bool)

(assert (=> b!83606 m!130207))

(declare-fun m!130209 () Bool)

(assert (=> b!83606 m!130209))

(declare-fun m!130211 () Bool)

(assert (=> b!83608 m!130211))

(declare-fun m!130213 () Bool)

(assert (=> b!83608 m!130213))

(declare-fun m!130215 () Bool)

(assert (=> b!83605 m!130215))

(declare-fun m!130217 () Bool)

(assert (=> b!83605 m!130217))

(declare-fun m!130219 () Bool)

(assert (=> b!83603 m!130219))

(declare-fun m!130221 () Bool)

(assert (=> start!17144 m!130221))

(declare-fun m!130223 () Bool)

(assert (=> start!17144 m!130223))

(declare-fun m!130225 () Bool)

(assert (=> b!83607 m!130225))

(push 1)

(assert (not b!83607))

(assert (not b!83603))

(assert (not start!17144))

(assert (not b!83608))

(assert (not b!83604))

(assert (not b!83606))

(assert (not b!83605))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

