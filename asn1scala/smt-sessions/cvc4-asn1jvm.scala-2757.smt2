; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66878 () Bool)

(assert start!66878)

(declare-fun b!298940 () Bool)

(declare-fun res!246702 () Bool)

(declare-fun e!214518 () Bool)

(assert (=> b!298940 (=> (not res!246702) (not e!214518))))

(declare-fun at!286 () (_ BitVec 64))

(declare-datatypes ((array!18105 0))(
  ( (array!18106 (arr!8940 (Array (_ BitVec 32) (_ BitVec 8))) (size!7857 (_ BitVec 32))) )
))
(declare-fun lt!434904 () array!18105)

(declare-fun i!1010 () (_ BitVec 64))

(declare-fun a!434 () array!18105)

(declare-fun arrayBitRangesEq!0 (array!18105 array!18105 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298940 (= res!246702 (arrayBitRangesEq!0 a!434 lt!434904 (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001) at!286))))

(declare-fun b!298941 () Bool)

(declare-fun e!214517 () Bool)

(assert (=> b!298941 (= e!214517 e!214518)))

(declare-fun res!246703 () Bool)

(assert (=> b!298941 (=> (not res!246703) (not e!214518))))

(assert (=> b!298941 (= res!246703 (arrayBitRangesEq!0 a!434 lt!434904 i!1010 at!286))))

(declare-fun lt!434902 () (_ BitVec 32))

(declare-fun lt!434903 () (_ BitVec 32))

(declare-fun b!320 () Bool)

(assert (=> b!298941 (= lt!434904 (array!18106 (store (arr!8940 a!434) lt!434902 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8940 a!434) lt!434902)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434903)))) ((_ sign_extend 24) (ite b!320 (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434903) #b00000000))))) (size!7857 a!434)))))

(declare-fun b!298942 () Bool)

(declare-fun res!246704 () Bool)

(assert (=> b!298942 (=> (not res!246704) (not e!214518))))

(assert (=> b!298942 (= res!246704 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsle (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001) at!286)))))

(declare-fun b!298944 () Bool)

(assert (=> b!298944 (= e!214518 (bvsge (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001) i!1010))))

(declare-fun res!246701 () Bool)

(declare-fun e!214516 () Bool)

(assert (=> start!66878 (=> (not res!246701) (not e!214516))))

(assert (=> start!66878 (= res!246701 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!286) (bvslt at!286 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7857 a!434))))))))

(assert (=> start!66878 e!214516))

(assert (=> start!66878 true))

(declare-fun array_inv!7469 (array!18105) Bool)

(assert (=> start!66878 (array_inv!7469 a!434)))

(declare-fun b!298943 () Bool)

(assert (=> b!298943 (= e!214516 e!214517)))

(declare-fun res!246700 () Bool)

(assert (=> b!298943 (=> (not res!246700) (not e!214517))))

(assert (=> b!298943 (= res!246700 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1010) (bvsle i!1010 at!286)))))

(assert (=> b!298943 (= lt!434903 ((_ extract 31 0) (bvsrem at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!298943 (= lt!434902 ((_ extract 31 0) (bvsdiv at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and start!66878 res!246701) b!298943))

(assert (= (and b!298943 res!246700) b!298941))

(assert (= (and b!298941 res!246703) b!298942))

(assert (= (and b!298942 res!246704) b!298940))

(assert (= (and b!298940 res!246702) b!298944))

(declare-fun m!438193 () Bool)

(assert (=> b!298940 m!438193))

(declare-fun m!438195 () Bool)

(assert (=> b!298941 m!438195))

(declare-fun m!438197 () Bool)

(assert (=> b!298941 m!438197))

(declare-fun m!438199 () Bool)

(assert (=> b!298941 m!438199))

(declare-fun m!438201 () Bool)

(assert (=> b!298941 m!438201))

(declare-fun m!438203 () Bool)

(assert (=> start!66878 m!438203))

(push 1)

(assert (not b!298940))

(assert (not start!66878))

(assert (not b!298941))

(check-sat)

(pop 1)

(push 1)

(check-sat)

