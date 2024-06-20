; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73710 () Bool)

(assert start!73710)

(declare-fun res!267885 () Bool)

(declare-fun e!235427 () Bool)

(assert (=> start!73710 (=> (not res!267885) (not e!235427))))

(declare-datatypes ((array!21166 0))(
  ( (array!21167 (arr!10280 (Array (_ BitVec 32) (_ BitVec 8))) (size!9188 (_ BitVec 32))) )
))
(declare-fun a1!688 () array!21166)

(declare-fun fromBit!81 () (_ BitVec 64))

(declare-fun toBit!81 () (_ BitVec 64))

(declare-fun a2!688 () array!21166)

(assert (=> start!73710 (= res!267885 (and (bvsle (size!9188 a1!688) (size!9188 a2!688)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!81) (bvsle fromBit!81 toBit!81) (bvsle toBit!81 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9188 a1!688)))) (bvslt fromBit!81 toBit!81)))))

(assert (=> start!73710 e!235427))

(declare-fun array_inv!8740 (array!21166) Bool)

(assert (=> start!73710 (array_inv!8740 a1!688)))

(assert (=> start!73710 (array_inv!8740 a2!688)))

(assert (=> start!73710 true))

(declare-fun b!326313 () Bool)

(declare-datatypes ((tuple4!1358 0))(
  ( (tuple4!1359 (_1!13520 (_ BitVec 32)) (_2!13520 (_ BitVec 32)) (_3!1636 (_ BitVec 32)) (_4!679 (_ BitVec 32))) )
))
(declare-fun lt!448502 () tuple4!1358)

(assert (=> b!326313 (= e!235427 (and (bvslt (_1!13520 lt!448502) (_2!13520 lt!448502)) (bvsle #b00000000000000000000000000000000 (_1!13520 lt!448502)) (bvsle (_1!13520 lt!448502) (_2!13520 lt!448502)) (bvsgt (_2!13520 lt!448502) (size!9188 a1!688))))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1358)

(assert (=> b!326313 (= lt!448502 (arrayBitIndices!0 fromBit!81 toBit!81))))

(assert (= (and start!73710 res!267885) b!326313))

(declare-fun m!464099 () Bool)

(assert (=> start!73710 m!464099))

(declare-fun m!464101 () Bool)

(assert (=> start!73710 m!464101))

(declare-fun m!464103 () Bool)

(assert (=> b!326313 m!464103))

(check-sat (not b!326313) (not start!73710))
(check-sat)
(get-model)

(declare-fun d!107578 () Bool)

(assert (=> d!107578 (= (arrayBitIndices!0 fromBit!81 toBit!81) (tuple4!1359 ((_ extract 31 0) (bvadd (bvsdiv fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!326313 d!107578))

(declare-fun d!107580 () Bool)

(assert (=> d!107580 (= (array_inv!8740 a1!688) (bvsge (size!9188 a1!688) #b00000000000000000000000000000000))))

(assert (=> start!73710 d!107580))

(declare-fun d!107582 () Bool)

(assert (=> d!107582 (= (array_inv!8740 a2!688) (bvsge (size!9188 a2!688) #b00000000000000000000000000000000))))

(assert (=> start!73710 d!107582))

(check-sat)
