; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64822 () Bool)

(assert start!64822)

(declare-fun res!240319 () Bool)

(declare-fun e!207246 () Bool)

(assert (=> start!64822 (=> (not res!240319) (not e!207246))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17261 0))(
  ( (array!17262 (arr!8485 (Array (_ BitVec 32) (_ BitVec 8))) (size!7471 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17261)

(assert (=> start!64822 (= res!240319 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7471 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64822 e!207246))

(declare-datatypes ((BitStream!12952 0))(
  ( (BitStream!12953 (buf!7537 array!17261) (currentByte!13962 (_ BitVec 32)) (currentBit!13957 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12952)

(declare-fun e!207241 () Bool)

(declare-fun inv!12 (BitStream!12952) Bool)

(assert (=> start!64822 (and (inv!12 thiss!1728) e!207241)))

(assert (=> start!64822 true))

(declare-fun array_inv!7083 (array!17261) Bool)

(assert (=> start!64822 (array_inv!7083 arr!273)))

(declare-fun b!290905 () Bool)

(declare-fun res!240323 () Bool)

(assert (=> b!290905 (=> (not res!240323) (not e!207246))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290905 (= res!240323 (validate_offset_bits!1 ((_ sign_extend 32) (size!7471 (buf!7537 thiss!1728))) ((_ sign_extend 32) (currentByte!13962 thiss!1728)) ((_ sign_extend 32) (currentBit!13957 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!290906 () Bool)

(assert (=> b!290906 (= e!207241 (array_inv!7083 (buf!7537 thiss!1728)))))

(declare-fun b!290907 () Bool)

(declare-fun e!207242 () Bool)

(declare-fun lt!422485 () Bool)

(declare-datatypes ((tuple2!22838 0))(
  ( (tuple2!22839 (_1!12682 Bool) (_2!12682 BitStream!12952)) )
))
(declare-fun lt!422481 () tuple2!22838)

(assert (=> b!290907 (= e!207242 (= lt!422485 (_1!12682 lt!422481)))))

(declare-fun b!290908 () Bool)

(assert (=> b!290908 (= e!207246 (not (bvsle from!505 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7471 arr!273))))))))

(assert (=> b!290908 e!207242))

(declare-fun res!240321 () Bool)

(assert (=> b!290908 (=> (not res!240321) (not e!207242))))

(declare-fun lt!422480 () array!17261)

(declare-fun bitAt!0 (array!17261 (_ BitVec 64)) Bool)

(assert (=> b!290908 (= res!240321 (= (bitAt!0 lt!422480 from!505) lt!422485))))

(declare-datatypes ((Unit!20207 0))(
  ( (Unit!20208) )
))
(declare-datatypes ((tuple3!1686 0))(
  ( (tuple3!1687 (_1!12683 Unit!20207) (_2!12683 BitStream!12952) (_3!1263 array!17261)) )
))
(declare-fun lt!422483 () tuple3!1686)

(assert (=> b!290908 (= lt!422485 (bitAt!0 (_3!1263 lt!422483) from!505))))

(declare-fun lt!422484 () Unit!20207)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17261 array!17261 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20207)

(assert (=> b!290908 (= lt!422484 (arrayBitRangesEqImpliesEq!0 lt!422480 (_3!1263 lt!422483) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arrayBitRangesEq!0 (array!17261 array!17261 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290908 (arrayBitRangesEq!0 arr!273 (_3!1263 lt!422483) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!422479 () Unit!20207)

(declare-fun arrayBitRangesEqTransitive!0 (array!17261 array!17261 array!17261 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20207)

(assert (=> b!290908 (= lt!422479 (arrayBitRangesEqTransitive!0 arr!273 lt!422480 (_3!1263 lt!422483) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!290908 (arrayBitRangesEq!0 arr!273 lt!422480 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!422486 () Unit!20207)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17261 (_ BitVec 64) Bool) Unit!20207)

(assert (=> b!290908 (= lt!422486 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12682 lt!422481)))))

(declare-fun e!207243 () Bool)

(assert (=> b!290908 e!207243))

(declare-fun res!240322 () Bool)

(assert (=> b!290908 (=> (not res!240322) (not e!207243))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!290908 (= res!240322 (= (bvsub (bvadd (bitIndex!0 (size!7471 (buf!7537 thiss!1728)) (currentByte!13962 thiss!1728) (currentBit!13957 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7471 (buf!7537 (_2!12683 lt!422483))) (currentByte!13962 (_2!12683 lt!422483)) (currentBit!13957 (_2!12683 lt!422483)))))))

(declare-fun readBitsLoop!0 (BitStream!12952 (_ BitVec 64) array!17261 (_ BitVec 64) (_ BitVec 64)) tuple3!1686)

(assert (=> b!290908 (= lt!422483 (readBitsLoop!0 (_2!12682 lt!422481) nBits!523 lt!422480 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!290908 (validate_offset_bits!1 ((_ sign_extend 32) (size!7471 (buf!7537 (_2!12682 lt!422481)))) ((_ sign_extend 32) (currentByte!13962 (_2!12682 lt!422481))) ((_ sign_extend 32) (currentBit!13957 (_2!12682 lt!422481))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!422487 () Unit!20207)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12952 BitStream!12952 (_ BitVec 64) (_ BitVec 64)) Unit!20207)

(assert (=> b!290908 (= lt!422487 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12682 lt!422481) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!422482 () (_ BitVec 32))

(declare-fun lt!422478 () (_ BitVec 32))

(assert (=> b!290908 (= lt!422480 (array!17262 (store (arr!8485 arr!273) lt!422482 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8485 arr!273) lt!422482)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!422478)))) ((_ sign_extend 24) (ite (_1!12682 lt!422481) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!422478) #b00000000))))) (size!7471 arr!273)))))

(assert (=> b!290908 (= lt!422478 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!290908 (= lt!422482 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12952) tuple2!22838)

(assert (=> b!290908 (= lt!422481 (readBit!0 thiss!1728))))

(declare-fun b!290909 () Bool)

(declare-fun res!240320 () Bool)

(assert (=> b!290909 (=> (not res!240320) (not e!207246))))

(assert (=> b!290909 (= res!240320 (bvslt from!505 to!474))))

(declare-fun b!290910 () Bool)

(assert (=> b!290910 (= e!207243 (and (= (buf!7537 thiss!1728) (buf!7537 (_2!12683 lt!422483))) (= (size!7471 arr!273) (size!7471 (_3!1263 lt!422483)))))))

(assert (= (and start!64822 res!240319) b!290905))

(assert (= (and b!290905 res!240323) b!290909))

(assert (= (and b!290909 res!240320) b!290908))

(assert (= (and b!290908 res!240322) b!290910))

(assert (= (and b!290908 res!240321) b!290907))

(assert (= start!64822 b!290906))

(declare-fun m!425395 () Bool)

(assert (=> start!64822 m!425395))

(declare-fun m!425397 () Bool)

(assert (=> start!64822 m!425397))

(declare-fun m!425399 () Bool)

(assert (=> b!290905 m!425399))

(declare-fun m!425401 () Bool)

(assert (=> b!290906 m!425401))

(declare-fun m!425403 () Bool)

(assert (=> b!290908 m!425403))

(declare-fun m!425405 () Bool)

(assert (=> b!290908 m!425405))

(declare-fun m!425407 () Bool)

(assert (=> b!290908 m!425407))

(declare-fun m!425409 () Bool)

(assert (=> b!290908 m!425409))

(declare-fun m!425411 () Bool)

(assert (=> b!290908 m!425411))

(declare-fun m!425413 () Bool)

(assert (=> b!290908 m!425413))

(declare-fun m!425415 () Bool)

(assert (=> b!290908 m!425415))

(declare-fun m!425417 () Bool)

(assert (=> b!290908 m!425417))

(declare-fun m!425419 () Bool)

(assert (=> b!290908 m!425419))

(declare-fun m!425421 () Bool)

(assert (=> b!290908 m!425421))

(declare-fun m!425423 () Bool)

(assert (=> b!290908 m!425423))

(declare-fun m!425425 () Bool)

(assert (=> b!290908 m!425425))

(declare-fun m!425427 () Bool)

(assert (=> b!290908 m!425427))

(declare-fun m!425429 () Bool)

(assert (=> b!290908 m!425429))

(declare-fun m!425431 () Bool)

(assert (=> b!290908 m!425431))

(declare-fun m!425433 () Bool)

(assert (=> b!290908 m!425433))

(push 1)

(assert (not b!290906))

(assert (not b!290908))

(assert (not start!64822))

(assert (not b!290905))

(check-sat)

(pop 1)

(push 1)

(check-sat)

