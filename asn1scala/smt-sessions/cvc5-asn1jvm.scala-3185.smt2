; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73208 () Bool)

(assert start!73208)

(declare-fun res!266964 () Bool)

(declare-fun e!234533 () Bool)

(assert (=> start!73208 (=> (not res!266964) (not e!234533))))

(declare-fun lt!447752 () (_ BitVec 64))

(declare-datatypes ((array!21005 0))(
  ( (array!21006 (arr!10213 (Array (_ BitVec 32) (_ BitVec 8))) (size!9121 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14404 0))(
  ( (BitStream!14405 (buf!8263 array!21005) (currentByte!15322 (_ BitVec 32)) (currentBit!15317 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14404)

(assert (=> start!73208 (= res!266964 (and (bvsgt lt!447752 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt (currentBit!15317 thiss!877) #b00000000000000000000000000000111)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!73208 (= lt!447752 (remainingBits!0 ((_ sign_extend 32) (size!9121 (buf!8263 thiss!877))) ((_ sign_extend 32) (currentByte!15322 thiss!877)) ((_ sign_extend 32) (currentBit!15317 thiss!877))))))

(assert (=> start!73208 e!234533))

(declare-fun e!234534 () Bool)

(declare-fun inv!12 (BitStream!14404) Bool)

(assert (=> start!73208 (and (inv!12 thiss!877) e!234534)))

(declare-fun b!325307 () Bool)

(declare-fun e!234531 () Bool)

(assert (=> b!325307 (= e!234533 e!234531)))

(declare-fun res!266965 () Bool)

(assert (=> b!325307 (=> res!266965 e!234531)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!325307 (= res!266965 (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!9121 (buf!8263 thiss!877)) (currentByte!15322 thiss!877) (currentBit!15317 thiss!877))) (bitIndex!0 (size!9121 (buf!8263 thiss!877)) (currentByte!15322 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15317 thiss!877))))))))

(declare-fun b!325308 () Bool)

(assert (=> b!325308 (= e!234531 (not (= (bvsub lt!447752 (remainingBits!0 ((_ sign_extend 32) (size!9121 (buf!8263 thiss!877))) ((_ sign_extend 32) (currentByte!15322 thiss!877)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15317 thiss!877))))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!325309 () Bool)

(declare-fun array_inv!8673 (array!21005) Bool)

(assert (=> b!325309 (= e!234534 (array_inv!8673 (buf!8263 thiss!877)))))

(assert (= (and start!73208 res!266964) b!325307))

(assert (= (and b!325307 (not res!266965)) b!325308))

(assert (= start!73208 b!325309))

(declare-fun m!463291 () Bool)

(assert (=> start!73208 m!463291))

(declare-fun m!463293 () Bool)

(assert (=> start!73208 m!463293))

(declare-fun m!463295 () Bool)

(assert (=> b!325307 m!463295))

(declare-fun m!463297 () Bool)

(assert (=> b!325307 m!463297))

(declare-fun m!463299 () Bool)

(assert (=> b!325308 m!463299))

(declare-fun m!463301 () Bool)

(assert (=> b!325309 m!463301))

(push 1)

(assert (not start!73208))

(assert (not b!325309))

(assert (not b!325308))

(assert (not b!325307))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107148 () Bool)

(assert (=> d!107148 (= (remainingBits!0 ((_ sign_extend 32) (size!9121 (buf!8263 thiss!877))) ((_ sign_extend 32) (currentByte!15322 thiss!877)) ((_ sign_extend 32) (currentBit!15317 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9121 (buf!8263 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15322 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15317 thiss!877)))))))

(assert (=> start!73208 d!107148))

(declare-fun d!107150 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!107150 (= (inv!12 thiss!877) (invariant!0 (currentBit!15317 thiss!877) (currentByte!15322 thiss!877) (size!9121 (buf!8263 thiss!877))))))

(declare-fun bs!28200 () Bool)

(assert (= bs!28200 d!107150))

(declare-fun m!463329 () Bool)

(assert (=> bs!28200 m!463329))

(assert (=> start!73208 d!107150))

(declare-fun d!107152 () Bool)

(assert (=> d!107152 (= (array_inv!8673 (buf!8263 thiss!877)) (bvsge (size!9121 (buf!8263 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!325309 d!107152))

(declare-fun d!107154 () Bool)

(assert (=> d!107154 (= (remainingBits!0 ((_ sign_extend 32) (size!9121 (buf!8263 thiss!877))) ((_ sign_extend 32) (currentByte!15322 thiss!877)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15317 thiss!877)))) (bvsub (bvmul ((_ sign_extend 32) (size!9121 (buf!8263 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15322 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15317 thiss!877))))))))

(assert (=> b!325308 d!107154))

(declare-fun d!107156 () Bool)

(declare-fun e!234565 () Bool)

(assert (=> d!107156 e!234565))

(declare-fun res!266990 () Bool)

(assert (=> d!107156 (=> (not res!266990) (not e!234565))))

(declare-fun lt!447798 () (_ BitVec 64))

(declare-fun lt!447797 () (_ BitVec 64))

(declare-fun lt!447796 () (_ BitVec 64))

(assert (=> d!107156 (= res!266990 (= lt!447797 (bvsub lt!447798 lt!447796)))))

(assert (=> d!107156 (or (= (bvand lt!447798 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447796 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447798 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447798 lt!447796) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!107156 (= lt!447796 (remainingBits!0 ((_ sign_extend 32) (size!9121 (buf!8263 thiss!877))) ((_ sign_extend 32) (currentByte!15322 thiss!877)) ((_ sign_extend 32) (currentBit!15317 thiss!877))))))

(declare-fun lt!447800 () (_ BitVec 64))

(declare-fun lt!447799 () (_ BitVec 64))

(assert (=> d!107156 (= lt!447798 (bvmul lt!447800 lt!447799))))

(assert (=> d!107156 (or (= lt!447800 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447799 (bvsdiv (bvmul lt!447800 lt!447799) lt!447800)))))

(assert (=> d!107156 (= lt!447799 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!107156 (= lt!447800 ((_ sign_extend 32) (size!9121 (buf!8263 thiss!877))))))

(assert (=> d!107156 (= lt!447797 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15322 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15317 thiss!877))))))

(assert (=> d!107156 (invariant!0 (currentBit!15317 thiss!877) (currentByte!15322 thiss!877) (size!9121 (buf!8263 thiss!877)))))

(assert (=> d!107156 (= (bitIndex!0 (size!9121 (buf!8263 thiss!877)) (currentByte!15322 thiss!877) (currentBit!15317 thiss!877)) lt!447797)))

(declare-fun b!325340 () Bool)

(declare-fun res!266991 () Bool)

(assert (=> b!325340 (=> (not res!266991) (not e!234565))))

(assert (=> b!325340 (= res!266991 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447797))))

(declare-fun b!325341 () Bool)

(declare-fun lt!447795 () (_ BitVec 64))

(assert (=> b!325341 (= e!234565 (bvsle lt!447797 (bvmul lt!447795 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!325341 (or (= lt!447795 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447795 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447795)))))

(assert (=> b!325341 (= lt!447795 ((_ sign_extend 32) (size!9121 (buf!8263 thiss!877))))))

(assert (= (and d!107156 res!266990) b!325340))

(assert (= (and b!325340 res!266991) b!325341))

(assert (=> d!107156 m!463291))

(assert (=> d!107156 m!463329))

(assert (=> b!325307 d!107156))

(declare-fun d!107166 () Bool)

(declare-fun e!234566 () Bool)

(assert (=> d!107166 e!234566))

(declare-fun res!266992 () Bool)

(assert (=> d!107166 (=> (not res!266992) (not e!234566))))

(declare-fun lt!447804 () (_ BitVec 64))

(declare-fun lt!447803 () (_ BitVec 64))

(declare-fun lt!447802 () (_ BitVec 64))

(assert (=> d!107166 (= res!266992 (= lt!447803 (bvsub lt!447804 lt!447802)))))

(assert (=> d!107166 (or (= (bvand lt!447804 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447802 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447804 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447804 lt!447802) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!107166 (= lt!447802 (remainingBits!0 ((_ sign_extend 32) (size!9121 (buf!8263 thiss!877))) ((_ sign_extend 32) (currentByte!15322 thiss!877)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15317 thiss!877)))))))

(declare-fun lt!447806 () (_ BitVec 64))

(declare-fun lt!447805 () (_ BitVec 64))

(assert (=> d!107166 (= lt!447804 (bvmul lt!447806 lt!447805))))

(assert (=> d!107166 (or (= lt!447806 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447805 (bvsdiv (bvmul lt!447806 lt!447805) lt!447806)))))

(assert (=> d!107166 (= lt!447805 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!107166 (= lt!447806 ((_ sign_extend 32) (size!9121 (buf!8263 thiss!877))))))

(assert (=> d!107166 (= lt!447803 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15322 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15317 thiss!877)))))))

(assert (=> d!107166 (invariant!0 (bvadd #b00000000000000000000000000000001 (currentBit!15317 thiss!877)) (currentByte!15322 thiss!877) (size!9121 (buf!8263 thiss!877)))))

(assert (=> d!107166 (= (bitIndex!0 (size!9121 (buf!8263 thiss!877)) (currentByte!15322 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15317 thiss!877))) lt!447803)))

(declare-fun b!325342 () Bool)

(declare-fun res!266993 () Bool)

(assert (=> b!325342 (=> (not res!266993) (not e!234566))))

(assert (=> b!325342 (= res!266993 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447803))))

(declare-fun b!325343 () Bool)

(declare-fun lt!447801 () (_ BitVec 64))

(assert (=> b!325343 (= e!234566 (bvsle lt!447803 (bvmul lt!447801 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!325343 (or (= lt!447801 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447801 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447801)))))

(assert (=> b!325343 (= lt!447801 ((_ sign_extend 32) (size!9121 (buf!8263 thiss!877))))))

(assert (= (and d!107166 res!266992) b!325342))

(assert (= (and b!325342 res!266993) b!325343))

(assert (=> d!107166 m!463299))

(declare-fun m!463333 () Bool)

(assert (=> d!107166 m!463333))

(assert (=> b!325307 d!107166))

(push 1)

(assert (not d!107150))

(assert (not d!107166))

(assert (not d!107156))

(check-sat)

(pop 1)

(push 1)

(check-sat)

