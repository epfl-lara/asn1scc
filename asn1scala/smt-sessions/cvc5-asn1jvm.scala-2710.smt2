; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66376 () Bool)

(assert start!66376)

(declare-fun b!297489 () Bool)

(declare-fun res!245531 () Bool)

(declare-fun e!212980 () Bool)

(assert (=> b!297489 (=> (not res!245531) (not e!212980))))

(declare-datatypes ((array!17813 0))(
  ( (array!17814 (arr!8800 (Array (_ BitVec 32) (_ BitVec 8))) (size!7720 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13444 0))(
  ( (BitStream!13445 (buf!7783 array!17813) (currentByte!14325 (_ BitVec 32)) (currentBit!14320 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13444)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297489 (= res!245531 (validate_offset_bits!1 ((_ sign_extend 32) (size!7720 (buf!7783 thiss!1728))) ((_ sign_extend 32) (currentByte!14325 thiss!1728)) ((_ sign_extend 32) (currentBit!14320 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!245530 () Bool)

(assert (=> start!66376 (=> (not res!245530) (not e!212980))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun arr!273 () array!17813)

(assert (=> start!66376 (= res!245530 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7720 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66376 e!212980))

(declare-fun e!212979 () Bool)

(declare-fun inv!12 (BitStream!13444) Bool)

(assert (=> start!66376 (and (inv!12 thiss!1728) e!212979)))

(assert (=> start!66376 true))

(declare-fun array_inv!7332 (array!17813) Bool)

(assert (=> start!66376 (array_inv!7332 arr!273)))

(declare-fun b!297490 () Bool)

(declare-fun res!245529 () Bool)

(assert (=> b!297490 (=> (not res!245529) (not e!212980))))

(assert (=> b!297490 (= res!245529 (bvsge from!505 to!474))))

(declare-fun b!297492 () Bool)

(assert (=> b!297492 (= e!212979 (array_inv!7332 (buf!7783 thiss!1728)))))

(declare-fun b!297491 () Bool)

(declare-fun lt!433721 () (_ BitVec 64))

(declare-fun lt!433718 () (_ BitVec 64))

(assert (=> b!297491 (= e!212980 (not (or (not (= lt!433721 (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!433721 (bvand (bvadd lt!433718 to!474) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!297491 (= lt!433721 (bvand lt!433718 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!297491 (= lt!433718 (bitIndex!0 (size!7720 (buf!7783 thiss!1728)) (currentByte!14325 thiss!1728) (currentBit!14320 thiss!1728)))))

(declare-fun arrayBitRangesEq!0 (array!17813 array!17813 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297491 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((Unit!20761 0))(
  ( (Unit!20762) )
))
(declare-fun lt!433720 () Unit!20761)

(declare-fun lt!433722 () (_ BitVec 64))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17813 array!17813 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20761)

(assert (=> b!297491 (= lt!433720 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!433722 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!297491 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!433722)))

(assert (=> b!297491 (= lt!433722 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7720 arr!273))))))

(declare-fun lt!433719 () Unit!20761)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17813) Unit!20761)

(assert (=> b!297491 (= lt!433719 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(assert (= (and start!66376 res!245530) b!297489))

(assert (= (and b!297489 res!245531) b!297490))

(assert (= (and b!297490 res!245529) b!297491))

(assert (= start!66376 b!297492))

(declare-fun m!436309 () Bool)

(assert (=> b!297489 m!436309))

(declare-fun m!436311 () Bool)

(assert (=> start!66376 m!436311))

(declare-fun m!436313 () Bool)

(assert (=> start!66376 m!436313))

(declare-fun m!436315 () Bool)

(assert (=> b!297492 m!436315))

(declare-fun m!436317 () Bool)

(assert (=> b!297491 m!436317))

(declare-fun m!436319 () Bool)

(assert (=> b!297491 m!436319))

(declare-fun m!436321 () Bool)

(assert (=> b!297491 m!436321))

(declare-fun m!436323 () Bool)

(assert (=> b!297491 m!436323))

(declare-fun m!436325 () Bool)

(assert (=> b!297491 m!436325))

(push 1)

(assert (not b!297491))

(assert (not b!297489))

(assert (not b!297492))

(assert (not start!66376))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun c!13608 () Bool)

(declare-fun call!5246 () Bool)

(declare-datatypes ((tuple4!918 0))(
  ( (tuple4!919 (_1!13108 (_ BitVec 32)) (_2!13108 (_ BitVec 32)) (_3!1416 (_ BitVec 32)) (_4!459 (_ BitVec 32))) )
))
(declare-fun lt!433772 () tuple4!918)

(declare-fun bm!5243 () Bool)

(declare-fun lt!433771 () (_ BitVec 32))

(declare-fun lt!433773 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5243 (= call!5246 (byteRangesEq!0 (ite c!13608 (select (arr!8800 arr!273) (_3!1416 lt!433772)) (select (arr!8800 arr!273) (_4!459 lt!433772))) (ite c!13608 (select (arr!8800 arr!273) (_3!1416 lt!433772)) (select (arr!8800 arr!273) (_4!459 lt!433772))) (ite c!13608 lt!433773 #b00000000000000000000000000000000) lt!433771))))

(declare-fun b!297538 () Bool)

(declare-fun e!213028 () Bool)

(declare-fun e!213025 () Bool)

(assert (=> b!297538 (= e!213028 e!213025)))

(declare-fun res!245566 () Bool)

(assert (=> b!297538 (= res!245566 (byteRangesEq!0 (select (arr!8800 arr!273) (_3!1416 lt!433772)) (select (arr!8800 arr!273) (_3!1416 lt!433772)) lt!433773 #b00000000000000000000000000001000))))

(assert (=> b!297538 (=> (not res!245566) (not e!213025))))

(declare-fun b!297539 () Bool)

(declare-fun e!213030 () Bool)

(assert (=> b!297539 (= e!213030 call!5246)))

(declare-fun d!100182 () Bool)

(declare-fun res!245569 () Bool)

(declare-fun e!213029 () Bool)

(assert (=> d!100182 (=> res!245569 e!213029)))

(assert (=> d!100182 (= res!245569 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!433722))))

(assert (=> d!100182 (= (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!433722) e!213029)))

(declare-fun b!297537 () Bool)

(declare-fun res!245570 () Bool)

(assert (=> b!297537 (= res!245570 (= lt!433771 #b00000000000000000000000000000000))))

(assert (=> b!297537 (=> res!245570 e!213030)))

(assert (=> b!297537 (= e!213025 e!213030)))

(declare-fun b!297540 () Bool)

(declare-fun e!213026 () Bool)

(assert (=> b!297540 (= e!213029 e!213026)))

(declare-fun res!245568 () Bool)

(assert (=> b!297540 (=> (not res!245568) (not e!213026))))

(declare-fun e!213027 () Bool)

(assert (=> b!297540 (= res!245568 e!213027)))

(declare-fun res!245567 () Bool)

(assert (=> b!297540 (=> res!245567 e!213027)))

(assert (=> b!297540 (= res!245567 (bvsge (_1!13108 lt!433772) (_2!13108 lt!433772)))))

(assert (=> b!297540 (= lt!433771 ((_ extract 31 0) (bvsrem lt!433722 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!297540 (= lt!433773 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!918)

(assert (=> b!297540 (= lt!433772 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!433722))))

(declare-fun b!297541 () Bool)

(assert (=> b!297541 (= e!213026 e!213028)))

(assert (=> b!297541 (= c!13608 (= (_3!1416 lt!433772) (_4!459 lt!433772)))))

(declare-fun b!297542 () Bool)

(assert (=> b!297542 (= e!213028 call!5246)))

(declare-fun b!297543 () Bool)

(declare-fun arrayRangesEq!1517 (array!17813 array!17813 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!297543 (= e!213027 (arrayRangesEq!1517 arr!273 arr!273 (_1!13108 lt!433772) (_2!13108 lt!433772)))))

(assert (= (and d!100182 (not res!245569)) b!297540))

(assert (= (and b!297540 (not res!245567)) b!297543))

(assert (= (and b!297540 res!245568) b!297541))

(assert (= (and b!297541 c!13608) b!297542))

(assert (= (and b!297541 (not c!13608)) b!297538))

(assert (= (and b!297538 res!245566) b!297537))

(assert (= (and b!297537 (not res!245570)) b!297539))

(assert (= (or b!297542 b!297539) bm!5243))

(declare-fun m!436371 () Bool)

(assert (=> bm!5243 m!436371))

(declare-fun m!436373 () Bool)

(assert (=> bm!5243 m!436373))

(declare-fun m!436375 () Bool)

(assert (=> bm!5243 m!436375))

(assert (=> bm!5243 m!436371))

(assert (=> bm!5243 m!436375))

(assert (=> b!297538 m!436371))

(assert (=> b!297538 m!436371))

(assert (=> b!297538 m!436371))

(assert (=> b!297538 m!436371))

(declare-fun m!436377 () Bool)

(assert (=> b!297538 m!436377))

(declare-fun m!436379 () Bool)

(assert (=> b!297540 m!436379))

(declare-fun m!436381 () Bool)

(assert (=> b!297543 m!436381))

(assert (=> b!297491 d!100182))

(declare-fun d!100190 () Bool)

(declare-fun e!213063 () Bool)

(assert (=> d!100190 e!213063))

(declare-fun res!245600 () Bool)

(assert (=> d!100190 (=> (not res!245600) (not e!213063))))

(declare-fun lt!433803 () (_ BitVec 64))

(declare-fun lt!433802 () (_ BitVec 64))

(declare-fun lt!433804 () (_ BitVec 64))

(assert (=> d!100190 (= res!245600 (= lt!433802 (bvsub lt!433803 lt!433804)))))

(assert (=> d!100190 (or (= (bvand lt!433803 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!433804 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!433803 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!433803 lt!433804) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!100190 (= lt!433804 (remainingBits!0 ((_ sign_extend 32) (size!7720 (buf!7783 thiss!1728))) ((_ sign_extend 32) (currentByte!14325 thiss!1728)) ((_ sign_extend 32) (currentBit!14320 thiss!1728))))))

(declare-fun lt!433801 () (_ BitVec 64))

(declare-fun lt!433805 () (_ BitVec 64))

(assert (=> d!100190 (= lt!433803 (bvmul lt!433801 lt!433805))))

(assert (=> d!100190 (or (= lt!433801 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!433805 (bvsdiv (bvmul lt!433801 lt!433805) lt!433801)))))

(assert (=> d!100190 (= lt!433805 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!100190 (= lt!433801 ((_ sign_extend 32) (size!7720 (buf!7783 thiss!1728))))))

(assert (=> d!100190 (= lt!433802 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14325 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14320 thiss!1728))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!100190 (invariant!0 (currentBit!14320 thiss!1728) (currentByte!14325 thiss!1728) (size!7720 (buf!7783 thiss!1728)))))

(assert (=> d!100190 (= (bitIndex!0 (size!7720 (buf!7783 thiss!1728)) (currentByte!14325 thiss!1728) (currentBit!14320 thiss!1728)) lt!433802)))

(declare-fun b!297583 () Bool)

(declare-fun res!245601 () Bool)

(assert (=> b!297583 (=> (not res!245601) (not e!213063))))

(assert (=> b!297583 (= res!245601 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!433802))))

(declare-fun b!297584 () Bool)

(declare-fun lt!433806 () (_ BitVec 64))

(assert (=> b!297584 (= e!213063 (bvsle lt!433802 (bvmul lt!433806 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!297584 (or (= lt!433806 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!433806 #b0000000000000000000000000000000000000000000000000000000000001000) lt!433806)))))

(assert (=> b!297584 (= lt!433806 ((_ sign_extend 32) (size!7720 (buf!7783 thiss!1728))))))

(assert (= (and d!100190 res!245600) b!297583))

(assert (= (and b!297583 res!245601) b!297584))

(declare-fun m!436395 () Bool)

(assert (=> d!100190 m!436395))

(declare-fun m!436397 () Bool)

(assert (=> d!100190 m!436397))

(assert (=> b!297491 d!100190))

(declare-fun lt!433809 () (_ BitVec 32))

(declare-fun lt!433808 () tuple4!918)

(declare-fun bm!5249 () Bool)

(declare-fun lt!433807 () (_ BitVec 32))

(declare-fun c!13614 () Bool)

(declare-fun call!5252 () Bool)

(assert (=> bm!5249 (= call!5252 (byteRangesEq!0 (ite c!13614 (select (arr!8800 arr!273) (_3!1416 lt!433808)) (select (arr!8800 arr!273) (_4!459 lt!433808))) (ite c!13614 (select (arr!8800 arr!273) (_3!1416 lt!433808)) (select (arr!8800 arr!273) (_4!459 lt!433808))) (ite c!13614 lt!433809 #b00000000000000000000000000000000) lt!433807))))

(declare-fun b!297586 () Bool)

(declare-fun e!213067 () Bool)

(declare-fun e!213064 () Bool)

(assert (=> b!297586 (= e!213067 e!213064)))

(declare-fun res!245602 () Bool)

(assert (=> b!297586 (= res!245602 (byteRangesEq!0 (select (arr!8800 arr!273) (_3!1416 lt!433808)) (select (arr!8800 arr!273) (_3!1416 lt!433808)) lt!433809 #b00000000000000000000000000001000))))

(assert (=> b!297586 (=> (not res!245602) (not e!213064))))

(declare-fun b!297587 () Bool)

(declare-fun e!213069 () Bool)

(assert (=> b!297587 (= e!213069 call!5252)))

(declare-fun d!100194 () Bool)

(declare-fun res!245605 () Bool)

(declare-fun e!213068 () Bool)

(assert (=> d!100194 (=> res!245605 e!213068)))

(assert (=> d!100194 (= res!245605 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!100194 (= (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!213068)))

(declare-fun b!297585 () Bool)

(declare-fun res!245606 () Bool)

(assert (=> b!297585 (= res!245606 (= lt!433807 #b00000000000000000000000000000000))))

(assert (=> b!297585 (=> res!245606 e!213069)))

(assert (=> b!297585 (= e!213064 e!213069)))

(declare-fun b!297588 () Bool)

(declare-fun e!213065 () Bool)

(assert (=> b!297588 (= e!213068 e!213065)))

(declare-fun res!245604 () Bool)

(assert (=> b!297588 (=> (not res!245604) (not e!213065))))

(declare-fun e!213066 () Bool)

(assert (=> b!297588 (= res!245604 e!213066)))

(declare-fun res!245603 () Bool)

(assert (=> b!297588 (=> res!245603 e!213066)))

(assert (=> b!297588 (= res!245603 (bvsge (_1!13108 lt!433808) (_2!13108 lt!433808)))))

(assert (=> b!297588 (= lt!433807 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!297588 (= lt!433809 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!297588 (= lt!433808 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!297589 () Bool)

(assert (=> b!297589 (= e!213065 e!213067)))

(assert (=> b!297589 (= c!13614 (= (_3!1416 lt!433808) (_4!459 lt!433808)))))

(declare-fun b!297590 () Bool)

(assert (=> b!297590 (= e!213067 call!5252)))

(declare-fun b!297591 () Bool)

(assert (=> b!297591 (= e!213066 (arrayRangesEq!1517 arr!273 arr!273 (_1!13108 lt!433808) (_2!13108 lt!433808)))))

(assert (= (and d!100194 (not res!245605)) b!297588))

(assert (= (and b!297588 (not res!245603)) b!297591))

(assert (= (and b!297588 res!245604) b!297589))

(assert (= (and b!297589 c!13614) b!297590))

(assert (= (and b!297589 (not c!13614)) b!297586))

(assert (= (and b!297586 res!245602) b!297585))

(assert (= (and b!297585 (not res!245606)) b!297587))

(assert (= (or b!297590 b!297587) bm!5249))

(declare-fun m!436399 () Bool)

(assert (=> bm!5249 m!436399))

(declare-fun m!436401 () Bool)

(assert (=> bm!5249 m!436401))

(declare-fun m!436403 () Bool)

(assert (=> bm!5249 m!436403))

(assert (=> bm!5249 m!436399))

(assert (=> bm!5249 m!436403))

(assert (=> b!297586 m!436399))

(assert (=> b!297586 m!436399))

(assert (=> b!297586 m!436399))

(assert (=> b!297586 m!436399))

(declare-fun m!436405 () Bool)

(assert (=> b!297586 m!436405))

(declare-fun m!436407 () Bool)

(assert (=> b!297588 m!436407))

(declare-fun m!436409 () Bool)

(assert (=> b!297591 m!436409))

(assert (=> b!297491 d!100194))

(declare-fun d!100196 () Bool)

(assert (=> d!100196 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!433818 () Unit!20761)

(declare-fun choose!4 (array!17813 array!17813 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20761)

(assert (=> d!100196 (= lt!433818 (choose!4 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!433722 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!100196 (bvsle (size!7720 arr!273) (size!7720 arr!273))))

(assert (=> d!100196 (= (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!433722 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) lt!433818)))

(declare-fun bs!25636 () Bool)

(assert (= bs!25636 d!100196))

(assert (=> bs!25636 m!436321))

(declare-fun m!436425 () Bool)

(assert (=> bs!25636 m!436425))

(assert (=> b!297491 d!100196))

(declare-fun d!100202 () Bool)

(declare-fun e!213078 () Bool)

(assert (=> d!100202 e!213078))

(declare-fun res!245614 () Bool)

(assert (=> d!100202 (=> (not res!245614) (not e!213078))))

(declare-fun lt!433827 () (_ BitVec 64))

(assert (=> d!100202 (= res!245614 (or (= lt!433827 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!433827 #b0000000000000000000000000000000000000000000000000000000000001000) lt!433827))))))

(assert (=> d!100202 (= lt!433827 ((_ sign_extend 32) (size!7720 arr!273)))))

(declare-fun lt!433826 () Unit!20761)

(declare-fun choose!59 (array!17813) Unit!20761)

(assert (=> d!100202 (= lt!433826 (choose!59 arr!273))))

(assert (=> d!100202 (= (arrayBitRangesEqReflexiveLemma!0 arr!273) lt!433826)))

(declare-fun b!297601 () Bool)

(assert (=> b!297601 (= e!213078 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!7720 arr!273)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and d!100202 res!245614) b!297601))

(declare-fun m!436429 () Bool)

(assert (=> d!100202 m!436429))

(declare-fun m!436431 () Bool)

(assert (=> b!297601 m!436431))

(assert (=> b!297491 d!100202))

(declare-fun d!100206 () Bool)

(assert (=> d!100206 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7720 (buf!7783 thiss!1728))) ((_ sign_extend 32) (currentByte!14325 thiss!1728)) ((_ sign_extend 32) (currentBit!14320 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7720 (buf!7783 thiss!1728))) ((_ sign_extend 32) (currentByte!14325 thiss!1728)) ((_ sign_extend 32) (currentBit!14320 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!25638 () Bool)

(assert (= bs!25638 d!100206))

(assert (=> bs!25638 m!436395))

(assert (=> b!297489 d!100206))

(declare-fun d!100208 () Bool)

(assert (=> d!100208 (= (array_inv!7332 (buf!7783 thiss!1728)) (bvsge (size!7720 (buf!7783 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!297492 d!100208))

(declare-fun d!100210 () Bool)

(assert (=> d!100210 (= (inv!12 thiss!1728) (invariant!0 (currentBit!14320 thiss!1728) (currentByte!14325 thiss!1728) (size!7720 (buf!7783 thiss!1728))))))

(declare-fun bs!25639 () Bool)

(assert (= bs!25639 d!100210))

(assert (=> bs!25639 m!436397))

(assert (=> start!66376 d!100210))

(declare-fun d!100212 () Bool)

(assert (=> d!100212 (= (array_inv!7332 arr!273) (bvsge (size!7720 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!66376 d!100212))

(push 1)

(assert (not b!297591))

(assert (not d!100190))

(assert (not d!100202))

(assert (not b!297601))

(assert (not b!297540))

(assert (not d!100196))

(assert (not b!297586))

(assert (not d!100206))

(assert (not b!297543))

(assert (not bm!5249))

(assert (not bm!5243))

(assert (not b!297538))

(assert (not d!100210))

(assert (not b!297588))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

