; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66804 () Bool)

(assert start!66804)

(declare-fun b!298603 () Bool)

(declare-fun e!214195 () Bool)

(declare-fun e!214196 () Bool)

(assert (=> b!298603 (= e!214195 e!214196)))

(declare-fun res!246389 () Bool)

(assert (=> b!298603 (=> (not res!246389) (not e!214196))))

(declare-fun at!286 () (_ BitVec 64))

(declare-fun lt!434716 () (_ BitVec 64))

(assert (=> b!298603 (= res!246389 (bvslt at!286 lt!434716))))

(declare-datatypes ((array!18058 0))(
  ( (array!18059 (arr!8918 (Array (_ BitVec 32) (_ BitVec 8))) (size!7835 (_ BitVec 32))) )
))
(declare-fun a!434 () array!18058)

(assert (=> b!298603 (= lt!434716 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7835 a!434))))))

(declare-fun b!298604 () Bool)

(declare-fun e!214193 () Bool)

(assert (=> b!298604 (= e!214196 e!214193)))

(declare-fun res!246392 () Bool)

(assert (=> b!298604 (=> (not res!246392) (not e!214193))))

(declare-fun i!1010 () (_ BitVec 64))

(assert (=> b!298604 (= res!246392 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1010) (bvsle i!1010 at!286)))))

(declare-fun lt!434715 () (_ BitVec 32))

(assert (=> b!298604 (= lt!434715 ((_ extract 31 0) (bvsrem at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!434718 () (_ BitVec 32))

(assert (=> b!298604 (= lt!434718 ((_ extract 31 0) (bvsdiv at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun res!246387 () Bool)

(assert (=> start!66804 (=> (not res!246387) (not e!214195))))

(assert (=> start!66804 (= res!246387 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!286))))

(assert (=> start!66804 e!214195))

(assert (=> start!66804 true))

(declare-fun array_inv!7447 (array!18058) Bool)

(assert (=> start!66804 (array_inv!7447 a!434)))

(declare-fun b!298605 () Bool)

(declare-fun e!214194 () Bool)

(assert (=> b!298605 (= e!214193 e!214194)))

(declare-fun res!246388 () Bool)

(assert (=> b!298605 (=> (not res!246388) (not e!214194))))

(declare-fun lt!434717 () array!18058)

(declare-fun arrayBitRangesEq!0 (array!18058 array!18058 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298605 (= res!246388 (arrayBitRangesEq!0 a!434 lt!434717 i!1010 at!286))))

(declare-fun b!320 () Bool)

(assert (=> b!298605 (= lt!434717 (array!18059 (store (arr!8918 a!434) lt!434718 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8918 a!434) lt!434718)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434715)))) ((_ sign_extend 24) (ite b!320 (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434715) #b00000000))))) (size!7835 a!434)))))

(declare-fun b!298606 () Bool)

(declare-fun res!246391 () Bool)

(assert (=> b!298606 (=> (not res!246391) (not e!214194))))

(assert (=> b!298606 (= res!246391 (and (not (= i!1010 #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsle (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001) at!286)))))

(declare-fun b!298607 () Bool)

(declare-fun res!246390 () Bool)

(assert (=> b!298607 (=> (not res!246390) (not e!214194))))

(assert (=> b!298607 (= res!246390 (arrayBitRangesEq!0 a!434 lt!434717 (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001) at!286))))

(declare-fun b!298608 () Bool)

(assert (=> b!298608 (= e!214194 (not (bvsle at!286 lt!434716)))))

(assert (=> b!298608 (arrayBitRangesEq!0 a!434 lt!434717 #b0000000000000000000000000000000000000000000000000000000000000000 at!286)))

(declare-datatypes ((Unit!20853 0))(
  ( (Unit!20854) )
))
(declare-fun lt!434714 () Unit!20853)

(declare-fun rec!19 (array!18058 (_ BitVec 64) Bool (_ BitVec 64)) Unit!20853)

(assert (=> b!298608 (= lt!434714 (rec!19 a!434 at!286 b!320 (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and start!66804 res!246387) b!298603))

(assert (= (and b!298603 res!246389) b!298604))

(assert (= (and b!298604 res!246392) b!298605))

(assert (= (and b!298605 res!246388) b!298606))

(assert (= (and b!298606 res!246391) b!298607))

(assert (= (and b!298607 res!246390) b!298608))

(declare-fun m!437759 () Bool)

(assert (=> start!66804 m!437759))

(declare-fun m!437761 () Bool)

(assert (=> b!298605 m!437761))

(declare-fun m!437763 () Bool)

(assert (=> b!298605 m!437763))

(declare-fun m!437765 () Bool)

(assert (=> b!298605 m!437765))

(declare-fun m!437767 () Bool)

(assert (=> b!298605 m!437767))

(declare-fun m!437769 () Bool)

(assert (=> b!298607 m!437769))

(declare-fun m!437771 () Bool)

(assert (=> b!298608 m!437771))

(declare-fun m!437773 () Bool)

(assert (=> b!298608 m!437773))

(check-sat (not b!298605) (not b!298607) (not start!66804) (not b!298608))
(check-sat)
