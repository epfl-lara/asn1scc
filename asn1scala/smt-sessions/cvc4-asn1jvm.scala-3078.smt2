; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70950 () Bool)

(assert start!70950)

(declare-fun res!263464 () Bool)

(declare-fun e!230835 () Bool)

(assert (=> start!70950 (=> (not res!263464) (not e!230835))))

(declare-fun lt!444103 () (_ BitVec 64))

(assert (=> start!70950 (= res!263464 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!444103))))

(declare-datatypes ((array!20221 0))(
  ( (array!20222 (arr!9906 (Array (_ BitVec 32) (_ BitVec 8))) (size!8814 (_ BitVec 32))) )
))
(declare-fun a!440 () array!20221)

(assert (=> start!70950 (= lt!444103 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8814 a!440))))))

(assert (=> start!70950 e!230835))

(declare-fun array_inv!8366 (array!20221) Bool)

(assert (=> start!70950 (array_inv!8366 a!440)))

(declare-fun b!320697 () Bool)

(declare-fun res!263463 () Bool)

(assert (=> b!320697 (=> (not res!263463) (not e!230835))))

(declare-fun arrayBitRangesEq!0 (array!20221 array!20221 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!320697 (= res!263463 (arrayBitRangesEq!0 a!440 a!440 lt!444103 lt!444103))))

(declare-fun b!320698 () Bool)

(assert (=> b!320698 (= e!230835 (not true))))

(assert (=> b!320698 (arrayBitRangesEq!0 a!440 a!440 #b0000000000000000000000000000000000000000000000000000000000000000 lt!444103)))

(declare-datatypes ((Unit!21990 0))(
  ( (Unit!21991) )
))
(declare-fun lt!444104 () Unit!21990)

(declare-fun rec!21 (array!20221 (_ BitVec 64)) Unit!21990)

(assert (=> b!320698 (= lt!444104 (rec!21 a!440 lt!444103))))

(assert (= (and start!70950 res!263464) b!320697))

(assert (= (and b!320697 res!263463) b!320698))

(declare-fun m!459053 () Bool)

(assert (=> start!70950 m!459053))

(declare-fun m!459055 () Bool)

(assert (=> b!320697 m!459055))

(declare-fun m!459057 () Bool)

(assert (=> b!320698 m!459057))

(declare-fun m!459059 () Bool)

(assert (=> b!320698 m!459059))

(push 1)

(assert (not b!320698))

(assert (not start!70950))

(assert (not b!320697))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

