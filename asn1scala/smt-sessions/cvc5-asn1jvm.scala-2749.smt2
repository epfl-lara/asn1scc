; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66796 () Bool)

(assert start!66796)

(declare-fun b!298538 () Bool)

(declare-fun e!214142 () Bool)

(assert (=> b!298538 (= e!214142 (not true))))

(declare-datatypes ((array!18050 0))(
  ( (array!18051 (arr!8914 (Array (_ BitVec 32) (_ BitVec 8))) (size!7831 (_ BitVec 32))) )
))
(declare-fun a!434 () array!18050)

(declare-fun lt!434664 () array!18050)

(declare-fun at!286 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!18050 array!18050 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298538 (arrayBitRangesEq!0 a!434 lt!434664 #b0000000000000000000000000000000000000000000000000000000000000000 at!286)))

(declare-datatypes ((Unit!20845 0))(
  ( (Unit!20846) )
))
(declare-fun lt!434661 () Unit!20845)

(declare-fun i!1010 () (_ BitVec 64))

(declare-fun b!320 () Bool)

(declare-fun rec!19 (array!18050 (_ BitVec 64) Bool (_ BitVec 64)) Unit!20845)

(assert (=> b!298538 (= lt!434661 (rec!19 a!434 at!286 b!320 (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun res!246323 () Bool)

(declare-fun e!214140 () Bool)

(assert (=> start!66796 (=> (not res!246323) (not e!214140))))

(assert (=> start!66796 (= res!246323 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!286) (bvslt at!286 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7831 a!434))))))))

(assert (=> start!66796 e!214140))

(assert (=> start!66796 true))

(declare-fun array_inv!7443 (array!18050) Bool)

(assert (=> start!66796 (array_inv!7443 a!434)))

(declare-fun b!298539 () Bool)

(declare-fun e!214141 () Bool)

(assert (=> b!298539 (= e!214141 e!214142)))

(declare-fun res!246322 () Bool)

(assert (=> b!298539 (=> (not res!246322) (not e!214142))))

(assert (=> b!298539 (= res!246322 (arrayBitRangesEq!0 a!434 lt!434664 i!1010 at!286))))

(declare-fun lt!434662 () (_ BitVec 32))

(declare-fun lt!434663 () (_ BitVec 32))

(assert (=> b!298539 (= lt!434664 (array!18051 (store (arr!8914 a!434) lt!434663 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8914 a!434) lt!434663)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434662)))) ((_ sign_extend 24) (ite b!320 (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434662) #b00000000))))) (size!7831 a!434)))))

(declare-fun b!298540 () Bool)

(declare-fun res!246326 () Bool)

(assert (=> b!298540 (=> (not res!246326) (not e!214142))))

(assert (=> b!298540 (= res!246326 (and (not (= i!1010 #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsle (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001) at!286)))))

(declare-fun b!298541 () Bool)

(assert (=> b!298541 (= e!214140 e!214141)))

(declare-fun res!246324 () Bool)

(assert (=> b!298541 (=> (not res!246324) (not e!214141))))

(assert (=> b!298541 (= res!246324 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1010) (bvsle i!1010 at!286)))))

(assert (=> b!298541 (= lt!434662 ((_ extract 31 0) (bvsrem at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!298541 (= lt!434663 ((_ extract 31 0) (bvsdiv at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!298542 () Bool)

(declare-fun res!246325 () Bool)

(assert (=> b!298542 (=> (not res!246325) (not e!214142))))

(assert (=> b!298542 (= res!246325 (arrayBitRangesEq!0 a!434 lt!434664 (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001) at!286))))

(assert (= (and start!66796 res!246323) b!298541))

(assert (= (and b!298541 res!246324) b!298539))

(assert (= (and b!298539 res!246322) b!298540))

(assert (= (and b!298540 res!246326) b!298542))

(assert (= (and b!298542 res!246325) b!298538))

(declare-fun m!437695 () Bool)

(assert (=> b!298538 m!437695))

(declare-fun m!437697 () Bool)

(assert (=> b!298538 m!437697))

(declare-fun m!437699 () Bool)

(assert (=> start!66796 m!437699))

(declare-fun m!437701 () Bool)

(assert (=> b!298539 m!437701))

(declare-fun m!437703 () Bool)

(assert (=> b!298539 m!437703))

(declare-fun m!437705 () Bool)

(assert (=> b!298539 m!437705))

(declare-fun m!437707 () Bool)

(assert (=> b!298539 m!437707))

(declare-fun m!437709 () Bool)

(assert (=> b!298542 m!437709))

(push 1)

(assert (not b!298538))

(assert (not b!298539))

(assert (not b!298542))

(assert (not start!66796))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

