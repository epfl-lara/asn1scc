; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73834 () Bool)

(assert start!73834)

(declare-fun res!268098 () Bool)

(declare-fun e!235812 () Bool)

(assert (=> start!73834 (=> (not res!268098) (not e!235812))))

(declare-datatypes ((array!21241 0))(
  ( (array!21242 (arr!10312 (Array (_ BitVec 32) (_ BitVec 8))) (size!9220 (_ BitVec 32))) )
))
(declare-fun a1!688 () array!21241)

(declare-fun fromBit!81 () (_ BitVec 64))

(declare-fun toBit!81 () (_ BitVec 64))

(declare-fun a2!688 () array!21241)

(assert (=> start!73834 (= res!268098 (and (bvsle (size!9220 a1!688) (size!9220 a2!688)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!81) (bvsle fromBit!81 toBit!81) (bvsle toBit!81 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9220 a1!688)))) (bvslt fromBit!81 toBit!81)))))

(assert (=> start!73834 e!235812))

(declare-fun array_inv!8772 (array!21241) Bool)

(assert (=> start!73834 (array_inv!8772 a1!688)))

(assert (=> start!73834 (array_inv!8772 a2!688)))

(assert (=> start!73834 true))

(declare-fun b!326524 () Bool)

(declare-fun e!235810 () Bool)

(assert (=> b!326524 (= e!235812 e!235810)))

(declare-fun res!268096 () Bool)

(assert (=> b!326524 (=> (not res!268096) (not e!235810))))

(declare-fun e!235811 () Bool)

(assert (=> b!326524 (= res!268096 e!235811)))

(declare-fun res!268097 () Bool)

(assert (=> b!326524 (=> res!268097 e!235811)))

(declare-datatypes ((tuple4!1392 0))(
  ( (tuple4!1393 (_1!13537 (_ BitVec 32)) (_2!13537 (_ BitVec 32)) (_3!1653 (_ BitVec 32)) (_4!696 (_ BitVec 32))) )
))
(declare-fun lt!448589 () tuple4!1392)

(assert (=> b!326524 (= res!268097 (bvsge (_1!13537 lt!448589) (_2!13537 lt!448589)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1392)

(assert (=> b!326524 (= lt!448589 (arrayBitIndices!0 fromBit!81 toBit!81))))

(declare-fun b!326525 () Bool)

(declare-fun arrayRangesEq!1844 (array!21241 array!21241 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!326525 (= e!235811 (arrayRangesEq!1844 a1!688 a2!688 (_1!13537 lt!448589) (_2!13537 lt!448589)))))

(declare-fun b!326526 () Bool)

(assert (=> b!326526 (= e!235810 (and (not (= (_3!1653 lt!448589) (_4!696 lt!448589))) (or (bvslt (_3!1653 lt!448589) #b00000000000000000000000000000000) (bvsge (_3!1653 lt!448589) (size!9220 a1!688)))))))

(assert (= (and start!73834 res!268098) b!326524))

(assert (= (and b!326524 (not res!268097)) b!326525))

(assert (= (and b!326524 res!268096) b!326526))

(declare-fun m!464357 () Bool)

(assert (=> start!73834 m!464357))

(declare-fun m!464359 () Bool)

(assert (=> start!73834 m!464359))

(declare-fun m!464361 () Bool)

(assert (=> b!326524 m!464361))

(declare-fun m!464363 () Bool)

(assert (=> b!326525 m!464363))

(push 1)

(assert (not start!73834))

(assert (not b!326524))

(assert (not b!326525))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107690 () Bool)

(assert (=> d!107690 (= (array_inv!8772 a1!688) (bvsge (size!9220 a1!688) #b00000000000000000000000000000000))))

(assert (=> start!73834 d!107690))

(declare-fun d!107692 () Bool)

(assert (=> d!107692 (= (array_inv!8772 a2!688) (bvsge (size!9220 a2!688) #b00000000000000000000000000000000))))

(assert (=> start!73834 d!107692))

(declare-fun d!107694 () Bool)

(assert (=> d!107694 (= (arrayBitIndices!0 fromBit!81 toBit!81) (tuple4!1393 ((_ extract 31 0) (bvadd (bvsdiv fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!326524 d!107694))

(declare-fun d!107696 () Bool)

(declare-fun res!268127 () Bool)

(declare-fun e!235855 () Bool)

(assert (=> d!107696 (=> res!268127 e!235855)))

(assert (=> d!107696 (= res!268127 (= (_1!13537 lt!448589) (_2!13537 lt!448589)))))

(assert (=> d!107696 (= (arrayRangesEq!1844 a1!688 a2!688 (_1!13537 lt!448589) (_2!13537 lt!448589)) e!235855)))

(declare-fun b!326555 () Bool)

(declare-fun e!235856 () Bool)

(assert (=> b!326555 (= e!235855 e!235856)))

(declare-fun res!268128 () Bool)

(assert (=> b!326555 (=> (not res!268128) (not e!235856))))

(assert (=> b!326555 (= res!268128 (= (select (arr!10312 a1!688) (_1!13537 lt!448589)) (select (arr!10312 a2!688) (_1!13537 lt!448589))))))

(declare-fun b!326556 () Bool)

(assert (=> b!326556 (= e!235856 (arrayRangesEq!1844 a1!688 a2!688 (bvadd (_1!13537 lt!448589) #b00000000000000000000000000000001) (_2!13537 lt!448589)))))

(assert (= (and d!107696 (not res!268127)) b!326555))

(assert (= (and b!326555 res!268128) b!326556))

(declare-fun m!464387 () Bool)

(assert (=> b!326555 m!464387))

(declare-fun m!464389 () Bool)

(assert (=> b!326555 m!464389))

(declare-fun m!464391 () Bool)

(assert (=> b!326556 m!464391))

(assert (=> b!326525 d!107696))

(push 1)

(assert (not b!326556))

(check-sat)

