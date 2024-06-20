; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69972 () Bool)

(assert start!69972)

(declare-fun res!259432 () Bool)

(declare-fun e!227305 () Bool)

(assert (=> start!69972 (=> (not res!259432) (not e!227305))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-datatypes ((array!19503 0))(
  ( (array!19504 (arr!9557 (Array (_ BitVec 32) (_ BitVec 8))) (size!8474 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19503)

(declare-fun a3!79 () array!19503)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(declare-fun a2!825 () array!19503)

(assert (=> start!69972 (= res!259432 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8474 a1!825) (size!8474 a2!825)) (= (size!8474 a2!825) (size!8474 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8474 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8474 a2!825))))))))

(assert (=> start!69972 e!227305))

(assert (=> start!69972 true))

(declare-fun array_inv!8026 (array!19503) Bool)

(assert (=> start!69972 (array_inv!8026 a1!825)))

(assert (=> start!69972 (array_inv!8026 a3!79)))

(assert (=> start!69972 (array_inv!8026 a2!825)))

(declare-fun b!316322 () Bool)

(declare-fun res!259426 () Bool)

(assert (=> b!316322 (=> (not res!259426) (not e!227305))))

(declare-fun i!1020 () (_ BitVec 64))

(assert (=> b!316322 (= res!259426 (not (= i!1020 mid!82)))))

(declare-fun b!316323 () Bool)

(declare-fun res!259430 () Bool)

(assert (=> b!316323 (=> (not res!259430) (not e!227305))))

(declare-fun arrayBitRangesEq!0 (array!19503 array!19503 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!316323 (= res!259430 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!316324 () Bool)

(declare-fun res!259433 () Bool)

(assert (=> b!316324 (=> (not res!259433) (not e!227305))))

(assert (=> b!316324 (= res!259433 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!316325 () Bool)

(declare-fun res!259431 () Bool)

(assert (=> b!316325 (=> (not res!259431) (not e!227305))))

(assert (=> b!316325 (= res!259431 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!316326 () Bool)

(assert (=> b!316326 (= e!227305 (not true))))

(assert (=> b!316326 (arrayBitRangesEq!0 a2!825 a3!79 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) to!845)))

(declare-datatypes ((Unit!21703 0))(
  ( (Unit!21704) )
))
(declare-fun lt!442898 () Unit!21703)

(declare-fun arrayBitRangesEqDrop1!0 (array!19503 array!19503 (_ BitVec 64) (_ BitVec 64)) Unit!21703)

(assert (=> b!316326 (= lt!442898 (arrayBitRangesEqDrop1!0 a2!825 a3!79 i!1020 to!845))))

(assert (=> b!316326 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-fun lt!442896 () Unit!21703)

(assert (=> b!316326 (= lt!442896 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(assert (=> b!316326 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442897 () Unit!21703)

(declare-fun arrayBitRangesEqAppend!0 (array!19503 array!19503 (_ BitVec 64) (_ BitVec 64)) Unit!21703)

(assert (=> b!316326 (= lt!442897 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!316327 () Bool)

(declare-fun res!259428 () Bool)

(assert (=> b!316327 (=> (not res!259428) (not e!227305))))

(assert (=> b!316327 (= res!259428 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!316328 () Bool)

(declare-fun res!259429 () Bool)

(assert (=> b!316328 (=> (not res!259429) (not e!227305))))

(assert (=> b!316328 (= res!259429 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!316329 () Bool)

(declare-fun res!259427 () Bool)

(assert (=> b!316329 (=> (not res!259427) (not e!227305))))

(assert (=> b!316329 (= res!259427 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(assert (= (and start!69972 res!259432) b!316329))

(assert (= (and b!316329 res!259427) b!316328))

(assert (= (and b!316328 res!259429) b!316325))

(assert (= (and b!316325 res!259431) b!316327))

(assert (= (and b!316327 res!259428) b!316324))

(assert (= (and b!316324 res!259433) b!316323))

(assert (= (and b!316323 res!259430) b!316322))

(assert (= (and b!316322 res!259426) b!316326))

(declare-fun m!454107 () Bool)

(assert (=> b!316329 m!454107))

(declare-fun m!454109 () Bool)

(assert (=> b!316326 m!454109))

(declare-fun m!454111 () Bool)

(assert (=> b!316326 m!454111))

(declare-fun m!454113 () Bool)

(assert (=> b!316326 m!454113))

(declare-fun m!454115 () Bool)

(assert (=> b!316326 m!454115))

(declare-fun m!454117 () Bool)

(assert (=> b!316326 m!454117))

(declare-fun m!454119 () Bool)

(assert (=> b!316326 m!454119))

(declare-fun m!454121 () Bool)

(assert (=> b!316328 m!454121))

(declare-fun m!454123 () Bool)

(assert (=> b!316323 m!454123))

(declare-fun m!454125 () Bool)

(assert (=> start!69972 m!454125))

(declare-fun m!454127 () Bool)

(assert (=> start!69972 m!454127))

(declare-fun m!454129 () Bool)

(assert (=> start!69972 m!454129))

(declare-fun m!454131 () Bool)

(assert (=> b!316327 m!454131))

(declare-fun m!454133 () Bool)

(assert (=> b!316324 m!454133))

(check-sat (not b!316327) (not b!316329) (not start!69972) (not b!316323) (not b!316326) (not b!316328) (not b!316324))
