; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70114 () Bool)

(assert start!70114)

(declare-fun b!317141 () Bool)

(declare-fun res!260221 () Bool)

(declare-fun e!227898 () Bool)

(assert (=> b!317141 (=> (not res!260221) (not e!227898))))

(declare-datatypes ((array!19612 0))(
  ( (array!19613 (arr!9613 (Array (_ BitVec 32) (_ BitVec 8))) (size!8527 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19612)

(declare-fun from!855 () (_ BitVec 64))

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19612)

(declare-fun arrayBitRangesEq!0 (array!19612 array!19612 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!317141 (= res!260221 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!317142 () Bool)

(declare-fun res!260223 () Bool)

(assert (=> b!317142 (=> (not res!260223) (not e!227898))))

(declare-fun bitAt!0 (array!19612 (_ BitVec 64)) Bool)

(assert (=> b!317142 (= res!260223 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!317143 () Bool)

(declare-fun res!260224 () Bool)

(assert (=> b!317143 (=> (not res!260224) (not e!227898))))

(declare-fun i!999 () (_ BitVec 64))

(assert (=> b!317143 (= res!260224 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!317144 () Bool)

(declare-fun res!260225 () Bool)

(assert (=> b!317144 (=> (not res!260225) (not e!227898))))

(assert (=> b!317144 (= res!260225 (not (= i!999 from!855)))))

(declare-fun b!317145 () Bool)

(declare-fun res!260220 () Bool)

(assert (=> b!317145 (=> (not res!260220) (not e!227898))))

(assert (=> b!317145 (= res!260220 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun res!260222 () Bool)

(assert (=> start!70114 (=> (not res!260222) (not e!227898))))

(assert (=> start!70114 (= res!260222 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8527 a1!748) (size!8527 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8527 a1!748))))))))

(assert (=> start!70114 e!227898))

(assert (=> start!70114 true))

(declare-fun array_inv!8079 (array!19612) Bool)

(assert (=> start!70114 (array_inv!8079 a2!748)))

(assert (=> start!70114 (array_inv!8079 a1!748)))

(declare-fun b!317140 () Bool)

(assert (=> b!317140 (= e!227898 (not true))))

(assert (=> b!317140 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-datatypes ((Unit!21767 0))(
  ( (Unit!21768) )
))
(declare-fun lt!443099 () Unit!21767)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19612 array!19612 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21767)

(assert (=> b!317140 (= lt!443099 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(assert (= (and start!70114 res!260222) b!317141))

(assert (= (and b!317141 res!260221) b!317142))

(assert (= (and b!317142 res!260223) b!317145))

(assert (= (and b!317145 res!260220) b!317143))

(assert (= (and b!317143 res!260224) b!317144))

(assert (= (and b!317144 res!260225) b!317140))

(declare-fun m!455135 () Bool)

(assert (=> start!70114 m!455135))

(declare-fun m!455137 () Bool)

(assert (=> start!70114 m!455137))

(declare-fun m!455139 () Bool)

(assert (=> b!317143 m!455139))

(declare-fun m!455141 () Bool)

(assert (=> b!317141 m!455141))

(declare-fun m!455143 () Bool)

(assert (=> b!317140 m!455143))

(declare-fun m!455145 () Bool)

(assert (=> b!317140 m!455145))

(declare-fun m!455147 () Bool)

(assert (=> b!317140 m!455147))

(declare-fun m!455149 () Bool)

(assert (=> b!317142 m!455149))

(declare-fun m!455151 () Bool)

(assert (=> b!317142 m!455151))

(push 1)

(assert (not b!317142))

(assert (not b!317140))

(assert (not b!317141))

(assert (not start!70114))

(assert (not b!317143))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

