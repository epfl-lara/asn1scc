; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66952 () Bool)

(assert start!66952)

(declare-fun b!299321 () Bool)

(declare-datatypes ((Unit!20887 0))(
  ( (Unit!20888) )
))
(declare-fun e!214877 () Unit!20887)

(declare-fun lt!435173 () Unit!20887)

(assert (=> b!299321 (= e!214877 lt!435173)))

(declare-datatypes ((array!18152 0))(
  ( (array!18153 (arr!8962 (Array (_ BitVec 32) (_ BitVec 8))) (size!7879 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18152)

(declare-fun a2!948 () array!18152)

(declare-datatypes ((tuple4!966 0))(
  ( (tuple4!967 (_1!13138 (_ BitVec 32)) (_2!13138 (_ BitVec 32)) (_3!1440 (_ BitVec 32)) (_4!483 (_ BitVec 32))) )
))
(declare-fun lt!435171 () tuple4!966)

(declare-fun lt!435170 () tuple4!966)

(declare-fun arrayRangesEqSlicedLemma!151 (array!18152 array!18152 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20887)

(assert (=> b!299321 (= lt!435173 (arrayRangesEqSlicedLemma!151 a1!948 a2!948 (_1!13138 lt!435170) (_2!13138 lt!435170) (_1!13138 lt!435171) (_2!13138 lt!435171)))))

(declare-fun arrayRangesEq!1541 (array!18152 array!18152 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!299321 (arrayRangesEq!1541 a1!948 a2!948 (_1!13138 lt!435171) (_2!13138 lt!435171))))

(declare-fun b!299322 () Bool)

(declare-fun res!247028 () Bool)

(declare-fun e!214876 () Bool)

(assert (=> b!299322 (=> (not res!247028) (not e!214876))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!18152 array!18152 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!299322 (= res!247028 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!299323 () Bool)

(declare-fun res!247026 () Bool)

(assert (=> b!299323 (=> (not res!247026) (not e!214876))))

(declare-fun lt!435174 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!299323 (= res!247026 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!435174) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!299324 () Bool)

(declare-fun Unit!20889 () Unit!20887)

(assert (=> b!299324 (= e!214877 Unit!20889)))

(declare-fun res!247025 () Bool)

(declare-fun e!214874 () Bool)

(assert (=> start!66952 (=> (not res!247025) (not e!214874))))

(assert (=> start!66952 (= res!247025 (and (bvsle (size!7879 a1!948) (size!7879 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!66952 e!214874))

(assert (=> start!66952 true))

(declare-fun array_inv!7491 (array!18152) Bool)

(assert (=> start!66952 (array_inv!7491 a1!948)))

(assert (=> start!66952 (array_inv!7491 a2!948)))

(declare-fun b!299325 () Bool)

(declare-fun res!247027 () Bool)

(declare-fun e!214873 () Bool)

(assert (=> b!299325 (=> (not res!247027) (not e!214873))))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!299325 (= res!247027 (byteRangesEq!0 (select (arr!8962 a1!948) (_3!1440 lt!435170)) (select (arr!8962 a2!948) (_3!1440 lt!435170)) ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111))))

(declare-fun b!299326 () Bool)

(assert (=> b!299326 (= e!214876 e!214873)))

(declare-fun res!247024 () Bool)

(assert (=> b!299326 (=> (not res!247024) (not e!214873))))

(assert (=> b!299326 (= res!247024 (not (= (_3!1440 lt!435170) (_4!483 lt!435170))))))

(declare-fun lt!435169 () Unit!20887)

(assert (=> b!299326 (= lt!435169 e!214877)))

(declare-fun c!13731 () Bool)

(assert (=> b!299326 (= c!13731 (bvslt (_1!13138 lt!435171) (_2!13138 lt!435171)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!966)

(assert (=> b!299326 (= lt!435171 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(declare-fun lt!435172 () (_ BitVec 32))

(assert (=> b!299326 (= lt!435172 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!299326 (= lt!435170 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!299327 () Bool)

(assert (=> b!299327 (= e!214873 (and (not (= lt!435172 #b00000000000000000000000000000000)) (or (bvsgt #b00000000000000000000000000000000 lt!435172) (bvsgt lt!435172 #b00000000000000000000000000001000))))))

(declare-fun b!299328 () Bool)

(assert (=> b!299328 (= e!214874 e!214876)))

(declare-fun res!247023 () Bool)

(assert (=> b!299328 (=> (not res!247023) (not e!214876))))

(assert (=> b!299328 (= res!247023 (and (bvsle toBit!258 lt!435174) (bvsle fromBit!258 lt!435174)))))

(assert (=> b!299328 (= lt!435174 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7879 a1!948))))))

(assert (= (and start!66952 res!247025) b!299328))

(assert (= (and b!299328 res!247023) b!299322))

(assert (= (and b!299322 res!247028) b!299323))

(assert (= (and b!299323 res!247026) b!299326))

(assert (= (and b!299326 c!13731) b!299321))

(assert (= (and b!299326 (not c!13731)) b!299324))

(assert (= (and b!299326 res!247024) b!299325))

(assert (= (and b!299325 res!247027) b!299327))

(declare-fun m!438505 () Bool)

(assert (=> start!66952 m!438505))

(declare-fun m!438507 () Bool)

(assert (=> start!66952 m!438507))

(declare-fun m!438509 () Bool)

(assert (=> b!299322 m!438509))

(declare-fun m!438511 () Bool)

(assert (=> b!299321 m!438511))

(declare-fun m!438513 () Bool)

(assert (=> b!299321 m!438513))

(declare-fun m!438515 () Bool)

(assert (=> b!299326 m!438515))

(declare-fun m!438517 () Bool)

(assert (=> b!299326 m!438517))

(declare-fun m!438519 () Bool)

(assert (=> b!299325 m!438519))

(declare-fun m!438521 () Bool)

(assert (=> b!299325 m!438521))

(assert (=> b!299325 m!438519))

(assert (=> b!299325 m!438521))

(declare-fun m!438523 () Bool)

(assert (=> b!299325 m!438523))

(push 1)

(assert (not b!299326))

(assert (not b!299321))

(assert (not b!299325))

(assert (not start!66952))

(assert (not b!299322))

(check-sat)

(pop 1)

(push 1)

(check-sat)

