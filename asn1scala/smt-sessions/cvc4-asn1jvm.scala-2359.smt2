; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60232 () Bool)

(assert start!60232)

(declare-fun lt!411839 () Bool)

(declare-datatypes ((array!15394 0))(
  ( (array!15395 (arr!7671 (Array (_ BitVec 32) (_ BitVec 8))) (size!6684 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12182 0))(
  ( (BitStream!12183 (buf!7152 array!15394) (currentByte!13205 (_ BitVec 32)) (currentBit!13200 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12182)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12182 (_ BitVec 64)) Bool)

(assert (=> start!60232 (= lt!411839 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60232 false))

(declare-fun e!193668 () Bool)

(declare-fun inv!12 (BitStream!12182) Bool)

(assert (=> start!60232 (and (inv!12 thiss!882) e!193668)))

(assert (=> start!60232 true))

(declare-fun b!273790 () Bool)

(declare-fun array_inv!6408 (array!15394) Bool)

(assert (=> b!273790 (= e!193668 (array_inv!6408 (buf!7152 thiss!882)))))

(assert (= start!60232 b!273790))

(declare-fun m!406557 () Bool)

(assert (=> start!60232 m!406557))

(declare-fun m!406559 () Bool)

(assert (=> start!60232 m!406559))

(declare-fun m!406561 () Bool)

(assert (=> b!273790 m!406561))

(push 1)

(assert (not b!273790))

(assert (not start!60232))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

