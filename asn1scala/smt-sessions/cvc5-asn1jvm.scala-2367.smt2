; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60338 () Bool)

(assert start!60338)

(declare-fun res!227950 () Bool)

(declare-fun e!193880 () Bool)

(assert (=> start!60338 (=> (not res!227950) (not e!193880))))

(declare-datatypes ((array!15447 0))(
  ( (array!15448 (arr!7693 (Array (_ BitVec 32) (_ BitVec 8))) (size!6706 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12226 0))(
  ( (BitStream!12227 (buf!7174 array!15447) (currentByte!13233 (_ BitVec 32)) (currentBit!13228 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12226)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12226 (_ BitVec 64)) Bool)

(assert (=> start!60338 (= res!227950 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60338 e!193880))

(declare-fun e!193881 () Bool)

(declare-fun inv!12 (BitStream!12226) Bool)

(assert (=> start!60338 (and (inv!12 thiss!882) e!193881)))

(assert (=> start!60338 true))

(declare-fun b!273953 () Bool)

(declare-fun lt!411938 () (_ BitVec 32))

(assert (=> b!273953 (= e!193880 (and (= (bvand (currentByte!13233 thiss!882) #b10000000000000000000000000000000) (bvand lt!411938 #b10000000000000000000000000000000)) (not (= (bvand (currentByte!13233 thiss!882) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!13233 thiss!882) lt!411938) #b10000000000000000000000000000000)))))))

(assert (=> b!273953 (= lt!411938 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!273954 () Bool)

(declare-fun array_inv!6430 (array!15447) Bool)

(assert (=> b!273954 (= e!193881 (array_inv!6430 (buf!7174 thiss!882)))))

(assert (= (and start!60338 res!227950) b!273953))

(assert (= start!60338 b!273954))

(declare-fun m!406739 () Bool)

(assert (=> start!60338 m!406739))

(declare-fun m!406741 () Bool)

(assert (=> start!60338 m!406741))

(declare-fun m!406743 () Bool)

(assert (=> b!273954 m!406743))

(push 1)

(assert (not b!273954))

(assert (not start!60338))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93888 () Bool)

(assert (=> d!93888 (= (array_inv!6430 (buf!7174 thiss!882)) (bvsge (size!6706 (buf!7174 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!273954 d!93888))

(declare-fun d!93890 () Bool)

(declare-fun res!227962 () Bool)

(declare-fun e!193906 () Bool)

(assert (=> d!93890 (=> (not res!227962) (not e!193906))))

(assert (=> d!93890 (= res!227962 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6706 (buf!7174 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6706 (buf!7174 thiss!882)))))))))

(assert (=> d!93890 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!193906)))

(declare-fun b!273974 () Bool)

(declare-fun lt!411950 () (_ BitVec 64))

(assert (=> b!273974 (= e!193906 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411950) (bvsle lt!411950 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6706 (buf!7174 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!273974 (= lt!411950 (bvadd (bitIndex!0 (size!6706 (buf!7174 thiss!882)) (currentByte!13233 thiss!882) (currentBit!13228 thiss!882)) diffInBits!15))))

(assert (= (and d!93890 res!227962) b!273974))

(declare-fun m!406759 () Bool)

(assert (=> b!273974 m!406759))

(assert (=> start!60338 d!93890))

(declare-fun d!93894 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!93894 (= (inv!12 thiss!882) (invariant!0 (currentBit!13228 thiss!882) (currentByte!13233 thiss!882) (size!6706 (buf!7174 thiss!882))))))

(declare-fun bs!23664 () Bool)

(assert (= bs!23664 d!93894))

(declare-fun m!406763 () Bool)

(assert (=> bs!23664 m!406763))

(assert (=> start!60338 d!93894))

(push 1)

(assert (not d!93894))

(assert (not b!273974))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93904 () Bool)

(assert (=> d!93904 (= (invariant!0 (currentBit!13228 thiss!882) (currentByte!13233 thiss!882) (size!6706 (buf!7174 thiss!882))) (and (bvsge (currentBit!13228 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13228 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13233 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13233 thiss!882) (size!6706 (buf!7174 thiss!882))) (and (= (currentBit!13228 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13233 thiss!882) (size!6706 (buf!7174 thiss!882)))))))))

(assert (=> d!93894 d!93904))

(declare-fun d!93908 () Bool)

(declare-fun e!193915 () Bool)

(assert (=> d!93908 e!193915))

(declare-fun res!227976 () Bool)

(assert (=> d!93908 (=> (not res!227976) (not e!193915))))

(declare-fun lt!411987 () (_ BitVec 64))

(declare-fun lt!411984 () (_ BitVec 64))

(declare-fun lt!411986 () (_ BitVec 64))

(assert (=> d!93908 (= res!227976 (= lt!411987 (bvsub lt!411986 lt!411984)))))

(assert (=> d!93908 (or (= (bvand lt!411986 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!411984 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!411986 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!411986 lt!411984) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!93908 (= lt!411984 (remainingBits!0 ((_ sign_extend 32) (size!6706 (buf!7174 thiss!882))) ((_ sign_extend 32) (currentByte!13233 thiss!882)) ((_ sign_extend 32) (currentBit!13228 thiss!882))))))

(declare-fun lt!411985 () (_ BitVec 64))

(declare-fun lt!411988 () (_ BitVec 64))

(assert (=> d!93908 (= lt!411986 (bvmul lt!411985 lt!411988))))

(assert (=> d!93908 (or (= lt!411985 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!411988 (bvsdiv (bvmul lt!411985 lt!411988) lt!411985)))))

(assert (=> d!93908 (= lt!411988 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93908 (= lt!411985 ((_ sign_extend 32) (size!6706 (buf!7174 thiss!882))))))

(assert (=> d!93908 (= lt!411987 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13233 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13228 thiss!882))))))

(assert (=> d!93908 (invariant!0 (currentBit!13228 thiss!882) (currentByte!13233 thiss!882) (size!6706 (buf!7174 thiss!882)))))

(assert (=> d!93908 (= (bitIndex!0 (size!6706 (buf!7174 thiss!882)) (currentByte!13233 thiss!882) (currentBit!13228 thiss!882)) lt!411987)))

(declare-fun b!273989 () Bool)

(declare-fun res!227977 () Bool)

(assert (=> b!273989 (=> (not res!227977) (not e!193915))))

(assert (=> b!273989 (= res!227977 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411987))))

(declare-fun b!273990 () Bool)

(declare-fun lt!411989 () (_ BitVec 64))

(assert (=> b!273990 (= e!193915 (bvsle lt!411987 (bvmul lt!411989 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!273990 (or (= lt!411989 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!411989 #b0000000000000000000000000000000000000000000000000000000000001000) lt!411989)))))

(assert (=> b!273990 (= lt!411989 ((_ sign_extend 32) (size!6706 (buf!7174 thiss!882))))))

(assert (= (and d!93908 res!227976) b!273989))

(assert (= (and b!273989 res!227977) b!273990))

(declare-fun m!406771 () Bool)

(assert (=> d!93908 m!406771))

(assert (=> d!93908 m!406763))

(assert (=> b!273974 d!93908))

(push 1)

(assert (not d!93908))

(check-sat)

(pop 1)

(push 1)

(check-sat)

