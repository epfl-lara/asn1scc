; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1554 () Bool)

(assert start!1554)

(declare-fun b!7570 () Bool)

(declare-fun res!8320 () Bool)

(declare-fun e!4746 () Bool)

(assert (=> b!7570 (=> (not res!8320) (not e!4746))))

(declare-datatypes ((array!511 0))(
  ( (array!512 (arr!624 (Array (_ BitVec 32) (_ BitVec 8))) (size!222 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!422 0))(
  ( (BitStream!423 (buf!555 array!511) (currentByte!1558 (_ BitVec 32)) (currentBit!1553 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!422)

(declare-datatypes ((Unit!590 0))(
  ( (Unit!591) )
))
(declare-datatypes ((tuple2!1024 0))(
  ( (tuple2!1025 (_1!540 Unit!590) (_2!540 BitStream!422)) )
))
(declare-fun lt!9840 () tuple2!1024)

(assert (=> b!7570 (= res!8320 (= (size!222 (buf!555 thiss!1486)) (size!222 (buf!555 (_2!540 lt!9840)))))))

(declare-fun b!7571 () Bool)

(declare-fun e!4747 () Bool)

(declare-fun array_inv!217 (array!511) Bool)

(assert (=> b!7571 (= e!4747 (array_inv!217 (buf!555 thiss!1486)))))

(declare-fun b!7572 () Bool)

(declare-fun res!8323 () Bool)

(assert (=> b!7572 (=> (not res!8323) (not e!4746))))

(declare-fun isPrefixOf!0 (BitStream!422 BitStream!422) Bool)

(assert (=> b!7572 (= res!8323 (isPrefixOf!0 thiss!1486 (_2!540 lt!9840)))))

(declare-fun b!7573 () Bool)

(declare-fun e!4750 () Bool)

(assert (=> b!7573 (= e!4750 e!4746)))

(declare-fun res!8322 () Bool)

(assert (=> b!7573 (=> (not res!8322) (not e!4746))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!7573 (= res!8322 (invariant!0 (currentBit!1553 (_2!540 lt!9840)) (currentByte!1558 (_2!540 lt!9840)) (size!222 (buf!555 (_2!540 lt!9840)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!511)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!422 array!511 (_ BitVec 64) (_ BitVec 64)) tuple2!1024)

(assert (=> b!7573 (= lt!9840 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!7574 () Bool)

(declare-fun e!4749 () Bool)

(assert (=> b!7574 (= e!4746 (not e!4749))))

(declare-fun res!8325 () Bool)

(assert (=> b!7574 (=> res!8325 e!4749)))

(declare-datatypes ((List!122 0))(
  ( (Nil!119) (Cons!118 (h!237 Bool) (t!872 List!122)) )
))
(declare-fun lt!9845 () List!122)

(declare-datatypes ((tuple2!1026 0))(
  ( (tuple2!1027 (_1!541 array!511) (_2!541 BitStream!422)) )
))
(declare-fun lt!9842 () tuple2!1026)

(declare-fun byteArrayBitContentToList!0 (BitStream!422 array!511 (_ BitVec 64) (_ BitVec 64)) List!122)

(assert (=> b!7574 (= res!8325 (not (= (byteArrayBitContentToList!0 (_2!540 lt!9840) (_1!541 lt!9842) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!9845)))))

(declare-datatypes ((tuple2!1028 0))(
  ( (tuple2!1029 (_1!542 BitStream!422) (_2!542 BitStream!422)) )
))
(declare-fun lt!9844 () tuple2!1028)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!422 BitStream!422 (_ BitVec 64)) List!122)

(assert (=> b!7574 (= lt!9845 (bitStreamReadBitsIntoList!0 (_2!540 lt!9840) (_1!542 lt!9844) nBits!460))))

(declare-fun readBits!0 (BitStream!422 (_ BitVec 64)) tuple2!1026)

(assert (=> b!7574 (= lt!9842 (readBits!0 (_1!542 lt!9844) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!7574 (validate_offset_bits!1 ((_ sign_extend 32) (size!222 (buf!555 (_2!540 lt!9840)))) ((_ sign_extend 32) (currentByte!1558 thiss!1486)) ((_ sign_extend 32) (currentBit!1553 thiss!1486)) nBits!460)))

(declare-fun lt!9843 () Unit!590)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!422 array!511 (_ BitVec 64)) Unit!590)

(assert (=> b!7574 (= lt!9843 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!555 (_2!540 lt!9840)) nBits!460))))

(declare-fun reader!0 (BitStream!422 BitStream!422) tuple2!1028)

(assert (=> b!7574 (= lt!9844 (reader!0 thiss!1486 (_2!540 lt!9840)))))

(declare-fun b!7575 () Bool)

(declare-fun res!8326 () Bool)

(assert (=> b!7575 (=> (not res!8326) (not e!4750))))

(assert (=> b!7575 (= res!8326 (validate_offset_bits!1 ((_ sign_extend 32) (size!222 (buf!555 thiss!1486))) ((_ sign_extend 32) (currentByte!1558 thiss!1486)) ((_ sign_extend 32) (currentBit!1553 thiss!1486)) nBits!460))))

(declare-fun b!7576 () Bool)

(declare-fun res!8319 () Bool)

(assert (=> b!7576 (=> (not res!8319) (not e!4746))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!7576 (= res!8319 (= (bitIndex!0 (size!222 (buf!555 (_2!540 lt!9840))) (currentByte!1558 (_2!540 lt!9840)) (currentBit!1553 (_2!540 lt!9840))) (bvadd (bitIndex!0 (size!222 (buf!555 thiss!1486)) (currentByte!1558 thiss!1486) (currentBit!1553 thiss!1486)) nBits!460)))))

(declare-fun b!7577 () Bool)

(declare-fun res!8321 () Bool)

(assert (=> b!7577 (=> res!8321 e!4749)))

(assert (=> b!7577 (= res!8321 (not (= lt!9845 (byteArrayBitContentToList!0 (_2!540 lt!9840) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!7578 () Bool)

(assert (=> b!7578 (= e!4749 true)))

(declare-fun lt!9841 () Unit!590)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!422 array!511 array!511 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!590)

(assert (=> b!7578 (= lt!9841 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!540 lt!9840) srcBuffer!6 (_1!541 lt!9842) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun res!8324 () Bool)

(assert (=> start!1554 (=> (not res!8324) (not e!4750))))

(assert (=> start!1554 (= res!8324 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!222 srcBuffer!6))))))))

(assert (=> start!1554 e!4750))

(assert (=> start!1554 true))

(assert (=> start!1554 (array_inv!217 srcBuffer!6)))

(declare-fun inv!12 (BitStream!422) Bool)

(assert (=> start!1554 (and (inv!12 thiss!1486) e!4747)))

(assert (= (and start!1554 res!8324) b!7575))

(assert (= (and b!7575 res!8326) b!7573))

(assert (= (and b!7573 res!8322) b!7570))

(assert (= (and b!7570 res!8320) b!7576))

(assert (= (and b!7576 res!8319) b!7572))

(assert (= (and b!7572 res!8323) b!7574))

(assert (= (and b!7574 (not res!8325)) b!7577))

(assert (= (and b!7577 (not res!8321)) b!7578))

(assert (= start!1554 b!7571))

(declare-fun m!9683 () Bool)

(assert (=> b!7577 m!9683))

(declare-fun m!9685 () Bool)

(assert (=> b!7578 m!9685))

(declare-fun m!9687 () Bool)

(assert (=> b!7571 m!9687))

(declare-fun m!9689 () Bool)

(assert (=> b!7572 m!9689))

(declare-fun m!9691 () Bool)

(assert (=> b!7576 m!9691))

(declare-fun m!9693 () Bool)

(assert (=> b!7576 m!9693))

(declare-fun m!9695 () Bool)

(assert (=> b!7573 m!9695))

(declare-fun m!9697 () Bool)

(assert (=> b!7573 m!9697))

(declare-fun m!9699 () Bool)

(assert (=> start!1554 m!9699))

(declare-fun m!9701 () Bool)

(assert (=> start!1554 m!9701))

(declare-fun m!9703 () Bool)

(assert (=> b!7575 m!9703))

(declare-fun m!9705 () Bool)

(assert (=> b!7574 m!9705))

(declare-fun m!9707 () Bool)

(assert (=> b!7574 m!9707))

(declare-fun m!9709 () Bool)

(assert (=> b!7574 m!9709))

(declare-fun m!9711 () Bool)

(assert (=> b!7574 m!9711))

(declare-fun m!9713 () Bool)

(assert (=> b!7574 m!9713))

(declare-fun m!9715 () Bool)

(assert (=> b!7574 m!9715))

(push 1)

(assert (not b!7578))

(assert (not b!7571))

(assert (not b!7577))

(assert (not b!7574))

(assert (not b!7572))

(assert (not b!7576))

(assert (not b!7575))

(assert (not b!7573))

(assert (not start!1554))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

