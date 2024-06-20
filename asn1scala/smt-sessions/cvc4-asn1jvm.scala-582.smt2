; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16716 () Bool)

(assert start!16716)

(declare-fun b!82557 () Bool)

(declare-fun e!54593 () Bool)

(declare-datatypes ((array!3732 0))(
  ( (array!3733 (arr!2342 (Array (_ BitVec 32) (_ BitVec 8))) (size!1705 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2972 0))(
  ( (BitStream!2973 (buf!2095 array!3732) (currentByte!4121 (_ BitVec 32)) (currentBit!4116 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!2972)

(declare-fun array_inv!1551 (array!3732) Bool)

(assert (=> b!82557 (= e!54593 (array_inv!1551 (buf!2095 b2!98)))))

(declare-fun b!82558 () Bool)

(declare-fun e!54594 () Bool)

(declare-fun b1!98 () BitStream!2972)

(assert (=> b!82558 (= e!54594 (array_inv!1551 (buf!2095 b1!98)))))

(declare-fun b!82559 () Bool)

(declare-fun e!54591 () Bool)

(declare-fun e!54592 () Bool)

(assert (=> b!82559 (= e!54591 (not e!54592))))

(declare-fun res!68010 () Bool)

(assert (=> b!82559 (=> res!68010 e!54592)))

(declare-fun lt!131405 () (_ BitVec 64))

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun lt!131406 () (_ BitVec 64))

(assert (=> b!82559 (= res!68010 (bvsgt lt!131405 (bvsub lt!131406 b1ValidateOffsetBits!11)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!82559 (= (remainingBits!0 ((_ sign_extend 32) (size!1705 (buf!2095 b1!98))) ((_ sign_extend 32) (currentByte!4121 b1!98)) ((_ sign_extend 32) (currentBit!4116 b1!98))) (bvsub lt!131406 lt!131405))))

(assert (=> b!82559 (= lt!131406 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1705 (buf!2095 b1!98)))))))

(declare-datatypes ((Unit!5519 0))(
  ( (Unit!5520) )
))
(declare-fun lt!131410 () Unit!5519)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!2972) Unit!5519)

(assert (=> b!82559 (= lt!131410 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun lt!131407 () (_ BitVec 64))

(declare-fun lt!131408 () (_ BitVec 64))

(declare-fun b!82560 () Bool)

(declare-fun lt!131409 () (_ BitVec 64))

(assert (=> b!82560 (= e!54592 (or (not (= lt!131407 (bvsub lt!131409 lt!131408))) (and (bvsle ((_ sign_extend 32) (size!1705 (buf!2095 b2!98))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4121 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4116 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111))))))

(declare-fun lt!131412 () (_ BitVec 64))

(assert (=> b!82560 (= lt!131407 (bvsub lt!131409 lt!131412))))

(assert (=> b!82560 (= lt!131407 (remainingBits!0 ((_ sign_extend 32) (size!1705 (buf!2095 b2!98))) ((_ sign_extend 32) (currentByte!4121 b2!98)) ((_ sign_extend 32) (currentBit!4116 b2!98))))))

(assert (=> b!82560 (= lt!131409 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1705 (buf!2095 b2!98)))))))

(declare-fun lt!131411 () Unit!5519)

(assert (=> b!82560 (= lt!131411 (remainingBitsBitIndexLemma!0 b2!98))))

(declare-fun b!82561 () Bool)

(declare-fun e!54588 () Bool)

(assert (=> b!82561 (= e!54588 e!54591)))

(declare-fun res!68008 () Bool)

(assert (=> b!82561 (=> (not res!68008) (not e!54591))))

(assert (=> b!82561 (= res!68008 (= lt!131408 lt!131412))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!82561 (= lt!131412 (bitIndex!0 (size!1705 (buf!2095 b2!98)) (currentByte!4121 b2!98) (currentBit!4116 b2!98)))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(assert (=> b!82561 (= lt!131408 (bvadd lt!131405 b1b2Diff!1))))

(assert (=> b!82561 (= lt!131405 (bitIndex!0 (size!1705 (buf!2095 b1!98)) (currentByte!4121 b1!98) (currentBit!4116 b1!98)))))

(declare-fun res!68009 () Bool)

(assert (=> start!16716 (=> (not res!68009) (not e!54588))))

(assert (=> start!16716 (= res!68009 (and (= (size!1705 (buf!2095 b1!98)) (size!1705 (buf!2095 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16716 e!54588))

(declare-fun inv!12 (BitStream!2972) Bool)

(assert (=> start!16716 (and (inv!12 b1!98) e!54594)))

(assert (=> start!16716 (and (inv!12 b2!98) e!54593)))

(assert (=> start!16716 true))

(declare-fun b!82562 () Bool)

(declare-fun res!68011 () Bool)

(assert (=> b!82562 (=> (not res!68011) (not e!54588))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!82562 (= res!68011 (validate_offset_bits!1 ((_ sign_extend 32) (size!1705 (buf!2095 b1!98))) ((_ sign_extend 32) (currentByte!4121 b1!98)) ((_ sign_extend 32) (currentBit!4116 b1!98)) b1ValidateOffsetBits!11))))

(assert (= (and start!16716 res!68009) b!82562))

(assert (= (and b!82562 res!68011) b!82561))

(assert (= (and b!82561 res!68008) b!82559))

(assert (= (and b!82559 (not res!68010)) b!82560))

(assert (= start!16716 b!82558))

(assert (= start!16716 b!82557))

(declare-fun m!129029 () Bool)

(assert (=> b!82559 m!129029))

(declare-fun m!129031 () Bool)

(assert (=> b!82559 m!129031))

(declare-fun m!129033 () Bool)

(assert (=> b!82560 m!129033))

(declare-fun m!129035 () Bool)

(assert (=> b!82560 m!129035))

(declare-fun m!129037 () Bool)

(assert (=> b!82561 m!129037))

(declare-fun m!129039 () Bool)

(assert (=> b!82561 m!129039))

(declare-fun m!129041 () Bool)

(assert (=> b!82557 m!129041))

(declare-fun m!129043 () Bool)

(assert (=> start!16716 m!129043))

(declare-fun m!129045 () Bool)

(assert (=> start!16716 m!129045))

(declare-fun m!129047 () Bool)

(assert (=> b!82558 m!129047))

(declare-fun m!129049 () Bool)

(assert (=> b!82562 m!129049))

(push 1)

(assert (not b!82559))

(assert (not b!82560))

(assert (not b!82557))

(assert (not b!82562))

(assert (not start!16716))

(assert (not b!82561))

(assert (not b!82558))

(check-sat)

(pop 1)

(push 1)

(check-sat)

