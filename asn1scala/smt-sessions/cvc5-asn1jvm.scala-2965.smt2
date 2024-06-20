; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69988 () Bool)

(assert start!69988)

(declare-fun b!316516 () Bool)

(declare-fun e!227403 () Bool)

(assert (=> b!316516 (= e!227403 true)))

(declare-fun mid!82 () (_ BitVec 64))

(declare-datatypes ((array!19519 0))(
  ( (array!19520 (arr!9565 (Array (_ BitVec 32) (_ BitVec 8))) (size!8482 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19519)

(declare-fun a3!79 () array!19519)

(declare-fun from!878 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19519 array!19519 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!316516 (arrayBitRangesEq!0 a1!825 a3!79 from!878 mid!82)))

(declare-fun i!1020 () (_ BitVec 64))

(declare-datatypes ((Unit!21719 0))(
  ( (Unit!21720) )
))
(declare-fun lt!442971 () Unit!21719)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun a2!825 () array!19519)

(declare-fun rec!20 (array!19519 array!19519 array!19519 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21719)

(assert (=> b!316516 (= lt!442971 (rec!20 a1!825 a2!825 a3!79 from!878 mid!82 to!845 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020)))))

(declare-fun b!316517 () Bool)

(declare-fun e!227402 () Bool)

(assert (=> b!316517 (= e!227402 (not e!227403))))

(declare-fun res!259623 () Bool)

(assert (=> b!316517 (=> res!259623 e!227403)))

(assert (=> b!316517 (= res!259623 (or (bvsgt from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020)) (bvsgt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))))

(assert (=> b!316517 (arrayBitRangesEq!0 a2!825 a3!79 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) to!845)))

(declare-fun lt!442970 () Unit!21719)

(declare-fun arrayBitRangesEqDrop1!0 (array!19519 array!19519 (_ BitVec 64) (_ BitVec 64)) Unit!21719)

(assert (=> b!316517 (= lt!442970 (arrayBitRangesEqDrop1!0 a2!825 a3!79 i!1020 to!845))))

(assert (=> b!316517 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-fun lt!442972 () Unit!21719)

(assert (=> b!316517 (= lt!442972 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(assert (=> b!316517 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442973 () Unit!21719)

(declare-fun arrayBitRangesEqAppend!0 (array!19519 array!19519 (_ BitVec 64) (_ BitVec 64)) Unit!21719)

(assert (=> b!316517 (= lt!442973 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!316518 () Bool)

(declare-fun res!259627 () Bool)

(assert (=> b!316518 (=> (not res!259627) (not e!227402))))

(assert (=> b!316518 (= res!259627 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!316519 () Bool)

(declare-fun res!259621 () Bool)

(assert (=> b!316519 (=> (not res!259621) (not e!227402))))

(assert (=> b!316519 (= res!259621 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!316520 () Bool)

(declare-fun res!259626 () Bool)

(assert (=> b!316520 (=> (not res!259626) (not e!227402))))

(assert (=> b!316520 (= res!259626 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun res!259622 () Bool)

(assert (=> start!69988 (=> (not res!259622) (not e!227402))))

(assert (=> start!69988 (= res!259622 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8482 a1!825) (size!8482 a2!825)) (= (size!8482 a2!825) (size!8482 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8482 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8482 a2!825))))))))

(assert (=> start!69988 e!227402))

(assert (=> start!69988 true))

(declare-fun array_inv!8034 (array!19519) Bool)

(assert (=> start!69988 (array_inv!8034 a1!825)))

(assert (=> start!69988 (array_inv!8034 a3!79)))

(assert (=> start!69988 (array_inv!8034 a2!825)))

(declare-fun b!316521 () Bool)

(declare-fun res!259620 () Bool)

(assert (=> b!316521 (=> (not res!259620) (not e!227402))))

(assert (=> b!316521 (= res!259620 (not (= i!1020 mid!82)))))

(declare-fun b!316522 () Bool)

(declare-fun res!259628 () Bool)

(assert (=> b!316522 (=> (not res!259628) (not e!227402))))

(assert (=> b!316522 (= res!259628 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!316523 () Bool)

(declare-fun res!259625 () Bool)

(assert (=> b!316523 (=> (not res!259625) (not e!227402))))

(assert (=> b!316523 (= res!259625 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!316524 () Bool)

(declare-fun res!259624 () Bool)

(assert (=> b!316524 (=> (not res!259624) (not e!227402))))

(assert (=> b!316524 (= res!259624 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(assert (= (and start!69988 res!259622) b!316523))

(assert (= (and b!316523 res!259625) b!316520))

(assert (= (and b!316520 res!259626) b!316518))

(assert (= (and b!316518 res!259627) b!316524))

(assert (= (and b!316524 res!259624) b!316522))

(assert (= (and b!316522 res!259628) b!316519))

(assert (= (and b!316519 res!259621) b!316521))

(assert (= (and b!316521 res!259620) b!316517))

(assert (= (and b!316517 (not res!259623)) b!316516))

(declare-fun m!454331 () Bool)

(assert (=> b!316523 m!454331))

(declare-fun m!454333 () Bool)

(assert (=> b!316517 m!454333))

(declare-fun m!454335 () Bool)

(assert (=> b!316517 m!454335))

(declare-fun m!454337 () Bool)

(assert (=> b!316517 m!454337))

(declare-fun m!454339 () Bool)

(assert (=> b!316517 m!454339))

(declare-fun m!454341 () Bool)

(assert (=> b!316517 m!454341))

(declare-fun m!454343 () Bool)

(assert (=> b!316517 m!454343))

(declare-fun m!454345 () Bool)

(assert (=> b!316524 m!454345))

(declare-fun m!454347 () Bool)

(assert (=> b!316516 m!454347))

(declare-fun m!454349 () Bool)

(assert (=> b!316516 m!454349))

(declare-fun m!454351 () Bool)

(assert (=> b!316519 m!454351))

(declare-fun m!454353 () Bool)

(assert (=> b!316522 m!454353))

(declare-fun m!454355 () Bool)

(assert (=> b!316520 m!454355))

(declare-fun m!454357 () Bool)

(assert (=> start!69988 m!454357))

(declare-fun m!454359 () Bool)

(assert (=> start!69988 m!454359))

(declare-fun m!454361 () Bool)

(assert (=> start!69988 m!454361))

(push 1)

(assert (not b!316524))

(assert (not b!316519))

(assert (not b!316520))

(assert (not b!316516))

(assert (not start!69988))

(assert (not b!316522))

(assert (not b!316523))

(assert (not b!316517))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

