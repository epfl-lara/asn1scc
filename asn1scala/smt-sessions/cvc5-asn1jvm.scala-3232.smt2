; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73750 () Bool)

(assert start!73750)

(declare-fun b!326393 () Bool)

(declare-fun e!235553 () Bool)

(declare-fun lt!448555 () (_ BitVec 32))

(assert (=> b!326393 (= e!235553 (and (not (= lt!448555 #b00000000000000000000000000000000)) (or (bvsgt #b00000000000000000000000000000000 lt!448555) (bvsgt lt!448555 #b00000000000000000000000000001000))))))

(declare-datatypes ((array!21187 0))(
  ( (array!21188 (arr!10288 (Array (_ BitVec 32) (_ BitVec 8))) (size!9196 (_ BitVec 32))) )
))
(declare-fun a1!688 () array!21187)

(declare-fun e!235552 () Bool)

(declare-fun b!326394 () Bool)

(declare-fun a2!688 () array!21187)

(declare-datatypes ((tuple4!1374 0))(
  ( (tuple4!1375 (_1!13528 (_ BitVec 32)) (_2!13528 (_ BitVec 32)) (_3!1644 (_ BitVec 32)) (_4!687 (_ BitVec 32))) )
))
(declare-fun lt!448556 () tuple4!1374)

(declare-fun arrayRangesEq!1835 (array!21187 array!21187 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!326394 (= e!235552 (arrayRangesEq!1835 a1!688 a2!688 (_1!13528 lt!448556) (_2!13528 lt!448556)))))

(declare-fun res!267969 () Bool)

(declare-fun e!235551 () Bool)

(assert (=> start!73750 (=> (not res!267969) (not e!235551))))

(declare-fun fromBit!81 () (_ BitVec 64))

(declare-fun toBit!81 () (_ BitVec 64))

(assert (=> start!73750 (= res!267969 (and (bvsle (size!9196 a1!688) (size!9196 a2!688)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!81) (bvsle fromBit!81 toBit!81) (bvsle toBit!81 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9196 a1!688)))) (bvslt fromBit!81 toBit!81)))))

(assert (=> start!73750 e!235551))

(declare-fun array_inv!8748 (array!21187) Bool)

(assert (=> start!73750 (array_inv!8748 a1!688)))

(assert (=> start!73750 (array_inv!8748 a2!688)))

(assert (=> start!73750 true))

(declare-fun b!326395 () Bool)

(declare-fun res!267968 () Bool)

(assert (=> b!326395 (=> (not res!267968) (not e!235553))))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!326395 (= res!267968 (byteRangesEq!0 (select (arr!10288 a1!688) (_3!1644 lt!448556)) (select (arr!10288 a2!688) (_3!1644 lt!448556)) ((_ extract 31 0) (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(declare-fun b!326396 () Bool)

(assert (=> b!326396 (= e!235551 e!235553)))

(declare-fun res!267965 () Bool)

(assert (=> b!326396 (=> (not res!267965) (not e!235553))))

(assert (=> b!326396 (= res!267965 e!235552)))

(declare-fun res!267967 () Bool)

(assert (=> b!326396 (=> res!267967 e!235552)))

(assert (=> b!326396 (= res!267967 (bvsge (_1!13528 lt!448556) (_2!13528 lt!448556)))))

(assert (=> b!326396 (= lt!448555 ((_ extract 31 0) (bvsrem toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1374)

(assert (=> b!326396 (= lt!448556 (arrayBitIndices!0 fromBit!81 toBit!81))))

(declare-fun b!326397 () Bool)

(declare-fun res!267966 () Bool)

(assert (=> b!326397 (=> (not res!267966) (not e!235553))))

(assert (=> b!326397 (= res!267966 (not (= (_3!1644 lt!448556) (_4!687 lt!448556))))))

(assert (= (and start!73750 res!267969) b!326396))

(assert (= (and b!326396 (not res!267967)) b!326394))

(assert (= (and b!326396 res!267965) b!326397))

(assert (= (and b!326397 res!267966) b!326395))

(assert (= (and b!326395 res!267968) b!326393))

(declare-fun m!464171 () Bool)

(assert (=> b!326394 m!464171))

(declare-fun m!464173 () Bool)

(assert (=> start!73750 m!464173))

(declare-fun m!464175 () Bool)

(assert (=> start!73750 m!464175))

(declare-fun m!464177 () Bool)

(assert (=> b!326395 m!464177))

(declare-fun m!464179 () Bool)

(assert (=> b!326395 m!464179))

(assert (=> b!326395 m!464177))

(assert (=> b!326395 m!464179))

(declare-fun m!464181 () Bool)

(assert (=> b!326395 m!464181))

(declare-fun m!464183 () Bool)

(assert (=> b!326396 m!464183))

(push 1)

(assert (not b!326395))

(assert (not b!326394))

(assert (not start!73750))

(assert (not b!326396))

(check-sat)

(pop 1)

(push 1)

(check-sat)

