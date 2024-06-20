; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66962 () Bool)

(assert start!66962)

(declare-fun b!299425 () Bool)

(declare-fun res!247097 () Bool)

(declare-fun e!214959 () Bool)

(assert (=> b!299425 (=> (not res!247097) (not e!214959))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18162 0))(
  ( (array!18163 (arr!8967 (Array (_ BitVec 32) (_ BitVec 8))) (size!7884 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18162)

(declare-fun a2!948 () array!18162)

(declare-fun arrayBitRangesEq!0 (array!18162 array!18162 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!299425 (= res!247097 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!299426 () Bool)

(declare-fun e!214958 () Bool)

(assert (=> b!299426 (= e!214958 e!214959)))

(declare-fun res!247099 () Bool)

(assert (=> b!299426 (=> (not res!247099) (not e!214959))))

(declare-fun lt!435252 () (_ BitVec 64))

(assert (=> b!299426 (= res!247099 (and (bvsle toBit!258 lt!435252) (bvsle fromBit!258 lt!435252)))))

(assert (=> b!299426 (= lt!435252 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7884 a1!948))))))

(declare-fun b!299427 () Bool)

(declare-fun res!247098 () Bool)

(assert (=> b!299427 (=> (not res!247098) (not e!214959))))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!299427 (= res!247098 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!435252) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!299428 () Bool)

(declare-datatypes ((Unit!20902 0))(
  ( (Unit!20903) )
))
(declare-fun e!214957 () Unit!20902)

(declare-fun Unit!20904 () Unit!20902)

(assert (=> b!299428 (= e!214957 Unit!20904)))

(declare-fun b!299429 () Bool)

(assert (=> b!299429 (= e!214959 false)))

(declare-fun lt!435251 () Unit!20902)

(assert (=> b!299429 (= lt!435251 e!214957)))

(declare-fun c!13746 () Bool)

(declare-datatypes ((tuple4!976 0))(
  ( (tuple4!977 (_1!13143 (_ BitVec 32)) (_2!13143 (_ BitVec 32)) (_3!1445 (_ BitVec 32)) (_4!488 (_ BitVec 32))) )
))
(declare-fun lt!435255 () tuple4!976)

(assert (=> b!299429 (= c!13746 (bvslt (_1!13143 lt!435255) (_2!13143 lt!435255)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!976)

(assert (=> b!299429 (= lt!435255 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(declare-fun lt!435254 () tuple4!976)

(assert (=> b!299429 (= lt!435254 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!299430 () Bool)

(declare-fun lt!435253 () Unit!20902)

(assert (=> b!299430 (= e!214957 lt!435253)))

(declare-fun arrayRangesEqSlicedLemma!156 (array!18162 array!18162 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20902)

(assert (=> b!299430 (= lt!435253 (arrayRangesEqSlicedLemma!156 a1!948 a2!948 (_1!13143 lt!435254) (_2!13143 lt!435254) (_1!13143 lt!435255) (_2!13143 lt!435255)))))

(declare-fun arrayRangesEq!1546 (array!18162 array!18162 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!299430 (arrayRangesEq!1546 a1!948 a2!948 (_1!13143 lt!435255) (_2!13143 lt!435255))))

(declare-fun res!247100 () Bool)

(assert (=> start!66962 (=> (not res!247100) (not e!214958))))

(assert (=> start!66962 (= res!247100 (and (bvsle (size!7884 a1!948) (size!7884 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!66962 e!214958))

(assert (=> start!66962 true))

(declare-fun array_inv!7496 (array!18162) Bool)

(assert (=> start!66962 (array_inv!7496 a1!948)))

(assert (=> start!66962 (array_inv!7496 a2!948)))

(assert (= (and start!66962 res!247100) b!299426))

(assert (= (and b!299426 res!247099) b!299425))

(assert (= (and b!299425 res!247097) b!299427))

(assert (= (and b!299427 res!247098) b!299429))

(assert (= (and b!299429 c!13746) b!299430))

(assert (= (and b!299429 (not c!13746)) b!299428))

(declare-fun m!438593 () Bool)

(assert (=> b!299425 m!438593))

(declare-fun m!438595 () Bool)

(assert (=> b!299429 m!438595))

(declare-fun m!438597 () Bool)

(assert (=> b!299429 m!438597))

(declare-fun m!438599 () Bool)

(assert (=> b!299430 m!438599))

(declare-fun m!438601 () Bool)

(assert (=> b!299430 m!438601))

(declare-fun m!438603 () Bool)

(assert (=> start!66962 m!438603))

(declare-fun m!438605 () Bool)

(assert (=> start!66962 m!438605))

(push 1)

