; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66700 () Bool)

(assert start!66700)

(declare-fun res!246165 () Bool)

(declare-fun e!213863 () Bool)

(assert (=> start!66700 (=> (not res!246165) (not e!213863))))

(declare-fun at!281 () (_ BitVec 64))

(assert (=> start!66700 (= res!246165 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!281))))

(assert (=> start!66700 e!213863))

(assert (=> start!66700 true))

(declare-datatypes ((array!17963 0))(
  ( (array!17964 (arr!8872 (Array (_ BitVec 32) (_ BitVec 8))) (size!7789 (_ BitVec 32))) )
))
(declare-fun a!429 () array!17963)

(declare-fun array_inv!7401 (array!17963) Bool)

(assert (=> start!66700 (array_inv!7401 a!429)))

(declare-fun b!298363 () Bool)

(declare-fun e!213861 () Bool)

(assert (=> b!298363 (= e!213863 e!213861)))

(declare-fun res!246166 () Bool)

(assert (=> b!298363 (=> (not res!246166) (not e!213861))))

(declare-fun lt!434475 () (_ BitVec 64))

(assert (=> b!298363 (= res!246166 (bvslt at!281 lt!434475))))

(assert (=> b!298363 (= lt!434475 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7789 a!429))))))

(declare-fun b!298364 () Bool)

(declare-fun e!213864 () Bool)

(assert (=> b!298364 (= e!213861 e!213864)))

(declare-fun res!246167 () Bool)

(assert (=> b!298364 (=> (not res!246167) (not e!213864))))

(declare-fun lt!434478 () array!17963)

(declare-fun arrayBitRangesEq!0 (array!17963 array!17963 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298364 (= res!246167 (arrayBitRangesEq!0 a!429 lt!434478 at!281 at!281))))

(declare-fun b!315 () Bool)

(declare-fun lt!434476 () (_ BitVec 32))

(declare-fun lt!434477 () (_ BitVec 32))

(assert (=> b!298364 (= lt!434478 (array!17964 (store (arr!8872 a!429) lt!434477 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8872 a!429) lt!434477)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434476)))) ((_ sign_extend 24) (ite b!315 (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434476) #b00000000))))) (size!7789 a!429)))))

(assert (=> b!298364 (= lt!434476 ((_ extract 31 0) (bvsrem at!281 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!298364 (= lt!434477 ((_ extract 31 0) (bvsdiv at!281 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!298365 () Bool)

(assert (=> b!298365 (= e!213864 (not (bvsle at!281 lt!434475)))))

(assert (=> b!298365 (arrayBitRangesEq!0 a!429 lt!434478 #b0000000000000000000000000000000000000000000000000000000000000000 at!281)))

(declare-datatypes ((Unit!20827 0))(
  ( (Unit!20828) )
))
(declare-fun lt!434474 () Unit!20827)

(declare-fun rec!19 (array!17963 (_ BitVec 64) Bool (_ BitVec 64)) Unit!20827)

(assert (=> b!298365 (= lt!434474 (rec!19 a!429 at!281 b!315 at!281))))

(assert (= (and start!66700 res!246165) b!298363))

(assert (= (and b!298363 res!246166) b!298364))

(assert (= (and b!298364 res!246167) b!298365))

(declare-fun m!437407 () Bool)

(assert (=> start!66700 m!437407))

(declare-fun m!437409 () Bool)

(assert (=> b!298364 m!437409))

(declare-fun m!437411 () Bool)

(assert (=> b!298364 m!437411))

(declare-fun m!437413 () Bool)

(assert (=> b!298364 m!437413))

(declare-fun m!437415 () Bool)

(assert (=> b!298364 m!437415))

(declare-fun m!437417 () Bool)

(assert (=> b!298365 m!437417))

(declare-fun m!437419 () Bool)

(assert (=> b!298365 m!437419))

(push 1)

(assert (not start!66700))

(assert (not b!298365))

(assert (not b!298364))

(check-sat)

(pop 1)

(push 1)

(check-sat)

