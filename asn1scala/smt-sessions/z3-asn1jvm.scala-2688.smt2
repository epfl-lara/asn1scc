; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65730 () Bool)

(assert start!65730)

(declare-fun b!294836 () Bool)

(declare-fun e!210797 () Bool)

(declare-datatypes ((array!17662 0))(
  ( (array!17663 (arr!8693 (Array (_ BitVec 32) (_ BitVec 8))) (size!7655 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13314 0))(
  ( (BitStream!13315 (buf!7718 array!17662) (currentByte!14215 (_ BitVec 32)) (currentBit!14210 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13314)

(declare-fun array_inv!7267 (array!17662) Bool)

(assert (=> b!294836 (= e!210797 (array_inv!7267 (buf!7718 thiss!1728)))))

(declare-fun res!243449 () Bool)

(declare-fun e!210796 () Bool)

(assert (=> start!65730 (=> (not res!243449) (not e!210796))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun arr!273 () array!17662)

(declare-fun to!474 () (_ BitVec 64))

(assert (=> start!65730 (= res!243449 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7655 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65730 e!210796))

(declare-fun inv!12 (BitStream!13314) Bool)

(assert (=> start!65730 (and (inv!12 thiss!1728) e!210797)))

(assert (=> start!65730 true))

(assert (=> start!65730 (array_inv!7267 arr!273)))

(declare-fun b!294837 () Bool)

(assert (=> b!294837 (= e!210796 (not (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bvsle (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7655 arr!273)))))))))

(declare-datatypes ((Unit!20547 0))(
  ( (Unit!20548) )
))
(declare-datatypes ((tuple3!1826 0))(
  ( (tuple3!1827 (_1!12949 Unit!20547) (_2!12949 BitStream!13314) (_3!1351 array!17662)) )
))
(declare-fun lt!428380 () tuple3!1826)

(declare-fun arrayBitRangesEq!0 (array!17662 array!17662 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294837 (arrayBitRangesEq!0 arr!273 (_3!1351 lt!428380) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!428375 () Unit!20547)

(declare-fun lt!428378 () array!17662)

(declare-fun arrayBitRangesEqTransitive!0 (array!17662 array!17662 array!17662 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20547)

(assert (=> b!294837 (= lt!428375 (arrayBitRangesEqTransitive!0 arr!273 lt!428378 (_3!1351 lt!428380) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!294837 (arrayBitRangesEq!0 arr!273 lt!428378 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((tuple2!23196 0))(
  ( (tuple2!23197 (_1!12950 Bool) (_2!12950 BitStream!13314)) )
))
(declare-fun lt!428379 () tuple2!23196)

(declare-fun lt!428381 () Unit!20547)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17662 (_ BitVec 64) Bool) Unit!20547)

(assert (=> b!294837 (= lt!428381 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12950 lt!428379)))))

(declare-fun e!210795 () Bool)

(assert (=> b!294837 e!210795))

(declare-fun res!243446 () Bool)

(assert (=> b!294837 (=> (not res!243446) (not e!210795))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!294837 (= res!243446 (= (bvsub (bvadd (bitIndex!0 (size!7655 (buf!7718 thiss!1728)) (currentByte!14215 thiss!1728) (currentBit!14210 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7655 (buf!7718 (_2!12949 lt!428380))) (currentByte!14215 (_2!12949 lt!428380)) (currentBit!14210 (_2!12949 lt!428380)))))))

(declare-fun readBitsLoop!0 (BitStream!13314 (_ BitVec 64) array!17662 (_ BitVec 64) (_ BitVec 64)) tuple3!1826)

(assert (=> b!294837 (= lt!428380 (readBitsLoop!0 (_2!12950 lt!428379) nBits!523 lt!428378 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294837 (validate_offset_bits!1 ((_ sign_extend 32) (size!7655 (buf!7718 (_2!12950 lt!428379)))) ((_ sign_extend 32) (currentByte!14215 (_2!12950 lt!428379))) ((_ sign_extend 32) (currentBit!14210 (_2!12950 lt!428379))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!428377 () Unit!20547)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13314 BitStream!13314 (_ BitVec 64) (_ BitVec 64)) Unit!20547)

(assert (=> b!294837 (= lt!428377 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12950 lt!428379) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!428382 () (_ BitVec 32))

(declare-fun lt!428376 () (_ BitVec 32))

(assert (=> b!294837 (= lt!428378 (array!17663 (store (arr!8693 arr!273) lt!428376 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8693 arr!273) lt!428376)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428382)))) ((_ sign_extend 24) (ite (_1!12950 lt!428379) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428382) #b00000000))))) (size!7655 arr!273)))))

(assert (=> b!294837 (= lt!428382 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294837 (= lt!428376 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13314) tuple2!23196)

(assert (=> b!294837 (= lt!428379 (readBit!0 thiss!1728))))

(declare-fun b!294838 () Bool)

(assert (=> b!294838 (= e!210795 (and (= (buf!7718 thiss!1728) (buf!7718 (_2!12949 lt!428380))) (= (size!7655 arr!273) (size!7655 (_3!1351 lt!428380)))))))

(declare-fun b!294839 () Bool)

(declare-fun res!243447 () Bool)

(assert (=> b!294839 (=> (not res!243447) (not e!210796))))

(assert (=> b!294839 (= res!243447 (validate_offset_bits!1 ((_ sign_extend 32) (size!7655 (buf!7718 thiss!1728))) ((_ sign_extend 32) (currentByte!14215 thiss!1728)) ((_ sign_extend 32) (currentBit!14210 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!294840 () Bool)

(declare-fun res!243448 () Bool)

(assert (=> b!294840 (=> (not res!243448) (not e!210796))))

(assert (=> b!294840 (= res!243448 (bvslt from!505 to!474))))

(assert (= (and start!65730 res!243449) b!294839))

(assert (= (and b!294839 res!243447) b!294840))

(assert (= (and b!294840 res!243448) b!294837))

(assert (= (and b!294837 res!243446) b!294838))

(assert (= start!65730 b!294836))

(declare-fun m!431519 () Bool)

(assert (=> b!294836 m!431519))

(declare-fun m!431521 () Bool)

(assert (=> start!65730 m!431521))

(declare-fun m!431523 () Bool)

(assert (=> start!65730 m!431523))

(declare-fun m!431525 () Bool)

(assert (=> b!294837 m!431525))

(declare-fun m!431527 () Bool)

(assert (=> b!294837 m!431527))

(declare-fun m!431529 () Bool)

(assert (=> b!294837 m!431529))

(declare-fun m!431531 () Bool)

(assert (=> b!294837 m!431531))

(declare-fun m!431533 () Bool)

(assert (=> b!294837 m!431533))

(declare-fun m!431535 () Bool)

(assert (=> b!294837 m!431535))

(declare-fun m!431537 () Bool)

(assert (=> b!294837 m!431537))

(declare-fun m!431539 () Bool)

(assert (=> b!294837 m!431539))

(declare-fun m!431541 () Bool)

(assert (=> b!294837 m!431541))

(declare-fun m!431543 () Bool)

(assert (=> b!294837 m!431543))

(declare-fun m!431545 () Bool)

(assert (=> b!294837 m!431545))

(declare-fun m!431547 () Bool)

(assert (=> b!294837 m!431547))

(declare-fun m!431549 () Bool)

(assert (=> b!294837 m!431549))

(declare-fun m!431551 () Bool)

(assert (=> b!294839 m!431551))

(check-sat (not b!294836) (not b!294839) (not start!65730) (not b!294837))
(check-sat)
