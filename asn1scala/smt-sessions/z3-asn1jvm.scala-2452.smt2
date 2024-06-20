; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62186 () Bool)

(assert start!62186)

(declare-fun b!278930 () Bool)

(declare-fun res!231616 () Bool)

(declare-fun e!198749 () Bool)

(assert (=> b!278930 (=> (not res!231616) (not e!198749))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!278930 (= res!231616 (bvslt from!822 to!789))))

(declare-fun b!278931 () Bool)

(declare-fun e!198750 () Bool)

(assert (=> b!278931 (= e!198749 e!198750)))

(declare-fun res!231614 () Bool)

(assert (=> b!278931 (=> (not res!231614) (not e!198750))))

(declare-datatypes ((tuple4!674 0))(
  ( (tuple4!675 (_1!12412 (_ BitVec 32)) (_2!12412 (_ BitVec 32)) (_3!1117 (_ BitVec 32)) (_4!337 (_ BitVec 32))) )
))
(declare-fun lt!416160 () tuple4!674)

(assert (=> b!278931 (= res!231614 (bvslt (_1!12412 lt!416160) (_2!12412 lt!416160)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!674)

(assert (=> b!278931 (= lt!416160 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!278929 () Bool)

(declare-fun res!231615 () Bool)

(assert (=> b!278929 (=> (not res!231615) (not e!198749))))

(declare-datatypes ((array!16086 0))(
  ( (array!16087 (arr!7958 (Array (_ BitVec 32) (_ BitVec 8))) (size!6962 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16086)

(declare-fun a2!699 () array!16086)

(declare-fun arrayBitRangesEq!0 (array!16086 array!16086 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!278929 (= res!231615 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun res!231617 () Bool)

(assert (=> start!62186 (=> (not res!231617) (not e!198749))))

(assert (=> start!62186 (= res!231617 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6962 a1!699) (size!6962 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6962 a1!699))))))))

(assert (=> start!62186 e!198749))

(assert (=> start!62186 true))

(declare-fun array_inv!6686 (array!16086) Bool)

(assert (=> start!62186 (array_inv!6686 a1!699)))

(assert (=> start!62186 (array_inv!6686 a2!699)))

(declare-fun b!278932 () Bool)

(assert (=> b!278932 (= e!198750 (not (and (bvsle #b00000000000000000000000000000000 (_1!12412 lt!416160)) (bvsle (_1!12412 lt!416160) (_2!12412 lt!416160)) (bvsle (_2!12412 lt!416160) (size!6962 a1!699)))))))

(declare-fun arrayRangesEq!1230 (array!16086 array!16086 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278932 (arrayRangesEq!1230 a1!699 a2!699 (_1!12412 lt!416160) (_2!12412 lt!416160))))

(assert (= (and start!62186 res!231617) b!278929))

(assert (= (and b!278929 res!231615) b!278930))

(assert (= (and b!278930 res!231616) b!278931))

(assert (= (and b!278931 res!231614) b!278932))

(declare-fun m!412025 () Bool)

(assert (=> b!278931 m!412025))

(declare-fun m!412027 () Bool)

(assert (=> b!278929 m!412027))

(declare-fun m!412029 () Bool)

(assert (=> start!62186 m!412029))

(declare-fun m!412031 () Bool)

(assert (=> start!62186 m!412031))

(declare-fun m!412033 () Bool)

(assert (=> b!278932 m!412033))

(check-sat (not b!278932) (not start!62186) (not b!278931) (not b!278929))
(check-sat)
(get-model)

(declare-fun d!95982 () Bool)

(declare-fun res!231676 () Bool)

(declare-fun e!198815 () Bool)

(assert (=> d!95982 (=> res!231676 e!198815)))

(assert (=> d!95982 (= res!231676 (= (_1!12412 lt!416160) (_2!12412 lt!416160)))))

(assert (=> d!95982 (= (arrayRangesEq!1230 a1!699 a2!699 (_1!12412 lt!416160) (_2!12412 lt!416160)) e!198815)))

(declare-fun b!279003 () Bool)

(declare-fun e!198816 () Bool)

(assert (=> b!279003 (= e!198815 e!198816)))

(declare-fun res!231677 () Bool)

(assert (=> b!279003 (=> (not res!231677) (not e!198816))))

(assert (=> b!279003 (= res!231677 (= (select (arr!7958 a1!699) (_1!12412 lt!416160)) (select (arr!7958 a2!699) (_1!12412 lt!416160))))))

(declare-fun b!279004 () Bool)

(assert (=> b!279004 (= e!198816 (arrayRangesEq!1230 a1!699 a2!699 (bvadd (_1!12412 lt!416160) #b00000000000000000000000000000001) (_2!12412 lt!416160)))))

(assert (= (and d!95982 (not res!231676)) b!279003))

(assert (= (and b!279003 res!231677) b!279004))

(declare-fun m!412085 () Bool)

(assert (=> b!279003 m!412085))

(declare-fun m!412087 () Bool)

(assert (=> b!279003 m!412087))

(declare-fun m!412089 () Bool)

(assert (=> b!279004 m!412089))

(assert (=> b!278932 d!95982))

(declare-fun d!95984 () Bool)

(assert (=> d!95984 (= (array_inv!6686 a1!699) (bvsge (size!6962 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!62186 d!95984))

(declare-fun d!95986 () Bool)

(assert (=> d!95986 (= (array_inv!6686 a2!699) (bvsge (size!6962 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!62186 d!95986))

(declare-fun d!95988 () Bool)

(assert (=> d!95988 (= (arrayBitIndices!0 from!822 to!789) (tuple4!675 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!278931 d!95988))

(declare-fun lt!416188 () tuple4!674)

(declare-fun b!279019 () Bool)

(declare-fun e!198831 () Bool)

(assert (=> b!279019 (= e!198831 (arrayRangesEq!1230 a1!699 a2!699 (_1!12412 lt!416188) (_2!12412 lt!416188)))))

(declare-fun b!279020 () Bool)

(declare-fun e!198833 () Bool)

(declare-fun e!198829 () Bool)

(assert (=> b!279020 (= e!198833 e!198829)))

(declare-fun c!12837 () Bool)

(assert (=> b!279020 (= c!12837 (= (_3!1117 lt!416188) (_4!337 lt!416188)))))

(declare-fun b!279021 () Bool)

(declare-fun e!198832 () Bool)

(declare-fun call!4544 () Bool)

(assert (=> b!279021 (= e!198832 call!4544)))

(declare-fun b!279022 () Bool)

(declare-fun e!198834 () Bool)

(assert (=> b!279022 (= e!198834 e!198833)))

(declare-fun res!231689 () Bool)

(assert (=> b!279022 (=> (not res!231689) (not e!198833))))

(assert (=> b!279022 (= res!231689 e!198831)))

(declare-fun res!231690 () Bool)

(assert (=> b!279022 (=> res!231690 e!198831)))

(assert (=> b!279022 (= res!231690 (bvsge (_1!12412 lt!416188) (_2!12412 lt!416188)))))

(declare-fun lt!416190 () (_ BitVec 32))

(assert (=> b!279022 (= lt!416190 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!416189 () (_ BitVec 32))

(assert (=> b!279022 (= lt!416189 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!279022 (= lt!416188 (arrayBitIndices!0 from!822 to!789))))

(declare-fun bm!4541 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4541 (= call!4544 (byteRangesEq!0 (ite c!12837 (select (arr!7958 a1!699) (_3!1117 lt!416188)) (select (arr!7958 a1!699) (_4!337 lt!416188))) (ite c!12837 (select (arr!7958 a2!699) (_3!1117 lt!416188)) (select (arr!7958 a2!699) (_4!337 lt!416188))) (ite c!12837 lt!416189 #b00000000000000000000000000000000) lt!416190))))

(declare-fun b!279023 () Bool)

(declare-fun res!231692 () Bool)

(assert (=> b!279023 (= res!231692 (= lt!416190 #b00000000000000000000000000000000))))

(assert (=> b!279023 (=> res!231692 e!198832)))

(declare-fun e!198830 () Bool)

(assert (=> b!279023 (= e!198830 e!198832)))

(declare-fun b!279024 () Bool)

(assert (=> b!279024 (= e!198829 e!198830)))

(declare-fun res!231691 () Bool)

(assert (=> b!279024 (= res!231691 (byteRangesEq!0 (select (arr!7958 a1!699) (_3!1117 lt!416188)) (select (arr!7958 a2!699) (_3!1117 lt!416188)) lt!416189 #b00000000000000000000000000001000))))

(assert (=> b!279024 (=> (not res!231691) (not e!198830))))

(declare-fun b!279025 () Bool)

(assert (=> b!279025 (= e!198829 call!4544)))

(declare-fun d!95990 () Bool)

(declare-fun res!231688 () Bool)

(assert (=> d!95990 (=> res!231688 e!198834)))

(assert (=> d!95990 (= res!231688 (bvsge from!822 to!789))))

(assert (=> d!95990 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!198834)))

(assert (= (and d!95990 (not res!231688)) b!279022))

(assert (= (and b!279022 (not res!231690)) b!279019))

(assert (= (and b!279022 res!231689) b!279020))

(assert (= (and b!279020 c!12837) b!279025))

(assert (= (and b!279020 (not c!12837)) b!279024))

(assert (= (and b!279024 res!231691) b!279023))

(assert (= (and b!279023 (not res!231692)) b!279021))

(assert (= (or b!279025 b!279021) bm!4541))

(declare-fun m!412091 () Bool)

(assert (=> b!279019 m!412091))

(assert (=> b!279022 m!412025))

(declare-fun m!412093 () Bool)

(assert (=> bm!4541 m!412093))

(declare-fun m!412095 () Bool)

(assert (=> bm!4541 m!412095))

(declare-fun m!412097 () Bool)

(assert (=> bm!4541 m!412097))

(declare-fun m!412099 () Bool)

(assert (=> bm!4541 m!412099))

(declare-fun m!412101 () Bool)

(assert (=> bm!4541 m!412101))

(assert (=> b!279024 m!412101))

(assert (=> b!279024 m!412099))

(assert (=> b!279024 m!412101))

(assert (=> b!279024 m!412099))

(declare-fun m!412103 () Bool)

(assert (=> b!279024 m!412103))

(assert (=> b!278929 d!95990))

(check-sat (not bm!4541) (not b!279019) (not b!279004) (not b!279024) (not b!279022))
(check-sat)
