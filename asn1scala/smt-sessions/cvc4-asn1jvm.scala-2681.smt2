; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65636 () Bool)

(assert start!65636)

(declare-fun res!243015 () Bool)

(declare-fun e!210318 () Bool)

(assert (=> start!65636 (=> (not res!243015) (not e!210318))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17619 0))(
  ( (array!17620 (arr!8670 (Array (_ BitVec 32) (_ BitVec 8))) (size!7635 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17619)

(assert (=> start!65636 (= res!243015 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7635 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65636 e!210318))

(declare-datatypes ((BitStream!13274 0))(
  ( (BitStream!13275 (buf!7698 array!17619) (currentByte!14189 (_ BitVec 32)) (currentBit!14184 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13274)

(declare-fun e!210319 () Bool)

(declare-fun inv!12 (BitStream!13274) Bool)

(assert (=> start!65636 (and (inv!12 thiss!1728) e!210319)))

(assert (=> start!65636 true))

(declare-fun array_inv!7247 (array!17619) Bool)

(assert (=> start!65636 (array_inv!7247 arr!273)))

(declare-fun e!210320 () Bool)

(declare-fun b!294299 () Bool)

(declare-datatypes ((Unit!20495 0))(
  ( (Unit!20496) )
))
(declare-datatypes ((tuple3!1786 0))(
  ( (tuple3!1787 (_1!12900 Unit!20495) (_2!12900 BitStream!13274) (_3!1328 array!17619)) )
))
(declare-fun lt!427366 () tuple3!1786)

(assert (=> b!294299 (= e!210320 (and (= (buf!7698 thiss!1728) (buf!7698 (_2!12900 lt!427366))) (= (size!7635 arr!273) (size!7635 (_3!1328 lt!427366)))))))

(declare-fun b!294300 () Bool)

(assert (=> b!294300 (= e!210318 (not (or (bvsgt from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (let ((bdg!17510 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7635 arr!273))))) (and (bvsle from!505 bdg!17510) (bvsle (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) bdg!17510))))))))

(declare-fun lt!427367 () array!17619)

(declare-fun arrayBitRangesEq!0 (array!17619 array!17619 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294300 (arrayBitRangesEq!0 arr!273 lt!427367 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((tuple2!23144 0))(
  ( (tuple2!23145 (_1!12901 Bool) (_2!12901 BitStream!13274)) )
))
(declare-fun lt!427365 () tuple2!23144)

(declare-fun lt!427370 () Unit!20495)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17619 (_ BitVec 64) Bool) Unit!20495)

(assert (=> b!294300 (= lt!427370 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12901 lt!427365)))))

(assert (=> b!294300 e!210320))

(declare-fun res!243016 () Bool)

(assert (=> b!294300 (=> (not res!243016) (not e!210320))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!294300 (= res!243016 (= (bvsub (bvadd (bitIndex!0 (size!7635 (buf!7698 thiss!1728)) (currentByte!14189 thiss!1728) (currentBit!14184 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7635 (buf!7698 (_2!12900 lt!427366))) (currentByte!14189 (_2!12900 lt!427366)) (currentBit!14184 (_2!12900 lt!427366)))))))

(declare-fun readBitsLoop!0 (BitStream!13274 (_ BitVec 64) array!17619 (_ BitVec 64) (_ BitVec 64)) tuple3!1786)

(assert (=> b!294300 (= lt!427366 (readBitsLoop!0 (_2!12901 lt!427365) nBits!523 lt!427367 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294300 (validate_offset_bits!1 ((_ sign_extend 32) (size!7635 (buf!7698 (_2!12901 lt!427365)))) ((_ sign_extend 32) (currentByte!14189 (_2!12901 lt!427365))) ((_ sign_extend 32) (currentBit!14184 (_2!12901 lt!427365))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!427368 () Unit!20495)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13274 BitStream!13274 (_ BitVec 64) (_ BitVec 64)) Unit!20495)

(assert (=> b!294300 (= lt!427368 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12901 lt!427365) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!427369 () (_ BitVec 32))

(declare-fun lt!427371 () (_ BitVec 32))

(assert (=> b!294300 (= lt!427367 (array!17620 (store (arr!8670 arr!273) lt!427371 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8670 arr!273) lt!427371)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427369)))) ((_ sign_extend 24) (ite (_1!12901 lt!427365) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427369) #b00000000))))) (size!7635 arr!273)))))

(assert (=> b!294300 (= lt!427369 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294300 (= lt!427371 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13274) tuple2!23144)

(assert (=> b!294300 (= lt!427365 (readBit!0 thiss!1728))))

(declare-fun b!294301 () Bool)

(declare-fun res!243014 () Bool)

(assert (=> b!294301 (=> (not res!243014) (not e!210318))))

(assert (=> b!294301 (= res!243014 (bvslt from!505 to!474))))

(declare-fun b!294302 () Bool)

(assert (=> b!294302 (= e!210319 (array_inv!7247 (buf!7698 thiss!1728)))))

(declare-fun b!294303 () Bool)

(declare-fun res!243017 () Bool)

(assert (=> b!294303 (=> (not res!243017) (not e!210318))))

(assert (=> b!294303 (= res!243017 (validate_offset_bits!1 ((_ sign_extend 32) (size!7635 (buf!7698 thiss!1728))) ((_ sign_extend 32) (currentByte!14189 thiss!1728)) ((_ sign_extend 32) (currentBit!14184 thiss!1728)) (bvsub nBits!523 from!505)))))

(assert (= (and start!65636 res!243015) b!294303))

(assert (= (and b!294303 res!243017) b!294301))

(assert (= (and b!294301 res!243014) b!294300))

(assert (= (and b!294300 res!243016) b!294299))

(assert (= start!65636 b!294302))

(declare-fun m!430495 () Bool)

(assert (=> start!65636 m!430495))

(declare-fun m!430497 () Bool)

(assert (=> start!65636 m!430497))

(declare-fun m!430499 () Bool)

(assert (=> b!294300 m!430499))

(declare-fun m!430501 () Bool)

(assert (=> b!294300 m!430501))

(declare-fun m!430503 () Bool)

(assert (=> b!294300 m!430503))

(declare-fun m!430505 () Bool)

(assert (=> b!294300 m!430505))

(declare-fun m!430507 () Bool)

(assert (=> b!294300 m!430507))

(declare-fun m!430509 () Bool)

(assert (=> b!294300 m!430509))

(declare-fun m!430511 () Bool)

(assert (=> b!294300 m!430511))

(declare-fun m!430513 () Bool)

(assert (=> b!294300 m!430513))

(declare-fun m!430515 () Bool)

(assert (=> b!294300 m!430515))

(declare-fun m!430517 () Bool)

(assert (=> b!294300 m!430517))

(declare-fun m!430519 () Bool)

(assert (=> b!294300 m!430519))

(declare-fun m!430521 () Bool)

(assert (=> b!294302 m!430521))

(declare-fun m!430523 () Bool)

(assert (=> b!294303 m!430523))

(push 1)

(assert (not b!294303))

(assert (not b!294302))

(assert (not b!294300))

(assert (not start!65636))

(check-sat)

(pop 1)

(push 1)

(check-sat)

