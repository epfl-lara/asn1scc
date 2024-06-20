; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67478 () Bool)

(assert start!67478)

(declare-fun res!249391 () Bool)

(declare-fun e!217961 () Bool)

(assert (=> start!67478 (=> (not res!249391) (not e!217961))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18412 0))(
  ( (array!18413 (arr!9077 (Array (_ BitVec 32) (_ BitVec 8))) (size!7994 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18412)

(declare-fun a2!948 () array!18412)

(assert (=> start!67478 (= res!249391 (and (bvsle (size!7994 a1!948) (size!7994 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67478 e!217961))

(assert (=> start!67478 true))

(declare-fun array_inv!7606 (array!18412) Bool)

(assert (=> start!67478 (array_inv!7606 a1!948)))

(assert (=> start!67478 (array_inv!7606 a2!948)))

(declare-fun b!303014 () Bool)

(declare-datatypes ((Unit!21163 0))(
  ( (Unit!21164) )
))
(declare-fun e!217960 () Unit!21163)

(declare-fun lt!437546 () Unit!21163)

(assert (=> b!303014 (= e!217960 lt!437546)))

(declare-datatypes ((tuple4!1130 0))(
  ( (tuple4!1131 (_1!13220 (_ BitVec 32)) (_2!13220 (_ BitVec 32)) (_3!1522 (_ BitVec 32)) (_4!565 (_ BitVec 32))) )
))
(declare-fun lt!437547 () tuple4!1130)

(declare-fun lt!437544 () tuple4!1130)

(declare-fun arrayRangesEqSlicedLemma!218 (array!18412 array!18412 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21163)

(assert (=> b!303014 (= lt!437546 (arrayRangesEqSlicedLemma!218 a1!948 a2!948 (_1!13220 lt!437544) (_2!13220 lt!437544) (_1!13220 lt!437547) (_2!13220 lt!437547)))))

(declare-fun arrayRangesEq!1623 (array!18412 array!18412 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!303014 (arrayRangesEq!1623 a1!948 a2!948 (_1!13220 lt!437547) (_2!13220 lt!437547))))

(declare-fun b!303015 () Bool)

(declare-fun res!249392 () Bool)

(declare-fun e!217963 () Bool)

(assert (=> b!303015 (=> (not res!249392) (not e!217963))))

(declare-fun lt!437543 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!303015 (= res!249392 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!437543) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!303016 () Bool)

(assert (=> b!303016 (= e!217963 (and (= (_3!1522 lt!437544) (_4!565 lt!437544)) (or (bvslt (_3!1522 lt!437544) #b00000000000000000000000000000000) (bvsge (_3!1522 lt!437544) (size!7994 a1!948)))))))

(declare-fun lt!437545 () Unit!21163)

(assert (=> b!303016 (= lt!437545 e!217960)))

(declare-fun c!14394 () Bool)

(assert (=> b!303016 (= c!14394 (bvslt (_1!13220 lt!437547) (_2!13220 lt!437547)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1130)

(assert (=> b!303016 (= lt!437547 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!303016 (= lt!437544 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!303017 () Bool)

(assert (=> b!303017 (= e!217961 e!217963)))

(declare-fun res!249390 () Bool)

(assert (=> b!303017 (=> (not res!249390) (not e!217963))))

(assert (=> b!303017 (= res!249390 (and (bvsle toBit!258 lt!437543) (bvsle fromBit!258 lt!437543)))))

(assert (=> b!303017 (= lt!437543 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7994 a1!948))))))

(declare-fun b!303018 () Bool)

(declare-fun res!249393 () Bool)

(assert (=> b!303018 (=> (not res!249393) (not e!217963))))

(declare-fun arrayBitRangesEq!0 (array!18412 array!18412 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!303018 (= res!249393 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!303019 () Bool)

(declare-fun Unit!21165 () Unit!21163)

(assert (=> b!303019 (= e!217960 Unit!21165)))

(assert (= (and start!67478 res!249391) b!303017))

(assert (= (and b!303017 res!249390) b!303018))

(assert (= (and b!303018 res!249393) b!303015))

(assert (= (and b!303015 res!249392) b!303016))

(assert (= (and b!303016 c!14394) b!303014))

(assert (= (and b!303016 (not c!14394)) b!303019))

(declare-fun m!441707 () Bool)

(assert (=> start!67478 m!441707))

(declare-fun m!441709 () Bool)

(assert (=> start!67478 m!441709))

(declare-fun m!441711 () Bool)

(assert (=> b!303014 m!441711))

(declare-fun m!441713 () Bool)

(assert (=> b!303014 m!441713))

(declare-fun m!441715 () Bool)

(assert (=> b!303016 m!441715))

(declare-fun m!441717 () Bool)

(assert (=> b!303016 m!441717))

(declare-fun m!441719 () Bool)

(assert (=> b!303018 m!441719))

(check-sat (not b!303016) (not start!67478) (not b!303014) (not b!303018))
(check-sat)
(get-model)

(declare-fun d!101222 () Bool)

(assert (=> d!101222 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1131 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!303016 d!101222))

(declare-fun d!101224 () Bool)

(assert (=> d!101224 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1131 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!303016 d!101224))

(declare-fun d!101226 () Bool)

(assert (=> d!101226 (= (array_inv!7606 a1!948) (bvsge (size!7994 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67478 d!101226))

(declare-fun d!101228 () Bool)

(assert (=> d!101228 (= (array_inv!7606 a2!948) (bvsge (size!7994 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67478 d!101228))

(declare-fun d!101230 () Bool)

(assert (=> d!101230 (arrayRangesEq!1623 a1!948 a2!948 (_1!13220 lt!437547) (_2!13220 lt!437547))))

(declare-fun lt!437565 () Unit!21163)

(declare-fun choose!548 (array!18412 array!18412 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21163)

(assert (=> d!101230 (= lt!437565 (choose!548 a1!948 a2!948 (_1!13220 lt!437544) (_2!13220 lt!437544) (_1!13220 lt!437547) (_2!13220 lt!437547)))))

(assert (=> d!101230 (and (bvsle #b00000000000000000000000000000000 (_1!13220 lt!437544)) (bvsle (_1!13220 lt!437544) (_2!13220 lt!437544)))))

(assert (=> d!101230 (= (arrayRangesEqSlicedLemma!218 a1!948 a2!948 (_1!13220 lt!437544) (_2!13220 lt!437544) (_1!13220 lt!437547) (_2!13220 lt!437547)) lt!437565)))

(declare-fun bs!26121 () Bool)

(assert (= bs!26121 d!101230))

(assert (=> bs!26121 m!441713))

(declare-fun m!441735 () Bool)

(assert (=> bs!26121 m!441735))

(assert (=> b!303014 d!101230))

(declare-fun d!101232 () Bool)

(declare-fun res!249410 () Bool)

(declare-fun e!217983 () Bool)

(assert (=> d!101232 (=> res!249410 e!217983)))

(assert (=> d!101232 (= res!249410 (= (_1!13220 lt!437547) (_2!13220 lt!437547)))))

(assert (=> d!101232 (= (arrayRangesEq!1623 a1!948 a2!948 (_1!13220 lt!437547) (_2!13220 lt!437547)) e!217983)))

(declare-fun b!303042 () Bool)

(declare-fun e!217984 () Bool)

(assert (=> b!303042 (= e!217983 e!217984)))

(declare-fun res!249411 () Bool)

(assert (=> b!303042 (=> (not res!249411) (not e!217984))))

(assert (=> b!303042 (= res!249411 (= (select (arr!9077 a1!948) (_1!13220 lt!437547)) (select (arr!9077 a2!948) (_1!13220 lt!437547))))))

(declare-fun b!303043 () Bool)

(assert (=> b!303043 (= e!217984 (arrayRangesEq!1623 a1!948 a2!948 (bvadd (_1!13220 lt!437547) #b00000000000000000000000000000001) (_2!13220 lt!437547)))))

(assert (= (and d!101232 (not res!249410)) b!303042))

(assert (= (and b!303042 res!249411) b!303043))

(declare-fun m!441737 () Bool)

(assert (=> b!303042 m!441737))

(declare-fun m!441739 () Bool)

(assert (=> b!303042 m!441739))

(declare-fun m!441741 () Bool)

(assert (=> b!303043 m!441741))

(assert (=> b!303014 d!101232))

(declare-fun lt!437577 () tuple4!1130)

(declare-fun b!303064 () Bool)

(declare-fun e!218005 () Bool)

(assert (=> b!303064 (= e!218005 (arrayRangesEq!1623 a1!948 a2!948 (_1!13220 lt!437577) (_2!13220 lt!437577)))))

(declare-fun b!303065 () Bool)

(declare-fun e!218003 () Bool)

(declare-fun e!218004 () Bool)

(assert (=> b!303065 (= e!218003 e!218004)))

(declare-fun res!249429 () Bool)

(declare-fun call!5561 () Bool)

(assert (=> b!303065 (= res!249429 call!5561)))

(assert (=> b!303065 (=> (not res!249429) (not e!218004))))

(declare-fun e!218006 () Bool)

(declare-fun lt!437576 () (_ BitVec 32))

(declare-fun b!303066 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!303066 (= e!218006 (byteRangesEq!0 (select (arr!9077 a1!948) (_4!565 lt!437577)) (select (arr!9077 a2!948) (_4!565 lt!437577)) #b00000000000000000000000000000000 lt!437576))))

(declare-fun b!303067 () Bool)

(declare-fun e!218008 () Bool)

(assert (=> b!303067 (= e!218008 e!218003)))

(declare-fun c!14400 () Bool)

(assert (=> b!303067 (= c!14400 (= (_3!1522 lt!437577) (_4!565 lt!437577)))))

(declare-fun d!101234 () Bool)

(declare-fun res!249431 () Bool)

(declare-fun e!218007 () Bool)

(assert (=> d!101234 (=> res!249431 e!218007)))

(assert (=> d!101234 (= res!249431 (bvsge fromBit!258 toBit!258))))

(assert (=> d!101234 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!218007)))

(declare-fun b!303068 () Bool)

(declare-fun res!249432 () Bool)

(assert (=> b!303068 (= res!249432 (= lt!437576 #b00000000000000000000000000000000))))

(assert (=> b!303068 (=> res!249432 e!218006)))

(assert (=> b!303068 (= e!218004 e!218006)))

(declare-fun b!303069 () Bool)

(assert (=> b!303069 (= e!218003 call!5561)))

(declare-fun b!303070 () Bool)

(assert (=> b!303070 (= e!218007 e!218008)))

(declare-fun res!249428 () Bool)

(assert (=> b!303070 (=> (not res!249428) (not e!218008))))

(assert (=> b!303070 (= res!249428 e!218005)))

(declare-fun res!249430 () Bool)

(assert (=> b!303070 (=> res!249430 e!218005)))

(assert (=> b!303070 (= res!249430 (bvsge (_1!13220 lt!437577) (_2!13220 lt!437577)))))

(assert (=> b!303070 (= lt!437576 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!437575 () (_ BitVec 32))

(assert (=> b!303070 (= lt!437575 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!303070 (= lt!437577 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun bm!5558 () Bool)

(assert (=> bm!5558 (= call!5561 (byteRangesEq!0 (select (arr!9077 a1!948) (_3!1522 lt!437577)) (select (arr!9077 a2!948) (_3!1522 lt!437577)) lt!437575 (ite c!14400 lt!437576 #b00000000000000000000000000001000)))))

(assert (= (and d!101234 (not res!249431)) b!303070))

(assert (= (and b!303070 (not res!249430)) b!303064))

(assert (= (and b!303070 res!249428) b!303067))

(assert (= (and b!303067 c!14400) b!303069))

(assert (= (and b!303067 (not c!14400)) b!303065))

(assert (= (and b!303065 res!249429) b!303068))

(assert (= (and b!303068 (not res!249432)) b!303066))

(assert (= (or b!303069 b!303065) bm!5558))

(declare-fun m!441751 () Bool)

(assert (=> b!303064 m!441751))

(declare-fun m!441753 () Bool)

(assert (=> b!303066 m!441753))

(declare-fun m!441755 () Bool)

(assert (=> b!303066 m!441755))

(assert (=> b!303066 m!441753))

(assert (=> b!303066 m!441755))

(declare-fun m!441757 () Bool)

(assert (=> b!303066 m!441757))

(assert (=> b!303070 m!441717))

(declare-fun m!441759 () Bool)

(assert (=> bm!5558 m!441759))

(declare-fun m!441761 () Bool)

(assert (=> bm!5558 m!441761))

(assert (=> bm!5558 m!441759))

(assert (=> bm!5558 m!441761))

(declare-fun m!441763 () Bool)

(assert (=> bm!5558 m!441763))

(assert (=> b!303018 d!101234))

(check-sat (not d!101230) (not b!303070) (not b!303043) (not b!303064) (not b!303066) (not bm!5558))
(check-sat)
