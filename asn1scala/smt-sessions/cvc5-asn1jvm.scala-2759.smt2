; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66886 () Bool)

(assert start!66886)

(declare-fun res!246764 () Bool)

(declare-fun e!214565 () Bool)

(assert (=> start!66886 (=> (not res!246764) (not e!214565))))

(declare-fun at!286 () (_ BitVec 64))

(declare-datatypes ((array!18113 0))(
  ( (array!18114 (arr!8944 (Array (_ BitVec 32) (_ BitVec 8))) (size!7861 (_ BitVec 32))) )
))
(declare-fun a!434 () array!18113)

(assert (=> start!66886 (= res!246764 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!286) (bvslt at!286 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7861 a!434))))))))

(assert (=> start!66886 e!214565))

(assert (=> start!66886 true))

(declare-fun array_inv!7473 (array!18113) Bool)

(assert (=> start!66886 (array_inv!7473 a!434)))

(declare-fun b!299000 () Bool)

(declare-fun e!214563 () Bool)

(assert (=> b!299000 (= e!214563 (not true))))

(declare-fun lt!434952 () array!18113)

(declare-fun arrayBitRangesEq!0 (array!18113 array!18113 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!299000 (arrayBitRangesEq!0 a!434 lt!434952 #b0000000000000000000000000000000000000000000000000000000000000000 at!286)))

(declare-datatypes ((Unit!20863 0))(
  ( (Unit!20864) )
))
(declare-fun lt!434950 () Unit!20863)

(declare-fun i!1010 () (_ BitVec 64))

(declare-fun b!320 () Bool)

(declare-fun rec!19 (array!18113 (_ BitVec 64) Bool (_ BitVec 64)) Unit!20863)

(assert (=> b!299000 (= lt!434950 (rec!19 a!434 at!286 b!320 (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!299001 () Bool)

(declare-fun e!214564 () Bool)

(assert (=> b!299001 (= e!214564 e!214563)))

(declare-fun res!246763 () Bool)

(assert (=> b!299001 (=> (not res!246763) (not e!214563))))

(assert (=> b!299001 (= res!246763 (arrayBitRangesEq!0 a!434 lt!434952 i!1010 at!286))))

(declare-fun lt!434949 () (_ BitVec 32))

(declare-fun lt!434951 () (_ BitVec 32))

(assert (=> b!299001 (= lt!434952 (array!18114 (store (arr!8944 a!434) lt!434951 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8944 a!434) lt!434951)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434949)))) ((_ sign_extend 24) (ite b!320 (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434949) #b00000000))))) (size!7861 a!434)))))

(declare-fun b!299002 () Bool)

(declare-fun res!246762 () Bool)

(assert (=> b!299002 (=> (not res!246762) (not e!214563))))

(assert (=> b!299002 (= res!246762 (arrayBitRangesEq!0 a!434 lt!434952 (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001) at!286))))

(declare-fun b!299003 () Bool)

(declare-fun res!246760 () Bool)

(assert (=> b!299003 (=> (not res!246760) (not e!214563))))

(assert (=> b!299003 (= res!246760 (and (not (= i!1010 #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsle (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001) at!286)))))

(declare-fun b!299004 () Bool)

(assert (=> b!299004 (= e!214565 e!214564)))

(declare-fun res!246761 () Bool)

(assert (=> b!299004 (=> (not res!246761) (not e!214564))))

(assert (=> b!299004 (= res!246761 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1010) (bvsle i!1010 at!286)))))

(assert (=> b!299004 (= lt!434949 ((_ extract 31 0) (bvsrem at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!299004 (= lt!434951 ((_ extract 31 0) (bvsdiv at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and start!66886 res!246764) b!299004))

(assert (= (and b!299004 res!246761) b!299001))

(assert (= (and b!299001 res!246763) b!299003))

(assert (= (and b!299003 res!246760) b!299002))

(assert (= (and b!299002 res!246762) b!299000))

(declare-fun m!438253 () Bool)

(assert (=> start!66886 m!438253))

(declare-fun m!438255 () Bool)

(assert (=> b!299000 m!438255))

(declare-fun m!438257 () Bool)

(assert (=> b!299000 m!438257))

(declare-fun m!438259 () Bool)

(assert (=> b!299001 m!438259))

(declare-fun m!438261 () Bool)

(assert (=> b!299001 m!438261))

(declare-fun m!438263 () Bool)

(assert (=> b!299001 m!438263))

(declare-fun m!438265 () Bool)

(assert (=> b!299001 m!438265))

(declare-fun m!438267 () Bool)

(assert (=> b!299002 m!438267))

(push 1)

(assert (not b!299000))

(assert (not start!66886))

(assert (not b!299002))

(assert (not b!299001))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

