; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60914 () Bool)

(assert start!60914)

(declare-fun res!228643 () Bool)

(declare-fun e!194741 () Bool)

(assert (=> start!60914 (=> (not res!228643) (not e!194741))))

(declare-datatypes ((array!15607 0))(
  ( (array!15608 (arr!7749 (Array (_ BitVec 32) (_ BitVec 8))) (size!6762 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12338 0))(
  ( (BitStream!12339 (buf!7230 array!15607) (currentByte!13377 (_ BitVec 32)) (currentBit!13372 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12338)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12338 (_ BitVec 64)) Bool)

(assert (=> start!60914 (= res!228643 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60914 e!194741))

(declare-fun e!194743 () Bool)

(declare-fun inv!12 (BitStream!12338) Bool)

(assert (=> start!60914 (and (inv!12 thiss!882) e!194743)))

(assert (=> start!60914 true))

(declare-fun lt!413204 () (_ BitVec 32))

(declare-fun b!274862 () Bool)

(declare-fun lt!413203 () (_ BitVec 32))

(assert (=> b!274862 (= e!194741 (and (bvsge lt!413203 #b00000000000000000000000000000000) (bvslt lt!413203 #b00000000000000000000000000001000) (= (bvand (currentBit!13372 thiss!882) #b10000000000000000000000000000000) (bvand lt!413204 #b10000000000000000000000000000000)) (not (= (bvand (currentBit!13372 thiss!882) #b10000000000000000000000000000000) (bvand lt!413203 #b10000000000000000000000000000000)))))))

(assert (=> b!274862 (= lt!413203 (bvadd (currentBit!13372 thiss!882) lt!413204))))

(assert (=> b!274862 (= lt!413204 ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!274863 () Bool)

(declare-fun array_inv!6486 (array!15607) Bool)

(assert (=> b!274863 (= e!194743 (array_inv!6486 (buf!7230 thiss!882)))))

(assert (= (and start!60914 res!228643) b!274862))

(assert (= start!60914 b!274863))

(declare-fun m!407459 () Bool)

(assert (=> start!60914 m!407459))

(declare-fun m!407461 () Bool)

(assert (=> start!60914 m!407461))

(declare-fun m!407463 () Bool)

(assert (=> b!274863 m!407463))

(push 1)

