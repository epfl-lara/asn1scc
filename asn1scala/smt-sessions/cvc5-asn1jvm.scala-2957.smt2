; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69940 () Bool)

(assert start!69940)

(declare-fun b!315938 () Bool)

(declare-fun res!259046 () Bool)

(declare-fun e!227110 () Bool)

(assert (=> b!315938 (=> (not res!259046) (not e!227110))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-datatypes ((array!19471 0))(
  ( (array!19472 (arr!9541 (Array (_ BitVec 32) (_ BitVec 8))) (size!8458 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19471)

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun a2!825 () array!19471)

(declare-fun arrayBitRangesEq!0 (array!19471 array!19471 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!315938 (= res!259046 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun res!259047 () Bool)

(assert (=> start!69940 (=> (not res!259047) (not e!227110))))

(declare-fun a3!79 () array!19471)

(declare-fun from!878 () (_ BitVec 64))

(declare-fun to!845 () (_ BitVec 64))

(assert (=> start!69940 (= res!259047 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8458 a1!825) (size!8458 a2!825)) (= (size!8458 a2!825) (size!8458 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8458 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8458 a2!825))))))))

(assert (=> start!69940 e!227110))

(assert (=> start!69940 true))

(declare-fun array_inv!8010 (array!19471) Bool)

(assert (=> start!69940 (array_inv!8010 a1!825)))

(assert (=> start!69940 (array_inv!8010 a3!79)))

(assert (=> start!69940 (array_inv!8010 a2!825)))

(declare-fun b!315939 () Bool)

(declare-fun res!259045 () Bool)

(assert (=> b!315939 (=> (not res!259045) (not e!227110))))

(assert (=> b!315939 (= res!259045 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!315940 () Bool)

(declare-fun res!259044 () Bool)

(assert (=> b!315940 (=> (not res!259044) (not e!227110))))

(assert (=> b!315940 (= res!259044 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!315941 () Bool)

(declare-fun res!259048 () Bool)

(assert (=> b!315941 (=> (not res!259048) (not e!227110))))

(assert (=> b!315941 (= res!259048 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!315942 () Bool)

(declare-fun res!259043 () Bool)

(assert (=> b!315942 (=> (not res!259043) (not e!227110))))

(assert (=> b!315942 (= res!259043 (not (= i!1020 mid!82)))))

(declare-fun b!315943 () Bool)

(assert (=> b!315943 (= e!227110 (not true))))

(assert (=> b!315943 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-datatypes ((Unit!21671 0))(
  ( (Unit!21672) )
))
(declare-fun lt!442769 () Unit!21671)

(declare-fun arrayBitRangesEqDrop1!0 (array!19471 array!19471 (_ BitVec 64) (_ BitVec 64)) Unit!21671)

(assert (=> b!315943 (= lt!442769 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(assert (=> b!315943 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442768 () Unit!21671)

(declare-fun arrayBitRangesEqAppend!0 (array!19471 array!19471 (_ BitVec 64) (_ BitVec 64)) Unit!21671)

(assert (=> b!315943 (= lt!442768 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!315944 () Bool)

(declare-fun res!259049 () Bool)

(assert (=> b!315944 (=> (not res!259049) (not e!227110))))

(assert (=> b!315944 (= res!259049 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!315945 () Bool)

(declare-fun res!259042 () Bool)

(assert (=> b!315945 (=> (not res!259042) (not e!227110))))

(assert (=> b!315945 (= res!259042 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(assert (= (and start!69940 res!259047) b!315940))

(assert (= (and b!315940 res!259044) b!315939))

(assert (= (and b!315939 res!259045) b!315941))

(assert (= (and b!315941 res!259048) b!315938))

(assert (= (and b!315938 res!259046) b!315945))

(assert (= (and b!315945 res!259042) b!315944))

(assert (= (and b!315944 res!259049) b!315942))

(assert (= (and b!315942 res!259043) b!315943))

(declare-fun m!453683 () Bool)

(assert (=> b!315939 m!453683))

(declare-fun m!453685 () Bool)

(assert (=> b!315944 m!453685))

(declare-fun m!453687 () Bool)

(assert (=> start!69940 m!453687))

(declare-fun m!453689 () Bool)

(assert (=> start!69940 m!453689))

(declare-fun m!453691 () Bool)

(assert (=> start!69940 m!453691))

(declare-fun m!453693 () Bool)

(assert (=> b!315940 m!453693))

(declare-fun m!453695 () Bool)

(assert (=> b!315938 m!453695))

(declare-fun m!453697 () Bool)

(assert (=> b!315945 m!453697))

(declare-fun m!453699 () Bool)

(assert (=> b!315943 m!453699))

(declare-fun m!453701 () Bool)

(assert (=> b!315943 m!453701))

(declare-fun m!453703 () Bool)

(assert (=> b!315943 m!453703))

(declare-fun m!453705 () Bool)

(assert (=> b!315943 m!453705))

(push 1)

(assert (not b!315943))

(assert (not b!315945))

(assert (not start!69940))

(assert (not b!315939))

(assert (not b!315938))

(assert (not b!315940))

(assert (not b!315944))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

