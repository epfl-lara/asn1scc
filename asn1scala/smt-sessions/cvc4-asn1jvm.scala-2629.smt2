; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64928 () Bool)

(assert start!64928)

(declare-fun b!291376 () Bool)

(declare-fun res!240703 () Bool)

(declare-fun e!207656 () Bool)

(assert (=> b!291376 (=> (not res!240703) (not e!207656))))

(declare-datatypes ((array!17292 0))(
  ( (array!17293 (arr!8505 (Array (_ BitVec 32) (_ BitVec 8))) (size!7485 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12980 0))(
  ( (BitStream!12981 (buf!7551 array!17292) (currentByte!13985 (_ BitVec 32)) (currentBit!13980 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12980)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291376 (= res!240703 (validate_offset_bits!1 ((_ sign_extend 32) (size!7485 (buf!7551 thiss!1728))) ((_ sign_extend 32) (currentByte!13985 thiss!1728)) ((_ sign_extend 32) (currentBit!13980 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!291377 () Bool)

(declare-fun e!207652 () Bool)

(declare-fun array_inv!7097 (array!17292) Bool)

(assert (=> b!291377 (= e!207652 (array_inv!7097 (buf!7551 thiss!1728)))))

(declare-fun b!291378 () Bool)

(assert (=> b!291378 (= e!207656 (not true))))

(declare-datatypes ((tuple2!22888 0))(
  ( (tuple2!22889 (_1!12724 BitStream!12980) (_2!12724 Bool)) )
))
(declare-fun lt!423480 () tuple2!22888)

(declare-fun readBitPure!0 (BitStream!12980) tuple2!22888)

(assert (=> b!291378 (= lt!423480 (readBitPure!0 thiss!1728))))

(declare-fun e!207653 () Bool)

(assert (=> b!291378 e!207653))

(declare-fun res!240704 () Bool)

(assert (=> b!291378 (=> (not res!240704) (not e!207653))))

(declare-fun lt!423483 () Bool)

(declare-fun lt!423476 () array!17292)

(declare-fun bitAt!0 (array!17292 (_ BitVec 64)) Bool)

(assert (=> b!291378 (= res!240704 (= (bitAt!0 lt!423476 from!505) lt!423483))))

(declare-datatypes ((Unit!20247 0))(
  ( (Unit!20248) )
))
(declare-datatypes ((tuple3!1714 0))(
  ( (tuple3!1715 (_1!12725 Unit!20247) (_2!12725 BitStream!12980) (_3!1280 array!17292)) )
))
(declare-fun lt!423474 () tuple3!1714)

(assert (=> b!291378 (= lt!423483 (bitAt!0 (_3!1280 lt!423474) from!505))))

(declare-fun lt!423482 () Unit!20247)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17292 array!17292 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20247)

(assert (=> b!291378 (= lt!423482 (arrayBitRangesEqImpliesEq!0 lt!423476 (_3!1280 lt!423474) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arr!273 () array!17292)

(declare-fun arrayBitRangesEq!0 (array!17292 array!17292 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291378 (arrayBitRangesEq!0 arr!273 (_3!1280 lt!423474) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!423481 () Unit!20247)

(declare-fun arrayBitRangesEqTransitive!0 (array!17292 array!17292 array!17292 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20247)

(assert (=> b!291378 (= lt!423481 (arrayBitRangesEqTransitive!0 arr!273 lt!423476 (_3!1280 lt!423474) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!291378 (arrayBitRangesEq!0 arr!273 lt!423476 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((tuple2!22890 0))(
  ( (tuple2!22891 (_1!12726 Bool) (_2!12726 BitStream!12980)) )
))
(declare-fun lt!423478 () tuple2!22890)

(declare-fun lt!423477 () Unit!20247)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17292 (_ BitVec 64) Bool) Unit!20247)

(assert (=> b!291378 (= lt!423477 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12726 lt!423478)))))

(declare-fun e!207654 () Bool)

(assert (=> b!291378 e!207654))

(declare-fun res!240707 () Bool)

(assert (=> b!291378 (=> (not res!240707) (not e!207654))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!291378 (= res!240707 (= (bvsub (bvadd (bitIndex!0 (size!7485 (buf!7551 thiss!1728)) (currentByte!13985 thiss!1728) (currentBit!13980 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7485 (buf!7551 (_2!12725 lt!423474))) (currentByte!13985 (_2!12725 lt!423474)) (currentBit!13980 (_2!12725 lt!423474)))))))

(declare-fun readBitsLoop!0 (BitStream!12980 (_ BitVec 64) array!17292 (_ BitVec 64) (_ BitVec 64)) tuple3!1714)

(assert (=> b!291378 (= lt!423474 (readBitsLoop!0 (_2!12726 lt!423478) nBits!523 lt!423476 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!291378 (validate_offset_bits!1 ((_ sign_extend 32) (size!7485 (buf!7551 (_2!12726 lt!423478)))) ((_ sign_extend 32) (currentByte!13985 (_2!12726 lt!423478))) ((_ sign_extend 32) (currentBit!13980 (_2!12726 lt!423478))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!423473 () Unit!20247)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12980 BitStream!12980 (_ BitVec 64) (_ BitVec 64)) Unit!20247)

(assert (=> b!291378 (= lt!423473 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12726 lt!423478) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!423479 () (_ BitVec 32))

(declare-fun lt!423475 () (_ BitVec 32))

(assert (=> b!291378 (= lt!423476 (array!17293 (store (arr!8505 arr!273) lt!423479 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8505 arr!273) lt!423479)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!423475)))) ((_ sign_extend 24) (ite (_1!12726 lt!423478) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!423475) #b00000000))))) (size!7485 arr!273)))))

(assert (=> b!291378 (= lt!423475 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!291378 (= lt!423479 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12980) tuple2!22890)

(assert (=> b!291378 (= lt!423478 (readBit!0 thiss!1728))))

(declare-fun res!240705 () Bool)

(assert (=> start!64928 (=> (not res!240705) (not e!207656))))

(assert (=> start!64928 (= res!240705 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7485 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64928 e!207656))

(declare-fun inv!12 (BitStream!12980) Bool)

(assert (=> start!64928 (and (inv!12 thiss!1728) e!207652)))

(assert (=> start!64928 true))

(assert (=> start!64928 (array_inv!7097 arr!273)))

(declare-fun b!291379 () Bool)

(assert (=> b!291379 (= e!207654 (and (= (buf!7551 thiss!1728) (buf!7551 (_2!12725 lt!423474))) (= (size!7485 arr!273) (size!7485 (_3!1280 lt!423474)))))))

(declare-fun b!291380 () Bool)

(assert (=> b!291380 (= e!207653 (= lt!423483 (_1!12726 lt!423478)))))

(declare-fun b!291381 () Bool)

(declare-fun res!240706 () Bool)

(assert (=> b!291381 (=> (not res!240706) (not e!207656))))

(assert (=> b!291381 (= res!240706 (bvslt from!505 to!474))))

(assert (= (and start!64928 res!240705) b!291376))

(assert (= (and b!291376 res!240703) b!291381))

(assert (= (and b!291381 res!240706) b!291378))

(assert (= (and b!291378 res!240707) b!291379))

(assert (= (and b!291378 res!240704) b!291380))

(assert (= start!64928 b!291377))

(declare-fun m!426355 () Bool)

(assert (=> b!291376 m!426355))

(declare-fun m!426357 () Bool)

(assert (=> b!291377 m!426357))

(declare-fun m!426359 () Bool)

(assert (=> b!291378 m!426359))

(declare-fun m!426361 () Bool)

(assert (=> b!291378 m!426361))

(declare-fun m!426363 () Bool)

(assert (=> b!291378 m!426363))

(declare-fun m!426365 () Bool)

(assert (=> b!291378 m!426365))

(declare-fun m!426367 () Bool)

(assert (=> b!291378 m!426367))

(declare-fun m!426369 () Bool)

(assert (=> b!291378 m!426369))

(declare-fun m!426371 () Bool)

(assert (=> b!291378 m!426371))

(declare-fun m!426373 () Bool)

(assert (=> b!291378 m!426373))

(declare-fun m!426375 () Bool)

(assert (=> b!291378 m!426375))

(declare-fun m!426377 () Bool)

(assert (=> b!291378 m!426377))

(declare-fun m!426379 () Bool)

(assert (=> b!291378 m!426379))

(declare-fun m!426381 () Bool)

(assert (=> b!291378 m!426381))

(declare-fun m!426383 () Bool)

(assert (=> b!291378 m!426383))

(declare-fun m!426385 () Bool)

(assert (=> b!291378 m!426385))

(declare-fun m!426387 () Bool)

(assert (=> b!291378 m!426387))

(declare-fun m!426389 () Bool)

(assert (=> b!291378 m!426389))

(declare-fun m!426391 () Bool)

(assert (=> b!291378 m!426391))

(declare-fun m!426393 () Bool)

(assert (=> start!64928 m!426393))

(declare-fun m!426395 () Bool)

(assert (=> start!64928 m!426395))

(push 1)

(assert (not b!291376))

(assert (not b!291378))

(assert (not b!291377))

(assert (not start!64928))

(check-sat)

(pop 1)

