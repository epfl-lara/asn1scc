; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73814 () Bool)

(assert start!73814)

(declare-fun res!268069 () Bool)

(declare-fun e!235777 () Bool)

(assert (=> start!73814 (=> (not res!268069) (not e!235777))))

(declare-datatypes ((array!21236 0))(
  ( (array!21237 (arr!10311 (Array (_ BitVec 32) (_ BitVec 8))) (size!9219 (_ BitVec 32))) )
))
(declare-fun a1!688 () array!21236)

(declare-fun fromBit!81 () (_ BitVec 64))

(declare-fun toBit!81 () (_ BitVec 64))

(declare-fun a2!688 () array!21236)

(assert (=> start!73814 (= res!268069 (and (bvsle (size!9219 a1!688) (size!9219 a2!688)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!81) (bvsle fromBit!81 toBit!81) (bvsle toBit!81 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9219 a1!688)))) (bvslt fromBit!81 toBit!81)))))

(assert (=> start!73814 e!235777))

(declare-fun array_inv!8771 (array!21236) Bool)

(assert (=> start!73814 (array_inv!8771 a1!688)))

(assert (=> start!73814 (array_inv!8771 a2!688)))

(assert (=> start!73814 true))

(declare-fun b!326497 () Bool)

(declare-fun e!235779 () Bool)

(assert (=> b!326497 (= e!235777 e!235779)))

(declare-fun res!268071 () Bool)

(assert (=> b!326497 (=> (not res!268071) (not e!235779))))

(declare-fun e!235781 () Bool)

(assert (=> b!326497 (= res!268071 e!235781)))

(declare-fun res!268070 () Bool)

(assert (=> b!326497 (=> res!268070 e!235781)))

(declare-datatypes ((tuple4!1390 0))(
  ( (tuple4!1391 (_1!13536 (_ BitVec 32)) (_2!13536 (_ BitVec 32)) (_3!1652 (_ BitVec 32)) (_4!695 (_ BitVec 32))) )
))
(declare-fun lt!448586 () tuple4!1390)

(assert (=> b!326497 (= res!268070 (bvsge (_1!13536 lt!448586) (_2!13536 lt!448586)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1390)

(assert (=> b!326497 (= lt!448586 (arrayBitIndices!0 fromBit!81 toBit!81))))

(declare-fun b!326498 () Bool)

(declare-fun arrayRangesEq!1843 (array!21236 array!21236 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!326498 (= e!235781 (arrayRangesEq!1843 a1!688 a2!688 (_1!13536 lt!448586) (_2!13536 lt!448586)))))

(declare-fun b!326499 () Bool)

(assert (=> b!326499 (= e!235779 (and (= (_3!1652 lt!448586) (_4!695 lt!448586)) (or (bvslt (_3!1652 lt!448586) #b00000000000000000000000000000000) (bvsge (_3!1652 lt!448586) (size!9219 a2!688)))))))

(assert (= (and start!73814 res!268069) b!326497))

(assert (= (and b!326497 (not res!268070)) b!326498))

(assert (= (and b!326497 res!268071) b!326499))

(declare-fun m!464331 () Bool)

(assert (=> start!73814 m!464331))

(declare-fun m!464333 () Bool)

(assert (=> start!73814 m!464333))

(declare-fun m!464335 () Bool)

(assert (=> b!326497 m!464335))

(declare-fun m!464337 () Bool)

(assert (=> b!326498 m!464337))

(push 1)

(assert (not b!326498))

(assert (not start!73814))

(assert (not b!326497))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107672 () Bool)

(declare-fun res!268088 () Bool)

(declare-fun e!235798 () Bool)

(assert (=> d!107672 (=> res!268088 e!235798)))

(assert (=> d!107672 (= res!268088 (= (_1!13536 lt!448586) (_2!13536 lt!448586)))))

(assert (=> d!107672 (= (arrayRangesEq!1843 a1!688 a2!688 (_1!13536 lt!448586) (_2!13536 lt!448586)) e!235798)))

(declare-fun b!326516 () Bool)

(declare-fun e!235799 () Bool)

(assert (=> b!326516 (= e!235798 e!235799)))

(declare-fun res!268089 () Bool)

(assert (=> b!326516 (=> (not res!268089) (not e!235799))))

(assert (=> b!326516 (= res!268089 (= (select (arr!10311 a1!688) (_1!13536 lt!448586)) (select (arr!10311 a2!688) (_1!13536 lt!448586))))))

(declare-fun b!326517 () Bool)

(assert (=> b!326517 (= e!235799 (arrayRangesEq!1843 a1!688 a2!688 (bvadd (_1!13536 lt!448586) #b00000000000000000000000000000001) (_2!13536 lt!448586)))))

(assert (= (and d!107672 (not res!268088)) b!326516))

(assert (= (and b!326516 res!268089) b!326517))

(declare-fun m!464351 () Bool)

(assert (=> b!326516 m!464351))

(declare-fun m!464353 () Bool)

(assert (=> b!326516 m!464353))

(declare-fun m!464355 () Bool)

(assert (=> b!326517 m!464355))

(assert (=> b!326498 d!107672))

(declare-fun d!107674 () Bool)

(assert (=> d!107674 (= (array_inv!8771 a1!688) (bvsge (size!9219 a1!688) #b00000000000000000000000000000000))))

(assert (=> start!73814 d!107674))

(declare-fun d!107676 () Bool)

(assert (=> d!107676 (= (array_inv!8771 a2!688) (bvsge (size!9219 a2!688) #b00000000000000000000000000000000))))

(assert (=> start!73814 d!107676))

(declare-fun d!107678 () Bool)

(assert (=> d!107678 (= (arrayBitIndices!0 fromBit!81 toBit!81) (tuple4!1391 ((_ extract 31 0) (bvadd (bvsdiv fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!326497 d!107678))

(push 1)

(assert (not b!326517))

(check-sat)

