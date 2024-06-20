; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69764 () Bool)

(assert start!69764)

(declare-fun b!314087 () Bool)

(declare-fun res!257238 () Bool)

(declare-fun e!226086 () Bool)

(assert (=> b!314087 (=> (not res!257238) (not e!226086))))

(declare-datatypes ((array!19328 0))(
  ( (array!19329 (arr!9468 (Array (_ BitVec 32) (_ BitVec 8))) (size!8388 (_ BitVec 32))) )
))
(declare-fun a3!79 () array!19328)

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun a2!825 () array!19328)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19328 array!19328 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!314087 (= res!257238 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!314088 () Bool)

(declare-fun res!257234 () Bool)

(assert (=> b!314088 (=> (not res!257234) (not e!226086))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-fun a1!825 () array!19328)

(declare-fun from!878 () (_ BitVec 64))

(assert (=> b!314088 (= res!257234 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun res!257236 () Bool)

(assert (=> start!69764 (=> (not res!257236) (not e!226086))))

(assert (=> start!69764 (= res!257236 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8388 a1!825) (size!8388 a2!825)) (= (size!8388 a2!825) (size!8388 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8388 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8388 a2!825))))))))

(assert (=> start!69764 e!226086))

(assert (=> start!69764 true))

(declare-fun array_inv!7940 (array!19328) Bool)

(assert (=> start!69764 (array_inv!7940 a1!825)))

(assert (=> start!69764 (array_inv!7940 a3!79)))

(assert (=> start!69764 (array_inv!7940 a2!825)))

(declare-fun b!314089 () Bool)

(declare-fun res!257239 () Bool)

(assert (=> b!314089 (=> (not res!257239) (not e!226086))))

(assert (=> b!314089 (= res!257239 (not (= i!1020 mid!82)))))

(declare-fun b!314090 () Bool)

(assert (=> b!314090 (= e!226086 (not true))))

(assert (=> b!314090 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-datatypes ((Unit!21567 0))(
  ( (Unit!21568) )
))
(declare-fun lt!442367 () Unit!21567)

(declare-fun arrayBitRangesEqAppend!0 (array!19328 array!19328 (_ BitVec 64) (_ BitVec 64)) Unit!21567)

(assert (=> b!314090 (= lt!442367 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314091 () Bool)

(declare-fun res!257235 () Bool)

(assert (=> b!314091 (=> (not res!257235) (not e!226086))))

(assert (=> b!314091 (= res!257235 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!314092 () Bool)

(declare-fun res!257233 () Bool)

(assert (=> b!314092 (=> (not res!257233) (not e!226086))))

(assert (=> b!314092 (= res!257233 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!314093 () Bool)

(declare-fun res!257237 () Bool)

(assert (=> b!314093 (=> (not res!257237) (not e!226086))))

(assert (=> b!314093 (= res!257237 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314094 () Bool)

(declare-fun res!257240 () Bool)

(assert (=> b!314094 (=> (not res!257240) (not e!226086))))

(assert (=> b!314094 (= res!257240 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(assert (= (and start!69764 res!257236) b!314088))

(assert (= (and b!314088 res!257234) b!314094))

(assert (= (and b!314094 res!257240) b!314092))

(assert (= (and b!314092 res!257233) b!314091))

(assert (= (and b!314091 res!257235) b!314087))

(assert (= (and b!314087 res!257238) b!314093))

(assert (= (and b!314093 res!257237) b!314089))

(assert (= (and b!314089 res!257239) b!314090))

(declare-fun m!451653 () Bool)

(assert (=> b!314091 m!451653))

(declare-fun m!451655 () Bool)

(assert (=> b!314093 m!451655))

(declare-fun m!451657 () Bool)

(assert (=> start!69764 m!451657))

(declare-fun m!451659 () Bool)

(assert (=> start!69764 m!451659))

(declare-fun m!451661 () Bool)

(assert (=> start!69764 m!451661))

(declare-fun m!451663 () Bool)

(assert (=> b!314087 m!451663))

(declare-fun m!451665 () Bool)

(assert (=> b!314090 m!451665))

(declare-fun m!451667 () Bool)

(assert (=> b!314090 m!451667))

(declare-fun m!451669 () Bool)

(assert (=> b!314088 m!451669))

(declare-fun m!451671 () Bool)

(assert (=> b!314094 m!451671))

(push 1)

(assert (not b!314088))

(assert (not b!314090))

(assert (not b!314091))

