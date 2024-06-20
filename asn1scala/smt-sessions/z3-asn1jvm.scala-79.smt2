; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1552 () Bool)

(assert start!1552)

(declare-fun b!7543 () Bool)

(declare-fun e!4729 () Bool)

(declare-datatypes ((array!509 0))(
  ( (array!510 (arr!623 (Array (_ BitVec 32) (_ BitVec 8))) (size!221 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!420 0))(
  ( (BitStream!421 (buf!554 array!509) (currentByte!1557 (_ BitVec 32)) (currentBit!1552 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!420)

(declare-fun array_inv!216 (array!509) Bool)

(assert (=> b!7543 (= e!4729 (array_inv!216 (buf!554 thiss!1486)))))

(declare-fun b!7544 () Bool)

(declare-fun res!8296 () Bool)

(declare-fun e!4733 () Bool)

(assert (=> b!7544 (=> (not res!8296) (not e!4733))))

(declare-datatypes ((Unit!588 0))(
  ( (Unit!589) )
))
(declare-datatypes ((tuple2!1018 0))(
  ( (tuple2!1019 (_1!537 Unit!588) (_2!537 BitStream!420)) )
))
(declare-fun lt!9823 () tuple2!1018)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!7544 (= res!8296 (= (bitIndex!0 (size!221 (buf!554 (_2!537 lt!9823))) (currentByte!1557 (_2!537 lt!9823)) (currentBit!1552 (_2!537 lt!9823))) (bvadd (bitIndex!0 (size!221 (buf!554 thiss!1486)) (currentByte!1557 thiss!1486) (currentBit!1552 thiss!1486)) nBits!460)))))

(declare-fun b!7545 () Bool)

(declare-fun res!8297 () Bool)

(declare-fun e!4730 () Bool)

(assert (=> b!7545 (=> (not res!8297) (not e!4730))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!7545 (= res!8297 (validate_offset_bits!1 ((_ sign_extend 32) (size!221 (buf!554 thiss!1486))) ((_ sign_extend 32) (currentByte!1557 thiss!1486)) ((_ sign_extend 32) (currentBit!1552 thiss!1486)) nBits!460))))

(declare-fun b!7546 () Bool)

(declare-fun res!8300 () Bool)

(declare-fun e!4731 () Bool)

(assert (=> b!7546 (=> res!8300 e!4731)))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!509)

(declare-datatypes ((List!121 0))(
  ( (Nil!118) (Cons!117 (h!236 Bool) (t!871 List!121)) )
))
(declare-fun lt!9822 () List!121)

(declare-fun byteArrayBitContentToList!0 (BitStream!420 array!509 (_ BitVec 64) (_ BitVec 64)) List!121)

(assert (=> b!7546 (= res!8300 (not (= lt!9822 (byteArrayBitContentToList!0 (_2!537 lt!9823) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!7548 () Bool)

(assert (=> b!7548 (= e!4731 true)))

(declare-fun lt!9826 () Unit!588)

(declare-datatypes ((tuple2!1020 0))(
  ( (tuple2!1021 (_1!538 array!509) (_2!538 BitStream!420)) )
))
(declare-fun lt!9827 () tuple2!1020)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!420 array!509 array!509 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!588)

(assert (=> b!7548 (= lt!9826 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!537 lt!9823) srcBuffer!6 (_1!538 lt!9827) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!7549 () Bool)

(assert (=> b!7549 (= e!4730 e!4733)))

(declare-fun res!8299 () Bool)

(assert (=> b!7549 (=> (not res!8299) (not e!4733))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!7549 (= res!8299 (invariant!0 (currentBit!1552 (_2!537 lt!9823)) (currentByte!1557 (_2!537 lt!9823)) (size!221 (buf!554 (_2!537 lt!9823)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!420 array!509 (_ BitVec 64) (_ BitVec 64)) tuple2!1018)

(assert (=> b!7549 (= lt!9823 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!7547 () Bool)

(declare-fun res!8295 () Bool)

(assert (=> b!7547 (=> (not res!8295) (not e!4733))))

(assert (=> b!7547 (= res!8295 (= (size!221 (buf!554 thiss!1486)) (size!221 (buf!554 (_2!537 lt!9823)))))))

(declare-fun res!8302 () Bool)

(assert (=> start!1552 (=> (not res!8302) (not e!4730))))

(assert (=> start!1552 (= res!8302 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!221 srcBuffer!6))))))))

(assert (=> start!1552 e!4730))

(assert (=> start!1552 true))

(assert (=> start!1552 (array_inv!216 srcBuffer!6)))

(declare-fun inv!12 (BitStream!420) Bool)

(assert (=> start!1552 (and (inv!12 thiss!1486) e!4729)))

(declare-fun b!7550 () Bool)

(declare-fun res!8301 () Bool)

(assert (=> b!7550 (=> (not res!8301) (not e!4733))))

(declare-fun isPrefixOf!0 (BitStream!420 BitStream!420) Bool)

(assert (=> b!7550 (= res!8301 (isPrefixOf!0 thiss!1486 (_2!537 lt!9823)))))

(declare-fun b!7551 () Bool)

(assert (=> b!7551 (= e!4733 (not e!4731))))

(declare-fun res!8298 () Bool)

(assert (=> b!7551 (=> res!8298 e!4731)))

(assert (=> b!7551 (= res!8298 (not (= (byteArrayBitContentToList!0 (_2!537 lt!9823) (_1!538 lt!9827) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!9822)))))

(declare-datatypes ((tuple2!1022 0))(
  ( (tuple2!1023 (_1!539 BitStream!420) (_2!539 BitStream!420)) )
))
(declare-fun lt!9825 () tuple2!1022)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!420 BitStream!420 (_ BitVec 64)) List!121)

(assert (=> b!7551 (= lt!9822 (bitStreamReadBitsIntoList!0 (_2!537 lt!9823) (_1!539 lt!9825) nBits!460))))

(declare-fun readBits!0 (BitStream!420 (_ BitVec 64)) tuple2!1020)

(assert (=> b!7551 (= lt!9827 (readBits!0 (_1!539 lt!9825) nBits!460))))

(assert (=> b!7551 (validate_offset_bits!1 ((_ sign_extend 32) (size!221 (buf!554 (_2!537 lt!9823)))) ((_ sign_extend 32) (currentByte!1557 thiss!1486)) ((_ sign_extend 32) (currentBit!1552 thiss!1486)) nBits!460)))

(declare-fun lt!9824 () Unit!588)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!420 array!509 (_ BitVec 64)) Unit!588)

(assert (=> b!7551 (= lt!9824 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!554 (_2!537 lt!9823)) nBits!460))))

(declare-fun reader!0 (BitStream!420 BitStream!420) tuple2!1022)

(assert (=> b!7551 (= lt!9825 (reader!0 thiss!1486 (_2!537 lt!9823)))))

(assert (= (and start!1552 res!8302) b!7545))

(assert (= (and b!7545 res!8297) b!7549))

(assert (= (and b!7549 res!8299) b!7547))

(assert (= (and b!7547 res!8295) b!7544))

(assert (= (and b!7544 res!8296) b!7550))

(assert (= (and b!7550 res!8301) b!7551))

(assert (= (and b!7551 (not res!8298)) b!7546))

(assert (= (and b!7546 (not res!8300)) b!7548))

(assert (= start!1552 b!7543))

(declare-fun m!9649 () Bool)

(assert (=> b!7551 m!9649))

(declare-fun m!9651 () Bool)

(assert (=> b!7551 m!9651))

(declare-fun m!9653 () Bool)

(assert (=> b!7551 m!9653))

(declare-fun m!9655 () Bool)

(assert (=> b!7551 m!9655))

(declare-fun m!9657 () Bool)

(assert (=> b!7551 m!9657))

(declare-fun m!9659 () Bool)

(assert (=> b!7551 m!9659))

(declare-fun m!9661 () Bool)

(assert (=> b!7546 m!9661))

(declare-fun m!9663 () Bool)

(assert (=> start!1552 m!9663))

(declare-fun m!9665 () Bool)

(assert (=> start!1552 m!9665))

(declare-fun m!9667 () Bool)

(assert (=> b!7550 m!9667))

(declare-fun m!9669 () Bool)

(assert (=> b!7549 m!9669))

(declare-fun m!9671 () Bool)

(assert (=> b!7549 m!9671))

(declare-fun m!9673 () Bool)

(assert (=> b!7543 m!9673))

(declare-fun m!9675 () Bool)

(assert (=> b!7544 m!9675))

(declare-fun m!9677 () Bool)

(assert (=> b!7544 m!9677))

(declare-fun m!9679 () Bool)

(assert (=> b!7545 m!9679))

(declare-fun m!9681 () Bool)

(assert (=> b!7548 m!9681))

(check-sat (not b!7550) (not b!7546) (not b!7543) (not b!7551) (not b!7548) (not b!7545) (not start!1552) (not b!7549) (not b!7544))
