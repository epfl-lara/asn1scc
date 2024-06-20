; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6502 () Bool)

(assert start!6502)

(declare-fun b!30560 () Bool)

(declare-fun e!20357 () Bool)

(declare-fun e!20354 () Bool)

(assert (=> b!30560 (= e!20357 e!20354)))

(declare-fun res!26272 () Bool)

(assert (=> b!30560 (=> res!26272 e!20354)))

(declare-datatypes ((List!388 0))(
  ( (Nil!385) (Cons!384 (h!503 Bool) (t!1138 List!388)) )
))
(declare-fun lt!44456 () List!388)

(declare-fun lt!44467 () List!388)

(assert (=> b!30560 (= res!26272 (not (= lt!44456 lt!44467)))))

(assert (=> b!30560 (= lt!44467 lt!44456)))

(declare-fun lt!44466 () List!388)

(declare-fun tail!105 (List!388) List!388)

(assert (=> b!30560 (= lt!44456 (tail!105 lt!44466))))

(declare-fun i!635 () (_ BitVec 64))

(declare-datatypes ((Unit!2347 0))(
  ( (Unit!2348) )
))
(declare-fun lt!44459 () Unit!2347)

(declare-fun to!314 () (_ BitVec 64))

(declare-datatypes ((array!1789 0))(
  ( (array!1790 (arr!1248 (Array (_ BitVec 32) (_ BitVec 8))) (size!782 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1374 0))(
  ( (BitStream!1375 (buf!1110 array!1789) (currentByte!2459 (_ BitVec 32)) (currentBit!2454 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!3206 0))(
  ( (tuple2!3207 (_1!1690 Unit!2347) (_2!1690 BitStream!1374)) )
))
(declare-fun lt!44457 () tuple2!3206)

(declare-datatypes ((tuple2!3208 0))(
  ( (tuple2!3209 (_1!1691 BitStream!1374) (_2!1691 BitStream!1374)) )
))
(declare-fun lt!44472 () tuple2!3208)

(declare-fun lt!44462 () tuple2!3208)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1374 BitStream!1374 BitStream!1374 BitStream!1374 (_ BitVec 64) List!388) Unit!2347)

(assert (=> b!30560 (= lt!44459 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1690 lt!44457) (_2!1690 lt!44457) (_1!1691 lt!44462) (_1!1691 lt!44472) (bvsub to!314 i!635) lt!44466))))

(declare-fun b!30561 () Bool)

(declare-fun res!26259 () Bool)

(declare-fun e!20358 () Bool)

(assert (=> b!30561 (=> res!26259 e!20358)))

(declare-fun lt!44463 () tuple2!3206)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!30561 (= res!26259 (not (invariant!0 (currentBit!2454 (_2!1690 lt!44463)) (currentByte!2459 (_2!1690 lt!44463)) (size!782 (buf!1110 (_2!1690 lt!44457))))))))

(declare-fun b!30562 () Bool)

(declare-fun e!20347 () Bool)

(declare-fun e!20348 () Bool)

(assert (=> b!30562 (= e!20347 e!20348)))

(declare-fun res!26266 () Bool)

(assert (=> b!30562 (=> res!26266 e!20348)))

(declare-fun isPrefixOf!0 (BitStream!1374 BitStream!1374) Bool)

(assert (=> b!30562 (= res!26266 (not (isPrefixOf!0 (_2!1690 lt!44463) (_2!1690 lt!44457))))))

(declare-fun thiss!1379 () BitStream!1374)

(assert (=> b!30562 (isPrefixOf!0 thiss!1379 (_2!1690 lt!44457))))

(declare-fun lt!44473 () Unit!2347)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1374 BitStream!1374 BitStream!1374) Unit!2347)

(assert (=> b!30562 (= lt!44473 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1690 lt!44463) (_2!1690 lt!44457)))))

(declare-fun srcBuffer!2 () array!1789)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1374 array!1789 (_ BitVec 64) (_ BitVec 64)) tuple2!3206)

