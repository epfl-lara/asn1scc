; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!180 () Bool)

(assert start!180)

(declare-fun res!2549 () Bool)

(declare-fun e!208 () Bool)

(assert (=> start!180 (=> (not res!2549) (not e!208))))

(declare-datatypes ((array!74 0))(
  ( (array!75 (arr!416 (Array (_ BitVec 32) (_ BitVec 8))) (size!29 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!42 0))(
  ( (BitStream!43 (buf!341 array!74) (currentByte!1239 (_ BitVec 32)) (currentBit!1234 (_ BitVec 32))) )
))
(declare-fun thiss!932 () BitStream!42)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!180 (= res!2549 (validate_offset_bit!0 ((_ sign_extend 32) (size!29 (buf!341 thiss!932))) ((_ sign_extend 32) (currentByte!1239 thiss!932)) ((_ sign_extend 32) (currentBit!1234 thiss!932))))))

(assert (=> start!180 e!208))

(declare-fun e!207 () Bool)

(declare-fun inv!12 (BitStream!42) Bool)

(assert (=> start!180 (and (inv!12 thiss!932) e!207)))

(declare-fun b!448 () Bool)

(declare-fun e!209 () Bool)

(declare-fun e!212 () Bool)

(assert (=> b!448 (= e!209 e!212)))

(declare-fun res!2554 () Bool)

(assert (=> b!448 (=> (not res!2554) (not e!212))))

(declare-datatypes ((tuple2!4 0))(
  ( (tuple2!5 (_1!2 BitStream!42) (_2!2 Bool)) )
))
(declare-fun lt!21 () tuple2!4)

(declare-datatypes ((Unit!3 0))(
  ( (Unit!4) )
))
(declare-datatypes ((tuple2!6 0))(
  ( (tuple2!7 (_1!3 Unit!3) (_2!3 BitStream!42)) )
))
(declare-fun lt!20 () tuple2!6)

(assert (=> b!448 (= res!2554 (and (_2!2 lt!21) (= (_1!2 lt!21) (_2!3 lt!20))))))

(declare-fun readBitPure!0 (BitStream!42) tuple2!4)

(declare-fun readerFrom!0 (BitStream!42 (_ BitVec 32) (_ BitVec 32)) BitStream!42)

(assert (=> b!448 (= lt!21 (readBitPure!0 (readerFrom!0 (_2!3 lt!20) (currentBit!1234 thiss!932) (currentByte!1239 thiss!932))))))

(declare-fun b!449 () Bool)

(declare-fun e!211 () Bool)

(assert (=> b!449 (= e!211 e!209)))

(declare-fun res!2552 () Bool)

(assert (=> b!449 (=> (not res!2552) (not e!209))))

(declare-fun lt!22 () (_ BitVec 64))

(declare-fun lt!23 () (_ BitVec 64))

(assert (=> b!449 (= res!2552 (= lt!22 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!23)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!449 (= lt!22 (bitIndex!0 (size!29 (buf!341 (_2!3 lt!20))) (currentByte!1239 (_2!3 lt!20)) (currentBit!1234 (_2!3 lt!20))))))

(assert (=> b!449 (= lt!23 (bitIndex!0 (size!29 (buf!341 thiss!932)) (currentByte!1239 thiss!932) (currentBit!1234 thiss!932)))))

(declare-fun b!450 () Bool)

(assert (=> b!450 (= e!212 (= (bitIndex!0 (size!29 (buf!341 (_1!2 lt!21))) (currentByte!1239 (_1!2 lt!21)) (currentBit!1234 (_1!2 lt!21))) lt!22))))

(declare-fun b!451 () Bool)

(declare-fun array_inv!26 (array!74) Bool)

(assert (=> b!451 (= e!207 (array_inv!26 (buf!341 thiss!932)))))

(declare-fun b!452 () Bool)

(declare-fun e!206 () Bool)

(assert (=> b!452 (= e!208 (not e!206))))

(declare-fun res!2553 () Bool)

(assert (=> b!452 (=> res!2553 e!206)))

(assert (=> b!452 (= res!2553 (not (= (size!29 (buf!341 (_2!3 lt!20))) (size!29 (buf!341 thiss!932)))))))

(assert (=> b!452 e!211))

(declare-fun res!2550 () Bool)

(assert (=> b!452 (=> (not res!2550) (not e!211))))

(assert (=> b!452 (= res!2550 (= (size!29 (buf!341 thiss!932)) (size!29 (buf!341 (_2!3 lt!20)))))))

(declare-fun appendBit!0 (BitStream!42 Bool) tuple2!6)

(assert (=> b!452 (= lt!20 (appendBit!0 thiss!932 true))))

(declare-fun b!453 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!453 (= e!206 (invariant!0 (currentBit!1234 (_2!3 lt!20)) (currentByte!1239 (_2!3 lt!20)) (size!29 (buf!341 (_2!3 lt!20)))))))

