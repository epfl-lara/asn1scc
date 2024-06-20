; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66974 () Bool)

(assert start!66974)

(declare-fun res!247170 () Bool)

(declare-fun e!215045 () Bool)

(assert (=> start!66974 (=> (not res!247170) (not e!215045))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18174 0))(
  ( (array!18175 (arr!8973 (Array (_ BitVec 32) (_ BitVec 8))) (size!7890 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18174)

(declare-fun a2!948 () array!18174)

(assert (=> start!66974 (= res!247170 (and (bvsle (size!7890 a1!948) (size!7890 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!66974 e!215045))

(assert (=> start!66974 true))

(declare-fun array_inv!7502 (array!18174) Bool)

(assert (=> start!66974 (array_inv!7502 a1!948)))

(assert (=> start!66974 (array_inv!7502 a2!948)))

(declare-fun b!299533 () Bool)

(declare-fun res!247172 () Bool)

(declare-fun e!215049 () Bool)

(assert (=> b!299533 (=> (not res!247172) (not e!215049))))

(declare-fun lt!435341 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!299533 (= res!247172 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!435341) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!299534 () Bool)

(declare-fun res!247171 () Bool)

(assert (=> b!299534 (=> (not res!247171) (not e!215049))))

(declare-fun arrayBitRangesEq!0 (array!18174 array!18174 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!299534 (= res!247171 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!299535 () Bool)

(declare-datatypes ((Unit!20920 0))(
  ( (Unit!20921) )
))
(declare-fun e!215046 () Unit!20920)

(declare-fun lt!435345 () Unit!20920)

(assert (=> b!299535 (= e!215046 lt!435345)))

(declare-datatypes ((tuple4!988 0))(
  ( (tuple4!989 (_1!13149 (_ BitVec 32)) (_2!13149 (_ BitVec 32)) (_3!1451 (_ BitVec 32)) (_4!494 (_ BitVec 32))) )
))
(declare-fun lt!435344 () tuple4!988)

(declare-fun lt!435342 () tuple4!988)

(declare-fun arrayRangesEqSlicedLemma!162 (array!18174 array!18174 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20920)

(assert (=> b!299535 (= lt!435345 (arrayRangesEqSlicedLemma!162 a1!948 a2!948 (_1!13149 lt!435344) (_2!13149 lt!435344) (_1!13149 lt!435342) (_2!13149 lt!435342)))))

(declare-fun arrayRangesEq!1552 (array!18174 array!18174 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!299535 (arrayRangesEq!1552 a1!948 a2!948 (_1!13149 lt!435342) (_2!13149 lt!435342))))

(declare-fun b!299536 () Bool)

(assert (=> b!299536 (= e!215049 false)))

(declare-fun lt!435343 () Unit!20920)

(assert (=> b!299536 (= lt!435343 e!215046)))

(declare-fun c!13764 () Bool)

(assert (=> b!299536 (= c!13764 (bvslt (_1!13149 lt!435342) (_2!13149 lt!435342)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!988)

(assert (=> b!299536 (= lt!435342 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!299536 (= lt!435344 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!299537 () Bool)

(assert (=> b!299537 (= e!215045 e!215049)))

(declare-fun res!247169 () Bool)

(assert (=> b!299537 (=> (not res!247169) (not e!215049))))

(assert (=> b!299537 (= res!247169 (and (bvsle toBit!258 lt!435341) (bvsle fromBit!258 lt!435341)))))

(assert (=> b!299537 (= lt!435341 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7890 a1!948))))))

(declare-fun b!299538 () Bool)

(declare-fun Unit!20922 () Unit!20920)

(assert (=> b!299538 (= e!215046 Unit!20922)))

(assert (= (and start!66974 res!247170) b!299537))

(assert (= (and b!299537 res!247169) b!299534))

(assert (= (and b!299534 res!247171) b!299533))

(assert (= (and b!299533 res!247172) b!299536))

(assert (= (and b!299536 c!13764) b!299535))

(assert (= (and b!299536 (not c!13764)) b!299538))

(declare-fun m!438677 () Bool)

(assert (=> start!66974 m!438677))

(declare-fun m!438679 () Bool)

(assert (=> start!66974 m!438679))

(declare-fun m!438681 () Bool)

(assert (=> b!299534 m!438681))

(declare-fun m!438683 () Bool)

(assert (=> b!299535 m!438683))

(declare-fun m!438685 () Bool)

(assert (=> b!299535 m!438685))

(declare-fun m!438687 () Bool)

(assert (=> b!299536 m!438687))

(declare-fun m!438689 () Bool)

(assert (=> b!299536 m!438689))

(push 1)

