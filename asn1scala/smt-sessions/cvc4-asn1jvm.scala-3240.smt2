; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73838 () Bool)

(assert start!73838)

(declare-fun res!268115 () Bool)

(declare-fun e!235840 () Bool)

(assert (=> start!73838 (=> (not res!268115) (not e!235840))))

(declare-fun fromBit!81 () (_ BitVec 64))

(declare-fun toBit!81 () (_ BitVec 64))

(declare-datatypes ((array!21245 0))(
  ( (array!21246 (arr!10314 (Array (_ BitVec 32) (_ BitVec 8))) (size!9222 (_ BitVec 32))) )
))
(declare-fun a2!688 () array!21245)

(declare-fun a1!688 () array!21245)

(assert (=> start!73838 (= res!268115 (and (bvsle (size!9222 a1!688) (size!9222 a2!688)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!81) (bvsle fromBit!81 toBit!81) (bvsle toBit!81 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9222 a1!688)))) (bvslt fromBit!81 toBit!81)))))

(assert (=> start!73838 e!235840))

(declare-fun array_inv!8774 (array!21245) Bool)

(assert (=> start!73838 (array_inv!8774 a1!688)))

(assert (=> start!73838 (array_inv!8774 a2!688)))

(assert (=> start!73838 true))

(declare-fun b!326542 () Bool)

(declare-fun e!235843 () Bool)

(assert (=> b!326542 (= e!235840 e!235843)))

(declare-fun res!268116 () Bool)

(assert (=> b!326542 (=> (not res!268116) (not e!235843))))

(declare-fun e!235844 () Bool)

(assert (=> b!326542 (= res!268116 e!235844)))

(declare-fun res!268114 () Bool)

(assert (=> b!326542 (=> res!268114 e!235844)))

(declare-datatypes ((tuple4!1396 0))(
  ( (tuple4!1397 (_1!13539 (_ BitVec 32)) (_2!13539 (_ BitVec 32)) (_3!1655 (_ BitVec 32)) (_4!698 (_ BitVec 32))) )
))
(declare-fun lt!448595 () tuple4!1396)

(assert (=> b!326542 (= res!268114 (bvsge (_1!13539 lt!448595) (_2!13539 lt!448595)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1396)

(assert (=> b!326542 (= lt!448595 (arrayBitIndices!0 fromBit!81 toBit!81))))

(declare-fun b!326543 () Bool)

(declare-fun arrayRangesEq!1846 (array!21245 array!21245 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!326543 (= e!235844 (arrayRangesEq!1846 a1!688 a2!688 (_1!13539 lt!448595) (_2!13539 lt!448595)))))

(declare-fun b!326544 () Bool)

(assert (=> b!326544 (= e!235843 (and (not (= (_3!1655 lt!448595) (_4!698 lt!448595))) (or (bvslt (_3!1655 lt!448595) #b00000000000000000000000000000000) (bvsge (_3!1655 lt!448595) (size!9222 a1!688)))))))

(assert (= (and start!73838 res!268115) b!326542))

(assert (= (and b!326542 (not res!268114)) b!326543))

(assert (= (and b!326542 res!268116) b!326544))

(declare-fun m!464373 () Bool)

(assert (=> start!73838 m!464373))

(declare-fun m!464375 () Bool)

(assert (=> start!73838 m!464375))

(declare-fun m!464377 () Bool)

(assert (=> b!326542 m!464377))

(declare-fun m!464379 () Bool)

(assert (=> b!326543 m!464379))

(push 1)

(assert (not b!326542))

(assert (not b!326543))

(assert (not start!73838))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107698 () Bool)

(assert (=> d!107698 (= (arrayBitIndices!0 fromBit!81 toBit!81) (tuple4!1397 ((_ extract 31 0) (bvadd (bvsdiv fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!326542 d!107698))

(declare-fun d!107700 () Bool)

(declare-fun res!268133 () Bool)

(declare-fun e!235861 () Bool)

(assert (=> d!107700 (=> res!268133 e!235861)))

(assert (=> d!107700 (= res!268133 (= (_1!13539 lt!448595) (_2!13539 lt!448595)))))

(assert (=> d!107700 (= (arrayRangesEq!1846 a1!688 a2!688 (_1!13539 lt!448595) (_2!13539 lt!448595)) e!235861)))

(declare-fun b!326561 () Bool)

(declare-fun e!235862 () Bool)

(assert (=> b!326561 (= e!235861 e!235862)))

(declare-fun res!268134 () Bool)

(assert (=> b!326561 (=> (not res!268134) (not e!235862))))

(assert (=> b!326561 (= res!268134 (= (select (arr!10314 a1!688) (_1!13539 lt!448595)) (select (arr!10314 a2!688) (_1!13539 lt!448595))))))

(declare-fun b!326562 () Bool)

(assert (=> b!326562 (= e!235862 (arrayRangesEq!1846 a1!688 a2!688 (bvadd (_1!13539 lt!448595) #b00000000000000000000000000000001) (_2!13539 lt!448595)))))

(assert (= (and d!107700 (not res!268133)) b!326561))

(assert (= (and b!326561 res!268134) b!326562))

(declare-fun m!464393 () Bool)

(assert (=> b!326561 m!464393))

(declare-fun m!464395 () Bool)

(assert (=> b!326561 m!464395))

(declare-fun m!464397 () Bool)

(assert (=> b!326562 m!464397))

(assert (=> b!326543 d!107700))

(declare-fun d!107702 () Bool)

(assert (=> d!107702 (= (array_inv!8774 a1!688) (bvsge (size!9222 a1!688) #b00000000000000000000000000000000))))

(assert (=> start!73838 d!107702))

(declare-fun d!107704 () Bool)

(assert (=> d!107704 (= (array_inv!8774 a2!688) (bvsge (size!9222 a2!688) #b00000000000000000000000000000000))))

(assert (=> start!73838 d!107704))

(push 1)

(assert (not b!326562))

(check-sat)

