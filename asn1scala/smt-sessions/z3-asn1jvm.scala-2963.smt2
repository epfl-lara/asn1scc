; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69978 () Bool)

(assert start!69978)

(declare-fun b!316394 () Bool)

(declare-fun res!259505 () Bool)

(declare-fun e!227340 () Bool)

(assert (=> b!316394 (=> (not res!259505) (not e!227340))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-datatypes ((array!19509 0))(
  ( (array!19510 (arr!9560 (Array (_ BitVec 32) (_ BitVec 8))) (size!8477 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19509)

(declare-fun from!878 () (_ BitVec 64))

(declare-fun a2!825 () array!19509)

(declare-fun arrayBitRangesEq!0 (array!19509 array!19509 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!316394 (= res!259505 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!316396 () Bool)

(declare-fun res!259504 () Bool)

(assert (=> b!316396 (=> (not res!259504) (not e!227340))))

(declare-fun i!1020 () (_ BitVec 64))

(assert (=> b!316396 (= res!259504 (not (= i!1020 mid!82)))))

(declare-fun b!316397 () Bool)

(declare-fun res!259499 () Bool)

(assert (=> b!316397 (=> (not res!259499) (not e!227340))))

(declare-fun a3!79 () array!19509)

(declare-fun to!845 () (_ BitVec 64))

(assert (=> b!316397 (= res!259499 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!316398 () Bool)

(declare-fun res!259502 () Bool)

(assert (=> b!316398 (=> (not res!259502) (not e!227340))))

(assert (=> b!316398 (= res!259502 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!316399 () Bool)

(assert (=> b!316399 (= e!227340 (not true))))

(assert (=> b!316399 (arrayBitRangesEq!0 a2!825 a3!79 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) to!845)))

(declare-datatypes ((Unit!21709 0))(
  ( (Unit!21710) )
))
(declare-fun lt!442923 () Unit!21709)

(declare-fun arrayBitRangesEqDrop1!0 (array!19509 array!19509 (_ BitVec 64) (_ BitVec 64)) Unit!21709)

(assert (=> b!316399 (= lt!442923 (arrayBitRangesEqDrop1!0 a2!825 a3!79 i!1020 to!845))))

(assert (=> b!316399 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-fun lt!442925 () Unit!21709)

(assert (=> b!316399 (= lt!442925 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(assert (=> b!316399 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442924 () Unit!21709)

(declare-fun arrayBitRangesEqAppend!0 (array!19509 array!19509 (_ BitVec 64) (_ BitVec 64)) Unit!21709)

(assert (=> b!316399 (= lt!442924 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!316400 () Bool)

(declare-fun res!259501 () Bool)

(assert (=> b!316400 (=> (not res!259501) (not e!227340))))

(assert (=> b!316400 (= res!259501 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!316401 () Bool)

(declare-fun res!259500 () Bool)

(assert (=> b!316401 (=> (not res!259500) (not e!227340))))

(assert (=> b!316401 (= res!259500 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun res!259503 () Bool)

(assert (=> start!69978 (=> (not res!259503) (not e!227340))))

(assert (=> start!69978 (= res!259503 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8477 a1!825) (size!8477 a2!825)) (= (size!8477 a2!825) (size!8477 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8477 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8477 a2!825))))))))

(assert (=> start!69978 e!227340))

(assert (=> start!69978 true))

(declare-fun array_inv!8029 (array!19509) Bool)

(assert (=> start!69978 (array_inv!8029 a1!825)))

(assert (=> start!69978 (array_inv!8029 a3!79)))

(assert (=> start!69978 (array_inv!8029 a2!825)))

(declare-fun b!316395 () Bool)

(declare-fun res!259498 () Bool)

(assert (=> b!316395 (=> (not res!259498) (not e!227340))))

(assert (=> b!316395 (= res!259498 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(assert (= (and start!69978 res!259503) b!316394))

(assert (= (and b!316394 res!259505) b!316398))

(assert (= (and b!316398 res!259502) b!316400))

(assert (= (and b!316400 res!259501) b!316395))

(assert (= (and b!316395 res!259498) b!316397))

(assert (= (and b!316397 res!259499) b!316401))

(assert (= (and b!316401 res!259500) b!316396))

(assert (= (and b!316396 res!259504) b!316399))

(declare-fun m!454191 () Bool)

(assert (=> b!316401 m!454191))

(declare-fun m!454193 () Bool)

(assert (=> start!69978 m!454193))

(declare-fun m!454195 () Bool)

(assert (=> start!69978 m!454195))

(declare-fun m!454197 () Bool)

(assert (=> start!69978 m!454197))

(declare-fun m!454199 () Bool)

(assert (=> b!316395 m!454199))

(declare-fun m!454201 () Bool)

(assert (=> b!316398 m!454201))

(declare-fun m!454203 () Bool)

(assert (=> b!316397 m!454203))

(declare-fun m!454205 () Bool)

(assert (=> b!316394 m!454205))

(declare-fun m!454207 () Bool)

(assert (=> b!316399 m!454207))

(declare-fun m!454209 () Bool)

(assert (=> b!316399 m!454209))

(declare-fun m!454211 () Bool)

(assert (=> b!316399 m!454211))

(declare-fun m!454213 () Bool)

(assert (=> b!316399 m!454213))

(declare-fun m!454215 () Bool)

(assert (=> b!316399 m!454215))

(declare-fun m!454217 () Bool)

(assert (=> b!316399 m!454217))

(check-sat (not start!69978) (not b!316394) (not b!316395) (not b!316397) (not b!316399) (not b!316398) (not b!316401))
