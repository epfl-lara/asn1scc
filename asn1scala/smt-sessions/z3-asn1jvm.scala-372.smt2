; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8644 () Bool)

(assert start!8644)

(declare-fun b!43093 () Bool)

(declare-fun res!36616 () Bool)

(declare-fun e!28803 () Bool)

(assert (=> b!43093 (=> (not res!36616) (not e!28803))))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-datatypes ((array!2208 0))(
  ( (array!2209 (arr!1500 (Array (_ BitVec 32) (_ BitVec 8))) (size!998 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1740 0))(
  ( (BitStream!1741 (buf!1332 array!2208) (currentByte!2798 (_ BitVec 32)) (currentBit!2793 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1740)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!43093 (= res!36616 (validate_offset_bits!1 ((_ sign_extend 32) (size!998 (buf!1332 thiss!1379))) ((_ sign_extend 32) (currentByte!2798 thiss!1379)) ((_ sign_extend 32) (currentBit!2793 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun e!28805 () Bool)

(declare-fun lt!65011 () (_ BitVec 64))

(declare-datatypes ((Unit!3066 0))(
  ( (Unit!3067) )
))
(declare-datatypes ((tuple2!4230 0))(
  ( (tuple2!4231 (_1!2208 Unit!3066) (_2!2208 BitStream!1740)) )
))
(declare-fun lt!65006 () tuple2!4230)

(declare-fun b!43094 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!43094 (= e!28805 (= (bitIndex!0 (size!998 (buf!1332 (_2!2208 lt!65006))) (currentByte!2798 (_2!2208 lt!65006)) (currentBit!2793 (_2!2208 lt!65006))) (bvsub (bvadd lt!65011 to!314) i!635)))))

(declare-fun srcBuffer!2 () array!2208)

(declare-fun e!28802 () Bool)

(declare-fun lt!65007 () tuple2!4230)

(declare-datatypes ((tuple2!4232 0))(
  ( (tuple2!4233 (_1!2209 BitStream!1740) (_2!2209 BitStream!1740)) )
))
(declare-fun lt!65010 () tuple2!4232)

(declare-fun b!43095 () Bool)

(declare-datatypes ((List!511 0))(
  ( (Nil!508) (Cons!507 (h!626 Bool) (t!1261 List!511)) )
))
(declare-fun head!330 (List!511) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1740 array!2208 (_ BitVec 64) (_ BitVec 64)) List!511)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1740 BitStream!1740 (_ BitVec 64)) List!511)

(assert (=> b!43095 (= e!28802 (= (head!330 (byteArrayBitContentToList!0 (_2!2208 lt!65007) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!330 (bitStreamReadBitsIntoList!0 (_2!2208 lt!65007) (_1!2209 lt!65010) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!43096 () Bool)

(declare-fun e!28807 () Bool)

(assert (=> b!43096 (= e!28803 (not e!28807))))

(declare-fun res!36618 () Bool)

(assert (=> b!43096 (=> res!36618 e!28807)))

(assert (=> b!43096 (= res!36618 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1740 BitStream!1740) Bool)

(assert (=> b!43096 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!65005 () Unit!3066)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1740) Unit!3066)

(assert (=> b!43096 (= lt!65005 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!43096 (= lt!65011 (bitIndex!0 (size!998 (buf!1332 thiss!1379)) (currentByte!2798 thiss!1379) (currentBit!2793 thiss!1379)))))

(declare-fun b!43097 () Bool)

(declare-fun e!28808 () Bool)

(declare-fun array_inv!923 (array!2208) Bool)

(assert (=> b!43097 (= e!28808 (array_inv!923 (buf!1332 thiss!1379)))))

(declare-fun b!43098 () Bool)

(declare-fun e!28806 () Bool)

(assert (=> b!43098 (= e!28807 e!28806)))

(declare-fun res!36617 () Bool)

(assert (=> b!43098 (=> res!36617 e!28806)))

(assert (=> b!43098 (= res!36617 (not (isPrefixOf!0 thiss!1379 (_2!2208 lt!65007))))))

(assert (=> b!43098 (validate_offset_bits!1 ((_ sign_extend 32) (size!998 (buf!1332 (_2!2208 lt!65007)))) ((_ sign_extend 32) (currentByte!2798 (_2!2208 lt!65007))) ((_ sign_extend 32) (currentBit!2793 (_2!2208 lt!65007))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!65008 () Unit!3066)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1740 BitStream!1740 (_ BitVec 64) (_ BitVec 64)) Unit!3066)

(assert (=> b!43098 (= lt!65008 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2208 lt!65007) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1740 (_ BitVec 8) (_ BitVec 32)) tuple2!4230)

(assert (=> b!43098 (= lt!65007 (appendBitFromByte!0 thiss!1379 (select (arr!1500 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!43099 () Bool)

(assert (=> b!43099 (= e!28806 e!28805)))

(declare-fun res!36615 () Bool)

(assert (=> b!43099 (=> res!36615 e!28805)))

(assert (=> b!43099 (= res!36615 (not (isPrefixOf!0 (_2!2208 lt!65007) (_2!2208 lt!65006))))))

(assert (=> b!43099 (isPrefixOf!0 thiss!1379 (_2!2208 lt!65006))))

(declare-fun lt!65009 () Unit!3066)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1740 BitStream!1740 BitStream!1740) Unit!3066)

(assert (=> b!43099 (= lt!65009 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2208 lt!65007) (_2!2208 lt!65006)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1740 array!2208 (_ BitVec 64) (_ BitVec 64)) tuple2!4230)

(assert (=> b!43099 (= lt!65006 (appendBitsMSBFirstLoop!0 (_2!2208 lt!65007) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!43099 e!28802))

(declare-fun res!36613 () Bool)

(assert (=> b!43099 (=> (not res!36613) (not e!28802))))

(assert (=> b!43099 (= res!36613 (validate_offset_bits!1 ((_ sign_extend 32) (size!998 (buf!1332 (_2!2208 lt!65007)))) ((_ sign_extend 32) (currentByte!2798 thiss!1379)) ((_ sign_extend 32) (currentBit!2793 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!65004 () Unit!3066)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1740 array!2208 (_ BitVec 64)) Unit!3066)

(assert (=> b!43099 (= lt!65004 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1332 (_2!2208 lt!65007)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1740 BitStream!1740) tuple2!4232)

(assert (=> b!43099 (= lt!65010 (reader!0 thiss!1379 (_2!2208 lt!65007)))))

(declare-fun res!36614 () Bool)

(assert (=> start!8644 (=> (not res!36614) (not e!28803))))

(assert (=> start!8644 (= res!36614 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!998 srcBuffer!2))))))))

(assert (=> start!8644 e!28803))

(assert (=> start!8644 true))

(assert (=> start!8644 (array_inv!923 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1740) Bool)

(assert (=> start!8644 (and (inv!12 thiss!1379) e!28808)))

(assert (= (and start!8644 res!36614) b!43093))

(assert (= (and b!43093 res!36616) b!43096))

(assert (= (and b!43096 (not res!36618)) b!43098))

(assert (= (and b!43098 (not res!36617)) b!43099))

(assert (= (and b!43099 res!36613) b!43095))

(assert (= (and b!43099 (not res!36615)) b!43094))

(assert (= start!8644 b!43097))

(declare-fun m!65503 () Bool)

(assert (=> b!43098 m!65503))

(declare-fun m!65505 () Bool)

(assert (=> b!43098 m!65505))

(declare-fun m!65507 () Bool)

(assert (=> b!43098 m!65507))

(declare-fun m!65509 () Bool)

(assert (=> b!43098 m!65509))

(assert (=> b!43098 m!65505))

(declare-fun m!65511 () Bool)

(assert (=> b!43098 m!65511))

(declare-fun m!65513 () Bool)

(assert (=> b!43096 m!65513))

(declare-fun m!65515 () Bool)

(assert (=> b!43096 m!65515))

(declare-fun m!65517 () Bool)

(assert (=> b!43096 m!65517))

(declare-fun m!65519 () Bool)

(assert (=> start!8644 m!65519))

(declare-fun m!65521 () Bool)

(assert (=> start!8644 m!65521))

(declare-fun m!65523 () Bool)

(assert (=> b!43097 m!65523))

(declare-fun m!65525 () Bool)

(assert (=> b!43093 m!65525))

(declare-fun m!65527 () Bool)

(assert (=> b!43095 m!65527))

(assert (=> b!43095 m!65527))

(declare-fun m!65529 () Bool)

(assert (=> b!43095 m!65529))

(declare-fun m!65531 () Bool)

(assert (=> b!43095 m!65531))

(assert (=> b!43095 m!65531))

(declare-fun m!65533 () Bool)

(assert (=> b!43095 m!65533))

(declare-fun m!65535 () Bool)

(assert (=> b!43094 m!65535))

(declare-fun m!65537 () Bool)

(assert (=> b!43099 m!65537))

(declare-fun m!65539 () Bool)

(assert (=> b!43099 m!65539))

(declare-fun m!65541 () Bool)

(assert (=> b!43099 m!65541))

(declare-fun m!65543 () Bool)

(assert (=> b!43099 m!65543))

(declare-fun m!65545 () Bool)

(assert (=> b!43099 m!65545))

(declare-fun m!65547 () Bool)

(assert (=> b!43099 m!65547))

(declare-fun m!65549 () Bool)

(assert (=> b!43099 m!65549))

(check-sat (not b!43096) (not b!43097) (not b!43094) (not b!43093) (not b!43099) (not start!8644) (not b!43098) (not b!43095))
(check-sat)
(get-model)

(declare-fun d!12464 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!12464 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!998 (buf!1332 thiss!1379))) ((_ sign_extend 32) (currentByte!2798 thiss!1379)) ((_ sign_extend 32) (currentBit!2793 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!998 (buf!1332 thiss!1379))) ((_ sign_extend 32) (currentByte!2798 thiss!1379)) ((_ sign_extend 32) (currentBit!2793 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3361 () Bool)

(assert (= bs!3361 d!12464))

(declare-fun m!65599 () Bool)

(assert (=> bs!3361 m!65599))

(assert (=> b!43093 d!12464))

(declare-fun d!12466 () Bool)

(assert (=> d!12466 (validate_offset_bits!1 ((_ sign_extend 32) (size!998 (buf!1332 (_2!2208 lt!65007)))) ((_ sign_extend 32) (currentByte!2798 thiss!1379)) ((_ sign_extend 32) (currentBit!2793 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!65038 () Unit!3066)

(declare-fun choose!9 (BitStream!1740 array!2208 (_ BitVec 64) BitStream!1740) Unit!3066)

(assert (=> d!12466 (= lt!65038 (choose!9 thiss!1379 (buf!1332 (_2!2208 lt!65007)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1741 (buf!1332 (_2!2208 lt!65007)) (currentByte!2798 thiss!1379) (currentBit!2793 thiss!1379))))))

(assert (=> d!12466 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1332 (_2!2208 lt!65007)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!65038)))

(declare-fun bs!3362 () Bool)

(assert (= bs!3362 d!12466))

(assert (=> bs!3362 m!65541))

(declare-fun m!65601 () Bool)

(assert (=> bs!3362 m!65601))

(assert (=> b!43099 d!12466))

(declare-fun d!12468 () Bool)

(assert (=> d!12468 (isPrefixOf!0 thiss!1379 (_2!2208 lt!65006))))

(declare-fun lt!65041 () Unit!3066)

(declare-fun choose!30 (BitStream!1740 BitStream!1740 BitStream!1740) Unit!3066)

(assert (=> d!12468 (= lt!65041 (choose!30 thiss!1379 (_2!2208 lt!65007) (_2!2208 lt!65006)))))

(assert (=> d!12468 (isPrefixOf!0 thiss!1379 (_2!2208 lt!65007))))

(assert (=> d!12468 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2208 lt!65007) (_2!2208 lt!65006)) lt!65041)))

(declare-fun bs!3363 () Bool)

(assert (= bs!3363 d!12468))

(assert (=> bs!3363 m!65537))

(declare-fun m!65603 () Bool)

(assert (=> bs!3363 m!65603))

(assert (=> bs!3363 m!65509))

(assert (=> b!43099 d!12468))

(declare-fun d!12470 () Bool)

(assert (=> d!12470 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!998 (buf!1332 (_2!2208 lt!65007)))) ((_ sign_extend 32) (currentByte!2798 thiss!1379)) ((_ sign_extend 32) (currentBit!2793 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!998 (buf!1332 (_2!2208 lt!65007)))) ((_ sign_extend 32) (currentByte!2798 thiss!1379)) ((_ sign_extend 32) (currentBit!2793 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!3364 () Bool)

(assert (= bs!3364 d!12470))

(declare-fun m!65605 () Bool)

(assert (=> bs!3364 m!65605))

(assert (=> b!43099 d!12470))

(declare-fun b!43131 () Bool)

(declare-fun e!28838 () Unit!3066)

(declare-fun lt!65098 () Unit!3066)

(assert (=> b!43131 (= e!28838 lt!65098)))

(declare-fun lt!65091 () (_ BitVec 64))

(assert (=> b!43131 (= lt!65091 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65086 () (_ BitVec 64))

(assert (=> b!43131 (= lt!65086 (bitIndex!0 (size!998 (buf!1332 thiss!1379)) (currentByte!2798 thiss!1379) (currentBit!2793 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2208 array!2208 (_ BitVec 64) (_ BitVec 64)) Unit!3066)

(assert (=> b!43131 (= lt!65098 (arrayBitRangesEqSymmetric!0 (buf!1332 thiss!1379) (buf!1332 (_2!2208 lt!65007)) lt!65091 lt!65086))))

(declare-fun arrayBitRangesEq!0 (array!2208 array!2208 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!43131 (arrayBitRangesEq!0 (buf!1332 (_2!2208 lt!65007)) (buf!1332 thiss!1379) lt!65091 lt!65086)))

(declare-fun b!43132 () Bool)

(declare-fun res!36645 () Bool)

(declare-fun e!28837 () Bool)

(assert (=> b!43132 (=> (not res!36645) (not e!28837))))

(declare-fun lt!65090 () tuple2!4232)

(assert (=> b!43132 (= res!36645 (isPrefixOf!0 (_2!2209 lt!65090) (_2!2208 lt!65007)))))

(declare-fun b!43133 () Bool)

(declare-fun Unit!3070 () Unit!3066)

(assert (=> b!43133 (= e!28838 Unit!3070)))

(declare-fun b!43134 () Bool)

(declare-fun res!36644 () Bool)

(assert (=> b!43134 (=> (not res!36644) (not e!28837))))

(assert (=> b!43134 (= res!36644 (isPrefixOf!0 (_1!2209 lt!65090) thiss!1379))))

(declare-fun lt!65092 () (_ BitVec 64))

(declare-fun lt!65084 () (_ BitVec 64))

(declare-fun b!43135 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!1740 (_ BitVec 64)) BitStream!1740)

(assert (=> b!43135 (= e!28837 (= (_1!2209 lt!65090) (withMovedBitIndex!0 (_2!2209 lt!65090) (bvsub lt!65092 lt!65084))))))

(assert (=> b!43135 (or (= (bvand lt!65092 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!65084 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!65092 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!65092 lt!65084) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!43135 (= lt!65084 (bitIndex!0 (size!998 (buf!1332 (_2!2208 lt!65007))) (currentByte!2798 (_2!2208 lt!65007)) (currentBit!2793 (_2!2208 lt!65007))))))

(assert (=> b!43135 (= lt!65092 (bitIndex!0 (size!998 (buf!1332 thiss!1379)) (currentByte!2798 thiss!1379) (currentBit!2793 thiss!1379)))))

(declare-fun d!12472 () Bool)

(assert (=> d!12472 e!28837))

(declare-fun res!36643 () Bool)

(assert (=> d!12472 (=> (not res!36643) (not e!28837))))

(assert (=> d!12472 (= res!36643 (isPrefixOf!0 (_1!2209 lt!65090) (_2!2209 lt!65090)))))

(declare-fun lt!65083 () BitStream!1740)

(assert (=> d!12472 (= lt!65090 (tuple2!4233 lt!65083 (_2!2208 lt!65007)))))

(declare-fun lt!65097 () Unit!3066)

(declare-fun lt!65099 () Unit!3066)

(assert (=> d!12472 (= lt!65097 lt!65099)))

(assert (=> d!12472 (isPrefixOf!0 lt!65083 (_2!2208 lt!65007))))

(assert (=> d!12472 (= lt!65099 (lemmaIsPrefixTransitive!0 lt!65083 (_2!2208 lt!65007) (_2!2208 lt!65007)))))

(declare-fun lt!65096 () Unit!3066)

(declare-fun lt!65088 () Unit!3066)

(assert (=> d!12472 (= lt!65096 lt!65088)))

(assert (=> d!12472 (isPrefixOf!0 lt!65083 (_2!2208 lt!65007))))

(assert (=> d!12472 (= lt!65088 (lemmaIsPrefixTransitive!0 lt!65083 thiss!1379 (_2!2208 lt!65007)))))

(declare-fun lt!65093 () Unit!3066)

(assert (=> d!12472 (= lt!65093 e!28838)))

(declare-fun c!2826 () Bool)

(assert (=> d!12472 (= c!2826 (not (= (size!998 (buf!1332 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!65094 () Unit!3066)

(declare-fun lt!65089 () Unit!3066)

(assert (=> d!12472 (= lt!65094 lt!65089)))

(assert (=> d!12472 (isPrefixOf!0 (_2!2208 lt!65007) (_2!2208 lt!65007))))

(assert (=> d!12472 (= lt!65089 (lemmaIsPrefixRefl!0 (_2!2208 lt!65007)))))

(declare-fun lt!65082 () Unit!3066)

(declare-fun lt!65085 () Unit!3066)

(assert (=> d!12472 (= lt!65082 lt!65085)))

(assert (=> d!12472 (= lt!65085 (lemmaIsPrefixRefl!0 (_2!2208 lt!65007)))))

(declare-fun lt!65095 () Unit!3066)

(declare-fun lt!65087 () Unit!3066)

(assert (=> d!12472 (= lt!65095 lt!65087)))

(assert (=> d!12472 (isPrefixOf!0 lt!65083 lt!65083)))

(assert (=> d!12472 (= lt!65087 (lemmaIsPrefixRefl!0 lt!65083))))

(declare-fun lt!65100 () Unit!3066)

(declare-fun lt!65101 () Unit!3066)

(assert (=> d!12472 (= lt!65100 lt!65101)))

(assert (=> d!12472 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!12472 (= lt!65101 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!12472 (= lt!65083 (BitStream!1741 (buf!1332 (_2!2208 lt!65007)) (currentByte!2798 thiss!1379) (currentBit!2793 thiss!1379)))))

(assert (=> d!12472 (isPrefixOf!0 thiss!1379 (_2!2208 lt!65007))))

(assert (=> d!12472 (= (reader!0 thiss!1379 (_2!2208 lt!65007)) lt!65090)))

(assert (= (and d!12472 c!2826) b!43131))

(assert (= (and d!12472 (not c!2826)) b!43133))

(assert (= (and d!12472 res!36643) b!43134))

(assert (= (and b!43134 res!36644) b!43132))

(assert (= (and b!43132 res!36645) b!43135))

(declare-fun m!65609 () Bool)

(assert (=> d!12472 m!65609))

(declare-fun m!65611 () Bool)

(assert (=> d!12472 m!65611))

(declare-fun m!65613 () Bool)

(assert (=> d!12472 m!65613))

(declare-fun m!65615 () Bool)

(assert (=> d!12472 m!65615))

(declare-fun m!65617 () Bool)

(assert (=> d!12472 m!65617))

(assert (=> d!12472 m!65509))

(assert (=> d!12472 m!65513))

(declare-fun m!65619 () Bool)

(assert (=> d!12472 m!65619))

(declare-fun m!65621 () Bool)

(assert (=> d!12472 m!65621))

(assert (=> d!12472 m!65515))

(declare-fun m!65623 () Bool)

(assert (=> d!12472 m!65623))

(assert (=> b!43131 m!65517))

(declare-fun m!65625 () Bool)

(assert (=> b!43131 m!65625))

(declare-fun m!65627 () Bool)

(assert (=> b!43131 m!65627))

(declare-fun m!65629 () Bool)

(assert (=> b!43134 m!65629))

(declare-fun m!65631 () Bool)

(assert (=> b!43132 m!65631))

(declare-fun m!65633 () Bool)

(assert (=> b!43135 m!65633))

(declare-fun m!65635 () Bool)

(assert (=> b!43135 m!65635))

(assert (=> b!43135 m!65517))

(assert (=> b!43099 d!12472))

(declare-fun e!28900 () Bool)

(declare-fun b!43251 () Bool)

(declare-fun lt!65337 () tuple2!4232)

(declare-fun lt!65361 () tuple2!4230)

(assert (=> b!43251 (= e!28900 (= (bitStreamReadBitsIntoList!0 (_2!2208 lt!65361) (_1!2209 lt!65337) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2208 lt!65361) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!43251 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!43251 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!65357 () Unit!3066)

(declare-fun lt!65362 () Unit!3066)

(assert (=> b!43251 (= lt!65357 lt!65362)))

(declare-fun lt!65335 () (_ BitVec 64))

(assert (=> b!43251 (validate_offset_bits!1 ((_ sign_extend 32) (size!998 (buf!1332 (_2!2208 lt!65361)))) ((_ sign_extend 32) (currentByte!2798 (_2!2208 lt!65007))) ((_ sign_extend 32) (currentBit!2793 (_2!2208 lt!65007))) lt!65335)))

(assert (=> b!43251 (= lt!65362 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2208 lt!65007) (buf!1332 (_2!2208 lt!65361)) lt!65335))))

(declare-fun e!28899 () Bool)

(assert (=> b!43251 e!28899))

(declare-fun res!36732 () Bool)

(assert (=> b!43251 (=> (not res!36732) (not e!28899))))

(assert (=> b!43251 (= res!36732 (and (= (size!998 (buf!1332 (_2!2208 lt!65007))) (size!998 (buf!1332 (_2!2208 lt!65361)))) (bvsge lt!65335 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!43251 (= lt!65335 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!43251 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!43251 (= lt!65337 (reader!0 (_2!2208 lt!65007) (_2!2208 lt!65361)))))

(declare-fun b!43252 () Bool)

(declare-fun e!28901 () tuple2!4230)

(declare-fun Unit!3071 () Unit!3066)

(assert (=> b!43252 (= e!28901 (tuple2!4231 Unit!3071 (_2!2208 lt!65007)))))

(assert (=> b!43252 (= (size!998 (buf!1332 (_2!2208 lt!65007))) (size!998 (buf!1332 (_2!2208 lt!65007))))))

(declare-fun lt!65364 () Unit!3066)

(declare-fun Unit!3072 () Unit!3066)

(assert (=> b!43252 (= lt!65364 Unit!3072)))

(declare-fun call!502 () tuple2!4232)

(declare-fun checkByteArrayBitContent!0 (BitStream!1740 array!2208 array!2208 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!4238 0))(
  ( (tuple2!4239 (_1!2212 array!2208) (_2!2212 BitStream!1740)) )
))
(declare-fun readBits!0 (BitStream!1740 (_ BitVec 64)) tuple2!4238)

(assert (=> b!43252 (checkByteArrayBitContent!0 (_2!2208 lt!65007) srcBuffer!2 (_1!2212 (readBits!0 (_1!2209 call!502) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!43253 () Bool)

(declare-fun res!36734 () Bool)

(assert (=> b!43253 (=> (not res!36734) (not e!28900))))

(assert (=> b!43253 (= res!36734 (isPrefixOf!0 (_2!2208 lt!65007) (_2!2208 lt!65361)))))

(declare-fun b!43254 () Bool)

(assert (=> b!43254 (= e!28899 (validate_offset_bits!1 ((_ sign_extend 32) (size!998 (buf!1332 (_2!2208 lt!65007)))) ((_ sign_extend 32) (currentByte!2798 (_2!2208 lt!65007))) ((_ sign_extend 32) (currentBit!2793 (_2!2208 lt!65007))) lt!65335))))

(declare-fun d!12478 () Bool)

(assert (=> d!12478 e!28900))

(declare-fun res!36735 () Bool)

(assert (=> d!12478 (=> (not res!36735) (not e!28900))))

(declare-fun lt!65369 () (_ BitVec 64))

(assert (=> d!12478 (= res!36735 (= (bitIndex!0 (size!998 (buf!1332 (_2!2208 lt!65361))) (currentByte!2798 (_2!2208 lt!65361)) (currentBit!2793 (_2!2208 lt!65361))) (bvsub lt!65369 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!12478 (or (= (bvand lt!65369 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!65369 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!65369 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!65334 () (_ BitVec 64))

(assert (=> d!12478 (= lt!65369 (bvadd lt!65334 to!314))))

(assert (=> d!12478 (or (not (= (bvand lt!65334 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!65334 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!65334 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!12478 (= lt!65334 (bitIndex!0 (size!998 (buf!1332 (_2!2208 lt!65007))) (currentByte!2798 (_2!2208 lt!65007)) (currentBit!2793 (_2!2208 lt!65007))))))

(assert (=> d!12478 (= lt!65361 e!28901)))

(declare-fun c!2841 () Bool)

(assert (=> d!12478 (= c!2841 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!65340 () Unit!3066)

(declare-fun lt!65333 () Unit!3066)

(assert (=> d!12478 (= lt!65340 lt!65333)))

(assert (=> d!12478 (isPrefixOf!0 (_2!2208 lt!65007) (_2!2208 lt!65007))))

(assert (=> d!12478 (= lt!65333 (lemmaIsPrefixRefl!0 (_2!2208 lt!65007)))))

(declare-fun lt!65338 () (_ BitVec 64))

(assert (=> d!12478 (= lt!65338 (bitIndex!0 (size!998 (buf!1332 (_2!2208 lt!65007))) (currentByte!2798 (_2!2208 lt!65007)) (currentBit!2793 (_2!2208 lt!65007))))))

(assert (=> d!12478 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!12478 (= (appendBitsMSBFirstLoop!0 (_2!2208 lt!65007) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!65361)))

(declare-fun b!43255 () Bool)

(declare-fun res!36737 () Bool)

(assert (=> b!43255 (=> (not res!36737) (not e!28900))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!43255 (= res!36737 (invariant!0 (currentBit!2793 (_2!2208 lt!65361)) (currentByte!2798 (_2!2208 lt!65361)) (size!998 (buf!1332 (_2!2208 lt!65361)))))))

(declare-fun b!43256 () Bool)

(declare-fun res!36736 () Bool)

(assert (=> b!43256 (=> (not res!36736) (not e!28900))))

(assert (=> b!43256 (= res!36736 (= (size!998 (buf!1332 (_2!2208 lt!65007))) (size!998 (buf!1332 (_2!2208 lt!65361)))))))

(declare-fun lt!65370 () tuple2!4230)

(declare-fun bm!499 () Bool)

(declare-fun lt!65347 () tuple2!4230)

(assert (=> bm!499 (= call!502 (reader!0 (ite c!2841 (_2!2208 lt!65370) (_2!2208 lt!65007)) (ite c!2841 (_2!2208 lt!65347) (_2!2208 lt!65007))))))

(declare-fun b!43257 () Bool)

(declare-fun res!36733 () Bool)

(assert (=> b!43257 (=> (not res!36733) (not e!28900))))

(assert (=> b!43257 (= res!36733 (= (size!998 (buf!1332 (_2!2208 lt!65361))) (size!998 (buf!1332 (_2!2208 lt!65007)))))))

(declare-fun b!43258 () Bool)

(declare-fun Unit!3073 () Unit!3066)

(assert (=> b!43258 (= e!28901 (tuple2!4231 Unit!3073 (_2!2208 lt!65347)))))

(assert (=> b!43258 (= lt!65370 (appendBitFromByte!0 (_2!2208 lt!65007) (select (arr!1500 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!65372 () (_ BitVec 64))

(assert (=> b!43258 (= lt!65372 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!65351 () (_ BitVec 64))

(assert (=> b!43258 (= lt!65351 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!65366 () Unit!3066)

(assert (=> b!43258 (= lt!65366 (validateOffsetBitsIneqLemma!0 (_2!2208 lt!65007) (_2!2208 lt!65370) lt!65372 lt!65351))))

(assert (=> b!43258 (validate_offset_bits!1 ((_ sign_extend 32) (size!998 (buf!1332 (_2!2208 lt!65370)))) ((_ sign_extend 32) (currentByte!2798 (_2!2208 lt!65370))) ((_ sign_extend 32) (currentBit!2793 (_2!2208 lt!65370))) (bvsub lt!65372 lt!65351))))

(declare-fun lt!65359 () Unit!3066)

(assert (=> b!43258 (= lt!65359 lt!65366)))

(declare-fun lt!65363 () tuple2!4232)

(assert (=> b!43258 (= lt!65363 (reader!0 (_2!2208 lt!65007) (_2!2208 lt!65370)))))

(declare-fun lt!65373 () (_ BitVec 64))

(assert (=> b!43258 (= lt!65373 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!65345 () Unit!3066)

(assert (=> b!43258 (= lt!65345 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2208 lt!65007) (buf!1332 (_2!2208 lt!65370)) lt!65373))))

(assert (=> b!43258 (validate_offset_bits!1 ((_ sign_extend 32) (size!998 (buf!1332 (_2!2208 lt!65370)))) ((_ sign_extend 32) (currentByte!2798 (_2!2208 lt!65007))) ((_ sign_extend 32) (currentBit!2793 (_2!2208 lt!65007))) lt!65373)))

(declare-fun lt!65353 () Unit!3066)

(assert (=> b!43258 (= lt!65353 lt!65345)))

(assert (=> b!43258 (= (head!330 (byteArrayBitContentToList!0 (_2!2208 lt!65370) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!330 (bitStreamReadBitsIntoList!0 (_2!2208 lt!65370) (_1!2209 lt!65363) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!65331 () Unit!3066)

(declare-fun Unit!3074 () Unit!3066)

(assert (=> b!43258 (= lt!65331 Unit!3074)))

(assert (=> b!43258 (= lt!65347 (appendBitsMSBFirstLoop!0 (_2!2208 lt!65370) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!65332 () Unit!3066)

(assert (=> b!43258 (= lt!65332 (lemmaIsPrefixTransitive!0 (_2!2208 lt!65007) (_2!2208 lt!65370) (_2!2208 lt!65347)))))

(assert (=> b!43258 (isPrefixOf!0 (_2!2208 lt!65007) (_2!2208 lt!65347))))

(declare-fun lt!65368 () Unit!3066)

(assert (=> b!43258 (= lt!65368 lt!65332)))

(assert (=> b!43258 (= (size!998 (buf!1332 (_2!2208 lt!65347))) (size!998 (buf!1332 (_2!2208 lt!65007))))))

(declare-fun lt!65349 () Unit!3066)

(declare-fun Unit!3075 () Unit!3066)

(assert (=> b!43258 (= lt!65349 Unit!3075)))

(assert (=> b!43258 (= (bitIndex!0 (size!998 (buf!1332 (_2!2208 lt!65347))) (currentByte!2798 (_2!2208 lt!65347)) (currentBit!2793 (_2!2208 lt!65347))) (bvsub (bvadd (bitIndex!0 (size!998 (buf!1332 (_2!2208 lt!65007))) (currentByte!2798 (_2!2208 lt!65007)) (currentBit!2793 (_2!2208 lt!65007))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!65341 () Unit!3066)

(declare-fun Unit!3076 () Unit!3066)

(assert (=> b!43258 (= lt!65341 Unit!3076)))

(assert (=> b!43258 (= (bitIndex!0 (size!998 (buf!1332 (_2!2208 lt!65347))) (currentByte!2798 (_2!2208 lt!65347)) (currentBit!2793 (_2!2208 lt!65347))) (bvsub (bvsub (bvadd (bitIndex!0 (size!998 (buf!1332 (_2!2208 lt!65370))) (currentByte!2798 (_2!2208 lt!65370)) (currentBit!2793 (_2!2208 lt!65370))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!65342 () Unit!3066)

(declare-fun Unit!3077 () Unit!3066)

(assert (=> b!43258 (= lt!65342 Unit!3077)))

(declare-fun lt!65354 () tuple2!4232)

(assert (=> b!43258 (= lt!65354 (reader!0 (_2!2208 lt!65007) (_2!2208 lt!65347)))))

(declare-fun lt!65365 () (_ BitVec 64))

(assert (=> b!43258 (= lt!65365 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!65348 () Unit!3066)

(assert (=> b!43258 (= lt!65348 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2208 lt!65007) (buf!1332 (_2!2208 lt!65347)) lt!65365))))

(assert (=> b!43258 (validate_offset_bits!1 ((_ sign_extend 32) (size!998 (buf!1332 (_2!2208 lt!65347)))) ((_ sign_extend 32) (currentByte!2798 (_2!2208 lt!65007))) ((_ sign_extend 32) (currentBit!2793 (_2!2208 lt!65007))) lt!65365)))

(declare-fun lt!65356 () Unit!3066)

(assert (=> b!43258 (= lt!65356 lt!65348)))

(declare-fun lt!65355 () tuple2!4232)

(assert (=> b!43258 (= lt!65355 call!502)))

(declare-fun lt!65346 () (_ BitVec 64))

(assert (=> b!43258 (= lt!65346 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!65358 () Unit!3066)

(assert (=> b!43258 (= lt!65358 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2208 lt!65370) (buf!1332 (_2!2208 lt!65347)) lt!65346))))

(assert (=> b!43258 (validate_offset_bits!1 ((_ sign_extend 32) (size!998 (buf!1332 (_2!2208 lt!65347)))) ((_ sign_extend 32) (currentByte!2798 (_2!2208 lt!65370))) ((_ sign_extend 32) (currentBit!2793 (_2!2208 lt!65370))) lt!65346)))

(declare-fun lt!65350 () Unit!3066)

(assert (=> b!43258 (= lt!65350 lt!65358)))

(declare-fun lt!65339 () List!511)

(assert (=> b!43258 (= lt!65339 (byteArrayBitContentToList!0 (_2!2208 lt!65347) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!65374 () List!511)

(assert (=> b!43258 (= lt!65374 (byteArrayBitContentToList!0 (_2!2208 lt!65347) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!65344 () List!511)

(assert (=> b!43258 (= lt!65344 (bitStreamReadBitsIntoList!0 (_2!2208 lt!65347) (_1!2209 lt!65354) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!65367 () List!511)

(assert (=> b!43258 (= lt!65367 (bitStreamReadBitsIntoList!0 (_2!2208 lt!65347) (_1!2209 lt!65355) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!65336 () (_ BitVec 64))

(assert (=> b!43258 (= lt!65336 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!65343 () Unit!3066)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1740 BitStream!1740 BitStream!1740 BitStream!1740 (_ BitVec 64) List!511) Unit!3066)

(assert (=> b!43258 (= lt!65343 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2208 lt!65347) (_2!2208 lt!65347) (_1!2209 lt!65354) (_1!2209 lt!65355) lt!65336 lt!65344))))

(declare-fun tail!205 (List!511) List!511)

(assert (=> b!43258 (= (bitStreamReadBitsIntoList!0 (_2!2208 lt!65347) (_1!2209 lt!65355) (bvsub lt!65336 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!205 lt!65344))))

(declare-fun lt!65352 () Unit!3066)

(assert (=> b!43258 (= lt!65352 lt!65343)))

(declare-fun lt!65360 () Unit!3066)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2208 array!2208 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3066)

(assert (=> b!43258 (= lt!65360 (arrayBitRangesEqImpliesEq!0 (buf!1332 (_2!2208 lt!65370)) (buf!1332 (_2!2208 lt!65347)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!65338 (bitIndex!0 (size!998 (buf!1332 (_2!2208 lt!65370))) (currentByte!2798 (_2!2208 lt!65370)) (currentBit!2793 (_2!2208 lt!65370)))))))

(declare-fun bitAt!0 (array!2208 (_ BitVec 64)) Bool)

(assert (=> b!43258 (= (bitAt!0 (buf!1332 (_2!2208 lt!65370)) lt!65338) (bitAt!0 (buf!1332 (_2!2208 lt!65347)) lt!65338))))

(declare-fun lt!65371 () Unit!3066)

(assert (=> b!43258 (= lt!65371 lt!65360)))

(assert (= (and d!12478 c!2841) b!43258))

(assert (= (and d!12478 (not c!2841)) b!43252))

(assert (= (or b!43258 b!43252) bm!499))

(assert (= (and d!12478 res!36735) b!43255))

(assert (= (and b!43255 res!36737) b!43256))

(assert (= (and b!43256 res!36736) b!43253))

(assert (= (and b!43253 res!36734) b!43257))

(assert (= (and b!43257 res!36733) b!43251))

(assert (= (and b!43251 res!36732) b!43254))

(declare-fun m!65737 () Bool)

(assert (=> b!43255 m!65737))

(declare-fun m!65739 () Bool)

(assert (=> b!43254 m!65739))

(declare-fun m!65741 () Bool)

(assert (=> b!43252 m!65741))

(declare-fun m!65743 () Bool)

(assert (=> b!43252 m!65743))

(declare-fun m!65745 () Bool)

(assert (=> b!43253 m!65745))

(declare-fun m!65747 () Bool)

(assert (=> bm!499 m!65747))

(declare-fun m!65749 () Bool)

(assert (=> b!43258 m!65749))

(declare-fun m!65751 () Bool)

(assert (=> b!43258 m!65751))

(declare-fun m!65753 () Bool)

(assert (=> b!43258 m!65753))

(declare-fun m!65755 () Bool)

(assert (=> b!43258 m!65755))

(declare-fun m!65757 () Bool)

(assert (=> b!43258 m!65757))

(declare-fun m!65759 () Bool)

(assert (=> b!43258 m!65759))

(declare-fun m!65761 () Bool)

(assert (=> b!43258 m!65761))

(declare-fun m!65763 () Bool)

(assert (=> b!43258 m!65763))

(declare-fun m!65765 () Bool)

(assert (=> b!43258 m!65765))

(declare-fun m!65767 () Bool)

(assert (=> b!43258 m!65767))

(declare-fun m!65769 () Bool)

(assert (=> b!43258 m!65769))

(declare-fun m!65771 () Bool)

(assert (=> b!43258 m!65771))

(declare-fun m!65773 () Bool)

(assert (=> b!43258 m!65773))

(declare-fun m!65775 () Bool)

(assert (=> b!43258 m!65775))

(declare-fun m!65777 () Bool)

(assert (=> b!43258 m!65777))

(declare-fun m!65779 () Bool)

(assert (=> b!43258 m!65779))

(assert (=> b!43258 m!65757))

(declare-fun m!65781 () Bool)

(assert (=> b!43258 m!65781))

(assert (=> b!43258 m!65751))

(declare-fun m!65783 () Bool)

(assert (=> b!43258 m!65783))

(declare-fun m!65785 () Bool)

(assert (=> b!43258 m!65785))

(assert (=> b!43258 m!65635))

(declare-fun m!65787 () Bool)

(assert (=> b!43258 m!65787))

(declare-fun m!65789 () Bool)

(assert (=> b!43258 m!65789))

(declare-fun m!65791 () Bool)

(assert (=> b!43258 m!65791))

(declare-fun m!65793 () Bool)

(assert (=> b!43258 m!65793))

(assert (=> b!43258 m!65775))

(declare-fun m!65795 () Bool)

(assert (=> b!43258 m!65795))

(assert (=> b!43258 m!65755))

(declare-fun m!65797 () Bool)

(assert (=> b!43258 m!65797))

(declare-fun m!65799 () Bool)

(assert (=> b!43258 m!65799))

(declare-fun m!65801 () Bool)

(assert (=> b!43258 m!65801))

(declare-fun m!65803 () Bool)

(assert (=> b!43258 m!65803))

(declare-fun m!65805 () Bool)

(assert (=> b!43258 m!65805))

(declare-fun m!65807 () Bool)

(assert (=> b!43258 m!65807))

(declare-fun m!65809 () Bool)

(assert (=> b!43258 m!65809))

(declare-fun m!65811 () Bool)

(assert (=> b!43251 m!65811))

(declare-fun m!65813 () Bool)

(assert (=> b!43251 m!65813))

(declare-fun m!65815 () Bool)

(assert (=> b!43251 m!65815))

(declare-fun m!65817 () Bool)

(assert (=> b!43251 m!65817))

(declare-fun m!65819 () Bool)

(assert (=> b!43251 m!65819))

(declare-fun m!65821 () Bool)

(assert (=> d!12478 m!65821))

(assert (=> d!12478 m!65635))

(assert (=> d!12478 m!65609))

(assert (=> d!12478 m!65619))

(assert (=> b!43099 d!12478))

(declare-fun d!12530 () Bool)

(declare-fun res!36745 () Bool)

(declare-fun e!28906 () Bool)

(assert (=> d!12530 (=> (not res!36745) (not e!28906))))

(assert (=> d!12530 (= res!36745 (= (size!998 (buf!1332 thiss!1379)) (size!998 (buf!1332 (_2!2208 lt!65006)))))))

(assert (=> d!12530 (= (isPrefixOf!0 thiss!1379 (_2!2208 lt!65006)) e!28906)))

(declare-fun b!43265 () Bool)

(declare-fun res!36746 () Bool)

(assert (=> b!43265 (=> (not res!36746) (not e!28906))))

(assert (=> b!43265 (= res!36746 (bvsle (bitIndex!0 (size!998 (buf!1332 thiss!1379)) (currentByte!2798 thiss!1379) (currentBit!2793 thiss!1379)) (bitIndex!0 (size!998 (buf!1332 (_2!2208 lt!65006))) (currentByte!2798 (_2!2208 lt!65006)) (currentBit!2793 (_2!2208 lt!65006)))))))

(declare-fun b!43266 () Bool)

(declare-fun e!28907 () Bool)

(assert (=> b!43266 (= e!28906 e!28907)))

(declare-fun res!36744 () Bool)

(assert (=> b!43266 (=> res!36744 e!28907)))

(assert (=> b!43266 (= res!36744 (= (size!998 (buf!1332 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!43267 () Bool)

(assert (=> b!43267 (= e!28907 (arrayBitRangesEq!0 (buf!1332 thiss!1379) (buf!1332 (_2!2208 lt!65006)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!998 (buf!1332 thiss!1379)) (currentByte!2798 thiss!1379) (currentBit!2793 thiss!1379))))))

(assert (= (and d!12530 res!36745) b!43265))

(assert (= (and b!43265 res!36746) b!43266))

(assert (= (and b!43266 (not res!36744)) b!43267))

(assert (=> b!43265 m!65517))

(assert (=> b!43265 m!65535))

(assert (=> b!43267 m!65517))

(assert (=> b!43267 m!65517))

(declare-fun m!65823 () Bool)

(assert (=> b!43267 m!65823))

(assert (=> b!43099 d!12530))

(declare-fun d!12532 () Bool)

(declare-fun res!36748 () Bool)

(declare-fun e!28908 () Bool)

(assert (=> d!12532 (=> (not res!36748) (not e!28908))))

(assert (=> d!12532 (= res!36748 (= (size!998 (buf!1332 (_2!2208 lt!65007))) (size!998 (buf!1332 (_2!2208 lt!65006)))))))

(assert (=> d!12532 (= (isPrefixOf!0 (_2!2208 lt!65007) (_2!2208 lt!65006)) e!28908)))

(declare-fun b!43268 () Bool)

(declare-fun res!36749 () Bool)

(assert (=> b!43268 (=> (not res!36749) (not e!28908))))

(assert (=> b!43268 (= res!36749 (bvsle (bitIndex!0 (size!998 (buf!1332 (_2!2208 lt!65007))) (currentByte!2798 (_2!2208 lt!65007)) (currentBit!2793 (_2!2208 lt!65007))) (bitIndex!0 (size!998 (buf!1332 (_2!2208 lt!65006))) (currentByte!2798 (_2!2208 lt!65006)) (currentBit!2793 (_2!2208 lt!65006)))))))

(declare-fun b!43269 () Bool)

(declare-fun e!28909 () Bool)

(assert (=> b!43269 (= e!28908 e!28909)))

(declare-fun res!36747 () Bool)

(assert (=> b!43269 (=> res!36747 e!28909)))

(assert (=> b!43269 (= res!36747 (= (size!998 (buf!1332 (_2!2208 lt!65007))) #b00000000000000000000000000000000))))

(declare-fun b!43270 () Bool)

(assert (=> b!43270 (= e!28909 (arrayBitRangesEq!0 (buf!1332 (_2!2208 lt!65007)) (buf!1332 (_2!2208 lt!65006)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!998 (buf!1332 (_2!2208 lt!65007))) (currentByte!2798 (_2!2208 lt!65007)) (currentBit!2793 (_2!2208 lt!65007)))))))

(assert (= (and d!12532 res!36748) b!43268))

(assert (= (and b!43268 res!36749) b!43269))

(assert (= (and b!43269 (not res!36747)) b!43270))

(assert (=> b!43268 m!65635))

(assert (=> b!43268 m!65535))

(assert (=> b!43270 m!65635))

(assert (=> b!43270 m!65635))

(declare-fun m!65825 () Bool)

(assert (=> b!43270 m!65825))

(assert (=> b!43099 d!12532))

(declare-fun d!12534 () Bool)

(declare-fun e!28914 () Bool)

(assert (=> d!12534 e!28914))

(declare-fun res!36755 () Bool)

(assert (=> d!12534 (=> (not res!36755) (not e!28914))))

(declare-fun lt!65407 () (_ BitVec 64))

(declare-fun lt!65410 () (_ BitVec 64))

(declare-fun lt!65405 () (_ BitVec 64))

(assert (=> d!12534 (= res!36755 (= lt!65410 (bvsub lt!65407 lt!65405)))))

(assert (=> d!12534 (or (= (bvand lt!65407 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!65405 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!65407 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!65407 lt!65405) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!12534 (= lt!65405 (remainingBits!0 ((_ sign_extend 32) (size!998 (buf!1332 (_2!2208 lt!65006)))) ((_ sign_extend 32) (currentByte!2798 (_2!2208 lt!65006))) ((_ sign_extend 32) (currentBit!2793 (_2!2208 lt!65006)))))))

(declare-fun lt!65409 () (_ BitVec 64))

(declare-fun lt!65406 () (_ BitVec 64))

(assert (=> d!12534 (= lt!65407 (bvmul lt!65409 lt!65406))))

(assert (=> d!12534 (or (= lt!65409 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!65406 (bvsdiv (bvmul lt!65409 lt!65406) lt!65409)))))

(assert (=> d!12534 (= lt!65406 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!12534 (= lt!65409 ((_ sign_extend 32) (size!998 (buf!1332 (_2!2208 lt!65006)))))))

(assert (=> d!12534 (= lt!65410 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2798 (_2!2208 lt!65006))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2793 (_2!2208 lt!65006)))))))

(assert (=> d!12534 (invariant!0 (currentBit!2793 (_2!2208 lt!65006)) (currentByte!2798 (_2!2208 lt!65006)) (size!998 (buf!1332 (_2!2208 lt!65006))))))

(assert (=> d!12534 (= (bitIndex!0 (size!998 (buf!1332 (_2!2208 lt!65006))) (currentByte!2798 (_2!2208 lt!65006)) (currentBit!2793 (_2!2208 lt!65006))) lt!65410)))

(declare-fun b!43279 () Bool)

(declare-fun res!36754 () Bool)

(assert (=> b!43279 (=> (not res!36754) (not e!28914))))

(assert (=> b!43279 (= res!36754 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!65410))))

(declare-fun b!43280 () Bool)

(declare-fun lt!65408 () (_ BitVec 64))

(assert (=> b!43280 (= e!28914 (bvsle lt!65410 (bvmul lt!65408 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!43280 (or (= lt!65408 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!65408 #b0000000000000000000000000000000000000000000000000000000000001000) lt!65408)))))

(assert (=> b!43280 (= lt!65408 ((_ sign_extend 32) (size!998 (buf!1332 (_2!2208 lt!65006)))))))

(assert (= (and d!12534 res!36755) b!43279))

(assert (= (and b!43279 res!36754) b!43280))

(declare-fun m!65827 () Bool)

(assert (=> d!12534 m!65827))

(declare-fun m!65829 () Bool)

(assert (=> d!12534 m!65829))

(assert (=> b!43094 d!12534))

(declare-fun d!12536 () Bool)

(assert (=> d!12536 (= (head!330 (byteArrayBitContentToList!0 (_2!2208 lt!65007) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!626 (byteArrayBitContentToList!0 (_2!2208 lt!65007) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!43095 d!12536))

(declare-fun d!12538 () Bool)

(declare-fun c!2846 () Bool)

(assert (=> d!12538 (= c!2846 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!28917 () List!511)

(assert (=> d!12538 (= (byteArrayBitContentToList!0 (_2!2208 lt!65007) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!28917)))

(declare-fun b!43285 () Bool)

(assert (=> b!43285 (= e!28917 Nil!508)))

(declare-fun b!43286 () Bool)

(assert (=> b!43286 (= e!28917 (Cons!507 (not (= (bvand ((_ sign_extend 24) (select (arr!1500 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2208 lt!65007) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!12538 c!2846) b!43285))

(assert (= (and d!12538 (not c!2846)) b!43286))

(assert (=> b!43286 m!65505))

(declare-fun m!65831 () Bool)

(assert (=> b!43286 m!65831))

(declare-fun m!65833 () Bool)

(assert (=> b!43286 m!65833))

(assert (=> b!43095 d!12538))

(declare-fun d!12540 () Bool)

(assert (=> d!12540 (= (head!330 (bitStreamReadBitsIntoList!0 (_2!2208 lt!65007) (_1!2209 lt!65010) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!626 (bitStreamReadBitsIntoList!0 (_2!2208 lt!65007) (_1!2209 lt!65010) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!43095 d!12540))

(declare-fun b!43309 () Bool)

(declare-fun e!28927 () Bool)

(declare-fun lt!65489 () List!511)

(declare-fun isEmpty!116 (List!511) Bool)

(assert (=> b!43309 (= e!28927 (isEmpty!116 lt!65489))))

(declare-fun d!12542 () Bool)

(assert (=> d!12542 e!28927))

(declare-fun c!2852 () Bool)

(assert (=> d!12542 (= c!2852 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!4240 0))(
  ( (tuple2!4241 (_1!2213 List!511) (_2!2213 BitStream!1740)) )
))
(declare-fun e!28926 () tuple2!4240)

(assert (=> d!12542 (= lt!65489 (_1!2213 e!28926))))

(declare-fun c!2851 () Bool)

(assert (=> d!12542 (= c!2851 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!12542 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!12542 (= (bitStreamReadBitsIntoList!0 (_2!2208 lt!65007) (_1!2209 lt!65010) #b0000000000000000000000000000000000000000000000000000000000000001) lt!65489)))

(declare-fun b!43307 () Bool)

(assert (=> b!43307 (= e!28926 (tuple2!4241 Nil!508 (_1!2209 lt!65010)))))

(declare-fun b!43310 () Bool)

(declare-fun length!214 (List!511) Int)

(assert (=> b!43310 (= e!28927 (> (length!214 lt!65489) 0))))

(declare-datatypes ((tuple2!4242 0))(
  ( (tuple2!4243 (_1!2214 Bool) (_2!2214 BitStream!1740)) )
))
(declare-fun lt!65487 () tuple2!4242)

(declare-fun lt!65488 () (_ BitVec 64))

(declare-fun b!43308 () Bool)

(assert (=> b!43308 (= e!28926 (tuple2!4241 (Cons!507 (_1!2214 lt!65487) (bitStreamReadBitsIntoList!0 (_2!2208 lt!65007) (_2!2214 lt!65487) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!65488))) (_2!2214 lt!65487)))))

(declare-fun readBit!0 (BitStream!1740) tuple2!4242)

(assert (=> b!43308 (= lt!65487 (readBit!0 (_1!2209 lt!65010)))))

(assert (=> b!43308 (= lt!65488 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!12542 c!2851) b!43307))

(assert (= (and d!12542 (not c!2851)) b!43308))

(assert (= (and d!12542 c!2852) b!43309))

(assert (= (and d!12542 (not c!2852)) b!43310))

(declare-fun m!65835 () Bool)

(assert (=> b!43309 m!65835))

(declare-fun m!65837 () Bool)

(assert (=> b!43310 m!65837))

(declare-fun m!65839 () Bool)

(assert (=> b!43308 m!65839))

(declare-fun m!65841 () Bool)

(assert (=> b!43308 m!65841))

(assert (=> b!43095 d!12542))

(declare-fun d!12544 () Bool)

(declare-fun res!36769 () Bool)

(declare-fun e!28928 () Bool)

(assert (=> d!12544 (=> (not res!36769) (not e!28928))))

(assert (=> d!12544 (= res!36769 (= (size!998 (buf!1332 thiss!1379)) (size!998 (buf!1332 thiss!1379))))))

(assert (=> d!12544 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!28928)))

(declare-fun b!43311 () Bool)

(declare-fun res!36770 () Bool)

(assert (=> b!43311 (=> (not res!36770) (not e!28928))))

(assert (=> b!43311 (= res!36770 (bvsle (bitIndex!0 (size!998 (buf!1332 thiss!1379)) (currentByte!2798 thiss!1379) (currentBit!2793 thiss!1379)) (bitIndex!0 (size!998 (buf!1332 thiss!1379)) (currentByte!2798 thiss!1379) (currentBit!2793 thiss!1379))))))

(declare-fun b!43312 () Bool)

(declare-fun e!28929 () Bool)

(assert (=> b!43312 (= e!28928 e!28929)))

(declare-fun res!36768 () Bool)

(assert (=> b!43312 (=> res!36768 e!28929)))

(assert (=> b!43312 (= res!36768 (= (size!998 (buf!1332 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!43313 () Bool)

(assert (=> b!43313 (= e!28929 (arrayBitRangesEq!0 (buf!1332 thiss!1379) (buf!1332 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!998 (buf!1332 thiss!1379)) (currentByte!2798 thiss!1379) (currentBit!2793 thiss!1379))))))

(assert (= (and d!12544 res!36769) b!43311))

(assert (= (and b!43311 res!36770) b!43312))

(assert (= (and b!43312 (not res!36768)) b!43313))

(assert (=> b!43311 m!65517))

(assert (=> b!43311 m!65517))

(assert (=> b!43313 m!65517))

(assert (=> b!43313 m!65517))

(declare-fun m!65843 () Bool)

(assert (=> b!43313 m!65843))

(assert (=> b!43096 d!12544))

(declare-fun d!12546 () Bool)

(assert (=> d!12546 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!65536 () Unit!3066)

(declare-fun choose!11 (BitStream!1740) Unit!3066)

(assert (=> d!12546 (= lt!65536 (choose!11 thiss!1379))))

(assert (=> d!12546 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!65536)))

(declare-fun bs!3375 () Bool)

(assert (= bs!3375 d!12546))

(assert (=> bs!3375 m!65513))

(declare-fun m!65845 () Bool)

(assert (=> bs!3375 m!65845))

(assert (=> b!43096 d!12546))

(declare-fun d!12548 () Bool)

(declare-fun e!28933 () Bool)

(assert (=> d!12548 e!28933))

(declare-fun res!36778 () Bool)

(assert (=> d!12548 (=> (not res!36778) (not e!28933))))

(declare-fun lt!65537 () (_ BitVec 64))

(declare-fun lt!65542 () (_ BitVec 64))

(declare-fun lt!65539 () (_ BitVec 64))

(assert (=> d!12548 (= res!36778 (= lt!65542 (bvsub lt!65539 lt!65537)))))

(assert (=> d!12548 (or (= (bvand lt!65539 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!65537 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!65539 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!65539 lt!65537) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!12548 (= lt!65537 (remainingBits!0 ((_ sign_extend 32) (size!998 (buf!1332 thiss!1379))) ((_ sign_extend 32) (currentByte!2798 thiss!1379)) ((_ sign_extend 32) (currentBit!2793 thiss!1379))))))

(declare-fun lt!65541 () (_ BitVec 64))

(declare-fun lt!65538 () (_ BitVec 64))

(assert (=> d!12548 (= lt!65539 (bvmul lt!65541 lt!65538))))

(assert (=> d!12548 (or (= lt!65541 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!65538 (bvsdiv (bvmul lt!65541 lt!65538) lt!65541)))))

(assert (=> d!12548 (= lt!65538 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!12548 (= lt!65541 ((_ sign_extend 32) (size!998 (buf!1332 thiss!1379))))))

(assert (=> d!12548 (= lt!65542 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2798 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2793 thiss!1379))))))

(assert (=> d!12548 (invariant!0 (currentBit!2793 thiss!1379) (currentByte!2798 thiss!1379) (size!998 (buf!1332 thiss!1379)))))

(assert (=> d!12548 (= (bitIndex!0 (size!998 (buf!1332 thiss!1379)) (currentByte!2798 thiss!1379) (currentBit!2793 thiss!1379)) lt!65542)))

(declare-fun b!43322 () Bool)

(declare-fun res!36777 () Bool)

(assert (=> b!43322 (=> (not res!36777) (not e!28933))))

(assert (=> b!43322 (= res!36777 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!65542))))

(declare-fun b!43323 () Bool)

(declare-fun lt!65540 () (_ BitVec 64))

(assert (=> b!43323 (= e!28933 (bvsle lt!65542 (bvmul lt!65540 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!43323 (or (= lt!65540 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!65540 #b0000000000000000000000000000000000000000000000000000000000001000) lt!65540)))))

(assert (=> b!43323 (= lt!65540 ((_ sign_extend 32) (size!998 (buf!1332 thiss!1379))))))

(assert (= (and d!12548 res!36778) b!43322))

(assert (= (and b!43322 res!36777) b!43323))

(assert (=> d!12548 m!65599))

(declare-fun m!65847 () Bool)

(assert (=> d!12548 m!65847))

(assert (=> b!43096 d!12548))

(declare-fun d!12550 () Bool)

(assert (=> d!12550 (= (array_inv!923 (buf!1332 thiss!1379)) (bvsge (size!998 (buf!1332 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!43097 d!12550))

(declare-fun d!12552 () Bool)

(assert (=> d!12552 (= (array_inv!923 srcBuffer!2) (bvsge (size!998 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!8644 d!12552))

(declare-fun d!12554 () Bool)

(assert (=> d!12554 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2793 thiss!1379) (currentByte!2798 thiss!1379) (size!998 (buf!1332 thiss!1379))))))

(declare-fun bs!3376 () Bool)

(assert (= bs!3376 d!12554))

(assert (=> bs!3376 m!65847))

(assert (=> start!8644 d!12554))

(declare-fun d!12556 () Bool)

(declare-fun res!36780 () Bool)

(declare-fun e!28934 () Bool)

(assert (=> d!12556 (=> (not res!36780) (not e!28934))))

(assert (=> d!12556 (= res!36780 (= (size!998 (buf!1332 thiss!1379)) (size!998 (buf!1332 (_2!2208 lt!65007)))))))

(assert (=> d!12556 (= (isPrefixOf!0 thiss!1379 (_2!2208 lt!65007)) e!28934)))

(declare-fun b!43324 () Bool)

(declare-fun res!36781 () Bool)

(assert (=> b!43324 (=> (not res!36781) (not e!28934))))

(assert (=> b!43324 (= res!36781 (bvsle (bitIndex!0 (size!998 (buf!1332 thiss!1379)) (currentByte!2798 thiss!1379) (currentBit!2793 thiss!1379)) (bitIndex!0 (size!998 (buf!1332 (_2!2208 lt!65007))) (currentByte!2798 (_2!2208 lt!65007)) (currentBit!2793 (_2!2208 lt!65007)))))))

(declare-fun b!43325 () Bool)

(declare-fun e!28935 () Bool)

(assert (=> b!43325 (= e!28934 e!28935)))

(declare-fun res!36779 () Bool)

(assert (=> b!43325 (=> res!36779 e!28935)))

(assert (=> b!43325 (= res!36779 (= (size!998 (buf!1332 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!43326 () Bool)

(assert (=> b!43326 (= e!28935 (arrayBitRangesEq!0 (buf!1332 thiss!1379) (buf!1332 (_2!2208 lt!65007)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!998 (buf!1332 thiss!1379)) (currentByte!2798 thiss!1379) (currentBit!2793 thiss!1379))))))

(assert (= (and d!12556 res!36780) b!43324))

(assert (= (and b!43324 res!36781) b!43325))

(assert (= (and b!43325 (not res!36779)) b!43326))

(assert (=> b!43324 m!65517))

(assert (=> b!43324 m!65635))

(assert (=> b!43326 m!65517))

(assert (=> b!43326 m!65517))

(declare-fun m!65849 () Bool)

(assert (=> b!43326 m!65849))

(assert (=> b!43098 d!12556))

(declare-fun d!12558 () Bool)

(assert (=> d!12558 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!998 (buf!1332 (_2!2208 lt!65007)))) ((_ sign_extend 32) (currentByte!2798 (_2!2208 lt!65007))) ((_ sign_extend 32) (currentBit!2793 (_2!2208 lt!65007))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!998 (buf!1332 (_2!2208 lt!65007)))) ((_ sign_extend 32) (currentByte!2798 (_2!2208 lt!65007))) ((_ sign_extend 32) (currentBit!2793 (_2!2208 lt!65007)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!3377 () Bool)

(assert (= bs!3377 d!12558))

(declare-fun m!65857 () Bool)

(assert (=> bs!3377 m!65857))

(assert (=> b!43098 d!12558))

(declare-fun d!12560 () Bool)

(declare-fun e!28940 () Bool)

(assert (=> d!12560 e!28940))

(declare-fun res!36787 () Bool)

(assert (=> d!12560 (=> (not res!36787) (not e!28940))))

(assert (=> d!12560 (= res!36787 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!65545 () Unit!3066)

(declare-fun choose!27 (BitStream!1740 BitStream!1740 (_ BitVec 64) (_ BitVec 64)) Unit!3066)

(assert (=> d!12560 (= lt!65545 (choose!27 thiss!1379 (_2!2208 lt!65007) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!12560 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!12560 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2208 lt!65007) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!65545)))

(declare-fun b!43332 () Bool)

(assert (=> b!43332 (= e!28940 (validate_offset_bits!1 ((_ sign_extend 32) (size!998 (buf!1332 (_2!2208 lt!65007)))) ((_ sign_extend 32) (currentByte!2798 (_2!2208 lt!65007))) ((_ sign_extend 32) (currentBit!2793 (_2!2208 lt!65007))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!12560 res!36787) b!43332))

(declare-fun m!65943 () Bool)

(assert (=> d!12560 m!65943))

(assert (=> b!43332 m!65507))

(assert (=> b!43098 d!12560))

(declare-fun b!43370 () Bool)

(declare-fun res!36829 () Bool)

(declare-fun e!28960 () Bool)

(assert (=> b!43370 (=> (not res!36829) (not e!28960))))

(declare-fun lt!65603 () (_ BitVec 64))

(declare-fun lt!65599 () (_ BitVec 64))

(declare-fun lt!65597 () tuple2!4230)

(assert (=> b!43370 (= res!36829 (= (bitIndex!0 (size!998 (buf!1332 (_2!2208 lt!65597))) (currentByte!2798 (_2!2208 lt!65597)) (currentBit!2793 (_2!2208 lt!65597))) (bvadd lt!65603 lt!65599)))))

(assert (=> b!43370 (or (not (= (bvand lt!65603 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!65599 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!65603 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!65603 lt!65599) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!43370 (= lt!65599 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!43370 (= lt!65603 (bitIndex!0 (size!998 (buf!1332 thiss!1379)) (currentByte!2798 thiss!1379) (currentBit!2793 thiss!1379)))))

(declare-fun d!12570 () Bool)

(assert (=> d!12570 e!28960))

(declare-fun res!36828 () Bool)

(assert (=> d!12570 (=> (not res!36828) (not e!28960))))

(assert (=> d!12570 (= res!36828 (= (size!998 (buf!1332 (_2!2208 lt!65597))) (size!998 (buf!1332 thiss!1379))))))

(declare-fun lt!65608 () (_ BitVec 8))

(declare-fun lt!65605 () array!2208)

(assert (=> d!12570 (= lt!65608 (select (arr!1500 lt!65605) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!12570 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!998 lt!65605)))))

(assert (=> d!12570 (= lt!65605 (array!2209 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!65600 () tuple2!4230)

(assert (=> d!12570 (= lt!65597 (tuple2!4231 (_1!2208 lt!65600) (_2!2208 lt!65600)))))

(declare-fun lt!65607 () tuple2!4230)

(assert (=> d!12570 (= lt!65600 lt!65607)))

(declare-fun e!28963 () Bool)

(assert (=> d!12570 e!28963))

(declare-fun res!36825 () Bool)

(assert (=> d!12570 (=> (not res!36825) (not e!28963))))

(assert (=> d!12570 (= res!36825 (= (size!998 (buf!1332 thiss!1379)) (size!998 (buf!1332 (_2!2208 lt!65607)))))))

(declare-fun lt!65606 () Bool)

(declare-fun appendBit!0 (BitStream!1740 Bool) tuple2!4230)

(assert (=> d!12570 (= lt!65607 (appendBit!0 thiss!1379 lt!65606))))

(assert (=> d!12570 (= lt!65606 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1500 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!12570 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!12570 (= (appendBitFromByte!0 thiss!1379 (select (arr!1500 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!65597)))

(declare-fun b!43371 () Bool)

(declare-fun e!28962 () Bool)

(declare-datatypes ((tuple2!4246 0))(
  ( (tuple2!4247 (_1!2216 BitStream!1740) (_2!2216 Bool)) )
))
(declare-fun lt!65601 () tuple2!4246)

(assert (=> b!43371 (= e!28962 (= (bitIndex!0 (size!998 (buf!1332 (_1!2216 lt!65601))) (currentByte!2798 (_1!2216 lt!65601)) (currentBit!2793 (_1!2216 lt!65601))) (bitIndex!0 (size!998 (buf!1332 (_2!2208 lt!65607))) (currentByte!2798 (_2!2208 lt!65607)) (currentBit!2793 (_2!2208 lt!65607)))))))

(declare-fun b!43372 () Bool)

(declare-fun res!36826 () Bool)

(assert (=> b!43372 (=> (not res!36826) (not e!28963))))

(assert (=> b!43372 (= res!36826 (= (bitIndex!0 (size!998 (buf!1332 (_2!2208 lt!65607))) (currentByte!2798 (_2!2208 lt!65607)) (currentBit!2793 (_2!2208 lt!65607))) (bvadd (bitIndex!0 (size!998 (buf!1332 thiss!1379)) (currentByte!2798 thiss!1379) (currentBit!2793 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!43373 () Bool)

(declare-fun e!28961 () Bool)

(assert (=> b!43373 (= e!28960 e!28961)))

(declare-fun res!36823 () Bool)

(assert (=> b!43373 (=> (not res!36823) (not e!28961))))

(declare-fun lt!65598 () tuple2!4246)

(assert (=> b!43373 (= res!36823 (and (= (_2!2216 lt!65598) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1500 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!65608)) #b00000000000000000000000000000000))) (= (_1!2216 lt!65598) (_2!2208 lt!65597))))))

(declare-fun lt!65602 () tuple2!4238)

(declare-fun lt!65604 () BitStream!1740)

(assert (=> b!43373 (= lt!65602 (readBits!0 lt!65604 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!1740) tuple2!4246)

(assert (=> b!43373 (= lt!65598 (readBitPure!0 lt!65604))))

(declare-fun readerFrom!0 (BitStream!1740 (_ BitVec 32) (_ BitVec 32)) BitStream!1740)

(assert (=> b!43373 (= lt!65604 (readerFrom!0 (_2!2208 lt!65597) (currentBit!2793 thiss!1379) (currentByte!2798 thiss!1379)))))

(declare-fun b!43374 () Bool)

(assert (=> b!43374 (= e!28961 (= (bitIndex!0 (size!998 (buf!1332 (_1!2216 lt!65598))) (currentByte!2798 (_1!2216 lt!65598)) (currentBit!2793 (_1!2216 lt!65598))) (bitIndex!0 (size!998 (buf!1332 (_2!2208 lt!65597))) (currentByte!2798 (_2!2208 lt!65597)) (currentBit!2793 (_2!2208 lt!65597)))))))

(declare-fun b!43375 () Bool)

(declare-fun res!36830 () Bool)

(assert (=> b!43375 (=> (not res!36830) (not e!28960))))

(assert (=> b!43375 (= res!36830 (isPrefixOf!0 thiss!1379 (_2!2208 lt!65597)))))

(declare-fun b!43376 () Bool)

(assert (=> b!43376 (= e!28963 e!28962)))

(declare-fun res!36827 () Bool)

(assert (=> b!43376 (=> (not res!36827) (not e!28962))))

(assert (=> b!43376 (= res!36827 (and (= (_2!2216 lt!65601) lt!65606) (= (_1!2216 lt!65601) (_2!2208 lt!65607))))))

(assert (=> b!43376 (= lt!65601 (readBitPure!0 (readerFrom!0 (_2!2208 lt!65607) (currentBit!2793 thiss!1379) (currentByte!2798 thiss!1379))))))

(declare-fun b!43377 () Bool)

(declare-fun res!36824 () Bool)

(assert (=> b!43377 (=> (not res!36824) (not e!28963))))

(assert (=> b!43377 (= res!36824 (isPrefixOf!0 thiss!1379 (_2!2208 lt!65607)))))

(assert (= (and d!12570 res!36825) b!43372))

(assert (= (and b!43372 res!36826) b!43377))

(assert (= (and b!43377 res!36824) b!43376))

(assert (= (and b!43376 res!36827) b!43371))

(assert (= (and d!12570 res!36828) b!43370))

(assert (= (and b!43370 res!36829) b!43375))

(assert (= (and b!43375 res!36830) b!43373))

(assert (= (and b!43373 res!36823) b!43374))

(declare-fun m!65949 () Bool)

(assert (=> b!43373 m!65949))

(declare-fun m!65951 () Bool)

(assert (=> b!43373 m!65951))

(declare-fun m!65953 () Bool)

(assert (=> b!43373 m!65953))

(declare-fun m!65955 () Bool)

(assert (=> b!43372 m!65955))

(assert (=> b!43372 m!65517))

(declare-fun m!65957 () Bool)

(assert (=> b!43376 m!65957))

(assert (=> b!43376 m!65957))

(declare-fun m!65959 () Bool)

(assert (=> b!43376 m!65959))

(declare-fun m!65961 () Bool)

(assert (=> b!43375 m!65961))

(declare-fun m!65963 () Bool)

(assert (=> b!43370 m!65963))

(assert (=> b!43370 m!65517))

(declare-fun m!65965 () Bool)

(assert (=> b!43374 m!65965))

(assert (=> b!43374 m!65963))

(declare-fun m!65967 () Bool)

(assert (=> b!43377 m!65967))

(declare-fun m!65969 () Bool)

(assert (=> d!12570 m!65969))

(declare-fun m!65971 () Bool)

(assert (=> d!12570 m!65971))

(assert (=> d!12570 m!65831))

(declare-fun m!65973 () Bool)

(assert (=> b!43371 m!65973))

(assert (=> b!43371 m!65955))

(assert (=> b!43098 d!12570))

(check-sat (not b!43332) (not b!43371) (not d!12468) (not d!12548) (not b!43311) (not b!43132) (not b!43308) (not b!43286) (not b!43372) (not b!43254) (not b!43253) (not b!43309) (not b!43370) (not b!43270) (not b!43268) (not b!43375) (not d!12478) (not b!43131) (not d!12464) (not d!12554) (not b!43376) (not d!12558) (not d!12534) (not b!43252) (not b!43255) (not b!43324) (not b!43251) (not d!12472) (not d!12466) (not b!43313) (not d!12560) (not d!12570) (not b!43265) (not b!43310) (not b!43326) (not b!43135) (not b!43134) (not b!43258) (not b!43374) (not b!43267) (not d!12470) (not b!43373) (not d!12546) (not bm!499) (not b!43377))
(check-sat)
