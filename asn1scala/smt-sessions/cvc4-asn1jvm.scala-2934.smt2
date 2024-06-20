; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69770 () Bool)

(assert start!69770)

(declare-fun b!314159 () Bool)

(declare-fun res!257308 () Bool)

(declare-fun e!226121 () Bool)

(assert (=> b!314159 (=> (not res!257308) (not e!226121))))

(declare-datatypes ((array!19334 0))(
  ( (array!19335 (arr!9471 (Array (_ BitVec 32) (_ BitVec 8))) (size!8391 (_ BitVec 32))) )
))
(declare-fun a3!79 () array!19334)

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun a2!825 () array!19334)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19334 array!19334 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!314159 (= res!257308 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!314160 () Bool)

(declare-fun res!257305 () Bool)

(assert (=> b!314160 (=> (not res!257305) (not e!226121))))

(declare-fun a1!825 () array!19334)

(declare-fun from!878 () (_ BitVec 64))

(assert (=> b!314160 (= res!257305 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314161 () Bool)

(declare-fun res!257306 () Bool)

(assert (=> b!314161 (=> (not res!257306) (not e!226121))))

(declare-fun mid!82 () (_ BitVec 64))

(assert (=> b!314161 (= res!257306 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!314162 () Bool)

(declare-fun res!257310 () Bool)

(assert (=> b!314162 (=> (not res!257310) (not e!226121))))

(assert (=> b!314162 (= res!257310 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!314163 () Bool)

(declare-fun res!257311 () Bool)

(assert (=> b!314163 (=> (not res!257311) (not e!226121))))

(assert (=> b!314163 (= res!257311 (not (= i!1020 mid!82)))))

(declare-fun b!314164 () Bool)

(declare-fun res!257309 () Bool)

(assert (=> b!314164 (=> (not res!257309) (not e!226121))))

(assert (=> b!314164 (= res!257309 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!314165 () Bool)

(assert (=> b!314165 (= e!226121 (not true))))

(assert (=> b!314165 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-datatypes ((Unit!21573 0))(
  ( (Unit!21574) )
))
(declare-fun lt!442376 () Unit!21573)

(declare-fun arrayBitRangesEqAppend!0 (array!19334 array!19334 (_ BitVec 64) (_ BitVec 64)) Unit!21573)

(assert (=> b!314165 (= lt!442376 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun res!257307 () Bool)

(assert (=> start!69770 (=> (not res!257307) (not e!226121))))

(assert (=> start!69770 (= res!257307 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8391 a1!825) (size!8391 a2!825)) (= (size!8391 a2!825) (size!8391 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8391 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8391 a2!825))))))))

(assert (=> start!69770 e!226121))

(assert (=> start!69770 true))

(declare-fun array_inv!7943 (array!19334) Bool)

(assert (=> start!69770 (array_inv!7943 a1!825)))

(assert (=> start!69770 (array_inv!7943 a3!79)))

(assert (=> start!69770 (array_inv!7943 a2!825)))

(declare-fun b!314166 () Bool)

(declare-fun res!257312 () Bool)

(assert (=> b!314166 (=> (not res!257312) (not e!226121))))

(assert (=> b!314166 (= res!257312 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(assert (= (and start!69770 res!257307) b!314162))

(assert (= (and b!314162 res!257310) b!314164))

(assert (= (and b!314164 res!257309) b!314161))

(assert (= (and b!314161 res!257306) b!314166))

(assert (= (and b!314166 res!257312) b!314159))

(assert (= (and b!314159 res!257308) b!314160))

(assert (= (and b!314160 res!257305) b!314163))

(assert (= (and b!314163 res!257311) b!314165))

(declare-fun m!451713 () Bool)

(assert (=> b!314164 m!451713))

(declare-fun m!451715 () Bool)

(assert (=> b!314165 m!451715))

(declare-fun m!451717 () Bool)

(assert (=> b!314165 m!451717))

(declare-fun m!451719 () Bool)

(assert (=> b!314162 m!451719))

(declare-fun m!451721 () Bool)

(assert (=> b!314166 m!451721))

(declare-fun m!451723 () Bool)

(assert (=> b!314160 m!451723))

(declare-fun m!451725 () Bool)

(assert (=> b!314159 m!451725))

(declare-fun m!451727 () Bool)

(assert (=> start!69770 m!451727))

(declare-fun m!451729 () Bool)

(assert (=> start!69770 m!451729))

(declare-fun m!451731 () Bool)

(assert (=> start!69770 m!451731))

(push 1)

(assert (not b!314162))

(assert (not b!314164))

(assert (not start!69770))

(assert (not b!314160))

(assert (not b!314165))

(assert (not b!314159))

(assert (not b!314166))

(check-sat)

(pop 1)

