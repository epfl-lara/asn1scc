; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7340 () Bool)

(assert start!7340)

(declare-fun b!35717 () Bool)

(declare-fun res!30462 () Bool)

(declare-fun e!23596 () Bool)

(assert (=> b!35717 (=> res!30462 e!23596)))

(declare-datatypes ((List!438 0))(
  ( (Nil!435) (Cons!434 (h!553 Bool) (t!1188 List!438)) )
))
(declare-fun lt!53377 () List!438)

(declare-fun lt!53363 () Bool)

(declare-fun head!275 (List!438) Bool)

(assert (=> b!35717 (= res!30462 (not (= (head!275 lt!53377) lt!53363)))))

(declare-fun b!35718 () Bool)

(declare-fun e!23592 () Bool)

(declare-fun e!23597 () Bool)

(assert (=> b!35718 (= e!23592 (not e!23597))))

(declare-fun res!30463 () Bool)

(assert (=> b!35718 (=> res!30463 e!23597)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!35718 (= res!30463 (bvsge i!635 to!314))))

(declare-datatypes ((array!1907 0))(
  ( (array!1908 (arr!1334 (Array (_ BitVec 32) (_ BitVec 8))) (size!850 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1474 0))(
  ( (BitStream!1475 (buf!1178 array!1907) (currentByte!2563 (_ BitVec 32)) (currentBit!2558 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1474)

(declare-fun isPrefixOf!0 (BitStream!1474 BitStream!1474) Bool)

(assert (=> b!35718 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2627 0))(
  ( (Unit!2628) )
))
(declare-fun lt!53360 () Unit!2627)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1474) Unit!2627)

(assert (=> b!35718 (= lt!53360 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!53383 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!35718 (= lt!53383 (bitIndex!0 (size!850 (buf!1178 thiss!1379)) (currentByte!2563 thiss!1379) (currentBit!2558 thiss!1379)))))

(declare-fun b!35720 () Bool)

(declare-fun res!30470 () Bool)

(declare-fun e!23600 () Bool)

(assert (=> b!35720 (=> res!30470 e!23600)))

(declare-fun length!164 (List!438) Int)

(assert (=> b!35720 (= res!30470 (<= (length!164 lt!53377) 0))))

(declare-fun b!35721 () Bool)

(declare-fun e!23588 () Bool)

(declare-fun e!23590 () Bool)

(assert (=> b!35721 (= e!23588 e!23590)))

(declare-fun res!30466 () Bool)

(assert (=> b!35721 (=> res!30466 e!23590)))

(declare-datatypes ((tuple2!3550 0))(
  ( (tuple2!3551 (_1!1862 Unit!2627) (_2!1862 BitStream!1474)) )
))
(declare-fun lt!53368 () tuple2!3550)

(declare-fun lt!53369 () tuple2!3550)

(assert (=> b!35721 (= res!30466 (not (= (size!850 (buf!1178 (_2!1862 lt!53368))) (size!850 (buf!1178 (_2!1862 lt!53369))))))))

(declare-fun lt!53376 () (_ BitVec 64))

(declare-fun lt!53380 () (_ BitVec 64))

(assert (=> b!35721 (= lt!53380 (bvsub (bvsub (bvadd lt!53376 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!35721 (= lt!53376 (bitIndex!0 (size!850 (buf!1178 (_2!1862 lt!53368))) (currentByte!2563 (_2!1862 lt!53368)) (currentBit!2558 (_2!1862 lt!53368))))))

(assert (=> b!35721 (= (size!850 (buf!1178 (_2!1862 lt!53369))) (size!850 (buf!1178 thiss!1379)))))

(declare-fun b!35722 () Bool)

(declare-fun e!23598 () Bool)

(assert (=> b!35722 (= e!23598 e!23596)))

(declare-fun res!30475 () Bool)

(assert (=> b!35722 (=> res!30475 e!23596)))

(declare-datatypes ((tuple2!3552 0))(
  ( (tuple2!3553 (_1!1863 BitStream!1474) (_2!1863 BitStream!1474)) )
))
(declare-fun lt!53370 () tuple2!3552)

(declare-fun bitAt!0 (array!1907 (_ BitVec 64)) Bool)

(assert (=> b!35722 (= res!30475 (not (= lt!53363 (bitAt!0 (buf!1178 (_1!1863 lt!53370)) lt!53383))))))

(declare-fun lt!53362 () tuple2!3552)

(assert (=> b!35722 (= lt!53363 (bitAt!0 (buf!1178 (_1!1863 lt!53362)) lt!53383))))

(declare-fun b!35723 () Bool)

(assert (=> b!35723 (= e!23600 e!23598)))

(declare-fun res!30472 () Bool)

(assert (=> b!35723 (=> res!30472 e!23598)))

(declare-fun lt!53373 () List!438)

(declare-fun lt!53379 () List!438)

(assert (=> b!35723 (= res!30472 (not (= lt!53373 lt!53379)))))

(assert (=> b!35723 (= lt!53379 lt!53373)))

(declare-fun tail!155 (List!438) List!438)

(assert (=> b!35723 (= lt!53373 (tail!155 lt!53377))))

(declare-fun lt!53364 () Unit!2627)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1474 BitStream!1474 BitStream!1474 BitStream!1474 (_ BitVec 64) List!438) Unit!2627)

(assert (=> b!35723 (= lt!53364 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1862 lt!53369) (_2!1862 lt!53369) (_1!1863 lt!53362) (_1!1863 lt!53370) (bvsub to!314 i!635) lt!53377))))

(declare-fun b!35724 () Bool)

(declare-fun e!23591 () Bool)

(assert (=> b!35724 (= e!23597 e!23591)))

(declare-fun res!30471 () Bool)

(assert (=> b!35724 (=> res!30471 e!23591)))

(assert (=> b!35724 (= res!30471 (not (isPrefixOf!0 thiss!1379 (_2!1862 lt!53368))))))

(declare-fun lt!53365 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!35724 (validate_offset_bits!1 ((_ sign_extend 32) (size!850 (buf!1178 (_2!1862 lt!53368)))) ((_ sign_extend 32) (currentByte!2563 (_2!1862 lt!53368))) ((_ sign_extend 32) (currentBit!2558 (_2!1862 lt!53368))) lt!53365)))

(assert (=> b!35724 (= lt!53365 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!53371 () Unit!2627)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1474 BitStream!1474 (_ BitVec 64) (_ BitVec 64)) Unit!2627)

(assert (=> b!35724 (= lt!53371 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1862 lt!53368) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1907)

(declare-fun appendBitFromByte!0 (BitStream!1474 (_ BitVec 8) (_ BitVec 32)) tuple2!3550)

(assert (=> b!35724 (= lt!53368 (appendBitFromByte!0 thiss!1379 (select (arr!1334 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!35725 () Bool)

(declare-fun e!23602 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!35725 (= e!23602 (validate_offset_bit!0 ((_ sign_extend 32) (size!850 (buf!1178 (_1!1863 lt!53362)))) ((_ sign_extend 32) (currentByte!2563 (_1!1863 lt!53362))) ((_ sign_extend 32) (currentBit!2558 (_1!1863 lt!53362)))))))

(declare-fun b!35726 () Bool)

(declare-fun e!23589 () Bool)

(declare-fun e!23594 () Bool)

(assert (=> b!35726 (= e!23589 e!23594)))

(declare-fun res!30473 () Bool)

(assert (=> b!35726 (=> res!30473 e!23594)))

(declare-fun lt!53382 () Bool)

(declare-fun lt!53367 () Bool)

(assert (=> b!35726 (= res!30473 (not (= lt!53382 lt!53367)))))

(assert (=> b!35726 (= lt!53382 (bitAt!0 (buf!1178 (_2!1862 lt!53368)) lt!53383))))

(declare-fun b!35727 () Bool)

(declare-fun res!30478 () Bool)

(assert (=> b!35727 (=> (not res!30478) (not e!23592))))

(assert (=> b!35727 (= res!30478 (validate_offset_bits!1 ((_ sign_extend 32) (size!850 (buf!1178 thiss!1379))) ((_ sign_extend 32) (currentByte!2563 thiss!1379)) ((_ sign_extend 32) (currentBit!2558 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!30476 () Bool)

(assert (=> start!7340 (=> (not res!30476) (not e!23592))))

(assert (=> start!7340 (= res!30476 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!850 srcBuffer!2))))))))

(assert (=> start!7340 e!23592))

(assert (=> start!7340 true))

(declare-fun array_inv!790 (array!1907) Bool)

(assert (=> start!7340 (array_inv!790 srcBuffer!2)))

(declare-fun e!23587 () Bool)

(declare-fun inv!12 (BitStream!1474) Bool)

(assert (=> start!7340 (and (inv!12 thiss!1379) e!23587)))

(declare-fun b!35719 () Bool)

(assert (=> b!35719 (= e!23590 e!23600)))

(declare-fun res!30474 () Bool)

(assert (=> b!35719 (=> res!30474 e!23600)))

(assert (=> b!35719 (= res!30474 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1474 BitStream!1474 (_ BitVec 64)) List!438)

(assert (=> b!35719 (= lt!53379 (bitStreamReadBitsIntoList!0 (_2!1862 lt!53369) (_1!1863 lt!53370) lt!53365))))

(assert (=> b!35719 (= lt!53377 (bitStreamReadBitsIntoList!0 (_2!1862 lt!53369) (_1!1863 lt!53362) (bvsub to!314 i!635)))))

(assert (=> b!35719 (validate_offset_bits!1 ((_ sign_extend 32) (size!850 (buf!1178 (_2!1862 lt!53369)))) ((_ sign_extend 32) (currentByte!2563 (_2!1862 lt!53368))) ((_ sign_extend 32) (currentBit!2558 (_2!1862 lt!53368))) lt!53365)))

(declare-fun lt!53378 () Unit!2627)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1474 array!1907 (_ BitVec 64)) Unit!2627)

(assert (=> b!35719 (= lt!53378 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1862 lt!53368) (buf!1178 (_2!1862 lt!53369)) lt!53365))))

(declare-fun reader!0 (BitStream!1474 BitStream!1474) tuple2!3552)

(assert (=> b!35719 (= lt!53370 (reader!0 (_2!1862 lt!53368) (_2!1862 lt!53369)))))

(assert (=> b!35719 (validate_offset_bits!1 ((_ sign_extend 32) (size!850 (buf!1178 (_2!1862 lt!53369)))) ((_ sign_extend 32) (currentByte!2563 thiss!1379)) ((_ sign_extend 32) (currentBit!2558 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!53372 () Unit!2627)

(assert (=> b!35719 (= lt!53372 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1178 (_2!1862 lt!53369)) (bvsub to!314 i!635)))))

(assert (=> b!35719 (= lt!53362 (reader!0 thiss!1379 (_2!1862 lt!53369)))))

(declare-fun b!35728 () Bool)

(declare-fun e!23599 () Bool)

(assert (=> b!35728 (= e!23591 e!23599)))

(declare-fun res!30480 () Bool)

(assert (=> b!35728 (=> res!30480 e!23599)))

(assert (=> b!35728 (= res!30480 (not (isPrefixOf!0 (_2!1862 lt!53368) (_2!1862 lt!53369))))))

(assert (=> b!35728 (isPrefixOf!0 thiss!1379 (_2!1862 lt!53369))))

(declare-fun lt!53374 () Unit!2627)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1474 BitStream!1474 BitStream!1474) Unit!2627)

(assert (=> b!35728 (= lt!53374 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1862 lt!53368) (_2!1862 lt!53369)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1474 array!1907 (_ BitVec 64) (_ BitVec 64)) tuple2!3550)

(assert (=> b!35728 (= lt!53369 (appendBitsMSBFirstLoop!0 (_2!1862 lt!53368) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!23595 () Bool)

(assert (=> b!35728 e!23595))

(declare-fun res!30469 () Bool)

(assert (=> b!35728 (=> (not res!30469) (not e!23595))))

(assert (=> b!35728 (= res!30469 (validate_offset_bits!1 ((_ sign_extend 32) (size!850 (buf!1178 (_2!1862 lt!53368)))) ((_ sign_extend 32) (currentByte!2563 thiss!1379)) ((_ sign_extend 32) (currentBit!2558 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!53375 () Unit!2627)

(assert (=> b!35728 (= lt!53375 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1178 (_2!1862 lt!53368)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!53366 () tuple2!3552)

(assert (=> b!35728 (= lt!53366 (reader!0 thiss!1379 (_2!1862 lt!53368)))))

(declare-fun b!35729 () Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1474 array!1907 (_ BitVec 64) (_ BitVec 64)) List!438)

(assert (=> b!35729 (= e!23595 (= (head!275 (byteArrayBitContentToList!0 (_2!1862 lt!53368) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!275 (bitStreamReadBitsIntoList!0 (_2!1862 lt!53368) (_1!1863 lt!53366) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!35730 () Bool)

(declare-fun res!30479 () Bool)

(assert (=> b!35730 (=> res!30479 e!23590)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!35730 (= res!30479 (not (invariant!0 (currentBit!2558 (_2!1862 lt!53368)) (currentByte!2563 (_2!1862 lt!53368)) (size!850 (buf!1178 (_2!1862 lt!53368))))))))

(declare-fun b!35731 () Bool)

(assert (=> b!35731 (= e!23599 e!23588)))

(declare-fun res!30464 () Bool)

(assert (=> b!35731 (=> res!30464 e!23588)))

(assert (=> b!35731 (= res!30464 (not (= lt!53380 (bvsub (bvadd lt!53383 to!314) i!635))))))

(assert (=> b!35731 (= lt!53380 (bitIndex!0 (size!850 (buf!1178 (_2!1862 lt!53369))) (currentByte!2563 (_2!1862 lt!53369)) (currentBit!2558 (_2!1862 lt!53369))))))

(declare-fun b!35732 () Bool)

(assert (=> b!35732 (= e!23587 (array_inv!790 (buf!1178 thiss!1379)))))

(declare-fun b!35733 () Bool)

(assert (=> b!35733 (= e!23596 e!23589)))

(declare-fun res!30461 () Bool)

(assert (=> b!35733 (=> res!30461 e!23589)))

(assert (=> b!35733 (= res!30461 (not (= (head!275 (byteArrayBitContentToList!0 (_2!1862 lt!53369) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!53367)))))

(assert (=> b!35733 (= lt!53367 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!35734 () Bool)

(declare-fun res!30465 () Bool)

(assert (=> b!35734 (=> res!30465 e!23590)))

(assert (=> b!35734 (= res!30465 (not (invariant!0 (currentBit!2558 (_2!1862 lt!53368)) (currentByte!2563 (_2!1862 lt!53368)) (size!850 (buf!1178 (_2!1862 lt!53369))))))))

(declare-fun b!35735 () Bool)

(declare-fun res!30468 () Bool)

(assert (=> b!35735 (=> res!30468 e!23588)))

(assert (=> b!35735 (= res!30468 (not (= (size!850 (buf!1178 thiss!1379)) (size!850 (buf!1178 (_2!1862 lt!53369))))))))

(declare-fun b!35736 () Bool)

(declare-fun res!30477 () Bool)

(assert (=> b!35736 (=> res!30477 e!23588)))

(assert (=> b!35736 (= res!30477 (not (invariant!0 (currentBit!2558 (_2!1862 lt!53369)) (currentByte!2563 (_2!1862 lt!53369)) (size!850 (buf!1178 (_2!1862 lt!53369))))))))

(declare-fun b!35737 () Bool)

(assert (=> b!35737 (= e!23594 e!23602)))

(declare-fun res!30467 () Bool)

(assert (=> b!35737 (=> res!30467 e!23602)))

(declare-fun lt!53361 () Bool)

(assert (=> b!35737 (= res!30467 (not (= lt!53361 lt!53367)))))

(assert (=> b!35737 (= lt!53382 lt!53361)))

(assert (=> b!35737 (= lt!53361 (bitAt!0 (buf!1178 (_2!1862 lt!53369)) lt!53383))))

(declare-fun lt!53381 () Unit!2627)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1907 array!1907 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2627)

(assert (=> b!35737 (= lt!53381 (arrayBitRangesEqImpliesEq!0 (buf!1178 (_2!1862 lt!53368)) (buf!1178 (_2!1862 lt!53369)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!53383 lt!53376))))

(assert (= (and start!7340 res!30476) b!35727))

(assert (= (and b!35727 res!30478) b!35718))

(assert (= (and b!35718 (not res!30463)) b!35724))

(assert (= (and b!35724 (not res!30471)) b!35728))

(assert (= (and b!35728 res!30469) b!35729))

(assert (= (and b!35728 (not res!30480)) b!35731))

(assert (= (and b!35731 (not res!30464)) b!35736))

(assert (= (and b!35736 (not res!30477)) b!35735))

(assert (= (and b!35735 (not res!30468)) b!35721))

(assert (= (and b!35721 (not res!30466)) b!35730))

(assert (= (and b!35730 (not res!30479)) b!35734))

(assert (= (and b!35734 (not res!30465)) b!35719))

(assert (= (and b!35719 (not res!30474)) b!35720))

(assert (= (and b!35720 (not res!30470)) b!35723))

(assert (= (and b!35723 (not res!30472)) b!35722))

(assert (= (and b!35722 (not res!30475)) b!35717))

(assert (= (and b!35717 (not res!30462)) b!35733))

(assert (= (and b!35733 (not res!30461)) b!35726))

(assert (= (and b!35726 (not res!30473)) b!35737))

(assert (= (and b!35737 (not res!30467)) b!35725))

(assert (= start!7340 b!35732))

(declare-fun m!53691 () Bool)

(assert (=> b!35725 m!53691))

(declare-fun m!53693 () Bool)

(assert (=> b!35719 m!53693))

(declare-fun m!53695 () Bool)

(assert (=> b!35719 m!53695))

(declare-fun m!53697 () Bool)

(assert (=> b!35719 m!53697))

(declare-fun m!53699 () Bool)

(assert (=> b!35719 m!53699))

(declare-fun m!53701 () Bool)

(assert (=> b!35719 m!53701))

(declare-fun m!53703 () Bool)

(assert (=> b!35719 m!53703))

(declare-fun m!53705 () Bool)

(assert (=> b!35719 m!53705))

(declare-fun m!53707 () Bool)

(assert (=> b!35719 m!53707))

(declare-fun m!53709 () Bool)

(assert (=> b!35734 m!53709))

(declare-fun m!53711 () Bool)

(assert (=> b!35730 m!53711))

(declare-fun m!53713 () Bool)

(assert (=> start!7340 m!53713))

(declare-fun m!53715 () Bool)

(assert (=> start!7340 m!53715))

(declare-fun m!53717 () Bool)

(assert (=> b!35718 m!53717))

(declare-fun m!53719 () Bool)

(assert (=> b!35718 m!53719))

(declare-fun m!53721 () Bool)

(assert (=> b!35718 m!53721))

(declare-fun m!53723 () Bool)

(assert (=> b!35722 m!53723))

(declare-fun m!53725 () Bool)

(assert (=> b!35722 m!53725))

(declare-fun m!53727 () Bool)

(assert (=> b!35728 m!53727))

(declare-fun m!53729 () Bool)

(assert (=> b!35728 m!53729))

(declare-fun m!53731 () Bool)

(assert (=> b!35728 m!53731))

(declare-fun m!53733 () Bool)

(assert (=> b!35728 m!53733))

(declare-fun m!53735 () Bool)

(assert (=> b!35728 m!53735))

(declare-fun m!53737 () Bool)

(assert (=> b!35728 m!53737))

(declare-fun m!53739 () Bool)

(assert (=> b!35728 m!53739))

(declare-fun m!53741 () Bool)

(assert (=> b!35733 m!53741))

(assert (=> b!35733 m!53741))

(declare-fun m!53743 () Bool)

(assert (=> b!35733 m!53743))

(declare-fun m!53745 () Bool)

(assert (=> b!35733 m!53745))

(declare-fun m!53747 () Bool)

(assert (=> b!35723 m!53747))

(declare-fun m!53749 () Bool)

(assert (=> b!35723 m!53749))

(declare-fun m!53751 () Bool)

(assert (=> b!35732 m!53751))

(declare-fun m!53753 () Bool)

(assert (=> b!35720 m!53753))

(declare-fun m!53755 () Bool)

(assert (=> b!35727 m!53755))

(declare-fun m!53757 () Bool)

(assert (=> b!35724 m!53757))

(declare-fun m!53759 () Bool)

(assert (=> b!35724 m!53759))

(declare-fun m!53761 () Bool)

(assert (=> b!35724 m!53761))

(assert (=> b!35724 m!53759))

(declare-fun m!53763 () Bool)

(assert (=> b!35724 m!53763))

(declare-fun m!53765 () Bool)

(assert (=> b!35724 m!53765))

(declare-fun m!53767 () Bool)

(assert (=> b!35737 m!53767))

(declare-fun m!53769 () Bool)

(assert (=> b!35737 m!53769))

(declare-fun m!53771 () Bool)

(assert (=> b!35736 m!53771))

(declare-fun m!53773 () Bool)

(assert (=> b!35731 m!53773))

(declare-fun m!53775 () Bool)

(assert (=> b!35721 m!53775))

(declare-fun m!53777 () Bool)

(assert (=> b!35729 m!53777))

(assert (=> b!35729 m!53777))

(declare-fun m!53779 () Bool)

(assert (=> b!35729 m!53779))

(declare-fun m!53781 () Bool)

(assert (=> b!35729 m!53781))

(assert (=> b!35729 m!53781))

(declare-fun m!53783 () Bool)

(assert (=> b!35729 m!53783))

(declare-fun m!53785 () Bool)

(assert (=> b!35717 m!53785))

(declare-fun m!53787 () Bool)

(assert (=> b!35726 m!53787))

(push 1)

(assert (not b!35723))

(assert (not b!35730))

(assert (not b!35733))

(assert (not b!35721))

(assert (not b!35737))

(assert (not b!35728))

(assert (not b!35718))

(assert (not start!7340))

(assert (not b!35731))

(assert (not b!35736))

(assert (not b!35724))

(assert (not b!35726))

(assert (not b!35722))

(assert (not b!35734))

(assert (not b!35732))

(assert (not b!35729))

(assert (not b!35727))

(assert (not b!35719))

(assert (not b!35720))

(assert (not b!35725))

(assert (not b!35717))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!10494 () Bool)

(declare-fun res!30641 () Bool)

(declare-fun e!23740 () Bool)

(assert (=> d!10494 (=> (not res!30641) (not e!23740))))

(assert (=> d!10494 (= res!30641 (= (size!850 (buf!1178 thiss!1379)) (size!850 (buf!1178 (_2!1862 lt!53368)))))))

(assert (=> d!10494 (= (isPrefixOf!0 thiss!1379 (_2!1862 lt!53368)) e!23740)))

(declare-fun b!35939 () Bool)

(declare-fun res!30642 () Bool)

(assert (=> b!35939 (=> (not res!30642) (not e!23740))))

(assert (=> b!35939 (= res!30642 (bvsle (bitIndex!0 (size!850 (buf!1178 thiss!1379)) (currentByte!2563 thiss!1379) (currentBit!2558 thiss!1379)) (bitIndex!0 (size!850 (buf!1178 (_2!1862 lt!53368))) (currentByte!2563 (_2!1862 lt!53368)) (currentBit!2558 (_2!1862 lt!53368)))))))

(declare-fun b!35940 () Bool)

(declare-fun e!23741 () Bool)

(assert (=> b!35940 (= e!23740 e!23741)))

(declare-fun res!30640 () Bool)

(assert (=> b!35940 (=> res!30640 e!23741)))

(assert (=> b!35940 (= res!30640 (= (size!850 (buf!1178 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!35941 () Bool)

(declare-fun arrayBitRangesEq!0 (array!1907 array!1907 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!35941 (= e!23741 (arrayBitRangesEq!0 (buf!1178 thiss!1379) (buf!1178 (_2!1862 lt!53368)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!850 (buf!1178 thiss!1379)) (currentByte!2563 thiss!1379) (currentBit!2558 thiss!1379))))))

(assert (= (and d!10494 res!30641) b!35939))

(assert (= (and b!35939 res!30642) b!35940))

(assert (= (and b!35940 (not res!30640)) b!35941))

(assert (=> b!35939 m!53721))

(assert (=> b!35939 m!53775))

(assert (=> b!35941 m!53721))

(assert (=> b!35941 m!53721))

(declare-fun m!54091 () Bool)

(assert (=> b!35941 m!54091))

(assert (=> b!35724 d!10494))

(declare-fun d!10498 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!10498 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!850 (buf!1178 (_2!1862 lt!53368)))) ((_ sign_extend 32) (currentByte!2563 (_2!1862 lt!53368))) ((_ sign_extend 32) (currentBit!2558 (_2!1862 lt!53368))) lt!53365) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!850 (buf!1178 (_2!1862 lt!53368)))) ((_ sign_extend 32) (currentByte!2563 (_2!1862 lt!53368))) ((_ sign_extend 32) (currentBit!2558 (_2!1862 lt!53368)))) lt!53365))))

(declare-fun bs!2829 () Bool)

(assert (= bs!2829 d!10498))

(declare-fun m!54093 () Bool)

(assert (=> bs!2829 m!54093))

(assert (=> b!35724 d!10498))

(declare-fun d!10500 () Bool)

(declare-fun e!23744 () Bool)

(assert (=> d!10500 e!23744))

(declare-fun res!30645 () Bool)

(assert (=> d!10500 (=> (not res!30645) (not e!23744))))

(assert (=> d!10500 (= res!30645 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!53656 () Unit!2627)

(declare-fun choose!27 (BitStream!1474 BitStream!1474 (_ BitVec 64) (_ BitVec 64)) Unit!2627)

(assert (=> d!10500 (= lt!53656 (choose!27 thiss!1379 (_2!1862 lt!53368) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!10500 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!10500 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1862 lt!53368) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!53656)))

(declare-fun b!35944 () Bool)

(assert (=> b!35944 (= e!23744 (validate_offset_bits!1 ((_ sign_extend 32) (size!850 (buf!1178 (_2!1862 lt!53368)))) ((_ sign_extend 32) (currentByte!2563 (_2!1862 lt!53368))) ((_ sign_extend 32) (currentBit!2558 (_2!1862 lt!53368))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!10500 res!30645) b!35944))

(declare-fun m!54095 () Bool)

(assert (=> d!10500 m!54095))

(declare-fun m!54097 () Bool)

(assert (=> b!35944 m!54097))

(assert (=> b!35724 d!10500))

(declare-fun b!35980 () Bool)

(declare-fun res!30677 () Bool)

(declare-fun e!23766 () Bool)

(assert (=> b!35980 (=> (not res!30677) (not e!23766))))

(declare-fun lt!53692 () (_ BitVec 64))

(declare-fun lt!53690 () tuple2!3550)

(declare-fun lt!53684 () (_ BitVec 64))

(assert (=> b!35980 (= res!30677 (= (bitIndex!0 (size!850 (buf!1178 (_2!1862 lt!53690))) (currentByte!2563 (_2!1862 lt!53690)) (currentBit!2558 (_2!1862 lt!53690))) (bvadd lt!53684 lt!53692)))))

(assert (=> b!35980 (or (not (= (bvand lt!53684 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!53692 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!53684 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!53684 lt!53692) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!35980 (= lt!53692 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!35980 (= lt!53684 (bitIndex!0 (size!850 (buf!1178 thiss!1379)) (currentByte!2563 thiss!1379) (currentBit!2558 thiss!1379)))))

(declare-fun b!35981 () Bool)

(declare-fun res!30681 () Bool)

(declare-fun e!23768 () Bool)

(assert (=> b!35981 (=> (not res!30681) (not e!23768))))

(declare-fun lt!53694 () tuple2!3550)

(assert (=> b!35981 (= res!30681 (isPrefixOf!0 thiss!1379 (_2!1862 lt!53694)))))

(declare-fun d!10506 () Bool)

(assert (=> d!10506 e!23766))

(declare-fun res!30678 () Bool)

(assert (=> d!10506 (=> (not res!30678) (not e!23766))))

(assert (=> d!10506 (= res!30678 (= (size!850 (buf!1178 (_2!1862 lt!53690))) (size!850 (buf!1178 thiss!1379))))))

(declare-fun lt!53695 () (_ BitVec 8))

(declare-fun lt!53688 () array!1907)

(assert (=> d!10506 (= lt!53695 (select (arr!1334 lt!53688) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!10506 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!850 lt!53688)))))

(assert (=> d!10506 (= lt!53688 (array!1908 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!53685 () tuple2!3550)

(assert (=> d!10506 (= lt!53690 (tuple2!3551 (_1!1862 lt!53685) (_2!1862 lt!53685)))))

(assert (=> d!10506 (= lt!53685 lt!53694)))

(assert (=> d!10506 e!23768))

(declare-fun res!30680 () Bool)

(assert (=> d!10506 (=> (not res!30680) (not e!23768))))

(assert (=> d!10506 (= res!30680 (= (size!850 (buf!1178 thiss!1379)) (size!850 (buf!1178 (_2!1862 lt!53694)))))))

(declare-fun lt!53691 () Bool)

(declare-fun appendBit!0 (BitStream!1474 Bool) tuple2!3550)

(assert (=> d!10506 (= lt!53694 (appendBit!0 thiss!1379 lt!53691))))

(assert (=> d!10506 (= lt!53691 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1334 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!10506 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!10506 (= (appendBitFromByte!0 thiss!1379 (select (arr!1334 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!53690)))

(declare-fun b!35982 () Bool)

(declare-fun e!23765 () Bool)

(assert (=> b!35982 (= e!23768 e!23765)))

(declare-fun res!30675 () Bool)

(assert (=> b!35982 (=> (not res!30675) (not e!23765))))

(declare-datatypes ((tuple2!3566 0))(
  ( (tuple2!3567 (_1!1870 BitStream!1474) (_2!1870 Bool)) )
))
(declare-fun lt!53687 () tuple2!3566)

(assert (=> b!35982 (= res!30675 (and (= (_2!1870 lt!53687) lt!53691) (= (_1!1870 lt!53687) (_2!1862 lt!53694))))))

(declare-fun readBitPure!0 (BitStream!1474) tuple2!3566)

(declare-fun readerFrom!0 (BitStream!1474 (_ BitVec 32) (_ BitVec 32)) BitStream!1474)

(assert (=> b!35982 (= lt!53687 (readBitPure!0 (readerFrom!0 (_2!1862 lt!53694) (currentBit!2558 thiss!1379) (currentByte!2563 thiss!1379))))))

(declare-fun b!35983 () Bool)

(declare-fun e!23767 () Bool)

(assert (=> b!35983 (= e!23766 e!23767)))

(declare-fun res!30679 () Bool)

(assert (=> b!35983 (=> (not res!30679) (not e!23767))))

(declare-fun lt!53686 () tuple2!3566)

(assert (=> b!35983 (= res!30679 (and (= (_2!1870 lt!53686) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1334 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!53695)) #b00000000000000000000000000000000))) (= (_1!1870 lt!53686) (_2!1862 lt!53690))))))

(declare-datatypes ((tuple2!3570 0))(
  ( (tuple2!3571 (_1!1872 array!1907) (_2!1872 BitStream!1474)) )
))
(declare-fun lt!53689 () tuple2!3570)

(declare-fun lt!53693 () BitStream!1474)

(declare-fun readBits!0 (BitStream!1474 (_ BitVec 64)) tuple2!3570)

(assert (=> b!35983 (= lt!53689 (readBits!0 lt!53693 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!35983 (= lt!53686 (readBitPure!0 lt!53693))))

(assert (=> b!35983 (= lt!53693 (readerFrom!0 (_2!1862 lt!53690) (currentBit!2558 thiss!1379) (currentByte!2563 thiss!1379)))))

(declare-fun b!35984 () Bool)

(assert (=> b!35984 (= e!23767 (= (bitIndex!0 (size!850 (buf!1178 (_1!1870 lt!53686))) (currentByte!2563 (_1!1870 lt!53686)) (currentBit!2558 (_1!1870 lt!53686))) (bitIndex!0 (size!850 (buf!1178 (_2!1862 lt!53690))) (currentByte!2563 (_2!1862 lt!53690)) (currentBit!2558 (_2!1862 lt!53690)))))))

(declare-fun b!35985 () Bool)

(assert (=> b!35985 (= e!23765 (= (bitIndex!0 (size!850 (buf!1178 (_1!1870 lt!53687))) (currentByte!2563 (_1!1870 lt!53687)) (currentBit!2558 (_1!1870 lt!53687))) (bitIndex!0 (size!850 (buf!1178 (_2!1862 lt!53694))) (currentByte!2563 (_2!1862 lt!53694)) (currentBit!2558 (_2!1862 lt!53694)))))))

(declare-fun b!35986 () Bool)

(declare-fun res!30674 () Bool)

(assert (=> b!35986 (=> (not res!30674) (not e!23766))))

(assert (=> b!35986 (= res!30674 (isPrefixOf!0 thiss!1379 (_2!1862 lt!53690)))))

(declare-fun b!35987 () Bool)

(declare-fun res!30676 () Bool)

(assert (=> b!35987 (=> (not res!30676) (not e!23768))))

(assert (=> b!35987 (= res!30676 (= (bitIndex!0 (size!850 (buf!1178 (_2!1862 lt!53694))) (currentByte!2563 (_2!1862 lt!53694)) (currentBit!2558 (_2!1862 lt!53694))) (bvadd (bitIndex!0 (size!850 (buf!1178 thiss!1379)) (currentByte!2563 thiss!1379) (currentBit!2558 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!10506 res!30680) b!35987))

(assert (= (and b!35987 res!30676) b!35981))

(assert (= (and b!35981 res!30681) b!35982))

(assert (= (and b!35982 res!30675) b!35985))

(assert (= (and d!10506 res!30678) b!35980))

(assert (= (and b!35980 res!30677) b!35986))

(assert (= (and b!35986 res!30674) b!35983))

(assert (= (and b!35983 res!30679) b!35984))

(declare-fun m!54111 () Bool)

(assert (=> b!35981 m!54111))

(declare-fun m!54113 () Bool)

(assert (=> b!35986 m!54113))

(declare-fun m!54115 () Bool)

(assert (=> d!10506 m!54115))

(declare-fun m!54117 () Bool)

(assert (=> d!10506 m!54117))

(declare-fun m!54119 () Bool)

(assert (=> d!10506 m!54119))

(declare-fun m!54121 () Bool)

(assert (=> b!35982 m!54121))

(assert (=> b!35982 m!54121))

(declare-fun m!54123 () Bool)

(assert (=> b!35982 m!54123))

(declare-fun m!54125 () Bool)

(assert (=> b!35984 m!54125))

(declare-fun m!54127 () Bool)

(assert (=> b!35984 m!54127))

(declare-fun m!54129 () Bool)

(assert (=> b!35985 m!54129))

(declare-fun m!54131 () Bool)

(assert (=> b!35985 m!54131))

(assert (=> b!35987 m!54131))

(assert (=> b!35987 m!53721))

(assert (=> b!35980 m!54127))

(assert (=> b!35980 m!53721))

(declare-fun m!54133 () Bool)

(assert (=> b!35983 m!54133))

(declare-fun m!54135 () Bool)

(assert (=> b!35983 m!54135))

(declare-fun m!54137 () Bool)

(assert (=> b!35983 m!54137))

(assert (=> b!35724 d!10506))

(declare-fun d!10518 () Bool)

(assert (=> d!10518 (= (invariant!0 (currentBit!2558 (_2!1862 lt!53368)) (currentByte!2563 (_2!1862 lt!53368)) (size!850 (buf!1178 (_2!1862 lt!53369)))) (and (bvsge (currentBit!2558 (_2!1862 lt!53368)) #b00000000000000000000000000000000) (bvslt (currentBit!2558 (_2!1862 lt!53368)) #b00000000000000000000000000001000) (bvsge (currentByte!2563 (_2!1862 lt!53368)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2563 (_2!1862 lt!53368)) (size!850 (buf!1178 (_2!1862 lt!53369)))) (and (= (currentBit!2558 (_2!1862 lt!53368)) #b00000000000000000000000000000000) (= (currentByte!2563 (_2!1862 lt!53368)) (size!850 (buf!1178 (_2!1862 lt!53369))))))))))

(assert (=> b!35734 d!10518))

(declare-fun d!10520 () Bool)

(assert (=> d!10520 (= (tail!155 lt!53377) (t!1188 lt!53377))))

(assert (=> b!35723 d!10520))

(declare-fun d!10522 () Bool)

(declare-fun e!23791 () Bool)

(assert (=> d!10522 e!23791))

(declare-fun res!30724 () Bool)

(assert (=> d!10522 (=> (not res!30724) (not e!23791))))

(declare-fun lt!53761 () (_ BitVec 64))

(assert (=> d!10522 (= res!30724 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!53761 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!53761) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!10522 (= lt!53761 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!53760 () Unit!2627)

(declare-fun choose!42 (BitStream!1474 BitStream!1474 BitStream!1474 BitStream!1474 (_ BitVec 64) List!438) Unit!2627)

(assert (=> d!10522 (= lt!53760 (choose!42 (_2!1862 lt!53369) (_2!1862 lt!53369) (_1!1863 lt!53362) (_1!1863 lt!53370) (bvsub to!314 i!635) lt!53377))))

(assert (=> d!10522 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10522 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1862 lt!53369) (_2!1862 lt!53369) (_1!1863 lt!53362) (_1!1863 lt!53370) (bvsub to!314 i!635) lt!53377) lt!53760)))

(declare-fun b!36032 () Bool)

(assert (=> b!36032 (= e!23791 (= (bitStreamReadBitsIntoList!0 (_2!1862 lt!53369) (_1!1863 lt!53370) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!155 lt!53377)))))

(assert (= (and d!10522 res!30724) b!36032))

(declare-fun m!54139 () Bool)

(assert (=> d!10522 m!54139))

(declare-fun m!54141 () Bool)

(assert (=> b!36032 m!54141))

(assert (=> b!36032 m!53747))

(assert (=> b!35723 d!10522))

(declare-fun d!10524 () Bool)

(assert (=> d!10524 (= (bitAt!0 (buf!1178 (_1!1863 lt!53370)) lt!53383) (not (= (bvand ((_ sign_extend 24) (select (arr!1334 (buf!1178 (_1!1863 lt!53370))) ((_ extract 31 0) (bvsdiv lt!53383 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!53383 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2834 () Bool)

(assert (= bs!2834 d!10524))

(declare-fun m!54175 () Bool)

(assert (=> bs!2834 m!54175))

(declare-fun m!54177 () Bool)

(assert (=> bs!2834 m!54177))

(assert (=> b!35722 d!10524))

(declare-fun d!10532 () Bool)

(assert (=> d!10532 (= (bitAt!0 (buf!1178 (_1!1863 lt!53362)) lt!53383) (not (= (bvand ((_ sign_extend 24) (select (arr!1334 (buf!1178 (_1!1863 lt!53362))) ((_ extract 31 0) (bvsdiv lt!53383 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!53383 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2836 () Bool)

(assert (= bs!2836 d!10532))

(declare-fun m!54181 () Bool)

(assert (=> bs!2836 m!54181))

(assert (=> bs!2836 m!54177))

(assert (=> b!35722 d!10532))

(declare-fun d!10536 () Bool)

(assert (=> d!10536 (= (head!275 (byteArrayBitContentToList!0 (_2!1862 lt!53369) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!553 (byteArrayBitContentToList!0 (_2!1862 lt!53369) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!35733 d!10536))

(declare-fun d!10540 () Bool)

(declare-fun c!2445 () Bool)

(assert (=> d!10540 (= c!2445 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!23799 () List!438)

(assert (=> d!10540 (= (byteArrayBitContentToList!0 (_2!1862 lt!53369) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!23799)))

(declare-fun b!36047 () Bool)

(assert (=> b!36047 (= e!23799 Nil!435)))

(declare-fun b!36048 () Bool)

(assert (=> b!36048 (= e!23799 (Cons!434 (not (= (bvand ((_ sign_extend 24) (select (arr!1334 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1862 lt!53369) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!10540 c!2445) b!36047))

(assert (= (and d!10540 (not c!2445)) b!36048))

(assert (=> b!36048 m!53759))

(assert (=> b!36048 m!54119))

(declare-fun m!54221 () Bool)

(assert (=> b!36048 m!54221))

(assert (=> b!35733 d!10540))

(declare-fun d!10560 () Bool)

(assert (=> d!10560 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1334 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2842 () Bool)

(assert (= bs!2842 d!10560))

(assert (=> bs!2842 m!53759))

(assert (=> bs!2842 m!54119))

(assert (=> b!35733 d!10560))

(declare-fun d!10562 () Bool)

(assert (=> d!10562 (= (array_inv!790 (buf!1178 thiss!1379)) (bvsge (size!850 (buf!1178 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!35732 d!10562))

(declare-fun d!10566 () Bool)

(declare-fun e!23808 () Bool)

(assert (=> d!10566 e!23808))

(declare-fun res!30739 () Bool)

(assert (=> d!10566 (=> (not res!30739) (not e!23808))))

(declare-fun lt!53812 () (_ BitVec 64))

(declare-fun lt!53810 () (_ BitVec 64))

(declare-fun lt!53809 () (_ BitVec 64))

(assert (=> d!10566 (= res!30739 (= lt!53812 (bvsub lt!53810 lt!53809)))))

(assert (=> d!10566 (or (= (bvand lt!53810 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!53809 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!53810 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!53810 lt!53809) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!10566 (= lt!53809 (remainingBits!0 ((_ sign_extend 32) (size!850 (buf!1178 (_2!1862 lt!53368)))) ((_ sign_extend 32) (currentByte!2563 (_2!1862 lt!53368))) ((_ sign_extend 32) (currentBit!2558 (_2!1862 lt!53368)))))))

(declare-fun lt!53808 () (_ BitVec 64))

(declare-fun lt!53807 () (_ BitVec 64))

(assert (=> d!10566 (= lt!53810 (bvmul lt!53808 lt!53807))))

(assert (=> d!10566 (or (= lt!53808 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!53807 (bvsdiv (bvmul lt!53808 lt!53807) lt!53808)))))

(assert (=> d!10566 (= lt!53807 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!10566 (= lt!53808 ((_ sign_extend 32) (size!850 (buf!1178 (_2!1862 lt!53368)))))))

(assert (=> d!10566 (= lt!53812 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2563 (_2!1862 lt!53368))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2558 (_2!1862 lt!53368)))))))

(assert (=> d!10566 (invariant!0 (currentBit!2558 (_2!1862 lt!53368)) (currentByte!2563 (_2!1862 lt!53368)) (size!850 (buf!1178 (_2!1862 lt!53368))))))

(assert (=> d!10566 (= (bitIndex!0 (size!850 (buf!1178 (_2!1862 lt!53368))) (currentByte!2563 (_2!1862 lt!53368)) (currentBit!2558 (_2!1862 lt!53368))) lt!53812)))

(declare-fun b!36065 () Bool)

(declare-fun res!30740 () Bool)

(assert (=> b!36065 (=> (not res!30740) (not e!23808))))

(assert (=> b!36065 (= res!30740 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!53812))))

(declare-fun b!36066 () Bool)

(declare-fun lt!53811 () (_ BitVec 64))

(assert (=> b!36066 (= e!23808 (bvsle lt!53812 (bvmul lt!53811 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!36066 (or (= lt!53811 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!53811 #b0000000000000000000000000000000000000000000000000000000000001000) lt!53811)))))

(assert (=> b!36066 (= lt!53811 ((_ sign_extend 32) (size!850 (buf!1178 (_2!1862 lt!53368)))))))

(assert (= (and d!10566 res!30739) b!36065))

(assert (= (and b!36065 res!30740) b!36066))

(assert (=> d!10566 m!54093))

(assert (=> d!10566 m!53711))

(assert (=> b!35721 d!10566))

(declare-fun d!10572 () Bool)

(declare-fun size!853 (List!438) Int)

(assert (=> d!10572 (= (length!164 lt!53377) (size!853 lt!53377))))

(declare-fun bs!2845 () Bool)

(assert (= bs!2845 d!10572))

(declare-fun m!54235 () Bool)

(assert (=> bs!2845 m!54235))

(assert (=> b!35720 d!10572))

(declare-fun d!10574 () Bool)

(declare-fun e!23809 () Bool)

(assert (=> d!10574 e!23809))

(declare-fun res!30741 () Bool)

(assert (=> d!10574 (=> (not res!30741) (not e!23809))))

(declare-fun lt!53815 () (_ BitVec 64))

(declare-fun lt!53818 () (_ BitVec 64))

(declare-fun lt!53816 () (_ BitVec 64))

(assert (=> d!10574 (= res!30741 (= lt!53818 (bvsub lt!53816 lt!53815)))))

(assert (=> d!10574 (or (= (bvand lt!53816 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!53815 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!53816 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!53816 lt!53815) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!10574 (= lt!53815 (remainingBits!0 ((_ sign_extend 32) (size!850 (buf!1178 (_2!1862 lt!53369)))) ((_ sign_extend 32) (currentByte!2563 (_2!1862 lt!53369))) ((_ sign_extend 32) (currentBit!2558 (_2!1862 lt!53369)))))))

(declare-fun lt!53814 () (_ BitVec 64))

(declare-fun lt!53813 () (_ BitVec 64))

(assert (=> d!10574 (= lt!53816 (bvmul lt!53814 lt!53813))))

(assert (=> d!10574 (or (= lt!53814 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!53813 (bvsdiv (bvmul lt!53814 lt!53813) lt!53814)))))

(assert (=> d!10574 (= lt!53813 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!10574 (= lt!53814 ((_ sign_extend 32) (size!850 (buf!1178 (_2!1862 lt!53369)))))))

(assert (=> d!10574 (= lt!53818 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2563 (_2!1862 lt!53369))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2558 (_2!1862 lt!53369)))))))

(assert (=> d!10574 (invariant!0 (currentBit!2558 (_2!1862 lt!53369)) (currentByte!2563 (_2!1862 lt!53369)) (size!850 (buf!1178 (_2!1862 lt!53369))))))

(assert (=> d!10574 (= (bitIndex!0 (size!850 (buf!1178 (_2!1862 lt!53369))) (currentByte!2563 (_2!1862 lt!53369)) (currentBit!2558 (_2!1862 lt!53369))) lt!53818)))

(declare-fun b!36067 () Bool)

(declare-fun res!30742 () Bool)

(assert (=> b!36067 (=> (not res!30742) (not e!23809))))

(assert (=> b!36067 (= res!30742 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!53818))))

(declare-fun b!36068 () Bool)

(declare-fun lt!53817 () (_ BitVec 64))

(assert (=> b!36068 (= e!23809 (bvsle lt!53818 (bvmul lt!53817 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!36068 (or (= lt!53817 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!53817 #b0000000000000000000000000000000000000000000000000000000000001000) lt!53817)))))

(assert (=> b!36068 (= lt!53817 ((_ sign_extend 32) (size!850 (buf!1178 (_2!1862 lt!53369)))))))

(assert (= (and d!10574 res!30741) b!36067))

(assert (= (and b!36067 res!30742) b!36068))

(declare-fun m!54237 () Bool)

(assert (=> d!10574 m!54237))

(assert (=> d!10574 m!53771))

(assert (=> b!35731 d!10574))

(declare-fun d!10576 () Bool)

(assert (=> d!10576 (= (invariant!0 (currentBit!2558 (_2!1862 lt!53368)) (currentByte!2563 (_2!1862 lt!53368)) (size!850 (buf!1178 (_2!1862 lt!53368)))) (and (bvsge (currentBit!2558 (_2!1862 lt!53368)) #b00000000000000000000000000000000) (bvslt (currentBit!2558 (_2!1862 lt!53368)) #b00000000000000000000000000001000) (bvsge (currentByte!2563 (_2!1862 lt!53368)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2563 (_2!1862 lt!53368)) (size!850 (buf!1178 (_2!1862 lt!53368)))) (and (= (currentBit!2558 (_2!1862 lt!53368)) #b00000000000000000000000000000000) (= (currentByte!2563 (_2!1862 lt!53368)) (size!850 (buf!1178 (_2!1862 lt!53368))))))))))

(assert (=> b!35730 d!10576))

(declare-fun d!10578 () Bool)

(assert (=> d!10578 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!850 (buf!1178 (_2!1862 lt!53369)))) ((_ sign_extend 32) (currentByte!2563 thiss!1379)) ((_ sign_extend 32) (currentBit!2558 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!850 (buf!1178 (_2!1862 lt!53369)))) ((_ sign_extend 32) (currentByte!2563 thiss!1379)) ((_ sign_extend 32) (currentBit!2558 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2846 () Bool)

(assert (= bs!2846 d!10578))

(declare-fun m!54239 () Bool)

(assert (=> bs!2846 m!54239))

(assert (=> b!35719 d!10578))

(declare-fun b!36099 () Bool)

(declare-fun e!23822 () Unit!2627)

(declare-fun Unit!2635 () Unit!2627)

(assert (=> b!36099 (= e!23822 Unit!2635)))

(declare-fun b!36100 () Bool)

(declare-fun res!30762 () Bool)

(declare-fun e!23823 () Bool)

(assert (=> b!36100 (=> (not res!30762) (not e!23823))))

(declare-fun lt!53943 () tuple2!3552)

(assert (=> b!36100 (= res!30762 (isPrefixOf!0 (_2!1863 lt!53943) (_2!1862 lt!53369)))))

(declare-fun b!36101 () Bool)

(declare-fun lt!53958 () Unit!2627)

(assert (=> b!36101 (= e!23822 lt!53958)))

(declare-fun lt!53946 () (_ BitVec 64))

(assert (=> b!36101 (= lt!53946 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!53942 () (_ BitVec 64))

(assert (=> b!36101 (= lt!53942 (bitIndex!0 (size!850 (buf!1178 (_2!1862 lt!53368))) (currentByte!2563 (_2!1862 lt!53368)) (currentBit!2558 (_2!1862 lt!53368))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1907 array!1907 (_ BitVec 64) (_ BitVec 64)) Unit!2627)

(assert (=> b!36101 (= lt!53958 (arrayBitRangesEqSymmetric!0 (buf!1178 (_2!1862 lt!53368)) (buf!1178 (_2!1862 lt!53369)) lt!53946 lt!53942))))

(assert (=> b!36101 (arrayBitRangesEq!0 (buf!1178 (_2!1862 lt!53369)) (buf!1178 (_2!1862 lt!53368)) lt!53946 lt!53942)))

(declare-fun d!10580 () Bool)

(assert (=> d!10580 e!23823))

(declare-fun res!30761 () Bool)

(assert (=> d!10580 (=> (not res!30761) (not e!23823))))

(assert (=> d!10580 (= res!30761 (isPrefixOf!0 (_1!1863 lt!53943) (_2!1863 lt!53943)))))

(declare-fun lt!53954 () BitStream!1474)

(assert (=> d!10580 (= lt!53943 (tuple2!3553 lt!53954 (_2!1862 lt!53369)))))

(declare-fun lt!53953 () Unit!2627)

(declare-fun lt!53944 () Unit!2627)

(assert (=> d!10580 (= lt!53953 lt!53944)))

(assert (=> d!10580 (isPrefixOf!0 lt!53954 (_2!1862 lt!53369))))

(assert (=> d!10580 (= lt!53944 (lemmaIsPrefixTransitive!0 lt!53954 (_2!1862 lt!53369) (_2!1862 lt!53369)))))

(declare-fun lt!53940 () Unit!2627)

(declare-fun lt!53951 () Unit!2627)

(assert (=> d!10580 (= lt!53940 lt!53951)))

(assert (=> d!10580 (isPrefixOf!0 lt!53954 (_2!1862 lt!53369))))

(assert (=> d!10580 (= lt!53951 (lemmaIsPrefixTransitive!0 lt!53954 (_2!1862 lt!53368) (_2!1862 lt!53369)))))

(declare-fun lt!53956 () Unit!2627)

(assert (=> d!10580 (= lt!53956 e!23822)))

(declare-fun c!2458 () Bool)

(assert (=> d!10580 (= c!2458 (not (= (size!850 (buf!1178 (_2!1862 lt!53368))) #b00000000000000000000000000000000)))))

(declare-fun lt!53941 () Unit!2627)

(declare-fun lt!53947 () Unit!2627)

(assert (=> d!10580 (= lt!53941 lt!53947)))

(assert (=> d!10580 (isPrefixOf!0 (_2!1862 lt!53369) (_2!1862 lt!53369))))

(assert (=> d!10580 (= lt!53947 (lemmaIsPrefixRefl!0 (_2!1862 lt!53369)))))

(declare-fun lt!53945 () Unit!2627)

(declare-fun lt!53949 () Unit!2627)

(assert (=> d!10580 (= lt!53945 lt!53949)))

(assert (=> d!10580 (= lt!53949 (lemmaIsPrefixRefl!0 (_2!1862 lt!53369)))))

(declare-fun lt!53952 () Unit!2627)

(declare-fun lt!53939 () Unit!2627)

(assert (=> d!10580 (= lt!53952 lt!53939)))

(assert (=> d!10580 (isPrefixOf!0 lt!53954 lt!53954)))

(assert (=> d!10580 (= lt!53939 (lemmaIsPrefixRefl!0 lt!53954))))

(declare-fun lt!53955 () Unit!2627)

(declare-fun lt!53950 () Unit!2627)

(assert (=> d!10580 (= lt!53955 lt!53950)))

(assert (=> d!10580 (isPrefixOf!0 (_2!1862 lt!53368) (_2!1862 lt!53368))))

(assert (=> d!10580 (= lt!53950 (lemmaIsPrefixRefl!0 (_2!1862 lt!53368)))))

(assert (=> d!10580 (= lt!53954 (BitStream!1475 (buf!1178 (_2!1862 lt!53369)) (currentByte!2563 (_2!1862 lt!53368)) (currentBit!2558 (_2!1862 lt!53368))))))

(assert (=> d!10580 (isPrefixOf!0 (_2!1862 lt!53368) (_2!1862 lt!53369))))

(assert (=> d!10580 (= (reader!0 (_2!1862 lt!53368) (_2!1862 lt!53369)) lt!53943)))

(declare-fun lt!53957 () (_ BitVec 64))

(declare-fun lt!53948 () (_ BitVec 64))

(declare-fun b!36102 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!1474 (_ BitVec 64)) BitStream!1474)

(assert (=> b!36102 (= e!23823 (= (_1!1863 lt!53943) (withMovedBitIndex!0 (_2!1863 lt!53943) (bvsub lt!53957 lt!53948))))))

(assert (=> b!36102 (or (= (bvand lt!53957 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!53948 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!53957 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!53957 lt!53948) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!36102 (= lt!53948 (bitIndex!0 (size!850 (buf!1178 (_2!1862 lt!53369))) (currentByte!2563 (_2!1862 lt!53369)) (currentBit!2558 (_2!1862 lt!53369))))))

(assert (=> b!36102 (= lt!53957 (bitIndex!0 (size!850 (buf!1178 (_2!1862 lt!53368))) (currentByte!2563 (_2!1862 lt!53368)) (currentBit!2558 (_2!1862 lt!53368))))))

(declare-fun b!36103 () Bool)

(declare-fun res!30763 () Bool)

(assert (=> b!36103 (=> (not res!30763) (not e!23823))))

(assert (=> b!36103 (= res!30763 (isPrefixOf!0 (_1!1863 lt!53943) (_2!1862 lt!53368)))))

(assert (= (and d!10580 c!2458) b!36101))

(assert (= (and d!10580 (not c!2458)) b!36099))

(assert (= (and d!10580 res!30761) b!36103))

(assert (= (and b!36103 res!30763) b!36100))

(assert (= (and b!36100 res!30762) b!36102))

(assert (=> b!36101 m!53775))

(declare-fun m!54293 () Bool)

(assert (=> b!36101 m!54293))

(declare-fun m!54295 () Bool)

(assert (=> b!36101 m!54295))

(declare-fun m!54297 () Bool)

(assert (=> d!10580 m!54297))

(declare-fun m!54299 () Bool)

(assert (=> d!10580 m!54299))

(declare-fun m!54303 () Bool)

(assert (=> d!10580 m!54303))

(assert (=> d!10580 m!53739))

(declare-fun m!54305 () Bool)

(assert (=> d!10580 m!54305))

(declare-fun m!54307 () Bool)

(assert (=> d!10580 m!54307))

(declare-fun m!54309 () Bool)

(assert (=> d!10580 m!54309))

(declare-fun m!54311 () Bool)

(assert (=> d!10580 m!54311))

(declare-fun m!54313 () Bool)

(assert (=> d!10580 m!54313))

(declare-fun m!54315 () Bool)

(assert (=> d!10580 m!54315))

(declare-fun m!54317 () Bool)

(assert (=> d!10580 m!54317))

(declare-fun m!54319 () Bool)

(assert (=> b!36100 m!54319))

(declare-fun m!54321 () Bool)

(assert (=> b!36103 m!54321))

(declare-fun m!54323 () Bool)

(assert (=> b!36102 m!54323))

(assert (=> b!36102 m!53773))

(assert (=> b!36102 m!53775))

(assert (=> b!35719 d!10580))

(declare-fun d!10588 () Bool)

(declare-fun e!23831 () Bool)

(assert (=> d!10588 e!23831))

(declare-fun c!2465 () Bool)

(assert (=> d!10588 (= c!2465 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!53969 () List!438)

(declare-datatypes ((tuple2!3582 0))(
  ( (tuple2!3583 (_1!1878 List!438) (_2!1878 BitStream!1474)) )
))
(declare-fun e!23830 () tuple2!3582)

(assert (=> d!10588 (= lt!53969 (_1!1878 e!23830))))

(declare-fun c!2466 () Bool)

(assert (=> d!10588 (= c!2466 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10588 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10588 (= (bitStreamReadBitsIntoList!0 (_2!1862 lt!53369) (_1!1863 lt!53362) (bvsub to!314 i!635)) lt!53969)))

(declare-fun b!36117 () Bool)

(declare-datatypes ((tuple2!3584 0))(
  ( (tuple2!3585 (_1!1879 Bool) (_2!1879 BitStream!1474)) )
))
(declare-fun lt!53971 () tuple2!3584)

(declare-fun lt!53970 () (_ BitVec 64))

(assert (=> b!36117 (= e!23830 (tuple2!3583 (Cons!434 (_1!1879 lt!53971) (bitStreamReadBitsIntoList!0 (_2!1862 lt!53369) (_2!1879 lt!53971) (bvsub (bvsub to!314 i!635) lt!53970))) (_2!1879 lt!53971)))))

(declare-fun readBit!0 (BitStream!1474) tuple2!3584)

(assert (=> b!36117 (= lt!53971 (readBit!0 (_1!1863 lt!53362)))))

(assert (=> b!36117 (= lt!53970 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!36118 () Bool)

(declare-fun isEmpty!101 (List!438) Bool)

(assert (=> b!36118 (= e!23831 (isEmpty!101 lt!53969))))

(declare-fun b!36119 () Bool)

(assert (=> b!36119 (= e!23831 (> (length!164 lt!53969) 0))))

(declare-fun b!36116 () Bool)

(assert (=> b!36116 (= e!23830 (tuple2!3583 Nil!435 (_1!1863 lt!53362)))))

(assert (= (and d!10588 c!2466) b!36116))

(assert (= (and d!10588 (not c!2466)) b!36117))

(assert (= (and d!10588 c!2465) b!36118))

(assert (= (and d!10588 (not c!2465)) b!36119))

(declare-fun m!54339 () Bool)

(assert (=> b!36117 m!54339))

(declare-fun m!54341 () Bool)

(assert (=> b!36117 m!54341))

(declare-fun m!54343 () Bool)

(assert (=> b!36118 m!54343))

(declare-fun m!54345 () Bool)

(assert (=> b!36119 m!54345))

(assert (=> b!35719 d!10588))

(declare-fun d!10602 () Bool)

(assert (=> d!10602 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!850 (buf!1178 (_2!1862 lt!53369)))) ((_ sign_extend 32) (currentByte!2563 (_2!1862 lt!53368))) ((_ sign_extend 32) (currentBit!2558 (_2!1862 lt!53368))) lt!53365) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!850 (buf!1178 (_2!1862 lt!53369)))) ((_ sign_extend 32) (currentByte!2563 (_2!1862 lt!53368))) ((_ sign_extend 32) (currentBit!2558 (_2!1862 lt!53368)))) lt!53365))))

(declare-fun bs!2851 () Bool)

(assert (= bs!2851 d!10602))

(declare-fun m!54347 () Bool)

(assert (=> bs!2851 m!54347))

(assert (=> b!35719 d!10602))

(declare-fun b!36120 () Bool)

(declare-fun e!23832 () Unit!2627)

(declare-fun Unit!2639 () Unit!2627)

(assert (=> b!36120 (= e!23832 Unit!2639)))

(declare-fun b!36121 () Bool)

(declare-fun res!30765 () Bool)

(declare-fun e!23833 () Bool)

(assert (=> b!36121 (=> (not res!30765) (not e!23833))))

(declare-fun lt!53976 () tuple2!3552)

(assert (=> b!36121 (= res!30765 (isPrefixOf!0 (_2!1863 lt!53976) (_2!1862 lt!53369)))))

(declare-fun b!36122 () Bool)

(declare-fun lt!53991 () Unit!2627)

(assert (=> b!36122 (= e!23832 lt!53991)))

(declare-fun lt!53979 () (_ BitVec 64))

(assert (=> b!36122 (= lt!53979 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!53975 () (_ BitVec 64))

(assert (=> b!36122 (= lt!53975 (bitIndex!0 (size!850 (buf!1178 thiss!1379)) (currentByte!2563 thiss!1379) (currentBit!2558 thiss!1379)))))

(assert (=> b!36122 (= lt!53991 (arrayBitRangesEqSymmetric!0 (buf!1178 thiss!1379) (buf!1178 (_2!1862 lt!53369)) lt!53979 lt!53975))))

(assert (=> b!36122 (arrayBitRangesEq!0 (buf!1178 (_2!1862 lt!53369)) (buf!1178 thiss!1379) lt!53979 lt!53975)))

(declare-fun d!10604 () Bool)

(assert (=> d!10604 e!23833))

(declare-fun res!30764 () Bool)

(assert (=> d!10604 (=> (not res!30764) (not e!23833))))

(assert (=> d!10604 (= res!30764 (isPrefixOf!0 (_1!1863 lt!53976) (_2!1863 lt!53976)))))

(declare-fun lt!53987 () BitStream!1474)

(assert (=> d!10604 (= lt!53976 (tuple2!3553 lt!53987 (_2!1862 lt!53369)))))

(declare-fun lt!53986 () Unit!2627)

(declare-fun lt!53977 () Unit!2627)

(assert (=> d!10604 (= lt!53986 lt!53977)))

(assert (=> d!10604 (isPrefixOf!0 lt!53987 (_2!1862 lt!53369))))

(assert (=> d!10604 (= lt!53977 (lemmaIsPrefixTransitive!0 lt!53987 (_2!1862 lt!53369) (_2!1862 lt!53369)))))

(declare-fun lt!53973 () Unit!2627)

(declare-fun lt!53984 () Unit!2627)

(assert (=> d!10604 (= lt!53973 lt!53984)))

(assert (=> d!10604 (isPrefixOf!0 lt!53987 (_2!1862 lt!53369))))

(assert (=> d!10604 (= lt!53984 (lemmaIsPrefixTransitive!0 lt!53987 thiss!1379 (_2!1862 lt!53369)))))

(declare-fun lt!53989 () Unit!2627)

(assert (=> d!10604 (= lt!53989 e!23832)))

(declare-fun c!2467 () Bool)

(assert (=> d!10604 (= c!2467 (not (= (size!850 (buf!1178 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!53974 () Unit!2627)

(declare-fun lt!53980 () Unit!2627)

(assert (=> d!10604 (= lt!53974 lt!53980)))

(assert (=> d!10604 (isPrefixOf!0 (_2!1862 lt!53369) (_2!1862 lt!53369))))

(assert (=> d!10604 (= lt!53980 (lemmaIsPrefixRefl!0 (_2!1862 lt!53369)))))

(declare-fun lt!53978 () Unit!2627)

(declare-fun lt!53982 () Unit!2627)

(assert (=> d!10604 (= lt!53978 lt!53982)))

(assert (=> d!10604 (= lt!53982 (lemmaIsPrefixRefl!0 (_2!1862 lt!53369)))))

(declare-fun lt!53985 () Unit!2627)

(declare-fun lt!53972 () Unit!2627)

(assert (=> d!10604 (= lt!53985 lt!53972)))

(assert (=> d!10604 (isPrefixOf!0 lt!53987 lt!53987)))

(assert (=> d!10604 (= lt!53972 (lemmaIsPrefixRefl!0 lt!53987))))

(declare-fun lt!53988 () Unit!2627)

(declare-fun lt!53983 () Unit!2627)

(assert (=> d!10604 (= lt!53988 lt!53983)))

(assert (=> d!10604 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!10604 (= lt!53983 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!10604 (= lt!53987 (BitStream!1475 (buf!1178 (_2!1862 lt!53369)) (currentByte!2563 thiss!1379) (currentBit!2558 thiss!1379)))))

(assert (=> d!10604 (isPrefixOf!0 thiss!1379 (_2!1862 lt!53369))))

(assert (=> d!10604 (= (reader!0 thiss!1379 (_2!1862 lt!53369)) lt!53976)))

(declare-fun b!36123 () Bool)

(declare-fun lt!53981 () (_ BitVec 64))

(declare-fun lt!53990 () (_ BitVec 64))

(assert (=> b!36123 (= e!23833 (= (_1!1863 lt!53976) (withMovedBitIndex!0 (_2!1863 lt!53976) (bvsub lt!53990 lt!53981))))))

(assert (=> b!36123 (or (= (bvand lt!53990 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!53981 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!53990 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!53990 lt!53981) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!36123 (= lt!53981 (bitIndex!0 (size!850 (buf!1178 (_2!1862 lt!53369))) (currentByte!2563 (_2!1862 lt!53369)) (currentBit!2558 (_2!1862 lt!53369))))))

(assert (=> b!36123 (= lt!53990 (bitIndex!0 (size!850 (buf!1178 thiss!1379)) (currentByte!2563 thiss!1379) (currentBit!2558 thiss!1379)))))

(declare-fun b!36124 () Bool)

(declare-fun res!30766 () Bool)

(assert (=> b!36124 (=> (not res!30766) (not e!23833))))

(assert (=> b!36124 (= res!30766 (isPrefixOf!0 (_1!1863 lt!53976) thiss!1379))))

(assert (= (and d!10604 c!2467) b!36122))

(assert (= (and d!10604 (not c!2467)) b!36120))

(assert (= (and d!10604 res!30764) b!36124))

(assert (= (and b!36124 res!30766) b!36121))

(assert (= (and b!36121 res!30765) b!36123))

(assert (=> b!36122 m!53721))

(declare-fun m!54349 () Bool)

(assert (=> b!36122 m!54349))

(declare-fun m!54351 () Bool)

(assert (=> b!36122 m!54351))

(declare-fun m!54353 () Bool)

(assert (=> d!10604 m!54353))

(declare-fun m!54355 () Bool)

(assert (=> d!10604 m!54355))

(assert (=> d!10604 m!53719))

(assert (=> d!10604 m!53731))

(assert (=> d!10604 m!54305))

(declare-fun m!54357 () Bool)

(assert (=> d!10604 m!54357))

(assert (=> d!10604 m!53717))

(declare-fun m!54359 () Bool)

(assert (=> d!10604 m!54359))

(assert (=> d!10604 m!54313))

(declare-fun m!54361 () Bool)

(assert (=> d!10604 m!54361))

(declare-fun m!54363 () Bool)

(assert (=> d!10604 m!54363))

(declare-fun m!54365 () Bool)

(assert (=> b!36121 m!54365))

(declare-fun m!54367 () Bool)

(assert (=> b!36124 m!54367))

(declare-fun m!54369 () Bool)

(assert (=> b!36123 m!54369))

(assert (=> b!36123 m!53773))

(assert (=> b!36123 m!53721))

(assert (=> b!35719 d!10604))

(declare-fun d!10606 () Bool)

(assert (=> d!10606 (validate_offset_bits!1 ((_ sign_extend 32) (size!850 (buf!1178 (_2!1862 lt!53369)))) ((_ sign_extend 32) (currentByte!2563 thiss!1379)) ((_ sign_extend 32) (currentBit!2558 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!54012 () Unit!2627)

(declare-fun choose!9 (BitStream!1474 array!1907 (_ BitVec 64) BitStream!1474) Unit!2627)

(assert (=> d!10606 (= lt!54012 (choose!9 thiss!1379 (buf!1178 (_2!1862 lt!53369)) (bvsub to!314 i!635) (BitStream!1475 (buf!1178 (_2!1862 lt!53369)) (currentByte!2563 thiss!1379) (currentBit!2558 thiss!1379))))))

(assert (=> d!10606 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1178 (_2!1862 lt!53369)) (bvsub to!314 i!635)) lt!54012)))

(declare-fun bs!2852 () Bool)

(assert (= bs!2852 d!10606))

(assert (=> bs!2852 m!53707))

(declare-fun m!54371 () Bool)

(assert (=> bs!2852 m!54371))

(assert (=> b!35719 d!10606))

(declare-fun d!10610 () Bool)

(declare-fun e!23838 () Bool)

(assert (=> d!10610 e!23838))

(declare-fun c!2468 () Bool)

(assert (=> d!10610 (= c!2468 (= lt!53365 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!54013 () List!438)

(declare-fun e!23837 () tuple2!3582)

(assert (=> d!10610 (= lt!54013 (_1!1878 e!23837))))

(declare-fun c!2469 () Bool)

(assert (=> d!10610 (= c!2469 (= lt!53365 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10610 (bvsge lt!53365 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10610 (= (bitStreamReadBitsIntoList!0 (_2!1862 lt!53369) (_1!1863 lt!53370) lt!53365) lt!54013)))

(declare-fun lt!54014 () (_ BitVec 64))

(declare-fun b!36132 () Bool)

(declare-fun lt!54015 () tuple2!3584)

(assert (=> b!36132 (= e!23837 (tuple2!3583 (Cons!434 (_1!1879 lt!54015) (bitStreamReadBitsIntoList!0 (_2!1862 lt!53369) (_2!1879 lt!54015) (bvsub lt!53365 lt!54014))) (_2!1879 lt!54015)))))

(assert (=> b!36132 (= lt!54015 (readBit!0 (_1!1863 lt!53370)))))

(assert (=> b!36132 (= lt!54014 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!36133 () Bool)

(assert (=> b!36133 (= e!23838 (isEmpty!101 lt!54013))))

(declare-fun b!36134 () Bool)

(assert (=> b!36134 (= e!23838 (> (length!164 lt!54013) 0))))

(declare-fun b!36131 () Bool)

(assert (=> b!36131 (= e!23837 (tuple2!3583 Nil!435 (_1!1863 lt!53370)))))

(assert (= (and d!10610 c!2469) b!36131))

(assert (= (and d!10610 (not c!2469)) b!36132))

(assert (= (and d!10610 c!2468) b!36133))

(assert (= (and d!10610 (not c!2468)) b!36134))

(declare-fun m!54373 () Bool)

(assert (=> b!36132 m!54373))

(declare-fun m!54375 () Bool)

(assert (=> b!36132 m!54375))

(declare-fun m!54377 () Bool)

(assert (=> b!36133 m!54377))

(declare-fun m!54379 () Bool)

(assert (=> b!36134 m!54379))

(assert (=> b!35719 d!10610))

(declare-fun d!10614 () Bool)

(assert (=> d!10614 (validate_offset_bits!1 ((_ sign_extend 32) (size!850 (buf!1178 (_2!1862 lt!53369)))) ((_ sign_extend 32) (currentByte!2563 (_2!1862 lt!53368))) ((_ sign_extend 32) (currentBit!2558 (_2!1862 lt!53368))) lt!53365)))

(declare-fun lt!54016 () Unit!2627)

(assert (=> d!10614 (= lt!54016 (choose!9 (_2!1862 lt!53368) (buf!1178 (_2!1862 lt!53369)) lt!53365 (BitStream!1475 (buf!1178 (_2!1862 lt!53369)) (currentByte!2563 (_2!1862 lt!53368)) (currentBit!2558 (_2!1862 lt!53368)))))))

(assert (=> d!10614 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1862 lt!53368) (buf!1178 (_2!1862 lt!53369)) lt!53365) lt!54016)))

(declare-fun bs!2853 () Bool)

(assert (= bs!2853 d!10614))

(assert (=> bs!2853 m!53701))

(declare-fun m!54381 () Bool)

(assert (=> bs!2853 m!54381))

(assert (=> b!35719 d!10614))

(declare-fun d!10616 () Bool)

(declare-fun res!30774 () Bool)

(declare-fun e!23839 () Bool)

(assert (=> d!10616 (=> (not res!30774) (not e!23839))))

(assert (=> d!10616 (= res!30774 (= (size!850 (buf!1178 thiss!1379)) (size!850 (buf!1178 thiss!1379))))))

(assert (=> d!10616 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!23839)))

(declare-fun b!36135 () Bool)

(declare-fun res!30775 () Bool)

(assert (=> b!36135 (=> (not res!30775) (not e!23839))))

(assert (=> b!36135 (= res!30775 (bvsle (bitIndex!0 (size!850 (buf!1178 thiss!1379)) (currentByte!2563 thiss!1379) (currentBit!2558 thiss!1379)) (bitIndex!0 (size!850 (buf!1178 thiss!1379)) (currentByte!2563 thiss!1379) (currentBit!2558 thiss!1379))))))

(declare-fun b!36136 () Bool)

(declare-fun e!23840 () Bool)

(assert (=> b!36136 (= e!23839 e!23840)))

(declare-fun res!30773 () Bool)

(assert (=> b!36136 (=> res!30773 e!23840)))

(assert (=> b!36136 (= res!30773 (= (size!850 (buf!1178 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!36137 () Bool)

(assert (=> b!36137 (= e!23840 (arrayBitRangesEq!0 (buf!1178 thiss!1379) (buf!1178 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!850 (buf!1178 thiss!1379)) (currentByte!2563 thiss!1379) (currentBit!2558 thiss!1379))))))

(assert (= (and d!10616 res!30774) b!36135))

(assert (= (and b!36135 res!30775) b!36136))

(assert (= (and b!36136 (not res!30773)) b!36137))

(assert (=> b!36135 m!53721))

(assert (=> b!36135 m!53721))

(assert (=> b!36137 m!53721))

(assert (=> b!36137 m!53721))

(declare-fun m!54383 () Bool)

(assert (=> b!36137 m!54383))

(assert (=> b!35718 d!10616))

(declare-fun d!10618 () Bool)

(assert (=> d!10618 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!54019 () Unit!2627)

(declare-fun choose!11 (BitStream!1474) Unit!2627)

(assert (=> d!10618 (= lt!54019 (choose!11 thiss!1379))))

(assert (=> d!10618 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!54019)))

(declare-fun bs!2855 () Bool)

(assert (= bs!2855 d!10618))

(assert (=> bs!2855 m!53717))

(declare-fun m!54385 () Bool)

(assert (=> bs!2855 m!54385))

(assert (=> b!35718 d!10618))

(declare-fun d!10620 () Bool)

(declare-fun e!23841 () Bool)

(assert (=> d!10620 e!23841))

(declare-fun res!30776 () Bool)

(assert (=> d!10620 (=> (not res!30776) (not e!23841))))

(declare-fun lt!54023 () (_ BitVec 64))

(declare-fun lt!54022 () (_ BitVec 64))

(declare-fun lt!54025 () (_ BitVec 64))

(assert (=> d!10620 (= res!30776 (= lt!54025 (bvsub lt!54023 lt!54022)))))

(assert (=> d!10620 (or (= (bvand lt!54023 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!54022 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!54023 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!54023 lt!54022) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!10620 (= lt!54022 (remainingBits!0 ((_ sign_extend 32) (size!850 (buf!1178 thiss!1379))) ((_ sign_extend 32) (currentByte!2563 thiss!1379)) ((_ sign_extend 32) (currentBit!2558 thiss!1379))))))

(declare-fun lt!54021 () (_ BitVec 64))

(declare-fun lt!54020 () (_ BitVec 64))

(assert (=> d!10620 (= lt!54023 (bvmul lt!54021 lt!54020))))

(assert (=> d!10620 (or (= lt!54021 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!54020 (bvsdiv (bvmul lt!54021 lt!54020) lt!54021)))))

(assert (=> d!10620 (= lt!54020 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!10620 (= lt!54021 ((_ sign_extend 32) (size!850 (buf!1178 thiss!1379))))))

(assert (=> d!10620 (= lt!54025 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2563 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2558 thiss!1379))))))

(assert (=> d!10620 (invariant!0 (currentBit!2558 thiss!1379) (currentByte!2563 thiss!1379) (size!850 (buf!1178 thiss!1379)))))

(assert (=> d!10620 (= (bitIndex!0 (size!850 (buf!1178 thiss!1379)) (currentByte!2563 thiss!1379) (currentBit!2558 thiss!1379)) lt!54025)))

(declare-fun b!36138 () Bool)

(declare-fun res!30777 () Bool)

(assert (=> b!36138 (=> (not res!30777) (not e!23841))))

(assert (=> b!36138 (= res!30777 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!54025))))

(declare-fun b!36139 () Bool)

(declare-fun lt!54024 () (_ BitVec 64))

(assert (=> b!36139 (= e!23841 (bvsle lt!54025 (bvmul lt!54024 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!36139 (or (= lt!54024 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!54024 #b0000000000000000000000000000000000000000000000000000000000001000) lt!54024)))))

(assert (=> b!36139 (= lt!54024 ((_ sign_extend 32) (size!850 (buf!1178 thiss!1379))))))

(assert (= (and d!10620 res!30776) b!36138))

(assert (= (and b!36138 res!30777) b!36139))

(declare-fun m!54387 () Bool)

(assert (=> d!10620 m!54387))

(declare-fun m!54389 () Bool)

(assert (=> d!10620 m!54389))

(assert (=> b!35718 d!10620))

(declare-fun d!10622 () Bool)

(assert (=> d!10622 (= (array_inv!790 srcBuffer!2) (bvsge (size!850 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!7340 d!10622))

(declare-fun d!10624 () Bool)

(assert (=> d!10624 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2558 thiss!1379) (currentByte!2563 thiss!1379) (size!850 (buf!1178 thiss!1379))))))

(declare-fun bs!2856 () Bool)

(assert (= bs!2856 d!10624))

(assert (=> bs!2856 m!54389))

(assert (=> start!7340 d!10624))

(declare-fun d!10626 () Bool)

(assert (=> d!10626 (= (head!275 (byteArrayBitContentToList!0 (_2!1862 lt!53368) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!553 (byteArrayBitContentToList!0 (_2!1862 lt!53368) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!35729 d!10626))

(declare-fun d!10628 () Bool)

(declare-fun c!2470 () Bool)

(assert (=> d!10628 (= c!2470 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!23844 () List!438)

(assert (=> d!10628 (= (byteArrayBitContentToList!0 (_2!1862 lt!53368) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!23844)))

(declare-fun b!36142 () Bool)

(assert (=> b!36142 (= e!23844 Nil!435)))

(declare-fun b!36143 () Bool)

(assert (=> b!36143 (= e!23844 (Cons!434 (not (= (bvand ((_ sign_extend 24) (select (arr!1334 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1862 lt!53368) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!10628 c!2470) b!36142))

(assert (= (and d!10628 (not c!2470)) b!36143))

(assert (=> b!36143 m!53759))

(assert (=> b!36143 m!54119))

(declare-fun m!54391 () Bool)

(assert (=> b!36143 m!54391))

(assert (=> b!35729 d!10628))

(declare-fun d!10630 () Bool)

(assert (=> d!10630 (= (head!275 (bitStreamReadBitsIntoList!0 (_2!1862 lt!53368) (_1!1863 lt!53366) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!553 (bitStreamReadBitsIntoList!0 (_2!1862 lt!53368) (_1!1863 lt!53366) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!35729 d!10630))

(declare-fun d!10632 () Bool)

(declare-fun e!23846 () Bool)

(assert (=> d!10632 e!23846))

(declare-fun c!2471 () Bool)

(assert (=> d!10632 (= c!2471 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!54030 () List!438)

(declare-fun e!23845 () tuple2!3582)

(assert (=> d!10632 (= lt!54030 (_1!1878 e!23845))))

(declare-fun c!2472 () Bool)

(assert (=> d!10632 (= c!2472 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10632 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10632 (= (bitStreamReadBitsIntoList!0 (_2!1862 lt!53368) (_1!1863 lt!53366) #b0000000000000000000000000000000000000000000000000000000000000001) lt!54030)))

(declare-fun b!36145 () Bool)

(declare-fun lt!54032 () tuple2!3584)

(declare-fun lt!54031 () (_ BitVec 64))

(assert (=> b!36145 (= e!23845 (tuple2!3583 (Cons!434 (_1!1879 lt!54032) (bitStreamReadBitsIntoList!0 (_2!1862 lt!53368) (_2!1879 lt!54032) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!54031))) (_2!1879 lt!54032)))))

(assert (=> b!36145 (= lt!54032 (readBit!0 (_1!1863 lt!53366)))))

(assert (=> b!36145 (= lt!54031 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!36146 () Bool)

(assert (=> b!36146 (= e!23846 (isEmpty!101 lt!54030))))

(declare-fun b!36147 () Bool)

(assert (=> b!36147 (= e!23846 (> (length!164 lt!54030) 0))))

(declare-fun b!36144 () Bool)

(assert (=> b!36144 (= e!23845 (tuple2!3583 Nil!435 (_1!1863 lt!53366)))))

(assert (= (and d!10632 c!2472) b!36144))

(assert (= (and d!10632 (not c!2472)) b!36145))

(assert (= (and d!10632 c!2471) b!36146))

(assert (= (and d!10632 (not c!2471)) b!36147))

(declare-fun m!54397 () Bool)

(assert (=> b!36145 m!54397))

(declare-fun m!54399 () Bool)

(assert (=> b!36145 m!54399))

(declare-fun m!54401 () Bool)

(assert (=> b!36146 m!54401))

(declare-fun m!54403 () Bool)

(assert (=> b!36147 m!54403))

(assert (=> b!35729 d!10632))

(declare-fun d!10636 () Bool)

(assert (=> d!10636 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!850 (buf!1178 (_2!1862 lt!53368)))) ((_ sign_extend 32) (currentByte!2563 thiss!1379)) ((_ sign_extend 32) (currentBit!2558 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!850 (buf!1178 (_2!1862 lt!53368)))) ((_ sign_extend 32) (currentByte!2563 thiss!1379)) ((_ sign_extend 32) (currentBit!2558 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2857 () Bool)

(assert (= bs!2857 d!10636))

(declare-fun m!54405 () Bool)

(assert (=> bs!2857 m!54405))

(assert (=> b!35728 d!10636))

(declare-fun d!10640 () Bool)

(assert (=> d!10640 (isPrefixOf!0 thiss!1379 (_2!1862 lt!53369))))

(declare-fun lt!54040 () Unit!2627)

(declare-fun choose!30 (BitStream!1474 BitStream!1474 BitStream!1474) Unit!2627)

(assert (=> d!10640 (= lt!54040 (choose!30 thiss!1379 (_2!1862 lt!53368) (_2!1862 lt!53369)))))

(assert (=> d!10640 (isPrefixOf!0 thiss!1379 (_2!1862 lt!53368))))

(assert (=> d!10640 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1862 lt!53368) (_2!1862 lt!53369)) lt!54040)))

(declare-fun bs!2860 () Bool)

(assert (= bs!2860 d!10640))

(assert (=> bs!2860 m!53731))

(declare-fun m!54411 () Bool)

(assert (=> bs!2860 m!54411))

(assert (=> bs!2860 m!53757))

(assert (=> b!35728 d!10640))

(declare-fun b!36154 () Bool)

(declare-fun e!23851 () Unit!2627)

(declare-fun Unit!2647 () Unit!2627)

(assert (=> b!36154 (= e!23851 Unit!2647)))

(declare-fun b!36155 () Bool)

(declare-fun res!30787 () Bool)

(declare-fun e!23852 () Bool)

(assert (=> b!36155 (=> (not res!30787) (not e!23852))))

(declare-fun lt!54051 () tuple2!3552)

(assert (=> b!36155 (= res!30787 (isPrefixOf!0 (_2!1863 lt!54051) (_2!1862 lt!53368)))))

(declare-fun b!36156 () Bool)

(declare-fun lt!54066 () Unit!2627)

(assert (=> b!36156 (= e!23851 lt!54066)))

(declare-fun lt!54054 () (_ BitVec 64))

(assert (=> b!36156 (= lt!54054 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!54050 () (_ BitVec 64))

(assert (=> b!36156 (= lt!54050 (bitIndex!0 (size!850 (buf!1178 thiss!1379)) (currentByte!2563 thiss!1379) (currentBit!2558 thiss!1379)))))

(assert (=> b!36156 (= lt!54066 (arrayBitRangesEqSymmetric!0 (buf!1178 thiss!1379) (buf!1178 (_2!1862 lt!53368)) lt!54054 lt!54050))))

(assert (=> b!36156 (arrayBitRangesEq!0 (buf!1178 (_2!1862 lt!53368)) (buf!1178 thiss!1379) lt!54054 lt!54050)))

(declare-fun d!10646 () Bool)

(assert (=> d!10646 e!23852))

(declare-fun res!30786 () Bool)

(assert (=> d!10646 (=> (not res!30786) (not e!23852))))

(assert (=> d!10646 (= res!30786 (isPrefixOf!0 (_1!1863 lt!54051) (_2!1863 lt!54051)))))

(declare-fun lt!54062 () BitStream!1474)

(assert (=> d!10646 (= lt!54051 (tuple2!3553 lt!54062 (_2!1862 lt!53368)))))

(declare-fun lt!54061 () Unit!2627)

(declare-fun lt!54052 () Unit!2627)

(assert (=> d!10646 (= lt!54061 lt!54052)))

(assert (=> d!10646 (isPrefixOf!0 lt!54062 (_2!1862 lt!53368))))

(assert (=> d!10646 (= lt!54052 (lemmaIsPrefixTransitive!0 lt!54062 (_2!1862 lt!53368) (_2!1862 lt!53368)))))

(declare-fun lt!54048 () Unit!2627)

(declare-fun lt!54059 () Unit!2627)

(assert (=> d!10646 (= lt!54048 lt!54059)))

(assert (=> d!10646 (isPrefixOf!0 lt!54062 (_2!1862 lt!53368))))

(assert (=> d!10646 (= lt!54059 (lemmaIsPrefixTransitive!0 lt!54062 thiss!1379 (_2!1862 lt!53368)))))

(declare-fun lt!54064 () Unit!2627)

(assert (=> d!10646 (= lt!54064 e!23851)))

(declare-fun c!2473 () Bool)

(assert (=> d!10646 (= c!2473 (not (= (size!850 (buf!1178 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!54049 () Unit!2627)

(declare-fun lt!54055 () Unit!2627)

(assert (=> d!10646 (= lt!54049 lt!54055)))

(assert (=> d!10646 (isPrefixOf!0 (_2!1862 lt!53368) (_2!1862 lt!53368))))

(assert (=> d!10646 (= lt!54055 (lemmaIsPrefixRefl!0 (_2!1862 lt!53368)))))

(declare-fun lt!54053 () Unit!2627)

(declare-fun lt!54057 () Unit!2627)

(assert (=> d!10646 (= lt!54053 lt!54057)))

(assert (=> d!10646 (= lt!54057 (lemmaIsPrefixRefl!0 (_2!1862 lt!53368)))))

(declare-fun lt!54060 () Unit!2627)

(declare-fun lt!54047 () Unit!2627)

(assert (=> d!10646 (= lt!54060 lt!54047)))

(assert (=> d!10646 (isPrefixOf!0 lt!54062 lt!54062)))

(assert (=> d!10646 (= lt!54047 (lemmaIsPrefixRefl!0 lt!54062))))

(declare-fun lt!54063 () Unit!2627)

(declare-fun lt!54058 () Unit!2627)

(assert (=> d!10646 (= lt!54063 lt!54058)))

(assert (=> d!10646 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!10646 (= lt!54058 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!10646 (= lt!54062 (BitStream!1475 (buf!1178 (_2!1862 lt!53368)) (currentByte!2563 thiss!1379) (currentBit!2558 thiss!1379)))))

(assert (=> d!10646 (isPrefixOf!0 thiss!1379 (_2!1862 lt!53368))))

(assert (=> d!10646 (= (reader!0 thiss!1379 (_2!1862 lt!53368)) lt!54051)))

(declare-fun lt!54065 () (_ BitVec 64))

(declare-fun b!36157 () Bool)

(declare-fun lt!54056 () (_ BitVec 64))

(assert (=> b!36157 (= e!23852 (= (_1!1863 lt!54051) (withMovedBitIndex!0 (_2!1863 lt!54051) (bvsub lt!54065 lt!54056))))))

(assert (=> b!36157 (or (= (bvand lt!54065 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!54056 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!54065 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!54065 lt!54056) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!36157 (= lt!54056 (bitIndex!0 (size!850 (buf!1178 (_2!1862 lt!53368))) (currentByte!2563 (_2!1862 lt!53368)) (currentBit!2558 (_2!1862 lt!53368))))))

(assert (=> b!36157 (= lt!54065 (bitIndex!0 (size!850 (buf!1178 thiss!1379)) (currentByte!2563 thiss!1379) (currentBit!2558 thiss!1379)))))

(declare-fun b!36158 () Bool)

(declare-fun res!30788 () Bool)

(assert (=> b!36158 (=> (not res!30788) (not e!23852))))

(assert (=> b!36158 (= res!30788 (isPrefixOf!0 (_1!1863 lt!54051) thiss!1379))))

(assert (= (and d!10646 c!2473) b!36156))

(assert (= (and d!10646 (not c!2473)) b!36154))

(assert (= (and d!10646 res!30786) b!36158))

(assert (= (and b!36158 res!30788) b!36155))

(assert (= (and b!36155 res!30787) b!36157))

(assert (=> b!36156 m!53721))

(declare-fun m!54415 () Bool)

(assert (=> b!36156 m!54415))

(declare-fun m!54417 () Bool)

(assert (=> b!36156 m!54417))

(declare-fun m!54419 () Bool)

(assert (=> d!10646 m!54419))

(declare-fun m!54421 () Bool)

(assert (=> d!10646 m!54421))

(assert (=> d!10646 m!53719))

(assert (=> d!10646 m!53757))

(assert (=> d!10646 m!54303))

(declare-fun m!54423 () Bool)

(assert (=> d!10646 m!54423))

(assert (=> d!10646 m!53717))

(declare-fun m!54425 () Bool)

(assert (=> d!10646 m!54425))

(assert (=> d!10646 m!54309))

(declare-fun m!54427 () Bool)

(assert (=> d!10646 m!54427))

(declare-fun m!54429 () Bool)

(assert (=> d!10646 m!54429))

(declare-fun m!54431 () Bool)

(assert (=> b!36155 m!54431))

(declare-fun m!54433 () Bool)

(assert (=> b!36158 m!54433))

(declare-fun m!54435 () Bool)

(assert (=> b!36157 m!54435))

(assert (=> b!36157 m!53775))

(assert (=> b!36157 m!53721))

(assert (=> b!35728 d!10646))

(declare-fun d!10652 () Bool)

(declare-fun res!30793 () Bool)

(declare-fun e!23855 () Bool)

(assert (=> d!10652 (=> (not res!30793) (not e!23855))))

(assert (=> d!10652 (= res!30793 (= (size!850 (buf!1178 thiss!1379)) (size!850 (buf!1178 (_2!1862 lt!53369)))))))

(assert (=> d!10652 (= (isPrefixOf!0 thiss!1379 (_2!1862 lt!53369)) e!23855)))

(declare-fun b!36164 () Bool)

(declare-fun res!30794 () Bool)

(assert (=> b!36164 (=> (not res!30794) (not e!23855))))

(assert (=> b!36164 (= res!30794 (bvsle (bitIndex!0 (size!850 (buf!1178 thiss!1379)) (currentByte!2563 thiss!1379) (currentBit!2558 thiss!1379)) (bitIndex!0 (size!850 (buf!1178 (_2!1862 lt!53369))) (currentByte!2563 (_2!1862 lt!53369)) (currentBit!2558 (_2!1862 lt!53369)))))))

(declare-fun b!36165 () Bool)

(declare-fun e!23856 () Bool)

(assert (=> b!36165 (= e!23855 e!23856)))

(declare-fun res!30792 () Bool)

(assert (=> b!36165 (=> res!30792 e!23856)))

(assert (=> b!36165 (= res!30792 (= (size!850 (buf!1178 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!36166 () Bool)

(assert (=> b!36166 (= e!23856 (arrayBitRangesEq!0 (buf!1178 thiss!1379) (buf!1178 (_2!1862 lt!53369)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!850 (buf!1178 thiss!1379)) (currentByte!2563 thiss!1379) (currentBit!2558 thiss!1379))))))

(assert (= (and d!10652 res!30793) b!36164))

(assert (= (and b!36164 res!30794) b!36165))

(assert (= (and b!36165 (not res!30792)) b!36166))

(assert (=> b!36164 m!53721))

(assert (=> b!36164 m!53773))

(assert (=> b!36166 m!53721))

(assert (=> b!36166 m!53721))

(declare-fun m!54457 () Bool)

(assert (=> b!36166 m!54457))

(assert (=> b!35728 d!10652))

(declare-fun b!36239 () Bool)

(declare-fun res!30853 () Bool)

(declare-fun e!23887 () Bool)

(assert (=> b!36239 (=> (not res!30853) (not e!23887))))

(declare-fun lt!54454 () tuple2!3550)

(assert (=> b!36239 (= res!30853 (isPrefixOf!0 (_2!1862 lt!53368) (_2!1862 lt!54454)))))

(declare-fun d!10654 () Bool)

(assert (=> d!10654 e!23887))

(declare-fun res!30855 () Bool)

(assert (=> d!10654 (=> (not res!30855) (not e!23887))))

(declare-fun lt!54464 () (_ BitVec 64))

(assert (=> d!10654 (= res!30855 (= (bitIndex!0 (size!850 (buf!1178 (_2!1862 lt!54454))) (currentByte!2563 (_2!1862 lt!54454)) (currentBit!2558 (_2!1862 lt!54454))) (bvsub lt!54464 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!10654 (or (= (bvand lt!54464 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!54464 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!54464 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!54452 () (_ BitVec 64))

(assert (=> d!10654 (= lt!54464 (bvadd lt!54452 to!314))))

(assert (=> d!10654 (or (not (= (bvand lt!54452 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!54452 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!54452 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!10654 (= lt!54452 (bitIndex!0 (size!850 (buf!1178 (_2!1862 lt!53368))) (currentByte!2563 (_2!1862 lt!53368)) (currentBit!2558 (_2!1862 lt!53368))))))

(declare-fun e!23889 () tuple2!3550)

(assert (=> d!10654 (= lt!54454 e!23889)))

(declare-fun c!2483 () Bool)

(assert (=> d!10654 (= c!2483 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!54442 () Unit!2627)

(declare-fun lt!54450 () Unit!2627)

(assert (=> d!10654 (= lt!54442 lt!54450)))

(assert (=> d!10654 (isPrefixOf!0 (_2!1862 lt!53368) (_2!1862 lt!53368))))

(assert (=> d!10654 (= lt!54450 (lemmaIsPrefixRefl!0 (_2!1862 lt!53368)))))

(declare-fun lt!54465 () (_ BitVec 64))

(assert (=> d!10654 (= lt!54465 (bitIndex!0 (size!850 (buf!1178 (_2!1862 lt!53368))) (currentByte!2563 (_2!1862 lt!53368)) (currentBit!2558 (_2!1862 lt!53368))))))

(assert (=> d!10654 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10654 (= (appendBitsMSBFirstLoop!0 (_2!1862 lt!53368) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!54454)))

(declare-fun b!36240 () Bool)

(declare-fun res!30854 () Bool)

(assert (=> b!36240 (=> (not res!30854) (not e!23887))))

(assert (=> b!36240 (= res!30854 (= (size!850 (buf!1178 (_2!1862 lt!53368))) (size!850 (buf!1178 (_2!1862 lt!54454)))))))

(declare-fun b!36241 () Bool)

(declare-fun lt!54471 () tuple2!3552)

(assert (=> b!36241 (= e!23887 (= (bitStreamReadBitsIntoList!0 (_2!1862 lt!54454) (_1!1863 lt!54471) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1862 lt!54454) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!36241 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!36241 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!54448 () Unit!2627)

(declare-fun lt!54441 () Unit!2627)

(assert (=> b!36241 (= lt!54448 lt!54441)))

(declare-fun lt!54466 () (_ BitVec 64))

(assert (=> b!36241 (validate_offset_bits!1 ((_ sign_extend 32) (size!850 (buf!1178 (_2!1862 lt!54454)))) ((_ sign_extend 32) (currentByte!2563 (_2!1862 lt!53368))) ((_ sign_extend 32) (currentBit!2558 (_2!1862 lt!53368))) lt!54466)))

(assert (=> b!36241 (= lt!54441 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1862 lt!53368) (buf!1178 (_2!1862 lt!54454)) lt!54466))))

(declare-fun e!23888 () Bool)

(assert (=> b!36241 e!23888))

(declare-fun res!30852 () Bool)

(assert (=> b!36241 (=> (not res!30852) (not e!23888))))

(assert (=> b!36241 (= res!30852 (and (= (size!850 (buf!1178 (_2!1862 lt!53368))) (size!850 (buf!1178 (_2!1862 lt!54454)))) (bvsge lt!54466 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!36241 (= lt!54466 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!36241 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!36241 (= lt!54471 (reader!0 (_2!1862 lt!53368) (_2!1862 lt!54454)))))

(declare-fun b!36242 () Bool)

(assert (=> b!36242 (= e!23888 (validate_offset_bits!1 ((_ sign_extend 32) (size!850 (buf!1178 (_2!1862 lt!53368)))) ((_ sign_extend 32) (currentByte!2563 (_2!1862 lt!53368))) ((_ sign_extend 32) (currentBit!2558 (_2!1862 lt!53368))) lt!54466))))

(declare-fun b!36243 () Bool)

(declare-fun res!30856 () Bool)

(assert (=> b!36243 (=> (not res!30856) (not e!23887))))

(assert (=> b!36243 (= res!30856 (invariant!0 (currentBit!2558 (_2!1862 lt!54454)) (currentByte!2563 (_2!1862 lt!54454)) (size!850 (buf!1178 (_2!1862 lt!54454)))))))

(declare-fun lt!54473 () tuple2!3550)

(declare-fun lt!54447 () tuple2!3550)

(declare-fun call!453 () tuple2!3552)

(declare-fun bm!450 () Bool)

(assert (=> bm!450 (= call!453 (reader!0 (ite c!2483 (_2!1862 lt!54473) (_2!1862 lt!53368)) (ite c!2483 (_2!1862 lt!54447) (_2!1862 lt!53368))))))

(declare-fun b!36244 () Bool)

(declare-fun Unit!2649 () Unit!2627)

(assert (=> b!36244 (= e!23889 (tuple2!3551 Unit!2649 (_2!1862 lt!54447)))))

(assert (=> b!36244 (= lt!54473 (appendBitFromByte!0 (_2!1862 lt!53368) (select (arr!1334 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!54449 () (_ BitVec 64))

(assert (=> b!36244 (= lt!54449 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!54444 () (_ BitVec 64))

(assert (=> b!36244 (= lt!54444 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!54445 () Unit!2627)

(assert (=> b!36244 (= lt!54445 (validateOffsetBitsIneqLemma!0 (_2!1862 lt!53368) (_2!1862 lt!54473) lt!54449 lt!54444))))

(assert (=> b!36244 (validate_offset_bits!1 ((_ sign_extend 32) (size!850 (buf!1178 (_2!1862 lt!54473)))) ((_ sign_extend 32) (currentByte!2563 (_2!1862 lt!54473))) ((_ sign_extend 32) (currentBit!2558 (_2!1862 lt!54473))) (bvsub lt!54449 lt!54444))))

(declare-fun lt!54446 () Unit!2627)

(assert (=> b!36244 (= lt!54446 lt!54445)))

(declare-fun lt!54443 () tuple2!3552)

(assert (=> b!36244 (= lt!54443 (reader!0 (_2!1862 lt!53368) (_2!1862 lt!54473)))))

(declare-fun lt!54458 () (_ BitVec 64))

(assert (=> b!36244 (= lt!54458 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!54460 () Unit!2627)

(assert (=> b!36244 (= lt!54460 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1862 lt!53368) (buf!1178 (_2!1862 lt!54473)) lt!54458))))

(assert (=> b!36244 (validate_offset_bits!1 ((_ sign_extend 32) (size!850 (buf!1178 (_2!1862 lt!54473)))) ((_ sign_extend 32) (currentByte!2563 (_2!1862 lt!53368))) ((_ sign_extend 32) (currentBit!2558 (_2!1862 lt!53368))) lt!54458)))

(declare-fun lt!54439 () Unit!2627)

(assert (=> b!36244 (= lt!54439 lt!54460)))

(assert (=> b!36244 (= (head!275 (byteArrayBitContentToList!0 (_2!1862 lt!54473) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!275 (bitStreamReadBitsIntoList!0 (_2!1862 lt!54473) (_1!1863 lt!54443) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!54472 () Unit!2627)

(declare-fun Unit!2650 () Unit!2627)

(assert (=> b!36244 (= lt!54472 Unit!2650)))

(assert (=> b!36244 (= lt!54447 (appendBitsMSBFirstLoop!0 (_2!1862 lt!54473) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!54463 () Unit!2627)

(assert (=> b!36244 (= lt!54463 (lemmaIsPrefixTransitive!0 (_2!1862 lt!53368) (_2!1862 lt!54473) (_2!1862 lt!54447)))))

(assert (=> b!36244 (isPrefixOf!0 (_2!1862 lt!53368) (_2!1862 lt!54447))))

(declare-fun lt!54436 () Unit!2627)

(assert (=> b!36244 (= lt!54436 lt!54463)))

(assert (=> b!36244 (= (size!850 (buf!1178 (_2!1862 lt!54447))) (size!850 (buf!1178 (_2!1862 lt!53368))))))

(declare-fun lt!54432 () Unit!2627)

(declare-fun Unit!2651 () Unit!2627)

(assert (=> b!36244 (= lt!54432 Unit!2651)))

(assert (=> b!36244 (= (bitIndex!0 (size!850 (buf!1178 (_2!1862 lt!54447))) (currentByte!2563 (_2!1862 lt!54447)) (currentBit!2558 (_2!1862 lt!54447))) (bvsub (bvadd (bitIndex!0 (size!850 (buf!1178 (_2!1862 lt!53368))) (currentByte!2563 (_2!1862 lt!53368)) (currentBit!2558 (_2!1862 lt!53368))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!54469 () Unit!2627)

(declare-fun Unit!2652 () Unit!2627)

(assert (=> b!36244 (= lt!54469 Unit!2652)))

(assert (=> b!36244 (= (bitIndex!0 (size!850 (buf!1178 (_2!1862 lt!54447))) (currentByte!2563 (_2!1862 lt!54447)) (currentBit!2558 (_2!1862 lt!54447))) (bvsub (bvsub (bvadd (bitIndex!0 (size!850 (buf!1178 (_2!1862 lt!54473))) (currentByte!2563 (_2!1862 lt!54473)) (currentBit!2558 (_2!1862 lt!54473))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!54440 () Unit!2627)

(declare-fun Unit!2653 () Unit!2627)

(assert (=> b!36244 (= lt!54440 Unit!2653)))

(declare-fun lt!54453 () tuple2!3552)

(assert (=> b!36244 (= lt!54453 (reader!0 (_2!1862 lt!53368) (_2!1862 lt!54447)))))

(declare-fun lt!54461 () (_ BitVec 64))

(assert (=> b!36244 (= lt!54461 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!54467 () Unit!2627)

(assert (=> b!36244 (= lt!54467 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1862 lt!53368) (buf!1178 (_2!1862 lt!54447)) lt!54461))))

(assert (=> b!36244 (validate_offset_bits!1 ((_ sign_extend 32) (size!850 (buf!1178 (_2!1862 lt!54447)))) ((_ sign_extend 32) (currentByte!2563 (_2!1862 lt!53368))) ((_ sign_extend 32) (currentBit!2558 (_2!1862 lt!53368))) lt!54461)))

(declare-fun lt!54433 () Unit!2627)

(assert (=> b!36244 (= lt!54433 lt!54467)))

(declare-fun lt!54474 () tuple2!3552)

(assert (=> b!36244 (= lt!54474 call!453)))

(declare-fun lt!54435 () (_ BitVec 64))

(assert (=> b!36244 (= lt!54435 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!54459 () Unit!2627)

(assert (=> b!36244 (= lt!54459 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1862 lt!54473) (buf!1178 (_2!1862 lt!54447)) lt!54435))))

(assert (=> b!36244 (validate_offset_bits!1 ((_ sign_extend 32) (size!850 (buf!1178 (_2!1862 lt!54447)))) ((_ sign_extend 32) (currentByte!2563 (_2!1862 lt!54473))) ((_ sign_extend 32) (currentBit!2558 (_2!1862 lt!54473))) lt!54435)))

(declare-fun lt!54437 () Unit!2627)

(assert (=> b!36244 (= lt!54437 lt!54459)))

(declare-fun lt!54475 () List!438)

(assert (=> b!36244 (= lt!54475 (byteArrayBitContentToList!0 (_2!1862 lt!54447) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!54451 () List!438)

(assert (=> b!36244 (= lt!54451 (byteArrayBitContentToList!0 (_2!1862 lt!54447) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!54457 () List!438)

(assert (=> b!36244 (= lt!54457 (bitStreamReadBitsIntoList!0 (_2!1862 lt!54447) (_1!1863 lt!54453) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!54456 () List!438)

(assert (=> b!36244 (= lt!54456 (bitStreamReadBitsIntoList!0 (_2!1862 lt!54447) (_1!1863 lt!54474) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!54455 () (_ BitVec 64))

(assert (=> b!36244 (= lt!54455 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!54434 () Unit!2627)

(assert (=> b!36244 (= lt!54434 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1862 lt!54447) (_2!1862 lt!54447) (_1!1863 lt!54453) (_1!1863 lt!54474) lt!54455 lt!54457))))

(assert (=> b!36244 (= (bitStreamReadBitsIntoList!0 (_2!1862 lt!54447) (_1!1863 lt!54474) (bvsub lt!54455 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!155 lt!54457))))

(declare-fun lt!54438 () Unit!2627)

(assert (=> b!36244 (= lt!54438 lt!54434)))

(declare-fun lt!54470 () Unit!2627)

(assert (=> b!36244 (= lt!54470 (arrayBitRangesEqImpliesEq!0 (buf!1178 (_2!1862 lt!54473)) (buf!1178 (_2!1862 lt!54447)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!54465 (bitIndex!0 (size!850 (buf!1178 (_2!1862 lt!54473))) (currentByte!2563 (_2!1862 lt!54473)) (currentBit!2558 (_2!1862 lt!54473)))))))

(assert (=> b!36244 (= (bitAt!0 (buf!1178 (_2!1862 lt!54473)) lt!54465) (bitAt!0 (buf!1178 (_2!1862 lt!54447)) lt!54465))))

(declare-fun lt!54462 () Unit!2627)

(assert (=> b!36244 (= lt!54462 lt!54470)))

(declare-fun b!36245 () Bool)

(declare-fun Unit!2654 () Unit!2627)

(assert (=> b!36245 (= e!23889 (tuple2!3551 Unit!2654 (_2!1862 lt!53368)))))

(assert (=> b!36245 (= (size!850 (buf!1178 (_2!1862 lt!53368))) (size!850 (buf!1178 (_2!1862 lt!53368))))))

(declare-fun lt!54468 () Unit!2627)

(declare-fun Unit!2655 () Unit!2627)

(assert (=> b!36245 (= lt!54468 Unit!2655)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1474 array!1907 array!1907 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!36245 (checkByteArrayBitContent!0 (_2!1862 lt!53368) srcBuffer!2 (_1!1872 (readBits!0 (_1!1863 call!453) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!36246 () Bool)

(declare-fun res!30851 () Bool)

(assert (=> b!36246 (=> (not res!30851) (not e!23887))))

(assert (=> b!36246 (= res!30851 (= (size!850 (buf!1178 (_2!1862 lt!54454))) (size!850 (buf!1178 (_2!1862 lt!53368)))))))

(assert (= (and d!10654 c!2483) b!36244))

(assert (= (and d!10654 (not c!2483)) b!36245))

(assert (= (or b!36244 b!36245) bm!450))

(assert (= (and d!10654 res!30855) b!36243))

(assert (= (and b!36243 res!30856) b!36240))

(assert (= (and b!36240 res!30854) b!36239))

(assert (= (and b!36239 res!30853) b!36246))

(assert (= (and b!36246 res!30851) b!36241))

(assert (= (and b!36241 res!30852) b!36242))

(declare-fun m!54593 () Bool)

(assert (=> b!36242 m!54593))

(declare-fun m!54595 () Bool)

(assert (=> b!36239 m!54595))

(declare-fun m!54597 () Bool)

(assert (=> b!36243 m!54597))

(declare-fun m!54599 () Bool)

(assert (=> b!36241 m!54599))

(declare-fun m!54603 () Bool)

(assert (=> b!36241 m!54603))

(declare-fun m!54605 () Bool)

(assert (=> b!36241 m!54605))

(declare-fun m!54609 () Bool)

(assert (=> b!36241 m!54609))

(declare-fun m!54613 () Bool)

(assert (=> b!36241 m!54613))

(declare-fun m!54619 () Bool)

(assert (=> d!10654 m!54619))

(assert (=> d!10654 m!53775))

(assert (=> d!10654 m!54309))

(assert (=> d!10654 m!54303))

(declare-fun m!54625 () Bool)

(assert (=> b!36245 m!54625))

(declare-fun m!54627 () Bool)

(assert (=> b!36245 m!54627))

(declare-fun m!54631 () Bool)

(assert (=> bm!450 m!54631))

(declare-fun m!54635 () Bool)

(assert (=> b!36244 m!54635))

(declare-fun m!54639 () Bool)

(assert (=> b!36244 m!54639))

(declare-fun m!54643 () Bool)

(assert (=> b!36244 m!54643))

(declare-fun m!54647 () Bool)

(assert (=> b!36244 m!54647))

(assert (=> b!36244 m!54635))

(declare-fun m!54653 () Bool)

(assert (=> b!36244 m!54653))

(assert (=> b!36244 m!53775))

(declare-fun m!54657 () Bool)

(assert (=> b!36244 m!54657))

(declare-fun m!54661 () Bool)

(assert (=> b!36244 m!54661))

(declare-fun m!54665 () Bool)

(assert (=> b!36244 m!54665))

(declare-fun m!54667 () Bool)

(assert (=> b!36244 m!54667))

(declare-fun m!54671 () Bool)

(assert (=> b!36244 m!54671))

(declare-fun m!54675 () Bool)

(assert (=> b!36244 m!54675))

(declare-fun m!54679 () Bool)

(assert (=> b!36244 m!54679))

(declare-fun m!54683 () Bool)

(assert (=> b!36244 m!54683))

(declare-fun m!54689 () Bool)

(assert (=> b!36244 m!54689))

(declare-fun m!54693 () Bool)

(assert (=> b!36244 m!54693))

(declare-fun m!54697 () Bool)

(assert (=> b!36244 m!54697))

(declare-fun m!54701 () Bool)

(assert (=> b!36244 m!54701))

(declare-fun m!54705 () Bool)

(assert (=> b!36244 m!54705))

(declare-fun m!54709 () Bool)

(assert (=> b!36244 m!54709))

(declare-fun m!54713 () Bool)

(assert (=> b!36244 m!54713))

(declare-fun m!54717 () Bool)

(assert (=> b!36244 m!54717))

(declare-fun m!54719 () Bool)

(assert (=> b!36244 m!54719))

(declare-fun m!54721 () Bool)

(assert (=> b!36244 m!54721))

(assert (=> b!36244 m!54679))

(declare-fun m!54727 () Bool)

(assert (=> b!36244 m!54727))

(declare-fun m!54731 () Bool)

(assert (=> b!36244 m!54731))

(declare-fun m!54733 () Bool)

(assert (=> b!36244 m!54733))

(assert (=> b!36244 m!54697))

(declare-fun m!54737 () Bool)

(assert (=> b!36244 m!54737))

(assert (=> b!36244 m!54705))

(declare-fun m!54743 () Bool)

(assert (=> b!36244 m!54743))

(declare-fun m!54747 () Bool)

(assert (=> b!36244 m!54747))

(declare-fun m!54751 () Bool)

(assert (=> b!36244 m!54751))

(declare-fun m!54753 () Bool)

(assert (=> b!36244 m!54753))

(assert (=> b!35728 d!10654))

(declare-fun d!10692 () Bool)

(assert (=> d!10692 (validate_offset_bits!1 ((_ sign_extend 32) (size!850 (buf!1178 (_2!1862 lt!53368)))) ((_ sign_extend 32) (currentByte!2563 thiss!1379)) ((_ sign_extend 32) (currentBit!2558 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!54520 () Unit!2627)

(assert (=> d!10692 (= lt!54520 (choose!9 thiss!1379 (buf!1178 (_2!1862 lt!53368)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1475 (buf!1178 (_2!1862 lt!53368)) (currentByte!2563 thiss!1379) (currentBit!2558 thiss!1379))))))

(assert (=> d!10692 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1178 (_2!1862 lt!53368)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!54520)))

(declare-fun bs!2871 () Bool)

(assert (= bs!2871 d!10692))

(assert (=> bs!2871 m!53735))

(declare-fun m!54765 () Bool)

(assert (=> bs!2871 m!54765))

(assert (=> b!35728 d!10692))

(declare-fun d!10696 () Bool)

(declare-fun res!30867 () Bool)

(declare-fun e!23895 () Bool)

(assert (=> d!10696 (=> (not res!30867) (not e!23895))))

(assert (=> d!10696 (= res!30867 (= (size!850 (buf!1178 (_2!1862 lt!53368))) (size!850 (buf!1178 (_2!1862 lt!53369)))))))

(assert (=> d!10696 (= (isPrefixOf!0 (_2!1862 lt!53368) (_2!1862 lt!53369)) e!23895)))

(declare-fun b!36258 () Bool)

(declare-fun res!30868 () Bool)

(assert (=> b!36258 (=> (not res!30868) (not e!23895))))

(assert (=> b!36258 (= res!30868 (bvsle (bitIndex!0 (size!850 (buf!1178 (_2!1862 lt!53368))) (currentByte!2563 (_2!1862 lt!53368)) (currentBit!2558 (_2!1862 lt!53368))) (bitIndex!0 (size!850 (buf!1178 (_2!1862 lt!53369))) (currentByte!2563 (_2!1862 lt!53369)) (currentBit!2558 (_2!1862 lt!53369)))))))

(declare-fun b!36259 () Bool)

(declare-fun e!23896 () Bool)

(assert (=> b!36259 (= e!23895 e!23896)))

(declare-fun res!30866 () Bool)

(assert (=> b!36259 (=> res!30866 e!23896)))

(assert (=> b!36259 (= res!30866 (= (size!850 (buf!1178 (_2!1862 lt!53368))) #b00000000000000000000000000000000))))

(declare-fun b!36260 () Bool)

(assert (=> b!36260 (= e!23896 (arrayBitRangesEq!0 (buf!1178 (_2!1862 lt!53368)) (buf!1178 (_2!1862 lt!53369)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!850 (buf!1178 (_2!1862 lt!53368))) (currentByte!2563 (_2!1862 lt!53368)) (currentBit!2558 (_2!1862 lt!53368)))))))

(assert (= (and d!10696 res!30867) b!36258))

(assert (= (and b!36258 res!30868) b!36259))

(assert (= (and b!36259 (not res!30866)) b!36260))

(assert (=> b!36258 m!53775))

(assert (=> b!36258 m!53773))

(assert (=> b!36260 m!53775))

(assert (=> b!36260 m!53775))

(declare-fun m!54771 () Bool)

(assert (=> b!36260 m!54771))

(assert (=> b!35728 d!10696))

(declare-fun d!10702 () Bool)

(assert (=> d!10702 (= (head!275 lt!53377) (h!553 lt!53377))))

(assert (=> b!35717 d!10702))

(declare-fun d!10704 () Bool)

(assert (=> d!10704 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!850 (buf!1178 thiss!1379))) ((_ sign_extend 32) (currentByte!2563 thiss!1379)) ((_ sign_extend 32) (currentBit!2558 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!850 (buf!1178 thiss!1379))) ((_ sign_extend 32) (currentByte!2563 thiss!1379)) ((_ sign_extend 32) (currentBit!2558 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2873 () Bool)

(assert (= bs!2873 d!10704))

(assert (=> bs!2873 m!54387))

(assert (=> b!35727 d!10704))

(declare-fun d!10706 () Bool)

(assert (=> d!10706 (= (bitAt!0 (buf!1178 (_2!1862 lt!53368)) lt!53383) (not (= (bvand ((_ sign_extend 24) (select (arr!1334 (buf!1178 (_2!1862 lt!53368))) ((_ extract 31 0) (bvsdiv lt!53383 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!53383 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2874 () Bool)

(assert (= bs!2874 d!10706))

(declare-fun m!54775 () Bool)

(assert (=> bs!2874 m!54775))

(assert (=> bs!2874 m!54177))

(assert (=> b!35726 d!10706))

(declare-fun d!10710 () Bool)

(assert (=> d!10710 (= (bitAt!0 (buf!1178 (_2!1862 lt!53369)) lt!53383) (not (= (bvand ((_ sign_extend 24) (select (arr!1334 (buf!1178 (_2!1862 lt!53369))) ((_ extract 31 0) (bvsdiv lt!53383 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!53383 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2875 () Bool)

(assert (= bs!2875 d!10710))

(declare-fun m!54777 () Bool)

(assert (=> bs!2875 m!54777))

(assert (=> bs!2875 m!54177))

(assert (=> b!35737 d!10710))

(declare-fun d!10716 () Bool)

(assert (=> d!10716 (= (bitAt!0 (buf!1178 (_2!1862 lt!53368)) lt!53383) (bitAt!0 (buf!1178 (_2!1862 lt!53369)) lt!53383))))

(declare-fun lt!54532 () Unit!2627)

(declare-fun choose!31 (array!1907 array!1907 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2627)

(assert (=> d!10716 (= lt!54532 (choose!31 (buf!1178 (_2!1862 lt!53368)) (buf!1178 (_2!1862 lt!53369)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!53383 lt!53376))))

(assert (=> d!10716 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!53376))))

(assert (=> d!10716 (= (arrayBitRangesEqImpliesEq!0 (buf!1178 (_2!1862 lt!53368)) (buf!1178 (_2!1862 lt!53369)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!53383 lt!53376) lt!54532)))

(declare-fun bs!2878 () Bool)

(assert (= bs!2878 d!10716))

(assert (=> bs!2878 m!53787))

(assert (=> bs!2878 m!53767))

(declare-fun m!54793 () Bool)

(assert (=> bs!2878 m!54793))

(assert (=> b!35737 d!10716))

(declare-fun d!10730 () Bool)

(assert (=> d!10730 (= (invariant!0 (currentBit!2558 (_2!1862 lt!53369)) (currentByte!2563 (_2!1862 lt!53369)) (size!850 (buf!1178 (_2!1862 lt!53369)))) (and (bvsge (currentBit!2558 (_2!1862 lt!53369)) #b00000000000000000000000000000000) (bvslt (currentBit!2558 (_2!1862 lt!53369)) #b00000000000000000000000000001000) (bvsge (currentByte!2563 (_2!1862 lt!53369)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2563 (_2!1862 lt!53369)) (size!850 (buf!1178 (_2!1862 lt!53369)))) (and (= (currentBit!2558 (_2!1862 lt!53369)) #b00000000000000000000000000000000) (= (currentByte!2563 (_2!1862 lt!53369)) (size!850 (buf!1178 (_2!1862 lt!53369))))))))))

(assert (=> b!35736 d!10730))

(declare-fun d!10732 () Bool)

(assert (=> d!10732 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!850 (buf!1178 (_1!1863 lt!53362)))) ((_ sign_extend 32) (currentByte!2563 (_1!1863 lt!53362))) ((_ sign_extend 32) (currentBit!2558 (_1!1863 lt!53362)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!850 (buf!1178 (_1!1863 lt!53362)))) ((_ sign_extend 32) (currentByte!2563 (_1!1863 lt!53362))) ((_ sign_extend 32) (currentBit!2558 (_1!1863 lt!53362)))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2879 () Bool)

(assert (= bs!2879 d!10732))

(declare-fun m!54795 () Bool)

(assert (=> bs!2879 m!54795))

(assert (=> b!35725 d!10732))

(push 1)

(assert (not b!36124))

(assert (not b!35944))

(assert (not b!36123))

(assert (not b!36119))

(assert (not d!10498))

(assert (not b!36100))

(assert (not b!36166))

(assert (not b!35985))

(assert (not b!36101))

(assert (not b!36137))

(assert (not d!10506))

(assert (not b!35982))

(assert (not b!36133))

(assert (not b!35984))

(assert (not d!10692))

(assert (not b!35987))

(assert (not d!10704))

(assert (not b!36244))

(assert (not b!36118))

(assert (not d!10572))

(assert (not d!10574))

(assert (not d!10602))

(assert (not b!36147))

(assert (not d!10716))

(assert (not d!10578))

(assert (not b!36103))

(assert (not d!10580))

(assert (not b!36143))

(assert (not d!10646))

(assert (not b!36121))

(assert (not b!36146))

(assert (not b!35986))

(assert (not b!36242))

(assert (not b!35980))

(assert (not b!36102))

(assert (not b!35941))

(assert (not b!35983))

(assert (not d!10732))

(assert (not bm!450))

(assert (not b!36239))

(assert (not d!10654))

(assert (not d!10620))

(assert (not b!36245))

(assert (not b!36122))

(assert (not b!35939))

(assert (not d!10614))

(assert (not d!10500))

(assert (not d!10604))

(assert (not d!10618))

(assert (not b!36157))

(assert (not b!36258))

(assert (not d!10606))

(assert (not b!36155))

(assert (not b!36117))

(assert (not b!36134))

(assert (not b!36048))

(assert (not d!10636))

(assert (not b!36156))

(assert (not b!36241))

(assert (not d!10640))

(assert (not b!36260))

(assert (not b!36145))

(assert (not d!10566))

(assert (not b!36132))

(assert (not b!36164))

(assert (not b!36158))

(assert (not b!36032))

(assert (not b!35981))

(assert (not b!36243))

(assert (not d!10624))

(assert (not b!36135))

(assert (not d!10522))

(check-sat)

(pop 1)

(push 1)

(check-sat)

