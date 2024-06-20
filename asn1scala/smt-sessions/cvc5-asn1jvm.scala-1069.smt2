; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30670 () Bool)

(assert start!30670)

(declare-fun res!130393 () Bool)

(declare-fun e!105263 () Bool)

(assert (=> start!30670 (=> (not res!130393) (not e!105263))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-datatypes ((array!7131 0))(
  ( (array!7132 (arr!4040 (Array (_ BitVec 32) (_ BitVec 8))) (size!3202 (_ BitVec 32))) )
))
(declare-fun arr!153 () array!7131)

(assert (=> start!30670 (= res!130393 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3202 arr!153))))))

(assert (=> start!30670 e!105263))

(assert (=> start!30670 true))

(declare-fun array_inv!2991 (array!7131) Bool)

(assert (=> start!30670 (array_inv!2991 arr!153)))

(declare-datatypes ((BitStream!5662 0))(
  ( (BitStream!5663 (buf!3705 array!7131) (currentByte!6787 (_ BitVec 32)) (currentBit!6782 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5662)

(declare-fun e!105265 () Bool)

(declare-fun inv!12 (BitStream!5662) Bool)

(assert (=> start!30670 (and (inv!12 bs!65) e!105265)))

(declare-fun b!155960 () Bool)

(declare-fun res!130394 () Bool)

(assert (=> b!155960 (=> (not res!130394) (not e!105263))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!155960 (= res!130394 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3202 (buf!3705 bs!65))) ((_ sign_extend 32) (currentByte!6787 bs!65)) ((_ sign_extend 32) (currentBit!6782 bs!65)) (bvsub to!236 from!240)))))

(declare-datatypes ((tuple2!13864 0))(
  ( (tuple2!13865 (_1!7361 BitStream!5662) (_2!7361 array!7131)) )
))
(declare-fun lt!242938 () tuple2!13864)

(declare-fun b!155961 () Bool)

(declare-fun lt!242937 () tuple2!13864)

(assert (=> b!155961 (= e!105263 (and (= from!240 (bvsub to!236 #b00000000000000000000000000000001)) (bvsle #b00000000000000000000000000000000 to!236) (bvsgt (size!3202 (_2!7361 lt!242938)) (size!3202 (_2!7361 lt!242937)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5662 array!7131 (_ BitVec 32) (_ BitVec 32)) tuple2!13864)

(declare-fun withMovedByteIndex!0 (BitStream!5662 (_ BitVec 32)) BitStream!5662)

(declare-datatypes ((tuple2!13866 0))(
  ( (tuple2!13867 (_1!7362 BitStream!5662) (_2!7362 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5662) tuple2!13866)

(assert (=> b!155961 (= lt!242937 (readByteArrayLoopPure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7132 (store (arr!4040 arr!153) from!240 (_2!7362 (readBytePure!0 bs!65))) (size!3202 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> b!155961 (= lt!242938 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!155962 () Bool)

(assert (=> b!155962 (= e!105265 (array_inv!2991 (buf!3705 bs!65)))))

(assert (= (and start!30670 res!130393) b!155960))

(assert (= (and b!155960 res!130394) b!155961))

(assert (= start!30670 b!155962))

(declare-fun m!242421 () Bool)

(assert (=> start!30670 m!242421))

(declare-fun m!242423 () Bool)

(assert (=> start!30670 m!242423))

(declare-fun m!242425 () Bool)

(assert (=> b!155960 m!242425))

(declare-fun m!242427 () Bool)

(assert (=> b!155961 m!242427))

(declare-fun m!242429 () Bool)

(assert (=> b!155961 m!242429))

(assert (=> b!155961 m!242429))

(declare-fun m!242431 () Bool)

(assert (=> b!155961 m!242431))

(declare-fun m!242433 () Bool)

(assert (=> b!155961 m!242433))

(declare-fun m!242435 () Bool)

(assert (=> b!155961 m!242435))

(declare-fun m!242437 () Bool)

(assert (=> b!155962 m!242437))

(push 1)

(assert (not b!155960))

(assert (not start!30670))

(assert (not b!155961))

(assert (not b!155962))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!51704 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!51704 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3202 (buf!3705 bs!65))) ((_ sign_extend 32) (currentByte!6787 bs!65)) ((_ sign_extend 32) (currentBit!6782 bs!65)) (bvsub to!236 from!240)) (bvsle ((_ sign_extend 32) (bvsub to!236 from!240)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3202 (buf!3705 bs!65))) ((_ sign_extend 32) (currentByte!6787 bs!65)) ((_ sign_extend 32) (currentBit!6782 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12654 () Bool)

(assert (= bs!12654 d!51704))

(declare-fun m!242475 () Bool)

(assert (=> bs!12654 m!242475))

(assert (=> b!155960 d!51704))

(declare-fun d!51706 () Bool)

(assert (=> d!51706 (= (array_inv!2991 arr!153) (bvsge (size!3202 arr!153) #b00000000000000000000000000000000))))

(assert (=> start!30670 d!51706))

(declare-fun d!51708 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!51708 (= (inv!12 bs!65) (invariant!0 (currentBit!6782 bs!65) (currentByte!6787 bs!65) (size!3202 (buf!3705 bs!65))))))

(declare-fun bs!12655 () Bool)

(assert (= bs!12655 d!51708))

(declare-fun m!242477 () Bool)

(assert (=> bs!12655 m!242477))

(assert (=> start!30670 d!51708))

(declare-datatypes ((Unit!9886 0))(
  ( (Unit!9887) )
))
(declare-datatypes ((tuple3!624 0))(
  ( (tuple3!625 (_1!7367 Unit!9886) (_2!7367 BitStream!5662) (_3!429 array!7131)) )
))
(declare-fun lt!242953 () tuple3!624)

(declare-fun d!51710 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!5662 array!7131 (_ BitVec 32) (_ BitVec 32)) tuple3!624)

(assert (=> d!51710 (= lt!242953 (readByteArrayLoop!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7132 (store (arr!4040 arr!153) from!240 (_2!7362 (readBytePure!0 bs!65))) (size!3202 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!51710 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7132 (store (arr!4040 arr!153) from!240 (_2!7362 (readBytePure!0 bs!65))) (size!3202 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236) (tuple2!13865 (_2!7367 lt!242953) (_3!429 lt!242953)))))

(declare-fun bs!12657 () Bool)

(assert (= bs!12657 d!51710))

(assert (=> bs!12657 m!242429))

(declare-fun m!242481 () Bool)

(assert (=> bs!12657 m!242481))

(assert (=> b!155961 d!51710))

(declare-fun d!51720 () Bool)

(declare-datatypes ((tuple2!13876 0))(
  ( (tuple2!13877 (_1!7368 Unit!9886) (_2!7368 BitStream!5662)) )
))
(declare-fun moveByteIndex!0 (BitStream!5662 (_ BitVec 32)) tuple2!13876)

(assert (=> d!51720 (= (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7368 (moveByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun bs!12658 () Bool)

(assert (= bs!12658 d!51720))

(declare-fun m!242483 () Bool)

(assert (=> bs!12658 m!242483))

(assert (=> b!155961 d!51720))

(declare-fun d!51722 () Bool)

(declare-datatypes ((tuple2!13878 0))(
  ( (tuple2!13879 (_1!7369 (_ BitVec 8)) (_2!7369 BitStream!5662)) )
))
(declare-fun lt!242959 () tuple2!13878)

(declare-fun readByte!0 (BitStream!5662) tuple2!13878)

(assert (=> d!51722 (= lt!242959 (readByte!0 bs!65))))

(assert (=> d!51722 (= (readBytePure!0 bs!65) (tuple2!13867 (_2!7369 lt!242959) (_1!7369 lt!242959)))))

(declare-fun bs!12660 () Bool)

(assert (= bs!12660 d!51722))

(declare-fun m!242487 () Bool)

(assert (=> bs!12660 m!242487))

(assert (=> b!155961 d!51722))

(declare-fun lt!242960 () tuple3!624)

(declare-fun d!51726 () Bool)

(assert (=> d!51726 (= lt!242960 (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236))))

(assert (=> d!51726 (= (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236) (tuple2!13865 (_2!7367 lt!242960) (_3!429 lt!242960)))))

(declare-fun bs!12661 () Bool)

(assert (= bs!12661 d!51726))

(declare-fun m!242489 () Bool)

(assert (=> bs!12661 m!242489))

(assert (=> b!155961 d!51726))

(declare-fun d!51728 () Bool)

(assert (=> d!51728 (= (array_inv!2991 (buf!3705 bs!65)) (bvsge (size!3202 (buf!3705 bs!65)) #b00000000000000000000000000000000))))

(assert (=> b!155962 d!51728))

(push 1)

(assert (not d!51708))

(assert (not d!51710))

(assert (not d!51720))

(assert (not d!51722))

(assert (not d!51704))

(assert (not d!51726))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun c!8298 () Bool)

(declare-fun call!2330 () (_ BitVec 64))

(declare-fun lt!243194 () tuple3!624)

(declare-fun bm!2325 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> bm!2325 (= call!2330 (bitIndex!0 (ite c!8298 (size!3202 (buf!3705 (_2!7367 lt!243194))) (size!3202 (buf!3705 bs!65))) (ite c!8298 (currentByte!6787 (_2!7367 lt!243194)) (currentByte!6787 bs!65)) (ite c!8298 (currentBit!6782 (_2!7367 lt!243194)) (currentBit!6782 bs!65))))))

(declare-fun call!2329 () Bool)

(declare-fun bm!2326 () Bool)

(declare-fun arrayRangesEq!417 (array!7131 array!7131 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!2326 (= call!2329 (arrayRangesEq!417 arr!153 (ite c!8298 (_3!429 lt!243194) arr!153) #b00000000000000000000000000000000 (ite c!8298 from!240 (size!3202 arr!153))))))

(declare-fun d!51752 () Bool)

(declare-fun e!105318 () Bool)

(assert (=> d!51752 e!105318))

(declare-fun res!130438 () Bool)

(assert (=> d!51752 (=> res!130438 e!105318)))

(assert (=> d!51752 (= res!130438 (bvsge from!240 to!236))))

(declare-fun lt!243195 () Bool)

(declare-fun e!105319 () Bool)

(assert (=> d!51752 (= lt!243195 e!105319)))

(declare-fun res!130436 () Bool)

(assert (=> d!51752 (=> (not res!130436) (not e!105319))))

(declare-fun lt!243181 () tuple3!624)

(declare-fun lt!243187 () (_ BitVec 64))

(declare-fun lt!243192 () (_ BitVec 64))

(assert (=> d!51752 (= res!130436 (= (bvadd lt!243187 lt!243192) (bitIndex!0 (size!3202 (buf!3705 (_2!7367 lt!243181))) (currentByte!6787 (_2!7367 lt!243181)) (currentBit!6782 (_2!7367 lt!243181)))))))

(assert (=> d!51752 (or (not (= (bvand lt!243187 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!243192 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!243187 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!243187 lt!243192) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!243200 () (_ BitVec 64))

(assert (=> d!51752 (= lt!243192 (bvmul lt!243200 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!51752 (or (= lt!243200 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!243200 #b0000000000000000000000000000000000000000000000000000000000001000) lt!243200)))))

(assert (=> d!51752 (= lt!243200 ((_ sign_extend 32) (bvsub to!236 from!240)))))

(assert (=> d!51752 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand from!240 #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000)))))

(assert (=> d!51752 (= lt!243187 (bitIndex!0 (size!3202 (buf!3705 bs!65)) (currentByte!6787 bs!65) (currentBit!6782 bs!65)))))

(declare-fun e!105320 () tuple3!624)

(assert (=> d!51752 (= lt!243181 e!105320)))

(assert (=> d!51752 (= c!8298 (bvslt from!240 to!236))))

(assert (=> d!51752 (and (bvsle #b00000000000000000000000000000000 from!240) (bvsle from!240 to!236) (bvsle to!236 (size!3202 arr!153)))))

(assert (=> d!51752 (= (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236) lt!243181)))

(declare-fun b!156018 () Bool)

(assert (=> b!156018 (= e!105318 (= (select (arr!4040 (_3!429 lt!243181)) from!240) (_2!7362 (readBytePure!0 bs!65))))))

(assert (=> b!156018 (and (bvsge from!240 #b00000000000000000000000000000000) (bvslt from!240 (size!3202 (_3!429 lt!243181))))))

(declare-fun b!156019 () Bool)

(assert (=> b!156019 (= e!105319 (arrayRangesEq!417 arr!153 (_3!429 lt!243181) #b00000000000000000000000000000000 from!240))))

(declare-fun call!2328 () Bool)

(declare-fun bm!2327 () Bool)

(declare-fun lt!243175 () tuple2!13878)

(declare-fun lt!243179 () (_ BitVec 32))

(declare-fun lt!243199 () array!7131)

(declare-fun lt!243189 () array!7131)

(declare-fun lt!243186 () (_ BitVec 32))

(assert (=> bm!2327 (= call!2328 (arrayRangesEq!417 (ite c!8298 arr!153 lt!243189) (ite c!8298 (array!7132 (store (arr!4040 arr!153) from!240 (_1!7369 lt!243175)) (size!3202 arr!153)) lt!243199) (ite c!8298 #b00000000000000000000000000000000 lt!243179) (ite c!8298 from!240 lt!243186)))))

(declare-fun lt!243173 () Unit!9886)

(declare-fun b!156020 () Bool)

(assert (=> b!156020 (= e!105320 (tuple3!625 lt!243173 bs!65 arr!153))))

(assert (=> b!156020 (= call!2330 call!2330)))

(declare-fun lt!243193 () Unit!9886)

(declare-fun Unit!9900 () Unit!9886)

(assert (=> b!156020 (= lt!243193 Unit!9900)))

(declare-fun lt!243197 () Unit!9886)

(declare-fun arrayRangesEqReflexiveLemma!28 (array!7131) Unit!9886)

(assert (=> b!156020 (= lt!243197 (arrayRangesEqReflexiveLemma!28 arr!153))))

(assert (=> b!156020 call!2329))

(declare-fun lt!243198 () Unit!9886)

(assert (=> b!156020 (= lt!243198 lt!243197)))

(assert (=> b!156020 (= lt!243189 arr!153)))

(assert (=> b!156020 (= lt!243199 arr!153)))

(declare-fun lt!243184 () (_ BitVec 32))

(assert (=> b!156020 (= lt!243184 #b00000000000000000000000000000000)))

(declare-fun lt!243180 () (_ BitVec 32))

(assert (=> b!156020 (= lt!243180 (size!3202 arr!153))))

(assert (=> b!156020 (= lt!243179 #b00000000000000000000000000000000)))

(assert (=> b!156020 (= lt!243186 from!240)))

(declare-fun arrayRangesEqSlicedLemma!28 (array!7131 array!7131 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9886)

(assert (=> b!156020 (= lt!243173 (arrayRangesEqSlicedLemma!28 lt!243189 lt!243199 lt!243184 lt!243180 lt!243179 lt!243186))))

(assert (=> b!156020 call!2328))

(declare-fun b!156021 () Bool)

(declare-fun res!130437 () Bool)

(assert (=> b!156021 (=> (not res!130437) (not e!105319))))

(assert (=> b!156021 (= res!130437 (and (= (buf!3705 bs!65) (buf!3705 (_2!7367 lt!243181))) (= (size!3202 arr!153) (size!3202 (_3!429 lt!243181)))))))

(declare-fun b!156022 () Bool)

(declare-fun lt!243196 () Unit!9886)

(assert (=> b!156022 (= e!105320 (tuple3!625 lt!243196 (_2!7367 lt!243194) (_3!429 lt!243194)))))

(assert (=> b!156022 (= lt!243175 (readByte!0 bs!65))))

(declare-fun lt!243178 () array!7131)

(assert (=> b!156022 (= lt!243178 (array!7132 (store (arr!4040 arr!153) from!240 (_1!7369 lt!243175)) (size!3202 arr!153)))))

(declare-fun lt!243176 () (_ BitVec 64))

(assert (=> b!156022 (= lt!243176 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!243207 () (_ BitVec 32))

(assert (=> b!156022 (= lt!243207 (bvsub to!236 from!240))))

(declare-fun lt!243201 () Unit!9886)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5662 BitStream!5662 (_ BitVec 64) (_ BitVec 32)) Unit!9886)

(assert (=> b!156022 (= lt!243201 (validateOffsetBytesFromBitIndexLemma!0 bs!65 (_2!7369 lt!243175) lt!243176 lt!243207))))

(assert (=> b!156022 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3202 (buf!3705 (_2!7369 lt!243175)))) ((_ sign_extend 32) (currentByte!6787 (_2!7369 lt!243175))) ((_ sign_extend 32) (currentBit!6782 (_2!7369 lt!243175))) (bvsub lt!243207 ((_ extract 31 0) (bvsdiv (bvadd lt!243176 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!243208 () Unit!9886)

(assert (=> b!156022 (= lt!243208 lt!243201)))

(assert (=> b!156022 (= lt!243194 (readByteArrayLoop!0 (_2!7369 lt!243175) lt!243178 (bvadd from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> b!156022 (= (bitIndex!0 (size!3202 (buf!3705 (_2!7369 lt!243175))) (currentByte!6787 (_2!7369 lt!243175)) (currentBit!6782 (_2!7369 lt!243175))) (bvadd (bitIndex!0 (size!3202 (buf!3705 bs!65)) (currentByte!6787 bs!65) (currentBit!6782 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!243203 () Unit!9886)

(declare-fun Unit!9901 () Unit!9886)

(assert (=> b!156022 (= lt!243203 Unit!9901)))

(assert (=> b!156022 (= (bvadd (bitIndex!0 (size!3202 (buf!3705 (_2!7369 lt!243175))) (currentByte!6787 (_2!7369 lt!243175)) (currentBit!6782 (_2!7369 lt!243175))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2330)))

(declare-fun lt!243182 () Unit!9886)

(declare-fun Unit!9902 () Unit!9886)

(assert (=> b!156022 (= lt!243182 Unit!9902)))

(assert (=> b!156022 (= (bvadd (bitIndex!0 (size!3202 (buf!3705 bs!65)) (currentByte!6787 bs!65) (currentBit!6782 bs!65)) (bvmul ((_ sign_extend 32) (bvsub to!236 from!240)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2330)))

(declare-fun lt!243174 () Unit!9886)

(declare-fun Unit!9903 () Unit!9886)

(assert (=> b!156022 (= lt!243174 Unit!9903)))

(assert (=> b!156022 (and (= (buf!3705 bs!65) (buf!3705 (_2!7367 lt!243194))) (= (size!3202 arr!153) (size!3202 (_3!429 lt!243194))))))

(declare-fun lt!243188 () Unit!9886)

(declare-fun Unit!9904 () Unit!9886)

(assert (=> b!156022 (= lt!243188 Unit!9904)))

(declare-fun lt!243206 () Unit!9886)

(declare-fun arrayUpdatedAtPrefixLemma!28 (array!7131 (_ BitVec 32) (_ BitVec 8)) Unit!9886)

(assert (=> b!156022 (= lt!243206 (arrayUpdatedAtPrefixLemma!28 arr!153 from!240 (_1!7369 lt!243175)))))

(assert (=> b!156022 call!2328))

(declare-fun lt!243191 () Unit!9886)

(assert (=> b!156022 (= lt!243191 lt!243206)))

(declare-fun lt!243183 () (_ BitVec 32))

(assert (=> b!156022 (= lt!243183 #b00000000000000000000000000000000)))

(declare-fun lt!243202 () Unit!9886)

(declare-fun arrayRangesEqTransitive!93 (array!7131 array!7131 array!7131 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9886)

(assert (=> b!156022 (= lt!243202 (arrayRangesEqTransitive!93 arr!153 lt!243178 (_3!429 lt!243194) lt!243183 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!156022 (arrayRangesEq!417 arr!153 (_3!429 lt!243194) lt!243183 from!240)))

(declare-fun lt!243185 () Unit!9886)

(assert (=> b!156022 (= lt!243185 lt!243202)))

(assert (=> b!156022 call!2329))

(declare-fun lt!243204 () Unit!9886)

(declare-fun Unit!9905 () Unit!9886)

(assert (=> b!156022 (= lt!243204 Unit!9905)))

(declare-fun lt!243205 () Unit!9886)

(declare-fun arrayRangesEqImpliesEq!37 (array!7131 array!7131 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9886)

(assert (=> b!156022 (= lt!243205 (arrayRangesEqImpliesEq!37 lt!243178 (_3!429 lt!243194) #b00000000000000000000000000000000 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!156022 (= (select (store (arr!4040 arr!153) from!240 (_1!7369 lt!243175)) from!240) (select (arr!4040 (_3!429 lt!243194)) from!240))))

(declare-fun lt!243177 () Unit!9886)

(assert (=> b!156022 (= lt!243177 lt!243205)))

(declare-fun lt!243190 () Bool)

(assert (=> b!156022 (= lt!243190 (= (select (arr!4040 (_3!429 lt!243194)) from!240) (_1!7369 lt!243175)))))

(declare-fun Unit!9908 () Unit!9886)

(assert (=> b!156022 (= lt!243196 Unit!9908)))

(assert (=> b!156022 lt!243190))

(assert (= (and d!51752 c!8298) b!156022))

(assert (= (and d!51752 (not c!8298)) b!156020))

(assert (= (or b!156022 b!156020) bm!2327))

(assert (= (or b!156022 b!156020) bm!2326))

(assert (= (or b!156022 b!156020) bm!2325))

(assert (= (and d!51752 res!130436) b!156021))

(assert (= (and b!156021 res!130437) b!156019))

(assert (= (and d!51752 (not res!130438)) b!156018))

(declare-fun m!242569 () Bool)

(assert (=> b!156018 m!242569))

(assert (=> b!156018 m!242427))

(declare-fun m!242571 () Bool)

(assert (=> bm!2327 m!242571))

(declare-fun m!242573 () Bool)

(assert (=> bm!2327 m!242573))

(declare-fun m!242575 () Bool)

(assert (=> b!156019 m!242575))

(declare-fun m!242577 () Bool)

(assert (=> b!156020 m!242577))

(declare-fun m!242579 () Bool)

(assert (=> b!156020 m!242579))

(declare-fun m!242581 () Bool)

(assert (=> bm!2326 m!242581))

(declare-fun m!242583 () Bool)

(assert (=> b!156022 m!242583))

(declare-fun m!242585 () Bool)

(assert (=> b!156022 m!242585))

(declare-fun m!242587 () Bool)

(assert (=> b!156022 m!242587))

(declare-fun m!242589 () Bool)

(assert (=> b!156022 m!242589))

(declare-fun m!242591 () Bool)

(assert (=> b!156022 m!242591))

(declare-fun m!242593 () Bool)

(assert (=> b!156022 m!242593))

(assert (=> b!156022 m!242487))

(declare-fun m!242595 () Bool)

(assert (=> b!156022 m!242595))

(declare-fun m!242597 () Bool)

(assert (=> b!156022 m!242597))

(declare-fun m!242599 () Bool)

(assert (=> b!156022 m!242599))

(assert (=> b!156022 m!242571))

(declare-fun m!242601 () Bool)

(assert (=> b!156022 m!242601))

(declare-fun m!242603 () Bool)

(assert (=> b!156022 m!242603))

(declare-fun m!242605 () Bool)

(assert (=> bm!2325 m!242605))

(declare-fun m!242607 () Bool)

(assert (=> d!51752 m!242607))

(assert (=> d!51752 m!242583))

(assert (=> d!51726 d!51752))

(declare-fun d!51770 () Bool)

(assert (=> d!51770 (= (invariant!0 (currentBit!6782 bs!65) (currentByte!6787 bs!65) (size!3202 (buf!3705 bs!65))) (and (bvsge (currentBit!6782 bs!65) #b00000000000000000000000000000000) (bvslt (currentBit!6782 bs!65) #b00000000000000000000000000001000) (bvsge (currentByte!6787 bs!65) #b00000000000000000000000000000000) (or (bvslt (currentByte!6787 bs!65) (size!3202 (buf!3705 bs!65))) (and (= (currentBit!6782 bs!65) #b00000000000000000000000000000000) (= (currentByte!6787 bs!65) (size!3202 (buf!3705 bs!65)))))))))

(assert (=> d!51708 d!51770))

(declare-fun d!51772 () Bool)

(assert (=> d!51772 (= (remainingBits!0 ((_ sign_extend 32) (size!3202 (buf!3705 bs!65))) ((_ sign_extend 32) (currentByte!6787 bs!65)) ((_ sign_extend 32) (currentBit!6782 bs!65))) (bvsub (bvmul ((_ sign_extend 32) (size!3202 (buf!3705 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6787 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6782 bs!65)))))))

(assert (=> d!51704 d!51772))

(declare-fun bm!2328 () Bool)

(declare-fun call!2333 () (_ BitVec 64))

(declare-fun c!8299 () Bool)

(declare-fun lt!243230 () tuple3!624)

(assert (=> bm!2328 (= call!2333 (bitIndex!0 (ite c!8299 (size!3202 (buf!3705 (_2!7367 lt!243230))) (size!3202 (buf!3705 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)))) (ite c!8299 (currentByte!6787 (_2!7367 lt!243230)) (currentByte!6787 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) (ite c!8299 (currentBit!6782 (_2!7367 lt!243230)) (currentBit!6782 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)))))))

(declare-fun call!2332 () Bool)

(declare-fun bm!2329 () Bool)

(assert (=> bm!2329 (= call!2332 (arrayRangesEq!417 (array!7132 (store (arr!4040 arr!153) from!240 (_2!7362 (readBytePure!0 bs!65))) (size!3202 arr!153)) (ite c!8299 (_3!429 lt!243230) (array!7132 (store (arr!4040 arr!153) from!240 (_2!7362 (readBytePure!0 bs!65))) (size!3202 arr!153))) #b00000000000000000000000000000000 (ite c!8299 (bvadd #b00000000000000000000000000000001 from!240) (size!3202 (array!7132 (store (arr!4040 arr!153) from!240 (_2!7362 (readBytePure!0 bs!65))) (size!3202 arr!153))))))))

(declare-fun d!51774 () Bool)

(declare-fun e!105321 () Bool)

(assert (=> d!51774 e!105321))

(declare-fun res!130441 () Bool)

(assert (=> d!51774 (=> res!130441 e!105321)))

(assert (=> d!51774 (= res!130441 (bvsge (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun lt!243231 () Bool)

(declare-fun e!105322 () Bool)

(assert (=> d!51774 (= lt!243231 e!105322)))

(declare-fun res!130439 () Bool)

(assert (=> d!51774 (=> (not res!130439) (not e!105322))))

(declare-fun lt!243217 () tuple3!624)

(declare-fun lt!243223 () (_ BitVec 64))

(declare-fun lt!243228 () (_ BitVec 64))

(assert (=> d!51774 (= res!130439 (= (bvadd lt!243223 lt!243228) (bitIndex!0 (size!3202 (buf!3705 (_2!7367 lt!243217))) (currentByte!6787 (_2!7367 lt!243217)) (currentBit!6782 (_2!7367 lt!243217)))))))

(assert (=> d!51774 (or (not (= (bvand lt!243223 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!243228 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!243223 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!243223 lt!243228) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!243236 () (_ BitVec 64))

(assert (=> d!51774 (= lt!243228 (bvmul lt!243236 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!51774 (or (= lt!243236 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!243236 #b0000000000000000000000000000000000000000000000000000000000001000) lt!243236)))))

(assert (=> d!51774 (= lt!243236 ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))))))

(assert (=> d!51774 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!240) #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b10000000000000000000000000000000)))))

(assert (=> d!51774 (= lt!243223 (bitIndex!0 (size!3202 (buf!3705 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) (currentByte!6787 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (currentBit!6782 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))))

(declare-fun e!105323 () tuple3!624)

(assert (=> d!51774 (= lt!243217 e!105323)))

(assert (=> d!51774 (= c!8299 (bvslt (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!51774 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvsle (bvadd #b00000000000000000000000000000001 from!240) to!236) (bvsle to!236 (size!3202 (array!7132 (store (arr!4040 arr!153) from!240 (_2!7362 (readBytePure!0 bs!65))) (size!3202 arr!153)))))))

(assert (=> d!51774 (= (readByteArrayLoop!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7132 (store (arr!4040 arr!153) from!240 (_2!7362 (readBytePure!0 bs!65))) (size!3202 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236) lt!243217)))

(declare-fun b!156023 () Bool)

(assert (=> b!156023 (= e!105321 (= (select (arr!4040 (_3!429 lt!243217)) (bvadd #b00000000000000000000000000000001 from!240)) (_2!7362 (readBytePure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)))))))

(assert (=> b!156023 (and (bvsge (bvadd #b00000000000000000000000000000001 from!240) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!240) (size!3202 (_3!429 lt!243217))))))

(declare-fun b!156024 () Bool)

(assert (=> b!156024 (= e!105322 (arrayRangesEq!417 (array!7132 (store (arr!4040 arr!153) from!240 (_2!7362 (readBytePure!0 bs!65))) (size!3202 arr!153)) (_3!429 lt!243217) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun call!2331 () Bool)

(declare-fun lt!243225 () array!7131)

(declare-fun lt!243222 () (_ BitVec 32))

(declare-fun lt!243215 () (_ BitVec 32))

(declare-fun lt!243235 () array!7131)

(declare-fun bm!2330 () Bool)

(declare-fun lt!243211 () tuple2!13878)

(assert (=> bm!2330 (= call!2331 (arrayRangesEq!417 (ite c!8299 (array!7132 (store (arr!4040 arr!153) from!240 (_2!7362 (readBytePure!0 bs!65))) (size!3202 arr!153)) lt!243225) (ite c!8299 (array!7132 (store (arr!4040 (array!7132 (store (arr!4040 arr!153) from!240 (_2!7362 (readBytePure!0 bs!65))) (size!3202 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7369 lt!243211)) (size!3202 (array!7132 (store (arr!4040 arr!153) from!240 (_2!7362 (readBytePure!0 bs!65))) (size!3202 arr!153)))) lt!243235) (ite c!8299 #b00000000000000000000000000000000 lt!243215) (ite c!8299 (bvadd #b00000000000000000000000000000001 from!240) lt!243222)))))

(declare-fun lt!243209 () Unit!9886)

(declare-fun b!156025 () Bool)

(assert (=> b!156025 (= e!105323 (tuple3!625 lt!243209 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7132 (store (arr!4040 arr!153) from!240 (_2!7362 (readBytePure!0 bs!65))) (size!3202 arr!153))))))

(assert (=> b!156025 (= call!2333 call!2333)))

(declare-fun lt!243229 () Unit!9886)

(declare-fun Unit!9912 () Unit!9886)

(assert (=> b!156025 (= lt!243229 Unit!9912)))

(declare-fun lt!243233 () Unit!9886)

(assert (=> b!156025 (= lt!243233 (arrayRangesEqReflexiveLemma!28 (array!7132 (store (arr!4040 arr!153) from!240 (_2!7362 (readBytePure!0 bs!65))) (size!3202 arr!153))))))

(assert (=> b!156025 call!2332))

(declare-fun lt!243234 () Unit!9886)

(assert (=> b!156025 (= lt!243234 lt!243233)))

(assert (=> b!156025 (= lt!243225 (array!7132 (store (arr!4040 arr!153) from!240 (_2!7362 (readBytePure!0 bs!65))) (size!3202 arr!153)))))

(assert (=> b!156025 (= lt!243235 (array!7132 (store (arr!4040 arr!153) from!240 (_2!7362 (readBytePure!0 bs!65))) (size!3202 arr!153)))))

(declare-fun lt!243220 () (_ BitVec 32))

(assert (=> b!156025 (= lt!243220 #b00000000000000000000000000000000)))

(declare-fun lt!243216 () (_ BitVec 32))

(assert (=> b!156025 (= lt!243216 (size!3202 (array!7132 (store (arr!4040 arr!153) from!240 (_2!7362 (readBytePure!0 bs!65))) (size!3202 arr!153))))))

(assert (=> b!156025 (= lt!243215 #b00000000000000000000000000000000)))

(assert (=> b!156025 (= lt!243222 (bvadd #b00000000000000000000000000000001 from!240))))

(assert (=> b!156025 (= lt!243209 (arrayRangesEqSlicedLemma!28 lt!243225 lt!243235 lt!243220 lt!243216 lt!243215 lt!243222))))

(assert (=> b!156025 call!2331))

(declare-fun b!156026 () Bool)

(declare-fun res!130440 () Bool)

(assert (=> b!156026 (=> (not res!130440) (not e!105322))))

(assert (=> b!156026 (= res!130440 (and (= (buf!3705 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (buf!3705 (_2!7367 lt!243217))) (= (size!3202 (array!7132 (store (arr!4040 arr!153) from!240 (_2!7362 (readBytePure!0 bs!65))) (size!3202 arr!153))) (size!3202 (_3!429 lt!243217)))))))

(declare-fun b!156027 () Bool)

(declare-fun lt!243232 () Unit!9886)

(assert (=> b!156027 (= e!105323 (tuple3!625 lt!243232 (_2!7367 lt!243230) (_3!429 lt!243230)))))

(assert (=> b!156027 (= lt!243211 (readByte!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun lt!243214 () array!7131)

(assert (=> b!156027 (= lt!243214 (array!7132 (store (arr!4040 (array!7132 (store (arr!4040 arr!153) from!240 (_2!7362 (readBytePure!0 bs!65))) (size!3202 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7369 lt!243211)) (size!3202 (array!7132 (store (arr!4040 arr!153) from!240 (_2!7362 (readBytePure!0 bs!65))) (size!3202 arr!153)))))))

(declare-fun lt!243212 () (_ BitVec 64))

(assert (=> b!156027 (= lt!243212 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!243243 () (_ BitVec 32))

(assert (=> b!156027 (= lt!243243 (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!243237 () Unit!9886)

(assert (=> b!156027 (= lt!243237 (validateOffsetBytesFromBitIndexLemma!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7369 lt!243211) lt!243212 lt!243243))))

(assert (=> b!156027 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3202 (buf!3705 (_2!7369 lt!243211)))) ((_ sign_extend 32) (currentByte!6787 (_2!7369 lt!243211))) ((_ sign_extend 32) (currentBit!6782 (_2!7369 lt!243211))) (bvsub lt!243243 ((_ extract 31 0) (bvsdiv (bvadd lt!243212 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!243244 () Unit!9886)

(assert (=> b!156027 (= lt!243244 lt!243237)))

(assert (=> b!156027 (= lt!243230 (readByteArrayLoop!0 (_2!7369 lt!243211) lt!243214 (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> b!156027 (= (bitIndex!0 (size!3202 (buf!3705 (_2!7369 lt!243211))) (currentByte!6787 (_2!7369 lt!243211)) (currentBit!6782 (_2!7369 lt!243211))) (bvadd (bitIndex!0 (size!3202 (buf!3705 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) (currentByte!6787 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (currentBit!6782 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!243239 () Unit!9886)

(declare-fun Unit!9914 () Unit!9886)

(assert (=> b!156027 (= lt!243239 Unit!9914)))

(assert (=> b!156027 (= (bvadd (bitIndex!0 (size!3202 (buf!3705 (_2!7369 lt!243211))) (currentByte!6787 (_2!7369 lt!243211)) (currentBit!6782 (_2!7369 lt!243211))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2333)))

(declare-fun lt!243218 () Unit!9886)

(declare-fun Unit!9915 () Unit!9886)

(assert (=> b!156027 (= lt!243218 Unit!9915)))

(assert (=> b!156027 (= (bvadd (bitIndex!0 (size!3202 (buf!3705 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) (currentByte!6787 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (currentBit!6782 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))) (bvmul ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))) #b0000000000000000000000000000000000000000000000000000000000001000)) call!2333)))

(declare-fun lt!243210 () Unit!9886)

(declare-fun Unit!9917 () Unit!9886)

(assert (=> b!156027 (= lt!243210 Unit!9917)))

(assert (=> b!156027 (and (= (buf!3705 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001)) (buf!3705 (_2!7367 lt!243230))) (= (size!3202 (array!7132 (store (arr!4040 arr!153) from!240 (_2!7362 (readBytePure!0 bs!65))) (size!3202 arr!153))) (size!3202 (_3!429 lt!243230))))))

(declare-fun lt!243224 () Unit!9886)

(declare-fun Unit!9918 () Unit!9886)

(assert (=> b!156027 (= lt!243224 Unit!9918)))

(declare-fun lt!243242 () Unit!9886)

(assert (=> b!156027 (= lt!243242 (arrayUpdatedAtPrefixLemma!28 (array!7132 (store (arr!4040 arr!153) from!240 (_2!7362 (readBytePure!0 bs!65))) (size!3202 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) (_1!7369 lt!243211)))))

(assert (=> b!156027 call!2331))

(declare-fun lt!243227 () Unit!9886)

(assert (=> b!156027 (= lt!243227 lt!243242)))

(declare-fun lt!243219 () (_ BitVec 32))

(assert (=> b!156027 (= lt!243219 #b00000000000000000000000000000000)))

(declare-fun lt!243238 () Unit!9886)

(assert (=> b!156027 (= lt!243238 (arrayRangesEqTransitive!93 (array!7132 (store (arr!4040 arr!153) from!240 (_2!7362 (readBytePure!0 bs!65))) (size!3202 arr!153)) lt!243214 (_3!429 lt!243230) lt!243219 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!156027 (arrayRangesEq!417 (array!7132 (store (arr!4040 arr!153) from!240 (_2!7362 (readBytePure!0 bs!65))) (size!3202 arr!153)) (_3!429 lt!243230) lt!243219 (bvadd #b00000000000000000000000000000001 from!240))))

(declare-fun lt!243221 () Unit!9886)

(assert (=> b!156027 (= lt!243221 lt!243238)))

(assert (=> b!156027 call!2332))

(declare-fun lt!243240 () Unit!9886)

(declare-fun Unit!9924 () Unit!9886)

(assert (=> b!156027 (= lt!243240 Unit!9924)))

(declare-fun lt!243241 () Unit!9886)

(assert (=> b!156027 (= lt!243241 (arrayRangesEqImpliesEq!37 lt!243214 (_3!429 lt!243230) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!156027 (= (select (store (arr!4040 (array!7132 (store (arr!4040 arr!153) from!240 (_2!7362 (readBytePure!0 bs!65))) (size!3202 arr!153))) (bvadd #b00000000000000000000000000000001 from!240) (_1!7369 lt!243211)) (bvadd #b00000000000000000000000000000001 from!240)) (select (arr!4040 (_3!429 lt!243230)) (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!243213 () Unit!9886)

(assert (=> b!156027 (= lt!243213 lt!243241)))

(declare-fun lt!243226 () Bool)

(assert (=> b!156027 (= lt!243226 (= (select (arr!4040 (_3!429 lt!243230)) (bvadd #b00000000000000000000000000000001 from!240)) (_1!7369 lt!243211)))))

(declare-fun Unit!9927 () Unit!9886)

(assert (=> b!156027 (= lt!243232 Unit!9927)))

(assert (=> b!156027 lt!243226))

(assert (= (and d!51774 c!8299) b!156027))

(assert (= (and d!51774 (not c!8299)) b!156025))

(assert (= (or b!156027 b!156025) bm!2330))

(assert (= (or b!156027 b!156025) bm!2329))

(assert (= (or b!156027 b!156025) bm!2328))

(assert (= (and d!51774 res!130439) b!156026))

(assert (= (and b!156026 res!130440) b!156024))

(assert (= (and d!51774 (not res!130441)) b!156023))

(declare-fun m!242609 () Bool)

(assert (=> b!156023 m!242609))

(assert (=> b!156023 m!242429))

(declare-fun m!242611 () Bool)

(assert (=> b!156023 m!242611))

(declare-fun m!242613 () Bool)

(assert (=> bm!2330 m!242613))

(declare-fun m!242615 () Bool)

(assert (=> bm!2330 m!242615))

(declare-fun m!242617 () Bool)

(assert (=> b!156024 m!242617))

(declare-fun m!242619 () Bool)

(assert (=> b!156025 m!242619))

(declare-fun m!242621 () Bool)

(assert (=> b!156025 m!242621))

(declare-fun m!242623 () Bool)

(assert (=> bm!2329 m!242623))

(declare-fun m!242625 () Bool)

(assert (=> b!156027 m!242625))

(declare-fun m!242627 () Bool)

(assert (=> b!156027 m!242627))

(declare-fun m!242629 () Bool)

(assert (=> b!156027 m!242629))

(assert (=> b!156027 m!242429))

(declare-fun m!242631 () Bool)

(assert (=> b!156027 m!242631))

(declare-fun m!242633 () Bool)

(assert (=> b!156027 m!242633))

(declare-fun m!242635 () Bool)

(assert (=> b!156027 m!242635))

(assert (=> b!156027 m!242429))

(declare-fun m!242637 () Bool)

(assert (=> b!156027 m!242637))

(declare-fun m!242639 () Bool)

(assert (=> b!156027 m!242639))

(declare-fun m!242641 () Bool)

(assert (=> b!156027 m!242641))

(declare-fun m!242643 () Bool)

(assert (=> b!156027 m!242643))

(assert (=> b!156027 m!242613))

(declare-fun m!242645 () Bool)

(assert (=> b!156027 m!242645))

(declare-fun m!242647 () Bool)

(assert (=> b!156027 m!242647))

(declare-fun m!242649 () Bool)

(assert (=> bm!2328 m!242649))

(declare-fun m!242651 () Bool)

(assert (=> d!51774 m!242651))

(assert (=> d!51774 m!242625))

(assert (=> d!51710 d!51774))

(declare-fun d!51776 () Bool)

(declare-fun lt!243317 () (_ BitVec 8))

(declare-fun lt!243320 () (_ BitVec 8))

(assert (=> d!51776 (= lt!243317 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4040 (buf!3705 bs!65)) (currentByte!6787 bs!65))) ((_ sign_extend 24) lt!243320))))))

(assert (=> d!51776 (= lt!243320 ((_ extract 7 0) (currentBit!6782 bs!65)))))

(declare-fun e!105337 () Bool)

(assert (=> d!51776 e!105337))

(declare-fun res!130457 () Bool)

(assert (=> d!51776 (=> (not res!130457) (not e!105337))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!51776 (= res!130457 (validate_offset_bits!1 ((_ sign_extend 32) (size!3202 (buf!3705 bs!65))) ((_ sign_extend 32) (currentByte!6787 bs!65)) ((_ sign_extend 32) (currentBit!6782 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!13892 0))(
  ( (tuple2!13893 (_1!7378 Unit!9886) (_2!7378 (_ BitVec 8))) )
))
(declare-fun Unit!9930 () Unit!9886)

(declare-fun Unit!9931 () Unit!9886)

(assert (=> d!51776 (= (readByte!0 bs!65) (tuple2!13879 (_2!7378 (ite (bvsgt ((_ sign_extend 24) lt!243320) #b00000000000000000000000000000000) (tuple2!13893 Unit!9930 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!243317) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4040 (buf!3705 bs!65)) (bvadd (currentByte!6787 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!243320)))))))) (tuple2!13893 Unit!9931 lt!243317))) (BitStream!5663 (buf!3705 bs!65) (bvadd (currentByte!6787 bs!65) #b00000000000000000000000000000001) (currentBit!6782 bs!65))))))

(declare-fun b!156043 () Bool)

(declare-fun e!105338 () Bool)

(assert (=> b!156043 (= e!105337 e!105338)))

(declare-fun res!130456 () Bool)

(assert (=> b!156043 (=> (not res!130456) (not e!105338))))

(declare-fun lt!243321 () tuple2!13878)

(assert (=> b!156043 (= res!130456 (= (buf!3705 (_2!7369 lt!243321)) (buf!3705 bs!65)))))

(declare-fun lt!243319 () (_ BitVec 8))

(declare-fun lt!243322 () (_ BitVec 8))

(declare-fun Unit!9932 () Unit!9886)

(declare-fun Unit!9933 () Unit!9886)

(assert (=> b!156043 (= lt!243321 (tuple2!13879 (_2!7378 (ite (bvsgt ((_ sign_extend 24) lt!243319) #b00000000000000000000000000000000) (tuple2!13893 Unit!9932 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!243322) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4040 (buf!3705 bs!65)) (bvadd (currentByte!6787 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!243319)))))))) (tuple2!13893 Unit!9933 lt!243322))) (BitStream!5663 (buf!3705 bs!65) (bvadd (currentByte!6787 bs!65) #b00000000000000000000000000000001) (currentBit!6782 bs!65))))))

(assert (=> b!156043 (= lt!243322 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4040 (buf!3705 bs!65)) (currentByte!6787 bs!65))) ((_ sign_extend 24) lt!243319))))))

(assert (=> b!156043 (= lt!243319 ((_ extract 7 0) (currentBit!6782 bs!65)))))

(declare-fun lt!243316 () (_ BitVec 64))

(declare-fun lt!243318 () (_ BitVec 64))

(declare-fun b!156044 () Bool)

(assert (=> b!156044 (= e!105338 (= (bitIndex!0 (size!3202 (buf!3705 (_2!7369 lt!243321))) (currentByte!6787 (_2!7369 lt!243321)) (currentBit!6782 (_2!7369 lt!243321))) (bvadd lt!243316 lt!243318)))))

(assert (=> b!156044 (or (not (= (bvand lt!243316 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!243318 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!243316 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!243316 lt!243318) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!156044 (= lt!243318 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!156044 (= lt!243316 (bitIndex!0 (size!3202 (buf!3705 bs!65)) (currentByte!6787 bs!65) (currentBit!6782 bs!65)))))

(assert (= (and d!51776 res!130457) b!156043))

(assert (= (and b!156043 res!130456) b!156044))

(declare-fun m!242701 () Bool)

(assert (=> d!51776 m!242701))

(declare-fun m!242703 () Bool)

(assert (=> d!51776 m!242703))

(declare-fun m!242705 () Bool)

(assert (=> d!51776 m!242705))

(assert (=> b!156043 m!242705))

(assert (=> b!156043 m!242701))

(declare-fun m!242707 () Bool)

(assert (=> b!156044 m!242707))

(assert (=> b!156044 m!242583))

(assert (=> d!51722 d!51776))

(declare-fun d!51784 () Bool)

(declare-fun e!105341 () Bool)

(assert (=> d!51784 e!105341))

(declare-fun res!130460 () Bool)

(assert (=> d!51784 (=> (not res!130460) (not e!105341))))

(declare-fun moveByteIndexPrecond!0 (BitStream!5662 (_ BitVec 32)) Bool)

(assert (=> d!51784 (= res!130460 (moveByteIndexPrecond!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun Unit!9935 () Unit!9886)

(assert (=> d!51784 (= (moveByteIndex!0 bs!65 #b00000000000000000000000000000001) (tuple2!13877 Unit!9935 (BitStream!5663 (buf!3705 bs!65) (bvadd (currentByte!6787 bs!65) #b00000000000000000000000000000001) (currentBit!6782 bs!65))))))

(declare-fun b!156047 () Bool)

(assert (=> b!156047 (= e!105341 (and (or (not (= (bvand (currentByte!6787 bs!65) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!6787 bs!65) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!6787 bs!65) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!6787 bs!65) #b00000000000000000000000000000001) (bvadd (currentByte!6787 bs!65) #b00000000000000000000000000000001))))))

(assert (= (and d!51784 res!130460) b!156047))

(declare-fun m!242709 () Bool)

(assert (=> d!51784 m!242709))

(assert (=> d!51720 d!51784))

(push 1)

(assert (not b!156022))

(assert (not b!156020))

(assert (not bm!2329))

(assert (not d!51774))

(assert (not b!156025))

(assert (not bm!2330))

(assert (not bm!2328))

(assert (not bm!2325))

(assert (not d!51784))

(assert (not b!156018))

(assert (not bm!2326))

(assert (not b!156019))

(assert (not b!156027))

(assert (not b!156023))

(assert (not b!156044))

(assert (not b!156024))

(assert (not d!51752))

(assert (not d!51776))

(assert (not bm!2327))

(check-sat)

(pop 1)

(push 1)

(check-sat)

