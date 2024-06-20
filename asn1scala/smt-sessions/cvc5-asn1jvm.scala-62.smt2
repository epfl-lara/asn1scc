; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1202 () Bool)

(assert start!1202)

(declare-fun b!5239 () Bool)

(declare-fun e!3379 () Bool)

(declare-datatypes ((array!396 0))(
  ( (array!397 (arr!562 (Array (_ BitVec 32) (_ BitVec 8))) (size!169 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!316 0))(
  ( (BitStream!317 (buf!493 array!396) (currentByte!1478 (_ BitVec 32)) (currentBit!1473 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!316)

(declare-fun array_inv!164 (array!396) Bool)

(assert (=> b!5239 (= e!3379 (array_inv!164 (buf!493 thiss!1486)))))

(declare-fun b!5240 () Bool)

(declare-fun res!6440 () Bool)

(declare-fun e!3381 () Bool)

(assert (=> b!5240 (=> (not res!6440) (not e!3381))))

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!5240 (= res!6440 (validate_offset_bits!1 ((_ sign_extend 32) (size!169 (buf!493 thiss!1486))) ((_ sign_extend 32) (currentByte!1478 thiss!1486)) ((_ sign_extend 32) (currentBit!1473 thiss!1486)) nBits!460))))

(declare-fun b!5241 () Bool)

(declare-fun res!6437 () Bool)

(declare-fun e!3383 () Bool)

(assert (=> b!5241 (=> (not res!6437) (not e!3383))))

(declare-datatypes ((Unit!412 0))(
  ( (Unit!413) )
))
(declare-datatypes ((tuple2!670 0))(
  ( (tuple2!671 (_1!354 Unit!412) (_2!354 BitStream!316)) )
))
(declare-fun lt!6566 () tuple2!670)

(assert (=> b!5241 (= res!6437 (= (size!169 (buf!493 thiss!1486)) (size!169 (buf!493 (_2!354 lt!6566)))))))

(declare-fun b!5242 () Bool)

(declare-fun res!6439 () Bool)

(assert (=> b!5242 (=> (not res!6439) (not e!3383))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!5242 (= res!6439 (= (bitIndex!0 (size!169 (buf!493 (_2!354 lt!6566))) (currentByte!1478 (_2!354 lt!6566)) (currentBit!1473 (_2!354 lt!6566))) (bvadd (bitIndex!0 (size!169 (buf!493 thiss!1486)) (currentByte!1478 thiss!1486) (currentBit!1473 thiss!1486)) nBits!460)))))

(declare-fun b!5243 () Bool)

(declare-fun res!6438 () Bool)

(declare-fun e!3378 () Bool)

(assert (=> b!5243 (=> res!6438 e!3378)))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((List!69 0))(
  ( (Nil!66) (Cons!65 (h!184 Bool) (t!819 List!69)) )
))
(declare-fun lt!6565 () List!69)

(declare-fun srcBuffer!6 () array!396)

(declare-fun byteArrayBitContentToList!0 (BitStream!316 array!396 (_ BitVec 64) (_ BitVec 64)) List!69)

(assert (=> b!5243 (= res!6438 (not (= lt!6565 (byteArrayBitContentToList!0 (_2!354 lt!6566) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!5244 () Bool)

(declare-fun res!6442 () Bool)

(assert (=> b!5244 (=> (not res!6442) (not e!3383))))

(declare-fun isPrefixOf!0 (BitStream!316 BitStream!316) Bool)

(assert (=> b!5244 (= res!6442 (isPrefixOf!0 thiss!1486 (_2!354 lt!6566)))))

(declare-fun res!6441 () Bool)

(assert (=> start!1202 (=> (not res!6441) (not e!3381))))

(assert (=> start!1202 (= res!6441 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!169 srcBuffer!6))))))))

(assert (=> start!1202 e!3381))

(assert (=> start!1202 true))

(assert (=> start!1202 (array_inv!164 srcBuffer!6)))

(declare-fun inv!12 (BitStream!316) Bool)

(assert (=> start!1202 (and (inv!12 thiss!1486) e!3379)))

(declare-fun b!5245 () Bool)

(assert (=> b!5245 (= e!3378 true)))

(declare-fun lt!6568 () Unit!412)

(declare-datatypes ((tuple2!672 0))(
  ( (tuple2!673 (_1!355 array!396) (_2!355 BitStream!316)) )
))
(declare-fun lt!6569 () tuple2!672)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!316 array!396 array!396 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!412)

(assert (=> b!5245 (= lt!6568 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!354 lt!6566) srcBuffer!6 (_1!355 lt!6569) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!5246 () Bool)

(assert (=> b!5246 (= e!3383 (not e!3378))))

(declare-fun res!6435 () Bool)

(assert (=> b!5246 (=> res!6435 e!3378)))

(assert (=> b!5246 (= res!6435 (not (= (byteArrayBitContentToList!0 (_2!354 lt!6566) (_1!355 lt!6569) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!6565)))))

(declare-datatypes ((tuple2!674 0))(
  ( (tuple2!675 (_1!356 BitStream!316) (_2!356 BitStream!316)) )
))
(declare-fun lt!6564 () tuple2!674)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!316 BitStream!316 (_ BitVec 64)) List!69)

(assert (=> b!5246 (= lt!6565 (bitStreamReadBitsIntoList!0 (_2!354 lt!6566) (_1!356 lt!6564) nBits!460))))

(declare-fun readBits!0 (BitStream!316 (_ BitVec 64)) tuple2!672)

(assert (=> b!5246 (= lt!6569 (readBits!0 (_1!356 lt!6564) nBits!460))))

(assert (=> b!5246 (validate_offset_bits!1 ((_ sign_extend 32) (size!169 (buf!493 (_2!354 lt!6566)))) ((_ sign_extend 32) (currentByte!1478 thiss!1486)) ((_ sign_extend 32) (currentBit!1473 thiss!1486)) nBits!460)))

(declare-fun lt!6567 () Unit!412)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!316 array!396 (_ BitVec 64)) Unit!412)

