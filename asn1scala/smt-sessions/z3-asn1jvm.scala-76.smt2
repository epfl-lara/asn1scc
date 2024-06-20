; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1534 () Bool)

(assert start!1534)

(declare-fun b!7291 () Bool)

(declare-fun res!8072 () Bool)

(declare-fun e!4558 () Bool)

(assert (=> b!7291 (=> (not res!8072) (not e!4558))))

(declare-datatypes ((array!491 0))(
  ( (array!492 (arr!614 (Array (_ BitVec 32) (_ BitVec 8))) (size!212 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!402 0))(
  ( (BitStream!403 (buf!545 array!491) (currentByte!1548 (_ BitVec 32)) (currentBit!1543 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!402)

(declare-datatypes ((Unit!570 0))(
  ( (Unit!571) )
))
(declare-datatypes ((tuple2!964 0))(
  ( (tuple2!965 (_1!510 Unit!570) (_2!510 BitStream!402)) )
))
(declare-fun lt!9665 () tuple2!964)

(assert (=> b!7291 (= res!8072 (= (size!212 (buf!545 thiss!1486)) (size!212 (buf!545 (_2!510 lt!9665)))))))

(declare-fun b!7292 () Bool)

(declare-fun res!8071 () Bool)

(assert (=> b!7292 (=> (not res!8071) (not e!4558))))

(declare-fun isPrefixOf!0 (BitStream!402 BitStream!402) Bool)

(assert (=> b!7292 (= res!8071 (isPrefixOf!0 thiss!1486 (_2!510 lt!9665)))))

(declare-fun b!7293 () Bool)

(declare-fun res!8073 () Bool)

(assert (=> b!7293 (=> (not res!8073) (not e!4558))))

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!7293 (= res!8073 (= (bitIndex!0 (size!212 (buf!545 (_2!510 lt!9665))) (currentByte!1548 (_2!510 lt!9665)) (currentBit!1543 (_2!510 lt!9665))) (bvadd (bitIndex!0 (size!212 (buf!545 thiss!1486)) (currentByte!1548 thiss!1486) (currentBit!1543 thiss!1486)) nBits!460)))))

(declare-fun b!7294 () Bool)

(declare-fun res!8075 () Bool)

(declare-fun e!4561 () Bool)

(assert (=> b!7294 (=> (not res!8075) (not e!4561))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!7294 (= res!8075 (validate_offset_bits!1 ((_ sign_extend 32) (size!212 (buf!545 thiss!1486))) ((_ sign_extend 32) (currentByte!1548 thiss!1486)) ((_ sign_extend 32) (currentBit!1543 thiss!1486)) nBits!460))))

(declare-fun b!7295 () Bool)

(assert (=> b!7295 (= e!4561 e!4558)))

(declare-fun res!8077 () Bool)

(assert (=> b!7295 (=> (not res!8077) (not e!4558))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!7295 (= res!8077 (invariant!0 (currentBit!1543 (_2!510 lt!9665)) (currentByte!1548 (_2!510 lt!9665)) (size!212 (buf!545 (_2!510 lt!9665)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!491)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!402 array!491 (_ BitVec 64) (_ BitVec 64)) tuple2!964)

(assert (=> b!7295 (= lt!9665 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!7296 () Bool)

(declare-fun e!4562 () Bool)

(assert (=> b!7296 (= e!4562 true)))

(declare-fun lt!9663 () Unit!570)

(declare-datatypes ((tuple2!966 0))(
  ( (tuple2!967 (_1!511 array!491) (_2!511 BitStream!402)) )
))
(declare-fun lt!9664 () tuple2!966)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!402 array!491 array!491 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!570)

(assert (=> b!7296 (= lt!9663 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!510 lt!9665) srcBuffer!6 (_1!511 lt!9664) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!7297 () Bool)

(declare-fun res!8076 () Bool)

(assert (=> b!7297 (=> res!8076 e!4562)))

(declare-datatypes ((List!112 0))(
  ( (Nil!109) (Cons!108 (h!227 Bool) (t!862 List!112)) )
))
(declare-fun lt!9662 () List!112)

(declare-fun byteArrayBitContentToList!0 (BitStream!402 array!491 (_ BitVec 64) (_ BitVec 64)) List!112)

(assert (=> b!7297 (= res!8076 (not (= lt!9662 (byteArrayBitContentToList!0 (_2!510 lt!9665) srcBuffer!6 from!367 nBits!460))))))

(declare-fun res!8074 () Bool)

(assert (=> start!1534 (=> (not res!8074) (not e!4561))))

(assert (=> start!1534 (= res!8074 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!212 srcBuffer!6))))))))

(assert (=> start!1534 e!4561))

(assert (=> start!1534 true))

(declare-fun array_inv!207 (array!491) Bool)

(assert (=> start!1534 (array_inv!207 srcBuffer!6)))

(declare-fun e!4557 () Bool)

(declare-fun inv!12 (BitStream!402) Bool)

(assert (=> start!1534 (and (inv!12 thiss!1486) e!4557)))

(declare-fun b!7298 () Bool)

(assert (=> b!7298 (= e!4557 (array_inv!207 (buf!545 thiss!1486)))))

(declare-fun b!7299 () Bool)

(assert (=> b!7299 (= e!4558 (not e!4562))))

(declare-fun res!8070 () Bool)

(assert (=> b!7299 (=> res!8070 e!4562)))

(assert (=> b!7299 (= res!8070 (not (= (byteArrayBitContentToList!0 (_2!510 lt!9665) (_1!511 lt!9664) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!9662)))))

(declare-datatypes ((tuple2!968 0))(
  ( (tuple2!969 (_1!512 BitStream!402) (_2!512 BitStream!402)) )
))
(declare-fun lt!9660 () tuple2!968)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!402 BitStream!402 (_ BitVec 64)) List!112)

(assert (=> b!7299 (= lt!9662 (bitStreamReadBitsIntoList!0 (_2!510 lt!9665) (_1!512 lt!9660) nBits!460))))

(declare-fun readBits!0 (BitStream!402 (_ BitVec 64)) tuple2!966)

(assert (=> b!7299 (= lt!9664 (readBits!0 (_1!512 lt!9660) nBits!460))))

(assert (=> b!7299 (validate_offset_bits!1 ((_ sign_extend 32) (size!212 (buf!545 (_2!510 lt!9665)))) ((_ sign_extend 32) (currentByte!1548 thiss!1486)) ((_ sign_extend 32) (currentBit!1543 thiss!1486)) nBits!460)))

(declare-fun lt!9661 () Unit!570)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!402 array!491 (_ BitVec 64)) Unit!570)

(assert (=> b!7299 (= lt!9661 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!545 (_2!510 lt!9665)) nBits!460))))

