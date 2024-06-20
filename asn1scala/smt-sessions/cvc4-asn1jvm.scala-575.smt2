; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16424 () Bool)

(assert start!16424)

(declare-fun b!82025 () Bool)

(declare-fun e!54089 () Bool)

(declare-datatypes ((array!3672 0))(
  ( (array!3673 (arr!2321 (Array (_ BitVec 32) (_ BitVec 8))) (size!1684 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2930 0))(
  ( (BitStream!2931 (buf!2074 array!3672) (currentByte!4030 (_ BitVec 32)) (currentBit!4025 (_ BitVec 32))) )
))
(declare-fun b1!98 () BitStream!2930)

(declare-fun array_inv!1530 (array!3672) Bool)

(assert (=> b!82025 (= e!54089 (array_inv!1530 (buf!2074 b1!98)))))

(declare-fun b!82026 () Bool)

(declare-fun e!54085 () Bool)

(declare-fun e!54084 () Bool)

(assert (=> b!82026 (= e!54085 e!54084)))

(declare-fun res!67623 () Bool)

(assert (=> b!82026 (=> (not res!67623) (not e!54084))))

(declare-fun lt!130377 () (_ BitVec 64))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-fun b2!98 () BitStream!2930)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!82026 (= res!67623 (= (bvadd lt!130377 b1b2Diff!1) (bitIndex!0 (size!1684 (buf!2074 b2!98)) (currentByte!4030 b2!98) (currentBit!4025 b2!98))))))

(assert (=> b!82026 (= lt!130377 (bitIndex!0 (size!1684 (buf!2074 b1!98)) (currentByte!4030 b1!98) (currentBit!4025 b1!98)))))

(declare-fun b!82027 () Bool)

(declare-fun e!54086 () Bool)

(assert (=> b!82027 (= e!54084 (not e!54086))))

(declare-fun res!67622 () Bool)

(assert (=> b!82027 (=> res!67622 e!54086)))

(assert (=> b!82027 (= res!67622 (or (bvsgt ((_ sign_extend 32) (size!1684 (buf!2074 b1!98))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4030 b1!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4025 b1!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvslt ((_ sign_extend 32) (size!1684 (buf!2074 b1!98))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!4030 b1!98)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!4025 b1!98)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!82027 (= (remainingBits!0 ((_ sign_extend 32) (size!1684 (buf!2074 b1!98))) ((_ sign_extend 32) (currentByte!4030 b1!98)) ((_ sign_extend 32) (currentBit!4025 b1!98))) (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1684 (buf!2074 b1!98)))) lt!130377))))

(declare-datatypes ((Unit!5477 0))(
  ( (Unit!5478) )
))
(declare-fun lt!130376 () Unit!5477)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!2930) Unit!5477)

