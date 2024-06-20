; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1214 () Bool)

(assert start!1214)

(declare-fun b!5401 () Bool)

(declare-fun e!3488 () Bool)

(declare-fun e!3490 () Bool)

(assert (=> b!5401 (= e!3488 (not e!3490))))

(declare-fun res!6584 () Bool)

(assert (=> b!5401 (=> res!6584 e!3490)))

(declare-datatypes ((List!75 0))(
  ( (Nil!72) (Cons!71 (h!190 Bool) (t!825 List!75)) )
))
(declare-fun lt!6675 () List!75)

(declare-datatypes ((array!408 0))(
  ( (array!409 (arr!568 (Array (_ BitVec 32) (_ BitVec 8))) (size!175 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!328 0))(
  ( (BitStream!329 (buf!499 array!408) (currentByte!1484 (_ BitVec 32)) (currentBit!1479 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!424 0))(
  ( (Unit!425) )
))
(declare-datatypes ((tuple2!706 0))(
  ( (tuple2!707 (_1!372 Unit!424) (_2!372 BitStream!328)) )
))
(declare-fun lt!6677 () tuple2!706)

(declare-datatypes ((tuple2!708 0))(
  ( (tuple2!709 (_1!373 array!408) (_2!373 BitStream!328)) )
))
(declare-fun lt!6674 () tuple2!708)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun byteArrayBitContentToList!0 (BitStream!328 array!408 (_ BitVec 64) (_ BitVec 64)) List!75)

(assert (=> b!5401 (= res!6584 (not (= (byteArrayBitContentToList!0 (_2!372 lt!6677) (_1!373 lt!6674) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!6675)))))

(declare-datatypes ((tuple2!710 0))(
  ( (tuple2!711 (_1!374 BitStream!328) (_2!374 BitStream!328)) )
))
(declare-fun lt!6672 () tuple2!710)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!328 BitStream!328 (_ BitVec 64)) List!75)

(assert (=> b!5401 (= lt!6675 (bitStreamReadBitsIntoList!0 (_2!372 lt!6677) (_1!374 lt!6672) nBits!460))))

(declare-fun readBits!0 (BitStream!328 (_ BitVec 64)) tuple2!708)

(assert (=> b!5401 (= lt!6674 (readBits!0 (_1!374 lt!6672) nBits!460))))

(declare-fun thiss!1486 () BitStream!328)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!5401 (validate_offset_bits!1 ((_ sign_extend 32) (size!175 (buf!499 (_2!372 lt!6677)))) ((_ sign_extend 32) (currentByte!1484 thiss!1486)) ((_ sign_extend 32) (currentBit!1479 thiss!1486)) nBits!460)))

(declare-fun lt!6673 () Unit!424)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!328 array!408 (_ BitVec 64)) Unit!424)

(assert (=> b!5401 (= lt!6673 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!499 (_2!372 lt!6677)) nBits!460))))

(declare-fun reader!0 (BitStream!328 BitStream!328) tuple2!710)

(assert (=> b!5401 (= lt!6672 (reader!0 thiss!1486 (_2!372 lt!6677)))))

(declare-fun b!5402 () Bool)

(declare-fun res!6586 () Bool)

(assert (=> b!5402 (=> res!6586 e!3490)))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!408)

