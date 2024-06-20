; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62100 () Bool)

(assert start!62100)

(declare-fun res!231257 () Bool)

(declare-fun e!198307 () Bool)

(assert (=> start!62100 (=> (not res!231257) (not e!198307))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!16021 0))(
  ( (array!16022 (arr!7927 (Array (_ BitVec 32) (_ BitVec 8))) (size!6931 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16021)

(declare-fun a2!699 () array!16021)

(declare-fun to!789 () (_ BitVec 64))

(assert (=> start!62100 (= res!231257 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6931 a1!699) (size!6931 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6931 a1!699))))))))

(assert (=> start!62100 e!198307))

(assert (=> start!62100 true))

(declare-fun array_inv!6655 (array!16021) Bool)

(assert (=> start!62100 (array_inv!6655 a1!699)))

(assert (=> start!62100 (array_inv!6655 a2!699)))

(declare-fun b!278499 () Bool)

(declare-fun res!231260 () Bool)

(assert (=> b!278499 (=> (not res!231260) (not e!198307))))

(declare-fun arrayBitRangesEq!0 (array!16021 array!16021 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!278499 (= res!231260 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!278500 () Bool)

(declare-fun e!198302 () Bool)

(declare-fun e!198303 () Bool)

(assert (=> b!278500 (= e!198302 (not e!198303))))

(declare-fun res!231254 () Bool)

(assert (=> b!278500 (=> res!231254 e!198303)))

(declare-fun lt!416016 () (_ BitVec 32))

(assert (=> b!278500 (= res!231254 (= lt!416016 #b00000000000000000000000000000000))))

(declare-fun e!198308 () Bool)

(assert (=> b!278500 e!198308))

(declare-fun res!231258 () Bool)

(assert (=> b!278500 (=> (not res!231258) (not e!198308))))

(declare-datatypes ((tuple4!648 0))(
  ( (tuple4!649 (_1!12399 (_ BitVec 32)) (_2!12399 (_ BitVec 32)) (_3!1104 (_ BitVec 32)) (_4!324 (_ BitVec 32))) )
))
(declare-fun lt!416013 () tuple4!648)

(declare-fun lt!416012 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278500 (= res!231258 (byteRangesEq!0 (select (arr!7927 a1!699) (_3!1104 lt!416013)) (select (arr!7927 a2!699) (_3!1104 lt!416013)) lt!416012 #b00000000000000000000000000001000))))

(declare-fun b!278501 () Bool)

(declare-datatypes ((Unit!19515 0))(
  ( (Unit!19516) )
))
(declare-fun e!198305 () Unit!19515)

(declare-fun Unit!19517 () Unit!19515)

(assert (=> b!278501 (= e!198305 Unit!19517)))

(declare-fun arrayRangesEq!1217 (array!16021 array!16021 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278501 (arrayRangesEq!1217 a1!699 a2!699 (_1!12399 lt!416013) (_2!12399 lt!416013))))

(declare-fun lt!416014 () Unit!19515)

(declare-fun arrayRangesEqSymmetricLemma!136 (array!16021 array!16021 (_ BitVec 32) (_ BitVec 32)) Unit!19515)

(assert (=> b!278501 (= lt!416014 (arrayRangesEqSymmetricLemma!136 a1!699 a2!699 (_1!12399 lt!416013) (_2!12399 lt!416013)))))

(assert (=> b!278501 (arrayRangesEq!1217 a2!699 a1!699 (_1!12399 lt!416013) (_2!12399 lt!416013))))

(declare-fun b!278502 () Bool)

(declare-fun e!198304 () Bool)

(assert (=> b!278502 (= e!198308 e!198304)))

(declare-fun res!231252 () Bool)

(assert (=> b!278502 (=> res!231252 e!198304)))

(assert (=> b!278502 (= res!231252 (= lt!416016 #b00000000000000000000000000000000))))

(declare-fun b!278503 () Bool)

(assert (=> b!278503 (= e!198307 e!198302)))

(declare-fun res!231256 () Bool)

(assert (=> b!278503 (=> (not res!231256) (not e!198302))))

(assert (=> b!278503 (= res!231256 (not (= (_3!1104 lt!416013) (_4!324 lt!416013))))))

(declare-fun lt!416015 () Unit!19515)

(assert (=> b!278503 (= lt!416015 e!198305)))

(declare-fun c!12795 () Bool)

(assert (=> b!278503 (= c!12795 (bvslt (_1!12399 lt!416013) (_2!12399 lt!416013)))))

(assert (=> b!278503 (= lt!416016 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!278503 (= lt!416012 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!648)

(assert (=> b!278503 (= lt!416013 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!278504 () Bool)

(assert (=> b!278504 (= e!198304 (byteRangesEq!0 (select (arr!7927 a1!699) (_4!324 lt!416013)) (select (arr!7927 a2!699) (_4!324 lt!416013)) #b00000000000000000000000000000000 lt!416016))))

(declare-fun b!278505 () Bool)

(assert (=> b!278505 (= e!198303 (or (bvsgt (size!6931 a2!699) (size!6931 a1!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6931 a2!699))))))))

(declare-fun b!278506 () Bool)

(declare-fun Unit!19518 () Unit!19515)

(assert (=> b!278506 (= e!198305 Unit!19518)))

(declare-fun b!278507 () Bool)

(declare-fun res!231259 () Bool)

(assert (=> b!278507 (=> res!231259 e!198303)))

(assert (=> b!278507 (= res!231259 (not (byteRangesEq!0 (select (arr!7927 a2!699) (_4!324 lt!416013)) (select (arr!7927 a1!699) (_4!324 lt!416013)) #b00000000000000000000000000000000 lt!416016)))))

(declare-fun b!278508 () Bool)

(declare-fun res!231253 () Bool)

(assert (=> b!278508 (=> (not res!231253) (not e!198308))))

(assert (=> b!278508 (= res!231253 (byteRangesEq!0 (select (arr!7927 a2!699) (_3!1104 lt!416013)) (select (arr!7927 a1!699) (_3!1104 lt!416013)) lt!416012 #b00000000000000000000000000001000))))

(declare-fun b!278509 () Bool)

(declare-fun res!231255 () Bool)

(assert (=> b!278509 (=> (not res!231255) (not e!198307))))

(assert (=> b!278509 (= res!231255 (bvslt from!822 to!789))))

(assert (= (and start!62100 res!231257) b!278499))

(assert (= (and b!278499 res!231260) b!278509))

(assert (= (and b!278509 res!231255) b!278503))

(assert (= (and b!278503 c!12795) b!278501))

(assert (= (and b!278503 (not c!12795)) b!278506))

(assert (= (and b!278503 res!231256) b!278500))

(assert (= (and b!278500 res!231258) b!278508))

(assert (= (and b!278508 res!231253) b!278502))

(assert (= (and b!278502 (not res!231252)) b!278504))

(assert (= (and b!278500 (not res!231254)) b!278507))

(assert (= (and b!278507 (not res!231259)) b!278505))

(declare-fun m!411601 () Bool)

(assert (=> start!62100 m!411601))

(declare-fun m!411603 () Bool)

(assert (=> start!62100 m!411603))

(declare-fun m!411605 () Bool)

(assert (=> b!278503 m!411605))

(declare-fun m!411607 () Bool)

(assert (=> b!278508 m!411607))

(declare-fun m!411609 () Bool)

(assert (=> b!278508 m!411609))

(assert (=> b!278508 m!411607))

(assert (=> b!278508 m!411609))

(declare-fun m!411611 () Bool)

(assert (=> b!278508 m!411611))

(assert (=> b!278500 m!411609))

(assert (=> b!278500 m!411607))

(assert (=> b!278500 m!411609))

(assert (=> b!278500 m!411607))

(declare-fun m!411613 () Bool)

(assert (=> b!278500 m!411613))

(declare-fun m!411615 () Bool)

(assert (=> b!278499 m!411615))

(declare-fun m!411617 () Bool)

(assert (=> b!278504 m!411617))

(declare-fun m!411619 () Bool)

(assert (=> b!278504 m!411619))

(assert (=> b!278504 m!411617))

(assert (=> b!278504 m!411619))

(declare-fun m!411621 () Bool)

(assert (=> b!278504 m!411621))

(assert (=> b!278507 m!411619))

(assert (=> b!278507 m!411617))

(assert (=> b!278507 m!411619))

(assert (=> b!278507 m!411617))

(declare-fun m!411623 () Bool)

(assert (=> b!278507 m!411623))

(declare-fun m!411625 () Bool)

(assert (=> b!278501 m!411625))

(declare-fun m!411627 () Bool)

(assert (=> b!278501 m!411627))

(declare-fun m!411629 () Bool)

(assert (=> b!278501 m!411629))

(push 1)

(assert (not b!278508))

(assert (not b!278500))

(assert (not b!278504))

(assert (not b!278507))

(assert (not b!278503))

(assert (not start!62100))

(assert (not b!278501))

(assert (not b!278499))

(check-sat)

(pop 1)

(push 1)

(check-sat)

