; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48924 () Bool)

(assert start!48924)

(declare-fun b!231692 () Bool)

(declare-fun e!159375 () Bool)

(declare-fun e!159374 () Bool)

(assert (=> b!231692 (= e!159375 e!159374)))

(declare-fun res!194031 () Bool)

(assert (=> b!231692 (=> (not res!194031) (not e!159374))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun lt!368736 () (_ BitVec 64))

(assert (=> b!231692 (= res!194031 (and (bvsle bits!86 lt!368736) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(declare-datatypes ((array!11893 0))(
  ( (array!11894 (arr!6199 (Array (_ BitVec 32) (_ BitVec 8))) (size!5212 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9520 0))(
  ( (BitStream!9521 (buf!5753 array!11893) (currentByte!10760 (_ BitVec 32)) (currentBit!10755 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9520)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!231692 (= lt!368736 (bitIndex!0 (size!5212 (buf!5753 b2!99)) (currentByte!10760 b2!99) (currentBit!10755 b2!99)))))

(declare-fun b!231693 () Bool)

(declare-fun res!194030 () Bool)

(assert (=> b!231693 (=> (not res!194030) (not e!159374))))

(declare-fun b1!101 () BitStream!9520)

(assert (=> b!231693 (= res!194030 (= lt!368736 (bvadd (bitIndex!0 (size!5212 (buf!5753 b1!101)) (currentByte!10760 b1!101) (currentBit!10755 b1!101)) bits!86)))))

(declare-fun b!231694 () Bool)

(assert (=> b!231694 (= e!159374 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5212 (buf!5753 b1!101)))) (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10760 b1!101))) ((_ sign_extend 32) (currentBit!10755 b1!101)))) #b0000000000000000000000000000000000000000000000000000000000001000)) (= lt!368736 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10760 b2!99))) ((_ sign_extend 32) (currentBit!10755 b2!99)))) (let ((bdg!14326 (bvand lt!368736 #b1000000000000000000000000000000000000000000000000000000000000000))) (and (not (= bdg!14326 (bvand bits!86 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= bdg!14326 (bvand (bvsub lt!368736 bits!86) #b1000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!231695 () Bool)

(declare-fun res!194034 () Bool)

(assert (=> b!231695 (=> (not res!194034) (not e!159374))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!231695 (= res!194034 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5212 (buf!5753 b1!101))) ((_ sign_extend 32) (currentByte!10760 b1!101)) ((_ sign_extend 32) (currentBit!10755 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!231696 () Bool)

(declare-fun e!159372 () Bool)

(declare-fun array_inv!4953 (array!11893) Bool)

(assert (=> b!231696 (= e!159372 (array_inv!4953 (buf!5753 b2!99)))))

(declare-fun b!231697 () Bool)

(declare-fun res!194032 () Bool)

(assert (=> b!231697 (=> (not res!194032) (not e!159374))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231697 (= res!194032 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5212 (buf!5753 b1!101))) ((_ sign_extend 32) (currentByte!10760 b1!101)) ((_ sign_extend 32) (currentBit!10755 b1!101)) bytes!19))))

(declare-fun b!231698 () Bool)

(declare-fun e!159373 () Bool)

(assert (=> b!231698 (= e!159373 (array_inv!4953 (buf!5753 b1!101)))))

(declare-fun res!194033 () Bool)

(assert (=> start!48924 (=> (not res!194033) (not e!159375))))

(assert (=> start!48924 (= res!194033 (and (= (size!5212 (buf!5753 b1!101)) (size!5212 (buf!5753 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48924 e!159375))

(declare-fun inv!12 (BitStream!9520) Bool)

(assert (=> start!48924 (and (inv!12 b1!101) e!159373)))

(assert (=> start!48924 (and (inv!12 b2!99) e!159372)))

(assert (=> start!48924 true))

(assert (= (and start!48924 res!194033) b!231692))

(assert (= (and b!231692 res!194031) b!231697))

(assert (= (and b!231697 res!194032) b!231693))

(assert (= (and b!231693 res!194030) b!231695))

(assert (= (and b!231695 res!194034) b!231694))

(assert (= start!48924 b!231698))

(assert (= start!48924 b!231696))

(declare-fun m!354755 () Bool)

(assert (=> b!231692 m!354755))

(declare-fun m!354757 () Bool)

(assert (=> start!48924 m!354757))

(declare-fun m!354759 () Bool)

(assert (=> start!48924 m!354759))

(declare-fun m!354761 () Bool)

(assert (=> b!231697 m!354761))

(declare-fun m!354763 () Bool)

(assert (=> b!231698 m!354763))

(declare-fun m!354765 () Bool)

(assert (=> b!231693 m!354765))

(declare-fun m!354767 () Bool)

(assert (=> b!231695 m!354767))

(declare-fun m!354769 () Bool)

(assert (=> b!231696 m!354769))

(push 1)

(assert (not b!231698))

(assert (not b!231697))

(assert (not b!231695))

(assert (not start!48924))

(assert (not b!231693))

(assert (not b!231692))

(assert (not b!231696))

(check-sat)

(pop 1)

(push 1)

(check-sat)