(assert (=> b!5402 (= res!6586 (not (= lt!6675 (byteArrayBitContentToList!0 (_2!372 lt!6677) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!5403 () Bool)

(declare-fun res!6583 () Bool)

(declare-fun e!3489 () Bool)

(assert (=> b!5403 (=> (not res!6583) (not e!3489))))

(assert (=> b!5403 (= res!6583 (validate_offset_bits!1 ((_ sign_extend 32) (size!175 (buf!499 thiss!1486))) ((_ sign_extend 32) (currentByte!1484 thiss!1486)) ((_ sign_extend 32) (currentBit!1479 thiss!1486)) nBits!460))))

(declare-fun b!5404 () Bool)

(assert (=> b!5404 (= e!3489 e!3488)))

(declare-fun res!6581 () Bool)

(assert (=> b!5404 (=> (not res!6581) (not e!3488))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!5404 (= res!6581 (invariant!0 (currentBit!1479 (_2!372 lt!6677)) (currentByte!1484 (_2!372 lt!6677)) (size!175 (buf!499 (_2!372 lt!6677)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!328 array!408 (_ BitVec 64) (_ BitVec 64)) tuple2!706)

(assert (=> b!5404 (= lt!6677 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!5405 () Bool)

(declare-fun res!6580 () Bool)

(assert (=> b!5405 (=> (not res!6580) (not e!3488))))

(assert (=> b!5405 (= res!6580 (= (size!175 (buf!499 thiss!1486)) (size!175 (buf!499 (_2!372 lt!6677)))))))

(declare-fun b!5406 () Bool)

(declare-fun res!6579 () Bool)

(assert (=> b!5406 (=> (not res!6579) (not e!3488))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!5406 (= res!6579 (= (bitIndex!0 (size!175 (buf!499 (_2!372 lt!6677))) (currentByte!1484 (_2!372 lt!6677)) (currentBit!1479 (_2!372 lt!6677))) (bvadd (bitIndex!0 (size!175 (buf!499 thiss!1486)) (currentByte!1484 thiss!1486) (currentBit!1479 thiss!1486)) nBits!460)))))

(declare-fun b!5407 () Bool)

(declare-fun res!6582 () Bool)

(assert (=> b!5407 (=> (not res!6582) (not e!3488))))

(declare-fun isPrefixOf!0 (BitStream!328 BitStream!328) Bool)

(assert (=> b!5407 (= res!6582 (isPrefixOf!0 thiss!1486 (_2!372 lt!6677)))))

(declare-fun b!5408 () Bool)

(assert (=> b!5408 (= e!3490 true)))

(declare-fun lt!6676 () Unit!424)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!328 array!408 array!408 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!424)

(assert (=> b!5408 (= lt!6676 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!372 lt!6677) srcBuffer!6 (_1!373 lt!6674) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!5409 () Bool)

(declare-fun e!3486 () Bool)

(declare-fun array_inv!170 (array!408) Bool)

(assert (=> b!5409 (= e!3486 (array_inv!170 (buf!499 thiss!1486)))))

(declare-fun res!6585 () Bool)

(assert (=> start!1214 (=> (not res!6585) (not e!3489))))

(assert (=> start!1214 (= res!6585 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!175 srcBuffer!6))))))))

(assert (=> start!1214 e!3489))

(assert (=> start!1214 true))

(assert (=> start!1214 (array_inv!170 srcBuffer!6)))

(declare-fun inv!12 (BitStream!328) Bool)

(assert (=> start!1214 (and (inv!12 thiss!1486) e!3486)))

(assert (= (and start!1214 res!6585) b!5403))

(assert (= (and b!5403 res!6583) b!5404))

(assert (= (and b!5404 res!6581) b!5405))

(assert (= (and b!5405 res!6580) b!5406))

(assert (= (and b!5406 res!6579) b!5407))

(assert (= (and b!5407 res!6582) b!5401))

(assert (= (and b!5401 (not res!6584)) b!5402))

(assert (= (and b!5402 (not res!6586)) b!5408))

(assert (= start!1214 b!5409))

(declare-fun m!6591 () Bool)

(assert (=> start!1214 m!6591))

(declare-fun m!6593 () Bool)

(assert (=> start!1214 m!6593))

(declare-fun m!6595 () Bool)

(assert (=> b!5409 m!6595))

(declare-fun m!6597 () Bool)

(assert (=> b!5401 m!6597))

(declare-fun m!6599 () Bool)

(assert (=> b!5401 m!6599))

(declare-fun m!6601 () Bool)

(assert (=> b!5401 m!6601))

(declare-fun m!6603 () Bool)

(assert (=> b!5401 m!6603))

(declare-fun m!6605 () Bool)

(assert (=> b!5401 m!6605))

(declare-fun m!6607 () Bool)

(assert (=> b!5401 m!6607))

(declare-fun m!6609 () Bool)

(assert (=> b!5407 m!6609))

(declare-fun m!6611 () Bool)

(assert (=> b!5403 m!6611))

(declare-fun m!6613 () Bool)

(assert (=> b!5406 m!6613))

(declare-fun m!6615 () Bool)

(assert (=> b!5406 m!6615))

(declare-fun m!6617 () Bool)

(assert (=> b!5408 m!6617))

(declare-fun m!6619 () Bool)

(assert (=> b!5404 m!6619))

(declare-fun m!6621 () Bool)

(assert (=> b!5404 m!6621))

(declare-fun m!6623 () Bool)

(assert (=> b!5402 m!6623))

(push 1)

(assert (not b!5409))

(assert (not b!5401))

(assert (not b!5402))

(assert (not b!5407))

(assert (not b!5406))

(assert (not b!5403))

(assert (not b!5404))

(assert (not start!1214))

(assert (not b!5408))

(check-sat)

(pop 1)

