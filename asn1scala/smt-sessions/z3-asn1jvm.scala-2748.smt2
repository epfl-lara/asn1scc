; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66792 () Bool)

(assert start!66792)

(declare-fun b!298515 () Bool)

(declare-fun at!286 () (_ BitVec 64))

(declare-fun e!214117 () Bool)

(declare-fun lt!434641 () (_ BitVec 64))

(declare-fun i!1010 () (_ BitVec 64))

(assert (=> b!298515 (= e!214117 (and (= i!1010 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt at!286 lt!434641)))))

(declare-fun b!298512 () Bool)

(declare-fun e!214116 () Bool)

(declare-fun e!214119 () Bool)

(assert (=> b!298512 (= e!214116 e!214119)))

(declare-fun res!246298 () Bool)

(assert (=> b!298512 (=> (not res!246298) (not e!214119))))

(assert (=> b!298512 (= res!246298 (bvslt at!286 lt!434641))))

(declare-datatypes ((array!18046 0))(
  ( (array!18047 (arr!8912 (Array (_ BitVec 32) (_ BitVec 8))) (size!7829 (_ BitVec 32))) )
))
(declare-fun a!434 () array!18046)

(assert (=> b!298512 (= lt!434641 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7829 a!434))))))

(declare-fun res!246297 () Bool)

(assert (=> start!66792 (=> (not res!246297) (not e!214116))))

(assert (=> start!66792 (= res!246297 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!286))))

(assert (=> start!66792 e!214116))

(assert (=> start!66792 true))

(declare-fun array_inv!7441 (array!18046) Bool)

(assert (=> start!66792 (array_inv!7441 a!434)))

(declare-fun b!298514 () Bool)

(declare-fun res!246296 () Bool)

(assert (=> b!298514 (=> (not res!246296) (not e!214117))))

(declare-fun lt!434642 () (_ BitVec 32))

(declare-fun b!320 () Bool)

(declare-fun lt!434643 () (_ BitVec 32))

(declare-fun arrayBitRangesEq!0 (array!18046 array!18046 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298514 (= res!246296 (arrayBitRangesEq!0 a!434 (array!18047 (store (arr!8912 a!434) lt!434643 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8912 a!434) lt!434643)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434642)))) ((_ sign_extend 24) (ite b!320 (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434642) #b00000000))))) (size!7829 a!434)) i!1010 at!286))))

(declare-fun b!298513 () Bool)

(assert (=> b!298513 (= e!214119 e!214117)))

(declare-fun res!246299 () Bool)

(assert (=> b!298513 (=> (not res!246299) (not e!214117))))

(assert (=> b!298513 (= res!246299 (bvsle i!1010 at!286))))

(assert (=> b!298513 (= lt!434642 ((_ extract 31 0) (bvsrem at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!298513 (= lt!434643 ((_ extract 31 0) (bvsdiv at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and start!66792 res!246297) b!298512))

(assert (= (and b!298512 res!246298) b!298513))

(assert (= (and b!298513 res!246299) b!298514))

(assert (= (and b!298514 res!246296) b!298515))

(declare-fun m!437675 () Bool)

(assert (=> start!66792 m!437675))

(declare-fun m!437677 () Bool)

(assert (=> b!298514 m!437677))

(declare-fun m!437679 () Bool)

(assert (=> b!298514 m!437679))

(declare-fun m!437681 () Bool)

(assert (=> b!298514 m!437681))

(declare-fun m!437683 () Bool)

(assert (=> b!298514 m!437683))

(check-sat (not b!298514) (not start!66792))
(check-sat)
