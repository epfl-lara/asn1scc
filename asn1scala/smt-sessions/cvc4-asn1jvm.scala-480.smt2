; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14104 () Bool)

(assert start!14104)

(declare-fun b!73355 () Bool)

(declare-fun res!60666 () Bool)

(declare-fun e!47921 () Bool)

(assert (=> b!73355 (=> res!60666 e!47921)))

(declare-datatypes ((array!2987 0))(
  ( (array!2988 (arr!1987 (Array (_ BitVec 32) (_ BitVec 8))) (size!1396 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2372 0))(
  ( (BitStream!2373 (buf!1777 array!2987) (currentByte!3503 (_ BitVec 32)) (currentBit!3498 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4845 0))(
  ( (Unit!4846) )
))
(declare-datatypes ((tuple2!6348 0))(
  ( (tuple2!6349 (_1!3288 Unit!4845) (_2!3288 BitStream!2372)) )
))
(declare-fun lt!118002 () tuple2!6348)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!73355 (= res!60666 (not (invariant!0 (currentBit!3498 (_2!3288 lt!118002)) (currentByte!3503 (_2!3288 lt!118002)) (size!1396 (buf!1777 (_2!3288 lt!118002))))))))

(declare-fun b!73356 () Bool)

(declare-fun e!47917 () Bool)

(declare-fun thiss!1379 () BitStream!2372)

(declare-fun array_inv!1245 (array!2987) Bool)

(assert (=> b!73356 (= e!47917 (array_inv!1245 (buf!1777 thiss!1379)))))

(declare-fun b!73357 () Bool)

(declare-fun e!47930 () Bool)

(declare-fun e!47928 () Bool)

(assert (=> b!73357 (= e!47930 e!47928)))

(declare-fun res!60658 () Bool)

(assert (=> b!73357 (=> res!60658 e!47928)))

(declare-fun lt!117993 () Bool)

(declare-fun lt!117987 () Bool)

(assert (=> b!73357 (= res!60658 (not (= lt!117993 lt!117987)))))

(declare-fun lt!117984 () tuple2!6348)

(declare-fun lt!117986 () (_ BitVec 64))

(declare-fun bitAt!0 (array!2987 (_ BitVec 64)) Bool)

(assert (=> b!73357 (= lt!117993 (bitAt!0 (buf!1777 (_2!3288 lt!117984)) lt!117986))))

(declare-fun b!73358 () Bool)

(declare-fun e!47925 () Bool)

(assert (=> b!73358 (= e!47925 e!47930)))

(declare-fun res!60649 () Bool)

(assert (=> b!73358 (=> res!60649 e!47930)))

(declare-fun srcBuffer!2 () array!2987)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-datatypes ((List!761 0))(
  ( (Nil!758) (Cons!757 (h!876 Bool) (t!1511 List!761)) )
))
(declare-fun head!580 (List!761) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2372 array!2987 (_ BitVec 64) (_ BitVec 64)) List!761)

