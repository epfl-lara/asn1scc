; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66964 () Bool)

(assert start!66964)

(declare-fun b!299443 () Bool)

(declare-fun e!214971 () Bool)

(declare-fun e!214970 () Bool)

(assert (=> b!299443 (= e!214971 e!214970)))

(declare-fun res!247111 () Bool)

(assert (=> b!299443 (=> (not res!247111) (not e!214970))))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!435269 () (_ BitVec 64))

(declare-fun fromBit!258 () (_ BitVec 64))

(assert (=> b!299443 (= res!247111 (and (bvsle toBit!258 lt!435269) (bvsle fromBit!258 lt!435269)))))

(declare-datatypes ((array!18164 0))(
  ( (array!18165 (arr!8968 (Array (_ BitVec 32) (_ BitVec 8))) (size!7885 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18164)

(assert (=> b!299443 (= lt!435269 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7885 a1!948))))))

(declare-fun b!299444 () Bool)

(declare-datatypes ((Unit!20905 0))(
  ( (Unit!20906) )
))
(declare-fun e!214972 () Unit!20905)

(declare-fun Unit!20907 () Unit!20905)

(assert (=> b!299444 (= e!214972 Unit!20907)))

(declare-fun res!247112 () Bool)

(assert (=> start!66964 (=> (not res!247112) (not e!214971))))

(declare-fun a2!948 () array!18164)

(assert (=> start!66964 (= res!247112 (and (bvsle (size!7885 a1!948) (size!7885 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!66964 e!214971))

(assert (=> start!66964 true))

(declare-fun array_inv!7497 (array!18164) Bool)

(assert (=> start!66964 (array_inv!7497 a1!948)))

(assert (=> start!66964 (array_inv!7497 a2!948)))

(declare-fun b!299445 () Bool)

(declare-fun res!247109 () Bool)

(assert (=> b!299445 (=> (not res!247109) (not e!214970))))

(declare-fun arrayBitRangesEq!0 (array!18164 array!18164 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!299445 (= res!247109 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!299446 () Bool)

(declare-fun lt!435267 () Unit!20905)

(assert (=> b!299446 (= e!214972 lt!435267)))

(declare-datatypes ((tuple4!978 0))(
  ( (tuple4!979 (_1!13144 (_ BitVec 32)) (_2!13144 (_ BitVec 32)) (_3!1446 (_ BitVec 32)) (_4!489 (_ BitVec 32))) )
))
(declare-fun lt!435266 () tuple4!978)

(declare-fun lt!435268 () tuple4!978)

(declare-fun arrayRangesEqSlicedLemma!157 (array!18164 array!18164 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20905)

(assert (=> b!299446 (= lt!435267 (arrayRangesEqSlicedLemma!157 a1!948 a2!948 (_1!13144 lt!435268) (_2!13144 lt!435268) (_1!13144 lt!435266) (_2!13144 lt!435266)))))

(declare-fun arrayRangesEq!1547 (array!18164 array!18164 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!299446 (arrayRangesEq!1547 a1!948 a2!948 (_1!13144 lt!435266) (_2!13144 lt!435266))))

(declare-fun b!299447 () Bool)

(declare-fun res!247110 () Bool)

(assert (=> b!299447 (=> (not res!247110) (not e!214970))))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!299447 (= res!247110 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!435269) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!299448 () Bool)

(assert (=> b!299448 (= e!214970 false)))

(declare-fun lt!435270 () Unit!20905)

(assert (=> b!299448 (= lt!435270 e!214972)))

(declare-fun c!13749 () Bool)

(assert (=> b!299448 (= c!13749 (bvslt (_1!13144 lt!435266) (_2!13144 lt!435266)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!978)

(assert (=> b!299448 (= lt!435266 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!299448 (= lt!435268 (arrayBitIndices!0 fromBit!258 toBit!258))))

(assert (= (and start!66964 res!247112) b!299443))

(assert (= (and b!299443 res!247111) b!299445))

(assert (= (and b!299445 res!247109) b!299447))

(assert (= (and b!299447 res!247110) b!299448))

(assert (= (and b!299448 c!13749) b!299446))

(assert (= (and b!299448 (not c!13749)) b!299444))

(declare-fun m!438607 () Bool)

(assert (=> start!66964 m!438607))

(declare-fun m!438609 () Bool)

(assert (=> start!66964 m!438609))

(declare-fun m!438611 () Bool)

(assert (=> b!299445 m!438611))

(declare-fun m!438613 () Bool)

(assert (=> b!299446 m!438613))

(declare-fun m!438615 () Bool)

(assert (=> b!299446 m!438615))

(declare-fun m!438617 () Bool)

(assert (=> b!299448 m!438617))

(declare-fun m!438619 () Bool)

(assert (=> b!299448 m!438619))

(push 1)

(assert (not b!299445))

(assert (not b!299448))

(assert (not start!66964))

(assert (not b!299446))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

