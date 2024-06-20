; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60518 () Bool)

(assert start!60518)

(declare-fun res!228148 () Bool)

(declare-fun e!194116 () Bool)

(assert (=> start!60518 (=> (not res!228148) (not e!194116))))

(declare-datatypes ((array!15492 0))(
  ( (array!15493 (arr!7708 (Array (_ BitVec 32) (_ BitVec 8))) (size!6721 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12256 0))(
  ( (BitStream!12257 (buf!7189 array!15492) (currentByte!13278 (_ BitVec 32)) (currentBit!13273 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12256)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12256 (_ BitVec 64)) Bool)

(assert (=> start!60518 (= res!228148 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60518 e!194116))

(declare-fun e!194114 () Bool)

(declare-fun inv!12 (BitStream!12256) Bool)

(assert (=> start!60518 (and (inv!12 thiss!882) e!194114)))

(assert (=> start!60518 true))

(declare-fun b!274211 () Bool)

(declare-fun lt!412289 () (_ BitVec 32))

(assert (=> b!274211 (= e!194116 (and (bvslt (bvadd (currentBit!13273 thiss!882) lt!412289) #b00000000000000000000000000000000) (= #b00000000000000000000000000000000 (bvand lt!412289 #b10000000000000000000000000000000)) (not (= #b00000000000000000000000000000000 (bvand (bvadd #b00000000000000000000000000001000 lt!412289) #b10000000000000000000000000000000)))))))

(assert (=> b!274211 (= lt!412289 ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!274212 () Bool)

(declare-fun array_inv!6445 (array!15492) Bool)

(assert (=> b!274212 (= e!194114 (array_inv!6445 (buf!7189 thiss!882)))))

(assert (= (and start!60518 res!228148) b!274211))

(assert (= start!60518 b!274212))

(declare-fun m!406943 () Bool)

(assert (=> start!60518 m!406943))

(declare-fun m!406945 () Bool)

(assert (=> start!60518 m!406945))

(declare-fun m!406947 () Bool)

(assert (=> b!274212 m!406947))

(push 1)

(assert (not start!60518))

(assert (not b!274212))

(check-sat)

(pop 1)

(push 1)

(check-sat)

