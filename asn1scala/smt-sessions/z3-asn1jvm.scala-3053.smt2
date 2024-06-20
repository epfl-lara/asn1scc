; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70760 () Bool)

(assert start!70760)

(declare-fun b!320149 () Bool)

(declare-fun res!263031 () Bool)

(declare-fun e!230313 () Bool)

(assert (=> b!320149 (=> (not res!263031) (not e!230313))))

(declare-fun i!979 () (_ BitVec 64))

(assert (=> b!320149 (= res!263031 (not (= i!979 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!320150 () Bool)

(assert (=> b!320150 (= e!230313 false)))

(declare-datatypes ((Unit!21943 0))(
  ( (Unit!21944) )
))
(declare-fun lt!443846 () Unit!21943)

(declare-datatypes ((array!20077 0))(
  ( (array!20078 (arr!9839 (Array (_ BitVec 32) (_ BitVec 8))) (size!8747 (_ BitVec 32))) )
))
(declare-fun a!425 () array!20077)

(declare-fun rec!17 (array!20077 (_ BitVec 64)) Unit!21943)

(assert (=> b!320150 (= lt!443846 (rec!17 a!425 (bvsub i!979 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!320147 () Bool)

(declare-fun e!230311 () Bool)

(assert (=> b!320147 (= e!230311 e!230313)))

(declare-fun res!263032 () Bool)

(assert (=> b!320147 (=> (not res!263032) (not e!230313))))

(declare-fun lt!443845 () (_ BitVec 64))

(assert (=> b!320147 (= res!263032 (bvsle i!979 lt!443845))))

(assert (=> b!320147 (= lt!443845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8747 a!425))))))

(declare-fun res!263030 () Bool)

(assert (=> start!70760 (=> (not res!263030) (not e!230311))))

(assert (=> start!70760 (= res!263030 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!979))))

(assert (=> start!70760 e!230311))

(assert (=> start!70760 true))

(declare-fun array_inv!8299 (array!20077) Bool)

(assert (=> start!70760 (array_inv!8299 a!425)))

(declare-fun b!320148 () Bool)

(declare-fun res!263029 () Bool)

(assert (=> b!320148 (=> (not res!263029) (not e!230313))))

(declare-fun arrayBitRangesEq!0 (array!20077 array!20077 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!320148 (= res!263029 (arrayBitRangesEq!0 a!425 a!425 i!979 lt!443845))))

(assert (= (and start!70760 res!263030) b!320147))

(assert (= (and b!320147 res!263032) b!320148))

(assert (= (and b!320148 res!263029) b!320149))

(assert (= (and b!320149 res!263031) b!320150))

(declare-fun m!458591 () Bool)

(assert (=> b!320150 m!458591))

(declare-fun m!458593 () Bool)

(assert (=> start!70760 m!458593))

(declare-fun m!458595 () Bool)

(assert (=> b!320148 m!458595))

(check-sat (not b!320148) (not b!320150) (not start!70760))
