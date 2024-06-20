; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16968 () Bool)

(assert start!16968)

(declare-fun b!83162 () Bool)

(declare-fun res!68443 () Bool)

(declare-fun e!55196 () Bool)

(assert (=> b!83162 (=> (not res!68443) (not e!55196))))

(declare-datatypes ((array!3799 0))(
  ( (array!3800 (arr!2368 (Array (_ BitVec 32) (_ BitVec 8))) (size!1731 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3024 0))(
  ( (BitStream!3025 (buf!2121 array!3799) (currentByte!4200 (_ BitVec 32)) (currentBit!4195 (_ BitVec 32))) )
))
(declare-fun b1!98 () BitStream!3024)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!83162 (= res!68443 (validate_offset_bits!1 ((_ sign_extend 32) (size!1731 (buf!2121 b1!98))) ((_ sign_extend 32) (currentByte!4200 b1!98)) ((_ sign_extend 32) (currentBit!4195 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun lt!132555 () (_ BitVec 64))

(declare-fun lt!132553 () (_ BitVec 64))

(declare-fun e!55195 () Bool)

(declare-fun b!83163 () Bool)

(declare-fun lt!132554 () (_ BitVec 64))

(assert (=> b!83163 (= e!55195 (= lt!132554 (bvsub lt!132555 lt!132553)))))

(declare-fun lt!132548 () (_ BitVec 64))

(assert (=> b!83163 (= lt!132554 (bvsub lt!132555 lt!132548))))

(declare-fun b2!98 () BitStream!3024)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!83163 (= lt!132554 (remainingBits!0 ((_ sign_extend 32) (size!1731 (buf!2121 b2!98))) ((_ sign_extend 32) (currentByte!4200 b2!98)) ((_ sign_extend 32) (currentBit!4195 b2!98))))))

(assert (=> b!83163 (= lt!132555 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1731 (buf!2121 b2!98)))))))

(declare-datatypes ((Unit!5571 0))(
  ( (Unit!5572) )
))
(declare-fun lt!132551 () Unit!5571)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!3024) Unit!5571)

(assert (=> b!83163 (= lt!132551 (remainingBitsBitIndexLemma!0 b2!98))))

(declare-fun b!83164 () Bool)

(declare-fun e!55198 () Bool)

(declare-fun array_inv!1577 (array!3799) Bool)

(assert (=> b!83164 (= e!55198 (array_inv!1577 (buf!2121 b2!98)))))

(declare-fun res!68441 () Bool)

(assert (=> start!16968 (=> (not res!68441) (not e!55196))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(assert (=> start!16968 (= res!68441 (and (= (size!1731 (buf!2121 b1!98)) (size!1731 (buf!2121 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16968 e!55196))

(declare-fun e!55199 () Bool)

(declare-fun inv!12 (BitStream!3024) Bool)

(assert (=> start!16968 (and (inv!12 b1!98) e!55199)))

(assert (=> start!16968 (and (inv!12 b2!98) e!55198)))

(assert (=> start!16968 true))

(declare-fun b!83165 () Bool)

(declare-fun e!55197 () Bool)

(assert (=> b!83165 (= e!55197 (not e!55195))))

(declare-fun res!68442 () Bool)

(assert (=> b!83165 (=> res!68442 e!55195)))

(declare-fun lt!132549 () (_ BitVec 64))

(declare-fun lt!132552 () (_ BitVec 64))

(assert (=> b!83165 (= res!68442 (bvsgt lt!132549 (bvsub lt!132552 b1ValidateOffsetBits!11)))))

(assert (=> b!83165 (= (remainingBits!0 ((_ sign_extend 32) (size!1731 (buf!2121 b1!98))) ((_ sign_extend 32) (currentByte!4200 b1!98)) ((_ sign_extend 32) (currentBit!4195 b1!98))) (bvsub lt!132552 lt!132549))))

(assert (=> b!83165 (= lt!132552 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1731 (buf!2121 b1!98)))))))

(declare-fun lt!132550 () Unit!5571)

(assert (=> b!83165 (= lt!132550 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!83166 () Bool)

(assert (=> b!83166 (= e!55196 e!55197)))

(declare-fun res!68440 () Bool)

(assert (=> b!83166 (=> (not res!68440) (not e!55197))))

(assert (=> b!83166 (= res!68440 (= lt!132553 lt!132548))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!83166 (= lt!132548 (bitIndex!0 (size!1731 (buf!2121 b2!98)) (currentByte!4200 b2!98) (currentBit!4195 b2!98)))))

(assert (=> b!83166 (= lt!132553 (bvadd lt!132549 b1b2Diff!1))))

(assert (=> b!83166 (= lt!132549 (bitIndex!0 (size!1731 (buf!2121 b1!98)) (currentByte!4200 b1!98) (currentBit!4195 b1!98)))))

(declare-fun b!83167 () Bool)

(assert (=> b!83167 (= e!55199 (array_inv!1577 (buf!2121 b1!98)))))

(assert (= (and start!16968 res!68441) b!83162))

(assert (= (and b!83162 res!68443) b!83166))

(assert (= (and b!83166 res!68440) b!83165))

(assert (= (and b!83165 (not res!68442)) b!83163))

(assert (= start!16968 b!83167))

(assert (= start!16968 b!83164))

(declare-fun m!129709 () Bool)

(assert (=> b!83163 m!129709))

(declare-fun m!129711 () Bool)

(assert (=> b!83163 m!129711))

(declare-fun m!129713 () Bool)

(assert (=> b!83167 m!129713))

(declare-fun m!129715 () Bool)

(assert (=> b!83166 m!129715))

(declare-fun m!129717 () Bool)

(assert (=> b!83166 m!129717))

(declare-fun m!129719 () Bool)

(assert (=> start!16968 m!129719))

(declare-fun m!129721 () Bool)

(assert (=> start!16968 m!129721))

(declare-fun m!129723 () Bool)

(assert (=> b!83162 m!129723))

(declare-fun m!129725 () Bool)

(assert (=> b!83165 m!129725))

(declare-fun m!129727 () Bool)

(assert (=> b!83165 m!129727))

(declare-fun m!129729 () Bool)

(assert (=> b!83164 m!129729))

(check-sat (not b!83165) (not b!83166) (not start!16968) (not b!83162) (not b!83164) (not b!83167) (not b!83163))
(check-sat)
