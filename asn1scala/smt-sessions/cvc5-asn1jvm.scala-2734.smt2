; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66694 () Bool)

(assert start!66694)

(declare-fun res!246145 () Bool)

(declare-fun e!213832 () Bool)

(assert (=> start!66694 (=> (not res!246145) (not e!213832))))

(declare-fun at!281 () (_ BitVec 64))

(declare-datatypes ((array!17957 0))(
  ( (array!17958 (arr!8869 (Array (_ BitVec 32) (_ BitVec 8))) (size!7786 (_ BitVec 32))) )
))
(declare-fun a!429 () array!17957)

(assert (=> start!66694 (= res!246145 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!281) (bvslt at!281 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7786 a!429))))))))

(assert (=> start!66694 e!213832))

(assert (=> start!66694 true))

(declare-fun array_inv!7398 (array!17957) Bool)

(assert (=> start!66694 (array_inv!7398 a!429)))

(declare-fun b!298343 () Bool)

(declare-fun e!213834 () Bool)

(assert (=> b!298343 (= e!213832 e!213834)))

(declare-fun res!246146 () Bool)

(assert (=> b!298343 (=> (not res!246146) (not e!213834))))

(declare-fun lt!434436 () array!17957)

(declare-fun arrayBitRangesEq!0 (array!17957 array!17957 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298343 (= res!246146 (arrayBitRangesEq!0 a!429 lt!434436 at!281 at!281))))

(declare-fun lt!434439 () (_ BitVec 32))

(declare-fun lt!434437 () (_ BitVec 32))

(declare-fun b!315 () Bool)

(assert (=> b!298343 (= lt!434436 (array!17958 (store (arr!8869 a!429) lt!434439 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8869 a!429) lt!434439)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434437)))) ((_ sign_extend 24) (ite b!315 (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434437) #b00000000))))) (size!7786 a!429)))))

(assert (=> b!298343 (= lt!434437 ((_ extract 31 0) (bvsrem at!281 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!298343 (= lt!434439 ((_ extract 31 0) (bvsdiv at!281 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!298344 () Bool)

(assert (=> b!298344 (= e!213834 (not true))))

(assert (=> b!298344 (arrayBitRangesEq!0 a!429 lt!434436 #b0000000000000000000000000000000000000000000000000000000000000000 at!281)))

(declare-datatypes ((Unit!20821 0))(
  ( (Unit!20822) )
))
(declare-fun lt!434438 () Unit!20821)

(declare-fun rec!19 (array!17957 (_ BitVec 64) Bool (_ BitVec 64)) Unit!20821)

(assert (=> b!298344 (= lt!434438 (rec!19 a!429 at!281 b!315 at!281))))

(assert (= (and start!66694 res!246145) b!298343))

(assert (= (and b!298343 res!246146) b!298344))

(declare-fun m!437365 () Bool)

(assert (=> start!66694 m!437365))

(declare-fun m!437367 () Bool)

(assert (=> b!298343 m!437367))

(declare-fun m!437369 () Bool)

(assert (=> b!298343 m!437369))

(declare-fun m!437371 () Bool)

(assert (=> b!298343 m!437371))

(declare-fun m!437373 () Bool)

(assert (=> b!298343 m!437373))

(declare-fun m!437375 () Bool)

(assert (=> b!298344 m!437375))

(declare-fun m!437377 () Bool)

(assert (=> b!298344 m!437377))

(push 1)

(assert (not b!298344))

(assert (not start!66694))

(assert (not b!298343))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

