; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70516 () Bool)

(assert start!70516)

(declare-fun b!319524 () Bool)

(declare-fun e!229596 () Bool)

(assert (=> b!319524 (= e!229596 (not true))))

(declare-datatypes ((array!19921 0))(
  ( (array!19922 (arr!9769 (Array (_ BitVec 32) (_ BitVec 8))) (size!8677 (_ BitVec 32))) )
))
(declare-fun a1!909 () array!19921)

(declare-fun at!309 () (_ BitVec 64))

(declare-fun a2!909 () array!19921)

(declare-fun bitAt!0 (array!19921 (_ BitVec 64)) Bool)

(assert (=> b!319524 (= (bitAt!0 a1!909 at!309) (bitAt!0 a2!909 at!309))))

(declare-fun i!1041 () (_ BitVec 64))

(declare-datatypes ((Unit!21905 0))(
  ( (Unit!21906) )
))
(declare-fun lt!443567 () Unit!21905)

(declare-fun from!902 () (_ BitVec 64))

(declare-fun to!869 () (_ BitVec 64))

(declare-fun rec!22 (array!19921 array!19921 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21905)

(assert (=> b!319524 (= lt!443567 (rec!22 a1!909 a2!909 at!309 from!902 to!869 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041)))))

(declare-fun b!319525 () Bool)

(declare-fun res!262529 () Bool)

(assert (=> b!319525 (=> (not res!262529) (not e!229596))))

(declare-fun arrayBitRangesEq!0 (array!19921 array!19921 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!319525 (= res!262529 (arrayBitRangesEq!0 a1!909 a2!909 i!1041 to!869))))

(declare-fun b!319526 () Bool)

(declare-fun res!262530 () Bool)

(assert (=> b!319526 (=> (not res!262530) (not e!229596))))

(assert (=> b!319526 (= res!262530 (arrayBitRangesEq!0 a1!909 a2!909 from!902 to!869))))

(declare-fun b!319527 () Bool)

(declare-fun res!262531 () Bool)

(assert (=> b!319527 (=> (not res!262531) (not e!229596))))

(assert (=> b!319527 (= res!262531 (and (bvsle from!902 i!1041) (bvsle i!1041 at!309)))))

(declare-fun b!319528 () Bool)

(declare-fun res!262528 () Bool)

(assert (=> b!319528 (=> (not res!262528) (not e!229596))))

(assert (=> b!319528 (= res!262528 (and (not (= i!1041 at!309)) (bvsle from!902 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041)) (bvsle (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041) at!309)))))

(declare-fun res!262527 () Bool)

(assert (=> start!70516 (=> (not res!262527) (not e!229596))))

(assert (=> start!70516 (= res!262527 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!902) (bvsle from!902 to!869) (= (size!8677 a1!909) (size!8677 a2!909)) (bvsle to!869 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8677 a1!909)))) (bvsle from!902 at!309) (bvslt at!309 to!869)))))

(assert (=> start!70516 e!229596))

(assert (=> start!70516 true))

(declare-fun array_inv!8229 (array!19921) Bool)

(assert (=> start!70516 (array_inv!8229 a1!909)))

(assert (=> start!70516 (array_inv!8229 a2!909)))

(declare-fun b!319529 () Bool)

(declare-fun res!262526 () Bool)

(assert (=> b!319529 (=> (not res!262526) (not e!229596))))

(assert (=> b!319529 (= res!262526 (arrayBitRangesEq!0 a1!909 a2!909 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041) to!869))))

(assert (= (and start!70516 res!262527) b!319526))

(assert (= (and b!319526 res!262530) b!319527))

(assert (= (and b!319527 res!262531) b!319525))

(assert (= (and b!319525 res!262529) b!319528))

(assert (= (and b!319528 res!262528) b!319529))

(assert (= (and b!319529 res!262526) b!319524))

(declare-fun m!457859 () Bool)

(assert (=> b!319525 m!457859))

(declare-fun m!457861 () Bool)

(assert (=> b!319529 m!457861))

(declare-fun m!457863 () Bool)

(assert (=> start!70516 m!457863))

(declare-fun m!457865 () Bool)

(assert (=> start!70516 m!457865))

(declare-fun m!457867 () Bool)

(assert (=> b!319524 m!457867))

(declare-fun m!457869 () Bool)

(assert (=> b!319524 m!457869))

(declare-fun m!457871 () Bool)

(assert (=> b!319524 m!457871))

(declare-fun m!457873 () Bool)

(assert (=> b!319526 m!457873))

(push 1)

(assert (not b!319524))

(assert (not b!319526))

(assert (not b!319529))

(assert (not b!319525))

(assert (not start!70516))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

