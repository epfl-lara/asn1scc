; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70944 () Bool)

(assert start!70944)

(declare-fun res!263446 () Bool)

(declare-fun e!230817 () Bool)

(assert (=> start!70944 (=> (not res!263446) (not e!230817))))

(declare-fun lt!444086 () (_ BitVec 64))

(assert (=> start!70944 (= res!263446 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!444086))))

(declare-datatypes ((array!20215 0))(
  ( (array!20216 (arr!9903 (Array (_ BitVec 32) (_ BitVec 8))) (size!8811 (_ BitVec 32))) )
))
(declare-fun a!440 () array!20215)

(assert (=> start!70944 (= lt!444086 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8811 a!440))))))

(assert (=> start!70944 e!230817))

(declare-fun array_inv!8363 (array!20215) Bool)

(assert (=> start!70944 (array_inv!8363 a!440)))

(declare-fun b!320679 () Bool)

(declare-fun res!263445 () Bool)

(assert (=> b!320679 (=> (not res!263445) (not e!230817))))

(declare-fun arrayBitRangesEq!0 (array!20215 array!20215 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!320679 (= res!263445 (arrayBitRangesEq!0 a!440 a!440 lt!444086 lt!444086))))

(declare-fun b!320680 () Bool)

(assert (=> b!320680 (= e!230817 (not (or (= ((_ sign_extend 32) (size!8811 a!440)) #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv lt!444086 ((_ sign_extend 32) (size!8811 a!440)))))))))

(assert (=> b!320680 (arrayBitRangesEq!0 a!440 a!440 #b0000000000000000000000000000000000000000000000000000000000000000 lt!444086)))

(declare-datatypes ((Unit!21984 0))(
  ( (Unit!21985) )
))
(declare-fun lt!444085 () Unit!21984)

(declare-fun rec!21 (array!20215 (_ BitVec 64)) Unit!21984)

(assert (=> b!320680 (= lt!444085 (rec!21 a!440 lt!444086))))

(assert (= (and start!70944 res!263446) b!320679))

(assert (= (and b!320679 res!263445) b!320680))

(declare-fun m!459029 () Bool)

(assert (=> start!70944 m!459029))

(declare-fun m!459031 () Bool)

(assert (=> b!320679 m!459031))

(declare-fun m!459033 () Bool)

(assert (=> b!320680 m!459033))

(declare-fun m!459035 () Bool)

(assert (=> b!320680 m!459035))

(push 1)

(assert (not start!70944))

(assert (not b!320679))

(assert (not b!320680))

(check-sat)

(pop 1)

(push 1)

(check-sat)

