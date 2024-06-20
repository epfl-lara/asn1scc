; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60194 () Bool)

(assert start!60194)

(declare-fun res!227827 () Bool)

(declare-fun e!193620 () Bool)

(assert (=> start!60194 (=> (not res!227827) (not e!193620))))

(declare-datatypes ((array!15383 0))(
  ( (array!15384 (arr!7667 (Array (_ BitVec 32) (_ BitVec 8))) (size!6680 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12174 0))(
  ( (BitStream!12175 (buf!7148 array!15383) (currentByte!13195 (_ BitVec 32)) (currentBit!13190 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12174)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12174 (_ BitVec 64)) Bool)

(assert (=> start!60194 (= res!227827 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60194 e!193620))

(declare-fun e!193621 () Bool)

(declare-fun inv!12 (BitStream!12174) Bool)

(assert (=> start!60194 (and (inv!12 thiss!882) e!193621)))

(assert (=> start!60194 true))

(declare-fun b!273740 () Bool)

(declare-fun e!193619 () Bool)

(assert (=> b!273740 (= e!193620 e!193619)))

(declare-fun res!227826 () Bool)

(assert (=> b!273740 (=> (not res!227826) (not e!193619))))

(declare-fun lt!411764 () (_ BitVec 32))

(assert (=> b!273740 (= res!227826 (and (bvsge lt!411764 #b00000000000000000000000000000000) (bvslt lt!411764 #b00000000000000000000000000001000)))))

(assert (=> b!273740 (= lt!411764 (bvadd (currentBit!13190 thiss!882) ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!273741 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!273741 (= e!193619 (not (invariant!0 lt!411764 (bvadd (currentByte!13195 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (size!6680 (buf!7148 thiss!882)))))))

(declare-fun b!273742 () Bool)

(declare-fun array_inv!6404 (array!15383) Bool)

(assert (=> b!273742 (= e!193621 (array_inv!6404 (buf!7148 thiss!882)))))

(assert (= (and start!60194 res!227827) b!273740))

(assert (= (and b!273740 res!227826) b!273741))

(assert (= start!60194 b!273742))

(declare-fun m!406511 () Bool)

(assert (=> start!60194 m!406511))

(declare-fun m!406513 () Bool)

(assert (=> start!60194 m!406513))

(declare-fun m!406515 () Bool)

(assert (=> b!273741 m!406515))

(declare-fun m!406517 () Bool)

(assert (=> b!273742 m!406517))

(check-sat (not b!273742) (not start!60194) (not b!273741))
(check-sat)
(get-model)

(declare-fun d!93758 () Bool)

(assert (=> d!93758 (= (array_inv!6404 (buf!7148 thiss!882)) (bvsge (size!6680 (buf!7148 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!273742 d!93758))

(declare-fun d!93760 () Bool)

(declare-fun res!227836 () Bool)

(declare-fun e!193636 () Bool)

(assert (=> d!93760 (=> (not res!227836) (not e!193636))))

(assert (=> d!93760 (= res!227836 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6680 (buf!7148 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6680 (buf!7148 thiss!882)))))))))

(assert (=> d!93760 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!193636)))

(declare-fun b!273755 () Bool)

(declare-fun lt!411770 () (_ BitVec 64))

(assert (=> b!273755 (= e!193636 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411770) (bvsle lt!411770 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6680 (buf!7148 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!273755 (= lt!411770 (bvadd (bitIndex!0 (size!6680 (buf!7148 thiss!882)) (currentByte!13195 thiss!882) (currentBit!13190 thiss!882)) diffInBits!15))))

(assert (= (and d!93760 res!227836) b!273755))

(declare-fun m!406527 () Bool)

(assert (=> b!273755 m!406527))

(assert (=> start!60194 d!93760))

(declare-fun d!93764 () Bool)

(assert (=> d!93764 (= (inv!12 thiss!882) (invariant!0 (currentBit!13190 thiss!882) (currentByte!13195 thiss!882) (size!6680 (buf!7148 thiss!882))))))

(declare-fun bs!23622 () Bool)

(assert (= bs!23622 d!93764))

(declare-fun m!406529 () Bool)

(assert (=> bs!23622 m!406529))

(assert (=> start!60194 d!93764))

(declare-fun d!93766 () Bool)

(assert (=> d!93766 (= (invariant!0 lt!411764 (bvadd (currentByte!13195 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (size!6680 (buf!7148 thiss!882))) (and (bvsge lt!411764 #b00000000000000000000000000000000) (bvslt lt!411764 #b00000000000000000000000000001000) (bvsge (bvadd (currentByte!13195 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000000) (or (bvslt (bvadd (currentByte!13195 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (size!6680 (buf!7148 thiss!882))) (and (= lt!411764 #b00000000000000000000000000000000) (= (bvadd (currentByte!13195 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (size!6680 (buf!7148 thiss!882)))))))))

(assert (=> b!273741 d!93766))

(check-sat (not d!93764) (not b!273755))
(check-sat)
(get-model)

(declare-fun d!93780 () Bool)

(assert (=> d!93780 (= (invariant!0 (currentBit!13190 thiss!882) (currentByte!13195 thiss!882) (size!6680 (buf!7148 thiss!882))) (and (bvsge (currentBit!13190 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13190 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13195 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13195 thiss!882) (size!6680 (buf!7148 thiss!882))) (and (= (currentBit!13190 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13195 thiss!882) (size!6680 (buf!7148 thiss!882)))))))))

(assert (=> d!93764 d!93780))

(declare-fun d!93782 () Bool)

(declare-fun e!193645 () Bool)

(assert (=> d!93782 e!193645))

(declare-fun res!227848 () Bool)

(assert (=> d!93782 (=> (not res!227848) (not e!193645))))

(declare-fun lt!411789 () (_ BitVec 64))

(declare-fun lt!411793 () (_ BitVec 64))

(declare-fun lt!411792 () (_ BitVec 64))

(assert (=> d!93782 (= res!227848 (= lt!411792 (bvsub lt!411789 lt!411793)))))

(assert (=> d!93782 (or (= (bvand lt!411789 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!411793 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!411789 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!411789 lt!411793) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!93782 (= lt!411793 (remainingBits!0 ((_ sign_extend 32) (size!6680 (buf!7148 thiss!882))) ((_ sign_extend 32) (currentByte!13195 thiss!882)) ((_ sign_extend 32) (currentBit!13190 thiss!882))))))

(declare-fun lt!411791 () (_ BitVec 64))

(declare-fun lt!411790 () (_ BitVec 64))

(assert (=> d!93782 (= lt!411789 (bvmul lt!411791 lt!411790))))

(assert (=> d!93782 (or (= lt!411791 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!411790 (bvsdiv (bvmul lt!411791 lt!411790) lt!411791)))))

(assert (=> d!93782 (= lt!411790 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93782 (= lt!411791 ((_ sign_extend 32) (size!6680 (buf!7148 thiss!882))))))

(assert (=> d!93782 (= lt!411792 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13195 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13190 thiss!882))))))

(assert (=> d!93782 (invariant!0 (currentBit!13190 thiss!882) (currentByte!13195 thiss!882) (size!6680 (buf!7148 thiss!882)))))

(assert (=> d!93782 (= (bitIndex!0 (size!6680 (buf!7148 thiss!882)) (currentByte!13195 thiss!882) (currentBit!13190 thiss!882)) lt!411792)))

(declare-fun b!273768 () Bool)

(declare-fun res!227847 () Bool)

(assert (=> b!273768 (=> (not res!227847) (not e!193645))))

(assert (=> b!273768 (= res!227847 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411792))))

(declare-fun b!273769 () Bool)

(declare-fun lt!411794 () (_ BitVec 64))

(assert (=> b!273769 (= e!193645 (bvsle lt!411792 (bvmul lt!411794 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!273769 (or (= lt!411794 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!411794 #b0000000000000000000000000000000000000000000000000000000000001000) lt!411794)))))

(assert (=> b!273769 (= lt!411794 ((_ sign_extend 32) (size!6680 (buf!7148 thiss!882))))))

(assert (= (and d!93782 res!227848) b!273768))

(assert (= (and b!273768 res!227847) b!273769))

(declare-fun m!406539 () Bool)

(assert (=> d!93782 m!406539))

(assert (=> d!93782 m!406529))

(assert (=> b!273755 d!93782))

(check-sat (not d!93782))
(check-sat)
