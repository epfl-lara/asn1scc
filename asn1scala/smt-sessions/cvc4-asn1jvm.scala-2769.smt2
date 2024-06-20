; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66980 () Bool)

(assert start!66980)

(declare-fun b!299587 () Bool)

(declare-fun e!215092 () Bool)

(declare-fun e!215090 () Bool)

(assert (=> b!299587 (= e!215092 e!215090)))

(declare-fun res!247207 () Bool)

(assert (=> b!299587 (=> (not res!247207) (not e!215090))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!435388 () (_ BitVec 64))

(assert (=> b!299587 (= res!247207 (and (bvsle toBit!258 lt!435388) (bvsle fromBit!258 lt!435388)))))

(declare-datatypes ((array!18180 0))(
  ( (array!18181 (arr!8976 (Array (_ BitVec 32) (_ BitVec 8))) (size!7893 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18180)

(assert (=> b!299587 (= lt!435388 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7893 a1!948))))))

(declare-fun b!299588 () Bool)

(assert (=> b!299588 (= e!215090 false)))

(declare-datatypes ((Unit!20929 0))(
  ( (Unit!20930) )
))
(declare-fun lt!435386 () Unit!20929)

(declare-fun e!215091 () Unit!20929)

(assert (=> b!299588 (= lt!435386 e!215091)))

(declare-fun c!13773 () Bool)

(declare-datatypes ((tuple4!994 0))(
  ( (tuple4!995 (_1!13152 (_ BitVec 32)) (_2!13152 (_ BitVec 32)) (_3!1454 (_ BitVec 32)) (_4!497 (_ BitVec 32))) )
))
(declare-fun lt!435387 () tuple4!994)

(assert (=> b!299588 (= c!13773 (bvslt (_1!13152 lt!435387) (_2!13152 lt!435387)))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!994)

(assert (=> b!299588 (= lt!435387 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(declare-fun lt!435389 () tuple4!994)

(assert (=> b!299588 (= lt!435389 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!299589 () Bool)

(declare-fun res!247206 () Bool)

(assert (=> b!299589 (=> (not res!247206) (not e!215090))))

(assert (=> b!299589 (= res!247206 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!435388) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!299590 () Bool)

(declare-fun res!247205 () Bool)

(assert (=> b!299590 (=> (not res!247205) (not e!215090))))

(declare-fun a2!948 () array!18180)

(declare-fun arrayBitRangesEq!0 (array!18180 array!18180 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!299590 (= res!247205 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!299591 () Bool)

(declare-fun Unit!20931 () Unit!20929)

(assert (=> b!299591 (= e!215091 Unit!20931)))

(declare-fun res!247208 () Bool)

(assert (=> start!66980 (=> (not res!247208) (not e!215092))))

(assert (=> start!66980 (= res!247208 (and (bvsle (size!7893 a1!948) (size!7893 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!66980 e!215092))

(assert (=> start!66980 true))

(declare-fun array_inv!7505 (array!18180) Bool)

(assert (=> start!66980 (array_inv!7505 a1!948)))

(assert (=> start!66980 (array_inv!7505 a2!948)))

(declare-fun b!299592 () Bool)

(declare-fun lt!435390 () Unit!20929)

(assert (=> b!299592 (= e!215091 lt!435390)))

(declare-fun arrayRangesEqSlicedLemma!165 (array!18180 array!18180 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20929)

(assert (=> b!299592 (= lt!435390 (arrayRangesEqSlicedLemma!165 a1!948 a2!948 (_1!13152 lt!435389) (_2!13152 lt!435389) (_1!13152 lt!435387) (_2!13152 lt!435387)))))

(declare-fun arrayRangesEq!1555 (array!18180 array!18180 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!299592 (arrayRangesEq!1555 a1!948 a2!948 (_1!13152 lt!435387) (_2!13152 lt!435387))))

(assert (= (and start!66980 res!247208) b!299587))

(assert (= (and b!299587 res!247207) b!299590))

(assert (= (and b!299590 res!247205) b!299589))

(assert (= (and b!299589 res!247206) b!299588))

(assert (= (and b!299588 c!13773) b!299592))

(assert (= (and b!299588 (not c!13773)) b!299591))

(declare-fun m!438719 () Bool)

(assert (=> b!299588 m!438719))

(declare-fun m!438721 () Bool)

(assert (=> b!299588 m!438721))

(declare-fun m!438723 () Bool)

(assert (=> b!299590 m!438723))

(declare-fun m!438725 () Bool)

(assert (=> start!66980 m!438725))

(declare-fun m!438727 () Bool)

(assert (=> start!66980 m!438727))

(declare-fun m!438729 () Bool)

(assert (=> b!299592 m!438729))

(declare-fun m!438731 () Bool)

(assert (=> b!299592 m!438731))

(push 1)

