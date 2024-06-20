; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70894 () Bool)

(assert start!70894)

(declare-fun res!263349 () Bool)

(declare-fun e!230685 () Bool)

(assert (=> start!70894 (=> (not res!263349) (not e!230685))))

(declare-fun lt!444008 () (_ BitVec 64))

(assert (=> start!70894 (= res!263349 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!444008))))

(declare-datatypes ((array!20177 0))(
  ( (array!20178 (arr!9887 (Array (_ BitVec 32) (_ BitVec 8))) (size!8795 (_ BitVec 32))) )
))
(declare-fun a!440 () array!20177)

(assert (=> start!70894 (= lt!444008 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8795 a!440))))))

(assert (=> start!70894 e!230685))

(declare-fun array_inv!8347 (array!20177) Bool)

(assert (=> start!70894 (array_inv!8347 a!440)))

(declare-fun b!320565 () Bool)

(declare-fun res!263350 () Bool)

(assert (=> b!320565 (=> (not res!263350) (not e!230685))))

(declare-fun arrayBitRangesEq!0 (array!20177 array!20177 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!320565 (= res!263350 (arrayBitRangesEq!0 a!440 a!440 lt!444008 lt!444008))))

(declare-fun b!320566 () Bool)

(assert (=> b!320566 (= e!230685 (not true))))

(assert (=> b!320566 (arrayBitRangesEq!0 a!440 a!440 #b0000000000000000000000000000000000000000000000000000000000000000 lt!444008)))

(declare-datatypes ((Unit!21970 0))(
  ( (Unit!21971) )
))
(declare-fun lt!444007 () Unit!21970)

(declare-fun rec!21 (array!20177 (_ BitVec 64)) Unit!21970)

(assert (=> b!320566 (= lt!444007 (rec!21 a!440 lt!444008))))

(assert (= (and start!70894 res!263349) b!320565))

(assert (= (and b!320565 res!263350) b!320566))

(declare-fun m!458913 () Bool)

(assert (=> start!70894 m!458913))

(declare-fun m!458915 () Bool)

(assert (=> b!320565 m!458915))

(declare-fun m!458917 () Bool)

(assert (=> b!320566 m!458917))

(declare-fun m!458919 () Bool)

(assert (=> b!320566 m!458919))

(check-sat (not b!320566) (not start!70894) (not b!320565))
