; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67750 () Bool)

(assert start!67750)

(declare-fun b!304058 () Bool)

(declare-fun res!250159 () Bool)

(declare-fun e!218849 () Bool)

(assert (=> b!304058 (=> (not res!250159) (not e!218849))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18477 0))(
  ( (array!18478 (arr!9099 (Array (_ BitVec 32) (_ BitVec 8))) (size!8016 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18477)

(declare-fun a2!948 () array!18477)

(declare-fun arrayBitRangesEq!0 (array!18477 array!18477 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!304058 (= res!250159 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!304059 () Bool)

(declare-datatypes ((Unit!21229 0))(
  ( (Unit!21230) )
))
(declare-fun e!218848 () Unit!21229)

(declare-fun Unit!21231 () Unit!21229)

(assert (=> b!304059 (= e!218848 Unit!21231)))

(declare-fun b!304060 () Bool)

(assert (=> b!304060 (= e!218849 false)))

(declare-fun lt!438144 () Unit!21229)

(assert (=> b!304060 (= lt!438144 e!218848)))

(declare-fun c!14532 () Bool)

(declare-datatypes ((tuple4!1174 0))(
  ( (tuple4!1175 (_1!13242 (_ BitVec 32)) (_2!13242 (_ BitVec 32)) (_3!1544 (_ BitVec 32)) (_4!587 (_ BitVec 32))) )
))
(declare-fun lt!438146 () tuple4!1174)

(assert (=> b!304060 (= c!14532 (bvslt (_1!13242 lt!438146) (_2!13242 lt!438146)))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1174)

(assert (=> b!304060 (= lt!438146 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(declare-fun lt!438143 () tuple4!1174)

(assert (=> b!304060 (= lt!438143 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!304061 () Bool)

(declare-fun lt!438147 () Unit!21229)

(assert (=> b!304061 (= e!218848 lt!438147)))

(declare-fun arrayRangesEqSlicedLemma!240 (array!18477 array!18477 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21229)

(assert (=> b!304061 (= lt!438147 (arrayRangesEqSlicedLemma!240 a1!948 a2!948 (_1!13242 lt!438143) (_2!13242 lt!438143) (_1!13242 lt!438146) (_2!13242 lt!438146)))))

(declare-fun arrayRangesEq!1645 (array!18477 array!18477 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!304061 (arrayRangesEq!1645 a1!948 a2!948 (_1!13242 lt!438146) (_2!13242 lt!438146))))

(declare-fun res!250161 () Bool)

(declare-fun e!218847 () Bool)

(assert (=> start!67750 (=> (not res!250161) (not e!218847))))

(assert (=> start!67750 (= res!250161 (and (bvsle (size!8016 a1!948) (size!8016 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67750 e!218847))

(assert (=> start!67750 true))

(declare-fun array_inv!7628 (array!18477) Bool)

(assert (=> start!67750 (array_inv!7628 a1!948)))

(assert (=> start!67750 (array_inv!7628 a2!948)))

(declare-fun b!304062 () Bool)

(declare-fun res!250158 () Bool)

(assert (=> b!304062 (=> (not res!250158) (not e!218849))))

(declare-fun lt!438145 () (_ BitVec 64))

(assert (=> b!304062 (= res!250158 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!438145) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!304063 () Bool)

(assert (=> b!304063 (= e!218847 e!218849)))

(declare-fun res!250160 () Bool)

(assert (=> b!304063 (=> (not res!250160) (not e!218849))))

(assert (=> b!304063 (= res!250160 (and (bvsle toBit!258 lt!438145) (bvsle fromBit!258 lt!438145)))))

(assert (=> b!304063 (= lt!438145 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8016 a1!948))))))

(assert (= (and start!67750 res!250161) b!304063))

(assert (= (and b!304063 res!250160) b!304058))

(assert (= (and b!304058 res!250159) b!304062))

(assert (= (and b!304062 res!250158) b!304060))

(assert (= (and b!304060 c!14532) b!304061))

(assert (= (and b!304060 (not c!14532)) b!304059))

(declare-fun m!442597 () Bool)

(assert (=> b!304058 m!442597))

(declare-fun m!442599 () Bool)

(assert (=> b!304060 m!442599))

(declare-fun m!442601 () Bool)

(assert (=> b!304060 m!442601))

(declare-fun m!442603 () Bool)

(assert (=> b!304061 m!442603))

(declare-fun m!442605 () Bool)

(assert (=> b!304061 m!442605))

(declare-fun m!442607 () Bool)

(assert (=> start!67750 m!442607))

(declare-fun m!442609 () Bool)

(assert (=> start!67750 m!442609))

(push 1)

(assert (not b!304058))

(assert (not start!67750))

(assert (not b!304060))

(assert (not b!304061))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

