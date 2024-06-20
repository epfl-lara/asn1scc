; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62472 () Bool)

(assert start!62472)

(declare-fun res!232427 () Bool)

(declare-fun e!199675 () Bool)

(assert (=> start!62472 (=> (not res!232427) (not e!199675))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!16165 0))(
  ( (array!16166 (arr!7987 (Array (_ BitVec 32) (_ BitVec 8))) (size!6991 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16165)

(declare-fun a2!699 () array!16165)

(declare-fun to!789 () (_ BitVec 64))

(assert (=> start!62472 (= res!232427 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6991 a1!699) (size!6991 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6991 a1!699))))))))

(assert (=> start!62472 e!199675))

(assert (=> start!62472 true))

(declare-fun array_inv!6715 (array!16165) Bool)

(assert (=> start!62472 (array_inv!6715 a1!699)))

(assert (=> start!62472 (array_inv!6715 a2!699)))

(declare-fun b!279976 () Bool)

(declare-datatypes ((Unit!19629 0))(
  ( (Unit!19630) )
))
(declare-fun e!199679 () Unit!19629)

(declare-fun Unit!19631 () Unit!19629)

(assert (=> b!279976 (= e!199679 Unit!19631)))

(declare-fun e!199677 () Bool)

(declare-fun b!279977 () Bool)

(declare-fun arrayBitRangesEq!0 (array!16165 array!16165 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!279977 (= e!199677 (arrayBitRangesEq!0 a2!699 a1!699 from!822 to!789))))

(declare-fun b!279978 () Bool)

(declare-fun Unit!19632 () Unit!19629)

(assert (=> b!279978 (= e!199679 Unit!19632)))

(declare-datatypes ((tuple4!732 0))(
  ( (tuple4!733 (_1!12441 (_ BitVec 32)) (_2!12441 (_ BitVec 32)) (_3!1146 (_ BitVec 32)) (_4!366 (_ BitVec 32))) )
))
(declare-fun lt!416637 () tuple4!732)

(declare-fun arrayRangesEq!1259 (array!16165 array!16165 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!279978 (arrayRangesEq!1259 a1!699 a2!699 (_1!12441 lt!416637) (_2!12441 lt!416637))))

(declare-fun lt!416633 () Unit!19629)

(declare-fun arrayRangesEqSymmetricLemma!166 (array!16165 array!16165 (_ BitVec 32) (_ BitVec 32)) Unit!19629)

(assert (=> b!279978 (= lt!416633 (arrayRangesEqSymmetricLemma!166 a1!699 a2!699 (_1!12441 lt!416637) (_2!12441 lt!416637)))))

(assert (=> b!279978 (arrayRangesEq!1259 a2!699 a1!699 (_1!12441 lt!416637) (_2!12441 lt!416637))))

(declare-fun b!279979 () Bool)

(declare-fun e!199678 () Bool)

(assert (=> b!279979 (= e!199675 e!199678)))

(declare-fun res!232424 () Bool)

(assert (=> b!279979 (=> (not res!232424) (not e!199678))))

(assert (=> b!279979 (= res!232424 (= (_3!1146 lt!416637) (_4!366 lt!416637)))))

(declare-fun lt!416634 () Unit!19629)

(assert (=> b!279979 (= lt!416634 e!199679)))

(declare-fun c!12948 () Bool)

(assert (=> b!279979 (= c!12948 (bvslt (_1!12441 lt!416637) (_2!12441 lt!416637)))))

(declare-fun lt!416636 () (_ BitVec 32))

