; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16966 () Bool)

(assert start!16966)

(declare-fun b!83144 () Bool)

(declare-fun res!68428 () Bool)

(declare-fun e!55177 () Bool)

(assert (=> b!83144 (=> (not res!68428) (not e!55177))))

(declare-datatypes ((array!3797 0))(
  ( (array!3798 (arr!2367 (Array (_ BitVec 32) (_ BitVec 8))) (size!1730 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3022 0))(
  ( (BitStream!3023 (buf!2120 array!3797) (currentByte!4199 (_ BitVec 32)) (currentBit!4194 (_ BitVec 32))) )
))
(declare-fun b1!98 () BitStream!3022)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!83144 (= res!68428 (validate_offset_bits!1 ((_ sign_extend 32) (size!1730 (buf!2120 b1!98))) ((_ sign_extend 32) (currentByte!4199 b1!98)) ((_ sign_extend 32) (currentBit!4194 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun res!68430 () Bool)

(assert (=> start!16966 (=> (not res!68430) (not e!55177))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-fun b2!98 () BitStream!3022)

(assert (=> start!16966 (= res!68430 (and (= (size!1730 (buf!2120 b1!98)) (size!1730 (buf!2120 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16966 e!55177))

(declare-fun e!55173 () Bool)

(declare-fun inv!12 (BitStream!3022) Bool)

(assert (=> start!16966 (and (inv!12 b1!98) e!55173)))

(declare-fun e!55176 () Bool)

(assert (=> start!16966 (and (inv!12 b2!98) e!55176)))

(assert (=> start!16966 true))

(declare-fun lt!132524 () (_ BitVec 64))

(declare-fun b!83145 () Bool)

(declare-fun lt!132526 () (_ BitVec 64))

(declare-fun e!55175 () Bool)

(declare-fun lt!132529 () (_ BitVec 64))

(assert (=> b!83145 (= e!55175 (= lt!132526 (bvsub lt!132529 lt!132524)))))

(declare-fun lt!132525 () (_ BitVec 64))

(assert (=> b!83145 (= lt!132526 (bvsub lt!132529 lt!132525))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!83145 (= lt!132526 (remainingBits!0 ((_ sign_extend 32) (size!1730 (buf!2120 b2!98))) ((_ sign_extend 32) (currentByte!4199 b2!98)) ((_ sign_extend 32) (currentBit!4194 b2!98))))))

(assert (=> b!83145 (= lt!132529 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1730 (buf!2120 b2!98)))))))

(declare-datatypes ((Unit!5569 0))(
  ( (Unit!5570) )
))
(declare-fun lt!132528 () Unit!5569)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!3022) Unit!5569)

(assert (=> b!83145 (= lt!132528 (remainingBitsBitIndexLemma!0 b2!98))))

(declare-fun b!83146 () Bool)

(declare-fun array_inv!1576 (array!3797) Bool)

(assert (=> b!83146 (= e!55173 (array_inv!1576 (buf!2120 b1!98)))))

(declare-fun b!83147 () Bool)

(declare-fun e!55178 () Bool)

(assert (=> b!83147 (= e!55178 (not e!55175))))

(declare-fun res!68431 () Bool)

(assert (=> b!83147 (=> res!68431 e!55175)))

(declare-fun lt!132527 () (_ BitVec 64))

(declare-fun lt!132531 () (_ BitVec 64))

(assert (=> b!83147 (= res!68431 (bvsgt lt!132527 (bvsub lt!132531 b1ValidateOffsetBits!11)))))

(assert (=> b!83147 (= (remainingBits!0 ((_ sign_extend 32) (size!1730 (buf!2120 b1!98))) ((_ sign_extend 32) (currentByte!4199 b1!98)) ((_ sign_extend 32) (currentBit!4194 b1!98))) (bvsub lt!132531 lt!132527))))

(assert (=> b!83147 (= lt!132531 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1730 (buf!2120 b1!98)))))))

(declare-fun lt!132530 () Unit!5569)

(assert (=> b!83147 (= lt!132530 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!83148 () Bool)

(assert (=> b!83148 (= e!55176 (array_inv!1576 (buf!2120 b2!98)))))

(declare-fun b!83149 () Bool)

(assert (=> b!83149 (= e!55177 e!55178)))

(declare-fun res!68429 () Bool)

(assert (=> b!83149 (=> (not res!68429) (not e!55178))))

(assert (=> b!83149 (= res!68429 (= lt!132524 lt!132525))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!83149 (= lt!132525 (bitIndex!0 (size!1730 (buf!2120 b2!98)) (currentByte!4199 b2!98) (currentBit!4194 b2!98)))))

(assert (=> b!83149 (= lt!132524 (bvadd lt!132527 b1b2Diff!1))))

(assert (=> b!83149 (= lt!132527 (bitIndex!0 (size!1730 (buf!2120 b1!98)) (currentByte!4199 b1!98) (currentBit!4194 b1!98)))))

(assert (= (and start!16966 res!68430) b!83144))

(assert (= (and b!83144 res!68428) b!83149))

(assert (= (and b!83149 res!68429) b!83147))

(assert (= (and b!83147 (not res!68431)) b!83145))

(assert (= start!16966 b!83146))

(assert (= start!16966 b!83148))

(declare-fun m!129687 () Bool)

(assert (=> b!83149 m!129687))

(declare-fun m!129689 () Bool)

(assert (=> b!83149 m!129689))

(declare-fun m!129691 () Bool)

(assert (=> start!16966 m!129691))

(declare-fun m!129693 () Bool)

(assert (=> start!16966 m!129693))

(declare-fun m!129695 () Bool)

(assert (=> b!83145 m!129695))

(declare-fun m!129697 () Bool)

(assert (=> b!83145 m!129697))

(declare-fun m!129699 () Bool)

(assert (=> b!83146 m!129699))

(declare-fun m!129701 () Bool)

(assert (=> b!83147 m!129701))

(declare-fun m!129703 () Bool)

(assert (=> b!83147 m!129703))

(declare-fun m!129705 () Bool)

(assert (=> b!83144 m!129705))

(declare-fun m!129707 () Bool)

(assert (=> b!83148 m!129707))

(push 1)

(assert (not b!83149))

(assert (not b!83148))

(assert (not b!83146))

(assert (not b!83145))

(assert (not start!16966))

(assert (not b!83147))

(assert (not b!83144))

(check-sat)

(pop 1)

(push 1)

(check-sat)

