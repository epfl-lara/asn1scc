; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70520 () Bool)

(assert start!70520)

(declare-fun b!319560 () Bool)

(declare-fun e!229613 () Bool)

(assert (=> b!319560 (= e!229613 (not true))))

(declare-datatypes ((array!19925 0))(
  ( (array!19926 (arr!9771 (Array (_ BitVec 32) (_ BitVec 8))) (size!8679 (_ BitVec 32))) )
))
(declare-fun a1!909 () array!19925)

(declare-fun at!309 () (_ BitVec 64))

(declare-fun a2!909 () array!19925)

(declare-fun bitAt!0 (array!19925 (_ BitVec 64)) Bool)

(assert (=> b!319560 (= (bitAt!0 a1!909 at!309) (bitAt!0 a2!909 at!309))))

(declare-fun i!1041 () (_ BitVec 64))

(declare-datatypes ((Unit!21909 0))(
  ( (Unit!21910) )
))
(declare-fun lt!443573 () Unit!21909)

(declare-fun from!902 () (_ BitVec 64))

(declare-fun to!869 () (_ BitVec 64))

(declare-fun rec!22 (array!19925 array!19925 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21909)

(assert (=> b!319560 (= lt!443573 (rec!22 a1!909 a2!909 at!309 from!902 to!869 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041)))))

(declare-fun res!262564 () Bool)

(assert (=> start!70520 (=> (not res!262564) (not e!229613))))

(assert (=> start!70520 (= res!262564 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!902) (bvsle from!902 to!869) (= (size!8679 a1!909) (size!8679 a2!909)) (bvsle to!869 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8679 a1!909)))) (bvsle from!902 at!309) (bvslt at!309 to!869)))))

(assert (=> start!70520 e!229613))

(assert (=> start!70520 true))

(declare-fun array_inv!8231 (array!19925) Bool)

(assert (=> start!70520 (array_inv!8231 a1!909)))

(assert (=> start!70520 (array_inv!8231 a2!909)))

(declare-fun b!319561 () Bool)

(declare-fun res!262565 () Bool)

(assert (=> b!319561 (=> (not res!262565) (not e!229613))))

(assert (=> b!319561 (= res!262565 (and (bvsle from!902 i!1041) (bvsle i!1041 at!309)))))

(declare-fun b!319562 () Bool)

(declare-fun res!262563 () Bool)

(assert (=> b!319562 (=> (not res!262563) (not e!229613))))

(declare-fun arrayBitRangesEq!0 (array!19925 array!19925 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!319562 (= res!262563 (arrayBitRangesEq!0 a1!909 a2!909 i!1041 to!869))))

(declare-fun b!319563 () Bool)

(declare-fun res!262562 () Bool)

(assert (=> b!319563 (=> (not res!262562) (not e!229613))))

(assert (=> b!319563 (= res!262562 (and (not (= i!1041 at!309)) (bvsle from!902 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041)) (bvsle (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041) at!309)))))

(declare-fun b!319564 () Bool)

(declare-fun res!262567 () Bool)

(assert (=> b!319564 (=> (not res!262567) (not e!229613))))

(assert (=> b!319564 (= res!262567 (arrayBitRangesEq!0 a1!909 a2!909 from!902 to!869))))

(declare-fun b!319565 () Bool)

(declare-fun res!262566 () Bool)

(assert (=> b!319565 (=> (not res!262566) (not e!229613))))

(assert (=> b!319565 (= res!262566 (arrayBitRangesEq!0 a1!909 a2!909 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041) to!869))))

(assert (= (and start!70520 res!262564) b!319564))

(assert (= (and b!319564 res!262567) b!319561))

(assert (= (and b!319561 res!262565) b!319562))

(assert (= (and b!319562 res!262563) b!319563))

(assert (= (and b!319563 res!262562) b!319565))

(assert (= (and b!319565 res!262566) b!319560))

(declare-fun m!457891 () Bool)

(assert (=> start!70520 m!457891))

(declare-fun m!457893 () Bool)

(assert (=> start!70520 m!457893))

(declare-fun m!457895 () Bool)

(assert (=> b!319560 m!457895))

(declare-fun m!457897 () Bool)

(assert (=> b!319560 m!457897))

(declare-fun m!457899 () Bool)

(assert (=> b!319560 m!457899))

(declare-fun m!457901 () Bool)

(assert (=> b!319562 m!457901))

(declare-fun m!457903 () Bool)

(assert (=> b!319564 m!457903))

(declare-fun m!457905 () Bool)

(assert (=> b!319565 m!457905))

(push 1)

(assert (not b!319562))

(assert (not b!319564))

(assert (not b!319560))

(assert (not b!319565))

(assert (not start!70520))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

