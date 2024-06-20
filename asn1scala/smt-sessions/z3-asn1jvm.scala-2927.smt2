; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69726 () Bool)

(assert start!69726)

(declare-fun b!313688 () Bool)

(declare-fun res!256838 () Bool)

(declare-fun e!225857 () Bool)

(assert (=> b!313688 (=> (not res!256838) (not e!225857))))

(declare-datatypes ((array!19290 0))(
  ( (array!19291 (arr!9449 (Array (_ BitVec 32) (_ BitVec 8))) (size!8369 (_ BitVec 32))) )
))
(declare-fun a3!79 () array!19290)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(declare-fun a2!825 () array!19290)

(declare-fun arrayBitRangesEq!0 (array!19290 array!19290 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!313688 (= res!256838 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun res!256834 () Bool)

(assert (=> start!69726 (=> (not res!256834) (not e!225857))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-fun a1!825 () array!19290)

(assert (=> start!69726 (= res!256834 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8369 a1!825) (size!8369 a2!825)) (= (size!8369 a2!825) (size!8369 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8369 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8369 a2!825))))))))

(assert (=> start!69726 e!225857))

(assert (=> start!69726 true))

(declare-fun array_inv!7921 (array!19290) Bool)

(assert (=> start!69726 (array_inv!7921 a1!825)))

(assert (=> start!69726 (array_inv!7921 a3!79)))

(assert (=> start!69726 (array_inv!7921 a2!825)))

(declare-fun b!313689 () Bool)

(declare-fun i!1020 () (_ BitVec 64))

(assert (=> b!313689 (= e!225857 (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 i!1020) (bvsgt i!1020 to!845)))))

(declare-fun b!313690 () Bool)

(declare-fun res!256835 () Bool)

(assert (=> b!313690 (=> (not res!256835) (not e!225857))))

(assert (=> b!313690 (= res!256835 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!313691 () Bool)

(declare-fun res!256837 () Bool)

(assert (=> b!313691 (=> (not res!256837) (not e!225857))))

(assert (=> b!313691 (= res!256837 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!313692 () Bool)

(declare-fun res!256836 () Bool)

(assert (=> b!313692 (=> (not res!256836) (not e!225857))))

(assert (=> b!313692 (= res!256836 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(assert (= (and start!69726 res!256834) b!313692))

(assert (= (and b!313692 res!256836) b!313688))

(assert (= (and b!313688 res!256838) b!313691))

(assert (= (and b!313691 res!256837) b!313690))

(assert (= (and b!313690 res!256835) b!313689))

(declare-fun m!451337 () Bool)

(assert (=> b!313688 m!451337))

(declare-fun m!451339 () Bool)

(assert (=> start!69726 m!451339))

(declare-fun m!451341 () Bool)

(assert (=> start!69726 m!451341))

(declare-fun m!451343 () Bool)

(assert (=> start!69726 m!451343))

(declare-fun m!451345 () Bool)

(assert (=> b!313690 m!451345))

(declare-fun m!451347 () Bool)

(assert (=> b!313692 m!451347))

(check-sat (not b!313690) (not b!313688) (not b!313692) (not start!69726))
(check-sat)
