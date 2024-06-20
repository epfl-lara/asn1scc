; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60244 () Bool)

(assert start!60244)

(declare-fun res!227869 () Bool)

(declare-fun e!193712 () Bool)

(assert (=> start!60244 (=> (not res!227869) (not e!193712))))

(declare-datatypes ((array!15406 0))(
  ( (array!15407 (arr!7677 (Array (_ BitVec 32) (_ BitVec 8))) (size!6690 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12194 0))(
  ( (BitStream!12195 (buf!7158 array!15406) (currentByte!13211 (_ BitVec 32)) (currentBit!13206 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12194)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12194 (_ BitVec 64)) Bool)

(assert (=> start!60244 (= res!227869 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60244 e!193712))

(declare-fun e!193713 () Bool)

(declare-fun inv!12 (BitStream!12194) Bool)

(assert (=> start!60244 (and (inv!12 thiss!882) e!193713)))

(assert (=> start!60244 true))

(declare-fun b!273816 () Bool)

(assert (=> b!273816 (= e!193712 (bvsge (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))

(declare-fun b!273817 () Bool)

(declare-fun array_inv!6414 (array!15406) Bool)

(assert (=> b!273817 (= e!193713 (array_inv!6414 (buf!7158 thiss!882)))))

(assert (= (and start!60244 res!227869) b!273816))

(assert (= start!60244 b!273817))

(declare-fun m!406593 () Bool)

(assert (=> start!60244 m!406593))

(declare-fun m!406595 () Bool)

(assert (=> start!60244 m!406595))

(declare-fun m!406597 () Bool)

(assert (=> b!273817 m!406597))

(push 1)

(assert (not start!60244))

(assert (not b!273817))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93810 () Bool)

(declare-fun res!227878 () Bool)

(declare-fun e!193723 () Bool)

(assert (=> d!93810 (=> (not res!227878) (not e!193723))))

(assert (=> d!93810 (= res!227878 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6690 (buf!7158 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6690 (buf!7158 thiss!882)))))))))

(assert (=> d!93810 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!193723)))

(declare-fun b!273829 () Bool)

(declare-fun lt!411857 () (_ BitVec 64))

(assert (=> b!273829 (= e!193723 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411857) (bvsle lt!411857 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6690 (buf!7158 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!273829 (= lt!411857 (bvadd (bitIndex!0 (size!6690 (buf!7158 thiss!882)) (currentByte!13211 thiss!882) (currentBit!13206 thiss!882)) diffInBits!15))))

(assert (= (and d!93810 res!227878) b!273829))

(declare-fun m!406607 () Bool)

(assert (=> b!273829 m!406607))

(assert (=> start!60244 d!93810))

(declare-fun d!93814 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!93814 (= (inv!12 thiss!882) (invariant!0 (currentBit!13206 thiss!882) (currentByte!13211 thiss!882) (size!6690 (buf!7158 thiss!882))))))

(declare-fun bs!23636 () Bool)

(assert (= bs!23636 d!93814))

(declare-fun m!406609 () Bool)

(assert (=> bs!23636 m!406609))

(assert (=> start!60244 d!93814))

(declare-fun d!93816 () Bool)

(assert (=> d!93816 (= (array_inv!6414 (buf!7158 thiss!882)) (bvsge (size!6690 (buf!7158 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!273817 d!93816))

(push 1)

(assert (not b!273829))

(assert (not d!93814))

(check-sat)

(pop 1)

(push 1)

(check-sat)

