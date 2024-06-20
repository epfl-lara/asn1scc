; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1546 () Bool)

(assert start!1546)

(declare-fun b!7458 () Bool)

(declare-fun e!4673 () Bool)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> b!7458 (= e!4673 (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)))))

(declare-fun b!7459 () Bool)

(declare-fun res!8227 () Bool)

(declare-fun e!4674 () Bool)

(assert (=> b!7459 (=> res!8227 e!4674)))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((List!118 0))(
  ( (Nil!115) (Cons!114 (h!233 Bool) (t!868 List!118)) )
))
(declare-fun lt!9771 () List!118)

(declare-datatypes ((array!503 0))(
  ( (array!504 (arr!620 (Array (_ BitVec 32) (_ BitVec 8))) (size!218 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!414 0))(
  ( (BitStream!415 (buf!551 array!503) (currentByte!1554 (_ BitVec 32)) (currentBit!1549 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!582 0))(
  ( (Unit!583) )
))
(declare-datatypes ((tuple2!1000 0))(
  ( (tuple2!1001 (_1!528 Unit!582) (_2!528 BitStream!414)) )
))
(declare-fun lt!9770 () tuple2!1000)

(declare-fun srcBuffer!6 () array!503)

(declare-fun byteArrayBitContentToList!0 (BitStream!414 array!503 (_ BitVec 64) (_ BitVec 64)) List!118)

(assert (=> b!7459 (= res!8227 (not (= lt!9771 (byteArrayBitContentToList!0 (_2!528 lt!9770) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!7460 () Bool)

(declare-fun res!8223 () Bool)

(declare-fun e!4676 () Bool)

(assert (=> b!7460 (=> (not res!8223) (not e!4676))))

(declare-fun thiss!1486 () BitStream!414)

(assert (=> b!7460 (= res!8223 (= (size!218 (buf!551 thiss!1486)) (size!218 (buf!551 (_2!528 lt!9770)))))))

(declare-fun b!7461 () Bool)

(declare-fun res!8219 () Bool)

(assert (=> b!7461 (=> (not res!8219) (not e!4676))))

(declare-fun isPrefixOf!0 (BitStream!414 BitStream!414) Bool)

(assert (=> b!7461 (= res!8219 (isPrefixOf!0 thiss!1486 (_2!528 lt!9770)))))

(declare-fun b!7462 () Bool)

(declare-fun e!4675 () Bool)

(declare-fun array_inv!213 (array!503) Bool)

(assert (=> b!7462 (= e!4675 (array_inv!213 (buf!551 thiss!1486)))))

(declare-fun b!7463 () Bool)

(assert (=> b!7463 (= e!4676 (not e!4674))))

(declare-fun res!8221 () Bool)

(assert (=> b!7463 (=> res!8221 e!4674)))

(declare-datatypes ((tuple2!1002 0))(
  ( (tuple2!1003 (_1!529 array!503) (_2!529 BitStream!414)) )
))
(declare-fun lt!9772 () tuple2!1002)

(assert (=> b!7463 (= res!8221 (not (= (byteArrayBitContentToList!0 (_2!528 lt!9770) (_1!529 lt!9772) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!9771)))))

(declare-datatypes ((tuple2!1004 0))(
  ( (tuple2!1005 (_1!530 BitStream!414) (_2!530 BitStream!414)) )
))
(declare-fun lt!9769 () tuple2!1004)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!414 BitStream!414 (_ BitVec 64)) List!118)

(assert (=> b!7463 (= lt!9771 (bitStreamReadBitsIntoList!0 (_2!528 lt!9770) (_1!530 lt!9769) nBits!460))))

(declare-fun readBits!0 (BitStream!414 (_ BitVec 64)) tuple2!1002)

(assert (=> b!7463 (= lt!9772 (readBits!0 (_1!530 lt!9769) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!7463 (validate_offset_bits!1 ((_ sign_extend 32) (size!218 (buf!551 (_2!528 lt!9770)))) ((_ sign_extend 32) (currentByte!1554 thiss!1486)) ((_ sign_extend 32) (currentBit!1549 thiss!1486)) nBits!460)))

(declare-fun lt!9773 () Unit!582)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!414 array!503 (_ BitVec 64)) Unit!582)

(assert (=> b!7463 (= lt!9773 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!551 (_2!528 lt!9770)) nBits!460))))

(declare-fun reader!0 (BitStream!414 BitStream!414) tuple2!1004)

(assert (=> b!7463 (= lt!9769 (reader!0 thiss!1486 (_2!528 lt!9770)))))

(declare-fun res!8225 () Bool)

(declare-fun e!4671 () Bool)

(assert (=> start!1546 (=> (not res!8225) (not e!4671))))

(assert (=> start!1546 (= res!8225 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!218 srcBuffer!6))))))))

(assert (=> start!1546 e!4671))

(assert (=> start!1546 true))

(assert (=> start!1546 (array_inv!213 srcBuffer!6)))

(declare-fun inv!12 (BitStream!414) Bool)

(assert (=> start!1546 (and (inv!12 thiss!1486) e!4675)))

(declare-fun b!7464 () Bool)

(declare-fun res!8220 () Bool)

(assert (=> b!7464 (=> (not res!8220) (not e!4676))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!7464 (= res!8220 (= (bitIndex!0 (size!218 (buf!551 (_2!528 lt!9770))) (currentByte!1554 (_2!528 lt!9770)) (currentBit!1549 (_2!528 lt!9770))) (bvadd (bitIndex!0 (size!218 (buf!551 thiss!1486)) (currentByte!1554 thiss!1486) (currentBit!1549 thiss!1486)) nBits!460)))))

(declare-fun b!7465 () Bool)

(assert (=> b!7465 (= e!4671 e!4676)))

(declare-fun res!8226 () Bool)

(assert (=> b!7465 (=> (not res!8226) (not e!4676))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!7465 (= res!8226 (invariant!0 (currentBit!1549 (_2!528 lt!9770)) (currentByte!1554 (_2!528 lt!9770)) (size!218 (buf!551 (_2!528 lt!9770)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!414 array!503 (_ BitVec 64) (_ BitVec 64)) tuple2!1000)

(assert (=> b!7465 (= lt!9770 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!7466 () Bool)

(declare-fun res!8224 () Bool)

(assert (=> b!7466 (=> (not res!8224) (not e!4671))))

(assert (=> b!7466 (= res!8224 (validate_offset_bits!1 ((_ sign_extend 32) (size!218 (buf!551 thiss!1486))) ((_ sign_extend 32) (currentByte!1554 thiss!1486)) ((_ sign_extend 32) (currentBit!1549 thiss!1486)) nBits!460))))

(declare-fun b!7467 () Bool)

(assert (=> b!7467 (= e!4674 e!4673)))

(declare-fun res!8222 () Bool)

(assert (=> b!7467 (=> res!8222 e!4673)))

(declare-fun checkByteArrayBitContent!0 (BitStream!414 array!503 array!503 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!7467 (= res!8222 (not (checkByteArrayBitContent!0 (_2!528 lt!9770) srcBuffer!6 (_1!529 lt!9772) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))))

(declare-fun lt!9768 () Unit!582)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!414 array!503 array!503 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!582)

(assert (=> b!7467 (= lt!9768 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!528 lt!9770) srcBuffer!6 (_1!529 lt!9772) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (= (and start!1546 res!8225) b!7466))

(assert (= (and b!7466 res!8224) b!7465))

(assert (= (and b!7465 res!8226) b!7460))

(assert (= (and b!7460 res!8223) b!7464))

(assert (= (and b!7464 res!8220) b!7461))

(assert (= (and b!7461 res!8219) b!7463))

(assert (= (and b!7463 (not res!8221)) b!7459))

(assert (= (and b!7459 (not res!8227)) b!7467))

(assert (= (and b!7467 (not res!8222)) b!7458))

(assert (= start!1546 b!7462))

(declare-fun m!9543 () Bool)

(assert (=> b!7459 m!9543))

(declare-fun m!9545 () Bool)

(assert (=> start!1546 m!9545))

(declare-fun m!9547 () Bool)

(assert (=> start!1546 m!9547))

(declare-fun m!9549 () Bool)

(assert (=> b!7464 m!9549))

(declare-fun m!9551 () Bool)

(assert (=> b!7464 m!9551))

(declare-fun m!9553 () Bool)

(assert (=> b!7462 m!9553))

(declare-fun m!9555 () Bool)

(assert (=> b!7463 m!9555))

(declare-fun m!9557 () Bool)

(assert (=> b!7463 m!9557))

(declare-fun m!9559 () Bool)

(assert (=> b!7463 m!9559))

(declare-fun m!9561 () Bool)

(assert (=> b!7463 m!9561))

(declare-fun m!9563 () Bool)

(assert (=> b!7463 m!9563))

(declare-fun m!9565 () Bool)

(assert (=> b!7463 m!9565))

(declare-fun m!9567 () Bool)

(assert (=> b!7467 m!9567))

(declare-fun m!9569 () Bool)

(assert (=> b!7467 m!9569))

(declare-fun m!9571 () Bool)

(assert (=> b!7461 m!9571))

(declare-fun m!9573 () Bool)

(assert (=> b!7466 m!9573))

(declare-fun m!9575 () Bool)

(assert (=> b!7465 m!9575))

(declare-fun m!9577 () Bool)

(assert (=> b!7465 m!9577))

(check-sat (not b!7462) (not b!7463) (not b!7464) (not b!7467) (not start!1546) (not b!7465) (not b!7461) (not b!7466) (not b!7459))
(check-sat)