(assert (=> b!82027 (= lt!130376 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!82028 () Bool)

(declare-fun e!54087 () Bool)

(assert (=> b!82028 (= e!54087 (array_inv!1530 (buf!2074 b2!98)))))

(declare-fun res!67621 () Bool)

(assert (=> start!16424 (=> (not res!67621) (not e!54085))))

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(assert (=> start!16424 (= res!67621 (and (= (size!1684 (buf!2074 b1!98)) (size!1684 (buf!2074 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16424 e!54085))

(declare-fun inv!12 (BitStream!2930) Bool)

(assert (=> start!16424 (and (inv!12 b1!98) e!54089)))

(assert (=> start!16424 (and (inv!12 b2!98) e!54087)))

(assert (=> start!16424 true))

(declare-fun b!82029 () Bool)

(declare-fun res!67624 () Bool)

(assert (=> b!82029 (=> (not res!67624) (not e!54085))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!82029 (= res!67624 (validate_offset_bits!1 ((_ sign_extend 32) (size!1684 (buf!2074 b1!98))) ((_ sign_extend 32) (currentByte!4030 b1!98)) ((_ sign_extend 32) (currentBit!4025 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!82030 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!82030 (= e!54086 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4025 b1!98))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4030 b1!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1684 (buf!2074 b1!98))))))))

(assert (= (and start!16424 res!67621) b!82029))

(assert (= (and b!82029 res!67624) b!82026))

(assert (= (and b!82026 res!67623) b!82027))

(assert (= (and b!82027 (not res!67622)) b!82030))

(assert (= start!16424 b!82025))

(assert (= start!16424 b!82028))

(declare-fun m!128443 () Bool)

(assert (=> b!82030 m!128443))

(declare-fun m!128445 () Bool)

(assert (=> b!82029 m!128445))

(declare-fun m!128447 () Bool)

(assert (=> b!82027 m!128447))

(declare-fun m!128449 () Bool)

(assert (=> b!82027 m!128449))

(declare-fun m!128451 () Bool)

(assert (=> start!16424 m!128451))

(declare-fun m!128453 () Bool)

(assert (=> start!16424 m!128453))

(declare-fun m!128455 () Bool)

(assert (=> b!82025 m!128455))

(declare-fun m!128457 () Bool)

(assert (=> b!82026 m!128457))

(declare-fun m!128459 () Bool)

(assert (=> b!82026 m!128459))

(declare-fun m!128461 () Bool)

(assert (=> b!82028 m!128461))

(push 1)

(assert (not start!16424))

(assert (not b!82030))

(assert (not b!82028))

(assert (not b!82025))

(assert (not b!82027))

(assert (not b!82029))

(assert (not b!82026))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!25768 () Bool)

(assert (=> d!25768 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4025 b1!98))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4030 b1!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1684 (buf!2074 b1!98))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4025 b1!98))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4025 b1!98))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4030 b1!98))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4030 b1!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1684 (buf!2074 b1!98))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4025 b1!98))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4030 b1!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1684 (buf!2074 b1!98)))))))))))

(assert (=> b!82030 d!25768))

(declare-fun d!25772 () Bool)

