; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64600 () Bool)

(assert start!64600)

(declare-fun res!239548 () Bool)

(declare-fun e!206403 () Bool)

(assert (=> start!64600 (=> (not res!239548) (not e!206403))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17189 0))(
  ( (array!17190 (arr!8440 (Array (_ BitVec 32) (_ BitVec 8))) (size!7438 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17189)

(assert (=> start!64600 (= res!239548 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7438 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64600 e!206403))

(declare-datatypes ((BitStream!12886 0))(
  ( (BitStream!12887 (buf!7504 array!17189) (currentByte!13911 (_ BitVec 32)) (currentBit!13906 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12886)

(declare-fun e!206402 () Bool)

(declare-fun inv!12 (BitStream!12886) Bool)

(assert (=> start!64600 (and (inv!12 thiss!1728) e!206402)))

(assert (=> start!64600 true))

(declare-fun array_inv!7050 (array!17189) Bool)

(assert (=> start!64600 (array_inv!7050 arr!273)))

(declare-fun b!289943 () Bool)

(declare-fun e!206399 () Bool)

(declare-datatypes ((Unit!20117 0))(
  ( (Unit!20118) )
))
(declare-datatypes ((tuple3!1620 0))(
  ( (tuple3!1621 (_1!12599 Unit!20117) (_2!12599 BitStream!12886) (_3!1224 array!17189)) )
))
(declare-fun lt!420487 () tuple3!1620)

(assert (=> b!289943 (= e!206399 (and (= (buf!7504 thiss!1728) (buf!7504 (_2!12599 lt!420487))) (= (size!7438 arr!273) (size!7438 (_3!1224 lt!420487)))))))

(declare-fun b!289944 () Bool)

(declare-fun res!239549 () Bool)

(assert (=> b!289944 (=> (not res!239549) (not e!206403))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289944 (= res!239549 (validate_offset_bits!1 ((_ sign_extend 32) (size!7438 (buf!7504 thiss!1728))) ((_ sign_extend 32) (currentByte!13911 thiss!1728)) ((_ sign_extend 32) (currentBit!13906 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!289945 () Bool)

(assert (=> b!289945 (= e!206402 (array_inv!7050 (buf!7504 thiss!1728)))))

(declare-fun b!289946 () Bool)

(declare-fun res!239547 () Bool)

(assert (=> b!289946 (=> (not res!239547) (not e!206403))))

(assert (=> b!289946 (= res!239547 (bvslt from!505 to!474))))

(declare-fun b!289947 () Bool)

(assert (=> b!289947 (= e!206403 (not true))))

(declare-fun arrayBitRangesEq!0 (array!17189 array!17189 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289947 (arrayBitRangesEq!0 arr!273 (_3!1224 lt!420487) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!420486 () array!17189)

(declare-fun lt!420492 () Unit!20117)

(declare-fun arrayBitRangesEqTransitive!0 (array!17189 array!17189 array!17189 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20117)

(assert (=> b!289947 (= lt!420492 (arrayBitRangesEqTransitive!0 arr!273 lt!420486 (_3!1224 lt!420487) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!289947 (arrayBitRangesEq!0 arr!273 lt!420486 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!420485 () Unit!20117)

(declare-datatypes ((tuple2!22750 0))(
  ( (tuple2!22751 (_1!12600 Bool) (_2!12600 BitStream!12886)) )
))
(declare-fun lt!420488 () tuple2!22750)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17189 (_ BitVec 64) Bool) Unit!20117)

(assert (=> b!289947 (= lt!420485 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12600 lt!420488)))))

(assert (=> b!289947 e!206399))

(declare-fun res!239546 () Bool)

(assert (=> b!289947 (=> (not res!239546) (not e!206399))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!289947 (= res!239546 (= (bvsub (bvadd (bitIndex!0 (size!7438 (buf!7504 thiss!1728)) (currentByte!13911 thiss!1728) (currentBit!13906 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7438 (buf!7504 (_2!12599 lt!420487))) (currentByte!13911 (_2!12599 lt!420487)) (currentBit!13906 (_2!12599 lt!420487)))))))

(declare-fun readBitsLoop!0 (BitStream!12886 (_ BitVec 64) array!17189 (_ BitVec 64) (_ BitVec 64)) tuple3!1620)

(assert (=> b!289947 (= lt!420487 (readBitsLoop!0 (_2!12600 lt!420488) nBits!523 lt!420486 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!289947 (validate_offset_bits!1 ((_ sign_extend 32) (size!7438 (buf!7504 (_2!12600 lt!420488)))) ((_ sign_extend 32) (currentByte!13911 (_2!12600 lt!420488))) ((_ sign_extend 32) (currentBit!13906 (_2!12600 lt!420488))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420490 () Unit!20117)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12886 BitStream!12886 (_ BitVec 64) (_ BitVec 64)) Unit!20117)

(assert (=> b!289947 (= lt!420490 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12600 lt!420488) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420491 () (_ BitVec 32))

(declare-fun lt!420489 () (_ BitVec 32))

(assert (=> b!289947 (= lt!420486 (array!17190 (store (arr!8440 arr!273) lt!420491 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8440 arr!273) lt!420491)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420489)))) ((_ sign_extend 24) (ite (_1!12600 lt!420488) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420489) #b00000000))))) (size!7438 arr!273)))))

(assert (=> b!289947 (= lt!420489 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!289947 (= lt!420491 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12886) tuple2!22750)

(assert (=> b!289947 (= lt!420488 (readBit!0 thiss!1728))))

(assert (= (and start!64600 res!239548) b!289944))

(assert (= (and b!289944 res!239549) b!289946))

(assert (= (and b!289946 res!239547) b!289947))

(assert (= (and b!289947 res!239546) b!289943))

(assert (= start!64600 b!289945))

(declare-fun m!423385 () Bool)

(assert (=> start!64600 m!423385))

(declare-fun m!423387 () Bool)

(assert (=> start!64600 m!423387))

(declare-fun m!423389 () Bool)

(assert (=> b!289944 m!423389))

(declare-fun m!423391 () Bool)

(assert (=> b!289945 m!423391))

(declare-fun m!423393 () Bool)

(assert (=> b!289947 m!423393))

(declare-fun m!423395 () Bool)

(assert (=> b!289947 m!423395))

(declare-fun m!423397 () Bool)

(assert (=> b!289947 m!423397))

(declare-fun m!423399 () Bool)

(assert (=> b!289947 m!423399))

(declare-fun m!423401 () Bool)

(assert (=> b!289947 m!423401))

(declare-fun m!423403 () Bool)

(assert (=> b!289947 m!423403))

(declare-fun m!423405 () Bool)

(assert (=> b!289947 m!423405))

(declare-fun m!423407 () Bool)

(assert (=> b!289947 m!423407))

(declare-fun m!423409 () Bool)

(assert (=> b!289947 m!423409))

(declare-fun m!423411 () Bool)

(assert (=> b!289947 m!423411))

(declare-fun m!423413 () Bool)

(assert (=> b!289947 m!423413))

(declare-fun m!423415 () Bool)

(assert (=> b!289947 m!423415))

(declare-fun m!423417 () Bool)

(assert (=> b!289947 m!423417))

(push 1)

(assert (not b!289945))

(assert (not start!64600))

(assert (not b!289944))

(assert (not b!289947))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

