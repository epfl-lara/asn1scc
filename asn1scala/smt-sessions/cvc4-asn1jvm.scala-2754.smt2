; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66830 () Bool)

(assert start!66830)

(declare-fun res!246499 () Bool)

(declare-fun e!214311 () Bool)

(assert (=> start!66830 (=> (not res!246499) (not e!214311))))

(declare-fun at!286 () (_ BitVec 64))

(declare-datatypes ((array!18084 0))(
  ( (array!18085 (arr!8931 (Array (_ BitVec 32) (_ BitVec 8))) (size!7848 (_ BitVec 32))) )
))
(declare-fun a!434 () array!18084)

(assert (=> start!66830 (= res!246499 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!286) (bvslt at!286 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7848 a!434))))))))

(assert (=> start!66830 e!214311))

(assert (=> start!66830 true))

(declare-fun array_inv!7460 (array!18084) Bool)

(assert (=> start!66830 (array_inv!7460 a!434)))

(declare-fun b!298714 () Bool)

(declare-fun e!214310 () Bool)

(assert (=> b!298714 (= e!214311 e!214310)))

(declare-fun res!246500 () Bool)

(assert (=> b!298714 (=> (not res!246500) (not e!214310))))

(declare-fun i!1010 () (_ BitVec 64))

(assert (=> b!298714 (= res!246500 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1010) (bvsle i!1010 at!286)))))

(declare-fun lt!434795 () (_ BitVec 32))

(assert (=> b!298714 (= lt!434795 ((_ extract 31 0) (bvsrem at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!434796 () (_ BitVec 32))

(assert (=> b!298714 (= lt!434796 ((_ extract 31 0) (bvsdiv at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!298715 () Bool)

(declare-fun res!246498 () Bool)

(assert (=> b!298715 (=> (not res!246498) (not e!214310))))

(declare-fun b!320 () Bool)

(declare-fun arrayBitRangesEq!0 (array!18084 array!18084 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298715 (= res!246498 (arrayBitRangesEq!0 a!434 (array!18085 (store (arr!8931 a!434) lt!434796 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8931 a!434) lt!434796)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434795)))) ((_ sign_extend 24) (ite b!320 (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434795) #b00000000))))) (size!7848 a!434)) i!1010 at!286))))

(declare-fun b!298716 () Bool)

(assert (=> b!298716 (= e!214310 (and (not (= i!1010 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand i!1010 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand i!1010 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!66830 res!246499) b!298714))

(assert (= (and b!298714 res!246500) b!298715))

(assert (= (and b!298715 res!246498) b!298716))

(declare-fun m!437883 () Bool)

(assert (=> start!66830 m!437883))

(declare-fun m!437885 () Bool)

(assert (=> b!298715 m!437885))

(declare-fun m!437887 () Bool)

(assert (=> b!298715 m!437887))

(declare-fun m!437889 () Bool)

(assert (=> b!298715 m!437889))

(declare-fun m!437891 () Bool)

(assert (=> b!298715 m!437891))

(push 1)

(assert (not b!298715))

(assert (not start!66830))

(check-sat)

(pop 1)

(push 1)

(check-sat)

