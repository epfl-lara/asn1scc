; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69860 () Bool)

(assert start!69860)

(declare-fun b!315222 () Bool)

(declare-fun res!258374 () Bool)

(declare-fun e!226681 () Bool)

(assert (=> b!315222 (=> (not res!258374) (not e!226681))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-datatypes ((array!19424 0))(
  ( (array!19425 (arr!9516 (Array (_ BitVec 32) (_ BitVec 8))) (size!8436 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19424)

(declare-fun from!878 () (_ BitVec 64))

(declare-fun a2!825 () array!19424)

(declare-fun arrayBitRangesEq!0 (array!19424 array!19424 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!315222 (= res!258374 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!315223 () Bool)

(declare-fun res!258369 () Bool)

(assert (=> b!315223 (=> (not res!258369) (not e!226681))))

(declare-fun a3!79 () array!19424)

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun to!845 () (_ BitVec 64))

(assert (=> b!315223 (= res!258369 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!315224 () Bool)

(declare-fun res!258372 () Bool)

(assert (=> b!315224 (=> (not res!258372) (not e!226681))))

(assert (=> b!315224 (= res!258372 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!315225 () Bool)

(assert (=> b!315225 (= e!226681 (and (not (= i!1020 mid!82)) (= (size!8436 a1!825) (size!8436 a3!79)) (bvsge i!1020 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8436 a1!825))))))))

(declare-fun b!315226 () Bool)

(declare-fun res!258368 () Bool)

(assert (=> b!315226 (=> (not res!258368) (not e!226681))))

(assert (=> b!315226 (= res!258368 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!315227 () Bool)

(declare-fun res!258371 () Bool)

(assert (=> b!315227 (=> (not res!258371) (not e!226681))))

(assert (=> b!315227 (= res!258371 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!315228 () Bool)

(declare-fun res!258373 () Bool)

(assert (=> b!315228 (=> (not res!258373) (not e!226681))))

(assert (=> b!315228 (= res!258373 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun res!258370 () Bool)

(assert (=> start!69860 (=> (not res!258370) (not e!226681))))

(assert (=> start!69860 (= res!258370 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8436 a1!825) (size!8436 a2!825)) (= (size!8436 a2!825) (size!8436 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8436 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8436 a2!825))))))))

(assert (=> start!69860 e!226681))

(assert (=> start!69860 true))

(declare-fun array_inv!7988 (array!19424) Bool)

(assert (=> start!69860 (array_inv!7988 a1!825)))

(assert (=> start!69860 (array_inv!7988 a3!79)))

(assert (=> start!69860 (array_inv!7988 a2!825)))

(assert (= (and start!69860 res!258370) b!315222))

(assert (= (and b!315222 res!258374) b!315226))

(assert (= (and b!315226 res!258368) b!315228))

(assert (= (and b!315228 res!258373) b!315227))

(assert (= (and b!315227 res!258371) b!315223))

(assert (= (and b!315223 res!258369) b!315224))

(assert (= (and b!315224 res!258372) b!315225))

(declare-fun m!452779 () Bool)

(assert (=> b!315226 m!452779))

(declare-fun m!452781 () Bool)

(assert (=> start!69860 m!452781))

(declare-fun m!452783 () Bool)

(assert (=> start!69860 m!452783))

(declare-fun m!452785 () Bool)

(assert (=> start!69860 m!452785))

(declare-fun m!452787 () Bool)

(assert (=> b!315222 m!452787))

(declare-fun m!452789 () Bool)

(assert (=> b!315224 m!452789))

(declare-fun m!452791 () Bool)

(assert (=> b!315227 m!452791))

(declare-fun m!452793 () Bool)

(assert (=> b!315223 m!452793))

(push 1)

(assert (not b!315222))

(assert (not b!315227))

(assert (not b!315223))

(assert (not b!315226))

(assert (not start!69860))

(assert (not b!315224))

(check-sat)

(pop 1)

(push 1)

(check-sat)

