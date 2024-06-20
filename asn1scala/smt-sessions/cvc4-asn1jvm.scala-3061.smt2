; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70810 () Bool)

(assert start!70810)

(declare-fun res!263230 () Bool)

(declare-fun e!230502 () Bool)

(assert (=> start!70810 (=> (not res!263230) (not e!230502))))

(declare-fun i!979 () (_ BitVec 64))

(assert (=> start!70810 (= res!263230 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!979))))

(assert (=> start!70810 e!230502))

(assert (=> start!70810 true))

(declare-datatypes ((array!20127 0))(
  ( (array!20128 (arr!9864 (Array (_ BitVec 32) (_ BitVec 8))) (size!8772 (_ BitVec 32))) )
))
(declare-fun a!425 () array!20127)

(declare-fun array_inv!8324 (array!20127) Bool)

(assert (=> start!70810 (array_inv!8324 a!425)))

(declare-fun b!320348 () Bool)

(declare-fun e!230500 () Bool)

(assert (=> b!320348 (= e!230502 e!230500)))

(declare-fun res!263231 () Bool)

(assert (=> b!320348 (=> (not res!263231) (not e!230500))))

(declare-fun lt!443923 () (_ BitVec 64))

(assert (=> b!320348 (= res!263231 (bvsle i!979 lt!443923))))

(assert (=> b!320348 (= lt!443923 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8772 a!425))))))

(declare-fun b!320350 () Bool)

(declare-fun res!263233 () Bool)

(assert (=> b!320350 (=> (not res!263233) (not e!230500))))

(assert (=> b!320350 (= res!263233 (not (= i!979 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!320351 () Bool)

(assert (=> b!320351 (= e!230500 (and (not (= ((_ sign_extend 32) (size!8772 a!425)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv lt!443923 ((_ sign_extend 32) (size!8772 a!425)))))))))

(declare-datatypes ((Unit!21957 0))(
  ( (Unit!21958) )
))
(declare-fun lt!443924 () Unit!21957)

(declare-fun rec!17 (array!20127 (_ BitVec 64)) Unit!21957)

(assert (=> b!320351 (= lt!443924 (rec!17 a!425 (bvsub i!979 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!320349 () Bool)

(declare-fun res!263232 () Bool)

(assert (=> b!320349 (=> (not res!263232) (not e!230500))))

(declare-fun arrayBitRangesEq!0 (array!20127 array!20127 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!320349 (= res!263232 (arrayBitRangesEq!0 a!425 a!425 i!979 lt!443923))))

(assert (= (and start!70810 res!263230) b!320348))

(assert (= (and b!320348 res!263231) b!320349))

(assert (= (and b!320349 res!263232) b!320350))

(assert (= (and b!320350 res!263233) b!320351))

(declare-fun m!458699 () Bool)

(assert (=> start!70810 m!458699))

(declare-fun m!458701 () Bool)

(assert (=> b!320351 m!458701))

(declare-fun m!458703 () Bool)

(assert (=> b!320349 m!458703))

(push 1)

(assert (not start!70810))

(assert (not b!320349))

(assert (not b!320351))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

