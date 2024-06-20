; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69606 () Bool)

(assert start!69606)

(declare-fun b!313060 () Bool)

(declare-fun res!256316 () Bool)

(declare-fun e!225230 () Bool)

(assert (=> b!313060 (=> (not res!256316) (not e!225230))))

(declare-datatypes ((array!19206 0))(
  ( (array!19207 (arr!9410 (Array (_ BitVec 32) (_ BitVec 8))) (size!8330 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13764 0))(
  ( (BitStream!13765 (buf!7943 array!19206) (currentByte!14662 (_ BitVec 32)) (currentBit!14657 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13764)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!313060 (= res!256316 (validate_offset_bits!1 ((_ sign_extend 32) (size!8330 (buf!7943 b1!97))) ((_ sign_extend 32) (currentByte!14662 b1!97)) ((_ sign_extend 32) (currentBit!14657 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!313061 () Bool)

(declare-fun e!225232 () Bool)

(declare-fun b2!97 () BitStream!13764)

(declare-fun array_inv!7882 (array!19206) Bool)

(assert (=> b!313061 (= e!225232 (array_inv!7882 (buf!7943 b2!97)))))

(declare-fun res!256319 () Bool)

(assert (=> start!69606 (=> (not res!256319) (not e!225230))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(assert (=> start!69606 (= res!256319 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8330 (buf!7943 b1!97)) (size!8330 (buf!7943 b2!97)))))))

(assert (=> start!69606 e!225230))

(assert (=> start!69606 true))

(declare-fun e!225231 () Bool)

(declare-fun inv!12 (BitStream!13764) Bool)

(assert (=> start!69606 (and (inv!12 b1!97) e!225231)))

(assert (=> start!69606 (and (inv!12 b2!97) e!225232)))

(declare-fun lt!442109 () (_ BitVec 64))

(declare-fun lt!442108 () (_ BitVec 64))

(declare-fun b!313062 () Bool)

(assert (=> b!313062 (= e!225230 (and (bvsge (bvsub lt!442109 lt!442108) b1ValidateOffsetBits!10) (let ((bdg!18641 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14662 b2!97))) ((_ sign_extend 32) (currentBit!14657 b2!97))))) (and (bvsle bdg!18641 (bvadd lt!442108 advancedAtMostBits!9)) (let ((bdg!18642 (bvand lt!442109 #b1000000000000000000000000000000000000000000000000000000000000000))) (and (not (= bdg!18642 (bvand bdg!18641 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= bdg!18642 (bvand (bvsub lt!442109 bdg!18641) #b1000000000000000000000000000000000000000000000000000000000000000)))))))))))

(assert (=> b!313062 (= lt!442108 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14662 b1!97))) ((_ sign_extend 32) (currentBit!14657 b1!97))))))

(assert (=> b!313062 (= lt!442109 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8330 (buf!7943 b1!97)))))))

(declare-fun b!313063 () Bool)

(declare-fun res!256318 () Bool)

(assert (=> b!313063 (=> (not res!256318) (not e!225230))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!313063 (= res!256318 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8330 (buf!7943 b1!97))) ((_ sign_extend 32) (currentByte!14662 b1!97)) ((_ sign_extend 32) (currentBit!14657 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun b!313064 () Bool)

(declare-fun res!256317 () Bool)

(assert (=> b!313064 (=> (not res!256317) (not e!225230))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!313064 (= res!256317 (bvsle (bitIndex!0 (size!8330 (buf!7943 b2!97)) (currentByte!14662 b2!97) (currentBit!14657 b2!97)) (bvadd (bitIndex!0 (size!8330 (buf!7943 b1!97)) (currentByte!14662 b1!97) (currentBit!14657 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!313065 () Bool)

(assert (=> b!313065 (= e!225231 (array_inv!7882 (buf!7943 b1!97)))))

(assert (= (and start!69606 res!256319) b!313060))

(assert (= (and b!313060 res!256316) b!313064))

(assert (= (and b!313064 res!256317) b!313063))

(assert (= (and b!313063 res!256318) b!313062))

(assert (= start!69606 b!313065))

(assert (= start!69606 b!313061))

(declare-fun m!450657 () Bool)

(assert (=> b!313064 m!450657))

(declare-fun m!450659 () Bool)

(assert (=> b!313064 m!450659))

(declare-fun m!450661 () Bool)

(assert (=> b!313060 m!450661))

(declare-fun m!450663 () Bool)

(assert (=> b!313065 m!450663))

(declare-fun m!450665 () Bool)

(assert (=> b!313061 m!450665))

(declare-fun m!450667 () Bool)

(assert (=> b!313063 m!450667))

(declare-fun m!450669 () Bool)

(assert (=> start!69606 m!450669))

(declare-fun m!450671 () Bool)

(assert (=> start!69606 m!450671))

(check-sat (not b!313065) (not start!69606) (not b!313063) (not b!313060) (not b!313064) (not b!313061))
(check-sat)
