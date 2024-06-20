; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70948 () Bool)

(assert start!70948)

(declare-fun res!263457 () Bool)

(declare-fun e!230829 () Bool)

(assert (=> start!70948 (=> (not res!263457) (not e!230829))))

(declare-fun lt!444097 () (_ BitVec 64))

(assert (=> start!70948 (= res!263457 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!444097))))

(declare-datatypes ((array!20219 0))(
  ( (array!20220 (arr!9905 (Array (_ BitVec 32) (_ BitVec 8))) (size!8813 (_ BitVec 32))) )
))
(declare-fun a!440 () array!20219)

(assert (=> start!70948 (= lt!444097 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8813 a!440))))))

(assert (=> start!70948 e!230829))

(declare-fun array_inv!8365 (array!20219) Bool)

(assert (=> start!70948 (array_inv!8365 a!440)))

(declare-fun b!320691 () Bool)

(declare-fun res!263458 () Bool)

(assert (=> b!320691 (=> (not res!263458) (not e!230829))))

(declare-fun arrayBitRangesEq!0 (array!20219 array!20219 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!320691 (= res!263458 (arrayBitRangesEq!0 a!440 a!440 lt!444097 lt!444097))))

(declare-fun b!320692 () Bool)

(assert (=> b!320692 (= e!230829 (not true))))

(assert (=> b!320692 (arrayBitRangesEq!0 a!440 a!440 #b0000000000000000000000000000000000000000000000000000000000000000 lt!444097)))

(declare-datatypes ((Unit!21988 0))(
  ( (Unit!21989) )
))
(declare-fun lt!444098 () Unit!21988)

(declare-fun rec!21 (array!20219 (_ BitVec 64)) Unit!21988)

(assert (=> b!320692 (= lt!444098 (rec!21 a!440 lt!444097))))

(assert (= (and start!70948 res!263457) b!320691))

(assert (= (and b!320691 res!263458) b!320692))

(declare-fun m!459045 () Bool)

(assert (=> start!70948 m!459045))

(declare-fun m!459047 () Bool)

(assert (=> b!320691 m!459047))

(declare-fun m!459049 () Bool)

(assert (=> b!320692 m!459049))

(declare-fun m!459051 () Bool)

(assert (=> b!320692 m!459051))

(check-sat (not b!320691) (not b!320692) (not start!70948))
