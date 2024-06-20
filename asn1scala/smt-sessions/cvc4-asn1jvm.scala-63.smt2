; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1212 () Bool)

(assert start!1212)

(declare-fun b!5374 () Bool)

(declare-fun res!6562 () Bool)

(declare-fun e!3472 () Bool)

(assert (=> b!5374 (=> res!6562 e!3472)))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((List!74 0))(
  ( (Nil!71) (Cons!70 (h!189 Bool) (t!824 List!74)) )
))
(declare-fun lt!6659 () List!74)

(declare-datatypes ((array!406 0))(
  ( (array!407 (arr!567 (Array (_ BitVec 32) (_ BitVec 8))) (size!174 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!406)

(declare-datatypes ((BitStream!326 0))(
  ( (BitStream!327 (buf!498 array!406) (currentByte!1483 (_ BitVec 32)) (currentBit!1478 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!422 0))(
  ( (Unit!423) )
))
(declare-datatypes ((tuple2!700 0))(
  ( (tuple2!701 (_1!369 Unit!422) (_2!369 BitStream!326)) )
))
(declare-fun lt!6655 () tuple2!700)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun byteArrayBitContentToList!0 (BitStream!326 array!406 (_ BitVec 64) (_ BitVec 64)) List!74)

(assert (=> b!5374 (= res!6562 (not (= lt!6659 (byteArrayBitContentToList!0 (_2!369 lt!6655) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!5375 () Bool)

(assert (=> b!5375 (= e!3472 (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)))))

(declare-datatypes ((tuple2!702 0))(
  ( (tuple2!703 (_1!370 array!406) (_2!370 BitStream!326)) )
))
(declare-fun lt!6654 () tuple2!702)

(declare-fun lt!6658 () Unit!422)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!326 array!406 array!406 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!422)

(assert (=> b!5375 (= lt!6658 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!369 lt!6655) srcBuffer!6 (_1!370 lt!6654) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!5376 () Bool)

(declare-fun res!6557 () Bool)

(declare-fun e!3468 () Bool)

(assert (=> b!5376 (=> (not res!6557) (not e!3468))))

(declare-fun thiss!1486 () BitStream!326)

(assert (=> b!5376 (= res!6557 (= (size!174 (buf!498 thiss!1486)) (size!174 (buf!498 (_2!369 lt!6655)))))))

(declare-fun b!5377 () Bool)

(declare-fun res!6556 () Bool)

(assert (=> b!5377 (=> (not res!6556) (not e!3468))))

(declare-fun isPrefixOf!0 (BitStream!326 BitStream!326) Bool)

(assert (=> b!5377 (= res!6556 (isPrefixOf!0 thiss!1486 (_2!369 lt!6655)))))

(declare-fun b!5378 () Bool)

(declare-fun res!6559 () Bool)

(assert (=> b!5378 (=> (not res!6559) (not e!3468))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!5378 (= res!6559 (= (bitIndex!0 (size!174 (buf!498 (_2!369 lt!6655))) (currentByte!1483 (_2!369 lt!6655)) (currentBit!1478 (_2!369 lt!6655))) (bvadd (bitIndex!0 (size!174 (buf!498 thiss!1486)) (currentByte!1483 thiss!1486) (currentBit!1478 thiss!1486)) nBits!460)))))

(declare-fun b!5379 () Bool)

(declare-fun e!3473 () Bool)

(assert (=> b!5379 (= e!3473 e!3468)))

(declare-fun res!6560 () Bool)

(assert (=> b!5379 (=> (not res!6560) (not e!3468))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!5379 (= res!6560 (invariant!0 (currentBit!1478 (_2!369 lt!6655)) (currentByte!1483 (_2!369 lt!6655)) (size!174 (buf!498 (_2!369 lt!6655)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!326 array!406 (_ BitVec 64) (_ BitVec 64)) tuple2!700)

(assert (=> b!5379 (= lt!6655 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!5381 () Bool)

(assert (=> b!5381 (= e!3468 (not e!3472))))

(declare-fun res!6561 () Bool)

(assert (=> b!5381 (=> res!6561 e!3472)))

(assert (=> b!5381 (= res!6561 (not (= (byteArrayBitContentToList!0 (_2!369 lt!6655) (_1!370 lt!6654) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!6659)))))

(declare-datatypes ((tuple2!704 0))(
  ( (tuple2!705 (_1!371 BitStream!326) (_2!371 BitStream!326)) )
))
(declare-fun lt!6656 () tuple2!704)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!326 BitStream!326 (_ BitVec 64)) List!74)

(assert (=> b!5381 (= lt!6659 (bitStreamReadBitsIntoList!0 (_2!369 lt!6655) (_1!371 lt!6656) nBits!460))))

(declare-fun readBits!0 (BitStream!326 (_ BitVec 64)) tuple2!702)

(assert (=> b!5381 (= lt!6654 (readBits!0 (_1!371 lt!6656) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!5381 (validate_offset_bits!1 ((_ sign_extend 32) (size!174 (buf!498 (_2!369 lt!6655)))) ((_ sign_extend 32) (currentByte!1483 thiss!1486)) ((_ sign_extend 32) (currentBit!1478 thiss!1486)) nBits!460)))

(declare-fun lt!6657 () Unit!422)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!326 array!406 (_ BitVec 64)) Unit!422)

(assert (=> b!5381 (= lt!6657 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!498 (_2!369 lt!6655)) nBits!460))))

(declare-fun reader!0 (BitStream!326 BitStream!326) tuple2!704)

(assert (=> b!5381 (= lt!6656 (reader!0 thiss!1486 (_2!369 lt!6655)))))

(declare-fun b!5382 () Bool)

(declare-fun res!6555 () Bool)

(assert (=> b!5382 (=> (not res!6555) (not e!3473))))

(assert (=> b!5382 (= res!6555 (validate_offset_bits!1 ((_ sign_extend 32) (size!174 (buf!498 thiss!1486))) ((_ sign_extend 32) (currentByte!1483 thiss!1486)) ((_ sign_extend 32) (currentBit!1478 thiss!1486)) nBits!460))))

(declare-fun res!6558 () Bool)

(assert (=> start!1212 (=> (not res!6558) (not e!3473))))

(assert (=> start!1212 (= res!6558 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!174 srcBuffer!6))))))))

(assert (=> start!1212 e!3473))

(assert (=> start!1212 true))

(declare-fun array_inv!169 (array!406) Bool)

(assert (=> start!1212 (array_inv!169 srcBuffer!6)))

(declare-fun e!3471 () Bool)

(declare-fun inv!12 (BitStream!326) Bool)

(assert (=> start!1212 (and (inv!12 thiss!1486) e!3471)))

(declare-fun b!5380 () Bool)

(assert (=> b!5380 (= e!3471 (array_inv!169 (buf!498 thiss!1486)))))

(assert (= (and start!1212 res!6558) b!5382))

(assert (= (and b!5382 res!6555) b!5379))

(assert (= (and b!5379 res!6560) b!5376))

(assert (= (and b!5376 res!6557) b!5378))

(assert (= (and b!5378 res!6559) b!5377))

(assert (= (and b!5377 res!6556) b!5381))

(assert (= (and b!5381 (not res!6561)) b!5374))

(assert (= (and b!5374 (not res!6562)) b!5375))

(assert (= start!1212 b!5380))

(declare-fun m!6557 () Bool)

(assert (=> b!5378 m!6557))

(declare-fun m!6559 () Bool)

(assert (=> b!5378 m!6559))

(declare-fun m!6561 () Bool)

(assert (=> b!5375 m!6561))

(declare-fun m!6563 () Bool)

(assert (=> b!5380 m!6563))

(declare-fun m!6565 () Bool)

(assert (=> b!5381 m!6565))

(declare-fun m!6567 () Bool)

(assert (=> b!5381 m!6567))

(declare-fun m!6569 () Bool)

(assert (=> b!5381 m!6569))

(declare-fun m!6571 () Bool)

(assert (=> b!5381 m!6571))

(declare-fun m!6573 () Bool)

(assert (=> b!5381 m!6573))

(declare-fun m!6575 () Bool)

(assert (=> b!5381 m!6575))

(declare-fun m!6577 () Bool)

(assert (=> b!5382 m!6577))

(declare-fun m!6579 () Bool)

(assert (=> b!5379 m!6579))

(declare-fun m!6581 () Bool)

(assert (=> b!5379 m!6581))

(declare-fun m!6583 () Bool)

(assert (=> start!1212 m!6583))

(declare-fun m!6585 () Bool)

(assert (=> start!1212 m!6585))

(declare-fun m!6587 () Bool)

(assert (=> b!5377 m!6587))

(declare-fun m!6589 () Bool)

(assert (=> b!5374 m!6589))

(push 1)

(assert (not b!5382))

(assert (not b!5381))

(assert (not b!5380))

(assert (not b!5378))

(assert (not start!1212))

(assert (not b!5374))

(assert (not b!5377))

(assert (not b!5375))

(assert (not b!5379))

(check-sat)

(pop 1)

(push 1)

(check-sat)

