; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1428 () Bool)

(assert start!1428)

(declare-fun b!6676 () Bool)

(declare-fun e!4213 () Bool)

(declare-fun e!4210 () Bool)

(assert (=> b!6676 (= e!4213 (not e!4210))))

(declare-fun res!7589 () Bool)

(assert (=> b!6676 (=> res!7589 e!4210)))

(declare-fun nBits!460 () (_ BitVec 64))

(declare-datatypes ((array!466 0))(
  ( (array!467 (arr!600 (Array (_ BitVec 32) (_ BitVec 8))) (size!201 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!380 0))(
  ( (BitStream!381 (buf!531 array!466) (currentByte!1528 (_ BitVec 32)) (currentBit!1523 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!524 0))(
  ( (Unit!525) )
))
(declare-datatypes ((tuple2!886 0))(
  ( (tuple2!887 (_1!468 Unit!524) (_2!468 BitStream!380)) )
))
(declare-fun lt!8690 () tuple2!886)

(declare-datatypes ((tuple2!888 0))(
  ( (tuple2!889 (_1!469 array!466) (_2!469 BitStream!380)) )
))
(declare-fun lt!8689 () tuple2!888)

(declare-datatypes ((List!101 0))(
  ( (Nil!98) (Cons!97 (h!216 Bool) (t!851 List!101)) )
))
(declare-fun lt!8691 () List!101)

(declare-fun byteArrayBitContentToList!0 (BitStream!380 array!466 (_ BitVec 64) (_ BitVec 64)) List!101)

(assert (=> b!6676 (= res!7589 (not (= (byteArrayBitContentToList!0 (_2!468 lt!8690) (_1!469 lt!8689) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!8691)))))

(declare-datatypes ((tuple2!890 0))(
  ( (tuple2!891 (_1!470 BitStream!380) (_2!470 BitStream!380)) )
))
(declare-fun lt!8693 () tuple2!890)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!380 BitStream!380 (_ BitVec 64)) List!101)

(assert (=> b!6676 (= lt!8691 (bitStreamReadBitsIntoList!0 (_2!468 lt!8690) (_1!470 lt!8693) nBits!460))))

(declare-fun readBits!0 (BitStream!380 (_ BitVec 64)) tuple2!888)

(assert (=> b!6676 (= lt!8689 (readBits!0 (_1!470 lt!8693) nBits!460))))

(declare-fun thiss!1486 () BitStream!380)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!6676 (validate_offset_bits!1 ((_ sign_extend 32) (size!201 (buf!531 (_2!468 lt!8690)))) ((_ sign_extend 32) (currentByte!1528 thiss!1486)) ((_ sign_extend 32) (currentBit!1523 thiss!1486)) nBits!460)))

(declare-fun lt!8688 () Unit!524)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!380 array!466 (_ BitVec 64)) Unit!524)

(assert (=> b!6676 (= lt!8688 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!531 (_2!468 lt!8690)) nBits!460))))

(declare-fun reader!0 (BitStream!380 BitStream!380) tuple2!890)

(assert (=> b!6676 (= lt!8693 (reader!0 thiss!1486 (_2!468 lt!8690)))))

(declare-fun b!6678 () Bool)

(assert (=> b!6678 (= e!4210 true)))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!466)

(declare-fun lt!8692 () Unit!524)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!380 array!466 array!466 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!524)

