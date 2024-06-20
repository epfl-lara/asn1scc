; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11582 () Bool)

(assert start!11582)

(declare-fun b!57232 () Bool)

(declare-fun res!47559 () Bool)

(declare-fun e!37996 () Bool)

(assert (=> b!57232 (=> res!47559 e!37996)))

(declare-datatypes ((array!2625 0))(
  ( (array!2626 (arr!1749 (Array (_ BitVec 32) (_ BitVec 8))) (size!1191 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2070 0))(
  ( (BitStream!2071 (buf!1566 array!2625) (currentByte!3172 (_ BitVec 32)) (currentBit!3167 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2070)

(declare-datatypes ((Unit!3957 0))(
  ( (Unit!3958) )
))
(declare-datatypes ((tuple2!5214 0))(
  ( (tuple2!5215 (_1!2718 Unit!3957) (_2!2718 BitStream!2070)) )
))
(declare-fun lt!90261 () tuple2!5214)

(assert (=> b!57232 (= res!47559 (not (= (size!1191 (buf!1566 thiss!1379)) (size!1191 (buf!1566 (_2!2718 lt!90261))))))))

(declare-fun srcBuffer!2 () array!2625)

(declare-fun i!635 () (_ BitVec 64))

(declare-datatypes ((tuple2!5216 0))(
  ( (tuple2!5217 (_1!2719 BitStream!2070) (_2!2719 BitStream!2070)) )
))
(declare-fun lt!90257 () tuple2!5216)

(declare-fun lt!90260 () tuple2!5214)

(declare-fun b!57233 () Bool)

(declare-fun e!38003 () Bool)

(declare-datatypes ((List!610 0))(
  ( (Nil!607) (Cons!606 (h!725 Bool) (t!1360 List!610)) )
))
(declare-fun head!429 (List!610) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2070 array!2625 (_ BitVec 64) (_ BitVec 64)) List!610)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2070 BitStream!2070 (_ BitVec 64)) List!610)

(assert (=> b!57233 (= e!38003 (= (head!429 (byteArrayBitContentToList!0 (_2!2718 lt!90260) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!429 (bitStreamReadBitsIntoList!0 (_2!2718 lt!90260) (_1!2719 lt!90257) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!57234 () Bool)

(declare-fun res!47557 () Bool)

(assert (=> b!57234 (=> res!47557 e!37996)))

(declare-fun lt!90264 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!57234 (= res!47557 (not (= (bitIndex!0 (size!1191 (buf!1566 (_2!2718 lt!90261))) (currentByte!3172 (_2!2718 lt!90261)) (currentBit!3167 (_2!2718 lt!90261))) (bvsub (bvadd lt!90264 to!314) i!635))))))

(declare-fun b!57235 () Bool)

(declare-fun e!37999 () Bool)

(declare-fun e!38000 () Bool)

(assert (=> b!57235 (= e!37999 e!38000)))

(declare-fun res!47563 () Bool)

(assert (=> b!57235 (=> res!47563 e!38000)))

(declare-fun isPrefixOf!0 (BitStream!2070 BitStream!2070) Bool)

(assert (=> b!57235 (= res!47563 (not (isPrefixOf!0 thiss!1379 (_2!2718 lt!90260))))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!57235 (validate_offset_bits!1 ((_ sign_extend 32) (size!1191 (buf!1566 (_2!2718 lt!90260)))) ((_ sign_extend 32) (currentByte!3172 (_2!2718 lt!90260))) ((_ sign_extend 32) (currentBit!3167 (_2!2718 lt!90260))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!90256 () Unit!3957)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2070 BitStream!2070 (_ BitVec 64) (_ BitVec 64)) Unit!3957)

(assert (=> b!57235 (= lt!90256 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2718 lt!90260) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2070 (_ BitVec 8) (_ BitVec 32)) tuple2!5214)

(assert (=> b!57235 (= lt!90260 (appendBitFromByte!0 thiss!1379 (select (arr!1749 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!57236 () Bool)

(declare-fun lt!90259 () (_ BitVec 64))

(declare-fun lt!90262 () (_ BitVec 64))

(assert (=> b!57236 (= e!37996 (or (= lt!90259 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!90259 (bvand (bvsub lt!90262 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!57236 (= lt!90259 (bvand lt!90262 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!57236 (= lt!90262 (bvsub (bvadd (bitIndex!0 (size!1191 (buf!1566 (_2!2718 lt!90260))) (currentByte!3172 (_2!2718 lt!90260)) (currentBit!3167 (_2!2718 lt!90260))) to!314) i!635))))

(assert (=> b!57236 (= (size!1191 (buf!1566 (_2!2718 lt!90261))) (size!1191 (buf!1566 thiss!1379)))))

(declare-fun b!57237 () Bool)

(assert (=> b!57237 (= e!38000 e!37996)))

(declare-fun res!47558 () Bool)

(assert (=> b!57237 (=> res!47558 e!37996)))

(assert (=> b!57237 (= res!47558 (not (isPrefixOf!0 (_2!2718 lt!90260) (_2!2718 lt!90261))))))

(assert (=> b!57237 (isPrefixOf!0 thiss!1379 (_2!2718 lt!90261))))

(declare-fun lt!90265 () Unit!3957)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2070 BitStream!2070 BitStream!2070) Unit!3957)

(assert (=> b!57237 (= lt!90265 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2718 lt!90260) (_2!2718 lt!90261)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2070 array!2625 (_ BitVec 64) (_ BitVec 64)) tuple2!5214)

(assert (=> b!57237 (= lt!90261 (appendBitsMSBFirstLoop!0 (_2!2718 lt!90260) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!57237 e!38003))

(declare-fun res!47561 () Bool)

(assert (=> b!57237 (=> (not res!47561) (not e!38003))))

(assert (=> b!57237 (= res!47561 (validate_offset_bits!1 ((_ sign_extend 32) (size!1191 (buf!1566 (_2!2718 lt!90260)))) ((_ sign_extend 32) (currentByte!3172 thiss!1379)) ((_ sign_extend 32) (currentBit!3167 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!90263 () Unit!3957)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2070 array!2625 (_ BitVec 64)) Unit!3957)

(assert (=> b!57237 (= lt!90263 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1566 (_2!2718 lt!90260)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!2070 BitStream!2070) tuple2!5216)

(assert (=> b!57237 (= lt!90257 (reader!0 thiss!1379 (_2!2718 lt!90260)))))

(declare-fun res!47565 () Bool)

(declare-fun e!37998 () Bool)

(assert (=> start!11582 (=> (not res!47565) (not e!37998))))

(assert (=> start!11582 (= res!47565 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1191 srcBuffer!2))))))))

(assert (=> start!11582 e!37998))

(assert (=> start!11582 true))

(declare-fun array_inv!1094 (array!2625) Bool)

(assert (=> start!11582 (array_inv!1094 srcBuffer!2)))

(declare-fun e!37997 () Bool)

(declare-fun inv!12 (BitStream!2070) Bool)

(assert (=> start!11582 (and (inv!12 thiss!1379) e!37997)))

(declare-fun b!57238 () Bool)

(assert (=> b!57238 (= e!37997 (array_inv!1094 (buf!1566 thiss!1379)))))

(declare-fun b!57239 () Bool)

(declare-fun res!47564 () Bool)

(assert (=> b!57239 (=> (not res!47564) (not e!37998))))

(assert (=> b!57239 (= res!47564 (validate_offset_bits!1 ((_ sign_extend 32) (size!1191 (buf!1566 thiss!1379))) ((_ sign_extend 32) (currentByte!3172 thiss!1379)) ((_ sign_extend 32) (currentBit!3167 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!57240 () Bool)

(declare-fun res!47560 () Bool)

(assert (=> b!57240 (=> res!47560 e!37996)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!57240 (= res!47560 (not (invariant!0 (currentBit!3167 (_2!2718 lt!90261)) (currentByte!3172 (_2!2718 lt!90261)) (size!1191 (buf!1566 (_2!2718 lt!90261))))))))

(declare-fun b!57241 () Bool)

(assert (=> b!57241 (= e!37998 (not e!37999))))

(declare-fun res!47562 () Bool)

(assert (=> b!57241 (=> res!47562 e!37999)))

(assert (=> b!57241 (= res!47562 (bvsge i!635 to!314))))

(assert (=> b!57241 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!90258 () Unit!3957)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2070) Unit!3957)

(assert (=> b!57241 (= lt!90258 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!57241 (= lt!90264 (bitIndex!0 (size!1191 (buf!1566 thiss!1379)) (currentByte!3172 thiss!1379) (currentBit!3167 thiss!1379)))))

(assert (= (and start!11582 res!47565) b!57239))

(assert (= (and b!57239 res!47564) b!57241))

(assert (= (and b!57241 (not res!47562)) b!57235))

(assert (= (and b!57235 (not res!47563)) b!57237))

(assert (= (and b!57237 res!47561) b!57233))

(assert (= (and b!57237 (not res!47558)) b!57234))

(assert (= (and b!57234 (not res!47557)) b!57240))

(assert (= (and b!57240 (not res!47560)) b!57232))

(assert (= (and b!57232 (not res!47559)) b!57236))

(assert (= start!11582 b!57238))

(declare-fun m!90233 () Bool)

(assert (=> b!57240 m!90233))

(declare-fun m!90235 () Bool)

(assert (=> b!57234 m!90235))

(declare-fun m!90237 () Bool)

(assert (=> b!57238 m!90237))

(declare-fun m!90239 () Bool)

(assert (=> b!57235 m!90239))

(declare-fun m!90241 () Bool)

(assert (=> b!57235 m!90241))

(declare-fun m!90243 () Bool)

(assert (=> b!57235 m!90243))

(assert (=> b!57235 m!90239))

(declare-fun m!90245 () Bool)

(assert (=> b!57235 m!90245))

(declare-fun m!90247 () Bool)

(assert (=> b!57235 m!90247))

(declare-fun m!90249 () Bool)

(assert (=> b!57233 m!90249))

(assert (=> b!57233 m!90249))

(declare-fun m!90251 () Bool)

(assert (=> b!57233 m!90251))

(declare-fun m!90253 () Bool)

(assert (=> b!57233 m!90253))

(assert (=> b!57233 m!90253))

(declare-fun m!90255 () Bool)

(assert (=> b!57233 m!90255))

(declare-fun m!90257 () Bool)

(assert (=> start!11582 m!90257))

(declare-fun m!90259 () Bool)

(assert (=> start!11582 m!90259))

(declare-fun m!90261 () Bool)

(assert (=> b!57241 m!90261))

(declare-fun m!90263 () Bool)

(assert (=> b!57241 m!90263))

(declare-fun m!90265 () Bool)

(assert (=> b!57241 m!90265))

(declare-fun m!90267 () Bool)

(assert (=> b!57236 m!90267))

(declare-fun m!90269 () Bool)

(assert (=> b!57239 m!90269))

(declare-fun m!90271 () Bool)

(assert (=> b!57237 m!90271))

(declare-fun m!90273 () Bool)

(assert (=> b!57237 m!90273))

(declare-fun m!90275 () Bool)

(assert (=> b!57237 m!90275))

(declare-fun m!90277 () Bool)

(assert (=> b!57237 m!90277))

(declare-fun m!90279 () Bool)

(assert (=> b!57237 m!90279))

(declare-fun m!90281 () Bool)

(assert (=> b!57237 m!90281))

(declare-fun m!90283 () Bool)

(assert (=> b!57237 m!90283))

(check-sat (not b!57234) (not start!11582) (not b!57237) (not b!57240) (not b!57236) (not b!57235) (not b!57239) (not b!57241) (not b!57233) (not b!57238))
(check-sat)
(get-model)

(declare-fun d!18248 () Bool)

(assert (=> d!18248 (isPrefixOf!0 thiss!1379 (_2!2718 lt!90261))))

(declare-fun lt!90298 () Unit!3957)

(declare-fun choose!30 (BitStream!2070 BitStream!2070 BitStream!2070) Unit!3957)

(assert (=> d!18248 (= lt!90298 (choose!30 thiss!1379 (_2!2718 lt!90260) (_2!2718 lt!90261)))))

(assert (=> d!18248 (isPrefixOf!0 thiss!1379 (_2!2718 lt!90260))))

(assert (=> d!18248 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2718 lt!90260) (_2!2718 lt!90261)) lt!90298)))

(declare-fun bs!4551 () Bool)

(assert (= bs!4551 d!18248))

(assert (=> bs!4551 m!90275))

(declare-fun m!90337 () Bool)

(assert (=> bs!4551 m!90337))

(assert (=> bs!4551 m!90241))

(assert (=> b!57237 d!18248))

(declare-fun d!18250 () Bool)

(declare-fun res!47599 () Bool)

(declare-fun e!38032 () Bool)

(assert (=> d!18250 (=> (not res!47599) (not e!38032))))

(assert (=> d!18250 (= res!47599 (= (size!1191 (buf!1566 thiss!1379)) (size!1191 (buf!1566 (_2!2718 lt!90261)))))))

(assert (=> d!18250 (= (isPrefixOf!0 thiss!1379 (_2!2718 lt!90261)) e!38032)))

(declare-fun b!57278 () Bool)

(declare-fun res!47601 () Bool)

(assert (=> b!57278 (=> (not res!47601) (not e!38032))))

(assert (=> b!57278 (= res!47601 (bvsle (bitIndex!0 (size!1191 (buf!1566 thiss!1379)) (currentByte!3172 thiss!1379) (currentBit!3167 thiss!1379)) (bitIndex!0 (size!1191 (buf!1566 (_2!2718 lt!90261))) (currentByte!3172 (_2!2718 lt!90261)) (currentBit!3167 (_2!2718 lt!90261)))))))

(declare-fun b!57279 () Bool)

(declare-fun e!38033 () Bool)

(assert (=> b!57279 (= e!38032 e!38033)))

(declare-fun res!47600 () Bool)

(assert (=> b!57279 (=> res!47600 e!38033)))

(assert (=> b!57279 (= res!47600 (= (size!1191 (buf!1566 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!57280 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2625 array!2625 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!57280 (= e!38033 (arrayBitRangesEq!0 (buf!1566 thiss!1379) (buf!1566 (_2!2718 lt!90261)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1191 (buf!1566 thiss!1379)) (currentByte!3172 thiss!1379) (currentBit!3167 thiss!1379))))))

(assert (= (and d!18250 res!47599) b!57278))

(assert (= (and b!57278 res!47601) b!57279))

(assert (= (and b!57279 (not res!47600)) b!57280))

(assert (=> b!57278 m!90265))

(assert (=> b!57278 m!90235))

(assert (=> b!57280 m!90265))

(assert (=> b!57280 m!90265))

(declare-fun m!90339 () Bool)

(assert (=> b!57280 m!90339))

(assert (=> b!57237 d!18250))

(declare-fun b!57405 () Bool)

(declare-fun res!47707 () Bool)

(declare-fun e!38100 () Bool)

(assert (=> b!57405 (=> (not res!47707) (not e!38100))))

(declare-fun lt!90515 () tuple2!5214)

(assert (=> b!57405 (= res!47707 (invariant!0 (currentBit!3167 (_2!2718 lt!90515)) (currentByte!3172 (_2!2718 lt!90515)) (size!1191 (buf!1566 (_2!2718 lt!90515)))))))

(declare-fun b!57406 () Bool)

(declare-fun res!47705 () Bool)

(assert (=> b!57406 (=> (not res!47705) (not e!38100))))

(assert (=> b!57406 (= res!47705 (isPrefixOf!0 (_2!2718 lt!90260) (_2!2718 lt!90515)))))

(declare-fun b!57407 () Bool)

(declare-fun e!38102 () tuple2!5214)

(declare-fun Unit!3961 () Unit!3957)

(assert (=> b!57407 (= e!38102 (tuple2!5215 Unit!3961 (_2!2718 lt!90260)))))

(assert (=> b!57407 (= (size!1191 (buf!1566 (_2!2718 lt!90260))) (size!1191 (buf!1566 (_2!2718 lt!90260))))))

(declare-fun lt!90547 () Unit!3957)

(declare-fun Unit!3962 () Unit!3957)

(assert (=> b!57407 (= lt!90547 Unit!3962)))

(declare-fun call!748 () tuple2!5216)

(declare-fun checkByteArrayBitContent!0 (BitStream!2070 array!2625 array!2625 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!5222 0))(
  ( (tuple2!5223 (_1!2722 array!2625) (_2!2722 BitStream!2070)) )
))
(declare-fun readBits!0 (BitStream!2070 (_ BitVec 64)) tuple2!5222)

(assert (=> b!57407 (checkByteArrayBitContent!0 (_2!2718 lt!90260) srcBuffer!2 (_1!2722 (readBits!0 (_1!2719 call!748) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!57408 () Bool)

(declare-fun res!47703 () Bool)

(assert (=> b!57408 (=> (not res!47703) (not e!38100))))

(assert (=> b!57408 (= res!47703 (= (size!1191 (buf!1566 (_2!2718 lt!90260))) (size!1191 (buf!1566 (_2!2718 lt!90515)))))))

(declare-fun d!18252 () Bool)

(assert (=> d!18252 e!38100))

(declare-fun res!47704 () Bool)

(assert (=> d!18252 (=> (not res!47704) (not e!38100))))

(declare-fun lt!90545 () (_ BitVec 64))

(assert (=> d!18252 (= res!47704 (= (bitIndex!0 (size!1191 (buf!1566 (_2!2718 lt!90515))) (currentByte!3172 (_2!2718 lt!90515)) (currentBit!3167 (_2!2718 lt!90515))) (bvsub lt!90545 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!18252 (or (= (bvand lt!90545 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!90545 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!90545 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!90512 () (_ BitVec 64))

(assert (=> d!18252 (= lt!90545 (bvadd lt!90512 to!314))))

(assert (=> d!18252 (or (not (= (bvand lt!90512 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!90512 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!90512 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18252 (= lt!90512 (bitIndex!0 (size!1191 (buf!1566 (_2!2718 lt!90260))) (currentByte!3172 (_2!2718 lt!90260)) (currentBit!3167 (_2!2718 lt!90260))))))

(assert (=> d!18252 (= lt!90515 e!38102)))

(declare-fun c!4149 () Bool)

(assert (=> d!18252 (= c!4149 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!90514 () Unit!3957)

(declare-fun lt!90537 () Unit!3957)

(assert (=> d!18252 (= lt!90514 lt!90537)))

(assert (=> d!18252 (isPrefixOf!0 (_2!2718 lt!90260) (_2!2718 lt!90260))))

(assert (=> d!18252 (= lt!90537 (lemmaIsPrefixRefl!0 (_2!2718 lt!90260)))))

(declare-fun lt!90517 () (_ BitVec 64))

(assert (=> d!18252 (= lt!90517 (bitIndex!0 (size!1191 (buf!1566 (_2!2718 lt!90260))) (currentByte!3172 (_2!2718 lt!90260)) (currentBit!3167 (_2!2718 lt!90260))))))

(assert (=> d!18252 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!18252 (= (appendBitsMSBFirstLoop!0 (_2!2718 lt!90260) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!90515)))

(declare-fun b!57409 () Bool)

(declare-fun e!38101 () Bool)

(declare-fun lt!90543 () (_ BitVec 64))

(assert (=> b!57409 (= e!38101 (validate_offset_bits!1 ((_ sign_extend 32) (size!1191 (buf!1566 (_2!2718 lt!90260)))) ((_ sign_extend 32) (currentByte!3172 (_2!2718 lt!90260))) ((_ sign_extend 32) (currentBit!3167 (_2!2718 lt!90260))) lt!90543))))

(declare-fun b!57410 () Bool)

(declare-fun res!47706 () Bool)

(assert (=> b!57410 (=> (not res!47706) (not e!38100))))

(assert (=> b!57410 (= res!47706 (= (size!1191 (buf!1566 (_2!2718 lt!90515))) (size!1191 (buf!1566 (_2!2718 lt!90260)))))))

(declare-fun lt!90530 () tuple2!5214)

(declare-fun bm!745 () Bool)

(assert (=> bm!745 (= call!748 (reader!0 (_2!2718 lt!90260) (ite c!4149 (_2!2718 lt!90530) (_2!2718 lt!90260))))))

(declare-fun b!57411 () Bool)

(declare-fun Unit!3963 () Unit!3957)

(assert (=> b!57411 (= e!38102 (tuple2!5215 Unit!3963 (_2!2718 lt!90530)))))

(declare-fun lt!90536 () tuple2!5214)

(assert (=> b!57411 (= lt!90536 (appendBitFromByte!0 (_2!2718 lt!90260) (select (arr!1749 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!90531 () (_ BitVec 64))

(assert (=> b!57411 (= lt!90531 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!90538 () (_ BitVec 64))

(assert (=> b!57411 (= lt!90538 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!90540 () Unit!3957)

(assert (=> b!57411 (= lt!90540 (validateOffsetBitsIneqLemma!0 (_2!2718 lt!90260) (_2!2718 lt!90536) lt!90531 lt!90538))))

(assert (=> b!57411 (validate_offset_bits!1 ((_ sign_extend 32) (size!1191 (buf!1566 (_2!2718 lt!90536)))) ((_ sign_extend 32) (currentByte!3172 (_2!2718 lt!90536))) ((_ sign_extend 32) (currentBit!3167 (_2!2718 lt!90536))) (bvsub lt!90531 lt!90538))))

(declare-fun lt!90541 () Unit!3957)

(assert (=> b!57411 (= lt!90541 lt!90540)))

(declare-fun lt!90532 () tuple2!5216)

(assert (=> b!57411 (= lt!90532 (reader!0 (_2!2718 lt!90260) (_2!2718 lt!90536)))))

(declare-fun lt!90542 () (_ BitVec 64))

(assert (=> b!57411 (= lt!90542 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!90518 () Unit!3957)

(assert (=> b!57411 (= lt!90518 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2718 lt!90260) (buf!1566 (_2!2718 lt!90536)) lt!90542))))

(assert (=> b!57411 (validate_offset_bits!1 ((_ sign_extend 32) (size!1191 (buf!1566 (_2!2718 lt!90536)))) ((_ sign_extend 32) (currentByte!3172 (_2!2718 lt!90260))) ((_ sign_extend 32) (currentBit!3167 (_2!2718 lt!90260))) lt!90542)))

(declare-fun lt!90546 () Unit!3957)

(assert (=> b!57411 (= lt!90546 lt!90518)))

(assert (=> b!57411 (= (head!429 (byteArrayBitContentToList!0 (_2!2718 lt!90536) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!429 (bitStreamReadBitsIntoList!0 (_2!2718 lt!90536) (_1!2719 lt!90532) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!90529 () Unit!3957)

(declare-fun Unit!3964 () Unit!3957)

(assert (=> b!57411 (= lt!90529 Unit!3964)))

(assert (=> b!57411 (= lt!90530 (appendBitsMSBFirstLoop!0 (_2!2718 lt!90536) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!90520 () Unit!3957)

(assert (=> b!57411 (= lt!90520 (lemmaIsPrefixTransitive!0 (_2!2718 lt!90260) (_2!2718 lt!90536) (_2!2718 lt!90530)))))

(assert (=> b!57411 (isPrefixOf!0 (_2!2718 lt!90260) (_2!2718 lt!90530))))

(declare-fun lt!90551 () Unit!3957)

(assert (=> b!57411 (= lt!90551 lt!90520)))

(assert (=> b!57411 (= (size!1191 (buf!1566 (_2!2718 lt!90530))) (size!1191 (buf!1566 (_2!2718 lt!90260))))))

(declare-fun lt!90522 () Unit!3957)

(declare-fun Unit!3965 () Unit!3957)

(assert (=> b!57411 (= lt!90522 Unit!3965)))

(assert (=> b!57411 (= (bitIndex!0 (size!1191 (buf!1566 (_2!2718 lt!90530))) (currentByte!3172 (_2!2718 lt!90530)) (currentBit!3167 (_2!2718 lt!90530))) (bvsub (bvadd (bitIndex!0 (size!1191 (buf!1566 (_2!2718 lt!90260))) (currentByte!3172 (_2!2718 lt!90260)) (currentBit!3167 (_2!2718 lt!90260))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!90548 () Unit!3957)

(declare-fun Unit!3966 () Unit!3957)

(assert (=> b!57411 (= lt!90548 Unit!3966)))

(assert (=> b!57411 (= (bitIndex!0 (size!1191 (buf!1566 (_2!2718 lt!90530))) (currentByte!3172 (_2!2718 lt!90530)) (currentBit!3167 (_2!2718 lt!90530))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1191 (buf!1566 (_2!2718 lt!90536))) (currentByte!3172 (_2!2718 lt!90536)) (currentBit!3167 (_2!2718 lt!90536))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!90519 () Unit!3957)

(declare-fun Unit!3967 () Unit!3957)

(assert (=> b!57411 (= lt!90519 Unit!3967)))

(declare-fun lt!90534 () tuple2!5216)

(assert (=> b!57411 (= lt!90534 call!748)))

(declare-fun lt!90511 () (_ BitVec 64))

(assert (=> b!57411 (= lt!90511 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!90516 () Unit!3957)

(assert (=> b!57411 (= lt!90516 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2718 lt!90260) (buf!1566 (_2!2718 lt!90530)) lt!90511))))

(assert (=> b!57411 (validate_offset_bits!1 ((_ sign_extend 32) (size!1191 (buf!1566 (_2!2718 lt!90530)))) ((_ sign_extend 32) (currentByte!3172 (_2!2718 lt!90260))) ((_ sign_extend 32) (currentBit!3167 (_2!2718 lt!90260))) lt!90511)))

(declare-fun lt!90524 () Unit!3957)

(assert (=> b!57411 (= lt!90524 lt!90516)))

(declare-fun lt!90552 () tuple2!5216)

(assert (=> b!57411 (= lt!90552 (reader!0 (_2!2718 lt!90536) (_2!2718 lt!90530)))))

(declare-fun lt!90550 () (_ BitVec 64))

(assert (=> b!57411 (= lt!90550 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!90528 () Unit!3957)

(assert (=> b!57411 (= lt!90528 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2718 lt!90536) (buf!1566 (_2!2718 lt!90530)) lt!90550))))

(assert (=> b!57411 (validate_offset_bits!1 ((_ sign_extend 32) (size!1191 (buf!1566 (_2!2718 lt!90530)))) ((_ sign_extend 32) (currentByte!3172 (_2!2718 lt!90536))) ((_ sign_extend 32) (currentBit!3167 (_2!2718 lt!90536))) lt!90550)))

(declare-fun lt!90549 () Unit!3957)

(assert (=> b!57411 (= lt!90549 lt!90528)))

(declare-fun lt!90535 () List!610)

(assert (=> b!57411 (= lt!90535 (byteArrayBitContentToList!0 (_2!2718 lt!90530) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!90510 () List!610)

(assert (=> b!57411 (= lt!90510 (byteArrayBitContentToList!0 (_2!2718 lt!90530) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!90553 () List!610)

(assert (=> b!57411 (= lt!90553 (bitStreamReadBitsIntoList!0 (_2!2718 lt!90530) (_1!2719 lt!90534) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!90513 () List!610)

(assert (=> b!57411 (= lt!90513 (bitStreamReadBitsIntoList!0 (_2!2718 lt!90530) (_1!2719 lt!90552) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!90527 () (_ BitVec 64))

(assert (=> b!57411 (= lt!90527 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!90521 () Unit!3957)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2070 BitStream!2070 BitStream!2070 BitStream!2070 (_ BitVec 64) List!610) Unit!3957)

(assert (=> b!57411 (= lt!90521 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2718 lt!90530) (_2!2718 lt!90530) (_1!2719 lt!90534) (_1!2719 lt!90552) lt!90527 lt!90553))))

(declare-fun tail!276 (List!610) List!610)

(assert (=> b!57411 (= (bitStreamReadBitsIntoList!0 (_2!2718 lt!90530) (_1!2719 lt!90552) (bvsub lt!90527 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!276 lt!90553))))

(declare-fun lt!90523 () Unit!3957)

(assert (=> b!57411 (= lt!90523 lt!90521)))

(declare-fun lt!90544 () Unit!3957)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2625 array!2625 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3957)

(assert (=> b!57411 (= lt!90544 (arrayBitRangesEqImpliesEq!0 (buf!1566 (_2!2718 lt!90536)) (buf!1566 (_2!2718 lt!90530)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!90517 (bitIndex!0 (size!1191 (buf!1566 (_2!2718 lt!90536))) (currentByte!3172 (_2!2718 lt!90536)) (currentBit!3167 (_2!2718 lt!90536)))))))

(declare-fun bitAt!0 (array!2625 (_ BitVec 64)) Bool)

(assert (=> b!57411 (= (bitAt!0 (buf!1566 (_2!2718 lt!90536)) lt!90517) (bitAt!0 (buf!1566 (_2!2718 lt!90530)) lt!90517))))

(declare-fun lt!90539 () Unit!3957)

(assert (=> b!57411 (= lt!90539 lt!90544)))

(declare-fun b!57412 () Bool)

(declare-fun lt!90533 () tuple2!5216)

(assert (=> b!57412 (= e!38100 (= (bitStreamReadBitsIntoList!0 (_2!2718 lt!90515) (_1!2719 lt!90533) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2718 lt!90515) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!57412 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!57412 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!90525 () Unit!3957)

(declare-fun lt!90526 () Unit!3957)

(assert (=> b!57412 (= lt!90525 lt!90526)))

(assert (=> b!57412 (validate_offset_bits!1 ((_ sign_extend 32) (size!1191 (buf!1566 (_2!2718 lt!90515)))) ((_ sign_extend 32) (currentByte!3172 (_2!2718 lt!90260))) ((_ sign_extend 32) (currentBit!3167 (_2!2718 lt!90260))) lt!90543)))

(assert (=> b!57412 (= lt!90526 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2718 lt!90260) (buf!1566 (_2!2718 lt!90515)) lt!90543))))

(assert (=> b!57412 e!38101))

(declare-fun res!47702 () Bool)

(assert (=> b!57412 (=> (not res!47702) (not e!38101))))

(assert (=> b!57412 (= res!47702 (and (= (size!1191 (buf!1566 (_2!2718 lt!90260))) (size!1191 (buf!1566 (_2!2718 lt!90515)))) (bvsge lt!90543 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!57412 (= lt!90543 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!57412 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!57412 (= lt!90533 (reader!0 (_2!2718 lt!90260) (_2!2718 lt!90515)))))

(assert (= (and d!18252 c!4149) b!57411))

(assert (= (and d!18252 (not c!4149)) b!57407))

(assert (= (or b!57411 b!57407) bm!745))

(assert (= (and d!18252 res!47704) b!57405))

(assert (= (and b!57405 res!47707) b!57408))

(assert (= (and b!57408 res!47703) b!57406))

(assert (= (and b!57406 res!47705) b!57410))

(assert (= (and b!57410 res!47706) b!57412))

(assert (= (and b!57412 res!47702) b!57409))

(declare-fun m!90437 () Bool)

(assert (=> bm!745 m!90437))

(declare-fun m!90439 () Bool)

(assert (=> b!57412 m!90439))

(declare-fun m!90441 () Bool)

(assert (=> b!57412 m!90441))

(declare-fun m!90443 () Bool)

(assert (=> b!57412 m!90443))

(declare-fun m!90445 () Bool)

(assert (=> b!57412 m!90445))

(declare-fun m!90447 () Bool)

(assert (=> b!57412 m!90447))

(declare-fun m!90449 () Bool)

(assert (=> d!18252 m!90449))

(assert (=> d!18252 m!90267))

(declare-fun m!90451 () Bool)

(assert (=> d!18252 m!90451))

(declare-fun m!90453 () Bool)

(assert (=> d!18252 m!90453))

(declare-fun m!90455 () Bool)

(assert (=> b!57406 m!90455))

(declare-fun m!90457 () Bool)

(assert (=> b!57407 m!90457))

(declare-fun m!90459 () Bool)

(assert (=> b!57407 m!90459))

(declare-fun m!90461 () Bool)

(assert (=> b!57409 m!90461))

(declare-fun m!90463 () Bool)

(assert (=> b!57411 m!90463))

(declare-fun m!90465 () Bool)

(assert (=> b!57411 m!90465))

(declare-fun m!90467 () Bool)

(assert (=> b!57411 m!90467))

(declare-fun m!90469 () Bool)

(assert (=> b!57411 m!90469))

(declare-fun m!90471 () Bool)

(assert (=> b!57411 m!90471))

(declare-fun m!90473 () Bool)

(assert (=> b!57411 m!90473))

(declare-fun m!90475 () Bool)

(assert (=> b!57411 m!90475))

(declare-fun m!90477 () Bool)

(assert (=> b!57411 m!90477))

(declare-fun m!90479 () Bool)

(assert (=> b!57411 m!90479))

(declare-fun m!90481 () Bool)

(assert (=> b!57411 m!90481))

(declare-fun m!90483 () Bool)

(assert (=> b!57411 m!90483))

(declare-fun m!90485 () Bool)

(assert (=> b!57411 m!90485))

(declare-fun m!90487 () Bool)

(assert (=> b!57411 m!90487))

(declare-fun m!90489 () Bool)

(assert (=> b!57411 m!90489))

(declare-fun m!90491 () Bool)

(assert (=> b!57411 m!90491))

(declare-fun m!90493 () Bool)

(assert (=> b!57411 m!90493))

(declare-fun m!90495 () Bool)

(assert (=> b!57411 m!90495))

(assert (=> b!57411 m!90465))

(declare-fun m!90497 () Bool)

(assert (=> b!57411 m!90497))

(assert (=> b!57411 m!90267))

(declare-fun m!90499 () Bool)

(assert (=> b!57411 m!90499))

(assert (=> b!57411 m!90487))

(declare-fun m!90501 () Bool)

(assert (=> b!57411 m!90501))

(declare-fun m!90503 () Bool)

(assert (=> b!57411 m!90503))

(declare-fun m!90505 () Bool)

(assert (=> b!57411 m!90505))

(declare-fun m!90507 () Bool)

(assert (=> b!57411 m!90507))

(declare-fun m!90509 () Bool)

(assert (=> b!57411 m!90509))

(declare-fun m!90511 () Bool)

(assert (=> b!57411 m!90511))

(declare-fun m!90513 () Bool)

(assert (=> b!57411 m!90513))

(declare-fun m!90515 () Bool)

(assert (=> b!57411 m!90515))

(declare-fun m!90517 () Bool)

(assert (=> b!57411 m!90517))

(assert (=> b!57411 m!90491))

(declare-fun m!90519 () Bool)

(assert (=> b!57411 m!90519))

(declare-fun m!90521 () Bool)

(assert (=> b!57411 m!90521))

(declare-fun m!90523 () Bool)

(assert (=> b!57411 m!90523))

(assert (=> b!57411 m!90475))

(declare-fun m!90525 () Bool)

(assert (=> b!57405 m!90525))

(assert (=> b!57237 d!18252))

(declare-fun b!57423 () Bool)

(declare-fun res!47716 () Bool)

(declare-fun e!38108 () Bool)

(assert (=> b!57423 (=> (not res!47716) (not e!38108))))

(declare-fun lt!90608 () tuple2!5216)

(assert (=> b!57423 (= res!47716 (isPrefixOf!0 (_1!2719 lt!90608) thiss!1379))))

(declare-fun b!57424 () Bool)

(declare-fun e!38107 () Unit!3957)

(declare-fun lt!90605 () Unit!3957)

(assert (=> b!57424 (= e!38107 lt!90605)))

(declare-fun lt!90613 () (_ BitVec 64))

(assert (=> b!57424 (= lt!90613 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90600 () (_ BitVec 64))

(assert (=> b!57424 (= lt!90600 (bitIndex!0 (size!1191 (buf!1566 thiss!1379)) (currentByte!3172 thiss!1379) (currentBit!3167 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2625 array!2625 (_ BitVec 64) (_ BitVec 64)) Unit!3957)

(assert (=> b!57424 (= lt!90605 (arrayBitRangesEqSymmetric!0 (buf!1566 thiss!1379) (buf!1566 (_2!2718 lt!90260)) lt!90613 lt!90600))))

(assert (=> b!57424 (arrayBitRangesEq!0 (buf!1566 (_2!2718 lt!90260)) (buf!1566 thiss!1379) lt!90613 lt!90600)))

(declare-fun lt!90611 () (_ BitVec 64))

(declare-fun lt!90603 () (_ BitVec 64))

(declare-fun b!57425 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!2070 (_ BitVec 64)) BitStream!2070)

(assert (=> b!57425 (= e!38108 (= (_1!2719 lt!90608) (withMovedBitIndex!0 (_2!2719 lt!90608) (bvsub lt!90611 lt!90603))))))

(assert (=> b!57425 (or (= (bvand lt!90611 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!90603 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!90611 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!90611 lt!90603) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!57425 (= lt!90603 (bitIndex!0 (size!1191 (buf!1566 (_2!2718 lt!90260))) (currentByte!3172 (_2!2718 lt!90260)) (currentBit!3167 (_2!2718 lt!90260))))))

(assert (=> b!57425 (= lt!90611 (bitIndex!0 (size!1191 (buf!1566 thiss!1379)) (currentByte!3172 thiss!1379) (currentBit!3167 thiss!1379)))))

(declare-fun b!57426 () Bool)

(declare-fun res!47715 () Bool)

(assert (=> b!57426 (=> (not res!47715) (not e!38108))))

(assert (=> b!57426 (= res!47715 (isPrefixOf!0 (_2!2719 lt!90608) (_2!2718 lt!90260)))))

(declare-fun b!57427 () Bool)

(declare-fun Unit!3968 () Unit!3957)

(assert (=> b!57427 (= e!38107 Unit!3968)))

(declare-fun d!18308 () Bool)

(assert (=> d!18308 e!38108))

(declare-fun res!47714 () Bool)

(assert (=> d!18308 (=> (not res!47714) (not e!38108))))

(assert (=> d!18308 (= res!47714 (isPrefixOf!0 (_1!2719 lt!90608) (_2!2719 lt!90608)))))

(declare-fun lt!90595 () BitStream!2070)

(assert (=> d!18308 (= lt!90608 (tuple2!5217 lt!90595 (_2!2718 lt!90260)))))

(declare-fun lt!90607 () Unit!3957)

(declare-fun lt!90604 () Unit!3957)

(assert (=> d!18308 (= lt!90607 lt!90604)))

(assert (=> d!18308 (isPrefixOf!0 lt!90595 (_2!2718 lt!90260))))

(assert (=> d!18308 (= lt!90604 (lemmaIsPrefixTransitive!0 lt!90595 (_2!2718 lt!90260) (_2!2718 lt!90260)))))

(declare-fun lt!90609 () Unit!3957)

(declare-fun lt!90599 () Unit!3957)

(assert (=> d!18308 (= lt!90609 lt!90599)))

(assert (=> d!18308 (isPrefixOf!0 lt!90595 (_2!2718 lt!90260))))

(assert (=> d!18308 (= lt!90599 (lemmaIsPrefixTransitive!0 lt!90595 thiss!1379 (_2!2718 lt!90260)))))

(declare-fun lt!90602 () Unit!3957)

(assert (=> d!18308 (= lt!90602 e!38107)))

(declare-fun c!4152 () Bool)

(assert (=> d!18308 (= c!4152 (not (= (size!1191 (buf!1566 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!90601 () Unit!3957)

(declare-fun lt!90598 () Unit!3957)

(assert (=> d!18308 (= lt!90601 lt!90598)))

(assert (=> d!18308 (isPrefixOf!0 (_2!2718 lt!90260) (_2!2718 lt!90260))))

(assert (=> d!18308 (= lt!90598 (lemmaIsPrefixRefl!0 (_2!2718 lt!90260)))))

(declare-fun lt!90610 () Unit!3957)

(declare-fun lt!90596 () Unit!3957)

(assert (=> d!18308 (= lt!90610 lt!90596)))

(assert (=> d!18308 (= lt!90596 (lemmaIsPrefixRefl!0 (_2!2718 lt!90260)))))

(declare-fun lt!90597 () Unit!3957)

(declare-fun lt!90594 () Unit!3957)

(assert (=> d!18308 (= lt!90597 lt!90594)))

(assert (=> d!18308 (isPrefixOf!0 lt!90595 lt!90595)))

(assert (=> d!18308 (= lt!90594 (lemmaIsPrefixRefl!0 lt!90595))))

(declare-fun lt!90612 () Unit!3957)

(declare-fun lt!90606 () Unit!3957)

(assert (=> d!18308 (= lt!90612 lt!90606)))

(assert (=> d!18308 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!18308 (= lt!90606 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!18308 (= lt!90595 (BitStream!2071 (buf!1566 (_2!2718 lt!90260)) (currentByte!3172 thiss!1379) (currentBit!3167 thiss!1379)))))

(assert (=> d!18308 (isPrefixOf!0 thiss!1379 (_2!2718 lt!90260))))

(assert (=> d!18308 (= (reader!0 thiss!1379 (_2!2718 lt!90260)) lt!90608)))

(assert (= (and d!18308 c!4152) b!57424))

(assert (= (and d!18308 (not c!4152)) b!57427))

(assert (= (and d!18308 res!47714) b!57423))

(assert (= (and b!57423 res!47716) b!57426))

(assert (= (and b!57426 res!47715) b!57425))

(declare-fun m!90527 () Bool)

(assert (=> b!57426 m!90527))

(declare-fun m!90529 () Bool)

(assert (=> b!57425 m!90529))

(assert (=> b!57425 m!90267))

(assert (=> b!57425 m!90265))

(assert (=> b!57424 m!90265))

(declare-fun m!90531 () Bool)

(assert (=> b!57424 m!90531))

(declare-fun m!90533 () Bool)

(assert (=> b!57424 m!90533))

(declare-fun m!90535 () Bool)

(assert (=> b!57423 m!90535))

(declare-fun m!90537 () Bool)

(assert (=> d!18308 m!90537))

(assert (=> d!18308 m!90261))

(declare-fun m!90539 () Bool)

(assert (=> d!18308 m!90539))

(assert (=> d!18308 m!90453))

(assert (=> d!18308 m!90451))

(assert (=> d!18308 m!90263))

(declare-fun m!90541 () Bool)

(assert (=> d!18308 m!90541))

(declare-fun m!90543 () Bool)

(assert (=> d!18308 m!90543))

(declare-fun m!90545 () Bool)

(assert (=> d!18308 m!90545))

(declare-fun m!90547 () Bool)

(assert (=> d!18308 m!90547))

(assert (=> d!18308 m!90241))

(assert (=> b!57237 d!18308))

(declare-fun d!18310 () Bool)

(declare-fun res!47717 () Bool)

(declare-fun e!38109 () Bool)

(assert (=> d!18310 (=> (not res!47717) (not e!38109))))

(assert (=> d!18310 (= res!47717 (= (size!1191 (buf!1566 (_2!2718 lt!90260))) (size!1191 (buf!1566 (_2!2718 lt!90261)))))))

(assert (=> d!18310 (= (isPrefixOf!0 (_2!2718 lt!90260) (_2!2718 lt!90261)) e!38109)))

(declare-fun b!57428 () Bool)

(declare-fun res!47719 () Bool)

(assert (=> b!57428 (=> (not res!47719) (not e!38109))))

(assert (=> b!57428 (= res!47719 (bvsle (bitIndex!0 (size!1191 (buf!1566 (_2!2718 lt!90260))) (currentByte!3172 (_2!2718 lt!90260)) (currentBit!3167 (_2!2718 lt!90260))) (bitIndex!0 (size!1191 (buf!1566 (_2!2718 lt!90261))) (currentByte!3172 (_2!2718 lt!90261)) (currentBit!3167 (_2!2718 lt!90261)))))))

(declare-fun b!57429 () Bool)

(declare-fun e!38110 () Bool)

(assert (=> b!57429 (= e!38109 e!38110)))

(declare-fun res!47718 () Bool)

(assert (=> b!57429 (=> res!47718 e!38110)))

(assert (=> b!57429 (= res!47718 (= (size!1191 (buf!1566 (_2!2718 lt!90260))) #b00000000000000000000000000000000))))

(declare-fun b!57430 () Bool)

(assert (=> b!57430 (= e!38110 (arrayBitRangesEq!0 (buf!1566 (_2!2718 lt!90260)) (buf!1566 (_2!2718 lt!90261)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1191 (buf!1566 (_2!2718 lt!90260))) (currentByte!3172 (_2!2718 lt!90260)) (currentBit!3167 (_2!2718 lt!90260)))))))

(assert (= (and d!18310 res!47717) b!57428))

(assert (= (and b!57428 res!47719) b!57429))

(assert (= (and b!57429 (not res!47718)) b!57430))

(assert (=> b!57428 m!90267))

(assert (=> b!57428 m!90235))

(assert (=> b!57430 m!90267))

(assert (=> b!57430 m!90267))

(declare-fun m!90549 () Bool)

(assert (=> b!57430 m!90549))

(assert (=> b!57237 d!18310))

(declare-fun d!18312 () Bool)

(assert (=> d!18312 (validate_offset_bits!1 ((_ sign_extend 32) (size!1191 (buf!1566 (_2!2718 lt!90260)))) ((_ sign_extend 32) (currentByte!3172 thiss!1379)) ((_ sign_extend 32) (currentBit!3167 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!90616 () Unit!3957)

(declare-fun choose!9 (BitStream!2070 array!2625 (_ BitVec 64) BitStream!2070) Unit!3957)

(assert (=> d!18312 (= lt!90616 (choose!9 thiss!1379 (buf!1566 (_2!2718 lt!90260)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2071 (buf!1566 (_2!2718 lt!90260)) (currentByte!3172 thiss!1379) (currentBit!3167 thiss!1379))))))

(assert (=> d!18312 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1566 (_2!2718 lt!90260)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!90616)))

(declare-fun bs!4560 () Bool)

(assert (= bs!4560 d!18312))

(assert (=> bs!4560 m!90277))

(declare-fun m!90551 () Bool)

(assert (=> bs!4560 m!90551))

(assert (=> b!57237 d!18312))

(declare-fun d!18314 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!18314 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1191 (buf!1566 (_2!2718 lt!90260)))) ((_ sign_extend 32) (currentByte!3172 thiss!1379)) ((_ sign_extend 32) (currentBit!3167 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1191 (buf!1566 (_2!2718 lt!90260)))) ((_ sign_extend 32) (currentByte!3172 thiss!1379)) ((_ sign_extend 32) (currentBit!3167 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4561 () Bool)

(assert (= bs!4561 d!18314))

(declare-fun m!90553 () Bool)

(assert (=> bs!4561 m!90553))

(assert (=> b!57237 d!18314))

(declare-fun d!18316 () Bool)

(assert (=> d!18316 (= (array_inv!1094 srcBuffer!2) (bvsge (size!1191 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!11582 d!18316))

(declare-fun d!18318 () Bool)

(assert (=> d!18318 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3167 thiss!1379) (currentByte!3172 thiss!1379) (size!1191 (buf!1566 thiss!1379))))))

(declare-fun bs!4562 () Bool)

(assert (= bs!4562 d!18318))

(declare-fun m!90555 () Bool)

(assert (=> bs!4562 m!90555))

(assert (=> start!11582 d!18318))

(declare-fun d!18320 () Bool)

(declare-fun e!38113 () Bool)

(assert (=> d!18320 e!38113))

(declare-fun res!47725 () Bool)

(assert (=> d!18320 (=> (not res!47725) (not e!38113))))

(declare-fun lt!90634 () (_ BitVec 64))

(declare-fun lt!90630 () (_ BitVec 64))

(declare-fun lt!90629 () (_ BitVec 64))

(assert (=> d!18320 (= res!47725 (= lt!90629 (bvsub lt!90630 lt!90634)))))

(assert (=> d!18320 (or (= (bvand lt!90630 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!90634 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!90630 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!90630 lt!90634) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18320 (= lt!90634 (remainingBits!0 ((_ sign_extend 32) (size!1191 (buf!1566 (_2!2718 lt!90260)))) ((_ sign_extend 32) (currentByte!3172 (_2!2718 lt!90260))) ((_ sign_extend 32) (currentBit!3167 (_2!2718 lt!90260)))))))

(declare-fun lt!90633 () (_ BitVec 64))

(declare-fun lt!90631 () (_ BitVec 64))

(assert (=> d!18320 (= lt!90630 (bvmul lt!90633 lt!90631))))

(assert (=> d!18320 (or (= lt!90633 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!90631 (bvsdiv (bvmul lt!90633 lt!90631) lt!90633)))))

(assert (=> d!18320 (= lt!90631 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!18320 (= lt!90633 ((_ sign_extend 32) (size!1191 (buf!1566 (_2!2718 lt!90260)))))))

(assert (=> d!18320 (= lt!90629 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3172 (_2!2718 lt!90260))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3167 (_2!2718 lt!90260)))))))

(assert (=> d!18320 (invariant!0 (currentBit!3167 (_2!2718 lt!90260)) (currentByte!3172 (_2!2718 lt!90260)) (size!1191 (buf!1566 (_2!2718 lt!90260))))))

(assert (=> d!18320 (= (bitIndex!0 (size!1191 (buf!1566 (_2!2718 lt!90260))) (currentByte!3172 (_2!2718 lt!90260)) (currentBit!3167 (_2!2718 lt!90260))) lt!90629)))

(declare-fun b!57435 () Bool)

(declare-fun res!47724 () Bool)

(assert (=> b!57435 (=> (not res!47724) (not e!38113))))

(assert (=> b!57435 (= res!47724 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!90629))))

(declare-fun b!57436 () Bool)

(declare-fun lt!90632 () (_ BitVec 64))

(assert (=> b!57436 (= e!38113 (bvsle lt!90629 (bvmul lt!90632 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!57436 (or (= lt!90632 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!90632 #b0000000000000000000000000000000000000000000000000000000000001000) lt!90632)))))

(assert (=> b!57436 (= lt!90632 ((_ sign_extend 32) (size!1191 (buf!1566 (_2!2718 lt!90260)))))))

(assert (= (and d!18320 res!47725) b!57435))

(assert (= (and b!57435 res!47724) b!57436))

(declare-fun m!90557 () Bool)

(assert (=> d!18320 m!90557))

(declare-fun m!90559 () Bool)

(assert (=> d!18320 m!90559))

(assert (=> b!57236 d!18320))

(declare-fun d!18322 () Bool)

(declare-fun res!47726 () Bool)

(declare-fun e!38114 () Bool)

(assert (=> d!18322 (=> (not res!47726) (not e!38114))))

(assert (=> d!18322 (= res!47726 (= (size!1191 (buf!1566 thiss!1379)) (size!1191 (buf!1566 thiss!1379))))))

(assert (=> d!18322 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!38114)))

(declare-fun b!57437 () Bool)

(declare-fun res!47728 () Bool)

(assert (=> b!57437 (=> (not res!47728) (not e!38114))))

(assert (=> b!57437 (= res!47728 (bvsle (bitIndex!0 (size!1191 (buf!1566 thiss!1379)) (currentByte!3172 thiss!1379) (currentBit!3167 thiss!1379)) (bitIndex!0 (size!1191 (buf!1566 thiss!1379)) (currentByte!3172 thiss!1379) (currentBit!3167 thiss!1379))))))

(declare-fun b!57438 () Bool)

(declare-fun e!38115 () Bool)

(assert (=> b!57438 (= e!38114 e!38115)))

(declare-fun res!47727 () Bool)

(assert (=> b!57438 (=> res!47727 e!38115)))

(assert (=> b!57438 (= res!47727 (= (size!1191 (buf!1566 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!57439 () Bool)

(assert (=> b!57439 (= e!38115 (arrayBitRangesEq!0 (buf!1566 thiss!1379) (buf!1566 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1191 (buf!1566 thiss!1379)) (currentByte!3172 thiss!1379) (currentBit!3167 thiss!1379))))))

(assert (= (and d!18322 res!47726) b!57437))

(assert (= (and b!57437 res!47728) b!57438))

(assert (= (and b!57438 (not res!47727)) b!57439))

(assert (=> b!57437 m!90265))

(assert (=> b!57437 m!90265))

(assert (=> b!57439 m!90265))

(assert (=> b!57439 m!90265))

(declare-fun m!90561 () Bool)

(assert (=> b!57439 m!90561))

(assert (=> b!57241 d!18322))

(declare-fun d!18324 () Bool)

(assert (=> d!18324 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!90637 () Unit!3957)

(declare-fun choose!11 (BitStream!2070) Unit!3957)

(assert (=> d!18324 (= lt!90637 (choose!11 thiss!1379))))

(assert (=> d!18324 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!90637)))

(declare-fun bs!4564 () Bool)

(assert (= bs!4564 d!18324))

(assert (=> bs!4564 m!90261))

(declare-fun m!90563 () Bool)

(assert (=> bs!4564 m!90563))

(assert (=> b!57241 d!18324))

(declare-fun d!18326 () Bool)

(declare-fun e!38116 () Bool)

(assert (=> d!18326 e!38116))

(declare-fun res!47730 () Bool)

(assert (=> d!18326 (=> (not res!47730) (not e!38116))))

(declare-fun lt!90638 () (_ BitVec 64))

(declare-fun lt!90639 () (_ BitVec 64))

(declare-fun lt!90643 () (_ BitVec 64))

(assert (=> d!18326 (= res!47730 (= lt!90638 (bvsub lt!90639 lt!90643)))))

(assert (=> d!18326 (or (= (bvand lt!90639 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!90643 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!90639 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!90639 lt!90643) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18326 (= lt!90643 (remainingBits!0 ((_ sign_extend 32) (size!1191 (buf!1566 thiss!1379))) ((_ sign_extend 32) (currentByte!3172 thiss!1379)) ((_ sign_extend 32) (currentBit!3167 thiss!1379))))))

(declare-fun lt!90642 () (_ BitVec 64))

(declare-fun lt!90640 () (_ BitVec 64))

(assert (=> d!18326 (= lt!90639 (bvmul lt!90642 lt!90640))))

(assert (=> d!18326 (or (= lt!90642 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!90640 (bvsdiv (bvmul lt!90642 lt!90640) lt!90642)))))

(assert (=> d!18326 (= lt!90640 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!18326 (= lt!90642 ((_ sign_extend 32) (size!1191 (buf!1566 thiss!1379))))))

(assert (=> d!18326 (= lt!90638 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3172 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3167 thiss!1379))))))

(assert (=> d!18326 (invariant!0 (currentBit!3167 thiss!1379) (currentByte!3172 thiss!1379) (size!1191 (buf!1566 thiss!1379)))))

(assert (=> d!18326 (= (bitIndex!0 (size!1191 (buf!1566 thiss!1379)) (currentByte!3172 thiss!1379) (currentBit!3167 thiss!1379)) lt!90638)))

(declare-fun b!57440 () Bool)

(declare-fun res!47729 () Bool)

(assert (=> b!57440 (=> (not res!47729) (not e!38116))))

(assert (=> b!57440 (= res!47729 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!90638))))

(declare-fun b!57441 () Bool)

(declare-fun lt!90641 () (_ BitVec 64))

(assert (=> b!57441 (= e!38116 (bvsle lt!90638 (bvmul lt!90641 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!57441 (or (= lt!90641 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!90641 #b0000000000000000000000000000000000000000000000000000000000001000) lt!90641)))))

(assert (=> b!57441 (= lt!90641 ((_ sign_extend 32) (size!1191 (buf!1566 thiss!1379))))))

(assert (= (and d!18326 res!47730) b!57440))

(assert (= (and b!57440 res!47729) b!57441))

(declare-fun m!90565 () Bool)

(assert (=> d!18326 m!90565))

(assert (=> d!18326 m!90555))

(assert (=> b!57241 d!18326))

(declare-fun d!18328 () Bool)

(declare-fun res!47731 () Bool)

(declare-fun e!38117 () Bool)

(assert (=> d!18328 (=> (not res!47731) (not e!38117))))

(assert (=> d!18328 (= res!47731 (= (size!1191 (buf!1566 thiss!1379)) (size!1191 (buf!1566 (_2!2718 lt!90260)))))))

(assert (=> d!18328 (= (isPrefixOf!0 thiss!1379 (_2!2718 lt!90260)) e!38117)))

(declare-fun b!57442 () Bool)

(declare-fun res!47733 () Bool)

(assert (=> b!57442 (=> (not res!47733) (not e!38117))))

(assert (=> b!57442 (= res!47733 (bvsle (bitIndex!0 (size!1191 (buf!1566 thiss!1379)) (currentByte!3172 thiss!1379) (currentBit!3167 thiss!1379)) (bitIndex!0 (size!1191 (buf!1566 (_2!2718 lt!90260))) (currentByte!3172 (_2!2718 lt!90260)) (currentBit!3167 (_2!2718 lt!90260)))))))

(declare-fun b!57443 () Bool)

(declare-fun e!38118 () Bool)

(assert (=> b!57443 (= e!38117 e!38118)))

(declare-fun res!47732 () Bool)

(assert (=> b!57443 (=> res!47732 e!38118)))

(assert (=> b!57443 (= res!47732 (= (size!1191 (buf!1566 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!57444 () Bool)

(assert (=> b!57444 (= e!38118 (arrayBitRangesEq!0 (buf!1566 thiss!1379) (buf!1566 (_2!2718 lt!90260)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1191 (buf!1566 thiss!1379)) (currentByte!3172 thiss!1379) (currentBit!3167 thiss!1379))))))

(assert (= (and d!18328 res!47731) b!57442))

(assert (= (and b!57442 res!47733) b!57443))

(assert (= (and b!57443 (not res!47732)) b!57444))

(assert (=> b!57442 m!90265))

(assert (=> b!57442 m!90267))

(assert (=> b!57444 m!90265))

(assert (=> b!57444 m!90265))

(declare-fun m!90567 () Bool)

(assert (=> b!57444 m!90567))

(assert (=> b!57235 d!18328))

(declare-fun d!18330 () Bool)

(assert (=> d!18330 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1191 (buf!1566 (_2!2718 lt!90260)))) ((_ sign_extend 32) (currentByte!3172 (_2!2718 lt!90260))) ((_ sign_extend 32) (currentBit!3167 (_2!2718 lt!90260))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1191 (buf!1566 (_2!2718 lt!90260)))) ((_ sign_extend 32) (currentByte!3172 (_2!2718 lt!90260))) ((_ sign_extend 32) (currentBit!3167 (_2!2718 lt!90260)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!4565 () Bool)

(assert (= bs!4565 d!18330))

(assert (=> bs!4565 m!90557))

(assert (=> b!57235 d!18330))

(declare-fun d!18332 () Bool)

(declare-fun e!38121 () Bool)

(assert (=> d!18332 e!38121))

(declare-fun res!47736 () Bool)

(assert (=> d!18332 (=> (not res!47736) (not e!38121))))

(assert (=> d!18332 (= res!47736 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!90646 () Unit!3957)

(declare-fun choose!27 (BitStream!2070 BitStream!2070 (_ BitVec 64) (_ BitVec 64)) Unit!3957)

(assert (=> d!18332 (= lt!90646 (choose!27 thiss!1379 (_2!2718 lt!90260) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!18332 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!18332 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2718 lt!90260) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!90646)))

(declare-fun b!57447 () Bool)

(assert (=> b!57447 (= e!38121 (validate_offset_bits!1 ((_ sign_extend 32) (size!1191 (buf!1566 (_2!2718 lt!90260)))) ((_ sign_extend 32) (currentByte!3172 (_2!2718 lt!90260))) ((_ sign_extend 32) (currentBit!3167 (_2!2718 lt!90260))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!18332 res!47736) b!57447))

(declare-fun m!90569 () Bool)

(assert (=> d!18332 m!90569))

(assert (=> b!57447 m!90247))

(assert (=> b!57235 d!18332))

(declare-fun b!57465 () Bool)

(declare-fun res!47753 () Bool)

(declare-fun e!38130 () Bool)

(assert (=> b!57465 (=> (not res!47753) (not e!38130))))

(declare-fun lt!90673 () (_ BitVec 64))

(declare-fun lt!90674 () (_ BitVec 64))

(declare-fun lt!90672 () tuple2!5214)

(assert (=> b!57465 (= res!47753 (= (bitIndex!0 (size!1191 (buf!1566 (_2!2718 lt!90672))) (currentByte!3172 (_2!2718 lt!90672)) (currentBit!3167 (_2!2718 lt!90672))) (bvadd lt!90674 lt!90673)))))

(assert (=> b!57465 (or (not (= (bvand lt!90674 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!90673 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!90674 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!90674 lt!90673) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!57465 (= lt!90673 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!57465 (= lt!90674 (bitIndex!0 (size!1191 (buf!1566 thiss!1379)) (currentByte!3172 thiss!1379) (currentBit!3167 thiss!1379)))))

(declare-fun d!18334 () Bool)

(assert (=> d!18334 e!38130))

(declare-fun res!47756 () Bool)

(assert (=> d!18334 (=> (not res!47756) (not e!38130))))

(assert (=> d!18334 (= res!47756 (= (size!1191 (buf!1566 (_2!2718 lt!90672))) (size!1191 (buf!1566 thiss!1379))))))

(declare-fun lt!90671 () (_ BitVec 8))

(declare-fun lt!90677 () array!2625)

(assert (=> d!18334 (= lt!90671 (select (arr!1749 lt!90677) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!18334 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1191 lt!90677)))))

(assert (=> d!18334 (= lt!90677 (array!2626 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!90679 () tuple2!5214)

(assert (=> d!18334 (= lt!90672 (tuple2!5215 (_1!2718 lt!90679) (_2!2718 lt!90679)))))

(declare-fun lt!90676 () tuple2!5214)

(assert (=> d!18334 (= lt!90679 lt!90676)))

(declare-fun e!38131 () Bool)

(assert (=> d!18334 e!38131))

(declare-fun res!47758 () Bool)

(assert (=> d!18334 (=> (not res!47758) (not e!38131))))

(assert (=> d!18334 (= res!47758 (= (size!1191 (buf!1566 thiss!1379)) (size!1191 (buf!1566 (_2!2718 lt!90676)))))))

(declare-fun lt!90678 () Bool)

(declare-fun appendBit!0 (BitStream!2070 Bool) tuple2!5214)

(assert (=> d!18334 (= lt!90676 (appendBit!0 thiss!1379 lt!90678))))

(assert (=> d!18334 (= lt!90678 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1749 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!18334 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!18334 (= (appendBitFromByte!0 thiss!1379 (select (arr!1749 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!90672)))

(declare-fun b!57466 () Bool)

(declare-fun e!38132 () Bool)

(assert (=> b!57466 (= e!38131 e!38132)))

(declare-fun res!47759 () Bool)

(assert (=> b!57466 (=> (not res!47759) (not e!38132))))

(declare-datatypes ((tuple2!5224 0))(
  ( (tuple2!5225 (_1!2723 BitStream!2070) (_2!2723 Bool)) )
))
(declare-fun lt!90682 () tuple2!5224)

(assert (=> b!57466 (= res!47759 (and (= (_2!2723 lt!90682) lt!90678) (= (_1!2723 lt!90682) (_2!2718 lt!90676))))))

(declare-fun readBitPure!0 (BitStream!2070) tuple2!5224)

(declare-fun readerFrom!0 (BitStream!2070 (_ BitVec 32) (_ BitVec 32)) BitStream!2070)

(assert (=> b!57466 (= lt!90682 (readBitPure!0 (readerFrom!0 (_2!2718 lt!90676) (currentBit!3167 thiss!1379) (currentByte!3172 thiss!1379))))))

(declare-fun b!57467 () Bool)

(declare-fun e!38133 () Bool)

(assert (=> b!57467 (= e!38130 e!38133)))

(declare-fun res!47757 () Bool)

(assert (=> b!57467 (=> (not res!47757) (not e!38133))))

(declare-fun lt!90675 () tuple2!5224)

(assert (=> b!57467 (= res!47757 (and (= (_2!2723 lt!90675) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1749 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!90671)) #b00000000000000000000000000000000))) (= (_1!2723 lt!90675) (_2!2718 lt!90672))))))

(declare-fun lt!90681 () tuple2!5222)

(declare-fun lt!90680 () BitStream!2070)

(assert (=> b!57467 (= lt!90681 (readBits!0 lt!90680 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!57467 (= lt!90675 (readBitPure!0 lt!90680))))

(assert (=> b!57467 (= lt!90680 (readerFrom!0 (_2!2718 lt!90672) (currentBit!3167 thiss!1379) (currentByte!3172 thiss!1379)))))

(declare-fun b!57468 () Bool)

(declare-fun res!47755 () Bool)

(assert (=> b!57468 (=> (not res!47755) (not e!38130))))

(assert (=> b!57468 (= res!47755 (isPrefixOf!0 thiss!1379 (_2!2718 lt!90672)))))

(declare-fun b!57469 () Bool)

(declare-fun res!47760 () Bool)

(assert (=> b!57469 (=> (not res!47760) (not e!38131))))

(assert (=> b!57469 (= res!47760 (isPrefixOf!0 thiss!1379 (_2!2718 lt!90676)))))

(declare-fun b!57470 () Bool)

(declare-fun res!47754 () Bool)

(assert (=> b!57470 (=> (not res!47754) (not e!38131))))

(assert (=> b!57470 (= res!47754 (= (bitIndex!0 (size!1191 (buf!1566 (_2!2718 lt!90676))) (currentByte!3172 (_2!2718 lt!90676)) (currentBit!3167 (_2!2718 lt!90676))) (bvadd (bitIndex!0 (size!1191 (buf!1566 thiss!1379)) (currentByte!3172 thiss!1379) (currentBit!3167 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!57471 () Bool)

(assert (=> b!57471 (= e!38133 (= (bitIndex!0 (size!1191 (buf!1566 (_1!2723 lt!90675))) (currentByte!3172 (_1!2723 lt!90675)) (currentBit!3167 (_1!2723 lt!90675))) (bitIndex!0 (size!1191 (buf!1566 (_2!2718 lt!90672))) (currentByte!3172 (_2!2718 lt!90672)) (currentBit!3167 (_2!2718 lt!90672)))))))

(declare-fun b!57472 () Bool)

(assert (=> b!57472 (= e!38132 (= (bitIndex!0 (size!1191 (buf!1566 (_1!2723 lt!90682))) (currentByte!3172 (_1!2723 lt!90682)) (currentBit!3167 (_1!2723 lt!90682))) (bitIndex!0 (size!1191 (buf!1566 (_2!2718 lt!90676))) (currentByte!3172 (_2!2718 lt!90676)) (currentBit!3167 (_2!2718 lt!90676)))))))

(assert (= (and d!18334 res!47758) b!57470))

(assert (= (and b!57470 res!47754) b!57469))

(assert (= (and b!57469 res!47760) b!57466))

(assert (= (and b!57466 res!47759) b!57472))

(assert (= (and d!18334 res!47756) b!57465))

(assert (= (and b!57465 res!47753) b!57468))

(assert (= (and b!57468 res!47755) b!57467))

(assert (= (and b!57467 res!47757) b!57471))

(declare-fun m!90571 () Bool)

(assert (=> b!57466 m!90571))

(assert (=> b!57466 m!90571))

(declare-fun m!90573 () Bool)

(assert (=> b!57466 m!90573))

(declare-fun m!90575 () Bool)

(assert (=> b!57465 m!90575))

(assert (=> b!57465 m!90265))

(declare-fun m!90577 () Bool)

(assert (=> b!57471 m!90577))

(assert (=> b!57471 m!90575))

(declare-fun m!90579 () Bool)

(assert (=> b!57467 m!90579))

(declare-fun m!90581 () Bool)

(assert (=> b!57467 m!90581))

(declare-fun m!90583 () Bool)

(assert (=> b!57467 m!90583))

(declare-fun m!90585 () Bool)

(assert (=> b!57468 m!90585))

(declare-fun m!90587 () Bool)

(assert (=> b!57472 m!90587))

(declare-fun m!90589 () Bool)

(assert (=> b!57472 m!90589))

(declare-fun m!90591 () Bool)

(assert (=> b!57469 m!90591))

(declare-fun m!90593 () Bool)

(assert (=> d!18334 m!90593))

(declare-fun m!90595 () Bool)

(assert (=> d!18334 m!90595))

(declare-fun m!90597 () Bool)

(assert (=> d!18334 m!90597))

(assert (=> b!57470 m!90589))

(assert (=> b!57470 m!90265))

(assert (=> b!57235 d!18334))

(declare-fun d!18336 () Bool)

(assert (=> d!18336 (= (invariant!0 (currentBit!3167 (_2!2718 lt!90261)) (currentByte!3172 (_2!2718 lt!90261)) (size!1191 (buf!1566 (_2!2718 lt!90261)))) (and (bvsge (currentBit!3167 (_2!2718 lt!90261)) #b00000000000000000000000000000000) (bvslt (currentBit!3167 (_2!2718 lt!90261)) #b00000000000000000000000000001000) (bvsge (currentByte!3172 (_2!2718 lt!90261)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3172 (_2!2718 lt!90261)) (size!1191 (buf!1566 (_2!2718 lt!90261)))) (and (= (currentBit!3167 (_2!2718 lt!90261)) #b00000000000000000000000000000000) (= (currentByte!3172 (_2!2718 lt!90261)) (size!1191 (buf!1566 (_2!2718 lt!90261))))))))))

(assert (=> b!57240 d!18336))

(declare-fun d!18338 () Bool)

(declare-fun e!38134 () Bool)

(assert (=> d!18338 e!38134))

(declare-fun res!47762 () Bool)

(assert (=> d!18338 (=> (not res!47762) (not e!38134))))

(declare-fun lt!90688 () (_ BitVec 64))

(declare-fun lt!90683 () (_ BitVec 64))

(declare-fun lt!90684 () (_ BitVec 64))

(assert (=> d!18338 (= res!47762 (= lt!90683 (bvsub lt!90684 lt!90688)))))

(assert (=> d!18338 (or (= (bvand lt!90684 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!90688 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!90684 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!90684 lt!90688) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18338 (= lt!90688 (remainingBits!0 ((_ sign_extend 32) (size!1191 (buf!1566 (_2!2718 lt!90261)))) ((_ sign_extend 32) (currentByte!3172 (_2!2718 lt!90261))) ((_ sign_extend 32) (currentBit!3167 (_2!2718 lt!90261)))))))

(declare-fun lt!90687 () (_ BitVec 64))

(declare-fun lt!90685 () (_ BitVec 64))

(assert (=> d!18338 (= lt!90684 (bvmul lt!90687 lt!90685))))

(assert (=> d!18338 (or (= lt!90687 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!90685 (bvsdiv (bvmul lt!90687 lt!90685) lt!90687)))))

(assert (=> d!18338 (= lt!90685 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!18338 (= lt!90687 ((_ sign_extend 32) (size!1191 (buf!1566 (_2!2718 lt!90261)))))))

(assert (=> d!18338 (= lt!90683 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3172 (_2!2718 lt!90261))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3167 (_2!2718 lt!90261)))))))

(assert (=> d!18338 (invariant!0 (currentBit!3167 (_2!2718 lt!90261)) (currentByte!3172 (_2!2718 lt!90261)) (size!1191 (buf!1566 (_2!2718 lt!90261))))))

(assert (=> d!18338 (= (bitIndex!0 (size!1191 (buf!1566 (_2!2718 lt!90261))) (currentByte!3172 (_2!2718 lt!90261)) (currentBit!3167 (_2!2718 lt!90261))) lt!90683)))

(declare-fun b!57473 () Bool)

(declare-fun res!47761 () Bool)

(assert (=> b!57473 (=> (not res!47761) (not e!38134))))

(assert (=> b!57473 (= res!47761 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!90683))))

(declare-fun b!57474 () Bool)

(declare-fun lt!90686 () (_ BitVec 64))

(assert (=> b!57474 (= e!38134 (bvsle lt!90683 (bvmul lt!90686 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!57474 (or (= lt!90686 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!90686 #b0000000000000000000000000000000000000000000000000000000000001000) lt!90686)))))

(assert (=> b!57474 (= lt!90686 ((_ sign_extend 32) (size!1191 (buf!1566 (_2!2718 lt!90261)))))))

(assert (= (and d!18338 res!47762) b!57473))

(assert (= (and b!57473 res!47761) b!57474))

(declare-fun m!90599 () Bool)

(assert (=> d!18338 m!90599))

(assert (=> d!18338 m!90233))

(assert (=> b!57234 d!18338))

(declare-fun d!18340 () Bool)

(assert (=> d!18340 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1191 (buf!1566 thiss!1379))) ((_ sign_extend 32) (currentByte!3172 thiss!1379)) ((_ sign_extend 32) (currentBit!3167 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1191 (buf!1566 thiss!1379))) ((_ sign_extend 32) (currentByte!3172 thiss!1379)) ((_ sign_extend 32) (currentBit!3167 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4566 () Bool)

(assert (= bs!4566 d!18340))

(assert (=> bs!4566 m!90565))

(assert (=> b!57239 d!18340))

(declare-fun d!18342 () Bool)

(assert (=> d!18342 (= (head!429 (byteArrayBitContentToList!0 (_2!2718 lt!90260) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!725 (byteArrayBitContentToList!0 (_2!2718 lt!90260) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!57233 d!18342))

(declare-fun d!18344 () Bool)

(declare-fun c!4155 () Bool)

(assert (=> d!18344 (= c!4155 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!38137 () List!610)

(assert (=> d!18344 (= (byteArrayBitContentToList!0 (_2!2718 lt!90260) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!38137)))

(declare-fun b!57479 () Bool)

(assert (=> b!57479 (= e!38137 Nil!607)))

(declare-fun b!57480 () Bool)

(assert (=> b!57480 (= e!38137 (Cons!606 (not (= (bvand ((_ sign_extend 24) (select (arr!1749 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2718 lt!90260) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!18344 c!4155) b!57479))

(assert (= (and d!18344 (not c!4155)) b!57480))

(assert (=> b!57480 m!90239))

(assert (=> b!57480 m!90597))

(declare-fun m!90601 () Bool)

(assert (=> b!57480 m!90601))

(assert (=> b!57233 d!18344))

(declare-fun d!18346 () Bool)

(assert (=> d!18346 (= (head!429 (bitStreamReadBitsIntoList!0 (_2!2718 lt!90260) (_1!2719 lt!90257) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!725 (bitStreamReadBitsIntoList!0 (_2!2718 lt!90260) (_1!2719 lt!90257) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!57233 d!18346))

(declare-fun b!57489 () Bool)

(declare-datatypes ((tuple2!5226 0))(
  ( (tuple2!5227 (_1!2724 List!610) (_2!2724 BitStream!2070)) )
))
(declare-fun e!38143 () tuple2!5226)

(assert (=> b!57489 (= e!38143 (tuple2!5227 Nil!607 (_1!2719 lt!90257)))))

(declare-fun d!18348 () Bool)

(declare-fun e!38142 () Bool)

(assert (=> d!18348 e!38142))

(declare-fun c!4161 () Bool)

(assert (=> d!18348 (= c!4161 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!90695 () List!610)

(assert (=> d!18348 (= lt!90695 (_1!2724 e!38143))))

(declare-fun c!4160 () Bool)

(assert (=> d!18348 (= c!4160 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18348 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!18348 (= (bitStreamReadBitsIntoList!0 (_2!2718 lt!90260) (_1!2719 lt!90257) #b0000000000000000000000000000000000000000000000000000000000000001) lt!90695)))

(declare-fun b!57490 () Bool)

(declare-fun lt!90697 () (_ BitVec 64))

(declare-datatypes ((tuple2!5228 0))(
  ( (tuple2!5229 (_1!2725 Bool) (_2!2725 BitStream!2070)) )
))
(declare-fun lt!90696 () tuple2!5228)

(assert (=> b!57490 (= e!38143 (tuple2!5227 (Cons!606 (_1!2725 lt!90696) (bitStreamReadBitsIntoList!0 (_2!2718 lt!90260) (_2!2725 lt!90696) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!90697))) (_2!2725 lt!90696)))))

(declare-fun readBit!0 (BitStream!2070) tuple2!5228)

(assert (=> b!57490 (= lt!90696 (readBit!0 (_1!2719 lt!90257)))))

(assert (=> b!57490 (= lt!90697 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!57491 () Bool)

(declare-fun isEmpty!174 (List!610) Bool)

(assert (=> b!57491 (= e!38142 (isEmpty!174 lt!90695))))

(declare-fun b!57492 () Bool)

(declare-fun length!288 (List!610) Int)

(assert (=> b!57492 (= e!38142 (> (length!288 lt!90695) 0))))

(assert (= (and d!18348 c!4160) b!57489))

(assert (= (and d!18348 (not c!4160)) b!57490))

(assert (= (and d!18348 c!4161) b!57491))

(assert (= (and d!18348 (not c!4161)) b!57492))

(declare-fun m!90603 () Bool)

(assert (=> b!57490 m!90603))

(declare-fun m!90605 () Bool)

(assert (=> b!57490 m!90605))

(declare-fun m!90607 () Bool)

(assert (=> b!57491 m!90607))

(declare-fun m!90609 () Bool)

(assert (=> b!57492 m!90609))

(assert (=> b!57233 d!18348))

(declare-fun d!18350 () Bool)

(assert (=> d!18350 (= (array_inv!1094 (buf!1566 thiss!1379)) (bvsge (size!1191 (buf!1566 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!57238 d!18350))

(check-sat (not d!18330) (not b!57467) (not d!18314) (not b!57430) (not b!57409) (not b!57466) (not b!57442) (not b!57465) (not d!18308) (not b!57472) (not b!57407) (not d!18340) (not d!18252) (not bm!745) (not b!57490) (not d!18326) (not b!57491) (not d!18248) (not d!18334) (not b!57423) (not d!18312) (not b!57428) (not b!57425) (not b!57480) (not b!57280) (not b!57437) (not d!18338) (not b!57444) (not b!57492) (not b!57278) (not b!57426) (not b!57468) (not b!57439) (not d!18318) (not b!57471) (not b!57447) (not b!57405) (not b!57424) (not d!18324) (not b!57411) (not b!57406) (not d!18332) (not b!57469) (not b!57412) (not d!18320) (not b!57470))
(check-sat)
