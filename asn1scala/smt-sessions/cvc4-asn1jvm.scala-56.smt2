; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1098 () Bool)

(assert start!1098)

(declare-fun b!4561 () Bool)

(declare-fun res!5906 () Bool)

(declare-fun e!2985 () Bool)

(assert (=> b!4561 (=> res!5906 e!2985)))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!361 0))(
  ( (array!362 (arr!543 (Array (_ BitVec 32) (_ BitVec 8))) (size!153 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!284 0))(
  ( (BitStream!285 (buf!474 array!361) (currentByte!1453 (_ BitVec 32)) (currentBit!1448 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!356 0))(
  ( (Unit!357) )
))
(declare-datatypes ((tuple2!562 0))(
  ( (tuple2!563 (_1!297 Unit!356) (_2!297 BitStream!284)) )
))
(declare-fun lt!5522 () tuple2!562)

(declare-datatypes ((List!53 0))(
  ( (Nil!50) (Cons!49 (h!168 Bool) (t!803 List!53)) )
))
(declare-fun lt!5521 () List!53)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!361)

(declare-fun byteArrayBitContentToList!0 (BitStream!284 array!361 (_ BitVec 64) (_ BitVec 64)) List!53)

(assert (=> b!4561 (= res!5906 (not (= lt!5521 (byteArrayBitContentToList!0 (_2!297 lt!5522) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!4562 () Bool)

(declare-fun e!2988 () Bool)

(assert (=> b!4562 (= e!2988 (not e!2985))))

(declare-fun res!5907 () Bool)

(assert (=> b!4562 (=> res!5907 e!2985)))

(declare-datatypes ((tuple2!564 0))(
  ( (tuple2!565 (_1!298 array!361) (_2!298 BitStream!284)) )
))
(declare-fun lt!5525 () tuple2!564)

(assert (=> b!4562 (= res!5907 (not (= (byteArrayBitContentToList!0 (_2!297 lt!5522) (_1!298 lt!5525) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!5521)))))

(declare-datatypes ((tuple2!566 0))(
  ( (tuple2!567 (_1!299 BitStream!284) (_2!299 BitStream!284)) )
))
(declare-fun lt!5523 () tuple2!566)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!284 BitStream!284 (_ BitVec 64)) List!53)

(assert (=> b!4562 (= lt!5521 (bitStreamReadBitsIntoList!0 (_2!297 lt!5522) (_1!299 lt!5523) nBits!460))))

(declare-fun readBits!0 (BitStream!284 (_ BitVec 64)) tuple2!564)

(assert (=> b!4562 (= lt!5525 (readBits!0 (_1!299 lt!5523) nBits!460))))

(declare-fun thiss!1486 () BitStream!284)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!4562 (validate_offset_bits!1 ((_ sign_extend 32) (size!153 (buf!474 (_2!297 lt!5522)))) ((_ sign_extend 32) (currentByte!1453 thiss!1486)) ((_ sign_extend 32) (currentBit!1448 thiss!1486)) nBits!460)))

(declare-fun lt!5524 () Unit!356)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!284 array!361 (_ BitVec 64)) Unit!356)

(assert (=> b!4562 (= lt!5524 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!474 (_2!297 lt!5522)) nBits!460))))

(declare-fun reader!0 (BitStream!284 BitStream!284) tuple2!566)

(assert (=> b!4562 (= lt!5523 (reader!0 thiss!1486 (_2!297 lt!5522)))))

(declare-fun b!4563 () Bool)

(declare-fun res!5908 () Bool)

(assert (=> b!4563 (=> (not res!5908) (not e!2988))))

(assert (=> b!4563 (= res!5908 (= (size!153 (buf!474 thiss!1486)) (size!153 (buf!474 (_2!297 lt!5522)))))))

(declare-fun b!4564 () Bool)

(declare-fun e!2987 () Bool)

(assert (=> b!4564 (= e!2987 e!2988)))

(declare-fun res!5905 () Bool)

