; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29730 () Bool)

(assert start!29730)

(declare-fun b!153114 () Bool)

(declare-fun res!128285 () Bool)

(declare-fun e!102569 () Bool)

(assert (=> b!153114 (=> (not res!128285) (not e!102569))))

(declare-fun lt!239531 () (_ BitVec 64))

(declare-datatypes ((array!6874 0))(
  ( (array!6875 (arr!3924 (Array (_ BitVec 32) (_ BitVec 8))) (size!3101 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5460 0))(
  ( (BitStream!5461 (buf!3604 array!6874) (currentByte!6590 (_ BitVec 32)) (currentBit!6585 (_ BitVec 32))) )
))
(declare-fun bs2!18 () BitStream!5460)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!153114 (= res!128285 (bvsle lt!239531 (bitIndex!0 (size!3101 (buf!3604 bs2!18)) (currentByte!6590 bs2!18) (currentBit!6585 bs2!18))))))

(declare-fun res!128284 () Bool)

(declare-fun e!102571 () Bool)

(assert (=> start!29730 (=> (not res!128284) (not e!102571))))

(declare-fun bs1!10 () BitStream!5460)

(assert (=> start!29730 (= res!128284 (= (size!3101 (buf!3604 bs1!10)) (size!3101 (buf!3604 bs2!18))))))

(assert (=> start!29730 e!102571))

(declare-fun e!102570 () Bool)

(declare-fun inv!12 (BitStream!5460) Bool)

(assert (=> start!29730 (and (inv!12 bs1!10) e!102570)))

(declare-fun e!102572 () Bool)

(assert (=> start!29730 (and (inv!12 bs2!18) e!102572)))

(declare-fun b!153115 () Bool)

(declare-fun array_inv!2890 (array!6874) Bool)

(assert (=> b!153115 (= e!102570 (array_inv!2890 (buf!3604 bs1!10)))))

(declare-fun b!153116 () Bool)

(assert (=> b!153116 (= e!102571 e!102569)))

(declare-fun res!128283 () Bool)

(assert (=> b!153116 (=> (not res!128283) (not e!102569))))

(assert (=> b!153116 (= res!128283 (bvsle lt!239531 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3101 (buf!3604 bs1!10))))))))

(assert (=> b!153116 (= lt!239531 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3101 (buf!3604 bs1!10)) (currentByte!6590 bs1!10) (currentBit!6585 bs1!10))))))

(declare-fun b!153117 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!153117 (= e!102569 (not (invariant!0 (currentBit!6585 bs1!10) (currentByte!6590 bs1!10) (size!3101 (buf!3604 bs1!10)))))))

(declare-datatypes ((tuple2!13584 0))(
  ( (tuple2!13585 (_1!7179 BitStream!5460) (_2!7179 (_ BitVec 8))) )
))
(declare-fun lt!239532 () tuple2!13584)

(declare-fun readBytePure!0 (BitStream!5460) tuple2!13584)

(assert (=> b!153117 (= lt!239532 (readBytePure!0 (BitStream!5461 (buf!3604 bs2!18) (currentByte!6590 bs1!10) (currentBit!6585 bs1!10))))))

(declare-fun lt!239533 () tuple2!13584)

(assert (=> b!153117 (= lt!239533 (readBytePure!0 bs1!10))))

(declare-fun b!153118 () Bool)

(declare-fun res!128286 () Bool)

(assert (=> b!153118 (=> (not res!128286) (not e!102569))))

