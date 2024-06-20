; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19092 () Bool)

(assert start!19092)

(declare-fun b!95420 () Bool)

(declare-fun res!78521 () Bool)

(declare-fun e!62542 () Bool)

(assert (=> b!95420 (=> (not res!78521) (not e!62542))))

(declare-datatypes ((array!4459 0))(
  ( (array!4460 (arr!2636 (Array (_ BitVec 32) (_ BitVec 8))) (size!2034 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3560 0))(
  ( (BitStream!3561 (buf!2389 array!4459) (currentByte!4764 (_ BitVec 32)) (currentBit!4759 (_ BitVec 32))) )
))
(declare-fun bitStream2!8 () BitStream!3560)

(declare-fun base!8 () BitStream!3560)

(declare-fun isPrefixOf!0 (BitStream!3560 BitStream!3560) Bool)

(assert (=> b!95420 (= res!78521 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!95421 () Bool)

(declare-fun lt!139119 () (_ BitVec 64))

(declare-fun lt!139118 () (_ BitVec 64))

(assert (=> b!95421 (= e!62542 (and (= lt!139119 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= lt!139119 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!139118) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!95421 (= lt!139119 (bvand lt!139118 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitStream1!8 () BitStream!3560)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!95421 (= lt!139118 (bitIndex!0 (size!2034 (buf!2389 bitStream1!8)) (currentByte!4764 bitStream1!8) (currentBit!4759 bitStream1!8)))))

(declare-fun b!95422 () Bool)

(declare-fun res!78524 () Bool)

(assert (=> b!95422 (=> (not res!78524) (not e!62542))))

(assert (=> b!95422 (= res!78524 (and (= (buf!2389 bitStream1!8) (buf!2389 bitStream2!8)) (= (buf!2389 bitStream1!8) (buf!2389 base!8))))))

(declare-fun b!95423 () Bool)

(declare-fun e!62544 () Bool)

(declare-fun array_inv!1845 (array!4459) Bool)

(assert (=> b!95423 (= e!62544 (array_inv!1845 (buf!2389 bitStream1!8)))))

(declare-fun res!78519 () Bool)

(assert (=> start!19092 (=> (not res!78519) (not e!62542))))

(declare-fun nBits!484 () (_ BitVec 64))

(assert (=> start!19092 (= res!78519 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!19092 e!62542))

(assert (=> start!19092 true))

(declare-fun inv!12 (BitStream!3560) Bool)

(assert (=> start!19092 (and (inv!12 bitStream1!8) e!62544)))

(declare-fun e!62545 () Bool)

(assert (=> start!19092 (and (inv!12 bitStream2!8) e!62545)))

(declare-fun e!62546 () Bool)

(assert (=> start!19092 (and (inv!12 base!8) e!62546)))

(declare-fun b!95424 () Bool)

(declare-fun res!78520 () Bool)

(assert (=> b!95424 (=> (not res!78520) (not e!62542))))

(assert (=> b!95424 (= res!78520 (bvslt (bitIndex!0 (size!2034 (buf!2389 base!8)) (currentByte!4764 base!8) (currentBit!4759 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!95425 () Bool)

(declare-fun res!78523 () Bool)

(assert (=> b!95425 (=> (not res!78523) (not e!62542))))

(declare-datatypes ((List!886 0))(
  ( (Nil!883) (Cons!882 (h!1001 Bool) (t!1636 List!886)) )
))
(declare-fun listBits!13 () List!886)

(declare-fun length!477 (List!886) Int)

(assert (=> b!95425 (= res!78523 (> (length!477 listBits!13) 0))))

(declare-fun b!95426 () Bool)

(assert (=> b!95426 (= e!62546 (array_inv!1845 (buf!2389 base!8)))))

(declare-fun b!95427 () Bool)

(declare-fun res!78525 () Bool)

(assert (=> b!95427 (=> (not res!78525) (not e!62542))))

(assert (=> b!95427 (= res!78525 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!95428 () Bool)

(declare-fun res!78522 () Bool)

(assert (=> b!95428 (=> (not res!78522) (not e!62542))))

(assert (=> b!95428 (= res!78522 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!95429 () Bool)

(assert (=> b!95429 (= e!62545 (array_inv!1845 (buf!2389 bitStream2!8)))))

(assert (= (and start!19092 res!78519) b!95425))

(assert (= (and b!95425 res!78523) b!95427))

(assert (= (and b!95427 res!78525) b!95420))

(assert (= (and b!95420 res!78521) b!95428))

(assert (= (and b!95428 res!78522) b!95422))

(assert (= (and b!95422 res!78524) b!95424))

(assert (= (and b!95424 res!78520) b!95421))

(assert (= start!19092 b!95423))

(assert (= start!19092 b!95429))

(assert (= start!19092 b!95426))

(declare-fun m!138833 () Bool)

(assert (=> start!19092 m!138833))

(declare-fun m!138835 () Bool)

(assert (=> start!19092 m!138835))

(declare-fun m!138837 () Bool)

(assert (=> start!19092 m!138837))

(declare-fun m!138839 () Bool)

(assert (=> b!95426 m!138839))

(declare-fun m!138841 () Bool)

(assert (=> b!95429 m!138841))

(declare-fun m!138843 () Bool)

(assert (=> b!95421 m!138843))

(declare-fun m!138845 () Bool)

(assert (=> b!95425 m!138845))

(declare-fun m!138847 () Bool)

(assert (=> b!95424 m!138847))

(declare-fun m!138849 () Bool)

(assert (=> b!95428 m!138849))

(declare-fun m!138851 () Bool)

(assert (=> b!95420 m!138851))

(declare-fun m!138853 () Bool)

(assert (=> b!95423 m!138853))

(declare-fun m!138855 () Bool)

(assert (=> b!95427 m!138855))

(push 1)

(assert (not b!95428))

(assert (not b!95429))

(assert (not start!19092))

(assert (not b!95427))

(assert (not b!95421))

(assert (not b!95423))

(assert (not b!95420))

(assert (not b!95424))

(assert (not b!95425))

(assert (not b!95426))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!29714 () Bool)

(declare-fun e!62573 () Bool)

(assert (=> d!29714 e!62573))

(declare-fun res!78569 () Bool)

(assert (=> d!29714 (=> (not res!78569) (not e!62573))))

(declare-fun lt!139174 () (_ BitVec 64))

(declare-fun lt!139175 () (_ BitVec 64))

(declare-fun lt!139176 () (_ BitVec 64))

(assert (=> d!29714 (= res!78569 (= lt!139175 (bvsub lt!139174 lt!139176)))))

(assert (=> d!29714 (or (= (bvand lt!139174 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139176 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!139174 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!139174 lt!139176) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!29714 (= lt!139176 (remainingBits!0 ((_ sign_extend 32) (size!2034 (buf!2389 base!8))) ((_ sign_extend 32) (currentByte!4764 base!8)) ((_ sign_extend 32) (currentBit!4759 base!8))))))

(declare-fun lt!139179 () (_ BitVec 64))

(declare-fun lt!139178 () (_ BitVec 64))

(assert (=> d!29714 (= lt!139174 (bvmul lt!139179 lt!139178))))

(assert (=> d!29714 (or (= lt!139179 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!139178 (bvsdiv (bvmul lt!139179 lt!139178) lt!139179)))))

(assert (=> d!29714 (= lt!139178 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29714 (= lt!139179 ((_ sign_extend 32) (size!2034 (buf!2389 base!8))))))

(assert (=> d!29714 (= lt!139175 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4764 base!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4759 base!8))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!29714 (invariant!0 (currentBit!4759 base!8) (currentByte!4764 base!8) (size!2034 (buf!2389 base!8)))))

(assert (=> d!29714 (= (bitIndex!0 (size!2034 (buf!2389 base!8)) (currentByte!4764 base!8) (currentBit!4759 base!8)) lt!139175)))

(declare-fun b!95472 () Bool)

(declare-fun res!78568 () Bool)

(assert (=> b!95472 (=> (not res!78568) (not e!62573))))

(assert (=> b!95472 (= res!78568 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!139175))))

(declare-fun b!95473 () Bool)

(declare-fun lt!139177 () (_ BitVec 64))

(assert (=> b!95473 (= e!62573 (bvsle lt!139175 (bvmul lt!139177 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!95473 (or (= lt!139177 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!139177 #b0000000000000000000000000000000000000000000000000000000000001000) lt!139177)))))

(assert (=> b!95473 (= lt!139177 ((_ sign_extend 32) (size!2034 (buf!2389 base!8))))))

(assert (= (and d!29714 res!78569) b!95472))

(assert (= (and b!95472 res!78568) b!95473))

(declare-fun m!138887 () Bool)

(assert (=> d!29714 m!138887))

(declare-fun m!138889 () Bool)

(assert (=> d!29714 m!138889))

(assert (=> b!95424 d!29714))

(declare-fun d!29722 () Bool)

(assert (=> d!29722 (= (array_inv!1845 (buf!2389 bitStream2!8)) (bvsge (size!2034 (buf!2389 bitStream2!8)) #b00000000000000000000000000000000))))

(assert (=> b!95429 d!29722))

(declare-fun d!29726 () Bool)

(assert (=> d!29726 (= (array_inv!1845 (buf!2389 bitStream1!8)) (bvsge (size!2034 (buf!2389 bitStream1!8)) #b00000000000000000000000000000000))))

(assert (=> b!95423 d!29726))

(declare-fun d!29728 () Bool)

(declare-fun res!78586 () Bool)

(declare-fun e!62583 () Bool)

(assert (=> d!29728 (=> (not res!78586) (not e!62583))))

(assert (=> d!29728 (= res!78586 (= (size!2034 (buf!2389 bitStream1!8)) (size!2034 (buf!2389 bitStream2!8))))))

(assert (=> d!29728 (= (isPrefixOf!0 bitStream1!8 bitStream2!8) e!62583)))

(declare-fun b!95488 () Bool)

(declare-fun res!78584 () Bool)

(assert (=> b!95488 (=> (not res!78584) (not e!62583))))

(assert (=> b!95488 (= res!78584 (bvsle (bitIndex!0 (size!2034 (buf!2389 bitStream1!8)) (currentByte!4764 bitStream1!8) (currentBit!4759 bitStream1!8)) (bitIndex!0 (size!2034 (buf!2389 bitStream2!8)) (currentByte!4764 bitStream2!8) (currentBit!4759 bitStream2!8))))))

(declare-fun b!95489 () Bool)

(declare-fun e!62584 () Bool)

(assert (=> b!95489 (= e!62583 e!62584)))

(declare-fun res!78585 () Bool)

(assert (=> b!95489 (=> res!78585 e!62584)))

(assert (=> b!95489 (= res!78585 (= (size!2034 (buf!2389 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!95490 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4459 array!4459 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!95490 (= e!62584 (arrayBitRangesEq!0 (buf!2389 bitStream1!8) (buf!2389 bitStream2!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2034 (buf!2389 bitStream1!8)) (currentByte!4764 bitStream1!8) (currentBit!4759 bitStream1!8))))))

(assert (= (and d!29728 res!78586) b!95488))

(assert (= (and b!95488 res!78584) b!95489))

(assert (= (and b!95489 (not res!78585)) b!95490))

(assert (=> b!95488 m!138843))

(declare-fun m!138901 () Bool)

(assert (=> b!95488 m!138901))

(assert (=> b!95490 m!138843))

(assert (=> b!95490 m!138843))

(declare-fun m!138903 () Bool)

(assert (=> b!95490 m!138903))

(assert (=> b!95428 d!29728))

(declare-fun d!29740 () Bool)

(declare-fun res!78589 () Bool)

(declare-fun e!62585 () Bool)

(assert (=> d!29740 (=> (not res!78589) (not e!62585))))

(assert (=> d!29740 (= res!78589 (= (size!2034 (buf!2389 bitStream1!8)) (size!2034 (buf!2389 base!8))))))

(assert (=> d!29740 (= (isPrefixOf!0 bitStream1!8 base!8) e!62585)))

(declare-fun b!95491 () Bool)

(declare-fun res!78587 () Bool)

(assert (=> b!95491 (=> (not res!78587) (not e!62585))))

(assert (=> b!95491 (= res!78587 (bvsle (bitIndex!0 (size!2034 (buf!2389 bitStream1!8)) (currentByte!4764 bitStream1!8) (currentBit!4759 bitStream1!8)) (bitIndex!0 (size!2034 (buf!2389 base!8)) (currentByte!4764 base!8) (currentBit!4759 base!8))))))

(declare-fun b!95492 () Bool)

(declare-fun e!62586 () Bool)

(assert (=> b!95492 (= e!62585 e!62586)))

(declare-fun res!78588 () Bool)

(assert (=> b!95492 (=> res!78588 e!62586)))

(assert (=> b!95492 (= res!78588 (= (size!2034 (buf!2389 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!95493 () Bool)

(assert (=> b!95493 (= e!62586 (arrayBitRangesEq!0 (buf!2389 bitStream1!8) (buf!2389 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2034 (buf!2389 bitStream1!8)) (currentByte!4764 bitStream1!8) (currentBit!4759 bitStream1!8))))))

(assert (= (and d!29740 res!78589) b!95491))

(assert (= (and b!95491 res!78587) b!95492))

(assert (= (and b!95492 (not res!78588)) b!95493))

(assert (=> b!95491 m!138843))

(assert (=> b!95491 m!138847))

(assert (=> b!95493 m!138843))

(assert (=> b!95493 m!138843))

(declare-fun m!138905 () Bool)

(assert (=> b!95493 m!138905))

(assert (=> b!95427 d!29740))

(declare-fun d!29742 () Bool)

(declare-fun e!62587 () Bool)

(assert (=> d!29742 e!62587))

(declare-fun res!78591 () Bool)

(assert (=> d!29742 (=> (not res!78591) (not e!62587))))

(declare-fun lt!139188 () (_ BitVec 64))

(declare-fun lt!139187 () (_ BitVec 64))

(declare-fun lt!139186 () (_ BitVec 64))

(assert (=> d!29742 (= res!78591 (= lt!139187 (bvsub lt!139186 lt!139188)))))

(assert (=> d!29742 (or (= (bvand lt!139186 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139188 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!139186 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!139186 lt!139188) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29742 (= lt!139188 (remainingBits!0 ((_ sign_extend 32) (size!2034 (buf!2389 bitStream1!8))) ((_ sign_extend 32) (currentByte!4764 bitStream1!8)) ((_ sign_extend 32) (currentBit!4759 bitStream1!8))))))

(declare-fun lt!139191 () (_ BitVec 64))

(declare-fun lt!139190 () (_ BitVec 64))

(assert (=> d!29742 (= lt!139186 (bvmul lt!139191 lt!139190))))

(assert (=> d!29742 (or (= lt!139191 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!139190 (bvsdiv (bvmul lt!139191 lt!139190) lt!139191)))))

(assert (=> d!29742 (= lt!139190 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29742 (= lt!139191 ((_ sign_extend 32) (size!2034 (buf!2389 bitStream1!8))))))

(assert (=> d!29742 (= lt!139187 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4764 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4759 bitStream1!8))))))

(assert (=> d!29742 (invariant!0 (currentBit!4759 bitStream1!8) (currentByte!4764 bitStream1!8) (size!2034 (buf!2389 bitStream1!8)))))

(assert (=> d!29742 (= (bitIndex!0 (size!2034 (buf!2389 bitStream1!8)) (currentByte!4764 bitStream1!8) (currentBit!4759 bitStream1!8)) lt!139187)))

(declare-fun b!95494 () Bool)

(declare-fun res!78590 () Bool)

(assert (=> b!95494 (=> (not res!78590) (not e!62587))))

(assert (=> b!95494 (= res!78590 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!139187))))

(declare-fun b!95495 () Bool)

(declare-fun lt!139189 () (_ BitVec 64))

(assert (=> b!95495 (= e!62587 (bvsle lt!139187 (bvmul lt!139189 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!95495 (or (= lt!139189 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!139189 #b0000000000000000000000000000000000000000000000000000000000001000) lt!139189)))))

(assert (=> b!95495 (= lt!139189 ((_ sign_extend 32) (size!2034 (buf!2389 bitStream1!8))))))

(assert (= (and d!29742 res!78591) b!95494))

(assert (= (and b!95494 res!78590) b!95495))

(declare-fun m!138907 () Bool)

(assert (=> d!29742 m!138907))

(declare-fun m!138909 () Bool)

(assert (=> d!29742 m!138909))

(assert (=> b!95421 d!29742))

(declare-fun d!29744 () Bool)

(assert (=> d!29744 (= (array_inv!1845 (buf!2389 base!8)) (bvsge (size!2034 (buf!2389 base!8)) #b00000000000000000000000000000000))))

(assert (=> b!95426 d!29744))

(declare-fun d!29746 () Bool)

(assert (=> d!29746 (= (inv!12 bitStream1!8) (invariant!0 (currentBit!4759 bitStream1!8) (currentByte!4764 bitStream1!8) (size!2034 (buf!2389 bitStream1!8))))))

(declare-fun bs!7312 () Bool)

(assert (= bs!7312 d!29746))

(assert (=> bs!7312 m!138909))

(assert (=> start!19092 d!29746))

(declare-fun d!29748 () Bool)

(assert (=> d!29748 (= (inv!12 bitStream2!8) (invariant!0 (currentBit!4759 bitStream2!8) (currentByte!4764 bitStream2!8) (size!2034 (buf!2389 bitStream2!8))))))

(declare-fun bs!7313 () Bool)

(assert (= bs!7313 d!29748))

(declare-fun m!138911 () Bool)

(assert (=> bs!7313 m!138911))

(assert (=> start!19092 d!29748))

(declare-fun d!29750 () Bool)

(assert (=> d!29750 (= (inv!12 base!8) (invariant!0 (currentBit!4759 base!8) (currentByte!4764 base!8) (size!2034 (buf!2389 base!8))))))

(declare-fun bs!7314 () Bool)

(assert (= bs!7314 d!29750))

(assert (=> bs!7314 m!138889))

(assert (=> start!19092 d!29750))

(declare-fun d!29752 () Bool)

(declare-fun res!78594 () Bool)

(declare-fun e!62588 () Bool)

(assert (=> d!29752 (=> (not res!78594) (not e!62588))))

(assert (=> d!29752 (= res!78594 (= (size!2034 (buf!2389 bitStream2!8)) (size!2034 (buf!2389 base!8))))))

(assert (=> d!29752 (= (isPrefixOf!0 bitStream2!8 base!8) e!62588)))

(declare-fun b!95496 () Bool)

(declare-fun res!78592 () Bool)

(assert (=> b!95496 (=> (not res!78592) (not e!62588))))

(assert (=> b!95496 (= res!78592 (bvsle (bitIndex!0 (size!2034 (buf!2389 bitStream2!8)) (currentByte!4764 bitStream2!8) (currentBit!4759 bitStream2!8)) (bitIndex!0 (size!2034 (buf!2389 base!8)) (currentByte!4764 base!8) (currentBit!4759 base!8))))))

(declare-fun b!95497 () Bool)

(declare-fun e!62589 () Bool)

(assert (=> b!95497 (= e!62588 e!62589)))

(declare-fun res!78593 () Bool)

(assert (=> b!95497 (=> res!78593 e!62589)))

(assert (=> b!95497 (= res!78593 (= (size!2034 (buf!2389 bitStream2!8)) #b00000000000000000000000000000000))))

(declare-fun b!95498 () Bool)

(assert (=> b!95498 (= e!62589 (arrayBitRangesEq!0 (buf!2389 bitStream2!8) (buf!2389 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2034 (buf!2389 bitStream2!8)) (currentByte!4764 bitStream2!8) (currentBit!4759 bitStream2!8))))))

(assert (= (and d!29752 res!78594) b!95496))

(assert (= (and b!95496 res!78592) b!95497))

(assert (= (and b!95497 (not res!78593)) b!95498))

(assert (=> b!95496 m!138901))

(assert (=> b!95496 m!138847))

(assert (=> b!95498 m!138901))

(assert (=> b!95498 m!138901))

(declare-fun m!138913 () Bool)

(assert (=> b!95498 m!138913))

(assert (=> b!95420 d!29752))

(declare-fun d!29754 () Bool)

(declare-fun size!2037 (List!886) Int)

(assert (=> d!29754 (= (length!477 listBits!13) (size!2037 listBits!13))))

(declare-fun bs!7315 () Bool)

(assert (= bs!7315 d!29754))

(declare-fun m!138915 () Bool)

(assert (=> bs!7315 m!138915))

(assert (=> b!95425 d!29754))

(push 1)

(assert (not b!95493))

(assert (not d!29754))

(assert (not d!29748))

(assert (not b!95498))

(assert (not b!95488))

(assert (not d!29746))

(assert (not b!95490))

(assert (not d!29714))

(assert (not b!95491))

(assert (not d!29750))

(assert (not d!29742))

(assert (not b!95496))

(check-sat)

(pop 1)

(push 1)

(check-sat)

