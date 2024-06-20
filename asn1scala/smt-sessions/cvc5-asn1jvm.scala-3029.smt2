; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70510 () Bool)

(assert start!70510)

(declare-fun b!319470 () Bool)

(declare-fun res!262477 () Bool)

(declare-fun e!229568 () Bool)

(assert (=> b!319470 (=> (not res!262477) (not e!229568))))

(declare-fun i!1041 () (_ BitVec 64))

(declare-fun at!309 () (_ BitVec 64))

(declare-fun from!902 () (_ BitVec 64))

(assert (=> b!319470 (= res!262477 (and (not (= i!1041 at!309)) (bvsle from!902 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041)) (bvsle (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041) at!309)))))

(declare-fun b!319471 () Bool)

(declare-fun res!262473 () Bool)

(assert (=> b!319471 (=> (not res!262473) (not e!229568))))

(declare-datatypes ((array!19915 0))(
  ( (array!19916 (arr!9766 (Array (_ BitVec 32) (_ BitVec 8))) (size!8674 (_ BitVec 32))) )
))
(declare-fun a1!909 () array!19915)

(declare-fun a2!909 () array!19915)

(declare-fun to!869 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19915 array!19915 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!319471 (= res!262473 (arrayBitRangesEq!0 a1!909 a2!909 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041) to!869))))

(declare-fun b!319472 () Bool)

(assert (=> b!319472 (= e!229568 (bvsge (bvsub to!869 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041)) (bvsub to!869 i!1041)))))

(declare-fun b!319473 () Bool)

(declare-fun res!262474 () Bool)

(assert (=> b!319473 (=> (not res!262474) (not e!229568))))

(assert (=> b!319473 (= res!262474 (arrayBitRangesEq!0 a1!909 a2!909 from!902 to!869))))

(declare-fun b!319474 () Bool)

(declare-fun res!262476 () Bool)

(assert (=> b!319474 (=> (not res!262476) (not e!229568))))

(assert (=> b!319474 (= res!262476 (arrayBitRangesEq!0 a1!909 a2!909 i!1041 to!869))))

(declare-fun b!319475 () Bool)

(declare-fun res!262475 () Bool)

(assert (=> b!319475 (=> (not res!262475) (not e!229568))))

(assert (=> b!319475 (= res!262475 (and (bvsle from!902 i!1041) (bvsle i!1041 at!309)))))

(declare-fun res!262472 () Bool)

(assert (=> start!70510 (=> (not res!262472) (not e!229568))))

(assert (=> start!70510 (= res!262472 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!902) (bvsle from!902 to!869) (= (size!8674 a1!909) (size!8674 a2!909)) (bvsle to!869 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8674 a1!909)))) (bvsle from!902 at!309) (bvslt at!309 to!869)))))

(assert (=> start!70510 e!229568))

(assert (=> start!70510 true))

(declare-fun array_inv!8226 (array!19915) Bool)

(assert (=> start!70510 (array_inv!8226 a1!909)))

(assert (=> start!70510 (array_inv!8226 a2!909)))

(assert (= (and start!70510 res!262472) b!319473))

(assert (= (and b!319473 res!262474) b!319475))

(assert (= (and b!319475 res!262475) b!319474))

(assert (= (and b!319474 res!262476) b!319470))

(assert (= (and b!319470 res!262477) b!319471))

(assert (= (and b!319471 res!262473) b!319472))

(declare-fun m!457829 () Bool)

(assert (=> b!319471 m!457829))

(declare-fun m!457831 () Bool)

(assert (=> b!319473 m!457831))

(declare-fun m!457833 () Bool)

(assert (=> b!319474 m!457833))

(declare-fun m!457835 () Bool)

(assert (=> start!70510 m!457835))

(declare-fun m!457837 () Bool)

(assert (=> start!70510 m!457837))

(push 1)

(assert (not start!70510))

(assert (not b!319473))

(assert (not b!319471))

(assert (not b!319474))

(check-sat)

(pop 1)

(push 1)

(check-sat)

