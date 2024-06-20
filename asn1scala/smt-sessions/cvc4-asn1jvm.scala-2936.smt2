; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69782 () Bool)

(assert start!69782)

(declare-fun b!314304 () Bool)

(declare-fun res!257451 () Bool)

(declare-fun e!226192 () Bool)

(assert (=> b!314304 (=> (not res!257451) (not e!226192))))

(declare-datatypes ((array!19346 0))(
  ( (array!19347 (arr!9477 (Array (_ BitVec 32) (_ BitVec 8))) (size!8397 (_ BitVec 32))) )
))
(declare-fun a3!79 () array!19346)

(declare-fun a2!825 () array!19346)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19346 array!19346 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!314304 (= res!257451 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!314305 () Bool)

(declare-fun res!257454 () Bool)

(assert (=> b!314305 (=> (not res!257454) (not e!226192))))

(declare-fun mid!82 () (_ BitVec 64))

(assert (=> b!314305 (= res!257454 (not (= i!1020 mid!82)))))

(declare-fun b!314306 () Bool)

(declare-fun res!257453 () Bool)

(assert (=> b!314306 (=> (not res!257453) (not e!226192))))

(declare-fun from!878 () (_ BitVec 64))

(assert (=> b!314306 (= res!257453 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun res!257449 () Bool)

(assert (=> start!69782 (=> (not res!257449) (not e!226192))))

(declare-fun a1!825 () array!19346)

(assert (=> start!69782 (= res!257449 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8397 a1!825) (size!8397 a2!825)) (= (size!8397 a2!825) (size!8397 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8397 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8397 a2!825))))))))

(assert (=> start!69782 e!226192))

(assert (=> start!69782 true))

(declare-fun array_inv!7949 (array!19346) Bool)

(assert (=> start!69782 (array_inv!7949 a1!825)))

(assert (=> start!69782 (array_inv!7949 a3!79)))

(assert (=> start!69782 (array_inv!7949 a2!825)))

(declare-fun b!314303 () Bool)

(declare-fun res!257450 () Bool)

(assert (=> b!314303 (=> (not res!257450) (not e!226192))))

(assert (=> b!314303 (= res!257450 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!314307 () Bool)

(assert (=> b!314307 (= e!226192 (not true))))

(assert (=> b!314307 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-datatypes ((Unit!21585 0))(
  ( (Unit!21586) )
))
(declare-fun lt!442412 () Unit!21585)

(declare-fun arrayBitRangesEqDrop1!0 (array!19346 array!19346 (_ BitVec 64) (_ BitVec 64)) Unit!21585)

(assert (=> b!314307 (= lt!442412 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(assert (=> b!314307 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442411 () Unit!21585)

(declare-fun arrayBitRangesEqAppend!0 (array!19346 array!19346 (_ BitVec 64) (_ BitVec 64)) Unit!21585)

(assert (=> b!314307 (= lt!442411 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314308 () Bool)

(declare-fun res!257452 () Bool)

(assert (=> b!314308 (=> (not res!257452) (not e!226192))))

(assert (=> b!314308 (= res!257452 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!314309 () Bool)

(declare-fun res!257456 () Bool)

(assert (=> b!314309 (=> (not res!257456) (not e!226192))))

(assert (=> b!314309 (= res!257456 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!314310 () Bool)

(declare-fun res!257455 () Bool)

(assert (=> b!314310 (=> (not res!257455) (not e!226192))))

(assert (=> b!314310 (= res!257455 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(assert (= (and start!69782 res!257449) b!314303))

(assert (= (and b!314303 res!257450) b!314306))

(assert (= (and b!314306 res!257453) b!314309))

(assert (= (and b!314309 res!257456) b!314308))

(assert (= (and b!314308 res!257452) b!314304))

(assert (= (and b!314304 res!257451) b!314310))

(assert (= (and b!314310 res!257455) b!314305))

(assert (= (and b!314305 res!257454) b!314307))

(declare-fun m!451853 () Bool)

(assert (=> b!314304 m!451853))

(declare-fun m!451855 () Bool)

(assert (=> b!314310 m!451855))

(declare-fun m!451857 () Bool)

(assert (=> b!314306 m!451857))

(declare-fun m!451859 () Bool)

(assert (=> b!314303 m!451859))

(declare-fun m!451861 () Bool)

(assert (=> start!69782 m!451861))

(declare-fun m!451863 () Bool)

(assert (=> start!69782 m!451863))

(declare-fun m!451865 () Bool)

(assert (=> start!69782 m!451865))

(declare-fun m!451867 () Bool)

(assert (=> b!314307 m!451867))

(declare-fun m!451869 () Bool)

(assert (=> b!314307 m!451869))

(declare-fun m!451871 () Bool)

(assert (=> b!314307 m!451871))

(declare-fun m!451873 () Bool)

(assert (=> b!314307 m!451873))

(declare-fun m!451875 () Bool)

(assert (=> b!314308 m!451875))

(push 1)

(assert (not b!314310))

(assert (not b!314306))

(assert (not b!314308))

(assert (not start!69782))

(assert (not b!314303))

(assert (not b!314307))

(assert (not b!314304))

(check-sat)

(pop 1)

(push 1)

(check-sat)

