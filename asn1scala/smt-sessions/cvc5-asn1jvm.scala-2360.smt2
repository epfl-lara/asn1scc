; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60234 () Bool)

(assert start!60234)

(declare-fun lt!411842 () Bool)

(declare-datatypes ((array!15396 0))(
  ( (array!15397 (arr!7672 (Array (_ BitVec 32) (_ BitVec 8))) (size!6685 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12184 0))(
  ( (BitStream!12185 (buf!7153 array!15396) (currentByte!13206 (_ BitVec 32)) (currentBit!13201 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12184)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12184 (_ BitVec 64)) Bool)

(assert (=> start!60234 (= lt!411842 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60234 false))

(declare-fun e!193674 () Bool)

(declare-fun inv!12 (BitStream!12184) Bool)

(assert (=> start!60234 (and (inv!12 thiss!882) e!193674)))

(assert (=> start!60234 true))

(declare-fun b!273793 () Bool)

(declare-fun array_inv!6409 (array!15396) Bool)

(assert (=> b!273793 (= e!193674 (array_inv!6409 (buf!7153 thiss!882)))))

(assert (= start!60234 b!273793))

(declare-fun m!406563 () Bool)

(assert (=> start!60234 m!406563))

(declare-fun m!406565 () Bool)

(assert (=> start!60234 m!406565))

(declare-fun m!406567 () Bool)

(assert (=> b!273793 m!406567))

(push 1)

(assert (not start!60234))

(assert (not b!273793))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

