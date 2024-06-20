; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60736 () Bool)

(assert start!60736)

(declare-fun res!228412 () Bool)

(declare-fun e!194451 () Bool)

(assert (=> start!60736 (=> (not res!228412) (not e!194451))))

(declare-datatypes ((array!15556 0))(
  ( (array!15557 (arr!7731 (Array (_ BitVec 32) (_ BitVec 8))) (size!6744 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12302 0))(
  ( (BitStream!12303 (buf!7212 array!15556) (currentByte!13333 (_ BitVec 32)) (currentBit!13328 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12302)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12302 (_ BitVec 64)) Bool)

(assert (=> start!60736 (= res!228412 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60736 e!194451))

(declare-fun e!194452 () Bool)

(declare-fun inv!12 (BitStream!12302) Bool)

(assert (=> start!60736 (and (inv!12 thiss!882) e!194452)))

(assert (=> start!60736 true))

(declare-fun b!274562 () Bool)

(declare-fun lt!412781 () (_ BitVec 32))

(assert (=> b!274562 (= e!194451 (and (bvsge lt!412781 #b00000000000000000000000000000000) (bvsge lt!412781 #b00000000000000000000000000001000) (let ((bdg!16597 (bvand lt!412781 #b10000000000000000000000000000000))) (and (not (= bdg!16597 #b00000000000000000000000000000000)) (not (= bdg!16597 (bvand (bvsub lt!412781 #b00000000000000000000000000001000) #b10000000000000000000000000000000)))))))))

(assert (=> b!274562 (= lt!412781 (bvadd (currentBit!13328 thiss!882) ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!274563 () Bool)

(declare-fun array_inv!6468 (array!15556) Bool)

(assert (=> b!274563 (= e!194452 (array_inv!6468 (buf!7212 thiss!882)))))

(assert (= (and start!60736 res!228412) b!274562))

(assert (= start!60736 b!274563))

(declare-fun m!407219 () Bool)

(assert (=> start!60736 m!407219))

(declare-fun m!407221 () Bool)

(assert (=> start!60736 m!407221))

(declare-fun m!407223 () Bool)

(assert (=> b!274563 m!407223))

(push 1)

(assert (not b!274563))

(assert (not start!60736))

(check-sat)

(pop 1)

