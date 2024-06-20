; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60732 () Bool)

(assert start!60732)

(declare-fun res!228406 () Bool)

(declare-fun e!194433 () Bool)

(assert (=> start!60732 (=> (not res!228406) (not e!194433))))

(declare-datatypes ((array!15552 0))(
  ( (array!15553 (arr!7729 (Array (_ BitVec 32) (_ BitVec 8))) (size!6742 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12298 0))(
  ( (BitStream!12299 (buf!7210 array!15552) (currentByte!13331 (_ BitVec 32)) (currentBit!13326 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12298)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12298 (_ BitVec 64)) Bool)

(assert (=> start!60732 (= res!228406 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60732 e!194433))

(declare-fun e!194434 () Bool)

(declare-fun inv!12 (BitStream!12298) Bool)

(assert (=> start!60732 (and (inv!12 thiss!882) e!194434)))

(assert (=> start!60732 true))

(declare-fun b!274550 () Bool)

(declare-fun lt!412775 () (_ BitVec 32))

(assert (=> b!274550 (= e!194433 (and (bvsge lt!412775 #b00000000000000000000000000000000) (bvsge lt!412775 #b00000000000000000000000000001000) (let ((bdg!16597 (bvand lt!412775 #b10000000000000000000000000000000))) (and (not (= bdg!16597 #b00000000000000000000000000000000)) (not (= bdg!16597 (bvand (bvsub lt!412775 #b00000000000000000000000000001000) #b10000000000000000000000000000000)))))))))

(assert (=> b!274550 (= lt!412775 (bvadd (currentBit!13326 thiss!882) ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!274551 () Bool)

(declare-fun array_inv!6466 (array!15552) Bool)

(assert (=> b!274551 (= e!194434 (array_inv!6466 (buf!7210 thiss!882)))))

(assert (= (and start!60732 res!228406) b!274550))

(assert (= start!60732 b!274551))

(declare-fun m!407207 () Bool)

(assert (=> start!60732 m!407207))

(declare-fun m!407209 () Bool)

(assert (=> start!60732 m!407209))

(declare-fun m!407211 () Bool)

(assert (=> b!274551 m!407211))

(push 1)

(assert (not b!274551))

(assert (not start!60732))

(check-sat)

(pop 1)

(push 1)

(check-sat)

