; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1196 () Bool)

(assert start!1196)

(declare-fun b!5158 () Bool)

(declare-fun e!3324 () Bool)

(declare-fun e!3328 () Bool)

(assert (=> b!5158 (= e!3324 (not e!3328))))

(declare-fun res!6363 () Bool)

(assert (=> b!5158 (=> res!6363 e!3328)))

(declare-datatypes ((array!390 0))(
  ( (array!391 (arr!559 (Array (_ BitVec 32) (_ BitVec 8))) (size!166 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!310 0))(
  ( (BitStream!311 (buf!490 array!390) (currentByte!1475 (_ BitVec 32)) (currentBit!1470 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!406 0))(
  ( (Unit!407) )
))
(declare-datatypes ((tuple2!652 0))(
  ( (tuple2!653 (_1!345 Unit!406) (_2!345 BitStream!310)) )
))
(declare-fun lt!6511 () tuple2!652)

(declare-datatypes ((tuple2!654 0))(
  ( (tuple2!655 (_1!346 array!390) (_2!346 BitStream!310)) )
))
(declare-fun lt!6513 () tuple2!654)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-datatypes ((List!66 0))(
  ( (Nil!63) (Cons!62 (h!181 Bool) (t!816 List!66)) )
))
(declare-fun lt!6514 () List!66)

(declare-fun byteArrayBitContentToList!0 (BitStream!310 array!390 (_ BitVec 64) (_ BitVec 64)) List!66)

(assert (=> b!5158 (= res!6363 (not (= (byteArrayBitContentToList!0 (_2!345 lt!6511) (_1!346 lt!6513) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!6514)))))

(declare-datatypes ((tuple2!656 0))(
  ( (tuple2!657 (_1!347 BitStream!310) (_2!347 BitStream!310)) )
))
(declare-fun lt!6510 () tuple2!656)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!310 BitStream!310 (_ BitVec 64)) List!66)

(assert (=> b!5158 (= lt!6514 (bitStreamReadBitsIntoList!0 (_2!345 lt!6511) (_1!347 lt!6510) nBits!460))))

(declare-fun readBits!0 (BitStream!310 (_ BitVec 64)) tuple2!654)

(assert (=> b!5158 (= lt!6513 (readBits!0 (_1!347 lt!6510) nBits!460))))

(declare-fun thiss!1486 () BitStream!310)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!5158 (validate_offset_bits!1 ((_ sign_extend 32) (size!166 (buf!490 (_2!345 lt!6511)))) ((_ sign_extend 32) (currentByte!1475 thiss!1486)) ((_ sign_extend 32) (currentBit!1470 thiss!1486)) nBits!460)))

(declare-fun lt!6515 () Unit!406)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!310 array!390 (_ BitVec 64)) Unit!406)

(assert (=> b!5158 (= lt!6515 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!490 (_2!345 lt!6511)) nBits!460))))

(declare-fun reader!0 (BitStream!310 BitStream!310) tuple2!656)

(assert (=> b!5158 (= lt!6510 (reader!0 thiss!1486 (_2!345 lt!6511)))))

(declare-fun b!5159 () Bool)

(declare-fun res!6368 () Bool)

(declare-fun e!3329 () Bool)

(assert (=> b!5159 (=> (not res!6368) (not e!3329))))

(assert (=> b!5159 (= res!6368 (validate_offset_bits!1 ((_ sign_extend 32) (size!166 (buf!490 thiss!1486))) ((_ sign_extend 32) (currentByte!1475 thiss!1486)) ((_ sign_extend 32) (currentBit!1470 thiss!1486)) nBits!460))))

(declare-fun b!5160 () Bool)

(declare-fun res!6369 () Bool)

(assert (=> b!5160 (=> res!6369 e!3328)))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!390)

