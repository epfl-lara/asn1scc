; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1204 () Bool)

(assert start!1204)

(declare-fun b!5266 () Bool)

(declare-fun res!6465 () Bool)

(declare-fun e!3399 () Bool)

(assert (=> b!5266 (=> (not res!6465) (not e!3399))))

(declare-datatypes ((array!398 0))(
  ( (array!399 (arr!563 (Array (_ BitVec 32) (_ BitVec 8))) (size!170 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!318 0))(
  ( (BitStream!319 (buf!494 array!398) (currentByte!1479 (_ BitVec 32)) (currentBit!1474 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!318)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!5266 (= res!6465 (validate_offset_bits!1 ((_ sign_extend 32) (size!170 (buf!494 thiss!1486))) ((_ sign_extend 32) (currentByte!1479 thiss!1486)) ((_ sign_extend 32) (currentBit!1474 thiss!1486)) nBits!460))))

(declare-fun b!5267 () Bool)

(declare-fun res!6463 () Bool)

(declare-fun e!3401 () Bool)

(assert (=> b!5267 (=> (not res!6463) (not e!3401))))

(declare-datatypes ((Unit!414 0))(
  ( (Unit!415) )
))
(declare-datatypes ((tuple2!676 0))(
  ( (tuple2!677 (_1!357 Unit!414) (_2!357 BitStream!318)) )
))
(declare-fun lt!6583 () tuple2!676)

(declare-fun isPrefixOf!0 (BitStream!318 BitStream!318) Bool)

(assert (=> b!5267 (= res!6463 (isPrefixOf!0 thiss!1486 (_2!357 lt!6583)))))

(declare-fun b!5268 () Bool)

(declare-fun res!6459 () Bool)

(declare-fun e!3398 () Bool)

(assert (=> b!5268 (=> res!6459 e!3398)))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((List!70 0))(
  ( (Nil!67) (Cons!66 (h!185 Bool) (t!820 List!70)) )
))
(declare-fun lt!6582 () List!70)

(declare-fun srcBuffer!6 () array!398)

(declare-fun byteArrayBitContentToList!0 (BitStream!318 array!398 (_ BitVec 64) (_ BitVec 64)) List!70)

(assert (=> b!5268 (= res!6459 (not (= lt!6582 (byteArrayBitContentToList!0 (_2!357 lt!6583) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!5269 () Bool)

(assert (=> b!5269 (= e!3399 e!3401)))

(declare-fun res!6466 () Bool)

(assert (=> b!5269 (=> (not res!6466) (not e!3401))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!5269 (= res!6466 (invariant!0 (currentBit!1474 (_2!357 lt!6583)) (currentByte!1479 (_2!357 lt!6583)) (size!170 (buf!494 (_2!357 lt!6583)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!318 array!398 (_ BitVec 64) (_ BitVec 64)) tuple2!676)

(assert (=> b!5269 (= lt!6583 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!5271 () Bool)

(declare-fun res!6464 () Bool)

(assert (=> b!5271 (=> (not res!6464) (not e!3401))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!5271 (= res!6464 (= (bitIndex!0 (size!170 (buf!494 (_2!357 lt!6583))) (currentByte!1479 (_2!357 lt!6583)) (currentBit!1474 (_2!357 lt!6583))) (bvadd (bitIndex!0 (size!170 (buf!494 thiss!1486)) (currentByte!1479 thiss!1486) (currentBit!1474 thiss!1486)) nBits!460)))))

(declare-fun b!5272 () Bool)

(assert (=> b!5272 (= e!3398 true)))

(declare-datatypes ((tuple2!678 0))(
  ( (tuple2!679 (_1!358 array!398) (_2!358 BitStream!318)) )
))
(declare-fun lt!6584 () tuple2!678)

(declare-fun lt!6587 () Unit!414)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!318 array!398 array!398 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!414)

(assert (=> b!5272 (= lt!6587 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!357 lt!6583) srcBuffer!6 (_1!358 lt!6584) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!5273 () Bool)

(declare-fun res!6461 () Bool)

(assert (=> b!5273 (=> (not res!6461) (not e!3401))))

(assert (=> b!5273 (= res!6461 (= (size!170 (buf!494 thiss!1486)) (size!170 (buf!494 (_2!357 lt!6583)))))))

(declare-fun b!5274 () Bool)

(assert (=> b!5274 (= e!3401 (not e!3398))))

(declare-fun res!6460 () Bool)

(assert (=> b!5274 (=> res!6460 e!3398)))

(assert (=> b!5274 (= res!6460 (not (= (byteArrayBitContentToList!0 (_2!357 lt!6583) (_1!358 lt!6584) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!6582)))))

(declare-datatypes ((tuple2!680 0))(
  ( (tuple2!681 (_1!359 BitStream!318) (_2!359 BitStream!318)) )
))
(declare-fun lt!6585 () tuple2!680)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!318 BitStream!318 (_ BitVec 64)) List!70)

(assert (=> b!5274 (= lt!6582 (bitStreamReadBitsIntoList!0 (_2!357 lt!6583) (_1!359 lt!6585) nBits!460))))

(declare-fun readBits!0 (BitStream!318 (_ BitVec 64)) tuple2!678)

(assert (=> b!5274 (= lt!6584 (readBits!0 (_1!359 lt!6585) nBits!460))))

(assert (=> b!5274 (validate_offset_bits!1 ((_ sign_extend 32) (size!170 (buf!494 (_2!357 lt!6583)))) ((_ sign_extend 32) (currentByte!1479 thiss!1486)) ((_ sign_extend 32) (currentBit!1474 thiss!1486)) nBits!460)))

(declare-fun lt!6586 () Unit!414)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!318 array!398 (_ BitVec 64)) Unit!414)

(assert (=> b!5274 (= lt!6586 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!494 (_2!357 lt!6583)) nBits!460))))

(declare-fun reader!0 (BitStream!318 BitStream!318) tuple2!680)

(assert (=> b!5274 (= lt!6585 (reader!0 thiss!1486 (_2!357 lt!6583)))))

(declare-fun res!6462 () Bool)

(assert (=> start!1204 (=> (not res!6462) (not e!3399))))

(assert (=> start!1204 (= res!6462 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!170 srcBuffer!6))))))))

(assert (=> start!1204 e!3399))

(assert (=> start!1204 true))

(declare-fun array_inv!165 (array!398) Bool)

(assert (=> start!1204 (array_inv!165 srcBuffer!6)))

(declare-fun e!3400 () Bool)

(declare-fun inv!12 (BitStream!318) Bool)

(assert (=> start!1204 (and (inv!12 thiss!1486) e!3400)))

(declare-fun b!5270 () Bool)

(assert (=> b!5270 (= e!3400 (array_inv!165 (buf!494 thiss!1486)))))

(assert (= (and start!1204 res!6462) b!5266))

(assert (= (and b!5266 res!6465) b!5269))

(assert (= (and b!5269 res!6466) b!5273))

(assert (= (and b!5273 res!6461) b!5271))

(assert (= (and b!5271 res!6464) b!5267))

(assert (= (and b!5267 res!6463) b!5274))

(assert (= (and b!5274 (not res!6460)) b!5268))

(assert (= (and b!5268 (not res!6459)) b!5272))

(assert (= start!1204 b!5270))

(declare-fun m!6421 () Bool)

(assert (=> b!5274 m!6421))

(declare-fun m!6423 () Bool)

(assert (=> b!5274 m!6423))

(declare-fun m!6425 () Bool)

(assert (=> b!5274 m!6425))

(declare-fun m!6427 () Bool)

(assert (=> b!5274 m!6427))

(declare-fun m!6429 () Bool)

(assert (=> b!5274 m!6429))

(declare-fun m!6431 () Bool)

(assert (=> b!5274 m!6431))

(declare-fun m!6433 () Bool)

(assert (=> b!5268 m!6433))

(declare-fun m!6435 () Bool)

(assert (=> b!5271 m!6435))

(declare-fun m!6437 () Bool)

(assert (=> b!5271 m!6437))

(declare-fun m!6439 () Bool)

(assert (=> start!1204 m!6439))

(declare-fun m!6441 () Bool)

(assert (=> start!1204 m!6441))

(declare-fun m!6443 () Bool)

(assert (=> b!5270 m!6443))

(declare-fun m!6445 () Bool)

(assert (=> b!5267 m!6445))

(declare-fun m!6447 () Bool)

(assert (=> b!5272 m!6447))

(declare-fun m!6449 () Bool)

(assert (=> b!5269 m!6449))

(declare-fun m!6451 () Bool)

(assert (=> b!5269 m!6451))

(declare-fun m!6453 () Bool)

(assert (=> b!5266 m!6453))

(check-sat (not b!5271) (not b!5272) (not b!5269) (not b!5274) (not start!1204) (not b!5270) (not b!5266) (not b!5268) (not b!5267))
