; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73180 () Bool)

(assert start!73180)

(declare-fun res!266928 () Bool)

(declare-fun e!234501 () Bool)

(assert (=> start!73180 (=> (not res!266928) (not e!234501))))

(declare-fun lt!447666 () (_ BitVec 64))

(declare-datatypes ((array!20998 0))(
  ( (array!20999 (arr!10211 (Array (_ BitVec 32) (_ BitVec 8))) (size!9119 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14400 0))(
  ( (BitStream!14401 (buf!8261 array!20998) (currentByte!15314 (_ BitVec 32)) (currentBit!15309 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14400)

(assert (=> start!73180 (= res!266928 (and (bvsgt lt!447666 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt (currentBit!15309 thiss!877) #b00000000000000000000000000000111)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!73180 (= lt!447666 (remainingBits!0 ((_ sign_extend 32) (size!9119 (buf!8261 thiss!877))) ((_ sign_extend 32) (currentByte!15314 thiss!877)) ((_ sign_extend 32) (currentBit!15309 thiss!877))))))

(assert (=> start!73180 e!234501))

(declare-fun e!234499 () Bool)

(declare-fun inv!12 (BitStream!14400) Bool)

(assert (=> start!73180 (and (inv!12 thiss!877) e!234499)))

(declare-fun b!325265 () Bool)

(declare-fun res!266929 () Bool)

(assert (=> b!325265 (=> (not res!266929) (not e!234501))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!325265 (= res!266929 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!9119 (buf!8261 thiss!877)) (currentByte!15314 thiss!877) (currentBit!15309 thiss!877))) (bitIndex!0 (size!9119 (buf!8261 thiss!877)) (currentByte!15314 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15309 thiss!877)))))))

(declare-fun b!325266 () Bool)

(declare-fun lt!447668 () (_ BitVec 64))

(declare-fun lt!447667 () (_ BitVec 64))

(assert (=> b!325266 (= e!234501 (and (not (= lt!447667 (bvand lt!447668 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= lt!447667 (bvand (bvsub lt!447666 lt!447668) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!325266 (= lt!447667 (bvand lt!447666 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!325266 (= lt!447668 (remainingBits!0 ((_ sign_extend 32) (size!9119 (buf!8261 thiss!877))) ((_ sign_extend 32) (currentByte!15314 thiss!877)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15309 thiss!877)))))))

(declare-fun b!325267 () Bool)

(declare-fun array_inv!8671 (array!20998) Bool)

(assert (=> b!325267 (= e!234499 (array_inv!8671 (buf!8261 thiss!877)))))

(assert (= (and start!73180 res!266928) b!325265))

(assert (= (and b!325265 res!266929) b!325266))

(assert (= start!73180 b!325267))

(declare-fun m!463255 () Bool)

(assert (=> start!73180 m!463255))

(declare-fun m!463257 () Bool)

(assert (=> start!73180 m!463257))

(declare-fun m!463259 () Bool)

(assert (=> b!325265 m!463259))

(declare-fun m!463261 () Bool)

(assert (=> b!325265 m!463261))

(declare-fun m!463263 () Bool)

(assert (=> b!325266 m!463263))

(declare-fun m!463265 () Bool)

(assert (=> b!325267 m!463265))

(check-sat (not b!325265) (not b!325267) (not start!73180) (not b!325266))
(check-sat)
(get-model)

(declare-fun d!107100 () Bool)

(declare-fun e!234513 () Bool)

(assert (=> d!107100 e!234513))

(declare-fun res!266940 () Bool)

(assert (=> d!107100 (=> (not res!266940) (not e!234513))))

(declare-fun lt!447692 () (_ BitVec 64))

(declare-fun lt!447693 () (_ BitVec 64))

(declare-fun lt!447690 () (_ BitVec 64))

(assert (=> d!107100 (= res!266940 (= lt!447692 (bvsub lt!447693 lt!447690)))))

(assert (=> d!107100 (or (= (bvand lt!447693 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447690 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447693 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447693 lt!447690) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!107100 (= lt!447690 (remainingBits!0 ((_ sign_extend 32) (size!9119 (buf!8261 thiss!877))) ((_ sign_extend 32) (currentByte!15314 thiss!877)) ((_ sign_extend 32) (currentBit!15309 thiss!877))))))

(declare-fun lt!447694 () (_ BitVec 64))

(declare-fun lt!447695 () (_ BitVec 64))

(assert (=> d!107100 (= lt!447693 (bvmul lt!447694 lt!447695))))

(assert (=> d!107100 (or (= lt!447694 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447695 (bvsdiv (bvmul lt!447694 lt!447695) lt!447694)))))

(assert (=> d!107100 (= lt!447695 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!107100 (= lt!447694 ((_ sign_extend 32) (size!9119 (buf!8261 thiss!877))))))

(assert (=> d!107100 (= lt!447692 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15314 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15309 thiss!877))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!107100 (invariant!0 (currentBit!15309 thiss!877) (currentByte!15314 thiss!877) (size!9119 (buf!8261 thiss!877)))))

(assert (=> d!107100 (= (bitIndex!0 (size!9119 (buf!8261 thiss!877)) (currentByte!15314 thiss!877) (currentBit!15309 thiss!877)) lt!447692)))

(declare-fun b!325281 () Bool)

(declare-fun res!266941 () Bool)

(assert (=> b!325281 (=> (not res!266941) (not e!234513))))

(assert (=> b!325281 (= res!266941 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447692))))

(declare-fun b!325282 () Bool)

(declare-fun lt!447691 () (_ BitVec 64))

(assert (=> b!325282 (= e!234513 (bvsle lt!447692 (bvmul lt!447691 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!325282 (or (= lt!447691 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447691 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447691)))))

(assert (=> b!325282 (= lt!447691 ((_ sign_extend 32) (size!9119 (buf!8261 thiss!877))))))

(assert (= (and d!107100 res!266940) b!325281))

(assert (= (and b!325281 res!266941) b!325282))

(assert (=> d!107100 m!463255))

(declare-fun m!463279 () Bool)

(assert (=> d!107100 m!463279))

(assert (=> b!325265 d!107100))

(declare-fun d!107104 () Bool)

(declare-fun e!234514 () Bool)

(assert (=> d!107104 e!234514))

(declare-fun res!266942 () Bool)

(assert (=> d!107104 (=> (not res!266942) (not e!234514))))

(declare-fun lt!447696 () (_ BitVec 64))

(declare-fun lt!447698 () (_ BitVec 64))

(declare-fun lt!447699 () (_ BitVec 64))

(assert (=> d!107104 (= res!266942 (= lt!447698 (bvsub lt!447699 lt!447696)))))

(assert (=> d!107104 (or (= (bvand lt!447699 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447696 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447699 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447699 lt!447696) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!107104 (= lt!447696 (remainingBits!0 ((_ sign_extend 32) (size!9119 (buf!8261 thiss!877))) ((_ sign_extend 32) (currentByte!15314 thiss!877)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15309 thiss!877)))))))

(declare-fun lt!447700 () (_ BitVec 64))

(declare-fun lt!447701 () (_ BitVec 64))

(assert (=> d!107104 (= lt!447699 (bvmul lt!447700 lt!447701))))

(assert (=> d!107104 (or (= lt!447700 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447701 (bvsdiv (bvmul lt!447700 lt!447701) lt!447700)))))

(assert (=> d!107104 (= lt!447701 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!107104 (= lt!447700 ((_ sign_extend 32) (size!9119 (buf!8261 thiss!877))))))

(assert (=> d!107104 (= lt!447698 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15314 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15309 thiss!877)))))))

(assert (=> d!107104 (invariant!0 (bvadd #b00000000000000000000000000000001 (currentBit!15309 thiss!877)) (currentByte!15314 thiss!877) (size!9119 (buf!8261 thiss!877)))))

(assert (=> d!107104 (= (bitIndex!0 (size!9119 (buf!8261 thiss!877)) (currentByte!15314 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15309 thiss!877))) lt!447698)))

(declare-fun b!325283 () Bool)

(declare-fun res!266943 () Bool)

(assert (=> b!325283 (=> (not res!266943) (not e!234514))))

(assert (=> b!325283 (= res!266943 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447698))))

(declare-fun b!325284 () Bool)

(declare-fun lt!447697 () (_ BitVec 64))

(assert (=> b!325284 (= e!234514 (bvsle lt!447698 (bvmul lt!447697 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!325284 (or (= lt!447697 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447697 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447697)))))

(assert (=> b!325284 (= lt!447697 ((_ sign_extend 32) (size!9119 (buf!8261 thiss!877))))))

(assert (= (and d!107104 res!266942) b!325283))

(assert (= (and b!325283 res!266943) b!325284))

(assert (=> d!107104 m!463263))

(declare-fun m!463281 () Bool)

(assert (=> d!107104 m!463281))

(assert (=> b!325265 d!107104))

(declare-fun d!107106 () Bool)

(assert (=> d!107106 (= (array_inv!8671 (buf!8261 thiss!877)) (bvsge (size!9119 (buf!8261 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!325267 d!107106))

(declare-fun d!107108 () Bool)

(assert (=> d!107108 (= (remainingBits!0 ((_ sign_extend 32) (size!9119 (buf!8261 thiss!877))) ((_ sign_extend 32) (currentByte!15314 thiss!877)) ((_ sign_extend 32) (currentBit!15309 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9119 (buf!8261 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15314 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15309 thiss!877)))))))

(assert (=> start!73180 d!107108))

(declare-fun d!107110 () Bool)

(assert (=> d!107110 (= (inv!12 thiss!877) (invariant!0 (currentBit!15309 thiss!877) (currentByte!15314 thiss!877) (size!9119 (buf!8261 thiss!877))))))

(declare-fun bs!28193 () Bool)

(assert (= bs!28193 d!107110))

(assert (=> bs!28193 m!463279))

(assert (=> start!73180 d!107110))

(declare-fun d!107112 () Bool)

(assert (=> d!107112 (= (remainingBits!0 ((_ sign_extend 32) (size!9119 (buf!8261 thiss!877))) ((_ sign_extend 32) (currentByte!15314 thiss!877)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15309 thiss!877)))) (bvsub (bvmul ((_ sign_extend 32) (size!9119 (buf!8261 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15314 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15309 thiss!877))))))))

(assert (=> b!325266 d!107112))

(check-sat (not d!107110) (not d!107104) (not d!107100))
