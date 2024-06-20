; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69854 () Bool)

(assert start!69854)

(declare-fun b!315159 () Bool)

(declare-fun res!258306 () Bool)

(declare-fun e!226645 () Bool)

(assert (=> b!315159 (=> (not res!258306) (not e!226645))))

(declare-datatypes ((array!19418 0))(
  ( (array!19419 (arr!9513 (Array (_ BitVec 32) (_ BitVec 8))) (size!8433 (_ BitVec 32))) )
))
(declare-fun a3!79 () array!19418)

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun to!845 () (_ BitVec 64))

(declare-fun a2!825 () array!19418)

(declare-fun arrayBitRangesEq!0 (array!19418 array!19418 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!315159 (= res!258306 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!315160 () Bool)

(declare-fun res!258305 () Bool)

(assert (=> b!315160 (=> (not res!258305) (not e!226645))))

(declare-fun a1!825 () array!19418)

(declare-fun mid!82 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(assert (=> b!315160 (= res!258305 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!315161 () Bool)

(declare-fun res!258309 () Bool)

(assert (=> b!315161 (=> (not res!258309) (not e!226645))))

(assert (=> b!315161 (= res!258309 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun res!258308 () Bool)

(assert (=> start!69854 (=> (not res!258308) (not e!226645))))

(assert (=> start!69854 (= res!258308 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8433 a1!825) (size!8433 a2!825)) (= (size!8433 a2!825) (size!8433 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8433 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8433 a2!825))))))))

(assert (=> start!69854 e!226645))

(assert (=> start!69854 true))

(declare-fun array_inv!7985 (array!19418) Bool)

(assert (=> start!69854 (array_inv!7985 a1!825)))

(assert (=> start!69854 (array_inv!7985 a3!79)))

(assert (=> start!69854 (array_inv!7985 a2!825)))

(declare-fun b!315162 () Bool)

(declare-fun res!258311 () Bool)

(assert (=> b!315162 (=> (not res!258311) (not e!226645))))

(assert (=> b!315162 (= res!258311 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!315163 () Bool)

(declare-fun res!258307 () Bool)

(assert (=> b!315163 (=> (not res!258307) (not e!226645))))

(assert (=> b!315163 (= res!258307 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!315164 () Bool)

(assert (=> b!315164 (= e!226645 (and (not (= i!1020 mid!82)) (not (= (size!8433 a1!825) (size!8433 a3!79)))))))

(declare-fun b!315165 () Bool)

(declare-fun res!258310 () Bool)

(assert (=> b!315165 (=> (not res!258310) (not e!226645))))

(assert (=> b!315165 (= res!258310 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(assert (= (and start!69854 res!258308) b!315160))

(assert (= (and b!315160 res!258305) b!315161))

(assert (= (and b!315161 res!258309) b!315165))

(assert (= (and b!315165 res!258310) b!315163))

(assert (= (and b!315163 res!258307) b!315159))

(assert (= (and b!315159 res!258306) b!315162))

(assert (= (and b!315162 res!258311) b!315164))

(declare-fun m!452731 () Bool)

(assert (=> start!69854 m!452731))

(declare-fun m!452733 () Bool)

(assert (=> start!69854 m!452733))

(declare-fun m!452735 () Bool)

(assert (=> start!69854 m!452735))

(declare-fun m!452737 () Bool)

(assert (=> b!315159 m!452737))

(declare-fun m!452739 () Bool)

(assert (=> b!315163 m!452739))

(declare-fun m!452741 () Bool)

(assert (=> b!315160 m!452741))

(declare-fun m!452743 () Bool)

(assert (=> b!315162 m!452743))

(declare-fun m!452745 () Bool)

(assert (=> b!315161 m!452745))

(push 1)

(assert (not b!315159))

(assert (not start!69854))

(assert (not b!315161))

(assert (not b!315160))

(assert (not b!315163))

(assert (not b!315162))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

