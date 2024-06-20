; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11378 () Bool)

(assert start!11378)

(declare-fun lt!88403 () (_ BitVec 64))

(declare-fun e!37519 () Bool)

(declare-fun b!56374 () Bool)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!88405 () (_ BitVec 64))

(assert (=> b!56374 (= e!37519 (or (not (= lt!88403 (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!88403 (bvand (bvadd lt!88405 to!314) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!56374 (= lt!88403 (bvand lt!88405 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((array!2607 0))(
  ( (array!2608 (arr!1737 (Array (_ BitVec 32) (_ BitVec 8))) (size!1185 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2058 0))(
  ( (BitStream!2059 (buf!1554 array!2607) (currentByte!3148 (_ BitVec 32)) (currentBit!3143 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!3897 0))(
  ( (Unit!3898) )
))
(declare-datatypes ((tuple2!5142 0))(
  ( (tuple2!5143 (_1!2682 Unit!3897) (_2!2682 BitStream!2058)) )
))
(declare-fun lt!88409 () tuple2!5142)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!56374 (= lt!88405 (bitIndex!0 (size!1185 (buf!1554 (_2!2682 lt!88409))) (currentByte!3148 (_2!2682 lt!88409)) (currentBit!3143 (_2!2682 lt!88409))))))

(declare-fun lt!88410 () tuple2!5142)

(declare-fun thiss!1379 () BitStream!2058)

(assert (=> b!56374 (= (size!1185 (buf!1554 (_2!2682 lt!88410))) (size!1185 (buf!1554 thiss!1379)))))

(declare-fun b!56375 () Bool)

(declare-fun e!37521 () Bool)

(declare-fun array_inv!1088 (array!2607) Bool)

(assert (=> b!56375 (= e!37521 (array_inv!1088 (buf!1554 thiss!1379)))))

(declare-fun b!56376 () Bool)

(declare-fun res!46910 () Bool)

(assert (=> b!56376 (=> res!46910 e!37519)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!56376 (= res!46910 (not (invariant!0 (currentBit!3143 (_2!2682 lt!88410)) (currentByte!3148 (_2!2682 lt!88410)) (size!1185 (buf!1554 (_2!2682 lt!88410))))))))

(declare-fun b!56377 () Bool)

(declare-fun e!37523 () Bool)

(declare-fun e!37522 () Bool)

(assert (=> b!56377 (= e!37523 (not e!37522))))

(declare-fun res!46903 () Bool)

(assert (=> b!56377 (=> res!46903 e!37522)))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!56377 (= res!46903 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!2058 BitStream!2058) Bool)

(assert (=> b!56377 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!88407 () Unit!3897)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2058) Unit!3897)

(assert (=> b!56377 (= lt!88407 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!88411 () (_ BitVec 64))

(assert (=> b!56377 (= lt!88411 (bitIndex!0 (size!1185 (buf!1554 thiss!1379)) (currentByte!3148 thiss!1379) (currentBit!3143 thiss!1379)))))

(declare-fun b!56378 () Bool)

(declare-fun e!37518 () Bool)

(assert (=> b!56378 (= e!37522 e!37518)))

(declare-fun res!46906 () Bool)

(assert (=> b!56378 (=> res!46906 e!37518)))

(assert (=> b!56378 (= res!46906 (not (isPrefixOf!0 thiss!1379 (_2!2682 lt!88409))))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!56378 (validate_offset_bits!1 ((_ sign_extend 32) (size!1185 (buf!1554 (_2!2682 lt!88409)))) ((_ sign_extend 32) (currentByte!3148 (_2!2682 lt!88409))) ((_ sign_extend 32) (currentBit!3143 (_2!2682 lt!88409))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!88402 () Unit!3897)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2058 BitStream!2058 (_ BitVec 64) (_ BitVec 64)) Unit!3897)

(assert (=> b!56378 (= lt!88402 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2682 lt!88409) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2607)

(declare-fun appendBitFromByte!0 (BitStream!2058 (_ BitVec 8) (_ BitVec 32)) tuple2!5142)

(assert (=> b!56378 (= lt!88409 (appendBitFromByte!0 thiss!1379 (select (arr!1737 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun e!37517 () Bool)

(declare-fun b!56379 () Bool)

(declare-datatypes ((tuple2!5144 0))(
  ( (tuple2!5145 (_1!2683 BitStream!2058) (_2!2683 BitStream!2058)) )
))
(declare-fun lt!88404 () tuple2!5144)

(declare-datatypes ((List!604 0))(
  ( (Nil!601) (Cons!600 (h!719 Bool) (t!1354 List!604)) )
))
(declare-fun head!423 (List!604) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2058 array!2607 (_ BitVec 64) (_ BitVec 64)) List!604)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2058 BitStream!2058 (_ BitVec 64)) List!604)

(assert (=> b!56379 (= e!37517 (= (head!423 (byteArrayBitContentToList!0 (_2!2682 lt!88409) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!423 (bitStreamReadBitsIntoList!0 (_2!2682 lt!88409) (_1!2683 lt!88404) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!56380 () Bool)

(assert (=> b!56380 (= e!37518 e!37519)))

(declare-fun res!46905 () Bool)

(assert (=> b!56380 (=> res!46905 e!37519)))

(assert (=> b!56380 (= res!46905 (not (isPrefixOf!0 (_2!2682 lt!88409) (_2!2682 lt!88410))))))

(assert (=> b!56380 (isPrefixOf!0 thiss!1379 (_2!2682 lt!88410))))

(declare-fun lt!88406 () Unit!3897)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2058 BitStream!2058 BitStream!2058) Unit!3897)

(assert (=> b!56380 (= lt!88406 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2682 lt!88409) (_2!2682 lt!88410)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2058 array!2607 (_ BitVec 64) (_ BitVec 64)) tuple2!5142)

(assert (=> b!56380 (= lt!88410 (appendBitsMSBFirstLoop!0 (_2!2682 lt!88409) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!56380 e!37517))

(declare-fun res!46911 () Bool)

(assert (=> b!56380 (=> (not res!46911) (not e!37517))))

(assert (=> b!56380 (= res!46911 (validate_offset_bits!1 ((_ sign_extend 32) (size!1185 (buf!1554 (_2!2682 lt!88409)))) ((_ sign_extend 32) (currentByte!3148 thiss!1379)) ((_ sign_extend 32) (currentBit!3143 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!88408 () Unit!3897)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2058 array!2607 (_ BitVec 64)) Unit!3897)

(assert (=> b!56380 (= lt!88408 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1554 (_2!2682 lt!88409)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!2058 BitStream!2058) tuple2!5144)

(assert (=> b!56380 (= lt!88404 (reader!0 thiss!1379 (_2!2682 lt!88409)))))

(declare-fun b!56382 () Bool)

(declare-fun res!46909 () Bool)

(assert (=> b!56382 (=> res!46909 e!37519)))

(assert (=> b!56382 (= res!46909 (not (= (bitIndex!0 (size!1185 (buf!1554 (_2!2682 lt!88410))) (currentByte!3148 (_2!2682 lt!88410)) (currentBit!3143 (_2!2682 lt!88410))) (bvsub (bvadd lt!88411 to!314) i!635))))))

(declare-fun b!56383 () Bool)

(declare-fun res!46904 () Bool)

(assert (=> b!56383 (=> (not res!46904) (not e!37523))))

(assert (=> b!56383 (= res!46904 (validate_offset_bits!1 ((_ sign_extend 32) (size!1185 (buf!1554 thiss!1379))) ((_ sign_extend 32) (currentByte!3148 thiss!1379)) ((_ sign_extend 32) (currentBit!3143 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!46907 () Bool)

(assert (=> start!11378 (=> (not res!46907) (not e!37523))))

(assert (=> start!11378 (= res!46907 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1185 srcBuffer!2))))))))

(assert (=> start!11378 e!37523))

(assert (=> start!11378 true))

(assert (=> start!11378 (array_inv!1088 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2058) Bool)

(assert (=> start!11378 (and (inv!12 thiss!1379) e!37521)))

(declare-fun b!56381 () Bool)

(declare-fun res!46908 () Bool)

(assert (=> b!56381 (=> res!46908 e!37519)))

(assert (=> b!56381 (= res!46908 (not (= (size!1185 (buf!1554 thiss!1379)) (size!1185 (buf!1554 (_2!2682 lt!88410))))))))

(assert (= (and start!11378 res!46907) b!56383))

(assert (= (and b!56383 res!46904) b!56377))

(assert (= (and b!56377 (not res!46903)) b!56378))

(assert (= (and b!56378 (not res!46906)) b!56380))

(assert (= (and b!56380 res!46911) b!56379))

(assert (= (and b!56380 (not res!46905)) b!56382))

(assert (= (and b!56382 (not res!46909)) b!56376))

(assert (= (and b!56376 (not res!46910)) b!56381))

(assert (= (and b!56381 (not res!46908)) b!56374))

(assert (= start!11378 b!56375))

(declare-fun m!88853 () Bool)

(assert (=> b!56379 m!88853))

(assert (=> b!56379 m!88853))

(declare-fun m!88855 () Bool)

(assert (=> b!56379 m!88855))

(declare-fun m!88857 () Bool)

(assert (=> b!56379 m!88857))

(assert (=> b!56379 m!88857))

(declare-fun m!88859 () Bool)

(assert (=> b!56379 m!88859))

(declare-fun m!88861 () Bool)

(assert (=> b!56378 m!88861))

(declare-fun m!88863 () Bool)

(assert (=> b!56378 m!88863))

(assert (=> b!56378 m!88861))

(declare-fun m!88865 () Bool)

(assert (=> b!56378 m!88865))

(declare-fun m!88867 () Bool)

(assert (=> b!56378 m!88867))

(declare-fun m!88869 () Bool)

(assert (=> b!56378 m!88869))

(declare-fun m!88871 () Bool)

(assert (=> b!56376 m!88871))

(declare-fun m!88873 () Bool)

(assert (=> b!56377 m!88873))

(declare-fun m!88875 () Bool)

(assert (=> b!56377 m!88875))

(declare-fun m!88877 () Bool)

(assert (=> b!56377 m!88877))

(declare-fun m!88879 () Bool)

(assert (=> b!56383 m!88879))

(declare-fun m!88881 () Bool)

(assert (=> b!56374 m!88881))

(declare-fun m!88883 () Bool)

(assert (=> b!56382 m!88883))

(declare-fun m!88885 () Bool)

(assert (=> b!56380 m!88885))

(declare-fun m!88887 () Bool)

(assert (=> b!56380 m!88887))

(declare-fun m!88889 () Bool)

(assert (=> b!56380 m!88889))

(declare-fun m!88891 () Bool)

(assert (=> b!56380 m!88891))

(declare-fun m!88893 () Bool)

(assert (=> b!56380 m!88893))

(declare-fun m!88895 () Bool)

(assert (=> b!56380 m!88895))

(declare-fun m!88897 () Bool)

(assert (=> b!56380 m!88897))

(declare-fun m!88899 () Bool)

(assert (=> b!56375 m!88899))

(declare-fun m!88901 () Bool)

(assert (=> start!11378 m!88901))

(declare-fun m!88903 () Bool)

(assert (=> start!11378 m!88903))

(check-sat (not b!56375) (not b!56379) (not b!56376) (not b!56377) (not b!56383) (not b!56380) (not b!56378) (not start!11378) (not b!56374) (not b!56382))
(check-sat)
(get-model)

(declare-fun d!17944 () Bool)

(assert (=> d!17944 (= (head!423 (byteArrayBitContentToList!0 (_2!2682 lt!88409) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!719 (byteArrayBitContentToList!0 (_2!2682 lt!88409) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!56379 d!17944))

(declare-fun d!17946 () Bool)

(declare-fun c!4050 () Bool)

(assert (=> d!17946 (= c!4050 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!37550 () List!604)

(assert (=> d!17946 (= (byteArrayBitContentToList!0 (_2!2682 lt!88409) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!37550)))

(declare-fun b!56418 () Bool)

(assert (=> b!56418 (= e!37550 Nil!601)))

(declare-fun b!56419 () Bool)

(assert (=> b!56419 (= e!37550 (Cons!600 (not (= (bvand ((_ sign_extend 24) (select (arr!1737 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2682 lt!88409) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!17946 c!4050) b!56418))

(assert (= (and d!17946 (not c!4050)) b!56419))

(assert (=> b!56419 m!88861))

(declare-fun m!88957 () Bool)

(assert (=> b!56419 m!88957))

(declare-fun m!88959 () Bool)

(assert (=> b!56419 m!88959))

(assert (=> b!56379 d!17946))

(declare-fun d!17948 () Bool)

(assert (=> d!17948 (= (head!423 (bitStreamReadBitsIntoList!0 (_2!2682 lt!88409) (_1!2683 lt!88404) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!719 (bitStreamReadBitsIntoList!0 (_2!2682 lt!88409) (_1!2683 lt!88404) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!56379 d!17948))

(declare-fun b!56431 () Bool)

(declare-fun e!37556 () Bool)

(declare-fun lt!88449 () List!604)

(declare-fun length!282 (List!604) Int)

(assert (=> b!56431 (= e!37556 (> (length!282 lt!88449) 0))))

(declare-fun d!17950 () Bool)

(assert (=> d!17950 e!37556))

(declare-fun c!4056 () Bool)

(assert (=> d!17950 (= c!4056 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!5150 0))(
  ( (tuple2!5151 (_1!2686 List!604) (_2!2686 BitStream!2058)) )
))
(declare-fun e!37555 () tuple2!5150)

(assert (=> d!17950 (= lt!88449 (_1!2686 e!37555))))

(declare-fun c!4055 () Bool)

(assert (=> d!17950 (= c!4055 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!17950 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!17950 (= (bitStreamReadBitsIntoList!0 (_2!2682 lt!88409) (_1!2683 lt!88404) #b0000000000000000000000000000000000000000000000000000000000000001) lt!88449)))

(declare-fun b!56428 () Bool)

(assert (=> b!56428 (= e!37555 (tuple2!5151 Nil!601 (_1!2683 lt!88404)))))

(declare-fun lt!88450 () (_ BitVec 64))

(declare-datatypes ((tuple2!5152 0))(
  ( (tuple2!5153 (_1!2687 Bool) (_2!2687 BitStream!2058)) )
))
(declare-fun lt!88448 () tuple2!5152)

(declare-fun b!56429 () Bool)

(assert (=> b!56429 (= e!37555 (tuple2!5151 (Cons!600 (_1!2687 lt!88448) (bitStreamReadBitsIntoList!0 (_2!2682 lt!88409) (_2!2687 lt!88448) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!88450))) (_2!2687 lt!88448)))))

(declare-fun readBit!0 (BitStream!2058) tuple2!5152)

(assert (=> b!56429 (= lt!88448 (readBit!0 (_1!2683 lt!88404)))))

(assert (=> b!56429 (= lt!88450 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!56430 () Bool)

(declare-fun isEmpty!168 (List!604) Bool)

(assert (=> b!56430 (= e!37556 (isEmpty!168 lt!88449))))

(assert (= (and d!17950 c!4055) b!56428))

(assert (= (and d!17950 (not c!4055)) b!56429))

(assert (= (and d!17950 c!4056) b!56430))

(assert (= (and d!17950 (not c!4056)) b!56431))

(declare-fun m!88961 () Bool)

(assert (=> b!56431 m!88961))

(declare-fun m!88963 () Bool)

(assert (=> b!56429 m!88963))

(declare-fun m!88965 () Bool)

(assert (=> b!56429 m!88965))

(declare-fun m!88967 () Bool)

(assert (=> b!56430 m!88967))

(assert (=> b!56379 d!17950))

(declare-fun d!17952 () Bool)

(assert (=> d!17952 (= (array_inv!1088 srcBuffer!2) (bvsge (size!1185 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!11378 d!17952))

(declare-fun d!17954 () Bool)

(assert (=> d!17954 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3143 thiss!1379) (currentByte!3148 thiss!1379) (size!1185 (buf!1554 thiss!1379))))))

(declare-fun bs!4497 () Bool)

(assert (= bs!4497 d!17954))

(declare-fun m!88969 () Bool)

(assert (=> bs!4497 m!88969))

(assert (=> start!11378 d!17954))

(declare-fun d!17956 () Bool)

(declare-fun e!37559 () Bool)

(assert (=> d!17956 e!37559))

(declare-fun res!46943 () Bool)

(assert (=> d!17956 (=> (not res!46943) (not e!37559))))

(declare-fun lt!88465 () (_ BitVec 64))

(declare-fun lt!88468 () (_ BitVec 64))

(declare-fun lt!88467 () (_ BitVec 64))

(assert (=> d!17956 (= res!46943 (= lt!88467 (bvsub lt!88465 lt!88468)))))

(assert (=> d!17956 (or (= (bvand lt!88465 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!88468 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!88465 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!88465 lt!88468) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!17956 (= lt!88468 (remainingBits!0 ((_ sign_extend 32) (size!1185 (buf!1554 (_2!2682 lt!88409)))) ((_ sign_extend 32) (currentByte!3148 (_2!2682 lt!88409))) ((_ sign_extend 32) (currentBit!3143 (_2!2682 lt!88409)))))))

(declare-fun lt!88464 () (_ BitVec 64))

(declare-fun lt!88463 () (_ BitVec 64))

(assert (=> d!17956 (= lt!88465 (bvmul lt!88464 lt!88463))))

(assert (=> d!17956 (or (= lt!88464 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!88463 (bvsdiv (bvmul lt!88464 lt!88463) lt!88464)))))

(assert (=> d!17956 (= lt!88463 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!17956 (= lt!88464 ((_ sign_extend 32) (size!1185 (buf!1554 (_2!2682 lt!88409)))))))

(assert (=> d!17956 (= lt!88467 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3148 (_2!2682 lt!88409))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3143 (_2!2682 lt!88409)))))))

(assert (=> d!17956 (invariant!0 (currentBit!3143 (_2!2682 lt!88409)) (currentByte!3148 (_2!2682 lt!88409)) (size!1185 (buf!1554 (_2!2682 lt!88409))))))

(assert (=> d!17956 (= (bitIndex!0 (size!1185 (buf!1554 (_2!2682 lt!88409))) (currentByte!3148 (_2!2682 lt!88409)) (currentBit!3143 (_2!2682 lt!88409))) lt!88467)))

(declare-fun b!56436 () Bool)

(declare-fun res!46944 () Bool)

(assert (=> b!56436 (=> (not res!46944) (not e!37559))))

(assert (=> b!56436 (= res!46944 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!88467))))

(declare-fun b!56437 () Bool)

(declare-fun lt!88466 () (_ BitVec 64))

(assert (=> b!56437 (= e!37559 (bvsle lt!88467 (bvmul lt!88466 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!56437 (or (= lt!88466 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!88466 #b0000000000000000000000000000000000000000000000000000000000001000) lt!88466)))))

(assert (=> b!56437 (= lt!88466 ((_ sign_extend 32) (size!1185 (buf!1554 (_2!2682 lt!88409)))))))

(assert (= (and d!17956 res!46943) b!56436))

(assert (= (and b!56436 res!46944) b!56437))

(declare-fun m!88971 () Bool)

(assert (=> d!17956 m!88971))

(declare-fun m!88973 () Bool)

(assert (=> d!17956 m!88973))

(assert (=> b!56374 d!17956))

(declare-fun d!17958 () Bool)

(assert (=> d!17958 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1185 (buf!1554 thiss!1379))) ((_ sign_extend 32) (currentByte!3148 thiss!1379)) ((_ sign_extend 32) (currentBit!3143 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1185 (buf!1554 thiss!1379))) ((_ sign_extend 32) (currentByte!3148 thiss!1379)) ((_ sign_extend 32) (currentBit!3143 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4498 () Bool)

(assert (= bs!4498 d!17958))

(declare-fun m!88975 () Bool)

(assert (=> bs!4498 m!88975))

(assert (=> b!56383 d!17958))

(declare-fun d!17960 () Bool)

(declare-fun res!46953 () Bool)

(declare-fun e!37564 () Bool)

(assert (=> d!17960 (=> (not res!46953) (not e!37564))))

(assert (=> d!17960 (= res!46953 (= (size!1185 (buf!1554 thiss!1379)) (size!1185 (buf!1554 (_2!2682 lt!88409)))))))

(assert (=> d!17960 (= (isPrefixOf!0 thiss!1379 (_2!2682 lt!88409)) e!37564)))

(declare-fun b!56444 () Bool)

(declare-fun res!46951 () Bool)

(assert (=> b!56444 (=> (not res!46951) (not e!37564))))

(assert (=> b!56444 (= res!46951 (bvsle (bitIndex!0 (size!1185 (buf!1554 thiss!1379)) (currentByte!3148 thiss!1379) (currentBit!3143 thiss!1379)) (bitIndex!0 (size!1185 (buf!1554 (_2!2682 lt!88409))) (currentByte!3148 (_2!2682 lt!88409)) (currentBit!3143 (_2!2682 lt!88409)))))))

(declare-fun b!56445 () Bool)

(declare-fun e!37565 () Bool)

(assert (=> b!56445 (= e!37564 e!37565)))

(declare-fun res!46952 () Bool)

(assert (=> b!56445 (=> res!46952 e!37565)))

(assert (=> b!56445 (= res!46952 (= (size!1185 (buf!1554 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!56446 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2607 array!2607 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!56446 (= e!37565 (arrayBitRangesEq!0 (buf!1554 thiss!1379) (buf!1554 (_2!2682 lt!88409)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1185 (buf!1554 thiss!1379)) (currentByte!3148 thiss!1379) (currentBit!3143 thiss!1379))))))

(assert (= (and d!17960 res!46953) b!56444))

(assert (= (and b!56444 res!46951) b!56445))

(assert (= (and b!56445 (not res!46952)) b!56446))

(assert (=> b!56444 m!88877))

(assert (=> b!56444 m!88881))

(assert (=> b!56446 m!88877))

(assert (=> b!56446 m!88877))

(declare-fun m!88977 () Bool)

(assert (=> b!56446 m!88977))

(assert (=> b!56378 d!17960))

(declare-fun d!17962 () Bool)

(assert (=> d!17962 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1185 (buf!1554 (_2!2682 lt!88409)))) ((_ sign_extend 32) (currentByte!3148 (_2!2682 lt!88409))) ((_ sign_extend 32) (currentBit!3143 (_2!2682 lt!88409))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1185 (buf!1554 (_2!2682 lt!88409)))) ((_ sign_extend 32) (currentByte!3148 (_2!2682 lt!88409))) ((_ sign_extend 32) (currentBit!3143 (_2!2682 lt!88409)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!4499 () Bool)

(assert (= bs!4499 d!17962))

(assert (=> bs!4499 m!88971))

(assert (=> b!56378 d!17962))

(declare-fun d!17964 () Bool)

(declare-fun e!37568 () Bool)

(assert (=> d!17964 e!37568))

(declare-fun res!46956 () Bool)

(assert (=> d!17964 (=> (not res!46956) (not e!37568))))

(assert (=> d!17964 (= res!46956 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!88471 () Unit!3897)

(declare-fun choose!27 (BitStream!2058 BitStream!2058 (_ BitVec 64) (_ BitVec 64)) Unit!3897)

(assert (=> d!17964 (= lt!88471 (choose!27 thiss!1379 (_2!2682 lt!88409) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!17964 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!17964 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2682 lt!88409) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!88471)))

(declare-fun b!56449 () Bool)

(assert (=> b!56449 (= e!37568 (validate_offset_bits!1 ((_ sign_extend 32) (size!1185 (buf!1554 (_2!2682 lt!88409)))) ((_ sign_extend 32) (currentByte!3148 (_2!2682 lt!88409))) ((_ sign_extend 32) (currentBit!3143 (_2!2682 lt!88409))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!17964 res!46956) b!56449))

(declare-fun m!88979 () Bool)

(assert (=> d!17964 m!88979))

(assert (=> b!56449 m!88867))

(assert (=> b!56378 d!17964))

(declare-fun d!17966 () Bool)

(declare-fun e!37593 () Bool)

(assert (=> d!17966 e!37593))

(declare-fun res!47000 () Bool)

(assert (=> d!17966 (=> (not res!47000) (not e!37593))))

(declare-fun lt!88507 () tuple2!5142)

(assert (=> d!17966 (= res!47000 (= (size!1185 (buf!1554 (_2!2682 lt!88507))) (size!1185 (buf!1554 thiss!1379))))))

(declare-fun lt!88505 () (_ BitVec 8))

(declare-fun lt!88509 () array!2607)

(assert (=> d!17966 (= lt!88505 (select (arr!1737 lt!88509) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!17966 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1185 lt!88509)))))

(assert (=> d!17966 (= lt!88509 (array!2608 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!88502 () tuple2!5142)

(assert (=> d!17966 (= lt!88507 (tuple2!5143 (_1!2682 lt!88502) (_2!2682 lt!88502)))))

(declare-fun lt!88499 () tuple2!5142)

(assert (=> d!17966 (= lt!88502 lt!88499)))

(declare-fun e!37592 () Bool)

(assert (=> d!17966 e!37592))

(declare-fun res!46999 () Bool)

(assert (=> d!17966 (=> (not res!46999) (not e!37592))))

(assert (=> d!17966 (= res!46999 (= (size!1185 (buf!1554 thiss!1379)) (size!1185 (buf!1554 (_2!2682 lt!88499)))))))

(declare-fun lt!88503 () Bool)

(declare-fun appendBit!0 (BitStream!2058 Bool) tuple2!5142)

(assert (=> d!17966 (= lt!88499 (appendBit!0 thiss!1379 lt!88503))))

(assert (=> d!17966 (= lt!88503 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1737 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!17966 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!17966 (= (appendBitFromByte!0 thiss!1379 (select (arr!1737 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!88507)))

(declare-fun b!56488 () Bool)

(declare-fun e!37595 () Bool)

(assert (=> b!56488 (= e!37592 e!37595)))

(declare-fun res!46996 () Bool)

(assert (=> b!56488 (=> (not res!46996) (not e!37595))))

(declare-datatypes ((tuple2!5154 0))(
  ( (tuple2!5155 (_1!2688 BitStream!2058) (_2!2688 Bool)) )
))
(declare-fun lt!88504 () tuple2!5154)

(assert (=> b!56488 (= res!46996 (and (= (_2!2688 lt!88504) lt!88503) (= (_1!2688 lt!88504) (_2!2682 lt!88499))))))

(declare-fun readBitPure!0 (BitStream!2058) tuple2!5154)

(declare-fun readerFrom!0 (BitStream!2058 (_ BitVec 32) (_ BitVec 32)) BitStream!2058)

(assert (=> b!56488 (= lt!88504 (readBitPure!0 (readerFrom!0 (_2!2682 lt!88499) (currentBit!3143 thiss!1379) (currentByte!3148 thiss!1379))))))

(declare-fun b!56489 () Bool)

(declare-fun res!47001 () Bool)

(assert (=> b!56489 (=> (not res!47001) (not e!37592))))

(assert (=> b!56489 (= res!47001 (= (bitIndex!0 (size!1185 (buf!1554 (_2!2682 lt!88499))) (currentByte!3148 (_2!2682 lt!88499)) (currentBit!3143 (_2!2682 lt!88499))) (bvadd (bitIndex!0 (size!1185 (buf!1554 thiss!1379)) (currentByte!3148 thiss!1379) (currentBit!3143 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!56490 () Bool)

(declare-fun res!46998 () Bool)

(assert (=> b!56490 (=> (not res!46998) (not e!37592))))

(assert (=> b!56490 (= res!46998 (isPrefixOf!0 thiss!1379 (_2!2682 lt!88499)))))

(declare-fun b!56491 () Bool)

(declare-fun e!37594 () Bool)

(assert (=> b!56491 (= e!37593 e!37594)))

(declare-fun res!46994 () Bool)

(assert (=> b!56491 (=> (not res!46994) (not e!37594))))

(declare-fun lt!88508 () tuple2!5154)

(assert (=> b!56491 (= res!46994 (and (= (_2!2688 lt!88508) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1737 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!88505)) #b00000000000000000000000000000000))) (= (_1!2688 lt!88508) (_2!2682 lt!88507))))))

(declare-datatypes ((tuple2!5156 0))(
  ( (tuple2!5157 (_1!2689 array!2607) (_2!2689 BitStream!2058)) )
))
(declare-fun lt!88510 () tuple2!5156)

(declare-fun lt!88500 () BitStream!2058)

(declare-fun readBits!0 (BitStream!2058 (_ BitVec 64)) tuple2!5156)

(assert (=> b!56491 (= lt!88510 (readBits!0 lt!88500 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!56491 (= lt!88508 (readBitPure!0 lt!88500))))

(assert (=> b!56491 (= lt!88500 (readerFrom!0 (_2!2682 lt!88507) (currentBit!3143 thiss!1379) (currentByte!3148 thiss!1379)))))

(declare-fun b!56492 () Bool)

(assert (=> b!56492 (= e!37594 (= (bitIndex!0 (size!1185 (buf!1554 (_1!2688 lt!88508))) (currentByte!3148 (_1!2688 lt!88508)) (currentBit!3143 (_1!2688 lt!88508))) (bitIndex!0 (size!1185 (buf!1554 (_2!2682 lt!88507))) (currentByte!3148 (_2!2682 lt!88507)) (currentBit!3143 (_2!2682 lt!88507)))))))

(declare-fun b!56493 () Bool)

(declare-fun res!46995 () Bool)

(assert (=> b!56493 (=> (not res!46995) (not e!37593))))

(declare-fun lt!88501 () (_ BitVec 64))

(declare-fun lt!88506 () (_ BitVec 64))

(assert (=> b!56493 (= res!46995 (= (bitIndex!0 (size!1185 (buf!1554 (_2!2682 lt!88507))) (currentByte!3148 (_2!2682 lt!88507)) (currentBit!3143 (_2!2682 lt!88507))) (bvadd lt!88506 lt!88501)))))

(assert (=> b!56493 (or (not (= (bvand lt!88506 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!88501 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!88506 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!88506 lt!88501) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!56493 (= lt!88501 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!56493 (= lt!88506 (bitIndex!0 (size!1185 (buf!1554 thiss!1379)) (currentByte!3148 thiss!1379) (currentBit!3143 thiss!1379)))))

(declare-fun b!56494 () Bool)

(declare-fun res!46997 () Bool)

(assert (=> b!56494 (=> (not res!46997) (not e!37593))))

(assert (=> b!56494 (= res!46997 (isPrefixOf!0 thiss!1379 (_2!2682 lt!88507)))))

(declare-fun b!56495 () Bool)

(assert (=> b!56495 (= e!37595 (= (bitIndex!0 (size!1185 (buf!1554 (_1!2688 lt!88504))) (currentByte!3148 (_1!2688 lt!88504)) (currentBit!3143 (_1!2688 lt!88504))) (bitIndex!0 (size!1185 (buf!1554 (_2!2682 lt!88499))) (currentByte!3148 (_2!2682 lt!88499)) (currentBit!3143 (_2!2682 lt!88499)))))))

(assert (= (and d!17966 res!46999) b!56489))

(assert (= (and b!56489 res!47001) b!56490))

(assert (= (and b!56490 res!46998) b!56488))

(assert (= (and b!56488 res!46996) b!56495))

(assert (= (and d!17966 res!47000) b!56493))

(assert (= (and b!56493 res!46995) b!56494))

(assert (= (and b!56494 res!46997) b!56491))

(assert (= (and b!56491 res!46994) b!56492))

(declare-fun m!88989 () Bool)

(assert (=> b!56490 m!88989))

(declare-fun m!88991 () Bool)

(assert (=> d!17966 m!88991))

(declare-fun m!88993 () Bool)

(assert (=> d!17966 m!88993))

(assert (=> d!17966 m!88957))

(declare-fun m!88995 () Bool)

(assert (=> b!56494 m!88995))

(declare-fun m!88997 () Bool)

(assert (=> b!56493 m!88997))

(assert (=> b!56493 m!88877))

(declare-fun m!88999 () Bool)

(assert (=> b!56495 m!88999))

(declare-fun m!89001 () Bool)

(assert (=> b!56495 m!89001))

(declare-fun m!89003 () Bool)

(assert (=> b!56488 m!89003))

(assert (=> b!56488 m!89003))

(declare-fun m!89005 () Bool)

(assert (=> b!56488 m!89005))

(declare-fun m!89007 () Bool)

(assert (=> b!56491 m!89007))

(declare-fun m!89009 () Bool)

(assert (=> b!56491 m!89009))

(declare-fun m!89011 () Bool)

(assert (=> b!56491 m!89011))

(declare-fun m!89013 () Bool)

(assert (=> b!56492 m!89013))

(assert (=> b!56492 m!88997))

(assert (=> b!56489 m!89001))

(assert (=> b!56489 m!88877))

(assert (=> b!56378 d!17966))

(declare-fun d!17980 () Bool)

(assert (=> d!17980 (= (invariant!0 (currentBit!3143 (_2!2682 lt!88410)) (currentByte!3148 (_2!2682 lt!88410)) (size!1185 (buf!1554 (_2!2682 lt!88410)))) (and (bvsge (currentBit!3143 (_2!2682 lt!88410)) #b00000000000000000000000000000000) (bvslt (currentBit!3143 (_2!2682 lt!88410)) #b00000000000000000000000000001000) (bvsge (currentByte!3148 (_2!2682 lt!88410)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3148 (_2!2682 lt!88410)) (size!1185 (buf!1554 (_2!2682 lt!88410)))) (and (= (currentBit!3143 (_2!2682 lt!88410)) #b00000000000000000000000000000000) (= (currentByte!3148 (_2!2682 lt!88410)) (size!1185 (buf!1554 (_2!2682 lt!88410))))))))))

(assert (=> b!56376 d!17980))

(declare-fun d!17982 () Bool)

(declare-fun res!47004 () Bool)

(declare-fun e!37596 () Bool)

(assert (=> d!17982 (=> (not res!47004) (not e!37596))))

(assert (=> d!17982 (= res!47004 (= (size!1185 (buf!1554 thiss!1379)) (size!1185 (buf!1554 thiss!1379))))))

(assert (=> d!17982 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!37596)))

(declare-fun b!56496 () Bool)

(declare-fun res!47002 () Bool)

(assert (=> b!56496 (=> (not res!47002) (not e!37596))))

(assert (=> b!56496 (= res!47002 (bvsle (bitIndex!0 (size!1185 (buf!1554 thiss!1379)) (currentByte!3148 thiss!1379) (currentBit!3143 thiss!1379)) (bitIndex!0 (size!1185 (buf!1554 thiss!1379)) (currentByte!3148 thiss!1379) (currentBit!3143 thiss!1379))))))

(declare-fun b!56497 () Bool)

(declare-fun e!37597 () Bool)

(assert (=> b!56497 (= e!37596 e!37597)))

(declare-fun res!47003 () Bool)

(assert (=> b!56497 (=> res!47003 e!37597)))

(assert (=> b!56497 (= res!47003 (= (size!1185 (buf!1554 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!56498 () Bool)

(assert (=> b!56498 (= e!37597 (arrayBitRangesEq!0 (buf!1554 thiss!1379) (buf!1554 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1185 (buf!1554 thiss!1379)) (currentByte!3148 thiss!1379) (currentBit!3143 thiss!1379))))))

(assert (= (and d!17982 res!47004) b!56496))

(assert (= (and b!56496 res!47002) b!56497))

(assert (= (and b!56497 (not res!47003)) b!56498))

(assert (=> b!56496 m!88877))

(assert (=> b!56496 m!88877))

(assert (=> b!56498 m!88877))

(assert (=> b!56498 m!88877))

(declare-fun m!89015 () Bool)

(assert (=> b!56498 m!89015))

(assert (=> b!56377 d!17982))

(declare-fun d!17984 () Bool)

(assert (=> d!17984 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!88513 () Unit!3897)

(declare-fun choose!11 (BitStream!2058) Unit!3897)

(assert (=> d!17984 (= lt!88513 (choose!11 thiss!1379))))

(assert (=> d!17984 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!88513)))

(declare-fun bs!4502 () Bool)

(assert (= bs!4502 d!17984))

(assert (=> bs!4502 m!88873))

(declare-fun m!89017 () Bool)

(assert (=> bs!4502 m!89017))

(assert (=> b!56377 d!17984))

(declare-fun d!17986 () Bool)

(declare-fun e!37598 () Bool)

(assert (=> d!17986 e!37598))

(declare-fun res!47005 () Bool)

(assert (=> d!17986 (=> (not res!47005) (not e!37598))))

(declare-fun lt!88516 () (_ BitVec 64))

(declare-fun lt!88518 () (_ BitVec 64))

(declare-fun lt!88519 () (_ BitVec 64))

(assert (=> d!17986 (= res!47005 (= lt!88518 (bvsub lt!88516 lt!88519)))))

(assert (=> d!17986 (or (= (bvand lt!88516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!88519 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!88516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!88516 lt!88519) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!17986 (= lt!88519 (remainingBits!0 ((_ sign_extend 32) (size!1185 (buf!1554 thiss!1379))) ((_ sign_extend 32) (currentByte!3148 thiss!1379)) ((_ sign_extend 32) (currentBit!3143 thiss!1379))))))

(declare-fun lt!88515 () (_ BitVec 64))

(declare-fun lt!88514 () (_ BitVec 64))

(assert (=> d!17986 (= lt!88516 (bvmul lt!88515 lt!88514))))

(assert (=> d!17986 (or (= lt!88515 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!88514 (bvsdiv (bvmul lt!88515 lt!88514) lt!88515)))))

(assert (=> d!17986 (= lt!88514 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!17986 (= lt!88515 ((_ sign_extend 32) (size!1185 (buf!1554 thiss!1379))))))

(assert (=> d!17986 (= lt!88518 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3148 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3143 thiss!1379))))))

(assert (=> d!17986 (invariant!0 (currentBit!3143 thiss!1379) (currentByte!3148 thiss!1379) (size!1185 (buf!1554 thiss!1379)))))

(assert (=> d!17986 (= (bitIndex!0 (size!1185 (buf!1554 thiss!1379)) (currentByte!3148 thiss!1379) (currentBit!3143 thiss!1379)) lt!88518)))

(declare-fun b!56499 () Bool)

(declare-fun res!47006 () Bool)

(assert (=> b!56499 (=> (not res!47006) (not e!37598))))

(assert (=> b!56499 (= res!47006 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!88518))))

(declare-fun b!56500 () Bool)

(declare-fun lt!88517 () (_ BitVec 64))

(assert (=> b!56500 (= e!37598 (bvsle lt!88518 (bvmul lt!88517 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!56500 (or (= lt!88517 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!88517 #b0000000000000000000000000000000000000000000000000000000000001000) lt!88517)))))

(assert (=> b!56500 (= lt!88517 ((_ sign_extend 32) (size!1185 (buf!1554 thiss!1379))))))

(assert (= (and d!17986 res!47005) b!56499))

(assert (= (and b!56499 res!47006) b!56500))

(assert (=> d!17986 m!88975))

(assert (=> d!17986 m!88969))

(assert (=> b!56377 d!17986))

(declare-fun d!17988 () Bool)

(declare-fun e!37599 () Bool)

(assert (=> d!17988 e!37599))

(declare-fun res!47007 () Bool)

(assert (=> d!17988 (=> (not res!47007) (not e!37599))))

(declare-fun lt!88524 () (_ BitVec 64))

(declare-fun lt!88522 () (_ BitVec 64))

(declare-fun lt!88525 () (_ BitVec 64))

(assert (=> d!17988 (= res!47007 (= lt!88524 (bvsub lt!88522 lt!88525)))))

(assert (=> d!17988 (or (= (bvand lt!88522 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!88525 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!88522 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!88522 lt!88525) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!17988 (= lt!88525 (remainingBits!0 ((_ sign_extend 32) (size!1185 (buf!1554 (_2!2682 lt!88410)))) ((_ sign_extend 32) (currentByte!3148 (_2!2682 lt!88410))) ((_ sign_extend 32) (currentBit!3143 (_2!2682 lt!88410)))))))

(declare-fun lt!88521 () (_ BitVec 64))

(declare-fun lt!88520 () (_ BitVec 64))

(assert (=> d!17988 (= lt!88522 (bvmul lt!88521 lt!88520))))

(assert (=> d!17988 (or (= lt!88521 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!88520 (bvsdiv (bvmul lt!88521 lt!88520) lt!88521)))))

(assert (=> d!17988 (= lt!88520 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!17988 (= lt!88521 ((_ sign_extend 32) (size!1185 (buf!1554 (_2!2682 lt!88410)))))))

(assert (=> d!17988 (= lt!88524 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3148 (_2!2682 lt!88410))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3143 (_2!2682 lt!88410)))))))

(assert (=> d!17988 (invariant!0 (currentBit!3143 (_2!2682 lt!88410)) (currentByte!3148 (_2!2682 lt!88410)) (size!1185 (buf!1554 (_2!2682 lt!88410))))))

(assert (=> d!17988 (= (bitIndex!0 (size!1185 (buf!1554 (_2!2682 lt!88410))) (currentByte!3148 (_2!2682 lt!88410)) (currentBit!3143 (_2!2682 lt!88410))) lt!88524)))

(declare-fun b!56501 () Bool)

(declare-fun res!47008 () Bool)

(assert (=> b!56501 (=> (not res!47008) (not e!37599))))

(assert (=> b!56501 (= res!47008 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!88524))))

(declare-fun b!56502 () Bool)

(declare-fun lt!88523 () (_ BitVec 64))

(assert (=> b!56502 (= e!37599 (bvsle lt!88524 (bvmul lt!88523 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!56502 (or (= lt!88523 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!88523 #b0000000000000000000000000000000000000000000000000000000000001000) lt!88523)))))

(assert (=> b!56502 (= lt!88523 ((_ sign_extend 32) (size!1185 (buf!1554 (_2!2682 lt!88410)))))))

(assert (= (and d!17988 res!47007) b!56501))

(assert (= (and b!56501 res!47008) b!56502))

(declare-fun m!89019 () Bool)

(assert (=> d!17988 m!89019))

(assert (=> d!17988 m!88871))

(assert (=> b!56382 d!17988))

(declare-fun d!17990 () Bool)

(assert (=> d!17990 (= (array_inv!1088 (buf!1554 thiss!1379)) (bvsge (size!1185 (buf!1554 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!56375 d!17990))

(declare-fun d!17992 () Bool)

(declare-fun res!47011 () Bool)

(declare-fun e!37600 () Bool)

(assert (=> d!17992 (=> (not res!47011) (not e!37600))))

(assert (=> d!17992 (= res!47011 (= (size!1185 (buf!1554 (_2!2682 lt!88409))) (size!1185 (buf!1554 (_2!2682 lt!88410)))))))

(assert (=> d!17992 (= (isPrefixOf!0 (_2!2682 lt!88409) (_2!2682 lt!88410)) e!37600)))

(declare-fun b!56503 () Bool)

(declare-fun res!47009 () Bool)

(assert (=> b!56503 (=> (not res!47009) (not e!37600))))

(assert (=> b!56503 (= res!47009 (bvsle (bitIndex!0 (size!1185 (buf!1554 (_2!2682 lt!88409))) (currentByte!3148 (_2!2682 lt!88409)) (currentBit!3143 (_2!2682 lt!88409))) (bitIndex!0 (size!1185 (buf!1554 (_2!2682 lt!88410))) (currentByte!3148 (_2!2682 lt!88410)) (currentBit!3143 (_2!2682 lt!88410)))))))

(declare-fun b!56504 () Bool)

(declare-fun e!37601 () Bool)

(assert (=> b!56504 (= e!37600 e!37601)))

(declare-fun res!47010 () Bool)

(assert (=> b!56504 (=> res!47010 e!37601)))

(assert (=> b!56504 (= res!47010 (= (size!1185 (buf!1554 (_2!2682 lt!88409))) #b00000000000000000000000000000000))))

(declare-fun b!56505 () Bool)

(assert (=> b!56505 (= e!37601 (arrayBitRangesEq!0 (buf!1554 (_2!2682 lt!88409)) (buf!1554 (_2!2682 lt!88410)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1185 (buf!1554 (_2!2682 lt!88409))) (currentByte!3148 (_2!2682 lt!88409)) (currentBit!3143 (_2!2682 lt!88409)))))))

(assert (= (and d!17992 res!47011) b!56503))

(assert (= (and b!56503 res!47009) b!56504))

(assert (= (and b!56504 (not res!47010)) b!56505))

(assert (=> b!56503 m!88881))

(assert (=> b!56503 m!88883))

(assert (=> b!56505 m!88881))

(assert (=> b!56505 m!88881))

(declare-fun m!89021 () Bool)

(assert (=> b!56505 m!89021))

(assert (=> b!56380 d!17992))

(declare-fun d!17994 () Bool)

(declare-fun e!37613 () Bool)

(assert (=> d!17994 e!37613))

(declare-fun res!47028 () Bool)

(assert (=> d!17994 (=> (not res!47028) (not e!37613))))

(declare-fun lt!88631 () tuple2!5144)

(assert (=> d!17994 (= res!47028 (isPrefixOf!0 (_1!2683 lt!88631) (_2!2683 lt!88631)))))

(declare-fun lt!88643 () BitStream!2058)

(assert (=> d!17994 (= lt!88631 (tuple2!5145 lt!88643 (_2!2682 lt!88409)))))

(declare-fun lt!88637 () Unit!3897)

(declare-fun lt!88645 () Unit!3897)

(assert (=> d!17994 (= lt!88637 lt!88645)))

(assert (=> d!17994 (isPrefixOf!0 lt!88643 (_2!2682 lt!88409))))

(assert (=> d!17994 (= lt!88645 (lemmaIsPrefixTransitive!0 lt!88643 (_2!2682 lt!88409) (_2!2682 lt!88409)))))

(declare-fun lt!88635 () Unit!3897)

(declare-fun lt!88636 () Unit!3897)

(assert (=> d!17994 (= lt!88635 lt!88636)))

(assert (=> d!17994 (isPrefixOf!0 lt!88643 (_2!2682 lt!88409))))

(assert (=> d!17994 (= lt!88636 (lemmaIsPrefixTransitive!0 lt!88643 thiss!1379 (_2!2682 lt!88409)))))

(declare-fun lt!88642 () Unit!3897)

(declare-fun e!37612 () Unit!3897)

(assert (=> d!17994 (= lt!88642 e!37612)))

(declare-fun c!4062 () Bool)

(assert (=> d!17994 (= c!4062 (not (= (size!1185 (buf!1554 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!88646 () Unit!3897)

(declare-fun lt!88639 () Unit!3897)

(assert (=> d!17994 (= lt!88646 lt!88639)))

(assert (=> d!17994 (isPrefixOf!0 (_2!2682 lt!88409) (_2!2682 lt!88409))))

(assert (=> d!17994 (= lt!88639 (lemmaIsPrefixRefl!0 (_2!2682 lt!88409)))))

(declare-fun lt!88644 () Unit!3897)

(declare-fun lt!88634 () Unit!3897)

(assert (=> d!17994 (= lt!88644 lt!88634)))

(assert (=> d!17994 (= lt!88634 (lemmaIsPrefixRefl!0 (_2!2682 lt!88409)))))

(declare-fun lt!88647 () Unit!3897)

(declare-fun lt!88640 () Unit!3897)

(assert (=> d!17994 (= lt!88647 lt!88640)))

(assert (=> d!17994 (isPrefixOf!0 lt!88643 lt!88643)))

(assert (=> d!17994 (= lt!88640 (lemmaIsPrefixRefl!0 lt!88643))))

(declare-fun lt!88648 () Unit!3897)

(declare-fun lt!88633 () Unit!3897)

(assert (=> d!17994 (= lt!88648 lt!88633)))

(assert (=> d!17994 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!17994 (= lt!88633 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!17994 (= lt!88643 (BitStream!2059 (buf!1554 (_2!2682 lt!88409)) (currentByte!3148 thiss!1379) (currentBit!3143 thiss!1379)))))

(assert (=> d!17994 (isPrefixOf!0 thiss!1379 (_2!2682 lt!88409))))

(assert (=> d!17994 (= (reader!0 thiss!1379 (_2!2682 lt!88409)) lt!88631)))

(declare-fun b!56531 () Bool)

(declare-fun lt!88632 () Unit!3897)

(assert (=> b!56531 (= e!37612 lt!88632)))

(declare-fun lt!88629 () (_ BitVec 64))

(assert (=> b!56531 (= lt!88629 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88641 () (_ BitVec 64))

(assert (=> b!56531 (= lt!88641 (bitIndex!0 (size!1185 (buf!1554 thiss!1379)) (currentByte!3148 thiss!1379) (currentBit!3143 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2607 array!2607 (_ BitVec 64) (_ BitVec 64)) Unit!3897)

(assert (=> b!56531 (= lt!88632 (arrayBitRangesEqSymmetric!0 (buf!1554 thiss!1379) (buf!1554 (_2!2682 lt!88409)) lt!88629 lt!88641))))

(assert (=> b!56531 (arrayBitRangesEq!0 (buf!1554 (_2!2682 lt!88409)) (buf!1554 thiss!1379) lt!88629 lt!88641)))

(declare-fun b!56532 () Bool)

(declare-fun res!47027 () Bool)

(assert (=> b!56532 (=> (not res!47027) (not e!37613))))

(assert (=> b!56532 (= res!47027 (isPrefixOf!0 (_1!2683 lt!88631) thiss!1379))))

(declare-fun b!56533 () Bool)

(declare-fun Unit!3901 () Unit!3897)

(assert (=> b!56533 (= e!37612 Unit!3901)))

(declare-fun lt!88630 () (_ BitVec 64))

(declare-fun lt!88638 () (_ BitVec 64))

(declare-fun b!56534 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!2058 (_ BitVec 64)) BitStream!2058)

(assert (=> b!56534 (= e!37613 (= (_1!2683 lt!88631) (withMovedBitIndex!0 (_2!2683 lt!88631) (bvsub lt!88638 lt!88630))))))

(assert (=> b!56534 (or (= (bvand lt!88638 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!88630 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!88638 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!88638 lt!88630) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!56534 (= lt!88630 (bitIndex!0 (size!1185 (buf!1554 (_2!2682 lt!88409))) (currentByte!3148 (_2!2682 lt!88409)) (currentBit!3143 (_2!2682 lt!88409))))))

(assert (=> b!56534 (= lt!88638 (bitIndex!0 (size!1185 (buf!1554 thiss!1379)) (currentByte!3148 thiss!1379) (currentBit!3143 thiss!1379)))))

(declare-fun b!56535 () Bool)

(declare-fun res!47029 () Bool)

(assert (=> b!56535 (=> (not res!47029) (not e!37613))))

(assert (=> b!56535 (= res!47029 (isPrefixOf!0 (_2!2683 lt!88631) (_2!2682 lt!88409)))))

(assert (= (and d!17994 c!4062) b!56531))

(assert (= (and d!17994 (not c!4062)) b!56533))

(assert (= (and d!17994 res!47028) b!56532))

(assert (= (and b!56532 res!47027) b!56535))

(assert (= (and b!56535 res!47029) b!56534))

(assert (=> b!56531 m!88877))

(declare-fun m!89051 () Bool)

(assert (=> b!56531 m!89051))

(declare-fun m!89053 () Bool)

(assert (=> b!56531 m!89053))

(declare-fun m!89055 () Bool)

(assert (=> d!17994 m!89055))

(declare-fun m!89057 () Bool)

(assert (=> d!17994 m!89057))

(declare-fun m!89059 () Bool)

(assert (=> d!17994 m!89059))

(assert (=> d!17994 m!88875))

(declare-fun m!89061 () Bool)

(assert (=> d!17994 m!89061))

(assert (=> d!17994 m!88869))

(assert (=> d!17994 m!88873))

(declare-fun m!89063 () Bool)

(assert (=> d!17994 m!89063))

(declare-fun m!89065 () Bool)

(assert (=> d!17994 m!89065))

(declare-fun m!89067 () Bool)

(assert (=> d!17994 m!89067))

(declare-fun m!89069 () Bool)

(assert (=> d!17994 m!89069))

(declare-fun m!89071 () Bool)

(assert (=> b!56535 m!89071))

(declare-fun m!89073 () Bool)

(assert (=> b!56534 m!89073))

(assert (=> b!56534 m!88881))

(assert (=> b!56534 m!88877))

(declare-fun m!89075 () Bool)

(assert (=> b!56532 m!89075))

(assert (=> b!56380 d!17994))

(declare-fun d!18000 () Bool)

(assert (=> d!18000 (validate_offset_bits!1 ((_ sign_extend 32) (size!1185 (buf!1554 (_2!2682 lt!88409)))) ((_ sign_extend 32) (currentByte!3148 thiss!1379)) ((_ sign_extend 32) (currentBit!3143 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!88675 () Unit!3897)

(declare-fun choose!9 (BitStream!2058 array!2607 (_ BitVec 64) BitStream!2058) Unit!3897)

(assert (=> d!18000 (= lt!88675 (choose!9 thiss!1379 (buf!1554 (_2!2682 lt!88409)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2059 (buf!1554 (_2!2682 lt!88409)) (currentByte!3148 thiss!1379) (currentBit!3143 thiss!1379))))))

(assert (=> d!18000 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1554 (_2!2682 lt!88409)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!88675)))

(declare-fun bs!4504 () Bool)

(assert (= bs!4504 d!18000))

(assert (=> bs!4504 m!88889))

(declare-fun m!89077 () Bool)

(assert (=> bs!4504 m!89077))

(assert (=> b!56380 d!18000))

(declare-fun d!18002 () Bool)

(declare-fun res!47048 () Bool)

(declare-fun e!37622 () Bool)

(assert (=> d!18002 (=> (not res!47048) (not e!37622))))

(assert (=> d!18002 (= res!47048 (= (size!1185 (buf!1554 thiss!1379)) (size!1185 (buf!1554 (_2!2682 lt!88410)))))))

(assert (=> d!18002 (= (isPrefixOf!0 thiss!1379 (_2!2682 lt!88410)) e!37622)))

(declare-fun b!56553 () Bool)

(declare-fun res!47046 () Bool)

(assert (=> b!56553 (=> (not res!47046) (not e!37622))))

(assert (=> b!56553 (= res!47046 (bvsle (bitIndex!0 (size!1185 (buf!1554 thiss!1379)) (currentByte!3148 thiss!1379) (currentBit!3143 thiss!1379)) (bitIndex!0 (size!1185 (buf!1554 (_2!2682 lt!88410))) (currentByte!3148 (_2!2682 lt!88410)) (currentBit!3143 (_2!2682 lt!88410)))))))

(declare-fun b!56554 () Bool)

(declare-fun e!37623 () Bool)

(assert (=> b!56554 (= e!37622 e!37623)))

(declare-fun res!47047 () Bool)

(assert (=> b!56554 (=> res!47047 e!37623)))

(assert (=> b!56554 (= res!47047 (= (size!1185 (buf!1554 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!56555 () Bool)

(assert (=> b!56555 (= e!37623 (arrayBitRangesEq!0 (buf!1554 thiss!1379) (buf!1554 (_2!2682 lt!88410)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1185 (buf!1554 thiss!1379)) (currentByte!3148 thiss!1379) (currentBit!3143 thiss!1379))))))

(assert (= (and d!18002 res!47048) b!56553))

(assert (= (and b!56553 res!47046) b!56554))

(assert (= (and b!56554 (not res!47047)) b!56555))

(assert (=> b!56553 m!88877))

(assert (=> b!56553 m!88883))

(assert (=> b!56555 m!88877))

(assert (=> b!56555 m!88877))

(declare-fun m!89079 () Bool)

(assert (=> b!56555 m!89079))

(assert (=> b!56380 d!18002))

(declare-fun d!18004 () Bool)

(assert (=> d!18004 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1185 (buf!1554 (_2!2682 lt!88409)))) ((_ sign_extend 32) (currentByte!3148 thiss!1379)) ((_ sign_extend 32) (currentBit!3143 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1185 (buf!1554 (_2!2682 lt!88409)))) ((_ sign_extend 32) (currentByte!3148 thiss!1379)) ((_ sign_extend 32) (currentBit!3143 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4505 () Bool)

(assert (= bs!4505 d!18004))

(declare-fun m!89081 () Bool)

(assert (=> bs!4505 m!89081))

(assert (=> b!56380 d!18004))

(declare-fun d!18006 () Bool)

(assert (=> d!18006 (isPrefixOf!0 thiss!1379 (_2!2682 lt!88410))))

(declare-fun lt!88678 () Unit!3897)

(declare-fun choose!30 (BitStream!2058 BitStream!2058 BitStream!2058) Unit!3897)

(assert (=> d!18006 (= lt!88678 (choose!30 thiss!1379 (_2!2682 lt!88409) (_2!2682 lt!88410)))))

(assert (=> d!18006 (isPrefixOf!0 thiss!1379 (_2!2682 lt!88409))))

(assert (=> d!18006 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2682 lt!88409) (_2!2682 lt!88410)) lt!88678)))

(declare-fun bs!4506 () Bool)

(assert (= bs!4506 d!18006))

(assert (=> bs!4506 m!88895))

(declare-fun m!89083 () Bool)

(assert (=> bs!4506 m!89083))

(assert (=> bs!4506 m!88869))

(assert (=> b!56380 d!18006))

(declare-fun b!56670 () Bool)

(declare-fun res!47130 () Bool)

(declare-fun e!37675 () Bool)

(assert (=> b!56670 (=> (not res!47130) (not e!37675))))

(declare-fun lt!89119 () tuple2!5142)

(assert (=> b!56670 (= res!47130 (isPrefixOf!0 (_2!2682 lt!88409) (_2!2682 lt!89119)))))

(declare-fun b!56671 () Bool)

(declare-fun e!37676 () tuple2!5142)

(declare-fun Unit!3903 () Unit!3897)

(assert (=> b!56671 (= e!37676 (tuple2!5143 Unit!3903 (_2!2682 lt!88409)))))

(assert (=> b!56671 (= (size!1185 (buf!1554 (_2!2682 lt!88409))) (size!1185 (buf!1554 (_2!2682 lt!88409))))))

(declare-fun lt!89141 () Unit!3897)

(declare-fun Unit!3904 () Unit!3897)

(assert (=> b!56671 (= lt!89141 Unit!3904)))

(declare-fun call!735 () tuple2!5144)

(declare-fun checkByteArrayBitContent!0 (BitStream!2058 array!2607 array!2607 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!56671 (checkByteArrayBitContent!0 (_2!2682 lt!88409) srcBuffer!2 (_1!2689 (readBits!0 (_1!2683 call!735) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun bm!732 () Bool)

(declare-fun c!4082 () Bool)

(declare-fun lt!89112 () tuple2!5142)

(assert (=> bm!732 (= call!735 (reader!0 (_2!2682 lt!88409) (ite c!4082 (_2!2682 lt!89112) (_2!2682 lt!88409))))))

(declare-fun b!56672 () Bool)

(declare-fun e!37677 () Bool)

(declare-fun lt!89109 () (_ BitVec 64))

(assert (=> b!56672 (= e!37677 (validate_offset_bits!1 ((_ sign_extend 32) (size!1185 (buf!1554 (_2!2682 lt!88409)))) ((_ sign_extend 32) (currentByte!3148 (_2!2682 lt!88409))) ((_ sign_extend 32) (currentBit!3143 (_2!2682 lt!88409))) lt!89109))))

(declare-fun b!56673 () Bool)

(declare-fun lt!89098 () tuple2!5142)

(declare-fun Unit!3906 () Unit!3897)

(assert (=> b!56673 (= e!37676 (tuple2!5143 Unit!3906 (_2!2682 lt!89098)))))

(assert (=> b!56673 (= lt!89112 (appendBitFromByte!0 (_2!2682 lt!88409) (select (arr!1737 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!89100 () (_ BitVec 64))

(assert (=> b!56673 (= lt!89100 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!89123 () (_ BitVec 64))

(assert (=> b!56673 (= lt!89123 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!89106 () Unit!3897)

(assert (=> b!56673 (= lt!89106 (validateOffsetBitsIneqLemma!0 (_2!2682 lt!88409) (_2!2682 lt!89112) lt!89100 lt!89123))))

(assert (=> b!56673 (validate_offset_bits!1 ((_ sign_extend 32) (size!1185 (buf!1554 (_2!2682 lt!89112)))) ((_ sign_extend 32) (currentByte!3148 (_2!2682 lt!89112))) ((_ sign_extend 32) (currentBit!3143 (_2!2682 lt!89112))) (bvsub lt!89100 lt!89123))))

(declare-fun lt!89122 () Unit!3897)

(assert (=> b!56673 (= lt!89122 lt!89106)))

(declare-fun lt!89102 () tuple2!5144)

(assert (=> b!56673 (= lt!89102 call!735)))

(declare-fun lt!89140 () (_ BitVec 64))

(assert (=> b!56673 (= lt!89140 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!89104 () Unit!3897)

(assert (=> b!56673 (= lt!89104 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2682 lt!88409) (buf!1554 (_2!2682 lt!89112)) lt!89140))))

(assert (=> b!56673 (validate_offset_bits!1 ((_ sign_extend 32) (size!1185 (buf!1554 (_2!2682 lt!89112)))) ((_ sign_extend 32) (currentByte!3148 (_2!2682 lt!88409))) ((_ sign_extend 32) (currentBit!3143 (_2!2682 lt!88409))) lt!89140)))

(declare-fun lt!89115 () Unit!3897)

(assert (=> b!56673 (= lt!89115 lt!89104)))

(assert (=> b!56673 (= (head!423 (byteArrayBitContentToList!0 (_2!2682 lt!89112) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!423 (bitStreamReadBitsIntoList!0 (_2!2682 lt!89112) (_1!2683 lt!89102) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!89135 () Unit!3897)

(declare-fun Unit!3907 () Unit!3897)

(assert (=> b!56673 (= lt!89135 Unit!3907)))

(assert (=> b!56673 (= lt!89098 (appendBitsMSBFirstLoop!0 (_2!2682 lt!89112) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!89138 () Unit!3897)

(assert (=> b!56673 (= lt!89138 (lemmaIsPrefixTransitive!0 (_2!2682 lt!88409) (_2!2682 lt!89112) (_2!2682 lt!89098)))))

(assert (=> b!56673 (isPrefixOf!0 (_2!2682 lt!88409) (_2!2682 lt!89098))))

(declare-fun lt!89110 () Unit!3897)

(assert (=> b!56673 (= lt!89110 lt!89138)))

(assert (=> b!56673 (= (size!1185 (buf!1554 (_2!2682 lt!89098))) (size!1185 (buf!1554 (_2!2682 lt!88409))))))

(declare-fun lt!89117 () Unit!3897)

(declare-fun Unit!3908 () Unit!3897)

(assert (=> b!56673 (= lt!89117 Unit!3908)))

(assert (=> b!56673 (= (bitIndex!0 (size!1185 (buf!1554 (_2!2682 lt!89098))) (currentByte!3148 (_2!2682 lt!89098)) (currentBit!3143 (_2!2682 lt!89098))) (bvsub (bvadd (bitIndex!0 (size!1185 (buf!1554 (_2!2682 lt!88409))) (currentByte!3148 (_2!2682 lt!88409)) (currentBit!3143 (_2!2682 lt!88409))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!89107 () Unit!3897)

(declare-fun Unit!3909 () Unit!3897)

(assert (=> b!56673 (= lt!89107 Unit!3909)))

(assert (=> b!56673 (= (bitIndex!0 (size!1185 (buf!1554 (_2!2682 lt!89098))) (currentByte!3148 (_2!2682 lt!89098)) (currentBit!3143 (_2!2682 lt!89098))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1185 (buf!1554 (_2!2682 lt!89112))) (currentByte!3148 (_2!2682 lt!89112)) (currentBit!3143 (_2!2682 lt!89112))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!89124 () Unit!3897)

(declare-fun Unit!3910 () Unit!3897)

(assert (=> b!56673 (= lt!89124 Unit!3910)))

(declare-fun lt!89125 () tuple2!5144)

(assert (=> b!56673 (= lt!89125 (reader!0 (_2!2682 lt!88409) (_2!2682 lt!89098)))))

(declare-fun lt!89139 () (_ BitVec 64))

(assert (=> b!56673 (= lt!89139 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!89126 () Unit!3897)

(assert (=> b!56673 (= lt!89126 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2682 lt!88409) (buf!1554 (_2!2682 lt!89098)) lt!89139))))

(assert (=> b!56673 (validate_offset_bits!1 ((_ sign_extend 32) (size!1185 (buf!1554 (_2!2682 lt!89098)))) ((_ sign_extend 32) (currentByte!3148 (_2!2682 lt!88409))) ((_ sign_extend 32) (currentBit!3143 (_2!2682 lt!88409))) lt!89139)))

(declare-fun lt!89137 () Unit!3897)

(assert (=> b!56673 (= lt!89137 lt!89126)))

(declare-fun lt!89111 () tuple2!5144)

(assert (=> b!56673 (= lt!89111 (reader!0 (_2!2682 lt!89112) (_2!2682 lt!89098)))))

(declare-fun lt!89099 () (_ BitVec 64))

(assert (=> b!56673 (= lt!89099 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!89120 () Unit!3897)

(assert (=> b!56673 (= lt!89120 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2682 lt!89112) (buf!1554 (_2!2682 lt!89098)) lt!89099))))

(assert (=> b!56673 (validate_offset_bits!1 ((_ sign_extend 32) (size!1185 (buf!1554 (_2!2682 lt!89098)))) ((_ sign_extend 32) (currentByte!3148 (_2!2682 lt!89112))) ((_ sign_extend 32) (currentBit!3143 (_2!2682 lt!89112))) lt!89099)))

(declare-fun lt!89105 () Unit!3897)

(assert (=> b!56673 (= lt!89105 lt!89120)))

(declare-fun lt!89114 () List!604)

(assert (=> b!56673 (= lt!89114 (byteArrayBitContentToList!0 (_2!2682 lt!89098) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!89113 () List!604)

(assert (=> b!56673 (= lt!89113 (byteArrayBitContentToList!0 (_2!2682 lt!89098) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!89129 () List!604)

(assert (=> b!56673 (= lt!89129 (bitStreamReadBitsIntoList!0 (_2!2682 lt!89098) (_1!2683 lt!89125) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!89101 () List!604)

(assert (=> b!56673 (= lt!89101 (bitStreamReadBitsIntoList!0 (_2!2682 lt!89098) (_1!2683 lt!89111) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!89133 () (_ BitVec 64))

(assert (=> b!56673 (= lt!89133 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!89116 () Unit!3897)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2058 BitStream!2058 BitStream!2058 BitStream!2058 (_ BitVec 64) List!604) Unit!3897)

(assert (=> b!56673 (= lt!89116 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2682 lt!89098) (_2!2682 lt!89098) (_1!2683 lt!89125) (_1!2683 lt!89111) lt!89133 lt!89129))))

(declare-fun tail!270 (List!604) List!604)

(assert (=> b!56673 (= (bitStreamReadBitsIntoList!0 (_2!2682 lt!89098) (_1!2683 lt!89111) (bvsub lt!89133 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!270 lt!89129))))

(declare-fun lt!89134 () Unit!3897)

(assert (=> b!56673 (= lt!89134 lt!89116)))

(declare-fun lt!89108 () Unit!3897)

(declare-fun lt!89132 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2607 array!2607 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3897)

(assert (=> b!56673 (= lt!89108 (arrayBitRangesEqImpliesEq!0 (buf!1554 (_2!2682 lt!89112)) (buf!1554 (_2!2682 lt!89098)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!89132 (bitIndex!0 (size!1185 (buf!1554 (_2!2682 lt!89112))) (currentByte!3148 (_2!2682 lt!89112)) (currentBit!3143 (_2!2682 lt!89112)))))))

(declare-fun bitAt!0 (array!2607 (_ BitVec 64)) Bool)

(assert (=> b!56673 (= (bitAt!0 (buf!1554 (_2!2682 lt!89112)) lt!89132) (bitAt!0 (buf!1554 (_2!2682 lt!89098)) lt!89132))))

(declare-fun lt!89131 () Unit!3897)

(assert (=> b!56673 (= lt!89131 lt!89108)))

(declare-fun b!56674 () Bool)

(declare-fun res!47126 () Bool)

(assert (=> b!56674 (=> (not res!47126) (not e!37675))))

(assert (=> b!56674 (= res!47126 (invariant!0 (currentBit!3143 (_2!2682 lt!89119)) (currentByte!3148 (_2!2682 lt!89119)) (size!1185 (buf!1554 (_2!2682 lt!89119)))))))

(declare-fun b!56675 () Bool)

(declare-fun res!47128 () Bool)

(assert (=> b!56675 (=> (not res!47128) (not e!37675))))

(assert (=> b!56675 (= res!47128 (= (size!1185 (buf!1554 (_2!2682 lt!88409))) (size!1185 (buf!1554 (_2!2682 lt!89119)))))))

(declare-fun d!18008 () Bool)

(assert (=> d!18008 e!37675))

(declare-fun res!47127 () Bool)

(assert (=> d!18008 (=> (not res!47127) (not e!37675))))

(declare-fun lt!89130 () (_ BitVec 64))

(assert (=> d!18008 (= res!47127 (= (bitIndex!0 (size!1185 (buf!1554 (_2!2682 lt!89119))) (currentByte!3148 (_2!2682 lt!89119)) (currentBit!3143 (_2!2682 lt!89119))) (bvsub lt!89130 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!18008 (or (= (bvand lt!89130 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!89130 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!89130 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!89121 () (_ BitVec 64))

(assert (=> d!18008 (= lt!89130 (bvadd lt!89121 to!314))))

(assert (=> d!18008 (or (not (= (bvand lt!89121 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!89121 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!89121 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18008 (= lt!89121 (bitIndex!0 (size!1185 (buf!1554 (_2!2682 lt!88409))) (currentByte!3148 (_2!2682 lt!88409)) (currentBit!3143 (_2!2682 lt!88409))))))

(assert (=> d!18008 (= lt!89119 e!37676)))

(assert (=> d!18008 (= c!4082 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!89127 () Unit!3897)

(declare-fun lt!89118 () Unit!3897)

(assert (=> d!18008 (= lt!89127 lt!89118)))

(assert (=> d!18008 (isPrefixOf!0 (_2!2682 lt!88409) (_2!2682 lt!88409))))

(assert (=> d!18008 (= lt!89118 (lemmaIsPrefixRefl!0 (_2!2682 lt!88409)))))

(assert (=> d!18008 (= lt!89132 (bitIndex!0 (size!1185 (buf!1554 (_2!2682 lt!88409))) (currentByte!3148 (_2!2682 lt!88409)) (currentBit!3143 (_2!2682 lt!88409))))))

(assert (=> d!18008 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!18008 (= (appendBitsMSBFirstLoop!0 (_2!2682 lt!88409) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!89119)))

(declare-fun b!56676 () Bool)

(declare-fun lt!89128 () tuple2!5144)

(assert (=> b!56676 (= e!37675 (= (bitStreamReadBitsIntoList!0 (_2!2682 lt!89119) (_1!2683 lt!89128) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2682 lt!89119) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!56676 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!56676 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!89136 () Unit!3897)

(declare-fun lt!89103 () Unit!3897)

(assert (=> b!56676 (= lt!89136 lt!89103)))

(assert (=> b!56676 (validate_offset_bits!1 ((_ sign_extend 32) (size!1185 (buf!1554 (_2!2682 lt!89119)))) ((_ sign_extend 32) (currentByte!3148 (_2!2682 lt!88409))) ((_ sign_extend 32) (currentBit!3143 (_2!2682 lt!88409))) lt!89109)))

(assert (=> b!56676 (= lt!89103 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2682 lt!88409) (buf!1554 (_2!2682 lt!89119)) lt!89109))))

(assert (=> b!56676 e!37677))

(declare-fun res!47129 () Bool)

(assert (=> b!56676 (=> (not res!47129) (not e!37677))))

(assert (=> b!56676 (= res!47129 (and (= (size!1185 (buf!1554 (_2!2682 lt!88409))) (size!1185 (buf!1554 (_2!2682 lt!89119)))) (bvsge lt!89109 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!56676 (= lt!89109 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!56676 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!56676 (= lt!89128 (reader!0 (_2!2682 lt!88409) (_2!2682 lt!89119)))))

(declare-fun b!56677 () Bool)

(declare-fun res!47125 () Bool)

(assert (=> b!56677 (=> (not res!47125) (not e!37675))))

(assert (=> b!56677 (= res!47125 (= (size!1185 (buf!1554 (_2!2682 lt!89119))) (size!1185 (buf!1554 (_2!2682 lt!88409)))))))

(assert (= (and d!18008 c!4082) b!56673))

(assert (= (and d!18008 (not c!4082)) b!56671))

(assert (= (or b!56673 b!56671) bm!732))

(assert (= (and d!18008 res!47127) b!56674))

(assert (= (and b!56674 res!47126) b!56675))

(assert (= (and b!56675 res!47128) b!56670))

(assert (= (and b!56670 res!47130) b!56677))

(assert (= (and b!56677 res!47125) b!56676))

(assert (= (and b!56676 res!47129) b!56672))

(declare-fun m!89257 () Bool)

(assert (=> b!56673 m!89257))

(declare-fun m!89259 () Bool)

(assert (=> b!56673 m!89259))

(declare-fun m!89261 () Bool)

(assert (=> b!56673 m!89261))

(declare-fun m!89263 () Bool)

(assert (=> b!56673 m!89263))

(declare-fun m!89265 () Bool)

(assert (=> b!56673 m!89265))

(assert (=> b!56673 m!88881))

(declare-fun m!89267 () Bool)

(assert (=> b!56673 m!89267))

(declare-fun m!89269 () Bool)

(assert (=> b!56673 m!89269))

(declare-fun m!89271 () Bool)

(assert (=> b!56673 m!89271))

(assert (=> b!56673 m!89267))

(declare-fun m!89273 () Bool)

(assert (=> b!56673 m!89273))

(declare-fun m!89275 () Bool)

(assert (=> b!56673 m!89275))

(declare-fun m!89277 () Bool)

(assert (=> b!56673 m!89277))

(declare-fun m!89279 () Bool)

(assert (=> b!56673 m!89279))

(declare-fun m!89281 () Bool)

(assert (=> b!56673 m!89281))

(declare-fun m!89283 () Bool)

(assert (=> b!56673 m!89283))

(declare-fun m!89285 () Bool)

(assert (=> b!56673 m!89285))

(declare-fun m!89287 () Bool)

(assert (=> b!56673 m!89287))

(declare-fun m!89289 () Bool)

(assert (=> b!56673 m!89289))

(declare-fun m!89291 () Bool)

(assert (=> b!56673 m!89291))

(declare-fun m!89293 () Bool)

(assert (=> b!56673 m!89293))

(declare-fun m!89295 () Bool)

(assert (=> b!56673 m!89295))

(declare-fun m!89297 () Bool)

(assert (=> b!56673 m!89297))

(declare-fun m!89299 () Bool)

(assert (=> b!56673 m!89299))

(declare-fun m!89301 () Bool)

(assert (=> b!56673 m!89301))

(declare-fun m!89303 () Bool)

(assert (=> b!56673 m!89303))

(declare-fun m!89305 () Bool)

(assert (=> b!56673 m!89305))

(assert (=> b!56673 m!89261))

(declare-fun m!89307 () Bool)

(assert (=> b!56673 m!89307))

(assert (=> b!56673 m!89263))

(declare-fun m!89309 () Bool)

(assert (=> b!56673 m!89309))

(declare-fun m!89311 () Bool)

(assert (=> b!56673 m!89311))

(declare-fun m!89313 () Bool)

(assert (=> b!56673 m!89313))

(declare-fun m!89315 () Bool)

(assert (=> b!56673 m!89315))

(assert (=> b!56673 m!89273))

(declare-fun m!89317 () Bool)

(assert (=> b!56673 m!89317))

(declare-fun m!89319 () Bool)

(assert (=> b!56672 m!89319))

(declare-fun m!89321 () Bool)

(assert (=> b!56670 m!89321))

(declare-fun m!89323 () Bool)

(assert (=> b!56671 m!89323))

(declare-fun m!89325 () Bool)

(assert (=> b!56671 m!89325))

(declare-fun m!89327 () Bool)

(assert (=> b!56676 m!89327))

(declare-fun m!89329 () Bool)

(assert (=> b!56676 m!89329))

(declare-fun m!89331 () Bool)

(assert (=> b!56676 m!89331))

(declare-fun m!89333 () Bool)

(assert (=> b!56676 m!89333))

(declare-fun m!89335 () Bool)

(assert (=> b!56676 m!89335))

(declare-fun m!89337 () Bool)

(assert (=> d!18008 m!89337))

(assert (=> d!18008 m!88881))

(assert (=> d!18008 m!89057))

(assert (=> d!18008 m!89061))

(declare-fun m!89339 () Bool)

(assert (=> bm!732 m!89339))

(declare-fun m!89341 () Bool)

(assert (=> b!56674 m!89341))

(assert (=> b!56380 d!18008))

(check-sat (not b!56492) (not b!56531) (not b!56449) (not bm!732) (not b!56419) (not b!56503) (not b!56488) (not b!56446) (not b!56555) (not b!56495) (not b!56672) (not b!56532) (not d!17958) (not d!18008) (not b!56674) (not b!56489) (not d!17966) (not b!56535) (not b!56430) (not b!56670) (not b!56431) (not b!56534) (not b!56494) (not b!56493) (not d!18004) (not b!56553) (not d!17988) (not b!56491) (not b!56490) (not b!56673) (not b!56498) (not d!17956) (not d!17994) (not d!18006) (not b!56444) (not b!56496) (not d!17986) (not d!17962) (not d!17984) (not d!18000) (not d!17954) (not d!17964) (not b!56676) (not b!56671) (not b!56429) (not b!56505))
