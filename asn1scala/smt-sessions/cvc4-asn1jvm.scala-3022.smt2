; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70406 () Bool)

(assert start!70406)

(declare-fun b!318975 () Bool)

(declare-fun res!262033 () Bool)

(declare-fun e!229182 () Bool)

(assert (=> b!318975 (=> (not res!262033) (not e!229182))))

(declare-fun i!1041 () (_ BitVec 64))

(declare-fun at!309 () (_ BitVec 64))

(declare-fun from!902 () (_ BitVec 64))

(assert (=> b!318975 (= res!262033 (and (not (= i!1041 at!309)) (bvsle from!902 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041)) (bvsle (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041) at!309)))))

(declare-fun b!318977 () Bool)

(declare-fun res!262035 () Bool)

(assert (=> b!318977 (=> (not res!262035) (not e!229182))))

(assert (=> b!318977 (= res!262035 (and (bvsle from!902 i!1041) (bvsle i!1041 at!309)))))

(declare-fun b!318978 () Bool)

(declare-fun res!262036 () Bool)

(assert (=> b!318978 (=> (not res!262036) (not e!229182))))

(declare-datatypes ((array!19871 0))(
  ( (array!19872 (arr!9744 (Array (_ BitVec 32) (_ BitVec 8))) (size!8655 (_ BitVec 32))) )
))
(declare-fun a1!909 () array!19871)

(declare-fun a2!909 () array!19871)

(declare-fun to!869 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19871 array!19871 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318978 (= res!262036 (arrayBitRangesEq!0 a1!909 a2!909 i!1041 to!869))))

(declare-fun b!318979 () Bool)

(declare-fun res!262032 () Bool)

(assert (=> b!318979 (=> (not res!262032) (not e!229182))))

(assert (=> b!318979 (= res!262032 (arrayBitRangesEq!0 a1!909 a2!909 from!902 to!869))))

(declare-fun b!318980 () Bool)

(declare-fun res!262034 () Bool)

(assert (=> b!318980 (=> (not res!262034) (not e!229182))))

(assert (=> b!318980 (= res!262034 (arrayBitRangesEq!0 a1!909 a2!909 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041) to!869))))

(declare-fun res!262031 () Bool)

(assert (=> start!70406 (=> (not res!262031) (not e!229182))))

(assert (=> start!70406 (= res!262031 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!902) (bvsle from!902 to!869) (= (size!8655 a1!909) (size!8655 a2!909)) (bvsle to!869 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8655 a1!909)))) (bvsle from!902 at!309) (bvslt at!309 to!869)))))

(assert (=> start!70406 e!229182))

(assert (=> start!70406 true))

(declare-fun array_inv!8207 (array!19871) Bool)

(assert (=> start!70406 (array_inv!8207 a1!909)))

(assert (=> start!70406 (array_inv!8207 a2!909)))

(declare-fun b!318976 () Bool)

(assert (=> b!318976 (= e!229182 (not (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!309) (bvslt at!309 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8655 a2!909)))))))))

(declare-fun bitAt!0 (array!19871 (_ BitVec 64)) Bool)

(assert (=> b!318976 (= (bitAt!0 a1!909 at!309) (bitAt!0 a2!909 at!309))))

(declare-datatypes ((Unit!21903 0))(
  ( (Unit!21904) )
))
(declare-fun lt!443483 () Unit!21903)

(declare-fun rec!22 (array!19871 array!19871 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21903)

(assert (=> b!318976 (= lt!443483 (rec!22 a1!909 a2!909 at!309 from!902 to!869 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041)))))

(assert (= (and start!70406 res!262031) b!318979))

(assert (= (and b!318979 res!262032) b!318977))

(assert (= (and b!318977 res!262035) b!318978))

(assert (= (and b!318978 res!262036) b!318975))

(assert (= (and b!318975 res!262033) b!318980))

(assert (= (and b!318980 res!262034) b!318976))

(declare-fun m!457201 () Bool)

(assert (=> b!318979 m!457201))

(declare-fun m!457203 () Bool)

(assert (=> start!70406 m!457203))

(declare-fun m!457205 () Bool)

(assert (=> start!70406 m!457205))

(declare-fun m!457207 () Bool)

(assert (=> b!318976 m!457207))

(declare-fun m!457209 () Bool)

(assert (=> b!318976 m!457209))

(declare-fun m!457211 () Bool)

(assert (=> b!318976 m!457211))

(declare-fun m!457213 () Bool)

(assert (=> b!318978 m!457213))

(declare-fun m!457215 () Bool)

(assert (=> b!318980 m!457215))

(push 1)

(assert (not b!318980))

(assert (not b!318978))

(assert (not b!318979))

(assert (not b!318976))

(assert (not start!70406))

(check-sat)

(pop 1)

(push 1)

(check-sat)

