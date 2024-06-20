; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62586 () Bool)

(assert start!62586)

(declare-fun b!280409 () Bool)

(declare-datatypes ((Unit!19665 0))(
  ( (Unit!19666) )
))
(declare-fun e!200053 () Unit!19665)

(declare-fun Unit!19667 () Unit!19665)

(assert (=> b!280409 (= e!200053 Unit!19667)))

(declare-fun res!232742 () Bool)

(declare-fun e!200055 () Bool)

(assert (=> start!62586 (=> (not res!232742) (not e!200055))))

(declare-datatypes ((array!16192 0))(
  ( (array!16193 (arr!7996 (Array (_ BitVec 32) (_ BitVec 8))) (size!7000 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16192)

(declare-fun a2!699 () array!16192)

(declare-fun to!789 () (_ BitVec 64))

(declare-fun from!822 () (_ BitVec 64))

(assert (=> start!62586 (= res!232742 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!7000 a1!699) (size!7000 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7000 a1!699))))))))

(assert (=> start!62586 e!200055))

(assert (=> start!62586 true))

(declare-fun array_inv!6724 (array!16192) Bool)

(assert (=> start!62586 (array_inv!6724 a1!699)))

(assert (=> start!62586 (array_inv!6724 a2!699)))

(declare-fun b!280410 () Bool)

(declare-fun e!200054 () Bool)

(assert (=> b!280410 (= e!200055 e!200054)))

(declare-fun res!232743 () Bool)

(assert (=> b!280410 (=> (not res!232743) (not e!200054))))

(declare-datatypes ((tuple4!750 0))(
  ( (tuple4!751 (_1!12450 (_ BitVec 32)) (_2!12450 (_ BitVec 32)) (_3!1155 (_ BitVec 32)) (_4!375 (_ BitVec 32))) )
))
(declare-fun lt!416847 () tuple4!750)

(assert (=> b!280410 (= res!232743 (not (= (_3!1155 lt!416847) (_4!375 lt!416847))))))

(declare-fun lt!416846 () Unit!19665)

(assert (=> b!280410 (= lt!416846 e!200053)))

(declare-fun c!13005 () Bool)

