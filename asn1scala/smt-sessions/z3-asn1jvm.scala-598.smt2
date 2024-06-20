; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17142 () Bool)

(assert start!17142)

(declare-fun b!83585 () Bool)

(declare-fun e!55630 () Bool)

(declare-fun e!55628 () Bool)

(assert (=> b!83585 (= e!55630 (not e!55628))))

(declare-fun res!68728 () Bool)

(assert (=> b!83585 (=> res!68728 e!55628)))

(declare-fun lt!133259 () (_ BitVec 64))

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun lt!133256 () (_ BitVec 64))

(assert (=> b!83585 (= res!68728 (bvsgt lt!133259 (bvsub lt!133256 b1ValidateOffsetBits!11)))))

(declare-datatypes ((array!3853 0))(
  ( (array!3854 (arr!2389 (Array (_ BitVec 32) (_ BitVec 8))) (size!1752 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3066 0))(
  ( (BitStream!3067 (buf!2142 array!3853) (currentByte!4254 (_ BitVec 32)) (currentBit!4249 (_ BitVec 32))) )
))
(declare-fun b1!98 () BitStream!3066)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!83585 (= (remainingBits!0 ((_ sign_extend 32) (size!1752 (buf!2142 b1!98))) ((_ sign_extend 32) (currentByte!4254 b1!98)) ((_ sign_extend 32) (currentBit!4249 b1!98))) (bvsub lt!133256 lt!133259))))

(assert (=> b!83585 (= lt!133256 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1752 (buf!2142 b1!98)))))))

(declare-datatypes ((Unit!5607 0))(
  ( (Unit!5608) )
))
(declare-fun lt!133258 () Unit!5607)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!3066) Unit!5607)

(assert (=> b!83585 (= lt!133258 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!83586 () Bool)

(declare-fun e!55627 () Bool)

(declare-fun b2!98 () BitStream!3066)

(declare-fun array_inv!1598 (array!3853) Bool)

(assert (=> b!83586 (= e!55627 (array_inv!1598 (buf!2142 b2!98)))))

(declare-fun b!83587 () Bool)

(declare-fun lt!133257 () (_ BitVec 64))

(assert (=> b!83587 (= e!55628 (or (= ((_ sign_extend 32) (size!1752 (buf!2142 b2!98))) #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv lt!133257 ((_ sign_extend 32) (size!1752 (buf!2142 b2!98)))))))))

(declare-fun lt!133255 () (_ BitVec 64))

(assert (=> b!83587 (= (remainingBits!0 ((_ sign_extend 32) (size!1752 (buf!2142 b2!98))) ((_ sign_extend 32) (currentByte!4254 b2!98)) ((_ sign_extend 32) (currentBit!4249 b2!98))) (bvsub lt!133257 lt!133255))))

(assert (=> b!83587 (= lt!133257 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1752 (buf!2142 b2!98)))))))

(declare-fun lt!133260 () Unit!5607)

(assert (=> b!83587 (= lt!133260 (remainingBitsBitIndexLemma!0 b2!98))))

(declare-fun b!83588 () Bool)

(declare-fun res!68731 () Bool)

(declare-fun e!55631 () Bool)

(assert (=> b!83588 (=> (not res!68731) (not e!55631))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!83588 (= res!68731 (validate_offset_bits!1 ((_ sign_extend 32) (size!1752 (buf!2142 b1!98))) ((_ sign_extend 32) (currentByte!4254 b1!98)) ((_ sign_extend 32) (currentBit!4249 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!83589 () Bool)

(assert (=> b!83589 (= e!55631 e!55630)))

(declare-fun res!68730 () Bool)

(assert (=> b!83589 (=> (not res!68730) (not e!55630))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(assert (=> b!83589 (= res!68730 (= (bvadd lt!133259 b1b2Diff!1) lt!133255))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!83589 (= lt!133255 (bitIndex!0 (size!1752 (buf!2142 b2!98)) (currentByte!4254 b2!98) (currentBit!4249 b2!98)))))

(assert (=> b!83589 (= lt!133259 (bitIndex!0 (size!1752 (buf!2142 b1!98)) (currentByte!4254 b1!98) (currentBit!4249 b1!98)))))

(declare-fun res!68729 () Bool)

(assert (=> start!17142 (=> (not res!68729) (not e!55631))))

(assert (=> start!17142 (= res!68729 (and (= (size!1752 (buf!2142 b1!98)) (size!1752 (buf!2142 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!17142 e!55631))

(declare-fun e!55632 () Bool)

(declare-fun inv!12 (BitStream!3066) Bool)

(assert (=> start!17142 (and (inv!12 b1!98) e!55632)))

(assert (=> start!17142 (and (inv!12 b2!98) e!55627)))

(assert (=> start!17142 true))

(declare-fun b!83590 () Bool)

(assert (=> b!83590 (= e!55632 (array_inv!1598 (buf!2142 b1!98)))))

(assert (= (and start!17142 res!68729) b!83588))

(assert (= (and b!83588 res!68731) b!83589))

(assert (= (and b!83589 res!68730) b!83585))

(assert (= (and b!83585 (not res!68728)) b!83587))

(assert (= start!17142 b!83590))

(assert (= start!17142 b!83586))

(declare-fun m!130183 () Bool)

(assert (=> b!83585 m!130183))

(declare-fun m!130185 () Bool)

(assert (=> b!83585 m!130185))

(declare-fun m!130187 () Bool)

(assert (=> b!83588 m!130187))

(declare-fun m!130189 () Bool)

(assert (=> b!83587 m!130189))

(declare-fun m!130191 () Bool)

(assert (=> b!83587 m!130191))

(declare-fun m!130193 () Bool)

(assert (=> b!83589 m!130193))

(declare-fun m!130195 () Bool)

(assert (=> b!83589 m!130195))

(declare-fun m!130197 () Bool)

(assert (=> b!83590 m!130197))

(declare-fun m!130199 () Bool)

(assert (=> b!83586 m!130199))

(declare-fun m!130201 () Bool)

(assert (=> start!17142 m!130201))

(declare-fun m!130203 () Bool)

(assert (=> start!17142 m!130203))

(check-sat (not b!83587) (not b!83589) (not b!83588) (not start!17142) (not b!83586) (not b!83585) (not b!83590))
(check-sat)
