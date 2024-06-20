; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66826 () Bool)

(assert start!66826)

(declare-fun res!246481 () Bool)

(declare-fun e!214293 () Bool)

(assert (=> start!66826 (=> (not res!246481) (not e!214293))))

(declare-fun at!286 () (_ BitVec 64))

(declare-datatypes ((array!18080 0))(
  ( (array!18081 (arr!8929 (Array (_ BitVec 32) (_ BitVec 8))) (size!7846 (_ BitVec 32))) )
))
(declare-fun a!434 () array!18080)

(assert (=> start!66826 (= res!246481 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!286) (bvslt at!286 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7846 a!434))))))))

(assert (=> start!66826 e!214293))

(assert (=> start!66826 true))

(declare-fun array_inv!7458 (array!18080) Bool)

(assert (=> start!66826 (array_inv!7458 a!434)))

(declare-fun b!298696 () Bool)

(declare-fun e!214291 () Bool)

(assert (=> b!298696 (= e!214293 e!214291)))

(declare-fun res!246480 () Bool)

(assert (=> b!298696 (=> (not res!246480) (not e!214291))))

(declare-fun i!1010 () (_ BitVec 64))

(assert (=> b!298696 (= res!246480 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1010) (bvsle i!1010 at!286)))))

(declare-fun lt!434783 () (_ BitVec 32))

(assert (=> b!298696 (= lt!434783 ((_ extract 31 0) (bvsrem at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!434784 () (_ BitVec 32))

(assert (=> b!298696 (= lt!434784 ((_ extract 31 0) (bvsdiv at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!298697 () Bool)

(declare-fun res!246482 () Bool)

(assert (=> b!298697 (=> (not res!246482) (not e!214291))))

(declare-fun b!320 () Bool)

(declare-fun arrayBitRangesEq!0 (array!18080 array!18080 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298697 (= res!246482 (arrayBitRangesEq!0 a!434 (array!18081 (store (arr!8929 a!434) lt!434784 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8929 a!434) lt!434784)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434783)))) ((_ sign_extend 24) (ite b!320 (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434783) #b00000000))))) (size!7846 a!434)) i!1010 at!286))))

(declare-fun b!298698 () Bool)

(assert (=> b!298698 (= e!214291 (and (not (= i!1010 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand i!1010 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand i!1010 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!66826 res!246481) b!298696))

(assert (= (and b!298696 res!246480) b!298697))

(assert (= (and b!298697 res!246482) b!298698))

(declare-fun m!437863 () Bool)

(assert (=> start!66826 m!437863))

(declare-fun m!437865 () Bool)

(assert (=> b!298697 m!437865))

(declare-fun m!437867 () Bool)

(assert (=> b!298697 m!437867))

(declare-fun m!437869 () Bool)

(assert (=> b!298697 m!437869))

(declare-fun m!437871 () Bool)

(assert (=> b!298697 m!437871))

(push 1)

(assert (not start!66826))

(assert (not b!298697))

(check-sat)

(pop 1)

(push 1)

(check-sat)

