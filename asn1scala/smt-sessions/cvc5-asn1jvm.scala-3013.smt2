; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70312 () Bool)

(assert start!70312)

(declare-fun res!261663 () Bool)

(declare-fun e!228815 () Bool)

(assert (=> start!70312 (=> (not res!261663) (not e!228815))))

(declare-datatypes ((array!19810 0))(
  ( (array!19811 (arr!9712 (Array (_ BitVec 32) (_ BitVec 8))) (size!8626 (_ BitVec 32))) )
))
(declare-fun a2!721 () array!19810)

(declare-fun to!813 () (_ BitVec 64))

(declare-fun a1!721 () array!19810)

(declare-fun from!846 () (_ BitVec 64))

(assert (=> start!70312 (= res!261663 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 from!846) (bvsle from!846 to!813) (= (size!8626 a1!721) (size!8626 a2!721)) (bvsle to!813 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8626 a1!721))))))))

(assert (=> start!70312 e!228815))

(assert (=> start!70312 true))

(declare-fun array_inv!8178 (array!19810) Bool)

(assert (=> start!70312 (array_inv!8178 a1!721)))

(assert (=> start!70312 (array_inv!8178 a2!721)))

(declare-fun b!318583 () Bool)

(declare-fun res!261664 () Bool)

(assert (=> b!318583 (=> (not res!261664) (not e!228815))))

(declare-fun arrayBitRangesEq!0 (array!19810 array!19810 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318583 (= res!261664 (arrayBitRangesEq!0 a1!721 a2!721 from!846 to!813))))

(declare-fun b!318584 () Bool)

(declare-fun res!261665 () Bool)

(assert (=> b!318584 (=> (not res!261665) (not e!228815))))

(declare-fun bitAt!0 (array!19810 (_ BitVec 64)) Bool)

