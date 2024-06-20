; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70512 () Bool)

(assert start!70512)

(declare-fun b!319488 () Bool)

(declare-fun res!262494 () Bool)

(declare-fun e!229578 () Bool)

(assert (=> b!319488 (=> (not res!262494) (not e!229578))))

(declare-fun i!1041 () (_ BitVec 64))

(declare-datatypes ((array!19917 0))(
  ( (array!19918 (arr!9767 (Array (_ BitVec 32) (_ BitVec 8))) (size!8675 (_ BitVec 32))) )
))
(declare-fun a1!909 () array!19917)

(declare-fun a2!909 () array!19917)

(declare-fun to!869 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19917 array!19917 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!319488 (= res!262494 (arrayBitRangesEq!0 a1!909 a2!909 i!1041 to!869))))

(declare-fun res!262492 () Bool)

(assert (=> start!70512 (=> (not res!262492) (not e!229578))))

(declare-fun from!902 () (_ BitVec 64))

(declare-fun at!309 () (_ BitVec 64))

(assert (=> start!70512 (= res!262492 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!902) (bvsle from!902 to!869) (= (size!8675 a1!909) (size!8675 a2!909)) (bvsle to!869 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8675 a1!909)))) (bvsle from!902 at!309) (bvslt at!309 to!869)))))

(assert (=> start!70512 e!229578))

(assert (=> start!70512 true))

(declare-fun array_inv!8227 (array!19917) Bool)

(assert (=> start!70512 (array_inv!8227 a1!909)))

(assert (=> start!70512 (array_inv!8227 a2!909)))

(declare-fun b!319489 () Bool)

(declare-fun res!262491 () Bool)

(assert (=> b!319489 (=> (not res!262491) (not e!229578))))

(assert (=> b!319489 (= res!262491 (arrayBitRangesEq!0 a1!909 a2!909 from!902 to!869))))

(declare-fun b!319490 () Bool)

(declare-fun res!262493 () Bool)

(assert (=> b!319490 (=> (not res!262493) (not e!229578))))

(assert (=> b!319490 (= res!262493 (arrayBitRangesEq!0 a1!909 a2!909 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041) to!869))))

(declare-fun b!319491 () Bool)

(declare-fun res!262495 () Bool)

(assert (=> b!319491 (=> (not res!262495) (not e!229578))))

(assert (=> b!319491 (= res!262495 (and (bvsle from!902 i!1041) (bvsle i!1041 at!309)))))

(declare-fun b!319492 () Bool)

(declare-fun res!262490 () Bool)

(assert (=> b!319492 (=> (not res!262490) (not e!229578))))

(assert (=> b!319492 (= res!262490 (and (not (= i!1041 at!309)) (bvsle from!902 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041)) (bvsle (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041) at!309)))))

(declare-fun b!319493 () Bool)

(assert (=> b!319493 (= e!229578 (bvsge (bvsub to!869 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041)) (bvsub to!869 i!1041)))))

(assert (= (and start!70512 res!262492) b!319489))

(assert (= (and b!319489 res!262491) b!319491))

(assert (= (and b!319491 res!262495) b!319488))

(assert (= (and b!319488 res!262494) b!319492))

(assert (= (and b!319492 res!262490) b!319490))

(assert (= (and b!319490 res!262493) b!319493))

(declare-fun m!457839 () Bool)

(assert (=> b!319488 m!457839))

(declare-fun m!457841 () Bool)

(assert (=> start!70512 m!457841))

(declare-fun m!457843 () Bool)

(assert (=> start!70512 m!457843))

(declare-fun m!457845 () Bool)

(assert (=> b!319489 m!457845))

(declare-fun m!457847 () Bool)

(assert (=> b!319490 m!457847))

(check-sat (not start!70512) (not b!319490) (not b!319489) (not b!319488))
(check-sat)
