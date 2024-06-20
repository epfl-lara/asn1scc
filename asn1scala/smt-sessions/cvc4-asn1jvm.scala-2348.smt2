; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59892 () Bool)

(assert start!59892)

(declare-fun lt!411068 () Bool)

(declare-datatypes ((array!15300 0))(
  ( (array!15301 (arr!7638 (Array (_ BitVec 32) (_ BitVec 8))) (size!6651 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12116 0))(
  ( (BitStream!12117 (buf!7119 array!15300) (currentByte!13132 (_ BitVec 32)) (currentBit!13127 (_ BitVec 32))) )
))
(declare-fun thiss!890 () BitStream!12116)

(declare-fun diffInBits!18 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12116 (_ BitVec 64)) Bool)

(assert (=> start!59892 (= lt!411068 (moveBitIndexPrecond!0 thiss!890 diffInBits!18))))

(assert (=> start!59892 false))

(declare-fun e!193107 () Bool)

(declare-fun inv!12 (BitStream!12116) Bool)

(assert (=> start!59892 (and (inv!12 thiss!890) e!193107)))

(assert (=> start!59892 true))

(declare-fun b!273230 () Bool)

(declare-fun array_inv!6375 (array!15300) Bool)

(assert (=> b!273230 (= e!193107 (array_inv!6375 (buf!7119 thiss!890)))))

(assert (= start!59892 b!273230))

(declare-fun m!406107 () Bool)

(assert (=> start!59892 m!406107))

(declare-fun m!406109 () Bool)

(assert (=> start!59892 m!406109))

(declare-fun m!406111 () Bool)

(assert (=> b!273230 m!406111))

(push 1)

(assert (not start!59892))

(assert (not b!273230))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

