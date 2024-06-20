; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69772 () Bool)

(assert start!69772)

(declare-fun b!314183 () Bool)

(declare-fun e!226132 () Bool)

(assert (=> b!314183 (= e!226132 (not true))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-datatypes ((array!19336 0))(
  ( (array!19337 (arr!9472 (Array (_ BitVec 32) (_ BitVec 8))) (size!8392 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19336)

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun a2!825 () array!19336)

(declare-fun arrayBitRangesEq!0 (array!19336 array!19336 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!314183 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-datatypes ((Unit!21575 0))(
  ( (Unit!21576) )
))
(declare-fun lt!442381 () Unit!21575)

(declare-fun arrayBitRangesEqDrop1!0 (array!19336 array!19336 (_ BitVec 64) (_ BitVec 64)) Unit!21575)

(assert (=> b!314183 (= lt!442381 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun a3!79 () array!19336)

(declare-fun from!878 () (_ BitVec 64))

(assert (=> b!314183 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442382 () Unit!21575)

(declare-fun arrayBitRangesEqAppend!0 (array!19336 array!19336 (_ BitVec 64) (_ BitVec 64)) Unit!21575)

(assert (=> b!314183 (= lt!442382 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314184 () Bool)

(declare-fun res!257335 () Bool)

(assert (=> b!314184 (=> (not res!257335) (not e!226132))))

(assert (=> b!314184 (= res!257335 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!314185 () Bool)

(declare-fun res!257336 () Bool)

(assert (=> b!314185 (=> (not res!257336) (not e!226132))))

(assert (=> b!314185 (= res!257336 (not (= i!1020 mid!82)))))

(declare-fun b!314186 () Bool)

(declare-fun res!257332 () Bool)

(assert (=> b!314186 (=> (not res!257332) (not e!226132))))

(assert (=> b!314186 (= res!257332 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314187 () Bool)

(declare-fun res!257331 () Bool)

(assert (=> b!314187 (=> (not res!257331) (not e!226132))))

(assert (=> b!314187 (= res!257331 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!314188 () Bool)

(declare-fun res!257329 () Bool)

(assert (=> b!314188 (=> (not res!257329) (not e!226132))))

(declare-fun to!845 () (_ BitVec 64))

(assert (=> b!314188 (= res!257329 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun res!257333 () Bool)

(assert (=> start!69772 (=> (not res!257333) (not e!226132))))

(assert (=> start!69772 (= res!257333 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8392 a1!825) (size!8392 a2!825)) (= (size!8392 a2!825) (size!8392 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8392 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8392 a2!825))))))))

(assert (=> start!69772 e!226132))

(assert (=> start!69772 true))

(declare-fun array_inv!7944 (array!19336) Bool)

(assert (=> start!69772 (array_inv!7944 a1!825)))

(assert (=> start!69772 (array_inv!7944 a3!79)))

(assert (=> start!69772 (array_inv!7944 a2!825)))

(declare-fun b!314189 () Bool)

(declare-fun res!257330 () Bool)

(assert (=> b!314189 (=> (not res!257330) (not e!226132))))

(assert (=> b!314189 (= res!257330 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!314190 () Bool)

(declare-fun res!257334 () Bool)

(assert (=> b!314190 (=> (not res!257334) (not e!226132))))

(assert (=> b!314190 (= res!257334 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(assert (= (and start!69772 res!257333) b!314187))

(assert (= (and b!314187 res!257331) b!314189))

(assert (= (and b!314189 res!257330) b!314184))

(assert (= (and b!314184 res!257335) b!314190))

(assert (= (and b!314190 res!257334) b!314188))

(assert (= (and b!314188 res!257329) b!314186))

(assert (= (and b!314186 res!257332) b!314185))

(assert (= (and b!314185 res!257336) b!314183))

(declare-fun m!451733 () Bool)

(assert (=> start!69772 m!451733))

(declare-fun m!451735 () Bool)

(assert (=> start!69772 m!451735))

(declare-fun m!451737 () Bool)

(assert (=> start!69772 m!451737))

(declare-fun m!451739 () Bool)

(assert (=> b!314189 m!451739))

(declare-fun m!451741 () Bool)

(assert (=> b!314188 m!451741))

(declare-fun m!451743 () Bool)

(assert (=> b!314186 m!451743))

(declare-fun m!451745 () Bool)

(assert (=> b!314190 m!451745))

(declare-fun m!451747 () Bool)

(assert (=> b!314183 m!451747))

(declare-fun m!451749 () Bool)

(assert (=> b!314183 m!451749))

(declare-fun m!451751 () Bool)

(assert (=> b!314183 m!451751))

(declare-fun m!451753 () Bool)

(assert (=> b!314183 m!451753))

(declare-fun m!451755 () Bool)

(assert (=> b!314187 m!451755))

(push 1)

(assert (not start!69772))

(assert (not b!314187))

(assert (not b!314188))

(assert (not b!314183))

(assert (not b!314186))

(assert (not b!314190))

(assert (not b!314189))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

