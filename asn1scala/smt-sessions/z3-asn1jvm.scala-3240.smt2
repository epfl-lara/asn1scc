; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73836 () Bool)

(assert start!73836)

(declare-fun res!268105 () Bool)

(declare-fun e!235829 () Bool)

(assert (=> start!73836 (=> (not res!268105) (not e!235829))))

(declare-datatypes ((array!21243 0))(
  ( (array!21244 (arr!10313 (Array (_ BitVec 32) (_ BitVec 8))) (size!9221 (_ BitVec 32))) )
))
(declare-fun a1!688 () array!21243)

(declare-fun fromBit!81 () (_ BitVec 64))

(declare-fun toBit!81 () (_ BitVec 64))

(declare-fun a2!688 () array!21243)

(assert (=> start!73836 (= res!268105 (and (bvsle (size!9221 a1!688) (size!9221 a2!688)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!81) (bvsle fromBit!81 toBit!81) (bvsle toBit!81 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9221 a1!688)))) (bvslt fromBit!81 toBit!81)))))

(assert (=> start!73836 e!235829))

(declare-fun array_inv!8773 (array!21243) Bool)

(assert (=> start!73836 (array_inv!8773 a1!688)))

(assert (=> start!73836 (array_inv!8773 a2!688)))

(assert (=> start!73836 true))

(declare-fun b!326533 () Bool)

(declare-fun e!235828 () Bool)

(assert (=> b!326533 (= e!235829 e!235828)))

(declare-fun res!268106 () Bool)

(assert (=> b!326533 (=> (not res!268106) (not e!235828))))

(declare-fun e!235825 () Bool)

(assert (=> b!326533 (= res!268106 e!235825)))

(declare-fun res!268107 () Bool)

(assert (=> b!326533 (=> res!268107 e!235825)))

(declare-datatypes ((tuple4!1394 0))(
  ( (tuple4!1395 (_1!13538 (_ BitVec 32)) (_2!13538 (_ BitVec 32)) (_3!1654 (_ BitVec 32)) (_4!697 (_ BitVec 32))) )
))
(declare-fun lt!448592 () tuple4!1394)

(assert (=> b!326533 (= res!268107 (bvsge (_1!13538 lt!448592) (_2!13538 lt!448592)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1394)

(assert (=> b!326533 (= lt!448592 (arrayBitIndices!0 fromBit!81 toBit!81))))

(declare-fun b!326534 () Bool)

(declare-fun arrayRangesEq!1845 (array!21243 array!21243 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!326534 (= e!235825 (arrayRangesEq!1845 a1!688 a2!688 (_1!13538 lt!448592) (_2!13538 lt!448592)))))

(declare-fun b!326535 () Bool)

(assert (=> b!326535 (= e!235828 (and (not (= (_3!1654 lt!448592) (_4!697 lt!448592))) (or (bvslt (_3!1654 lt!448592) #b00000000000000000000000000000000) (bvsge (_3!1654 lt!448592) (size!9221 a1!688)))))))

(assert (= (and start!73836 res!268105) b!326533))

(assert (= (and b!326533 (not res!268107)) b!326534))

(assert (= (and b!326533 res!268106) b!326535))

(declare-fun m!464365 () Bool)

(assert (=> start!73836 m!464365))

(declare-fun m!464367 () Bool)

(assert (=> start!73836 m!464367))

(declare-fun m!464369 () Bool)

(assert (=> b!326533 m!464369))

(declare-fun m!464371 () Bool)

(assert (=> b!326534 m!464371))

(check-sat (not start!73836) (not b!326533) (not b!326534))
(check-sat)
(get-model)

(declare-fun d!107682 () Bool)

(assert (=> d!107682 (= (array_inv!8773 a1!688) (bvsge (size!9221 a1!688) #b00000000000000000000000000000000))))

(assert (=> start!73836 d!107682))

(declare-fun d!107684 () Bool)

(assert (=> d!107684 (= (array_inv!8773 a2!688) (bvsge (size!9221 a2!688) #b00000000000000000000000000000000))))

(assert (=> start!73836 d!107684))

(declare-fun d!107686 () Bool)

(assert (=> d!107686 (= (arrayBitIndices!0 fromBit!81 toBit!81) (tuple4!1395 ((_ extract 31 0) (bvadd (bvsdiv fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!326533 d!107686))

(declare-fun d!107688 () Bool)

(declare-fun res!268121 () Bool)

(declare-fun e!235849 () Bool)

(assert (=> d!107688 (=> res!268121 e!235849)))

(assert (=> d!107688 (= res!268121 (= (_1!13538 lt!448592) (_2!13538 lt!448592)))))

(assert (=> d!107688 (= (arrayRangesEq!1845 a1!688 a2!688 (_1!13538 lt!448592) (_2!13538 lt!448592)) e!235849)))

(declare-fun b!326549 () Bool)

(declare-fun e!235850 () Bool)

(assert (=> b!326549 (= e!235849 e!235850)))

(declare-fun res!268122 () Bool)

(assert (=> b!326549 (=> (not res!268122) (not e!235850))))

(assert (=> b!326549 (= res!268122 (= (select (arr!10313 a1!688) (_1!13538 lt!448592)) (select (arr!10313 a2!688) (_1!13538 lt!448592))))))

(declare-fun b!326550 () Bool)

(assert (=> b!326550 (= e!235850 (arrayRangesEq!1845 a1!688 a2!688 (bvadd (_1!13538 lt!448592) #b00000000000000000000000000000001) (_2!13538 lt!448592)))))

(assert (= (and d!107688 (not res!268121)) b!326549))

(assert (= (and b!326549 res!268122) b!326550))

(declare-fun m!464381 () Bool)

(assert (=> b!326549 m!464381))

(declare-fun m!464383 () Bool)

(assert (=> b!326549 m!464383))

(declare-fun m!464385 () Bool)

(assert (=> b!326550 m!464385))

(assert (=> b!326534 d!107688))

(check-sat (not b!326550))
(check-sat)
