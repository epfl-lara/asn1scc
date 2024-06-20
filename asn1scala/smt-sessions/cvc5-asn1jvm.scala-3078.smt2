; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70946 () Bool)

(assert start!70946)

(declare-fun res!263451 () Bool)

(declare-fun e!230822 () Bool)

(assert (=> start!70946 (=> (not res!263451) (not e!230822))))

(declare-fun lt!444091 () (_ BitVec 64))

(assert (=> start!70946 (= res!263451 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!444091))))

(declare-datatypes ((array!20217 0))(
  ( (array!20218 (arr!9904 (Array (_ BitVec 32) (_ BitVec 8))) (size!8812 (_ BitVec 32))) )
))
(declare-fun a!440 () array!20217)

(assert (=> start!70946 (= lt!444091 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8812 a!440))))))

(assert (=> start!70946 e!230822))

(declare-fun array_inv!8364 (array!20217) Bool)

(assert (=> start!70946 (array_inv!8364 a!440)))

(declare-fun b!320685 () Bool)

(declare-fun res!263452 () Bool)

(assert (=> b!320685 (=> (not res!263452) (not e!230822))))

(declare-fun arrayBitRangesEq!0 (array!20217 array!20217 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!320685 (= res!263452 (arrayBitRangesEq!0 a!440 a!440 lt!444091 lt!444091))))

(declare-fun b!320686 () Bool)

(assert (=> b!320686 (= e!230822 (not true))))

(assert (=> b!320686 (arrayBitRangesEq!0 a!440 a!440 #b0000000000000000000000000000000000000000000000000000000000000000 lt!444091)))

(declare-datatypes ((Unit!21986 0))(
  ( (Unit!21987) )
))
(declare-fun lt!444092 () Unit!21986)

(declare-fun rec!21 (array!20217 (_ BitVec 64)) Unit!21986)

(assert (=> b!320686 (= lt!444092 (rec!21 a!440 lt!444091))))

(assert (= (and start!70946 res!263451) b!320685))

(assert (= (and b!320685 res!263452) b!320686))

(declare-fun m!459037 () Bool)

(assert (=> start!70946 m!459037))

(declare-fun m!459039 () Bool)

(assert (=> b!320685 m!459039))

(declare-fun m!459041 () Bool)

(assert (=> b!320686 m!459041))

(declare-fun m!459043 () Bool)

(assert (=> b!320686 m!459043))

(push 1)

(assert (not start!70946))

(assert (not b!320685))

(assert (not b!320686))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

