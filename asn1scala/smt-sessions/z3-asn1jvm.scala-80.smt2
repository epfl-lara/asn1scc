; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1558 () Bool)

(assert start!1558)

(declare-fun b!7624 () Bool)

(declare-fun res!8372 () Bool)

(declare-fun e!4783 () Bool)

(assert (=> b!7624 (=> res!8372 e!4783)))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((List!124 0))(
  ( (Nil!121) (Cons!120 (h!239 Bool) (t!874 List!124)) )
))
(declare-fun lt!9879 () List!124)

(declare-datatypes ((array!515 0))(
  ( (array!516 (arr!626 (Array (_ BitVec 32) (_ BitVec 8))) (size!224 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!515)

(declare-datatypes ((BitStream!426 0))(
  ( (BitStream!427 (buf!557 array!515) (currentByte!1560 (_ BitVec 32)) (currentBit!1555 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!594 0))(
  ( (Unit!595) )
))
(declare-datatypes ((tuple2!1036 0))(
  ( (tuple2!1037 (_1!546 Unit!594) (_2!546 BitStream!426)) )
))
(declare-fun lt!9876 () tuple2!1036)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun byteArrayBitContentToList!0 (BitStream!426 array!515 (_ BitVec 64) (_ BitVec 64)) List!124)

(assert (=> b!7624 (= res!8372 (not (= lt!9879 (byteArrayBitContentToList!0 (_2!546 lt!9876) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!7625 () Bool)

(declare-fun res!8371 () Bool)

(declare-fun e!4782 () Bool)

(assert (=> b!7625 (=> (not res!8371) (not e!4782))))

(declare-fun thiss!1486 () BitStream!426)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!7625 (= res!8371 (= (bitIndex!0 (size!224 (buf!557 (_2!546 lt!9876))) (currentByte!1560 (_2!546 lt!9876)) (currentBit!1555 (_2!546 lt!9876))) (bvadd (bitIndex!0 (size!224 (buf!557 thiss!1486)) (currentByte!1560 thiss!1486) (currentBit!1555 thiss!1486)) nBits!460)))))

(declare-fun res!8374 () Bool)

(declare-fun e!4784 () Bool)

(assert (=> start!1558 (=> (not res!8374) (not e!4784))))

(assert (=> start!1558 (= res!8374 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!224 srcBuffer!6))))))))

(assert (=> start!1558 e!4784))

(assert (=> start!1558 true))

(declare-fun array_inv!219 (array!515) Bool)

(assert (=> start!1558 (array_inv!219 srcBuffer!6)))

(declare-fun e!4786 () Bool)

(declare-fun inv!12 (BitStream!426) Bool)

(assert (=> start!1558 (and (inv!12 thiss!1486) e!4786)))

(declare-fun b!7626 () Bool)

(declare-fun res!8370 () Bool)

(assert (=> b!7626 (=> (not res!8370) (not e!4784))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!7626 (= res!8370 (validate_offset_bits!1 ((_ sign_extend 32) (size!224 (buf!557 thiss!1486))) ((_ sign_extend 32) (currentByte!1560 thiss!1486)) ((_ sign_extend 32) (currentBit!1555 thiss!1486)) nBits!460))))

(declare-fun b!7627 () Bool)

(assert (=> b!7627 (= e!4783 true)))

(declare-fun lt!9878 () Unit!594)

(declare-datatypes ((tuple2!1038 0))(
  ( (tuple2!1039 (_1!547 array!515) (_2!547 BitStream!426)) )
))
(declare-fun lt!9877 () tuple2!1038)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!426 array!515 array!515 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!594)

(assert (=> b!7627 (= lt!9878 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!546 lt!9876) srcBuffer!6 (_1!547 lt!9877) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!7628 () Bool)

(declare-fun res!8368 () Bool)

(assert (=> b!7628 (=> (not res!8368) (not e!4782))))

(declare-fun isPrefixOf!0 (BitStream!426 BitStream!426) Bool)

(assert (=> b!7628 (= res!8368 (isPrefixOf!0 thiss!1486 (_2!546 lt!9876)))))

(declare-fun b!7629 () Bool)

(assert (=> b!7629 (= e!4784 e!4782)))

(declare-fun res!8367 () Bool)

(assert (=> b!7629 (=> (not res!8367) (not e!4782))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!7629 (= res!8367 (invariant!0 (currentBit!1555 (_2!546 lt!9876)) (currentByte!1560 (_2!546 lt!9876)) (size!224 (buf!557 (_2!546 lt!9876)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!426 array!515 (_ BitVec 64) (_ BitVec 64)) tuple2!1036)

(assert (=> b!7629 (= lt!9876 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!7630 () Bool)

(declare-fun res!8373 () Bool)

(assert (=> b!7630 (=> (not res!8373) (not e!4782))))

(assert (=> b!7630 (= res!8373 (= (size!224 (buf!557 thiss!1486)) (size!224 (buf!557 (_2!546 lt!9876)))))))

(declare-fun b!7631 () Bool)

(assert (=> b!7631 (= e!4786 (array_inv!219 (buf!557 thiss!1486)))))

(declare-fun b!7632 () Bool)

(assert (=> b!7632 (= e!4782 (not e!4783))))

(declare-fun res!8369 () Bool)

(assert (=> b!7632 (=> res!8369 e!4783)))

(assert (=> b!7632 (= res!8369 (not (= (byteArrayBitContentToList!0 (_2!546 lt!9876) (_1!547 lt!9877) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!9879)))))

(declare-datatypes ((tuple2!1040 0))(
  ( (tuple2!1041 (_1!548 BitStream!426) (_2!548 BitStream!426)) )
))
(declare-fun lt!9881 () tuple2!1040)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!426 BitStream!426 (_ BitVec 64)) List!124)

(assert (=> b!7632 (= lt!9879 (bitStreamReadBitsIntoList!0 (_2!546 lt!9876) (_1!548 lt!9881) nBits!460))))

(declare-fun readBits!0 (BitStream!426 (_ BitVec 64)) tuple2!1038)

(assert (=> b!7632 (= lt!9877 (readBits!0 (_1!548 lt!9881) nBits!460))))

(assert (=> b!7632 (validate_offset_bits!1 ((_ sign_extend 32) (size!224 (buf!557 (_2!546 lt!9876)))) ((_ sign_extend 32) (currentByte!1560 thiss!1486)) ((_ sign_extend 32) (currentBit!1555 thiss!1486)) nBits!460)))

(declare-fun lt!9880 () Unit!594)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!426 array!515 (_ BitVec 64)) Unit!594)

(assert (=> b!7632 (= lt!9880 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!557 (_2!546 lt!9876)) nBits!460))))

(declare-fun reader!0 (BitStream!426 BitStream!426) tuple2!1040)

(assert (=> b!7632 (= lt!9881 (reader!0 thiss!1486 (_2!546 lt!9876)))))

(assert (= (and start!1558 res!8374) b!7626))

(assert (= (and b!7626 res!8370) b!7629))

(assert (= (and b!7629 res!8367) b!7630))

(assert (= (and b!7630 res!8373) b!7625))

(assert (= (and b!7625 res!8371) b!7628))

(assert (= (and b!7628 res!8368) b!7632))

(assert (= (and b!7632 (not res!8369)) b!7624))

(assert (= (and b!7624 (not res!8372)) b!7627))

(assert (= start!1558 b!7631))

(declare-fun m!9751 () Bool)

(assert (=> b!7631 m!9751))

(declare-fun m!9753 () Bool)

(assert (=> b!7629 m!9753))

(declare-fun m!9755 () Bool)

(assert (=> b!7629 m!9755))

(declare-fun m!9757 () Bool)

(assert (=> b!7627 m!9757))

(declare-fun m!9759 () Bool)

(assert (=> b!7625 m!9759))

(declare-fun m!9761 () Bool)

(assert (=> b!7625 m!9761))

(declare-fun m!9763 () Bool)

(assert (=> b!7628 m!9763))

(declare-fun m!9765 () Bool)

(assert (=> b!7624 m!9765))

(declare-fun m!9767 () Bool)

(assert (=> b!7626 m!9767))

(declare-fun m!9769 () Bool)

(assert (=> b!7632 m!9769))

(declare-fun m!9771 () Bool)

(assert (=> b!7632 m!9771))

(declare-fun m!9773 () Bool)

(assert (=> b!7632 m!9773))

(declare-fun m!9775 () Bool)

(assert (=> b!7632 m!9775))

(declare-fun m!9777 () Bool)

(assert (=> b!7632 m!9777))

(declare-fun m!9779 () Bool)

(assert (=> b!7632 m!9779))

(declare-fun m!9781 () Bool)

(assert (=> start!1558 m!9781))

(declare-fun m!9783 () Bool)

(assert (=> start!1558 m!9783))

(check-sat (not b!7628) (not start!1558) (not b!7631) (not b!7629) (not b!7632) (not b!7625) (not b!7624) (not b!7627) (not b!7626))
