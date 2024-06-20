; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70892 () Bool)

(assert start!70892)

(declare-fun res!263344 () Bool)

(declare-fun e!230679 () Bool)

(assert (=> start!70892 (=> (not res!263344) (not e!230679))))

(declare-fun lt!444002 () (_ BitVec 64))

(assert (=> start!70892 (= res!263344 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!444002))))

(declare-datatypes ((array!20175 0))(
  ( (array!20176 (arr!9886 (Array (_ BitVec 32) (_ BitVec 8))) (size!8794 (_ BitVec 32))) )
))
(declare-fun a!440 () array!20175)

(assert (=> start!70892 (= lt!444002 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8794 a!440))))))

(assert (=> start!70892 e!230679))

(declare-fun array_inv!8346 (array!20175) Bool)

(assert (=> start!70892 (array_inv!8346 a!440)))

(declare-fun b!320559 () Bool)

(declare-fun res!263343 () Bool)

(assert (=> b!320559 (=> (not res!263343) (not e!230679))))

(declare-fun arrayBitRangesEq!0 (array!20175 array!20175 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!320559 (= res!263343 (arrayBitRangesEq!0 a!440 a!440 lt!444002 lt!444002))))

(declare-fun b!320560 () Bool)

(assert (=> b!320560 (= e!230679 (not true))))

(assert (=> b!320560 (arrayBitRangesEq!0 a!440 a!440 #b0000000000000000000000000000000000000000000000000000000000000000 lt!444002)))

(declare-datatypes ((Unit!21968 0))(
  ( (Unit!21969) )
))
(declare-fun lt!444001 () Unit!21968)

(declare-fun rec!21 (array!20175 (_ BitVec 64)) Unit!21968)

(assert (=> b!320560 (= lt!444001 (rec!21 a!440 lt!444002))))

(assert (= (and start!70892 res!263344) b!320559))

(assert (= (and b!320559 res!263343) b!320560))

(declare-fun m!458905 () Bool)

(assert (=> start!70892 m!458905))

(declare-fun m!458907 () Bool)

(assert (=> b!320559 m!458907))

(declare-fun m!458909 () Bool)

(assert (=> b!320560 m!458909))

(declare-fun m!458911 () Bool)

(assert (=> b!320560 m!458911))

(push 1)

(assert (not b!320559))

(assert (not b!320560))

(assert (not start!70892))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

