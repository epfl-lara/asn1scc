; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62388 () Bool)

(assert start!62388)

(declare-fun b!279692 () Bool)

(declare-fun e!199427 () Bool)

(declare-fun e!199431 () Bool)

(assert (=> b!279692 (= e!199427 e!199431)))

(declare-fun res!232212 () Bool)

(assert (=> b!279692 (=> (not res!232212) (not e!199431))))

(declare-datatypes ((tuple4!720 0))(
  ( (tuple4!721 (_1!12435 (_ BitVec 32)) (_2!12435 (_ BitVec 32)) (_3!1140 (_ BitVec 32)) (_4!360 (_ BitVec 32))) )
))
(declare-fun lt!416486 () tuple4!720)

(assert (=> b!279692 (= res!232212 (= (_3!1140 lt!416486) (_4!360 lt!416486)))))

(declare-datatypes ((Unit!19605 0))(
  ( (Unit!19606) )
))
(declare-fun lt!416487 () Unit!19605)

(declare-fun e!199430 () Unit!19605)

(assert (=> b!279692 (= lt!416487 e!199430)))

(declare-fun c!12912 () Bool)

(assert (=> b!279692 (= c!12912 (bvslt (_1!12435 lt!416486) (_2!12435 lt!416486)))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!720)

(assert (=> b!279692 (= lt!416486 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!279693 () Bool)

(declare-fun res!232214 () Bool)

(assert (=> b!279693 (=> (not res!232214) (not e!199427))))

(assert (=> b!279693 (= res!232214 (bvslt from!822 to!789))))

(declare-fun res!232213 () Bool)

(assert (=> start!62388 (=> (not res!232213) (not e!199427))))

(declare-datatypes ((array!16147 0))(
  ( (array!16148 (arr!7981 (Array (_ BitVec 32) (_ BitVec 8))) (size!6985 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16147)

(declare-fun a2!699 () array!16147)

(assert (=> start!62388 (= res!232213 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6985 a1!699) (size!6985 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6985 a1!699))))))))

(assert (=> start!62388 e!199427))

(assert (=> start!62388 true))

(declare-fun array_inv!6709 (array!16147) Bool)

(assert (=> start!62388 (array_inv!6709 a1!699)))

(assert (=> start!62388 (array_inv!6709 a2!699)))

(declare-fun b!279694 () Bool)

(declare-fun Unit!19607 () Unit!19605)

(assert (=> b!279694 (= e!199430 Unit!19607)))

(declare-fun arrayRangesEq!1253 (array!16147 array!16147 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!279694 (arrayRangesEq!1253 a1!699 a2!699 (_1!12435 lt!416486) (_2!12435 lt!416486))))

(declare-fun lt!416485 () Unit!19605)

(declare-fun arrayRangesEqSymmetricLemma!160 (array!16147 array!16147 (_ BitVec 32) (_ BitVec 32)) Unit!19605)

(assert (=> b!279694 (= lt!416485 (arrayRangesEqSymmetricLemma!160 a1!699 a2!699 (_1!12435 lt!416486) (_2!12435 lt!416486)))))

(assert (=> b!279694 (arrayRangesEq!1253 a2!699 a1!699 (_1!12435 lt!416486) (_2!12435 lt!416486))))

(declare-fun b!279695 () Bool)

(declare-fun res!232211 () Bool)

(assert (=> b!279695 (=> (not res!232211) (not e!199427))))

(declare-fun arrayBitRangesEq!0 (array!16147 array!16147 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!279695 (= res!232211 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!279696 () Bool)

(declare-fun Unit!19608 () Unit!19605)

(assert (=> b!279696 (= e!199430 Unit!19608)))

(declare-fun b!279697 () Bool)

(assert (=> b!279697 (= e!199431 (not (and (bvsge (_3!1140 lt!416486) #b00000000000000000000000000000000) (bvslt (_3!1140 lt!416486) (size!6985 a1!699)))))))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!279697 (byteRangesEq!0 (select (arr!7981 a1!699) (_3!1140 lt!416486)) (select (arr!7981 a2!699) (_3!1140 lt!416486)) ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and start!62388 res!232213) b!279695))

(assert (= (and b!279695 res!232211) b!279693))

(assert (= (and b!279693 res!232214) b!279692))

(assert (= (and b!279692 c!12912) b!279694))

(assert (= (and b!279692 (not c!12912)) b!279696))

(assert (= (and b!279692 res!232212) b!279697))

(declare-fun m!412723 () Bool)

(assert (=> b!279692 m!412723))

(declare-fun m!412725 () Bool)

(assert (=> b!279697 m!412725))

(declare-fun m!412727 () Bool)

(assert (=> b!279697 m!412727))

(assert (=> b!279697 m!412725))

(assert (=> b!279697 m!412727))

(declare-fun m!412729 () Bool)

(assert (=> b!279697 m!412729))

(declare-fun m!412731 () Bool)

(assert (=> b!279695 m!412731))

(declare-fun m!412733 () Bool)

(assert (=> start!62388 m!412733))

(declare-fun m!412735 () Bool)

(assert (=> start!62388 m!412735))

(declare-fun m!412737 () Bool)

(assert (=> b!279694 m!412737))

(declare-fun m!412739 () Bool)

(assert (=> b!279694 m!412739))

(declare-fun m!412741 () Bool)

(assert (=> b!279694 m!412741))

(push 1)

(assert (not start!62388))

(assert (not b!279695))

(assert (not b!279694))

(assert (not b!279692))

(assert (not b!279697))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!96204 () Bool)

(declare-fun res!232266 () Bool)

(declare-fun e!199492 () Bool)

(assert (=> d!96204 (=> res!232266 e!199492)))

(assert (=> d!96204 (= res!232266 (= (_1!12435 lt!416486) (_2!12435 lt!416486)))))

(assert (=> d!96204 (= (arrayRangesEq!1253 a1!699 a2!699 (_1!12435 lt!416486) (_2!12435 lt!416486)) e!199492)))

(declare-fun b!279767 () Bool)

(declare-fun e!199493 () Bool)

(assert (=> b!279767 (= e!199492 e!199493)))

(declare-fun res!232267 () Bool)

(assert (=> b!279767 (=> (not res!232267) (not e!199493))))

(assert (=> b!279767 (= res!232267 (= (select (arr!7981 a1!699) (_1!12435 lt!416486)) (select (arr!7981 a2!699) (_1!12435 lt!416486))))))

(declare-fun b!279768 () Bool)

(assert (=> b!279768 (= e!199493 (arrayRangesEq!1253 a1!699 a2!699 (bvadd (_1!12435 lt!416486) #b00000000000000000000000000000001) (_2!12435 lt!416486)))))

(assert (= (and d!96204 (not res!232266)) b!279767))

(assert (= (and b!279767 res!232267) b!279768))

(declare-fun m!412811 () Bool)

(assert (=> b!279767 m!412811))

(declare-fun m!412813 () Bool)

(assert (=> b!279767 m!412813))

(declare-fun m!412815 () Bool)

(assert (=> b!279768 m!412815))

(assert (=> b!279694 d!96204))

(declare-fun d!96206 () Bool)

(assert (=> d!96206 (arrayRangesEq!1253 a2!699 a1!699 (_1!12435 lt!416486) (_2!12435 lt!416486))))

(declare-fun lt!416520 () Unit!19605)

(declare-fun choose!471 (array!16147 array!16147 (_ BitVec 32) (_ BitVec 32)) Unit!19605)

(assert (=> d!96206 (= lt!416520 (choose!471 a1!699 a2!699 (_1!12435 lt!416486) (_2!12435 lt!416486)))))

(assert (=> d!96206 (and (bvsle #b00000000000000000000000000000000 (_1!12435 lt!416486)) (bvsle (_1!12435 lt!416486) (_2!12435 lt!416486)) (bvsle (_2!12435 lt!416486) (size!6985 a1!699)))))

(assert (=> d!96206 (= (arrayRangesEqSymmetricLemma!160 a1!699 a2!699 (_1!12435 lt!416486) (_2!12435 lt!416486)) lt!416520)))

(declare-fun bs!24271 () Bool)

(assert (= bs!24271 d!96206))

(assert (=> bs!24271 m!412741))

(declare-fun m!412817 () Bool)

(assert (=> bs!24271 m!412817))

(assert (=> b!279694 d!96206))

(declare-fun d!96208 () Bool)

(declare-fun res!232268 () Bool)

(declare-fun e!199494 () Bool)

(assert (=> d!96208 (=> res!232268 e!199494)))

(assert (=> d!96208 (= res!232268 (= (_1!12435 lt!416486) (_2!12435 lt!416486)))))

(assert (=> d!96208 (= (arrayRangesEq!1253 a2!699 a1!699 (_1!12435 lt!416486) (_2!12435 lt!416486)) e!199494)))

(declare-fun b!279769 () Bool)

(declare-fun e!199495 () Bool)

(assert (=> b!279769 (= e!199494 e!199495)))

(declare-fun res!232269 () Bool)

(assert (=> b!279769 (=> (not res!232269) (not e!199495))))

(assert (=> b!279769 (= res!232269 (= (select (arr!7981 a2!699) (_1!12435 lt!416486)) (select (arr!7981 a1!699) (_1!12435 lt!416486))))))

(declare-fun b!279770 () Bool)

(assert (=> b!279770 (= e!199495 (arrayRangesEq!1253 a2!699 a1!699 (bvadd (_1!12435 lt!416486) #b00000000000000000000000000000001) (_2!12435 lt!416486)))))

(assert (= (and d!96208 (not res!232268)) b!279769))

(assert (= (and b!279769 res!232269) b!279770))

(assert (=> b!279769 m!412813))

(assert (=> b!279769 m!412811))

(declare-fun m!412819 () Bool)

(assert (=> b!279770 m!412819))

(assert (=> b!279694 d!96208))

(declare-fun d!96210 () Bool)

(assert (=> d!96210 (= (array_inv!6709 a1!699) (bvsge (size!6985 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!62388 d!96210))

(declare-fun d!96212 () Bool)

(assert (=> d!96212 (= (array_inv!6709 a2!699) (bvsge (size!6985 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!62388 d!96212))

(declare-fun d!96214 () Bool)

(assert (=> d!96214 (= (arrayBitIndices!0 from!822 to!789) (tuple4!721 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!279692 d!96214))

(declare-fun d!96216 () Bool)

(assert (=> d!96216 (= (byteRangesEq!0 (select (arr!7981 a1!699) (_3!1140 lt!416486)) (select (arr!7981 a2!699) (_3!1140 lt!416486)) ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000))) (or (= ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000))) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7981 a1!699) (_3!1140 lt!416486))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7981 a2!699) (_3!1140 lt!416486))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111))))))

(declare-fun bs!24272 () Bool)

(assert (= bs!24272 d!96216))

(declare-fun m!412821 () Bool)

(assert (=> bs!24272 m!412821))

(declare-fun m!412823 () Bool)

(assert (=> bs!24272 m!412823))

(assert (=> b!279697 d!96216))

(declare-fun c!12927 () Bool)

(declare-fun call!4589 () Bool)

(declare-fun lt!416541 () (_ BitVec 32))

(declare-fun lt!416540 () tuple4!720)

(declare-fun bm!4586 () Bool)

(declare-fun lt!416539 () (_ BitVec 32))

(assert (=> bm!4586 (= call!4589 (byteRangesEq!0 (ite c!12927 (select (arr!7981 a1!699) (_3!1140 lt!416540)) (select (arr!7981 a1!699) (_4!360 lt!416540))) (ite c!12927 (select (arr!7981 a2!699) (_3!1140 lt!416540)) (select (arr!7981 a2!699) (_4!360 lt!416540))) (ite c!12927 lt!416539 #b00000000000000000000000000000000) lt!416541))))

(declare-fun b!279814 () Bool)

(declare-fun e!199536 () Bool)

(assert (=> b!279814 (= e!199536 call!4589)))

(declare-fun e!199535 () Bool)

(declare-fun b!279815 () Bool)

(assert (=> b!279815 (= e!199535 (arrayRangesEq!1253 a1!699 a2!699 (_1!12435 lt!416540) (_2!12435 lt!416540)))))

(declare-fun b!279816 () Bool)

(declare-fun res!232303 () Bool)

(assert (=> b!279816 (= res!232303 (= lt!416541 #b00000000000000000000000000000000))))

(assert (=> b!279816 (=> res!232303 e!199536)))

(declare-fun e!199534 () Bool)

(assert (=> b!279816 (= e!199534 e!199536)))

(declare-fun d!96220 () Bool)

(declare-fun res!232307 () Bool)

(declare-fun e!199538 () Bool)

(assert (=> d!96220 (=> res!232307 e!199538)))

(assert (=> d!96220 (= res!232307 (bvsge from!822 to!789))))

(assert (=> d!96220 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!199538)))

(declare-fun b!279817 () Bool)

(declare-fun e!199539 () Bool)

(declare-fun e!199537 () Bool)

(assert (=> b!279817 (= e!199539 e!199537)))

(assert (=> b!279817 (= c!12927 (= (_3!1140 lt!416540) (_4!360 lt!416540)))))

(declare-fun b!279818 () Bool)

(assert (=> b!279818 (= e!199537 call!4589)))

(declare-fun b!279819 () Bool)

(assert (=> b!279819 (= e!199538 e!199539)))

(declare-fun res!232306 () Bool)

(assert (=> b!279819 (=> (not res!232306) (not e!199539))))

(assert (=> b!279819 (= res!232306 e!199535)))

(declare-fun res!232305 () Bool)

(assert (=> b!279819 (=> res!232305 e!199535)))

(assert (=> b!279819 (= res!232305 (bvsge (_1!12435 lt!416540) (_2!12435 lt!416540)))))

(assert (=> b!279819 (= lt!416541 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!279819 (= lt!416539 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!279819 (= lt!416540 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!279820 () Bool)

(assert (=> b!279820 (= e!199537 e!199534)))

(declare-fun res!232304 () Bool)

(assert (=> b!279820 (= res!232304 (byteRangesEq!0 (select (arr!7981 a1!699) (_3!1140 lt!416540)) (select (arr!7981 a2!699) (_3!1140 lt!416540)) lt!416539 #b00000000000000000000000000001000))))

(assert (=> b!279820 (=> (not res!232304) (not e!199534))))

(assert (= (and d!96220 (not res!232307)) b!279819))

(assert (= (and b!279819 (not res!232305)) b!279815))

(assert (= (and b!279819 res!232306) b!279817))

(assert (= (and b!279817 c!12927) b!279818))

(assert (= (and b!279817 (not c!12927)) b!279820))

(assert (= (and b!279820 res!232304) b!279816))

(assert (= (and b!279816 (not res!232303)) b!279814))

(assert (= (or b!279818 b!279814) bm!4586))

(declare-fun m!412849 () Bool)

(assert (=> bm!4586 m!412849))

(declare-fun m!412851 () Bool)

(assert (=> bm!4586 m!412851))

(declare-fun m!412853 () Bool)

(assert (=> bm!4586 m!412853))

(declare-fun m!412855 () Bool)

(assert (=> bm!4586 m!412855))

(declare-fun m!412857 () Bool)

(assert (=> bm!4586 m!412857))

(declare-fun m!412859 () Bool)

(assert (=> b!279815 m!412859))

(assert (=> b!279819 m!412723))

(assert (=> b!279820 m!412849))

(assert (=> b!279820 m!412855))

(assert (=> b!279820 m!412849))

(assert (=> b!279820 m!412855))

(declare-fun m!412861 () Bool)

(assert (=> b!279820 m!412861))

(assert (=> b!279695 d!96220))

(push 1)

(assert (not b!279820))

(assert (not b!279815))

(assert (not b!279768))

(assert (not b!279819))

(assert (not b!279770))

(assert (not d!96206))

(assert (not bm!4586))

(check-sat)

(pop 1)

(push 1)

(check-sat)