(assert (=> b!5246 (= lt!6567 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!493 (_2!354 lt!6566)) nBits!460))))

(declare-fun reader!0 (BitStream!316 BitStream!316) tuple2!674)

(assert (=> b!5246 (= lt!6564 (reader!0 thiss!1486 (_2!354 lt!6566)))))

(declare-fun b!5247 () Bool)

(assert (=> b!5247 (= e!3381 e!3383)))

(declare-fun res!6436 () Bool)

(assert (=> b!5247 (=> (not res!6436) (not e!3383))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!5247 (= res!6436 (invariant!0 (currentBit!1473 (_2!354 lt!6566)) (currentByte!1478 (_2!354 lt!6566)) (size!169 (buf!493 (_2!354 lt!6566)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!316 array!396 (_ BitVec 64) (_ BitVec 64)) tuple2!670)

(assert (=> b!5247 (= lt!6566 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(assert (= (and start!1202 res!6441) b!5240))

(assert (= (and b!5240 res!6440) b!5247))

(assert (= (and b!5247 res!6436) b!5241))

(assert (= (and b!5241 res!6437) b!5242))

(assert (= (and b!5242 res!6439) b!5244))

(assert (= (and b!5244 res!6442) b!5246))

(assert (= (and b!5246 (not res!6435)) b!5243))

(assert (= (and b!5243 (not res!6438)) b!5245))

(assert (= start!1202 b!5239))

(declare-fun m!6387 () Bool)

(assert (=> b!5247 m!6387))

(declare-fun m!6389 () Bool)

(assert (=> b!5247 m!6389))

(declare-fun m!6391 () Bool)

(assert (=> b!5242 m!6391))

(declare-fun m!6393 () Bool)

(assert (=> b!5242 m!6393))

(declare-fun m!6395 () Bool)

(assert (=> b!5245 m!6395))

(declare-fun m!6397 () Bool)

(assert (=> b!5246 m!6397))

(declare-fun m!6399 () Bool)

(assert (=> b!5246 m!6399))

(declare-fun m!6401 () Bool)

(assert (=> b!5246 m!6401))

(declare-fun m!6403 () Bool)

(assert (=> b!5246 m!6403))

(declare-fun m!6405 () Bool)

(assert (=> b!5246 m!6405))

(declare-fun m!6407 () Bool)

(assert (=> b!5246 m!6407))

(declare-fun m!6409 () Bool)

(assert (=> b!5243 m!6409))

(declare-fun m!6411 () Bool)

(assert (=> b!5240 m!6411))

(declare-fun m!6413 () Bool)

(assert (=> b!5244 m!6413))

(declare-fun m!6415 () Bool)

(assert (=> b!5239 m!6415))

(declare-fun m!6417 () Bool)

(assert (=> start!1202 m!6417))

(declare-fun m!6419 () Bool)

(assert (=> start!1202 m!6419))

(push 1)

