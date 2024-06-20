; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60134 () Bool)

(assert start!60134)

(declare-fun res!227752 () Bool)

(declare-fun e!193511 () Bool)

(assert (=> start!60134 (=> (not res!227752) (not e!193511))))

(declare-datatypes ((array!15364 0))(
  ( (array!15365 (arr!7660 (Array (_ BitVec 32) (_ BitVec 8))) (size!6673 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12160 0))(
  ( (BitStream!12161 (buf!7141 array!15364) (currentByte!13180 (_ BitVec 32)) (currentBit!13175 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12160)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12160 (_ BitVec 64)) Bool)

(assert (=> start!60134 (= res!227752 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60134 e!193511))

(declare-fun e!193512 () Bool)

(declare-fun inv!12 (BitStream!12160) Bool)

(assert (=> start!60134 (and (inv!12 thiss!882) e!193512)))

(assert (=> start!60134 true))

(declare-fun b!273639 () Bool)

(declare-fun e!193513 () Bool)

(assert (=> b!273639 (= e!193511 e!193513)))

(declare-fun res!227751 () Bool)

(assert (=> b!273639 (=> (not res!227751) (not e!193513))))

(declare-fun lt!411674 () (_ BitVec 32))

(assert (=> b!273639 (= res!227751 (and (bvsge lt!411674 #b00000000000000000000000000000000) (bvsge lt!411674 #b00000000000000000000000000001000)))))

(assert (=> b!273639 (= lt!411674 (bvadd (currentBit!13175 thiss!882) ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!273640 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!273640 (= e!193513 (not (invariant!0 (bvsub lt!411674 #b00000000000000000000000000001000) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13180 thiss!882)) (size!6673 (buf!7141 thiss!882)))))))

(declare-fun b!273641 () Bool)

(declare-fun array_inv!6397 (array!15364) Bool)

(assert (=> b!273641 (= e!193512 (array_inv!6397 (buf!7141 thiss!882)))))

(assert (= (and start!60134 res!227752) b!273639))

(assert (= (and b!273639 res!227751) b!273640))

(assert (= start!60134 b!273641))

(declare-fun m!406433 () Bool)

(assert (=> start!60134 m!406433))

(declare-fun m!406435 () Bool)

(assert (=> start!60134 m!406435))

(declare-fun m!406437 () Bool)

(assert (=> b!273640 m!406437))

(declare-fun m!406439 () Bool)

(assert (=> b!273641 m!406439))

(push 1)

(assert (not start!60134))

(assert (not b!273640))

(assert (not b!273641))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93708 () Bool)

(declare-fun res!227767 () Bool)

(declare-fun e!193540 () Bool)

(assert (=> d!93708 (=> (not res!227767) (not e!193540))))

(assert (=> d!93708 (= res!227767 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6673 (buf!7141 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6673 (buf!7141 thiss!882)))))))))

(assert (=> d!93708 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!193540)))

(declare-fun b!273663 () Bool)

(declare-fun lt!411683 () (_ BitVec 64))

(assert (=> b!273663 (= e!193540 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411683) (bvsle lt!411683 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6673 (buf!7141 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!273663 (= lt!411683 (bvadd (bitIndex!0 (size!6673 (buf!7141 thiss!882)) (currentByte!13180 thiss!882) (currentBit!13175 thiss!882)) diffInBits!15))))

(assert (= (and d!93708 res!227767) b!273663))

(declare-fun m!406457 () Bool)

(assert (=> b!273663 m!406457))

(assert (=> start!60134 d!93708))

(declare-fun d!93710 () Bool)

(assert (=> d!93710 (= (inv!12 thiss!882) (invariant!0 (currentBit!13175 thiss!882) (currentByte!13180 thiss!882) (size!6673 (buf!7141 thiss!882))))))

(declare-fun bs!23611 () Bool)

(assert (= bs!23611 d!93710))

(declare-fun m!406459 () Bool)

(assert (=> bs!23611 m!406459))

(assert (=> start!60134 d!93710))

(declare-fun d!93712 () Bool)

(assert (=> d!93712 (= (invariant!0 (bvsub lt!411674 #b00000000000000000000000000001000) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13180 thiss!882)) (size!6673 (buf!7141 thiss!882))) (and (bvsge (bvsub lt!411674 #b00000000000000000000000000001000) #b00000000000000000000000000000000) (bvslt (bvsub lt!411674 #b00000000000000000000000000001000) #b00000000000000000000000000001000) (bvsge (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13180 thiss!882)) #b00000000000000000000000000000000) (or (bvslt (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13180 thiss!882)) (size!6673 (buf!7141 thiss!882))) (and (= (bvsub lt!411674 #b00000000000000000000000000001000) #b00000000000000000000000000000000) (= (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13180 thiss!882)) (size!6673 (buf!7141 thiss!882)))))))))

(assert (=> b!273640 d!93712))

(declare-fun d!93716 () Bool)

(assert (=> d!93716 (= (array_inv!6397 (buf!7141 thiss!882)) (bvsge (size!6673 (buf!7141 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!273641 d!93716))

(push 1)

(assert (not b!273663))

(assert (not d!93710))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93726 () Bool)

(declare-fun e!193551 () Bool)

(assert (=> d!93726 e!193551))

(declare-fun res!227782 () Bool)

(assert (=> d!93726 (=> (not res!227782) (not e!193551))))

(declare-fun lt!411718 () (_ BitVec 64))

(declare-fun lt!411714 () (_ BitVec 64))

(declare-fun lt!411717 () (_ BitVec 64))

(assert (=> d!93726 (= res!227782 (= lt!411717 (bvsub lt!411718 lt!411714)))))

(assert (=> d!93726 (or (= (bvand lt!411718 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!411714 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!411718 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!411718 lt!411714) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!93726 (= lt!411714 (remainingBits!0 ((_ sign_extend 32) (size!6673 (buf!7141 thiss!882))) ((_ sign_extend 32) (currentByte!13180 thiss!882)) ((_ sign_extend 32) (currentBit!13175 thiss!882))))))

(declare-fun lt!411715 () (_ BitVec 64))

(declare-fun lt!411716 () (_ BitVec 64))

(assert (=> d!93726 (= lt!411718 (bvmul lt!411715 lt!411716))))

(assert (=> d!93726 (or (= lt!411715 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!411716 (bvsdiv (bvmul lt!411715 lt!411716) lt!411715)))))

(assert (=> d!93726 (= lt!411716 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93726 (= lt!411715 ((_ sign_extend 32) (size!6673 (buf!7141 thiss!882))))))

(assert (=> d!93726 (= lt!411717 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13180 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13175 thiss!882))))))

(assert (=> d!93726 (invariant!0 (currentBit!13175 thiss!882) (currentByte!13180 thiss!882) (size!6673 (buf!7141 thiss!882)))))

(assert (=> d!93726 (= (bitIndex!0 (size!6673 (buf!7141 thiss!882)) (currentByte!13180 thiss!882) (currentBit!13175 thiss!882)) lt!411717)))

(declare-fun b!273680 () Bool)

(declare-fun res!227783 () Bool)

(assert (=> b!273680 (=> (not res!227783) (not e!193551))))

(assert (=> b!273680 (= res!227783 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411717))))

(declare-fun b!273681 () Bool)

(declare-fun lt!411719 () (_ BitVec 64))

(assert (=> b!273681 (= e!193551 (bvsle lt!411717 (bvmul lt!411719 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!273681 (or (= lt!411719 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!411719 #b0000000000000000000000000000000000000000000000000000000000001000) lt!411719)))))

(assert (=> b!273681 (= lt!411719 ((_ sign_extend 32) (size!6673 (buf!7141 thiss!882))))))

(assert (= (and d!93726 res!227782) b!273680))

(assert (= (and b!273680 res!227783) b!273681))

(declare-fun m!406469 () Bool)

(assert (=> d!93726 m!406469))

(assert (=> d!93726 m!406459))

(assert (=> b!273663 d!93726))

(declare-fun d!93730 () Bool)

(assert (=> d!93730 (= (invariant!0 (currentBit!13175 thiss!882) (currentByte!13180 thiss!882) (size!6673 (buf!7141 thiss!882))) (and (bvsge (currentBit!13175 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13175 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13180 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13180 thiss!882) (size!6673 (buf!7141 thiss!882))) (and (= (currentBit!13175 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13180 thiss!882) (size!6673 (buf!7141 thiss!882)))))))))

(assert (=> d!93710 d!93730))

(push 1)

(assert (not d!93726))

(check-sat)

(pop 1)

(push 1)

(check-sat)