(declare-fun arrayBitRangesEq!0 (array!6874 array!6874 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!153118 (= res!128286 (arrayBitRangesEq!0 (buf!3604 bs1!10) (buf!3604 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!239531))))

(declare-fun b!153119 () Bool)

(assert (=> b!153119 (= e!102572 (array_inv!2890 (buf!3604 bs2!18)))))

(assert (= (and start!29730 res!128284) b!153116))

(assert (= (and b!153116 res!128283) b!153114))

(assert (= (and b!153114 res!128285) b!153118))

(assert (= (and b!153118 res!128286) b!153117))

(assert (= start!29730 b!153115))

(assert (= start!29730 b!153119))

(declare-fun m!238923 () Bool)

(assert (=> b!153114 m!238923))

(declare-fun m!238925 () Bool)

(assert (=> b!153118 m!238925))

(declare-fun m!238927 () Bool)

(assert (=> b!153115 m!238927))

(declare-fun m!238929 () Bool)

(assert (=> b!153117 m!238929))

(declare-fun m!238931 () Bool)

(assert (=> b!153117 m!238931))

(declare-fun m!238933 () Bool)

(assert (=> b!153117 m!238933))

(declare-fun m!238935 () Bool)

(assert (=> b!153116 m!238935))

(declare-fun m!238937 () Bool)

(assert (=> b!153119 m!238937))

(declare-fun m!238939 () Bool)

(assert (=> start!29730 m!238939))

(declare-fun m!238941 () Bool)

(assert (=> start!29730 m!238941))

(check-sat (not b!153114) (not b!153116) (not b!153117) (not b!153115) (not b!153118) (not b!153119) (not start!29730))
(check-sat)
(get-model)

(declare-fun d!50366 () Bool)

(assert (=> d!50366 (= (invariant!0 (currentBit!6585 bs1!10) (currentByte!6590 bs1!10) (size!3101 (buf!3604 bs1!10))) (and (bvsge (currentBit!6585 bs1!10) #b00000000000000000000000000000000) (bvslt (currentBit!6585 bs1!10) #b00000000000000000000000000001000) (bvsge (currentByte!6590 bs1!10) #b00000000000000000000000000000000) (or (bvslt (currentByte!6590 bs1!10) (size!3101 (buf!3604 bs1!10))) (and (= (currentBit!6585 bs1!10) #b00000000000000000000000000000000) (= (currentByte!6590 bs1!10) (size!3101 (buf!3604 bs1!10)))))))))

(assert (=> b!153117 d!50366))

(declare-fun d!50368 () Bool)

(declare-datatypes ((tuple2!13588 0))(
  ( (tuple2!13589 (_1!7181 (_ BitVec 8)) (_2!7181 BitStream!5460)) )
))
(declare-fun lt!239545 () tuple2!13588)

(declare-fun readByte!0 (BitStream!5460) tuple2!13588)

(assert (=> d!50368 (= lt!239545 (readByte!0 (BitStream!5461 (buf!3604 bs2!18) (currentByte!6590 bs1!10) (currentBit!6585 bs1!10))))))

(assert (=> d!50368 (= (readBytePure!0 (BitStream!5461 (buf!3604 bs2!18) (currentByte!6590 bs1!10) (currentBit!6585 bs1!10))) (tuple2!13585 (_2!7181 lt!239545) (_1!7181 lt!239545)))))

(declare-fun bs!12317 () Bool)

(assert (= bs!12317 d!50368))

(declare-fun m!238963 () Bool)

(assert (=> bs!12317 m!238963))

(assert (=> b!153117 d!50368))

(declare-fun d!50370 () Bool)

(declare-fun lt!239546 () tuple2!13588)

(assert (=> d!50370 (= lt!239546 (readByte!0 bs1!10))))

(assert (=> d!50370 (= (readBytePure!0 bs1!10) (tuple2!13585 (_2!7181 lt!239546) (_1!7181 lt!239546)))))

(declare-fun bs!12318 () Bool)

(assert (= bs!12318 d!50370))

(declare-fun m!238965 () Bool)

(assert (=> bs!12318 m!238965))

(assert (=> b!153117 d!50370))

(declare-fun d!50372 () Bool)

(assert (=> d!50372 (= (inv!12 bs1!10) (invariant!0 (currentBit!6585 bs1!10) (currentByte!6590 bs1!10) (size!3101 (buf!3604 bs1!10))))))

(declare-fun bs!12319 () Bool)

(assert (= bs!12319 d!50372))

(assert (=> bs!12319 m!238929))

(assert (=> start!29730 d!50372))

(declare-fun d!50374 () Bool)

(assert (=> d!50374 (= (inv!12 bs2!18) (invariant!0 (currentBit!6585 bs2!18) (currentByte!6590 bs2!18) (size!3101 (buf!3604 bs2!18))))))

(declare-fun bs!12320 () Bool)

(assert (= bs!12320 d!50374))

(declare-fun m!238967 () Bool)

(assert (=> bs!12320 m!238967))

(assert (=> start!29730 d!50374))

(declare-fun d!50376 () Bool)

(declare-fun e!102594 () Bool)

(assert (=> d!50376 e!102594))

(declare-fun res!128304 () Bool)

(assert (=> d!50376 (=> (not res!128304) (not e!102594))))

(declare-fun lt!239562 () (_ BitVec 64))

(declare-fun lt!239565 () (_ BitVec 64))

(declare-fun lt!239563 () (_ BitVec 64))

(assert (=> d!50376 (= res!128304 (= lt!239562 (bvsub lt!239565 lt!239563)))))

(assert (=> d!50376 (or (= (bvand lt!239565 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!239563 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!239565 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!239565 lt!239563) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!50376 (= lt!239563 (remainingBits!0 ((_ sign_extend 32) (size!3101 (buf!3604 bs1!10))) ((_ sign_extend 32) (currentByte!6590 bs1!10)) ((_ sign_extend 32) (currentBit!6585 bs1!10))))))

(declare-fun lt!239564 () (_ BitVec 64))

(declare-fun lt!239561 () (_ BitVec 64))

(assert (=> d!50376 (= lt!239565 (bvmul lt!239564 lt!239561))))

(assert (=> d!50376 (or (= lt!239564 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!239561 (bvsdiv (bvmul lt!239564 lt!239561) lt!239564)))))

(assert (=> d!50376 (= lt!239561 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50376 (= lt!239564 ((_ sign_extend 32) (size!3101 (buf!3604 bs1!10))))))

(assert (=> d!50376 (= lt!239562 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6590 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6585 bs1!10))))))

(assert (=> d!50376 (invariant!0 (currentBit!6585 bs1!10) (currentByte!6590 bs1!10) (size!3101 (buf!3604 bs1!10)))))

(assert (=> d!50376 (= (bitIndex!0 (size!3101 (buf!3604 bs1!10)) (currentByte!6590 bs1!10) (currentBit!6585 bs1!10)) lt!239562)))

(declare-fun b!153142 () Bool)

(declare-fun res!128303 () Bool)

(assert (=> b!153142 (=> (not res!128303) (not e!102594))))

(assert (=> b!153142 (= res!128303 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!239562))))

(declare-fun b!153143 () Bool)

(declare-fun lt!239566 () (_ BitVec 64))

(assert (=> b!153143 (= e!102594 (bvsle lt!239562 (bvmul lt!239566 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!153143 (or (= lt!239566 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!239566 #b0000000000000000000000000000000000000000000000000000000000001000) lt!239566)))))

(assert (=> b!153143 (= lt!239566 ((_ sign_extend 32) (size!3101 (buf!3604 bs1!10))))))

(assert (= (and d!50376 res!128304) b!153142))

(assert (= (and b!153142 res!128303) b!153143))

(declare-fun m!238971 () Bool)

(assert (=> d!50376 m!238971))

(assert (=> d!50376 m!238929))

(assert (=> b!153116 d!50376))

(declare-fun d!50386 () Bool)

(declare-fun e!102597 () Bool)

(assert (=> d!50386 e!102597))

(declare-fun res!128310 () Bool)

(assert (=> d!50386 (=> (not res!128310) (not e!102597))))

(declare-fun lt!239579 () (_ BitVec 64))

(declare-fun lt!239581 () (_ BitVec 64))

(declare-fun lt!239578 () (_ BitVec 64))

(assert (=> d!50386 (= res!128310 (= lt!239578 (bvsub lt!239581 lt!239579)))))

(assert (=> d!50386 (or (= (bvand lt!239581 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!239579 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!239581 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!239581 lt!239579) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50386 (= lt!239579 (remainingBits!0 ((_ sign_extend 32) (size!3101 (buf!3604 bs2!18))) ((_ sign_extend 32) (currentByte!6590 bs2!18)) ((_ sign_extend 32) (currentBit!6585 bs2!18))))))

(declare-fun lt!239580 () (_ BitVec 64))

(declare-fun lt!239577 () (_ BitVec 64))

(assert (=> d!50386 (= lt!239581 (bvmul lt!239580 lt!239577))))

(assert (=> d!50386 (or (= lt!239580 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!239577 (bvsdiv (bvmul lt!239580 lt!239577) lt!239580)))))

(assert (=> d!50386 (= lt!239577 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50386 (= lt!239580 ((_ sign_extend 32) (size!3101 (buf!3604 bs2!18))))))

(assert (=> d!50386 (= lt!239578 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6590 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6585 bs2!18))))))

(assert (=> d!50386 (invariant!0 (currentBit!6585 bs2!18) (currentByte!6590 bs2!18) (size!3101 (buf!3604 bs2!18)))))

(assert (=> d!50386 (= (bitIndex!0 (size!3101 (buf!3604 bs2!18)) (currentByte!6590 bs2!18) (currentBit!6585 bs2!18)) lt!239578)))

(declare-fun b!153148 () Bool)

(declare-fun res!128309 () Bool)

(assert (=> b!153148 (=> (not res!128309) (not e!102597))))

(assert (=> b!153148 (= res!128309 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!239578))))

(declare-fun b!153149 () Bool)

(declare-fun lt!239582 () (_ BitVec 64))

(assert (=> b!153149 (= e!102597 (bvsle lt!239578 (bvmul lt!239582 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!153149 (or (= lt!239582 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!239582 #b0000000000000000000000000000000000000000000000000000000000001000) lt!239582)))))

(assert (=> b!153149 (= lt!239582 ((_ sign_extend 32) (size!3101 (buf!3604 bs2!18))))))

(assert (= (and d!50386 res!128310) b!153148))

(assert (= (and b!153148 res!128309) b!153149))

(declare-fun m!238973 () Bool)

(assert (=> d!50386 m!238973))

(assert (=> d!50386 m!238967))

(assert (=> b!153114 d!50386))

(declare-fun d!50388 () Bool)

(assert (=> d!50388 (= (array_inv!2890 (buf!3604 bs1!10)) (bvsge (size!3101 (buf!3604 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!153115 d!50388))

(declare-fun d!50390 () Bool)

(declare-fun res!128335 () Bool)

(declare-fun e!102616 () Bool)

(assert (=> d!50390 (=> res!128335 e!102616)))

(assert (=> d!50390 (= res!128335 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!239531))))

(assert (=> d!50390 (= (arrayBitRangesEq!0 (buf!3604 bs1!10) (buf!3604 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!239531) e!102616)))

(declare-fun e!102617 () Bool)

(declare-datatypes ((tuple4!168 0))(
  ( (tuple4!169 (_1!7183 (_ BitVec 32)) (_2!7183 (_ BitVec 32)) (_3!387 (_ BitVec 32)) (_4!84 (_ BitVec 32))) )
))
(declare-fun lt!239634 () tuple4!168)

(declare-fun b!153176 () Bool)

(declare-fun arrayRangesEq!377 (array!6874 array!6874 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!153176 (= e!102617 (arrayRangesEq!377 (buf!3604 bs1!10) (buf!3604 bs2!18) (_1!7183 lt!239634) (_2!7183 lt!239634)))))

(declare-fun b!153177 () Bool)

(declare-fun e!102620 () Bool)

(declare-fun e!102621 () Bool)

(assert (=> b!153177 (= e!102620 e!102621)))

(declare-fun c!8178 () Bool)

(assert (=> b!153177 (= c!8178 (= (_3!387 lt!239634) (_4!84 lt!239634)))))

(declare-fun b!153178 () Bool)

(declare-fun e!102618 () Bool)

(declare-fun call!2162 () Bool)

(assert (=> b!153178 (= e!102618 call!2162)))

(declare-fun lt!239633 () (_ BitVec 32))

(declare-fun lt!239635 () (_ BitVec 32))

(declare-fun bm!2159 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!2159 (= call!2162 (byteRangesEq!0 (ite c!8178 (select (arr!3924 (buf!3604 bs1!10)) (_3!387 lt!239634)) (select (arr!3924 (buf!3604 bs1!10)) (_4!84 lt!239634))) (ite c!8178 (select (arr!3924 (buf!3604 bs2!18)) (_3!387 lt!239634)) (select (arr!3924 (buf!3604 bs2!18)) (_4!84 lt!239634))) (ite c!8178 lt!239635 #b00000000000000000000000000000000) lt!239633))))

(declare-fun b!153179 () Bool)

(assert (=> b!153179 (= e!102616 e!102620)))

(declare-fun res!128334 () Bool)

(assert (=> b!153179 (=> (not res!128334) (not e!102620))))

(assert (=> b!153179 (= res!128334 e!102617)))

(declare-fun res!128336 () Bool)

(assert (=> b!153179 (=> res!128336 e!102617)))

(assert (=> b!153179 (= res!128336 (bvsge (_1!7183 lt!239634) (_2!7183 lt!239634)))))

(assert (=> b!153179 (= lt!239633 ((_ extract 31 0) (bvsrem lt!239531 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!153179 (= lt!239635 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!168)

(assert (=> b!153179 (= lt!239634 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!239531))))

(declare-fun b!153180 () Bool)

(assert (=> b!153180 (= e!102621 call!2162)))

(declare-fun b!153181 () Bool)

(declare-fun e!102619 () Bool)

(assert (=> b!153181 (= e!102621 e!102619)))

(declare-fun res!128333 () Bool)

(assert (=> b!153181 (= res!128333 (byteRangesEq!0 (select (arr!3924 (buf!3604 bs1!10)) (_3!387 lt!239634)) (select (arr!3924 (buf!3604 bs2!18)) (_3!387 lt!239634)) lt!239635 #b00000000000000000000000000001000))))

(assert (=> b!153181 (=> (not res!128333) (not e!102619))))

(declare-fun b!153182 () Bool)

(declare-fun res!128337 () Bool)

(assert (=> b!153182 (= res!128337 (= lt!239633 #b00000000000000000000000000000000))))

(assert (=> b!153182 (=> res!128337 e!102618)))

(assert (=> b!153182 (= e!102619 e!102618)))

(assert (= (and d!50390 (not res!128335)) b!153179))

(assert (= (and b!153179 (not res!128336)) b!153176))

(assert (= (and b!153179 res!128334) b!153177))

(assert (= (and b!153177 c!8178) b!153180))

(assert (= (and b!153177 (not c!8178)) b!153181))

(assert (= (and b!153181 res!128333) b!153182))

(assert (= (and b!153182 (not res!128337)) b!153178))

(assert (= (or b!153180 b!153178) bm!2159))

(declare-fun m!238993 () Bool)

(assert (=> b!153176 m!238993))

(declare-fun m!238995 () Bool)

(assert (=> bm!2159 m!238995))

(declare-fun m!238997 () Bool)

(assert (=> bm!2159 m!238997))

(declare-fun m!238999 () Bool)

(assert (=> bm!2159 m!238999))

(declare-fun m!239001 () Bool)

(assert (=> bm!2159 m!239001))

(declare-fun m!239003 () Bool)

(assert (=> bm!2159 m!239003))

(declare-fun m!239005 () Bool)

(assert (=> b!153179 m!239005))

(assert (=> b!153181 m!238997))

(assert (=> b!153181 m!238995))

(assert (=> b!153181 m!238997))

(assert (=> b!153181 m!238995))

(declare-fun m!239007 () Bool)

(assert (=> b!153181 m!239007))

(assert (=> b!153118 d!50390))

(declare-fun d!50424 () Bool)

(assert (=> d!50424 (= (array_inv!2890 (buf!3604 bs2!18)) (bvsge (size!3101 (buf!3604 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!153119 d!50424))

(check-sat (not d!50386) (not bm!2159) (not b!153176) (not d!50374) (not d!50370) (not d!50368) (not d!50376) (not b!153181) (not d!50372) (not b!153179))
