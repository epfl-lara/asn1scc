; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72998 () Bool)

(assert start!72998)

(declare-fun b!324918 () Bool)

(declare-fun e!234221 () Bool)

(declare-datatypes ((array!20933 0))(
  ( (array!20934 (arr!10186 (Array (_ BitVec 32) (_ BitVec 8))) (size!9094 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14350 0))(
  ( (BitStream!14351 (buf!8236 array!20933) (currentByte!15253 (_ BitVec 32)) (currentBit!15248 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14350)

(declare-fun array_inv!8646 (array!20933) Bool)

(assert (=> b!324918 (= e!234221 (array_inv!8646 (buf!8236 thiss!877)))))

(declare-fun b!324919 () Bool)

(declare-fun res!266656 () Bool)

(declare-fun e!234220 () Bool)

(assert (=> b!324919 (=> (not res!266656) (not e!234220))))

(assert (=> b!324919 (= res!266656 (and (bvsle ((_ sign_extend 32) (size!9094 (buf!8236 thiss!877))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!15253 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!15248 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!9094 (buf!8236 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!15253 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!15248 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!324920 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!324920 (= e!234220 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!15248 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15253 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (size!9094 (buf!8236 thiss!877)))))))))

(declare-fun res!266659 () Bool)

(assert (=> start!72998 (=> (not res!266659) (not e!234220))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!72998 (= res!266659 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9094 (buf!8236 thiss!877))) ((_ sign_extend 32) (currentByte!15253 thiss!877)) ((_ sign_extend 32) (currentBit!15248 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!72998 e!234220))

(declare-fun inv!12 (BitStream!14350) Bool)

(assert (=> start!72998 (and (inv!12 thiss!877) e!234221)))

(declare-fun b!324921 () Bool)

(declare-fun res!266657 () Bool)

(assert (=> b!324921 (=> (not res!266657) (not e!234220))))

(assert (=> b!324921 (= res!266657 (bvsge (currentBit!15248 thiss!877) #b00000000000000000000000000000111))))

(declare-fun b!324922 () Bool)

(declare-fun res!266658 () Bool)

(assert (=> b!324922 (=> (not res!266658) (not e!234220))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!324922 (= res!266658 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!9094 (buf!8236 thiss!877)) (currentByte!15253 thiss!877) (currentBit!15248 thiss!877))) (bitIndex!0 (size!9094 (buf!8236 thiss!877)) (bvadd #b00000000000000000000000000000001 (currentByte!15253 thiss!877)) #b00000000000000000000000000000000)))))

(assert (= (and start!72998 res!266659) b!324921))

(assert (= (and b!324921 res!266657) b!324922))

(assert (= (and b!324922 res!266658) b!324919))

(assert (= (and b!324919 res!266656) b!324920))

(assert (= start!72998 b!324918))

(declare-fun m!462955 () Bool)

(assert (=> b!324918 m!462955))

(declare-fun m!462957 () Bool)

(assert (=> b!324920 m!462957))

(declare-fun m!462959 () Bool)

(assert (=> start!72998 m!462959))

(declare-fun m!462961 () Bool)

(assert (=> start!72998 m!462961))

(declare-fun m!462963 () Bool)

(assert (=> b!324922 m!462963))

(declare-fun m!462965 () Bool)

(assert (=> b!324922 m!462965))

(push 1)

(assert (not b!324920))

(assert (not b!324922))

(assert (not b!324918))

(assert (not start!72998))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106924 () Bool)

(assert (=> d!106924 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!15248 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15253 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (size!9094 (buf!8236 thiss!877))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!15248 thiss!877))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!15248 thiss!877))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15253 thiss!877))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15253 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (size!9094 (buf!8236 thiss!877))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!15248 thiss!877))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15253 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (size!9094 (buf!8236 thiss!877)))))))))))

(assert (=> b!324920 d!106924))

(declare-fun d!106926 () Bool)

(declare-fun e!234247 () Bool)

(assert (=> d!106926 e!234247))

(declare-fun res!266697 () Bool)

(assert (=> d!106926 (=> (not res!266697) (not e!234247))))

(declare-fun lt!447384 () (_ BitVec 64))

(declare-fun lt!447383 () (_ BitVec 64))

(declare-fun lt!447382 () (_ BitVec 64))

(assert (=> d!106926 (= res!266697 (= lt!447384 (bvsub lt!447382 lt!447383)))))

(assert (=> d!106926 (or (= (bvand lt!447382 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447383 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447382 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447382 lt!447383) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106926 (= lt!447383 (remainingBits!0 ((_ sign_extend 32) (size!9094 (buf!8236 thiss!877))) ((_ sign_extend 32) (currentByte!15253 thiss!877)) ((_ sign_extend 32) (currentBit!15248 thiss!877))))))

(declare-fun lt!447385 () (_ BitVec 64))

(declare-fun lt!447386 () (_ BitVec 64))

(assert (=> d!106926 (= lt!447382 (bvmul lt!447385 lt!447386))))

(assert (=> d!106926 (or (= lt!447385 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447386 (bvsdiv (bvmul lt!447385 lt!447386) lt!447385)))))

(assert (=> d!106926 (= lt!447386 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106926 (= lt!447385 ((_ sign_extend 32) (size!9094 (buf!8236 thiss!877))))))

(assert (=> d!106926 (= lt!447384 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15253 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15248 thiss!877))))))

