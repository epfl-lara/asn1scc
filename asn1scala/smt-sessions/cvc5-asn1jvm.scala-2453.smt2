; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62214 () Bool)

(assert start!62214)

(declare-fun b!279036 () Bool)

(declare-fun e!198844 () Bool)

(declare-fun e!198845 () Bool)

(assert (=> b!279036 (= e!198844 e!198845)))

(declare-fun res!231702 () Bool)

(assert (=> b!279036 (=> (not res!231702) (not e!198845))))

(declare-datatypes ((tuple4!678 0))(
  ( (tuple4!679 (_1!12414 (_ BitVec 32)) (_2!12414 (_ BitVec 32)) (_3!1119 (_ BitVec 32)) (_4!339 (_ BitVec 32))) )
))
(declare-fun lt!416193 () tuple4!678)

(assert (=> b!279036 (= res!231702 (bvslt (_1!12414 lt!416193) (_2!12414 lt!416193)))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!678)

(assert (=> b!279036 (= lt!416193 (arrayBitIndices!0 from!822 to!789))))

(declare-fun res!231704 () Bool)

(assert (=> start!62214 (=> (not res!231704) (not e!198844))))

(declare-datatypes ((array!16093 0))(
  ( (array!16094 (arr!7960 (Array (_ BitVec 32) (_ BitVec 8))) (size!6964 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16093)

(declare-fun a2!699 () array!16093)

(assert (=> start!62214 (= res!231704 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6964 a1!699) (size!6964 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6964 a1!699))))))))

(assert (=> start!62214 e!198844))

(assert (=> start!62214 true))

(declare-fun array_inv!6688 (array!16093) Bool)

(assert (=> start!62214 (array_inv!6688 a1!699)))

(assert (=> start!62214 (array_inv!6688 a2!699)))

(declare-fun b!279037 () Bool)

(assert (=> b!279037 (= e!198845 (not true))))

(declare-fun arrayRangesEq!1232 (array!16093 array!16093 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!279037 (arrayRangesEq!1232 a1!699 a2!699 (_1!12414 lt!416193) (_2!12414 lt!416193))))

(declare-fun b!279035 () Bool)

(declare-fun res!231703 () Bool)

(assert (=> b!279035 (=> (not res!231703) (not e!198844))))

(assert (=> b!279035 (= res!231703 (bvslt from!822 to!789))))

(declare-fun b!279034 () Bool)

(declare-fun res!231701 () Bool)

(assert (=> b!279034 (=> (not res!231701) (not e!198844))))

(declare-fun arrayBitRangesEq!0 (array!16093 array!16093 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!279034 (= res!231701 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(assert (= (and start!62214 res!231704) b!279034))

(assert (= (and b!279034 res!231701) b!279035))

(assert (= (and b!279035 res!231703) b!279036))

(assert (= (and b!279036 res!231702) b!279037))

(declare-fun m!412105 () Bool)

(assert (=> b!279036 m!412105))

(declare-fun m!412107 () Bool)

(assert (=> start!62214 m!412107))

(declare-fun m!412109 () Bool)

(assert (=> start!62214 m!412109))

(declare-fun m!412111 () Bool)

(assert (=> b!279037 m!412111))

(declare-fun m!412113 () Bool)

(assert (=> b!279034 m!412113))

(push 1)

(assert (not b!279037))

(assert (not start!62214))

(assert (not b!279036))

(assert (not b!279034))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

