; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8394 () Bool)

(assert start!8394)

(declare-fun e!28003 () Bool)

(declare-datatypes ((array!2146 0))(
  ( (array!2147 (arr!1470 (Array (_ BitVec 32) (_ BitVec 8))) (size!971 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1686 0))(
  ( (BitStream!1687 (buf!1299 array!2146) (currentByte!2751 (_ BitVec 32)) (currentBit!2746 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!4106 0))(
  ( (tuple2!4107 (_1!2143 BitStream!1686) (_2!2143 BitStream!1686)) )
))
(declare-fun lt!63203 () tuple2!4106)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun b!42029 () Bool)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!42029 (= e!28003 (validate_offset_bits!1 ((_ sign_extend 32) (size!971 (buf!1299 (_1!2143 lt!63203)))) ((_ sign_extend 32) (currentByte!2751 (_1!2143 lt!63203))) ((_ sign_extend 32) (currentBit!2746 (_1!2143 lt!63203))) (bvsub to!314 i!635)))))

(declare-datatypes ((Unit!2993 0))(
  ( (Unit!2994) )
))
(declare-fun lt!63204 () Unit!2993)

(declare-fun thiss!1379 () BitStream!1686)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1686 array!2146 (_ BitVec 64)) Unit!2993)

(assert (=> b!42029 (= lt!63204 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1299 thiss!1379) (bvsub to!314 i!635)))))

(declare-fun srcBuffer!2 () array!2146)

(declare-datatypes ((tuple2!4108 0))(
  ( (tuple2!4109 (_1!2144 array!2146) (_2!2144 BitStream!1686)) )
))
(declare-fun lt!63201 () tuple2!4108)

(declare-fun checkByteArrayBitContent!0 (BitStream!1686 array!2146 array!2146 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!42029 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!2144 lt!63201) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!42031 () Bool)

(declare-fun e!28001 () Bool)

(declare-fun array_inv!896 (array!2146) Bool)

(assert (=> b!42031 (= e!28001 (array_inv!896 (buf!1299 thiss!1379)))))

(declare-fun b!42032 () Bool)

(declare-fun e!28002 () Bool)

(assert (=> b!42032 (= e!28002 e!28003)))

(declare-fun res!35746 () Bool)

(assert (=> b!42032 (=> res!35746 e!28003)))

