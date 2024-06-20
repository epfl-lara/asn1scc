; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1218 () Bool)

(assert start!1218)

(declare-fun b!5455 () Bool)

(declare-fun res!6628 () Bool)

(declare-fun e!3527 () Bool)

(assert (=> b!5455 (=> (not res!6628) (not e!3527))))

(declare-datatypes ((array!412 0))(
  ( (array!413 (arr!570 (Array (_ BitVec 32) (_ BitVec 8))) (size!177 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!332 0))(
  ( (BitStream!333 (buf!501 array!412) (currentByte!1486 (_ BitVec 32)) (currentBit!1481 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!332)

(declare-datatypes ((Unit!428 0))(
  ( (Unit!429) )
))
(declare-datatypes ((tuple2!718 0))(
  ( (tuple2!719 (_1!378 Unit!428) (_2!378 BitStream!332)) )
))
(declare-fun lt!6712 () tuple2!718)

(declare-fun isPrefixOf!0 (BitStream!332 BitStream!332) Bool)

(assert (=> b!5455 (= res!6628 (isPrefixOf!0 thiss!1486 (_2!378 lt!6712)))))

(declare-fun b!5456 () Bool)

(declare-fun res!6627 () Bool)

(declare-fun e!3525 () Bool)

(assert (=> b!5456 (=> res!6627 e!3525)))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!412)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-datatypes ((List!77 0))(
  ( (Nil!74) (Cons!73 (h!192 Bool) (t!827 List!77)) )
))
(declare-fun lt!6711 () List!77)

(declare-fun byteArrayBitContentToList!0 (BitStream!332 array!412 (_ BitVec 64) (_ BitVec 64)) List!77)

(assert (=> b!5456 (= res!6627 (not (= lt!6711 (byteArrayBitContentToList!0 (_2!378 lt!6712) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!5457 () Bool)

(declare-fun res!6631 () Bool)

(assert (=> b!5457 (=> (not res!6631) (not e!3527))))

(assert (=> b!5457 (= res!6631 (= (size!177 (buf!501 thiss!1486)) (size!177 (buf!501 (_2!378 lt!6712)))))))

(declare-fun b!5458 () Bool)

(declare-fun res!6634 () Bool)

(assert (=> b!5458 (=> (not res!6634) (not e!3527))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!5458 (= res!6634 (= (bitIndex!0 (size!177 (buf!501 (_2!378 lt!6712))) (currentByte!1486 (_2!378 lt!6712)) (currentBit!1481 (_2!378 lt!6712))) (bvadd (bitIndex!0 (size!177 (buf!501 thiss!1486)) (currentByte!1486 thiss!1486) (currentBit!1481 thiss!1486)) nBits!460)))))

(declare-fun b!5459 () Bool)

(declare-fun res!6630 () Bool)

(declare-fun e!3526 () Bool)

(assert (=> b!5459 (=> (not res!6630) (not e!3526))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!5459 (= res!6630 (validate_offset_bits!1 ((_ sign_extend 32) (size!177 (buf!501 thiss!1486))) ((_ sign_extend 32) (currentByte!1486 thiss!1486)) ((_ sign_extend 32) (currentBit!1481 thiss!1486)) nBits!460))))

(declare-fun b!5460 () Bool)

(assert (=> b!5460 (= e!3526 e!3527)))

(declare-fun res!6633 () Bool)

(assert (=> b!5460 (=> (not res!6633) (not e!3527))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!5460 (= res!6633 (invariant!0 (currentBit!1481 (_2!378 lt!6712)) (currentByte!1486 (_2!378 lt!6712)) (size!177 (buf!501 (_2!378 lt!6712)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!332 array!412 (_ BitVec 64) (_ BitVec 64)) tuple2!718)

(assert (=> b!5460 (= lt!6712 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!5461 () Bool)

(assert (=> b!5461 (= e!3525 true)))

(declare-datatypes ((tuple2!720 0))(
  ( (tuple2!721 (_1!379 array!412) (_2!379 BitStream!332)) )
))
(declare-fun lt!6713 () tuple2!720)

(declare-fun lt!6708 () Unit!428)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!332 array!412 array!412 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!428)

(assert (=> b!5461 (= lt!6708 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!378 lt!6712) srcBuffer!6 (_1!379 lt!6713) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun res!6632 () Bool)

(assert (=> start!1218 (=> (not res!6632) (not e!3526))))

(assert (=> start!1218 (= res!6632 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!177 srcBuffer!6))))))))

(assert (=> start!1218 e!3526))

(assert (=> start!1218 true))

(declare-fun array_inv!172 (array!412) Bool)

(assert (=> start!1218 (array_inv!172 srcBuffer!6)))

(declare-fun e!3522 () Bool)

(declare-fun inv!12 (BitStream!332) Bool)

(assert (=> start!1218 (and (inv!12 thiss!1486) e!3522)))

(declare-fun b!5462 () Bool)

(assert (=> b!5462 (= e!3522 (array_inv!172 (buf!501 thiss!1486)))))

(declare-fun b!5463 () Bool)

(assert (=> b!5463 (= e!3527 (not e!3525))))

(declare-fun res!6629 () Bool)

(assert (=> b!5463 (=> res!6629 e!3525)))

(assert (=> b!5463 (= res!6629 (not (= (byteArrayBitContentToList!0 (_2!378 lt!6712) (_1!379 lt!6713) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!6711)))))

(declare-datatypes ((tuple2!722 0))(
  ( (tuple2!723 (_1!380 BitStream!332) (_2!380 BitStream!332)) )
))
(declare-fun lt!6710 () tuple2!722)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!332 BitStream!332 (_ BitVec 64)) List!77)

(assert (=> b!5463 (= lt!6711 (bitStreamReadBitsIntoList!0 (_2!378 lt!6712) (_1!380 lt!6710) nBits!460))))

(declare-fun readBits!0 (BitStream!332 (_ BitVec 64)) tuple2!720)

(assert (=> b!5463 (= lt!6713 (readBits!0 (_1!380 lt!6710) nBits!460))))

(assert (=> b!5463 (validate_offset_bits!1 ((_ sign_extend 32) (size!177 (buf!501 (_2!378 lt!6712)))) ((_ sign_extend 32) (currentByte!1486 thiss!1486)) ((_ sign_extend 32) (currentBit!1481 thiss!1486)) nBits!460)))

(declare-fun lt!6709 () Unit!428)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!332 array!412 (_ BitVec 64)) Unit!428)

(assert (=> b!5463 (= lt!6709 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!501 (_2!378 lt!6712)) nBits!460))))

(declare-fun reader!0 (BitStream!332 BitStream!332) tuple2!722)

(assert (=> b!5463 (= lt!6710 (reader!0 thiss!1486 (_2!378 lt!6712)))))

(assert (= (and start!1218 res!6632) b!5459))

(assert (= (and b!5459 res!6630) b!5460))

(assert (= (and b!5460 res!6633) b!5457))

(assert (= (and b!5457 res!6631) b!5458))

(assert (= (and b!5458 res!6634) b!5455))

(assert (= (and b!5455 res!6628) b!5463))

(assert (= (and b!5463 (not res!6629)) b!5456))

(assert (= (and b!5456 (not res!6627)) b!5461))

(assert (= start!1218 b!5462))

(declare-fun m!6659 () Bool)

(assert (=> b!5456 m!6659))

(declare-fun m!6661 () Bool)

(assert (=> b!5460 m!6661))

(declare-fun m!6663 () Bool)

(assert (=> b!5460 m!6663))

(declare-fun m!6665 () Bool)

(assert (=> b!5462 m!6665))

(declare-fun m!6667 () Bool)

(assert (=> b!5458 m!6667))

(declare-fun m!6669 () Bool)

(assert (=> b!5458 m!6669))

(declare-fun m!6671 () Bool)

(assert (=> start!1218 m!6671))

(declare-fun m!6673 () Bool)

(assert (=> start!1218 m!6673))

(declare-fun m!6675 () Bool)

(assert (=> b!5459 m!6675))

(declare-fun m!6677 () Bool)

(assert (=> b!5463 m!6677))

(declare-fun m!6679 () Bool)

(assert (=> b!5463 m!6679))

(declare-fun m!6681 () Bool)

(assert (=> b!5463 m!6681))

(declare-fun m!6683 () Bool)

(assert (=> b!5463 m!6683))

(declare-fun m!6685 () Bool)

(assert (=> b!5463 m!6685))

(declare-fun m!6687 () Bool)

(assert (=> b!5463 m!6687))

(declare-fun m!6689 () Bool)

(assert (=> b!5455 m!6689))

(declare-fun m!6691 () Bool)

(assert (=> b!5461 m!6691))

(push 1)

(assert (not b!5455))

(assert (not b!5461))

(assert (not b!5459))

(assert (not b!5463))

(assert (not b!5458))

(assert (not b!5456))

(assert (not b!5460))

(assert (not start!1218))

(assert (not b!5462))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

