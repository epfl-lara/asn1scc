; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73148 () Bool)

(assert start!73148)

(declare-fun res!266886 () Bool)

(declare-fun e!234456 () Bool)

(assert (=> start!73148 (=> (not res!266886) (not e!234456))))

(declare-datatypes ((array!20987 0))(
  ( (array!20988 (arr!10207 (Array (_ BitVec 32) (_ BitVec 8))) (size!9115 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14392 0))(
  ( (BitStream!14393 (buf!8257 array!20987) (currentByte!15304 (_ BitVec 32)) (currentBit!15299 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14392)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!73148 (= res!266886 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9115 (buf!8257 thiss!877))) ((_ sign_extend 32) (currentByte!15304 thiss!877)) ((_ sign_extend 32) (currentBit!15299 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!73148 e!234456))

(declare-fun e!234454 () Bool)

(declare-fun inv!12 (BitStream!14392) Bool)

(assert (=> start!73148 (and (inv!12 thiss!877) e!234454)))

(declare-fun b!325211 () Bool)

(declare-fun res!266887 () Bool)

(assert (=> b!325211 (=> (not res!266887) (not e!234456))))

(assert (=> b!325211 (= res!266887 (bvslt (currentBit!15299 thiss!877) #b00000000000000000000000000000111))))

(declare-fun b!325212 () Bool)

(declare-fun lt!447583 () (_ BitVec 64))

(declare-fun lt!447584 () (_ BitVec 64))

(assert (=> b!325212 (= e!234456 (and (= lt!447583 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= lt!447583 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!447584) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!325212 (= lt!447583 (bvand lt!447584 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!325212 (= lt!447584 (bitIndex!0 (size!9115 (buf!8257 thiss!877)) (currentByte!15304 thiss!877) (currentBit!15299 thiss!877)))))

(declare-fun b!325213 () Bool)

(declare-fun array_inv!8667 (array!20987) Bool)

(assert (=> b!325213 (= e!234454 (array_inv!8667 (buf!8257 thiss!877)))))

(assert (= (and start!73148 res!266886) b!325211))

(assert (= (and b!325211 res!266887) b!325212))

(assert (= start!73148 b!325213))

(declare-fun m!463213 () Bool)

(assert (=> start!73148 m!463213))

(declare-fun m!463215 () Bool)

(assert (=> start!73148 m!463215))

(declare-fun m!463217 () Bool)

(assert (=> b!325212 m!463217))

(declare-fun m!463219 () Bool)

(assert (=> b!325213 m!463219))

(push 1)

(assert (not start!73148))

(assert (not b!325212))

(assert (not b!325213))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107080 () Bool)

(assert (=> d!107080 (= (remainingBits!0 ((_ sign_extend 32) (size!9115 (buf!8257 thiss!877))) ((_ sign_extend 32) (currentByte!15304 thiss!877)) ((_ sign_extend 32) (currentBit!15299 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9115 (buf!8257 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15304 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15299 thiss!877)))))))

(assert (=> start!73148 d!107080))

(declare-fun d!107086 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!107086 (= (inv!12 thiss!877) (invariant!0 (currentBit!15299 thiss!877) (currentByte!15304 thiss!877) (size!9115 (buf!8257 thiss!877))))))

(declare-fun bs!28188 () Bool)

(assert (= bs!28188 d!107086))

(declare-fun m!463239 () Bool)

(assert (=> bs!28188 m!463239))

(assert (=> start!73148 d!107086))

(declare-fun d!107088 () Bool)

(declare-fun e!234483 () Bool)

(assert (=> d!107088 e!234483))

(declare-fun res!266917 () Bool)

(assert (=> d!107088 (=> (not res!266917) (not e!234483))))

(declare-fun lt!447648 () (_ BitVec 64))

(declare-fun lt!447645 () (_ BitVec 64))

(declare-fun lt!447647 () (_ BitVec 64))

(assert (=> d!107088 (= res!266917 (= lt!447645 (bvsub lt!447647 lt!447648)))))

(assert (=> d!107088 (or (= (bvand lt!447647 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447648 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447647 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447647 lt!447648) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!107088 (= lt!447648 (remainingBits!0 ((_ sign_extend 32) (size!9115 (buf!8257 thiss!877))) ((_ sign_extend 32) (currentByte!15304 thiss!877)) ((_ sign_extend 32) (currentBit!15299 thiss!877))))))

(declare-fun lt!447650 () (_ BitVec 64))

(declare-fun lt!447646 () (_ BitVec 64))

(assert (=> d!107088 (= lt!447647 (bvmul lt!447650 lt!447646))))

(assert (=> d!107088 (or (= lt!447650 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447646 (bvsdiv (bvmul lt!447650 lt!447646) lt!447650)))))

(assert (=> d!107088 (= lt!447646 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!107088 (= lt!447650 ((_ sign_extend 32) (size!9115 (buf!8257 thiss!877))))))

(assert (=> d!107088 (= lt!447645 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15304 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15299 thiss!877))))))

(assert (=> d!107088 (invariant!0 (currentBit!15299 thiss!877) (currentByte!15304 thiss!877) (size!9115 (buf!8257 thiss!877)))))

(assert (=> d!107088 (= (bitIndex!0 (size!9115 (buf!8257 thiss!877)) (currentByte!15304 thiss!877) (currentBit!15299 thiss!877)) lt!447645)))

(declare-fun b!325248 () Bool)

(declare-fun res!266916 () Bool)

(assert (=> b!325248 (=> (not res!266916) (not e!234483))))

(assert (=> b!325248 (= res!266916 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447645))))

(declare-fun b!325249 () Bool)

(declare-fun lt!447649 () (_ BitVec 64))

(assert (=> b!325249 (= e!234483 (bvsle lt!447645 (bvmul lt!447649 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!325249 (or (= lt!447649 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447649 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447649)))))

(assert (=> b!325249 (= lt!447649 ((_ sign_extend 32) (size!9115 (buf!8257 thiss!877))))))

(assert (= (and d!107088 res!266917) b!325248))

(assert (= (and b!325248 res!266916) b!325249))

(assert (=> d!107088 m!463213))

(assert (=> d!107088 m!463239))

(assert (=> b!325212 d!107088))

(declare-fun d!107094 () Bool)

(assert (=> d!107094 (= (array_inv!8667 (buf!8257 thiss!877)) (bvsge (size!9115 (buf!8257 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!325213 d!107094))

(push 1)

(assert (not d!107088))

(assert (not d!107086))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

