; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64826 () Bool)

(assert start!64826)

(declare-datatypes ((array!17265 0))(
  ( (array!17266 (arr!8487 (Array (_ BitVec 32) (_ BitVec 8))) (size!7473 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12956 0))(
  ( (BitStream!12957 (buf!7539 array!17265) (currentByte!13964 (_ BitVec 32)) (currentBit!13959 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12956)

(declare-fun b!290941 () Bool)

(declare-datatypes ((Unit!20211 0))(
  ( (Unit!20212) )
))
(declare-datatypes ((tuple3!1690 0))(
  ( (tuple3!1691 (_1!12686 Unit!20211) (_2!12686 BitStream!12956) (_3!1265 array!17265)) )
))
(declare-fun lt!422540 () tuple3!1690)

(declare-fun arr!273 () array!17265)

(declare-fun e!207280 () Bool)

(assert (=> b!290941 (= e!207280 (and (= (buf!7539 thiss!1728) (buf!7539 (_2!12686 lt!422540))) (= (size!7473 arr!273) (size!7473 (_3!1265 lt!422540)))))))

(declare-fun b!290942 () Bool)

(declare-fun res!240352 () Bool)

(declare-fun e!207279 () Bool)

(assert (=> b!290942 (=> (not res!240352) (not e!207279))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290942 (= res!240352 (validate_offset_bits!1 ((_ sign_extend 32) (size!7473 (buf!7539 thiss!1728))) ((_ sign_extend 32) (currentByte!13964 thiss!1728)) ((_ sign_extend 32) (currentBit!13959 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!290943 () Bool)

(declare-fun e!207281 () Bool)

(declare-fun array_inv!7085 (array!17265) Bool)

(assert (=> b!290943 (= e!207281 (array_inv!7085 (buf!7539 thiss!1728)))))

(declare-fun res!240349 () Bool)

(assert (=> start!64826 (=> (not res!240349) (not e!207279))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> start!64826 (= res!240349 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7473 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64826 e!207279))

(declare-fun inv!12 (BitStream!12956) Bool)

(assert (=> start!64826 (and (inv!12 thiss!1728) e!207281)))

(assert (=> start!64826 true))

(assert (=> start!64826 (array_inv!7085 arr!273)))

(declare-fun b!290944 () Bool)

(assert (=> b!290944 (= e!207279 (not (bvsle from!505 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7473 arr!273))))))))

(declare-fun e!207282 () Bool)

(assert (=> b!290944 e!207282))

(declare-fun res!240350 () Bool)

(assert (=> b!290944 (=> (not res!240350) (not e!207282))))

(declare-fun lt!422543 () array!17265)

(declare-fun lt!422542 () Bool)

(declare-fun bitAt!0 (array!17265 (_ BitVec 64)) Bool)

(assert (=> b!290944 (= res!240350 (= (bitAt!0 lt!422543 from!505) lt!422542))))

(assert (=> b!290944 (= lt!422542 (bitAt!0 (_3!1265 lt!422540) from!505))))

(declare-fun lt!422538 () Unit!20211)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17265 array!17265 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20211)

(assert (=> b!290944 (= lt!422538 (arrayBitRangesEqImpliesEq!0 lt!422543 (_3!1265 lt!422540) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arrayBitRangesEq!0 (array!17265 array!17265 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290944 (arrayBitRangesEq!0 arr!273 (_3!1265 lt!422540) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!422547 () Unit!20211)

(declare-fun arrayBitRangesEqTransitive!0 (array!17265 array!17265 array!17265 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20211)

(assert (=> b!290944 (= lt!422547 (arrayBitRangesEqTransitive!0 arr!273 lt!422543 (_3!1265 lt!422540) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!290944 (arrayBitRangesEq!0 arr!273 lt!422543 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!422545 () Unit!20211)

(declare-datatypes ((tuple2!22842 0))(
  ( (tuple2!22843 (_1!12687 Bool) (_2!12687 BitStream!12956)) )
))
(declare-fun lt!422546 () tuple2!22842)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17265 (_ BitVec 64) Bool) Unit!20211)

(assert (=> b!290944 (= lt!422545 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12687 lt!422546)))))

(assert (=> b!290944 e!207280))

(declare-fun res!240353 () Bool)

(assert (=> b!290944 (=> (not res!240353) (not e!207280))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!290944 (= res!240353 (= (bvsub (bvadd (bitIndex!0 (size!7473 (buf!7539 thiss!1728)) (currentByte!13964 thiss!1728) (currentBit!13959 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7473 (buf!7539 (_2!12686 lt!422540))) (currentByte!13964 (_2!12686 lt!422540)) (currentBit!13959 (_2!12686 lt!422540)))))))

(declare-fun readBitsLoop!0 (BitStream!12956 (_ BitVec 64) array!17265 (_ BitVec 64) (_ BitVec 64)) tuple3!1690)

(assert (=> b!290944 (= lt!422540 (readBitsLoop!0 (_2!12687 lt!422546) nBits!523 lt!422543 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!290944 (validate_offset_bits!1 ((_ sign_extend 32) (size!7473 (buf!7539 (_2!12687 lt!422546)))) ((_ sign_extend 32) (currentByte!13964 (_2!12687 lt!422546))) ((_ sign_extend 32) (currentBit!13959 (_2!12687 lt!422546))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!422539 () Unit!20211)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12956 BitStream!12956 (_ BitVec 64) (_ BitVec 64)) Unit!20211)

(assert (=> b!290944 (= lt!422539 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12687 lt!422546) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!422541 () (_ BitVec 32))

(declare-fun lt!422544 () (_ BitVec 32))

(assert (=> b!290944 (= lt!422543 (array!17266 (store (arr!8487 arr!273) lt!422541 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8487 arr!273) lt!422541)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!422544)))) ((_ sign_extend 24) (ite (_1!12687 lt!422546) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!422544) #b00000000))))) (size!7473 arr!273)))))

(assert (=> b!290944 (= lt!422544 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!290944 (= lt!422541 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12956) tuple2!22842)

(assert (=> b!290944 (= lt!422546 (readBit!0 thiss!1728))))

(declare-fun b!290945 () Bool)

(assert (=> b!290945 (= e!207282 (= lt!422542 (_1!12687 lt!422546)))))

(declare-fun b!290946 () Bool)

(declare-fun res!240351 () Bool)

(assert (=> b!290946 (=> (not res!240351) (not e!207279))))

(assert (=> b!290946 (= res!240351 (bvslt from!505 to!474))))

(assert (= (and start!64826 res!240349) b!290942))

(assert (= (and b!290942 res!240352) b!290946))

(assert (= (and b!290946 res!240351) b!290944))

(assert (= (and b!290944 res!240353) b!290941))

(assert (= (and b!290944 res!240350) b!290945))

(assert (= start!64826 b!290943))

(declare-fun m!425475 () Bool)

(assert (=> b!290942 m!425475))

(declare-fun m!425477 () Bool)

(assert (=> b!290943 m!425477))

(declare-fun m!425479 () Bool)

(assert (=> start!64826 m!425479))

(declare-fun m!425481 () Bool)

(assert (=> start!64826 m!425481))

(declare-fun m!425483 () Bool)

(assert (=> b!290944 m!425483))

(declare-fun m!425485 () Bool)

(assert (=> b!290944 m!425485))

(declare-fun m!425487 () Bool)

(assert (=> b!290944 m!425487))

(declare-fun m!425489 () Bool)

(assert (=> b!290944 m!425489))

(declare-fun m!425491 () Bool)

(assert (=> b!290944 m!425491))

(declare-fun m!425493 () Bool)

(assert (=> b!290944 m!425493))

(declare-fun m!425495 () Bool)

(assert (=> b!290944 m!425495))

(declare-fun m!425497 () Bool)

(assert (=> b!290944 m!425497))

(declare-fun m!425499 () Bool)

(assert (=> b!290944 m!425499))

(declare-fun m!425501 () Bool)

(assert (=> b!290944 m!425501))

(declare-fun m!425503 () Bool)

(assert (=> b!290944 m!425503))

(declare-fun m!425505 () Bool)

(assert (=> b!290944 m!425505))

(declare-fun m!425507 () Bool)

(assert (=> b!290944 m!425507))

(declare-fun m!425509 () Bool)

(assert (=> b!290944 m!425509))

(declare-fun m!425511 () Bool)

(assert (=> b!290944 m!425511))

(declare-fun m!425513 () Bool)

(assert (=> b!290944 m!425513))

(push 1)

(assert (not b!290943))

(assert (not b!290942))

(assert (not b!290944))

(assert (not start!64826))

(check-sat)

(pop 1)

(push 1)

(check-sat)

