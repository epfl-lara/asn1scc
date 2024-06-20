; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1540 () Bool)

(assert start!1540)

(declare-fun b!7372 () Bool)

(declare-fun res!8147 () Bool)

(declare-fun e!4614 () Bool)

(assert (=> b!7372 (=> (not res!8147) (not e!4614))))

(declare-datatypes ((array!497 0))(
  ( (array!498 (arr!617 (Array (_ BitVec 32) (_ BitVec 8))) (size!215 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!408 0))(
  ( (BitStream!409 (buf!548 array!497) (currentByte!1551 (_ BitVec 32)) (currentBit!1546 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!408)

(declare-datatypes ((Unit!576 0))(
  ( (Unit!577) )
))
(declare-datatypes ((tuple2!982 0))(
  ( (tuple2!983 (_1!519 Unit!576) (_2!519 BitStream!408)) )
))
(declare-fun lt!9715 () tuple2!982)

(declare-fun isPrefixOf!0 (BitStream!408 BitStream!408) Bool)

(assert (=> b!7372 (= res!8147 (isPrefixOf!0 thiss!1486 (_2!519 lt!9715)))))

(declare-fun b!7373 () Bool)

(declare-fun res!8144 () Bool)

(declare-fun e!4616 () Bool)

(assert (=> b!7373 (=> (not res!8144) (not e!4616))))

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!7373 (= res!8144 (validate_offset_bits!1 ((_ sign_extend 32) (size!215 (buf!548 thiss!1486))) ((_ sign_extend 32) (currentByte!1551 thiss!1486)) ((_ sign_extend 32) (currentBit!1546 thiss!1486)) nBits!460))))

(declare-fun b!7374 () Bool)

(declare-fun res!8142 () Bool)

(assert (=> b!7374 (=> (not res!8142) (not e!4614))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!7374 (= res!8142 (= (bitIndex!0 (size!215 (buf!548 (_2!519 lt!9715))) (currentByte!1551 (_2!519 lt!9715)) (currentBit!1546 (_2!519 lt!9715))) (bvadd (bitIndex!0 (size!215 (buf!548 thiss!1486)) (currentByte!1551 thiss!1486) (currentBit!1546 thiss!1486)) nBits!460)))))

(declare-fun res!8146 () Bool)

(assert (=> start!1540 (=> (not res!8146) (not e!4616))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!497)

(assert (=> start!1540 (= res!8146 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!215 srcBuffer!6))))))))

(assert (=> start!1540 e!4616))

(assert (=> start!1540 true))

(declare-fun array_inv!210 (array!497) Bool)

(assert (=> start!1540 (array_inv!210 srcBuffer!6)))

(declare-fun e!4613 () Bool)

(declare-fun inv!12 (BitStream!408) Bool)

(assert (=> start!1540 (and (inv!12 thiss!1486) e!4613)))

(declare-fun b!7375 () Bool)

(declare-fun res!8149 () Bool)

(declare-fun e!4612 () Bool)

(assert (=> b!7375 (=> res!8149 e!4612)))

(declare-datatypes ((List!115 0))(
  ( (Nil!112) (Cons!111 (h!230 Bool) (t!865 List!115)) )
))
(declare-fun lt!9717 () List!115)

(declare-fun byteArrayBitContentToList!0 (BitStream!408 array!497 (_ BitVec 64) (_ BitVec 64)) List!115)

