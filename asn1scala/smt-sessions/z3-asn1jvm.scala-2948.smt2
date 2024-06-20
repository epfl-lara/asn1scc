; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69852 () Bool)

(assert start!69852)

(declare-fun b!315138 () Bool)

(declare-fun res!258285 () Bool)

(declare-fun e!226631 () Bool)

(assert (=> b!315138 (=> (not res!258285) (not e!226631))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-datatypes ((array!19416 0))(
  ( (array!19417 (arr!9512 (Array (_ BitVec 32) (_ BitVec 8))) (size!8432 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19416)

(declare-fun from!878 () (_ BitVec 64))

(declare-fun a2!825 () array!19416)

(declare-fun arrayBitRangesEq!0 (array!19416 array!19416 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!315138 (= res!258285 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!315139 () Bool)

(declare-fun res!258284 () Bool)

(assert (=> b!315139 (=> (not res!258284) (not e!226631))))

(declare-fun a3!79 () array!19416)

(declare-fun i!1020 () (_ BitVec 64))

(assert (=> b!315139 (= res!258284 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!315140 () Bool)

(declare-fun res!258286 () Bool)

(assert (=> b!315140 (=> (not res!258286) (not e!226631))))

(assert (=> b!315140 (= res!258286 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun res!258289 () Bool)

(assert (=> start!69852 (=> (not res!258289) (not e!226631))))

(declare-fun to!845 () (_ BitVec 64))

(assert (=> start!69852 (= res!258289 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8432 a1!825) (size!8432 a2!825)) (= (size!8432 a2!825) (size!8432 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8432 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8432 a2!825))))))))

(assert (=> start!69852 e!226631))

(assert (=> start!69852 true))

(declare-fun array_inv!7984 (array!19416) Bool)

(assert (=> start!69852 (array_inv!7984 a1!825)))

(assert (=> start!69852 (array_inv!7984 a3!79)))

(assert (=> start!69852 (array_inv!7984 a2!825)))

(declare-fun b!315141 () Bool)

(assert (=> b!315141 (= e!226631 (and (not (= i!1020 mid!82)) (not (= (size!8432 a1!825) (size!8432 a3!79)))))))

(declare-fun b!315142 () Bool)

(declare-fun res!258288 () Bool)

(assert (=> b!315142 (=> (not res!258288) (not e!226631))))

(assert (=> b!315142 (= res!258288 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!315143 () Bool)

(declare-fun res!258287 () Bool)

(assert (=> b!315143 (=> (not res!258287) (not e!226631))))

(assert (=> b!315143 (= res!258287 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!315144 () Bool)

(declare-fun res!258290 () Bool)

(assert (=> b!315144 (=> (not res!258290) (not e!226631))))

(assert (=> b!315144 (= res!258290 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(assert (= (and start!69852 res!258289) b!315138))

(assert (= (and b!315138 res!258285) b!315144))

(assert (= (and b!315144 res!258290) b!315140))

(assert (= (and b!315140 res!258286) b!315143))

(assert (= (and b!315143 res!258287) b!315142))

(assert (= (and b!315142 res!258288) b!315139))

(assert (= (and b!315139 res!258284) b!315141))

(declare-fun m!452715 () Bool)

(assert (=> b!315143 m!452715))

(declare-fun m!452717 () Bool)

(assert (=> b!315144 m!452717))

(declare-fun m!452719 () Bool)

(assert (=> start!69852 m!452719))

(declare-fun m!452721 () Bool)

(assert (=> start!69852 m!452721))

(declare-fun m!452723 () Bool)

(assert (=> start!69852 m!452723))

(declare-fun m!452725 () Bool)

(assert (=> b!315142 m!452725))

(declare-fun m!452727 () Bool)

(assert (=> b!315138 m!452727))

(declare-fun m!452729 () Bool)

(assert (=> b!315139 m!452729))

(check-sat (not b!315144) (not b!315143) (not start!69852) (not b!315142) (not b!315138) (not b!315139))
