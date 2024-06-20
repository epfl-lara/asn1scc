; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66820 () Bool)

(assert start!66820)

(declare-fun b!298662 () Bool)

(declare-fun e!214258 () Bool)

(declare-fun e!214259 () Bool)

(assert (=> b!298662 (= e!214258 e!214259)))

(declare-fun res!246447 () Bool)

(assert (=> b!298662 (=> (not res!246447) (not e!214259))))

(declare-fun i!1010 () (_ BitVec 64))

(declare-fun at!286 () (_ BitVec 64))

(assert (=> b!298662 (= res!246447 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1010) (bvsle i!1010 at!286)))))

(declare-fun lt!434760 () (_ BitVec 32))

(assert (=> b!298662 (= lt!434760 ((_ extract 31 0) (bvsrem at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!434758 () (_ BitVec 32))

(assert (=> b!298662 (= lt!434758 ((_ extract 31 0) (bvsdiv at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!298664 () Bool)

(declare-fun res!246449 () Bool)

(declare-fun e!214257 () Bool)

(assert (=> b!298664 (=> (not res!246449) (not e!214257))))

(assert (=> b!298664 (= res!246449 (= i!1010 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((array!18074 0))(
  ( (array!18075 (arr!8926 (Array (_ BitVec 32) (_ BitVec 8))) (size!7843 (_ BitVec 32))) )
))
(declare-fun lt!434759 () array!18074)

(declare-fun b!298665 () Bool)

(declare-fun a!434 () array!18074)

(declare-fun arrayBitRangesEq!0 (array!18074 array!18074 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298665 (= e!214257 (not (arrayBitRangesEq!0 a!434 lt!434759 #b0000000000000000000000000000000000000000000000000000000000000000 at!286)))))

(declare-fun b!298663 () Bool)

(assert (=> b!298663 (= e!214259 e!214257)))

(declare-fun res!246446 () Bool)

(assert (=> b!298663 (=> (not res!246446) (not e!214257))))

(assert (=> b!298663 (= res!246446 (arrayBitRangesEq!0 a!434 lt!434759 i!1010 at!286))))

(declare-fun b!320 () Bool)

(assert (=> b!298663 (= lt!434759 (array!18075 (store (arr!8926 a!434) lt!434758 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8926 a!434) lt!434758)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434760)))) ((_ sign_extend 24) (ite b!320 (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434760) #b00000000))))) (size!7843 a!434)))))

(declare-fun res!246448 () Bool)

(assert (=> start!66820 (=> (not res!246448) (not e!214258))))

(assert (=> start!66820 (= res!246448 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!286) (bvslt at!286 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7843 a!434))))))))

(assert (=> start!66820 e!214258))

(assert (=> start!66820 true))

(declare-fun array_inv!7455 (array!18074) Bool)

(assert (=> start!66820 (array_inv!7455 a!434)))

(assert (= (and start!66820 res!246448) b!298662))

(assert (= (and b!298662 res!246447) b!298663))

(assert (= (and b!298663 res!246446) b!298664))

(assert (= (and b!298664 res!246449) b!298665))

(declare-fun m!437827 () Bool)

(assert (=> b!298665 m!437827))

(declare-fun m!437829 () Bool)

(assert (=> b!298663 m!437829))

(declare-fun m!437831 () Bool)

(assert (=> b!298663 m!437831))

(declare-fun m!437833 () Bool)

(assert (=> b!298663 m!437833))

(declare-fun m!437835 () Bool)

(assert (=> b!298663 m!437835))

(declare-fun m!437837 () Bool)

(assert (=> start!66820 m!437837))

(push 1)

(assert (not b!298663))

(assert (not b!298665))

(assert (not start!66820))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

