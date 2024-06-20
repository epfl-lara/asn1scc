; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1422 () Bool)

(assert start!1422)

(declare-fun b!6595 () Bool)

(declare-fun e!4156 () Bool)

(declare-fun e!4155 () Bool)

(assert (=> b!6595 (= e!4156 e!4155)))

(declare-fun res!7516 () Bool)

(assert (=> b!6595 (=> (not res!7516) (not e!4155))))

(declare-datatypes ((array!460 0))(
  ( (array!461 (arr!597 (Array (_ BitVec 32) (_ BitVec 8))) (size!198 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!374 0))(
  ( (BitStream!375 (buf!528 array!460) (currentByte!1525 (_ BitVec 32)) (currentBit!1520 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!518 0))(
  ( (Unit!519) )
))
(declare-datatypes ((tuple2!868 0))(
  ( (tuple2!869 (_1!459 Unit!518) (_2!459 BitStream!374)) )
))
(declare-fun lt!8638 () tuple2!868)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!6595 (= res!7516 (invariant!0 (currentBit!1520 (_2!459 lt!8638)) (currentByte!1525 (_2!459 lt!8638)) (size!198 (buf!528 (_2!459 lt!8638)))))))

(declare-fun srcBuffer!6 () array!460)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun thiss!1486 () BitStream!374)

(declare-fun from!367 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!374 array!460 (_ BitVec 64) (_ BitVec 64)) tuple2!868)

(assert (=> b!6595 (= lt!8638 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!6596 () Bool)

(declare-fun e!4158 () Bool)

(declare-fun array_inv!193 (array!460) Bool)

(assert (=> b!6596 (= e!4158 (array_inv!193 (buf!528 thiss!1486)))))

(declare-fun b!6597 () Bool)

(declare-fun res!7514 () Bool)

(assert (=> b!6597 (=> (not res!7514) (not e!4155))))

(assert (=> b!6597 (= res!7514 (= (size!198 (buf!528 thiss!1486)) (size!198 (buf!528 (_2!459 lt!8638)))))))

(declare-fun b!6598 () Bool)

(declare-fun res!7517 () Bool)

(declare-fun e!4157 () Bool)

(assert (=> b!6598 (=> res!7517 e!4157)))

(declare-datatypes ((List!98 0))(
  ( (Nil!95) (Cons!94 (h!213 Bool) (t!848 List!98)) )
))
(declare-fun lt!8637 () List!98)

(declare-fun byteArrayBitContentToList!0 (BitStream!374 array!460 (_ BitVec 64) (_ BitVec 64)) List!98)

(assert (=> b!6598 (= res!7517 (not (= lt!8637 (byteArrayBitContentToList!0 (_2!459 lt!8638) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!6599 () Bool)

(declare-fun res!7512 () Bool)

(assert (=> b!6599 (=> (not res!7512) (not e!4155))))

(declare-fun isPrefixOf!0 (BitStream!374 BitStream!374) Bool)

(assert (=> b!6599 (= res!7512 (isPrefixOf!0 thiss!1486 (_2!459 lt!8638)))))

(declare-fun b!6600 () Bool)

(assert (=> b!6600 (= e!4155 (not e!4157))))

(declare-fun res!7518 () Bool)

(assert (=> b!6600 (=> res!7518 e!4157)))

(declare-datatypes ((tuple2!870 0))(
  ( (tuple2!871 (_1!460 array!460) (_2!460 BitStream!374)) )
))
(declare-fun lt!8635 () tuple2!870)

(assert (=> b!6600 (= res!7518 (not (= (byteArrayBitContentToList!0 (_2!459 lt!8638) (_1!460 lt!8635) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!8637)))))

(declare-datatypes ((tuple2!872 0))(
  ( (tuple2!873 (_1!461 BitStream!374) (_2!461 BitStream!374)) )
))
(declare-fun lt!8634 () tuple2!872)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!374 BitStream!374 (_ BitVec 64)) List!98)

(assert (=> b!6600 (= lt!8637 (bitStreamReadBitsIntoList!0 (_2!459 lt!8638) (_1!461 lt!8634) nBits!460))))

(declare-fun readBits!0 (BitStream!374 (_ BitVec 64)) tuple2!870)

(assert (=> b!6600 (= lt!8635 (readBits!0 (_1!461 lt!8634) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!6600 (validate_offset_bits!1 ((_ sign_extend 32) (size!198 (buf!528 (_2!459 lt!8638)))) ((_ sign_extend 32) (currentByte!1525 thiss!1486)) ((_ sign_extend 32) (currentBit!1520 thiss!1486)) nBits!460)))

(declare-fun lt!8639 () Unit!518)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!374 array!460 (_ BitVec 64)) Unit!518)

(assert (=> b!6600 (= lt!8639 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!528 (_2!459 lt!8638)) nBits!460))))

(declare-fun reader!0 (BitStream!374 BitStream!374) tuple2!872)

(assert (=> b!6600 (= lt!8634 (reader!0 thiss!1486 (_2!459 lt!8638)))))

(declare-fun b!6601 () Bool)

(declare-fun res!7513 () Bool)

(assert (=> b!6601 (=> (not res!7513) (not e!4155))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!6601 (= res!7513 (= (bitIndex!0 (size!198 (buf!528 (_2!459 lt!8638))) (currentByte!1525 (_2!459 lt!8638)) (currentBit!1520 (_2!459 lt!8638))) (bvadd (bitIndex!0 (size!198 (buf!528 thiss!1486)) (currentByte!1525 thiss!1486) (currentBit!1520 thiss!1486)) nBits!460)))))

(declare-fun b!6602 () Bool)

(assert (=> b!6602 (= e!4157 true)))

(declare-fun lt!8636 () Unit!518)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!374 array!460 array!460 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!518)

(assert (=> b!6602 (= lt!8636 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!459 lt!8638) srcBuffer!6 (_1!460 lt!8635) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!6603 () Bool)

(declare-fun res!7519 () Bool)

(assert (=> b!6603 (=> (not res!7519) (not e!4156))))

(assert (=> b!6603 (= res!7519 (validate_offset_bits!1 ((_ sign_extend 32) (size!198 (buf!528 thiss!1486))) ((_ sign_extend 32) (currentByte!1525 thiss!1486)) ((_ sign_extend 32) (currentBit!1520 thiss!1486)) nBits!460))))

(declare-fun res!7515 () Bool)

(assert (=> start!1422 (=> (not res!7515) (not e!4156))))

(assert (=> start!1422 (= res!7515 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!198 srcBuffer!6))))))))

