; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69768 () Bool)

(assert start!69768)

(declare-fun b!314135 () Bool)

(declare-fun res!257283 () Bool)

(declare-fun e!226110 () Bool)

(assert (=> b!314135 (=> (not res!257283) (not e!226110))))

(declare-datatypes ((array!19332 0))(
  ( (array!19333 (arr!9470 (Array (_ BitVec 32) (_ BitVec 8))) (size!8390 (_ BitVec 32))) )
))
(declare-fun a3!79 () array!19332)

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun a2!825 () array!19332)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19332 array!19332 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!314135 (= res!257283 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!314136 () Bool)

(declare-fun res!257282 () Bool)

(assert (=> b!314136 (=> (not res!257282) (not e!226110))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-fun a1!825 () array!19332)

(assert (=> b!314136 (= res!257282 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!314137 () Bool)

(assert (=> b!314137 (= e!226110 (not true))))

(declare-fun from!878 () (_ BitVec 64))

(assert (=> b!314137 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-datatypes ((Unit!21571 0))(
  ( (Unit!21572) )
))
(declare-fun lt!442373 () Unit!21571)

(declare-fun arrayBitRangesEqAppend!0 (array!19332 array!19332 (_ BitVec 64) (_ BitVec 64)) Unit!21571)

(assert (=> b!314137 (= lt!442373 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314138 () Bool)

(declare-fun res!257286 () Bool)

(assert (=> b!314138 (=> (not res!257286) (not e!226110))))

(assert (=> b!314138 (= res!257286 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!314140 () Bool)

(declare-fun res!257281 () Bool)

(assert (=> b!314140 (=> (not res!257281) (not e!226110))))

(assert (=> b!314140 (= res!257281 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314141 () Bool)

(declare-fun res!257288 () Bool)

(assert (=> b!314141 (=> (not res!257288) (not e!226110))))

(assert (=> b!314141 (= res!257288 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!314142 () Bool)

(declare-fun res!257284 () Bool)

(assert (=> b!314142 (=> (not res!257284) (not e!226110))))

(assert (=> b!314142 (= res!257284 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun res!257285 () Bool)

(assert (=> start!69768 (=> (not res!257285) (not e!226110))))

(assert (=> start!69768 (= res!257285 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8390 a1!825) (size!8390 a2!825)) (= (size!8390 a2!825) (size!8390 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8390 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8390 a2!825))))))))

(assert (=> start!69768 e!226110))

(assert (=> start!69768 true))

(declare-fun array_inv!7942 (array!19332) Bool)

(assert (=> start!69768 (array_inv!7942 a1!825)))

(assert (=> start!69768 (array_inv!7942 a3!79)))

(assert (=> start!69768 (array_inv!7942 a2!825)))

(declare-fun b!314139 () Bool)

(declare-fun res!257287 () Bool)

(assert (=> b!314139 (=> (not res!257287) (not e!226110))))

(assert (=> b!314139 (= res!257287 (not (= i!1020 mid!82)))))

(assert (= (and start!69768 res!257285) b!314138))

(assert (= (and b!314138 res!257286) b!314141))

(assert (= (and b!314141 res!257288) b!314142))

(assert (= (and b!314142 res!257284) b!314136))

(assert (= (and b!314136 res!257282) b!314135))

(assert (= (and b!314135 res!257283) b!314140))

(assert (= (and b!314140 res!257281) b!314139))

(assert (= (and b!314139 res!257287) b!314137))

(declare-fun m!451693 () Bool)

(assert (=> b!314140 m!451693))

(declare-fun m!451695 () Bool)

(assert (=> b!314136 m!451695))

(declare-fun m!451697 () Bool)

(assert (=> b!314141 m!451697))

(declare-fun m!451699 () Bool)

(assert (=> b!314138 m!451699))

(declare-fun m!451701 () Bool)

(assert (=> b!314135 m!451701))

(declare-fun m!451703 () Bool)

(assert (=> b!314137 m!451703))

(declare-fun m!451705 () Bool)

(assert (=> b!314137 m!451705))

(declare-fun m!451707 () Bool)

(assert (=> start!69768 m!451707))

(declare-fun m!451709 () Bool)

(assert (=> start!69768 m!451709))

(declare-fun m!451711 () Bool)

(assert (=> start!69768 m!451711))

(check-sat (not b!314140) (not start!69768) (not b!314135) (not b!314141) (not b!314137) (not b!314136) (not b!314138))
