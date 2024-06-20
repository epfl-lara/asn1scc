; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69844 () Bool)

(assert start!69844)

(declare-fun b!315047 () Bool)

(declare-fun res!258197 () Bool)

(declare-fun e!226582 () Bool)

(assert (=> b!315047 (=> (not res!258197) (not e!226582))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(assert (=> b!315047 (= res!258197 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!315048 () Bool)

(declare-fun res!258196 () Bool)

(assert (=> b!315048 (=> (not res!258196) (not e!226582))))

(declare-datatypes ((array!19408 0))(
  ( (array!19409 (arr!9508 (Array (_ BitVec 32) (_ BitVec 8))) (size!8428 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19408)

(declare-fun a2!825 () array!19408)

(declare-fun arrayBitRangesEq!0 (array!19408 array!19408 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!315048 (= res!258196 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!315049 () Bool)

(declare-fun res!258193 () Bool)

(assert (=> b!315049 (=> (not res!258193) (not e!226582))))

(assert (=> b!315049 (= res!258193 (= i!1020 mid!82))))

(declare-fun b!315050 () Bool)

(declare-fun res!258199 () Bool)

(assert (=> b!315050 (=> (not res!258199) (not e!226582))))

(declare-fun a3!79 () array!19408)

(declare-fun to!845 () (_ BitVec 64))

(assert (=> b!315050 (= res!258199 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!315051 () Bool)

(declare-fun res!258198 () Bool)

(assert (=> b!315051 (=> (not res!258198) (not e!226582))))

(assert (=> b!315051 (= res!258198 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!315052 () Bool)

(assert (=> b!315052 (= e!226582 (not (arrayBitRangesEq!0 a1!825 a3!79 from!878 mid!82)))))

(declare-fun b!315053 () Bool)

(declare-fun res!258200 () Bool)

(assert (=> b!315053 (=> (not res!258200) (not e!226582))))

(assert (=> b!315053 (= res!258200 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!315054 () Bool)

(declare-fun res!258194 () Bool)

(assert (=> b!315054 (=> (not res!258194) (not e!226582))))

(assert (=> b!315054 (= res!258194 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun res!258195 () Bool)

(assert (=> start!69844 (=> (not res!258195) (not e!226582))))

(assert (=> start!69844 (= res!258195 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8428 a1!825) (size!8428 a2!825)) (= (size!8428 a2!825) (size!8428 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8428 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8428 a2!825))))))))

(assert (=> start!69844 e!226582))

(assert (=> start!69844 true))

(declare-fun array_inv!7980 (array!19408) Bool)

(assert (=> start!69844 (array_inv!7980 a1!825)))

(assert (=> start!69844 (array_inv!7980 a3!79)))

(assert (=> start!69844 (array_inv!7980 a2!825)))

(assert (= (and start!69844 res!258195) b!315048))

(assert (= (and b!315048 res!258196) b!315050))

(assert (= (and b!315050 res!258199) b!315047))

(assert (= (and b!315047 res!258197) b!315051))

(assert (= (and b!315051 res!258198) b!315053))

(assert (= (and b!315053 res!258200) b!315054))

(assert (= (and b!315054 res!258194) b!315049))

(assert (= (and b!315049 res!258193) b!315052))

(declare-fun m!452645 () Bool)

(assert (=> b!315051 m!452645))

(declare-fun m!452647 () Bool)

(assert (=> b!315053 m!452647))

(declare-fun m!452649 () Bool)

(assert (=> b!315050 m!452649))

(declare-fun m!452651 () Bool)

(assert (=> b!315048 m!452651))

(declare-fun m!452653 () Bool)

(assert (=> start!69844 m!452653))

(declare-fun m!452655 () Bool)

(assert (=> start!69844 m!452655))

(declare-fun m!452657 () Bool)

(assert (=> start!69844 m!452657))

(declare-fun m!452659 () Bool)

(assert (=> b!315054 m!452659))

(declare-fun m!452661 () Bool)

(assert (=> b!315052 m!452661))

(push 1)

(assert (not b!315048))

(assert (not b!315054))

(assert (not b!315051))

(assert (not b!315053))

(assert (not b!315050))

(assert (not b!315052))

(assert (not start!69844))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

