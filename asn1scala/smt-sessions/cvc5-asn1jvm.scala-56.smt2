; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1094 () Bool)

(assert start!1094)

(declare-fun b!4507 () Bool)

(declare-fun e!2952 () Bool)

(declare-fun e!2954 () Bool)

(assert (=> b!4507 (= e!2952 e!2954)))

(declare-fun res!5858 () Bool)

(assert (=> b!4507 (=> (not res!5858) (not e!2954))))

(declare-datatypes ((array!357 0))(
  ( (array!358 (arr!541 (Array (_ BitVec 32) (_ BitVec 8))) (size!151 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!280 0))(
  ( (BitStream!281 (buf!472 array!357) (currentByte!1451 (_ BitVec 32)) (currentBit!1446 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!352 0))(
  ( (Unit!353) )
))
(declare-datatypes ((tuple2!550 0))(
  ( (tuple2!551 (_1!291 Unit!352) (_2!291 BitStream!280)) )
))
(declare-fun lt!5494 () tuple2!550)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!4507 (= res!5858 (invariant!0 (currentBit!1446 (_2!291 lt!5494)) (currentByte!1451 (_2!291 lt!5494)) (size!151 (buf!472 (_2!291 lt!5494)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!357)

(declare-fun thiss!1486 () BitStream!280)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!280 array!357 (_ BitVec 64) (_ BitVec 64)) tuple2!550)

(assert (=> b!4507 (= lt!5494 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!4508 () Bool)

(declare-fun e!2949 () Bool)

(declare-fun array_inv!146 (array!357) Bool)

(assert (=> b!4508 (= e!2949 (array_inv!146 (buf!472 thiss!1486)))))

(declare-fun b!4510 () Bool)

(declare-fun e!2951 () Bool)

(assert (=> b!4510 (= e!2951 (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)))))

(declare-fun b!4511 () Bool)

(declare-fun res!5853 () Bool)

(assert (=> b!4511 (=> (not res!5853) (not e!2954))))

(declare-fun isPrefixOf!0 (BitStream!280 BitStream!280) Bool)

(assert (=> b!4511 (= res!5853 (isPrefixOf!0 thiss!1486 (_2!291 lt!5494)))))

(declare-fun b!4512 () Bool)

(declare-fun res!5855 () Bool)

(assert (=> b!4512 (=> (not res!5855) (not e!2954))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!4512 (= res!5855 (= (bitIndex!0 (size!151 (buf!472 (_2!291 lt!5494))) (currentByte!1451 (_2!291 lt!5494)) (currentBit!1446 (_2!291 lt!5494))) (bvadd (bitIndex!0 (size!151 (buf!472 thiss!1486)) (currentByte!1451 thiss!1486) (currentBit!1446 thiss!1486)) nBits!460)))))

(declare-fun b!4513 () Bool)

(declare-fun res!5859 () Bool)

(assert (=> b!4513 (=> (not res!5859) (not e!2954))))

(assert (=> b!4513 (= res!5859 (= (size!151 (buf!472 thiss!1486)) (size!151 (buf!472 (_2!291 lt!5494)))))))

(declare-fun b!4514 () Bool)

(declare-fun res!5854 () Bool)

(assert (=> b!4514 (=> (not res!5854) (not e!2952))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!4514 (= res!5854 (validate_offset_bits!1 ((_ sign_extend 32) (size!151 (buf!472 thiss!1486))) ((_ sign_extend 32) (currentByte!1451 thiss!1486)) ((_ sign_extend 32) (currentBit!1446 thiss!1486)) nBits!460))))

(declare-fun b!4515 () Bool)

(declare-fun res!5860 () Bool)

(assert (=> b!4515 (=> res!5860 e!2951)))

(declare-datatypes ((List!51 0))(
  ( (Nil!48) (Cons!47 (h!166 Bool) (t!801 List!51)) )
))
(declare-fun lt!5493 () List!51)

(declare-fun byteArrayBitContentToList!0 (BitStream!280 array!357 (_ BitVec 64) (_ BitVec 64)) List!51)

(assert (=> b!4515 (= res!5860 (not (= lt!5493 (byteArrayBitContentToList!0 (_2!291 lt!5494) srcBuffer!6 from!367 nBits!460))))))

(declare-fun res!5857 () Bool)

(assert (=> start!1094 (=> (not res!5857) (not e!2952))))

(assert (=> start!1094 (= res!5857 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!151 srcBuffer!6))))))))

(assert (=> start!1094 e!2952))

(assert (=> start!1094 true))

(assert (=> start!1094 (array_inv!146 srcBuffer!6)))

(declare-fun inv!12 (BitStream!280) Bool)

(assert (=> start!1094 (and (inv!12 thiss!1486) e!2949)))

(declare-fun b!4509 () Bool)

(assert (=> b!4509 (= e!2954 (not e!2951))))

(declare-fun res!5856 () Bool)

(assert (=> b!4509 (=> res!5856 e!2951)))

(declare-datatypes ((tuple2!552 0))(
  ( (tuple2!553 (_1!292 array!357) (_2!292 BitStream!280)) )
))
(declare-fun lt!5491 () tuple2!552)

(assert (=> b!4509 (= res!5856 (not (= (byteArrayBitContentToList!0 (_2!291 lt!5494) (_1!292 lt!5491) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!5493)))))

(declare-datatypes ((tuple2!554 0))(
  ( (tuple2!555 (_1!293 BitStream!280) (_2!293 BitStream!280)) )
))
(declare-fun lt!5492 () tuple2!554)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!280 BitStream!280 (_ BitVec 64)) List!51)

