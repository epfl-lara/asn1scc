; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73744 () Bool)

(assert start!73744)

(declare-fun res!267934 () Bool)

(declare-fun e!235504 () Bool)

(assert (=> start!73744 (=> (not res!267934) (not e!235504))))

(declare-datatypes ((array!21181 0))(
  ( (array!21182 (arr!10285 (Array (_ BitVec 32) (_ BitVec 8))) (size!9193 (_ BitVec 32))) )
))
(declare-fun a1!688 () array!21181)

(declare-fun fromBit!81 () (_ BitVec 64))

(declare-fun toBit!81 () (_ BitVec 64))

(declare-fun a2!688 () array!21181)

(assert (=> start!73744 (= res!267934 (and (bvsle (size!9193 a1!688) (size!9193 a2!688)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!81) (bvsle fromBit!81 toBit!81) (bvsle toBit!81 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9193 a1!688)))) (bvslt fromBit!81 toBit!81)))))

(assert (=> start!73744 e!235504))

(declare-fun array_inv!8745 (array!21181) Bool)

(assert (=> start!73744 (array_inv!8745 a1!688)))

(assert (=> start!73744 (array_inv!8745 a2!688)))

(assert (=> start!73744 true))

(declare-fun b!326362 () Bool)

(declare-fun e!235506 () Bool)

(assert (=> b!326362 (= e!235504 e!235506)))

(declare-fun res!267936 () Bool)

(assert (=> b!326362 (=> (not res!267936) (not e!235506))))

(declare-fun e!235505 () Bool)

(assert (=> b!326362 (= res!267936 e!235505)))

(declare-fun res!267935 () Bool)

(assert (=> b!326362 (=> res!267935 e!235505)))

(declare-datatypes ((tuple4!1368 0))(
  ( (tuple4!1369 (_1!13525 (_ BitVec 32)) (_2!13525 (_ BitVec 32)) (_3!1641 (_ BitVec 32)) (_4!684 (_ BitVec 32))) )
))
(declare-fun lt!448537 () tuple4!1368)

(assert (=> b!326362 (= res!267935 (bvsge (_1!13525 lt!448537) (_2!13525 lt!448537)))))

(declare-fun lt!448538 () (_ BitVec 32))

(assert (=> b!326362 (= lt!448538 ((_ extract 31 0) (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1368)

(assert (=> b!326362 (= lt!448537 (arrayBitIndices!0 fromBit!81 toBit!81))))

(declare-fun b!326363 () Bool)

(declare-fun arrayRangesEq!1832 (array!21181 array!21181 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!326363 (= e!235505 (arrayRangesEq!1832 a1!688 a2!688 (_1!13525 lt!448537) (_2!13525 lt!448537)))))

(declare-fun b!326364 () Bool)

(assert (=> b!326364 (= e!235506 (and (not (= (_3!1641 lt!448537) (_4!684 lt!448537))) (or (bvsgt #b00000000000000000000000000000000 lt!448538) (bvsgt lt!448538 #b00000000000000000000000000001000))))))

(assert (= (and start!73744 res!267934) b!326362))

(assert (= (and b!326362 (not res!267935)) b!326363))

(assert (= (and b!326362 res!267936) b!326364))

(declare-fun m!464147 () Bool)

(assert (=> start!73744 m!464147))

(declare-fun m!464149 () Bool)

(assert (=> start!73744 m!464149))

(declare-fun m!464151 () Bool)

(assert (=> b!326362 m!464151))

(declare-fun m!464153 () Bool)

(assert (=> b!326363 m!464153))

(push 1)

(assert (not b!326363))

(assert (not start!73744))

(assert (not b!326362))

(check-sat)

(pop 1)

(push 1)

(check-sat)

