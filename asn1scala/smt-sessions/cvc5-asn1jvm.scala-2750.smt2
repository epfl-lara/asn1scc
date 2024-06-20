; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66802 () Bool)

(assert start!66802)

(declare-fun b!298585 () Bool)

(declare-fun e!214180 () Bool)

(declare-fun at!286 () (_ BitVec 64))

(declare-fun lt!434701 () (_ BitVec 64))

(assert (=> b!298585 (= e!214180 (not (bvsle at!286 lt!434701)))))

(declare-datatypes ((array!18056 0))(
  ( (array!18057 (arr!8917 (Array (_ BitVec 32) (_ BitVec 8))) (size!7834 (_ BitVec 32))) )
))
(declare-fun a!434 () array!18056)

(declare-fun lt!434700 () array!18056)

(declare-fun arrayBitRangesEq!0 (array!18056 array!18056 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298585 (arrayBitRangesEq!0 a!434 lt!434700 #b0000000000000000000000000000000000000000000000000000000000000000 at!286)))

(declare-datatypes ((Unit!20851 0))(
  ( (Unit!20852) )
))
(declare-fun lt!434699 () Unit!20851)

(declare-fun i!1010 () (_ BitVec 64))

(declare-fun b!320 () Bool)

(declare-fun rec!19 (array!18056 (_ BitVec 64) Bool (_ BitVec 64)) Unit!20851)

(assert (=> b!298585 (= lt!434699 (rec!19 a!434 at!286 b!320 (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun res!246371 () Bool)

(declare-fun e!214179 () Bool)

(assert (=> start!66802 (=> (not res!246371) (not e!214179))))

(assert (=> start!66802 (= res!246371 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!286))))

(assert (=> start!66802 e!214179))

(assert (=> start!66802 true))

(declare-fun array_inv!7446 (array!18056) Bool)

(assert (=> start!66802 (array_inv!7446 a!434)))

(declare-fun b!298586 () Bool)

(declare-fun e!214178 () Bool)

(assert (=> b!298586 (= e!214178 e!214180)))

(declare-fun res!246372 () Bool)

(assert (=> b!298586 (=> (not res!246372) (not e!214180))))

(assert (=> b!298586 (= res!246372 (arrayBitRangesEq!0 a!434 lt!434700 i!1010 at!286))))

(declare-fun lt!434703 () (_ BitVec 32))

(declare-fun lt!434702 () (_ BitVec 32))

(assert (=> b!298586 (= lt!434700 (array!18057 (store (arr!8917 a!434) lt!434703 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8917 a!434) lt!434703)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434702)))) ((_ sign_extend 24) (ite b!320 (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434702) #b00000000))))) (size!7834 a!434)))))

(declare-fun b!298587 () Bool)

(declare-fun res!246373 () Bool)

(assert (=> b!298587 (=> (not res!246373) (not e!214180))))

(assert (=> b!298587 (= res!246373 (and (not (= i!1010 #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsle (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001) at!286)))))

(declare-fun b!298588 () Bool)

(declare-fun res!246374 () Bool)

(assert (=> b!298588 (=> (not res!246374) (not e!214180))))

(assert (=> b!298588 (= res!246374 (arrayBitRangesEq!0 a!434 lt!434700 (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001) at!286))))

(declare-fun b!298589 () Bool)

(declare-fun e!214182 () Bool)

(assert (=> b!298589 (= e!214179 e!214182)))

(declare-fun res!246369 () Bool)

(assert (=> b!298589 (=> (not res!246369) (not e!214182))))

(assert (=> b!298589 (= res!246369 (bvslt at!286 lt!434701))))

(assert (=> b!298589 (= lt!434701 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7834 a!434))))))

(declare-fun b!298590 () Bool)

(assert (=> b!298590 (= e!214182 e!214178)))

(declare-fun res!246370 () Bool)

(assert (=> b!298590 (=> (not res!246370) (not e!214178))))

(assert (=> b!298590 (= res!246370 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1010) (bvsle i!1010 at!286)))))

(assert (=> b!298590 (= lt!434702 ((_ extract 31 0) (bvsrem at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!298590 (= lt!434703 ((_ extract 31 0) (bvsdiv at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and start!66802 res!246371) b!298589))

(assert (= (and b!298589 res!246369) b!298590))

(assert (= (and b!298590 res!246370) b!298586))

(assert (= (and b!298586 res!246372) b!298587))

(assert (= (and b!298587 res!246373) b!298588))

(assert (= (and b!298588 res!246374) b!298585))

(declare-fun m!437743 () Bool)

(assert (=> b!298585 m!437743))

(declare-fun m!437745 () Bool)

(assert (=> b!298585 m!437745))

(declare-fun m!437747 () Bool)

(assert (=> start!66802 m!437747))

(declare-fun m!437749 () Bool)

(assert (=> b!298586 m!437749))

(declare-fun m!437751 () Bool)

(assert (=> b!298586 m!437751))

(declare-fun m!437753 () Bool)

(assert (=> b!298586 m!437753))

(declare-fun m!437755 () Bool)

(assert (=> b!298586 m!437755))

(declare-fun m!437757 () Bool)

(assert (=> b!298588 m!437757))

(push 1)

(assert (not b!298588))

(assert (not start!66802))

(assert (not b!298585))

(assert (not b!298586))

(check-sat)

(pop 1)

(push 1)

(check-sat)

