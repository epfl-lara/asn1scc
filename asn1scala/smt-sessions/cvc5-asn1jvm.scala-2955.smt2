; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69928 () Bool)

(assert start!69928)

(declare-fun b!315794 () Bool)

(declare-fun e!227039 () Bool)

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun to!845 () (_ BitVec 64))

(assert (=> b!315794 (= e!227039 (not (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1020) (bvslt i!1020 to!845))))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-datatypes ((array!19459 0))(
  ( (array!19460 (arr!9535 (Array (_ BitVec 32) (_ BitVec 8))) (size!8452 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19459)

(declare-fun a2!825 () array!19459)

(declare-fun arrayBitRangesEq!0 (array!19459 array!19459 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!315794 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-datatypes ((Unit!21659 0))(
  ( (Unit!21660) )
))
(declare-fun lt!442733 () Unit!21659)

(declare-fun arrayBitRangesEqDrop1!0 (array!19459 array!19459 (_ BitVec 64) (_ BitVec 64)) Unit!21659)

(assert (=> b!315794 (= lt!442733 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun a3!79 () array!19459)

(declare-fun from!878 () (_ BitVec 64))

(assert (=> b!315794 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442732 () Unit!21659)

(declare-fun arrayBitRangesEqAppend!0 (array!19459 array!19459 (_ BitVec 64) (_ BitVec 64)) Unit!21659)

(assert (=> b!315794 (= lt!442732 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!315795 () Bool)

(declare-fun res!258903 () Bool)

(assert (=> b!315795 (=> (not res!258903) (not e!227039))))

(assert (=> b!315795 (= res!258903 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!315796 () Bool)

(declare-fun res!258901 () Bool)

(assert (=> b!315796 (=> (not res!258901) (not e!227039))))

(assert (=> b!315796 (= res!258901 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!315797 () Bool)

(declare-fun res!258902 () Bool)

(assert (=> b!315797 (=> (not res!258902) (not e!227039))))

(assert (=> b!315797 (= res!258902 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!315798 () Bool)

(declare-fun res!258905 () Bool)

(assert (=> b!315798 (=> (not res!258905) (not e!227039))))

(assert (=> b!315798 (= res!258905 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun res!258900 () Bool)

(assert (=> start!69928 (=> (not res!258900) (not e!227039))))

(assert (=> start!69928 (= res!258900 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8452 a1!825) (size!8452 a2!825)) (= (size!8452 a2!825) (size!8452 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8452 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8452 a2!825))))))))

(assert (=> start!69928 e!227039))

(assert (=> start!69928 true))

(declare-fun array_inv!8004 (array!19459) Bool)

(assert (=> start!69928 (array_inv!8004 a1!825)))

(assert (=> start!69928 (array_inv!8004 a3!79)))

(assert (=> start!69928 (array_inv!8004 a2!825)))

(declare-fun b!315799 () Bool)

(declare-fun res!258899 () Bool)

(assert (=> b!315799 (=> (not res!258899) (not e!227039))))

(assert (=> b!315799 (= res!258899 (not (= i!1020 mid!82)))))

(declare-fun b!315800 () Bool)

(declare-fun res!258904 () Bool)

(assert (=> b!315800 (=> (not res!258904) (not e!227039))))

(assert (=> b!315800 (= res!258904 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!315801 () Bool)

(declare-fun res!258898 () Bool)

(assert (=> b!315801 (=> (not res!258898) (not e!227039))))

(assert (=> b!315801 (= res!258898 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(assert (= (and start!69928 res!258900) b!315797))

(assert (= (and b!315797 res!258902) b!315801))

(assert (= (and b!315801 res!258898) b!315798))

(assert (= (and b!315798 res!258905) b!315795))

(assert (= (and b!315795 res!258903) b!315796))

(assert (= (and b!315796 res!258901) b!315800))

(assert (= (and b!315800 res!258904) b!315799))

(assert (= (and b!315799 res!258899) b!315794))

(declare-fun m!453539 () Bool)

(assert (=> b!315800 m!453539))

(declare-fun m!453541 () Bool)

(assert (=> start!69928 m!453541))

(declare-fun m!453543 () Bool)

(assert (=> start!69928 m!453543))

(declare-fun m!453545 () Bool)

(assert (=> start!69928 m!453545))

(declare-fun m!453547 () Bool)

(assert (=> b!315796 m!453547))

(declare-fun m!453549 () Bool)

(assert (=> b!315801 m!453549))

(declare-fun m!453551 () Bool)

(assert (=> b!315797 m!453551))

(declare-fun m!453553 () Bool)

(assert (=> b!315795 m!453553))

(declare-fun m!453555 () Bool)

(assert (=> b!315794 m!453555))

(declare-fun m!453557 () Bool)

(assert (=> b!315794 m!453557))

(declare-fun m!453559 () Bool)

(assert (=> b!315794 m!453559))

(declare-fun m!453561 () Bool)

(assert (=> b!315794 m!453561))

(push 1)

(assert (not b!315797))

(assert (not b!315794))

(assert (not b!315800))

(assert (not start!69928))

(assert (not b!315796))

(assert (not b!315795))

(assert (not b!315801))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

