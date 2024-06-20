; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68316 () Bool)

(assert start!68316)

(declare-fun b!306696 () Bool)

(declare-datatypes ((Unit!21394 0))(
  ( (Unit!21395) )
))
(declare-fun e!220981 () Unit!21394)

(declare-fun lt!439801 () Unit!21394)

(assert (=> b!306696 (= e!220981 lt!439801)))

(declare-datatypes ((array!18593 0))(
  ( (array!18594 (arr!9139 (Array (_ BitVec 32) (_ BitVec 8))) (size!8056 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18593)

(declare-fun a2!948 () array!18593)

(declare-datatypes ((tuple4!1254 0))(
  ( (tuple4!1255 (_1!13282 (_ BitVec 32)) (_2!13282 (_ BitVec 32)) (_3!1584 (_ BitVec 32)) (_4!627 (_ BitVec 32))) )
))
(declare-fun lt!439799 () tuple4!1254)

(declare-fun lt!439804 () tuple4!1254)

(declare-fun arrayRangesEqSlicedLemma!280 (array!18593 array!18593 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21394)

(assert (=> b!306696 (= lt!439801 (arrayRangesEqSlicedLemma!280 a1!948 a2!948 (_1!13282 lt!439804) (_2!13282 lt!439804) (_1!13282 lt!439799) (_2!13282 lt!439799)))))

(declare-fun arrayRangesEq!1685 (array!18593 array!18593 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!306696 (arrayRangesEq!1685 a1!948 a2!948 (_1!13282 lt!439799) (_2!13282 lt!439799))))

(declare-fun b!306698 () Bool)

(declare-fun e!220986 () Unit!21394)

(declare-fun lt!439798 () Unit!21394)

(assert (=> b!306698 (= e!220986 lt!439798)))

(declare-fun arrayRangesEqImpliesEq!289 (array!18593 array!18593 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21394)

(assert (=> b!306698 (= lt!439798 (arrayRangesEqImpliesEq!289 a1!948 a2!948 (_1!13282 lt!439804) (_4!627 lt!439799) (_2!13282 lt!439804)))))

(assert (=> b!306698 (= (select (arr!9139 a1!948) (_4!627 lt!439799)) (select (arr!9139 a2!948) (_4!627 lt!439799)))))

(declare-fun b!306699 () Bool)

(declare-fun e!220976 () Bool)

(declare-fun e!220985 () Bool)

(assert (=> b!306699 (= e!220976 e!220985)))

(declare-fun res!251820 () Bool)

(declare-fun call!5861 () Bool)

(assert (=> b!306699 (= res!251820 call!5861)))

(assert (=> b!306699 (=> (not res!251820) (not e!220985))))

(declare-fun b!306700 () Bool)

(declare-fun e!220982 () Bool)

(declare-fun e!220983 () Bool)

(assert (=> b!306700 (= e!220982 e!220983)))

(declare-fun res!251826 () Bool)

(assert (=> b!306700 (=> (not res!251826) (not e!220983))))

(assert (=> b!306700 (= res!251826 (not (= (_3!1584 lt!439799) (_4!627 lt!439799))))))

(declare-fun lt!439800 () Unit!21394)

(assert (=> b!306700 (= lt!439800 e!220986)))

(declare-fun c!15024 () Bool)

(assert (=> b!306700 (= c!15024 (and (bvslt (_4!627 lt!439799) (_4!627 lt!439804)) (bvslt (_3!1584 lt!439804) (_4!627 lt!439799))))))

(declare-fun lt!439805 () Unit!21394)

(declare-fun e!220979 () Unit!21394)

(assert (=> b!306700 (= lt!439805 e!220979)))

(declare-fun c!15021 () Bool)

(assert (=> b!306700 (= c!15021 (and (bvslt (_3!1584 lt!439804) (_3!1584 lt!439799)) (bvslt (_3!1584 lt!439799) (_4!627 lt!439804))))))

(declare-fun b!306701 () Bool)

(declare-fun Unit!21396 () Unit!21394)

(assert (=> b!306701 (= e!220986 Unit!21396)))

(declare-fun b!306702 () Bool)

(declare-fun res!251819 () Bool)

(declare-fun e!220987 () Bool)

(assert (=> b!306702 (=> (not res!251819) (not e!220987))))

(declare-fun lt!439803 () (_ BitVec 64))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!306702 (= res!251819 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!439803) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!306703 () Bool)

(declare-fun res!251818 () Bool)

(declare-fun lt!439806 () (_ BitVec 32))

(assert (=> b!306703 (= res!251818 (= lt!439806 #b00000000000000000000000000000000))))

(declare-fun e!220977 () Bool)

(assert (=> b!306703 (=> res!251818 e!220977)))

(assert (=> b!306703 (= e!220985 e!220977)))

(declare-fun b!306704 () Bool)

(assert (=> b!306704 (= e!220976 call!5861)))

(declare-fun lt!439797 () (_ BitVec 32))

(declare-fun bm!5858 () Bool)

(declare-fun c!15022 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5858 (= call!5861 (byteRangesEq!0 (select (arr!9139 a1!948) (_3!1584 lt!439804)) (select (arr!9139 a2!948) (_3!1584 lt!439804)) lt!439797 (ite c!15022 lt!439806 #b00000000000000000000000000000111)))))

(declare-fun res!251823 () Bool)

(declare-fun e!220980 () Bool)

(assert (=> start!68316 (=> (not res!251823) (not e!220980))))

(assert (=> start!68316 (= res!251823 (and (bvsle (size!8056 a1!948) (size!8056 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!68316 e!220980))

(assert (=> start!68316 true))

(declare-fun array_inv!7668 (array!18593) Bool)

(assert (=> start!68316 (array_inv!7668 a1!948)))

(assert (=> start!68316 (array_inv!7668 a2!948)))

(declare-fun b!306697 () Bool)

(assert (=> b!306697 (= e!220987 e!220982)))

(declare-fun res!251825 () Bool)

(assert (=> b!306697 (=> (not res!251825) (not e!220982))))

(assert (=> b!306697 (= res!251825 e!220976)))

(assert (=> b!306697 (= c!15022 (= (_3!1584 lt!439804) (_4!627 lt!439804)))))

(declare-fun lt!439802 () Unit!21394)

(assert (=> b!306697 (= lt!439802 e!220981)))

(declare-fun c!15023 () Bool)

(assert (=> b!306697 (= c!15023 (bvslt (_1!13282 lt!439799) (_2!13282 lt!439799)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1254)

(assert (=> b!306697 (= lt!439799 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!306697 (= lt!439806 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!306697 (= lt!439797 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!306697 (= lt!439804 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!306705 () Bool)

(assert (=> b!306705 (= e!220977 (byteRangesEq!0 (select (arr!9139 a1!948) (_4!627 lt!439804)) (select (arr!9139 a2!948) (_4!627 lt!439804)) #b00000000000000000000000000000000 lt!439806))))

(declare-fun b!306706 () Bool)

(assert (=> b!306706 (= e!220980 e!220987)))

(declare-fun res!251824 () Bool)

(assert (=> b!306706 (=> (not res!251824) (not e!220987))))

(assert (=> b!306706 (= res!251824 (and (bvsle toBit!258 lt!439803) (bvsle fromBit!258 lt!439803)))))

(assert (=> b!306706 (= lt!439803 (bvmul ((_ sign_extend 32) (size!8056 a1!948)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!306707 () Bool)

(declare-fun res!251821 () Bool)

(assert (=> b!306707 (=> (not res!251821) (not e!220983))))

(assert (=> b!306707 (= res!251821 (byteRangesEq!0 (select (arr!9139 a1!948) (_3!1584 lt!439799)) (select (arr!9139 a2!948) (_3!1584 lt!439799)) ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111))))

(declare-fun b!306708 () Bool)

(declare-fun lt!439796 () Unit!21394)

(assert (=> b!306708 (= e!220979 lt!439796)))

(assert (=> b!306708 (= lt!439796 (arrayRangesEqImpliesEq!289 a1!948 a2!948 (_1!13282 lt!439804) (_3!1584 lt!439799) (_2!13282 lt!439804)))))

(assert (=> b!306708 (= (select (arr!9139 a1!948) (_3!1584 lt!439799)) (select (arr!9139 a2!948) (_3!1584 lt!439799)))))

(declare-fun b!306709 () Bool)

(declare-fun Unit!21397 () Unit!21394)

(assert (=> b!306709 (= e!220981 Unit!21397)))

(declare-fun b!306710 () Bool)

(declare-fun Unit!21398 () Unit!21394)

(assert (=> b!306710 (= e!220979 Unit!21398)))

(declare-fun b!306711 () Bool)

(declare-fun res!251822 () Bool)

(assert (=> b!306711 (=> (not res!251822) (not e!220987))))

(declare-fun arrayBitRangesEq!0 (array!18593 array!18593 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!306711 (= res!251822 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!306712 () Bool)

(assert (=> b!306712 (= e!220983 (and (not (= ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000)) (or (bvslt (_4!627 lt!439799) #b00000000000000000000000000000000) (bvsge (_4!627 lt!439799) (size!8056 a1!948)))))))

(assert (= (and start!68316 res!251823) b!306706))

(assert (= (and b!306706 res!251824) b!306711))

(assert (= (and b!306711 res!251822) b!306702))

(assert (= (and b!306702 res!251819) b!306697))

(assert (= (and b!306697 c!15023) b!306696))

(assert (= (and b!306697 (not c!15023)) b!306709))

(assert (= (and b!306697 c!15022) b!306704))

(assert (= (and b!306697 (not c!15022)) b!306699))

(assert (= (and b!306699 res!251820) b!306703))

(assert (= (and b!306703 (not res!251818)) b!306705))

(assert (= (or b!306704 b!306699) bm!5858))

(assert (= (and b!306697 res!251825) b!306700))

(assert (= (and b!306700 c!15021) b!306708))

(assert (= (and b!306700 (not c!15021)) b!306710))

(assert (= (and b!306700 c!15024) b!306698))

(assert (= (and b!306700 (not c!15024)) b!306701))

(assert (= (and b!306700 res!251826) b!306707))

(assert (= (and b!306707 res!251821) b!306712))

(declare-fun m!445173 () Bool)

(assert (=> b!306705 m!445173))

(declare-fun m!445175 () Bool)

(assert (=> b!306705 m!445175))

(assert (=> b!306705 m!445173))

(assert (=> b!306705 m!445175))

(declare-fun m!445177 () Bool)

(assert (=> b!306705 m!445177))

(declare-fun m!445179 () Bool)

(assert (=> start!68316 m!445179))

(declare-fun m!445181 () Bool)

(assert (=> start!68316 m!445181))

(declare-fun m!445183 () Bool)

(assert (=> b!306707 m!445183))

(declare-fun m!445185 () Bool)

(assert (=> b!306707 m!445185))

(assert (=> b!306707 m!445183))

(assert (=> b!306707 m!445185))

(declare-fun m!445187 () Bool)

(assert (=> b!306707 m!445187))

(declare-fun m!445189 () Bool)

(assert (=> b!306711 m!445189))

(declare-fun m!445191 () Bool)

(assert (=> b!306698 m!445191))

(declare-fun m!445193 () Bool)

(assert (=> b!306698 m!445193))

(declare-fun m!445195 () Bool)

(assert (=> b!306698 m!445195))

(declare-fun m!445197 () Bool)

(assert (=> bm!5858 m!445197))

(declare-fun m!445199 () Bool)

(assert (=> bm!5858 m!445199))

(assert (=> bm!5858 m!445197))

(assert (=> bm!5858 m!445199))

(declare-fun m!445201 () Bool)

(assert (=> bm!5858 m!445201))

(declare-fun m!445203 () Bool)

(assert (=> b!306697 m!445203))

(declare-fun m!445205 () Bool)

(assert (=> b!306697 m!445205))

(declare-fun m!445207 () Bool)

(assert (=> b!306708 m!445207))

(assert (=> b!306708 m!445183))

(assert (=> b!306708 m!445185))

(declare-fun m!445209 () Bool)

(assert (=> b!306696 m!445209))

(declare-fun m!445211 () Bool)

(assert (=> b!306696 m!445211))

(push 1)

(assert (not b!306711))

(assert (not b!306696))

(assert (not b!306708))

(assert (not b!306698))

(assert (not b!306705))

(assert (not b!306707))

(assert (not bm!5858))

(assert (not b!306697))

(assert (not start!68316))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!102362 () Bool)

(assert (=> d!102362 (= (byteRangesEq!0 (select (arr!9139 a1!948) (_3!1584 lt!439799)) (select (arr!9139 a2!948) (_3!1584 lt!439799)) ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111) (or (= ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9139 a1!948) (_3!1584 lt!439799))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9139 a2!948) (_3!1584 lt!439799))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26376 () Bool)

(assert (= bs!26376 d!102362))

(declare-fun m!445329 () Bool)

(assert (=> bs!26376 m!445329))

(declare-fun m!445331 () Bool)

(assert (=> bs!26376 m!445331))

(assert (=> b!306707 d!102362))

(declare-fun d!102364 () Bool)

(assert (=> d!102364 (= (array_inv!7668 a1!948) (bvsge (size!8056 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!68316 d!102364))

(declare-fun d!102366 () Bool)

(assert (=> d!102366 (= (array_inv!7668 a2!948) (bvsge (size!8056 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!68316 d!102366))

(declare-fun d!102368 () Bool)

(assert (=> d!102368 (and (bvsge (_4!627 lt!439799) #b00000000000000000000000000000000) (bvslt (_4!627 lt!439799) (size!8056 a1!948)) (bvslt (_4!627 lt!439799) (size!8056 a2!948)) (= (select (arr!9139 a1!948) (_4!627 lt!439799)) (select (arr!9139 a2!948) (_4!627 lt!439799))))))

(declare-fun lt!439891 () Unit!21394)

(declare-fun choose!634 (array!18593 array!18593 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21394)

(assert (=> d!102368 (= lt!439891 (choose!634 a1!948 a2!948 (_1!13282 lt!439804) (_4!627 lt!439799) (_2!13282 lt!439804)))))

(assert (=> d!102368 (and (bvsle #b00000000000000000000000000000000 (_1!13282 lt!439804)) (bvsle (_1!13282 lt!439804) (_2!13282 lt!439804)))))

(assert (=> d!102368 (= (arrayRangesEqImpliesEq!289 a1!948 a2!948 (_1!13282 lt!439804) (_4!627 lt!439799) (_2!13282 lt!439804)) lt!439891)))

(declare-fun bs!26377 () Bool)

(assert (= bs!26377 d!102368))

(assert (=> bs!26377 m!445193))

(assert (=> bs!26377 m!445195))

(declare-fun m!445333 () Bool)

(assert (=> bs!26377 m!445333))

(assert (=> b!306698 d!102368))

(declare-fun d!102370 () Bool)

(assert (=> d!102370 (and (bvsge (_3!1584 lt!439799) #b00000000000000000000000000000000) (bvslt (_3!1584 lt!439799) (size!8056 a1!948)) (bvslt (_3!1584 lt!439799) (size!8056 a2!948)) (= (select (arr!9139 a1!948) (_3!1584 lt!439799)) (select (arr!9139 a2!948) (_3!1584 lt!439799))))))

(declare-fun lt!439892 () Unit!21394)

(assert (=> d!102370 (= lt!439892 (choose!634 a1!948 a2!948 (_1!13282 lt!439804) (_3!1584 lt!439799) (_2!13282 lt!439804)))))

(assert (=> d!102370 (and (bvsle #b00000000000000000000000000000000 (_1!13282 lt!439804)) (bvsle (_1!13282 lt!439804) (_2!13282 lt!439804)))))

(assert (=> d!102370 (= (arrayRangesEqImpliesEq!289 a1!948 a2!948 (_1!13282 lt!439804) (_3!1584 lt!439799) (_2!13282 lt!439804)) lt!439892)))

(declare-fun bs!26378 () Bool)

(assert (= bs!26378 d!102370))

(assert (=> bs!26378 m!445183))

(assert (=> bs!26378 m!445185))

(declare-fun m!445335 () Bool)

(assert (=> bs!26378 m!445335))

(assert (=> b!306708 d!102370))

(declare-fun d!102372 () Bool)

(assert (=> d!102372 (= (byteRangesEq!0 (select (arr!9139 a1!948) (_3!1584 lt!439804)) (select (arr!9139 a2!948) (_3!1584 lt!439804)) lt!439797 (ite c!15022 lt!439806 #b00000000000000000000000000000111)) (or (= lt!439797 (ite c!15022 lt!439806 #b00000000000000000000000000000111)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9139 a1!948) (_3!1584 lt!439804))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!15022 lt!439806 #b00000000000000000000000000000111)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!439797)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9139 a2!948) (_3!1584 lt!439804))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!15022 lt!439806 #b00000000000000000000000000000111)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!439797)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26379 () Bool)

(assert (= bs!26379 d!102372))

(declare-fun m!445337 () Bool)

(assert (=> bs!26379 m!445337))

(declare-fun m!445339 () Bool)

(assert (=> bs!26379 m!445339))

(assert (=> bm!5858 d!102372))

(declare-fun d!102374 () Bool)

(assert (=> d!102374 (= (byteRangesEq!0 (select (arr!9139 a1!948) (_4!627 lt!439804)) (select (arr!9139 a2!948) (_4!627 lt!439804)) #b00000000000000000000000000000000 lt!439806) (or (= #b00000000000000000000000000000000 lt!439806) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9139 a1!948) (_4!627 lt!439804))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!439806))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9139 a2!948) (_4!627 lt!439804))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!439806))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26380 () Bool)

(assert (= bs!26380 d!102374))

(declare-fun m!445341 () Bool)

(assert (=> bs!26380 m!445341))

(declare-fun m!445343 () Bool)

(assert (=> bs!26380 m!445343))

(assert (=> b!306705 d!102374))

(declare-fun d!102376 () Bool)

(assert (=> d!102376 (arrayRangesEq!1685 a1!948 a2!948 (_1!13282 lt!439799) (_2!13282 lt!439799))))

(declare-fun lt!439895 () Unit!21394)

(declare-fun choose!636 (array!18593 array!18593 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21394)

(assert (=> d!102376 (= lt!439895 (choose!636 a1!948 a2!948 (_1!13282 lt!439804) (_2!13282 lt!439804) (_1!13282 lt!439799) (_2!13282 lt!439799)))))

(assert (=> d!102376 (and (bvsle #b00000000000000000000000000000000 (_1!13282 lt!439804)) (bvsle (_1!13282 lt!439804) (_2!13282 lt!439804)))))

(assert (=> d!102376 (= (arrayRangesEqSlicedLemma!280 a1!948 a2!948 (_1!13282 lt!439804) (_2!13282 lt!439804) (_1!13282 lt!439799) (_2!13282 lt!439799)) lt!439895)))

(declare-fun bs!26381 () Bool)

(assert (= bs!26381 d!102376))

(assert (=> bs!26381 m!445211))

(declare-fun m!445345 () Bool)

(assert (=> bs!26381 m!445345))

(assert (=> b!306696 d!102376))

(declare-fun d!102380 () Bool)

(declare-fun res!251906 () Bool)

(declare-fun e!221088 () Bool)

(assert (=> d!102380 (=> res!251906 e!221088)))

(assert (=> d!102380 (= res!251906 (= (_1!13282 lt!439799) (_2!13282 lt!439799)))))

(assert (=> d!102380 (= (arrayRangesEq!1685 a1!948 a2!948 (_1!13282 lt!439799) (_2!13282 lt!439799)) e!221088)))

(declare-fun b!306846 () Bool)

(declare-fun e!221089 () Bool)

(assert (=> b!306846 (= e!221088 e!221089)))

(declare-fun res!251907 () Bool)

(assert (=> b!306846 (=> (not res!251907) (not e!221089))))

(assert (=> b!306846 (= res!251907 (= (select (arr!9139 a1!948) (_1!13282 lt!439799)) (select (arr!9139 a2!948) (_1!13282 lt!439799))))))

(declare-fun b!306847 () Bool)

(assert (=> b!306847 (= e!221089 (arrayRangesEq!1685 a1!948 a2!948 (bvadd (_1!13282 lt!439799) #b00000000000000000000000000000001) (_2!13282 lt!439799)))))

(assert (= (and d!102380 (not res!251906)) b!306846))

(assert (= (and b!306846 res!251907) b!306847))

(declare-fun m!445347 () Bool)

(assert (=> b!306846 m!445347))

(declare-fun m!445349 () Bool)

(assert (=> b!306846 m!445349))

(declare-fun m!445351 () Bool)

(assert (=> b!306847 m!445351))

(assert (=> b!306696 d!102380))

(declare-fun lt!439911 () tuple4!1254)

(declare-fun b!306868 () Bool)

(declare-fun e!221109 () Bool)

(assert (=> b!306868 (= e!221109 (arrayRangesEq!1685 a1!948 a2!948 (_1!13282 lt!439911) (_2!13282 lt!439911)))))

(declare-fun d!102382 () Bool)

(declare-fun res!251925 () Bool)

(declare-fun e!221110 () Bool)

(assert (=> d!102382 (=> res!251925 e!221110)))

(assert (=> d!102382 (= res!251925 (bvsge fromBit!258 toBit!258))))

(assert (=> d!102382 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!221110)))

(declare-fun b!306869 () Bool)

(declare-fun e!221108 () Bool)

(declare-fun call!5873 () Bool)

(assert (=> b!306869 (= e!221108 call!5873)))

(declare-fun b!306870 () Bool)

(declare-fun e!221111 () Bool)

(assert (=> b!306870 (= e!221111 e!221108)))

(declare-fun c!15054 () Bool)

(assert (=> b!306870 (= c!15054 (= (_3!1584 lt!439911) (_4!627 lt!439911)))))

(declare-fun b!306871 () Bool)

(declare-fun e!221113 () Bool)

(assert (=> b!306871 (= e!221108 e!221113)))

(declare-fun res!251926 () Bool)

(declare-fun lt!439909 () (_ BitVec 32))

(assert (=> b!306871 (= res!251926 (byteRangesEq!0 (select (arr!9139 a1!948) (_3!1584 lt!439911)) (select (arr!9139 a2!948) (_3!1584 lt!439911)) lt!439909 #b00000000000000000000000000001000))))

(assert (=> b!306871 (=> (not res!251926) (not e!221113))))

(declare-fun b!306872 () Bool)

(declare-fun res!251928 () Bool)

(declare-fun lt!439910 () (_ BitVec 32))

(assert (=> b!306872 (= res!251928 (= lt!439910 #b00000000000000000000000000000000))))

(declare-fun e!221112 () Bool)

(assert (=> b!306872 (=> res!251928 e!221112)))

(assert (=> b!306872 (= e!221113 e!221112)))

(declare-fun b!306873 () Bool)

(assert (=> b!306873 (= e!221110 e!221111)))

(declare-fun res!251924 () Bool)

(assert (=> b!306873 (=> (not res!251924) (not e!221111))))

(assert (=> b!306873 (= res!251924 e!221109)))

(declare-fun res!251927 () Bool)

(assert (=> b!306873 (=> res!251927 e!221109)))

(assert (=> b!306873 (= res!251927 (bvsge (_1!13282 lt!439911) (_2!13282 lt!439911)))))

(assert (=> b!306873 (= lt!439910 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!306873 (= lt!439909 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!306873 (= lt!439911 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun bm!5870 () Bool)

(assert (=> bm!5870 (= call!5873 (byteRangesEq!0 (ite c!15054 (select (arr!9139 a1!948) (_3!1584 lt!439911)) (select (arr!9139 a1!948) (_4!627 lt!439911))) (ite c!15054 (select (arr!9139 a2!948) (_3!1584 lt!439911)) (select (arr!9139 a2!948) (_4!627 lt!439911))) (ite c!15054 lt!439909 #b00000000000000000000000000000000) lt!439910))))

(declare-fun b!306874 () Bool)

(assert (=> b!306874 (= e!221112 call!5873)))

(assert (= (and d!102382 (not res!251925)) b!306873))

(assert (= (and b!306873 (not res!251927)) b!306868))

(assert (= (and b!306873 res!251924) b!306870))

(assert (= (and b!306870 c!15054) b!306869))

(assert (= (and b!306870 (not c!15054)) b!306871))

(assert (= (and b!306871 res!251926) b!306872))

(assert (= (and b!306872 (not res!251928)) b!306874))

(assert (= (or b!306869 b!306874) bm!5870))

(declare-fun m!445375 () Bool)

(assert (=> b!306868 m!445375))

(declare-fun m!445377 () Bool)

(assert (=> b!306871 m!445377))

(declare-fun m!445379 () Bool)

(assert (=> b!306871 m!445379))

(assert (=> b!306871 m!445377))

(assert (=> b!306871 m!445379))

(declare-fun m!445381 () Bool)

(assert (=> b!306871 m!445381))

(assert (=> b!306873 m!445205))

(assert (=> bm!5870 m!445377))

(declare-fun m!445383 () Bool)

(assert (=> bm!5870 m!445383))

(declare-fun m!445385 () Bool)

(assert (=> bm!5870 m!445385))

(assert (=> bm!5870 m!445379))

(declare-fun m!445387 () Bool)

(assert (=> bm!5870 m!445387))

(assert (=> b!306711 d!102382))

(declare-fun d!102406 () Bool)

(assert (=> d!102406 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1255 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!306697 d!102406))

(declare-fun d!102408 () Bool)

(assert (=> d!102408 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1255 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!306697 d!102408))

(push 1)

(assert (not b!306873))

(assert (not d!102368))

(assert (not b!306868))

(assert (not bm!5870))

(assert (not d!102376))

(assert (not b!306871))

(assert (not b!306847))

(assert (not d!102370))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