(declare-fun b!454 () Bool)

(declare-fun res!2551 () Bool)

(assert (=> b!454 (=> (not res!2551) (not e!209))))

(declare-fun isPrefixOf!0 (BitStream!42 BitStream!42) Bool)

(assert (=> b!454 (= res!2551 (isPrefixOf!0 thiss!932 (_2!3 lt!20)))))

(assert (= (and start!180 res!2549) b!452))

(assert (= (and b!452 res!2550) b!449))

(assert (= (and b!449 res!2552) b!454))

(assert (= (and b!454 res!2551) b!448))

(assert (= (and b!448 res!2554) b!450))

(assert (= (and b!452 (not res!2553)) b!453))

(assert (= start!180 b!451))

(declare-fun m!197 () Bool)

(assert (=> b!453 m!197))

(declare-fun m!199 () Bool)

(assert (=> b!448 m!199))

(assert (=> b!448 m!199))

(declare-fun m!201 () Bool)

(assert (=> b!448 m!201))

(declare-fun m!203 () Bool)

(assert (=> b!449 m!203))

(declare-fun m!205 () Bool)

(assert (=> b!449 m!205))

(declare-fun m!207 () Bool)

(assert (=> b!452 m!207))

(declare-fun m!209 () Bool)

(assert (=> start!180 m!209))

(declare-fun m!211 () Bool)

(assert (=> start!180 m!211))

(declare-fun m!213 () Bool)

(assert (=> b!454 m!213))

(declare-fun m!215 () Bool)

(assert (=> b!451 m!215))

(declare-fun m!217 () Bool)

(assert (=> b!450 m!217))

(check-sat (not b!453) (not b!450) (not b!449) (not b!451) (not b!448) (not b!454) (not b!452) (not start!180))
(check-sat)
(get-model)

(declare-fun d!842 () Bool)

(declare-datatypes ((tuple2!12 0))(
  ( (tuple2!13 (_1!6 Bool) (_2!6 BitStream!42)) )
))
(declare-fun lt!38 () tuple2!12)

(declare-fun readBit!0 (BitStream!42) tuple2!12)

(assert (=> d!842 (= lt!38 (readBit!0 (readerFrom!0 (_2!3 lt!20) (currentBit!1234 thiss!932) (currentByte!1239 thiss!932))))))

(assert (=> d!842 (= (readBitPure!0 (readerFrom!0 (_2!3 lt!20) (currentBit!1234 thiss!932) (currentByte!1239 thiss!932))) (tuple2!5 (_2!6 lt!38) (_1!6 lt!38)))))

(declare-fun bs!378 () Bool)

(assert (= bs!378 d!842))

(assert (=> bs!378 m!199))

(declare-fun m!241 () Bool)

(assert (=> bs!378 m!241))

(assert (=> b!448 d!842))

(declare-fun d!850 () Bool)

(declare-fun e!242 () Bool)

(assert (=> d!850 e!242))

(declare-fun res!2585 () Bool)

(assert (=> d!850 (=> (not res!2585) (not e!242))))

(assert (=> d!850 (= res!2585 (invariant!0 (currentBit!1234 (_2!3 lt!20)) (currentByte!1239 (_2!3 lt!20)) (size!29 (buf!341 (_2!3 lt!20)))))))

(assert (=> d!850 (= (readerFrom!0 (_2!3 lt!20) (currentBit!1234 thiss!932) (currentByte!1239 thiss!932)) (BitStream!43 (buf!341 (_2!3 lt!20)) (currentByte!1239 thiss!932) (currentBit!1234 thiss!932)))))

(declare-fun b!487 () Bool)

(assert (=> b!487 (= e!242 (invariant!0 (currentBit!1234 thiss!932) (currentByte!1239 thiss!932) (size!29 (buf!341 (_2!3 lt!20)))))))

