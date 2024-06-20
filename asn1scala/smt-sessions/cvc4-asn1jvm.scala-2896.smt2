; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69356 () Bool)

(assert start!69356)

(declare-fun res!255569 () Bool)

(declare-fun e!224360 () Bool)

(assert (=> start!69356 (=> (not res!255569) (not e!224360))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-datatypes ((array!19085 0))(
  ( (array!19086 (arr!9357 (Array (_ BitVec 32) (_ BitVec 8))) (size!8277 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13658 0))(
  ( (BitStream!13659 (buf!7890 array!19085) (currentByte!14567 (_ BitVec 32)) (currentBit!14562 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13658)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun b2!97 () BitStream!13658)

(assert (=> start!69356 (= res!255569 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8277 (buf!7890 b1!97)) (size!8277 (buf!7890 b2!97)))))))

(assert (=> start!69356 e!224360))

(assert (=> start!69356 true))

(declare-fun e!224358 () Bool)

(declare-fun inv!12 (BitStream!13658) Bool)

(assert (=> start!69356 (and (inv!12 b1!97) e!224358)))

(declare-fun e!224362 () Bool)

(assert (=> start!69356 (and (inv!12 b2!97) e!224362)))

(declare-fun b!311993 () Bool)

(declare-fun array_inv!7829 (array!19085) Bool)

(assert (=> b!311993 (= e!224358 (array_inv!7829 (buf!7890 b1!97)))))

(declare-fun b!311994 () Bool)

(assert (=> b!311994 (= e!224362 (array_inv!7829 (buf!7890 b2!97)))))

(declare-fun b!311995 () Bool)

(declare-fun res!255567 () Bool)

(assert (=> b!311995 (=> (not res!255567) (not e!224360))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!311995 (= res!255567 (validate_offset_bits!1 ((_ sign_extend 32) (size!8277 (buf!7890 b1!97))) ((_ sign_extend 32) (currentByte!14567 b1!97)) ((_ sign_extend 32) (currentBit!14562 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!311996 () Bool)

(declare-fun res!255568 () Bool)

(assert (=> b!311996 (=> (not res!255568) (not e!224360))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!311996 (= res!255568 (bvsle (bitIndex!0 (size!8277 (buf!7890 b2!97)) (currentByte!14567 b2!97) (currentBit!14562 b2!97)) (bvadd (bitIndex!0 (size!8277 (buf!7890 b1!97)) (currentByte!14567 b1!97) (currentBit!14562 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!311997 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!311997 (= e!224360 (bvslt (remainingBits!0 ((_ sign_extend 32) (size!8277 (buf!7890 b1!97))) ((_ sign_extend 32) (currentByte!14567 b1!97)) ((_ sign_extend 32) (currentBit!14562 b1!97))) b1ValidateOffsetBits!10))))

(assert (= (and start!69356 res!255569) b!311995))

(assert (= (and b!311995 res!255567) b!311996))

(assert (= (and b!311996 res!255568) b!311997))

(assert (= start!69356 b!311993))

(assert (= start!69356 b!311994))

(declare-fun m!449731 () Bool)

(assert (=> b!311997 m!449731))

(declare-fun m!449733 () Bool)

(assert (=> b!311993 m!449733))

(declare-fun m!449735 () Bool)

(assert (=> b!311995 m!449735))

(declare-fun m!449737 () Bool)

(assert (=> b!311994 m!449737))

(declare-fun m!449739 () Bool)

(assert (=> b!311996 m!449739))

(declare-fun m!449741 () Bool)

(assert (=> b!311996 m!449741))

(declare-fun m!449743 () Bool)

(assert (=> start!69356 m!449743))

(declare-fun m!449745 () Bool)

(assert (=> start!69356 m!449745))

(push 1)

(assert (not b!311997))

(assert (not b!311993))

(assert (not start!69356))

(assert (not b!311994))

(assert (not b!311996))

(assert (not b!311995))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!103528 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!103528 (= (inv!12 b1!97) (invariant!0 (currentBit!14562 b1!97) (currentByte!14567 b1!97) (size!8277 (buf!7890 b1!97))))))

(declare-fun bs!26790 () Bool)

(assert (= bs!26790 d!103528))

(declare-fun m!449747 () Bool)

(assert (=> bs!26790 m!449747))

(assert (=> start!69356 d!103528))

(declare-fun d!103534 () Bool)

(assert (=> d!103534 (= (inv!12 b2!97) (invariant!0 (currentBit!14562 b2!97) (currentByte!14567 b2!97) (size!8277 (buf!7890 b2!97))))))

(declare-fun bs!26791 () Bool)

(assert (= bs!26791 d!103534))

(declare-fun m!449749 () Bool)

(assert (=> bs!26791 m!449749))

(assert (=> start!69356 d!103534))

(declare-fun d!103538 () Bool)

(assert (=> d!103538 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8277 (buf!7890 b1!97))) ((_ sign_extend 32) (currentByte!14567 b1!97)) ((_ sign_extend 32) (currentBit!14562 b1!97)) b1ValidateOffsetBits!10) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8277 (buf!7890 b1!97))) ((_ sign_extend 32) (currentByte!14567 b1!97)) ((_ sign_extend 32) (currentBit!14562 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun bs!26793 () Bool)

(assert (= bs!26793 d!103538))

(assert (=> bs!26793 m!449731))

(assert (=> b!311995 d!103538))

(declare-fun d!103542 () Bool)

(declare-fun e!224368 () Bool)

(assert (=> d!103542 e!224368))

(declare-fun res!255581 () Bool)

(assert (=> d!103542 (=> (not res!255581) (not e!224368))))

(declare-fun lt!441602 () (_ BitVec 64))

(declare-fun lt!441598 () (_ BitVec 64))

(declare-fun lt!441599 () (_ BitVec 64))

(assert (=> d!103542 (= res!255581 (= lt!441602 (bvsub lt!441598 lt!441599)))))

(assert (=> d!103542 (or (= (bvand lt!441598 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441599 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441598 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441598 lt!441599) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103542 (= lt!441599 (remainingBits!0 ((_ sign_extend 32) (size!8277 (buf!7890 b2!97))) ((_ sign_extend 32) (currentByte!14567 b2!97)) ((_ sign_extend 32) (currentBit!14562 b2!97))))))

(declare-fun lt!441597 () (_ BitVec 64))

(declare-fun lt!441600 () (_ BitVec 64))

(assert (=> d!103542 (= lt!441598 (bvmul lt!441597 lt!441600))))

(assert (=> d!103542 (or (= lt!441597 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441600 (bvsdiv (bvmul lt!441597 lt!441600) lt!441597)))))

(assert (=> d!103542 (= lt!441600 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103542 (= lt!441597 ((_ sign_extend 32) (size!8277 (buf!7890 b2!97))))))

(assert (=> d!103542 (= lt!441602 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14567 b2!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14562 b2!97))))))

(assert (=> d!103542 (invariant!0 (currentBit!14562 b2!97) (currentByte!14567 b2!97) (size!8277 (buf!7890 b2!97)))))

(assert (=> d!103542 (= (bitIndex!0 (size!8277 (buf!7890 b2!97)) (currentByte!14567 b2!97) (currentBit!14562 b2!97)) lt!441602)))

(declare-fun b!312008 () Bool)

(declare-fun res!255580 () Bool)

(assert (=> b!312008 (=> (not res!255580) (not e!224368))))

(assert (=> b!312008 (= res!255580 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441602))))

(declare-fun b!312009 () Bool)

(declare-fun lt!441601 () (_ BitVec 64))

(assert (=> b!312009 (= e!224368 (bvsle lt!441602 (bvmul lt!441601 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!312009 (or (= lt!441601 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441601 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441601)))))

(assert (=> b!312009 (= lt!441601 ((_ sign_extend 32) (size!8277 (buf!7890 b2!97))))))

(assert (= (and d!103542 res!255581) b!312008))

(assert (= (and b!312008 res!255580) b!312009))

(declare-fun m!449757 () Bool)

(assert (=> d!103542 m!449757))

(assert (=> d!103542 m!449749))

(assert (=> b!311996 d!103542))

(declare-fun d!103548 () Bool)

(declare-fun e!224370 () Bool)

(assert (=> d!103548 e!224370))

(declare-fun res!255585 () Bool)

(assert (=> d!103548 (=> (not res!255585) (not e!224370))))

(declare-fun lt!441614 () (_ BitVec 64))

(declare-fun lt!441610 () (_ BitVec 64))

(declare-fun lt!441611 () (_ BitVec 64))

(assert (=> d!103548 (= res!255585 (= lt!441614 (bvsub lt!441610 lt!441611)))))

(assert (=> d!103548 (or (= (bvand lt!441610 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441611 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441610 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441610 lt!441611) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103548 (= lt!441611 (remainingBits!0 ((_ sign_extend 32) (size!8277 (buf!7890 b1!97))) ((_ sign_extend 32) (currentByte!14567 b1!97)) ((_ sign_extend 32) (currentBit!14562 b1!97))))))

(declare-fun lt!441609 () (_ BitVec 64))

(declare-fun lt!441612 () (_ BitVec 64))

(assert (=> d!103548 (= lt!441610 (bvmul lt!441609 lt!441612))))

(assert (=> d!103548 (or (= lt!441609 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441612 (bvsdiv (bvmul lt!441609 lt!441612) lt!441609)))))

(assert (=> d!103548 (= lt!441612 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103548 (= lt!441609 ((_ sign_extend 32) (size!8277 (buf!7890 b1!97))))))

(assert (=> d!103548 (= lt!441614 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14567 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14562 b1!97))))))

(assert (=> d!103548 (invariant!0 (currentBit!14562 b1!97) (currentByte!14567 b1!97) (size!8277 (buf!7890 b1!97)))))

(assert (=> d!103548 (= (bitIndex!0 (size!8277 (buf!7890 b1!97)) (currentByte!14567 b1!97) (currentBit!14562 b1!97)) lt!441614)))

(declare-fun b!312012 () Bool)

(declare-fun res!255584 () Bool)

(assert (=> b!312012 (=> (not res!255584) (not e!224370))))

(assert (=> b!312012 (= res!255584 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441614))))

(declare-fun b!312013 () Bool)

(declare-fun lt!441613 () (_ BitVec 64))

(assert (=> b!312013 (= e!224370 (bvsle lt!441614 (bvmul lt!441613 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!312013 (or (= lt!441613 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441613 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441613)))))

(assert (=> b!312013 (= lt!441613 ((_ sign_extend 32) (size!8277 (buf!7890 b1!97))))))

(assert (= (and d!103548 res!255585) b!312012))

(assert (= (and b!312012 res!255584) b!312013))

(assert (=> d!103548 m!449731))

(assert (=> d!103548 m!449747))

(assert (=> b!311996 d!103548))

(declare-fun d!103550 () Bool)

(assert (=> d!103550 (= (remainingBits!0 ((_ sign_extend 32) (size!8277 (buf!7890 b1!97))) ((_ sign_extend 32) (currentByte!14567 b1!97)) ((_ sign_extend 32) (currentBit!14562 b1!97))) (bvsub (bvmul ((_ sign_extend 32) (size!8277 (buf!7890 b1!97))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14567 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14562 b1!97)))))))

(assert (=> b!311997 d!103550))

(declare-fun d!103552 () Bool)

(assert (=> d!103552 (= (array_inv!7829 (buf!7890 b1!97)) (bvsge (size!8277 (buf!7890 b1!97)) #b00000000000000000000000000000000))))

(assert (=> b!311993 d!103552))

(declare-fun d!103554 () Bool)

(assert (=> d!103554 (= (array_inv!7829 (buf!7890 b2!97)) (bvsge (size!8277 (buf!7890 b2!97)) #b00000000000000000000000000000000))))

(assert (=> b!311994 d!103554))

(push 1)

