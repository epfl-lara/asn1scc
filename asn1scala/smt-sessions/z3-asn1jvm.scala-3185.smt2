; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73210 () Bool)

(assert start!73210)

(declare-fun res!266970 () Bool)

(declare-fun e!234543 () Bool)

(assert (=> start!73210 (=> (not res!266970) (not e!234543))))

(declare-fun lt!447755 () (_ BitVec 64))

(declare-datatypes ((array!21007 0))(
  ( (array!21008 (arr!10214 (Array (_ BitVec 32) (_ BitVec 8))) (size!9122 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14406 0))(
  ( (BitStream!14407 (buf!8264 array!21007) (currentByte!15323 (_ BitVec 32)) (currentBit!15318 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14406)

(assert (=> start!73210 (= res!266970 (and (bvsgt lt!447755 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt (currentBit!15318 thiss!877) #b00000000000000000000000000000111)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!73210 (= lt!447755 (remainingBits!0 ((_ sign_extend 32) (size!9122 (buf!8264 thiss!877))) ((_ sign_extend 32) (currentByte!15323 thiss!877)) ((_ sign_extend 32) (currentBit!15318 thiss!877))))))

(assert (=> start!73210 e!234543))

(declare-fun e!234546 () Bool)

(declare-fun inv!12 (BitStream!14406) Bool)

(assert (=> start!73210 (and (inv!12 thiss!877) e!234546)))

(declare-fun b!325316 () Bool)

(declare-fun e!234544 () Bool)

(assert (=> b!325316 (= e!234543 e!234544)))

(declare-fun res!266971 () Bool)

(assert (=> b!325316 (=> res!266971 e!234544)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!325316 (= res!266971 (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!9122 (buf!8264 thiss!877)) (currentByte!15323 thiss!877) (currentBit!15318 thiss!877))) (bitIndex!0 (size!9122 (buf!8264 thiss!877)) (currentByte!15323 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15318 thiss!877))))))))

(declare-fun b!325317 () Bool)

(assert (=> b!325317 (= e!234544 (not (= (bvsub lt!447755 (remainingBits!0 ((_ sign_extend 32) (size!9122 (buf!8264 thiss!877))) ((_ sign_extend 32) (currentByte!15323 thiss!877)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15318 thiss!877))))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!325318 () Bool)

(declare-fun array_inv!8674 (array!21007) Bool)

(assert (=> b!325318 (= e!234546 (array_inv!8674 (buf!8264 thiss!877)))))

(assert (= (and start!73210 res!266970) b!325316))

(assert (= (and b!325316 (not res!266971)) b!325317))

(assert (= start!73210 b!325318))

(declare-fun m!463303 () Bool)

(assert (=> start!73210 m!463303))

(declare-fun m!463305 () Bool)

(assert (=> start!73210 m!463305))

(declare-fun m!463307 () Bool)

(assert (=> b!325316 m!463307))

(declare-fun m!463309 () Bool)

(assert (=> b!325316 m!463309))

(declare-fun m!463311 () Bool)

(assert (=> b!325317 m!463311))

(declare-fun m!463313 () Bool)

(assert (=> b!325318 m!463313))

(check-sat (not start!73210) (not b!325318) (not b!325317) (not b!325316))
(check-sat)
(get-model)

(declare-fun d!107138 () Bool)

(assert (=> d!107138 (= (remainingBits!0 ((_ sign_extend 32) (size!9122 (buf!8264 thiss!877))) ((_ sign_extend 32) (currentByte!15323 thiss!877)) ((_ sign_extend 32) (currentBit!15318 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9122 (buf!8264 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15323 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15318 thiss!877)))))))

(assert (=> start!73210 d!107138))

(declare-fun d!107140 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!107140 (= (inv!12 thiss!877) (invariant!0 (currentBit!15318 thiss!877) (currentByte!15323 thiss!877) (size!9122 (buf!8264 thiss!877))))))

(declare-fun bs!28199 () Bool)

(assert (= bs!28199 d!107140))

(declare-fun m!463327 () Bool)

(assert (=> bs!28199 m!463327))

(assert (=> start!73210 d!107140))

(declare-fun d!107142 () Bool)

(assert (=> d!107142 (= (array_inv!8674 (buf!8264 thiss!877)) (bvsge (size!9122 (buf!8264 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!325318 d!107142))

(declare-fun d!107144 () Bool)

(assert (=> d!107144 (= (remainingBits!0 ((_ sign_extend 32) (size!9122 (buf!8264 thiss!877))) ((_ sign_extend 32) (currentByte!15323 thiss!877)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15318 thiss!877)))) (bvsub (bvmul ((_ sign_extend 32) (size!9122 (buf!8264 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15323 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15318 thiss!877))))))))

(assert (=> b!325317 d!107144))

(declare-fun d!107146 () Bool)

(declare-fun e!234561 () Bool)

(assert (=> d!107146 e!234561))

(declare-fun res!266982 () Bool)

(assert (=> d!107146 (=> (not res!266982) (not e!234561))))

(declare-fun lt!447773 () (_ BitVec 64))

(declare-fun lt!447772 () (_ BitVec 64))

(declare-fun lt!447774 () (_ BitVec 64))

(assert (=> d!107146 (= res!266982 (= lt!447772 (bvsub lt!447773 lt!447774)))))

(assert (=> d!107146 (or (= (bvand lt!447773 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447774 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447773 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447773 lt!447774) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!107146 (= lt!447774 (remainingBits!0 ((_ sign_extend 32) (size!9122 (buf!8264 thiss!877))) ((_ sign_extend 32) (currentByte!15323 thiss!877)) ((_ sign_extend 32) (currentBit!15318 thiss!877))))))

(declare-fun lt!447771 () (_ BitVec 64))

(declare-fun lt!447775 () (_ BitVec 64))

(assert (=> d!107146 (= lt!447773 (bvmul lt!447771 lt!447775))))

(assert (=> d!107146 (or (= lt!447771 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447775 (bvsdiv (bvmul lt!447771 lt!447775) lt!447771)))))

(assert (=> d!107146 (= lt!447775 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!107146 (= lt!447771 ((_ sign_extend 32) (size!9122 (buf!8264 thiss!877))))))

(assert (=> d!107146 (= lt!447772 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15323 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15318 thiss!877))))))

(assert (=> d!107146 (invariant!0 (currentBit!15318 thiss!877) (currentByte!15323 thiss!877) (size!9122 (buf!8264 thiss!877)))))

(assert (=> d!107146 (= (bitIndex!0 (size!9122 (buf!8264 thiss!877)) (currentByte!15323 thiss!877) (currentBit!15318 thiss!877)) lt!447772)))

(declare-fun b!325332 () Bool)

(declare-fun res!266983 () Bool)

(assert (=> b!325332 (=> (not res!266983) (not e!234561))))

(assert (=> b!325332 (= res!266983 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447772))))

(declare-fun b!325333 () Bool)

(declare-fun lt!447776 () (_ BitVec 64))

(assert (=> b!325333 (= e!234561 (bvsle lt!447772 (bvmul lt!447776 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!325333 (or (= lt!447776 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447776 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447776)))))

(assert (=> b!325333 (= lt!447776 ((_ sign_extend 32) (size!9122 (buf!8264 thiss!877))))))

(assert (= (and d!107146 res!266982) b!325332))

(assert (= (and b!325332 res!266983) b!325333))

(assert (=> d!107146 m!463303))

(assert (=> d!107146 m!463327))

(assert (=> b!325316 d!107146))

(declare-fun d!107158 () Bool)

(declare-fun e!234562 () Bool)

(assert (=> d!107158 e!234562))

(declare-fun res!266984 () Bool)

(assert (=> d!107158 (=> (not res!266984) (not e!234562))))

(declare-fun lt!447780 () (_ BitVec 64))

(declare-fun lt!447778 () (_ BitVec 64))

(declare-fun lt!447779 () (_ BitVec 64))

(assert (=> d!107158 (= res!266984 (= lt!447778 (bvsub lt!447779 lt!447780)))))

(assert (=> d!107158 (or (= (bvand lt!447779 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447780 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447779 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447779 lt!447780) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!107158 (= lt!447780 (remainingBits!0 ((_ sign_extend 32) (size!9122 (buf!8264 thiss!877))) ((_ sign_extend 32) (currentByte!15323 thiss!877)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15318 thiss!877)))))))

(declare-fun lt!447777 () (_ BitVec 64))

(declare-fun lt!447781 () (_ BitVec 64))

(assert (=> d!107158 (= lt!447779 (bvmul lt!447777 lt!447781))))

(assert (=> d!107158 (or (= lt!447777 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447781 (bvsdiv (bvmul lt!447777 lt!447781) lt!447777)))))

(assert (=> d!107158 (= lt!447781 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!107158 (= lt!447777 ((_ sign_extend 32) (size!9122 (buf!8264 thiss!877))))))

(assert (=> d!107158 (= lt!447778 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15323 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15318 thiss!877)))))))

(assert (=> d!107158 (invariant!0 (bvadd #b00000000000000000000000000000001 (currentBit!15318 thiss!877)) (currentByte!15323 thiss!877) (size!9122 (buf!8264 thiss!877)))))

(assert (=> d!107158 (= (bitIndex!0 (size!9122 (buf!8264 thiss!877)) (currentByte!15323 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15318 thiss!877))) lt!447778)))

(declare-fun b!325334 () Bool)

(declare-fun res!266985 () Bool)

(assert (=> b!325334 (=> (not res!266985) (not e!234562))))

(assert (=> b!325334 (= res!266985 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447778))))

(declare-fun b!325335 () Bool)

(declare-fun lt!447782 () (_ BitVec 64))

(assert (=> b!325335 (= e!234562 (bvsle lt!447778 (bvmul lt!447782 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!325335 (or (= lt!447782 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447782 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447782)))))

(assert (=> b!325335 (= lt!447782 ((_ sign_extend 32) (size!9122 (buf!8264 thiss!877))))))

(assert (= (and d!107158 res!266984) b!325334))

(assert (= (and b!325334 res!266985) b!325335))

(assert (=> d!107158 m!463311))

(declare-fun m!463331 () Bool)

(assert (=> d!107158 m!463331))

(assert (=> b!325316 d!107158))

(check-sat (not d!107140) (not d!107146) (not d!107158))
(check-sat)
