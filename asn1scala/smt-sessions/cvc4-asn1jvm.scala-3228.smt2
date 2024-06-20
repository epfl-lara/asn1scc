; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73694 () Bool)

(assert start!73694)

(declare-fun res!267879 () Bool)

(declare-fun e!235409 () Bool)

(assert (=> start!73694 (=> (not res!267879) (not e!235409))))

(declare-datatypes ((array!21159 0))(
  ( (array!21160 (arr!10278 (Array (_ BitVec 32) (_ BitVec 8))) (size!9186 (_ BitVec 32))) )
))
(declare-fun a1!688 () array!21159)

(declare-fun fromBit!81 () (_ BitVec 64))

(declare-fun toBit!81 () (_ BitVec 64))

(declare-fun a2!688 () array!21159)

(assert (=> start!73694 (= res!267879 (and (bvsle (size!9186 a1!688) (size!9186 a2!688)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!81) (bvsle fromBit!81 toBit!81) (bvsle toBit!81 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9186 a1!688)))) (bvslt fromBit!81 toBit!81)))))

(assert (=> start!73694 e!235409))

(declare-fun array_inv!8738 (array!21159) Bool)

(assert (=> start!73694 (array_inv!8738 a1!688)))

(assert (=> start!73694 (array_inv!8738 a2!688)))

(assert (=> start!73694 true))

(declare-fun b!326307 () Bool)

(declare-datatypes ((tuple4!1354 0))(
  ( (tuple4!1355 (_1!13518 (_ BitVec 32)) (_2!13518 (_ BitVec 32)) (_3!1634 (_ BitVec 32)) (_4!677 (_ BitVec 32))) )
))
(declare-fun lt!448496 () tuple4!1354)

(assert (=> b!326307 (= e!235409 (and (bvslt (_1!13518 lt!448496) (_2!13518 lt!448496)) (or (bvsgt #b00000000000000000000000000000000 (_1!13518 lt!448496)) (bvsgt (_1!13518 lt!448496) (_2!13518 lt!448496)))))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1354)

(assert (=> b!326307 (= lt!448496 (arrayBitIndices!0 fromBit!81 toBit!81))))

(assert (= (and start!73694 res!267879) b!326307))

(declare-fun m!464087 () Bool)

(assert (=> start!73694 m!464087))

(declare-fun m!464089 () Bool)

(assert (=> start!73694 m!464089))

(declare-fun m!464091 () Bool)

(assert (=> b!326307 m!464091))

(push 1)

(assert (not b!326307))

(assert (not start!73694))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107570 () Bool)

(assert (=> d!107570 (= (arrayBitIndices!0 fromBit!81 toBit!81) (tuple4!1355 ((_ extract 31 0) (bvadd (bvsdiv fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!326307 d!107570))

(declare-fun d!107572 () Bool)

(assert (=> d!107572 (= (array_inv!8738 a1!688) (bvsge (size!9186 a1!688) #b00000000000000000000000000000000))))

(assert (=> start!73694 d!107572))

(declare-fun d!107574 () Bool)

(assert (=> d!107574 (= (array_inv!8738 a2!688) (bvsge (size!9186 a2!688) #b00000000000000000000000000000000))))

(assert (=> start!73694 d!107574))

(push 1)

(check-sat)

