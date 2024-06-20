; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60138 () Bool)

(assert start!60138)

(declare-fun res!227763 () Bool)

(declare-fun e!193535 () Bool)

(assert (=> start!60138 (=> (not res!227763) (not e!193535))))

(declare-datatypes ((array!15368 0))(
  ( (array!15369 (arr!7662 (Array (_ BitVec 32) (_ BitVec 8))) (size!6675 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12164 0))(
  ( (BitStream!12165 (buf!7143 array!15368) (currentByte!13182 (_ BitVec 32)) (currentBit!13177 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12164)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12164 (_ BitVec 64)) Bool)

(assert (=> start!60138 (= res!227763 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60138 e!193535))

(declare-fun e!193537 () Bool)

(declare-fun inv!12 (BitStream!12164) Bool)

(assert (=> start!60138 (and (inv!12 thiss!882) e!193537)))

(assert (=> start!60138 true))

(declare-fun b!273657 () Bool)

(declare-fun e!193536 () Bool)

(assert (=> b!273657 (= e!193535 e!193536)))

(declare-fun res!227764 () Bool)

(assert (=> b!273657 (=> (not res!227764) (not e!193536))))

(declare-fun lt!411680 () (_ BitVec 32))

(assert (=> b!273657 (= res!227764 (and (bvsge lt!411680 #b00000000000000000000000000000000) (bvsge lt!411680 #b00000000000000000000000000001000)))))

(assert (=> b!273657 (= lt!411680 (bvadd (currentBit!13177 thiss!882) ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!273658 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!273658 (= e!193536 (not (invariant!0 (bvsub lt!411680 #b00000000000000000000000000001000) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13182 thiss!882)) (size!6675 (buf!7143 thiss!882)))))))

(declare-fun b!273659 () Bool)

(declare-fun array_inv!6399 (array!15368) Bool)

(assert (=> b!273659 (= e!193537 (array_inv!6399 (buf!7143 thiss!882)))))

(assert (= (and start!60138 res!227763) b!273657))

(assert (= (and b!273657 res!227764) b!273658))

(assert (= start!60138 b!273659))

(declare-fun m!406449 () Bool)

(assert (=> start!60138 m!406449))

(declare-fun m!406451 () Bool)

(assert (=> start!60138 m!406451))

(declare-fun m!406453 () Bool)

(assert (=> b!273658 m!406453))

(declare-fun m!406455 () Bool)

(assert (=> b!273659 m!406455))

(push 1)

(assert (not start!60138))

(assert (not b!273658))

(assert (not b!273659))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93718 () Bool)

(declare-fun res!227773 () Bool)

(declare-fun e!193546 () Bool)

(assert (=> d!93718 (=> (not res!227773) (not e!193546))))

(assert (=> d!93718 (= res!227773 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6675 (buf!7143 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6675 (buf!7143 thiss!882)))))))))

(assert (=> d!93718 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!193546)))

(declare-fun b!273671 () Bool)

(declare-fun lt!411689 () (_ BitVec 64))

(assert (=> b!273671 (= e!193546 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411689) (bvsle lt!411689 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6675 (buf!7143 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!273671 (= lt!411689 (bvadd (bitIndex!0 (size!6675 (buf!7143 thiss!882)) (currentByte!13182 thiss!882) (currentBit!13177 thiss!882)) diffInBits!15))))

(assert (= (and d!93718 res!227773) b!273671))

(declare-fun m!406465 () Bool)

(assert (=> b!273671 m!406465))

(assert (=> start!60138 d!93718))

(declare-fun d!93720 () Bool)

(assert (=> d!93720 (= (inv!12 thiss!882) (invariant!0 (currentBit!13177 thiss!882) (currentByte!13182 thiss!882) (size!6675 (buf!7143 thiss!882))))))

(declare-fun bs!23613 () Bool)

(assert (= bs!23613 d!93720))

(declare-fun m!406467 () Bool)

(assert (=> bs!23613 m!406467))

(assert (=> start!60138 d!93720))

(declare-fun d!93722 () Bool)

(assert (=> d!93722 (= (invariant!0 (bvsub lt!411680 #b00000000000000000000000000001000) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13182 thiss!882)) (size!6675 (buf!7143 thiss!882))) (and (bvsge (bvsub lt!411680 #b00000000000000000000000000001000) #b00000000000000000000000000000000) (bvslt (bvsub lt!411680 #b00000000000000000000000000001000) #b00000000000000000000000000001000) (bvsge (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13182 thiss!882)) #b00000000000000000000000000000000) (or (bvslt (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13182 thiss!882)) (size!6675 (buf!7143 thiss!882))) (and (= (bvsub lt!411680 #b00000000000000000000000000001000) #b00000000000000000000000000000000) (= (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13182 thiss!882)) (size!6675 (buf!7143 thiss!882)))))))))

(assert (=> b!273658 d!93722))

(declare-fun d!93724 () Bool)

(assert (=> d!93724 (= (array_inv!6399 (buf!7143 thiss!882)) (bvsge (size!6675 (buf!7143 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!273659 d!93724))

(push 1)

(assert (not d!93720))

(assert (not b!273671))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93734 () Bool)

(assert (=> d!93734 (= (invariant!0 (currentBit!13177 thiss!882) (currentByte!13182 thiss!882) (size!6675 (buf!7143 thiss!882))) (and (bvsge (currentBit!13177 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13177 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13182 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13182 thiss!882) (size!6675 (buf!7143 thiss!882))) (and (= (currentBit!13177 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13182 thiss!882) (size!6675 (buf!7143 thiss!882)))))))))

(assert (=> d!93720 d!93734))

(declare-fun d!93736 () Bool)

(declare-fun e!193555 () Bool)

(assert (=> d!93736 e!193555))

(declare-fun res!227790 () Bool)

(assert (=> d!93736 (=> (not res!227790) (not e!193555))))

(declare-fun lt!411739 () (_ BitVec 64))

(declare-fun lt!411742 () (_ BitVec 64))

(declare-fun lt!411740 () (_ BitVec 64))

(assert (=> d!93736 (= res!227790 (= lt!411739 (bvsub lt!411740 lt!411742)))))

(assert (=> d!93736 (or (= (bvand lt!411740 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!411742 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!411740 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!411740 lt!411742) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!93736 (= lt!411742 (remainingBits!0 ((_ sign_extend 32) (size!6675 (buf!7143 thiss!882))) ((_ sign_extend 32) (currentByte!13182 thiss!882)) ((_ sign_extend 32) (currentBit!13177 thiss!882))))))

(declare-fun lt!411738 () (_ BitVec 64))

(declare-fun lt!411741 () (_ BitVec 64))

(assert (=> d!93736 (= lt!411740 (bvmul lt!411738 lt!411741))))

(assert (=> d!93736 (or (= lt!411738 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!411741 (bvsdiv (bvmul lt!411738 lt!411741) lt!411738)))))

(assert (=> d!93736 (= lt!411741 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93736 (= lt!411738 ((_ sign_extend 32) (size!6675 (buf!7143 thiss!882))))))

(assert (=> d!93736 (= lt!411739 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13182 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13177 thiss!882))))))

(assert (=> d!93736 (invariant!0 (currentBit!13177 thiss!882) (currentByte!13182 thiss!882) (size!6675 (buf!7143 thiss!882)))))

(assert (=> d!93736 (= (bitIndex!0 (size!6675 (buf!7143 thiss!882)) (currentByte!13182 thiss!882) (currentBit!13177 thiss!882)) lt!411739)))

(declare-fun b!273688 () Bool)

(declare-fun res!227791 () Bool)

(assert (=> b!273688 (=> (not res!227791) (not e!193555))))

(assert (=> b!273688 (= res!227791 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411739))))

(declare-fun b!273689 () Bool)

(declare-fun lt!411743 () (_ BitVec 64))

(assert (=> b!273689 (= e!193555 (bvsle lt!411739 (bvmul lt!411743 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!273689 (or (= lt!411743 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!411743 #b0000000000000000000000000000000000000000000000000000000000001000) lt!411743)))))

(assert (=> b!273689 (= lt!411743 ((_ sign_extend 32) (size!6675 (buf!7143 thiss!882))))))

(assert (= (and d!93736 res!227790) b!273688))

(assert (= (and b!273688 res!227791) b!273689))

(declare-fun m!406473 () Bool)

(assert (=> d!93736 m!406473))

(assert (=> d!93736 m!406467))

(assert (=> b!273671 d!93736))

(push 1)

(assert (not d!93736))

(check-sat)

(pop 1)

(push 1)

(check-sat)

