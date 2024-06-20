; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70414 () Bool)

(assert start!70414)

(declare-fun b!319026 () Bool)

(declare-fun res!262084 () Bool)

(declare-fun e!229217 () Bool)

(assert (=> b!319026 (=> (not res!262084) (not e!229217))))

(declare-fun i!1041 () (_ BitVec 64))

(declare-fun from!902 () (_ BitVec 64))

(declare-fun at!309 () (_ BitVec 64))

(assert (=> b!319026 (= res!262084 (and (bvsle from!902 i!1041) (bvsle i!1041 at!309)))))

(declare-fun res!262083 () Bool)

(assert (=> start!70414 (=> (not res!262083) (not e!229217))))

(declare-datatypes ((array!19879 0))(
  ( (array!19880 (arr!9748 (Array (_ BitVec 32) (_ BitVec 8))) (size!8659 (_ BitVec 32))) )
))
(declare-fun a1!909 () array!19879)

(declare-fun a2!909 () array!19879)

(declare-fun to!869 () (_ BitVec 64))

(assert (=> start!70414 (= res!262083 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!902) (bvsle from!902 to!869) (= (size!8659 a1!909) (size!8659 a2!909)) (bvsle to!869 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8659 a1!909)))) (bvsle from!902 at!309) (bvslt at!309 to!869)))))

(assert (=> start!70414 e!229217))

(assert (=> start!70414 true))

(declare-fun array_inv!8211 (array!19879) Bool)

(assert (=> start!70414 (array_inv!8211 a1!909)))

(assert (=> start!70414 (array_inv!8211 a2!909)))

(declare-fun b!319027 () Bool)

(declare-fun res!262082 () Bool)

(assert (=> b!319027 (=> (not res!262082) (not e!229217))))

(declare-fun arrayBitRangesEq!0 (array!19879 array!19879 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!319027 (= res!262082 (arrayBitRangesEq!0 a1!909 a2!909 i!1041 to!869))))

(declare-fun b!319025 () Bool)

(declare-fun res!262081 () Bool)

(assert (=> b!319025 (=> (not res!262081) (not e!229217))))

(assert (=> b!319025 (= res!262081 (arrayBitRangesEq!0 a1!909 a2!909 from!902 to!869))))

(declare-fun b!319028 () Bool)

(assert (=> b!319028 (= e!229217 (bvslt (bvsub to!869 i!1041) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!70414 res!262083) b!319025))

(assert (= (and b!319025 res!262081) b!319026))

(assert (= (and b!319026 res!262084) b!319027))

(assert (= (and b!319027 res!262082) b!319028))

(declare-fun m!457241 () Bool)

(assert (=> start!70414 m!457241))

(declare-fun m!457243 () Bool)

(assert (=> start!70414 m!457243))

(declare-fun m!457245 () Bool)

(assert (=> b!319027 m!457245))

(declare-fun m!457247 () Bool)

(assert (=> b!319025 m!457247))

(push 1)

(assert (not start!70414))

(assert (not b!319027))

(assert (not b!319025))

(check-sat)

(pop 1)

(push 1)

(check-sat)

