; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62632 () Bool)

(assert start!62632)

(declare-fun res!232873 () Bool)

(declare-fun e!200208 () Bool)

(assert (=> start!62632 (=> (not res!232873) (not e!200208))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!16205 0))(
  ( (array!16206 (arr!8001 (Array (_ BitVec 32) (_ BitVec 8))) (size!7005 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16205)

(declare-fun a2!699 () array!16205)

(declare-fun to!789 () (_ BitVec 64))

(assert (=> start!62632 (= res!232873 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!7005 a1!699) (size!7005 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7005 a1!699))))))))

(assert (=> start!62632 e!200208))

(assert (=> start!62632 true))

(declare-fun array_inv!6729 (array!16205) Bool)

(assert (=> start!62632 (array_inv!6729 a1!699)))

(assert (=> start!62632 (array_inv!6729 a2!699)))

(declare-fun b!280586 () Bool)

(declare-fun res!232871 () Bool)

(assert (=> b!280586 (=> (not res!232871) (not e!200208))))

(assert (=> b!280586 (= res!232871 (bvslt from!822 to!789))))

(declare-fun b!280587 () Bool)

(declare-fun res!232874 () Bool)

(assert (=> b!280587 (=> (not res!232874) (not e!200208))))

(declare-fun arrayBitRangesEq!0 (array!16205 array!16205 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!280587 (= res!232874 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!280588 () Bool)

(declare-datatypes ((Unit!19685 0))(
  ( (Unit!19686) )
))
(declare-fun e!200207 () Unit!19685)

(declare-fun Unit!19687 () Unit!19685)

(assert (=> b!280588 (= e!200207 Unit!19687)))

(declare-datatypes ((tuple4!760 0))(
  ( (tuple4!761 (_1!12455 (_ BitVec 32)) (_2!12455 (_ BitVec 32)) (_3!1160 (_ BitVec 32)) (_4!380 (_ BitVec 32))) )
))
(declare-fun lt!416928 () tuple4!760)

(declare-fun arrayRangesEq!1273 (array!16205 array!16205 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!280588 (arrayRangesEq!1273 a1!699 a2!699 (_1!12455 lt!416928) (_2!12455 lt!416928))))

(declare-fun lt!416926 () Unit!19685)

(declare-fun arrayRangesEqSymmetricLemma!180 (array!16205 array!16205 (_ BitVec 32) (_ BitVec 32)) Unit!19685)

(assert (=> b!280588 (= lt!416926 (arrayRangesEqSymmetricLemma!180 a1!699 a2!699 (_1!12455 lt!416928) (_2!12455 lt!416928)))))

(assert (=> b!280588 (arrayRangesEq!1273 a2!699 a1!699 (_1!12455 lt!416928) (_2!12455 lt!416928))))

(declare-fun b!280589 () Bool)

(declare-fun e!200205 () Bool)

(assert (=> b!280589 (= e!200205 (not (and (bvsge (_3!1160 lt!416928) #b00000000000000000000000000000000) (bvslt (_3!1160 lt!416928) (size!7005 a2!699)))))))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!280589 (byteRangesEq!0 (select (arr!8001 a1!699) (_3!1160 lt!416928)) (select (arr!8001 a2!699) (_3!1160 lt!416928)) ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000)))

(declare-fun b!280590 () Bool)

(declare-fun Unit!19688 () Unit!19685)

(assert (=> b!280590 (= e!200207 Unit!19688)))

(declare-fun b!280591 () Bool)

(assert (=> b!280591 (= e!200208 e!200205)))

(declare-fun res!232872 () Bool)

(assert (=> b!280591 (=> (not res!232872) (not e!200205))))

(assert (=> b!280591 (= res!232872 (not (= (_3!1160 lt!416928) (_4!380 lt!416928))))))

(declare-fun lt!416927 () Unit!19685)

(assert (=> b!280591 (= lt!416927 e!200207)))

(declare-fun c!13029 () Bool)

(assert (=> b!280591 (= c!13029 (bvslt (_1!12455 lt!416928) (_2!12455 lt!416928)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!760)

(assert (=> b!280591 (= lt!416928 (arrayBitIndices!0 from!822 to!789))))

(assert (= (and start!62632 res!232873) b!280587))

(assert (= (and b!280587 res!232874) b!280586))

(assert (= (and b!280586 res!232871) b!280591))

(assert (= (and b!280591 c!13029) b!280588))

(assert (= (and b!280591 (not c!13029)) b!280590))

(assert (= (and b!280591 res!232872) b!280589))

(declare-fun m!413599 () Bool)

(assert (=> b!280589 m!413599))

(declare-fun m!413601 () Bool)

(assert (=> b!280589 m!413601))

(assert (=> b!280589 m!413599))

(assert (=> b!280589 m!413601))

(declare-fun m!413603 () Bool)

(assert (=> b!280589 m!413603))

(declare-fun m!413605 () Bool)

(assert (=> start!62632 m!413605))

(declare-fun m!413607 () Bool)

(assert (=> start!62632 m!413607))

(declare-fun m!413609 () Bool)

(assert (=> b!280591 m!413609))

(declare-fun m!413611 () Bool)

(assert (=> b!280587 m!413611))

(declare-fun m!413613 () Bool)

(assert (=> b!280588 m!413613))

(declare-fun m!413615 () Bool)

(assert (=> b!280588 m!413615))

(declare-fun m!413617 () Bool)

(assert (=> b!280588 m!413617))

(push 1)

(assert (not b!280588))

(assert (not b!280591))

(assert (not b!280587))

(assert (not start!62632))

(assert (not b!280589))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!96508 () Bool)

(declare-fun res!232897 () Bool)

(declare-fun e!200233 () Bool)

(assert (=> d!96508 (=> res!232897 e!200233)))

(assert (=> d!96508 (= res!232897 (= (_1!12455 lt!416928) (_2!12455 lt!416928)))))

(assert (=> d!96508 (= (arrayRangesEq!1273 a1!699 a2!699 (_1!12455 lt!416928) (_2!12455 lt!416928)) e!200233)))

(declare-fun b!280618 () Bool)

(declare-fun e!200234 () Bool)

(assert (=> b!280618 (= e!200233 e!200234)))

(declare-fun res!232898 () Bool)

(assert (=> b!280618 (=> (not res!232898) (not e!200234))))

(assert (=> b!280618 (= res!232898 (= (select (arr!8001 a1!699) (_1!12455 lt!416928)) (select (arr!8001 a2!699) (_1!12455 lt!416928))))))

(declare-fun b!280619 () Bool)

(assert (=> b!280619 (= e!200234 (arrayRangesEq!1273 a1!699 a2!699 (bvadd (_1!12455 lt!416928) #b00000000000000000000000000000001) (_2!12455 lt!416928)))))

(assert (= (and d!96508 (not res!232897)) b!280618))

(assert (= (and b!280618 res!232898) b!280619))

(declare-fun m!413629 () Bool)

(assert (=> b!280618 m!413629))

(declare-fun m!413631 () Bool)

(assert (=> b!280618 m!413631))

(declare-fun m!413633 () Bool)

(assert (=> b!280619 m!413633))

(assert (=> b!280588 d!96508))

(declare-fun d!96510 () Bool)

(assert (=> d!96510 (arrayRangesEq!1273 a2!699 a1!699 (_1!12455 lt!416928) (_2!12455 lt!416928))))

(declare-fun lt!416943 () Unit!19685)

(declare-fun choose!486 (array!16205 array!16205 (_ BitVec 32) (_ BitVec 32)) Unit!19685)

(assert (=> d!96510 (= lt!416943 (choose!486 a1!699 a2!699 (_1!12455 lt!416928) (_2!12455 lt!416928)))))

(assert (=> d!96510 (and (bvsle #b00000000000000000000000000000000 (_1!12455 lt!416928)) (bvsle (_1!12455 lt!416928) (_2!12455 lt!416928)) (bvsle (_2!12455 lt!416928) (size!7005 a1!699)))))

(assert (=> d!96510 (= (arrayRangesEqSymmetricLemma!180 a1!699 a2!699 (_1!12455 lt!416928) (_2!12455 lt!416928)) lt!416943)))

(declare-fun bs!24324 () Bool)

(assert (= bs!24324 d!96510))

(assert (=> bs!24324 m!413617))

(declare-fun m!413649 () Bool)

(assert (=> bs!24324 m!413649))

(assert (=> b!280588 d!96510))

(declare-fun d!96520 () Bool)

(declare-fun res!232904 () Bool)

(declare-fun e!200241 () Bool)

(assert (=> d!96520 (=> res!232904 e!200241)))

(assert (=> d!96520 (= res!232904 (= (_1!12455 lt!416928) (_2!12455 lt!416928)))))

(assert (=> d!96520 (= (arrayRangesEq!1273 a2!699 a1!699 (_1!12455 lt!416928) (_2!12455 lt!416928)) e!200241)))

(declare-fun b!280627 () Bool)

(declare-fun e!200242 () Bool)

(assert (=> b!280627 (= e!200241 e!200242)))

(declare-fun res!232905 () Bool)

(assert (=> b!280627 (=> (not res!232905) (not e!200242))))

(assert (=> b!280627 (= res!232905 (= (select (arr!8001 a2!699) (_1!12455 lt!416928)) (select (arr!8001 a1!699) (_1!12455 lt!416928))))))

(declare-fun b!280628 () Bool)

(assert (=> b!280628 (= e!200242 (arrayRangesEq!1273 a2!699 a1!699 (bvadd (_1!12455 lt!416928) #b00000000000000000000000000000001) (_2!12455 lt!416928)))))

(assert (= (and d!96520 (not res!232904)) b!280627))

(assert (= (and b!280627 res!232905) b!280628))

(assert (=> b!280627 m!413631))

(assert (=> b!280627 m!413629))

(declare-fun m!413651 () Bool)

(assert (=> b!280628 m!413651))

(assert (=> b!280588 d!96520))

(declare-fun d!96522 () Bool)

(assert (=> d!96522 (= (array_inv!6729 a1!699) (bvsge (size!7005 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!62632 d!96522))

(declare-fun d!96524 () Bool)

(assert (=> d!96524 (= (array_inv!6729 a2!699) (bvsge (size!7005 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!62632 d!96524))

(declare-fun d!96526 () Bool)

(assert (=> d!96526 (= (byteRangesEq!0 (select (arr!8001 a1!699) (_3!1160 lt!416928)) (select (arr!8001 a2!699) (_3!1160 lt!416928)) ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000) (or (= ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8001 a1!699) (_3!1160 lt!416928))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!8001 a2!699) (_3!1160 lt!416928))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111))))))

(declare-fun bs!24326 () Bool)

(assert (= bs!24326 d!96526))

(declare-fun m!413657 () Bool)

(assert (=> bs!24326 m!413657))

(declare-fun m!413659 () Bool)

(assert (=> bs!24326 m!413659))

(assert (=> b!280589 d!96526))

(declare-fun d!96532 () Bool)

(assert (=> d!96532 (= (arrayBitIndices!0 from!822 to!789) (tuple4!761 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!280591 d!96532))

(declare-fun d!96536 () Bool)

(declare-fun res!232941 () Bool)

(declare-fun e!200283 () Bool)

(assert (=> d!96536 (=> res!232941 e!200283)))

(assert (=> d!96536 (= res!232941 (bvsge from!822 to!789))))

(assert (=> d!96536 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!200283)))

(declare-fun b!280672 () Bool)

(declare-fun e!200282 () Bool)

(declare-fun call!4646 () Bool)

(assert (=> b!280672 (= e!200282 call!4646)))

(declare-fun b!280673 () Bool)

(declare-fun res!232942 () Bool)

(declare-fun lt!416963 () (_ BitVec 32))

(assert (=> b!280673 (= res!232942 (= lt!416963 #b00000000000000000000000000000000))))

(declare-fun e!200281 () Bool)

(assert (=> b!280673 (=> res!232942 e!200281)))

(declare-fun e!200285 () Bool)

(assert (=> b!280673 (= e!200285 e!200281)))

(declare-fun b!280674 () Bool)

(declare-fun e!200284 () Bool)

(assert (=> b!280674 (= e!200284 e!200282)))

(declare-fun c!13038 () Bool)

(declare-fun lt!416964 () tuple4!760)

(assert (=> b!280674 (= c!13038 (= (_3!1160 lt!416964) (_4!380 lt!416964)))))

(declare-fun lt!416962 () (_ BitVec 32))

(declare-fun bm!4643 () Bool)

(assert (=> bm!4643 (= call!4646 (byteRangesEq!0 (ite c!13038 (select (arr!8001 a1!699) (_3!1160 lt!416964)) (select (arr!8001 a1!699) (_4!380 lt!416964))) (ite c!13038 (select (arr!8001 a2!699) (_3!1160 lt!416964)) (select (arr!8001 a2!699) (_4!380 lt!416964))) (ite c!13038 lt!416962 #b00000000000000000000000000000000) lt!416963))))

(declare-fun b!280675 () Bool)

(assert (=> b!280675 (= e!200281 call!4646)))

(declare-fun b!280676 () Bool)

(assert (=> b!280676 (= e!200282 e!200285)))

(declare-fun res!232943 () Bool)

(assert (=> b!280676 (= res!232943 (byteRangesEq!0 (select (arr!8001 a1!699) (_3!1160 lt!416964)) (select (arr!8001 a2!699) (_3!1160 lt!416964)) lt!416962 #b00000000000000000000000000001000))))

(assert (=> b!280676 (=> (not res!232943) (not e!200285))))

(declare-fun b!280677 () Bool)

(declare-fun e!200286 () Bool)

(assert (=> b!280677 (= e!200286 (arrayRangesEq!1273 a1!699 a2!699 (_1!12455 lt!416964) (_2!12455 lt!416964)))))

(declare-fun b!280678 () Bool)

(assert (=> b!280678 (= e!200283 e!200284)))

(declare-fun res!232939 () Bool)

(assert (=> b!280678 (=> (not res!232939) (not e!200284))))

(assert (=> b!280678 (= res!232939 e!200286)))

(declare-fun res!232940 () Bool)

(assert (=> b!280678 (=> res!232940 e!200286)))

(assert (=> b!280678 (= res!232940 (bvsge (_1!12455 lt!416964) (_2!12455 lt!416964)))))

(assert (=> b!280678 (= lt!416963 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!280678 (= lt!416962 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!280678 (= lt!416964 (arrayBitIndices!0 from!822 to!789))))

(assert (= (and d!96536 (not res!232941)) b!280678))

(assert (= (and b!280678 (not res!232940)) b!280677))

(assert (= (and b!280678 res!232939) b!280674))

(assert (= (and b!280674 c!13038) b!280672))

(assert (= (and b!280674 (not c!13038)) b!280676))

(assert (= (and b!280676 res!232943) b!280673))

(assert (= (and b!280673 (not res!232942)) b!280675))

(assert (= (or b!280672 b!280675) bm!4643))

(declare-fun m!413689 () Bool)

(assert (=> bm!4643 m!413689))

(declare-fun m!413691 () Bool)

(assert (=> bm!4643 m!413691))

(declare-fun m!413693 () Bool)

(assert (=> bm!4643 m!413693))

(declare-fun m!413695 () Bool)

(assert (=> bm!4643 m!413695))

(declare-fun m!413697 () Bool)

(assert (=> bm!4643 m!413697))

(assert (=> b!280676 m!413697))

(assert (=> b!280676 m!413691))

(assert (=> b!280676 m!413697))

(assert (=> b!280676 m!413691))

(declare-fun m!413699 () Bool)

(assert (=> b!280676 m!413699))

(declare-fun m!413701 () Bool)

(assert (=> b!280677 m!413701))

(assert (=> b!280678 m!413609))

(assert (=> b!280587 d!96536))

(push 1)

(assert (not b!280678))

(assert (not d!96510))

(assert (not b!280628))

(assert (not b!280677))

(assert (not bm!4643))

(assert (not b!280619))

(assert (not b!280676))

(check-sat)

(pop 1)

(push 1)

(check-sat)

