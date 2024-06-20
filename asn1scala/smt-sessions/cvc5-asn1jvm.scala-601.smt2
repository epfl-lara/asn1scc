; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17230 () Bool)

(assert start!17230)

(declare-fun b!83783 () Bool)

(declare-fun res!68872 () Bool)

(declare-fun e!55820 () Bool)

(assert (=> b!83783 (=> (not res!68872) (not e!55820))))

(declare-datatypes ((array!3875 0))(
  ( (array!3876 (arr!2397 (Array (_ BitVec 32) (_ BitVec 8))) (size!1760 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3082 0))(
  ( (BitStream!3083 (buf!2150 array!3875) (currentByte!4280 (_ BitVec 32)) (currentBit!4275 (_ BitVec 32))) )
))
(declare-fun b1!98 () BitStream!3082)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!83783 (= res!68872 (validate_offset_bits!1 ((_ sign_extend 32) (size!1760 (buf!2150 b1!98))) ((_ sign_extend 32) (currentByte!4280 b1!98)) ((_ sign_extend 32) (currentBit!4275 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!83784 () Bool)

(declare-fun e!55822 () Bool)

(assert (=> b!83784 (= e!55820 e!55822)))

(declare-fun res!68874 () Bool)

(assert (=> b!83784 (=> (not res!68874) (not e!55822))))

(declare-fun lt!133694 () (_ BitVec 64))

(declare-fun lt!133700 () (_ BitVec 64))

(assert (=> b!83784 (= res!68874 (= lt!133694 lt!133700))))

(declare-fun b2!98 () BitStream!3082)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!83784 (= lt!133700 (bitIndex!0 (size!1760 (buf!2150 b2!98)) (currentByte!4280 b2!98) (currentBit!4275 b2!98)))))

(declare-fun lt!133697 () (_ BitVec 64))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(assert (=> b!83784 (= lt!133694 (bvadd lt!133697 b1b2Diff!1))))

(assert (=> b!83784 (= lt!133697 (bitIndex!0 (size!1760 (buf!2150 b1!98)) (currentByte!4280 b1!98) (currentBit!4275 b1!98)))))

(declare-fun b!83785 () Bool)

(declare-fun e!55824 () Bool)

(declare-fun array_inv!1606 (array!3875) Bool)

(assert (=> b!83785 (= e!55824 (array_inv!1606 (buf!2150 b1!98)))))

(declare-fun b!83786 () Bool)

(declare-fun e!55818 () Bool)

(assert (=> b!83786 (= e!55822 (not e!55818))))

(declare-fun res!68875 () Bool)

(assert (=> b!83786 (=> res!68875 e!55818)))

(declare-fun lt!133698 () (_ BitVec 64))

(assert (=> b!83786 (= res!68875 (bvsgt lt!133697 (bvsub lt!133698 b1ValidateOffsetBits!11)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!83786 (= (remainingBits!0 ((_ sign_extend 32) (size!1760 (buf!2150 b1!98))) ((_ sign_extend 32) (currentByte!4280 b1!98)) ((_ sign_extend 32) (currentBit!4275 b1!98))) (bvsub lt!133698 lt!133697))))

(assert (=> b!83786 (= lt!133698 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1760 (buf!2150 b1!98)))))))

(declare-datatypes ((Unit!5623 0))(
  ( (Unit!5624) )
))
(declare-fun lt!133701 () Unit!5623)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!3082) Unit!5623)

(assert (=> b!83786 (= lt!133701 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!83787 () Bool)

(declare-fun e!55819 () Bool)

(assert (=> b!83787 (= e!55819 (array_inv!1606 (buf!2150 b2!98)))))

(declare-fun lt!133695 () (_ BitVec 64))

(declare-fun lt!133696 () (_ BitVec 64))

(declare-fun b!83788 () Bool)

(assert (=> b!83788 (= e!55818 (or (not (= lt!133696 (bvsub lt!133695 lt!133694))) (= (bvand b1ValidateOffsetBits!11 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand b1b2Diff!1 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand b1ValidateOffsetBits!11 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub b1ValidateOffsetBits!11 b1b2Diff!1) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!83788 (= lt!133696 (bvsub lt!133695 lt!133700))))

(assert (=> b!83788 (= lt!133696 (remainingBits!0 ((_ sign_extend 32) (size!1760 (buf!2150 b2!98))) ((_ sign_extend 32) (currentByte!4280 b2!98)) ((_ sign_extend 32) (currentBit!4275 b2!98))))))

(assert (=> b!83788 (= lt!133695 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1760 (buf!2150 b2!98)))))))

(declare-fun lt!133699 () Unit!5623)

(assert (=> b!83788 (= lt!133699 (remainingBitsBitIndexLemma!0 b2!98))))

(declare-fun res!68873 () Bool)

(assert (=> start!17230 (=> (not res!68873) (not e!55820))))

(assert (=> start!17230 (= res!68873 (and (= (size!1760 (buf!2150 b1!98)) (size!1760 (buf!2150 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!17230 e!55820))

(declare-fun inv!12 (BitStream!3082) Bool)

(assert (=> start!17230 (and (inv!12 b1!98) e!55824)))

(assert (=> start!17230 (and (inv!12 b2!98) e!55819)))

(assert (=> start!17230 true))

(assert (= (and start!17230 res!68873) b!83783))

(assert (= (and b!83783 res!68872) b!83784))

(assert (= (and b!83784 res!68874) b!83786))

(assert (= (and b!83786 (not res!68875)) b!83788))

(assert (= start!17230 b!83785))

(assert (= start!17230 b!83787))

(declare-fun m!130407 () Bool)

(assert (=> start!17230 m!130407))

(declare-fun m!130409 () Bool)

(assert (=> start!17230 m!130409))

(declare-fun m!130411 () Bool)

(assert (=> b!83784 m!130411))

(declare-fun m!130413 () Bool)

(assert (=> b!83784 m!130413))

(declare-fun m!130415 () Bool)

(assert (=> b!83786 m!130415))

(declare-fun m!130417 () Bool)

(assert (=> b!83786 m!130417))

(declare-fun m!130419 () Bool)

(assert (=> b!83785 m!130419))

(declare-fun m!130421 () Bool)

(assert (=> b!83787 m!130421))

(declare-fun m!130423 () Bool)

(assert (=> b!83783 m!130423))

(declare-fun m!130425 () Bool)

(assert (=> b!83788 m!130425))

(declare-fun m!130427 () Bool)

(assert (=> b!83788 m!130427))

(push 1)

(assert (not b!83783))

(assert (not b!83784))

(assert (not b!83788))

(assert (not b!83787))

(assert (not start!17230))

(assert (not b!83786))

(assert (not b!83785))

(check-sat)

(pop 1)

(push 1)

(check-sat)

