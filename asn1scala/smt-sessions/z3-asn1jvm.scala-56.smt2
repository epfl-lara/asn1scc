; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1096 () Bool)

(assert start!1096)

(declare-fun b!4534 () Bool)

(declare-fun e!2967 () Bool)

(declare-datatypes ((array!359 0))(
  ( (array!360 (arr!542 (Array (_ BitVec 32) (_ BitVec 8))) (size!152 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!282 0))(
  ( (BitStream!283 (buf!473 array!359) (currentByte!1452 (_ BitVec 32)) (currentBit!1447 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!282)

(declare-fun array_inv!147 (array!359) Bool)

(assert (=> b!4534 (= e!2967 (array_inv!147 (buf!473 thiss!1486)))))

(declare-fun b!4535 () Bool)

(declare-fun res!5882 () Bool)

(declare-fun e!2968 () Bool)

(assert (=> b!4535 (=> (not res!5882) (not e!2968))))

(declare-datatypes ((Unit!354 0))(
  ( (Unit!355) )
))
(declare-datatypes ((tuple2!556 0))(
  ( (tuple2!557 (_1!294 Unit!354) (_2!294 BitStream!282)) )
))
(declare-fun lt!5508 () tuple2!556)

(assert (=> b!4535 (= res!5882 (= (size!152 (buf!473 thiss!1486)) (size!152 (buf!473 (_2!294 lt!5508)))))))

(declare-fun b!4536 () Bool)

(declare-fun e!2971 () Bool)

(assert (=> b!4536 (= e!2971 e!2968)))

(declare-fun res!5879 () Bool)

(assert (=> b!4536 (=> (not res!5879) (not e!2968))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!4536 (= res!5879 (invariant!0 (currentBit!1447 (_2!294 lt!5508)) (currentByte!1452 (_2!294 lt!5508)) (size!152 (buf!473 (_2!294 lt!5508)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!359)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!282 array!359 (_ BitVec 64) (_ BitVec 64)) tuple2!556)

(assert (=> b!4536 (= lt!5508 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun res!5878 () Bool)

(assert (=> start!1096 (=> (not res!5878) (not e!2971))))

(assert (=> start!1096 (= res!5878 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!152 srcBuffer!6))))))))

(assert (=> start!1096 e!2971))

(assert (=> start!1096 true))

(assert (=> start!1096 (array_inv!147 srcBuffer!6)))

(declare-fun inv!12 (BitStream!282) Bool)

(assert (=> start!1096 (and (inv!12 thiss!1486) e!2967)))

(declare-fun b!4537 () Bool)

(declare-fun res!5883 () Bool)

(assert (=> b!4537 (=> (not res!5883) (not e!2971))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!4537 (= res!5883 (validate_offset_bits!1 ((_ sign_extend 32) (size!152 (buf!473 thiss!1486))) ((_ sign_extend 32) (currentByte!1452 thiss!1486)) ((_ sign_extend 32) (currentBit!1447 thiss!1486)) nBits!460))))

(declare-fun b!4538 () Bool)

(declare-fun res!5877 () Bool)

(assert (=> b!4538 (=> (not res!5877) (not e!2968))))

(declare-fun isPrefixOf!0 (BitStream!282 BitStream!282) Bool)

(assert (=> b!4538 (= res!5877 (isPrefixOf!0 thiss!1486 (_2!294 lt!5508)))))

(declare-fun b!4539 () Bool)

(declare-fun e!2970 () Bool)

(assert (=> b!4539 (= e!2970 (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)))))

(declare-fun b!4540 () Bool)

(declare-fun res!5880 () Bool)

(assert (=> b!4540 (=> (not res!5880) (not e!2968))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!4540 (= res!5880 (= (bitIndex!0 (size!152 (buf!473 (_2!294 lt!5508))) (currentByte!1452 (_2!294 lt!5508)) (currentBit!1447 (_2!294 lt!5508))) (bvadd (bitIndex!0 (size!152 (buf!473 thiss!1486)) (currentByte!1452 thiss!1486) (currentBit!1447 thiss!1486)) nBits!460)))))

(declare-fun b!4541 () Bool)

(declare-fun res!5881 () Bool)

(assert (=> b!4541 (=> res!5881 e!2970)))

(declare-datatypes ((List!52 0))(
  ( (Nil!49) (Cons!48 (h!167 Bool) (t!802 List!52)) )
))
(declare-fun lt!5509 () List!52)

(declare-fun byteArrayBitContentToList!0 (BitStream!282 array!359 (_ BitVec 64) (_ BitVec 64)) List!52)

(assert (=> b!4541 (= res!5881 (not (= lt!5509 (byteArrayBitContentToList!0 (_2!294 lt!5508) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!4542 () Bool)

(assert (=> b!4542 (= e!2968 (not e!2970))))

(declare-fun res!5884 () Bool)

(assert (=> b!4542 (=> res!5884 e!2970)))

(declare-datatypes ((tuple2!558 0))(
  ( (tuple2!559 (_1!295 array!359) (_2!295 BitStream!282)) )
))
(declare-fun lt!5510 () tuple2!558)

(assert (=> b!4542 (= res!5884 (not (= (byteArrayBitContentToList!0 (_2!294 lt!5508) (_1!295 lt!5510) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!5509)))))

(declare-datatypes ((tuple2!560 0))(
  ( (tuple2!561 (_1!296 BitStream!282) (_2!296 BitStream!282)) )
))
(declare-fun lt!5507 () tuple2!560)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!282 BitStream!282 (_ BitVec 64)) List!52)

(assert (=> b!4542 (= lt!5509 (bitStreamReadBitsIntoList!0 (_2!294 lt!5508) (_1!296 lt!5507) nBits!460))))

(declare-fun readBits!0 (BitStream!282 (_ BitVec 64)) tuple2!558)

(assert (=> b!4542 (= lt!5510 (readBits!0 (_1!296 lt!5507) nBits!460))))

(assert (=> b!4542 (validate_offset_bits!1 ((_ sign_extend 32) (size!152 (buf!473 (_2!294 lt!5508)))) ((_ sign_extend 32) (currentByte!1452 thiss!1486)) ((_ sign_extend 32) (currentBit!1447 thiss!1486)) nBits!460)))

(declare-fun lt!5506 () Unit!354)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!282 array!359 (_ BitVec 64)) Unit!354)

(assert (=> b!4542 (= lt!5506 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!473 (_2!294 lt!5508)) nBits!460))))

(declare-fun reader!0 (BitStream!282 BitStream!282) tuple2!560)

(assert (=> b!4542 (= lt!5507 (reader!0 thiss!1486 (_2!294 lt!5508)))))

(assert (= (and start!1096 res!5878) b!4537))

(assert (= (and b!4537 res!5883) b!4536))

(assert (= (and b!4536 res!5879) b!4535))

(assert (= (and b!4535 res!5882) b!4540))

(assert (= (and b!4540 res!5880) b!4538))

(assert (= (and b!4538 res!5877) b!4542))

(assert (= (and b!4542 (not res!5884)) b!4541))

(assert (= (and b!4541 (not res!5881)) b!4539))

(assert (= start!1096 b!4534))

(declare-fun m!5369 () Bool)

(assert (=> b!4538 m!5369))

(declare-fun m!5371 () Bool)

(assert (=> b!4541 m!5371))

(declare-fun m!5373 () Bool)

(assert (=> b!4537 m!5373))

(declare-fun m!5375 () Bool)

(assert (=> b!4540 m!5375))

(declare-fun m!5377 () Bool)

(assert (=> b!4540 m!5377))

(declare-fun m!5379 () Bool)

(assert (=> b!4534 m!5379))

(declare-fun m!5381 () Bool)

(assert (=> b!4536 m!5381))

(declare-fun m!5383 () Bool)

(assert (=> b!4536 m!5383))

(declare-fun m!5385 () Bool)

(assert (=> start!1096 m!5385))

(declare-fun m!5387 () Bool)

(assert (=> start!1096 m!5387))

(declare-fun m!5389 () Bool)

(assert (=> b!4542 m!5389))

(declare-fun m!5391 () Bool)

(assert (=> b!4542 m!5391))

(declare-fun m!5393 () Bool)

(assert (=> b!4542 m!5393))

(declare-fun m!5395 () Bool)

(assert (=> b!4542 m!5395))

(declare-fun m!5397 () Bool)

(assert (=> b!4542 m!5397))

(declare-fun m!5399 () Bool)

(assert (=> b!4542 m!5399))

(check-sat (not b!4538) (not b!4534) (not b!4536) (not b!4541) (not b!4540) (not start!1096) (not b!4537) (not b!4542))
(check-sat)
