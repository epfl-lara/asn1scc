; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73752 () Bool)

(assert start!73752)

(declare-fun b!326408 () Bool)

(declare-fun e!235564 () Bool)

(declare-fun e!235565 () Bool)

(assert (=> b!326408 (= e!235564 e!235565)))

(declare-fun res!267983 () Bool)

(assert (=> b!326408 (=> (not res!267983) (not e!235565))))

(declare-fun e!235567 () Bool)

(assert (=> b!326408 (= res!267983 e!235567)))

(declare-fun res!267981 () Bool)

(assert (=> b!326408 (=> res!267981 e!235567)))

(declare-datatypes ((tuple4!1376 0))(
  ( (tuple4!1377 (_1!13529 (_ BitVec 32)) (_2!13529 (_ BitVec 32)) (_3!1645 (_ BitVec 32)) (_4!688 (_ BitVec 32))) )
))
(declare-fun lt!448561 () tuple4!1376)

(assert (=> b!326408 (= res!267981 (bvsge (_1!13529 lt!448561) (_2!13529 lt!448561)))))

(declare-fun lt!448562 () (_ BitVec 32))

(declare-fun toBit!81 () (_ BitVec 64))

(assert (=> b!326408 (= lt!448562 ((_ extract 31 0) (bvsrem toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun fromBit!81 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1376)

(assert (=> b!326408 (= lt!448561 (arrayBitIndices!0 fromBit!81 toBit!81))))

(declare-fun b!326409 () Bool)

(declare-fun res!267980 () Bool)

(assert (=> b!326409 (=> (not res!267980) (not e!235565))))

(assert (=> b!326409 (= res!267980 (not (= (_3!1645 lt!448561) (_4!688 lt!448561))))))

(declare-fun b!326410 () Bool)

(declare-fun res!267982 () Bool)

(assert (=> b!326410 (=> (not res!267982) (not e!235565))))

(declare-datatypes ((array!21189 0))(
  ( (array!21190 (arr!10289 (Array (_ BitVec 32) (_ BitVec 8))) (size!9197 (_ BitVec 32))) )
))
(declare-fun a1!688 () array!21189)

(declare-fun a2!688 () array!21189)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!326410 (= res!267982 (byteRangesEq!0 (select (arr!10289 a1!688) (_3!1645 lt!448561)) (select (arr!10289 a2!688) (_3!1645 lt!448561)) ((_ extract 31 0) (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(declare-fun res!267984 () Bool)

(assert (=> start!73752 (=> (not res!267984) (not e!235564))))

(assert (=> start!73752 (= res!267984 (and (bvsle (size!9197 a1!688) (size!9197 a2!688)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!81) (bvsle fromBit!81 toBit!81) (bvsle toBit!81 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9197 a1!688)))) (bvslt fromBit!81 toBit!81)))))

(assert (=> start!73752 e!235564))

(declare-fun array_inv!8749 (array!21189) Bool)

(assert (=> start!73752 (array_inv!8749 a1!688)))

(assert (=> start!73752 (array_inv!8749 a2!688)))

(assert (=> start!73752 true))

(declare-fun b!326411 () Bool)

(assert (=> b!326411 (= e!235565 (and (not (= lt!448562 #b00000000000000000000000000000000)) (or (bvsgt #b00000000000000000000000000000000 lt!448562) (bvsgt lt!448562 #b00000000000000000000000000001000))))))

(declare-fun b!326412 () Bool)

(declare-fun arrayRangesEq!1836 (array!21189 array!21189 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!326412 (= e!235567 (arrayRangesEq!1836 a1!688 a2!688 (_1!13529 lt!448561) (_2!13529 lt!448561)))))

(assert (= (and start!73752 res!267984) b!326408))

(assert (= (and b!326408 (not res!267981)) b!326412))

(assert (= (and b!326408 res!267983) b!326409))

(assert (= (and b!326409 res!267980) b!326410))

(assert (= (and b!326410 res!267982) b!326411))

(declare-fun m!464185 () Bool)

(assert (=> b!326408 m!464185))

(declare-fun m!464187 () Bool)

(assert (=> b!326410 m!464187))

(declare-fun m!464189 () Bool)

(assert (=> b!326410 m!464189))

(assert (=> b!326410 m!464187))

(assert (=> b!326410 m!464189))

(declare-fun m!464191 () Bool)

(assert (=> b!326410 m!464191))

(declare-fun m!464193 () Bool)

(assert (=> start!73752 m!464193))

(declare-fun m!464195 () Bool)

(assert (=> start!73752 m!464195))

(declare-fun m!464197 () Bool)

(assert (=> b!326412 m!464197))

(check-sat (not b!326408) (not start!73752) (not b!326410) (not b!326412))
(check-sat)
