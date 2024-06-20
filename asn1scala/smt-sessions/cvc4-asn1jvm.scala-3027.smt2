; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70472 () Bool)

(assert start!70472)

(declare-fun b!319275 () Bool)

(declare-fun res!262307 () Bool)

(declare-fun e!229411 () Bool)

(assert (=> b!319275 (=> (not res!262307) (not e!229411))))

(declare-fun i!1041 () (_ BitVec 64))

(declare-fun from!902 () (_ BitVec 64))

(declare-fun at!309 () (_ BitVec 64))

(assert (=> b!319275 (= res!262307 (and (bvsle from!902 i!1041) (bvsle i!1041 at!309)))))

(declare-fun b!319277 () Bool)

(assert (=> b!319277 (= e!229411 (and (not (= i!1041 at!309)) (or (bvsgt from!902 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041)) (bvsgt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041) at!309))))))

(declare-fun b!319276 () Bool)

(declare-fun res!262306 () Bool)

(assert (=> b!319276 (=> (not res!262306) (not e!229411))))

(declare-datatypes ((array!19904 0))(
  ( (array!19905 (arr!9762 (Array (_ BitVec 32) (_ BitVec 8))) (size!8670 (_ BitVec 32))) )
))
(declare-fun a1!909 () array!19904)

(declare-fun a2!909 () array!19904)

(declare-fun to!869 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19904 array!19904 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!319276 (= res!262306 (arrayBitRangesEq!0 a1!909 a2!909 i!1041 to!869))))

(declare-fun b!319274 () Bool)

(declare-fun res!262308 () Bool)

(assert (=> b!319274 (=> (not res!262308) (not e!229411))))

(assert (=> b!319274 (= res!262308 (arrayBitRangesEq!0 a1!909 a2!909 from!902 to!869))))

(declare-fun res!262309 () Bool)

(assert (=> start!70472 (=> (not res!262309) (not e!229411))))

(assert (=> start!70472 (= res!262309 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!902) (bvsle from!902 to!869) (= (size!8670 a1!909) (size!8670 a2!909)) (bvsle to!869 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8670 a1!909)))) (bvsle from!902 at!309) (bvslt at!309 to!869)))))

(assert (=> start!70472 e!229411))

(assert (=> start!70472 true))

(declare-fun array_inv!8222 (array!19904) Bool)

(assert (=> start!70472 (array_inv!8222 a1!909)))

(assert (=> start!70472 (array_inv!8222 a2!909)))

(assert (= (and start!70472 res!262309) b!319274))

(assert (= (and b!319274 res!262308) b!319275))

(assert (= (and b!319275 res!262307) b!319276))

(assert (= (and b!319276 res!262306) b!319277))

(declare-fun m!457533 () Bool)

(assert (=> b!319276 m!457533))

(declare-fun m!457535 () Bool)

(assert (=> b!319274 m!457535))

(declare-fun m!457537 () Bool)

(assert (=> start!70472 m!457537))

(declare-fun m!457539 () Bool)

(assert (=> start!70472 m!457539))

(push 1)

(assert (not start!70472))

(assert (not b!319276))

(assert (not b!319274))

(check-sat)

(pop 1)

(push 1)

(check-sat)

