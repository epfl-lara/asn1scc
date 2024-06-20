; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61944 () Bool)

(assert start!61944)

(declare-fun b!277622 () Bool)

(declare-fun res!230594 () Bool)

(declare-fun e!197568 () Bool)

(assert (=> b!277622 (=> (not res!230594) (not e!197568))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!277622 (= res!230594 (bvslt from!822 to!789))))

(declare-fun res!230595 () Bool)

(assert (=> start!61944 (=> (not res!230595) (not e!197568))))

(declare-datatypes ((array!15952 0))(
  ( (array!15953 (arr!7897 (Array (_ BitVec 32) (_ BitVec 8))) (size!6901 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!15952)

(declare-fun a2!699 () array!15952)

(assert (=> start!61944 (= res!230595 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6901 a1!699) (size!6901 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6901 a1!699))))))))

(assert (=> start!61944 e!197568))

(assert (=> start!61944 true))

(declare-fun array_inv!6625 (array!15952) Bool)

(assert (=> start!61944 (array_inv!6625 a1!699)))

(assert (=> start!61944 (array_inv!6625 a2!699)))

(declare-datatypes ((tuple4!588 0))(
  ( (tuple4!589 (_1!12369 (_ BitVec 32)) (_2!12369 (_ BitVec 32)) (_3!1074 (_ BitVec 32)) (_4!294 (_ BitVec 32))) )
))
(declare-fun lt!415493 () tuple4!588)

(declare-fun e!197565 () Bool)

(declare-fun b!277624 () Bool)

