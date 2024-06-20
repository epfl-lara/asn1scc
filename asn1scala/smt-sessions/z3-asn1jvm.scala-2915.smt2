; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69612 () Bool)

(assert start!69612)

(declare-fun b!313114 () Bool)

(declare-fun res!256355 () Bool)

(declare-fun e!225273 () Bool)

(assert (=> b!313114 (=> (not res!256355) (not e!225273))))

(declare-datatypes ((array!19212 0))(
  ( (array!19213 (arr!9413 (Array (_ BitVec 32) (_ BitVec 8))) (size!8333 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13770 0))(
  ( (BitStream!13771 (buf!7946 array!19212) (currentByte!14665 (_ BitVec 32)) (currentBit!14660 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13770)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!313114 (= res!256355 (validate_offset_bits!1 ((_ sign_extend 32) (size!8333 (buf!7946 b1!97))) ((_ sign_extend 32) (currentByte!14665 b1!97)) ((_ sign_extend 32) (currentBit!14660 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!313115 () Bool)

(declare-fun e!225277 () Bool)

(declare-fun array_inv!7885 (array!19212) Bool)

(assert (=> b!313115 (= e!225277 (array_inv!7885 (buf!7946 b1!97)))))

(declare-fun b!313116 () Bool)

(declare-fun e!225276 () Bool)

(declare-fun b2!97 () BitStream!13770)

(assert (=> b!313116 (= e!225276 (array_inv!7885 (buf!7946 b2!97)))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun b!313117 () Bool)

(declare-fun lt!442121 () (_ BitVec 64))

(assert (=> b!313117 (= e!225273 (and (bvsge (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8333 (buf!7946 b1!97)))) lt!442121) b1ValidateOffsetBits!10) (bvsle (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14665 b2!97))) ((_ sign_extend 32) (currentBit!14660 b2!97))) (bvadd lt!442121 advancedAtMostBits!9)) (not (= (bvand b1ValidateOffsetBits!10 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand advancedAtMostBits!9 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= (bvand b1ValidateOffsetBits!10 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!313117 (= lt!442121 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14665 b1!97))) ((_ sign_extend 32) (currentBit!14660 b1!97))))))

(declare-fun res!256353 () Bool)

(assert (=> start!69612 (=> (not res!256353) (not e!225273))))

(assert (=> start!69612 (= res!256353 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8333 (buf!7946 b1!97)) (size!8333 (buf!7946 b2!97)))))))

(assert (=> start!69612 e!225273))

(assert (=> start!69612 true))

(declare-fun inv!12 (BitStream!13770) Bool)

(assert (=> start!69612 (and (inv!12 b1!97) e!225277)))

(assert (=> start!69612 (and (inv!12 b2!97) e!225276)))

(declare-fun b!313118 () Bool)

(declare-fun res!256354 () Bool)

(assert (=> b!313118 (=> (not res!256354) (not e!225273))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!313118 (= res!256354 (bvsle (bitIndex!0 (size!8333 (buf!7946 b2!97)) (currentByte!14665 b2!97) (currentBit!14660 b2!97)) (bvadd (bitIndex!0 (size!8333 (buf!7946 b1!97)) (currentByte!14665 b1!97) (currentBit!14660 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!313119 () Bool)

(declare-fun res!256352 () Bool)

(assert (=> b!313119 (=> (not res!256352) (not e!225273))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!313119 (= res!256352 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8333 (buf!7946 b1!97))) ((_ sign_extend 32) (currentByte!14665 b1!97)) ((_ sign_extend 32) (currentBit!14660 b1!97))) b1ValidateOffsetBits!10))))

(assert (= (and start!69612 res!256353) b!313114))

(assert (= (and b!313114 res!256355) b!313118))

(assert (= (and b!313118 res!256354) b!313119))

(assert (= (and b!313119 res!256352) b!313117))

(assert (= start!69612 b!313115))

(assert (= start!69612 b!313116))

(declare-fun m!450705 () Bool)

(assert (=> b!313118 m!450705))

(declare-fun m!450707 () Bool)

(assert (=> b!313118 m!450707))

(declare-fun m!450709 () Bool)

(assert (=> b!313114 m!450709))

(declare-fun m!450711 () Bool)

(assert (=> start!69612 m!450711))

(declare-fun m!450713 () Bool)

(assert (=> start!69612 m!450713))

(declare-fun m!450715 () Bool)

(assert (=> b!313116 m!450715))

(declare-fun m!450717 () Bool)

(assert (=> b!313115 m!450717))

(declare-fun m!450719 () Bool)

(assert (=> b!313119 m!450719))

(check-sat (not b!313115) (not b!313119) (not start!69612) (not b!313118) (not b!313116) (not b!313114))
(check-sat)
