; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61906 () Bool)

(assert start!61906)

(declare-fun b!277467 () Bool)

(declare-fun e!197418 () Bool)

(declare-datatypes ((tuple4!576 0))(
  ( (tuple4!577 (_1!12363 (_ BitVec 32)) (_2!12363 (_ BitVec 32)) (_3!1068 (_ BitVec 32)) (_4!288 (_ BitVec 32))) )
))
(declare-fun lt!415424 () tuple4!576)

(assert (=> b!277467 (= e!197418 (not (and (bvsle #b00000000000000000000000000000000 (_1!12363 lt!415424)) (bvsle (_1!12363 lt!415424) (_2!12363 lt!415424)))))))

(declare-datatypes ((array!15937 0))(
  ( (array!15938 (arr!7891 (Array (_ BitVec 32) (_ BitVec 8))) (size!6895 (_ BitVec 32))) )
))
(declare-fun a2!699 () array!15937)

(declare-fun a1!699 () array!15937)

(declare-fun arrayRangesEq!1181 (array!15937 array!15937 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!277467 (arrayRangesEq!1181 a2!699 a1!699 (_1!12363 lt!415424) (_2!12363 lt!415424))))

(declare-datatypes ((Unit!19389 0))(
  ( (Unit!19390) )
))
(declare-fun lt!415425 () Unit!19389)

(declare-fun arrayRangesEqSymmetricLemma!100 (array!15937 array!15937 (_ BitVec 32) (_ BitVec 32)) Unit!19389)

(assert (=> b!277467 (= lt!415425 (arrayRangesEqSymmetricLemma!100 a1!699 a2!699 (_1!12363 lt!415424) (_2!12363 lt!415424)))))

(assert (=> b!277467 (arrayRangesEq!1181 a1!699 a2!699 (_1!12363 lt!415424) (_2!12363 lt!415424))))

(declare-fun b!277465 () Bool)

(declare-fun res!230457 () Bool)

(declare-fun e!197417 () Bool)

(assert (=> b!277465 (=> (not res!230457) (not e!197417))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!277465 (= res!230457 (bvslt from!822 to!789))))

(declare-fun b!277464 () Bool)

(declare-fun res!230458 () Bool)

(assert (=> b!277464 (=> (not res!230458) (not e!197417))))

(declare-fun arrayBitRangesEq!0 (array!15937 array!15937 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!277464 (= res!230458 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!277466 () Bool)

(assert (=> b!277466 (= e!197417 e!197418)))

(declare-fun res!230456 () Bool)

(assert (=> b!277466 (=> (not res!230456) (not e!197418))))

(assert (=> b!277466 (= res!230456 (bvslt (_1!12363 lt!415424) (_2!12363 lt!415424)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!576)

(assert (=> b!277466 (= lt!415424 (arrayBitIndices!0 from!822 to!789))))

(declare-fun res!230455 () Bool)

(assert (=> start!61906 (=> (not res!230455) (not e!197417))))

(assert (=> start!61906 (= res!230455 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6895 a1!699) (size!6895 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6895 a1!699))))))))

(assert (=> start!61906 e!197417))

(assert (=> start!61906 true))

(declare-fun array_inv!6619 (array!15937) Bool)

(assert (=> start!61906 (array_inv!6619 a1!699)))

(assert (=> start!61906 (array_inv!6619 a2!699)))

(assert (= (and start!61906 res!230455) b!277464))

(assert (= (and b!277464 res!230458) b!277465))

(assert (= (and b!277465 res!230457) b!277466))

(assert (= (and b!277466 res!230456) b!277467))

(declare-fun m!410609 () Bool)

(assert (=> b!277467 m!410609))

(declare-fun m!410611 () Bool)

(assert (=> b!277467 m!410611))

(declare-fun m!410613 () Bool)

(assert (=> b!277467 m!410613))

(declare-fun m!410615 () Bool)

(assert (=> b!277464 m!410615))

(declare-fun m!410617 () Bool)

(assert (=> b!277466 m!410617))

(declare-fun m!410619 () Bool)

(assert (=> start!61906 m!410619))

(declare-fun m!410621 () Bool)

(assert (=> start!61906 m!410621))

(push 1)

(assert (not b!277466))

(assert (not b!277464))

(assert (not start!61906))

(assert (not b!277467))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!95732 () Bool)

(assert (=> d!95732 (= (arrayBitIndices!0 from!822 to!789) (tuple4!577 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!277466 d!95732))

(declare-fun lt!415456 () tuple4!576)

(declare-fun b!277535 () Bool)

(declare-fun e!197484 () Bool)

(assert (=> b!277535 (= e!197484 (arrayRangesEq!1181 a1!699 a2!699 (_1!12363 lt!415456) (_2!12363 lt!415456)))))

(declare-fun d!95736 () Bool)

(declare-fun res!230516 () Bool)

(declare-fun e!197488 () Bool)

(assert (=> d!95736 (=> res!230516 e!197488)))

(assert (=> d!95736 (= res!230516 (bvsge from!822 to!789))))

(assert (=> d!95736 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!197488)))

(declare-fun lt!415458 () (_ BitVec 32))

(declare-fun bm!4493 () Bool)

(declare-fun c!12681 () Bool)

(declare-fun call!4496 () Bool)

(declare-fun lt!415457 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4493 (= call!4496 (byteRangesEq!0 (select (arr!7891 a1!699) (_3!1068 lt!415456)) (select (arr!7891 a2!699) (_3!1068 lt!415456)) lt!415458 (ite c!12681 lt!415457 #b00000000000000000000000000001000)))))

(declare-fun b!277536 () Bool)

(declare-fun e!197487 () Bool)

(assert (=> b!277536 (= e!197488 e!197487)))

(declare-fun res!230517 () Bool)

(assert (=> b!277536 (=> (not res!230517) (not e!197487))))

(assert (=> b!277536 (= res!230517 e!197484)))

(declare-fun res!230519 () Bool)

(assert (=> b!277536 (=> res!230519 e!197484)))

(assert (=> b!277536 (= res!230519 (bvsge (_1!12363 lt!415456) (_2!12363 lt!415456)))))

(assert (=> b!277536 (= lt!415457 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!277536 (= lt!415458 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!277536 (= lt!415456 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!277537 () Bool)

(declare-fun res!230518 () Bool)

(assert (=> b!277537 (= res!230518 (= lt!415457 #b00000000000000000000000000000000))))

(declare-fun e!197485 () Bool)

(assert (=> b!277537 (=> res!230518 e!197485)))

(declare-fun e!197483 () Bool)

(assert (=> b!277537 (= e!197483 e!197485)))

(declare-fun b!277538 () Bool)

(assert (=> b!277538 (= e!197485 (byteRangesEq!0 (select (arr!7891 a1!699) (_4!288 lt!415456)) (select (arr!7891 a2!699) (_4!288 lt!415456)) #b00000000000000000000000000000000 lt!415457))))

(declare-fun b!277539 () Bool)

(declare-fun e!197486 () Bool)

(assert (=> b!277539 (= e!197486 e!197483)))

(declare-fun res!230520 () Bool)

(assert (=> b!277539 (= res!230520 call!4496)))

(assert (=> b!277539 (=> (not res!230520) (not e!197483))))

(declare-fun b!277540 () Bool)

(assert (=> b!277540 (= e!197486 call!4496)))

(declare-fun b!277541 () Bool)

(assert (=> b!277541 (= e!197487 e!197486)))

(assert (=> b!277541 (= c!12681 (= (_3!1068 lt!415456) (_4!288 lt!415456)))))

(assert (= (and d!95736 (not res!230516)) b!277536))

(assert (= (and b!277536 (not res!230519)) b!277535))

(assert (= (and b!277536 res!230517) b!277541))

(assert (= (and b!277541 c!12681) b!277540))

(assert (= (and b!277541 (not c!12681)) b!277539))

(assert (= (and b!277539 res!230520) b!277537))

(assert (= (and b!277537 (not res!230518)) b!277538))

(assert (= (or b!277540 b!277539) bm!4493))

(declare-fun m!410675 () Bool)

(assert (=> b!277535 m!410675))

(declare-fun m!410677 () Bool)

(assert (=> bm!4493 m!410677))

(declare-fun m!410679 () Bool)

(assert (=> bm!4493 m!410679))

(assert (=> bm!4493 m!410677))

(assert (=> bm!4493 m!410679))

(declare-fun m!410681 () Bool)

(assert (=> bm!4493 m!410681))

(assert (=> b!277536 m!410617))

(declare-fun m!410683 () Bool)

(assert (=> b!277538 m!410683))

(declare-fun m!410685 () Bool)

(assert (=> b!277538 m!410685))

(assert (=> b!277538 m!410683))

(assert (=> b!277538 m!410685))

(declare-fun m!410687 () Bool)

(assert (=> b!277538 m!410687))

(assert (=> b!277464 d!95736))

(declare-fun d!95740 () Bool)

(assert (=> d!95740 (= (array_inv!6619 a1!699) (bvsge (size!6895 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!61906 d!95740))

(declare-fun d!95742 () Bool)

(assert (=> d!95742 (= (array_inv!6619 a2!699) (bvsge (size!6895 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!61906 d!95742))

(declare-fun d!95744 () Bool)

(declare-fun res!230525 () Bool)

(declare-fun e!197493 () Bool)

(assert (=> d!95744 (=> res!230525 e!197493)))

(assert (=> d!95744 (= res!230525 (= (_1!12363 lt!415424) (_2!12363 lt!415424)))))

(assert (=> d!95744 (= (arrayRangesEq!1181 a2!699 a1!699 (_1!12363 lt!415424) (_2!12363 lt!415424)) e!197493)))

(declare-fun b!277546 () Bool)

(declare-fun e!197494 () Bool)

(assert (=> b!277546 (= e!197493 e!197494)))

(declare-fun res!230526 () Bool)

(assert (=> b!277546 (=> (not res!230526) (not e!197494))))

(assert (=> b!277546 (= res!230526 (= (select (arr!7891 a2!699) (_1!12363 lt!415424)) (select (arr!7891 a1!699) (_1!12363 lt!415424))))))

(declare-fun b!277547 () Bool)

(assert (=> b!277547 (= e!197494 (arrayRangesEq!1181 a2!699 a1!699 (bvadd (_1!12363 lt!415424) #b00000000000000000000000000000001) (_2!12363 lt!415424)))))

(assert (= (and d!95744 (not res!230525)) b!277546))

(assert (= (and b!277546 res!230526) b!277547))

(declare-fun m!410689 () Bool)

(assert (=> b!277546 m!410689))

(declare-fun m!410691 () Bool)

(assert (=> b!277546 m!410691))

(declare-fun m!410693 () Bool)

(assert (=> b!277547 m!410693))

(assert (=> b!277467 d!95744))

(declare-fun d!95746 () Bool)

(assert (=> d!95746 (arrayRangesEq!1181 a2!699 a1!699 (_1!12363 lt!415424) (_2!12363 lt!415424))))

(declare-fun lt!415461 () Unit!19389)

(declare-fun choose!448 (array!15937 array!15937 (_ BitVec 32) (_ BitVec 32)) Unit!19389)

(assert (=> d!95746 (= lt!415461 (choose!448 a1!699 a2!699 (_1!12363 lt!415424) (_2!12363 lt!415424)))))

(assert (=> d!95746 (and (bvsle #b00000000000000000000000000000000 (_1!12363 lt!415424)) (bvsle (_1!12363 lt!415424) (_2!12363 lt!415424)) (bvsle (_2!12363 lt!415424) (size!6895 a1!699)))))

(assert (=> d!95746 (= (arrayRangesEqSymmetricLemma!100 a1!699 a2!699 (_1!12363 lt!415424) (_2!12363 lt!415424)) lt!415461)))

(declare-fun bs!24145 () Bool)

(assert (= bs!24145 d!95746))

(assert (=> bs!24145 m!410609))

(declare-fun m!410695 () Bool)

(assert (=> bs!24145 m!410695))

(assert (=> b!277467 d!95746))

(declare-fun d!95748 () Bool)

(declare-fun res!230527 () Bool)

(declare-fun e!197495 () Bool)

(assert (=> d!95748 (=> res!230527 e!197495)))

(assert (=> d!95748 (= res!230527 (= (_1!12363 lt!415424) (_2!12363 lt!415424)))))

(assert (=> d!95748 (= (arrayRangesEq!1181 a1!699 a2!699 (_1!12363 lt!415424) (_2!12363 lt!415424)) e!197495)))

(declare-fun b!277548 () Bool)

(declare-fun e!197496 () Bool)

(assert (=> b!277548 (= e!197495 e!197496)))

(declare-fun res!230528 () Bool)

(assert (=> b!277548 (=> (not res!230528) (not e!197496))))

(assert (=> b!277548 (= res!230528 (= (select (arr!7891 a1!699) (_1!12363 lt!415424)) (select (arr!7891 a2!699) (_1!12363 lt!415424))))))

(declare-fun b!277549 () Bool)

(assert (=> b!277549 (= e!197496 (arrayRangesEq!1181 a1!699 a2!699 (bvadd (_1!12363 lt!415424) #b00000000000000000000000000000001) (_2!12363 lt!415424)))))

(assert (= (and d!95748 (not res!230527)) b!277548))

(assert (= (and b!277548 res!230528) b!277549))

(assert (=> b!277548 m!410691))

(assert (=> b!277548 m!410689))

(declare-fun m!410697 () Bool)

(assert (=> b!277549 m!410697))

(assert (=> b!277467 d!95748))

(push 1)

