; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66074 () Bool)

(assert start!66074)

(declare-fun res!244673 () Bool)

(declare-fun e!212052 () Bool)

(assert (=> start!66074 (=> (not res!244673) (not e!212052))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17742 0))(
  ( (array!17743 (arr!8748 (Array (_ BitVec 32) (_ BitVec 8))) (size!7689 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17742)

(assert (=> start!66074 (= res!244673 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7689 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66074 e!212052))

(declare-datatypes ((BitStream!13382 0))(
  ( (BitStream!13383 (buf!7752 array!17742) (currentByte!14273 (_ BitVec 32)) (currentBit!14268 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13382)

(declare-fun e!212048 () Bool)

(declare-fun inv!12 (BitStream!13382) Bool)

(assert (=> start!66074 (and (inv!12 thiss!1728) e!212048)))

(assert (=> start!66074 true))

(declare-fun array_inv!7301 (array!17742) Bool)

(assert (=> start!66074 (array_inv!7301 arr!273)))

(declare-fun b!296350 () Bool)

(assert (=> b!296350 (= e!212048 (array_inv!7301 (buf!7752 thiss!1728)))))

(declare-fun b!296351 () Bool)

(declare-fun res!244674 () Bool)

(assert (=> b!296351 (=> (not res!244674) (not e!212052))))

(assert (=> b!296351 (= res!244674 (bvslt from!505 to!474))))

(declare-fun b!296352 () Bool)

(declare-fun res!244672 () Bool)

(assert (=> b!296352 (=> (not res!244672) (not e!212052))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!296352 (= res!244672 (validate_offset_bits!1 ((_ sign_extend 32) (size!7689 (buf!7752 thiss!1728))) ((_ sign_extend 32) (currentByte!14273 thiss!1728)) ((_ sign_extend 32) (currentBit!14268 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!296353 () Bool)

(declare-fun e!212051 () Bool)

(declare-fun lt!431637 () Bool)

(declare-datatypes ((tuple2!23324 0))(
  ( (tuple2!23325 (_1!13059 Bool) (_2!13059 BitStream!13382)) )
))
(declare-fun lt!431634 () tuple2!23324)

(assert (=> b!296353 (= e!212051 (= lt!431637 (_1!13059 lt!431634)))))

(declare-datatypes ((Unit!20663 0))(
  ( (Unit!20664) )
))
(declare-datatypes ((tuple3!1894 0))(
  ( (tuple3!1895 (_1!13060 Unit!20663) (_2!13060 BitStream!13382) (_3!1397 array!17742)) )
))
(declare-fun lt!431636 () tuple3!1894)

(declare-fun b!296354 () Bool)

(declare-fun e!212049 () Bool)

(assert (=> b!296354 (= e!212049 (and (= (buf!7752 thiss!1728) (buf!7752 (_2!13060 lt!431636))) (= (size!7689 arr!273) (size!7689 (_3!1397 lt!431636)))))))

(declare-fun b!296355 () Bool)

(assert (=> b!296355 (= e!212052 (not true))))

(assert (=> b!296355 e!212051))

(declare-fun res!244676 () Bool)

(assert (=> b!296355 (=> (not res!244676) (not e!212051))))

(declare-fun lt!431633 () array!17742)

(declare-fun bitAt!0 (array!17742 (_ BitVec 64)) Bool)

(assert (=> b!296355 (= res!244676 (= (bitAt!0 lt!431633 from!505) lt!431637))))

(assert (=> b!296355 (= lt!431637 (bitAt!0 (_3!1397 lt!431636) from!505))))

(declare-fun lt!431629 () Unit!20663)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17742 array!17742 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20663)

(assert (=> b!296355 (= lt!431629 (arrayBitRangesEqImpliesEq!0 lt!431633 (_3!1397 lt!431636) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arrayBitRangesEq!0 (array!17742 array!17742 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!296355 (arrayBitRangesEq!0 arr!273 (_3!1397 lt!431636) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!431632 () Unit!20663)

(declare-fun arrayBitRangesEqTransitive!0 (array!17742 array!17742 array!17742 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20663)

(assert (=> b!296355 (= lt!431632 (arrayBitRangesEqTransitive!0 arr!273 lt!431633 (_3!1397 lt!431636) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!296355 (arrayBitRangesEq!0 arr!273 lt!431633 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!431635 () Unit!20663)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17742 (_ BitVec 64) Bool) Unit!20663)

(assert (=> b!296355 (= lt!431635 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!13059 lt!431634)))))

(assert (=> b!296355 e!212049))

(declare-fun res!244675 () Bool)

(assert (=> b!296355 (=> (not res!244675) (not e!212049))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!296355 (= res!244675 (= (bvsub (bvadd (bitIndex!0 (size!7689 (buf!7752 thiss!1728)) (currentByte!14273 thiss!1728) (currentBit!14268 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7689 (buf!7752 (_2!13060 lt!431636))) (currentByte!14273 (_2!13060 lt!431636)) (currentBit!14268 (_2!13060 lt!431636)))))))

(declare-fun readBitsLoop!0 (BitStream!13382 (_ BitVec 64) array!17742 (_ BitVec 64) (_ BitVec 64)) tuple3!1894)

(assert (=> b!296355 (= lt!431636 (readBitsLoop!0 (_2!13059 lt!431634) nBits!523 lt!431633 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!296355 (validate_offset_bits!1 ((_ sign_extend 32) (size!7689 (buf!7752 (_2!13059 lt!431634)))) ((_ sign_extend 32) (currentByte!14273 (_2!13059 lt!431634))) ((_ sign_extend 32) (currentBit!14268 (_2!13059 lt!431634))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!431630 () Unit!20663)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13382 BitStream!13382 (_ BitVec 64) (_ BitVec 64)) Unit!20663)

(assert (=> b!296355 (= lt!431630 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!13059 lt!431634) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!431631 () (_ BitVec 32))

(declare-fun lt!431628 () (_ BitVec 32))

(assert (=> b!296355 (= lt!431633 (array!17743 (store (arr!8748 arr!273) lt!431628 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8748 arr!273) lt!431628)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!431631)))) ((_ sign_extend 24) (ite (_1!13059 lt!431634) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!431631) #b00000000))))) (size!7689 arr!273)))))

(assert (=> b!296355 (= lt!431631 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!296355 (= lt!431628 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13382) tuple2!23324)

(assert (=> b!296355 (= lt!431634 (readBit!0 thiss!1728))))

(assert (= (and start!66074 res!244673) b!296352))

(assert (= (and b!296352 res!244672) b!296351))

(assert (= (and b!296351 res!244674) b!296355))

(assert (= (and b!296355 res!244675) b!296354))

(assert (= (and b!296355 res!244676) b!296353))

(assert (= start!66074 b!296350))

(declare-fun m!434445 () Bool)

(assert (=> start!66074 m!434445))

(declare-fun m!434447 () Bool)

(assert (=> start!66074 m!434447))

(declare-fun m!434449 () Bool)

(assert (=> b!296350 m!434449))

(declare-fun m!434451 () Bool)

(assert (=> b!296352 m!434451))

(declare-fun m!434453 () Bool)

(assert (=> b!296355 m!434453))

(declare-fun m!434455 () Bool)

(assert (=> b!296355 m!434455))

(declare-fun m!434457 () Bool)

(assert (=> b!296355 m!434457))

(declare-fun m!434459 () Bool)

(assert (=> b!296355 m!434459))

(declare-fun m!434461 () Bool)

(assert (=> b!296355 m!434461))

(declare-fun m!434463 () Bool)

(assert (=> b!296355 m!434463))

(declare-fun m!434465 () Bool)

(assert (=> b!296355 m!434465))

(declare-fun m!434467 () Bool)

(assert (=> b!296355 m!434467))

(declare-fun m!434469 () Bool)

(assert (=> b!296355 m!434469))

(declare-fun m!434471 () Bool)

(assert (=> b!296355 m!434471))

(declare-fun m!434473 () Bool)

(assert (=> b!296355 m!434473))

(declare-fun m!434475 () Bool)

(assert (=> b!296355 m!434475))

(declare-fun m!434477 () Bool)

(assert (=> b!296355 m!434477))

(declare-fun m!434479 () Bool)

(assert (=> b!296355 m!434479))

(declare-fun m!434481 () Bool)

(assert (=> b!296355 m!434481))

(declare-fun m!434483 () Bool)

(assert (=> b!296355 m!434483))

(push 1)

(assert (not b!296352))

(assert (not start!66074))

(assert (not b!296355))

(assert (not b!296350))

(check-sat)