(assert (=> b!277624 (= e!197565 (not (or (bvsgt #b00000000000000000000000000000000 (_1!12369 lt!415493)) (bvsgt (_1!12369 lt!415493) (_2!12369 lt!415493)) (bvsgt (size!6901 a2!699) (size!6901 a1!699)) (bvsle (_2!12369 lt!415493) (size!6901 a2!699)))))))

(declare-fun arrayRangesEq!1187 (array!15952 array!15952 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!277624 (arrayRangesEq!1187 a2!699 a1!699 (_1!12369 lt!415493) (_2!12369 lt!415493))))

(declare-datatypes ((Unit!19401 0))(
  ( (Unit!19402) )
))
(declare-fun lt!415494 () Unit!19401)

(declare-fun arrayRangesEqSymmetricLemma!106 (array!15952 array!15952 (_ BitVec 32) (_ BitVec 32)) Unit!19401)

(assert (=> b!277624 (= lt!415494 (arrayRangesEqSymmetricLemma!106 a1!699 a2!699 (_1!12369 lt!415493) (_2!12369 lt!415493)))))

(assert (=> b!277624 (arrayRangesEq!1187 a1!699 a2!699 (_1!12369 lt!415493) (_2!12369 lt!415493))))

(declare-fun b!277623 () Bool)

(assert (=> b!277623 (= e!197568 e!197565)))

(declare-fun res!230597 () Bool)

(assert (=> b!277623 (=> (not res!230597) (not e!197565))))

(assert (=> b!277623 (= res!230597 (bvslt (_1!12369 lt!415493) (_2!12369 lt!415493)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!588)

(assert (=> b!277623 (= lt!415493 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!277621 () Bool)

(declare-fun res!230596 () Bool)

(assert (=> b!277621 (=> (not res!230596) (not e!197568))))

(declare-fun arrayBitRangesEq!0 (array!15952 array!15952 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!277621 (= res!230596 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(assert (= (and start!61944 res!230595) b!277621))

(assert (= (and b!277621 res!230596) b!277622))

(assert (= (and b!277622 res!230594) b!277623))

(assert (= (and b!277623 res!230597) b!277624))

(declare-fun m!410755 () Bool)

(assert (=> start!61944 m!410755))

(declare-fun m!410757 () Bool)

(assert (=> start!61944 m!410757))

(declare-fun m!410759 () Bool)

(assert (=> b!277624 m!410759))

(declare-fun m!410761 () Bool)

(assert (=> b!277624 m!410761))

(declare-fun m!410763 () Bool)

(assert (=> b!277624 m!410763))

(declare-fun m!410765 () Bool)

(assert (=> b!277623 m!410765))

(declare-fun m!410767 () Bool)

(assert (=> b!277621 m!410767))

(push 1)

(assert (not b!277621))

(assert (not start!61944))

(assert (not b!277624))

(assert (not b!277623))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun e!197634 () Bool)

(declare-fun b!277692 () Bool)

(declare-fun lt!415526 () tuple4!588)

(assert (=> b!277692 (= e!197634 (arrayRangesEq!1187 a1!699 a2!699 (_1!12369 lt!415526) (_2!12369 lt!415526)))))

(declare-fun b!277693 () Bool)

(declare-fun e!197632 () Bool)

(declare-fun e!197633 () Bool)

(assert (=> b!277693 (= e!197632 e!197633)))

(declare-fun res!230658 () Bool)

(assert (=> b!277693 (=> (not res!230658) (not e!197633))))

(assert (=> b!277693 (= res!230658 e!197634)))

(declare-fun res!230656 () Bool)

(assert (=> b!277693 (=> res!230656 e!197634)))

(assert (=> b!277693 (= res!230656 (bvsge (_1!12369 lt!415526) (_2!12369 lt!415526)))))

(declare-fun lt!415525 () (_ BitVec 32))

(assert (=> b!277693 (= lt!415525 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!415527 () (_ BitVec 32))

(assert (=> b!277693 (= lt!415527 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!277693 (= lt!415526 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!277695 () Bool)

(declare-fun e!197636 () Bool)

(assert (=> b!277695 (= e!197633 e!197636)))

(declare-fun c!12690 () Bool)

(assert (=> b!277695 (= c!12690 (= (_3!1074 lt!415526) (_4!294 lt!415526)))))

(declare-fun bm!4502 () Bool)

(declare-fun call!4505 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4502 (= call!4505 (byteRangesEq!0 (ite c!12690 (select (arr!7897 a1!699) (_3!1074 lt!415526)) (select (arr!7897 a1!699) (_4!294 lt!415526))) (ite c!12690 (select (arr!7897 a2!699) (_3!1074 lt!415526)) (select (arr!7897 a2!699) (_4!294 lt!415526))) (ite c!12690 lt!415527 #b00000000000000000000000000000000) lt!415525))))

(declare-fun b!277696 () Bool)

(assert (=> b!277696 (= e!197636 call!4505)))

(declare-fun b!277697 () Bool)

(declare-fun e!197635 () Bool)

(assert (=> b!277697 (= e!197636 e!197635)))

(declare-fun res!230659 () Bool)

(assert (=> b!277697 (= res!230659 (byteRangesEq!0 (select (arr!7897 a1!699) (_3!1074 lt!415526)) (select (arr!7897 a2!699) (_3!1074 lt!415526)) lt!415527 #b00000000000000000000000000001000))))

(assert (=> b!277697 (=> (not res!230659) (not e!197635))))

(declare-fun b!277698 () Bool)

(declare-fun res!230655 () Bool)

(assert (=> b!277698 (= res!230655 (= lt!415525 #b00000000000000000000000000000000))))

(declare-fun e!197631 () Bool)

(assert (=> b!277698 (=> res!230655 e!197631)))

(assert (=> b!277698 (= e!197635 e!197631)))

(declare-fun b!277694 () Bool)

(assert (=> b!277694 (= e!197631 call!4505)))

(declare-fun d!95760 () Bool)

(declare-fun res!230657 () Bool)

(assert (=> d!95760 (=> res!230657 e!197632)))

(assert (=> d!95760 (= res!230657 (bvsge from!822 to!789))))

(assert (=> d!95760 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!197632)))

(assert (= (and d!95760 (not res!230657)) b!277693))

(assert (= (and b!277693 (not res!230656)) b!277692))

(assert (= (and b!277693 res!230658) b!277695))

(assert (= (and b!277695 c!12690) b!277696))

(assert (= (and b!277695 (not c!12690)) b!277697))

(assert (= (and b!277697 res!230659) b!277698))

(assert (= (and b!277698 (not res!230655)) b!277694))

(assert (= (or b!277696 b!277694) bm!4502))

(declare-fun m!410821 () Bool)

(assert (=> b!277692 m!410821))

(assert (=> b!277693 m!410765))

(declare-fun m!410823 () Bool)

(assert (=> bm!4502 m!410823))

(declare-fun m!410825 () Bool)

(assert (=> bm!4502 m!410825))

(declare-fun m!410827 () Bool)

(assert (=> bm!4502 m!410827))

(declare-fun m!410829 () Bool)

(assert (=> bm!4502 m!410829))

(declare-fun m!410831 () Bool)

(assert (=> bm!4502 m!410831))

(assert (=> b!277697 m!410825))

(assert (=> b!277697 m!410823))

(assert (=> b!277697 m!410825))

(assert (=> b!277697 m!410823))

(declare-fun m!410833 () Bool)

(assert (=> b!277697 m!410833))

(assert (=> b!277621 d!95760))

(declare-fun d!95786 () Bool)

(assert (=> d!95786 (= (array_inv!6625 a1!699) (bvsge (size!6901 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!61944 d!95786))

(declare-fun d!95788 () Bool)

(assert (=> d!95788 (= (array_inv!6625 a2!699) (bvsge (size!6901 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!61944 d!95788))

(declare-fun d!95792 () Bool)

(declare-fun res!230678 () Bool)

(declare-fun e!197655 () Bool)

(assert (=> d!95792 (=> res!230678 e!197655)))

(assert (=> d!95792 (= res!230678 (= (_1!12369 lt!415493) (_2!12369 lt!415493)))))

(assert (=> d!95792 (= (arrayRangesEq!1187 a2!699 a1!699 (_1!12369 lt!415493) (_2!12369 lt!415493)) e!197655)))

(declare-fun b!277715 () Bool)

(declare-fun e!197656 () Bool)

(assert (=> b!277715 (= e!197655 e!197656)))

(declare-fun res!230679 () Bool)

(assert (=> b!277715 (=> (not res!230679) (not e!197656))))

(assert (=> b!277715 (= res!230679 (= (select (arr!7897 a2!699) (_1!12369 lt!415493)) (select (arr!7897 a1!699) (_1!12369 lt!415493))))))

(declare-fun b!277716 () Bool)

(assert (=> b!277716 (= e!197656 (arrayRangesEq!1187 a2!699 a1!699 (bvadd (_1!12369 lt!415493) #b00000000000000000000000000000001) (_2!12369 lt!415493)))))

(assert (= (and d!95792 (not res!230678)) b!277715))

(assert (= (and b!277715 res!230679) b!277716))

(declare-fun m!410845 () Bool)

(assert (=> b!277715 m!410845))

(declare-fun m!410847 () Bool)

(assert (=> b!277715 m!410847))

(declare-fun m!410849 () Bool)

(assert (=> b!277716 m!410849))

(assert (=> b!277624 d!95792))

(declare-fun d!95796 () Bool)

(assert (=> d!95796 (arrayRangesEq!1187 a2!699 a1!699 (_1!12369 lt!415493) (_2!12369 lt!415493))))

(declare-fun lt!415539 () Unit!19401)

(declare-fun choose!451 (array!15952 array!15952 (_ BitVec 32) (_ BitVec 32)) Unit!19401)

(assert (=> d!95796 (= lt!415539 (choose!451 a1!699 a2!699 (_1!12369 lt!415493) (_2!12369 lt!415493)))))

(assert (=> d!95796 (and (bvsle #b00000000000000000000000000000000 (_1!12369 lt!415493)) (bvsle (_1!12369 lt!415493) (_2!12369 lt!415493)) (bvsle (_2!12369 lt!415493) (size!6901 a1!699)))))

(assert (=> d!95796 (= (arrayRangesEqSymmetricLemma!106 a1!699 a2!699 (_1!12369 lt!415493) (_2!12369 lt!415493)) lt!415539)))

(declare-fun bs!24154 () Bool)

(assert (= bs!24154 d!95796))

(assert (=> bs!24154 m!410759))

(declare-fun m!410851 () Bool)

(assert (=> bs!24154 m!410851))

(assert (=> b!277624 d!95796))

(declare-fun d!95798 () Bool)

(declare-fun res!230684 () Bool)

(declare-fun e!197663 () Bool)

(assert (=> d!95798 (=> res!230684 e!197663)))

(assert (=> d!95798 (= res!230684 (= (_1!12369 lt!415493) (_2!12369 lt!415493)))))

(assert (=> d!95798 (= (arrayRangesEq!1187 a1!699 a2!699 (_1!12369 lt!415493) (_2!12369 lt!415493)) e!197663)))

(declare-fun b!277727 () Bool)

(declare-fun e!197664 () Bool)

(assert (=> b!277727 (= e!197663 e!197664)))

(declare-fun res!230685 () Bool)

(assert (=> b!277727 (=> (not res!230685) (not e!197664))))

(assert (=> b!277727 (= res!230685 (= (select (arr!7897 a1!699) (_1!12369 lt!415493)) (select (arr!7897 a2!699) (_1!12369 lt!415493))))))

(declare-fun b!277728 () Bool)

(assert (=> b!277728 (= e!197664 (arrayRangesEq!1187 a1!699 a2!699 (bvadd (_1!12369 lt!415493) #b00000000000000000000000000000001) (_2!12369 lt!415493)))))

(assert (= (and d!95798 (not res!230684)) b!277727))

(assert (= (and b!277727 res!230685) b!277728))

(assert (=> b!277727 m!410847))

(assert (=> b!277727 m!410845))

(declare-fun m!410853 () Bool)

(assert (=> b!277728 m!410853))

(assert (=> b!277624 d!95798))

(declare-fun d!95800 () Bool)

(assert (=> d!95800 (= (arrayBitIndices!0 from!822 to!789) (tuple4!589 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!277623 d!95800))

(push 1)

(assert (not bm!4502))

(assert (not b!277697))

(assert (not b!277693))

(assert (not b!277716))

(assert (not b!277728))

(assert (not b!277692))

(assert (not d!95796))

(check-sat)

(pop 1)

(push 1)

(check-sat)

