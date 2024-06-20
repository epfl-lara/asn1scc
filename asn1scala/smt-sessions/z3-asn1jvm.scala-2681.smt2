; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65634 () Bool)

(assert start!65634)

(declare-datatypes ((array!17617 0))(
  ( (array!17618 (arr!8669 (Array (_ BitVec 32) (_ BitVec 8))) (size!7634 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13272 0))(
  ( (BitStream!13273 (buf!7697 array!17617) (currentByte!14188 (_ BitVec 32)) (currentBit!14183 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13272)

(declare-datatypes ((Unit!20493 0))(
  ( (Unit!20494) )
))
(declare-datatypes ((tuple3!1784 0))(
  ( (tuple3!1785 (_1!12898 Unit!20493) (_2!12898 BitStream!13272) (_3!1327 array!17617)) )
))
(declare-fun lt!427344 () tuple3!1784)

(declare-fun b!294285 () Bool)

(declare-fun e!210302 () Bool)

(declare-fun arr!273 () array!17617)

(assert (=> b!294285 (= e!210302 (and (= (buf!7697 thiss!1728) (buf!7697 (_2!12898 lt!427344))) (= (size!7634 arr!273) (size!7634 (_3!1327 lt!427344)))))))

(declare-fun b!294286 () Bool)

(declare-fun e!210306 () Bool)

(declare-fun array_inv!7246 (array!17617) Bool)

(assert (=> b!294286 (= e!210306 (array_inv!7246 (buf!7697 thiss!1728)))))

(declare-fun res!243002 () Bool)

(declare-fun e!210305 () Bool)

(assert (=> start!65634 (=> (not res!243002) (not e!210305))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(assert (=> start!65634 (= res!243002 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7634 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65634 e!210305))

(declare-fun inv!12 (BitStream!13272) Bool)

(assert (=> start!65634 (and (inv!12 thiss!1728) e!210306)))

(assert (=> start!65634 true))

(assert (=> start!65634 (array_inv!7246 arr!273)))

(declare-fun b!294284 () Bool)

(assert (=> b!294284 (= e!210305 (not (or (bvsgt from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (let ((bdg!17510 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7634 arr!273))))) (and (bvsle from!505 bdg!17510) (bvsle (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) bdg!17510))))))))

(declare-fun lt!427349 () array!17617)

(declare-fun arrayBitRangesEq!0 (array!17617 array!17617 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294284 (arrayBitRangesEq!0 arr!273 lt!427349 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!427348 () Unit!20493)

(declare-datatypes ((tuple2!23142 0))(
  ( (tuple2!23143 (_1!12899 Bool) (_2!12899 BitStream!13272)) )
))
(declare-fun lt!427347 () tuple2!23142)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17617 (_ BitVec 64) Bool) Unit!20493)

(assert (=> b!294284 (= lt!427348 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12899 lt!427347)))))

(assert (=> b!294284 e!210302))

(declare-fun res!243005 () Bool)

(assert (=> b!294284 (=> (not res!243005) (not e!210302))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!294284 (= res!243005 (= (bvsub (bvadd (bitIndex!0 (size!7634 (buf!7697 thiss!1728)) (currentByte!14188 thiss!1728) (currentBit!14183 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7634 (buf!7697 (_2!12898 lt!427344))) (currentByte!14188 (_2!12898 lt!427344)) (currentBit!14183 (_2!12898 lt!427344)))))))

(declare-fun readBitsLoop!0 (BitStream!13272 (_ BitVec 64) array!17617 (_ BitVec 64) (_ BitVec 64)) tuple3!1784)

(assert (=> b!294284 (= lt!427344 (readBitsLoop!0 (_2!12899 lt!427347) nBits!523 lt!427349 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294284 (validate_offset_bits!1 ((_ sign_extend 32) (size!7634 (buf!7697 (_2!12899 lt!427347)))) ((_ sign_extend 32) (currentByte!14188 (_2!12899 lt!427347))) ((_ sign_extend 32) (currentBit!14183 (_2!12899 lt!427347))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!427345 () Unit!20493)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13272 BitStream!13272 (_ BitVec 64) (_ BitVec 64)) Unit!20493)

(assert (=> b!294284 (= lt!427345 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12899 lt!427347) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!427346 () (_ BitVec 32))

(declare-fun lt!427350 () (_ BitVec 32))

(assert (=> b!294284 (= lt!427349 (array!17618 (store (arr!8669 arr!273) lt!427346 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8669 arr!273) lt!427346)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427350)))) ((_ sign_extend 24) (ite (_1!12899 lt!427347) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427350) #b00000000))))) (size!7634 arr!273)))))

(assert (=> b!294284 (= lt!427350 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294284 (= lt!427346 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13272) tuple2!23142)

(assert (=> b!294284 (= lt!427347 (readBit!0 thiss!1728))))

(declare-fun b!294287 () Bool)

(declare-fun res!243003 () Bool)

(assert (=> b!294287 (=> (not res!243003) (not e!210305))))

(assert (=> b!294287 (= res!243003 (bvslt from!505 to!474))))

(declare-fun b!294288 () Bool)

(declare-fun res!243004 () Bool)

(assert (=> b!294288 (=> (not res!243004) (not e!210305))))

(assert (=> b!294288 (= res!243004 (validate_offset_bits!1 ((_ sign_extend 32) (size!7634 (buf!7697 thiss!1728))) ((_ sign_extend 32) (currentByte!14188 thiss!1728)) ((_ sign_extend 32) (currentBit!14183 thiss!1728)) (bvsub nBits!523 from!505)))))

(assert (= (and start!65634 res!243002) b!294288))

(assert (= (and b!294288 res!243004) b!294287))

(assert (= (and b!294287 res!243003) b!294284))

(assert (= (and b!294284 res!243005) b!294285))

(assert (= start!65634 b!294286))

(declare-fun m!430465 () Bool)

(assert (=> b!294286 m!430465))

(declare-fun m!430467 () Bool)

(assert (=> start!65634 m!430467))

(declare-fun m!430469 () Bool)

(assert (=> start!65634 m!430469))

(declare-fun m!430471 () Bool)

(assert (=> b!294284 m!430471))

(declare-fun m!430473 () Bool)

(assert (=> b!294284 m!430473))

(declare-fun m!430475 () Bool)

(assert (=> b!294284 m!430475))

(declare-fun m!430477 () Bool)

(assert (=> b!294284 m!430477))

(declare-fun m!430479 () Bool)

(assert (=> b!294284 m!430479))

(declare-fun m!430481 () Bool)

(assert (=> b!294284 m!430481))

(declare-fun m!430483 () Bool)

(assert (=> b!294284 m!430483))

(declare-fun m!430485 () Bool)

(assert (=> b!294284 m!430485))

(declare-fun m!430487 () Bool)

(assert (=> b!294284 m!430487))

(declare-fun m!430489 () Bool)

(assert (=> b!294284 m!430489))

(declare-fun m!430491 () Bool)

(assert (=> b!294284 m!430491))

(declare-fun m!430493 () Bool)

(assert (=> b!294288 m!430493))

(check-sat (not b!294286) (not start!65634) (not b!294284) (not b!294288))
(check-sat)
