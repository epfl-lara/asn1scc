; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66818 () Bool)

(assert start!66818)

(declare-fun res!246437 () Bool)

(declare-fun e!214248 () Bool)

(assert (=> start!66818 (=> (not res!246437) (not e!214248))))

(declare-fun at!286 () (_ BitVec 64))

(declare-datatypes ((array!18072 0))(
  ( (array!18073 (arr!8925 (Array (_ BitVec 32) (_ BitVec 8))) (size!7842 (_ BitVec 32))) )
))
(declare-fun a!434 () array!18072)

(assert (=> start!66818 (= res!246437 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!286) (bvslt at!286 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7842 a!434))))))))

(assert (=> start!66818 e!214248))

(assert (=> start!66818 true))

(declare-fun array_inv!7454 (array!18072) Bool)

(assert (=> start!66818 (array_inv!7454 a!434)))

(declare-fun b!298651 () Bool)

(declare-fun e!214246 () Bool)

(assert (=> b!298651 (= e!214248 e!214246)))

(declare-fun res!246436 () Bool)

(assert (=> b!298651 (=> (not res!246436) (not e!214246))))

(declare-fun i!1010 () (_ BitVec 64))

(assert (=> b!298651 (= res!246436 (bvsle i!1010 at!286))))

(declare-fun lt!434750 () (_ BitVec 32))

(assert (=> b!298651 (= lt!434750 ((_ extract 31 0) (bvsrem at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!434751 () (_ BitVec 32))

(assert (=> b!298651 (= lt!434751 ((_ extract 31 0) (bvsdiv at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!298652 () Bool)

(declare-fun res!246435 () Bool)

(assert (=> b!298652 (=> (not res!246435) (not e!214246))))

(declare-fun b!320 () Bool)

(declare-fun arrayBitRangesEq!0 (array!18072 array!18072 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298652 (= res!246435 (arrayBitRangesEq!0 a!434 (array!18073 (store (arr!8925 a!434) lt!434751 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8925 a!434) lt!434751)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434750)))) ((_ sign_extend 24) (ite b!320 (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434750) #b00000000))))) (size!7842 a!434)) i!1010 at!286))))

(declare-fun b!298653 () Bool)

(assert (=> b!298653 (= e!214246 (and (= i!1010 #b0000000000000000000000000000000000000000000000000000000000000000) (or (bvslt lt!434751 #b00000000000000000000000000000000) (bvsge lt!434751 (size!7842 a!434)))))))

(assert (= (and start!66818 res!246437) b!298651))

(assert (= (and b!298651 res!246436) b!298652))

(assert (= (and b!298652 res!246435) b!298653))

(declare-fun m!437817 () Bool)

(assert (=> start!66818 m!437817))

(declare-fun m!437819 () Bool)

(assert (=> b!298652 m!437819))

(declare-fun m!437821 () Bool)

(assert (=> b!298652 m!437821))

(declare-fun m!437823 () Bool)

(assert (=> b!298652 m!437823))

(declare-fun m!437825 () Bool)

(assert (=> b!298652 m!437825))

(push 1)

(assert (not b!298652))

(assert (not start!66818))

(check-sat)

(pop 1)

(push 1)

(check-sat)

