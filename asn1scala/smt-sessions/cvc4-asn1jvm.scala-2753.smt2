; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66824 () Bool)

(assert start!66824)

(declare-fun b!298686 () Bool)

(declare-fun e!214284 () Bool)

(declare-fun e!214282 () Bool)

(assert (=> b!298686 (= e!214284 e!214282)))

(declare-fun res!246470 () Bool)

(assert (=> b!298686 (=> (not res!246470) (not e!214282))))

(declare-fun i!1010 () (_ BitVec 64))

(declare-fun at!286 () (_ BitVec 64))

(assert (=> b!298686 (= res!246470 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1010) (bvsle i!1010 at!286)))))

(declare-fun lt!434778 () (_ BitVec 32))

(assert (=> b!298686 (= lt!434778 ((_ extract 31 0) (bvsrem at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!434777 () (_ BitVec 32))

(assert (=> b!298686 (= lt!434777 ((_ extract 31 0) (bvsdiv at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!298687 () Bool)

(declare-fun e!214283 () Bool)

(assert (=> b!298687 (= e!214282 e!214283)))

(declare-fun res!246473 () Bool)

(assert (=> b!298687 (=> (not res!246473) (not e!214283))))

(declare-datatypes ((array!18078 0))(
  ( (array!18079 (arr!8928 (Array (_ BitVec 32) (_ BitVec 8))) (size!7845 (_ BitVec 32))) )
))
(declare-fun lt!434776 () array!18078)

(declare-fun a!434 () array!18078)

(declare-fun arrayBitRangesEq!0 (array!18078 array!18078 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298687 (= res!246473 (arrayBitRangesEq!0 a!434 lt!434776 i!1010 at!286))))

(declare-fun b!320 () Bool)

(assert (=> b!298687 (= lt!434776 (array!18079 (store (arr!8928 a!434) lt!434777 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8928 a!434) lt!434777)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434778)))) ((_ sign_extend 24) (ite b!320 (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434778) #b00000000))))) (size!7845 a!434)))))

(declare-fun b!298689 () Bool)

(assert (=> b!298689 (= e!214283 (not (arrayBitRangesEq!0 a!434 lt!434776 #b0000000000000000000000000000000000000000000000000000000000000000 at!286)))))

(declare-fun b!298688 () Bool)

(declare-fun res!246472 () Bool)

(assert (=> b!298688 (=> (not res!246472) (not e!214283))))

(assert (=> b!298688 (= res!246472 (= i!1010 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!246471 () Bool)

(assert (=> start!66824 (=> (not res!246471) (not e!214284))))

(assert (=> start!66824 (= res!246471 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!286) (bvslt at!286 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7845 a!434))))))))

(assert (=> start!66824 e!214284))

(assert (=> start!66824 true))

(declare-fun array_inv!7457 (array!18078) Bool)

(assert (=> start!66824 (array_inv!7457 a!434)))

(assert (= (and start!66824 res!246471) b!298686))

(assert (= (and b!298686 res!246470) b!298687))

(assert (= (and b!298687 res!246473) b!298688))

(assert (= (and b!298688 res!246472) b!298689))

(declare-fun m!437851 () Bool)

(assert (=> b!298687 m!437851))

(declare-fun m!437853 () Bool)

(assert (=> b!298687 m!437853))

(declare-fun m!437855 () Bool)

(assert (=> b!298687 m!437855))

(declare-fun m!437857 () Bool)

(assert (=> b!298687 m!437857))

(declare-fun m!437859 () Bool)

(assert (=> b!298689 m!437859))

(declare-fun m!437861 () Bool)

(assert (=> start!66824 m!437861))

(push 1)

