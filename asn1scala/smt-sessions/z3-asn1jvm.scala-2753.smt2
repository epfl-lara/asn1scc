; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66822 () Bool)

(assert start!66822)

(declare-fun b!298676 () Bool)

(declare-fun res!246460 () Bool)

(declare-fun e!214270 () Bool)

(assert (=> b!298676 (=> (not res!246460) (not e!214270))))

(declare-fun i!1010 () (_ BitVec 64))

(assert (=> b!298676 (= res!246460 (= i!1010 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!246459 () Bool)

(declare-fun e!214269 () Bool)

(assert (=> start!66822 (=> (not res!246459) (not e!214269))))

(declare-fun at!286 () (_ BitVec 64))

(declare-datatypes ((array!18076 0))(
  ( (array!18077 (arr!8927 (Array (_ BitVec 32) (_ BitVec 8))) (size!7844 (_ BitVec 32))) )
))
(declare-fun a!434 () array!18076)

(assert (=> start!66822 (= res!246459 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!286) (bvslt at!286 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7844 a!434))))))))

(assert (=> start!66822 e!214269))

(assert (=> start!66822 true))

(declare-fun array_inv!7456 (array!18076) Bool)

(assert (=> start!66822 (array_inv!7456 a!434)))

(declare-fun b!298674 () Bool)

(declare-fun e!214271 () Bool)

(assert (=> b!298674 (= e!214269 e!214271)))

(declare-fun res!246461 () Bool)

(assert (=> b!298674 (=> (not res!246461) (not e!214271))))

(assert (=> b!298674 (= res!246461 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1010) (bvsle i!1010 at!286)))))

(declare-fun lt!434768 () (_ BitVec 32))

(assert (=> b!298674 (= lt!434768 ((_ extract 31 0) (bvsrem at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!434767 () (_ BitVec 32))

(assert (=> b!298674 (= lt!434767 ((_ extract 31 0) (bvsdiv at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!298677 () Bool)

(declare-fun lt!434769 () array!18076)

(declare-fun arrayBitRangesEq!0 (array!18076 array!18076 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298677 (= e!214270 (not (arrayBitRangesEq!0 a!434 lt!434769 #b0000000000000000000000000000000000000000000000000000000000000000 at!286)))))

(declare-fun b!298675 () Bool)

(assert (=> b!298675 (= e!214271 e!214270)))

(declare-fun res!246458 () Bool)

(assert (=> b!298675 (=> (not res!246458) (not e!214270))))

(assert (=> b!298675 (= res!246458 (arrayBitRangesEq!0 a!434 lt!434769 i!1010 at!286))))

(declare-fun b!320 () Bool)

(assert (=> b!298675 (= lt!434769 (array!18077 (store (arr!8927 a!434) lt!434767 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8927 a!434) lt!434767)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434768)))) ((_ sign_extend 24) (ite b!320 (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434768) #b00000000))))) (size!7844 a!434)))))

(assert (= (and start!66822 res!246459) b!298674))

(assert (= (and b!298674 res!246461) b!298675))

(assert (= (and b!298675 res!246458) b!298676))

(assert (= (and b!298676 res!246460) b!298677))

(declare-fun m!437839 () Bool)

(assert (=> start!66822 m!437839))

(declare-fun m!437841 () Bool)

(assert (=> b!298677 m!437841))

(declare-fun m!437843 () Bool)

(assert (=> b!298675 m!437843))

(declare-fun m!437845 () Bool)

(assert (=> b!298675 m!437845))

(declare-fun m!437847 () Bool)

(assert (=> b!298675 m!437847))

(declare-fun m!437849 () Bool)

(assert (=> b!298675 m!437849))

(check-sat (not b!298675) (not b!298677) (not start!66822))
