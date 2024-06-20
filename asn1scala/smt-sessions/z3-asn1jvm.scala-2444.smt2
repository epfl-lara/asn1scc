; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62114 () Bool)

(assert start!62114)

(declare-fun b!278674 () Bool)

(declare-fun e!198443 () Bool)

(declare-fun e!198446 () Bool)

(assert (=> b!278674 (= e!198443 e!198446)))

(declare-fun res!231388 () Bool)

(assert (=> b!278674 (=> (not res!231388) (not e!198446))))

(declare-datatypes ((tuple4!662 0))(
  ( (tuple4!663 (_1!12406 (_ BitVec 32)) (_2!12406 (_ BitVec 32)) (_3!1111 (_ BitVec 32)) (_4!331 (_ BitVec 32))) )
))
(declare-fun lt!416105 () tuple4!662)

(assert (=> b!278674 (= res!231388 (not (= (_3!1111 lt!416105) (_4!331 lt!416105))))))

(declare-datatypes ((Unit!19543 0))(
  ( (Unit!19544) )
))
(declare-fun lt!416106 () Unit!19543)

(declare-fun e!198447 () Unit!19543)

(assert (=> b!278674 (= lt!416106 e!198447)))

(declare-fun c!12816 () Bool)

(assert (=> b!278674 (= c!12816 (bvslt (_1!12406 lt!416105) (_2!12406 lt!416105)))))

(declare-fun lt!416103 () (_ BitVec 32))

(declare-fun from!822 () (_ BitVec 64))

(assert (=> b!278674 (= lt!416103 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun to!789 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!662)

(assert (=> b!278674 (= lt!416105 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!278675 () Bool)

(declare-fun Unit!19545 () Unit!19543)

(assert (=> b!278675 (= e!198447 Unit!19545)))

(declare-datatypes ((array!16035 0))(
  ( (array!16036 (arr!7934 (Array (_ BitVec 32) (_ BitVec 8))) (size!6938 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16035)

(declare-fun a2!699 () array!16035)

(declare-fun arrayRangesEq!1224 (array!16035 array!16035 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278675 (arrayRangesEq!1224 a1!699 a2!699 (_1!12406 lt!416105) (_2!12406 lt!416105))))

(declare-fun lt!416104 () Unit!19543)

(declare-fun arrayRangesEqSymmetricLemma!143 (array!16035 array!16035 (_ BitVec 32) (_ BitVec 32)) Unit!19543)

(assert (=> b!278675 (= lt!416104 (arrayRangesEqSymmetricLemma!143 a1!699 a2!699 (_1!12406 lt!416105) (_2!12406 lt!416105)))))

(assert (=> b!278675 (arrayRangesEq!1224 a2!699 a1!699 (_1!12406 lt!416105) (_2!12406 lt!416105))))

(declare-fun b!278676 () Bool)

(declare-fun e!198442 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278676 (= e!198442 (byteRangesEq!0 (select (arr!7934 a2!699) (_3!1111 lt!416105)) (select (arr!7934 a1!699) (_3!1111 lt!416105)) lt!416103 #b00000000000000000000000000001000))))

(declare-fun b!278677 () Bool)

(declare-fun res!231389 () Bool)

(assert (=> b!278677 (=> (not res!231389) (not e!198443))))

(declare-fun arrayBitRangesEq!0 (array!16035 array!16035 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!278677 (= res!231389 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!278678 () Bool)

(assert (=> b!278678 (= e!198446 (not (or (not (= ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000)) (bvsgt (size!6938 a2!699) (size!6938 a1!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6938 a2!699)))))))))

(assert (=> b!278678 e!198442))

(declare-fun res!231387 () Bool)

(assert (=> b!278678 (=> (not res!231387) (not e!198442))))

(assert (=> b!278678 (= res!231387 (byteRangesEq!0 (select (arr!7934 a1!699) (_3!1111 lt!416105)) (select (arr!7934 a2!699) (_3!1111 lt!416105)) lt!416103 #b00000000000000000000000000001000))))

(declare-fun b!278679 () Bool)

(declare-fun Unit!19546 () Unit!19543)

(assert (=> b!278679 (= e!198447 Unit!19546)))

(declare-fun res!231385 () Bool)

(assert (=> start!62114 (=> (not res!231385) (not e!198443))))

(assert (=> start!62114 (= res!231385 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6938 a1!699) (size!6938 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6938 a1!699))))))))

(assert (=> start!62114 e!198443))

(assert (=> start!62114 true))

(declare-fun array_inv!6662 (array!16035) Bool)

(assert (=> start!62114 (array_inv!6662 a1!699)))

(assert (=> start!62114 (array_inv!6662 a2!699)))

(declare-fun b!278680 () Bool)

(declare-fun res!231386 () Bool)

(assert (=> b!278680 (=> (not res!231386) (not e!198443))))

(assert (=> b!278680 (= res!231386 (bvslt from!822 to!789))))

(assert (= (and start!62114 res!231385) b!278677))

(assert (= (and b!278677 res!231389) b!278680))

(assert (= (and b!278680 res!231386) b!278674))

(assert (= (and b!278674 c!12816) b!278675))

(assert (= (and b!278674 (not c!12816)) b!278679))

(assert (= (and b!278674 res!231388) b!278678))

(assert (= (and b!278678 res!231387) b!278676))

(declare-fun m!411779 () Bool)

(assert (=> b!278676 m!411779))

(declare-fun m!411781 () Bool)

(assert (=> b!278676 m!411781))

(assert (=> b!278676 m!411779))

(assert (=> b!278676 m!411781))

(declare-fun m!411783 () Bool)

(assert (=> b!278676 m!411783))

(declare-fun m!411785 () Bool)

(assert (=> b!278675 m!411785))

(declare-fun m!411787 () Bool)

(assert (=> b!278675 m!411787))

(declare-fun m!411789 () Bool)

(assert (=> b!278675 m!411789))

(assert (=> b!278678 m!411781))

(assert (=> b!278678 m!411779))

(assert (=> b!278678 m!411781))

(assert (=> b!278678 m!411779))

(declare-fun m!411791 () Bool)

(assert (=> b!278678 m!411791))

(declare-fun m!411793 () Bool)

(assert (=> b!278677 m!411793))

(declare-fun m!411795 () Bool)

(assert (=> start!62114 m!411795))

(declare-fun m!411797 () Bool)

(assert (=> start!62114 m!411797))

(declare-fun m!411799 () Bool)

(assert (=> b!278674 m!411799))

(check-sat (not b!278677) (not b!278675) (not start!62114) (not b!278676) (not b!278678) (not b!278674))
(check-sat)
