; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65626 () Bool)

(assert start!65626)

(declare-fun b!294224 () Bool)

(declare-fun res!242957 () Bool)

(declare-fun e!210245 () Bool)

(assert (=> b!294224 (=> (not res!242957) (not e!210245))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!294224 (= res!242957 (bvslt from!505 to!474))))

(declare-fun res!242955 () Bool)

(assert (=> start!65626 (=> (not res!242955) (not e!210245))))

(declare-datatypes ((array!17609 0))(
  ( (array!17610 (arr!8665 (Array (_ BitVec 32) (_ BitVec 8))) (size!7630 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17609)

(declare-fun nBits!523 () (_ BitVec 64))

(assert (=> start!65626 (= res!242955 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7630 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65626 e!210245))

(declare-datatypes ((BitStream!13264 0))(
  ( (BitStream!13265 (buf!7693 array!17609) (currentByte!14184 (_ BitVec 32)) (currentBit!14179 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13264)

(declare-fun e!210243 () Bool)

(declare-fun inv!12 (BitStream!13264) Bool)

(assert (=> start!65626 (and (inv!12 thiss!1728) e!210243)))

(assert (=> start!65626 true))

(declare-fun array_inv!7242 (array!17609) Bool)

(assert (=> start!65626 (array_inv!7242 arr!273)))

(declare-fun b!294225 () Bool)

(assert (=> b!294225 (= e!210245 (not true))))

(declare-fun lt!427266 () array!17609)

(declare-fun arrayBitRangesEq!0 (array!17609 array!17609 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294225 (arrayBitRangesEq!0 arr!273 lt!427266 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((tuple2!23134 0))(
  ( (tuple2!23135 (_1!12890 Bool) (_2!12890 BitStream!13264)) )
))
(declare-fun lt!427261 () tuple2!23134)

(declare-datatypes ((Unit!20485 0))(
  ( (Unit!20486) )
))
(declare-fun lt!427265 () Unit!20485)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17609 (_ BitVec 64) Bool) Unit!20485)

(assert (=> b!294225 (= lt!427265 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12890 lt!427261)))))

(declare-fun e!210244 () Bool)

(assert (=> b!294225 e!210244))

(declare-fun res!242954 () Bool)

(assert (=> b!294225 (=> (not res!242954) (not e!210244))))

(declare-datatypes ((tuple3!1776 0))(
  ( (tuple3!1777 (_1!12891 Unit!20485) (_2!12891 BitStream!13264) (_3!1323 array!17609)) )
))
(declare-fun lt!427264 () tuple3!1776)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!294225 (= res!242954 (= (bvsub (bvadd (bitIndex!0 (size!7630 (buf!7693 thiss!1728)) (currentByte!14184 thiss!1728) (currentBit!14179 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7630 (buf!7693 (_2!12891 lt!427264))) (currentByte!14184 (_2!12891 lt!427264)) (currentBit!14179 (_2!12891 lt!427264)))))))

(declare-fun readBitsLoop!0 (BitStream!13264 (_ BitVec 64) array!17609 (_ BitVec 64) (_ BitVec 64)) tuple3!1776)

(assert (=> b!294225 (= lt!427264 (readBitsLoop!0 (_2!12890 lt!427261) nBits!523 lt!427266 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294225 (validate_offset_bits!1 ((_ sign_extend 32) (size!7630 (buf!7693 (_2!12890 lt!427261)))) ((_ sign_extend 32) (currentByte!14184 (_2!12890 lt!427261))) ((_ sign_extend 32) (currentBit!14179 (_2!12890 lt!427261))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!427262 () Unit!20485)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13264 BitStream!13264 (_ BitVec 64) (_ BitVec 64)) Unit!20485)

(assert (=> b!294225 (= lt!427262 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12890 lt!427261) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!427263 () (_ BitVec 32))

(declare-fun lt!427260 () (_ BitVec 32))

(assert (=> b!294225 (= lt!427266 (array!17610 (store (arr!8665 arr!273) lt!427263 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8665 arr!273) lt!427263)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427260)))) ((_ sign_extend 24) (ite (_1!12890 lt!427261) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427260) #b00000000))))) (size!7630 arr!273)))))

(assert (=> b!294225 (= lt!427260 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294225 (= lt!427263 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13264) tuple2!23134)

(assert (=> b!294225 (= lt!427261 (readBit!0 thiss!1728))))

(declare-fun b!294226 () Bool)

(assert (=> b!294226 (= e!210243 (array_inv!7242 (buf!7693 thiss!1728)))))

(declare-fun b!294227 () Bool)

(assert (=> b!294227 (= e!210244 (and (= (buf!7693 thiss!1728) (buf!7693 (_2!12891 lt!427264))) (= (size!7630 arr!273) (size!7630 (_3!1323 lt!427264)))))))

(declare-fun b!294228 () Bool)

(declare-fun res!242956 () Bool)

(assert (=> b!294228 (=> (not res!242956) (not e!210245))))

(assert (=> b!294228 (= res!242956 (validate_offset_bits!1 ((_ sign_extend 32) (size!7630 (buf!7693 thiss!1728))) ((_ sign_extend 32) (currentByte!14184 thiss!1728)) ((_ sign_extend 32) (currentBit!14179 thiss!1728)) (bvsub nBits!523 from!505)))))

(assert (= (and start!65626 res!242955) b!294228))

(assert (= (and b!294228 res!242956) b!294224))

(assert (= (and b!294224 res!242957) b!294225))

(assert (= (and b!294225 res!242954) b!294227))

(assert (= start!65626 b!294226))

(declare-fun m!430345 () Bool)

(assert (=> start!65626 m!430345))

(declare-fun m!430347 () Bool)

(assert (=> start!65626 m!430347))

(declare-fun m!430349 () Bool)

(assert (=> b!294225 m!430349))

(declare-fun m!430351 () Bool)

(assert (=> b!294225 m!430351))

(declare-fun m!430353 () Bool)

(assert (=> b!294225 m!430353))

(declare-fun m!430355 () Bool)

(assert (=> b!294225 m!430355))

(declare-fun m!430357 () Bool)

(assert (=> b!294225 m!430357))

(declare-fun m!430359 () Bool)

(assert (=> b!294225 m!430359))

(declare-fun m!430361 () Bool)

(assert (=> b!294225 m!430361))

(declare-fun m!430363 () Bool)

(assert (=> b!294225 m!430363))

(declare-fun m!430365 () Bool)

(assert (=> b!294225 m!430365))

(declare-fun m!430367 () Bool)

(assert (=> b!294225 m!430367))

(declare-fun m!430369 () Bool)

(assert (=> b!294225 m!430369))

(declare-fun m!430371 () Bool)

(assert (=> b!294226 m!430371))

(declare-fun m!430373 () Bool)

(assert (=> b!294228 m!430373))

(push 1)

(assert (not b!294225))

(assert (not start!65626))

(assert (not b!294228))

(assert (not b!294226))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

