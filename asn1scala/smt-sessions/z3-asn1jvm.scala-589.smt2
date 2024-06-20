; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16920 () Bool)

(assert start!16920)

(declare-fun b!83040 () Bool)

(declare-fun e!55069 () Bool)

(assert (=> b!83040 (= e!55069 (not true))))

(declare-datatypes ((array!3784 0))(
  ( (array!3785 (arr!2362 (Array (_ BitVec 32) (_ BitVec 8))) (size!1725 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3012 0))(
  ( (BitStream!3013 (buf!2115 array!3784) (currentByte!4185 (_ BitVec 32)) (currentBit!4180 (_ BitVec 32))) )
))
(declare-fun b1!98 () BitStream!3012)

(declare-fun lt!132357 () (_ BitVec 64))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!83040 (= (remainingBits!0 ((_ sign_extend 32) (size!1725 (buf!2115 b1!98))) ((_ sign_extend 32) (currentByte!4185 b1!98)) ((_ sign_extend 32) (currentBit!4180 b1!98))) (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1725 (buf!2115 b1!98)))) lt!132357))))

(declare-datatypes ((Unit!5559 0))(
  ( (Unit!5560) )
))
(declare-fun lt!132356 () Unit!5559)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!3012) Unit!5559)

(assert (=> b!83040 (= lt!132356 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun res!68359 () Bool)

(declare-fun e!55072 () Bool)

(assert (=> start!16920 (=> (not res!68359) (not e!55072))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-fun b2!98 () BitStream!3012)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(assert (=> start!16920 (= res!68359 (and (= (size!1725 (buf!2115 b1!98)) (size!1725 (buf!2115 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16920 e!55072))

(declare-fun e!55073 () Bool)

(declare-fun inv!12 (BitStream!3012) Bool)

(assert (=> start!16920 (and (inv!12 b1!98) e!55073)))

(declare-fun e!55074 () Bool)

(assert (=> start!16920 (and (inv!12 b2!98) e!55074)))

(assert (=> start!16920 true))

(declare-fun b!83041 () Bool)

(assert (=> b!83041 (= e!55072 e!55069)))

(declare-fun res!68358 () Bool)

(assert (=> b!83041 (=> (not res!68358) (not e!55069))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!83041 (= res!68358 (= (bvadd lt!132357 b1b2Diff!1) (bitIndex!0 (size!1725 (buf!2115 b2!98)) (currentByte!4185 b2!98) (currentBit!4180 b2!98))))))

(assert (=> b!83041 (= lt!132357 (bitIndex!0 (size!1725 (buf!2115 b1!98)) (currentByte!4185 b1!98) (currentBit!4180 b1!98)))))

(declare-fun b!83042 () Bool)

(declare-fun array_inv!1571 (array!3784) Bool)

(assert (=> b!83042 (= e!55074 (array_inv!1571 (buf!2115 b2!98)))))

(declare-fun b!83043 () Bool)

(declare-fun res!68357 () Bool)

(assert (=> b!83043 (=> (not res!68357) (not e!55072))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!83043 (= res!68357 (validate_offset_bits!1 ((_ sign_extend 32) (size!1725 (buf!2115 b1!98))) ((_ sign_extend 32) (currentByte!4185 b1!98)) ((_ sign_extend 32) (currentBit!4180 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!83044 () Bool)

(assert (=> b!83044 (= e!55073 (array_inv!1571 (buf!2115 b1!98)))))

(assert (= (and start!16920 res!68359) b!83043))

(assert (= (and b!83043 res!68357) b!83041))

(assert (= (and b!83041 res!68358) b!83040))

(assert (= start!16920 b!83044))

(assert (= start!16920 b!83042))

(declare-fun m!129573 () Bool)

(assert (=> start!16920 m!129573))

(declare-fun m!129575 () Bool)

(assert (=> start!16920 m!129575))

(declare-fun m!129577 () Bool)

(assert (=> b!83040 m!129577))

(declare-fun m!129579 () Bool)

(assert (=> b!83040 m!129579))

(declare-fun m!129581 () Bool)

(assert (=> b!83041 m!129581))

(declare-fun m!129583 () Bool)

(assert (=> b!83041 m!129583))

(declare-fun m!129585 () Bool)

(assert (=> b!83043 m!129585))

(declare-fun m!129587 () Bool)

(assert (=> b!83044 m!129587))

(declare-fun m!129589 () Bool)

(assert (=> b!83042 m!129589))

(check-sat (not b!83044) (not start!16920) (not b!83043) (not b!83040) (not b!83041) (not b!83042))
