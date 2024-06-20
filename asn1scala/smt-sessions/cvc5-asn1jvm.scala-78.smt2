; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1544 () Bool)

(assert start!1544)

(declare-fun b!7428 () Bool)

(declare-fun e!4652 () Bool)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> b!7428 (= e!4652 (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)))))

(declare-fun b!7429 () Bool)

(declare-fun e!4655 () Bool)

(declare-fun e!4654 () Bool)

(assert (=> b!7429 (= e!4655 e!4654)))

(declare-fun res!8199 () Bool)

(assert (=> b!7429 (=> (not res!8199) (not e!4654))))

(declare-datatypes ((array!501 0))(
  ( (array!502 (arr!619 (Array (_ BitVec 32) (_ BitVec 8))) (size!217 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!412 0))(
  ( (BitStream!413 (buf!550 array!501) (currentByte!1553 (_ BitVec 32)) (currentBit!1548 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!580 0))(
  ( (Unit!581) )
))
(declare-datatypes ((tuple2!994 0))(
  ( (tuple2!995 (_1!525 Unit!580) (_2!525 BitStream!412)) )
))
(declare-fun lt!9755 () tuple2!994)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!7429 (= res!8199 (invariant!0 (currentBit!1548 (_2!525 lt!9755)) (currentByte!1553 (_2!525 lt!9755)) (size!217 (buf!550 (_2!525 lt!9755)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!501)

(declare-fun thiss!1486 () BitStream!412)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!412 array!501 (_ BitVec 64) (_ BitVec 64)) tuple2!994)

(assert (=> b!7429 (= lt!9755 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!7430 () Bool)

(declare-fun res!8198 () Bool)

(declare-fun e!4653 () Bool)

(assert (=> b!7430 (=> res!8198 e!4653)))

(declare-datatypes ((List!117 0))(
  ( (Nil!114) (Cons!113 (h!232 Bool) (t!867 List!117)) )
))
(declare-fun lt!9752 () List!117)

(declare-fun byteArrayBitContentToList!0 (BitStream!412 array!501 (_ BitVec 64) (_ BitVec 64)) List!117)

(assert (=> b!7430 (= res!8198 (not (= lt!9752 (byteArrayBitContentToList!0 (_2!525 lt!9755) srcBuffer!6 from!367 nBits!460))))))

(declare-fun res!8196 () Bool)

(assert (=> start!1544 (=> (not res!8196) (not e!4655))))

(assert (=> start!1544 (= res!8196 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!217 srcBuffer!6))))))))

(assert (=> start!1544 e!4655))

(assert (=> start!1544 true))

(declare-fun array_inv!212 (array!501) Bool)

(assert (=> start!1544 (array_inv!212 srcBuffer!6)))

(declare-fun e!4649 () Bool)

(declare-fun inv!12 (BitStream!412) Bool)

(assert (=> start!1544 (and (inv!12 thiss!1486) e!4649)))

(declare-fun b!7431 () Bool)

(assert (=> b!7431 (= e!4649 (array_inv!212 (buf!550 thiss!1486)))))

(declare-fun b!7432 () Bool)

(declare-fun res!8193 () Bool)

(assert (=> b!7432 (=> (not res!8193) (not e!4655))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!7432 (= res!8193 (validate_offset_bits!1 ((_ sign_extend 32) (size!217 (buf!550 thiss!1486))) ((_ sign_extend 32) (currentByte!1553 thiss!1486)) ((_ sign_extend 32) (currentBit!1548 thiss!1486)) nBits!460))))

(declare-fun b!7433 () Bool)

(declare-fun res!8194 () Bool)

(assert (=> b!7433 (=> (not res!8194) (not e!4654))))

(declare-fun isPrefixOf!0 (BitStream!412 BitStream!412) Bool)

(assert (=> b!7433 (= res!8194 (isPrefixOf!0 thiss!1486 (_2!525 lt!9755)))))

(declare-fun b!7434 () Bool)

(declare-fun res!8195 () Bool)

(assert (=> b!7434 (=> (not res!8195) (not e!4654))))

(assert (=> b!7434 (= res!8195 (= (size!217 (buf!550 thiss!1486)) (size!217 (buf!550 (_2!525 lt!9755)))))))

(declare-fun b!7435 () Bool)

(declare-fun res!8197 () Bool)

(assert (=> b!7435 (=> (not res!8197) (not e!4654))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!7435 (= res!8197 (= (bitIndex!0 (size!217 (buf!550 (_2!525 lt!9755))) (currentByte!1553 (_2!525 lt!9755)) (currentBit!1548 (_2!525 lt!9755))) (bvadd (bitIndex!0 (size!217 (buf!550 thiss!1486)) (currentByte!1553 thiss!1486) (currentBit!1548 thiss!1486)) nBits!460)))))

(declare-fun b!7436 () Bool)

(assert (=> b!7436 (= e!4654 (not e!4653))))

(declare-fun res!8200 () Bool)

(assert (=> b!7436 (=> res!8200 e!4653)))

(declare-datatypes ((tuple2!996 0))(
  ( (tuple2!997 (_1!526 array!501) (_2!526 BitStream!412)) )
))
(declare-fun lt!9750 () tuple2!996)

(assert (=> b!7436 (= res!8200 (not (= (byteArrayBitContentToList!0 (_2!525 lt!9755) (_1!526 lt!9750) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!9752)))))

(declare-datatypes ((tuple2!998 0))(
  ( (tuple2!999 (_1!527 BitStream!412) (_2!527 BitStream!412)) )
))
(declare-fun lt!9751 () tuple2!998)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!412 BitStream!412 (_ BitVec 64)) List!117)

(assert (=> b!7436 (= lt!9752 (bitStreamReadBitsIntoList!0 (_2!525 lt!9755) (_1!527 lt!9751) nBits!460))))

(declare-fun readBits!0 (BitStream!412 (_ BitVec 64)) tuple2!996)

(assert (=> b!7436 (= lt!9750 (readBits!0 (_1!527 lt!9751) nBits!460))))

(assert (=> b!7436 (validate_offset_bits!1 ((_ sign_extend 32) (size!217 (buf!550 (_2!525 lt!9755)))) ((_ sign_extend 32) (currentByte!1553 thiss!1486)) ((_ sign_extend 32) (currentBit!1548 thiss!1486)) nBits!460)))

(declare-fun lt!9753 () Unit!580)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!412 array!501 (_ BitVec 64)) Unit!580)

