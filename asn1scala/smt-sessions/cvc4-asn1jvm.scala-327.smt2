; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7338 () Bool)

(assert start!7338)

(declare-fun b!35654 () Bool)

(declare-fun e!23551 () Bool)

(declare-fun e!23541 () Bool)

(assert (=> b!35654 (= e!23551 e!23541)))

(declare-fun res!30414 () Bool)

(assert (=> b!35654 (=> res!30414 e!23541)))

(declare-fun lt!53292 () Bool)

(declare-datatypes ((array!1905 0))(
  ( (array!1906 (arr!1333 (Array (_ BitVec 32) (_ BitVec 8))) (size!849 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1472 0))(
  ( (BitStream!1473 (buf!1177 array!1905) (currentByte!2562 (_ BitVec 32)) (currentBit!2557 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!3546 0))(
  ( (tuple2!3547 (_1!1860 BitStream!1472) (_2!1860 BitStream!1472)) )
))
(declare-fun lt!53299 () tuple2!3546)

(declare-fun lt!53304 () (_ BitVec 64))

(declare-fun bitAt!0 (array!1905 (_ BitVec 64)) Bool)

(assert (=> b!35654 (= res!30414 (not (= lt!53292 (bitAt!0 (buf!1177 (_1!1860 lt!53299)) lt!53304))))))

(declare-fun lt!53306 () tuple2!3546)

(assert (=> b!35654 (= lt!53292 (bitAt!0 (buf!1177 (_1!1860 lt!53306)) lt!53304))))

(declare-fun b!35655 () Bool)

(declare-fun e!23547 () Bool)

(declare-fun e!23554 () Bool)

(assert (=> b!35655 (= e!23547 (not e!23554))))

(declare-fun res!30419 () Bool)

(assert (=> b!35655 (=> res!30419 e!23554)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!35655 (= res!30419 (bvsge i!635 to!314))))

(declare-fun thiss!1379 () BitStream!1472)

(declare-fun isPrefixOf!0 (BitStream!1472 BitStream!1472) Bool)

(assert (=> b!35655 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2625 0))(
  ( (Unit!2626) )
))
(declare-fun lt!53302 () Unit!2625)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1472) Unit!2625)

(assert (=> b!35655 (= lt!53302 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!35655 (= lt!53304 (bitIndex!0 (size!849 (buf!1177 thiss!1379)) (currentByte!2562 thiss!1379) (currentBit!2557 thiss!1379)))))

(declare-fun res!30411 () Bool)

(declare-fun e!23552 () Bool)

(assert (=> start!7338 (=> (not res!30411) (not e!23552))))

(assert (=> start!7338 (= res!30411 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111)))))

(assert (=> start!7338 e!23552))

(assert (=> start!7338 true))

(declare-fun e!23542 () Bool)

(declare-fun inv!12 (BitStream!1472) Bool)

(assert (=> start!7338 (and (inv!12 thiss!1379) e!23542)))

(declare-fun srcBuffer!2 () array!1905)

(declare-fun array_inv!789 (array!1905) Bool)

(assert (=> start!7338 (array_inv!789 srcBuffer!2)))

(declare-fun b!35656 () Bool)

(assert (=> b!35656 (= e!23552 e!23547)))

(declare-fun res!30408 () Bool)

(assert (=> b!35656 (=> (not res!30408) (not e!23547))))

(declare-fun lt!53290 () (_ BitVec 64))

(assert (=> b!35656 (= res!30408 (bvsle to!314 lt!53290))))

(assert (=> b!35656 (= lt!53290 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!849 srcBuffer!2))))))

(declare-fun b!35657 () Bool)

(declare-fun e!23545 () Bool)

(declare-fun e!23543 () Bool)

(assert (=> b!35657 (= e!23545 e!23543)))

(declare-fun res!30415 () Bool)

(assert (=> b!35657 (=> res!30415 e!23543)))

(declare-fun lt!53307 () Bool)

(declare-fun lt!53293 () Bool)

(assert (=> b!35657 (= res!30415 (not (= lt!53307 lt!53293)))))

(declare-datatypes ((tuple2!3548 0))(
  ( (tuple2!3549 (_1!1861 Unit!2625) (_2!1861 BitStream!1472)) )
))
(declare-fun lt!53289 () tuple2!3548)

(assert (=> b!35657 (= lt!53307 (bitAt!0 (buf!1177 (_2!1861 lt!53289)) lt!53304))))

(declare-fun b!35658 () Bool)

(declare-fun res!30420 () Bool)

