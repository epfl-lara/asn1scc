; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67708 () Bool)

(assert start!67708)

(declare-fun b!303918 () Bool)

(declare-fun e!218728 () Bool)

(declare-fun e!218731 () Bool)

(assert (=> b!303918 (= e!218728 e!218731)))

(declare-datatypes ((tuple4!1168 0))(
  ( (tuple4!1169 (_1!13239 (_ BitVec 32)) (_2!13239 (_ BitVec 32)) (_3!1541 (_ BitVec 32)) (_4!584 (_ BitVec 32))) )
))
(declare-fun lt!438062 () tuple4!1168)

(declare-datatypes ((array!18468 0))(
  ( (array!18469 (arr!9096 (Array (_ BitVec 32) (_ BitVec 8))) (size!8013 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18468)

(declare-fun lt!438063 () (_ BitVec 32))

(declare-fun res!250057 () Bool)

(declare-fun a2!948 () array!18468)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!303918 (= res!250057 (byteRangesEq!0 (select (arr!9096 a1!948) (_3!1541 lt!438062)) (select (arr!9096 a2!948) (_3!1541 lt!438062)) lt!438063 #b00000000000000000000000000000111))))

(assert (=> b!303918 (=> (not res!250057) (not e!218731))))

(declare-fun res!250058 () Bool)

(declare-fun e!218732 () Bool)

(assert (=> start!67708 (=> (not res!250058) (not e!218732))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(assert (=> start!67708 (= res!250058 (and (bvsle (size!8013 a1!948) (size!8013 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67708 e!218732))

(assert (=> start!67708 true))

(declare-fun array_inv!7625 (array!18468) Bool)

(assert (=> start!67708 (array_inv!7625 a1!948)))

(assert (=> start!67708 (array_inv!7625 a2!948)))

(declare-fun b!303919 () Bool)

(declare-fun call!5621 () Bool)

(assert (=> b!303919 (= e!218728 call!5621)))

(declare-fun b!303920 () Bool)

(declare-datatypes ((Unit!21220 0))(
  ( (Unit!21221) )
))
(declare-fun e!218727 () Unit!21220)

(declare-fun Unit!21222 () Unit!21220)

(assert (=> b!303920 (= e!218727 Unit!21222)))

(declare-fun b!303921 () Bool)

(declare-fun res!250060 () Bool)

(declare-fun e!218729 () Bool)

(assert (=> b!303921 (=> (not res!250060) (not e!218729))))

(declare-fun lt!438060 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!303921 (= res!250060 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!438060) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!303922 () Bool)

(declare-fun res!250059 () Bool)

(declare-fun lt!438064 () (_ BitVec 32))

(assert (=> b!303922 (= res!250059 (= lt!438064 #b00000000000000000000000000000000))))

(declare-fun e!218726 () Bool)

(assert (=> b!303922 (=> res!250059 e!218726)))

(assert (=> b!303922 (= e!218731 e!218726)))

(declare-fun b!303923 () Bool)

(declare-fun e!218733 () Bool)

(declare-fun lt!438065 () tuple4!1168)

(assert (=> b!303923 (= e!218733 (and (bvslt (_3!1541 lt!438062) (_3!1541 lt!438065)) (bvslt (_3!1541 lt!438065) (_4!584 lt!438062)) (or (bvsgt #b00000000000000000000000000000000 (_1!13239 lt!438062)) (bvsgt (_1!13239 lt!438062) (_2!13239 lt!438062)))))))

(declare-fun c!14514 () Bool)

(declare-fun bm!5618 () Bool)

(assert (=> bm!5618 (= call!5621 (byteRangesEq!0 (ite c!14514 (select (arr!9096 a1!948) (_3!1541 lt!438062)) (select (arr!9096 a1!948) (_4!584 lt!438062))) (ite c!14514 (select (arr!9096 a2!948) (_3!1541 lt!438062)) (select (arr!9096 a2!948) (_4!584 lt!438062))) (ite c!14514 lt!438063 #b00000000000000000000000000000000) lt!438064))))

(declare-fun b!303924 () Bool)

(declare-fun lt!438061 () Unit!21220)

(assert (=> b!303924 (= e!218727 lt!438061)))

(declare-fun arrayRangesEqSlicedLemma!237 (array!18468 array!18468 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21220)

(assert (=> b!303924 (= lt!438061 (arrayRangesEqSlicedLemma!237 a1!948 a2!948 (_1!13239 lt!438062) (_2!13239 lt!438062) (_1!13239 lt!438065) (_2!13239 lt!438065)))))

(declare-fun arrayRangesEq!1642 (array!18468 array!18468 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!303924 (arrayRangesEq!1642 a1!948 a2!948 (_1!13239 lt!438065) (_2!13239 lt!438065))))

(declare-fun b!303925 () Bool)

(assert (=> b!303925 (= e!218726 call!5621)))

(declare-fun b!303926 () Bool)

(assert (=> b!303926 (= e!218732 e!218729)))

(declare-fun res!250062 () Bool)

(assert (=> b!303926 (=> (not res!250062) (not e!218729))))

(assert (=> b!303926 (= res!250062 (and (bvsle toBit!258 lt!438060) (bvsle fromBit!258 lt!438060)))))

(assert (=> b!303926 (= lt!438060 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8013 a1!948))))))

(declare-fun b!303927 () Bool)

(assert (=> b!303927 (= e!218729 e!218733)))

(declare-fun res!250061 () Bool)

(assert (=> b!303927 (=> (not res!250061) (not e!218733))))

(assert (=> b!303927 (= res!250061 e!218728)))

(assert (=> b!303927 (= c!14514 (= (_3!1541 lt!438062) (_4!584 lt!438062)))))

(declare-fun lt!438066 () Unit!21220)

(assert (=> b!303927 (= lt!438066 e!218727)))

(declare-fun c!14513 () Bool)

(assert (=> b!303927 (= c!14513 (bvslt (_1!13239 lt!438065) (_2!13239 lt!438065)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1168)

(assert (=> b!303927 (= lt!438065 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!303927 (= lt!438064 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!303927 (= lt!438063 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!303927 (= lt!438062 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!303928 () Bool)

(declare-fun res!250056 () Bool)

(assert (=> b!303928 (=> (not res!250056) (not e!218729))))

(declare-fun arrayBitRangesEq!0 (array!18468 array!18468 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!303928 (= res!250056 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(assert (= (and start!67708 res!250058) b!303926))

(assert (= (and b!303926 res!250062) b!303928))

(assert (= (and b!303928 res!250056) b!303921))

(assert (= (and b!303921 res!250060) b!303927))

(assert (= (and b!303927 c!14513) b!303924))

(assert (= (and b!303927 (not c!14513)) b!303920))

(assert (= (and b!303927 c!14514) b!303919))

(assert (= (and b!303927 (not c!14514)) b!303918))

(assert (= (and b!303918 res!250057) b!303922))

(assert (= (and b!303922 (not res!250059)) b!303925))

(assert (= (or b!303919 b!303925) bm!5618))

(assert (= (and b!303927 res!250061) b!303923))

(declare-fun m!442453 () Bool)

(assert (=> b!303927 m!442453))

(declare-fun m!442455 () Bool)

(assert (=> b!303927 m!442455))

(declare-fun m!442457 () Bool)

(assert (=> start!67708 m!442457))

(declare-fun m!442459 () Bool)

(assert (=> start!67708 m!442459))

(declare-fun m!442461 () Bool)

(assert (=> bm!5618 m!442461))

(declare-fun m!442463 () Bool)

(assert (=> bm!5618 m!442463))

(declare-fun m!442465 () Bool)

(assert (=> bm!5618 m!442465))

(declare-fun m!442467 () Bool)

(assert (=> bm!5618 m!442467))

(declare-fun m!442469 () Bool)

(assert (=> bm!5618 m!442469))

(declare-fun m!442471 () Bool)

(assert (=> b!303924 m!442471))

(declare-fun m!442473 () Bool)

(assert (=> b!303924 m!442473))

(declare-fun m!442475 () Bool)

(assert (=> b!303928 m!442475))

(assert (=> b!303918 m!442461))

(assert (=> b!303918 m!442463))

(assert (=> b!303918 m!442461))

(assert (=> b!303918 m!442463))

(declare-fun m!442477 () Bool)

(assert (=> b!303918 m!442477))

(push 1)

(assert (not bm!5618))

(assert (not b!303928))

(assert (not b!303924))

(assert (not b!303927))

(assert (not start!67708))

(assert (not b!303918))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!101534 () Bool)

(declare-fun res!250119 () Bool)

(declare-fun e!218799 () Bool)

(assert (=> d!101534 (=> res!250119 e!218799)))

(assert (=> d!101534 (= res!250119 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101534 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!218799)))

(declare-fun b!303997 () Bool)

(declare-fun e!218798 () Bool)

(declare-fun e!218796 () Bool)

(assert (=> b!303997 (= e!218798 e!218796)))

(declare-fun c!14523 () Bool)

(declare-fun lt!438099 () tuple4!1168)

(assert (=> b!303997 (= c!14523 (= (_3!1541 lt!438099) (_4!584 lt!438099)))))

(declare-fun e!218797 () Bool)

(declare-fun lt!438097 () (_ BitVec 32))

(declare-fun b!303998 () Bool)

(assert (=> b!303998 (= e!218797 (byteRangesEq!0 (select (arr!9096 a1!948) (_4!584 lt!438099)) (select (arr!9096 a2!948) (_4!584 lt!438099)) #b00000000000000000000000000000000 lt!438097))))

(declare-fun lt!438098 () (_ BitVec 32))

(declare-fun call!5630 () Bool)

(declare-fun bm!5627 () Bool)

(assert (=> bm!5627 (= call!5630 (byteRangesEq!0 (select (arr!9096 a1!948) (_3!1541 lt!438099)) (select (arr!9096 a2!948) (_3!1541 lt!438099)) lt!438098 (ite c!14523 lt!438097 #b00000000000000000000000000001000)))))

(declare-fun b!303999 () Bool)

(assert (=> b!303999 (= e!218799 e!218798)))

(declare-fun res!250115 () Bool)

(assert (=> b!303999 (=> (not res!250115) (not e!218798))))

(declare-fun e!218795 () Bool)

(assert (=> b!303999 (= res!250115 e!218795)))

(declare-fun res!250117 () Bool)

(assert (=> b!303999 (=> res!250117 e!218795)))

(assert (=> b!303999 (= res!250117 (bvsge (_1!13239 lt!438099) (_2!13239 lt!438099)))))

(assert (=> b!303999 (= lt!438097 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!303999 (= lt!438098 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!303999 (= lt!438099 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!304000 () Bool)

(assert (=> b!304000 (= e!218796 call!5630)))

(declare-fun b!304001 () Bool)

(declare-fun res!250116 () Bool)

(assert (=> b!304001 (= res!250116 (= lt!438097 #b00000000000000000000000000000000))))

(assert (=> b!304001 (=> res!250116 e!218797)))

(declare-fun e!218800 () Bool)

(assert (=> b!304001 (= e!218800 e!218797)))

(declare-fun b!304002 () Bool)

(assert (=> b!304002 (= e!218795 (arrayRangesEq!1642 a1!948 a2!948 (_1!13239 lt!438099) (_2!13239 lt!438099)))))

(declare-fun b!304003 () Bool)

(assert (=> b!304003 (= e!218796 e!218800)))

(declare-fun res!250118 () Bool)

(assert (=> b!304003 (= res!250118 call!5630)))

(assert (=> b!304003 (=> (not res!250118) (not e!218800))))

(assert (= (and d!101534 (not res!250119)) b!303999))

(assert (= (and b!303999 (not res!250117)) b!304002))

(assert (= (and b!303999 res!250115) b!303997))

(assert (= (and b!303997 c!14523) b!304000))

(assert (= (and b!303997 (not c!14523)) b!304003))

(assert (= (and b!304003 res!250118) b!304001))

(assert (= (and b!304001 (not res!250116)) b!303998))

(assert (= (or b!304000 b!304003) bm!5627))

(declare-fun m!442539 () Bool)

(assert (=> b!303998 m!442539))

(declare-fun m!442541 () Bool)

(assert (=> b!303998 m!442541))

(assert (=> b!303998 m!442539))

(assert (=> b!303998 m!442541))

(declare-fun m!442543 () Bool)

(assert (=> b!303998 m!442543))

(declare-fun m!442545 () Bool)

(assert (=> bm!5627 m!442545))

(declare-fun m!442547 () Bool)

(assert (=> bm!5627 m!442547))

(assert (=> bm!5627 m!442545))

(assert (=> bm!5627 m!442547))

(declare-fun m!442549 () Bool)

(assert (=> bm!5627 m!442549))

(assert (=> b!303999 m!442455))

(declare-fun m!442551 () Bool)

(assert (=> b!304002 m!442551))

(assert (=> b!303928 d!101534))

(declare-fun d!101536 () Bool)

(assert (=> d!101536 (= (byteRangesEq!0 (select (arr!9096 a1!948) (_3!1541 lt!438062)) (select (arr!9096 a2!948) (_3!1541 lt!438062)) lt!438063 #b00000000000000000000000000000111) (or (= lt!438063 #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9096 a1!948) (_3!1541 lt!438062))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!438063)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9096 a2!948) (_3!1541 lt!438062))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!438063)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26169 () Bool)

(assert (= bs!26169 d!101536))

(declare-fun m!442553 () Bool)

(assert (=> bs!26169 m!442553))

(declare-fun m!442555 () Bool)

(assert (=> bs!26169 m!442555))

(assert (=> b!303918 d!101536))

(declare-fun d!101538 () Bool)

(assert (=> d!101538 (= (byteRangesEq!0 (ite c!14514 (select (arr!9096 a1!948) (_3!1541 lt!438062)) (select (arr!9096 a1!948) (_4!584 lt!438062))) (ite c!14514 (select (arr!9096 a2!948) (_3!1541 lt!438062)) (select (arr!9096 a2!948) (_4!584 lt!438062))) (ite c!14514 lt!438063 #b00000000000000000000000000000000) lt!438064) (or (= (ite c!14514 lt!438063 #b00000000000000000000000000000000) lt!438064) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!14514 (select (arr!9096 a1!948) (_3!1541 lt!438062)) (select (arr!9096 a1!948) (_4!584 lt!438062)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!438064))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!14514 lt!438063 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!14514 (select (arr!9096 a2!948) (_3!1541 lt!438062)) (select (arr!9096 a2!948) (_4!584 lt!438062)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!438064))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!14514 lt!438063 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26170 () Bool)

(assert (= bs!26170 d!101538))

(declare-fun m!442557 () Bool)

(assert (=> bs!26170 m!442557))

(declare-fun m!442559 () Bool)

(assert (=> bs!26170 m!442559))

(assert (=> bm!5618 d!101538))

(declare-fun d!101540 () Bool)

(assert (=> d!101540 (arrayRangesEq!1642 a1!948 a2!948 (_1!13239 lt!438065) (_2!13239 lt!438065))))

(declare-fun lt!438102 () Unit!21220)

(declare-fun choose!568 (array!18468 array!18468 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21220)

(assert (=> d!101540 (= lt!438102 (choose!568 a1!948 a2!948 (_1!13239 lt!438062) (_2!13239 lt!438062) (_1!13239 lt!438065) (_2!13239 lt!438065)))))

(assert (=> d!101540 (and (bvsle #b00000000000000000000000000000000 (_1!13239 lt!438062)) (bvsle (_1!13239 lt!438062) (_2!13239 lt!438062)))))

(assert (=> d!101540 (= (arrayRangesEqSlicedLemma!237 a1!948 a2!948 (_1!13239 lt!438062) (_2!13239 lt!438062) (_1!13239 lt!438065) (_2!13239 lt!438065)) lt!438102)))

(declare-fun bs!26171 () Bool)

(assert (= bs!26171 d!101540))

(assert (=> bs!26171 m!442473))

(declare-fun m!442561 () Bool)

(assert (=> bs!26171 m!442561))

(assert (=> b!303924 d!101540))

(declare-fun d!101542 () Bool)

(declare-fun res!250124 () Bool)

(declare-fun e!218805 () Bool)

(assert (=> d!101542 (=> res!250124 e!218805)))

(assert (=> d!101542 (= res!250124 (= (_1!13239 lt!438065) (_2!13239 lt!438065)))))

(assert (=> d!101542 (= (arrayRangesEq!1642 a1!948 a2!948 (_1!13239 lt!438065) (_2!13239 lt!438065)) e!218805)))

(declare-fun b!304008 () Bool)

(declare-fun e!218806 () Bool)

(assert (=> b!304008 (= e!218805 e!218806)))

(declare-fun res!250125 () Bool)

(assert (=> b!304008 (=> (not res!250125) (not e!218806))))

(assert (=> b!304008 (= res!250125 (= (select (arr!9096 a1!948) (_1!13239 lt!438065)) (select (arr!9096 a2!948) (_1!13239 lt!438065))))))

(declare-fun b!304009 () Bool)

(assert (=> b!304009 (= e!218806 (arrayRangesEq!1642 a1!948 a2!948 (bvadd (_1!13239 lt!438065) #b00000000000000000000000000000001) (_2!13239 lt!438065)))))

(assert (= (and d!101542 (not res!250124)) b!304008))

(assert (= (and b!304008 res!250125) b!304009))

(declare-fun m!442563 () Bool)

(assert (=> b!304008 m!442563))

(declare-fun m!442565 () Bool)

(assert (=> b!304008 m!442565))

(declare-fun m!442567 () Bool)

(assert (=> b!304009 m!442567))

(assert (=> b!303924 d!101542))

(declare-fun d!101544 () Bool)

(assert (=> d!101544 (= (array_inv!7625 a1!948) (bvsge (size!8013 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67708 d!101544))

(declare-fun d!101546 () Bool)

(assert (=> d!101546 (= (array_inv!7625 a2!948) (bvsge (size!8013 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67708 d!101546))

(declare-fun d!101548 () Bool)

(assert (=> d!101548 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1169 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!303927 d!101548))

(declare-fun d!101550 () Bool)

(assert (=> d!101550 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1169 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!303927 d!101550))

(push 1)

(assert (not b!303999))

(assert (not b!303998))

(assert (not b!304002))

(assert (not d!101540))

(assert (not b!304009))

(assert (not bm!5627))

(check-sat)

