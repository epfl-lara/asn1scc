; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62346 () Bool)

(assert start!62346)

(declare-fun b!279551 () Bool)

(declare-fun e!199305 () Bool)

(declare-datatypes ((tuple4!714 0))(
  ( (tuple4!715 (_1!12432 (_ BitVec 32)) (_2!12432 (_ BitVec 32)) (_3!1137 (_ BitVec 32)) (_4!357 (_ BitVec 32))) )
))
(declare-fun lt!416423 () tuple4!714)

(declare-datatypes ((array!16138 0))(
  ( (array!16139 (arr!7978 (Array (_ BitVec 32) (_ BitVec 8))) (size!6982 (_ BitVec 32))) )
))
(declare-fun a2!699 () array!16138)

(assert (=> b!279551 (= e!199305 (not (and (bvsge (_3!1137 lt!416423) #b00000000000000000000000000000000) (bvslt (_3!1137 lt!416423) (size!6982 a2!699)))))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun a1!699 () array!16138)

(declare-fun to!789 () (_ BitVec 64))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!279551 (byteRangesEq!0 (select (arr!7978 a1!699) (_3!1137 lt!416423)) (select (arr!7978 a2!699) (_3!1137 lt!416423)) ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!279552 () Bool)

(declare-fun res!232107 () Bool)

(declare-fun e!199307 () Bool)

(assert (=> b!279552 (=> (not res!232107) (not e!199307))))

(assert (=> b!279552 (= res!232107 (bvslt from!822 to!789))))

(declare-fun b!279553 () Bool)

(declare-fun res!232108 () Bool)

(assert (=> b!279553 (=> (not res!232108) (not e!199307))))

(declare-fun arrayBitRangesEq!0 (array!16138 array!16138 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!279553 (= res!232108 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!279554 () Bool)

(assert (=> b!279554 (= e!199307 e!199305)))

(declare-fun res!232109 () Bool)

(assert (=> b!279554 (=> (not res!232109) (not e!199305))))

(assert (=> b!279554 (= res!232109 (= (_3!1137 lt!416423) (_4!357 lt!416423)))))

(declare-datatypes ((Unit!19593 0))(
  ( (Unit!19594) )
))
(declare-fun lt!416422 () Unit!19593)

(declare-fun e!199306 () Unit!19593)

(assert (=> b!279554 (= lt!416422 e!199306)))

(declare-fun c!12894 () Bool)

(assert (=> b!279554 (= c!12894 (bvslt (_1!12432 lt!416423) (_2!12432 lt!416423)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!714)

(assert (=> b!279554 (= lt!416423 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!279555 () Bool)

(declare-fun Unit!19595 () Unit!19593)

(assert (=> b!279555 (= e!199306 Unit!19595)))

(declare-fun b!279556 () Bool)

(declare-fun Unit!19596 () Unit!19593)

(assert (=> b!279556 (= e!199306 Unit!19596)))

(declare-fun arrayRangesEq!1250 (array!16138 array!16138 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!279556 (arrayRangesEq!1250 a1!699 a2!699 (_1!12432 lt!416423) (_2!12432 lt!416423))))

(declare-fun lt!416424 () Unit!19593)

(declare-fun arrayRangesEqSymmetricLemma!157 (array!16138 array!16138 (_ BitVec 32) (_ BitVec 32)) Unit!19593)

(assert (=> b!279556 (= lt!416424 (arrayRangesEqSymmetricLemma!157 a1!699 a2!699 (_1!12432 lt!416423) (_2!12432 lt!416423)))))

(assert (=> b!279556 (arrayRangesEq!1250 a2!699 a1!699 (_1!12432 lt!416423) (_2!12432 lt!416423))))

(declare-fun res!232106 () Bool)

(assert (=> start!62346 (=> (not res!232106) (not e!199307))))

(assert (=> start!62346 (= res!232106 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6982 a1!699) (size!6982 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6982 a1!699))))))))

(assert (=> start!62346 e!199307))

(assert (=> start!62346 true))

(declare-fun array_inv!6706 (array!16138) Bool)

(assert (=> start!62346 (array_inv!6706 a1!699)))

(assert (=> start!62346 (array_inv!6706 a2!699)))

(assert (= (and start!62346 res!232106) b!279553))

(assert (= (and b!279553 res!232108) b!279552))

(assert (= (and b!279552 res!232107) b!279554))

(assert (= (and b!279554 c!12894) b!279556))

(assert (= (and b!279554 (not c!12894)) b!279555))

(assert (= (and b!279554 res!232109) b!279551))

(declare-fun m!412579 () Bool)

(assert (=> start!62346 m!412579))

(declare-fun m!412581 () Bool)

(assert (=> start!62346 m!412581))

(declare-fun m!412583 () Bool)

(assert (=> b!279553 m!412583))

(declare-fun m!412585 () Bool)

(assert (=> b!279556 m!412585))

(declare-fun m!412587 () Bool)

(assert (=> b!279556 m!412587))

(declare-fun m!412589 () Bool)

(assert (=> b!279556 m!412589))

(declare-fun m!412591 () Bool)

(assert (=> b!279551 m!412591))

(declare-fun m!412593 () Bool)

(assert (=> b!279551 m!412593))

(assert (=> b!279551 m!412591))

(assert (=> b!279551 m!412593))

(declare-fun m!412595 () Bool)

(assert (=> b!279551 m!412595))

(declare-fun m!412597 () Bool)

(assert (=> b!279554 m!412597))

(push 1)

(assert (not start!62346))

(assert (not b!279554))

(assert (not b!279551))

(assert (not b!279556))

(assert (not b!279553))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!96140 () Bool)

(assert (=> d!96140 (= (array_inv!6706 a1!699) (bvsge (size!6982 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!62346 d!96140))

(declare-fun d!96144 () Bool)

(assert (=> d!96144 (= (array_inv!6706 a2!699) (bvsge (size!6982 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!62346 d!96144))

(declare-fun b!279615 () Bool)

(declare-fun e!199361 () Bool)

(declare-fun e!199359 () Bool)

(assert (=> b!279615 (= e!199361 e!199359)))

(declare-fun lt!416452 () (_ BitVec 32))

(declare-fun res!232154 () Bool)

(declare-fun lt!416454 () tuple4!714)

(assert (=> b!279615 (= res!232154 (byteRangesEq!0 (select (arr!7978 a1!699) (_3!1137 lt!416454)) (select (arr!7978 a2!699) (_3!1137 lt!416454)) lt!416452 #b00000000000000000000000000001000))))

(assert (=> b!279615 (=> (not res!232154) (not e!199359))))

(declare-fun b!279616 () Bool)

(declare-fun e!199362 () Bool)

(assert (=> b!279616 (= e!199362 e!199361)))

(declare-fun c!12903 () Bool)

(assert (=> b!279616 (= c!12903 (= (_3!1137 lt!416454) (_4!357 lt!416454)))))

(declare-fun b!279617 () Bool)

(declare-fun e!199360 () Bool)

(assert (=> b!279617 (= e!199360 e!199362)))

(declare-fun res!232155 () Bool)

(assert (=> b!279617 (=> (not res!232155) (not e!199362))))

(declare-fun e!199364 () Bool)

(assert (=> b!279617 (= res!232155 e!199364)))

(declare-fun res!232156 () Bool)

(assert (=> b!279617 (=> res!232156 e!199364)))

(assert (=> b!279617 (= res!232156 (bvsge (_1!12432 lt!416454) (_2!12432 lt!416454)))))

(declare-fun lt!416453 () (_ BitVec 32))

(assert (=> b!279617 (= lt!416453 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!279617 (= lt!416452 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!279617 (= lt!416454 (arrayBitIndices!0 from!822 to!789))))

(declare-fun d!96146 () Bool)

(declare-fun res!232152 () Bool)

(assert (=> d!96146 (=> res!232152 e!199360)))

(assert (=> d!96146 (= res!232152 (bvsge from!822 to!789))))

(assert (=> d!96146 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!199360)))

(declare-fun b!279618 () Bool)

(assert (=> b!279618 (= e!199364 (arrayRangesEq!1250 a1!699 a2!699 (_1!12432 lt!416454) (_2!12432 lt!416454)))))

(declare-fun b!279619 () Bool)

(declare-fun e!199363 () Bool)

(declare-fun call!4574 () Bool)

(assert (=> b!279619 (= e!199363 call!4574)))

(declare-fun bm!4571 () Bool)

(assert (=> bm!4571 (= call!4574 (byteRangesEq!0 (ite c!12903 (select (arr!7978 a1!699) (_3!1137 lt!416454)) (select (arr!7978 a1!699) (_4!357 lt!416454))) (ite c!12903 (select (arr!7978 a2!699) (_3!1137 lt!416454)) (select (arr!7978 a2!699) (_4!357 lt!416454))) (ite c!12903 lt!416452 #b00000000000000000000000000000000) lt!416453))))

(declare-fun b!279620 () Bool)

(assert (=> b!279620 (= e!199361 call!4574)))

(declare-fun b!279621 () Bool)

(declare-fun res!232153 () Bool)

(assert (=> b!279621 (= res!232153 (= lt!416453 #b00000000000000000000000000000000))))

(assert (=> b!279621 (=> res!232153 e!199363)))

(assert (=> b!279621 (= e!199359 e!199363)))

(assert (= (and d!96146 (not res!232152)) b!279617))

(assert (= (and b!279617 (not res!232156)) b!279618))

(assert (= (and b!279617 res!232155) b!279616))

(assert (= (and b!279616 c!12903) b!279620))

(assert (= (and b!279616 (not c!12903)) b!279615))

(assert (= (and b!279615 res!232154) b!279621))

(assert (= (and b!279621 (not res!232153)) b!279619))

(assert (= (or b!279620 b!279619) bm!4571))

(declare-fun m!412649 () Bool)

(assert (=> b!279615 m!412649))

(declare-fun m!412651 () Bool)

(assert (=> b!279615 m!412651))

(assert (=> b!279615 m!412649))

(assert (=> b!279615 m!412651))

(declare-fun m!412653 () Bool)

(assert (=> b!279615 m!412653))

(assert (=> b!279617 m!412597))

(declare-fun m!412655 () Bool)

(assert (=> b!279618 m!412655))

(assert (=> bm!4571 m!412649))

(assert (=> bm!4571 m!412651))

(declare-fun m!412657 () Bool)

(assert (=> bm!4571 m!412657))

(declare-fun m!412659 () Bool)

(assert (=> bm!4571 m!412659))

(declare-fun m!412661 () Bool)

(assert (=> bm!4571 m!412661))

(assert (=> b!279553 d!96146))

(declare-fun d!96158 () Bool)

(assert (=> d!96158 (= (arrayBitIndices!0 from!822 to!789) (tuple4!715 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!279554 d!96158))

(declare-fun d!96164 () Bool)

(declare-fun res!232161 () Bool)

(declare-fun e!199369 () Bool)

(assert (=> d!96164 (=> res!232161 e!199369)))

(assert (=> d!96164 (= res!232161 (= (_1!12432 lt!416423) (_2!12432 lt!416423)))))

(assert (=> d!96164 (= (arrayRangesEq!1250 a1!699 a2!699 (_1!12432 lt!416423) (_2!12432 lt!416423)) e!199369)))

(declare-fun b!279626 () Bool)

(declare-fun e!199370 () Bool)

(assert (=> b!279626 (= e!199369 e!199370)))

(declare-fun res!232162 () Bool)

(assert (=> b!279626 (=> (not res!232162) (not e!199370))))

(assert (=> b!279626 (= res!232162 (= (select (arr!7978 a1!699) (_1!12432 lt!416423)) (select (arr!7978 a2!699) (_1!12432 lt!416423))))))

(declare-fun b!279627 () Bool)

(assert (=> b!279627 (= e!199370 (arrayRangesEq!1250 a1!699 a2!699 (bvadd (_1!12432 lt!416423) #b00000000000000000000000000000001) (_2!12432 lt!416423)))))

(assert (= (and d!96164 (not res!232161)) b!279626))

(assert (= (and b!279626 res!232162) b!279627))

(declare-fun m!412663 () Bool)

(assert (=> b!279626 m!412663))

(declare-fun m!412665 () Bool)

(assert (=> b!279626 m!412665))

(declare-fun m!412667 () Bool)

(assert (=> b!279627 m!412667))

(assert (=> b!279556 d!96164))

(declare-fun d!96166 () Bool)

(assert (=> d!96166 (arrayRangesEq!1250 a2!699 a1!699 (_1!12432 lt!416423) (_2!12432 lt!416423))))

(declare-fun lt!416463 () Unit!19593)

(declare-fun choose!467 (array!16138 array!16138 (_ BitVec 32) (_ BitVec 32)) Unit!19593)

(assert (=> d!96166 (= lt!416463 (choose!467 a1!699 a2!699 (_1!12432 lt!416423) (_2!12432 lt!416423)))))

(assert (=> d!96166 (and (bvsle #b00000000000000000000000000000000 (_1!12432 lt!416423)) (bvsle (_1!12432 lt!416423) (_2!12432 lt!416423)) (bvsle (_2!12432 lt!416423) (size!6982 a1!699)))))

(assert (=> d!96166 (= (arrayRangesEqSymmetricLemma!157 a1!699 a2!699 (_1!12432 lt!416423) (_2!12432 lt!416423)) lt!416463)))

(declare-fun bs!24262 () Bool)

(assert (= bs!24262 d!96166))

(assert (=> bs!24262 m!412589))

(declare-fun m!412673 () Bool)

(assert (=> bs!24262 m!412673))

(assert (=> b!279556 d!96166))

(declare-fun d!96170 () Bool)

(declare-fun res!232173 () Bool)

(declare-fun e!199383 () Bool)

(assert (=> d!96170 (=> res!232173 e!199383)))

(assert (=> d!96170 (= res!232173 (= (_1!12432 lt!416423) (_2!12432 lt!416423)))))

(assert (=> d!96170 (= (arrayRangesEq!1250 a2!699 a1!699 (_1!12432 lt!416423) (_2!12432 lt!416423)) e!199383)))

(declare-fun b!279642 () Bool)

(declare-fun e!199384 () Bool)

(assert (=> b!279642 (= e!199383 e!199384)))

(declare-fun res!232174 () Bool)

(assert (=> b!279642 (=> (not res!232174) (not e!199384))))

(assert (=> b!279642 (= res!232174 (= (select (arr!7978 a2!699) (_1!12432 lt!416423)) (select (arr!7978 a1!699) (_1!12432 lt!416423))))))

(declare-fun b!279643 () Bool)

(assert (=> b!279643 (= e!199384 (arrayRangesEq!1250 a2!699 a1!699 (bvadd (_1!12432 lt!416423) #b00000000000000000000000000000001) (_2!12432 lt!416423)))))

(assert (= (and d!96170 (not res!232173)) b!279642))

(assert (= (and b!279642 res!232174) b!279643))

(assert (=> b!279642 m!412665))

(assert (=> b!279642 m!412663))

(declare-fun m!412675 () Bool)

(assert (=> b!279643 m!412675))

(assert (=> b!279556 d!96170))

(declare-fun d!96172 () Bool)

(assert (=> d!96172 (= (byteRangesEq!0 (select (arr!7978 a1!699) (_3!1137 lt!416423)) (select (arr!7978 a2!699) (_3!1137 lt!416423)) ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000))) (or (= ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000))) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7978 a1!699) (_3!1137 lt!416423))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7978 a2!699) (_3!1137 lt!416423))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111))))))

(declare-fun bs!24263 () Bool)

(assert (= bs!24263 d!96172))

(declare-fun m!412697 () Bool)

(assert (=> bs!24263 m!412697))

(declare-fun m!412699 () Bool)

(assert (=> bs!24263 m!412699))

(assert (=> b!279551 d!96172))

(push 1)

(assert (not b!279643))

(assert (not b!279627))

(assert (not b!279617))

(assert (not d!96166))

(assert (not bm!4571))

(assert (not b!279618))

(assert (not b!279615))

(check-sat)

(pop 1)

(push 1)

(check-sat)