(assert (=> b!30562 (= lt!44457 (appendBitsMSBFirstLoop!0 (_2!1690 lt!44463) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!20359 () Bool)

(assert (=> b!30562 e!20359))

(declare-fun res!26268 () Bool)

(assert (=> b!30562 (=> (not res!26268) (not e!20359))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!30562 (= res!26268 (validate_offset_bits!1 ((_ sign_extend 32) (size!782 (buf!1110 (_2!1690 lt!44463)))) ((_ sign_extend 32) (currentByte!2459 thiss!1379)) ((_ sign_extend 32) (currentBit!2454 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!44471 () Unit!2347)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1374 array!1789 (_ BitVec 64)) Unit!2347)

(assert (=> b!30562 (= lt!44471 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1110 (_2!1690 lt!44463)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!44460 () tuple2!3208)

(declare-fun reader!0 (BitStream!1374 BitStream!1374) tuple2!3208)

(assert (=> b!30562 (= lt!44460 (reader!0 thiss!1379 (_2!1690 lt!44463)))))

(declare-fun b!30563 () Bool)

(declare-fun head!225 (List!388) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1374 array!1789 (_ BitVec 64) (_ BitVec 64)) List!388)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1374 BitStream!1374 (_ BitVec 64)) List!388)

(assert (=> b!30563 (= e!20359 (= (head!225 (byteArrayBitContentToList!0 (_2!1690 lt!44463) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!225 (bitStreamReadBitsIntoList!0 (_2!1690 lt!44463) (_1!1691 lt!44460) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!30564 () Bool)

(assert (=> b!30564 (= e!20358 e!20357)))

(declare-fun res!26264 () Bool)

(assert (=> b!30564 (=> res!26264 e!20357)))

(assert (=> b!30564 (= res!26264 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!44465 () (_ BitVec 64))

(assert (=> b!30564 (= lt!44467 (bitStreamReadBitsIntoList!0 (_2!1690 lt!44457) (_1!1691 lt!44472) lt!44465))))

(assert (=> b!30564 (= lt!44466 (bitStreamReadBitsIntoList!0 (_2!1690 lt!44457) (_1!1691 lt!44462) (bvsub to!314 i!635)))))

(assert (=> b!30564 (validate_offset_bits!1 ((_ sign_extend 32) (size!782 (buf!1110 (_2!1690 lt!44457)))) ((_ sign_extend 32) (currentByte!2459 (_2!1690 lt!44463))) ((_ sign_extend 32) (currentBit!2454 (_2!1690 lt!44463))) lt!44465)))

(declare-fun lt!44464 () Unit!2347)

(assert (=> b!30564 (= lt!44464 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1690 lt!44463) (buf!1110 (_2!1690 lt!44457)) lt!44465))))

(assert (=> b!30564 (= lt!44472 (reader!0 (_2!1690 lt!44463) (_2!1690 lt!44457)))))

(assert (=> b!30564 (validate_offset_bits!1 ((_ sign_extend 32) (size!782 (buf!1110 (_2!1690 lt!44457)))) ((_ sign_extend 32) (currentByte!2459 thiss!1379)) ((_ sign_extend 32) (currentBit!2454 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!44461 () Unit!2347)

(assert (=> b!30564 (= lt!44461 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1110 (_2!1690 lt!44457)) (bvsub to!314 i!635)))))

(assert (=> b!30564 (= lt!44462 (reader!0 thiss!1379 (_2!1690 lt!44457)))))

(declare-fun b!30565 () Bool)

(declare-fun e!20350 () Bool)

(declare-fun array_inv!740 (array!1789) Bool)

(assert (=> b!30565 (= e!20350 (array_inv!740 (buf!1110 thiss!1379)))))

(declare-fun b!30566 () Bool)

(declare-fun lt!44468 () (_ BitVec 64))

(assert (=> b!30566 (= e!20354 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!44468) (bvslt lt!44468 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!782 (buf!1110 (_1!1691 lt!44462))))))))))

(declare-fun b!30567 () Bool)

(declare-fun res!26269 () Bool)

(assert (=> b!30567 (=> res!26269 e!20357)))

(declare-fun length!114 (List!388) Int)

(assert (=> b!30567 (= res!26269 (<= (length!114 lt!44466) 0))))

(declare-fun b!30568 () Bool)

(declare-fun res!26265 () Bool)

(declare-fun e!20349 () Bool)

(assert (=> b!30568 (=> (not res!26265) (not e!20349))))

(assert (=> b!30568 (= res!26265 (validate_offset_bits!1 ((_ sign_extend 32) (size!782 (buf!1110 thiss!1379))) ((_ sign_extend 32) (currentByte!2459 thiss!1379)) ((_ sign_extend 32) (currentBit!2454 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!30569 () Bool)

(declare-fun e!20352 () Bool)

(declare-fun lt!44458 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!30569 (= e!20352 (= lt!44458 (bvsub (bvsub (bvadd (bitIndex!0 (size!782 (buf!1110 (_2!1690 lt!44463))) (currentByte!2459 (_2!1690 lt!44463)) (currentBit!2454 (_2!1690 lt!44463))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!30570 () Bool)

(declare-fun res!26258 () Bool)

(assert (=> b!30570 (=> res!26258 e!20358)))

(assert (=> b!30570 (= res!26258 (not (invariant!0 (currentBit!2454 (_2!1690 lt!44463)) (currentByte!2459 (_2!1690 lt!44463)) (size!782 (buf!1110 (_2!1690 lt!44463))))))))

(declare-fun b!30571 () Bool)

(declare-fun res!26262 () Bool)

(declare-fun e!20353 () Bool)

(assert (=> b!30571 (=> res!26262 e!20353)))

(assert (=> b!30571 (= res!26262 (not (= (size!782 (buf!1110 thiss!1379)) (size!782 (buf!1110 (_2!1690 lt!44457))))))))

(declare-fun b!30572 () Bool)

(assert (=> b!30572 (= e!20353 e!20358)))

(declare-fun res!26267 () Bool)

(assert (=> b!30572 (=> res!26267 e!20358)))

(assert (=> b!30572 (= res!26267 (not (= (size!782 (buf!1110 (_2!1690 lt!44463))) (size!782 (buf!1110 (_2!1690 lt!44457))))))))

(assert (=> b!30572 e!20352))

(declare-fun res!26270 () Bool)

(assert (=> b!30572 (=> (not res!26270) (not e!20352))))

(assert (=> b!30572 (= res!26270 (= (size!782 (buf!1110 (_2!1690 lt!44457))) (size!782 (buf!1110 thiss!1379))))))

(declare-fun b!30573 () Bool)

(declare-fun res!26260 () Bool)

(assert (=> b!30573 (=> res!26260 e!20353)))

(assert (=> b!30573 (= res!26260 (not (invariant!0 (currentBit!2454 (_2!1690 lt!44457)) (currentByte!2459 (_2!1690 lt!44457)) (size!782 (buf!1110 (_2!1690 lt!44457))))))))

(declare-fun b!30574 () Bool)

(declare-fun e!20356 () Bool)

(assert (=> b!30574 (= e!20349 (not e!20356))))

(declare-fun res!26261 () Bool)

(assert (=> b!30574 (=> res!26261 e!20356)))

(assert (=> b!30574 (= res!26261 (bvsge i!635 to!314))))

(assert (=> b!30574 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!44469 () Unit!2347)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1374) Unit!2347)

(assert (=> b!30574 (= lt!44469 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!30574 (= lt!44468 (bitIndex!0 (size!782 (buf!1110 thiss!1379)) (currentByte!2459 thiss!1379) (currentBit!2454 thiss!1379)))))

(declare-fun b!30575 () Bool)

(declare-fun res!26263 () Bool)

(assert (=> b!30575 (=> res!26263 e!20354)))

(declare-fun bitAt!0 (array!1789 (_ BitVec 64)) Bool)

(assert (=> b!30575 (= res!26263 (not (= (bitAt!0 (buf!1110 (_1!1691 lt!44462)) lt!44468) (bitAt!0 (buf!1110 (_1!1691 lt!44472)) lt!44468))))))

(declare-fun b!30576 () Bool)

(assert (=> b!30576 (= e!20348 e!20353)))

(declare-fun res!26274 () Bool)

(assert (=> b!30576 (=> res!26274 e!20353)))

(assert (=> b!30576 (= res!26274 (not (= lt!44458 (bvsub (bvadd lt!44468 to!314) i!635))))))

(assert (=> b!30576 (= lt!44458 (bitIndex!0 (size!782 (buf!1110 (_2!1690 lt!44457))) (currentByte!2459 (_2!1690 lt!44457)) (currentBit!2454 (_2!1690 lt!44457))))))

(declare-fun b!30577 () Bool)

(assert (=> b!30577 (= e!20356 e!20347)))

(declare-fun res!26273 () Bool)

(assert (=> b!30577 (=> res!26273 e!20347)))

(assert (=> b!30577 (= res!26273 (not (isPrefixOf!0 thiss!1379 (_2!1690 lt!44463))))))

(assert (=> b!30577 (validate_offset_bits!1 ((_ sign_extend 32) (size!782 (buf!1110 (_2!1690 lt!44463)))) ((_ sign_extend 32) (currentByte!2459 (_2!1690 lt!44463))) ((_ sign_extend 32) (currentBit!2454 (_2!1690 lt!44463))) lt!44465)))

(assert (=> b!30577 (= lt!44465 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!44470 () Unit!2347)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1374 BitStream!1374 (_ BitVec 64) (_ BitVec 64)) Unit!2347)

(assert (=> b!30577 (= lt!44470 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1690 lt!44463) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1374 (_ BitVec 8) (_ BitVec 32)) tuple2!3206)

(assert (=> b!30577 (= lt!44463 (appendBitFromByte!0 thiss!1379 (select (arr!1248 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun res!26271 () Bool)

(assert (=> start!6502 (=> (not res!26271) (not e!20349))))

(assert (=> start!6502 (= res!26271 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!782 srcBuffer!2))))))))

(assert (=> start!6502 e!20349))

(assert (=> start!6502 true))

(assert (=> start!6502 (array_inv!740 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1374) Bool)

(assert (=> start!6502 (and (inv!12 thiss!1379) e!20350)))

(assert (= (and start!6502 res!26271) b!30568))

(assert (= (and b!30568 res!26265) b!30574))

(assert (= (and b!30574 (not res!26261)) b!30577))

(assert (= (and b!30577 (not res!26273)) b!30562))

(assert (= (and b!30562 res!26268) b!30563))

(assert (= (and b!30562 (not res!26266)) b!30576))

(assert (= (and b!30576 (not res!26274)) b!30573))

(assert (= (and b!30573 (not res!26260)) b!30571))

(assert (= (and b!30571 (not res!26262)) b!30572))

(assert (= (and b!30572 res!26270) b!30569))

(assert (= (and b!30572 (not res!26267)) b!30570))

(assert (= (and b!30570 (not res!26258)) b!30561))

(assert (= (and b!30561 (not res!26259)) b!30564))

(assert (= (and b!30564 (not res!26264)) b!30567))

(assert (= (and b!30567 (not res!26269)) b!30560))

(assert (= (and b!30560 (not res!26272)) b!30575))

(assert (= (and b!30575 (not res!26263)) b!30566))

(assert (= start!6502 b!30565))

(declare-fun m!44653 () Bool)

(assert (=> b!30567 m!44653))

(declare-fun m!44655 () Bool)

(assert (=> b!30573 m!44655))

(declare-fun m!44657 () Bool)

(assert (=> b!30575 m!44657))

(declare-fun m!44659 () Bool)

(assert (=> b!30575 m!44659))

(declare-fun m!44661 () Bool)

(assert (=> b!30576 m!44661))

(declare-fun m!44663 () Bool)

(assert (=> b!30569 m!44663))

(declare-fun m!44665 () Bool)

(assert (=> b!30570 m!44665))

(declare-fun m!44667 () Bool)

(assert (=> b!30562 m!44667))

(declare-fun m!44669 () Bool)

(assert (=> b!30562 m!44669))

(declare-fun m!44671 () Bool)

(assert (=> b!30562 m!44671))

(declare-fun m!44673 () Bool)

(assert (=> b!30562 m!44673))

(declare-fun m!44675 () Bool)

(assert (=> b!30562 m!44675))

(declare-fun m!44677 () Bool)

(assert (=> b!30562 m!44677))

(declare-fun m!44679 () Bool)

(assert (=> b!30562 m!44679))

(declare-fun m!44681 () Bool)

(assert (=> b!30563 m!44681))

(assert (=> b!30563 m!44681))

(declare-fun m!44683 () Bool)

(assert (=> b!30563 m!44683))

(declare-fun m!44685 () Bool)

(assert (=> b!30563 m!44685))

(assert (=> b!30563 m!44685))

(declare-fun m!44687 () Bool)

(assert (=> b!30563 m!44687))

(declare-fun m!44689 () Bool)

(assert (=> b!30568 m!44689))

(declare-fun m!44691 () Bool)

(assert (=> b!30574 m!44691))

(declare-fun m!44693 () Bool)

(assert (=> b!30574 m!44693))

(declare-fun m!44695 () Bool)

(assert (=> b!30574 m!44695))

(declare-fun m!44697 () Bool)

(assert (=> b!30564 m!44697))

(declare-fun m!44699 () Bool)

(assert (=> b!30564 m!44699))

(declare-fun m!44701 () Bool)

(assert (=> b!30564 m!44701))

(declare-fun m!44703 () Bool)

(assert (=> b!30564 m!44703))

(declare-fun m!44705 () Bool)

(assert (=> b!30564 m!44705))

(declare-fun m!44707 () Bool)

(assert (=> b!30564 m!44707))

(declare-fun m!44709 () Bool)

(assert (=> b!30564 m!44709))

(declare-fun m!44711 () Bool)

(assert (=> b!30564 m!44711))

(declare-fun m!44713 () Bool)

(assert (=> b!30577 m!44713))

(declare-fun m!44715 () Bool)

(assert (=> b!30577 m!44715))

(assert (=> b!30577 m!44713))

(declare-fun m!44717 () Bool)

(assert (=> b!30577 m!44717))

(declare-fun m!44719 () Bool)

(assert (=> b!30577 m!44719))

(declare-fun m!44721 () Bool)

(assert (=> b!30577 m!44721))

(declare-fun m!44723 () Bool)

(assert (=> b!30561 m!44723))

(declare-fun m!44725 () Bool)

(assert (=> b!30565 m!44725))

(declare-fun m!44727 () Bool)

(assert (=> start!6502 m!44727))

(declare-fun m!44729 () Bool)

(assert (=> start!6502 m!44729))

(declare-fun m!44731 () Bool)

(assert (=> b!30560 m!44731))

(declare-fun m!44733 () Bool)

(assert (=> b!30560 m!44733))

(check-sat (not b!30577) (not b!30563) (not b!30567) (not b!30576) (not b!30568) (not b!30569) (not b!30564) (not b!30561) (not b!30574) (not b!30565) (not start!6502) (not b!30573) (not b!30562) (not b!30570) (not b!30560) (not b!30575))
(check-sat)
(get-model)

(declare-fun d!8812 () Bool)

(declare-fun e!20401 () Bool)

(assert (=> d!8812 e!20401))

(declare-fun res!26331 () Bool)

(assert (=> d!8812 (=> (not res!26331) (not e!20401))))

(declare-fun lt!44542 () (_ BitVec 64))

(declare-fun lt!44543 () (_ BitVec 64))

(declare-fun lt!44545 () (_ BitVec 64))

(assert (=> d!8812 (= res!26331 (= lt!44543 (bvsub lt!44542 lt!44545)))))

(assert (=> d!8812 (or (= (bvand lt!44542 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!44545 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!44542 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!44542 lt!44545) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!8812 (= lt!44545 (remainingBits!0 ((_ sign_extend 32) (size!782 (buf!1110 (_2!1690 lt!44457)))) ((_ sign_extend 32) (currentByte!2459 (_2!1690 lt!44457))) ((_ sign_extend 32) (currentBit!2454 (_2!1690 lt!44457)))))))

(declare-fun lt!44540 () (_ BitVec 64))

(declare-fun lt!44541 () (_ BitVec 64))

(assert (=> d!8812 (= lt!44542 (bvmul lt!44540 lt!44541))))

(assert (=> d!8812 (or (= lt!44540 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!44541 (bvsdiv (bvmul lt!44540 lt!44541) lt!44540)))))

(assert (=> d!8812 (= lt!44541 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!8812 (= lt!44540 ((_ sign_extend 32) (size!782 (buf!1110 (_2!1690 lt!44457)))))))

(assert (=> d!8812 (= lt!44543 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2459 (_2!1690 lt!44457))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2454 (_2!1690 lt!44457)))))))

(assert (=> d!8812 (invariant!0 (currentBit!2454 (_2!1690 lt!44457)) (currentByte!2459 (_2!1690 lt!44457)) (size!782 (buf!1110 (_2!1690 lt!44457))))))

(assert (=> d!8812 (= (bitIndex!0 (size!782 (buf!1110 (_2!1690 lt!44457))) (currentByte!2459 (_2!1690 lt!44457)) (currentBit!2454 (_2!1690 lt!44457))) lt!44543)))

(declare-fun b!30636 () Bool)

(declare-fun res!26330 () Bool)

(assert (=> b!30636 (=> (not res!26330) (not e!20401))))

(assert (=> b!30636 (= res!26330 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!44543))))

(declare-fun b!30637 () Bool)

(declare-fun lt!44544 () (_ BitVec 64))

(assert (=> b!30637 (= e!20401 (bvsle lt!44543 (bvmul lt!44544 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!30637 (or (= lt!44544 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!44544 #b0000000000000000000000000000000000000000000000000000000000001000) lt!44544)))))

(assert (=> b!30637 (= lt!44544 ((_ sign_extend 32) (size!782 (buf!1110 (_2!1690 lt!44457)))))))

(assert (= (and d!8812 res!26331) b!30636))

(assert (= (and b!30636 res!26330) b!30637))

(declare-fun m!44817 () Bool)

(assert (=> d!8812 m!44817))

(assert (=> d!8812 m!44655))

(assert (=> b!30576 d!8812))

(declare-fun d!8814 () Bool)

(assert (=> d!8814 (= (array_inv!740 (buf!1110 thiss!1379)) (bvsge (size!782 (buf!1110 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!30565 d!8814))

(declare-fun d!8816 () Bool)

(declare-fun size!784 (List!388) Int)

(assert (=> d!8816 (= (length!114 lt!44466) (size!784 lt!44466))))

(declare-fun bs!2462 () Bool)

(assert (= bs!2462 d!8816))

(declare-fun m!44819 () Bool)

(assert (=> bs!2462 m!44819))

(assert (=> b!30567 d!8816))

(declare-fun d!8818 () Bool)

(declare-fun res!26340 () Bool)

(declare-fun e!20406 () Bool)

(assert (=> d!8818 (=> (not res!26340) (not e!20406))))

(assert (=> d!8818 (= res!26340 (= (size!782 (buf!1110 thiss!1379)) (size!782 (buf!1110 (_2!1690 lt!44463)))))))

(assert (=> d!8818 (= (isPrefixOf!0 thiss!1379 (_2!1690 lt!44463)) e!20406)))

(declare-fun b!30644 () Bool)

(declare-fun res!26338 () Bool)

(assert (=> b!30644 (=> (not res!26338) (not e!20406))))

(assert (=> b!30644 (= res!26338 (bvsle (bitIndex!0 (size!782 (buf!1110 thiss!1379)) (currentByte!2459 thiss!1379) (currentBit!2454 thiss!1379)) (bitIndex!0 (size!782 (buf!1110 (_2!1690 lt!44463))) (currentByte!2459 (_2!1690 lt!44463)) (currentBit!2454 (_2!1690 lt!44463)))))))

(declare-fun b!30645 () Bool)

(declare-fun e!20407 () Bool)

(assert (=> b!30645 (= e!20406 e!20407)))

(declare-fun res!26339 () Bool)

(assert (=> b!30645 (=> res!26339 e!20407)))

(assert (=> b!30645 (= res!26339 (= (size!782 (buf!1110 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!30646 () Bool)

(declare-fun arrayBitRangesEq!0 (array!1789 array!1789 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!30646 (= e!20407 (arrayBitRangesEq!0 (buf!1110 thiss!1379) (buf!1110 (_2!1690 lt!44463)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!782 (buf!1110 thiss!1379)) (currentByte!2459 thiss!1379) (currentBit!2454 thiss!1379))))))

(assert (= (and d!8818 res!26340) b!30644))

(assert (= (and b!30644 res!26338) b!30645))

(assert (= (and b!30645 (not res!26339)) b!30646))

(assert (=> b!30644 m!44695))

(assert (=> b!30644 m!44663))

(assert (=> b!30646 m!44695))

(assert (=> b!30646 m!44695))

(declare-fun m!44821 () Bool)

(assert (=> b!30646 m!44821))

(assert (=> b!30577 d!8818))

(declare-fun d!8820 () Bool)

(assert (=> d!8820 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!782 (buf!1110 (_2!1690 lt!44463)))) ((_ sign_extend 32) (currentByte!2459 (_2!1690 lt!44463))) ((_ sign_extend 32) (currentBit!2454 (_2!1690 lt!44463))) lt!44465) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!782 (buf!1110 (_2!1690 lt!44463)))) ((_ sign_extend 32) (currentByte!2459 (_2!1690 lt!44463))) ((_ sign_extend 32) (currentBit!2454 (_2!1690 lt!44463)))) lt!44465))))

(declare-fun bs!2463 () Bool)

(assert (= bs!2463 d!8820))

(declare-fun m!44823 () Bool)

(assert (=> bs!2463 m!44823))

(assert (=> b!30577 d!8820))

(declare-fun d!8822 () Bool)

(declare-fun e!20410 () Bool)

(assert (=> d!8822 e!20410))

(declare-fun res!26343 () Bool)

(assert (=> d!8822 (=> (not res!26343) (not e!20410))))

(assert (=> d!8822 (= res!26343 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!44548 () Unit!2347)

(declare-fun choose!27 (BitStream!1374 BitStream!1374 (_ BitVec 64) (_ BitVec 64)) Unit!2347)

(assert (=> d!8822 (= lt!44548 (choose!27 thiss!1379 (_2!1690 lt!44463) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!8822 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!8822 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1690 lt!44463) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!44548)))

(declare-fun b!30649 () Bool)

(assert (=> b!30649 (= e!20410 (validate_offset_bits!1 ((_ sign_extend 32) (size!782 (buf!1110 (_2!1690 lt!44463)))) ((_ sign_extend 32) (currentByte!2459 (_2!1690 lt!44463))) ((_ sign_extend 32) (currentBit!2454 (_2!1690 lt!44463))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!8822 res!26343) b!30649))

(declare-fun m!44825 () Bool)

(assert (=> d!8822 m!44825))

(declare-fun m!44827 () Bool)

(assert (=> b!30649 m!44827))

(assert (=> b!30577 d!8822))

(declare-fun b!30667 () Bool)

(declare-fun res!26367 () Bool)

(declare-fun e!20420 () Bool)

(assert (=> b!30667 (=> (not res!26367) (not e!20420))))

(declare-fun lt!44576 () tuple2!3206)

(declare-fun lt!44584 () (_ BitVec 64))

(declare-fun lt!44574 () (_ BitVec 64))

(assert (=> b!30667 (= res!26367 (= (bitIndex!0 (size!782 (buf!1110 (_2!1690 lt!44576))) (currentByte!2459 (_2!1690 lt!44576)) (currentBit!2454 (_2!1690 lt!44576))) (bvadd lt!44574 lt!44584)))))

(assert (=> b!30667 (or (not (= (bvand lt!44574 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!44584 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!44574 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!44574 lt!44584) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!30667 (= lt!44584 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!30667 (= lt!44574 (bitIndex!0 (size!782 (buf!1110 thiss!1379)) (currentByte!2459 thiss!1379) (currentBit!2454 thiss!1379)))))

(declare-fun b!30668 () Bool)

(declare-fun e!20419 () Bool)

(declare-datatypes ((tuple2!3214 0))(
  ( (tuple2!3215 (_1!1694 BitStream!1374) (_2!1694 Bool)) )
))
(declare-fun lt!44573 () tuple2!3214)

(assert (=> b!30668 (= e!20419 (= (bitIndex!0 (size!782 (buf!1110 (_1!1694 lt!44573))) (currentByte!2459 (_1!1694 lt!44573)) (currentBit!2454 (_1!1694 lt!44573))) (bitIndex!0 (size!782 (buf!1110 (_2!1690 lt!44576))) (currentByte!2459 (_2!1690 lt!44576)) (currentBit!2454 (_2!1690 lt!44576)))))))

(declare-fun b!30669 () Bool)

(declare-fun e!20421 () Bool)

(declare-fun lt!44580 () tuple2!3214)

(declare-fun lt!44578 () tuple2!3206)

(assert (=> b!30669 (= e!20421 (= (bitIndex!0 (size!782 (buf!1110 (_1!1694 lt!44580))) (currentByte!2459 (_1!1694 lt!44580)) (currentBit!2454 (_1!1694 lt!44580))) (bitIndex!0 (size!782 (buf!1110 (_2!1690 lt!44578))) (currentByte!2459 (_2!1690 lt!44578)) (currentBit!2454 (_2!1690 lt!44578)))))))

(declare-fun b!30671 () Bool)

(assert (=> b!30671 (= e!20420 e!20419)))

(declare-fun res!26366 () Bool)

(assert (=> b!30671 (=> (not res!26366) (not e!20419))))

(declare-fun lt!44583 () (_ BitVec 8))

(assert (=> b!30671 (= res!26366 (and (= (_2!1694 lt!44573) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1248 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!44583)) #b00000000000000000000000000000000))) (= (_1!1694 lt!44573) (_2!1690 lt!44576))))))

(declare-datatypes ((tuple2!3216 0))(
  ( (tuple2!3217 (_1!1695 array!1789) (_2!1695 BitStream!1374)) )
))
(declare-fun lt!44579 () tuple2!3216)

(declare-fun lt!44581 () BitStream!1374)

(declare-fun readBits!0 (BitStream!1374 (_ BitVec 64)) tuple2!3216)

(assert (=> b!30671 (= lt!44579 (readBits!0 lt!44581 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!1374) tuple2!3214)

(assert (=> b!30671 (= lt!44573 (readBitPure!0 lt!44581))))

(declare-fun readerFrom!0 (BitStream!1374 (_ BitVec 32) (_ BitVec 32)) BitStream!1374)

(assert (=> b!30671 (= lt!44581 (readerFrom!0 (_2!1690 lt!44576) (currentBit!2454 thiss!1379) (currentByte!2459 thiss!1379)))))

(declare-fun b!30672 () Bool)

(declare-fun res!26360 () Bool)

(assert (=> b!30672 (=> (not res!26360) (not e!20420))))

(assert (=> b!30672 (= res!26360 (isPrefixOf!0 thiss!1379 (_2!1690 lt!44576)))))

(declare-fun b!30673 () Bool)

(declare-fun res!26364 () Bool)

(declare-fun e!20422 () Bool)

(assert (=> b!30673 (=> (not res!26364) (not e!20422))))

(assert (=> b!30673 (= res!26364 (= (bitIndex!0 (size!782 (buf!1110 (_2!1690 lt!44578))) (currentByte!2459 (_2!1690 lt!44578)) (currentBit!2454 (_2!1690 lt!44578))) (bvadd (bitIndex!0 (size!782 (buf!1110 thiss!1379)) (currentByte!2459 thiss!1379) (currentBit!2454 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!30674 () Bool)

(assert (=> b!30674 (= e!20422 e!20421)))

(declare-fun res!26363 () Bool)

(assert (=> b!30674 (=> (not res!26363) (not e!20421))))

(declare-fun lt!44582 () Bool)

(assert (=> b!30674 (= res!26363 (and (= (_2!1694 lt!44580) lt!44582) (= (_1!1694 lt!44580) (_2!1690 lt!44578))))))

(assert (=> b!30674 (= lt!44580 (readBitPure!0 (readerFrom!0 (_2!1690 lt!44578) (currentBit!2454 thiss!1379) (currentByte!2459 thiss!1379))))))

(declare-fun b!30670 () Bool)

(declare-fun res!26361 () Bool)

(assert (=> b!30670 (=> (not res!26361) (not e!20422))))

(assert (=> b!30670 (= res!26361 (isPrefixOf!0 thiss!1379 (_2!1690 lt!44578)))))

(declare-fun d!8824 () Bool)

(assert (=> d!8824 e!20420))

(declare-fun res!26365 () Bool)

(assert (=> d!8824 (=> (not res!26365) (not e!20420))))

(assert (=> d!8824 (= res!26365 (= (size!782 (buf!1110 (_2!1690 lt!44576))) (size!782 (buf!1110 thiss!1379))))))

(declare-fun lt!44575 () array!1789)

(assert (=> d!8824 (= lt!44583 (select (arr!1248 lt!44575) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!8824 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!782 lt!44575)))))

(assert (=> d!8824 (= lt!44575 (array!1790 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!44577 () tuple2!3206)

(assert (=> d!8824 (= lt!44576 (tuple2!3207 (_1!1690 lt!44577) (_2!1690 lt!44577)))))

(assert (=> d!8824 (= lt!44577 lt!44578)))

(assert (=> d!8824 e!20422))

(declare-fun res!26362 () Bool)

(assert (=> d!8824 (=> (not res!26362) (not e!20422))))

(assert (=> d!8824 (= res!26362 (= (size!782 (buf!1110 thiss!1379)) (size!782 (buf!1110 (_2!1690 lt!44578)))))))

(declare-fun appendBit!0 (BitStream!1374 Bool) tuple2!3206)

(assert (=> d!8824 (= lt!44578 (appendBit!0 thiss!1379 lt!44582))))

(assert (=> d!8824 (= lt!44582 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1248 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!8824 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!8824 (= (appendBitFromByte!0 thiss!1379 (select (arr!1248 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!44576)))

(assert (= (and d!8824 res!26362) b!30673))

(assert (= (and b!30673 res!26364) b!30670))

(assert (= (and b!30670 res!26361) b!30674))

(assert (= (and b!30674 res!26363) b!30669))

(assert (= (and d!8824 res!26365) b!30667))

(assert (= (and b!30667 res!26367) b!30672))

(assert (= (and b!30672 res!26360) b!30671))

(assert (= (and b!30671 res!26366) b!30668))

(declare-fun m!44829 () Bool)

(assert (=> b!30668 m!44829))

(declare-fun m!44831 () Bool)

(assert (=> b!30668 m!44831))

(assert (=> b!30667 m!44831))

(assert (=> b!30667 m!44695))

(declare-fun m!44833 () Bool)

(assert (=> b!30672 m!44833))

(declare-fun m!44835 () Bool)

(assert (=> b!30673 m!44835))

(assert (=> b!30673 m!44695))

(declare-fun m!44837 () Bool)

(assert (=> b!30670 m!44837))

(declare-fun m!44839 () Bool)

(assert (=> b!30671 m!44839))

(declare-fun m!44841 () Bool)

(assert (=> b!30671 m!44841))

(declare-fun m!44843 () Bool)

(assert (=> b!30671 m!44843))

(declare-fun m!44845 () Bool)

(assert (=> d!8824 m!44845))

(declare-fun m!44847 () Bool)

(assert (=> d!8824 m!44847))

(declare-fun m!44849 () Bool)

(assert (=> d!8824 m!44849))

(declare-fun m!44851 () Bool)

(assert (=> b!30669 m!44851))

(assert (=> b!30669 m!44835))

(declare-fun m!44853 () Bool)

(assert (=> b!30674 m!44853))

(assert (=> b!30674 m!44853))

(declare-fun m!44855 () Bool)

(assert (=> b!30674 m!44855))

(assert (=> b!30577 d!8824))

(declare-fun d!8826 () Bool)

(assert (=> d!8826 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!782 (buf!1110 thiss!1379))) ((_ sign_extend 32) (currentByte!2459 thiss!1379)) ((_ sign_extend 32) (currentBit!2454 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!782 (buf!1110 thiss!1379))) ((_ sign_extend 32) (currentByte!2459 thiss!1379)) ((_ sign_extend 32) (currentBit!2454 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2464 () Bool)

(assert (= bs!2464 d!8826))

(declare-fun m!44857 () Bool)

(assert (=> bs!2464 m!44857))

(assert (=> b!30568 d!8826))

(declare-fun d!8828 () Bool)

(declare-fun e!20423 () Bool)

(assert (=> d!8828 e!20423))

(declare-fun res!26369 () Bool)

(assert (=> d!8828 (=> (not res!26369) (not e!20423))))

(declare-fun lt!44588 () (_ BitVec 64))

(declare-fun lt!44590 () (_ BitVec 64))

(declare-fun lt!44587 () (_ BitVec 64))

(assert (=> d!8828 (= res!26369 (= lt!44588 (bvsub lt!44587 lt!44590)))))

(assert (=> d!8828 (or (= (bvand lt!44587 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!44590 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!44587 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!44587 lt!44590) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!8828 (= lt!44590 (remainingBits!0 ((_ sign_extend 32) (size!782 (buf!1110 (_2!1690 lt!44463)))) ((_ sign_extend 32) (currentByte!2459 (_2!1690 lt!44463))) ((_ sign_extend 32) (currentBit!2454 (_2!1690 lt!44463)))))))

(declare-fun lt!44585 () (_ BitVec 64))

(declare-fun lt!44586 () (_ BitVec 64))

(assert (=> d!8828 (= lt!44587 (bvmul lt!44585 lt!44586))))

(assert (=> d!8828 (or (= lt!44585 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!44586 (bvsdiv (bvmul lt!44585 lt!44586) lt!44585)))))

(assert (=> d!8828 (= lt!44586 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!8828 (= lt!44585 ((_ sign_extend 32) (size!782 (buf!1110 (_2!1690 lt!44463)))))))

(assert (=> d!8828 (= lt!44588 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2459 (_2!1690 lt!44463))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2454 (_2!1690 lt!44463)))))))

(assert (=> d!8828 (invariant!0 (currentBit!2454 (_2!1690 lt!44463)) (currentByte!2459 (_2!1690 lt!44463)) (size!782 (buf!1110 (_2!1690 lt!44463))))))

(assert (=> d!8828 (= (bitIndex!0 (size!782 (buf!1110 (_2!1690 lt!44463))) (currentByte!2459 (_2!1690 lt!44463)) (currentBit!2454 (_2!1690 lt!44463))) lt!44588)))

(declare-fun b!30675 () Bool)

(declare-fun res!26368 () Bool)

(assert (=> b!30675 (=> (not res!26368) (not e!20423))))

(assert (=> b!30675 (= res!26368 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!44588))))

(declare-fun b!30676 () Bool)

(declare-fun lt!44589 () (_ BitVec 64))

(assert (=> b!30676 (= e!20423 (bvsle lt!44588 (bvmul lt!44589 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!30676 (or (= lt!44589 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!44589 #b0000000000000000000000000000000000000000000000000000000000001000) lt!44589)))))

(assert (=> b!30676 (= lt!44589 ((_ sign_extend 32) (size!782 (buf!1110 (_2!1690 lt!44463)))))))

(assert (= (and d!8828 res!26369) b!30675))

(assert (= (and b!30675 res!26368) b!30676))

(assert (=> d!8828 m!44823))

(assert (=> d!8828 m!44665))

(assert (=> b!30569 d!8828))

(declare-fun d!8830 () Bool)

(assert (=> d!8830 (= (array_inv!740 srcBuffer!2) (bvsge (size!782 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!6502 d!8830))

(declare-fun d!8832 () Bool)

(assert (=> d!8832 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2454 thiss!1379) (currentByte!2459 thiss!1379) (size!782 (buf!1110 thiss!1379))))))

(declare-fun bs!2465 () Bool)

(assert (= bs!2465 d!8832))

(declare-fun m!44859 () Bool)

(assert (=> bs!2465 m!44859))

(assert (=> start!6502 d!8832))

(declare-fun d!8834 () Bool)

(assert (=> d!8834 (= (tail!105 lt!44466) (t!1138 lt!44466))))

(assert (=> b!30560 d!8834))

(declare-fun d!8836 () Bool)

(declare-fun e!20426 () Bool)

(assert (=> d!8836 e!20426))

(declare-fun res!26372 () Bool)

(assert (=> d!8836 (=> (not res!26372) (not e!20426))))

(declare-fun lt!44596 () (_ BitVec 64))

(assert (=> d!8836 (= res!26372 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!44596 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!44596) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!8836 (= lt!44596 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!44595 () Unit!2347)

(declare-fun choose!42 (BitStream!1374 BitStream!1374 BitStream!1374 BitStream!1374 (_ BitVec 64) List!388) Unit!2347)

(assert (=> d!8836 (= lt!44595 (choose!42 (_2!1690 lt!44457) (_2!1690 lt!44457) (_1!1691 lt!44462) (_1!1691 lt!44472) (bvsub to!314 i!635) lt!44466))))

(assert (=> d!8836 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8836 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1690 lt!44457) (_2!1690 lt!44457) (_1!1691 lt!44462) (_1!1691 lt!44472) (bvsub to!314 i!635) lt!44466) lt!44595)))

(declare-fun b!30679 () Bool)

(assert (=> b!30679 (= e!20426 (= (bitStreamReadBitsIntoList!0 (_2!1690 lt!44457) (_1!1691 lt!44472) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!105 lt!44466)))))

(assert (= (and d!8836 res!26372) b!30679))

(declare-fun m!44861 () Bool)

(assert (=> d!8836 m!44861))

(declare-fun m!44863 () Bool)

(assert (=> b!30679 m!44863))

(assert (=> b!30679 m!44731))

(assert (=> b!30560 d!8836))

(declare-fun d!8838 () Bool)

(assert (=> d!8838 (= (invariant!0 (currentBit!2454 (_2!1690 lt!44463)) (currentByte!2459 (_2!1690 lt!44463)) (size!782 (buf!1110 (_2!1690 lt!44463)))) (and (bvsge (currentBit!2454 (_2!1690 lt!44463)) #b00000000000000000000000000000000) (bvslt (currentBit!2454 (_2!1690 lt!44463)) #b00000000000000000000000000001000) (bvsge (currentByte!2459 (_2!1690 lt!44463)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2459 (_2!1690 lt!44463)) (size!782 (buf!1110 (_2!1690 lt!44463)))) (and (= (currentBit!2454 (_2!1690 lt!44463)) #b00000000000000000000000000000000) (= (currentByte!2459 (_2!1690 lt!44463)) (size!782 (buf!1110 (_2!1690 lt!44463))))))))))

(assert (=> b!30570 d!8838))

(declare-fun d!8840 () Bool)

(assert (=> d!8840 (= (invariant!0 (currentBit!2454 (_2!1690 lt!44463)) (currentByte!2459 (_2!1690 lt!44463)) (size!782 (buf!1110 (_2!1690 lt!44457)))) (and (bvsge (currentBit!2454 (_2!1690 lt!44463)) #b00000000000000000000000000000000) (bvslt (currentBit!2454 (_2!1690 lt!44463)) #b00000000000000000000000000001000) (bvsge (currentByte!2459 (_2!1690 lt!44463)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2459 (_2!1690 lt!44463)) (size!782 (buf!1110 (_2!1690 lt!44457)))) (and (= (currentBit!2454 (_2!1690 lt!44463)) #b00000000000000000000000000000000) (= (currentByte!2459 (_2!1690 lt!44463)) (size!782 (buf!1110 (_2!1690 lt!44457))))))))))

(assert (=> b!30561 d!8840))

(declare-fun d!8842 () Bool)

(assert (=> d!8842 (= (head!225 (byteArrayBitContentToList!0 (_2!1690 lt!44463) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!503 (byteArrayBitContentToList!0 (_2!1690 lt!44463) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!30563 d!8842))

(declare-fun d!8844 () Bool)

(declare-fun c!2031 () Bool)

(assert (=> d!8844 (= c!2031 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!20429 () List!388)

(assert (=> d!8844 (= (byteArrayBitContentToList!0 (_2!1690 lt!44463) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!20429)))

(declare-fun b!30684 () Bool)

(assert (=> b!30684 (= e!20429 Nil!385)))

(declare-fun b!30685 () Bool)

(assert (=> b!30685 (= e!20429 (Cons!384 (not (= (bvand ((_ sign_extend 24) (select (arr!1248 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1690 lt!44463) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!8844 c!2031) b!30684))

(assert (= (and d!8844 (not c!2031)) b!30685))

(assert (=> b!30685 m!44713))

(assert (=> b!30685 m!44849))

(declare-fun m!44865 () Bool)

(assert (=> b!30685 m!44865))

(assert (=> b!30563 d!8844))

(declare-fun d!8846 () Bool)

(assert (=> d!8846 (= (head!225 (bitStreamReadBitsIntoList!0 (_2!1690 lt!44463) (_1!1691 lt!44460) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!503 (bitStreamReadBitsIntoList!0 (_2!1690 lt!44463) (_1!1691 lt!44460) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!30563 d!8846))

(declare-fun b!30696 () Bool)

(declare-fun e!20434 () Bool)

(declare-fun lt!44605 () List!388)

(declare-fun isEmpty!81 (List!388) Bool)

(assert (=> b!30696 (= e!20434 (isEmpty!81 lt!44605))))

(declare-fun d!8848 () Bool)

(assert (=> d!8848 e!20434))

(declare-fun c!2037 () Bool)

(assert (=> d!8848 (= c!2037 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3218 0))(
  ( (tuple2!3219 (_1!1696 List!388) (_2!1696 BitStream!1374)) )
))
(declare-fun e!20435 () tuple2!3218)

(assert (=> d!8848 (= lt!44605 (_1!1696 e!20435))))

(declare-fun c!2036 () Bool)

(assert (=> d!8848 (= c!2036 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8848 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8848 (= (bitStreamReadBitsIntoList!0 (_2!1690 lt!44463) (_1!1691 lt!44460) #b0000000000000000000000000000000000000000000000000000000000000001) lt!44605)))

(declare-fun b!30695 () Bool)

(declare-fun lt!44603 () (_ BitVec 64))

(declare-datatypes ((tuple2!3220 0))(
  ( (tuple2!3221 (_1!1697 Bool) (_2!1697 BitStream!1374)) )
))
(declare-fun lt!44604 () tuple2!3220)

(assert (=> b!30695 (= e!20435 (tuple2!3219 (Cons!384 (_1!1697 lt!44604) (bitStreamReadBitsIntoList!0 (_2!1690 lt!44463) (_2!1697 lt!44604) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!44603))) (_2!1697 lt!44604)))))

(declare-fun readBit!0 (BitStream!1374) tuple2!3220)

(assert (=> b!30695 (= lt!44604 (readBit!0 (_1!1691 lt!44460)))))

(assert (=> b!30695 (= lt!44603 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!30694 () Bool)

(assert (=> b!30694 (= e!20435 (tuple2!3219 Nil!385 (_1!1691 lt!44460)))))

(declare-fun b!30697 () Bool)

(assert (=> b!30697 (= e!20434 (> (length!114 lt!44605) 0))))

(assert (= (and d!8848 c!2036) b!30694))

(assert (= (and d!8848 (not c!2036)) b!30695))

(assert (= (and d!8848 c!2037) b!30696))

(assert (= (and d!8848 (not c!2037)) b!30697))

(declare-fun m!44867 () Bool)

(assert (=> b!30696 m!44867))

(declare-fun m!44869 () Bool)

(assert (=> b!30695 m!44869))

(declare-fun m!44871 () Bool)

(assert (=> b!30695 m!44871))

(declare-fun m!44873 () Bool)

(assert (=> b!30697 m!44873))

(assert (=> b!30563 d!8848))

(declare-fun d!8850 () Bool)

(assert (=> d!8850 (= (invariant!0 (currentBit!2454 (_2!1690 lt!44457)) (currentByte!2459 (_2!1690 lt!44457)) (size!782 (buf!1110 (_2!1690 lt!44457)))) (and (bvsge (currentBit!2454 (_2!1690 lt!44457)) #b00000000000000000000000000000000) (bvslt (currentBit!2454 (_2!1690 lt!44457)) #b00000000000000000000000000001000) (bvsge (currentByte!2459 (_2!1690 lt!44457)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2459 (_2!1690 lt!44457)) (size!782 (buf!1110 (_2!1690 lt!44457)))) (and (= (currentBit!2454 (_2!1690 lt!44457)) #b00000000000000000000000000000000) (= (currentByte!2459 (_2!1690 lt!44457)) (size!782 (buf!1110 (_2!1690 lt!44457))))))))))

(assert (=> b!30573 d!8850))

(declare-fun d!8852 () Bool)

(assert (=> d!8852 (isPrefixOf!0 thiss!1379 (_2!1690 lt!44457))))

(declare-fun lt!44608 () Unit!2347)

(declare-fun choose!30 (BitStream!1374 BitStream!1374 BitStream!1374) Unit!2347)

(assert (=> d!8852 (= lt!44608 (choose!30 thiss!1379 (_2!1690 lt!44463) (_2!1690 lt!44457)))))

(assert (=> d!8852 (isPrefixOf!0 thiss!1379 (_2!1690 lt!44463))))

(assert (=> d!8852 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1690 lt!44463) (_2!1690 lt!44457)) lt!44608)))

(declare-fun bs!2466 () Bool)

(assert (= bs!2466 d!8852))

(assert (=> bs!2466 m!44677))

(declare-fun m!44875 () Bool)

(assert (=> bs!2466 m!44875))

(assert (=> bs!2466 m!44715))

(assert (=> b!30562 d!8852))

(declare-fun d!8854 () Bool)

(declare-fun res!26375 () Bool)

(declare-fun e!20436 () Bool)

(assert (=> d!8854 (=> (not res!26375) (not e!20436))))

(assert (=> d!8854 (= res!26375 (= (size!782 (buf!1110 (_2!1690 lt!44463))) (size!782 (buf!1110 (_2!1690 lt!44457)))))))

(assert (=> d!8854 (= (isPrefixOf!0 (_2!1690 lt!44463) (_2!1690 lt!44457)) e!20436)))

(declare-fun b!30698 () Bool)

(declare-fun res!26373 () Bool)

(assert (=> b!30698 (=> (not res!26373) (not e!20436))))

(assert (=> b!30698 (= res!26373 (bvsle (bitIndex!0 (size!782 (buf!1110 (_2!1690 lt!44463))) (currentByte!2459 (_2!1690 lt!44463)) (currentBit!2454 (_2!1690 lt!44463))) (bitIndex!0 (size!782 (buf!1110 (_2!1690 lt!44457))) (currentByte!2459 (_2!1690 lt!44457)) (currentBit!2454 (_2!1690 lt!44457)))))))

(declare-fun b!30699 () Bool)

(declare-fun e!20437 () Bool)

(assert (=> b!30699 (= e!20436 e!20437)))

(declare-fun res!26374 () Bool)

(assert (=> b!30699 (=> res!26374 e!20437)))

(assert (=> b!30699 (= res!26374 (= (size!782 (buf!1110 (_2!1690 lt!44463))) #b00000000000000000000000000000000))))

(declare-fun b!30700 () Bool)

(assert (=> b!30700 (= e!20437 (arrayBitRangesEq!0 (buf!1110 (_2!1690 lt!44463)) (buf!1110 (_2!1690 lt!44457)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!782 (buf!1110 (_2!1690 lt!44463))) (currentByte!2459 (_2!1690 lt!44463)) (currentBit!2454 (_2!1690 lt!44463)))))))

(assert (= (and d!8854 res!26375) b!30698))

(assert (= (and b!30698 res!26373) b!30699))

(assert (= (and b!30699 (not res!26374)) b!30700))

(assert (=> b!30698 m!44663))

(assert (=> b!30698 m!44661))

(assert (=> b!30700 m!44663))

(assert (=> b!30700 m!44663))

(declare-fun m!44877 () Bool)

(assert (=> b!30700 m!44877))

(assert (=> b!30562 d!8854))

(declare-fun d!8856 () Bool)

(assert (=> d!8856 (validate_offset_bits!1 ((_ sign_extend 32) (size!782 (buf!1110 (_2!1690 lt!44463)))) ((_ sign_extend 32) (currentByte!2459 thiss!1379)) ((_ sign_extend 32) (currentBit!2454 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!44611 () Unit!2347)

(declare-fun choose!9 (BitStream!1374 array!1789 (_ BitVec 64) BitStream!1374) Unit!2347)

(assert (=> d!8856 (= lt!44611 (choose!9 thiss!1379 (buf!1110 (_2!1690 lt!44463)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1375 (buf!1110 (_2!1690 lt!44463)) (currentByte!2459 thiss!1379) (currentBit!2454 thiss!1379))))))

(assert (=> d!8856 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1110 (_2!1690 lt!44463)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!44611)))

(declare-fun bs!2467 () Bool)

(assert (= bs!2467 d!8856))

(assert (=> bs!2467 m!44667))

(declare-fun m!44879 () Bool)

(assert (=> bs!2467 m!44879))

(assert (=> b!30562 d!8856))

(declare-fun b!30711 () Bool)

(declare-fun res!26382 () Bool)

(declare-fun e!20442 () Bool)

(assert (=> b!30711 (=> (not res!26382) (not e!20442))))

(declare-fun lt!44657 () tuple2!3208)

(assert (=> b!30711 (= res!26382 (isPrefixOf!0 (_2!1691 lt!44657) (_2!1690 lt!44463)))))

(declare-fun b!30712 () Bool)

(declare-fun e!20443 () Unit!2347)

(declare-fun lt!44667 () Unit!2347)

(assert (=> b!30712 (= e!20443 lt!44667)))

(declare-fun lt!44670 () (_ BitVec 64))

(assert (=> b!30712 (= lt!44670 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44671 () (_ BitVec 64))

(assert (=> b!30712 (= lt!44671 (bitIndex!0 (size!782 (buf!1110 thiss!1379)) (currentByte!2459 thiss!1379) (currentBit!2454 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1789 array!1789 (_ BitVec 64) (_ BitVec 64)) Unit!2347)

(assert (=> b!30712 (= lt!44667 (arrayBitRangesEqSymmetric!0 (buf!1110 thiss!1379) (buf!1110 (_2!1690 lt!44463)) lt!44670 lt!44671))))

(assert (=> b!30712 (arrayBitRangesEq!0 (buf!1110 (_2!1690 lt!44463)) (buf!1110 thiss!1379) lt!44670 lt!44671)))

(declare-fun b!30713 () Bool)

(declare-fun lt!44660 () (_ BitVec 64))

(declare-fun lt!44656 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1374 (_ BitVec 64)) BitStream!1374)

(assert (=> b!30713 (= e!20442 (= (_1!1691 lt!44657) (withMovedBitIndex!0 (_2!1691 lt!44657) (bvsub lt!44656 lt!44660))))))

(assert (=> b!30713 (or (= (bvand lt!44656 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!44660 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!44656 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!44656 lt!44660) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!30713 (= lt!44660 (bitIndex!0 (size!782 (buf!1110 (_2!1690 lt!44463))) (currentByte!2459 (_2!1690 lt!44463)) (currentBit!2454 (_2!1690 lt!44463))))))

(assert (=> b!30713 (= lt!44656 (bitIndex!0 (size!782 (buf!1110 thiss!1379)) (currentByte!2459 thiss!1379) (currentBit!2454 thiss!1379)))))

(declare-fun d!8858 () Bool)

(assert (=> d!8858 e!20442))

(declare-fun res!26384 () Bool)

(assert (=> d!8858 (=> (not res!26384) (not e!20442))))

(assert (=> d!8858 (= res!26384 (isPrefixOf!0 (_1!1691 lt!44657) (_2!1691 lt!44657)))))

(declare-fun lt!44663 () BitStream!1374)

(assert (=> d!8858 (= lt!44657 (tuple2!3209 lt!44663 (_2!1690 lt!44463)))))

(declare-fun lt!44653 () Unit!2347)

(declare-fun lt!44669 () Unit!2347)

(assert (=> d!8858 (= lt!44653 lt!44669)))

(assert (=> d!8858 (isPrefixOf!0 lt!44663 (_2!1690 lt!44463))))

(assert (=> d!8858 (= lt!44669 (lemmaIsPrefixTransitive!0 lt!44663 (_2!1690 lt!44463) (_2!1690 lt!44463)))))

(declare-fun lt!44654 () Unit!2347)

(declare-fun lt!44665 () Unit!2347)

(assert (=> d!8858 (= lt!44654 lt!44665)))

(assert (=> d!8858 (isPrefixOf!0 lt!44663 (_2!1690 lt!44463))))

(assert (=> d!8858 (= lt!44665 (lemmaIsPrefixTransitive!0 lt!44663 thiss!1379 (_2!1690 lt!44463)))))

(declare-fun lt!44655 () Unit!2347)

(assert (=> d!8858 (= lt!44655 e!20443)))

(declare-fun c!2040 () Bool)

(assert (=> d!8858 (= c!2040 (not (= (size!782 (buf!1110 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!44666 () Unit!2347)

(declare-fun lt!44659 () Unit!2347)

(assert (=> d!8858 (= lt!44666 lt!44659)))

(assert (=> d!8858 (isPrefixOf!0 (_2!1690 lt!44463) (_2!1690 lt!44463))))

(assert (=> d!8858 (= lt!44659 (lemmaIsPrefixRefl!0 (_2!1690 lt!44463)))))

(declare-fun lt!44668 () Unit!2347)

(declare-fun lt!44661 () Unit!2347)

(assert (=> d!8858 (= lt!44668 lt!44661)))

(assert (=> d!8858 (= lt!44661 (lemmaIsPrefixRefl!0 (_2!1690 lt!44463)))))

(declare-fun lt!44652 () Unit!2347)

(declare-fun lt!44662 () Unit!2347)

(assert (=> d!8858 (= lt!44652 lt!44662)))

(assert (=> d!8858 (isPrefixOf!0 lt!44663 lt!44663)))

(assert (=> d!8858 (= lt!44662 (lemmaIsPrefixRefl!0 lt!44663))))

(declare-fun lt!44658 () Unit!2347)

(declare-fun lt!44664 () Unit!2347)

(assert (=> d!8858 (= lt!44658 lt!44664)))

(assert (=> d!8858 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!8858 (= lt!44664 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!8858 (= lt!44663 (BitStream!1375 (buf!1110 (_2!1690 lt!44463)) (currentByte!2459 thiss!1379) (currentBit!2454 thiss!1379)))))

(assert (=> d!8858 (isPrefixOf!0 thiss!1379 (_2!1690 lt!44463))))

(assert (=> d!8858 (= (reader!0 thiss!1379 (_2!1690 lt!44463)) lt!44657)))

(declare-fun b!30714 () Bool)

(declare-fun res!26383 () Bool)

(assert (=> b!30714 (=> (not res!26383) (not e!20442))))

(assert (=> b!30714 (= res!26383 (isPrefixOf!0 (_1!1691 lt!44657) thiss!1379))))

(declare-fun b!30715 () Bool)

(declare-fun Unit!2351 () Unit!2347)

(assert (=> b!30715 (= e!20443 Unit!2351)))

(assert (= (and d!8858 c!2040) b!30712))

(assert (= (and d!8858 (not c!2040)) b!30715))

(assert (= (and d!8858 res!26384) b!30714))

(assert (= (and b!30714 res!26383) b!30711))

(assert (= (and b!30711 res!26382) b!30713))

(declare-fun m!44881 () Bool)

(assert (=> b!30714 m!44881))

(assert (=> b!30712 m!44695))

(declare-fun m!44883 () Bool)

(assert (=> b!30712 m!44883))

(declare-fun m!44885 () Bool)

(assert (=> b!30712 m!44885))

(declare-fun m!44887 () Bool)

(assert (=> b!30713 m!44887))

(assert (=> b!30713 m!44663))

(assert (=> b!30713 m!44695))

(declare-fun m!44889 () Bool)

(assert (=> b!30711 m!44889))

(declare-fun m!44891 () Bool)

(assert (=> d!8858 m!44891))

(assert (=> d!8858 m!44715))

(declare-fun m!44893 () Bool)

(assert (=> d!8858 m!44893))

(assert (=> d!8858 m!44691))

(declare-fun m!44895 () Bool)

(assert (=> d!8858 m!44895))

(declare-fun m!44897 () Bool)

(assert (=> d!8858 m!44897))

(declare-fun m!44899 () Bool)

(assert (=> d!8858 m!44899))

(assert (=> d!8858 m!44693))

(declare-fun m!44901 () Bool)

(assert (=> d!8858 m!44901))

(declare-fun m!44903 () Bool)

(assert (=> d!8858 m!44903))

(declare-fun m!44905 () Bool)

(assert (=> d!8858 m!44905))

(assert (=> b!30562 d!8858))

(declare-fun b!30793 () Bool)

(declare-fun e!20483 () Bool)

(declare-fun lt!44952 () (_ BitVec 64))

(assert (=> b!30793 (= e!20483 (validate_offset_bits!1 ((_ sign_extend 32) (size!782 (buf!1110 (_2!1690 lt!44463)))) ((_ sign_extend 32) (currentByte!2459 (_2!1690 lt!44463))) ((_ sign_extend 32) (currentBit!2454 (_2!1690 lt!44463))) lt!44952))))

(declare-fun b!30794 () Bool)

(declare-fun e!20482 () tuple2!3206)

(declare-fun Unit!2352 () Unit!2347)

(assert (=> b!30794 (= e!20482 (tuple2!3207 Unit!2352 (_2!1690 lt!44463)))))

(assert (=> b!30794 (= (size!782 (buf!1110 (_2!1690 lt!44463))) (size!782 (buf!1110 (_2!1690 lt!44463))))))

(declare-fun lt!44951 () Unit!2347)

(declare-fun Unit!2353 () Unit!2347)

(assert (=> b!30794 (= lt!44951 Unit!2353)))

(declare-fun call!394 () tuple2!3208)

(declare-fun checkByteArrayBitContent!0 (BitStream!1374 array!1789 array!1789 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!30794 (checkByteArrayBitContent!0 (_2!1690 lt!44463) srcBuffer!2 (_1!1695 (readBits!0 (_1!1691 call!394) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!44934 () tuple2!3206)

(declare-fun bm!391 () Bool)

(declare-fun c!2056 () Bool)

(assert (=> bm!391 (= call!394 (reader!0 (_2!1690 lt!44463) (ite c!2056 (_2!1690 lt!44934) (_2!1690 lt!44463))))))

(declare-fun b!30795 () Bool)

(declare-fun res!26434 () Bool)

(declare-fun e!20481 () Bool)

(assert (=> b!30795 (=> (not res!26434) (not e!20481))))

(declare-fun lt!44930 () tuple2!3206)

(assert (=> b!30795 (= res!26434 (invariant!0 (currentBit!2454 (_2!1690 lt!44930)) (currentByte!2459 (_2!1690 lt!44930)) (size!782 (buf!1110 (_2!1690 lt!44930)))))))

(declare-fun b!30796 () Bool)

(declare-fun res!26435 () Bool)

(assert (=> b!30796 (=> (not res!26435) (not e!20481))))

(assert (=> b!30796 (= res!26435 (isPrefixOf!0 (_2!1690 lt!44463) (_2!1690 lt!44930)))))

(declare-fun d!8860 () Bool)

(assert (=> d!8860 e!20481))

(declare-fun res!26436 () Bool)

(assert (=> d!8860 (=> (not res!26436) (not e!20481))))

(declare-fun lt!44950 () (_ BitVec 64))

(assert (=> d!8860 (= res!26436 (= (bitIndex!0 (size!782 (buf!1110 (_2!1690 lt!44930))) (currentByte!2459 (_2!1690 lt!44930)) (currentBit!2454 (_2!1690 lt!44930))) (bvsub lt!44950 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!8860 (or (= (bvand lt!44950 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!44950 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!44950 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!44921 () (_ BitVec 64))

(assert (=> d!8860 (= lt!44950 (bvadd lt!44921 to!314))))

(assert (=> d!8860 (or (not (= (bvand lt!44921 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!44921 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!44921 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!8860 (= lt!44921 (bitIndex!0 (size!782 (buf!1110 (_2!1690 lt!44463))) (currentByte!2459 (_2!1690 lt!44463)) (currentBit!2454 (_2!1690 lt!44463))))))

(assert (=> d!8860 (= lt!44930 e!20482)))

(assert (=> d!8860 (= c!2056 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!44927 () Unit!2347)

(declare-fun lt!44940 () Unit!2347)

(assert (=> d!8860 (= lt!44927 lt!44940)))

(assert (=> d!8860 (isPrefixOf!0 (_2!1690 lt!44463) (_2!1690 lt!44463))))

(assert (=> d!8860 (= lt!44940 (lemmaIsPrefixRefl!0 (_2!1690 lt!44463)))))

(declare-fun lt!44936 () (_ BitVec 64))

(assert (=> d!8860 (= lt!44936 (bitIndex!0 (size!782 (buf!1110 (_2!1690 lt!44463))) (currentByte!2459 (_2!1690 lt!44463)) (currentBit!2454 (_2!1690 lt!44463))))))

(assert (=> d!8860 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8860 (= (appendBitsMSBFirstLoop!0 (_2!1690 lt!44463) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!44930)))

(declare-fun b!30797 () Bool)

(declare-fun res!26432 () Bool)

(assert (=> b!30797 (=> (not res!26432) (not e!20481))))

(assert (=> b!30797 (= res!26432 (= (size!782 (buf!1110 (_2!1690 lt!44930))) (size!782 (buf!1110 (_2!1690 lt!44463)))))))

(declare-fun b!30798 () Bool)

(declare-fun res!26433 () Bool)

(assert (=> b!30798 (=> (not res!26433) (not e!20481))))

(assert (=> b!30798 (= res!26433 (= (size!782 (buf!1110 (_2!1690 lt!44463))) (size!782 (buf!1110 (_2!1690 lt!44930)))))))

(declare-fun b!30799 () Bool)

(declare-fun Unit!2354 () Unit!2347)

(assert (=> b!30799 (= e!20482 (tuple2!3207 Unit!2354 (_2!1690 lt!44934)))))

(declare-fun lt!44943 () tuple2!3206)

(assert (=> b!30799 (= lt!44943 (appendBitFromByte!0 (_2!1690 lt!44463) (select (arr!1248 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!44957 () (_ BitVec 64))

(assert (=> b!30799 (= lt!44957 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!44949 () (_ BitVec 64))

(assert (=> b!30799 (= lt!44949 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!44923 () Unit!2347)

(assert (=> b!30799 (= lt!44923 (validateOffsetBitsIneqLemma!0 (_2!1690 lt!44463) (_2!1690 lt!44943) lt!44957 lt!44949))))

(assert (=> b!30799 (validate_offset_bits!1 ((_ sign_extend 32) (size!782 (buf!1110 (_2!1690 lt!44943)))) ((_ sign_extend 32) (currentByte!2459 (_2!1690 lt!44943))) ((_ sign_extend 32) (currentBit!2454 (_2!1690 lt!44943))) (bvsub lt!44957 lt!44949))))

(declare-fun lt!44933 () Unit!2347)

(assert (=> b!30799 (= lt!44933 lt!44923)))

(declare-fun lt!44931 () tuple2!3208)

(assert (=> b!30799 (= lt!44931 (reader!0 (_2!1690 lt!44463) (_2!1690 lt!44943)))))

(declare-fun lt!44941 () (_ BitVec 64))

(assert (=> b!30799 (= lt!44941 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!44919 () Unit!2347)

(assert (=> b!30799 (= lt!44919 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1690 lt!44463) (buf!1110 (_2!1690 lt!44943)) lt!44941))))

(assert (=> b!30799 (validate_offset_bits!1 ((_ sign_extend 32) (size!782 (buf!1110 (_2!1690 lt!44943)))) ((_ sign_extend 32) (currentByte!2459 (_2!1690 lt!44463))) ((_ sign_extend 32) (currentBit!2454 (_2!1690 lt!44463))) lt!44941)))

(declare-fun lt!44925 () Unit!2347)

(assert (=> b!30799 (= lt!44925 lt!44919)))

(assert (=> b!30799 (= (head!225 (byteArrayBitContentToList!0 (_2!1690 lt!44943) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!225 (bitStreamReadBitsIntoList!0 (_2!1690 lt!44943) (_1!1691 lt!44931) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!44928 () Unit!2347)

(declare-fun Unit!2355 () Unit!2347)

(assert (=> b!30799 (= lt!44928 Unit!2355)))

(assert (=> b!30799 (= lt!44934 (appendBitsMSBFirstLoop!0 (_2!1690 lt!44943) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!44945 () Unit!2347)

(assert (=> b!30799 (= lt!44945 (lemmaIsPrefixTransitive!0 (_2!1690 lt!44463) (_2!1690 lt!44943) (_2!1690 lt!44934)))))

(assert (=> b!30799 (isPrefixOf!0 (_2!1690 lt!44463) (_2!1690 lt!44934))))

(declare-fun lt!44958 () Unit!2347)

(assert (=> b!30799 (= lt!44958 lt!44945)))

(assert (=> b!30799 (= (size!782 (buf!1110 (_2!1690 lt!44934))) (size!782 (buf!1110 (_2!1690 lt!44463))))))

(declare-fun lt!44917 () Unit!2347)

(declare-fun Unit!2356 () Unit!2347)

(assert (=> b!30799 (= lt!44917 Unit!2356)))

(assert (=> b!30799 (= (bitIndex!0 (size!782 (buf!1110 (_2!1690 lt!44934))) (currentByte!2459 (_2!1690 lt!44934)) (currentBit!2454 (_2!1690 lt!44934))) (bvsub (bvadd (bitIndex!0 (size!782 (buf!1110 (_2!1690 lt!44463))) (currentByte!2459 (_2!1690 lt!44463)) (currentBit!2454 (_2!1690 lt!44463))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!44955 () Unit!2347)

(declare-fun Unit!2357 () Unit!2347)

(assert (=> b!30799 (= lt!44955 Unit!2357)))

(assert (=> b!30799 (= (bitIndex!0 (size!782 (buf!1110 (_2!1690 lt!44934))) (currentByte!2459 (_2!1690 lt!44934)) (currentBit!2454 (_2!1690 lt!44934))) (bvsub (bvsub (bvadd (bitIndex!0 (size!782 (buf!1110 (_2!1690 lt!44943))) (currentByte!2459 (_2!1690 lt!44943)) (currentBit!2454 (_2!1690 lt!44943))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!44947 () Unit!2347)

(declare-fun Unit!2358 () Unit!2347)

(assert (=> b!30799 (= lt!44947 Unit!2358)))

(declare-fun lt!44953 () tuple2!3208)

(assert (=> b!30799 (= lt!44953 call!394)))

(declare-fun lt!44956 () (_ BitVec 64))

(assert (=> b!30799 (= lt!44956 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!44938 () Unit!2347)

(assert (=> b!30799 (= lt!44938 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1690 lt!44463) (buf!1110 (_2!1690 lt!44934)) lt!44956))))

(assert (=> b!30799 (validate_offset_bits!1 ((_ sign_extend 32) (size!782 (buf!1110 (_2!1690 lt!44934)))) ((_ sign_extend 32) (currentByte!2459 (_2!1690 lt!44463))) ((_ sign_extend 32) (currentBit!2454 (_2!1690 lt!44463))) lt!44956)))

(declare-fun lt!44924 () Unit!2347)

(assert (=> b!30799 (= lt!44924 lt!44938)))

(declare-fun lt!44916 () tuple2!3208)

(assert (=> b!30799 (= lt!44916 (reader!0 (_2!1690 lt!44943) (_2!1690 lt!44934)))))

(declare-fun lt!44920 () (_ BitVec 64))

(assert (=> b!30799 (= lt!44920 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!44939 () Unit!2347)

(assert (=> b!30799 (= lt!44939 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1690 lt!44943) (buf!1110 (_2!1690 lt!44934)) lt!44920))))

(assert (=> b!30799 (validate_offset_bits!1 ((_ sign_extend 32) (size!782 (buf!1110 (_2!1690 lt!44934)))) ((_ sign_extend 32) (currentByte!2459 (_2!1690 lt!44943))) ((_ sign_extend 32) (currentBit!2454 (_2!1690 lt!44943))) lt!44920)))

(declare-fun lt!44929 () Unit!2347)

(assert (=> b!30799 (= lt!44929 lt!44939)))

(declare-fun lt!44926 () List!388)

(assert (=> b!30799 (= lt!44926 (byteArrayBitContentToList!0 (_2!1690 lt!44934) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!44932 () List!388)

(assert (=> b!30799 (= lt!44932 (byteArrayBitContentToList!0 (_2!1690 lt!44934) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!44944 () List!388)

(assert (=> b!30799 (= lt!44944 (bitStreamReadBitsIntoList!0 (_2!1690 lt!44934) (_1!1691 lt!44953) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!44918 () List!388)

(assert (=> b!30799 (= lt!44918 (bitStreamReadBitsIntoList!0 (_2!1690 lt!44934) (_1!1691 lt!44916) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!44935 () (_ BitVec 64))

(assert (=> b!30799 (= lt!44935 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!44948 () Unit!2347)

(assert (=> b!30799 (= lt!44948 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1690 lt!44934) (_2!1690 lt!44934) (_1!1691 lt!44953) (_1!1691 lt!44916) lt!44935 lt!44944))))

(assert (=> b!30799 (= (bitStreamReadBitsIntoList!0 (_2!1690 lt!44934) (_1!1691 lt!44916) (bvsub lt!44935 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!105 lt!44944))))

(declare-fun lt!44922 () Unit!2347)

(assert (=> b!30799 (= lt!44922 lt!44948)))

(declare-fun lt!44959 () Unit!2347)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1789 array!1789 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2347)

(assert (=> b!30799 (= lt!44959 (arrayBitRangesEqImpliesEq!0 (buf!1110 (_2!1690 lt!44943)) (buf!1110 (_2!1690 lt!44934)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!44936 (bitIndex!0 (size!782 (buf!1110 (_2!1690 lt!44943))) (currentByte!2459 (_2!1690 lt!44943)) (currentBit!2454 (_2!1690 lt!44943)))))))

(assert (=> b!30799 (= (bitAt!0 (buf!1110 (_2!1690 lt!44943)) lt!44936) (bitAt!0 (buf!1110 (_2!1690 lt!44934)) lt!44936))))

(declare-fun lt!44942 () Unit!2347)

(assert (=> b!30799 (= lt!44942 lt!44959)))

(declare-fun lt!44954 () tuple2!3208)

(declare-fun b!30800 () Bool)

(assert (=> b!30800 (= e!20481 (= (bitStreamReadBitsIntoList!0 (_2!1690 lt!44930) (_1!1691 lt!44954) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1690 lt!44930) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!30800 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!30800 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!44937 () Unit!2347)

(declare-fun lt!44946 () Unit!2347)

(assert (=> b!30800 (= lt!44937 lt!44946)))

(assert (=> b!30800 (validate_offset_bits!1 ((_ sign_extend 32) (size!782 (buf!1110 (_2!1690 lt!44930)))) ((_ sign_extend 32) (currentByte!2459 (_2!1690 lt!44463))) ((_ sign_extend 32) (currentBit!2454 (_2!1690 lt!44463))) lt!44952)))

(assert (=> b!30800 (= lt!44946 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1690 lt!44463) (buf!1110 (_2!1690 lt!44930)) lt!44952))))

(assert (=> b!30800 e!20483))

(declare-fun res!26437 () Bool)

(assert (=> b!30800 (=> (not res!26437) (not e!20483))))

(assert (=> b!30800 (= res!26437 (and (= (size!782 (buf!1110 (_2!1690 lt!44463))) (size!782 (buf!1110 (_2!1690 lt!44930)))) (bvsge lt!44952 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!30800 (= lt!44952 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!30800 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!30800 (= lt!44954 (reader!0 (_2!1690 lt!44463) (_2!1690 lt!44930)))))

(assert (= (and d!8860 c!2056) b!30799))

(assert (= (and d!8860 (not c!2056)) b!30794))

(assert (= (or b!30799 b!30794) bm!391))

(assert (= (and d!8860 res!26436) b!30795))

(assert (= (and b!30795 res!26434) b!30798))

(assert (= (and b!30798 res!26433) b!30796))

(assert (= (and b!30796 res!26435) b!30797))

(assert (= (and b!30797 res!26432) b!30800))

(assert (= (and b!30800 res!26437) b!30793))

(declare-fun m!45035 () Bool)

(assert (=> b!30799 m!45035))

(declare-fun m!45037 () Bool)

(assert (=> b!30799 m!45037))

(declare-fun m!45039 () Bool)

(assert (=> b!30799 m!45039))

(declare-fun m!45041 () Bool)

(assert (=> b!30799 m!45041))

(declare-fun m!45043 () Bool)

(assert (=> b!30799 m!45043))

(assert (=> b!30799 m!44663))

(declare-fun m!45045 () Bool)

(assert (=> b!30799 m!45045))

(declare-fun m!45047 () Bool)

(assert (=> b!30799 m!45047))

(declare-fun m!45049 () Bool)

(assert (=> b!30799 m!45049))

(declare-fun m!45051 () Bool)

(assert (=> b!30799 m!45051))

(declare-fun m!45053 () Bool)

(assert (=> b!30799 m!45053))

(declare-fun m!45055 () Bool)

(assert (=> b!30799 m!45055))

(declare-fun m!45057 () Bool)

(assert (=> b!30799 m!45057))

(declare-fun m!45059 () Bool)

(assert (=> b!30799 m!45059))

(declare-fun m!45061 () Bool)

(assert (=> b!30799 m!45061))

(declare-fun m!45063 () Bool)

(assert (=> b!30799 m!45063))

(assert (=> b!30799 m!45039))

(declare-fun m!45065 () Bool)

(assert (=> b!30799 m!45065))

(declare-fun m!45067 () Bool)

(assert (=> b!30799 m!45067))

(declare-fun m!45069 () Bool)

(assert (=> b!30799 m!45069))

(declare-fun m!45071 () Bool)

(assert (=> b!30799 m!45071))

(declare-fun m!45073 () Bool)

(assert (=> b!30799 m!45073))

(declare-fun m!45075 () Bool)

(assert (=> b!30799 m!45075))

(declare-fun m!45077 () Bool)

(assert (=> b!30799 m!45077))

(declare-fun m!45079 () Bool)

(assert (=> b!30799 m!45079))

(assert (=> b!30799 m!45075))

(declare-fun m!45081 () Bool)

(assert (=> b!30799 m!45081))

(declare-fun m!45083 () Bool)

(assert (=> b!30799 m!45083))

(declare-fun m!45085 () Bool)

(assert (=> b!30799 m!45085))

(declare-fun m!45087 () Bool)

(assert (=> b!30799 m!45087))

(declare-fun m!45089 () Bool)

(assert (=> b!30799 m!45089))

(declare-fun m!45091 () Bool)

(assert (=> b!30799 m!45091))

(declare-fun m!45093 () Bool)

(assert (=> b!30799 m!45093))

(assert (=> b!30799 m!45035))

(declare-fun m!45095 () Bool)

(assert (=> b!30799 m!45095))

(assert (=> b!30799 m!45065))

(declare-fun m!45097 () Bool)

(assert (=> d!8860 m!45097))

(assert (=> d!8860 m!44663))

(assert (=> d!8860 m!44897))

(assert (=> d!8860 m!44895))

(declare-fun m!45099 () Bool)

(assert (=> b!30800 m!45099))

(declare-fun m!45101 () Bool)

(assert (=> b!30800 m!45101))

(declare-fun m!45103 () Bool)

(assert (=> b!30800 m!45103))

(declare-fun m!45105 () Bool)

(assert (=> b!30800 m!45105))

(declare-fun m!45107 () Bool)

(assert (=> b!30800 m!45107))

(declare-fun m!45109 () Bool)

(assert (=> bm!391 m!45109))

(declare-fun m!45111 () Bool)

(assert (=> b!30794 m!45111))

(declare-fun m!45113 () Bool)

(assert (=> b!30794 m!45113))

(declare-fun m!45115 () Bool)

(assert (=> b!30795 m!45115))

(declare-fun m!45117 () Bool)

(assert (=> b!30796 m!45117))

(declare-fun m!45119 () Bool)

(assert (=> b!30793 m!45119))

(assert (=> b!30562 d!8860))

(declare-fun d!8918 () Bool)

(declare-fun res!26440 () Bool)

(declare-fun e!20484 () Bool)

(assert (=> d!8918 (=> (not res!26440) (not e!20484))))

(assert (=> d!8918 (= res!26440 (= (size!782 (buf!1110 thiss!1379)) (size!782 (buf!1110 (_2!1690 lt!44457)))))))

(assert (=> d!8918 (= (isPrefixOf!0 thiss!1379 (_2!1690 lt!44457)) e!20484)))

(declare-fun b!30801 () Bool)

(declare-fun res!26438 () Bool)

(assert (=> b!30801 (=> (not res!26438) (not e!20484))))

(assert (=> b!30801 (= res!26438 (bvsle (bitIndex!0 (size!782 (buf!1110 thiss!1379)) (currentByte!2459 thiss!1379) (currentBit!2454 thiss!1379)) (bitIndex!0 (size!782 (buf!1110 (_2!1690 lt!44457))) (currentByte!2459 (_2!1690 lt!44457)) (currentBit!2454 (_2!1690 lt!44457)))))))

(declare-fun b!30802 () Bool)

(declare-fun e!20485 () Bool)

(assert (=> b!30802 (= e!20484 e!20485)))

(declare-fun res!26439 () Bool)

(assert (=> b!30802 (=> res!26439 e!20485)))

(assert (=> b!30802 (= res!26439 (= (size!782 (buf!1110 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!30803 () Bool)

(assert (=> b!30803 (= e!20485 (arrayBitRangesEq!0 (buf!1110 thiss!1379) (buf!1110 (_2!1690 lt!44457)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!782 (buf!1110 thiss!1379)) (currentByte!2459 thiss!1379) (currentBit!2454 thiss!1379))))))

(assert (= (and d!8918 res!26440) b!30801))

(assert (= (and b!30801 res!26438) b!30802))

(assert (= (and b!30802 (not res!26439)) b!30803))

(assert (=> b!30801 m!44695))

(assert (=> b!30801 m!44661))

(assert (=> b!30803 m!44695))

(assert (=> b!30803 m!44695))

(declare-fun m!45121 () Bool)

(assert (=> b!30803 m!45121))

(assert (=> b!30562 d!8918))

(declare-fun d!8920 () Bool)

(assert (=> d!8920 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!782 (buf!1110 (_2!1690 lt!44463)))) ((_ sign_extend 32) (currentByte!2459 thiss!1379)) ((_ sign_extend 32) (currentBit!2454 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!782 (buf!1110 (_2!1690 lt!44463)))) ((_ sign_extend 32) (currentByte!2459 thiss!1379)) ((_ sign_extend 32) (currentBit!2454 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2481 () Bool)

(assert (= bs!2481 d!8920))

(declare-fun m!45123 () Bool)

(assert (=> bs!2481 m!45123))

(assert (=> b!30562 d!8920))

(declare-fun d!8922 () Bool)

(assert (=> d!8922 (= (bitAt!0 (buf!1110 (_1!1691 lt!44462)) lt!44468) (not (= (bvand ((_ sign_extend 24) (select (arr!1248 (buf!1110 (_1!1691 lt!44462))) ((_ extract 31 0) (bvsdiv lt!44468 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!44468 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2482 () Bool)

(assert (= bs!2482 d!8922))

(declare-fun m!45125 () Bool)

(assert (=> bs!2482 m!45125))

(declare-fun m!45127 () Bool)

(assert (=> bs!2482 m!45127))

(assert (=> b!30575 d!8922))

(declare-fun d!8924 () Bool)

(assert (=> d!8924 (= (bitAt!0 (buf!1110 (_1!1691 lt!44472)) lt!44468) (not (= (bvand ((_ sign_extend 24) (select (arr!1248 (buf!1110 (_1!1691 lt!44472))) ((_ extract 31 0) (bvsdiv lt!44468 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!44468 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2483 () Bool)

(assert (= bs!2483 d!8924))

(declare-fun m!45129 () Bool)

(assert (=> bs!2483 m!45129))

(assert (=> bs!2483 m!45127))

(assert (=> b!30575 d!8924))

(declare-fun b!30804 () Bool)

(declare-fun res!26441 () Bool)

(declare-fun e!20486 () Bool)

(assert (=> b!30804 (=> (not res!26441) (not e!20486))))

(declare-fun lt!44965 () tuple2!3208)

(assert (=> b!30804 (= res!26441 (isPrefixOf!0 (_2!1691 lt!44965) (_2!1690 lt!44457)))))

(declare-fun b!30805 () Bool)

(declare-fun e!20487 () Unit!2347)

(declare-fun lt!44975 () Unit!2347)

(assert (=> b!30805 (= e!20487 lt!44975)))

(declare-fun lt!44978 () (_ BitVec 64))

(assert (=> b!30805 (= lt!44978 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44979 () (_ BitVec 64))

(assert (=> b!30805 (= lt!44979 (bitIndex!0 (size!782 (buf!1110 thiss!1379)) (currentByte!2459 thiss!1379) (currentBit!2454 thiss!1379)))))

(assert (=> b!30805 (= lt!44975 (arrayBitRangesEqSymmetric!0 (buf!1110 thiss!1379) (buf!1110 (_2!1690 lt!44457)) lt!44978 lt!44979))))

(assert (=> b!30805 (arrayBitRangesEq!0 (buf!1110 (_2!1690 lt!44457)) (buf!1110 thiss!1379) lt!44978 lt!44979)))

(declare-fun lt!44964 () (_ BitVec 64))

(declare-fun b!30806 () Bool)

(declare-fun lt!44968 () (_ BitVec 64))

(assert (=> b!30806 (= e!20486 (= (_1!1691 lt!44965) (withMovedBitIndex!0 (_2!1691 lt!44965) (bvsub lt!44964 lt!44968))))))

(assert (=> b!30806 (or (= (bvand lt!44964 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!44968 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!44964 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!44964 lt!44968) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!30806 (= lt!44968 (bitIndex!0 (size!782 (buf!1110 (_2!1690 lt!44457))) (currentByte!2459 (_2!1690 lt!44457)) (currentBit!2454 (_2!1690 lt!44457))))))

(assert (=> b!30806 (= lt!44964 (bitIndex!0 (size!782 (buf!1110 thiss!1379)) (currentByte!2459 thiss!1379) (currentBit!2454 thiss!1379)))))

(declare-fun d!8926 () Bool)

(assert (=> d!8926 e!20486))

(declare-fun res!26443 () Bool)

(assert (=> d!8926 (=> (not res!26443) (not e!20486))))

(assert (=> d!8926 (= res!26443 (isPrefixOf!0 (_1!1691 lt!44965) (_2!1691 lt!44965)))))

(declare-fun lt!44971 () BitStream!1374)

(assert (=> d!8926 (= lt!44965 (tuple2!3209 lt!44971 (_2!1690 lt!44457)))))

(declare-fun lt!44961 () Unit!2347)

(declare-fun lt!44977 () Unit!2347)

(assert (=> d!8926 (= lt!44961 lt!44977)))

(assert (=> d!8926 (isPrefixOf!0 lt!44971 (_2!1690 lt!44457))))

(assert (=> d!8926 (= lt!44977 (lemmaIsPrefixTransitive!0 lt!44971 (_2!1690 lt!44457) (_2!1690 lt!44457)))))

(declare-fun lt!44962 () Unit!2347)

(declare-fun lt!44973 () Unit!2347)

(assert (=> d!8926 (= lt!44962 lt!44973)))

(assert (=> d!8926 (isPrefixOf!0 lt!44971 (_2!1690 lt!44457))))

(assert (=> d!8926 (= lt!44973 (lemmaIsPrefixTransitive!0 lt!44971 thiss!1379 (_2!1690 lt!44457)))))

(declare-fun lt!44963 () Unit!2347)

(assert (=> d!8926 (= lt!44963 e!20487)))

(declare-fun c!2057 () Bool)

(assert (=> d!8926 (= c!2057 (not (= (size!782 (buf!1110 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!44974 () Unit!2347)

(declare-fun lt!44967 () Unit!2347)

(assert (=> d!8926 (= lt!44974 lt!44967)))

(assert (=> d!8926 (isPrefixOf!0 (_2!1690 lt!44457) (_2!1690 lt!44457))))

(assert (=> d!8926 (= lt!44967 (lemmaIsPrefixRefl!0 (_2!1690 lt!44457)))))

(declare-fun lt!44976 () Unit!2347)

(declare-fun lt!44969 () Unit!2347)

(assert (=> d!8926 (= lt!44976 lt!44969)))

(assert (=> d!8926 (= lt!44969 (lemmaIsPrefixRefl!0 (_2!1690 lt!44457)))))

(declare-fun lt!44960 () Unit!2347)

(declare-fun lt!44970 () Unit!2347)

(assert (=> d!8926 (= lt!44960 lt!44970)))

(assert (=> d!8926 (isPrefixOf!0 lt!44971 lt!44971)))

(assert (=> d!8926 (= lt!44970 (lemmaIsPrefixRefl!0 lt!44971))))

(declare-fun lt!44966 () Unit!2347)

(declare-fun lt!44972 () Unit!2347)

(assert (=> d!8926 (= lt!44966 lt!44972)))

(assert (=> d!8926 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!8926 (= lt!44972 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!8926 (= lt!44971 (BitStream!1375 (buf!1110 (_2!1690 lt!44457)) (currentByte!2459 thiss!1379) (currentBit!2454 thiss!1379)))))

(assert (=> d!8926 (isPrefixOf!0 thiss!1379 (_2!1690 lt!44457))))

(assert (=> d!8926 (= (reader!0 thiss!1379 (_2!1690 lt!44457)) lt!44965)))

(declare-fun b!30807 () Bool)

(declare-fun res!26442 () Bool)

(assert (=> b!30807 (=> (not res!26442) (not e!20486))))

(assert (=> b!30807 (= res!26442 (isPrefixOf!0 (_1!1691 lt!44965) thiss!1379))))

(declare-fun b!30808 () Bool)

(declare-fun Unit!2359 () Unit!2347)

(assert (=> b!30808 (= e!20487 Unit!2359)))

(assert (= (and d!8926 c!2057) b!30805))

(assert (= (and d!8926 (not c!2057)) b!30808))

(assert (= (and d!8926 res!26443) b!30807))

(assert (= (and b!30807 res!26442) b!30804))

(assert (= (and b!30804 res!26441) b!30806))

(declare-fun m!45131 () Bool)

(assert (=> b!30807 m!45131))

(assert (=> b!30805 m!44695))

(declare-fun m!45133 () Bool)

(assert (=> b!30805 m!45133))

(declare-fun m!45135 () Bool)

(assert (=> b!30805 m!45135))

(declare-fun m!45137 () Bool)

(assert (=> b!30806 m!45137))

(assert (=> b!30806 m!44661))

(assert (=> b!30806 m!44695))

(declare-fun m!45139 () Bool)

(assert (=> b!30804 m!45139))

(declare-fun m!45141 () Bool)

(assert (=> d!8926 m!45141))

(assert (=> d!8926 m!44677))

(declare-fun m!45143 () Bool)

(assert (=> d!8926 m!45143))

(assert (=> d!8926 m!44691))

(declare-fun m!45145 () Bool)

(assert (=> d!8926 m!45145))

(declare-fun m!45147 () Bool)

(assert (=> d!8926 m!45147))

(declare-fun m!45149 () Bool)

(assert (=> d!8926 m!45149))

(assert (=> d!8926 m!44693))

(declare-fun m!45151 () Bool)

(assert (=> d!8926 m!45151))

(declare-fun m!45153 () Bool)

(assert (=> d!8926 m!45153))

(declare-fun m!45155 () Bool)

(assert (=> d!8926 m!45155))

(assert (=> b!30564 d!8926))

(declare-fun b!30811 () Bool)

(declare-fun e!20488 () Bool)

(declare-fun lt!44982 () List!388)

(assert (=> b!30811 (= e!20488 (isEmpty!81 lt!44982))))

(declare-fun d!8928 () Bool)

(assert (=> d!8928 e!20488))

(declare-fun c!2059 () Bool)

(assert (=> d!8928 (= c!2059 (= lt!44465 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!20489 () tuple2!3218)

(assert (=> d!8928 (= lt!44982 (_1!1696 e!20489))))

(declare-fun c!2058 () Bool)

(assert (=> d!8928 (= c!2058 (= lt!44465 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8928 (bvsge lt!44465 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8928 (= (bitStreamReadBitsIntoList!0 (_2!1690 lt!44457) (_1!1691 lt!44472) lt!44465) lt!44982)))

(declare-fun lt!44980 () (_ BitVec 64))

(declare-fun lt!44981 () tuple2!3220)

(declare-fun b!30810 () Bool)

(assert (=> b!30810 (= e!20489 (tuple2!3219 (Cons!384 (_1!1697 lt!44981) (bitStreamReadBitsIntoList!0 (_2!1690 lt!44457) (_2!1697 lt!44981) (bvsub lt!44465 lt!44980))) (_2!1697 lt!44981)))))

(assert (=> b!30810 (= lt!44981 (readBit!0 (_1!1691 lt!44472)))))

(assert (=> b!30810 (= lt!44980 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!30809 () Bool)

(assert (=> b!30809 (= e!20489 (tuple2!3219 Nil!385 (_1!1691 lt!44472)))))

(declare-fun b!30812 () Bool)

(assert (=> b!30812 (= e!20488 (> (length!114 lt!44982) 0))))

(assert (= (and d!8928 c!2058) b!30809))

(assert (= (and d!8928 (not c!2058)) b!30810))

(assert (= (and d!8928 c!2059) b!30811))

(assert (= (and d!8928 (not c!2059)) b!30812))

(declare-fun m!45157 () Bool)

(assert (=> b!30811 m!45157))

(declare-fun m!45159 () Bool)

(assert (=> b!30810 m!45159))

(declare-fun m!45161 () Bool)

(assert (=> b!30810 m!45161))

(declare-fun m!45163 () Bool)

(assert (=> b!30812 m!45163))

(assert (=> b!30564 d!8928))

(declare-fun d!8930 () Bool)

(assert (=> d!8930 (validate_offset_bits!1 ((_ sign_extend 32) (size!782 (buf!1110 (_2!1690 lt!44457)))) ((_ sign_extend 32) (currentByte!2459 thiss!1379)) ((_ sign_extend 32) (currentBit!2454 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!44983 () Unit!2347)

(assert (=> d!8930 (= lt!44983 (choose!9 thiss!1379 (buf!1110 (_2!1690 lt!44457)) (bvsub to!314 i!635) (BitStream!1375 (buf!1110 (_2!1690 lt!44457)) (currentByte!2459 thiss!1379) (currentBit!2454 thiss!1379))))))

(assert (=> d!8930 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1110 (_2!1690 lt!44457)) (bvsub to!314 i!635)) lt!44983)))

(declare-fun bs!2484 () Bool)

(assert (= bs!2484 d!8930))

(assert (=> bs!2484 m!44701))

(declare-fun m!45165 () Bool)

(assert (=> bs!2484 m!45165))

(assert (=> b!30564 d!8930))

(declare-fun d!8932 () Bool)

(assert (=> d!8932 (validate_offset_bits!1 ((_ sign_extend 32) (size!782 (buf!1110 (_2!1690 lt!44457)))) ((_ sign_extend 32) (currentByte!2459 (_2!1690 lt!44463))) ((_ sign_extend 32) (currentBit!2454 (_2!1690 lt!44463))) lt!44465)))

(declare-fun lt!44984 () Unit!2347)

(assert (=> d!8932 (= lt!44984 (choose!9 (_2!1690 lt!44463) (buf!1110 (_2!1690 lt!44457)) lt!44465 (BitStream!1375 (buf!1110 (_2!1690 lt!44457)) (currentByte!2459 (_2!1690 lt!44463)) (currentBit!2454 (_2!1690 lt!44463)))))))

(assert (=> d!8932 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1690 lt!44463) (buf!1110 (_2!1690 lt!44457)) lt!44465) lt!44984)))

(declare-fun bs!2485 () Bool)

(assert (= bs!2485 d!8932))

(assert (=> bs!2485 m!44709))

(declare-fun m!45167 () Bool)

(assert (=> bs!2485 m!45167))

(assert (=> b!30564 d!8932))

(declare-fun d!8934 () Bool)

(assert (=> d!8934 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!782 (buf!1110 (_2!1690 lt!44457)))) ((_ sign_extend 32) (currentByte!2459 thiss!1379)) ((_ sign_extend 32) (currentBit!2454 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!782 (buf!1110 (_2!1690 lt!44457)))) ((_ sign_extend 32) (currentByte!2459 thiss!1379)) ((_ sign_extend 32) (currentBit!2454 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2486 () Bool)

(assert (= bs!2486 d!8934))

(declare-fun m!45169 () Bool)

(assert (=> bs!2486 m!45169))

(assert (=> b!30564 d!8934))

(declare-fun b!30815 () Bool)

(declare-fun e!20490 () Bool)

(declare-fun lt!44987 () List!388)

(assert (=> b!30815 (= e!20490 (isEmpty!81 lt!44987))))

(declare-fun d!8936 () Bool)

(assert (=> d!8936 e!20490))

(declare-fun c!2061 () Bool)

(assert (=> d!8936 (= c!2061 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!20491 () tuple2!3218)

(assert (=> d!8936 (= lt!44987 (_1!1696 e!20491))))

(declare-fun c!2060 () Bool)

(assert (=> d!8936 (= c!2060 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8936 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8936 (= (bitStreamReadBitsIntoList!0 (_2!1690 lt!44457) (_1!1691 lt!44462) (bvsub to!314 i!635)) lt!44987)))

(declare-fun lt!44985 () (_ BitVec 64))

(declare-fun lt!44986 () tuple2!3220)

(declare-fun b!30814 () Bool)

(assert (=> b!30814 (= e!20491 (tuple2!3219 (Cons!384 (_1!1697 lt!44986) (bitStreamReadBitsIntoList!0 (_2!1690 lt!44457) (_2!1697 lt!44986) (bvsub (bvsub to!314 i!635) lt!44985))) (_2!1697 lt!44986)))))

(assert (=> b!30814 (= lt!44986 (readBit!0 (_1!1691 lt!44462)))))

(assert (=> b!30814 (= lt!44985 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!30813 () Bool)

(assert (=> b!30813 (= e!20491 (tuple2!3219 Nil!385 (_1!1691 lt!44462)))))

(declare-fun b!30816 () Bool)

(assert (=> b!30816 (= e!20490 (> (length!114 lt!44987) 0))))

(assert (= (and d!8936 c!2060) b!30813))

(assert (= (and d!8936 (not c!2060)) b!30814))

(assert (= (and d!8936 c!2061) b!30815))

(assert (= (and d!8936 (not c!2061)) b!30816))

(declare-fun m!45171 () Bool)

(assert (=> b!30815 m!45171))

(declare-fun m!45173 () Bool)

(assert (=> b!30814 m!45173))

(declare-fun m!45175 () Bool)

(assert (=> b!30814 m!45175))

(declare-fun m!45177 () Bool)

(assert (=> b!30816 m!45177))

(assert (=> b!30564 d!8936))

(declare-fun b!30817 () Bool)

(declare-fun res!26444 () Bool)

(declare-fun e!20492 () Bool)

(assert (=> b!30817 (=> (not res!26444) (not e!20492))))

(declare-fun lt!44993 () tuple2!3208)

(assert (=> b!30817 (= res!26444 (isPrefixOf!0 (_2!1691 lt!44993) (_2!1690 lt!44457)))))

(declare-fun b!30818 () Bool)

(declare-fun e!20493 () Unit!2347)

(declare-fun lt!45003 () Unit!2347)

(assert (=> b!30818 (= e!20493 lt!45003)))

(declare-fun lt!45006 () (_ BitVec 64))

(assert (=> b!30818 (= lt!45006 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!45007 () (_ BitVec 64))

(assert (=> b!30818 (= lt!45007 (bitIndex!0 (size!782 (buf!1110 (_2!1690 lt!44463))) (currentByte!2459 (_2!1690 lt!44463)) (currentBit!2454 (_2!1690 lt!44463))))))

(assert (=> b!30818 (= lt!45003 (arrayBitRangesEqSymmetric!0 (buf!1110 (_2!1690 lt!44463)) (buf!1110 (_2!1690 lt!44457)) lt!45006 lt!45007))))

(assert (=> b!30818 (arrayBitRangesEq!0 (buf!1110 (_2!1690 lt!44457)) (buf!1110 (_2!1690 lt!44463)) lt!45006 lt!45007)))

(declare-fun lt!44992 () (_ BitVec 64))

(declare-fun b!30819 () Bool)

(declare-fun lt!44996 () (_ BitVec 64))

(assert (=> b!30819 (= e!20492 (= (_1!1691 lt!44993) (withMovedBitIndex!0 (_2!1691 lt!44993) (bvsub lt!44992 lt!44996))))))

(assert (=> b!30819 (or (= (bvand lt!44992 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!44996 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!44992 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!44992 lt!44996) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!30819 (= lt!44996 (bitIndex!0 (size!782 (buf!1110 (_2!1690 lt!44457))) (currentByte!2459 (_2!1690 lt!44457)) (currentBit!2454 (_2!1690 lt!44457))))))

(assert (=> b!30819 (= lt!44992 (bitIndex!0 (size!782 (buf!1110 (_2!1690 lt!44463))) (currentByte!2459 (_2!1690 lt!44463)) (currentBit!2454 (_2!1690 lt!44463))))))

(declare-fun d!8938 () Bool)

(assert (=> d!8938 e!20492))

(declare-fun res!26446 () Bool)

(assert (=> d!8938 (=> (not res!26446) (not e!20492))))

(assert (=> d!8938 (= res!26446 (isPrefixOf!0 (_1!1691 lt!44993) (_2!1691 lt!44993)))))

(declare-fun lt!44999 () BitStream!1374)

(assert (=> d!8938 (= lt!44993 (tuple2!3209 lt!44999 (_2!1690 lt!44457)))))

(declare-fun lt!44989 () Unit!2347)

(declare-fun lt!45005 () Unit!2347)

(assert (=> d!8938 (= lt!44989 lt!45005)))

(assert (=> d!8938 (isPrefixOf!0 lt!44999 (_2!1690 lt!44457))))

(assert (=> d!8938 (= lt!45005 (lemmaIsPrefixTransitive!0 lt!44999 (_2!1690 lt!44457) (_2!1690 lt!44457)))))

(declare-fun lt!44990 () Unit!2347)

(declare-fun lt!45001 () Unit!2347)

(assert (=> d!8938 (= lt!44990 lt!45001)))

(assert (=> d!8938 (isPrefixOf!0 lt!44999 (_2!1690 lt!44457))))

(assert (=> d!8938 (= lt!45001 (lemmaIsPrefixTransitive!0 lt!44999 (_2!1690 lt!44463) (_2!1690 lt!44457)))))

(declare-fun lt!44991 () Unit!2347)

(assert (=> d!8938 (= lt!44991 e!20493)))

(declare-fun c!2062 () Bool)

(assert (=> d!8938 (= c!2062 (not (= (size!782 (buf!1110 (_2!1690 lt!44463))) #b00000000000000000000000000000000)))))

(declare-fun lt!45002 () Unit!2347)

(declare-fun lt!44995 () Unit!2347)

(assert (=> d!8938 (= lt!45002 lt!44995)))

(assert (=> d!8938 (isPrefixOf!0 (_2!1690 lt!44457) (_2!1690 lt!44457))))

(assert (=> d!8938 (= lt!44995 (lemmaIsPrefixRefl!0 (_2!1690 lt!44457)))))

(declare-fun lt!45004 () Unit!2347)

(declare-fun lt!44997 () Unit!2347)

(assert (=> d!8938 (= lt!45004 lt!44997)))

(assert (=> d!8938 (= lt!44997 (lemmaIsPrefixRefl!0 (_2!1690 lt!44457)))))

(declare-fun lt!44988 () Unit!2347)

(declare-fun lt!44998 () Unit!2347)

(assert (=> d!8938 (= lt!44988 lt!44998)))

(assert (=> d!8938 (isPrefixOf!0 lt!44999 lt!44999)))

(assert (=> d!8938 (= lt!44998 (lemmaIsPrefixRefl!0 lt!44999))))

(declare-fun lt!44994 () Unit!2347)

(declare-fun lt!45000 () Unit!2347)

(assert (=> d!8938 (= lt!44994 lt!45000)))

(assert (=> d!8938 (isPrefixOf!0 (_2!1690 lt!44463) (_2!1690 lt!44463))))

(assert (=> d!8938 (= lt!45000 (lemmaIsPrefixRefl!0 (_2!1690 lt!44463)))))

(assert (=> d!8938 (= lt!44999 (BitStream!1375 (buf!1110 (_2!1690 lt!44457)) (currentByte!2459 (_2!1690 lt!44463)) (currentBit!2454 (_2!1690 lt!44463))))))

(assert (=> d!8938 (isPrefixOf!0 (_2!1690 lt!44463) (_2!1690 lt!44457))))

(assert (=> d!8938 (= (reader!0 (_2!1690 lt!44463) (_2!1690 lt!44457)) lt!44993)))

(declare-fun b!30820 () Bool)

(declare-fun res!26445 () Bool)

(assert (=> b!30820 (=> (not res!26445) (not e!20492))))

(assert (=> b!30820 (= res!26445 (isPrefixOf!0 (_1!1691 lt!44993) (_2!1690 lt!44463)))))

(declare-fun b!30821 () Bool)

(declare-fun Unit!2360 () Unit!2347)

(assert (=> b!30821 (= e!20493 Unit!2360)))

(assert (= (and d!8938 c!2062) b!30818))

(assert (= (and d!8938 (not c!2062)) b!30821))

(assert (= (and d!8938 res!26446) b!30820))

(assert (= (and b!30820 res!26445) b!30817))

(assert (= (and b!30817 res!26444) b!30819))

(declare-fun m!45179 () Bool)

(assert (=> b!30820 m!45179))

(assert (=> b!30818 m!44663))

(declare-fun m!45181 () Bool)

(assert (=> b!30818 m!45181))

(declare-fun m!45183 () Bool)

(assert (=> b!30818 m!45183))

(declare-fun m!45185 () Bool)

(assert (=> b!30819 m!45185))

(assert (=> b!30819 m!44661))

(assert (=> b!30819 m!44663))

(declare-fun m!45187 () Bool)

(assert (=> b!30817 m!45187))

(declare-fun m!45189 () Bool)

(assert (=> d!8938 m!45189))

(assert (=> d!8938 m!44671))

(declare-fun m!45191 () Bool)

(assert (=> d!8938 m!45191))

(assert (=> d!8938 m!44897))

(assert (=> d!8938 m!45145))

(assert (=> d!8938 m!45147))

(declare-fun m!45193 () Bool)

(assert (=> d!8938 m!45193))

(assert (=> d!8938 m!44895))

(declare-fun m!45195 () Bool)

(assert (=> d!8938 m!45195))

(declare-fun m!45197 () Bool)

(assert (=> d!8938 m!45197))

(declare-fun m!45199 () Bool)

(assert (=> d!8938 m!45199))

(assert (=> b!30564 d!8938))

(declare-fun d!8940 () Bool)

(assert (=> d!8940 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!782 (buf!1110 (_2!1690 lt!44457)))) ((_ sign_extend 32) (currentByte!2459 (_2!1690 lt!44463))) ((_ sign_extend 32) (currentBit!2454 (_2!1690 lt!44463))) lt!44465) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!782 (buf!1110 (_2!1690 lt!44457)))) ((_ sign_extend 32) (currentByte!2459 (_2!1690 lt!44463))) ((_ sign_extend 32) (currentBit!2454 (_2!1690 lt!44463)))) lt!44465))))

(declare-fun bs!2487 () Bool)

(assert (= bs!2487 d!8940))

(declare-fun m!45201 () Bool)

(assert (=> bs!2487 m!45201))

(assert (=> b!30564 d!8940))

(declare-fun d!8942 () Bool)

(declare-fun res!26449 () Bool)

(declare-fun e!20494 () Bool)

(assert (=> d!8942 (=> (not res!26449) (not e!20494))))

(assert (=> d!8942 (= res!26449 (= (size!782 (buf!1110 thiss!1379)) (size!782 (buf!1110 thiss!1379))))))

(assert (=> d!8942 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!20494)))

(declare-fun b!30822 () Bool)

(declare-fun res!26447 () Bool)

(assert (=> b!30822 (=> (not res!26447) (not e!20494))))

(assert (=> b!30822 (= res!26447 (bvsle (bitIndex!0 (size!782 (buf!1110 thiss!1379)) (currentByte!2459 thiss!1379) (currentBit!2454 thiss!1379)) (bitIndex!0 (size!782 (buf!1110 thiss!1379)) (currentByte!2459 thiss!1379) (currentBit!2454 thiss!1379))))))

(declare-fun b!30823 () Bool)

(declare-fun e!20495 () Bool)

(assert (=> b!30823 (= e!20494 e!20495)))

(declare-fun res!26448 () Bool)

(assert (=> b!30823 (=> res!26448 e!20495)))

(assert (=> b!30823 (= res!26448 (= (size!782 (buf!1110 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!30824 () Bool)

(assert (=> b!30824 (= e!20495 (arrayBitRangesEq!0 (buf!1110 thiss!1379) (buf!1110 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!782 (buf!1110 thiss!1379)) (currentByte!2459 thiss!1379) (currentBit!2454 thiss!1379))))))

(assert (= (and d!8942 res!26449) b!30822))

(assert (= (and b!30822 res!26447) b!30823))

(assert (= (and b!30823 (not res!26448)) b!30824))

(assert (=> b!30822 m!44695))

(assert (=> b!30822 m!44695))

(assert (=> b!30824 m!44695))

(assert (=> b!30824 m!44695))

(declare-fun m!45203 () Bool)

(assert (=> b!30824 m!45203))

(assert (=> b!30574 d!8942))

(declare-fun d!8944 () Bool)

(assert (=> d!8944 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!45010 () Unit!2347)

(declare-fun choose!11 (BitStream!1374) Unit!2347)

(assert (=> d!8944 (= lt!45010 (choose!11 thiss!1379))))

(assert (=> d!8944 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!45010)))

(declare-fun bs!2489 () Bool)

(assert (= bs!2489 d!8944))

(assert (=> bs!2489 m!44691))

(declare-fun m!45205 () Bool)

(assert (=> bs!2489 m!45205))

(assert (=> b!30574 d!8944))

(declare-fun d!8946 () Bool)

(declare-fun e!20496 () Bool)

(assert (=> d!8946 e!20496))

(declare-fun res!26451 () Bool)

(assert (=> d!8946 (=> (not res!26451) (not e!20496))))

(declare-fun lt!45013 () (_ BitVec 64))

(declare-fun lt!45014 () (_ BitVec 64))

(declare-fun lt!45016 () (_ BitVec 64))

(assert (=> d!8946 (= res!26451 (= lt!45014 (bvsub lt!45013 lt!45016)))))

(assert (=> d!8946 (or (= (bvand lt!45013 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!45016 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!45013 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!45013 lt!45016) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!8946 (= lt!45016 (remainingBits!0 ((_ sign_extend 32) (size!782 (buf!1110 thiss!1379))) ((_ sign_extend 32) (currentByte!2459 thiss!1379)) ((_ sign_extend 32) (currentBit!2454 thiss!1379))))))

(declare-fun lt!45011 () (_ BitVec 64))

(declare-fun lt!45012 () (_ BitVec 64))

(assert (=> d!8946 (= lt!45013 (bvmul lt!45011 lt!45012))))

(assert (=> d!8946 (or (= lt!45011 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!45012 (bvsdiv (bvmul lt!45011 lt!45012) lt!45011)))))

(assert (=> d!8946 (= lt!45012 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!8946 (= lt!45011 ((_ sign_extend 32) (size!782 (buf!1110 thiss!1379))))))

(assert (=> d!8946 (= lt!45014 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2459 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2454 thiss!1379))))))

(assert (=> d!8946 (invariant!0 (currentBit!2454 thiss!1379) (currentByte!2459 thiss!1379) (size!782 (buf!1110 thiss!1379)))))

(assert (=> d!8946 (= (bitIndex!0 (size!782 (buf!1110 thiss!1379)) (currentByte!2459 thiss!1379) (currentBit!2454 thiss!1379)) lt!45014)))

(declare-fun b!30825 () Bool)

(declare-fun res!26450 () Bool)

(assert (=> b!30825 (=> (not res!26450) (not e!20496))))

(assert (=> b!30825 (= res!26450 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!45014))))

(declare-fun b!30826 () Bool)

(declare-fun lt!45015 () (_ BitVec 64))

(assert (=> b!30826 (= e!20496 (bvsle lt!45014 (bvmul lt!45015 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!30826 (or (= lt!45015 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!45015 #b0000000000000000000000000000000000000000000000000000000000001000) lt!45015)))))

(assert (=> b!30826 (= lt!45015 ((_ sign_extend 32) (size!782 (buf!1110 thiss!1379))))))

(assert (= (and d!8946 res!26451) b!30825))

(assert (= (and b!30825 res!26450) b!30826))

(assert (=> d!8946 m!44857))

(assert (=> d!8946 m!44859))

(assert (=> b!30574 d!8946))

(check-sat (not d!8938) (not d!8836) (not b!30824) (not b!30822) (not b!30649) (not b!30818) (not b!30812) (not d!8860) (not b!30679) (not b!30673) (not b!30685) (not b!30674) (not b!30820) (not b!30669) (not b!30810) (not b!30816) (not b!30819) (not b!30800) (not b!30672) (not b!30799) (not b!30796) (not d!8852) (not b!30815) (not b!30711) (not d!8930) (not b!30714) (not d!8932) (not b!30806) (not d!8816) (not b!30713) (not b!30811) (not b!30697) (not d!8828) (not b!30668) (not b!30801) (not b!30667) (not bm!391) (not b!30794) (not d!8822) (not b!30671) (not d!8946) (not d!8856) (not b!30696) (not b!30670) (not d!8832) (not b!30793) (not b!30644) (not d!8820) (not b!30817) (not b!30795) (not d!8826) (not b!30804) (not b!30814) (not d!8824) (not d!8944) (not d!8858) (not b!30712) (not d!8926) (not b!30695) (not b!30805) (not d!8812) (not b!30803) (not d!8934) (not d!8920) (not b!30646) (not b!30700) (not b!30698) (not b!30807) (not d!8940))
(check-sat)
