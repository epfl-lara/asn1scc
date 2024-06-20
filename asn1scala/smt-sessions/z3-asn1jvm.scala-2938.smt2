; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69792 () Bool)

(assert start!69792)

(declare-fun b!314423 () Bool)

(declare-fun res!257571 () Bool)

(declare-fun e!226255 () Bool)

(assert (=> b!314423 (=> (not res!257571) (not e!226255))))

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun mid!82 () (_ BitVec 64))

(assert (=> b!314423 (= res!257571 (not (= i!1020 mid!82)))))

(declare-fun b!314424 () Bool)

(declare-fun res!257572 () Bool)

(assert (=> b!314424 (=> (not res!257572) (not e!226255))))

(declare-datatypes ((array!19356 0))(
  ( (array!19357 (arr!9482 (Array (_ BitVec 32) (_ BitVec 8))) (size!8402 (_ BitVec 32))) )
))
(declare-fun a3!79 () array!19356)

(declare-fun a2!825 () array!19356)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19356 array!19356 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!314424 (= res!257572 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!314425 () Bool)

(declare-fun res!257569 () Bool)

(assert (=> b!314425 (=> (not res!257569) (not e!226255))))

(declare-fun a1!825 () array!19356)

(assert (=> b!314425 (= res!257569 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun res!257576 () Bool)

(assert (=> start!69792 (=> (not res!257576) (not e!226255))))

(declare-fun from!878 () (_ BitVec 64))

(assert (=> start!69792 (= res!257576 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8402 a1!825) (size!8402 a2!825)) (= (size!8402 a2!825) (size!8402 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8402 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8402 a2!825))))))))

(assert (=> start!69792 e!226255))

(assert (=> start!69792 true))

(declare-fun array_inv!7954 (array!19356) Bool)

(assert (=> start!69792 (array_inv!7954 a1!825)))

(assert (=> start!69792 (array_inv!7954 a3!79)))

(assert (=> start!69792 (array_inv!7954 a2!825)))

(declare-fun b!314426 () Bool)

(declare-fun res!257570 () Bool)

(assert (=> b!314426 (=> (not res!257570) (not e!226255))))

(assert (=> b!314426 (= res!257570 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!314427 () Bool)

(declare-fun res!257574 () Bool)

(assert (=> b!314427 (=> (not res!257574) (not e!226255))))

(assert (=> b!314427 (= res!257574 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!314428 () Bool)

(assert (=> b!314428 (= e!226255 (not true))))

(assert (=> b!314428 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-datatypes ((Unit!21595 0))(
  ( (Unit!21596) )
))
(declare-fun lt!442441 () Unit!21595)

(declare-fun arrayBitRangesEqDrop1!0 (array!19356 array!19356 (_ BitVec 64) (_ BitVec 64)) Unit!21595)

(assert (=> b!314428 (= lt!442441 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(assert (=> b!314428 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442442 () Unit!21595)

(declare-fun arrayBitRangesEqAppend!0 (array!19356 array!19356 (_ BitVec 64) (_ BitVec 64)) Unit!21595)

(assert (=> b!314428 (= lt!442442 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314429 () Bool)

(declare-fun res!257573 () Bool)

(assert (=> b!314429 (=> (not res!257573) (not e!226255))))

(assert (=> b!314429 (= res!257573 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314430 () Bool)

(declare-fun res!257575 () Bool)

(assert (=> b!314430 (=> (not res!257575) (not e!226255))))

(assert (=> b!314430 (= res!257575 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(assert (= (and start!69792 res!257576) b!314427))

(assert (= (and b!314427 res!257574) b!314426))

(assert (= (and b!314426 res!257570) b!314430))

(assert (= (and b!314430 res!257575) b!314425))

(assert (= (and b!314425 res!257569) b!314424))

(assert (= (and b!314424 res!257572) b!314429))

(assert (= (and b!314429 res!257573) b!314423))

(assert (= (and b!314423 res!257571) b!314428))

(declare-fun m!451973 () Bool)

(assert (=> b!314427 m!451973))

(declare-fun m!451975 () Bool)

(assert (=> b!314425 m!451975))

(declare-fun m!451977 () Bool)

(assert (=> b!314424 m!451977))

(declare-fun m!451979 () Bool)

(assert (=> b!314428 m!451979))

(declare-fun m!451981 () Bool)

(assert (=> b!314428 m!451981))

(declare-fun m!451983 () Bool)

(assert (=> b!314428 m!451983))

(declare-fun m!451985 () Bool)

(assert (=> b!314428 m!451985))

(declare-fun m!451987 () Bool)

(assert (=> start!69792 m!451987))

(declare-fun m!451989 () Bool)

(assert (=> start!69792 m!451989))

(declare-fun m!451991 () Bool)

(assert (=> start!69792 m!451991))

(declare-fun m!451993 () Bool)

(assert (=> b!314426 m!451993))

(declare-fun m!451995 () Bool)

(assert (=> b!314429 m!451995))

(check-sat (not b!314427) (not b!314426) (not start!69792) (not b!314428) (not b!314424) (not b!314429) (not b!314425))
