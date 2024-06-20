; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69780 () Bool)

(assert start!69780)

(declare-fun b!314279 () Bool)

(declare-fun res!257429 () Bool)

(declare-fun e!226183 () Bool)

(assert (=> b!314279 (=> (not res!257429) (not e!226183))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-datatypes ((array!19344 0))(
  ( (array!19345 (arr!9476 (Array (_ BitVec 32) (_ BitVec 8))) (size!8396 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19344)

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun a2!825 () array!19344)

(declare-fun arrayBitRangesEq!0 (array!19344 array!19344 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!314279 (= res!257429 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!314280 () Bool)

(declare-fun res!257425 () Bool)

(assert (=> b!314280 (=> (not res!257425) (not e!226183))))

(declare-fun from!878 () (_ BitVec 64))

(assert (=> b!314280 (= res!257425 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!314281 () Bool)

(declare-fun res!257426 () Bool)

(assert (=> b!314281 (=> (not res!257426) (not e!226183))))

(declare-fun a3!79 () array!19344)

(assert (=> b!314281 (= res!257426 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314282 () Bool)

(declare-fun res!257430 () Bool)

(assert (=> b!314282 (=> (not res!257430) (not e!226183))))

(declare-fun to!845 () (_ BitVec 64))

(assert (=> b!314282 (= res!257430 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!314283 () Bool)

(assert (=> b!314283 (= e!226183 (not true))))

(assert (=> b!314283 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-datatypes ((Unit!21583 0))(
  ( (Unit!21584) )
))
(declare-fun lt!442405 () Unit!21583)

(declare-fun arrayBitRangesEqDrop1!0 (array!19344 array!19344 (_ BitVec 64) (_ BitVec 64)) Unit!21583)

(assert (=> b!314283 (= lt!442405 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(assert (=> b!314283 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442406 () Unit!21583)

(declare-fun arrayBitRangesEqAppend!0 (array!19344 array!19344 (_ BitVec 64) (_ BitVec 64)) Unit!21583)

(assert (=> b!314283 (= lt!442406 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314284 () Bool)

(declare-fun res!257428 () Bool)

(assert (=> b!314284 (=> (not res!257428) (not e!226183))))

(assert (=> b!314284 (= res!257428 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun res!257432 () Bool)

(assert (=> start!69780 (=> (not res!257432) (not e!226183))))

(assert (=> start!69780 (= res!257432 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8396 a1!825) (size!8396 a2!825)) (= (size!8396 a2!825) (size!8396 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8396 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8396 a2!825))))))))

(assert (=> start!69780 e!226183))

(assert (=> start!69780 true))

(declare-fun array_inv!7948 (array!19344) Bool)

(assert (=> start!69780 (array_inv!7948 a1!825)))

(assert (=> start!69780 (array_inv!7948 a3!79)))

(assert (=> start!69780 (array_inv!7948 a2!825)))

(declare-fun b!314285 () Bool)

(declare-fun res!257431 () Bool)

(assert (=> b!314285 (=> (not res!257431) (not e!226183))))

(assert (=> b!314285 (= res!257431 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!314286 () Bool)

(declare-fun res!257427 () Bool)

(assert (=> b!314286 (=> (not res!257427) (not e!226183))))

(assert (=> b!314286 (= res!257427 (not (= i!1020 mid!82)))))

(assert (= (and start!69780 res!257432) b!314280))

(assert (= (and b!314280 res!257425) b!314282))

(assert (= (and b!314282 res!257430) b!314285))

(assert (= (and b!314285 res!257431) b!314279))

(assert (= (and b!314279 res!257429) b!314284))

(assert (= (and b!314284 res!257428) b!314281))

(assert (= (and b!314281 res!257426) b!314286))

(assert (= (and b!314286 res!257427) b!314283))

(declare-fun m!451829 () Bool)

(assert (=> b!314283 m!451829))

(declare-fun m!451831 () Bool)

(assert (=> b!314283 m!451831))

(declare-fun m!451833 () Bool)

(assert (=> b!314283 m!451833))

(declare-fun m!451835 () Bool)

(assert (=> b!314283 m!451835))

(declare-fun m!451837 () Bool)

(assert (=> start!69780 m!451837))

(declare-fun m!451839 () Bool)

(assert (=> start!69780 m!451839))

(declare-fun m!451841 () Bool)

(assert (=> start!69780 m!451841))

(declare-fun m!451843 () Bool)

(assert (=> b!314279 m!451843))

(declare-fun m!451845 () Bool)

(assert (=> b!314284 m!451845))

(declare-fun m!451847 () Bool)

(assert (=> b!314280 m!451847))

(declare-fun m!451849 () Bool)

(assert (=> b!314282 m!451849))

(declare-fun m!451851 () Bool)

(assert (=> b!314281 m!451851))

(check-sat (not start!69780) (not b!314284) (not b!314281) (not b!314279) (not b!314283) (not b!314280) (not b!314282))
