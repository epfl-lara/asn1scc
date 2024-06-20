; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70240 () Bool)

(assert start!70240)

(declare-fun b!318220 () Bool)

(declare-fun res!261303 () Bool)

(declare-fun e!228482 () Bool)

(assert (=> b!318220 (=> (not res!261303) (not e!228482))))

(declare-fun i!999 () (_ BitVec 64))

(declare-fun from!855 () (_ BitVec 64))

(declare-fun to!822 () (_ BitVec 64))

(assert (=> b!318220 (= res!261303 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun b!318222 () Bool)

(declare-fun res!261300 () Bool)

(assert (=> b!318222 (=> (not res!261300) (not e!228482))))

(declare-datatypes ((array!19738 0))(
  ( (array!19739 (arr!9676 (Array (_ BitVec 32) (_ BitVec 8))) (size!8590 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19738)

(declare-fun a1!748 () array!19738)

(declare-fun bitAt!0 (array!19738 (_ BitVec 64)) Bool)

(assert (=> b!318222 (= res!261300 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!318223 () Bool)

(declare-fun res!261302 () Bool)

(assert (=> b!318223 (=> (not res!261302) (not e!228482))))

(assert (=> b!318223 (= res!261302 (not (= i!999 from!855)))))

(declare-fun b!318221 () Bool)

(declare-fun res!261304 () Bool)

(assert (=> b!318221 (=> (not res!261304) (not e!228482))))

(declare-fun arrayBitRangesEq!0 (array!19738 array!19738 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318221 (= res!261304 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun res!261305 () Bool)

(assert (=> start!70240 (=> (not res!261305) (not e!228482))))

(assert (=> start!70240 (= res!261305 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8590 a1!748) (size!8590 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8590 a1!748))))))))

(assert (=> start!70240 e!228482))

(assert (=> start!70240 true))

(declare-fun array_inv!8142 (array!19738) Bool)

(assert (=> start!70240 (array_inv!8142 a2!748)))

(assert (=> start!70240 (array_inv!8142 a1!748)))

(declare-fun b!318224 () Bool)

(declare-fun res!261301 () Bool)

(assert (=> b!318224 (=> (not res!261301) (not e!228482))))

(assert (=> b!318224 (= res!261301 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!318225 () Bool)

(assert (=> b!318225 (= e!228482 (not true))))

(assert (=> b!318225 (arrayBitRangesEq!0 a1!748 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822))))

(declare-datatypes ((Unit!21851 0))(
  ( (Unit!21852) )
))
(declare-fun lt!443299 () Unit!21851)

(declare-fun arrayBitRangesEqPrepend!0 (array!19738 array!19738 (_ BitVec 64) (_ BitVec 64)) Unit!21851)

(assert (=> b!318225 (= lt!443299 (arrayBitRangesEqPrepend!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(assert (=> b!318225 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!443300 () Unit!21851)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19738 array!19738 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21851)

(assert (=> b!318225 (= lt!443300 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(assert (= (and start!70240 res!261305) b!318224))

(assert (= (and b!318224 res!261301) b!318222))

(assert (= (and b!318222 res!261300) b!318220))

(assert (= (and b!318220 res!261303) b!318221))

(assert (= (and b!318221 res!261304) b!318223))

(assert (= (and b!318223 res!261302) b!318225))

(declare-fun m!456239 () Bool)

(assert (=> b!318224 m!456239))

(declare-fun m!456241 () Bool)

(assert (=> b!318225 m!456241))

(declare-fun m!456243 () Bool)

(assert (=> b!318225 m!456243))

(declare-fun m!456245 () Bool)

(assert (=> b!318225 m!456245))

(declare-fun m!456247 () Bool)

(assert (=> b!318225 m!456247))

(declare-fun m!456249 () Bool)

(assert (=> b!318225 m!456249))

(declare-fun m!456251 () Bool)

(assert (=> b!318221 m!456251))

(declare-fun m!456253 () Bool)

(assert (=> start!70240 m!456253))

(declare-fun m!456255 () Bool)

(assert (=> start!70240 m!456255))

(declare-fun m!456257 () Bool)

(assert (=> b!318222 m!456257))

(declare-fun m!456259 () Bool)

(assert (=> b!318222 m!456259))

(push 1)

(assert (not b!318225))

(assert (not b!318224))

(assert (not b!318221))

(assert (not start!70240))

(assert (not b!318222))

(check-sat)

