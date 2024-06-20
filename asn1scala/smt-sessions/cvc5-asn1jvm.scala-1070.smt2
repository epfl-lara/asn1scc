; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30742 () Bool)

(assert start!30742)

(declare-fun res!130477 () Bool)

(declare-fun e!105365 () Bool)

(assert (=> start!30742 (=> (not res!130477) (not e!105365))))

(declare-fun to!236 () (_ BitVec 32))

(declare-datatypes ((array!7140 0))(
  ( (array!7141 (arr!4049 (Array (_ BitVec 32) (_ BitVec 8))) (size!3205 (_ BitVec 32))) )
))
(declare-fun arr!153 () array!7140)

(declare-fun from!240 () (_ BitVec 32))

(assert (=> start!30742 (= res!130477 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3205 arr!153))))))

(assert (=> start!30742 e!105365))

(assert (=> start!30742 true))

(declare-fun array_inv!2994 (array!7140) Bool)

(assert (=> start!30742 (array_inv!2994 arr!153)))

(declare-datatypes ((BitStream!5668 0))(
  ( (BitStream!5669 (buf!3708 array!7140) (currentByte!6799 (_ BitVec 32)) (currentBit!6794 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5668)

(declare-fun e!105363 () Bool)

(declare-fun inv!12 (BitStream!5668) Bool)

(assert (=> start!30742 (and (inv!12 bs!65) e!105363)))

(declare-fun b!156074 () Bool)

(declare-fun res!130478 () Bool)

(assert (=> b!156074 (=> (not res!130478) (not e!105365))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!156074 (= res!130478 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3205 (buf!3708 bs!65))) ((_ sign_extend 32) (currentByte!6799 bs!65)) ((_ sign_extend 32) (currentBit!6794 bs!65)) (bvsub to!236 from!240)))))

(declare-datatypes ((tuple2!13894 0))(
  ( (tuple2!13895 (_1!7379 BitStream!5668) (_2!7379 array!7140)) )
))
(declare-fun lt!243471 () tuple2!13894)

(declare-fun lt!243472 () tuple2!13894)

(declare-fun b!156075 () Bool)

(assert (=> b!156075 (= e!105365 (and (= from!240 (bvsub to!236 #b00000000000000000000000000000001)) (bvsle #b00000000000000000000000000000000 to!236) (bvsle (size!3205 (_2!7379 lt!243471)) (size!3205 (_2!7379 lt!243472))) (bvsgt to!236 (size!3205 (_2!7379 lt!243471)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5668 array!7140 (_ BitVec 32) (_ BitVec 32)) tuple2!13894)

(declare-fun withMovedByteIndex!0 (BitStream!5668 (_ BitVec 32)) BitStream!5668)

(declare-datatypes ((tuple2!13896 0))(
  ( (tuple2!13897 (_1!7380 BitStream!5668) (_2!7380 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5668) tuple2!13896)

(assert (=> b!156075 (= lt!243472 (readByteArrayLoopPure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7141 (store (arr!4049 arr!153) from!240 (_2!7380 (readBytePure!0 bs!65))) (size!3205 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> b!156075 (= lt!243471 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!156076 () Bool)

(assert (=> b!156076 (= e!105363 (array_inv!2994 (buf!3708 bs!65)))))

(assert (= (and start!30742 res!130477) b!156074))

(assert (= (and b!156074 res!130478) b!156075))

(assert (= start!30742 b!156076))

(declare-fun m!242793 () Bool)

(assert (=> start!30742 m!242793))

(declare-fun m!242795 () Bool)

(assert (=> start!30742 m!242795))

(declare-fun m!242797 () Bool)

(assert (=> b!156074 m!242797))

(declare-fun m!242799 () Bool)

(assert (=> b!156075 m!242799))

(declare-fun m!242801 () Bool)

(assert (=> b!156075 m!242801))

(assert (=> b!156075 m!242801))

(declare-fun m!242803 () Bool)

(assert (=> b!156075 m!242803))

(declare-fun m!242805 () Bool)

(assert (=> b!156075 m!242805))

(declare-fun m!242807 () Bool)

(assert (=> b!156075 m!242807))

(declare-fun m!242809 () Bool)

(assert (=> b!156076 m!242809))

(push 1)

(assert (not b!156076))

(assert (not b!156074))

(assert (not b!156075))

(assert (not start!30742))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!51790 () Bool)

(assert (=> d!51790 (= (array_inv!2994 (buf!3708 bs!65)) (bvsge (size!3205 (buf!3708 bs!65)) #b00000000000000000000000000000000))))

(assert (=> b!156076 d!51790))

(declare-fun d!51792 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!51792 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3205 (buf!3708 bs!65))) ((_ sign_extend 32) (currentByte!6799 bs!65)) ((_ sign_extend 32) (currentBit!6794 bs!65)) (bvsub to!236 from!240)) (bvsle ((_ sign_extend 32) (bvsub to!236 from!240)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3205 (buf!3708 bs!65))) ((_ sign_extend 32) (currentByte!6799 bs!65)) ((_ sign_extend 32) (currentBit!6794 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12675 () Bool)

(assert (= bs!12675 d!51792))

(declare-fun m!242847 () Bool)

(assert (=> bs!12675 m!242847))

(assert (=> b!156074 d!51792))

(declare-fun d!51794 () Bool)

(declare-datatypes ((Unit!9949 0))(
  ( (Unit!9950) )
))
(declare-datatypes ((tuple3!630 0))(
  ( (tuple3!631 (_1!7385 Unit!9949) (_2!7385 BitStream!5668) (_3!432 array!7140)) )
))
(declare-fun lt!243487 () tuple3!630)

(declare-fun readByteArrayLoop!0 (BitStream!5668 array!7140 (_ BitVec 32) (_ BitVec 32)) tuple3!630)

(assert (=> d!51794 (= lt!243487 (readByteArrayLoop!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7141 (store (arr!4049 arr!153) from!240 (_2!7380 (readBytePure!0 bs!65))) (size!3205 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!51794 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7141 (store (arr!4049 arr!153) from!240 (_2!7380 (readBytePure!0 bs!65))) (size!3205 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236) (tuple2!13895 (_2!7385 lt!243487) (_3!432 lt!243487)))))

(declare-fun bs!12676 () Bool)

(assert (= bs!12676 d!51794))

(assert (=> bs!12676 m!242801))

(declare-fun m!242849 () Bool)

(assert (=> bs!12676 m!242849))

(assert (=> b!156075 d!51794))

(declare-fun d!51796 () Bool)

(declare-datatypes ((tuple2!13906 0))(
  ( (tuple2!13907 (_1!7386 Unit!9949) (_2!7386 BitStream!5668)) )
))
(declare-fun moveByteIndex!0 (BitStream!5668 (_ BitVec 32)) tuple2!13906)

(assert (=> d!51796 (= (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7386 (moveByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun bs!12677 () Bool)

(assert (= bs!12677 d!51796))

(declare-fun m!242851 () Bool)

(assert (=> bs!12677 m!242851))

(assert (=> b!156075 d!51796))

(declare-fun d!51798 () Bool)

(declare-datatypes ((tuple2!13908 0))(
  ( (tuple2!13909 (_1!7387 (_ BitVec 8)) (_2!7387 BitStream!5668)) )
))
(declare-fun lt!243490 () tuple2!13908)

(declare-fun readByte!0 (BitStream!5668) tuple2!13908)

(assert (=> d!51798 (= lt!243490 (readByte!0 bs!65))))

(assert (=> d!51798 (= (readBytePure!0 bs!65) (tuple2!13897 (_2!7387 lt!243490) (_1!7387 lt!243490)))))

(declare-fun bs!12678 () Bool)

(assert (= bs!12678 d!51798))

(declare-fun m!242853 () Bool)

(assert (=> bs!12678 m!242853))

(assert (=> b!156075 d!51798))

(declare-fun d!51800 () Bool)

(declare-fun lt!243491 () tuple3!630)

(assert (=> d!51800 (= lt!243491 (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236))))

(assert (=> d!51800 (= (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236) (tuple2!13895 (_2!7385 lt!243491) (_3!432 lt!243491)))))

(declare-fun bs!12679 () Bool)

(assert (= bs!12679 d!51800))

(declare-fun m!242855 () Bool)

(assert (=> bs!12679 m!242855))

(assert (=> b!156075 d!51800))

(declare-fun d!51802 () Bool)

(assert (=> d!51802 (= (array_inv!2994 arr!153) (bvsge (size!3205 arr!153) #b00000000000000000000000000000000))))

(assert (=> start!30742 d!51802))

(declare-fun d!51804 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!51804 (= (inv!12 bs!65) (invariant!0 (currentBit!6794 bs!65) (currentByte!6799 bs!65) (size!3205 (buf!3708 bs!65))))))

(declare-fun bs!12680 () Bool)

(assert (= bs!12680 d!51804))

(declare-fun m!242857 () Bool)

(assert (=> bs!12680 m!242857))

(assert (=> start!30742 d!51804))

(push 1)

(assert (not d!51800))

(assert (not d!51804))

(assert (not d!51792))

(assert (not d!51794))

(assert (not d!51798))

(assert (not d!51796))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!51838 () Bool)

(declare-fun e!105392 () Bool)

(assert (=> d!51838 e!105392))

(declare-fun res!130493 () Bool)

(assert (=> d!51838 (=> (not res!130493) (not e!105392))))

(declare-fun moveByteIndexPrecond!0 (BitStream!5668 (_ BitVec 32)) Bool)

(assert (=> d!51838 (= res!130493 (moveByteIndexPrecond!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun Unit!9955 () Unit!9949)

(assert (=> d!51838 (= (moveByteIndex!0 bs!65 #b00000000000000000000000000000001) (tuple2!13907 Unit!9955 (BitStream!5669 (buf!3708 bs!65) (bvadd (currentByte!6799 bs!65) #b00000000000000000000000000000001) (currentBit!6794 bs!65))))))

(declare-fun b!156097 () Bool)

(assert (=> b!156097 (= e!105392 (and (or (not (= (bvand (currentByte!6799 bs!65) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!6799 bs!65) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!6799 bs!65) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!6799 bs!65) #b00000000000000000000000000000001) (bvadd (currentByte!6799 bs!65) #b00000000000000000000000000000001))))))

(assert (= (and d!51838 res!130493) b!156097))

(declare-fun m!242883 () Bool)

(assert (=> d!51838 m!242883))

(assert (=> d!51796 d!51838))

(declare-fun lt!243594 () (_ BitVec 32))

(declare-fun lt!243581 () tuple3!630)

(declare-fun bm!2352 () Bool)

(declare-fun call!2355 () Bool)

(declare-fun c!8307 () Bool)

(declare-fun arrayRangesEq!419 (array!7140 array!7140 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!2352 (= call!2355 (arrayRangesEq!419 arr!153 (ite c!8307 (_3!432 lt!243581) arr!153) (ite c!8307 lt!243594 #b00000000000000000000000000000000) (ite c!8307 from!240 (size!3205 arr!153))))))

(declare-fun b!156111 () Bool)

(declare-fun res!130503 () Bool)

(declare-fun e!105403 () Bool)

(assert (=> b!156111 (=> (not res!130503) (not e!105403))))

(declare-fun lt!243589 () tuple3!630)

(assert (=> b!156111 (= res!130503 (and (= (buf!3708 bs!65) (buf!3708 (_2!7385 lt!243589))) (= (size!3205 arr!153) (size!3205 (_3!432 lt!243589)))))))

(declare-fun d!51840 () Bool)

(declare-fun e!105402 () Bool)

(assert (=> d!51840 e!105402))

(declare-fun res!130505 () Bool)

(assert (=> d!51840 (=> res!130505 e!105402)))

(assert (=> d!51840 (= res!130505 (bvsge from!240 to!236))))

(declare-fun lt!243611 () Bool)

(assert (=> d!51840 (= lt!243611 e!105403)))

(declare-fun res!130504 () Bool)

(assert (=> d!51840 (=> (not res!130504) (not e!105403))))

(declare-fun lt!243598 () (_ BitVec 64))

(declare-fun lt!243604 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!51840 (= res!130504 (= (bvadd lt!243598 lt!243604) (bitIndex!0 (size!3205 (buf!3708 (_2!7385 lt!243589))) (currentByte!6799 (_2!7385 lt!243589)) (currentBit!6794 (_2!7385 lt!243589)))))))

(assert (=> d!51840 (or (not (= (bvand lt!243598 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!243604 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!243598 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!243598 lt!243604) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!243602 () (_ BitVec 64))

(assert (=> d!51840 (= lt!243604 (bvmul lt!243602 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!51840 (or (= lt!243602 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!243602 #b0000000000000000000000000000000000000000000000000000000000001000) lt!243602)))))

(assert (=> d!51840 (= lt!243602 ((_ sign_extend 32) (bvsub to!236 from!240)))))

(assert (=> d!51840 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand from!240 #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000)))))

(assert (=> d!51840 (= lt!243598 (bitIndex!0 (size!3205 (buf!3708 bs!65)) (currentByte!6799 bs!65) (currentBit!6794 bs!65)))))

(declare-fun e!105404 () tuple3!630)

(assert (=> d!51840 (= lt!243589 e!105404)))

(assert (=> d!51840 (= c!8307 (bvslt from!240 to!236))))

(assert (=> d!51840 (and (bvsle #b00000000000000000000000000000000 from!240) (bvsle from!240 to!236) (bvsle to!236 (size!3205 arr!153)))))

(assert (=> d!51840 (= (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236) lt!243589)))

(declare-fun lt!243599 () Unit!9949)

(declare-fun b!156112 () Bool)

(assert (=> b!156112 (= e!105404 (tuple3!631 lt!243599 bs!65 arr!153))))

(declare-fun call!2357 () (_ BitVec 64))

(assert (=> b!156112 (= call!2357 call!2357)))

(declare-fun lt!243583 () Unit!9949)

(declare-fun Unit!9956 () Unit!9949)

(assert (=> b!156112 (= lt!243583 Unit!9956)))

(declare-fun lt!243584 () Unit!9949)

(declare-fun arrayRangesEqReflexiveLemma!30 (array!7140) Unit!9949)

(assert (=> b!156112 (= lt!243584 (arrayRangesEqReflexiveLemma!30 arr!153))))

(assert (=> b!156112 call!2355))

(declare-fun lt!243591 () Unit!9949)

(assert (=> b!156112 (= lt!243591 lt!243584)))

(declare-fun lt!243597 () array!7140)

(assert (=> b!156112 (= lt!243597 arr!153)))

(declare-fun lt!243610 () array!7140)

(assert (=> b!156112 (= lt!243610 arr!153)))

(declare-fun lt!243603 () (_ BitVec 32))

(assert (=> b!156112 (= lt!243603 #b00000000000000000000000000000000)))

(declare-fun lt!243609 () (_ BitVec 32))

(assert (=> b!156112 (= lt!243609 (size!3205 arr!153))))

(declare-fun lt!243585 () (_ BitVec 32))

(assert (=> b!156112 (= lt!243585 #b00000000000000000000000000000000)))

(declare-fun lt!243588 () (_ BitVec 32))

(assert (=> b!156112 (= lt!243588 from!240)))

(declare-fun arrayRangesEqSlicedLemma!30 (array!7140 array!7140 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9949)

(assert (=> b!156112 (= lt!243599 (arrayRangesEqSlicedLemma!30 lt!243597 lt!243610 lt!243603 lt!243609 lt!243585 lt!243588))))

(declare-fun call!2356 () Bool)

(assert (=> b!156112 call!2356))

(declare-fun bm!2353 () Bool)

(assert (=> bm!2353 (= call!2357 (bitIndex!0 (size!3205 (buf!3708 bs!65)) (currentByte!6799 bs!65) (currentBit!6794 bs!65)))))

(declare-fun bm!2354 () Bool)

(declare-fun lt!243582 () tuple2!13908)

(assert (=> bm!2354 (= call!2356 (arrayRangesEq!419 (ite c!8307 arr!153 lt!243597) (ite c!8307 (array!7141 (store (arr!4049 arr!153) from!240 (_1!7387 lt!243582)) (size!3205 arr!153)) lt!243610) (ite c!8307 #b00000000000000000000000000000000 lt!243585) (ite c!8307 from!240 lt!243588)))))

(declare-fun b!156113 () Bool)

(assert (=> b!156113 (= e!105402 (= (select (arr!4049 (_3!432 lt!243589)) from!240) (_2!7380 (readBytePure!0 bs!65))))))

(assert (=> b!156113 (and (bvsge from!240 #b00000000000000000000000000000000) (bvslt from!240 (size!3205 (_3!432 lt!243589))))))

(declare-fun b!156114 () Bool)

(assert (=> b!156114 (= e!105403 (arrayRangesEq!419 arr!153 (_3!432 lt!243589) #b00000000000000000000000000000000 from!240))))

(declare-fun b!156115 () Bool)

(declare-fun lt!243606 () Unit!9949)

(assert (=> b!156115 (= e!105404 (tuple3!631 lt!243606 (_2!7385 lt!243581) (_3!432 lt!243581)))))

(assert (=> b!156115 (= lt!243582 (readByte!0 bs!65))))

(declare-fun lt!243608 () array!7140)

(assert (=> b!156115 (= lt!243608 (array!7141 (store (arr!4049 arr!153) from!240 (_1!7387 lt!243582)) (size!3205 arr!153)))))

(declare-fun lt!243586 () (_ BitVec 64))

(assert (=> b!156115 (= lt!243586 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!243579 () (_ BitVec 32))

(assert (=> b!156115 (= lt!243579 (bvsub to!236 from!240))))

(declare-fun lt!243607 () Unit!9949)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5668 BitStream!5668 (_ BitVec 64) (_ BitVec 32)) Unit!9949)

(assert (=> b!156115 (= lt!243607 (validateOffsetBytesFromBitIndexLemma!0 bs!65 (_2!7387 lt!243582) lt!243586 lt!243579))))

(assert (=> b!156115 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3205 (buf!3708 (_2!7387 lt!243582)))) ((_ sign_extend 32) (currentByte!6799 (_2!7387 lt!243582))) ((_ sign_extend 32) (currentBit!6794 (_2!7387 lt!243582))) (bvsub lt!243579 ((_ extract 31 0) (bvsdiv (bvadd lt!243586 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!243587 () Unit!9949)

(assert (=> b!156115 (= lt!243587 lt!243607)))

(assert (=> b!156115 (= lt!243581 (readByteArrayLoop!0 (_2!7387 lt!243582) lt!243608 (bvadd from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> b!156115 (= (bitIndex!0 (size!3205 (buf!3708 (_2!7387 lt!243582))) (currentByte!6799 (_2!7387 lt!243582)) (currentBit!6794 (_2!7387 lt!243582))) (bvadd call!2357 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!243580 () Unit!9949)

(declare-fun Unit!9957 () Unit!9949)

(assert (=> b!156115 (= lt!243580 Unit!9957)))

(assert (=> b!156115 (= (bvadd (bitIndex!0 (size!3205 (buf!3708 (_2!7387 lt!243582))) (currentByte!6799 (_2!7387 lt!243582)) (currentBit!6794 (_2!7387 lt!243582))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3205 (buf!3708 (_2!7385 lt!243581))) (currentByte!6799 (_2!7385 lt!243581)) (currentBit!6794 (_2!7385 lt!243581))))))

(declare-fun lt!243592 () Unit!9949)

(declare-fun Unit!9958 () Unit!9949)

(assert (=> b!156115 (= lt!243592 Unit!9958)))

(assert (=> b!156115 (= (bvadd call!2357 (bvmul ((_ sign_extend 32) (bvsub to!236 from!240)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3205 (buf!3708 (_2!7385 lt!243581))) (currentByte!6799 (_2!7385 lt!243581)) (currentBit!6794 (_2!7385 lt!243581))))))

(declare-fun lt!243578 () Unit!9949)

(declare-fun Unit!9959 () Unit!9949)

(assert (=> b!156115 (= lt!243578 Unit!9959)))

(assert (=> b!156115 (and (= (buf!3708 bs!65) (buf!3708 (_2!7385 lt!243581))) (= (size!3205 arr!153) (size!3205 (_3!432 lt!243581))))))

(declare-fun lt!243605 () Unit!9949)

(declare-fun Unit!9960 () Unit!9949)

(assert (=> b!156115 (= lt!243605 Unit!9960)))

(declare-fun lt!243600 () Unit!9949)

(declare-fun arrayUpdatedAtPrefixLemma!30 (array!7140 (_ BitVec 32) (_ BitVec 8)) Unit!9949)

(assert (=> b!156115 (= lt!243600 (arrayUpdatedAtPrefixLemma!30 arr!153 from!240 (_1!7387 lt!243582)))))

(assert (=> b!156115 call!2356))

(declare-fun lt!243596 () Unit!9949)

(assert (=> b!156115 (= lt!243596 lt!243600)))

(assert (=> b!156115 (= lt!243594 #b00000000000000000000000000000000)))

(declare-fun lt!243601 () Unit!9949)

(declare-fun arrayRangesEqTransitive!95 (array!7140 array!7140 array!7140 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9949)

(assert (=> b!156115 (= lt!243601 (arrayRangesEqTransitive!95 arr!153 lt!243608 (_3!432 lt!243581) lt!243594 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!156115 call!2355))

(declare-fun lt!243590 () Unit!9949)

(assert (=> b!156115 (= lt!243590 lt!243601)))

(assert (=> b!156115 (arrayRangesEq!419 arr!153 (_3!432 lt!243581) #b00000000000000000000000000000000 from!240)))

(declare-fun lt!243595 () Unit!9949)

(declare-fun Unit!9961 () Unit!9949)

(assert (=> b!156115 (= lt!243595 Unit!9961)))

(declare-fun lt!243613 () Unit!9949)

(declare-fun arrayRangesEqImpliesEq!39 (array!7140 array!7140 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9949)

(assert (=> b!156115 (= lt!243613 (arrayRangesEqImpliesEq!39 lt!243608 (_3!432 lt!243581) #b00000000000000000000000000000000 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!156115 (= (select (store (arr!4049 arr!153) from!240 (_1!7387 lt!243582)) from!240) (select (arr!4049 (_3!432 lt!243581)) from!240))))

(declare-fun lt!243612 () Unit!9949)

(assert (=> b!156115 (= lt!243612 lt!243613)))

(declare-fun lt!243593 () Bool)

(assert (=> b!156115 (= lt!243593 (= (select (arr!4049 (_3!432 lt!243581)) from!240) (_1!7387 lt!243582)))))

(declare-fun Unit!9962 () Unit!9949)

(assert (=> b!156115 (= lt!243606 Unit!9962)))

(assert (=> b!156115 lt!243593))

(assert (= (and d!51840 c!8307) b!156115))

(assert (= (and d!51840 (not c!8307)) b!156112))

(assert (= (or b!156115 b!156112) bm!2352))

(assert (= (or b!156115 b!156112) bm!2354))

(assert (= (or b!156115 b!156112) bm!2353))

(assert (= (and d!51840 res!130504) b!156111))

(assert (= (and b!156111 res!130503) b!156114))

(assert (= (and d!51840 (not res!130505)) b!156113))

(declare-fun m!242887 () Bool)

(assert (=> bm!2354 m!242887))

(declare-fun m!242889 () Bool)

(assert (=> bm!2354 m!242889))

(declare-fun m!242891 () Bool)

(assert (=> bm!2353 m!242891))

(declare-fun m!242893 () Bool)

(assert (=> b!156115 m!242893))

(declare-fun m!242895 () Bool)

(assert (=> b!156115 m!242895))

(declare-fun m!242897 () Bool)

(assert (=> b!156115 m!242897))

(declare-fun m!242899 () Bool)

(assert (=> b!156115 m!242899))

(declare-fun m!242901 () Bool)

(assert (=> b!156115 m!242901))

(declare-fun m!242903 () Bool)

(assert (=> b!156115 m!242903))

(assert (=> b!156115 m!242853))

(assert (=> b!156115 m!242887))

(declare-fun m!242905 () Bool)

(assert (=> b!156115 m!242905))

(declare-fun m!242907 () Bool)

(assert (=> b!156115 m!242907))

(declare-fun m!242909 () Bool)

(assert (=> b!156115 m!242909))

(declare-fun m!242911 () Bool)

(assert (=> b!156115 m!242911))

(declare-fun m!242913 () Bool)

(assert (=> b!156115 m!242913))

(declare-fun m!242915 () Bool)

(assert (=> d!51840 m!242915))

(assert (=> d!51840 m!242891))

(declare-fun m!242917 () Bool)

(assert (=> b!156114 m!242917))

(declare-fun m!242919 () Bool)

(assert (=> b!156112 m!242919))

(declare-fun m!242921 () Bool)

(assert (=> b!156112 m!242921))

(declare-fun m!242923 () Bool)

(assert (=> b!156113 m!242923))

(assert (=> b!156113 m!242799))

(declare-fun m!242925 () Bool)

(assert (=> bm!2352 m!242925))

(assert (=> d!51800 d!51840))

(declare-fun d!51850 () Bool)

(declare-fun lt!243628 () (_ BitVec 8))

(declare-fun lt!243633 () (_ BitVec 8))

(assert (=> d!51850 (= lt!243628 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4049 (buf!3708 bs!65)) (currentByte!6799 bs!65))) ((_ sign_extend 24) lt!243633))))))

(assert (=> d!51850 (= lt!243633 ((_ extract 7 0) (currentBit!6794 bs!65)))))

(declare-fun e!105409 () Bool)

(assert (=> d!51850 e!105409))

(declare-fun res!130511 () Bool)

(assert (=> d!51850 (=> (not res!130511) (not e!105409))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!51850 (= res!130511 (validate_offset_bits!1 ((_ sign_extend 32) (size!3205 (buf!3708 bs!65))) ((_ sign_extend 32) (currentByte!6799 bs!65)) ((_ sign_extend 32) (currentBit!6794 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!13918 0))(
  ( (tuple2!13919 (_1!7394 Unit!9949) (_2!7394 (_ BitVec 8))) )
))
(declare-fun Unit!9963 () Unit!9949)

(declare-fun Unit!9964 () Unit!9949)

(assert (=> d!51850 (= (readByte!0 bs!65) (tuple2!13909 (_2!7394 (ite (bvsgt ((_ sign_extend 24) lt!243633) #b00000000000000000000000000000000) (tuple2!13919 Unit!9963 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!243628) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4049 (buf!3708 bs!65)) (bvadd (currentByte!6799 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!243633)))))))) (tuple2!13919 Unit!9964 lt!243628))) (BitStream!5669 (buf!3708 bs!65) (bvadd (currentByte!6799 bs!65) #b00000000000000000000000000000001) (currentBit!6794 bs!65))))))

(declare-fun b!156120 () Bool)

(declare-fun e!105410 () Bool)

(assert (=> b!156120 (= e!105409 e!105410)))

(declare-fun res!130512 () Bool)

(assert (=> b!156120 (=> (not res!130512) (not e!105410))))

(declare-fun lt!243634 () tuple2!13908)

(assert (=> b!156120 (= res!130512 (= (buf!3708 (_2!7387 lt!243634)) (buf!3708 bs!65)))))

(declare-fun lt!243632 () (_ BitVec 8))

(declare-fun lt!243629 () (_ BitVec 8))

(declare-fun Unit!9965 () Unit!9949)

(declare-fun Unit!9966 () Unit!9949)

(assert (=> b!156120 (= lt!243634 (tuple2!13909 (_2!7394 (ite (bvsgt ((_ sign_extend 24) lt!243629) #b00000000000000000000000000000000) (tuple2!13919 Unit!9965 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!243632) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4049 (buf!3708 bs!65)) (bvadd (currentByte!6799 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!243629)))))))) (tuple2!13919 Unit!9966 lt!243632))) (BitStream!5669 (buf!3708 bs!65) (bvadd (currentByte!6799 bs!65) #b00000000000000000000000000000001) (currentBit!6794 bs!65))))))

(assert (=> b!156120 (= lt!243632 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4049 (buf!3708 bs!65)) (currentByte!6799 bs!65))) ((_ sign_extend 24) lt!243629))))))

(assert (=> b!156120 (= lt!243629 ((_ extract 7 0) (currentBit!6794 bs!65)))))

(declare-fun lt!243630 () (_ BitVec 64))

(declare-fun lt!243631 () (_ BitVec 64))

(declare-fun b!156121 () Bool)

(assert (=> b!156121 (= e!105410 (= (bitIndex!0 (size!3205 (buf!3708 (_2!7387 lt!243634))) (currentByte!6799 (_2!7387 lt!243634)) (currentBit!6794 (_2!7387 lt!243634))) (bvadd lt!243631 lt!243630)))))

(assert (=> b!156121 (or (not (= (bvand lt!243631 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!243630 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!243631 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!243631 lt!243630) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!156121 (= lt!243630 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!156121 (= lt!243631 (bitIndex!0 (size!3205 (buf!3708 bs!65)) (currentByte!6799 bs!65) (currentBit!6794 bs!65)))))

(assert (= (and d!51850 res!130511) b!156120))

(assert (= (and b!156120 res!130512) b!156121))

(declare-fun m!242927 () Bool)

(assert (=> d!51850 m!242927))

(declare-fun m!242929 () Bool)

(assert (=> d!51850 m!242929))

(declare-fun m!242931 () Bool)

(assert (=> d!51850 m!242931))

(assert (=> b!156120 m!242931))

(assert (=> b!156120 m!242927))

(declare-fun m!242933 () Bool)

(assert (=> b!156121 m!242933))

(assert (=> b!156121 m!242891))

(assert (=> d!51798 d!51850))

(declare-fun d!51852 () Bool)

(assert (=> d!51852 (= (remainingBits!0 ((_ sign_extend 32) (size!3205 (buf!3708 bs!65))) ((_ sign_extend 32) (currentByte!6799 bs!65)) ((_ sign_extend 32) (currentBit!6794 bs!65))) (bvsub (bvmul ((_ sign_extend 32) (size!3205 (buf!3708 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6799 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6794 bs!65)))))))

(assert (=> d!51792 d!51852))

(declare-fun d!51854 () Bool)

(assert (=> d!51854 (= (invariant!0 (currentBit!6794 bs!65) (currentByte!6799 bs!65) (size!3205 (buf!3708 bs!65))) (and (bvsge (currentBit!6794 bs!65) #b00000000000000000000000000000000) (bvslt (currentBit!6794 bs!65) #b00000000000000000000000000001000) (bvsge (currentByte!6799 bs!65) #b00000000000000000000000000000000) (or (bvslt (currentByte!6799 bs!65) (size!3205 (buf!3708 bs!65))) (and (= (currentBit!6794 bs!65) #b00000000000000000000000000000000) (= (currentByte!6799 bs!65) (size!3205 (buf!3708 bs!65)))))))))

(assert (=> d!51804 d!51854))

(declare-fun bm!2355 () Bool)

(declare-fun lt!243638 () tuple3!630)

(declare-fun call!2358 () Bool)

(declare-fun c!8308 () Bool)

(declare-fun lt!243651 () (_ BitVec 32))

(assert (=> bm!2355 (= call!2358 (arrayRangesEq!419 (array!7141 (store (arr!4049 arr!153) from!240 (_2!7380 (readBytePure!0 bs!65))) (size!3205 arr!153)) (ite c!8308 (_3!432 lt!243638) (array!7141 (store (arr!4049 arr!153) from!240 (_2!7380 (readBytePure!0 bs!65))) (size!3205 arr!153))) (ite c!8308 lt!243651 #b00000000000000000000000000000000) (ite c!8308 (bvadd #b00000000000000000000000000000001 from!240) (size!3205 (array!7141 (store (arr!4049 arr!153) from!240 (_2!7380 (readBytePure!0 bs!65))) (size!3205 arr!153))))))))

(declare-fun b!156122 () Bool)

(declare-fun res!130513 () Bool)

(declare-fun e!105412 () Bool)

(assert (=> b!156122 (=> (not res!130513) (not e!105412))))

(declare-fun lt!243646 () tuple3!630)

(assert (=> b!156122 (= res!130513 (and (= (buf!3708 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (buf!3708 (_2!7385 lt!243646))) (= (size!3205 (array!7141 (store (arr!4049 arr!153) from!240 (_2!7380 (readBytePure!0 bs!65))) (size!3205 arr!153))) (size!3205 (_3!432 lt!243646)))))))

(declare-fun d!51856 () Bool)

(declare-fun e!105411 () Bool)

(assert (=> d!51856 e!105411))

(declare-fun res!130515 () Bool)

(assert (=> d!51856 (=> res!130515 e!105411)))

(assert (=> d!51856 (= res!130515 (bvsge (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun lt!243668 () Bool)

(assert (=> d!51856 (= lt!243668 e!105412)))

(declare-fun res!130514 () Bool)

(assert (=> d!51856 (=> (not res!130514) (not e!105412))))

(declare-fun lt!243655 () (_ BitVec 64))

(declare-fun lt!243661 () (_ BitVec 64))

(assert (=> d!51856 (= res!130514 (= (bvadd lt!243655 lt!243661) (bitIndex!0 (size!3205 (buf!3708 (_2!7385 lt!243646))) (currentByte!6799 (_2!7385 lt!243646)) (currentBit!6794 (_2!7385 lt!243646)))))))

(assert (=> d!51856 (or (not (= (bvand lt!243655 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!243661 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!243655 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!243655 lt!243661) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!243659 () (_ BitVec 64))

(assert (=> d!51856 (= lt!243661 (bvmul lt!243659 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!51856 (or (= lt!243659 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!243659 #b0000000000000000000000000000000000000000000000000000000000001000) lt!243659)))))

(assert (=> d!51856 (= lt!243659 ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))))))

(assert (=> d!51856 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!240) #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b10000000000000000000000000000000)))))

(assert (=> d!51856 (= lt!243655 (bitIndex!0 (size!3205 (buf!3708 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) (currentByte!6799 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (currentBit!6794 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))))

(declare-fun e!105413 () tuple3!630)

(assert (=> d!51856 (= lt!243646 e!105413)))

(assert (=> d!51856 (= c!8308 (bvslt (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!51856 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvsle (bvadd #b00000000000000000000000000000001 from!240) to!236) (bvsle to!236 (size!3205 (array!7141 (store (arr!4049 arr!153) from!240 (_2!7380 (readBytePure!0 bs!65))) (size!3205 arr!153)))))))

(assert (=> d!51856 (= (readByteArrayLoop!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7141 (store (arr!4049 arr!153) from!240 (_2!7380 (readBytePure!0 bs!65))) (size!3205 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236) lt!243646)))

(declare-fun b!156123 () Bool)

(declare-fun lt!243656 () Unit!9949)

(assert (=> b!156123 (= e!105413 (tuple3!631 lt!243656 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7141 (store (arr!4049 arr!153) from!240 (_2!7380 (readBytePure!0 bs!65))) (size!3205 arr!153))))))

(declare-fun call!2360 () (_ BitVec 64))

(assert (=> b!156123 (= call!2360 call!2360)))

(declare-fun lt!243640 () Unit!9949)

(declare-fun Unit!9967 () Unit!9949)

(assert (=> b!156123 (= lt!243640 Unit!9967)))

(declare-fun lt!243641 () Unit!9949)

(assert (=> b!156123 (= lt!243641 (arrayRangesEqReflexiveLemma!30 (array!7141 (store (arr!4049 arr!153) from!240 (_2!7380 (readBytePure!0 bs!65))) (size!3205 arr!153))))))

(assert (=> b!156123 call!2358))

(declare-fun lt!243648 () Unit!9949)

(assert (=> b!156123 (= lt!243648 lt!243641)))

(declare-fun lt!243654 () array!7140)

(assert (=> b!156123 (= lt!243654 (array!7141 (store (arr!4049 arr!153) from!240 (_2!7380 (readBytePure!0 bs!65))) (size!3205 arr!153)))))

(declare-fun lt!243667 () array!7140)

(assert (=> b!156123 (= lt!243667 (array!7141 (store (arr!4049 arr!153) from!240 (_2!7380 (readBytePure!0 bs!65))) (size!3205 arr!153)))))

(declare-fun lt!243660 () (_ BitVec 32))

(assert (=> b!156123 (= lt!243660 #b00000000000000000000000000000000)))

(declare-fun lt!243666 () (_ BitVec 32))

(assert (=> b!156123 (= lt!243666 (size!3205 (array!7141 (store (arr!4049 arr!153) from!240 (_2!7380 (readBytePure!0 bs!65))) (size!3205 arr!153))))))

(declare-fun lt!243642 () (_ BitVec 32))

(assert (=> b!156123 (= lt!243642 #b00000000000000000000000000000000)))

(declare-fun lt!243645 () (_ BitVec 32))

(assert (=> b!156123 (= lt!243645 (bvadd #b00000000000000000000000000000001 from!240))))

(assert (=> b!156123 (= lt!243656 (arrayRangesEqSlicedLemma!30 lt!243654 lt!243667 lt!243660 lt!243666 lt!243642 lt!243645))))

(declare-fun call!2359 () Bool)

(assert (=> b!156123 call!2359))

(declare-fun bm!2356 () Bool)

(assert (=> bm!2356 (= call!2360 (bitIndex!0 (size!3205 (buf!3708 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) (currentByte!6799 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (currentBit!6794 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))))

(declare-fun bm!2357 () Bool)

(declare-fun lt!243639 () tuple2!13908)

(assert (=> bm!2357 (= call!2359 (arrayRangesEq!419 (ite c!8308 (array!7141 (store (arr!4049 arr!153) from!240 (_2!7380 (readBytePure!0 bs!65))) (size!3205 arr!153)) lt!243654) (ite c!8308 (array!7141 (store (arr!4049 (array!7141 (store (arr!4049 arr!153) from!240 (_2!7380 (readBytePure!0 bs!65))) (size!3205 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7387 lt!243639)) (size!3205 (array!7141 (store (arr!4049 arr!153) from!240 (_2!7380 (readBytePure!0 bs!65))) (size!3205 arr!153)))) lt!243667) (ite c!8308 #b00000000000000000000000000000000 lt!243642) (ite c!8308 (bvadd #b00000000000000000000000000000001 from!240) lt!243645)))))

(declare-fun b!156124 () Bool)

(assert (=> b!156124 (= e!105411 (= (select (arr!4049 (_3!432 lt!243646)) (bvadd #b00000000000000000000000000000001 from!240)) (_2!7380 (readBytePure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)))))))

(assert (=> b!156124 (and (bvsge (bvadd #b00000000000000000000000000000001 from!240) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!240) (size!3205 (_3!432 lt!243646))))))

(declare-fun b!156125 () Bool)

(assert (=> b!156125 (= e!105412 (arrayRangesEq!419 (array!7141 (store (arr!4049 arr!153) from!240 (_2!7380 (readBytePure!0 bs!65))) (size!3205 arr!153)) (_3!432 lt!243646) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun b!156126 () Bool)

(declare-fun lt!243663 () Unit!9949)

(assert (=> b!156126 (= e!105413 (tuple3!631 lt!243663 (_2!7385 lt!243638) (_3!432 lt!243638)))))

(assert (=> b!156126 (= lt!243639 (readByte!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun lt!243665 () array!7140)

(assert (=> b!156126 (= lt!243665 (array!7141 (store (arr!4049 (array!7141 (store (arr!4049 arr!153) from!240 (_2!7380 (readBytePure!0 bs!65))) (size!3205 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7387 lt!243639)) (size!3205 (array!7141 (store (arr!4049 arr!153) from!240 (_2!7380 (readBytePure!0 bs!65))) (size!3205 arr!153)))))))

(declare-fun lt!243643 () (_ BitVec 64))

(assert (=> b!156126 (= lt!243643 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!243636 () (_ BitVec 32))

(assert (=> b!156126 (= lt!243636 (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!243664 () Unit!9949)

(assert (=> b!156126 (= lt!243664 (validateOffsetBytesFromBitIndexLemma!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7387 lt!243639) lt!243643 lt!243636))))

(assert (=> b!156126 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3205 (buf!3708 (_2!7387 lt!243639)))) ((_ sign_extend 32) (currentByte!6799 (_2!7387 lt!243639))) ((_ sign_extend 32) (currentBit!6794 (_2!7387 lt!243639))) (bvsub lt!243636 ((_ extract 31 0) (bvsdiv (bvadd lt!243643 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!243644 () Unit!9949)

(assert (=> b!156126 (= lt!243644 lt!243664)))

(assert (=> b!156126 (= lt!243638 (readByteArrayLoop!0 (_2!7387 lt!243639) lt!243665 (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> b!156126 (= (bitIndex!0 (size!3205 (buf!3708 (_2!7387 lt!243639))) (currentByte!6799 (_2!7387 lt!243639)) (currentBit!6794 (_2!7387 lt!243639))) (bvadd call!2360 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!243637 () Unit!9949)

(declare-fun Unit!9968 () Unit!9949)

(assert (=> b!156126 (= lt!243637 Unit!9968)))

(assert (=> b!156126 (= (bvadd (bitIndex!0 (size!3205 (buf!3708 (_2!7387 lt!243639))) (currentByte!6799 (_2!7387 lt!243639)) (currentBit!6794 (_2!7387 lt!243639))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3205 (buf!3708 (_2!7385 lt!243638))) (currentByte!6799 (_2!7385 lt!243638)) (currentBit!6794 (_2!7385 lt!243638))))))

(declare-fun lt!243649 () Unit!9949)

(declare-fun Unit!9969 () Unit!9949)

(assert (=> b!156126 (= lt!243649 Unit!9969)))

(assert (=> b!156126 (= (bvadd call!2360 (bvmul ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3205 (buf!3708 (_2!7385 lt!243638))) (currentByte!6799 (_2!7385 lt!243638)) (currentBit!6794 (_2!7385 lt!243638))))))

(declare-fun lt!243635 () Unit!9949)

(declare-fun Unit!9970 () Unit!9949)

(assert (=> b!156126 (= lt!243635 Unit!9970)))

(assert (=> b!156126 (and (= (buf!3708 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (buf!3708 (_2!7385 lt!243638))) (= (size!3205 (array!7141 (store (arr!4049 arr!153) from!240 (_2!7380 (readBytePure!0 bs!65))) (size!3205 arr!153))) (size!3205 (_3!432 lt!243638))))))

(declare-fun lt!243662 () Unit!9949)

(declare-fun Unit!9971 () Unit!9949)

(assert (=> b!156126 (= lt!243662 Unit!9971)))

(declare-fun lt!243657 () Unit!9949)

(assert (=> b!156126 (= lt!243657 (arrayUpdatedAtPrefixLemma!30 (array!7141 (store (arr!4049 arr!153) from!240 (_2!7380 (readBytePure!0 bs!65))) (size!3205 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) (_1!7387 lt!243639)))))

(assert (=> b!156126 call!2359))

(declare-fun lt!243653 () Unit!9949)

(assert (=> b!156126 (= lt!243653 lt!243657)))

(assert (=> b!156126 (= lt!243651 #b00000000000000000000000000000000)))

(declare-fun lt!243658 () Unit!9949)

(assert (=> b!156126 (= lt!243658 (arrayRangesEqTransitive!95 (array!7141 (store (arr!4049 arr!153) from!240 (_2!7380 (readBytePure!0 bs!65))) (size!3205 arr!153)) lt!243665 (_3!432 lt!243638) lt!243651 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!156126 call!2358))

(declare-fun lt!243647 () Unit!9949)

(assert (=> b!156126 (= lt!243647 lt!243658)))

(assert (=> b!156126 (arrayRangesEq!419 (array!7141 (store (arr!4049 arr!153) from!240 (_2!7380 (readBytePure!0 bs!65))) (size!3205 arr!153)) (_3!432 lt!243638) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240))))

(declare-fun lt!243652 () Unit!9949)

(declare-fun Unit!9972 () Unit!9949)

(assert (=> b!156126 (= lt!243652 Unit!9972)))

(declare-fun lt!243670 () Unit!9949)

(assert (=> b!156126 (= lt!243670 (arrayRangesEqImpliesEq!39 lt!243665 (_3!432 lt!243638) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!156126 (= (select (store (arr!4049 (array!7141 (store (arr!4049 arr!153) from!240 (_2!7380 (readBytePure!0 bs!65))) (size!3205 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7387 lt!243639)) (bvadd #b00000000000000000000000000000001 from!240)) (select (arr!4049 (_3!432 lt!243638)) (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!243669 () Unit!9949)

(assert (=> b!156126 (= lt!243669 lt!243670)))

(declare-fun lt!243650 () Bool)

(assert (=> b!156126 (= lt!243650 (= (select (arr!4049 (_3!432 lt!243638)) (bvadd #b00000000000000000000000000000001 from!240)) (_1!7387 lt!243639)))))

(declare-fun Unit!9973 () Unit!9949)

(assert (=> b!156126 (= lt!243663 Unit!9973)))

(assert (=> b!156126 lt!243650))

(assert (= (and d!51856 c!8308) b!156126))

(assert (= (and d!51856 (not c!8308)) b!156123))

(assert (= (or b!156126 b!156123) bm!2355))

(assert (= (or b!156126 b!156123) bm!2357))

(assert (= (or b!156126 b!156123) bm!2356))

(assert (= (and d!51856 res!130514) b!156122))

(assert (= (and b!156122 res!130513) b!156125))

(assert (= (and d!51856 (not res!130515)) b!156124))

(declare-fun m!242935 () Bool)

(assert (=> bm!2357 m!242935))

(declare-fun m!242937 () Bool)

(assert (=> bm!2357 m!242937))

(declare-fun m!242939 () Bool)

(assert (=> bm!2356 m!242939))

(declare-fun m!242941 () Bool)

(assert (=> b!156126 m!242941))

(declare-fun m!242943 () Bool)

(assert (=> b!156126 m!242943))

(declare-fun m!242945 () Bool)

(assert (=> b!156126 m!242945))

(declare-fun m!242947 () Bool)

(assert (=> b!156126 m!242947))

(declare-fun m!242949 () Bool)

(assert (=> b!156126 m!242949))

(declare-fun m!242951 () Bool)

(assert (=> b!156126 m!242951))

(assert (=> b!156126 m!242801))

(declare-fun m!242953 () Bool)

(assert (=> b!156126 m!242953))

(assert (=> b!156126 m!242935))

(declare-fun m!242955 () Bool)

(assert (=> b!156126 m!242955))

(declare-fun m!242957 () Bool)

(assert (=> b!156126 m!242957))

(declare-fun m!242959 () Bool)

(assert (=> b!156126 m!242959))

(assert (=> b!156126 m!242801))

(declare-fun m!242961 () Bool)

(assert (=> b!156126 m!242961))

(declare-fun m!242963 () Bool)

(assert (=> b!156126 m!242963))

(declare-fun m!242965 () Bool)

(assert (=> d!51856 m!242965))

(assert (=> d!51856 m!242939))

(declare-fun m!242967 () Bool)

(assert (=> b!156125 m!242967))

(declare-fun m!242969 () Bool)

(assert (=> b!156123 m!242969))

(declare-fun m!242971 () Bool)

(assert (=> b!156123 m!242971))

(declare-fun m!242973 () Bool)

(assert (=> b!156124 m!242973))

(assert (=> b!156124 m!242801))

(declare-fun m!242975 () Bool)

(assert (=> b!156124 m!242975))

(declare-fun m!242977 () Bool)

(assert (=> bm!2355 m!242977))

(assert (=> d!51794 d!51856))

(push 1)

(assert (not bm!2352))

(assert (not b!156115))

(assert (not b!156113))

(assert (not bm!2353))

(assert (not bm!2356))

(assert (not b!156112))

(assert (not bm!2357))

(assert (not bm!2355))

(assert (not d!51850))

(assert (not b!156126))

(assert (not b!156123))

(assert (not d!51840))

(assert (not b!156114))

(assert (not d!51838))

(assert (not bm!2354))

(assert (not b!156125))

(assert (not b!156124))

(assert (not d!51856))

(assert (not b!156121))

(check-sat)

(pop 1)

(push 1)

(check-sat)

