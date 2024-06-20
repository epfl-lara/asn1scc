; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1548 () Bool)

(assert start!1548)

(declare-fun b!7489 () Bool)

(declare-fun res!8250 () Bool)

(declare-fun e!4697 () Bool)

(assert (=> b!7489 (=> (not res!8250) (not e!4697))))

(declare-datatypes ((array!505 0))(
  ( (array!506 (arr!621 (Array (_ BitVec 32) (_ BitVec 8))) (size!219 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!416 0))(
  ( (BitStream!417 (buf!552 array!505) (currentByte!1555 (_ BitVec 32)) (currentBit!1550 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!584 0))(
  ( (Unit!585) )
))
(declare-datatypes ((tuple2!1006 0))(
  ( (tuple2!1007 (_1!531 Unit!584) (_2!531 BitStream!416)) )
))
(declare-fun lt!9790 () tuple2!1006)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun thiss!1486 () BitStream!416)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!7489 (= res!8250 (= (bitIndex!0 (size!219 (buf!552 (_2!531 lt!9790))) (currentByte!1555 (_2!531 lt!9790)) (currentBit!1550 (_2!531 lt!9790))) (bvadd (bitIndex!0 (size!219 (buf!552 thiss!1486)) (currentByte!1555 thiss!1486) (currentBit!1550 thiss!1486)) nBits!460)))))

(declare-fun b!7490 () Bool)

(declare-fun e!4695 () Bool)

(assert (=> b!7490 (= e!4697 (not e!4695))))

(declare-fun res!8251 () Bool)

(assert (=> b!7490 (=> res!8251 e!4695)))

(declare-datatypes ((List!119 0))(
  ( (Nil!116) (Cons!115 (h!234 Bool) (t!869 List!119)) )
))
(declare-fun lt!9789 () List!119)

(declare-datatypes ((tuple2!1008 0))(
  ( (tuple2!1009 (_1!532 array!505) (_2!532 BitStream!416)) )
))
(declare-fun lt!9791 () tuple2!1008)

(declare-fun byteArrayBitContentToList!0 (BitStream!416 array!505 (_ BitVec 64) (_ BitVec 64)) List!119)

(assert (=> b!7490 (= res!8251 (not (= (byteArrayBitContentToList!0 (_2!531 lt!9790) (_1!532 lt!9791) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!9789)))))

(declare-datatypes ((tuple2!1010 0))(
  ( (tuple2!1011 (_1!533 BitStream!416) (_2!533 BitStream!416)) )
))
(declare-fun lt!9786 () tuple2!1010)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!416 BitStream!416 (_ BitVec 64)) List!119)

(assert (=> b!7490 (= lt!9789 (bitStreamReadBitsIntoList!0 (_2!531 lt!9790) (_1!533 lt!9786) nBits!460))))

(declare-fun readBits!0 (BitStream!416 (_ BitVec 64)) tuple2!1008)

(assert (=> b!7490 (= lt!9791 (readBits!0 (_1!533 lt!9786) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!7490 (validate_offset_bits!1 ((_ sign_extend 32) (size!219 (buf!552 (_2!531 lt!9790)))) ((_ sign_extend 32) (currentByte!1555 thiss!1486)) ((_ sign_extend 32) (currentBit!1550 thiss!1486)) nBits!460)))

(declare-fun lt!9787 () Unit!584)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!416 array!505 (_ BitVec 64)) Unit!584)

(assert (=> b!7490 (= lt!9787 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!552 (_2!531 lt!9790)) nBits!460))))

(declare-fun reader!0 (BitStream!416 BitStream!416) tuple2!1010)

(assert (=> b!7490 (= lt!9786 (reader!0 thiss!1486 (_2!531 lt!9790)))))

(declare-fun b!7491 () Bool)

(declare-fun e!4694 () Bool)

(declare-fun array_inv!214 (array!505) Bool)

(assert (=> b!7491 (= e!4694 (array_inv!214 (buf!552 thiss!1486)))))

(declare-fun b!7492 () Bool)

(declare-fun e!4693 () Bool)

(assert (=> b!7492 (= e!4693 (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)))))

(declare-fun b!7493 () Bool)

(assert (=> b!7493 (= e!4695 e!4693)))

(declare-fun res!8254 () Bool)

(assert (=> b!7493 (=> res!8254 e!4693)))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!505)

(declare-fun checkByteArrayBitContent!0 (BitStream!416 array!505 array!505 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!7493 (= res!8254 (not (checkByteArrayBitContent!0 (_2!531 lt!9790) srcBuffer!6 (_1!532 lt!9791) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))))

(declare-fun lt!9788 () Unit!584)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!416 array!505 array!505 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!584)

