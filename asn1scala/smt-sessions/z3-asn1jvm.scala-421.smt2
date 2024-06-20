; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10880 () Bool)

(assert start!10880)

(declare-fun b!54185 () Bool)

(declare-fun e!36192 () Bool)

(declare-fun e!36189 () Bool)

(assert (=> b!54185 (= e!36192 (not e!36189))))

(declare-fun res!45243 () Bool)

(assert (=> b!54185 (=> res!45243 e!36189)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!54185 (= res!45243 (bvsge i!635 to!314))))

(declare-datatypes ((array!2550 0))(
  ( (array!2551 (arr!1701 (Array (_ BitVec 32) (_ BitVec 8))) (size!1164 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2016 0))(
  ( (BitStream!2017 (buf!1518 array!2550) (currentByte!3091 (_ BitVec 32)) (currentBit!3086 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2016)

(declare-fun isPrefixOf!0 (BitStream!2016 BitStream!2016) Bool)

(assert (=> b!54185 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3737 0))(
  ( (Unit!3738) )
))
(declare-fun lt!83793 () Unit!3737)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2016) Unit!3737)

(assert (=> b!54185 (= lt!83793 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!83797 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!54185 (= lt!83797 (bitIndex!0 (size!1164 (buf!1518 thiss!1379)) (currentByte!3091 thiss!1379) (currentBit!3086 thiss!1379)))))

(declare-fun b!54186 () Bool)

(declare-fun res!45242 () Bool)

(assert (=> b!54186 (=> (not res!45242) (not e!36192))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!54186 (= res!45242 (validate_offset_bits!1 ((_ sign_extend 32) (size!1164 (buf!1518 thiss!1379))) ((_ sign_extend 32) (currentByte!3091 thiss!1379)) ((_ sign_extend 32) (currentBit!3086 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!45246 () Bool)

(assert (=> start!10880 (=> (not res!45246) (not e!36192))))

(declare-fun srcBuffer!2 () array!2550)

(assert (=> start!10880 (= res!45246 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1164 srcBuffer!2))))))))

(assert (=> start!10880 e!36192))

(assert (=> start!10880 true))

(declare-fun array_inv!1067 (array!2550) Bool)

(assert (=> start!10880 (array_inv!1067 srcBuffer!2)))

(declare-fun e!36194 () Bool)

(declare-fun inv!12 (BitStream!2016) Bool)

(assert (=> start!10880 (and (inv!12 thiss!1379) e!36194)))

(declare-fun b!54187 () Bool)

(declare-fun e!36191 () Bool)

(declare-datatypes ((tuple2!4942 0))(
  ( (tuple2!4943 (_1!2582 Unit!3737) (_2!2582 BitStream!2016)) )
))
(declare-fun lt!83796 () tuple2!4942)

(declare-datatypes ((tuple2!4944 0))(
  ( (tuple2!4945 (_1!2583 BitStream!2016) (_2!2583 BitStream!2016)) )
))
(declare-fun lt!83792 () tuple2!4944)

(declare-datatypes ((List!583 0))(
  ( (Nil!580) (Cons!579 (h!698 Bool) (t!1333 List!583)) )
))
(declare-fun head!402 (List!583) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2016 array!2550 (_ BitVec 64) (_ BitVec 64)) List!583)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2016 BitStream!2016 (_ BitVec 64)) List!583)

(assert (=> b!54187 (= e!36191 (= (head!402 (byteArrayBitContentToList!0 (_2!2582 lt!83796) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!402 (bitStreamReadBitsIntoList!0 (_2!2582 lt!83796) (_1!2583 lt!83792) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!54188 () Bool)

(declare-fun e!36190 () Bool)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2016 array!2550 (_ BitVec 64) (_ BitVec 64)) tuple2!4942)

(assert (=> b!54188 (= e!36190 (isPrefixOf!0 (_2!2582 lt!83796) (_2!2582 (appendBitsMSBFirstLoop!0 (_2!2582 lt!83796) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))))

(assert (=> b!54188 e!36191))

(declare-fun res!45245 () Bool)

(assert (=> b!54188 (=> (not res!45245) (not e!36191))))

(assert (=> b!54188 (= res!45245 (validate_offset_bits!1 ((_ sign_extend 32) (size!1164 (buf!1518 (_2!2582 lt!83796)))) ((_ sign_extend 32) (currentByte!3091 thiss!1379)) ((_ sign_extend 32) (currentBit!3086 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!83795 () Unit!3737)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2016 array!2550 (_ BitVec 64)) Unit!3737)

(assert (=> b!54188 (= lt!83795 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1518 (_2!2582 lt!83796)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!2016 BitStream!2016) tuple2!4944)

(assert (=> b!54188 (= lt!83792 (reader!0 thiss!1379 (_2!2582 lt!83796)))))

(declare-fun b!54189 () Bool)

(assert (=> b!54189 (= e!36189 e!36190)))

(declare-fun res!45244 () Bool)

(assert (=> b!54189 (=> res!45244 e!36190)))

(assert (=> b!54189 (= res!45244 (not (isPrefixOf!0 thiss!1379 (_2!2582 lt!83796))))))

(assert (=> b!54189 (validate_offset_bits!1 ((_ sign_extend 32) (size!1164 (buf!1518 (_2!2582 lt!83796)))) ((_ sign_extend 32) (currentByte!3091 (_2!2582 lt!83796))) ((_ sign_extend 32) (currentBit!3086 (_2!2582 lt!83796))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!83794 () Unit!3737)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2016 BitStream!2016 (_ BitVec 64) (_ BitVec 64)) Unit!3737)

(assert (=> b!54189 (= lt!83794 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2582 lt!83796) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2016 (_ BitVec 8) (_ BitVec 32)) tuple2!4942)

(assert (=> b!54189 (= lt!83796 (appendBitFromByte!0 thiss!1379 (select (arr!1701 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!54190 () Bool)

(assert (=> b!54190 (= e!36194 (array_inv!1067 (buf!1518 thiss!1379)))))

(assert (= (and start!10880 res!45246) b!54186))

(assert (= (and b!54186 res!45242) b!54185))

(assert (= (and b!54185 (not res!45243)) b!54189))

(assert (= (and b!54189 (not res!45244)) b!54188))

(assert (= (and b!54188 res!45245) b!54187))

(assert (= start!10880 b!54190))

(declare-fun m!85183 () Bool)

(assert (=> b!54190 m!85183))

(declare-fun m!85185 () Bool)

(assert (=> b!54188 m!85185))

(declare-fun m!85187 () Bool)

(assert (=> b!54188 m!85187))

(declare-fun m!85189 () Bool)

(assert (=> b!54188 m!85189))

(declare-fun m!85191 () Bool)

(assert (=> b!54188 m!85191))

(declare-fun m!85193 () Bool)

(assert (=> b!54188 m!85193))

(declare-fun m!85195 () Bool)

(assert (=> b!54186 m!85195))

(declare-fun m!85197 () Bool)

(assert (=> b!54189 m!85197))

(declare-fun m!85199 () Bool)

(assert (=> b!54189 m!85199))

(declare-fun m!85201 () Bool)

(assert (=> b!54189 m!85201))

(declare-fun m!85203 () Bool)

(assert (=> b!54189 m!85203))

(assert (=> b!54189 m!85199))

(declare-fun m!85205 () Bool)

(assert (=> b!54189 m!85205))

(declare-fun m!85207 () Bool)

(assert (=> b!54187 m!85207))

(assert (=> b!54187 m!85207))

(declare-fun m!85209 () Bool)

(assert (=> b!54187 m!85209))

(declare-fun m!85211 () Bool)

(assert (=> b!54187 m!85211))

(assert (=> b!54187 m!85211))

(declare-fun m!85213 () Bool)

(assert (=> b!54187 m!85213))

(declare-fun m!85215 () Bool)

(assert (=> b!54185 m!85215))

(declare-fun m!85217 () Bool)

(assert (=> b!54185 m!85217))

(declare-fun m!85219 () Bool)

(assert (=> b!54185 m!85219))

(declare-fun m!85221 () Bool)

(assert (=> start!10880 m!85221))

(declare-fun m!85223 () Bool)

(assert (=> start!10880 m!85223))

(check-sat (not start!10880) (not b!54189) (not b!54190) (not b!54187) (not b!54185) (not b!54186) (not b!54188))
(check-sat)
(get-model)

(declare-fun d!17258 () Bool)

(assert (=> d!17258 (= (array_inv!1067 (buf!1518 thiss!1379)) (bvsge (size!1164 (buf!1518 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!54190 d!17258))

(declare-fun d!17260 () Bool)

(declare-fun res!45270 () Bool)

(declare-fun e!36220 () Bool)

(assert (=> d!17260 (=> (not res!45270) (not e!36220))))

(assert (=> d!17260 (= res!45270 (= (size!1164 (buf!1518 thiss!1379)) (size!1164 (buf!1518 thiss!1379))))))

(assert (=> d!17260 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!36220)))

(declare-fun b!54215 () Bool)

(declare-fun res!45268 () Bool)

(assert (=> b!54215 (=> (not res!45268) (not e!36220))))

(assert (=> b!54215 (= res!45268 (bvsle (bitIndex!0 (size!1164 (buf!1518 thiss!1379)) (currentByte!3091 thiss!1379) (currentBit!3086 thiss!1379)) (bitIndex!0 (size!1164 (buf!1518 thiss!1379)) (currentByte!3091 thiss!1379) (currentBit!3086 thiss!1379))))))

(declare-fun b!54216 () Bool)

(declare-fun e!36221 () Bool)

(assert (=> b!54216 (= e!36220 e!36221)))

(declare-fun res!45269 () Bool)

(assert (=> b!54216 (=> res!45269 e!36221)))

(assert (=> b!54216 (= res!45269 (= (size!1164 (buf!1518 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!54217 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2550 array!2550 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!54217 (= e!36221 (arrayBitRangesEq!0 (buf!1518 thiss!1379) (buf!1518 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1164 (buf!1518 thiss!1379)) (currentByte!3091 thiss!1379) (currentBit!3086 thiss!1379))))))

(assert (= (and d!17260 res!45270) b!54215))

(assert (= (and b!54215 res!45268) b!54216))

(assert (= (and b!54216 (not res!45269)) b!54217))

(assert (=> b!54215 m!85219))

(assert (=> b!54215 m!85219))

(assert (=> b!54217 m!85219))

(assert (=> b!54217 m!85219))

(declare-fun m!85267 () Bool)

(assert (=> b!54217 m!85267))

(assert (=> b!54185 d!17260))

(declare-fun d!17262 () Bool)

(assert (=> d!17262 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!83818 () Unit!3737)

(declare-fun choose!11 (BitStream!2016) Unit!3737)

(assert (=> d!17262 (= lt!83818 (choose!11 thiss!1379))))

(assert (=> d!17262 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!83818)))

(declare-fun bs!4360 () Bool)

(assert (= bs!4360 d!17262))

(assert (=> bs!4360 m!85215))

(declare-fun m!85269 () Bool)

(assert (=> bs!4360 m!85269))

(assert (=> b!54185 d!17262))

(declare-fun d!17264 () Bool)

(declare-fun e!36224 () Bool)

(assert (=> d!17264 e!36224))

(declare-fun res!45275 () Bool)

(assert (=> d!17264 (=> (not res!45275) (not e!36224))))

(declare-fun lt!83831 () (_ BitVec 64))

(declare-fun lt!83836 () (_ BitVec 64))

(declare-fun lt!83835 () (_ BitVec 64))

(assert (=> d!17264 (= res!45275 (= lt!83835 (bvsub lt!83836 lt!83831)))))

(assert (=> d!17264 (or (= (bvand lt!83836 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!83831 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!83836 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!83836 lt!83831) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!17264 (= lt!83831 (remainingBits!0 ((_ sign_extend 32) (size!1164 (buf!1518 thiss!1379))) ((_ sign_extend 32) (currentByte!3091 thiss!1379)) ((_ sign_extend 32) (currentBit!3086 thiss!1379))))))

(declare-fun lt!83832 () (_ BitVec 64))

(declare-fun lt!83833 () (_ BitVec 64))

(assert (=> d!17264 (= lt!83836 (bvmul lt!83832 lt!83833))))

(assert (=> d!17264 (or (= lt!83832 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!83833 (bvsdiv (bvmul lt!83832 lt!83833) lt!83832)))))

(assert (=> d!17264 (= lt!83833 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!17264 (= lt!83832 ((_ sign_extend 32) (size!1164 (buf!1518 thiss!1379))))))

(assert (=> d!17264 (= lt!83835 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3091 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3086 thiss!1379))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!17264 (invariant!0 (currentBit!3086 thiss!1379) (currentByte!3091 thiss!1379) (size!1164 (buf!1518 thiss!1379)))))

(assert (=> d!17264 (= (bitIndex!0 (size!1164 (buf!1518 thiss!1379)) (currentByte!3091 thiss!1379) (currentBit!3086 thiss!1379)) lt!83835)))

(declare-fun b!54222 () Bool)

(declare-fun res!45276 () Bool)

(assert (=> b!54222 (=> (not res!45276) (not e!36224))))

(assert (=> b!54222 (= res!45276 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!83835))))

(declare-fun b!54223 () Bool)

(declare-fun lt!83834 () (_ BitVec 64))

(assert (=> b!54223 (= e!36224 (bvsle lt!83835 (bvmul lt!83834 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!54223 (or (= lt!83834 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!83834 #b0000000000000000000000000000000000000000000000000000000000001000) lt!83834)))))

(assert (=> b!54223 (= lt!83834 ((_ sign_extend 32) (size!1164 (buf!1518 thiss!1379))))))

(assert (= (and d!17264 res!45275) b!54222))

(assert (= (and b!54222 res!45276) b!54223))

(declare-fun m!85271 () Bool)

(assert (=> d!17264 m!85271))

(declare-fun m!85273 () Bool)

(assert (=> d!17264 m!85273))

(assert (=> b!54185 d!17264))

(declare-fun d!17266 () Bool)

(declare-fun res!45279 () Bool)

(declare-fun e!36225 () Bool)

(assert (=> d!17266 (=> (not res!45279) (not e!36225))))

(assert (=> d!17266 (= res!45279 (= (size!1164 (buf!1518 thiss!1379)) (size!1164 (buf!1518 (_2!2582 lt!83796)))))))

(assert (=> d!17266 (= (isPrefixOf!0 thiss!1379 (_2!2582 lt!83796)) e!36225)))

(declare-fun b!54224 () Bool)

(declare-fun res!45277 () Bool)

(assert (=> b!54224 (=> (not res!45277) (not e!36225))))

(assert (=> b!54224 (= res!45277 (bvsle (bitIndex!0 (size!1164 (buf!1518 thiss!1379)) (currentByte!3091 thiss!1379) (currentBit!3086 thiss!1379)) (bitIndex!0 (size!1164 (buf!1518 (_2!2582 lt!83796))) (currentByte!3091 (_2!2582 lt!83796)) (currentBit!3086 (_2!2582 lt!83796)))))))

(declare-fun b!54225 () Bool)

(declare-fun e!36226 () Bool)

(assert (=> b!54225 (= e!36225 e!36226)))

(declare-fun res!45278 () Bool)

(assert (=> b!54225 (=> res!45278 e!36226)))

(assert (=> b!54225 (= res!45278 (= (size!1164 (buf!1518 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!54226 () Bool)

(assert (=> b!54226 (= e!36226 (arrayBitRangesEq!0 (buf!1518 thiss!1379) (buf!1518 (_2!2582 lt!83796)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1164 (buf!1518 thiss!1379)) (currentByte!3091 thiss!1379) (currentBit!3086 thiss!1379))))))

(assert (= (and d!17266 res!45279) b!54224))

(assert (= (and b!54224 res!45277) b!54225))

(assert (= (and b!54225 (not res!45278)) b!54226))

(assert (=> b!54224 m!85219))

(declare-fun m!85275 () Bool)

(assert (=> b!54224 m!85275))

(assert (=> b!54226 m!85219))

(assert (=> b!54226 m!85219))

(declare-fun m!85277 () Bool)

(assert (=> b!54226 m!85277))

(assert (=> b!54189 d!17266))

(declare-fun d!17268 () Bool)

(assert (=> d!17268 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1164 (buf!1518 (_2!2582 lt!83796)))) ((_ sign_extend 32) (currentByte!3091 (_2!2582 lt!83796))) ((_ sign_extend 32) (currentBit!3086 (_2!2582 lt!83796))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1164 (buf!1518 (_2!2582 lt!83796)))) ((_ sign_extend 32) (currentByte!3091 (_2!2582 lt!83796))) ((_ sign_extend 32) (currentBit!3086 (_2!2582 lt!83796)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!4361 () Bool)

(assert (= bs!4361 d!17268))

(declare-fun m!85279 () Bool)

(assert (=> bs!4361 m!85279))

(assert (=> b!54189 d!17268))

(declare-fun d!17270 () Bool)

(declare-fun e!36229 () Bool)

(assert (=> d!17270 e!36229))

(declare-fun res!45282 () Bool)

(assert (=> d!17270 (=> (not res!45282) (not e!36229))))

(assert (=> d!17270 (= res!45282 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!83839 () Unit!3737)

(declare-fun choose!27 (BitStream!2016 BitStream!2016 (_ BitVec 64) (_ BitVec 64)) Unit!3737)

(assert (=> d!17270 (= lt!83839 (choose!27 thiss!1379 (_2!2582 lt!83796) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!17270 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!17270 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2582 lt!83796) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!83839)))

(declare-fun b!54229 () Bool)

(assert (=> b!54229 (= e!36229 (validate_offset_bits!1 ((_ sign_extend 32) (size!1164 (buf!1518 (_2!2582 lt!83796)))) ((_ sign_extend 32) (currentByte!3091 (_2!2582 lt!83796))) ((_ sign_extend 32) (currentBit!3086 (_2!2582 lt!83796))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!17270 res!45282) b!54229))

(declare-fun m!85281 () Bool)

(assert (=> d!17270 m!85281))

(assert (=> b!54229 m!85197))

(assert (=> b!54189 d!17270))

(declare-fun b!54310 () Bool)

(declare-fun e!36273 () Bool)

(declare-datatypes ((tuple2!4950 0))(
  ( (tuple2!4951 (_1!2586 BitStream!2016) (_2!2586 Bool)) )
))
(declare-fun lt!83960 () tuple2!4950)

(declare-fun lt!83964 () tuple2!4942)

(assert (=> b!54310 (= e!36273 (= (bitIndex!0 (size!1164 (buf!1518 (_1!2586 lt!83960))) (currentByte!3091 (_1!2586 lt!83960)) (currentBit!3086 (_1!2586 lt!83960))) (bitIndex!0 (size!1164 (buf!1518 (_2!2582 lt!83964))) (currentByte!3091 (_2!2582 lt!83964)) (currentBit!3086 (_2!2582 lt!83964)))))))

(declare-fun b!54311 () Bool)

(declare-fun res!45339 () Bool)

(declare-fun e!36274 () Bool)

(assert (=> b!54311 (=> (not res!45339) (not e!36274))))

(declare-fun lt!83959 () tuple2!4942)

(assert (=> b!54311 (= res!45339 (isPrefixOf!0 thiss!1379 (_2!2582 lt!83959)))))

(declare-fun b!54312 () Bool)

(declare-fun e!36275 () Bool)

(declare-fun lt!83966 () tuple2!4950)

(assert (=> b!54312 (= e!36275 (= (bitIndex!0 (size!1164 (buf!1518 (_1!2586 lt!83966))) (currentByte!3091 (_1!2586 lt!83966)) (currentBit!3086 (_1!2586 lt!83966))) (bitIndex!0 (size!1164 (buf!1518 (_2!2582 lt!83959))) (currentByte!3091 (_2!2582 lt!83959)) (currentBit!3086 (_2!2582 lt!83959)))))))

(declare-fun b!54313 () Bool)

(declare-fun res!45344 () Bool)

(assert (=> b!54313 (=> (not res!45344) (not e!36274))))

(declare-fun lt!83957 () (_ BitVec 64))

(declare-fun lt!83958 () (_ BitVec 64))

(assert (=> b!54313 (= res!45344 (= (bitIndex!0 (size!1164 (buf!1518 (_2!2582 lt!83959))) (currentByte!3091 (_2!2582 lt!83959)) (currentBit!3086 (_2!2582 lt!83959))) (bvadd lt!83958 lt!83957)))))

(assert (=> b!54313 (or (not (= (bvand lt!83958 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!83957 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!83958 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!83958 lt!83957) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!54313 (= lt!83957 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!54313 (= lt!83958 (bitIndex!0 (size!1164 (buf!1518 thiss!1379)) (currentByte!3091 thiss!1379) (currentBit!3086 thiss!1379)))))

(declare-fun b!54315 () Bool)

(declare-fun res!45338 () Bool)

(declare-fun e!36276 () Bool)

(assert (=> b!54315 (=> (not res!45338) (not e!36276))))

(assert (=> b!54315 (= res!45338 (= (bitIndex!0 (size!1164 (buf!1518 (_2!2582 lt!83964))) (currentByte!3091 (_2!2582 lt!83964)) (currentBit!3086 (_2!2582 lt!83964))) (bvadd (bitIndex!0 (size!1164 (buf!1518 thiss!1379)) (currentByte!3091 thiss!1379) (currentBit!3086 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!54316 () Bool)

(assert (=> b!54316 (= e!36274 e!36275)))

(declare-fun res!45345 () Bool)

(assert (=> b!54316 (=> (not res!45345) (not e!36275))))

(declare-fun lt!83961 () (_ BitVec 8))

(assert (=> b!54316 (= res!45345 (and (= (_2!2586 lt!83966) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1701 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!83961)) #b00000000000000000000000000000000))) (= (_1!2586 lt!83966) (_2!2582 lt!83959))))))

(declare-datatypes ((tuple2!4952 0))(
  ( (tuple2!4953 (_1!2587 array!2550) (_2!2587 BitStream!2016)) )
))
(declare-fun lt!83967 () tuple2!4952)

(declare-fun lt!83968 () BitStream!2016)

(declare-fun readBits!0 (BitStream!2016 (_ BitVec 64)) tuple2!4952)

(assert (=> b!54316 (= lt!83967 (readBits!0 lt!83968 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!2016) tuple2!4950)

(assert (=> b!54316 (= lt!83966 (readBitPure!0 lt!83968))))

(declare-fun readerFrom!0 (BitStream!2016 (_ BitVec 32) (_ BitVec 32)) BitStream!2016)

(assert (=> b!54316 (= lt!83968 (readerFrom!0 (_2!2582 lt!83959) (currentBit!3086 thiss!1379) (currentByte!3091 thiss!1379)))))

(declare-fun b!54317 () Bool)

(assert (=> b!54317 (= e!36276 e!36273)))

(declare-fun res!45343 () Bool)

(assert (=> b!54317 (=> (not res!45343) (not e!36273))))

(declare-fun lt!83963 () Bool)

(assert (=> b!54317 (= res!45343 (and (= (_2!2586 lt!83960) lt!83963) (= (_1!2586 lt!83960) (_2!2582 lt!83964))))))

(assert (=> b!54317 (= lt!83960 (readBitPure!0 (readerFrom!0 (_2!2582 lt!83964) (currentBit!3086 thiss!1379) (currentByte!3091 thiss!1379))))))

(declare-fun d!17272 () Bool)

(assert (=> d!17272 e!36274))

(declare-fun res!45342 () Bool)

(assert (=> d!17272 (=> (not res!45342) (not e!36274))))

(assert (=> d!17272 (= res!45342 (= (size!1164 (buf!1518 (_2!2582 lt!83959))) (size!1164 (buf!1518 thiss!1379))))))

(declare-fun lt!83962 () array!2550)

(assert (=> d!17272 (= lt!83961 (select (arr!1701 lt!83962) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!17272 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1164 lt!83962)))))

(assert (=> d!17272 (= lt!83962 (array!2551 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!83965 () tuple2!4942)

(assert (=> d!17272 (= lt!83959 (tuple2!4943 (_1!2582 lt!83965) (_2!2582 lt!83965)))))

(assert (=> d!17272 (= lt!83965 lt!83964)))

(assert (=> d!17272 e!36276))

(declare-fun res!45341 () Bool)

(assert (=> d!17272 (=> (not res!45341) (not e!36276))))

(assert (=> d!17272 (= res!45341 (= (size!1164 (buf!1518 thiss!1379)) (size!1164 (buf!1518 (_2!2582 lt!83964)))))))

(declare-fun appendBit!0 (BitStream!2016 Bool) tuple2!4942)

(assert (=> d!17272 (= lt!83964 (appendBit!0 thiss!1379 lt!83963))))

(assert (=> d!17272 (= lt!83963 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1701 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!17272 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!17272 (= (appendBitFromByte!0 thiss!1379 (select (arr!1701 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!83959)))

(declare-fun b!54314 () Bool)

(declare-fun res!45340 () Bool)

(assert (=> b!54314 (=> (not res!45340) (not e!36276))))

(assert (=> b!54314 (= res!45340 (isPrefixOf!0 thiss!1379 (_2!2582 lt!83964)))))

(assert (= (and d!17272 res!45341) b!54315))

(assert (= (and b!54315 res!45338) b!54314))

(assert (= (and b!54314 res!45340) b!54317))

(assert (= (and b!54317 res!45343) b!54310))

(assert (= (and d!17272 res!45342) b!54313))

(assert (= (and b!54313 res!45344) b!54311))

(assert (= (and b!54311 res!45339) b!54316))

(assert (= (and b!54316 res!45345) b!54312))

(declare-fun m!85347 () Bool)

(assert (=> b!54310 m!85347))

(declare-fun m!85349 () Bool)

(assert (=> b!54310 m!85349))

(declare-fun m!85351 () Bool)

(assert (=> b!54316 m!85351))

(declare-fun m!85353 () Bool)

(assert (=> b!54316 m!85353))

(declare-fun m!85355 () Bool)

(assert (=> b!54316 m!85355))

(declare-fun m!85357 () Bool)

(assert (=> b!54311 m!85357))

(declare-fun m!85359 () Bool)

(assert (=> b!54314 m!85359))

(declare-fun m!85361 () Bool)

(assert (=> b!54313 m!85361))

(assert (=> b!54313 m!85219))

(declare-fun m!85363 () Bool)

(assert (=> d!17272 m!85363))

(declare-fun m!85365 () Bool)

(assert (=> d!17272 m!85365))

(declare-fun m!85367 () Bool)

(assert (=> d!17272 m!85367))

(declare-fun m!85369 () Bool)

(assert (=> b!54317 m!85369))

(assert (=> b!54317 m!85369))

(declare-fun m!85371 () Bool)

(assert (=> b!54317 m!85371))

(assert (=> b!54315 m!85349))

(assert (=> b!54315 m!85219))

(declare-fun m!85373 () Bool)

(assert (=> b!54312 m!85373))

(assert (=> b!54312 m!85361))

(assert (=> b!54189 d!17272))

(declare-fun d!17312 () Bool)

(assert (=> d!17312 (= (array_inv!1067 srcBuffer!2) (bvsge (size!1164 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!10880 d!17312))

(declare-fun d!17314 () Bool)

(assert (=> d!17314 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3086 thiss!1379) (currentByte!3091 thiss!1379) (size!1164 (buf!1518 thiss!1379))))))

(declare-fun bs!4368 () Bool)

(assert (= bs!4368 d!17314))

(assert (=> bs!4368 m!85273))

(assert (=> start!10880 d!17314))

(declare-fun d!17316 () Bool)

(assert (=> d!17316 (= (head!402 (byteArrayBitContentToList!0 (_2!2582 lt!83796) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!698 (byteArrayBitContentToList!0 (_2!2582 lt!83796) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!54187 d!17316))

(declare-fun d!17318 () Bool)

(declare-fun c!3837 () Bool)

(assert (=> d!17318 (= c!3837 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!36279 () List!583)

(assert (=> d!17318 (= (byteArrayBitContentToList!0 (_2!2582 lt!83796) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!36279)))

(declare-fun b!54322 () Bool)

(assert (=> b!54322 (= e!36279 Nil!580)))

(declare-fun b!54323 () Bool)

(assert (=> b!54323 (= e!36279 (Cons!579 (not (= (bvand ((_ sign_extend 24) (select (arr!1701 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2582 lt!83796) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!17318 c!3837) b!54322))

(assert (= (and d!17318 (not c!3837)) b!54323))

(assert (=> b!54323 m!85199))

(assert (=> b!54323 m!85367))

(declare-fun m!85375 () Bool)

(assert (=> b!54323 m!85375))

(assert (=> b!54187 d!17318))

(declare-fun d!17320 () Bool)

(assert (=> d!17320 (= (head!402 (bitStreamReadBitsIntoList!0 (_2!2582 lt!83796) (_1!2583 lt!83792) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!698 (bitStreamReadBitsIntoList!0 (_2!2582 lt!83796) (_1!2583 lt!83792) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!54187 d!17320))

(declare-fun d!17322 () Bool)

(declare-fun e!36284 () Bool)

(assert (=> d!17322 e!36284))

(declare-fun c!3843 () Bool)

(assert (=> d!17322 (= c!3843 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!83977 () List!583)

(declare-datatypes ((tuple2!4954 0))(
  ( (tuple2!4955 (_1!2588 List!583) (_2!2588 BitStream!2016)) )
))
(declare-fun e!36285 () tuple2!4954)

(assert (=> d!17322 (= lt!83977 (_1!2588 e!36285))))

(declare-fun c!3842 () Bool)

(assert (=> d!17322 (= c!3842 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!17322 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!17322 (= (bitStreamReadBitsIntoList!0 (_2!2582 lt!83796) (_1!2583 lt!83792) #b0000000000000000000000000000000000000000000000000000000000000001) lt!83977)))

(declare-fun b!54332 () Bool)

(assert (=> b!54332 (= e!36285 (tuple2!4955 Nil!580 (_1!2583 lt!83792)))))

(declare-datatypes ((tuple2!4956 0))(
  ( (tuple2!4957 (_1!2589 Bool) (_2!2589 BitStream!2016)) )
))
(declare-fun lt!83976 () tuple2!4956)

(declare-fun b!54333 () Bool)

(declare-fun lt!83975 () (_ BitVec 64))

(assert (=> b!54333 (= e!36285 (tuple2!4955 (Cons!579 (_1!2589 lt!83976) (bitStreamReadBitsIntoList!0 (_2!2582 lt!83796) (_2!2589 lt!83976) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!83975))) (_2!2589 lt!83976)))))

(declare-fun readBit!0 (BitStream!2016) tuple2!4956)

(assert (=> b!54333 (= lt!83976 (readBit!0 (_1!2583 lt!83792)))))

(assert (=> b!54333 (= lt!83975 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!54335 () Bool)

(declare-fun length!268 (List!583) Int)

(assert (=> b!54335 (= e!36284 (> (length!268 lt!83977) 0))))

(declare-fun b!54334 () Bool)

(declare-fun isEmpty!154 (List!583) Bool)

(assert (=> b!54334 (= e!36284 (isEmpty!154 lt!83977))))

(assert (= (and d!17322 c!3842) b!54332))

(assert (= (and d!17322 (not c!3842)) b!54333))

(assert (= (and d!17322 c!3843) b!54334))

(assert (= (and d!17322 (not c!3843)) b!54335))

(declare-fun m!85377 () Bool)

(assert (=> b!54333 m!85377))

(declare-fun m!85379 () Bool)

(assert (=> b!54333 m!85379))

(declare-fun m!85381 () Bool)

(assert (=> b!54335 m!85381))

(declare-fun m!85383 () Bool)

(assert (=> b!54334 m!85383))

(assert (=> b!54187 d!17322))

(declare-fun d!17324 () Bool)

(assert (=> d!17324 (validate_offset_bits!1 ((_ sign_extend 32) (size!1164 (buf!1518 (_2!2582 lt!83796)))) ((_ sign_extend 32) (currentByte!3091 thiss!1379)) ((_ sign_extend 32) (currentBit!3086 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!83980 () Unit!3737)

(declare-fun choose!9 (BitStream!2016 array!2550 (_ BitVec 64) BitStream!2016) Unit!3737)

(assert (=> d!17324 (= lt!83980 (choose!9 thiss!1379 (buf!1518 (_2!2582 lt!83796)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2017 (buf!1518 (_2!2582 lt!83796)) (currentByte!3091 thiss!1379) (currentBit!3086 thiss!1379))))))

(assert (=> d!17324 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1518 (_2!2582 lt!83796)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!83980)))

(declare-fun bs!4369 () Bool)

(assert (= bs!4369 d!17324))

(assert (=> bs!4369 m!85185))

(declare-fun m!85385 () Bool)

(assert (=> bs!4369 m!85385))

(assert (=> b!54188 d!17324))

(declare-fun b!54425 () Bool)

(declare-fun res!45419 () Bool)

(declare-fun e!36326 () Bool)

(assert (=> b!54425 (=> (not res!45419) (not e!36326))))

(declare-fun lt!84314 () tuple2!4942)

(assert (=> b!54425 (= res!45419 (= (size!1164 (buf!1518 (_2!2582 lt!84314))) (size!1164 (buf!1518 (_2!2582 lt!83796)))))))

(declare-fun b!54426 () Bool)

(declare-fun res!45422 () Bool)

(assert (=> b!54426 (=> (not res!45422) (not e!36326))))

(assert (=> b!54426 (= res!45422 (isPrefixOf!0 (_2!2582 lt!83796) (_2!2582 lt!84314)))))

(declare-fun b!54427 () Bool)

(declare-fun lt!84320 () tuple2!4944)

(assert (=> b!54427 (= e!36326 (= (bitStreamReadBitsIntoList!0 (_2!2582 lt!84314) (_1!2583 lt!84320) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2582 lt!84314) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!54427 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!54427 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!84331 () Unit!3737)

(declare-fun lt!84343 () Unit!3737)

(assert (=> b!54427 (= lt!84331 lt!84343)))

(declare-fun lt!84311 () (_ BitVec 64))

(assert (=> b!54427 (validate_offset_bits!1 ((_ sign_extend 32) (size!1164 (buf!1518 (_2!2582 lt!84314)))) ((_ sign_extend 32) (currentByte!3091 (_2!2582 lt!83796))) ((_ sign_extend 32) (currentBit!3086 (_2!2582 lt!83796))) lt!84311)))

(assert (=> b!54427 (= lt!84343 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2582 lt!83796) (buf!1518 (_2!2582 lt!84314)) lt!84311))))

(declare-fun e!36327 () Bool)

(assert (=> b!54427 e!36327))

(declare-fun res!45421 () Bool)

(assert (=> b!54427 (=> (not res!45421) (not e!36327))))

(assert (=> b!54427 (= res!45421 (and (= (size!1164 (buf!1518 (_2!2582 lt!83796))) (size!1164 (buf!1518 (_2!2582 lt!84314)))) (bvsge lt!84311 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!54427 (= lt!84311 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!54427 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!54427 (= lt!84320 (reader!0 (_2!2582 lt!83796) (_2!2582 lt!84314)))))

(declare-fun lt!84303 () tuple2!4942)

(declare-fun c!3852 () Bool)

(declare-fun lt!84326 () tuple2!4942)

(declare-fun bm!685 () Bool)

(declare-fun call!688 () tuple2!4944)

(assert (=> bm!685 (= call!688 (reader!0 (ite c!3852 (_2!2582 lt!84326) (_2!2582 lt!83796)) (ite c!3852 (_2!2582 lt!84303) (_2!2582 lt!83796))))))

(declare-fun d!17326 () Bool)

(assert (=> d!17326 e!36326))

(declare-fun res!45418 () Bool)

(assert (=> d!17326 (=> (not res!45418) (not e!36326))))

(declare-fun lt!84339 () (_ BitVec 64))

(assert (=> d!17326 (= res!45418 (= (bitIndex!0 (size!1164 (buf!1518 (_2!2582 lt!84314))) (currentByte!3091 (_2!2582 lt!84314)) (currentBit!3086 (_2!2582 lt!84314))) (bvsub lt!84339 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!17326 (or (= (bvand lt!84339 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!84339 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!84339 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!84306 () (_ BitVec 64))

(assert (=> d!17326 (= lt!84339 (bvadd lt!84306 to!314))))

(assert (=> d!17326 (or (not (= (bvand lt!84306 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!84306 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!84306 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!17326 (= lt!84306 (bitIndex!0 (size!1164 (buf!1518 (_2!2582 lt!83796))) (currentByte!3091 (_2!2582 lt!83796)) (currentBit!3086 (_2!2582 lt!83796))))))

(declare-fun e!36328 () tuple2!4942)

(assert (=> d!17326 (= lt!84314 e!36328)))

(assert (=> d!17326 (= c!3852 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!84340 () Unit!3737)

(declare-fun lt!84321 () Unit!3737)

(assert (=> d!17326 (= lt!84340 lt!84321)))

(assert (=> d!17326 (isPrefixOf!0 (_2!2582 lt!83796) (_2!2582 lt!83796))))

(assert (=> d!17326 (= lt!84321 (lemmaIsPrefixRefl!0 (_2!2582 lt!83796)))))

(declare-fun lt!84308 () (_ BitVec 64))

(assert (=> d!17326 (= lt!84308 (bitIndex!0 (size!1164 (buf!1518 (_2!2582 lt!83796))) (currentByte!3091 (_2!2582 lt!83796)) (currentBit!3086 (_2!2582 lt!83796))))))

(assert (=> d!17326 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!17326 (= (appendBitsMSBFirstLoop!0 (_2!2582 lt!83796) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!84314)))

(declare-fun b!54428 () Bool)

(declare-fun res!45420 () Bool)

(assert (=> b!54428 (=> (not res!45420) (not e!36326))))

(assert (=> b!54428 (= res!45420 (invariant!0 (currentBit!3086 (_2!2582 lt!84314)) (currentByte!3091 (_2!2582 lt!84314)) (size!1164 (buf!1518 (_2!2582 lt!84314)))))))

(declare-fun b!54429 () Bool)

(declare-fun res!45423 () Bool)

(assert (=> b!54429 (=> (not res!45423) (not e!36326))))

(assert (=> b!54429 (= res!45423 (= (size!1164 (buf!1518 (_2!2582 lt!83796))) (size!1164 (buf!1518 (_2!2582 lt!84314)))))))

(declare-fun b!54430 () Bool)

(declare-fun Unit!3741 () Unit!3737)

(assert (=> b!54430 (= e!36328 (tuple2!4943 Unit!3741 (_2!2582 lt!83796)))))

(assert (=> b!54430 (= (size!1164 (buf!1518 (_2!2582 lt!83796))) (size!1164 (buf!1518 (_2!2582 lt!83796))))))

(declare-fun lt!84324 () Unit!3737)

(declare-fun Unit!3742 () Unit!3737)

(assert (=> b!54430 (= lt!84324 Unit!3742)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2016 array!2550 array!2550 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!54430 (checkByteArrayBitContent!0 (_2!2582 lt!83796) srcBuffer!2 (_1!2587 (readBits!0 (_1!2583 call!688) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!54431 () Bool)

(declare-fun Unit!3743 () Unit!3737)

(assert (=> b!54431 (= e!36328 (tuple2!4943 Unit!3743 (_2!2582 lt!84303)))))

(assert (=> b!54431 (= lt!84326 (appendBitFromByte!0 (_2!2582 lt!83796) (select (arr!1701 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!84338 () (_ BitVec 64))

(assert (=> b!54431 (= lt!84338 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!84329 () (_ BitVec 64))

(assert (=> b!54431 (= lt!84329 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!84319 () Unit!3737)

(assert (=> b!54431 (= lt!84319 (validateOffsetBitsIneqLemma!0 (_2!2582 lt!83796) (_2!2582 lt!84326) lt!84338 lt!84329))))

(assert (=> b!54431 (validate_offset_bits!1 ((_ sign_extend 32) (size!1164 (buf!1518 (_2!2582 lt!84326)))) ((_ sign_extend 32) (currentByte!3091 (_2!2582 lt!84326))) ((_ sign_extend 32) (currentBit!3086 (_2!2582 lt!84326))) (bvsub lt!84338 lt!84329))))

(declare-fun lt!84344 () Unit!3737)

(assert (=> b!54431 (= lt!84344 lt!84319)))

(declare-fun lt!84327 () tuple2!4944)

(assert (=> b!54431 (= lt!84327 (reader!0 (_2!2582 lt!83796) (_2!2582 lt!84326)))))

(declare-fun lt!84332 () (_ BitVec 64))

(assert (=> b!54431 (= lt!84332 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!84310 () Unit!3737)

(assert (=> b!54431 (= lt!84310 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2582 lt!83796) (buf!1518 (_2!2582 lt!84326)) lt!84332))))

(assert (=> b!54431 (validate_offset_bits!1 ((_ sign_extend 32) (size!1164 (buf!1518 (_2!2582 lt!84326)))) ((_ sign_extend 32) (currentByte!3091 (_2!2582 lt!83796))) ((_ sign_extend 32) (currentBit!3086 (_2!2582 lt!83796))) lt!84332)))

(declare-fun lt!84328 () Unit!3737)

(assert (=> b!54431 (= lt!84328 lt!84310)))

(assert (=> b!54431 (= (head!402 (byteArrayBitContentToList!0 (_2!2582 lt!84326) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!402 (bitStreamReadBitsIntoList!0 (_2!2582 lt!84326) (_1!2583 lt!84327) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!84305 () Unit!3737)

(declare-fun Unit!3744 () Unit!3737)

(assert (=> b!54431 (= lt!84305 Unit!3744)))

(assert (=> b!54431 (= lt!84303 (appendBitsMSBFirstLoop!0 (_2!2582 lt!84326) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!84330 () Unit!3737)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2016 BitStream!2016 BitStream!2016) Unit!3737)

(assert (=> b!54431 (= lt!84330 (lemmaIsPrefixTransitive!0 (_2!2582 lt!83796) (_2!2582 lt!84326) (_2!2582 lt!84303)))))

(assert (=> b!54431 (isPrefixOf!0 (_2!2582 lt!83796) (_2!2582 lt!84303))))

(declare-fun lt!84341 () Unit!3737)

(assert (=> b!54431 (= lt!84341 lt!84330)))

(assert (=> b!54431 (= (size!1164 (buf!1518 (_2!2582 lt!84303))) (size!1164 (buf!1518 (_2!2582 lt!83796))))))

(declare-fun lt!84342 () Unit!3737)

(declare-fun Unit!3745 () Unit!3737)

(assert (=> b!54431 (= lt!84342 Unit!3745)))

(assert (=> b!54431 (= (bitIndex!0 (size!1164 (buf!1518 (_2!2582 lt!84303))) (currentByte!3091 (_2!2582 lt!84303)) (currentBit!3086 (_2!2582 lt!84303))) (bvsub (bvadd (bitIndex!0 (size!1164 (buf!1518 (_2!2582 lt!83796))) (currentByte!3091 (_2!2582 lt!83796)) (currentBit!3086 (_2!2582 lt!83796))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!84317 () Unit!3737)

(declare-fun Unit!3747 () Unit!3737)

(assert (=> b!54431 (= lt!84317 Unit!3747)))

(assert (=> b!54431 (= (bitIndex!0 (size!1164 (buf!1518 (_2!2582 lt!84303))) (currentByte!3091 (_2!2582 lt!84303)) (currentBit!3086 (_2!2582 lt!84303))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1164 (buf!1518 (_2!2582 lt!84326))) (currentByte!3091 (_2!2582 lt!84326)) (currentBit!3086 (_2!2582 lt!84326))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!84309 () Unit!3737)

(declare-fun Unit!3748 () Unit!3737)

(assert (=> b!54431 (= lt!84309 Unit!3748)))

(declare-fun lt!84316 () tuple2!4944)

(assert (=> b!54431 (= lt!84316 (reader!0 (_2!2582 lt!83796) (_2!2582 lt!84303)))))

(declare-fun lt!84345 () (_ BitVec 64))

(assert (=> b!54431 (= lt!84345 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!84333 () Unit!3737)

(assert (=> b!54431 (= lt!84333 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2582 lt!83796) (buf!1518 (_2!2582 lt!84303)) lt!84345))))

(assert (=> b!54431 (validate_offset_bits!1 ((_ sign_extend 32) (size!1164 (buf!1518 (_2!2582 lt!84303)))) ((_ sign_extend 32) (currentByte!3091 (_2!2582 lt!83796))) ((_ sign_extend 32) (currentBit!3086 (_2!2582 lt!83796))) lt!84345)))

(declare-fun lt!84315 () Unit!3737)

(assert (=> b!54431 (= lt!84315 lt!84333)))

(declare-fun lt!84307 () tuple2!4944)

(assert (=> b!54431 (= lt!84307 call!688)))

(declare-fun lt!84313 () (_ BitVec 64))

(assert (=> b!54431 (= lt!84313 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!84334 () Unit!3737)

(assert (=> b!54431 (= lt!84334 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2582 lt!84326) (buf!1518 (_2!2582 lt!84303)) lt!84313))))

(assert (=> b!54431 (validate_offset_bits!1 ((_ sign_extend 32) (size!1164 (buf!1518 (_2!2582 lt!84303)))) ((_ sign_extend 32) (currentByte!3091 (_2!2582 lt!84326))) ((_ sign_extend 32) (currentBit!3086 (_2!2582 lt!84326))) lt!84313)))

(declare-fun lt!84304 () Unit!3737)

(assert (=> b!54431 (= lt!84304 lt!84334)))

(declare-fun lt!84312 () List!583)

(assert (=> b!54431 (= lt!84312 (byteArrayBitContentToList!0 (_2!2582 lt!84303) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!84322 () List!583)

(assert (=> b!54431 (= lt!84322 (byteArrayBitContentToList!0 (_2!2582 lt!84303) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!84346 () List!583)

(assert (=> b!54431 (= lt!84346 (bitStreamReadBitsIntoList!0 (_2!2582 lt!84303) (_1!2583 lt!84316) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!84323 () List!583)

(assert (=> b!54431 (= lt!84323 (bitStreamReadBitsIntoList!0 (_2!2582 lt!84303) (_1!2583 lt!84307) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!84337 () (_ BitVec 64))

(assert (=> b!54431 (= lt!84337 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!84336 () Unit!3737)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2016 BitStream!2016 BitStream!2016 BitStream!2016 (_ BitVec 64) List!583) Unit!3737)

(assert (=> b!54431 (= lt!84336 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2582 lt!84303) (_2!2582 lt!84303) (_1!2583 lt!84316) (_1!2583 lt!84307) lt!84337 lt!84346))))

(declare-fun tail!256 (List!583) List!583)

(assert (=> b!54431 (= (bitStreamReadBitsIntoList!0 (_2!2582 lt!84303) (_1!2583 lt!84307) (bvsub lt!84337 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!256 lt!84346))))

(declare-fun lt!84325 () Unit!3737)

(assert (=> b!54431 (= lt!84325 lt!84336)))

(declare-fun lt!84335 () Unit!3737)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2550 array!2550 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3737)

(assert (=> b!54431 (= lt!84335 (arrayBitRangesEqImpliesEq!0 (buf!1518 (_2!2582 lt!84326)) (buf!1518 (_2!2582 lt!84303)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!84308 (bitIndex!0 (size!1164 (buf!1518 (_2!2582 lt!84326))) (currentByte!3091 (_2!2582 lt!84326)) (currentBit!3086 (_2!2582 lt!84326)))))))

(declare-fun bitAt!0 (array!2550 (_ BitVec 64)) Bool)

(assert (=> b!54431 (= (bitAt!0 (buf!1518 (_2!2582 lt!84326)) lt!84308) (bitAt!0 (buf!1518 (_2!2582 lt!84303)) lt!84308))))

(declare-fun lt!84318 () Unit!3737)

(assert (=> b!54431 (= lt!84318 lt!84335)))

(declare-fun b!54432 () Bool)

(assert (=> b!54432 (= e!36327 (validate_offset_bits!1 ((_ sign_extend 32) (size!1164 (buf!1518 (_2!2582 lt!83796)))) ((_ sign_extend 32) (currentByte!3091 (_2!2582 lt!83796))) ((_ sign_extend 32) (currentBit!3086 (_2!2582 lt!83796))) lt!84311))))

(assert (= (and d!17326 c!3852) b!54431))

(assert (= (and d!17326 (not c!3852)) b!54430))

(assert (= (or b!54431 b!54430) bm!685))

(assert (= (and d!17326 res!45418) b!54428))

(assert (= (and b!54428 res!45420) b!54429))

(assert (= (and b!54429 res!45423) b!54426))

(assert (= (and b!54426 res!45422) b!54425))

(assert (= (and b!54425 res!45419) b!54427))

(assert (= (and b!54427 res!45421) b!54432))

(declare-fun m!85539 () Bool)

(assert (=> bm!685 m!85539))

(declare-fun m!85541 () Bool)

(assert (=> b!54430 m!85541))

(declare-fun m!85543 () Bool)

(assert (=> b!54430 m!85543))

(declare-fun m!85545 () Bool)

(assert (=> b!54431 m!85545))

(declare-fun m!85547 () Bool)

(assert (=> b!54431 m!85547))

(declare-fun m!85549 () Bool)

(assert (=> b!54431 m!85549))

(declare-fun m!85551 () Bool)

(assert (=> b!54431 m!85551))

(declare-fun m!85553 () Bool)

(assert (=> b!54431 m!85553))

(declare-fun m!85555 () Bool)

(assert (=> b!54431 m!85555))

(declare-fun m!85557 () Bool)

(assert (=> b!54431 m!85557))

(declare-fun m!85559 () Bool)

(assert (=> b!54431 m!85559))

(assert (=> b!54431 m!85555))

(declare-fun m!85561 () Bool)

(assert (=> b!54431 m!85561))

(declare-fun m!85563 () Bool)

(assert (=> b!54431 m!85563))

(assert (=> b!54431 m!85275))

(declare-fun m!85565 () Bool)

(assert (=> b!54431 m!85565))

(declare-fun m!85567 () Bool)

(assert (=> b!54431 m!85567))

(declare-fun m!85569 () Bool)

(assert (=> b!54431 m!85569))

(declare-fun m!85571 () Bool)

(assert (=> b!54431 m!85571))

(declare-fun m!85573 () Bool)

(assert (=> b!54431 m!85573))

(declare-fun m!85575 () Bool)

(assert (=> b!54431 m!85575))

(declare-fun m!85577 () Bool)

(assert (=> b!54431 m!85577))

(declare-fun m!85579 () Bool)

(assert (=> b!54431 m!85579))

(declare-fun m!85581 () Bool)

(assert (=> b!54431 m!85581))

(declare-fun m!85583 () Bool)

(assert (=> b!54431 m!85583))

(declare-fun m!85585 () Bool)

(assert (=> b!54431 m!85585))

(declare-fun m!85587 () Bool)

(assert (=> b!54431 m!85587))

(declare-fun m!85589 () Bool)

(assert (=> b!54431 m!85589))

(declare-fun m!85591 () Bool)

(assert (=> b!54431 m!85591))

(assert (=> b!54431 m!85571))

(declare-fun m!85593 () Bool)

(assert (=> b!54431 m!85593))

(assert (=> b!54431 m!85547))

(declare-fun m!85595 () Bool)

(assert (=> b!54431 m!85595))

(declare-fun m!85597 () Bool)

(assert (=> b!54431 m!85597))

(declare-fun m!85599 () Bool)

(assert (=> b!54431 m!85599))

(declare-fun m!85601 () Bool)

(assert (=> b!54431 m!85601))

(declare-fun m!85603 () Bool)

(assert (=> b!54431 m!85603))

(declare-fun m!85605 () Bool)

(assert (=> b!54431 m!85605))

(assert (=> b!54431 m!85551))

(declare-fun m!85607 () Bool)

(assert (=> b!54427 m!85607))

(declare-fun m!85609 () Bool)

(assert (=> b!54427 m!85609))

(declare-fun m!85611 () Bool)

(assert (=> b!54427 m!85611))

(declare-fun m!85613 () Bool)

(assert (=> b!54427 m!85613))

(declare-fun m!85615 () Bool)

(assert (=> b!54427 m!85615))

(declare-fun m!85617 () Bool)

(assert (=> d!17326 m!85617))

(assert (=> d!17326 m!85275))

(declare-fun m!85619 () Bool)

(assert (=> d!17326 m!85619))

(declare-fun m!85621 () Bool)

(assert (=> d!17326 m!85621))

(declare-fun m!85623 () Bool)

(assert (=> b!54426 m!85623))

(declare-fun m!85625 () Bool)

(assert (=> b!54432 m!85625))

(declare-fun m!85627 () Bool)

(assert (=> b!54428 m!85627))

(assert (=> b!54188 d!17326))

(declare-fun d!17346 () Bool)

(declare-fun e!36334 () Bool)

(assert (=> d!17346 e!36334))

(declare-fun res!45431 () Bool)

(assert (=> d!17346 (=> (not res!45431) (not e!36334))))

(declare-fun lt!84390 () tuple2!4944)

(assert (=> d!17346 (= res!45431 (isPrefixOf!0 (_1!2583 lt!84390) (_2!2583 lt!84390)))))

(declare-fun lt!84406 () BitStream!2016)

(assert (=> d!17346 (= lt!84390 (tuple2!4945 lt!84406 (_2!2582 lt!83796)))))

(declare-fun lt!84389 () Unit!3737)

(declare-fun lt!84394 () Unit!3737)

(assert (=> d!17346 (= lt!84389 lt!84394)))

(assert (=> d!17346 (isPrefixOf!0 lt!84406 (_2!2582 lt!83796))))

(assert (=> d!17346 (= lt!84394 (lemmaIsPrefixTransitive!0 lt!84406 (_2!2582 lt!83796) (_2!2582 lt!83796)))))

(declare-fun lt!84391 () Unit!3737)

(declare-fun lt!84387 () Unit!3737)

(assert (=> d!17346 (= lt!84391 lt!84387)))

(assert (=> d!17346 (isPrefixOf!0 lt!84406 (_2!2582 lt!83796))))

(assert (=> d!17346 (= lt!84387 (lemmaIsPrefixTransitive!0 lt!84406 thiss!1379 (_2!2582 lt!83796)))))

(declare-fun lt!84405 () Unit!3737)

(declare-fun e!36333 () Unit!3737)

(assert (=> d!17346 (= lt!84405 e!36333)))

(declare-fun c!3855 () Bool)

(assert (=> d!17346 (= c!3855 (not (= (size!1164 (buf!1518 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!84397 () Unit!3737)

(declare-fun lt!84396 () Unit!3737)

(assert (=> d!17346 (= lt!84397 lt!84396)))

(assert (=> d!17346 (isPrefixOf!0 (_2!2582 lt!83796) (_2!2582 lt!83796))))

(assert (=> d!17346 (= lt!84396 (lemmaIsPrefixRefl!0 (_2!2582 lt!83796)))))

(declare-fun lt!84401 () Unit!3737)

(declare-fun lt!84398 () Unit!3737)

(assert (=> d!17346 (= lt!84401 lt!84398)))

(assert (=> d!17346 (= lt!84398 (lemmaIsPrefixRefl!0 (_2!2582 lt!83796)))))

(declare-fun lt!84395 () Unit!3737)

(declare-fun lt!84393 () Unit!3737)

(assert (=> d!17346 (= lt!84395 lt!84393)))

(assert (=> d!17346 (isPrefixOf!0 lt!84406 lt!84406)))

(assert (=> d!17346 (= lt!84393 (lemmaIsPrefixRefl!0 lt!84406))))

(declare-fun lt!84404 () Unit!3737)

(declare-fun lt!84402 () Unit!3737)

(assert (=> d!17346 (= lt!84404 lt!84402)))

(assert (=> d!17346 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!17346 (= lt!84402 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!17346 (= lt!84406 (BitStream!2017 (buf!1518 (_2!2582 lt!83796)) (currentByte!3091 thiss!1379) (currentBit!3086 thiss!1379)))))

(assert (=> d!17346 (isPrefixOf!0 thiss!1379 (_2!2582 lt!83796))))

(assert (=> d!17346 (= (reader!0 thiss!1379 (_2!2582 lt!83796)) lt!84390)))

(declare-fun b!54443 () Bool)

(declare-fun Unit!3750 () Unit!3737)

(assert (=> b!54443 (= e!36333 Unit!3750)))

(declare-fun b!54444 () Bool)

(declare-fun res!45430 () Bool)

(assert (=> b!54444 (=> (not res!45430) (not e!36334))))

(assert (=> b!54444 (= res!45430 (isPrefixOf!0 (_2!2583 lt!84390) (_2!2582 lt!83796)))))

(declare-fun b!54445 () Bool)

(declare-fun lt!84392 () (_ BitVec 64))

(declare-fun lt!84403 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2016 (_ BitVec 64)) BitStream!2016)

(assert (=> b!54445 (= e!36334 (= (_1!2583 lt!84390) (withMovedBitIndex!0 (_2!2583 lt!84390) (bvsub lt!84403 lt!84392))))))

(assert (=> b!54445 (or (= (bvand lt!84403 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!84392 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!84403 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!84403 lt!84392) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!54445 (= lt!84392 (bitIndex!0 (size!1164 (buf!1518 (_2!2582 lt!83796))) (currentByte!3091 (_2!2582 lt!83796)) (currentBit!3086 (_2!2582 lt!83796))))))

(assert (=> b!54445 (= lt!84403 (bitIndex!0 (size!1164 (buf!1518 thiss!1379)) (currentByte!3091 thiss!1379) (currentBit!3086 thiss!1379)))))

(declare-fun b!54446 () Bool)

(declare-fun res!45432 () Bool)

(assert (=> b!54446 (=> (not res!45432) (not e!36334))))

(assert (=> b!54446 (= res!45432 (isPrefixOf!0 (_1!2583 lt!84390) thiss!1379))))

(declare-fun b!54447 () Bool)

(declare-fun lt!84388 () Unit!3737)

(assert (=> b!54447 (= e!36333 lt!84388)))

(declare-fun lt!84399 () (_ BitVec 64))

(assert (=> b!54447 (= lt!84399 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!84400 () (_ BitVec 64))

(assert (=> b!54447 (= lt!84400 (bitIndex!0 (size!1164 (buf!1518 thiss!1379)) (currentByte!3091 thiss!1379) (currentBit!3086 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2550 array!2550 (_ BitVec 64) (_ BitVec 64)) Unit!3737)

(assert (=> b!54447 (= lt!84388 (arrayBitRangesEqSymmetric!0 (buf!1518 thiss!1379) (buf!1518 (_2!2582 lt!83796)) lt!84399 lt!84400))))

(assert (=> b!54447 (arrayBitRangesEq!0 (buf!1518 (_2!2582 lt!83796)) (buf!1518 thiss!1379) lt!84399 lt!84400)))

(assert (= (and d!17346 c!3855) b!54447))

(assert (= (and d!17346 (not c!3855)) b!54443))

(assert (= (and d!17346 res!45431) b!54446))

(assert (= (and b!54446 res!45432) b!54444))

(assert (= (and b!54444 res!45430) b!54445))

(declare-fun m!85629 () Bool)

(assert (=> b!54446 m!85629))

(declare-fun m!85631 () Bool)

(assert (=> b!54445 m!85631))

(assert (=> b!54445 m!85275))

(assert (=> b!54445 m!85219))

(declare-fun m!85633 () Bool)

(assert (=> b!54444 m!85633))

(declare-fun m!85635 () Bool)

(assert (=> d!17346 m!85635))

(declare-fun m!85637 () Bool)

(assert (=> d!17346 m!85637))

(declare-fun m!85639 () Bool)

(assert (=> d!17346 m!85639))

(declare-fun m!85641 () Bool)

(assert (=> d!17346 m!85641))

(declare-fun m!85643 () Bool)

(assert (=> d!17346 m!85643))

(declare-fun m!85645 () Bool)

(assert (=> d!17346 m!85645))

(assert (=> d!17346 m!85621))

(assert (=> d!17346 m!85203))

(assert (=> d!17346 m!85619))

(assert (=> d!17346 m!85217))

(assert (=> d!17346 m!85215))

(assert (=> b!54447 m!85219))

(declare-fun m!85647 () Bool)

(assert (=> b!54447 m!85647))

(declare-fun m!85649 () Bool)

(assert (=> b!54447 m!85649))

(assert (=> b!54188 d!17346))

(declare-fun d!17348 () Bool)

(assert (=> d!17348 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1164 (buf!1518 (_2!2582 lt!83796)))) ((_ sign_extend 32) (currentByte!3091 thiss!1379)) ((_ sign_extend 32) (currentBit!3086 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1164 (buf!1518 (_2!2582 lt!83796)))) ((_ sign_extend 32) (currentByte!3091 thiss!1379)) ((_ sign_extend 32) (currentBit!3086 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4372 () Bool)

(assert (= bs!4372 d!17348))

(declare-fun m!85651 () Bool)

(assert (=> bs!4372 m!85651))

(assert (=> b!54188 d!17348))

(declare-fun d!17350 () Bool)

(declare-fun res!45435 () Bool)

(declare-fun e!36335 () Bool)

(assert (=> d!17350 (=> (not res!45435) (not e!36335))))

(assert (=> d!17350 (= res!45435 (= (size!1164 (buf!1518 (_2!2582 lt!83796))) (size!1164 (buf!1518 (_2!2582 (appendBitsMSBFirstLoop!0 (_2!2582 lt!83796) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))))))

(assert (=> d!17350 (= (isPrefixOf!0 (_2!2582 lt!83796) (_2!2582 (appendBitsMSBFirstLoop!0 (_2!2582 lt!83796) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))) e!36335)))

(declare-fun b!54448 () Bool)

(declare-fun res!45433 () Bool)

(assert (=> b!54448 (=> (not res!45433) (not e!36335))))

(assert (=> b!54448 (= res!45433 (bvsle (bitIndex!0 (size!1164 (buf!1518 (_2!2582 lt!83796))) (currentByte!3091 (_2!2582 lt!83796)) (currentBit!3086 (_2!2582 lt!83796))) (bitIndex!0 (size!1164 (buf!1518 (_2!2582 (appendBitsMSBFirstLoop!0 (_2!2582 lt!83796) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314)))) (currentByte!3091 (_2!2582 (appendBitsMSBFirstLoop!0 (_2!2582 lt!83796) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))) (currentBit!3086 (_2!2582 (appendBitsMSBFirstLoop!0 (_2!2582 lt!83796) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))))))

(declare-fun b!54449 () Bool)

(declare-fun e!36336 () Bool)

(assert (=> b!54449 (= e!36335 e!36336)))

(declare-fun res!45434 () Bool)

(assert (=> b!54449 (=> res!45434 e!36336)))

(assert (=> b!54449 (= res!45434 (= (size!1164 (buf!1518 (_2!2582 lt!83796))) #b00000000000000000000000000000000))))

(declare-fun b!54450 () Bool)

(assert (=> b!54450 (= e!36336 (arrayBitRangesEq!0 (buf!1518 (_2!2582 lt!83796)) (buf!1518 (_2!2582 (appendBitsMSBFirstLoop!0 (_2!2582 lt!83796) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1164 (buf!1518 (_2!2582 lt!83796))) (currentByte!3091 (_2!2582 lt!83796)) (currentBit!3086 (_2!2582 lt!83796)))))))

(assert (= (and d!17350 res!45435) b!54448))

(assert (= (and b!54448 res!45433) b!54449))

(assert (= (and b!54449 (not res!45434)) b!54450))

(assert (=> b!54448 m!85275))

(declare-fun m!85653 () Bool)

(assert (=> b!54448 m!85653))

(assert (=> b!54450 m!85275))

(assert (=> b!54450 m!85275))

(declare-fun m!85655 () Bool)

(assert (=> b!54450 m!85655))

(assert (=> b!54188 d!17350))

(declare-fun d!17352 () Bool)

(assert (=> d!17352 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1164 (buf!1518 thiss!1379))) ((_ sign_extend 32) (currentByte!3091 thiss!1379)) ((_ sign_extend 32) (currentBit!3086 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1164 (buf!1518 thiss!1379))) ((_ sign_extend 32) (currentByte!3091 thiss!1379)) ((_ sign_extend 32) (currentBit!3086 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4373 () Bool)

(assert (= bs!4373 d!17352))

(assert (=> bs!4373 m!85271))

(assert (=> b!54186 d!17352))

(check-sat (not b!54428) (not b!54334) (not b!54215) (not b!54431) (not b!54432) (not d!17326) (not d!17314) (not bm!685) (not d!17270) (not b!54315) (not d!17268) (not b!54333) (not d!17264) (not b!54448) (not b!54430) (not b!54312) (not b!54335) (not b!54229) (not b!54224) (not b!54316) (not b!54317) (not b!54226) (not b!54310) (not b!54426) (not d!17262) (not d!17348) (not b!54311) (not b!54447) (not b!54217) (not d!17324) (not d!17272) (not b!54444) (not b!54427) (not b!54445) (not d!17346) (not b!54323) (not b!54314) (not b!54313) (not d!17352) (not b!54450) (not b!54446))
