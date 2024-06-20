; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1430 () Bool)

(assert start!1430)

(declare-fun b!6705 () Bool)

(declare-fun res!7612 () Bool)

(declare-fun e!4235 () Bool)

(assert (=> b!6705 (=> res!7612 e!4235)))

(declare-datatypes ((array!468 0))(
  ( (array!469 (arr!601 (Array (_ BitVec 32) (_ BitVec 8))) (size!202 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!382 0))(
  ( (BitStream!383 (buf!532 array!468) (currentByte!1529 (_ BitVec 32)) (currentBit!1524 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!526 0))(
  ( (Unit!527) )
))
(declare-datatypes ((tuple2!892 0))(
  ( (tuple2!893 (_1!471 Unit!526) (_2!471 BitStream!382)) )
))
(declare-fun lt!8710 () tuple2!892)

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!468)

(declare-datatypes ((List!102 0))(
  ( (Nil!99) (Cons!98 (h!217 Bool) (t!852 List!102)) )
))
(declare-fun lt!8706 () List!102)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun byteArrayBitContentToList!0 (BitStream!382 array!468 (_ BitVec 64) (_ BitVec 64)) List!102)

(assert (=> b!6705 (= res!7612 (not (= lt!8706 (byteArrayBitContentToList!0 (_2!471 lt!8710) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!6706 () Bool)

(declare-fun res!7616 () Bool)

(declare-fun e!4234 () Bool)

(assert (=> b!6706 (=> (not res!7616) (not e!4234))))

(declare-fun thiss!1486 () BitStream!382)

(assert (=> b!6706 (= res!7616 (= (size!202 (buf!532 thiss!1486)) (size!202 (buf!532 (_2!471 lt!8710)))))))

(declare-fun b!6707 () Bool)

(declare-fun e!4231 () Bool)

(assert (=> b!6707 (= e!4231 (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(declare-fun res!7610 () Bool)

(declare-fun e!4230 () Bool)

(assert (=> start!1430 (=> (not res!7610) (not e!4230))))

(assert (=> start!1430 (= res!7610 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!202 srcBuffer!6))))))))

(assert (=> start!1430 e!4230))

(assert (=> start!1430 true))

(declare-fun array_inv!197 (array!468) Bool)

(assert (=> start!1430 (array_inv!197 srcBuffer!6)))

(declare-fun e!4232 () Bool)

(declare-fun inv!12 (BitStream!382) Bool)

(assert (=> start!1430 (and (inv!12 thiss!1486) e!4232)))

(declare-fun b!6708 () Bool)

(assert (=> b!6708 (= e!4235 e!4231)))

(declare-fun res!7617 () Bool)

(assert (=> b!6708 (=> res!7617 e!4231)))

(declare-datatypes ((tuple2!894 0))(
  ( (tuple2!895 (_1!472 array!468) (_2!472 BitStream!382)) )
))
(declare-fun lt!8708 () tuple2!894)

(declare-fun checkByteArrayBitContent!0 (BitStream!382 array!468 array!468 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!6708 (= res!7617 (not (checkByteArrayBitContent!0 (_2!471 lt!8710) srcBuffer!6 (_1!472 lt!8708) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))))

(declare-fun lt!8707 () Unit!526)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!382 array!468 array!468 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!526)

(assert (=> b!6708 (= lt!8707 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!471 lt!8710) srcBuffer!6 (_1!472 lt!8708) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!6709 () Bool)

(declare-fun res!7613 () Bool)

(assert (=> b!6709 (=> (not res!7613) (not e!4234))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!6709 (= res!7613 (= (bitIndex!0 (size!202 (buf!532 (_2!471 lt!8710))) (currentByte!1529 (_2!471 lt!8710)) (currentBit!1524 (_2!471 lt!8710))) (bvadd (bitIndex!0 (size!202 (buf!532 thiss!1486)) (currentByte!1529 thiss!1486) (currentBit!1524 thiss!1486)) nBits!460)))))

(declare-fun b!6710 () Bool)

(assert (=> b!6710 (= e!4230 e!4234)))

(declare-fun res!7611 () Bool)

(assert (=> b!6710 (=> (not res!7611) (not e!4234))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!6710 (= res!7611 (invariant!0 (currentBit!1524 (_2!471 lt!8710)) (currentByte!1529 (_2!471 lt!8710)) (size!202 (buf!532 (_2!471 lt!8710)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!382 array!468 (_ BitVec 64) (_ BitVec 64)) tuple2!892)

(assert (=> b!6710 (= lt!8710 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!6711 () Bool)

(assert (=> b!6711 (= e!4232 (array_inv!197 (buf!532 thiss!1486)))))

(declare-fun b!6712 () Bool)

(declare-fun res!7618 () Bool)

(assert (=> b!6712 (=> (not res!7618) (not e!4234))))

(declare-fun isPrefixOf!0 (BitStream!382 BitStream!382) Bool)

(assert (=> b!6712 (= res!7618 (isPrefixOf!0 thiss!1486 (_2!471 lt!8710)))))

(declare-fun b!6713 () Bool)

(assert (=> b!6713 (= e!4234 (not e!4235))))

(declare-fun res!7614 () Bool)

(assert (=> b!6713 (=> res!7614 e!4235)))

(assert (=> b!6713 (= res!7614 (not (= (byteArrayBitContentToList!0 (_2!471 lt!8710) (_1!472 lt!8708) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!8706)))))

(declare-datatypes ((tuple2!896 0))(
  ( (tuple2!897 (_1!473 BitStream!382) (_2!473 BitStream!382)) )
))
(declare-fun lt!8711 () tuple2!896)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!382 BitStream!382 (_ BitVec 64)) List!102)

(assert (=> b!6713 (= lt!8706 (bitStreamReadBitsIntoList!0 (_2!471 lt!8710) (_1!473 lt!8711) nBits!460))))

(declare-fun readBits!0 (BitStream!382 (_ BitVec 64)) tuple2!894)

(assert (=> b!6713 (= lt!8708 (readBits!0 (_1!473 lt!8711) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!6713 (validate_offset_bits!1 ((_ sign_extend 32) (size!202 (buf!532 (_2!471 lt!8710)))) ((_ sign_extend 32) (currentByte!1529 thiss!1486)) ((_ sign_extend 32) (currentBit!1524 thiss!1486)) nBits!460)))

(declare-fun lt!8709 () Unit!526)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!382 array!468 (_ BitVec 64)) Unit!526)

(assert (=> b!6713 (= lt!8709 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!532 (_2!471 lt!8710)) nBits!460))))

(declare-fun reader!0 (BitStream!382 BitStream!382) tuple2!896)

(assert (=> b!6713 (= lt!8711 (reader!0 thiss!1486 (_2!471 lt!8710)))))

(declare-fun b!6714 () Bool)

(declare-fun res!7615 () Bool)

(assert (=> b!6714 (=> (not res!7615) (not e!4230))))

(assert (=> b!6714 (= res!7615 (validate_offset_bits!1 ((_ sign_extend 32) (size!202 (buf!532 thiss!1486))) ((_ sign_extend 32) (currentByte!1529 thiss!1486)) ((_ sign_extend 32) (currentBit!1524 thiss!1486)) nBits!460))))

(assert (= (and start!1430 res!7610) b!6714))

(assert (= (and b!6714 res!7615) b!6710))

(assert (= (and b!6710 res!7611) b!6706))

(assert (= (and b!6706 res!7616) b!6709))

(assert (= (and b!6709 res!7613) b!6712))

(assert (= (and b!6712 res!7618) b!6713))

(assert (= (and b!6713 (not res!7614)) b!6705))

(assert (= (and b!6705 (not res!7612)) b!6708))

(assert (= (and b!6708 (not res!7617)) b!6707))

(assert (= start!1430 b!6711))

(declare-fun m!8487 () Bool)

(assert (=> b!6713 m!8487))

(declare-fun m!8489 () Bool)

(assert (=> b!6713 m!8489))

(declare-fun m!8491 () Bool)

(assert (=> b!6713 m!8491))

(declare-fun m!8493 () Bool)

(assert (=> b!6713 m!8493))

(declare-fun m!8495 () Bool)

(assert (=> b!6713 m!8495))

(declare-fun m!8497 () Bool)

(assert (=> b!6713 m!8497))

(declare-fun m!8499 () Bool)

(assert (=> b!6714 m!8499))

(declare-fun m!8501 () Bool)

(assert (=> b!6710 m!8501))

(declare-fun m!8503 () Bool)

(assert (=> b!6710 m!8503))

(declare-fun m!8505 () Bool)

(assert (=> b!6711 m!8505))

(declare-fun m!8507 () Bool)

(assert (=> start!1430 m!8507))

(declare-fun m!8509 () Bool)

(assert (=> start!1430 m!8509))

(declare-fun m!8511 () Bool)

(assert (=> b!6712 m!8511))

(declare-fun m!8513 () Bool)

(assert (=> b!6708 m!8513))

(declare-fun m!8515 () Bool)

(assert (=> b!6708 m!8515))

(declare-fun m!8517 () Bool)

(assert (=> b!6709 m!8517))

(declare-fun m!8519 () Bool)

(assert (=> b!6709 m!8519))

(declare-fun m!8521 () Bool)

(assert (=> b!6705 m!8521))

(push 1)

(assert (not b!6708))

(assert (not b!6712))

(assert (not b!6711))

(assert (not b!6705))

(assert (not b!6710))

(assert (not b!6709))

(assert (not b!6714))

(assert (not start!1430))

(assert (not b!6713))

(check-sat)

(pop 1)

(push 1)

(check-sat)

