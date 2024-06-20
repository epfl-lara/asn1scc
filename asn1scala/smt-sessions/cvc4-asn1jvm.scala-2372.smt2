; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60522 () Bool)

(assert start!60522)

(declare-fun res!228154 () Bool)

(declare-fun e!194134 () Bool)

(assert (=> start!60522 (=> (not res!228154) (not e!194134))))

(declare-datatypes ((array!15496 0))(
  ( (array!15497 (arr!7710 (Array (_ BitVec 32) (_ BitVec 8))) (size!6723 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12260 0))(
  ( (BitStream!12261 (buf!7191 array!15496) (currentByte!13280 (_ BitVec 32)) (currentBit!13275 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12260)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12260 (_ BitVec 64)) Bool)

(assert (=> start!60522 (= res!228154 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60522 e!194134))

(declare-fun e!194132 () Bool)

(declare-fun inv!12 (BitStream!12260) Bool)

(assert (=> start!60522 (and (inv!12 thiss!882) e!194132)))

(assert (=> start!60522 true))

(declare-fun b!274223 () Bool)

(declare-fun lt!412295 () (_ BitVec 32))

(assert (=> b!274223 (= e!194134 (and (bvslt (bvadd (currentBit!13275 thiss!882) lt!412295) #b00000000000000000000000000000000) (= #b00000000000000000000000000000000 (bvand lt!412295 #b10000000000000000000000000000000)) (not (= #b00000000000000000000000000000000 (bvand (bvadd #b00000000000000000000000000001000 lt!412295) #b10000000000000000000000000000000)))))))

(assert (=> b!274223 (= lt!412295 ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!274224 () Bool)

(declare-fun array_inv!6447 (array!15496) Bool)

(assert (=> b!274224 (= e!194132 (array_inv!6447 (buf!7191 thiss!882)))))

(assert (= (and start!60522 res!228154) b!274223))

(assert (= start!60522 b!274224))

(declare-fun m!406955 () Bool)

(assert (=> start!60522 m!406955))

(declare-fun m!406957 () Bool)

(assert (=> start!60522 m!406957))

(declare-fun m!406959 () Bool)

(assert (=> b!274224 m!406959))

(push 1)

(assert (not start!60522))

(assert (not b!274224))

(check-sat)

(pop 1)

(push 1)

(check-sat)

