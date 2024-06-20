; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30816 () Bool)

(assert start!30816)

(declare-fun b!156205 () Bool)

(declare-fun e!105481 () Bool)

(declare-datatypes ((array!7151 0))(
  ( (array!7152 (arr!4059 (Array (_ BitVec 32) (_ BitVec 8))) (size!3209 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5676 0))(
  ( (BitStream!5677 (buf!3712 array!7151) (currentByte!6812 (_ BitVec 32)) (currentBit!6807 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5676)

(declare-fun array_inv!2998 (array!7151) Bool)

(assert (=> b!156205 (= e!105481 (array_inv!2998 (buf!3712 bs!65)))))

(declare-fun res!130574 () Bool)

(declare-fun e!105480 () Bool)

(assert (=> start!30816 (=> (not res!130574) (not e!105480))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-fun arr!153 () array!7151)

(assert (=> start!30816 (= res!130574 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3209 arr!153))))))

(assert (=> start!30816 e!105480))

(assert (=> start!30816 true))

(assert (=> start!30816 (array_inv!2998 arr!153)))

(declare-fun inv!12 (BitStream!5676) Bool)

(assert (=> start!30816 (and (inv!12 bs!65) e!105481)))

(declare-fun b!156204 () Bool)

(declare-fun e!105482 () Bool)

(declare-fun moveByteIndexPrecond!0 (BitStream!5676 (_ BitVec 32)) Bool)

(assert (=> b!156204 (= e!105482 (not (moveByteIndexPrecond!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun b!156202 () Bool)

(declare-fun res!130573 () Bool)

(assert (=> b!156202 (=> (not res!130573) (not e!105480))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!156202 (= res!130573 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3209 (buf!3712 bs!65))) ((_ sign_extend 32) (currentByte!6812 bs!65)) ((_ sign_extend 32) (currentBit!6807 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!156203 () Bool)

(assert (=> b!156203 (= e!105480 e!105482)))

(declare-fun res!130572 () Bool)

(assert (=> b!156203 (=> (not res!130572) (not e!105482))))

(assert (=> b!156203 (= res!130572 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-datatypes ((tuple2!13928 0))(
  ( (tuple2!13929 (_1!7399 BitStream!5676) (_2!7399 array!7151)) )
))
(declare-fun lt!244011 () tuple2!13928)

(declare-fun readByteArrayLoopPure!0 (BitStream!5676 array!7151 (_ BitVec 32) (_ BitVec 32)) tuple2!13928)

(declare-fun withMovedByteIndex!0 (BitStream!5676 (_ BitVec 32)) BitStream!5676)

(declare-datatypes ((tuple2!13930 0))(
  ( (tuple2!13931 (_1!7400 BitStream!5676) (_2!7400 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5676) tuple2!13930)

(assert (=> b!156203 (= lt!244011 (readByteArrayLoopPure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7152 (store (arr!4059 arr!153) from!240 (_2!7400 (readBytePure!0 bs!65))) (size!3209 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun lt!244012 () tuple2!13928)

(assert (=> b!156203 (= lt!244012 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(assert (= (and start!30816 res!130574) b!156202))

(assert (= (and b!156202 res!130573) b!156203))

(assert (= (and b!156203 res!130572) b!156204))

(assert (= start!30816 b!156205))

(declare-fun m!243185 () Bool)

(assert (=> b!156205 m!243185))

(declare-fun m!243187 () Bool)

(assert (=> b!156203 m!243187))

(declare-fun m!243189 () Bool)

(assert (=> b!156203 m!243189))

(assert (=> b!156203 m!243189))

(declare-fun m!243191 () Bool)

(assert (=> b!156203 m!243191))

(declare-fun m!243193 () Bool)

(assert (=> b!156203 m!243193))

(declare-fun m!243195 () Bool)

(assert (=> b!156203 m!243195))

(declare-fun m!243197 () Bool)

(assert (=> start!30816 m!243197))

(declare-fun m!243199 () Bool)

(assert (=> start!30816 m!243199))

(declare-fun m!243201 () Bool)

(assert (=> b!156204 m!243201))

(declare-fun m!243203 () Bool)

(assert (=> b!156202 m!243203))

(check-sat (not b!156204) (not start!30816) (not b!156202) (not b!156205) (not b!156203))
(check-sat)
(get-model)

(declare-datatypes ((Unit!10016 0))(
  ( (Unit!10017) )
))
(declare-datatypes ((tuple3!640 0))(
  ( (tuple3!641 (_1!7409 Unit!10016) (_2!7409 BitStream!5676) (_3!437 array!7151)) )
))
(declare-fun lt!244035 () tuple3!640)

(declare-fun d!51912 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!5676 array!7151 (_ BitVec 32) (_ BitVec 32)) tuple3!640)

(assert (=> d!51912 (= lt!244035 (readByteArrayLoop!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7152 (store (arr!4059 arr!153) from!240 (_2!7400 (readBytePure!0 bs!65))) (size!3209 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!51912 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7152 (store (arr!4059 arr!153) from!240 (_2!7400 (readBytePure!0 bs!65))) (size!3209 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236) (tuple2!13929 (_2!7409 lt!244035) (_3!437 lt!244035)))))

(declare-fun bs!12708 () Bool)

(assert (= bs!12708 d!51912))

(assert (=> bs!12708 m!243189))

(declare-fun m!243249 () Bool)

(assert (=> bs!12708 m!243249))

(assert (=> b!156203 d!51912))

(declare-fun d!51914 () Bool)

(declare-datatypes ((tuple2!13944 0))(
  ( (tuple2!13945 (_1!7410 Unit!10016) (_2!7410 BitStream!5676)) )
))
(declare-fun moveByteIndex!0 (BitStream!5676 (_ BitVec 32)) tuple2!13944)

(assert (=> d!51914 (= (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7410 (moveByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun bs!12709 () Bool)

(assert (= bs!12709 d!51914))

(declare-fun m!243251 () Bool)

(assert (=> bs!12709 m!243251))

(assert (=> b!156203 d!51914))

(declare-fun d!51916 () Bool)

(declare-datatypes ((tuple2!13946 0))(
  ( (tuple2!13947 (_1!7411 (_ BitVec 8)) (_2!7411 BitStream!5676)) )
))
(declare-fun lt!244038 () tuple2!13946)

(declare-fun readByte!0 (BitStream!5676) tuple2!13946)

(assert (=> d!51916 (= lt!244038 (readByte!0 bs!65))))

(assert (=> d!51916 (= (readBytePure!0 bs!65) (tuple2!13931 (_2!7411 lt!244038) (_1!7411 lt!244038)))))

(declare-fun bs!12710 () Bool)

(assert (= bs!12710 d!51916))

(declare-fun m!243253 () Bool)

(assert (=> bs!12710 m!243253))

(assert (=> b!156203 d!51916))

(declare-fun d!51918 () Bool)

(declare-fun lt!244039 () tuple3!640)

(assert (=> d!51918 (= lt!244039 (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236))))

(assert (=> d!51918 (= (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236) (tuple2!13929 (_2!7409 lt!244039) (_3!437 lt!244039)))))

(declare-fun bs!12711 () Bool)

(assert (= bs!12711 d!51918))

(declare-fun m!243255 () Bool)

(assert (=> bs!12711 m!243255))

(assert (=> b!156203 d!51918))

(declare-fun d!51920 () Bool)

(assert (=> d!51920 (= (moveByteIndexPrecond!0 bs!65 #b00000000000000000000000000000001) (and (bvsle (bvneg (size!3209 (buf!3712 bs!65))) #b00000000000000000000000000000001) (bvsle #b00000000000000000000000000000001 (size!3209 (buf!3712 bs!65))) (let ((res!99 (bvadd ((_ sign_extend 32) (currentByte!6812 bs!65)) ((_ sign_extend 32) #b00000000000000000000000000000001)))) (or (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 res!99) (bvslt res!99 ((_ sign_extend 32) (size!3209 (buf!3712 bs!65))))) (and (= (currentBit!6807 bs!65) #b00000000000000000000000000000000) (= res!99 ((_ sign_extend 32) (size!3209 (buf!3712 bs!65)))))))))))

(assert (=> b!156204 d!51920))

(declare-fun d!51922 () Bool)

(assert (=> d!51922 (= (array_inv!2998 (buf!3712 bs!65)) (bvsge (size!3209 (buf!3712 bs!65)) #b00000000000000000000000000000000))))

(assert (=> b!156205 d!51922))

(declare-fun d!51924 () Bool)

(assert (=> d!51924 (= (array_inv!2998 arr!153) (bvsge (size!3209 arr!153) #b00000000000000000000000000000000))))

(assert (=> start!30816 d!51924))

(declare-fun d!51926 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!51926 (= (inv!12 bs!65) (invariant!0 (currentBit!6807 bs!65) (currentByte!6812 bs!65) (size!3209 (buf!3712 bs!65))))))

(declare-fun bs!12712 () Bool)

(assert (= bs!12712 d!51926))

(declare-fun m!243257 () Bool)

(assert (=> bs!12712 m!243257))

(assert (=> start!30816 d!51926))

(declare-fun d!51928 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!51928 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3209 (buf!3712 bs!65))) ((_ sign_extend 32) (currentByte!6812 bs!65)) ((_ sign_extend 32) (currentBit!6807 bs!65)) (bvsub to!236 from!240)) (bvsle ((_ sign_extend 32) (bvsub to!236 from!240)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3209 (buf!3712 bs!65))) ((_ sign_extend 32) (currentByte!6812 bs!65)) ((_ sign_extend 32) (currentBit!6807 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12713 () Bool)

(assert (= bs!12713 d!51928))

(declare-fun m!243259 () Bool)

(assert (=> bs!12713 m!243259))

(assert (=> b!156202 d!51928))

(check-sat (not d!51918) (not d!51914) (not d!51912) (not d!51926) (not d!51916) (not d!51928))
(check-sat)
(get-model)

(declare-fun d!51936 () Bool)

(assert (=> d!51936 (= (invariant!0 (currentBit!6807 bs!65) (currentByte!6812 bs!65) (size!3209 (buf!3712 bs!65))) (and (bvsge (currentBit!6807 bs!65) #b00000000000000000000000000000000) (bvslt (currentBit!6807 bs!65) #b00000000000000000000000000001000) (bvsge (currentByte!6812 bs!65) #b00000000000000000000000000000000) (or (bvslt (currentByte!6812 bs!65) (size!3209 (buf!3712 bs!65))) (and (= (currentBit!6807 bs!65) #b00000000000000000000000000000000) (= (currentByte!6812 bs!65) (size!3209 (buf!3712 bs!65)))))))))

(assert (=> d!51926 d!51936))

(declare-fun lt!244383 () array!7151)

(declare-fun lt!244386 () array!7151)

(declare-fun c!8325 () Bool)

(declare-fun call!2408 () Bool)

(declare-fun lt!244389 () (_ BitVec 32))

(declare-fun lt!244376 () (_ BitVec 32))

(declare-fun bm!2404 () Bool)

(declare-fun lt!244382 () tuple2!13946)

(declare-fun arrayRangesEq!424 (array!7151 array!7151 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!2404 (= call!2408 (arrayRangesEq!424 (ite c!8325 (array!7152 (store (arr!4059 arr!153) from!240 (_2!7400 (readBytePure!0 bs!65))) (size!3209 arr!153)) lt!244386) (ite c!8325 (array!7152 (store (arr!4059 (array!7152 (store (arr!4059 arr!153) from!240 (_2!7400 (readBytePure!0 bs!65))) (size!3209 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7411 lt!244382)) (size!3209 (array!7152 (store (arr!4059 arr!153) from!240 (_2!7400 (readBytePure!0 bs!65))) (size!3209 arr!153)))) lt!244383) (ite c!8325 #b00000000000000000000000000000000 lt!244376) (ite c!8325 (bvadd #b00000000000000000000000000000001 from!240) lt!244389)))))

(declare-fun e!105533 () Bool)

(declare-fun b!156270 () Bool)

(declare-fun lt!244379 () tuple3!640)

(assert (=> b!156270 (= e!105533 (= (select (arr!4059 (_3!437 lt!244379)) (bvadd #b00000000000000000000000000000001 from!240)) (_2!7400 (readBytePure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)))))))

(assert (=> b!156270 (and (bvsge (bvadd #b00000000000000000000000000000001 from!240) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!240) (size!3209 (_3!437 lt!244379))))))

(declare-fun lt!244364 () Unit!10016)

(declare-fun e!105535 () tuple3!640)

(declare-fun b!156271 () Bool)

(assert (=> b!156271 (= e!105535 (tuple3!641 lt!244364 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7152 (store (arr!4059 arr!153) from!240 (_2!7400 (readBytePure!0 bs!65))) (size!3209 arr!153))))))

(declare-fun call!2407 () (_ BitVec 64))

(assert (=> b!156271 (= call!2407 call!2407)))

(declare-fun lt!244394 () Unit!10016)

(declare-fun Unit!10040 () Unit!10016)

(assert (=> b!156271 (= lt!244394 Unit!10040)))

(declare-fun lt!244371 () Unit!10016)

(declare-fun arrayRangesEqReflexiveLemma!34 (array!7151) Unit!10016)

(assert (=> b!156271 (= lt!244371 (arrayRangesEqReflexiveLemma!34 (array!7152 (store (arr!4059 arr!153) from!240 (_2!7400 (readBytePure!0 bs!65))) (size!3209 arr!153))))))

(declare-fun call!2409 () Bool)

(assert (=> b!156271 call!2409))

(declare-fun lt!244380 () Unit!10016)

(assert (=> b!156271 (= lt!244380 lt!244371)))

(assert (=> b!156271 (= lt!244386 (array!7152 (store (arr!4059 arr!153) from!240 (_2!7400 (readBytePure!0 bs!65))) (size!3209 arr!153)))))

(assert (=> b!156271 (= lt!244383 (array!7152 (store (arr!4059 arr!153) from!240 (_2!7400 (readBytePure!0 bs!65))) (size!3209 arr!153)))))

(declare-fun lt!244370 () (_ BitVec 32))

(assert (=> b!156271 (= lt!244370 #b00000000000000000000000000000000)))

(declare-fun lt!244368 () (_ BitVec 32))

(assert (=> b!156271 (= lt!244368 (size!3209 (array!7152 (store (arr!4059 arr!153) from!240 (_2!7400 (readBytePure!0 bs!65))) (size!3209 arr!153))))))

(assert (=> b!156271 (= lt!244376 #b00000000000000000000000000000000)))

(assert (=> b!156271 (= lt!244389 (bvadd #b00000000000000000000000000000001 from!240))))

(declare-fun arrayRangesEqSlicedLemma!34 (array!7151 array!7151 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10016)

(assert (=> b!156271 (= lt!244364 (arrayRangesEqSlicedLemma!34 lt!244386 lt!244383 lt!244370 lt!244368 lt!244376 lt!244389))))

(assert (=> b!156271 call!2408))

(declare-fun bm!2405 () Bool)

(declare-fun lt!244374 () tuple3!640)

(declare-fun lt!244377 () (_ BitVec 32))

(assert (=> bm!2405 (= call!2409 (arrayRangesEq!424 (array!7152 (store (arr!4059 arr!153) from!240 (_2!7400 (readBytePure!0 bs!65))) (size!3209 arr!153)) (ite c!8325 (_3!437 lt!244374) (array!7152 (store (arr!4059 arr!153) from!240 (_2!7400 (readBytePure!0 bs!65))) (size!3209 arr!153))) (ite c!8325 lt!244377 #b00000000000000000000000000000000) (ite c!8325 (bvadd #b00000000000000000000000000000001 from!240) (size!3209 (array!7152 (store (arr!4059 arr!153) from!240 (_2!7400 (readBytePure!0 bs!65))) (size!3209 arr!153))))))))

(declare-fun b!156272 () Bool)

(declare-fun res!130619 () Bool)

(declare-fun e!105534 () Bool)

(assert (=> b!156272 (=> (not res!130619) (not e!105534))))

(assert (=> b!156272 (= res!130619 (and (= (buf!3712 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (buf!3712 (_2!7409 lt!244379))) (= (size!3209 (array!7152 (store (arr!4059 arr!153) from!240 (_2!7400 (readBytePure!0 bs!65))) (size!3209 arr!153))) (size!3209 (_3!437 lt!244379)))))))

(declare-fun b!156274 () Bool)

(declare-fun lt!244375 () Unit!10016)

(assert (=> b!156274 (= e!105535 (tuple3!641 lt!244375 (_2!7409 lt!244374) (_3!437 lt!244374)))))

(assert (=> b!156274 (= lt!244382 (readByte!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun lt!244387 () array!7151)

(assert (=> b!156274 (= lt!244387 (array!7152 (store (arr!4059 (array!7152 (store (arr!4059 arr!153) from!240 (_2!7400 (readBytePure!0 bs!65))) (size!3209 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7411 lt!244382)) (size!3209 (array!7152 (store (arr!4059 arr!153) from!240 (_2!7400 (readBytePure!0 bs!65))) (size!3209 arr!153)))))))

(declare-fun lt!244381 () (_ BitVec 64))

(assert (=> b!156274 (= lt!244381 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!244385 () (_ BitVec 32))

(assert (=> b!156274 (= lt!244385 (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!244362 () Unit!10016)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5676 BitStream!5676 (_ BitVec 64) (_ BitVec 32)) Unit!10016)

(assert (=> b!156274 (= lt!244362 (validateOffsetBytesFromBitIndexLemma!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7411 lt!244382) lt!244381 lt!244385))))

(assert (=> b!156274 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3209 (buf!3712 (_2!7411 lt!244382)))) ((_ sign_extend 32) (currentByte!6812 (_2!7411 lt!244382))) ((_ sign_extend 32) (currentBit!6807 (_2!7411 lt!244382))) (bvsub lt!244385 ((_ extract 31 0) (bvsdiv (bvadd lt!244381 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!244366 () Unit!10016)

(assert (=> b!156274 (= lt!244366 lt!244362)))

(assert (=> b!156274 (= lt!244374 (readByteArrayLoop!0 (_2!7411 lt!244382) lt!244387 (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!156274 (= (bitIndex!0 (size!3209 (buf!3712 (_2!7411 lt!244382))) (currentByte!6812 (_2!7411 lt!244382)) (currentBit!6807 (_2!7411 lt!244382))) (bvadd (bitIndex!0 (size!3209 (buf!3712 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) (currentByte!6812 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (currentBit!6807 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!244367 () Unit!10016)

(declare-fun Unit!10043 () Unit!10016)

(assert (=> b!156274 (= lt!244367 Unit!10043)))

(assert (=> b!156274 (= (bvadd (bitIndex!0 (size!3209 (buf!3712 (_2!7411 lt!244382))) (currentByte!6812 (_2!7411 lt!244382)) (currentBit!6807 (_2!7411 lt!244382))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2407)))

(declare-fun lt!244390 () Unit!10016)

(declare-fun Unit!10044 () Unit!10016)

(assert (=> b!156274 (= lt!244390 Unit!10044)))

(assert (=> b!156274 (= (bvadd (bitIndex!0 (size!3209 (buf!3712 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) (currentByte!6812 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (currentBit!6807 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) (bvmul ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2407)))

(declare-fun lt!244395 () Unit!10016)

(declare-fun Unit!10045 () Unit!10016)

(assert (=> b!156274 (= lt!244395 Unit!10045)))

(assert (=> b!156274 (and (= (buf!3712 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (buf!3712 (_2!7409 lt!244374))) (= (size!3209 (array!7152 (store (arr!4059 arr!153) from!240 (_2!7400 (readBytePure!0 bs!65))) (size!3209 arr!153))) (size!3209 (_3!437 lt!244374))))))

(declare-fun lt!244372 () Unit!10016)

(declare-fun Unit!10046 () Unit!10016)

(assert (=> b!156274 (= lt!244372 Unit!10046)))

(declare-fun lt!244384 () Unit!10016)

(declare-fun arrayUpdatedAtPrefixLemma!35 (array!7151 (_ BitVec 32) (_ BitVec 8)) Unit!10016)

(assert (=> b!156274 (= lt!244384 (arrayUpdatedAtPrefixLemma!35 (array!7152 (store (arr!4059 arr!153) from!240 (_2!7400 (readBytePure!0 bs!65))) (size!3209 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) (_1!7411 lt!244382)))))

(assert (=> b!156274 call!2408))

(declare-fun lt!244365 () Unit!10016)

(assert (=> b!156274 (= lt!244365 lt!244384)))

(assert (=> b!156274 (= lt!244377 #b00000000000000000000000000000000)))

(declare-fun lt!244391 () Unit!10016)

(declare-fun arrayRangesEqTransitive!100 (array!7151 array!7151 array!7151 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10016)

(assert (=> b!156274 (= lt!244391 (arrayRangesEqTransitive!100 (array!7152 (store (arr!4059 arr!153) from!240 (_2!7400 (readBytePure!0 bs!65))) (size!3209 arr!153)) lt!244387 (_3!437 lt!244374) lt!244377 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!156274 call!2409))

(declare-fun lt!244388 () Unit!10016)

(assert (=> b!156274 (= lt!244388 lt!244391)))

(assert (=> b!156274 (arrayRangesEq!424 (array!7152 (store (arr!4059 arr!153) from!240 (_2!7400 (readBytePure!0 bs!65))) (size!3209 arr!153)) (_3!437 lt!244374) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240))))

(declare-fun lt!244373 () Unit!10016)

(declare-fun Unit!10047 () Unit!10016)

(assert (=> b!156274 (= lt!244373 Unit!10047)))

(declare-fun lt!244393 () Unit!10016)

(declare-fun arrayRangesEqImpliesEq!44 (array!7151 array!7151 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10016)

(assert (=> b!156274 (= lt!244393 (arrayRangesEqImpliesEq!44 lt!244387 (_3!437 lt!244374) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!156274 (= (select (store (arr!4059 (array!7152 (store (arr!4059 arr!153) from!240 (_2!7400 (readBytePure!0 bs!65))) (size!3209 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7411 lt!244382)) (bvadd #b00000000000000000000000000000001 from!240)) (select (arr!4059 (_3!437 lt!244374)) (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!244378 () Unit!10016)

(assert (=> b!156274 (= lt!244378 lt!244393)))

(declare-fun lt!244392 () Bool)

(assert (=> b!156274 (= lt!244392 (= (select (arr!4059 (_3!437 lt!244374)) (bvadd #b00000000000000000000000000000001 from!240)) (_1!7411 lt!244382)))))

(declare-fun Unit!10049 () Unit!10016)

(assert (=> b!156274 (= lt!244375 Unit!10049)))

(assert (=> b!156274 lt!244392))

(declare-fun bm!2406 () Bool)

(assert (=> bm!2406 (= call!2407 (bitIndex!0 (ite c!8325 (size!3209 (buf!3712 (_2!7409 lt!244374))) (size!3209 (buf!3712 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)))) (ite c!8325 (currentByte!6812 (_2!7409 lt!244374)) (currentByte!6812 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) (ite c!8325 (currentBit!6807 (_2!7409 lt!244374)) (currentBit!6807 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)))))))

(declare-fun b!156273 () Bool)

(assert (=> b!156273 (= e!105534 (arrayRangesEq!424 (array!7152 (store (arr!4059 arr!153) from!240 (_2!7400 (readBytePure!0 bs!65))) (size!3209 arr!153)) (_3!437 lt!244379) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun d!51938 () Bool)

(assert (=> d!51938 e!105533))

(declare-fun res!130621 () Bool)

(assert (=> d!51938 (=> res!130621 e!105533)))

(assert (=> d!51938 (= res!130621 (bvsge (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun lt!244369 () Bool)

(assert (=> d!51938 (= lt!244369 e!105534)))

(declare-fun res!130620 () Bool)

(assert (=> d!51938 (=> (not res!130620) (not e!105534))))

(declare-fun lt!244396 () (_ BitVec 64))

(declare-fun lt!244363 () (_ BitVec 64))

(assert (=> d!51938 (= res!130620 (= (bvadd lt!244396 lt!244363) (bitIndex!0 (size!3209 (buf!3712 (_2!7409 lt!244379))) (currentByte!6812 (_2!7409 lt!244379)) (currentBit!6807 (_2!7409 lt!244379)))))))

(assert (=> d!51938 (or (not (= (bvand lt!244396 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!244363 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!244396 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!244396 lt!244363) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!244397 () (_ BitVec 64))

(assert (=> d!51938 (= lt!244363 (bvmul lt!244397 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!51938 (or (= lt!244397 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!244397 #b0000000000000000000000000000000000000000000000000000000000001000) lt!244397)))))

(assert (=> d!51938 (= lt!244397 ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))))))

(assert (=> d!51938 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!240) #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b10000000000000000000000000000000)))))

(assert (=> d!51938 (= lt!244396 (bitIndex!0 (size!3209 (buf!3712 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) (currentByte!6812 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (currentBit!6807 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))))

(assert (=> d!51938 (= lt!244379 e!105535)))

(assert (=> d!51938 (= c!8325 (bvslt (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!51938 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvsle (bvadd #b00000000000000000000000000000001 from!240) to!236) (bvsle to!236 (size!3209 (array!7152 (store (arr!4059 arr!153) from!240 (_2!7400 (readBytePure!0 bs!65))) (size!3209 arr!153)))))))

(assert (=> d!51938 (= (readByteArrayLoop!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7152 (store (arr!4059 arr!153) from!240 (_2!7400 (readBytePure!0 bs!65))) (size!3209 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236) lt!244379)))

(assert (= (and d!51938 c!8325) b!156274))

(assert (= (and d!51938 (not c!8325)) b!156271))

(assert (= (or b!156274 b!156271) bm!2405))

(assert (= (or b!156274 b!156271) bm!2404))

(assert (= (or b!156274 b!156271) bm!2406))

(assert (= (and d!51938 res!130620) b!156272))

(assert (= (and b!156272 res!130619) b!156273))

(assert (= (and d!51938 (not res!130621)) b!156270))

(declare-fun m!243363 () Bool)

(assert (=> bm!2405 m!243363))

(declare-fun m!243365 () Bool)

(assert (=> bm!2404 m!243365))

(declare-fun m!243367 () Bool)

(assert (=> bm!2404 m!243367))

(assert (=> b!156274 m!243365))

(declare-fun m!243369 () Bool)

(assert (=> b!156274 m!243369))

(assert (=> b!156274 m!243189))

(declare-fun m!243371 () Bool)

(assert (=> b!156274 m!243371))

(declare-fun m!243373 () Bool)

(assert (=> b!156274 m!243373))

(assert (=> b!156274 m!243189))

(declare-fun m!243375 () Bool)

(assert (=> b!156274 m!243375))

(declare-fun m!243377 () Bool)

(assert (=> b!156274 m!243377))

(declare-fun m!243379 () Bool)

(assert (=> b!156274 m!243379))

(declare-fun m!243381 () Bool)

(assert (=> b!156274 m!243381))

(declare-fun m!243383 () Bool)

(assert (=> b!156274 m!243383))

(declare-fun m!243385 () Bool)

(assert (=> b!156274 m!243385))

(declare-fun m!243387 () Bool)

(assert (=> b!156274 m!243387))

(declare-fun m!243389 () Bool)

(assert (=> b!156274 m!243389))

(declare-fun m!243391 () Bool)

(assert (=> b!156274 m!243391))

(declare-fun m!243393 () Bool)

(assert (=> d!51938 m!243393))

(assert (=> d!51938 m!243385))

(declare-fun m!243395 () Bool)

(assert (=> bm!2406 m!243395))

(declare-fun m!243397 () Bool)

(assert (=> b!156270 m!243397))

(assert (=> b!156270 m!243189))

(declare-fun m!243399 () Bool)

(assert (=> b!156270 m!243399))

(declare-fun m!243401 () Bool)

(assert (=> b!156271 m!243401))

(declare-fun m!243403 () Bool)

(assert (=> b!156271 m!243403))

(declare-fun m!243405 () Bool)

(assert (=> b!156273 m!243405))

(assert (=> d!51912 d!51938))

(declare-fun d!51950 () Bool)

(declare-fun lt!244495 () (_ BitVec 8))

(declare-fun lt!244494 () (_ BitVec 8))

(assert (=> d!51950 (= lt!244495 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4059 (buf!3712 bs!65)) (currentByte!6812 bs!65))) ((_ sign_extend 24) lt!244494))))))

(assert (=> d!51950 (= lt!244494 ((_ extract 7 0) (currentBit!6807 bs!65)))))

(declare-fun e!105554 () Bool)

(assert (=> d!51950 e!105554))

(declare-fun res!130643 () Bool)

(assert (=> d!51950 (=> (not res!130643) (not e!105554))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!51950 (= res!130643 (validate_offset_bits!1 ((_ sign_extend 32) (size!3209 (buf!3712 bs!65))) ((_ sign_extend 32) (currentByte!6812 bs!65)) ((_ sign_extend 32) (currentBit!6807 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!13952 0))(
  ( (tuple2!13953 (_1!7414 Unit!10016) (_2!7414 (_ BitVec 8))) )
))
(declare-fun Unit!10060 () Unit!10016)

(declare-fun Unit!10062 () Unit!10016)

(assert (=> d!51950 (= (readByte!0 bs!65) (tuple2!13947 (_2!7414 (ite (bvsgt ((_ sign_extend 24) lt!244494) #b00000000000000000000000000000000) (tuple2!13953 Unit!10060 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!244495) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4059 (buf!3712 bs!65)) (bvadd (currentByte!6812 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!244494)))))))) (tuple2!13953 Unit!10062 lt!244495))) (BitStream!5677 (buf!3712 bs!65) (bvadd (currentByte!6812 bs!65) #b00000000000000000000000000000001) (currentBit!6807 bs!65))))))

(declare-fun b!156298 () Bool)

(declare-fun e!105553 () Bool)

(assert (=> b!156298 (= e!105554 e!105553)))

(declare-fun res!130642 () Bool)

(assert (=> b!156298 (=> (not res!130642) (not e!105553))))

(declare-fun lt!244497 () tuple2!13946)

(assert (=> b!156298 (= res!130642 (= (buf!3712 (_2!7411 lt!244497)) (buf!3712 bs!65)))))

(declare-fun lt!244496 () (_ BitVec 8))

(declare-fun lt!244492 () (_ BitVec 8))

(declare-fun Unit!10063 () Unit!10016)

(declare-fun Unit!10064 () Unit!10016)

(assert (=> b!156298 (= lt!244497 (tuple2!13947 (_2!7414 (ite (bvsgt ((_ sign_extend 24) lt!244496) #b00000000000000000000000000000000) (tuple2!13953 Unit!10063 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!244492) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4059 (buf!3712 bs!65)) (bvadd (currentByte!6812 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!244496)))))))) (tuple2!13953 Unit!10064 lt!244492))) (BitStream!5677 (buf!3712 bs!65) (bvadd (currentByte!6812 bs!65) #b00000000000000000000000000000001) (currentBit!6807 bs!65))))))

(assert (=> b!156298 (= lt!244492 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4059 (buf!3712 bs!65)) (currentByte!6812 bs!65))) ((_ sign_extend 24) lt!244496))))))

(assert (=> b!156298 (= lt!244496 ((_ extract 7 0) (currentBit!6807 bs!65)))))

(declare-fun b!156299 () Bool)

(declare-fun lt!244493 () (_ BitVec 64))

(declare-fun lt!244498 () (_ BitVec 64))

(assert (=> b!156299 (= e!105553 (= (bitIndex!0 (size!3209 (buf!3712 (_2!7411 lt!244497))) (currentByte!6812 (_2!7411 lt!244497)) (currentBit!6807 (_2!7411 lt!244497))) (bvadd lt!244493 lt!244498)))))

(assert (=> b!156299 (or (not (= (bvand lt!244493 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!244498 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!244493 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!244493 lt!244498) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!156299 (= lt!244498 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!156299 (= lt!244493 (bitIndex!0 (size!3209 (buf!3712 bs!65)) (currentByte!6812 bs!65) (currentBit!6807 bs!65)))))

(assert (= (and d!51950 res!130643) b!156298))

(assert (= (and b!156298 res!130642) b!156299))

(declare-fun m!243489 () Bool)

(assert (=> d!51950 m!243489))

(declare-fun m!243491 () Bool)

(assert (=> d!51950 m!243491))

(declare-fun m!243493 () Bool)

(assert (=> d!51950 m!243493))

(assert (=> b!156298 m!243493))

(assert (=> b!156298 m!243489))

(declare-fun m!243495 () Bool)

(assert (=> b!156299 m!243495))

(declare-fun m!243497 () Bool)

(assert (=> b!156299 m!243497))

(assert (=> d!51916 d!51950))

(declare-fun d!51960 () Bool)

(assert (=> d!51960 (= (remainingBits!0 ((_ sign_extend 32) (size!3209 (buf!3712 bs!65))) ((_ sign_extend 32) (currentByte!6812 bs!65)) ((_ sign_extend 32) (currentBit!6807 bs!65))) (bvsub (bvmul ((_ sign_extend 32) (size!3209 (buf!3712 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6812 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6807 bs!65)))))))

(assert (=> d!51928 d!51960))

(declare-fun lt!244519 () tuple2!13946)

(declare-fun call!2419 () Bool)

(declare-fun lt!244520 () array!7151)

(declare-fun lt!244523 () array!7151)

(declare-fun lt!244526 () (_ BitVec 32))

(declare-fun bm!2415 () Bool)

(declare-fun lt!244513 () (_ BitVec 32))

(declare-fun c!8328 () Bool)

(assert (=> bm!2415 (= call!2419 (arrayRangesEq!424 (ite c!8328 arr!153 lt!244523) (ite c!8328 (array!7152 (store (arr!4059 arr!153) from!240 (_1!7411 lt!244519)) (size!3209 arr!153)) lt!244520) (ite c!8328 #b00000000000000000000000000000000 lt!244513) (ite c!8328 from!240 lt!244526)))))

(declare-fun b!156300 () Bool)

(declare-fun lt!244516 () tuple3!640)

(declare-fun e!105555 () Bool)

(assert (=> b!156300 (= e!105555 (= (select (arr!4059 (_3!437 lt!244516)) from!240) (_2!7400 (readBytePure!0 bs!65))))))

(assert (=> b!156300 (and (bvsge from!240 #b00000000000000000000000000000000) (bvslt from!240 (size!3209 (_3!437 lt!244516))))))

(declare-fun b!156301 () Bool)

(declare-fun lt!244501 () Unit!10016)

(declare-fun e!105557 () tuple3!640)

(assert (=> b!156301 (= e!105557 (tuple3!641 lt!244501 bs!65 arr!153))))

(declare-fun call!2418 () (_ BitVec 64))

(assert (=> b!156301 (= call!2418 call!2418)))

(declare-fun lt!244531 () Unit!10016)

(declare-fun Unit!10067 () Unit!10016)

(assert (=> b!156301 (= lt!244531 Unit!10067)))

(declare-fun lt!244508 () Unit!10016)

(assert (=> b!156301 (= lt!244508 (arrayRangesEqReflexiveLemma!34 arr!153))))

(declare-fun call!2420 () Bool)

(assert (=> b!156301 call!2420))

(declare-fun lt!244517 () Unit!10016)

(assert (=> b!156301 (= lt!244517 lt!244508)))

(assert (=> b!156301 (= lt!244523 arr!153)))

(assert (=> b!156301 (= lt!244520 arr!153)))

(declare-fun lt!244507 () (_ BitVec 32))

(assert (=> b!156301 (= lt!244507 #b00000000000000000000000000000000)))

(declare-fun lt!244505 () (_ BitVec 32))

(assert (=> b!156301 (= lt!244505 (size!3209 arr!153))))

(assert (=> b!156301 (= lt!244513 #b00000000000000000000000000000000)))

(assert (=> b!156301 (= lt!244526 from!240)))

(assert (=> b!156301 (= lt!244501 (arrayRangesEqSlicedLemma!34 lt!244523 lt!244520 lt!244507 lt!244505 lt!244513 lt!244526))))

(assert (=> b!156301 call!2419))

(declare-fun lt!244514 () (_ BitVec 32))

(declare-fun lt!244511 () tuple3!640)

(declare-fun bm!2416 () Bool)

(assert (=> bm!2416 (= call!2420 (arrayRangesEq!424 arr!153 (ite c!8328 (_3!437 lt!244511) arr!153) (ite c!8328 lt!244514 #b00000000000000000000000000000000) (ite c!8328 from!240 (size!3209 arr!153))))))

(declare-fun b!156302 () Bool)

(declare-fun res!130644 () Bool)

(declare-fun e!105556 () Bool)

(assert (=> b!156302 (=> (not res!130644) (not e!105556))))

(assert (=> b!156302 (= res!130644 (and (= (buf!3712 bs!65) (buf!3712 (_2!7409 lt!244516))) (= (size!3209 arr!153) (size!3209 (_3!437 lt!244516)))))))

(declare-fun b!156304 () Bool)

(declare-fun lt!244512 () Unit!10016)

(assert (=> b!156304 (= e!105557 (tuple3!641 lt!244512 (_2!7409 lt!244511) (_3!437 lt!244511)))))

(assert (=> b!156304 (= lt!244519 (readByte!0 bs!65))))

(declare-fun lt!244524 () array!7151)

(assert (=> b!156304 (= lt!244524 (array!7152 (store (arr!4059 arr!153) from!240 (_1!7411 lt!244519)) (size!3209 arr!153)))))

(declare-fun lt!244518 () (_ BitVec 64))

(assert (=> b!156304 (= lt!244518 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!244522 () (_ BitVec 32))

(assert (=> b!156304 (= lt!244522 (bvsub to!236 from!240))))

(declare-fun lt!244499 () Unit!10016)

(assert (=> b!156304 (= lt!244499 (validateOffsetBytesFromBitIndexLemma!0 bs!65 (_2!7411 lt!244519) lt!244518 lt!244522))))

(assert (=> b!156304 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3209 (buf!3712 (_2!7411 lt!244519)))) ((_ sign_extend 32) (currentByte!6812 (_2!7411 lt!244519))) ((_ sign_extend 32) (currentBit!6807 (_2!7411 lt!244519))) (bvsub lt!244522 ((_ extract 31 0) (bvsdiv (bvadd lt!244518 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!244503 () Unit!10016)

(assert (=> b!156304 (= lt!244503 lt!244499)))

(assert (=> b!156304 (= lt!244511 (readByteArrayLoop!0 (_2!7411 lt!244519) lt!244524 (bvadd from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> b!156304 (= (bitIndex!0 (size!3209 (buf!3712 (_2!7411 lt!244519))) (currentByte!6812 (_2!7411 lt!244519)) (currentBit!6807 (_2!7411 lt!244519))) (bvadd (bitIndex!0 (size!3209 (buf!3712 bs!65)) (currentByte!6812 bs!65) (currentBit!6807 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!244504 () Unit!10016)

(declare-fun Unit!10068 () Unit!10016)

(assert (=> b!156304 (= lt!244504 Unit!10068)))

(assert (=> b!156304 (= (bvadd (bitIndex!0 (size!3209 (buf!3712 (_2!7411 lt!244519))) (currentByte!6812 (_2!7411 lt!244519)) (currentBit!6807 (_2!7411 lt!244519))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2418)))

(declare-fun lt!244527 () Unit!10016)

(declare-fun Unit!10069 () Unit!10016)

(assert (=> b!156304 (= lt!244527 Unit!10069)))

(assert (=> b!156304 (= (bvadd (bitIndex!0 (size!3209 (buf!3712 bs!65)) (currentByte!6812 bs!65) (currentBit!6807 bs!65)) (bvmul ((_ sign_extend 32) (bvsub to!236 from!240)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2418)))

(declare-fun lt!244532 () Unit!10016)

(declare-fun Unit!10070 () Unit!10016)

(assert (=> b!156304 (= lt!244532 Unit!10070)))

(assert (=> b!156304 (and (= (buf!3712 bs!65) (buf!3712 (_2!7409 lt!244511))) (= (size!3209 arr!153) (size!3209 (_3!437 lt!244511))))))

(declare-fun lt!244509 () Unit!10016)

(declare-fun Unit!10071 () Unit!10016)

(assert (=> b!156304 (= lt!244509 Unit!10071)))

(declare-fun lt!244521 () Unit!10016)

(assert (=> b!156304 (= lt!244521 (arrayUpdatedAtPrefixLemma!35 arr!153 from!240 (_1!7411 lt!244519)))))

(assert (=> b!156304 call!2419))

(declare-fun lt!244502 () Unit!10016)

(assert (=> b!156304 (= lt!244502 lt!244521)))

(assert (=> b!156304 (= lt!244514 #b00000000000000000000000000000000)))

(declare-fun lt!244528 () Unit!10016)

(assert (=> b!156304 (= lt!244528 (arrayRangesEqTransitive!100 arr!153 lt!244524 (_3!437 lt!244511) lt!244514 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!156304 call!2420))

(declare-fun lt!244525 () Unit!10016)

(assert (=> b!156304 (= lt!244525 lt!244528)))

(assert (=> b!156304 (arrayRangesEq!424 arr!153 (_3!437 lt!244511) #b00000000000000000000000000000000 from!240)))

(declare-fun lt!244510 () Unit!10016)

(declare-fun Unit!10072 () Unit!10016)

(assert (=> b!156304 (= lt!244510 Unit!10072)))

(declare-fun lt!244530 () Unit!10016)

(assert (=> b!156304 (= lt!244530 (arrayRangesEqImpliesEq!44 lt!244524 (_3!437 lt!244511) #b00000000000000000000000000000000 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!156304 (= (select (store (arr!4059 arr!153) from!240 (_1!7411 lt!244519)) from!240) (select (arr!4059 (_3!437 lt!244511)) from!240))))

(declare-fun lt!244515 () Unit!10016)

(assert (=> b!156304 (= lt!244515 lt!244530)))

(declare-fun lt!244529 () Bool)

(assert (=> b!156304 (= lt!244529 (= (select (arr!4059 (_3!437 lt!244511)) from!240) (_1!7411 lt!244519)))))

(declare-fun Unit!10073 () Unit!10016)

(assert (=> b!156304 (= lt!244512 Unit!10073)))

(assert (=> b!156304 lt!244529))

(declare-fun bm!2417 () Bool)

(assert (=> bm!2417 (= call!2418 (bitIndex!0 (ite c!8328 (size!3209 (buf!3712 (_2!7409 lt!244511))) (size!3209 (buf!3712 bs!65))) (ite c!8328 (currentByte!6812 (_2!7409 lt!244511)) (currentByte!6812 bs!65)) (ite c!8328 (currentBit!6807 (_2!7409 lt!244511)) (currentBit!6807 bs!65))))))

(declare-fun b!156303 () Bool)

(assert (=> b!156303 (= e!105556 (arrayRangesEq!424 arr!153 (_3!437 lt!244516) #b00000000000000000000000000000000 from!240))))

(declare-fun d!51962 () Bool)

(assert (=> d!51962 e!105555))

(declare-fun res!130646 () Bool)

(assert (=> d!51962 (=> res!130646 e!105555)))

(assert (=> d!51962 (= res!130646 (bvsge from!240 to!236))))

(declare-fun lt!244506 () Bool)

(assert (=> d!51962 (= lt!244506 e!105556)))

(declare-fun res!130645 () Bool)

(assert (=> d!51962 (=> (not res!130645) (not e!105556))))

(declare-fun lt!244500 () (_ BitVec 64))

(declare-fun lt!244533 () (_ BitVec 64))

(assert (=> d!51962 (= res!130645 (= (bvadd lt!244533 lt!244500) (bitIndex!0 (size!3209 (buf!3712 (_2!7409 lt!244516))) (currentByte!6812 (_2!7409 lt!244516)) (currentBit!6807 (_2!7409 lt!244516)))))))

(assert (=> d!51962 (or (not (= (bvand lt!244533 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!244500 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!244533 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!244533 lt!244500) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!244534 () (_ BitVec 64))

(assert (=> d!51962 (= lt!244500 (bvmul lt!244534 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!51962 (or (= lt!244534 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!244534 #b0000000000000000000000000000000000000000000000000000000000001000) lt!244534)))))

(assert (=> d!51962 (= lt!244534 ((_ sign_extend 32) (bvsub to!236 from!240)))))

(assert (=> d!51962 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand from!240 #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000)))))

(assert (=> d!51962 (= lt!244533 (bitIndex!0 (size!3209 (buf!3712 bs!65)) (currentByte!6812 bs!65) (currentBit!6807 bs!65)))))

(assert (=> d!51962 (= lt!244516 e!105557)))

(assert (=> d!51962 (= c!8328 (bvslt from!240 to!236))))

(assert (=> d!51962 (and (bvsle #b00000000000000000000000000000000 from!240) (bvsle from!240 to!236) (bvsle to!236 (size!3209 arr!153)))))

(assert (=> d!51962 (= (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236) lt!244516)))

(assert (= (and d!51962 c!8328) b!156304))

(assert (= (and d!51962 (not c!8328)) b!156301))

(assert (= (or b!156304 b!156301) bm!2416))

(assert (= (or b!156304 b!156301) bm!2415))

(assert (= (or b!156304 b!156301) bm!2417))

(assert (= (and d!51962 res!130645) b!156302))

(assert (= (and b!156302 res!130644) b!156303))

(assert (= (and d!51962 (not res!130646)) b!156300))

(declare-fun m!243499 () Bool)

(assert (=> bm!2416 m!243499))

(declare-fun m!243501 () Bool)

(assert (=> bm!2415 m!243501))

(declare-fun m!243503 () Bool)

(assert (=> bm!2415 m!243503))

(assert (=> b!156304 m!243501))

(declare-fun m!243505 () Bool)

(assert (=> b!156304 m!243505))

(assert (=> b!156304 m!243253))

(declare-fun m!243507 () Bool)

(assert (=> b!156304 m!243507))

(declare-fun m!243509 () Bool)

(assert (=> b!156304 m!243509))

(declare-fun m!243511 () Bool)

(assert (=> b!156304 m!243511))

(declare-fun m!243513 () Bool)

(assert (=> b!156304 m!243513))

(declare-fun m!243515 () Bool)

(assert (=> b!156304 m!243515))

(declare-fun m!243517 () Bool)

(assert (=> b!156304 m!243517))

(assert (=> b!156304 m!243497))

(declare-fun m!243519 () Bool)

(assert (=> b!156304 m!243519))

(declare-fun m!243521 () Bool)

(assert (=> b!156304 m!243521))

(declare-fun m!243523 () Bool)

(assert (=> b!156304 m!243523))

(declare-fun m!243525 () Bool)

(assert (=> d!51962 m!243525))

(assert (=> d!51962 m!243497))

(declare-fun m!243527 () Bool)

(assert (=> bm!2417 m!243527))

(declare-fun m!243529 () Bool)

(assert (=> b!156300 m!243529))

(assert (=> b!156300 m!243187))

(declare-fun m!243531 () Bool)

(assert (=> b!156301 m!243531))

(declare-fun m!243533 () Bool)

(assert (=> b!156301 m!243533))

(declare-fun m!243535 () Bool)

(assert (=> b!156303 m!243535))

(assert (=> d!51918 d!51962))

(declare-fun d!51964 () Bool)

(declare-fun e!105560 () Bool)

(assert (=> d!51964 e!105560))

(declare-fun res!130649 () Bool)

(assert (=> d!51964 (=> (not res!130649) (not e!105560))))

(assert (=> d!51964 (= res!130649 (moveByteIndexPrecond!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun Unit!10074 () Unit!10016)

(assert (=> d!51964 (= (moveByteIndex!0 bs!65 #b00000000000000000000000000000001) (tuple2!13945 Unit!10074 (BitStream!5677 (buf!3712 bs!65) (bvadd (currentByte!6812 bs!65) #b00000000000000000000000000000001) (currentBit!6807 bs!65))))))

(declare-fun b!156307 () Bool)

(assert (=> b!156307 (= e!105560 (and (or (not (= (bvand (currentByte!6812 bs!65) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!6812 bs!65) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!6812 bs!65) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!6812 bs!65) #b00000000000000000000000000000001) (bvadd (currentByte!6812 bs!65) #b00000000000000000000000000000001))))))

(assert (= (and d!51964 res!130649) b!156307))

(assert (=> d!51964 m!243201))

(assert (=> d!51914 d!51964))

(check-sat (not d!51950) (not b!156299) (not bm!2415) (not bm!2416) (not d!51964) (not b!156300) (not bm!2404) (not b!156270) (not d!51938) (not bm!2417) (not d!51962) (not bm!2405) (not b!156271) (not b!156303) (not b!156301) (not b!156273) (not b!156274) (not b!156304) (not bm!2406))
