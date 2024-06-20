; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65630 () Bool)

(assert start!65630)

(declare-fun b!294254 () Bool)

(declare-fun res!242979 () Bool)

(declare-fun e!210274 () Bool)

(assert (=> b!294254 (=> (not res!242979) (not e!210274))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17613 0))(
  ( (array!17614 (arr!8667 (Array (_ BitVec 32) (_ BitVec 8))) (size!7632 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13268 0))(
  ( (BitStream!13269 (buf!7695 array!17613) (currentByte!14186 (_ BitVec 32)) (currentBit!14181 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13268)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294254 (= res!242979 (validate_offset_bits!1 ((_ sign_extend 32) (size!7632 (buf!7695 thiss!1728))) ((_ sign_extend 32) (currentByte!14186 thiss!1728)) ((_ sign_extend 32) (currentBit!14181 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!242981 () Bool)

(assert (=> start!65630 (=> (not res!242981) (not e!210274))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun arr!273 () array!17613)

(assert (=> start!65630 (= res!242981 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7632 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65630 e!210274))

(declare-fun e!210276 () Bool)

(declare-fun inv!12 (BitStream!13268) Bool)

(assert (=> start!65630 (and (inv!12 thiss!1728) e!210276)))

(assert (=> start!65630 true))

(declare-fun array_inv!7244 (array!17613) Bool)

(assert (=> start!65630 (array_inv!7244 arr!273)))

(declare-fun b!294255 () Bool)

(declare-fun e!210275 () Bool)

(declare-datatypes ((Unit!20489 0))(
  ( (Unit!20490) )
))
(declare-datatypes ((tuple3!1780 0))(
  ( (tuple3!1781 (_1!12894 Unit!20489) (_2!12894 BitStream!13268) (_3!1325 array!17613)) )
))
(declare-fun lt!427305 () tuple3!1780)

(assert (=> b!294255 (= e!210275 (and (= (buf!7695 thiss!1728) (buf!7695 (_2!12894 lt!427305))) (= (size!7632 arr!273) (size!7632 (_3!1325 lt!427305)))))))

(declare-fun b!294256 () Bool)

(assert (=> b!294256 (= e!210276 (array_inv!7244 (buf!7695 thiss!1728)))))

(declare-fun b!294257 () Bool)

(declare-fun res!242978 () Bool)

(assert (=> b!294257 (=> (not res!242978) (not e!210274))))

(assert (=> b!294257 (= res!242978 (bvslt from!505 to!474))))

(declare-fun b!294258 () Bool)

(assert (=> b!294258 (= e!210274 (not true))))

(declare-fun lt!427306 () array!17613)

(declare-fun arrayBitRangesEq!0 (array!17613 array!17613 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294258 (arrayBitRangesEq!0 arr!273 lt!427306 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!427304 () Unit!20489)

(declare-datatypes ((tuple2!23138 0))(
  ( (tuple2!23139 (_1!12895 Bool) (_2!12895 BitStream!13268)) )
))
(declare-fun lt!427303 () tuple2!23138)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17613 (_ BitVec 64) Bool) Unit!20489)

(assert (=> b!294258 (= lt!427304 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12895 lt!427303)))))

(assert (=> b!294258 e!210275))

(declare-fun res!242980 () Bool)

(assert (=> b!294258 (=> (not res!242980) (not e!210275))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!294258 (= res!242980 (= (bvsub (bvadd (bitIndex!0 (size!7632 (buf!7695 thiss!1728)) (currentByte!14186 thiss!1728) (currentBit!14181 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7632 (buf!7695 (_2!12894 lt!427305))) (currentByte!14186 (_2!12894 lt!427305)) (currentBit!14181 (_2!12894 lt!427305)))))))

(declare-fun readBitsLoop!0 (BitStream!13268 (_ BitVec 64) array!17613 (_ BitVec 64) (_ BitVec 64)) tuple3!1780)

(assert (=> b!294258 (= lt!427305 (readBitsLoop!0 (_2!12895 lt!427303) nBits!523 lt!427306 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!294258 (validate_offset_bits!1 ((_ sign_extend 32) (size!7632 (buf!7695 (_2!12895 lt!427303)))) ((_ sign_extend 32) (currentByte!14186 (_2!12895 lt!427303))) ((_ sign_extend 32) (currentBit!14181 (_2!12895 lt!427303))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!427308 () Unit!20489)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13268 BitStream!13268 (_ BitVec 64) (_ BitVec 64)) Unit!20489)

(assert (=> b!294258 (= lt!427308 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12895 lt!427303) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!427307 () (_ BitVec 32))

(declare-fun lt!427302 () (_ BitVec 32))

(assert (=> b!294258 (= lt!427306 (array!17614 (store (arr!8667 arr!273) lt!427307 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8667 arr!273) lt!427307)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427302)))) ((_ sign_extend 24) (ite (_1!12895 lt!427303) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427302) #b00000000))))) (size!7632 arr!273)))))

(assert (=> b!294258 (= lt!427302 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294258 (= lt!427307 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13268) tuple2!23138)

(assert (=> b!294258 (= lt!427303 (readBit!0 thiss!1728))))

(assert (= (and start!65630 res!242981) b!294254))

(assert (= (and b!294254 res!242979) b!294257))

(assert (= (and b!294257 res!242978) b!294258))

(assert (= (and b!294258 res!242980) b!294255))

(assert (= start!65630 b!294256))

(declare-fun m!430405 () Bool)

(assert (=> b!294254 m!430405))

(declare-fun m!430407 () Bool)

(assert (=> start!65630 m!430407))

(declare-fun m!430409 () Bool)

(assert (=> start!65630 m!430409))

(declare-fun m!430411 () Bool)

(assert (=> b!294256 m!430411))

(declare-fun m!430413 () Bool)

(assert (=> b!294258 m!430413))

(declare-fun m!430415 () Bool)

(assert (=> b!294258 m!430415))

(declare-fun m!430417 () Bool)

(assert (=> b!294258 m!430417))

(declare-fun m!430419 () Bool)

(assert (=> b!294258 m!430419))

(declare-fun m!430421 () Bool)

(assert (=> b!294258 m!430421))

(declare-fun m!430423 () Bool)

(assert (=> b!294258 m!430423))

(declare-fun m!430425 () Bool)

(assert (=> b!294258 m!430425))

(declare-fun m!430427 () Bool)

(assert (=> b!294258 m!430427))

(declare-fun m!430429 () Bool)

(assert (=> b!294258 m!430429))

(declare-fun m!430431 () Bool)

(assert (=> b!294258 m!430431))

(declare-fun m!430433 () Bool)

(assert (=> b!294258 m!430433))

(push 1)

(assert (not b!294258))

(assert (not b!294256))

(assert (not start!65630))

(assert (not b!294254))

(check-sat)

(pop 1)

