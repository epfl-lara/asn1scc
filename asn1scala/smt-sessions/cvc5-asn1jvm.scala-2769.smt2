; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66976 () Bool)

(assert start!66976)

(declare-fun b!299551 () Bool)

(declare-fun e!215061 () Bool)

(assert (=> b!299551 (= e!215061 false)))

(declare-datatypes ((Unit!20923 0))(
  ( (Unit!20924) )
))
(declare-fun lt!435358 () Unit!20923)

(declare-fun e!215064 () Unit!20923)

(assert (=> b!299551 (= lt!435358 e!215064)))

(declare-fun c!13767 () Bool)

(declare-datatypes ((tuple4!990 0))(
  ( (tuple4!991 (_1!13150 (_ BitVec 32)) (_2!13150 (_ BitVec 32)) (_3!1452 (_ BitVec 32)) (_4!495 (_ BitVec 32))) )
))
(declare-fun lt!435359 () tuple4!990)

(assert (=> b!299551 (= c!13767 (bvslt (_1!13150 lt!435359) (_2!13150 lt!435359)))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!990)

(assert (=> b!299551 (= lt!435359 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(declare-fun lt!435360 () tuple4!990)

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(assert (=> b!299551 (= lt!435360 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!299552 () Bool)

(declare-fun res!247181 () Bool)

(assert (=> b!299552 (=> (not res!247181) (not e!215061))))

(declare-fun lt!435356 () (_ BitVec 64))

(assert (=> b!299552 (= res!247181 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!435356) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!299553 () Bool)

(declare-fun e!215062 () Bool)

(assert (=> b!299553 (= e!215062 e!215061)))

(declare-fun res!247182 () Bool)

(assert (=> b!299553 (=> (not res!247182) (not e!215061))))

(assert (=> b!299553 (= res!247182 (and (bvsle toBit!258 lt!435356) (bvsle fromBit!258 lt!435356)))))

(declare-datatypes ((array!18176 0))(
  ( (array!18177 (arr!8974 (Array (_ BitVec 32) (_ BitVec 8))) (size!7891 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18176)

(assert (=> b!299553 (= lt!435356 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7891 a1!948))))))

(declare-fun res!247183 () Bool)

(assert (=> start!66976 (=> (not res!247183) (not e!215062))))

(declare-fun a2!948 () array!18176)

(assert (=> start!66976 (= res!247183 (and (bvsle (size!7891 a1!948) (size!7891 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!66976 e!215062))

(assert (=> start!66976 true))

(declare-fun array_inv!7503 (array!18176) Bool)

(assert (=> start!66976 (array_inv!7503 a1!948)))

(assert (=> start!66976 (array_inv!7503 a2!948)))

(declare-fun b!299554 () Bool)

(declare-fun Unit!20925 () Unit!20923)

(assert (=> b!299554 (= e!215064 Unit!20925)))

(declare-fun b!299555 () Bool)

(declare-fun lt!435357 () Unit!20923)

(assert (=> b!299555 (= e!215064 lt!435357)))

(declare-fun arrayRangesEqSlicedLemma!163 (array!18176 array!18176 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20923)

(assert (=> b!299555 (= lt!435357 (arrayRangesEqSlicedLemma!163 a1!948 a2!948 (_1!13150 lt!435360) (_2!13150 lt!435360) (_1!13150 lt!435359) (_2!13150 lt!435359)))))

(declare-fun arrayRangesEq!1553 (array!18176 array!18176 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!299555 (arrayRangesEq!1553 a1!948 a2!948 (_1!13150 lt!435359) (_2!13150 lt!435359))))

(declare-fun b!299556 () Bool)

(declare-fun res!247184 () Bool)

(assert (=> b!299556 (=> (not res!247184) (not e!215061))))

(declare-fun arrayBitRangesEq!0 (array!18176 array!18176 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!299556 (= res!247184 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(assert (= (and start!66976 res!247183) b!299553))

(assert (= (and b!299553 res!247182) b!299556))

(assert (= (and b!299556 res!247184) b!299552))

(assert (= (and b!299552 res!247181) b!299551))

(assert (= (and b!299551 c!13767) b!299555))

(assert (= (and b!299551 (not c!13767)) b!299554))

(declare-fun m!438691 () Bool)

(assert (=> b!299551 m!438691))

(declare-fun m!438693 () Bool)

(assert (=> b!299551 m!438693))

(declare-fun m!438695 () Bool)

(assert (=> start!66976 m!438695))

(declare-fun m!438697 () Bool)

(assert (=> start!66976 m!438697))

(declare-fun m!438699 () Bool)

(assert (=> b!299555 m!438699))

(declare-fun m!438701 () Bool)

(assert (=> b!299555 m!438701))

(declare-fun m!438703 () Bool)

(assert (=> b!299556 m!438703))

(push 1)

(assert (not start!66976))

(assert (not b!299555))

(assert (not b!299551))

(assert (not b!299556))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

