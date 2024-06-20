; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66794 () Bool)

(assert start!66794)

(declare-fun b!298524 () Bool)

(declare-fun e!214130 () Bool)

(declare-fun e!214128 () Bool)

(assert (=> b!298524 (= e!214130 e!214128)))

(declare-fun res!246308 () Bool)

(assert (=> b!298524 (=> (not res!246308) (not e!214128))))

(declare-fun at!286 () (_ BitVec 64))

(declare-fun lt!434650 () (_ BitVec 64))

(assert (=> b!298524 (= res!246308 (bvslt at!286 lt!434650))))

(declare-datatypes ((array!18048 0))(
  ( (array!18049 (arr!8913 (Array (_ BitVec 32) (_ BitVec 8))) (size!7830 (_ BitVec 32))) )
))
(declare-fun a!434 () array!18048)

(assert (=> b!298524 (= lt!434650 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7830 a!434))))))

(declare-fun e!214129 () Bool)

(declare-fun b!298527 () Bool)

(declare-fun i!1010 () (_ BitVec 64))

(assert (=> b!298527 (= e!214129 (and (= i!1010 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt at!286 lt!434650)))))

(declare-fun b!298525 () Bool)

(assert (=> b!298525 (= e!214128 e!214129)))

(declare-fun res!246309 () Bool)

(assert (=> b!298525 (=> (not res!246309) (not e!214129))))

(assert (=> b!298525 (= res!246309 (bvsle i!1010 at!286))))

(declare-fun lt!434651 () (_ BitVec 32))

(assert (=> b!298525 (= lt!434651 ((_ extract 31 0) (bvsrem at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!434652 () (_ BitVec 32))

(assert (=> b!298525 (= lt!434652 ((_ extract 31 0) (bvsdiv at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun res!246310 () Bool)

(assert (=> start!66794 (=> (not res!246310) (not e!214130))))

(assert (=> start!66794 (= res!246310 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!286))))

(assert (=> start!66794 e!214130))

(assert (=> start!66794 true))

(declare-fun array_inv!7442 (array!18048) Bool)

(assert (=> start!66794 (array_inv!7442 a!434)))

(declare-fun b!298526 () Bool)

(declare-fun res!246311 () Bool)

(assert (=> b!298526 (=> (not res!246311) (not e!214129))))

(declare-fun b!320 () Bool)

(declare-fun arrayBitRangesEq!0 (array!18048 array!18048 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298526 (= res!246311 (arrayBitRangesEq!0 a!434 (array!18049 (store (arr!8913 a!434) lt!434652 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8913 a!434) lt!434652)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434651)))) ((_ sign_extend 24) (ite b!320 (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434651) #b00000000))))) (size!7830 a!434)) i!1010 at!286))))

(assert (= (and start!66794 res!246310) b!298524))

(assert (= (and b!298524 res!246308) b!298525))

(assert (= (and b!298525 res!246309) b!298526))

(assert (= (and b!298526 res!246311) b!298527))

(declare-fun m!437685 () Bool)

(assert (=> start!66794 m!437685))

(declare-fun m!437687 () Bool)

(assert (=> b!298526 m!437687))

(declare-fun m!437689 () Bool)

(assert (=> b!298526 m!437689))

(declare-fun m!437691 () Bool)

(assert (=> b!298526 m!437691))

(declare-fun m!437693 () Bool)

(assert (=> b!298526 m!437693))

(push 1)

(assert (not start!66794))

(assert (not b!298526))

(check-sat)

(pop 1)

(push 1)

(check-sat)

