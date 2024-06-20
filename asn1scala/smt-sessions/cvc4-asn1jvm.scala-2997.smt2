; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70220 () Bool)

(assert start!70220)

(declare-fun res!261121 () Bool)

(declare-fun e!228394 () Bool)

(assert (=> start!70220 (=> (not res!261121) (not e!228394))))

(declare-datatypes ((array!19718 0))(
  ( (array!19719 (arr!9666 (Array (_ BitVec 32) (_ BitVec 8))) (size!8580 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19718)

(declare-fun from!855 () (_ BitVec 64))

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19718)

(assert (=> start!70220 (= res!261121 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8580 a1!748) (size!8580 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8580 a1!748))))))))

(assert (=> start!70220 e!228394))

(assert (=> start!70220 true))

(declare-fun array_inv!8132 (array!19718) Bool)

(assert (=> start!70220 (array_inv!8132 a2!748)))

(assert (=> start!70220 (array_inv!8132 a1!748)))

(declare-fun b!318040 () Bool)

(declare-fun res!261125 () Bool)

(assert (=> b!318040 (=> (not res!261125) (not e!228394))))

(declare-fun i!999 () (_ BitVec 64))

(assert (=> b!318040 (= res!261125 (not (= i!999 from!855)))))

(declare-fun b!318041 () Bool)

(declare-fun res!261122 () Bool)

(assert (=> b!318041 (=> (not res!261122) (not e!228394))))

(declare-fun arrayBitRangesEq!0 (array!19718 array!19718 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318041 (= res!261122 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!318042 () Bool)

(declare-fun res!261120 () Bool)

(assert (=> b!318042 (=> (not res!261120) (not e!228394))))

(assert (=> b!318042 (= res!261120 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!318043 () Bool)

(declare-fun res!261124 () Bool)

(assert (=> b!318043 (=> (not res!261124) (not e!228394))))

(assert (=> b!318043 (= res!261124 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun b!318044 () Bool)

(assert (=> b!318044 (= e!228394 (not true))))

(declare-fun bitAt!0 (array!19718 (_ BitVec 64)) Bool)

(assert (=> b!318044 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-datatypes ((Unit!21831 0))(
  ( (Unit!21832) )
))
(declare-fun lt!443249 () Unit!21831)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19718 array!19718 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21831)

(assert (=> b!318044 (= lt!443249 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(declare-fun b!318045 () Bool)

(declare-fun res!261123 () Bool)

(assert (=> b!318045 (=> (not res!261123) (not e!228394))))

(assert (=> b!318045 (= res!261123 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(assert (= (and start!70220 res!261121) b!318041))

(assert (= (and b!318041 res!261122) b!318045))

(assert (= (and b!318045 res!261123) b!318043))

(assert (= (and b!318043 res!261124) b!318042))

(assert (= (and b!318042 res!261120) b!318040))

(assert (= (and b!318040 res!261125) b!318044))

(declare-fun m!456035 () Bool)

(assert (=> b!318041 m!456035))

(declare-fun m!456037 () Bool)

(assert (=> start!70220 m!456037))

(declare-fun m!456039 () Bool)

(assert (=> start!70220 m!456039))

(declare-fun m!456041 () Bool)

(assert (=> b!318044 m!456041))

(declare-fun m!456043 () Bool)

(assert (=> b!318044 m!456043))

(declare-fun m!456045 () Bool)

(assert (=> b!318044 m!456045))

(declare-fun m!456047 () Bool)

(assert (=> b!318045 m!456047))

(declare-fun m!456049 () Bool)

(assert (=> b!318045 m!456049))

(declare-fun m!456051 () Bool)

(assert (=> b!318042 m!456051))

(push 1)

(assert (not start!70220))

(assert (not b!318041))

(assert (not b!318045))

(assert (not b!318042))

(assert (not b!318044))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

