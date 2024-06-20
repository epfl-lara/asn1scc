; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60192 () Bool)

(assert start!60192)

(declare-fun res!227820 () Bool)

(declare-fun e!193606 () Bool)

(assert (=> start!60192 (=> (not res!227820) (not e!193606))))

(declare-datatypes ((array!15381 0))(
  ( (array!15382 (arr!7666 (Array (_ BitVec 32) (_ BitVec 8))) (size!6679 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12172 0))(
  ( (BitStream!12173 (buf!7147 array!15381) (currentByte!13194 (_ BitVec 32)) (currentBit!13189 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12172)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12172 (_ BitVec 64)) Bool)

(assert (=> start!60192 (= res!227820 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60192 e!193606))

(declare-fun e!193609 () Bool)

(declare-fun inv!12 (BitStream!12172) Bool)

(assert (=> start!60192 (and (inv!12 thiss!882) e!193609)))

(assert (=> start!60192 true))

(declare-fun b!273731 () Bool)

(declare-fun e!193608 () Bool)

(assert (=> b!273731 (= e!193606 e!193608)))

(declare-fun res!227821 () Bool)

(assert (=> b!273731 (=> (not res!227821) (not e!193608))))

(declare-fun lt!411761 () (_ BitVec 32))

(assert (=> b!273731 (= res!227821 (and (bvsge lt!411761 #b00000000000000000000000000000000) (bvslt lt!411761 #b00000000000000000000000000001000)))))

(assert (=> b!273731 (= lt!411761 (bvadd (currentBit!13189 thiss!882) ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!273732 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!273732 (= e!193608 (not (invariant!0 lt!411761 (bvadd (currentByte!13194 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (size!6679 (buf!7147 thiss!882)))))))

(declare-fun b!273733 () Bool)

(declare-fun array_inv!6403 (array!15381) Bool)

(assert (=> b!273733 (= e!193609 (array_inv!6403 (buf!7147 thiss!882)))))

(assert (= (and start!60192 res!227820) b!273731))

(assert (= (and b!273731 res!227821) b!273732))

(assert (= start!60192 b!273733))

(declare-fun m!406503 () Bool)

(assert (=> start!60192 m!406503))

(declare-fun m!406505 () Bool)

(assert (=> start!60192 m!406505))

(declare-fun m!406507 () Bool)

(assert (=> b!273732 m!406507))

(declare-fun m!406509 () Bool)

(assert (=> b!273733 m!406509))

(push 1)

(assert (not start!60192))

(assert (not b!273732))

(assert (not b!273733))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93762 () Bool)

(declare-fun res!227839 () Bool)

(declare-fun e!193639 () Bool)

(assert (=> d!93762 (=> (not res!227839) (not e!193639))))

(assert (=> d!93762 (= res!227839 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6679 (buf!7147 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6679 (buf!7147 thiss!882)))))))))

(assert (=> d!93762 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!193639)))

(declare-fun b!273759 () Bool)

(declare-fun lt!411773 () (_ BitVec 64))

(assert (=> b!273759 (= e!193639 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411773) (bvsle lt!411773 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6679 (buf!7147 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!273759 (= lt!411773 (bvadd (bitIndex!0 (size!6679 (buf!7147 thiss!882)) (currentByte!13194 thiss!882) (currentBit!13189 thiss!882)) diffInBits!15))))

(assert (= (and d!93762 res!227839) b!273759))

(declare-fun m!406531 () Bool)

(assert (=> b!273759 m!406531))

(assert (=> start!60192 d!93762))

(declare-fun d!93768 () Bool)

(assert (=> d!93768 (= (inv!12 thiss!882) (invariant!0 (currentBit!13189 thiss!882) (currentByte!13194 thiss!882) (size!6679 (buf!7147 thiss!882))))))

(declare-fun bs!23623 () Bool)

(assert (= bs!23623 d!93768))

(declare-fun m!406533 () Bool)

(assert (=> bs!23623 m!406533))

(assert (=> start!60192 d!93768))

(declare-fun d!93770 () Bool)

(assert (=> d!93770 (= (invariant!0 lt!411761 (bvadd (currentByte!13194 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (size!6679 (buf!7147 thiss!882))) (and (bvsge lt!411761 #b00000000000000000000000000000000) (bvslt lt!411761 #b00000000000000000000000000001000) (bvsge (bvadd (currentByte!13194 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000000) (or (bvslt (bvadd (currentByte!13194 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (size!6679 (buf!7147 thiss!882))) (and (= lt!411761 #b00000000000000000000000000000000) (= (bvadd (currentByte!13194 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (size!6679 (buf!7147 thiss!882)))))))))

(assert (=> b!273732 d!93770))

(declare-fun d!93772 () Bool)

(assert (=> d!93772 (= (array_inv!6403 (buf!7147 thiss!882)) (bvsge (size!6679 (buf!7147 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!273733 d!93772))

(push 1)

(assert (not d!93768))

(assert (not b!273759))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93786 () Bool)

(assert (=> d!93786 (= (invariant!0 (currentBit!13189 thiss!882) (currentByte!13194 thiss!882) (size!6679 (buf!7147 thiss!882))) (and (bvsge (currentBit!13189 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13189 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13194 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13194 thiss!882) (size!6679 (buf!7147 thiss!882))) (and (= (currentBit!13189 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13194 thiss!882) (size!6679 (buf!7147 thiss!882)))))))))

(assert (=> d!93768 d!93786))

(declare-fun d!93788 () Bool)

(declare-fun e!193648 () Bool)

(assert (=> d!93788 e!193648))

(declare-fun res!227853 () Bool)

(assert (=> d!93788 (=> (not res!227853) (not e!193648))))

(declare-fun lt!411810 () (_ BitVec 64))

(declare-fun lt!411812 () (_ BitVec 64))

(declare-fun lt!411808 () (_ BitVec 64))

(assert (=> d!93788 (= res!227853 (= lt!411810 (bvsub lt!411808 lt!411812)))))

(assert (=> d!93788 (or (= (bvand lt!411808 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!411812 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!411808 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!411808 lt!411812) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!93788 (= lt!411812 (remainingBits!0 ((_ sign_extend 32) (size!6679 (buf!7147 thiss!882))) ((_ sign_extend 32) (currentByte!13194 thiss!882)) ((_ sign_extend 32) (currentBit!13189 thiss!882))))))

(declare-fun lt!411809 () (_ BitVec 64))

(declare-fun lt!411807 () (_ BitVec 64))

(assert (=> d!93788 (= lt!411808 (bvmul lt!411809 lt!411807))))

(assert (=> d!93788 (or (= lt!411809 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!411807 (bvsdiv (bvmul lt!411809 lt!411807) lt!411809)))))

(assert (=> d!93788 (= lt!411807 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93788 (= lt!411809 ((_ sign_extend 32) (size!6679 (buf!7147 thiss!882))))))

(assert (=> d!93788 (= lt!411810 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13194 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13189 thiss!882))))))

(assert (=> d!93788 (invariant!0 (currentBit!13189 thiss!882) (currentByte!13194 thiss!882) (size!6679 (buf!7147 thiss!882)))))

(assert (=> d!93788 (= (bitIndex!0 (size!6679 (buf!7147 thiss!882)) (currentByte!13194 thiss!882) (currentBit!13189 thiss!882)) lt!411810)))

(declare-fun b!273774 () Bool)

(declare-fun res!227854 () Bool)

(assert (=> b!273774 (=> (not res!227854) (not e!193648))))

(assert (=> b!273774 (= res!227854 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411810))))

(declare-fun b!273775 () Bool)

(declare-fun lt!411811 () (_ BitVec 64))

(assert (=> b!273775 (= e!193648 (bvsle lt!411810 (bvmul lt!411811 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!273775 (or (= lt!411811 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!411811 #b0000000000000000000000000000000000000000000000000000000000001000) lt!411811)))))

(assert (=> b!273775 (= lt!411811 ((_ sign_extend 32) (size!6679 (buf!7147 thiss!882))))))

(assert (= (and d!93788 res!227853) b!273774))

(assert (= (and b!273774 res!227854) b!273775))

(declare-fun m!406541 () Bool)

(assert (=> d!93788 m!406541))

(assert (=> d!93788 m!406533))

(assert (=> b!273759 d!93788))

(push 1)

(assert (not d!93788))

(check-sat)

(pop 1)

(push 1)

(check-sat)