(assert (=> start!1422 e!4156))

(assert (=> start!1422 true))

(assert (=> start!1422 (array_inv!193 srcBuffer!6)))

(declare-fun inv!12 (BitStream!374) Bool)

(assert (=> start!1422 (and (inv!12 thiss!1486) e!4158)))

(assert (= (and start!1422 res!7515) b!6603))

(assert (= (and b!6603 res!7519) b!6595))

(assert (= (and b!6595 res!7516) b!6597))

(assert (= (and b!6597 res!7514) b!6601))

(assert (= (and b!6601 res!7513) b!6599))

(assert (= (and b!6599 res!7512) b!6600))

(assert (= (and b!6600 (not res!7518)) b!6598))

(assert (= (and b!6598 (not res!7517)) b!6602))

(assert (= start!1422 b!6596))

(declare-fun m!8351 () Bool)

(assert (=> b!6601 m!8351))

(declare-fun m!8353 () Bool)

(assert (=> b!6601 m!8353))

(declare-fun m!8355 () Bool)

(assert (=> b!6599 m!8355))

(declare-fun m!8357 () Bool)

(assert (=> start!1422 m!8357))

(declare-fun m!8359 () Bool)

(assert (=> start!1422 m!8359))

(declare-fun m!8361 () Bool)

(assert (=> b!6600 m!8361))

(declare-fun m!8363 () Bool)

(assert (=> b!6600 m!8363))

(declare-fun m!8365 () Bool)

(assert (=> b!6600 m!8365))

(declare-fun m!8367 () Bool)

(assert (=> b!6600 m!8367))

(declare-fun m!8369 () Bool)

(assert (=> b!6600 m!8369))

(declare-fun m!8371 () Bool)

(assert (=> b!6600 m!8371))

(declare-fun m!8373 () Bool)

(assert (=> b!6602 m!8373))

(declare-fun m!8375 () Bool)

(assert (=> b!6598 m!8375))

(declare-fun m!8377 () Bool)

(assert (=> b!6596 m!8377))

(declare-fun m!8379 () Bool)

(assert (=> b!6603 m!8379))

(declare-fun m!8381 () Bool)

(assert (=> b!6595 m!8381))

(declare-fun m!8383 () Bool)

(assert (=> b!6595 m!8383))

(push 1)