(assert (=> d!106926 (invariant!0 (currentBit!15248 thiss!877) (currentByte!15253 thiss!877) (size!9094 (buf!8236 thiss!877)))))

(assert (=> d!106926 (= (bitIndex!0 (size!9094 (buf!8236 thiss!877)) (currentByte!15253 thiss!877) (currentBit!15248 thiss!877)) lt!447384)))

(declare-fun b!324965 () Bool)

(declare-fun res!266696 () Bool)

(assert (=> b!324965 (=> (not res!266696) (not e!234247))))

(assert (=> b!324965 (= res!266696 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447384))))

(declare-fun b!324966 () Bool)

(declare-fun lt!447381 () (_ BitVec 64))

(assert (=> b!324966 (= e!234247 (bvsle lt!447384 (bvmul lt!447381 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!324966 (or (= lt!447381 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447381 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447381)))))

(assert (=> b!324966 (= lt!447381 ((_ sign_extend 32) (size!9094 (buf!8236 thiss!877))))))

(assert (= (and d!106926 res!266697) b!324965))

(assert (= (and b!324965 res!266696) b!324966))

(assert (=> d!106926 m!462959))

(declare-fun m!462999 () Bool)

(assert (=> d!106926 m!462999))

(assert (=> b!324922 d!106926))

(declare-fun d!106948 () Bool)

(declare-fun e!234248 () Bool)

(assert (=> d!106948 e!234248))

(declare-fun res!266699 () Bool)

(assert (=> d!106948 (=> (not res!266699) (not e!234248))))

(declare-fun lt!447389 () (_ BitVec 64))

(declare-fun lt!447388 () (_ BitVec 64))

(declare-fun lt!447390 () (_ BitVec 64))

(assert (=> d!106948 (= res!266699 (= lt!447390 (bvsub lt!447388 lt!447389)))))

(assert (=> d!106948 (or (= (bvand lt!447388 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447389 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447388 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447388 lt!447389) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106948 (= lt!447389 (remainingBits!0 ((_ sign_extend 32) (size!9094 (buf!8236 thiss!877))) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15253 thiss!877))) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(declare-fun lt!447391 () (_ BitVec 64))

(declare-fun lt!447392 () (_ BitVec 64))

(assert (=> d!106948 (= lt!447388 (bvmul lt!447391 lt!447392))))

(assert (=> d!106948 (or (= lt!447391 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447392 (bvsdiv (bvmul lt!447391 lt!447392) lt!447391)))))

(assert (=> d!106948 (= lt!447392 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106948 (= lt!447391 ((_ sign_extend 32) (size!9094 (buf!8236 thiss!877))))))

(assert (=> d!106948 (= lt!447390 (bvadd (bvmul ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15253 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(assert (=> d!106948 (invariant!0 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!15253 thiss!877)) (size!9094 (buf!8236 thiss!877)))))

(assert (=> d!106948 (= (bitIndex!0 (size!9094 (buf!8236 thiss!877)) (bvadd #b00000000000000000000000000000001 (currentByte!15253 thiss!877)) #b00000000000000000000000000000000) lt!447390)))

(declare-fun b!324967 () Bool)

(declare-fun res!266698 () Bool)

(assert (=> b!324967 (=> (not res!266698) (not e!234248))))

(assert (=> b!324967 (= res!266698 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447390))))

(declare-fun b!324968 () Bool)

(declare-fun lt!447387 () (_ BitVec 64))

(assert (=> b!324968 (= e!234248 (bvsle lt!447390 (bvmul lt!447387 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!324968 (or (= lt!447387 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447387 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447387)))))

(assert (=> b!324968 (= lt!447387 ((_ sign_extend 32) (size!9094 (buf!8236 thiss!877))))))

(assert (= (and d!106948 res!266699) b!324967))

(assert (= (and b!324967 res!266698) b!324968))

(declare-fun m!463001 () Bool)

(assert (=> d!106948 m!463001))

(declare-fun m!463003 () Bool)

(assert (=> d!106948 m!463003))

(assert (=> b!324922 d!106948))

(declare-fun d!106950 () Bool)

(assert (=> d!106950 (= (array_inv!8646 (buf!8236 thiss!877)) (bvsge (size!9094 (buf!8236 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!324918 d!106950))

(declare-fun d!106952 () Bool)

(assert (=> d!106952 (= (remainingBits!0 ((_ sign_extend 32) (size!9094 (buf!8236 thiss!877))) ((_ sign_extend 32) (currentByte!15253 thiss!877)) ((_ sign_extend 32) (currentBit!15248 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9094 (buf!8236 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15253 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15248 thiss!877)))))))

(assert (=> start!72998 d!106952))

(declare-fun d!106954 () Bool)

(assert (=> d!106954 (= (inv!12 thiss!877) (invariant!0 (currentBit!15248 thiss!877) (currentByte!15253 thiss!877) (size!9094 (buf!8236 thiss!877))))))

(declare-fun bs!28153 () Bool)

(assert (= bs!28153 d!106954))

(assert (=> bs!28153 m!462999))

(assert (=> start!72998 d!106954))

(push 1)

(assert (not d!106948))

(assert (not d!106926))

(assert (not d!106954))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