(assert (=> b!35658 (=> (not res!30420) (not e!23547))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!35658 (= res!30420 (validate_offset_bits!1 ((_ sign_extend 32) (size!849 (buf!1177 thiss!1379))) ((_ sign_extend 32) (currentByte!2562 thiss!1379)) ((_ sign_extend 32) (currentBit!2557 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!35659 () Bool)

(declare-fun e!23544 () Bool)

(declare-fun lt!53294 () tuple2!3546)

(declare-datatypes ((List!437 0))(
  ( (Nil!434) (Cons!433 (h!552 Bool) (t!1187 List!437)) )
))
(declare-fun head!274 (List!437) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1472 array!1905 (_ BitVec 64) (_ BitVec 64)) List!437)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1472 BitStream!1472 (_ BitVec 64)) List!437)

(assert (=> b!35659 (= e!23544 (= (head!274 (byteArrayBitContentToList!0 (_2!1861 lt!53289) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!274 (bitStreamReadBitsIntoList!0 (_2!1861 lt!53289) (_1!1860 lt!53294) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!35660 () Bool)

(declare-fun res!30418 () Bool)

(declare-fun e!23553 () Bool)

(assert (=> b!35660 (=> res!30418 e!23553)))

(declare-fun lt!53298 () tuple2!3548)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!35660 (= res!30418 (not (invariant!0 (currentBit!2557 (_2!1861 lt!53298)) (currentByte!2562 (_2!1861 lt!53298)) (size!849 (buf!1177 (_2!1861 lt!53298))))))))

(declare-fun b!35661 () Bool)

(assert (=> b!35661 (= e!23541 e!23545)))

(declare-fun res!30416 () Bool)

(assert (=> b!35661 (=> res!30416 e!23545)))

(assert (=> b!35661 (= res!30416 (not (= (head!274 (byteArrayBitContentToList!0 (_2!1861 lt!53298) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!53293)))))

(assert (=> b!35661 (= lt!53293 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!35662 () Bool)

(declare-fun e!23546 () Bool)

(assert (=> b!35662 (= e!23554 e!23546)))

(declare-fun res!30412 () Bool)

(assert (=> b!35662 (=> res!30412 e!23546)))

(assert (=> b!35662 (= res!30412 (not (isPrefixOf!0 thiss!1379 (_2!1861 lt!53289))))))

(declare-fun lt!53297 () (_ BitVec 64))

(assert (=> b!35662 (validate_offset_bits!1 ((_ sign_extend 32) (size!849 (buf!1177 (_2!1861 lt!53289)))) ((_ sign_extend 32) (currentByte!2562 (_2!1861 lt!53289))) ((_ sign_extend 32) (currentBit!2557 (_2!1861 lt!53289))) lt!53297)))

(assert (=> b!35662 (= lt!53297 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!53291 () Unit!2625)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1472 BitStream!1472 (_ BitVec 64) (_ BitVec 64)) Unit!2625)

(assert (=> b!35662 (= lt!53291 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1861 lt!53289) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1472 (_ BitVec 8) (_ BitVec 32)) tuple2!3548)

(assert (=> b!35662 (= lt!53289 (appendBitFromByte!0 thiss!1379 (select (arr!1333 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!35663 () Bool)

(declare-fun res!30409 () Bool)

(declare-fun e!23540 () Bool)

(assert (=> b!35663 (=> res!30409 e!23540)))

(assert (=> b!35663 (= res!30409 (not (invariant!0 (currentBit!2557 (_2!1861 lt!53289)) (currentByte!2562 (_2!1861 lt!53289)) (size!849 (buf!1177 (_2!1861 lt!53298))))))))

(declare-fun b!35664 () Bool)

(declare-fun res!30401 () Bool)

(assert (=> b!35664 (=> res!30401 e!23540)))

(assert (=> b!35664 (= res!30401 (not (invariant!0 (currentBit!2557 (_2!1861 lt!53289)) (currentByte!2562 (_2!1861 lt!53289)) (size!849 (buf!1177 (_2!1861 lt!53289))))))))

(declare-fun b!35665 () Bool)

(declare-fun res!30417 () Bool)

(declare-fun e!23549 () Bool)

(assert (=> b!35665 (=> res!30417 e!23549)))

(declare-fun lt!53301 () List!437)

(declare-fun length!163 (List!437) Int)

(assert (=> b!35665 (= res!30417 (<= (length!163 lt!53301) 0))))

(declare-fun b!35666 () Bool)

(declare-fun e!23550 () Bool)

(assert (=> b!35666 (= e!23550 e!23553)))

(declare-fun res!30403 () Bool)

(assert (=> b!35666 (=> res!30403 e!23553)))

(declare-fun lt!53296 () (_ BitVec 64))

(assert (=> b!35666 (= res!30403 (not (= lt!53296 (bvsub (bvadd lt!53304 to!314) i!635))))))

(assert (=> b!35666 (= lt!53296 (bitIndex!0 (size!849 (buf!1177 (_2!1861 lt!53298))) (currentByte!2562 (_2!1861 lt!53298)) (currentBit!2557 (_2!1861 lt!53298))))))

(declare-fun b!35667 () Bool)

(assert (=> b!35667 (= e!23546 e!23550)))

(declare-fun res!30406 () Bool)

(assert (=> b!35667 (=> res!30406 e!23550)))

(assert (=> b!35667 (= res!30406 (not (isPrefixOf!0 (_2!1861 lt!53289) (_2!1861 lt!53298))))))

(assert (=> b!35667 (isPrefixOf!0 thiss!1379 (_2!1861 lt!53298))))

(declare-fun lt!53303 () Unit!2625)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1472 BitStream!1472 BitStream!1472) Unit!2625)

(assert (=> b!35667 (= lt!53303 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1861 lt!53289) (_2!1861 lt!53298)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1472 array!1905 (_ BitVec 64) (_ BitVec 64)) tuple2!3548)

(assert (=> b!35667 (= lt!53298 (appendBitsMSBFirstLoop!0 (_2!1861 lt!53289) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!35667 e!23544))

(declare-fun res!30404 () Bool)

(assert (=> b!35667 (=> (not res!30404) (not e!23544))))

(assert (=> b!35667 (= res!30404 (validate_offset_bits!1 ((_ sign_extend 32) (size!849 (buf!1177 (_2!1861 lt!53289)))) ((_ sign_extend 32) (currentByte!2562 thiss!1379)) ((_ sign_extend 32) (currentBit!2557 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!53295 () Unit!2625)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1472 array!1905 (_ BitVec 64)) Unit!2625)

(assert (=> b!35667 (= lt!53295 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1177 (_2!1861 lt!53289)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1472 BitStream!1472) tuple2!3546)

(assert (=> b!35667 (= lt!53294 (reader!0 thiss!1379 (_2!1861 lt!53289)))))

(declare-fun b!35668 () Bool)

(assert (=> b!35668 (= e!23540 e!23549)))

(declare-fun res!30413 () Bool)

(assert (=> b!35668 (=> res!30413 e!23549)))

(assert (=> b!35668 (= res!30413 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!53311 () List!437)

(assert (=> b!35668 (= lt!53311 (bitStreamReadBitsIntoList!0 (_2!1861 lt!53298) (_1!1860 lt!53299) lt!53297))))

(assert (=> b!35668 (= lt!53301 (bitStreamReadBitsIntoList!0 (_2!1861 lt!53298) (_1!1860 lt!53306) (bvsub to!314 i!635)))))

(assert (=> b!35668 (validate_offset_bits!1 ((_ sign_extend 32) (size!849 (buf!1177 (_2!1861 lt!53298)))) ((_ sign_extend 32) (currentByte!2562 (_2!1861 lt!53289))) ((_ sign_extend 32) (currentBit!2557 (_2!1861 lt!53289))) lt!53297)))

(declare-fun lt!53308 () Unit!2625)

(assert (=> b!35668 (= lt!53308 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1861 lt!53289) (buf!1177 (_2!1861 lt!53298)) lt!53297))))

(assert (=> b!35668 (= lt!53299 (reader!0 (_2!1861 lt!53289) (_2!1861 lt!53298)))))

(assert (=> b!35668 (validate_offset_bits!1 ((_ sign_extend 32) (size!849 (buf!1177 (_2!1861 lt!53298)))) ((_ sign_extend 32) (currentByte!2562 thiss!1379)) ((_ sign_extend 32) (currentBit!2557 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!53305 () Unit!2625)

(assert (=> b!35668 (= lt!53305 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1177 (_2!1861 lt!53298)) (bvsub to!314 i!635)))))

(assert (=> b!35668 (= lt!53306 (reader!0 thiss!1379 (_2!1861 lt!53298)))))

(declare-fun b!35669 () Bool)

(assert (=> b!35669 (= e!23549 e!23551)))

(declare-fun res!30407 () Bool)

(assert (=> b!35669 (=> res!30407 e!23551)))

(declare-fun lt!53310 () List!437)

(assert (=> b!35669 (= res!30407 (not (= lt!53310 lt!53311)))))

(assert (=> b!35669 (= lt!53311 lt!53310)))

(declare-fun tail!154 (List!437) List!437)

(assert (=> b!35669 (= lt!53310 (tail!154 lt!53301))))

(declare-fun lt!53300 () Unit!2625)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1472 BitStream!1472 BitStream!1472 BitStream!1472 (_ BitVec 64) List!437) Unit!2625)

(assert (=> b!35669 (= lt!53300 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1861 lt!53298) (_2!1861 lt!53298) (_1!1860 lt!53306) (_1!1860 lt!53299) (bvsub to!314 i!635) lt!53301))))

(declare-fun b!35670 () Bool)

(assert (=> b!35670 (= e!23542 (array_inv!789 (buf!1177 thiss!1379)))))

(declare-fun b!35671 () Bool)

(assert (=> b!35671 (= e!23553 e!23540)))

(declare-fun res!30405 () Bool)

(assert (=> b!35671 (=> res!30405 e!23540)))

(assert (=> b!35671 (= res!30405 (not (= (size!849 (buf!1177 (_2!1861 lt!53289))) (size!849 (buf!1177 (_2!1861 lt!53298))))))))

(declare-fun lt!53288 () (_ BitVec 64))

(assert (=> b!35671 (= lt!53296 (bvsub (bvsub (bvadd lt!53288 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!35671 (= lt!53288 (bitIndex!0 (size!849 (buf!1177 (_2!1861 lt!53289))) (currentByte!2562 (_2!1861 lt!53289)) (currentBit!2557 (_2!1861 lt!53289))))))

(assert (=> b!35671 (= (size!849 (buf!1177 (_2!1861 lt!53298))) (size!849 (buf!1177 thiss!1379)))))

(declare-fun b!35672 () Bool)

(declare-fun res!30402 () Bool)

(assert (=> b!35672 (=> res!30402 e!23553)))

(assert (=> b!35672 (= res!30402 (not (= (size!849 (buf!1177 thiss!1379)) (size!849 (buf!1177 (_2!1861 lt!53298))))))))

(declare-fun b!35673 () Bool)

(declare-fun res!30410 () Bool)

(assert (=> b!35673 (=> res!30410 e!23541)))

(assert (=> b!35673 (= res!30410 (not (= (head!274 lt!53301) lt!53292)))))

(declare-fun b!35674 () Bool)

(assert (=> b!35674 (= e!23543 (bvslt i!635 lt!53290))))

(assert (=> b!35674 (= lt!53307 (bitAt!0 (buf!1177 (_2!1861 lt!53298)) lt!53304))))

(declare-fun lt!53309 () Unit!2625)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1905 array!1905 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2625)

(assert (=> b!35674 (= lt!53309 (arrayBitRangesEqImpliesEq!0 (buf!1177 (_2!1861 lt!53289)) (buf!1177 (_2!1861 lt!53298)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!53304 lt!53288))))

(assert (= (and start!7338 res!30411) b!35656))

(assert (= (and b!35656 res!30408) b!35658))

(assert (= (and b!35658 res!30420) b!35655))

(assert (= (and b!35655 (not res!30419)) b!35662))

(assert (= (and b!35662 (not res!30412)) b!35667))

(assert (= (and b!35667 res!30404) b!35659))

(assert (= (and b!35667 (not res!30406)) b!35666))

(assert (= (and b!35666 (not res!30403)) b!35660))

(assert (= (and b!35660 (not res!30418)) b!35672))

(assert (= (and b!35672 (not res!30402)) b!35671))

(assert (= (and b!35671 (not res!30405)) b!35664))

(assert (= (and b!35664 (not res!30401)) b!35663))

(assert (= (and b!35663 (not res!30409)) b!35668))

(assert (= (and b!35668 (not res!30413)) b!35665))

(assert (= (and b!35665 (not res!30417)) b!35669))

(assert (= (and b!35669 (not res!30407)) b!35654))

(assert (= (and b!35654 (not res!30414)) b!35673))

(assert (= (and b!35673 (not res!30410)) b!35661))

(assert (= (and b!35661 (not res!30416)) b!35657))

(assert (= (and b!35657 (not res!30415)) b!35674))

(assert (= start!7338 b!35670))

(declare-fun m!53595 () Bool)

(assert (=> b!35673 m!53595))

(declare-fun m!53597 () Bool)

(assert (=> b!35657 m!53597))

(declare-fun m!53599 () Bool)

(assert (=> b!35663 m!53599))

(declare-fun m!53601 () Bool)

(assert (=> b!35671 m!53601))

(declare-fun m!53603 () Bool)

(assert (=> b!35664 m!53603))

(declare-fun m!53605 () Bool)

(assert (=> b!35659 m!53605))

(assert (=> b!35659 m!53605))

(declare-fun m!53607 () Bool)

(assert (=> b!35659 m!53607))

(declare-fun m!53609 () Bool)

(assert (=> b!35659 m!53609))

(assert (=> b!35659 m!53609))

(declare-fun m!53611 () Bool)

(assert (=> b!35659 m!53611))

(declare-fun m!53613 () Bool)

(assert (=> b!35655 m!53613))

(declare-fun m!53615 () Bool)

(assert (=> b!35655 m!53615))

(declare-fun m!53617 () Bool)

(assert (=> b!35655 m!53617))

(declare-fun m!53619 () Bool)

(assert (=> b!35660 m!53619))

(declare-fun m!53621 () Bool)

(assert (=> b!35667 m!53621))

(declare-fun m!53623 () Bool)

(assert (=> b!35667 m!53623))

(declare-fun m!53625 () Bool)

(assert (=> b!35667 m!53625))

(declare-fun m!53627 () Bool)

(assert (=> b!35667 m!53627))

(declare-fun m!53629 () Bool)

(assert (=> b!35667 m!53629))

(declare-fun m!53631 () Bool)

(assert (=> b!35667 m!53631))

(declare-fun m!53633 () Bool)

(assert (=> b!35667 m!53633))

(declare-fun m!53635 () Bool)

(assert (=> b!35666 m!53635))

(declare-fun m!53637 () Bool)

(assert (=> b!35669 m!53637))

(declare-fun m!53639 () Bool)

(assert (=> b!35669 m!53639))

(declare-fun m!53641 () Bool)

(assert (=> b!35665 m!53641))

(declare-fun m!53643 () Bool)

(assert (=> b!35654 m!53643))

(declare-fun m!53645 () Bool)

(assert (=> b!35654 m!53645))

(declare-fun m!53647 () Bool)

(assert (=> b!35668 m!53647))

(declare-fun m!53649 () Bool)

(assert (=> b!35668 m!53649))

(declare-fun m!53651 () Bool)

(assert (=> b!35668 m!53651))

(declare-fun m!53653 () Bool)

(assert (=> b!35668 m!53653))

(declare-fun m!53655 () Bool)

(assert (=> b!35668 m!53655))

(declare-fun m!53657 () Bool)

(assert (=> b!35668 m!53657))

(declare-fun m!53659 () Bool)

(assert (=> b!35668 m!53659))

(declare-fun m!53661 () Bool)

(assert (=> b!35668 m!53661))

(declare-fun m!53663 () Bool)

(assert (=> b!35662 m!53663))

(declare-fun m!53665 () Bool)

(assert (=> b!35662 m!53665))

(assert (=> b!35662 m!53663))

(declare-fun m!53667 () Bool)

(assert (=> b!35662 m!53667))

(declare-fun m!53669 () Bool)

(assert (=> b!35662 m!53669))

(declare-fun m!53671 () Bool)

(assert (=> b!35662 m!53671))

(declare-fun m!53673 () Bool)

(assert (=> b!35670 m!53673))

(declare-fun m!53675 () Bool)

(assert (=> start!7338 m!53675))

(declare-fun m!53677 () Bool)

(assert (=> start!7338 m!53677))

(declare-fun m!53679 () Bool)

(assert (=> b!35674 m!53679))

(declare-fun m!53681 () Bool)

(assert (=> b!35674 m!53681))

(declare-fun m!53683 () Bool)

(assert (=> b!35661 m!53683))

(assert (=> b!35661 m!53683))

(declare-fun m!53685 () Bool)

(assert (=> b!35661 m!53685))

(declare-fun m!53687 () Bool)

(assert (=> b!35661 m!53687))

(declare-fun m!53689 () Bool)

(assert (=> b!35658 m!53689))

(push 1)

(assert (not b!35654))

(assert (not b!35671))

(assert (not b!35670))

(assert (not start!7338))

(assert (not b!35669))

(assert (not b!35660))

(assert (not b!35659))

(assert (not b!35663))

(assert (not b!35674))

(assert (not b!35661))

(assert (not b!35667))

(assert (not b!35665))

(assert (not b!35666))

(assert (not b!35658))

(assert (not b!35673))

(assert (not b!35655))

(assert (not b!35662))

(assert (not b!35657))

(assert (not b!35668))

(assert (not b!35664))

(check-sat)

(pop 1)

(push 1)

(check-sat)

