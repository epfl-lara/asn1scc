; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70228 () Bool)

(assert start!70228)

(declare-fun b!318112 () Bool)

(declare-fun e!228429 () Bool)

(declare-fun i!999 () (_ BitVec 64))

(assert (=> b!318112 (= e!228429 (not (or (= (bvand i!999 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000) (= (bvand i!999 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((array!19726 0))(
  ( (array!19727 (arr!9670 (Array (_ BitVec 32) (_ BitVec 8))) (size!8584 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19726)

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19726)

(declare-fun arrayBitRangesEq!0 (array!19726 array!19726 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318112 (arrayBitRangesEq!0 a1!748 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822))))

(declare-datatypes ((Unit!21839 0))(
  ( (Unit!21840) )
))
(declare-fun lt!443264 () Unit!21839)

(declare-fun arrayBitRangesEqPrepend!0 (array!19726 array!19726 (_ BitVec 64) (_ BitVec 64)) Unit!21839)

(assert (=> b!318112 (= lt!443264 (arrayBitRangesEqPrepend!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun bitAt!0 (array!19726 (_ BitVec 64)) Bool)

(assert (=> b!318112 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun from!855 () (_ BitVec 64))

(declare-fun lt!443263 () Unit!21839)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19726 array!19726 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21839)

(assert (=> b!318112 (= lt!443263 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(declare-fun res!261193 () Bool)

(assert (=> start!70228 (=> (not res!261193) (not e!228429))))

(assert (=> start!70228 (= res!261193 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8584 a1!748) (size!8584 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8584 a1!748))))))))

(assert (=> start!70228 e!228429))

(assert (=> start!70228 true))

(declare-fun array_inv!8136 (array!19726) Bool)

(assert (=> start!70228 (array_inv!8136 a2!748)))

(assert (=> start!70228 (array_inv!8136 a1!748)))

(declare-fun b!318113 () Bool)

(declare-fun res!261194 () Bool)

(assert (=> b!318113 (=> (not res!261194) (not e!228429))))

(assert (=> b!318113 (= res!261194 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!318114 () Bool)

(declare-fun res!261195 () Bool)

(assert (=> b!318114 (=> (not res!261195) (not e!228429))))

(assert (=> b!318114 (= res!261195 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!318115 () Bool)

(declare-fun res!261196 () Bool)

(assert (=> b!318115 (=> (not res!261196) (not e!228429))))

(assert (=> b!318115 (= res!261196 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun b!318116 () Bool)

(declare-fun res!261197 () Bool)

(assert (=> b!318116 (=> (not res!261197) (not e!228429))))

(assert (=> b!318116 (= res!261197 (not (= i!999 from!855)))))

(declare-fun b!318117 () Bool)

(declare-fun res!261192 () Bool)

(assert (=> b!318117 (=> (not res!261192) (not e!228429))))

(assert (=> b!318117 (= res!261192 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(assert (= (and start!70228 res!261193) b!318114))

(assert (= (and b!318114 res!261195) b!318117))

(assert (= (and b!318117 res!261192) b!318115))

(assert (= (and b!318115 res!261196) b!318113))

(assert (= (and b!318113 res!261194) b!318116))

(assert (= (and b!318116 res!261197) b!318112))

(declare-fun m!456107 () Bool)

(assert (=> b!318112 m!456107))

(declare-fun m!456109 () Bool)

(assert (=> b!318112 m!456109))

(declare-fun m!456111 () Bool)

(assert (=> b!318112 m!456111))

(declare-fun m!456113 () Bool)

(assert (=> b!318112 m!456113))

(declare-fun m!456115 () Bool)

(assert (=> b!318112 m!456115))

(declare-fun m!456117 () Bool)

(assert (=> start!70228 m!456117))

(declare-fun m!456119 () Bool)

(assert (=> start!70228 m!456119))

(declare-fun m!456121 () Bool)

(assert (=> b!318114 m!456121))

(declare-fun m!456123 () Bool)

(assert (=> b!318117 m!456123))

(declare-fun m!456125 () Bool)

(assert (=> b!318117 m!456125))

(declare-fun m!456127 () Bool)

(assert (=> b!318113 m!456127))

(push 1)

(assert (not start!70228))

(assert (not b!318113))

(assert (not b!318114))

(assert (not b!318112))

(assert (not b!318117))

(check-sat)

(pop 1)

(push 1)

(check-sat)

