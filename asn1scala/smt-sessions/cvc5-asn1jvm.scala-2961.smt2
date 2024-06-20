; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69964 () Bool)

(assert start!69964)

(declare-fun res!259333 () Bool)

(declare-fun e!227256 () Bool)

(assert (=> start!69964 (=> (not res!259333) (not e!227256))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-datatypes ((array!19495 0))(
  ( (array!19496 (arr!9553 (Array (_ BitVec 32) (_ BitVec 8))) (size!8470 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19495)

(declare-fun a3!79 () array!19495)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(declare-fun a2!825 () array!19495)

(assert (=> start!69964 (= res!259333 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8470 a1!825) (size!8470 a2!825)) (= (size!8470 a2!825) (size!8470 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8470 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8470 a2!825))))))))

(assert (=> start!69964 e!227256))

(assert (=> start!69964 true))

(declare-fun array_inv!8022 (array!19495) Bool)

(assert (=> start!69964 (array_inv!8022 a1!825)))

(assert (=> start!69964 (array_inv!8022 a3!79)))

(assert (=> start!69964 (array_inv!8022 a2!825)))

(declare-fun b!316226 () Bool)

(declare-fun res!259335 () Bool)

(assert (=> b!316226 (=> (not res!259335) (not e!227256))))

(declare-fun i!1020 () (_ BitVec 64))

(assert (=> b!316226 (= res!259335 (not (= i!1020 mid!82)))))

(declare-fun b!316227 () Bool)

(assert (=> b!316227 (= e!227256 (not true))))

(declare-fun arrayBitRangesEq!0 (array!19495 array!19495 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!316227 (arrayBitRangesEq!0 a2!825 a3!79 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) to!845)))

(declare-datatypes ((Unit!21695 0))(
  ( (Unit!21696) )
))
(declare-fun lt!442860 () Unit!21695)

(declare-fun arrayBitRangesEqDrop1!0 (array!19495 array!19495 (_ BitVec 64) (_ BitVec 64)) Unit!21695)

(assert (=> b!316227 (= lt!442860 (arrayBitRangesEqDrop1!0 a2!825 a3!79 i!1020 to!845))))

(assert (=> b!316227 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-fun lt!442861 () Unit!21695)

(assert (=> b!316227 (= lt!442861 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(assert (=> b!316227 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442862 () Unit!21695)

(declare-fun arrayBitRangesEqAppend!0 (array!19495 array!19495 (_ BitVec 64) (_ BitVec 64)) Unit!21695)

(assert (=> b!316227 (= lt!442862 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!316228 () Bool)

(declare-fun res!259331 () Bool)

(assert (=> b!316228 (=> (not res!259331) (not e!227256))))

(assert (=> b!316228 (= res!259331 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!316229 () Bool)

(declare-fun res!259332 () Bool)

(assert (=> b!316229 (=> (not res!259332) (not e!227256))))

(assert (=> b!316229 (= res!259332 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!316230 () Bool)

(declare-fun res!259334 () Bool)

(assert (=> b!316230 (=> (not res!259334) (not e!227256))))

(assert (=> b!316230 (= res!259334 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!316231 () Bool)

(declare-fun res!259330 () Bool)

(assert (=> b!316231 (=> (not res!259330) (not e!227256))))

(assert (=> b!316231 (= res!259330 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!316232 () Bool)

(declare-fun res!259336 () Bool)

(assert (=> b!316232 (=> (not res!259336) (not e!227256))))

(assert (=> b!316232 (= res!259336 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!316233 () Bool)

(declare-fun res!259337 () Bool)

(assert (=> b!316233 (=> (not res!259337) (not e!227256))))

(assert (=> b!316233 (= res!259337 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(assert (= (and start!69964 res!259333) b!316229))

(assert (= (and b!316229 res!259332) b!316230))

(assert (= (and b!316230 res!259334) b!316228))

(assert (= (and b!316228 res!259331) b!316231))

(assert (= (and b!316231 res!259330) b!316233))

(assert (= (and b!316233 res!259337) b!316232))

(assert (= (and b!316232 res!259336) b!316226))

(assert (= (and b!316226 res!259335) b!316227))

(declare-fun m!453995 () Bool)

(assert (=> b!316231 m!453995))

(declare-fun m!453997 () Bool)

(assert (=> b!316232 m!453997))

(declare-fun m!453999 () Bool)

(assert (=> b!316233 m!453999))

(declare-fun m!454001 () Bool)

(assert (=> b!316227 m!454001))

(declare-fun m!454003 () Bool)

(assert (=> b!316227 m!454003))

(declare-fun m!454005 () Bool)

(assert (=> b!316227 m!454005))

(declare-fun m!454007 () Bool)

(assert (=> b!316227 m!454007))

(declare-fun m!454009 () Bool)

(assert (=> b!316227 m!454009))

(declare-fun m!454011 () Bool)

(assert (=> b!316227 m!454011))

(declare-fun m!454013 () Bool)

(assert (=> b!316230 m!454013))

(declare-fun m!454015 () Bool)

(assert (=> start!69964 m!454015))

(declare-fun m!454017 () Bool)

(assert (=> start!69964 m!454017))

(declare-fun m!454019 () Bool)

(assert (=> start!69964 m!454019))

(declare-fun m!454021 () Bool)

(assert (=> b!316229 m!454021))

(push 1)

(assert (not b!316230))

(assert (not b!316233))

(assert (not start!69964))

(assert (not b!316231))

(assert (not b!316232))

(assert (not b!316227))

(assert (not b!316229))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

