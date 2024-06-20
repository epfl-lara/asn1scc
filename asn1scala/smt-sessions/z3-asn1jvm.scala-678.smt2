; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19024 () Bool)

(assert start!19024)

(declare-fun b!95093 () Bool)

(declare-fun res!78303 () Bool)

(declare-fun e!62327 () Bool)

(assert (=> b!95093 (=> (not res!78303) (not e!62327))))

(declare-datatypes ((List!879 0))(
  ( (Nil!876) (Cons!875 (h!994 Bool) (t!1629 List!879)) )
))
(declare-fun listBits!13 () List!879)

(declare-fun length!470 (List!879) Int)

(assert (=> b!95093 (= res!78303 (> (length!470 listBits!13) 0))))

(declare-fun b!95094 () Bool)

(declare-fun e!62328 () Bool)

(declare-datatypes ((array!4442 0))(
  ( (array!4443 (arr!2629 (Array (_ BitVec 32) (_ BitVec 8))) (size!2024 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3546 0))(
  ( (BitStream!3547 (buf!2382 array!4442) (currentByte!4751 (_ BitVec 32)) (currentBit!4746 (_ BitVec 32))) )
))
(declare-fun thiss!1534 () BitStream!3546)

(declare-fun array_inv!1838 (array!4442) Bool)

(assert (=> b!95094 (= e!62328 (array_inv!1838 (buf!2382 thiss!1534)))))

(declare-fun b!95095 () Bool)

(declare-fun e!62323 () Bool)

(declare-fun bitStream2!8 () BitStream!3546)

(assert (=> b!95095 (= e!62323 (array_inv!1838 (buf!2382 bitStream2!8)))))

(declare-fun res!78295 () Bool)

(assert (=> start!19024 (=> (not res!78295) (not e!62327))))

(declare-fun nBits!484 () (_ BitVec 64))

(assert (=> start!19024 (= res!78295 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!19024 e!62327))

(assert (=> start!19024 true))

(declare-fun bitStream1!8 () BitStream!3546)

(declare-fun e!62326 () Bool)

(declare-fun inv!12 (BitStream!3546) Bool)

(assert (=> start!19024 (and (inv!12 bitStream1!8) e!62326)))

(assert (=> start!19024 (and (inv!12 bitStream2!8) e!62323)))

(declare-fun base!8 () BitStream!3546)

(declare-fun e!62329 () Bool)

(assert (=> start!19024 (and (inv!12 base!8) e!62329)))

(assert (=> start!19024 (and (inv!12 thiss!1534) e!62328)))

(declare-fun b!95096 () Bool)

(assert (=> b!95096 (= e!62326 (array_inv!1838 (buf!2382 bitStream1!8)))))

(declare-fun b!95097 () Bool)

(declare-fun res!78302 () Bool)

(assert (=> b!95097 (=> (not res!78302) (not e!62327))))

(declare-fun isPrefixOf!0 (BitStream!3546 BitStream!3546) Bool)

(assert (=> b!95097 (= res!78302 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!95098 () Bool)

(declare-fun res!78299 () Bool)

(assert (=> b!95098 (=> (not res!78299) (not e!62327))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!95098 (= res!78299 (validate_offset_bits!1 ((_ sign_extend 32) (size!2024 (buf!2382 bitStream1!8))) ((_ sign_extend 32) (currentByte!4751 bitStream1!8)) ((_ sign_extend 32) (currentBit!4746 bitStream1!8)) nBits!484))))

(declare-fun b!95099 () Bool)

(declare-fun res!78297 () Bool)

(assert (=> b!95099 (=> (not res!78297) (not e!62327))))

(assert (=> b!95099 (= res!78297 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!95100 () Bool)

(declare-fun res!78298 () Bool)

(assert (=> b!95100 (=> (not res!78298) (not e!62327))))

(assert (=> b!95100 (= res!78298 (validate_offset_bits!1 ((_ sign_extend 32) (size!2024 (buf!2382 bitStream2!8))) ((_ sign_extend 32) (currentByte!4751 bitStream2!8)) ((_ sign_extend 32) (currentBit!4746 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!95101 () Bool)

(assert (=> b!95101 (= e!62329 (array_inv!1838 (buf!2382 base!8)))))

(declare-fun b!95102 () Bool)

(declare-datatypes ((tuple2!7686 0))(
  ( (tuple2!7687 (_1!4090 BitStream!3546) (_2!4090 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!3546) tuple2!7686)

(declare-fun head!591 (List!879) Bool)

(assert (=> b!95102 (= e!62327 (not (= (_2!4090 (readBitPure!0 bitStream1!8)) (head!591 listBits!13))))))

(declare-fun b!95103 () Bool)

(declare-fun res!78304 () Bool)

(assert (=> b!95103 (=> (not res!78304) (not e!62327))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!95103 (= res!78304 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2024 (buf!2382 bitStream1!8)) (currentByte!4751 bitStream1!8) (currentBit!4746 bitStream1!8))) (bitIndex!0 (size!2024 (buf!2382 bitStream2!8)) (currentByte!4751 bitStream2!8) (currentBit!4746 bitStream2!8))))))

(declare-fun b!95104 () Bool)

(declare-fun res!78305 () Bool)

(assert (=> b!95104 (=> (not res!78305) (not e!62327))))

(assert (=> b!95104 (= res!78305 (not (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!95105 () Bool)

(declare-fun res!78301 () Bool)

(assert (=> b!95105 (=> (not res!78301) (not e!62327))))

(assert (=> b!95105 (= res!78301 (and (= (buf!2382 bitStream1!8) (buf!2382 bitStream2!8)) (= (buf!2382 bitStream1!8) (buf!2382 base!8))))))

(declare-fun b!95106 () Bool)

(declare-fun res!78296 () Bool)

(assert (=> b!95106 (=> (not res!78296) (not e!62327))))

(assert (=> b!95106 (= res!78296 (bvslt (bitIndex!0 (size!2024 (buf!2382 base!8)) (currentByte!4751 base!8) (currentBit!4746 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!95107 () Bool)

(declare-fun res!78300 () Bool)

(assert (=> b!95107 (=> (not res!78300) (not e!62327))))

(assert (=> b!95107 (= res!78300 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!95108 () Bool)

(declare-fun res!78306 () Bool)

(assert (=> b!95108 (=> (not res!78306) (not e!62327))))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!3546 BitStream!3546 (_ BitVec 64)) List!879)

(assert (=> b!95108 (= res!78306 (= listBits!13 (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484)))))

(assert (= (and start!19024 res!78295) b!95093))

(assert (= (and b!95093 res!78303) b!95107))

(assert (= (and b!95107 res!78300) b!95099))

(assert (= (and b!95099 res!78297) b!95097))

(assert (= (and b!95097 res!78302) b!95105))

(assert (= (and b!95105 res!78301) b!95106))

(assert (= (and b!95106 res!78296) b!95103))

(assert (= (and b!95103 res!78304) b!95098))

(assert (= (and b!95098 res!78299) b!95100))

(assert (= (and b!95100 res!78298) b!95108))

(assert (= (and b!95108 res!78306) b!95104))

(assert (= (and b!95104 res!78305) b!95102))

(assert (= start!19024 b!95096))

(assert (= start!19024 b!95095))

(assert (= start!19024 b!95101))

(assert (= start!19024 b!95094))

(declare-fun m!138555 () Bool)

(assert (=> b!95102 m!138555))

(declare-fun m!138557 () Bool)

(assert (=> b!95102 m!138557))

(declare-fun m!138559 () Bool)

(assert (=> b!95095 m!138559))

(declare-fun m!138561 () Bool)

(assert (=> b!95098 m!138561))

(declare-fun m!138563 () Bool)

(assert (=> b!95101 m!138563))

(declare-fun m!138565 () Bool)

(assert (=> b!95106 m!138565))

(declare-fun m!138567 () Bool)

(assert (=> b!95096 m!138567))

(declare-fun m!138569 () Bool)

(assert (=> b!95097 m!138569))

(declare-fun m!138571 () Bool)

(assert (=> b!95094 m!138571))

(declare-fun m!138573 () Bool)

(assert (=> b!95103 m!138573))

(declare-fun m!138575 () Bool)

(assert (=> b!95103 m!138575))

(declare-fun m!138577 () Bool)

(assert (=> b!95100 m!138577))

(declare-fun m!138579 () Bool)

(assert (=> b!95108 m!138579))

(declare-fun m!138581 () Bool)

(assert (=> b!95099 m!138581))

(declare-fun m!138583 () Bool)

(assert (=> start!19024 m!138583))

(declare-fun m!138585 () Bool)

(assert (=> start!19024 m!138585))

(declare-fun m!138587 () Bool)

(assert (=> start!19024 m!138587))

(declare-fun m!138589 () Bool)

(assert (=> start!19024 m!138589))

(declare-fun m!138591 () Bool)

(assert (=> b!95107 m!138591))

(declare-fun m!138593 () Bool)

(assert (=> b!95093 m!138593))

(check-sat (not b!95096) (not b!95093) (not b!95107) (not b!95098) (not b!95103) (not b!95094) (not b!95095) (not b!95102) (not b!95106) (not start!19024) (not b!95101) (not b!95108) (not b!95099) (not b!95097) (not b!95100))
(check-sat)
(get-model)

(declare-fun d!29560 () Bool)

(assert (=> d!29560 (= (array_inv!1838 (buf!2382 thiss!1534)) (bvsge (size!2024 (buf!2382 thiss!1534)) #b00000000000000000000000000000000))))

(assert (=> b!95094 d!29560))

(declare-fun d!29562 () Bool)

(assert (=> d!29562 (= (array_inv!1838 (buf!2382 bitStream2!8)) (bvsge (size!2024 (buf!2382 bitStream2!8)) #b00000000000000000000000000000000))))

(assert (=> b!95095 d!29562))

(declare-fun d!29564 () Bool)

(declare-fun e!62361 () Bool)

(assert (=> d!29564 e!62361))

(declare-fun res!78347 () Bool)

(assert (=> d!29564 (=> (not res!78347) (not e!62361))))

(declare-fun lt!138988 () (_ BitVec 64))

(declare-fun lt!138993 () (_ BitVec 64))

(declare-fun lt!138992 () (_ BitVec 64))

(assert (=> d!29564 (= res!78347 (= lt!138988 (bvsub lt!138993 lt!138992)))))

(assert (=> d!29564 (or (= (bvand lt!138993 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138992 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138993 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138993 lt!138992) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!29564 (= lt!138992 (remainingBits!0 ((_ sign_extend 32) (size!2024 (buf!2382 base!8))) ((_ sign_extend 32) (currentByte!4751 base!8)) ((_ sign_extend 32) (currentBit!4746 base!8))))))

(declare-fun lt!138991 () (_ BitVec 64))

(declare-fun lt!138989 () (_ BitVec 64))

(assert (=> d!29564 (= lt!138993 (bvmul lt!138991 lt!138989))))

(assert (=> d!29564 (or (= lt!138991 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138989 (bvsdiv (bvmul lt!138991 lt!138989) lt!138991)))))

(assert (=> d!29564 (= lt!138989 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29564 (= lt!138991 ((_ sign_extend 32) (size!2024 (buf!2382 base!8))))))

(assert (=> d!29564 (= lt!138988 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4751 base!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4746 base!8))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!29564 (invariant!0 (currentBit!4746 base!8) (currentByte!4751 base!8) (size!2024 (buf!2382 base!8)))))

(assert (=> d!29564 (= (bitIndex!0 (size!2024 (buf!2382 base!8)) (currentByte!4751 base!8) (currentBit!4746 base!8)) lt!138988)))

(declare-fun b!95161 () Bool)

(declare-fun res!78348 () Bool)

(assert (=> b!95161 (=> (not res!78348) (not e!62361))))

(assert (=> b!95161 (= res!78348 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138988))))

(declare-fun b!95162 () Bool)

(declare-fun lt!138990 () (_ BitVec 64))

(assert (=> b!95162 (= e!62361 (bvsle lt!138988 (bvmul lt!138990 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!95162 (or (= lt!138990 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138990 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138990)))))

(assert (=> b!95162 (= lt!138990 ((_ sign_extend 32) (size!2024 (buf!2382 base!8))))))

(assert (= (and d!29564 res!78347) b!95161))

(assert (= (and b!95161 res!78348) b!95162))

(declare-fun m!138635 () Bool)

(assert (=> d!29564 m!138635))

(declare-fun m!138637 () Bool)

(assert (=> d!29564 m!138637))

(assert (=> b!95106 d!29564))

(declare-fun d!29566 () Bool)

(assert (=> d!29566 (= (array_inv!1838 (buf!2382 bitStream1!8)) (bvsge (size!2024 (buf!2382 bitStream1!8)) #b00000000000000000000000000000000))))

(assert (=> b!95096 d!29566))

(declare-fun d!29568 () Bool)

(declare-fun res!78356 () Bool)

(declare-fun e!62366 () Bool)

(assert (=> d!29568 (=> (not res!78356) (not e!62366))))

(assert (=> d!29568 (= res!78356 (= (size!2024 (buf!2382 bitStream1!8)) (size!2024 (buf!2382 base!8))))))

(assert (=> d!29568 (= (isPrefixOf!0 bitStream1!8 base!8) e!62366)))

(declare-fun b!95169 () Bool)

(declare-fun res!78357 () Bool)

(assert (=> b!95169 (=> (not res!78357) (not e!62366))))

(assert (=> b!95169 (= res!78357 (bvsle (bitIndex!0 (size!2024 (buf!2382 bitStream1!8)) (currentByte!4751 bitStream1!8) (currentBit!4746 bitStream1!8)) (bitIndex!0 (size!2024 (buf!2382 base!8)) (currentByte!4751 base!8) (currentBit!4746 base!8))))))

(declare-fun b!95170 () Bool)

(declare-fun e!62367 () Bool)

(assert (=> b!95170 (= e!62366 e!62367)))

(declare-fun res!78355 () Bool)

(assert (=> b!95170 (=> res!78355 e!62367)))

(assert (=> b!95170 (= res!78355 (= (size!2024 (buf!2382 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!95171 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4442 array!4442 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!95171 (= e!62367 (arrayBitRangesEq!0 (buf!2382 bitStream1!8) (buf!2382 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2024 (buf!2382 bitStream1!8)) (currentByte!4751 bitStream1!8) (currentBit!4746 bitStream1!8))))))

(assert (= (and d!29568 res!78356) b!95169))

(assert (= (and b!95169 res!78357) b!95170))

(assert (= (and b!95170 (not res!78355)) b!95171))

(assert (=> b!95169 m!138573))

(assert (=> b!95169 m!138565))

(assert (=> b!95171 m!138573))

(assert (=> b!95171 m!138573))

(declare-fun m!138639 () Bool)

(assert (=> b!95171 m!138639))

(assert (=> b!95107 d!29568))

(declare-fun d!29570 () Bool)

(declare-fun res!78359 () Bool)

(declare-fun e!62368 () Bool)

(assert (=> d!29570 (=> (not res!78359) (not e!62368))))

(assert (=> d!29570 (= res!78359 (= (size!2024 (buf!2382 bitStream1!8)) (size!2024 (buf!2382 bitStream2!8))))))

(assert (=> d!29570 (= (isPrefixOf!0 bitStream1!8 bitStream2!8) e!62368)))

(declare-fun b!95172 () Bool)

(declare-fun res!78360 () Bool)

(assert (=> b!95172 (=> (not res!78360) (not e!62368))))

(assert (=> b!95172 (= res!78360 (bvsle (bitIndex!0 (size!2024 (buf!2382 bitStream1!8)) (currentByte!4751 bitStream1!8) (currentBit!4746 bitStream1!8)) (bitIndex!0 (size!2024 (buf!2382 bitStream2!8)) (currentByte!4751 bitStream2!8) (currentBit!4746 bitStream2!8))))))

(declare-fun b!95173 () Bool)

(declare-fun e!62369 () Bool)

(assert (=> b!95173 (= e!62368 e!62369)))

(declare-fun res!78358 () Bool)

(assert (=> b!95173 (=> res!78358 e!62369)))

(assert (=> b!95173 (= res!78358 (= (size!2024 (buf!2382 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!95174 () Bool)

(assert (=> b!95174 (= e!62369 (arrayBitRangesEq!0 (buf!2382 bitStream1!8) (buf!2382 bitStream2!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2024 (buf!2382 bitStream1!8)) (currentByte!4751 bitStream1!8) (currentBit!4746 bitStream1!8))))))

(assert (= (and d!29570 res!78359) b!95172))

(assert (= (and b!95172 res!78360) b!95173))

(assert (= (and b!95173 (not res!78358)) b!95174))

(assert (=> b!95172 m!138573))

(assert (=> b!95172 m!138575))

(assert (=> b!95174 m!138573))

(assert (=> b!95174 m!138573))

(declare-fun m!138641 () Bool)

(assert (=> b!95174 m!138641))

(assert (=> b!95097 d!29570))

(declare-fun d!29572 () Bool)

(declare-fun e!62374 () Bool)

(assert (=> d!29572 e!62374))

(declare-fun c!5978 () Bool)

(assert (=> d!29572 (= c!5978 (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!139001 () List!879)

(declare-datatypes ((tuple2!7690 0))(
  ( (tuple2!7691 (_1!4092 List!879) (_2!4092 BitStream!3546)) )
))
(declare-fun e!62375 () tuple2!7690)

(assert (=> d!29572 (= lt!139001 (_1!4092 e!62375))))

(declare-fun c!5979 () Bool)

(assert (=> d!29572 (= c!5979 (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!29572 (bvsge nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!29572 (= (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484) lt!139001)))

(declare-fun b!95183 () Bool)

(assert (=> b!95183 (= e!62375 (tuple2!7691 Nil!876 bitStream1!8))))

(declare-datatypes ((tuple2!7692 0))(
  ( (tuple2!7693 (_1!4093 Bool) (_2!4093 BitStream!3546)) )
))
(declare-fun lt!139000 () tuple2!7692)

(declare-fun lt!139002 () (_ BitVec 64))

(declare-fun b!95184 () Bool)

(assert (=> b!95184 (= e!62375 (tuple2!7691 (Cons!875 (_1!4093 lt!139000) (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4093 lt!139000) (bvsub nBits!484 lt!139002))) (_2!4093 lt!139000)))))

(declare-fun readBit!0 (BitStream!3546) tuple2!7692)

(assert (=> b!95184 (= lt!139000 (readBit!0 bitStream1!8))))

(assert (=> b!95184 (= lt!139002 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!95185 () Bool)

(declare-fun isEmpty!259 (List!879) Bool)

(assert (=> b!95185 (= e!62374 (isEmpty!259 lt!139001))))

(declare-fun b!95186 () Bool)

(assert (=> b!95186 (= e!62374 (> (length!470 lt!139001) 0))))

(assert (= (and d!29572 c!5979) b!95183))

(assert (= (and d!29572 (not c!5979)) b!95184))

(assert (= (and d!29572 c!5978) b!95185))

(assert (= (and d!29572 (not c!5978)) b!95186))

(declare-fun m!138643 () Bool)

(assert (=> b!95184 m!138643))

(declare-fun m!138645 () Bool)

(assert (=> b!95184 m!138645))

(declare-fun m!138647 () Bool)

(assert (=> b!95185 m!138647))

(declare-fun m!138649 () Bool)

(assert (=> b!95186 m!138649))

(assert (=> b!95108 d!29572))

(declare-fun d!29574 () Bool)

(assert (=> d!29574 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2024 (buf!2382 bitStream1!8))) ((_ sign_extend 32) (currentByte!4751 bitStream1!8)) ((_ sign_extend 32) (currentBit!4746 bitStream1!8)) nBits!484) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2024 (buf!2382 bitStream1!8))) ((_ sign_extend 32) (currentByte!4751 bitStream1!8)) ((_ sign_extend 32) (currentBit!4746 bitStream1!8))) nBits!484))))

(declare-fun bs!7274 () Bool)

(assert (= bs!7274 d!29574))

(declare-fun m!138651 () Bool)

(assert (=> bs!7274 m!138651))

(assert (=> b!95098 d!29574))

(declare-fun d!29576 () Bool)

(declare-fun res!78362 () Bool)

(declare-fun e!62376 () Bool)

(assert (=> d!29576 (=> (not res!78362) (not e!62376))))

(assert (=> d!29576 (= res!78362 (= (size!2024 (buf!2382 bitStream2!8)) (size!2024 (buf!2382 base!8))))))

(assert (=> d!29576 (= (isPrefixOf!0 bitStream2!8 base!8) e!62376)))

(declare-fun b!95187 () Bool)

(declare-fun res!78363 () Bool)

(assert (=> b!95187 (=> (not res!78363) (not e!62376))))

(assert (=> b!95187 (= res!78363 (bvsle (bitIndex!0 (size!2024 (buf!2382 bitStream2!8)) (currentByte!4751 bitStream2!8) (currentBit!4746 bitStream2!8)) (bitIndex!0 (size!2024 (buf!2382 base!8)) (currentByte!4751 base!8) (currentBit!4746 base!8))))))

(declare-fun b!95188 () Bool)

(declare-fun e!62377 () Bool)

(assert (=> b!95188 (= e!62376 e!62377)))

(declare-fun res!78361 () Bool)

(assert (=> b!95188 (=> res!78361 e!62377)))

(assert (=> b!95188 (= res!78361 (= (size!2024 (buf!2382 bitStream2!8)) #b00000000000000000000000000000000))))

(declare-fun b!95189 () Bool)

(assert (=> b!95189 (= e!62377 (arrayBitRangesEq!0 (buf!2382 bitStream2!8) (buf!2382 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2024 (buf!2382 bitStream2!8)) (currentByte!4751 bitStream2!8) (currentBit!4746 bitStream2!8))))))

(assert (= (and d!29576 res!78362) b!95187))

(assert (= (and b!95187 res!78363) b!95188))

(assert (= (and b!95188 (not res!78361)) b!95189))

(assert (=> b!95187 m!138575))

(assert (=> b!95187 m!138565))

(assert (=> b!95189 m!138575))

(assert (=> b!95189 m!138575))

(declare-fun m!138653 () Bool)

(assert (=> b!95189 m!138653))

(assert (=> b!95099 d!29576))

(declare-fun d!29578 () Bool)

(assert (=> d!29578 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2024 (buf!2382 bitStream2!8))) ((_ sign_extend 32) (currentByte!4751 bitStream2!8)) ((_ sign_extend 32) (currentBit!4746 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2024 (buf!2382 bitStream2!8))) ((_ sign_extend 32) (currentByte!4751 bitStream2!8)) ((_ sign_extend 32) (currentBit!4746 bitStream2!8))) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!7275 () Bool)

(assert (= bs!7275 d!29578))

(declare-fun m!138655 () Bool)

(assert (=> bs!7275 m!138655))

(assert (=> b!95100 d!29578))

(declare-fun d!29580 () Bool)

(assert (=> d!29580 (= (array_inv!1838 (buf!2382 base!8)) (bvsge (size!2024 (buf!2382 base!8)) #b00000000000000000000000000000000))))

(assert (=> b!95101 d!29580))

(declare-fun d!29582 () Bool)

(declare-fun lt!139005 () tuple2!7692)

(assert (=> d!29582 (= lt!139005 (readBit!0 bitStream1!8))))

(assert (=> d!29582 (= (readBitPure!0 bitStream1!8) (tuple2!7687 (_2!4093 lt!139005) (_1!4093 lt!139005)))))

(declare-fun bs!7276 () Bool)

(assert (= bs!7276 d!29582))

(assert (=> bs!7276 m!138645))

(assert (=> b!95102 d!29582))

(declare-fun d!29584 () Bool)

(assert (=> d!29584 (= (head!591 listBits!13) (h!994 listBits!13))))

(assert (=> b!95102 d!29584))

(declare-fun d!29586 () Bool)

(declare-fun e!62378 () Bool)

(assert (=> d!29586 e!62378))

(declare-fun res!78364 () Bool)

(assert (=> d!29586 (=> (not res!78364) (not e!62378))))

(declare-fun lt!139010 () (_ BitVec 64))

(declare-fun lt!139011 () (_ BitVec 64))

(declare-fun lt!139006 () (_ BitVec 64))

(assert (=> d!29586 (= res!78364 (= lt!139006 (bvsub lt!139011 lt!139010)))))

(assert (=> d!29586 (or (= (bvand lt!139011 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139010 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!139011 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!139011 lt!139010) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29586 (= lt!139010 (remainingBits!0 ((_ sign_extend 32) (size!2024 (buf!2382 bitStream1!8))) ((_ sign_extend 32) (currentByte!4751 bitStream1!8)) ((_ sign_extend 32) (currentBit!4746 bitStream1!8))))))

(declare-fun lt!139009 () (_ BitVec 64))

(declare-fun lt!139007 () (_ BitVec 64))

(assert (=> d!29586 (= lt!139011 (bvmul lt!139009 lt!139007))))

(assert (=> d!29586 (or (= lt!139009 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!139007 (bvsdiv (bvmul lt!139009 lt!139007) lt!139009)))))

(assert (=> d!29586 (= lt!139007 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29586 (= lt!139009 ((_ sign_extend 32) (size!2024 (buf!2382 bitStream1!8))))))

(assert (=> d!29586 (= lt!139006 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4751 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4746 bitStream1!8))))))

(assert (=> d!29586 (invariant!0 (currentBit!4746 bitStream1!8) (currentByte!4751 bitStream1!8) (size!2024 (buf!2382 bitStream1!8)))))

(assert (=> d!29586 (= (bitIndex!0 (size!2024 (buf!2382 bitStream1!8)) (currentByte!4751 bitStream1!8) (currentBit!4746 bitStream1!8)) lt!139006)))

(declare-fun b!95190 () Bool)

(declare-fun res!78365 () Bool)

(assert (=> b!95190 (=> (not res!78365) (not e!62378))))

(assert (=> b!95190 (= res!78365 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!139006))))

(declare-fun b!95191 () Bool)

(declare-fun lt!139008 () (_ BitVec 64))

(assert (=> b!95191 (= e!62378 (bvsle lt!139006 (bvmul lt!139008 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!95191 (or (= lt!139008 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!139008 #b0000000000000000000000000000000000000000000000000000000000001000) lt!139008)))))

(assert (=> b!95191 (= lt!139008 ((_ sign_extend 32) (size!2024 (buf!2382 bitStream1!8))))))

(assert (= (and d!29586 res!78364) b!95190))

(assert (= (and b!95190 res!78365) b!95191))

(assert (=> d!29586 m!138651))

(declare-fun m!138657 () Bool)

(assert (=> d!29586 m!138657))

(assert (=> b!95103 d!29586))

(declare-fun d!29588 () Bool)

(declare-fun e!62379 () Bool)

(assert (=> d!29588 e!62379))

(declare-fun res!78366 () Bool)

(assert (=> d!29588 (=> (not res!78366) (not e!62379))))

(declare-fun lt!139017 () (_ BitVec 64))

(declare-fun lt!139012 () (_ BitVec 64))

(declare-fun lt!139016 () (_ BitVec 64))

(assert (=> d!29588 (= res!78366 (= lt!139012 (bvsub lt!139017 lt!139016)))))

(assert (=> d!29588 (or (= (bvand lt!139017 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139016 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!139017 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!139017 lt!139016) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29588 (= lt!139016 (remainingBits!0 ((_ sign_extend 32) (size!2024 (buf!2382 bitStream2!8))) ((_ sign_extend 32) (currentByte!4751 bitStream2!8)) ((_ sign_extend 32) (currentBit!4746 bitStream2!8))))))

(declare-fun lt!139015 () (_ BitVec 64))

(declare-fun lt!139013 () (_ BitVec 64))

(assert (=> d!29588 (= lt!139017 (bvmul lt!139015 lt!139013))))

(assert (=> d!29588 (or (= lt!139015 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!139013 (bvsdiv (bvmul lt!139015 lt!139013) lt!139015)))))

(assert (=> d!29588 (= lt!139013 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29588 (= lt!139015 ((_ sign_extend 32) (size!2024 (buf!2382 bitStream2!8))))))

(assert (=> d!29588 (= lt!139012 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4751 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4746 bitStream2!8))))))

(assert (=> d!29588 (invariant!0 (currentBit!4746 bitStream2!8) (currentByte!4751 bitStream2!8) (size!2024 (buf!2382 bitStream2!8)))))

(assert (=> d!29588 (= (bitIndex!0 (size!2024 (buf!2382 bitStream2!8)) (currentByte!4751 bitStream2!8) (currentBit!4746 bitStream2!8)) lt!139012)))

(declare-fun b!95192 () Bool)

(declare-fun res!78367 () Bool)

(assert (=> b!95192 (=> (not res!78367) (not e!62379))))

(assert (=> b!95192 (= res!78367 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!139012))))

(declare-fun b!95193 () Bool)

(declare-fun lt!139014 () (_ BitVec 64))

(assert (=> b!95193 (= e!62379 (bvsle lt!139012 (bvmul lt!139014 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!95193 (or (= lt!139014 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!139014 #b0000000000000000000000000000000000000000000000000000000000001000) lt!139014)))))

(assert (=> b!95193 (= lt!139014 ((_ sign_extend 32) (size!2024 (buf!2382 bitStream2!8))))))

(assert (= (and d!29588 res!78366) b!95192))

(assert (= (and b!95192 res!78367) b!95193))

(assert (=> d!29588 m!138655))

(declare-fun m!138659 () Bool)

(assert (=> d!29588 m!138659))

(assert (=> b!95103 d!29588))

(declare-fun d!29590 () Bool)

(assert (=> d!29590 (= (inv!12 bitStream1!8) (invariant!0 (currentBit!4746 bitStream1!8) (currentByte!4751 bitStream1!8) (size!2024 (buf!2382 bitStream1!8))))))

(declare-fun bs!7277 () Bool)

(assert (= bs!7277 d!29590))

(assert (=> bs!7277 m!138657))

(assert (=> start!19024 d!29590))

(declare-fun d!29592 () Bool)

(assert (=> d!29592 (= (inv!12 bitStream2!8) (invariant!0 (currentBit!4746 bitStream2!8) (currentByte!4751 bitStream2!8) (size!2024 (buf!2382 bitStream2!8))))))

(declare-fun bs!7278 () Bool)

(assert (= bs!7278 d!29592))

(assert (=> bs!7278 m!138659))

(assert (=> start!19024 d!29592))

(declare-fun d!29594 () Bool)

(assert (=> d!29594 (= (inv!12 base!8) (invariant!0 (currentBit!4746 base!8) (currentByte!4751 base!8) (size!2024 (buf!2382 base!8))))))

(declare-fun bs!7279 () Bool)

(assert (= bs!7279 d!29594))

(assert (=> bs!7279 m!138637))

(assert (=> start!19024 d!29594))

(declare-fun d!29596 () Bool)

(assert (=> d!29596 (= (inv!12 thiss!1534) (invariant!0 (currentBit!4746 thiss!1534) (currentByte!4751 thiss!1534) (size!2024 (buf!2382 thiss!1534))))))

(declare-fun bs!7280 () Bool)

(assert (= bs!7280 d!29596))

(declare-fun m!138661 () Bool)

(assert (=> bs!7280 m!138661))

(assert (=> start!19024 d!29596))

(declare-fun d!29598 () Bool)

(declare-fun size!2026 (List!879) Int)

(assert (=> d!29598 (= (length!470 listBits!13) (size!2026 listBits!13))))

(declare-fun bs!7281 () Bool)

(assert (= bs!7281 d!29598))

(declare-fun m!138663 () Bool)

(assert (=> bs!7281 m!138663))

(assert (=> b!95093 d!29598))

(check-sat (not d!29586) (not d!29598) (not b!95185) (not d!29588) (not d!29594) (not b!95171) (not b!95189) (not b!95172) (not d!29574) (not b!95186) (not d!29578) (not b!95187) (not b!95174) (not d!29564) (not d!29596) (not d!29592) (not b!95184) (not d!29582) (not d!29590) (not b!95169))
