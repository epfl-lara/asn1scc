; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60266 () Bool)

(assert start!60266)

(declare-fun res!227884 () Bool)

(declare-fun e!193739 () Bool)

(assert (=> start!60266 (=> (not res!227884) (not e!193739))))

(declare-datatypes ((array!15413 0))(
  ( (array!15414 (arr!7679 (Array (_ BitVec 32) (_ BitVec 8))) (size!6692 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12198 0))(
  ( (BitStream!12199 (buf!7160 array!15413) (currentByte!13213 (_ BitVec 32)) (currentBit!13208 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12198)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12198 (_ BitVec 64)) Bool)

(assert (=> start!60266 (= res!227884 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60266 e!193739))

(declare-fun e!193740 () Bool)

(declare-fun inv!12 (BitStream!12198) Bool)

(assert (=> start!60266 (and (inv!12 thiss!882) e!193740)))

(assert (=> start!60266 true))

(declare-fun b!273840 () Bool)

(assert (=> b!273840 (= e!193739 (and (bvslt (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000)))))

(declare-fun b!273841 () Bool)

(declare-fun array_inv!6416 (array!15413) Bool)

(assert (=> b!273841 (= e!193740 (array_inv!6416 (buf!7160 thiss!882)))))

(assert (= (and start!60266 res!227884) b!273840))

(assert (= start!60266 b!273841))

(declare-fun m!406617 () Bool)

(assert (=> start!60266 m!406617))

(declare-fun m!406619 () Bool)

(assert (=> start!60266 m!406619))

(declare-fun m!406621 () Bool)

(assert (=> b!273841 m!406621))

(check-sat (not start!60266) (not b!273841))
(check-sat)
(get-model)

(declare-fun d!93820 () Bool)

(declare-fun res!227890 () Bool)

(declare-fun e!193753 () Bool)

(assert (=> d!93820 (=> (not res!227890) (not e!193753))))

(assert (=> d!93820 (= res!227890 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6692 (buf!7160 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6692 (buf!7160 thiss!882)))))))))

(assert (=> d!93820 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!193753)))

(declare-fun b!273851 () Bool)

(declare-fun lt!411860 () (_ BitVec 64))

(assert (=> b!273851 (= e!193753 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411860) (bvsle lt!411860 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6692 (buf!7160 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!273851 (= lt!411860 (bvadd (bitIndex!0 (size!6692 (buf!7160 thiss!882)) (currentByte!13213 thiss!882) (currentBit!13208 thiss!882)) diffInBits!15))))

(assert (= (and d!93820 res!227890) b!273851))

(declare-fun m!406629 () Bool)

(assert (=> b!273851 m!406629))

(assert (=> start!60266 d!93820))

(declare-fun d!93822 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!93822 (= (inv!12 thiss!882) (invariant!0 (currentBit!13208 thiss!882) (currentByte!13213 thiss!882) (size!6692 (buf!7160 thiss!882))))))

(declare-fun bs!23640 () Bool)

(assert (= bs!23640 d!93822))

(declare-fun m!406631 () Bool)

(assert (=> bs!23640 m!406631))

(assert (=> start!60266 d!93822))

(declare-fun d!93824 () Bool)

(assert (=> d!93824 (= (array_inv!6416 (buf!7160 thiss!882)) (bvsge (size!6692 (buf!7160 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!273841 d!93824))

(check-sat (not d!93822) (not b!273851))
(check-sat)