(declare-fun reader!0 (BitStream!402 BitStream!402) tuple2!968)

(assert (=> b!7299 (= lt!9660 (reader!0 thiss!1486 (_2!510 lt!9665)))))

(assert (= (and start!1534 res!8074) b!7294))

(assert (= (and b!7294 res!8075) b!7295))

(assert (= (and b!7295 res!8077) b!7291))

(assert (= (and b!7291 res!8072) b!7293))

(assert (= (and b!7293 res!8073) b!7292))

(assert (= (and b!7292 res!8071) b!7299))

(assert (= (and b!7299 (not res!8070)) b!7297))

(assert (= (and b!7297 (not res!8076)) b!7296))

(assert (= start!1534 b!7298))

(declare-fun m!9337 () Bool)

(assert (=> b!7295 m!9337))

(declare-fun m!9339 () Bool)

(assert (=> b!7295 m!9339))

(declare-fun m!9341 () Bool)

(assert (=> b!7293 m!9341))

(declare-fun m!9343 () Bool)

(assert (=> b!7293 m!9343))

(declare-fun m!9345 () Bool)

(assert (=> b!7294 m!9345))

(declare-fun m!9347 () Bool)

(assert (=> b!7298 m!9347))

(declare-fun m!9349 () Bool)

(assert (=> start!1534 m!9349))

(declare-fun m!9351 () Bool)

(assert (=> start!1534 m!9351))

(declare-fun m!9353 () Bool)

(assert (=> b!7299 m!9353))

(declare-fun m!9355 () Bool)

(assert (=> b!7299 m!9355))

(declare-fun m!9357 () Bool)

(assert (=> b!7299 m!9357))

(declare-fun m!9359 () Bool)

(assert (=> b!7299 m!9359))

(declare-fun m!9361 () Bool)

(assert (=> b!7299 m!9361))

(declare-fun m!9363 () Bool)

(assert (=> b!7299 m!9363))

(declare-fun m!9365 () Bool)

(assert (=> b!7297 m!9365))

(declare-fun m!9367 () Bool)

(assert (=> b!7292 m!9367))

(declare-fun m!9369 () Bool)

(assert (=> b!7296 m!9369))

(check-sat (not b!7297) (not b!7295) (not b!7296) (not b!7298) (not start!1534) (not b!7293) (not b!7294) (not b!7299) (not b!7292))
