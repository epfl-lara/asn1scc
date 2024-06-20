; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69970 () Bool)

(assert start!69970)

(declare-fun b!316298 () Bool)

(declare-fun res!259403 () Bool)

(declare-fun e!227293 () Bool)

(assert (=> b!316298 (=> (not res!259403) (not e!227293))))

(declare-datatypes ((array!19501 0))(
  ( (array!19502 (arr!9556 (Array (_ BitVec 32) (_ BitVec 8))) (size!8473 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19501)

(declare-fun a3!79 () array!19501)

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19501 array!19501 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!316298 (= res!259403 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!316299 () Bool)

(declare-fun res!259409 () Bool)

(assert (=> b!316299 (=> (not res!259409) (not e!227293))))

(declare-fun a2!825 () array!19501)

(declare-fun to!845 () (_ BitVec 64))

(assert (=> b!316299 (= res!259409 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!316300 () Bool)

(assert (=> b!316300 (= e!227293 (not true))))

(assert (=> b!316300 (arrayBitRangesEq!0 a2!825 a3!79 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) to!845)))

(declare-datatypes ((Unit!21701 0))(
  ( (Unit!21702) )
))
(declare-fun lt!442888 () Unit!21701)

(declare-fun arrayBitRangesEqDrop1!0 (array!19501 array!19501 (_ BitVec 64) (_ BitVec 64)) Unit!21701)

(assert (=> b!316300 (= lt!442888 (arrayBitRangesEqDrop1!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun mid!82 () (_ BitVec 64))

(assert (=> b!316300 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-fun lt!442889 () Unit!21701)

(assert (=> b!316300 (= lt!442889 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(assert (=> b!316300 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442887 () Unit!21701)

(declare-fun arrayBitRangesEqAppend!0 (array!19501 array!19501 (_ BitVec 64) (_ BitVec 64)) Unit!21701)

(assert (=> b!316300 (= lt!442887 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!316301 () Bool)

(declare-fun res!259404 () Bool)

(assert (=> b!316301 (=> (not res!259404) (not e!227293))))

(assert (=> b!316301 (= res!259404 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!316302 () Bool)

(declare-fun res!259408 () Bool)

(assert (=> b!316302 (=> (not res!259408) (not e!227293))))

(assert (=> b!316302 (= res!259408 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!316303 () Bool)

(declare-fun res!259407 () Bool)

(assert (=> b!316303 (=> (not res!259407) (not e!227293))))

(assert (=> b!316303 (= res!259407 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!316304 () Bool)

(declare-fun res!259406 () Bool)

(assert (=> b!316304 (=> (not res!259406) (not e!227293))))

(assert (=> b!316304 (= res!259406 (not (= i!1020 mid!82)))))

(declare-fun res!259402 () Bool)

(assert (=> start!69970 (=> (not res!259402) (not e!227293))))

(assert (=> start!69970 (= res!259402 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8473 a1!825) (size!8473 a2!825)) (= (size!8473 a2!825) (size!8473 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8473 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8473 a2!825))))))))

(assert (=> start!69970 e!227293))

(assert (=> start!69970 true))

(declare-fun array_inv!8025 (array!19501) Bool)

(assert (=> start!69970 (array_inv!8025 a1!825)))

(assert (=> start!69970 (array_inv!8025 a3!79)))

(assert (=> start!69970 (array_inv!8025 a2!825)))

(declare-fun b!316305 () Bool)

(declare-fun res!259405 () Bool)

(assert (=> b!316305 (=> (not res!259405) (not e!227293))))

(assert (=> b!316305 (= res!259405 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(assert (= (and start!69970 res!259402) b!316303))

(assert (= (and b!316303 res!259407) b!316305))

(assert (= (and b!316305 res!259405) b!316302))

(assert (= (and b!316302 res!259408) b!316301))

(assert (= (and b!316301 res!259404) b!316299))

(assert (= (and b!316299 res!259409) b!316298))

(assert (= (and b!316298 res!259403) b!316304))

(assert (= (and b!316304 res!259406) b!316300))

(declare-fun m!454079 () Bool)

(assert (=> b!316303 m!454079))

(declare-fun m!454081 () Bool)

(assert (=> start!69970 m!454081))

(declare-fun m!454083 () Bool)

(assert (=> start!69970 m!454083))

(declare-fun m!454085 () Bool)

(assert (=> start!69970 m!454085))

(declare-fun m!454087 () Bool)

(assert (=> b!316299 m!454087))

(declare-fun m!454089 () Bool)

(assert (=> b!316301 m!454089))

(declare-fun m!454091 () Bool)

(assert (=> b!316298 m!454091))

(declare-fun m!454093 () Bool)

(assert (=> b!316300 m!454093))

(declare-fun m!454095 () Bool)

(assert (=> b!316300 m!454095))

(declare-fun m!454097 () Bool)

(assert (=> b!316300 m!454097))

(declare-fun m!454099 () Bool)

(assert (=> b!316300 m!454099))

(declare-fun m!454101 () Bool)

(assert (=> b!316300 m!454101))

(declare-fun m!454103 () Bool)

(assert (=> b!316300 m!454103))

(declare-fun m!454105 () Bool)

(assert (=> b!316305 m!454105))

(push 1)

(assert (not b!316300))

(assert (not start!69970))

(assert (not b!316303))

(assert (not b!316299))

(assert (not b!316301))

(assert (not b!316305))

(assert (not b!316298))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

