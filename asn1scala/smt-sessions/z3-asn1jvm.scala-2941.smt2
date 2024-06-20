; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69810 () Bool)

(assert start!69810)

(declare-fun b!314639 () Bool)

(declare-fun res!257785 () Bool)

(declare-fun e!226362 () Bool)

(assert (=> b!314639 (=> (not res!257785) (not e!226362))))

(declare-datatypes ((array!19374 0))(
  ( (array!19375 (arr!9491 (Array (_ BitVec 32) (_ BitVec 8))) (size!8411 (_ BitVec 32))) )
))
(declare-fun a3!79 () array!19374)

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun a2!825 () array!19374)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19374 array!19374 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!314639 (= res!257785 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun res!257788 () Bool)

(assert (=> start!69810 (=> (not res!257788) (not e!226362))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-fun a1!825 () array!19374)

(declare-fun from!878 () (_ BitVec 64))

(assert (=> start!69810 (= res!257788 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8411 a1!825) (size!8411 a2!825)) (= (size!8411 a2!825) (size!8411 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8411 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8411 a2!825))))))))

(assert (=> start!69810 e!226362))

(assert (=> start!69810 true))

(declare-fun array_inv!7963 (array!19374) Bool)

(assert (=> start!69810 (array_inv!7963 a1!825)))

(assert (=> start!69810 (array_inv!7963 a3!79)))

(assert (=> start!69810 (array_inv!7963 a2!825)))

(declare-fun b!314640 () Bool)

(declare-fun res!257792 () Bool)

(assert (=> b!314640 (=> (not res!257792) (not e!226362))))

(assert (=> b!314640 (= res!257792 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!314641 () Bool)

(declare-fun res!257789 () Bool)

(assert (=> b!314641 (=> (not res!257789) (not e!226362))))

(assert (=> b!314641 (= res!257789 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314642 () Bool)

(declare-fun res!257787 () Bool)

(assert (=> b!314642 (=> (not res!257787) (not e!226362))))

(assert (=> b!314642 (= res!257787 (not (= i!1020 mid!82)))))

(declare-fun b!314643 () Bool)

(declare-fun res!257786 () Bool)

(assert (=> b!314643 (=> (not res!257786) (not e!226362))))

(assert (=> b!314643 (= res!257786 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!314644 () Bool)

(assert (=> b!314644 (= e!226362 (not true))))

(assert (=> b!314644 (arrayBitRangesEq!0 a2!825 a3!79 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) to!845)))

(declare-datatypes ((Unit!21613 0))(
  ( (Unit!21614) )
))
(declare-fun lt!442518 () Unit!21613)

(declare-fun arrayBitRangesEqDrop1!0 (array!19374 array!19374 (_ BitVec 64) (_ BitVec 64)) Unit!21613)

(assert (=> b!314644 (= lt!442518 (arrayBitRangesEqDrop1!0 a2!825 a3!79 i!1020 to!845))))

(assert (=> b!314644 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-fun lt!442520 () Unit!21613)

(assert (=> b!314644 (= lt!442520 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(assert (=> b!314644 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442519 () Unit!21613)

(declare-fun arrayBitRangesEqAppend!0 (array!19374 array!19374 (_ BitVec 64) (_ BitVec 64)) Unit!21613)

(assert (=> b!314644 (= lt!442519 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314645 () Bool)

(declare-fun res!257791 () Bool)

(assert (=> b!314645 (=> (not res!257791) (not e!226362))))

(assert (=> b!314645 (= res!257791 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!314646 () Bool)

(declare-fun res!257790 () Bool)

(assert (=> b!314646 (=> (not res!257790) (not e!226362))))

(assert (=> b!314646 (= res!257790 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(assert (= (and start!69810 res!257788) b!314645))

(assert (= (and b!314645 res!257791) b!314640))

(assert (= (and b!314640 res!257792) b!314643))

(assert (= (and b!314643 res!257786) b!314646))

(assert (= (and b!314646 res!257790) b!314639))

(assert (= (and b!314639 res!257785) b!314641))

(assert (= (and b!314641 res!257789) b!314642))

(assert (= (and b!314642 res!257787) b!314644))

(declare-fun m!452217 () Bool)

(assert (=> b!314639 m!452217))

(declare-fun m!452219 () Bool)

(assert (=> b!314640 m!452219))

(declare-fun m!452221 () Bool)

(assert (=> start!69810 m!452221))

(declare-fun m!452223 () Bool)

(assert (=> start!69810 m!452223))

(declare-fun m!452225 () Bool)

(assert (=> start!69810 m!452225))

(declare-fun m!452227 () Bool)

(assert (=> b!314641 m!452227))

(declare-fun m!452229 () Bool)

(assert (=> b!314644 m!452229))

(declare-fun m!452231 () Bool)

(assert (=> b!314644 m!452231))

(declare-fun m!452233 () Bool)

(assert (=> b!314644 m!452233))

(declare-fun m!452235 () Bool)

(assert (=> b!314644 m!452235))

(declare-fun m!452237 () Bool)

(assert (=> b!314644 m!452237))

(declare-fun m!452239 () Bool)

(assert (=> b!314644 m!452239))

(declare-fun m!452241 () Bool)

(assert (=> b!314646 m!452241))

(declare-fun m!452243 () Bool)

(assert (=> b!314645 m!452243))

(check-sat (not b!314639) (not b!314641) (not b!314640) (not b!314646) (not b!314644) (not b!314645) (not start!69810))
