; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69958 () Bool)

(assert start!69958)

(declare-fun b!316154 () Bool)

(declare-fun res!259260 () Bool)

(declare-fun e!227220 () Bool)

(assert (=> b!316154 (=> (not res!259260) (not e!227220))))

(declare-datatypes ((array!19489 0))(
  ( (array!19490 (arr!9550 (Array (_ BitVec 32) (_ BitVec 8))) (size!8467 (_ BitVec 32))) )
))
(declare-fun a3!79 () array!19489)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(declare-fun a2!825 () array!19489)

(declare-fun arrayBitRangesEq!0 (array!19489 array!19489 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!316154 (= res!259260 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!316155 () Bool)

(declare-fun res!259264 () Bool)

(assert (=> b!316155 (=> (not res!259264) (not e!227220))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-fun i!1020 () (_ BitVec 64))

(assert (=> b!316155 (= res!259264 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!316156 () Bool)

(declare-fun res!259262 () Bool)

(assert (=> b!316156 (=> (not res!259262) (not e!227220))))

(declare-fun a1!825 () array!19489)

(assert (=> b!316156 (= res!259262 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!316157 () Bool)

(assert (=> b!316157 (= e!227220 (not (and (bvsle from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020)) (bvsle (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82))))))

(assert (=> b!316157 (arrayBitRangesEq!0 a2!825 a3!79 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) to!845)))

(declare-datatypes ((Unit!21689 0))(
  ( (Unit!21690) )
))
(declare-fun lt!442833 () Unit!21689)

(declare-fun arrayBitRangesEqDrop1!0 (array!19489 array!19489 (_ BitVec 64) (_ BitVec 64)) Unit!21689)

(assert (=> b!316157 (= lt!442833 (arrayBitRangesEqDrop1!0 a2!825 a3!79 i!1020 to!845))))

(assert (=> b!316157 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-fun lt!442834 () Unit!21689)

(assert (=> b!316157 (= lt!442834 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(assert (=> b!316157 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442835 () Unit!21689)

(declare-fun arrayBitRangesEqAppend!0 (array!19489 array!19489 (_ BitVec 64) (_ BitVec 64)) Unit!21689)

(assert (=> b!316157 (= lt!442835 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!316158 () Bool)

(declare-fun res!259261 () Bool)

(assert (=> b!316158 (=> (not res!259261) (not e!227220))))

(assert (=> b!316158 (= res!259261 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun res!259263 () Bool)

(assert (=> start!69958 (=> (not res!259263) (not e!227220))))

(assert (=> start!69958 (= res!259263 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8467 a1!825) (size!8467 a2!825)) (= (size!8467 a2!825) (size!8467 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8467 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8467 a2!825))))))))

(assert (=> start!69958 e!227220))

(assert (=> start!69958 true))

(declare-fun array_inv!8019 (array!19489) Bool)

(assert (=> start!69958 (array_inv!8019 a1!825)))

(assert (=> start!69958 (array_inv!8019 a3!79)))

(assert (=> start!69958 (array_inv!8019 a2!825)))

(declare-fun b!316159 () Bool)

(declare-fun res!259265 () Bool)

(assert (=> b!316159 (=> (not res!259265) (not e!227220))))

(assert (=> b!316159 (= res!259265 (not (= i!1020 mid!82)))))

(declare-fun b!316160 () Bool)

(declare-fun res!259258 () Bool)

(assert (=> b!316160 (=> (not res!259258) (not e!227220))))

(assert (=> b!316160 (= res!259258 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!316161 () Bool)

(declare-fun res!259259 () Bool)

(assert (=> b!316161 (=> (not res!259259) (not e!227220))))

(assert (=> b!316161 (= res!259259 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(assert (= (and start!69958 res!259263) b!316158))

(assert (= (and b!316158 res!259261) b!316154))

(assert (= (and b!316154 res!259260) b!316155))

(assert (= (and b!316155 res!259264) b!316156))

(assert (= (and b!316156 res!259262) b!316160))

(assert (= (and b!316160 res!259258) b!316161))

(assert (= (and b!316161 res!259259) b!316159))

(assert (= (and b!316159 res!259265) b!316157))

(declare-fun m!453911 () Bool)

(assert (=> b!316157 m!453911))

(declare-fun m!453913 () Bool)

(assert (=> b!316157 m!453913))

(declare-fun m!453915 () Bool)

(assert (=> b!316157 m!453915))

(declare-fun m!453917 () Bool)

(assert (=> b!316157 m!453917))

(declare-fun m!453919 () Bool)

(assert (=> b!316157 m!453919))

(declare-fun m!453921 () Bool)

(assert (=> b!316157 m!453921))

(declare-fun m!453923 () Bool)

(assert (=> b!316160 m!453923))

(declare-fun m!453925 () Bool)

(assert (=> b!316154 m!453925))

(declare-fun m!453927 () Bool)

(assert (=> b!316161 m!453927))

(declare-fun m!453929 () Bool)

(assert (=> start!69958 m!453929))

(declare-fun m!453931 () Bool)

(assert (=> start!69958 m!453931))

(declare-fun m!453933 () Bool)

(assert (=> start!69958 m!453933))

(declare-fun m!453935 () Bool)

(assert (=> b!316158 m!453935))

(declare-fun m!453937 () Bool)

(assert (=> b!316156 m!453937))

(push 1)

(assert (not b!316154))

(assert (not start!69958))

(assert (not b!316161))

(assert (not b!316160))

(assert (not b!316156))

(assert (not b!316157))

(assert (not b!316158))

(check-sat)

(pop 1)

(push 1)

(check-sat)

