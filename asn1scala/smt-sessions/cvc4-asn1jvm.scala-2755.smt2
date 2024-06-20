; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66836 () Bool)

(assert start!66836)

(declare-fun res!246527 () Bool)

(declare-fun e!214338 () Bool)

(assert (=> start!66836 (=> (not res!246527) (not e!214338))))

(declare-fun at!286 () (_ BitVec 64))

(declare-datatypes ((array!18090 0))(
  ( (array!18091 (arr!8934 (Array (_ BitVec 32) (_ BitVec 8))) (size!7851 (_ BitVec 32))) )
))
(declare-fun a!434 () array!18090)

(assert (=> start!66836 (= res!246527 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!286) (bvslt at!286 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7851 a!434))))))))

(assert (=> start!66836 e!214338))

(assert (=> start!66836 true))

(declare-fun array_inv!7463 (array!18090) Bool)

(assert (=> start!66836 (array_inv!7463 a!434)))

(declare-fun b!298741 () Bool)

(declare-fun e!214336 () Bool)

(assert (=> b!298741 (= e!214338 e!214336)))

(declare-fun res!246525 () Bool)

(assert (=> b!298741 (=> (not res!246525) (not e!214336))))

(declare-fun i!1010 () (_ BitVec 64))

(assert (=> b!298741 (= res!246525 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1010) (bvsle i!1010 at!286)))))

(declare-fun lt!434813 () (_ BitVec 32))

(assert (=> b!298741 (= lt!434813 ((_ extract 31 0) (bvsrem at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!434814 () (_ BitVec 32))

(assert (=> b!298741 (= lt!434814 ((_ extract 31 0) (bvsdiv at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!298742 () Bool)

(declare-fun res!246526 () Bool)

(assert (=> b!298742 (=> (not res!246526) (not e!214336))))

(declare-fun b!320 () Bool)

(declare-fun arrayBitRangesEq!0 (array!18090 array!18090 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298742 (= res!246526 (arrayBitRangesEq!0 a!434 (array!18091 (store (arr!8934 a!434) lt!434814 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8934 a!434) lt!434814)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434813)))) ((_ sign_extend 24) (ite b!320 (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434813) #b00000000))))) (size!7851 a!434)) i!1010 at!286))))

(declare-fun b!298743 () Bool)

(assert (=> b!298743 (= e!214336 (and (not (= i!1010 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsgt (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001) at!286))))))

(assert (= (and start!66836 res!246527) b!298741))

(assert (= (and b!298741 res!246525) b!298742))

(assert (= (and b!298742 res!246526) b!298743))

(declare-fun m!437913 () Bool)

(assert (=> start!66836 m!437913))

(declare-fun m!437915 () Bool)

(assert (=> b!298742 m!437915))

(declare-fun m!437917 () Bool)

(assert (=> b!298742 m!437917))

(declare-fun m!437919 () Bool)

(assert (=> b!298742 m!437919))

(declare-fun m!437921 () Bool)

(assert (=> b!298742 m!437921))

(push 1)

(assert (not start!66836))

(assert (not b!298742))

(check-sat)

(pop 1)

(push 1)

(check-sat)

