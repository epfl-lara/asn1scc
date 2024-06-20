; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!12338 () Bool)

(assert start!12338)

(declare-fun b!62974 () Bool)

(declare-fun e!41777 () Bool)

(declare-fun e!41773 () Bool)

(assert (=> b!62974 (= e!41777 e!41773)))

(declare-fun res!52363 () Bool)

(assert (=> b!62974 (=> res!52363 e!41773)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!99069 () (_ BitVec 64))

(declare-fun lt!99064 () (_ BitVec 64))

(assert (=> b!62974 (= res!52363 (not (= lt!99069 (bvsub (bvadd lt!99064 to!314) i!635))))))

(declare-datatypes ((array!2799 0))(
  ( (array!2800 (arr!1845 (Array (_ BitVec 32) (_ BitVec 8))) (size!1281 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2226 0))(
  ( (BitStream!2227 (buf!1662 array!2799) (currentByte!3304 (_ BitVec 32)) (currentBit!3299 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4279 0))(
  ( (Unit!4280) )
))
(declare-datatypes ((tuple2!5670 0))(
  ( (tuple2!5671 (_1!2946 Unit!4279) (_2!2946 BitStream!2226)) )
))
(declare-fun lt!99061 () tuple2!5670)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!62974 (= lt!99069 (bitIndex!0 (size!1281 (buf!1662 (_2!2946 lt!99061))) (currentByte!3304 (_2!2946 lt!99061)) (currentBit!3299 (_2!2946 lt!99061))))))

(declare-fun b!62975 () Bool)

(declare-fun e!41770 () Bool)

(declare-fun e!41767 () Bool)

(assert (=> b!62975 (= e!41770 e!41767)))

(declare-fun res!52374 () Bool)

(assert (=> b!62975 (=> res!52374 e!41767)))

(assert (=> b!62975 (= res!52374 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!99073 () (_ BitVec 64))

(declare-datatypes ((tuple2!5672 0))(
  ( (tuple2!5673 (_1!2947 BitStream!2226) (_2!2947 BitStream!2226)) )
))
(declare-fun lt!99063 () tuple2!5672)

(declare-datatypes ((List!688 0))(
  ( (Nil!685) (Cons!684 (h!803 Bool) (t!1438 List!688)) )
))
(declare-fun lt!99065 () List!688)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2226 BitStream!2226 (_ BitVec 64)) List!688)

(assert (=> b!62975 (= lt!99065 (bitStreamReadBitsIntoList!0 (_2!2946 lt!99061) (_1!2947 lt!99063) lt!99073))))

(declare-fun lt!99076 () tuple2!5672)

(declare-fun lt!99068 () List!688)

(assert (=> b!62975 (= lt!99068 (bitStreamReadBitsIntoList!0 (_2!2946 lt!99061) (_1!2947 lt!99076) (bvsub to!314 i!635)))))

(declare-fun lt!99070 () tuple2!5670)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!62975 (validate_offset_bits!1 ((_ sign_extend 32) (size!1281 (buf!1662 (_2!2946 lt!99061)))) ((_ sign_extend 32) (currentByte!3304 (_2!2946 lt!99070))) ((_ sign_extend 32) (currentBit!3299 (_2!2946 lt!99070))) lt!99073)))

(declare-fun lt!99066 () Unit!4279)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2226 array!2799 (_ BitVec 64)) Unit!4279)

(assert (=> b!62975 (= lt!99066 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2946 lt!99070) (buf!1662 (_2!2946 lt!99061)) lt!99073))))

(declare-fun reader!0 (BitStream!2226 BitStream!2226) tuple2!5672)

(assert (=> b!62975 (= lt!99063 (reader!0 (_2!2946 lt!99070) (_2!2946 lt!99061)))))

(declare-fun thiss!1379 () BitStream!2226)

