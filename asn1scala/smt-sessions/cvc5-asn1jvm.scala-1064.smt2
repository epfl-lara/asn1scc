; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30490 () Bool)

(assert start!30490)

(declare-fun res!130210 () Bool)

(declare-fun e!104993 () Bool)

(assert (=> start!30490 (=> (not res!130210) (not e!104993))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-datatypes ((array!7092 0))(
  ( (array!7093 (arr!4010 (Array (_ BitVec 32) (_ BitVec 8))) (size!3187 (_ BitVec 32))) )
))
(declare-fun arr!153 () array!7092)

(assert (=> start!30490 (= res!130210 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3187 arr!153))))))

(assert (=> start!30490 e!104993))

(assert (=> start!30490 true))

(declare-fun array_inv!2976 (array!7092) Bool)

(assert (=> start!30490 (array_inv!2976 arr!153)))

(declare-datatypes ((BitStream!5632 0))(
  ( (BitStream!5633 (buf!3690 array!7092) (currentByte!6748 (_ BitVec 32)) (currentBit!6743 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5632)

(declare-fun e!104994 () Bool)

(declare-fun inv!12 (BitStream!5632) Bool)

(assert (=> start!30490 (and (inv!12 bs!65) e!104994)))

(declare-fun b!155696 () Bool)

(declare-fun res!130211 () Bool)

(assert (=> b!155696 (=> (not res!130211) (not e!104993))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!155696 (= res!130211 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3187 (buf!3690 bs!65))) ((_ sign_extend 32) (currentByte!6748 bs!65)) ((_ sign_extend 32) (currentBit!6743 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!155697 () Bool)

(declare-fun moveByteIndexPrecond!0 (BitStream!5632 (_ BitVec 32)) Bool)

(assert (=> b!155697 (= e!104993 (not (moveByteIndexPrecond!0 bs!65 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!13780 0))(
  ( (tuple2!13781 (_1!7310 BitStream!5632) (_2!7310 array!7092)) )
))
(declare-fun lt!242089 () tuple2!13780)

(declare-fun readByteArrayLoopPure!0 (BitStream!5632 array!7092 (_ BitVec 32) (_ BitVec 32)) tuple2!13780)

(assert (=> b!155697 (= lt!242089 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!155698 () Bool)

(assert (=> b!155698 (= e!104994 (array_inv!2976 (buf!3690 bs!65)))))

(assert (= (and start!30490 res!130210) b!155696))

(assert (= (and b!155696 res!130211) b!155697))

(assert (= start!30490 b!155698))

(declare-fun m!241839 () Bool)

(assert (=> start!30490 m!241839))

(declare-fun m!241841 () Bool)

(assert (=> start!30490 m!241841))

(declare-fun m!241843 () Bool)

(assert (=> b!155696 m!241843))

(declare-fun m!241845 () Bool)

(assert (=> b!155697 m!241845))

(declare-fun m!241847 () Bool)

(assert (=> b!155697 m!241847))

(declare-fun m!241849 () Bool)

(assert (=> b!155698 m!241849))

(push 1)

(assert (not b!155696))

(assert (not b!155697))

(assert (not b!155698))

(assert (not start!30490))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!51514 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!51514 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3187 (buf!3690 bs!65))) ((_ sign_extend 32) (currentByte!6748 bs!65)) ((_ sign_extend 32) (currentBit!6743 bs!65)) (bvsub to!236 from!240)) (bvsle ((_ sign_extend 32) (bvsub to!236 from!240)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3187 (buf!3690 bs!65))) ((_ sign_extend 32) (currentByte!6748 bs!65)) ((_ sign_extend 32) (currentBit!6743 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12597 () Bool)

(assert (= bs!12597 d!51514))

(declare-fun m!241875 () Bool)

(assert (=> bs!12597 m!241875))

(assert (=> b!155696 d!51514))

(declare-fun d!51518 () Bool)

(assert (=> d!51518 (= (moveByteIndexPrecond!0 bs!65 #b00000000000000000000000000000001) (and (bvsle (bvneg (size!3187 (buf!3690 bs!65))) #b00000000000000000000000000000001) (bvsle #b00000000000000000000000000000001 (size!3187 (buf!3690 bs!65))) (let ((res!99 (bvadd ((_ sign_extend 32) (currentByte!6748 bs!65)) ((_ sign_extend 32) #b00000000000000000000000000000001)))) (or (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 res!99) (bvslt res!99 ((_ sign_extend 32) (size!3187 (buf!3690 bs!65))))) (and (= (currentBit!6743 bs!65) #b00000000000000000000000000000000) (= res!99 ((_ sign_extend 32) (size!3187 (buf!3690 bs!65)))))))))))

(assert (=> b!155697 d!51518))

(declare-datatypes ((Unit!9811 0))(
  ( (Unit!9812) )
))
(declare-datatypes ((tuple3!606 0))(
  ( (tuple3!607 (_1!7313 Unit!9811) (_2!7313 BitStream!5632) (_3!420 array!7092)) )
))
(declare-fun lt!242098 () tuple3!606)

(declare-fun d!51520 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!5632 array!7092 (_ BitVec 32) (_ BitVec 32)) tuple3!606)

(assert (=> d!51520 (= lt!242098 (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236))))

(assert (=> d!51520 (= (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236) (tuple2!13781 (_2!7313 lt!242098) (_3!420 lt!242098)))))

(declare-fun bs!12598 () Bool)

(assert (= bs!12598 d!51520))

(declare-fun m!241877 () Bool)

(assert (=> bs!12598 m!241877))

(assert (=> b!155697 d!51520))

(declare-fun d!51524 () Bool)

(assert (=> d!51524 (= (array_inv!2976 (buf!3690 bs!65)) (bvsge (size!3187 (buf!3690 bs!65)) #b00000000000000000000000000000000))))

(assert (=> b!155698 d!51524))

(declare-fun d!51526 () Bool)

(assert (=> d!51526 (= (array_inv!2976 arr!153) (bvsge (size!3187 arr!153) #b00000000000000000000000000000000))))

(assert (=> start!30490 d!51526))

(declare-fun d!51528 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!51528 (= (inv!12 bs!65) (invariant!0 (currentBit!6743 bs!65) (currentByte!6748 bs!65) (size!3187 (buf!3690 bs!65))))))

(declare-fun bs!12599 () Bool)

(assert (= bs!12599 d!51528))

(declare-fun m!241879 () Bool)

(assert (=> bs!12599 m!241879))

(assert (=> start!30490 d!51528))

(push 1)

(assert (not d!51520))

(assert (not d!51528))

(assert (not d!51514))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!155760 () Bool)

(declare-fun e!105046 () tuple3!606)

(declare-fun lt!242420 () Unit!9811)

(declare-fun lt!242407 () tuple3!606)

(assert (=> b!155760 (= e!105046 (tuple3!607 lt!242420 (_2!7313 lt!242407) (_3!420 lt!242407)))))

(declare-datatypes ((tuple2!13790 0))(
  ( (tuple2!13791 (_1!7318 (_ BitVec 8)) (_2!7318 BitStream!5632)) )
))
(declare-fun lt!242403 () tuple2!13790)

(declare-fun readByte!0 (BitStream!5632) tuple2!13790)

(assert (=> b!155760 (= lt!242403 (readByte!0 bs!65))))

(declare-fun lt!242396 () array!7092)

(assert (=> b!155760 (= lt!242396 (array!7093 (store (arr!4010 arr!153) from!240 (_1!7318 lt!242403)) (size!3187 arr!153)))))

(declare-fun lt!242427 () (_ BitVec 64))

(assert (=> b!155760 (= lt!242427 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!242421 () (_ BitVec 32))

(assert (=> b!155760 (= lt!242421 (bvsub to!236 from!240))))

(declare-fun lt!242411 () Unit!9811)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5632 BitStream!5632 (_ BitVec 64) (_ BitVec 32)) Unit!9811)

(assert (=> b!155760 (= lt!242411 (validateOffsetBytesFromBitIndexLemma!0 bs!65 (_2!7318 lt!242403) lt!242427 lt!242421))))

(assert (=> b!155760 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3187 (buf!3690 (_2!7318 lt!242403)))) ((_ sign_extend 32) (currentByte!6748 (_2!7318 lt!242403))) ((_ sign_extend 32) (currentBit!6743 (_2!7318 lt!242403))) (bvsub lt!242421 ((_ extract 31 0) (bvsdiv (bvadd lt!242427 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!242397 () Unit!9811)

(assert (=> b!155760 (= lt!242397 lt!242411)))

(assert (=> b!155760 (= lt!242407 (readByteArrayLoop!0 (_2!7318 lt!242403) lt!242396 (bvadd from!240 #b00000000000000000000000000000001) to!236))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!155760 (= (bitIndex!0 (size!3187 (buf!3690 (_2!7318 lt!242403))) (currentByte!6748 (_2!7318 lt!242403)) (currentBit!6743 (_2!7318 lt!242403))) (bvadd (bitIndex!0 (size!3187 (buf!3690 bs!65)) (currentByte!6748 bs!65) (currentBit!6743 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!242418 () Unit!9811)

(declare-fun Unit!9824 () Unit!9811)

(assert (=> b!155760 (= lt!242418 Unit!9824)))

(declare-fun call!2283 () (_ BitVec 64))

(assert (=> b!155760 (= (bvadd (bitIndex!0 (size!3187 (buf!3690 (_2!7318 lt!242403))) (currentByte!6748 (_2!7318 lt!242403)) (currentBit!6743 (_2!7318 lt!242403))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2283)))

(declare-fun lt!242414 () Unit!9811)

(declare-fun Unit!9825 () Unit!9811)

(assert (=> b!155760 (= lt!242414 Unit!9825)))

(assert (=> b!155760 (= (bvadd (bitIndex!0 (size!3187 (buf!3690 bs!65)) (currentByte!6748 bs!65) (currentBit!6743 bs!65)) (bvmul ((_ sign_extend 32) (bvsub to!236 from!240)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2283)))

(declare-fun lt!242406 () Unit!9811)

(declare-fun Unit!9826 () Unit!9811)

(assert (=> b!155760 (= lt!242406 Unit!9826)))

(assert (=> b!155760 (and (= (buf!3690 bs!65) (buf!3690 (_2!7313 lt!242407))) (= (size!3187 arr!153) (size!3187 (_3!420 lt!242407))))))

(declare-fun lt!242404 () Unit!9811)

(declare-fun Unit!9827 () Unit!9811)

(assert (=> b!155760 (= lt!242404 Unit!9827)))

(declare-fun lt!242412 () Unit!9811)

(declare-fun arrayUpdatedAtPrefixLemma!22 (array!7092 (_ BitVec 32) (_ BitVec 8)) Unit!9811)

(assert (=> b!155760 (= lt!242412 (arrayUpdatedAtPrefixLemma!22 arr!153 from!240 (_1!7318 lt!242403)))))

(declare-fun call!2285 () Bool)

(assert (=> b!155760 call!2285))

(declare-fun lt!242428 () Unit!9811)

(assert (=> b!155760 (= lt!242428 lt!242412)))

(declare-fun lt!242399 () (_ BitVec 32))

(assert (=> b!155760 (= lt!242399 #b00000000000000000000000000000000)))

(declare-fun lt!242409 () Unit!9811)

(declare-fun arrayRangesEqTransitive!87 (array!7092 array!7092 array!7092 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9811)

(assert (=> b!155760 (= lt!242409 (arrayRangesEqTransitive!87 arr!153 lt!242396 (_3!420 lt!242407) lt!242399 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(declare-fun call!2284 () Bool)

(assert (=> b!155760 call!2284))

(declare-fun lt!242400 () Unit!9811)

(assert (=> b!155760 (= lt!242400 lt!242409)))

(declare-fun arrayRangesEq!412 (array!7092 array!7092 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!155760 (arrayRangesEq!412 arr!153 (_3!420 lt!242407) #b00000000000000000000000000000000 from!240)))

(declare-fun lt!242408 () Unit!9811)

(declare-fun Unit!9828 () Unit!9811)

(assert (=> b!155760 (= lt!242408 Unit!9828)))

(declare-fun lt!242424 () Unit!9811)

(declare-fun arrayRangesEqImpliesEq!31 (array!7092 array!7092 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9811)

(assert (=> b!155760 (= lt!242424 (arrayRangesEqImpliesEq!31 lt!242396 (_3!420 lt!242407) #b00000000000000000000000000000000 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!155760 (= (select (store (arr!4010 arr!153) from!240 (_1!7318 lt!242403)) from!240) (select (arr!4010 (_3!420 lt!242407)) from!240))))

(declare-fun lt!242393 () Unit!9811)

(assert (=> b!155760 (= lt!242393 lt!242424)))

(declare-fun lt!242425 () Bool)

(assert (=> b!155760 (= lt!242425 (= (select (arr!4010 (_3!420 lt!242407)) from!240) (_1!7318 lt!242403)))))

(declare-fun Unit!9829 () Unit!9811)

(assert (=> b!155760 (= lt!242420 Unit!9829)))

(assert (=> b!155760 lt!242425))

(declare-fun b!155761 () Bool)

(declare-fun lt!242426 () Unit!9811)

(assert (=> b!155761 (= e!105046 (tuple3!607 lt!242426 bs!65 arr!153))))

(assert (=> b!155761 (= call!2283 call!2283)))

(declare-fun lt!242416 () Unit!9811)

(declare-fun Unit!9831 () Unit!9811)

(assert (=> b!155761 (= lt!242416 Unit!9831)))

(declare-fun lt!242395 () Unit!9811)

(declare-fun arrayRangesEqReflexiveLemma!22 (array!7092) Unit!9811)

(assert (=> b!155761 (= lt!242395 (arrayRangesEqReflexiveLemma!22 arr!153))))

(assert (=> b!155761 call!2284))

(declare-fun lt!242419 () Unit!9811)

(assert (=> b!155761 (= lt!242419 lt!242395)))

(declare-fun lt!242398 () array!7092)

(assert (=> b!155761 (= lt!242398 arr!153)))

(declare-fun lt!242423 () array!7092)

(assert (=> b!155761 (= lt!242423 arr!153)))

(declare-fun lt!242410 () (_ BitVec 32))

(assert (=> b!155761 (= lt!242410 #b00000000000000000000000000000000)))

(declare-fun lt!242394 () (_ BitVec 32))

(assert (=> b!155761 (= lt!242394 (size!3187 arr!153))))

(declare-fun lt!242413 () (_ BitVec 32))

(assert (=> b!155761 (= lt!242413 #b00000000000000000000000000000000)))

(declare-fun lt!242422 () (_ BitVec 32))

(assert (=> b!155761 (= lt!242422 from!240)))

(declare-fun arrayRangesEqSlicedLemma!22 (array!7092 array!7092 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9811)

(assert (=> b!155761 (= lt!242426 (arrayRangesEqSlicedLemma!22 lt!242398 lt!242423 lt!242410 lt!242394 lt!242413 lt!242422))))

(assert (=> b!155761 call!2285))

(declare-fun bm!2280 () Bool)

(declare-fun c!8283 () Bool)

(assert (=> bm!2280 (= call!2284 (arrayRangesEq!412 arr!153 (ite c!8283 (_3!420 lt!242407) arr!153) (ite c!8283 lt!242399 #b00000000000000000000000000000000) (ite c!8283 from!240 (size!3187 arr!153))))))

(declare-fun b!155762 () Bool)

(declare-fun res!130250 () Bool)

(declare-fun e!105045 () Bool)

(assert (=> b!155762 (=> (not res!130250) (not e!105045))))

(declare-fun lt!242405 () tuple3!606)

(assert (=> b!155762 (= res!130250 (and (= (buf!3690 bs!65) (buf!3690 (_2!7313 lt!242405))) (= (size!3187 arr!153) (size!3187 (_3!420 lt!242405)))))))

(declare-fun bm!2281 () Bool)

(assert (=> bm!2281 (= call!2285 (arrayRangesEq!412 (ite c!8283 arr!153 lt!242398) (ite c!8283 (array!7093 (store (arr!4010 arr!153) from!240 (_1!7318 lt!242403)) (size!3187 arr!153)) lt!242423) (ite c!8283 #b00000000000000000000000000000000 lt!242413) (ite c!8283 from!240 lt!242422)))))

(declare-fun e!105047 () Bool)

(declare-fun b!155763 () Bool)

(declare-datatypes ((tuple2!13794 0))(
  ( (tuple2!13795 (_1!7320 BitStream!5632) (_2!7320 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5632) tuple2!13794)

(assert (=> b!155763 (= e!105047 (= (select (arr!4010 (_3!420 lt!242405)) from!240) (_2!7320 (readBytePure!0 bs!65))))))

(assert (=> b!155763 (and (bvsge from!240 #b00000000000000000000000000000000) (bvslt from!240 (size!3187 (_3!420 lt!242405))))))

(declare-fun d!51558 () Bool)

(assert (=> d!51558 e!105047))

(declare-fun res!130249 () Bool)

(assert (=> d!51558 (=> res!130249 e!105047)))

(assert (=> d!51558 (= res!130249 (bvsge from!240 to!236))))

(declare-fun lt!242415 () Bool)

(assert (=> d!51558 (= lt!242415 e!105045)))

(declare-fun res!130248 () Bool)

(assert (=> d!51558 (=> (not res!130248) (not e!105045))))

(declare-fun lt!242417 () (_ BitVec 64))

(declare-fun lt!242402 () (_ BitVec 64))

(assert (=> d!51558 (= res!130248 (= (bvadd lt!242417 lt!242402) (bitIndex!0 (size!3187 (buf!3690 (_2!7313 lt!242405))) (currentByte!6748 (_2!7313 lt!242405)) (currentBit!6743 (_2!7313 lt!242405)))))))

(assert (=> d!51558 (or (not (= (bvand lt!242417 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!242402 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!242417 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!242417 lt!242402) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!242401 () (_ BitVec 64))

(assert (=> d!51558 (= lt!242402 (bvmul lt!242401 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!51558 (or (= lt!242401 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!242401 #b0000000000000000000000000000000000000000000000000000000000001000) lt!242401)))))

(assert (=> d!51558 (= lt!242401 ((_ sign_extend 32) (bvsub to!236 from!240)))))

(assert (=> d!51558 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand from!240 #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000)))))

(assert (=> d!51558 (= lt!242417 (bitIndex!0 (size!3187 (buf!3690 bs!65)) (currentByte!6748 bs!65) (currentBit!6743 bs!65)))))

(assert (=> d!51558 (= lt!242405 e!105046)))

(assert (=> d!51558 (= c!8283 (bvslt from!240 to!236))))

(assert (=> d!51558 (and (bvsle #b00000000000000000000000000000000 from!240) (bvsle from!240 to!236) (bvsle to!236 (size!3187 arr!153)))))

(assert (=> d!51558 (= (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236) lt!242405)))

(declare-fun bm!2282 () Bool)

(assert (=> bm!2282 (= call!2283 (bitIndex!0 (ite c!8283 (size!3187 (buf!3690 (_2!7313 lt!242407))) (size!3187 (buf!3690 bs!65))) (ite c!8283 (currentByte!6748 (_2!7313 lt!242407)) (currentByte!6748 bs!65)) (ite c!8283 (currentBit!6743 (_2!7313 lt!242407)) (currentBit!6743 bs!65))))))

(declare-fun b!155764 () Bool)

(assert (=> b!155764 (= e!105045 (arrayRangesEq!412 arr!153 (_3!420 lt!242405) #b00000000000000000000000000000000 from!240))))

(assert (= (and d!51558 c!8283) b!155760))

(assert (= (and d!51558 (not c!8283)) b!155761))

(assert (= (or b!155760 b!155761) bm!2281))

(assert (= (or b!155760 b!155761) bm!2280))

(assert (= (or b!155760 b!155761) bm!2282))

(assert (= (and d!51558 res!130248) b!155762))

(assert (= (and b!155762 res!130250) b!155764))

(assert (= (and d!51558 (not res!130249)) b!155763))

(declare-fun m!241981 () Bool)

(assert (=> b!155763 m!241981))

(declare-fun m!241983 () Bool)

(assert (=> b!155763 m!241983))

(declare-fun m!241985 () Bool)

(assert (=> b!155764 m!241985))

(declare-fun m!241987 () Bool)

(assert (=> bm!2280 m!241987))

(declare-fun m!241989 () Bool)

(assert (=> d!51558 m!241989))

(declare-fun m!241991 () Bool)

(assert (=> d!51558 m!241991))

(declare-fun m!241993 () Bool)

(assert (=> bm!2281 m!241993))

(declare-fun m!241995 () Bool)

(assert (=> bm!2281 m!241995))

(declare-fun m!241997 () Bool)

(assert (=> b!155761 m!241997))

(declare-fun m!241999 () Bool)

(assert (=> b!155761 m!241999))

(declare-fun m!242001 () Bool)

(assert (=> b!155760 m!242001))

(declare-fun m!242003 () Bool)

(assert (=> b!155760 m!242003))

(declare-fun m!242005 () Bool)

(assert (=> b!155760 m!242005))

(declare-fun m!242007 () Bool)

(assert (=> b!155760 m!242007))

(declare-fun m!242009 () Bool)

(assert (=> b!155760 m!242009))

(declare-fun m!242011 () Bool)

(assert (=> b!155760 m!242011))

(declare-fun m!242013 () Bool)

(assert (=> b!155760 m!242013))

(declare-fun m!242015 () Bool)

(assert (=> b!155760 m!242015))

(declare-fun m!242017 () Bool)

(assert (=> b!155760 m!242017))

(declare-fun m!242019 () Bool)

(assert (=> b!155760 m!242019))

(assert (=> b!155760 m!241993))

(assert (=> b!155760 m!241991))

(declare-fun m!242021 () Bool)

(assert (=> b!155760 m!242021))

(declare-fun m!242023 () Bool)

(assert (=> bm!2282 m!242023))

(assert (=> d!51520 d!51558))

(declare-fun d!51562 () Bool)

(assert (=> d!51562 (= (invariant!0 (currentBit!6743 bs!65) (currentByte!6748 bs!65) (size!3187 (buf!3690 bs!65))) (and (bvsge (currentBit!6743 bs!65) #b00000000000000000000000000000000) (bvslt (currentBit!6743 bs!65) #b00000000000000000000000000001000) (bvsge (currentByte!6748 bs!65) #b00000000000000000000000000000000) (or (bvslt (currentByte!6748 bs!65) (size!3187 (buf!3690 bs!65))) (and (= (currentBit!6743 bs!65) #b00000000000000000000000000000000) (= (currentByte!6748 bs!65) (size!3187 (buf!3690 bs!65)))))))))

(assert (=> d!51528 d!51562))

(declare-fun d!51566 () Bool)

(assert (=> d!51566 (= (remainingBits!0 ((_ sign_extend 32) (size!3187 (buf!3690 bs!65))) ((_ sign_extend 32) (currentByte!6748 bs!65)) ((_ sign_extend 32) (currentBit!6743 bs!65))) (bvsub (bvmul ((_ sign_extend 32) (size!3187 (buf!3690 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6748 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6743 bs!65)))))))

(assert (=> d!51514 d!51566))

(push 1)

(assert (not b!155760))

(assert (not bm!2282))

(assert (not bm!2281))

(assert (not b!155761))

(assert (not b!155764))

(assert (not d!51558))

(assert (not bm!2280))

(assert (not b!155763))

(check-sat)

(pop 1)

(push 1)

(check-sat)

