; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1434 () Bool)

(assert start!1434)

(declare-fun res!7669 () Bool)

(declare-fun e!4274 () Bool)

(assert (=> start!1434 (=> (not res!7669) (not e!4274))))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!472 0))(
  ( (array!473 (arr!603 (Array (_ BitVec 32) (_ BitVec 8))) (size!204 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!472)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!1434 (= res!7669 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!204 srcBuffer!6))))))))

(assert (=> start!1434 e!4274))

(assert (=> start!1434 true))

(declare-fun array_inv!199 (array!472) Bool)

(assert (=> start!1434 (array_inv!199 srcBuffer!6)))

(declare-datatypes ((BitStream!386 0))(
  ( (BitStream!387 (buf!534 array!472) (currentByte!1531 (_ BitVec 32)) (currentBit!1526 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!386)

(declare-fun e!4277 () Bool)

(declare-fun inv!12 (BitStream!386) Bool)

(assert (=> start!1434 (and (inv!12 thiss!1486) e!4277)))

(declare-fun b!6765 () Bool)

(declare-fun e!4271 () Bool)

(assert (=> b!6765 (= e!4271 (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(declare-fun b!6766 () Bool)

(declare-fun e!4273 () Bool)

(assert (=> b!6766 (= e!4273 e!4271)))

(declare-fun res!7672 () Bool)

(assert (=> b!6766 (=> res!7672 e!4271)))

(declare-datatypes ((tuple2!904 0))(
  ( (tuple2!905 (_1!477 array!472) (_2!477 BitStream!386)) )
))
(declare-fun lt!8743 () tuple2!904)

(declare-datatypes ((Unit!530 0))(
  ( (Unit!531) )
))
(declare-datatypes ((tuple2!906 0))(
  ( (tuple2!907 (_1!478 Unit!530) (_2!478 BitStream!386)) )
))
(declare-fun lt!8745 () tuple2!906)

(declare-fun checkByteArrayBitContent!0 (BitStream!386 array!472 array!472 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!6766 (= res!7672 (not (checkByteArrayBitContent!0 (_2!478 lt!8745) srcBuffer!6 (_1!477 lt!8743) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))))

(declare-fun lt!8744 () Unit!530)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!386 array!472 array!472 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!530)

(assert (=> b!6766 (= lt!8744 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!478 lt!8745) srcBuffer!6 (_1!477 lt!8743) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!6767 () Bool)

(declare-fun res!7666 () Bool)

(declare-fun e!4272 () Bool)

(assert (=> b!6767 (=> (not res!7666) (not e!4272))))

(assert (=> b!6767 (= res!7666 (= (size!204 (buf!534 thiss!1486)) (size!204 (buf!534 (_2!478 lt!8745)))))))

(declare-fun b!6768 () Bool)

(declare-fun res!7664 () Bool)

(assert (=> b!6768 (=> (not res!7664) (not e!4272))))

(declare-fun isPrefixOf!0 (BitStream!386 BitStream!386) Bool)

(assert (=> b!6768 (= res!7664 (isPrefixOf!0 thiss!1486 (_2!478 lt!8745)))))

(declare-fun b!6769 () Bool)

(assert (=> b!6769 (= e!4272 (not e!4273))))

(declare-fun res!7665 () Bool)

(assert (=> b!6769 (=> res!7665 e!4273)))

(declare-datatypes ((List!104 0))(
  ( (Nil!101) (Cons!100 (h!219 Bool) (t!854 List!104)) )
))
(declare-fun lt!8746 () List!104)

(declare-fun byteArrayBitContentToList!0 (BitStream!386 array!472 (_ BitVec 64) (_ BitVec 64)) List!104)

(assert (=> b!6769 (= res!7665 (not (= (byteArrayBitContentToList!0 (_2!478 lt!8745) (_1!477 lt!8743) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!8746)))))

(declare-datatypes ((tuple2!908 0))(
  ( (tuple2!909 (_1!479 BitStream!386) (_2!479 BitStream!386)) )
))
(declare-fun lt!8747 () tuple2!908)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!386 BitStream!386 (_ BitVec 64)) List!104)

(assert (=> b!6769 (= lt!8746 (bitStreamReadBitsIntoList!0 (_2!478 lt!8745) (_1!479 lt!8747) nBits!460))))

(declare-fun readBits!0 (BitStream!386 (_ BitVec 64)) tuple2!904)

(assert (=> b!6769 (= lt!8743 (readBits!0 (_1!479 lt!8747) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!6769 (validate_offset_bits!1 ((_ sign_extend 32) (size!204 (buf!534 (_2!478 lt!8745)))) ((_ sign_extend 32) (currentByte!1531 thiss!1486)) ((_ sign_extend 32) (currentBit!1526 thiss!1486)) nBits!460)))

(declare-fun lt!8742 () Unit!530)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!386 array!472 (_ BitVec 64)) Unit!530)

(assert (=> b!6769 (= lt!8742 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!534 (_2!478 lt!8745)) nBits!460))))

(declare-fun reader!0 (BitStream!386 BitStream!386) tuple2!908)

(assert (=> b!6769 (= lt!8747 (reader!0 thiss!1486 (_2!478 lt!8745)))))

(declare-fun b!6770 () Bool)

(declare-fun res!7667 () Bool)

(assert (=> b!6770 (=> (not res!7667) (not e!4274))))

(assert (=> b!6770 (= res!7667 (validate_offset_bits!1 ((_ sign_extend 32) (size!204 (buf!534 thiss!1486))) ((_ sign_extend 32) (currentByte!1531 thiss!1486)) ((_ sign_extend 32) (currentBit!1526 thiss!1486)) nBits!460))))

(declare-fun b!6771 () Bool)

(declare-fun res!7668 () Bool)

(assert (=> b!6771 (=> res!7668 e!4273)))

(assert (=> b!6771 (= res!7668 (not (= lt!8746 (byteArrayBitContentToList!0 (_2!478 lt!8745) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!6772 () Bool)

(declare-fun res!7671 () Bool)

(assert (=> b!6772 (=> (not res!7671) (not e!4272))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!6772 (= res!7671 (= (bitIndex!0 (size!204 (buf!534 (_2!478 lt!8745))) (currentByte!1531 (_2!478 lt!8745)) (currentBit!1526 (_2!478 lt!8745))) (bvadd (bitIndex!0 (size!204 (buf!534 thiss!1486)) (currentByte!1531 thiss!1486) (currentBit!1526 thiss!1486)) nBits!460)))))

(declare-fun b!6773 () Bool)

(assert (=> b!6773 (= e!4277 (array_inv!199 (buf!534 thiss!1486)))))

(declare-fun b!6774 () Bool)

(assert (=> b!6774 (= e!4274 e!4272)))

(declare-fun res!7670 () Bool)

(assert (=> b!6774 (=> (not res!7670) (not e!4272))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!6774 (= res!7670 (invariant!0 (currentBit!1526 (_2!478 lt!8745)) (currentByte!1531 (_2!478 lt!8745)) (size!204 (buf!534 (_2!478 lt!8745)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!386 array!472 (_ BitVec 64) (_ BitVec 64)) tuple2!906)

(assert (=> b!6774 (= lt!8745 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(assert (= (and start!1434 res!7669) b!6770))

(assert (= (and b!6770 res!7667) b!6774))

(assert (= (and b!6774 res!7670) b!6767))

(assert (= (and b!6767 res!7666) b!6772))

(assert (= (and b!6772 res!7671) b!6768))

(assert (= (and b!6768 res!7664) b!6769))

(assert (= (and b!6769 (not res!7665)) b!6771))

(assert (= (and b!6771 (not res!7668)) b!6766))

(assert (= (and b!6766 (not res!7672)) b!6765))

(assert (= start!1434 b!6773))

(declare-fun m!8559 () Bool)

(assert (=> b!6771 m!8559))

(declare-fun m!8561 () Bool)

(assert (=> b!6772 m!8561))

(declare-fun m!8563 () Bool)

(assert (=> b!6772 m!8563))

(declare-fun m!8565 () Bool)

(assert (=> b!6770 m!8565))

(declare-fun m!8567 () Bool)

(assert (=> b!6766 m!8567))

(declare-fun m!8569 () Bool)

(assert (=> b!6766 m!8569))

(declare-fun m!8571 () Bool)

(assert (=> b!6768 m!8571))

(declare-fun m!8573 () Bool)

(assert (=> start!1434 m!8573))

(declare-fun m!8575 () Bool)

(assert (=> start!1434 m!8575))

(declare-fun m!8577 () Bool)

(assert (=> b!6773 m!8577))

(declare-fun m!8579 () Bool)

(assert (=> b!6769 m!8579))

(declare-fun m!8581 () Bool)

(assert (=> b!6769 m!8581))

(declare-fun m!8583 () Bool)

(assert (=> b!6769 m!8583))

(declare-fun m!8585 () Bool)

(assert (=> b!6769 m!8585))

(declare-fun m!8587 () Bool)

(assert (=> b!6769 m!8587))

(declare-fun m!8589 () Bool)

(assert (=> b!6769 m!8589))

(declare-fun m!8591 () Bool)

(assert (=> b!6774 m!8591))

(declare-fun m!8593 () Bool)

(assert (=> b!6774 m!8593))

(push 1)

(assert (not b!6768))

(assert (not b!6774))

(assert (not b!6772))

(assert (not b!6771))

(assert (not start!1434))

(assert (not b!6769))

(assert (not b!6766))

(assert (not b!6773))

(assert (not b!6770))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

