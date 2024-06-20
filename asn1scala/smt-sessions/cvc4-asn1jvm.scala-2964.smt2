; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69986 () Bool)

(assert start!69986)

(declare-fun mid!82 () (_ BitVec 64))

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun e!227386 () Bool)

(declare-fun b!316490 () Bool)

(declare-fun from!878 () (_ BitVec 64))

(declare-fun to!845 () (_ BitVec 64))

(assert (=> b!316490 (= e!227386 (not (or (bvsgt from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020)) (bvsgt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82) (bvslt (bvsub to!845 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020)) (bvsub to!845 i!1020)))))))

(declare-datatypes ((array!19517 0))(
  ( (array!19518 (arr!9564 (Array (_ BitVec 32) (_ BitVec 8))) (size!8481 (_ BitVec 32))) )
))
(declare-fun a3!79 () array!19517)

(declare-fun a2!825 () array!19517)

(declare-fun arrayBitRangesEq!0 (array!19517 array!19517 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!316490 (arrayBitRangesEq!0 a2!825 a3!79 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) to!845)))

(declare-datatypes ((Unit!21717 0))(
  ( (Unit!21718) )
))
(declare-fun lt!442960 () Unit!21717)

(declare-fun arrayBitRangesEqDrop1!0 (array!19517 array!19517 (_ BitVec 64) (_ BitVec 64)) Unit!21717)

(assert (=> b!316490 (= lt!442960 (arrayBitRangesEqDrop1!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun a1!825 () array!19517)

(assert (=> b!316490 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-fun lt!442959 () Unit!21717)

(assert (=> b!316490 (= lt!442959 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(assert (=> b!316490 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442961 () Unit!21717)

(declare-fun arrayBitRangesEqAppend!0 (array!19517 array!19517 (_ BitVec 64) (_ BitVec 64)) Unit!21717)

(assert (=> b!316490 (= lt!442961 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!316491 () Bool)

(declare-fun res!259595 () Bool)

(assert (=> b!316491 (=> (not res!259595) (not e!227386))))

(assert (=> b!316491 (= res!259595 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!316492 () Bool)

(declare-fun res!259601 () Bool)

(assert (=> b!316492 (=> (not res!259601) (not e!227386))))

(assert (=> b!316492 (= res!259601 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!316493 () Bool)

(declare-fun res!259600 () Bool)

(assert (=> b!316493 (=> (not res!259600) (not e!227386))))

(assert (=> b!316493 (= res!259600 (not (= i!1020 mid!82)))))

(declare-fun b!316494 () Bool)

(declare-fun res!259594 () Bool)

(assert (=> b!316494 (=> (not res!259594) (not e!227386))))

(assert (=> b!316494 (= res!259594 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!316495 () Bool)

(declare-fun res!259598 () Bool)

(assert (=> b!316495 (=> (not res!259598) (not e!227386))))

(assert (=> b!316495 (= res!259598 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!316496 () Bool)

(declare-fun res!259597 () Bool)

(assert (=> b!316496 (=> (not res!259597) (not e!227386))))

(assert (=> b!316496 (= res!259597 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun res!259599 () Bool)

(assert (=> start!69986 (=> (not res!259599) (not e!227386))))

(assert (=> start!69986 (= res!259599 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8481 a1!825) (size!8481 a2!825)) (= (size!8481 a2!825) (size!8481 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8481 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8481 a2!825))))))))

(assert (=> start!69986 e!227386))

(assert (=> start!69986 true))

(declare-fun array_inv!8033 (array!19517) Bool)

(assert (=> start!69986 (array_inv!8033 a1!825)))

(assert (=> start!69986 (array_inv!8033 a3!79)))

(assert (=> start!69986 (array_inv!8033 a2!825)))

(declare-fun b!316497 () Bool)

(declare-fun res!259596 () Bool)

(assert (=> b!316497 (=> (not res!259596) (not e!227386))))

(assert (=> b!316497 (= res!259596 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(assert (= (and start!69986 res!259599) b!316491))

(assert (= (and b!316491 res!259595) b!316497))

(assert (= (and b!316497 res!259596) b!316492))

(assert (= (and b!316492 res!259601) b!316496))

(assert (= (and b!316496 res!259597) b!316494))

(assert (= (and b!316494 res!259594) b!316495))

(assert (= (and b!316495 res!259598) b!316493))

(assert (= (and b!316493 res!259600) b!316490))

(declare-fun m!454303 () Bool)

(assert (=> b!316491 m!454303))

(declare-fun m!454305 () Bool)

(assert (=> start!69986 m!454305))

(declare-fun m!454307 () Bool)

(assert (=> start!69986 m!454307))

(declare-fun m!454309 () Bool)

(assert (=> start!69986 m!454309))

(declare-fun m!454311 () Bool)

(assert (=> b!316496 m!454311))

(declare-fun m!454313 () Bool)

(assert (=> b!316490 m!454313))

(declare-fun m!454315 () Bool)

(assert (=> b!316490 m!454315))

(declare-fun m!454317 () Bool)

(assert (=> b!316490 m!454317))

(declare-fun m!454319 () Bool)

(assert (=> b!316490 m!454319))

(declare-fun m!454321 () Bool)

(assert (=> b!316490 m!454321))

(declare-fun m!454323 () Bool)

(assert (=> b!316490 m!454323))

(declare-fun m!454325 () Bool)

(assert (=> b!316494 m!454325))

(declare-fun m!454327 () Bool)

(assert (=> b!316497 m!454327))

(declare-fun m!454329 () Bool)

(assert (=> b!316495 m!454329))

(push 1)

(assert (not b!316496))

(assert (not b!316495))

(assert (not b!316497))

(assert (not b!316491))

(assert (not b!316490))

(assert (not start!69986))

(assert (not b!316494))

(check-sat)

(pop 1)

(push 1)

(check-sat)

