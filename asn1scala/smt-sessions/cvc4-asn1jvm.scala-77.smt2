; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1542 () Bool)

(assert start!1542)

(declare-fun b!7399 () Bool)

(declare-fun res!8173 () Bool)

(declare-fun e!4633 () Bool)

(assert (=> b!7399 (=> (not res!8173) (not e!4633))))

(declare-datatypes ((array!499 0))(
  ( (array!500 (arr!618 (Array (_ BitVec 32) (_ BitVec 8))) (size!216 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!410 0))(
  ( (BitStream!411 (buf!549 array!499) (currentByte!1552 (_ BitVec 32)) (currentBit!1547 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!410)

(declare-datatypes ((Unit!578 0))(
  ( (Unit!579) )
))
(declare-datatypes ((tuple2!988 0))(
  ( (tuple2!989 (_1!522 Unit!578) (_2!522 BitStream!410)) )
))
(declare-fun lt!9735 () tuple2!988)

(assert (=> b!7399 (= res!8173 (= (size!216 (buf!549 thiss!1486)) (size!216 (buf!549 (_2!522 lt!9735)))))))

(declare-fun b!7400 () Bool)

(declare-fun e!4634 () Bool)

(assert (=> b!7400 (= e!4634 true)))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((tuple2!990 0))(
  ( (tuple2!991 (_1!523 array!499) (_2!523 BitStream!410)) )
))
(declare-fun lt!9734 () tuple2!990)

(declare-fun srcBuffer!6 () array!499)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun lt!9733 () Unit!578)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!410 array!499 array!499 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!578)

(assert (=> b!7400 (= lt!9733 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!522 lt!9735) srcBuffer!6 (_1!523 lt!9734) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!7401 () Bool)

(declare-fun e!4631 () Bool)

(assert (=> b!7401 (= e!4631 e!4633)))

(declare-fun res!8172 () Bool)

(assert (=> b!7401 (=> (not res!8172) (not e!4633))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!7401 (= res!8172 (invariant!0 (currentBit!1547 (_2!522 lt!9735)) (currentByte!1552 (_2!522 lt!9735)) (size!216 (buf!549 (_2!522 lt!9735)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!410 array!499 (_ BitVec 64) (_ BitVec 64)) tuple2!988)

(assert (=> b!7401 (= lt!9735 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!7402 () Bool)

(declare-fun res!8170 () Bool)

(assert (=> b!7402 (=> (not res!8170) (not e!4633))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!7402 (= res!8170 (= (bitIndex!0 (size!216 (buf!549 (_2!522 lt!9735))) (currentByte!1552 (_2!522 lt!9735)) (currentBit!1547 (_2!522 lt!9735))) (bvadd (bitIndex!0 (size!216 (buf!549 thiss!1486)) (currentByte!1552 thiss!1486) (currentBit!1547 thiss!1486)) nBits!460)))))

(declare-fun res!8167 () Bool)

(assert (=> start!1542 (=> (not res!8167) (not e!4631))))

(assert (=> start!1542 (= res!8167 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!216 srcBuffer!6))))))))

(assert (=> start!1542 e!4631))

(assert (=> start!1542 true))

(declare-fun array_inv!211 (array!499) Bool)

(assert (=> start!1542 (array_inv!211 srcBuffer!6)))

(declare-fun e!4630 () Bool)

(declare-fun inv!12 (BitStream!410) Bool)

(assert (=> start!1542 (and (inv!12 thiss!1486) e!4630)))

(declare-fun b!7403 () Bool)

(declare-fun res!8169 () Bool)

(assert (=> b!7403 (=> (not res!8169) (not e!4633))))

(declare-fun isPrefixOf!0 (BitStream!410 BitStream!410) Bool)

(assert (=> b!7403 (= res!8169 (isPrefixOf!0 thiss!1486 (_2!522 lt!9735)))))

(declare-fun b!7404 () Bool)

(declare-fun res!8166 () Bool)

(assert (=> b!7404 (=> res!8166 e!4634)))

(declare-datatypes ((List!116 0))(
  ( (Nil!113) (Cons!112 (h!231 Bool) (t!866 List!116)) )
))
(declare-fun lt!9732 () List!116)

(declare-fun byteArrayBitContentToList!0 (BitStream!410 array!499 (_ BitVec 64) (_ BitVec 64)) List!116)

(assert (=> b!7404 (= res!8166 (not (= lt!9732 (byteArrayBitContentToList!0 (_2!522 lt!9735) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!7405 () Bool)

(declare-fun res!8171 () Bool)

(assert (=> b!7405 (=> (not res!8171) (not e!4631))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!7405 (= res!8171 (validate_offset_bits!1 ((_ sign_extend 32) (size!216 (buf!549 thiss!1486))) ((_ sign_extend 32) (currentByte!1552 thiss!1486)) ((_ sign_extend 32) (currentBit!1547 thiss!1486)) nBits!460))))

(declare-fun b!7406 () Bool)

(assert (=> b!7406 (= e!4630 (array_inv!211 (buf!549 thiss!1486)))))

(declare-fun b!7407 () Bool)

(assert (=> b!7407 (= e!4633 (not e!4634))))

(declare-fun res!8168 () Bool)

(assert (=> b!7407 (=> res!8168 e!4634)))

(assert (=> b!7407 (= res!8168 (not (= (byteArrayBitContentToList!0 (_2!522 lt!9735) (_1!523 lt!9734) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!9732)))))

(declare-datatypes ((tuple2!992 0))(
  ( (tuple2!993 (_1!524 BitStream!410) (_2!524 BitStream!410)) )
))
(declare-fun lt!9737 () tuple2!992)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!410 BitStream!410 (_ BitVec 64)) List!116)

(assert (=> b!7407 (= lt!9732 (bitStreamReadBitsIntoList!0 (_2!522 lt!9735) (_1!524 lt!9737) nBits!460))))

(declare-fun readBits!0 (BitStream!410 (_ BitVec 64)) tuple2!990)

(assert (=> b!7407 (= lt!9734 (readBits!0 (_1!524 lt!9737) nBits!460))))

(assert (=> b!7407 (validate_offset_bits!1 ((_ sign_extend 32) (size!216 (buf!549 (_2!522 lt!9735)))) ((_ sign_extend 32) (currentByte!1552 thiss!1486)) ((_ sign_extend 32) (currentBit!1547 thiss!1486)) nBits!460)))

(declare-fun lt!9736 () Unit!578)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!410 array!499 (_ BitVec 64)) Unit!578)

(assert (=> b!7407 (= lt!9736 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!549 (_2!522 lt!9735)) nBits!460))))

(declare-fun reader!0 (BitStream!410 BitStream!410) tuple2!992)

(assert (=> b!7407 (= lt!9737 (reader!0 thiss!1486 (_2!522 lt!9735)))))

(assert (= (and start!1542 res!8167) b!7405))

(assert (= (and b!7405 res!8171) b!7401))

(assert (= (and b!7401 res!8172) b!7399))

(assert (= (and b!7399 res!8173) b!7402))

(assert (= (and b!7402 res!8170) b!7403))

(assert (= (and b!7403 res!8169) b!7407))

(assert (= (and b!7407 (not res!8168)) b!7404))

(assert (= (and b!7404 (not res!8166)) b!7400))

(assert (= start!1542 b!7406))

(declare-fun m!9473 () Bool)

(assert (=> b!7403 m!9473))

(declare-fun m!9475 () Bool)

(assert (=> b!7401 m!9475))

(declare-fun m!9477 () Bool)

(assert (=> b!7401 m!9477))

(declare-fun m!9479 () Bool)

(assert (=> b!7402 m!9479))

(declare-fun m!9481 () Bool)

(assert (=> b!7402 m!9481))

(declare-fun m!9483 () Bool)

(assert (=> b!7407 m!9483))

(declare-fun m!9485 () Bool)

(assert (=> b!7407 m!9485))

(declare-fun m!9487 () Bool)

(assert (=> b!7407 m!9487))

(declare-fun m!9489 () Bool)

(assert (=> b!7407 m!9489))

(declare-fun m!9491 () Bool)

(assert (=> b!7407 m!9491))

(declare-fun m!9493 () Bool)

(assert (=> b!7407 m!9493))

(declare-fun m!9495 () Bool)

(assert (=> b!7400 m!9495))

(declare-fun m!9497 () Bool)

(assert (=> start!1542 m!9497))

(declare-fun m!9499 () Bool)

(assert (=> start!1542 m!9499))

(declare-fun m!9501 () Bool)

(assert (=> b!7406 m!9501))

(declare-fun m!9503 () Bool)

(assert (=> b!7405 m!9503))

(declare-fun m!9505 () Bool)

(assert (=> b!7404 m!9505))

(push 1)

