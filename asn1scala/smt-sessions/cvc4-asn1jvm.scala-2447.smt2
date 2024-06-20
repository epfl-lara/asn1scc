; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62134 () Bool)

(assert start!62134)

(declare-fun res!231440 () Bool)

(declare-fun e!198535 () Bool)

(assert (=> start!62134 (=> (not res!231440) (not e!198535))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!16055 0))(
  ( (array!16056 (arr!7944 (Array (_ BitVec 32) (_ BitVec 8))) (size!6948 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16055)

(declare-fun a2!699 () array!16055)

(declare-fun to!789 () (_ BitVec 64))

(assert (=> start!62134 (= res!231440 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6948 a1!699) (size!6948 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6948 a1!699))))))))

(assert (=> start!62134 e!198535))

(assert (=> start!62134 true))

(declare-fun array_inv!6672 (array!16055) Bool)

(assert (=> start!62134 (array_inv!6672 a1!699)))

(assert (=> start!62134 (array_inv!6672 a2!699)))

(declare-fun b!278736 () Bool)

(declare-fun res!231439 () Bool)

(assert (=> b!278736 (=> (not res!231439) (not e!198535))))

(declare-fun arrayBitRangesEq!0 (array!16055 array!16055 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!278736 (= res!231439 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!278737 () Bool)

(assert (=> b!278737 (= e!198535 (and (bvslt from!822 to!789) (bvsge (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000)))))

(assert (= (and start!62134 res!231440) b!278736))

(assert (= (and b!278736 res!231439) b!278737))

(declare-fun m!411865 () Bool)

(assert (=> start!62134 m!411865))

(declare-fun m!411867 () Bool)

(assert (=> start!62134 m!411867))

(declare-fun m!411869 () Bool)

(assert (=> b!278736 m!411869))

(push 1)

(assert (not start!62134))

(assert (not b!278736))

(check-sat)

(pop 1)

(push 1)

(check-sat)