(assert (=> b!6678 (= lt!8692 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!468 lt!8690) srcBuffer!6 (_1!469 lt!8689) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!6679 () Bool)

(declare-fun res!7587 () Bool)

(assert (=> b!6679 (=> (not res!7587) (not e!4213))))

(assert (=> b!6679 (= res!7587 (= (size!201 (buf!531 thiss!1486)) (size!201 (buf!531 (_2!468 lt!8690)))))))

(declare-fun b!6680 () Bool)

(declare-fun res!7590 () Bool)

(assert (=> b!6680 (=> res!7590 e!4210)))

(assert (=> b!6680 (= res!7590 (not (= lt!8691 (byteArrayBitContentToList!0 (_2!468 lt!8690) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!6681 () Bool)

(declare-fun res!7584 () Bool)

(declare-fun e!4212 () Bool)

(assert (=> b!6681 (=> (not res!7584) (not e!4212))))

(assert (=> b!6681 (= res!7584 (validate_offset_bits!1 ((_ sign_extend 32) (size!201 (buf!531 thiss!1486))) ((_ sign_extend 32) (currentByte!1528 thiss!1486)) ((_ sign_extend 32) (currentBit!1523 thiss!1486)) nBits!460))))

(declare-fun b!6682 () Bool)

(declare-fun res!7585 () Bool)

(assert (=> b!6682 (=> (not res!7585) (not e!4213))))

(declare-fun isPrefixOf!0 (BitStream!380 BitStream!380) Bool)

(assert (=> b!6682 (= res!7585 (isPrefixOf!0 thiss!1486 (_2!468 lt!8690)))))

(declare-fun b!6677 () Bool)

(declare-fun e!4211 () Bool)

(declare-fun array_inv!196 (array!466) Bool)

(assert (=> b!6677 (= e!4211 (array_inv!196 (buf!531 thiss!1486)))))

(declare-fun res!7588 () Bool)

(assert (=> start!1428 (=> (not res!7588) (not e!4212))))

(assert (=> start!1428 (= res!7588 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!201 srcBuffer!6))))))))

(assert (=> start!1428 e!4212))

(assert (=> start!1428 true))

(assert (=> start!1428 (array_inv!196 srcBuffer!6)))

(declare-fun inv!12 (BitStream!380) Bool)

(assert (=> start!1428 (and (inv!12 thiss!1486) e!4211)))

(declare-fun b!6683 () Bool)

(assert (=> b!6683 (= e!4212 e!4213)))

(declare-fun res!7591 () Bool)

(assert (=> b!6683 (=> (not res!7591) (not e!4213))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!6683 (= res!7591 (invariant!0 (currentBit!1523 (_2!468 lt!8690)) (currentByte!1528 (_2!468 lt!8690)) (size!201 (buf!531 (_2!468 lt!8690)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!380 array!466 (_ BitVec 64) (_ BitVec 64)) tuple2!886)

(assert (=> b!6683 (= lt!8690 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!6684 () Bool)

(declare-fun res!7586 () Bool)

(assert (=> b!6684 (=> (not res!7586) (not e!4213))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!6684 (= res!7586 (= (bitIndex!0 (size!201 (buf!531 (_2!468 lt!8690))) (currentByte!1528 (_2!468 lt!8690)) (currentBit!1523 (_2!468 lt!8690))) (bvadd (bitIndex!0 (size!201 (buf!531 thiss!1486)) (currentByte!1528 thiss!1486) (currentBit!1523 thiss!1486)) nBits!460)))))

(assert (= (and start!1428 res!7588) b!6681))

(assert (= (and b!6681 res!7584) b!6683))

(assert (= (and b!6683 res!7591) b!6679))

(assert (= (and b!6679 res!7587) b!6684))

(assert (= (and b!6684 res!7586) b!6682))

(assert (= (and b!6682 res!7585) b!6676))

(assert (= (and b!6676 (not res!7589)) b!6680))

(assert (= (and b!6680 (not res!7590)) b!6678))

(assert (= start!1428 b!6677))

(declare-fun m!8453 () Bool)

(assert (=> b!6683 m!8453))

(declare-fun m!8455 () Bool)

(assert (=> b!6683 m!8455))

(declare-fun m!8457 () Bool)

(assert (=> b!6681 m!8457))

(declare-fun m!8459 () Bool)

(assert (=> b!6682 m!8459))

(declare-fun m!8461 () Bool)

(assert (=> start!1428 m!8461))

(declare-fun m!8463 () Bool)

(assert (=> start!1428 m!8463))

(declare-fun m!8465 () Bool)

(assert (=> b!6684 m!8465))

(declare-fun m!8467 () Bool)

(assert (=> b!6684 m!8467))

(declare-fun m!8469 () Bool)

(assert (=> b!6680 m!8469))

(declare-fun m!8471 () Bool)

(assert (=> b!6677 m!8471))

(declare-fun m!8473 () Bool)

(assert (=> b!6678 m!8473))

(declare-fun m!8475 () Bool)

(assert (=> b!6676 m!8475))

(declare-fun m!8477 () Bool)

(assert (=> b!6676 m!8477))

(declare-fun m!8479 () Bool)

(assert (=> b!6676 m!8479))

(declare-fun m!8481 () Bool)

(assert (=> b!6676 m!8481))

(declare-fun m!8483 () Bool)

(assert (=> b!6676 m!8483))

(declare-fun m!8485 () Bool)

(assert (=> b!6676 m!8485))

(push 1)

(assert (not start!1428))

(assert (not b!6683))

(assert (not b!6676))

(assert (not b!6678))

(assert (not b!6680))

(assert (not b!6682))

(assert (not b!6684))

(assert (not b!6677))

(assert (not b!6681))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