(assert (=> b!7375 (= res!8149 (not (= lt!9717 (byteArrayBitContentToList!0 (_2!519 lt!9715) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!7376 () Bool)

(declare-fun res!8145 () Bool)

(assert (=> b!7376 (=> (not res!8145) (not e!4614))))

(assert (=> b!7376 (= res!8145 (= (size!215 (buf!548 thiss!1486)) (size!215 (buf!548 (_2!519 lt!9715)))))))

(declare-fun b!7377 () Bool)

(assert (=> b!7377 (= e!4613 (array_inv!210 (buf!548 thiss!1486)))))

(declare-fun b!7378 () Bool)

(assert (=> b!7378 (= e!4614 (not e!4612))))

(declare-fun res!8143 () Bool)

(assert (=> b!7378 (=> res!8143 e!4612)))

(declare-datatypes ((tuple2!984 0))(
  ( (tuple2!985 (_1!520 array!497) (_2!520 BitStream!408)) )
))
(declare-fun lt!9719 () tuple2!984)

(assert (=> b!7378 (= res!8143 (not (= (byteArrayBitContentToList!0 (_2!519 lt!9715) (_1!520 lt!9719) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!9717)))))

(declare-datatypes ((tuple2!986 0))(
  ( (tuple2!987 (_1!521 BitStream!408) (_2!521 BitStream!408)) )
))
(declare-fun lt!9714 () tuple2!986)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!408 BitStream!408 (_ BitVec 64)) List!115)

(assert (=> b!7378 (= lt!9717 (bitStreamReadBitsIntoList!0 (_2!519 lt!9715) (_1!521 lt!9714) nBits!460))))

(declare-fun readBits!0 (BitStream!408 (_ BitVec 64)) tuple2!984)

(assert (=> b!7378 (= lt!9719 (readBits!0 (_1!521 lt!9714) nBits!460))))

(assert (=> b!7378 (validate_offset_bits!1 ((_ sign_extend 32) (size!215 (buf!548 (_2!519 lt!9715)))) ((_ sign_extend 32) (currentByte!1551 thiss!1486)) ((_ sign_extend 32) (currentBit!1546 thiss!1486)) nBits!460)))

(declare-fun lt!9716 () Unit!576)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!408 array!497 (_ BitVec 64)) Unit!576)

(assert (=> b!7378 (= lt!9716 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!548 (_2!519 lt!9715)) nBits!460))))

(declare-fun reader!0 (BitStream!408 BitStream!408) tuple2!986)

(assert (=> b!7378 (= lt!9714 (reader!0 thiss!1486 (_2!519 lt!9715)))))

(declare-fun b!7379 () Bool)

(assert (=> b!7379 (= e!4616 e!4614)))

(declare-fun res!8148 () Bool)

(assert (=> b!7379 (=> (not res!8148) (not e!4614))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!7379 (= res!8148 (invariant!0 (currentBit!1546 (_2!519 lt!9715)) (currentByte!1551 (_2!519 lt!9715)) (size!215 (buf!548 (_2!519 lt!9715)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!408 array!497 (_ BitVec 64) (_ BitVec 64)) tuple2!982)

(assert (=> b!7379 (= lt!9715 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!7380 () Bool)

(assert (=> b!7380 (= e!4612 true)))

(declare-fun lt!9718 () Unit!576)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!408 array!497 array!497 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!576)

(assert (=> b!7380 (= lt!9718 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!519 lt!9715) srcBuffer!6 (_1!520 lt!9719) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (= (and start!1540 res!8146) b!7373))

(assert (= (and b!7373 res!8144) b!7379))

(assert (= (and b!7379 res!8148) b!7376))

(assert (= (and b!7376 res!8145) b!7374))

(assert (= (and b!7374 res!8142) b!7372))

(assert (= (and b!7372 res!8147) b!7378))

(assert (= (and b!7378 (not res!8143)) b!7375))

(assert (= (and b!7375 (not res!8149)) b!7380))

(assert (= start!1540 b!7377))

(declare-fun m!9439 () Bool)

(assert (=> b!7374 m!9439))

(declare-fun m!9441 () Bool)

(assert (=> b!7374 m!9441))

(declare-fun m!9443 () Bool)

(assert (=> b!7372 m!9443))

(declare-fun m!9445 () Bool)

(assert (=> b!7377 m!9445))

(declare-fun m!9447 () Bool)

(assert (=> start!1540 m!9447))

(declare-fun m!9449 () Bool)

(assert (=> start!1540 m!9449))

(declare-fun m!9451 () Bool)

(assert (=> b!7375 m!9451))

(declare-fun m!9453 () Bool)

(assert (=> b!7373 m!9453))

(declare-fun m!9455 () Bool)

(assert (=> b!7379 m!9455))

(declare-fun m!9457 () Bool)

(assert (=> b!7379 m!9457))

(declare-fun m!9459 () Bool)

(assert (=> b!7380 m!9459))

(declare-fun m!9461 () Bool)

(assert (=> b!7378 m!9461))

(declare-fun m!9463 () Bool)

(assert (=> b!7378 m!9463))

(declare-fun m!9465 () Bool)

(assert (=> b!7378 m!9465))

(declare-fun m!9467 () Bool)

(assert (=> b!7378 m!9467))

(declare-fun m!9469 () Bool)

(assert (=> b!7378 m!9469))

(declare-fun m!9471 () Bool)

(assert (=> b!7378 m!9471))

(check-sat (not b!7375) (not b!7374) (not b!7377) (not b!7380) (not b!7373) (not b!7372) (not b!7378) (not start!1540) (not b!7379))
