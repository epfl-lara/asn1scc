; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17044 () Bool)

(assert start!17044)

(declare-fun res!68560 () Bool)

(declare-fun e!55368 () Bool)

(assert (=> start!17044 (=> (not res!68560) (not e!55368))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-datatypes ((array!3821 0))(
  ( (array!3822 (arr!2376 (Array (_ BitVec 32) (_ BitVec 8))) (size!1739 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3040 0))(
  ( (BitStream!3041 (buf!2129 array!3821) (currentByte!4223 (_ BitVec 32)) (currentBit!4218 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!3040)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun b1!98 () BitStream!3040)

(assert (=> start!17044 (= res!68560 (and (= (size!1739 (buf!2129 b1!98)) (size!1739 (buf!2129 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!17044 e!55368))

(declare-fun e!55363 () Bool)

(declare-fun inv!12 (BitStream!3040) Bool)

(assert (=> start!17044 (and (inv!12 b1!98) e!55363)))

(declare-fun e!55364 () Bool)

(assert (=> start!17044 (and (inv!12 b2!98) e!55364)))

(assert (=> start!17044 true))

(declare-fun b!83331 () Bool)

(declare-fun res!68559 () Bool)

(assert (=> b!83331 (=> (not res!68559) (not e!55368))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!83331 (= res!68559 (validate_offset_bits!1 ((_ sign_extend 32) (size!1739 (buf!2129 b1!98))) ((_ sign_extend 32) (currentByte!4223 b1!98)) ((_ sign_extend 32) (currentBit!4218 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!83332 () Bool)

(declare-fun array_inv!1585 (array!3821) Bool)

(assert (=> b!83332 (= e!55363 (array_inv!1585 (buf!2129 b1!98)))))

(declare-fun b!83333 () Bool)

(declare-fun e!55365 () Bool)

(declare-fun lt!132863 () (_ BitVec 64))

(assert (=> b!83333 (= e!55365 (not (or (= ((_ sign_extend 32) (size!1739 (buf!2129 b1!98))) #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv lt!132863 ((_ sign_extend 32) (size!1739 (buf!2129 b1!98))))))))))

(declare-fun lt!132864 () (_ BitVec 64))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!83333 (= (remainingBits!0 ((_ sign_extend 32) (size!1739 (buf!2129 b1!98))) ((_ sign_extend 32) (currentByte!4223 b1!98)) ((_ sign_extend 32) (currentBit!4218 b1!98))) (bvsub lt!132863 lt!132864))))

(assert (=> b!83333 (= lt!132863 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1739 (buf!2129 b1!98)))))))

(declare-datatypes ((Unit!5581 0))(
  ( (Unit!5582) )
))
(declare-fun lt!132862 () Unit!5581)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!3040) Unit!5581)

(assert (=> b!83333 (= lt!132862 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!83334 () Bool)

(assert (=> b!83334 (= e!55364 (array_inv!1585 (buf!2129 b2!98)))))

(declare-fun b!83335 () Bool)

(assert (=> b!83335 (= e!55368 e!55365)))

(declare-fun res!68558 () Bool)

(assert (=> b!83335 (=> (not res!68558) (not e!55365))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!83335 (= res!68558 (= (bvadd lt!132864 b1b2Diff!1) (bitIndex!0 (size!1739 (buf!2129 b2!98)) (currentByte!4223 b2!98) (currentBit!4218 b2!98))))))

(assert (=> b!83335 (= lt!132864 (bitIndex!0 (size!1739 (buf!2129 b1!98)) (currentByte!4223 b1!98) (currentBit!4218 b1!98)))))

(assert (= (and start!17044 res!68560) b!83331))

(assert (= (and b!83331 res!68559) b!83335))

(assert (= (and b!83335 res!68558) b!83333))

(assert (= start!17044 b!83332))

(assert (= start!17044 b!83334))

(declare-fun m!129897 () Bool)

(assert (=> b!83333 m!129897))

(declare-fun m!129899 () Bool)

(assert (=> b!83333 m!129899))

(declare-fun m!129901 () Bool)

(assert (=> b!83332 m!129901))

(declare-fun m!129903 () Bool)

(assert (=> start!17044 m!129903))

(declare-fun m!129905 () Bool)

(assert (=> start!17044 m!129905))

(declare-fun m!129907 () Bool)

(assert (=> b!83331 m!129907))

(declare-fun m!129909 () Bool)

(assert (=> b!83335 m!129909))

(declare-fun m!129911 () Bool)

(assert (=> b!83335 m!129911))

(declare-fun m!129913 () Bool)

(assert (=> b!83334 m!129913))

(push 1)

(assert (not b!83335))

(assert (not b!83333))

(assert (not b!83332))

(assert (not b!83334))

(assert (not b!83331))

(assert (not start!17044))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

