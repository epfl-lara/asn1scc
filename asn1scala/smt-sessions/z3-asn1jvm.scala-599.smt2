; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17148 () Bool)

(assert start!17148)

(declare-fun b!83639 () Bool)

(declare-fun e!55692 () Bool)

(declare-datatypes ((array!3859 0))(
  ( (array!3860 (arr!2392 (Array (_ BitVec 32) (_ BitVec 8))) (size!1755 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3072 0))(
  ( (BitStream!3073 (buf!2145 array!3859) (currentByte!4257 (_ BitVec 32)) (currentBit!4252 (_ BitVec 32))) )
))
(declare-fun b1!98 () BitStream!3072)

(declare-fun array_inv!1601 (array!3859) Bool)

(assert (=> b!83639 (= e!55692 (array_inv!1601 (buf!2145 b1!98)))))

(declare-fun b!83640 () Bool)

(declare-fun e!55689 () Bool)

(declare-fun b2!98 () BitStream!3072)

(assert (=> b!83640 (= e!55689 (array_inv!1601 (buf!2145 b2!98)))))

(declare-fun b!83641 () Bool)

(declare-fun e!55690 () Bool)

(declare-fun e!55694 () Bool)

(assert (=> b!83641 (= e!55690 (not e!55694))))

(declare-fun res!68765 () Bool)

(assert (=> b!83641 (=> res!68765 e!55694)))

(declare-fun lt!133320 () (_ BitVec 64))

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun lt!133318 () (_ BitVec 64))

(assert (=> b!83641 (= res!68765 (bvsgt lt!133318 (bvsub lt!133320 b1ValidateOffsetBits!11)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!83641 (= (remainingBits!0 ((_ sign_extend 32) (size!1755 (buf!2145 b1!98))) ((_ sign_extend 32) (currentByte!4257 b1!98)) ((_ sign_extend 32) (currentBit!4252 b1!98))) (bvsub lt!133320 lt!133318))))

(assert (=> b!83641 (= lt!133320 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1755 (buf!2145 b1!98)))))))

(declare-datatypes ((Unit!5613 0))(
  ( (Unit!5614) )
))
(declare-fun lt!133316 () Unit!5613)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!3072) Unit!5613)

