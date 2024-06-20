; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65720 () Bool)

(assert start!65720)

(declare-fun b!294761 () Bool)

(declare-fun e!210721 () Bool)

(declare-fun from!505 () (_ BitVec 64))

(assert (=> b!294761 (= e!210721 (not (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))))

(declare-datatypes ((array!17652 0))(
  ( (array!17653 (arr!8688 (Array (_ BitVec 32) (_ BitVec 8))) (size!7650 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17652)

(declare-datatypes ((BitStream!13304 0))(
  ( (BitStream!13305 (buf!7713 array!17652) (currentByte!14210 (_ BitVec 32)) (currentBit!14205 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!20537 0))(
  ( (Unit!20538) )
))
(declare-datatypes ((tuple3!1816 0))(
  ( (tuple3!1817 (_1!12939 Unit!20537) (_2!12939 BitStream!13304) (_3!1346 array!17652)) )
))
(declare-fun lt!428262 () tuple3!1816)

(declare-fun arrayBitRangesEq!0 (array!17652 array!17652 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294761 (arrayBitRangesEq!0 arr!273 (_3!1346 lt!428262) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!428259 () Unit!20537)

(declare-fun lt!428258 () array!17652)

(declare-fun arrayBitRangesEqTransitive!0 (array!17652 array!17652 array!17652 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20537)

(assert (=> b!294761 (= lt!428259 (arrayBitRangesEqTransitive!0 arr!273 lt!428258 (_3!1346 lt!428262) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!294761 (arrayBitRangesEq!0 arr!273 lt!428258 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!428255 () Unit!20537)

(declare-datatypes ((tuple2!23186 0))(
  ( (tuple2!23187 (_1!12940 Bool) (_2!12940 BitStream!13304)) )
))
(declare-fun lt!428261 () tuple2!23186)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17652 (_ BitVec 64) Bool) Unit!20537)

(assert (=> b!294761 (= lt!428255 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12940 lt!428261)))))

(declare-fun e!210720 () Bool)

(assert (=> b!294761 e!210720))

(declare-fun res!243388 () Bool)

(assert (=> b!294761 (=> (not res!243388) (not e!210720))))

(declare-fun thiss!1728 () BitStream!13304)

(declare-fun to!474 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!294761 (= res!243388 (= (bvsub (bvadd (bitIndex!0 (size!7650 (buf!7713 thiss!1728)) (currentByte!14210 thiss!1728) (currentBit!14205 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7650 (buf!7713 (_2!12939 lt!428262))) (currentByte!14210 (_2!12939 lt!428262)) (currentBit!14205 (_2!12939 lt!428262)))))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!13304 (_ BitVec 64) array!17652 (_ BitVec 64) (_ BitVec 64)) tuple3!1816)

(assert (=> b!294761 (= lt!428262 (readBitsLoop!0 (_2!12940 lt!428261) nBits!523 lt!428258 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294761 (validate_offset_bits!1 ((_ sign_extend 32) (size!7650 (buf!7713 (_2!12940 lt!428261)))) ((_ sign_extend 32) (currentByte!14210 (_2!12940 lt!428261))) ((_ sign_extend 32) (currentBit!14205 (_2!12940 lt!428261))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!428257 () Unit!20537)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13304 BitStream!13304 (_ BitVec 64) (_ BitVec 64)) Unit!20537)

(assert (=> b!294761 (= lt!428257 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12940 lt!428261) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!428256 () (_ BitVec 32))

(declare-fun lt!428260 () (_ BitVec 32))

(assert (=> b!294761 (= lt!428258 (array!17653 (store (arr!8688 arr!273) lt!428256 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8688 arr!273) lt!428256)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428260)))) ((_ sign_extend 24) (ite (_1!12940 lt!428261) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428260) #b00000000))))) (size!7650 arr!273)))))

(assert (=> b!294761 (= lt!428260 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294761 (= lt!428256 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13304) tuple2!23186)

(assert (=> b!294761 (= lt!428261 (readBit!0 thiss!1728))))

(declare-fun b!294762 () Bool)

(declare-fun res!243387 () Bool)

(assert (=> b!294762 (=> (not res!243387) (not e!210721))))

(assert (=> b!294762 (= res!243387 (validate_offset_bits!1 ((_ sign_extend 32) (size!7650 (buf!7713 thiss!1728))) ((_ sign_extend 32) (currentByte!14210 thiss!1728)) ((_ sign_extend 32) (currentBit!14205 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!294763 () Bool)

(declare-fun res!243389 () Bool)

(assert (=> b!294763 (=> (not res!243389) (not e!210721))))

(assert (=> b!294763 (= res!243389 (bvslt from!505 to!474))))

(declare-fun b!294764 () Bool)

(declare-fun e!210719 () Bool)

(declare-fun array_inv!7262 (array!17652) Bool)

(assert (=> b!294764 (= e!210719 (array_inv!7262 (buf!7713 thiss!1728)))))

(declare-fun res!243386 () Bool)

(assert (=> start!65720 (=> (not res!243386) (not e!210721))))

(assert (=> start!65720 (= res!243386 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7650 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65720 e!210721))

(declare-fun inv!12 (BitStream!13304) Bool)

(assert (=> start!65720 (and (inv!12 thiss!1728) e!210719)))

(assert (=> start!65720 true))

(assert (=> start!65720 (array_inv!7262 arr!273)))

(declare-fun b!294765 () Bool)

(assert (=> b!294765 (= e!210720 (and (= (buf!7713 thiss!1728) (buf!7713 (_2!12939 lt!428262))) (= (size!7650 arr!273) (size!7650 (_3!1346 lt!428262)))))))

(assert (= (and start!65720 res!243386) b!294762))

(assert (= (and b!294762 res!243387) b!294763))

(assert (= (and b!294763 res!243389) b!294761))

(assert (= (and b!294761 res!243388) b!294765))

(assert (= start!65720 b!294764))

(declare-fun m!431349 () Bool)

(assert (=> b!294761 m!431349))

(declare-fun m!431351 () Bool)

(assert (=> b!294761 m!431351))

(declare-fun m!431353 () Bool)

(assert (=> b!294761 m!431353))

(declare-fun m!431355 () Bool)

(assert (=> b!294761 m!431355))

(declare-fun m!431357 () Bool)

(assert (=> b!294761 m!431357))

(declare-fun m!431359 () Bool)

(assert (=> b!294761 m!431359))

(declare-fun m!431361 () Bool)

(assert (=> b!294761 m!431361))

(declare-fun m!431363 () Bool)

(assert (=> b!294761 m!431363))

(declare-fun m!431365 () Bool)

(assert (=> b!294761 m!431365))

(declare-fun m!431367 () Bool)

(assert (=> b!294761 m!431367))

(declare-fun m!431369 () Bool)

(assert (=> b!294761 m!431369))

(declare-fun m!431371 () Bool)

(assert (=> b!294761 m!431371))

(declare-fun m!431373 () Bool)

(assert (=> b!294761 m!431373))

(declare-fun m!431375 () Bool)

(assert (=> b!294762 m!431375))

(declare-fun m!431377 () Bool)

(assert (=> b!294764 m!431377))

(declare-fun m!431379 () Bool)

(assert (=> start!65720 m!431379))

(declare-fun m!431381 () Bool)

(assert (=> start!65720 m!431381))

(push 1)

(assert (not b!294761))

(assert (not b!294762))

(assert (not start!65720))

(assert (not b!294764))

(check-sat)

(pop 1)

(push 1)

(check-sat)

