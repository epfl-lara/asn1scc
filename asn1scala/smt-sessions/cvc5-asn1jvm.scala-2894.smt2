; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69304 () Bool)

(assert start!69304)

(declare-fun b!311823 () Bool)

(declare-fun res!255446 () Bool)

(declare-fun e!224217 () Bool)

(assert (=> b!311823 (=> (not res!255446) (not e!224217))))

(declare-datatypes ((array!19066 0))(
  ( (array!19067 (arr!9349 (Array (_ BitVec 32) (_ BitVec 8))) (size!8269 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13642 0))(
  ( (BitStream!13643 (buf!7882 array!19066) (currentByte!14547 (_ BitVec 32)) (currentBit!14542 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13642)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!311823 (= res!255446 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8269 (buf!7882 b1!97))) ((_ sign_extend 32) (currentByte!14547 b1!97)) ((_ sign_extend 32) (currentBit!14542 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun b!311824 () Bool)

(declare-fun e!224214 () Bool)

(declare-fun e!224218 () Bool)

(assert (=> b!311824 (= e!224214 e!224218)))

(declare-fun res!255451 () Bool)

(assert (=> b!311824 (=> (not res!255451) (not e!224218))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun lt!441457 () (_ BitVec 64))

(declare-fun lt!441458 () (_ BitVec 64))

(declare-fun lt!441456 () (_ BitVec 64))

(assert (=> b!311824 (= res!255451 (and (bvsle lt!441456 (bvadd lt!441458 advancedAtMostBits!9)) (bvsge (bvsub lt!441457 lt!441456) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9))))))

(declare-fun b2!97 () BitStream!13642)

(assert (=> b!311824 (= lt!441456 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14547 b2!97))) ((_ sign_extend 32) (currentBit!14542 b2!97))))))

(declare-fun b!311825 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!311825 (= e!224218 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14542 b2!97))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14547 b2!97))) ((_ extract 31 0) ((_ sign_extend 32) (size!8269 (buf!7882 b2!97)))))))))

(declare-fun b!311826 () Bool)

(declare-fun e!224216 () Bool)

(declare-fun array_inv!7821 (array!19066) Bool)

(assert (=> b!311826 (= e!224216 (array_inv!7821 (buf!7882 b2!97)))))

(declare-fun b!311827 () Bool)

(assert (=> b!311827 (= e!224217 e!224214)))

(declare-fun res!255449 () Bool)

(assert (=> b!311827 (=> (not res!255449) (not e!224214))))

(assert (=> b!311827 (= res!255449 (bvsge (bvsub lt!441457 lt!441458) b1ValidateOffsetBits!10))))

(assert (=> b!311827 (= lt!441458 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14547 b1!97))) ((_ sign_extend 32) (currentBit!14542 b1!97))))))

(assert (=> b!311827 (= lt!441457 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8269 (buf!7882 b1!97)))))))

(declare-fun b!311828 () Bool)

(declare-fun res!255445 () Bool)

(assert (=> b!311828 (=> (not res!255445) (not e!224218))))

(assert (=> b!311828 (= res!255445 (and (bvsle ((_ sign_extend 32) (size!8269 (buf!7882 b2!97))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14547 b2!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14542 b2!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!8269 (buf!7882 b2!97))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!14547 b2!97)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!14542 b2!97)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!311829 () Bool)

(declare-fun res!255452 () Bool)

(assert (=> b!311829 (=> (not res!255452) (not e!224217))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!311829 (= res!255452 (validate_offset_bits!1 ((_ sign_extend 32) (size!8269 (buf!7882 b1!97))) ((_ sign_extend 32) (currentByte!14547 b1!97)) ((_ sign_extend 32) (currentBit!14542 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!311830 () Bool)

(declare-fun e!224212 () Bool)

(assert (=> b!311830 (= e!224212 (array_inv!7821 (buf!7882 b1!97)))))

(declare-fun res!255447 () Bool)

(assert (=> start!69304 (=> (not res!255447) (not e!224217))))

(assert (=> start!69304 (= res!255447 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8269 (buf!7882 b1!97)) (size!8269 (buf!7882 b2!97)))))))

(assert (=> start!69304 e!224217))

(assert (=> start!69304 true))

(declare-fun inv!12 (BitStream!13642) Bool)

(assert (=> start!69304 (and (inv!12 b1!97) e!224212)))

(assert (=> start!69304 (and (inv!12 b2!97) e!224216)))

(declare-fun b!311831 () Bool)

(declare-fun res!255448 () Bool)

(assert (=> b!311831 (=> (not res!255448) (not e!224218))))

(assert (=> b!311831 (= res!255448 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8269 (buf!7882 b2!97))) ((_ sign_extend 32) (currentByte!14547 b2!97)) ((_ sign_extend 32) (currentBit!14542 b2!97))) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9)))))

