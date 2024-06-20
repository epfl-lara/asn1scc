; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64926 () Bool)

(assert start!64926)

(declare-datatypes ((array!17290 0))(
  ( (array!17291 (arr!8504 (Array (_ BitVec 32) (_ BitVec 8))) (size!7484 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12978 0))(
  ( (BitStream!12979 (buf!7550 array!17290) (currentByte!13984 (_ BitVec 32)) (currentBit!13979 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12978)

(declare-datatypes ((Unit!20245 0))(
  ( (Unit!20246) )
))
(declare-datatypes ((tuple3!1712 0))(
  ( (tuple3!1713 (_1!12721 Unit!20245) (_2!12721 BitStream!12978) (_3!1279 array!17290)) )
))
(declare-fun lt!423442 () tuple3!1712)

(declare-fun arr!273 () array!17290)

(declare-fun e!207636 () Bool)

(declare-fun b!291358 () Bool)

(assert (=> b!291358 (= e!207636 (and (= (buf!7550 thiss!1728) (buf!7550 (_2!12721 lt!423442))) (= (size!7484 arr!273) (size!7484 (_3!1279 lt!423442)))))))

(declare-fun res!240691 () Bool)

(declare-fun e!207637 () Bool)

(assert (=> start!64926 (=> (not res!240691) (not e!207637))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(assert (=> start!64926 (= res!240691 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7484 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64926 e!207637))

(declare-fun e!207634 () Bool)

(declare-fun inv!12 (BitStream!12978) Bool)

(assert (=> start!64926 (and (inv!12 thiss!1728) e!207634)))

(assert (=> start!64926 true))

(declare-fun array_inv!7096 (array!17290) Bool)

(assert (=> start!64926 (array_inv!7096 arr!273)))

(declare-fun b!291359 () Bool)

(declare-fun res!240688 () Bool)

(assert (=> b!291359 (=> (not res!240688) (not e!207637))))

(assert (=> b!291359 (= res!240688 (bvslt from!505 to!474))))

(declare-fun b!291360 () Bool)

(assert (=> b!291360 (= e!207637 (not true))))

(declare-datatypes ((tuple2!22884 0))(
  ( (tuple2!22885 (_1!12722 BitStream!12978) (_2!12722 Bool)) )
))
(declare-fun lt!423447 () tuple2!22884)

(declare-fun readBitPure!0 (BitStream!12978) tuple2!22884)

(assert (=> b!291360 (= lt!423447 (readBitPure!0 thiss!1728))))

(declare-fun e!207635 () Bool)

(assert (=> b!291360 e!207635))

(declare-fun res!240689 () Bool)

(assert (=> b!291360 (=> (not res!240689) (not e!207635))))

(declare-fun lt!423446 () array!17290)

(declare-fun lt!423443 () Bool)

(declare-fun bitAt!0 (array!17290 (_ BitVec 64)) Bool)

(assert (=> b!291360 (= res!240689 (= (bitAt!0 lt!423446 from!505) lt!423443))))

(assert (=> b!291360 (= lt!423443 (bitAt!0 (_3!1279 lt!423442) from!505))))

(declare-fun lt!423444 () Unit!20245)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17290 array!17290 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20245)

(assert (=> b!291360 (= lt!423444 (arrayBitRangesEqImpliesEq!0 lt!423446 (_3!1279 lt!423442) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arrayBitRangesEq!0 (array!17290 array!17290 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291360 (arrayBitRangesEq!0 arr!273 (_3!1279 lt!423442) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!423449 () Unit!20245)

(declare-fun arrayBitRangesEqTransitive!0 (array!17290 array!17290 array!17290 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20245)

(assert (=> b!291360 (= lt!423449 (arrayBitRangesEqTransitive!0 arr!273 lt!423446 (_3!1279 lt!423442) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!291360 (arrayBitRangesEq!0 arr!273 lt!423446 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!423440 () Unit!20245)

(declare-datatypes ((tuple2!22886 0))(
  ( (tuple2!22887 (_1!12723 Bool) (_2!12723 BitStream!12978)) )
))
(declare-fun lt!423445 () tuple2!22886)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17290 (_ BitVec 64) Bool) Unit!20245)

(assert (=> b!291360 (= lt!423440 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12723 lt!423445)))))

(assert (=> b!291360 e!207636))

(declare-fun res!240690 () Bool)

(assert (=> b!291360 (=> (not res!240690) (not e!207636))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!291360 (= res!240690 (= (bvsub (bvadd (bitIndex!0 (size!7484 (buf!7550 thiss!1728)) (currentByte!13984 thiss!1728) (currentBit!13979 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7484 (buf!7550 (_2!12721 lt!423442))) (currentByte!13984 (_2!12721 lt!423442)) (currentBit!13979 (_2!12721 lt!423442)))))))

(declare-fun readBitsLoop!0 (BitStream!12978 (_ BitVec 64) array!17290 (_ BitVec 64) (_ BitVec 64)) tuple3!1712)

(assert (=> b!291360 (= lt!423442 (readBitsLoop!0 (_2!12723 lt!423445) nBits!523 lt!423446 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291360 (validate_offset_bits!1 ((_ sign_extend 32) (size!7484 (buf!7550 (_2!12723 lt!423445)))) ((_ sign_extend 32) (currentByte!13984 (_2!12723 lt!423445))) ((_ sign_extend 32) (currentBit!13979 (_2!12723 lt!423445))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!423441 () Unit!20245)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12978 BitStream!12978 (_ BitVec 64) (_ BitVec 64)) Unit!20245)

(assert (=> b!291360 (= lt!423441 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12723 lt!423445) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!423448 () (_ BitVec 32))

(declare-fun lt!423450 () (_ BitVec 32))

(assert (=> b!291360 (= lt!423446 (array!17291 (store (arr!8504 arr!273) lt!423450 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8504 arr!273) lt!423450)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!423448)))) ((_ sign_extend 24) (ite (_1!12723 lt!423445) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!423448) #b00000000))))) (size!7484 arr!273)))))

(assert (=> b!291360 (= lt!423448 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!291360 (= lt!423450 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12978) tuple2!22886)

(assert (=> b!291360 (= lt!423445 (readBit!0 thiss!1728))))

(declare-fun b!291361 () Bool)

(assert (=> b!291361 (= e!207635 (= lt!423443 (_1!12723 lt!423445)))))

(declare-fun b!291362 () Bool)

(declare-fun res!240692 () Bool)

(assert (=> b!291362 (=> (not res!240692) (not e!207637))))

(assert (=> b!291362 (= res!240692 (validate_offset_bits!1 ((_ sign_extend 32) (size!7484 (buf!7550 thiss!1728))) ((_ sign_extend 32) (currentByte!13984 thiss!1728)) ((_ sign_extend 32) (currentBit!13979 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!291363 () Bool)

(assert (=> b!291363 (= e!207634 (array_inv!7096 (buf!7550 thiss!1728)))))

(assert (= (and start!64926 res!240691) b!291362))

(assert (= (and b!291362 res!240692) b!291359))

(assert (= (and b!291359 res!240688) b!291360))

(assert (= (and b!291360 res!240690) b!291358))

(assert (= (and b!291360 res!240689) b!291361))

(assert (= start!64926 b!291363))

(declare-fun m!426313 () Bool)

(assert (=> start!64926 m!426313))

(declare-fun m!426315 () Bool)

(assert (=> start!64926 m!426315))

(declare-fun m!426317 () Bool)

(assert (=> b!291360 m!426317))

(declare-fun m!426319 () Bool)

(assert (=> b!291360 m!426319))

(declare-fun m!426321 () Bool)

(assert (=> b!291360 m!426321))

(declare-fun m!426323 () Bool)

(assert (=> b!291360 m!426323))

(declare-fun m!426325 () Bool)

(assert (=> b!291360 m!426325))

(declare-fun m!426327 () Bool)

(assert (=> b!291360 m!426327))

(declare-fun m!426329 () Bool)

(assert (=> b!291360 m!426329))

(declare-fun m!426331 () Bool)

(assert (=> b!291360 m!426331))

(declare-fun m!426333 () Bool)

(assert (=> b!291360 m!426333))

(declare-fun m!426335 () Bool)

(assert (=> b!291360 m!426335))

(declare-fun m!426337 () Bool)

(assert (=> b!291360 m!426337))

(declare-fun m!426339 () Bool)

(assert (=> b!291360 m!426339))

(declare-fun m!426341 () Bool)

(assert (=> b!291360 m!426341))

(declare-fun m!426343 () Bool)

(assert (=> b!291360 m!426343))

(declare-fun m!426345 () Bool)

(assert (=> b!291360 m!426345))

(declare-fun m!426347 () Bool)

(assert (=> b!291360 m!426347))

(declare-fun m!426349 () Bool)

(assert (=> b!291360 m!426349))

(declare-fun m!426351 () Bool)

(assert (=> b!291362 m!426351))

(declare-fun m!426353 () Bool)

(assert (=> b!291363 m!426353))

(check-sat (not b!291362) (not b!291360) (not start!64926) (not b!291363))
