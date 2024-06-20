; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69856 () Bool)

(assert start!69856)

(declare-fun b!315180 () Bool)

(declare-fun res!258328 () Bool)

(declare-fun e!226655 () Bool)

(assert (=> b!315180 (=> (not res!258328) (not e!226655))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(declare-fun i!1020 () (_ BitVec 64))

(assert (=> b!315180 (= res!258328 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!315181 () Bool)

(declare-fun res!258326 () Bool)

(assert (=> b!315181 (=> (not res!258326) (not e!226655))))

(declare-datatypes ((array!19420 0))(
  ( (array!19421 (arr!9514 (Array (_ BitVec 32) (_ BitVec 8))) (size!8434 (_ BitVec 32))) )
))
(declare-fun a3!79 () array!19420)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun a2!825 () array!19420)

(declare-fun arrayBitRangesEq!0 (array!19420 array!19420 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!315181 (= res!258326 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!315182 () Bool)

(declare-fun res!258331 () Bool)

(assert (=> b!315182 (=> (not res!258331) (not e!226655))))

(declare-fun a1!825 () array!19420)

(assert (=> b!315182 (= res!258331 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!315184 () Bool)

(assert (=> b!315184 (= e!226655 (and (not (= i!1020 mid!82)) (= (size!8434 a1!825) (size!8434 a3!79)) (bvsge i!1020 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8434 a1!825))))))))

(declare-fun b!315185 () Bool)

(declare-fun res!258329 () Bool)

(assert (=> b!315185 (=> (not res!258329) (not e!226655))))

(assert (=> b!315185 (= res!258329 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!315186 () Bool)

(declare-fun res!258332 () Bool)

(assert (=> b!315186 (=> (not res!258332) (not e!226655))))

(assert (=> b!315186 (= res!258332 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!315183 () Bool)

(declare-fun res!258330 () Bool)

(assert (=> b!315183 (=> (not res!258330) (not e!226655))))

(assert (=> b!315183 (= res!258330 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun res!258327 () Bool)

(assert (=> start!69856 (=> (not res!258327) (not e!226655))))

(assert (=> start!69856 (= res!258327 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8434 a1!825) (size!8434 a2!825)) (= (size!8434 a2!825) (size!8434 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8434 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8434 a2!825))))))))

(assert (=> start!69856 e!226655))

(assert (=> start!69856 true))

(declare-fun array_inv!7986 (array!19420) Bool)

(assert (=> start!69856 (array_inv!7986 a1!825)))

(assert (=> start!69856 (array_inv!7986 a3!79)))

(assert (=> start!69856 (array_inv!7986 a2!825)))

(assert (= (and start!69856 res!258327) b!315185))

(assert (= (and b!315185 res!258329) b!315181))

(assert (= (and b!315181 res!258326) b!315180))

(assert (= (and b!315180 res!258328) b!315182))

(assert (= (and b!315182 res!258331) b!315186))

(assert (= (and b!315186 res!258332) b!315183))

(assert (= (and b!315183 res!258330) b!315184))

(declare-fun m!452747 () Bool)

(assert (=> b!315185 m!452747))

(declare-fun m!452749 () Bool)

(assert (=> b!315183 m!452749))

(declare-fun m!452751 () Bool)

(assert (=> b!315186 m!452751))

(declare-fun m!452753 () Bool)

(assert (=> b!315182 m!452753))

(declare-fun m!452755 () Bool)

(assert (=> b!315181 m!452755))

(declare-fun m!452757 () Bool)

(assert (=> start!69856 m!452757))

(declare-fun m!452759 () Bool)

(assert (=> start!69856 m!452759))

(declare-fun m!452761 () Bool)

(assert (=> start!69856 m!452761))

(push 1)

(assert (not b!315186))

(assert (not b!315182))

(assert (not b!315183))

(assert (not start!69856))

(assert (not b!315185))

(assert (not b!315181))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

