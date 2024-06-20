; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69992 () Bool)

(assert start!69992)

(declare-fun b!316570 () Bool)

(declare-fun res!259682 () Bool)

(declare-fun e!227430 () Bool)

(assert (=> b!316570 (=> (not res!259682) (not e!227430))))

(declare-fun i!1020 () (_ BitVec 64))

(declare-datatypes ((array!19523 0))(
  ( (array!19524 (arr!9567 (Array (_ BitVec 32) (_ BitVec 8))) (size!8484 (_ BitVec 32))) )
))
(declare-fun a2!825 () array!19523)

(declare-fun mid!82 () (_ BitVec 64))

(declare-fun a1!825 () array!19523)

(declare-fun arrayBitRangesEq!0 (array!19523 array!19523 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!316570 (= res!259682 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun res!259681 () Bool)

(assert (=> start!69992 (=> (not res!259681) (not e!227430))))

(declare-fun a3!79 () array!19523)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(assert (=> start!69992 (= res!259681 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8484 a1!825) (size!8484 a2!825)) (= (size!8484 a2!825) (size!8484 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8484 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8484 a2!825))))))))

(assert (=> start!69992 e!227430))

(assert (=> start!69992 true))

(declare-fun array_inv!8036 (array!19523) Bool)

(assert (=> start!69992 (array_inv!8036 a1!825)))

(assert (=> start!69992 (array_inv!8036 a3!79)))

(assert (=> start!69992 (array_inv!8036 a2!825)))

(declare-fun b!316571 () Bool)

(declare-fun res!259679 () Bool)

(assert (=> b!316571 (=> (not res!259679) (not e!227430))))

(assert (=> b!316571 (= res!259679 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!316572 () Bool)

(declare-fun e!227434 () Bool)

(assert (=> b!316572 (= e!227434 true)))

(assert (=> b!316572 (arrayBitRangesEq!0 a1!825 a3!79 from!878 mid!82)))

(declare-datatypes ((Unit!21723 0))(
  ( (Unit!21724) )
))
(declare-fun lt!442996 () Unit!21723)

(declare-fun rec!20 (array!19523 array!19523 array!19523 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21723)

(assert (=> b!316572 (= lt!442996 (rec!20 a1!825 a2!825 a3!79 from!878 mid!82 to!845 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020)))))

(declare-fun b!316573 () Bool)

(declare-fun res!259674 () Bool)

(assert (=> b!316573 (=> (not res!259674) (not e!227430))))

(assert (=> b!316573 (= res!259674 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!316574 () Bool)

(assert (=> b!316574 (= e!227430 (not e!227434))))

(declare-fun res!259676 () Bool)

(assert (=> b!316574 (=> res!259676 e!227434)))

(assert (=> b!316574 (= res!259676 (or (bvsgt from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020)) (bvsgt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))))

(assert (=> b!316574 (arrayBitRangesEq!0 a2!825 a3!79 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) to!845)))

(declare-fun lt!442997 () Unit!21723)

(declare-fun arrayBitRangesEqDrop1!0 (array!19523 array!19523 (_ BitVec 64) (_ BitVec 64)) Unit!21723)

(assert (=> b!316574 (= lt!442997 (arrayBitRangesEqDrop1!0 a2!825 a3!79 i!1020 to!845))))

(assert (=> b!316574 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-fun lt!442995 () Unit!21723)

(assert (=> b!316574 (= lt!442995 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(assert (=> b!316574 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442994 () Unit!21723)

(declare-fun arrayBitRangesEqAppend!0 (array!19523 array!19523 (_ BitVec 64) (_ BitVec 64)) Unit!21723)

(assert (=> b!316574 (= lt!442994 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!316575 () Bool)

(declare-fun res!259675 () Bool)

(assert (=> b!316575 (=> (not res!259675) (not e!227430))))

(assert (=> b!316575 (= res!259675 (not (= i!1020 mid!82)))))

(declare-fun b!316576 () Bool)

(declare-fun res!259680 () Bool)

(assert (=> b!316576 (=> (not res!259680) (not e!227430))))

(assert (=> b!316576 (= res!259680 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!316577 () Bool)

(declare-fun res!259677 () Bool)

(assert (=> b!316577 (=> (not res!259677) (not e!227430))))

(assert (=> b!316577 (= res!259677 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!316578 () Bool)

(declare-fun res!259678 () Bool)

(assert (=> b!316578 (=> (not res!259678) (not e!227430))))

(assert (=> b!316578 (= res!259678 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(assert (= (and start!69992 res!259681) b!316578))

(assert (= (and b!316578 res!259678) b!316573))

(assert (= (and b!316573 res!259674) b!316577))

(assert (= (and b!316577 res!259677) b!316570))

(assert (= (and b!316570 res!259682) b!316576))

(assert (= (and b!316576 res!259680) b!316571))

(assert (= (and b!316571 res!259679) b!316575))

(assert (= (and b!316575 res!259675) b!316574))

(assert (= (and b!316574 (not res!259676)) b!316572))

(declare-fun m!454395 () Bool)

(assert (=> b!316572 m!454395))

(declare-fun m!454397 () Bool)

(assert (=> b!316572 m!454397))

(declare-fun m!454399 () Bool)

(assert (=> b!316571 m!454399))

(declare-fun m!454401 () Bool)

(assert (=> start!69992 m!454401))

(declare-fun m!454403 () Bool)

(assert (=> start!69992 m!454403))

(declare-fun m!454405 () Bool)

(assert (=> start!69992 m!454405))

(declare-fun m!454407 () Bool)

(assert (=> b!316576 m!454407))

(declare-fun m!454409 () Bool)

(assert (=> b!316578 m!454409))

(declare-fun m!454411 () Bool)

(assert (=> b!316574 m!454411))

(declare-fun m!454413 () Bool)

(assert (=> b!316574 m!454413))

(declare-fun m!454415 () Bool)

(assert (=> b!316574 m!454415))

(declare-fun m!454417 () Bool)

(assert (=> b!316574 m!454417))

(declare-fun m!454419 () Bool)

(assert (=> b!316574 m!454419))

(declare-fun m!454421 () Bool)

(assert (=> b!316574 m!454421))

(declare-fun m!454423 () Bool)

(assert (=> b!316570 m!454423))

(declare-fun m!454425 () Bool)

(assert (=> b!316573 m!454425))

(push 1)

(assert (not b!316574))

(assert (not b!316570))

(assert (not b!316571))

(assert (not b!316572))

(assert (not start!69992))

(assert (not b!316578))

(assert (not b!316576))

(assert (not b!316573))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

