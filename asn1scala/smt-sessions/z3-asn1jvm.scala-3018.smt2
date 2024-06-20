; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70380 () Bool)

(assert start!70380)

(declare-fun res!261850 () Bool)

(declare-fun e!229064 () Bool)

(assert (=> start!70380 (=> (not res!261850) (not e!229064))))

(declare-datatypes ((array!19845 0))(
  ( (array!19846 (arr!9731 (Array (_ BitVec 32) (_ BitVec 8))) (size!8642 (_ BitVec 32))) )
))
(declare-fun a2!909 () array!19845)

(declare-fun from!902 () (_ BitVec 64))

(declare-fun a1!909 () array!19845)

(declare-fun to!869 () (_ BitVec 64))

(declare-fun at!309 () (_ BitVec 64))

(assert (=> start!70380 (= res!261850 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!902) (bvsle from!902 to!869) (= (size!8642 a1!909) (size!8642 a2!909)) (bvsle to!869 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8642 a1!909)))) (bvsle from!902 at!309) (bvslt at!309 to!869)))))

(assert (=> start!70380 e!229064))

(assert (=> start!70380 true))

(declare-fun array_inv!8194 (array!19845) Bool)

(assert (=> start!70380 (array_inv!8194 a1!909)))

(assert (=> start!70380 (array_inv!8194 a2!909)))

(declare-fun b!318793 () Bool)

(declare-fun res!261849 () Bool)

(assert (=> b!318793 (=> (not res!261849) (not e!229064))))

(declare-fun arrayBitRangesEq!0 (array!19845 array!19845 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318793 (= res!261849 (arrayBitRangesEq!0 a1!909 a2!909 from!902 to!869))))

(declare-fun i!1041 () (_ BitVec 64))

(declare-fun b!318794 () Bool)

(assert (=> b!318794 (= e!229064 (and (bvsle from!902 i!1041) (bvsle i!1041 at!309) (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 i!1041) (bvsgt i!1041 to!869))))))

(assert (= (and start!70380 res!261850) b!318793))

(assert (= (and b!318793 res!261849) b!318794))

(declare-fun m!457061 () Bool)

(assert (=> start!70380 m!457061))

(declare-fun m!457063 () Bool)

(assert (=> start!70380 m!457063))

(declare-fun m!457065 () Bool)

(assert (=> b!318793 m!457065))

(check-sat (not b!318793) (not start!70380))
(check-sat)
