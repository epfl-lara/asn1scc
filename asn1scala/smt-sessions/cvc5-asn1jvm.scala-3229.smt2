; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73708 () Bool)

(assert start!73708)

(declare-fun res!267882 () Bool)

(declare-fun e!235418 () Bool)

(assert (=> start!73708 (=> (not res!267882) (not e!235418))))

(declare-datatypes ((array!21164 0))(
  ( (array!21165 (arr!10279 (Array (_ BitVec 32) (_ BitVec 8))) (size!9187 (_ BitVec 32))) )
))
(declare-fun a1!688 () array!21164)

(declare-fun fromBit!81 () (_ BitVec 64))

(declare-fun toBit!81 () (_ BitVec 64))

(declare-fun a2!688 () array!21164)

(assert (=> start!73708 (= res!267882 (and (bvsle (size!9187 a1!688) (size!9187 a2!688)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!81) (bvsle fromBit!81 toBit!81) (bvsle toBit!81 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9187 a1!688)))) (bvslt fromBit!81 toBit!81)))))

(assert (=> start!73708 e!235418))

(declare-fun array_inv!8739 (array!21164) Bool)

(assert (=> start!73708 (array_inv!8739 a1!688)))

(assert (=> start!73708 (array_inv!8739 a2!688)))

(assert (=> start!73708 true))

(declare-fun b!326310 () Bool)

(declare-datatypes ((tuple4!1356 0))(
  ( (tuple4!1357 (_1!13519 (_ BitVec 32)) (_2!13519 (_ BitVec 32)) (_3!1635 (_ BitVec 32)) (_4!678 (_ BitVec 32))) )
))
(declare-fun lt!448499 () tuple4!1356)

(assert (=> b!326310 (= e!235418 (and (bvslt (_1!13519 lt!448499) (_2!13519 lt!448499)) (bvsle #b00000000000000000000000000000000 (_1!13519 lt!448499)) (bvsle (_1!13519 lt!448499) (_2!13519 lt!448499)) (bvsgt (_2!13519 lt!448499) (size!9187 a1!688))))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1356)

(assert (=> b!326310 (= lt!448499 (arrayBitIndices!0 fromBit!81 toBit!81))))

(assert (= (and start!73708 res!267882) b!326310))

(declare-fun m!464093 () Bool)

(assert (=> start!73708 m!464093))

(declare-fun m!464095 () Bool)

(assert (=> start!73708 m!464095))

(declare-fun m!464097 () Bool)

(assert (=> b!326310 m!464097))

(push 1)

(assert (not start!73708))

(assert (not b!326310))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107584 () Bool)

(assert (=> d!107584 (= (array_inv!8739 a1!688) (bvsge (size!9187 a1!688) #b00000000000000000000000000000000))))

(assert (=> start!73708 d!107584))

(declare-fun d!107586 () Bool)

(assert (=> d!107586 (= (array_inv!8739 a2!688) (bvsge (size!9187 a2!688) #b00000000000000000000000000000000))))

(assert (=> start!73708 d!107586))

(declare-fun d!107588 () Bool)

(assert (=> d!107588 (= (arrayBitIndices!0 fromBit!81 toBit!81) (tuple4!1357 ((_ extract 31 0) (bvadd (bvsdiv fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!326310 d!107588))

(push 1)

(check-sat)

