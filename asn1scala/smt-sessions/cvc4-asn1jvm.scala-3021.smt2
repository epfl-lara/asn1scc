; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70400 () Bool)

(assert start!70400)

(declare-fun b!318921 () Bool)

(declare-fun res!261982 () Bool)

(declare-fun e!229155 () Bool)

(assert (=> b!318921 (=> (not res!261982) (not e!229155))))

(declare-fun i!1041 () (_ BitVec 64))

(declare-fun from!902 () (_ BitVec 64))

(declare-fun at!309 () (_ BitVec 64))

(assert (=> b!318921 (= res!261982 (and (bvsle from!902 i!1041) (bvsle i!1041 at!309)))))

(declare-fun res!261978 () Bool)

(assert (=> start!70400 (=> (not res!261978) (not e!229155))))

(declare-datatypes ((array!19865 0))(
  ( (array!19866 (arr!9741 (Array (_ BitVec 32) (_ BitVec 8))) (size!8652 (_ BitVec 32))) )
))
(declare-fun a1!909 () array!19865)

(declare-fun a2!909 () array!19865)

(declare-fun to!869 () (_ BitVec 64))

(assert (=> start!70400 (= res!261978 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!902) (bvsle from!902 to!869) (= (size!8652 a1!909) (size!8652 a2!909)) (bvsle to!869 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8652 a1!909)))) (bvsle from!902 at!309) (bvslt at!309 to!869)))))

(assert (=> start!70400 e!229155))

(assert (=> start!70400 true))

(declare-fun array_inv!8204 (array!19865) Bool)

(assert (=> start!70400 (array_inv!8204 a1!909)))

(assert (=> start!70400 (array_inv!8204 a2!909)))

(declare-fun b!318922 () Bool)

(declare-fun res!261980 () Bool)

(assert (=> b!318922 (=> (not res!261980) (not e!229155))))

(declare-fun arrayBitRangesEq!0 (array!19865 array!19865 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318922 (= res!261980 (arrayBitRangesEq!0 a1!909 a2!909 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041) to!869))))

(declare-fun b!318923 () Bool)

(declare-fun res!261977 () Bool)

(assert (=> b!318923 (=> (not res!261977) (not e!229155))))

(assert (=> b!318923 (= res!261977 (arrayBitRangesEq!0 a1!909 a2!909 i!1041 to!869))))

(declare-fun b!318924 () Bool)

(declare-fun res!261979 () Bool)

(assert (=> b!318924 (=> (not res!261979) (not e!229155))))

(assert (=> b!318924 (= res!261979 (and (not (= i!1041 at!309)) (bvsle from!902 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041)) (bvsle (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041) at!309)))))

(declare-fun b!318925 () Bool)

(assert (=> b!318925 (= e!229155 (not (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!309) (bvslt at!309 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8652 a1!909)))))))))

(declare-fun bitAt!0 (array!19865 (_ BitVec 64)) Bool)

(assert (=> b!318925 (= (bitAt!0 a1!909 at!309) (bitAt!0 a2!909 at!309))))

(declare-datatypes ((Unit!21897 0))(
  ( (Unit!21898) )
))
(declare-fun lt!443474 () Unit!21897)

(declare-fun rec!22 (array!19865 array!19865 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21897)

(assert (=> b!318925 (= lt!443474 (rec!22 a1!909 a2!909 at!309 from!902 to!869 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041)))))

(declare-fun b!318926 () Bool)

(declare-fun res!261981 () Bool)

(assert (=> b!318926 (=> (not res!261981) (not e!229155))))

(assert (=> b!318926 (= res!261981 (arrayBitRangesEq!0 a1!909 a2!909 from!902 to!869))))

(assert (= (and start!70400 res!261978) b!318926))

(assert (= (and b!318926 res!261981) b!318921))

(assert (= (and b!318921 res!261982) b!318923))

(assert (= (and b!318923 res!261977) b!318924))

(assert (= (and b!318924 res!261979) b!318922))

(assert (= (and b!318922 res!261980) b!318925))

(declare-fun m!457153 () Bool)

(assert (=> b!318922 m!457153))

(declare-fun m!457155 () Bool)

(assert (=> start!70400 m!457155))

(declare-fun m!457157 () Bool)

(assert (=> start!70400 m!457157))

(declare-fun m!457159 () Bool)

(assert (=> b!318925 m!457159))

(declare-fun m!457161 () Bool)

(assert (=> b!318925 m!457161))

(declare-fun m!457163 () Bool)

(assert (=> b!318925 m!457163))

(declare-fun m!457165 () Bool)

(assert (=> b!318923 m!457165))

(declare-fun m!457167 () Bool)

(assert (=> b!318926 m!457167))

(push 1)

(assert (not start!70400))

(assert (not b!318922))

(assert (not b!318925))

(assert (not b!318923))

(assert (not b!318926))

(check-sat)

(pop 1)

(push 1)

(check-sat)

