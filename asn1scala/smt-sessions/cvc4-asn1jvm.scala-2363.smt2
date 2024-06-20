; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60288 () Bool)

(assert start!60288)

(declare-fun lt!411872 () Bool)

(declare-datatypes ((array!15424 0))(
  ( (array!15425 (arr!7683 (Array (_ BitVec 32) (_ BitVec 8))) (size!6696 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12206 0))(
  ( (BitStream!12207 (buf!7164 array!15424) (currentByte!13217 (_ BitVec 32)) (currentBit!13212 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12206)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12206 (_ BitVec 64)) Bool)

(assert (=> start!60288 (= lt!411872 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60288 false))

(declare-fun e!193773 () Bool)

(declare-fun inv!12 (BitStream!12206) Bool)

(assert (=> start!60288 (and (inv!12 thiss!882) e!193773)))

(assert (=> start!60288 true))

(declare-fun b!273864 () Bool)

(declare-fun array_inv!6420 (array!15424) Bool)

(assert (=> b!273864 (= e!193773 (array_inv!6420 (buf!7164 thiss!882)))))

(assert (= start!60288 b!273864))

(declare-fun m!406649 () Bool)

(assert (=> start!60288 m!406649))

(declare-fun m!406651 () Bool)

(assert (=> start!60288 m!406651))

(declare-fun m!406653 () Bool)

(assert (=> b!273864 m!406653))

(push 1)

(assert (not start!60288))

(assert (not b!273864))

(check-sat)

