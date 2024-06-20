; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69826 () Bool)

(assert start!69826)

(declare-fun b!314842 () Bool)

(declare-fun e!226470 () Bool)

(assert (=> b!314842 (= e!226470 true)))

(declare-fun mid!82 () (_ BitVec 64))

(declare-datatypes ((array!19390 0))(
  ( (array!19391 (arr!9499 (Array (_ BitVec 32) (_ BitVec 8))) (size!8419 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19390)

(declare-fun a3!79 () array!19390)

(declare-fun from!878 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19390 array!19390 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!314842 (arrayBitRangesEq!0 a1!825 a3!79 from!878 mid!82)))

(declare-fun i!1020 () (_ BitVec 64))

(declare-datatypes ((Unit!21629 0))(
  ( (Unit!21630) )
))
(declare-fun lt!442601 () Unit!21629)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun a2!825 () array!19390)

(declare-fun rec!20 (array!19390 array!19390 array!19390 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21629)

(assert (=> b!314842 (= lt!442601 (rec!20 a1!825 a2!825 a3!79 from!878 mid!82 to!845 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020)))))

(declare-fun b!314843 () Bool)

(declare-fun res!257996 () Bool)

(declare-fun e!226471 () Bool)

(assert (=> b!314843 (=> (not res!257996) (not e!226471))))

(assert (=> b!314843 (= res!257996 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!314845 () Bool)

(declare-fun res!257991 () Bool)

(assert (=> b!314845 (=> (not res!257991) (not e!226471))))

(assert (=> b!314845 (= res!257991 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!314846 () Bool)

(declare-fun res!257995 () Bool)

(assert (=> b!314846 (=> (not res!257995) (not e!226471))))

(assert (=> b!314846 (= res!257995 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!314847 () Bool)

(assert (=> b!314847 (= e!226471 (not e!226470))))

(declare-fun res!257993 () Bool)

(assert (=> b!314847 (=> res!257993 e!226470)))

(assert (=> b!314847 (= res!257993 (or (bvsgt from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020)) (bvsgt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))))

(assert (=> b!314847 (arrayBitRangesEq!0 a2!825 a3!79 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) to!845)))

(declare-fun lt!442602 () Unit!21629)

(declare-fun arrayBitRangesEqDrop1!0 (array!19390 array!19390 (_ BitVec 64) (_ BitVec 64)) Unit!21629)

(assert (=> b!314847 (= lt!442602 (arrayBitRangesEqDrop1!0 a2!825 a3!79 i!1020 to!845))))

(assert (=> b!314847 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-fun lt!442603 () Unit!21629)

(assert (=> b!314847 (= lt!442603 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(assert (=> b!314847 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442604 () Unit!21629)

(declare-fun arrayBitRangesEqAppend!0 (array!19390 array!19390 (_ BitVec 64) (_ BitVec 64)) Unit!21629)

(assert (=> b!314847 (= lt!442604 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314848 () Bool)

(declare-fun res!257990 () Bool)

(assert (=> b!314848 (=> (not res!257990) (not e!226471))))

(assert (=> b!314848 (= res!257990 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!314849 () Bool)

(declare-fun res!257989 () Bool)

(assert (=> b!314849 (=> (not res!257989) (not e!226471))))

(assert (=> b!314849 (= res!257989 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!314850 () Bool)

(declare-fun res!257992 () Bool)

(assert (=> b!314850 (=> (not res!257992) (not e!226471))))

(assert (=> b!314850 (= res!257992 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun res!257988 () Bool)

(assert (=> start!69826 (=> (not res!257988) (not e!226471))))

(assert (=> start!69826 (= res!257988 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8419 a1!825) (size!8419 a2!825)) (= (size!8419 a2!825) (size!8419 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8419 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8419 a2!825))))))))

(assert (=> start!69826 e!226471))

(assert (=> start!69826 true))

(declare-fun array_inv!7971 (array!19390) Bool)

(assert (=> start!69826 (array_inv!7971 a1!825)))

(assert (=> start!69826 (array_inv!7971 a3!79)))

(assert (=> start!69826 (array_inv!7971 a2!825)))

(declare-fun b!314844 () Bool)

(declare-fun res!257994 () Bool)

(assert (=> b!314844 (=> (not res!257994) (not e!226471))))

(assert (=> b!314844 (= res!257994 (not (= i!1020 mid!82)))))

(assert (= (and start!69826 res!257988) b!314845))

(assert (= (and b!314845 res!257991) b!314849))

(assert (= (and b!314849 res!257989) b!314843))

(assert (= (and b!314843 res!257996) b!314848))

(assert (= (and b!314848 res!257990) b!314846))

(assert (= (and b!314846 res!257995) b!314850))

(assert (= (and b!314850 res!257992) b!314844))

(assert (= (and b!314844 res!257994) b!314847))

(assert (= (and b!314847 (not res!257993)) b!314842))

(declare-fun m!452453 () Bool)

(assert (=> b!314842 m!452453))

(declare-fun m!452455 () Bool)

(assert (=> b!314842 m!452455))

(declare-fun m!452457 () Bool)

(assert (=> b!314845 m!452457))

(declare-fun m!452459 () Bool)

(assert (=> b!314847 m!452459))

(declare-fun m!452461 () Bool)

(assert (=> b!314847 m!452461))

(declare-fun m!452463 () Bool)

(assert (=> b!314847 m!452463))

(declare-fun m!452465 () Bool)

(assert (=> b!314847 m!452465))

(declare-fun m!452467 () Bool)

(assert (=> b!314847 m!452467))

(declare-fun m!452469 () Bool)

(assert (=> b!314847 m!452469))

(declare-fun m!452471 () Bool)

(assert (=> start!69826 m!452471))

(declare-fun m!452473 () Bool)

(assert (=> start!69826 m!452473))

(declare-fun m!452475 () Bool)

(assert (=> start!69826 m!452475))

(declare-fun m!452477 () Bool)

(assert (=> b!314846 m!452477))

(declare-fun m!452479 () Bool)

(assert (=> b!314848 m!452479))

(declare-fun m!452481 () Bool)

(assert (=> b!314850 m!452481))

(declare-fun m!452483 () Bool)

(assert (=> b!314849 m!452483))

(push 1)

(assert (not b!314848))

(assert (not b!314846))

(assert (not b!314849))

(assert (not b!314850))

(assert (not b!314842))

(assert (not start!69826))

(assert (not b!314845))

(assert (not b!314847))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

