; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60170 () Bool)

(assert start!60170)

(declare-fun res!227796 () Bool)

(declare-fun e!193566 () Bool)

(assert (=> start!60170 (=> (not res!227796) (not e!193566))))

(declare-datatypes ((array!15373 0))(
  ( (array!15374 (arr!7663 (Array (_ BitVec 32) (_ BitVec 8))) (size!6676 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12166 0))(
  ( (BitStream!12167 (buf!7144 array!15373) (currentByte!13189 (_ BitVec 32)) (currentBit!13184 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12166)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12166 (_ BitVec 64)) Bool)

(assert (=> start!60170 (= res!227796 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60170 e!193566))

(declare-fun e!193564 () Bool)

(declare-fun inv!12 (BitStream!12166) Bool)

(assert (=> start!60170 (and (inv!12 thiss!882) e!193564)))

(assert (=> start!60170 true))

(declare-fun b!273696 () Bool)

(declare-fun e!193567 () Bool)

(assert (=> b!273696 (= e!193566 e!193567)))

(declare-fun res!227797 () Bool)

(assert (=> b!273696 (=> (not res!227797) (not e!193567))))

(declare-fun lt!411746 () (_ BitVec 32))

(assert (=> b!273696 (= res!227797 (and (bvsge lt!411746 #b00000000000000000000000000000000) (bvslt lt!411746 #b00000000000000000000000000001000)))))

(assert (=> b!273696 (= lt!411746 (bvadd (currentBit!13184 thiss!882) ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!273697 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!273697 (= e!193567 (not (invariant!0 (currentBit!13184 thiss!882) (currentByte!13189 thiss!882) (size!6676 (buf!7144 thiss!882)))))))

(declare-fun b!273698 () Bool)

(declare-fun array_inv!6400 (array!15373) Bool)

(assert (=> b!273698 (= e!193564 (array_inv!6400 (buf!7144 thiss!882)))))

(assert (= (and start!60170 res!227796) b!273696))

(assert (= (and b!273696 res!227797) b!273697))

(assert (= start!60170 b!273698))

(declare-fun m!406475 () Bool)

(assert (=> start!60170 m!406475))

(declare-fun m!406477 () Bool)

(assert (=> start!60170 m!406477))

(declare-fun m!406479 () Bool)

(assert (=> b!273697 m!406479))

(declare-fun m!406481 () Bool)

(assert (=> b!273698 m!406481))

(push 1)

(assert (not b!273697))

(assert (not b!273698))

(assert (not start!60170))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93742 () Bool)

(assert (=> d!93742 (= (invariant!0 (currentBit!13184 thiss!882) (currentByte!13189 thiss!882) (size!6676 (buf!7144 thiss!882))) (and (bvsge (currentBit!13184 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13184 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13189 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13189 thiss!882) (size!6676 (buf!7144 thiss!882))) (and (= (currentBit!13184 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13189 thiss!882) (size!6676 (buf!7144 thiss!882)))))))))

(assert (=> b!273697 d!93742))

(declare-fun d!93746 () Bool)

(assert (=> d!93746 (= (array_inv!6400 (buf!7144 thiss!882)) (bvsge (size!6676 (buf!7144 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!273698 d!93746))

(declare-fun d!93750 () Bool)

(declare-fun res!227815 () Bool)

(declare-fun e!193597 () Bool)

(assert (=> d!93750 (=> (not res!227815) (not e!193597))))

(assert (=> d!93750 (= res!227815 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6676 (buf!7144 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6676 (buf!7144 thiss!882)))))))))

(assert (=> d!93750 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!193597)))

(declare-fun b!273724 () Bool)

(declare-fun lt!411758 () (_ BitVec 64))

(assert (=> b!273724 (= e!193597 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411758) (bvsle lt!411758 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6676 (buf!7144 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!273724 (= lt!411758 (bvadd (bitIndex!0 (size!6676 (buf!7144 thiss!882)) (currentByte!13189 thiss!882) (currentBit!13184 thiss!882)) diffInBits!15))))

(assert (= (and d!93750 res!227815) b!273724))

(declare-fun m!406501 () Bool)

(assert (=> b!273724 m!406501))

(assert (=> start!60170 d!93750))

(declare-fun d!93754 () Bool)

(assert (=> d!93754 (= (inv!12 thiss!882) (invariant!0 (currentBit!13184 thiss!882) (currentByte!13189 thiss!882) (size!6676 (buf!7144 thiss!882))))))

(declare-fun bs!23618 () Bool)

(assert (= bs!23618 d!93754))

(assert (=> bs!23618 m!406479))

(assert (=> start!60170 d!93754))

(push 1)

(assert (not b!273724))

(assert (not d!93754))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

