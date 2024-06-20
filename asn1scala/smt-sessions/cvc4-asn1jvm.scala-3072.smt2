; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70896 () Bool)

(assert start!70896)

(declare-fun res!263355 () Bool)

(declare-fun e!230690 () Bool)

(assert (=> start!70896 (=> (not res!263355) (not e!230690))))

(declare-fun lt!444013 () (_ BitVec 64))

(assert (=> start!70896 (= res!263355 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!444013))))

(declare-datatypes ((array!20179 0))(
  ( (array!20180 (arr!9888 (Array (_ BitVec 32) (_ BitVec 8))) (size!8796 (_ BitVec 32))) )
))
(declare-fun a!440 () array!20179)

(assert (=> start!70896 (= lt!444013 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8796 a!440))))))

(assert (=> start!70896 e!230690))

(declare-fun array_inv!8348 (array!20179) Bool)

(assert (=> start!70896 (array_inv!8348 a!440)))

(declare-fun b!320571 () Bool)

(declare-fun res!263356 () Bool)

(assert (=> b!320571 (=> (not res!263356) (not e!230690))))

(declare-fun arrayBitRangesEq!0 (array!20179 array!20179 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!320571 (= res!263356 (arrayBitRangesEq!0 a!440 a!440 lt!444013 lt!444013))))

(declare-fun b!320572 () Bool)

(assert (=> b!320572 (= e!230690 (not true))))

(assert (=> b!320572 (arrayBitRangesEq!0 a!440 a!440 #b0000000000000000000000000000000000000000000000000000000000000000 lt!444013)))

(declare-datatypes ((Unit!21972 0))(
  ( (Unit!21973) )
))
(declare-fun lt!444014 () Unit!21972)

(declare-fun rec!21 (array!20179 (_ BitVec 64)) Unit!21972)

(assert (=> b!320572 (= lt!444014 (rec!21 a!440 lt!444013))))

(assert (= (and start!70896 res!263355) b!320571))

(assert (= (and b!320571 res!263356) b!320572))

(declare-fun m!458921 () Bool)

(assert (=> start!70896 m!458921))

(declare-fun m!458923 () Bool)

(assert (=> b!320571 m!458923))

(declare-fun m!458925 () Bool)

(assert (=> b!320572 m!458925))

(declare-fun m!458927 () Bool)

(assert (=> b!320572 m!458927))

(push 1)

(assert (not start!70896))

(assert (not b!320571))

(assert (not b!320572))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

