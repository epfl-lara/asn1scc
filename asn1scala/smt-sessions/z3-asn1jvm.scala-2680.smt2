; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65628 () Bool)

(assert start!65628)

(declare-fun b!294239 () Bool)

(declare-fun e!210261 () Bool)

(assert (=> b!294239 (= e!210261 (not true))))

(declare-datatypes ((array!17611 0))(
  ( (array!17612 (arr!8666 (Array (_ BitVec 32) (_ BitVec 8))) (size!7631 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17611)

(declare-fun lt!427282 () array!17611)

(declare-fun from!505 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!17611 array!17611 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294239 (arrayBitRangesEq!0 arr!273 lt!427282 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((Unit!20487 0))(
  ( (Unit!20488) )
))
(declare-fun lt!427285 () Unit!20487)

(declare-datatypes ((BitStream!13266 0))(
  ( (BitStream!13267 (buf!7694 array!17611) (currentByte!14185 (_ BitVec 32)) (currentBit!14180 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!23136 0))(
  ( (tuple2!23137 (_1!12892 Bool) (_2!12892 BitStream!13266)) )
))
(declare-fun lt!427283 () tuple2!23136)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17611 (_ BitVec 64) Bool) Unit!20487)

(assert (=> b!294239 (= lt!427285 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12892 lt!427283)))))

(declare-fun e!210258 () Bool)

(assert (=> b!294239 e!210258))

(declare-fun res!242968 () Bool)

(assert (=> b!294239 (=> (not res!242968) (not e!210258))))

(declare-fun thiss!1728 () BitStream!13266)

(declare-fun to!474 () (_ BitVec 64))

(declare-datatypes ((tuple3!1778 0))(
  ( (tuple3!1779 (_1!12893 Unit!20487) (_2!12893 BitStream!13266) (_3!1324 array!17611)) )
))
(declare-fun lt!427287 () tuple3!1778)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!294239 (= res!242968 (= (bvsub (bvadd (bitIndex!0 (size!7631 (buf!7694 thiss!1728)) (currentByte!14185 thiss!1728) (currentBit!14180 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7631 (buf!7694 (_2!12893 lt!427287))) (currentByte!14185 (_2!12893 lt!427287)) (currentBit!14180 (_2!12893 lt!427287)))))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!13266 (_ BitVec 64) array!17611 (_ BitVec 64) (_ BitVec 64)) tuple3!1778)

(assert (=> b!294239 (= lt!427287 (readBitsLoop!0 (_2!12892 lt!427283) nBits!523 lt!427282 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294239 (validate_offset_bits!1 ((_ sign_extend 32) (size!7631 (buf!7694 (_2!12892 lt!427283)))) ((_ sign_extend 32) (currentByte!14185 (_2!12892 lt!427283))) ((_ sign_extend 32) (currentBit!14180 (_2!12892 lt!427283))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!427281 () Unit!20487)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13266 BitStream!13266 (_ BitVec 64) (_ BitVec 64)) Unit!20487)

(assert (=> b!294239 (= lt!427281 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12892 lt!427283) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!427286 () (_ BitVec 32))

(declare-fun lt!427284 () (_ BitVec 32))

(assert (=> b!294239 (= lt!427282 (array!17612 (store (arr!8666 arr!273) lt!427286 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8666 arr!273) lt!427286)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427284)))) ((_ sign_extend 24) (ite (_1!12892 lt!427283) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427284) #b00000000))))) (size!7631 arr!273)))))

(assert (=> b!294239 (= lt!427284 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294239 (= lt!427286 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13266) tuple2!23136)

(assert (=> b!294239 (= lt!427283 (readBit!0 thiss!1728))))

(declare-fun b!294241 () Bool)

(assert (=> b!294241 (= e!210258 (and (= (buf!7694 thiss!1728) (buf!7694 (_2!12893 lt!427287))) (= (size!7631 arr!273) (size!7631 (_3!1324 lt!427287)))))))

(declare-fun b!294242 () Bool)

(declare-fun res!242969 () Bool)

(assert (=> b!294242 (=> (not res!242969) (not e!210261))))

(assert (=> b!294242 (= res!242969 (bvslt from!505 to!474))))

(declare-fun b!294243 () Bool)

(declare-fun e!210259 () Bool)

(declare-fun array_inv!7243 (array!17611) Bool)

(assert (=> b!294243 (= e!210259 (array_inv!7243 (buf!7694 thiss!1728)))))

(declare-fun b!294240 () Bool)

(declare-fun res!242967 () Bool)

(assert (=> b!294240 (=> (not res!242967) (not e!210261))))

(assert (=> b!294240 (= res!242967 (validate_offset_bits!1 ((_ sign_extend 32) (size!7631 (buf!7694 thiss!1728))) ((_ sign_extend 32) (currentByte!14185 thiss!1728)) ((_ sign_extend 32) (currentBit!14180 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!242966 () Bool)

(assert (=> start!65628 (=> (not res!242966) (not e!210261))))

(assert (=> start!65628 (= res!242966 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7631 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65628 e!210261))

(declare-fun inv!12 (BitStream!13266) Bool)

(assert (=> start!65628 (and (inv!12 thiss!1728) e!210259)))

(assert (=> start!65628 true))

(assert (=> start!65628 (array_inv!7243 arr!273)))

(assert (= (and start!65628 res!242966) b!294240))

(assert (= (and b!294240 res!242967) b!294242))

(assert (= (and b!294242 res!242969) b!294239))

(assert (= (and b!294239 res!242968) b!294241))

(assert (= start!65628 b!294243))

(declare-fun m!430375 () Bool)

(assert (=> b!294239 m!430375))

(declare-fun m!430377 () Bool)

(assert (=> b!294239 m!430377))

(declare-fun m!430379 () Bool)

(assert (=> b!294239 m!430379))

(declare-fun m!430381 () Bool)

(assert (=> b!294239 m!430381))

(declare-fun m!430383 () Bool)

(assert (=> b!294239 m!430383))

(declare-fun m!430385 () Bool)

(assert (=> b!294239 m!430385))

(declare-fun m!430387 () Bool)

(assert (=> b!294239 m!430387))

(declare-fun m!430389 () Bool)

(assert (=> b!294239 m!430389))

(declare-fun m!430391 () Bool)

(assert (=> b!294239 m!430391))

(declare-fun m!430393 () Bool)

(assert (=> b!294239 m!430393))

(declare-fun m!430395 () Bool)

(assert (=> b!294239 m!430395))

(declare-fun m!430397 () Bool)

(assert (=> b!294243 m!430397))

(declare-fun m!430399 () Bool)

(assert (=> b!294240 m!430399))

(declare-fun m!430401 () Bool)

(assert (=> start!65628 m!430401))

(declare-fun m!430403 () Bool)

(assert (=> start!65628 m!430403))

(check-sat (not b!294240) (not start!65628) (not b!294239) (not b!294243))
