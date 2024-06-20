; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70468 () Bool)

(assert start!70468)

(declare-fun b!319251 () Bool)

(declare-fun res!262283 () Bool)

(declare-fun e!229393 () Bool)

(assert (=> b!319251 (=> (not res!262283) (not e!229393))))

(declare-fun i!1041 () (_ BitVec 64))

(declare-fun at!309 () (_ BitVec 64))

(declare-fun from!902 () (_ BitVec 64))

(assert (=> b!319251 (= res!262283 (and (bvsle from!902 i!1041) (bvsle i!1041 at!309)))))

(declare-fun b!319252 () Bool)

(declare-fun res!262285 () Bool)

(assert (=> b!319252 (=> (not res!262285) (not e!229393))))

(declare-datatypes ((array!19900 0))(
  ( (array!19901 (arr!9760 (Array (_ BitVec 32) (_ BitVec 8))) (size!8668 (_ BitVec 32))) )
))
(declare-fun a1!909 () array!19900)

(declare-fun a2!909 () array!19900)

(declare-fun to!869 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19900 array!19900 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!319252 (= res!262285 (arrayBitRangesEq!0 a1!909 a2!909 i!1041 to!869))))

(declare-fun b!319250 () Bool)

(declare-fun res!262282 () Bool)

(assert (=> b!319250 (=> (not res!262282) (not e!229393))))

(assert (=> b!319250 (= res!262282 (arrayBitRangesEq!0 a1!909 a2!909 from!902 to!869))))

(declare-fun res!262284 () Bool)

(assert (=> start!70468 (=> (not res!262284) (not e!229393))))

(assert (=> start!70468 (= res!262284 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!902) (bvsle from!902 to!869) (= (size!8668 a1!909) (size!8668 a2!909)) (bvsle to!869 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8668 a1!909)))) (bvsle from!902 at!309) (bvslt at!309 to!869)))))

(assert (=> start!70468 e!229393))

(assert (=> start!70468 true))

(declare-fun array_inv!8220 (array!19900) Bool)

(assert (=> start!70468 (array_inv!8220 a1!909)))

(assert (=> start!70468 (array_inv!8220 a2!909)))

(declare-fun b!319253 () Bool)

(assert (=> b!319253 (= e!229393 (and (not (= i!1041 at!309)) (or (bvsgt from!902 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041)) (bvsgt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041) at!309))))))

(assert (= (and start!70468 res!262284) b!319250))

(assert (= (and b!319250 res!262282) b!319251))

(assert (= (and b!319251 res!262283) b!319252))

(assert (= (and b!319252 res!262285) b!319253))

(declare-fun m!457517 () Bool)

(assert (=> b!319252 m!457517))

(declare-fun m!457519 () Bool)

(assert (=> b!319250 m!457519))

(declare-fun m!457521 () Bool)

(assert (=> start!70468 m!457521))

(declare-fun m!457523 () Bool)

(assert (=> start!70468 m!457523))

(push 1)

(assert (not start!70468))

(assert (not b!319252))

(assert (not b!319250))

(check-sat)

(pop 1)

(push 1)

(check-sat)

