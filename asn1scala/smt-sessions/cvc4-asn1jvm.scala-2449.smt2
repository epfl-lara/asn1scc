; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62146 () Bool)

(assert start!62146)

(declare-fun res!231475 () Bool)

(declare-fun e!198589 () Bool)

(assert (=> start!62146 (=> (not res!231475) (not e!198589))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!16067 0))(
  ( (array!16068 (arr!7950 (Array (_ BitVec 32) (_ BitVec 8))) (size!6954 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16067)

(declare-fun a2!699 () array!16067)

(declare-fun to!789 () (_ BitVec 64))

(assert (=> start!62146 (= res!231475 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6954 a1!699) (size!6954 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6954 a1!699))))))))

(assert (=> start!62146 e!198589))

(assert (=> start!62146 true))

(declare-fun array_inv!6678 (array!16067) Bool)

(assert (=> start!62146 (array_inv!6678 a1!699)))

(assert (=> start!62146 (array_inv!6678 a2!699)))

(declare-fun b!278772 () Bool)

(declare-fun res!231476 () Bool)

(assert (=> b!278772 (=> (not res!231476) (not e!198589))))

(declare-fun arrayBitRangesEq!0 (array!16067 array!16067 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!278772 (= res!231476 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!278773 () Bool)

(assert (=> b!278773 (= e!198589 (and (bvslt from!822 to!789) (bvsge (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000)))))

(assert (= (and start!62146 res!231475) b!278772))

(assert (= (and b!278772 res!231476) b!278773))

(declare-fun m!411901 () Bool)

(assert (=> start!62146 m!411901))

(declare-fun m!411903 () Bool)

(assert (=> start!62146 m!411903))

(declare-fun m!411905 () Bool)

(assert (=> b!278772 m!411905))

(push 1)

(assert (not start!62146))

(assert (not b!278772))

(check-sat)

(pop 1)

(push 1)

(check-sat)

