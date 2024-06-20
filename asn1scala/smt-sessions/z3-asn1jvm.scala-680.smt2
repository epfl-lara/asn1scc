; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19090 () Bool)

(assert start!19090)

(declare-fun b!95390 () Bool)

(declare-fun res!78498 () Bool)

(declare-fun e!62523 () Bool)

(assert (=> b!95390 (=> (not res!78498) (not e!62523))))

(declare-datatypes ((array!4457 0))(
  ( (array!4458 (arr!2635 (Array (_ BitVec 32) (_ BitVec 8))) (size!2033 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3558 0))(
  ( (BitStream!3559 (buf!2388 array!4457) (currentByte!4763 (_ BitVec 32)) (currentBit!4758 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3558)

(declare-fun bitStream2!8 () BitStream!3558)

(declare-fun base!8 () BitStream!3558)

(assert (=> b!95390 (= res!78498 (and (= (buf!2388 bitStream1!8) (buf!2388 bitStream2!8)) (= (buf!2388 bitStream1!8) (buf!2388 base!8))))))

(declare-fun b!95391 () Bool)

(declare-fun e!62521 () Bool)

(declare-fun array_inv!1844 (array!4457) Bool)

(assert (=> b!95391 (= e!62521 (array_inv!1844 (buf!2388 base!8)))))

(declare-fun b!95392 () Bool)

(declare-fun res!78500 () Bool)

(assert (=> b!95392 (=> (not res!78500) (not e!62523))))

(declare-datatypes ((List!885 0))(
  ( (Nil!882) (Cons!881 (h!1000 Bool) (t!1635 List!885)) )
))
(declare-fun listBits!13 () List!885)

(declare-fun length!476 (List!885) Int)

(assert (=> b!95392 (= res!78500 (> (length!476 listBits!13) 0))))

(declare-fun b!95393 () Bool)

(declare-fun e!62524 () Bool)

(assert (=> b!95393 (= e!62524 (array_inv!1844 (buf!2388 bitStream2!8)))))

(declare-fun res!78501 () Bool)

(assert (=> start!19090 (=> (not res!78501) (not e!62523))))

(declare-fun nBits!484 () (_ BitVec 64))

(assert (=> start!19090 (= res!78501 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!19090 e!62523))

(assert (=> start!19090 true))

(declare-fun e!62526 () Bool)

(declare-fun inv!12 (BitStream!3558) Bool)

(assert (=> start!19090 (and (inv!12 bitStream1!8) e!62526)))

(assert (=> start!19090 (and (inv!12 bitStream2!8) e!62524)))

(assert (=> start!19090 (and (inv!12 base!8) e!62521)))

(declare-fun b!95394 () Bool)

(declare-fun res!78499 () Bool)

(assert (=> b!95394 (=> (not res!78499) (not e!62523))))

(declare-fun isPrefixOf!0 (BitStream!3558 BitStream!3558) Bool)

(assert (=> b!95394 (= res!78499 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!95395 () Bool)

(declare-fun res!78502 () Bool)

(assert (=> b!95395 (=> (not res!78502) (not e!62523))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!95395 (= res!78502 (bvslt (bitIndex!0 (size!2033 (buf!2388 base!8)) (currentByte!4763 base!8) (currentBit!4758 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!95396 () Bool)

(assert (=> b!95396 (= e!62526 (array_inv!1844 (buf!2388 bitStream1!8)))))

(declare-fun b!95397 () Bool)

(declare-fun res!78503 () Bool)

(assert (=> b!95397 (=> (not res!78503) (not e!62523))))

(assert (=> b!95397 (= res!78503 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!95398 () Bool)

(declare-fun lt!139113 () (_ BitVec 64))

(declare-fun lt!139112 () (_ BitVec 64))

(assert (=> b!95398 (= e!62523 (and (= lt!139113 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= lt!139113 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!139112) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!95398 (= lt!139113 (bvand lt!139112 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!95398 (= lt!139112 (bitIndex!0 (size!2033 (buf!2388 bitStream1!8)) (currentByte!4763 bitStream1!8) (currentBit!4758 bitStream1!8)))))

(declare-fun b!95399 () Bool)

(declare-fun res!78504 () Bool)

(assert (=> b!95399 (=> (not res!78504) (not e!62523))))

(assert (=> b!95399 (= res!78504 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(assert (= (and start!19090 res!78501) b!95392))

(assert (= (and b!95392 res!78500) b!95397))

(assert (= (and b!95397 res!78503) b!95394))

(assert (= (and b!95394 res!78499) b!95399))

(assert (= (and b!95399 res!78504) b!95390))

(assert (= (and b!95390 res!78498) b!95395))

(assert (= (and b!95395 res!78502) b!95398))

(assert (= start!19090 b!95396))

(assert (= start!19090 b!95393))

(assert (= start!19090 b!95391))

(declare-fun m!138809 () Bool)

(assert (=> b!95395 m!138809))

(declare-fun m!138811 () Bool)

(assert (=> b!95399 m!138811))

(declare-fun m!138813 () Bool)

(assert (=> b!95393 m!138813))

(declare-fun m!138815 () Bool)

(assert (=> b!95398 m!138815))

(declare-fun m!138817 () Bool)

(assert (=> b!95394 m!138817))

(declare-fun m!138819 () Bool)

(assert (=> b!95391 m!138819))

(declare-fun m!138821 () Bool)

(assert (=> b!95396 m!138821))

(declare-fun m!138823 () Bool)

(assert (=> start!19090 m!138823))

(declare-fun m!138825 () Bool)

(assert (=> start!19090 m!138825))

(declare-fun m!138827 () Bool)

(assert (=> start!19090 m!138827))

(declare-fun m!138829 () Bool)

(assert (=> b!95397 m!138829))

(declare-fun m!138831 () Bool)

(assert (=> b!95392 m!138831))

(check-sat (not b!95394) (not b!95395) (not b!95393) (not b!95396) (not start!19090) (not b!95399) (not b!95398) (not b!95392) (not b!95391) (not b!95397))
(check-sat)
(get-model)

(declare-fun d!29684 () Bool)

(assert (=> d!29684 (= (array_inv!1844 (buf!2388 base!8)) (bvsge (size!2033 (buf!2388 base!8)) #b00000000000000000000000000000000))))

(assert (=> b!95391 d!29684))

(declare-fun d!29686 () Bool)

(assert (=> d!29686 (= (array_inv!1844 (buf!2388 bitStream1!8)) (bvsge (size!2033 (buf!2388 bitStream1!8)) #b00000000000000000000000000000000))))

(assert (=> b!95396 d!29686))

(declare-fun d!29688 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!29688 (= (inv!12 bitStream1!8) (invariant!0 (currentBit!4758 bitStream1!8) (currentByte!4763 bitStream1!8) (size!2033 (buf!2388 bitStream1!8))))))

(declare-fun bs!7304 () Bool)

(assert (= bs!7304 d!29688))

(declare-fun m!138857 () Bool)

(assert (=> bs!7304 m!138857))

(assert (=> start!19090 d!29688))

(declare-fun d!29690 () Bool)

(assert (=> d!29690 (= (inv!12 bitStream2!8) (invariant!0 (currentBit!4758 bitStream2!8) (currentByte!4763 bitStream2!8) (size!2033 (buf!2388 bitStream2!8))))))

(declare-fun bs!7305 () Bool)

(assert (= bs!7305 d!29690))

(declare-fun m!138859 () Bool)

(assert (=> bs!7305 m!138859))

(assert (=> start!19090 d!29690))

(declare-fun d!29692 () Bool)

(assert (=> d!29692 (= (inv!12 base!8) (invariant!0 (currentBit!4758 base!8) (currentByte!4763 base!8) (size!2033 (buf!2388 base!8))))))

(declare-fun bs!7306 () Bool)

(assert (= bs!7306 d!29692))

(declare-fun m!138861 () Bool)

(assert (=> bs!7306 m!138861))

(assert (=> start!19090 d!29692))

(declare-fun d!29694 () Bool)

(declare-fun e!62554 () Bool)

(assert (=> d!29694 e!62554))

(declare-fun res!78537 () Bool)

(assert (=> d!29694 (=> (not res!78537) (not e!62554))))

(declare-fun lt!139137 () (_ BitVec 64))

(declare-fun lt!139136 () (_ BitVec 64))

(declare-fun lt!139134 () (_ BitVec 64))

(assert (=> d!29694 (= res!78537 (= lt!139136 (bvsub lt!139137 lt!139134)))))

(assert (=> d!29694 (or (= (bvand lt!139137 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139134 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!139137 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!139137 lt!139134) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!29694 (= lt!139134 (remainingBits!0 ((_ sign_extend 32) (size!2033 (buf!2388 base!8))) ((_ sign_extend 32) (currentByte!4763 base!8)) ((_ sign_extend 32) (currentBit!4758 base!8))))))

(declare-fun lt!139132 () (_ BitVec 64))

(declare-fun lt!139135 () (_ BitVec 64))

(assert (=> d!29694 (= lt!139137 (bvmul lt!139132 lt!139135))))

(assert (=> d!29694 (or (= lt!139132 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!139135 (bvsdiv (bvmul lt!139132 lt!139135) lt!139132)))))

(assert (=> d!29694 (= lt!139135 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29694 (= lt!139132 ((_ sign_extend 32) (size!2033 (buf!2388 base!8))))))

(assert (=> d!29694 (= lt!139136 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4763 base!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4758 base!8))))))

(assert (=> d!29694 (invariant!0 (currentBit!4758 base!8) (currentByte!4763 base!8) (size!2033 (buf!2388 base!8)))))

(assert (=> d!29694 (= (bitIndex!0 (size!2033 (buf!2388 base!8)) (currentByte!4763 base!8) (currentBit!4758 base!8)) lt!139136)))

(declare-fun b!95440 () Bool)

(declare-fun res!78536 () Bool)

(assert (=> b!95440 (=> (not res!78536) (not e!62554))))

(assert (=> b!95440 (= res!78536 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!139136))))

(declare-fun b!95441 () Bool)

(declare-fun lt!139133 () (_ BitVec 64))

(assert (=> b!95441 (= e!62554 (bvsle lt!139136 (bvmul lt!139133 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!95441 (or (= lt!139133 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!139133 #b0000000000000000000000000000000000000000000000000000000000001000) lt!139133)))))

(assert (=> b!95441 (= lt!139133 ((_ sign_extend 32) (size!2033 (buf!2388 base!8))))))

(assert (= (and d!29694 res!78537) b!95440))

(assert (= (and b!95440 res!78536) b!95441))

(declare-fun m!138863 () Bool)

(assert (=> d!29694 m!138863))

(assert (=> d!29694 m!138861))

(assert (=> b!95395 d!29694))

(declare-fun d!29698 () Bool)

(declare-fun res!78548 () Bool)

(declare-fun e!62562 () Bool)

(assert (=> d!29698 (=> (not res!78548) (not e!62562))))

(assert (=> d!29698 (= res!78548 (= (size!2033 (buf!2388 bitStream2!8)) (size!2033 (buf!2388 base!8))))))

(assert (=> d!29698 (= (isPrefixOf!0 bitStream2!8 base!8) e!62562)))

(declare-fun b!95451 () Bool)

(declare-fun res!78547 () Bool)

(assert (=> b!95451 (=> (not res!78547) (not e!62562))))

(assert (=> b!95451 (= res!78547 (bvsle (bitIndex!0 (size!2033 (buf!2388 bitStream2!8)) (currentByte!4763 bitStream2!8) (currentBit!4758 bitStream2!8)) (bitIndex!0 (size!2033 (buf!2388 base!8)) (currentByte!4763 base!8) (currentBit!4758 base!8))))))

(declare-fun b!95452 () Bool)

(declare-fun e!62561 () Bool)

(assert (=> b!95452 (= e!62562 e!62561)))

(declare-fun res!78549 () Bool)

(assert (=> b!95452 (=> res!78549 e!62561)))

(assert (=> b!95452 (= res!78549 (= (size!2033 (buf!2388 bitStream2!8)) #b00000000000000000000000000000000))))

(declare-fun b!95453 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4457 array!4457 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!95453 (= e!62561 (arrayBitRangesEq!0 (buf!2388 bitStream2!8) (buf!2388 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2033 (buf!2388 bitStream2!8)) (currentByte!4763 bitStream2!8) (currentBit!4758 bitStream2!8))))))

(assert (= (and d!29698 res!78548) b!95451))

(assert (= (and b!95451 res!78547) b!95452))

(assert (= (and b!95452 (not res!78549)) b!95453))

(declare-fun m!138869 () Bool)

(assert (=> b!95451 m!138869))

(assert (=> b!95451 m!138809))

(assert (=> b!95453 m!138869))

(assert (=> b!95453 m!138869))

(declare-fun m!138871 () Bool)

(assert (=> b!95453 m!138871))

(assert (=> b!95394 d!29698))

(declare-fun d!29704 () Bool)

(declare-fun res!78551 () Bool)

(declare-fun e!62564 () Bool)

(assert (=> d!29704 (=> (not res!78551) (not e!62564))))

(assert (=> d!29704 (= res!78551 (= (size!2033 (buf!2388 bitStream1!8)) (size!2033 (buf!2388 bitStream2!8))))))

(assert (=> d!29704 (= (isPrefixOf!0 bitStream1!8 bitStream2!8) e!62564)))

(declare-fun b!95454 () Bool)

(declare-fun res!78550 () Bool)

(assert (=> b!95454 (=> (not res!78550) (not e!62564))))

(assert (=> b!95454 (= res!78550 (bvsle (bitIndex!0 (size!2033 (buf!2388 bitStream1!8)) (currentByte!4763 bitStream1!8) (currentBit!4758 bitStream1!8)) (bitIndex!0 (size!2033 (buf!2388 bitStream2!8)) (currentByte!4763 bitStream2!8) (currentBit!4758 bitStream2!8))))))

(declare-fun b!95455 () Bool)

(declare-fun e!62563 () Bool)

(assert (=> b!95455 (= e!62564 e!62563)))

(declare-fun res!78552 () Bool)

(assert (=> b!95455 (=> res!78552 e!62563)))

(assert (=> b!95455 (= res!78552 (= (size!2033 (buf!2388 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!95456 () Bool)

(assert (=> b!95456 (= e!62563 (arrayBitRangesEq!0 (buf!2388 bitStream1!8) (buf!2388 bitStream2!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2033 (buf!2388 bitStream1!8)) (currentByte!4763 bitStream1!8) (currentBit!4758 bitStream1!8))))))

(assert (= (and d!29704 res!78551) b!95454))

(assert (= (and b!95454 res!78550) b!95455))

(assert (= (and b!95455 (not res!78552)) b!95456))

(assert (=> b!95454 m!138815))

(assert (=> b!95454 m!138869))

(assert (=> b!95456 m!138815))

(assert (=> b!95456 m!138815))

(declare-fun m!138873 () Bool)

(assert (=> b!95456 m!138873))

(assert (=> b!95399 d!29704))

(declare-fun d!29706 () Bool)

(assert (=> d!29706 (= (array_inv!1844 (buf!2388 bitStream2!8)) (bvsge (size!2033 (buf!2388 bitStream2!8)) #b00000000000000000000000000000000))))

(assert (=> b!95393 d!29706))

(declare-fun d!29708 () Bool)

(declare-fun e!62565 () Bool)

(assert (=> d!29708 e!62565))

(declare-fun res!78554 () Bool)

(assert (=> d!29708 (=> (not res!78554) (not e!62565))))

(declare-fun lt!139142 () (_ BitVec 64))

(declare-fun lt!139143 () (_ BitVec 64))

(declare-fun lt!139140 () (_ BitVec 64))

(assert (=> d!29708 (= res!78554 (= lt!139142 (bvsub lt!139143 lt!139140)))))

(assert (=> d!29708 (or (= (bvand lt!139143 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139140 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!139143 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!139143 lt!139140) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29708 (= lt!139140 (remainingBits!0 ((_ sign_extend 32) (size!2033 (buf!2388 bitStream1!8))) ((_ sign_extend 32) (currentByte!4763 bitStream1!8)) ((_ sign_extend 32) (currentBit!4758 bitStream1!8))))))

(declare-fun lt!139138 () (_ BitVec 64))

(declare-fun lt!139141 () (_ BitVec 64))

(assert (=> d!29708 (= lt!139143 (bvmul lt!139138 lt!139141))))

(assert (=> d!29708 (or (= lt!139138 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!139141 (bvsdiv (bvmul lt!139138 lt!139141) lt!139138)))))

(assert (=> d!29708 (= lt!139141 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29708 (= lt!139138 ((_ sign_extend 32) (size!2033 (buf!2388 bitStream1!8))))))

(assert (=> d!29708 (= lt!139142 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4763 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4758 bitStream1!8))))))

(assert (=> d!29708 (invariant!0 (currentBit!4758 bitStream1!8) (currentByte!4763 bitStream1!8) (size!2033 (buf!2388 bitStream1!8)))))

(assert (=> d!29708 (= (bitIndex!0 (size!2033 (buf!2388 bitStream1!8)) (currentByte!4763 bitStream1!8) (currentBit!4758 bitStream1!8)) lt!139142)))

(declare-fun b!95457 () Bool)

(declare-fun res!78553 () Bool)

(assert (=> b!95457 (=> (not res!78553) (not e!62565))))

(assert (=> b!95457 (= res!78553 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!139142))))

(declare-fun b!95458 () Bool)

(declare-fun lt!139139 () (_ BitVec 64))

(assert (=> b!95458 (= e!62565 (bvsle lt!139142 (bvmul lt!139139 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!95458 (or (= lt!139139 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!139139 #b0000000000000000000000000000000000000000000000000000000000001000) lt!139139)))))

(assert (=> b!95458 (= lt!139139 ((_ sign_extend 32) (size!2033 (buf!2388 bitStream1!8))))))

(assert (= (and d!29708 res!78554) b!95457))

(assert (= (and b!95457 res!78553) b!95458))

(declare-fun m!138875 () Bool)

(assert (=> d!29708 m!138875))

(assert (=> d!29708 m!138857))

(assert (=> b!95398 d!29708))

(declare-fun d!29710 () Bool)

(declare-fun size!2035 (List!885) Int)

(assert (=> d!29710 (= (length!476 listBits!13) (size!2035 listBits!13))))

(declare-fun bs!7307 () Bool)

(assert (= bs!7307 d!29710))

(declare-fun m!138877 () Bool)

(assert (=> bs!7307 m!138877))

(assert (=> b!95392 d!29710))

(declare-fun d!29712 () Bool)

(declare-fun res!78556 () Bool)

(declare-fun e!62567 () Bool)

(assert (=> d!29712 (=> (not res!78556) (not e!62567))))

(assert (=> d!29712 (= res!78556 (= (size!2033 (buf!2388 bitStream1!8)) (size!2033 (buf!2388 base!8))))))

(assert (=> d!29712 (= (isPrefixOf!0 bitStream1!8 base!8) e!62567)))

(declare-fun b!95459 () Bool)

(declare-fun res!78555 () Bool)

(assert (=> b!95459 (=> (not res!78555) (not e!62567))))

(assert (=> b!95459 (= res!78555 (bvsle (bitIndex!0 (size!2033 (buf!2388 bitStream1!8)) (currentByte!4763 bitStream1!8) (currentBit!4758 bitStream1!8)) (bitIndex!0 (size!2033 (buf!2388 base!8)) (currentByte!4763 base!8) (currentBit!4758 base!8))))))

(declare-fun b!95460 () Bool)

(declare-fun e!62566 () Bool)

(assert (=> b!95460 (= e!62567 e!62566)))

(declare-fun res!78557 () Bool)

(assert (=> b!95460 (=> res!78557 e!62566)))

(assert (=> b!95460 (= res!78557 (= (size!2033 (buf!2388 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!95461 () Bool)

(assert (=> b!95461 (= e!62566 (arrayBitRangesEq!0 (buf!2388 bitStream1!8) (buf!2388 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2033 (buf!2388 bitStream1!8)) (currentByte!4763 bitStream1!8) (currentBit!4758 bitStream1!8))))))

(assert (= (and d!29712 res!78556) b!95459))

(assert (= (and b!95459 res!78555) b!95460))

(assert (= (and b!95460 (not res!78557)) b!95461))

(assert (=> b!95459 m!138815))

(assert (=> b!95459 m!138809))

(assert (=> b!95461 m!138815))

(assert (=> b!95461 m!138815))

(declare-fun m!138879 () Bool)

(assert (=> b!95461 m!138879))

(assert (=> b!95397 d!29712))

(check-sat (not b!95454) (not b!95451) (not d!29708) (not d!29688) (not d!29694) (not d!29690) (not d!29710) (not b!95459) (not b!95456) (not d!29692) (not b!95453) (not b!95461))
