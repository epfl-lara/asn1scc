; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70396 () Bool)

(assert start!70396)

(declare-fun b!318885 () Bool)

(declare-fun e!229135 () Bool)

(declare-fun at!309 () (_ BitVec 64))

(declare-datatypes ((array!19861 0))(
  ( (array!19862 (arr!9739 (Array (_ BitVec 32) (_ BitVec 8))) (size!8650 (_ BitVec 32))) )
))
(declare-fun a1!909 () array!19861)

(assert (=> b!318885 (= e!229135 (not (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!309) (bvslt at!309 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8650 a1!909)))))))))

(declare-fun a2!909 () array!19861)

(declare-fun bitAt!0 (array!19861 (_ BitVec 64)) Bool)

(assert (=> b!318885 (= (bitAt!0 a1!909 at!309) (bitAt!0 a2!909 at!309))))

(declare-fun i!1041 () (_ BitVec 64))

(declare-datatypes ((Unit!21893 0))(
  ( (Unit!21894) )
))
(declare-fun lt!443468 () Unit!21893)

(declare-fun from!902 () (_ BitVec 64))

(declare-fun to!869 () (_ BitVec 64))

(declare-fun rec!22 (array!19861 array!19861 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21893)

(assert (=> b!318885 (= lt!443468 (rec!22 a1!909 a2!909 at!309 from!902 to!869 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041)))))

(declare-fun b!318886 () Bool)

(declare-fun res!261946 () Bool)

(assert (=> b!318886 (=> (not res!261946) (not e!229135))))

(declare-fun arrayBitRangesEq!0 (array!19861 array!19861 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318886 (= res!261946 (arrayBitRangesEq!0 a1!909 a2!909 i!1041 to!869))))

(declare-fun b!318887 () Bool)

(declare-fun res!261941 () Bool)

(assert (=> b!318887 (=> (not res!261941) (not e!229135))))

(assert (=> b!318887 (= res!261941 (and (bvsle from!902 i!1041) (bvsle i!1041 at!309)))))

(declare-fun b!318888 () Bool)

(declare-fun res!261945 () Bool)

(assert (=> b!318888 (=> (not res!261945) (not e!229135))))

(assert (=> b!318888 (= res!261945 (arrayBitRangesEq!0 a1!909 a2!909 from!902 to!869))))

(declare-fun res!261942 () Bool)

(assert (=> start!70396 (=> (not res!261942) (not e!229135))))

(assert (=> start!70396 (= res!261942 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!902) (bvsle from!902 to!869) (= (size!8650 a1!909) (size!8650 a2!909)) (bvsle to!869 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8650 a1!909)))) (bvsle from!902 at!309) (bvslt at!309 to!869)))))

(assert (=> start!70396 e!229135))

(assert (=> start!70396 true))

(declare-fun array_inv!8202 (array!19861) Bool)

(assert (=> start!70396 (array_inv!8202 a1!909)))

(assert (=> start!70396 (array_inv!8202 a2!909)))

(declare-fun b!318889 () Bool)

(declare-fun res!261944 () Bool)

(assert (=> b!318889 (=> (not res!261944) (not e!229135))))

(assert (=> b!318889 (= res!261944 (and (not (= i!1041 at!309)) (bvsle from!902 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041)) (bvsle (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041) at!309)))))

(declare-fun b!318890 () Bool)

(declare-fun res!261943 () Bool)

(assert (=> b!318890 (=> (not res!261943) (not e!229135))))

(assert (=> b!318890 (= res!261943 (arrayBitRangesEq!0 a1!909 a2!909 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041) to!869))))

(assert (= (and start!70396 res!261942) b!318888))

(assert (= (and b!318888 res!261945) b!318887))

(assert (= (and b!318887 res!261941) b!318886))

(assert (= (and b!318886 res!261946) b!318889))

(assert (= (and b!318889 res!261944) b!318890))

(assert (= (and b!318890 res!261943) b!318885))

(declare-fun m!457121 () Bool)

(assert (=> start!70396 m!457121))

(declare-fun m!457123 () Bool)

(assert (=> start!70396 m!457123))

(declare-fun m!457125 () Bool)

(assert (=> b!318890 m!457125))

(declare-fun m!457127 () Bool)

(assert (=> b!318885 m!457127))

(declare-fun m!457129 () Bool)

(assert (=> b!318885 m!457129))

(declare-fun m!457131 () Bool)

(assert (=> b!318885 m!457131))

(declare-fun m!457133 () Bool)

(assert (=> b!318886 m!457133))

(declare-fun m!457135 () Bool)

(assert (=> b!318888 m!457135))

(push 1)

(assert (not b!318888))

(assert (not b!318886))

(assert (not b!318885))

(assert (not start!70396))

(assert (not b!318890))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

