; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73790 () Bool)

(assert start!73790)

(declare-fun res!268025 () Bool)

(declare-fun e!235714 () Bool)

(assert (=> start!73790 (=> (not res!268025) (not e!235714))))

(declare-datatypes ((array!21227 0))(
  ( (array!21228 (arr!10308 (Array (_ BitVec 32) (_ BitVec 8))) (size!9216 (_ BitVec 32))) )
))
(declare-fun a1!688 () array!21227)

(declare-fun fromBit!81 () (_ BitVec 64))

(declare-fun toBit!81 () (_ BitVec 64))

(declare-fun a2!688 () array!21227)

(assert (=> start!73790 (= res!268025 (and (bvsle (size!9216 a1!688) (size!9216 a2!688)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!81) (bvsle fromBit!81 toBit!81) (bvsle toBit!81 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9216 a1!688)))) (bvslt fromBit!81 toBit!81)))))

(assert (=> start!73790 e!235714))

(declare-fun array_inv!8768 (array!21227) Bool)

(assert (=> start!73790 (array_inv!8768 a1!688)))

(assert (=> start!73790 (array_inv!8768 a2!688)))

(assert (=> start!73790 true))

(declare-fun b!326452 () Bool)

(declare-fun e!235718 () Bool)

(assert (=> b!326452 (= e!235714 e!235718)))

(declare-fun res!268024 () Bool)

(assert (=> b!326452 (=> (not res!268024) (not e!235718))))

(declare-fun e!235716 () Bool)

(assert (=> b!326452 (= res!268024 e!235716)))

(declare-fun res!268026 () Bool)

(assert (=> b!326452 (=> res!268026 e!235716)))

(declare-datatypes ((tuple4!1384 0))(
  ( (tuple4!1385 (_1!13533 (_ BitVec 32)) (_2!13533 (_ BitVec 32)) (_3!1649 (_ BitVec 32)) (_4!692 (_ BitVec 32))) )
))
(declare-fun lt!448577 () tuple4!1384)

(assert (=> b!326452 (= res!268026 (bvsge (_1!13533 lt!448577) (_2!13533 lt!448577)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1384)

(assert (=> b!326452 (= lt!448577 (arrayBitIndices!0 fromBit!81 toBit!81))))

(declare-fun b!326453 () Bool)

(declare-fun arrayRangesEq!1840 (array!21227 array!21227 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!326453 (= e!235716 (arrayRangesEq!1840 a1!688 a2!688 (_1!13533 lt!448577) (_2!13533 lt!448577)))))

(declare-fun b!326454 () Bool)

(assert (=> b!326454 (= e!235718 (and (= (_3!1649 lt!448577) (_4!692 lt!448577)) (or (bvslt (_3!1649 lt!448577) #b00000000000000000000000000000000) (bvsge (_3!1649 lt!448577) (size!9216 a1!688)))))))

(assert (= (and start!73790 res!268025) b!326452))

(assert (= (and b!326452 (not res!268026)) b!326453))

(assert (= (and b!326452 res!268024) b!326454))

(declare-fun m!464289 () Bool)

(assert (=> start!73790 m!464289))

(declare-fun m!464291 () Bool)

(assert (=> start!73790 m!464291))

(declare-fun m!464293 () Bool)

(assert (=> b!326452 m!464293))

(declare-fun m!464295 () Bool)

(assert (=> b!326453 m!464295))

(push 1)

(assert (not start!73790))

(assert (not b!326452))

(assert (not b!326453))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107646 () Bool)

(assert (=> d!107646 (= (array_inv!8768 a1!688) (bvsge (size!9216 a1!688) #b00000000000000000000000000000000))))

(assert (=> start!73790 d!107646))

(declare-fun d!107648 () Bool)

(assert (=> d!107648 (= (array_inv!8768 a2!688) (bvsge (size!9216 a2!688) #b00000000000000000000000000000000))))

(assert (=> start!73790 d!107648))

(declare-fun d!107650 () Bool)

(assert (=> d!107650 (= (arrayBitIndices!0 fromBit!81 toBit!81) (tuple4!1385 ((_ extract 31 0) (bvadd (bvsdiv fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!326452 d!107650))

(declare-fun d!107652 () Bool)

(declare-fun res!268043 () Bool)

(declare-fun e!235735 () Bool)

(assert (=> d!107652 (=> res!268043 e!235735)))

(assert (=> d!107652 (= res!268043 (= (_1!13533 lt!448577) (_2!13533 lt!448577)))))

(assert (=> d!107652 (= (arrayRangesEq!1840 a1!688 a2!688 (_1!13533 lt!448577) (_2!13533 lt!448577)) e!235735)))

(declare-fun b!326471 () Bool)

(declare-fun e!235736 () Bool)

(assert (=> b!326471 (= e!235735 e!235736)))

(declare-fun res!268044 () Bool)

(assert (=> b!326471 (=> (not res!268044) (not e!235736))))

(assert (=> b!326471 (= res!268044 (= (select (arr!10308 a1!688) (_1!13533 lt!448577)) (select (arr!10308 a2!688) (_1!13533 lt!448577))))))

(declare-fun b!326472 () Bool)

(assert (=> b!326472 (= e!235736 (arrayRangesEq!1840 a1!688 a2!688 (bvadd (_1!13533 lt!448577) #b00000000000000000000000000000001) (_2!13533 lt!448577)))))

(assert (= (and d!107652 (not res!268043)) b!326471))

(assert (= (and b!326471 res!268044) b!326472))

(declare-fun m!464309 () Bool)

(assert (=> b!326471 m!464309))

(declare-fun m!464311 () Bool)

(assert (=> b!326471 m!464311))

(declare-fun m!464313 () Bool)

(assert (=> b!326472 m!464313))

(assert (=> b!326453 d!107652))

(push 1)

(assert (not b!326472))

(check-sat)

