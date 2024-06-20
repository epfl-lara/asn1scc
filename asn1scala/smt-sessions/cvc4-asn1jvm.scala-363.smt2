; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8396 () Bool)

(assert start!8396)

(declare-fun b!42047 () Bool)

(declare-fun res!35760 () Bool)

(declare-fun e!28017 () Bool)

(assert (=> b!42047 (=> res!35760 e!28017)))

(declare-datatypes ((array!2148 0))(
  ( (array!2149 (arr!1471 (Array (_ BitVec 32) (_ BitVec 8))) (size!972 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1688 0))(
  ( (BitStream!1689 (buf!1300 array!2148) (currentByte!2752 (_ BitVec 32)) (currentBit!2747 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1688)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!42047 (= res!35760 (not (invariant!0 (currentBit!2747 thiss!1379) (currentByte!2752 thiss!1379) (size!972 (buf!1300 thiss!1379)))))))

(declare-fun b!42048 () Bool)

(declare-fun e!28020 () Bool)

(assert (=> b!42048 (= e!28017 e!28020)))

(declare-fun res!35759 () Bool)

(assert (=> b!42048 (=> res!35759 e!28020)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!42048 (= res!35759 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((tuple2!4110 0))(
  ( (tuple2!4111 (_1!2145 BitStream!1688) (_2!2145 BitStream!1688)) )
))
(declare-fun lt!63219 () tuple2!4110)

(declare-datatypes ((tuple2!4112 0))(
  ( (tuple2!4113 (_1!2146 array!2148) (_2!2146 BitStream!1688)) )
))
(declare-fun lt!63220 () tuple2!4112)

(declare-fun readBits!0 (BitStream!1688 (_ BitVec 64)) tuple2!4112)

(assert (=> b!42048 (= lt!63220 (readBits!0 (_1!2145 lt!63219) (bvsub to!314 i!635)))))

(declare-fun reader!0 (BitStream!1688 BitStream!1688) tuple2!4110)

(assert (=> b!42048 (= lt!63219 (reader!0 thiss!1379 thiss!1379))))

(declare-fun b!42049 () Bool)

(declare-fun e!28019 () Bool)

(assert (=> b!42049 (= e!28019 (not e!28017))))

(declare-fun res!35761 () Bool)

(assert (=> b!42049 (=> res!35761 e!28017)))

(declare-fun lt!63218 () (_ BitVec 64))

(assert (=> b!42049 (= res!35761 (or (bvslt i!635 to!314) (not (= lt!63218 (bvsub (bvadd lt!63218 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1688 BitStream!1688) Bool)

(assert (=> b!42049 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2995 0))(
  ( (Unit!2996) )
))
(declare-fun lt!63217 () Unit!2995)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1688) Unit!2995)

(assert (=> b!42049 (= lt!63217 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!42049 (= lt!63218 (bitIndex!0 (size!972 (buf!1300 thiss!1379)) (currentByte!2752 thiss!1379) (currentBit!2747 thiss!1379)))))

(declare-fun b!42050 () Bool)

(declare-fun res!35762 () Bool)

(assert (=> b!42050 (=> (not res!35762) (not e!28019))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!42050 (= res!35762 (validate_offset_bits!1 ((_ sign_extend 32) (size!972 (buf!1300 thiss!1379))) ((_ sign_extend 32) (currentByte!2752 thiss!1379)) ((_ sign_extend 32) (currentBit!2747 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!35763 () Bool)

(assert (=> start!8396 (=> (not res!35763) (not e!28019))))

(declare-fun srcBuffer!2 () array!2148)

(assert (=> start!8396 (= res!35763 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!972 srcBuffer!2))))))))

(assert (=> start!8396 e!28019))

(assert (=> start!8396 true))

(declare-fun array_inv!897 (array!2148) Bool)

(assert (=> start!8396 (array_inv!897 srcBuffer!2)))

(declare-fun e!28018 () Bool)

(declare-fun inv!12 (BitStream!1688) Bool)

(assert (=> start!8396 (and (inv!12 thiss!1379) e!28018)))

(declare-fun b!42051 () Bool)

(assert (=> b!42051 (= e!28020 (validate_offset_bits!1 ((_ sign_extend 32) (size!972 (buf!1300 (_1!2145 lt!63219)))) ((_ sign_extend 32) (currentByte!2752 (_1!2145 lt!63219))) ((_ sign_extend 32) (currentBit!2747 (_1!2145 lt!63219))) (bvsub to!314 i!635)))))

(declare-fun lt!63216 () Unit!2995)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1688 array!2148 (_ BitVec 64)) Unit!2995)

(assert (=> b!42051 (= lt!63216 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1300 thiss!1379) (bvsub to!314 i!635)))))

(declare-fun checkByteArrayBitContent!0 (BitStream!1688 array!2148 array!2148 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!42051 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!2146 lt!63220) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!42052 () Bool)

(assert (=> b!42052 (= e!28018 (array_inv!897 (buf!1300 thiss!1379)))))

(assert (= (and start!8396 res!35763) b!42050))

(assert (= (and b!42050 res!35762) b!42049))

(assert (= (and b!42049 (not res!35761)) b!42047))

(assert (= (and b!42047 (not res!35760)) b!42048))

(assert (= (and b!42048 (not res!35759)) b!42051))

(assert (= start!8396 b!42052))

(declare-fun m!63881 () Bool)

(assert (=> b!42049 m!63881))

(declare-fun m!63883 () Bool)

(assert (=> b!42049 m!63883))

(declare-fun m!63885 () Bool)

(assert (=> b!42049 m!63885))

(declare-fun m!63887 () Bool)

(assert (=> b!42047 m!63887))

(declare-fun m!63889 () Bool)

(assert (=> b!42051 m!63889))

(declare-fun m!63891 () Bool)

(assert (=> b!42051 m!63891))

(declare-fun m!63893 () Bool)

(assert (=> b!42051 m!63893))

(declare-fun m!63895 () Bool)

(assert (=> b!42048 m!63895))

(declare-fun m!63897 () Bool)

(assert (=> b!42048 m!63897))

(declare-fun m!63899 () Bool)

(assert (=> b!42050 m!63899))

(declare-fun m!63901 () Bool)

(assert (=> start!8396 m!63901))

(declare-fun m!63903 () Bool)

(assert (=> start!8396 m!63903))

(declare-fun m!63905 () Bool)

(assert (=> b!42052 m!63905))

(push 1)

(assert (not start!8396))

(assert (not b!42052))

(assert (not b!42047))

(assert (not b!42051))

(assert (not b!42050))

(assert (not b!42048))

(assert (not b!42049))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!12196 () Bool)

(declare-fun res!35786 () Bool)

(declare-fun e!28038 () Bool)

(assert (=> d!12196 (=> (not res!35786) (not e!28038))))

(assert (=> d!12196 (= res!35786 (= (size!972 (buf!1300 thiss!1379)) (size!972 (buf!1300 thiss!1379))))))

(assert (=> d!12196 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!28038)))

(declare-fun b!42074 () Bool)

(declare-fun res!35787 () Bool)

(assert (=> b!42074 (=> (not res!35787) (not e!28038))))

(assert (=> b!42074 (= res!35787 (bvsle (bitIndex!0 (size!972 (buf!1300 thiss!1379)) (currentByte!2752 thiss!1379) (currentBit!2747 thiss!1379)) (bitIndex!0 (size!972 (buf!1300 thiss!1379)) (currentByte!2752 thiss!1379) (currentBit!2747 thiss!1379))))))

(declare-fun b!42075 () Bool)

(declare-fun e!28039 () Bool)

(assert (=> b!42075 (= e!28038 e!28039)))

(declare-fun res!35785 () Bool)

(assert (=> b!42075 (=> res!35785 e!28039)))

(assert (=> b!42075 (= res!35785 (= (size!972 (buf!1300 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!42076 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2148 array!2148 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!42076 (= e!28039 (arrayBitRangesEq!0 (buf!1300 thiss!1379) (buf!1300 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!972 (buf!1300 thiss!1379)) (currentByte!2752 thiss!1379) (currentBit!2747 thiss!1379))))))

(assert (= (and d!12196 res!35786) b!42074))

(assert (= (and b!42074 res!35787) b!42075))

(assert (= (and b!42075 (not res!35785)) b!42076))

(assert (=> b!42074 m!63885))

(assert (=> b!42074 m!63885))

(assert (=> b!42076 m!63885))

(assert (=> b!42076 m!63885))

(declare-fun m!63927 () Bool)

(assert (=> b!42076 m!63927))

(assert (=> b!42049 d!12196))

(declare-fun d!12202 () Bool)

(assert (=> d!12202 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!63247 () Unit!2995)

(declare-fun choose!11 (BitStream!1688) Unit!2995)

(assert (=> d!12202 (= lt!63247 (choose!11 thiss!1379))))

(assert (=> d!12202 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!63247)))

(declare-fun bs!3286 () Bool)

(assert (= bs!3286 d!12202))

(assert (=> bs!3286 m!63881))

(declare-fun m!63929 () Bool)

(assert (=> bs!3286 m!63929))

(assert (=> b!42049 d!12202))

(declare-fun d!12208 () Bool)

(declare-fun e!28047 () Bool)

(assert (=> d!12208 e!28047))

(declare-fun res!35808 () Bool)

(assert (=> d!12208 (=> (not res!35808) (not e!28047))))

(declare-fun lt!63283 () (_ BitVec 64))

(declare-fun lt!63278 () (_ BitVec 64))

(declare-fun lt!63282 () (_ BitVec 64))

(assert (=> d!12208 (= res!35808 (= lt!63278 (bvsub lt!63283 lt!63282)))))

(assert (=> d!12208 (or (= (bvand lt!63283 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!63282 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!63283 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!63283 lt!63282) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!12208 (= lt!63282 (remainingBits!0 ((_ sign_extend 32) (size!972 (buf!1300 thiss!1379))) ((_ sign_extend 32) (currentByte!2752 thiss!1379)) ((_ sign_extend 32) (currentBit!2747 thiss!1379))))))

(declare-fun lt!63279 () (_ BitVec 64))

(declare-fun lt!63281 () (_ BitVec 64))

(assert (=> d!12208 (= lt!63283 (bvmul lt!63279 lt!63281))))

(assert (=> d!12208 (or (= lt!63279 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!63281 (bvsdiv (bvmul lt!63279 lt!63281) lt!63279)))))

(assert (=> d!12208 (= lt!63281 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!12208 (= lt!63279 ((_ sign_extend 32) (size!972 (buf!1300 thiss!1379))))))

(assert (=> d!12208 (= lt!63278 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2752 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2747 thiss!1379))))))

(assert (=> d!12208 (invariant!0 (currentBit!2747 thiss!1379) (currentByte!2752 thiss!1379) (size!972 (buf!1300 thiss!1379)))))

(assert (=> d!12208 (= (bitIndex!0 (size!972 (buf!1300 thiss!1379)) (currentByte!2752 thiss!1379) (currentBit!2747 thiss!1379)) lt!63278)))

(declare-fun b!42097 () Bool)

(declare-fun res!35809 () Bool)

(assert (=> b!42097 (=> (not res!35809) (not e!28047))))

(assert (=> b!42097 (= res!35809 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!63278))))

(declare-fun b!42098 () Bool)

(declare-fun lt!63280 () (_ BitVec 64))

(assert (=> b!42098 (= e!28047 (bvsle lt!63278 (bvmul lt!63280 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!42098 (or (= lt!63280 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!63280 #b0000000000000000000000000000000000000000000000000000000000001000) lt!63280)))))

(assert (=> b!42098 (= lt!63280 ((_ sign_extend 32) (size!972 (buf!1300 thiss!1379))))))

(assert (= (and d!12208 res!35808) b!42097))

(assert (= (and b!42097 res!35809) b!42098))

(declare-fun m!63931 () Bool)

(assert (=> d!12208 m!63931))

(assert (=> d!12208 m!63887))

(assert (=> b!42049 d!12208))

(declare-fun d!12210 () Bool)

(assert (=> d!12210 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!972 (buf!1300 thiss!1379))) ((_ sign_extend 32) (currentByte!2752 thiss!1379)) ((_ sign_extend 32) (currentBit!2747 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!972 (buf!1300 thiss!1379))) ((_ sign_extend 32) (currentByte!2752 thiss!1379)) ((_ sign_extend 32) (currentBit!2747 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3287 () Bool)

(assert (= bs!3287 d!12210))

(assert (=> bs!3287 m!63931))

(assert (=> b!42050 d!12210))

(declare-fun d!12212 () Bool)

(assert (=> d!12212 (= (array_inv!897 srcBuffer!2) (bvsge (size!972 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!8396 d!12212))

(declare-fun d!12214 () Bool)

(assert (=> d!12214 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2747 thiss!1379) (currentByte!2752 thiss!1379) (size!972 (buf!1300 thiss!1379))))))

(declare-fun bs!3288 () Bool)

(assert (= bs!3288 d!12214))

(assert (=> bs!3288 m!63887))

(assert (=> start!8396 d!12214))

(declare-fun d!12218 () Bool)

(assert (=> d!12218 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!972 (buf!1300 (_1!2145 lt!63219)))) ((_ sign_extend 32) (currentByte!2752 (_1!2145 lt!63219))) ((_ sign_extend 32) (currentBit!2747 (_1!2145 lt!63219))) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!972 (buf!1300 (_1!2145 lt!63219)))) ((_ sign_extend 32) (currentByte!2752 (_1!2145 lt!63219))) ((_ sign_extend 32) (currentBit!2747 (_1!2145 lt!63219)))) (bvsub to!314 i!635)))))

(declare-fun bs!3289 () Bool)

(assert (= bs!3289 d!12218))

(declare-fun m!63945 () Bool)

(assert (=> bs!3289 m!63945))

(assert (=> b!42051 d!12218))

(declare-fun d!12220 () Bool)

(assert (=> d!12220 (validate_offset_bits!1 ((_ sign_extend 32) (size!972 (buf!1300 thiss!1379))) ((_ sign_extend 32) (currentByte!2752 thiss!1379)) ((_ sign_extend 32) (currentBit!2747 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!63295 () Unit!2995)

(declare-fun choose!9 (BitStream!1688 array!2148 (_ BitVec 64) BitStream!1688) Unit!2995)

(assert (=> d!12220 (= lt!63295 (choose!9 thiss!1379 (buf!1300 thiss!1379) (bvsub to!314 i!635) (BitStream!1689 (buf!1300 thiss!1379) (currentByte!2752 thiss!1379) (currentBit!2747 thiss!1379))))))

(assert (=> d!12220 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1300 thiss!1379) (bvsub to!314 i!635)) lt!63295)))

(declare-fun bs!3290 () Bool)

(assert (= bs!3290 d!12220))

(assert (=> bs!3290 m!63899))

(declare-fun m!63947 () Bool)

(assert (=> bs!3290 m!63947))

(assert (=> b!42051 d!12220))

(declare-fun d!12222 () Bool)

(declare-fun res!35819 () Bool)

(declare-fun e!28053 () Bool)

(assert (=> d!12222 (=> res!35819 e!28053)))

(assert (=> d!12222 (= res!35819 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!12222 (= (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!2146 lt!63220) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) e!28053)))

(declare-fun b!42108 () Bool)

(declare-fun e!28054 () Bool)

(assert (=> b!42108 (= e!28053 e!28054)))

(declare-fun res!35820 () Bool)

(assert (=> b!42108 (=> (not res!35820) (not e!28054))))

(assert (=> b!42108 (= res!35820 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!1471 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!1471 (_1!2146 lt!63220)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!42109 () Bool)

(assert (=> b!42109 (= e!28054 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!2146 lt!63220) (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!12222 (not res!35819)) b!42108))

(assert (= (and b!42108 res!35820) b!42109))

(declare-fun m!63949 () Bool)

(assert (=> b!42108 m!63949))

(declare-fun m!63951 () Bool)

(assert (=> b!42108 m!63951))

(declare-fun m!63953 () Bool)

(assert (=> b!42108 m!63953))

(declare-fun m!63955 () Bool)

(assert (=> b!42108 m!63955))

(declare-fun m!63957 () Bool)

(assert (=> b!42109 m!63957))

(assert (=> b!42051 d!12222))

(declare-fun d!12224 () Bool)

(assert (=> d!12224 (= (array_inv!897 (buf!1300 thiss!1379)) (bvsge (size!972 (buf!1300 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!42052 d!12224))

(declare-fun d!12226 () Bool)

(assert (=> d!12226 (= (invariant!0 (currentBit!2747 thiss!1379) (currentByte!2752 thiss!1379) (size!972 (buf!1300 thiss!1379))) (and (bvsge (currentBit!2747 thiss!1379) #b00000000000000000000000000000000) (bvslt (currentBit!2747 thiss!1379) #b00000000000000000000000000001000) (bvsge (currentByte!2752 thiss!1379) #b00000000000000000000000000000000) (or (bvslt (currentByte!2752 thiss!1379) (size!972 (buf!1300 thiss!1379))) (and (= (currentBit!2747 thiss!1379) #b00000000000000000000000000000000) (= (currentByte!2752 thiss!1379) (size!972 (buf!1300 thiss!1379)))))))))

(assert (=> b!42047 d!12226))

(declare-fun d!12228 () Bool)

(declare-fun e!28081 () Bool)

(assert (=> d!12228 e!28081))

(declare-fun res!35883 () Bool)

(assert (=> d!12228 (=> (not res!35883) (not e!28081))))

(declare-fun lt!63485 () tuple2!4112)

(assert (=> d!12228 (= res!35883 (= (buf!1300 (_2!2146 lt!63485)) (buf!1300 (_1!2145 lt!63219))))))

(declare-datatypes ((tuple3!170 0))(
  ( (tuple3!171 (_1!2149 Unit!2995) (_2!2149 BitStream!1688) (_3!92 array!2148)) )
))
(declare-fun lt!63490 () tuple3!170)

(assert (=> d!12228 (= lt!63485 (tuple2!4113 (_3!92 lt!63490) (_2!2149 lt!63490)))))

(declare-fun readBitsLoop!0 (BitStream!1688 (_ BitVec 64) array!2148 (_ BitVec 64) (_ BitVec 64)) tuple3!170)

(assert (=> d!12228 (= lt!63490 (readBitsLoop!0 (_1!2145 lt!63219) (bvsub to!314 i!635) (array!2149 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)))))

(assert (=> d!12228 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) (bvsle (bvsub to!314 i!635) #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!12228 (= (readBits!0 (_1!2145 lt!63219) (bvsub to!314 i!635)) lt!63485)))

(declare-fun b!42180 () Bool)

(declare-datatypes ((List!491 0))(
  ( (Nil!488) (Cons!487 (h!606 Bool) (t!1241 List!491)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!1688 array!2148 (_ BitVec 64) (_ BitVec 64)) List!491)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1688 BitStream!1688 (_ BitVec 64)) List!491)

(assert (=> b!42180 (= e!28081 (= (byteArrayBitContentToList!0 (_2!2146 lt!63485) (_1!2146 lt!63485) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) (bitStreamReadBitsIntoList!0 (_2!2146 lt!63485) (_1!2145 lt!63219) (bvsub to!314 i!635))))))

(declare-fun b!42181 () Bool)

(declare-fun res!35880 () Bool)

(assert (=> b!42181 (=> (not res!35880) (not e!28081))))

(assert (=> b!42181 (= res!35880 (invariant!0 (currentBit!2747 (_2!2146 lt!63485)) (currentByte!2752 (_2!2146 lt!63485)) (size!972 (buf!1300 (_2!2146 lt!63485)))))))

(declare-fun b!42182 () Bool)

(declare-fun res!35882 () Bool)

(assert (=> b!42182 (=> (not res!35882) (not e!28081))))

(declare-fun lt!63486 () (_ BitVec 64))

(assert (=> b!42182 (= res!35882 (= (bvadd lt!63486 (bvsub to!314 i!635)) (bitIndex!0 (size!972 (buf!1300 (_2!2146 lt!63485))) (currentByte!2752 (_2!2146 lt!63485)) (currentBit!2747 (_2!2146 lt!63485)))))))

(assert (=> b!42182 (or (not (= (bvand lt!63486 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!63486 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!63486 (bvsub to!314 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!42182 (= lt!63486 (bitIndex!0 (size!972 (buf!1300 (_1!2145 lt!63219))) (currentByte!2752 (_1!2145 lt!63219)) (currentBit!2747 (_1!2145 lt!63219))))))

(declare-fun b!42183 () Bool)

(declare-fun res!35881 () Bool)

(assert (=> b!42183 (=> (not res!35881) (not e!28081))))

(declare-fun lt!63488 () (_ BitVec 64))

(assert (=> b!42183 (= res!35881 (= (size!972 (_1!2146 lt!63485)) ((_ extract 31 0) lt!63488)))))

(assert (=> b!42183 (and (bvslt lt!63488 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!63488 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!63489 () (_ BitVec 64))

(declare-fun lt!63483 () (_ BitVec 64))

(assert (=> b!42183 (= lt!63488 (bvsdiv lt!63489 lt!63483))))

(assert (=> b!42183 (and (not (= lt!63483 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!63489 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!63483 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!42183 (= lt!63483 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!63487 () (_ BitVec 64))

(declare-fun lt!63484 () (_ BitVec 64))

(assert (=> b!42183 (= lt!63489 (bvsub lt!63487 lt!63484))))

(assert (=> b!42183 (or (= (bvand lt!63487 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!63484 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!63487 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!63487 lt!63484) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!42183 (= lt!63484 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!63482 () (_ BitVec 64))

(assert (=> b!42183 (= lt!63487 (bvadd (bvsub to!314 i!635) lt!63482))))

(assert (=> b!42183 (or (not (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!63482 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd (bvsub to!314 i!635) lt!63482) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!42183 (= lt!63482 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!42184 () Bool)

(declare-fun res!35879 () Bool)

(assert (=> b!42184 (=> (not res!35879) (not e!28081))))

(assert (=> b!42184 (= res!35879 (bvsle (currentByte!2752 (_1!2145 lt!63219)) (currentByte!2752 (_2!2146 lt!63485))))))

(assert (= (and d!12228 res!35883) b!42182))

(assert (= (and b!42182 res!35882) b!42181))

(assert (= (and b!42181 res!35880) b!42183))

(assert (= (and b!42183 res!35881) b!42184))

(assert (= (and b!42184 res!35879) b!42180))

(declare-fun m!64019 () Bool)

(assert (=> d!12228 m!64019))

(declare-fun m!64021 () Bool)

(assert (=> b!42180 m!64021))

(declare-fun m!64023 () Bool)

(assert (=> b!42180 m!64023))

(declare-fun m!64025 () Bool)

(assert (=> b!42181 m!64025))

(declare-fun m!64027 () Bool)

(assert (=> b!42182 m!64027))

(declare-fun m!64029 () Bool)

(assert (=> b!42182 m!64029))

(assert (=> b!42048 d!12228))

(declare-fun e!28093 () Bool)

(declare-fun lt!63538 () (_ BitVec 64))

(declare-fun lt!63549 () tuple2!4110)

(declare-fun lt!63540 () (_ BitVec 64))

(declare-fun b!42201 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!1688 (_ BitVec 64)) BitStream!1688)

(assert (=> b!42201 (= e!28093 (= (_1!2145 lt!63549) (withMovedBitIndex!0 (_2!2145 lt!63549) (bvsub lt!63540 lt!63538))))))

(assert (=> b!42201 (or (= (bvand lt!63540 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!63538 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!63540 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!63540 lt!63538) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!42201 (= lt!63538 (bitIndex!0 (size!972 (buf!1300 thiss!1379)) (currentByte!2752 thiss!1379) (currentBit!2747 thiss!1379)))))

(assert (=> b!42201 (= lt!63540 (bitIndex!0 (size!972 (buf!1300 thiss!1379)) (currentByte!2752 thiss!1379) (currentBit!2747 thiss!1379)))))

(declare-fun d!12254 () Bool)

(assert (=> d!12254 e!28093))

(declare-fun res!35898 () Bool)

(assert (=> d!12254 (=> (not res!35898) (not e!28093))))

(assert (=> d!12254 (= res!35898 (isPrefixOf!0 (_1!2145 lt!63549) (_2!2145 lt!63549)))))

(declare-fun lt!63546 () BitStream!1688)

(assert (=> d!12254 (= lt!63549 (tuple2!4111 lt!63546 thiss!1379))))

(declare-fun lt!63536 () Unit!2995)

(declare-fun lt!63541 () Unit!2995)

(assert (=> d!12254 (= lt!63536 lt!63541)))

(assert (=> d!12254 (isPrefixOf!0 lt!63546 thiss!1379)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1688 BitStream!1688 BitStream!1688) Unit!2995)

(assert (=> d!12254 (= lt!63541 (lemmaIsPrefixTransitive!0 lt!63546 thiss!1379 thiss!1379))))

(declare-fun lt!63547 () Unit!2995)

(declare-fun lt!63545 () Unit!2995)

(assert (=> d!12254 (= lt!63547 lt!63545)))

(assert (=> d!12254 (isPrefixOf!0 lt!63546 thiss!1379)))

(assert (=> d!12254 (= lt!63545 (lemmaIsPrefixTransitive!0 lt!63546 thiss!1379 thiss!1379))))

(declare-fun lt!63551 () Unit!2995)

(declare-fun e!28092 () Unit!2995)

(assert (=> d!12254 (= lt!63551 e!28092)))

(declare-fun c!2778 () Bool)

(assert (=> d!12254 (= c!2778 (not (= (size!972 (buf!1300 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!63550 () Unit!2995)

(declare-fun lt!63535 () Unit!2995)

(assert (=> d!12254 (= lt!63550 lt!63535)))

(assert (=> d!12254 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!12254 (= lt!63535 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!63548 () Unit!2995)

(declare-fun lt!63539 () Unit!2995)

(assert (=> d!12254 (= lt!63548 lt!63539)))

(assert (=> d!12254 (= lt!63539 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!63552 () Unit!2995)

(declare-fun lt!63543 () Unit!2995)

(assert (=> d!12254 (= lt!63552 lt!63543)))

(assert (=> d!12254 (isPrefixOf!0 lt!63546 lt!63546)))

(assert (=> d!12254 (= lt!63543 (lemmaIsPrefixRefl!0 lt!63546))))

(declare-fun lt!63544 () Unit!2995)

(declare-fun lt!63534 () Unit!2995)

(assert (=> d!12254 (= lt!63544 lt!63534)))

(assert (=> d!12254 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!12254 (= lt!63534 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!12254 (= lt!63546 (BitStream!1689 (buf!1300 thiss!1379) (currentByte!2752 thiss!1379) (currentBit!2747 thiss!1379)))))

(assert (=> d!12254 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!12254 (= (reader!0 thiss!1379 thiss!1379) lt!63549)))

(declare-fun b!42202 () Bool)

(declare-fun res!35896 () Bool)

(assert (=> b!42202 (=> (not res!35896) (not e!28093))))

(assert (=> b!42202 (= res!35896 (isPrefixOf!0 (_1!2145 lt!63549) thiss!1379))))

(declare-fun b!42203 () Bool)

(declare-fun res!35897 () Bool)

(assert (=> b!42203 (=> (not res!35897) (not e!28093))))

(assert (=> b!42203 (= res!35897 (isPrefixOf!0 (_2!2145 lt!63549) thiss!1379))))

(declare-fun b!42204 () Bool)

(declare-fun lt!63553 () Unit!2995)

(assert (=> b!42204 (= e!28092 lt!63553)))

(declare-fun lt!63542 () (_ BitVec 64))

(assert (=> b!42204 (= lt!63542 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!63537 () (_ BitVec 64))

(assert (=> b!42204 (= lt!63537 (bitIndex!0 (size!972 (buf!1300 thiss!1379)) (currentByte!2752 thiss!1379) (currentBit!2747 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2148 array!2148 (_ BitVec 64) (_ BitVec 64)) Unit!2995)

(assert (=> b!42204 (= lt!63553 (arrayBitRangesEqSymmetric!0 (buf!1300 thiss!1379) (buf!1300 thiss!1379) lt!63542 lt!63537))))

(assert (=> b!42204 (arrayBitRangesEq!0 (buf!1300 thiss!1379) (buf!1300 thiss!1379) lt!63542 lt!63537)))

(declare-fun b!42205 () Bool)

(declare-fun Unit!2999 () Unit!2995)

(assert (=> b!42205 (= e!28092 Unit!2999)))

(assert (= (and d!12254 c!2778) b!42204))

(assert (= (and d!12254 (not c!2778)) b!42205))

(assert (= (and d!12254 res!35898) b!42202))

(assert (= (and b!42202 res!35896) b!42203))

(assert (= (and b!42203 res!35897) b!42201))

(assert (=> d!12254 m!63881))

(declare-fun m!64043 () Bool)

(assert (=> d!12254 m!64043))

(assert (=> d!12254 m!63881))

(declare-fun m!64045 () Bool)

(assert (=> d!12254 m!64045))

(assert (=> d!12254 m!63883))

(assert (=> d!12254 m!63881))

(assert (=> d!12254 m!63883))

(declare-fun m!64047 () Bool)

(assert (=> d!12254 m!64047))

(declare-fun m!64049 () Bool)

(assert (=> d!12254 m!64049))

(declare-fun m!64051 () Bool)

(assert (=> d!12254 m!64051))

(assert (=> d!12254 m!64043))

(assert (=> b!42204 m!63885))

(declare-fun m!64053 () Bool)

(assert (=> b!42204 m!64053))

(declare-fun m!64055 () Bool)

(assert (=> b!42204 m!64055))

(declare-fun m!64057 () Bool)

(assert (=> b!42203 m!64057))

(declare-fun m!64059 () Bool)

(assert (=> b!42202 m!64059))

(declare-fun m!64061 () Bool)

(assert (=> b!42201 m!64061))

(assert (=> b!42201 m!63885))

(assert (=> b!42201 m!63885))

(assert (=> b!42048 d!12254))

(push 1)

(assert (not b!42202))

(assert (not b!42181))

(assert (not d!12218))

(assert (not d!12254))

(assert (not d!12208))

(assert (not b!42109))

(assert (not b!42074))

(assert (not b!42182))

(assert (not d!12220))

(assert (not b!42201))

(assert (not d!12228))

(assert (not b!42180))

(assert (not b!42076))

(assert (not b!42204))

(assert (not b!42203))

(assert (not d!12210))

(assert (not d!12202))

(assert (not d!12214))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

