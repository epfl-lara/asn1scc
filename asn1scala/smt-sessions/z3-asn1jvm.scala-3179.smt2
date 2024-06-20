; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73072 () Bool)

(assert start!73072)

(declare-fun b!325098 () Bool)

(declare-fun res!266809 () Bool)

(declare-fun e!234342 () Bool)

(assert (=> b!325098 (=> (not res!266809) (not e!234342))))

(declare-datatypes ((array!20959 0))(
  ( (array!20960 (arr!10196 (Array (_ BitVec 32) (_ BitVec 8))) (size!9104 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14370 0))(
  ( (BitStream!14371 (buf!8246 array!20959) (currentByte!15278 (_ BitVec 32)) (currentBit!15273 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14370)

(assert (=> b!325098 (= res!266809 (bvsge (currentBit!15273 thiss!877) #b00000000000000000000000000000111))))

(declare-fun res!266807 () Bool)

(assert (=> start!73072 (=> (not res!266807) (not e!234342))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!73072 (= res!266807 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9104 (buf!8246 thiss!877))) ((_ sign_extend 32) (currentByte!15278 thiss!877)) ((_ sign_extend 32) (currentBit!15273 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!73072 e!234342))

(declare-fun e!234339 () Bool)

(declare-fun inv!12 (BitStream!14370) Bool)

(assert (=> start!73072 (and (inv!12 thiss!877) e!234339)))

(declare-fun b!325099 () Bool)

(declare-fun res!266806 () Bool)

(assert (=> b!325099 (=> (not res!266806) (not e!234342))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!325099 (= res!266806 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!9104 (buf!8246 thiss!877)) (currentByte!15278 thiss!877) (currentBit!15273 thiss!877))) (bitIndex!0 (size!9104 (buf!8246 thiss!877)) (bvadd #b00000000000000000000000000000001 (currentByte!15278 thiss!877)) #b00000000000000000000000000000000)))))

(declare-fun b!325100 () Bool)

(declare-fun array_inv!8656 (array!20959) Bool)

(assert (=> b!325100 (= e!234339 (array_inv!8656 (buf!8246 thiss!877)))))

(declare-fun b!325101 () Bool)

(declare-fun e!234340 () Bool)

(assert (=> b!325101 (= e!234342 e!234340)))

(declare-fun res!266808 () Bool)

(assert (=> b!325101 (=> (not res!266808) (not e!234340))))

(declare-fun lt!447503 () (_ BitVec 64))

(assert (=> b!325101 (= res!266808 (and (bvsle ((_ sign_extend 32) (size!9104 (buf!8246 thiss!877))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle lt!447503 #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!9104 (buf!8246 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge lt!447503 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!325101 (= lt!447503 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15278 thiss!877))))))

(declare-fun b!325102 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!325102 (= e!234340 (not (invariant!0 #b00000000000000000000000000000000 ((_ extract 31 0) lt!447503) ((_ extract 31 0) ((_ sign_extend 32) (size!9104 (buf!8246 thiss!877)))))))))

(assert (= (and start!73072 res!266807) b!325098))

(assert (= (and b!325098 res!266809) b!325099))

(assert (= (and b!325099 res!266806) b!325101))

(assert (= (and b!325101 res!266808) b!325102))

(assert (= start!73072 b!325100))

(declare-fun m!463099 () Bool)

(assert (=> start!73072 m!463099))

(declare-fun m!463101 () Bool)

(assert (=> start!73072 m!463101))

(declare-fun m!463103 () Bool)

(assert (=> b!325099 m!463103))

(declare-fun m!463105 () Bool)

(assert (=> b!325099 m!463105))

(declare-fun m!463107 () Bool)

(assert (=> b!325100 m!463107))

(declare-fun m!463109 () Bool)

(assert (=> b!325102 m!463109))

(check-sat (not b!325099) (not b!325100) (not b!325102) (not start!73072))
(check-sat)
(get-model)

(declare-fun d!106994 () Bool)

(declare-fun e!234357 () Bool)

(assert (=> d!106994 e!234357))

(declare-fun res!266827 () Bool)

(assert (=> d!106994 (=> (not res!266827) (not e!234357))))

(declare-fun lt!447519 () (_ BitVec 64))

(declare-fun lt!447520 () (_ BitVec 64))

(declare-fun lt!447522 () (_ BitVec 64))

(assert (=> d!106994 (= res!266827 (= lt!447522 (bvsub lt!447519 lt!447520)))))

(assert (=> d!106994 (or (= (bvand lt!447519 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447520 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447519 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447519 lt!447520) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106994 (= lt!447520 (remainingBits!0 ((_ sign_extend 32) (size!9104 (buf!8246 thiss!877))) ((_ sign_extend 32) (currentByte!15278 thiss!877)) ((_ sign_extend 32) (currentBit!15273 thiss!877))))))

(declare-fun lt!447524 () (_ BitVec 64))

(declare-fun lt!447523 () (_ BitVec 64))

(assert (=> d!106994 (= lt!447519 (bvmul lt!447524 lt!447523))))

(assert (=> d!106994 (or (= lt!447524 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447523 (bvsdiv (bvmul lt!447524 lt!447523) lt!447524)))))

(assert (=> d!106994 (= lt!447523 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106994 (= lt!447524 ((_ sign_extend 32) (size!9104 (buf!8246 thiss!877))))))

(assert (=> d!106994 (= lt!447522 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15278 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15273 thiss!877))))))

(assert (=> d!106994 (invariant!0 (currentBit!15273 thiss!877) (currentByte!15278 thiss!877) (size!9104 (buf!8246 thiss!877)))))

(assert (=> d!106994 (= (bitIndex!0 (size!9104 (buf!8246 thiss!877)) (currentByte!15278 thiss!877) (currentBit!15273 thiss!877)) lt!447522)))

(declare-fun b!325122 () Bool)

(declare-fun res!266826 () Bool)

(assert (=> b!325122 (=> (not res!266826) (not e!234357))))

(assert (=> b!325122 (= res!266826 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447522))))

(declare-fun b!325123 () Bool)

(declare-fun lt!447521 () (_ BitVec 64))

(assert (=> b!325123 (= e!234357 (bvsle lt!447522 (bvmul lt!447521 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!325123 (or (= lt!447521 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447521 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447521)))))

(assert (=> b!325123 (= lt!447521 ((_ sign_extend 32) (size!9104 (buf!8246 thiss!877))))))

(assert (= (and d!106994 res!266827) b!325122))

(assert (= (and b!325122 res!266826) b!325123))

(assert (=> d!106994 m!463099))

(declare-fun m!463123 () Bool)

(assert (=> d!106994 m!463123))

(assert (=> b!325099 d!106994))

(declare-fun d!106998 () Bool)

(declare-fun e!234358 () Bool)

(assert (=> d!106998 e!234358))

(declare-fun res!266829 () Bool)

(assert (=> d!106998 (=> (not res!266829) (not e!234358))))

(declare-fun lt!447525 () (_ BitVec 64))

(declare-fun lt!447526 () (_ BitVec 64))

(declare-fun lt!447528 () (_ BitVec 64))

(assert (=> d!106998 (= res!266829 (= lt!447528 (bvsub lt!447525 lt!447526)))))

(assert (=> d!106998 (or (= (bvand lt!447525 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447526 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447525 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447525 lt!447526) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106998 (= lt!447526 (remainingBits!0 ((_ sign_extend 32) (size!9104 (buf!8246 thiss!877))) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15278 thiss!877))) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(declare-fun lt!447530 () (_ BitVec 64))

(declare-fun lt!447529 () (_ BitVec 64))

(assert (=> d!106998 (= lt!447525 (bvmul lt!447530 lt!447529))))

(assert (=> d!106998 (or (= lt!447530 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447529 (bvsdiv (bvmul lt!447530 lt!447529) lt!447530)))))

(assert (=> d!106998 (= lt!447529 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106998 (= lt!447530 ((_ sign_extend 32) (size!9104 (buf!8246 thiss!877))))))

(assert (=> d!106998 (= lt!447528 (bvadd (bvmul ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15278 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(assert (=> d!106998 (invariant!0 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!15278 thiss!877)) (size!9104 (buf!8246 thiss!877)))))

(assert (=> d!106998 (= (bitIndex!0 (size!9104 (buf!8246 thiss!877)) (bvadd #b00000000000000000000000000000001 (currentByte!15278 thiss!877)) #b00000000000000000000000000000000) lt!447528)))

(declare-fun b!325124 () Bool)

(declare-fun res!266828 () Bool)

(assert (=> b!325124 (=> (not res!266828) (not e!234358))))

(assert (=> b!325124 (= res!266828 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447528))))

(declare-fun b!325125 () Bool)

(declare-fun lt!447527 () (_ BitVec 64))

(assert (=> b!325125 (= e!234358 (bvsle lt!447528 (bvmul lt!447527 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!325125 (or (= lt!447527 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447527 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447527)))))

(assert (=> b!325125 (= lt!447527 ((_ sign_extend 32) (size!9104 (buf!8246 thiss!877))))))

(assert (= (and d!106998 res!266829) b!325124))

(assert (= (and b!325124 res!266828) b!325125))

(declare-fun m!463125 () Bool)

(assert (=> d!106998 m!463125))

(declare-fun m!463127 () Bool)

(assert (=> d!106998 m!463127))

(assert (=> b!325099 d!106998))

(declare-fun d!107000 () Bool)

(assert (=> d!107000 (= (array_inv!8656 (buf!8246 thiss!877)) (bvsge (size!9104 (buf!8246 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!325100 d!107000))

(declare-fun d!107002 () Bool)

(assert (=> d!107002 (= (invariant!0 #b00000000000000000000000000000000 ((_ extract 31 0) lt!447503) ((_ extract 31 0) ((_ sign_extend 32) (size!9104 (buf!8246 thiss!877))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) lt!447503) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) lt!447503) ((_ extract 31 0) ((_ sign_extend 32) (size!9104 (buf!8246 thiss!877))))) (and (= #b00000000000000000000000000000000 #b00000000000000000000000000000000) (= ((_ extract 31 0) lt!447503) ((_ extract 31 0) ((_ sign_extend 32) (size!9104 (buf!8246 thiss!877)))))))))))

(assert (=> b!325102 d!107002))

(declare-fun d!107006 () Bool)

(assert (=> d!107006 (= (remainingBits!0 ((_ sign_extend 32) (size!9104 (buf!8246 thiss!877))) ((_ sign_extend 32) (currentByte!15278 thiss!877)) ((_ sign_extend 32) (currentBit!15273 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9104 (buf!8246 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15278 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15273 thiss!877)))))))

(assert (=> start!73072 d!107006))

(declare-fun d!107010 () Bool)

(assert (=> d!107010 (= (inv!12 thiss!877) (invariant!0 (currentBit!15273 thiss!877) (currentByte!15278 thiss!877) (size!9104 (buf!8246 thiss!877))))))

(declare-fun bs!28166 () Bool)

(assert (= bs!28166 d!107010))

(assert (=> bs!28166 m!463123))

(assert (=> start!73072 d!107010))

(check-sat (not d!106994) (not d!107010) (not d!106998))