(assert (=> b!279979 (= lt!416636 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!416635 () (_ BitVec 32))

(assert (=> b!279979 (= lt!416635 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!732)

(assert (=> b!279979 (= lt!416637 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!279980 () Bool)

(declare-fun res!232426 () Bool)

(assert (=> b!279980 (=> (not res!232426) (not e!199675))))

(assert (=> b!279980 (= res!232426 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!279981 () Bool)

(declare-fun res!232425 () Bool)

(assert (=> b!279981 (=> (not res!232425) (not e!199675))))

(assert (=> b!279981 (= res!232425 (bvslt from!822 to!789))))

(declare-fun b!279982 () Bool)

(assert (=> b!279982 (= e!199678 (not e!199677))))

(declare-fun res!232423 () Bool)

(assert (=> b!279982 (=> res!232423 e!199677)))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!279982 (= res!232423 (not (byteRangesEq!0 (select (arr!7987 a2!699) (_3!1146 lt!416637)) (select (arr!7987 a1!699) (_3!1146 lt!416637)) lt!416635 lt!416636)))))

(assert (=> b!279982 (byteRangesEq!0 (select (arr!7987 a1!699) (_3!1146 lt!416637)) (select (arr!7987 a2!699) (_3!1146 lt!416637)) lt!416635 lt!416636)))

(assert (= (and start!62472 res!232427) b!279980))

(assert (= (and b!279980 res!232426) b!279981))

(assert (= (and b!279981 res!232425) b!279979))

(assert (= (and b!279979 c!12948) b!279978))

(assert (= (and b!279979 (not c!12948)) b!279976))

(assert (= (and b!279979 res!232424) b!279982))

(assert (= (and b!279982 (not res!232423)) b!279977))

(declare-fun m!412989 () Bool)

(assert (=> b!279979 m!412989))

(declare-fun m!412991 () Bool)

(assert (=> b!279978 m!412991))

(declare-fun m!412993 () Bool)

(assert (=> b!279978 m!412993))

(declare-fun m!412995 () Bool)

(assert (=> b!279978 m!412995))

(declare-fun m!412997 () Bool)

(assert (=> b!279982 m!412997))

(declare-fun m!412999 () Bool)

(assert (=> b!279982 m!412999))

(assert (=> b!279982 m!412997))

(assert (=> b!279982 m!412999))

(declare-fun m!413001 () Bool)

(assert (=> b!279982 m!413001))

(assert (=> b!279982 m!412999))

(assert (=> b!279982 m!412997))

(declare-fun m!413003 () Bool)

(assert (=> b!279982 m!413003))

(declare-fun m!413005 () Bool)

(assert (=> b!279977 m!413005))

(declare-fun m!413007 () Bool)

(assert (=> start!62472 m!413007))

(declare-fun m!413009 () Bool)

(assert (=> start!62472 m!413009))

(declare-fun m!413011 () Bool)

(assert (=> b!279980 m!413011))

(push 1)

(assert (not b!279977))

(assert (not start!62472))

(assert (not b!279979))

(assert (not b!279980))

(assert (not b!279978))

(assert (not b!279982))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!96314 () Bool)

(assert (=> d!96314 (= (byteRangesEq!0 (select (arr!7987 a2!699) (_3!1146 lt!416637)) (select (arr!7987 a1!699) (_3!1146 lt!416637)) lt!416635 lt!416636) (or (= lt!416635 lt!416636) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7987 a2!699) (_3!1146 lt!416637))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!416636))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!416635)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7987 a1!699) (_3!1146 lt!416637))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!416636))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!416635)))) #b00000000000000000000000011111111))))))

(declare-fun bs!24293 () Bool)

(assert (= bs!24293 d!96314))

(declare-fun m!413103 () Bool)

(assert (=> bs!24293 m!413103))

(declare-fun m!413105 () Bool)

(assert (=> bs!24293 m!413105))

(assert (=> b!279982 d!96314))

(declare-fun d!96316 () Bool)

(assert (=> d!96316 (= (byteRangesEq!0 (select (arr!7987 a1!699) (_3!1146 lt!416637)) (select (arr!7987 a2!699) (_3!1146 lt!416637)) lt!416635 lt!416636) (or (= lt!416635 lt!416636) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7987 a1!699) (_3!1146 lt!416637))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!416636))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!416635)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7987 a2!699) (_3!1146 lt!416637))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!416636))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!416635)))) #b00000000000000000000000011111111))))))

(declare-fun bs!24294 () Bool)

(assert (= bs!24294 d!96316))

(assert (=> bs!24294 m!413103))

(assert (=> bs!24294 m!413105))

(assert (=> b!279982 d!96316))

(declare-fun b!280075 () Bool)

(declare-fun e!199761 () Bool)

(declare-fun lt!416690 () tuple4!732)

(assert (=> b!280075 (= e!199761 (arrayRangesEq!1259 a2!699 a1!699 (_1!12441 lt!416690) (_2!12441 lt!416690)))))

(declare-fun b!280076 () Bool)

(declare-fun e!199762 () Bool)

(declare-fun e!199765 () Bool)

(assert (=> b!280076 (= e!199762 e!199765)))

(declare-fun res!232496 () Bool)

(declare-fun call!4605 () Bool)

(assert (=> b!280076 (= res!232496 call!4605)))

(assert (=> b!280076 (=> (not res!232496) (not e!199765))))

(declare-fun b!280077 () Bool)

(declare-fun res!232499 () Bool)

(declare-fun lt!416689 () (_ BitVec 32))

