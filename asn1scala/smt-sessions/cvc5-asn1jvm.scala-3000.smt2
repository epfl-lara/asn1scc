; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70234 () Bool)

(assert start!70234)

(declare-fun b!318166 () Bool)

(declare-fun res!261250 () Bool)

(declare-fun e!228457 () Bool)

(assert (=> b!318166 (=> (not res!261250) (not e!228457))))

(declare-fun i!999 () (_ BitVec 64))

(declare-fun from!855 () (_ BitVec 64))

(declare-fun to!822 () (_ BitVec 64))

(assert (=> b!318166 (= res!261250 (and (bvsle from!855 i!999) (bvsle i!999 to!822)))))

(declare-fun res!261249 () Bool)

(assert (=> start!70234 (=> (not res!261249) (not e!228457))))

(declare-datatypes ((array!19732 0))(
  ( (array!19733 (arr!9673 (Array (_ BitVec 32) (_ BitVec 8))) (size!8587 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19732)

(declare-fun a1!748 () array!19732)

(assert (=> start!70234 (= res!261249 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8587 a1!748) (size!8587 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8587 a1!748))))))))

(assert (=> start!70234 e!228457))

(assert (=> start!70234 true))

(declare-fun array_inv!8139 (array!19732) Bool)

(assert (=> start!70234 (array_inv!8139 a2!748)))

(assert (=> start!70234 (array_inv!8139 a1!748)))

(declare-fun b!318167 () Bool)

(assert (=> b!318167 (= e!228457 (not (and (bvsle from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsle (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))))

(declare-fun arrayBitRangesEq!0 (array!19732 array!19732 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318167 (arrayBitRangesEq!0 a1!748 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822))))

(declare-datatypes ((Unit!21845 0))(
  ( (Unit!21846) )
))
(declare-fun lt!443282 () Unit!21845)

(declare-fun arrayBitRangesEqPrepend!0 (array!19732 array!19732 (_ BitVec 64) (_ BitVec 64)) Unit!21845)

(assert (=> b!318167 (= lt!443282 (arrayBitRangesEqPrepend!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun bitAt!0 (array!19732 (_ BitVec 64)) Bool)

(assert (=> b!318167 (= (bitAt!0 a1!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!748 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!443281 () Unit!21845)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!19732 array!19732 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21845)

(assert (=> b!318167 (= lt!443281 (arrayBitRangesEqImpliesEq!0 a1!748 a2!748 from!855 (bvsub i!999 #b0000000000000000000000000000000000000000000000000000000000000001) to!822))))

(declare-fun b!318168 () Bool)

(declare-fun res!261251 () Bool)

(assert (=> b!318168 (=> (not res!261251) (not e!228457))))

(assert (=> b!318168 (= res!261251 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!318169 () Bool)

(declare-fun res!261246 () Bool)

(assert (=> b!318169 (=> (not res!261246) (not e!228457))))

(assert (=> b!318169 (= res!261246 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!318170 () Bool)

(declare-fun res!261247 () Bool)

(assert (=> b!318170 (=> (not res!261247) (not e!228457))))

(assert (=> b!318170 (= res!261247 (not (= i!999 from!855)))))

(declare-fun b!318171 () Bool)

(declare-fun res!261248 () Bool)

(assert (=> b!318171 (=> (not res!261248) (not e!228457))))

(assert (=> b!318171 (= res!261248 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(assert (= (and start!70234 res!261249) b!318169))

(assert (= (and b!318169 res!261246) b!318171))

(assert (= (and b!318171 res!261248) b!318166))

(assert (= (and b!318166 res!261250) b!318168))

(assert (= (and b!318168 res!261251) b!318170))

(assert (= (and b!318170 res!261247) b!318167))

(declare-fun m!456173 () Bool)

(assert (=> b!318171 m!456173))

(declare-fun m!456175 () Bool)

(assert (=> b!318171 m!456175))

(declare-fun m!456177 () Bool)

(assert (=> b!318168 m!456177))

(declare-fun m!456179 () Bool)

(assert (=> b!318167 m!456179))

(declare-fun m!456181 () Bool)

(assert (=> b!318167 m!456181))

(declare-fun m!456183 () Bool)

(assert (=> b!318167 m!456183))

(declare-fun m!456185 () Bool)

(assert (=> b!318167 m!456185))

(declare-fun m!456187 () Bool)

(assert (=> b!318167 m!456187))

(declare-fun m!456189 () Bool)

(assert (=> start!70234 m!456189))

(declare-fun m!456191 () Bool)

(assert (=> start!70234 m!456191))

(declare-fun m!456193 () Bool)

(assert (=> b!318169 m!456193))

(push 1)

(assert (not start!70234))

(assert (not b!318167))

(assert (not b!318168))

(assert (not b!318169))

(assert (not b!318171))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

