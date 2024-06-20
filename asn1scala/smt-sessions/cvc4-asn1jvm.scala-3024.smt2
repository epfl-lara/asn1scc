; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70418 () Bool)

(assert start!70418)

(declare-fun b!319049 () Bool)

(declare-fun res!262106 () Bool)

(declare-fun e!229234 () Bool)

(assert (=> b!319049 (=> (not res!262106) (not e!229234))))

(declare-datatypes ((array!19883 0))(
  ( (array!19884 (arr!9750 (Array (_ BitVec 32) (_ BitVec 8))) (size!8661 (_ BitVec 32))) )
))
(declare-fun a1!909 () array!19883)

(declare-fun a2!909 () array!19883)

(declare-fun from!902 () (_ BitVec 64))

(declare-fun to!869 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19883 array!19883 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!319049 (= res!262106 (arrayBitRangesEq!0 a1!909 a2!909 from!902 to!869))))

(declare-fun res!262107 () Bool)

(assert (=> start!70418 (=> (not res!262107) (not e!229234))))

(declare-fun at!309 () (_ BitVec 64))

(assert (=> start!70418 (= res!262107 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!902) (bvsle from!902 to!869) (= (size!8661 a1!909) (size!8661 a2!909)) (bvsle to!869 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8661 a1!909)))) (bvsle from!902 at!309) (bvslt at!309 to!869)))))

(assert (=> start!70418 e!229234))

(assert (=> start!70418 true))

(declare-fun array_inv!8213 (array!19883) Bool)

(assert (=> start!70418 (array_inv!8213 a1!909)))

(assert (=> start!70418 (array_inv!8213 a2!909)))

(declare-fun b!319052 () Bool)

(declare-fun i!1041 () (_ BitVec 64))

(assert (=> b!319052 (= e!229234 (bvslt (bvsub to!869 i!1041) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!319050 () Bool)

(declare-fun res!262108 () Bool)

(assert (=> b!319050 (=> (not res!262108) (not e!229234))))

(assert (=> b!319050 (= res!262108 (and (bvsle from!902 i!1041) (bvsle i!1041 at!309)))))

(declare-fun b!319051 () Bool)

(declare-fun res!262105 () Bool)

(assert (=> b!319051 (=> (not res!262105) (not e!229234))))

(assert (=> b!319051 (= res!262105 (arrayBitRangesEq!0 a1!909 a2!909 i!1041 to!869))))

(assert (= (and start!70418 res!262107) b!319049))

(assert (= (and b!319049 res!262106) b!319050))

(assert (= (and b!319050 res!262108) b!319051))

(assert (= (and b!319051 res!262105) b!319052))

(declare-fun m!457257 () Bool)

(assert (=> b!319049 m!457257))

(declare-fun m!457259 () Bool)

(assert (=> start!70418 m!457259))

(declare-fun m!457261 () Bool)

(assert (=> start!70418 m!457261))

(declare-fun m!457263 () Bool)

(assert (=> b!319051 m!457263))

(push 1)

(assert (not b!319051))

(assert (not start!70418))

(assert (not b!319049))

(check-sat)

(pop 1)

(push 1)

(check-sat)

