; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62142 () Bool)

(assert start!62142)

(declare-fun res!231464 () Bool)

(declare-fun e!198573 () Bool)

(assert (=> start!62142 (=> (not res!231464) (not e!198573))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!16063 0))(
  ( (array!16064 (arr!7948 (Array (_ BitVec 32) (_ BitVec 8))) (size!6952 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16063)

(declare-fun a2!699 () array!16063)

(declare-fun to!789 () (_ BitVec 64))

(assert (=> start!62142 (= res!231464 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6952 a1!699) (size!6952 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6952 a1!699))))))))

(assert (=> start!62142 e!198573))

(assert (=> start!62142 true))

(declare-fun array_inv!6676 (array!16063) Bool)

(assert (=> start!62142 (array_inv!6676 a1!699)))

(assert (=> start!62142 (array_inv!6676 a2!699)))

(declare-fun b!278760 () Bool)

(declare-fun res!231463 () Bool)

(assert (=> b!278760 (=> (not res!231463) (not e!198573))))

(declare-fun arrayBitRangesEq!0 (array!16063 array!16063 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!278760 (= res!231463 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!278761 () Bool)

(assert (=> b!278761 (= e!198573 (and (bvslt from!822 to!789) (bvsge (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000)))))

(assert (= (and start!62142 res!231464) b!278760))

(assert (= (and b!278760 res!231463) b!278761))

(declare-fun m!411889 () Bool)

(assert (=> start!62142 m!411889))

(declare-fun m!411891 () Bool)

(assert (=> start!62142 m!411891))

(declare-fun m!411893 () Bool)

(assert (=> b!278760 m!411893))

(push 1)

(assert (not b!278760))

(assert (not start!62142))

(check-sat)

(pop 1)

(push 1)

(check-sat)