(assert (=> b!7436 (= lt!9753 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!550 (_2!525 lt!9755)) nBits!460))))

(declare-fun reader!0 (BitStream!412 BitStream!412) tuple2!998)

(assert (=> b!7436 (= lt!9751 (reader!0 thiss!1486 (_2!525 lt!9755)))))

(declare-fun b!7437 () Bool)

(assert (=> b!7437 (= e!4653 e!4652)))

(declare-fun res!8192 () Bool)

(assert (=> b!7437 (=> res!8192 e!4652)))

(declare-fun checkByteArrayBitContent!0 (BitStream!412 array!501 array!501 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!7437 (= res!8192 (not (checkByteArrayBitContent!0 (_2!525 lt!9755) srcBuffer!6 (_1!526 lt!9750) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))))

(declare-fun lt!9754 () Unit!580)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!412 array!501 array!501 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!580)

(assert (=> b!7437 (= lt!9754 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!525 lt!9755) srcBuffer!6 (_1!526 lt!9750) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (= (and start!1544 res!8196) b!7432))

(assert (= (and b!7432 res!8193) b!7429))

(assert (= (and b!7429 res!8199) b!7434))

(assert (= (and b!7434 res!8195) b!7435))

(assert (= (and b!7435 res!8197) b!7433))

(assert (= (and b!7433 res!8194) b!7436))

(assert (= (and b!7436 (not res!8200)) b!7430))

(assert (= (and b!7430 (not res!8198)) b!7437))

(assert (= (and b!7437 (not res!8192)) b!7428))

(assert (= start!1544 b!7431))

(declare-fun m!9507 () Bool)

(assert (=> b!7431 m!9507))

(declare-fun m!9509 () Bool)

(assert (=> b!7437 m!9509))

(declare-fun m!9511 () Bool)

(assert (=> b!7437 m!9511))

(declare-fun m!9513 () Bool)

(assert (=> start!1544 m!9513))

(declare-fun m!9515 () Bool)

(assert (=> start!1544 m!9515))

(declare-fun m!9517 () Bool)

(assert (=> b!7430 m!9517))

(declare-fun m!9519 () Bool)

(assert (=> b!7433 m!9519))

(declare-fun m!9521 () Bool)

(assert (=> b!7436 m!9521))

(declare-fun m!9523 () Bool)

(assert (=> b!7436 m!9523))

(declare-fun m!9525 () Bool)

(assert (=> b!7436 m!9525))

(declare-fun m!9527 () Bool)

(assert (=> b!7436 m!9527))

(declare-fun m!9529 () Bool)

(assert (=> b!7436 m!9529))

(declare-fun m!9531 () Bool)

(assert (=> b!7436 m!9531))

(declare-fun m!9533 () Bool)

(assert (=> b!7429 m!9533))

(declare-fun m!9535 () Bool)

(assert (=> b!7429 m!9535))

(declare-fun m!9537 () Bool)

(assert (=> b!7432 m!9537))

(declare-fun m!9539 () Bool)

(assert (=> b!7435 m!9539))

(declare-fun m!9541 () Bool)

(assert (=> b!7435 m!9541))

(push 1)

(assert (not b!7433))

(assert (not b!7430))

(assert (not start!1544))

(assert (not b!7432))

(assert (not b!7431))

(assert (not b!7437))

(assert (not b!7435))

(assert (not b!7429))

(assert (not b!7436))

(check-sat)

(pop 1)

(push 1)

(check-sat)

