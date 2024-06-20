; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69570 () Bool)

(assert start!69570)

(declare-fun b!312736 () Bool)

(declare-fun res!256103 () Bool)

(declare-fun e!224958 () Bool)

(assert (=> b!312736 (=> (not res!256103) (not e!224958))))

(declare-datatypes ((array!19170 0))(
  ( (array!19171 (arr!9392 (Array (_ BitVec 32) (_ BitVec 8))) (size!8312 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13728 0))(
  ( (BitStream!13729 (buf!7925 array!19170) (currentByte!14644 (_ BitVec 32)) (currentBit!14639 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13728)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!312736 (= res!256103 (validate_offset_bits!1 ((_ sign_extend 32) (size!8312 (buf!7925 b1!97))) ((_ sign_extend 32) (currentByte!14644 b1!97)) ((_ sign_extend 32) (currentBit!14639 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!312737 () Bool)

(declare-fun lt!442031 () (_ BitVec 64))

(assert (=> b!312737 (= e!224958 (and (bvsge (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8312 (buf!7925 b1!97)))) (bvadd lt!442031 ((_ sign_extend 32) (currentBit!14639 b1!97)))) b1ValidateOffsetBits!10) (not (= ((_ sign_extend 32) (currentByte!14644 b1!97)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv lt!442031 ((_ sign_extend 32) (currentByte!14644 b1!97)))))))))

(assert (=> b!312737 (= lt!442031 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14644 b1!97))))))

(declare-fun b!312738 () Bool)

(declare-fun e!224960 () Bool)

(declare-fun b2!97 () BitStream!13728)

(declare-fun array_inv!7864 (array!19170) Bool)

(assert (=> b!312738 (= e!224960 (array_inv!7864 (buf!7925 b2!97)))))

(declare-fun b!312739 () Bool)

(declare-fun res!256102 () Bool)

(assert (=> b!312739 (=> (not res!256102) (not e!224958))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!312739 (= res!256102 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8312 (buf!7925 b1!97))) ((_ sign_extend 32) (currentByte!14644 b1!97)) ((_ sign_extend 32) (currentBit!14639 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun res!256101 () Bool)

(assert (=> start!69570 (=> (not res!256101) (not e!224958))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(assert (=> start!69570 (= res!256101 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8312 (buf!7925 b1!97)) (size!8312 (buf!7925 b2!97)))))))

(assert (=> start!69570 e!224958))

(assert (=> start!69570 true))

(declare-fun e!224962 () Bool)

(declare-fun inv!12 (BitStream!13728) Bool)

(assert (=> start!69570 (and (inv!12 b1!97) e!224962)))

(assert (=> start!69570 (and (inv!12 b2!97) e!224960)))

(declare-fun b!312740 () Bool)

(declare-fun res!256100 () Bool)

(assert (=> b!312740 (=> (not res!256100) (not e!224958))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!312740 (= res!256100 (bvsle (bitIndex!0 (size!8312 (buf!7925 b2!97)) (currentByte!14644 b2!97) (currentBit!14639 b2!97)) (bvadd (bitIndex!0 (size!8312 (buf!7925 b1!97)) (currentByte!14644 b1!97) (currentBit!14639 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!312741 () Bool)

(assert (=> b!312741 (= e!224962 (array_inv!7864 (buf!7925 b1!97)))))

(assert (= (and start!69570 res!256101) b!312736))

(assert (= (and b!312736 res!256103) b!312740))

(assert (= (and b!312740 res!256100) b!312739))

(assert (= (and b!312739 res!256102) b!312737))

(assert (= start!69570 b!312741))

(assert (= start!69570 b!312738))

(declare-fun m!450369 () Bool)

(assert (=> b!312738 m!450369))

(declare-fun m!450371 () Bool)

(assert (=> b!312740 m!450371))

(declare-fun m!450373 () Bool)

(assert (=> b!312740 m!450373))

(declare-fun m!450375 () Bool)

(assert (=> b!312741 m!450375))

(declare-fun m!450377 () Bool)

(assert (=> b!312736 m!450377))

(declare-fun m!450379 () Bool)

(assert (=> start!69570 m!450379))

(declare-fun m!450381 () Bool)

(assert (=> start!69570 m!450381))

(declare-fun m!450383 () Bool)

(assert (=> b!312739 m!450383))

(check-sat (not start!69570) (not b!312738) (not b!312740) (not b!312739) (not b!312741) (not b!312736))
(check-sat)
