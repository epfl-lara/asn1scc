; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1414 () Bool)

(assert start!1414)

(declare-fun res!7416 () Bool)

(declare-fun e!4088 () Bool)

(assert (=> start!1414 (=> (not res!7416) (not e!4088))))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!452 0))(
  ( (array!453 (arr!593 (Array (_ BitVec 32) (_ BitVec 8))) (size!194 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!452)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!1414 (= res!7416 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!194 srcBuffer!6))))))))

(assert (=> start!1414 e!4088))

(assert (=> start!1414 true))

(declare-fun array_inv!189 (array!452) Bool)

(assert (=> start!1414 (array_inv!189 srcBuffer!6)))

(declare-datatypes ((BitStream!366 0))(
  ( (BitStream!367 (buf!524 array!452) (currentByte!1521 (_ BitVec 32)) (currentBit!1516 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!366)

(declare-fun e!4085 () Bool)

(declare-fun inv!12 (BitStream!366) Bool)

(assert (=> start!1414 (and (inv!12 thiss!1486) e!4085)))

(declare-fun b!6487 () Bool)

(declare-fun e!4086 () Bool)

(declare-fun e!4087 () Bool)

(assert (=> b!6487 (= e!4086 (not e!4087))))

(declare-fun res!7423 () Bool)

(assert (=> b!6487 (=> res!7423 e!4087)))

(declare-datatypes ((Unit!510 0))(
  ( (Unit!511) )
))
(declare-datatypes ((tuple2!844 0))(
  ( (tuple2!845 (_1!447 Unit!510) (_2!447 BitStream!366)) )
))
(declare-fun lt!8567 () tuple2!844)

(declare-datatypes ((tuple2!846 0))(
  ( (tuple2!847 (_1!448 array!452) (_2!448 BitStream!366)) )
))
(declare-fun lt!8562 () tuple2!846)

(declare-datatypes ((List!94 0))(
  ( (Nil!91) (Cons!90 (h!209 Bool) (t!844 List!94)) )
))
(declare-fun lt!8563 () List!94)

(declare-fun byteArrayBitContentToList!0 (BitStream!366 array!452 (_ BitVec 64) (_ BitVec 64)) List!94)

(assert (=> b!6487 (= res!7423 (not (= (byteArrayBitContentToList!0 (_2!447 lt!8567) (_1!448 lt!8562) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!8563)))))

(declare-datatypes ((tuple2!848 0))(
  ( (tuple2!849 (_1!449 BitStream!366) (_2!449 BitStream!366)) )
))
(declare-fun lt!8564 () tuple2!848)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!366 BitStream!366 (_ BitVec 64)) List!94)

(assert (=> b!6487 (= lt!8563 (bitStreamReadBitsIntoList!0 (_2!447 lt!8567) (_1!449 lt!8564) nBits!460))))

(declare-fun readBits!0 (BitStream!366 (_ BitVec 64)) tuple2!846)

(assert (=> b!6487 (= lt!8562 (readBits!0 (_1!449 lt!8564) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!6487 (validate_offset_bits!1 ((_ sign_extend 32) (size!194 (buf!524 (_2!447 lt!8567)))) ((_ sign_extend 32) (currentByte!1521 thiss!1486)) ((_ sign_extend 32) (currentBit!1516 thiss!1486)) nBits!460)))

(declare-fun lt!8565 () Unit!510)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!366 array!452 (_ BitVec 64)) Unit!510)

(assert (=> b!6487 (= lt!8565 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!524 (_2!447 lt!8567)) nBits!460))))

(declare-fun reader!0 (BitStream!366 BitStream!366) tuple2!848)

(assert (=> b!6487 (= lt!8564 (reader!0 thiss!1486 (_2!447 lt!8567)))))

(declare-fun b!6488 () Bool)

(declare-fun res!7417 () Bool)

(assert (=> b!6488 (=> (not res!7417) (not e!4086))))

(declare-fun isPrefixOf!0 (BitStream!366 BitStream!366) Bool)

(assert (=> b!6488 (= res!7417 (isPrefixOf!0 thiss!1486 (_2!447 lt!8567)))))

(declare-fun b!6489 () Bool)

(declare-fun res!7420 () Bool)

(assert (=> b!6489 (=> (not res!7420) (not e!4086))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!6489 (= res!7420 (= (bitIndex!0 (size!194 (buf!524 (_2!447 lt!8567))) (currentByte!1521 (_2!447 lt!8567)) (currentBit!1516 (_2!447 lt!8567))) (bvadd (bitIndex!0 (size!194 (buf!524 thiss!1486)) (currentByte!1521 thiss!1486) (currentBit!1516 thiss!1486)) nBits!460)))))

(declare-fun b!6490 () Bool)

(assert (=> b!6490 (= e!4087 true)))

(declare-fun lt!8566 () Unit!510)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!366 array!452 array!452 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!510)

