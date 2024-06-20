; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70390 () Bool)

(assert start!70390)

(declare-fun res!261902 () Bool)

(declare-fun e!229110 () Bool)

(assert (=> start!70390 (=> (not res!261902) (not e!229110))))

(declare-datatypes ((array!19855 0))(
  ( (array!19856 (arr!9736 (Array (_ BitVec 32) (_ BitVec 8))) (size!8647 (_ BitVec 32))) )
))
(declare-fun a1!909 () array!19855)

(declare-fun a2!909 () array!19855)

(declare-fun from!902 () (_ BitVec 64))

(declare-fun to!869 () (_ BitVec 64))

(declare-fun at!309 () (_ BitVec 64))

(assert (=> start!70390 (= res!261902 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!902) (bvsle from!902 to!869) (= (size!8647 a1!909) (size!8647 a2!909)) (bvsle to!869 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8647 a1!909)))) (bvsle from!902 at!309) (bvslt at!309 to!869)))))

(assert (=> start!70390 e!229110))

(assert (=> start!70390 true))

(declare-fun array_inv!8199 (array!19855) Bool)

(assert (=> start!70390 (array_inv!8199 a1!909)))

(assert (=> start!70390 (array_inv!8199 a2!909)))

(declare-fun b!318846 () Bool)

(declare-fun res!261903 () Bool)

(assert (=> b!318846 (=> (not res!261903) (not e!229110))))

(declare-fun i!1041 () (_ BitVec 64))

(assert (=> b!318846 (= res!261903 (and (bvsle from!902 i!1041) (bvsle i!1041 at!309)))))

(declare-fun b!318845 () Bool)

(declare-fun res!261904 () Bool)

(assert (=> b!318845 (=> (not res!261904) (not e!229110))))

(declare-fun arrayBitRangesEq!0 (array!19855 array!19855 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318845 (= res!261904 (arrayBitRangesEq!0 a1!909 a2!909 from!902 to!869))))

(declare-fun b!318847 () Bool)

(declare-fun res!261901 () Bool)

(assert (=> b!318847 (=> (not res!261901) (not e!229110))))

(assert (=> b!318847 (= res!261901 (arrayBitRangesEq!0 a1!909 a2!909 i!1041 to!869))))

(declare-fun b!318848 () Bool)

(assert (=> b!318848 (= e!229110 (and (= i!1041 at!309) (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 at!309) (bvsge at!309 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8647 a2!909)))))))))

(assert (= (and start!70390 res!261902) b!318845))

(assert (= (and b!318845 res!261904) b!318846))

(assert (= (and b!318846 res!261903) b!318847))

(assert (= (and b!318847 res!261901) b!318848))

(declare-fun m!457097 () Bool)

(assert (=> start!70390 m!457097))

(declare-fun m!457099 () Bool)

(assert (=> start!70390 m!457099))

(declare-fun m!457101 () Bool)

(assert (=> b!318845 m!457101))

(declare-fun m!457103 () Bool)

(assert (=> b!318847 m!457103))

(push 1)

(assert (not start!70390))

(assert (not b!318847))

(assert (not b!318845))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

