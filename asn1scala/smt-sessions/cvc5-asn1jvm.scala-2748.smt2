; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66790 () Bool)

(assert start!66790)

(declare-fun b!298501 () Bool)

(declare-fun e!214105 () Bool)

(declare-fun e!214106 () Bool)

(assert (=> b!298501 (= e!214105 e!214106)))

(declare-fun res!246287 () Bool)

(assert (=> b!298501 (=> (not res!246287) (not e!214106))))

(declare-fun i!1010 () (_ BitVec 64))

(declare-fun at!286 () (_ BitVec 64))

(assert (=> b!298501 (= res!246287 (bvsle i!1010 at!286))))

(declare-fun lt!434632 () (_ BitVec 32))

(assert (=> b!298501 (= lt!434632 ((_ extract 31 0) (bvsrem at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!434634 () (_ BitVec 32))

(assert (=> b!298501 (= lt!434634 ((_ extract 31 0) (bvsdiv at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!298503 () Bool)

(declare-fun lt!434633 () (_ BitVec 64))

(assert (=> b!298503 (= e!214106 (and (= i!1010 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt at!286 lt!434633)))))

(declare-fun b!298500 () Bool)

(declare-fun e!214104 () Bool)

(assert (=> b!298500 (= e!214104 e!214105)))

(declare-fun res!246286 () Bool)

(assert (=> b!298500 (=> (not res!246286) (not e!214105))))

(assert (=> b!298500 (= res!246286 (bvslt at!286 lt!434633))))

(declare-datatypes ((array!18044 0))(
  ( (array!18045 (arr!8911 (Array (_ BitVec 32) (_ BitVec 8))) (size!7828 (_ BitVec 32))) )
))
(declare-fun a!434 () array!18044)

(assert (=> b!298500 (= lt!434633 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7828 a!434))))))

(declare-fun res!246285 () Bool)

(assert (=> start!66790 (=> (not res!246285) (not e!214104))))

(assert (=> start!66790 (= res!246285 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!286))))

(assert (=> start!66790 e!214104))

(assert (=> start!66790 true))

(declare-fun array_inv!7440 (array!18044) Bool)

(assert (=> start!66790 (array_inv!7440 a!434)))

(declare-fun b!298502 () Bool)

(declare-fun res!246284 () Bool)

(assert (=> b!298502 (=> (not res!246284) (not e!214106))))

(declare-fun b!320 () Bool)

(declare-fun arrayBitRangesEq!0 (array!18044 array!18044 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298502 (= res!246284 (arrayBitRangesEq!0 a!434 (array!18045 (store (arr!8911 a!434) lt!434634 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8911 a!434) lt!434634)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434632)))) ((_ sign_extend 24) (ite b!320 (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434632) #b00000000))))) (size!7828 a!434)) i!1010 at!286))))

(assert (= (and start!66790 res!246285) b!298500))

(assert (= (and b!298500 res!246286) b!298501))

(assert (= (and b!298501 res!246287) b!298502))

(assert (= (and b!298502 res!246284) b!298503))

(declare-fun m!437665 () Bool)

(assert (=> start!66790 m!437665))

(declare-fun m!437667 () Bool)

(assert (=> b!298502 m!437667))

(declare-fun m!437669 () Bool)

(assert (=> b!298502 m!437669))

(declare-fun m!437671 () Bool)

(assert (=> b!298502 m!437671))

(declare-fun m!437673 () Bool)

(assert (=> b!298502 m!437673))

(push 1)

(assert (not b!298502))

(assert (not start!66790))

(check-sat)

(pop 1)

(push 1)

(check-sat)

