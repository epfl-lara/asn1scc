; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73712 () Bool)

(assert start!73712)

(declare-fun res!267888 () Bool)

(declare-fun e!235434 () Bool)

(assert (=> start!73712 (=> (not res!267888) (not e!235434))))

(declare-datatypes ((array!21168 0))(
  ( (array!21169 (arr!10281 (Array (_ BitVec 32) (_ BitVec 8))) (size!9189 (_ BitVec 32))) )
))
(declare-fun a1!688 () array!21168)

(declare-fun fromBit!81 () (_ BitVec 64))

(declare-fun toBit!81 () (_ BitVec 64))

(declare-fun a2!688 () array!21168)

(assert (=> start!73712 (= res!267888 (and (bvsle (size!9189 a1!688) (size!9189 a2!688)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!81) (bvsle fromBit!81 toBit!81) (bvsle toBit!81 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9189 a1!688)))) (bvslt fromBit!81 toBit!81)))))

(assert (=> start!73712 e!235434))

(declare-fun array_inv!8741 (array!21168) Bool)

(assert (=> start!73712 (array_inv!8741 a1!688)))

(assert (=> start!73712 (array_inv!8741 a2!688)))

(assert (=> start!73712 true))

(declare-fun b!326316 () Bool)

(declare-datatypes ((tuple4!1360 0))(
  ( (tuple4!1361 (_1!13521 (_ BitVec 32)) (_2!13521 (_ BitVec 32)) (_3!1637 (_ BitVec 32)) (_4!680 (_ BitVec 32))) )
))
(declare-fun lt!448505 () tuple4!1360)

(assert (=> b!326316 (= e!235434 (and (bvslt (_1!13521 lt!448505) (_2!13521 lt!448505)) (bvsle #b00000000000000000000000000000000 (_1!13521 lt!448505)) (bvsle (_1!13521 lt!448505) (_2!13521 lt!448505)) (bvsgt (_2!13521 lt!448505) (size!9189 a1!688))))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1360)

(assert (=> b!326316 (= lt!448505 (arrayBitIndices!0 fromBit!81 toBit!81))))

(assert (= (and start!73712 res!267888) b!326316))

(declare-fun m!464105 () Bool)

(assert (=> start!73712 m!464105))

(declare-fun m!464107 () Bool)

(assert (=> start!73712 m!464107))

(declare-fun m!464109 () Bool)

(assert (=> b!326316 m!464109))

(push 1)

(assert (not b!326316))

(assert (not start!73712))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107590 () Bool)

(assert (=> d!107590 (= (arrayBitIndices!0 fromBit!81 toBit!81) (tuple4!1361 ((_ extract 31 0) (bvadd (bvsdiv fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!326316 d!107590))

(declare-fun d!107592 () Bool)

(assert (=> d!107592 (= (array_inv!8741 a1!688) (bvsge (size!9189 a1!688) #b00000000000000000000000000000000))))

(assert (=> start!73712 d!107592))

(declare-fun d!107594 () Bool)

(assert (=> d!107594 (= (array_inv!8741 a2!688) (bvsge (size!9189 a2!688) #b00000000000000000000000000000000))))

(assert (=> start!73712 d!107594))

(push 1)

(check-sat)

