; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16814 () Bool)

(assert start!16814)

(declare-fun res!68162 () Bool)

(declare-fun e!54792 () Bool)

(assert (=> start!16814 (=> (not res!68162) (not e!54792))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-datatypes ((array!3754 0))(
  ( (array!3755 (arr!2350 (Array (_ BitVec 32) (_ BitVec 8))) (size!1713 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2988 0))(
  ( (BitStream!2989 (buf!2103 array!3754) (currentByte!4151 (_ BitVec 32)) (currentBit!4146 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!2988)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun b1!98 () BitStream!2988)

(assert (=> start!16814 (= res!68162 (and (= (size!1713 (buf!2103 b1!98)) (size!1713 (buf!2103 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16814 e!54792))

(declare-fun e!54793 () Bool)

(declare-fun inv!12 (BitStream!2988) Bool)

(assert (=> start!16814 (and (inv!12 b1!98) e!54793)))

(declare-fun e!54790 () Bool)

(assert (=> start!16814 (and (inv!12 b2!98) e!54790)))

(assert (=> start!16814 true))

(declare-fun b!82765 () Bool)

(declare-fun array_inv!1559 (array!3754) Bool)

(assert (=> b!82765 (= e!54790 (array_inv!1559 (buf!2103 b2!98)))))

(declare-fun lt!131863 () (_ BitVec 64))

(declare-fun lt!131866 () (_ BitVec 64))

(declare-fun b!82766 () Bool)

(declare-fun e!54794 () Bool)

(declare-fun lt!131862 () (_ BitVec 64))

(assert (=> b!82766 (= e!54794 (or (not (= lt!131866 (bvsub lt!131862 lt!131863))) (bvslt lt!131866 (bvsub b1ValidateOffsetBits!11 b1b2Diff!1)) (and (bvsle ((_ sign_extend 32) (size!1713 (buf!2103 b2!98))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4151 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4146 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111))))))

(declare-fun lt!131868 () (_ BitVec 64))

(assert (=> b!82766 (= lt!131866 (bvsub lt!131862 lt!131868))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!82766 (= lt!131866 (remainingBits!0 ((_ sign_extend 32) (size!1713 (buf!2103 b2!98))) ((_ sign_extend 32) (currentByte!4151 b2!98)) ((_ sign_extend 32) (currentBit!4146 b2!98))))))

(assert (=> b!82766 (= lt!131862 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1713 (buf!2103 b2!98)))))))

(declare-datatypes ((Unit!5535 0))(
  ( (Unit!5536) )
))
(declare-fun lt!131867 () Unit!5535)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!2988) Unit!5535)

(assert (=> b!82766 (= lt!131867 (remainingBitsBitIndexLemma!0 b2!98))))

(declare-fun b!82767 () Bool)

(declare-fun e!54795 () Bool)

(assert (=> b!82767 (= e!54792 e!54795)))

(declare-fun res!68163 () Bool)

(assert (=> b!82767 (=> (not res!68163) (not e!54795))))

(assert (=> b!82767 (= res!68163 (= lt!131863 lt!131868))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!82767 (= lt!131868 (bitIndex!0 (size!1713 (buf!2103 b2!98)) (currentByte!4151 b2!98) (currentBit!4146 b2!98)))))

(declare-fun lt!131865 () (_ BitVec 64))

(assert (=> b!82767 (= lt!131863 (bvadd lt!131865 b1b2Diff!1))))

(assert (=> b!82767 (= lt!131865 (bitIndex!0 (size!1713 (buf!2103 b1!98)) (currentByte!4151 b1!98) (currentBit!4146 b1!98)))))

(declare-fun b!82768 () Bool)

(assert (=> b!82768 (= e!54793 (array_inv!1559 (buf!2103 b1!98)))))

(declare-fun b!82769 () Bool)

(declare-fun res!68161 () Bool)

(assert (=> b!82769 (=> (not res!68161) (not e!54792))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!82769 (= res!68161 (validate_offset_bits!1 ((_ sign_extend 32) (size!1713 (buf!2103 b1!98))) ((_ sign_extend 32) (currentByte!4151 b1!98)) ((_ sign_extend 32) (currentBit!4146 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!82770 () Bool)

(assert (=> b!82770 (= e!54795 (not e!54794))))

(declare-fun res!68164 () Bool)

(assert (=> b!82770 (=> res!68164 e!54794)))

(declare-fun lt!131864 () (_ BitVec 64))

(assert (=> b!82770 (= res!68164 (bvsgt lt!131865 (bvsub lt!131864 b1ValidateOffsetBits!11)))))

(assert (=> b!82770 (= (remainingBits!0 ((_ sign_extend 32) (size!1713 (buf!2103 b1!98))) ((_ sign_extend 32) (currentByte!4151 b1!98)) ((_ sign_extend 32) (currentBit!4146 b1!98))) (bvsub lt!131864 lt!131865))))

(assert (=> b!82770 (= lt!131864 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1713 (buf!2103 b1!98)))))))

(declare-fun lt!131861 () Unit!5535)

(assert (=> b!82770 (= lt!131861 (remainingBitsBitIndexLemma!0 b1!98))))

(assert (= (and start!16814 res!68162) b!82769))

(assert (= (and b!82769 res!68161) b!82767))

(assert (= (and b!82767 res!68163) b!82770))

(assert (= (and b!82770 (not res!68164)) b!82766))

(assert (= start!16814 b!82768))

(assert (= start!16814 b!82765))

(declare-fun m!129259 () Bool)

(assert (=> b!82767 m!129259))

(declare-fun m!129261 () Bool)

(assert (=> b!82767 m!129261))

(declare-fun m!129263 () Bool)

(assert (=> b!82765 m!129263))

(declare-fun m!129265 () Bool)

(assert (=> b!82770 m!129265))

(declare-fun m!129267 () Bool)

(assert (=> b!82770 m!129267))

(declare-fun m!129269 () Bool)

(assert (=> b!82766 m!129269))

(declare-fun m!129271 () Bool)

(assert (=> b!82766 m!129271))

(declare-fun m!129273 () Bool)

(assert (=> b!82769 m!129273))

(declare-fun m!129275 () Bool)

(assert (=> start!16814 m!129275))

(declare-fun m!129277 () Bool)

(assert (=> start!16814 m!129277))

(declare-fun m!129279 () Bool)

(assert (=> b!82768 m!129279))

(check-sat (not b!82766) (not b!82769) (not start!16814) (not b!82767) (not b!82770) (not b!82765) (not b!82768))
(check-sat)