(assert (=> b!280077 (= res!232499 (= lt!416689 #b00000000000000000000000000000000))))

(declare-fun e!199764 () Bool)

(assert (=> b!280077 (=> res!232499 e!199764)))

(assert (=> b!280077 (= e!199765 e!199764)))

(declare-fun d!96318 () Bool)

(declare-fun res!232500 () Bool)

(declare-fun e!199766 () Bool)

(assert (=> d!96318 (=> res!232500 e!199766)))

(assert (=> d!96318 (= res!232500 (bvsge from!822 to!789))))

(assert (=> d!96318 (= (arrayBitRangesEq!0 a2!699 a1!699 from!822 to!789) e!199766)))

(declare-fun b!280078 () Bool)

(assert (=> b!280078 (= e!199764 (byteRangesEq!0 (select (arr!7987 a2!699) (_4!366 lt!416690)) (select (arr!7987 a1!699) (_4!366 lt!416690)) #b00000000000000000000000000000000 lt!416689))))

(declare-fun b!280079 () Bool)

(declare-fun e!199763 () Bool)

(assert (=> b!280079 (= e!199766 e!199763)))

(declare-fun res!232497 () Bool)

(assert (=> b!280079 (=> (not res!232497) (not e!199763))))

(assert (=> b!280079 (= res!232497 e!199761)))

(declare-fun res!232498 () Bool)

(assert (=> b!280079 (=> res!232498 e!199761)))

(assert (=> b!280079 (= res!232498 (bvsge (_1!12441 lt!416690) (_2!12441 lt!416690)))))

(assert (=> b!280079 (= lt!416689 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!416691 () (_ BitVec 32))

(assert (=> b!280079 (= lt!416691 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!280079 (= lt!416690 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!280080 () Bool)

(assert (=> b!280080 (= e!199762 call!4605)))

(declare-fun b!280081 () Bool)

(assert (=> b!280081 (= e!199763 e!199762)))

(declare-fun c!12961 () Bool)

(assert (=> b!280081 (= c!12961 (= (_3!1146 lt!416690) (_4!366 lt!416690)))))

(declare-fun bm!4602 () Bool)

(assert (=> bm!4602 (= call!4605 (byteRangesEq!0 (select (arr!7987 a2!699) (_3!1146 lt!416690)) (select (arr!7987 a1!699) (_3!1146 lt!416690)) lt!416691 (ite c!12961 lt!416689 #b00000000000000000000000000001000)))))

(assert (= (and d!96318 (not res!232500)) b!280079))

(assert (= (and b!280079 (not res!232498)) b!280075))

(assert (= (and b!280079 res!232497) b!280081))

(assert (= (and b!280081 c!12961) b!280080))

(assert (= (and b!280081 (not c!12961)) b!280076))

(assert (= (and b!280076 res!232496) b!280077))

(assert (= (and b!280077 (not res!232499)) b!280078))

(assert (= (or b!280080 b!280076) bm!4602))

(declare-fun m!413107 () Bool)

(assert (=> b!280075 m!413107))

(declare-fun m!413109 () Bool)

(assert (=> b!280078 m!413109))

(declare-fun m!413111 () Bool)

(assert (=> b!280078 m!413111))

(assert (=> b!280078 m!413109))

(assert (=> b!280078 m!413111))

(declare-fun m!413113 () Bool)

(assert (=> b!280078 m!413113))

(assert (=> b!280079 m!412989))

(declare-fun m!413115 () Bool)

(assert (=> bm!4602 m!413115))

(declare-fun m!413117 () Bool)

(assert (=> bm!4602 m!413117))

(assert (=> bm!4602 m!413115))

(assert (=> bm!4602 m!413117))

(declare-fun m!413119 () Bool)

(assert (=> bm!4602 m!413119))

(assert (=> b!279977 d!96318))

(declare-fun d!96320 () Bool)

(assert (=> d!96320 (= (arrayBitIndices!0 from!822 to!789) (tuple4!733 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!279979 d!96320))

(declare-fun b!280082 () Bool)

(declare-fun e!199767 () Bool)

(declare-fun lt!416693 () tuple4!732)

(assert (=> b!280082 (= e!199767 (arrayRangesEq!1259 a1!699 a2!699 (_1!12441 lt!416693) (_2!12441 lt!416693)))))

(declare-fun b!280083 () Bool)

(declare-fun e!199768 () Bool)

(declare-fun e!199771 () Bool)

(assert (=> b!280083 (= e!199768 e!199771)))

(declare-fun res!232501 () Bool)

(declare-fun call!4606 () Bool)

(assert (=> b!280083 (= res!232501 call!4606)))

(assert (=> b!280083 (=> (not res!232501) (not e!199771))))

(declare-fun b!280084 () Bool)

(declare-fun res!232504 () Bool)

(declare-fun lt!416692 () (_ BitVec 32))

(assert (=> b!280084 (= res!232504 (= lt!416692 #b00000000000000000000000000000000))))

(declare-fun e!199770 () Bool)

(assert (=> b!280084 (=> res!232504 e!199770)))

(assert (=> b!280084 (= e!199771 e!199770)))

(declare-fun d!96322 () Bool)

(declare-fun res!232505 () Bool)

(declare-fun e!199772 () Bool)

(assert (=> d!96322 (=> res!232505 e!199772)))

(assert (=> d!96322 (= res!232505 (bvsge from!822 to!789))))

(assert (=> d!96322 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!199772)))

(declare-fun b!280085 () Bool)

(assert (=> b!280085 (= e!199770 (byteRangesEq!0 (select (arr!7987 a1!699) (_4!366 lt!416693)) (select (arr!7987 a2!699) (_4!366 lt!416693)) #b00000000000000000000000000000000 lt!416692))))

(declare-fun b!280086 () Bool)

(declare-fun e!199769 () Bool)

(assert (=> b!280086 (= e!199772 e!199769)))

(declare-fun res!232502 () Bool)

(assert (=> b!280086 (=> (not res!232502) (not e!199769))))

(assert (=> b!280086 (= res!232502 e!199767)))

(declare-fun res!232503 () Bool)

(assert (=> b!280086 (=> res!232503 e!199767)))

(assert (=> b!280086 (= res!232503 (bvsge (_1!12441 lt!416693) (_2!12441 lt!416693)))))

(assert (=> b!280086 (= lt!416692 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!416694 () (_ BitVec 32))

(assert (=> b!280086 (= lt!416694 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!280086 (= lt!416693 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!280087 () Bool)

(assert (=> b!280087 (= e!199768 call!4606)))

(declare-fun b!280088 () Bool)

(assert (=> b!280088 (= e!199769 e!199768)))

(declare-fun c!12962 () Bool)

(assert (=> b!280088 (= c!12962 (= (_3!1146 lt!416693) (_4!366 lt!416693)))))

(declare-fun bm!4603 () Bool)

(assert (=> bm!4603 (= call!4606 (byteRangesEq!0 (select (arr!7987 a1!699) (_3!1146 lt!416693)) (select (arr!7987 a2!699) (_3!1146 lt!416693)) lt!416694 (ite c!12962 lt!416692 #b00000000000000000000000000001000)))))

(assert (= (and d!96322 (not res!232505)) b!280086))

(assert (= (and b!280086 (not res!232503)) b!280082))

(assert (= (and b!280086 res!232502) b!280088))

(assert (= (and b!280088 c!12962) b!280087))

(assert (= (and b!280088 (not c!12962)) b!280083))

(assert (= (and b!280083 res!232501) b!280084))

(assert (= (and b!280084 (not res!232504)) b!280085))

(assert (= (or b!280087 b!280083) bm!4603))

(declare-fun m!413121 () Bool)

(assert (=> b!280082 m!413121))

(declare-fun m!413123 () Bool)

(assert (=> b!280085 m!413123))

(declare-fun m!413125 () Bool)

(assert (=> b!280085 m!413125))

(assert (=> b!280085 m!413123))

(assert (=> b!280085 m!413125))

(declare-fun m!413127 () Bool)

(assert (=> b!280085 m!413127))

(assert (=> b!280086 m!412989))

(declare-fun m!413129 () Bool)

(assert (=> bm!4603 m!413129))

(declare-fun m!413131 () Bool)

(assert (=> bm!4603 m!413131))

(assert (=> bm!4603 m!413129))

(assert (=> bm!4603 m!413131))

(declare-fun m!413133 () Bool)

(assert (=> bm!4603 m!413133))

(assert (=> b!279980 d!96322))

(declare-fun d!96324 () Bool)

(assert (=> d!96324 (= (array_inv!6715 a1!699) (bvsge (size!6991 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!62472 d!96324))

(declare-fun d!96326 () Bool)

(assert (=> d!96326 (= (array_inv!6715 a2!699) (bvsge (size!6991 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!62472 d!96326))

(declare-fun d!96328 () Bool)

(declare-fun res!232510 () Bool)

(declare-fun e!199777 () Bool)

(assert (=> d!96328 (=> res!232510 e!199777)))

(assert (=> d!96328 (= res!232510 (= (_1!12441 lt!416637) (_2!12441 lt!416637)))))

(assert (=> d!96328 (= (arrayRangesEq!1259 a1!699 a2!699 (_1!12441 lt!416637) (_2!12441 lt!416637)) e!199777)))

(declare-fun b!280093 () Bool)

(declare-fun e!199778 () Bool)

(assert (=> b!280093 (= e!199777 e!199778)))

(declare-fun res!232511 () Bool)

(assert (=> b!280093 (=> (not res!232511) (not e!199778))))

(assert (=> b!280093 (= res!232511 (= (select (arr!7987 a1!699) (_1!12441 lt!416637)) (select (arr!7987 a2!699) (_1!12441 lt!416637))))))

(declare-fun b!280094 () Bool)

(assert (=> b!280094 (= e!199778 (arrayRangesEq!1259 a1!699 a2!699 (bvadd (_1!12441 lt!416637) #b00000000000000000000000000000001) (_2!12441 lt!416637)))))

(assert (= (and d!96328 (not res!232510)) b!280093))

(assert (= (and b!280093 res!232511) b!280094))

(declare-fun m!413135 () Bool)

(assert (=> b!280093 m!413135))

(declare-fun m!413137 () Bool)

(assert (=> b!280093 m!413137))

(declare-fun m!413139 () Bool)

(assert (=> b!280094 m!413139))

(assert (=> b!279978 d!96328))

(declare-fun d!96330 () Bool)

(assert (=> d!96330 (arrayRangesEq!1259 a2!699 a1!699 (_1!12441 lt!416637) (_2!12441 lt!416637))))

(declare-fun lt!416697 () Unit!19629)

(declare-fun choose!475 (array!16165 array!16165 (_ BitVec 32) (_ BitVec 32)) Unit!19629)

(assert (=> d!96330 (= lt!416697 (choose!475 a1!699 a2!699 (_1!12441 lt!416637) (_2!12441 lt!416637)))))

(assert (=> d!96330 (and (bvsle #b00000000000000000000000000000000 (_1!12441 lt!416637)) (bvsle (_1!12441 lt!416637) (_2!12441 lt!416637)) (bvsle (_2!12441 lt!416637) (size!6991 a1!699)))))

(assert (=> d!96330 (= (arrayRangesEqSymmetricLemma!166 a1!699 a2!699 (_1!12441 lt!416637) (_2!12441 lt!416637)) lt!416697)))

(declare-fun bs!24295 () Bool)

(assert (= bs!24295 d!96330))

(assert (=> bs!24295 m!412995))

(declare-fun m!413141 () Bool)

(assert (=> bs!24295 m!413141))

(assert (=> b!279978 d!96330))

(declare-fun d!96334 () Bool)

(declare-fun res!232512 () Bool)

(declare-fun e!199779 () Bool)

(assert (=> d!96334 (=> res!232512 e!199779)))

(assert (=> d!96334 (= res!232512 (= (_1!12441 lt!416637) (_2!12441 lt!416637)))))

(assert (=> d!96334 (= (arrayRangesEq!1259 a2!699 a1!699 (_1!12441 lt!416637) (_2!12441 lt!416637)) e!199779)))

(declare-fun b!280095 () Bool)

(declare-fun e!199780 () Bool)

(assert (=> b!280095 (= e!199779 e!199780)))

(declare-fun res!232513 () Bool)

(assert (=> b!280095 (=> (not res!232513) (not e!199780))))

(assert (=> b!280095 (= res!232513 (= (select (arr!7987 a2!699) (_1!12441 lt!416637)) (select (arr!7987 a1!699) (_1!12441 lt!416637))))))

(declare-fun b!280096 () Bool)

(assert (=> b!280096 (= e!199780 (arrayRangesEq!1259 a2!699 a1!699 (bvadd (_1!12441 lt!416637) #b00000000000000000000000000000001) (_2!12441 lt!416637)))))

(assert (= (and d!96334 (not res!232512)) b!280095))

(assert (= (and b!280095 res!232513) b!280096))

(assert (=> b!280095 m!413137))

(assert (=> b!280095 m!413135))

(declare-fun m!413143 () Bool)

(assert (=> b!280096 m!413143))

(assert (=> b!279978 d!96334))

(push 1)

(assert (not d!96330))

(assert (not b!280079))

(assert (not bm!4603))

(assert (not b!280096))

(assert (not b!280075))

(assert (not b!280086))

(assert (not b!280094))

(assert (not b!280085))

(assert (not bm!4602))

(assert (not b!280082))

(assert (not b!280078))

(check-sat)

(pop 1)

(push 1)

(check-sat)

