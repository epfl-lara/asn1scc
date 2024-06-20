; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17094 () Bool)

(assert start!17094)

(declare-fun b!83463 () Bool)

(declare-fun e!55503 () Bool)

(declare-datatypes ((array!3838 0))(
  ( (array!3839 (arr!2383 (Array (_ BitVec 32) (_ BitVec 8))) (size!1746 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3054 0))(
  ( (BitStream!3055 (buf!2136 array!3838) (currentByte!4239 (_ BitVec 32)) (currentBit!4234 (_ BitVec 32))) )
))
(declare-fun b1!98 () BitStream!3054)

(declare-fun lt!133062 () (_ BitVec 64))

(assert (=> b!83463 (= e!55503 (not (or (= ((_ sign_extend 32) (size!1746 (buf!2136 b1!98))) #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv lt!133062 ((_ sign_extend 32) (size!1746 (buf!2136 b1!98))))))))))

(declare-fun lt!133060 () (_ BitVec 64))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!83463 (= (remainingBits!0 ((_ sign_extend 32) (size!1746 (buf!2136 b1!98))) ((_ sign_extend 32) (currentByte!4239 b1!98)) ((_ sign_extend 32) (currentBit!4234 b1!98))) (bvsub lt!133062 lt!133060))))

(assert (=> b!83463 (= lt!133062 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1746 (buf!2136 b1!98)))))))

(declare-datatypes ((Unit!5595 0))(
  ( (Unit!5596) )
))
(declare-fun lt!133061 () Unit!5595)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!3054) Unit!5595)

(assert (=> b!83463 (= lt!133061 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun res!68647 () Bool)

(declare-fun e!55501 () Bool)

(assert (=> start!17094 (=> (not res!68647) (not e!55501))))

(declare-fun b2!98 () BitStream!3054)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(assert (=> start!17094 (= res!68647 (and (= (size!1746 (buf!2136 b1!98)) (size!1746 (buf!2136 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!17094 e!55501))

(declare-fun e!55506 () Bool)

(declare-fun inv!12 (BitStream!3054) Bool)

(assert (=> start!17094 (and (inv!12 b1!98) e!55506)))

(declare-fun e!55502 () Bool)

(assert (=> start!17094 (and (inv!12 b2!98) e!55502)))

(assert (=> start!17094 true))

(declare-fun b!83464 () Bool)

(declare-fun array_inv!1592 (array!3838) Bool)

(assert (=> b!83464 (= e!55502 (array_inv!1592 (buf!2136 b2!98)))))

(declare-fun b!83465 () Bool)

(assert (=> b!83465 (= e!55506 (array_inv!1592 (buf!2136 b1!98)))))

(declare-fun b!83466 () Bool)

(declare-fun res!68646 () Bool)

(assert (=> b!83466 (=> (not res!68646) (not e!55501))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!83466 (= res!68646 (validate_offset_bits!1 ((_ sign_extend 32) (size!1746 (buf!2136 b1!98))) ((_ sign_extend 32) (currentByte!4239 b1!98)) ((_ sign_extend 32) (currentBit!4234 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!83467 () Bool)

(assert (=> b!83467 (= e!55501 e!55503)))

(declare-fun res!68645 () Bool)

(assert (=> b!83467 (=> (not res!68645) (not e!55503))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!83467 (= res!68645 (= (bvadd lt!133060 b1b2Diff!1) (bitIndex!0 (size!1746 (buf!2136 b2!98)) (currentByte!4239 b2!98) (currentBit!4234 b2!98))))))

(assert (=> b!83467 (= lt!133060 (bitIndex!0 (size!1746 (buf!2136 b1!98)) (currentByte!4239 b1!98) (currentBit!4234 b1!98)))))

(assert (= (and start!17094 res!68647) b!83466))

(assert (= (and b!83466 res!68646) b!83467))

(assert (= (and b!83467 res!68645) b!83463))

(assert (= start!17094 b!83465))

(assert (= start!17094 b!83464))

(declare-fun m!130047 () Bool)

(assert (=> b!83465 m!130047))

(declare-fun m!130049 () Bool)

(assert (=> b!83463 m!130049))

(declare-fun m!130051 () Bool)

(assert (=> b!83463 m!130051))

(declare-fun m!130053 () Bool)

(assert (=> b!83466 m!130053))

(declare-fun m!130055 () Bool)

(assert (=> start!17094 m!130055))

(declare-fun m!130057 () Bool)

(assert (=> start!17094 m!130057))

(declare-fun m!130059 () Bool)

(assert (=> b!83467 m!130059))

(declare-fun m!130061 () Bool)

(assert (=> b!83467 m!130061))

(declare-fun m!130063 () Bool)

(assert (=> b!83464 m!130063))

(check-sat (not b!83463) (not b!83466) (not start!17094) (not b!83464) (not b!83467) (not b!83465))
(check-sat)
