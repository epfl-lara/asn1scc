; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66832 () Bool)

(assert start!66832)

(declare-fun res!246507 () Bool)

(declare-fun e!214319 () Bool)

(assert (=> start!66832 (=> (not res!246507) (not e!214319))))

(declare-fun at!286 () (_ BitVec 64))

(declare-datatypes ((array!18086 0))(
  ( (array!18087 (arr!8932 (Array (_ BitVec 32) (_ BitVec 8))) (size!7849 (_ BitVec 32))) )
))
(declare-fun a!434 () array!18086)

(assert (=> start!66832 (= res!246507 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!286) (bvslt at!286 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7849 a!434))))))))

(assert (=> start!66832 e!214319))

(assert (=> start!66832 true))

(declare-fun array_inv!7461 (array!18086) Bool)

(assert (=> start!66832 (array_inv!7461 a!434)))

(declare-fun b!298723 () Bool)

(declare-fun e!214318 () Bool)

(assert (=> b!298723 (= e!214319 e!214318)))

(declare-fun res!246508 () Bool)

(assert (=> b!298723 (=> (not res!246508) (not e!214318))))

(declare-fun i!1010 () (_ BitVec 64))

(assert (=> b!298723 (= res!246508 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1010) (bvsle i!1010 at!286)))))

(declare-fun lt!434802 () (_ BitVec 32))

(assert (=> b!298723 (= lt!434802 ((_ extract 31 0) (bvsrem at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!434801 () (_ BitVec 32))

(assert (=> b!298723 (= lt!434801 ((_ extract 31 0) (bvsdiv at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!298724 () Bool)

(declare-fun res!246509 () Bool)

(assert (=> b!298724 (=> (not res!246509) (not e!214318))))

(declare-fun b!320 () Bool)

(declare-fun arrayBitRangesEq!0 (array!18086 array!18086 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298724 (= res!246509 (arrayBitRangesEq!0 a!434 (array!18087 (store (arr!8932 a!434) lt!434801 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8932 a!434) lt!434801)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434802)))) ((_ sign_extend 24) (ite b!320 (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434802) #b00000000))))) (size!7849 a!434)) i!1010 at!286))))

(declare-fun b!298725 () Bool)

(assert (=> b!298725 (= e!214318 (and (not (= i!1010 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsgt (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001) at!286))))))

(assert (= (and start!66832 res!246507) b!298723))

(assert (= (and b!298723 res!246508) b!298724))

(assert (= (and b!298724 res!246509) b!298725))

(declare-fun m!437893 () Bool)

(assert (=> start!66832 m!437893))

(declare-fun m!437895 () Bool)

(assert (=> b!298724 m!437895))

(declare-fun m!437897 () Bool)

(assert (=> b!298724 m!437897))

(declare-fun m!437899 () Bool)

(assert (=> b!298724 m!437899))

(declare-fun m!437901 () Bool)

(assert (=> b!298724 m!437901))

(push 1)

(assert (not start!66832))

(assert (not b!298724))

(check-sat)

(pop 1)

(push 1)

(check-sat)

