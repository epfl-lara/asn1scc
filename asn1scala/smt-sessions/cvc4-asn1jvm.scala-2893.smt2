; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69270 () Bool)

(assert start!69270)

(declare-fun b!311770 () Bool)

(declare-fun e!224182 () Bool)

(declare-datatypes ((array!19061 0))(
  ( (array!19062 (arr!9348 (Array (_ BitVec 32) (_ BitVec 8))) (size!8268 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13640 0))(
  ( (BitStream!13641 (buf!7881 array!19061) (currentByte!14536 (_ BitVec 32)) (currentBit!14531 (_ BitVec 32))) )
))
(declare-fun b2!97 () BitStream!13640)

(declare-fun array_inv!7820 (array!19061) Bool)

(assert (=> b!311770 (= e!224182 (array_inv!7820 (buf!7881 b2!97)))))

(declare-fun b!311771 () Bool)

(declare-fun res!255400 () Bool)

(declare-fun e!224181 () Bool)

(assert (=> b!311771 (=> (not res!255400) (not e!224181))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!311771 (= res!255400 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8268 (buf!7881 b2!97))) ((_ sign_extend 32) (currentByte!14536 b2!97)) ((_ sign_extend 32) (currentBit!14531 b2!97))) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9)))))

(declare-fun b!311772 () Bool)

(declare-fun res!255404 () Bool)

(declare-fun e!224180 () Bool)

(assert (=> b!311772 (=> (not res!255404) (not e!224180))))

(declare-fun b1!97 () BitStream!13640)

(assert (=> b!311772 (= res!255404 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8268 (buf!7881 b1!97))) ((_ sign_extend 32) (currentByte!14536 b1!97)) ((_ sign_extend 32) (currentBit!14531 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun b!311773 () Bool)

(declare-fun res!255401 () Bool)

(assert (=> b!311773 (=> (not res!255401) (not e!224180))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!311773 (= res!255401 (validate_offset_bits!1 ((_ sign_extend 32) (size!8268 (buf!7881 b1!97))) ((_ sign_extend 32) (currentByte!14536 b1!97)) ((_ sign_extend 32) (currentBit!14531 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun res!255399 () Bool)

(assert (=> start!69270 (=> (not res!255399) (not e!224180))))

(assert (=> start!69270 (= res!255399 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8268 (buf!7881 b1!97)) (size!8268 (buf!7881 b2!97)))))))

(assert (=> start!69270 e!224180))

(assert (=> start!69270 true))

(declare-fun e!224183 () Bool)

(declare-fun inv!12 (BitStream!13640) Bool)

(assert (=> start!69270 (and (inv!12 b1!97) e!224183)))

(assert (=> start!69270 (and (inv!12 b2!97) e!224182)))

(declare-fun b!311774 () Bool)

(declare-fun e!224185 () Bool)

(assert (=> b!311774 (= e!224185 e!224181)))

(declare-fun res!255402 () Bool)

(assert (=> b!311774 (=> (not res!255402) (not e!224181))))

(declare-fun lt!441376 () (_ BitVec 64))

(declare-fun lt!441377 () (_ BitVec 64))

(declare-fun lt!441375 () (_ BitVec 64))

(assert (=> b!311774 (= res!255402 (and (bvsle lt!441375 (bvadd lt!441376 advancedAtMostBits!9)) (bvsge (bvsub lt!441377 lt!441375) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9))))))

(assert (=> b!311774 (= lt!441375 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14536 b2!97))) ((_ sign_extend 32) (currentBit!14531 b2!97))))))

(declare-fun b!311775 () Bool)

(declare-fun res!255403 () Bool)

(assert (=> b!311775 (=> (not res!255403) (not e!224180))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!311775 (= res!255403 (bvsle (bitIndex!0 (size!8268 (buf!7881 b2!97)) (currentByte!14536 b2!97) (currentBit!14531 b2!97)) (bvadd (bitIndex!0 (size!8268 (buf!7881 b1!97)) (currentByte!14536 b1!97) (currentBit!14531 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!311776 () Bool)

(assert (=> b!311776 (= e!224180 e!224185)))

(declare-fun res!255398 () Bool)

(assert (=> b!311776 (=> (not res!255398) (not e!224185))))

(assert (=> b!311776 (= res!255398 (bvsge (bvsub lt!441377 lt!441376) b1ValidateOffsetBits!10))))

(assert (=> b!311776 (= lt!441376 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14536 b1!97))) ((_ sign_extend 32) (currentBit!14531 b1!97))))))

(assert (=> b!311776 (= lt!441377 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8268 (buf!7881 b1!97)))))))

(declare-fun b!311777 () Bool)

