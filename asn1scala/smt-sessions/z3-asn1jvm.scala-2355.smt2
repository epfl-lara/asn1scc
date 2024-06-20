; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60106 () Bool)

(assert start!60106)

(declare-fun res!227730 () Bool)

(declare-fun e!193477 () Bool)

(assert (=> start!60106 (=> (not res!227730) (not e!193477))))

(declare-datatypes ((array!15357 0))(
  ( (array!15358 (arr!7658 (Array (_ BitVec 32) (_ BitVec 8))) (size!6671 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12156 0))(
  ( (BitStream!12157 (buf!7139 array!15357) (currentByte!13175 (_ BitVec 32)) (currentBit!13170 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12156)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12156 (_ BitVec 64)) Bool)

(assert (=> start!60106 (= res!227730 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60106 e!193477))

(declare-fun e!193478 () Bool)

(declare-fun inv!12 (BitStream!12156) Bool)

(assert (=> start!60106 (and (inv!12 thiss!882) e!193478)))

(assert (=> start!60106 true))

(declare-fun b!273609 () Bool)

(declare-fun e!193480 () Bool)

(assert (=> b!273609 (= e!193477 e!193480)))

(declare-fun res!227731 () Bool)

(assert (=> b!273609 (=> (not res!227731) (not e!193480))))

(declare-fun lt!411659 () (_ BitVec 32))

(assert (=> b!273609 (= res!227731 (and (bvsge lt!411659 #b00000000000000000000000000000000) (bvsge lt!411659 #b00000000000000000000000000001000)))))

(assert (=> b!273609 (= lt!411659 (bvadd (currentBit!13170 thiss!882) ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!273610 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!273610 (= e!193480 (not (invariant!0 (currentBit!13170 thiss!882) (currentByte!13175 thiss!882) (size!6671 (buf!7139 thiss!882)))))))

(declare-fun b!273611 () Bool)

(declare-fun array_inv!6395 (array!15357) Bool)

(assert (=> b!273611 (= e!193478 (array_inv!6395 (buf!7139 thiss!882)))))

(assert (= (and start!60106 res!227730) b!273609))

(assert (= (and b!273609 res!227731) b!273610))

(assert (= start!60106 b!273611))

(declare-fun m!406411 () Bool)

(assert (=> start!60106 m!406411))

(declare-fun m!406413 () Bool)

(assert (=> start!60106 m!406413))

(declare-fun m!406415 () Bool)

(assert (=> b!273610 m!406415))

(declare-fun m!406417 () Bool)

(assert (=> b!273611 m!406417))

(check-sat (not start!60106) (not b!273610) (not b!273611))
(check-sat)
(get-model)

(declare-fun d!93676 () Bool)

(declare-fun res!227740 () Bool)

(declare-fun e!193495 () Bool)

(assert (=> d!93676 (=> (not res!227740) (not e!193495))))

(assert (=> d!93676 (= res!227740 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6671 (buf!7139 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6671 (buf!7139 thiss!882)))))))))

(assert (=> d!93676 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!193495)))

(declare-fun b!273624 () Bool)

(declare-fun lt!411665 () (_ BitVec 64))

(assert (=> b!273624 (= e!193495 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411665) (bvsle lt!411665 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6671 (buf!7139 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!273624 (= lt!411665 (bvadd (bitIndex!0 (size!6671 (buf!7139 thiss!882)) (currentByte!13175 thiss!882) (currentBit!13170 thiss!882)) diffInBits!15))))

(assert (= (and d!93676 res!227740) b!273624))

(declare-fun m!406427 () Bool)

(assert (=> b!273624 m!406427))

(assert (=> start!60106 d!93676))

(declare-fun d!93684 () Bool)

(assert (=> d!93684 (= (inv!12 thiss!882) (invariant!0 (currentBit!13170 thiss!882) (currentByte!13175 thiss!882) (size!6671 (buf!7139 thiss!882))))))

(declare-fun bs!23606 () Bool)

(assert (= bs!23606 d!93684))

(assert (=> bs!23606 m!406415))

(assert (=> start!60106 d!93684))

(declare-fun d!93686 () Bool)

(assert (=> d!93686 (= (invariant!0 (currentBit!13170 thiss!882) (currentByte!13175 thiss!882) (size!6671 (buf!7139 thiss!882))) (and (bvsge (currentBit!13170 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13170 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13175 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13175 thiss!882) (size!6671 (buf!7139 thiss!882))) (and (= (currentBit!13170 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13175 thiss!882) (size!6671 (buf!7139 thiss!882)))))))))

(assert (=> b!273610 d!93686))

(declare-fun d!93690 () Bool)

(assert (=> d!93690 (= (array_inv!6395 (buf!7139 thiss!882)) (bvsge (size!6671 (buf!7139 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!273611 d!93690))

(check-sat (not d!93684) (not b!273624))