(assert (=> b!4564 (=> (not res!5905) (not e!2988))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!4564 (= res!5905 (invariant!0 (currentBit!1448 (_2!297 lt!5522)) (currentByte!1453 (_2!297 lt!5522)) (size!153 (buf!474 (_2!297 lt!5522)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!284 array!361 (_ BitVec 64) (_ BitVec 64)) tuple2!562)

(assert (=> b!4564 (= lt!5522 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!4565 () Bool)

(assert (=> b!4565 (= e!2985 (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)))))

(declare-fun b!4566 () Bool)

(declare-fun res!5904 () Bool)

(assert (=> b!4566 (=> (not res!5904) (not e!2988))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!4566 (= res!5904 (= (bitIndex!0 (size!153 (buf!474 (_2!297 lt!5522))) (currentByte!1453 (_2!297 lt!5522)) (currentBit!1448 (_2!297 lt!5522))) (bvadd (bitIndex!0 (size!153 (buf!474 thiss!1486)) (currentByte!1453 thiss!1486) (currentBit!1448 thiss!1486)) nBits!460)))))

(declare-fun b!4567 () Bool)

(declare-fun e!2986 () Bool)

(declare-fun array_inv!148 (array!361) Bool)

(assert (=> b!4567 (= e!2986 (array_inv!148 (buf!474 thiss!1486)))))

(declare-fun res!5902 () Bool)

(assert (=> start!1098 (=> (not res!5902) (not e!2987))))

(assert (=> start!1098 (= res!5902 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!153 srcBuffer!6))))))))

(assert (=> start!1098 e!2987))

(assert (=> start!1098 true))

(assert (=> start!1098 (array_inv!148 srcBuffer!6)))

(declare-fun inv!12 (BitStream!284) Bool)

(assert (=> start!1098 (and (inv!12 thiss!1486) e!2986)))

(declare-fun b!4568 () Bool)

(declare-fun res!5901 () Bool)

(assert (=> b!4568 (=> (not res!5901) (not e!2987))))

(assert (=> b!4568 (= res!5901 (validate_offset_bits!1 ((_ sign_extend 32) (size!153 (buf!474 thiss!1486))) ((_ sign_extend 32) (currentByte!1453 thiss!1486)) ((_ sign_extend 32) (currentBit!1448 thiss!1486)) nBits!460))))

(declare-fun b!4569 () Bool)

(declare-fun res!5903 () Bool)

(assert (=> b!4569 (=> (not res!5903) (not e!2988))))

(declare-fun isPrefixOf!0 (BitStream!284 BitStream!284) Bool)

(assert (=> b!4569 (= res!5903 (isPrefixOf!0 thiss!1486 (_2!297 lt!5522)))))

(assert (= (and start!1098 res!5902) b!4568))

(assert (= (and b!4568 res!5901) b!4564))

(assert (= (and b!4564 res!5905) b!4563))

(assert (= (and b!4563 res!5908) b!4566))

(assert (= (and b!4566 res!5904) b!4569))

(assert (= (and b!4569 res!5903) b!4562))

(assert (= (and b!4562 (not res!5907)) b!4561))

(assert (= (and b!4561 (not res!5906)) b!4565))

(assert (= start!1098 b!4567))

(declare-fun m!5401 () Bool)

(assert (=> start!1098 m!5401))

(declare-fun m!5403 () Bool)

(assert (=> start!1098 m!5403))

(declare-fun m!5405 () Bool)

(assert (=> b!4567 m!5405))

(declare-fun m!5407 () Bool)

(assert (=> b!4568 m!5407))

(declare-fun m!5409 () Bool)

(assert (=> b!4562 m!5409))

(declare-fun m!5411 () Bool)

(assert (=> b!4562 m!5411))

(declare-fun m!5413 () Bool)

(assert (=> b!4562 m!5413))

(declare-fun m!5415 () Bool)

(assert (=> b!4562 m!5415))

(declare-fun m!5417 () Bool)

(assert (=> b!4562 m!5417))

(declare-fun m!5419 () Bool)

(assert (=> b!4562 m!5419))

(declare-fun m!5421 () Bool)

(assert (=> b!4561 m!5421))

(declare-fun m!5423 () Bool)

(assert (=> b!4566 m!5423))

(declare-fun m!5425 () Bool)

(assert (=> b!4566 m!5425))

(declare-fun m!5427 () Bool)

(assert (=> b!4569 m!5427))

(declare-fun m!5429 () Bool)

(assert (=> b!4564 m!5429))

(declare-fun m!5431 () Bool)

(assert (=> b!4564 m!5431))

(push 1)

(assert (not b!4562))

(assert (not start!1098))

(assert (not b!4567))

(assert (not b!4561))

(assert (not b!4564))

(assert (not b!4569))

(assert (not b!4566))

(assert (not b!4568))

(check-sat)

(pop 1)

(push 1)

(check-sat)

