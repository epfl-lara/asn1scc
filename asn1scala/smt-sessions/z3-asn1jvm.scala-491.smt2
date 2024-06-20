; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14528 () Bool)

(assert start!14528)

(declare-fun b!75115 () Bool)

(declare-fun e!49136 () Bool)

(declare-datatypes ((array!3066 0))(
  ( (array!3067 (arr!2029 (Array (_ BitVec 32) (_ BitVec 8))) (size!1431 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2436 0))(
  ( (BitStream!2437 (buf!1812 array!3066) (currentByte!3576 (_ BitVec 32)) (currentBit!3571 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2436)

(declare-fun array_inv!1277 (array!3066) Bool)

(assert (=> b!75115 (= e!49136 (array_inv!1277 (buf!1812 thiss!1379)))))

(declare-fun b!75116 () Bool)

(declare-fun e!49138 () Bool)

(declare-datatypes ((tuple2!6482 0))(
  ( (tuple2!6483 (_1!3363 BitStream!2436) (_2!3363 BitStream!2436)) )
))
(declare-fun lt!120792 () tuple2!6482)

(declare-datatypes ((tuple2!6484 0))(
  ( (tuple2!6485 (_1!3364 array!3066) (_2!3364 BitStream!2436)) )
))
(declare-fun lt!120795 () tuple2!6484)

(declare-fun inv!12 (BitStream!2436) Bool)

(assert (=> b!75116 (= e!49138 (inv!12 (BitStream!2437 (buf!1812 (_1!3363 lt!120792)) (currentByte!3576 (_2!3364 lt!120795)) (currentBit!3571 (_2!3364 lt!120795)))))))

(declare-fun srcBuffer!2 () array!3066)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun checkByteArrayBitContent!0 (BitStream!2436 array!3066 array!3066 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75116 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3364 lt!120795) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!75117 () Bool)

(declare-fun e!49135 () Bool)

(declare-fun e!49137 () Bool)

(assert (=> b!75117 (= e!49135 (not e!49137))))

(declare-fun res!62078 () Bool)

(assert (=> b!75117 (=> res!62078 e!49137)))

(declare-fun lt!120793 () (_ BitVec 64))

(assert (=> b!75117 (= res!62078 (or (bvslt i!635 to!314) (not (= lt!120793 (bvsub (bvadd lt!120793 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!2436 BitStream!2436) Bool)

(assert (=> b!75117 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4953 0))(
  ( (Unit!4954) )
))
(declare-fun lt!120794 () Unit!4953)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2436) Unit!4953)

(assert (=> b!75117 (= lt!120794 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!75117 (= lt!120793 (bitIndex!0 (size!1431 (buf!1812 thiss!1379)) (currentByte!3576 thiss!1379) (currentBit!3571 thiss!1379)))))

(declare-fun res!62080 () Bool)

(assert (=> start!14528 (=> (not res!62080) (not e!49135))))

(assert (=> start!14528 (= res!62080 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1431 srcBuffer!2))))))))

(assert (=> start!14528 e!49135))

(assert (=> start!14528 true))

(assert (=> start!14528 (array_inv!1277 srcBuffer!2)))

(assert (=> start!14528 (and (inv!12 thiss!1379) e!49136)))

(declare-fun b!75118 () Bool)

(declare-fun res!62076 () Bool)

(assert (=> b!75118 (=> (not res!62076) (not e!49135))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75118 (= res!62076 (validate_offset_bits!1 ((_ sign_extend 32) (size!1431 (buf!1812 thiss!1379))) ((_ sign_extend 32) (currentByte!3576 thiss!1379)) ((_ sign_extend 32) (currentBit!3571 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!75119 () Bool)

(declare-fun res!62079 () Bool)

(assert (=> b!75119 (=> res!62079 e!49137)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!75119 (= res!62079 (not (invariant!0 (currentBit!3571 thiss!1379) (currentByte!3576 thiss!1379) (size!1431 (buf!1812 thiss!1379)))))))

(declare-fun b!75120 () Bool)

(assert (=> b!75120 (= e!49137 e!49138)))

(declare-fun res!62077 () Bool)

(assert (=> b!75120 (=> res!62077 e!49138)))

(assert (=> b!75120 (= res!62077 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBits!0 (BitStream!2436 (_ BitVec 64)) tuple2!6484)

(assert (=> b!75120 (= lt!120795 (readBits!0 (_1!3363 lt!120792) (bvsub to!314 i!635)))))

(declare-fun reader!0 (BitStream!2436 BitStream!2436) tuple2!6482)

(assert (=> b!75120 (= lt!120792 (reader!0 thiss!1379 thiss!1379))))

(assert (= (and start!14528 res!62080) b!75118))

(assert (= (and b!75118 res!62076) b!75117))

(assert (= (and b!75117 (not res!62078)) b!75119))

(assert (= (and b!75119 (not res!62079)) b!75120))

(assert (= (and b!75120 (not res!62077)) b!75116))

(assert (= start!14528 b!75115))

(declare-fun m!120203 () Bool)

(assert (=> b!75119 m!120203))

(declare-fun m!120205 () Bool)

(assert (=> b!75118 m!120205))

(declare-fun m!120207 () Bool)

(assert (=> b!75116 m!120207))

(declare-fun m!120209 () Bool)

(assert (=> b!75116 m!120209))

(declare-fun m!120211 () Bool)

(assert (=> b!75115 m!120211))

(declare-fun m!120213 () Bool)

(assert (=> start!14528 m!120213))

(declare-fun m!120215 () Bool)

(assert (=> start!14528 m!120215))

(declare-fun m!120217 () Bool)

(assert (=> b!75120 m!120217))

(declare-fun m!120219 () Bool)

(assert (=> b!75120 m!120219))

(declare-fun m!120221 () Bool)

(assert (=> b!75117 m!120221))

(declare-fun m!120223 () Bool)

(assert (=> b!75117 m!120223))

(declare-fun m!120225 () Bool)

(assert (=> b!75117 m!120225))

(check-sat (not start!14528) (not b!75115) (not b!75119) (not b!75117) (not b!75120) (not b!75116) (not b!75118))
(check-sat)
(get-model)

(declare-fun d!23878 () Bool)

(assert (=> d!23878 (= (invariant!0 (currentBit!3571 thiss!1379) (currentByte!3576 thiss!1379) (size!1431 (buf!1812 thiss!1379))) (and (bvsge (currentBit!3571 thiss!1379) #b00000000000000000000000000000000) (bvslt (currentBit!3571 thiss!1379) #b00000000000000000000000000001000) (bvsge (currentByte!3576 thiss!1379) #b00000000000000000000000000000000) (or (bvslt (currentByte!3576 thiss!1379) (size!1431 (buf!1812 thiss!1379))) (and (= (currentBit!3571 thiss!1379) #b00000000000000000000000000000000) (= (currentByte!3576 thiss!1379) (size!1431 (buf!1812 thiss!1379)))))))))

(assert (=> b!75119 d!23878))

(declare-fun b!75170 () Bool)

(declare-fun res!62127 () Bool)

(declare-fun e!49176 () Bool)

(assert (=> b!75170 (=> (not res!62127) (not e!49176))))

(declare-fun lt!120855 () tuple2!6484)

(declare-fun lt!120854 () (_ BitVec 64))

(assert (=> b!75170 (= res!62127 (= (size!1431 (_1!3364 lt!120855)) ((_ extract 31 0) lt!120854)))))

(assert (=> b!75170 (and (bvslt lt!120854 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!120854 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!120847 () (_ BitVec 64))

(declare-fun lt!120853 () (_ BitVec 64))

(assert (=> b!75170 (= lt!120854 (bvsdiv lt!120847 lt!120853))))

(assert (=> b!75170 (and (not (= lt!120853 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!120847 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!120853 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!75170 (= lt!120853 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!120849 () (_ BitVec 64))

(declare-fun lt!120851 () (_ BitVec 64))

(assert (=> b!75170 (= lt!120847 (bvsub lt!120849 lt!120851))))

(assert (=> b!75170 (or (= (bvand lt!120849 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!120851 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!120849 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!120849 lt!120851) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!75170 (= lt!120851 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!120850 () (_ BitVec 64))

(assert (=> b!75170 (= lt!120849 (bvadd (bvsub to!314 i!635) lt!120850))))

(assert (=> b!75170 (or (not (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!120850 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd (bvsub to!314 i!635) lt!120850) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!75170 (= lt!120850 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!75171 () Bool)

(declare-datatypes ((List!774 0))(
  ( (Nil!771) (Cons!770 (h!889 Bool) (t!1524 List!774)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!2436 array!3066 (_ BitVec 64) (_ BitVec 64)) List!774)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2436 BitStream!2436 (_ BitVec 64)) List!774)

(assert (=> b!75171 (= e!49176 (= (byteArrayBitContentToList!0 (_2!3364 lt!120855) (_1!3364 lt!120855) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) (bitStreamReadBitsIntoList!0 (_2!3364 lt!120855) (_1!3363 lt!120792) (bvsub to!314 i!635))))))

(declare-fun d!23880 () Bool)

(assert (=> d!23880 e!49176))

(declare-fun res!62128 () Bool)

(assert (=> d!23880 (=> (not res!62128) (not e!49176))))

(assert (=> d!23880 (= res!62128 (= (buf!1812 (_2!3364 lt!120855)) (buf!1812 (_1!3363 lt!120792))))))

(declare-datatypes ((tuple3!202 0))(
  ( (tuple3!203 (_1!3367 Unit!4953) (_2!3367 BitStream!2436) (_3!122 array!3066)) )
))
(declare-fun lt!120848 () tuple3!202)

(assert (=> d!23880 (= lt!120855 (tuple2!6485 (_3!122 lt!120848) (_2!3367 lt!120848)))))

(declare-fun readBitsLoop!0 (BitStream!2436 (_ BitVec 64) array!3066 (_ BitVec 64) (_ BitVec 64)) tuple3!202)

(assert (=> d!23880 (= lt!120848 (readBitsLoop!0 (_1!3363 lt!120792) (bvsub to!314 i!635) (array!3067 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)))))

(assert (=> d!23880 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) (bvsle (bvsub to!314 i!635) #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!23880 (= (readBits!0 (_1!3363 lt!120792) (bvsub to!314 i!635)) lt!120855)))

(declare-fun b!75172 () Bool)

(declare-fun res!62131 () Bool)

(assert (=> b!75172 (=> (not res!62131) (not e!49176))))

(assert (=> b!75172 (= res!62131 (invariant!0 (currentBit!3571 (_2!3364 lt!120855)) (currentByte!3576 (_2!3364 lt!120855)) (size!1431 (buf!1812 (_2!3364 lt!120855)))))))

(declare-fun b!75173 () Bool)

(declare-fun res!62130 () Bool)

(assert (=> b!75173 (=> (not res!62130) (not e!49176))))

(declare-fun lt!120852 () (_ BitVec 64))

(assert (=> b!75173 (= res!62130 (= (bvadd lt!120852 (bvsub to!314 i!635)) (bitIndex!0 (size!1431 (buf!1812 (_2!3364 lt!120855))) (currentByte!3576 (_2!3364 lt!120855)) (currentBit!3571 (_2!3364 lt!120855)))))))

(assert (=> b!75173 (or (not (= (bvand lt!120852 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!120852 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!120852 (bvsub to!314 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!75173 (= lt!120852 (bitIndex!0 (size!1431 (buf!1812 (_1!3363 lt!120792))) (currentByte!3576 (_1!3363 lt!120792)) (currentBit!3571 (_1!3363 lt!120792))))))

(declare-fun b!75174 () Bool)

(declare-fun res!62129 () Bool)

(assert (=> b!75174 (=> (not res!62129) (not e!49176))))

(assert (=> b!75174 (= res!62129 (bvsle (currentByte!3576 (_1!3363 lt!120792)) (currentByte!3576 (_2!3364 lt!120855))))))

(assert (= (and d!23880 res!62128) b!75173))

(assert (= (and b!75173 res!62130) b!75172))

(assert (= (and b!75172 res!62131) b!75170))

(assert (= (and b!75170 res!62127) b!75174))

(assert (= (and b!75174 res!62129) b!75171))

(declare-fun m!120273 () Bool)

(assert (=> b!75171 m!120273))

(declare-fun m!120275 () Bool)

(assert (=> b!75171 m!120275))

(declare-fun m!120277 () Bool)

(assert (=> d!23880 m!120277))

(declare-fun m!120279 () Bool)

(assert (=> b!75172 m!120279))

(declare-fun m!120281 () Bool)

(assert (=> b!75173 m!120281))

(declare-fun m!120283 () Bool)

(assert (=> b!75173 m!120283))

(assert (=> b!75120 d!23880))

(declare-fun b!75206 () Bool)

(declare-fun e!49191 () Unit!4953)

(declare-fun lt!120928 () Unit!4953)

(assert (=> b!75206 (= e!49191 lt!120928)))

(declare-fun lt!120934 () (_ BitVec 64))

(assert (=> b!75206 (= lt!120934 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120924 () (_ BitVec 64))

(assert (=> b!75206 (= lt!120924 (bitIndex!0 (size!1431 (buf!1812 thiss!1379)) (currentByte!3576 thiss!1379) (currentBit!3571 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!3066 array!3066 (_ BitVec 64) (_ BitVec 64)) Unit!4953)

(assert (=> b!75206 (= lt!120928 (arrayBitRangesEqSymmetric!0 (buf!1812 thiss!1379) (buf!1812 thiss!1379) lt!120934 lt!120924))))

(declare-fun arrayBitRangesEq!0 (array!3066 array!3066 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75206 (arrayBitRangesEq!0 (buf!1812 thiss!1379) (buf!1812 thiss!1379) lt!120934 lt!120924)))

(declare-fun d!23902 () Bool)

(declare-fun e!49190 () Bool)

(assert (=> d!23902 e!49190))

(declare-fun res!62161 () Bool)

(assert (=> d!23902 (=> (not res!62161) (not e!49190))))

(declare-fun lt!120925 () tuple2!6482)

(assert (=> d!23902 (= res!62161 (isPrefixOf!0 (_1!3363 lt!120925) (_2!3363 lt!120925)))))

(declare-fun lt!120941 () BitStream!2436)

(assert (=> d!23902 (= lt!120925 (tuple2!6483 lt!120941 thiss!1379))))

(declare-fun lt!120926 () Unit!4953)

(declare-fun lt!120935 () Unit!4953)

(assert (=> d!23902 (= lt!120926 lt!120935)))

(assert (=> d!23902 (isPrefixOf!0 lt!120941 thiss!1379)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2436 BitStream!2436 BitStream!2436) Unit!4953)

(assert (=> d!23902 (= lt!120935 (lemmaIsPrefixTransitive!0 lt!120941 thiss!1379 thiss!1379))))

(declare-fun lt!120936 () Unit!4953)

(declare-fun lt!120927 () Unit!4953)

(assert (=> d!23902 (= lt!120936 lt!120927)))

(assert (=> d!23902 (isPrefixOf!0 lt!120941 thiss!1379)))

(assert (=> d!23902 (= lt!120927 (lemmaIsPrefixTransitive!0 lt!120941 thiss!1379 thiss!1379))))

(declare-fun lt!120931 () Unit!4953)

(assert (=> d!23902 (= lt!120931 e!49191)))

(declare-fun c!5516 () Bool)

(assert (=> d!23902 (= c!5516 (not (= (size!1431 (buf!1812 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!120937 () Unit!4953)

(declare-fun lt!120930 () Unit!4953)

(assert (=> d!23902 (= lt!120937 lt!120930)))

(assert (=> d!23902 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!23902 (= lt!120930 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!120942 () Unit!4953)

(declare-fun lt!120932 () Unit!4953)

(assert (=> d!23902 (= lt!120942 lt!120932)))

(assert (=> d!23902 (= lt!120932 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!120923 () Unit!4953)

(declare-fun lt!120940 () Unit!4953)

(assert (=> d!23902 (= lt!120923 lt!120940)))

(assert (=> d!23902 (isPrefixOf!0 lt!120941 lt!120941)))

(assert (=> d!23902 (= lt!120940 (lemmaIsPrefixRefl!0 lt!120941))))

(declare-fun lt!120939 () Unit!4953)

(declare-fun lt!120938 () Unit!4953)

(assert (=> d!23902 (= lt!120939 lt!120938)))

(assert (=> d!23902 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!23902 (= lt!120938 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!23902 (= lt!120941 (BitStream!2437 (buf!1812 thiss!1379) (currentByte!3576 thiss!1379) (currentBit!3571 thiss!1379)))))

(assert (=> d!23902 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!23902 (= (reader!0 thiss!1379 thiss!1379) lt!120925)))

(declare-fun lt!120933 () (_ BitVec 64))

(declare-fun b!75207 () Bool)

(declare-fun lt!120929 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2436 (_ BitVec 64)) BitStream!2436)

(assert (=> b!75207 (= e!49190 (= (_1!3363 lt!120925) (withMovedBitIndex!0 (_2!3363 lt!120925) (bvsub lt!120933 lt!120929))))))

(assert (=> b!75207 (or (= (bvand lt!120933 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!120929 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!120933 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!120933 lt!120929) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!75207 (= lt!120929 (bitIndex!0 (size!1431 (buf!1812 thiss!1379)) (currentByte!3576 thiss!1379) (currentBit!3571 thiss!1379)))))

(assert (=> b!75207 (= lt!120933 (bitIndex!0 (size!1431 (buf!1812 thiss!1379)) (currentByte!3576 thiss!1379) (currentBit!3571 thiss!1379)))))

(declare-fun b!75208 () Bool)

(declare-fun res!62159 () Bool)

(assert (=> b!75208 (=> (not res!62159) (not e!49190))))

(assert (=> b!75208 (= res!62159 (isPrefixOf!0 (_1!3363 lt!120925) thiss!1379))))

(declare-fun b!75209 () Bool)

(declare-fun Unit!4957 () Unit!4953)

(assert (=> b!75209 (= e!49191 Unit!4957)))

(declare-fun b!75210 () Bool)

(declare-fun res!62160 () Bool)

(assert (=> b!75210 (=> (not res!62160) (not e!49190))))

(assert (=> b!75210 (= res!62160 (isPrefixOf!0 (_2!3363 lt!120925) thiss!1379))))

(assert (= (and d!23902 c!5516) b!75206))

(assert (= (and d!23902 (not c!5516)) b!75209))

(assert (= (and d!23902 res!62161) b!75208))

(assert (= (and b!75208 res!62159) b!75210))

(assert (= (and b!75210 res!62160) b!75207))

(declare-fun m!120307 () Bool)

(assert (=> d!23902 m!120307))

(declare-fun m!120309 () Bool)

(assert (=> d!23902 m!120309))

(assert (=> d!23902 m!120309))

(assert (=> d!23902 m!120223))

(assert (=> d!23902 m!120223))

(declare-fun m!120311 () Bool)

(assert (=> d!23902 m!120311))

(assert (=> d!23902 m!120221))

(declare-fun m!120313 () Bool)

(assert (=> d!23902 m!120313))

(declare-fun m!120315 () Bool)

(assert (=> d!23902 m!120315))

(assert (=> d!23902 m!120221))

(assert (=> d!23902 m!120221))

(assert (=> b!75206 m!120225))

(declare-fun m!120317 () Bool)

(assert (=> b!75206 m!120317))

(declare-fun m!120319 () Bool)

(assert (=> b!75206 m!120319))

(declare-fun m!120321 () Bool)

(assert (=> b!75208 m!120321))

(declare-fun m!120323 () Bool)

(assert (=> b!75210 m!120323))

(declare-fun m!120325 () Bool)

(assert (=> b!75207 m!120325))

(assert (=> b!75207 m!120225))

(assert (=> b!75207 m!120225))

(assert (=> b!75120 d!23902))

(declare-fun d!23916 () Bool)

(assert (=> d!23916 (= (array_inv!1277 (buf!1812 thiss!1379)) (bvsge (size!1431 (buf!1812 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!75115 d!23916))

(declare-fun d!23918 () Bool)

(assert (=> d!23918 (= (inv!12 (BitStream!2437 (buf!1812 (_1!3363 lt!120792)) (currentByte!3576 (_2!3364 lt!120795)) (currentBit!3571 (_2!3364 lt!120795)))) (invariant!0 (currentBit!3571 (BitStream!2437 (buf!1812 (_1!3363 lt!120792)) (currentByte!3576 (_2!3364 lt!120795)) (currentBit!3571 (_2!3364 lt!120795)))) (currentByte!3576 (BitStream!2437 (buf!1812 (_1!3363 lt!120792)) (currentByte!3576 (_2!3364 lt!120795)) (currentBit!3571 (_2!3364 lt!120795)))) (size!1431 (buf!1812 (BitStream!2437 (buf!1812 (_1!3363 lt!120792)) (currentByte!3576 (_2!3364 lt!120795)) (currentBit!3571 (_2!3364 lt!120795)))))))))

(declare-fun bs!5747 () Bool)

(assert (= bs!5747 d!23918))

(declare-fun m!120327 () Bool)

(assert (=> bs!5747 m!120327))

(assert (=> b!75116 d!23918))

(declare-fun d!23920 () Bool)

(declare-fun res!62176 () Bool)

(declare-fun e!49198 () Bool)

(assert (=> d!23920 (=> res!62176 e!49198)))

(assert (=> d!23920 (= res!62176 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23920 (= (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3364 lt!120795) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) e!49198)))

(declare-fun b!75225 () Bool)

(declare-fun e!49199 () Bool)

(assert (=> b!75225 (= e!49198 e!49199)))

(declare-fun res!62177 () Bool)

(assert (=> b!75225 (=> (not res!62177) (not e!49199))))

(assert (=> b!75225 (= res!62177 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!2029 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!2029 (_1!3364 lt!120795)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!75226 () Bool)

(assert (=> b!75226 (= e!49199 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3364 lt!120795) (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!23920 (not res!62176)) b!75225))

(assert (= (and b!75225 res!62177) b!75226))

(declare-fun m!120329 () Bool)

(assert (=> b!75225 m!120329))

(declare-fun m!120331 () Bool)

(assert (=> b!75225 m!120331))

(declare-fun m!120333 () Bool)

(assert (=> b!75225 m!120333))

(declare-fun m!120335 () Bool)

(assert (=> b!75225 m!120335))

(declare-fun m!120337 () Bool)

(assert (=> b!75226 m!120337))

(assert (=> b!75116 d!23920))

(declare-fun d!23922 () Bool)

(assert (=> d!23922 (= (array_inv!1277 srcBuffer!2) (bvsge (size!1431 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!14528 d!23922))

(declare-fun d!23924 () Bool)

(assert (=> d!23924 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3571 thiss!1379) (currentByte!3576 thiss!1379) (size!1431 (buf!1812 thiss!1379))))))

(declare-fun bs!5748 () Bool)

(assert (= bs!5748 d!23924))

(assert (=> bs!5748 m!120203))

(assert (=> start!14528 d!23924))

(declare-fun d!23926 () Bool)

(declare-fun res!62197 () Bool)

(declare-fun e!49210 () Bool)

(assert (=> d!23926 (=> (not res!62197) (not e!49210))))

(assert (=> d!23926 (= res!62197 (= (size!1431 (buf!1812 thiss!1379)) (size!1431 (buf!1812 thiss!1379))))))

(assert (=> d!23926 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!49210)))

(declare-fun b!75248 () Bool)

(declare-fun res!62196 () Bool)

(assert (=> b!75248 (=> (not res!62196) (not e!49210))))

(assert (=> b!75248 (= res!62196 (bvsle (bitIndex!0 (size!1431 (buf!1812 thiss!1379)) (currentByte!3576 thiss!1379) (currentBit!3571 thiss!1379)) (bitIndex!0 (size!1431 (buf!1812 thiss!1379)) (currentByte!3576 thiss!1379) (currentBit!3571 thiss!1379))))))

(declare-fun b!75249 () Bool)

(declare-fun e!49209 () Bool)

(assert (=> b!75249 (= e!49210 e!49209)))

(declare-fun res!62195 () Bool)

(assert (=> b!75249 (=> res!62195 e!49209)))

(assert (=> b!75249 (= res!62195 (= (size!1431 (buf!1812 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!75250 () Bool)

(assert (=> b!75250 (= e!49209 (arrayBitRangesEq!0 (buf!1812 thiss!1379) (buf!1812 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1431 (buf!1812 thiss!1379)) (currentByte!3576 thiss!1379) (currentBit!3571 thiss!1379))))))

(assert (= (and d!23926 res!62197) b!75248))

(assert (= (and b!75248 res!62196) b!75249))

(assert (= (and b!75249 (not res!62195)) b!75250))

(assert (=> b!75248 m!120225))

(assert (=> b!75248 m!120225))

(assert (=> b!75250 m!120225))

(assert (=> b!75250 m!120225))

(declare-fun m!120351 () Bool)

(assert (=> b!75250 m!120351))

(assert (=> b!75117 d!23926))

(declare-fun d!23930 () Bool)

(assert (=> d!23930 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!121032 () Unit!4953)

(declare-fun choose!11 (BitStream!2436) Unit!4953)

(assert (=> d!23930 (= lt!121032 (choose!11 thiss!1379))))

(assert (=> d!23930 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!121032)))

(declare-fun bs!5750 () Bool)

(assert (= bs!5750 d!23930))

(assert (=> bs!5750 m!120221))

(declare-fun m!120373 () Bool)

(assert (=> bs!5750 m!120373))

(assert (=> b!75117 d!23930))

(declare-fun d!23936 () Bool)

(declare-fun e!49221 () Bool)

(assert (=> d!23936 e!49221))

(declare-fun res!62215 () Bool)

(assert (=> d!23936 (=> (not res!62215) (not e!49221))))

(declare-fun lt!121049 () (_ BitVec 64))

(declare-fun lt!121052 () (_ BitVec 64))

(declare-fun lt!121051 () (_ BitVec 64))

(assert (=> d!23936 (= res!62215 (= lt!121049 (bvsub lt!121051 lt!121052)))))

(assert (=> d!23936 (or (= (bvand lt!121051 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!121052 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!121051 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!121051 lt!121052) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!23936 (= lt!121052 (remainingBits!0 ((_ sign_extend 32) (size!1431 (buf!1812 thiss!1379))) ((_ sign_extend 32) (currentByte!3576 thiss!1379)) ((_ sign_extend 32) (currentBit!3571 thiss!1379))))))

(declare-fun lt!121050 () (_ BitVec 64))

(declare-fun lt!121048 () (_ BitVec 64))

(assert (=> d!23936 (= lt!121051 (bvmul lt!121050 lt!121048))))

(assert (=> d!23936 (or (= lt!121050 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!121048 (bvsdiv (bvmul lt!121050 lt!121048) lt!121050)))))

(assert (=> d!23936 (= lt!121048 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!23936 (= lt!121050 ((_ sign_extend 32) (size!1431 (buf!1812 thiss!1379))))))

(assert (=> d!23936 (= lt!121049 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3576 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3571 thiss!1379))))))

(assert (=> d!23936 (invariant!0 (currentBit!3571 thiss!1379) (currentByte!3576 thiss!1379) (size!1431 (buf!1812 thiss!1379)))))

(assert (=> d!23936 (= (bitIndex!0 (size!1431 (buf!1812 thiss!1379)) (currentByte!3576 thiss!1379) (currentBit!3571 thiss!1379)) lt!121049)))

(declare-fun b!75269 () Bool)

(declare-fun res!62214 () Bool)

(assert (=> b!75269 (=> (not res!62214) (not e!49221))))

(assert (=> b!75269 (= res!62214 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!121049))))

(declare-fun b!75270 () Bool)

(declare-fun lt!121053 () (_ BitVec 64))

(assert (=> b!75270 (= e!49221 (bvsle lt!121049 (bvmul lt!121053 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!75270 (or (= lt!121053 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!121053 #b0000000000000000000000000000000000000000000000000000000000001000) lt!121053)))))

(assert (=> b!75270 (= lt!121053 ((_ sign_extend 32) (size!1431 (buf!1812 thiss!1379))))))

(assert (= (and d!23936 res!62215) b!75269))

(assert (= (and b!75269 res!62214) b!75270))

(declare-fun m!120379 () Bool)

(assert (=> d!23936 m!120379))

(assert (=> d!23936 m!120203))

(assert (=> b!75117 d!23936))

(declare-fun d!23944 () Bool)

(assert (=> d!23944 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1431 (buf!1812 thiss!1379))) ((_ sign_extend 32) (currentByte!3576 thiss!1379)) ((_ sign_extend 32) (currentBit!3571 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1431 (buf!1812 thiss!1379))) ((_ sign_extend 32) (currentByte!3576 thiss!1379)) ((_ sign_extend 32) (currentBit!3571 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5753 () Bool)

(assert (= bs!5753 d!23944))

(assert (=> bs!5753 m!120379))

(assert (=> b!75118 d!23944))

(check-sat (not b!75172) (not b!75173) (not b!75171) (not d!23936) (not d!23924) (not b!75207) (not d!23918) (not b!75250) (not d!23902) (not b!75248) (not d!23930) (not b!75210) (not b!75226) (not d!23880) (not d!23944) (not b!75208) (not b!75206))
