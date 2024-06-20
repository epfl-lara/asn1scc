; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1198 () Bool)

(assert start!1198)

(declare-fun b!5185 () Bool)

(declare-fun res!6392 () Bool)

(declare-fun e!3347 () Bool)

(assert (=> b!5185 (=> (not res!6392) (not e!3347))))

(declare-datatypes ((array!392 0))(
  ( (array!393 (arr!560 (Array (_ BitVec 32) (_ BitVec 8))) (size!167 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!312 0))(
  ( (BitStream!313 (buf!491 array!392) (currentByte!1476 (_ BitVec 32)) (currentBit!1471 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!408 0))(
  ( (Unit!409) )
))
(declare-datatypes ((tuple2!658 0))(
  ( (tuple2!659 (_1!348 Unit!408) (_2!348 BitStream!312)) )
))
(declare-fun lt!6528 () tuple2!658)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun thiss!1486 () BitStream!312)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!5185 (= res!6392 (= (bitIndex!0 (size!167 (buf!491 (_2!348 lt!6528))) (currentByte!1476 (_2!348 lt!6528)) (currentBit!1471 (_2!348 lt!6528))) (bvadd (bitIndex!0 (size!167 (buf!491 thiss!1486)) (currentByte!1476 thiss!1486) (currentBit!1471 thiss!1486)) nBits!460)))))

(declare-fun b!5186 () Bool)

(declare-fun res!6388 () Bool)

(assert (=> b!5186 (=> (not res!6388) (not e!3347))))

(assert (=> b!5186 (= res!6388 (= (size!167 (buf!491 thiss!1486)) (size!167 (buf!491 (_2!348 lt!6528)))))))

(declare-fun b!5187 () Bool)

(declare-fun res!6394 () Bool)

(assert (=> b!5187 (=> (not res!6394) (not e!3347))))

(declare-fun isPrefixOf!0 (BitStream!312 BitStream!312) Bool)

(assert (=> b!5187 (= res!6394 (isPrefixOf!0 thiss!1486 (_2!348 lt!6528)))))

(declare-fun b!5188 () Bool)

(declare-fun e!3342 () Bool)

(declare-fun array_inv!162 (array!392) Bool)

(assert (=> b!5188 (= e!3342 (array_inv!162 (buf!491 thiss!1486)))))

(declare-fun b!5189 () Bool)

(declare-fun e!3346 () Bool)

(assert (=> b!5189 (= e!3346 e!3347)))

(declare-fun res!6389 () Bool)

(assert (=> b!5189 (=> (not res!6389) (not e!3347))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!5189 (= res!6389 (invariant!0 (currentBit!1471 (_2!348 lt!6528)) (currentByte!1476 (_2!348 lt!6528)) (size!167 (buf!491 (_2!348 lt!6528)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!392)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!312 array!392 (_ BitVec 64) (_ BitVec 64)) tuple2!658)

(assert (=> b!5189 (= lt!6528 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun res!6393 () Bool)

(assert (=> start!1198 (=> (not res!6393) (not e!3346))))

(assert (=> start!1198 (= res!6393 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!167 srcBuffer!6))))))))

(assert (=> start!1198 e!3346))

(assert (=> start!1198 true))

(assert (=> start!1198 (array_inv!162 srcBuffer!6)))

(declare-fun inv!12 (BitStream!312) Bool)

(assert (=> start!1198 (and (inv!12 thiss!1486) e!3342)))

(declare-fun b!5190 () Bool)

(declare-fun e!3345 () Bool)

(assert (=> b!5190 (= e!3345 true)))

(declare-datatypes ((tuple2!660 0))(
  ( (tuple2!661 (_1!349 array!392) (_2!349 BitStream!312)) )
))
(declare-fun lt!6530 () tuple2!660)

(declare-fun lt!6532 () Unit!408)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!312 array!392 array!392 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!408)

