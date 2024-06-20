; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62106 () Bool)

(assert start!62106)

(declare-fun b!278590 () Bool)

(declare-fun res!231327 () Bool)

(declare-fun e!198375 () Bool)

(assert (=> b!278590 (=> (not res!231327) (not e!198375))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!278590 (= res!231327 (bvslt from!822 to!789))))

(declare-fun res!231328 () Bool)

(assert (=> start!62106 (=> (not res!231328) (not e!198375))))

(declare-datatypes ((array!16027 0))(
  ( (array!16028 (arr!7930 (Array (_ BitVec 32) (_ BitVec 8))) (size!6934 (_ BitVec 32))) )
))
(declare-fun a2!699 () array!16027)

(declare-fun a1!699 () array!16027)

(assert (=> start!62106 (= res!231328 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6934 a1!699) (size!6934 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6934 a1!699))))))))

(assert (=> start!62106 e!198375))

(assert (=> start!62106 true))

(declare-fun array_inv!6658 (array!16027) Bool)

(assert (=> start!62106 (array_inv!6658 a1!699)))

(assert (=> start!62106 (array_inv!6658 a2!699)))

(declare-fun b!278591 () Bool)

(declare-datatypes ((Unit!19527 0))(
  ( (Unit!19528) )
))
(declare-fun e!198371 () Unit!19527)

(declare-fun Unit!19529 () Unit!19527)

(assert (=> b!278591 (= e!198371 Unit!19529)))

(declare-datatypes ((tuple4!654 0))(
  ( (tuple4!655 (_1!12402 (_ BitVec 32)) (_2!12402 (_ BitVec 32)) (_3!1107 (_ BitVec 32)) (_4!327 (_ BitVec 32))) )
))
(declare-fun lt!416057 () tuple4!654)

(declare-fun lt!416056 () (_ BitVec 32))

(declare-fun e!198374 () Bool)

(declare-fun b!278592 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278592 (= e!198374 (byteRangesEq!0 (select (arr!7930 a2!699) (_3!1107 lt!416057)) (select (arr!7930 a1!699) (_3!1107 lt!416057)) lt!416056 #b00000000000000000000000000001000))))

(declare-fun b!278593 () Bool)

(declare-fun e!198373 () Bool)

(assert (=> b!278593 (= e!198375 e!198373)))

(declare-fun res!231329 () Bool)

(assert (=> b!278593 (=> (not res!231329) (not e!198373))))

(assert (=> b!278593 (= res!231329 (not (= (_3!1107 lt!416057) (_4!327 lt!416057))))))

(declare-fun lt!416058 () Unit!19527)

(assert (=> b!278593 (= lt!416058 e!198371)))

(declare-fun c!12804 () Bool)

(assert (=> b!278593 (= c!12804 (bvslt (_1!12402 lt!416057) (_2!12402 lt!416057)))))

(assert (=> b!278593 (= lt!416056 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!654)

(assert (=> b!278593 (= lt!416057 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!278594 () Bool)

(declare-fun res!231325 () Bool)

(assert (=> b!278594 (=> (not res!231325) (not e!198375))))

(declare-fun arrayBitRangesEq!0 (array!16027 array!16027 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!278594 (= res!231325 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!278595 () Bool)

(declare-fun Unit!19530 () Unit!19527)

(assert (=> b!278595 (= e!198371 Unit!19530)))

(declare-fun arrayRangesEq!1220 (array!16027 array!16027 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278595 (arrayRangesEq!1220 a1!699 a2!699 (_1!12402 lt!416057) (_2!12402 lt!416057))))

(declare-fun lt!416055 () Unit!19527)

(declare-fun arrayRangesEqSymmetricLemma!139 (array!16027 array!16027 (_ BitVec 32) (_ BitVec 32)) Unit!19527)

(assert (=> b!278595 (= lt!416055 (arrayRangesEqSymmetricLemma!139 a1!699 a2!699 (_1!12402 lt!416057) (_2!12402 lt!416057)))))

(assert (=> b!278595 (arrayRangesEq!1220 a2!699 a1!699 (_1!12402 lt!416057) (_2!12402 lt!416057))))

(declare-fun b!278596 () Bool)

(assert (=> b!278596 (= e!198373 (not (or (not (= ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000)) (bvsle (size!6934 a2!699) (size!6934 a1!699)))))))

(assert (=> b!278596 e!198374))

(declare-fun res!231326 () Bool)

(assert (=> b!278596 (=> (not res!231326) (not e!198374))))

(assert (=> b!278596 (= res!231326 (byteRangesEq!0 (select (arr!7930 a1!699) (_3!1107 lt!416057)) (select (arr!7930 a2!699) (_3!1107 lt!416057)) lt!416056 #b00000000000000000000000000001000))))

(assert (= (and start!62106 res!231328) b!278594))

(assert (= (and b!278594 res!231325) b!278590))

(assert (= (and b!278590 res!231327) b!278593))

(assert (= (and b!278593 c!12804) b!278595))

(assert (= (and b!278593 (not c!12804)) b!278591))

(assert (= (and b!278593 res!231329) b!278596))

(assert (= (and b!278596 res!231326) b!278592))

(declare-fun m!411691 () Bool)

(assert (=> b!278596 m!411691))

(declare-fun m!411693 () Bool)

(assert (=> b!278596 m!411693))

(assert (=> b!278596 m!411691))

(assert (=> b!278596 m!411693))

(declare-fun m!411695 () Bool)

(assert (=> b!278596 m!411695))

(declare-fun m!411697 () Bool)

(assert (=> b!278595 m!411697))

(declare-fun m!411699 () Bool)

(assert (=> b!278595 m!411699))

(declare-fun m!411701 () Bool)

(assert (=> b!278595 m!411701))

(assert (=> b!278592 m!411693))

(assert (=> b!278592 m!411691))

(assert (=> b!278592 m!411693))

(assert (=> b!278592 m!411691))

(declare-fun m!411703 () Bool)

(assert (=> b!278592 m!411703))

(declare-fun m!411705 () Bool)

(assert (=> b!278593 m!411705))

(declare-fun m!411707 () Bool)

(assert (=> b!278594 m!411707))

(declare-fun m!411709 () Bool)

(assert (=> start!62106 m!411709))

(declare-fun m!411711 () Bool)

(assert (=> start!62106 m!411711))

(push 1)

(assert (not b!278594))

(assert (not start!62106))

(assert (not b!278592))

(assert (not b!278593))

(assert (not b!278596))

(assert (not b!278595))

(check-sat)

(pop 1)

(push 1)

(check-sat)

