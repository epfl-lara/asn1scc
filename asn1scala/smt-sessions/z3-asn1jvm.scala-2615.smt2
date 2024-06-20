; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64608 () Bool)

(assert start!64608)

(declare-fun res!239594 () Bool)

(declare-fun e!206460 () Bool)

(assert (=> start!64608 (=> (not res!239594) (not e!206460))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17197 0))(
  ( (array!17198 (arr!8444 (Array (_ BitVec 32) (_ BitVec 8))) (size!7442 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17197)

(assert (=> start!64608 (= res!239594 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7442 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64608 e!206460))

(declare-datatypes ((BitStream!12894 0))(
  ( (BitStream!12895 (buf!7508 array!17197) (currentByte!13915 (_ BitVec 32)) (currentBit!13910 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12894)

(declare-fun e!206459 () Bool)

(declare-fun inv!12 (BitStream!12894) Bool)

(assert (=> start!64608 (and (inv!12 thiss!1728) e!206459)))

(assert (=> start!64608 true))

(declare-fun array_inv!7054 (array!17197) Bool)

(assert (=> start!64608 (array_inv!7054 arr!273)))

(declare-fun b!290003 () Bool)

(declare-fun res!239596 () Bool)

(assert (=> b!290003 (=> (not res!239596) (not e!206460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290003 (= res!239596 (validate_offset_bits!1 ((_ sign_extend 32) (size!7442 (buf!7508 thiss!1728))) ((_ sign_extend 32) (currentByte!13915 thiss!1728)) ((_ sign_extend 32) (currentBit!13910 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!290004 () Bool)

(assert (=> b!290004 (= e!206460 (not true))))

(declare-datatypes ((Unit!20125 0))(
  ( (Unit!20126) )
))
(declare-datatypes ((tuple3!1628 0))(
  ( (tuple3!1629 (_1!12607 Unit!20125) (_2!12607 BitStream!12894) (_3!1228 array!17197)) )
))
(declare-fun lt!420581 () tuple3!1628)

(declare-fun arrayBitRangesEq!0 (array!17197 array!17197 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290004 (arrayBitRangesEq!0 arr!273 (_3!1228 lt!420581) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!420584 () array!17197)

(declare-fun lt!420582 () Unit!20125)

(declare-fun arrayBitRangesEqTransitive!0 (array!17197 array!17197 array!17197 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20125)

(assert (=> b!290004 (= lt!420582 (arrayBitRangesEqTransitive!0 arr!273 lt!420584 (_3!1228 lt!420581) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!290004 (arrayBitRangesEq!0 arr!273 lt!420584 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((tuple2!22758 0))(
  ( (tuple2!22759 (_1!12608 Bool) (_2!12608 BitStream!12894)) )
))
(declare-fun lt!420585 () tuple2!22758)

(declare-fun lt!420587 () Unit!20125)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17197 (_ BitVec 64) Bool) Unit!20125)

(assert (=> b!290004 (= lt!420587 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12608 lt!420585)))))

(declare-fun e!206462 () Bool)

(assert (=> b!290004 e!206462))

(declare-fun res!239595 () Bool)

(assert (=> b!290004 (=> (not res!239595) (not e!206462))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!290004 (= res!239595 (= (bvsub (bvadd (bitIndex!0 (size!7442 (buf!7508 thiss!1728)) (currentByte!13915 thiss!1728) (currentBit!13910 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7442 (buf!7508 (_2!12607 lt!420581))) (currentByte!13915 (_2!12607 lt!420581)) (currentBit!13910 (_2!12607 lt!420581)))))))

(declare-fun readBitsLoop!0 (BitStream!12894 (_ BitVec 64) array!17197 (_ BitVec 64) (_ BitVec 64)) tuple3!1628)

(assert (=> b!290004 (= lt!420581 (readBitsLoop!0 (_2!12608 lt!420585) nBits!523 lt!420584 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!290004 (validate_offset_bits!1 ((_ sign_extend 32) (size!7442 (buf!7508 (_2!12608 lt!420585)))) ((_ sign_extend 32) (currentByte!13915 (_2!12608 lt!420585))) ((_ sign_extend 32) (currentBit!13910 (_2!12608 lt!420585))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420583 () Unit!20125)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12894 BitStream!12894 (_ BitVec 64) (_ BitVec 64)) Unit!20125)

(assert (=> b!290004 (= lt!420583 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12608 lt!420585) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420588 () (_ BitVec 32))

(declare-fun lt!420586 () (_ BitVec 32))

(assert (=> b!290004 (= lt!420584 (array!17198 (store (arr!8444 arr!273) lt!420586 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8444 arr!273) lt!420586)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420588)))) ((_ sign_extend 24) (ite (_1!12608 lt!420585) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420588) #b00000000))))) (size!7442 arr!273)))))

(assert (=> b!290004 (= lt!420588 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!290004 (= lt!420586 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12894) tuple2!22758)

(assert (=> b!290004 (= lt!420585 (readBit!0 thiss!1728))))

(declare-fun b!290005 () Bool)

(declare-fun res!239597 () Bool)

(assert (=> b!290005 (=> (not res!239597) (not e!206460))))

(assert (=> b!290005 (= res!239597 (bvslt from!505 to!474))))

(declare-fun b!290006 () Bool)

(assert (=> b!290006 (= e!206462 (and (= (buf!7508 thiss!1728) (buf!7508 (_2!12607 lt!420581))) (= (size!7442 arr!273) (size!7442 (_3!1228 lt!420581)))))))

(declare-fun b!290007 () Bool)

(assert (=> b!290007 (= e!206459 (array_inv!7054 (buf!7508 thiss!1728)))))

(assert (= (and start!64608 res!239594) b!290003))

(assert (= (and b!290003 res!239596) b!290005))

(assert (= (and b!290005 res!239597) b!290004))

(assert (= (and b!290004 res!239595) b!290006))

(assert (= start!64608 b!290007))

(declare-fun m!423521 () Bool)

(assert (=> start!64608 m!423521))

(declare-fun m!423523 () Bool)

(assert (=> start!64608 m!423523))

(declare-fun m!423525 () Bool)

(assert (=> b!290003 m!423525))

(declare-fun m!423527 () Bool)

(assert (=> b!290004 m!423527))

(declare-fun m!423529 () Bool)

(assert (=> b!290004 m!423529))

(declare-fun m!423531 () Bool)

(assert (=> b!290004 m!423531))

(declare-fun m!423533 () Bool)

(assert (=> b!290004 m!423533))

(declare-fun m!423535 () Bool)

(assert (=> b!290004 m!423535))

(declare-fun m!423537 () Bool)

(assert (=> b!290004 m!423537))

(declare-fun m!423539 () Bool)

(assert (=> b!290004 m!423539))

(declare-fun m!423541 () Bool)

(assert (=> b!290004 m!423541))

(declare-fun m!423543 () Bool)

(assert (=> b!290004 m!423543))

(declare-fun m!423545 () Bool)

(assert (=> b!290004 m!423545))

(declare-fun m!423547 () Bool)

(assert (=> b!290004 m!423547))

(declare-fun m!423549 () Bool)

(assert (=> b!290004 m!423549))

(declare-fun m!423551 () Bool)

(assert (=> b!290004 m!423551))

(declare-fun m!423553 () Bool)

(assert (=> b!290007 m!423553))

(check-sat (not b!290007) (not b!290004) (not b!290003) (not start!64608))
