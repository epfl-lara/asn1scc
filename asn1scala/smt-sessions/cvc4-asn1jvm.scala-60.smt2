; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1194 () Bool)

(assert start!1194)

(declare-fun res!6341 () Bool)

(declare-fun e!3311 () Bool)

(assert (=> start!1194 (=> (not res!6341) (not e!3311))))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!388 0))(
  ( (array!389 (arr!558 (Array (_ BitVec 32) (_ BitVec 8))) (size!165 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!388)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!1194 (= res!6341 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!165 srcBuffer!6))))))))

(assert (=> start!1194 e!3311))

(assert (=> start!1194 true))

(declare-fun array_inv!160 (array!388) Bool)

(assert (=> start!1194 (array_inv!160 srcBuffer!6)))

(declare-datatypes ((BitStream!308 0))(
  ( (BitStream!309 (buf!489 array!388) (currentByte!1474 (_ BitVec 32)) (currentBit!1469 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!308)

(declare-fun e!3310 () Bool)

(declare-fun inv!12 (BitStream!308) Bool)

(assert (=> start!1194 (and (inv!12 thiss!1486) e!3310)))

(declare-fun b!5131 () Bool)

(declare-fun e!3306 () Bool)

(assert (=> b!5131 (= e!3306 true)))

(declare-datatypes ((tuple2!646 0))(
  ( (tuple2!647 (_1!342 array!388) (_2!342 BitStream!308)) )
))
(declare-fun lt!6496 () tuple2!646)

(declare-datatypes ((Unit!404 0))(
  ( (Unit!405) )
))
(declare-fun lt!6492 () Unit!404)

(declare-datatypes ((tuple2!648 0))(
  ( (tuple2!649 (_1!343 Unit!404) (_2!343 BitStream!308)) )
))
(declare-fun lt!6493 () tuple2!648)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!308 array!388 array!388 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!404)

(assert (=> b!5131 (= lt!6492 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!343 lt!6493) srcBuffer!6 (_1!342 lt!6496) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!5132 () Bool)

(declare-fun e!3309 () Bool)

(assert (=> b!5132 (= e!3311 e!3309)))

(declare-fun res!6344 () Bool)

(assert (=> b!5132 (=> (not res!6344) (not e!3309))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!5132 (= res!6344 (invariant!0 (currentBit!1469 (_2!343 lt!6493)) (currentByte!1474 (_2!343 lt!6493)) (size!165 (buf!489 (_2!343 lt!6493)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!308 array!388 (_ BitVec 64) (_ BitVec 64)) tuple2!648)

(assert (=> b!5132 (= lt!6493 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!5133 () Bool)

(declare-fun res!6339 () Bool)

(assert (=> b!5133 (=> (not res!6339) (not e!3309))))

(declare-fun isPrefixOf!0 (BitStream!308 BitStream!308) Bool)

(assert (=> b!5133 (= res!6339 (isPrefixOf!0 thiss!1486 (_2!343 lt!6493)))))

(declare-fun b!5134 () Bool)

(assert (=> b!5134 (= e!3309 (not e!3306))))

(declare-fun res!6345 () Bool)

(assert (=> b!5134 (=> res!6345 e!3306)))

(declare-datatypes ((List!65 0))(
  ( (Nil!62) (Cons!61 (h!180 Bool) (t!815 List!65)) )
))
(declare-fun lt!6494 () List!65)

(declare-fun byteArrayBitContentToList!0 (BitStream!308 array!388 (_ BitVec 64) (_ BitVec 64)) List!65)

(assert (=> b!5134 (= res!6345 (not (= (byteArrayBitContentToList!0 (_2!343 lt!6493) (_1!342 lt!6496) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!6494)))))

(declare-datatypes ((tuple2!650 0))(
  ( (tuple2!651 (_1!344 BitStream!308) (_2!344 BitStream!308)) )
))
(declare-fun lt!6497 () tuple2!650)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!308 BitStream!308 (_ BitVec 64)) List!65)

(assert (=> b!5134 (= lt!6494 (bitStreamReadBitsIntoList!0 (_2!343 lt!6493) (_1!344 lt!6497) nBits!460))))

(declare-fun readBits!0 (BitStream!308 (_ BitVec 64)) tuple2!646)

(assert (=> b!5134 (= lt!6496 (readBits!0 (_1!344 lt!6497) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!5134 (validate_offset_bits!1 ((_ sign_extend 32) (size!165 (buf!489 (_2!343 lt!6493)))) ((_ sign_extend 32) (currentByte!1474 thiss!1486)) ((_ sign_extend 32) (currentBit!1469 thiss!1486)) nBits!460)))

(declare-fun lt!6495 () Unit!404)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!308 array!388 (_ BitVec 64)) Unit!404)

(assert (=> b!5134 (= lt!6495 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!489 (_2!343 lt!6493)) nBits!460))))

(declare-fun reader!0 (BitStream!308 BitStream!308) tuple2!650)

(assert (=> b!5134 (= lt!6497 (reader!0 thiss!1486 (_2!343 lt!6493)))))

(declare-fun b!5135 () Bool)

(declare-fun res!6342 () Bool)

(assert (=> b!5135 (=> (not res!6342) (not e!3311))))

(assert (=> b!5135 (= res!6342 (validate_offset_bits!1 ((_ sign_extend 32) (size!165 (buf!489 thiss!1486))) ((_ sign_extend 32) (currentByte!1474 thiss!1486)) ((_ sign_extend 32) (currentBit!1469 thiss!1486)) nBits!460))))

(declare-fun b!5136 () Bool)

(assert (=> b!5136 (= e!3310 (array_inv!160 (buf!489 thiss!1486)))))

(declare-fun b!5137 () Bool)

(declare-fun res!6346 () Bool)

(assert (=> b!5137 (=> (not res!6346) (not e!3309))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!5137 (= res!6346 (= (bitIndex!0 (size!165 (buf!489 (_2!343 lt!6493))) (currentByte!1474 (_2!343 lt!6493)) (currentBit!1469 (_2!343 lt!6493))) (bvadd (bitIndex!0 (size!165 (buf!489 thiss!1486)) (currentByte!1474 thiss!1486) (currentBit!1469 thiss!1486)) nBits!460)))))

(declare-fun b!5138 () Bool)

(declare-fun res!6343 () Bool)

(assert (=> b!5138 (=> (not res!6343) (not e!3309))))

(assert (=> b!5138 (= res!6343 (= (size!165 (buf!489 thiss!1486)) (size!165 (buf!489 (_2!343 lt!6493)))))))

(declare-fun b!5139 () Bool)

(declare-fun res!6340 () Bool)

(assert (=> b!5139 (=> res!6340 e!3306)))

(assert (=> b!5139 (= res!6340 (not (= lt!6494 (byteArrayBitContentToList!0 (_2!343 lt!6493) srcBuffer!6 from!367 nBits!460))))))

(assert (= (and start!1194 res!6341) b!5135))

(assert (= (and b!5135 res!6342) b!5132))

(assert (= (and b!5132 res!6344) b!5138))

(assert (= (and b!5138 res!6343) b!5137))

(assert (= (and b!5137 res!6346) b!5133))

(assert (= (and b!5133 res!6339) b!5134))

(assert (= (and b!5134 (not res!6345)) b!5139))

(assert (= (and b!5139 (not res!6340)) b!5131))

(assert (= start!1194 b!5136))

(declare-fun m!6251 () Bool)

(assert (=> b!5131 m!6251))

(declare-fun m!6253 () Bool)

(assert (=> b!5136 m!6253))

(declare-fun m!6255 () Bool)

(assert (=> b!5133 m!6255))

(declare-fun m!6257 () Bool)

(assert (=> b!5137 m!6257))

(declare-fun m!6259 () Bool)

(assert (=> b!5137 m!6259))

(declare-fun m!6261 () Bool)

(assert (=> b!5135 m!6261))

(declare-fun m!6263 () Bool)

(assert (=> b!5134 m!6263))

(declare-fun m!6265 () Bool)

(assert (=> b!5134 m!6265))

(declare-fun m!6267 () Bool)

(assert (=> b!5134 m!6267))

(declare-fun m!6269 () Bool)

(assert (=> b!5134 m!6269))

(declare-fun m!6271 () Bool)

(assert (=> b!5134 m!6271))

(declare-fun m!6273 () Bool)

(assert (=> b!5134 m!6273))

(declare-fun m!6275 () Bool)

(assert (=> b!5139 m!6275))

(declare-fun m!6277 () Bool)

(assert (=> start!1194 m!6277))

(declare-fun m!6279 () Bool)

(assert (=> start!1194 m!6279))

(declare-fun m!6281 () Bool)

(assert (=> b!5132 m!6281))

(declare-fun m!6283 () Bool)

(assert (=> b!5132 m!6283))

(push 1)

(assert (not b!5131))

(assert (not b!5132))

(assert (not b!5136))

(assert (not b!5139))

(assert (not b!5133))

(assert (not b!5137))

(assert (not start!1194))

(assert (not b!5134))

(assert (not b!5135))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