(assert (=> b!73358 (= res!60649 (not (= (head!580 (byteArrayBitContentToList!0 (_2!3288 lt!118002) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!117987)))))

(assert (=> b!73358 (= lt!117987 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!73359 () Bool)

(declare-fun e!47926 () Bool)

(declare-fun e!47915 () Bool)

(assert (=> b!73359 (= e!47926 e!47915)))

(declare-fun res!60651 () Bool)

(assert (=> b!73359 (=> res!60651 e!47915)))

(assert (=> b!73359 (= res!60651 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!117982 () List!761)

(declare-datatypes ((tuple2!6350 0))(
  ( (tuple2!6351 (_1!3289 BitStream!2372) (_2!3289 BitStream!2372)) )
))
(declare-fun lt!118003 () tuple2!6350)

(declare-fun lt!117999 () (_ BitVec 64))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2372 BitStream!2372 (_ BitVec 64)) List!761)

(assert (=> b!73359 (= lt!117982 (bitStreamReadBitsIntoList!0 (_2!3288 lt!118002) (_1!3289 lt!118003) lt!117999))))

(declare-fun lt!118004 () List!761)

(declare-fun lt!117989 () tuple2!6350)

(assert (=> b!73359 (= lt!118004 (bitStreamReadBitsIntoList!0 (_2!3288 lt!118002) (_1!3289 lt!117989) (bvsub to!314 i!635)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!73359 (validate_offset_bits!1 ((_ sign_extend 32) (size!1396 (buf!1777 (_2!3288 lt!118002)))) ((_ sign_extend 32) (currentByte!3503 (_2!3288 lt!117984))) ((_ sign_extend 32) (currentBit!3498 (_2!3288 lt!117984))) lt!117999)))

(declare-fun lt!117983 () Unit!4845)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2372 array!2987 (_ BitVec 64)) Unit!4845)

(assert (=> b!73359 (= lt!117983 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3288 lt!117984) (buf!1777 (_2!3288 lt!118002)) lt!117999))))

(declare-fun reader!0 (BitStream!2372 BitStream!2372) tuple2!6350)

(assert (=> b!73359 (= lt!118003 (reader!0 (_2!3288 lt!117984) (_2!3288 lt!118002)))))

(assert (=> b!73359 (validate_offset_bits!1 ((_ sign_extend 32) (size!1396 (buf!1777 (_2!3288 lt!118002)))) ((_ sign_extend 32) (currentByte!3503 thiss!1379)) ((_ sign_extend 32) (currentBit!3498 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!117990 () Unit!4845)

(assert (=> b!73359 (= lt!117990 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1777 (_2!3288 lt!118002)) (bvsub to!314 i!635)))))

(assert (=> b!73359 (= lt!117989 (reader!0 thiss!1379 (_2!3288 lt!118002)))))

(declare-fun b!73360 () Bool)

(declare-fun res!60664 () Bool)

(assert (=> b!73360 (=> res!60664 e!47921)))

(assert (=> b!73360 (= res!60664 (not (= (size!1396 (buf!1777 thiss!1379)) (size!1396 (buf!1777 (_2!3288 lt!118002))))))))

(declare-fun b!73361 () Bool)

(declare-fun e!47927 () Bool)

(declare-fun e!47922 () Bool)

(assert (=> b!73361 (= e!47927 (not e!47922))))

(declare-fun res!60665 () Bool)

(assert (=> b!73361 (=> res!60665 e!47922)))

(assert (=> b!73361 (= res!60665 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!2372 BitStream!2372) Bool)

(assert (=> b!73361 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!118000 () Unit!4845)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2372) Unit!4845)

(assert (=> b!73361 (= lt!118000 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!73361 (= lt!117986 (bitIndex!0 (size!1396 (buf!1777 thiss!1379)) (currentByte!3503 thiss!1379) (currentBit!3498 thiss!1379)))))

(declare-fun b!73362 () Bool)

(declare-fun e!47920 () Bool)

(declare-fun e!47919 () Bool)

(assert (=> b!73362 (= e!47920 e!47919)))

(declare-fun res!60662 () Bool)

(assert (=> b!73362 (=> res!60662 e!47919)))

(assert (=> b!73362 (= res!60662 (not (isPrefixOf!0 (_2!3288 lt!117984) (_2!3288 lt!118002))))))

(assert (=> b!73362 (isPrefixOf!0 thiss!1379 (_2!3288 lt!118002))))

(declare-fun lt!117991 () Unit!4845)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2372 BitStream!2372 BitStream!2372) Unit!4845)

(assert (=> b!73362 (= lt!117991 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3288 lt!117984) (_2!3288 lt!118002)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2372 array!2987 (_ BitVec 64) (_ BitVec 64)) tuple2!6348)

(assert (=> b!73362 (= lt!118002 (appendBitsMSBFirstLoop!0 (_2!3288 lt!117984) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!47918 () Bool)

(assert (=> b!73362 e!47918))

(declare-fun res!60653 () Bool)

(assert (=> b!73362 (=> (not res!60653) (not e!47918))))

(assert (=> b!73362 (= res!60653 (validate_offset_bits!1 ((_ sign_extend 32) (size!1396 (buf!1777 (_2!3288 lt!117984)))) ((_ sign_extend 32) (currentByte!3503 thiss!1379)) ((_ sign_extend 32) (currentBit!3498 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!117985 () Unit!4845)

(assert (=> b!73362 (= lt!117985 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1777 (_2!3288 lt!117984)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!117998 () tuple2!6350)

(assert (=> b!73362 (= lt!117998 (reader!0 thiss!1379 (_2!3288 lt!117984)))))

(declare-fun b!73363 () Bool)

(declare-fun res!60650 () Bool)

(assert (=> b!73363 (=> res!60650 e!47915)))

(declare-fun length!389 (List!761) Int)

(assert (=> b!73363 (= res!60650 (<= (length!389 lt!118004) 0))))

(declare-fun b!73364 () Bool)

(declare-fun e!47916 () Bool)

(assert (=> b!73364 (= e!47916 e!47925)))

(declare-fun res!60654 () Bool)

(assert (=> b!73364 (=> res!60654 e!47925)))

(declare-fun lt!117994 () Bool)

(assert (=> b!73364 (= res!60654 (not (= lt!117994 (bitAt!0 (buf!1777 (_1!3289 lt!118003)) lt!117986))))))

(assert (=> b!73364 (= lt!117994 (bitAt!0 (buf!1777 (_1!3289 lt!117989)) lt!117986))))

(declare-fun res!60661 () Bool)

(assert (=> start!14104 (=> (not res!60661) (not e!47927))))

(assert (=> start!14104 (= res!60661 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1396 srcBuffer!2))))))))

(assert (=> start!14104 e!47927))

(assert (=> start!14104 true))

(assert (=> start!14104 (array_inv!1245 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2372) Bool)

(assert (=> start!14104 (and (inv!12 thiss!1379) e!47917)))

(declare-fun b!73365 () Bool)

(assert (=> b!73365 (= e!47915 e!47916)))

(declare-fun res!60647 () Bool)

(assert (=> b!73365 (=> res!60647 e!47916)))

(declare-fun lt!117995 () List!761)

(assert (=> b!73365 (= res!60647 (not (= lt!117995 lt!117982)))))

(assert (=> b!73365 (= lt!117982 lt!117995)))

(declare-fun tail!365 (List!761) List!761)

(assert (=> b!73365 (= lt!117995 (tail!365 lt!118004))))

(declare-fun lt!117996 () Unit!4845)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2372 BitStream!2372 BitStream!2372 BitStream!2372 (_ BitVec 64) List!761) Unit!4845)

(assert (=> b!73365 (= lt!117996 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3288 lt!118002) (_2!3288 lt!118002) (_1!3289 lt!117989) (_1!3289 lt!118003) (bvsub to!314 i!635) lt!118004))))

(declare-fun b!73366 () Bool)

(declare-fun res!60659 () Bool)

(assert (=> b!73366 (=> res!60659 e!47925)))

(assert (=> b!73366 (= res!60659 (not (= (head!580 lt!118004) lt!117994)))))

(declare-fun b!73367 () Bool)

(assert (=> b!73367 (= e!47921 e!47926)))

(declare-fun res!60655 () Bool)

(assert (=> b!73367 (=> res!60655 e!47926)))

(assert (=> b!73367 (= res!60655 (not (= (size!1396 (buf!1777 (_2!3288 lt!117984))) (size!1396 (buf!1777 (_2!3288 lt!118002))))))))

(declare-fun lt!118005 () (_ BitVec 64))

(declare-fun lt!117997 () (_ BitVec 64))

(assert (=> b!73367 (= lt!118005 (bvsub (bvsub (bvadd lt!117997 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!73367 (= lt!117997 (bitIndex!0 (size!1396 (buf!1777 (_2!3288 lt!117984))) (currentByte!3503 (_2!3288 lt!117984)) (currentBit!3498 (_2!3288 lt!117984))))))

(assert (=> b!73367 (= (size!1396 (buf!1777 (_2!3288 lt!118002))) (size!1396 (buf!1777 thiss!1379)))))

(declare-fun b!73368 () Bool)

(assert (=> b!73368 (= e!47919 e!47921)))

(declare-fun res!60652 () Bool)

(assert (=> b!73368 (=> res!60652 e!47921)))

(assert (=> b!73368 (= res!60652 (not (= lt!118005 (bvsub (bvadd lt!117986 to!314) i!635))))))

(assert (=> b!73368 (= lt!118005 (bitIndex!0 (size!1396 (buf!1777 (_2!3288 lt!118002))) (currentByte!3503 (_2!3288 lt!118002)) (currentBit!3498 (_2!3288 lt!118002))))))

(declare-fun b!73369 () Bool)

(assert (=> b!73369 (= e!47922 e!47920)))

(declare-fun res!60656 () Bool)

(assert (=> b!73369 (=> res!60656 e!47920)))

(assert (=> b!73369 (= res!60656 (not (isPrefixOf!0 thiss!1379 (_2!3288 lt!117984))))))

(assert (=> b!73369 (validate_offset_bits!1 ((_ sign_extend 32) (size!1396 (buf!1777 (_2!3288 lt!117984)))) ((_ sign_extend 32) (currentByte!3503 (_2!3288 lt!117984))) ((_ sign_extend 32) (currentBit!3498 (_2!3288 lt!117984))) lt!117999)))

(assert (=> b!73369 (= lt!117999 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!117988 () Unit!4845)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2372 BitStream!2372 (_ BitVec 64) (_ BitVec 64)) Unit!4845)

(assert (=> b!73369 (= lt!117988 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3288 lt!117984) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2372 (_ BitVec 8) (_ BitVec 32)) tuple2!6348)

(assert (=> b!73369 (= lt!117984 (appendBitFromByte!0 thiss!1379 (select (arr!1987 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!73370 () Bool)

(declare-fun e!47924 () Bool)

(assert (=> b!73370 (= e!47928 e!47924)))

(declare-fun res!60663 () Bool)

(assert (=> b!73370 (=> res!60663 e!47924)))

(declare-fun lt!118001 () Bool)

(assert (=> b!73370 (= res!60663 (not (= lt!118001 lt!117987)))))

(assert (=> b!73370 (= lt!117993 lt!118001)))

(assert (=> b!73370 (= lt!118001 (bitAt!0 (buf!1777 (_2!3288 lt!118002)) lt!117986))))

(declare-fun lt!118006 () Unit!4845)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2987 array!2987 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4845)

(assert (=> b!73370 (= lt!118006 (arrayBitRangesEqImpliesEq!0 (buf!1777 (_2!3288 lt!117984)) (buf!1777 (_2!3288 lt!118002)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!117986 lt!117997))))

(declare-fun b!73371 () Bool)

(assert (=> b!73371 (= e!47924 true)))

(declare-datatypes ((tuple2!6352 0))(
  ( (tuple2!6353 (_1!3290 BitStream!2372) (_2!3290 Bool)) )
))
(declare-fun lt!117992 () tuple2!6352)

(declare-fun readBitPure!0 (BitStream!2372) tuple2!6352)

(assert (=> b!73371 (= lt!117992 (readBitPure!0 (_1!3289 lt!117989)))))

(declare-fun b!73372 () Bool)

(assert (=> b!73372 (= e!47918 (= (head!580 (byteArrayBitContentToList!0 (_2!3288 lt!117984) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!580 (bitStreamReadBitsIntoList!0 (_2!3288 lt!117984) (_1!3289 lt!117998) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!73373 () Bool)

(declare-fun res!60657 () Bool)

(assert (=> b!73373 (=> (not res!60657) (not e!47927))))

(assert (=> b!73373 (= res!60657 (validate_offset_bits!1 ((_ sign_extend 32) (size!1396 (buf!1777 thiss!1379))) ((_ sign_extend 32) (currentByte!3503 thiss!1379)) ((_ sign_extend 32) (currentBit!3498 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!73374 () Bool)

(declare-fun res!60648 () Bool)

(assert (=> b!73374 (=> res!60648 e!47926)))

(assert (=> b!73374 (= res!60648 (not (invariant!0 (currentBit!3498 (_2!3288 lt!117984)) (currentByte!3503 (_2!3288 lt!117984)) (size!1396 (buf!1777 (_2!3288 lt!118002))))))))

(declare-fun b!73375 () Bool)

(declare-fun res!60660 () Bool)

(assert (=> b!73375 (=> res!60660 e!47926)))

(assert (=> b!73375 (= res!60660 (not (invariant!0 (currentBit!3498 (_2!3288 lt!117984)) (currentByte!3503 (_2!3288 lt!117984)) (size!1396 (buf!1777 (_2!3288 lt!117984))))))))

(assert (= (and start!14104 res!60661) b!73373))

(assert (= (and b!73373 res!60657) b!73361))

(assert (= (and b!73361 (not res!60665)) b!73369))

(assert (= (and b!73369 (not res!60656)) b!73362))

(assert (= (and b!73362 res!60653) b!73372))

(assert (= (and b!73362 (not res!60662)) b!73368))

(assert (= (and b!73368 (not res!60652)) b!73355))

(assert (= (and b!73355 (not res!60666)) b!73360))

(assert (= (and b!73360 (not res!60664)) b!73367))

(assert (= (and b!73367 (not res!60655)) b!73375))

(assert (= (and b!73375 (not res!60660)) b!73374))

(assert (= (and b!73374 (not res!60648)) b!73359))

(assert (= (and b!73359 (not res!60651)) b!73363))

(assert (= (and b!73363 (not res!60650)) b!73365))

(assert (= (and b!73365 (not res!60647)) b!73364))

(assert (= (and b!73364 (not res!60654)) b!73366))

(assert (= (and b!73366 (not res!60659)) b!73358))

(assert (= (and b!73358 (not res!60649)) b!73357))

(assert (= (and b!73357 (not res!60658)) b!73370))

(assert (= (and b!73370 (not res!60663)) b!73371))

(assert (= start!14104 b!73356))

(declare-fun m!117635 () Bool)

(assert (=> b!73373 m!117635))

(declare-fun m!117637 () Bool)

(assert (=> b!73355 m!117637))

(declare-fun m!117639 () Bool)

(assert (=> b!73375 m!117639))

(declare-fun m!117641 () Bool)

(assert (=> b!73359 m!117641))

(declare-fun m!117643 () Bool)

(assert (=> b!73359 m!117643))

(declare-fun m!117645 () Bool)

(assert (=> b!73359 m!117645))

(declare-fun m!117647 () Bool)

(assert (=> b!73359 m!117647))

(declare-fun m!117649 () Bool)

(assert (=> b!73359 m!117649))

(declare-fun m!117651 () Bool)

(assert (=> b!73359 m!117651))

(declare-fun m!117653 () Bool)

(assert (=> b!73359 m!117653))

(declare-fun m!117655 () Bool)

(assert (=> b!73359 m!117655))

(declare-fun m!117657 () Bool)

(assert (=> b!73371 m!117657))

(declare-fun m!117659 () Bool)

(assert (=> b!73361 m!117659))

(declare-fun m!117661 () Bool)

(assert (=> b!73361 m!117661))

(declare-fun m!117663 () Bool)

(assert (=> b!73361 m!117663))

(declare-fun m!117665 () Bool)

(assert (=> b!73358 m!117665))

(assert (=> b!73358 m!117665))

(declare-fun m!117667 () Bool)

(assert (=> b!73358 m!117667))

(declare-fun m!117669 () Bool)

(assert (=> b!73358 m!117669))

(declare-fun m!117671 () Bool)

(assert (=> b!73372 m!117671))

(assert (=> b!73372 m!117671))

(declare-fun m!117673 () Bool)

(assert (=> b!73372 m!117673))

(declare-fun m!117675 () Bool)

(assert (=> b!73372 m!117675))

(assert (=> b!73372 m!117675))

(declare-fun m!117677 () Bool)

(assert (=> b!73372 m!117677))

(declare-fun m!117679 () Bool)

(assert (=> b!73357 m!117679))

(declare-fun m!117681 () Bool)

(assert (=> b!73370 m!117681))

(declare-fun m!117683 () Bool)

(assert (=> b!73370 m!117683))

(declare-fun m!117685 () Bool)

(assert (=> b!73366 m!117685))

(declare-fun m!117687 () Bool)

(assert (=> start!14104 m!117687))

(declare-fun m!117689 () Bool)

(assert (=> start!14104 m!117689))

(declare-fun m!117691 () Bool)

(assert (=> b!73356 m!117691))

(declare-fun m!117693 () Bool)

(assert (=> b!73369 m!117693))

(declare-fun m!117695 () Bool)

(assert (=> b!73369 m!117695))

(assert (=> b!73369 m!117695))

(declare-fun m!117697 () Bool)

(assert (=> b!73369 m!117697))

(declare-fun m!117699 () Bool)

(assert (=> b!73369 m!117699))

(declare-fun m!117701 () Bool)

(assert (=> b!73369 m!117701))

(declare-fun m!117703 () Bool)

(assert (=> b!73368 m!117703))

(declare-fun m!117705 () Bool)

(assert (=> b!73362 m!117705))

(declare-fun m!117707 () Bool)

(assert (=> b!73362 m!117707))

(declare-fun m!117709 () Bool)

(assert (=> b!73362 m!117709))

(declare-fun m!117711 () Bool)

(assert (=> b!73362 m!117711))

(declare-fun m!117713 () Bool)

(assert (=> b!73362 m!117713))

(declare-fun m!117715 () Bool)

(assert (=> b!73362 m!117715))

(declare-fun m!117717 () Bool)

(assert (=> b!73362 m!117717))

(declare-fun m!117719 () Bool)

(assert (=> b!73374 m!117719))

(declare-fun m!117721 () Bool)

(assert (=> b!73365 m!117721))

(declare-fun m!117723 () Bool)

(assert (=> b!73365 m!117723))

(declare-fun m!117725 () Bool)

(assert (=> b!73367 m!117725))

(declare-fun m!117727 () Bool)

(assert (=> b!73364 m!117727))

(declare-fun m!117729 () Bool)

(assert (=> b!73364 m!117729))

(declare-fun m!117731 () Bool)

(assert (=> b!73363 m!117731))

(push 1)

(assert (not b!73355))

(assert (not b!73366))

(assert (not b!73368))

(assert (not b!73361))

(assert (not b!73362))

(assert (not b!73373))

(assert (not b!73358))

(assert (not b!73357))

(assert (not b!73364))

(assert (not b!73363))

(assert (not b!73367))

(assert (not b!73359))

(assert (not b!73370))

(assert (not b!73375))

(assert (not b!73371))

(assert (not b!73374))

(assert (not start!14104))

(assert (not b!73356))

(assert (not b!73369))

(assert (not b!73372))

(assert (not b!73365))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