(assert (=> d!25772 (= (array_inv!1530 (buf!2074 b1!98)) (bvsge (size!1684 (buf!2074 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!82025 d!25772))

(declare-fun d!25774 () Bool)

(declare-fun e!54097 () Bool)

(assert (=> d!25774 e!54097))

(declare-fun res!67637 () Bool)

(assert (=> d!25774 (=> (not res!67637) (not e!54097))))

(declare-fun lt!130448 () (_ BitVec 64))

(declare-fun lt!130446 () (_ BitVec 64))

(declare-fun lt!130444 () (_ BitVec 64))

(assert (=> d!25774 (= res!67637 (= lt!130446 (bvsub lt!130448 lt!130444)))))

(assert (=> d!25774 (or (= (bvand lt!130448 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!130444 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!130448 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!130448 lt!130444) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25774 (= lt!130444 (remainingBits!0 ((_ sign_extend 32) (size!1684 (buf!2074 b2!98))) ((_ sign_extend 32) (currentByte!4030 b2!98)) ((_ sign_extend 32) (currentBit!4025 b2!98))))))

(declare-fun lt!130447 () (_ BitVec 64))

(declare-fun lt!130445 () (_ BitVec 64))

(assert (=> d!25774 (= lt!130448 (bvmul lt!130447 lt!130445))))

(assert (=> d!25774 (or (= lt!130447 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!130445 (bvsdiv (bvmul lt!130447 lt!130445) lt!130447)))))

(assert (=> d!25774 (= lt!130445 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25774 (= lt!130447 ((_ sign_extend 32) (size!1684 (buf!2074 b2!98))))))

(assert (=> d!25774 (= lt!130446 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4030 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4025 b2!98))))))

(assert (=> d!25774 (invariant!0 (currentBit!4025 b2!98) (currentByte!4030 b2!98) (size!1684 (buf!2074 b2!98)))))

(assert (=> d!25774 (= (bitIndex!0 (size!1684 (buf!2074 b2!98)) (currentByte!4030 b2!98) (currentBit!4025 b2!98)) lt!130446)))

(declare-fun b!82045 () Bool)

(declare-fun res!67638 () Bool)

(assert (=> b!82045 (=> (not res!67638) (not e!54097))))

(assert (=> b!82045 (= res!67638 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!130446))))

(declare-fun b!82046 () Bool)

(declare-fun lt!130449 () (_ BitVec 64))

(assert (=> b!82046 (= e!54097 (bvsle lt!130446 (bvmul lt!130449 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82046 (or (= lt!130449 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!130449 #b0000000000000000000000000000000000000000000000000000000000001000) lt!130449)))))

(assert (=> b!82046 (= lt!130449 ((_ sign_extend 32) (size!1684 (buf!2074 b2!98))))))

(assert (= (and d!25774 res!67637) b!82045))

(assert (= (and b!82045 res!67638) b!82046))

(declare-fun m!128473 () Bool)

(assert (=> d!25774 m!128473))

(declare-fun m!128475 () Bool)

(assert (=> d!25774 m!128475))

(assert (=> b!82026 d!25774))

(declare-fun d!25782 () Bool)

(declare-fun e!54098 () Bool)

(assert (=> d!25782 e!54098))

(declare-fun res!67639 () Bool)

(assert (=> d!25782 (=> (not res!67639) (not e!54098))))

(declare-fun lt!130450 () (_ BitVec 64))

(declare-fun lt!130452 () (_ BitVec 64))

(declare-fun lt!130454 () (_ BitVec 64))

(assert (=> d!25782 (= res!67639 (= lt!130452 (bvsub lt!130454 lt!130450)))))

(assert (=> d!25782 (or (= (bvand lt!130454 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!130450 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!130454 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!130454 lt!130450) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25782 (= lt!130450 (remainingBits!0 ((_ sign_extend 32) (size!1684 (buf!2074 b1!98))) ((_ sign_extend 32) (currentByte!4030 b1!98)) ((_ sign_extend 32) (currentBit!4025 b1!98))))))

(declare-fun lt!130453 () (_ BitVec 64))

(declare-fun lt!130451 () (_ BitVec 64))

(assert (=> d!25782 (= lt!130454 (bvmul lt!130453 lt!130451))))

(assert (=> d!25782 (or (= lt!130453 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!130451 (bvsdiv (bvmul lt!130453 lt!130451) lt!130453)))))

(assert (=> d!25782 (= lt!130451 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25782 (= lt!130453 ((_ sign_extend 32) (size!1684 (buf!2074 b1!98))))))

(assert (=> d!25782 (= lt!130452 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4030 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4025 b1!98))))))

(assert (=> d!25782 (invariant!0 (currentBit!4025 b1!98) (currentByte!4030 b1!98) (size!1684 (buf!2074 b1!98)))))

(assert (=> d!25782 (= (bitIndex!0 (size!1684 (buf!2074 b1!98)) (currentByte!4030 b1!98) (currentBit!4025 b1!98)) lt!130452)))

(declare-fun b!82047 () Bool)

(declare-fun res!67640 () Bool)

(assert (=> b!82047 (=> (not res!67640) (not e!54098))))

(assert (=> b!82047 (= res!67640 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!130452))))

(declare-fun b!82048 () Bool)

(declare-fun lt!130455 () (_ BitVec 64))

(assert (=> b!82048 (= e!54098 (bvsle lt!130452 (bvmul lt!130455 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82048 (or (= lt!130455 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!130455 #b0000000000000000000000000000000000000000000000000000000000001000) lt!130455)))))

(assert (=> b!82048 (= lt!130455 ((_ sign_extend 32) (size!1684 (buf!2074 b1!98))))))

(assert (= (and d!25782 res!67639) b!82047))

(assert (= (and b!82047 res!67640) b!82048))

(assert (=> d!25782 m!128447))

(declare-fun m!128477 () Bool)

(assert (=> d!25782 m!128477))

(assert (=> b!82026 d!25782))

(declare-fun d!25784 () Bool)

(assert (=> d!25784 (= (inv!12 b1!98) (invariant!0 (currentBit!4025 b1!98) (currentByte!4030 b1!98) (size!1684 (buf!2074 b1!98))))))

(declare-fun bs!6315 () Bool)

(assert (= bs!6315 d!25784))

(assert (=> bs!6315 m!128477))

(assert (=> start!16424 d!25784))

(declare-fun d!25786 () Bool)

(assert (=> d!25786 (= (inv!12 b2!98) (invariant!0 (currentBit!4025 b2!98) (currentByte!4030 b2!98) (size!1684 (buf!2074 b2!98))))))

(declare-fun bs!6316 () Bool)

(assert (= bs!6316 d!25786))

(assert (=> bs!6316 m!128475))

(assert (=> start!16424 d!25786))

(declare-fun d!25788 () Bool)

(assert (=> d!25788 (= (remainingBits!0 ((_ sign_extend 32) (size!1684 (buf!2074 b1!98))) ((_ sign_extend 32) (currentByte!4030 b1!98)) ((_ sign_extend 32) (currentBit!4025 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1684 (buf!2074 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4030 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4025 b1!98)))))))

(assert (=> b!82027 d!25788))

(declare-fun d!25790 () Bool)

(declare-fun lt!130490 () (_ BitVec 64))

(declare-fun lt!130493 () (_ BitVec 64))

(assert (=> d!25790 (= (remainingBits!0 ((_ sign_extend 32) (size!1684 (buf!2074 b1!98))) ((_ sign_extend 32) (currentByte!4030 b1!98)) ((_ sign_extend 32) (currentBit!4025 b1!98))) (bvsub lt!130490 lt!130493))))

(assert (=> d!25790 (or (= (bvand lt!130490 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!130493 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!130490 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!130490 lt!130493) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25790 (= lt!130493 (bitIndex!0 (size!1684 (buf!2074 b1!98)) (currentByte!4030 b1!98) (currentBit!4025 b1!98)))))

(declare-fun lt!130492 () (_ BitVec 64))

(declare-fun lt!130494 () (_ BitVec 64))

(assert (=> d!25790 (= lt!130490 (bvmul lt!130492 lt!130494))))

(assert (=> d!25790 (or (= lt!130492 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!130494 (bvsdiv (bvmul lt!130492 lt!130494) lt!130492)))))

(assert (=> d!25790 (= lt!130494 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25790 (= lt!130492 ((_ sign_extend 32) (size!1684 (buf!2074 b1!98))))))

(declare-fun lt!130491 () Unit!5477)

(declare-fun choose!23 (BitStream!2930) Unit!5477)

(assert (=> d!25790 (= lt!130491 (choose!23 b1!98))))

(assert (=> d!25790 (= (remainingBitsBitIndexLemma!0 b1!98) lt!130491)))

(declare-fun bs!6320 () Bool)

(assert (= bs!6320 d!25790))

(assert (=> bs!6320 m!128447))

(assert (=> bs!6320 m!128459))

(declare-fun m!128485 () Bool)

(assert (=> bs!6320 m!128485))

(assert (=> b!82027 d!25790))

(declare-fun d!25806 () Bool)

(assert (=> d!25806 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1684 (buf!2074 b1!98))) ((_ sign_extend 32) (currentByte!4030 b1!98)) ((_ sign_extend 32) (currentBit!4025 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1684 (buf!2074 b1!98))) ((_ sign_extend 32) (currentByte!4030 b1!98)) ((_ sign_extend 32) (currentBit!4025 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6321 () Bool)

(assert (= bs!6321 d!25806))

(assert (=> bs!6321 m!128447))

(assert (=> b!82029 d!25806))

(declare-fun d!25808 () Bool)

(assert (=> d!25808 (= (array_inv!1530 (buf!2074 b2!98)) (bvsge (size!1684 (buf!2074 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!82028 d!25808))

(push 1)

