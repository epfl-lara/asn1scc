; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62116 () Bool)

(assert start!62116)

(declare-fun b!278695 () Bool)

(declare-fun res!231403 () Bool)

(declare-fun e!198463 () Bool)

(assert (=> b!278695 (=> (not res!231403) (not e!198463))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!16037 0))(
  ( (array!16038 (arr!7935 (Array (_ BitVec 32) (_ BitVec 8))) (size!6939 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16037)

(declare-fun a2!699 () array!16037)

(declare-fun to!789 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!16037 array!16037 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!278695 (= res!231403 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!278696 () Bool)

(declare-datatypes ((Unit!19547 0))(
  ( (Unit!19548) )
))
(declare-fun e!198464 () Unit!19547)

(declare-fun Unit!19549 () Unit!19547)

(assert (=> b!278696 (= e!198464 Unit!19549)))

(declare-datatypes ((tuple4!664 0))(
  ( (tuple4!665 (_1!12407 (_ BitVec 32)) (_2!12407 (_ BitVec 32)) (_3!1112 (_ BitVec 32)) (_4!332 (_ BitVec 32))) )
))
(declare-fun lt!416118 () tuple4!664)

(declare-fun arrayRangesEq!1225 (array!16037 array!16037 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278696 (arrayRangesEq!1225 a1!699 a2!699 (_1!12407 lt!416118) (_2!12407 lt!416118))))

(declare-fun lt!416115 () Unit!19547)

(declare-fun arrayRangesEqSymmetricLemma!144 (array!16037 array!16037 (_ BitVec 32) (_ BitVec 32)) Unit!19547)

(assert (=> b!278696 (= lt!416115 (arrayRangesEqSymmetricLemma!144 a1!699 a2!699 (_1!12407 lt!416118) (_2!12407 lt!416118)))))

(assert (=> b!278696 (arrayRangesEq!1225 a2!699 a1!699 (_1!12407 lt!416118) (_2!12407 lt!416118))))

(declare-fun res!231400 () Bool)

(assert (=> start!62116 (=> (not res!231400) (not e!198463))))

(assert (=> start!62116 (= res!231400 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6939 a1!699) (size!6939 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6939 a1!699))))))))

(assert (=> start!62116 e!198463))

(assert (=> start!62116 true))

(declare-fun array_inv!6663 (array!16037) Bool)

(assert (=> start!62116 (array_inv!6663 a1!699)))

(assert (=> start!62116 (array_inv!6663 a2!699)))

(declare-fun b!278697 () Bool)

(declare-fun e!198465 () Bool)

(assert (=> b!278697 (= e!198465 (not (or (not (= ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000)) (bvsgt (size!6939 a2!699) (size!6939 a1!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6939 a2!699)))))))))

(declare-fun e!198461 () Bool)

(assert (=> b!278697 e!198461))

(declare-fun res!231404 () Bool)

(assert (=> b!278697 (=> (not res!231404) (not e!198461))))

(declare-fun lt!416116 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278697 (= res!231404 (byteRangesEq!0 (select (arr!7935 a1!699) (_3!1112 lt!416118)) (select (arr!7935 a2!699) (_3!1112 lt!416118)) lt!416116 #b00000000000000000000000000001000))))

(declare-fun b!278698 () Bool)

(assert (=> b!278698 (= e!198463 e!198465)))

(declare-fun res!231402 () Bool)

(assert (=> b!278698 (=> (not res!231402) (not e!198465))))

(assert (=> b!278698 (= res!231402 (not (= (_3!1112 lt!416118) (_4!332 lt!416118))))))

(declare-fun lt!416117 () Unit!19547)

(assert (=> b!278698 (= lt!416117 e!198464)))

(declare-fun c!12819 () Bool)

(assert (=> b!278698 (= c!12819 (bvslt (_1!12407 lt!416118) (_2!12407 lt!416118)))))

(assert (=> b!278698 (= lt!416116 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!664)

(assert (=> b!278698 (= lt!416118 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!278699 () Bool)

(declare-fun res!231401 () Bool)

(assert (=> b!278699 (=> (not res!231401) (not e!198463))))

(assert (=> b!278699 (= res!231401 (bvslt from!822 to!789))))

(declare-fun b!278700 () Bool)

(declare-fun Unit!19550 () Unit!19547)

(assert (=> b!278700 (= e!198464 Unit!19550)))

(declare-fun b!278701 () Bool)

(assert (=> b!278701 (= e!198461 (byteRangesEq!0 (select (arr!7935 a2!699) (_3!1112 lt!416118)) (select (arr!7935 a1!699) (_3!1112 lt!416118)) lt!416116 #b00000000000000000000000000001000))))

(assert (= (and start!62116 res!231400) b!278695))

(assert (= (and b!278695 res!231403) b!278699))

(assert (= (and b!278699 res!231401) b!278698))

(assert (= (and b!278698 c!12819) b!278696))

(assert (= (and b!278698 (not c!12819)) b!278700))

(assert (= (and b!278698 res!231402) b!278697))

(assert (= (and b!278697 res!231404) b!278701))

(declare-fun m!411801 () Bool)

(assert (=> b!278701 m!411801))

(declare-fun m!411803 () Bool)

(assert (=> b!278701 m!411803))

(assert (=> b!278701 m!411801))

(assert (=> b!278701 m!411803))

(declare-fun m!411805 () Bool)

(assert (=> b!278701 m!411805))

(declare-fun m!411807 () Bool)

(assert (=> b!278698 m!411807))

(declare-fun m!411809 () Bool)

(assert (=> b!278695 m!411809))

(declare-fun m!411811 () Bool)

(assert (=> start!62116 m!411811))

(declare-fun m!411813 () Bool)

(assert (=> start!62116 m!411813))

(assert (=> b!278697 m!411803))

(assert (=> b!278697 m!411801))

(assert (=> b!278697 m!411803))

(assert (=> b!278697 m!411801))

(declare-fun m!411815 () Bool)

(assert (=> b!278697 m!411815))

(declare-fun m!411817 () Bool)

(assert (=> b!278696 m!411817))

(declare-fun m!411819 () Bool)

(assert (=> b!278696 m!411819))

(declare-fun m!411821 () Bool)

(assert (=> b!278696 m!411821))

(push 1)

(assert (not b!278695))

(assert (not b!278698))

(assert (not b!278696))

(assert (not b!278701))

(assert (not b!278697))

(assert (not start!62116))

(check-sat)

(pop 1)

(push 1)

(check-sat)

