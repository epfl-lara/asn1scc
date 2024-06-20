; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69352 () Bool)

(assert start!69352)

(declare-fun res!255551 () Bool)

(declare-fun e!224332 () Bool)

(assert (=> start!69352 (=> (not res!255551) (not e!224332))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-datatypes ((array!19081 0))(
  ( (array!19082 (arr!9355 (Array (_ BitVec 32) (_ BitVec 8))) (size!8275 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13654 0))(
  ( (BitStream!13655 (buf!7888 array!19081) (currentByte!14565 (_ BitVec 32)) (currentBit!14560 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13654)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun b2!97 () BitStream!13654)

(assert (=> start!69352 (= res!255551 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8275 (buf!7888 b1!97)) (size!8275 (buf!7888 b2!97)))))))

(assert (=> start!69352 e!224332))

(assert (=> start!69352 true))

(declare-fun e!224330 () Bool)

(declare-fun inv!12 (BitStream!13654) Bool)

(assert (=> start!69352 (and (inv!12 b1!97) e!224330)))

(declare-fun e!224331 () Bool)

(assert (=> start!69352 (and (inv!12 b2!97) e!224331)))

(declare-fun b!311963 () Bool)

(declare-fun res!255549 () Bool)

(assert (=> b!311963 (=> (not res!255549) (not e!224332))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!311963 (= res!255549 (validate_offset_bits!1 ((_ sign_extend 32) (size!8275 (buf!7888 b1!97))) ((_ sign_extend 32) (currentByte!14565 b1!97)) ((_ sign_extend 32) (currentBit!14560 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!311964 () Bool)

(declare-fun array_inv!7827 (array!19081) Bool)

(assert (=> b!311964 (= e!224330 (array_inv!7827 (buf!7888 b1!97)))))

(declare-fun b!311965 () Bool)

(declare-fun res!255550 () Bool)

(assert (=> b!311965 (=> (not res!255550) (not e!224332))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!311965 (= res!255550 (bvsle (bitIndex!0 (size!8275 (buf!7888 b2!97)) (currentByte!14565 b2!97) (currentBit!14560 b2!97)) (bvadd (bitIndex!0 (size!8275 (buf!7888 b1!97)) (currentByte!14565 b1!97) (currentBit!14560 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!311966 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!311966 (= e!224332 (bvslt (remainingBits!0 ((_ sign_extend 32) (size!8275 (buf!7888 b1!97))) ((_ sign_extend 32) (currentByte!14565 b1!97)) ((_ sign_extend 32) (currentBit!14560 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun b!311967 () Bool)

(assert (=> b!311967 (= e!224331 (array_inv!7827 (buf!7888 b2!97)))))

(assert (= (and start!69352 res!255551) b!311963))

(assert (= (and b!311963 res!255549) b!311965))

(assert (= (and b!311965 res!255550) b!311966))

(assert (= start!69352 b!311964))

(assert (= start!69352 b!311967))

(declare-fun m!449699 () Bool)

(assert (=> b!311966 m!449699))

(declare-fun m!449701 () Bool)

(assert (=> b!311965 m!449701))

(declare-fun m!449703 () Bool)

(assert (=> b!311965 m!449703))

(declare-fun m!449705 () Bool)

(assert (=> b!311964 m!449705))

(declare-fun m!449707 () Bool)

(assert (=> b!311963 m!449707))

(declare-fun m!449709 () Bool)

(assert (=> b!311967 m!449709))

(declare-fun m!449711 () Bool)

(assert (=> start!69352 m!449711))

(declare-fun m!449713 () Bool)

(assert (=> start!69352 m!449713))

(push 1)

(assert (not b!311964))

(assert (not b!311966))

(assert (not start!69352))

(assert (not b!311967))

(assert (not b!311963))

(assert (not b!311965))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!103522 () Bool)

(assert (=> d!103522 (= (remainingBits!0 ((_ sign_extend 32) (size!8275 (buf!7888 b1!97))) ((_ sign_extend 32) (currentByte!14565 b1!97)) ((_ sign_extend 32) (currentBit!14560 b1!97))) (bvsub (bvmul ((_ sign_extend 32) (size!8275 (buf!7888 b1!97))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14565 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14560 b1!97)))))))

(assert (=> b!311966 d!103522))

(declare-fun d!103526 () Bool)

(assert (=> d!103526 (= (array_inv!7827 (buf!7888 b2!97)) (bvsge (size!8275 (buf!7888 b2!97)) #b00000000000000000000000000000000))))

(assert (=> b!311967 d!103526))

(declare-fun d!103530 () Bool)

(assert (=> d!103530 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8275 (buf!7888 b1!97))) ((_ sign_extend 32) (currentByte!14565 b1!97)) ((_ sign_extend 32) (currentBit!14560 b1!97)) b1ValidateOffsetBits!10) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8275 (buf!7888 b1!97))) ((_ sign_extend 32) (currentByte!14565 b1!97)) ((_ sign_extend 32) (currentBit!14560 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun bs!26789 () Bool)

(assert (= bs!26789 d!103530))

(assert (=> bs!26789 m!449699))

(assert (=> b!311963 d!103530))

(declare-fun d!103532 () Bool)

(assert (=> d!103532 (= (array_inv!7827 (buf!7888 b1!97)) (bvsge (size!8275 (buf!7888 b1!97)) #b00000000000000000000000000000000))))

(assert (=> b!311964 d!103532))

(declare-fun d!103536 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!103536 (= (inv!12 b1!97) (invariant!0 (currentBit!14560 b1!97) (currentByte!14565 b1!97) (size!8275 (buf!7888 b1!97))))))

(declare-fun bs!26792 () Bool)

(assert (= bs!26792 d!103536))

(declare-fun m!449751 () Bool)

(assert (=> bs!26792 m!449751))

(assert (=> start!69352 d!103536))

(declare-fun d!103540 () Bool)

(assert (=> d!103540 (= (inv!12 b2!97) (invariant!0 (currentBit!14560 b2!97) (currentByte!14565 b2!97) (size!8275 (buf!7888 b2!97))))))

(declare-fun bs!26794 () Bool)

(assert (= bs!26794 d!103540))

(declare-fun m!449753 () Bool)

(assert (=> bs!26794 m!449753))

(assert (=> start!69352 d!103540))

(declare-fun d!103544 () Bool)

(declare-fun e!224367 () Bool)

(assert (=> d!103544 e!224367))

(declare-fun res!255578 () Bool)

(assert (=> d!103544 (=> (not res!255578) (not e!224367))))

(declare-fun lt!441594 () (_ BitVec 64))

(declare-fun lt!441592 () (_ BitVec 64))

(declare-fun lt!441591 () (_ BitVec 64))

(assert (=> d!103544 (= res!255578 (= lt!441594 (bvsub lt!441591 lt!441592)))))

(assert (=> d!103544 (or (= (bvand lt!441591 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441592 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441591 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441591 lt!441592) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103544 (= lt!441592 (remainingBits!0 ((_ sign_extend 32) (size!8275 (buf!7888 b2!97))) ((_ sign_extend 32) (currentByte!14565 b2!97)) ((_ sign_extend 32) (currentBit!14560 b2!97))))))

(declare-fun lt!441593 () (_ BitVec 64))

(declare-fun lt!441595 () (_ BitVec 64))

(assert (=> d!103544 (= lt!441591 (bvmul lt!441593 lt!441595))))

(assert (=> d!103544 (or (= lt!441593 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441595 (bvsdiv (bvmul lt!441593 lt!441595) lt!441593)))))

(assert (=> d!103544 (= lt!441595 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103544 (= lt!441593 ((_ sign_extend 32) (size!8275 (buf!7888 b2!97))))))

(assert (=> d!103544 (= lt!441594 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14565 b2!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14560 b2!97))))))

(assert (=> d!103544 (invariant!0 (currentBit!14560 b2!97) (currentByte!14565 b2!97) (size!8275 (buf!7888 b2!97)))))

(assert (=> d!103544 (= (bitIndex!0 (size!8275 (buf!7888 b2!97)) (currentByte!14565 b2!97) (currentBit!14560 b2!97)) lt!441594)))

(declare-fun b!312006 () Bool)

(declare-fun res!255579 () Bool)

(assert (=> b!312006 (=> (not res!255579) (not e!224367))))

(assert (=> b!312006 (= res!255579 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441594))))

(declare-fun b!312007 () Bool)

(declare-fun lt!441596 () (_ BitVec 64))

(assert (=> b!312007 (= e!224367 (bvsle lt!441594 (bvmul lt!441596 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!312007 (or (= lt!441596 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441596 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441596)))))

(assert (=> b!312007 (= lt!441596 ((_ sign_extend 32) (size!8275 (buf!7888 b2!97))))))

(assert (= (and d!103544 res!255578) b!312006))

(assert (= (and b!312006 res!255579) b!312007))

(declare-fun m!449755 () Bool)

(assert (=> d!103544 m!449755))

(assert (=> d!103544 m!449753))

(assert (=> b!311965 d!103544))

(declare-fun d!103546 () Bool)

(declare-fun e!224369 () Bool)

(assert (=> d!103546 e!224369))

(declare-fun res!255582 () Bool)

(assert (=> d!103546 (=> (not res!255582) (not e!224369))))

(declare-fun lt!441606 () (_ BitVec 64))

(declare-fun lt!441603 () (_ BitVec 64))

(declare-fun lt!441604 () (_ BitVec 64))

(assert (=> d!103546 (= res!255582 (= lt!441606 (bvsub lt!441603 lt!441604)))))

(assert (=> d!103546 (or (= (bvand lt!441603 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441604 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441603 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441603 lt!441604) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103546 (= lt!441604 (remainingBits!0 ((_ sign_extend 32) (size!8275 (buf!7888 b1!97))) ((_ sign_extend 32) (currentByte!14565 b1!97)) ((_ sign_extend 32) (currentBit!14560 b1!97))))))

(declare-fun lt!441605 () (_ BitVec 64))

(declare-fun lt!441607 () (_ BitVec 64))

(assert (=> d!103546 (= lt!441603 (bvmul lt!441605 lt!441607))))

(assert (=> d!103546 (or (= lt!441605 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441607 (bvsdiv (bvmul lt!441605 lt!441607) lt!441605)))))

(assert (=> d!103546 (= lt!441607 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103546 (= lt!441605 ((_ sign_extend 32) (size!8275 (buf!7888 b1!97))))))

(assert (=> d!103546 (= lt!441606 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14565 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14560 b1!97))))))

(assert (=> d!103546 (invariant!0 (currentBit!14560 b1!97) (currentByte!14565 b1!97) (size!8275 (buf!7888 b1!97)))))

(assert (=> d!103546 (= (bitIndex!0 (size!8275 (buf!7888 b1!97)) (currentByte!14565 b1!97) (currentBit!14560 b1!97)) lt!441606)))

(declare-fun b!312010 () Bool)

(declare-fun res!255583 () Bool)

(assert (=> b!312010 (=> (not res!255583) (not e!224369))))

(assert (=> b!312010 (= res!255583 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441606))))

(declare-fun b!312011 () Bool)

(declare-fun lt!441608 () (_ BitVec 64))

(assert (=> b!312011 (= e!224369 (bvsle lt!441606 (bvmul lt!441608 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!312011 (or (= lt!441608 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441608 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441608)))))

(assert (=> b!312011 (= lt!441608 ((_ sign_extend 32) (size!8275 (buf!7888 b1!97))))))

(assert (= (and d!103546 res!255582) b!312010))

(assert (= (and b!312010 res!255583) b!312011))

(assert (=> d!103546 m!449699))

(assert (=> d!103546 m!449751))

(assert (=> b!311965 d!103546))

(push 1)

(assert (not d!103544))

(assert (not d!103546))

(assert (not d!103536))

(assert (not d!103540))

(assert (not d!103530))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

