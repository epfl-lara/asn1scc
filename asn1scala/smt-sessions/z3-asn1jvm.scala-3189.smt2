; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73324 () Bool)

(assert start!73324)

(declare-fun res!267058 () Bool)

(declare-fun e!234668 () Bool)

(assert (=> start!73324 (=> (not res!267058) (not e!234668))))

(declare-datatypes ((array!21043 0))(
  ( (array!21044 (arr!10226 (Array (_ BitVec 32) (_ BitVec 8))) (size!9134 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14430 0))(
  ( (BitStream!14431 (buf!8276 array!21043) (currentByte!15356 (_ BitVec 32)) (currentBit!15351 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14430)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!73324 (= res!267058 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9134 (buf!8276 thiss!877))) ((_ sign_extend 32) (currentByte!15356 thiss!877)) ((_ sign_extend 32) (currentBit!15351 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!73324 e!234668))

(declare-fun e!234667 () Bool)

(declare-fun inv!12 (BitStream!14430) Bool)

(assert (=> start!73324 (and (inv!12 thiss!877) e!234667)))

(declare-fun b!325439 () Bool)

(declare-fun res!267057 () Bool)

(assert (=> b!325439 (=> (not res!267057) (not e!234668))))

(assert (=> b!325439 (= res!267057 (bvsge (currentBit!15351 thiss!877) #b00000000000000000000000000000111))))

(declare-fun b!325440 () Bool)

(declare-fun lt!447841 () (_ BitVec 64))

(declare-fun lt!447842 () (_ BitVec 64))

(assert (=> b!325440 (= e!234668 (and (= lt!447841 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= lt!447841 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!447842) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!325440 (= lt!447841 (bvand lt!447842 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!325440 (= lt!447842 (bitIndex!0 (size!9134 (buf!8276 thiss!877)) (currentByte!15356 thiss!877) (currentBit!15351 thiss!877)))))

(declare-fun b!325441 () Bool)

(declare-fun array_inv!8686 (array!21043) Bool)

(assert (=> b!325441 (= e!234667 (array_inv!8686 (buf!8276 thiss!877)))))

(assert (= (and start!73324 res!267058) b!325439))

(assert (= (and b!325439 res!267057) b!325440))

(assert (= start!73324 b!325441))

(declare-fun m!463443 () Bool)

(assert (=> start!73324 m!463443))

(declare-fun m!463445 () Bool)

(assert (=> start!73324 m!463445))

(declare-fun m!463447 () Bool)

(assert (=> b!325440 m!463447))

(declare-fun m!463449 () Bool)

(assert (=> b!325441 m!463449))

(check-sat (not start!73324) (not b!325440) (not b!325441))
(check-sat)
(get-model)

(declare-fun d!107270 () Bool)

(assert (=> d!107270 (= (remainingBits!0 ((_ sign_extend 32) (size!9134 (buf!8276 thiss!877))) ((_ sign_extend 32) (currentByte!15356 thiss!877)) ((_ sign_extend 32) (currentBit!15351 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9134 (buf!8276 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15356 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15351 thiss!877)))))))

(assert (=> start!73324 d!107270))

(declare-fun d!107276 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!107276 (= (inv!12 thiss!877) (invariant!0 (currentBit!15351 thiss!877) (currentByte!15356 thiss!877) (size!9134 (buf!8276 thiss!877))))))

(declare-fun bs!28229 () Bool)

(assert (= bs!28229 d!107276))

(declare-fun m!463459 () Bool)

(assert (=> bs!28229 m!463459))

(assert (=> start!73324 d!107276))

(declare-fun d!107278 () Bool)

(declare-fun e!234684 () Bool)

(assert (=> d!107278 e!234684))

(declare-fun res!267076 () Bool)

(assert (=> d!107278 (=> (not res!267076) (not e!234684))))

(declare-fun lt!447880 () (_ BitVec 64))

(declare-fun lt!447879 () (_ BitVec 64))

(declare-fun lt!447882 () (_ BitVec 64))

(assert (=> d!107278 (= res!267076 (= lt!447879 (bvsub lt!447882 lt!447880)))))

(assert (=> d!107278 (or (= (bvand lt!447882 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447880 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447882 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447882 lt!447880) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!107278 (= lt!447880 (remainingBits!0 ((_ sign_extend 32) (size!9134 (buf!8276 thiss!877))) ((_ sign_extend 32) (currentByte!15356 thiss!877)) ((_ sign_extend 32) (currentBit!15351 thiss!877))))))

(declare-fun lt!447883 () (_ BitVec 64))

(declare-fun lt!447884 () (_ BitVec 64))

(assert (=> d!107278 (= lt!447882 (bvmul lt!447883 lt!447884))))

(assert (=> d!107278 (or (= lt!447883 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447884 (bvsdiv (bvmul lt!447883 lt!447884) lt!447883)))))

(assert (=> d!107278 (= lt!447884 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!107278 (= lt!447883 ((_ sign_extend 32) (size!9134 (buf!8276 thiss!877))))))

(assert (=> d!107278 (= lt!447879 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15356 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15351 thiss!877))))))

(assert (=> d!107278 (invariant!0 (currentBit!15351 thiss!877) (currentByte!15356 thiss!877) (size!9134 (buf!8276 thiss!877)))))

(assert (=> d!107278 (= (bitIndex!0 (size!9134 (buf!8276 thiss!877)) (currentByte!15356 thiss!877) (currentBit!15351 thiss!877)) lt!447879)))

(declare-fun b!325461 () Bool)

(declare-fun res!267075 () Bool)

(assert (=> b!325461 (=> (not res!267075) (not e!234684))))

(assert (=> b!325461 (= res!267075 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447879))))

(declare-fun b!325462 () Bool)

(declare-fun lt!447881 () (_ BitVec 64))

(assert (=> b!325462 (= e!234684 (bvsle lt!447879 (bvmul lt!447881 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!325462 (or (= lt!447881 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447881 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447881)))))

(assert (=> b!325462 (= lt!447881 ((_ sign_extend 32) (size!9134 (buf!8276 thiss!877))))))

(assert (= (and d!107278 res!267076) b!325461))

(assert (= (and b!325461 res!267075) b!325462))

(assert (=> d!107278 m!463443))

(assert (=> d!107278 m!463459))

(assert (=> b!325440 d!107278))

(declare-fun d!107292 () Bool)

(assert (=> d!107292 (= (array_inv!8686 (buf!8276 thiss!877)) (bvsge (size!9134 (buf!8276 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!325441 d!107292))

(check-sat (not d!107276) (not d!107278))
