; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70382 () Bool)

(assert start!70382)

(declare-fun res!261855 () Bool)

(declare-fun e!229072 () Bool)

(assert (=> start!70382 (=> (not res!261855) (not e!229072))))

(declare-datatypes ((array!19847 0))(
  ( (array!19848 (arr!9732 (Array (_ BitVec 32) (_ BitVec 8))) (size!8643 (_ BitVec 32))) )
))
(declare-fun a1!909 () array!19847)

(declare-fun from!902 () (_ BitVec 64))

(declare-fun a2!909 () array!19847)

(declare-fun to!869 () (_ BitVec 64))

(declare-fun at!309 () (_ BitVec 64))

(assert (=> start!70382 (= res!261855 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!902) (bvsle from!902 to!869) (= (size!8643 a1!909) (size!8643 a2!909)) (bvsle to!869 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8643 a1!909)))) (bvsle from!902 at!309) (bvslt at!309 to!869)))))

(assert (=> start!70382 e!229072))

(assert (=> start!70382 true))

(declare-fun array_inv!8195 (array!19847) Bool)

(assert (=> start!70382 (array_inv!8195 a1!909)))

(assert (=> start!70382 (array_inv!8195 a2!909)))

(declare-fun b!318799 () Bool)

(declare-fun res!261856 () Bool)

(assert (=> b!318799 (=> (not res!261856) (not e!229072))))

(declare-fun arrayBitRangesEq!0 (array!19847 array!19847 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318799 (= res!261856 (arrayBitRangesEq!0 a1!909 a2!909 from!902 to!869))))

(declare-fun i!1041 () (_ BitVec 64))

(declare-fun b!318800 () Bool)

(assert (=> b!318800 (= e!229072 (and (bvsle from!902 i!1041) (bvsle i!1041 at!309) (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 i!1041) (bvsgt i!1041 to!869))))))

(assert (= (and start!70382 res!261855) b!318799))

(assert (= (and b!318799 res!261856) b!318800))

(declare-fun m!457067 () Bool)

(assert (=> start!70382 m!457067))

(declare-fun m!457069 () Bool)

(assert (=> start!70382 m!457069))

(declare-fun m!457071 () Bool)

(assert (=> b!318799 m!457071))

(push 1)

(assert (not start!70382))

(assert (not b!318799))

(check-sat)

(pop 1)

(push 1)

(check-sat)

