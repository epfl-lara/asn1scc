; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73352 () Bool)

(assert start!73352)

(declare-fun res!267088 () Bool)

(declare-fun e!234694 () Bool)

(assert (=> start!73352 (=> (not res!267088) (not e!234694))))

(declare-fun lt!447910 () (_ BitVec 64))

(declare-datatypes ((array!21050 0))(
  ( (array!21051 (arr!10228 (Array (_ BitVec 32) (_ BitVec 8))) (size!9136 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14434 0))(
  ( (BitStream!14435 (buf!8278 array!21050) (currentByte!15364 (_ BitVec 32)) (currentBit!15359 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14434)

(assert (=> start!73352 (= res!267088 (and (bvsgt lt!447910 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge (currentBit!15359 thiss!877) #b00000000000000000000000000000111)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!73352 (= lt!447910 (remainingBits!0 ((_ sign_extend 32) (size!9136 (buf!8278 thiss!877))) ((_ sign_extend 32) (currentByte!15364 thiss!877)) ((_ sign_extend 32) (currentBit!15359 thiss!877))))))

(assert (=> start!73352 e!234694))

(declare-fun e!234695 () Bool)

(declare-fun inv!12 (BitStream!14434) Bool)

(assert (=> start!73352 (and (inv!12 thiss!877) e!234695)))

(declare-fun b!325475 () Bool)

(declare-fun res!267087 () Bool)

(assert (=> b!325475 (=> (not res!267087) (not e!234694))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!325475 (= res!267087 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!9136 (buf!8278 thiss!877)) (currentByte!15364 thiss!877) (currentBit!15359 thiss!877))) (bitIndex!0 (size!9136 (buf!8278 thiss!877)) (bvadd #b00000000000000000000000000000001 (currentByte!15364 thiss!877)) #b00000000000000000000000000000000)))))

(declare-fun b!325476 () Bool)

(declare-fun lt!447911 () (_ BitVec 64))

(declare-fun lt!447909 () (_ BitVec 64))

(assert (=> b!325476 (= e!234694 (and (not (= lt!447911 (bvand lt!447909 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= lt!447911 (bvand (bvsub lt!447910 lt!447909) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!325476 (= lt!447911 (bvand lt!447910 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!325476 (= lt!447909 (remainingBits!0 ((_ sign_extend 32) (size!9136 (buf!8278 thiss!877))) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15364 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!325477 () Bool)

(declare-fun array_inv!8688 (array!21050) Bool)

(assert (=> b!325477 (= e!234695 (array_inv!8688 (buf!8278 thiss!877)))))

(assert (= (and start!73352 res!267088) b!325475))

(assert (= (and b!325475 res!267087) b!325476))

(assert (= start!73352 b!325477))

(declare-fun m!463465 () Bool)

(assert (=> start!73352 m!463465))

(declare-fun m!463467 () Bool)

(assert (=> start!73352 m!463467))

(declare-fun m!463469 () Bool)

(assert (=> b!325475 m!463469))

(declare-fun m!463471 () Bool)

(assert (=> b!325475 m!463471))

(declare-fun m!463473 () Bool)

(assert (=> b!325476 m!463473))

(declare-fun m!463475 () Bool)

(assert (=> b!325477 m!463475))

(push 1)

(assert (not b!325476))

(assert (not start!73352))

(assert (not b!325477))

(assert (not b!325475))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107300 () Bool)

(assert (=> d!107300 (= (remainingBits!0 ((_ sign_extend 32) (size!9136 (buf!8278 thiss!877))) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15364 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsub (bvmul ((_ sign_extend 32) (size!9136 (buf!8278 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15364 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!325476 d!107300))

(declare-fun d!107302 () Bool)

(assert (=> d!107302 (= (remainingBits!0 ((_ sign_extend 32) (size!9136 (buf!8278 thiss!877))) ((_ sign_extend 32) (currentByte!15364 thiss!877)) ((_ sign_extend 32) (currentBit!15359 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9136 (buf!8278 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15364 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15359 thiss!877)))))))

(assert (=> start!73352 d!107302))

(declare-fun d!107304 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!107304 (= (inv!12 thiss!877) (invariant!0 (currentBit!15359 thiss!877) (currentByte!15364 thiss!877) (size!9136 (buf!8278 thiss!877))))))

(declare-fun bs!28235 () Bool)

(assert (= bs!28235 d!107304))

(declare-fun m!463501 () Bool)

(assert (=> bs!28235 m!463501))

(assert (=> start!73352 d!107304))

(declare-fun d!107306 () Bool)

(assert (=> d!107306 (= (array_inv!8688 (buf!8278 thiss!877)) (bvsge (size!9136 (buf!8278 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!325477 d!107306))

(declare-fun d!107310 () Bool)

(declare-fun e!234725 () Bool)

(assert (=> d!107310 e!234725))

(declare-fun res!267121 () Bool)

(assert (=> d!107310 (=> (not res!267121) (not e!234725))))

(declare-fun lt!447991 () (_ BitVec 64))

(declare-fun lt!447994 () (_ BitVec 64))

(declare-fun lt!447993 () (_ BitVec 64))

(assert (=> d!107310 (= res!267121 (= lt!447991 (bvsub lt!447994 lt!447993)))))

(assert (=> d!107310 (or (= (bvand lt!447994 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447993 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447994 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447994 lt!447993) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!107310 (= lt!447993 (remainingBits!0 ((_ sign_extend 32) (size!9136 (buf!8278 thiss!877))) ((_ sign_extend 32) (currentByte!15364 thiss!877)) ((_ sign_extend 32) (currentBit!15359 thiss!877))))))

(declare-fun lt!447995 () (_ BitVec 64))

(declare-fun lt!447990 () (_ BitVec 64))

(assert (=> d!107310 (= lt!447994 (bvmul lt!447995 lt!447990))))

(assert (=> d!107310 (or (= lt!447995 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447990 (bvsdiv (bvmul lt!447995 lt!447990) lt!447995)))))

(assert (=> d!107310 (= lt!447990 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!107310 (= lt!447995 ((_ sign_extend 32) (size!9136 (buf!8278 thiss!877))))))

(assert (=> d!107310 (= lt!447991 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15364 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15359 thiss!877))))))

(assert (=> d!107310 (invariant!0 (currentBit!15359 thiss!877) (currentByte!15364 thiss!877) (size!9136 (buf!8278 thiss!877)))))

(assert (=> d!107310 (= (bitIndex!0 (size!9136 (buf!8278 thiss!877)) (currentByte!15364 thiss!877) (currentBit!15359 thiss!877)) lt!447991)))

(declare-fun b!325516 () Bool)

(declare-fun res!267122 () Bool)

(assert (=> b!325516 (=> (not res!267122) (not e!234725))))

(assert (=> b!325516 (= res!267122 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447991))))

(declare-fun b!325517 () Bool)

(declare-fun lt!447992 () (_ BitVec 64))

(assert (=> b!325517 (= e!234725 (bvsle lt!447991 (bvmul lt!447992 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!325517 (or (= lt!447992 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447992 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447992)))))

(assert (=> b!325517 (= lt!447992 ((_ sign_extend 32) (size!9136 (buf!8278 thiss!877))))))

(assert (= (and d!107310 res!267121) b!325516))

(assert (= (and b!325516 res!267122) b!325517))

(assert (=> d!107310 m!463465))

(assert (=> d!107310 m!463501))

(assert (=> b!325475 d!107310))

(declare-fun d!107330 () Bool)

(declare-fun e!234726 () Bool)

(assert (=> d!107330 e!234726))

(declare-fun res!267123 () Bool)

(assert (=> d!107330 (=> (not res!267123) (not e!234726))))

(declare-fun lt!448000 () (_ BitVec 64))

(declare-fun lt!447999 () (_ BitVec 64))

(declare-fun lt!447997 () (_ BitVec 64))

(assert (=> d!107330 (= res!267123 (= lt!447997 (bvsub lt!448000 lt!447999)))))

(assert (=> d!107330 (or (= (bvand lt!448000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447999 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!448000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!448000 lt!447999) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!107330 (= lt!447999 (remainingBits!0 ((_ sign_extend 32) (size!9136 (buf!8278 thiss!877))) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15364 thiss!877))) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(declare-fun lt!448001 () (_ BitVec 64))

(declare-fun lt!447996 () (_ BitVec 64))

(assert (=> d!107330 (= lt!448000 (bvmul lt!448001 lt!447996))))

(assert (=> d!107330 (or (= lt!448001 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447996 (bvsdiv (bvmul lt!448001 lt!447996) lt!448001)))))

(assert (=> d!107330 (= lt!447996 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!107330 (= lt!448001 ((_ sign_extend 32) (size!9136 (buf!8278 thiss!877))))))

(assert (=> d!107330 (= lt!447997 (bvadd (bvmul ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15364 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(assert (=> d!107330 (invariant!0 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!15364 thiss!877)) (size!9136 (buf!8278 thiss!877)))))

(assert (=> d!107330 (= (bitIndex!0 (size!9136 (buf!8278 thiss!877)) (bvadd #b00000000000000000000000000000001 (currentByte!15364 thiss!877)) #b00000000000000000000000000000000) lt!447997)))

(declare-fun b!325518 () Bool)

(declare-fun res!267124 () Bool)

(assert (=> b!325518 (=> (not res!267124) (not e!234726))))

(assert (=> b!325518 (= res!267124 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447997))))

(declare-fun b!325519 () Bool)

(declare-fun lt!447998 () (_ BitVec 64))

(assert (=> b!325519 (= e!234726 (bvsle lt!447997 (bvmul lt!447998 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!325519 (or (= lt!447998 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447998 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447998)))))

(assert (=> b!325519 (= lt!447998 ((_ sign_extend 32) (size!9136 (buf!8278 thiss!877))))))

(assert (= (and d!107330 res!267123) b!325518))

(assert (= (and b!325518 res!267124) b!325519))

(declare-fun m!463515 () Bool)

(assert (=> d!107330 m!463515))

(declare-fun m!463517 () Bool)

(assert (=> d!107330 m!463517))

(assert (=> b!325475 d!107330))

(push 1)

(assert (not d!107330))

(assert (not d!107310))

(assert (not d!107304))

(check-sat)

(pop 1)

(push 1)

(check-sat)

