; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62348 () Bool)

(assert start!62348)

(declare-fun b!279569 () Bool)

(declare-fun e!199321 () Bool)

(declare-fun e!199322 () Bool)

(assert (=> b!279569 (= e!199321 e!199322)))

(declare-fun res!232120 () Bool)

(assert (=> b!279569 (=> (not res!232120) (not e!199322))))

(declare-datatypes ((tuple4!716 0))(
  ( (tuple4!717 (_1!12433 (_ BitVec 32)) (_2!12433 (_ BitVec 32)) (_3!1138 (_ BitVec 32)) (_4!358 (_ BitVec 32))) )
))
(declare-fun lt!416432 () tuple4!716)

(assert (=> b!279569 (= res!232120 (= (_3!1138 lt!416432) (_4!358 lt!416432)))))

(declare-datatypes ((Unit!19597 0))(
  ( (Unit!19598) )
))
(declare-fun lt!416433 () Unit!19597)

(declare-fun e!199320 () Unit!19597)

(assert (=> b!279569 (= lt!416433 e!199320)))

(declare-fun c!12897 () Bool)

(assert (=> b!279569 (= c!12897 (bvslt (_1!12433 lt!416432) (_2!12433 lt!416432)))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!716)

(assert (=> b!279569 (= lt!416432 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!279570 () Bool)

(declare-fun Unit!19599 () Unit!19597)

(assert (=> b!279570 (= e!199320 Unit!19599)))

(declare-datatypes ((array!16140 0))(
  ( (array!16141 (arr!7979 (Array (_ BitVec 32) (_ BitVec 8))) (size!6983 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16140)

(declare-fun a2!699 () array!16140)

(declare-fun arrayRangesEq!1251 (array!16140 array!16140 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!279570 (arrayRangesEq!1251 a1!699 a2!699 (_1!12433 lt!416432) (_2!12433 lt!416432))))

(declare-fun lt!416431 () Unit!19597)

(declare-fun arrayRangesEqSymmetricLemma!158 (array!16140 array!16140 (_ BitVec 32) (_ BitVec 32)) Unit!19597)

(assert (=> b!279570 (= lt!416431 (arrayRangesEqSymmetricLemma!158 a1!699 a2!699 (_1!12433 lt!416432) (_2!12433 lt!416432)))))

(assert (=> b!279570 (arrayRangesEq!1251 a2!699 a1!699 (_1!12433 lt!416432) (_2!12433 lt!416432))))

(declare-fun b!279571 () Bool)

(declare-fun Unit!19600 () Unit!19597)

(assert (=> b!279571 (= e!199320 Unit!19600)))

(declare-fun res!232119 () Bool)

(assert (=> start!62348 (=> (not res!232119) (not e!199321))))

(assert (=> start!62348 (= res!232119 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6983 a1!699) (size!6983 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6983 a1!699))))))))

(assert (=> start!62348 e!199321))

(assert (=> start!62348 true))

(declare-fun array_inv!6707 (array!16140) Bool)

(assert (=> start!62348 (array_inv!6707 a1!699)))

(assert (=> start!62348 (array_inv!6707 a2!699)))

(declare-fun b!279572 () Bool)

(declare-fun res!232118 () Bool)

(assert (=> b!279572 (=> (not res!232118) (not e!199321))))

(assert (=> b!279572 (= res!232118 (bvslt from!822 to!789))))

(declare-fun b!279573 () Bool)

(declare-fun res!232121 () Bool)

(assert (=> b!279573 (=> (not res!232121) (not e!199321))))

(declare-fun arrayBitRangesEq!0 (array!16140 array!16140 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!279573 (= res!232121 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!279574 () Bool)

(assert (=> b!279574 (= e!199322 (not (and (bvsge (_3!1138 lt!416432) #b00000000000000000000000000000000) (bvslt (_3!1138 lt!416432) (size!6983 a2!699)))))))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!279574 (byteRangesEq!0 (select (arr!7979 a1!699) (_3!1138 lt!416432)) (select (arr!7979 a2!699) (_3!1138 lt!416432)) ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and start!62348 res!232119) b!279573))

(assert (= (and b!279573 res!232121) b!279572))

(assert (= (and b!279572 res!232118) b!279569))

(assert (= (and b!279569 c!12897) b!279570))

(assert (= (and b!279569 (not c!12897)) b!279571))

(assert (= (and b!279569 res!232120) b!279574))

(declare-fun m!412599 () Bool)

(assert (=> b!279570 m!412599))

(declare-fun m!412601 () Bool)

(assert (=> b!279570 m!412601))

(declare-fun m!412603 () Bool)

(assert (=> b!279570 m!412603))

(declare-fun m!412605 () Bool)

(assert (=> b!279569 m!412605))

(declare-fun m!412607 () Bool)

(assert (=> b!279574 m!412607))

(declare-fun m!412609 () Bool)

(assert (=> b!279574 m!412609))

(assert (=> b!279574 m!412607))

(assert (=> b!279574 m!412609))

(declare-fun m!412611 () Bool)

(assert (=> b!279574 m!412611))

(declare-fun m!412613 () Bool)

(assert (=> start!62348 m!412613))

(declare-fun m!412615 () Bool)

(assert (=> start!62348 m!412615))

(declare-fun m!412617 () Bool)

(assert (=> b!279573 m!412617))

(check-sat (not start!62348) (not b!279574) (not b!279569) (not b!279570) (not b!279573))
(check-sat)
(get-model)

(declare-fun d!96138 () Bool)

(declare-fun res!232138 () Bool)

(declare-fun e!199343 () Bool)

(assert (=> d!96138 (=> res!232138 e!199343)))

(assert (=> d!96138 (= res!232138 (= (_1!12433 lt!416432) (_2!12433 lt!416432)))))

(assert (=> d!96138 (= (arrayRangesEq!1251 a1!699 a2!699 (_1!12433 lt!416432) (_2!12433 lt!416432)) e!199343)))

(declare-fun b!279597 () Bool)

(declare-fun e!199344 () Bool)

(assert (=> b!279597 (= e!199343 e!199344)))

(declare-fun res!232139 () Bool)

(assert (=> b!279597 (=> (not res!232139) (not e!199344))))

(assert (=> b!279597 (= res!232139 (= (select (arr!7979 a1!699) (_1!12433 lt!416432)) (select (arr!7979 a2!699) (_1!12433 lt!416432))))))

(declare-fun b!279598 () Bool)

(assert (=> b!279598 (= e!199344 (arrayRangesEq!1251 a1!699 a2!699 (bvadd (_1!12433 lt!416432) #b00000000000000000000000000000001) (_2!12433 lt!416432)))))

(assert (= (and d!96138 (not res!232138)) b!279597))

(assert (= (and b!279597 res!232139) b!279598))

(declare-fun m!412639 () Bool)

(assert (=> b!279597 m!412639))

(declare-fun m!412641 () Bool)

(assert (=> b!279597 m!412641))

(declare-fun m!412643 () Bool)

(assert (=> b!279598 m!412643))

(assert (=> b!279570 d!96138))

(declare-fun d!96142 () Bool)

(assert (=> d!96142 (arrayRangesEq!1251 a2!699 a1!699 (_1!12433 lt!416432) (_2!12433 lt!416432))))

(declare-fun lt!416445 () Unit!19597)

(declare-fun choose!468 (array!16140 array!16140 (_ BitVec 32) (_ BitVec 32)) Unit!19597)

(assert (=> d!96142 (= lt!416445 (choose!468 a1!699 a2!699 (_1!12433 lt!416432) (_2!12433 lt!416432)))))

(assert (=> d!96142 (and (bvsle #b00000000000000000000000000000000 (_1!12433 lt!416432)) (bvsle (_1!12433 lt!416432) (_2!12433 lt!416432)) (bvsle (_2!12433 lt!416432) (size!6983 a1!699)))))

(assert (=> d!96142 (= (arrayRangesEqSymmetricLemma!158 a1!699 a2!699 (_1!12433 lt!416432) (_2!12433 lt!416432)) lt!416445)))

(declare-fun bs!24260 () Bool)

(assert (= bs!24260 d!96142))

(assert (=> bs!24260 m!412603))

(declare-fun m!412645 () Bool)

(assert (=> bs!24260 m!412645))

(assert (=> b!279570 d!96142))

(declare-fun d!96148 () Bool)

(declare-fun res!232140 () Bool)

(declare-fun e!199345 () Bool)

(assert (=> d!96148 (=> res!232140 e!199345)))

(assert (=> d!96148 (= res!232140 (= (_1!12433 lt!416432) (_2!12433 lt!416432)))))

(assert (=> d!96148 (= (arrayRangesEq!1251 a2!699 a1!699 (_1!12433 lt!416432) (_2!12433 lt!416432)) e!199345)))

(declare-fun b!279599 () Bool)

(declare-fun e!199346 () Bool)

(assert (=> b!279599 (= e!199345 e!199346)))

(declare-fun res!232141 () Bool)

(assert (=> b!279599 (=> (not res!232141) (not e!199346))))

(assert (=> b!279599 (= res!232141 (= (select (arr!7979 a2!699) (_1!12433 lt!416432)) (select (arr!7979 a1!699) (_1!12433 lt!416432))))))

(declare-fun b!279600 () Bool)

(assert (=> b!279600 (= e!199346 (arrayRangesEq!1251 a2!699 a1!699 (bvadd (_1!12433 lt!416432) #b00000000000000000000000000000001) (_2!12433 lt!416432)))))

(assert (= (and d!96148 (not res!232140)) b!279599))

(assert (= (and b!279599 res!232141) b!279600))

(assert (=> b!279599 m!412641))

(assert (=> b!279599 m!412639))

(declare-fun m!412647 () Bool)

(assert (=> b!279600 m!412647))

(assert (=> b!279570 d!96148))

(declare-fun d!96150 () Bool)

(assert (=> d!96150 (= (array_inv!6707 a1!699) (bvsge (size!6983 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!62348 d!96150))

(declare-fun d!96152 () Bool)

(assert (=> d!96152 (= (array_inv!6707 a2!699) (bvsge (size!6983 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!62348 d!96152))

(declare-fun b!279650 () Bool)

(declare-fun e!199391 () Bool)

(declare-fun e!199395 () Bool)

(assert (=> b!279650 (= e!199391 e!199395)))

(declare-fun res!232182 () Bool)

(assert (=> b!279650 (=> (not res!232182) (not e!199395))))

(declare-fun e!199393 () Bool)

(assert (=> b!279650 (= res!232182 e!199393)))

(declare-fun res!232181 () Bool)

(assert (=> b!279650 (=> res!232181 e!199393)))

(declare-fun lt!416464 () tuple4!716)

(assert (=> b!279650 (= res!232181 (bvsge (_1!12433 lt!416464) (_2!12433 lt!416464)))))

(declare-fun lt!416465 () (_ BitVec 32))

(assert (=> b!279650 (= lt!416465 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!416466 () (_ BitVec 32))

(assert (=> b!279650 (= lt!416466 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!279650 (= lt!416464 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!279651 () Bool)

(declare-fun res!232185 () Bool)

(assert (=> b!279651 (= res!232185 (= lt!416465 #b00000000000000000000000000000000))))

(declare-fun e!199392 () Bool)

(assert (=> b!279651 (=> res!232185 e!199392)))

(declare-fun e!199394 () Bool)

(assert (=> b!279651 (= e!199394 e!199392)))

(declare-fun d!96154 () Bool)

(declare-fun res!232184 () Bool)

(assert (=> d!96154 (=> res!232184 e!199391)))

(assert (=> d!96154 (= res!232184 (bvsge from!822 to!789))))

(assert (=> d!96154 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!199391)))

(declare-fun b!279652 () Bool)

(declare-fun e!199396 () Bool)

(declare-fun call!4577 () Bool)

(assert (=> b!279652 (= e!199396 call!4577)))

(declare-fun c!12906 () Bool)

(declare-fun bm!4574 () Bool)

(assert (=> bm!4574 (= call!4577 (byteRangesEq!0 (ite c!12906 (select (arr!7979 a1!699) (_3!1138 lt!416464)) (select (arr!7979 a1!699) (_4!358 lt!416464))) (ite c!12906 (select (arr!7979 a2!699) (_3!1138 lt!416464)) (select (arr!7979 a2!699) (_4!358 lt!416464))) (ite c!12906 lt!416466 #b00000000000000000000000000000000) lt!416465))))

(declare-fun b!279653 () Bool)

(assert (=> b!279653 (= e!199395 e!199396)))

(assert (=> b!279653 (= c!12906 (= (_3!1138 lt!416464) (_4!358 lt!416464)))))

(declare-fun b!279654 () Bool)

(assert (=> b!279654 (= e!199396 e!199394)))

(declare-fun res!232183 () Bool)

(assert (=> b!279654 (= res!232183 (byteRangesEq!0 (select (arr!7979 a1!699) (_3!1138 lt!416464)) (select (arr!7979 a2!699) (_3!1138 lt!416464)) lt!416466 #b00000000000000000000000000001000))))

(assert (=> b!279654 (=> (not res!232183) (not e!199394))))

(declare-fun b!279655 () Bool)

(assert (=> b!279655 (= e!199392 call!4577)))

(declare-fun b!279656 () Bool)

(assert (=> b!279656 (= e!199393 (arrayRangesEq!1251 a1!699 a2!699 (_1!12433 lt!416464) (_2!12433 lt!416464)))))

(assert (= (and d!96154 (not res!232184)) b!279650))

(assert (= (and b!279650 (not res!232181)) b!279656))

(assert (= (and b!279650 res!232182) b!279653))

(assert (= (and b!279653 c!12906) b!279652))

(assert (= (and b!279653 (not c!12906)) b!279654))

(assert (= (and b!279654 res!232183) b!279651))

(assert (= (and b!279651 (not res!232185)) b!279655))

(assert (= (or b!279652 b!279655) bm!4574))

(assert (=> b!279650 m!412605))

(declare-fun m!412683 () Bool)

(assert (=> bm!4574 m!412683))

(declare-fun m!412685 () Bool)

(assert (=> bm!4574 m!412685))

(declare-fun m!412687 () Bool)

(assert (=> bm!4574 m!412687))

(declare-fun m!412689 () Bool)

(assert (=> bm!4574 m!412689))

(declare-fun m!412691 () Bool)

(assert (=> bm!4574 m!412691))

(assert (=> b!279654 m!412685))

(assert (=> b!279654 m!412691))

(assert (=> b!279654 m!412685))

(assert (=> b!279654 m!412691))

(declare-fun m!412693 () Bool)

(assert (=> b!279654 m!412693))

(declare-fun m!412695 () Bool)

(assert (=> b!279656 m!412695))

(assert (=> b!279573 d!96154))

(declare-fun d!96178 () Bool)

(assert (=> d!96178 (= (byteRangesEq!0 (select (arr!7979 a1!699) (_3!1138 lt!416432)) (select (arr!7979 a2!699) (_3!1138 lt!416432)) ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000))) (or (= ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000))) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7979 a1!699) (_3!1138 lt!416432))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7979 a2!699) (_3!1138 lt!416432))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111))))))

(declare-fun bs!24265 () Bool)

(assert (= bs!24265 d!96178))

(declare-fun m!412705 () Bool)

(assert (=> bs!24265 m!412705))

(declare-fun m!412707 () Bool)

(assert (=> bs!24265 m!412707))

(assert (=> b!279574 d!96178))

(declare-fun d!96184 () Bool)

(assert (=> d!96184 (= (arrayBitIndices!0 from!822 to!789) (tuple4!717 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!279569 d!96184))

(check-sat (not b!279598) (not b!279656) (not d!96142) (not bm!4574) (not b!279650) (not b!279654) (not b!279600))
(check-sat)