(assert (=> b!5190 (= lt!6532 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!348 lt!6528) srcBuffer!6 (_1!349 lt!6530) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!5191 () Bool)

(declare-fun res!6390 () Bool)

(assert (=> b!5191 (=> (not res!6390) (not e!3346))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!5191 (= res!6390 (validate_offset_bits!1 ((_ sign_extend 32) (size!167 (buf!491 thiss!1486))) ((_ sign_extend 32) (currentByte!1476 thiss!1486)) ((_ sign_extend 32) (currentBit!1471 thiss!1486)) nBits!460))))

(declare-fun b!5192 () Bool)

(declare-fun res!6391 () Bool)

(assert (=> b!5192 (=> res!6391 e!3345)))

(declare-datatypes ((List!67 0))(
  ( (Nil!64) (Cons!63 (h!182 Bool) (t!817 List!67)) )
))
(declare-fun lt!6529 () List!67)

(declare-fun byteArrayBitContentToList!0 (BitStream!312 array!392 (_ BitVec 64) (_ BitVec 64)) List!67)

(assert (=> b!5192 (= res!6391 (not (= lt!6529 (byteArrayBitContentToList!0 (_2!348 lt!6528) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!5193 () Bool)

(assert (=> b!5193 (= e!3347 (not e!3345))))

(declare-fun res!6387 () Bool)

(assert (=> b!5193 (=> res!6387 e!3345)))

(assert (=> b!5193 (= res!6387 (not (= (byteArrayBitContentToList!0 (_2!348 lt!6528) (_1!349 lt!6530) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!6529)))))

(declare-datatypes ((tuple2!662 0))(
  ( (tuple2!663 (_1!350 BitStream!312) (_2!350 BitStream!312)) )
))
(declare-fun lt!6531 () tuple2!662)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!312 BitStream!312 (_ BitVec 64)) List!67)

(assert (=> b!5193 (= lt!6529 (bitStreamReadBitsIntoList!0 (_2!348 lt!6528) (_1!350 lt!6531) nBits!460))))

(declare-fun readBits!0 (BitStream!312 (_ BitVec 64)) tuple2!660)

(assert (=> b!5193 (= lt!6530 (readBits!0 (_1!350 lt!6531) nBits!460))))

(assert (=> b!5193 (validate_offset_bits!1 ((_ sign_extend 32) (size!167 (buf!491 (_2!348 lt!6528)))) ((_ sign_extend 32) (currentByte!1476 thiss!1486)) ((_ sign_extend 32) (currentBit!1471 thiss!1486)) nBits!460)))

(declare-fun lt!6533 () Unit!408)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!312 array!392 (_ BitVec 64)) Unit!408)

(assert (=> b!5193 (= lt!6533 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!491 (_2!348 lt!6528)) nBits!460))))

(declare-fun reader!0 (BitStream!312 BitStream!312) tuple2!662)

(assert (=> b!5193 (= lt!6531 (reader!0 thiss!1486 (_2!348 lt!6528)))))

(assert (= (and start!1198 res!6393) b!5191))

(assert (= (and b!5191 res!6390) b!5189))

(assert (= (and b!5189 res!6389) b!5186))

(assert (= (and b!5186 res!6388) b!5185))

(assert (= (and b!5185 res!6392) b!5187))

(assert (= (and b!5187 res!6394) b!5193))

(assert (= (and b!5193 (not res!6387)) b!5192))

(assert (= (and b!5192 (not res!6391)) b!5190))

(assert (= start!1198 b!5188))

(declare-fun m!6319 () Bool)

(assert (=> b!5185 m!6319))

(declare-fun m!6321 () Bool)

(assert (=> b!5185 m!6321))

(declare-fun m!6323 () Bool)

(assert (=> b!5190 m!6323))

(declare-fun m!6325 () Bool)

(assert (=> start!1198 m!6325))

(declare-fun m!6327 () Bool)

(assert (=> start!1198 m!6327))

(declare-fun m!6329 () Bool)

(assert (=> b!5187 m!6329))

(declare-fun m!6331 () Bool)

(assert (=> b!5193 m!6331))

(declare-fun m!6333 () Bool)

(assert (=> b!5193 m!6333))

(declare-fun m!6335 () Bool)

(assert (=> b!5193 m!6335))

(declare-fun m!6337 () Bool)

(assert (=> b!5193 m!6337))

(declare-fun m!6339 () Bool)

(assert (=> b!5193 m!6339))

(declare-fun m!6341 () Bool)

(assert (=> b!5193 m!6341))

(declare-fun m!6343 () Bool)

(assert (=> b!5188 m!6343))

(declare-fun m!6345 () Bool)

(assert (=> b!5192 m!6345))

(declare-fun m!6347 () Bool)

(assert (=> b!5189 m!6347))

(declare-fun m!6349 () Bool)

(assert (=> b!5189 m!6349))

(declare-fun m!6351 () Bool)

(assert (=> b!5191 m!6351))

(check-sat (not start!1198) (not b!5188) (not b!5189) (not b!5193) (not b!5192) (not b!5191) (not b!5190) (not b!5185) (not b!5187))
