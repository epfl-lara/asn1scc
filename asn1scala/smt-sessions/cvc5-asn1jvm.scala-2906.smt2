; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69556 () Bool)

(assert start!69556)

(declare-fun b!312610 () Bool)

(declare-fun e!224856 () Bool)

(declare-datatypes ((array!19156 0))(
  ( (array!19157 (arr!9385 (Array (_ BitVec 32) (_ BitVec 8))) (size!8305 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13714 0))(
  ( (BitStream!13715 (buf!7918 array!19156) (currentByte!14637 (_ BitVec 32)) (currentBit!14632 (_ BitVec 32))) )
))
(declare-fun b2!97 () BitStream!13714)

(declare-fun array_inv!7857 (array!19156) Bool)

(assert (=> b!312610 (= e!224856 (array_inv!7857 (buf!7918 b2!97)))))

(declare-fun b!312611 () Bool)

(declare-fun res!256019 () Bool)

(declare-fun e!224857 () Bool)

(assert (=> b!312611 (=> (not res!256019) (not e!224857))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun b1!97 () BitStream!13714)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!312611 (= res!256019 (bvsle (bitIndex!0 (size!8305 (buf!7918 b2!97)) (currentByte!14637 b2!97) (currentBit!14632 b2!97)) (bvadd (bitIndex!0 (size!8305 (buf!7918 b1!97)) (currentByte!14637 b1!97) (currentBit!14632 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!312612 () Bool)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(assert (=> b!312612 (= e!224857 (and (bvsge (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8305 (buf!7918 b1!97)))) (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14637 b1!97))) ((_ sign_extend 32) (currentBit!14632 b1!97)))) b1ValidateOffsetBits!10) (not (= ((_ sign_extend 32) (currentByte!14637 b2!97)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14637 b2!97))) ((_ sign_extend 32) (currentByte!14637 b2!97)))))))))

(declare-fun b!312613 () Bool)

(declare-fun res!256018 () Bool)

(assert (=> b!312613 (=> (not res!256018) (not e!224857))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!312613 (= res!256018 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8305 (buf!7918 b1!97))) ((_ sign_extend 32) (currentByte!14637 b1!97)) ((_ sign_extend 32) (currentBit!14632 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun b!312614 () Bool)

(declare-fun e!224853 () Bool)

(assert (=> b!312614 (= e!224853 (array_inv!7857 (buf!7918 b1!97)))))

(declare-fun b!312615 () Bool)

(declare-fun res!256016 () Bool)

(assert (=> b!312615 (=> (not res!256016) (not e!224857))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!312615 (= res!256016 (validate_offset_bits!1 ((_ sign_extend 32) (size!8305 (buf!7918 b1!97))) ((_ sign_extend 32) (currentByte!14637 b1!97)) ((_ sign_extend 32) (currentBit!14632 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun res!256017 () Bool)

(assert (=> start!69556 (=> (not res!256017) (not e!224857))))

(assert (=> start!69556 (= res!256017 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8305 (buf!7918 b1!97)) (size!8305 (buf!7918 b2!97)))))))

(assert (=> start!69556 e!224857))

(assert (=> start!69556 true))

(declare-fun inv!12 (BitStream!13714) Bool)

(assert (=> start!69556 (and (inv!12 b1!97) e!224853)))

(assert (=> start!69556 (and (inv!12 b2!97) e!224856)))

(assert (= (and start!69556 res!256017) b!312615))

(assert (= (and b!312615 res!256016) b!312611))

(assert (= (and b!312611 res!256019) b!312613))

(assert (= (and b!312613 res!256018) b!312612))

(assert (= start!69556 b!312614))

(assert (= start!69556 b!312610))

(declare-fun m!450257 () Bool)

(assert (=> start!69556 m!450257))

(declare-fun m!450259 () Bool)

(assert (=> start!69556 m!450259))

(declare-fun m!450261 () Bool)

(assert (=> b!312615 m!450261))

(declare-fun m!450263 () Bool)

(assert (=> b!312610 m!450263))

(declare-fun m!450265 () Bool)

(assert (=> b!312613 m!450265))

(declare-fun m!450267 () Bool)

(assert (=> b!312614 m!450267))

(declare-fun m!450269 () Bool)

(assert (=> b!312611 m!450269))

(declare-fun m!450271 () Bool)

(assert (=> b!312611 m!450271))

(push 1)

(assert (not b!312610))

(assert (not start!69556))

(assert (not b!312614))

(assert (not b!312613))

(assert (not b!312611))

(assert (not b!312615))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

