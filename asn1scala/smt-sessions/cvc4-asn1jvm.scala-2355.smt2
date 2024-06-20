; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60108 () Bool)

(assert start!60108)

(declare-fun res!227736 () Bool)

(declare-fun e!193492 () Bool)

(assert (=> start!60108 (=> (not res!227736) (not e!193492))))

(declare-datatypes ((array!15359 0))(
  ( (array!15360 (arr!7659 (Array (_ BitVec 32) (_ BitVec 8))) (size!6672 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12158 0))(
  ( (BitStream!12159 (buf!7140 array!15359) (currentByte!13176 (_ BitVec 32)) (currentBit!13171 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12158)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12158 (_ BitVec 64)) Bool)

(assert (=> start!60108 (= res!227736 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60108 e!193492))

(declare-fun e!193490 () Bool)

(declare-fun inv!12 (BitStream!12158) Bool)

(assert (=> start!60108 (and (inv!12 thiss!882) e!193490)))

(assert (=> start!60108 true))

(declare-fun b!273618 () Bool)

(declare-fun e!193489 () Bool)

(assert (=> b!273618 (= e!193492 e!193489)))

(declare-fun res!227737 () Bool)

(assert (=> b!273618 (=> (not res!227737) (not e!193489))))

(declare-fun lt!411662 () (_ BitVec 32))

(assert (=> b!273618 (= res!227737 (and (bvsge lt!411662 #b00000000000000000000000000000000) (bvsge lt!411662 #b00000000000000000000000000001000)))))

(assert (=> b!273618 (= lt!411662 (bvadd (currentBit!13171 thiss!882) ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!273619 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!273619 (= e!193489 (not (invariant!0 (currentBit!13171 thiss!882) (currentByte!13176 thiss!882) (size!6672 (buf!7140 thiss!882)))))))

(declare-fun b!273620 () Bool)

(declare-fun array_inv!6396 (array!15359) Bool)

(assert (=> b!273620 (= e!193490 (array_inv!6396 (buf!7140 thiss!882)))))

(assert (= (and start!60108 res!227736) b!273618))

(assert (= (and b!273618 res!227737) b!273619))

(assert (= start!60108 b!273620))

(declare-fun m!406419 () Bool)

(assert (=> start!60108 m!406419))

(declare-fun m!406421 () Bool)

(assert (=> start!60108 m!406421))

(declare-fun m!406423 () Bool)

(assert (=> b!273619 m!406423))

(declare-fun m!406425 () Bool)

(assert (=> b!273620 m!406425))

(push 1)

(assert (not b!273619))

(assert (not b!273620))

(assert (not start!60108))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93688 () Bool)