(assert (=> b!83641 (= lt!133316 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun res!68767 () Bool)

(declare-fun e!55691 () Bool)

(assert (=> start!17148 (=> (not res!68767) (not e!55691))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(assert (=> start!17148 (= res!68767 (and (= (size!1755 (buf!2145 b1!98)) (size!1755 (buf!2145 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!17148 e!55691))

(declare-fun inv!12 (BitStream!3072) Bool)

(assert (=> start!17148 (and (inv!12 b1!98) e!55692)))

(assert (=> start!17148 (and (inv!12 b2!98) e!55689)))

(assert (=> start!17148 true))

(declare-fun b!83642 () Bool)

(declare-fun lt!133315 () (_ BitVec 64))

(declare-fun lt!133314 () (_ BitVec 64))

(assert (=> b!83642 (= e!55694 (or (not (= lt!133315 (bvand b1b2Diff!1 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!133315 (bvand lt!133314 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!83642 (= lt!133315 (bvand lt!133318 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!133319 () (_ BitVec 64))

(assert (=> b!83642 (= (remainingBits!0 ((_ sign_extend 32) (size!1755 (buf!2145 b2!98))) ((_ sign_extend 32) (currentByte!4257 b2!98)) ((_ sign_extend 32) (currentBit!4252 b2!98))) (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1755 (buf!2145 b2!98)))) lt!133319))))

(declare-fun lt!133317 () Unit!5613)

(assert (=> b!83642 (= lt!133317 (remainingBitsBitIndexLemma!0 b2!98))))

(declare-fun b!83643 () Bool)

(assert (=> b!83643 (= e!55691 e!55690)))

(declare-fun res!68766 () Bool)

(assert (=> b!83643 (=> (not res!68766) (not e!55690))))

(assert (=> b!83643 (= res!68766 (= lt!133314 lt!133319))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!83643 (= lt!133319 (bitIndex!0 (size!1755 (buf!2145 b2!98)) (currentByte!4257 b2!98) (currentBit!4252 b2!98)))))

(assert (=> b!83643 (= lt!133314 (bvadd lt!133318 b1b2Diff!1))))

(assert (=> b!83643 (= lt!133318 (bitIndex!0 (size!1755 (buf!2145 b1!98)) (currentByte!4257 b1!98) (currentBit!4252 b1!98)))))

(declare-fun b!83644 () Bool)

(declare-fun res!68764 () Bool)

(assert (=> b!83644 (=> (not res!68764) (not e!55691))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!83644 (= res!68764 (validate_offset_bits!1 ((_ sign_extend 32) (size!1755 (buf!2145 b1!98))) ((_ sign_extend 32) (currentByte!4257 b1!98)) ((_ sign_extend 32) (currentBit!4252 b1!98)) b1ValidateOffsetBits!11))))

(assert (= (and start!17148 res!68767) b!83644))

(assert (= (and b!83644 res!68764) b!83643))

(assert (= (and b!83643 res!68766) b!83641))

(assert (= (and b!83641 (not res!68765)) b!83642))

(assert (= start!17148 b!83639))

(assert (= start!17148 b!83640))

(declare-fun m!130249 () Bool)

(assert (=> b!83642 m!130249))

(declare-fun m!130251 () Bool)

(assert (=> b!83642 m!130251))

(declare-fun m!130253 () Bool)

(assert (=> b!83641 m!130253))

(declare-fun m!130255 () Bool)

(assert (=> b!83641 m!130255))

(declare-fun m!130257 () Bool)

(assert (=> b!83640 m!130257))

(declare-fun m!130259 () Bool)

(assert (=> b!83639 m!130259))

(declare-fun m!130261 () Bool)

(assert (=> b!83643 m!130261))

(declare-fun m!130263 () Bool)

(assert (=> b!83643 m!130263))

(declare-fun m!130265 () Bool)

(assert (=> start!17148 m!130265))

(declare-fun m!130267 () Bool)

(assert (=> start!17148 m!130267))

(declare-fun m!130269 () Bool)

(assert (=> b!83644 m!130269))

(check-sat (not b!83642) (not b!83643) (not b!83640) (not b!83639) (not start!17148) (not b!83644) (not b!83641))
(check-sat)
(get-model)

(declare-fun d!26752 () Bool)

(assert (=> d!26752 (= (remainingBits!0 ((_ sign_extend 32) (size!1755 (buf!2145 b1!98))) ((_ sign_extend 32) (currentByte!4257 b1!98)) ((_ sign_extend 32) (currentBit!4252 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1755 (buf!2145 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4257 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4252 b1!98)))))))

(assert (=> b!83641 d!26752))

(declare-fun d!26754 () Bool)

(declare-fun lt!133356 () (_ BitVec 64))

(declare-fun lt!133355 () (_ BitVec 64))

(assert (=> d!26754 (= (remainingBits!0 ((_ sign_extend 32) (size!1755 (buf!2145 b1!98))) ((_ sign_extend 32) (currentByte!4257 b1!98)) ((_ sign_extend 32) (currentBit!4252 b1!98))) (bvsub lt!133356 lt!133355))))

(assert (=> d!26754 (or (= (bvand lt!133356 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!133355 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!133356 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!133356 lt!133355) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26754 (= lt!133355 (bitIndex!0 (size!1755 (buf!2145 b1!98)) (currentByte!4257 b1!98) (currentBit!4252 b1!98)))))

(declare-fun lt!133354 () (_ BitVec 64))

(declare-fun lt!133352 () (_ BitVec 64))

(assert (=> d!26754 (= lt!133356 (bvmul lt!133354 lt!133352))))

(assert (=> d!26754 (or (= lt!133354 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!133352 (bvsdiv (bvmul lt!133354 lt!133352) lt!133354)))))

(assert (=> d!26754 (= lt!133352 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26754 (= lt!133354 ((_ sign_extend 32) (size!1755 (buf!2145 b1!98))))))

(declare-fun lt!133353 () Unit!5613)

(declare-fun choose!23 (BitStream!3072) Unit!5613)

(assert (=> d!26754 (= lt!133353 (choose!23 b1!98))))

(assert (=> d!26754 (= (remainingBitsBitIndexLemma!0 b1!98) lt!133353)))

(declare-fun bs!6589 () Bool)

(assert (= bs!6589 d!26754))

(assert (=> bs!6589 m!130253))

(assert (=> bs!6589 m!130263))

(declare-fun m!130293 () Bool)

(assert (=> bs!6589 m!130293))

(assert (=> b!83641 d!26754))

(declare-fun d!26756 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!26756 (= (inv!12 b1!98) (invariant!0 (currentBit!4252 b1!98) (currentByte!4257 b1!98) (size!1755 (buf!2145 b1!98))))))

(declare-fun bs!6590 () Bool)

(assert (= bs!6590 d!26756))

(declare-fun m!130295 () Bool)

(assert (=> bs!6590 m!130295))

(assert (=> start!17148 d!26756))

(declare-fun d!26758 () Bool)

(assert (=> d!26758 (= (inv!12 b2!98) (invariant!0 (currentBit!4252 b2!98) (currentByte!4257 b2!98) (size!1755 (buf!2145 b2!98))))))

(declare-fun bs!6591 () Bool)

(assert (= bs!6591 d!26758))

(declare-fun m!130297 () Bool)

(assert (=> bs!6591 m!130297))

(assert (=> start!17148 d!26758))

(declare-fun d!26760 () Bool)

(assert (=> d!26760 (= (remainingBits!0 ((_ sign_extend 32) (size!1755 (buf!2145 b2!98))) ((_ sign_extend 32) (currentByte!4257 b2!98)) ((_ sign_extend 32) (currentBit!4252 b2!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1755 (buf!2145 b2!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4257 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4252 b2!98)))))))

(assert (=> b!83642 d!26760))

(declare-fun d!26762 () Bool)

(declare-fun lt!133361 () (_ BitVec 64))

(declare-fun lt!133360 () (_ BitVec 64))

(assert (=> d!26762 (= (remainingBits!0 ((_ sign_extend 32) (size!1755 (buf!2145 b2!98))) ((_ sign_extend 32) (currentByte!4257 b2!98)) ((_ sign_extend 32) (currentBit!4252 b2!98))) (bvsub lt!133361 lt!133360))))

(assert (=> d!26762 (or (= (bvand lt!133361 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!133360 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!133361 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!133361 lt!133360) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26762 (= lt!133360 (bitIndex!0 (size!1755 (buf!2145 b2!98)) (currentByte!4257 b2!98) (currentBit!4252 b2!98)))))

(declare-fun lt!133359 () (_ BitVec 64))

(declare-fun lt!133357 () (_ BitVec 64))

(assert (=> d!26762 (= lt!133361 (bvmul lt!133359 lt!133357))))

(assert (=> d!26762 (or (= lt!133359 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!133357 (bvsdiv (bvmul lt!133359 lt!133357) lt!133359)))))

(assert (=> d!26762 (= lt!133357 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26762 (= lt!133359 ((_ sign_extend 32) (size!1755 (buf!2145 b2!98))))))

(declare-fun lt!133358 () Unit!5613)

(assert (=> d!26762 (= lt!133358 (choose!23 b2!98))))

(assert (=> d!26762 (= (remainingBitsBitIndexLemma!0 b2!98) lt!133358)))

(declare-fun bs!6592 () Bool)

(assert (= bs!6592 d!26762))

(assert (=> bs!6592 m!130249))

(assert (=> bs!6592 m!130261))

(declare-fun m!130299 () Bool)

(assert (=> bs!6592 m!130299))

(assert (=> b!83642 d!26762))

(declare-fun d!26764 () Bool)

(assert (=> d!26764 (= (array_inv!1601 (buf!2145 b2!98)) (bvsge (size!1755 (buf!2145 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!83640 d!26764))

(declare-fun d!26766 () Bool)

(assert (=> d!26766 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1755 (buf!2145 b1!98))) ((_ sign_extend 32) (currentByte!4257 b1!98)) ((_ sign_extend 32) (currentBit!4252 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1755 (buf!2145 b1!98))) ((_ sign_extend 32) (currentByte!4257 b1!98)) ((_ sign_extend 32) (currentBit!4252 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6593 () Bool)

(assert (= bs!6593 d!26766))

(assert (=> bs!6593 m!130253))

(assert (=> b!83644 d!26766))

(declare-fun d!26768 () Bool)

(assert (=> d!26768 (= (array_inv!1601 (buf!2145 b1!98)) (bvsge (size!1755 (buf!2145 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!83639 d!26768))

(declare-fun d!26770 () Bool)

(declare-fun e!55719 () Bool)

(assert (=> d!26770 e!55719))

(declare-fun res!68784 () Bool)

(assert (=> d!26770 (=> (not res!68784) (not e!55719))))

(declare-fun lt!133374 () (_ BitVec 64))

(declare-fun lt!133375 () (_ BitVec 64))

(declare-fun lt!133377 () (_ BitVec 64))

(assert (=> d!26770 (= res!68784 (= lt!133377 (bvsub lt!133375 lt!133374)))))

(assert (=> d!26770 (or (= (bvand lt!133375 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!133374 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!133375 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!133375 lt!133374) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26770 (= lt!133374 (remainingBits!0 ((_ sign_extend 32) (size!1755 (buf!2145 b2!98))) ((_ sign_extend 32) (currentByte!4257 b2!98)) ((_ sign_extend 32) (currentBit!4252 b2!98))))))

(declare-fun lt!133378 () (_ BitVec 64))

(declare-fun lt!133376 () (_ BitVec 64))

(assert (=> d!26770 (= lt!133375 (bvmul lt!133378 lt!133376))))

(assert (=> d!26770 (or (= lt!133378 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!133376 (bvsdiv (bvmul lt!133378 lt!133376) lt!133378)))))

(assert (=> d!26770 (= lt!133376 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26770 (= lt!133378 ((_ sign_extend 32) (size!1755 (buf!2145 b2!98))))))

(assert (=> d!26770 (= lt!133377 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4257 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4252 b2!98))))))

(assert (=> d!26770 (invariant!0 (currentBit!4252 b2!98) (currentByte!4257 b2!98) (size!1755 (buf!2145 b2!98)))))

(assert (=> d!26770 (= (bitIndex!0 (size!1755 (buf!2145 b2!98)) (currentByte!4257 b2!98) (currentBit!4252 b2!98)) lt!133377)))

(declare-fun b!83668 () Bool)

(declare-fun res!68785 () Bool)

(assert (=> b!83668 (=> (not res!68785) (not e!55719))))

(assert (=> b!83668 (= res!68785 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!133377))))

(declare-fun b!83669 () Bool)

(declare-fun lt!133379 () (_ BitVec 64))

(assert (=> b!83669 (= e!55719 (bvsle lt!133377 (bvmul lt!133379 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!83669 (or (= lt!133379 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!133379 #b0000000000000000000000000000000000000000000000000000000000001000) lt!133379)))))

(assert (=> b!83669 (= lt!133379 ((_ sign_extend 32) (size!1755 (buf!2145 b2!98))))))

(assert (= (and d!26770 res!68784) b!83668))

(assert (= (and b!83668 res!68785) b!83669))

(assert (=> d!26770 m!130249))

(assert (=> d!26770 m!130297))

(assert (=> b!83643 d!26770))

(declare-fun d!26772 () Bool)

(declare-fun e!55720 () Bool)

(assert (=> d!26772 e!55720))

(declare-fun res!68786 () Bool)

(assert (=> d!26772 (=> (not res!68786) (not e!55720))))

(declare-fun lt!133381 () (_ BitVec 64))

(declare-fun lt!133383 () (_ BitVec 64))

(declare-fun lt!133380 () (_ BitVec 64))

(assert (=> d!26772 (= res!68786 (= lt!133383 (bvsub lt!133381 lt!133380)))))

(assert (=> d!26772 (or (= (bvand lt!133381 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!133380 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!133381 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!133381 lt!133380) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26772 (= lt!133380 (remainingBits!0 ((_ sign_extend 32) (size!1755 (buf!2145 b1!98))) ((_ sign_extend 32) (currentByte!4257 b1!98)) ((_ sign_extend 32) (currentBit!4252 b1!98))))))

(declare-fun lt!133384 () (_ BitVec 64))

(declare-fun lt!133382 () (_ BitVec 64))

(assert (=> d!26772 (= lt!133381 (bvmul lt!133384 lt!133382))))

(assert (=> d!26772 (or (= lt!133384 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!133382 (bvsdiv (bvmul lt!133384 lt!133382) lt!133384)))))

(assert (=> d!26772 (= lt!133382 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26772 (= lt!133384 ((_ sign_extend 32) (size!1755 (buf!2145 b1!98))))))

(assert (=> d!26772 (= lt!133383 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4257 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4252 b1!98))))))

(assert (=> d!26772 (invariant!0 (currentBit!4252 b1!98) (currentByte!4257 b1!98) (size!1755 (buf!2145 b1!98)))))

(assert (=> d!26772 (= (bitIndex!0 (size!1755 (buf!2145 b1!98)) (currentByte!4257 b1!98) (currentBit!4252 b1!98)) lt!133383)))

(declare-fun b!83670 () Bool)

(declare-fun res!68787 () Bool)

(assert (=> b!83670 (=> (not res!68787) (not e!55720))))

(assert (=> b!83670 (= res!68787 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!133383))))

(declare-fun b!83671 () Bool)

(declare-fun lt!133385 () (_ BitVec 64))

(assert (=> b!83671 (= e!55720 (bvsle lt!133383 (bvmul lt!133385 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!83671 (or (= lt!133385 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!133385 #b0000000000000000000000000000000000000000000000000000000000001000) lt!133385)))))

(assert (=> b!83671 (= lt!133385 ((_ sign_extend 32) (size!1755 (buf!2145 b1!98))))))

(assert (= (and d!26772 res!68786) b!83670))

(assert (= (and b!83670 res!68787) b!83671))

(assert (=> d!26772 m!130253))

(assert (=> d!26772 m!130295))

(assert (=> b!83643 d!26772))

(check-sat (not d!26770) (not d!26758) (not d!26772) (not d!26756) (not d!26762) (not d!26766) (not d!26754))
