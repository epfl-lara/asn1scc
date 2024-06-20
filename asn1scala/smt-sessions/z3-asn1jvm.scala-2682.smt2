; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65640 () Bool)

(assert start!65640)

(declare-fun res!243039 () Bool)

(declare-fun e!210347 () Bool)

(assert (=> start!65640 (=> (not res!243039) (not e!210347))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17623 0))(
  ( (array!17624 (arr!8672 (Array (_ BitVec 32) (_ BitVec 8))) (size!7637 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17623)

(assert (=> start!65640 (= res!243039 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7637 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65640 e!210347))

(declare-datatypes ((BitStream!13278 0))(
  ( (BitStream!13279 (buf!7700 array!17623) (currentByte!14191 (_ BitVec 32)) (currentBit!14186 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13278)

(declare-fun e!210349 () Bool)

(declare-fun inv!12 (BitStream!13278) Bool)

(assert (=> start!65640 (and (inv!12 thiss!1728) e!210349)))

(assert (=> start!65640 true))

(declare-fun array_inv!7249 (array!17623) Bool)

(assert (=> start!65640 (array_inv!7249 arr!273)))

(declare-fun b!294329 () Bool)

(declare-fun res!243040 () Bool)

(assert (=> b!294329 (=> (not res!243040) (not e!210347))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294329 (= res!243040 (validate_offset_bits!1 ((_ sign_extend 32) (size!7637 (buf!7700 thiss!1728))) ((_ sign_extend 32) (currentByte!14191 thiss!1728)) ((_ sign_extend 32) (currentBit!14186 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!294330 () Bool)

(declare-fun res!243041 () Bool)

(assert (=> b!294330 (=> (not res!243041) (not e!210347))))

(assert (=> b!294330 (= res!243041 (bvslt from!505 to!474))))

(declare-fun b!294331 () Bool)

(assert (=> b!294331 (= e!210347 (not true))))

(declare-fun lt!427410 () array!17623)

(declare-fun arrayBitRangesEq!0 (array!17623 array!17623 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294331 (arrayBitRangesEq!0 arr!273 lt!427410 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((Unit!20499 0))(
  ( (Unit!20500) )
))
(declare-fun lt!427411 () Unit!20499)

(declare-datatypes ((tuple2!23148 0))(
  ( (tuple2!23149 (_1!12904 Bool) (_2!12904 BitStream!13278)) )
))
(declare-fun lt!427413 () tuple2!23148)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17623 (_ BitVec 64) Bool) Unit!20499)

(assert (=> b!294331 (= lt!427411 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12904 lt!427413)))))

(declare-fun e!210348 () Bool)

(assert (=> b!294331 e!210348))

(declare-fun res!243038 () Bool)

(assert (=> b!294331 (=> (not res!243038) (not e!210348))))

(declare-datatypes ((tuple3!1790 0))(
  ( (tuple3!1791 (_1!12905 Unit!20499) (_2!12905 BitStream!13278) (_3!1330 array!17623)) )
))
(declare-fun lt!427409 () tuple3!1790)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!294331 (= res!243038 (= (bvsub (bvadd (bitIndex!0 (size!7637 (buf!7700 thiss!1728)) (currentByte!14191 thiss!1728) (currentBit!14186 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7637 (buf!7700 (_2!12905 lt!427409))) (currentByte!14191 (_2!12905 lt!427409)) (currentBit!14186 (_2!12905 lt!427409)))))))

(declare-fun readBitsLoop!0 (BitStream!13278 (_ BitVec 64) array!17623 (_ BitVec 64) (_ BitVec 64)) tuple3!1790)

(assert (=> b!294331 (= lt!427409 (readBitsLoop!0 (_2!12904 lt!427413) nBits!523 lt!427410 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!294331 (validate_offset_bits!1 ((_ sign_extend 32) (size!7637 (buf!7700 (_2!12904 lt!427413)))) ((_ sign_extend 32) (currentByte!14191 (_2!12904 lt!427413))) ((_ sign_extend 32) (currentBit!14186 (_2!12904 lt!427413))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!427408 () Unit!20499)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13278 BitStream!13278 (_ BitVec 64) (_ BitVec 64)) Unit!20499)

(assert (=> b!294331 (= lt!427408 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12904 lt!427413) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!427412 () (_ BitVec 32))

(declare-fun lt!427407 () (_ BitVec 32))

(assert (=> b!294331 (= lt!427410 (array!17624 (store (arr!8672 arr!273) lt!427407 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8672 arr!273) lt!427407)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427412)))) ((_ sign_extend 24) (ite (_1!12904 lt!427413) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427412) #b00000000))))) (size!7637 arr!273)))))

(assert (=> b!294331 (= lt!427412 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294331 (= lt!427407 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13278) tuple2!23148)

(assert (=> b!294331 (= lt!427413 (readBit!0 thiss!1728))))

(declare-fun b!294332 () Bool)

(assert (=> b!294332 (= e!210348 (and (= (buf!7700 thiss!1728) (buf!7700 (_2!12905 lt!427409))) (= (size!7637 arr!273) (size!7637 (_3!1330 lt!427409)))))))

(declare-fun b!294333 () Bool)

(assert (=> b!294333 (= e!210349 (array_inv!7249 (buf!7700 thiss!1728)))))

(assert (= (and start!65640 res!243039) b!294329))

(assert (= (and b!294329 res!243040) b!294330))

(assert (= (and b!294330 res!243041) b!294331))

(assert (= (and b!294331 res!243038) b!294332))

(assert (= start!65640 b!294333))

(declare-fun m!430555 () Bool)

(assert (=> start!65640 m!430555))

(declare-fun m!430557 () Bool)

(assert (=> start!65640 m!430557))

(declare-fun m!430559 () Bool)

(assert (=> b!294329 m!430559))

(declare-fun m!430561 () Bool)

(assert (=> b!294331 m!430561))

(declare-fun m!430563 () Bool)

(assert (=> b!294331 m!430563))

(declare-fun m!430565 () Bool)

(assert (=> b!294331 m!430565))

(declare-fun m!430567 () Bool)

(assert (=> b!294331 m!430567))

(declare-fun m!430569 () Bool)

(assert (=> b!294331 m!430569))

(declare-fun m!430571 () Bool)

(assert (=> b!294331 m!430571))

(declare-fun m!430573 () Bool)

(assert (=> b!294331 m!430573))

(declare-fun m!430575 () Bool)

(assert (=> b!294331 m!430575))

(declare-fun m!430577 () Bool)

(assert (=> b!294331 m!430577))

(declare-fun m!430579 () Bool)

(assert (=> b!294331 m!430579))

(declare-fun m!430581 () Bool)

(assert (=> b!294331 m!430581))

(declare-fun m!430583 () Bool)

(assert (=> b!294333 m!430583))

(check-sat (not b!294331) (not b!294333) (not b!294329) (not start!65640))
