; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66834 () Bool)

(assert start!66834)

(declare-fun res!246518 () Bool)

(declare-fun e!214328 () Bool)

(assert (=> start!66834 (=> (not res!246518) (not e!214328))))

(declare-fun at!286 () (_ BitVec 64))

(declare-datatypes ((array!18088 0))(
  ( (array!18089 (arr!8933 (Array (_ BitVec 32) (_ BitVec 8))) (size!7850 (_ BitVec 32))) )
))
(declare-fun a!434 () array!18088)

(assert (=> start!66834 (= res!246518 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!286) (bvslt at!286 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7850 a!434))))))))

(assert (=> start!66834 e!214328))

(assert (=> start!66834 true))

(declare-fun array_inv!7462 (array!18088) Bool)

(assert (=> start!66834 (array_inv!7462 a!434)))

(declare-fun b!298732 () Bool)

(declare-fun e!214329 () Bool)

(assert (=> b!298732 (= e!214328 e!214329)))

(declare-fun res!246517 () Bool)

(assert (=> b!298732 (=> (not res!246517) (not e!214329))))

(declare-fun i!1010 () (_ BitVec 64))

(assert (=> b!298732 (= res!246517 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1010) (bvsle i!1010 at!286)))))

(declare-fun lt!434807 () (_ BitVec 32))

(assert (=> b!298732 (= lt!434807 ((_ extract 31 0) (bvsrem at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!434808 () (_ BitVec 32))

(assert (=> b!298732 (= lt!434808 ((_ extract 31 0) (bvsdiv at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!298733 () Bool)

(declare-fun res!246516 () Bool)

(assert (=> b!298733 (=> (not res!246516) (not e!214329))))

(declare-fun b!320 () Bool)

(declare-fun arrayBitRangesEq!0 (array!18088 array!18088 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298733 (= res!246516 (arrayBitRangesEq!0 a!434 (array!18089 (store (arr!8933 a!434) lt!434808 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8933 a!434) lt!434808)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434807)))) ((_ sign_extend 24) (ite b!320 (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434807) #b00000000))))) (size!7850 a!434)) i!1010 at!286))))

(declare-fun b!298734 () Bool)

(assert (=> b!298734 (= e!214329 (and (not (= i!1010 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsgt (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001) at!286))))))

(assert (= (and start!66834 res!246518) b!298732))

(assert (= (and b!298732 res!246517) b!298733))

(assert (= (and b!298733 res!246516) b!298734))

(declare-fun m!437903 () Bool)

(assert (=> start!66834 m!437903))

(declare-fun m!437905 () Bool)

(assert (=> b!298733 m!437905))

(declare-fun m!437907 () Bool)

(assert (=> b!298733 m!437907))

(declare-fun m!437909 () Bool)

(assert (=> b!298733 m!437909))

(declare-fun m!437911 () Bool)

(assert (=> b!298733 m!437911))

(check-sat (not b!298733) (not start!66834))
(check-sat)