(assert (= (and d!850 res!2585) b!487))

(assert (=> d!850 m!197))

(declare-fun m!247 () Bool)

(assert (=> b!487 m!247))

(assert (=> b!448 d!850))

(declare-fun d!856 () Bool)

(declare-fun res!2598 () Bool)

(declare-fun e!251 () Bool)

(assert (=> d!856 (=> (not res!2598) (not e!251))))

(assert (=> d!856 (= res!2598 (= (size!29 (buf!341 thiss!932)) (size!29 (buf!341 (_2!3 lt!20)))))))

(assert (=> d!856 (= (isPrefixOf!0 thiss!932 (_2!3 lt!20)) e!251)))

(declare-fun b!497 () Bool)

(declare-fun res!2597 () Bool)

(assert (=> b!497 (=> (not res!2597) (not e!251))))

(assert (=> b!497 (= res!2597 (bvsle (bitIndex!0 (size!29 (buf!341 thiss!932)) (currentByte!1239 thiss!932) (currentBit!1234 thiss!932)) (bitIndex!0 (size!29 (buf!341 (_2!3 lt!20))) (currentByte!1239 (_2!3 lt!20)) (currentBit!1234 (_2!3 lt!20)))))))

(declare-fun b!498 () Bool)

(declare-fun e!250 () Bool)

(assert (=> b!498 (= e!251 e!250)))

(declare-fun res!2596 () Bool)

(assert (=> b!498 (=> res!2596 e!250)))