(assert (=> b!311777 (= e!224181 (and (bvsle ((_ sign_extend 32) (size!8268 (buf!7881 b2!97))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14536 b2!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14531 b2!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!8268 (buf!7881 b2!97))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!14536 b2!97)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!14531 b2!97)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!311778 () Bool)

(assert (=> b!311778 (= e!224183 (array_inv!7820 (buf!7881 b1!97)))))

(assert (= (and start!69270 res!255399) b!311773))

(assert (= (and b!311773 res!255401) b!311775))

(assert (= (and b!311775 res!255403) b!311772))

(assert (= (and b!311772 res!255404) b!311776))

(assert (= (and b!311776 res!255398) b!311774))

(assert (= (and b!311774 res!255402) b!311771))

(assert (= (and b!311771 res!255400) b!311777))

(assert (= start!69270 b!311778))

(assert (= start!69270 b!311770))

(declare-fun m!449555 () Bool)

(assert (=> start!69270 m!449555))

(declare-fun m!449557 () Bool)

(assert (=> start!69270 m!449557))

(declare-fun m!449559 () Bool)

(assert (=> b!311773 m!449559))

(declare-fun m!449561 () Bool)

(assert (=> b!311771 m!449561))

(declare-fun m!449563 () Bool)

(assert (=> b!311778 m!449563))

(declare-fun m!449565 () Bool)

(assert (=> b!311775 m!449565))

(declare-fun m!449567 () Bool)

(assert (=> b!311775 m!449567))

(declare-fun m!449569 () Bool)

(assert (=> b!311770 m!449569))

(declare-fun m!449571 () Bool)

(assert (=> b!311772 m!449571))

(push 1)

(assert (not b!311772))

(assert (not b!311773))

(assert (not b!311775))

(assert (not b!311778))

(assert (not start!69270))

(assert (not b!311771))

(assert (not b!311770))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!103408 () Bool)

(assert (=> d!103408 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8268 (buf!7881 b1!97))) ((_ sign_extend 32) (currentByte!14536 b1!97)) ((_ sign_extend 32) (currentBit!14531 b1!97)) b1ValidateOffsetBits!10) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8268 (buf!7881 b1!97))) ((_ sign_extend 32) (currentByte!14536 b1!97)) ((_ sign_extend 32) (currentBit!14531 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun bs!26764 () Bool)

(assert (= bs!26764 d!103408))

(assert (=> bs!26764 m!449571))

(assert (=> b!311773 d!103408))

(declare-fun d!103410 () Bool)

(declare-fun e!224192 () Bool)

(assert (=> d!103410 e!224192))

(declare-fun res!255418 () Bool)

(assert (=> d!103410 (=> (not res!255418) (not e!224192))))

(declare-fun lt!441415 () (_ BitVec 64))

(declare-fun lt!441418 () (_ BitVec 64))

(declare-fun lt!441419 () (_ BitVec 64))

(assert (=> d!103410 (= res!255418 (= lt!441415 (bvsub lt!441419 lt!441418)))))

(assert (=> d!103410 (or (= (bvand lt!441419 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441418 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441419 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441419 lt!441418) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103410 (= lt!441418 (remainingBits!0 ((_ sign_extend 32) (size!8268 (buf!7881 b2!97))) ((_ sign_extend 32) (currentByte!14536 b2!97)) ((_ sign_extend 32) (currentBit!14531 b2!97))))))

(declare-fun lt!441417 () (_ BitVec 64))

(declare-fun lt!441414 () (_ BitVec 64))

(assert (=> d!103410 (= lt!441419 (bvmul lt!441417 lt!441414))))

(assert (=> d!103410 (or (= lt!441417 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441414 (bvsdiv (bvmul lt!441417 lt!441414) lt!441417)))))

(assert (=> d!103410 (= lt!441414 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103410 (= lt!441417 ((_ sign_extend 32) (size!8268 (buf!7881 b2!97))))))

(assert (=> d!103410 (= lt!441415 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14536 b2!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14531 b2!97))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!103410 (invariant!0 (currentBit!14531 b2!97) (currentByte!14536 b2!97) (size!8268 (buf!7881 b2!97)))))

(assert (=> d!103410 (= (bitIndex!0 (size!8268 (buf!7881 b2!97)) (currentByte!14536 b2!97) (currentBit!14531 b2!97)) lt!441415)))

(declare-fun b!311791 () Bool)

(declare-fun res!255417 () Bool)

(assert (=> b!311791 (=> (not res!255417) (not e!224192))))

(assert (=> b!311791 (= res!255417 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441415))))

(declare-fun b!311792 () Bool)

(declare-fun lt!441416 () (_ BitVec 64))

(assert (=> b!311792 (= e!224192 (bvsle lt!441415 (bvmul lt!441416 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!311792 (or (= lt!441416 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441416 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441416)))))

(assert (=> b!311792 (= lt!441416 ((_ sign_extend 32) (size!8268 (buf!7881 b2!97))))))

(assert (= (and d!103410 res!255418) b!311791))

(assert (= (and b!311791 res!255417) b!311792))

(assert (=> d!103410 m!449561))

(declare-fun m!449577 () Bool)

(assert (=> d!103410 m!449577))

(assert (=> b!311775 d!103410))

(declare-fun d!103420 () Bool)

(declare-fun e!224193 () Bool)

(assert (=> d!103420 e!224193))

(declare-fun res!255420 () Bool)

(assert (=> d!103420 (=> (not res!255420) (not e!224193))))

(declare-fun lt!441421 () (_ BitVec 64))

(declare-fun lt!441425 () (_ BitVec 64))

(declare-fun lt!441424 () (_ BitVec 64))

(assert (=> d!103420 (= res!255420 (= lt!441421 (bvsub lt!441425 lt!441424)))))

(assert (=> d!103420 (or (= (bvand lt!441425 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441424 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441425 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441425 lt!441424) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103420 (= lt!441424 (remainingBits!0 ((_ sign_extend 32) (size!8268 (buf!7881 b1!97))) ((_ sign_extend 32) (currentByte!14536 b1!97)) ((_ sign_extend 32) (currentBit!14531 b1!97))))))

(declare-fun lt!441423 () (_ BitVec 64))

(declare-fun lt!441420 () (_ BitVec 64))

(assert (=> d!103420 (= lt!441425 (bvmul lt!441423 lt!441420))))

(assert (=> d!103420 (or (= lt!441423 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441420 (bvsdiv (bvmul lt!441423 lt!441420) lt!441423)))))

(assert (=> d!103420 (= lt!441420 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103420 (= lt!441423 ((_ sign_extend 32) (size!8268 (buf!7881 b1!97))))))

(assert (=> d!103420 (= lt!441421 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14536 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14531 b1!97))))))

(assert (=> d!103420 (invariant!0 (currentBit!14531 b1!97) (currentByte!14536 b1!97) (size!8268 (buf!7881 b1!97)))))

(assert (=> d!103420 (= (bitIndex!0 (size!8268 (buf!7881 b1!97)) (currentByte!14536 b1!97) (currentBit!14531 b1!97)) lt!441421)))

(declare-fun b!311793 () Bool)

(declare-fun res!255419 () Bool)

(assert (=> b!311793 (=> (not res!255419) (not e!224193))))

(assert (=> b!311793 (= res!255419 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441421))))

(declare-fun b!311794 () Bool)

(declare-fun lt!441422 () (_ BitVec 64))

(assert (=> b!311794 (= e!224193 (bvsle lt!441421 (bvmul lt!441422 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!311794 (or (= lt!441422 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441422 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441422)))))

(assert (=> b!311794 (= lt!441422 ((_ sign_extend 32) (size!8268 (buf!7881 b1!97))))))

(assert (= (and d!103420 res!255420) b!311793))

(assert (= (and b!311793 res!255419) b!311794))

(assert (=> d!103420 m!449571))

(declare-fun m!449579 () Bool)

(assert (=> d!103420 m!449579))

(assert (=> b!311775 d!103420))

(declare-fun d!103422 () Bool)

(assert (=> d!103422 (= (array_inv!7820 (buf!7881 b2!97)) (bvsge (size!8268 (buf!7881 b2!97)) #b00000000000000000000000000000000))))

(assert (=> b!311770 d!103422))

(declare-fun d!103424 () Bool)

(assert (=> d!103424 (= (inv!12 b1!97) (invariant!0 (currentBit!14531 b1!97) (currentByte!14536 b1!97) (size!8268 (buf!7881 b1!97))))))

(declare-fun bs!26766 () Bool)

(assert (= bs!26766 d!103424))

(assert (=> bs!26766 m!449579))

(assert (=> start!69270 d!103424))

(declare-fun d!103426 () Bool)

(assert (=> d!103426 (= (inv!12 b2!97) (invariant!0 (currentBit!14531 b2!97) (currentByte!14536 b2!97) (size!8268 (buf!7881 b2!97))))))

(declare-fun bs!26767 () Bool)

(assert (= bs!26767 d!103426))

(assert (=> bs!26767 m!449577))

(assert (=> start!69270 d!103426))

(declare-fun d!103430 () Bool)

(assert (=> d!103430 (= (remainingBits!0 ((_ sign_extend 32) (size!8268 (buf!7881 b2!97))) ((_ sign_extend 32) (currentByte!14536 b2!97)) ((_ sign_extend 32) (currentBit!14531 b2!97))) (bvsub (bvmul ((_ sign_extend 32) (size!8268 (buf!7881 b2!97))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14536 b2!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14531 b2!97)))))))

(assert (=> b!311771 d!103430))

(declare-fun d!103436 () Bool)

(assert (=> d!103436 (= (array_inv!7820 (buf!7881 b1!97)) (bvsge (size!8268 (buf!7881 b1!97)) #b00000000000000000000000000000000))))

(assert (=> b!311778 d!103436))

(declare-fun d!103438 () Bool)

(assert (=> d!103438 (= (remainingBits!0 ((_ sign_extend 32) (size!8268 (buf!7881 b1!97))) ((_ sign_extend 32) (currentByte!14536 b1!97)) ((_ sign_extend 32) (currentBit!14531 b1!97))) (bvsub (bvmul ((_ sign_extend 32) (size!8268 (buf!7881 b1!97))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14536 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14531 b1!97)))))))

(assert (=> b!311772 d!103438))

(push 1)

(assert (not d!103420))

(assert (not d!103424))

(assert (not d!103408))

(assert (not d!103410))

(assert (not d!103426))

(check-sat)

(pop 1)

(push 1)

(check-sat)