(declare-fun b!311832 () Bool)

(declare-fun res!255450 () Bool)

(assert (=> b!311832 (=> (not res!255450) (not e!224217))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!311832 (= res!255450 (bvsle (bitIndex!0 (size!8269 (buf!7882 b2!97)) (currentByte!14547 b2!97) (currentBit!14542 b2!97)) (bvadd (bitIndex!0 (size!8269 (buf!7882 b1!97)) (currentByte!14547 b1!97) (currentBit!14542 b1!97)) advancedAtMostBits!9)))))

(assert (= (and start!69304 res!255447) b!311829))

(assert (= (and b!311829 res!255452) b!311832))

(assert (= (and b!311832 res!255450) b!311823))

(assert (= (and b!311823 res!255446) b!311827))

(assert (= (and b!311827 res!255449) b!311824))

(assert (= (and b!311824 res!255451) b!311831))

(assert (= (and b!311831 res!255448) b!311828))

(assert (= (and b!311828 res!255445) b!311825))

(assert (= start!69304 b!311830))

(assert (= start!69304 b!311826))

(declare-fun m!449585 () Bool)

(assert (=> b!311829 m!449585))

(declare-fun m!449587 () Bool)

(assert (=> start!69304 m!449587))

(declare-fun m!449589 () Bool)

(assert (=> start!69304 m!449589))

(declare-fun m!449591 () Bool)

(assert (=> b!311825 m!449591))

(declare-fun m!449593 () Bool)

(assert (=> b!311830 m!449593))

(declare-fun m!449595 () Bool)

(assert (=> b!311831 m!449595))

(declare-fun m!449597 () Bool)

(assert (=> b!311823 m!449597))

(declare-fun m!449599 () Bool)

(assert (=> b!311832 m!449599))

(declare-fun m!449601 () Bool)

(assert (=> b!311832 m!449601))

(declare-fun m!449603 () Bool)

(assert (=> b!311826 m!449603))

(push 1)

(assert (not b!311832))

(assert (not b!311823))

(assert (not b!311831))

(assert (not start!69304))

(assert (not b!311829))

(assert (not b!311825))

(assert (not b!311830))

(assert (not b!311826))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!103480 () Bool)

(assert (=> d!103480 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8269 (buf!7882 b1!97))) ((_ sign_extend 32) (currentByte!14547 b1!97)) ((_ sign_extend 32) (currentBit!14542 b1!97)) b1ValidateOffsetBits!10) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8269 (buf!7882 b1!97))) ((_ sign_extend 32) (currentByte!14547 b1!97)) ((_ sign_extend 32) (currentBit!14542 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun bs!26777 () Bool)

(assert (= bs!26777 d!103480))

(assert (=> bs!26777 m!449597))

(assert (=> b!311829 d!103480))

(declare-fun d!103482 () Bool)

(assert (=> d!103482 (= (remainingBits!0 ((_ sign_extend 32) (size!8269 (buf!7882 b2!97))) ((_ sign_extend 32) (currentByte!14547 b2!97)) ((_ sign_extend 32) (currentBit!14542 b2!97))) (bvsub (bvmul ((_ sign_extend 32) (size!8269 (buf!7882 b2!97))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14547 b2!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14542 b2!97)))))))

(assert (=> b!311831 d!103482))

(declare-fun d!103484 () Bool)

