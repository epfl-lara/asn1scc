; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66704 () Bool)

(assert start!66704)

(declare-fun res!246183 () Bool)

(declare-fun e!213887 () Bool)

(assert (=> start!66704 (=> (not res!246183) (not e!213887))))

(declare-fun at!281 () (_ BitVec 64))

(assert (=> start!66704 (= res!246183 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!281))))

(assert (=> start!66704 e!213887))

(assert (=> start!66704 true))

(declare-datatypes ((array!17967 0))(
  ( (array!17968 (arr!8874 (Array (_ BitVec 32) (_ BitVec 8))) (size!7791 (_ BitVec 32))) )
))
(declare-fun a!429 () array!17967)

(declare-fun array_inv!7403 (array!17967) Bool)

(assert (=> start!66704 (array_inv!7403 a!429)))

(declare-fun b!298381 () Bool)

(declare-fun e!213885 () Bool)

(assert (=> b!298381 (= e!213887 e!213885)))

(declare-fun res!246184 () Bool)

(assert (=> b!298381 (=> (not res!246184) (not e!213885))))

(declare-fun lt!434508 () (_ BitVec 64))

(assert (=> b!298381 (= res!246184 (bvslt at!281 lt!434508))))

(assert (=> b!298381 (= lt!434508 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7791 a!429))))))

(declare-fun b!298382 () Bool)

(declare-fun e!213886 () Bool)

(assert (=> b!298382 (= e!213885 e!213886)))

(declare-fun res!246185 () Bool)

(assert (=> b!298382 (=> (not res!246185) (not e!213886))))

(declare-fun lt!434504 () array!17967)

(declare-fun arrayBitRangesEq!0 (array!17967 array!17967 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298382 (= res!246185 (arrayBitRangesEq!0 a!429 lt!434504 at!281 at!281))))

(declare-fun b!315 () Bool)

(declare-fun lt!434507 () (_ BitVec 32))

(declare-fun lt!434505 () (_ BitVec 32))

(assert (=> b!298382 (= lt!434504 (array!17968 (store (arr!8874 a!429) lt!434507 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8874 a!429) lt!434507)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434505)))) ((_ sign_extend 24) (ite b!315 (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434505) #b00000000))))) (size!7791 a!429)))))

(assert (=> b!298382 (= lt!434505 ((_ extract 31 0) (bvsrem at!281 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!298382 (= lt!434507 ((_ extract 31 0) (bvsdiv at!281 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!298383 () Bool)

(assert (=> b!298383 (= e!213886 (not (bvsle at!281 lt!434508)))))

(assert (=> b!298383 (arrayBitRangesEq!0 a!429 lt!434504 #b0000000000000000000000000000000000000000000000000000000000000000 at!281)))

(declare-datatypes ((Unit!20831 0))(
  ( (Unit!20832) )
))
(declare-fun lt!434506 () Unit!20831)

(declare-fun rec!19 (array!17967 (_ BitVec 64) Bool (_ BitVec 64)) Unit!20831)

(assert (=> b!298383 (= lt!434506 (rec!19 a!429 at!281 b!315 at!281))))

(assert (= (and start!66704 res!246183) b!298381))

(assert (= (and b!298381 res!246184) b!298382))

(assert (= (and b!298382 res!246185) b!298383))

(declare-fun m!437435 () Bool)

(assert (=> start!66704 m!437435))

(declare-fun m!437437 () Bool)

(assert (=> b!298382 m!437437))

(declare-fun m!437439 () Bool)

(assert (=> b!298382 m!437439))

(declare-fun m!437441 () Bool)

(assert (=> b!298382 m!437441))

(declare-fun m!437443 () Bool)

(assert (=> b!298382 m!437443))

(declare-fun m!437445 () Bool)

(assert (=> b!298383 m!437445))

(declare-fun m!437447 () Bool)

(assert (=> b!298383 m!437447))

(push 1)

(assert (not b!298383))

(assert (not b!298382))

(assert (not start!66704))

(check-sat)

(pop 1)

(push 1)

(check-sat)

