; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59888 () Bool)

(assert start!59888)

(declare-fun lt!411062 () Bool)

(declare-datatypes ((array!15296 0))(
  ( (array!15297 (arr!7636 (Array (_ BitVec 32) (_ BitVec 8))) (size!6649 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12112 0))(
  ( (BitStream!12113 (buf!7117 array!15296) (currentByte!13130 (_ BitVec 32)) (currentBit!13125 (_ BitVec 32))) )
))
(declare-fun thiss!890 () BitStream!12112)

(declare-fun diffInBits!18 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12112 (_ BitVec 64)) Bool)

(assert (=> start!59888 (= lt!411062 (moveBitIndexPrecond!0 thiss!890 diffInBits!18))))

(assert (=> start!59888 false))

(declare-fun e!193095 () Bool)

(declare-fun inv!12 (BitStream!12112) Bool)

(assert (=> start!59888 (and (inv!12 thiss!890) e!193095)))

(assert (=> start!59888 true))

(declare-fun b!273224 () Bool)

(declare-fun array_inv!6373 (array!15296) Bool)

(assert (=> b!273224 (= e!193095 (array_inv!6373 (buf!7117 thiss!890)))))

(assert (= start!59888 b!273224))

(declare-fun m!406095 () Bool)

(assert (=> start!59888 m!406095))

(declare-fun m!406097 () Bool)

(assert (=> start!59888 m!406097))

(declare-fun m!406099 () Bool)

(assert (=> b!273224 m!406099))

(push 1)

(assert (not b!273224))

(assert (not start!59888))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

