; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61948 () Bool)

(assert start!61948)

(declare-fun e!197590 () Bool)

(declare-datatypes ((tuple4!592 0))(
  ( (tuple4!593 (_1!12371 (_ BitVec 32)) (_2!12371 (_ BitVec 32)) (_3!1076 (_ BitVec 32)) (_4!296 (_ BitVec 32))) )
))
(declare-fun lt!415505 () tuple4!592)

(declare-datatypes ((array!15956 0))(
  ( (array!15957 (arr!7899 (Array (_ BitVec 32) (_ BitVec 8))) (size!6903 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!15956)

(declare-fun b!277648 () Bool)

(declare-fun a2!699 () array!15956)

(assert (=> b!277648 (= e!197590 (not (or (bvsgt #b00000000000000000000000000000000 (_1!12371 lt!415505)) (bvsgt (_1!12371 lt!415505) (_2!12371 lt!415505)) (bvsgt (size!6903 a2!699) (size!6903 a1!699)) (bvsle (_2!12371 lt!415505) (size!6903 a2!699)))))))

(declare-fun arrayRangesEq!1189 (array!15956 array!15956 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!277648 (arrayRangesEq!1189 a2!699 a1!699 (_1!12371 lt!415505) (_2!12371 lt!415505))))

(declare-datatypes ((Unit!19405 0))(
  ( (Unit!19406) )
))
(declare-fun lt!415506 () Unit!19405)

(declare-fun arrayRangesEqSymmetricLemma!108 (array!15956 array!15956 (_ BitVec 32) (_ BitVec 32)) Unit!19405)

(assert (=> b!277648 (= lt!415506 (arrayRangesEqSymmetricLemma!108 a1!699 a2!699 (_1!12371 lt!415505) (_2!12371 lt!415505)))))

(assert (=> b!277648 (arrayRangesEq!1189 a1!699 a2!699 (_1!12371 lt!415505) (_2!12371 lt!415505))))

(declare-fun b!277647 () Bool)

(declare-fun e!197591 () Bool)

(assert (=> b!277647 (= e!197591 e!197590)))

(declare-fun res!230620 () Bool)

(assert (=> b!277647 (=> (not res!230620) (not e!197590))))

(assert (=> b!277647 (= res!230620 (bvslt (_1!12371 lt!415505) (_2!12371 lt!415505)))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!592)

(assert (=> b!277647 (= lt!415505 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!277645 () Bool)

(declare-fun res!230621 () Bool)

(assert (=> b!277645 (=> (not res!230621) (not e!197591))))

(declare-fun arrayBitRangesEq!0 (array!15956 array!15956 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!277645 (= res!230621 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun res!230619 () Bool)

(assert (=> start!61948 (=> (not res!230619) (not e!197591))))

(assert (=> start!61948 (= res!230619 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6903 a1!699) (size!6903 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6903 a1!699))))))))

(assert (=> start!61948 e!197591))

(assert (=> start!61948 true))

(declare-fun array_inv!6627 (array!15956) Bool)

(assert (=> start!61948 (array_inv!6627 a1!699)))

(assert (=> start!61948 (array_inv!6627 a2!699)))

(declare-fun b!277646 () Bool)

(declare-fun res!230618 () Bool)

(assert (=> b!277646 (=> (not res!230618) (not e!197591))))

(assert (=> b!277646 (= res!230618 (bvslt from!822 to!789))))

(assert (= (and start!61948 res!230619) b!277645))

(assert (= (and b!277645 res!230621) b!277646))

(assert (= (and b!277646 res!230618) b!277647))

(assert (= (and b!277647 res!230620) b!277648))

(declare-fun m!410783 () Bool)

(assert (=> b!277648 m!410783))

(declare-fun m!410785 () Bool)

(assert (=> b!277648 m!410785))

(declare-fun m!410787 () Bool)

(assert (=> b!277648 m!410787))

(declare-fun m!410789 () Bool)

(assert (=> b!277647 m!410789))

(declare-fun m!410791 () Bool)

(assert (=> b!277645 m!410791))

(declare-fun m!410793 () Bool)

(assert (=> start!61948 m!410793))

(declare-fun m!410795 () Bool)

(assert (=> start!61948 m!410795))

(push 1)

(assert (not start!61948))

(assert (not b!277647))

(assert (not b!277648))

(assert (not b!277645))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!95766 () Bool)

(assert (=> d!95766 (= (array_inv!6627 a1!699) (bvsge (size!6903 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!61948 d!95766))

(declare-fun d!95768 () Bool)

(assert (=> d!95768 (= (array_inv!6627 a2!699) (bvsge (size!6903 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!61948 d!95768))

(declare-fun d!95770 () Bool)

(assert (=> d!95770 (= (arrayBitIndices!0 from!822 to!789) (tuple4!593 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!277647 d!95770))

(declare-fun d!95772 () Bool)

(declare-fun res!230626 () Bool)

(declare-fun e!197597 () Bool)

(assert (=> d!95772 (=> res!230626 e!197597)))

(assert (=> d!95772 (= res!230626 (= (_1!12371 lt!415505) (_2!12371 lt!415505)))))

(assert (=> d!95772 (= (arrayRangesEq!1189 a2!699 a1!699 (_1!12371 lt!415505) (_2!12371 lt!415505)) e!197597)))

(declare-fun b!277653 () Bool)

(declare-fun e!197598 () Bool)

(assert (=> b!277653 (= e!197597 e!197598)))

(declare-fun res!230627 () Bool)

(assert (=> b!277653 (=> (not res!230627) (not e!197598))))

(assert (=> b!277653 (= res!230627 (= (select (arr!7899 a2!699) (_1!12371 lt!415505)) (select (arr!7899 a1!699) (_1!12371 lt!415505))))))

(declare-fun b!277654 () Bool)

(assert (=> b!277654 (= e!197598 (arrayRangesEq!1189 a2!699 a1!699 (bvadd (_1!12371 lt!415505) #b00000000000000000000000000000001) (_2!12371 lt!415505)))))

(assert (= (and d!95772 (not res!230626)) b!277653))

(assert (= (and b!277653 res!230627) b!277654))

(declare-fun m!410797 () Bool)

(assert (=> b!277653 m!410797))

(declare-fun m!410799 () Bool)

(assert (=> b!277653 m!410799))

(declare-fun m!410801 () Bool)

(assert (=> b!277654 m!410801))

(assert (=> b!277648 d!95772))

(declare-fun d!95774 () Bool)

(assert (=> d!95774 (arrayRangesEq!1189 a2!699 a1!699 (_1!12371 lt!415505) (_2!12371 lt!415505))))

(declare-fun lt!415521 () Unit!19405)

(declare-fun choose!449 (array!15956 array!15956 (_ BitVec 32) (_ BitVec 32)) Unit!19405)

(assert (=> d!95774 (= lt!415521 (choose!449 a1!699 a2!699 (_1!12371 lt!415505) (_2!12371 lt!415505)))))

(assert (=> d!95774 (and (bvsle #b00000000000000000000000000000000 (_1!12371 lt!415505)) (bvsle (_1!12371 lt!415505) (_2!12371 lt!415505)) (bvsle (_2!12371 lt!415505) (size!6903 a1!699)))))

(assert (=> d!95774 (= (arrayRangesEqSymmetricLemma!108 a1!699 a2!699 (_1!12371 lt!415505) (_2!12371 lt!415505)) lt!415521)))

(declare-fun bs!24152 () Bool)

(assert (= bs!24152 d!95774))

(assert (=> bs!24152 m!410783))

(declare-fun m!410803 () Bool)

(assert (=> bs!24152 m!410803))

(assert (=> b!277648 d!95774))

(declare-fun d!95776 () Bool)

(declare-fun res!230644 () Bool)

(declare-fun e!197619 () Bool)

(assert (=> d!95776 (=> res!230644 e!197619)))

(assert (=> d!95776 (= res!230644 (= (_1!12371 lt!415505) (_2!12371 lt!415505)))))

(assert (=> d!95776 (= (arrayRangesEq!1189 a1!699 a2!699 (_1!12371 lt!415505) (_2!12371 lt!415505)) e!197619)))

(declare-fun b!277679 () Bool)

(declare-fun e!197620 () Bool)

(assert (=> b!277679 (= e!197619 e!197620)))

(declare-fun res!230645 () Bool)

(assert (=> b!277679 (=> (not res!230645) (not e!197620))))

(assert (=> b!277679 (= res!230645 (= (select (arr!7899 a1!699) (_1!12371 lt!415505)) (select (arr!7899 a2!699) (_1!12371 lt!415505))))))

(declare-fun b!277680 () Bool)

(assert (=> b!277680 (= e!197620 (arrayRangesEq!1189 a1!699 a2!699 (bvadd (_1!12371 lt!415505) #b00000000000000000000000000000001) (_2!12371 lt!415505)))))

(assert (= (and d!95776 (not res!230644)) b!277679))

(assert (= (and b!277679 res!230645) b!277680))

(assert (=> b!277679 m!410799))

(assert (=> b!277679 m!410797))

(declare-fun m!410805 () Bool)

(assert (=> b!277680 m!410805))

(assert (=> b!277648 d!95776))

(declare-fun b!277729 () Bool)

(declare-fun e!197668 () Bool)

(declare-fun call!4508 () Bool)

(assert (=> b!277729 (= e!197668 call!4508)))

(declare-fun b!277730 () Bool)

(declare-fun e!197666 () Bool)

(declare-fun e!197665 () Bool)

(assert (=> b!277730 (= e!197666 e!197665)))

(declare-fun c!12693 () Bool)

(declare-fun lt!415541 () tuple4!592)

(assert (=> b!277730 (= c!12693 (= (_3!1076 lt!415541) (_4!296 lt!415541)))))

(declare-fun b!277731 () Bool)

(assert (=> b!277731 (= e!197665 call!4508)))

(declare-fun b!277732 () Bool)

(declare-fun e!197667 () Bool)

(assert (=> b!277732 (= e!197665 e!197667)))

(declare-fun res!230690 () Bool)

(declare-fun lt!415540 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!277732 (= res!230690 (byteRangesEq!0 (select (arr!7899 a1!699) (_3!1076 lt!415541)) (select (arr!7899 a2!699) (_3!1076 lt!415541)) lt!415540 #b00000000000000000000000000001000))))

(assert (=> b!277732 (=> (not res!230690) (not e!197667))))

(declare-fun e!197670 () Bool)

(declare-fun b!277733 () Bool)

(assert (=> b!277733 (= e!197670 (arrayRangesEq!1189 a1!699 a2!699 (_1!12371 lt!415541) (_2!12371 lt!415541)))))

(declare-fun b!277734 () Bool)

(declare-fun res!230688 () Bool)

(declare-fun lt!415542 () (_ BitVec 32))

(assert (=> b!277734 (= res!230688 (= lt!415542 #b00000000000000000000000000000000))))

(assert (=> b!277734 (=> res!230688 e!197668)))

(assert (=> b!277734 (= e!197667 e!197668)))

(declare-fun d!95778 () Bool)

(declare-fun res!230686 () Bool)

(declare-fun e!197669 () Bool)

(assert (=> d!95778 (=> res!230686 e!197669)))

(assert (=> d!95778 (= res!230686 (bvsge from!822 to!789))))

(assert (=> d!95778 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!197669)))

(declare-fun b!277735 () Bool)

(assert (=> b!277735 (= e!197669 e!197666)))

(declare-fun res!230687 () Bool)

(assert (=> b!277735 (=> (not res!230687) (not e!197666))))

(assert (=> b!277735 (= res!230687 e!197670)))

(declare-fun res!230689 () Bool)

(assert (=> b!277735 (=> res!230689 e!197670)))

(assert (=> b!277735 (= res!230689 (bvsge (_1!12371 lt!415541) (_2!12371 lt!415541)))))

(assert (=> b!277735 (= lt!415542 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!277735 (= lt!415540 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!277735 (= lt!415541 (arrayBitIndices!0 from!822 to!789))))

(declare-fun bm!4505 () Bool)

(assert (=> bm!4505 (= call!4508 (byteRangesEq!0 (ite c!12693 (select (arr!7899 a1!699) (_3!1076 lt!415541)) (select (arr!7899 a1!699) (_4!296 lt!415541))) (ite c!12693 (select (arr!7899 a2!699) (_3!1076 lt!415541)) (select (arr!7899 a2!699) (_4!296 lt!415541))) (ite c!12693 lt!415540 #b00000000000000000000000000000000) lt!415542))))

(assert (= (and d!95778 (not res!230686)) b!277735))

(assert (= (and b!277735 (not res!230689)) b!277733))

(assert (= (and b!277735 res!230687) b!277730))

(assert (= (and b!277730 c!12693) b!277731))

(assert (= (and b!277730 (not c!12693)) b!277732))

(assert (= (and b!277732 res!230690) b!277734))

(assert (= (and b!277734 (not res!230688)) b!277729))

(assert (= (or b!277731 b!277729) bm!4505))

(declare-fun m!410855 () Bool)

(assert (=> b!277732 m!410855))

(declare-fun m!410857 () Bool)

(assert (=> b!277732 m!410857))

(assert (=> b!277732 m!410855))

(assert (=> b!277732 m!410857))

(declare-fun m!410859 () Bool)

(assert (=> b!277732 m!410859))

(declare-fun m!410861 () Bool)

(assert (=> b!277733 m!410861))

(assert (=> b!277735 m!410789))

(assert (=> bm!4505 m!410857))

(declare-fun m!410863 () Bool)

(assert (=> bm!4505 m!410863))

(declare-fun m!410865 () Bool)

(assert (=> bm!4505 m!410865))

(assert (=> bm!4505 m!410855))

(declare-fun m!410867 () Bool)

(assert (=> bm!4505 m!410867))

(assert (=> b!277645 d!95778))

(push 1)

(assert (not b!277654))

(assert (not b!277733))

(assert (not b!277735))

(assert (not b!277732))

(assert (not bm!4505))

(assert (not d!95774))

(assert (not b!277680))

(check-sat)

(pop 1)

(push 1)

(check-sat)

