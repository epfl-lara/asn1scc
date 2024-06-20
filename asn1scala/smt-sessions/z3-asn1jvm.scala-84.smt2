; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1696 () Bool)

(assert start!1696)

(declare-fun b!8187 () Bool)

(declare-fun res!8782 () Bool)

(declare-fun e!5128 () Bool)

(assert (=> b!8187 (=> (not res!8782) (not e!5128))))

(declare-datatypes ((array!545 0))(
  ( (array!546 (arr!641 (Array (_ BitVec 32) (_ BitVec 8))) (size!236 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!450 0))(
  ( (BitStream!451 (buf!572 array!545) (currentByte!1587 (_ BitVec 32)) (currentBit!1582 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!450)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!8187 (= res!8782 (validate_offset_bits!1 ((_ sign_extend 32) (size!236 (buf!572 thiss!1486))) ((_ sign_extend 32) (currentByte!1587 thiss!1486)) ((_ sign_extend 32) (currentBit!1582 thiss!1486)) nBits!460))))

(declare-fun b!8189 () Bool)

(declare-fun e!5129 () Bool)

(declare-datatypes ((Unit!663 0))(
  ( (Unit!664) )
))
(declare-datatypes ((tuple2!1104 0))(
  ( (tuple2!1105 (_1!583 Unit!663) (_2!583 BitStream!450)) )
))
(declare-fun lt!11147 () tuple2!1104)

(assert (=> b!8189 (= e!5129 (not (= (size!236 (buf!572 thiss!1486)) (size!236 (buf!572 (_2!583 lt!11147))))))))

(declare-fun b!8190 () Bool)

(declare-fun e!5125 () Bool)

(declare-fun array_inv!231 (array!545) Bool)

(assert (=> b!8190 (= e!5125 (array_inv!231 (buf!572 thiss!1486)))))

(declare-fun res!8780 () Bool)

(assert (=> start!1696 (=> (not res!8780) (not e!5128))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!545)

(assert (=> start!1696 (= res!8780 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!236 srcBuffer!6))))))))

(assert (=> start!1696 e!5128))

(assert (=> start!1696 true))

(assert (=> start!1696 (array_inv!231 srcBuffer!6)))

(declare-fun inv!12 (BitStream!450) Bool)

(assert (=> start!1696 (and (inv!12 thiss!1486) e!5125)))

(declare-fun b!8188 () Bool)

(assert (=> b!8188 (= e!5128 e!5129)))

(declare-fun res!8781 () Bool)

