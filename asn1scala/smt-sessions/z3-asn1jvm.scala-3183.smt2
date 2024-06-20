; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73150 () Bool)

(assert start!73150)

(declare-fun res!266892 () Bool)

(declare-fun e!234463 () Bool)

(assert (=> start!73150 (=> (not res!266892) (not e!234463))))

(declare-datatypes ((array!20989 0))(
  ( (array!20990 (arr!10208 (Array (_ BitVec 32) (_ BitVec 8))) (size!9116 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14394 0))(
  ( (BitStream!14395 (buf!8258 array!20989) (currentByte!15305 (_ BitVec 32)) (currentBit!15300 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14394)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!73150 (= res!266892 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9116 (buf!8258 thiss!877))) ((_ sign_extend 32) (currentByte!15305 thiss!877)) ((_ sign_extend 32) (currentBit!15300 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!73150 e!234463))

(declare-fun e!234465 () Bool)

(declare-fun inv!12 (BitStream!14394) Bool)

(assert (=> start!73150 (and (inv!12 thiss!877) e!234465)))

(declare-fun b!325220 () Bool)

(declare-fun res!266893 () Bool)

(assert (=> b!325220 (=> (not res!266893) (not e!234463))))

(assert (=> b!325220 (= res!266893 (bvslt (currentBit!15300 thiss!877) #b00000000000000000000000000000111))))

(declare-fun b!325221 () Bool)

(declare-fun lt!447589 () (_ BitVec 64))

(declare-fun lt!447590 () (_ BitVec 64))

(assert (=> b!325221 (= e!234463 (and (= lt!447589 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= lt!447589 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!447590) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!325221 (= lt!447589 (bvand lt!447590 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!325221 (= lt!447590 (bitIndex!0 (size!9116 (buf!8258 thiss!877)) (currentByte!15305 thiss!877) (currentBit!15300 thiss!877)))))

(declare-fun b!325222 () Bool)

(declare-fun array_inv!8668 (array!20989) Bool)

(assert (=> b!325222 (= e!234465 (array_inv!8668 (buf!8258 thiss!877)))))

(assert (= (and start!73150 res!266892) b!325220))

(assert (= (and b!325220 res!266893) b!325221))

(assert (= start!73150 b!325222))

(declare-fun m!463221 () Bool)

(assert (=> start!73150 m!463221))

(declare-fun m!463223 () Bool)

(assert (=> start!73150 m!463223))

(declare-fun m!463225 () Bool)

(assert (=> b!325221 m!463225))

(declare-fun m!463227 () Bool)

(assert (=> b!325222 m!463227))

(check-sat (not b!325222) (not start!73150) (not b!325221))
(check-sat)
(get-model)

(declare-fun d!107074 () Bool)

(assert (=> d!107074 (= (array_inv!8668 (buf!8258 thiss!877)) (bvsge (size!9116 (buf!8258 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!325222 d!107074))

(declare-fun d!107076 () Bool)

(assert (=> d!107076 (= (remainingBits!0 ((_ sign_extend 32) (size!9116 (buf!8258 thiss!877))) ((_ sign_extend 32) (currentByte!15305 thiss!877)) ((_ sign_extend 32) (currentBit!15300 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9116 (buf!8258 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15305 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15300 thiss!877)))))))

(assert (=> start!73150 d!107076))

(declare-fun d!107078 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!107078 (= (inv!12 thiss!877) (invariant!0 (currentBit!15300 thiss!877) (currentByte!15305 thiss!877) (size!9116 (buf!8258 thiss!877))))))

(declare-fun bs!28187 () Bool)

(assert (= bs!28187 d!107078))

(declare-fun m!463237 () Bool)

(assert (=> bs!28187 m!463237))

(assert (=> start!73150 d!107078))

(declare-fun d!107082 () Bool)

(declare-fun e!234477 () Bool)

(assert (=> d!107082 e!234477))

(declare-fun res!266904 () Bool)

(assert (=> d!107082 (=> (not res!266904) (not e!234477))))

(declare-fun lt!447611 () (_ BitVec 64))

(declare-fun lt!447609 () (_ BitVec 64))

(declare-fun lt!447613 () (_ BitVec 64))

(assert (=> d!107082 (= res!266904 (= lt!447613 (bvsub lt!447609 lt!447611)))))

(assert (=> d!107082 (or (= (bvand lt!447609 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447611 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447609 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447609 lt!447611) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!107082 (= lt!447611 (remainingBits!0 ((_ sign_extend 32) (size!9116 (buf!8258 thiss!877))) ((_ sign_extend 32) (currentByte!15305 thiss!877)) ((_ sign_extend 32) (currentBit!15300 thiss!877))))))

(declare-fun lt!447614 () (_ BitVec 64))

(declare-fun lt!447612 () (_ BitVec 64))

(assert (=> d!107082 (= lt!447609 (bvmul lt!447614 lt!447612))))

(assert (=> d!107082 (or (= lt!447614 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447612 (bvsdiv (bvmul lt!447614 lt!447612) lt!447614)))))

(assert (=> d!107082 (= lt!447612 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!107082 (= lt!447614 ((_ sign_extend 32) (size!9116 (buf!8258 thiss!877))))))

(assert (=> d!107082 (= lt!447613 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15305 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15300 thiss!877))))))

(assert (=> d!107082 (invariant!0 (currentBit!15300 thiss!877) (currentByte!15305 thiss!877) (size!9116 (buf!8258 thiss!877)))))

(assert (=> d!107082 (= (bitIndex!0 (size!9116 (buf!8258 thiss!877)) (currentByte!15305 thiss!877) (currentBit!15300 thiss!877)) lt!447613)))

(declare-fun b!325236 () Bool)

(declare-fun res!266905 () Bool)

(assert (=> b!325236 (=> (not res!266905) (not e!234477))))

(assert (=> b!325236 (= res!266905 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447613))))

(declare-fun b!325237 () Bool)

(declare-fun lt!447610 () (_ BitVec 64))

(assert (=> b!325237 (= e!234477 (bvsle lt!447613 (bvmul lt!447610 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!325237 (or (= lt!447610 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447610 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447610)))))

(assert (=> b!325237 (= lt!447610 ((_ sign_extend 32) (size!9116 (buf!8258 thiss!877))))))

(assert (= (and d!107082 res!266904) b!325236))

(assert (= (and b!325236 res!266905) b!325237))

(assert (=> d!107082 m!463221))

(assert (=> d!107082 m!463237))

(assert (=> b!325221 d!107082))

(check-sat (not d!107082) (not d!107078))
