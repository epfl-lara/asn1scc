; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69918 () Bool)

(assert start!69918)

(declare-fun b!315674 () Bool)

(declare-fun res!258779 () Bool)

(declare-fun e!226980 () Bool)

(assert (=> b!315674 (=> (not res!258779) (not e!226980))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-datatypes ((array!19449 0))(
  ( (array!19450 (arr!9530 (Array (_ BitVec 32) (_ BitVec 8))) (size!8447 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19449)

(declare-fun from!878 () (_ BitVec 64))

(declare-fun a2!825 () array!19449)

(declare-fun arrayBitRangesEq!0 (array!19449 array!19449 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!315674 (= res!258779 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!315675 () Bool)

(declare-fun res!258782 () Bool)

(assert (=> b!315675 (=> (not res!258782) (not e!226980))))

(declare-fun i!1020 () (_ BitVec 64))

(assert (=> b!315675 (= res!258782 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!315676 () Bool)

(declare-fun res!258784 () Bool)

(assert (=> b!315676 (=> (not res!258784) (not e!226980))))

(assert (=> b!315676 (= res!258784 (not (= i!1020 mid!82)))))

(declare-fun b!315677 () Bool)

(assert (=> b!315677 (= e!226980 (not true))))

(declare-fun a3!79 () array!19449)

(assert (=> b!315677 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-datatypes ((Unit!21649 0))(
  ( (Unit!21650) )
))
(declare-fun lt!442715 () Unit!21649)

(declare-fun arrayBitRangesEqAppend!0 (array!19449 array!19449 (_ BitVec 64) (_ BitVec 64)) Unit!21649)

(assert (=> b!315677 (= lt!442715 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!315678 () Bool)

(declare-fun res!258785 () Bool)

(assert (=> b!315678 (=> (not res!258785) (not e!226980))))

(declare-fun to!845 () (_ BitVec 64))

(assert (=> b!315678 (= res!258785 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun res!258783 () Bool)

(assert (=> start!69918 (=> (not res!258783) (not e!226980))))

(assert (=> start!69918 (= res!258783 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8447 a1!825) (size!8447 a2!825)) (= (size!8447 a2!825) (size!8447 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8447 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8447 a2!825))))))))

(assert (=> start!69918 e!226980))

(assert (=> start!69918 true))

(declare-fun array_inv!7999 (array!19449) Bool)

(assert (=> start!69918 (array_inv!7999 a1!825)))

(assert (=> start!69918 (array_inv!7999 a3!79)))

(assert (=> start!69918 (array_inv!7999 a2!825)))

(declare-fun b!315679 () Bool)

(declare-fun res!258780 () Bool)

(assert (=> b!315679 (=> (not res!258780) (not e!226980))))

(assert (=> b!315679 (= res!258780 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!315680 () Bool)

(declare-fun res!258781 () Bool)

(assert (=> b!315680 (=> (not res!258781) (not e!226980))))

(assert (=> b!315680 (= res!258781 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!315681 () Bool)

(declare-fun res!258778 () Bool)

(assert (=> b!315681 (=> (not res!258778) (not e!226980))))

(assert (=> b!315681 (= res!258778 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(assert (= (and start!69918 res!258783) b!315674))

(assert (= (and b!315674 res!258779) b!315679))

(assert (= (and b!315679 res!258780) b!315680))

(assert (= (and b!315680 res!258781) b!315675))

(assert (= (and b!315675 res!258782) b!315678))

(assert (= (and b!315678 res!258785) b!315681))

(assert (= (and b!315681 res!258778) b!315676))

(assert (= (and b!315676 res!258784) b!315677))

(declare-fun m!453439 () Bool)

(assert (=> b!315678 m!453439))

(declare-fun m!453441 () Bool)

(assert (=> b!315674 m!453441))

(declare-fun m!453443 () Bool)

(assert (=> b!315681 m!453443))

(declare-fun m!453445 () Bool)

(assert (=> b!315679 m!453445))

(declare-fun m!453447 () Bool)

(assert (=> b!315675 m!453447))

(declare-fun m!453449 () Bool)

(assert (=> b!315677 m!453449))

(declare-fun m!453451 () Bool)

(assert (=> b!315677 m!453451))

(declare-fun m!453453 () Bool)

(assert (=> start!69918 m!453453))

(declare-fun m!453455 () Bool)

(assert (=> start!69918 m!453455))

(declare-fun m!453457 () Bool)

(assert (=> start!69918 m!453457))

(check-sat (not b!315675) (not start!69918) (not b!315678) (not b!315674) (not b!315677) (not b!315679) (not b!315681))