(assert (=> d!103484 (= (array_inv!7821 (buf!7882 b1!97)) (bvsge (size!8269 (buf!7882 b1!97)) #b00000000000000000000000000000000))))

(assert (=> b!311830 d!103484))

(declare-fun d!103486 () Bool)

(assert (=> d!103486 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14542 b2!97))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14547 b2!97))) ((_ extract 31 0) ((_ sign_extend 32) (size!8269 (buf!7882 b2!97))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14542 b2!97))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14542 b2!97))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14547 b2!97))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14547 b2!97))) ((_ extract 31 0) ((_ sign_extend 32) (size!8269 (buf!7882 b2!97))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14542 b2!97))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14547 b2!97))) ((_ extract 31 0) ((_ sign_extend 32) (size!8269 (buf!7882 b2!97)))))))))))

(assert (=> b!311825 d!103486))

(declare-fun d!103488 () Bool)

(declare-fun e!224271 () Bool)

(assert (=> d!103488 e!224271))

(declare-fun res!255522 () Bool)

(assert (=> d!103488 (=> (not res!255522) (not e!224271))))

(declare-fun lt!441540 () (_ BitVec 64))

(declare-fun lt!441542 () (_ BitVec 64))

(declare-fun lt!441539 () (_ BitVec 64))

(assert (=> d!103488 (= res!255522 (= lt!441542 (bvsub lt!441540 lt!441539)))))

(assert (=> d!103488 (or (= (bvand lt!441540 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441539 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441540 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441540 lt!441539) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103488 (= lt!441539 (remainingBits!0 ((_ sign_extend 32) (size!8269 (buf!7882 b2!97))) ((_ sign_extend 32) (currentByte!14547 b2!97)) ((_ sign_extend 32) (currentBit!14542 b2!97))))))

(declare-fun lt!441537 () (_ BitVec 64))

(declare-fun lt!441538 () (_ BitVec 64))

(assert (=> d!103488 (= lt!441540 (bvmul lt!441537 lt!441538))))

(assert (=> d!103488 (or (= lt!441537 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441538 (bvsdiv (bvmul lt!441537 lt!441538) lt!441537)))))

(assert (=> d!103488 (= lt!441538 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103488 (= lt!441537 ((_ sign_extend 32) (size!8269 (buf!7882 b2!97))))))

(assert (=> d!103488 (= lt!441542 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14547 b2!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14542 b2!97))))))

(assert (=> d!103488 (invariant!0 (currentBit!14542 b2!97) (currentByte!14547 b2!97) (size!8269 (buf!7882 b2!97)))))

(assert (=> d!103488 (= (bitIndex!0 (size!8269 (buf!7882 b2!97)) (currentByte!14547 b2!97) (currentBit!14542 b2!97)) lt!441542)))

(declare-fun b!311913 () Bool)

(declare-fun res!255521 () Bool)

(assert (=> b!311913 (=> (not res!255521) (not e!224271))))

(assert (=> b!311913 (= res!255521 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441542))))

(declare-fun b!311914 () Bool)

(declare-fun lt!441541 () (_ BitVec 64))

