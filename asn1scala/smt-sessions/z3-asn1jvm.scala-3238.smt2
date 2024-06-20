; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73788 () Bool)

(assert start!73788)

(declare-fun res!268015 () Bool)

(declare-fun e!235699 () Bool)

(assert (=> start!73788 (=> (not res!268015) (not e!235699))))

(declare-datatypes ((array!21225 0))(
  ( (array!21226 (arr!10307 (Array (_ BitVec 32) (_ BitVec 8))) (size!9215 (_ BitVec 32))) )
))
(declare-fun a1!688 () array!21225)

(declare-fun fromBit!81 () (_ BitVec 64))

(declare-fun toBit!81 () (_ BitVec 64))

(declare-fun a2!688 () array!21225)

(assert (=> start!73788 (= res!268015 (and (bvsle (size!9215 a1!688) (size!9215 a2!688)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!81) (bvsle fromBit!81 toBit!81) (bvsle toBit!81 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9215 a1!688)))) (bvslt fromBit!81 toBit!81)))))

(assert (=> start!73788 e!235699))

(declare-fun array_inv!8767 (array!21225) Bool)

(assert (=> start!73788 (array_inv!8767 a1!688)))

(assert (=> start!73788 (array_inv!8767 a2!688)))

(assert (=> start!73788 true))

(declare-fun b!326443 () Bool)

(declare-fun e!235702 () Bool)

(assert (=> b!326443 (= e!235699 e!235702)))

(declare-fun res!268017 () Bool)

(assert (=> b!326443 (=> (not res!268017) (not e!235702))))

(declare-fun e!235701 () Bool)

(assert (=> b!326443 (= res!268017 e!235701)))

(declare-fun res!268016 () Bool)

(assert (=> b!326443 (=> res!268016 e!235701)))

(declare-datatypes ((tuple4!1382 0))(
  ( (tuple4!1383 (_1!13532 (_ BitVec 32)) (_2!13532 (_ BitVec 32)) (_3!1648 (_ BitVec 32)) (_4!691 (_ BitVec 32))) )
))
(declare-fun lt!448574 () tuple4!1382)

(assert (=> b!326443 (= res!268016 (bvsge (_1!13532 lt!448574) (_2!13532 lt!448574)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1382)

(assert (=> b!326443 (= lt!448574 (arrayBitIndices!0 fromBit!81 toBit!81))))

(declare-fun b!326444 () Bool)

(declare-fun arrayRangesEq!1839 (array!21225 array!21225 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!326444 (= e!235701 (arrayRangesEq!1839 a1!688 a2!688 (_1!13532 lt!448574) (_2!13532 lt!448574)))))

(declare-fun b!326445 () Bool)

(assert (=> b!326445 (= e!235702 (and (= (_3!1648 lt!448574) (_4!691 lt!448574)) (or (bvslt (_3!1648 lt!448574) #b00000000000000000000000000000000) (bvsge (_3!1648 lt!448574) (size!9215 a1!688)))))))

(assert (= (and start!73788 res!268015) b!326443))

(assert (= (and b!326443 (not res!268016)) b!326444))

(assert (= (and b!326443 res!268017) b!326445))

(declare-fun m!464281 () Bool)

(assert (=> start!73788 m!464281))

(declare-fun m!464283 () Bool)

(assert (=> start!73788 m!464283))

(declare-fun m!464285 () Bool)

(assert (=> b!326443 m!464285))

(declare-fun m!464287 () Bool)

(assert (=> b!326444 m!464287))

(check-sat (not start!73788) (not b!326443) (not b!326444))
(check-sat)
(get-model)

(declare-fun d!107630 () Bool)

(assert (=> d!107630 (= (array_inv!8767 a1!688) (bvsge (size!9215 a1!688) #b00000000000000000000000000000000))))

(assert (=> start!73788 d!107630))

(declare-fun d!107632 () Bool)

(assert (=> d!107632 (= (array_inv!8767 a2!688) (bvsge (size!9215 a2!688) #b00000000000000000000000000000000))))

(assert (=> start!73788 d!107632))

(declare-fun d!107634 () Bool)

(assert (=> d!107634 (= (arrayBitIndices!0 fromBit!81 toBit!81) (tuple4!1383 ((_ extract 31 0) (bvadd (bvsdiv fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!326443 d!107634))

(declare-fun d!107642 () Bool)

(declare-fun res!268031 () Bool)

(declare-fun e!235723 () Bool)

(assert (=> d!107642 (=> res!268031 e!235723)))

(assert (=> d!107642 (= res!268031 (= (_1!13532 lt!448574) (_2!13532 lt!448574)))))

(assert (=> d!107642 (= (arrayRangesEq!1839 a1!688 a2!688 (_1!13532 lt!448574) (_2!13532 lt!448574)) e!235723)))

(declare-fun b!326459 () Bool)

(declare-fun e!235724 () Bool)

(assert (=> b!326459 (= e!235723 e!235724)))

(declare-fun res!268032 () Bool)

(assert (=> b!326459 (=> (not res!268032) (not e!235724))))

(assert (=> b!326459 (= res!268032 (= (select (arr!10307 a1!688) (_1!13532 lt!448574)) (select (arr!10307 a2!688) (_1!13532 lt!448574))))))

(declare-fun b!326460 () Bool)

(assert (=> b!326460 (= e!235724 (arrayRangesEq!1839 a1!688 a2!688 (bvadd (_1!13532 lt!448574) #b00000000000000000000000000000001) (_2!13532 lt!448574)))))

(assert (= (and d!107642 (not res!268031)) b!326459))

(assert (= (and b!326459 res!268032) b!326460))

(declare-fun m!464297 () Bool)

(assert (=> b!326459 m!464297))

(declare-fun m!464299 () Bool)

(assert (=> b!326459 m!464299))

(declare-fun m!464301 () Bool)

(assert (=> b!326460 m!464301))

(assert (=> b!326444 d!107642))

(check-sat (not b!326460))
