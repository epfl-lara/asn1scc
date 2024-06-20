; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70514 () Bool)

(assert start!70514)

(declare-fun b!319506 () Bool)

(declare-fun res!262512 () Bool)

(declare-fun e!229587 () Bool)

(assert (=> b!319506 (=> (not res!262512) (not e!229587))))

(declare-fun i!1041 () (_ BitVec 64))

(declare-fun from!902 () (_ BitVec 64))

(declare-fun at!309 () (_ BitVec 64))

(assert (=> b!319506 (= res!262512 (and (not (= i!1041 at!309)) (bvsle from!902 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041)) (bvsle (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041) at!309)))))

(declare-fun b!319507 () Bool)

(declare-fun to!869 () (_ BitVec 64))

(assert (=> b!319507 (= e!229587 (bvsge (bvsub to!869 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041)) (bvsub to!869 i!1041)))))

(declare-fun b!319508 () Bool)

(declare-fun res!262513 () Bool)

(assert (=> b!319508 (=> (not res!262513) (not e!229587))))

(declare-datatypes ((array!19919 0))(
  ( (array!19920 (arr!9768 (Array (_ BitVec 32) (_ BitVec 8))) (size!8676 (_ BitVec 32))) )
))
(declare-fun a1!909 () array!19919)

(declare-fun a2!909 () array!19919)

(declare-fun arrayBitRangesEq!0 (array!19919 array!19919 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!319508 (= res!262513 (arrayBitRangesEq!0 a1!909 a2!909 i!1041 to!869))))

(declare-fun res!262509 () Bool)

(assert (=> start!70514 (=> (not res!262509) (not e!229587))))

(assert (=> start!70514 (= res!262509 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!902) (bvsle from!902 to!869) (= (size!8676 a1!909) (size!8676 a2!909)) (bvsle to!869 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8676 a1!909)))) (bvsle from!902 at!309) (bvslt at!309 to!869)))))

(assert (=> start!70514 e!229587))

(assert (=> start!70514 true))

(declare-fun array_inv!8228 (array!19919) Bool)

(assert (=> start!70514 (array_inv!8228 a1!909)))

(assert (=> start!70514 (array_inv!8228 a2!909)))

(declare-fun b!319509 () Bool)

(declare-fun res!262510 () Bool)

(assert (=> b!319509 (=> (not res!262510) (not e!229587))))

(assert (=> b!319509 (= res!262510 (arrayBitRangesEq!0 a1!909 a2!909 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041) to!869))))

(declare-fun b!319510 () Bool)

(declare-fun res!262508 () Bool)

(assert (=> b!319510 (=> (not res!262508) (not e!229587))))

(assert (=> b!319510 (= res!262508 (arrayBitRangesEq!0 a1!909 a2!909 from!902 to!869))))

(declare-fun b!319511 () Bool)

(declare-fun res!262511 () Bool)

(assert (=> b!319511 (=> (not res!262511) (not e!229587))))

(assert (=> b!319511 (= res!262511 (and (bvsle from!902 i!1041) (bvsle i!1041 at!309)))))

(assert (= (and start!70514 res!262509) b!319510))

(assert (= (and b!319510 res!262508) b!319511))

(assert (= (and b!319511 res!262511) b!319508))

(assert (= (and b!319508 res!262513) b!319506))

(assert (= (and b!319506 res!262512) b!319509))

(assert (= (and b!319509 res!262510) b!319507))

(declare-fun m!457849 () Bool)

(assert (=> b!319508 m!457849))

(declare-fun m!457851 () Bool)

(assert (=> start!70514 m!457851))

(declare-fun m!457853 () Bool)

(assert (=> start!70514 m!457853))

(declare-fun m!457855 () Bool)

(assert (=> b!319509 m!457855))

(declare-fun m!457857 () Bool)

(assert (=> b!319510 m!457857))

(push 1)

(assert (not b!319510))

(assert (not start!70514))

(assert (not b!319509))

(assert (not b!319508))

(check-sat)

(pop 1)

(push 1)

(check-sat)