(assert (=> b!6490 (= lt!8566 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!447 lt!8567) srcBuffer!6 (_1!448 lt!8562) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!6491 () Bool)

(declare-fun res!7421 () Bool)

(assert (=> b!6491 (=> res!7421 e!4087)))

(assert (=> b!6491 (= res!7421 (not (= lt!8563 (byteArrayBitContentToList!0 (_2!447 lt!8567) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!6492 () Bool)

(assert (=> b!6492 (= e!4088 e!4086)))

(declare-fun res!7418 () Bool)

(assert (=> b!6492 (=> (not res!7418) (not e!4086))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!6492 (= res!7418 (invariant!0 (currentBit!1516 (_2!447 lt!8567)) (currentByte!1521 (_2!447 lt!8567)) (size!194 (buf!524 (_2!447 lt!8567)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!366 array!452 (_ BitVec 64) (_ BitVec 64)) tuple2!844)

(assert (=> b!6492 (= lt!8567 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!6493 () Bool)

(declare-fun res!7419 () Bool)

(assert (=> b!6493 (=> (not res!7419) (not e!4086))))

(assert (=> b!6493 (= res!7419 (= (size!194 (buf!524 thiss!1486)) (size!194 (buf!524 (_2!447 lt!8567)))))))

(declare-fun b!6494 () Bool)

(declare-fun res!7422 () Bool)

(assert (=> b!6494 (=> (not res!7422) (not e!4088))))

(assert (=> b!6494 (= res!7422 (validate_offset_bits!1 ((_ sign_extend 32) (size!194 (buf!524 thiss!1486))) ((_ sign_extend 32) (currentByte!1521 thiss!1486)) ((_ sign_extend 32) (currentBit!1516 thiss!1486)) nBits!460))))

(declare-fun b!6495 () Bool)

(assert (=> b!6495 (= e!4085 (array_inv!189 (buf!524 thiss!1486)))))

(assert (= (and start!1414 res!7416) b!6494))

(assert (= (and b!6494 res!7422) b!6492))

(assert (= (and b!6492 res!7418) b!6493))

(assert (= (and b!6493 res!7419) b!6489))

(assert (= (and b!6489 res!7420) b!6488))

(assert (= (and b!6488 res!7417) b!6487))

(assert (= (and b!6487 (not res!7423)) b!6491))

(assert (= (and b!6491 (not res!7421)) b!6490))

(assert (= start!1414 b!6495))

(declare-fun m!8215 () Bool)

(assert (=> b!6488 m!8215))

(declare-fun m!8217 () Bool)

(assert (=> b!6490 m!8217))

(declare-fun m!8219 () Bool)

(assert (=> b!6492 m!8219))

(declare-fun m!8221 () Bool)

(assert (=> b!6492 m!8221))

(declare-fun m!8223 () Bool)

(assert (=> b!6491 m!8223))

(declare-fun m!8225 () Bool)

(assert (=> b!6487 m!8225))

(declare-fun m!8227 () Bool)

(assert (=> b!6487 m!8227))

(declare-fun m!8229 () Bool)

(assert (=> b!6487 m!8229))

(declare-fun m!8231 () Bool)

(assert (=> b!6487 m!8231))

(declare-fun m!8233 () Bool)

(assert (=> b!6487 m!8233))

(declare-fun m!8235 () Bool)

(assert (=> b!6487 m!8235))

(declare-fun m!8237 () Bool)

(assert (=> b!6494 m!8237))

(declare-fun m!8239 () Bool)

(assert (=> b!6495 m!8239))

(declare-fun m!8241 () Bool)

(assert (=> start!1414 m!8241))

(declare-fun m!8243 () Bool)

(assert (=> start!1414 m!8243))

(declare-fun m!8245 () Bool)

(assert (=> b!6489 m!8245))

(declare-fun m!8247 () Bool)

(assert (=> b!6489 m!8247))

(check-sat (not b!6494) (not b!6487) (not b!6488) (not start!1414) (not b!6495) (not b!6489) (not b!6491) (not b!6490) (not b!6492))
