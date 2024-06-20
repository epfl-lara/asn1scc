; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69966 () Bool)

(assert start!69966)

(declare-fun b!316250 () Bool)

(declare-fun res!259361 () Bool)

(declare-fun e!227266 () Bool)

(assert (=> b!316250 (=> (not res!259361) (not e!227266))))

(declare-datatypes ((array!19497 0))(
  ( (array!19498 (arr!9554 (Array (_ BitVec 32) (_ BitVec 8))) (size!8471 (_ BitVec 32))) )
))
(declare-fun a3!79 () array!19497)

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(declare-fun a1!825 () array!19497)

(declare-fun arrayBitRangesEq!0 (array!19497 array!19497 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!316250 (= res!259361 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!316251 () Bool)

(declare-fun res!259358 () Bool)

(assert (=> b!316251 (=> (not res!259358) (not e!227266))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-fun a2!825 () array!19497)

(assert (=> b!316251 (= res!259358 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!316252 () Bool)

(assert (=> b!316252 (= e!227266 (not true))))

(declare-fun to!845 () (_ BitVec 64))

(assert (=> b!316252 (arrayBitRangesEq!0 a2!825 a3!79 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) to!845)))

(declare-datatypes ((Unit!21697 0))(
  ( (Unit!21698) )
))
(declare-fun lt!442870 () Unit!21697)

(declare-fun arrayBitRangesEqDrop1!0 (array!19497 array!19497 (_ BitVec 64) (_ BitVec 64)) Unit!21697)

(assert (=> b!316252 (= lt!442870 (arrayBitRangesEqDrop1!0 a2!825 a3!79 i!1020 to!845))))

(assert (=> b!316252 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-fun lt!442869 () Unit!21697)

(assert (=> b!316252 (= lt!442869 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(assert (=> b!316252 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442871 () Unit!21697)

(declare-fun arrayBitRangesEqAppend!0 (array!19497 array!19497 (_ BitVec 64) (_ BitVec 64)) Unit!21697)

(assert (=> b!316252 (= lt!442871 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!316254 () Bool)

(declare-fun res!259355 () Bool)

(assert (=> b!316254 (=> (not res!259355) (not e!227266))))

(assert (=> b!316254 (= res!259355 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!316255 () Bool)

(declare-fun res!259354 () Bool)

(assert (=> b!316255 (=> (not res!259354) (not e!227266))))

(assert (=> b!316255 (= res!259354 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!316256 () Bool)

(declare-fun res!259360 () Bool)

(assert (=> b!316256 (=> (not res!259360) (not e!227266))))

(assert (=> b!316256 (= res!259360 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!316257 () Bool)

(declare-fun res!259356 () Bool)

(assert (=> b!316257 (=> (not res!259356) (not e!227266))))

(assert (=> b!316257 (= res!259356 (not (= i!1020 mid!82)))))

(declare-fun b!316253 () Bool)

(declare-fun res!259357 () Bool)

(assert (=> b!316253 (=> (not res!259357) (not e!227266))))

(assert (=> b!316253 (= res!259357 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun res!259359 () Bool)

(assert (=> start!69966 (=> (not res!259359) (not e!227266))))

(assert (=> start!69966 (= res!259359 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8471 a1!825) (size!8471 a2!825)) (= (size!8471 a2!825) (size!8471 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8471 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8471 a2!825))))))))

(assert (=> start!69966 e!227266))

(assert (=> start!69966 true))

(declare-fun array_inv!8023 (array!19497) Bool)

(assert (=> start!69966 (array_inv!8023 a1!825)))

(assert (=> start!69966 (array_inv!8023 a3!79)))

(assert (=> start!69966 (array_inv!8023 a2!825)))

(assert (= (and start!69966 res!259359) b!316256))

(assert (= (and b!316256 res!259360) b!316253))

(assert (= (and b!316253 res!259357) b!316254))

(assert (= (and b!316254 res!259355) b!316251))

(assert (= (and b!316251 res!259358) b!316255))

(assert (= (and b!316255 res!259354) b!316250))

(assert (= (and b!316250 res!259361) b!316257))

(assert (= (and b!316257 res!259356) b!316252))

(declare-fun m!454023 () Bool)

(assert (=> b!316252 m!454023))

(declare-fun m!454025 () Bool)

(assert (=> b!316252 m!454025))

(declare-fun m!454027 () Bool)

(assert (=> b!316252 m!454027))

(declare-fun m!454029 () Bool)

(assert (=> b!316252 m!454029))

(declare-fun m!454031 () Bool)

(assert (=> b!316252 m!454031))

(declare-fun m!454033 () Bool)

(assert (=> b!316252 m!454033))

(declare-fun m!454035 () Bool)

(assert (=> b!316251 m!454035))

(declare-fun m!454037 () Bool)

(assert (=> b!316250 m!454037))

(declare-fun m!454039 () Bool)

(assert (=> b!316256 m!454039))

(declare-fun m!454041 () Bool)

(assert (=> start!69966 m!454041))

(declare-fun m!454043 () Bool)

(assert (=> start!69966 m!454043))

(declare-fun m!454045 () Bool)

(assert (=> start!69966 m!454045))

(declare-fun m!454047 () Bool)

(assert (=> b!316253 m!454047))

(declare-fun m!454049 () Bool)

(assert (=> b!316255 m!454049))

(check-sat (not b!316256) (not b!316251) (not b!316252) (not start!69966) (not b!316255) (not b!316250) (not b!316253))
