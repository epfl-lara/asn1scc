; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69858 () Bool)

(assert start!69858)

(declare-fun res!258348 () Bool)

(declare-fun e!226668 () Bool)

(assert (=> start!69858 (=> (not res!258348) (not e!226668))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-datatypes ((array!19422 0))(
  ( (array!19423 (arr!9515 (Array (_ BitVec 32) (_ BitVec 8))) (size!8435 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19422)

(declare-fun a3!79 () array!19422)

(declare-fun from!878 () (_ BitVec 64))

(declare-fun a2!825 () array!19422)

(declare-fun to!845 () (_ BitVec 64))

(assert (=> start!69858 (= res!258348 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8435 a1!825) (size!8435 a2!825)) (= (size!8435 a2!825) (size!8435 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8435 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8435 a2!825))))))))

(assert (=> start!69858 e!226668))

(assert (=> start!69858 true))

(declare-fun array_inv!7987 (array!19422) Bool)

(assert (=> start!69858 (array_inv!7987 a1!825)))

(assert (=> start!69858 (array_inv!7987 a3!79)))

(assert (=> start!69858 (array_inv!7987 a2!825)))

(declare-fun b!315201 () Bool)

(declare-fun res!258352 () Bool)

(assert (=> b!315201 (=> (not res!258352) (not e!226668))))

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19422 array!19422 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!315201 (= res!258352 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!315202 () Bool)

(declare-fun res!258351 () Bool)

(assert (=> b!315202 (=> (not res!258351) (not e!226668))))

(assert (=> b!315202 (= res!258351 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!315203 () Bool)

(assert (=> b!315203 (= e!226668 (and (not (= i!1020 mid!82)) (= (size!8435 a1!825) (size!8435 a3!79)) (bvsge i!1020 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8435 a1!825))))))))

(declare-fun b!315204 () Bool)

(declare-fun res!258347 () Bool)

(assert (=> b!315204 (=> (not res!258347) (not e!226668))))

(assert (=> b!315204 (= res!258347 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!315205 () Bool)

(declare-fun res!258350 () Bool)

(assert (=> b!315205 (=> (not res!258350) (not e!226668))))

(assert (=> b!315205 (= res!258350 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!315206 () Bool)

(declare-fun res!258349 () Bool)

(assert (=> b!315206 (=> (not res!258349) (not e!226668))))

(assert (=> b!315206 (= res!258349 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!315207 () Bool)

(declare-fun res!258353 () Bool)

(assert (=> b!315207 (=> (not res!258353) (not e!226668))))

(assert (=> b!315207 (= res!258353 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(assert (= (and start!69858 res!258348) b!315206))

(assert (= (and b!315206 res!258349) b!315207))

(assert (= (and b!315207 res!258353) b!315204))

(assert (= (and b!315204 res!258347) b!315202))

(assert (= (and b!315202 res!258351) b!315205))

(assert (= (and b!315205 res!258350) b!315201))

(assert (= (and b!315201 res!258352) b!315203))

(declare-fun m!452763 () Bool)

(assert (=> b!315201 m!452763))

(declare-fun m!452765 () Bool)

(assert (=> b!315202 m!452765))

(declare-fun m!452767 () Bool)

(assert (=> b!315205 m!452767))

(declare-fun m!452769 () Bool)

(assert (=> start!69858 m!452769))

(declare-fun m!452771 () Bool)

(assert (=> start!69858 m!452771))

(declare-fun m!452773 () Bool)

(assert (=> start!69858 m!452773))

(declare-fun m!452775 () Bool)

(assert (=> b!315207 m!452775))

(declare-fun m!452777 () Bool)

(assert (=> b!315206 m!452777))

(check-sat (not start!69858) (not b!315206) (not b!315201) (not b!315205) (not b!315207) (not b!315202))
(check-sat)
