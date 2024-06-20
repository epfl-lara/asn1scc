; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17046 () Bool)

(assert start!17046)

(declare-fun b!83346 () Bool)

(declare-fun e!55386 () Bool)

(declare-datatypes ((array!3823 0))(
  ( (array!3824 (arr!2377 (Array (_ BitVec 32) (_ BitVec 8))) (size!1740 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3042 0))(
  ( (BitStream!3043 (buf!2130 array!3823) (currentByte!4224 (_ BitVec 32)) (currentBit!4219 (_ BitVec 32))) )
))
(declare-fun b1!98 () BitStream!3042)

(declare-fun lt!132873 () (_ BitVec 64))

(assert (=> b!83346 (= e!55386 (not (or (= ((_ sign_extend 32) (size!1740 (buf!2130 b1!98))) #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv lt!132873 ((_ sign_extend 32) (size!1740 (buf!2130 b1!98))))))))))

(declare-fun lt!132871 () (_ BitVec 64))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!83346 (= (remainingBits!0 ((_ sign_extend 32) (size!1740 (buf!2130 b1!98))) ((_ sign_extend 32) (currentByte!4224 b1!98)) ((_ sign_extend 32) (currentBit!4219 b1!98))) (bvsub lt!132873 lt!132871))))

(assert (=> b!83346 (= lt!132873 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1740 (buf!2130 b1!98)))))))

(declare-datatypes ((Unit!5583 0))(
  ( (Unit!5584) )
))
(declare-fun lt!132872 () Unit!5583)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!3042) Unit!5583)

(assert (=> b!83346 (= lt!132872 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!83347 () Bool)

(declare-fun e!55384 () Bool)

(declare-fun array_inv!1586 (array!3823) Bool)

(assert (=> b!83347 (= e!55384 (array_inv!1586 (buf!2130 b1!98)))))

(declare-fun b!83348 () Bool)

(declare-fun res!68567 () Bool)

(declare-fun e!55382 () Bool)

(assert (=> b!83348 (=> (not res!68567) (not e!55382))))

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!83348 (= res!68567 (validate_offset_bits!1 ((_ sign_extend 32) (size!1740 (buf!2130 b1!98))) ((_ sign_extend 32) (currentByte!4224 b1!98)) ((_ sign_extend 32) (currentBit!4219 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!83349 () Bool)

(assert (=> b!83349 (= e!55382 e!55386)))

(declare-fun res!68569 () Bool)

(assert (=> b!83349 (=> (not res!68569) (not e!55386))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-fun b2!98 () BitStream!3042)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!83349 (= res!68569 (= (bvadd lt!132871 b1b2Diff!1) (bitIndex!0 (size!1740 (buf!2130 b2!98)) (currentByte!4224 b2!98) (currentBit!4219 b2!98))))))

(assert (=> b!83349 (= lt!132871 (bitIndex!0 (size!1740 (buf!2130 b1!98)) (currentByte!4224 b1!98) (currentBit!4219 b1!98)))))

(declare-fun b!83350 () Bool)

(declare-fun e!55385 () Bool)

(assert (=> b!83350 (= e!55385 (array_inv!1586 (buf!2130 b2!98)))))

(declare-fun res!68568 () Bool)

(assert (=> start!17046 (=> (not res!68568) (not e!55382))))

(assert (=> start!17046 (= res!68568 (and (= (size!1740 (buf!2130 b1!98)) (size!1740 (buf!2130 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!17046 e!55382))

(declare-fun inv!12 (BitStream!3042) Bool)

(assert (=> start!17046 (and (inv!12 b1!98) e!55384)))

(assert (=> start!17046 (and (inv!12 b2!98) e!55385)))

(assert (=> start!17046 true))

(assert (= (and start!17046 res!68568) b!83348))

(assert (= (and b!83348 res!68567) b!83349))

(assert (= (and b!83349 res!68569) b!83346))

(assert (= start!17046 b!83347))

(assert (= start!17046 b!83350))

(declare-fun m!129915 () Bool)

(assert (=> start!17046 m!129915))

(declare-fun m!129917 () Bool)

(assert (=> start!17046 m!129917))

(declare-fun m!129919 () Bool)

(assert (=> b!83348 m!129919))

(declare-fun m!129921 () Bool)

(assert (=> b!83349 m!129921))

(declare-fun m!129923 () Bool)

(assert (=> b!83349 m!129923))

(declare-fun m!129925 () Bool)

(assert (=> b!83347 m!129925))

(declare-fun m!129927 () Bool)

(assert (=> b!83350 m!129927))

(declare-fun m!129929 () Bool)

(assert (=> b!83346 m!129929))

(declare-fun m!129931 () Bool)

(assert (=> b!83346 m!129931))

(check-sat (not b!83348) (not b!83350) (not b!83346) (not b!83349) (not b!83347) (not start!17046))
(check-sat)