(assert (=> b!4509 (= lt!5493 (bitStreamReadBitsIntoList!0 (_2!291 lt!5494) (_1!293 lt!5492) nBits!460))))

(declare-fun readBits!0 (BitStream!280 (_ BitVec 64)) tuple2!552)

(assert (=> b!4509 (= lt!5491 (readBits!0 (_1!293 lt!5492) nBits!460))))

(assert (=> b!4509 (validate_offset_bits!1 ((_ sign_extend 32) (size!151 (buf!472 (_2!291 lt!5494)))) ((_ sign_extend 32) (currentByte!1451 thiss!1486)) ((_ sign_extend 32) (currentBit!1446 thiss!1486)) nBits!460)))

(declare-fun lt!5495 () Unit!352)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!280 array!357 (_ BitVec 64)) Unit!352)

(assert (=> b!4509 (= lt!5495 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!472 (_2!291 lt!5494)) nBits!460))))

(declare-fun reader!0 (BitStream!280 BitStream!280) tuple2!554)

(assert (=> b!4509 (= lt!5492 (reader!0 thiss!1486 (_2!291 lt!5494)))))

(assert (= (and start!1094 res!5857) b!4514))

(assert (= (and b!4514 res!5854) b!4507))

(assert (= (and b!4507 res!5858) b!4513))

(assert (= (and b!4513 res!5859) b!4512))

(assert (= (and b!4512 res!5855) b!4511))

(assert (= (and b!4511 res!5853) b!4509))

(assert (= (and b!4509 (not res!5856)) b!4515))

(assert (= (and b!4515 (not res!5860)) b!4510))

(assert (= start!1094 b!4508))

(declare-fun m!5337 () Bool)

(assert (=> b!4511 m!5337))

(declare-fun m!5339 () Bool)

(assert (=> start!1094 m!5339))

(declare-fun m!5341 () Bool)

(assert (=> start!1094 m!5341))

(declare-fun m!5343 () Bool)

(assert (=> b!4512 m!5343))

(declare-fun m!5345 () Bool)

(assert (=> b!4512 m!5345))

(declare-fun m!5347 () Bool)

(assert (=> b!4514 m!5347))

(declare-fun m!5349 () Bool)

(assert (=> b!4508 m!5349))

(declare-fun m!5351 () Bool)

(assert (=> b!4509 m!5351))

(declare-fun m!5353 () Bool)

(assert (=> b!4509 m!5353))

(declare-fun m!5355 () Bool)

(assert (=> b!4509 m!5355))

(declare-fun m!5357 () Bool)

(assert (=> b!4509 m!5357))

(declare-fun m!5359 () Bool)

(assert (=> b!4509 m!5359))

(declare-fun m!5361 () Bool)

(assert (=> b!4509 m!5361))

(declare-fun m!5363 () Bool)

(assert (=> b!4515 m!5363))

(declare-fun m!5365 () Bool)

(assert (=> b!4507 m!5365))

(declare-fun m!5367 () Bool)

(assert (=> b!4507 m!5367))

(push 1)

(assert (not b!4507))

(assert (not start!1094))

(assert (not b!4512))

(assert (not b!4514))

(assert (not b!4515))

(assert (not b!4509))

(assert (not b!4508))

(assert (not b!4511))

(check-sat)

(pop 1)

(push 1)

(check-sat)

