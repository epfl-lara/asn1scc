; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60284 () Bool)

(assert start!60284)

(declare-fun lt!411866 () Bool)

(declare-datatypes ((array!15420 0))(
  ( (array!15421 (arr!7681 (Array (_ BitVec 32) (_ BitVec 8))) (size!6694 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12202 0))(
  ( (BitStream!12203 (buf!7162 array!15420) (currentByte!13215 (_ BitVec 32)) (currentBit!13210 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12202)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12202 (_ BitVec 64)) Bool)

(assert (=> start!60284 (= lt!411866 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60284 false))

(declare-fun e!193761 () Bool)

(declare-fun inv!12 (BitStream!12202) Bool)

(assert (=> start!60284 (and (inv!12 thiss!882) e!193761)))

(assert (=> start!60284 true))

(declare-fun b!273858 () Bool)

(declare-fun array_inv!6418 (array!15420) Bool)

(assert (=> b!273858 (= e!193761 (array_inv!6418 (buf!7162 thiss!882)))))

(assert (= start!60284 b!273858))

(declare-fun m!406637 () Bool)

(assert (=> start!60284 m!406637))

(declare-fun m!406639 () Bool)

(assert (=> start!60284 m!406639))

(declare-fun m!406641 () Bool)

(assert (=> b!273858 m!406641))

(push 1)

(assert (not b!273858))

(assert (not start!60284))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

