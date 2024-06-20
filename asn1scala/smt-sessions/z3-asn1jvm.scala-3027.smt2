; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70470 () Bool)

(assert start!70470)

(declare-fun i!1041 () (_ BitVec 64))

(declare-fun b!319265 () Bool)

(declare-fun e!229404 () Bool)

(declare-fun from!902 () (_ BitVec 64))

(declare-fun at!309 () (_ BitVec 64))

(assert (=> b!319265 (= e!229404 (and (not (= i!1041 at!309)) (or (bvsgt from!902 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041)) (bvsgt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041) at!309))))))

(declare-fun b!319262 () Bool)

(declare-fun res!262296 () Bool)

(assert (=> b!319262 (=> (not res!262296) (not e!229404))))

(declare-datatypes ((array!19902 0))(
  ( (array!19903 (arr!9761 (Array (_ BitVec 32) (_ BitVec 8))) (size!8669 (_ BitVec 32))) )
))
(declare-fun a1!909 () array!19902)

(declare-fun a2!909 () array!19902)

(declare-fun to!869 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19902 array!19902 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!319262 (= res!262296 (arrayBitRangesEq!0 a1!909 a2!909 from!902 to!869))))

(declare-fun res!262294 () Bool)

(assert (=> start!70470 (=> (not res!262294) (not e!229404))))

(assert (=> start!70470 (= res!262294 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!902) (bvsle from!902 to!869) (= (size!8669 a1!909) (size!8669 a2!909)) (bvsle to!869 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8669 a1!909)))) (bvsle from!902 at!309) (bvslt at!309 to!869)))))

(assert (=> start!70470 e!229404))

(assert (=> start!70470 true))

(declare-fun array_inv!8221 (array!19902) Bool)

(assert (=> start!70470 (array_inv!8221 a1!909)))

(assert (=> start!70470 (array_inv!8221 a2!909)))

(declare-fun b!319263 () Bool)

(declare-fun res!262295 () Bool)

(assert (=> b!319263 (=> (not res!262295) (not e!229404))))

(assert (=> b!319263 (= res!262295 (and (bvsle from!902 i!1041) (bvsle i!1041 at!309)))))

(declare-fun b!319264 () Bool)

(declare-fun res!262297 () Bool)

(assert (=> b!319264 (=> (not res!262297) (not e!229404))))

(assert (=> b!319264 (= res!262297 (arrayBitRangesEq!0 a1!909 a2!909 i!1041 to!869))))

(assert (= (and start!70470 res!262294) b!319262))

(assert (= (and b!319262 res!262296) b!319263))

(assert (= (and b!319263 res!262295) b!319264))

(assert (= (and b!319264 res!262297) b!319265))

(declare-fun m!457525 () Bool)

(assert (=> b!319262 m!457525))

(declare-fun m!457527 () Bool)

(assert (=> start!70470 m!457527))

(declare-fun m!457529 () Bool)

(assert (=> start!70470 m!457529))

(declare-fun m!457531 () Bool)

(assert (=> b!319264 m!457531))

(check-sat (not b!319264) (not start!70470) (not b!319262))
(check-sat)
