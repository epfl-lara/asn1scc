; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29686 () Bool)

(assert start!29686)

(declare-fun b!152955 () Bool)

(declare-fun e!102432 () Bool)

(declare-fun e!102430 () Bool)

(assert (=> b!152955 (= e!102432 e!102430)))

(declare-fun res!128168 () Bool)

(assert (=> b!152955 (=> (not res!128168) (not e!102430))))

(declare-fun lt!239394 () (_ BitVec 64))

(declare-datatypes ((array!6863 0))(
  ( (array!6864 (arr!3920 (Array (_ BitVec 32) (_ BitVec 8))) (size!3097 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5452 0))(
  ( (BitStream!5453 (buf!3600 array!6863) (currentByte!6580 (_ BitVec 32)) (currentBit!6575 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5452)

(assert (=> b!152955 (= res!128168 (bvsle lt!239394 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3097 (buf!3600 bs1!10))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!152955 (= lt!239394 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3097 (buf!3600 bs1!10)) (currentByte!6580 bs1!10) (currentBit!6575 bs1!10))))))

(declare-fun res!128169 () Bool)

(assert (=> start!29686 (=> (not res!128169) (not e!102432))))

(declare-fun bs2!18 () BitStream!5452)

(assert (=> start!29686 (= res!128169 (= (size!3097 (buf!3600 bs1!10)) (size!3097 (buf!3600 bs2!18))))))

(assert (=> start!29686 e!102432))

(declare-fun e!102431 () Bool)

(declare-fun inv!12 (BitStream!5452) Bool)

(assert (=> start!29686 (and (inv!12 bs1!10) e!102431)))

(declare-fun e!102434 () Bool)

(assert (=> start!29686 (and (inv!12 bs2!18) e!102434)))

(declare-fun b!152956 () Bool)

(declare-fun array_inv!2886 (array!6863) Bool)

(assert (=> b!152956 (= e!102431 (array_inv!2886 (buf!3600 bs1!10)))))

(declare-fun b!152957 () Bool)

(declare-fun res!128167 () Bool)

(assert (=> b!152957 (=> (not res!128167) (not e!102430))))

(declare-fun arrayBitRangesEq!0 (array!6863 array!6863 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!152957 (= res!128167 (arrayBitRangesEq!0 (buf!3600 bs1!10) (buf!3600 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!239394))))

(declare-fun b!152958 () Bool)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!152958 (= e!102430 (not (validate_offset_byte!0 ((_ sign_extend 32) (size!3097 (buf!3600 bs2!18))) ((_ sign_extend 32) (currentByte!6580 bs1!10)) ((_ sign_extend 32) (currentBit!6575 bs1!10)))))))

(declare-datatypes ((tuple2!13570 0))(
  ( (tuple2!13571 (_1!7169 BitStream!5452) (_2!7169 (_ BitVec 8))) )
))
(declare-fun lt!239395 () tuple2!13570)

(declare-fun readBytePure!0 (BitStream!5452) tuple2!13570)

(assert (=> b!152958 (= lt!239395 (readBytePure!0 bs1!10))))

(declare-fun b!152959 () Bool)

(assert (=> b!152959 (= e!102434 (array_inv!2886 (buf!3600 bs2!18)))))

(declare-fun b!152960 () Bool)

(declare-fun res!128166 () Bool)

(assert (=> b!152960 (=> (not res!128166) (not e!102430))))

(assert (=> b!152960 (= res!128166 (bvsle lt!239394 (bitIndex!0 (size!3097 (buf!3600 bs2!18)) (currentByte!6580 bs2!18) (currentBit!6575 bs2!18))))))

(assert (= (and start!29686 res!128169) b!152955))

(assert (= (and b!152955 res!128168) b!152960))

(assert (= (and b!152960 res!128166) b!152957))

(assert (= (and b!152957 res!128167) b!152958))

(assert (= start!29686 b!152956))

(assert (= start!29686 b!152959))

(declare-fun m!238765 () Bool)

(assert (=> b!152959 m!238765))

(declare-fun m!238767 () Bool)

(assert (=> b!152958 m!238767))

(declare-fun m!238769 () Bool)

(assert (=> b!152958 m!238769))

(declare-fun m!238771 () Bool)

(assert (=> b!152960 m!238771))

(declare-fun m!238773 () Bool)

(assert (=> b!152955 m!238773))

(declare-fun m!238775 () Bool)

(assert (=> b!152957 m!238775))

(declare-fun m!238777 () Bool)

(assert (=> start!29686 m!238777))

(declare-fun m!238779 () Bool)

(assert (=> start!29686 m!238779))

(declare-fun m!238781 () Bool)

(assert (=> b!152956 m!238781))

(push 1)

(assert (not b!152955))

(assert (not b!152956))

(assert (not b!152958))

(assert (not b!152957))

(assert (not b!152959))

(assert (not b!152960))

(assert (not start!29686))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!50314 () Bool)

(declare-fun e!102492 () Bool)

(assert (=> d!50314 e!102492))

(declare-fun res!128214 () Bool)

(assert (=> d!50314 (=> (not res!128214) (not e!102492))))

(declare-fun lt!239433 () (_ BitVec 64))

(declare-fun lt!239429 () (_ BitVec 64))

(declare-fun lt!239430 () (_ BitVec 64))

(assert (=> d!50314 (= res!128214 (= lt!239430 (bvsub lt!239429 lt!239433)))))

(assert (=> d!50314 (or (= (bvand lt!239429 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!239433 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!239429 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!239429 lt!239433) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!50314 (= lt!239433 (remainingBits!0 ((_ sign_extend 32) (size!3097 (buf!3600 bs2!18))) ((_ sign_extend 32) (currentByte!6580 bs2!18)) ((_ sign_extend 32) (currentBit!6575 bs2!18))))))

(declare-fun lt!239432 () (_ BitVec 64))

(declare-fun lt!239431 () (_ BitVec 64))

(assert (=> d!50314 (= lt!239429 (bvmul lt!239432 lt!239431))))

(assert (=> d!50314 (or (= lt!239432 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!239431 (bvsdiv (bvmul lt!239432 lt!239431) lt!239432)))))

(assert (=> d!50314 (= lt!239431 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50314 (= lt!239432 ((_ sign_extend 32) (size!3097 (buf!3600 bs2!18))))))

(assert (=> d!50314 (= lt!239430 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6580 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6575 bs2!18))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!50314 (invariant!0 (currentBit!6575 bs2!18) (currentByte!6580 bs2!18) (size!3097 (buf!3600 bs2!18)))))

(assert (=> d!50314 (= (bitIndex!0 (size!3097 (buf!3600 bs2!18)) (currentByte!6580 bs2!18) (currentBit!6575 bs2!18)) lt!239430)))

(declare-fun b!153022 () Bool)

(declare-fun res!128213 () Bool)

(assert (=> b!153022 (=> (not res!128213) (not e!102492))))

(assert (=> b!153022 (= res!128213 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!239430))))

(declare-fun b!153023 () Bool)

(declare-fun lt!239434 () (_ BitVec 64))

(assert (=> b!153023 (= e!102492 (bvsle lt!239430 (bvmul lt!239434 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!153023 (or (= lt!239434 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!239434 #b0000000000000000000000000000000000000000000000000000000000001000) lt!239434)))))

(assert (=> b!153023 (= lt!239434 ((_ sign_extend 32) (size!3097 (buf!3600 bs2!18))))))

(assert (= (and d!50314 res!128214) b!153022))

(assert (= (and b!153022 res!128213) b!153023))

(declare-fun m!238839 () Bool)

(assert (=> d!50314 m!238839))

(declare-fun m!238841 () Bool)

(assert (=> d!50314 m!238841))

(assert (=> b!152960 d!50314))

(declare-fun d!50330 () Bool)

(assert (=> d!50330 (= (array_inv!2886 (buf!3600 bs2!18)) (bvsge (size!3097 (buf!3600 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!152959 d!50330))

(declare-fun d!50332 () Bool)

(assert (=> d!50332 (= (inv!12 bs1!10) (invariant!0 (currentBit!6575 bs1!10) (currentByte!6580 bs1!10) (size!3097 (buf!3600 bs1!10))))))

(declare-fun bs!12304 () Bool)

(assert (= bs!12304 d!50332))

(declare-fun m!238843 () Bool)

(assert (=> bs!12304 m!238843))

(assert (=> start!29686 d!50332))

(declare-fun d!50334 () Bool)

(assert (=> d!50334 (= (inv!12 bs2!18) (invariant!0 (currentBit!6575 bs2!18) (currentByte!6580 bs2!18) (size!3097 (buf!3600 bs2!18))))))

(declare-fun bs!12305 () Bool)

(assert (= bs!12305 d!50334))

(assert (=> bs!12305 m!238841))

(assert (=> start!29686 d!50334))

(declare-fun d!50336 () Bool)

(assert (=> d!50336 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3097 (buf!3600 bs2!18))) ((_ sign_extend 32) (currentByte!6580 bs1!10)) ((_ sign_extend 32) (currentBit!6575 bs1!10))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3097 (buf!3600 bs2!18))) ((_ sign_extend 32) (currentByte!6580 bs1!10)) ((_ sign_extend 32) (currentBit!6575 bs1!10))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!12306 () Bool)

(assert (= bs!12306 d!50336))

(declare-fun m!238845 () Bool)

(assert (=> bs!12306 m!238845))

(assert (=> b!152958 d!50336))

(declare-fun d!50338 () Bool)

(declare-datatypes ((tuple2!13578 0))(
  ( (tuple2!13579 (_1!7174 (_ BitVec 8)) (_2!7174 BitStream!5452)) )
))
(declare-fun lt!239449 () tuple2!13578)

(declare-fun readByte!0 (BitStream!5452) tuple2!13578)

(assert (=> d!50338 (= lt!239449 (readByte!0 bs1!10))))

(assert (=> d!50338 (= (readBytePure!0 bs1!10) (tuple2!13571 (_2!7174 lt!239449) (_1!7174 lt!239449)))))

(declare-fun bs!12307 () Bool)

(assert (= bs!12307 d!50338))

(declare-fun m!238847 () Bool)

(assert (=> bs!12307 m!238847))

(assert (=> b!152958 d!50338))

(declare-fun b!153075 () Bool)

(declare-fun e!102534 () Bool)

(declare-fun e!102536 () Bool)

(assert (=> b!153075 (= e!102534 e!102536)))

(declare-fun c!8175 () Bool)

(declare-datatypes ((tuple4!164 0))(
  ( (tuple4!165 (_1!7175 (_ BitVec 32)) (_2!7175 (_ BitVec 32)) (_3!385 (_ BitVec 32)) (_4!82 (_ BitVec 32))) )
))
(declare-fun lt!239506 () tuple4!164)

(assert (=> b!153075 (= c!8175 (= (_3!385 lt!239506) (_4!82 lt!239506)))))

(declare-fun b!153076 () Bool)

(declare-fun e!102535 () Bool)

(assert (=> b!153076 (= e!102535 e!102534)))

(declare-fun res!128260 () Bool)

(assert (=> b!153076 (=> (not res!128260) (not e!102534))))

(declare-fun e!102531 () Bool)

(assert (=> b!153076 (= res!128260 e!102531)))

(declare-fun res!128256 () Bool)

(assert (=> b!153076 (=> res!128256 e!102531)))

(assert (=> b!153076 (= res!128256 (bvsge (_1!7175 lt!239506) (_2!7175 lt!239506)))))

(declare-fun lt!239504 () (_ BitVec 32))

(assert (=> b!153076 (= lt!239504 ((_ extract 31 0) (bvsrem lt!239394 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!239505 () (_ BitVec 32))

(assert (=> b!153076 (= lt!239505 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!164)

(assert (=> b!153076 (= lt!239506 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!239394))))

(declare-fun b!153077 () Bool)

(declare-fun e!102533 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!153077 (= e!102533 (byteRangesEq!0 (select (arr!3920 (buf!3600 bs1!10)) (_4!82 lt!239506)) (select (arr!3920 (buf!3600 bs2!18)) (_4!82 lt!239506)) #b00000000000000000000000000000000 lt!239504))))

(declare-fun call!2159 () Bool)

(declare-fun bm!2156 () Bool)

(assert (=> bm!2156 (= call!2159 (byteRangesEq!0 (select (arr!3920 (buf!3600 bs1!10)) (_3!385 lt!239506)) (select (arr!3920 (buf!3600 bs2!18)) (_3!385 lt!239506)) lt!239505 (ite c!8175 lt!239504 #b00000000000000000000000000001000)))))

(declare-fun b!153078 () Bool)

(declare-fun arrayRangesEq!375 (array!6863 array!6863 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!153078 (= e!102531 (arrayRangesEq!375 (buf!3600 bs1!10) (buf!3600 bs2!18) (_1!7175 lt!239506) (_2!7175 lt!239506)))))

(declare-fun b!153079 () Bool)

(declare-fun res!128259 () Bool)

(assert (=> b!153079 (= res!128259 (= lt!239504 #b00000000000000000000000000000000))))

(assert (=> b!153079 (=> res!128259 e!102533)))

(declare-fun e!102532 () Bool)

(assert (=> b!153079 (= e!102532 e!102533)))

(declare-fun b!153080 () Bool)

(assert (=> b!153080 (= e!102536 e!102532)))

(declare-fun res!128258 () Bool)

(assert (=> b!153080 (= res!128258 call!2159)))

(assert (=> b!153080 (=> (not res!128258) (not e!102532))))

(declare-fun b!153081 () Bool)

(assert (=> b!153081 (= e!102536 call!2159)))

(declare-fun d!50340 () Bool)

(declare-fun res!128257 () Bool)

(assert (=> d!50340 (=> res!128257 e!102535)))

(assert (=> d!50340 (= res!128257 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!239394))))

(assert (=> d!50340 (= (arrayBitRangesEq!0 (buf!3600 bs1!10) (buf!3600 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!239394) e!102535)))

(assert (= (and d!50340 (not res!128257)) b!153076))

(assert (= (and b!153076 (not res!128256)) b!153078))

(assert (= (and b!153076 res!128260) b!153075))

(assert (= (and b!153075 c!8175) b!153081))

(assert (= (and b!153075 (not c!8175)) b!153080))

(assert (= (and b!153080 res!128258) b!153079))

(assert (= (and b!153079 (not res!128259)) b!153077))

(assert (= (or b!153081 b!153080) bm!2156))

(declare-fun m!238883 () Bool)

(assert (=> b!153076 m!238883))

(declare-fun m!238885 () Bool)

(assert (=> b!153077 m!238885))

(declare-fun m!238887 () Bool)

(assert (=> b!153077 m!238887))

(assert (=> b!153077 m!238885))

(assert (=> b!153077 m!238887))

(declare-fun m!238889 () Bool)

(assert (=> b!153077 m!238889))

(declare-fun m!238891 () Bool)

(assert (=> bm!2156 m!238891))

(declare-fun m!238893 () Bool)

(assert (=> bm!2156 m!238893))

(assert (=> bm!2156 m!238891))

(assert (=> bm!2156 m!238893))

(declare-fun m!238895 () Bool)

(assert (=> bm!2156 m!238895))

(declare-fun m!238897 () Bool)

(assert (=> b!153078 m!238897))

(assert (=> b!152957 d!50340))

(declare-fun d!50360 () Bool)

(assert (=> d!50360 (= (array_inv!2886 (buf!3600 bs1!10)) (bvsge (size!3097 (buf!3600 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!152956 d!50360))

(declare-fun d!50362 () Bool)

(declare-fun e!102537 () Bool)

(assert (=> d!50362 e!102537))

(declare-fun res!128262 () Bool)

(assert (=> d!50362 (=> (not res!128262) (not e!102537))))

(declare-fun lt!239508 () (_ BitVec 64))

(declare-fun lt!239507 () (_ BitVec 64))

(declare-fun lt!239511 () (_ BitVec 64))

(assert (=> d!50362 (= res!128262 (= lt!239508 (bvsub lt!239507 lt!239511)))))

(assert (=> d!50362 (or (= (bvand lt!239507 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!239511 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!239507 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!239507 lt!239511) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50362 (= lt!239511 (remainingBits!0 ((_ sign_extend 32) (size!3097 (buf!3600 bs1!10))) ((_ sign_extend 32) (currentByte!6580 bs1!10)) ((_ sign_extend 32) (currentBit!6575 bs1!10))))))

(declare-fun lt!239510 () (_ BitVec 64))

(declare-fun lt!239509 () (_ BitVec 64))

(assert (=> d!50362 (= lt!239507 (bvmul lt!239510 lt!239509))))

(assert (=> d!50362 (or (= lt!239510 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!239509 (bvsdiv (bvmul lt!239510 lt!239509) lt!239510)))))

(assert (=> d!50362 (= lt!239509 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50362 (= lt!239510 ((_ sign_extend 32) (size!3097 (buf!3600 bs1!10))))))

(assert (=> d!50362 (= lt!239508 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6580 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6575 bs1!10))))))

(assert (=> d!50362 (invariant!0 (currentBit!6575 bs1!10) (currentByte!6580 bs1!10) (size!3097 (buf!3600 bs1!10)))))

(assert (=> d!50362 (= (bitIndex!0 (size!3097 (buf!3600 bs1!10)) (currentByte!6580 bs1!10) (currentBit!6575 bs1!10)) lt!239508)))

(declare-fun b!153082 () Bool)

(declare-fun res!128261 () Bool)

(assert (=> b!153082 (=> (not res!128261) (not e!102537))))

(assert (=> b!153082 (= res!128261 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!239508))))

(declare-fun b!153083 () Bool)

(declare-fun lt!239512 () (_ BitVec 64))

(assert (=> b!153083 (= e!102537 (bvsle lt!239508 (bvmul lt!239512 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!153083 (or (= lt!239512 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!239512 #b0000000000000000000000000000000000000000000000000000000000001000) lt!239512)))))

(assert (=> b!153083 (= lt!239512 ((_ sign_extend 32) (size!3097 (buf!3600 bs1!10))))))

(assert (= (and d!50362 res!128262) b!153082))

(assert (= (and b!153082 res!128261) b!153083))

(declare-fun m!238899 () Bool)

(assert (=> d!50362 m!238899))

(assert (=> d!50362 m!238843))

(assert (=> b!152955 d!50362))

(push 1)

(assert (not d!50336))

(assert (not d!50362))

(assert (not d!50338))

(assert (not d!50332))

(assert (not d!50314))

(assert (not b!153078))

(assert (not b!153077))

(assert (not bm!2156))

(assert (not d!50334))

(assert (not b!153076))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

