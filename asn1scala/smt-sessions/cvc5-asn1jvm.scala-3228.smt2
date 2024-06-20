; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73690 () Bool)

(assert start!73690)

(declare-fun res!267873 () Bool)

(declare-fun e!235389 () Bool)

(assert (=> start!73690 (=> (not res!267873) (not e!235389))))

(declare-datatypes ((array!21155 0))(
  ( (array!21156 (arr!10276 (Array (_ BitVec 32) (_ BitVec 8))) (size!9184 (_ BitVec 32))) )
))
(declare-fun a1!688 () array!21155)

(declare-fun fromBit!81 () (_ BitVec 64))

(declare-fun toBit!81 () (_ BitVec 64))

(declare-fun a2!688 () array!21155)

(assert (=> start!73690 (= res!267873 (and (bvsle (size!9184 a1!688) (size!9184 a2!688)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!81) (bvsle fromBit!81 toBit!81) (bvsle toBit!81 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9184 a1!688)))) (bvslt fromBit!81 toBit!81)))))

(assert (=> start!73690 e!235389))

(declare-fun array_inv!8736 (array!21155) Bool)

(assert (=> start!73690 (array_inv!8736 a1!688)))

(assert (=> start!73690 (array_inv!8736 a2!688)))

(assert (=> start!73690 true))

(declare-fun b!326301 () Bool)

(declare-datatypes ((tuple4!1350 0))(
  ( (tuple4!1351 (_1!13516 (_ BitVec 32)) (_2!13516 (_ BitVec 32)) (_3!1632 (_ BitVec 32)) (_4!675 (_ BitVec 32))) )
))
(declare-fun lt!448490 () tuple4!1350)

(assert (=> b!326301 (= e!235389 (and (bvslt (_1!13516 lt!448490) (_2!13516 lt!448490)) (or (bvsgt #b00000000000000000000000000000000 (_1!13516 lt!448490)) (bvsgt (_1!13516 lt!448490) (_2!13516 lt!448490)))))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1350)

(assert (=> b!326301 (= lt!448490 (arrayBitIndices!0 fromBit!81 toBit!81))))

(assert (= (and start!73690 res!267873) b!326301))

(declare-fun m!464075 () Bool)

(assert (=> start!73690 m!464075))

(declare-fun m!464077 () Bool)

(assert (=> start!73690 m!464077))

(declare-fun m!464079 () Bool)

(assert (=> b!326301 m!464079))

(push 1)

(assert (not b!326301))

(assert (not start!73690))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107564 () Bool)

(assert (=> d!107564 (= (arrayBitIndices!0 fromBit!81 toBit!81) (tuple4!1351 ((_ extract 31 0) (bvadd (bvsdiv fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!326301 d!107564))

(declare-fun d!107566 () Bool)

(assert (=> d!107566 (= (array_inv!8736 a1!688) (bvsge (size!9184 a1!688) #b00000000000000000000000000000000))))

(assert (=> start!73690 d!107566))

(declare-fun d!107568 () Bool)

(assert (=> d!107568 (= (array_inv!8736 a2!688) (bvsge (size!9184 a2!688) #b00000000000000000000000000000000))))

(assert (=> start!73690 d!107568))

(push 1)

(check-sat)

(pop 1)

