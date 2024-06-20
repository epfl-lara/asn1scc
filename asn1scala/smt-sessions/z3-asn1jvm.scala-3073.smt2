; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70900 () Bool)

(assert start!70900)

(declare-fun res!263367 () Bool)

(declare-fun e!230702 () Bool)

(assert (=> start!70900 (=> (not res!263367) (not e!230702))))

(declare-fun lt!444025 () (_ BitVec 64))

(assert (=> start!70900 (= res!263367 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!444025))))

(declare-datatypes ((array!20183 0))(
  ( (array!20184 (arr!9890 (Array (_ BitVec 32) (_ BitVec 8))) (size!8798 (_ BitVec 32))) )
))
(declare-fun a!440 () array!20183)

(assert (=> start!70900 (= lt!444025 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8798 a!440))))))

(assert (=> start!70900 e!230702))

(declare-fun array_inv!8350 (array!20183) Bool)

(assert (=> start!70900 (array_inv!8350 a!440)))

(declare-fun b!320583 () Bool)

(declare-fun res!263368 () Bool)

(assert (=> b!320583 (=> (not res!263368) (not e!230702))))

(declare-fun arrayBitRangesEq!0 (array!20183 array!20183 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!320583 (= res!263368 (arrayBitRangesEq!0 a!440 a!440 lt!444025 lt!444025))))

(declare-fun b!320584 () Bool)

(assert (=> b!320584 (= e!230702 (not true))))

(assert (=> b!320584 (arrayBitRangesEq!0 a!440 a!440 #b0000000000000000000000000000000000000000000000000000000000000000 lt!444025)))

(declare-datatypes ((Unit!21976 0))(
  ( (Unit!21977) )
))
(declare-fun lt!444026 () Unit!21976)

(declare-fun rec!21 (array!20183 (_ BitVec 64)) Unit!21976)

(assert (=> b!320584 (= lt!444026 (rec!21 a!440 lt!444025))))

(assert (= (and start!70900 res!263367) b!320583))

(assert (= (and b!320583 res!263368) b!320584))

(declare-fun m!458937 () Bool)

(assert (=> start!70900 m!458937))

(declare-fun m!458939 () Bool)

(assert (=> b!320583 m!458939))

(declare-fun m!458941 () Bool)

(assert (=> b!320584 m!458941))

(declare-fun m!458943 () Bool)

(assert (=> b!320584 m!458943))

(check-sat (not b!320583) (not b!320584) (not start!70900))
