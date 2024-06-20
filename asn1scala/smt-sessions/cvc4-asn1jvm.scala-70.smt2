; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1416 () Bool)

(assert start!1416)

(declare-fun b!6514 () Bool)

(declare-fun res!7442 () Bool)

(declare-fun e!4102 () Bool)

(assert (=> b!6514 (=> (not res!7442) (not e!4102))))

(declare-datatypes ((array!454 0))(
  ( (array!455 (arr!594 (Array (_ BitVec 32) (_ BitVec 8))) (size!195 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!368 0))(
  ( (BitStream!369 (buf!525 array!454) (currentByte!1522 (_ BitVec 32)) (currentBit!1517 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!512 0))(
  ( (Unit!513) )
))
(declare-datatypes ((tuple2!850 0))(
  ( (tuple2!851 (_1!450 Unit!512) (_2!450 BitStream!368)) )
))
(declare-fun lt!8584 () tuple2!850)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun thiss!1486 () BitStream!368)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!6514 (= res!7442 (= (bitIndex!0 (size!195 (buf!525 (_2!450 lt!8584))) (currentByte!1522 (_2!450 lt!8584)) (currentBit!1517 (_2!450 lt!8584))) (bvadd (bitIndex!0 (size!195 (buf!525 thiss!1486)) (currentByte!1522 thiss!1486) (currentBit!1517 thiss!1486)) nBits!460)))))

(declare-fun b!6515 () Bool)

(declare-fun res!7444 () Bool)

(assert (=> b!6515 (=> (not res!7444) (not e!4102))))

(declare-fun isPrefixOf!0 (BitStream!368 BitStream!368) Bool)

(assert (=> b!6515 (= res!7444 (isPrefixOf!0 thiss!1486 (_2!450 lt!8584)))))

(declare-fun b!6516 () Bool)

(declare-fun e!4103 () Bool)

(assert (=> b!6516 (= e!4103 e!4102)))

(declare-fun res!7440 () Bool)

(assert (=> b!6516 (=> (not res!7440) (not e!4102))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!6516 (= res!7440 (invariant!0 (currentBit!1517 (_2!450 lt!8584)) (currentByte!1522 (_2!450 lt!8584)) (size!195 (buf!525 (_2!450 lt!8584)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!454)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!368 array!454 (_ BitVec 64) (_ BitVec 64)) tuple2!850)

(assert (=> b!6516 (= lt!8584 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!6517 () Bool)

(declare-fun e!4101 () Bool)

(declare-fun array_inv!190 (array!454) Bool)

(assert (=> b!6517 (= e!4101 (array_inv!190 (buf!525 thiss!1486)))))

(declare-fun b!6518 () Bool)

(declare-fun res!7445 () Bool)

(declare-fun e!4105 () Bool)

(assert (=> b!6518 (=> res!7445 e!4105)))

(declare-datatypes ((List!95 0))(
  ( (Nil!92) (Cons!91 (h!210 Bool) (t!845 List!95)) )
))
(declare-fun lt!8581 () List!95)

(declare-fun byteArrayBitContentToList!0 (BitStream!368 array!454 (_ BitVec 64) (_ BitVec 64)) List!95)

(assert (=> b!6518 (= res!7445 (not (= lt!8581 (byteArrayBitContentToList!0 (_2!450 lt!8584) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!6519 () Bool)

(declare-fun res!7441 () Bool)

(assert (=> b!6519 (=> (not res!7441) (not e!4103))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!6519 (= res!7441 (validate_offset_bits!1 ((_ sign_extend 32) (size!195 (buf!525 thiss!1486))) ((_ sign_extend 32) (currentByte!1522 thiss!1486)) ((_ sign_extend 32) (currentBit!1517 thiss!1486)) nBits!460))))

(declare-fun b!6520 () Bool)

(declare-fun res!7447 () Bool)

(assert (=> b!6520 (=> (not res!7447) (not e!4102))))

(assert (=> b!6520 (= res!7447 (= (size!195 (buf!525 thiss!1486)) (size!195 (buf!525 (_2!450 lt!8584)))))))

(declare-fun b!6521 () Bool)

(assert (=> b!6521 (= e!4102 (not e!4105))))

(declare-fun res!7443 () Bool)

(assert (=> b!6521 (=> res!7443 e!4105)))

(declare-datatypes ((tuple2!852 0))(
  ( (tuple2!853 (_1!451 array!454) (_2!451 BitStream!368)) )
))
(declare-fun lt!8580 () tuple2!852)

(assert (=> b!6521 (= res!7443 (not (= (byteArrayBitContentToList!0 (_2!450 lt!8584) (_1!451 lt!8580) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!8581)))))

(declare-datatypes ((tuple2!854 0))(
  ( (tuple2!855 (_1!452 BitStream!368) (_2!452 BitStream!368)) )
))
(declare-fun lt!8585 () tuple2!854)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!368 BitStream!368 (_ BitVec 64)) List!95)

(assert (=> b!6521 (= lt!8581 (bitStreamReadBitsIntoList!0 (_2!450 lt!8584) (_1!452 lt!8585) nBits!460))))

(declare-fun readBits!0 (BitStream!368 (_ BitVec 64)) tuple2!852)

(assert (=> b!6521 (= lt!8580 (readBits!0 (_1!452 lt!8585) nBits!460))))

(assert (=> b!6521 (validate_offset_bits!1 ((_ sign_extend 32) (size!195 (buf!525 (_2!450 lt!8584)))) ((_ sign_extend 32) (currentByte!1522 thiss!1486)) ((_ sign_extend 32) (currentBit!1517 thiss!1486)) nBits!460)))

(declare-fun lt!8582 () Unit!512)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!368 array!454 (_ BitVec 64)) Unit!512)

(assert (=> b!6521 (= lt!8582 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!525 (_2!450 lt!8584)) nBits!460))))

(declare-fun reader!0 (BitStream!368 BitStream!368) tuple2!854)

(assert (=> b!6521 (= lt!8585 (reader!0 thiss!1486 (_2!450 lt!8584)))))

(declare-fun b!6522 () Bool)

(assert (=> b!6522 (= e!4105 true)))

(declare-fun lt!8583 () Unit!512)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!368 array!454 array!454 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!512)

(assert (=> b!6522 (= lt!8583 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!450 lt!8584) srcBuffer!6 (_1!451 lt!8580) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun res!7446 () Bool)

(assert (=> start!1416 (=> (not res!7446) (not e!4103))))

(assert (=> start!1416 (= res!7446 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!195 srcBuffer!6))))))))

(assert (=> start!1416 e!4103))

(assert (=> start!1416 true))

(assert (=> start!1416 (array_inv!190 srcBuffer!6)))

(declare-fun inv!12 (BitStream!368) Bool)

(assert (=> start!1416 (and (inv!12 thiss!1486) e!4101)))

(assert (= (and start!1416 res!7446) b!6519))

(assert (= (and b!6519 res!7441) b!6516))

(assert (= (and b!6516 res!7440) b!6520))

(assert (= (and b!6520 res!7447) b!6514))

(assert (= (and b!6514 res!7442) b!6515))

(assert (= (and b!6515 res!7444) b!6521))

(assert (= (and b!6521 (not res!7443)) b!6518))

(assert (= (and b!6518 (not res!7445)) b!6522))

(assert (= start!1416 b!6517))

(declare-fun m!8249 () Bool)

(assert (=> b!6516 m!8249))

(declare-fun m!8251 () Bool)

(assert (=> b!6516 m!8251))

(declare-fun m!8253 () Bool)

(assert (=> b!6522 m!8253))

(declare-fun m!8255 () Bool)

(assert (=> start!1416 m!8255))

(declare-fun m!8257 () Bool)

(assert (=> start!1416 m!8257))

(declare-fun m!8259 () Bool)

(assert (=> b!6519 m!8259))

(declare-fun m!8261 () Bool)

(assert (=> b!6514 m!8261))

(declare-fun m!8263 () Bool)

(assert (=> b!6514 m!8263))

(declare-fun m!8265 () Bool)

(assert (=> b!6521 m!8265))

(declare-fun m!8267 () Bool)

(assert (=> b!6521 m!8267))

(declare-fun m!8269 () Bool)

(assert (=> b!6521 m!8269))

(declare-fun m!8271 () Bool)

(assert (=> b!6521 m!8271))

(declare-fun m!8273 () Bool)

(assert (=> b!6521 m!8273))

(declare-fun m!8275 () Bool)

(assert (=> b!6521 m!8275))

(declare-fun m!8277 () Bool)

(assert (=> b!6517 m!8277))

(declare-fun m!8279 () Bool)

(assert (=> b!6518 m!8279))

(declare-fun m!8281 () Bool)

(assert (=> b!6515 m!8281))

(push 1)

(assert (not b!6521))

(assert (not b!6516))

(assert (not b!6514))

(assert (not start!1416))

(assert (not b!6522))

(assert (not b!6519))

(assert (not b!6517))

(assert (not b!6518))

(assert (not b!6515))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