(assert (=> b!5160 (= res!6369 (not (= lt!6514 (byteArrayBitContentToList!0 (_2!345 lt!6511) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!5161 () Bool)

(assert (=> b!5161 (= e!3329 e!3324)))

(declare-fun res!6365 () Bool)

(assert (=> b!5161 (=> (not res!6365) (not e!3324))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!5161 (= res!6365 (invariant!0 (currentBit!1470 (_2!345 lt!6511)) (currentByte!1475 (_2!345 lt!6511)) (size!166 (buf!490 (_2!345 lt!6511)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!310 array!390 (_ BitVec 64) (_ BitVec 64)) tuple2!652)

(assert (=> b!5161 (= lt!6511 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!5162 () Bool)

(declare-fun res!6367 () Bool)

(assert (=> b!5162 (=> (not res!6367) (not e!3324))))

(declare-fun isPrefixOf!0 (BitStream!310 BitStream!310) Bool)

(assert (=> b!5162 (= res!6367 (isPrefixOf!0 thiss!1486 (_2!345 lt!6511)))))

(declare-fun res!6370 () Bool)

(assert (=> start!1196 (=> (not res!6370) (not e!3329))))

(assert (=> start!1196 (= res!6370 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!166 srcBuffer!6))))))))

(assert (=> start!1196 e!3329))

(assert (=> start!1196 true))

(declare-fun array_inv!161 (array!390) Bool)

(assert (=> start!1196 (array_inv!161 srcBuffer!6)))

(declare-fun e!3325 () Bool)

(declare-fun inv!12 (BitStream!310) Bool)

(assert (=> start!1196 (and (inv!12 thiss!1486) e!3325)))

(declare-fun b!5163 () Bool)

(assert (=> b!5163 (= e!3325 (array_inv!161 (buf!490 thiss!1486)))))

(declare-fun b!5164 () Bool)

(declare-fun res!6364 () Bool)

(assert (=> b!5164 (=> (not res!6364) (not e!3324))))

(assert (=> b!5164 (= res!6364 (= (size!166 (buf!490 thiss!1486)) (size!166 (buf!490 (_2!345 lt!6511)))))))

(declare-fun b!5165 () Bool)

(declare-fun res!6366 () Bool)

(assert (=> b!5165 (=> (not res!6366) (not e!3324))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!5165 (= res!6366 (= (bitIndex!0 (size!166 (buf!490 (_2!345 lt!6511))) (currentByte!1475 (_2!345 lt!6511)) (currentBit!1470 (_2!345 lt!6511))) (bvadd (bitIndex!0 (size!166 (buf!490 thiss!1486)) (currentByte!1475 thiss!1486) (currentBit!1470 thiss!1486)) nBits!460)))))

(declare-fun b!5166 () Bool)

(assert (=> b!5166 (= e!3328 true)))

(declare-fun lt!6512 () Unit!406)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!310 array!390 array!390 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!406)

(assert (=> b!5166 (= lt!6512 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!345 lt!6511) srcBuffer!6 (_1!346 lt!6513) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (= (and start!1196 res!6370) b!5159))

(assert (= (and b!5159 res!6368) b!5161))

(assert (= (and b!5161 res!6365) b!5164))

(assert (= (and b!5164 res!6364) b!5165))

(assert (= (and b!5165 res!6366) b!5162))

(assert (= (and b!5162 res!6367) b!5158))

(assert (= (and b!5158 (not res!6363)) b!5160))

(assert (= (and b!5160 (not res!6369)) b!5166))

(assert (= start!1196 b!5163))

(declare-fun m!6285 () Bool)

(assert (=> b!5162 m!6285))

(declare-fun m!6287 () Bool)

(assert (=> start!1196 m!6287))

(declare-fun m!6289 () Bool)

(assert (=> start!1196 m!6289))

(declare-fun m!6291 () Bool)

(assert (=> b!5160 m!6291))

(declare-fun m!6293 () Bool)

(assert (=> b!5161 m!6293))

(declare-fun m!6295 () Bool)

(assert (=> b!5161 m!6295))

(declare-fun m!6297 () Bool)

(assert (=> b!5158 m!6297))

(declare-fun m!6299 () Bool)

(assert (=> b!5158 m!6299))

(declare-fun m!6301 () Bool)

(assert (=> b!5158 m!6301))

(declare-fun m!6303 () Bool)

(assert (=> b!5158 m!6303))

(declare-fun m!6305 () Bool)

(assert (=> b!5158 m!6305))

(declare-fun m!6307 () Bool)

(assert (=> b!5158 m!6307))

(declare-fun m!6309 () Bool)

(assert (=> b!5166 m!6309))

(declare-fun m!6311 () Bool)

(assert (=> b!5165 m!6311))

(declare-fun m!6313 () Bool)

(assert (=> b!5165 m!6313))

(declare-fun m!6315 () Bool)

(assert (=> b!5159 m!6315))

(declare-fun m!6317 () Bool)

(assert (=> b!5163 m!6317))

(push 1)

(assert (not b!5165))

(assert (not b!5161))

(assert (not start!1196))

(assert (not b!5160))

(assert (not b!5163))

(assert (not b!5159))

(assert (not b!5162))

(assert (not b!5166))

(assert (not b!5158))

(check-sat)

