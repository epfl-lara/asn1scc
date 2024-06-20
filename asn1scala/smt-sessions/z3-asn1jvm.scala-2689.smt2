; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65736 () Bool)

(assert start!65736)

(declare-fun b!294881 () Bool)

(declare-fun e!210842 () Bool)

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17668 0))(
  ( (array!17669 (arr!8696 (Array (_ BitVec 32) (_ BitVec 8))) (size!7658 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17668)

(assert (=> b!294881 (= e!210842 (not (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bvsgt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7658 arr!273)))) (bvslt from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))))

(declare-datatypes ((BitStream!13320 0))(
  ( (BitStream!13321 (buf!7721 array!17668) (currentByte!14218 (_ BitVec 32)) (currentBit!14213 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!20553 0))(
  ( (Unit!20554) )
))
(declare-datatypes ((tuple3!1832 0))(
  ( (tuple3!1833 (_1!12955 Unit!20553) (_2!12955 BitStream!13320) (_3!1354 array!17668)) )
))
(declare-fun lt!428450 () tuple3!1832)

(declare-fun arrayBitRangesEq!0 (array!17668 array!17668 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294881 (arrayBitRangesEq!0 arr!273 (_3!1354 lt!428450) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!428454 () array!17668)

(declare-fun lt!428447 () Unit!20553)

(declare-fun arrayBitRangesEqTransitive!0 (array!17668 array!17668 array!17668 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20553)

(assert (=> b!294881 (= lt!428447 (arrayBitRangesEqTransitive!0 arr!273 lt!428454 (_3!1354 lt!428450) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!294881 (arrayBitRangesEq!0 arr!273 lt!428454 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((tuple2!23202 0))(
  ( (tuple2!23203 (_1!12956 Bool) (_2!12956 BitStream!13320)) )
))
(declare-fun lt!428453 () tuple2!23202)

(declare-fun lt!428448 () Unit!20553)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17668 (_ BitVec 64) Bool) Unit!20553)

(assert (=> b!294881 (= lt!428448 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12956 lt!428453)))))

(declare-fun e!210843 () Bool)

(assert (=> b!294881 e!210843))

(declare-fun res!243484 () Bool)

(assert (=> b!294881 (=> (not res!243484) (not e!210843))))

(declare-fun thiss!1728 () BitStream!13320)

(declare-fun to!474 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!294881 (= res!243484 (= (bvsub (bvadd (bitIndex!0 (size!7658 (buf!7721 thiss!1728)) (currentByte!14218 thiss!1728) (currentBit!14213 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7658 (buf!7721 (_2!12955 lt!428450))) (currentByte!14218 (_2!12955 lt!428450)) (currentBit!14213 (_2!12955 lt!428450)))))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!13320 (_ BitVec 64) array!17668 (_ BitVec 64) (_ BitVec 64)) tuple3!1832)

(assert (=> b!294881 (= lt!428450 (readBitsLoop!0 (_2!12956 lt!428453) nBits!523 lt!428454 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294881 (validate_offset_bits!1 ((_ sign_extend 32) (size!7658 (buf!7721 (_2!12956 lt!428453)))) ((_ sign_extend 32) (currentByte!14218 (_2!12956 lt!428453))) ((_ sign_extend 32) (currentBit!14213 (_2!12956 lt!428453))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!428452 () Unit!20553)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13320 BitStream!13320 (_ BitVec 64) (_ BitVec 64)) Unit!20553)

(assert (=> b!294881 (= lt!428452 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12956 lt!428453) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!428449 () (_ BitVec 32))

(declare-fun lt!428451 () (_ BitVec 32))

(assert (=> b!294881 (= lt!428454 (array!17669 (store (arr!8696 arr!273) lt!428451 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8696 arr!273) lt!428451)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428449)))) ((_ sign_extend 24) (ite (_1!12956 lt!428453) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428449) #b00000000))))) (size!7658 arr!273)))))

(assert (=> b!294881 (= lt!428449 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294881 (= lt!428451 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13320) tuple2!23202)

(assert (=> b!294881 (= lt!428453 (readBit!0 thiss!1728))))

(declare-fun res!243482 () Bool)

(assert (=> start!65736 (=> (not res!243482) (not e!210842))))

(assert (=> start!65736 (= res!243482 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7658 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65736 e!210842))

(declare-fun e!210840 () Bool)

(declare-fun inv!12 (BitStream!13320) Bool)

(assert (=> start!65736 (and (inv!12 thiss!1728) e!210840)))

(assert (=> start!65736 true))

(declare-fun array_inv!7270 (array!17668) Bool)

(assert (=> start!65736 (array_inv!7270 arr!273)))

(declare-fun b!294882 () Bool)

(assert (=> b!294882 (= e!210843 (and (= (buf!7721 thiss!1728) (buf!7721 (_2!12955 lt!428450))) (= (size!7658 arr!273) (size!7658 (_3!1354 lt!428450)))))))

(declare-fun b!294883 () Bool)

(declare-fun res!243485 () Bool)

(assert (=> b!294883 (=> (not res!243485) (not e!210842))))

(assert (=> b!294883 (= res!243485 (bvslt from!505 to!474))))

(declare-fun b!294884 () Bool)

(declare-fun res!243483 () Bool)

(assert (=> b!294884 (=> (not res!243483) (not e!210842))))

(assert (=> b!294884 (= res!243483 (validate_offset_bits!1 ((_ sign_extend 32) (size!7658 (buf!7721 thiss!1728))) ((_ sign_extend 32) (currentByte!14218 thiss!1728)) ((_ sign_extend 32) (currentBit!14213 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!294885 () Bool)

(assert (=> b!294885 (= e!210840 (array_inv!7270 (buf!7721 thiss!1728)))))

(assert (= (and start!65736 res!243482) b!294884))

(assert (= (and b!294884 res!243483) b!294883))

(assert (= (and b!294883 res!243485) b!294881))

(assert (= (and b!294881 res!243484) b!294882))

(assert (= start!65736 b!294885))

(declare-fun m!431621 () Bool)

(assert (=> b!294881 m!431621))

(declare-fun m!431623 () Bool)

(assert (=> b!294881 m!431623))

(declare-fun m!431625 () Bool)

(assert (=> b!294881 m!431625))

(declare-fun m!431627 () Bool)

(assert (=> b!294881 m!431627))

(declare-fun m!431629 () Bool)

(assert (=> b!294881 m!431629))

(declare-fun m!431631 () Bool)

(assert (=> b!294881 m!431631))

(declare-fun m!431633 () Bool)

(assert (=> b!294881 m!431633))

(declare-fun m!431635 () Bool)

(assert (=> b!294881 m!431635))

(declare-fun m!431637 () Bool)

(assert (=> b!294881 m!431637))

(declare-fun m!431639 () Bool)

(assert (=> b!294881 m!431639))

(declare-fun m!431641 () Bool)

(assert (=> b!294881 m!431641))

(declare-fun m!431643 () Bool)

(assert (=> b!294881 m!431643))

(declare-fun m!431645 () Bool)

(assert (=> b!294881 m!431645))

(declare-fun m!431647 () Bool)

(assert (=> start!65736 m!431647))

(declare-fun m!431649 () Bool)

(assert (=> start!65736 m!431649))

(declare-fun m!431651 () Bool)

(assert (=> b!294884 m!431651))

(declare-fun m!431653 () Bool)

(assert (=> b!294885 m!431653))

(check-sat (not b!294885) (not b!294884) (not start!65736) (not b!294881))
(check-sat)
