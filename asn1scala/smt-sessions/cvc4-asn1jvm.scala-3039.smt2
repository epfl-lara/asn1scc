; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70574 () Bool)

(assert start!70574)

(declare-fun res!262585 () Bool)

(declare-fun e!229721 () Bool)

(assert (=> start!70574 (=> (not res!262585) (not e!229721))))

(declare-datatypes ((array!19979 0))(
  ( (array!19980 (arr!9798 (Array (_ BitVec 32) (_ BitVec 8))) (size!8706 (_ BitVec 32))) )
))
(declare-fun a2!726 () array!19979)

(declare-fun to!814 () (_ BitVec 64))

(declare-fun a1!726 () array!19979)

(declare-fun from!847 () (_ BitVec 64))

(assert (=> start!70574 (= res!262585 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!847) (bvslt from!847 to!814) (= (size!8706 a1!726) (size!8706 a2!726)) (bvsle to!814 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8706 a1!726))))))))

(assert (=> start!70574 e!229721))

(assert (=> start!70574 true))

(declare-fun array_inv!8258 (array!19979) Bool)

(assert (=> start!70574 (array_inv!8258 a1!726)))

(assert (=> start!70574 (array_inv!8258 a2!726)))

(declare-fun b!319582 () Bool)

(declare-fun res!262584 () Bool)

(assert (=> b!319582 (=> (not res!262584) (not e!229721))))

(declare-fun arrayBitRangesEq!0 (array!19979 array!19979 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!319582 (= res!262584 (arrayBitRangesEq!0 a1!726 a2!726 from!847 to!814))))

(declare-fun b!319583 () Bool)

(assert (=> b!319583 (= e!229721 (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!847)))))

(assert (= (and start!70574 res!262585) b!319582))

(assert (= (and b!319582 res!262584) b!319583))

(declare-fun m!457973 () Bool)

(assert (=> start!70574 m!457973))

(declare-fun m!457975 () Bool)

(assert (=> start!70574 m!457975))

(declare-fun m!457977 () Bool)

(assert (=> b!319582 m!457977))

(push 1)

(assert (not b!319582))

(assert (not start!70574))

(check-sat)

(pop 1)

(push 1)

(check-sat)

