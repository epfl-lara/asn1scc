; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66778 () Bool)

(assert start!66778)

(declare-fun res!246262 () Bool)

(declare-fun e!214066 () Bool)

(assert (=> start!66778 (=> (not res!246262) (not e!214066))))

(declare-fun at!281 () (_ BitVec 64))

(declare-datatypes ((array!18032 0))(
  ( (array!18033 (arr!8905 (Array (_ BitVec 32) (_ BitVec 8))) (size!7822 (_ BitVec 32))) )
))
(declare-fun a!429 () array!18032)

(assert (=> start!66778 (= res!246262 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!281) (bvslt at!281 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7822 a!429))))))))

(assert (=> start!66778 e!214066))

(assert (=> start!66778 true))

(declare-fun array_inv!7434 (array!18032) Bool)

(assert (=> start!66778 (array_inv!7434 a!429)))

(declare-fun b!298478 () Bool)

(declare-fun e!214067 () Bool)

(assert (=> b!298478 (= e!214066 e!214067)))

(declare-fun res!246263 () Bool)

(assert (=> b!298478 (=> (not res!246263) (not e!214067))))

(declare-fun lt!434601 () array!18032)

(declare-fun arrayBitRangesEq!0 (array!18032 array!18032 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298478 (= res!246263 (arrayBitRangesEq!0 a!429 lt!434601 at!281 at!281))))

(declare-fun b!315 () Bool)

(declare-fun lt!434599 () (_ BitVec 32))

(declare-fun lt!434598 () (_ BitVec 32))

(assert (=> b!298478 (= lt!434601 (array!18033 (store (arr!8905 a!429) lt!434599 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8905 a!429) lt!434599)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434598)))) ((_ sign_extend 24) (ite b!315 (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434598) #b00000000))))) (size!7822 a!429)))))

(assert (=> b!298478 (= lt!434598 ((_ extract 31 0) (bvsrem at!281 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!298478 (= lt!434599 ((_ extract 31 0) (bvsdiv at!281 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!298479 () Bool)

(assert (=> b!298479 (= e!214067 (not true))))

(assert (=> b!298479 (arrayBitRangesEq!0 a!429 lt!434601 #b0000000000000000000000000000000000000000000000000000000000000000 at!281)))

(declare-datatypes ((Unit!20839 0))(
  ( (Unit!20840) )
))
(declare-fun lt!434600 () Unit!20839)

(declare-fun rec!19 (array!18032 (_ BitVec 64) Bool (_ BitVec 64)) Unit!20839)

(assert (=> b!298479 (= lt!434600 (rec!19 a!429 at!281 b!315 at!281))))

(assert (= (and start!66778 res!246262) b!298478))

(assert (= (and b!298478 res!246263) b!298479))

(declare-fun m!437617 () Bool)

(assert (=> start!66778 m!437617))

(declare-fun m!437619 () Bool)

(assert (=> b!298478 m!437619))

(declare-fun m!437621 () Bool)

(assert (=> b!298478 m!437621))

(declare-fun m!437623 () Bool)

(assert (=> b!298478 m!437623))

(declare-fun m!437625 () Bool)

(assert (=> b!298478 m!437625))

(declare-fun m!437627 () Bool)

(assert (=> b!298479 m!437627))

(declare-fun m!437629 () Bool)

(assert (=> b!298479 m!437629))

(push 1)

(assert (not b!298479))

(assert (not b!298478))

(assert (not start!66778))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