(assert (=> b!7493 (= lt!9788 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!531 lt!9790) srcBuffer!6 (_1!532 lt!9791) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!7494 () Bool)

(declare-fun res!8247 () Bool)

(assert (=> b!7494 (=> res!8247 e!4695)))

(assert (=> b!7494 (= res!8247 (not (= lt!9789 (byteArrayBitContentToList!0 (_2!531 lt!9790) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!7495 () Bool)

(declare-fun e!4696 () Bool)

(assert (=> b!7495 (= e!4696 e!4697)))

(declare-fun res!8253 () Bool)

(assert (=> b!7495 (=> (not res!8253) (not e!4697))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!7495 (= res!8253 (invariant!0 (currentBit!1550 (_2!531 lt!9790)) (currentByte!1555 (_2!531 lt!9790)) (size!219 (buf!552 (_2!531 lt!9790)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!416 array!505 (_ BitVec 64) (_ BitVec 64)) tuple2!1006)

(assert (=> b!7495 (= lt!9790 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!7496 () Bool)

(declare-fun res!8248 () Bool)

(assert (=> b!7496 (=> (not res!8248) (not e!4697))))

(assert (=> b!7496 (= res!8248 (= (size!219 (buf!552 thiss!1486)) (size!219 (buf!552 (_2!531 lt!9790)))))))

(declare-fun b!7497 () Bool)

(declare-fun res!8252 () Bool)

(assert (=> b!7497 (=> (not res!8252) (not e!4696))))

(assert (=> b!7497 (= res!8252 (validate_offset_bits!1 ((_ sign_extend 32) (size!219 (buf!552 thiss!1486))) ((_ sign_extend 32) (currentByte!1555 thiss!1486)) ((_ sign_extend 32) (currentBit!1550 thiss!1486)) nBits!460))))

(declare-fun b!7488 () Bool)

(declare-fun res!8249 () Bool)

(assert (=> b!7488 (=> (not res!8249) (not e!4697))))

(declare-fun isPrefixOf!0 (BitStream!416 BitStream!416) Bool)

(assert (=> b!7488 (= res!8249 (isPrefixOf!0 thiss!1486 (_2!531 lt!9790)))))

(declare-fun res!8246 () Bool)

(assert (=> start!1548 (=> (not res!8246) (not e!4696))))

(assert (=> start!1548 (= res!8246 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!219 srcBuffer!6))))))))

(assert (=> start!1548 e!4696))

(assert (=> start!1548 true))

(assert (=> start!1548 (array_inv!214 srcBuffer!6)))

(declare-fun inv!12 (BitStream!416) Bool)

(assert (=> start!1548 (and (inv!12 thiss!1486) e!4694)))

(assert (= (and start!1548 res!8246) b!7497))

(assert (= (and b!7497 res!8252) b!7495))

(assert (= (and b!7495 res!8253) b!7496))

(assert (= (and b!7496 res!8248) b!7489))

(assert (= (and b!7489 res!8250) b!7488))

(assert (= (and b!7488 res!8249) b!7490))

(assert (= (and b!7490 (not res!8251)) b!7494))

(assert (= (and b!7494 (not res!8247)) b!7493))

(assert (= (and b!7493 (not res!8254)) b!7492))

(assert (= start!1548 b!7491))

(declare-fun m!9579 () Bool)

(assert (=> b!7493 m!9579))

(declare-fun m!9581 () Bool)

(assert (=> b!7493 m!9581))

(declare-fun m!9583 () Bool)

(assert (=> b!7489 m!9583))

(declare-fun m!9585 () Bool)

(assert (=> b!7489 m!9585))

(declare-fun m!9587 () Bool)

(assert (=> b!7494 m!9587))

(declare-fun m!9589 () Bool)

(assert (=> start!1548 m!9589))

(declare-fun m!9591 () Bool)

(assert (=> start!1548 m!9591))

(declare-fun m!9593 () Bool)

(assert (=> b!7491 m!9593))

(declare-fun m!9595 () Bool)

(assert (=> b!7488 m!9595))

(declare-fun m!9597 () Bool)

(assert (=> b!7497 m!9597))

(declare-fun m!9599 () Bool)

(assert (=> b!7495 m!9599))

(declare-fun m!9601 () Bool)

(assert (=> b!7495 m!9601))

(declare-fun m!9603 () Bool)

(assert (=> b!7490 m!9603))

(declare-fun m!9605 () Bool)

(assert (=> b!7490 m!9605))

(declare-fun m!9607 () Bool)

(assert (=> b!7490 m!9607))

(declare-fun m!9609 () Bool)

(assert (=> b!7490 m!9609))

(declare-fun m!9611 () Bool)

(assert (=> b!7490 m!9611))

(declare-fun m!9613 () Bool)

(assert (=> b!7490 m!9613))

(push 1)

