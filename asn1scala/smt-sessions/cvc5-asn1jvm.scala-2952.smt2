; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69910 () Bool)

(assert start!69910)

(declare-fun b!315578 () Bool)

(declare-fun res!258688 () Bool)

(declare-fun e!226931 () Bool)

(assert (=> b!315578 (=> (not res!258688) (not e!226931))))

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun mid!82 () (_ BitVec 64))

(assert (=> b!315578 (= res!258688 (not (= i!1020 mid!82)))))

(declare-fun b!315579 () Bool)

(declare-fun res!258686 () Bool)

(assert (=> b!315579 (=> (not res!258686) (not e!226931))))

(declare-datatypes ((array!19441 0))(
  ( (array!19442 (arr!9526 (Array (_ BitVec 32) (_ BitVec 8))) (size!8443 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19441)

(declare-fun from!878 () (_ BitVec 64))

(declare-fun a2!825 () array!19441)

(declare-fun arrayBitRangesEq!0 (array!19441 array!19441 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!315579 (= res!258686 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!315580 () Bool)

(declare-fun res!258687 () Bool)

(assert (=> b!315580 (=> (not res!258687) (not e!226931))))

(declare-fun a3!79 () array!19441)

(declare-fun to!845 () (_ BitVec 64))

(assert (=> b!315580 (= res!258687 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!315581 () Bool)

(declare-fun res!258689 () Bool)

(assert (=> b!315581 (=> (not res!258689) (not e!226931))))

(assert (=> b!315581 (= res!258689 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!315582 () Bool)

(declare-fun res!258683 () Bool)

(assert (=> b!315582 (=> (not res!258683) (not e!226931))))

(assert (=> b!315582 (= res!258683 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!315583 () Bool)

(declare-fun res!258685 () Bool)

(assert (=> b!315583 (=> (not res!258685) (not e!226931))))

(assert (=> b!315583 (= res!258685 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun res!258682 () Bool)

(assert (=> start!69910 (=> (not res!258682) (not e!226931))))

(assert (=> start!69910 (= res!258682 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8443 a1!825) (size!8443 a2!825)) (= (size!8443 a2!825) (size!8443 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8443 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8443 a2!825))))))))

(assert (=> start!69910 e!226931))

(assert (=> start!69910 true))

(declare-fun array_inv!7995 (array!19441) Bool)

(assert (=> start!69910 (array_inv!7995 a1!825)))

(assert (=> start!69910 (array_inv!7995 a3!79)))

(assert (=> start!69910 (array_inv!7995 a2!825)))

(declare-fun b!315584 () Bool)

(assert (=> b!315584 (= e!226931 (not true))))

(assert (=> b!315584 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-datatypes ((Unit!21641 0))(
  ( (Unit!21642) )
))
(declare-fun lt!442703 () Unit!21641)

(declare-fun arrayBitRangesEqAppend!0 (array!19441 array!19441 (_ BitVec 64) (_ BitVec 64)) Unit!21641)

(assert (=> b!315584 (= lt!442703 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!315585 () Bool)

(declare-fun res!258684 () Bool)

(assert (=> b!315585 (=> (not res!258684) (not e!226931))))

(assert (=> b!315585 (= res!258684 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(assert (= (and start!69910 res!258682) b!315579))

(assert (= (and b!315579 res!258686) b!315580))

(assert (= (and b!315580 res!258687) b!315582))

(assert (= (and b!315582 res!258683) b!315585))

(assert (= (and b!315585 res!258684) b!315583))

(assert (= (and b!315583 res!258685) b!315581))

(assert (= (and b!315581 res!258689) b!315578))

(assert (= (and b!315578 res!258688) b!315584))

(declare-fun m!453359 () Bool)

(assert (=> b!315585 m!453359))

(declare-fun m!453361 () Bool)

(assert (=> b!315580 m!453361))

(declare-fun m!453363 () Bool)

(assert (=> b!315584 m!453363))

(declare-fun m!453365 () Bool)

(assert (=> b!315584 m!453365))

(declare-fun m!453367 () Bool)

(assert (=> b!315581 m!453367))

(declare-fun m!453369 () Bool)

(assert (=> b!315579 m!453369))

(declare-fun m!453371 () Bool)

(assert (=> b!315583 m!453371))

(declare-fun m!453373 () Bool)

(assert (=> start!69910 m!453373))

(declare-fun m!453375 () Bool)

(assert (=> start!69910 m!453375))

(declare-fun m!453377 () Bool)

(assert (=> start!69910 m!453377))

(push 1)

(assert (not b!315584))

(assert (not b!315580))

(assert (not b!315581))

(assert (not start!69910))

(assert (not b!315583))

(assert (not b!315579))

(assert (not b!315585))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

