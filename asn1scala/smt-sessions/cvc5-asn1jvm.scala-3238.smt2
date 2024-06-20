; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73786 () Bool)

(assert start!73786)

(declare-fun res!268006 () Bool)

(declare-fun e!235685 () Bool)

(assert (=> start!73786 (=> (not res!268006) (not e!235685))))

(declare-datatypes ((array!21223 0))(
  ( (array!21224 (arr!10306 (Array (_ BitVec 32) (_ BitVec 8))) (size!9214 (_ BitVec 32))) )
))
(declare-fun a1!688 () array!21223)

(declare-fun fromBit!81 () (_ BitVec 64))

(declare-fun toBit!81 () (_ BitVec 64))

(declare-fun a2!688 () array!21223)

(assert (=> start!73786 (= res!268006 (and (bvsle (size!9214 a1!688) (size!9214 a2!688)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!81) (bvsle fromBit!81 toBit!81) (bvsle toBit!81 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9214 a1!688)))) (bvslt fromBit!81 toBit!81)))))

(assert (=> start!73786 e!235685))

(declare-fun array_inv!8766 (array!21223) Bool)

(assert (=> start!73786 (array_inv!8766 a1!688)))

(assert (=> start!73786 (array_inv!8766 a2!688)))

(assert (=> start!73786 true))

(declare-fun b!326434 () Bool)

(declare-fun e!235688 () Bool)

(assert (=> b!326434 (= e!235685 e!235688)))

(declare-fun res!268008 () Bool)

(assert (=> b!326434 (=> (not res!268008) (not e!235688))))

(declare-fun e!235687 () Bool)

(assert (=> b!326434 (= res!268008 e!235687)))

(declare-fun res!268007 () Bool)

(assert (=> b!326434 (=> res!268007 e!235687)))

(declare-datatypes ((tuple4!1380 0))(
  ( (tuple4!1381 (_1!13531 (_ BitVec 32)) (_2!13531 (_ BitVec 32)) (_3!1647 (_ BitVec 32)) (_4!690 (_ BitVec 32))) )
))
(declare-fun lt!448571 () tuple4!1380)

(assert (=> b!326434 (= res!268007 (bvsge (_1!13531 lt!448571) (_2!13531 lt!448571)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1380)

(assert (=> b!326434 (= lt!448571 (arrayBitIndices!0 fromBit!81 toBit!81))))

(declare-fun b!326435 () Bool)

(declare-fun arrayRangesEq!1838 (array!21223 array!21223 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!326435 (= e!235687 (arrayRangesEq!1838 a1!688 a2!688 (_1!13531 lt!448571) (_2!13531 lt!448571)))))

(declare-fun b!326436 () Bool)

(assert (=> b!326436 (= e!235688 (and (= (_3!1647 lt!448571) (_4!690 lt!448571)) (or (bvslt (_3!1647 lt!448571) #b00000000000000000000000000000000) (bvsge (_3!1647 lt!448571) (size!9214 a1!688)))))))

(assert (= (and start!73786 res!268006) b!326434))

(assert (= (and b!326434 (not res!268007)) b!326435))

(assert (= (and b!326434 res!268008) b!326436))

(declare-fun m!464273 () Bool)

(assert (=> start!73786 m!464273))

(declare-fun m!464275 () Bool)

(assert (=> start!73786 m!464275))

(declare-fun m!464277 () Bool)

(assert (=> b!326434 m!464277))

(declare-fun m!464279 () Bool)

(assert (=> b!326435 m!464279))

(push 1)

(assert (not start!73786))

(assert (not b!326434))

(assert (not b!326435))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107636 () Bool)

(assert (=> d!107636 (= (array_inv!8766 a1!688) (bvsge (size!9214 a1!688) #b00000000000000000000000000000000))))

(assert (=> start!73786 d!107636))

(declare-fun d!107638 () Bool)

(assert (=> d!107638 (= (array_inv!8766 a2!688) (bvsge (size!9214 a2!688) #b00000000000000000000000000000000))))

(assert (=> start!73786 d!107638))

(declare-fun d!107640 () Bool)

(assert (=> d!107640 (= (arrayBitIndices!0 fromBit!81 toBit!81) (tuple4!1381 ((_ extract 31 0) (bvadd (bvsdiv fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!326434 d!107640))

(declare-fun d!107644 () Bool)

(declare-fun res!268037 () Bool)

(declare-fun e!235729 () Bool)

(assert (=> d!107644 (=> res!268037 e!235729)))

(assert (=> d!107644 (= res!268037 (= (_1!13531 lt!448571) (_2!13531 lt!448571)))))

(assert (=> d!107644 (= (arrayRangesEq!1838 a1!688 a2!688 (_1!13531 lt!448571) (_2!13531 lt!448571)) e!235729)))

(declare-fun b!326465 () Bool)

(declare-fun e!235730 () Bool)

(assert (=> b!326465 (= e!235729 e!235730)))

(declare-fun res!268038 () Bool)

(assert (=> b!326465 (=> (not res!268038) (not e!235730))))

(assert (=> b!326465 (= res!268038 (= (select (arr!10306 a1!688) (_1!13531 lt!448571)) (select (arr!10306 a2!688) (_1!13531 lt!448571))))))

(declare-fun b!326466 () Bool)

(assert (=> b!326466 (= e!235730 (arrayRangesEq!1838 a1!688 a2!688 (bvadd (_1!13531 lt!448571) #b00000000000000000000000000000001) (_2!13531 lt!448571)))))

(assert (= (and d!107644 (not res!268037)) b!326465))

(assert (= (and b!326465 res!268038) b!326466))

(declare-fun m!464303 () Bool)

(assert (=> b!326465 m!464303))

(declare-fun m!464305 () Bool)

(assert (=> b!326465 m!464305))

(declare-fun m!464307 () Bool)

(assert (=> b!326466 m!464307))

(assert (=> b!326435 d!107644))

(push 1)

(assert (not b!326466))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