(assert (=> b!498 (= res!2596 (= (size!29 (buf!341 thiss!932)) #b00000000000000000000000000000000))))

(declare-fun b!499 () Bool)

(declare-fun arrayBitRangesEq!0 (array!74 array!74 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!499 (= e!250 (arrayBitRangesEq!0 (buf!341 thiss!932) (buf!341 (_2!3 lt!20)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!29 (buf!341 thiss!932)) (currentByte!1239 thiss!932) (currentBit!1234 thiss!932))))))

(assert (= (and d!856 res!2598) b!497))

(assert (= (and b!497 res!2597) b!498))

(assert (= (and b!498 (not res!2596)) b!499))

(assert (=> b!497 m!205))

(assert (=> b!497 m!203))

(assert (=> b!499 m!205))

(assert (=> b!499 m!205))

(declare-fun m!253 () Bool)

(assert (=> b!499 m!253))

(assert (=> b!454 d!856))

(declare-fun d!862 () Bool)

(declare-fun e!261 () Bool)

(assert (=> d!862 e!261))

(declare-fun res!2618 () Bool)

(assert (=> d!862 (=> (not res!2618) (not e!261))))

(declare-fun lt!99 () (_ BitVec 64))

(declare-fun lt!101 () (_ BitVec 64))

(declare-fun lt!97 () (_ BitVec 64))

(assert (=> d!862 (= res!2618 (= lt!101 (bvsub lt!99 lt!97)))))

(assert (=> d!862 (or (= (bvand lt!99 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!97 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!99 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!99 lt!97) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!862 (= lt!97 (remainingBits!0 ((_ sign_extend 32) (size!29 (buf!341 (_2!3 lt!20)))) ((_ sign_extend 32) (currentByte!1239 (_2!3 lt!20))) ((_ sign_extend 32) (currentBit!1234 (_2!3 lt!20)))))))

(declare-fun lt!100 () (_ BitVec 64))

(declare-fun lt!98 () (_ BitVec 64))

(assert (=> d!862 (= lt!99 (bvmul lt!100 lt!98))))

(assert (=> d!862 (or (= lt!100 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!98 (bvsdiv (bvmul lt!100 lt!98) lt!100)))))

(assert (=> d!862 (= lt!98 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!862 (= lt!100 ((_ sign_extend 32) (size!29 (buf!341 (_2!3 lt!20)))))))

(assert (=> d!862 (= lt!101 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1239 (_2!3 lt!20))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1234 (_2!3 lt!20)))))))

(assert (=> d!862 (invariant!0 (currentBit!1234 (_2!3 lt!20)) (currentByte!1239 (_2!3 lt!20)) (size!29 (buf!341 (_2!3 lt!20))))))

(assert (=> d!862 (= (bitIndex!0 (size!29 (buf!341 (_2!3 lt!20))) (currentByte!1239 (_2!3 lt!20)) (currentBit!1234 (_2!3 lt!20))) lt!101)))

(declare-fun b!518 () Bool)

(declare-fun res!2617 () Bool)

(assert (=> b!518 (=> (not res!2617) (not e!261))))

(assert (=> b!518 (= res!2617 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!101))))

(declare-fun b!519 () Bool)

(declare-fun lt!96 () (_ BitVec 64))

(assert (=> b!519 (= e!261 (bvsle lt!101 (bvmul lt!96 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!519 (or (= lt!96 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!96 #b0000000000000000000000000000000000000000000000000000000000001000) lt!96)))))

(assert (=> b!519 (= lt!96 ((_ sign_extend 32) (size!29 (buf!341 (_2!3 lt!20)))))))

(assert (= (and d!862 res!2618) b!518))

(assert (= (and b!518 res!2617) b!519))

(declare-fun m!267 () Bool)

(assert (=> d!862 m!267))

(assert (=> d!862 m!197))

(assert (=> b!449 d!862))

(declare-fun d!876 () Bool)

(declare-fun e!263 () Bool)

(assert (=> d!876 e!263))

(declare-fun res!2622 () Bool)

(assert (=> d!876 (=> (not res!2622) (not e!263))))

(declare-fun lt!113 () (_ BitVec 64))

(declare-fun lt!111 () (_ BitVec 64))

(declare-fun lt!109 () (_ BitVec 64))

(assert (=> d!876 (= res!2622 (= lt!113 (bvsub lt!111 lt!109)))))

(assert (=> d!876 (or (= (bvand lt!111 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!109 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!111 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!111 lt!109) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!876 (= lt!109 (remainingBits!0 ((_ sign_extend 32) (size!29 (buf!341 thiss!932))) ((_ sign_extend 32) (currentByte!1239 thiss!932)) ((_ sign_extend 32) (currentBit!1234 thiss!932))))))

(declare-fun lt!112 () (_ BitVec 64))

(declare-fun lt!110 () (_ BitVec 64))

(assert (=> d!876 (= lt!111 (bvmul lt!112 lt!110))))

(assert (=> d!876 (or (= lt!112 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!110 (bvsdiv (bvmul lt!112 lt!110) lt!112)))))

(assert (=> d!876 (= lt!110 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!876 (= lt!112 ((_ sign_extend 32) (size!29 (buf!341 thiss!932))))))

(assert (=> d!876 (= lt!113 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1239 thiss!932)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1234 thiss!932))))))

(assert (=> d!876 (invariant!0 (currentBit!1234 thiss!932) (currentByte!1239 thiss!932) (size!29 (buf!341 thiss!932)))))

(assert (=> d!876 (= (bitIndex!0 (size!29 (buf!341 thiss!932)) (currentByte!1239 thiss!932) (currentBit!1234 thiss!932)) lt!113)))

(declare-fun b!522 () Bool)

(declare-fun res!2621 () Bool)

(assert (=> b!522 (=> (not res!2621) (not e!263))))

(assert (=> b!522 (= res!2621 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!113))))

(declare-fun b!523 () Bool)

(declare-fun lt!108 () (_ BitVec 64))

(assert (=> b!523 (= e!263 (bvsle lt!113 (bvmul lt!108 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!523 (or (= lt!108 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!108 #b0000000000000000000000000000000000000000000000000000000000001000) lt!108)))))

(assert (=> b!523 (= lt!108 ((_ sign_extend 32) (size!29 (buf!341 thiss!932))))))

(assert (= (and d!876 res!2622) b!522))

(assert (= (and b!522 res!2621) b!523))

(declare-fun m!273 () Bool)

(assert (=> d!876 m!273))

(declare-fun m!275 () Bool)

(assert (=> d!876 m!275))

(assert (=> b!449 d!876))

(declare-fun b!562 () Bool)

(declare-fun e!281 () Bool)

(declare-fun lt!157 () tuple2!4)

(declare-fun lt!159 () tuple2!6)

(assert (=> b!562 (= e!281 (= (bitIndex!0 (size!29 (buf!341 (_1!2 lt!157))) (currentByte!1239 (_1!2 lt!157)) (currentBit!1234 (_1!2 lt!157))) (bitIndex!0 (size!29 (buf!341 (_2!3 lt!159))) (currentByte!1239 (_2!3 lt!159)) (currentBit!1234 (_2!3 lt!159)))))))

(declare-fun b!560 () Bool)

(declare-fun res!2657 () Bool)

(declare-fun e!280 () Bool)

(assert (=> b!560 (=> (not res!2657) (not e!280))))

(assert (=> b!560 (= res!2657 (isPrefixOf!0 thiss!932 (_2!3 lt!159)))))

(declare-fun d!880 () Bool)

(assert (=> d!880 e!280))

(declare-fun res!2659 () Bool)

(assert (=> d!880 (=> (not res!2659) (not e!280))))

(assert (=> d!880 (= res!2659 (= (size!29 (buf!341 thiss!932)) (size!29 (buf!341 (_2!3 lt!159)))))))

(declare-fun choose!16 (BitStream!42 Bool) tuple2!6)

(assert (=> d!880 (= lt!159 (choose!16 thiss!932 true))))

(assert (=> d!880 (validate_offset_bit!0 ((_ sign_extend 32) (size!29 (buf!341 thiss!932))) ((_ sign_extend 32) (currentByte!1239 thiss!932)) ((_ sign_extend 32) (currentBit!1234 thiss!932)))))

(assert (=> d!880 (= (appendBit!0 thiss!932 true) lt!159)))

(declare-fun b!559 () Bool)

(declare-fun res!2658 () Bool)

(assert (=> b!559 (=> (not res!2658) (not e!280))))

(declare-fun lt!160 () (_ BitVec 64))

(declare-fun lt!158 () (_ BitVec 64))

(assert (=> b!559 (= res!2658 (= (bitIndex!0 (size!29 (buf!341 (_2!3 lt!159))) (currentByte!1239 (_2!3 lt!159)) (currentBit!1234 (_2!3 lt!159))) (bvadd lt!158 lt!160)))))

(assert (=> b!559 (or (not (= (bvand lt!158 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!160 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!158 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!158 lt!160) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!559 (= lt!160 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!559 (= lt!158 (bitIndex!0 (size!29 (buf!341 thiss!932)) (currentByte!1239 thiss!932) (currentBit!1234 thiss!932)))))

(declare-fun b!561 () Bool)

(assert (=> b!561 (= e!280 e!281)))

(declare-fun res!2656 () Bool)

(assert (=> b!561 (=> (not res!2656) (not e!281))))

(assert (=> b!561 (= res!2656 (and (= (_2!2 lt!157) true) (= (_1!2 lt!157) (_2!3 lt!159))))))

(assert (=> b!561 (= lt!157 (readBitPure!0 (readerFrom!0 (_2!3 lt!159) (currentBit!1234 thiss!932) (currentByte!1239 thiss!932))))))

(assert (= (and d!880 res!2659) b!559))

(assert (= (and b!559 res!2658) b!560))

(assert (= (and b!560 res!2657) b!561))

(assert (= (and b!561 res!2656) b!562))

(declare-fun m!293 () Bool)

(assert (=> b!559 m!293))

(assert (=> b!559 m!205))

(declare-fun m!295 () Bool)

(assert (=> d!880 m!295))

(assert (=> d!880 m!209))

(declare-fun m!297 () Bool)

(assert (=> b!561 m!297))

(assert (=> b!561 m!297))

(declare-fun m!299 () Bool)

(assert (=> b!561 m!299))

(declare-fun m!301 () Bool)

(assert (=> b!560 m!301))

(declare-fun m!303 () Bool)

(assert (=> b!562 m!303))

(assert (=> b!562 m!293))

(assert (=> b!452 d!880))

(declare-fun d!892 () Bool)

(assert (=> d!892 (= (invariant!0 (currentBit!1234 (_2!3 lt!20)) (currentByte!1239 (_2!3 lt!20)) (size!29 (buf!341 (_2!3 lt!20)))) (and (bvsge (currentBit!1234 (_2!3 lt!20)) #b00000000000000000000000000000000) (bvslt (currentBit!1234 (_2!3 lt!20)) #b00000000000000000000000000001000) (bvsge (currentByte!1239 (_2!3 lt!20)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1239 (_2!3 lt!20)) (size!29 (buf!341 (_2!3 lt!20)))) (and (= (currentBit!1234 (_2!3 lt!20)) #b00000000000000000000000000000000) (= (currentByte!1239 (_2!3 lt!20)) (size!29 (buf!341 (_2!3 lt!20))))))))))

(assert (=> b!453 d!892))

(declare-fun d!896 () Bool)

(assert (=> d!896 (= (array_inv!26 (buf!341 thiss!932)) (bvsge (size!29 (buf!341 thiss!932)) #b00000000000000000000000000000000))))

(assert (=> b!451 d!896))

(declare-fun d!898 () Bool)

(assert (=> d!898 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!29 (buf!341 thiss!932))) ((_ sign_extend 32) (currentByte!1239 thiss!932)) ((_ sign_extend 32) (currentBit!1234 thiss!932))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!29 (buf!341 thiss!932))) ((_ sign_extend 32) (currentByte!1239 thiss!932)) ((_ sign_extend 32) (currentBit!1234 thiss!932))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!383 () Bool)

(assert (= bs!383 d!898))

(assert (=> bs!383 m!273))

(assert (=> start!180 d!898))

(declare-fun d!900 () Bool)

(assert (=> d!900 (= (inv!12 thiss!932) (invariant!0 (currentBit!1234 thiss!932) (currentByte!1239 thiss!932) (size!29 (buf!341 thiss!932))))))

(declare-fun bs!384 () Bool)

(assert (= bs!384 d!900))

(assert (=> bs!384 m!275))

(assert (=> start!180 d!900))

(declare-fun d!902 () Bool)

(declare-fun e!291 () Bool)

(assert (=> d!902 e!291))

(declare-fun res!2674 () Bool)

(assert (=> d!902 (=> (not res!2674) (not e!291))))

(declare-fun lt!166 () (_ BitVec 64))

(declare-fun lt!168 () (_ BitVec 64))

(declare-fun lt!170 () (_ BitVec 64))

(assert (=> d!902 (= res!2674 (= lt!170 (bvsub lt!168 lt!166)))))

(assert (=> d!902 (or (= (bvand lt!168 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!166 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!168 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!168 lt!166) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!902 (= lt!166 (remainingBits!0 ((_ sign_extend 32) (size!29 (buf!341 (_1!2 lt!21)))) ((_ sign_extend 32) (currentByte!1239 (_1!2 lt!21))) ((_ sign_extend 32) (currentBit!1234 (_1!2 lt!21)))))))

(declare-fun lt!169 () (_ BitVec 64))

(declare-fun lt!167 () (_ BitVec 64))

(assert (=> d!902 (= lt!168 (bvmul lt!169 lt!167))))

(assert (=> d!902 (or (= lt!169 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!167 (bvsdiv (bvmul lt!169 lt!167) lt!169)))))

(assert (=> d!902 (= lt!167 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!902 (= lt!169 ((_ sign_extend 32) (size!29 (buf!341 (_1!2 lt!21)))))))

(assert (=> d!902 (= lt!170 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1239 (_1!2 lt!21))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1234 (_1!2 lt!21)))))))

(assert (=> d!902 (invariant!0 (currentBit!1234 (_1!2 lt!21)) (currentByte!1239 (_1!2 lt!21)) (size!29 (buf!341 (_1!2 lt!21))))))

(assert (=> d!902 (= (bitIndex!0 (size!29 (buf!341 (_1!2 lt!21))) (currentByte!1239 (_1!2 lt!21)) (currentBit!1234 (_1!2 lt!21))) lt!170)))

(declare-fun b!576 () Bool)

(declare-fun res!2673 () Bool)

(assert (=> b!576 (=> (not res!2673) (not e!291))))

(assert (=> b!576 (= res!2673 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!170))))

(declare-fun b!577 () Bool)

(declare-fun lt!165 () (_ BitVec 64))

(assert (=> b!577 (= e!291 (bvsle lt!170 (bvmul lt!165 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!577 (or (= lt!165 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!165 #b0000000000000000000000000000000000000000000000000000000000001000) lt!165)))))

(assert (=> b!577 (= lt!165 ((_ sign_extend 32) (size!29 (buf!341 (_1!2 lt!21)))))))

(assert (= (and d!902 res!2674) b!576))

(assert (= (and b!576 res!2673) b!577))

(declare-fun m!319 () Bool)

(assert (=> d!902 m!319))

(declare-fun m!321 () Bool)

(assert (=> d!902 m!321))

(assert (=> b!450 d!902))

(check-sat (not b!559) (not d!880) (not d!842) (not d!898) (not d!862) (not b!487) (not d!902) (not b!560) (not b!562) (not d!850) (not d!876) (not b!497) (not b!561) (not d!900) (not b!499))
