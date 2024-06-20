; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64598 () Bool)

(assert start!64598)

(declare-fun b!289928 () Bool)

(declare-fun e!206386 () Bool)

(declare-datatypes ((array!17187 0))(
  ( (array!17188 (arr!8439 (Array (_ BitVec 32) (_ BitVec 8))) (size!7437 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12884 0))(
  ( (BitStream!12885 (buf!7503 array!17187) (currentByte!13910 (_ BitVec 32)) (currentBit!13905 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12884)

(declare-fun array_inv!7049 (array!17187) Bool)

(assert (=> b!289928 (= e!206386 (array_inv!7049 (buf!7503 thiss!1728)))))

(declare-fun b!289929 () Bool)

(declare-fun res!239537 () Bool)

(declare-fun e!206388 () Bool)

(assert (=> b!289929 (=> (not res!239537) (not e!206388))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!289929 (= res!239537 (bvslt from!505 to!474))))

(declare-fun b!289930 () Bool)

(declare-fun arr!273 () array!17187)

(assert (=> b!289930 (= e!206388 (not (bvsle from!505 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7437 arr!273))))))))

(declare-datatypes ((Unit!20115 0))(
  ( (Unit!20116) )
))
(declare-datatypes ((tuple3!1618 0))(
  ( (tuple3!1619 (_1!12597 Unit!20115) (_2!12597 BitStream!12884) (_3!1223 array!17187)) )
))
(declare-fun lt!420464 () tuple3!1618)

(declare-fun arrayBitRangesEq!0 (array!17187 array!17187 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289930 (arrayBitRangesEq!0 arr!273 (_3!1223 lt!420464) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!420467 () Unit!20115)

(declare-fun lt!420461 () array!17187)

(declare-fun arrayBitRangesEqTransitive!0 (array!17187 array!17187 array!17187 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20115)

(assert (=> b!289930 (= lt!420467 (arrayBitRangesEqTransitive!0 arr!273 lt!420461 (_3!1223 lt!420464) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!289930 (arrayBitRangesEq!0 arr!273 lt!420461 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!420465 () Unit!20115)

(declare-datatypes ((tuple2!22748 0))(
  ( (tuple2!22749 (_1!12598 Bool) (_2!12598 BitStream!12884)) )
))
(declare-fun lt!420468 () tuple2!22748)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17187 (_ BitVec 64) Bool) Unit!20115)

(assert (=> b!289930 (= lt!420465 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12598 lt!420468)))))

(declare-fun e!206385 () Bool)

(assert (=> b!289930 e!206385))

(declare-fun res!239534 () Bool)

(assert (=> b!289930 (=> (not res!239534) (not e!206385))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!289930 (= res!239534 (= (bvsub (bvadd (bitIndex!0 (size!7437 (buf!7503 thiss!1728)) (currentByte!13910 thiss!1728) (currentBit!13905 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7437 (buf!7503 (_2!12597 lt!420464))) (currentByte!13910 (_2!12597 lt!420464)) (currentBit!13905 (_2!12597 lt!420464)))))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!12884 (_ BitVec 64) array!17187 (_ BitVec 64) (_ BitVec 64)) tuple3!1618)

(assert (=> b!289930 (= lt!420464 (readBitsLoop!0 (_2!12598 lt!420468) nBits!523 lt!420461 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289930 (validate_offset_bits!1 ((_ sign_extend 32) (size!7437 (buf!7503 (_2!12598 lt!420468)))) ((_ sign_extend 32) (currentByte!13910 (_2!12598 lt!420468))) ((_ sign_extend 32) (currentBit!13905 (_2!12598 lt!420468))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420463 () Unit!20115)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12884 BitStream!12884 (_ BitVec 64) (_ BitVec 64)) Unit!20115)

(assert (=> b!289930 (= lt!420463 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12598 lt!420468) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420462 () (_ BitVec 32))

(declare-fun lt!420466 () (_ BitVec 32))

(assert (=> b!289930 (= lt!420461 (array!17188 (store (arr!8439 arr!273) lt!420466 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8439 arr!273) lt!420466)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420462)))) ((_ sign_extend 24) (ite (_1!12598 lt!420468) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420462) #b00000000))))) (size!7437 arr!273)))))

(assert (=> b!289930 (= lt!420462 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!289930 (= lt!420466 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12884) tuple2!22748)

(assert (=> b!289930 (= lt!420468 (readBit!0 thiss!1728))))

(declare-fun b!289931 () Bool)

(declare-fun res!239536 () Bool)

(assert (=> b!289931 (=> (not res!239536) (not e!206388))))

(assert (=> b!289931 (= res!239536 (validate_offset_bits!1 ((_ sign_extend 32) (size!7437 (buf!7503 thiss!1728))) ((_ sign_extend 32) (currentByte!13910 thiss!1728)) ((_ sign_extend 32) (currentBit!13905 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!289932 () Bool)

(assert (=> b!289932 (= e!206385 (and (= (buf!7503 thiss!1728) (buf!7503 (_2!12597 lt!420464))) (= (size!7437 arr!273) (size!7437 (_3!1223 lt!420464)))))))

(declare-fun res!239535 () Bool)

(assert (=> start!64598 (=> (not res!239535) (not e!206388))))

(assert (=> start!64598 (= res!239535 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7437 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64598 e!206388))

(declare-fun inv!12 (BitStream!12884) Bool)

(assert (=> start!64598 (and (inv!12 thiss!1728) e!206386)))

(assert (=> start!64598 true))

(assert (=> start!64598 (array_inv!7049 arr!273)))

(assert (= (and start!64598 res!239535) b!289931))

(assert (= (and b!289931 res!239536) b!289929))

(assert (= (and b!289929 res!239537) b!289930))

(assert (= (and b!289930 res!239534) b!289932))

(assert (= start!64598 b!289928))

(declare-fun m!423351 () Bool)

(assert (=> b!289928 m!423351))

(declare-fun m!423353 () Bool)

(assert (=> b!289930 m!423353))

(declare-fun m!423355 () Bool)

(assert (=> b!289930 m!423355))

(declare-fun m!423357 () Bool)

(assert (=> b!289930 m!423357))

(declare-fun m!423359 () Bool)

(assert (=> b!289930 m!423359))

(declare-fun m!423361 () Bool)

(assert (=> b!289930 m!423361))

(declare-fun m!423363 () Bool)

(assert (=> b!289930 m!423363))

(declare-fun m!423365 () Bool)

(assert (=> b!289930 m!423365))

(declare-fun m!423367 () Bool)

(assert (=> b!289930 m!423367))

(declare-fun m!423369 () Bool)

(assert (=> b!289930 m!423369))

(declare-fun m!423371 () Bool)

(assert (=> b!289930 m!423371))

(declare-fun m!423373 () Bool)

(assert (=> b!289930 m!423373))

(declare-fun m!423375 () Bool)

(assert (=> b!289930 m!423375))

(declare-fun m!423377 () Bool)

(assert (=> b!289930 m!423377))

(declare-fun m!423379 () Bool)

(assert (=> b!289931 m!423379))

(declare-fun m!423381 () Bool)

(assert (=> start!64598 m!423381))

(declare-fun m!423383 () Bool)

(assert (=> start!64598 m!423383))

(push 1)

(assert (not b!289931))

(assert (not b!289930))

(assert (not start!64598))

(assert (not b!289928))

(check-sat)

(pop 1)

(push 1)

(check-sat)

