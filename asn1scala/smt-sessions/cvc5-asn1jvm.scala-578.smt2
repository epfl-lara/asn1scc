; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16564 () Bool)

(assert start!16564)

(declare-fun b!82214 () Bool)

(declare-fun res!67760 () Bool)

(declare-fun e!54249 () Bool)

(assert (=> b!82214 (=> (not res!67760) (not e!54249))))

(declare-datatypes ((array!3695 0))(
  ( (array!3696 (arr!2328 (Array (_ BitVec 32) (_ BitVec 8))) (size!1691 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2944 0))(
  ( (BitStream!2945 (buf!2081 array!3695) (currentByte!4073 (_ BitVec 32)) (currentBit!4068 (_ BitVec 32))) )
))
(declare-fun b1!98 () BitStream!2944)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!82214 (= res!67760 (validate_offset_bits!1 ((_ sign_extend 32) (size!1691 (buf!2081 b1!98))) ((_ sign_extend 32) (currentByte!4073 b1!98)) ((_ sign_extend 32) (currentBit!4068 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!82215 () Bool)

(declare-fun e!54253 () Bool)

(declare-fun array_inv!1537 (array!3695) Bool)

(assert (=> b!82215 (= e!54253 (array_inv!1537 (buf!2081 b1!98)))))

(declare-fun b!82216 () Bool)

(declare-fun e!54250 () Bool)

(assert (=> b!82216 (= e!54249 e!54250)))

(declare-fun res!67761 () Bool)

(assert (=> b!82216 (=> (not res!67761) (not e!54250))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-fun lt!130776 () (_ BitVec 64))

(declare-fun lt!130775 () (_ BitVec 64))

(assert (=> b!82216 (= res!67761 (= (bvadd lt!130776 b1b2Diff!1) lt!130775))))

(declare-fun b2!98 () BitStream!2944)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!82216 (= lt!130775 (bitIndex!0 (size!1691 (buf!2081 b2!98)) (currentByte!4073 b2!98) (currentBit!4068 b2!98)))))

(assert (=> b!82216 (= lt!130776 (bitIndex!0 (size!1691 (buf!2081 b1!98)) (currentByte!4073 b1!98) (currentBit!4068 b1!98)))))

(declare-fun res!67759 () Bool)

(assert (=> start!16564 (=> (not res!67759) (not e!54249))))

(assert (=> start!16564 (= res!67759 (and (= (size!1691 (buf!2081 b1!98)) (size!1691 (buf!2081 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16564 e!54249))

(declare-fun inv!12 (BitStream!2944) Bool)

(assert (=> start!16564 (and (inv!12 b1!98) e!54253)))

(declare-fun e!54251 () Bool)

(assert (=> start!16564 (and (inv!12 b2!98) e!54251)))

(assert (=> start!16564 true))

(declare-fun b!82217 () Bool)

(assert (=> b!82217 (= e!54251 (array_inv!1537 (buf!2081 b2!98)))))

(declare-fun b!82218 () Bool)

(declare-fun e!54254 () Bool)

(assert (=> b!82218 (= e!54250 (not e!54254))))

(declare-fun res!67762 () Bool)

(assert (=> b!82218 (=> res!67762 e!54254)))

(declare-fun lt!130779 () (_ BitVec 64))

(assert (=> b!82218 (= res!67762 (bvsgt lt!130776 (bvsub lt!130779 b1ValidateOffsetBits!11)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!82218 (= (remainingBits!0 ((_ sign_extend 32) (size!1691 (buf!2081 b1!98))) ((_ sign_extend 32) (currentByte!4073 b1!98)) ((_ sign_extend 32) (currentBit!4068 b1!98))) (bvsub lt!130779 lt!130776))))

(assert (=> b!82218 (= lt!130779 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1691 (buf!2081 b1!98)))))))

(declare-datatypes ((Unit!5491 0))(
  ( (Unit!5492) )
))
(declare-fun lt!130777 () Unit!5491)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!2944) Unit!5491)

(assert (=> b!82218 (= lt!130777 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!82219 () Bool)

(assert (=> b!82219 (= e!54254 (and (bvsle ((_ sign_extend 32) (size!1691 (buf!2081 b2!98))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4073 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4068 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> b!82219 (= (remainingBits!0 ((_ sign_extend 32) (size!1691 (buf!2081 b2!98))) ((_ sign_extend 32) (currentByte!4073 b2!98)) ((_ sign_extend 32) (currentBit!4068 b2!98))) (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1691 (buf!2081 b2!98)))) lt!130775))))

(declare-fun lt!130778 () Unit!5491)

(assert (=> b!82219 (= lt!130778 (remainingBitsBitIndexLemma!0 b2!98))))

(assert (= (and start!16564 res!67759) b!82214))

(assert (= (and b!82214 res!67760) b!82216))

(assert (= (and b!82216 res!67761) b!82218))

(assert (= (and b!82218 (not res!67762)) b!82219))

(assert (= start!16564 b!82215))

(assert (= start!16564 b!82217))

(declare-fun m!128643 () Bool)

(assert (=> b!82218 m!128643))

(declare-fun m!128645 () Bool)

(assert (=> b!82218 m!128645))

(declare-fun m!128647 () Bool)

(assert (=> b!82216 m!128647))

(declare-fun m!128649 () Bool)

(assert (=> b!82216 m!128649))

(declare-fun m!128651 () Bool)

(assert (=> b!82214 m!128651))

(declare-fun m!128653 () Bool)

(assert (=> start!16564 m!128653))

(declare-fun m!128655 () Bool)

(assert (=> start!16564 m!128655))

(declare-fun m!128657 () Bool)

(assert (=> b!82217 m!128657))

(declare-fun m!128659 () Bool)

(assert (=> b!82219 m!128659))

(declare-fun m!128661 () Bool)

(assert (=> b!82219 m!128661))

(declare-fun m!128663 () Bool)

(assert (=> b!82215 m!128663))

(push 1)

(assert (not b!82217))

(assert (not b!82219))

(assert (not b!82216))

(assert (not b!82218))

(assert (not start!16564))

(assert (not b!82214))

(assert (not b!82215))

(check-sat)

(pop 1)

(push 1)

(check-sat)

