; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70796 () Bool)

(assert start!70796)

(declare-fun res!263159 () Bool)

(declare-fun e!230438 () Bool)

(assert (=> start!70796 (=> (not res!263159) (not e!230438))))

(declare-fun i!979 () (_ BitVec 64))

(assert (=> start!70796 (= res!263159 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!979))))

(assert (=> start!70796 e!230438))

(assert (=> start!70796 true))

(declare-datatypes ((array!20113 0))(
  ( (array!20114 (arr!9857 (Array (_ BitVec 32) (_ BitVec 8))) (size!8765 (_ BitVec 32))) )
))
(declare-fun a!425 () array!20113)

(declare-fun array_inv!8317 (array!20113) Bool)

(assert (=> start!70796 (array_inv!8317 a!425)))

(declare-fun b!320277 () Bool)

(declare-fun e!230437 () Bool)

(assert (=> b!320277 (= e!230438 e!230437)))

(declare-fun res!263161 () Bool)

(assert (=> b!320277 (=> (not res!263161) (not e!230437))))

(declare-fun lt!443894 () (_ BitVec 64))

(assert (=> b!320277 (= res!263161 (bvsle i!979 lt!443894))))

(assert (=> b!320277 (= lt!443894 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8765 a!425))))))

(declare-fun b!320278 () Bool)

(declare-fun res!263160 () Bool)

(assert (=> b!320278 (=> (not res!263160) (not e!230437))))

(declare-fun arrayBitRangesEq!0 (array!20113 array!20113 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!320278 (= res!263160 (arrayBitRangesEq!0 a!425 a!425 i!979 lt!443894))))

(declare-fun b!320279 () Bool)

(assert (=> b!320279 (= e!230437 (and (not (= i!979 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand i!979 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand i!979 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub i!979 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!70796 res!263159) b!320277))

(assert (= (and b!320277 res!263161) b!320278))

(assert (= (and b!320278 res!263160) b!320279))

(declare-fun m!458667 () Bool)

(assert (=> start!70796 m!458667))

(declare-fun m!458669 () Bool)

(assert (=> b!320278 m!458669))

(check-sat (not start!70796) (not b!320278))
(check-sat)
