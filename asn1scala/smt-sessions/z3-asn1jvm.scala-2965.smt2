; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69990 () Bool)

(assert start!69990)

(declare-fun b!316543 () Bool)

(declare-fun res!259654 () Bool)

(declare-fun e!227418 () Bool)

(assert (=> b!316543 (=> (not res!259654) (not e!227418))))

(declare-datatypes ((array!19521 0))(
  ( (array!19522 (arr!9566 (Array (_ BitVec 32) (_ BitVec 8))) (size!8483 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19521)

(declare-fun a3!79 () array!19521)

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19521 array!19521 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!316543 (= res!259654 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!316544 () Bool)

(declare-fun res!259648 () Bool)

(assert (=> b!316544 (=> (not res!259648) (not e!227418))))

(declare-fun mid!82 () (_ BitVec 64))

(assert (=> b!316544 (= res!259648 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!316545 () Bool)

(declare-fun res!259649 () Bool)

(assert (=> b!316545 (=> (not res!259649) (not e!227418))))

(assert (=> b!316545 (= res!259649 (not (= i!1020 mid!82)))))

(declare-fun b!316547 () Bool)

(declare-fun res!259653 () Bool)

(assert (=> b!316547 (=> (not res!259653) (not e!227418))))

(declare-fun a2!825 () array!19521)

(assert (=> b!316547 (= res!259653 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!316548 () Bool)

(declare-fun res!259655 () Bool)

(assert (=> b!316548 (=> (not res!259655) (not e!227418))))

(declare-fun to!845 () (_ BitVec 64))

(assert (=> b!316548 (= res!259655 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!316549 () Bool)

(declare-fun res!259650 () Bool)

(assert (=> b!316549 (=> (not res!259650) (not e!227418))))

(assert (=> b!316549 (= res!259650 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!316550 () Bool)

(declare-fun e!227415 () Bool)

(assert (=> b!316550 (= e!227415 true)))

(assert (=> b!316550 (arrayBitRangesEq!0 a1!825 a3!79 from!878 mid!82)))

(declare-datatypes ((Unit!21721 0))(
  ( (Unit!21722) )
))
(declare-fun lt!442983 () Unit!21721)

(declare-fun rec!20 (array!19521 array!19521 array!19521 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21721)

(assert (=> b!316550 (= lt!442983 (rec!20 a1!825 a2!825 a3!79 from!878 mid!82 to!845 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020)))))

(declare-fun b!316551 () Bool)

(assert (=> b!316551 (= e!227418 (not e!227415))))

(declare-fun res!259652 () Bool)

(assert (=> b!316551 (=> res!259652 e!227415)))

(assert (=> b!316551 (= res!259652 (or (bvsgt from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020)) (bvsgt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))))

(assert (=> b!316551 (arrayBitRangesEq!0 a2!825 a3!79 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) to!845)))

(declare-fun lt!442985 () Unit!21721)

(declare-fun arrayBitRangesEqDrop1!0 (array!19521 array!19521 (_ BitVec 64) (_ BitVec 64)) Unit!21721)

(assert (=> b!316551 (= lt!442985 (arrayBitRangesEqDrop1!0 a2!825 a3!79 i!1020 to!845))))

(assert (=> b!316551 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-fun lt!442982 () Unit!21721)

(assert (=> b!316551 (= lt!442982 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(assert (=> b!316551 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442984 () Unit!21721)

(declare-fun arrayBitRangesEqAppend!0 (array!19521 array!19521 (_ BitVec 64) (_ BitVec 64)) Unit!21721)

(assert (=> b!316551 (= lt!442984 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!316546 () Bool)

(declare-fun res!259647 () Bool)

(assert (=> b!316546 (=> (not res!259647) (not e!227418))))

(assert (=> b!316546 (= res!259647 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun res!259651 () Bool)

(assert (=> start!69990 (=> (not res!259651) (not e!227418))))

(assert (=> start!69990 (= res!259651 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8483 a1!825) (size!8483 a2!825)) (= (size!8483 a2!825) (size!8483 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8483 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8483 a2!825))))))))

(assert (=> start!69990 e!227418))

(assert (=> start!69990 true))

(declare-fun array_inv!8035 (array!19521) Bool)

(assert (=> start!69990 (array_inv!8035 a1!825)))

(assert (=> start!69990 (array_inv!8035 a3!79)))

(assert (=> start!69990 (array_inv!8035 a2!825)))

(assert (= (and start!69990 res!259651) b!316549))

(assert (= (and b!316549 res!259650) b!316546))

(assert (= (and b!316546 res!259647) b!316544))

(assert (= (and b!316544 res!259648) b!316547))

(assert (= (and b!316547 res!259653) b!316548))

(assert (= (and b!316548 res!259655) b!316543))

(assert (= (and b!316543 res!259654) b!316545))

(assert (= (and b!316545 res!259649) b!316551))

(assert (= (and b!316551 (not res!259652)) b!316550))

(declare-fun m!454363 () Bool)

(assert (=> b!316548 m!454363))

(declare-fun m!454365 () Bool)

(assert (=> b!316547 m!454365))

(declare-fun m!454367 () Bool)

(assert (=> b!316551 m!454367))

(declare-fun m!454369 () Bool)

(assert (=> b!316551 m!454369))

(declare-fun m!454371 () Bool)

(assert (=> b!316551 m!454371))

(declare-fun m!454373 () Bool)

(assert (=> b!316551 m!454373))

(declare-fun m!454375 () Bool)

(assert (=> b!316551 m!454375))

(declare-fun m!454377 () Bool)

(assert (=> b!316551 m!454377))

(declare-fun m!454379 () Bool)

(assert (=> b!316550 m!454379))

(declare-fun m!454381 () Bool)

(assert (=> b!316550 m!454381))

(declare-fun m!454383 () Bool)

(assert (=> start!69990 m!454383))

(declare-fun m!454385 () Bool)

(assert (=> start!69990 m!454385))

(declare-fun m!454387 () Bool)

(assert (=> start!69990 m!454387))

(declare-fun m!454389 () Bool)

(assert (=> b!316549 m!454389))

(declare-fun m!454391 () Bool)

(assert (=> b!316543 m!454391))

(declare-fun m!454393 () Bool)

(assert (=> b!316546 m!454393))

(check-sat (not b!316551) (not b!316546) (not start!69990) (not b!316543) (not b!316549) (not b!316550) (not b!316547) (not b!316548))
