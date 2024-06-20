; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7930 () Bool)

(assert start!7930)

(declare-fun b!39338 () Bool)

(declare-fun e!25912 () Bool)

(declare-fun e!25905 () Bool)

(assert (=> b!39338 (= e!25912 e!25905)))

(declare-fun res!33461 () Bool)

(assert (=> b!39338 (=> res!33461 e!25905)))

(declare-datatypes ((List!469 0))(
  ( (Nil!466) (Cons!465 (h!584 Bool) (t!1219 List!469)) )
))
(declare-fun lt!59746 () List!469)

(declare-fun lt!59737 () List!469)

(assert (=> b!39338 (= res!33461 (not (= lt!59746 lt!59737)))))

(assert (=> b!39338 (= lt!59737 lt!59746)))

(declare-fun lt!59741 () List!469)

(declare-fun tail!186 (List!469) List!469)

(assert (=> b!39338 (= lt!59746 (tail!186 lt!59741))))

(declare-fun i!635 () (_ BitVec 64))

(declare-datatypes ((array!1981 0))(
  ( (array!1982 (arr!1389 (Array (_ BitVec 32) (_ BitVec 8))) (size!893 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1536 0))(
  ( (BitStream!1537 (buf!1221 array!1981) (currentByte!2633 (_ BitVec 32)) (currentBit!2628 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!3802 0))(
  ( (tuple2!3803 (_1!1988 BitStream!1536) (_2!1988 BitStream!1536)) )
))
(declare-fun lt!59752 () tuple2!3802)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!59745 () tuple2!3802)

(declare-datatypes ((Unit!2807 0))(
  ( (Unit!2808) )
))
(declare-datatypes ((tuple2!3804 0))(
  ( (tuple2!3805 (_1!1989 Unit!2807) (_2!1989 BitStream!1536)) )
))
(declare-fun lt!59738 () tuple2!3804)

(declare-fun lt!59742 () Unit!2807)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1536 BitStream!1536 BitStream!1536 BitStream!1536 (_ BitVec 64) List!469) Unit!2807)

(assert (=> b!39338 (= lt!59742 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1989 lt!59738) (_2!1989 lt!59738) (_1!1988 lt!59745) (_1!1988 lt!59752) (bvsub to!314 i!635) lt!59741))))

(declare-fun b!39339 () Bool)

(declare-fun res!33451 () Bool)

(declare-fun e!25900 () Bool)

(assert (=> b!39339 (=> res!33451 e!25900)))

(declare-fun lt!59743 () Bool)

(declare-fun head!306 (List!469) Bool)

(assert (=> b!39339 (= res!33451 (not (= (head!306 lt!59741) lt!59743)))))

(declare-fun b!39340 () Bool)

(declare-fun res!33464 () Bool)

(declare-fun e!25904 () Bool)

(assert (=> b!39340 (=> res!33464 e!25904)))

(declare-fun lt!59758 () tuple2!3804)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!39340 (= res!33464 (not (invariant!0 (currentBit!2628 (_2!1989 lt!59758)) (currentByte!2633 (_2!1989 lt!59758)) (size!893 (buf!1221 (_2!1989 lt!59758))))))))

(declare-fun b!39341 () Bool)

(declare-fun res!33458 () Bool)

(declare-fun e!25909 () Bool)

(assert (=> b!39341 (=> res!33458 e!25909)))

(declare-fun thiss!1379 () BitStream!1536)

(assert (=> b!39341 (= res!33458 (not (= (size!893 (buf!1221 thiss!1379)) (size!893 (buf!1221 (_2!1989 lt!59738))))))))

(declare-fun b!39342 () Bool)

(declare-fun e!25911 () Bool)

(declare-fun e!25914 () Bool)

(assert (=> b!39342 (= e!25911 (not e!25914))))

(declare-fun res!33454 () Bool)

(assert (=> b!39342 (=> res!33454 e!25914)))

(assert (=> b!39342 (= res!33454 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1536 BitStream!1536) Bool)

(assert (=> b!39342 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!59755 () Unit!2807)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1536) Unit!2807)

(assert (=> b!39342 (= lt!59755 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!59748 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!39342 (= lt!59748 (bitIndex!0 (size!893 (buf!1221 thiss!1379)) (currentByte!2633 thiss!1379) (currentBit!2628 thiss!1379)))))

(declare-fun res!33463 () Bool)

(assert (=> start!7930 (=> (not res!33463) (not e!25911))))

(declare-fun srcBuffer!2 () array!1981)

(assert (=> start!7930 (= res!33463 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!893 srcBuffer!2))))))))

