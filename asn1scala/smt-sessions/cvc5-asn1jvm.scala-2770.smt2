; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66982 () Bool)

(assert start!66982)

(declare-fun b!299605 () Bool)

(declare-datatypes ((Unit!20932 0))(
  ( (Unit!20933) )
))
(declare-fun e!215105 () Unit!20932)

(declare-fun Unit!20934 () Unit!20932)

(assert (=> b!299605 (= e!215105 Unit!20934)))

(declare-fun res!247217 () Bool)

(declare-fun e!215107 () Bool)

(assert (=> start!66982 (=> (not res!247217) (not e!215107))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18182 0))(
  ( (array!18183 (arr!8977 (Array (_ BitVec 32) (_ BitVec 8))) (size!7894 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18182)

(declare-fun a2!948 () array!18182)

(assert (=> start!66982 (= res!247217 (and (bvsle (size!7894 a1!948) (size!7894 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!66982 e!215107))

(assert (=> start!66982 true))

(declare-fun array_inv!7506 (array!18182) Bool)

(assert (=> start!66982 (array_inv!7506 a1!948)))

(assert (=> start!66982 (array_inv!7506 a2!948)))

(declare-fun b!299606 () Bool)

(declare-fun res!247219 () Bool)

(declare-fun e!215106 () Bool)

(assert (=> b!299606 (=> (not res!247219) (not e!215106))))

(declare-fun lt!435404 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!299606 (= res!247219 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!435404) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!299607 () Bool)

(declare-fun lt!435403 () Unit!20932)

(assert (=> b!299607 (= e!215105 lt!435403)))

(declare-datatypes ((tuple4!996 0))(
  ( (tuple4!997 (_1!13153 (_ BitVec 32)) (_2!13153 (_ BitVec 32)) (_3!1455 (_ BitVec 32)) (_4!498 (_ BitVec 32))) )
))
(declare-fun lt!435405 () tuple4!996)

(declare-fun lt!435401 () tuple4!996)

(declare-fun arrayRangesEqSlicedLemma!166 (array!18182 array!18182 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20932)

(assert (=> b!299607 (= lt!435403 (arrayRangesEqSlicedLemma!166 a1!948 a2!948 (_1!13153 lt!435405) (_2!13153 lt!435405) (_1!13153 lt!435401) (_2!13153 lt!435401)))))

(declare-fun arrayRangesEq!1556 (array!18182 array!18182 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!299607 (arrayRangesEq!1556 a1!948 a2!948 (_1!13153 lt!435401) (_2!13153 lt!435401))))

(declare-fun b!299608 () Bool)

(assert (=> b!299608 (= e!215107 e!215106)))

(declare-fun res!247218 () Bool)

(assert (=> b!299608 (=> (not res!247218) (not e!215106))))

(assert (=> b!299608 (= res!247218 (and (bvsle toBit!258 lt!435404) (bvsle fromBit!258 lt!435404)))))

(assert (=> b!299608 (= lt!435404 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7894 a1!948))))))

(declare-fun b!299609 () Bool)

(assert (=> b!299609 (= e!215106 false)))

(declare-fun lt!435402 () Unit!20932)

(assert (=> b!299609 (= lt!435402 e!215105)))

(declare-fun c!13776 () Bool)

(assert (=> b!299609 (= c!13776 (bvslt (_1!13153 lt!435401) (_2!13153 lt!435401)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!996)

(assert (=> b!299609 (= lt!435401 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!299609 (= lt!435405 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!299610 () Bool)

(declare-fun res!247220 () Bool)

(assert (=> b!299610 (=> (not res!247220) (not e!215106))))

(declare-fun arrayBitRangesEq!0 (array!18182 array!18182 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!299610 (= res!247220 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(assert (= (and start!66982 res!247217) b!299608))

(assert (= (and b!299608 res!247218) b!299610))

(assert (= (and b!299610 res!247220) b!299606))

(assert (= (and b!299606 res!247219) b!299609))

(assert (= (and b!299609 c!13776) b!299607))

(assert (= (and b!299609 (not c!13776)) b!299605))

(declare-fun m!438733 () Bool)

(assert (=> start!66982 m!438733))

(declare-fun m!438735 () Bool)

(assert (=> start!66982 m!438735))

(declare-fun m!438737 () Bool)

(assert (=> b!299607 m!438737))

(declare-fun m!438739 () Bool)

(assert (=> b!299607 m!438739))

(declare-fun m!438741 () Bool)

(assert (=> b!299609 m!438741))

(declare-fun m!438743 () Bool)

(assert (=> b!299609 m!438743))

(declare-fun m!438745 () Bool)

(assert (=> b!299610 m!438745))

(push 1)

(assert (not b!299609))

(assert (not b!299610))

(assert (not start!66982))

(assert (not b!299607))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

