; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60910 () Bool)

(assert start!60910)

(declare-fun res!228637 () Bool)

(declare-fun e!194724 () Bool)

(assert (=> start!60910 (=> (not res!228637) (not e!194724))))

(declare-datatypes ((array!15603 0))(
  ( (array!15604 (arr!7747 (Array (_ BitVec 32) (_ BitVec 8))) (size!6760 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12334 0))(
  ( (BitStream!12335 (buf!7228 array!15603) (currentByte!13375 (_ BitVec 32)) (currentBit!13370 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12334)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12334 (_ BitVec 64)) Bool)

(assert (=> start!60910 (= res!228637 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60910 e!194724))

(declare-fun e!194725 () Bool)

(declare-fun inv!12 (BitStream!12334) Bool)

(assert (=> start!60910 (and (inv!12 thiss!882) e!194725)))

(assert (=> start!60910 true))

(declare-fun lt!413192 () (_ BitVec 32))

(declare-fun lt!413191 () (_ BitVec 32))

(declare-fun b!274850 () Bool)

(assert (=> b!274850 (= e!194724 (and (bvsge lt!413191 #b00000000000000000000000000000000) (bvslt lt!413191 #b00000000000000000000000000001000) (= (bvand (currentBit!13370 thiss!882) #b10000000000000000000000000000000) (bvand lt!413192 #b10000000000000000000000000000000)) (not (= (bvand (currentBit!13370 thiss!882) #b10000000000000000000000000000000) (bvand lt!413191 #b10000000000000000000000000000000)))))))

(assert (=> b!274850 (= lt!413191 (bvadd (currentBit!13370 thiss!882) lt!413192))))

(assert (=> b!274850 (= lt!413192 ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!274851 () Bool)

(declare-fun array_inv!6484 (array!15603) Bool)

(assert (=> b!274851 (= e!194725 (array_inv!6484 (buf!7228 thiss!882)))))

(assert (= (and start!60910 res!228637) b!274850))

(assert (= start!60910 b!274851))

(declare-fun m!407447 () Bool)

(assert (=> start!60910 m!407447))

(declare-fun m!407449 () Bool)

(assert (=> start!60910 m!407449))

(declare-fun m!407451 () Bool)

(assert (=> b!274851 m!407451))

(push 1)

(assert (not start!60910))

(assert (not b!274851))

(check-sat)

