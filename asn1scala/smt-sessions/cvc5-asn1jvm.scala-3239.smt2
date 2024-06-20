; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73810 () Bool)

(assert start!73810)

(declare-fun res!268053 () Bool)

(declare-fun e!235750 () Bool)

(assert (=> start!73810 (=> (not res!268053) (not e!235750))))

(declare-datatypes ((array!21232 0))(
  ( (array!21233 (arr!10309 (Array (_ BitVec 32) (_ BitVec 8))) (size!9217 (_ BitVec 32))) )
))
(declare-fun a1!688 () array!21232)

(declare-fun fromBit!81 () (_ BitVec 64))

(declare-fun toBit!81 () (_ BitVec 64))

(declare-fun a2!688 () array!21232)

(assert (=> start!73810 (= res!268053 (and (bvsle (size!9217 a1!688) (size!9217 a2!688)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!81) (bvsle fromBit!81 toBit!81) (bvsle toBit!81 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9217 a1!688)))) (bvslt fromBit!81 toBit!81)))))

(assert (=> start!73810 e!235750))

(declare-fun array_inv!8769 (array!21232) Bool)

(assert (=> start!73810 (array_inv!8769 a1!688)))

(assert (=> start!73810 (array_inv!8769 a2!688)))

(assert (=> start!73810 true))

(declare-fun b!326479 () Bool)

(declare-fun e!235751 () Bool)

(assert (=> b!326479 (= e!235750 e!235751)))

(declare-fun res!268052 () Bool)

(assert (=> b!326479 (=> (not res!268052) (not e!235751))))

(declare-fun e!235749 () Bool)

(assert (=> b!326479 (= res!268052 e!235749)))

(declare-fun res!268051 () Bool)

(assert (=> b!326479 (=> res!268051 e!235749)))

(declare-datatypes ((tuple4!1386 0))(
  ( (tuple4!1387 (_1!13534 (_ BitVec 32)) (_2!13534 (_ BitVec 32)) (_3!1650 (_ BitVec 32)) (_4!693 (_ BitVec 32))) )
))
(declare-fun lt!448580 () tuple4!1386)

(assert (=> b!326479 (= res!268051 (bvsge (_1!13534 lt!448580) (_2!13534 lt!448580)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1386)

(assert (=> b!326479 (= lt!448580 (arrayBitIndices!0 fromBit!81 toBit!81))))

(declare-fun b!326480 () Bool)

(declare-fun arrayRangesEq!1841 (array!21232 array!21232 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!326480 (= e!235749 (arrayRangesEq!1841 a1!688 a2!688 (_1!13534 lt!448580) (_2!13534 lt!448580)))))

(declare-fun b!326481 () Bool)

(assert (=> b!326481 (= e!235751 (and (= (_3!1650 lt!448580) (_4!693 lt!448580)) (or (bvslt (_3!1650 lt!448580) #b00000000000000000000000000000000) (bvsge (_3!1650 lt!448580) (size!9217 a2!688)))))))

(assert (= (and start!73810 res!268053) b!326479))

(assert (= (and b!326479 (not res!268051)) b!326480))

(assert (= (and b!326479 res!268052) b!326481))

(declare-fun m!464315 () Bool)

(assert (=> start!73810 m!464315))

(declare-fun m!464317 () Bool)

(assert (=> start!73810 m!464317))

(declare-fun m!464319 () Bool)

(assert (=> b!326479 m!464319))

(declare-fun m!464321 () Bool)

(assert (=> b!326480 m!464321))

(push 1)

(assert (not b!326479))

(assert (not b!326480))

(assert (not start!73810))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107664 () Bool)

(assert (=> d!107664 (= (arrayBitIndices!0 fromBit!81 toBit!81) (tuple4!1387 ((_ extract 31 0) (bvadd (bvsdiv fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!326479 d!107664))

(declare-fun d!107666 () Bool)

(declare-fun res!268082 () Bool)

(declare-fun e!235792 () Bool)

(assert (=> d!107666 (=> res!268082 e!235792)))

(assert (=> d!107666 (= res!268082 (= (_1!13534 lt!448580) (_2!13534 lt!448580)))))

(assert (=> d!107666 (= (arrayRangesEq!1841 a1!688 a2!688 (_1!13534 lt!448580) (_2!13534 lt!448580)) e!235792)))

(declare-fun b!326510 () Bool)

(declare-fun e!235793 () Bool)

(assert (=> b!326510 (= e!235792 e!235793)))

(declare-fun res!268083 () Bool)

(assert (=> b!326510 (=> (not res!268083) (not e!235793))))

(assert (=> b!326510 (= res!268083 (= (select (arr!10309 a1!688) (_1!13534 lt!448580)) (select (arr!10309 a2!688) (_1!13534 lt!448580))))))

(declare-fun b!326511 () Bool)

(assert (=> b!326511 (= e!235793 (arrayRangesEq!1841 a1!688 a2!688 (bvadd (_1!13534 lt!448580) #b00000000000000000000000000000001) (_2!13534 lt!448580)))))

(assert (= (and d!107666 (not res!268082)) b!326510))

(assert (= (and b!326510 res!268083) b!326511))

(declare-fun m!464345 () Bool)

(assert (=> b!326510 m!464345))

(declare-fun m!464347 () Bool)

(assert (=> b!326510 m!464347))

(declare-fun m!464349 () Bool)

(assert (=> b!326511 m!464349))

(assert (=> b!326480 d!107666))

(declare-fun d!107668 () Bool)

(assert (=> d!107668 (= (array_inv!8769 a1!688) (bvsge (size!9217 a1!688) #b00000000000000000000000000000000))))

(assert (=> start!73810 d!107668))

(declare-fun d!107670 () Bool)

(assert (=> d!107670 (= (array_inv!8769 a2!688) (bvsge (size!9217 a2!688) #b00000000000000000000000000000000))))

(assert (=> start!73810 d!107670))

(push 1)

(assert (not b!326511))

(check-sat)

