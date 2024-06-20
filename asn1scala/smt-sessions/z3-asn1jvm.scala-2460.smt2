; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62390 () Bool)

(assert start!62390)

(declare-fun b!279710 () Bool)

(declare-fun e!199443 () Bool)

(declare-datatypes ((tuple4!722 0))(
  ( (tuple4!723 (_1!12436 (_ BitVec 32)) (_2!12436 (_ BitVec 32)) (_3!1141 (_ BitVec 32)) (_4!361 (_ BitVec 32))) )
))
(declare-fun lt!416495 () tuple4!722)

(declare-datatypes ((array!16149 0))(
  ( (array!16150 (arr!7982 (Array (_ BitVec 32) (_ BitVec 8))) (size!6986 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16149)

(assert (=> b!279710 (= e!199443 (not (and (bvsge (_3!1141 lt!416495) #b00000000000000000000000000000000) (bvslt (_3!1141 lt!416495) (size!6986 a1!699)))))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun a2!699 () array!16149)

(declare-fun to!789 () (_ BitVec 64))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!279710 (byteRangesEq!0 (select (arr!7982 a1!699) (_3!1141 lt!416495)) (select (arr!7982 a2!699) (_3!1141 lt!416495)) ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!279711 () Bool)

(declare-fun res!232226 () Bool)

(declare-fun e!199445 () Bool)

(assert (=> b!279711 (=> (not res!232226) (not e!199445))))

(declare-fun arrayBitRangesEq!0 (array!16149 array!16149 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!279711 (= res!232226 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!279712 () Bool)

(declare-datatypes ((Unit!19609 0))(
  ( (Unit!19610) )
))
(declare-fun e!199442 () Unit!19609)

(declare-fun Unit!19611 () Unit!19609)

(assert (=> b!279712 (= e!199442 Unit!19611)))

(declare-fun arrayRangesEq!1254 (array!16149 array!16149 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!279712 (arrayRangesEq!1254 a1!699 a2!699 (_1!12436 lt!416495) (_2!12436 lt!416495))))

(declare-fun lt!416494 () Unit!19609)

(declare-fun arrayRangesEqSymmetricLemma!161 (array!16149 array!16149 (_ BitVec 32) (_ BitVec 32)) Unit!19609)

(assert (=> b!279712 (= lt!416494 (arrayRangesEqSymmetricLemma!161 a1!699 a2!699 (_1!12436 lt!416495) (_2!12436 lt!416495)))))

(assert (=> b!279712 (arrayRangesEq!1254 a2!699 a1!699 (_1!12436 lt!416495) (_2!12436 lt!416495))))

(declare-fun b!279713 () Bool)

(declare-fun res!232225 () Bool)

(assert (=> b!279713 (=> (not res!232225) (not e!199445))))

(assert (=> b!279713 (= res!232225 (bvslt from!822 to!789))))

(declare-fun res!232223 () Bool)

(assert (=> start!62390 (=> (not res!232223) (not e!199445))))

(assert (=> start!62390 (= res!232223 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6986 a1!699) (size!6986 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6986 a1!699))))))))

(assert (=> start!62390 e!199445))

(assert (=> start!62390 true))

(declare-fun array_inv!6710 (array!16149) Bool)

(assert (=> start!62390 (array_inv!6710 a1!699)))

(assert (=> start!62390 (array_inv!6710 a2!699)))

(declare-fun b!279714 () Bool)

(declare-fun Unit!19612 () Unit!19609)

(assert (=> b!279714 (= e!199442 Unit!19612)))

(declare-fun b!279715 () Bool)

(assert (=> b!279715 (= e!199445 e!199443)))

(declare-fun res!232224 () Bool)

(assert (=> b!279715 (=> (not res!232224) (not e!199443))))

(assert (=> b!279715 (= res!232224 (= (_3!1141 lt!416495) (_4!361 lt!416495)))))

(declare-fun lt!416496 () Unit!19609)

(assert (=> b!279715 (= lt!416496 e!199442)))

(declare-fun c!12915 () Bool)

(assert (=> b!279715 (= c!12915 (bvslt (_1!12436 lt!416495) (_2!12436 lt!416495)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!722)

(assert (=> b!279715 (= lt!416495 (arrayBitIndices!0 from!822 to!789))))

(assert (= (and start!62390 res!232223) b!279711))

(assert (= (and b!279711 res!232226) b!279713))

(assert (= (and b!279713 res!232225) b!279715))

(assert (= (and b!279715 c!12915) b!279712))

(assert (= (and b!279715 (not c!12915)) b!279714))

(assert (= (and b!279715 res!232224) b!279710))

(declare-fun m!412743 () Bool)

(assert (=> start!62390 m!412743))

(declare-fun m!412745 () Bool)

(assert (=> start!62390 m!412745))

(declare-fun m!412747 () Bool)

(assert (=> b!279710 m!412747))

(declare-fun m!412749 () Bool)

(assert (=> b!279710 m!412749))

(assert (=> b!279710 m!412747))

(assert (=> b!279710 m!412749))

(declare-fun m!412751 () Bool)

(assert (=> b!279710 m!412751))

(declare-fun m!412753 () Bool)

(assert (=> b!279711 m!412753))

(declare-fun m!412755 () Bool)

(assert (=> b!279715 m!412755))

(declare-fun m!412757 () Bool)

(assert (=> b!279712 m!412757))

(declare-fun m!412759 () Bool)

(assert (=> b!279712 m!412759))

(declare-fun m!412761 () Bool)

(assert (=> b!279712 m!412761))

(check-sat (not b!279712) (not b!279710) (not start!62390) (not b!279715) (not b!279711))
(check-sat)
(get-model)

(declare-fun d!96188 () Bool)

(declare-fun res!232243 () Bool)

(declare-fun e!199466 () Bool)

(assert (=> d!96188 (=> res!232243 e!199466)))

(assert (=> d!96188 (= res!232243 (= (_1!12436 lt!416495) (_2!12436 lt!416495)))))

(assert (=> d!96188 (= (arrayRangesEq!1254 a1!699 a2!699 (_1!12436 lt!416495) (_2!12436 lt!416495)) e!199466)))

(declare-fun b!279738 () Bool)

(declare-fun e!199467 () Bool)

(assert (=> b!279738 (= e!199466 e!199467)))

(declare-fun res!232244 () Bool)

(assert (=> b!279738 (=> (not res!232244) (not e!199467))))

(assert (=> b!279738 (= res!232244 (= (select (arr!7982 a1!699) (_1!12436 lt!416495)) (select (arr!7982 a2!699) (_1!12436 lt!416495))))))

(declare-fun b!279739 () Bool)

(assert (=> b!279739 (= e!199467 (arrayRangesEq!1254 a1!699 a2!699 (bvadd (_1!12436 lt!416495) #b00000000000000000000000000000001) (_2!12436 lt!416495)))))

(assert (= (and d!96188 (not res!232243)) b!279738))

(assert (= (and b!279738 res!232244) b!279739))

(declare-fun m!412783 () Bool)

(assert (=> b!279738 m!412783))

(declare-fun m!412785 () Bool)

(assert (=> b!279738 m!412785))

(declare-fun m!412787 () Bool)

(assert (=> b!279739 m!412787))

(assert (=> b!279712 d!96188))

(declare-fun d!96190 () Bool)

(assert (=> d!96190 (arrayRangesEq!1254 a2!699 a1!699 (_1!12436 lt!416495) (_2!12436 lt!416495))))

(declare-fun lt!416508 () Unit!19609)

(declare-fun choose!470 (array!16149 array!16149 (_ BitVec 32) (_ BitVec 32)) Unit!19609)

(assert (=> d!96190 (= lt!416508 (choose!470 a1!699 a2!699 (_1!12436 lt!416495) (_2!12436 lt!416495)))))

(assert (=> d!96190 (and (bvsle #b00000000000000000000000000000000 (_1!12436 lt!416495)) (bvsle (_1!12436 lt!416495) (_2!12436 lt!416495)) (bvsle (_2!12436 lt!416495) (size!6986 a1!699)))))

(assert (=> d!96190 (= (arrayRangesEqSymmetricLemma!161 a1!699 a2!699 (_1!12436 lt!416495) (_2!12436 lt!416495)) lt!416508)))

(declare-fun bs!24269 () Bool)

(assert (= bs!24269 d!96190))

(assert (=> bs!24269 m!412761))

(declare-fun m!412789 () Bool)

(assert (=> bs!24269 m!412789))

(assert (=> b!279712 d!96190))

(declare-fun d!96192 () Bool)

(declare-fun res!232245 () Bool)

(declare-fun e!199468 () Bool)

(assert (=> d!96192 (=> res!232245 e!199468)))

(assert (=> d!96192 (= res!232245 (= (_1!12436 lt!416495) (_2!12436 lt!416495)))))

(assert (=> d!96192 (= (arrayRangesEq!1254 a2!699 a1!699 (_1!12436 lt!416495) (_2!12436 lt!416495)) e!199468)))

(declare-fun b!279740 () Bool)

(declare-fun e!199469 () Bool)

(assert (=> b!279740 (= e!199468 e!199469)))

(declare-fun res!232246 () Bool)

(assert (=> b!279740 (=> (not res!232246) (not e!199469))))

(assert (=> b!279740 (= res!232246 (= (select (arr!7982 a2!699) (_1!12436 lt!416495)) (select (arr!7982 a1!699) (_1!12436 lt!416495))))))

(declare-fun b!279741 () Bool)

(assert (=> b!279741 (= e!199469 (arrayRangesEq!1254 a2!699 a1!699 (bvadd (_1!12436 lt!416495) #b00000000000000000000000000000001) (_2!12436 lt!416495)))))

(assert (= (and d!96192 (not res!232245)) b!279740))

(assert (= (and b!279740 res!232246) b!279741))

(assert (=> b!279740 m!412785))

(assert (=> b!279740 m!412783))

(declare-fun m!412791 () Bool)

(assert (=> b!279741 m!412791))

(assert (=> b!279712 d!96192))

(declare-fun d!96194 () Bool)

(assert (=> d!96194 (= (array_inv!6710 a1!699) (bvsge (size!6986 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!62390 d!96194))

(declare-fun d!96196 () Bool)

(assert (=> d!96196 (= (array_inv!6710 a2!699) (bvsge (size!6986 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!62390 d!96196))

(declare-fun b!279756 () Bool)

(declare-fun e!199483 () Bool)

(declare-fun call!4583 () Bool)

(assert (=> b!279756 (= e!199483 call!4583)))

(declare-fun b!279757 () Bool)

(declare-fun e!199484 () Bool)

(assert (=> b!279757 (= e!199483 e!199484)))

(declare-fun res!232261 () Bool)

(declare-fun lt!416516 () (_ BitVec 32))

(declare-fun lt!416517 () tuple4!722)

(assert (=> b!279757 (= res!232261 (byteRangesEq!0 (select (arr!7982 a1!699) (_3!1141 lt!416517)) (select (arr!7982 a2!699) (_3!1141 lt!416517)) lt!416516 #b00000000000000000000000000001000))))

(assert (=> b!279757 (=> (not res!232261) (not e!199484))))

(declare-fun d!96198 () Bool)

(declare-fun res!232258 () Bool)

(declare-fun e!199482 () Bool)

(assert (=> d!96198 (=> res!232258 e!199482)))

(assert (=> d!96198 (= res!232258 (bvsge from!822 to!789))))

(assert (=> d!96198 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!199482)))

(declare-fun b!279758 () Bool)

(declare-fun res!232259 () Bool)

(declare-fun lt!416515 () (_ BitVec 32))

(assert (=> b!279758 (= res!232259 (= lt!416515 #b00000000000000000000000000000000))))

(declare-fun e!199486 () Bool)

(assert (=> b!279758 (=> res!232259 e!199486)))

(assert (=> b!279758 (= e!199484 e!199486)))

(declare-fun b!279759 () Bool)

(declare-fun e!199485 () Bool)

(assert (=> b!279759 (= e!199485 e!199483)))

(declare-fun c!12921 () Bool)

(assert (=> b!279759 (= c!12921 (= (_3!1141 lt!416517) (_4!361 lt!416517)))))

(declare-fun e!199487 () Bool)

(declare-fun b!279760 () Bool)

(assert (=> b!279760 (= e!199487 (arrayRangesEq!1254 a1!699 a2!699 (_1!12436 lt!416517) (_2!12436 lt!416517)))))

(declare-fun bm!4580 () Bool)

(assert (=> bm!4580 (= call!4583 (byteRangesEq!0 (ite c!12921 (select (arr!7982 a1!699) (_3!1141 lt!416517)) (select (arr!7982 a1!699) (_4!361 lt!416517))) (ite c!12921 (select (arr!7982 a2!699) (_3!1141 lt!416517)) (select (arr!7982 a2!699) (_4!361 lt!416517))) (ite c!12921 lt!416516 #b00000000000000000000000000000000) lt!416515))))

(declare-fun b!279761 () Bool)

(assert (=> b!279761 (= e!199486 call!4583)))

(declare-fun b!279762 () Bool)

(assert (=> b!279762 (= e!199482 e!199485)))

(declare-fun res!232260 () Bool)

(assert (=> b!279762 (=> (not res!232260) (not e!199485))))

(assert (=> b!279762 (= res!232260 e!199487)))

(declare-fun res!232257 () Bool)

(assert (=> b!279762 (=> res!232257 e!199487)))

(assert (=> b!279762 (= res!232257 (bvsge (_1!12436 lt!416517) (_2!12436 lt!416517)))))

(assert (=> b!279762 (= lt!416515 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!279762 (= lt!416516 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!279762 (= lt!416517 (arrayBitIndices!0 from!822 to!789))))

(assert (= (and d!96198 (not res!232258)) b!279762))

(assert (= (and b!279762 (not res!232257)) b!279760))

(assert (= (and b!279762 res!232260) b!279759))

(assert (= (and b!279759 c!12921) b!279756))

(assert (= (and b!279759 (not c!12921)) b!279757))

(assert (= (and b!279757 res!232261) b!279758))

(assert (= (and b!279758 (not res!232259)) b!279761))

(assert (= (or b!279756 b!279761) bm!4580))

(declare-fun m!412793 () Bool)

(assert (=> b!279757 m!412793))

(declare-fun m!412795 () Bool)

(assert (=> b!279757 m!412795))

(assert (=> b!279757 m!412793))

(assert (=> b!279757 m!412795))

(declare-fun m!412797 () Bool)

(assert (=> b!279757 m!412797))

(declare-fun m!412799 () Bool)

(assert (=> b!279760 m!412799))

(assert (=> bm!4580 m!412793))

(assert (=> bm!4580 m!412795))

(declare-fun m!412801 () Bool)

(assert (=> bm!4580 m!412801))

(declare-fun m!412803 () Bool)

(assert (=> bm!4580 m!412803))

(declare-fun m!412805 () Bool)

(assert (=> bm!4580 m!412805))

(assert (=> b!279762 m!412755))

(assert (=> b!279711 d!96198))

(declare-fun d!96200 () Bool)

(assert (=> d!96200 (= (byteRangesEq!0 (select (arr!7982 a1!699) (_3!1141 lt!416495)) (select (arr!7982 a2!699) (_3!1141 lt!416495)) ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000))) (or (= ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000))) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7982 a1!699) (_3!1141 lt!416495))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7982 a2!699) (_3!1141 lt!416495))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111))))))

(declare-fun bs!24270 () Bool)

(assert (= bs!24270 d!96200))

(declare-fun m!412807 () Bool)

(assert (=> bs!24270 m!412807))

(declare-fun m!412809 () Bool)

(assert (=> bs!24270 m!412809))

(assert (=> b!279710 d!96200))

(declare-fun d!96202 () Bool)

(assert (=> d!96202 (= (arrayBitIndices!0 from!822 to!789) (tuple4!723 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!279715 d!96202))

(check-sat (not b!279741) (not b!279762) (not b!279757) (not d!96190) (not b!279739) (not b!279760) (not bm!4580))
(check-sat)
