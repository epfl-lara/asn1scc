; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67882 () Bool)

(assert start!67882)

(declare-fun b!304723 () Bool)

(declare-datatypes ((Unit!21267 0))(
  ( (Unit!21268) )
))
(declare-fun e!219402 () Unit!21267)

(declare-fun lt!438522 () Unit!21267)

(assert (=> b!304723 (= e!219402 lt!438522)))

(declare-datatypes ((tuple4!1198 0))(
  ( (tuple4!1199 (_1!13254 (_ BitVec 32)) (_2!13254 (_ BitVec 32)) (_3!1556 (_ BitVec 32)) (_4!599 (_ BitVec 32))) )
))
(declare-fun lt!438525 () tuple4!1198)

(declare-datatypes ((array!18510 0))(
  ( (array!18511 (arr!9111 (Array (_ BitVec 32) (_ BitVec 8))) (size!8028 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18510)

(declare-fun a2!948 () array!18510)

(declare-fun lt!438519 () tuple4!1198)

(declare-fun arrayRangesEqSlicedLemma!252 (array!18510 array!18510 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21267)

(assert (=> b!304723 (= lt!438522 (arrayRangesEqSlicedLemma!252 a1!948 a2!948 (_1!13254 lt!438519) (_2!13254 lt!438519) (_1!13254 lt!438525) (_2!13254 lt!438525)))))

(declare-fun arrayRangesEq!1657 (array!18510 array!18510 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!304723 (arrayRangesEq!1657 a1!948 a2!948 (_1!13254 lt!438525) (_2!13254 lt!438525))))

(declare-fun b!304724 () Bool)

(declare-fun e!219400 () Bool)

(assert (=> b!304724 (= e!219400 (and (bvslt (_4!599 lt!438525) (_4!599 lt!438519)) (bvslt (_3!1556 lt!438519) (_4!599 lt!438525)) (or (bvsgt #b00000000000000000000000000000000 (_1!13254 lt!438519)) (bvsgt (_1!13254 lt!438519) (_2!13254 lt!438519)))))))

(declare-fun lt!438523 () Unit!21267)

(declare-fun e!219405 () Unit!21267)

(assert (=> b!304724 (= lt!438523 e!219405)))

(declare-fun c!14639 () Bool)

(assert (=> b!304724 (= c!14639 (and (bvslt (_3!1556 lt!438519) (_3!1556 lt!438525)) (bvslt (_3!1556 lt!438525) (_4!599 lt!438519))))))

(declare-fun b!304725 () Bool)

(declare-fun res!250613 () Bool)

(declare-fun e!219406 () Bool)

(assert (=> b!304725 (=> (not res!250613) (not e!219406))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!438524 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!304725 (= res!250613 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!438524) (not (= fromSlice!52 toSlice!52))))))

(declare-fun lt!438521 () (_ BitVec 32))

(declare-fun c!14638 () Bool)

(declare-fun call!5693 () Bool)

(declare-fun bm!5690 () Bool)

(declare-fun lt!438518 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5690 (= call!5693 (byteRangesEq!0 (select (arr!9111 a1!948) (_3!1556 lt!438519)) (select (arr!9111 a2!948) (_3!1556 lt!438519)) lt!438518 (ite c!14638 lt!438521 #b00000000000000000000000000000111)))))

(declare-fun res!250616 () Bool)

(declare-fun e!219397 () Bool)

(assert (=> start!67882 (=> (not res!250616) (not e!219397))))

(assert (=> start!67882 (= res!250616 (and (bvsle (size!8028 a1!948) (size!8028 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67882 e!219397))

(assert (=> start!67882 true))

(declare-fun array_inv!7640 (array!18510) Bool)

(assert (=> start!67882 (array_inv!7640 a1!948)))

(assert (=> start!67882 (array_inv!7640 a2!948)))

(declare-fun b!304726 () Bool)

(assert (=> b!304726 (= e!219397 e!219406)))

(declare-fun res!250617 () Bool)

(assert (=> b!304726 (=> (not res!250617) (not e!219406))))

(assert (=> b!304726 (= res!250617 (and (bvsle toBit!258 lt!438524) (bvsle fromBit!258 lt!438524)))))

(assert (=> b!304726 (= lt!438524 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8028 a1!948))))))

(declare-fun b!304727 () Bool)

(declare-fun Unit!21269 () Unit!21267)

(assert (=> b!304727 (= e!219402 Unit!21269)))

(declare-fun b!304728 () Bool)

(declare-fun res!250611 () Bool)

(assert (=> b!304728 (=> (not res!250611) (not e!219406))))

(declare-fun arrayBitRangesEq!0 (array!18510 array!18510 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!304728 (= res!250611 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!304729 () Bool)

(declare-fun e!219403 () Bool)

(declare-fun e!219404 () Bool)

(assert (=> b!304729 (= e!219403 e!219404)))

(declare-fun res!250614 () Bool)

(assert (=> b!304729 (= res!250614 call!5693)))

(assert (=> b!304729 (=> (not res!250614) (not e!219404))))

(declare-fun b!304730 () Bool)

(declare-fun res!250615 () Bool)

(assert (=> b!304730 (= res!250615 (= lt!438521 #b00000000000000000000000000000000))))

(declare-fun e!219398 () Bool)

(assert (=> b!304730 (=> res!250615 e!219398)))

(assert (=> b!304730 (= e!219404 e!219398)))

(declare-fun b!304731 () Bool)

(assert (=> b!304731 (= e!219398 (byteRangesEq!0 (select (arr!9111 a1!948) (_4!599 lt!438519)) (select (arr!9111 a2!948) (_4!599 lt!438519)) #b00000000000000000000000000000000 lt!438521))))

(declare-fun b!304732 () Bool)

(assert (=> b!304732 (= e!219403 call!5693)))

(declare-fun b!304733 () Bool)

(declare-fun lt!438520 () Unit!21267)

(assert (=> b!304733 (= e!219405 lt!438520)))

(declare-fun arrayRangesEqImpliesEq!261 (array!18510 array!18510 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21267)

(assert (=> b!304733 (= lt!438520 (arrayRangesEqImpliesEq!261 a1!948 a2!948 (_1!13254 lt!438519) (_3!1556 lt!438525) (_2!13254 lt!438519)))))

(assert (=> b!304733 (= (select (arr!9111 a1!948) (_3!1556 lt!438525)) (select (arr!9111 a2!948) (_3!1556 lt!438525)))))

(declare-fun b!304734 () Bool)

(assert (=> b!304734 (= e!219406 e!219400)))

(declare-fun res!250612 () Bool)

(assert (=> b!304734 (=> (not res!250612) (not e!219400))))

(assert (=> b!304734 (= res!250612 e!219403)))

(assert (=> b!304734 (= c!14638 (= (_3!1556 lt!438519) (_4!599 lt!438519)))))

(declare-fun lt!438517 () Unit!21267)

(assert (=> b!304734 (= lt!438517 e!219402)))

(declare-fun c!14640 () Bool)

(assert (=> b!304734 (= c!14640 (bvslt (_1!13254 lt!438525) (_2!13254 lt!438525)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1198)

(assert (=> b!304734 (= lt!438525 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!304734 (= lt!438521 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!304734 (= lt!438518 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!304734 (= lt!438519 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!304735 () Bool)

(declare-fun Unit!21270 () Unit!21267)

(assert (=> b!304735 (= e!219405 Unit!21270)))

(assert (= (and start!67882 res!250616) b!304726))

(assert (= (and b!304726 res!250617) b!304728))

(assert (= (and b!304728 res!250611) b!304725))

(assert (= (and b!304725 res!250613) b!304734))

(assert (= (and b!304734 c!14640) b!304723))

(assert (= (and b!304734 (not c!14640)) b!304727))

(assert (= (and b!304734 c!14638) b!304732))

(assert (= (and b!304734 (not c!14638)) b!304729))

(assert (= (and b!304729 res!250614) b!304730))

(assert (= (and b!304730 (not res!250615)) b!304731))

(assert (= (or b!304732 b!304729) bm!5690))

(assert (= (and b!304734 res!250612) b!304724))

(assert (= (and b!304724 c!14639) b!304733))

(assert (= (and b!304724 (not c!14639)) b!304735))

(declare-fun m!443203 () Bool)

(assert (=> b!304733 m!443203))

(declare-fun m!443205 () Bool)

(assert (=> b!304733 m!443205))

(declare-fun m!443207 () Bool)

(assert (=> b!304733 m!443207))

(declare-fun m!443209 () Bool)

(assert (=> start!67882 m!443209))

(declare-fun m!443211 () Bool)

(assert (=> start!67882 m!443211))

(declare-fun m!443213 () Bool)

(assert (=> b!304728 m!443213))

(declare-fun m!443215 () Bool)

(assert (=> b!304731 m!443215))

(declare-fun m!443217 () Bool)

(assert (=> b!304731 m!443217))

(assert (=> b!304731 m!443215))

(assert (=> b!304731 m!443217))

(declare-fun m!443219 () Bool)

(assert (=> b!304731 m!443219))

(declare-fun m!443221 () Bool)

(assert (=> bm!5690 m!443221))

(declare-fun m!443223 () Bool)

(assert (=> bm!5690 m!443223))

(assert (=> bm!5690 m!443221))

(assert (=> bm!5690 m!443223))

(declare-fun m!443225 () Bool)

(assert (=> bm!5690 m!443225))

(declare-fun m!443227 () Bool)

(assert (=> b!304723 m!443227))

(declare-fun m!443229 () Bool)

(assert (=> b!304723 m!443229))

(declare-fun m!443231 () Bool)

(assert (=> b!304734 m!443231))

(declare-fun m!443233 () Bool)

(assert (=> b!304734 m!443233))

(push 1)

(assert (not b!304731))

(assert (not b!304734))

(assert (not b!304733))

(assert (not b!304723))

(assert (not start!67882))

(assert (not bm!5690))

(assert (not b!304728))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun lt!438559 () tuple4!1198)

(declare-fun call!5702 () Bool)

(declare-fun lt!438561 () (_ BitVec 32))

(declare-fun bm!5699 () Bool)

(declare-fun c!14649 () Bool)

(declare-fun lt!438560 () (_ BitVec 32))

(assert (=> bm!5699 (= call!5702 (byteRangesEq!0 (select (arr!9111 a1!948) (_3!1556 lt!438559)) (select (arr!9111 a2!948) (_3!1556 lt!438559)) lt!438561 (ite c!14649 lt!438560 #b00000000000000000000000000001000)))))

(declare-fun b!304798 () Bool)

(declare-fun e!219465 () Bool)

(declare-fun e!219461 () Bool)

(assert (=> b!304798 (= e!219465 e!219461)))

(assert (=> b!304798 (= c!14649 (= (_3!1556 lt!438559) (_4!599 lt!438559)))))

(declare-fun d!101754 () Bool)

(declare-fun res!250664 () Bool)

(declare-fun e!219464 () Bool)

(assert (=> d!101754 (=> res!250664 e!219464)))

(assert (=> d!101754 (= res!250664 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101754 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!219464)))

(declare-fun b!304799 () Bool)

(declare-fun res!250667 () Bool)

(assert (=> b!304799 (= res!250667 (= lt!438560 #b00000000000000000000000000000000))))

(declare-fun e!219462 () Bool)

(assert (=> b!304799 (=> res!250667 e!219462)))

(declare-fun e!219463 () Bool)

(assert (=> b!304799 (= e!219463 e!219462)))

(declare-fun b!304800 () Bool)

(assert (=> b!304800 (= e!219464 e!219465)))

(declare-fun res!250665 () Bool)

(assert (=> b!304800 (=> (not res!250665) (not e!219465))))

(declare-fun e!219466 () Bool)

(assert (=> b!304800 (= res!250665 e!219466)))

(declare-fun res!250666 () Bool)

(assert (=> b!304800 (=> res!250666 e!219466)))

(assert (=> b!304800 (= res!250666 (bvsge (_1!13254 lt!438559) (_2!13254 lt!438559)))))

(assert (=> b!304800 (= lt!438560 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!304800 (= lt!438561 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!304800 (= lt!438559 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!304801 () Bool)

(assert (=> b!304801 (= e!219461 e!219463)))

(declare-fun res!250668 () Bool)

(assert (=> b!304801 (= res!250668 call!5702)))

(assert (=> b!304801 (=> (not res!250668) (not e!219463))))

(declare-fun b!304802 () Bool)

(assert (=> b!304802 (= e!219466 (arrayRangesEq!1657 a1!948 a2!948 (_1!13254 lt!438559) (_2!13254 lt!438559)))))

(declare-fun b!304803 () Bool)

(assert (=> b!304803 (= e!219462 (byteRangesEq!0 (select (arr!9111 a1!948) (_4!599 lt!438559)) (select (arr!9111 a2!948) (_4!599 lt!438559)) #b00000000000000000000000000000000 lt!438560))))

(declare-fun b!304804 () Bool)

(assert (=> b!304804 (= e!219461 call!5702)))

(assert (= (and d!101754 (not res!250664)) b!304800))

(assert (= (and b!304800 (not res!250666)) b!304802))

(assert (= (and b!304800 res!250665) b!304798))

(assert (= (and b!304798 c!14649) b!304804))

(assert (= (and b!304798 (not c!14649)) b!304801))

(assert (= (and b!304801 res!250668) b!304799))

(assert (= (and b!304799 (not res!250667)) b!304803))

(assert (= (or b!304804 b!304801) bm!5699))

(declare-fun m!443285 () Bool)

(assert (=> bm!5699 m!443285))

(declare-fun m!443287 () Bool)

(assert (=> bm!5699 m!443287))

(assert (=> bm!5699 m!443285))

(assert (=> bm!5699 m!443287))

(declare-fun m!443291 () Bool)

(assert (=> bm!5699 m!443291))

(assert (=> b!304800 m!443233))

(declare-fun m!443293 () Bool)

(assert (=> b!304802 m!443293))

(declare-fun m!443295 () Bool)

(assert (=> b!304803 m!443295))

(declare-fun m!443297 () Bool)

(assert (=> b!304803 m!443297))

(assert (=> b!304803 m!443295))

(assert (=> b!304803 m!443297))

(declare-fun m!443299 () Bool)

(assert (=> b!304803 m!443299))

(assert (=> b!304728 d!101754))

(declare-fun d!101760 () Bool)

(assert (=> d!101760 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1199 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!304734 d!101760))

(declare-fun d!101762 () Bool)

(assert (=> d!101762 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1199 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!304734 d!101762))

(declare-fun d!101764 () Bool)

(assert (=> d!101764 (arrayRangesEq!1657 a1!948 a2!948 (_1!13254 lt!438525) (_2!13254 lt!438525))))

(declare-fun lt!438564 () Unit!21267)

(declare-fun choose!581 (array!18510 array!18510 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21267)

(assert (=> d!101764 (= lt!438564 (choose!581 a1!948 a2!948 (_1!13254 lt!438519) (_2!13254 lt!438519) (_1!13254 lt!438525) (_2!13254 lt!438525)))))

(assert (=> d!101764 (and (bvsle #b00000000000000000000000000000000 (_1!13254 lt!438519)) (bvsle (_1!13254 lt!438519) (_2!13254 lt!438519)))))

(assert (=> d!101764 (= (arrayRangesEqSlicedLemma!252 a1!948 a2!948 (_1!13254 lt!438519) (_2!13254 lt!438519) (_1!13254 lt!438525) (_2!13254 lt!438525)) lt!438564)))

(declare-fun bs!26221 () Bool)

(assert (= bs!26221 d!101764))

(assert (=> bs!26221 m!443229))

(declare-fun m!443305 () Bool)

(assert (=> bs!26221 m!443305))

(assert (=> b!304723 d!101764))

(declare-fun d!101776 () Bool)

(declare-fun res!250673 () Bool)

(declare-fun e!219471 () Bool)

(assert (=> d!101776 (=> res!250673 e!219471)))

(assert (=> d!101776 (= res!250673 (= (_1!13254 lt!438525) (_2!13254 lt!438525)))))

(assert (=> d!101776 (= (arrayRangesEq!1657 a1!948 a2!948 (_1!13254 lt!438525) (_2!13254 lt!438525)) e!219471)))

(declare-fun b!304809 () Bool)

(declare-fun e!219472 () Bool)

(assert (=> b!304809 (= e!219471 e!219472)))

(declare-fun res!250674 () Bool)

(assert (=> b!304809 (=> (not res!250674) (not e!219472))))

(assert (=> b!304809 (= res!250674 (= (select (arr!9111 a1!948) (_1!13254 lt!438525)) (select (arr!9111 a2!948) (_1!13254 lt!438525))))))

(declare-fun b!304810 () Bool)

(assert (=> b!304810 (= e!219472 (arrayRangesEq!1657 a1!948 a2!948 (bvadd (_1!13254 lt!438525) #b00000000000000000000000000000001) (_2!13254 lt!438525)))))

(assert (= (and d!101776 (not res!250673)) b!304809))

(assert (= (and b!304809 res!250674) b!304810))

(declare-fun m!443307 () Bool)

(assert (=> b!304809 m!443307))

(declare-fun m!443309 () Bool)

(assert (=> b!304809 m!443309))

(declare-fun m!443311 () Bool)

(assert (=> b!304810 m!443311))

(assert (=> b!304723 d!101776))

(declare-fun d!101778 () Bool)

(assert (=> d!101778 (and (bvsge (_3!1556 lt!438525) #b00000000000000000000000000000000) (bvslt (_3!1556 lt!438525) (size!8028 a1!948)) (bvslt (_3!1556 lt!438525) (size!8028 a2!948)) (= (select (arr!9111 a1!948) (_3!1556 lt!438525)) (select (arr!9111 a2!948) (_3!1556 lt!438525))))))

(declare-fun lt!438570 () Unit!21267)

(declare-fun choose!583 (array!18510 array!18510 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21267)

(assert (=> d!101778 (= lt!438570 (choose!583 a1!948 a2!948 (_1!13254 lt!438519) (_3!1556 lt!438525) (_2!13254 lt!438519)))))

(assert (=> d!101778 (and (bvsle #b00000000000000000000000000000000 (_1!13254 lt!438519)) (bvsle (_1!13254 lt!438519) (_2!13254 lt!438519)))))

(assert (=> d!101778 (= (arrayRangesEqImpliesEq!261 a1!948 a2!948 (_1!13254 lt!438519) (_3!1556 lt!438525) (_2!13254 lt!438519)) lt!438570)))

(declare-fun bs!26223 () Bool)

(assert (= bs!26223 d!101778))

(assert (=> bs!26223 m!443205))

(assert (=> bs!26223 m!443207))

(declare-fun m!443321 () Bool)

(assert (=> bs!26223 m!443321))

(assert (=> b!304733 d!101778))

(declare-fun d!101782 () Bool)

(assert (=> d!101782 (= (byteRangesEq!0 (select (arr!9111 a1!948) (_4!599 lt!438519)) (select (arr!9111 a2!948) (_4!599 lt!438519)) #b00000000000000000000000000000000 lt!438521) (or (= #b00000000000000000000000000000000 lt!438521) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9111 a1!948) (_4!599 lt!438519))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!438521))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9111 a2!948) (_4!599 lt!438519))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!438521))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26224 () Bool)

(assert (= bs!26224 d!101782))

(declare-fun m!443323 () Bool)

(assert (=> bs!26224 m!443323))

(declare-fun m!443325 () Bool)

(assert (=> bs!26224 m!443325))

(assert (=> b!304731 d!101782))

(declare-fun d!101784 () Bool)

(assert (=> d!101784 (= (array_inv!7640 a1!948) (bvsge (size!8028 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67882 d!101784))

(declare-fun d!101786 () Bool)

(assert (=> d!101786 (= (array_inv!7640 a2!948) (bvsge (size!8028 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67882 d!101786))

(declare-fun d!101788 () Bool)

(assert (=> d!101788 (= (byteRangesEq!0 (select (arr!9111 a1!948) (_3!1556 lt!438519)) (select (arr!9111 a2!948) (_3!1556 lt!438519)) lt!438518 (ite c!14638 lt!438521 #b00000000000000000000000000000111)) (or (= lt!438518 (ite c!14638 lt!438521 #b00000000000000000000000000000111)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9111 a1!948) (_3!1556 lt!438519))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!14638 lt!438521 #b00000000000000000000000000000111)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!438518)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9111 a2!948) (_3!1556 lt!438519))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!14638 lt!438521 #b00000000000000000000000000000111)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!438518)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26225 () Bool)

(assert (= bs!26225 d!101788))

(declare-fun m!443327 () Bool)

(assert (=> bs!26225 m!443327))

(declare-fun m!443329 () Bool)

(assert (=> bs!26225 m!443329))

(assert (=> bm!5690 d!101788))

(push 1)

(assert (not b!304802))

(assert (not b!304803))

(assert (not bm!5699))

(assert (not b!304800))

(assert (not b!304810))

(assert (not d!101778))

(assert (not d!101764))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

