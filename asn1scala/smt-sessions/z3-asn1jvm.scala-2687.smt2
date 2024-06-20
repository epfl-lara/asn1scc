; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65724 () Bool)

(assert start!65724)

(declare-datatypes ((array!17656 0))(
  ( (array!17657 (arr!8690 (Array (_ BitVec 32) (_ BitVec 8))) (size!7652 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13308 0))(
  ( (BitStream!13309 (buf!7715 array!17656) (currentByte!14212 (_ BitVec 32)) (currentBit!14207 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13308)

(declare-datatypes ((Unit!20541 0))(
  ( (Unit!20542) )
))
(declare-datatypes ((tuple3!1820 0))(
  ( (tuple3!1821 (_1!12943 Unit!20541) (_2!12943 BitStream!13308) (_3!1348 array!17656)) )
))
(declare-fun lt!428303 () tuple3!1820)

(declare-fun b!294791 () Bool)

(declare-fun e!210752 () Bool)

(declare-fun arr!273 () array!17656)

(assert (=> b!294791 (= e!210752 (and (= (buf!7715 thiss!1728) (buf!7715 (_2!12943 lt!428303))) (= (size!7652 arr!273) (size!7652 (_3!1348 lt!428303)))))))

(declare-fun b!294792 () Bool)

(declare-fun e!210750 () Bool)

(assert (=> b!294792 (= e!210750 (not true))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!17656 array!17656 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294792 (arrayBitRangesEq!0 arr!273 (_3!1348 lt!428303) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!428305 () Unit!20541)

(declare-fun lt!428308 () array!17656)

(declare-fun arrayBitRangesEqTransitive!0 (array!17656 array!17656 array!17656 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20541)

(assert (=> b!294792 (= lt!428305 (arrayBitRangesEqTransitive!0 arr!273 lt!428308 (_3!1348 lt!428303) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!294792 (arrayBitRangesEq!0 arr!273 lt!428308 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!428307 () Unit!20541)

(declare-datatypes ((tuple2!23190 0))(
  ( (tuple2!23191 (_1!12944 Bool) (_2!12944 BitStream!13308)) )
))
(declare-fun lt!428310 () tuple2!23190)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17656 (_ BitVec 64) Bool) Unit!20541)

(assert (=> b!294792 (= lt!428307 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12944 lt!428310)))))

(assert (=> b!294792 e!210752))

(declare-fun res!243411 () Bool)

(assert (=> b!294792 (=> (not res!243411) (not e!210752))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!294792 (= res!243411 (= (bvsub (bvadd (bitIndex!0 (size!7652 (buf!7715 thiss!1728)) (currentByte!14212 thiss!1728) (currentBit!14207 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7652 (buf!7715 (_2!12943 lt!428303))) (currentByte!14212 (_2!12943 lt!428303)) (currentBit!14207 (_2!12943 lt!428303)))))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!13308 (_ BitVec 64) array!17656 (_ BitVec 64) (_ BitVec 64)) tuple3!1820)

(assert (=> b!294792 (= lt!428303 (readBitsLoop!0 (_2!12944 lt!428310) nBits!523 lt!428308 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294792 (validate_offset_bits!1 ((_ sign_extend 32) (size!7652 (buf!7715 (_2!12944 lt!428310)))) ((_ sign_extend 32) (currentByte!14212 (_2!12944 lt!428310))) ((_ sign_extend 32) (currentBit!14207 (_2!12944 lt!428310))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!428304 () Unit!20541)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13308 BitStream!13308 (_ BitVec 64) (_ BitVec 64)) Unit!20541)

(assert (=> b!294792 (= lt!428304 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12944 lt!428310) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!428306 () (_ BitVec 32))

(declare-fun lt!428309 () (_ BitVec 32))

(assert (=> b!294792 (= lt!428308 (array!17657 (store (arr!8690 arr!273) lt!428306 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8690 arr!273) lt!428306)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428309)))) ((_ sign_extend 24) (ite (_1!12944 lt!428310) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428309) #b00000000))))) (size!7652 arr!273)))))

(assert (=> b!294792 (= lt!428309 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294792 (= lt!428306 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13308) tuple2!23190)

(assert (=> b!294792 (= lt!428310 (readBit!0 thiss!1728))))

(declare-fun res!243412 () Bool)

(assert (=> start!65724 (=> (not res!243412) (not e!210750))))

(assert (=> start!65724 (= res!243412 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7652 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65724 e!210750))

(declare-fun e!210753 () Bool)

(declare-fun inv!12 (BitStream!13308) Bool)

(assert (=> start!65724 (and (inv!12 thiss!1728) e!210753)))

(assert (=> start!65724 true))

(declare-fun array_inv!7264 (array!17656) Bool)

(assert (=> start!65724 (array_inv!7264 arr!273)))

(declare-fun b!294793 () Bool)

(declare-fun res!243410 () Bool)

(assert (=> b!294793 (=> (not res!243410) (not e!210750))))

(assert (=> b!294793 (= res!243410 (validate_offset_bits!1 ((_ sign_extend 32) (size!7652 (buf!7715 thiss!1728))) ((_ sign_extend 32) (currentByte!14212 thiss!1728)) ((_ sign_extend 32) (currentBit!14207 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!294794 () Bool)

(assert (=> b!294794 (= e!210753 (array_inv!7264 (buf!7715 thiss!1728)))))

(declare-fun b!294795 () Bool)

(declare-fun res!243413 () Bool)

(assert (=> b!294795 (=> (not res!243413) (not e!210750))))

(assert (=> b!294795 (= res!243413 (bvslt from!505 to!474))))

(assert (= (and start!65724 res!243412) b!294793))

(assert (= (and b!294793 res!243410) b!294795))

(assert (= (and b!294795 res!243413) b!294792))

(assert (= (and b!294792 res!243411) b!294791))

(assert (= start!65724 b!294794))

(declare-fun m!431417 () Bool)

(assert (=> b!294792 m!431417))

(declare-fun m!431419 () Bool)

(assert (=> b!294792 m!431419))

(declare-fun m!431421 () Bool)

(assert (=> b!294792 m!431421))

(declare-fun m!431423 () Bool)

(assert (=> b!294792 m!431423))

(declare-fun m!431425 () Bool)

(assert (=> b!294792 m!431425))

(declare-fun m!431427 () Bool)

(assert (=> b!294792 m!431427))

(declare-fun m!431429 () Bool)

(assert (=> b!294792 m!431429))

(declare-fun m!431431 () Bool)

(assert (=> b!294792 m!431431))

(declare-fun m!431433 () Bool)

(assert (=> b!294792 m!431433))

(declare-fun m!431435 () Bool)

(assert (=> b!294792 m!431435))

(declare-fun m!431437 () Bool)

(assert (=> b!294792 m!431437))

(declare-fun m!431439 () Bool)

(assert (=> b!294792 m!431439))

(declare-fun m!431441 () Bool)

(assert (=> b!294792 m!431441))

(declare-fun m!431443 () Bool)

(assert (=> start!65724 m!431443))

(declare-fun m!431445 () Bool)

(assert (=> start!65724 m!431445))

(declare-fun m!431447 () Bool)

(assert (=> b!294793 m!431447))

(declare-fun m!431449 () Bool)

(assert (=> b!294794 m!431449))

(check-sat (not b!294793) (not start!65724) (not b!294792) (not b!294794))