(assert (=> b!8188 (=> (not res!8781) (not e!5129))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!8188 (= res!8781 (invariant!0 (currentBit!1582 (_2!583 lt!11147)) (currentByte!1587 (_2!583 lt!11147)) (size!236 (buf!572 (_2!583 lt!11147)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!450 array!545 (_ BitVec 64) (_ BitVec 64)) tuple2!1104)

(assert (=> b!8188 (= lt!11147 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(assert (= (and start!1696 res!8780) b!8187))

(assert (= (and b!8187 res!8782) b!8188))

(assert (= (and b!8188 res!8781) b!8189))

(assert (= start!1696 b!8190))

(declare-fun m!10779 () Bool)

(assert (=> b!8187 m!10779))

(declare-fun m!10781 () Bool)

(assert (=> b!8190 m!10781))

(declare-fun m!10783 () Bool)

(assert (=> start!1696 m!10783))

(declare-fun m!10785 () Bool)

(assert (=> start!1696 m!10785))

(declare-fun m!10787 () Bool)

(assert (=> b!8188 m!10787))

(declare-fun m!10789 () Bool)

(assert (=> b!8188 m!10789))

(check-sat (not b!8187) (not b!8188) (not start!1696) (not b!8190))
(check-sat)
(get-model)

(declare-fun d!2410 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!2410 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!236 (buf!572 thiss!1486))) ((_ sign_extend 32) (currentByte!1587 thiss!1486)) ((_ sign_extend 32) (currentBit!1582 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!236 (buf!572 thiss!1486))) ((_ sign_extend 32) (currentByte!1587 thiss!1486)) ((_ sign_extend 32) (currentBit!1582 thiss!1486))) nBits!460))))

(declare-fun bs!823 () Bool)

(assert (= bs!823 d!2410))

(declare-fun m!10807 () Bool)

(assert (=> bs!823 m!10807))

(assert (=> b!8187 d!2410))

(declare-fun d!2414 () Bool)

(assert (=> d!2414 (= (invariant!0 (currentBit!1582 (_2!583 lt!11147)) (currentByte!1587 (_2!583 lt!11147)) (size!236 (buf!572 (_2!583 lt!11147)))) (and (bvsge (currentBit!1582 (_2!583 lt!11147)) #b00000000000000000000000000000000) (bvslt (currentBit!1582 (_2!583 lt!11147)) #b00000000000000000000000000001000) (bvsge (currentByte!1587 (_2!583 lt!11147)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1587 (_2!583 lt!11147)) (size!236 (buf!572 (_2!583 lt!11147)))) (and (= (currentBit!1582 (_2!583 lt!11147)) #b00000000000000000000000000000000) (= (currentByte!1587 (_2!583 lt!11147)) (size!236 (buf!572 (_2!583 lt!11147))))))))))

(assert (=> b!8188 d!2414))

(declare-fun b!8247 () Bool)

(declare-fun e!5165 () tuple2!1104)

(declare-fun Unit!667 () Unit!663)

(assert (=> b!8247 (= e!5165 (tuple2!1105 Unit!667 thiss!1486))))

(assert (=> b!8247 (= (size!236 (buf!572 thiss!1486)) (size!236 (buf!572 thiss!1486)))))

(declare-fun lt!11454 () Unit!663)

(declare-fun Unit!668 () Unit!663)

(assert (=> b!8247 (= lt!11454 Unit!668)))

(declare-datatypes ((tuple2!1110 0))(
  ( (tuple2!1111 (_1!586 BitStream!450) (_2!586 BitStream!450)) )
))
(declare-fun call!109 () tuple2!1110)

(declare-fun checkByteArrayBitContent!0 (BitStream!450 array!545 array!545 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!1112 0))(
  ( (tuple2!1113 (_1!587 array!545) (_2!587 BitStream!450)) )
))
(declare-fun readBits!0 (BitStream!450 (_ BitVec 64)) tuple2!1112)

(assert (=> b!8247 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!587 (readBits!0 (_1!586 call!109) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun b!8248 () Bool)

(declare-fun lt!11489 () tuple2!1104)

(declare-fun e!5166 () Bool)

(declare-fun lt!11451 () tuple2!1110)

(declare-datatypes ((List!133 0))(
  ( (Nil!130) (Cons!129 (h!248 Bool) (t!883 List!133)) )
))
(declare-fun bitStreamReadBitsIntoList!0 (BitStream!450 BitStream!450 (_ BitVec 64)) List!133)

(declare-fun byteArrayBitContentToList!0 (BitStream!450 array!545 (_ BitVec 64) (_ BitVec 64)) List!133)

(assert (=> b!8248 (= e!5166 (= (bitStreamReadBitsIntoList!0 (_2!583 lt!11489) (_1!586 lt!11451) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!583 lt!11489) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!8248 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8248 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!11455 () Unit!663)

(declare-fun lt!11486 () Unit!663)

(assert (=> b!8248 (= lt!11455 lt!11486)))

(declare-fun lt!11485 () (_ BitVec 64))

(assert (=> b!8248 (validate_offset_bits!1 ((_ sign_extend 32) (size!236 (buf!572 (_2!583 lt!11489)))) ((_ sign_extend 32) (currentByte!1587 thiss!1486)) ((_ sign_extend 32) (currentBit!1582 thiss!1486)) lt!11485)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!450 array!545 (_ BitVec 64)) Unit!663)

(assert (=> b!8248 (= lt!11486 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!572 (_2!583 lt!11489)) lt!11485))))

(declare-fun e!5164 () Bool)

(assert (=> b!8248 e!5164))

(declare-fun res!8826 () Bool)

(assert (=> b!8248 (=> (not res!8826) (not e!5164))))

(assert (=> b!8248 (= res!8826 (and (= (size!236 (buf!572 thiss!1486)) (size!236 (buf!572 (_2!583 lt!11489)))) (bvsge lt!11485 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8248 (= lt!11485 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!8248 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun reader!0 (BitStream!450 BitStream!450) tuple2!1110)

(assert (=> b!8248 (= lt!11451 (reader!0 thiss!1486 (_2!583 lt!11489)))))

(declare-fun b!8249 () Bool)

(declare-fun res!8825 () Bool)

(assert (=> b!8249 (=> (not res!8825) (not e!5166))))

(declare-fun isPrefixOf!0 (BitStream!450 BitStream!450) Bool)

(assert (=> b!8249 (= res!8825 (isPrefixOf!0 thiss!1486 (_2!583 lt!11489)))))

(declare-fun b!8250 () Bool)

(assert (=> b!8250 (= e!5164 (validate_offset_bits!1 ((_ sign_extend 32) (size!236 (buf!572 thiss!1486))) ((_ sign_extend 32) (currentByte!1587 thiss!1486)) ((_ sign_extend 32) (currentBit!1582 thiss!1486)) lt!11485))))

(declare-fun b!8251 () Bool)

(declare-fun lt!11487 () tuple2!1104)

(declare-fun Unit!669 () Unit!663)

(assert (=> b!8251 (= e!5165 (tuple2!1105 Unit!669 (_2!583 lt!11487)))))

(declare-fun lt!11460 () tuple2!1104)

(declare-fun appendBitFromByte!0 (BitStream!450 (_ BitVec 8) (_ BitVec 32)) tuple2!1104)

(assert (=> b!8251 (= lt!11460 (appendBitFromByte!0 thiss!1486 (select (arr!641 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!11469 () (_ BitVec 64))

(assert (=> b!8251 (= lt!11469 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!11458 () (_ BitVec 64))

(assert (=> b!8251 (= lt!11458 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!11492 () Unit!663)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!450 BitStream!450 (_ BitVec 64) (_ BitVec 64)) Unit!663)

(assert (=> b!8251 (= lt!11492 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!583 lt!11460) lt!11469 lt!11458))))

(assert (=> b!8251 (validate_offset_bits!1 ((_ sign_extend 32) (size!236 (buf!572 (_2!583 lt!11460)))) ((_ sign_extend 32) (currentByte!1587 (_2!583 lt!11460))) ((_ sign_extend 32) (currentBit!1582 (_2!583 lt!11460))) (bvsub lt!11469 lt!11458))))

(declare-fun lt!11468 () Unit!663)

(assert (=> b!8251 (= lt!11468 lt!11492)))

(declare-fun lt!11483 () tuple2!1110)

(assert (=> b!8251 (= lt!11483 (reader!0 thiss!1486 (_2!583 lt!11460)))))

(declare-fun lt!11491 () (_ BitVec 64))

(assert (=> b!8251 (= lt!11491 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!11484 () Unit!663)

(assert (=> b!8251 (= lt!11484 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!572 (_2!583 lt!11460)) lt!11491))))

(assert (=> b!8251 (validate_offset_bits!1 ((_ sign_extend 32) (size!236 (buf!572 (_2!583 lt!11460)))) ((_ sign_extend 32) (currentByte!1587 thiss!1486)) ((_ sign_extend 32) (currentBit!1582 thiss!1486)) lt!11491)))

(declare-fun lt!11474 () Unit!663)

(assert (=> b!8251 (= lt!11474 lt!11484)))

(declare-fun head!38 (List!133) Bool)

(assert (=> b!8251 (= (head!38 (byteArrayBitContentToList!0 (_2!583 lt!11460) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!38 (bitStreamReadBitsIntoList!0 (_2!583 lt!11460) (_1!586 lt!11483) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!11478 () Unit!663)

(declare-fun Unit!671 () Unit!663)

(assert (=> b!8251 (= lt!11478 Unit!671)))

(assert (=> b!8251 (= lt!11487 (appendBitsMSBFirstLoop!0 (_2!583 lt!11460) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!11466 () Unit!663)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!450 BitStream!450 BitStream!450) Unit!663)

(assert (=> b!8251 (= lt!11466 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!583 lt!11460) (_2!583 lt!11487)))))

(assert (=> b!8251 (isPrefixOf!0 thiss!1486 (_2!583 lt!11487))))

(declare-fun lt!11453 () Unit!663)

(assert (=> b!8251 (= lt!11453 lt!11466)))

(assert (=> b!8251 (= (size!236 (buf!572 (_2!583 lt!11487))) (size!236 (buf!572 thiss!1486)))))

(declare-fun lt!11463 () Unit!663)

(declare-fun Unit!672 () Unit!663)

(assert (=> b!8251 (= lt!11463 Unit!672)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!8251 (= (bitIndex!0 (size!236 (buf!572 (_2!583 lt!11487))) (currentByte!1587 (_2!583 lt!11487)) (currentBit!1582 (_2!583 lt!11487))) (bvsub (bvadd (bitIndex!0 (size!236 (buf!572 thiss!1486)) (currentByte!1587 thiss!1486) (currentBit!1582 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!11462 () Unit!663)

(declare-fun Unit!673 () Unit!663)

(assert (=> b!8251 (= lt!11462 Unit!673)))

(assert (=> b!8251 (= (bitIndex!0 (size!236 (buf!572 (_2!583 lt!11487))) (currentByte!1587 (_2!583 lt!11487)) (currentBit!1582 (_2!583 lt!11487))) (bvsub (bvsub (bvadd (bitIndex!0 (size!236 (buf!572 (_2!583 lt!11460))) (currentByte!1587 (_2!583 lt!11460)) (currentBit!1582 (_2!583 lt!11460))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!11493 () Unit!663)

(declare-fun Unit!675 () Unit!663)

(assert (=> b!8251 (= lt!11493 Unit!675)))

(declare-fun lt!11473 () tuple2!1110)

(assert (=> b!8251 (= lt!11473 call!109)))

(declare-fun lt!11481 () (_ BitVec 64))

(assert (=> b!8251 (= lt!11481 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!11452 () Unit!663)

(assert (=> b!8251 (= lt!11452 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!572 (_2!583 lt!11487)) lt!11481))))

(assert (=> b!8251 (validate_offset_bits!1 ((_ sign_extend 32) (size!236 (buf!572 (_2!583 lt!11487)))) ((_ sign_extend 32) (currentByte!1587 thiss!1486)) ((_ sign_extend 32) (currentBit!1582 thiss!1486)) lt!11481)))

(declare-fun lt!11461 () Unit!663)

(assert (=> b!8251 (= lt!11461 lt!11452)))

(declare-fun lt!11470 () tuple2!1110)

(assert (=> b!8251 (= lt!11470 (reader!0 (_2!583 lt!11460) (_2!583 lt!11487)))))

(declare-fun lt!11472 () (_ BitVec 64))

(assert (=> b!8251 (= lt!11472 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!11476 () Unit!663)

(assert (=> b!8251 (= lt!11476 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!583 lt!11460) (buf!572 (_2!583 lt!11487)) lt!11472))))

(assert (=> b!8251 (validate_offset_bits!1 ((_ sign_extend 32) (size!236 (buf!572 (_2!583 lt!11487)))) ((_ sign_extend 32) (currentByte!1587 (_2!583 lt!11460))) ((_ sign_extend 32) (currentBit!1582 (_2!583 lt!11460))) lt!11472)))

(declare-fun lt!11494 () Unit!663)

(assert (=> b!8251 (= lt!11494 lt!11476)))

(declare-fun lt!11456 () List!133)

(assert (=> b!8251 (= lt!11456 (byteArrayBitContentToList!0 (_2!583 lt!11487) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!11480 () List!133)

(assert (=> b!8251 (= lt!11480 (byteArrayBitContentToList!0 (_2!583 lt!11487) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!11475 () List!133)

(assert (=> b!8251 (= lt!11475 (bitStreamReadBitsIntoList!0 (_2!583 lt!11487) (_1!586 lt!11473) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!11465 () List!133)

(assert (=> b!8251 (= lt!11465 (bitStreamReadBitsIntoList!0 (_2!583 lt!11487) (_1!586 lt!11470) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!11488 () (_ BitVec 64))

(assert (=> b!8251 (= lt!11488 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!11464 () Unit!663)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!450 BitStream!450 BitStream!450 BitStream!450 (_ BitVec 64) List!133) Unit!663)

(assert (=> b!8251 (= lt!11464 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!583 lt!11487) (_2!583 lt!11487) (_1!586 lt!11473) (_1!586 lt!11470) lt!11488 lt!11475))))

(declare-fun tail!46 (List!133) List!133)

(assert (=> b!8251 (= (bitStreamReadBitsIntoList!0 (_2!583 lt!11487) (_1!586 lt!11470) (bvsub lt!11488 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!46 lt!11475))))

(declare-fun lt!11477 () Unit!663)

(assert (=> b!8251 (= lt!11477 lt!11464)))

(declare-fun lt!11482 () (_ BitVec 64))

(declare-fun lt!11459 () Unit!663)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!545 array!545 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!663)

(assert (=> b!8251 (= lt!11459 (arrayBitRangesEqImpliesEq!0 (buf!572 (_2!583 lt!11460)) (buf!572 (_2!583 lt!11487)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!11482 (bitIndex!0 (size!236 (buf!572 (_2!583 lt!11460))) (currentByte!1587 (_2!583 lt!11460)) (currentBit!1582 (_2!583 lt!11460)))))))

(declare-fun bitAt!0 (array!545 (_ BitVec 64)) Bool)

(assert (=> b!8251 (= (bitAt!0 (buf!572 (_2!583 lt!11460)) lt!11482) (bitAt!0 (buf!572 (_2!583 lt!11487)) lt!11482))))

(declare-fun lt!11490 () Unit!663)

(assert (=> b!8251 (= lt!11490 lt!11459)))

(declare-fun b!8252 () Bool)

(declare-fun res!8824 () Bool)

(assert (=> b!8252 (=> (not res!8824) (not e!5166))))

(assert (=> b!8252 (= res!8824 (= (size!236 (buf!572 thiss!1486)) (size!236 (buf!572 (_2!583 lt!11489)))))))

(declare-fun c!454 () Bool)

(declare-fun bm!106 () Bool)

(assert (=> bm!106 (= call!109 (reader!0 thiss!1486 (ite c!454 (_2!583 lt!11487) thiss!1486)))))

(declare-fun b!8253 () Bool)

(declare-fun res!8828 () Bool)

(assert (=> b!8253 (=> (not res!8828) (not e!5166))))

(assert (=> b!8253 (= res!8828 (invariant!0 (currentBit!1582 (_2!583 lt!11489)) (currentByte!1587 (_2!583 lt!11489)) (size!236 (buf!572 (_2!583 lt!11489)))))))

(declare-fun d!2416 () Bool)

(assert (=> d!2416 e!5166))

(declare-fun res!8827 () Bool)

(assert (=> d!2416 (=> (not res!8827) (not e!5166))))

(declare-fun lt!11467 () (_ BitVec 64))

(assert (=> d!2416 (= res!8827 (= (bitIndex!0 (size!236 (buf!572 (_2!583 lt!11489))) (currentByte!1587 (_2!583 lt!11489)) (currentBit!1582 (_2!583 lt!11489))) (bvsub lt!11467 from!367)))))

(assert (=> d!2416 (or (= (bvand lt!11467 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!11467 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!11467 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!11471 () (_ BitVec 64))

(assert (=> d!2416 (= lt!11467 (bvadd lt!11471 from!367 nBits!460))))

(assert (=> d!2416 (or (not (= (bvand lt!11471 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!11471 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!11471 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2416 (= lt!11471 (bitIndex!0 (size!236 (buf!572 thiss!1486)) (currentByte!1587 thiss!1486) (currentBit!1582 thiss!1486)))))

(assert (=> d!2416 (= lt!11489 e!5165)))

(assert (=> d!2416 (= c!454 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!11457 () Unit!663)

(declare-fun lt!11479 () Unit!663)

(assert (=> d!2416 (= lt!11457 lt!11479)))

(assert (=> d!2416 (isPrefixOf!0 thiss!1486 thiss!1486)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!450) Unit!663)

(assert (=> d!2416 (= lt!11479 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!2416 (= lt!11482 (bitIndex!0 (size!236 (buf!572 thiss!1486)) (currentByte!1587 thiss!1486) (currentBit!1582 thiss!1486)))))

(assert (=> d!2416 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2416 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!11489)))

(declare-fun b!8254 () Bool)

(declare-fun res!8829 () Bool)

(assert (=> b!8254 (=> (not res!8829) (not e!5166))))

(assert (=> b!8254 (= res!8829 (= (size!236 (buf!572 (_2!583 lt!11489))) (size!236 (buf!572 thiss!1486))))))

(assert (= (and d!2416 c!454) b!8251))

(assert (= (and d!2416 (not c!454)) b!8247))

(assert (= (or b!8251 b!8247) bm!106))

(assert (= (and d!2416 res!8827) b!8253))

(assert (= (and b!8253 res!8828) b!8252))

(assert (= (and b!8252 res!8824) b!8249))

(assert (= (and b!8249 res!8825) b!8254))

(assert (= (and b!8254 res!8829) b!8248))

(assert (= (and b!8248 res!8826) b!8250))

(declare-fun m!10903 () Bool)

(assert (=> b!8253 m!10903))

(declare-fun m!10905 () Bool)

(assert (=> b!8250 m!10905))

(declare-fun m!10907 () Bool)

(assert (=> b!8248 m!10907))

(declare-fun m!10909 () Bool)

(assert (=> b!8248 m!10909))

(declare-fun m!10911 () Bool)

(assert (=> b!8248 m!10911))

(declare-fun m!10913 () Bool)

(assert (=> b!8248 m!10913))

(declare-fun m!10915 () Bool)

(assert (=> b!8248 m!10915))

(declare-fun m!10917 () Bool)

(assert (=> d!2416 m!10917))

(declare-fun m!10919 () Bool)

(assert (=> d!2416 m!10919))

(declare-fun m!10921 () Bool)

(assert (=> d!2416 m!10921))

(declare-fun m!10923 () Bool)

(assert (=> d!2416 m!10923))

(declare-fun m!10925 () Bool)

(assert (=> b!8251 m!10925))

(declare-fun m!10927 () Bool)

(assert (=> b!8251 m!10927))

(declare-fun m!10929 () Bool)

(assert (=> b!8251 m!10929))

(declare-fun m!10933 () Bool)

(assert (=> b!8251 m!10933))

(declare-fun m!10935 () Bool)

(assert (=> b!8251 m!10935))

(declare-fun m!10937 () Bool)

(assert (=> b!8251 m!10937))

(declare-fun m!10939 () Bool)

(assert (=> b!8251 m!10939))

(declare-fun m!10941 () Bool)

(assert (=> b!8251 m!10941))

(declare-fun m!10943 () Bool)

(assert (=> b!8251 m!10943))

(declare-fun m!10945 () Bool)

(assert (=> b!8251 m!10945))

(declare-fun m!10947 () Bool)

(assert (=> b!8251 m!10947))

(declare-fun m!10949 () Bool)

(assert (=> b!8251 m!10949))

(declare-fun m!10951 () Bool)

(assert (=> b!8251 m!10951))

(declare-fun m!10953 () Bool)

(assert (=> b!8251 m!10953))

(assert (=> b!8251 m!10937))

(declare-fun m!10955 () Bool)

(assert (=> b!8251 m!10955))

(assert (=> b!8251 m!10953))

(declare-fun m!10957 () Bool)

(assert (=> b!8251 m!10957))

(assert (=> b!8251 m!10927))

(declare-fun m!10959 () Bool)

(assert (=> b!8251 m!10959))

(assert (=> b!8251 m!10919))

(declare-fun m!10961 () Bool)

(assert (=> b!8251 m!10961))

(declare-fun m!10963 () Bool)

(assert (=> b!8251 m!10963))

(declare-fun m!10965 () Bool)

(assert (=> b!8251 m!10965))

(declare-fun m!10967 () Bool)

(assert (=> b!8251 m!10967))

(declare-fun m!10969 () Bool)

(assert (=> b!8251 m!10969))

(declare-fun m!10971 () Bool)

(assert (=> b!8251 m!10971))

(declare-fun m!10973 () Bool)

(assert (=> b!8251 m!10973))

(declare-fun m!10975 () Bool)

(assert (=> b!8251 m!10975))

(declare-fun m!10977 () Bool)

(assert (=> b!8251 m!10977))

(assert (=> b!8251 m!10971))

(declare-fun m!10979 () Bool)

(assert (=> b!8251 m!10979))

(declare-fun m!10981 () Bool)

(assert (=> b!8251 m!10981))

(declare-fun m!10983 () Bool)

(assert (=> b!8251 m!10983))

(declare-fun m!10985 () Bool)

(assert (=> b!8251 m!10985))

(declare-fun m!10987 () Bool)

(assert (=> b!8251 m!10987))

(declare-fun m!10989 () Bool)

(assert (=> b!8249 m!10989))

(declare-fun m!10991 () Bool)

(assert (=> bm!106 m!10991))

(declare-fun m!10993 () Bool)

(assert (=> b!8247 m!10993))

(declare-fun m!10995 () Bool)

(assert (=> b!8247 m!10995))

(assert (=> b!8188 d!2416))

(declare-fun d!2426 () Bool)

(assert (=> d!2426 (= (array_inv!231 srcBuffer!6) (bvsge (size!236 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!1696 d!2426))

(declare-fun d!2428 () Bool)

(assert (=> d!2428 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1582 thiss!1486) (currentByte!1587 thiss!1486) (size!236 (buf!572 thiss!1486))))))

(declare-fun bs!826 () Bool)

(assert (= bs!826 d!2428))

(declare-fun m!10997 () Bool)

(assert (=> bs!826 m!10997))

(assert (=> start!1696 d!2428))

(declare-fun d!2430 () Bool)

(assert (=> d!2430 (= (array_inv!231 (buf!572 thiss!1486)) (bvsge (size!236 (buf!572 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!8190 d!2430))

(check-sat (not b!8248) (not b!8251) (not b!8247) (not bm!106) (not b!8249) (not b!8253) (not d!2428) (not d!2410) (not d!2416) (not b!8250))
