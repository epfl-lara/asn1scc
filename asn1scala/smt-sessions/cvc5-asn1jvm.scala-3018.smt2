; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70378 () Bool)

(assert start!70378)

(declare-fun res!261844 () Bool)

(declare-fun e!229055 () Bool)

(assert (=> start!70378 (=> (not res!261844) (not e!229055))))

(declare-datatypes ((array!19843 0))(
  ( (array!19844 (arr!9730 (Array (_ BitVec 32) (_ BitVec 8))) (size!8641 (_ BitVec 32))) )
))
(declare-fun a1!909 () array!19843)

(declare-fun a2!909 () array!19843)

(declare-fun from!902 () (_ BitVec 64))

(declare-fun to!869 () (_ BitVec 64))

(declare-fun at!309 () (_ BitVec 64))

(assert (=> start!70378 (= res!261844 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!902) (bvsle from!902 to!869) (= (size!8641 a1!909) (size!8641 a2!909)) (bvsle to!869 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8641 a1!909)))) (bvsle from!902 at!309) (bvslt at!309 to!869)))))

(assert (=> start!70378 e!229055))

(assert (=> start!70378 true))

(declare-fun array_inv!8193 (array!19843) Bool)

(assert (=> start!70378 (array_inv!8193 a1!909)))

(assert (=> start!70378 (array_inv!8193 a2!909)))

(declare-fun b!318787 () Bool)

(declare-fun res!261843 () Bool)

(assert (=> b!318787 (=> (not res!261843) (not e!229055))))

(declare-fun arrayBitRangesEq!0 (array!19843 array!19843 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318787 (= res!261843 (arrayBitRangesEq!0 a1!909 a2!909 from!902 to!869))))

(declare-fun i!1041 () (_ BitVec 64))

(declare-fun b!318788 () Bool)

(assert (=> b!318788 (= e!229055 (and (bvsle from!902 i!1041) (bvsle i!1041 at!309) (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 i!1041) (bvsgt i!1041 to!869))))))

(assert (= (and start!70378 res!261844) b!318787))

(assert (= (and b!318787 res!261843) b!318788))

(declare-fun m!457055 () Bool)

(assert (=> start!70378 m!457055))

(declare-fun m!457057 () Bool)

(assert (=> start!70378 m!457057))

(declare-fun m!457059 () Bool)

(assert (=> b!318787 m!457059))

(push 1)

(assert (not b!318787))

(assert (not start!70378))

(check-sat)

(pop 1)

(push 1)

(check-sat)

