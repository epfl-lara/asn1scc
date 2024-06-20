; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60238 () Bool)

(assert start!60238)

(declare-fun lt!411848 () Bool)

(declare-datatypes ((array!15400 0))(
  ( (array!15401 (arr!7674 (Array (_ BitVec 32) (_ BitVec 8))) (size!6687 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12188 0))(
  ( (BitStream!12189 (buf!7155 array!15400) (currentByte!13208 (_ BitVec 32)) (currentBit!13203 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12188)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12188 (_ BitVec 64)) Bool)

(assert (=> start!60238 (= lt!411848 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60238 false))

(declare-fun e!193686 () Bool)

(declare-fun inv!12 (BitStream!12188) Bool)

(assert (=> start!60238 (and (inv!12 thiss!882) e!193686)))

(assert (=> start!60238 true))

(declare-fun b!273799 () Bool)

(declare-fun array_inv!6411 (array!15400) Bool)

(assert (=> b!273799 (= e!193686 (array_inv!6411 (buf!7155 thiss!882)))))

(assert (= start!60238 b!273799))

(declare-fun m!406575 () Bool)

(assert (=> start!60238 m!406575))

(declare-fun m!406577 () Bool)

(assert (=> start!60238 m!406577))

(declare-fun m!406579 () Bool)

(assert (=> b!273799 m!406579))

(push 1)

(assert (not b!273799))

(assert (not start!60238))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

