; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69842 () Bool)

(assert start!69842)

(declare-fun res!258174 () Bool)

(declare-fun e!226572 () Bool)

(assert (=> start!69842 (=> (not res!258174) (not e!226572))))

(declare-datatypes ((array!19406 0))(
  ( (array!19407 (arr!9507 (Array (_ BitVec 32) (_ BitVec 8))) (size!8427 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19406)

(declare-fun a3!79 () array!19406)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun mid!82 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(declare-fun a2!825 () array!19406)

(assert (=> start!69842 (= res!258174 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8427 a1!825) (size!8427 a2!825)) (= (size!8427 a2!825) (size!8427 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8427 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8427 a2!825))))))))

(assert (=> start!69842 e!226572))

(assert (=> start!69842 true))

(declare-fun array_inv!7979 (array!19406) Bool)

(assert (=> start!69842 (array_inv!7979 a1!825)))

(assert (=> start!69842 (array_inv!7979 a3!79)))

(assert (=> start!69842 (array_inv!7979 a2!825)))

(declare-fun b!315024 () Bool)

(declare-fun res!258170 () Bool)

(assert (=> b!315024 (=> (not res!258170) (not e!226572))))

(declare-fun i!1020 () (_ BitVec 64))

(assert (=> b!315024 (= res!258170 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!315025 () Bool)

(assert (=> b!315025 (= e!226572 (bvslt (bvsub to!845 i!1020) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!315026 () Bool)

(declare-fun res!258171 () Bool)

(assert (=> b!315026 (=> (not res!258171) (not e!226572))))

(declare-fun arrayBitRangesEq!0 (array!19406 array!19406 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!315026 (= res!258171 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!315027 () Bool)

(declare-fun res!258175 () Bool)

(assert (=> b!315027 (=> (not res!258175) (not e!226572))))

(assert (=> b!315027 (= res!258175 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!315028 () Bool)

(declare-fun res!258172 () Bool)

(assert (=> b!315028 (=> (not res!258172) (not e!226572))))

(assert (=> b!315028 (= res!258172 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!315029 () Bool)

(declare-fun res!258173 () Bool)

(assert (=> b!315029 (=> (not res!258173) (not e!226572))))

(assert (=> b!315029 (= res!258173 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!315030 () Bool)

(declare-fun res!258176 () Bool)

(assert (=> b!315030 (=> (not res!258176) (not e!226572))))

(assert (=> b!315030 (= res!258176 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(assert (= (and start!69842 res!258174) b!315027))

(assert (= (and b!315027 res!258175) b!315029))

(assert (= (and b!315029 res!258173) b!315024))

(assert (= (and b!315024 res!258170) b!315026))

(assert (= (and b!315026 res!258171) b!315030))

(assert (= (and b!315030 res!258176) b!315028))

(assert (= (and b!315028 res!258172) b!315025))

(declare-fun m!452629 () Bool)

(assert (=> b!315027 m!452629))

(declare-fun m!452631 () Bool)

(assert (=> b!315030 m!452631))

(declare-fun m!452633 () Bool)

(assert (=> b!315026 m!452633))

(declare-fun m!452635 () Bool)

(assert (=> b!315028 m!452635))

(declare-fun m!452637 () Bool)

(assert (=> start!69842 m!452637))

(declare-fun m!452639 () Bool)

(assert (=> start!69842 m!452639))

(declare-fun m!452641 () Bool)

(assert (=> start!69842 m!452641))

(declare-fun m!452643 () Bool)

(assert (=> b!315029 m!452643))

(push 1)

(assert (not b!315028))

(assert (not b!315029))

(assert (not b!315026))

(assert (not b!315030))

(assert (not start!69842))

(assert (not b!315027))

(check-sat)

(pop 1)

(push 1)

(check-sat)

