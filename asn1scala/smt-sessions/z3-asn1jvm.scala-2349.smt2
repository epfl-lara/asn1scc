; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59896 () Bool)

(assert start!59896)

(declare-fun res!227434 () Bool)

(declare-fun e!193126 () Bool)

(assert (=> start!59896 (=> (not res!227434) (not e!193126))))

(declare-datatypes ((array!15304 0))(
  ( (array!15305 (arr!7640 (Array (_ BitVec 32) (_ BitVec 8))) (size!6653 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12120 0))(
  ( (BitStream!12121 (buf!7121 array!15304) (currentByte!13134 (_ BitVec 32)) (currentBit!13129 (_ BitVec 32))) )
))
(declare-fun thiss!890 () BitStream!12120)

(declare-fun diffInBits!18 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12120 (_ BitVec 64)) Bool)

(assert (=> start!59896 (= res!227434 (moveBitIndexPrecond!0 thiss!890 diffInBits!18))))

(assert (=> start!59896 e!193126))

(declare-fun e!193125 () Bool)

(declare-fun inv!12 (BitStream!12120) Bool)

(assert (=> start!59896 (and (inv!12 thiss!890) e!193125)))

(assert (=> start!59896 true))

(declare-fun b!273241 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!273241 (= e!193126 (not (invariant!0 (currentBit!13129 thiss!890) (currentByte!13134 thiss!890) (size!6653 (buf!7121 thiss!890)))))))

(declare-datatypes ((Unit!19273 0))(
  ( (Unit!19274) )
))
(declare-datatypes ((tuple2!22408 0))(
  ( (tuple2!22409 (_1!12236 Unit!19273) (_2!12236 BitStream!12120)) )
))
(declare-fun lt!411074 () tuple2!22408)

(declare-fun moveBitIndex!0 (BitStream!12120 (_ BitVec 64)) tuple2!22408)

(assert (=> b!273241 (= lt!411074 (moveBitIndex!0 thiss!890 diffInBits!18))))

(declare-fun b!273242 () Bool)

(declare-fun array_inv!6377 (array!15304) Bool)

(assert (=> b!273242 (= e!193125 (array_inv!6377 (buf!7121 thiss!890)))))

(assert (= (and start!59896 res!227434) b!273241))

(assert (= start!59896 b!273242))

(declare-fun m!406123 () Bool)

(assert (=> start!59896 m!406123))

(declare-fun m!406125 () Bool)

(assert (=> start!59896 m!406125))

(declare-fun m!406127 () Bool)

(assert (=> b!273241 m!406127))

(declare-fun m!406129 () Bool)

(assert (=> b!273241 m!406129))

(declare-fun m!406131 () Bool)

(assert (=> b!273242 m!406131))

(check-sat (not b!273242) (not start!59896) (not b!273241))
(check-sat)
(get-model)

