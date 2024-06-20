; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73692 () Bool)

(assert start!73692)

(declare-fun res!267876 () Bool)

(declare-fun e!235400 () Bool)

(assert (=> start!73692 (=> (not res!267876) (not e!235400))))

(declare-datatypes ((array!21157 0))(
  ( (array!21158 (arr!10277 (Array (_ BitVec 32) (_ BitVec 8))) (size!9185 (_ BitVec 32))) )
))
(declare-fun a1!688 () array!21157)

(declare-fun fromBit!81 () (_ BitVec 64))

(declare-fun toBit!81 () (_ BitVec 64))

(declare-fun a2!688 () array!21157)

(assert (=> start!73692 (= res!267876 (and (bvsle (size!9185 a1!688) (size!9185 a2!688)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!81) (bvsle fromBit!81 toBit!81) (bvsle toBit!81 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9185 a1!688)))) (bvslt fromBit!81 toBit!81)))))

(assert (=> start!73692 e!235400))

(declare-fun array_inv!8737 (array!21157) Bool)

(assert (=> start!73692 (array_inv!8737 a1!688)))

(assert (=> start!73692 (array_inv!8737 a2!688)))

(assert (=> start!73692 true))

(declare-fun b!326304 () Bool)

(declare-datatypes ((tuple4!1352 0))(
  ( (tuple4!1353 (_1!13517 (_ BitVec 32)) (_2!13517 (_ BitVec 32)) (_3!1633 (_ BitVec 32)) (_4!676 (_ BitVec 32))) )
))
(declare-fun lt!448493 () tuple4!1352)

(assert (=> b!326304 (= e!235400 (and (bvslt (_1!13517 lt!448493) (_2!13517 lt!448493)) (or (bvsgt #b00000000000000000000000000000000 (_1!13517 lt!448493)) (bvsgt (_1!13517 lt!448493) (_2!13517 lt!448493)))))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1352)

(assert (=> b!326304 (= lt!448493 (arrayBitIndices!0 fromBit!81 toBit!81))))

(assert (= (and start!73692 res!267876) b!326304))

(declare-fun m!464081 () Bool)

(assert (=> start!73692 m!464081))

(declare-fun m!464083 () Bool)

(assert (=> start!73692 m!464083))

(declare-fun m!464085 () Bool)

(assert (=> b!326304 m!464085))

(check-sat (not b!326304) (not start!73692))
(check-sat)
(get-model)

(declare-fun d!107558 () Bool)

(assert (=> d!107558 (= (arrayBitIndices!0 fromBit!81 toBit!81) (tuple4!1353 ((_ extract 31 0) (bvadd (bvsdiv fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!326304 d!107558))

(declare-fun d!107560 () Bool)

(assert (=> d!107560 (= (array_inv!8737 a1!688) (bvsge (size!9185 a1!688) #b00000000000000000000000000000000))))

(assert (=> start!73692 d!107560))

(declare-fun d!107562 () Bool)

(assert (=> d!107562 (= (array_inv!8737 a2!688) (bvsge (size!9185 a2!688) #b00000000000000000000000000000000))))

(assert (=> start!73692 d!107562))

(check-sat)
