; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73726 () Bool)

(assert start!73726)

(declare-fun res!267897 () Bool)

(declare-fun e!235447 () Bool)

(assert (=> start!73726 (=> (not res!267897) (not e!235447))))

(declare-datatypes ((array!21173 0))(
  ( (array!21174 (arr!10282 (Array (_ BitVec 32) (_ BitVec 8))) (size!9190 (_ BitVec 32))) )
))
(declare-fun a1!688 () array!21173)

(declare-fun fromBit!81 () (_ BitVec 64))

(declare-fun toBit!81 () (_ BitVec 64))

(declare-fun a2!688 () array!21173)

(assert (=> start!73726 (= res!267897 (and (bvsle (size!9190 a1!688) (size!9190 a2!688)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!81) (bvsle fromBit!81 toBit!81) (bvsle toBit!81 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9190 a1!688)))) (bvslt fromBit!81 toBit!81)))))

(assert (=> start!73726 e!235447))

(declare-fun array_inv!8742 (array!21173) Bool)

(assert (=> start!73726 (array_inv!8742 a1!688)))

(assert (=> start!73726 (array_inv!8742 a2!688)))

(assert (=> start!73726 true))

(declare-fun b!326323 () Bool)

(declare-fun e!235450 () Bool)

(assert (=> b!326323 (= e!235447 e!235450)))

(declare-fun res!267895 () Bool)

(assert (=> b!326323 (=> (not res!267895) (not e!235450))))

(declare-fun e!235448 () Bool)

(assert (=> b!326323 (= res!267895 e!235448)))

(declare-fun res!267896 () Bool)

(assert (=> b!326323 (=> res!267896 e!235448)))

(declare-datatypes ((tuple4!1362 0))(
  ( (tuple4!1363 (_1!13522 (_ BitVec 32)) (_2!13522 (_ BitVec 32)) (_3!1638 (_ BitVec 32)) (_4!681 (_ BitVec 32))) )
))
(declare-fun lt!448512 () tuple4!1362)

(assert (=> b!326323 (= res!267896 (bvsge (_1!13522 lt!448512) (_2!13522 lt!448512)))))

(declare-fun lt!448514 () (_ BitVec 32))

(assert (=> b!326323 (= lt!448514 ((_ extract 31 0) (bvsrem toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!448513 () (_ BitVec 32))

(assert (=> b!326323 (= lt!448513 ((_ extract 31 0) (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1362)

(assert (=> b!326323 (= lt!448512 (arrayBitIndices!0 fromBit!81 toBit!81))))

(declare-fun b!326324 () Bool)

(declare-fun arrayRangesEq!1829 (array!21173 array!21173 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!326324 (= e!235448 (arrayRangesEq!1829 a1!688 a2!688 (_1!13522 lt!448512) (_2!13522 lt!448512)))))

(declare-fun b!326325 () Bool)

(assert (=> b!326325 (= e!235450 (and (= (_3!1638 lt!448512) (_4!681 lt!448512)) (or (bvsgt #b00000000000000000000000000000000 lt!448513) (bvsgt lt!448513 lt!448514) (bvsgt lt!448514 #b00000000000000000000000000001000))))))

(assert (= (and start!73726 res!267897) b!326323))

(assert (= (and b!326323 (not res!267896)) b!326324))

(assert (= (and b!326323 res!267895) b!326325))

(declare-fun m!464111 () Bool)

(assert (=> start!73726 m!464111))

(declare-fun m!464113 () Bool)

(assert (=> start!73726 m!464113))

(declare-fun m!464115 () Bool)

(assert (=> b!326323 m!464115))

(declare-fun m!464117 () Bool)

(assert (=> b!326324 m!464117))

(push 1)

(assert (not start!73726))

(assert (not b!326323))

(assert (not b!326324))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107606 () Bool)

(assert (=> d!107606 (= (array_inv!8742 a1!688) (bvsge (size!9190 a1!688) #b00000000000000000000000000000000))))

(assert (=> start!73726 d!107606))

(declare-fun d!107608 () Bool)

(assert (=> d!107608 (= (array_inv!8742 a2!688) (bvsge (size!9190 a2!688) #b00000000000000000000000000000000))))

(assert (=> start!73726 d!107608))

(declare-fun d!107610 () Bool)

(assert (=> d!107610 (= (arrayBitIndices!0 fromBit!81 toBit!81) (tuple4!1363 ((_ extract 31 0) (bvadd (bvsdiv fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!81 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!81 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!326323 d!107610))

(declare-fun d!107612 () Bool)

(declare-fun res!267926 () Bool)

(declare-fun e!235492 () Bool)

(assert (=> d!107612 (=> res!267926 e!235492)))

(assert (=> d!107612 (= res!267926 (= (_1!13522 lt!448512) (_2!13522 lt!448512)))))

(assert (=> d!107612 (= (arrayRangesEq!1829 a1!688 a2!688 (_1!13522 lt!448512) (_2!13522 lt!448512)) e!235492)))

(declare-fun b!326354 () Bool)

(declare-fun e!235493 () Bool)

(assert (=> b!326354 (= e!235492 e!235493)))

(declare-fun res!267927 () Bool)

(assert (=> b!326354 (=> (not res!267927) (not e!235493))))

(assert (=> b!326354 (= res!267927 (= (select (arr!10282 a1!688) (_1!13522 lt!448512)) (select (arr!10282 a2!688) (_1!13522 lt!448512))))))

(declare-fun b!326355 () Bool)

(assert (=> b!326355 (= e!235493 (arrayRangesEq!1829 a1!688 a2!688 (bvadd (_1!13522 lt!448512) #b00000000000000000000000000000001) (_2!13522 lt!448512)))))

(assert (= (and d!107612 (not res!267926)) b!326354))

(assert (= (and b!326354 res!267927) b!326355))

(declare-fun m!464141 () Bool)

(assert (=> b!326354 m!464141))

(declare-fun m!464143 () Bool)

(assert (=> b!326354 m!464143))

(declare-fun m!464145 () Bool)

(assert (=> b!326355 m!464145))

(assert (=> b!326324 d!107612))

(push 1)

(assert (not b!326355))

(check-sat)

