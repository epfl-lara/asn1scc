; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16712 () Bool)

(assert start!16712)

(declare-fun b!82521 () Bool)

(declare-fun e!54551 () Bool)

(declare-datatypes ((array!3728 0))(
  ( (array!3729 (arr!2340 (Array (_ BitVec 32) (_ BitVec 8))) (size!1703 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2968 0))(
  ( (BitStream!2969 (buf!2093 array!3728) (currentByte!4119 (_ BitVec 32)) (currentBit!4114 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!2968)

(declare-fun array_inv!1549 (array!3728) Bool)

(assert (=> b!82521 (= e!54551 (array_inv!1549 (buf!2093 b2!98)))))

(declare-fun b!82523 () Bool)

(declare-fun res!67987 () Bool)

(declare-fun e!54550 () Bool)

(assert (=> b!82523 (=> (not res!67987) (not e!54550))))

(declare-fun b1!98 () BitStream!2968)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!82523 (= res!67987 (validate_offset_bits!1 ((_ sign_extend 32) (size!1703 (buf!2093 b1!98))) ((_ sign_extend 32) (currentByte!4119 b1!98)) ((_ sign_extend 32) (currentBit!4114 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!82524 () Bool)

(declare-fun e!54547 () Bool)

(declare-fun e!54548 () Bool)

(assert (=> b!82524 (= e!54547 (not e!54548))))

(declare-fun res!67986 () Bool)

(assert (=> b!82524 (=> res!67986 e!54548)))

(declare-fun lt!131357 () (_ BitVec 64))

(declare-fun lt!131360 () (_ BitVec 64))

(assert (=> b!82524 (= res!67986 (bvsgt lt!131360 (bvsub lt!131357 b1ValidateOffsetBits!11)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!82524 (= (remainingBits!0 ((_ sign_extend 32) (size!1703 (buf!2093 b1!98))) ((_ sign_extend 32) (currentByte!4119 b1!98)) ((_ sign_extend 32) (currentBit!4114 b1!98))) (bvsub lt!131357 lt!131360))))

(assert (=> b!82524 (= lt!131357 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1703 (buf!2093 b1!98)))))))

(declare-datatypes ((Unit!5515 0))(
  ( (Unit!5516) )
))
(declare-fun lt!131358 () Unit!5515)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!2968) Unit!5515)

(assert (=> b!82524 (= lt!131358 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!82522 () Bool)

(declare-fun lt!131361 () (_ BitVec 64))

(declare-fun lt!131362 () (_ BitVec 64))

(declare-fun lt!131364 () (_ BitVec 64))

(assert (=> b!82522 (= e!54548 (or (not (= lt!131364 (bvsub lt!131362 lt!131361))) (and (bvsle ((_ sign_extend 32) (size!1703 (buf!2093 b2!98))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4119 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4114 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111))))))

(declare-fun lt!131363 () (_ BitVec 64))

(assert (=> b!82522 (= lt!131364 (bvsub lt!131362 lt!131363))))

(assert (=> b!82522 (= lt!131364 (remainingBits!0 ((_ sign_extend 32) (size!1703 (buf!2093 b2!98))) ((_ sign_extend 32) (currentByte!4119 b2!98)) ((_ sign_extend 32) (currentBit!4114 b2!98))))))

(assert (=> b!82522 (= lt!131362 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1703 (buf!2093 b2!98)))))))

(declare-fun lt!131359 () Unit!5515)

(assert (=> b!82522 (= lt!131359 (remainingBitsBitIndexLemma!0 b2!98))))

(declare-fun res!67985 () Bool)

(assert (=> start!16712 (=> (not res!67985) (not e!54550))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(assert (=> start!16712 (= res!67985 (and (= (size!1703 (buf!2093 b1!98)) (size!1703 (buf!2093 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16712 e!54550))

(declare-fun e!54546 () Bool)

(declare-fun inv!12 (BitStream!2968) Bool)

(assert (=> start!16712 (and (inv!12 b1!98) e!54546)))

(assert (=> start!16712 (and (inv!12 b2!98) e!54551)))

(assert (=> start!16712 true))

(declare-fun b!82525 () Bool)

(assert (=> b!82525 (= e!54546 (array_inv!1549 (buf!2093 b1!98)))))

(declare-fun b!82526 () Bool)

(assert (=> b!82526 (= e!54550 e!54547)))

(declare-fun res!67984 () Bool)

(assert (=> b!82526 (=> (not res!67984) (not e!54547))))

(assert (=> b!82526 (= res!67984 (= lt!131361 lt!131363))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!82526 (= lt!131363 (bitIndex!0 (size!1703 (buf!2093 b2!98)) (currentByte!4119 b2!98) (currentBit!4114 b2!98)))))

(assert (=> b!82526 (= lt!131361 (bvadd lt!131360 b1b2Diff!1))))

(assert (=> b!82526 (= lt!131360 (bitIndex!0 (size!1703 (buf!2093 b1!98)) (currentByte!4119 b1!98) (currentBit!4114 b1!98)))))

(assert (= (and start!16712 res!67985) b!82523))

(assert (= (and b!82523 res!67987) b!82526))

(assert (= (and b!82526 res!67984) b!82524))

(assert (= (and b!82524 (not res!67986)) b!82522))

(assert (= start!16712 b!82525))

(assert (= start!16712 b!82521))

(declare-fun m!128985 () Bool)

(assert (=> b!82525 m!128985))

(declare-fun m!128987 () Bool)

(assert (=> b!82522 m!128987))

(declare-fun m!128989 () Bool)

(assert (=> b!82522 m!128989))

(declare-fun m!128991 () Bool)

(assert (=> b!82526 m!128991))

(declare-fun m!128993 () Bool)

(assert (=> b!82526 m!128993))

(declare-fun m!128995 () Bool)

(assert (=> b!82524 m!128995))

(declare-fun m!128997 () Bool)

(assert (=> b!82524 m!128997))

(declare-fun m!128999 () Bool)

(assert (=> b!82523 m!128999))

(declare-fun m!129001 () Bool)

(assert (=> b!82521 m!129001))

(declare-fun m!129003 () Bool)

(assert (=> start!16712 m!129003))

(declare-fun m!129005 () Bool)

(assert (=> start!16712 m!129005))

(push 1)

(assert (not b!82522))

(assert (not b!82524))

(assert (not b!82523))

(assert (not start!16712))

(assert (not b!82521))

(assert (not b!82526))

(assert (not b!82525))

(check-sat)

(pop 1)

(push 1)

(check-sat)

