; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66968 () Bool)

(assert start!66968)

(declare-fun res!247136 () Bool)

(declare-fun e!215002 () Bool)

(assert (=> start!66968 (=> (not res!247136) (not e!215002))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18168 0))(
  ( (array!18169 (arr!8970 (Array (_ BitVec 32) (_ BitVec 8))) (size!7887 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18168)

(declare-fun a2!948 () array!18168)

(assert (=> start!66968 (= res!247136 (and (bvsle (size!7887 a1!948) (size!7887 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!66968 e!215002))

(assert (=> start!66968 true))

(declare-fun array_inv!7499 (array!18168) Bool)

(assert (=> start!66968 (array_inv!7499 a1!948)))

(assert (=> start!66968 (array_inv!7499 a2!948)))

(declare-fun b!299479 () Bool)

(declare-datatypes ((Unit!20911 0))(
  ( (Unit!20912) )
))
(declare-fun e!215004 () Unit!20911)

(declare-fun lt!435296 () Unit!20911)

(assert (=> b!299479 (= e!215004 lt!435296)))

(declare-datatypes ((tuple4!982 0))(
  ( (tuple4!983 (_1!13146 (_ BitVec 32)) (_2!13146 (_ BitVec 32)) (_3!1448 (_ BitVec 32)) (_4!491 (_ BitVec 32))) )
))
(declare-fun lt!435298 () tuple4!982)

(declare-fun lt!435300 () tuple4!982)

(declare-fun arrayRangesEqSlicedLemma!159 (array!18168 array!18168 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20911)

(assert (=> b!299479 (= lt!435296 (arrayRangesEqSlicedLemma!159 a1!948 a2!948 (_1!13146 lt!435300) (_2!13146 lt!435300) (_1!13146 lt!435298) (_2!13146 lt!435298)))))

(declare-fun arrayRangesEq!1549 (array!18168 array!18168 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!299479 (arrayRangesEq!1549 a1!948 a2!948 (_1!13146 lt!435298) (_2!13146 lt!435298))))

(declare-fun b!299480 () Bool)

(declare-fun e!215003 () Bool)

(assert (=> b!299480 (= e!215002 e!215003)))

(declare-fun res!247134 () Bool)

(assert (=> b!299480 (=> (not res!247134) (not e!215003))))

(declare-fun lt!435299 () (_ BitVec 64))

(assert (=> b!299480 (= res!247134 (and (bvsle toBit!258 lt!435299) (bvsle fromBit!258 lt!435299)))))

(assert (=> b!299480 (= lt!435299 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7887 a1!948))))))

(declare-fun b!299481 () Bool)

(declare-fun Unit!20913 () Unit!20911)

(assert (=> b!299481 (= e!215004 Unit!20913)))

(declare-fun b!299482 () Bool)

(declare-fun res!247135 () Bool)

(assert (=> b!299482 (=> (not res!247135) (not e!215003))))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!299482 (= res!247135 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!435299) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!299483 () Bool)

(assert (=> b!299483 (= e!215003 false)))

(declare-fun lt!435297 () Unit!20911)

(assert (=> b!299483 (= lt!435297 e!215004)))

(declare-fun c!13755 () Bool)

(assert (=> b!299483 (= c!13755 (bvslt (_1!13146 lt!435298) (_2!13146 lt!435298)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!982)

(assert (=> b!299483 (= lt!435298 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!299483 (= lt!435300 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!299484 () Bool)

(declare-fun res!247133 () Bool)

(assert (=> b!299484 (=> (not res!247133) (not e!215003))))

(declare-fun arrayBitRangesEq!0 (array!18168 array!18168 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!299484 (= res!247133 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(assert (= (and start!66968 res!247136) b!299480))

(assert (= (and b!299480 res!247134) b!299484))

(assert (= (and b!299484 res!247133) b!299482))

(assert (= (and b!299482 res!247135) b!299483))

(assert (= (and b!299483 c!13755) b!299479))

(assert (= (and b!299483 (not c!13755)) b!299481))

(declare-fun m!438635 () Bool)

(assert (=> start!66968 m!438635))

(declare-fun m!438637 () Bool)

(assert (=> start!66968 m!438637))

(declare-fun m!438639 () Bool)

(assert (=> b!299479 m!438639))

(declare-fun m!438641 () Bool)

(assert (=> b!299479 m!438641))

(declare-fun m!438643 () Bool)

(assert (=> b!299483 m!438643))

(declare-fun m!438645 () Bool)

(assert (=> b!299483 m!438645))

(declare-fun m!438647 () Bool)

(assert (=> b!299484 m!438647))

(push 1)

