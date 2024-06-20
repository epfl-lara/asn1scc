; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70898 () Bool)

(assert start!70898)

(declare-fun res!263361 () Bool)

(declare-fun e!230697 () Bool)

(assert (=> start!70898 (=> (not res!263361) (not e!230697))))

(declare-fun lt!444019 () (_ BitVec 64))

(assert (=> start!70898 (= res!263361 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!444019))))

(declare-datatypes ((array!20181 0))(
  ( (array!20182 (arr!9889 (Array (_ BitVec 32) (_ BitVec 8))) (size!8797 (_ BitVec 32))) )
))
(declare-fun a!440 () array!20181)

(assert (=> start!70898 (= lt!444019 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8797 a!440))))))

(assert (=> start!70898 e!230697))

(declare-fun array_inv!8349 (array!20181) Bool)

(assert (=> start!70898 (array_inv!8349 a!440)))

(declare-fun b!320577 () Bool)

(declare-fun res!263362 () Bool)

(assert (=> b!320577 (=> (not res!263362) (not e!230697))))

(declare-fun arrayBitRangesEq!0 (array!20181 array!20181 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!320577 (= res!263362 (arrayBitRangesEq!0 a!440 a!440 lt!444019 lt!444019))))

(declare-fun b!320578 () Bool)

(assert (=> b!320578 (= e!230697 (not true))))

(assert (=> b!320578 (arrayBitRangesEq!0 a!440 a!440 #b0000000000000000000000000000000000000000000000000000000000000000 lt!444019)))

(declare-datatypes ((Unit!21974 0))(
  ( (Unit!21975) )
))
(declare-fun lt!444020 () Unit!21974)

(declare-fun rec!21 (array!20181 (_ BitVec 64)) Unit!21974)

(assert (=> b!320578 (= lt!444020 (rec!21 a!440 lt!444019))))

(assert (= (and start!70898 res!263361) b!320577))

(assert (= (and b!320577 res!263362) b!320578))

(declare-fun m!458929 () Bool)

(assert (=> start!70898 m!458929))

(declare-fun m!458931 () Bool)

(assert (=> b!320577 m!458931))

(declare-fun m!458933 () Bool)

(assert (=> b!320578 m!458933))

(declare-fun m!458935 () Bool)

(assert (=> b!320578 m!458935))

(push 1)

(assert (not start!70898))

(assert (not b!320578))

(assert (not b!320577))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

