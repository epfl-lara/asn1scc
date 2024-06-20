; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16376 () Bool)

(assert start!16376)

(declare-fun res!67554 () Bool)

(declare-fun e!53993 () Bool)

(assert (=> start!16376 (=> (not res!67554) (not e!53993))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-datatypes ((array!3661 0))(
  ( (array!3662 (arr!2317 (Array (_ BitVec 32) (_ BitVec 8))) (size!1680 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2922 0))(
  ( (BitStream!2923 (buf!2070 array!3661) (currentByte!4016 (_ BitVec 32)) (currentBit!4011 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!2922)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun b1!98 () BitStream!2922)

(assert (=> start!16376 (= res!67554 (and (= (size!1680 (buf!2070 b1!98)) (size!1680 (buf!2070 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16376 e!53993))

(declare-fun e!53995 () Bool)

(declare-fun inv!12 (BitStream!2922) Bool)

(assert (=> start!16376 (and (inv!12 b1!98) e!53995)))

(declare-fun e!53994 () Bool)

(assert (=> start!16376 (and (inv!12 b2!98) e!53994)))

(assert (=> start!16376 true))

(declare-fun b!81929 () Bool)

(declare-fun e!53992 () Bool)

(assert (=> b!81929 (= e!53992 (not (or (bvsgt ((_ sign_extend 32) (size!1680 (buf!2070 b1!98))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4016 b1!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4011 b1!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (and (bvsge ((_ sign_extend 32) (size!1680 (buf!2070 b1!98))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4016 b1!98)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4011 b1!98)) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!130235 () (_ BitVec 64))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!81929 (= (remainingBits!0 ((_ sign_extend 32) (size!1680 (buf!2070 b1!98))) ((_ sign_extend 32) (currentByte!4016 b1!98)) ((_ sign_extend 32) (currentBit!4011 b1!98))) (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1680 (buf!2070 b1!98)))) lt!130235))))

(declare-datatypes ((Unit!5469 0))(
  ( (Unit!5470) )
))
(declare-fun lt!130236 () Unit!5469)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!2922) Unit!5469)

(assert (=> b!81929 (= lt!130236 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!81930 () Bool)

(assert (=> b!81930 (= e!53993 e!53992)))

(declare-fun res!67555 () Bool)

(assert (=> b!81930 (=> (not res!67555) (not e!53992))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!81930 (= res!67555 (= (bvadd lt!130235 b1b2Diff!1) (bitIndex!0 (size!1680 (buf!2070 b2!98)) (currentByte!4016 b2!98) (currentBit!4011 b2!98))))))

(assert (=> b!81930 (= lt!130235 (bitIndex!0 (size!1680 (buf!2070 b1!98)) (currentByte!4016 b1!98) (currentBit!4011 b1!98)))))

(declare-fun b!81931 () Bool)

(declare-fun array_inv!1526 (array!3661) Bool)

(assert (=> b!81931 (= e!53995 (array_inv!1526 (buf!2070 b1!98)))))

(declare-fun b!81932 () Bool)

(assert (=> b!81932 (= e!53994 (array_inv!1526 (buf!2070 b2!98)))))

(declare-fun b!81933 () Bool)

(declare-fun res!67553 () Bool)

(assert (=> b!81933 (=> (not res!67553) (not e!53993))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!81933 (= res!67553 (validate_offset_bits!1 ((_ sign_extend 32) (size!1680 (buf!2070 b1!98))) ((_ sign_extend 32) (currentByte!4016 b1!98)) ((_ sign_extend 32) (currentBit!4011 b1!98)) b1ValidateOffsetBits!11))))

(assert (= (and start!16376 res!67554) b!81933))

(assert (= (and b!81933 res!67553) b!81930))

(assert (= (and b!81930 res!67555) b!81929))

(assert (= start!16376 b!81931))

(assert (= start!16376 b!81932))

(declare-fun m!128343 () Bool)

(assert (=> b!81929 m!128343))

(declare-fun m!128345 () Bool)

(assert (=> b!81929 m!128345))

(declare-fun m!128347 () Bool)

(assert (=> b!81932 m!128347))

(declare-fun m!128349 () Bool)

(assert (=> start!16376 m!128349))

(declare-fun m!128351 () Bool)

(assert (=> start!16376 m!128351))

(declare-fun m!128353 () Bool)

(assert (=> b!81931 m!128353))

(declare-fun m!128355 () Bool)

(assert (=> b!81930 m!128355))

(declare-fun m!128357 () Bool)

(assert (=> b!81930 m!128357))

(declare-fun m!128359 () Bool)

(assert (=> b!81933 m!128359))

(check-sat (not b!81929) (not b!81933) (not b!81931) (not start!16376) (not b!81930) (not b!81932))
(check-sat)
(get-model)

(declare-fun d!25686 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!25686 (= (inv!12 b1!98) (invariant!0 (currentBit!4011 b1!98) (currentByte!4016 b1!98) (size!1680 (buf!2070 b1!98))))))

(declare-fun bs!6294 () Bool)

(assert (= bs!6294 d!25686))

(declare-fun m!128379 () Bool)

(assert (=> bs!6294 m!128379))

(assert (=> start!16376 d!25686))

(declare-fun d!25688 () Bool)

(assert (=> d!25688 (= (inv!12 b2!98) (invariant!0 (currentBit!4011 b2!98) (currentByte!4016 b2!98) (size!1680 (buf!2070 b2!98))))))

(declare-fun bs!6295 () Bool)

(assert (= bs!6295 d!25688))

(declare-fun m!128381 () Bool)

(assert (=> bs!6295 m!128381))

(assert (=> start!16376 d!25688))

(declare-fun d!25690 () Bool)

(assert (=> d!25690 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1680 (buf!2070 b1!98))) ((_ sign_extend 32) (currentByte!4016 b1!98)) ((_ sign_extend 32) (currentBit!4011 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1680 (buf!2070 b1!98))) ((_ sign_extend 32) (currentByte!4016 b1!98)) ((_ sign_extend 32) (currentBit!4011 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6296 () Bool)

(assert (= bs!6296 d!25690))

(assert (=> bs!6296 m!128343))

(assert (=> b!81933 d!25690))

(declare-fun d!25692 () Bool)

(assert (=> d!25692 (= (array_inv!1526 (buf!2070 b2!98)) (bvsge (size!1680 (buf!2070 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!81932 d!25692))

(declare-fun d!25694 () Bool)

(assert (=> d!25694 (= (remainingBits!0 ((_ sign_extend 32) (size!1680 (buf!2070 b1!98))) ((_ sign_extend 32) (currentByte!4016 b1!98)) ((_ sign_extend 32) (currentBit!4011 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1680 (buf!2070 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4016 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4011 b1!98)))))))

(assert (=> b!81929 d!25694))

(declare-fun d!25696 () Bool)

(declare-fun lt!130256 () (_ BitVec 64))

(declare-fun lt!130254 () (_ BitVec 64))

(assert (=> d!25696 (= (remainingBits!0 ((_ sign_extend 32) (size!1680 (buf!2070 b1!98))) ((_ sign_extend 32) (currentByte!4016 b1!98)) ((_ sign_extend 32) (currentBit!4011 b1!98))) (bvsub lt!130256 lt!130254))))

(assert (=> d!25696 (or (= (bvand lt!130256 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!130254 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!130256 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!130256 lt!130254) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25696 (= lt!130254 (bitIndex!0 (size!1680 (buf!2070 b1!98)) (currentByte!4016 b1!98) (currentBit!4011 b1!98)))))

(declare-fun lt!130257 () (_ BitVec 64))

(declare-fun lt!130255 () (_ BitVec 64))

(assert (=> d!25696 (= lt!130256 (bvmul lt!130257 lt!130255))))

(assert (=> d!25696 (or (= lt!130257 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!130255 (bvsdiv (bvmul lt!130257 lt!130255) lt!130257)))))

(assert (=> d!25696 (= lt!130255 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25696 (= lt!130257 ((_ sign_extend 32) (size!1680 (buf!2070 b1!98))))))

(declare-fun lt!130253 () Unit!5469)

(declare-fun choose!23 (BitStream!2922) Unit!5469)

(assert (=> d!25696 (= lt!130253 (choose!23 b1!98))))

(assert (=> d!25696 (= (remainingBitsBitIndexLemma!0 b1!98) lt!130253)))

(declare-fun bs!6297 () Bool)

(assert (= bs!6297 d!25696))

(assert (=> bs!6297 m!128343))

(assert (=> bs!6297 m!128357))

(declare-fun m!128383 () Bool)

(assert (=> bs!6297 m!128383))

(assert (=> b!81929 d!25696))

(declare-fun d!25698 () Bool)

(declare-fun e!54018 () Bool)

(assert (=> d!25698 e!54018))

(declare-fun res!67570 () Bool)

(assert (=> d!25698 (=> (not res!67570) (not e!54018))))

(declare-fun lt!130272 () (_ BitVec 64))

(declare-fun lt!130271 () (_ BitVec 64))

(declare-fun lt!130275 () (_ BitVec 64))

(assert (=> d!25698 (= res!67570 (= lt!130271 (bvsub lt!130272 lt!130275)))))

(assert (=> d!25698 (or (= (bvand lt!130272 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!130275 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!130272 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!130272 lt!130275) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25698 (= lt!130275 (remainingBits!0 ((_ sign_extend 32) (size!1680 (buf!2070 b2!98))) ((_ sign_extend 32) (currentByte!4016 b2!98)) ((_ sign_extend 32) (currentBit!4011 b2!98))))))

(declare-fun lt!130270 () (_ BitVec 64))

(declare-fun lt!130273 () (_ BitVec 64))

(assert (=> d!25698 (= lt!130272 (bvmul lt!130270 lt!130273))))

(assert (=> d!25698 (or (= lt!130270 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!130273 (bvsdiv (bvmul lt!130270 lt!130273) lt!130270)))))

(assert (=> d!25698 (= lt!130273 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25698 (= lt!130270 ((_ sign_extend 32) (size!1680 (buf!2070 b2!98))))))

(assert (=> d!25698 (= lt!130271 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4016 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4011 b2!98))))))

(assert (=> d!25698 (invariant!0 (currentBit!4011 b2!98) (currentByte!4016 b2!98) (size!1680 (buf!2070 b2!98)))))

(assert (=> d!25698 (= (bitIndex!0 (size!1680 (buf!2070 b2!98)) (currentByte!4016 b2!98) (currentBit!4011 b2!98)) lt!130271)))

(declare-fun b!81954 () Bool)

(declare-fun res!67569 () Bool)

(assert (=> b!81954 (=> (not res!67569) (not e!54018))))

(assert (=> b!81954 (= res!67569 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!130271))))

(declare-fun b!81955 () Bool)

(declare-fun lt!130274 () (_ BitVec 64))

(assert (=> b!81955 (= e!54018 (bvsle lt!130271 (bvmul lt!130274 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!81955 (or (= lt!130274 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!130274 #b0000000000000000000000000000000000000000000000000000000000001000) lt!130274)))))

(assert (=> b!81955 (= lt!130274 ((_ sign_extend 32) (size!1680 (buf!2070 b2!98))))))

(assert (= (and d!25698 res!67570) b!81954))

(assert (= (and b!81954 res!67569) b!81955))

(declare-fun m!128385 () Bool)

(assert (=> d!25698 m!128385))

(assert (=> d!25698 m!128381))

(assert (=> b!81930 d!25698))

(declare-fun d!25702 () Bool)

(declare-fun e!54019 () Bool)

(assert (=> d!25702 e!54019))

(declare-fun res!67572 () Bool)

(assert (=> d!25702 (=> (not res!67572) (not e!54019))))

(declare-fun lt!130278 () (_ BitVec 64))

(declare-fun lt!130281 () (_ BitVec 64))

(declare-fun lt!130277 () (_ BitVec 64))

(assert (=> d!25702 (= res!67572 (= lt!130277 (bvsub lt!130278 lt!130281)))))

(assert (=> d!25702 (or (= (bvand lt!130278 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!130281 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!130278 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!130278 lt!130281) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25702 (= lt!130281 (remainingBits!0 ((_ sign_extend 32) (size!1680 (buf!2070 b1!98))) ((_ sign_extend 32) (currentByte!4016 b1!98)) ((_ sign_extend 32) (currentBit!4011 b1!98))))))

(declare-fun lt!130276 () (_ BitVec 64))

(declare-fun lt!130279 () (_ BitVec 64))

(assert (=> d!25702 (= lt!130278 (bvmul lt!130276 lt!130279))))

(assert (=> d!25702 (or (= lt!130276 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!130279 (bvsdiv (bvmul lt!130276 lt!130279) lt!130276)))))

(assert (=> d!25702 (= lt!130279 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25702 (= lt!130276 ((_ sign_extend 32) (size!1680 (buf!2070 b1!98))))))

(assert (=> d!25702 (= lt!130277 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4016 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4011 b1!98))))))

(assert (=> d!25702 (invariant!0 (currentBit!4011 b1!98) (currentByte!4016 b1!98) (size!1680 (buf!2070 b1!98)))))

(assert (=> d!25702 (= (bitIndex!0 (size!1680 (buf!2070 b1!98)) (currentByte!4016 b1!98) (currentBit!4011 b1!98)) lt!130277)))

(declare-fun b!81956 () Bool)

(declare-fun res!67571 () Bool)

(assert (=> b!81956 (=> (not res!67571) (not e!54019))))

(assert (=> b!81956 (= res!67571 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!130277))))

(declare-fun b!81957 () Bool)

(declare-fun lt!130280 () (_ BitVec 64))

(assert (=> b!81957 (= e!54019 (bvsle lt!130277 (bvmul lt!130280 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!81957 (or (= lt!130280 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!130280 #b0000000000000000000000000000000000000000000000000000000000001000) lt!130280)))))

(assert (=> b!81957 (= lt!130280 ((_ sign_extend 32) (size!1680 (buf!2070 b1!98))))))

(assert (= (and d!25702 res!67572) b!81956))

(assert (= (and b!81956 res!67571) b!81957))

(assert (=> d!25702 m!128343))

(assert (=> d!25702 m!128379))

(assert (=> b!81930 d!25702))

(declare-fun d!25704 () Bool)

(assert (=> d!25704 (= (array_inv!1526 (buf!2070 b1!98)) (bvsge (size!1680 (buf!2070 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!81931 d!25704))

(check-sat (not d!25690) (not d!25686) (not d!25698) (not d!25696) (not d!25702) (not d!25688))
