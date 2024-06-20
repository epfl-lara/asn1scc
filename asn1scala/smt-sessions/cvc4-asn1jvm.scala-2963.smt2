; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69980 () Bool)

(assert start!69980)

(declare-fun b!316418 () Bool)

(declare-fun res!259523 () Bool)

(declare-fun e!227350 () Bool)

(assert (=> b!316418 (=> (not res!259523) (not e!227350))))

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun mid!82 () (_ BitVec 64))

(assert (=> b!316418 (= res!259523 (not (= i!1020 mid!82)))))

(declare-fun b!316419 () Bool)

(declare-fun res!259522 () Bool)

(assert (=> b!316419 (=> (not res!259522) (not e!227350))))

(declare-datatypes ((array!19511 0))(
  ( (array!19512 (arr!9561 (Array (_ BitVec 32) (_ BitVec 8))) (size!8478 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19511)

(declare-fun a3!79 () array!19511)

(declare-fun from!878 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19511 array!19511 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!316419 (= res!259522 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!316420 () Bool)

(assert (=> b!316420 (= e!227350 (not true))))

(declare-fun a2!825 () array!19511)

(declare-fun to!845 () (_ BitVec 64))

(assert (=> b!316420 (arrayBitRangesEq!0 a2!825 a3!79 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) to!845)))

(declare-datatypes ((Unit!21711 0))(
  ( (Unit!21712) )
))
(declare-fun lt!442932 () Unit!21711)

(declare-fun arrayBitRangesEqDrop1!0 (array!19511 array!19511 (_ BitVec 64) (_ BitVec 64)) Unit!21711)

(assert (=> b!316420 (= lt!442932 (arrayBitRangesEqDrop1!0 a2!825 a3!79 i!1020 to!845))))

(assert (=> b!316420 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-fun lt!442934 () Unit!21711)

(assert (=> b!316420 (= lt!442934 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(assert (=> b!316420 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442933 () Unit!21711)

(declare-fun arrayBitRangesEqAppend!0 (array!19511 array!19511 (_ BitVec 64) (_ BitVec 64)) Unit!21711)

(assert (=> b!316420 (= lt!442933 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!316421 () Bool)

(declare-fun res!259528 () Bool)

(assert (=> b!316421 (=> (not res!259528) (not e!227350))))

(assert (=> b!316421 (= res!259528 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!316422 () Bool)

(declare-fun res!259527 () Bool)

(assert (=> b!316422 (=> (not res!259527) (not e!227350))))

(assert (=> b!316422 (= res!259527 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!316423 () Bool)

(declare-fun res!259524 () Bool)

(assert (=> b!316423 (=> (not res!259524) (not e!227350))))

(assert (=> b!316423 (= res!259524 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!316425 () Bool)

(declare-fun res!259529 () Bool)

(assert (=> b!316425 (=> (not res!259529) (not e!227350))))

(assert (=> b!316425 (= res!259529 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun res!259526 () Bool)

(assert (=> start!69980 (=> (not res!259526) (not e!227350))))

(assert (=> start!69980 (= res!259526 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8478 a1!825) (size!8478 a2!825)) (= (size!8478 a2!825) (size!8478 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8478 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8478 a2!825))))))))

(assert (=> start!69980 e!227350))

(assert (=> start!69980 true))

(declare-fun array_inv!8030 (array!19511) Bool)

(assert (=> start!69980 (array_inv!8030 a1!825)))

(assert (=> start!69980 (array_inv!8030 a3!79)))

(assert (=> start!69980 (array_inv!8030 a2!825)))

(declare-fun b!316424 () Bool)

(declare-fun res!259525 () Bool)

(assert (=> b!316424 (=> (not res!259525) (not e!227350))))

(assert (=> b!316424 (= res!259525 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(assert (= (and start!69980 res!259526) b!316425))

(assert (= (and b!316425 res!259529) b!316421))

(assert (= (and b!316421 res!259528) b!316424))

(assert (= (and b!316424 res!259525) b!316423))

(assert (= (and b!316423 res!259524) b!316422))

(assert (= (and b!316422 res!259527) b!316419))

(assert (= (and b!316419 res!259522) b!316418))

(assert (= (and b!316418 res!259523) b!316420))

(declare-fun m!454219 () Bool)

(assert (=> b!316422 m!454219))

(declare-fun m!454221 () Bool)

(assert (=> b!316423 m!454221))

(declare-fun m!454223 () Bool)

(assert (=> b!316425 m!454223))

(declare-fun m!454225 () Bool)

(assert (=> b!316420 m!454225))

(declare-fun m!454227 () Bool)

(assert (=> b!316420 m!454227))

(declare-fun m!454229 () Bool)

(assert (=> b!316420 m!454229))

(declare-fun m!454231 () Bool)

(assert (=> b!316420 m!454231))

(declare-fun m!454233 () Bool)

(assert (=> b!316420 m!454233))

(declare-fun m!454235 () Bool)

(assert (=> b!316420 m!454235))

(declare-fun m!454237 () Bool)

(assert (=> start!69980 m!454237))

(declare-fun m!454239 () Bool)

(assert (=> start!69980 m!454239))

(declare-fun m!454241 () Bool)

(assert (=> start!69980 m!454241))

(declare-fun m!454243 () Bool)

(assert (=> b!316421 m!454243))

(declare-fun m!454245 () Bool)

(assert (=> b!316419 m!454245))

(push 1)

(assert (not b!316420))

(assert (not b!316419))

(assert (not b!316425))

(assert (not b!316422))

(assert (not b!316423))

(assert (not start!69980))

(assert (not b!316421))

(check-sat)

(pop 1)

