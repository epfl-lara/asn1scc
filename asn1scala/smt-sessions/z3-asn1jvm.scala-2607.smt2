; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64560 () Bool)

(assert start!64560)

(declare-fun b!289643 () Bool)

(declare-fun res!239308 () Bool)

(declare-fun e!206102 () Bool)

(assert (=> b!289643 (=> (not res!239308) (not e!206102))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!289643 (= res!239308 (bvslt from!505 to!474))))

(declare-fun b!289644 () Bool)

(declare-fun e!206101 () Bool)

(declare-datatypes ((array!17149 0))(
  ( (array!17150 (arr!8420 (Array (_ BitVec 32) (_ BitVec 8))) (size!7418 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12846 0))(
  ( (BitStream!12847 (buf!7484 array!17149) (currentByte!13891 (_ BitVec 32)) (currentBit!13886 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12846)

(declare-fun array_inv!7030 (array!17149) Bool)

(assert (=> b!289644 (= e!206101 (array_inv!7030 (buf!7484 thiss!1728)))))

(declare-fun res!239309 () Bool)

(assert (=> start!64560 (=> (not res!239309) (not e!206102))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun arr!273 () array!17149)

(assert (=> start!64560 (= res!239309 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7418 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64560 e!206102))

(declare-fun inv!12 (BitStream!12846) Bool)

(assert (=> start!64560 (and (inv!12 thiss!1728) e!206101)))

(assert (=> start!64560 true))

(assert (=> start!64560 (array_inv!7030 arr!273)))

(declare-fun b!289645 () Bool)

(assert (=> b!289645 (= e!206102 (not true))))

(declare-fun lt!420045 () array!17149)

(declare-fun arrayBitRangesEq!0 (array!17149 array!17149 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289645 (arrayBitRangesEq!0 arr!273 lt!420045 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((tuple2!22710 0))(
  ( (tuple2!22711 (_1!12559 Bool) (_2!12559 BitStream!12846)) )
))
(declare-fun lt!420046 () tuple2!22710)

(declare-datatypes ((Unit!20077 0))(
  ( (Unit!20078) )
))
(declare-fun lt!420051 () Unit!20077)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17149 (_ BitVec 64) Bool) Unit!20077)

(assert (=> b!289645 (= lt!420051 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12559 lt!420046)))))

(declare-fun e!206100 () Bool)

(assert (=> b!289645 e!206100))

(declare-fun res!239306 () Bool)

(assert (=> b!289645 (=> (not res!239306) (not e!206100))))

(declare-datatypes ((tuple3!1580 0))(
  ( (tuple3!1581 (_1!12560 Unit!20077) (_2!12560 BitStream!12846) (_3!1204 array!17149)) )
))
(declare-fun lt!420047 () tuple3!1580)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!289645 (= res!239306 (= (bvsub (bvadd (bitIndex!0 (size!7418 (buf!7484 thiss!1728)) (currentByte!13891 thiss!1728) (currentBit!13886 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7418 (buf!7484 (_2!12560 lt!420047))) (currentByte!13891 (_2!12560 lt!420047)) (currentBit!13886 (_2!12560 lt!420047)))))))

(declare-fun readBitsLoop!0 (BitStream!12846 (_ BitVec 64) array!17149 (_ BitVec 64) (_ BitVec 64)) tuple3!1580)

(assert (=> b!289645 (= lt!420047 (readBitsLoop!0 (_2!12559 lt!420046) nBits!523 lt!420045 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289645 (validate_offset_bits!1 ((_ sign_extend 32) (size!7418 (buf!7484 (_2!12559 lt!420046)))) ((_ sign_extend 32) (currentByte!13891 (_2!12559 lt!420046))) ((_ sign_extend 32) (currentBit!13886 (_2!12559 lt!420046))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420048 () Unit!20077)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12846 BitStream!12846 (_ BitVec 64) (_ BitVec 64)) Unit!20077)

(assert (=> b!289645 (= lt!420048 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12559 lt!420046) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420050 () (_ BitVec 32))

(declare-fun lt!420049 () (_ BitVec 32))

(assert (=> b!289645 (= lt!420045 (array!17150 (store (arr!8420 arr!273) lt!420049 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8420 arr!273) lt!420049)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420050)))) ((_ sign_extend 24) (ite (_1!12559 lt!420046) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420050) #b00000000))))) (size!7418 arr!273)))))

(assert (=> b!289645 (= lt!420050 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!289645 (= lt!420049 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12846) tuple2!22710)

(assert (=> b!289645 (= lt!420046 (readBit!0 thiss!1728))))

(declare-fun b!289646 () Bool)

(declare-fun res!239307 () Bool)

(assert (=> b!289646 (=> (not res!239307) (not e!206102))))

(assert (=> b!289646 (= res!239307 (validate_offset_bits!1 ((_ sign_extend 32) (size!7418 (buf!7484 thiss!1728))) ((_ sign_extend 32) (currentByte!13891 thiss!1728)) ((_ sign_extend 32) (currentBit!13886 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!289647 () Bool)

(assert (=> b!289647 (= e!206100 (and (= (buf!7484 thiss!1728) (buf!7484 (_2!12560 lt!420047))) (= (size!7418 arr!273) (size!7418 (_3!1204 lt!420047)))))))

(assert (= (and start!64560 res!239309) b!289646))

(assert (= (and b!289646 res!239307) b!289643))

(assert (= (and b!289643 res!239308) b!289645))

(assert (= (and b!289645 res!239306) b!289647))

(assert (= start!64560 b!289644))

(declare-fun m!422761 () Bool)

(assert (=> b!289644 m!422761))

(declare-fun m!422763 () Bool)

(assert (=> start!64560 m!422763))

(declare-fun m!422765 () Bool)

(assert (=> start!64560 m!422765))

(declare-fun m!422767 () Bool)

(assert (=> b!289645 m!422767))

(declare-fun m!422769 () Bool)

(assert (=> b!289645 m!422769))

(declare-fun m!422771 () Bool)

(assert (=> b!289645 m!422771))

(declare-fun m!422773 () Bool)

(assert (=> b!289645 m!422773))

(declare-fun m!422775 () Bool)

(assert (=> b!289645 m!422775))

(declare-fun m!422777 () Bool)

(assert (=> b!289645 m!422777))

(declare-fun m!422779 () Bool)

(assert (=> b!289645 m!422779))

(declare-fun m!422781 () Bool)

(assert (=> b!289645 m!422781))

(declare-fun m!422783 () Bool)

(assert (=> b!289645 m!422783))

(declare-fun m!422785 () Bool)

(assert (=> b!289645 m!422785))

(declare-fun m!422787 () Bool)

(assert (=> b!289645 m!422787))

(declare-fun m!422789 () Bool)

(assert (=> b!289646 m!422789))

(check-sat (not b!289646) (not b!289645) (not b!289644) (not start!64560))
