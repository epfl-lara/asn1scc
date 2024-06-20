; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62188 () Bool)

(assert start!62188)

(declare-fun b!278942 () Bool)

(declare-fun res!231626 () Bool)

(declare-fun e!198760 () Bool)

(assert (=> b!278942 (=> (not res!231626) (not e!198760))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!278942 (= res!231626 (bvslt from!822 to!789))))

(declare-fun b!278944 () Bool)

(declare-fun e!198759 () Bool)

(declare-datatypes ((tuple4!676 0))(
  ( (tuple4!677 (_1!12413 (_ BitVec 32)) (_2!12413 (_ BitVec 32)) (_3!1118 (_ BitVec 32)) (_4!338 (_ BitVec 32))) )
))
(declare-fun lt!416163 () tuple4!676)

(declare-datatypes ((array!16088 0))(
  ( (array!16089 (arr!7959 (Array (_ BitVec 32) (_ BitVec 8))) (size!6963 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16088)

(assert (=> b!278944 (= e!198759 (not (and (bvsle #b00000000000000000000000000000000 (_1!12413 lt!416163)) (bvsle (_1!12413 lt!416163) (_2!12413 lt!416163)) (bvsle (_2!12413 lt!416163) (size!6963 a1!699)))))))

(declare-fun a2!699 () array!16088)

(declare-fun arrayRangesEq!1231 (array!16088 array!16088 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278944 (arrayRangesEq!1231 a1!699 a2!699 (_1!12413 lt!416163) (_2!12413 lt!416163))))

(declare-fun b!278943 () Bool)

(assert (=> b!278943 (= e!198760 e!198759)))

(declare-fun res!231628 () Bool)

(assert (=> b!278943 (=> (not res!231628) (not e!198759))))

(assert (=> b!278943 (= res!231628 (bvslt (_1!12413 lt!416163) (_2!12413 lt!416163)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!676)

(assert (=> b!278943 (= lt!416163 (arrayBitIndices!0 from!822 to!789))))

(declare-fun res!231629 () Bool)

(assert (=> start!62188 (=> (not res!231629) (not e!198760))))

(assert (=> start!62188 (= res!231629 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6963 a1!699) (size!6963 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6963 a1!699))))))))

(assert (=> start!62188 e!198760))

(assert (=> start!62188 true))

(declare-fun array_inv!6687 (array!16088) Bool)

(assert (=> start!62188 (array_inv!6687 a1!699)))

(assert (=> start!62188 (array_inv!6687 a2!699)))

(declare-fun b!278941 () Bool)

(declare-fun res!231627 () Bool)

(assert (=> b!278941 (=> (not res!231627) (not e!198760))))

(declare-fun arrayBitRangesEq!0 (array!16088 array!16088 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!278941 (= res!231627 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(assert (= (and start!62188 res!231629) b!278941))

(assert (= (and b!278941 res!231627) b!278942))

(assert (= (and b!278942 res!231626) b!278943))

(assert (= (and b!278943 res!231628) b!278944))

(declare-fun m!412035 () Bool)

(assert (=> b!278944 m!412035))

(declare-fun m!412037 () Bool)

(assert (=> b!278943 m!412037))

(declare-fun m!412039 () Bool)

(assert (=> start!62188 m!412039))

(declare-fun m!412041 () Bool)

(assert (=> start!62188 m!412041))

(declare-fun m!412043 () Bool)

(assert (=> b!278941 m!412043))

(push 1)

(assert (not b!278941))

(assert (not b!278944))

(assert (not start!62188))

(assert (not b!278943))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!278979 () Bool)

(declare-fun e!198796 () Bool)

(declare-fun call!4540 () Bool)

(assert (=> b!278979 (= e!198796 call!4540)))

(declare-fun lt!416177 () tuple4!676)

(declare-fun b!278980 () Bool)

(declare-fun e!198795 () Bool)

(assert (=> b!278980 (= e!198795 (arrayRangesEq!1231 a1!699 a2!699 (_1!12413 lt!416177) (_2!12413 lt!416177)))))

(declare-fun e!198797 () Bool)

(declare-fun b!278981 () Bool)

(declare-fun lt!416178 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278981 (= e!198797 (byteRangesEq!0 (select (arr!7959 a1!699) (_4!338 lt!416177)) (select (arr!7959 a2!699) (_4!338 lt!416177)) #b00000000000000000000000000000000 lt!416178))))

(declare-fun b!278982 () Bool)

(declare-fun e!198793 () Bool)

(assert (=> b!278982 (= e!198796 e!198793)))

(declare-fun res!231659 () Bool)

(assert (=> b!278982 (= res!231659 call!4540)))

(assert (=> b!278982 (=> (not res!231659) (not e!198793))))

(declare-fun d!95972 () Bool)

(declare-fun res!231656 () Bool)

(declare-fun e!198798 () Bool)

(assert (=> d!95972 (=> res!231656 e!198798)))

(assert (=> d!95972 (= res!231656 (bvsge from!822 to!789))))

(assert (=> d!95972 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!198798)))

(declare-fun b!278983 () Bool)

(declare-fun res!231657 () Bool)

(assert (=> b!278983 (= res!231657 (= lt!416178 #b00000000000000000000000000000000))))

(assert (=> b!278983 (=> res!231657 e!198797)))

(assert (=> b!278983 (= e!198793 e!198797)))

(declare-fun b!278984 () Bool)

(declare-fun e!198794 () Bool)

(assert (=> b!278984 (= e!198794 e!198796)))

(declare-fun c!12833 () Bool)

(assert (=> b!278984 (= c!12833 (= (_3!1118 lt!416177) (_4!338 lt!416177)))))

(declare-fun b!278985 () Bool)

(assert (=> b!278985 (= e!198798 e!198794)))

(declare-fun res!231660 () Bool)

(assert (=> b!278985 (=> (not res!231660) (not e!198794))))

(assert (=> b!278985 (= res!231660 e!198795)))

(declare-fun res!231658 () Bool)

(assert (=> b!278985 (=> res!231658 e!198795)))

(assert (=> b!278985 (= res!231658 (bvsge (_1!12413 lt!416177) (_2!12413 lt!416177)))))

(assert (=> b!278985 (= lt!416178 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!416176 () (_ BitVec 32))

(assert (=> b!278985 (= lt!416176 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!278985 (= lt!416177 (arrayBitIndices!0 from!822 to!789))))

(declare-fun bm!4537 () Bool)

(assert (=> bm!4537 (= call!4540 (byteRangesEq!0 (select (arr!7959 a1!699) (_3!1118 lt!416177)) (select (arr!7959 a2!699) (_3!1118 lt!416177)) lt!416176 (ite c!12833 lt!416178 #b00000000000000000000000000001000)))))

(assert (= (and d!95972 (not res!231656)) b!278985))

(assert (= (and b!278985 (not res!231658)) b!278980))

(assert (= (and b!278985 res!231660) b!278984))

(assert (= (and b!278984 c!12833) b!278979))

(assert (= (and b!278984 (not c!12833)) b!278982))

(assert (= (and b!278982 res!231659) b!278983))

(assert (= (and b!278983 (not res!231657)) b!278981))

(assert (= (or b!278979 b!278982) bm!4537))

(declare-fun m!412051 () Bool)

(assert (=> b!278980 m!412051))

(declare-fun m!412053 () Bool)

(assert (=> b!278981 m!412053))

(declare-fun m!412055 () Bool)

(assert (=> b!278981 m!412055))

(assert (=> b!278981 m!412053))

(assert (=> b!278981 m!412055))

(declare-fun m!412057 () Bool)

(assert (=> b!278981 m!412057))

(assert (=> b!278985 m!412037))

(declare-fun m!412059 () Bool)

(assert (=> bm!4537 m!412059))

(declare-fun m!412061 () Bool)

(assert (=> bm!4537 m!412061))

(assert (=> bm!4537 m!412059))

(assert (=> bm!4537 m!412061))

(declare-fun m!412063 () Bool)

(assert (=> bm!4537 m!412063))

(assert (=> b!278941 d!95972))

(declare-fun d!95974 () Bool)

(declare-fun res!231670 () Bool)

(declare-fun e!198809 () Bool)

(assert (=> d!95974 (=> res!231670 e!198809)))

(assert (=> d!95974 (= res!231670 (= (_1!12413 lt!416163) (_2!12413 lt!416163)))))

(assert (=> d!95974 (= (arrayRangesEq!1231 a1!699 a2!699 (_1!12413 lt!416163) (_2!12413 lt!416163)) e!198809)))

(declare-fun b!278997 () Bool)

(declare-fun e!198810 () Bool)

(assert (=> b!278997 (= e!198809 e!198810)))

(declare-fun res!231671 () Bool)

(assert (=> b!278997 (=> (not res!231671) (not e!198810))))

(assert (=> b!278997 (= res!231671 (= (select (arr!7959 a1!699) (_1!12413 lt!416163)) (select (arr!7959 a2!699) (_1!12413 lt!416163))))))

(declare-fun b!278998 () Bool)

(assert (=> b!278998 (= e!198810 (arrayRangesEq!1231 a1!699 a2!699 (bvadd (_1!12413 lt!416163) #b00000000000000000000000000000001) (_2!12413 lt!416163)))))

(assert (= (and d!95974 (not res!231670)) b!278997))

(assert (= (and b!278997 res!231671) b!278998))

(declare-fun m!412079 () Bool)

(assert (=> b!278997 m!412079))

(declare-fun m!412081 () Bool)

(assert (=> b!278997 m!412081))

(declare-fun m!412083 () Bool)

(assert (=> b!278998 m!412083))

(assert (=> b!278944 d!95974))

(declare-fun d!95976 () Bool)

(assert (=> d!95976 (= (array_inv!6687 a1!699) (bvsge (size!6963 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!62188 d!95976))

(declare-fun d!95978 () Bool)

(assert (=> d!95978 (= (array_inv!6687 a2!699) (bvsge (size!6963 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!62188 d!95978))

(declare-fun d!95980 () Bool)

(assert (=> d!95980 (= (arrayBitIndices!0 from!822 to!789) (tuple4!677 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!278943 d!95980))

(push 1)

(assert (not b!278981))

(assert (not b!278980))

(assert (not b!278998))

(assert (not bm!4537))

(assert (not b!278985))

(check-sat)

(pop 1)

(push 1)

(check-sat)