(assert (=> start!7930 e!25911))

(assert (=> start!7930 true))

(declare-fun array_inv!821 (array!1981) Bool)

(assert (=> start!7930 (array_inv!821 srcBuffer!2)))

(declare-fun e!25901 () Bool)

(declare-fun inv!12 (BitStream!1536) Bool)

(assert (=> start!7930 (and (inv!12 thiss!1379) e!25901)))

(declare-fun lt!59757 () tuple2!3802)

(declare-fun e!25908 () Bool)

(declare-fun b!39343 () Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1536 array!1981 (_ BitVec 64) (_ BitVec 64)) List!469)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1536 BitStream!1536 (_ BitVec 64)) List!469)

(assert (=> b!39343 (= e!25908 (= (head!306 (byteArrayBitContentToList!0 (_2!1989 lt!59758) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!306 (bitStreamReadBitsIntoList!0 (_2!1989 lt!59758) (_1!1988 lt!59757) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!39344 () Bool)

(assert (=> b!39344 (= e!25901 (array_inv!821 (buf!1221 thiss!1379)))))

(declare-fun b!39345 () Bool)

(assert (=> b!39345 (= e!25905 e!25900)))

(declare-fun res!33453 () Bool)

(assert (=> b!39345 (=> res!33453 e!25900)))

(declare-fun bitAt!0 (array!1981 (_ BitVec 64)) Bool)

(assert (=> b!39345 (= res!33453 (not (= lt!59743 (bitAt!0 (buf!1221 (_1!1988 lt!59752)) lt!59748))))))

(assert (=> b!39345 (= lt!59743 (bitAt!0 (buf!1221 (_1!1988 lt!59745)) lt!59748))))

(declare-fun b!39346 () Bool)

(declare-fun res!33459 () Bool)

(assert (=> b!39346 (=> res!33459 e!25912)))

(declare-fun length!195 (List!469) Int)

(assert (=> b!39346 (= res!33459 (<= (length!195 lt!59741) 0))))

(declare-fun b!39347 () Bool)

(declare-fun e!25906 () Bool)

(assert (=> b!39347 (= e!25906 true)))

(declare-datatypes ((tuple2!3806 0))(
  ( (tuple2!3807 (_1!1990 BitStream!1536) (_2!1990 Bool)) )
))
(declare-fun lt!59751 () tuple2!3806)

(declare-fun readBitPure!0 (BitStream!1536) tuple2!3806)

(assert (=> b!39347 (= lt!59751 (readBitPure!0 (_1!1988 lt!59745)))))

(declare-fun b!39348 () Bool)

(declare-fun e!25903 () Bool)

(assert (=> b!39348 (= e!25900 e!25903)))

(declare-fun res!33457 () Bool)

(assert (=> b!39348 (=> res!33457 e!25903)))

(declare-fun lt!59740 () Bool)

(assert (=> b!39348 (= res!33457 (not (= (head!306 (byteArrayBitContentToList!0 (_2!1989 lt!59738) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!59740)))))

(assert (=> b!39348 (= lt!59740 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!39349 () Bool)

(declare-fun e!25910 () Bool)

(assert (=> b!39349 (= e!25903 e!25910)))

(declare-fun res!33452 () Bool)

(assert (=> b!39349 (=> res!33452 e!25910)))

(declare-fun lt!59754 () Bool)

(assert (=> b!39349 (= res!33452 (not (= lt!59754 lt!59740)))))

(assert (=> b!39349 (= lt!59754 (bitAt!0 (buf!1221 (_2!1989 lt!59758)) lt!59748))))

(declare-fun b!39350 () Bool)

(declare-fun res!33456 () Bool)

(assert (=> b!39350 (=> res!33456 e!25909)))

(assert (=> b!39350 (= res!33456 (not (invariant!0 (currentBit!2628 (_2!1989 lt!59738)) (currentByte!2633 (_2!1989 lt!59738)) (size!893 (buf!1221 (_2!1989 lt!59738))))))))

(declare-fun b!39351 () Bool)

(declare-fun res!33465 () Bool)

(assert (=> b!39351 (=> res!33465 e!25904)))

(assert (=> b!39351 (= res!33465 (not (invariant!0 (currentBit!2628 (_2!1989 lt!59758)) (currentByte!2633 (_2!1989 lt!59758)) (size!893 (buf!1221 (_2!1989 lt!59738))))))))

(declare-fun b!39352 () Bool)

(declare-fun e!25907 () Bool)

(declare-fun e!25915 () Bool)

(assert (=> b!39352 (= e!25907 e!25915)))

(declare-fun res!33460 () Bool)

(assert (=> b!39352 (=> res!33460 e!25915)))

(assert (=> b!39352 (= res!33460 (not (isPrefixOf!0 (_2!1989 lt!59758) (_2!1989 lt!59738))))))

(assert (=> b!39352 (isPrefixOf!0 thiss!1379 (_2!1989 lt!59738))))

(declare-fun lt!59753 () Unit!2807)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1536 BitStream!1536 BitStream!1536) Unit!2807)

(assert (=> b!39352 (= lt!59753 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1989 lt!59758) (_2!1989 lt!59738)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1536 array!1981 (_ BitVec 64) (_ BitVec 64)) tuple2!3804)

(assert (=> b!39352 (= lt!59738 (appendBitsMSBFirstLoop!0 (_2!1989 lt!59758) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!39352 e!25908))

(declare-fun res!33455 () Bool)

(assert (=> b!39352 (=> (not res!33455) (not e!25908))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!39352 (= res!33455 (validate_offset_bits!1 ((_ sign_extend 32) (size!893 (buf!1221 (_2!1989 lt!59758)))) ((_ sign_extend 32) (currentByte!2633 thiss!1379)) ((_ sign_extend 32) (currentBit!2628 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!59760 () Unit!2807)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1536 array!1981 (_ BitVec 64)) Unit!2807)

(assert (=> b!39352 (= lt!59760 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1221 (_2!1989 lt!59758)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1536 BitStream!1536) tuple2!3802)

(assert (=> b!39352 (= lt!59757 (reader!0 thiss!1379 (_2!1989 lt!59758)))))

(declare-fun b!39353 () Bool)

(declare-fun res!33468 () Bool)

(assert (=> b!39353 (=> (not res!33468) (not e!25911))))

(assert (=> b!39353 (= res!33468 (validate_offset_bits!1 ((_ sign_extend 32) (size!893 (buf!1221 thiss!1379))) ((_ sign_extend 32) (currentByte!2633 thiss!1379)) ((_ sign_extend 32) (currentBit!2628 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!39354 () Bool)

(assert (=> b!39354 (= e!25915 e!25909)))

(declare-fun res!33450 () Bool)

(assert (=> b!39354 (=> res!33450 e!25909)))

(declare-fun lt!59739 () (_ BitVec 64))

(assert (=> b!39354 (= res!33450 (not (= lt!59739 (bvsub (bvadd lt!59748 to!314) i!635))))))

(assert (=> b!39354 (= lt!59739 (bitIndex!0 (size!893 (buf!1221 (_2!1989 lt!59738))) (currentByte!2633 (_2!1989 lt!59738)) (currentBit!2628 (_2!1989 lt!59738))))))

(declare-fun b!39355 () Bool)

(assert (=> b!39355 (= e!25904 e!25912)))

(declare-fun res!33462 () Bool)

(assert (=> b!39355 (=> res!33462 e!25912)))

(assert (=> b!39355 (= res!33462 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!59744 () (_ BitVec 64))

(assert (=> b!39355 (= lt!59737 (bitStreamReadBitsIntoList!0 (_2!1989 lt!59738) (_1!1988 lt!59752) lt!59744))))

(assert (=> b!39355 (= lt!59741 (bitStreamReadBitsIntoList!0 (_2!1989 lt!59738) (_1!1988 lt!59745) (bvsub to!314 i!635)))))

(assert (=> b!39355 (validate_offset_bits!1 ((_ sign_extend 32) (size!893 (buf!1221 (_2!1989 lt!59738)))) ((_ sign_extend 32) (currentByte!2633 (_2!1989 lt!59758))) ((_ sign_extend 32) (currentBit!2628 (_2!1989 lt!59758))) lt!59744)))

(declare-fun lt!59761 () Unit!2807)

(assert (=> b!39355 (= lt!59761 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1989 lt!59758) (buf!1221 (_2!1989 lt!59738)) lt!59744))))

(assert (=> b!39355 (= lt!59752 (reader!0 (_2!1989 lt!59758) (_2!1989 lt!59738)))))

(assert (=> b!39355 (validate_offset_bits!1 ((_ sign_extend 32) (size!893 (buf!1221 (_2!1989 lt!59738)))) ((_ sign_extend 32) (currentByte!2633 thiss!1379)) ((_ sign_extend 32) (currentBit!2628 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!59747 () Unit!2807)

(assert (=> b!39355 (= lt!59747 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1221 (_2!1989 lt!59738)) (bvsub to!314 i!635)))))

(assert (=> b!39355 (= lt!59745 (reader!0 thiss!1379 (_2!1989 lt!59738)))))

(declare-fun b!39356 () Bool)

(assert (=> b!39356 (= e!25914 e!25907)))

(declare-fun res!33449 () Bool)

(assert (=> b!39356 (=> res!33449 e!25907)))

(assert (=> b!39356 (= res!33449 (not (isPrefixOf!0 thiss!1379 (_2!1989 lt!59758))))))

(assert (=> b!39356 (validate_offset_bits!1 ((_ sign_extend 32) (size!893 (buf!1221 (_2!1989 lt!59758)))) ((_ sign_extend 32) (currentByte!2633 (_2!1989 lt!59758))) ((_ sign_extend 32) (currentBit!2628 (_2!1989 lt!59758))) lt!59744)))

(assert (=> b!39356 (= lt!59744 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!59759 () Unit!2807)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1536 BitStream!1536 (_ BitVec 64) (_ BitVec 64)) Unit!2807)

(assert (=> b!39356 (= lt!59759 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1989 lt!59758) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1536 (_ BitVec 8) (_ BitVec 32)) tuple2!3804)

(assert (=> b!39356 (= lt!59758 (appendBitFromByte!0 thiss!1379 (select (arr!1389 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!39357 () Bool)

(assert (=> b!39357 (= e!25909 e!25904)))

(declare-fun res!33466 () Bool)

(assert (=> b!39357 (=> res!33466 e!25904)))

(assert (=> b!39357 (= res!33466 (not (= (size!893 (buf!1221 (_2!1989 lt!59758))) (size!893 (buf!1221 (_2!1989 lt!59738))))))))

(declare-fun lt!59756 () (_ BitVec 64))

(assert (=> b!39357 (= lt!59739 (bvsub (bvsub (bvadd lt!59756 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!39357 (= lt!59756 (bitIndex!0 (size!893 (buf!1221 (_2!1989 lt!59758))) (currentByte!2633 (_2!1989 lt!59758)) (currentBit!2628 (_2!1989 lt!59758))))))

(assert (=> b!39357 (= (size!893 (buf!1221 (_2!1989 lt!59738))) (size!893 (buf!1221 thiss!1379)))))

(declare-fun b!39358 () Bool)

(assert (=> b!39358 (= e!25910 e!25906)))

(declare-fun res!33467 () Bool)

(assert (=> b!39358 (=> res!33467 e!25906)))

(declare-fun lt!59749 () Bool)

(assert (=> b!39358 (= res!33467 (not (= lt!59749 lt!59740)))))

(assert (=> b!39358 (= lt!59754 lt!59749)))

(assert (=> b!39358 (= lt!59749 (bitAt!0 (buf!1221 (_2!1989 lt!59738)) lt!59748))))

(declare-fun lt!59750 () Unit!2807)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1981 array!1981 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2807)

(assert (=> b!39358 (= lt!59750 (arrayBitRangesEqImpliesEq!0 (buf!1221 (_2!1989 lt!59758)) (buf!1221 (_2!1989 lt!59738)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!59748 lt!59756))))

(assert (= (and start!7930 res!33463) b!39353))

(assert (= (and b!39353 res!33468) b!39342))

(assert (= (and b!39342 (not res!33454)) b!39356))

(assert (= (and b!39356 (not res!33449)) b!39352))

(assert (= (and b!39352 res!33455) b!39343))

(assert (= (and b!39352 (not res!33460)) b!39354))

(assert (= (and b!39354 (not res!33450)) b!39350))

(assert (= (and b!39350 (not res!33456)) b!39341))

(assert (= (and b!39341 (not res!33458)) b!39357))

(assert (= (and b!39357 (not res!33466)) b!39340))

(assert (= (and b!39340 (not res!33464)) b!39351))

(assert (= (and b!39351 (not res!33465)) b!39355))

(assert (= (and b!39355 (not res!33462)) b!39346))

(assert (= (and b!39346 (not res!33459)) b!39338))

(assert (= (and b!39338 (not res!33461)) b!39345))

(assert (= (and b!39345 (not res!33453)) b!39339))

(assert (= (and b!39339 (not res!33451)) b!39348))

(assert (= (and b!39348 (not res!33457)) b!39349))

(assert (= (and b!39349 (not res!33452)) b!39358))

(assert (= (and b!39358 (not res!33467)) b!39347))

(assert (= start!7930 b!39344))

(declare-fun m!59969 () Bool)

(assert (=> b!39355 m!59969))

(declare-fun m!59971 () Bool)

(assert (=> b!39355 m!59971))

(declare-fun m!59973 () Bool)

(assert (=> b!39355 m!59973))

(declare-fun m!59975 () Bool)

(assert (=> b!39355 m!59975))

(declare-fun m!59977 () Bool)

(assert (=> b!39355 m!59977))

(declare-fun m!59979 () Bool)

(assert (=> b!39355 m!59979))

(declare-fun m!59981 () Bool)

(assert (=> b!39355 m!59981))

(declare-fun m!59983 () Bool)

(assert (=> b!39355 m!59983))

(declare-fun m!59985 () Bool)

(assert (=> b!39352 m!59985))

(declare-fun m!59987 () Bool)

(assert (=> b!39352 m!59987))

(declare-fun m!59989 () Bool)

(assert (=> b!39352 m!59989))

(declare-fun m!59991 () Bool)

(assert (=> b!39352 m!59991))

(declare-fun m!59993 () Bool)

(assert (=> b!39352 m!59993))

(declare-fun m!59995 () Bool)

(assert (=> b!39352 m!59995))

(declare-fun m!59997 () Bool)

(assert (=> b!39352 m!59997))

(declare-fun m!59999 () Bool)

(assert (=> b!39339 m!59999))

(declare-fun m!60001 () Bool)

(assert (=> b!39348 m!60001))

(assert (=> b!39348 m!60001))

(declare-fun m!60003 () Bool)

(assert (=> b!39348 m!60003))

(declare-fun m!60005 () Bool)

(assert (=> b!39348 m!60005))

(declare-fun m!60007 () Bool)

(assert (=> b!39351 m!60007))

(declare-fun m!60009 () Bool)

(assert (=> b!39340 m!60009))

(declare-fun m!60011 () Bool)

(assert (=> b!39350 m!60011))

(declare-fun m!60013 () Bool)

(assert (=> start!7930 m!60013))

(declare-fun m!60015 () Bool)

(assert (=> start!7930 m!60015))

(declare-fun m!60017 () Bool)

(assert (=> b!39358 m!60017))

(declare-fun m!60019 () Bool)

(assert (=> b!39358 m!60019))

(declare-fun m!60021 () Bool)

(assert (=> b!39353 m!60021))

(declare-fun m!60023 () Bool)

(assert (=> b!39345 m!60023))

(declare-fun m!60025 () Bool)

(assert (=> b!39345 m!60025))

(declare-fun m!60027 () Bool)

(assert (=> b!39354 m!60027))

(declare-fun m!60029 () Bool)

(assert (=> b!39357 m!60029))

(declare-fun m!60031 () Bool)

(assert (=> b!39347 m!60031))

(declare-fun m!60033 () Bool)

(assert (=> b!39344 m!60033))

(declare-fun m!60035 () Bool)

(assert (=> b!39338 m!60035))

(declare-fun m!60037 () Bool)

(assert (=> b!39338 m!60037))

(declare-fun m!60039 () Bool)

(assert (=> b!39342 m!60039))

(declare-fun m!60041 () Bool)

(assert (=> b!39342 m!60041))

(declare-fun m!60043 () Bool)

(assert (=> b!39342 m!60043))

(declare-fun m!60045 () Bool)

(assert (=> b!39356 m!60045))

(declare-fun m!60047 () Bool)

(assert (=> b!39356 m!60047))

(declare-fun m!60049 () Bool)

(assert (=> b!39356 m!60049))

(declare-fun m!60051 () Bool)

(assert (=> b!39356 m!60051))

(assert (=> b!39356 m!60045))

(declare-fun m!60053 () Bool)

(assert (=> b!39356 m!60053))

(declare-fun m!60055 () Bool)

(assert (=> b!39346 m!60055))

(declare-fun m!60057 () Bool)

(assert (=> b!39343 m!60057))

(assert (=> b!39343 m!60057))

(declare-fun m!60059 () Bool)

(assert (=> b!39343 m!60059))

(declare-fun m!60061 () Bool)

(assert (=> b!39343 m!60061))

(assert (=> b!39343 m!60061))

(declare-fun m!60063 () Bool)

(assert (=> b!39343 m!60063))

(declare-fun m!60065 () Bool)

(assert (=> b!39349 m!60065))

(check-sat (not b!39343) (not b!39347) (not b!39340) (not b!39349) (not b!39346) (not b!39352) (not start!7930) (not b!39348) (not b!39355) (not b!39345) (not b!39358) (not b!39338) (not b!39357) (not b!39353) (not b!39344) (not b!39350) (not b!39342) (not b!39339) (not b!39356) (not b!39351) (not b!39354))
