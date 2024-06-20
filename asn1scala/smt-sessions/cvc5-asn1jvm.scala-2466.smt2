; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62628 () Bool)

(assert start!62628)

(declare-fun b!280550 () Bool)

(declare-fun res!232848 () Bool)

(declare-fun e!200176 () Bool)

(assert (=> b!280550 (=> (not res!232848) (not e!200176))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!280550 (= res!232848 (bvslt from!822 to!789))))

(declare-fun b!280551 () Bool)

(declare-datatypes ((Unit!19677 0))(
  ( (Unit!19678) )
))
(declare-fun e!200178 () Unit!19677)

(declare-fun Unit!19679 () Unit!19677)

(assert (=> b!280551 (= e!200178 Unit!19679)))

(declare-datatypes ((array!16201 0))(
  ( (array!16202 (arr!7999 (Array (_ BitVec 32) (_ BitVec 8))) (size!7003 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16201)

(declare-fun a2!699 () array!16201)

(declare-datatypes ((tuple4!756 0))(
  ( (tuple4!757 (_1!12453 (_ BitVec 32)) (_2!12453 (_ BitVec 32)) (_3!1158 (_ BitVec 32)) (_4!378 (_ BitVec 32))) )
))
(declare-fun lt!416910 () tuple4!756)

(declare-fun arrayRangesEq!1271 (array!16201 array!16201 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!280551 (arrayRangesEq!1271 a1!699 a2!699 (_1!12453 lt!416910) (_2!12453 lt!416910))))

(declare-fun lt!416909 () Unit!19677)

(declare-fun arrayRangesEqSymmetricLemma!178 (array!16201 array!16201 (_ BitVec 32) (_ BitVec 32)) Unit!19677)

(assert (=> b!280551 (= lt!416909 (arrayRangesEqSymmetricLemma!178 a1!699 a2!699 (_1!12453 lt!416910) (_2!12453 lt!416910)))))

(assert (=> b!280551 (arrayRangesEq!1271 a2!699 a1!699 (_1!12453 lt!416910) (_2!12453 lt!416910))))

(declare-fun b!280552 () Bool)

(declare-fun res!232849 () Bool)

(assert (=> b!280552 (=> (not res!232849) (not e!200176))))

(declare-fun arrayBitRangesEq!0 (array!16201 array!16201 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!280552 (= res!232849 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun res!232847 () Bool)

(assert (=> start!62628 (=> (not res!232847) (not e!200176))))

(assert (=> start!62628 (= res!232847 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!7003 a1!699) (size!7003 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7003 a1!699))))))))

(assert (=> start!62628 e!200176))

(assert (=> start!62628 true))

(declare-fun array_inv!6727 (array!16201) Bool)

(assert (=> start!62628 (array_inv!6727 a1!699)))

(assert (=> start!62628 (array_inv!6727 a2!699)))

(declare-fun b!280553 () Bool)

(declare-fun Unit!19680 () Unit!19677)

(assert (=> b!280553 (= e!200178 Unit!19680)))

(declare-fun b!280554 () Bool)

(declare-fun e!200177 () Bool)

(assert (=> b!280554 (= e!200177 (not (and (bvsge (_3!1158 lt!416910) #b00000000000000000000000000000000) (bvslt (_3!1158 lt!416910) (size!7003 a2!699)))))))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!280554 (byteRangesEq!0 (select (arr!7999 a1!699) (_3!1158 lt!416910)) (select (arr!7999 a2!699) (_3!1158 lt!416910)) ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000)))

(declare-fun b!280555 () Bool)

(assert (=> b!280555 (= e!200176 e!200177)))

(declare-fun res!232850 () Bool)

(assert (=> b!280555 (=> (not res!232850) (not e!200177))))

(assert (=> b!280555 (= res!232850 (not (= (_3!1158 lt!416910) (_4!378 lt!416910))))))

(declare-fun lt!416908 () Unit!19677)

(assert (=> b!280555 (= lt!416908 e!200178)))

(declare-fun c!13023 () Bool)

(assert (=> b!280555 (= c!13023 (bvslt (_1!12453 lt!416910) (_2!12453 lt!416910)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!756)

(assert (=> b!280555 (= lt!416910 (arrayBitIndices!0 from!822 to!789))))

(assert (= (and start!62628 res!232847) b!280552))

(assert (= (and b!280552 res!232849) b!280550))

(assert (= (and b!280550 res!232848) b!280555))

(assert (= (and b!280555 c!13023) b!280551))

(assert (= (and b!280555 (not c!13023)) b!280553))

(assert (= (and b!280555 res!232850) b!280554))

(declare-fun m!413559 () Bool)

(assert (=> b!280554 m!413559))

(declare-fun m!413561 () Bool)

(assert (=> b!280554 m!413561))

(assert (=> b!280554 m!413559))

(assert (=> b!280554 m!413561))

(declare-fun m!413563 () Bool)

(assert (=> b!280554 m!413563))

(declare-fun m!413565 () Bool)

(assert (=> start!62628 m!413565))

(declare-fun m!413567 () Bool)

(assert (=> start!62628 m!413567))

(declare-fun m!413569 () Bool)

(assert (=> b!280555 m!413569))

(declare-fun m!413571 () Bool)

(assert (=> b!280551 m!413571))

(declare-fun m!413573 () Bool)

(assert (=> b!280551 m!413573))

(declare-fun m!413575 () Bool)

(assert (=> b!280551 m!413575))

(declare-fun m!413577 () Bool)

(assert (=> b!280552 m!413577))

(push 1)

(assert (not b!280551))

(assert (not b!280552))

(assert (not start!62628))

(assert (not b!280554))

(assert (not b!280555))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!280620 () Bool)

(declare-fun res!232901 () Bool)

(declare-fun lt!416939 () (_ BitVec 32))

(assert (=> b!280620 (= res!232901 (= lt!416939 #b00000000000000000000000000000000))))

(declare-fun e!200239 () Bool)

(assert (=> b!280620 (=> res!232901 e!200239)))

(declare-fun e!200235 () Bool)

(assert (=> b!280620 (= e!200235 e!200239)))

(declare-fun b!280621 () Bool)

(declare-fun e!200240 () Bool)

(declare-fun call!4640 () Bool)

(assert (=> b!280621 (= e!200240 call!4640)))

(declare-fun b!280622 () Bool)

(assert (=> b!280622 (= e!200240 e!200235)))

(declare-fun res!232903 () Bool)

(assert (=> b!280622 (= res!232903 call!4640)))

(assert (=> b!280622 (=> (not res!232903) (not e!200235))))

(declare-fun b!280624 () Bool)

(declare-fun lt!416940 () tuple4!756)

(assert (=> b!280624 (= e!200239 (byteRangesEq!0 (select (arr!7999 a1!699) (_4!378 lt!416940)) (select (arr!7999 a2!699) (_4!378 lt!416940)) #b00000000000000000000000000000000 lt!416939))))

(declare-fun b!280625 () Bool)

(declare-fun e!200236 () Bool)

(assert (=> b!280625 (= e!200236 e!200240)))

(declare-fun c!13032 () Bool)

(assert (=> b!280625 (= c!13032 (= (_3!1158 lt!416940) (_4!378 lt!416940)))))

(declare-fun b!280623 () Bool)

(declare-fun e!200237 () Bool)

(assert (=> b!280623 (= e!200237 e!200236)))

(declare-fun res!232899 () Bool)

(assert (=> b!280623 (=> (not res!232899) (not e!200236))))

(declare-fun e!200238 () Bool)

(assert (=> b!280623 (= res!232899 e!200238)))

(declare-fun res!232902 () Bool)

(assert (=> b!280623 (=> res!232902 e!200238)))

(assert (=> b!280623 (= res!232902 (bvsge (_1!12453 lt!416940) (_2!12453 lt!416940)))))

(assert (=> b!280623 (= lt!416939 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!416938 () (_ BitVec 32))

(assert (=> b!280623 (= lt!416938 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!280623 (= lt!416940 (arrayBitIndices!0 from!822 to!789))))

(declare-fun d!96502 () Bool)

(declare-fun res!232900 () Bool)

(assert (=> d!96502 (=> res!232900 e!200237)))

(assert (=> d!96502 (= res!232900 (bvsge from!822 to!789))))

(assert (=> d!96502 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!200237)))

(declare-fun bm!4637 () Bool)

(assert (=> bm!4637 (= call!4640 (byteRangesEq!0 (select (arr!7999 a1!699) (_3!1158 lt!416940)) (select (arr!7999 a2!699) (_3!1158 lt!416940)) lt!416938 (ite c!13032 lt!416939 #b00000000000000000000000000001000)))))

(declare-fun b!280626 () Bool)

(assert (=> b!280626 (= e!200238 (arrayRangesEq!1271 a1!699 a2!699 (_1!12453 lt!416940) (_2!12453 lt!416940)))))

(assert (= (and d!96502 (not res!232900)) b!280623))

(assert (= (and b!280623 (not res!232902)) b!280626))

(assert (= (and b!280623 res!232899) b!280625))

(assert (= (and b!280625 c!13032) b!280621))

(assert (= (and b!280625 (not c!13032)) b!280622))

(assert (= (and b!280622 res!232903) b!280620))

(assert (= (and b!280620 (not res!232901)) b!280624))

(assert (= (or b!280621 b!280622) bm!4637))

(declare-fun m!413635 () Bool)

(assert (=> b!280624 m!413635))

(declare-fun m!413637 () Bool)

(assert (=> b!280624 m!413637))

(assert (=> b!280624 m!413635))

(assert (=> b!280624 m!413637))

(declare-fun m!413639 () Bool)

(assert (=> b!280624 m!413639))

(assert (=> b!280623 m!413569))

(declare-fun m!413641 () Bool)

(assert (=> bm!4637 m!413641))

(declare-fun m!413643 () Bool)

(assert (=> bm!4637 m!413643))

(assert (=> bm!4637 m!413641))

(assert (=> bm!4637 m!413643))

(declare-fun m!413645 () Bool)

(assert (=> bm!4637 m!413645))

(declare-fun m!413647 () Bool)

(assert (=> b!280626 m!413647))

(assert (=> b!280552 d!96502))

(declare-fun d!96514 () Bool)

(assert (=> d!96514 (= (array_inv!6727 a1!699) (bvsge (size!7003 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!62628 d!96514))

(declare-fun d!96516 () Bool)

(assert (=> d!96516 (= (array_inv!6727 a2!699) (bvsge (size!7003 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!62628 d!96516))

(declare-fun d!96518 () Bool)

(assert (=> d!96518 (= (arrayBitIndices!0 from!822 to!789) (tuple4!757 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!280555 d!96518))

(declare-fun d!96528 () Bool)

(assert (=> d!96528 (= (byteRangesEq!0 (select (arr!7999 a1!699) (_3!1158 lt!416910)) (select (arr!7999 a2!699) (_3!1158 lt!416910)) ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000) (or (= ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7999 a1!699) (_3!1158 lt!416910))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7999 a2!699) (_3!1158 lt!416910))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111))))))

(declare-fun bs!24327 () Bool)

(assert (= bs!24327 d!96528))

(declare-fun m!413661 () Bool)

(assert (=> bs!24327 m!413661))

(declare-fun m!413663 () Bool)

(assert (=> bs!24327 m!413663))

(assert (=> b!280554 d!96528))

(declare-fun d!96534 () Bool)

(declare-fun res!232910 () Bool)

(declare-fun e!200247 () Bool)

(assert (=> d!96534 (=> res!232910 e!200247)))

(assert (=> d!96534 (= res!232910 (= (_1!12453 lt!416910) (_2!12453 lt!416910)))))

(assert (=> d!96534 (= (arrayRangesEq!1271 a1!699 a2!699 (_1!12453 lt!416910) (_2!12453 lt!416910)) e!200247)))

(declare-fun b!280633 () Bool)

(declare-fun e!200248 () Bool)

(assert (=> b!280633 (= e!200247 e!200248)))

(declare-fun res!232911 () Bool)

(assert (=> b!280633 (=> (not res!232911) (not e!200248))))

(assert (=> b!280633 (= res!232911 (= (select (arr!7999 a1!699) (_1!12453 lt!416910)) (select (arr!7999 a2!699) (_1!12453 lt!416910))))))

(declare-fun b!280634 () Bool)

(assert (=> b!280634 (= e!200248 (arrayRangesEq!1271 a1!699 a2!699 (bvadd (_1!12453 lt!416910) #b00000000000000000000000000000001) (_2!12453 lt!416910)))))

(assert (= (and d!96534 (not res!232910)) b!280633))

(assert (= (and b!280633 res!232911) b!280634))

(declare-fun m!413665 () Bool)

(assert (=> b!280633 m!413665))

(declare-fun m!413667 () Bool)

(assert (=> b!280633 m!413667))

(declare-fun m!413669 () Bool)

(assert (=> b!280634 m!413669))

(assert (=> b!280551 d!96534))

(declare-fun d!96538 () Bool)

(assert (=> d!96538 (arrayRangesEq!1271 a2!699 a1!699 (_1!12453 lt!416910) (_2!12453 lt!416910))))

(declare-fun lt!416946 () Unit!19677)

(declare-fun choose!487 (array!16201 array!16201 (_ BitVec 32) (_ BitVec 32)) Unit!19677)

(assert (=> d!96538 (= lt!416946 (choose!487 a1!699 a2!699 (_1!12453 lt!416910) (_2!12453 lt!416910)))))

(assert (=> d!96538 (and (bvsle #b00000000000000000000000000000000 (_1!12453 lt!416910)) (bvsle (_1!12453 lt!416910) (_2!12453 lt!416910)) (bvsle (_2!12453 lt!416910) (size!7003 a1!699)))))

(assert (=> d!96538 (= (arrayRangesEqSymmetricLemma!178 a1!699 a2!699 (_1!12453 lt!416910) (_2!12453 lt!416910)) lt!416946)))

(declare-fun bs!24328 () Bool)

(assert (= bs!24328 d!96538))

(assert (=> bs!24328 m!413575))

(declare-fun m!413671 () Bool)

(assert (=> bs!24328 m!413671))

(assert (=> b!280551 d!96538))

(declare-fun d!96540 () Bool)

(declare-fun res!232912 () Bool)

(declare-fun e!200249 () Bool)

(assert (=> d!96540 (=> res!232912 e!200249)))

(assert (=> d!96540 (= res!232912 (= (_1!12453 lt!416910) (_2!12453 lt!416910)))))

(assert (=> d!96540 (= (arrayRangesEq!1271 a2!699 a1!699 (_1!12453 lt!416910) (_2!12453 lt!416910)) e!200249)))

(declare-fun b!280635 () Bool)

(declare-fun e!200250 () Bool)

(assert (=> b!280635 (= e!200249 e!200250)))

(declare-fun res!232913 () Bool)

(assert (=> b!280635 (=> (not res!232913) (not e!200250))))

(assert (=> b!280635 (= res!232913 (= (select (arr!7999 a2!699) (_1!12453 lt!416910)) (select (arr!7999 a1!699) (_1!12453 lt!416910))))))

(declare-fun b!280636 () Bool)

(assert (=> b!280636 (= e!200250 (arrayRangesEq!1271 a2!699 a1!699 (bvadd (_1!12453 lt!416910) #b00000000000000000000000000000001) (_2!12453 lt!416910)))))

(assert (= (and d!96540 (not res!232912)) b!280635))

(assert (= (and b!280635 res!232913) b!280636))

(assert (=> b!280635 m!413667))

(assert (=> b!280635 m!413665))

(declare-fun m!413673 () Bool)

(assert (=> b!280636 m!413673))

(assert (=> b!280551 d!96540))

(push 1)

(assert (not b!280636))

(assert (not b!280626))

(assert (not d!96538))

(assert (not b!280623))

(assert (not b!280624))

(assert (not bm!4637))

(assert (not b!280634))

(check-sat)

(pop 1)

(push 1)

(check-sat)