(assert (=> b!318584 (= res!261665 (= (bitAt!0 a1!721 (bvsub from!846 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!721 (bvsub from!846 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!318585 () Bool)

(assert (=> b!318585 (= e!228815 (not (arrayBitRangesEq!0 a1!721 a2!721 (bvsub from!846 #b0000000000000000000000000000000000000000000000000000000000000001) to!813)))))

(assert (= (and start!70312 res!261663) b!318583))

(assert (= (and b!318583 res!261664) b!318584))

(assert (= (and b!318584 res!261665) b!318585))

(declare-fun m!456683 () Bool)

(assert (=> start!70312 m!456683))

(declare-fun m!456685 () Bool)

(assert (=> start!70312 m!456685))

(declare-fun m!456687 () Bool)

(assert (=> b!318583 m!456687))

(declare-fun m!456689 () Bool)

(assert (=> b!318584 m!456689))

(declare-fun m!456691 () Bool)

(assert (=> b!318584 m!456691))

(declare-fun m!456693 () Bool)

(assert (=> b!318585 m!456693))

(push 1)

(assert (not start!70312))

(assert (not b!318585))

(assert (not b!318583))

(assert (not b!318584))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!104352 () Bool)

(assert (=> d!104352 (= (array_inv!8178 a1!721) (bvsge (size!8626 a1!721) #b00000000000000000000000000000000))))

(assert (=> start!70312 d!104352))

(declare-fun d!104354 () Bool)

(assert (=> d!104354 (= (array_inv!8178 a2!721) (bvsge (size!8626 a2!721) #b00000000000000000000000000000000))))

(assert (=> start!70312 d!104354))

(declare-fun b!318639 () Bool)

(declare-fun e!228871 () Bool)

(declare-fun call!5969 () Bool)

(assert (=> b!318639 (= e!228871 call!5969)))

(declare-fun e!228870 () Bool)

(declare-fun lt!443409 () (_ BitVec 32))

(declare-fun b!318640 () Bool)

(declare-datatypes ((tuple4!1290 0))(
  ( (tuple4!1291 (_1!13324 (_ BitVec 32)) (_2!13324 (_ BitVec 32)) (_3!1602 (_ BitVec 32)) (_4!645 (_ BitVec 32))) )
))
(declare-fun lt!443410 () tuple4!1290)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!318640 (= e!228870 (byteRangesEq!0 (select (arr!9712 a1!721) (_4!645 lt!443410)) (select (arr!9712 a2!721) (_4!645 lt!443410)) #b00000000000000000000000000000000 lt!443409))))

(declare-fun d!104356 () Bool)

(declare-fun res!261712 () Bool)

(declare-fun e!228867 () Bool)

(assert (=> d!104356 (=> res!261712 e!228867)))

(assert (=> d!104356 (= res!261712 (bvsge (bvsub from!846 #b0000000000000000000000000000000000000000000000000000000000000001) to!813))))

(assert (=> d!104356 (= (arrayBitRangesEq!0 a1!721 a2!721 (bvsub from!846 #b0000000000000000000000000000000000000000000000000000000000000001) to!813) e!228867)))

(declare-fun b!318641 () Bool)

(declare-fun e!228869 () Bool)

(assert (=> b!318641 (= e!228867 e!228869)))

(declare-fun res!261713 () Bool)

(assert (=> b!318641 (=> (not res!261713) (not e!228869))))

(declare-fun e!228868 () Bool)

(assert (=> b!318641 (= res!261713 e!228868)))

(declare-fun res!261710 () Bool)

(assert (=> b!318641 (=> res!261710 e!228868)))

(assert (=> b!318641 (= res!261710 (bvsge (_1!13324 lt!443410) (_2!13324 lt!443410)))))

(assert (=> b!318641 (= lt!443409 ((_ extract 31 0) (bvsrem to!813 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!443411 () (_ BitVec 32))

(assert (=> b!318641 (= lt!443411 ((_ extract 31 0) (bvsrem (bvsub from!846 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1290)

(assert (=> b!318641 (= lt!443410 (arrayBitIndices!0 (bvsub from!846 #b0000000000000000000000000000000000000000000000000000000000000001) to!813))))

(declare-fun b!318642 () Bool)

(declare-fun e!228866 () Bool)

(assert (=> b!318642 (= e!228871 e!228866)))

(declare-fun res!261711 () Bool)

(assert (=> b!318642 (= res!261711 call!5969)))

(assert (=> b!318642 (=> (not res!261711) (not e!228866))))

(declare-fun b!318643 () Bool)

(declare-fun arrayRangesEq!1800 (array!19810 array!19810 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!318643 (= e!228868 (arrayRangesEq!1800 a1!721 a2!721 (_1!13324 lt!443410) (_2!13324 lt!443410)))))

(declare-fun bm!5966 () Bool)

(declare-fun c!15250 () Bool)

(assert (=> bm!5966 (= call!5969 (byteRangesEq!0 (select (arr!9712 a1!721) (_3!1602 lt!443410)) (select (arr!9712 a2!721) (_3!1602 lt!443410)) lt!443411 (ite c!15250 lt!443409 #b00000000000000000000000000001000)))))

(declare-fun b!318644 () Bool)

(declare-fun res!261709 () Bool)

(assert (=> b!318644 (= res!261709 (= lt!443409 #b00000000000000000000000000000000))))

(assert (=> b!318644 (=> res!261709 e!228870)))

(assert (=> b!318644 (= e!228866 e!228870)))

(declare-fun b!318645 () Bool)

(assert (=> b!318645 (= e!228869 e!228871)))

(assert (=> b!318645 (= c!15250 (= (_3!1602 lt!443410) (_4!645 lt!443410)))))

(assert (= (and d!104356 (not res!261712)) b!318641))

(assert (= (and b!318641 (not res!261710)) b!318643))

(assert (= (and b!318641 res!261713) b!318645))

(assert (= (and b!318645 c!15250) b!318639))

(assert (= (and b!318645 (not c!15250)) b!318642))

(assert (= (and b!318642 res!261711) b!318644))

(assert (= (and b!318644 (not res!261709)) b!318640))

(assert (= (or b!318639 b!318642) bm!5966))

(declare-fun m!456725 () Bool)

(assert (=> b!318640 m!456725))

(declare-fun m!456727 () Bool)

(assert (=> b!318640 m!456727))

(assert (=> b!318640 m!456725))

(assert (=> b!318640 m!456727))

(declare-fun m!456735 () Bool)

(assert (=> b!318640 m!456735))

(declare-fun m!456737 () Bool)

(assert (=> b!318641 m!456737))

(declare-fun m!456741 () Bool)

(assert (=> b!318643 m!456741))

(declare-fun m!456743 () Bool)

(assert (=> bm!5966 m!456743))

(declare-fun m!456745 () Bool)

(assert (=> bm!5966 m!456745))

(assert (=> bm!5966 m!456743))

(assert (=> bm!5966 m!456745))

(declare-fun m!456749 () Bool)

(assert (=> bm!5966 m!456749))

(assert (=> b!318585 d!104356))

(declare-fun b!318646 () Bool)

(declare-fun e!228877 () Bool)

(declare-fun call!5970 () Bool)

(assert (=> b!318646 (= e!228877 call!5970)))

(declare-fun e!228876 () Bool)

(declare-fun lt!443413 () tuple4!1290)

(declare-fun b!318647 () Bool)

(declare-fun lt!443412 () (_ BitVec 32))

(assert (=> b!318647 (= e!228876 (byteRangesEq!0 (select (arr!9712 a1!721) (_4!645 lt!443413)) (select (arr!9712 a2!721) (_4!645 lt!443413)) #b00000000000000000000000000000000 lt!443412))))

(declare-fun d!104362 () Bool)

(declare-fun res!261717 () Bool)

(declare-fun e!228873 () Bool)

(assert (=> d!104362 (=> res!261717 e!228873)))

(assert (=> d!104362 (= res!261717 (bvsge from!846 to!813))))

(assert (=> d!104362 (= (arrayBitRangesEq!0 a1!721 a2!721 from!846 to!813) e!228873)))

(declare-fun b!318648 () Bool)

(declare-fun e!228875 () Bool)

(assert (=> b!318648 (= e!228873 e!228875)))

(declare-fun res!261718 () Bool)

(assert (=> b!318648 (=> (not res!261718) (not e!228875))))

(declare-fun e!228874 () Bool)

(assert (=> b!318648 (= res!261718 e!228874)))

(declare-fun res!261715 () Bool)

(assert (=> b!318648 (=> res!261715 e!228874)))

(assert (=> b!318648 (= res!261715 (bvsge (_1!13324 lt!443413) (_2!13324 lt!443413)))))

(assert (=> b!318648 (= lt!443412 ((_ extract 31 0) (bvsrem to!813 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!443414 () (_ BitVec 32))

(assert (=> b!318648 (= lt!443414 ((_ extract 31 0) (bvsrem from!846 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!318648 (= lt!443413 (arrayBitIndices!0 from!846 to!813))))

(declare-fun b!318649 () Bool)

(declare-fun e!228872 () Bool)

(assert (=> b!318649 (= e!228877 e!228872)))

(declare-fun res!261716 () Bool)

(assert (=> b!318649 (= res!261716 call!5970)))

(assert (=> b!318649 (=> (not res!261716) (not e!228872))))

(declare-fun b!318650 () Bool)

(assert (=> b!318650 (= e!228874 (arrayRangesEq!1800 a1!721 a2!721 (_1!13324 lt!443413) (_2!13324 lt!443413)))))

(declare-fun bm!5967 () Bool)

(declare-fun c!15251 () Bool)

(assert (=> bm!5967 (= call!5970 (byteRangesEq!0 (select (arr!9712 a1!721) (_3!1602 lt!443413)) (select (arr!9712 a2!721) (_3!1602 lt!443413)) lt!443414 (ite c!15251 lt!443412 #b00000000000000000000000000001000)))))

(declare-fun b!318651 () Bool)

(declare-fun res!261714 () Bool)

(assert (=> b!318651 (= res!261714 (= lt!443412 #b00000000000000000000000000000000))))

(assert (=> b!318651 (=> res!261714 e!228876)))

(assert (=> b!318651 (= e!228872 e!228876)))

(declare-fun b!318652 () Bool)

(assert (=> b!318652 (= e!228875 e!228877)))

(assert (=> b!318652 (= c!15251 (= (_3!1602 lt!443413) (_4!645 lt!443413)))))

(assert (= (and d!104362 (not res!261717)) b!318648))

(assert (= (and b!318648 (not res!261715)) b!318650))

(assert (= (and b!318648 res!261718) b!318652))

(assert (= (and b!318652 c!15251) b!318646))

(assert (= (and b!318652 (not c!15251)) b!318649))

(assert (= (and b!318649 res!261716) b!318651))

(assert (= (and b!318651 (not res!261714)) b!318647))

(assert (= (or b!318646 b!318649) bm!5967))

(declare-fun m!456751 () Bool)

(assert (=> b!318647 m!456751))

(declare-fun m!456753 () Bool)

(assert (=> b!318647 m!456753))

(assert (=> b!318647 m!456751))

(assert (=> b!318647 m!456753))

(declare-fun m!456755 () Bool)

(assert (=> b!318647 m!456755))

(declare-fun m!456757 () Bool)

(assert (=> b!318648 m!456757))

(declare-fun m!456759 () Bool)

(assert (=> b!318650 m!456759))

(declare-fun m!456761 () Bool)

(assert (=> bm!5967 m!456761))

(declare-fun m!456763 () Bool)

(assert (=> bm!5967 m!456763))

(assert (=> bm!5967 m!456761))

(assert (=> bm!5967 m!456763))

(declare-fun m!456765 () Bool)

(assert (=> bm!5967 m!456765))

(assert (=> b!318583 d!104362))

(declare-fun d!104364 () Bool)

(assert (=> d!104364 (= (bitAt!0 a1!721 (bvsub from!846 #b0000000000000000000000000000000000000000000000000000000000000001)) (not (= (bvand ((_ sign_extend 24) (select (arr!9712 a1!721) ((_ extract 31 0) (bvsdiv (bvsub from!846 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvsub from!846 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!27271 () Bool)

(assert (= bs!27271 d!104364))

(declare-fun m!456773 () Bool)

(assert (=> bs!27271 m!456773))

(declare-fun m!456775 () Bool)

(assert (=> bs!27271 m!456775))

(assert (=> b!318584 d!104364))

(declare-fun d!104374 () Bool)

(assert (=> d!104374 (= (bitAt!0 a2!721 (bvsub from!846 #b0000000000000000000000000000000000000000000000000000000000000001)) (not (= (bvand ((_ sign_extend 24) (select (arr!9712 a2!721) ((_ extract 31 0) (bvsdiv (bvsub from!846 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvsub from!846 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!27272 () Bool)

(assert (= bs!27272 d!104374))

(declare-fun m!456777 () Bool)

(assert (=> bs!27272 m!456777))

(assert (=> bs!27272 m!456775))

(assert (=> b!318584 d!104374))

(push 1)

(assert (not b!318641))

(assert (not b!318648))

(assert (not bm!5966))

(assert (not b!318643))

(assert (not b!318640))

(assert (not b!318647))

(assert (not bm!5967))

(assert (not b!318650))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!104402 () Bool)

(assert (=> d!104402 (= (byteRangesEq!0 (select (arr!9712 a1!721) (_3!1602 lt!443413)) (select (arr!9712 a2!721) (_3!1602 lt!443413)) lt!443414 (ite c!15251 lt!443412 #b00000000000000000000000000001000)) (or (= lt!443414 (ite c!15251 lt!443412 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9712 a1!721) (_3!1602 lt!443413))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!15251 lt!443412 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!443414)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9712 a2!721) (_3!1602 lt!443413))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!15251 lt!443412 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!443414)))) #b00000000000000000000000011111111))))))

(declare-fun bs!27279 () Bool)

(assert (= bs!27279 d!104402))

(declare-fun m!456859 () Bool)

(assert (=> bs!27279 m!456859))

(declare-fun m!456861 () Bool)

(assert (=> bs!27279 m!456861))

(assert (=> bm!5967 d!104402))

(declare-fun d!104404 () Bool)

(assert (=> d!104404 (= (byteRangesEq!0 (select (arr!9712 a1!721) (_4!645 lt!443410)) (select (arr!9712 a2!721) (_4!645 lt!443410)) #b00000000000000000000000000000000 lt!443409) (or (= #b00000000000000000000000000000000 lt!443409) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9712 a1!721) (_4!645 lt!443410))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!443409))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9712 a2!721) (_4!645 lt!443410))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!443409))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!27280 () Bool)

(assert (= bs!27280 d!104404))

(declare-fun m!456863 () Bool)

(assert (=> bs!27280 m!456863))

(declare-fun m!456865 () Bool)

(assert (=> bs!27280 m!456865))

(assert (=> b!318640 d!104404))

(declare-fun d!104406 () Bool)

(declare-fun res!261756 () Bool)

(declare-fun e!228920 () Bool)

(assert (=> d!104406 (=> res!261756 e!228920)))

(assert (=> d!104406 (= res!261756 (= (_1!13324 lt!443413) (_2!13324 lt!443413)))))

(assert (=> d!104406 (= (arrayRangesEq!1800 a1!721 a2!721 (_1!13324 lt!443413) (_2!13324 lt!443413)) e!228920)))

(declare-fun b!318700 () Bool)

(declare-fun e!228921 () Bool)

(assert (=> b!318700 (= e!228920 e!228921)))

(declare-fun res!261757 () Bool)

(assert (=> b!318700 (=> (not res!261757) (not e!228921))))

(assert (=> b!318700 (= res!261757 (= (select (arr!9712 a1!721) (_1!13324 lt!443413)) (select (arr!9712 a2!721) (_1!13324 lt!443413))))))

(declare-fun b!318701 () Bool)

(assert (=> b!318701 (= e!228921 (arrayRangesEq!1800 a1!721 a2!721 (bvadd (_1!13324 lt!443413) #b00000000000000000000000000000001) (_2!13324 lt!443413)))))

(assert (= (and d!104406 (not res!261756)) b!318700))

(assert (= (and b!318700 res!261757) b!318701))

(declare-fun m!456867 () Bool)

(assert (=> b!318700 m!456867))

(declare-fun m!456869 () Bool)

(assert (=> b!318700 m!456869))

(declare-fun m!456871 () Bool)

(assert (=> b!318701 m!456871))

(assert (=> b!318650 d!104406))

(declare-fun d!104408 () Bool)

(assert (=> d!104408 (= (byteRangesEq!0 (select (arr!9712 a1!721) (_3!1602 lt!443410)) (select (arr!9712 a2!721) (_3!1602 lt!443410)) lt!443411 (ite c!15250 lt!443409 #b00000000000000000000000000001000)) (or (= lt!443411 (ite c!15250 lt!443409 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9712 a1!721) (_3!1602 lt!443410))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!15250 lt!443409 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!443411)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9712 a2!721) (_3!1602 lt!443410))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!15250 lt!443409 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!443411)))) #b00000000000000000000000011111111))))))

(declare-fun bs!27281 () Bool)

(assert (= bs!27281 d!104408))

(declare-fun m!456873 () Bool)

(assert (=> bs!27281 m!456873))

(declare-fun m!456875 () Bool)

(assert (=> bs!27281 m!456875))

(assert (=> bm!5966 d!104408))

(declare-fun d!104410 () Bool)

(assert (=> d!104410 (= (arrayBitIndices!0 from!846 to!813) (tuple4!1291 ((_ extract 31 0) (bvadd (bvsdiv from!846 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!846 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!813 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!846 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!813 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!318648 d!104410))

(declare-fun d!104412 () Bool)

(declare-fun res!261758 () Bool)

(declare-fun e!228922 () Bool)

(assert (=> d!104412 (=> res!261758 e!228922)))

(assert (=> d!104412 (= res!261758 (= (_1!13324 lt!443410) (_2!13324 lt!443410)))))

(assert (=> d!104412 (= (arrayRangesEq!1800 a1!721 a2!721 (_1!13324 lt!443410) (_2!13324 lt!443410)) e!228922)))

(declare-fun b!318702 () Bool)

(declare-fun e!228923 () Bool)

(assert (=> b!318702 (= e!228922 e!228923)))

(declare-fun res!261759 () Bool)

(assert (=> b!318702 (=> (not res!261759) (not e!228923))))

(assert (=> b!318702 (= res!261759 (= (select (arr!9712 a1!721) (_1!13324 lt!443410)) (select (arr!9712 a2!721) (_1!13324 lt!443410))))))

(declare-fun b!318703 () Bool)

(assert (=> b!318703 (= e!228923 (arrayRangesEq!1800 a1!721 a2!721 (bvadd (_1!13324 lt!443410) #b00000000000000000000000000000001) (_2!13324 lt!443410)))))

(assert (= (and d!104412 (not res!261758)) b!318702))

(assert (= (and b!318702 res!261759) b!318703))

(declare-fun m!456877 () Bool)

(assert (=> b!318702 m!456877))

(declare-fun m!456879 () Bool)

(assert (=> b!318702 m!456879))

(declare-fun m!456881 () Bool)

(assert (=> b!318703 m!456881))

(assert (=> b!318643 d!104412))

(declare-fun d!104414 () Bool)

(assert (=> d!104414 (= (arrayBitIndices!0 (bvsub from!846 #b0000000000000000000000000000000000000000000000000000000000000001) to!813) (tuple4!1291 ((_ extract 31 0) (bvadd (bvsdiv (bvsub from!846 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem (bvsub from!846 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!813 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bvsub from!846 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!813 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!318641 d!104414))

(declare-fun d!104416 () Bool)

(assert (=> d!104416 (= (byteRangesEq!0 (select (arr!9712 a1!721) (_4!645 lt!443413)) (select (arr!9712 a2!721) (_4!645 lt!443413)) #b00000000000000000000000000000000 lt!443412) (or (= #b00000000000000000000000000000000 lt!443412) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9712 a1!721) (_4!645 lt!443413))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!443412))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9712 a2!721) (_4!645 lt!443413))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!443412))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!27282 () Bool)

(assert (= bs!27282 d!104416))

(declare-fun m!456883 () Bool)

(assert (=> bs!27282 m!456883))

(assert (=> bs!27282 m!456865))

(assert (=> b!318647 d!104416))

(push 1)

(assert (not b!318701))

(assert (not b!318703))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!104434 () Bool)

(declare-fun res!261768 () Bool)

(declare-fun e!228932 () Bool)

(assert (=> d!104434 (=> res!261768 e!228932)))

(assert (=> d!104434 (= res!261768 (= (bvadd (_1!13324 lt!443413) #b00000000000000000000000000000001) (_2!13324 lt!443413)))))

(assert (=> d!104434 (= (arrayRangesEq!1800 a1!721 a2!721 (bvadd (_1!13324 lt!443413) #b00000000000000000000000000000001) (_2!13324 lt!443413)) e!228932)))

(declare-fun b!318712 () Bool)

(declare-fun e!228933 () Bool)

(assert (=> b!318712 (= e!228932 e!228933)))

(declare-fun res!261769 () Bool)

(assert (=> b!318712 (=> (not res!261769) (not e!228933))))

(assert (=> b!318712 (= res!261769 (= (select (arr!9712 a1!721) (bvadd (_1!13324 lt!443413) #b00000000000000000000000000000001)) (select (arr!9712 a2!721) (bvadd (_1!13324 lt!443413) #b00000000000000000000000000000001))))))

(declare-fun b!318713 () Bool)

(assert (=> b!318713 (= e!228933 (arrayRangesEq!1800 a1!721 a2!721 (bvadd (_1!13324 lt!443413) #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_2!13324 lt!443413)))))

(assert (= (and d!104434 (not res!261768)) b!318712))

(assert (= (and b!318712 res!261769) b!318713))

(declare-fun m!456911 () Bool)

(assert (=> b!318712 m!456911))

(declare-fun m!456913 () Bool)

(assert (=> b!318712 m!456913))

(declare-fun m!456915 () Bool)

(assert (=> b!318713 m!456915))

(assert (=> b!318701 d!104434))

(declare-fun d!104436 () Bool)

(declare-fun res!261770 () Bool)

(declare-fun e!228934 () Bool)

(assert (=> d!104436 (=> res!261770 e!228934)))

(assert (=> d!104436 (= res!261770 (= (bvadd (_1!13324 lt!443410) #b00000000000000000000000000000001) (_2!13324 lt!443410)))))

(assert (=> d!104436 (= (arrayRangesEq!1800 a1!721 a2!721 (bvadd (_1!13324 lt!443410) #b00000000000000000000000000000001) (_2!13324 lt!443410)) e!228934)))

(declare-fun b!318714 () Bool)

(declare-fun e!228935 () Bool)

(assert (=> b!318714 (= e!228934 e!228935)))

(declare-fun res!261771 () Bool)

(assert (=> b!318714 (=> (not res!261771) (not e!228935))))

(assert (=> b!318714 (= res!261771 (= (select (arr!9712 a1!721) (bvadd (_1!13324 lt!443410) #b00000000000000000000000000000001)) (select (arr!9712 a2!721) (bvadd (_1!13324 lt!443410) #b00000000000000000000000000000001))))))

(declare-fun b!318715 () Bool)

(assert (=> b!318715 (= e!228935 (arrayRangesEq!1800 a1!721 a2!721 (bvadd (_1!13324 lt!443410) #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_2!13324 lt!443410)))))

(assert (= (and d!104436 (not res!261770)) b!318714))

(assert (= (and b!318714 res!261771) b!318715))

(declare-fun m!456917 () Bool)

(assert (=> b!318714 m!456917))

(declare-fun m!456919 () Bool)

(assert (=> b!318714 m!456919))

(declare-fun m!456921 () Bool)

(assert (=> b!318715 m!456921))

(assert (=> b!318703 d!104436))

(push 1)

(assert (not b!318713))

(assert (not b!318715))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

