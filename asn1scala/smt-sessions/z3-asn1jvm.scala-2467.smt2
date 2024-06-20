; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62672 () Bool)

(assert start!62672)

(declare-fun b!280709 () Bool)

(declare-datatypes ((Unit!19693 0))(
  ( (Unit!19694) )
))
(declare-fun e!200313 () Unit!19693)

(declare-fun Unit!19695 () Unit!19693)

(assert (=> b!280709 (= e!200313 Unit!19695)))

(declare-datatypes ((array!16212 0))(
  ( (array!16213 (arr!8003 (Array (_ BitVec 32) (_ BitVec 8))) (size!7007 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16212)

(declare-fun a2!699 () array!16212)

(declare-datatypes ((tuple4!764 0))(
  ( (tuple4!765 (_1!12457 (_ BitVec 32)) (_2!12457 (_ BitVec 32)) (_3!1162 (_ BitVec 32)) (_4!382 (_ BitVec 32))) )
))
(declare-fun lt!416980 () tuple4!764)

(declare-fun arrayRangesEq!1275 (array!16212 array!16212 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!280709 (arrayRangesEq!1275 a1!699 a2!699 (_1!12457 lt!416980) (_2!12457 lt!416980))))

(declare-fun lt!416981 () Unit!19693)

(declare-fun arrayRangesEqSymmetricLemma!182 (array!16212 array!16212 (_ BitVec 32) (_ BitVec 32)) Unit!19693)

(assert (=> b!280709 (= lt!416981 (arrayRangesEqSymmetricLemma!182 a1!699 a2!699 (_1!12457 lt!416980) (_2!12457 lt!416980)))))

(assert (=> b!280709 (arrayRangesEq!1275 a2!699 a1!699 (_1!12457 lt!416980) (_2!12457 lt!416980))))

(declare-fun b!280710 () Bool)

(declare-fun res!232965 () Bool)

(declare-fun e!200312 () Bool)

(assert (=> b!280710 (=> (not res!232965) (not e!200312))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!280710 (= res!232965 (bvslt from!822 to!789))))

(declare-fun b!280711 () Bool)

(declare-fun e!200314 () Bool)

(assert (=> b!280711 (= e!200314 (not (and (bvsge (_3!1162 lt!416980) #b00000000000000000000000000000000) (bvslt (_3!1162 lt!416980) (size!7007 a1!699)))))))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!280711 (byteRangesEq!0 (select (arr!8003 a1!699) (_3!1162 lt!416980)) (select (arr!8003 a2!699) (_3!1162 lt!416980)) ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000)))

(declare-fun b!280712 () Bool)

(declare-fun res!232966 () Bool)

(assert (=> b!280712 (=> (not res!232966) (not e!200312))))

(declare-fun arrayBitRangesEq!0 (array!16212 array!16212 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!280712 (= res!232966 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun res!232964 () Bool)

(assert (=> start!62672 (=> (not res!232964) (not e!200312))))

(assert (=> start!62672 (= res!232964 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!7007 a1!699) (size!7007 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7007 a1!699))))))))

(assert (=> start!62672 e!200312))

(assert (=> start!62672 true))

(declare-fun array_inv!6731 (array!16212) Bool)

(assert (=> start!62672 (array_inv!6731 a1!699)))

(assert (=> start!62672 (array_inv!6731 a2!699)))

(declare-fun b!280713 () Bool)

(assert (=> b!280713 (= e!200312 e!200314)))

(declare-fun res!232967 () Bool)

(assert (=> b!280713 (=> (not res!232967) (not e!200314))))

(assert (=> b!280713 (= res!232967 (not (= (_3!1162 lt!416980) (_4!382 lt!416980))))))

(declare-fun lt!416982 () Unit!19693)

(assert (=> b!280713 (= lt!416982 e!200313)))

(declare-fun c!13044 () Bool)

(assert (=> b!280713 (= c!13044 (bvslt (_1!12457 lt!416980) (_2!12457 lt!416980)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!764)

(assert (=> b!280713 (= lt!416980 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!280714 () Bool)

(declare-fun Unit!19696 () Unit!19693)

(assert (=> b!280714 (= e!200313 Unit!19696)))

(assert (= (and start!62672 res!232964) b!280712))

(assert (= (and b!280712 res!232966) b!280710))

(assert (= (and b!280710 res!232965) b!280713))

(assert (= (and b!280713 c!13044) b!280709))

(assert (= (and b!280713 (not c!13044)) b!280714))

(assert (= (and b!280713 res!232967) b!280711))

(declare-fun m!413723 () Bool)

(assert (=> b!280711 m!413723))

(declare-fun m!413725 () Bool)

(assert (=> b!280711 m!413725))

(assert (=> b!280711 m!413723))

(assert (=> b!280711 m!413725))

(declare-fun m!413727 () Bool)

(assert (=> b!280711 m!413727))

(declare-fun m!413729 () Bool)

(assert (=> b!280713 m!413729))

(declare-fun m!413731 () Bool)

(assert (=> start!62672 m!413731))

(declare-fun m!413733 () Bool)

(assert (=> start!62672 m!413733))

(declare-fun m!413735 () Bool)

(assert (=> b!280709 m!413735))

(declare-fun m!413737 () Bool)

(assert (=> b!280709 m!413737))

(declare-fun m!413739 () Bool)

(assert (=> b!280709 m!413739))

(declare-fun m!413741 () Bool)

(assert (=> b!280712 m!413741))

(check-sat (not b!280713) (not b!280712) (not b!280711) (not b!280709) (not start!62672))
(check-sat)
(get-model)

(declare-fun d!96544 () Bool)

(assert (=> d!96544 (= (arrayBitIndices!0 from!822 to!789) (tuple4!765 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!280713 d!96544))

(declare-fun d!96546 () Bool)

(declare-fun res!232984 () Bool)

(declare-fun e!200336 () Bool)

(assert (=> d!96546 (=> res!232984 e!200336)))

(assert (=> d!96546 (= res!232984 (= (_1!12457 lt!416980) (_2!12457 lt!416980)))))

(assert (=> d!96546 (= (arrayRangesEq!1275 a1!699 a2!699 (_1!12457 lt!416980) (_2!12457 lt!416980)) e!200336)))

(declare-fun b!280737 () Bool)

(declare-fun e!200337 () Bool)

(assert (=> b!280737 (= e!200336 e!200337)))

(declare-fun res!232985 () Bool)

(assert (=> b!280737 (=> (not res!232985) (not e!200337))))

(assert (=> b!280737 (= res!232985 (= (select (arr!8003 a1!699) (_1!12457 lt!416980)) (select (arr!8003 a2!699) (_1!12457 lt!416980))))))

(declare-fun b!280738 () Bool)

(assert (=> b!280738 (= e!200337 (arrayRangesEq!1275 a1!699 a2!699 (bvadd (_1!12457 lt!416980) #b00000000000000000000000000000001) (_2!12457 lt!416980)))))

(assert (= (and d!96546 (not res!232984)) b!280737))

(assert (= (and b!280737 res!232985) b!280738))

(declare-fun m!413763 () Bool)

(assert (=> b!280737 m!413763))

(declare-fun m!413765 () Bool)

(assert (=> b!280737 m!413765))

(declare-fun m!413767 () Bool)

(assert (=> b!280738 m!413767))

(assert (=> b!280709 d!96546))

(declare-fun d!96548 () Bool)

(assert (=> d!96548 (arrayRangesEq!1275 a2!699 a1!699 (_1!12457 lt!416980) (_2!12457 lt!416980))))

(declare-fun lt!416994 () Unit!19693)

(declare-fun choose!488 (array!16212 array!16212 (_ BitVec 32) (_ BitVec 32)) Unit!19693)

(assert (=> d!96548 (= lt!416994 (choose!488 a1!699 a2!699 (_1!12457 lt!416980) (_2!12457 lt!416980)))))

(assert (=> d!96548 (and (bvsle #b00000000000000000000000000000000 (_1!12457 lt!416980)) (bvsle (_1!12457 lt!416980) (_2!12457 lt!416980)) (bvsle (_2!12457 lt!416980) (size!7007 a1!699)))))

(assert (=> d!96548 (= (arrayRangesEqSymmetricLemma!182 a1!699 a2!699 (_1!12457 lt!416980) (_2!12457 lt!416980)) lt!416994)))

(declare-fun bs!24332 () Bool)

(assert (= bs!24332 d!96548))

(assert (=> bs!24332 m!413739))

(declare-fun m!413769 () Bool)

(assert (=> bs!24332 m!413769))

(assert (=> b!280709 d!96548))

(declare-fun d!96550 () Bool)

(declare-fun res!232986 () Bool)

(declare-fun e!200338 () Bool)

(assert (=> d!96550 (=> res!232986 e!200338)))

(assert (=> d!96550 (= res!232986 (= (_1!12457 lt!416980) (_2!12457 lt!416980)))))

(assert (=> d!96550 (= (arrayRangesEq!1275 a2!699 a1!699 (_1!12457 lt!416980) (_2!12457 lt!416980)) e!200338)))

(declare-fun b!280739 () Bool)

(declare-fun e!200339 () Bool)

(assert (=> b!280739 (= e!200338 e!200339)))

(declare-fun res!232987 () Bool)

(assert (=> b!280739 (=> (not res!232987) (not e!200339))))

(assert (=> b!280739 (= res!232987 (= (select (arr!8003 a2!699) (_1!12457 lt!416980)) (select (arr!8003 a1!699) (_1!12457 lt!416980))))))

(declare-fun b!280740 () Bool)

(assert (=> b!280740 (= e!200339 (arrayRangesEq!1275 a2!699 a1!699 (bvadd (_1!12457 lt!416980) #b00000000000000000000000000000001) (_2!12457 lt!416980)))))

(assert (= (and d!96550 (not res!232986)) b!280739))

(assert (= (and b!280739 res!232987) b!280740))

(assert (=> b!280739 m!413765))

(assert (=> b!280739 m!413763))

(declare-fun m!413771 () Bool)

(assert (=> b!280740 m!413771))

(assert (=> b!280709 d!96550))

(declare-fun d!96552 () Bool)

(assert (=> d!96552 (= (array_inv!6731 a1!699) (bvsge (size!7007 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!62672 d!96552))

(declare-fun d!96554 () Bool)

(assert (=> d!96554 (= (array_inv!6731 a2!699) (bvsge (size!7007 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!62672 d!96554))

(declare-fun d!96556 () Bool)

(assert (=> d!96556 (= (byteRangesEq!0 (select (arr!8003 a1!699) (_3!1162 lt!416980)) (select (arr!8003 a2!699) (_3!1162 lt!416980)) ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000) (or (= ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8003 a1!699) (_3!1162 lt!416980))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8003 a2!699) (_3!1162 lt!416980))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111))))))

(declare-fun bs!24333 () Bool)

(assert (= bs!24333 d!96556))

(declare-fun m!413773 () Bool)

(assert (=> bs!24333 m!413773))

(declare-fun m!413775 () Bool)

(assert (=> bs!24333 m!413775))

(assert (=> b!280711 d!96556))

(declare-fun d!96558 () Bool)

(declare-fun res!233004 () Bool)

(declare-fun e!200356 () Bool)

(assert (=> d!96558 (=> res!233004 e!200356)))

(assert (=> d!96558 (= res!233004 (bvsge from!822 to!789))))

(assert (=> d!96558 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!200356)))

(declare-fun b!280757 () Bool)

(declare-fun e!200354 () Bool)

(declare-fun call!4649 () Bool)

(assert (=> b!280757 (= e!200354 call!4649)))

(declare-fun b!280758 () Bool)

(declare-fun res!233001 () Bool)

(declare-fun lt!417005 () (_ BitVec 32))

(assert (=> b!280758 (= res!233001 (= lt!417005 #b00000000000000000000000000000000))))

(assert (=> b!280758 (=> res!233001 e!200354)))

(declare-fun e!200355 () Bool)

(assert (=> b!280758 (= e!200355 e!200354)))

(declare-fun lt!417006 () tuple4!764)

(declare-fun lt!417007 () (_ BitVec 32))

(declare-fun c!13050 () Bool)

(declare-fun bm!4646 () Bool)

(assert (=> bm!4646 (= call!4649 (byteRangesEq!0 (ite c!13050 (select (arr!8003 a1!699) (_3!1162 lt!417006)) (select (arr!8003 a1!699) (_4!382 lt!417006))) (ite c!13050 (select (arr!8003 a2!699) (_3!1162 lt!417006)) (select (arr!8003 a2!699) (_4!382 lt!417006))) (ite c!13050 lt!417007 #b00000000000000000000000000000000) lt!417005))))

(declare-fun b!280759 () Bool)

(declare-fun e!200357 () Bool)

(assert (=> b!280759 (= e!200357 e!200355)))

(declare-fun res!233002 () Bool)

(assert (=> b!280759 (= res!233002 (byteRangesEq!0 (select (arr!8003 a1!699) (_3!1162 lt!417006)) (select (arr!8003 a2!699) (_3!1162 lt!417006)) lt!417007 #b00000000000000000000000000001000))))

(assert (=> b!280759 (=> (not res!233002) (not e!200355))))

(declare-fun b!280760 () Bool)

(declare-fun e!200358 () Bool)

(assert (=> b!280760 (= e!200358 e!200357)))

(assert (=> b!280760 (= c!13050 (= (_3!1162 lt!417006) (_4!382 lt!417006)))))

(declare-fun b!280761 () Bool)

(assert (=> b!280761 (= e!200357 call!4649)))

(declare-fun b!280762 () Bool)

(assert (=> b!280762 (= e!200356 e!200358)))

(declare-fun res!233003 () Bool)

(assert (=> b!280762 (=> (not res!233003) (not e!200358))))

(declare-fun e!200359 () Bool)

(assert (=> b!280762 (= res!233003 e!200359)))

(declare-fun res!233000 () Bool)

(assert (=> b!280762 (=> res!233000 e!200359)))

(assert (=> b!280762 (= res!233000 (bvsge (_1!12457 lt!417006) (_2!12457 lt!417006)))))

(assert (=> b!280762 (= lt!417005 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!280762 (= lt!417007 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!280762 (= lt!417006 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!280763 () Bool)

(assert (=> b!280763 (= e!200359 (arrayRangesEq!1275 a1!699 a2!699 (_1!12457 lt!417006) (_2!12457 lt!417006)))))

(assert (= (and d!96558 (not res!233004)) b!280762))

(assert (= (and b!280762 (not res!233000)) b!280763))

(assert (= (and b!280762 res!233003) b!280760))

(assert (= (and b!280760 c!13050) b!280761))

(assert (= (and b!280760 (not c!13050)) b!280759))

(assert (= (and b!280759 res!233002) b!280758))

(assert (= (and b!280758 (not res!233001)) b!280757))

(assert (= (or b!280761 b!280757) bm!4646))

(declare-fun m!413777 () Bool)

(assert (=> bm!4646 m!413777))

(declare-fun m!413779 () Bool)

(assert (=> bm!4646 m!413779))

(declare-fun m!413781 () Bool)

(assert (=> bm!4646 m!413781))

(declare-fun m!413783 () Bool)

(assert (=> bm!4646 m!413783))

(declare-fun m!413785 () Bool)

(assert (=> bm!4646 m!413785))

(assert (=> b!280759 m!413779))

(assert (=> b!280759 m!413777))

(assert (=> b!280759 m!413779))

(assert (=> b!280759 m!413777))

(declare-fun m!413787 () Bool)

(assert (=> b!280759 m!413787))

(assert (=> b!280762 m!413729))

(declare-fun m!413789 () Bool)

(assert (=> b!280763 m!413789))

(assert (=> b!280712 d!96558))

(check-sat (not b!280762) (not b!280738) (not bm!4646) (not b!280740) (not d!96548) (not b!280759) (not b!280763))
(check-sat)
