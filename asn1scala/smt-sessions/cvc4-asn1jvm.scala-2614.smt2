; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64604 () Bool)

(assert start!64604)

(declare-fun b!289973 () Bool)

(declare-fun e!206431 () Bool)

(declare-datatypes ((array!17193 0))(
  ( (array!17194 (arr!8442 (Array (_ BitVec 32) (_ BitVec 8))) (size!7440 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12890 0))(
  ( (BitStream!12891 (buf!7506 array!17193) (currentByte!13913 (_ BitVec 32)) (currentBit!13908 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12890)

(declare-fun array_inv!7052 (array!17193) Bool)

(assert (=> b!289973 (= e!206431 (array_inv!7052 (buf!7506 thiss!1728)))))

(declare-fun b!289974 () Bool)

(declare-fun e!206430 () Bool)

(assert (=> b!289974 (= e!206430 (not true))))

(declare-fun arr!273 () array!17193)

(declare-datatypes ((Unit!20121 0))(
  ( (Unit!20122) )
))
(declare-datatypes ((tuple3!1624 0))(
  ( (tuple3!1625 (_1!12603 Unit!20121) (_2!12603 BitStream!12890) (_3!1226 array!17193)) )
))
(declare-fun lt!420540 () tuple3!1624)

(declare-fun from!505 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!17193 array!17193 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289974 (arrayBitRangesEq!0 arr!273 (_3!1226 lt!420540) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!420537 () Unit!20121)

(declare-fun lt!420536 () array!17193)

(declare-fun arrayBitRangesEqTransitive!0 (array!17193 array!17193 array!17193 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20121)

(assert (=> b!289974 (= lt!420537 (arrayBitRangesEqTransitive!0 arr!273 lt!420536 (_3!1226 lt!420540) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!289974 (arrayBitRangesEq!0 arr!273 lt!420536 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((tuple2!22754 0))(
  ( (tuple2!22755 (_1!12604 Bool) (_2!12604 BitStream!12890)) )
))
(declare-fun lt!420533 () tuple2!22754)

(declare-fun lt!420535 () Unit!20121)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17193 (_ BitVec 64) Bool) Unit!20121)

(assert (=> b!289974 (= lt!420535 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12604 lt!420533)))))

(declare-fun e!206429 () Bool)

(assert (=> b!289974 e!206429))

(declare-fun res!239571 () Bool)

(assert (=> b!289974 (=> (not res!239571) (not e!206429))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!289974 (= res!239571 (= (bvsub (bvadd (bitIndex!0 (size!7440 (buf!7506 thiss!1728)) (currentByte!13913 thiss!1728) (currentBit!13908 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7440 (buf!7506 (_2!12603 lt!420540))) (currentByte!13913 (_2!12603 lt!420540)) (currentBit!13908 (_2!12603 lt!420540)))))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!12890 (_ BitVec 64) array!17193 (_ BitVec 64) (_ BitVec 64)) tuple3!1624)

(assert (=> b!289974 (= lt!420540 (readBitsLoop!0 (_2!12604 lt!420533) nBits!523 lt!420536 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289974 (validate_offset_bits!1 ((_ sign_extend 32) (size!7440 (buf!7506 (_2!12604 lt!420533)))) ((_ sign_extend 32) (currentByte!13913 (_2!12604 lt!420533))) ((_ sign_extend 32) (currentBit!13908 (_2!12604 lt!420533))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420538 () Unit!20121)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12890 BitStream!12890 (_ BitVec 64) (_ BitVec 64)) Unit!20121)

(assert (=> b!289974 (= lt!420538 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12604 lt!420533) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420539 () (_ BitVec 32))

(declare-fun lt!420534 () (_ BitVec 32))

(assert (=> b!289974 (= lt!420536 (array!17194 (store (arr!8442 arr!273) lt!420539 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8442 arr!273) lt!420539)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420534)))) ((_ sign_extend 24) (ite (_1!12604 lt!420533) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420534) #b00000000))))) (size!7440 arr!273)))))

(assert (=> b!289974 (= lt!420534 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!289974 (= lt!420539 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12890) tuple2!22754)

(assert (=> b!289974 (= lt!420533 (readBit!0 thiss!1728))))

(declare-fun b!289975 () Bool)

(assert (=> b!289975 (= e!206429 (and (= (buf!7506 thiss!1728) (buf!7506 (_2!12603 lt!420540))) (= (size!7440 arr!273) (size!7440 (_3!1226 lt!420540)))))))

(declare-fun res!239573 () Bool)

(assert (=> start!64604 (=> (not res!239573) (not e!206430))))

(assert (=> start!64604 (= res!239573 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7440 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64604 e!206430))

(declare-fun inv!12 (BitStream!12890) Bool)

(assert (=> start!64604 (and (inv!12 thiss!1728) e!206431)))

(assert (=> start!64604 true))

(assert (=> start!64604 (array_inv!7052 arr!273)))

(declare-fun b!289976 () Bool)

(declare-fun res!239572 () Bool)

(assert (=> b!289976 (=> (not res!239572) (not e!206430))))

(assert (=> b!289976 (= res!239572 (validate_offset_bits!1 ((_ sign_extend 32) (size!7440 (buf!7506 thiss!1728))) ((_ sign_extend 32) (currentByte!13913 thiss!1728)) ((_ sign_extend 32) (currentBit!13908 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!289977 () Bool)

(declare-fun res!239570 () Bool)

(assert (=> b!289977 (=> (not res!239570) (not e!206430))))

(assert (=> b!289977 (= res!239570 (bvslt from!505 to!474))))

(assert (= (and start!64604 res!239573) b!289976))

(assert (= (and b!289976 res!239572) b!289977))

(assert (= (and b!289977 res!239570) b!289974))

(assert (= (and b!289974 res!239571) b!289975))

(assert (= start!64604 b!289973))

(declare-fun m!423453 () Bool)

(assert (=> b!289973 m!423453))

(declare-fun m!423455 () Bool)

(assert (=> b!289974 m!423455))

(declare-fun m!423457 () Bool)

(assert (=> b!289974 m!423457))

(declare-fun m!423459 () Bool)

(assert (=> b!289974 m!423459))

(declare-fun m!423461 () Bool)

(assert (=> b!289974 m!423461))

(declare-fun m!423463 () Bool)

(assert (=> b!289974 m!423463))

(declare-fun m!423465 () Bool)

(assert (=> b!289974 m!423465))

(declare-fun m!423467 () Bool)

(assert (=> b!289974 m!423467))

(declare-fun m!423469 () Bool)

(assert (=> b!289974 m!423469))

(declare-fun m!423471 () Bool)

(assert (=> b!289974 m!423471))

(declare-fun m!423473 () Bool)

(assert (=> b!289974 m!423473))

(declare-fun m!423475 () Bool)

(assert (=> b!289974 m!423475))

(declare-fun m!423477 () Bool)

(assert (=> b!289974 m!423477))

(declare-fun m!423479 () Bool)

(assert (=> b!289974 m!423479))

(declare-fun m!423481 () Bool)

(assert (=> start!64604 m!423481))

(declare-fun m!423483 () Bool)

(assert (=> start!64604 m!423483))

(declare-fun m!423485 () Bool)

(assert (=> b!289976 m!423485))

(push 1)

(assert (not start!64604))

(assert (not b!289973))

(assert (not b!289974))

(assert (not b!289976))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

