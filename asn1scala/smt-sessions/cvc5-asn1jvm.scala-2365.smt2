; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60296 () Bool)

(assert start!60296)

(declare-fun res!227905 () Bool)

(declare-fun e!193808 () Bool)

(assert (=> start!60296 (=> (not res!227905) (not e!193808))))

(declare-datatypes ((array!15432 0))(
  ( (array!15433 (arr!7687 (Array (_ BitVec 32) (_ BitVec 8))) (size!6700 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12214 0))(
  ( (BitStream!12215 (buf!7168 array!15432) (currentByte!13221 (_ BitVec 32)) (currentBit!13216 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12214)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12214 (_ BitVec 64)) Bool)

(assert (=> start!60296 (= res!227905 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60296 e!193808))

(declare-fun e!193809 () Bool)

(declare-fun inv!12 (BitStream!12214) Bool)

(assert (=> start!60296 (and (inv!12 thiss!882) e!193809)))

(assert (=> start!60296 true))

(declare-fun b!273887 () Bool)

(assert (=> b!273887 (= e!193808 (and (bvslt (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000)))))

(declare-fun b!273888 () Bool)

(declare-fun array_inv!6424 (array!15432) Bool)

(assert (=> b!273888 (= e!193809 (array_inv!6424 (buf!7168 thiss!882)))))

(assert (= (and start!60296 res!227905) b!273887))

(assert (= start!60296 b!273888))

(declare-fun m!406673 () Bool)

(assert (=> start!60296 m!406673))

(declare-fun m!406675 () Bool)

(assert (=> start!60296 m!406675))

(declare-fun m!406677 () Bool)

(assert (=> b!273888 m!406677))

(push 1)

(assert (not b!273888))

(assert (not start!60296))

(check-sat)

