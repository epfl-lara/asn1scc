; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66772 () Bool)

(assert start!66772)

(declare-fun res!246245 () Bool)

(declare-fun e!214040 () Bool)

(assert (=> start!66772 (=> (not res!246245) (not e!214040))))

(declare-fun at!281 () (_ BitVec 64))

(declare-datatypes ((array!18026 0))(
  ( (array!18027 (arr!8902 (Array (_ BitVec 32) (_ BitVec 8))) (size!7819 (_ BitVec 32))) )
))
(declare-fun a!429 () array!18026)

(assert (=> start!66772 (= res!246245 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!281) (bvslt at!281 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7819 a!429))))))))

(assert (=> start!66772 e!214040))

(assert (=> start!66772 true))

(declare-fun array_inv!7431 (array!18026) Bool)

(assert (=> start!66772 (array_inv!7431 a!429)))

(declare-fun b!298460 () Bool)

(declare-fun e!214041 () Bool)

(assert (=> b!298460 (= e!214040 e!214041)))

(declare-fun res!246244 () Bool)

(assert (=> b!298460 (=> (not res!246244) (not e!214041))))

(declare-fun lt!434562 () array!18026)

(declare-fun arrayBitRangesEq!0 (array!18026 array!18026 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298460 (= res!246244 (arrayBitRangesEq!0 a!429 lt!434562 at!281 at!281))))

(declare-fun lt!434563 () (_ BitVec 32))

(declare-fun lt!434565 () (_ BitVec 32))

(declare-fun b!315 () Bool)

(assert (=> b!298460 (= lt!434562 (array!18027 (store (arr!8902 a!429) lt!434563 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8902 a!429) lt!434563)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434565)))) ((_ sign_extend 24) (ite b!315 (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434565) #b00000000))))) (size!7819 a!429)))))

(assert (=> b!298460 (= lt!434565 ((_ extract 31 0) (bvsrem at!281 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!298460 (= lt!434563 ((_ extract 31 0) (bvsdiv at!281 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!298461 () Bool)

(assert (=> b!298461 (= e!214041 (not (and (bvsge lt!434563 #b00000000000000000000000000000000) (bvslt lt!434563 (size!7819 a!429)))))))

(assert (=> b!298461 (arrayBitRangesEq!0 a!429 lt!434562 #b0000000000000000000000000000000000000000000000000000000000000000 at!281)))

(declare-datatypes ((Unit!20833 0))(
  ( (Unit!20834) )
))
(declare-fun lt!434564 () Unit!20833)

(declare-fun rec!19 (array!18026 (_ BitVec 64) Bool (_ BitVec 64)) Unit!20833)

(assert (=> b!298461 (= lt!434564 (rec!19 a!429 at!281 b!315 at!281))))

(assert (= (and start!66772 res!246245) b!298460))

(assert (= (and b!298460 res!246244) b!298461))

(declare-fun m!437575 () Bool)

(assert (=> start!66772 m!437575))

(declare-fun m!437577 () Bool)

(assert (=> b!298460 m!437577))

(declare-fun m!437579 () Bool)

(assert (=> b!298460 m!437579))

(declare-fun m!437581 () Bool)

(assert (=> b!298460 m!437581))

(declare-fun m!437583 () Bool)

(assert (=> b!298460 m!437583))

(declare-fun m!437585 () Bool)

(assert (=> b!298461 m!437585))

(declare-fun m!437587 () Bool)

(assert (=> b!298461 m!437587))

(push 1)

(assert (not b!298460))

(assert (not start!66772))

(assert (not b!298461))

(check-sat)

(pop 1)

(push 1)

(check-sat)

