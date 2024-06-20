; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70940 () Bool)

(assert start!70940)

(declare-fun res!263434 () Bool)

(declare-fun e!230804 () Bool)

(assert (=> start!70940 (=> (not res!263434) (not e!230804))))

(declare-fun lt!444074 () (_ BitVec 64))

(assert (=> start!70940 (= res!263434 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!444074))))

(declare-datatypes ((array!20211 0))(
  ( (array!20212 (arr!9901 (Array (_ BitVec 32) (_ BitVec 8))) (size!8809 (_ BitVec 32))) )
))
(declare-fun a!440 () array!20211)

(assert (=> start!70940 (= lt!444074 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8809 a!440))))))

(assert (=> start!70940 e!230804))

(declare-fun array_inv!8361 (array!20211) Bool)

(assert (=> start!70940 (array_inv!8361 a!440)))

(declare-fun b!320667 () Bool)

(declare-fun res!263433 () Bool)

(assert (=> b!320667 (=> (not res!263433) (not e!230804))))

(declare-fun arrayBitRangesEq!0 (array!20211 array!20211 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!320667 (= res!263433 (arrayBitRangesEq!0 a!440 a!440 lt!444074 lt!444074))))

(declare-fun b!320668 () Bool)

(assert (=> b!320668 (= e!230804 (not (or (= ((_ sign_extend 32) (size!8809 a!440)) #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv lt!444074 ((_ sign_extend 32) (size!8809 a!440)))))))))

(assert (=> b!320668 (arrayBitRangesEq!0 a!440 a!440 #b0000000000000000000000000000000000000000000000000000000000000000 lt!444074)))

(declare-datatypes ((Unit!21980 0))(
  ( (Unit!21981) )
))
(declare-fun lt!444073 () Unit!21980)

(declare-fun rec!21 (array!20211 (_ BitVec 64)) Unit!21980)

(assert (=> b!320668 (= lt!444073 (rec!21 a!440 lt!444074))))

(assert (= (and start!70940 res!263434) b!320667))

(assert (= (and b!320667 res!263433) b!320668))

(declare-fun m!459013 () Bool)

(assert (=> start!70940 m!459013))

(declare-fun m!459015 () Bool)

(assert (=> b!320667 m!459015))

(declare-fun m!459017 () Bool)

(assert (=> b!320668 m!459017))

(declare-fun m!459019 () Bool)

(assert (=> b!320668 m!459019))

(push 1)

(assert (not b!320667))

(assert (not b!320668))

(assert (not start!70940))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

