; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73754 () Bool)

(assert start!73754)

(declare-datatypes ((tuple4!1378 0))(
  ( (tuple4!1379 (_1!13530 (_ BitVec 32)) (_2!13530 (_ BitVec 32)) (_3!1646 (_ BitVec 32)) (_4!689 (_ BitVec 32))) )
))
(declare-fun lt!448567 () tuple4!1378)

(declare-datatypes ((array!21191 0))(
  ( (array!21192 (arr!10290 (Array (_ BitVec 32) (_ BitVec 8))) (size!9198 (_ BitVec 32))) )
))
(declare-fun a1!688 () array!21191)

(declare-fun e!235581 () Bool)

(declare-fun a2!688 () array!21191)

(declare-fun b!326423 () Bool)

(declare-fun arrayRangesEq!1837 (array!21191 array!21191 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!326423 (= e!235581 (arrayRangesEq!1837 a1!688 a2!688 (_1!13530 lt!448567) (_2!13530 lt!448567)))))

(declare-fun b!326424 () Bool)

(declare-fun res!267998 () Bool)

(declare-fun e!235582 () Bool)

(assert (=> b!326424 (=> (not res!267998) (not e!235582))))

(assert (=> b!326424 (= res!267998 (not (= (_3!1646 lt!448567) (_4!689 lt!448567))))))

(declare-fun b!326425 () Bool)

(declare-fun e!235580 () Bool)

(assert (=> b!326425 (= e!235580 e!235582)))

(declare-fun res!267997 () Bool)

(assert (=> b!326425 (=> (not res!267997) (not e!235582))))

(assert (=> b!326425 (= res!267997 e!235581)))

(declare-fun res!267999 () Bool)

(assert (=> b!326425 (=> res!267999 e!235581)))

(assert (=> b!326425 (= res!267999 (bvsge (_1!13530 lt!448567) (_2!13530 lt!448567)))))

(declare-fun lt!448568 () (_ BitVec 32))

(declare-fun toBit!81 () (_ BitVec 64))

(assert (=> b!326425 (= lt!448568 ((_ extract 31 0) (bvsrem toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun fromBit!81 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1378)

(assert (=> b!326425 (= lt!448567 (arrayBitIndices!0 fromBit!81 toBit!81))))

(declare-fun b!326426 () Bool)

(assert (=> b!326426 (= e!235582 (and (not (= lt!448568 #b00000000000000000000000000000000)) (or (bvsgt #b00000000000000000000000000000000 lt!448568) (bvsgt lt!448568 #b00000000000000000000000000001000))))))

(declare-fun res!267996 () Bool)

(assert (=> start!73754 (=> (not res!267996) (not e!235580))))

(assert (=> start!73754 (= res!267996 (and (bvsle (size!9198 a1!688) (size!9198 a2!688)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!81) (bvsle fromBit!81 toBit!81) (bvsle toBit!81 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9198 a1!688)))) (bvslt fromBit!81 toBit!81)))))

(assert (=> start!73754 e!235580))

(declare-fun array_inv!8750 (array!21191) Bool)

(assert (=> start!73754 (array_inv!8750 a1!688)))

(assert (=> start!73754 (array_inv!8750 a2!688)))

(assert (=> start!73754 true))

(declare-fun b!326427 () Bool)

(declare-fun res!267995 () Bool)

(assert (=> b!326427 (=> (not res!267995) (not e!235582))))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!326427 (= res!267995 (byteRangesEq!0 (select (arr!10290 a1!688) (_3!1646 lt!448567)) (select (arr!10290 a2!688) (_3!1646 lt!448567)) ((_ extract 31 0) (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (= (and start!73754 res!267996) b!326425))

(assert (= (and b!326425 (not res!267999)) b!326423))

(assert (= (and b!326425 res!267997) b!326424))

(assert (= (and b!326424 res!267998) b!326427))

(assert (= (and b!326427 res!267995) b!326426))

(declare-fun m!464199 () Bool)

(assert (=> b!326423 m!464199))

(declare-fun m!464201 () Bool)

(assert (=> b!326425 m!464201))

(declare-fun m!464203 () Bool)

(assert (=> start!73754 m!464203))

(declare-fun m!464205 () Bool)

(assert (=> start!73754 m!464205))

(declare-fun m!464207 () Bool)

(assert (=> b!326427 m!464207))

(declare-fun m!464209 () Bool)

(assert (=> b!326427 m!464209))

(assert (=> b!326427 m!464207))

(assert (=> b!326427 m!464209))

(declare-fun m!464211 () Bool)

(assert (=> b!326427 m!464211))

(push 1)

(assert (not start!73754))

(assert (not b!326425))

(assert (not b!326427))

(assert (not b!326423))

(check-sat)

(pop 1)

(push 1)

(check-sat)