(assert (=> b!62975 (validate_offset_bits!1 ((_ sign_extend 32) (size!1281 (buf!1662 (_2!2946 lt!99061)))) ((_ sign_extend 32) (currentByte!3304 thiss!1379)) ((_ sign_extend 32) (currentBit!3299 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!99072 () Unit!4279)

(assert (=> b!62975 (= lt!99072 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1662 (_2!2946 lt!99061)) (bvsub to!314 i!635)))))

(assert (=> b!62975 (= lt!99076 (reader!0 thiss!1379 (_2!2946 lt!99061)))))

(declare-fun b!62976 () Bool)

(declare-fun e!41776 () Bool)

(declare-fun e!41768 () Bool)

(assert (=> b!62976 (= e!41776 e!41768)))

(declare-fun res!52379 () Bool)

(assert (=> b!62976 (=> res!52379 e!41768)))

(declare-fun isPrefixOf!0 (BitStream!2226 BitStream!2226) Bool)

(assert (=> b!62976 (= res!52379 (not (isPrefixOf!0 thiss!1379 (_2!2946 lt!99070))))))

(assert (=> b!62976 (validate_offset_bits!1 ((_ sign_extend 32) (size!1281 (buf!1662 (_2!2946 lt!99070)))) ((_ sign_extend 32) (currentByte!3304 (_2!2946 lt!99070))) ((_ sign_extend 32) (currentBit!3299 (_2!2946 lt!99070))) lt!99073)))

(assert (=> b!62976 (= lt!99073 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!99074 () Unit!4279)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2226 BitStream!2226 (_ BitVec 64) (_ BitVec 64)) Unit!4279)

(assert (=> b!62976 (= lt!99074 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2946 lt!99070) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2799)

(declare-fun appendBitFromByte!0 (BitStream!2226 (_ BitVec 8) (_ BitVec 32)) tuple2!5670)

(assert (=> b!62976 (= lt!99070 (appendBitFromByte!0 thiss!1379 (select (arr!1845 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!62977 () Bool)

(declare-fun res!52371 () Bool)

(assert (=> b!62977 (=> res!52371 e!41773)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!62977 (= res!52371 (not (invariant!0 (currentBit!3299 (_2!2946 lt!99061)) (currentByte!3304 (_2!2946 lt!99061)) (size!1281 (buf!1662 (_2!2946 lt!99061))))))))

(declare-fun b!62978 () Bool)

(assert (=> b!62978 (= e!41773 e!41770)))

(declare-fun res!52375 () Bool)

(assert (=> b!62978 (=> res!52375 e!41770)))

(assert (=> b!62978 (= res!52375 (not (= (size!1281 (buf!1662 (_2!2946 lt!99070))) (size!1281 (buf!1662 (_2!2946 lt!99061))))))))

(declare-fun e!41772 () Bool)

(assert (=> b!62978 e!41772))

(declare-fun res!52373 () Bool)

(assert (=> b!62978 (=> (not res!52373) (not e!41772))))

(assert (=> b!62978 (= res!52373 (= (size!1281 (buf!1662 (_2!2946 lt!99061))) (size!1281 (buf!1662 thiss!1379))))))

(declare-fun b!62979 () Bool)

(declare-fun res!52367 () Bool)

(assert (=> b!62979 (=> res!52367 e!41767)))

(assert (=> b!62979 (= res!52367 (not (isPrefixOf!0 (_1!2947 lt!99063) (_2!2946 lt!99061))))))

(declare-fun b!62980 () Bool)

(declare-fun res!52376 () Bool)

(assert (=> b!62980 (=> res!52376 e!41767)))

(declare-fun length!316 (List!688) Int)

(assert (=> b!62980 (= res!52376 (<= (length!316 lt!99068) 0))))

(declare-fun b!62981 () Bool)

(declare-fun e!41775 () Bool)

(declare-fun array_inv!1172 (array!2799) Bool)

(assert (=> b!62981 (= e!41775 (array_inv!1172 (buf!1662 thiss!1379)))))

(declare-fun res!52377 () Bool)

(declare-fun e!41774 () Bool)

(assert (=> start!12338 (=> (not res!52377) (not e!41774))))

(assert (=> start!12338 (= res!52377 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1281 srcBuffer!2))))))))

(assert (=> start!12338 e!41774))

(assert (=> start!12338 true))

(assert (=> start!12338 (array_inv!1172 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2226) Bool)

(assert (=> start!12338 (and (inv!12 thiss!1379) e!41775)))

(declare-fun b!62982 () Bool)

(declare-fun res!52368 () Bool)

(assert (=> b!62982 (=> res!52368 e!41773)))

(assert (=> b!62982 (= res!52368 (not (= (size!1281 (buf!1662 thiss!1379)) (size!1281 (buf!1662 (_2!2946 lt!99061))))))))

(declare-fun b!62983 () Bool)

(declare-fun res!52366 () Bool)

(assert (=> b!62983 (=> res!52366 e!41767)))

(assert (=> b!62983 (= res!52366 (not (isPrefixOf!0 (_1!2947 lt!99076) (_1!2947 lt!99063))))))

(declare-fun b!62984 () Bool)

(declare-fun res!52364 () Bool)

(assert (=> b!62984 (=> res!52364 e!41770)))

(assert (=> b!62984 (= res!52364 (not (invariant!0 (currentBit!3299 (_2!2946 lt!99070)) (currentByte!3304 (_2!2946 lt!99070)) (size!1281 (buf!1662 (_2!2946 lt!99061))))))))

(declare-fun b!62985 () Bool)

(assert (=> b!62985 (= e!41772 (= lt!99069 (bvsub (bvsub (bvadd (bitIndex!0 (size!1281 (buf!1662 (_2!2946 lt!99070))) (currentByte!3304 (_2!2946 lt!99070)) (currentBit!3299 (_2!2946 lt!99070))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!62986 () Bool)

(declare-fun res!52380 () Bool)

(assert (=> b!62986 (=> res!52380 e!41767)))

(assert (=> b!62986 (= res!52380 (not (isPrefixOf!0 (_1!2947 lt!99076) (_2!2946 lt!99061))))))

(declare-fun b!62987 () Bool)

(declare-fun e!41769 () Bool)

(declare-fun lt!99067 () tuple2!5672)

(declare-fun head!507 (List!688) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2226 array!2799 (_ BitVec 64) (_ BitVec 64)) List!688)

(assert (=> b!62987 (= e!41769 (= (head!507 (byteArrayBitContentToList!0 (_2!2946 lt!99070) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!507 (bitStreamReadBitsIntoList!0 (_2!2946 lt!99070) (_1!2947 lt!99067) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!62988 () Bool)

(assert (=> b!62988 (= e!41767 (or (not (= (buf!1662 (_1!2947 lt!99076)) (buf!1662 (_1!2947 lt!99063)))) (= (buf!1662 (_1!2947 lt!99076)) (buf!1662 (_2!2946 lt!99061)))))))

(declare-fun b!62989 () Bool)

(declare-fun res!52369 () Bool)

(assert (=> b!62989 (=> (not res!52369) (not e!41774))))

(assert (=> b!62989 (= res!52369 (validate_offset_bits!1 ((_ sign_extend 32) (size!1281 (buf!1662 thiss!1379))) ((_ sign_extend 32) (currentByte!3304 thiss!1379)) ((_ sign_extend 32) (currentBit!3299 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!62990 () Bool)

(assert (=> b!62990 (= e!41768 e!41777)))

(declare-fun res!52365 () Bool)

(assert (=> b!62990 (=> res!52365 e!41777)))

(assert (=> b!62990 (= res!52365 (not (isPrefixOf!0 (_2!2946 lt!99070) (_2!2946 lt!99061))))))

(assert (=> b!62990 (isPrefixOf!0 thiss!1379 (_2!2946 lt!99061))))

(declare-fun lt!99075 () Unit!4279)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2226 BitStream!2226 BitStream!2226) Unit!4279)

(assert (=> b!62990 (= lt!99075 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2946 lt!99070) (_2!2946 lt!99061)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2226 array!2799 (_ BitVec 64) (_ BitVec 64)) tuple2!5670)

(assert (=> b!62990 (= lt!99061 (appendBitsMSBFirstLoop!0 (_2!2946 lt!99070) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!62990 e!41769))

(declare-fun res!52372 () Bool)

(assert (=> b!62990 (=> (not res!52372) (not e!41769))))

(assert (=> b!62990 (= res!52372 (validate_offset_bits!1 ((_ sign_extend 32) (size!1281 (buf!1662 (_2!2946 lt!99070)))) ((_ sign_extend 32) (currentByte!3304 thiss!1379)) ((_ sign_extend 32) (currentBit!3299 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!99062 () Unit!4279)

(assert (=> b!62990 (= lt!99062 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1662 (_2!2946 lt!99070)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!62990 (= lt!99067 (reader!0 thiss!1379 (_2!2946 lt!99070)))))

(declare-fun b!62991 () Bool)

(assert (=> b!62991 (= e!41774 (not e!41776))))

(declare-fun res!52378 () Bool)

(assert (=> b!62991 (=> res!52378 e!41776)))

(assert (=> b!62991 (= res!52378 (bvsge i!635 to!314))))

(assert (=> b!62991 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!99071 () Unit!4279)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2226) Unit!4279)

(assert (=> b!62991 (= lt!99071 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!62991 (= lt!99064 (bitIndex!0 (size!1281 (buf!1662 thiss!1379)) (currentByte!3304 thiss!1379) (currentBit!3299 thiss!1379)))))

(declare-fun b!62992 () Bool)

(declare-fun res!52370 () Bool)

(assert (=> b!62992 (=> res!52370 e!41770)))

(assert (=> b!62992 (= res!52370 (not (invariant!0 (currentBit!3299 (_2!2946 lt!99070)) (currentByte!3304 (_2!2946 lt!99070)) (size!1281 (buf!1662 (_2!2946 lt!99070))))))))

(assert (= (and start!12338 res!52377) b!62989))

(assert (= (and b!62989 res!52369) b!62991))

(assert (= (and b!62991 (not res!52378)) b!62976))

(assert (= (and b!62976 (not res!52379)) b!62990))

(assert (= (and b!62990 res!52372) b!62987))

(assert (= (and b!62990 (not res!52365)) b!62974))

(assert (= (and b!62974 (not res!52363)) b!62977))

(assert (= (and b!62977 (not res!52371)) b!62982))

(assert (= (and b!62982 (not res!52368)) b!62978))

(assert (= (and b!62978 res!52373) b!62985))

(assert (= (and b!62978 (not res!52375)) b!62992))

(assert (= (and b!62992 (not res!52370)) b!62984))

(assert (= (and b!62984 (not res!52364)) b!62975))

(assert (= (and b!62975 (not res!52374)) b!62980))

(assert (= (and b!62980 (not res!52376)) b!62986))

(assert (= (and b!62986 (not res!52380)) b!62979))

(assert (= (and b!62979 (not res!52367)) b!62983))

(assert (= (and b!62983 (not res!52366)) b!62988))

(assert (= start!12338 b!62981))

(declare-fun m!99681 () Bool)

(assert (=> b!62977 m!99681))

(declare-fun m!99683 () Bool)

(assert (=> b!62981 m!99683))

(declare-fun m!99685 () Bool)

(assert (=> b!62992 m!99685))

(declare-fun m!99687 () Bool)

(assert (=> b!62979 m!99687))

(declare-fun m!99689 () Bool)

(assert (=> b!62984 m!99689))

(declare-fun m!99691 () Bool)

(assert (=> b!62990 m!99691))

(declare-fun m!99693 () Bool)

(assert (=> b!62990 m!99693))

(declare-fun m!99695 () Bool)

(assert (=> b!62990 m!99695))

(declare-fun m!99697 () Bool)

(assert (=> b!62990 m!99697))

(declare-fun m!99699 () Bool)

(assert (=> b!62990 m!99699))

(declare-fun m!99701 () Bool)

(assert (=> b!62990 m!99701))

(declare-fun m!99703 () Bool)

(assert (=> b!62990 m!99703))

(declare-fun m!99705 () Bool)

(assert (=> start!12338 m!99705))

(declare-fun m!99707 () Bool)

(assert (=> start!12338 m!99707))

(declare-fun m!99709 () Bool)

(assert (=> b!62991 m!99709))

(declare-fun m!99711 () Bool)

(assert (=> b!62991 m!99711))

(declare-fun m!99713 () Bool)

(assert (=> b!62991 m!99713))

(declare-fun m!99715 () Bool)

(assert (=> b!62976 m!99715))

(declare-fun m!99717 () Bool)

(assert (=> b!62976 m!99717))

(declare-fun m!99719 () Bool)

(assert (=> b!62976 m!99719))

(declare-fun m!99721 () Bool)

(assert (=> b!62976 m!99721))

(assert (=> b!62976 m!99715))

(declare-fun m!99723 () Bool)

(assert (=> b!62976 m!99723))

(declare-fun m!99725 () Bool)

(assert (=> b!62983 m!99725))

(declare-fun m!99727 () Bool)

(assert (=> b!62975 m!99727))

(declare-fun m!99729 () Bool)

(assert (=> b!62975 m!99729))

(declare-fun m!99731 () Bool)

(assert (=> b!62975 m!99731))

(declare-fun m!99733 () Bool)

(assert (=> b!62975 m!99733))

(declare-fun m!99735 () Bool)

(assert (=> b!62975 m!99735))

(declare-fun m!99737 () Bool)

(assert (=> b!62975 m!99737))

(declare-fun m!99739 () Bool)

(assert (=> b!62975 m!99739))

(declare-fun m!99741 () Bool)

(assert (=> b!62975 m!99741))

(declare-fun m!99743 () Bool)

(assert (=> b!62980 m!99743))

(declare-fun m!99745 () Bool)

(assert (=> b!62985 m!99745))

(declare-fun m!99747 () Bool)

(assert (=> b!62974 m!99747))

(declare-fun m!99749 () Bool)

(assert (=> b!62987 m!99749))

(assert (=> b!62987 m!99749))

(declare-fun m!99751 () Bool)

(assert (=> b!62987 m!99751))

(declare-fun m!99753 () Bool)

(assert (=> b!62987 m!99753))

(assert (=> b!62987 m!99753))

(declare-fun m!99755 () Bool)

(assert (=> b!62987 m!99755))

(declare-fun m!99757 () Bool)

(assert (=> b!62989 m!99757))

(declare-fun m!99759 () Bool)

(assert (=> b!62986 m!99759))

(check-sat (not b!62987) (not b!62990) (not b!62976) (not b!62985) (not b!62981) (not start!12338) (not b!62979) (not b!62977) (not b!62991) (not b!62983) (not b!62986) (not b!62974) (not b!62984) (not b!62989) (not b!62992) (not b!62980) (not b!62975))
(check-sat)
(get-model)

(declare-fun d!19518 () Bool)

(assert (=> d!19518 (= (invariant!0 (currentBit!3299 (_2!2946 lt!99070)) (currentByte!3304 (_2!2946 lt!99070)) (size!1281 (buf!1662 (_2!2946 lt!99061)))) (and (bvsge (currentBit!3299 (_2!2946 lt!99070)) #b00000000000000000000000000000000) (bvslt (currentBit!3299 (_2!2946 lt!99070)) #b00000000000000000000000000001000) (bvsge (currentByte!3304 (_2!2946 lt!99070)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3304 (_2!2946 lt!99070)) (size!1281 (buf!1662 (_2!2946 lt!99061)))) (and (= (currentBit!3299 (_2!2946 lt!99070)) #b00000000000000000000000000000000) (= (currentByte!3304 (_2!2946 lt!99070)) (size!1281 (buf!1662 (_2!2946 lt!99061))))))))))

(assert (=> b!62984 d!19518))

(declare-fun d!19520 () Bool)

(declare-fun res!52441 () Bool)

(declare-fun e!41819 () Bool)

(assert (=> d!19520 (=> (not res!52441) (not e!41819))))

(assert (=> d!19520 (= res!52441 (= (size!1281 (buf!1662 (_1!2947 lt!99076))) (size!1281 (buf!1662 (_1!2947 lt!99063)))))))

(assert (=> d!19520 (= (isPrefixOf!0 (_1!2947 lt!99076) (_1!2947 lt!99063)) e!41819)))

(declare-fun b!63056 () Bool)

(declare-fun res!52443 () Bool)

(assert (=> b!63056 (=> (not res!52443) (not e!41819))))

(assert (=> b!63056 (= res!52443 (bvsle (bitIndex!0 (size!1281 (buf!1662 (_1!2947 lt!99076))) (currentByte!3304 (_1!2947 lt!99076)) (currentBit!3299 (_1!2947 lt!99076))) (bitIndex!0 (size!1281 (buf!1662 (_1!2947 lt!99063))) (currentByte!3304 (_1!2947 lt!99063)) (currentBit!3299 (_1!2947 lt!99063)))))))

(declare-fun b!63057 () Bool)

(declare-fun e!41818 () Bool)

(assert (=> b!63057 (= e!41819 e!41818)))

(declare-fun res!52442 () Bool)

(assert (=> b!63057 (=> res!52442 e!41818)))

(assert (=> b!63057 (= res!52442 (= (size!1281 (buf!1662 (_1!2947 lt!99076))) #b00000000000000000000000000000000))))

(declare-fun b!63058 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2799 array!2799 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!63058 (= e!41818 (arrayBitRangesEq!0 (buf!1662 (_1!2947 lt!99076)) (buf!1662 (_1!2947 lt!99063)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1281 (buf!1662 (_1!2947 lt!99076))) (currentByte!3304 (_1!2947 lt!99076)) (currentBit!3299 (_1!2947 lt!99076)))))))

(assert (= (and d!19520 res!52441) b!63056))

(assert (= (and b!63056 res!52443) b!63057))

(assert (= (and b!63057 (not res!52442)) b!63058))

(declare-fun m!99841 () Bool)

(assert (=> b!63056 m!99841))

(declare-fun m!99843 () Bool)

(assert (=> b!63056 m!99843))

(assert (=> b!63058 m!99841))

(assert (=> b!63058 m!99841))

(declare-fun m!99845 () Bool)

(assert (=> b!63058 m!99845))

(assert (=> b!62983 d!19520))

(declare-fun d!19522 () Bool)

(assert (=> d!19522 (= (head!507 (byteArrayBitContentToList!0 (_2!2946 lt!99070) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!803 (byteArrayBitContentToList!0 (_2!2946 lt!99070) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!62987 d!19522))

(declare-fun d!19524 () Bool)

(declare-fun c!4482 () Bool)

(assert (=> d!19524 (= c!4482 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!41822 () List!688)

(assert (=> d!19524 (= (byteArrayBitContentToList!0 (_2!2946 lt!99070) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!41822)))

(declare-fun b!63063 () Bool)

(assert (=> b!63063 (= e!41822 Nil!685)))

(declare-fun b!63064 () Bool)

(assert (=> b!63064 (= e!41822 (Cons!684 (not (= (bvand ((_ sign_extend 24) (select (arr!1845 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2946 lt!99070) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!19524 c!4482) b!63063))

(assert (= (and d!19524 (not c!4482)) b!63064))

(assert (=> b!63064 m!99715))

(declare-fun m!99847 () Bool)

(assert (=> b!63064 m!99847))

(declare-fun m!99849 () Bool)

(assert (=> b!63064 m!99849))

(assert (=> b!62987 d!19524))

(declare-fun d!19526 () Bool)

(assert (=> d!19526 (= (head!507 (bitStreamReadBitsIntoList!0 (_2!2946 lt!99070) (_1!2947 lt!99067) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!803 (bitStreamReadBitsIntoList!0 (_2!2946 lt!99070) (_1!2947 lt!99067) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!62987 d!19526))

(declare-fun b!63074 () Bool)

(declare-datatypes ((tuple2!5678 0))(
  ( (tuple2!5679 (_1!2950 Bool) (_2!2950 BitStream!2226)) )
))
(declare-fun lt!99132 () tuple2!5678)

(declare-datatypes ((tuple2!5680 0))(
  ( (tuple2!5681 (_1!2951 List!688) (_2!2951 BitStream!2226)) )
))
(declare-fun e!41827 () tuple2!5680)

(declare-fun lt!99133 () (_ BitVec 64))

(assert (=> b!63074 (= e!41827 (tuple2!5681 (Cons!684 (_1!2950 lt!99132) (bitStreamReadBitsIntoList!0 (_2!2946 lt!99070) (_2!2950 lt!99132) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!99133))) (_2!2950 lt!99132)))))

(declare-fun readBit!0 (BitStream!2226) tuple2!5678)

(assert (=> b!63074 (= lt!99132 (readBit!0 (_1!2947 lt!99067)))))

(assert (=> b!63074 (= lt!99133 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!19528 () Bool)

(declare-fun e!41828 () Bool)

(assert (=> d!19528 e!41828))

(declare-fun c!4487 () Bool)

(assert (=> d!19528 (= c!4487 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!99131 () List!688)

(assert (=> d!19528 (= lt!99131 (_1!2951 e!41827))))

(declare-fun c!4488 () Bool)

(assert (=> d!19528 (= c!4488 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19528 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!19528 (= (bitStreamReadBitsIntoList!0 (_2!2946 lt!99070) (_1!2947 lt!99067) #b0000000000000000000000000000000000000000000000000000000000000001) lt!99131)))

(declare-fun b!63075 () Bool)

(declare-fun isEmpty!192 (List!688) Bool)

(assert (=> b!63075 (= e!41828 (isEmpty!192 lt!99131))))

(declare-fun b!63073 () Bool)

(assert (=> b!63073 (= e!41827 (tuple2!5681 Nil!685 (_1!2947 lt!99067)))))

(declare-fun b!63076 () Bool)

(assert (=> b!63076 (= e!41828 (> (length!316 lt!99131) 0))))

(assert (= (and d!19528 c!4488) b!63073))

(assert (= (and d!19528 (not c!4488)) b!63074))

(assert (= (and d!19528 c!4487) b!63075))

(assert (= (and d!19528 (not c!4487)) b!63076))

(declare-fun m!99851 () Bool)

(assert (=> b!63074 m!99851))

(declare-fun m!99853 () Bool)

(assert (=> b!63074 m!99853))

(declare-fun m!99855 () Bool)

(assert (=> b!63075 m!99855))

(declare-fun m!99857 () Bool)

(assert (=> b!63076 m!99857))

(assert (=> b!62987 d!19528))

(declare-fun d!19530 () Bool)

(declare-fun res!52444 () Bool)

(declare-fun e!41830 () Bool)

(assert (=> d!19530 (=> (not res!52444) (not e!41830))))

(assert (=> d!19530 (= res!52444 (= (size!1281 (buf!1662 thiss!1379)) (size!1281 (buf!1662 (_2!2946 lt!99070)))))))

(assert (=> d!19530 (= (isPrefixOf!0 thiss!1379 (_2!2946 lt!99070)) e!41830)))

(declare-fun b!63077 () Bool)

(declare-fun res!52446 () Bool)

(assert (=> b!63077 (=> (not res!52446) (not e!41830))))

(assert (=> b!63077 (= res!52446 (bvsle (bitIndex!0 (size!1281 (buf!1662 thiss!1379)) (currentByte!3304 thiss!1379) (currentBit!3299 thiss!1379)) (bitIndex!0 (size!1281 (buf!1662 (_2!2946 lt!99070))) (currentByte!3304 (_2!2946 lt!99070)) (currentBit!3299 (_2!2946 lt!99070)))))))

(declare-fun b!63078 () Bool)

(declare-fun e!41829 () Bool)

(assert (=> b!63078 (= e!41830 e!41829)))

(declare-fun res!52445 () Bool)

(assert (=> b!63078 (=> res!52445 e!41829)))

(assert (=> b!63078 (= res!52445 (= (size!1281 (buf!1662 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!63079 () Bool)

(assert (=> b!63079 (= e!41829 (arrayBitRangesEq!0 (buf!1662 thiss!1379) (buf!1662 (_2!2946 lt!99070)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1281 (buf!1662 thiss!1379)) (currentByte!3304 thiss!1379) (currentBit!3299 thiss!1379))))))

(assert (= (and d!19530 res!52444) b!63077))

(assert (= (and b!63077 res!52446) b!63078))

(assert (= (and b!63078 (not res!52445)) b!63079))

(assert (=> b!63077 m!99713))

(assert (=> b!63077 m!99745))

(assert (=> b!63079 m!99713))

(assert (=> b!63079 m!99713))

(declare-fun m!99859 () Bool)

(assert (=> b!63079 m!99859))

(assert (=> b!62976 d!19530))

(declare-fun d!19532 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!19532 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1281 (buf!1662 (_2!2946 lt!99070)))) ((_ sign_extend 32) (currentByte!3304 (_2!2946 lt!99070))) ((_ sign_extend 32) (currentBit!3299 (_2!2946 lt!99070))) lt!99073) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1281 (buf!1662 (_2!2946 lt!99070)))) ((_ sign_extend 32) (currentByte!3304 (_2!2946 lt!99070))) ((_ sign_extend 32) (currentBit!3299 (_2!2946 lt!99070)))) lt!99073))))

(declare-fun bs!4833 () Bool)

(assert (= bs!4833 d!19532))

(declare-fun m!99861 () Bool)

(assert (=> bs!4833 m!99861))

(assert (=> b!62976 d!19532))

(declare-fun d!19534 () Bool)

(declare-fun e!41833 () Bool)

(assert (=> d!19534 e!41833))

(declare-fun res!52449 () Bool)

(assert (=> d!19534 (=> (not res!52449) (not e!41833))))

(assert (=> d!19534 (= res!52449 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!99136 () Unit!4279)

(declare-fun choose!27 (BitStream!2226 BitStream!2226 (_ BitVec 64) (_ BitVec 64)) Unit!4279)

(assert (=> d!19534 (= lt!99136 (choose!27 thiss!1379 (_2!2946 lt!99070) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!19534 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!19534 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2946 lt!99070) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!99136)))

(declare-fun b!63082 () Bool)

(assert (=> b!63082 (= e!41833 (validate_offset_bits!1 ((_ sign_extend 32) (size!1281 (buf!1662 (_2!2946 lt!99070)))) ((_ sign_extend 32) (currentByte!3304 (_2!2946 lt!99070))) ((_ sign_extend 32) (currentBit!3299 (_2!2946 lt!99070))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!19534 res!52449) b!63082))

(declare-fun m!99863 () Bool)

(assert (=> d!19534 m!99863))

(declare-fun m!99865 () Bool)

(assert (=> b!63082 m!99865))

(assert (=> b!62976 d!19534))

(declare-fun b!63100 () Bool)

(declare-fun res!52470 () Bool)

(declare-fun e!41844 () Bool)

(assert (=> b!63100 (=> (not res!52470) (not e!41844))))

(declare-fun lt!99166 () tuple2!5670)

(declare-fun lt!99162 () (_ BitVec 64))

(declare-fun lt!99172 () (_ BitVec 64))

(assert (=> b!63100 (= res!52470 (= (bitIndex!0 (size!1281 (buf!1662 (_2!2946 lt!99166))) (currentByte!3304 (_2!2946 lt!99166)) (currentBit!3299 (_2!2946 lt!99166))) (bvadd lt!99162 lt!99172)))))

(assert (=> b!63100 (or (not (= (bvand lt!99162 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!99172 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!99162 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!99162 lt!99172) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!63100 (= lt!99172 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!63100 (= lt!99162 (bitIndex!0 (size!1281 (buf!1662 thiss!1379)) (currentByte!3304 thiss!1379) (currentBit!3299 thiss!1379)))))

(declare-fun b!63101 () Bool)

(declare-fun e!41843 () Bool)

(assert (=> b!63101 (= e!41844 e!41843)))

(declare-fun res!52468 () Bool)

(assert (=> b!63101 (=> (not res!52468) (not e!41843))))

(declare-fun lt!99169 () (_ BitVec 8))

(declare-datatypes ((tuple2!5682 0))(
  ( (tuple2!5683 (_1!2952 BitStream!2226) (_2!2952 Bool)) )
))
(declare-fun lt!99170 () tuple2!5682)

(assert (=> b!63101 (= res!52468 (and (= (_2!2952 lt!99170) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1845 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!99169)) #b00000000000000000000000000000000))) (= (_1!2952 lt!99170) (_2!2946 lt!99166))))))

(declare-datatypes ((tuple2!5684 0))(
  ( (tuple2!5685 (_1!2953 array!2799) (_2!2953 BitStream!2226)) )
))
(declare-fun lt!99171 () tuple2!5684)

(declare-fun lt!99168 () BitStream!2226)

(declare-fun readBits!0 (BitStream!2226 (_ BitVec 64)) tuple2!5684)

(assert (=> b!63101 (= lt!99171 (readBits!0 lt!99168 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!2226) tuple2!5682)

(assert (=> b!63101 (= lt!99170 (readBitPure!0 lt!99168))))

(declare-fun readerFrom!0 (BitStream!2226 (_ BitVec 32) (_ BitVec 32)) BitStream!2226)

(assert (=> b!63101 (= lt!99168 (readerFrom!0 (_2!2946 lt!99166) (currentBit!3299 thiss!1379) (currentByte!3304 thiss!1379)))))

(declare-fun b!63102 () Bool)

(declare-fun res!52471 () Bool)

(declare-fun e!41845 () Bool)

(assert (=> b!63102 (=> (not res!52471) (not e!41845))))

(declare-fun lt!99165 () tuple2!5670)

(assert (=> b!63102 (= res!52471 (isPrefixOf!0 thiss!1379 (_2!2946 lt!99165)))))

(declare-fun b!63103 () Bool)

(declare-fun e!41842 () Bool)

(declare-fun lt!99161 () tuple2!5682)

(assert (=> b!63103 (= e!41842 (= (bitIndex!0 (size!1281 (buf!1662 (_1!2952 lt!99161))) (currentByte!3304 (_1!2952 lt!99161)) (currentBit!3299 (_1!2952 lt!99161))) (bitIndex!0 (size!1281 (buf!1662 (_2!2946 lt!99165))) (currentByte!3304 (_2!2946 lt!99165)) (currentBit!3299 (_2!2946 lt!99165)))))))

(declare-fun b!63104 () Bool)

(assert (=> b!63104 (= e!41845 e!41842)))

(declare-fun res!52473 () Bool)

(assert (=> b!63104 (=> (not res!52473) (not e!41842))))

(declare-fun lt!99164 () Bool)

(assert (=> b!63104 (= res!52473 (and (= (_2!2952 lt!99161) lt!99164) (= (_1!2952 lt!99161) (_2!2946 lt!99165))))))

(assert (=> b!63104 (= lt!99161 (readBitPure!0 (readerFrom!0 (_2!2946 lt!99165) (currentBit!3299 thiss!1379) (currentByte!3304 thiss!1379))))))

(declare-fun b!63105 () Bool)

(declare-fun res!52467 () Bool)

(assert (=> b!63105 (=> (not res!52467) (not e!41844))))

(assert (=> b!63105 (= res!52467 (isPrefixOf!0 thiss!1379 (_2!2946 lt!99166)))))

(declare-fun b!63106 () Bool)

(declare-fun res!52466 () Bool)

(assert (=> b!63106 (=> (not res!52466) (not e!41845))))

(assert (=> b!63106 (= res!52466 (= (bitIndex!0 (size!1281 (buf!1662 (_2!2946 lt!99165))) (currentByte!3304 (_2!2946 lt!99165)) (currentBit!3299 (_2!2946 lt!99165))) (bvadd (bitIndex!0 (size!1281 (buf!1662 thiss!1379)) (currentByte!3304 thiss!1379) (currentBit!3299 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun d!19536 () Bool)

(assert (=> d!19536 e!41844))

(declare-fun res!52472 () Bool)

(assert (=> d!19536 (=> (not res!52472) (not e!41844))))

(assert (=> d!19536 (= res!52472 (= (size!1281 (buf!1662 (_2!2946 lt!99166))) (size!1281 (buf!1662 thiss!1379))))))

(declare-fun lt!99167 () array!2799)

(assert (=> d!19536 (= lt!99169 (select (arr!1845 lt!99167) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!19536 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1281 lt!99167)))))

(assert (=> d!19536 (= lt!99167 (array!2800 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!99163 () tuple2!5670)

(assert (=> d!19536 (= lt!99166 (tuple2!5671 (_1!2946 lt!99163) (_2!2946 lt!99163)))))

(assert (=> d!19536 (= lt!99163 lt!99165)))

(assert (=> d!19536 e!41845))

(declare-fun res!52469 () Bool)

(assert (=> d!19536 (=> (not res!52469) (not e!41845))))

(assert (=> d!19536 (= res!52469 (= (size!1281 (buf!1662 thiss!1379)) (size!1281 (buf!1662 (_2!2946 lt!99165)))))))

(declare-fun appendBit!0 (BitStream!2226 Bool) tuple2!5670)

(assert (=> d!19536 (= lt!99165 (appendBit!0 thiss!1379 lt!99164))))

(assert (=> d!19536 (= lt!99164 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1845 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!19536 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!19536 (= (appendBitFromByte!0 thiss!1379 (select (arr!1845 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!99166)))

(declare-fun b!63107 () Bool)

(assert (=> b!63107 (= e!41843 (= (bitIndex!0 (size!1281 (buf!1662 (_1!2952 lt!99170))) (currentByte!3304 (_1!2952 lt!99170)) (currentBit!3299 (_1!2952 lt!99170))) (bitIndex!0 (size!1281 (buf!1662 (_2!2946 lt!99166))) (currentByte!3304 (_2!2946 lt!99166)) (currentBit!3299 (_2!2946 lt!99166)))))))

(assert (= (and d!19536 res!52469) b!63106))

(assert (= (and b!63106 res!52466) b!63102))

(assert (= (and b!63102 res!52471) b!63104))

(assert (= (and b!63104 res!52473) b!63103))

(assert (= (and d!19536 res!52472) b!63100))

(assert (= (and b!63100 res!52470) b!63105))

(assert (= (and b!63105 res!52467) b!63101))

(assert (= (and b!63101 res!52468) b!63107))

(declare-fun m!99867 () Bool)

(assert (=> d!19536 m!99867))

(declare-fun m!99869 () Bool)

(assert (=> d!19536 m!99869))

(assert (=> d!19536 m!99847))

(declare-fun m!99871 () Bool)

(assert (=> b!63106 m!99871))

(assert (=> b!63106 m!99713))

(declare-fun m!99873 () Bool)

(assert (=> b!63107 m!99873))

(declare-fun m!99875 () Bool)

(assert (=> b!63107 m!99875))

(assert (=> b!63100 m!99875))

(assert (=> b!63100 m!99713))

(declare-fun m!99877 () Bool)

(assert (=> b!63101 m!99877))

(declare-fun m!99879 () Bool)

(assert (=> b!63101 m!99879))

(declare-fun m!99881 () Bool)

(assert (=> b!63101 m!99881))

(declare-fun m!99883 () Bool)

(assert (=> b!63102 m!99883))

(declare-fun m!99885 () Bool)

(assert (=> b!63104 m!99885))

(assert (=> b!63104 m!99885))

(declare-fun m!99887 () Bool)

(assert (=> b!63104 m!99887))

(declare-fun m!99889 () Bool)

(assert (=> b!63105 m!99889))

(declare-fun m!99891 () Bool)

(assert (=> b!63103 m!99891))

(assert (=> b!63103 m!99871))

(assert (=> b!62976 d!19536))

(declare-fun d!19538 () Bool)

(declare-fun res!52474 () Bool)

(declare-fun e!41847 () Bool)

(assert (=> d!19538 (=> (not res!52474) (not e!41847))))

(assert (=> d!19538 (= res!52474 (= (size!1281 (buf!1662 (_1!2947 lt!99076))) (size!1281 (buf!1662 (_2!2946 lt!99061)))))))

(assert (=> d!19538 (= (isPrefixOf!0 (_1!2947 lt!99076) (_2!2946 lt!99061)) e!41847)))

(declare-fun b!63108 () Bool)

(declare-fun res!52476 () Bool)

(assert (=> b!63108 (=> (not res!52476) (not e!41847))))

(assert (=> b!63108 (= res!52476 (bvsle (bitIndex!0 (size!1281 (buf!1662 (_1!2947 lt!99076))) (currentByte!3304 (_1!2947 lt!99076)) (currentBit!3299 (_1!2947 lt!99076))) (bitIndex!0 (size!1281 (buf!1662 (_2!2946 lt!99061))) (currentByte!3304 (_2!2946 lt!99061)) (currentBit!3299 (_2!2946 lt!99061)))))))

(declare-fun b!63109 () Bool)

(declare-fun e!41846 () Bool)

(assert (=> b!63109 (= e!41847 e!41846)))

(declare-fun res!52475 () Bool)

(assert (=> b!63109 (=> res!52475 e!41846)))

(assert (=> b!63109 (= res!52475 (= (size!1281 (buf!1662 (_1!2947 lt!99076))) #b00000000000000000000000000000000))))

(declare-fun b!63110 () Bool)

(assert (=> b!63110 (= e!41846 (arrayBitRangesEq!0 (buf!1662 (_1!2947 lt!99076)) (buf!1662 (_2!2946 lt!99061)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1281 (buf!1662 (_1!2947 lt!99076))) (currentByte!3304 (_1!2947 lt!99076)) (currentBit!3299 (_1!2947 lt!99076)))))))

(assert (= (and d!19538 res!52474) b!63108))

(assert (= (and b!63108 res!52476) b!63109))

(assert (= (and b!63109 (not res!52475)) b!63110))

(assert (=> b!63108 m!99841))

(assert (=> b!63108 m!99747))

(assert (=> b!63110 m!99841))

(assert (=> b!63110 m!99841))

(declare-fun m!99893 () Bool)

(assert (=> b!63110 m!99893))

(assert (=> b!62986 d!19538))

(declare-fun lt!99232 () tuple2!5672)

(declare-fun e!41852 () Bool)

(declare-fun b!63121 () Bool)

(declare-fun lt!99222 () (_ BitVec 64))

(declare-fun lt!99224 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2226 (_ BitVec 64)) BitStream!2226)

(assert (=> b!63121 (= e!41852 (= (_1!2947 lt!99232) (withMovedBitIndex!0 (_2!2947 lt!99232) (bvsub lt!99224 lt!99222))))))

(assert (=> b!63121 (or (= (bvand lt!99224 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!99222 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!99224 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!99224 lt!99222) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!63121 (= lt!99222 (bitIndex!0 (size!1281 (buf!1662 (_2!2946 lt!99061))) (currentByte!3304 (_2!2946 lt!99061)) (currentBit!3299 (_2!2946 lt!99061))))))

(assert (=> b!63121 (= lt!99224 (bitIndex!0 (size!1281 (buf!1662 (_2!2946 lt!99070))) (currentByte!3304 (_2!2946 lt!99070)) (currentBit!3299 (_2!2946 lt!99070))))))

(declare-fun b!63122 () Bool)

(declare-fun e!41853 () Unit!4279)

(declare-fun lt!99228 () Unit!4279)

(assert (=> b!63122 (= e!41853 lt!99228)))

(declare-fun lt!99215 () (_ BitVec 64))

(assert (=> b!63122 (= lt!99215 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!99218 () (_ BitVec 64))

(assert (=> b!63122 (= lt!99218 (bitIndex!0 (size!1281 (buf!1662 (_2!2946 lt!99070))) (currentByte!3304 (_2!2946 lt!99070)) (currentBit!3299 (_2!2946 lt!99070))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2799 array!2799 (_ BitVec 64) (_ BitVec 64)) Unit!4279)

(assert (=> b!63122 (= lt!99228 (arrayBitRangesEqSymmetric!0 (buf!1662 (_2!2946 lt!99070)) (buf!1662 (_2!2946 lt!99061)) lt!99215 lt!99218))))

(assert (=> b!63122 (arrayBitRangesEq!0 (buf!1662 (_2!2946 lt!99061)) (buf!1662 (_2!2946 lt!99070)) lt!99215 lt!99218)))

(declare-fun b!63123 () Bool)

(declare-fun res!52485 () Bool)

(assert (=> b!63123 (=> (not res!52485) (not e!41852))))

(assert (=> b!63123 (= res!52485 (isPrefixOf!0 (_2!2947 lt!99232) (_2!2946 lt!99061)))))

(declare-fun d!19540 () Bool)

(assert (=> d!19540 e!41852))

(declare-fun res!52484 () Bool)

(assert (=> d!19540 (=> (not res!52484) (not e!41852))))

(assert (=> d!19540 (= res!52484 (isPrefixOf!0 (_1!2947 lt!99232) (_2!2947 lt!99232)))))

(declare-fun lt!99221 () BitStream!2226)

(assert (=> d!19540 (= lt!99232 (tuple2!5673 lt!99221 (_2!2946 lt!99061)))))

(declare-fun lt!99227 () Unit!4279)

(declare-fun lt!99229 () Unit!4279)

(assert (=> d!19540 (= lt!99227 lt!99229)))

(assert (=> d!19540 (isPrefixOf!0 lt!99221 (_2!2946 lt!99061))))

(assert (=> d!19540 (= lt!99229 (lemmaIsPrefixTransitive!0 lt!99221 (_2!2946 lt!99061) (_2!2946 lt!99061)))))

(declare-fun lt!99216 () Unit!4279)

(declare-fun lt!99213 () Unit!4279)

(assert (=> d!19540 (= lt!99216 lt!99213)))

(assert (=> d!19540 (isPrefixOf!0 lt!99221 (_2!2946 lt!99061))))

(assert (=> d!19540 (= lt!99213 (lemmaIsPrefixTransitive!0 lt!99221 (_2!2946 lt!99070) (_2!2946 lt!99061)))))

(declare-fun lt!99219 () Unit!4279)

(assert (=> d!19540 (= lt!99219 e!41853)))

(declare-fun c!4491 () Bool)

(assert (=> d!19540 (= c!4491 (not (= (size!1281 (buf!1662 (_2!2946 lt!99070))) #b00000000000000000000000000000000)))))

(declare-fun lt!99223 () Unit!4279)

(declare-fun lt!99230 () Unit!4279)

(assert (=> d!19540 (= lt!99223 lt!99230)))

(assert (=> d!19540 (isPrefixOf!0 (_2!2946 lt!99061) (_2!2946 lt!99061))))

(assert (=> d!19540 (= lt!99230 (lemmaIsPrefixRefl!0 (_2!2946 lt!99061)))))

(declare-fun lt!99220 () Unit!4279)

(declare-fun lt!99226 () Unit!4279)

(assert (=> d!19540 (= lt!99220 lt!99226)))

(assert (=> d!19540 (= lt!99226 (lemmaIsPrefixRefl!0 (_2!2946 lt!99061)))))

(declare-fun lt!99225 () Unit!4279)

(declare-fun lt!99231 () Unit!4279)

(assert (=> d!19540 (= lt!99225 lt!99231)))

(assert (=> d!19540 (isPrefixOf!0 lt!99221 lt!99221)))

(assert (=> d!19540 (= lt!99231 (lemmaIsPrefixRefl!0 lt!99221))))

(declare-fun lt!99217 () Unit!4279)

(declare-fun lt!99214 () Unit!4279)

(assert (=> d!19540 (= lt!99217 lt!99214)))

(assert (=> d!19540 (isPrefixOf!0 (_2!2946 lt!99070) (_2!2946 lt!99070))))

(assert (=> d!19540 (= lt!99214 (lemmaIsPrefixRefl!0 (_2!2946 lt!99070)))))

(assert (=> d!19540 (= lt!99221 (BitStream!2227 (buf!1662 (_2!2946 lt!99061)) (currentByte!3304 (_2!2946 lt!99070)) (currentBit!3299 (_2!2946 lt!99070))))))

(assert (=> d!19540 (isPrefixOf!0 (_2!2946 lt!99070) (_2!2946 lt!99061))))

(assert (=> d!19540 (= (reader!0 (_2!2946 lt!99070) (_2!2946 lt!99061)) lt!99232)))

(declare-fun b!63124 () Bool)

(declare-fun res!52483 () Bool)

(assert (=> b!63124 (=> (not res!52483) (not e!41852))))

(assert (=> b!63124 (= res!52483 (isPrefixOf!0 (_1!2947 lt!99232) (_2!2946 lt!99070)))))

(declare-fun b!63125 () Bool)

(declare-fun Unit!4283 () Unit!4279)

(assert (=> b!63125 (= e!41853 Unit!4283)))

(assert (= (and d!19540 c!4491) b!63122))

(assert (= (and d!19540 (not c!4491)) b!63125))

(assert (= (and d!19540 res!52484) b!63124))

(assert (= (and b!63124 res!52483) b!63123))

(assert (= (and b!63123 res!52485) b!63121))

(declare-fun m!99895 () Bool)

(assert (=> b!63123 m!99895))

(declare-fun m!99897 () Bool)

(assert (=> d!19540 m!99897))

(declare-fun m!99899 () Bool)

(assert (=> d!19540 m!99899))

(declare-fun m!99901 () Bool)

(assert (=> d!19540 m!99901))

(declare-fun m!99903 () Bool)

(assert (=> d!19540 m!99903))

(declare-fun m!99905 () Bool)

(assert (=> d!19540 m!99905))

(declare-fun m!99907 () Bool)

(assert (=> d!19540 m!99907))

(declare-fun m!99909 () Bool)

(assert (=> d!19540 m!99909))

(assert (=> d!19540 m!99693))

(declare-fun m!99911 () Bool)

(assert (=> d!19540 m!99911))

(declare-fun m!99913 () Bool)

(assert (=> d!19540 m!99913))

(declare-fun m!99915 () Bool)

(assert (=> d!19540 m!99915))

(declare-fun m!99917 () Bool)

(assert (=> b!63121 m!99917))

(assert (=> b!63121 m!99747))

(assert (=> b!63121 m!99745))

(declare-fun m!99919 () Bool)

(assert (=> b!63124 m!99919))

(assert (=> b!63122 m!99745))

(declare-fun m!99921 () Bool)

(assert (=> b!63122 m!99921))

(declare-fun m!99923 () Bool)

(assert (=> b!63122 m!99923))

(assert (=> b!62975 d!19540))

(declare-fun d!19542 () Bool)

(assert (=> d!19542 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1281 (buf!1662 (_2!2946 lt!99061)))) ((_ sign_extend 32) (currentByte!3304 thiss!1379)) ((_ sign_extend 32) (currentBit!3299 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1281 (buf!1662 (_2!2946 lt!99061)))) ((_ sign_extend 32) (currentByte!3304 thiss!1379)) ((_ sign_extend 32) (currentBit!3299 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4834 () Bool)

(assert (= bs!4834 d!19542))

(declare-fun m!99925 () Bool)

(assert (=> bs!4834 m!99925))

(assert (=> b!62975 d!19542))

(declare-fun d!19544 () Bool)

(assert (=> d!19544 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1281 (buf!1662 (_2!2946 lt!99061)))) ((_ sign_extend 32) (currentByte!3304 (_2!2946 lt!99070))) ((_ sign_extend 32) (currentBit!3299 (_2!2946 lt!99070))) lt!99073) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1281 (buf!1662 (_2!2946 lt!99061)))) ((_ sign_extend 32) (currentByte!3304 (_2!2946 lt!99070))) ((_ sign_extend 32) (currentBit!3299 (_2!2946 lt!99070)))) lt!99073))))

(declare-fun bs!4835 () Bool)

(assert (= bs!4835 d!19544))

(declare-fun m!99927 () Bool)

(assert (=> bs!4835 m!99927))

(assert (=> b!62975 d!19544))

(declare-fun e!41854 () tuple2!5680)

(declare-fun b!63127 () Bool)

(declare-fun lt!99235 () (_ BitVec 64))

(declare-fun lt!99234 () tuple2!5678)

(assert (=> b!63127 (= e!41854 (tuple2!5681 (Cons!684 (_1!2950 lt!99234) (bitStreamReadBitsIntoList!0 (_2!2946 lt!99061) (_2!2950 lt!99234) (bvsub (bvsub to!314 i!635) lt!99235))) (_2!2950 lt!99234)))))

(assert (=> b!63127 (= lt!99234 (readBit!0 (_1!2947 lt!99076)))))

(assert (=> b!63127 (= lt!99235 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!19546 () Bool)

(declare-fun e!41855 () Bool)

(assert (=> d!19546 e!41855))

(declare-fun c!4492 () Bool)

(assert (=> d!19546 (= c!4492 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!99233 () List!688)

(assert (=> d!19546 (= lt!99233 (_1!2951 e!41854))))

(declare-fun c!4493 () Bool)

(assert (=> d!19546 (= c!4493 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19546 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!19546 (= (bitStreamReadBitsIntoList!0 (_2!2946 lt!99061) (_1!2947 lt!99076) (bvsub to!314 i!635)) lt!99233)))

(declare-fun b!63128 () Bool)

(assert (=> b!63128 (= e!41855 (isEmpty!192 lt!99233))))

(declare-fun b!63126 () Bool)

(assert (=> b!63126 (= e!41854 (tuple2!5681 Nil!685 (_1!2947 lt!99076)))))

(declare-fun b!63129 () Bool)

(assert (=> b!63129 (= e!41855 (> (length!316 lt!99233) 0))))

(assert (= (and d!19546 c!4493) b!63126))

(assert (= (and d!19546 (not c!4493)) b!63127))

(assert (= (and d!19546 c!4492) b!63128))

(assert (= (and d!19546 (not c!4492)) b!63129))

(declare-fun m!99929 () Bool)

(assert (=> b!63127 m!99929))

(declare-fun m!99931 () Bool)

(assert (=> b!63127 m!99931))

(declare-fun m!99933 () Bool)

(assert (=> b!63128 m!99933))

(declare-fun m!99935 () Bool)

(assert (=> b!63129 m!99935))

(assert (=> b!62975 d!19546))

(declare-fun d!19548 () Bool)

(assert (=> d!19548 (validate_offset_bits!1 ((_ sign_extend 32) (size!1281 (buf!1662 (_2!2946 lt!99061)))) ((_ sign_extend 32) (currentByte!3304 (_2!2946 lt!99070))) ((_ sign_extend 32) (currentBit!3299 (_2!2946 lt!99070))) lt!99073)))

(declare-fun lt!99238 () Unit!4279)

(declare-fun choose!9 (BitStream!2226 array!2799 (_ BitVec 64) BitStream!2226) Unit!4279)

(assert (=> d!19548 (= lt!99238 (choose!9 (_2!2946 lt!99070) (buf!1662 (_2!2946 lt!99061)) lt!99073 (BitStream!2227 (buf!1662 (_2!2946 lt!99061)) (currentByte!3304 (_2!2946 lt!99070)) (currentBit!3299 (_2!2946 lt!99070)))))))

(assert (=> d!19548 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2946 lt!99070) (buf!1662 (_2!2946 lt!99061)) lt!99073) lt!99238)))

(declare-fun bs!4836 () Bool)

(assert (= bs!4836 d!19548))

(assert (=> bs!4836 m!99739))

(declare-fun m!99937 () Bool)

(assert (=> bs!4836 m!99937))

(assert (=> b!62975 d!19548))

(declare-fun lt!99248 () (_ BitVec 64))

(declare-fun lt!99250 () (_ BitVec 64))

(declare-fun e!41856 () Bool)

(declare-fun b!63130 () Bool)

(declare-fun lt!99258 () tuple2!5672)

(assert (=> b!63130 (= e!41856 (= (_1!2947 lt!99258) (withMovedBitIndex!0 (_2!2947 lt!99258) (bvsub lt!99250 lt!99248))))))

(assert (=> b!63130 (or (= (bvand lt!99250 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!99248 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!99250 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!99250 lt!99248) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!63130 (= lt!99248 (bitIndex!0 (size!1281 (buf!1662 (_2!2946 lt!99061))) (currentByte!3304 (_2!2946 lt!99061)) (currentBit!3299 (_2!2946 lt!99061))))))

(assert (=> b!63130 (= lt!99250 (bitIndex!0 (size!1281 (buf!1662 thiss!1379)) (currentByte!3304 thiss!1379) (currentBit!3299 thiss!1379)))))

(declare-fun b!63131 () Bool)

(declare-fun e!41857 () Unit!4279)

(declare-fun lt!99254 () Unit!4279)

(assert (=> b!63131 (= e!41857 lt!99254)))

(declare-fun lt!99241 () (_ BitVec 64))

(assert (=> b!63131 (= lt!99241 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!99244 () (_ BitVec 64))

(assert (=> b!63131 (= lt!99244 (bitIndex!0 (size!1281 (buf!1662 thiss!1379)) (currentByte!3304 thiss!1379) (currentBit!3299 thiss!1379)))))

(assert (=> b!63131 (= lt!99254 (arrayBitRangesEqSymmetric!0 (buf!1662 thiss!1379) (buf!1662 (_2!2946 lt!99061)) lt!99241 lt!99244))))

(assert (=> b!63131 (arrayBitRangesEq!0 (buf!1662 (_2!2946 lt!99061)) (buf!1662 thiss!1379) lt!99241 lt!99244)))

(declare-fun b!63132 () Bool)

(declare-fun res!52488 () Bool)

(assert (=> b!63132 (=> (not res!52488) (not e!41856))))

(assert (=> b!63132 (= res!52488 (isPrefixOf!0 (_2!2947 lt!99258) (_2!2946 lt!99061)))))

(declare-fun d!19550 () Bool)

(assert (=> d!19550 e!41856))

(declare-fun res!52487 () Bool)

(assert (=> d!19550 (=> (not res!52487) (not e!41856))))

(assert (=> d!19550 (= res!52487 (isPrefixOf!0 (_1!2947 lt!99258) (_2!2947 lt!99258)))))

(declare-fun lt!99247 () BitStream!2226)

(assert (=> d!19550 (= lt!99258 (tuple2!5673 lt!99247 (_2!2946 lt!99061)))))

(declare-fun lt!99253 () Unit!4279)

(declare-fun lt!99255 () Unit!4279)

(assert (=> d!19550 (= lt!99253 lt!99255)))

(assert (=> d!19550 (isPrefixOf!0 lt!99247 (_2!2946 lt!99061))))

(assert (=> d!19550 (= lt!99255 (lemmaIsPrefixTransitive!0 lt!99247 (_2!2946 lt!99061) (_2!2946 lt!99061)))))

(declare-fun lt!99242 () Unit!4279)

(declare-fun lt!99239 () Unit!4279)

(assert (=> d!19550 (= lt!99242 lt!99239)))

(assert (=> d!19550 (isPrefixOf!0 lt!99247 (_2!2946 lt!99061))))

(assert (=> d!19550 (= lt!99239 (lemmaIsPrefixTransitive!0 lt!99247 thiss!1379 (_2!2946 lt!99061)))))

(declare-fun lt!99245 () Unit!4279)

(assert (=> d!19550 (= lt!99245 e!41857)))

(declare-fun c!4494 () Bool)

(assert (=> d!19550 (= c!4494 (not (= (size!1281 (buf!1662 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!99249 () Unit!4279)

(declare-fun lt!99256 () Unit!4279)

(assert (=> d!19550 (= lt!99249 lt!99256)))

(assert (=> d!19550 (isPrefixOf!0 (_2!2946 lt!99061) (_2!2946 lt!99061))))

(assert (=> d!19550 (= lt!99256 (lemmaIsPrefixRefl!0 (_2!2946 lt!99061)))))

(declare-fun lt!99246 () Unit!4279)

(declare-fun lt!99252 () Unit!4279)

(assert (=> d!19550 (= lt!99246 lt!99252)))

(assert (=> d!19550 (= lt!99252 (lemmaIsPrefixRefl!0 (_2!2946 lt!99061)))))

(declare-fun lt!99251 () Unit!4279)

(declare-fun lt!99257 () Unit!4279)

(assert (=> d!19550 (= lt!99251 lt!99257)))

(assert (=> d!19550 (isPrefixOf!0 lt!99247 lt!99247)))

(assert (=> d!19550 (= lt!99257 (lemmaIsPrefixRefl!0 lt!99247))))

(declare-fun lt!99243 () Unit!4279)

(declare-fun lt!99240 () Unit!4279)

(assert (=> d!19550 (= lt!99243 lt!99240)))

(assert (=> d!19550 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!19550 (= lt!99240 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!19550 (= lt!99247 (BitStream!2227 (buf!1662 (_2!2946 lt!99061)) (currentByte!3304 thiss!1379) (currentBit!3299 thiss!1379)))))

(assert (=> d!19550 (isPrefixOf!0 thiss!1379 (_2!2946 lt!99061))))

(assert (=> d!19550 (= (reader!0 thiss!1379 (_2!2946 lt!99061)) lt!99258)))

(declare-fun b!63133 () Bool)

(declare-fun res!52486 () Bool)

(assert (=> b!63133 (=> (not res!52486) (not e!41856))))

(assert (=> b!63133 (= res!52486 (isPrefixOf!0 (_1!2947 lt!99258) thiss!1379))))

(declare-fun b!63134 () Bool)

(declare-fun Unit!4284 () Unit!4279)

(assert (=> b!63134 (= e!41857 Unit!4284)))

(assert (= (and d!19550 c!4494) b!63131))

(assert (= (and d!19550 (not c!4494)) b!63134))

(assert (= (and d!19550 res!52487) b!63133))

(assert (= (and b!63133 res!52486) b!63132))

(assert (= (and b!63132 res!52488) b!63130))

(declare-fun m!99939 () Bool)

(assert (=> b!63132 m!99939))

(assert (=> d!19550 m!99897))

(assert (=> d!19550 m!99711))

(assert (=> d!19550 m!99901))

(declare-fun m!99941 () Bool)

(assert (=> d!19550 m!99941))

(declare-fun m!99943 () Bool)

(assert (=> d!19550 m!99943))

(assert (=> d!19550 m!99709))

(declare-fun m!99945 () Bool)

(assert (=> d!19550 m!99945))

(assert (=> d!19550 m!99703))

(declare-fun m!99947 () Bool)

(assert (=> d!19550 m!99947))

(declare-fun m!99949 () Bool)

(assert (=> d!19550 m!99949))

(declare-fun m!99951 () Bool)

(assert (=> d!19550 m!99951))

(declare-fun m!99953 () Bool)

(assert (=> b!63130 m!99953))

(assert (=> b!63130 m!99747))

(assert (=> b!63130 m!99713))

(declare-fun m!99955 () Bool)

(assert (=> b!63133 m!99955))

(assert (=> b!63131 m!99713))

(declare-fun m!99957 () Bool)

(assert (=> b!63131 m!99957))

(declare-fun m!99959 () Bool)

(assert (=> b!63131 m!99959))

(assert (=> b!62975 d!19550))

(declare-fun d!19552 () Bool)

(assert (=> d!19552 (validate_offset_bits!1 ((_ sign_extend 32) (size!1281 (buf!1662 (_2!2946 lt!99061)))) ((_ sign_extend 32) (currentByte!3304 thiss!1379)) ((_ sign_extend 32) (currentBit!3299 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!99259 () Unit!4279)

(assert (=> d!19552 (= lt!99259 (choose!9 thiss!1379 (buf!1662 (_2!2946 lt!99061)) (bvsub to!314 i!635) (BitStream!2227 (buf!1662 (_2!2946 lt!99061)) (currentByte!3304 thiss!1379) (currentBit!3299 thiss!1379))))))

(assert (=> d!19552 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1662 (_2!2946 lt!99061)) (bvsub to!314 i!635)) lt!99259)))

(declare-fun bs!4837 () Bool)

(assert (= bs!4837 d!19552))

(assert (=> bs!4837 m!99737))

(declare-fun m!99961 () Bool)

(assert (=> bs!4837 m!99961))

(assert (=> b!62975 d!19552))

(declare-fun lt!99261 () tuple2!5678)

(declare-fun lt!99262 () (_ BitVec 64))

(declare-fun e!41858 () tuple2!5680)

(declare-fun b!63136 () Bool)

(assert (=> b!63136 (= e!41858 (tuple2!5681 (Cons!684 (_1!2950 lt!99261) (bitStreamReadBitsIntoList!0 (_2!2946 lt!99061) (_2!2950 lt!99261) (bvsub lt!99073 lt!99262))) (_2!2950 lt!99261)))))

(assert (=> b!63136 (= lt!99261 (readBit!0 (_1!2947 lt!99063)))))

(assert (=> b!63136 (= lt!99262 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!19554 () Bool)

(declare-fun e!41859 () Bool)

(assert (=> d!19554 e!41859))

(declare-fun c!4495 () Bool)

(assert (=> d!19554 (= c!4495 (= lt!99073 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!99260 () List!688)

(assert (=> d!19554 (= lt!99260 (_1!2951 e!41858))))

(declare-fun c!4496 () Bool)

(assert (=> d!19554 (= c!4496 (= lt!99073 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19554 (bvsge lt!99073 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!19554 (= (bitStreamReadBitsIntoList!0 (_2!2946 lt!99061) (_1!2947 lt!99063) lt!99073) lt!99260)))

(declare-fun b!63137 () Bool)

(assert (=> b!63137 (= e!41859 (isEmpty!192 lt!99260))))

(declare-fun b!63135 () Bool)

(assert (=> b!63135 (= e!41858 (tuple2!5681 Nil!685 (_1!2947 lt!99063)))))

(declare-fun b!63138 () Bool)

(assert (=> b!63138 (= e!41859 (> (length!316 lt!99260) 0))))

(assert (= (and d!19554 c!4496) b!63135))

(assert (= (and d!19554 (not c!4496)) b!63136))

(assert (= (and d!19554 c!4495) b!63137))

(assert (= (and d!19554 (not c!4495)) b!63138))

(declare-fun m!99963 () Bool)

(assert (=> b!63136 m!99963))

(declare-fun m!99965 () Bool)

(assert (=> b!63136 m!99965))

(declare-fun m!99967 () Bool)

(assert (=> b!63137 m!99967))

(declare-fun m!99969 () Bool)

(assert (=> b!63138 m!99969))

(assert (=> b!62975 d!19554))

(declare-fun d!19556 () Bool)

(declare-fun e!41862 () Bool)

(assert (=> d!19556 e!41862))

(declare-fun res!52493 () Bool)

(assert (=> d!19556 (=> (not res!52493) (not e!41862))))

(declare-fun lt!99280 () (_ BitVec 64))

(declare-fun lt!99276 () (_ BitVec 64))

(declare-fun lt!99279 () (_ BitVec 64))

(assert (=> d!19556 (= res!52493 (= lt!99279 (bvsub lt!99276 lt!99280)))))

(assert (=> d!19556 (or (= (bvand lt!99276 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!99280 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!99276 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!99276 lt!99280) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!19556 (= lt!99280 (remainingBits!0 ((_ sign_extend 32) (size!1281 (buf!1662 (_2!2946 lt!99070)))) ((_ sign_extend 32) (currentByte!3304 (_2!2946 lt!99070))) ((_ sign_extend 32) (currentBit!3299 (_2!2946 lt!99070)))))))

(declare-fun lt!99278 () (_ BitVec 64))

(declare-fun lt!99277 () (_ BitVec 64))

(assert (=> d!19556 (= lt!99276 (bvmul lt!99278 lt!99277))))

(assert (=> d!19556 (or (= lt!99278 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!99277 (bvsdiv (bvmul lt!99278 lt!99277) lt!99278)))))

(assert (=> d!19556 (= lt!99277 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!19556 (= lt!99278 ((_ sign_extend 32) (size!1281 (buf!1662 (_2!2946 lt!99070)))))))

(assert (=> d!19556 (= lt!99279 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3304 (_2!2946 lt!99070))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3299 (_2!2946 lt!99070)))))))

(assert (=> d!19556 (invariant!0 (currentBit!3299 (_2!2946 lt!99070)) (currentByte!3304 (_2!2946 lt!99070)) (size!1281 (buf!1662 (_2!2946 lt!99070))))))

(assert (=> d!19556 (= (bitIndex!0 (size!1281 (buf!1662 (_2!2946 lt!99070))) (currentByte!3304 (_2!2946 lt!99070)) (currentBit!3299 (_2!2946 lt!99070))) lt!99279)))

(declare-fun b!63143 () Bool)

(declare-fun res!52494 () Bool)

(assert (=> b!63143 (=> (not res!52494) (not e!41862))))

(assert (=> b!63143 (= res!52494 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!99279))))

(declare-fun b!63144 () Bool)

(declare-fun lt!99275 () (_ BitVec 64))

(assert (=> b!63144 (= e!41862 (bvsle lt!99279 (bvmul lt!99275 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!63144 (or (= lt!99275 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!99275 #b0000000000000000000000000000000000000000000000000000000000001000) lt!99275)))))

(assert (=> b!63144 (= lt!99275 ((_ sign_extend 32) (size!1281 (buf!1662 (_2!2946 lt!99070)))))))

(assert (= (and d!19556 res!52493) b!63143))

(assert (= (and b!63143 res!52494) b!63144))

(assert (=> d!19556 m!99861))

(assert (=> d!19556 m!99685))

(assert (=> b!62985 d!19556))

(declare-fun d!19558 () Bool)

(declare-fun e!41863 () Bool)

(assert (=> d!19558 e!41863))

(declare-fun res!52495 () Bool)

(assert (=> d!19558 (=> (not res!52495) (not e!41863))))

(declare-fun lt!99286 () (_ BitVec 64))

(declare-fun lt!99285 () (_ BitVec 64))

(declare-fun lt!99282 () (_ BitVec 64))

(assert (=> d!19558 (= res!52495 (= lt!99285 (bvsub lt!99282 lt!99286)))))

(assert (=> d!19558 (or (= (bvand lt!99282 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!99286 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!99282 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!99282 lt!99286) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!19558 (= lt!99286 (remainingBits!0 ((_ sign_extend 32) (size!1281 (buf!1662 (_2!2946 lt!99061)))) ((_ sign_extend 32) (currentByte!3304 (_2!2946 lt!99061))) ((_ sign_extend 32) (currentBit!3299 (_2!2946 lt!99061)))))))

(declare-fun lt!99284 () (_ BitVec 64))

(declare-fun lt!99283 () (_ BitVec 64))

(assert (=> d!19558 (= lt!99282 (bvmul lt!99284 lt!99283))))

(assert (=> d!19558 (or (= lt!99284 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!99283 (bvsdiv (bvmul lt!99284 lt!99283) lt!99284)))))

(assert (=> d!19558 (= lt!99283 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!19558 (= lt!99284 ((_ sign_extend 32) (size!1281 (buf!1662 (_2!2946 lt!99061)))))))

(assert (=> d!19558 (= lt!99285 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3304 (_2!2946 lt!99061))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3299 (_2!2946 lt!99061)))))))

(assert (=> d!19558 (invariant!0 (currentBit!3299 (_2!2946 lt!99061)) (currentByte!3304 (_2!2946 lt!99061)) (size!1281 (buf!1662 (_2!2946 lt!99061))))))

(assert (=> d!19558 (= (bitIndex!0 (size!1281 (buf!1662 (_2!2946 lt!99061))) (currentByte!3304 (_2!2946 lt!99061)) (currentBit!3299 (_2!2946 lt!99061))) lt!99285)))

(declare-fun b!63145 () Bool)

(declare-fun res!52496 () Bool)

(assert (=> b!63145 (=> (not res!52496) (not e!41863))))

(assert (=> b!63145 (= res!52496 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!99285))))

(declare-fun b!63146 () Bool)

(declare-fun lt!99281 () (_ BitVec 64))

(assert (=> b!63146 (= e!41863 (bvsle lt!99285 (bvmul lt!99281 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!63146 (or (= lt!99281 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!99281 #b0000000000000000000000000000000000000000000000000000000000001000) lt!99281)))))

(assert (=> b!63146 (= lt!99281 ((_ sign_extend 32) (size!1281 (buf!1662 (_2!2946 lt!99061)))))))

(assert (= (and d!19558 res!52495) b!63145))

(assert (= (and b!63145 res!52496) b!63146))

(declare-fun m!99971 () Bool)

(assert (=> d!19558 m!99971))

(assert (=> d!19558 m!99681))

(assert (=> b!62974 d!19558))

(declare-fun d!19560 () Bool)

(declare-fun res!52497 () Bool)

(declare-fun e!41865 () Bool)

(assert (=> d!19560 (=> (not res!52497) (not e!41865))))

(assert (=> d!19560 (= res!52497 (= (size!1281 (buf!1662 (_1!2947 lt!99063))) (size!1281 (buf!1662 (_2!2946 lt!99061)))))))

(assert (=> d!19560 (= (isPrefixOf!0 (_1!2947 lt!99063) (_2!2946 lt!99061)) e!41865)))

(declare-fun b!63147 () Bool)

(declare-fun res!52499 () Bool)

(assert (=> b!63147 (=> (not res!52499) (not e!41865))))

(assert (=> b!63147 (= res!52499 (bvsle (bitIndex!0 (size!1281 (buf!1662 (_1!2947 lt!99063))) (currentByte!3304 (_1!2947 lt!99063)) (currentBit!3299 (_1!2947 lt!99063))) (bitIndex!0 (size!1281 (buf!1662 (_2!2946 lt!99061))) (currentByte!3304 (_2!2946 lt!99061)) (currentBit!3299 (_2!2946 lt!99061)))))))

(declare-fun b!63148 () Bool)

(declare-fun e!41864 () Bool)

(assert (=> b!63148 (= e!41865 e!41864)))

(declare-fun res!52498 () Bool)

(assert (=> b!63148 (=> res!52498 e!41864)))

(assert (=> b!63148 (= res!52498 (= (size!1281 (buf!1662 (_1!2947 lt!99063))) #b00000000000000000000000000000000))))

(declare-fun b!63149 () Bool)

(assert (=> b!63149 (= e!41864 (arrayBitRangesEq!0 (buf!1662 (_1!2947 lt!99063)) (buf!1662 (_2!2946 lt!99061)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1281 (buf!1662 (_1!2947 lt!99063))) (currentByte!3304 (_1!2947 lt!99063)) (currentBit!3299 (_1!2947 lt!99063)))))))

(assert (= (and d!19560 res!52497) b!63147))

(assert (= (and b!63147 res!52499) b!63148))

(assert (= (and b!63148 (not res!52498)) b!63149))

(assert (=> b!63147 m!99843))

(assert (=> b!63147 m!99747))

(assert (=> b!63149 m!99843))

(assert (=> b!63149 m!99843))

(declare-fun m!99973 () Bool)

(assert (=> b!63149 m!99973))

(assert (=> b!62979 d!19560))

(declare-fun d!19562 () Bool)

(assert (=> d!19562 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1281 (buf!1662 thiss!1379))) ((_ sign_extend 32) (currentByte!3304 thiss!1379)) ((_ sign_extend 32) (currentBit!3299 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1281 (buf!1662 thiss!1379))) ((_ sign_extend 32) (currentByte!3304 thiss!1379)) ((_ sign_extend 32) (currentBit!3299 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4838 () Bool)

(assert (= bs!4838 d!19562))

(declare-fun m!99975 () Bool)

(assert (=> bs!4838 m!99975))

(assert (=> b!62989 d!19562))

(declare-fun d!19564 () Bool)

(assert (=> d!19564 (= (array_inv!1172 srcBuffer!2) (bvsge (size!1281 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!12338 d!19564))

(declare-fun d!19566 () Bool)

(assert (=> d!19566 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3299 thiss!1379) (currentByte!3304 thiss!1379) (size!1281 (buf!1662 thiss!1379))))))

(declare-fun bs!4839 () Bool)

(assert (= bs!4839 d!19566))

(declare-fun m!99977 () Bool)

(assert (=> bs!4839 m!99977))

(assert (=> start!12338 d!19566))

(declare-fun d!19568 () Bool)

(assert (=> d!19568 (= (invariant!0 (currentBit!3299 (_2!2946 lt!99061)) (currentByte!3304 (_2!2946 lt!99061)) (size!1281 (buf!1662 (_2!2946 lt!99061)))) (and (bvsge (currentBit!3299 (_2!2946 lt!99061)) #b00000000000000000000000000000000) (bvslt (currentBit!3299 (_2!2946 lt!99061)) #b00000000000000000000000000001000) (bvsge (currentByte!3304 (_2!2946 lt!99061)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3304 (_2!2946 lt!99061)) (size!1281 (buf!1662 (_2!2946 lt!99061)))) (and (= (currentBit!3299 (_2!2946 lt!99061)) #b00000000000000000000000000000000) (= (currentByte!3304 (_2!2946 lt!99061)) (size!1281 (buf!1662 (_2!2946 lt!99061))))))))))

(assert (=> b!62977 d!19568))

(declare-fun d!19570 () Bool)

(assert (=> d!19570 (= (invariant!0 (currentBit!3299 (_2!2946 lt!99070)) (currentByte!3304 (_2!2946 lt!99070)) (size!1281 (buf!1662 (_2!2946 lt!99070)))) (and (bvsge (currentBit!3299 (_2!2946 lt!99070)) #b00000000000000000000000000000000) (bvslt (currentBit!3299 (_2!2946 lt!99070)) #b00000000000000000000000000001000) (bvsge (currentByte!3304 (_2!2946 lt!99070)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3304 (_2!2946 lt!99070)) (size!1281 (buf!1662 (_2!2946 lt!99070)))) (and (= (currentBit!3299 (_2!2946 lt!99070)) #b00000000000000000000000000000000) (= (currentByte!3304 (_2!2946 lt!99070)) (size!1281 (buf!1662 (_2!2946 lt!99070))))))))))

(assert (=> b!62992 d!19570))

(declare-fun d!19572 () Bool)

(assert (=> d!19572 (= (array_inv!1172 (buf!1662 thiss!1379)) (bvsge (size!1281 (buf!1662 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!62981 d!19572))

(declare-fun d!19574 () Bool)

(declare-fun res!52500 () Bool)

(declare-fun e!41867 () Bool)

(assert (=> d!19574 (=> (not res!52500) (not e!41867))))

(assert (=> d!19574 (= res!52500 (= (size!1281 (buf!1662 thiss!1379)) (size!1281 (buf!1662 thiss!1379))))))

(assert (=> d!19574 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!41867)))

(declare-fun b!63150 () Bool)

(declare-fun res!52502 () Bool)

(assert (=> b!63150 (=> (not res!52502) (not e!41867))))

(assert (=> b!63150 (= res!52502 (bvsle (bitIndex!0 (size!1281 (buf!1662 thiss!1379)) (currentByte!3304 thiss!1379) (currentBit!3299 thiss!1379)) (bitIndex!0 (size!1281 (buf!1662 thiss!1379)) (currentByte!3304 thiss!1379) (currentBit!3299 thiss!1379))))))

(declare-fun b!63151 () Bool)

(declare-fun e!41866 () Bool)

(assert (=> b!63151 (= e!41867 e!41866)))

(declare-fun res!52501 () Bool)

(assert (=> b!63151 (=> res!52501 e!41866)))

(assert (=> b!63151 (= res!52501 (= (size!1281 (buf!1662 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!63152 () Bool)

(assert (=> b!63152 (= e!41866 (arrayBitRangesEq!0 (buf!1662 thiss!1379) (buf!1662 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1281 (buf!1662 thiss!1379)) (currentByte!3304 thiss!1379) (currentBit!3299 thiss!1379))))))

(assert (= (and d!19574 res!52500) b!63150))

(assert (= (and b!63150 res!52502) b!63151))

(assert (= (and b!63151 (not res!52501)) b!63152))

(assert (=> b!63150 m!99713))

(assert (=> b!63150 m!99713))

(assert (=> b!63152 m!99713))

(assert (=> b!63152 m!99713))

(declare-fun m!99979 () Bool)

(assert (=> b!63152 m!99979))

(assert (=> b!62991 d!19574))

(declare-fun d!19576 () Bool)

(assert (=> d!19576 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!99289 () Unit!4279)

(declare-fun choose!11 (BitStream!2226) Unit!4279)

(assert (=> d!19576 (= lt!99289 (choose!11 thiss!1379))))

(assert (=> d!19576 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!99289)))

(declare-fun bs!4841 () Bool)

(assert (= bs!4841 d!19576))

(assert (=> bs!4841 m!99709))

(declare-fun m!99981 () Bool)

(assert (=> bs!4841 m!99981))

(assert (=> b!62991 d!19576))

(declare-fun d!19578 () Bool)

(declare-fun e!41868 () Bool)

(assert (=> d!19578 e!41868))

(declare-fun res!52503 () Bool)

(assert (=> d!19578 (=> (not res!52503) (not e!41868))))

(declare-fun lt!99295 () (_ BitVec 64))

(declare-fun lt!99294 () (_ BitVec 64))

(declare-fun lt!99291 () (_ BitVec 64))

(assert (=> d!19578 (= res!52503 (= lt!99294 (bvsub lt!99291 lt!99295)))))

(assert (=> d!19578 (or (= (bvand lt!99291 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!99295 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!99291 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!99291 lt!99295) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!19578 (= lt!99295 (remainingBits!0 ((_ sign_extend 32) (size!1281 (buf!1662 thiss!1379))) ((_ sign_extend 32) (currentByte!3304 thiss!1379)) ((_ sign_extend 32) (currentBit!3299 thiss!1379))))))

(declare-fun lt!99293 () (_ BitVec 64))

(declare-fun lt!99292 () (_ BitVec 64))

(assert (=> d!19578 (= lt!99291 (bvmul lt!99293 lt!99292))))

(assert (=> d!19578 (or (= lt!99293 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!99292 (bvsdiv (bvmul lt!99293 lt!99292) lt!99293)))))

(assert (=> d!19578 (= lt!99292 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!19578 (= lt!99293 ((_ sign_extend 32) (size!1281 (buf!1662 thiss!1379))))))

(assert (=> d!19578 (= lt!99294 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3304 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3299 thiss!1379))))))

(assert (=> d!19578 (invariant!0 (currentBit!3299 thiss!1379) (currentByte!3304 thiss!1379) (size!1281 (buf!1662 thiss!1379)))))

(assert (=> d!19578 (= (bitIndex!0 (size!1281 (buf!1662 thiss!1379)) (currentByte!3304 thiss!1379) (currentBit!3299 thiss!1379)) lt!99294)))

(declare-fun b!63153 () Bool)

(declare-fun res!52504 () Bool)

(assert (=> b!63153 (=> (not res!52504) (not e!41868))))

(assert (=> b!63153 (= res!52504 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!99294))))

(declare-fun b!63154 () Bool)

(declare-fun lt!99290 () (_ BitVec 64))

(assert (=> b!63154 (= e!41868 (bvsle lt!99294 (bvmul lt!99290 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!63154 (or (= lt!99290 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!99290 #b0000000000000000000000000000000000000000000000000000000000001000) lt!99290)))))

(assert (=> b!63154 (= lt!99290 ((_ sign_extend 32) (size!1281 (buf!1662 thiss!1379))))))

(assert (= (and d!19578 res!52503) b!63153))

(assert (= (and b!63153 res!52504) b!63154))

(assert (=> d!19578 m!99975))

(assert (=> d!19578 m!99977))

(assert (=> b!62991 d!19578))

(declare-fun d!19580 () Bool)

(declare-fun size!1283 (List!688) Int)

(assert (=> d!19580 (= (length!316 lt!99068) (size!1283 lt!99068))))

(declare-fun bs!4842 () Bool)

(assert (= bs!4842 d!19580))

(declare-fun m!99983 () Bool)

(assert (=> bs!4842 m!99983))

(assert (=> b!62980 d!19580))

(declare-fun d!19582 () Bool)

(assert (=> d!19582 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1281 (buf!1662 (_2!2946 lt!99070)))) ((_ sign_extend 32) (currentByte!3304 thiss!1379)) ((_ sign_extend 32) (currentBit!3299 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1281 (buf!1662 (_2!2946 lt!99070)))) ((_ sign_extend 32) (currentByte!3304 thiss!1379)) ((_ sign_extend 32) (currentBit!3299 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4843 () Bool)

(assert (= bs!4843 d!19582))

(declare-fun m!99985 () Bool)

(assert (=> bs!4843 m!99985))

(assert (=> b!62990 d!19582))

(declare-fun d!19584 () Bool)

(declare-fun res!52505 () Bool)

(declare-fun e!41870 () Bool)

(assert (=> d!19584 (=> (not res!52505) (not e!41870))))

(assert (=> d!19584 (= res!52505 (= (size!1281 (buf!1662 thiss!1379)) (size!1281 (buf!1662 (_2!2946 lt!99061)))))))

(assert (=> d!19584 (= (isPrefixOf!0 thiss!1379 (_2!2946 lt!99061)) e!41870)))

(declare-fun b!63155 () Bool)

(declare-fun res!52507 () Bool)

(assert (=> b!63155 (=> (not res!52507) (not e!41870))))

(assert (=> b!63155 (= res!52507 (bvsle (bitIndex!0 (size!1281 (buf!1662 thiss!1379)) (currentByte!3304 thiss!1379) (currentBit!3299 thiss!1379)) (bitIndex!0 (size!1281 (buf!1662 (_2!2946 lt!99061))) (currentByte!3304 (_2!2946 lt!99061)) (currentBit!3299 (_2!2946 lt!99061)))))))

(declare-fun b!63156 () Bool)

(declare-fun e!41869 () Bool)

(assert (=> b!63156 (= e!41870 e!41869)))

(declare-fun res!52506 () Bool)

(assert (=> b!63156 (=> res!52506 e!41869)))

(assert (=> b!63156 (= res!52506 (= (size!1281 (buf!1662 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!63157 () Bool)

(assert (=> b!63157 (= e!41869 (arrayBitRangesEq!0 (buf!1662 thiss!1379) (buf!1662 (_2!2946 lt!99061)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1281 (buf!1662 thiss!1379)) (currentByte!3304 thiss!1379) (currentBit!3299 thiss!1379))))))

(assert (= (and d!19584 res!52505) b!63155))

(assert (= (and b!63155 res!52507) b!63156))

(assert (= (and b!63156 (not res!52506)) b!63157))

(assert (=> b!63155 m!99713))

(assert (=> b!63155 m!99747))

(assert (=> b!63157 m!99713))

(assert (=> b!63157 m!99713))

(declare-fun m!99987 () Bool)

(assert (=> b!63157 m!99987))

(assert (=> b!62990 d!19584))

(declare-fun d!19586 () Bool)

(declare-fun res!52508 () Bool)

(declare-fun e!41872 () Bool)

(assert (=> d!19586 (=> (not res!52508) (not e!41872))))

(assert (=> d!19586 (= res!52508 (= (size!1281 (buf!1662 (_2!2946 lt!99070))) (size!1281 (buf!1662 (_2!2946 lt!99061)))))))

(assert (=> d!19586 (= (isPrefixOf!0 (_2!2946 lt!99070) (_2!2946 lt!99061)) e!41872)))

(declare-fun b!63158 () Bool)

(declare-fun res!52510 () Bool)

(assert (=> b!63158 (=> (not res!52510) (not e!41872))))

(assert (=> b!63158 (= res!52510 (bvsle (bitIndex!0 (size!1281 (buf!1662 (_2!2946 lt!99070))) (currentByte!3304 (_2!2946 lt!99070)) (currentBit!3299 (_2!2946 lt!99070))) (bitIndex!0 (size!1281 (buf!1662 (_2!2946 lt!99061))) (currentByte!3304 (_2!2946 lt!99061)) (currentBit!3299 (_2!2946 lt!99061)))))))

(declare-fun b!63159 () Bool)

(declare-fun e!41871 () Bool)

(assert (=> b!63159 (= e!41872 e!41871)))

(declare-fun res!52509 () Bool)

(assert (=> b!63159 (=> res!52509 e!41871)))

(assert (=> b!63159 (= res!52509 (= (size!1281 (buf!1662 (_2!2946 lt!99070))) #b00000000000000000000000000000000))))

(declare-fun b!63160 () Bool)

(assert (=> b!63160 (= e!41871 (arrayBitRangesEq!0 (buf!1662 (_2!2946 lt!99070)) (buf!1662 (_2!2946 lt!99061)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1281 (buf!1662 (_2!2946 lt!99070))) (currentByte!3304 (_2!2946 lt!99070)) (currentBit!3299 (_2!2946 lt!99070)))))))

(assert (= (and d!19586 res!52508) b!63158))

(assert (= (and b!63158 res!52510) b!63159))

(assert (= (and b!63159 (not res!52509)) b!63160))

(assert (=> b!63158 m!99745))

(assert (=> b!63158 m!99747))

(assert (=> b!63160 m!99745))

(assert (=> b!63160 m!99745))

(declare-fun m!99989 () Bool)

(assert (=> b!63160 m!99989))

(assert (=> b!62990 d!19586))

(declare-fun d!19588 () Bool)

(assert (=> d!19588 (validate_offset_bits!1 ((_ sign_extend 32) (size!1281 (buf!1662 (_2!2946 lt!99070)))) ((_ sign_extend 32) (currentByte!3304 thiss!1379)) ((_ sign_extend 32) (currentBit!3299 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!99296 () Unit!4279)

(assert (=> d!19588 (= lt!99296 (choose!9 thiss!1379 (buf!1662 (_2!2946 lt!99070)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2227 (buf!1662 (_2!2946 lt!99070)) (currentByte!3304 thiss!1379) (currentBit!3299 thiss!1379))))))

(assert (=> d!19588 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1662 (_2!2946 lt!99070)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!99296)))

(declare-fun bs!4844 () Bool)

(assert (= bs!4844 d!19588))

(assert (=> bs!4844 m!99699))

(declare-fun m!99991 () Bool)

(assert (=> bs!4844 m!99991))

(assert (=> b!62990 d!19588))

(declare-fun e!41873 () Bool)

(declare-fun lt!99306 () (_ BitVec 64))

(declare-fun b!63161 () Bool)

(declare-fun lt!99308 () (_ BitVec 64))

(declare-fun lt!99316 () tuple2!5672)

(assert (=> b!63161 (= e!41873 (= (_1!2947 lt!99316) (withMovedBitIndex!0 (_2!2947 lt!99316) (bvsub lt!99308 lt!99306))))))

(assert (=> b!63161 (or (= (bvand lt!99308 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!99306 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!99308 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!99308 lt!99306) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!63161 (= lt!99306 (bitIndex!0 (size!1281 (buf!1662 (_2!2946 lt!99070))) (currentByte!3304 (_2!2946 lt!99070)) (currentBit!3299 (_2!2946 lt!99070))))))

(assert (=> b!63161 (= lt!99308 (bitIndex!0 (size!1281 (buf!1662 thiss!1379)) (currentByte!3304 thiss!1379) (currentBit!3299 thiss!1379)))))

(declare-fun b!63162 () Bool)

(declare-fun e!41874 () Unit!4279)

(declare-fun lt!99312 () Unit!4279)

(assert (=> b!63162 (= e!41874 lt!99312)))

(declare-fun lt!99299 () (_ BitVec 64))

(assert (=> b!63162 (= lt!99299 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!99302 () (_ BitVec 64))

(assert (=> b!63162 (= lt!99302 (bitIndex!0 (size!1281 (buf!1662 thiss!1379)) (currentByte!3304 thiss!1379) (currentBit!3299 thiss!1379)))))

(assert (=> b!63162 (= lt!99312 (arrayBitRangesEqSymmetric!0 (buf!1662 thiss!1379) (buf!1662 (_2!2946 lt!99070)) lt!99299 lt!99302))))

(assert (=> b!63162 (arrayBitRangesEq!0 (buf!1662 (_2!2946 lt!99070)) (buf!1662 thiss!1379) lt!99299 lt!99302)))

(declare-fun b!63163 () Bool)

(declare-fun res!52513 () Bool)

(assert (=> b!63163 (=> (not res!52513) (not e!41873))))

(assert (=> b!63163 (= res!52513 (isPrefixOf!0 (_2!2947 lt!99316) (_2!2946 lt!99070)))))

(declare-fun d!19590 () Bool)

(assert (=> d!19590 e!41873))

(declare-fun res!52512 () Bool)

(assert (=> d!19590 (=> (not res!52512) (not e!41873))))

(assert (=> d!19590 (= res!52512 (isPrefixOf!0 (_1!2947 lt!99316) (_2!2947 lt!99316)))))

(declare-fun lt!99305 () BitStream!2226)

(assert (=> d!19590 (= lt!99316 (tuple2!5673 lt!99305 (_2!2946 lt!99070)))))

(declare-fun lt!99311 () Unit!4279)

(declare-fun lt!99313 () Unit!4279)

(assert (=> d!19590 (= lt!99311 lt!99313)))

(assert (=> d!19590 (isPrefixOf!0 lt!99305 (_2!2946 lt!99070))))

(assert (=> d!19590 (= lt!99313 (lemmaIsPrefixTransitive!0 lt!99305 (_2!2946 lt!99070) (_2!2946 lt!99070)))))

(declare-fun lt!99300 () Unit!4279)

(declare-fun lt!99297 () Unit!4279)

(assert (=> d!19590 (= lt!99300 lt!99297)))

(assert (=> d!19590 (isPrefixOf!0 lt!99305 (_2!2946 lt!99070))))

(assert (=> d!19590 (= lt!99297 (lemmaIsPrefixTransitive!0 lt!99305 thiss!1379 (_2!2946 lt!99070)))))

(declare-fun lt!99303 () Unit!4279)

(assert (=> d!19590 (= lt!99303 e!41874)))

(declare-fun c!4497 () Bool)

(assert (=> d!19590 (= c!4497 (not (= (size!1281 (buf!1662 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!99307 () Unit!4279)

(declare-fun lt!99314 () Unit!4279)

(assert (=> d!19590 (= lt!99307 lt!99314)))

(assert (=> d!19590 (isPrefixOf!0 (_2!2946 lt!99070) (_2!2946 lt!99070))))

(assert (=> d!19590 (= lt!99314 (lemmaIsPrefixRefl!0 (_2!2946 lt!99070)))))

(declare-fun lt!99304 () Unit!4279)

(declare-fun lt!99310 () Unit!4279)

(assert (=> d!19590 (= lt!99304 lt!99310)))

(assert (=> d!19590 (= lt!99310 (lemmaIsPrefixRefl!0 (_2!2946 lt!99070)))))

(declare-fun lt!99309 () Unit!4279)

(declare-fun lt!99315 () Unit!4279)

(assert (=> d!19590 (= lt!99309 lt!99315)))

(assert (=> d!19590 (isPrefixOf!0 lt!99305 lt!99305)))

(assert (=> d!19590 (= lt!99315 (lemmaIsPrefixRefl!0 lt!99305))))

(declare-fun lt!99301 () Unit!4279)

(declare-fun lt!99298 () Unit!4279)

(assert (=> d!19590 (= lt!99301 lt!99298)))

(assert (=> d!19590 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!19590 (= lt!99298 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!19590 (= lt!99305 (BitStream!2227 (buf!1662 (_2!2946 lt!99070)) (currentByte!3304 thiss!1379) (currentBit!3299 thiss!1379)))))

(assert (=> d!19590 (isPrefixOf!0 thiss!1379 (_2!2946 lt!99070))))

(assert (=> d!19590 (= (reader!0 thiss!1379 (_2!2946 lt!99070)) lt!99316)))

(declare-fun b!63164 () Bool)

(declare-fun res!52511 () Bool)

(assert (=> b!63164 (=> (not res!52511) (not e!41873))))

(assert (=> b!63164 (= res!52511 (isPrefixOf!0 (_1!2947 lt!99316) thiss!1379))))

(declare-fun b!63165 () Bool)

(declare-fun Unit!4285 () Unit!4279)

(assert (=> b!63165 (= e!41874 Unit!4285)))

(assert (= (and d!19590 c!4497) b!63162))

(assert (= (and d!19590 (not c!4497)) b!63165))

(assert (= (and d!19590 res!52512) b!63164))

(assert (= (and b!63164 res!52511) b!63163))

(assert (= (and b!63163 res!52513) b!63161))

(declare-fun m!99993 () Bool)

(assert (=> b!63163 m!99993))

(assert (=> d!19590 m!99907))

(assert (=> d!19590 m!99711))

(assert (=> d!19590 m!99899))

(declare-fun m!99995 () Bool)

(assert (=> d!19590 m!99995))

(declare-fun m!99997 () Bool)

(assert (=> d!19590 m!99997))

(assert (=> d!19590 m!99709))

(declare-fun m!99999 () Bool)

(assert (=> d!19590 m!99999))

(assert (=> d!19590 m!99717))

(declare-fun m!100001 () Bool)

(assert (=> d!19590 m!100001))

(declare-fun m!100003 () Bool)

(assert (=> d!19590 m!100003))

(declare-fun m!100005 () Bool)

(assert (=> d!19590 m!100005))

(declare-fun m!100007 () Bool)

(assert (=> b!63161 m!100007))

(assert (=> b!63161 m!99745))

(assert (=> b!63161 m!99713))

(declare-fun m!100009 () Bool)

(assert (=> b!63164 m!100009))

(assert (=> b!63162 m!99713))

(declare-fun m!100011 () Bool)

(assert (=> b!63162 m!100011))

(declare-fun m!100013 () Bool)

(assert (=> b!63162 m!100013))

(assert (=> b!62990 d!19590))

(declare-fun d!19592 () Bool)

(assert (=> d!19592 (isPrefixOf!0 thiss!1379 (_2!2946 lt!99061))))

(declare-fun lt!99319 () Unit!4279)

(declare-fun choose!30 (BitStream!2226 BitStream!2226 BitStream!2226) Unit!4279)

(assert (=> d!19592 (= lt!99319 (choose!30 thiss!1379 (_2!2946 lt!99070) (_2!2946 lt!99061)))))

(assert (=> d!19592 (isPrefixOf!0 thiss!1379 (_2!2946 lt!99070))))

(assert (=> d!19592 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2946 lt!99070) (_2!2946 lt!99061)) lt!99319)))

(declare-fun bs!4845 () Bool)

(assert (= bs!4845 d!19592))

(assert (=> bs!4845 m!99703))

(declare-fun m!100015 () Bool)

(assert (=> bs!4845 m!100015))

(assert (=> bs!4845 m!99717))

(assert (=> b!62990 d!19592))

(declare-fun b!63248 () Bool)

(declare-fun res!52571 () Bool)

(declare-fun e!41919 () Bool)

(assert (=> b!63248 (=> (not res!52571) (not e!41919))))

(declare-fun lt!99539 () tuple2!5670)

(assert (=> b!63248 (= res!52571 (= (size!1281 (buf!1662 (_2!2946 lt!99070))) (size!1281 (buf!1662 (_2!2946 lt!99539)))))))

(declare-fun b!63249 () Bool)

(declare-fun e!41917 () Bool)

(declare-fun lt!99507 () (_ BitVec 64))

(assert (=> b!63249 (= e!41917 (validate_offset_bits!1 ((_ sign_extend 32) (size!1281 (buf!1662 (_2!2946 lt!99070)))) ((_ sign_extend 32) (currentByte!3304 (_2!2946 lt!99070))) ((_ sign_extend 32) (currentBit!3299 (_2!2946 lt!99070))) lt!99507))))

(declare-fun b!63250 () Bool)

(declare-fun res!52568 () Bool)

(assert (=> b!63250 (=> (not res!52568) (not e!41919))))

(assert (=> b!63250 (= res!52568 (= (size!1281 (buf!1662 (_2!2946 lt!99539))) (size!1281 (buf!1662 (_2!2946 lt!99070)))))))

(declare-fun b!63251 () Bool)

(declare-fun res!52573 () Bool)

(assert (=> b!63251 (=> (not res!52573) (not e!41919))))

(assert (=> b!63251 (= res!52573 (invariant!0 (currentBit!3299 (_2!2946 lt!99539)) (currentByte!3304 (_2!2946 lt!99539)) (size!1281 (buf!1662 (_2!2946 lt!99539)))))))

(declare-fun d!19594 () Bool)

(assert (=> d!19594 e!41919))

(declare-fun res!52572 () Bool)

(assert (=> d!19594 (=> (not res!52572) (not e!41919))))

(declare-fun lt!99503 () (_ BitVec 64))

(assert (=> d!19594 (= res!52572 (= (bitIndex!0 (size!1281 (buf!1662 (_2!2946 lt!99539))) (currentByte!3304 (_2!2946 lt!99539)) (currentBit!3299 (_2!2946 lt!99539))) (bvsub lt!99503 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!19594 (or (= (bvand lt!99503 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!99503 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!99503 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!99510 () (_ BitVec 64))

(assert (=> d!19594 (= lt!99503 (bvadd lt!99510 to!314))))

(assert (=> d!19594 (or (not (= (bvand lt!99510 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!99510 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!99510 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!19594 (= lt!99510 (bitIndex!0 (size!1281 (buf!1662 (_2!2946 lt!99070))) (currentByte!3304 (_2!2946 lt!99070)) (currentBit!3299 (_2!2946 lt!99070))))))

(declare-fun e!41918 () tuple2!5670)

(assert (=> d!19594 (= lt!99539 e!41918)))

(declare-fun c!4512 () Bool)

(assert (=> d!19594 (= c!4512 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!99500 () Unit!4279)

(declare-fun lt!99519 () Unit!4279)

(assert (=> d!19594 (= lt!99500 lt!99519)))

(assert (=> d!19594 (isPrefixOf!0 (_2!2946 lt!99070) (_2!2946 lt!99070))))

(assert (=> d!19594 (= lt!99519 (lemmaIsPrefixRefl!0 (_2!2946 lt!99070)))))

(declare-fun lt!99518 () (_ BitVec 64))

(assert (=> d!19594 (= lt!99518 (bitIndex!0 (size!1281 (buf!1662 (_2!2946 lt!99070))) (currentByte!3304 (_2!2946 lt!99070)) (currentBit!3299 (_2!2946 lt!99070))))))

(assert (=> d!19594 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!19594 (= (appendBitsMSBFirstLoop!0 (_2!2946 lt!99070) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!99539)))

(declare-fun lt!99522 () tuple2!5672)

(declare-fun b!63252 () Bool)

(assert (=> b!63252 (= e!41919 (= (bitStreamReadBitsIntoList!0 (_2!2946 lt!99539) (_1!2947 lt!99522) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2946 lt!99539) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!63252 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!63252 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!99523 () Unit!4279)

(declare-fun lt!99536 () Unit!4279)

(assert (=> b!63252 (= lt!99523 lt!99536)))

(assert (=> b!63252 (validate_offset_bits!1 ((_ sign_extend 32) (size!1281 (buf!1662 (_2!2946 lt!99539)))) ((_ sign_extend 32) (currentByte!3304 (_2!2946 lt!99070))) ((_ sign_extend 32) (currentBit!3299 (_2!2946 lt!99070))) lt!99507)))

(assert (=> b!63252 (= lt!99536 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2946 lt!99070) (buf!1662 (_2!2946 lt!99539)) lt!99507))))

(assert (=> b!63252 e!41917))

(declare-fun res!52569 () Bool)

(assert (=> b!63252 (=> (not res!52569) (not e!41917))))

(assert (=> b!63252 (= res!52569 (and (= (size!1281 (buf!1662 (_2!2946 lt!99070))) (size!1281 (buf!1662 (_2!2946 lt!99539)))) (bvsge lt!99507 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!63252 (= lt!99507 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!63252 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!63252 (= lt!99522 (reader!0 (_2!2946 lt!99070) (_2!2946 lt!99539)))))

(declare-fun b!63253 () Bool)

(declare-fun lt!99512 () tuple2!5670)

(declare-fun Unit!4286 () Unit!4279)

(assert (=> b!63253 (= e!41918 (tuple2!5671 Unit!4286 (_2!2946 lt!99512)))))

(declare-fun lt!99530 () tuple2!5670)

(assert (=> b!63253 (= lt!99530 (appendBitFromByte!0 (_2!2946 lt!99070) (select (arr!1845 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!99533 () (_ BitVec 64))

(assert (=> b!63253 (= lt!99533 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!99528 () (_ BitVec 64))

(assert (=> b!63253 (= lt!99528 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!99535 () Unit!4279)

(assert (=> b!63253 (= lt!99535 (validateOffsetBitsIneqLemma!0 (_2!2946 lt!99070) (_2!2946 lt!99530) lt!99533 lt!99528))))

(assert (=> b!63253 (validate_offset_bits!1 ((_ sign_extend 32) (size!1281 (buf!1662 (_2!2946 lt!99530)))) ((_ sign_extend 32) (currentByte!3304 (_2!2946 lt!99530))) ((_ sign_extend 32) (currentBit!3299 (_2!2946 lt!99530))) (bvsub lt!99533 lt!99528))))

(declare-fun lt!99505 () Unit!4279)

(assert (=> b!63253 (= lt!99505 lt!99535)))

(declare-fun lt!99540 () tuple2!5672)

(assert (=> b!63253 (= lt!99540 (reader!0 (_2!2946 lt!99070) (_2!2946 lt!99530)))))

(declare-fun lt!99538 () (_ BitVec 64))

(assert (=> b!63253 (= lt!99538 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!99513 () Unit!4279)

(assert (=> b!63253 (= lt!99513 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2946 lt!99070) (buf!1662 (_2!2946 lt!99530)) lt!99538))))

(assert (=> b!63253 (validate_offset_bits!1 ((_ sign_extend 32) (size!1281 (buf!1662 (_2!2946 lt!99530)))) ((_ sign_extend 32) (currentByte!3304 (_2!2946 lt!99070))) ((_ sign_extend 32) (currentBit!3299 (_2!2946 lt!99070))) lt!99538)))

(declare-fun lt!99532 () Unit!4279)

(assert (=> b!63253 (= lt!99532 lt!99513)))

(assert (=> b!63253 (= (head!507 (byteArrayBitContentToList!0 (_2!2946 lt!99530) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!507 (bitStreamReadBitsIntoList!0 (_2!2946 lt!99530) (_1!2947 lt!99540) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!99501 () Unit!4279)

(declare-fun Unit!4287 () Unit!4279)

(assert (=> b!63253 (= lt!99501 Unit!4287)))

(assert (=> b!63253 (= lt!99512 (appendBitsMSBFirstLoop!0 (_2!2946 lt!99530) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!99529 () Unit!4279)

(assert (=> b!63253 (= lt!99529 (lemmaIsPrefixTransitive!0 (_2!2946 lt!99070) (_2!2946 lt!99530) (_2!2946 lt!99512)))))

(assert (=> b!63253 (isPrefixOf!0 (_2!2946 lt!99070) (_2!2946 lt!99512))))

(declare-fun lt!99541 () Unit!4279)

(assert (=> b!63253 (= lt!99541 lt!99529)))

(assert (=> b!63253 (= (size!1281 (buf!1662 (_2!2946 lt!99512))) (size!1281 (buf!1662 (_2!2946 lt!99070))))))

(declare-fun lt!99534 () Unit!4279)

(declare-fun Unit!4288 () Unit!4279)

(assert (=> b!63253 (= lt!99534 Unit!4288)))

(assert (=> b!63253 (= (bitIndex!0 (size!1281 (buf!1662 (_2!2946 lt!99512))) (currentByte!3304 (_2!2946 lt!99512)) (currentBit!3299 (_2!2946 lt!99512))) (bvsub (bvadd (bitIndex!0 (size!1281 (buf!1662 (_2!2946 lt!99070))) (currentByte!3304 (_2!2946 lt!99070)) (currentBit!3299 (_2!2946 lt!99070))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!99504 () Unit!4279)

(declare-fun Unit!4289 () Unit!4279)

(assert (=> b!63253 (= lt!99504 Unit!4289)))

(assert (=> b!63253 (= (bitIndex!0 (size!1281 (buf!1662 (_2!2946 lt!99512))) (currentByte!3304 (_2!2946 lt!99512)) (currentBit!3299 (_2!2946 lt!99512))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1281 (buf!1662 (_2!2946 lt!99530))) (currentByte!3304 (_2!2946 lt!99530)) (currentBit!3299 (_2!2946 lt!99530))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!99502 () Unit!4279)

(declare-fun Unit!4290 () Unit!4279)

(assert (=> b!63253 (= lt!99502 Unit!4290)))

(declare-fun lt!99527 () tuple2!5672)

(assert (=> b!63253 (= lt!99527 (reader!0 (_2!2946 lt!99070) (_2!2946 lt!99512)))))

(declare-fun lt!99506 () (_ BitVec 64))

(assert (=> b!63253 (= lt!99506 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!99516 () Unit!4279)

(assert (=> b!63253 (= lt!99516 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2946 lt!99070) (buf!1662 (_2!2946 lt!99512)) lt!99506))))

(assert (=> b!63253 (validate_offset_bits!1 ((_ sign_extend 32) (size!1281 (buf!1662 (_2!2946 lt!99512)))) ((_ sign_extend 32) (currentByte!3304 (_2!2946 lt!99070))) ((_ sign_extend 32) (currentBit!3299 (_2!2946 lt!99070))) lt!99506)))

(declare-fun lt!99508 () Unit!4279)

(assert (=> b!63253 (= lt!99508 lt!99516)))

(declare-fun lt!99499 () tuple2!5672)

(declare-fun call!802 () tuple2!5672)

(assert (=> b!63253 (= lt!99499 call!802)))

(declare-fun lt!99514 () (_ BitVec 64))

(assert (=> b!63253 (= lt!99514 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!99520 () Unit!4279)

(assert (=> b!63253 (= lt!99520 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2946 lt!99530) (buf!1662 (_2!2946 lt!99512)) lt!99514))))

(assert (=> b!63253 (validate_offset_bits!1 ((_ sign_extend 32) (size!1281 (buf!1662 (_2!2946 lt!99512)))) ((_ sign_extend 32) (currentByte!3304 (_2!2946 lt!99530))) ((_ sign_extend 32) (currentBit!3299 (_2!2946 lt!99530))) lt!99514)))

(declare-fun lt!99509 () Unit!4279)

(assert (=> b!63253 (= lt!99509 lt!99520)))

(declare-fun lt!99524 () List!688)

(assert (=> b!63253 (= lt!99524 (byteArrayBitContentToList!0 (_2!2946 lt!99512) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!99525 () List!688)

(assert (=> b!63253 (= lt!99525 (byteArrayBitContentToList!0 (_2!2946 lt!99512) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!99526 () List!688)

(assert (=> b!63253 (= lt!99526 (bitStreamReadBitsIntoList!0 (_2!2946 lt!99512) (_1!2947 lt!99527) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!99521 () List!688)

(assert (=> b!63253 (= lt!99521 (bitStreamReadBitsIntoList!0 (_2!2946 lt!99512) (_1!2947 lt!99499) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!99537 () (_ BitVec 64))

(assert (=> b!63253 (= lt!99537 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!99515 () Unit!4279)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2226 BitStream!2226 BitStream!2226 BitStream!2226 (_ BitVec 64) List!688) Unit!4279)

(assert (=> b!63253 (= lt!99515 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2946 lt!99512) (_2!2946 lt!99512) (_1!2947 lt!99527) (_1!2947 lt!99499) lt!99537 lt!99526))))

(declare-fun tail!294 (List!688) List!688)

(assert (=> b!63253 (= (bitStreamReadBitsIntoList!0 (_2!2946 lt!99512) (_1!2947 lt!99499) (bvsub lt!99537 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!294 lt!99526))))

(declare-fun lt!99511 () Unit!4279)

(assert (=> b!63253 (= lt!99511 lt!99515)))

(declare-fun lt!99517 () Unit!4279)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2799 array!2799 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4279)

(assert (=> b!63253 (= lt!99517 (arrayBitRangesEqImpliesEq!0 (buf!1662 (_2!2946 lt!99530)) (buf!1662 (_2!2946 lt!99512)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!99518 (bitIndex!0 (size!1281 (buf!1662 (_2!2946 lt!99530))) (currentByte!3304 (_2!2946 lt!99530)) (currentBit!3299 (_2!2946 lt!99530)))))))

(declare-fun bitAt!0 (array!2799 (_ BitVec 64)) Bool)

(assert (=> b!63253 (= (bitAt!0 (buf!1662 (_2!2946 lt!99530)) lt!99518) (bitAt!0 (buf!1662 (_2!2946 lt!99512)) lt!99518))))

(declare-fun lt!99498 () Unit!4279)

(assert (=> b!63253 (= lt!99498 lt!99517)))

(declare-fun b!63254 () Bool)

(declare-fun res!52570 () Bool)

(assert (=> b!63254 (=> (not res!52570) (not e!41919))))

(assert (=> b!63254 (= res!52570 (isPrefixOf!0 (_2!2946 lt!99070) (_2!2946 lt!99539)))))

(declare-fun b!63255 () Bool)

(declare-fun Unit!4291 () Unit!4279)

(assert (=> b!63255 (= e!41918 (tuple2!5671 Unit!4291 (_2!2946 lt!99070)))))

(assert (=> b!63255 (= (size!1281 (buf!1662 (_2!2946 lt!99070))) (size!1281 (buf!1662 (_2!2946 lt!99070))))))

(declare-fun lt!99531 () Unit!4279)

(declare-fun Unit!4292 () Unit!4279)

(assert (=> b!63255 (= lt!99531 Unit!4292)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2226 array!2799 array!2799 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!63255 (checkByteArrayBitContent!0 (_2!2946 lt!99070) srcBuffer!2 (_1!2953 (readBits!0 (_1!2947 call!802) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun bm!799 () Bool)

(assert (=> bm!799 (= call!802 (reader!0 (ite c!4512 (_2!2946 lt!99530) (_2!2946 lt!99070)) (ite c!4512 (_2!2946 lt!99512) (_2!2946 lt!99070))))))

(assert (= (and d!19594 c!4512) b!63253))

(assert (= (and d!19594 (not c!4512)) b!63255))

(assert (= (or b!63253 b!63255) bm!799))

(assert (= (and d!19594 res!52572) b!63251))

(assert (= (and b!63251 res!52573) b!63248))

(assert (= (and b!63248 res!52571) b!63254))

(assert (= (and b!63254 res!52570) b!63250))

(assert (= (and b!63250 res!52568) b!63252))

(assert (= (and b!63252 res!52569) b!63249))

(declare-fun m!100085 () Bool)

(assert (=> b!63255 m!100085))

(declare-fun m!100087 () Bool)

(assert (=> b!63255 m!100087))

(declare-fun m!100089 () Bool)

(assert (=> b!63251 m!100089))

(declare-fun m!100091 () Bool)

(assert (=> b!63254 m!100091))

(declare-fun m!100093 () Bool)

(assert (=> b!63249 m!100093))

(declare-fun m!100095 () Bool)

(assert (=> bm!799 m!100095))

(declare-fun m!100097 () Bool)

(assert (=> b!63252 m!100097))

(declare-fun m!100099 () Bool)

(assert (=> b!63252 m!100099))

(declare-fun m!100101 () Bool)

(assert (=> b!63252 m!100101))

(declare-fun m!100103 () Bool)

(assert (=> b!63252 m!100103))

(declare-fun m!100105 () Bool)

(assert (=> b!63252 m!100105))

(declare-fun m!100107 () Bool)

(assert (=> b!63253 m!100107))

(declare-fun m!100109 () Bool)

(assert (=> b!63253 m!100109))

(declare-fun m!100111 () Bool)

(assert (=> b!63253 m!100111))

(declare-fun m!100113 () Bool)

(assert (=> b!63253 m!100113))

(declare-fun m!100115 () Bool)

(assert (=> b!63253 m!100115))

(declare-fun m!100117 () Bool)

(assert (=> b!63253 m!100117))

(declare-fun m!100119 () Bool)

(assert (=> b!63253 m!100119))

(declare-fun m!100121 () Bool)

(assert (=> b!63253 m!100121))

(declare-fun m!100123 () Bool)

(assert (=> b!63253 m!100123))

(declare-fun m!100125 () Bool)

(assert (=> b!63253 m!100125))

(assert (=> b!63253 m!100115))

(declare-fun m!100127 () Bool)

(assert (=> b!63253 m!100127))

(declare-fun m!100129 () Bool)

(assert (=> b!63253 m!100129))

(declare-fun m!100131 () Bool)

(assert (=> b!63253 m!100131))

(declare-fun m!100133 () Bool)

(assert (=> b!63253 m!100133))

(declare-fun m!100135 () Bool)

(assert (=> b!63253 m!100135))

(declare-fun m!100137 () Bool)

(assert (=> b!63253 m!100137))

(declare-fun m!100139 () Bool)

(assert (=> b!63253 m!100139))

(declare-fun m!100141 () Bool)

(assert (=> b!63253 m!100141))

(declare-fun m!100143 () Bool)

(assert (=> b!63253 m!100143))

(declare-fun m!100145 () Bool)

(assert (=> b!63253 m!100145))

(declare-fun m!100147 () Bool)

(assert (=> b!63253 m!100147))

(assert (=> b!63253 m!99745))

(declare-fun m!100149 () Bool)

(assert (=> b!63253 m!100149))

(declare-fun m!100151 () Bool)

(assert (=> b!63253 m!100151))

(declare-fun m!100153 () Bool)

(assert (=> b!63253 m!100153))

(assert (=> b!63253 m!100125))

(declare-fun m!100155 () Bool)

(assert (=> b!63253 m!100155))

(declare-fun m!100157 () Bool)

(assert (=> b!63253 m!100157))

(assert (=> b!63253 m!100137))

(declare-fun m!100159 () Bool)

(assert (=> b!63253 m!100159))

(declare-fun m!100161 () Bool)

(assert (=> b!63253 m!100161))

(declare-fun m!100163 () Bool)

(assert (=> b!63253 m!100163))

(declare-fun m!100165 () Bool)

(assert (=> b!63253 m!100165))

(declare-fun m!100167 () Bool)

(assert (=> b!63253 m!100167))

(assert (=> b!63253 m!100133))

(declare-fun m!100169 () Bool)

(assert (=> d!19594 m!100169))

(assert (=> d!19594 m!99745))

(assert (=> d!19594 m!99907))

(assert (=> d!19594 m!99899))

(assert (=> b!62990 d!19594))

(check-sat (not b!63152) (not bm!799) (not b!63149) (not b!63129) (not b!63108) (not d!19562) (not b!63136) (not b!63155) (not b!63101) (not d!19540) (not b!63252) (not b!63137) (not b!63162) (not b!63077) (not b!63147) (not d!19548) (not b!63074) (not b!63128) (not b!63130) (not d!19550) (not b!63104) (not b!63133) (not b!63249) (not b!63251) (not b!63123) (not b!63253) (not b!63106) (not b!63082) (not d!19534) (not b!63110) (not b!63163) (not d!19558) (not d!19542) (not d!19566) (not d!19532) (not b!63058) (not b!63079) (not b!63103) (not b!63138) (not d!19582) (not b!63150) (not b!63076) (not b!63132) (not b!63102) (not d!19578) (not b!63075) (not b!63160) (not b!63255) (not b!63164) (not d!19552) (not b!63157) (not b!63127) (not b!63161) (not d!19594) (not d!19592) (not d!19580) (not b!63107) (not b!63064) (not b!63131) (not b!63158) (not b!63105) (not d!19536) (not b!63122) (not b!63254) (not d!19576) (not b!63100) (not d!19544) (not d!19590) (not b!63124) (not d!19556) (not d!19588) (not b!63121) (not b!63056))
