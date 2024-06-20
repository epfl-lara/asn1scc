; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30494 () Bool)

(assert start!30494)

(declare-fun res!130223 () Bool)

(declare-fun e!105017 () Bool)

(assert (=> start!30494 (=> (not res!130223) (not e!105017))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-datatypes ((array!7096 0))(
  ( (array!7097 (arr!4012 (Array (_ BitVec 32) (_ BitVec 8))) (size!3189 (_ BitVec 32))) )
))
(declare-fun arr!153 () array!7096)

(assert (=> start!30494 (= res!130223 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3189 arr!153))))))

(assert (=> start!30494 e!105017))

(assert (=> start!30494 true))

(declare-fun array_inv!2978 (array!7096) Bool)

(assert (=> start!30494 (array_inv!2978 arr!153)))

(declare-datatypes ((BitStream!5636 0))(
  ( (BitStream!5637 (buf!3692 array!7096) (currentByte!6750 (_ BitVec 32)) (currentBit!6745 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5636)

(declare-fun e!105020 () Bool)

(declare-fun inv!12 (BitStream!5636) Bool)

(assert (=> start!30494 (and (inv!12 bs!65) e!105020)))

(declare-fun b!155714 () Bool)

(declare-fun res!130222 () Bool)

(assert (=> b!155714 (=> (not res!130222) (not e!105017))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!155714 (= res!130222 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3189 (buf!3692 bs!65))) ((_ sign_extend 32) (currentByte!6750 bs!65)) ((_ sign_extend 32) (currentBit!6745 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!155715 () Bool)

(declare-fun moveByteIndexPrecond!0 (BitStream!5636 (_ BitVec 32)) Bool)

(assert (=> b!155715 (= e!105017 (not (moveByteIndexPrecond!0 bs!65 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!13784 0))(
  ( (tuple2!13785 (_1!7312 BitStream!5636) (_2!7312 array!7096)) )
))
(declare-fun lt!242095 () tuple2!13784)

(declare-fun readByteArrayLoopPure!0 (BitStream!5636 array!7096 (_ BitVec 32) (_ BitVec 32)) tuple2!13784)

(assert (=> b!155715 (= lt!242095 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!155716 () Bool)

(assert (=> b!155716 (= e!105020 (array_inv!2978 (buf!3692 bs!65)))))

(assert (= (and start!30494 res!130223) b!155714))

(assert (= (and b!155714 res!130222) b!155715))

(assert (= start!30494 b!155716))

(declare-fun m!241863 () Bool)

(assert (=> start!30494 m!241863))

(declare-fun m!241865 () Bool)

(assert (=> start!30494 m!241865))

(declare-fun m!241867 () Bool)

(assert (=> b!155714 m!241867))

(declare-fun m!241869 () Bool)

(assert (=> b!155715 m!241869))

(declare-fun m!241871 () Bool)

(assert (=> b!155715 m!241871))

(declare-fun m!241873 () Bool)

(assert (=> b!155716 m!241873))

(push 1)

(assert (not b!155715))

(assert (not b!155716))

(assert (not start!30494))

(assert (not b!155714))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!51516 () Bool)

(assert (=> d!51516 (= (moveByteIndexPrecond!0 bs!65 #b00000000000000000000000000000001) (and (bvsle (bvneg (size!3189 (buf!3692 bs!65))) #b00000000000000000000000000000001) (bvsle #b00000000000000000000000000000001 (size!3189 (buf!3692 bs!65))) (let ((res!99 (bvadd ((_ sign_extend 32) (currentByte!6750 bs!65)) ((_ sign_extend 32) #b00000000000000000000000000000001)))) (or (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 res!99) (bvslt res!99 ((_ sign_extend 32) (size!3189 (buf!3692 bs!65))))) (and (= (currentBit!6745 bs!65) #b00000000000000000000000000000000) (= res!99 ((_ sign_extend 32) (size!3189 (buf!3692 bs!65)))))))))))

(assert (=> b!155715 d!51516))

(declare-fun d!51522 () Bool)

(declare-datatypes ((Unit!9813 0))(
  ( (Unit!9814) )
))
(declare-datatypes ((tuple3!608 0))(
  ( (tuple3!609 (_1!7314 Unit!9813) (_2!7314 BitStream!5636) (_3!421 array!7096)) )
))
(declare-fun lt!242101 () tuple3!608)

(declare-fun readByteArrayLoop!0 (BitStream!5636 array!7096 (_ BitVec 32) (_ BitVec 32)) tuple3!608)

(assert (=> d!51522 (= lt!242101 (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236))))

(assert (=> d!51522 (= (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236) (tuple2!13785 (_2!7314 lt!242101) (_3!421 lt!242101)))))

(declare-fun bs!12601 () Bool)

(assert (= bs!12601 d!51522))

(declare-fun m!241883 () Bool)

(assert (=> bs!12601 m!241883))

(assert (=> b!155715 d!51522))

(declare-fun d!51534 () Bool)

(assert (=> d!51534 (= (array_inv!2978 (buf!3692 bs!65)) (bvsge (size!3189 (buf!3692 bs!65)) #b00000000000000000000000000000000))))

(assert (=> b!155716 d!51534))

(declare-fun d!51536 () Bool)

(assert (=> d!51536 (= (array_inv!2978 arr!153) (bvsge (size!3189 arr!153) #b00000000000000000000000000000000))))

(assert (=> start!30494 d!51536))

(declare-fun d!51538 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!51538 (= (inv!12 bs!65) (invariant!0 (currentBit!6745 bs!65) (currentByte!6750 bs!65) (size!3189 (buf!3692 bs!65))))))

(declare-fun bs!12602 () Bool)

(assert (= bs!12602 d!51538))

(declare-fun m!241885 () Bool)

(assert (=> bs!12602 m!241885))

(assert (=> start!30494 d!51538))

(declare-fun d!51540 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!51540 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3189 (buf!3692 bs!65))) ((_ sign_extend 32) (currentByte!6750 bs!65)) ((_ sign_extend 32) (currentBit!6745 bs!65)) (bvsub to!236 from!240)) (bvsle ((_ sign_extend 32) (bvsub to!236 from!240)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3189 (buf!3692 bs!65))) ((_ sign_extend 32) (currentByte!6750 bs!65)) ((_ sign_extend 32) (currentBit!6745 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12603 () Bool)

(assert (= bs!12603 d!51540))

(declare-fun m!241887 () Bool)

(assert (=> bs!12603 m!241887))

(assert (=> b!155714 d!51540))

(push 1)

(assert (not d!51522))

(assert (not d!51540))

(assert (not d!51538))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun call!2281 () Bool)

(declare-fun bm!2277 () Bool)

(declare-datatypes ((tuple2!13792 0))(
  ( (tuple2!13793 (_1!7319 (_ BitVec 8)) (_2!7319 BitStream!5636)) )
))
(declare-fun lt!242386 () tuple2!13792)

(declare-fun c!8282 () Bool)

(declare-fun arrayRangesEq!411 (array!7096 array!7096 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!2277 (= call!2281 (arrayRangesEq!411 arr!153 (ite c!8282 (array!7097 (store (arr!4012 arr!153) from!240 (_1!7319 lt!242386)) (size!3189 arr!153)) arr!153) #b00000000000000000000000000000000 (ite c!8282 from!240 (size!3189 arr!153))))))

(declare-fun b!155755 () Bool)

(declare-fun lt!242382 () tuple3!608)

(declare-fun e!105044 () Bool)

(assert (=> b!155755 (= e!105044 (arrayRangesEq!411 arr!153 (_3!421 lt!242382) #b00000000000000000000000000000000 from!240))))

(declare-fun b!155756 () Bool)

(declare-fun res!130247 () Bool)

(assert (=> b!155756 (=> (not res!130247) (not e!105044))))

(assert (=> b!155756 (= res!130247 (and (= (buf!3692 bs!65) (buf!3692 (_2!7314 lt!242382))) (= (size!3189 arr!153) (size!3189 (_3!421 lt!242382)))))))

(declare-fun b!155757 () Bool)

(declare-fun e!105043 () tuple3!608)

(declare-fun lt!242388 () Unit!9813)

(declare-fun lt!242362 () tuple3!608)

(assert (=> b!155757 (= e!105043 (tuple3!609 lt!242388 (_2!7314 lt!242362) (_3!421 lt!242362)))))

(declare-fun readByte!0 (BitStream!5636) tuple2!13792)

(assert (=> b!155757 (= lt!242386 (readByte!0 bs!65))))

(declare-fun lt!242380 () array!7096)

(assert (=> b!155757 (= lt!242380 (array!7097 (store (arr!4012 arr!153) from!240 (_1!7319 lt!242386)) (size!3189 arr!153)))))

(declare-fun lt!242383 () (_ BitVec 64))

(assert (=> b!155757 (= lt!242383 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!242376 () (_ BitVec 32))

(assert (=> b!155757 (= lt!242376 (bvsub to!236 from!240))))

(declare-fun lt!242358 () Unit!9813)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5636 BitStream!5636 (_ BitVec 64) (_ BitVec 32)) Unit!9813)

(assert (=> b!155757 (= lt!242358 (validateOffsetBytesFromBitIndexLemma!0 bs!65 (_2!7319 lt!242386) lt!242383 lt!242376))))

(assert (=> b!155757 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3189 (buf!3692 (_2!7319 lt!242386)))) ((_ sign_extend 32) (currentByte!6750 (_2!7319 lt!242386))) ((_ sign_extend 32) (currentBit!6745 (_2!7319 lt!242386))) (bvsub lt!242376 ((_ extract 31 0) (bvsdiv (bvadd lt!242383 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!242384 () Unit!9813)

(assert (=> b!155757 (= lt!242384 lt!242358)))

(assert (=> b!155757 (= lt!242362 (readByteArrayLoop!0 (_2!7319 lt!242386) lt!242380 (bvadd from!240 #b00000000000000000000000000000001) to!236))))

(declare-fun call!2280 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!155757 (= call!2280 (bvadd (bitIndex!0 (size!3189 (buf!3692 bs!65)) (currentByte!6750 bs!65) (currentBit!6745 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!242366 () Unit!9813)

(declare-fun Unit!9830 () Unit!9813)

(assert (=> b!155757 (= lt!242366 Unit!9830)))

(assert (=> b!155757 (= (bvadd call!2280 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3189 (buf!3692 (_2!7314 lt!242362))) (currentByte!6750 (_2!7314 lt!242362)) (currentBit!6745 (_2!7314 lt!242362))))))

(declare-fun lt!242370 () Unit!9813)

(declare-fun Unit!9832 () Unit!9813)

(assert (=> b!155757 (= lt!242370 Unit!9832)))

(assert (=> b!155757 (= (bvadd (bitIndex!0 (size!3189 (buf!3692 bs!65)) (currentByte!6750 bs!65) (currentBit!6745 bs!65)) (bvmul ((_ sign_extend 32) (bvsub to!236 from!240)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3189 (buf!3692 (_2!7314 lt!242362))) (currentByte!6750 (_2!7314 lt!242362)) (currentBit!6745 (_2!7314 lt!242362))))))

(declare-fun lt!242372 () Unit!9813)

(declare-fun Unit!9833 () Unit!9813)

(assert (=> b!155757 (= lt!242372 Unit!9833)))

(assert (=> b!155757 (and (= (buf!3692 bs!65) (buf!3692 (_2!7314 lt!242362))) (= (size!3189 arr!153) (size!3189 (_3!421 lt!242362))))))

(declare-fun lt!242391 () Unit!9813)

(declare-fun Unit!9834 () Unit!9813)

(assert (=> b!155757 (= lt!242391 Unit!9834)))

(declare-fun lt!242377 () Unit!9813)

(declare-fun arrayUpdatedAtPrefixLemma!23 (array!7096 (_ BitVec 32) (_ BitVec 8)) Unit!9813)

(assert (=> b!155757 (= lt!242377 (arrayUpdatedAtPrefixLemma!23 arr!153 from!240 (_1!7319 lt!242386)))))

(assert (=> b!155757 call!2281))

(declare-fun lt!242374 () Unit!9813)

(assert (=> b!155757 (= lt!242374 lt!242377)))

(declare-fun lt!242392 () (_ BitVec 32))

(assert (=> b!155757 (= lt!242392 #b00000000000000000000000000000000)))

(declare-fun lt!242367 () Unit!9813)

(declare-fun arrayRangesEqTransitive!88 (array!7096 array!7096 array!7096 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9813)

(assert (=> b!155757 (= lt!242367 (arrayRangesEqTransitive!88 arr!153 lt!242380 (_3!421 lt!242362) lt!242392 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(declare-fun call!2282 () Bool)

(assert (=> b!155757 call!2282))

(declare-fun lt!242357 () Unit!9813)

(assert (=> b!155757 (= lt!242357 lt!242367)))

(assert (=> b!155757 (arrayRangesEq!411 arr!153 (_3!421 lt!242362) #b00000000000000000000000000000000 from!240)))

(declare-fun lt!242369 () Unit!9813)

(declare-fun Unit!9835 () Unit!9813)

(assert (=> b!155757 (= lt!242369 Unit!9835)))

(declare-fun lt!242375 () Unit!9813)

(declare-fun arrayRangesEqImpliesEq!32 (array!7096 array!7096 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9813)

(assert (=> b!155757 (= lt!242375 (arrayRangesEqImpliesEq!32 lt!242380 (_3!421 lt!242362) #b00000000000000000000000000000000 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!155757 (= (select (store (arr!4012 arr!153) from!240 (_1!7319 lt!242386)) from!240) (select (arr!4012 (_3!421 lt!242362)) from!240))))

(declare-fun lt!242365 () Unit!9813)

(assert (=> b!155757 (= lt!242365 lt!242375)))

(declare-fun lt!242363 () Bool)

(assert (=> b!155757 (= lt!242363 (= (select (arr!4012 (_3!421 lt!242362)) from!240) (_1!7319 lt!242386)))))

(declare-fun Unit!9836 () Unit!9813)

(assert (=> b!155757 (= lt!242388 Unit!9836)))

(assert (=> b!155757 lt!242363))

(declare-fun lt!242368 () Unit!9813)

(declare-fun b!155758 () Bool)

(assert (=> b!155758 (= e!105043 (tuple3!609 lt!242368 bs!65 arr!153))))

(assert (=> b!155758 (= call!2280 call!2280)))

(declare-fun lt!242387 () Unit!9813)

(declare-fun Unit!9837 () Unit!9813)

(assert (=> b!155758 (= lt!242387 Unit!9837)))

(declare-fun lt!242360 () Unit!9813)

(declare-fun arrayRangesEqReflexiveLemma!23 (array!7096) Unit!9813)

(assert (=> b!155758 (= lt!242360 (arrayRangesEqReflexiveLemma!23 arr!153))))

(assert (=> b!155758 call!2281))

(declare-fun lt!242371 () Unit!9813)

(assert (=> b!155758 (= lt!242371 lt!242360)))

(declare-fun lt!242381 () array!7096)

(assert (=> b!155758 (= lt!242381 arr!153)))

(declare-fun lt!242389 () array!7096)

(assert (=> b!155758 (= lt!242389 arr!153)))

(declare-fun lt!242385 () (_ BitVec 32))

(assert (=> b!155758 (= lt!242385 #b00000000000000000000000000000000)))

(declare-fun lt!242373 () (_ BitVec 32))

(assert (=> b!155758 (= lt!242373 (size!3189 arr!153))))

(declare-fun lt!242359 () (_ BitVec 32))

(assert (=> b!155758 (= lt!242359 #b00000000000000000000000000000000)))

(declare-fun lt!242361 () (_ BitVec 32))

(assert (=> b!155758 (= lt!242361 from!240)))

(declare-fun arrayRangesEqSlicedLemma!23 (array!7096 array!7096 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9813)

(assert (=> b!155758 (= lt!242368 (arrayRangesEqSlicedLemma!23 lt!242381 lt!242389 lt!242385 lt!242373 lt!242359 lt!242361))))

(assert (=> b!155758 call!2282))

(declare-fun d!51556 () Bool)

(declare-fun e!105042 () Bool)

(assert (=> d!51556 e!105042))

(declare-fun res!130245 () Bool)

(assert (=> d!51556 (=> res!130245 e!105042)))

(assert (=> d!51556 (= res!130245 (bvsge from!240 to!236))))

(declare-fun lt!242364 () Bool)

(assert (=> d!51556 (= lt!242364 e!105044)))

(declare-fun res!130246 () Bool)

(assert (=> d!51556 (=> (not res!130246) (not e!105044))))

(declare-fun lt!242378 () (_ BitVec 64))

(declare-fun lt!242390 () (_ BitVec 64))

(assert (=> d!51556 (= res!130246 (= (bvadd lt!242378 lt!242390) (bitIndex!0 (size!3189 (buf!3692 (_2!7314 lt!242382))) (currentByte!6750 (_2!7314 lt!242382)) (currentBit!6745 (_2!7314 lt!242382)))))))

(assert (=> d!51556 (or (not (= (bvand lt!242378 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!242390 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!242378 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!242378 lt!242390) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!242379 () (_ BitVec 64))

(assert (=> d!51556 (= lt!242390 (bvmul lt!242379 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!51556 (or (= lt!242379 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!242379 #b0000000000000000000000000000000000000000000000000000000000001000) lt!242379)))))

(assert (=> d!51556 (= lt!242379 ((_ sign_extend 32) (bvsub to!236 from!240)))))

(assert (=> d!51556 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand from!240 #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000)))))

(assert (=> d!51556 (= lt!242378 (bitIndex!0 (size!3189 (buf!3692 bs!65)) (currentByte!6750 bs!65) (currentBit!6745 bs!65)))))

(assert (=> d!51556 (= lt!242382 e!105043)))

(assert (=> d!51556 (= c!8282 (bvslt from!240 to!236))))

(assert (=> d!51556 (and (bvsle #b00000000000000000000000000000000 from!240) (bvsle from!240 to!236) (bvsle to!236 (size!3189 arr!153)))))

(assert (=> d!51556 (= (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236) lt!242382)))

(declare-fun b!155759 () Bool)

(declare-datatypes ((tuple2!13796 0))(
  ( (tuple2!13797 (_1!7321 BitStream!5636) (_2!7321 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5636) tuple2!13796)

(assert (=> b!155759 (= e!105042 (= (select (arr!4012 (_3!421 lt!242382)) from!240) (_2!7321 (readBytePure!0 bs!65))))))

(assert (=> b!155759 (and (bvsge from!240 #b00000000000000000000000000000000) (bvslt from!240 (size!3189 (_3!421 lt!242382))))))

(declare-fun bm!2278 () Bool)

(assert (=> bm!2278 (= call!2280 (bitIndex!0 (ite c!8282 (size!3189 (buf!3692 (_2!7319 lt!242386))) (size!3189 (buf!3692 bs!65))) (ite c!8282 (currentByte!6750 (_2!7319 lt!242386)) (currentByte!6750 bs!65)) (ite c!8282 (currentBit!6745 (_2!7319 lt!242386)) (currentBit!6745 bs!65))))))

(declare-fun bm!2279 () Bool)

(assert (=> bm!2279 (= call!2282 (arrayRangesEq!411 (ite c!8282 arr!153 lt!242381) (ite c!8282 (_3!421 lt!242362) lt!242389) (ite c!8282 lt!242392 lt!242359) (ite c!8282 from!240 lt!242361)))))

(assert (= (and d!51556 c!8282) b!155757))

(assert (= (and d!51556 (not c!8282)) b!155758))

(assert (= (or b!155757 b!155758) bm!2279))

(assert (= (or b!155757 b!155758) bm!2277))

(assert (= (or b!155757 b!155758) bm!2278))

(assert (= (and d!51556 res!130246) b!155756))

(assert (= (and b!155756 res!130247) b!155755))

(assert (= (and d!51556 (not res!130245)) b!155759))

(declare-fun m!241937 () Bool)

(assert (=> d!51556 m!241937))

(declare-fun m!241939 () Bool)

(assert (=> d!51556 m!241939))

(declare-fun m!241941 () Bool)

(assert (=> b!155758 m!241941))

(declare-fun m!241943 () Bool)

(assert (=> b!155758 m!241943))

(declare-fun m!241945 () Bool)

(assert (=> bm!2277 m!241945))

(declare-fun m!241947 () Bool)

(assert (=> bm!2277 m!241947))

(declare-fun m!241949 () Bool)

(assert (=> b!155755 m!241949))

(declare-fun m!241951 () Bool)

(assert (=> b!155759 m!241951))

(declare-fun m!241953 () Bool)

(assert (=> b!155759 m!241953))

(declare-fun m!241955 () Bool)

(assert (=> bm!2278 m!241955))

(declare-fun m!241957 () Bool)

(assert (=> bm!2279 m!241957))

(declare-fun m!241959 () Bool)

(assert (=> b!155757 m!241959))

(declare-fun m!241961 () Bool)

(assert (=> b!155757 m!241961))

(declare-fun m!241963 () Bool)

(assert (=> b!155757 m!241963))

(declare-fun m!241965 () Bool)

(assert (=> b!155757 m!241965))

(declare-fun m!241967 () Bool)

(assert (=> b!155757 m!241967))

(declare-fun m!241969 () Bool)

(assert (=> b!155757 m!241969))

(assert (=> b!155757 m!241939))

(declare-fun m!241971 () Bool)

(assert (=> b!155757 m!241971))

(declare-fun m!241973 () Bool)

(assert (=> b!155757 m!241973))

(declare-fun m!241975 () Bool)

(assert (=> b!155757 m!241975))

(assert (=> b!155757 m!241945))

(declare-fun m!241977 () Bool)

(assert (=> b!155757 m!241977))

(declare-fun m!241979 () Bool)

(assert (=> b!155757 m!241979))

(assert (=> d!51522 d!51556))

(declare-fun d!51560 () Bool)

(assert (=> d!51560 (= (remainingBits!0 ((_ sign_extend 32) (size!3189 (buf!3692 bs!65))) ((_ sign_extend 32) (currentByte!6750 bs!65)) ((_ sign_extend 32) (currentBit!6745 bs!65))) (bvsub (bvmul ((_ sign_extend 32) (size!3189 (buf!3692 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6750 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6745 bs!65)))))))

(assert (=> d!51540 d!51560))

(declare-fun d!51564 () Bool)

(assert (=> d!51564 (= (invariant!0 (currentBit!6745 bs!65) (currentByte!6750 bs!65) (size!3189 (buf!3692 bs!65))) (and (bvsge (currentBit!6745 bs!65) #b00000000000000000000000000000000) (bvslt (currentBit!6745 bs!65) #b00000000000000000000000000001000) (bvsge (currentByte!6750 bs!65) #b00000000000000000000000000000000) (or (bvslt (currentByte!6750 bs!65) (size!3189 (buf!3692 bs!65))) (and (= (currentBit!6745 bs!65) #b00000000000000000000000000000000) (= (currentByte!6750 bs!65) (size!3189 (buf!3692 bs!65)))))))))

(assert (=> d!51538 d!51564))

(push 1)

(assert (not bm!2279))

(assert (not d!51556))

(assert (not b!155759))

(assert (not bm!2278))

(assert (not b!155755))

(assert (not b!155758))

(assert (not bm!2277))

(assert (not b!155757))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

