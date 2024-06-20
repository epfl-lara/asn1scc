; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69564 () Bool)

(assert start!69564)

(declare-fun e!224916 () Bool)

(declare-datatypes ((array!19164 0))(
  ( (array!19165 (arr!9389 (Array (_ BitVec 32) (_ BitVec 8))) (size!8309 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13722 0))(
  ( (BitStream!13723 (buf!7922 array!19164) (currentByte!14641 (_ BitVec 32)) (currentBit!14636 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13722)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun b!312682 () Bool)

(declare-fun b2!97 () BitStream!13722)

(assert (=> b!312682 (= e!224916 (and (bvsge (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8309 (buf!7922 b1!97)))) (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14641 b1!97))) ((_ sign_extend 32) (currentBit!14636 b1!97)))) b1ValidateOffsetBits!10) (let ((bdg!18623 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14641 b2!97))))) (let ((bdg!18624 (bvand bdg!18623 #b1000000000000000000000000000000000000000000000000000000000000000))) (and (= bdg!18624 (bvand ((_ sign_extend 32) (currentBit!14636 b2!97)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= bdg!18624 (bvand (bvadd bdg!18623 ((_ sign_extend 32) (currentBit!14636 b2!97))) #b1000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!312683 () Bool)

(declare-fun res!256067 () Bool)

(assert (=> b!312683 (=> (not res!256067) (not e!224916))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!312683 (= res!256067 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8309 (buf!7922 b1!97))) ((_ sign_extend 32) (currentByte!14641 b1!97)) ((_ sign_extend 32) (currentBit!14636 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun b!312684 () Bool)

(declare-fun res!256066 () Bool)

(assert (=> b!312684 (=> (not res!256066) (not e!224916))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!312684 (= res!256066 (validate_offset_bits!1 ((_ sign_extend 32) (size!8309 (buf!7922 b1!97))) ((_ sign_extend 32) (currentByte!14641 b1!97)) ((_ sign_extend 32) (currentBit!14636 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!312685 () Bool)

(declare-fun res!256065 () Bool)

(assert (=> b!312685 (=> (not res!256065) (not e!224916))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!312685 (= res!256065 (bvsle (bitIndex!0 (size!8309 (buf!7922 b2!97)) (currentByte!14641 b2!97) (currentBit!14636 b2!97)) (bvadd (bitIndex!0 (size!8309 (buf!7922 b1!97)) (currentByte!14641 b1!97) (currentBit!14636 b1!97)) advancedAtMostBits!9)))))

(declare-fun res!256064 () Bool)

(assert (=> start!69564 (=> (not res!256064) (not e!224916))))

(assert (=> start!69564 (= res!256064 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8309 (buf!7922 b1!97)) (size!8309 (buf!7922 b2!97)))))))

(assert (=> start!69564 e!224916))

(assert (=> start!69564 true))

(declare-fun e!224913 () Bool)

(declare-fun inv!12 (BitStream!13722) Bool)

(assert (=> start!69564 (and (inv!12 b1!97) e!224913)))

(declare-fun e!224915 () Bool)

(assert (=> start!69564 (and (inv!12 b2!97) e!224915)))

(declare-fun b!312686 () Bool)

(declare-fun array_inv!7861 (array!19164) Bool)

(assert (=> b!312686 (= e!224913 (array_inv!7861 (buf!7922 b1!97)))))

(declare-fun b!312687 () Bool)

(assert (=> b!312687 (= e!224915 (array_inv!7861 (buf!7922 b2!97)))))

(assert (= (and start!69564 res!256064) b!312684))

(assert (= (and b!312684 res!256066) b!312685))

(assert (= (and b!312685 res!256065) b!312683))

(assert (= (and b!312683 res!256067) b!312682))

(assert (= start!69564 b!312686))

(assert (= start!69564 b!312687))

(declare-fun m!450321 () Bool)

(assert (=> b!312686 m!450321))

(declare-fun m!450323 () Bool)

(assert (=> b!312684 m!450323))

(declare-fun m!450325 () Bool)

(assert (=> b!312683 m!450325))

(declare-fun m!450327 () Bool)

(assert (=> b!312685 m!450327))

(declare-fun m!450329 () Bool)

(assert (=> b!312685 m!450329))

(declare-fun m!450331 () Bool)

(assert (=> b!312687 m!450331))

(declare-fun m!450333 () Bool)

(assert (=> start!69564 m!450333))

(declare-fun m!450335 () Bool)

(assert (=> start!69564 m!450335))

(check-sat (not b!312685) (not b!312686) (not b!312683) (not start!69564) (not b!312687) (not b!312684))
(check-sat)
