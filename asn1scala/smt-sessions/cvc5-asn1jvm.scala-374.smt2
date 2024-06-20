; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8840 () Bool)

(assert start!8840)

(declare-datatypes ((array!2224 0))(
  ( (array!2225 (arr!1511 (Array (_ BitVec 32) (_ BitVec 8))) (size!1003 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2224)

(declare-fun e!29258 () Bool)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun b!43877 () Bool)

(declare-datatypes ((BitStream!1750 0))(
  ( (BitStream!1751 (buf!1343 array!2224) (currentByte!2818 (_ BitVec 32)) (currentBit!2813 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!4298 0))(
  ( (tuple2!4299 (_1!2242 BitStream!1750) (_2!2242 BitStream!1750)) )
))
(declare-fun lt!66764 () tuple2!4298)

(declare-datatypes ((Unit!3124 0))(
  ( (Unit!3125) )
))
(declare-datatypes ((tuple2!4300 0))(
  ( (tuple2!4301 (_1!2243 Unit!3124) (_2!2243 BitStream!1750)) )
))
(declare-fun lt!66769 () tuple2!4300)

(declare-datatypes ((List!516 0))(
  ( (Nil!513) (Cons!512 (h!631 Bool) (t!1266 List!516)) )
))
(declare-fun head!335 (List!516) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1750 array!2224 (_ BitVec 64) (_ BitVec 64)) List!516)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1750 BitStream!1750 (_ BitVec 64)) List!516)

(assert (=> b!43877 (= e!29258 (= (head!335 (byteArrayBitContentToList!0 (_2!2243 lt!66769) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!335 (bitStreamReadBitsIntoList!0 (_2!2243 lt!66769) (_1!2242 lt!66764) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!43878 () Bool)

(declare-fun e!29251 () Bool)

(declare-fun thiss!1379 () BitStream!1750)

(declare-fun lt!66767 () tuple2!4300)

(assert (=> b!43878 (= e!29251 (= (size!1003 (buf!1343 thiss!1379)) (size!1003 (buf!1343 (_2!2243 lt!66767)))))))

(declare-fun res!37203 () Bool)

(declare-fun e!29253 () Bool)

(assert (=> start!8840 (=> (not res!37203) (not e!29253))))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!8840 (= res!37203 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1003 srcBuffer!2))))))))

(assert (=> start!8840 e!29253))

(assert (=> start!8840 true))

(declare-fun array_inv!928 (array!2224) Bool)

(assert (=> start!8840 (array_inv!928 srcBuffer!2)))

(declare-fun e!29252 () Bool)

(declare-fun inv!12 (BitStream!1750) Bool)

(assert (=> start!8840 (and (inv!12 thiss!1379) e!29252)))

(declare-fun b!43879 () Bool)

(declare-fun e!29254 () Bool)

(assert (=> b!43879 (= e!29253 (not e!29254))))

(declare-fun res!37199 () Bool)

(assert (=> b!43879 (=> res!37199 e!29254)))

(assert (=> b!43879 (= res!37199 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1750 BitStream!1750) Bool)

(assert (=> b!43879 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!66766 () Unit!3124)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1750) Unit!3124)

(assert (=> b!43879 (= lt!66766 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!66762 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!43879 (= lt!66762 (bitIndex!0 (size!1003 (buf!1343 thiss!1379)) (currentByte!2818 thiss!1379) (currentBit!2813 thiss!1379)))))

(declare-fun b!43880 () Bool)

(declare-fun res!37198 () Bool)

(assert (=> b!43880 (=> res!37198 e!29251)))

(assert (=> b!43880 (= res!37198 (not (= (bitIndex!0 (size!1003 (buf!1343 (_2!2243 lt!66767))) (currentByte!2818 (_2!2243 lt!66767)) (currentBit!2813 (_2!2243 lt!66767))) (bvsub (bvadd lt!66762 to!314) i!635))))))

(declare-fun b!43881 () Bool)

(declare-fun e!29257 () Bool)

(assert (=> b!43881 (= e!29254 e!29257)))

(declare-fun res!37202 () Bool)

(assert (=> b!43881 (=> res!37202 e!29257)))

(assert (=> b!43881 (= res!37202 (not (isPrefixOf!0 thiss!1379 (_2!2243 lt!66769))))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!43881 (validate_offset_bits!1 ((_ sign_extend 32) (size!1003 (buf!1343 (_2!2243 lt!66769)))) ((_ sign_extend 32) (currentByte!2818 (_2!2243 lt!66769))) ((_ sign_extend 32) (currentBit!2813 (_2!2243 lt!66769))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!66765 () Unit!3124)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1750 BitStream!1750 (_ BitVec 64) (_ BitVec 64)) Unit!3124)

(assert (=> b!43881 (= lt!66765 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2243 lt!66769) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1750 (_ BitVec 8) (_ BitVec 32)) tuple2!4300)

(assert (=> b!43881 (= lt!66769 (appendBitFromByte!0 thiss!1379 (select (arr!1511 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!43882 () Bool)

(declare-fun res!37200 () Bool)

(assert (=> b!43882 (=> (not res!37200) (not e!29253))))

(assert (=> b!43882 (= res!37200 (validate_offset_bits!1 ((_ sign_extend 32) (size!1003 (buf!1343 thiss!1379))) ((_ sign_extend 32) (currentByte!2818 thiss!1379)) ((_ sign_extend 32) (currentBit!2813 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!43883 () Bool)

(assert (=> b!43883 (= e!29252 (array_inv!928 (buf!1343 thiss!1379)))))

(declare-fun b!43884 () Bool)

(assert (=> b!43884 (= e!29257 e!29251)))

(declare-fun res!37197 () Bool)

(assert (=> b!43884 (=> res!37197 e!29251)))

(assert (=> b!43884 (= res!37197 (not (isPrefixOf!0 (_2!2243 lt!66769) (_2!2243 lt!66767))))))

(assert (=> b!43884 (isPrefixOf!0 thiss!1379 (_2!2243 lt!66767))))

(declare-fun lt!66768 () Unit!3124)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1750 BitStream!1750 BitStream!1750) Unit!3124)

(assert (=> b!43884 (= lt!66768 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2243 lt!66769) (_2!2243 lt!66767)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1750 array!2224 (_ BitVec 64) (_ BitVec 64)) tuple2!4300)

(assert (=> b!43884 (= lt!66767 (appendBitsMSBFirstLoop!0 (_2!2243 lt!66769) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!43884 e!29258))

(declare-fun res!37201 () Bool)

(assert (=> b!43884 (=> (not res!37201) (not e!29258))))

(assert (=> b!43884 (= res!37201 (validate_offset_bits!1 ((_ sign_extend 32) (size!1003 (buf!1343 (_2!2243 lt!66769)))) ((_ sign_extend 32) (currentByte!2818 thiss!1379)) ((_ sign_extend 32) (currentBit!2813 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!66763 () Unit!3124)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1750 array!2224 (_ BitVec 64)) Unit!3124)

(assert (=> b!43884 (= lt!66763 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1343 (_2!2243 lt!66769)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1750 BitStream!1750) tuple2!4298)

(assert (=> b!43884 (= lt!66764 (reader!0 thiss!1379 (_2!2243 lt!66769)))))

(declare-fun b!43885 () Bool)

(declare-fun res!37196 () Bool)

(assert (=> b!43885 (=> res!37196 e!29251)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!43885 (= res!37196 (not (invariant!0 (currentBit!2813 (_2!2243 lt!66767)) (currentByte!2818 (_2!2243 lt!66767)) (size!1003 (buf!1343 (_2!2243 lt!66767))))))))

(assert (= (and start!8840 res!37203) b!43882))

(assert (= (and b!43882 res!37200) b!43879))

(assert (= (and b!43879 (not res!37199)) b!43881))

(assert (= (and b!43881 (not res!37202)) b!43884))

(assert (= (and b!43884 res!37201) b!43877))

(assert (= (and b!43884 (not res!37197)) b!43880))

(assert (= (and b!43880 (not res!37198)) b!43885))

(assert (= (and b!43885 (not res!37196)) b!43878))

(assert (= start!8840 b!43883))

(declare-fun m!66823 () Bool)

(assert (=> b!43879 m!66823))

(declare-fun m!66825 () Bool)

(assert (=> b!43879 m!66825))

(declare-fun m!66827 () Bool)

(assert (=> b!43879 m!66827))

(declare-fun m!66829 () Bool)

(assert (=> b!43880 m!66829))

(declare-fun m!66831 () Bool)

(assert (=> b!43883 m!66831))

(declare-fun m!66833 () Bool)

(assert (=> b!43885 m!66833))

(declare-fun m!66835 () Bool)

(assert (=> start!8840 m!66835))

(declare-fun m!66837 () Bool)

(assert (=> start!8840 m!66837))

(declare-fun m!66839 () Bool)

(assert (=> b!43877 m!66839))

(assert (=> b!43877 m!66839))

(declare-fun m!66841 () Bool)

(assert (=> b!43877 m!66841))

(declare-fun m!66843 () Bool)

(assert (=> b!43877 m!66843))

(assert (=> b!43877 m!66843))

(declare-fun m!66845 () Bool)

(assert (=> b!43877 m!66845))

(declare-fun m!66847 () Bool)

(assert (=> b!43884 m!66847))

(declare-fun m!66849 () Bool)

(assert (=> b!43884 m!66849))

(declare-fun m!66851 () Bool)

(assert (=> b!43884 m!66851))

(declare-fun m!66853 () Bool)

(assert (=> b!43884 m!66853))

(declare-fun m!66855 () Bool)

(assert (=> b!43884 m!66855))

(declare-fun m!66857 () Bool)

(assert (=> b!43884 m!66857))

(declare-fun m!66859 () Bool)

(assert (=> b!43884 m!66859))

(declare-fun m!66861 () Bool)

(assert (=> b!43881 m!66861))

(declare-fun m!66863 () Bool)

(assert (=> b!43881 m!66863))

(declare-fun m!66865 () Bool)

(assert (=> b!43881 m!66865))

(assert (=> b!43881 m!66865))

(declare-fun m!66867 () Bool)

(assert (=> b!43881 m!66867))

(declare-fun m!66869 () Bool)

(assert (=> b!43881 m!66869))

(declare-fun m!66871 () Bool)

(assert (=> b!43882 m!66871))

(push 1)

(assert (not b!43884))

(assert (not b!43885))

(assert (not b!43882))

(assert (not b!43877))

(assert (not b!43880))

(assert (not b!43883))

(assert (not b!43879))

(assert (not start!8840))

(assert (not b!43881))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!12768 () Bool)

(assert (=> d!12768 (= (head!335 (byteArrayBitContentToList!0 (_2!2243 lt!66769) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!631 (byteArrayBitContentToList!0 (_2!2243 lt!66769) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!43877 d!12768))

(declare-fun d!12770 () Bool)

(declare-fun c!2916 () Bool)

(assert (=> d!12770 (= c!2916 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!29318 () List!516)

(assert (=> d!12770 (= (byteArrayBitContentToList!0 (_2!2243 lt!66769) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!29318)))

(declare-fun b!43959 () Bool)

(assert (=> b!43959 (= e!29318 Nil!513)))

(declare-fun b!43960 () Bool)

(assert (=> b!43960 (= e!29318 (Cons!512 (not (= (bvand ((_ sign_extend 24) (select (arr!1511 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2243 lt!66769) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!12770 c!2916) b!43959))

(assert (= (and d!12770 (not c!2916)) b!43960))

(assert (=> b!43960 m!66865))

(declare-fun m!66987 () Bool)

(assert (=> b!43960 m!66987))

(declare-fun m!66989 () Bool)

(assert (=> b!43960 m!66989))

(assert (=> b!43877 d!12770))

(declare-fun d!12772 () Bool)

(assert (=> d!12772 (= (head!335 (bitStreamReadBitsIntoList!0 (_2!2243 lt!66769) (_1!2242 lt!66764) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!631 (bitStreamReadBitsIntoList!0 (_2!2243 lt!66769) (_1!2242 lt!66764) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!43877 d!12772))

(declare-datatypes ((tuple2!4310 0))(
  ( (tuple2!4311 (_1!2248 Bool) (_2!2248 BitStream!1750)) )
))
(declare-fun lt!66848 () tuple2!4310)

(declare-fun lt!66850 () (_ BitVec 64))

(declare-datatypes ((tuple2!4312 0))(
  ( (tuple2!4313 (_1!2249 List!516) (_2!2249 BitStream!1750)) )
))
(declare-fun e!29324 () tuple2!4312)

(declare-fun b!43970 () Bool)

(assert (=> b!43970 (= e!29324 (tuple2!4313 (Cons!512 (_1!2248 lt!66848) (bitStreamReadBitsIntoList!0 (_2!2243 lt!66769) (_2!2248 lt!66848) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!66850))) (_2!2248 lt!66848)))))

(declare-fun readBit!0 (BitStream!1750) tuple2!4310)

(assert (=> b!43970 (= lt!66848 (readBit!0 (_1!2242 lt!66764)))))

(assert (=> b!43970 (= lt!66850 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!43971 () Bool)

(declare-fun e!29323 () Bool)

(declare-fun lt!66849 () List!516)

(declare-fun isEmpty!122 (List!516) Bool)

(assert (=> b!43971 (= e!29323 (isEmpty!122 lt!66849))))

(declare-fun b!43972 () Bool)

(declare-fun length!220 (List!516) Int)

(assert (=> b!43972 (= e!29323 (> (length!220 lt!66849) 0))))

(declare-fun d!12774 () Bool)

(assert (=> d!12774 e!29323))

(declare-fun c!2921 () Bool)

(assert (=> d!12774 (= c!2921 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!12774 (= lt!66849 (_1!2249 e!29324))))

(declare-fun c!2922 () Bool)

(assert (=> d!12774 (= c!2922 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!12774 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!12774 (= (bitStreamReadBitsIntoList!0 (_2!2243 lt!66769) (_1!2242 lt!66764) #b0000000000000000000000000000000000000000000000000000000000000001) lt!66849)))

(declare-fun b!43969 () Bool)

(assert (=> b!43969 (= e!29324 (tuple2!4313 Nil!513 (_1!2242 lt!66764)))))

(assert (= (and d!12774 c!2922) b!43969))

(assert (= (and d!12774 (not c!2922)) b!43970))

(assert (= (and d!12774 c!2921) b!43971))

(assert (= (and d!12774 (not c!2921)) b!43972))

(declare-fun m!66991 () Bool)

(assert (=> b!43970 m!66991))

(declare-fun m!66993 () Bool)

(assert (=> b!43970 m!66993))

(declare-fun m!66995 () Bool)

(assert (=> b!43971 m!66995))

(declare-fun m!66997 () Bool)

(assert (=> b!43972 m!66997))

(assert (=> b!43877 d!12774))

(declare-fun d!12778 () Bool)

(assert (=> d!12778 (= (array_inv!928 srcBuffer!2) (bvsge (size!1003 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!8840 d!12778))

(declare-fun d!12780 () Bool)

(assert (=> d!12780 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2813 thiss!1379) (currentByte!2818 thiss!1379) (size!1003 (buf!1343 thiss!1379))))))

(declare-fun bs!3419 () Bool)

(assert (= bs!3419 d!12780))

(declare-fun m!66999 () Bool)

(assert (=> bs!3419 m!66999))

(assert (=> start!8840 d!12780))

(declare-fun d!12782 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!12782 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1003 (buf!1343 thiss!1379))) ((_ sign_extend 32) (currentByte!2818 thiss!1379)) ((_ sign_extend 32) (currentBit!2813 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1003 (buf!1343 thiss!1379))) ((_ sign_extend 32) (currentByte!2818 thiss!1379)) ((_ sign_extend 32) (currentBit!2813 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3420 () Bool)

(assert (= bs!3420 d!12782))

(declare-fun m!67001 () Bool)

(assert (=> bs!3420 m!67001))

(assert (=> b!43882 d!12782))

(declare-fun d!12784 () Bool)

(declare-fun res!37277 () Bool)

(declare-fun e!29332 () Bool)

(assert (=> d!12784 (=> (not res!37277) (not e!29332))))

(assert (=> d!12784 (= res!37277 (= (size!1003 (buf!1343 (_2!2243 lt!66769))) (size!1003 (buf!1343 (_2!2243 lt!66767)))))))

(assert (=> d!12784 (= (isPrefixOf!0 (_2!2243 lt!66769) (_2!2243 lt!66767)) e!29332)))

(declare-fun b!43979 () Bool)

(declare-fun res!37276 () Bool)

(assert (=> b!43979 (=> (not res!37276) (not e!29332))))

(assert (=> b!43979 (= res!37276 (bvsle (bitIndex!0 (size!1003 (buf!1343 (_2!2243 lt!66769))) (currentByte!2818 (_2!2243 lt!66769)) (currentBit!2813 (_2!2243 lt!66769))) (bitIndex!0 (size!1003 (buf!1343 (_2!2243 lt!66767))) (currentByte!2818 (_2!2243 lt!66767)) (currentBit!2813 (_2!2243 lt!66767)))))))

(declare-fun b!43980 () Bool)

(declare-fun e!29331 () Bool)

(assert (=> b!43980 (= e!29332 e!29331)))

(declare-fun res!37275 () Bool)

(assert (=> b!43980 (=> res!37275 e!29331)))

(assert (=> b!43980 (= res!37275 (= (size!1003 (buf!1343 (_2!2243 lt!66769))) #b00000000000000000000000000000000))))

(declare-fun b!43981 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2224 array!2224 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!43981 (= e!29331 (arrayBitRangesEq!0 (buf!1343 (_2!2243 lt!66769)) (buf!1343 (_2!2243 lt!66767)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1003 (buf!1343 (_2!2243 lt!66769))) (currentByte!2818 (_2!2243 lt!66769)) (currentBit!2813 (_2!2243 lt!66769)))))))

(assert (= (and d!12784 res!37277) b!43979))

(assert (= (and b!43979 res!37276) b!43980))

(assert (= (and b!43980 (not res!37275)) b!43981))

(declare-fun m!67003 () Bool)

(assert (=> b!43979 m!67003))

(assert (=> b!43979 m!66829))

(assert (=> b!43981 m!67003))

(assert (=> b!43981 m!67003))

(declare-fun m!67005 () Bool)

(assert (=> b!43981 m!67005))

(assert (=> b!43884 d!12784))

(declare-fun d!12786 () Bool)

(declare-fun res!37282 () Bool)

(declare-fun e!29334 () Bool)

(assert (=> d!12786 (=> (not res!37282) (not e!29334))))

(assert (=> d!12786 (= res!37282 (= (size!1003 (buf!1343 thiss!1379)) (size!1003 (buf!1343 (_2!2243 lt!66767)))))))

(assert (=> d!12786 (= (isPrefixOf!0 thiss!1379 (_2!2243 lt!66767)) e!29334)))

(declare-fun b!43986 () Bool)

(declare-fun res!37281 () Bool)

(assert (=> b!43986 (=> (not res!37281) (not e!29334))))

(assert (=> b!43986 (= res!37281 (bvsle (bitIndex!0 (size!1003 (buf!1343 thiss!1379)) (currentByte!2818 thiss!1379) (currentBit!2813 thiss!1379)) (bitIndex!0 (size!1003 (buf!1343 (_2!2243 lt!66767))) (currentByte!2818 (_2!2243 lt!66767)) (currentBit!2813 (_2!2243 lt!66767)))))))

(declare-fun b!43987 () Bool)

(declare-fun e!29333 () Bool)

(assert (=> b!43987 (= e!29334 e!29333)))

(declare-fun res!37280 () Bool)

(assert (=> b!43987 (=> res!37280 e!29333)))

(assert (=> b!43987 (= res!37280 (= (size!1003 (buf!1343 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!43988 () Bool)

(assert (=> b!43988 (= e!29333 (arrayBitRangesEq!0 (buf!1343 thiss!1379) (buf!1343 (_2!2243 lt!66767)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1003 (buf!1343 thiss!1379)) (currentByte!2818 thiss!1379) (currentBit!2813 thiss!1379))))))

(assert (= (and d!12786 res!37282) b!43986))

(assert (= (and b!43986 res!37281) b!43987))

(assert (= (and b!43987 (not res!37280)) b!43988))

(assert (=> b!43986 m!66827))

(assert (=> b!43986 m!66829))

(assert (=> b!43988 m!66827))

(assert (=> b!43988 m!66827))

(declare-fun m!67007 () Bool)

(assert (=> b!43988 m!67007))

(assert (=> b!43884 d!12786))

(declare-fun b!44081 () Bool)

(declare-fun res!37346 () Bool)

(declare-fun e!29377 () Bool)

(assert (=> b!44081 (=> (not res!37346) (not e!29377))))

(declare-fun lt!67207 () tuple2!4300)

(assert (=> b!44081 (= res!37346 (invariant!0 (currentBit!2813 (_2!2243 lt!67207)) (currentByte!2818 (_2!2243 lt!67207)) (size!1003 (buf!1343 (_2!2243 lt!67207)))))))

(declare-fun d!12788 () Bool)

(assert (=> d!12788 e!29377))

(declare-fun res!37342 () Bool)

(assert (=> d!12788 (=> (not res!37342) (not e!29377))))

(declare-fun lt!67183 () (_ BitVec 64))

(assert (=> d!12788 (= res!37342 (= (bitIndex!0 (size!1003 (buf!1343 (_2!2243 lt!67207))) (currentByte!2818 (_2!2243 lt!67207)) (currentBit!2813 (_2!2243 lt!67207))) (bvsub lt!67183 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!12788 (or (= (bvand lt!67183 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!67183 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!67183 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!67208 () (_ BitVec 64))

(assert (=> d!12788 (= lt!67183 (bvadd lt!67208 to!314))))

(assert (=> d!12788 (or (not (= (bvand lt!67208 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!67208 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!67208 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!12788 (= lt!67208 (bitIndex!0 (size!1003 (buf!1343 (_2!2243 lt!66769))) (currentByte!2818 (_2!2243 lt!66769)) (currentBit!2813 (_2!2243 lt!66769))))))

(declare-fun e!29379 () tuple2!4300)

(assert (=> d!12788 (= lt!67207 e!29379)))

(declare-fun c!2940 () Bool)

(assert (=> d!12788 (= c!2940 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!67189 () Unit!3124)

(declare-fun lt!67201 () Unit!3124)

(assert (=> d!12788 (= lt!67189 lt!67201)))

(assert (=> d!12788 (isPrefixOf!0 (_2!2243 lt!66769) (_2!2243 lt!66769))))

(assert (=> d!12788 (= lt!67201 (lemmaIsPrefixRefl!0 (_2!2243 lt!66769)))))

(declare-fun lt!67186 () (_ BitVec 64))

(assert (=> d!12788 (= lt!67186 (bitIndex!0 (size!1003 (buf!1343 (_2!2243 lt!66769))) (currentByte!2818 (_2!2243 lt!66769)) (currentBit!2813 (_2!2243 lt!66769))))))

(assert (=> d!12788 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!12788 (= (appendBitsMSBFirstLoop!0 (_2!2243 lt!66769) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!67207)))

(declare-fun b!44082 () Bool)

(declare-fun res!37341 () Bool)

(assert (=> b!44082 (=> (not res!37341) (not e!29377))))

(assert (=> b!44082 (= res!37341 (= (size!1003 (buf!1343 (_2!2243 lt!67207))) (size!1003 (buf!1343 (_2!2243 lt!66769)))))))

(declare-fun lt!67213 () tuple2!4298)

(declare-fun b!44083 () Bool)

(assert (=> b!44083 (= e!29377 (= (bitStreamReadBitsIntoList!0 (_2!2243 lt!67207) (_1!2242 lt!67213) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2243 lt!67207) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!44083 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!44083 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!67179 () Unit!3124)

(declare-fun lt!67197 () Unit!3124)

(assert (=> b!44083 (= lt!67179 lt!67197)))

(declare-fun lt!67212 () (_ BitVec 64))

(assert (=> b!44083 (validate_offset_bits!1 ((_ sign_extend 32) (size!1003 (buf!1343 (_2!2243 lt!67207)))) ((_ sign_extend 32) (currentByte!2818 (_2!2243 lt!66769))) ((_ sign_extend 32) (currentBit!2813 (_2!2243 lt!66769))) lt!67212)))

(assert (=> b!44083 (= lt!67197 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2243 lt!66769) (buf!1343 (_2!2243 lt!67207)) lt!67212))))

(declare-fun e!29378 () Bool)

(assert (=> b!44083 e!29378))

(declare-fun res!37343 () Bool)

(assert (=> b!44083 (=> (not res!37343) (not e!29378))))

(assert (=> b!44083 (= res!37343 (and (= (size!1003 (buf!1343 (_2!2243 lt!66769))) (size!1003 (buf!1343 (_2!2243 lt!67207)))) (bvsge lt!67212 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!44083 (= lt!67212 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!44083 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!44083 (= lt!67213 (reader!0 (_2!2243 lt!66769) (_2!2243 lt!67207)))))

(declare-fun b!44084 () Bool)

(declare-fun Unit!3130 () Unit!3124)

(assert (=> b!44084 (= e!29379 (tuple2!4301 Unit!3130 (_2!2243 lt!66769)))))

(assert (=> b!44084 (= (size!1003 (buf!1343 (_2!2243 lt!66769))) (size!1003 (buf!1343 (_2!2243 lt!66769))))))

(declare-fun lt!67202 () Unit!3124)

(declare-fun Unit!3131 () Unit!3124)

(assert (=> b!44084 (= lt!67202 Unit!3131)))

(declare-fun call!523 () tuple2!4298)

(declare-fun checkByteArrayBitContent!0 (BitStream!1750 array!2224 array!2224 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!4314 0))(
  ( (tuple2!4315 (_1!2250 array!2224) (_2!2250 BitStream!1750)) )
))
(declare-fun readBits!0 (BitStream!1750 (_ BitVec 64)) tuple2!4314)

(assert (=> b!44084 (checkByteArrayBitContent!0 (_2!2243 lt!66769) srcBuffer!2 (_1!2250 (readBits!0 (_1!2242 call!523) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!44085 () Bool)

(declare-fun lt!67193 () tuple2!4300)

(declare-fun Unit!3132 () Unit!3124)

(assert (=> b!44085 (= e!29379 (tuple2!4301 Unit!3132 (_2!2243 lt!67193)))))

(declare-fun lt!67187 () tuple2!4300)

(assert (=> b!44085 (= lt!67187 (appendBitFromByte!0 (_2!2243 lt!66769) (select (arr!1511 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!67174 () (_ BitVec 64))

(assert (=> b!44085 (= lt!67174 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!67194 () (_ BitVec 64))

(assert (=> b!44085 (= lt!67194 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!67177 () Unit!3124)

(assert (=> b!44085 (= lt!67177 (validateOffsetBitsIneqLemma!0 (_2!2243 lt!66769) (_2!2243 lt!67187) lt!67174 lt!67194))))

(assert (=> b!44085 (validate_offset_bits!1 ((_ sign_extend 32) (size!1003 (buf!1343 (_2!2243 lt!67187)))) ((_ sign_extend 32) (currentByte!2818 (_2!2243 lt!67187))) ((_ sign_extend 32) (currentBit!2813 (_2!2243 lt!67187))) (bvsub lt!67174 lt!67194))))

(declare-fun lt!67176 () Unit!3124)

(assert (=> b!44085 (= lt!67176 lt!67177)))

(declare-fun lt!67210 () tuple2!4298)

(assert (=> b!44085 (= lt!67210 (reader!0 (_2!2243 lt!66769) (_2!2243 lt!67187)))))

(declare-fun lt!67184 () (_ BitVec 64))

(assert (=> b!44085 (= lt!67184 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!67191 () Unit!3124)

(assert (=> b!44085 (= lt!67191 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2243 lt!66769) (buf!1343 (_2!2243 lt!67187)) lt!67184))))

(assert (=> b!44085 (validate_offset_bits!1 ((_ sign_extend 32) (size!1003 (buf!1343 (_2!2243 lt!67187)))) ((_ sign_extend 32) (currentByte!2818 (_2!2243 lt!66769))) ((_ sign_extend 32) (currentBit!2813 (_2!2243 lt!66769))) lt!67184)))

(declare-fun lt!67205 () Unit!3124)

(assert (=> b!44085 (= lt!67205 lt!67191)))

(assert (=> b!44085 (= (head!335 (byteArrayBitContentToList!0 (_2!2243 lt!67187) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!335 (bitStreamReadBitsIntoList!0 (_2!2243 lt!67187) (_1!2242 lt!67210) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!67180 () Unit!3124)

(declare-fun Unit!3133 () Unit!3124)

(assert (=> b!44085 (= lt!67180 Unit!3133)))

(assert (=> b!44085 (= lt!67193 (appendBitsMSBFirstLoop!0 (_2!2243 lt!67187) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!67206 () Unit!3124)

(assert (=> b!44085 (= lt!67206 (lemmaIsPrefixTransitive!0 (_2!2243 lt!66769) (_2!2243 lt!67187) (_2!2243 lt!67193)))))

(assert (=> b!44085 (isPrefixOf!0 (_2!2243 lt!66769) (_2!2243 lt!67193))))

(declare-fun lt!67198 () Unit!3124)

(assert (=> b!44085 (= lt!67198 lt!67206)))

(assert (=> b!44085 (= (size!1003 (buf!1343 (_2!2243 lt!67193))) (size!1003 (buf!1343 (_2!2243 lt!66769))))))

(declare-fun lt!67185 () Unit!3124)

(declare-fun Unit!3135 () Unit!3124)

(assert (=> b!44085 (= lt!67185 Unit!3135)))

(assert (=> b!44085 (= (bitIndex!0 (size!1003 (buf!1343 (_2!2243 lt!67193))) (currentByte!2818 (_2!2243 lt!67193)) (currentBit!2813 (_2!2243 lt!67193))) (bvsub (bvadd (bitIndex!0 (size!1003 (buf!1343 (_2!2243 lt!66769))) (currentByte!2818 (_2!2243 lt!66769)) (currentBit!2813 (_2!2243 lt!66769))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!67195 () Unit!3124)

(declare-fun Unit!3137 () Unit!3124)

(assert (=> b!44085 (= lt!67195 Unit!3137)))

(assert (=> b!44085 (= (bitIndex!0 (size!1003 (buf!1343 (_2!2243 lt!67193))) (currentByte!2818 (_2!2243 lt!67193)) (currentBit!2813 (_2!2243 lt!67193))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1003 (buf!1343 (_2!2243 lt!67187))) (currentByte!2818 (_2!2243 lt!67187)) (currentBit!2813 (_2!2243 lt!67187))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!67190 () Unit!3124)

(declare-fun Unit!3138 () Unit!3124)

(assert (=> b!44085 (= lt!67190 Unit!3138)))

(declare-fun lt!67216 () tuple2!4298)

(assert (=> b!44085 (= lt!67216 call!523)))

(declare-fun lt!67188 () (_ BitVec 64))

(assert (=> b!44085 (= lt!67188 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!67181 () Unit!3124)

(assert (=> b!44085 (= lt!67181 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2243 lt!66769) (buf!1343 (_2!2243 lt!67193)) lt!67188))))

(assert (=> b!44085 (validate_offset_bits!1 ((_ sign_extend 32) (size!1003 (buf!1343 (_2!2243 lt!67193)))) ((_ sign_extend 32) (currentByte!2818 (_2!2243 lt!66769))) ((_ sign_extend 32) (currentBit!2813 (_2!2243 lt!66769))) lt!67188)))

(declare-fun lt!67209 () Unit!3124)

(assert (=> b!44085 (= lt!67209 lt!67181)))

(declare-fun lt!67203 () tuple2!4298)

(assert (=> b!44085 (= lt!67203 (reader!0 (_2!2243 lt!67187) (_2!2243 lt!67193)))))

(declare-fun lt!67204 () (_ BitVec 64))

(assert (=> b!44085 (= lt!67204 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!67214 () Unit!3124)

(assert (=> b!44085 (= lt!67214 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2243 lt!67187) (buf!1343 (_2!2243 lt!67193)) lt!67204))))

(assert (=> b!44085 (validate_offset_bits!1 ((_ sign_extend 32) (size!1003 (buf!1343 (_2!2243 lt!67193)))) ((_ sign_extend 32) (currentByte!2818 (_2!2243 lt!67187))) ((_ sign_extend 32) (currentBit!2813 (_2!2243 lt!67187))) lt!67204)))

(declare-fun lt!67196 () Unit!3124)

(assert (=> b!44085 (= lt!67196 lt!67214)))

(declare-fun lt!67182 () List!516)

(assert (=> b!44085 (= lt!67182 (byteArrayBitContentToList!0 (_2!2243 lt!67193) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!67200 () List!516)

(assert (=> b!44085 (= lt!67200 (byteArrayBitContentToList!0 (_2!2243 lt!67193) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!67215 () List!516)

(assert (=> b!44085 (= lt!67215 (bitStreamReadBitsIntoList!0 (_2!2243 lt!67193) (_1!2242 lt!67216) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!67211 () List!516)

(assert (=> b!44085 (= lt!67211 (bitStreamReadBitsIntoList!0 (_2!2243 lt!67193) (_1!2242 lt!67203) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!67199 () (_ BitVec 64))

(assert (=> b!44085 (= lt!67199 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!67178 () Unit!3124)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1750 BitStream!1750 BitStream!1750 BitStream!1750 (_ BitVec 64) List!516) Unit!3124)

(assert (=> b!44085 (= lt!67178 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2243 lt!67193) (_2!2243 lt!67193) (_1!2242 lt!67216) (_1!2242 lt!67203) lt!67199 lt!67215))))

(declare-fun tail!211 (List!516) List!516)

(assert (=> b!44085 (= (bitStreamReadBitsIntoList!0 (_2!2243 lt!67193) (_1!2242 lt!67203) (bvsub lt!67199 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!211 lt!67215))))

(declare-fun lt!67192 () Unit!3124)

(assert (=> b!44085 (= lt!67192 lt!67178)))

(declare-fun lt!67175 () Unit!3124)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2224 array!2224 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3124)

(assert (=> b!44085 (= lt!67175 (arrayBitRangesEqImpliesEq!0 (buf!1343 (_2!2243 lt!67187)) (buf!1343 (_2!2243 lt!67193)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!67186 (bitIndex!0 (size!1003 (buf!1343 (_2!2243 lt!67187))) (currentByte!2818 (_2!2243 lt!67187)) (currentBit!2813 (_2!2243 lt!67187)))))))

(declare-fun bitAt!0 (array!2224 (_ BitVec 64)) Bool)

(assert (=> b!44085 (= (bitAt!0 (buf!1343 (_2!2243 lt!67187)) lt!67186) (bitAt!0 (buf!1343 (_2!2243 lt!67193)) lt!67186))))

(declare-fun lt!67173 () Unit!3124)

(assert (=> b!44085 (= lt!67173 lt!67175)))

(declare-fun b!44086 () Bool)

(declare-fun res!37345 () Bool)

(assert (=> b!44086 (=> (not res!37345) (not e!29377))))

(assert (=> b!44086 (= res!37345 (isPrefixOf!0 (_2!2243 lt!66769) (_2!2243 lt!67207)))))

(declare-fun bm!520 () Bool)

(assert (=> bm!520 (= call!523 (reader!0 (_2!2243 lt!66769) (ite c!2940 (_2!2243 lt!67193) (_2!2243 lt!66769))))))

(declare-fun b!44087 () Bool)

(assert (=> b!44087 (= e!29378 (validate_offset_bits!1 ((_ sign_extend 32) (size!1003 (buf!1343 (_2!2243 lt!66769)))) ((_ sign_extend 32) (currentByte!2818 (_2!2243 lt!66769))) ((_ sign_extend 32) (currentBit!2813 (_2!2243 lt!66769))) lt!67212))))

(declare-fun b!44088 () Bool)

(declare-fun res!37344 () Bool)

(assert (=> b!44088 (=> (not res!37344) (not e!29377))))

(assert (=> b!44088 (= res!37344 (= (size!1003 (buf!1343 (_2!2243 lt!66769))) (size!1003 (buf!1343 (_2!2243 lt!67207)))))))

(assert (= (and d!12788 c!2940) b!44085))

(assert (= (and d!12788 (not c!2940)) b!44084))

(assert (= (or b!44085 b!44084) bm!520))

(assert (= (and d!12788 res!37342) b!44081))

(assert (= (and b!44081 res!37346) b!44088))

(assert (= (and b!44088 res!37344) b!44086))

(assert (= (and b!44086 res!37345) b!44082))

(assert (= (and b!44082 res!37341) b!44083))

(assert (= (and b!44083 res!37343) b!44087))

(declare-fun m!67159 () Bool)

(assert (=> b!44086 m!67159))

(declare-fun m!67161 () Bool)

(assert (=> b!44081 m!67161))

(declare-fun m!67163 () Bool)

(assert (=> b!44085 m!67163))

(declare-fun m!67165 () Bool)

(assert (=> b!44085 m!67165))

(declare-fun m!67167 () Bool)

(assert (=> b!44085 m!67167))

(declare-fun m!67169 () Bool)

(assert (=> b!44085 m!67169))

(declare-fun m!67171 () Bool)

(assert (=> b!44085 m!67171))

(declare-fun m!67173 () Bool)

(assert (=> b!44085 m!67173))

(declare-fun m!67175 () Bool)

(assert (=> b!44085 m!67175))

(declare-fun m!67177 () Bool)

(assert (=> b!44085 m!67177))

(declare-fun m!67179 () Bool)

(assert (=> b!44085 m!67179))

(declare-fun m!67181 () Bool)

(assert (=> b!44085 m!67181))

(declare-fun m!67183 () Bool)

(assert (=> b!44085 m!67183))

(declare-fun m!67185 () Bool)

(assert (=> b!44085 m!67185))

(assert (=> b!44085 m!67181))

(declare-fun m!67187 () Bool)

(assert (=> b!44085 m!67187))

(declare-fun m!67189 () Bool)

(assert (=> b!44085 m!67189))

(declare-fun m!67191 () Bool)

(assert (=> b!44085 m!67191))

(declare-fun m!67193 () Bool)

(assert (=> b!44085 m!67193))

(declare-fun m!67195 () Bool)

(assert (=> b!44085 m!67195))

(declare-fun m!67197 () Bool)

(assert (=> b!44085 m!67197))

(declare-fun m!67199 () Bool)

(assert (=> b!44085 m!67199))

(declare-fun m!67201 () Bool)

(assert (=> b!44085 m!67201))

(assert (=> b!44085 m!67183))

(assert (=> b!44085 m!67189))

(declare-fun m!67203 () Bool)

(assert (=> b!44085 m!67203))

(declare-fun m!67205 () Bool)

(assert (=> b!44085 m!67205))

(declare-fun m!67207 () Bool)

(assert (=> b!44085 m!67207))

(declare-fun m!67209 () Bool)

(assert (=> b!44085 m!67209))

(declare-fun m!67211 () Bool)

(assert (=> b!44085 m!67211))

(assert (=> b!44085 m!67203))

(declare-fun m!67213 () Bool)

(assert (=> b!44085 m!67213))

(declare-fun m!67215 () Bool)

(assert (=> b!44085 m!67215))

(declare-fun m!67217 () Bool)

(assert (=> b!44085 m!67217))

(declare-fun m!67219 () Bool)

(assert (=> b!44085 m!67219))

(assert (=> b!44085 m!67003))

(declare-fun m!67221 () Bool)

(assert (=> b!44085 m!67221))

(declare-fun m!67223 () Bool)

(assert (=> b!44085 m!67223))

(declare-fun m!67225 () Bool)

(assert (=> b!44087 m!67225))

(declare-fun m!67227 () Bool)

(assert (=> b!44084 m!67227))

(declare-fun m!67229 () Bool)

(assert (=> b!44084 m!67229))

(declare-fun m!67231 () Bool)

(assert (=> b!44083 m!67231))

(declare-fun m!67233 () Bool)

(assert (=> b!44083 m!67233))

(declare-fun m!67235 () Bool)

(assert (=> b!44083 m!67235))

(declare-fun m!67237 () Bool)

(assert (=> b!44083 m!67237))

(declare-fun m!67239 () Bool)

(assert (=> b!44083 m!67239))

(declare-fun m!67241 () Bool)

(assert (=> d!12788 m!67241))

(assert (=> d!12788 m!67003))

(declare-fun m!67243 () Bool)

(assert (=> d!12788 m!67243))

(declare-fun m!67245 () Bool)

(assert (=> d!12788 m!67245))

(declare-fun m!67247 () Bool)

(assert (=> bm!520 m!67247))

(assert (=> b!43884 d!12788))

(declare-fun d!12828 () Bool)

(assert (=> d!12828 (isPrefixOf!0 thiss!1379 (_2!2243 lt!66767))))

(declare-fun lt!67219 () Unit!3124)

(declare-fun choose!30 (BitStream!1750 BitStream!1750 BitStream!1750) Unit!3124)

(assert (=> d!12828 (= lt!67219 (choose!30 thiss!1379 (_2!2243 lt!66769) (_2!2243 lt!66767)))))

(assert (=> d!12828 (isPrefixOf!0 thiss!1379 (_2!2243 lt!66769))))

(assert (=> d!12828 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2243 lt!66769) (_2!2243 lt!66767)) lt!67219)))

(declare-fun bs!3428 () Bool)

(assert (= bs!3428 d!12828))

(assert (=> bs!3428 m!66847))

(declare-fun m!67249 () Bool)

(assert (=> bs!3428 m!67249))

(assert (=> bs!3428 m!66861))

(assert (=> b!43884 d!12828))

(declare-fun d!12830 () Bool)

(assert (=> d!12830 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1003 (buf!1343 (_2!2243 lt!66769)))) ((_ sign_extend 32) (currentByte!2818 thiss!1379)) ((_ sign_extend 32) (currentBit!2813 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1003 (buf!1343 (_2!2243 lt!66769)))) ((_ sign_extend 32) (currentByte!2818 thiss!1379)) ((_ sign_extend 32) (currentBit!2813 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!3429 () Bool)

(assert (= bs!3429 d!12830))

(declare-fun m!67251 () Bool)

(assert (=> bs!3429 m!67251))

(assert (=> b!43884 d!12830))

(declare-fun lt!67325 () (_ BitVec 64))

(declare-fun b!44120 () Bool)

(declare-fun lt!67335 () (_ BitVec 64))

(declare-fun e!29394 () Bool)

(declare-fun lt!67321 () tuple2!4298)

(declare-fun withMovedBitIndex!0 (BitStream!1750 (_ BitVec 64)) BitStream!1750)

(assert (=> b!44120 (= e!29394 (= (_1!2242 lt!67321) (withMovedBitIndex!0 (_2!2242 lt!67321) (bvsub lt!67325 lt!67335))))))

(assert (=> b!44120 (or (= (bvand lt!67325 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!67335 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!67325 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!67325 lt!67335) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!44120 (= lt!67335 (bitIndex!0 (size!1003 (buf!1343 (_2!2243 lt!66769))) (currentByte!2818 (_2!2243 lt!66769)) (currentBit!2813 (_2!2243 lt!66769))))))

(assert (=> b!44120 (= lt!67325 (bitIndex!0 (size!1003 (buf!1343 thiss!1379)) (currentByte!2818 thiss!1379) (currentBit!2813 thiss!1379)))))

(declare-fun b!44121 () Bool)

(declare-fun e!29395 () Unit!3124)

(declare-fun Unit!3144 () Unit!3124)

(assert (=> b!44121 (= e!29395 Unit!3144)))

(declare-fun d!12832 () Bool)

(assert (=> d!12832 e!29394))

(declare-fun res!37368 () Bool)

(assert (=> d!12832 (=> (not res!37368) (not e!29394))))

(assert (=> d!12832 (= res!37368 (isPrefixOf!0 (_1!2242 lt!67321) (_2!2242 lt!67321)))))

(declare-fun lt!67334 () BitStream!1750)

(assert (=> d!12832 (= lt!67321 (tuple2!4299 lt!67334 (_2!2243 lt!66769)))))

(declare-fun lt!67331 () Unit!3124)

(declare-fun lt!67327 () Unit!3124)

(assert (=> d!12832 (= lt!67331 lt!67327)))

(assert (=> d!12832 (isPrefixOf!0 lt!67334 (_2!2243 lt!66769))))

(assert (=> d!12832 (= lt!67327 (lemmaIsPrefixTransitive!0 lt!67334 (_2!2243 lt!66769) (_2!2243 lt!66769)))))

(declare-fun lt!67323 () Unit!3124)

(declare-fun lt!67333 () Unit!3124)

(assert (=> d!12832 (= lt!67323 lt!67333)))

(assert (=> d!12832 (isPrefixOf!0 lt!67334 (_2!2243 lt!66769))))

(assert (=> d!12832 (= lt!67333 (lemmaIsPrefixTransitive!0 lt!67334 thiss!1379 (_2!2243 lt!66769)))))

(declare-fun lt!67337 () Unit!3124)

(assert (=> d!12832 (= lt!67337 e!29395)))

(declare-fun c!2946 () Bool)

(assert (=> d!12832 (= c!2946 (not (= (size!1003 (buf!1343 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!67326 () Unit!3124)

(declare-fun lt!67330 () Unit!3124)

(assert (=> d!12832 (= lt!67326 lt!67330)))

(assert (=> d!12832 (isPrefixOf!0 (_2!2243 lt!66769) (_2!2243 lt!66769))))

(assert (=> d!12832 (= lt!67330 (lemmaIsPrefixRefl!0 (_2!2243 lt!66769)))))

(declare-fun lt!67328 () Unit!3124)

(declare-fun lt!67336 () Unit!3124)

(assert (=> d!12832 (= lt!67328 lt!67336)))

(assert (=> d!12832 (= lt!67336 (lemmaIsPrefixRefl!0 (_2!2243 lt!66769)))))

(declare-fun lt!67329 () Unit!3124)

(declare-fun lt!67324 () Unit!3124)

(assert (=> d!12832 (= lt!67329 lt!67324)))

(assert (=> d!12832 (isPrefixOf!0 lt!67334 lt!67334)))

(assert (=> d!12832 (= lt!67324 (lemmaIsPrefixRefl!0 lt!67334))))

(declare-fun lt!67332 () Unit!3124)

(declare-fun lt!67339 () Unit!3124)

(assert (=> d!12832 (= lt!67332 lt!67339)))

(assert (=> d!12832 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!12832 (= lt!67339 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!12832 (= lt!67334 (BitStream!1751 (buf!1343 (_2!2243 lt!66769)) (currentByte!2818 thiss!1379) (currentBit!2813 thiss!1379)))))

(assert (=> d!12832 (isPrefixOf!0 thiss!1379 (_2!2243 lt!66769))))

(assert (=> d!12832 (= (reader!0 thiss!1379 (_2!2243 lt!66769)) lt!67321)))

(declare-fun b!44122 () Bool)

(declare-fun res!37370 () Bool)

(assert (=> b!44122 (=> (not res!37370) (not e!29394))))

(assert (=> b!44122 (= res!37370 (isPrefixOf!0 (_1!2242 lt!67321) thiss!1379))))

(declare-fun b!44123 () Bool)

(declare-fun lt!67322 () Unit!3124)

(assert (=> b!44123 (= e!29395 lt!67322)))

(declare-fun lt!67320 () (_ BitVec 64))

(assert (=> b!44123 (= lt!67320 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67338 () (_ BitVec 64))

(assert (=> b!44123 (= lt!67338 (bitIndex!0 (size!1003 (buf!1343 thiss!1379)) (currentByte!2818 thiss!1379) (currentBit!2813 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2224 array!2224 (_ BitVec 64) (_ BitVec 64)) Unit!3124)

(assert (=> b!44123 (= lt!67322 (arrayBitRangesEqSymmetric!0 (buf!1343 thiss!1379) (buf!1343 (_2!2243 lt!66769)) lt!67320 lt!67338))))

(assert (=> b!44123 (arrayBitRangesEq!0 (buf!1343 (_2!2243 lt!66769)) (buf!1343 thiss!1379) lt!67320 lt!67338)))

(declare-fun b!44124 () Bool)

(declare-fun res!37369 () Bool)

(assert (=> b!44124 (=> (not res!37369) (not e!29394))))

(assert (=> b!44124 (= res!37369 (isPrefixOf!0 (_2!2242 lt!67321) (_2!2243 lt!66769)))))

(assert (= (and d!12832 c!2946) b!44123))

(assert (= (and d!12832 (not c!2946)) b!44121))

(assert (= (and d!12832 res!37368) b!44122))

(assert (= (and b!44122 res!37370) b!44124))

(assert (= (and b!44124 res!37369) b!44120))

(declare-fun m!67281 () Bool)

(assert (=> b!44124 m!67281))

(declare-fun m!67283 () Bool)

(assert (=> b!44120 m!67283))

(assert (=> b!44120 m!67003))

(assert (=> b!44120 m!66827))

(assert (=> b!44123 m!66827))

(declare-fun m!67285 () Bool)

(assert (=> b!44123 m!67285))

(declare-fun m!67287 () Bool)

(assert (=> b!44123 m!67287))

(declare-fun m!67289 () Bool)

(assert (=> d!12832 m!67289))

(assert (=> d!12832 m!66825))

(assert (=> d!12832 m!67245))

(declare-fun m!67291 () Bool)

(assert (=> d!12832 m!67291))

(declare-fun m!67293 () Bool)

(assert (=> d!12832 m!67293))

(declare-fun m!67295 () Bool)

(assert (=> d!12832 m!67295))

(assert (=> d!12832 m!66861))

(assert (=> d!12832 m!67243))

(declare-fun m!67297 () Bool)

(assert (=> d!12832 m!67297))

(assert (=> d!12832 m!66823))

(declare-fun m!67299 () Bool)

(assert (=> d!12832 m!67299))

(declare-fun m!67301 () Bool)

(assert (=> b!44122 m!67301))

(assert (=> b!43884 d!12832))

(declare-fun d!12844 () Bool)

(assert (=> d!12844 (validate_offset_bits!1 ((_ sign_extend 32) (size!1003 (buf!1343 (_2!2243 lt!66769)))) ((_ sign_extend 32) (currentByte!2818 thiss!1379)) ((_ sign_extend 32) (currentBit!2813 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!67362 () Unit!3124)

(declare-fun choose!9 (BitStream!1750 array!2224 (_ BitVec 64) BitStream!1750) Unit!3124)

(assert (=> d!12844 (= lt!67362 (choose!9 thiss!1379 (buf!1343 (_2!2243 lt!66769)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1751 (buf!1343 (_2!2243 lt!66769)) (currentByte!2818 thiss!1379) (currentBit!2813 thiss!1379))))))

(assert (=> d!12844 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1343 (_2!2243 lt!66769)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!67362)))

(declare-fun bs!3431 () Bool)

(assert (= bs!3431 d!12844))

(assert (=> bs!3431 m!66857))

(declare-fun m!67303 () Bool)

(assert (=> bs!3431 m!67303))

(assert (=> b!43884 d!12844))

(declare-fun d!12846 () Bool)

(assert (=> d!12846 (= (array_inv!928 (buf!1343 thiss!1379)) (bvsge (size!1003 (buf!1343 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!43883 d!12846))

(declare-fun d!12848 () Bool)

(assert (=> d!12848 (= (invariant!0 (currentBit!2813 (_2!2243 lt!66767)) (currentByte!2818 (_2!2243 lt!66767)) (size!1003 (buf!1343 (_2!2243 lt!66767)))) (and (bvsge (currentBit!2813 (_2!2243 lt!66767)) #b00000000000000000000000000000000) (bvslt (currentBit!2813 (_2!2243 lt!66767)) #b00000000000000000000000000001000) (bvsge (currentByte!2818 (_2!2243 lt!66767)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2818 (_2!2243 lt!66767)) (size!1003 (buf!1343 (_2!2243 lt!66767)))) (and (= (currentBit!2813 (_2!2243 lt!66767)) #b00000000000000000000000000000000) (= (currentByte!2818 (_2!2243 lt!66767)) (size!1003 (buf!1343 (_2!2243 lt!66767))))))))))

(assert (=> b!43885 d!12848))

(declare-fun d!12852 () Bool)

(declare-fun e!29407 () Bool)

(assert (=> d!12852 e!29407))

(declare-fun res!37391 () Bool)

(assert (=> d!12852 (=> (not res!37391) (not e!29407))))

(declare-fun lt!67448 () (_ BitVec 64))

(declare-fun lt!67451 () (_ BitVec 64))

(declare-fun lt!67447 () (_ BitVec 64))

(assert (=> d!12852 (= res!37391 (= lt!67447 (bvsub lt!67451 lt!67448)))))

(assert (=> d!12852 (or (= (bvand lt!67451 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!67448 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!67451 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!67451 lt!67448) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!12852 (= lt!67448 (remainingBits!0 ((_ sign_extend 32) (size!1003 (buf!1343 (_2!2243 lt!66767)))) ((_ sign_extend 32) (currentByte!2818 (_2!2243 lt!66767))) ((_ sign_extend 32) (currentBit!2813 (_2!2243 lt!66767)))))))

(declare-fun lt!67446 () (_ BitVec 64))

(declare-fun lt!67450 () (_ BitVec 64))

(assert (=> d!12852 (= lt!67451 (bvmul lt!67446 lt!67450))))

(assert (=> d!12852 (or (= lt!67446 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!67450 (bvsdiv (bvmul lt!67446 lt!67450) lt!67446)))))

(assert (=> d!12852 (= lt!67450 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!12852 (= lt!67446 ((_ sign_extend 32) (size!1003 (buf!1343 (_2!2243 lt!66767)))))))

(assert (=> d!12852 (= lt!67447 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2818 (_2!2243 lt!66767))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2813 (_2!2243 lt!66767)))))))

(assert (=> d!12852 (invariant!0 (currentBit!2813 (_2!2243 lt!66767)) (currentByte!2818 (_2!2243 lt!66767)) (size!1003 (buf!1343 (_2!2243 lt!66767))))))

(assert (=> d!12852 (= (bitIndex!0 (size!1003 (buf!1343 (_2!2243 lt!66767))) (currentByte!2818 (_2!2243 lt!66767)) (currentBit!2813 (_2!2243 lt!66767))) lt!67447)))

(declare-fun b!44148 () Bool)

(declare-fun res!37390 () Bool)

(assert (=> b!44148 (=> (not res!37390) (not e!29407))))

(assert (=> b!44148 (= res!37390 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!67447))))

(declare-fun b!44149 () Bool)

(declare-fun lt!67449 () (_ BitVec 64))

(assert (=> b!44149 (= e!29407 (bvsle lt!67447 (bvmul lt!67449 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!44149 (or (= lt!67449 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!67449 #b0000000000000000000000000000000000000000000000000000000000001000) lt!67449)))))

(assert (=> b!44149 (= lt!67449 ((_ sign_extend 32) (size!1003 (buf!1343 (_2!2243 lt!66767)))))))

(assert (= (and d!12852 res!37391) b!44148))

(assert (= (and b!44148 res!37390) b!44149))

(declare-fun m!67307 () Bool)

(assert (=> d!12852 m!67307))

(assert (=> d!12852 m!66833))

(assert (=> b!43880 d!12852))

(declare-fun d!12854 () Bool)

(declare-fun res!37394 () Bool)

(declare-fun e!29409 () Bool)

(assert (=> d!12854 (=> (not res!37394) (not e!29409))))

(assert (=> d!12854 (= res!37394 (= (size!1003 (buf!1343 thiss!1379)) (size!1003 (buf!1343 thiss!1379))))))

(assert (=> d!12854 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!29409)))

(declare-fun b!44150 () Bool)

(declare-fun res!37393 () Bool)

(assert (=> b!44150 (=> (not res!37393) (not e!29409))))

(assert (=> b!44150 (= res!37393 (bvsle (bitIndex!0 (size!1003 (buf!1343 thiss!1379)) (currentByte!2818 thiss!1379) (currentBit!2813 thiss!1379)) (bitIndex!0 (size!1003 (buf!1343 thiss!1379)) (currentByte!2818 thiss!1379) (currentBit!2813 thiss!1379))))))

(declare-fun b!44151 () Bool)

(declare-fun e!29408 () Bool)

(assert (=> b!44151 (= e!29409 e!29408)))

(declare-fun res!37392 () Bool)

(assert (=> b!44151 (=> res!37392 e!29408)))

(assert (=> b!44151 (= res!37392 (= (size!1003 (buf!1343 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!44152 () Bool)

(assert (=> b!44152 (= e!29408 (arrayBitRangesEq!0 (buf!1343 thiss!1379) (buf!1343 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1003 (buf!1343 thiss!1379)) (currentByte!2818 thiss!1379) (currentBit!2813 thiss!1379))))))

(assert (= (and d!12854 res!37394) b!44150))

(assert (= (and b!44150 res!37393) b!44151))

(assert (= (and b!44151 (not res!37392)) b!44152))

(assert (=> b!44150 m!66827))

(assert (=> b!44150 m!66827))

(assert (=> b!44152 m!66827))

(assert (=> b!44152 m!66827))

(declare-fun m!67309 () Bool)

(assert (=> b!44152 m!67309))

(assert (=> b!43879 d!12854))

(declare-fun d!12856 () Bool)

(assert (=> d!12856 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!67454 () Unit!3124)

(declare-fun choose!11 (BitStream!1750) Unit!3124)

(assert (=> d!12856 (= lt!67454 (choose!11 thiss!1379))))

(assert (=> d!12856 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!67454)))

(declare-fun bs!3433 () Bool)

(assert (= bs!3433 d!12856))

(assert (=> bs!3433 m!66823))

(declare-fun m!67311 () Bool)

(assert (=> bs!3433 m!67311))

(assert (=> b!43879 d!12856))

(declare-fun d!12858 () Bool)

(declare-fun e!29410 () Bool)

(assert (=> d!12858 e!29410))

(declare-fun res!37396 () Bool)

(assert (=> d!12858 (=> (not res!37396) (not e!29410))))

(declare-fun lt!67456 () (_ BitVec 64))

(declare-fun lt!67460 () (_ BitVec 64))

(declare-fun lt!67457 () (_ BitVec 64))

(assert (=> d!12858 (= res!37396 (= lt!67456 (bvsub lt!67460 lt!67457)))))

(assert (=> d!12858 (or (= (bvand lt!67460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!67457 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!67460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!67460 lt!67457) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!12858 (= lt!67457 (remainingBits!0 ((_ sign_extend 32) (size!1003 (buf!1343 thiss!1379))) ((_ sign_extend 32) (currentByte!2818 thiss!1379)) ((_ sign_extend 32) (currentBit!2813 thiss!1379))))))

(declare-fun lt!67455 () (_ BitVec 64))

(declare-fun lt!67459 () (_ BitVec 64))

(assert (=> d!12858 (= lt!67460 (bvmul lt!67455 lt!67459))))

(assert (=> d!12858 (or (= lt!67455 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!67459 (bvsdiv (bvmul lt!67455 lt!67459) lt!67455)))))

(assert (=> d!12858 (= lt!67459 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!12858 (= lt!67455 ((_ sign_extend 32) (size!1003 (buf!1343 thiss!1379))))))

(assert (=> d!12858 (= lt!67456 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2818 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2813 thiss!1379))))))

(assert (=> d!12858 (invariant!0 (currentBit!2813 thiss!1379) (currentByte!2818 thiss!1379) (size!1003 (buf!1343 thiss!1379)))))

(assert (=> d!12858 (= (bitIndex!0 (size!1003 (buf!1343 thiss!1379)) (currentByte!2818 thiss!1379) (currentBit!2813 thiss!1379)) lt!67456)))

(declare-fun b!44153 () Bool)

(declare-fun res!37395 () Bool)

(assert (=> b!44153 (=> (not res!37395) (not e!29410))))

(assert (=> b!44153 (= res!37395 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!67456))))

(declare-fun b!44154 () Bool)

(declare-fun lt!67458 () (_ BitVec 64))

(assert (=> b!44154 (= e!29410 (bvsle lt!67456 (bvmul lt!67458 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!44154 (or (= lt!67458 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!67458 #b0000000000000000000000000000000000000000000000000000000000001000) lt!67458)))))

(assert (=> b!44154 (= lt!67458 ((_ sign_extend 32) (size!1003 (buf!1343 thiss!1379))))))

(assert (= (and d!12858 res!37396) b!44153))

(assert (= (and b!44153 res!37395) b!44154))

(assert (=> d!12858 m!67001))

(assert (=> d!12858 m!66999))

(assert (=> b!43879 d!12858))

(declare-fun d!12860 () Bool)

(declare-fun res!37399 () Bool)

(declare-fun e!29412 () Bool)

(assert (=> d!12860 (=> (not res!37399) (not e!29412))))

(assert (=> d!12860 (= res!37399 (= (size!1003 (buf!1343 thiss!1379)) (size!1003 (buf!1343 (_2!2243 lt!66769)))))))

(assert (=> d!12860 (= (isPrefixOf!0 thiss!1379 (_2!2243 lt!66769)) e!29412)))

(declare-fun b!44155 () Bool)

(declare-fun res!37398 () Bool)

(assert (=> b!44155 (=> (not res!37398) (not e!29412))))

(assert (=> b!44155 (= res!37398 (bvsle (bitIndex!0 (size!1003 (buf!1343 thiss!1379)) (currentByte!2818 thiss!1379) (currentBit!2813 thiss!1379)) (bitIndex!0 (size!1003 (buf!1343 (_2!2243 lt!66769))) (currentByte!2818 (_2!2243 lt!66769)) (currentBit!2813 (_2!2243 lt!66769)))))))

(declare-fun b!44156 () Bool)

(declare-fun e!29411 () Bool)

(assert (=> b!44156 (= e!29412 e!29411)))

(declare-fun res!37397 () Bool)

(assert (=> b!44156 (=> res!37397 e!29411)))

(assert (=> b!44156 (= res!37397 (= (size!1003 (buf!1343 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!44157 () Bool)

(assert (=> b!44157 (= e!29411 (arrayBitRangesEq!0 (buf!1343 thiss!1379) (buf!1343 (_2!2243 lt!66769)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1003 (buf!1343 thiss!1379)) (currentByte!2818 thiss!1379) (currentBit!2813 thiss!1379))))))

(assert (= (and d!12860 res!37399) b!44155))

(assert (= (and b!44155 res!37398) b!44156))

(assert (= (and b!44156 (not res!37397)) b!44157))

(assert (=> b!44155 m!66827))

(assert (=> b!44155 m!67003))

(assert (=> b!44157 m!66827))

(assert (=> b!44157 m!66827))

(declare-fun m!67313 () Bool)

(assert (=> b!44157 m!67313))

(assert (=> b!43881 d!12860))

(declare-fun d!12862 () Bool)

(assert (=> d!12862 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1003 (buf!1343 (_2!2243 lt!66769)))) ((_ sign_extend 32) (currentByte!2818 (_2!2243 lt!66769))) ((_ sign_extend 32) (currentBit!2813 (_2!2243 lt!66769))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1003 (buf!1343 (_2!2243 lt!66769)))) ((_ sign_extend 32) (currentByte!2818 (_2!2243 lt!66769))) ((_ sign_extend 32) (currentBit!2813 (_2!2243 lt!66769)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!3434 () Bool)

(assert (= bs!3434 d!12862))

(declare-fun m!67315 () Bool)

(assert (=> bs!3434 m!67315))

(assert (=> b!43881 d!12862))

(declare-fun d!12864 () Bool)

(declare-fun e!29418 () Bool)

(assert (=> d!12864 e!29418))

(declare-fun res!37408 () Bool)

(assert (=> d!12864 (=> (not res!37408) (not e!29418))))

(assert (=> d!12864 (= res!37408 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!67507 () Unit!3124)

(declare-fun choose!27 (BitStream!1750 BitStream!1750 (_ BitVec 64) (_ BitVec 64)) Unit!3124)

(assert (=> d!12864 (= lt!67507 (choose!27 thiss!1379 (_2!2243 lt!66769) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!12864 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!12864 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2243 lt!66769) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!67507)))

(declare-fun b!44168 () Bool)

(assert (=> b!44168 (= e!29418 (validate_offset_bits!1 ((_ sign_extend 32) (size!1003 (buf!1343 (_2!2243 lt!66769)))) ((_ sign_extend 32) (currentByte!2818 (_2!2243 lt!66769))) ((_ sign_extend 32) (currentBit!2813 (_2!2243 lt!66769))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!12864 res!37408) b!44168))

(declare-fun m!67317 () Bool)

(assert (=> d!12864 m!67317))

(assert (=> b!44168 m!66869))

(assert (=> b!43881 d!12864))

(declare-fun b!44223 () Bool)

(declare-fun e!29447 () Bool)

(declare-datatypes ((tuple2!4326 0))(
  ( (tuple2!4327 (_1!2256 BitStream!1750) (_2!2256 Bool)) )
))
(declare-fun lt!67581 () tuple2!4326)

(declare-fun lt!67575 () tuple2!4300)

(assert (=> b!44223 (= e!29447 (= (bitIndex!0 (size!1003 (buf!1343 (_1!2256 lt!67581))) (currentByte!2818 (_1!2256 lt!67581)) (currentBit!2813 (_1!2256 lt!67581))) (bitIndex!0 (size!1003 (buf!1343 (_2!2243 lt!67575))) (currentByte!2818 (_2!2243 lt!67575)) (currentBit!2813 (_2!2243 lt!67575)))))))

(declare-fun b!44224 () Bool)

(declare-fun e!29449 () Bool)

(declare-fun e!29450 () Bool)

(assert (=> b!44224 (= e!29449 e!29450)))

(declare-fun res!37460 () Bool)

(assert (=> b!44224 (=> (not res!37460) (not e!29450))))

(declare-fun lt!67576 () tuple2!4300)

(declare-fun lt!67582 () tuple2!4326)

(declare-fun lt!67580 () (_ BitVec 8))

(assert (=> b!44224 (= res!37460 (and (= (_2!2256 lt!67582) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1511 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!67580)) #b00000000000000000000000000000000))) (= (_1!2256 lt!67582) (_2!2243 lt!67576))))))

(declare-fun lt!67578 () tuple2!4314)

(declare-fun lt!67572 () BitStream!1750)

(assert (=> b!44224 (= lt!67578 (readBits!0 lt!67572 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!1750) tuple2!4326)

(assert (=> b!44224 (= lt!67582 (readBitPure!0 lt!67572))))

(declare-fun readerFrom!0 (BitStream!1750 (_ BitVec 32) (_ BitVec 32)) BitStream!1750)

(assert (=> b!44224 (= lt!67572 (readerFrom!0 (_2!2243 lt!67576) (currentBit!2813 thiss!1379) (currentByte!2818 thiss!1379)))))

(declare-fun d!12866 () Bool)

(assert (=> d!12866 e!29449))

(declare-fun res!37459 () Bool)

(assert (=> d!12866 (=> (not res!37459) (not e!29449))))

(assert (=> d!12866 (= res!37459 (= (size!1003 (buf!1343 (_2!2243 lt!67576))) (size!1003 (buf!1343 thiss!1379))))))

(declare-fun lt!67573 () array!2224)

(assert (=> d!12866 (= lt!67580 (select (arr!1511 lt!67573) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!12866 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1003 lt!67573)))))

(assert (=> d!12866 (= lt!67573 (array!2225 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!67574 () tuple2!4300)

(assert (=> d!12866 (= lt!67576 (tuple2!4301 (_1!2243 lt!67574) (_2!2243 lt!67574)))))

(assert (=> d!12866 (= lt!67574 lt!67575)))

(declare-fun e!29448 () Bool)

(assert (=> d!12866 e!29448))

(declare-fun res!37456 () Bool)

(assert (=> d!12866 (=> (not res!37456) (not e!29448))))

(assert (=> d!12866 (= res!37456 (= (size!1003 (buf!1343 thiss!1379)) (size!1003 (buf!1343 (_2!2243 lt!67575)))))))

(declare-fun lt!67571 () Bool)

(declare-fun appendBit!0 (BitStream!1750 Bool) tuple2!4300)

(assert (=> d!12866 (= lt!67575 (appendBit!0 thiss!1379 lt!67571))))

(assert (=> d!12866 (= lt!67571 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1511 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!12866 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!12866 (= (appendBitFromByte!0 thiss!1379 (select (arr!1511 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!67576)))

(declare-fun b!44225 () Bool)

(declare-fun res!37461 () Bool)

(assert (=> b!44225 (=> (not res!37461) (not e!29449))))

(declare-fun lt!67579 () (_ BitVec 64))

(declare-fun lt!67577 () (_ BitVec 64))

(assert (=> b!44225 (= res!37461 (= (bitIndex!0 (size!1003 (buf!1343 (_2!2243 lt!67576))) (currentByte!2818 (_2!2243 lt!67576)) (currentBit!2813 (_2!2243 lt!67576))) (bvadd lt!67579 lt!67577)))))

(assert (=> b!44225 (or (not (= (bvand lt!67579 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!67577 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!67579 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!67579 lt!67577) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!44225 (= lt!67577 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!44225 (= lt!67579 (bitIndex!0 (size!1003 (buf!1343 thiss!1379)) (currentByte!2818 thiss!1379) (currentBit!2813 thiss!1379)))))

(declare-fun b!44226 () Bool)

(assert (=> b!44226 (= e!29448 e!29447)))

(declare-fun res!37455 () Bool)

(assert (=> b!44226 (=> (not res!37455) (not e!29447))))

(assert (=> b!44226 (= res!37455 (and (= (_2!2256 lt!67581) lt!67571) (= (_1!2256 lt!67581) (_2!2243 lt!67575))))))

(assert (=> b!44226 (= lt!67581 (readBitPure!0 (readerFrom!0 (_2!2243 lt!67575) (currentBit!2813 thiss!1379) (currentByte!2818 thiss!1379))))))

(declare-fun b!44227 () Bool)

(assert (=> b!44227 (= e!29450 (= (bitIndex!0 (size!1003 (buf!1343 (_1!2256 lt!67582))) (currentByte!2818 (_1!2256 lt!67582)) (currentBit!2813 (_1!2256 lt!67582))) (bitIndex!0 (size!1003 (buf!1343 (_2!2243 lt!67576))) (currentByte!2818 (_2!2243 lt!67576)) (currentBit!2813 (_2!2243 lt!67576)))))))

(declare-fun b!44228 () Bool)

(declare-fun res!37462 () Bool)

(assert (=> b!44228 (=> (not res!37462) (not e!29448))))

(assert (=> b!44228 (= res!37462 (isPrefixOf!0 thiss!1379 (_2!2243 lt!67575)))))

(declare-fun b!44229 () Bool)

(declare-fun res!37458 () Bool)

(assert (=> b!44229 (=> (not res!37458) (not e!29448))))

(assert (=> b!44229 (= res!37458 (= (bitIndex!0 (size!1003 (buf!1343 (_2!2243 lt!67575))) (currentByte!2818 (_2!2243 lt!67575)) (currentBit!2813 (_2!2243 lt!67575))) (bvadd (bitIndex!0 (size!1003 (buf!1343 thiss!1379)) (currentByte!2818 thiss!1379) (currentBit!2813 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!44230 () Bool)

(declare-fun res!37457 () Bool)

(assert (=> b!44230 (=> (not res!37457) (not e!29449))))

(assert (=> b!44230 (= res!37457 (isPrefixOf!0 thiss!1379 (_2!2243 lt!67576)))))

(assert (= (and d!12866 res!37456) b!44229))

(assert (= (and b!44229 res!37458) b!44228))

(assert (= (and b!44228 res!37462) b!44226))

(assert (= (and b!44226 res!37455) b!44223))

(assert (= (and d!12866 res!37459) b!44225))

(assert (= (and b!44225 res!37461) b!44230))

(assert (= (and b!44230 res!37457) b!44224))

(assert (= (and b!44224 res!37460) b!44227))

(declare-fun m!67443 () Bool)

(assert (=> b!44224 m!67443))

(declare-fun m!67445 () Bool)

(assert (=> b!44224 m!67445))

(declare-fun m!67447 () Bool)

(assert (=> b!44224 m!67447))

(declare-fun m!67449 () Bool)

(assert (=> b!44228 m!67449))

(declare-fun m!67451 () Bool)

(assert (=> b!44223 m!67451))

(declare-fun m!67453 () Bool)

(assert (=> b!44223 m!67453))

(declare-fun m!67455 () Bool)

(assert (=> b!44227 m!67455))

(declare-fun m!67457 () Bool)

(assert (=> b!44227 m!67457))

(assert (=> b!44229 m!67453))

(assert (=> b!44229 m!66827))

(assert (=> b!44225 m!67457))

(assert (=> b!44225 m!66827))

(declare-fun m!67459 () Bool)

(assert (=> b!44230 m!67459))

(declare-fun m!67461 () Bool)

(assert (=> b!44226 m!67461))

(assert (=> b!44226 m!67461))

(declare-fun m!67463 () Bool)

(assert (=> b!44226 m!67463))

(declare-fun m!67465 () Bool)

(assert (=> d!12866 m!67465))

(declare-fun m!67467 () Bool)

(assert (=> d!12866 m!67467))

(assert (=> d!12866 m!66987))

(assert (=> b!43881 d!12866))

(push 1)

(assert (not b!43972))

(assert (not bm!520))

(assert (not b!44083))

(assert (not b!44122))

(assert (not b!44168))

(assert (not b!44229))

(assert (not d!12864))

(assert (not d!12788))

(assert (not b!43981))

(assert (not b!44150))

(assert (not b!44226))

(assert (not b!44120))

(assert (not b!44085))

(assert (not d!12866))

(assert (not d!12780))

(assert (not b!44227))

(assert (not b!44225))

(assert (not b!44152))

(assert (not b!43960))

(assert (not d!12844))

(assert (not b!44157))

(assert (not b!44155))

(assert (not d!12858))

(assert (not b!43986))

(assert (not d!12856))

(assert (not d!12852))

(assert (not b!44230))

(assert (not b!44228))

(assert (not b!44123))

(assert (not d!12832))

(assert (not d!12782))

(assert (not d!12828))

(assert (not b!44224))

(assert (not b!44223))

(assert (not b!43979))

(assert (not b!43988))

(assert (not d!12830))

(assert (not b!44087))

(assert (not b!44084))

(assert (not d!12862))

(assert (not b!44081))

(assert (not b!43970))

(assert (not b!44086))

(assert (not b!43971))

(assert (not b!44124))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

