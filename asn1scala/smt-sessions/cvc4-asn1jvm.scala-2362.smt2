; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60268 () Bool)

(assert start!60268)

(declare-fun res!227887 () Bool)

(declare-fun e!193748 () Bool)

(assert (=> start!60268 (=> (not res!227887) (not e!193748))))

(declare-datatypes ((array!15415 0))(
  ( (array!15416 (arr!7680 (Array (_ BitVec 32) (_ BitVec 8))) (size!6693 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12200 0))(
  ( (BitStream!12201 (buf!7161 array!15415) (currentByte!13214 (_ BitVec 32)) (currentBit!13209 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12200)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12200 (_ BitVec 64)) Bool)

(assert (=> start!60268 (= res!227887 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60268 e!193748))

(declare-fun e!193749 () Bool)

(declare-fun inv!12 (BitStream!12200) Bool)

(assert (=> start!60268 (and (inv!12 thiss!882) e!193749)))

(assert (=> start!60268 true))

(declare-fun b!273846 () Bool)

(assert (=> b!273846 (= e!193748 (and (bvslt (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000)))))

(declare-fun b!273847 () Bool)

(declare-fun array_inv!6417 (array!15415) Bool)

(assert (=> b!273847 (= e!193749 (array_inv!6417 (buf!7161 thiss!882)))))

(assert (= (and start!60268 res!227887) b!273846))

(assert (= start!60268 b!273847))

(declare-fun m!406623 () Bool)

(assert (=> start!60268 m!406623))

(declare-fun m!406625 () Bool)

(assert (=> start!60268 m!406625))

(declare-fun m!406627 () Bool)

(assert (=> b!273847 m!406627))

(push 1)

(assert (not b!273847))

(assert (not start!60268))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

