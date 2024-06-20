; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66884 () Bool)

(assert start!66884)

(declare-fun b!298985 () Bool)

(declare-fun e!214552 () Bool)

(declare-fun e!214553 () Bool)

(assert (=> b!298985 (= e!214552 e!214553)))

(declare-fun res!246749 () Bool)

(assert (=> b!298985 (=> (not res!246749) (not e!214553))))

(declare-fun i!1010 () (_ BitVec 64))

(declare-fun at!286 () (_ BitVec 64))

(assert (=> b!298985 (= res!246749 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1010) (bvsle i!1010 at!286)))))

(declare-fun lt!434939 () (_ BitVec 32))

(assert (=> b!298985 (= lt!434939 ((_ extract 31 0) (bvsrem at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!434940 () (_ BitVec 32))

(assert (=> b!298985 (= lt!434940 ((_ extract 31 0) (bvsdiv at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!298986 () Bool)

(declare-fun e!214551 () Bool)

(assert (=> b!298986 (= e!214553 e!214551)))

(declare-fun res!246747 () Bool)

(assert (=> b!298986 (=> (not res!246747) (not e!214551))))

(declare-datatypes ((array!18111 0))(
  ( (array!18112 (arr!8943 (Array (_ BitVec 32) (_ BitVec 8))) (size!7860 (_ BitVec 32))) )
))
(declare-fun lt!434937 () array!18111)

(declare-fun a!434 () array!18111)

(declare-fun arrayBitRangesEq!0 (array!18111 array!18111 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298986 (= res!246747 (arrayBitRangesEq!0 a!434 lt!434937 i!1010 at!286))))

(declare-fun b!320 () Bool)

(assert (=> b!298986 (= lt!434937 (array!18112 (store (arr!8943 a!434) lt!434940 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8943 a!434) lt!434940)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434939)))) ((_ sign_extend 24) (ite b!320 (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434939) #b00000000))))) (size!7860 a!434)))))

(declare-fun b!298987 () Bool)

(declare-fun res!246748 () Bool)

(assert (=> b!298987 (=> (not res!246748) (not e!214551))))

(assert (=> b!298987 (= res!246748 (arrayBitRangesEq!0 a!434 lt!434937 (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001) at!286))))

(declare-fun b!298988 () Bool)

(assert (=> b!298988 (= e!214551 (not (and (bvsge lt!434940 #b00000000000000000000000000000000) (bvslt lt!434940 (size!7860 a!434)))))))

(assert (=> b!298988 (arrayBitRangesEq!0 a!434 lt!434937 #b0000000000000000000000000000000000000000000000000000000000000000 at!286)))

(declare-datatypes ((Unit!20861 0))(
  ( (Unit!20862) )
))
(declare-fun lt!434938 () Unit!20861)

(declare-fun rec!19 (array!18111 (_ BitVec 64) Bool (_ BitVec 64)) Unit!20861)

(assert (=> b!298988 (= lt!434938 (rec!19 a!434 at!286 b!320 (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun res!246745 () Bool)

(assert (=> start!66884 (=> (not res!246745) (not e!214552))))

(assert (=> start!66884 (= res!246745 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!286) (bvslt at!286 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7860 a!434))))))))

(assert (=> start!66884 e!214552))

(assert (=> start!66884 true))

(declare-fun array_inv!7472 (array!18111) Bool)

(assert (=> start!66884 (array_inv!7472 a!434)))

(declare-fun b!298989 () Bool)

(declare-fun res!246746 () Bool)

(assert (=> b!298989 (=> (not res!246746) (not e!214551))))

(assert (=> b!298989 (= res!246746 (and (not (= i!1010 #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsle (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001) at!286)))))

(assert (= (and start!66884 res!246745) b!298985))

(assert (= (and b!298985 res!246749) b!298986))

(assert (= (and b!298986 res!246747) b!298989))

(assert (= (and b!298989 res!246746) b!298987))

(assert (= (and b!298987 res!246748) b!298988))

(declare-fun m!438237 () Bool)

(assert (=> b!298986 m!438237))

(declare-fun m!438239 () Bool)

(assert (=> b!298986 m!438239))

(declare-fun m!438241 () Bool)

(assert (=> b!298986 m!438241))

(declare-fun m!438243 () Bool)

(assert (=> b!298986 m!438243))

(declare-fun m!438245 () Bool)

(assert (=> b!298987 m!438245))

(declare-fun m!438247 () Bool)

(assert (=> b!298988 m!438247))

(declare-fun m!438249 () Bool)

(assert (=> b!298988 m!438249))

(declare-fun m!438251 () Bool)

(assert (=> start!66884 m!438251))

(push 1)

(assert (not b!298986))

(assert (not b!298987))

(assert (not b!298988))

(assert (not start!66884))

(check-sat)

(pop 1)

(push 1)

(check-sat)

