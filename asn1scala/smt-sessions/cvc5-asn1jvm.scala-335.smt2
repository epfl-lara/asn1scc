; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7910 () Bool)

(assert start!7910)

(declare-fun b!38708 () Bool)

(declare-fun e!25431 () Bool)

(declare-fun e!25421 () Bool)

(assert (=> b!38708 (= e!25431 e!25421)))

(declare-fun res!32865 () Bool)

(assert (=> b!38708 (=> res!32865 e!25421)))

(declare-datatypes ((array!1961 0))(
  ( (array!1962 (arr!1379 (Array (_ BitVec 32) (_ BitVec 8))) (size!883 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1516 0))(
  ( (BitStream!1517 (buf!1211 array!1961) (currentByte!2623 (_ BitVec 32)) (currentBit!2618 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2787 0))(
  ( (Unit!2788) )
))
(declare-datatypes ((tuple2!3742 0))(
  ( (tuple2!3743 (_1!1958 Unit!2787) (_2!1958 BitStream!1516)) )
))
(declare-fun lt!58994 () tuple2!3742)

(declare-fun lt!59001 () tuple2!3742)

(assert (=> b!38708 (= res!32865 (not (= (size!883 (buf!1211 (_2!1958 lt!58994))) (size!883 (buf!1211 (_2!1958 lt!59001))))))))

(declare-fun lt!58992 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!59009 () (_ BitVec 64))

(assert (=> b!38708 (= lt!58992 (bvsub (bvsub (bvadd lt!59009 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!38708 (= lt!59009 (bitIndex!0 (size!883 (buf!1211 (_2!1958 lt!58994))) (currentByte!2623 (_2!1958 lt!58994)) (currentBit!2618 (_2!1958 lt!58994))))))

(declare-fun thiss!1379 () BitStream!1516)

(assert (=> b!38708 (= (size!883 (buf!1211 (_2!1958 lt!59001))) (size!883 (buf!1211 thiss!1379)))))

(declare-fun srcBuffer!2 () array!1961)

(declare-fun b!38709 () Bool)

(declare-datatypes ((tuple2!3744 0))(
  ( (tuple2!3745 (_1!1959 BitStream!1516) (_2!1959 BitStream!1516)) )
))
(declare-fun lt!58989 () tuple2!3744)

(declare-fun e!25425 () Bool)

(declare-datatypes ((List!459 0))(
  ( (Nil!456) (Cons!455 (h!574 Bool) (t!1209 List!459)) )
))
(declare-fun head!296 (List!459) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1516 array!1961 (_ BitVec 64) (_ BitVec 64)) List!459)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1516 BitStream!1516 (_ BitVec 64)) List!459)

(assert (=> b!38709 (= e!25425 (= (head!296 (byteArrayBitContentToList!0 (_2!1958 lt!58994) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!296 (bitStreamReadBitsIntoList!0 (_2!1958 lt!58994) (_1!1959 lt!58989) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!38710 () Bool)

(declare-fun res!32858 () Bool)

(declare-fun e!25429 () Bool)

(assert (=> b!38710 (=> (not res!32858) (not e!25429))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!38710 (= res!32858 (validate_offset_bits!1 ((_ sign_extend 32) (size!883 (buf!1211 thiss!1379))) ((_ sign_extend 32) (currentByte!2623 thiss!1379)) ((_ sign_extend 32) (currentBit!2618 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!38711 () Bool)

(declare-fun e!25434 () Bool)

(declare-fun e!25424 () Bool)

(assert (=> b!38711 (= e!25434 e!25424)))

(declare-fun res!32868 () Bool)

(assert (=> b!38711 (=> res!32868 e!25424)))

(declare-fun lt!58995 () Bool)

(assert (=> b!38711 (= res!32868 (not (= (head!296 (byteArrayBitContentToList!0 (_2!1958 lt!59001) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!58995)))))

(declare-fun bitAt!0 (array!1961 (_ BitVec 64)) Bool)

(assert (=> b!38711 (= lt!58995 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!38712 () Bool)

(declare-fun res!32866 () Bool)

(assert (=> b!38712 (=> res!32866 e!25421)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!38712 (= res!32866 (not (invariant!0 (currentBit!2618 (_2!1958 lt!58994)) (currentByte!2623 (_2!1958 lt!58994)) (size!883 (buf!1211 (_2!1958 lt!58994))))))))

(declare-fun b!38713 () Bool)

(declare-fun res!32864 () Bool)

(declare-fun e!25433 () Bool)

(assert (=> b!38713 (=> res!32864 e!25433)))

(declare-fun lt!58998 () List!459)

(declare-fun length!185 (List!459) Int)

(assert (=> b!38713 (= res!32864 (<= (length!185 lt!58998) 0))))

(declare-fun b!38714 () Bool)

(declare-fun e!25428 () Bool)

(assert (=> b!38714 (= e!25428 e!25431)))

(declare-fun res!32850 () Bool)

(assert (=> b!38714 (=> res!32850 e!25431)))

(declare-fun lt!59011 () (_ BitVec 64))

(assert (=> b!38714 (= res!32850 (not (= lt!58992 (bvsub (bvadd lt!59011 to!314) i!635))))))

(assert (=> b!38714 (= lt!58992 (bitIndex!0 (size!883 (buf!1211 (_2!1958 lt!59001))) (currentByte!2623 (_2!1958 lt!59001)) (currentBit!2618 (_2!1958 lt!59001))))))

(declare-fun b!38715 () Bool)

(declare-fun res!32857 () Bool)

(assert (=> b!38715 (=> res!32857 e!25421)))

(assert (=> b!38715 (= res!32857 (not (invariant!0 (currentBit!2618 (_2!1958 lt!58994)) (currentByte!2623 (_2!1958 lt!58994)) (size!883 (buf!1211 (_2!1958 lt!59001))))))))

(declare-fun b!38716 () Bool)

(declare-fun e!25435 () Bool)

(assert (=> b!38716 (= e!25435 true)))

(declare-datatypes ((tuple2!3746 0))(
  ( (tuple2!3747 (_1!1960 BitStream!1516) (_2!1960 Bool)) )
))
(declare-fun lt!58990 () tuple2!3746)

(declare-fun lt!58997 () tuple2!3744)

(declare-fun readBitPure!0 (BitStream!1516) tuple2!3746)

(assert (=> b!38716 (= lt!58990 (readBitPure!0 (_1!1959 lt!58997)))))

(declare-fun b!38717 () Bool)

(declare-fun res!32854 () Bool)

(assert (=> b!38717 (=> res!32854 e!25434)))

(declare-fun lt!58987 () Bool)

(assert (=> b!38717 (= res!32854 (not (= (head!296 lt!58998) lt!58987)))))

(declare-fun b!38718 () Bool)

(declare-fun e!25432 () Bool)

(assert (=> b!38718 (= e!25432 e!25435)))

(declare-fun res!32856 () Bool)

(assert (=> b!38718 (=> res!32856 e!25435)))

(declare-fun lt!58999 () Bool)

(assert (=> b!38718 (= res!32856 (not (= lt!58999 lt!58995)))))

(declare-fun lt!59007 () Bool)

(assert (=> b!38718 (= lt!59007 lt!58999)))

(assert (=> b!38718 (= lt!58999 (bitAt!0 (buf!1211 (_2!1958 lt!59001)) lt!59011))))

(declare-fun lt!59010 () Unit!2787)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1961 array!1961 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2787)

(assert (=> b!38718 (= lt!59010 (arrayBitRangesEqImpliesEq!0 (buf!1211 (_2!1958 lt!58994)) (buf!1211 (_2!1958 lt!59001)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!59011 lt!59009))))

(declare-fun b!38719 () Bool)

(declare-fun e!25423 () Bool)

(assert (=> b!38719 (= e!25423 e!25434)))

(declare-fun res!32862 () Bool)

(assert (=> b!38719 (=> res!32862 e!25434)))

(declare-fun lt!58996 () tuple2!3744)

(assert (=> b!38719 (= res!32862 (not (= lt!58987 (bitAt!0 (buf!1211 (_1!1959 lt!58996)) lt!59011))))))

(assert (=> b!38719 (= lt!58987 (bitAt!0 (buf!1211 (_1!1959 lt!58997)) lt!59011))))

(declare-fun b!38720 () Bool)

(declare-fun e!25430 () Bool)

(declare-fun array_inv!811 (array!1961) Bool)

(assert (=> b!38720 (= e!25430 (array_inv!811 (buf!1211 thiss!1379)))))

(declare-fun b!38721 () Bool)

(declare-fun e!25426 () Bool)

(assert (=> b!38721 (= e!25429 (not e!25426))))

(declare-fun res!32855 () Bool)

(assert (=> b!38721 (=> res!32855 e!25426)))

(assert (=> b!38721 (= res!32855 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1516 BitStream!1516) Bool)

(assert (=> b!38721 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!59000 () Unit!2787)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1516) Unit!2787)

(assert (=> b!38721 (= lt!59000 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!38721 (= lt!59011 (bitIndex!0 (size!883 (buf!1211 thiss!1379)) (currentByte!2623 thiss!1379) (currentBit!2618 thiss!1379)))))

(declare-fun b!38722 () Bool)

(assert (=> b!38722 (= e!25421 e!25433)))

(declare-fun res!32851 () Bool)

(assert (=> b!38722 (=> res!32851 e!25433)))

(assert (=> b!38722 (= res!32851 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!58993 () (_ BitVec 64))

(declare-fun lt!59005 () List!459)

(assert (=> b!38722 (= lt!59005 (bitStreamReadBitsIntoList!0 (_2!1958 lt!59001) (_1!1959 lt!58996) lt!58993))))

(assert (=> b!38722 (= lt!58998 (bitStreamReadBitsIntoList!0 (_2!1958 lt!59001) (_1!1959 lt!58997) (bvsub to!314 i!635)))))

(assert (=> b!38722 (validate_offset_bits!1 ((_ sign_extend 32) (size!883 (buf!1211 (_2!1958 lt!59001)))) ((_ sign_extend 32) (currentByte!2623 (_2!1958 lt!58994))) ((_ sign_extend 32) (currentBit!2618 (_2!1958 lt!58994))) lt!58993)))

(declare-fun lt!58988 () Unit!2787)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1516 array!1961 (_ BitVec 64)) Unit!2787)

(assert (=> b!38722 (= lt!58988 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1958 lt!58994) (buf!1211 (_2!1958 lt!59001)) lt!58993))))

(declare-fun reader!0 (BitStream!1516 BitStream!1516) tuple2!3744)

(assert (=> b!38722 (= lt!58996 (reader!0 (_2!1958 lt!58994) (_2!1958 lt!59001)))))

(assert (=> b!38722 (validate_offset_bits!1 ((_ sign_extend 32) (size!883 (buf!1211 (_2!1958 lt!59001)))) ((_ sign_extend 32) (currentByte!2623 thiss!1379)) ((_ sign_extend 32) (currentBit!2618 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!59002 () Unit!2787)

(assert (=> b!38722 (= lt!59002 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1211 (_2!1958 lt!59001)) (bvsub to!314 i!635)))))

(assert (=> b!38722 (= lt!58997 (reader!0 thiss!1379 (_2!1958 lt!59001)))))

(declare-fun b!38723 () Bool)

(assert (=> b!38723 (= e!25433 e!25423)))

(declare-fun res!32852 () Bool)

(assert (=> b!38723 (=> res!32852 e!25423)))

(declare-fun lt!59008 () List!459)

(assert (=> b!38723 (= res!32852 (not (= lt!59008 lt!59005)))))

(assert (=> b!38723 (= lt!59005 lt!59008)))

(declare-fun tail!176 (List!459) List!459)

(assert (=> b!38723 (= lt!59008 (tail!176 lt!58998))))

(declare-fun lt!59004 () Unit!2787)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1516 BitStream!1516 BitStream!1516 BitStream!1516 (_ BitVec 64) List!459) Unit!2787)

(assert (=> b!38723 (= lt!59004 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1958 lt!59001) (_2!1958 lt!59001) (_1!1959 lt!58997) (_1!1959 lt!58996) (bvsub to!314 i!635) lt!58998))))

(declare-fun b!38724 () Bool)

(assert (=> b!38724 (= e!25424 e!25432)))

(declare-fun res!32860 () Bool)

(assert (=> b!38724 (=> res!32860 e!25432)))

(assert (=> b!38724 (= res!32860 (not (= lt!59007 lt!58995)))))

(assert (=> b!38724 (= lt!59007 (bitAt!0 (buf!1211 (_2!1958 lt!58994)) lt!59011))))

(declare-fun res!32867 () Bool)

(assert (=> start!7910 (=> (not res!32867) (not e!25429))))

(assert (=> start!7910 (= res!32867 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!883 srcBuffer!2))))))))

(assert (=> start!7910 e!25429))

(assert (=> start!7910 true))

(assert (=> start!7910 (array_inv!811 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1516) Bool)

(assert (=> start!7910 (and (inv!12 thiss!1379) e!25430)))

(declare-fun b!38725 () Bool)

(declare-fun e!25422 () Bool)

(assert (=> b!38725 (= e!25426 e!25422)))

(declare-fun res!32849 () Bool)

(assert (=> b!38725 (=> res!32849 e!25422)))

(assert (=> b!38725 (= res!32849 (not (isPrefixOf!0 thiss!1379 (_2!1958 lt!58994))))))

(assert (=> b!38725 (validate_offset_bits!1 ((_ sign_extend 32) (size!883 (buf!1211 (_2!1958 lt!58994)))) ((_ sign_extend 32) (currentByte!2623 (_2!1958 lt!58994))) ((_ sign_extend 32) (currentBit!2618 (_2!1958 lt!58994))) lt!58993)))

(assert (=> b!38725 (= lt!58993 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!59006 () Unit!2787)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1516 BitStream!1516 (_ BitVec 64) (_ BitVec 64)) Unit!2787)

(assert (=> b!38725 (= lt!59006 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1958 lt!58994) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1516 (_ BitVec 8) (_ BitVec 32)) tuple2!3742)

(assert (=> b!38725 (= lt!58994 (appendBitFromByte!0 thiss!1379 (select (arr!1379 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!38726 () Bool)

(assert (=> b!38726 (= e!25422 e!25428)))

(declare-fun res!32853 () Bool)

(assert (=> b!38726 (=> res!32853 e!25428)))

(assert (=> b!38726 (= res!32853 (not (isPrefixOf!0 (_2!1958 lt!58994) (_2!1958 lt!59001))))))

(assert (=> b!38726 (isPrefixOf!0 thiss!1379 (_2!1958 lt!59001))))

(declare-fun lt!58991 () Unit!2787)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1516 BitStream!1516 BitStream!1516) Unit!2787)

(assert (=> b!38726 (= lt!58991 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1958 lt!58994) (_2!1958 lt!59001)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1516 array!1961 (_ BitVec 64) (_ BitVec 64)) tuple2!3742)

(assert (=> b!38726 (= lt!59001 (appendBitsMSBFirstLoop!0 (_2!1958 lt!58994) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!38726 e!25425))

(declare-fun res!32861 () Bool)

(assert (=> b!38726 (=> (not res!32861) (not e!25425))))

(assert (=> b!38726 (= res!32861 (validate_offset_bits!1 ((_ sign_extend 32) (size!883 (buf!1211 (_2!1958 lt!58994)))) ((_ sign_extend 32) (currentByte!2623 thiss!1379)) ((_ sign_extend 32) (currentBit!2618 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!59003 () Unit!2787)

(assert (=> b!38726 (= lt!59003 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1211 (_2!1958 lt!58994)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!38726 (= lt!58989 (reader!0 thiss!1379 (_2!1958 lt!58994)))))

(declare-fun b!38727 () Bool)

(declare-fun res!32859 () Bool)

(assert (=> b!38727 (=> res!32859 e!25431)))

(assert (=> b!38727 (= res!32859 (not (invariant!0 (currentBit!2618 (_2!1958 lt!59001)) (currentByte!2623 (_2!1958 lt!59001)) (size!883 (buf!1211 (_2!1958 lt!59001))))))))

(declare-fun b!38728 () Bool)

(declare-fun res!32863 () Bool)

(assert (=> b!38728 (=> res!32863 e!25431)))

(assert (=> b!38728 (= res!32863 (not (= (size!883 (buf!1211 thiss!1379)) (size!883 (buf!1211 (_2!1958 lt!59001))))))))

(assert (= (and start!7910 res!32867) b!38710))

(assert (= (and b!38710 res!32858) b!38721))

(assert (= (and b!38721 (not res!32855)) b!38725))

(assert (= (and b!38725 (not res!32849)) b!38726))

(assert (= (and b!38726 res!32861) b!38709))

(assert (= (and b!38726 (not res!32853)) b!38714))

(assert (= (and b!38714 (not res!32850)) b!38727))

(assert (= (and b!38727 (not res!32859)) b!38728))

(assert (= (and b!38728 (not res!32863)) b!38708))

(assert (= (and b!38708 (not res!32865)) b!38712))

(assert (= (and b!38712 (not res!32866)) b!38715))

(assert (= (and b!38715 (not res!32857)) b!38722))

(assert (= (and b!38722 (not res!32851)) b!38713))

(assert (= (and b!38713 (not res!32864)) b!38723))

(assert (= (and b!38723 (not res!32852)) b!38719))

(assert (= (and b!38719 (not res!32862)) b!38717))

(assert (= (and b!38717 (not res!32854)) b!38711))

(assert (= (and b!38711 (not res!32868)) b!38724))

(assert (= (and b!38724 (not res!32860)) b!38718))

(assert (= (and b!38718 (not res!32856)) b!38716))

(assert (= start!7910 b!38720))

(declare-fun m!58989 () Bool)

(assert (=> b!38708 m!58989))

(declare-fun m!58991 () Bool)

(assert (=> b!38715 m!58991))

(declare-fun m!58993 () Bool)

(assert (=> b!38711 m!58993))

(assert (=> b!38711 m!58993))

(declare-fun m!58995 () Bool)

(assert (=> b!38711 m!58995))

(declare-fun m!58997 () Bool)

(assert (=> b!38711 m!58997))

(declare-fun m!58999 () Bool)

(assert (=> b!38714 m!58999))

(declare-fun m!59001 () Bool)

(assert (=> b!38712 m!59001))

(declare-fun m!59003 () Bool)

(assert (=> b!38723 m!59003))

(declare-fun m!59005 () Bool)

(assert (=> b!38723 m!59005))

(declare-fun m!59007 () Bool)

(assert (=> b!38713 m!59007))

(declare-fun m!59009 () Bool)

(assert (=> b!38720 m!59009))

(declare-fun m!59011 () Bool)

(assert (=> b!38718 m!59011))

(declare-fun m!59013 () Bool)

(assert (=> b!38718 m!59013))

(declare-fun m!59015 () Bool)

(assert (=> start!7910 m!59015))

(declare-fun m!59017 () Bool)

(assert (=> start!7910 m!59017))

(declare-fun m!59019 () Bool)

(assert (=> b!38724 m!59019))

(declare-fun m!59021 () Bool)

(assert (=> b!38721 m!59021))

(declare-fun m!59023 () Bool)

(assert (=> b!38721 m!59023))

(declare-fun m!59025 () Bool)

(assert (=> b!38721 m!59025))

(declare-fun m!59027 () Bool)

(assert (=> b!38709 m!59027))

(assert (=> b!38709 m!59027))

(declare-fun m!59029 () Bool)

(assert (=> b!38709 m!59029))

(declare-fun m!59031 () Bool)

(assert (=> b!38709 m!59031))

(assert (=> b!38709 m!59031))

(declare-fun m!59033 () Bool)

(assert (=> b!38709 m!59033))

(declare-fun m!59035 () Bool)

(assert (=> b!38719 m!59035))

(declare-fun m!59037 () Bool)

(assert (=> b!38719 m!59037))

(declare-fun m!59039 () Bool)

(assert (=> b!38717 m!59039))

(declare-fun m!59041 () Bool)

(assert (=> b!38722 m!59041))

(declare-fun m!59043 () Bool)

(assert (=> b!38722 m!59043))

(declare-fun m!59045 () Bool)

(assert (=> b!38722 m!59045))

(declare-fun m!59047 () Bool)

(assert (=> b!38722 m!59047))

(declare-fun m!59049 () Bool)

(assert (=> b!38722 m!59049))

(declare-fun m!59051 () Bool)

(assert (=> b!38722 m!59051))

(declare-fun m!59053 () Bool)

(assert (=> b!38722 m!59053))

(declare-fun m!59055 () Bool)

(assert (=> b!38722 m!59055))

(declare-fun m!59057 () Bool)

(assert (=> b!38716 m!59057))

(declare-fun m!59059 () Bool)

(assert (=> b!38726 m!59059))

(declare-fun m!59061 () Bool)

(assert (=> b!38726 m!59061))

(declare-fun m!59063 () Bool)

(assert (=> b!38726 m!59063))

(declare-fun m!59065 () Bool)

(assert (=> b!38726 m!59065))

(declare-fun m!59067 () Bool)

(assert (=> b!38726 m!59067))

(declare-fun m!59069 () Bool)

(assert (=> b!38726 m!59069))

(declare-fun m!59071 () Bool)

(assert (=> b!38726 m!59071))

(declare-fun m!59073 () Bool)

(assert (=> b!38725 m!59073))

(declare-fun m!59075 () Bool)

(assert (=> b!38725 m!59075))

(declare-fun m!59077 () Bool)

(assert (=> b!38725 m!59077))

(declare-fun m!59079 () Bool)

(assert (=> b!38725 m!59079))

(assert (=> b!38725 m!59075))

(declare-fun m!59081 () Bool)

(assert (=> b!38725 m!59081))

(declare-fun m!59083 () Bool)

(assert (=> b!38727 m!59083))

(declare-fun m!59085 () Bool)

(assert (=> b!38710 m!59085))

(push 1)

