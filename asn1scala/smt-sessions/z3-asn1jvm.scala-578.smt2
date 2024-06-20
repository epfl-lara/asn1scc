; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16566 () Bool)

(assert start!16566)

(declare-fun b!82232 () Bool)

(declare-fun e!54274 () Bool)

(declare-datatypes ((array!3697 0))(
  ( (array!3698 (arr!2329 (Array (_ BitVec 32) (_ BitVec 8))) (size!1692 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2946 0))(
  ( (BitStream!2947 (buf!2082 array!3697) (currentByte!4074 (_ BitVec 32)) (currentBit!4069 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!2946)

(assert (=> b!82232 (= e!54274 (and (bvsle ((_ sign_extend 32) (size!1692 (buf!2082 b2!98))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4074 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4069 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun lt!130791 () (_ BitVec 64))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!82232 (= (remainingBits!0 ((_ sign_extend 32) (size!1692 (buf!2082 b2!98))) ((_ sign_extend 32) (currentByte!4074 b2!98)) ((_ sign_extend 32) (currentBit!4069 b2!98))) (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1692 (buf!2082 b2!98)))) lt!130791))))

(declare-datatypes ((Unit!5493 0))(
  ( (Unit!5494) )
))
(declare-fun lt!130794 () Unit!5493)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!2946) Unit!5493)

(assert (=> b!82232 (= lt!130794 (remainingBitsBitIndexLemma!0 b2!98))))

(declare-fun b!82233 () Bool)

(declare-fun e!54271 () Bool)

(declare-fun e!54275 () Bool)

(assert (=> b!82233 (= e!54271 e!54275)))

(declare-fun res!67771 () Bool)

(assert (=> b!82233 (=> (not res!67771) (not e!54275))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-fun lt!130790 () (_ BitVec 64))

(assert (=> b!82233 (= res!67771 (= (bvadd lt!130790 b1b2Diff!1) lt!130791))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!82233 (= lt!130791 (bitIndex!0 (size!1692 (buf!2082 b2!98)) (currentByte!4074 b2!98) (currentBit!4069 b2!98)))))

(declare-fun b1!98 () BitStream!2946)

(assert (=> b!82233 (= lt!130790 (bitIndex!0 (size!1692 (buf!2082 b1!98)) (currentByte!4074 b1!98) (currentBit!4069 b1!98)))))

(declare-fun b!82234 () Bool)

(declare-fun res!67772 () Bool)

(assert (=> b!82234 (=> (not res!67772) (not e!54271))))

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!82234 (= res!67772 (validate_offset_bits!1 ((_ sign_extend 32) (size!1692 (buf!2082 b1!98))) ((_ sign_extend 32) (currentByte!4074 b1!98)) ((_ sign_extend 32) (currentBit!4069 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!82236 () Bool)

(declare-fun e!54272 () Bool)

(declare-fun array_inv!1538 (array!3697) Bool)

(assert (=> b!82236 (= e!54272 (array_inv!1538 (buf!2082 b1!98)))))

(declare-fun b!82237 () Bool)

(declare-fun e!54276 () Bool)

(assert (=> b!82237 (= e!54276 (array_inv!1538 (buf!2082 b2!98)))))

(declare-fun b!82235 () Bool)

(assert (=> b!82235 (= e!54275 (not e!54274))))

(declare-fun res!67774 () Bool)

(assert (=> b!82235 (=> res!67774 e!54274)))

(declare-fun lt!130792 () (_ BitVec 64))

(assert (=> b!82235 (= res!67774 (bvsgt lt!130790 (bvsub lt!130792 b1ValidateOffsetBits!11)))))

(assert (=> b!82235 (= (remainingBits!0 ((_ sign_extend 32) (size!1692 (buf!2082 b1!98))) ((_ sign_extend 32) (currentByte!4074 b1!98)) ((_ sign_extend 32) (currentBit!4069 b1!98))) (bvsub lt!130792 lt!130790))))

(assert (=> b!82235 (= lt!130792 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1692 (buf!2082 b1!98)))))))

(declare-fun lt!130793 () Unit!5493)

(assert (=> b!82235 (= lt!130793 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun res!67773 () Bool)

(assert (=> start!16566 (=> (not res!67773) (not e!54271))))

(assert (=> start!16566 (= res!67773 (and (= (size!1692 (buf!2082 b1!98)) (size!1692 (buf!2082 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16566 e!54271))

(declare-fun inv!12 (BitStream!2946) Bool)

(assert (=> start!16566 (and (inv!12 b1!98) e!54272)))

(assert (=> start!16566 (and (inv!12 b2!98) e!54276)))

(assert (=> start!16566 true))

(assert (= (and start!16566 res!67773) b!82234))

(assert (= (and b!82234 res!67772) b!82233))

(assert (= (and b!82233 res!67771) b!82235))

(assert (= (and b!82235 (not res!67774)) b!82232))

(assert (= start!16566 b!82236))

(assert (= start!16566 b!82237))

(declare-fun m!128665 () Bool)

(assert (=> b!82232 m!128665))

(declare-fun m!128667 () Bool)

(assert (=> b!82232 m!128667))

(declare-fun m!128669 () Bool)

(assert (=> b!82235 m!128669))

(declare-fun m!128671 () Bool)

(assert (=> b!82235 m!128671))

(declare-fun m!128673 () Bool)

(assert (=> start!16566 m!128673))

(declare-fun m!128675 () Bool)

(assert (=> start!16566 m!128675))

(declare-fun m!128677 () Bool)

(assert (=> b!82236 m!128677))

(declare-fun m!128679 () Bool)

(assert (=> b!82233 m!128679))

(declare-fun m!128681 () Bool)

(assert (=> b!82233 m!128681))

(declare-fun m!128683 () Bool)

(assert (=> b!82237 m!128683))

(declare-fun m!128685 () Bool)

(assert (=> b!82234 m!128685))

(check-sat (not b!82235) (not b!82234) (not b!82233) (not b!82237) (not b!82236) (not start!16566) (not b!82232))
(check-sat)
