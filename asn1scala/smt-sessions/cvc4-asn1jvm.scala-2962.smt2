; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69974 () Bool)

(assert start!69974)

(declare-fun b!316346 () Bool)

(declare-fun e!227317 () Bool)

(assert (=> b!316346 (= e!227317 (not true))))

(declare-datatypes ((array!19505 0))(
  ( (array!19506 (arr!9558 (Array (_ BitVec 32) (_ BitVec 8))) (size!8475 (_ BitVec 32))) )
))
(declare-fun a3!79 () array!19505)

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun a2!825 () array!19505)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19505 array!19505 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!316346 (arrayBitRangesEq!0 a2!825 a3!79 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) to!845)))

(declare-datatypes ((Unit!21705 0))(
  ( (Unit!21706) )
))
(declare-fun lt!442905 () Unit!21705)

(declare-fun arrayBitRangesEqDrop1!0 (array!19505 array!19505 (_ BitVec 64) (_ BitVec 64)) Unit!21705)

(assert (=> b!316346 (= lt!442905 (arrayBitRangesEqDrop1!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-fun a1!825 () array!19505)

(assert (=> b!316346 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-fun lt!442907 () Unit!21705)

(assert (=> b!316346 (= lt!442907 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun from!878 () (_ BitVec 64))

(assert (=> b!316346 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442906 () Unit!21705)

(declare-fun arrayBitRangesEqAppend!0 (array!19505 array!19505 (_ BitVec 64) (_ BitVec 64)) Unit!21705)

(assert (=> b!316346 (= lt!442906 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun res!259455 () Bool)

(assert (=> start!69974 (=> (not res!259455) (not e!227317))))

(assert (=> start!69974 (= res!259455 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8475 a1!825) (size!8475 a2!825)) (= (size!8475 a2!825) (size!8475 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8475 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8475 a2!825))))))))

(assert (=> start!69974 e!227317))

(assert (=> start!69974 true))

(declare-fun array_inv!8027 (array!19505) Bool)

(assert (=> start!69974 (array_inv!8027 a1!825)))

(assert (=> start!69974 (array_inv!8027 a3!79)))

(assert (=> start!69974 (array_inv!8027 a2!825)))

(declare-fun b!316347 () Bool)

(declare-fun res!259452 () Bool)

(assert (=> b!316347 (=> (not res!259452) (not e!227317))))

(assert (=> b!316347 (= res!259452 (not (= i!1020 mid!82)))))

(declare-fun b!316348 () Bool)

(declare-fun res!259453 () Bool)

(assert (=> b!316348 (=> (not res!259453) (not e!227317))))

(assert (=> b!316348 (= res!259453 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!316349 () Bool)

(declare-fun res!259457 () Bool)

(assert (=> b!316349 (=> (not res!259457) (not e!227317))))

(assert (=> b!316349 (= res!259457 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!316350 () Bool)

(declare-fun res!259451 () Bool)

(assert (=> b!316350 (=> (not res!259451) (not e!227317))))

(assert (=> b!316350 (= res!259451 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!316351 () Bool)

(declare-fun res!259456 () Bool)

(assert (=> b!316351 (=> (not res!259456) (not e!227317))))

(assert (=> b!316351 (= res!259456 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!316352 () Bool)

(declare-fun res!259450 () Bool)

(assert (=> b!316352 (=> (not res!259450) (not e!227317))))

(assert (=> b!316352 (= res!259450 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!316353 () Bool)

(declare-fun res!259454 () Bool)

(assert (=> b!316353 (=> (not res!259454) (not e!227317))))

(assert (=> b!316353 (= res!259454 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(assert (= (and start!69974 res!259455) b!316349))

(assert (= (and b!316349 res!259457) b!316353))

(assert (= (and b!316353 res!259454) b!316350))

(assert (= (and b!316350 res!259451) b!316348))

(assert (= (and b!316348 res!259453) b!316352))

(assert (= (and b!316352 res!259450) b!316351))

(assert (= (and b!316351 res!259456) b!316347))

(assert (= (and b!316347 res!259452) b!316346))

(declare-fun m!454135 () Bool)

(assert (=> b!316352 m!454135))

(declare-fun m!454137 () Bool)

(assert (=> b!316348 m!454137))

(declare-fun m!454139 () Bool)

(assert (=> b!316353 m!454139))

(declare-fun m!454141 () Bool)

(assert (=> b!316349 m!454141))

(declare-fun m!454143 () Bool)

(assert (=> b!316351 m!454143))

(declare-fun m!454145 () Bool)

(assert (=> b!316346 m!454145))

(declare-fun m!454147 () Bool)

(assert (=> b!316346 m!454147))

(declare-fun m!454149 () Bool)

(assert (=> b!316346 m!454149))

(declare-fun m!454151 () Bool)

(assert (=> b!316346 m!454151))

(declare-fun m!454153 () Bool)

(assert (=> b!316346 m!454153))

(declare-fun m!454155 () Bool)

(assert (=> b!316346 m!454155))

(declare-fun m!454157 () Bool)

(assert (=> start!69974 m!454157))

(declare-fun m!454159 () Bool)

(assert (=> start!69974 m!454159))

(declare-fun m!454161 () Bool)

(assert (=> start!69974 m!454161))

(push 1)

(assert (not b!316352))

(assert (not b!316349))

(assert (not b!316348))

(assert (not b!316351))

(assert (not b!316353))

(assert (not b!316346))

(assert (not start!69974))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

