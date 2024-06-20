; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62926 () Bool)

(assert start!62926)

(declare-datatypes ((array!16268 0))(
  ( (array!16269 (arr!8022 (Array (_ BitVec 32) (_ BitVec 8))) (size!7026 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16268)

(declare-fun e!201135 () Bool)

(declare-datatypes ((tuple4!802 0))(
  ( (tuple4!803 (_1!12476 (_ BitVec 32)) (_2!12476 (_ BitVec 32)) (_3!1181 (_ BitVec 32)) (_4!401 (_ BitVec 32))) )
))
(declare-fun lt!417446 () tuple4!802)

(declare-fun b!281660 () Bool)

(declare-fun lt!417450 () (_ BitVec 32))

(declare-fun a2!699 () array!16268)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!281660 (= e!201135 (byteRangesEq!0 (select (arr!8022 a1!699) (_4!401 lt!417446)) (select (arr!8022 a2!699) (_4!401 lt!417446)) #b00000000000000000000000000000000 lt!417450))))

(declare-fun b!281661 () Bool)

(declare-datatypes ((Unit!19769 0))(
  ( (Unit!19770) )
))
(declare-fun e!201139 () Unit!19769)

(declare-fun Unit!19771 () Unit!19769)

(assert (=> b!281661 (= e!201139 Unit!19771)))

(declare-fun b!281662 () Bool)

(declare-fun res!233695 () Bool)

(declare-fun e!201138 () Bool)

(assert (=> b!281662 (=> (not res!233695) (not e!201138))))

(declare-fun lt!417449 () (_ BitVec 32))

(assert (=> b!281662 (= res!233695 (byteRangesEq!0 (select (arr!8022 a2!699) (_3!1181 lt!417446)) (select (arr!8022 a1!699) (_3!1181 lt!417446)) lt!417449 #b00000000000000000000000000001000))))

(declare-fun e!201141 () Bool)

(declare-fun b!281664 () Bool)

(assert (=> b!281664 (= e!201141 (not (or (= lt!417450 #b00000000000000000000000000000000) (and (bvsge (_4!401 lt!417446) #b00000000000000000000000000000000) (bvslt (_4!401 lt!417446) (size!7026 a1!699))))))))

(assert (=> b!281664 e!201138))

(declare-fun res!233699 () Bool)

(assert (=> b!281664 (=> (not res!233699) (not e!201138))))

(assert (=> b!281664 (= res!233699 (byteRangesEq!0 (select (arr!8022 a1!699) (_3!1181 lt!417446)) (select (arr!8022 a2!699) (_3!1181 lt!417446)) lt!417449 #b00000000000000000000000000001000))))

(declare-fun b!281665 () Bool)

(declare-fun res!233697 () Bool)

(declare-fun e!201136 () Bool)

(assert (=> b!281665 (=> (not res!233697) (not e!201136))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!281665 (= res!233697 (bvslt from!822 to!789))))

(declare-fun b!281666 () Bool)

(declare-fun res!233693 () Bool)

(assert (=> b!281666 (=> (not res!233693) (not e!201136))))

(declare-fun arrayBitRangesEq!0 (array!16268 array!16268 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!281666 (= res!233693 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!281667 () Bool)

(assert (=> b!281667 (= e!201138 e!201135)))

(declare-fun res!233696 () Bool)

(assert (=> b!281667 (=> res!233696 e!201135)))

(assert (=> b!281667 (= res!233696 (= lt!417450 #b00000000000000000000000000000000))))

(declare-fun b!281668 () Bool)

(declare-fun Unit!19772 () Unit!19769)

(assert (=> b!281668 (= e!201139 Unit!19772)))

(declare-fun arrayRangesEq!1294 (array!16268 array!16268 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!281668 (arrayRangesEq!1294 a1!699 a2!699 (_1!12476 lt!417446) (_2!12476 lt!417446))))

(declare-fun lt!417448 () Unit!19769)

(declare-fun arrayRangesEqSymmetricLemma!201 (array!16268 array!16268 (_ BitVec 32) (_ BitVec 32)) Unit!19769)

(assert (=> b!281668 (= lt!417448 (arrayRangesEqSymmetricLemma!201 a1!699 a2!699 (_1!12476 lt!417446) (_2!12476 lt!417446)))))

(assert (=> b!281668 (arrayRangesEq!1294 a2!699 a1!699 (_1!12476 lt!417446) (_2!12476 lt!417446))))

(declare-fun res!233698 () Bool)

(assert (=> start!62926 (=> (not res!233698) (not e!201136))))

(assert (=> start!62926 (= res!233698 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!7026 a1!699) (size!7026 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7026 a1!699))))))))

(assert (=> start!62926 e!201136))

(assert (=> start!62926 true))

(declare-fun array_inv!6750 (array!16268) Bool)

(assert (=> start!62926 (array_inv!6750 a1!699)))

(assert (=> start!62926 (array_inv!6750 a2!699)))

(declare-fun b!281663 () Bool)

(assert (=> b!281663 (= e!201136 e!201141)))

(declare-fun res!233694 () Bool)

(assert (=> b!281663 (=> (not res!233694) (not e!201141))))

(assert (=> b!281663 (= res!233694 (not (= (_3!1181 lt!417446) (_4!401 lt!417446))))))

(declare-fun lt!417447 () Unit!19769)

(assert (=> b!281663 (= lt!417447 e!201139)))

(declare-fun c!13155 () Bool)

(assert (=> b!281663 (= c!13155 (bvslt (_1!12476 lt!417446) (_2!12476 lt!417446)))))

(assert (=> b!281663 (= lt!417450 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!281663 (= lt!417449 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!802)

(assert (=> b!281663 (= lt!417446 (arrayBitIndices!0 from!822 to!789))))

(assert (= (and start!62926 res!233698) b!281666))

(assert (= (and b!281666 res!233693) b!281665))

(assert (= (and b!281665 res!233697) b!281663))

(assert (= (and b!281663 c!13155) b!281668))

(assert (= (and b!281663 (not c!13155)) b!281661))

(assert (= (and b!281663 res!233694) b!281664))

(assert (= (and b!281664 res!233699) b!281662))

(assert (= (and b!281662 res!233695) b!281667))

(assert (= (and b!281667 (not res!233696)) b!281660))

(declare-fun m!414713 () Bool)

(assert (=> b!281664 m!414713))

(declare-fun m!414715 () Bool)

(assert (=> b!281664 m!414715))

(assert (=> b!281664 m!414713))

(assert (=> b!281664 m!414715))

(declare-fun m!414717 () Bool)

(assert (=> b!281664 m!414717))

(declare-fun m!414719 () Bool)

(assert (=> b!281666 m!414719))

(assert (=> b!281662 m!414715))

(assert (=> b!281662 m!414713))

(assert (=> b!281662 m!414715))

(assert (=> b!281662 m!414713))

(declare-fun m!414721 () Bool)

(assert (=> b!281662 m!414721))

(declare-fun m!414723 () Bool)

(assert (=> b!281668 m!414723))

(declare-fun m!414725 () Bool)

(assert (=> b!281668 m!414725))

(declare-fun m!414727 () Bool)

(assert (=> b!281668 m!414727))

(declare-fun m!414729 () Bool)

(assert (=> start!62926 m!414729))

(declare-fun m!414731 () Bool)

(assert (=> start!62926 m!414731))

(declare-fun m!414733 () Bool)

(assert (=> b!281663 m!414733))

(declare-fun m!414735 () Bool)

(assert (=> b!281660 m!414735))

(declare-fun m!414737 () Bool)

(assert (=> b!281660 m!414737))

(assert (=> b!281660 m!414735))

(assert (=> b!281660 m!414737))

(declare-fun m!414739 () Bool)

(assert (=> b!281660 m!414739))

(push 1)

(assert (not b!281662))

(assert (not b!281666))

(assert (not start!62926))

(assert (not b!281663))

(assert (not b!281664))

(assert (not b!281660))

(assert (not b!281668))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun lt!417483 () tuple4!802)

(declare-fun b!281741 () Bool)

(declare-fun e!201210 () Bool)

(assert (=> b!281741 (= e!201210 (arrayRangesEq!1294 a1!699 a2!699 (_1!12476 lt!417483) (_2!12476 lt!417483)))))

(declare-fun d!96922 () Bool)

(declare-fun res!233757 () Bool)

(declare-fun e!201206 () Bool)

(assert (=> d!96922 (=> res!233757 e!201206)))

(assert (=> d!96922 (= res!233757 (bvsge from!822 to!789))))

(assert (=> d!96922 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!201206)))

(declare-fun b!281742 () Bool)

(declare-fun e!201211 () Bool)

(declare-fun e!201207 () Bool)

(assert (=> b!281742 (= e!201211 e!201207)))

(declare-fun res!233760 () Bool)

(declare-fun lt!417482 () (_ BitVec 32))

(assert (=> b!281742 (= res!233760 (byteRangesEq!0 (select (arr!8022 a1!699) (_3!1181 lt!417483)) (select (arr!8022 a2!699) (_3!1181 lt!417483)) lt!417482 #b00000000000000000000000000001000))))

(assert (=> b!281742 (=> (not res!233760) (not e!201207))))

(declare-fun b!281743 () Bool)

(declare-fun e!201209 () Bool)

(declare-fun call!4709 () Bool)

(assert (=> b!281743 (= e!201209 call!4709)))

(declare-fun c!13164 () Bool)

(declare-fun lt!417481 () (_ BitVec 32))

(declare-fun bm!4706 () Bool)

(assert (=> bm!4706 (= call!4709 (byteRangesEq!0 (ite c!13164 (select (arr!8022 a1!699) (_3!1181 lt!417483)) (select (arr!8022 a1!699) (_4!401 lt!417483))) (ite c!13164 (select (arr!8022 a2!699) (_3!1181 lt!417483)) (select (arr!8022 a2!699) (_4!401 lt!417483))) (ite c!13164 lt!417482 #b00000000000000000000000000000000) lt!417481))))

(declare-fun b!281744 () Bool)

(declare-fun res!233759 () Bool)

(assert (=> b!281744 (= res!233759 (= lt!417481 #b00000000000000000000000000000000))))

(assert (=> b!281744 (=> res!233759 e!201209)))

(assert (=> b!281744 (= e!201207 e!201209)))

(declare-fun b!281745 () Bool)

(declare-fun e!201208 () Bool)

(assert (=> b!281745 (= e!201206 e!201208)))

(declare-fun res!233758 () Bool)

(assert (=> b!281745 (=> (not res!233758) (not e!201208))))

(assert (=> b!281745 (= res!233758 e!201210)))

(declare-fun res!233756 () Bool)

(assert (=> b!281745 (=> res!233756 e!201210)))

(assert (=> b!281745 (= res!233756 (bvsge (_1!12476 lt!417483) (_2!12476 lt!417483)))))

(assert (=> b!281745 (= lt!417481 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!281745 (= lt!417482 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!281745 (= lt!417483 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!281746 () Bool)

(assert (=> b!281746 (= e!201208 e!201211)))

(assert (=> b!281746 (= c!13164 (= (_3!1181 lt!417483) (_4!401 lt!417483)))))

(declare-fun b!281747 () Bool)

(assert (=> b!281747 (= e!201211 call!4709)))

(assert (= (and d!96922 (not res!233757)) b!281745))

(assert (= (and b!281745 (not res!233756)) b!281741))

(assert (= (and b!281745 res!233758) b!281746))

(assert (= (and b!281746 c!13164) b!281747))

(assert (= (and b!281746 (not c!13164)) b!281742))

(assert (= (and b!281742 res!233760) b!281744))

(assert (= (and b!281744 (not res!233759)) b!281743))

(assert (= (or b!281747 b!281743) bm!4706))

(declare-fun m!414795 () Bool)

(assert (=> b!281741 m!414795))

(declare-fun m!414799 () Bool)

(assert (=> b!281742 m!414799))

(declare-fun m!414801 () Bool)

(assert (=> b!281742 m!414801))

(assert (=> b!281742 m!414799))

(assert (=> b!281742 m!414801))

(declare-fun m!414805 () Bool)

(assert (=> b!281742 m!414805))

(declare-fun m!414811 () Bool)

(assert (=> bm!4706 m!414811))

(assert (=> bm!4706 m!414799))

(declare-fun m!414815 () Bool)

(assert (=> bm!4706 m!414815))

(assert (=> bm!4706 m!414801))

(declare-fun m!414817 () Bool)

(assert (=> bm!4706 m!414817))

(assert (=> b!281745 m!414733))

(assert (=> b!281666 d!96922))

(declare-fun d!96926 () Bool)

(assert (=> d!96926 (= (byteRangesEq!0 (select (arr!8022 a1!699) (_4!401 lt!417446)) (select (arr!8022 a2!699) (_4!401 lt!417446)) #b00000000000000000000000000000000 lt!417450) (or (= #b00000000000000000000000000000000 lt!417450) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8022 a1!699) (_4!401 lt!417446))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!417450))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8022 a2!699) (_4!401 lt!417446))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!417450))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!24415 () Bool)

(assert (= bs!24415 d!96926))

(declare-fun m!414819 () Bool)

(assert (=> bs!24415 m!414819))

(declare-fun m!414821 () Bool)

(assert (=> bs!24415 m!414821))

(assert (=> b!281660 d!96926))

(declare-fun d!96930 () Bool)

(assert (=> d!96930 (= (byteRangesEq!0 (select (arr!8022 a2!699) (_3!1181 lt!417446)) (select (arr!8022 a1!699) (_3!1181 lt!417446)) lt!417449 #b00000000000000000000000000001000) (or (= lt!417449 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8022 a2!699) (_3!1181 lt!417446))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!417449)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8022 a1!699) (_3!1181 lt!417446))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!417449)))) #b00000000000000000000000011111111))))))

(declare-fun bs!24416 () Bool)

