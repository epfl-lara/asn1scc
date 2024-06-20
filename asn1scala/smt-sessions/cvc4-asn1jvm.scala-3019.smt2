; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70388 () Bool)

(assert start!70388)

(declare-fun i!1041 () (_ BitVec 64))

(declare-datatypes ((array!19853 0))(
  ( (array!19854 (arr!9735 (Array (_ BitVec 32) (_ BitVec 8))) (size!8646 (_ BitVec 32))) )
))
(declare-fun a1!909 () array!19853)

(declare-fun b!318836 () Bool)

(declare-fun e!229099 () Bool)

(declare-fun at!309 () (_ BitVec 64))

(assert (=> b!318836 (= e!229099 (and (= i!1041 at!309) (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 at!309) (bvsge at!309 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8646 a1!909)))))))))

(declare-fun b!318833 () Bool)

(declare-fun res!261892 () Bool)

(assert (=> b!318833 (=> (not res!261892) (not e!229099))))

(declare-fun a2!909 () array!19853)

(declare-fun to!869 () (_ BitVec 64))

(declare-fun from!902 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19853 array!19853 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318833 (= res!261892 (arrayBitRangesEq!0 a1!909 a2!909 from!902 to!869))))

(declare-fun b!318834 () Bool)

(declare-fun res!261891 () Bool)

(assert (=> b!318834 (=> (not res!261891) (not e!229099))))

(assert (=> b!318834 (= res!261891 (and (bvsle from!902 i!1041) (bvsle i!1041 at!309)))))

(declare-fun res!261889 () Bool)

(assert (=> start!70388 (=> (not res!261889) (not e!229099))))

(assert (=> start!70388 (= res!261889 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!902) (bvsle from!902 to!869) (= (size!8646 a1!909) (size!8646 a2!909)) (bvsle to!869 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8646 a1!909)))) (bvsle from!902 at!309) (bvslt at!309 to!869)))))

(assert (=> start!70388 e!229099))

(assert (=> start!70388 true))

(declare-fun array_inv!8198 (array!19853) Bool)

(assert (=> start!70388 (array_inv!8198 a1!909)))

(assert (=> start!70388 (array_inv!8198 a2!909)))

(declare-fun b!318835 () Bool)

(declare-fun res!261890 () Bool)

(assert (=> b!318835 (=> (not res!261890) (not e!229099))))

(assert (=> b!318835 (= res!261890 (arrayBitRangesEq!0 a1!909 a2!909 i!1041 to!869))))

(assert (= (and start!70388 res!261889) b!318833))

(assert (= (and b!318833 res!261892) b!318834))

(assert (= (and b!318834 res!261891) b!318835))

(assert (= (and b!318835 res!261890) b!318836))

(declare-fun m!457089 () Bool)

(assert (=> b!318833 m!457089))

(declare-fun m!457091 () Bool)

(assert (=> start!70388 m!457091))

(declare-fun m!457093 () Bool)

(assert (=> start!70388 m!457093))

(declare-fun m!457095 () Bool)

(assert (=> b!318835 m!457095))

(push 1)

(assert (not b!318835))

(assert (not start!70388))

(assert (not b!318833))

(check-sat)

(pop 1)

(push 1)

(check-sat)

