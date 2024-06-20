; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70232 () Bool)

(assert start!70232)

(declare-fun b!318148 () Bool)

(declare-fun res!261228 () Bool)

(declare-fun e!228446 () Bool)

(assert (=> b!318148 (=> (not res!261228) (not e!228446))))

(declare-datatypes ((array!19730 0))(
  ( (array!19731 (arr!9672 (Array (_ BitVec 32) (_ BitVec 8))) (size!8586 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19730)

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19730)

(declare-fun bitAt!0 (array!19730 (_ BitVec 64)) Bool)

(assert (=> b!318148 (= res!261228 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!318149 () Bool)

(declare-fun i!999 () (_ BitVec 64))

(assert (=> b!318149 (= e!228446 (not (or (= (bvand i!999 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000) (= (bvand i!999 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun arrayBitRangesEq!0 (array!19730 array!19730 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318149 (arrayBitRangesEq!0 a1!748 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822))))

(declare-datatypes ((Unit!21843 0))(
  ( (Unit!21844) )
))
(declare-fun lt!443275 () Unit!21843)

(declare-fun arrayBitRangesEqPrepend!0 (array!19730 array!19730 (_ BitVec 64) (_ BitVec 64)) Unit!21843)

(assert (=> b!318149 (= lt!443275 (arrayBitRangesEqPrepend!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(assert (=> b!318149 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun from!855 () (_ BitVec 64))

(declare-fun lt!443276 () Unit!21843)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19730 array!19730 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21843)

(assert (=> b!318149 (= lt!443276 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(declare-fun res!261230 () Bool)

(assert (=> start!70232 (=> (not res!261230) (not e!228446))))

(assert (=> start!70232 (= res!261230 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8586 a1!748) (size!8586 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8586 a1!748))))))))

(assert (=> start!70232 e!228446))

(assert (=> start!70232 true))

(declare-fun array_inv!8138 (array!19730) Bool)

(assert (=> start!70232 (array_inv!8138 a2!748)))

(assert (=> start!70232 (array_inv!8138 a1!748)))

(declare-fun b!318150 () Bool)

(declare-fun res!261232 () Bool)

(assert (=> b!318150 (=> (not res!261232) (not e!228446))))

(assert (=> b!318150 (= res!261232 (not (= i!999 from!855)))))

(declare-fun b!318151 () Bool)

(declare-fun res!261229 () Bool)

(assert (=> b!318151 (=> (not res!261229) (not e!228446))))

(assert (=> b!318151 (= res!261229 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!318152 () Bool)

(declare-fun res!261233 () Bool)

(assert (=> b!318152 (=> (not res!261233) (not e!228446))))

(assert (=> b!318152 (= res!261233 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun b!318153 () Bool)

(declare-fun res!261231 () Bool)

(assert (=> b!318153 (=> (not res!261231) (not e!228446))))

(assert (=> b!318153 (= res!261231 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(assert (= (and start!70232 res!261230) b!318153))

(assert (= (and b!318153 res!261231) b!318148))

(assert (= (and b!318148 res!261228) b!318152))

(assert (= (and b!318152 res!261233) b!318151))

(assert (= (and b!318151 res!261229) b!318150))

(assert (= (and b!318150 res!261232) b!318149))

(declare-fun m!456151 () Bool)

(assert (=> b!318153 m!456151))

(declare-fun m!456153 () Bool)

(assert (=> b!318149 m!456153))

(declare-fun m!456155 () Bool)

(assert (=> b!318149 m!456155))

(declare-fun m!456157 () Bool)

(assert (=> b!318149 m!456157))

(declare-fun m!456159 () Bool)

(assert (=> b!318149 m!456159))

(declare-fun m!456161 () Bool)

(assert (=> b!318149 m!456161))

(declare-fun m!456163 () Bool)

(assert (=> b!318151 m!456163))

(declare-fun m!456165 () Bool)

(assert (=> start!70232 m!456165))

(declare-fun m!456167 () Bool)

(assert (=> start!70232 m!456167))

(declare-fun m!456169 () Bool)

(assert (=> b!318148 m!456169))

(declare-fun m!456171 () Bool)

(assert (=> b!318148 m!456171))

(push 1)

(assert (not start!70232))

(assert (not b!318149))

(assert (not b!318153))

(assert (not b!318151))

(assert (not b!318148))

(check-sat)

(pop 1)

(push 1)

(check-sat)

