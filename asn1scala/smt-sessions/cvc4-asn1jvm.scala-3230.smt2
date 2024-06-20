; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73730 () Bool)

(assert start!73730)

(declare-fun res!267915 () Bool)

(declare-fun e!235480 () Bool)

(assert (=> start!73730 (=> (not res!267915) (not e!235480))))

(declare-datatypes ((array!21177 0))(
  ( (array!21178 (arr!10284 (Array (_ BitVec 32) (_ BitVec 8))) (size!9192 (_ BitVec 32))) )
))
(declare-fun a1!688 () array!21177)

(declare-fun fromBit!81 () (_ BitVec 64))

(declare-fun toBit!81 () (_ BitVec 64))

(declare-fun a2!688 () array!21177)

(assert (=> start!73730 (= res!267915 (and (bvsle (size!9192 a1!688) (size!9192 a2!688)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!81) (bvsle fromBit!81 toBit!81) (bvsle toBit!81 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9192 a1!688)))) (bvslt fromBit!81 toBit!81)))))

(assert (=> start!73730 e!235480))

(declare-fun array_inv!8744 (array!21177) Bool)

(assert (=> start!73730 (array_inv!8744 a1!688)))

(assert (=> start!73730 (array_inv!8744 a2!688)))

(assert (=> start!73730 true))

(declare-fun b!326341 () Bool)

(declare-fun e!235479 () Bool)

(assert (=> b!326341 (= e!235480 e!235479)))

(declare-fun res!267914 () Bool)

(assert (=> b!326341 (=> (not res!267914) (not e!235479))))

(declare-fun e!235481 () Bool)

(assert (=> b!326341 (= res!267914 e!235481)))

(declare-fun res!267913 () Bool)

(assert (=> b!326341 (=> res!267913 e!235481)))

(declare-datatypes ((tuple4!1366 0))(
  ( (tuple4!1367 (_1!13524 (_ BitVec 32)) (_2!13524 (_ BitVec 32)) (_3!1640 (_ BitVec 32)) (_4!683 (_ BitVec 32))) )
))
(declare-fun lt!448532 () tuple4!1366)

(assert (=> b!326341 (= res!267913 (bvsge (_1!13524 lt!448532) (_2!13524 lt!448532)))))

(declare-fun lt!448530 () (_ BitVec 32))

(assert (=> b!326341 (= lt!448530 ((_ extract 31 0) (bvsrem toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!448531 () (_ BitVec 32))

(assert (=> b!326341 (= lt!448531 ((_ extract 31 0) (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1366)

(assert (=> b!326341 (= lt!448532 (arrayBitIndices!0 fromBit!81 toBit!81))))

(declare-fun b!326342 () Bool)

(declare-fun arrayRangesEq!1831 (array!21177 array!21177 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!326342 (= e!235481 (arrayRangesEq!1831 a1!688 a2!688 (_1!13524 lt!448532) (_2!13524 lt!448532)))))

(declare-fun b!326343 () Bool)

(assert (=> b!326343 (= e!235479 (and (= (_3!1640 lt!448532) (_4!683 lt!448532)) (or (bvsgt #b00000000000000000000000000000000 lt!448531) (bvsgt lt!448531 lt!448530) (bvsgt lt!448530 #b00000000000000000000000000001000))))))

(assert (= (and start!73730 res!267915) b!326341))

(assert (= (and b!326341 (not res!267913)) b!326342))

(assert (= (and b!326341 res!267914) b!326343))

(declare-fun m!464127 () Bool)

(assert (=> start!73730 m!464127))

(declare-fun m!464129 () Bool)

(assert (=> start!73730 m!464129))

(declare-fun m!464131 () Bool)

(assert (=> b!326341 m!464131))

(declare-fun m!464133 () Bool)

(assert (=> b!326342 m!464133))

(push 1)

(assert (not start!73730))

(assert (not b!326341))

(assert (not b!326342))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