(assert (=> b!280410 (= c!13005 (bvslt (_1!12450 lt!416847) (_2!12450 lt!416847)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!750)

(assert (=> b!280410 (= lt!416847 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!280411 () Bool)

(declare-fun res!232744 () Bool)

(assert (=> b!280411 (=> (not res!232744) (not e!200055))))

(assert (=> b!280411 (= res!232744 (bvslt from!822 to!789))))

(declare-fun b!280412 () Bool)

(declare-fun res!232745 () Bool)

(assert (=> b!280412 (=> (not res!232745) (not e!200055))))

(declare-fun arrayBitRangesEq!0 (array!16192 array!16192 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!280412 (= res!232745 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!280413 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!280413 (= e!200054 (not (byteRangesEq!0 (select (arr!7996 a1!699) (_3!1155 lt!416847)) (select (arr!7996 a2!699) (_3!1155 lt!416847)) ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000)))))

(declare-fun b!280414 () Bool)

(declare-fun Unit!19668 () Unit!19665)

(assert (=> b!280414 (= e!200053 Unit!19668)))

(declare-fun arrayRangesEq!1268 (array!16192 array!16192 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!280414 (arrayRangesEq!1268 a1!699 a2!699 (_1!12450 lt!416847) (_2!12450 lt!416847))))

(declare-fun lt!416845 () Unit!19665)

(declare-fun arrayRangesEqSymmetricLemma!175 (array!16192 array!16192 (_ BitVec 32) (_ BitVec 32)) Unit!19665)

(assert (=> b!280414 (= lt!416845 (arrayRangesEqSymmetricLemma!175 a1!699 a2!699 (_1!12450 lt!416847) (_2!12450 lt!416847)))))

(assert (=> b!280414 (arrayRangesEq!1268 a2!699 a1!699 (_1!12450 lt!416847) (_2!12450 lt!416847))))

(assert (= (and start!62586 res!232742) b!280412))

(assert (= (and b!280412 res!232745) b!280411))

(assert (= (and b!280411 res!232744) b!280410))

(assert (= (and b!280410 c!13005) b!280414))

(assert (= (and b!280410 (not c!13005)) b!280409))

(assert (= (and b!280410 res!232743) b!280413))

(declare-fun m!413415 () Bool)

(assert (=> b!280414 m!413415))

(declare-fun m!413417 () Bool)

(assert (=> b!280414 m!413417))

(declare-fun m!413419 () Bool)

(assert (=> b!280414 m!413419))

(declare-fun m!413421 () Bool)

(assert (=> start!62586 m!413421))

(declare-fun m!413423 () Bool)

(assert (=> start!62586 m!413423))

(declare-fun m!413425 () Bool)

(assert (=> b!280412 m!413425))

(declare-fun m!413427 () Bool)

(assert (=> b!280410 m!413427))

(declare-fun m!413429 () Bool)

(assert (=> b!280413 m!413429))

(declare-fun m!413431 () Bool)

(assert (=> b!280413 m!413431))

(assert (=> b!280413 m!413429))

(assert (=> b!280413 m!413431))

(declare-fun m!413433 () Bool)

(assert (=> b!280413 m!413433))

(push 1)

(assert (not b!280412))

(assert (not b!280414))

(assert (not start!62586))

(assert (not b!280413))

(assert (not b!280410))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!96446 () Bool)

(declare-fun res!232789 () Bool)

(declare-fun e!200108 () Bool)

(assert (=> d!96446 (=> res!232789 e!200108)))

(assert (=> d!96446 (= res!232789 (= (_1!12450 lt!416847) (_2!12450 lt!416847)))))

(assert (=> d!96446 (= (arrayRangesEq!1268 a1!699 a2!699 (_1!12450 lt!416847) (_2!12450 lt!416847)) e!200108)))

(declare-fun b!280476 () Bool)

(declare-fun e!200109 () Bool)

(assert (=> b!280476 (= e!200108 e!200109)))

(declare-fun res!232790 () Bool)

(assert (=> b!280476 (=> (not res!232790) (not e!200109))))

(assert (=> b!280476 (= res!232790 (= (select (arr!7996 a1!699) (_1!12450 lt!416847)) (select (arr!7996 a2!699) (_1!12450 lt!416847))))))

(declare-fun b!280477 () Bool)

(assert (=> b!280477 (= e!200109 (arrayRangesEq!1268 a1!699 a2!699 (bvadd (_1!12450 lt!416847) #b00000000000000000000000000000001) (_2!12450 lt!416847)))))

(assert (= (and d!96446 (not res!232789)) b!280476))

(assert (= (and b!280476 res!232790) b!280477))

(declare-fun m!413489 () Bool)

(assert (=> b!280476 m!413489))

(declare-fun m!413491 () Bool)

(assert (=> b!280476 m!413491))

(declare-fun m!413493 () Bool)

(assert (=> b!280477 m!413493))

(assert (=> b!280414 d!96446))

(declare-fun d!96454 () Bool)

(assert (=> d!96454 (arrayRangesEq!1268 a2!699 a1!699 (_1!12450 lt!416847) (_2!12450 lt!416847))))

(declare-fun lt!416877 () Unit!19665)

(declare-fun choose!483 (array!16192 array!16192 (_ BitVec 32) (_ BitVec 32)) Unit!19665)

(assert (=> d!96454 (= lt!416877 (choose!483 a1!699 a2!699 (_1!12450 lt!416847) (_2!12450 lt!416847)))))

(assert (=> d!96454 (and (bvsle #b00000000000000000000000000000000 (_1!12450 lt!416847)) (bvsle (_1!12450 lt!416847) (_2!12450 lt!416847)) (bvsle (_2!12450 lt!416847) (size!7000 a1!699)))))

(assert (=> d!96454 (= (arrayRangesEqSymmetricLemma!175 a1!699 a2!699 (_1!12450 lt!416847) (_2!12450 lt!416847)) lt!416877)))

(declare-fun bs!24314 () Bool)

(assert (= bs!24314 d!96454))

(assert (=> bs!24314 m!413419))

(declare-fun m!413495 () Bool)

(assert (=> bs!24314 m!413495))

(assert (=> b!280414 d!96454))

(declare-fun d!96458 () Bool)

(declare-fun res!232791 () Bool)

(declare-fun e!200110 () Bool)

(assert (=> d!96458 (=> res!232791 e!200110)))

(assert (=> d!96458 (= res!232791 (= (_1!12450 lt!416847) (_2!12450 lt!416847)))))

(assert (=> d!96458 (= (arrayRangesEq!1268 a2!699 a1!699 (_1!12450 lt!416847) (_2!12450 lt!416847)) e!200110)))

(declare-fun b!280478 () Bool)

(declare-fun e!200111 () Bool)

(assert (=> b!280478 (= e!200110 e!200111)))

(declare-fun res!232792 () Bool)

(assert (=> b!280478 (=> (not res!232792) (not e!200111))))

(assert (=> b!280478 (= res!232792 (= (select (arr!7996 a2!699) (_1!12450 lt!416847)) (select (arr!7996 a1!699) (_1!12450 lt!416847))))))

(declare-fun b!280479 () Bool)

(assert (=> b!280479 (= e!200111 (arrayRangesEq!1268 a2!699 a1!699 (bvadd (_1!12450 lt!416847) #b00000000000000000000000000000001) (_2!12450 lt!416847)))))