(assert (=> b!42032 (= res!35746 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBits!0 (BitStream!1686 (_ BitVec 64)) tuple2!4108)

(assert (=> b!42032 (= lt!63201 (readBits!0 (_1!2143 lt!63203) (bvsub to!314 i!635)))))

(declare-fun reader!0 (BitStream!1686 BitStream!1686) tuple2!4106)

(assert (=> b!42032 (= lt!63203 (reader!0 thiss!1379 thiss!1379))))

(declare-fun b!42033 () Bool)

(declare-fun res!35744 () Bool)

(assert (=> b!42033 (=> res!35744 e!28002)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!42033 (= res!35744 (not (invariant!0 (currentBit!2746 thiss!1379) (currentByte!2751 thiss!1379) (size!971 (buf!1299 thiss!1379)))))))

(declare-fun b!42034 () Bool)

(declare-fun res!35745 () Bool)

(declare-fun e!28000 () Bool)

(assert (=> b!42034 (=> (not res!35745) (not e!28000))))

(assert (=> b!42034 (= res!35745 (validate_offset_bits!1 ((_ sign_extend 32) (size!971 (buf!1299 thiss!1379))) ((_ sign_extend 32) (currentByte!2751 thiss!1379)) ((_ sign_extend 32) (currentBit!2746 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!42030 () Bool)

(assert (=> b!42030 (= e!28000 (not e!28002))))

(declare-fun res!35747 () Bool)

(assert (=> b!42030 (=> res!35747 e!28002)))

(declare-fun lt!63202 () (_ BitVec 64))

(assert (=> b!42030 (= res!35747 (or (bvslt i!635 to!314) (not (= lt!63202 (bvsub (bvadd lt!63202 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1686 BitStream!1686) Bool)

(assert (=> b!42030 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!63205 () Unit!2993)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1686) Unit!2993)

(assert (=> b!42030 (= lt!63205 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!42030 (= lt!63202 (bitIndex!0 (size!971 (buf!1299 thiss!1379)) (currentByte!2751 thiss!1379) (currentBit!2746 thiss!1379)))))

(declare-fun res!35748 () Bool)

(assert (=> start!8394 (=> (not res!35748) (not e!28000))))

(assert (=> start!8394 (= res!35748 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!971 srcBuffer!2))))))))

(assert (=> start!8394 e!28000))

(assert (=> start!8394 true))

(assert (=> start!8394 (array_inv!896 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1686) Bool)

(assert (=> start!8394 (and (inv!12 thiss!1379) e!28001)))

(assert (= (and start!8394 res!35748) b!42034))

(assert (= (and b!42034 res!35745) b!42030))

(assert (= (and b!42030 (not res!35747)) b!42033))

(assert (= (and b!42033 (not res!35744)) b!42032))

(assert (= (and b!42032 (not res!35746)) b!42029))

(assert (= start!8394 b!42031))

(declare-fun m!63855 () Bool)

(assert (=> b!42030 m!63855))

(declare-fun m!63857 () Bool)

(assert (=> b!42030 m!63857))

(declare-fun m!63859 () Bool)

(assert (=> b!42030 m!63859))

(declare-fun m!63861 () Bool)

(assert (=> start!8394 m!63861))

(declare-fun m!63863 () Bool)

(assert (=> start!8394 m!63863))

(declare-fun m!63865 () Bool)

(assert (=> b!42034 m!63865))

(declare-fun m!63867 () Bool)

(assert (=> b!42033 m!63867))

(declare-fun m!63869 () Bool)

(assert (=> b!42029 m!63869))

(declare-fun m!63871 () Bool)

(assert (=> b!42029 m!63871))

(declare-fun m!63873 () Bool)

(assert (=> b!42029 m!63873))

(declare-fun m!63875 () Bool)

(assert (=> b!42031 m!63875))

(declare-fun m!63877 () Bool)

(assert (=> b!42032 m!63877))

(declare-fun m!63879 () Bool)

(assert (=> b!42032 m!63879))

(check-sat (not b!42031) (not b!42034) (not b!42029) (not start!8394) (not b!42033) (not b!42030) (not b!42032))
(check-sat)
(get-model)

(declare-fun d!12182 () Bool)

(assert (=> d!12182 (= (invariant!0 (currentBit!2746 thiss!1379) (currentByte!2751 thiss!1379) (size!971 (buf!1299 thiss!1379))) (and (bvsge (currentBit!2746 thiss!1379) #b00000000000000000000000000000000) (bvslt (currentBit!2746 thiss!1379) #b00000000000000000000000000001000) (bvsge (currentByte!2751 thiss!1379) #b00000000000000000000000000000000) (or (bvslt (currentByte!2751 thiss!1379) (size!971 (buf!1299 thiss!1379))) (and (= (currentBit!2746 thiss!1379) #b00000000000000000000000000000000) (= (currentByte!2751 thiss!1379) (size!971 (buf!1299 thiss!1379)))))))))

(assert (=> b!42033 d!12182))

(declare-fun d!12184 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!12184 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!971 (buf!1299 thiss!1379))) ((_ sign_extend 32) (currentByte!2751 thiss!1379)) ((_ sign_extend 32) (currentBit!2746 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!971 (buf!1299 thiss!1379))) ((_ sign_extend 32) (currentByte!2751 thiss!1379)) ((_ sign_extend 32) (currentBit!2746 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3280 () Bool)

(assert (= bs!3280 d!12184))

(declare-fun m!63907 () Bool)

(assert (=> bs!3280 m!63907))

(assert (=> b!42034 d!12184))

(declare-fun d!12186 () Bool)

(assert (=> d!12186 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!971 (buf!1299 (_1!2143 lt!63203)))) ((_ sign_extend 32) (currentByte!2751 (_1!2143 lt!63203))) ((_ sign_extend 32) (currentBit!2746 (_1!2143 lt!63203))) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!971 (buf!1299 (_1!2143 lt!63203)))) ((_ sign_extend 32) (currentByte!2751 (_1!2143 lt!63203))) ((_ sign_extend 32) (currentBit!2746 (_1!2143 lt!63203)))) (bvsub to!314 i!635)))))

(declare-fun bs!3281 () Bool)

(assert (= bs!3281 d!12186))

(declare-fun m!63909 () Bool)

(assert (=> bs!3281 m!63909))

(assert (=> b!42029 d!12186))

(declare-fun d!12188 () Bool)

(assert (=> d!12188 (validate_offset_bits!1 ((_ sign_extend 32) (size!971 (buf!1299 thiss!1379))) ((_ sign_extend 32) (currentByte!2751 thiss!1379)) ((_ sign_extend 32) (currentBit!2746 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!63223 () Unit!2993)

(declare-fun choose!9 (BitStream!1686 array!2146 (_ BitVec 64) BitStream!1686) Unit!2993)

(assert (=> d!12188 (= lt!63223 (choose!9 thiss!1379 (buf!1299 thiss!1379) (bvsub to!314 i!635) (BitStream!1687 (buf!1299 thiss!1379) (currentByte!2751 thiss!1379) (currentBit!2746 thiss!1379))))))

(assert (=> d!12188 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1299 thiss!1379) (bvsub to!314 i!635)) lt!63223)))

(declare-fun bs!3282 () Bool)

(assert (= bs!3282 d!12188))

(assert (=> bs!3282 m!63865))

(declare-fun m!63911 () Bool)

(assert (=> bs!3282 m!63911))

(assert (=> b!42029 d!12188))

(declare-fun d!12190 () Bool)

(declare-fun res!35768 () Bool)

(declare-fun e!28026 () Bool)

(assert (=> d!12190 (=> res!35768 e!28026)))

(assert (=> d!12190 (= res!35768 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!12190 (= (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!2144 lt!63201) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) e!28026)))

(declare-fun b!42057 () Bool)

(declare-fun e!28027 () Bool)

(assert (=> b!42057 (= e!28026 e!28027)))

(declare-fun res!35769 () Bool)

(assert (=> b!42057 (=> (not res!35769) (not e!28027))))

(assert (=> b!42057 (= res!35769 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!1470 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!1470 (_1!2144 lt!63201)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!42058 () Bool)

(assert (=> b!42058 (= e!28027 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!2144 lt!63201) (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!12190 (not res!35768)) b!42057))

(assert (= (and b!42057 res!35769) b!42058))

(declare-fun m!63913 () Bool)

(assert (=> b!42057 m!63913))

(declare-fun m!63915 () Bool)

(assert (=> b!42057 m!63915))

(declare-fun m!63917 () Bool)

(assert (=> b!42057 m!63917))

(declare-fun m!63919 () Bool)

(assert (=> b!42057 m!63919))

(declare-fun m!63921 () Bool)

(assert (=> b!42058 m!63921))

(assert (=> b!42029 d!12190))

(declare-fun d!12194 () Bool)

(declare-fun res!35778 () Bool)

(declare-fun e!28032 () Bool)

(assert (=> d!12194 (=> (not res!35778) (not e!28032))))

(assert (=> d!12194 (= res!35778 (= (size!971 (buf!1299 thiss!1379)) (size!971 (buf!1299 thiss!1379))))))

(assert (=> d!12194 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!28032)))

(declare-fun b!42065 () Bool)

(declare-fun res!35776 () Bool)

(assert (=> b!42065 (=> (not res!35776) (not e!28032))))

(assert (=> b!42065 (= res!35776 (bvsle (bitIndex!0 (size!971 (buf!1299 thiss!1379)) (currentByte!2751 thiss!1379) (currentBit!2746 thiss!1379)) (bitIndex!0 (size!971 (buf!1299 thiss!1379)) (currentByte!2751 thiss!1379) (currentBit!2746 thiss!1379))))))

(declare-fun b!42066 () Bool)

(declare-fun e!28033 () Bool)

(assert (=> b!42066 (= e!28032 e!28033)))

(declare-fun res!35777 () Bool)

(assert (=> b!42066 (=> res!35777 e!28033)))

(assert (=> b!42066 (= res!35777 (= (size!971 (buf!1299 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!42067 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2146 array!2146 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!42067 (= e!28033 (arrayBitRangesEq!0 (buf!1299 thiss!1379) (buf!1299 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!971 (buf!1299 thiss!1379)) (currentByte!2751 thiss!1379) (currentBit!2746 thiss!1379))))))

(assert (= (and d!12194 res!35778) b!42065))

(assert (= (and b!42065 res!35776) b!42066))

(assert (= (and b!42066 (not res!35777)) b!42067))

(assert (=> b!42065 m!63859))

(assert (=> b!42065 m!63859))

(assert (=> b!42067 m!63859))

(assert (=> b!42067 m!63859))

(declare-fun m!63923 () Bool)

(assert (=> b!42067 m!63923))

(assert (=> b!42030 d!12194))

(declare-fun d!12198 () Bool)

(assert (=> d!12198 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!63226 () Unit!2993)

(declare-fun choose!11 (BitStream!1686) Unit!2993)

(assert (=> d!12198 (= lt!63226 (choose!11 thiss!1379))))

(assert (=> d!12198 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!63226)))

(declare-fun bs!3284 () Bool)

(assert (= bs!3284 d!12198))

(assert (=> bs!3284 m!63855))

(declare-fun m!63925 () Bool)

(assert (=> bs!3284 m!63925))

(assert (=> b!42030 d!12198))

(declare-fun d!12200 () Bool)

(declare-fun e!28042 () Bool)

(assert (=> d!12200 e!28042))

(declare-fun res!35793 () Bool)

(assert (=> d!12200 (=> (not res!35793) (not e!28042))))

(declare-fun lt!63244 () (_ BitVec 64))

(declare-fun lt!63241 () (_ BitVec 64))

(declare-fun lt!63243 () (_ BitVec 64))

(assert (=> d!12200 (= res!35793 (= lt!63243 (bvsub lt!63244 lt!63241)))))

(assert (=> d!12200 (or (= (bvand lt!63244 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!63241 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!63244 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!63244 lt!63241) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!12200 (= lt!63241 (remainingBits!0 ((_ sign_extend 32) (size!971 (buf!1299 thiss!1379))) ((_ sign_extend 32) (currentByte!2751 thiss!1379)) ((_ sign_extend 32) (currentBit!2746 thiss!1379))))))

(declare-fun lt!63240 () (_ BitVec 64))

(declare-fun lt!63239 () (_ BitVec 64))

(assert (=> d!12200 (= lt!63244 (bvmul lt!63240 lt!63239))))

(assert (=> d!12200 (or (= lt!63240 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!63239 (bvsdiv (bvmul lt!63240 lt!63239) lt!63240)))))

(assert (=> d!12200 (= lt!63239 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!12200 (= lt!63240 ((_ sign_extend 32) (size!971 (buf!1299 thiss!1379))))))

(assert (=> d!12200 (= lt!63243 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2751 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2746 thiss!1379))))))

(assert (=> d!12200 (invariant!0 (currentBit!2746 thiss!1379) (currentByte!2751 thiss!1379) (size!971 (buf!1299 thiss!1379)))))

(assert (=> d!12200 (= (bitIndex!0 (size!971 (buf!1299 thiss!1379)) (currentByte!2751 thiss!1379) (currentBit!2746 thiss!1379)) lt!63243)))

(declare-fun b!42081 () Bool)

(declare-fun res!35792 () Bool)

(assert (=> b!42081 (=> (not res!35792) (not e!28042))))

(assert (=> b!42081 (= res!35792 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!63243))))

(declare-fun b!42082 () Bool)

(declare-fun lt!63242 () (_ BitVec 64))

(assert (=> b!42082 (= e!28042 (bvsle lt!63243 (bvmul lt!63242 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!42082 (or (= lt!63242 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!63242 #b0000000000000000000000000000000000000000000000000000000000001000) lt!63242)))))

(assert (=> b!42082 (= lt!63242 ((_ sign_extend 32) (size!971 (buf!1299 thiss!1379))))))

(assert (= (and d!12200 res!35793) b!42081))

(assert (= (and b!42081 res!35792) b!42082))

(assert (=> d!12200 m!63907))

(assert (=> d!12200 m!63867))

(assert (=> b!42030 d!12200))

(declare-fun d!12204 () Bool)

(assert (=> d!12204 (= (array_inv!896 (buf!1299 thiss!1379)) (bvsge (size!971 (buf!1299 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!42031 d!12204))

(declare-fun b!42120 () Bool)

(declare-fun res!35835 () Bool)

(declare-fun e!28057 () Bool)

(assert (=> b!42120 (=> (not res!35835) (not e!28057))))

(declare-fun lt!63319 () tuple2!4108)

(assert (=> b!42120 (= res!35835 (bvsle (currentByte!2751 (_1!2143 lt!63203)) (currentByte!2751 (_2!2144 lt!63319))))))

(declare-fun b!42121 () Bool)

(declare-fun res!35831 () Bool)

(assert (=> b!42121 (=> (not res!35831) (not e!28057))))

(declare-fun lt!63318 () (_ BitVec 64))

(assert (=> b!42121 (= res!35831 (= (bvadd lt!63318 (bvsub to!314 i!635)) (bitIndex!0 (size!971 (buf!1299 (_2!2144 lt!63319))) (currentByte!2751 (_2!2144 lt!63319)) (currentBit!2746 (_2!2144 lt!63319)))))))

(assert (=> b!42121 (or (not (= (bvand lt!63318 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!63318 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!63318 (bvsub to!314 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!42121 (= lt!63318 (bitIndex!0 (size!971 (buf!1299 (_1!2143 lt!63203))) (currentByte!2751 (_1!2143 lt!63203)) (currentBit!2746 (_1!2143 lt!63203))))))

(declare-fun b!42122 () Bool)

(declare-datatypes ((List!490 0))(
  ( (Nil!487) (Cons!486 (h!605 Bool) (t!1240 List!490)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!1686 array!2146 (_ BitVec 64) (_ BitVec 64)) List!490)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1686 BitStream!1686 (_ BitVec 64)) List!490)

(assert (=> b!42122 (= e!28057 (= (byteArrayBitContentToList!0 (_2!2144 lt!63319) (_1!2144 lt!63319) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) (bitStreamReadBitsIntoList!0 (_2!2144 lt!63319) (_1!2143 lt!63203) (bvsub to!314 i!635))))))

(declare-fun b!42123 () Bool)

(declare-fun res!35834 () Bool)

(assert (=> b!42123 (=> (not res!35834) (not e!28057))))

(declare-fun lt!63320 () (_ BitVec 64))

(assert (=> b!42123 (= res!35834 (= (size!971 (_1!2144 lt!63319)) ((_ extract 31 0) lt!63320)))))

(assert (=> b!42123 (and (bvslt lt!63320 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!63320 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!63316 () (_ BitVec 64))

(declare-fun lt!63317 () (_ BitVec 64))

(assert (=> b!42123 (= lt!63320 (bvsdiv lt!63316 lt!63317))))

(assert (=> b!42123 (and (not (= lt!63317 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!63316 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!63317 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!42123 (= lt!63317 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!63314 () (_ BitVec 64))

(declare-fun lt!63322 () (_ BitVec 64))

(assert (=> b!42123 (= lt!63316 (bvsub lt!63314 lt!63322))))

(assert (=> b!42123 (or (= (bvand lt!63314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!63322 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!63314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!63314 lt!63322) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!42123 (= lt!63322 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!63321 () (_ BitVec 64))

(assert (=> b!42123 (= lt!63314 (bvadd (bvsub to!314 i!635) lt!63321))))

(assert (=> b!42123 (or (not (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!63321 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd (bvsub to!314 i!635) lt!63321) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!42123 (= lt!63321 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun d!12206 () Bool)

(assert (=> d!12206 e!28057))

(declare-fun res!35832 () Bool)

(assert (=> d!12206 (=> (not res!35832) (not e!28057))))

(assert (=> d!12206 (= res!35832 (= (buf!1299 (_2!2144 lt!63319)) (buf!1299 (_1!2143 lt!63203))))))

(declare-datatypes ((tuple3!168 0))(
  ( (tuple3!169 (_1!2148 Unit!2993) (_2!2148 BitStream!1686) (_3!91 array!2146)) )
))
(declare-fun lt!63315 () tuple3!168)

(assert (=> d!12206 (= lt!63319 (tuple2!4109 (_3!91 lt!63315) (_2!2148 lt!63315)))))

(declare-fun readBitsLoop!0 (BitStream!1686 (_ BitVec 64) array!2146 (_ BitVec 64) (_ BitVec 64)) tuple3!168)

(assert (=> d!12206 (= lt!63315 (readBitsLoop!0 (_1!2143 lt!63203) (bvsub to!314 i!635) (array!2147 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)))))

(assert (=> d!12206 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) (bvsle (bvsub to!314 i!635) #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!12206 (= (readBits!0 (_1!2143 lt!63203) (bvsub to!314 i!635)) lt!63319)))

(declare-fun b!42124 () Bool)

(declare-fun res!35833 () Bool)

(assert (=> b!42124 (=> (not res!35833) (not e!28057))))

(assert (=> b!42124 (= res!35833 (invariant!0 (currentBit!2746 (_2!2144 lt!63319)) (currentByte!2751 (_2!2144 lt!63319)) (size!971 (buf!1299 (_2!2144 lt!63319)))))))

(assert (= (and d!12206 res!35832) b!42121))

(assert (= (and b!42121 res!35831) b!42124))

(assert (= (and b!42124 res!35833) b!42123))

(assert (= (and b!42123 res!35834) b!42120))

(assert (= (and b!42120 res!35835) b!42122))

(declare-fun m!63959 () Bool)

(assert (=> b!42121 m!63959))

(declare-fun m!63961 () Bool)

(assert (=> b!42121 m!63961))

(declare-fun m!63963 () Bool)

(assert (=> b!42122 m!63963))

(declare-fun m!63965 () Bool)

(assert (=> b!42122 m!63965))

(declare-fun m!63967 () Bool)

(assert (=> d!12206 m!63967))

(declare-fun m!63969 () Bool)

(assert (=> b!42124 m!63969))

(assert (=> b!42032 d!12206))

(declare-fun b!42165 () Bool)

(declare-fun e!28078 () Unit!2993)

(declare-fun lt!63456 () Unit!2993)

(assert (=> b!42165 (= e!28078 lt!63456)))

(declare-fun lt!63466 () (_ BitVec 64))

(assert (=> b!42165 (= lt!63466 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!63469 () (_ BitVec 64))

(assert (=> b!42165 (= lt!63469 (bitIndex!0 (size!971 (buf!1299 thiss!1379)) (currentByte!2751 thiss!1379) (currentBit!2746 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2146 array!2146 (_ BitVec 64) (_ BitVec 64)) Unit!2993)

(assert (=> b!42165 (= lt!63456 (arrayBitRangesEqSymmetric!0 (buf!1299 thiss!1379) (buf!1299 thiss!1379) lt!63466 lt!63469))))

(assert (=> b!42165 (arrayBitRangesEq!0 (buf!1299 thiss!1379) (buf!1299 thiss!1379) lt!63466 lt!63469)))

(declare-fun b!42166 () Bool)

(declare-fun res!35870 () Bool)

(declare-fun e!28079 () Bool)

(assert (=> b!42166 (=> (not res!35870) (not e!28079))))

(declare-fun lt!63453 () tuple2!4106)

(assert (=> b!42166 (= res!35870 (isPrefixOf!0 (_2!2143 lt!63453) thiss!1379))))

(declare-fun b!42167 () Bool)

(declare-fun Unit!2998 () Unit!2993)

(assert (=> b!42167 (= e!28078 Unit!2998)))

(declare-fun lt!63467 () (_ BitVec 64))

(declare-fun b!42168 () Bool)

(declare-fun lt!63458 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1686 (_ BitVec 64)) BitStream!1686)

(assert (=> b!42168 (= e!28079 (= (_1!2143 lt!63453) (withMovedBitIndex!0 (_2!2143 lt!63453) (bvsub lt!63458 lt!63467))))))

(assert (=> b!42168 (or (= (bvand lt!63458 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!63467 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!63458 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!63458 lt!63467) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!42168 (= lt!63467 (bitIndex!0 (size!971 (buf!1299 thiss!1379)) (currentByte!2751 thiss!1379) (currentBit!2746 thiss!1379)))))

(assert (=> b!42168 (= lt!63458 (bitIndex!0 (size!971 (buf!1299 thiss!1379)) (currentByte!2751 thiss!1379) (currentBit!2746 thiss!1379)))))

(declare-fun b!42169 () Bool)

(declare-fun res!35871 () Bool)

(assert (=> b!42169 (=> (not res!35871) (not e!28079))))

(assert (=> b!42169 (= res!35871 (isPrefixOf!0 (_1!2143 lt!63453) thiss!1379))))

(declare-fun d!12230 () Bool)

(assert (=> d!12230 e!28079))

(declare-fun res!35872 () Bool)

(assert (=> d!12230 (=> (not res!35872) (not e!28079))))

(assert (=> d!12230 (= res!35872 (isPrefixOf!0 (_1!2143 lt!63453) (_2!2143 lt!63453)))))

(declare-fun lt!63468 () BitStream!1686)

(assert (=> d!12230 (= lt!63453 (tuple2!4107 lt!63468 thiss!1379))))

(declare-fun lt!63462 () Unit!2993)

(declare-fun lt!63463 () Unit!2993)

(assert (=> d!12230 (= lt!63462 lt!63463)))

(assert (=> d!12230 (isPrefixOf!0 lt!63468 thiss!1379)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1686 BitStream!1686 BitStream!1686) Unit!2993)

(assert (=> d!12230 (= lt!63463 (lemmaIsPrefixTransitive!0 lt!63468 thiss!1379 thiss!1379))))

(declare-fun lt!63452 () Unit!2993)

(declare-fun lt!63457 () Unit!2993)

(assert (=> d!12230 (= lt!63452 lt!63457)))

(assert (=> d!12230 (isPrefixOf!0 lt!63468 thiss!1379)))

(assert (=> d!12230 (= lt!63457 (lemmaIsPrefixTransitive!0 lt!63468 thiss!1379 thiss!1379))))

(declare-fun lt!63454 () Unit!2993)

(assert (=> d!12230 (= lt!63454 e!28078)))

(declare-fun c!2775 () Bool)

(assert (=> d!12230 (= c!2775 (not (= (size!971 (buf!1299 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!63460 () Unit!2993)

(declare-fun lt!63465 () Unit!2993)

(assert (=> d!12230 (= lt!63460 lt!63465)))

(assert (=> d!12230 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!12230 (= lt!63465 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!63459 () Unit!2993)

(declare-fun lt!63451 () Unit!2993)

(assert (=> d!12230 (= lt!63459 lt!63451)))

(assert (=> d!12230 (= lt!63451 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!63455 () Unit!2993)

(declare-fun lt!63461 () Unit!2993)

(assert (=> d!12230 (= lt!63455 lt!63461)))

(assert (=> d!12230 (isPrefixOf!0 lt!63468 lt!63468)))

(assert (=> d!12230 (= lt!63461 (lemmaIsPrefixRefl!0 lt!63468))))

(declare-fun lt!63450 () Unit!2993)

(declare-fun lt!63464 () Unit!2993)

(assert (=> d!12230 (= lt!63450 lt!63464)))

(assert (=> d!12230 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!12230 (= lt!63464 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!12230 (= lt!63468 (BitStream!1687 (buf!1299 thiss!1379) (currentByte!2751 thiss!1379) (currentBit!2746 thiss!1379)))))

(assert (=> d!12230 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!12230 (= (reader!0 thiss!1379 thiss!1379) lt!63453)))

(assert (= (and d!12230 c!2775) b!42165))

(assert (= (and d!12230 (not c!2775)) b!42167))

(assert (= (and d!12230 res!35872) b!42169))

(assert (= (and b!42169 res!35871) b!42166))

(assert (= (and b!42166 res!35870) b!42168))

(declare-fun m!63995 () Bool)

(assert (=> b!42166 m!63995))

(declare-fun m!63997 () Bool)

(assert (=> d!12230 m!63997))

(declare-fun m!63999 () Bool)

(assert (=> d!12230 m!63999))

(assert (=> d!12230 m!63855))

(assert (=> d!12230 m!63855))

(assert (=> d!12230 m!63857))

(assert (=> d!12230 m!63855))

(assert (=> d!12230 m!63857))

(declare-fun m!64001 () Bool)

(assert (=> d!12230 m!64001))

(declare-fun m!64003 () Bool)

(assert (=> d!12230 m!64003))

(declare-fun m!64005 () Bool)

(assert (=> d!12230 m!64005))

(assert (=> d!12230 m!64001))

(declare-fun m!64007 () Bool)

(assert (=> b!42169 m!64007))

(assert (=> b!42165 m!63859))

(declare-fun m!64009 () Bool)

(assert (=> b!42165 m!64009))

(declare-fun m!64011 () Bool)

(assert (=> b!42165 m!64011))

(declare-fun m!64013 () Bool)

(assert (=> b!42168 m!64013))

(assert (=> b!42168 m!63859))

(assert (=> b!42168 m!63859))

(assert (=> b!42032 d!12230))

(declare-fun d!12246 () Bool)

(assert (=> d!12246 (= (array_inv!896 srcBuffer!2) (bvsge (size!971 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!8394 d!12246))

(declare-fun d!12248 () Bool)

(assert (=> d!12248 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2746 thiss!1379) (currentByte!2751 thiss!1379) (size!971 (buf!1299 thiss!1379))))))

(declare-fun bs!3294 () Bool)

(assert (= bs!3294 d!12248))

(assert (=> bs!3294 m!63867))

(assert (=> start!8394 d!12248))

(check-sat (not b!42122) (not b!42166) (not b!42121) (not d!12230) (not d!12184) (not b!42168) (not b!42067) (not d!12198) (not d!12206) (not b!42124) (not d!12248) (not d!12186) (not b!42065) (not b!42169) (not b!42165) (not d!12188) (not d!12200) (not b!42058))
(check-sat)
