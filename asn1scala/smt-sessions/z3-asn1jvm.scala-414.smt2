; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10556 () Bool)

(assert start!10556)

(declare-fun b!52887 () Bool)

(declare-fun e!35224 () Bool)

(declare-fun e!35225 () Bool)

(assert (=> b!52887 (= e!35224 (not e!35225))))

(declare-fun res!44172 () Bool)

(assert (=> b!52887 (=> res!44172 e!35225)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!52887 (= res!44172 (bvsge i!635 to!314))))

(declare-datatypes ((array!2499 0))(
  ( (array!2500 (arr!1677 (Array (_ BitVec 32) (_ BitVec 8))) (size!1141 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1974 0))(
  ( (BitStream!1975 (buf!1491 array!2499) (currentByte!3046 (_ BitVec 32)) (currentBit!3041 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1974)

(declare-fun isPrefixOf!0 (BitStream!1974 BitStream!1974) Bool)

(assert (=> b!52887 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3686 0))(
  ( (Unit!3687) )
))
(declare-fun lt!81932 () Unit!3686)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1974) Unit!3686)

(assert (=> b!52887 (= lt!81932 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!81933 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52887 (= lt!81933 (bitIndex!0 (size!1141 (buf!1491 thiss!1379)) (currentByte!3046 thiss!1379) (currentBit!3041 thiss!1379)))))

(declare-fun b!52888 () Bool)

(declare-fun e!35227 () Bool)

(assert (=> b!52888 (= e!35225 e!35227)))

(declare-fun res!44175 () Bool)

(assert (=> b!52888 (=> res!44175 e!35227)))

(declare-datatypes ((tuple2!4814 0))(
  ( (tuple2!4815 (_1!2512 Unit!3686) (_2!2512 BitStream!1974)) )
))
(declare-fun lt!81930 () tuple2!4814)

(assert (=> b!52888 (= res!44175 (not (isPrefixOf!0 thiss!1379 (_2!2512 lt!81930))))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52888 (validate_offset_bits!1 ((_ sign_extend 32) (size!1141 (buf!1491 (_2!2512 lt!81930)))) ((_ sign_extend 32) (currentByte!3046 (_2!2512 lt!81930))) ((_ sign_extend 32) (currentBit!3041 (_2!2512 lt!81930))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!81934 () Unit!3686)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1974 BitStream!1974 (_ BitVec 64) (_ BitVec 64)) Unit!3686)

(assert (=> b!52888 (= lt!81934 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2512 lt!81930) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2499)

(declare-fun appendBitFromByte!0 (BitStream!1974 (_ BitVec 8) (_ BitVec 32)) tuple2!4814)

(assert (=> b!52888 (= lt!81930 (appendBitFromByte!0 thiss!1379 (select (arr!1677 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!52889 () Bool)

(declare-fun e!35223 () Bool)

(declare-fun array_inv!1046 (array!2499) Bool)

(assert (=> b!52889 (= e!35223 (array_inv!1046 (buf!1491 thiss!1379)))))

(declare-fun b!52890 () Bool)

(declare-fun res!44173 () Bool)

(assert (=> b!52890 (=> (not res!44173) (not e!35224))))

(assert (=> b!52890 (= res!44173 (validate_offset_bits!1 ((_ sign_extend 32) (size!1141 (buf!1491 thiss!1379))) ((_ sign_extend 32) (currentByte!3046 thiss!1379)) ((_ sign_extend 32) (currentBit!3041 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!44174 () Bool)

(assert (=> start!10556 (=> (not res!44174) (not e!35224))))

(assert (=> start!10556 (= res!44174 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1141 srcBuffer!2))))))))

(assert (=> start!10556 e!35224))

(assert (=> start!10556 true))

(assert (=> start!10556 (array_inv!1046 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1974) Bool)

(assert (=> start!10556 (and (inv!12 thiss!1379) e!35223)))

(declare-fun b!52891 () Bool)

(assert (=> b!52891 (= e!35227 (= (size!1141 (buf!1491 thiss!1379)) (size!1141 (buf!1491 (_2!2512 lt!81930)))))))

(declare-datatypes ((tuple2!4816 0))(
  ( (tuple2!4817 (_1!2513 BitStream!1974) (_2!2513 BitStream!1974)) )
))
(declare-fun lt!81931 () tuple2!4816)

(declare-fun reader!0 (BitStream!1974 BitStream!1974) tuple2!4816)

(assert (=> b!52891 (= lt!81931 (reader!0 thiss!1379 (_2!2512 lt!81930)))))

(assert (= (and start!10556 res!44174) b!52890))

(assert (= (and b!52890 res!44173) b!52887))

(assert (= (and b!52887 (not res!44172)) b!52888))

(assert (= (and b!52888 (not res!44175)) b!52891))

(assert (= start!10556 b!52889))

(declare-fun m!83307 () Bool)

(assert (=> b!52887 m!83307))

(declare-fun m!83309 () Bool)

(assert (=> b!52887 m!83309))

(declare-fun m!83311 () Bool)

(assert (=> b!52887 m!83311))

(declare-fun m!83313 () Bool)

(assert (=> b!52890 m!83313))

(declare-fun m!83315 () Bool)

(assert (=> b!52888 m!83315))

(declare-fun m!83317 () Bool)

(assert (=> b!52888 m!83317))

(declare-fun m!83319 () Bool)

(assert (=> b!52888 m!83319))

(assert (=> b!52888 m!83315))

(declare-fun m!83321 () Bool)

(assert (=> b!52888 m!83321))

(declare-fun m!83323 () Bool)

(assert (=> b!52888 m!83323))

(declare-fun m!83325 () Bool)

(assert (=> start!10556 m!83325))

(declare-fun m!83327 () Bool)

(assert (=> start!10556 m!83327))

(declare-fun m!83329 () Bool)

(assert (=> b!52889 m!83329))

(declare-fun m!83331 () Bool)

(assert (=> b!52891 m!83331))

(check-sat (not b!52890) (not b!52888) (not b!52887) (not b!52889) (not b!52891) (not start!10556))
(check-sat)
(get-model)

(declare-fun d!16748 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!16748 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1141 (buf!1491 thiss!1379))) ((_ sign_extend 32) (currentByte!3046 thiss!1379)) ((_ sign_extend 32) (currentBit!3041 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1141 (buf!1491 thiss!1379))) ((_ sign_extend 32) (currentByte!3046 thiss!1379)) ((_ sign_extend 32) (currentBit!3041 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4248 () Bool)

(assert (= bs!4248 d!16748))

(declare-fun m!83359 () Bool)

(assert (=> bs!4248 m!83359))

(assert (=> b!52890 d!16748))

(declare-fun d!16752 () Bool)

(assert (=> d!16752 (= (array_inv!1046 srcBuffer!2) (bvsge (size!1141 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!10556 d!16752))

(declare-fun d!16754 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!16754 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3041 thiss!1379) (currentByte!3046 thiss!1379) (size!1141 (buf!1491 thiss!1379))))))

(declare-fun bs!4250 () Bool)

(assert (= bs!4250 d!16754))

(declare-fun m!83363 () Bool)

(assert (=> bs!4250 m!83363))

(assert (=> start!10556 d!16754))

(declare-fun d!16760 () Bool)

(assert (=> d!16760 (= (array_inv!1046 (buf!1491 thiss!1379)) (bvsge (size!1141 (buf!1491 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!52889 d!16760))

(declare-fun d!16762 () Bool)

(declare-fun res!44200 () Bool)

(declare-fun e!35256 () Bool)

(assert (=> d!16762 (=> (not res!44200) (not e!35256))))

(assert (=> d!16762 (= res!44200 (= (size!1141 (buf!1491 thiss!1379)) (size!1141 (buf!1491 (_2!2512 lt!81930)))))))

(assert (=> d!16762 (= (isPrefixOf!0 thiss!1379 (_2!2512 lt!81930)) e!35256)))

(declare-fun b!52919 () Bool)

(declare-fun res!44202 () Bool)

(assert (=> b!52919 (=> (not res!44202) (not e!35256))))

(assert (=> b!52919 (= res!44202 (bvsle (bitIndex!0 (size!1141 (buf!1491 thiss!1379)) (currentByte!3046 thiss!1379) (currentBit!3041 thiss!1379)) (bitIndex!0 (size!1141 (buf!1491 (_2!2512 lt!81930))) (currentByte!3046 (_2!2512 lt!81930)) (currentBit!3041 (_2!2512 lt!81930)))))))

(declare-fun b!52920 () Bool)

(declare-fun e!35255 () Bool)

(assert (=> b!52920 (= e!35256 e!35255)))

(declare-fun res!44201 () Bool)

(assert (=> b!52920 (=> res!44201 e!35255)))

(assert (=> b!52920 (= res!44201 (= (size!1141 (buf!1491 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!52921 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2499 array!2499 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52921 (= e!35255 (arrayBitRangesEq!0 (buf!1491 thiss!1379) (buf!1491 (_2!2512 lt!81930)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1141 (buf!1491 thiss!1379)) (currentByte!3046 thiss!1379) (currentBit!3041 thiss!1379))))))

(assert (= (and d!16762 res!44200) b!52919))

(assert (= (and b!52919 res!44202) b!52920))

(assert (= (and b!52920 (not res!44201)) b!52921))

(assert (=> b!52919 m!83311))

(declare-fun m!83367 () Bool)

(assert (=> b!52919 m!83367))

(assert (=> b!52921 m!83311))

(assert (=> b!52921 m!83311))

(declare-fun m!83369 () Bool)

(assert (=> b!52921 m!83369))

(assert (=> b!52888 d!16762))

(declare-fun d!16766 () Bool)

(assert (=> d!16766 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1141 (buf!1491 (_2!2512 lt!81930)))) ((_ sign_extend 32) (currentByte!3046 (_2!2512 lt!81930))) ((_ sign_extend 32) (currentBit!3041 (_2!2512 lt!81930))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1141 (buf!1491 (_2!2512 lt!81930)))) ((_ sign_extend 32) (currentByte!3046 (_2!2512 lt!81930))) ((_ sign_extend 32) (currentBit!3041 (_2!2512 lt!81930)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!4252 () Bool)

(assert (= bs!4252 d!16766))

(declare-fun m!83373 () Bool)

(assert (=> bs!4252 m!83373))

(assert (=> b!52888 d!16766))

(declare-fun d!16770 () Bool)

(declare-fun e!35261 () Bool)

(assert (=> d!16770 e!35261))

(declare-fun res!44208 () Bool)

(assert (=> d!16770 (=> (not res!44208) (not e!35261))))

(assert (=> d!16770 (= res!44208 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!81955 () Unit!3686)

(declare-fun choose!27 (BitStream!1974 BitStream!1974 (_ BitVec 64) (_ BitVec 64)) Unit!3686)

(assert (=> d!16770 (= lt!81955 (choose!27 thiss!1379 (_2!2512 lt!81930) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!16770 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!16770 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2512 lt!81930) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!81955)))

(declare-fun b!52927 () Bool)

(assert (=> b!52927 (= e!35261 (validate_offset_bits!1 ((_ sign_extend 32) (size!1141 (buf!1491 (_2!2512 lt!81930)))) ((_ sign_extend 32) (currentByte!3046 (_2!2512 lt!81930))) ((_ sign_extend 32) (currentBit!3041 (_2!2512 lt!81930))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!16770 res!44208) b!52927))

(declare-fun m!83377 () Bool)

(assert (=> d!16770 m!83377))

(assert (=> b!52927 m!83323))

(assert (=> b!52888 d!16770))

(declare-fun b!52996 () Bool)

(declare-fun res!44269 () Bool)

(declare-fun e!35297 () Bool)

(assert (=> b!52996 (=> (not res!44269) (not e!35297))))

(declare-fun lt!82133 () tuple2!4814)

(assert (=> b!52996 (= res!44269 (isPrefixOf!0 thiss!1379 (_2!2512 lt!82133)))))

(declare-fun b!52997 () Bool)

(declare-fun e!35299 () Bool)

(declare-datatypes ((tuple2!4822 0))(
  ( (tuple2!4823 (_1!2516 BitStream!1974) (_2!2516 Bool)) )
))
(declare-fun lt!82127 () tuple2!4822)

(assert (=> b!52997 (= e!35299 (= (bitIndex!0 (size!1141 (buf!1491 (_1!2516 lt!82127))) (currentByte!3046 (_1!2516 lt!82127)) (currentBit!3041 (_1!2516 lt!82127))) (bitIndex!0 (size!1141 (buf!1491 (_2!2512 lt!82133))) (currentByte!3046 (_2!2512 lt!82133)) (currentBit!3041 (_2!2512 lt!82133)))))))

(declare-fun b!52998 () Bool)

(declare-fun res!44267 () Bool)

(assert (=> b!52998 (=> (not res!44267) (not e!35297))))

(declare-fun lt!82129 () (_ BitVec 64))

(declare-fun lt!82132 () (_ BitVec 64))

(assert (=> b!52998 (= res!44267 (= (bitIndex!0 (size!1141 (buf!1491 (_2!2512 lt!82133))) (currentByte!3046 (_2!2512 lt!82133)) (currentBit!3041 (_2!2512 lt!82133))) (bvadd lt!82129 lt!82132)))))

(assert (=> b!52998 (or (not (= (bvand lt!82129 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!82132 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!82129 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!82129 lt!82132) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!52998 (= lt!82132 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!52998 (= lt!82129 (bitIndex!0 (size!1141 (buf!1491 thiss!1379)) (currentByte!3046 thiss!1379) (currentBit!3041 thiss!1379)))))

(declare-fun d!16774 () Bool)

(assert (=> d!16774 e!35297))

(declare-fun res!44266 () Bool)

(assert (=> d!16774 (=> (not res!44266) (not e!35297))))

(assert (=> d!16774 (= res!44266 (= (size!1141 (buf!1491 (_2!2512 lt!82133))) (size!1141 (buf!1491 thiss!1379))))))

(declare-fun lt!82126 () (_ BitVec 8))

(declare-fun lt!82135 () array!2499)

(assert (=> d!16774 (= lt!82126 (select (arr!1677 lt!82135) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!16774 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1141 lt!82135)))))

(assert (=> d!16774 (= lt!82135 (array!2500 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!82125 () tuple2!4814)

(assert (=> d!16774 (= lt!82133 (tuple2!4815 (_1!2512 lt!82125) (_2!2512 lt!82125)))))

(declare-fun lt!82134 () tuple2!4814)

(assert (=> d!16774 (= lt!82125 lt!82134)))

(declare-fun e!35296 () Bool)

(assert (=> d!16774 e!35296))

(declare-fun res!44264 () Bool)

(assert (=> d!16774 (=> (not res!44264) (not e!35296))))

(assert (=> d!16774 (= res!44264 (= (size!1141 (buf!1491 thiss!1379)) (size!1141 (buf!1491 (_2!2512 lt!82134)))))))

(declare-fun lt!82128 () Bool)

(declare-fun appendBit!0 (BitStream!1974 Bool) tuple2!4814)

(assert (=> d!16774 (= lt!82134 (appendBit!0 thiss!1379 lt!82128))))

(assert (=> d!16774 (= lt!82128 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1677 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!16774 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!16774 (= (appendBitFromByte!0 thiss!1379 (select (arr!1677 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!82133)))

(declare-fun b!52999 () Bool)

(assert (=> b!52999 (= e!35297 e!35299)))

(declare-fun res!44268 () Bool)

(assert (=> b!52999 (=> (not res!44268) (not e!35299))))

(assert (=> b!52999 (= res!44268 (and (= (_2!2516 lt!82127) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1677 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!82126)) #b00000000000000000000000000000000))) (= (_1!2516 lt!82127) (_2!2512 lt!82133))))))

(declare-datatypes ((tuple2!4824 0))(
  ( (tuple2!4825 (_1!2517 array!2499) (_2!2517 BitStream!1974)) )
))
(declare-fun lt!82124 () tuple2!4824)

(declare-fun lt!82130 () BitStream!1974)

(declare-fun readBits!0 (BitStream!1974 (_ BitVec 64)) tuple2!4824)

(assert (=> b!52999 (= lt!82124 (readBits!0 lt!82130 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!1974) tuple2!4822)

(assert (=> b!52999 (= lt!82127 (readBitPure!0 lt!82130))))

(declare-fun readerFrom!0 (BitStream!1974 (_ BitVec 32) (_ BitVec 32)) BitStream!1974)

(assert (=> b!52999 (= lt!82130 (readerFrom!0 (_2!2512 lt!82133) (currentBit!3041 thiss!1379) (currentByte!3046 thiss!1379)))))

(declare-fun b!53000 () Bool)

(declare-fun res!44271 () Bool)

(assert (=> b!53000 (=> (not res!44271) (not e!35296))))

(assert (=> b!53000 (= res!44271 (= (bitIndex!0 (size!1141 (buf!1491 (_2!2512 lt!82134))) (currentByte!3046 (_2!2512 lt!82134)) (currentBit!3041 (_2!2512 lt!82134))) (bvadd (bitIndex!0 (size!1141 (buf!1491 thiss!1379)) (currentByte!3046 thiss!1379) (currentBit!3041 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!53001 () Bool)

(declare-fun e!35298 () Bool)

(assert (=> b!53001 (= e!35296 e!35298)))

(declare-fun res!44270 () Bool)

(assert (=> b!53001 (=> (not res!44270) (not e!35298))))

(declare-fun lt!82131 () tuple2!4822)

(assert (=> b!53001 (= res!44270 (and (= (_2!2516 lt!82131) lt!82128) (= (_1!2516 lt!82131) (_2!2512 lt!82134))))))

(assert (=> b!53001 (= lt!82131 (readBitPure!0 (readerFrom!0 (_2!2512 lt!82134) (currentBit!3041 thiss!1379) (currentByte!3046 thiss!1379))))))

(declare-fun b!53002 () Bool)

(declare-fun res!44265 () Bool)

(assert (=> b!53002 (=> (not res!44265) (not e!35296))))

(assert (=> b!53002 (= res!44265 (isPrefixOf!0 thiss!1379 (_2!2512 lt!82134)))))

(declare-fun b!53003 () Bool)

(assert (=> b!53003 (= e!35298 (= (bitIndex!0 (size!1141 (buf!1491 (_1!2516 lt!82131))) (currentByte!3046 (_1!2516 lt!82131)) (currentBit!3041 (_1!2516 lt!82131))) (bitIndex!0 (size!1141 (buf!1491 (_2!2512 lt!82134))) (currentByte!3046 (_2!2512 lt!82134)) (currentBit!3041 (_2!2512 lt!82134)))))))

(assert (= (and d!16774 res!44264) b!53000))

(assert (= (and b!53000 res!44271) b!53002))

(assert (= (and b!53002 res!44265) b!53001))

(assert (= (and b!53001 res!44270) b!53003))

(assert (= (and d!16774 res!44266) b!52998))

(assert (= (and b!52998 res!44267) b!52996))

(assert (= (and b!52996 res!44269) b!52999))

(assert (= (and b!52999 res!44268) b!52997))

(declare-fun m!83445 () Bool)

(assert (=> b!53003 m!83445))

(declare-fun m!83447 () Bool)

(assert (=> b!53003 m!83447))

(declare-fun m!83449 () Bool)

(assert (=> b!52996 m!83449))

(declare-fun m!83451 () Bool)

(assert (=> b!53002 m!83451))

(declare-fun m!83453 () Bool)

(assert (=> d!16774 m!83453))

(declare-fun m!83455 () Bool)

(assert (=> d!16774 m!83455))

(declare-fun m!83457 () Bool)

(assert (=> d!16774 m!83457))

(declare-fun m!83459 () Bool)

(assert (=> b!53001 m!83459))

(assert (=> b!53001 m!83459))

(declare-fun m!83461 () Bool)

(assert (=> b!53001 m!83461))

(assert (=> b!53000 m!83447))

(assert (=> b!53000 m!83311))

(declare-fun m!83463 () Bool)

(assert (=> b!52997 m!83463))

(declare-fun m!83465 () Bool)

(assert (=> b!52997 m!83465))

(declare-fun m!83467 () Bool)

(assert (=> b!52999 m!83467))

(declare-fun m!83469 () Bool)

(assert (=> b!52999 m!83469))

(declare-fun m!83471 () Bool)

(assert (=> b!52999 m!83471))

(assert (=> b!52998 m!83465))

(assert (=> b!52998 m!83311))

(assert (=> b!52888 d!16774))

(declare-fun d!16796 () Bool)

(declare-fun res!44272 () Bool)

(declare-fun e!35301 () Bool)

(assert (=> d!16796 (=> (not res!44272) (not e!35301))))

(assert (=> d!16796 (= res!44272 (= (size!1141 (buf!1491 thiss!1379)) (size!1141 (buf!1491 thiss!1379))))))

(assert (=> d!16796 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!35301)))

(declare-fun b!53004 () Bool)

(declare-fun res!44274 () Bool)

(assert (=> b!53004 (=> (not res!44274) (not e!35301))))

(assert (=> b!53004 (= res!44274 (bvsle (bitIndex!0 (size!1141 (buf!1491 thiss!1379)) (currentByte!3046 thiss!1379) (currentBit!3041 thiss!1379)) (bitIndex!0 (size!1141 (buf!1491 thiss!1379)) (currentByte!3046 thiss!1379) (currentBit!3041 thiss!1379))))))

(declare-fun b!53005 () Bool)

(declare-fun e!35300 () Bool)

(assert (=> b!53005 (= e!35301 e!35300)))

(declare-fun res!44273 () Bool)

(assert (=> b!53005 (=> res!44273 e!35300)))

(assert (=> b!53005 (= res!44273 (= (size!1141 (buf!1491 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!53006 () Bool)

(assert (=> b!53006 (= e!35300 (arrayBitRangesEq!0 (buf!1491 thiss!1379) (buf!1491 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1141 (buf!1491 thiss!1379)) (currentByte!3046 thiss!1379) (currentBit!3041 thiss!1379))))))

(assert (= (and d!16796 res!44272) b!53004))

(assert (= (and b!53004 res!44274) b!53005))

(assert (= (and b!53005 (not res!44273)) b!53006))

(assert (=> b!53004 m!83311))

(assert (=> b!53004 m!83311))

(assert (=> b!53006 m!83311))

(assert (=> b!53006 m!83311))

(declare-fun m!83473 () Bool)

(assert (=> b!53006 m!83473))

(assert (=> b!52887 d!16796))

(declare-fun d!16798 () Bool)

(assert (=> d!16798 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!82138 () Unit!3686)

(declare-fun choose!11 (BitStream!1974) Unit!3686)

(assert (=> d!16798 (= lt!82138 (choose!11 thiss!1379))))

(assert (=> d!16798 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!82138)))

(declare-fun bs!4259 () Bool)

(assert (= bs!4259 d!16798))

(assert (=> bs!4259 m!83307))

(declare-fun m!83475 () Bool)

(assert (=> bs!4259 m!83475))

(assert (=> b!52887 d!16798))

(declare-fun d!16800 () Bool)

(declare-fun e!35309 () Bool)

(assert (=> d!16800 e!35309))

(declare-fun res!44289 () Bool)

(assert (=> d!16800 (=> (not res!44289) (not e!35309))))

(declare-fun lt!82170 () (_ BitVec 64))

(declare-fun lt!82169 () (_ BitVec 64))

(declare-fun lt!82174 () (_ BitVec 64))

(assert (=> d!16800 (= res!44289 (= lt!82174 (bvsub lt!82169 lt!82170)))))

(assert (=> d!16800 (or (= (bvand lt!82169 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!82170 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!82169 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!82169 lt!82170) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!16800 (= lt!82170 (remainingBits!0 ((_ sign_extend 32) (size!1141 (buf!1491 thiss!1379))) ((_ sign_extend 32) (currentByte!3046 thiss!1379)) ((_ sign_extend 32) (currentBit!3041 thiss!1379))))))

(declare-fun lt!82172 () (_ BitVec 64))

(declare-fun lt!82173 () (_ BitVec 64))

(assert (=> d!16800 (= lt!82169 (bvmul lt!82172 lt!82173))))

(assert (=> d!16800 (or (= lt!82172 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!82173 (bvsdiv (bvmul lt!82172 lt!82173) lt!82172)))))

(assert (=> d!16800 (= lt!82173 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!16800 (= lt!82172 ((_ sign_extend 32) (size!1141 (buf!1491 thiss!1379))))))

(assert (=> d!16800 (= lt!82174 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3046 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3041 thiss!1379))))))

(assert (=> d!16800 (invariant!0 (currentBit!3041 thiss!1379) (currentByte!3046 thiss!1379) (size!1141 (buf!1491 thiss!1379)))))

(assert (=> d!16800 (= (bitIndex!0 (size!1141 (buf!1491 thiss!1379)) (currentByte!3046 thiss!1379) (currentBit!3041 thiss!1379)) lt!82174)))

(declare-fun b!53020 () Bool)

(declare-fun res!44288 () Bool)

(assert (=> b!53020 (=> (not res!44288) (not e!35309))))

(assert (=> b!53020 (= res!44288 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!82174))))

(declare-fun b!53021 () Bool)

(declare-fun lt!82171 () (_ BitVec 64))

(assert (=> b!53021 (= e!35309 (bvsle lt!82174 (bvmul lt!82171 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!53021 (or (= lt!82171 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!82171 #b0000000000000000000000000000000000000000000000000000000000001000) lt!82171)))))

(assert (=> b!53021 (= lt!82171 ((_ sign_extend 32) (size!1141 (buf!1491 thiss!1379))))))

(assert (= (and d!16800 res!44289) b!53020))

(assert (= (and b!53020 res!44288) b!53021))

(assert (=> d!16800 m!83359))

(assert (=> d!16800 m!83363))

(assert (=> b!52887 d!16800))

(declare-fun b!53060 () Bool)

(declare-fun e!35330 () Unit!3686)

(declare-fun Unit!3691 () Unit!3686)

(assert (=> b!53060 (= e!35330 Unit!3691)))

(declare-fun d!16810 () Bool)

(declare-fun e!35329 () Bool)

(assert (=> d!16810 e!35329))

(declare-fun res!44324 () Bool)

(assert (=> d!16810 (=> (not res!44324) (not e!35329))))

(declare-fun lt!82273 () tuple2!4816)

(assert (=> d!16810 (= res!44324 (isPrefixOf!0 (_1!2513 lt!82273) (_2!2513 lt!82273)))))

(declare-fun lt!82254 () BitStream!1974)

(assert (=> d!16810 (= lt!82273 (tuple2!4817 lt!82254 (_2!2512 lt!81930)))))

(declare-fun lt!82263 () Unit!3686)

(declare-fun lt!82271 () Unit!3686)

(assert (=> d!16810 (= lt!82263 lt!82271)))

(assert (=> d!16810 (isPrefixOf!0 lt!82254 (_2!2512 lt!81930))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1974 BitStream!1974 BitStream!1974) Unit!3686)

(assert (=> d!16810 (= lt!82271 (lemmaIsPrefixTransitive!0 lt!82254 (_2!2512 lt!81930) (_2!2512 lt!81930)))))

(declare-fun lt!82266 () Unit!3686)

(declare-fun lt!82269 () Unit!3686)

(assert (=> d!16810 (= lt!82266 lt!82269)))

(assert (=> d!16810 (isPrefixOf!0 lt!82254 (_2!2512 lt!81930))))

(assert (=> d!16810 (= lt!82269 (lemmaIsPrefixTransitive!0 lt!82254 thiss!1379 (_2!2512 lt!81930)))))

(declare-fun lt!82267 () Unit!3686)

(assert (=> d!16810 (= lt!82267 e!35330)))

(declare-fun c!3753 () Bool)

(assert (=> d!16810 (= c!3753 (not (= (size!1141 (buf!1491 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!82265 () Unit!3686)

(declare-fun lt!82272 () Unit!3686)

(assert (=> d!16810 (= lt!82265 lt!82272)))

(assert (=> d!16810 (isPrefixOf!0 (_2!2512 lt!81930) (_2!2512 lt!81930))))

(assert (=> d!16810 (= lt!82272 (lemmaIsPrefixRefl!0 (_2!2512 lt!81930)))))

(declare-fun lt!82262 () Unit!3686)

(declare-fun lt!82258 () Unit!3686)

(assert (=> d!16810 (= lt!82262 lt!82258)))

(assert (=> d!16810 (= lt!82258 (lemmaIsPrefixRefl!0 (_2!2512 lt!81930)))))

(declare-fun lt!82270 () Unit!3686)

(declare-fun lt!82260 () Unit!3686)

(assert (=> d!16810 (= lt!82270 lt!82260)))

(assert (=> d!16810 (isPrefixOf!0 lt!82254 lt!82254)))

(assert (=> d!16810 (= lt!82260 (lemmaIsPrefixRefl!0 lt!82254))))

(declare-fun lt!82268 () Unit!3686)

(declare-fun lt!82256 () Unit!3686)

(assert (=> d!16810 (= lt!82268 lt!82256)))

(assert (=> d!16810 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!16810 (= lt!82256 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!16810 (= lt!82254 (BitStream!1975 (buf!1491 (_2!2512 lt!81930)) (currentByte!3046 thiss!1379) (currentBit!3041 thiss!1379)))))

(assert (=> d!16810 (isPrefixOf!0 thiss!1379 (_2!2512 lt!81930))))

(assert (=> d!16810 (= (reader!0 thiss!1379 (_2!2512 lt!81930)) lt!82273)))

(declare-fun b!53061 () Bool)

(declare-fun res!44323 () Bool)

(assert (=> b!53061 (=> (not res!44323) (not e!35329))))

(assert (=> b!53061 (= res!44323 (isPrefixOf!0 (_1!2513 lt!82273) thiss!1379))))

(declare-fun b!53062 () Bool)

(declare-fun lt!82264 () Unit!3686)

(assert (=> b!53062 (= e!35330 lt!82264)))

(declare-fun lt!82255 () (_ BitVec 64))

(assert (=> b!53062 (= lt!82255 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!82257 () (_ BitVec 64))

(assert (=> b!53062 (= lt!82257 (bitIndex!0 (size!1141 (buf!1491 thiss!1379)) (currentByte!3046 thiss!1379) (currentBit!3041 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2499 array!2499 (_ BitVec 64) (_ BitVec 64)) Unit!3686)

(assert (=> b!53062 (= lt!82264 (arrayBitRangesEqSymmetric!0 (buf!1491 thiss!1379) (buf!1491 (_2!2512 lt!81930)) lt!82255 lt!82257))))

(assert (=> b!53062 (arrayBitRangesEq!0 (buf!1491 (_2!2512 lt!81930)) (buf!1491 thiss!1379) lt!82255 lt!82257)))

(declare-fun lt!82261 () (_ BitVec 64))

(declare-fun b!53063 () Bool)

(declare-fun lt!82259 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1974 (_ BitVec 64)) BitStream!1974)

(assert (=> b!53063 (= e!35329 (= (_1!2513 lt!82273) (withMovedBitIndex!0 (_2!2513 lt!82273) (bvsub lt!82259 lt!82261))))))

(assert (=> b!53063 (or (= (bvand lt!82259 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!82261 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!82259 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!82259 lt!82261) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!53063 (= lt!82261 (bitIndex!0 (size!1141 (buf!1491 (_2!2512 lt!81930))) (currentByte!3046 (_2!2512 lt!81930)) (currentBit!3041 (_2!2512 lt!81930))))))

(assert (=> b!53063 (= lt!82259 (bitIndex!0 (size!1141 (buf!1491 thiss!1379)) (currentByte!3046 thiss!1379) (currentBit!3041 thiss!1379)))))

(declare-fun b!53064 () Bool)

(declare-fun res!44325 () Bool)

(assert (=> b!53064 (=> (not res!44325) (not e!35329))))

(assert (=> b!53064 (= res!44325 (isPrefixOf!0 (_2!2513 lt!82273) (_2!2512 lt!81930)))))

(assert (= (and d!16810 c!3753) b!53062))

(assert (= (and d!16810 (not c!3753)) b!53060))

(assert (= (and d!16810 res!44324) b!53061))

(assert (= (and b!53061 res!44323) b!53064))

(assert (= (and b!53064 res!44325) b!53063))

(declare-fun m!83487 () Bool)

(assert (=> b!53064 m!83487))

(declare-fun m!83489 () Bool)

(assert (=> d!16810 m!83489))

(assert (=> d!16810 m!83307))

(declare-fun m!83491 () Bool)

(assert (=> d!16810 m!83491))

(declare-fun m!83493 () Bool)

(assert (=> d!16810 m!83493))

(assert (=> d!16810 m!83319))

(declare-fun m!83495 () Bool)

(assert (=> d!16810 m!83495))

(declare-fun m!83497 () Bool)

(assert (=> d!16810 m!83497))

(declare-fun m!83499 () Bool)

(assert (=> d!16810 m!83499))

(assert (=> d!16810 m!83309))

(declare-fun m!83501 () Bool)

(assert (=> d!16810 m!83501))

(declare-fun m!83503 () Bool)

(assert (=> d!16810 m!83503))

(assert (=> b!53062 m!83311))

(declare-fun m!83505 () Bool)

(assert (=> b!53062 m!83505))

(declare-fun m!83507 () Bool)

(assert (=> b!53062 m!83507))

(declare-fun m!83511 () Bool)

(assert (=> b!53063 m!83511))

(assert (=> b!53063 m!83367))

(assert (=> b!53063 m!83311))

(declare-fun m!83519 () Bool)

(assert (=> b!53061 m!83519))

(assert (=> b!52891 d!16810))

(check-sat (not d!16766) (not b!53061) (not d!16774) (not b!52919) (not d!16748) (not b!53006) (not d!16800) (not b!52927) (not b!53063) (not b!53001) (not d!16770) (not b!52921) (not d!16810) (not b!52996) (not b!53062) (not b!52997) (not b!53000) (not b!53004) (not d!16798) (not d!16754) (not b!52998) (not b!52999) (not b!53003) (not b!53064) (not b!53002))
