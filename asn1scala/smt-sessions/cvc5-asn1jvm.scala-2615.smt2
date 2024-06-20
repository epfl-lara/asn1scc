; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64606 () Bool)

(assert start!64606)

(declare-fun b!289988 () Bool)

(declare-datatypes ((array!17195 0))(
  ( (array!17196 (arr!8443 (Array (_ BitVec 32) (_ BitVec 8))) (size!7441 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12892 0))(
  ( (BitStream!12893 (buf!7507 array!17195) (currentByte!13914 (_ BitVec 32)) (currentBit!13909 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12892)

(declare-datatypes ((Unit!20123 0))(
  ( (Unit!20124) )
))
(declare-datatypes ((tuple3!1626 0))(
  ( (tuple3!1627 (_1!12605 Unit!20123) (_2!12605 BitStream!12892) (_3!1227 array!17195)) )
))
(declare-fun lt!420563 () tuple3!1626)

(declare-fun e!206448 () Bool)

(declare-fun arr!273 () array!17195)

(assert (=> b!289988 (= e!206448 (and (= (buf!7507 thiss!1728) (buf!7507 (_2!12605 lt!420563))) (= (size!7441 arr!273) (size!7441 (_3!1227 lt!420563)))))))

(declare-fun b!289989 () Bool)

(declare-fun e!206444 () Bool)

(declare-fun array_inv!7053 (array!17195) Bool)

(assert (=> b!289989 (= e!206444 (array_inv!7053 (buf!7507 thiss!1728)))))

(declare-fun b!289990 () Bool)

(declare-fun res!239585 () Bool)

(declare-fun e!206445 () Bool)

(assert (=> b!289990 (=> (not res!239585) (not e!206445))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!289990 (= res!239585 (bvslt from!505 to!474))))

(declare-fun b!289991 () Bool)

(assert (=> b!289991 (= e!206445 (not true))))

(declare-fun arrayBitRangesEq!0 (array!17195 array!17195 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289991 (arrayBitRangesEq!0 arr!273 (_3!1227 lt!420563) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!420562 () Unit!20123)

(declare-fun lt!420564 () array!17195)

(declare-fun arrayBitRangesEqTransitive!0 (array!17195 array!17195 array!17195 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20123)

(assert (=> b!289991 (= lt!420562 (arrayBitRangesEqTransitive!0 arr!273 lt!420564 (_3!1227 lt!420563) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!289991 (arrayBitRangesEq!0 arr!273 lt!420564 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((tuple2!22756 0))(
  ( (tuple2!22757 (_1!12606 Bool) (_2!12606 BitStream!12892)) )
))
(declare-fun lt!420557 () tuple2!22756)

(declare-fun lt!420560 () Unit!20123)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17195 (_ BitVec 64) Bool) Unit!20123)

(assert (=> b!289991 (= lt!420560 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12606 lt!420557)))))

(assert (=> b!289991 e!206448))

(declare-fun res!239584 () Bool)

(assert (=> b!289991 (=> (not res!239584) (not e!206448))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!289991 (= res!239584 (= (bvsub (bvadd (bitIndex!0 (size!7441 (buf!7507 thiss!1728)) (currentByte!13914 thiss!1728) (currentBit!13909 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7441 (buf!7507 (_2!12605 lt!420563))) (currentByte!13914 (_2!12605 lt!420563)) (currentBit!13909 (_2!12605 lt!420563)))))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!12892 (_ BitVec 64) array!17195 (_ BitVec 64) (_ BitVec 64)) tuple3!1626)

(assert (=> b!289991 (= lt!420563 (readBitsLoop!0 (_2!12606 lt!420557) nBits!523 lt!420564 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289991 (validate_offset_bits!1 ((_ sign_extend 32) (size!7441 (buf!7507 (_2!12606 lt!420557)))) ((_ sign_extend 32) (currentByte!13914 (_2!12606 lt!420557))) ((_ sign_extend 32) (currentBit!13909 (_2!12606 lt!420557))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420559 () Unit!20123)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12892 BitStream!12892 (_ BitVec 64) (_ BitVec 64)) Unit!20123)

(assert (=> b!289991 (= lt!420559 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12606 lt!420557) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420561 () (_ BitVec 32))

(declare-fun lt!420558 () (_ BitVec 32))

(assert (=> b!289991 (= lt!420564 (array!17196 (store (arr!8443 arr!273) lt!420558 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8443 arr!273) lt!420558)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420561)))) ((_ sign_extend 24) (ite (_1!12606 lt!420557) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420561) #b00000000))))) (size!7441 arr!273)))))

(assert (=> b!289991 (= lt!420561 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!289991 (= lt!420558 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12892) tuple2!22756)

(assert (=> b!289991 (= lt!420557 (readBit!0 thiss!1728))))

(declare-fun res!239583 () Bool)

(assert (=> start!64606 (=> (not res!239583) (not e!206445))))

(assert (=> start!64606 (= res!239583 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7441 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64606 e!206445))

(declare-fun inv!12 (BitStream!12892) Bool)

(assert (=> start!64606 (and (inv!12 thiss!1728) e!206444)))

(assert (=> start!64606 true))

(assert (=> start!64606 (array_inv!7053 arr!273)))

(declare-fun b!289992 () Bool)

(declare-fun res!239582 () Bool)

(assert (=> b!289992 (=> (not res!239582) (not e!206445))))

(assert (=> b!289992 (= res!239582 (validate_offset_bits!1 ((_ sign_extend 32) (size!7441 (buf!7507 thiss!1728))) ((_ sign_extend 32) (currentByte!13914 thiss!1728)) ((_ sign_extend 32) (currentBit!13909 thiss!1728)) (bvsub nBits!523 from!505)))))

(assert (= (and start!64606 res!239583) b!289992))

(assert (= (and b!289992 res!239582) b!289990))

(assert (= (and b!289990 res!239585) b!289991))

(assert (= (and b!289991 res!239584) b!289988))

(assert (= start!64606 b!289989))

(declare-fun m!423487 () Bool)

(assert (=> b!289989 m!423487))

(declare-fun m!423489 () Bool)

(assert (=> b!289991 m!423489))

(declare-fun m!423491 () Bool)

(assert (=> b!289991 m!423491))

(declare-fun m!423493 () Bool)

(assert (=> b!289991 m!423493))

(declare-fun m!423495 () Bool)

(assert (=> b!289991 m!423495))

(declare-fun m!423497 () Bool)

(assert (=> b!289991 m!423497))

(declare-fun m!423499 () Bool)

(assert (=> b!289991 m!423499))

(declare-fun m!423501 () Bool)

(assert (=> b!289991 m!423501))

(declare-fun m!423503 () Bool)

(assert (=> b!289991 m!423503))

(declare-fun m!423505 () Bool)

(assert (=> b!289991 m!423505))

(declare-fun m!423507 () Bool)

(assert (=> b!289991 m!423507))

(declare-fun m!423509 () Bool)

(assert (=> b!289991 m!423509))

(declare-fun m!423511 () Bool)

(assert (=> b!289991 m!423511))

(declare-fun m!423513 () Bool)

(assert (=> b!289991 m!423513))

(declare-fun m!423515 () Bool)

(assert (=> start!64606 m!423515))

(declare-fun m!423517 () Bool)

(assert (=> start!64606 m!423517))

(declare-fun m!423519 () Bool)

(assert (=> b!289992 m!423519))

(push 1)

(assert (not b!289989))

(assert (not start!64606))

(assert (not b!289992))

(assert (not b!289991))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