(assert (=> b!311914 (= e!224271 (bvsle lt!441542 (bvmul lt!441541 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!311914 (or (= lt!441541 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441541 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441541)))))

(assert (=> b!311914 (= lt!441541 ((_ sign_extend 32) (size!8269 (buf!7882 b2!97))))))

(assert (= (and d!103488 res!255522) b!311913))

(assert (= (and b!311913 res!255521) b!311914))

(assert (=> d!103488 m!449595))

(declare-fun m!449653 () Bool)

(assert (=> d!103488 m!449653))

(assert (=> b!311832 d!103488))

(declare-fun d!103504 () Bool)

(declare-fun e!224272 () Bool)

(assert (=> d!103504 e!224272))

(declare-fun res!255524 () Bool)

(assert (=> d!103504 (=> (not res!255524) (not e!224272))))

(declare-fun lt!441546 () (_ BitVec 64))

(declare-fun lt!441545 () (_ BitVec 64))

(declare-fun lt!441548 () (_ BitVec 64))

(assert (=> d!103504 (= res!255524 (= lt!441548 (bvsub lt!441546 lt!441545)))))

(assert (=> d!103504 (or (= (bvand lt!441546 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441545 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441546 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441546 lt!441545) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103504 (= lt!441545 (remainingBits!0 ((_ sign_extend 32) (size!8269 (buf!7882 b1!97))) ((_ sign_extend 32) (currentByte!14547 b1!97)) ((_ sign_extend 32) (currentBit!14542 b1!97))))))

(declare-fun lt!441543 () (_ BitVec 64))

(declare-fun lt!441544 () (_ BitVec 64))

(assert (=> d!103504 (= lt!441546 (bvmul lt!441543 lt!441544))))

(assert (=> d!103504 (or (= lt!441543 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441544 (bvsdiv (bvmul lt!441543 lt!441544) lt!441543)))))

(assert (=> d!103504 (= lt!441544 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103504 (= lt!441543 ((_ sign_extend 32) (size!8269 (buf!7882 b1!97))))))

(assert (=> d!103504 (= lt!441548 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14547 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14542 b1!97))))))

(assert (=> d!103504 (invariant!0 (currentBit!14542 b1!97) (currentByte!14547 b1!97) (size!8269 (buf!7882 b1!97)))))

(assert (=> d!103504 (= (bitIndex!0 (size!8269 (buf!7882 b1!97)) (currentByte!14547 b1!97) (currentBit!14542 b1!97)) lt!441548)))

(declare-fun b!311915 () Bool)

(declare-fun res!255523 () Bool)

(assert (=> b!311915 (=> (not res!255523) (not e!224272))))

(assert (=> b!311915 (= res!255523 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441548))))

(declare-fun b!311916 () Bool)

(declare-fun lt!441547 () (_ BitVec 64))

(assert (=> b!311916 (= e!224272 (bvsle lt!441548 (bvmul lt!441547 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!311916 (or (= lt!441547 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441547 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441547)))))

(assert (=> b!311916 (= lt!441547 ((_ sign_extend 32) (size!8269 (buf!7882 b1!97))))))

(assert (= (and d!103504 res!255524) b!311915))

(assert (= (and b!311915 res!255523) b!311916))

(assert (=> d!103504 m!449597))

(declare-fun m!449655 () Bool)

(assert (=> d!103504 m!449655))

(assert (=> b!311832 d!103504))

(declare-fun d!103506 () Bool)

(assert (=> d!103506 (= (array_inv!7821 (buf!7882 b2!97)) (bvsge (size!8269 (buf!7882 b2!97)) #b00000000000000000000000000000000))))

(assert (=> b!311826 d!103506))

(declare-fun d!103508 () Bool)

(assert (=> d!103508 (= (inv!12 b1!97) (invariant!0 (currentBit!14542 b1!97) (currentByte!14547 b1!97) (size!8269 (buf!7882 b1!97))))))

(declare-fun bs!26781 () Bool)

(assert (= bs!26781 d!103508))

(assert (=> bs!26781 m!449655))

(assert (=> start!69304 d!103508))

(declare-fun d!103514 () Bool)

(assert (=> d!103514 (= (inv!12 b2!97) (invariant!0 (currentBit!14542 b2!97) (currentByte!14547 b2!97) (size!8269 (buf!7882 b2!97))))))

(declare-fun bs!26782 () Bool)

(assert (= bs!26782 d!103514))

(assert (=> bs!26782 m!449653))

(assert (=> start!69304 d!103514))

(declare-fun d!103516 () Bool)

(assert (=> d!103516 (= (remainingBits!0 ((_ sign_extend 32) (size!8269 (buf!7882 b1!97))) ((_ sign_extend 32) (currentByte!14547 b1!97)) ((_ sign_extend 32) (currentBit!14542 b1!97))) (bvsub (bvmul ((_ sign_extend 32) (size!8269 (buf!7882 b1!97))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14547 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14542 b1!97)))))))

(assert (=> b!311823 d!103516))

(push 1)

(assert (not d!103480))

(assert (not d!103504))

(assert (not d!103514))

(assert (not d!103508))

(assert (not d!103488))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

