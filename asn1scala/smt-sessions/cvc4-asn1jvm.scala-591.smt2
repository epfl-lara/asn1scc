; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16970 () Bool)

(assert start!16970)

(declare-fun b!83181 () Bool)

(declare-fun res!68453 () Bool)

(declare-fun e!55216 () Bool)

(assert (=> b!83181 (=> (not res!68453) (not e!55216))))

(declare-datatypes ((array!3801 0))(
  ( (array!3802 (arr!2369 (Array (_ BitVec 32) (_ BitVec 8))) (size!1732 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3026 0))(
  ( (BitStream!3027 (buf!2122 array!3801) (currentByte!4201 (_ BitVec 32)) (currentBit!4196 (_ BitVec 32))) )
))
(declare-fun b1!98 () BitStream!3026)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!83181 (= res!68453 (validate_offset_bits!1 ((_ sign_extend 32) (size!1732 (buf!2122 b1!98))) ((_ sign_extend 32) (currentByte!4201 b1!98)) ((_ sign_extend 32) (currentBit!4196 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!83182 () Bool)

(declare-fun e!55219 () Bool)

(declare-fun e!55215 () Bool)

(assert (=> b!83182 (= e!55219 (not e!55215))))

(declare-fun res!68454 () Bool)

(assert (=> b!83182 (=> res!68454 e!55215)))

(declare-fun lt!132579 () (_ BitVec 64))

(declare-fun lt!132573 () (_ BitVec 64))

(assert (=> b!83182 (= res!68454 (bvsgt lt!132579 (bvsub lt!132573 b1ValidateOffsetBits!11)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!83182 (= (remainingBits!0 ((_ sign_extend 32) (size!1732 (buf!2122 b1!98))) ((_ sign_extend 32) (currentByte!4201 b1!98)) ((_ sign_extend 32) (currentBit!4196 b1!98))) (bvsub lt!132573 lt!132579))))

(assert (=> b!83182 (= lt!132573 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1732 (buf!2122 b1!98)))))))

(declare-datatypes ((Unit!5573 0))(
  ( (Unit!5574) )
))
(declare-fun lt!132572 () Unit!5573)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!3026) Unit!5573)

(assert (=> b!83182 (= lt!132572 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!83183 () Bool)

(declare-fun e!55218 () Bool)

(declare-fun array_inv!1578 (array!3801) Bool)

(assert (=> b!83183 (= e!55218 (array_inv!1578 (buf!2122 b1!98)))))

(declare-fun res!68452 () Bool)

(assert (=> start!16970 (=> (not res!68452) (not e!55216))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-fun b2!98 () BitStream!3026)

(assert (=> start!16970 (= res!68452 (and (= (size!1732 (buf!2122 b1!98)) (size!1732 (buf!2122 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16970 e!55216))

(declare-fun inv!12 (BitStream!3026) Bool)

(assert (=> start!16970 (and (inv!12 b1!98) e!55218)))

(declare-fun e!55220 () Bool)

(assert (=> start!16970 (and (inv!12 b2!98) e!55220)))

(assert (=> start!16970 true))

(declare-fun b!83180 () Bool)

(declare-fun lt!132577 () (_ BitVec 64))

(declare-fun lt!132574 () (_ BitVec 64))

(declare-fun lt!132578 () (_ BitVec 64))

(assert (=> b!83180 (= e!55215 (= lt!132577 (bvsub lt!132578 lt!132574)))))

(declare-fun lt!132576 () (_ BitVec 64))

(assert (=> b!83180 (= lt!132577 (bvsub lt!132578 lt!132576))))

(assert (=> b!83180 (= lt!132577 (remainingBits!0 ((_ sign_extend 32) (size!1732 (buf!2122 b2!98))) ((_ sign_extend 32) (currentByte!4201 b2!98)) ((_ sign_extend 32) (currentBit!4196 b2!98))))))

(assert (=> b!83180 (= lt!132578 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1732 (buf!2122 b2!98)))))))

(declare-fun lt!132575 () Unit!5573)

(assert (=> b!83180 (= lt!132575 (remainingBitsBitIndexLemma!0 b2!98))))

(declare-fun b!83184 () Bool)

(assert (=> b!83184 (= e!55220 (array_inv!1578 (buf!2122 b2!98)))))

(declare-fun b!83185 () Bool)

(assert (=> b!83185 (= e!55216 e!55219)))

(declare-fun res!68455 () Bool)

(assert (=> b!83185 (=> (not res!68455) (not e!55219))))

(assert (=> b!83185 (= res!68455 (= lt!132574 lt!132576))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!83185 (= lt!132576 (bitIndex!0 (size!1732 (buf!2122 b2!98)) (currentByte!4201 b2!98) (currentBit!4196 b2!98)))))

(assert (=> b!83185 (= lt!132574 (bvadd lt!132579 b1b2Diff!1))))

(assert (=> b!83185 (= lt!132579 (bitIndex!0 (size!1732 (buf!2122 b1!98)) (currentByte!4201 b1!98) (currentBit!4196 b1!98)))))

(assert (= (and start!16970 res!68452) b!83181))

(assert (= (and b!83181 res!68453) b!83185))

(assert (= (and b!83185 res!68455) b!83182))

(assert (= (and b!83182 (not res!68454)) b!83180))

(assert (= start!16970 b!83183))

(assert (= start!16970 b!83184))

(declare-fun m!129731 () Bool)

(assert (=> b!83185 m!129731))

(declare-fun m!129733 () Bool)

(assert (=> b!83185 m!129733))

(declare-fun m!129735 () Bool)

(assert (=> start!16970 m!129735))

(declare-fun m!129737 () Bool)

(assert (=> start!16970 m!129737))

(declare-fun m!129739 () Bool)

(assert (=> b!83181 m!129739))

(declare-fun m!129741 () Bool)

(assert (=> b!83184 m!129741))

(declare-fun m!129743 () Bool)

(assert (=> b!83180 m!129743))

(declare-fun m!129745 () Bool)

(assert (=> b!83180 m!129745))

(declare-fun m!129747 () Bool)

(assert (=> b!83183 m!129747))

(declare-fun m!129749 () Bool)

(assert (=> b!83182 m!129749))

(declare-fun m!129751 () Bool)

(assert (=> b!83182 m!129751))

(push 1)

(assert (not b!83184))

(assert (not b!83181))

(assert (not b!83182))

(assert (not b!83180))

(assert (not start!16970))

(assert (not b!83185))

(assert (not b!83183))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

