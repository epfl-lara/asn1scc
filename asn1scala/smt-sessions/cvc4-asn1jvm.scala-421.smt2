; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10882 () Bool)

(assert start!10882)

(declare-fun b!54203 () Bool)

(declare-fun e!36211 () Bool)

(declare-fun e!36210 () Bool)

(assert (=> b!54203 (= e!36211 e!36210)))

(declare-fun res!45261 () Bool)

(assert (=> b!54203 (=> res!45261 e!36210)))

(declare-datatypes ((array!2552 0))(
  ( (array!2553 (arr!1702 (Array (_ BitVec 32) (_ BitVec 8))) (size!1165 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2018 0))(
  ( (BitStream!2019 (buf!1519 array!2552) (currentByte!3092 (_ BitVec 32)) (currentBit!3087 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2018)

(declare-datatypes ((Unit!3739 0))(
  ( (Unit!3740) )
))
(declare-datatypes ((tuple2!4946 0))(
  ( (tuple2!4947 (_1!2584 Unit!3739) (_2!2584 BitStream!2018)) )
))
(declare-fun lt!83813 () tuple2!4946)

(declare-fun isPrefixOf!0 (BitStream!2018 BitStream!2018) Bool)

(assert (=> b!54203 (= res!45261 (not (isPrefixOf!0 thiss!1379 (_2!2584 lt!83813))))))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!54203 (validate_offset_bits!1 ((_ sign_extend 32) (size!1165 (buf!1519 (_2!2584 lt!83813)))) ((_ sign_extend 32) (currentByte!3092 (_2!2584 lt!83813))) ((_ sign_extend 32) (currentBit!3087 (_2!2584 lt!83813))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!83811 () Unit!3739)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2018 BitStream!2018 (_ BitVec 64) (_ BitVec 64)) Unit!3739)

(assert (=> b!54203 (= lt!83811 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2584 lt!83813) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2552)

(declare-fun appendBitFromByte!0 (BitStream!2018 (_ BitVec 8) (_ BitVec 32)) tuple2!4946)

(assert (=> b!54203 (= lt!83813 (appendBitFromByte!0 thiss!1379 (select (arr!1702 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!54204 () Bool)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2018 array!2552 (_ BitVec 64) (_ BitVec 64)) tuple2!4946)

(assert (=> b!54204 (= e!36210 (isPrefixOf!0 (_2!2584 lt!83813) (_2!2584 (appendBitsMSBFirstLoop!0 (_2!2584 lt!83813) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))))

(declare-fun e!36213 () Bool)

(assert (=> b!54204 e!36213))

(declare-fun res!45260 () Bool)

(assert (=> b!54204 (=> (not res!45260) (not e!36213))))

(assert (=> b!54204 (= res!45260 (validate_offset_bits!1 ((_ sign_extend 32) (size!1165 (buf!1519 (_2!2584 lt!83813)))) ((_ sign_extend 32) (currentByte!3092 thiss!1379)) ((_ sign_extend 32) (currentBit!3087 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!83814 () Unit!3739)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2018 array!2552 (_ BitVec 64)) Unit!3739)

(assert (=> b!54204 (= lt!83814 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1519 (_2!2584 lt!83813)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!4948 0))(
  ( (tuple2!4949 (_1!2585 BitStream!2018) (_2!2585 BitStream!2018)) )
))
(declare-fun lt!83812 () tuple2!4948)

(declare-fun reader!0 (BitStream!2018 BitStream!2018) tuple2!4948)

(assert (=> b!54204 (= lt!83812 (reader!0 thiss!1379 (_2!2584 lt!83813)))))

(declare-fun b!54205 () Bool)

(declare-fun e!36215 () Bool)

(assert (=> b!54205 (= e!36215 (not e!36211))))

(declare-fun res!45259 () Bool)

(assert (=> b!54205 (=> res!45259 e!36211)))

(assert (=> b!54205 (= res!45259 (bvsge i!635 to!314))))

(assert (=> b!54205 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!83810 () Unit!3739)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2018) Unit!3739)

(assert (=> b!54205 (= lt!83810 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!83815 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!54205 (= lt!83815 (bitIndex!0 (size!1165 (buf!1519 thiss!1379)) (currentByte!3092 thiss!1379) (currentBit!3087 thiss!1379)))))

(declare-fun res!45257 () Bool)

(assert (=> start!10882 (=> (not res!45257) (not e!36215))))

(assert (=> start!10882 (= res!45257 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1165 srcBuffer!2))))))))

(assert (=> start!10882 e!36215))

(assert (=> start!10882 true))

(declare-fun array_inv!1068 (array!2552) Bool)

(assert (=> start!10882 (array_inv!1068 srcBuffer!2)))

(declare-fun e!36212 () Bool)

(declare-fun inv!12 (BitStream!2018) Bool)

(assert (=> start!10882 (and (inv!12 thiss!1379) e!36212)))

(declare-fun b!54206 () Bool)

(declare-fun res!45258 () Bool)

(assert (=> b!54206 (=> (not res!45258) (not e!36215))))

(assert (=> b!54206 (= res!45258 (validate_offset_bits!1 ((_ sign_extend 32) (size!1165 (buf!1519 thiss!1379))) ((_ sign_extend 32) (currentByte!3092 thiss!1379)) ((_ sign_extend 32) (currentBit!3087 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!54207 () Bool)

(assert (=> b!54207 (= e!36212 (array_inv!1068 (buf!1519 thiss!1379)))))

(declare-fun b!54208 () Bool)

(declare-datatypes ((List!584 0))(
  ( (Nil!581) (Cons!580 (h!699 Bool) (t!1334 List!584)) )
))
(declare-fun head!403 (List!584) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2018 array!2552 (_ BitVec 64) (_ BitVec 64)) List!584)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2018 BitStream!2018 (_ BitVec 64)) List!584)

(assert (=> b!54208 (= e!36213 (= (head!403 (byteArrayBitContentToList!0 (_2!2584 lt!83813) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!403 (bitStreamReadBitsIntoList!0 (_2!2584 lt!83813) (_1!2585 lt!83812) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and start!10882 res!45257) b!54206))

(assert (= (and b!54206 res!45258) b!54205))

(assert (= (and b!54205 (not res!45259)) b!54203))

(assert (= (and b!54203 (not res!45261)) b!54204))

(assert (= (and b!54204 res!45260) b!54208))

(assert (= start!10882 b!54207))

(declare-fun m!85225 () Bool)

(assert (=> b!54207 m!85225))

(declare-fun m!85227 () Bool)

(assert (=> b!54206 m!85227))

(declare-fun m!85229 () Bool)

(assert (=> start!10882 m!85229))

(declare-fun m!85231 () Bool)

(assert (=> start!10882 m!85231))

(declare-fun m!85233 () Bool)

(assert (=> b!54208 m!85233))

(assert (=> b!54208 m!85233))

(declare-fun m!85235 () Bool)

(assert (=> b!54208 m!85235))

(declare-fun m!85237 () Bool)

(assert (=> b!54208 m!85237))

(assert (=> b!54208 m!85237))

(declare-fun m!85239 () Bool)

(assert (=> b!54208 m!85239))

(declare-fun m!85241 () Bool)

(assert (=> b!54205 m!85241))

(declare-fun m!85243 () Bool)

(assert (=> b!54205 m!85243))

(declare-fun m!85245 () Bool)

(assert (=> b!54205 m!85245))

(declare-fun m!85247 () Bool)

(assert (=> b!54204 m!85247))

(declare-fun m!85249 () Bool)

(assert (=> b!54204 m!85249))

(declare-fun m!85251 () Bool)

(assert (=> b!54204 m!85251))

(declare-fun m!85253 () Bool)

(assert (=> b!54204 m!85253))

(declare-fun m!85255 () Bool)

(assert (=> b!54204 m!85255))

(declare-fun m!85257 () Bool)

(assert (=> b!54203 m!85257))

(declare-fun m!85259 () Bool)

(assert (=> b!54203 m!85259))

(declare-fun m!85261 () Bool)

(assert (=> b!54203 m!85261))

(declare-fun m!85263 () Bool)

(assert (=> b!54203 m!85263))

(assert (=> b!54203 m!85261))

(declare-fun m!85265 () Bool)

(assert (=> b!54203 m!85265))

(push 1)

(assert (not b!54206))

(assert (not start!10882))

(assert (not b!54208))

(assert (not b!54207))

(assert (not b!54204))

(assert (not b!54203))

(assert (not b!54205))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!17288 () Bool)

(assert (=> d!17288 (= (array_inv!1068 srcBuffer!2) (bvsge (size!1165 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!10882 d!17288))

(declare-fun d!17292 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!17292 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3087 thiss!1379) (currentByte!3092 thiss!1379) (size!1165 (buf!1519 thiss!1379))))))

(declare-fun bs!4364 () Bool)

(assert (= bs!4364 d!17292))

(declare-fun m!85299 () Bool)

(assert (=> bs!4364 m!85299))

(assert (=> start!10882 d!17292))

(declare-fun d!17294 () Bool)

(declare-fun res!45290 () Bool)

(declare-fun e!36243 () Bool)

(assert (=> d!17294 (=> (not res!45290) (not e!36243))))

(assert (=> d!17294 (= res!45290 (= (size!1165 (buf!1519 thiss!1379)) (size!1165 (buf!1519 thiss!1379))))))

(assert (=> d!17294 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!36243)))

(declare-fun b!54254 () Bool)

(declare-fun res!45291 () Bool)

(assert (=> b!54254 (=> (not res!45291) (not e!36243))))

(assert (=> b!54254 (= res!45291 (bvsle (bitIndex!0 (size!1165 (buf!1519 thiss!1379)) (currentByte!3092 thiss!1379) (currentBit!3087 thiss!1379)) (bitIndex!0 (size!1165 (buf!1519 thiss!1379)) (currentByte!3092 thiss!1379) (currentBit!3087 thiss!1379))))))

(declare-fun b!54255 () Bool)

(declare-fun e!36244 () Bool)

(assert (=> b!54255 (= e!36243 e!36244)))

(declare-fun res!45289 () Bool)

(assert (=> b!54255 (=> res!45289 e!36244)))

(assert (=> b!54255 (= res!45289 (= (size!1165 (buf!1519 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!54256 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2552 array!2552 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!54256 (= e!36244 (arrayBitRangesEq!0 (buf!1519 thiss!1379) (buf!1519 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1165 (buf!1519 thiss!1379)) (currentByte!3092 thiss!1379) (currentBit!3087 thiss!1379))))))

(assert (= (and d!17294 res!45290) b!54254))

(assert (= (and b!54254 res!45291) b!54255))

(assert (= (and b!54255 (not res!45289)) b!54256))

(assert (=> b!54254 m!85245))

(assert (=> b!54254 m!85245))

(assert (=> b!54256 m!85245))

(assert (=> b!54256 m!85245))

(declare-fun m!85301 () Bool)

(assert (=> b!54256 m!85301))

(assert (=> b!54205 d!17294))

(declare-fun d!17296 () Bool)

(assert (=> d!17296 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!83851 () Unit!3739)

(declare-fun choose!11 (BitStream!2018) Unit!3739)

(assert (=> d!17296 (= lt!83851 (choose!11 thiss!1379))))

(assert (=> d!17296 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!83851)))

(declare-fun bs!4366 () Bool)

(assert (= bs!4366 d!17296))

(assert (=> bs!4366 m!85241))

(declare-fun m!85303 () Bool)

(assert (=> bs!4366 m!85303))

(assert (=> b!54205 d!17296))

(declare-fun d!17298 () Bool)

(declare-fun e!36255 () Bool)

(assert (=> d!17298 e!36255))

(declare-fun res!45312 () Bool)

(assert (=> d!17298 (=> (not res!45312) (not e!36255))))

(declare-fun lt!83935 () (_ BitVec 64))

(declare-fun lt!83932 () (_ BitVec 64))

(declare-fun lt!83937 () (_ BitVec 64))

(assert (=> d!17298 (= res!45312 (= lt!83935 (bvsub lt!83932 lt!83937)))))

(assert (=> d!17298 (or (= (bvand lt!83932 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!83937 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!83932 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!83932 lt!83937) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!17298 (= lt!83937 (remainingBits!0 ((_ sign_extend 32) (size!1165 (buf!1519 thiss!1379))) ((_ sign_extend 32) (currentByte!3092 thiss!1379)) ((_ sign_extend 32) (currentBit!3087 thiss!1379))))))

(declare-fun lt!83934 () (_ BitVec 64))

(declare-fun lt!83936 () (_ BitVec 64))

(assert (=> d!17298 (= lt!83932 (bvmul lt!83934 lt!83936))))

(assert (=> d!17298 (or (= lt!83934 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!83936 (bvsdiv (bvmul lt!83934 lt!83936) lt!83934)))))

(assert (=> d!17298 (= lt!83936 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!17298 (= lt!83934 ((_ sign_extend 32) (size!1165 (buf!1519 thiss!1379))))))

(assert (=> d!17298 (= lt!83935 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3092 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3087 thiss!1379))))))

(assert (=> d!17298 (invariant!0 (currentBit!3087 thiss!1379) (currentByte!3092 thiss!1379) (size!1165 (buf!1519 thiss!1379)))))

(assert (=> d!17298 (= (bitIndex!0 (size!1165 (buf!1519 thiss!1379)) (currentByte!3092 thiss!1379) (currentBit!3087 thiss!1379)) lt!83935)))

(declare-fun b!54283 () Bool)

(declare-fun res!45311 () Bool)

(assert (=> b!54283 (=> (not res!45311) (not e!36255))))

(assert (=> b!54283 (= res!45311 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!83935))))

(declare-fun b!54284 () Bool)

(declare-fun lt!83933 () (_ BitVec 64))

(assert (=> b!54284 (= e!36255 (bvsle lt!83935 (bvmul lt!83933 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!54284 (or (= lt!83933 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!83933 #b0000000000000000000000000000000000000000000000000000000000001000) lt!83933)))))

(assert (=> b!54284 (= lt!83933 ((_ sign_extend 32) (size!1165 (buf!1519 thiss!1379))))))

(assert (= (and d!17298 res!45312) b!54283))

(assert (= (and b!54283 res!45311) b!54284))

(declare-fun m!85305 () Bool)

(assert (=> d!17298 m!85305))

(assert (=> d!17298 m!85299))

(assert (=> b!54205 d!17298))

(declare-fun d!17300 () Bool)

(declare-fun res!45316 () Bool)

(declare-fun e!36258 () Bool)

(assert (=> d!17300 (=> (not res!45316) (not e!36258))))

(assert (=> d!17300 (= res!45316 (= (size!1165 (buf!1519 thiss!1379)) (size!1165 (buf!1519 (_2!2584 lt!83813)))))))

(assert (=> d!17300 (= (isPrefixOf!0 thiss!1379 (_2!2584 lt!83813)) e!36258)))

(declare-fun b!54287 () Bool)

(declare-fun res!45317 () Bool)

(assert (=> b!54287 (=> (not res!45317) (not e!36258))))

(assert (=> b!54287 (= res!45317 (bvsle (bitIndex!0 (size!1165 (buf!1519 thiss!1379)) (currentByte!3092 thiss!1379) (currentBit!3087 thiss!1379)) (bitIndex!0 (size!1165 (buf!1519 (_2!2584 lt!83813))) (currentByte!3092 (_2!2584 lt!83813)) (currentBit!3087 (_2!2584 lt!83813)))))))

(declare-fun b!54288 () Bool)

(declare-fun e!36259 () Bool)

(assert (=> b!54288 (= e!36258 e!36259)))

(declare-fun res!45315 () Bool)

(assert (=> b!54288 (=> res!45315 e!36259)))

(assert (=> b!54288 (= res!45315 (= (size!1165 (buf!1519 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!54289 () Bool)

(assert (=> b!54289 (= e!36259 (arrayBitRangesEq!0 (buf!1519 thiss!1379) (buf!1519 (_2!2584 lt!83813)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1165 (buf!1519 thiss!1379)) (currentByte!3092 thiss!1379) (currentBit!3087 thiss!1379))))))

(assert (= (and d!17300 res!45316) b!54287))

(assert (= (and b!54287 res!45317) b!54288))

(assert (= (and b!54288 (not res!45315)) b!54289))

(assert (=> b!54287 m!85245))

(declare-fun m!85317 () Bool)

(assert (=> b!54287 m!85317))

(assert (=> b!54289 m!85245))

(assert (=> b!54289 m!85245))

(declare-fun m!85327 () Bool)

(assert (=> b!54289 m!85327))

(assert (=> b!54203 d!17300))

(declare-fun d!17302 () Bool)

(assert (=> d!17302 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1165 (buf!1519 (_2!2584 lt!83813)))) ((_ sign_extend 32) (currentByte!3092 (_2!2584 lt!83813))) ((_ sign_extend 32) (currentBit!3087 (_2!2584 lt!83813))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1165 (buf!1519 (_2!2584 lt!83813)))) ((_ sign_extend 32) (currentByte!3092 (_2!2584 lt!83813))) ((_ sign_extend 32) (currentBit!3087 (_2!2584 lt!83813)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!4367 () Bool)

(assert (= bs!4367 d!17302))

(declare-fun m!85339 () Bool)

(assert (=> bs!4367 m!85339))

(assert (=> b!54203 d!17302))

(declare-fun d!17306 () Bool)

(declare-fun e!36272 () Bool)

(assert (=> d!17306 e!36272))

(declare-fun res!45337 () Bool)

(assert (=> d!17306 (=> (not res!45337) (not e!36272))))

(assert (=> d!17306 (= res!45337 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!83956 () Unit!3739)

(declare-fun choose!27 (BitStream!2018 BitStream!2018 (_ BitVec 64) (_ BitVec 64)) Unit!3739)

(assert (=> d!17306 (= lt!83956 (choose!27 thiss!1379 (_2!2584 lt!83813) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!17306 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!17306 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2584 lt!83813) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!83956)))

(declare-fun b!54309 () Bool)

(assert (=> b!54309 (= e!36272 (validate_offset_bits!1 ((_ sign_extend 32) (size!1165 (buf!1519 (_2!2584 lt!83813)))) ((_ sign_extend 32) (currentByte!3092 (_2!2584 lt!83813))) ((_ sign_extend 32) (currentBit!3087 (_2!2584 lt!83813))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!17306 res!45337) b!54309))

(declare-fun m!85345 () Bool)

(assert (=> d!17306 m!85345))

(assert (=> b!54309 m!85259))

(assert (=> b!54203 d!17306))

(declare-fun b!54353 () Bool)

(declare-fun e!36294 () Bool)

(declare-fun e!36296 () Bool)

(assert (=> b!54353 (= e!36294 e!36296)))

(declare-fun res!45369 () Bool)

(assert (=> b!54353 (=> (not res!45369) (not e!36296))))

(declare-datatypes ((tuple2!4966 0))(
  ( (tuple2!4967 (_1!2594 BitStream!2018) (_2!2594 Bool)) )
))
(declare-fun lt!84013 () tuple2!4966)

(declare-fun lt!84012 () tuple2!4946)

(declare-fun lt!84016 () Bool)

(assert (=> b!54353 (= res!45369 (and (= (_2!2594 lt!84013) lt!84016) (= (_1!2594 lt!84013) (_2!2584 lt!84012))))))

(declare-fun readBitPure!0 (BitStream!2018) tuple2!4966)

(declare-fun readerFrom!0 (BitStream!2018 (_ BitVec 32) (_ BitVec 32)) BitStream!2018)

(assert (=> b!54353 (= lt!84013 (readBitPure!0 (readerFrom!0 (_2!2584 lt!84012) (currentBit!3087 thiss!1379) (currentByte!3092 thiss!1379))))))

(declare-fun b!54354 () Bool)

(declare-fun res!45366 () Bool)

(assert (=> b!54354 (=> (not res!45366) (not e!36294))))

(assert (=> b!54354 (= res!45366 (isPrefixOf!0 thiss!1379 (_2!2584 lt!84012)))))

(declare-fun b!54355 () Bool)

(declare-fun res!45367 () Bool)

(declare-fun e!36295 () Bool)

(assert (=> b!54355 (=> (not res!45367) (not e!36295))))

(declare-fun lt!84007 () tuple2!4946)

(assert (=> b!54355 (= res!45367 (isPrefixOf!0 thiss!1379 (_2!2584 lt!84007)))))

(declare-fun b!54356 () Bool)

(declare-fun res!45362 () Bool)

(assert (=> b!54356 (=> (not res!45362) (not e!36294))))

(assert (=> b!54356 (= res!45362 (= (bitIndex!0 (size!1165 (buf!1519 (_2!2584 lt!84012))) (currentByte!3092 (_2!2584 lt!84012)) (currentBit!3087 (_2!2584 lt!84012))) (bvadd (bitIndex!0 (size!1165 (buf!1519 thiss!1379)) (currentByte!3092 thiss!1379) (currentBit!3087 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!54357 () Bool)

(declare-fun e!36297 () Bool)

(declare-fun lt!84008 () tuple2!4966)

(assert (=> b!54357 (= e!36297 (= (bitIndex!0 (size!1165 (buf!1519 (_1!2594 lt!84008))) (currentByte!3092 (_1!2594 lt!84008)) (currentBit!3087 (_1!2594 lt!84008))) (bitIndex!0 (size!1165 (buf!1519 (_2!2584 lt!84007))) (currentByte!3092 (_2!2584 lt!84007)) (currentBit!3087 (_2!2584 lt!84007)))))))

(declare-fun b!54358 () Bool)

(declare-fun res!45363 () Bool)

(assert (=> b!54358 (=> (not res!45363) (not e!36295))))

(declare-fun lt!84015 () (_ BitVec 64))

(declare-fun lt!84006 () (_ BitVec 64))

(assert (=> b!54358 (= res!45363 (= (bitIndex!0 (size!1165 (buf!1519 (_2!2584 lt!84007))) (currentByte!3092 (_2!2584 lt!84007)) (currentBit!3087 (_2!2584 lt!84007))) (bvadd lt!84015 lt!84006)))))

(assert (=> b!54358 (or (not (= (bvand lt!84015 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!84006 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!84015 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!84015 lt!84006) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!54358 (= lt!84006 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!54358 (= lt!84015 (bitIndex!0 (size!1165 (buf!1519 thiss!1379)) (currentByte!3092 thiss!1379) (currentBit!3087 thiss!1379)))))

(declare-fun b!54359 () Bool)

(assert (=> b!54359 (= e!36296 (= (bitIndex!0 (size!1165 (buf!1519 (_1!2594 lt!84013))) (currentByte!3092 (_1!2594 lt!84013)) (currentBit!3087 (_1!2594 lt!84013))) (bitIndex!0 (size!1165 (buf!1519 (_2!2584 lt!84012))) (currentByte!3092 (_2!2584 lt!84012)) (currentBit!3087 (_2!2584 lt!84012)))))))

(declare-fun b!54360 () Bool)

(assert (=> b!54360 (= e!36295 e!36297)))

(declare-fun res!45368 () Bool)

(assert (=> b!54360 (=> (not res!45368) (not e!36297))))

(declare-fun lt!84011 () (_ BitVec 8))

(assert (=> b!54360 (= res!45368 (and (= (_2!2594 lt!84008) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1702 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!84011)) #b00000000000000000000000000000000))) (= (_1!2594 lt!84008) (_2!2584 lt!84007))))))

(declare-datatypes ((tuple2!4968 0))(
  ( (tuple2!4969 (_1!2595 array!2552) (_2!2595 BitStream!2018)) )
))
(declare-fun lt!84010 () tuple2!4968)

(declare-fun lt!84005 () BitStream!2018)

(declare-fun readBits!0 (BitStream!2018 (_ BitVec 64)) tuple2!4968)

(assert (=> b!54360 (= lt!84010 (readBits!0 lt!84005 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!54360 (= lt!84008 (readBitPure!0 lt!84005))))

(assert (=> b!54360 (= lt!84005 (readerFrom!0 (_2!2584 lt!84007) (currentBit!3087 thiss!1379) (currentByte!3092 thiss!1379)))))

(declare-fun d!17310 () Bool)

(assert (=> d!17310 e!36295))

(declare-fun res!45365 () Bool)

(assert (=> d!17310 (=> (not res!45365) (not e!36295))))

(assert (=> d!17310 (= res!45365 (= (size!1165 (buf!1519 (_2!2584 lt!84007))) (size!1165 (buf!1519 thiss!1379))))))

(declare-fun lt!84014 () array!2552)

(assert (=> d!17310 (= lt!84011 (select (arr!1702 lt!84014) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!17310 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1165 lt!84014)))))

(assert (=> d!17310 (= lt!84014 (array!2553 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!84009 () tuple2!4946)

(assert (=> d!17310 (= lt!84007 (tuple2!4947 (_1!2584 lt!84009) (_2!2584 lt!84009)))))

(assert (=> d!17310 (= lt!84009 lt!84012)))

(assert (=> d!17310 e!36294))

(declare-fun res!45364 () Bool)

(assert (=> d!17310 (=> (not res!45364) (not e!36294))))

(assert (=> d!17310 (= res!45364 (= (size!1165 (buf!1519 thiss!1379)) (size!1165 (buf!1519 (_2!2584 lt!84012)))))))

(declare-fun appendBit!0 (BitStream!2018 Bool) tuple2!4946)

(assert (=> d!17310 (= lt!84012 (appendBit!0 thiss!1379 lt!84016))))

(assert (=> d!17310 (= lt!84016 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1702 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!17310 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!17310 (= (appendBitFromByte!0 thiss!1379 (select (arr!1702 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!84007)))

(assert (= (and d!17310 res!45364) b!54356))

(assert (= (and b!54356 res!45362) b!54354))

(assert (= (and b!54354 res!45366) b!54353))

(assert (= (and b!54353 res!45369) b!54359))

(assert (= (and d!17310 res!45365) b!54358))

(assert (= (and b!54358 res!45363) b!54355))

(assert (= (and b!54355 res!45367) b!54360))

(assert (= (and b!54360 res!45368) b!54357))

(declare-fun m!85387 () Bool)

(assert (=> b!54356 m!85387))

(assert (=> b!54356 m!85245))

(declare-fun m!85389 () Bool)

(assert (=> d!17310 m!85389))

(declare-fun m!85391 () Bool)

(assert (=> d!17310 m!85391))

(declare-fun m!85393 () Bool)

(assert (=> d!17310 m!85393))

(declare-fun m!85395 () Bool)

(assert (=> b!54360 m!85395))

(declare-fun m!85397 () Bool)

(assert (=> b!54360 m!85397))

(declare-fun m!85399 () Bool)

(assert (=> b!54360 m!85399))

(declare-fun m!85401 () Bool)

(assert (=> b!54358 m!85401))

(assert (=> b!54358 m!85245))

(declare-fun m!85403 () Bool)

(assert (=> b!54353 m!85403))

(assert (=> b!54353 m!85403))

(declare-fun m!85405 () Bool)

(assert (=> b!54353 m!85405))

(declare-fun m!85407 () Bool)

(assert (=> b!54359 m!85407))

(assert (=> b!54359 m!85387))

(declare-fun m!85409 () Bool)

(assert (=> b!54357 m!85409))

(assert (=> b!54357 m!85401))

(declare-fun m!85411 () Bool)

(assert (=> b!54355 m!85411))

(declare-fun m!85413 () Bool)

(assert (=> b!54354 m!85413))

(assert (=> b!54203 d!17310))

(declare-fun d!17328 () Bool)

(declare-fun e!36302 () Bool)

(assert (=> d!17328 e!36302))

(declare-fun res!45377 () Bool)

(assert (=> d!17328 (=> (not res!45377) (not e!36302))))

(declare-fun lt!84073 () tuple2!4948)

(assert (=> d!17328 (= res!45377 (isPrefixOf!0 (_1!2585 lt!84073) (_2!2585 lt!84073)))))

(declare-fun lt!84059 () BitStream!2018)

(assert (=> d!17328 (= lt!84073 (tuple2!4949 lt!84059 (_2!2584 lt!83813)))))

(declare-fun lt!84060 () Unit!3739)

(declare-fun lt!84068 () Unit!3739)

(assert (=> d!17328 (= lt!84060 lt!84068)))

(assert (=> d!17328 (isPrefixOf!0 lt!84059 (_2!2584 lt!83813))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2018 BitStream!2018 BitStream!2018) Unit!3739)

(assert (=> d!17328 (= lt!84068 (lemmaIsPrefixTransitive!0 lt!84059 (_2!2584 lt!83813) (_2!2584 lt!83813)))))

(declare-fun lt!84072 () Unit!3739)

(declare-fun lt!84070 () Unit!3739)

(assert (=> d!17328 (= lt!84072 lt!84070)))

(assert (=> d!17328 (isPrefixOf!0 lt!84059 (_2!2584 lt!83813))))

(assert (=> d!17328 (= lt!84070 (lemmaIsPrefixTransitive!0 lt!84059 thiss!1379 (_2!2584 lt!83813)))))

(declare-fun lt!84076 () Unit!3739)

(declare-fun e!36303 () Unit!3739)

(assert (=> d!17328 (= lt!84076 e!36303)))

(declare-fun c!3846 () Bool)

(assert (=> d!17328 (= c!3846 (not (= (size!1165 (buf!1519 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!84062 () Unit!3739)

(declare-fun lt!84069 () Unit!3739)

(assert (=> d!17328 (= lt!84062 lt!84069)))

(assert (=> d!17328 (isPrefixOf!0 (_2!2584 lt!83813) (_2!2584 lt!83813))))

(assert (=> d!17328 (= lt!84069 (lemmaIsPrefixRefl!0 (_2!2584 lt!83813)))))

(declare-fun lt!84061 () Unit!3739)

(declare-fun lt!84066 () Unit!3739)

(assert (=> d!17328 (= lt!84061 lt!84066)))

(assert (=> d!17328 (= lt!84066 (lemmaIsPrefixRefl!0 (_2!2584 lt!83813)))))

(declare-fun lt!84058 () Unit!3739)

(declare-fun lt!84067 () Unit!3739)

(assert (=> d!17328 (= lt!84058 lt!84067)))

(assert (=> d!17328 (isPrefixOf!0 lt!84059 lt!84059)))

(assert (=> d!17328 (= lt!84067 (lemmaIsPrefixRefl!0 lt!84059))))

(declare-fun lt!84064 () Unit!3739)

(declare-fun lt!84071 () Unit!3739)

(assert (=> d!17328 (= lt!84064 lt!84071)))

(assert (=> d!17328 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!17328 (= lt!84071 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!17328 (= lt!84059 (BitStream!2019 (buf!1519 (_2!2584 lt!83813)) (currentByte!3092 thiss!1379) (currentBit!3087 thiss!1379)))))

(assert (=> d!17328 (isPrefixOf!0 thiss!1379 (_2!2584 lt!83813))))

(assert (=> d!17328 (= (reader!0 thiss!1379 (_2!2584 lt!83813)) lt!84073)))

(declare-fun b!54371 () Bool)

(declare-fun res!45376 () Bool)

(assert (=> b!54371 (=> (not res!45376) (not e!36302))))

(assert (=> b!54371 (= res!45376 (isPrefixOf!0 (_2!2585 lt!84073) (_2!2584 lt!83813)))))

(declare-fun b!54372 () Bool)

(declare-fun Unit!3757 () Unit!3739)

(assert (=> b!54372 (= e!36303 Unit!3757)))

(declare-fun b!54373 () Bool)

(declare-fun res!45378 () Bool)

(assert (=> b!54373 (=> (not res!45378) (not e!36302))))

(assert (=> b!54373 (= res!45378 (isPrefixOf!0 (_1!2585 lt!84073) thiss!1379))))

(declare-fun lt!84063 () (_ BitVec 64))

(declare-fun b!54374 () Bool)

(declare-fun lt!84074 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2018 (_ BitVec 64)) BitStream!2018)

(assert (=> b!54374 (= e!36302 (= (_1!2585 lt!84073) (withMovedBitIndex!0 (_2!2585 lt!84073) (bvsub lt!84074 lt!84063))))))

(assert (=> b!54374 (or (= (bvand lt!84074 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!84063 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!84074 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!84074 lt!84063) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!54374 (= lt!84063 (bitIndex!0 (size!1165 (buf!1519 (_2!2584 lt!83813))) (currentByte!3092 (_2!2584 lt!83813)) (currentBit!3087 (_2!2584 lt!83813))))))

(assert (=> b!54374 (= lt!84074 (bitIndex!0 (size!1165 (buf!1519 thiss!1379)) (currentByte!3092 thiss!1379) (currentBit!3087 thiss!1379)))))

(declare-fun b!54375 () Bool)

(declare-fun lt!84057 () Unit!3739)

(assert (=> b!54375 (= e!36303 lt!84057)))

(declare-fun lt!84065 () (_ BitVec 64))

(assert (=> b!54375 (= lt!84065 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!84075 () (_ BitVec 64))

(assert (=> b!54375 (= lt!84075 (bitIndex!0 (size!1165 (buf!1519 thiss!1379)) (currentByte!3092 thiss!1379) (currentBit!3087 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2552 array!2552 (_ BitVec 64) (_ BitVec 64)) Unit!3739)

(assert (=> b!54375 (= lt!84057 (arrayBitRangesEqSymmetric!0 (buf!1519 thiss!1379) (buf!1519 (_2!2584 lt!83813)) lt!84065 lt!84075))))

(assert (=> b!54375 (arrayBitRangesEq!0 (buf!1519 (_2!2584 lt!83813)) (buf!1519 thiss!1379) lt!84065 lt!84075)))

(assert (= (and d!17328 c!3846) b!54375))

(assert (= (and d!17328 (not c!3846)) b!54372))

(assert (= (and d!17328 res!45377) b!54373))

(assert (= (and b!54373 res!45378) b!54371))

(assert (= (and b!54371 res!45376) b!54374))

(declare-fun m!85415 () Bool)

(assert (=> b!54371 m!85415))

(assert (=> b!54375 m!85245))

(declare-fun m!85417 () Bool)

(assert (=> b!54375 m!85417))

(declare-fun m!85419 () Bool)

(assert (=> b!54375 m!85419))

(declare-fun m!85421 () Bool)

(assert (=> b!54374 m!85421))

(assert (=> b!54374 m!85317))

(assert (=> b!54374 m!85245))

(declare-fun m!85423 () Bool)

(assert (=> d!17328 m!85423))

(declare-fun m!85425 () Bool)

(assert (=> d!17328 m!85425))

(declare-fun m!85427 () Bool)

(assert (=> d!17328 m!85427))

(declare-fun m!85429 () Bool)

(assert (=> d!17328 m!85429))

(declare-fun m!85431 () Bool)

(assert (=> d!17328 m!85431))

(declare-fun m!85433 () Bool)

(assert (=> d!17328 m!85433))

(assert (=> d!17328 m!85243))

(assert (=> d!17328 m!85241))

(declare-fun m!85435 () Bool)

(assert (=> d!17328 m!85435))

(declare-fun m!85437 () Bool)

(assert (=> d!17328 m!85437))

(assert (=> d!17328 m!85263))

(declare-fun m!85439 () Bool)

(assert (=> b!54373 m!85439))

(assert (=> b!54204 d!17328))

(declare-fun d!17330 () Bool)

(declare-fun res!45380 () Bool)

(declare-fun e!36304 () Bool)

(assert (=> d!17330 (=> (not res!45380) (not e!36304))))

(assert (=> d!17330 (= res!45380 (= (size!1165 (buf!1519 (_2!2584 lt!83813))) (size!1165 (buf!1519 (_2!2584 (appendBitsMSBFirstLoop!0 (_2!2584 lt!83813) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))))))

(assert (=> d!17330 (= (isPrefixOf!0 (_2!2584 lt!83813) (_2!2584 (appendBitsMSBFirstLoop!0 (_2!2584 lt!83813) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))) e!36304)))

(declare-fun b!54376 () Bool)

(declare-fun res!45381 () Bool)

(assert (=> b!54376 (=> (not res!45381) (not e!36304))))

(assert (=> b!54376 (= res!45381 (bvsle (bitIndex!0 (size!1165 (buf!1519 (_2!2584 lt!83813))) (currentByte!3092 (_2!2584 lt!83813)) (currentBit!3087 (_2!2584 lt!83813))) (bitIndex!0 (size!1165 (buf!1519 (_2!2584 (appendBitsMSBFirstLoop!0 (_2!2584 lt!83813) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314)))) (currentByte!3092 (_2!2584 (appendBitsMSBFirstLoop!0 (_2!2584 lt!83813) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))) (currentBit!3087 (_2!2584 (appendBitsMSBFirstLoop!0 (_2!2584 lt!83813) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))))))

(declare-fun b!54377 () Bool)

(declare-fun e!36305 () Bool)

(assert (=> b!54377 (= e!36304 e!36305)))

(declare-fun res!45379 () Bool)

(assert (=> b!54377 (=> res!45379 e!36305)))

(assert (=> b!54377 (= res!45379 (= (size!1165 (buf!1519 (_2!2584 lt!83813))) #b00000000000000000000000000000000))))

(declare-fun b!54378 () Bool)

(assert (=> b!54378 (= e!36305 (arrayBitRangesEq!0 (buf!1519 (_2!2584 lt!83813)) (buf!1519 (_2!2584 (appendBitsMSBFirstLoop!0 (_2!2584 lt!83813) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1165 (buf!1519 (_2!2584 lt!83813))) (currentByte!3092 (_2!2584 lt!83813)) (currentBit!3087 (_2!2584 lt!83813)))))))

(assert (= (and d!17330 res!45380) b!54376))

(assert (= (and b!54376 res!45381) b!54377))

(assert (= (and b!54377 (not res!45379)) b!54378))

(assert (=> b!54376 m!85317))

(declare-fun m!85441 () Bool)

(assert (=> b!54376 m!85441))

(assert (=> b!54378 m!85317))

(assert (=> b!54378 m!85317))

(declare-fun m!85443 () Bool)

(assert (=> b!54378 m!85443))

(assert (=> b!54204 d!17330))

(declare-fun b!54502 () Bool)

(declare-fun e!36362 () tuple2!4946)

(declare-fun lt!84581 () tuple2!4946)

(declare-fun Unit!3758 () Unit!3739)

(assert (=> b!54502 (= e!36362 (tuple2!4947 Unit!3758 (_2!2584 lt!84581)))))

(declare-fun lt!84582 () tuple2!4946)

(assert (=> b!54502 (= lt!84582 (appendBitFromByte!0 (_2!2584 lt!83813) (select (arr!1702 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!84555 () (_ BitVec 64))

(assert (=> b!54502 (= lt!84555 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!84575 () (_ BitVec 64))

(assert (=> b!54502 (= lt!84575 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!84567 () Unit!3739)

(assert (=> b!54502 (= lt!84567 (validateOffsetBitsIneqLemma!0 (_2!2584 lt!83813) (_2!2584 lt!84582) lt!84555 lt!84575))))

(assert (=> b!54502 (validate_offset_bits!1 ((_ sign_extend 32) (size!1165 (buf!1519 (_2!2584 lt!84582)))) ((_ sign_extend 32) (currentByte!3092 (_2!2584 lt!84582))) ((_ sign_extend 32) (currentBit!3087 (_2!2584 lt!84582))) (bvsub lt!84555 lt!84575))))

(declare-fun lt!84569 () Unit!3739)

(assert (=> b!54502 (= lt!84569 lt!84567)))

(declare-fun lt!84570 () tuple2!4948)

(assert (=> b!54502 (= lt!84570 (reader!0 (_2!2584 lt!83813) (_2!2584 lt!84582)))))

(declare-fun lt!84574 () (_ BitVec 64))

(assert (=> b!54502 (= lt!84574 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!84561 () Unit!3739)

(assert (=> b!54502 (= lt!84561 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2584 lt!83813) (buf!1519 (_2!2584 lt!84582)) lt!84574))))

(assert (=> b!54502 (validate_offset_bits!1 ((_ sign_extend 32) (size!1165 (buf!1519 (_2!2584 lt!84582)))) ((_ sign_extend 32) (currentByte!3092 (_2!2584 lt!83813))) ((_ sign_extend 32) (currentBit!3087 (_2!2584 lt!83813))) lt!84574)))

(declare-fun lt!84556 () Unit!3739)

(assert (=> b!54502 (= lt!84556 lt!84561)))

(assert (=> b!54502 (= (head!403 (byteArrayBitContentToList!0 (_2!2584 lt!84582) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!403 (bitStreamReadBitsIntoList!0 (_2!2584 lt!84582) (_1!2585 lt!84570) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!84563 () Unit!3739)

(declare-fun Unit!3759 () Unit!3739)

(assert (=> b!54502 (= lt!84563 Unit!3759)))

(assert (=> b!54502 (= lt!84581 (appendBitsMSBFirstLoop!0 (_2!2584 lt!84582) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!84564 () Unit!3739)

(assert (=> b!54502 (= lt!84564 (lemmaIsPrefixTransitive!0 (_2!2584 lt!83813) (_2!2584 lt!84582) (_2!2584 lt!84581)))))

(assert (=> b!54502 (isPrefixOf!0 (_2!2584 lt!83813) (_2!2584 lt!84581))))

(declare-fun lt!84557 () Unit!3739)

(assert (=> b!54502 (= lt!84557 lt!84564)))

(assert (=> b!54502 (= (size!1165 (buf!1519 (_2!2584 lt!84581))) (size!1165 (buf!1519 (_2!2584 lt!83813))))))

(declare-fun lt!84589 () Unit!3739)

(declare-fun Unit!3760 () Unit!3739)

(assert (=> b!54502 (= lt!84589 Unit!3760)))

(assert (=> b!54502 (= (bitIndex!0 (size!1165 (buf!1519 (_2!2584 lt!84581))) (currentByte!3092 (_2!2584 lt!84581)) (currentBit!3087 (_2!2584 lt!84581))) (bvsub (bvadd (bitIndex!0 (size!1165 (buf!1519 (_2!2584 lt!83813))) (currentByte!3092 (_2!2584 lt!83813)) (currentBit!3087 (_2!2584 lt!83813))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!84566 () Unit!3739)

(declare-fun Unit!3761 () Unit!3739)

(assert (=> b!54502 (= lt!84566 Unit!3761)))

(assert (=> b!54502 (= (bitIndex!0 (size!1165 (buf!1519 (_2!2584 lt!84581))) (currentByte!3092 (_2!2584 lt!84581)) (currentBit!3087 (_2!2584 lt!84581))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1165 (buf!1519 (_2!2584 lt!84582))) (currentByte!3092 (_2!2584 lt!84582)) (currentBit!3087 (_2!2584 lt!84582))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!84573 () Unit!3739)

(declare-fun Unit!3762 () Unit!3739)

