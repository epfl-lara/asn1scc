; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4962 () Bool)

(assert start!4962)

(declare-fun b!19771 () Bool)

(declare-fun e!13233 () Bool)

(declare-fun e!13230 () Bool)

(assert (=> b!19771 (= e!13233 e!13230)))

(declare-fun res!17256 () Bool)

(assert (=> b!19771 (=> res!17256 e!13230)))

(declare-datatypes ((array!1429 0))(
  ( (array!1430 (arr!1049 (Array (_ BitVec 32) (_ BitVec 8))) (size!608 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1050 0))(
  ( (BitStream!1051 (buf!911 array!1429) (currentByte!2194 (_ BitVec 32)) (currentBit!2189 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1050)

(declare-datatypes ((Unit!1763 0))(
  ( (Unit!1764) )
))
(declare-datatypes ((tuple2!2292 0))(
  ( (tuple2!2293 (_1!1231 Unit!1763) (_2!1231 BitStream!1050)) )
))
(declare-fun lt!28120 () tuple2!2292)

(declare-fun isPrefixOf!0 (BitStream!1050 BitStream!1050) Bool)

(assert (=> b!19771 (= res!17256 (not (isPrefixOf!0 thiss!1379 (_2!1231 lt!28120))))))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!19771 (validate_offset_bits!1 ((_ sign_extend 32) (size!608 (buf!911 (_2!1231 lt!28120)))) ((_ sign_extend 32) (currentByte!2194 (_2!1231 lt!28120))) ((_ sign_extend 32) (currentBit!2189 (_2!1231 lt!28120))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!28122 () Unit!1763)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1050 BitStream!1050 (_ BitVec 64) (_ BitVec 64)) Unit!1763)

(assert (=> b!19771 (= lt!28122 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1231 lt!28120) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1429)

(declare-fun appendBitFromByte!0 (BitStream!1050 (_ BitVec 8) (_ BitVec 32)) tuple2!2292)

(assert (=> b!19771 (= lt!28120 (appendBitFromByte!0 thiss!1379 (select (arr!1049 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!19772 () Bool)

(declare-fun res!17258 () Bool)

(declare-fun e!13232 () Bool)

(assert (=> b!19772 (=> (not res!17258) (not e!13232))))

(assert (=> b!19772 (= res!17258 (validate_offset_bits!1 ((_ sign_extend 32) (size!608 (buf!911 thiss!1379))) ((_ sign_extend 32) (currentByte!2194 thiss!1379)) ((_ sign_extend 32) (currentBit!2189 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!19773 () Bool)

(declare-datatypes ((List!226 0))(
  ( (Nil!223) (Cons!222 (h!341 Bool) (t!976 List!226)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!1050 array!1429 (_ BitVec 64) (_ BitVec 64)) List!226)

(assert (=> b!19773 (= e!13230 (not (= (byteArrayBitContentToList!0 (_2!1231 lt!28120) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) Nil!223)))))

(declare-fun lt!28125 () List!226)

(declare-datatypes ((tuple2!2294 0))(
  ( (tuple2!2295 (_1!1232 BitStream!1050) (_2!1232 BitStream!1050)) )
))
(declare-fun lt!28126 () tuple2!2294)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1050 BitStream!1050 (_ BitVec 64)) List!226)

(assert (=> b!19773 (= lt!28125 (bitStreamReadBitsIntoList!0 (_2!1231 lt!28120) (_1!1232 lt!28126) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!19773 (validate_offset_bits!1 ((_ sign_extend 32) (size!608 (buf!911 (_2!1231 lt!28120)))) ((_ sign_extend 32) (currentByte!2194 thiss!1379)) ((_ sign_extend 32) (currentBit!2189 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!28123 () Unit!1763)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1050 array!1429 (_ BitVec 64)) Unit!1763)

(assert (=> b!19773 (= lt!28123 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!911 (_2!1231 lt!28120)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1050 BitStream!1050) tuple2!2294)

(assert (=> b!19773 (= lt!28126 (reader!0 thiss!1379 (_2!1231 lt!28120)))))

(declare-fun res!17255 () Bool)

(assert (=> start!4962 (=> (not res!17255) (not e!13232))))

(assert (=> start!4962 (= res!17255 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!608 srcBuffer!2))))))))

(assert (=> start!4962 e!13232))

(assert (=> start!4962 true))

(declare-fun array_inv!578 (array!1429) Bool)

(assert (=> start!4962 (array_inv!578 srcBuffer!2)))

(declare-fun e!13228 () Bool)

(declare-fun inv!12 (BitStream!1050) Bool)

(assert (=> start!4962 (and (inv!12 thiss!1379) e!13228)))

(declare-fun b!19774 () Bool)

(assert (=> b!19774 (= e!13232 (not e!13233))))

(declare-fun res!17257 () Bool)

(assert (=> b!19774 (=> res!17257 e!13233)))

(assert (=> b!19774 (= res!17257 (bvsge i!635 to!314))))

(assert (=> b!19774 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!28121 () Unit!1763)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1050) Unit!1763)

(assert (=> b!19774 (= lt!28121 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!28124 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!19774 (= lt!28124 (bitIndex!0 (size!608 (buf!911 thiss!1379)) (currentByte!2194 thiss!1379) (currentBit!2189 thiss!1379)))))

(declare-fun b!19775 () Bool)

(assert (=> b!19775 (= e!13228 (array_inv!578 (buf!911 thiss!1379)))))

(assert (= (and start!4962 res!17255) b!19772))

(assert (= (and b!19772 res!17258) b!19774))

(assert (= (and b!19774 (not res!17257)) b!19771))

(assert (= (and b!19771 (not res!17256)) b!19773))

(assert (= start!4962 b!19775))

(declare-fun m!26773 () Bool)

(assert (=> b!19775 m!26773))

(declare-fun m!26775 () Bool)

(assert (=> start!4962 m!26775))

(declare-fun m!26777 () Bool)

(assert (=> start!4962 m!26777))

(declare-fun m!26779 () Bool)

(assert (=> b!19773 m!26779))

(declare-fun m!26781 () Bool)

(assert (=> b!19773 m!26781))

(declare-fun m!26783 () Bool)

(assert (=> b!19773 m!26783))

(declare-fun m!26785 () Bool)

(assert (=> b!19773 m!26785))

(declare-fun m!26787 () Bool)

(assert (=> b!19773 m!26787))

(declare-fun m!26789 () Bool)

(assert (=> b!19771 m!26789))

(declare-fun m!26791 () Bool)

(assert (=> b!19771 m!26791))

(assert (=> b!19771 m!26791))

(declare-fun m!26793 () Bool)

(assert (=> b!19771 m!26793))

(declare-fun m!26795 () Bool)

(assert (=> b!19771 m!26795))

(declare-fun m!26797 () Bool)

(assert (=> b!19771 m!26797))

(declare-fun m!26799 () Bool)

(assert (=> b!19772 m!26799))

(declare-fun m!26801 () Bool)

(assert (=> b!19774 m!26801))

(declare-fun m!26803 () Bool)

(assert (=> b!19774 m!26803))

(declare-fun m!26805 () Bool)

(assert (=> b!19774 m!26805))

(check-sat (not b!19771) (not start!4962) (not b!19774) (not b!19773) (not b!19772) (not b!19775))
(check-sat)
(get-model)

(declare-fun d!6432 () Bool)

(assert (=> d!6432 (= (array_inv!578 srcBuffer!2) (bvsge (size!608 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!4962 d!6432))

(declare-fun d!6434 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!6434 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2189 thiss!1379) (currentByte!2194 thiss!1379) (size!608 (buf!911 thiss!1379))))))

(declare-fun bs!1895 () Bool)

(assert (= bs!1895 d!6434))

(declare-fun m!26841 () Bool)

(assert (=> bs!1895 m!26841))

(assert (=> start!4962 d!6434))

(declare-datatypes ((tuple2!2300 0))(
  ( (tuple2!2301 (_1!1235 List!226) (_2!1235 BitStream!1050)) )
))
(declare-fun e!13256 () tuple2!2300)

(declare-fun lt!28154 () (_ BitVec 64))

(declare-fun b!19800 () Bool)

(declare-datatypes ((tuple2!2304 0))(
  ( (tuple2!2305 (_1!1237 Bool) (_2!1237 BitStream!1050)) )
))
(declare-fun lt!28155 () tuple2!2304)

(assert (=> b!19800 (= e!13256 (tuple2!2301 (Cons!222 (_1!1237 lt!28155) (bitStreamReadBitsIntoList!0 (_2!1231 lt!28120) (_2!1237 lt!28155) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!28154))) (_2!1237 lt!28155)))))

(declare-fun readBit!0 (BitStream!1050) tuple2!2304)

(assert (=> b!19800 (= lt!28155 (readBit!0 (_1!1232 lt!28126)))))

(assert (=> b!19800 (= lt!28154 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!19801 () Bool)

(declare-fun e!13257 () Bool)

(declare-fun lt!28156 () List!226)

(declare-fun isEmpty!50 (List!226) Bool)

(assert (=> b!19801 (= e!13257 (isEmpty!50 lt!28156))))

(declare-fun b!19799 () Bool)

(assert (=> b!19799 (= e!13256 (tuple2!2301 Nil!223 (_1!1232 lt!28126)))))

(declare-fun d!6436 () Bool)

(assert (=> d!6436 e!13257))

(declare-fun c!1401 () Bool)

(assert (=> d!6436 (= c!1401 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!6436 (= lt!28156 (_1!1235 e!13256))))

(declare-fun c!1402 () Bool)

(assert (=> d!6436 (= c!1402 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!6436 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!6436 (= (bitStreamReadBitsIntoList!0 (_2!1231 lt!28120) (_1!1232 lt!28126) #b0000000000000000000000000000000000000000000000000000000000000001) lt!28156)))

(declare-fun b!19802 () Bool)

(declare-fun length!45 (List!226) Int)

(assert (=> b!19802 (= e!13257 (> (length!45 lt!28156) 0))))

(assert (= (and d!6436 c!1402) b!19799))

(assert (= (and d!6436 (not c!1402)) b!19800))

(assert (= (and d!6436 c!1401) b!19801))

(assert (= (and d!6436 (not c!1401)) b!19802))

(declare-fun m!26843 () Bool)

(assert (=> b!19800 m!26843))

(declare-fun m!26845 () Bool)

(assert (=> b!19800 m!26845))

(declare-fun m!26847 () Bool)

(assert (=> b!19801 m!26847))

(declare-fun m!26849 () Bool)

(assert (=> b!19802 m!26849))

(assert (=> b!19773 d!6436))

(declare-fun d!6440 () Bool)

(declare-fun c!1411 () Bool)

(assert (=> d!6440 (= c!1411 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!13266 () List!226)

(assert (=> d!6440 (= (byteArrayBitContentToList!0 (_2!1231 lt!28120) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!13266)))

(declare-fun b!19819 () Bool)

(assert (=> b!19819 (= e!13266 Nil!223)))

(declare-fun b!19820 () Bool)

(assert (=> b!19820 (= e!13266 (Cons!222 (not (= (bvand ((_ sign_extend 24) (select (arr!1049 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1231 lt!28120) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!6440 c!1411) b!19819))

(assert (= (and d!6440 (not c!1411)) b!19820))

(assert (=> b!19820 m!26791))

(declare-fun m!26859 () Bool)

(assert (=> b!19820 m!26859))

(declare-fun m!26861 () Bool)

(assert (=> b!19820 m!26861))

(assert (=> b!19773 d!6440))

(declare-fun d!6444 () Bool)

(assert (=> d!6444 (validate_offset_bits!1 ((_ sign_extend 32) (size!608 (buf!911 (_2!1231 lt!28120)))) ((_ sign_extend 32) (currentByte!2194 thiss!1379)) ((_ sign_extend 32) (currentBit!2189 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!28168 () Unit!1763)

(declare-fun choose!9 (BitStream!1050 array!1429 (_ BitVec 64) BitStream!1050) Unit!1763)

(assert (=> d!6444 (= lt!28168 (choose!9 thiss!1379 (buf!911 (_2!1231 lt!28120)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1051 (buf!911 (_2!1231 lt!28120)) (currentByte!2194 thiss!1379) (currentBit!2189 thiss!1379))))))

(assert (=> d!6444 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!911 (_2!1231 lt!28120)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!28168)))

(declare-fun bs!1896 () Bool)

(assert (= bs!1896 d!6444))

(assert (=> bs!1896 m!26785))

(declare-fun m!26863 () Bool)

(assert (=> bs!1896 m!26863))

(assert (=> b!19773 d!6444))

(declare-fun d!6448 () Bool)

(declare-fun e!13282 () Bool)

(assert (=> d!6448 e!13282))

(declare-fun res!17290 () Bool)

(assert (=> d!6448 (=> (not res!17290) (not e!13282))))

(declare-fun lt!28302 () tuple2!2294)

(assert (=> d!6448 (= res!17290 (isPrefixOf!0 (_1!1232 lt!28302) (_2!1232 lt!28302)))))

(declare-fun lt!28296 () BitStream!1050)

(assert (=> d!6448 (= lt!28302 (tuple2!2295 lt!28296 (_2!1231 lt!28120)))))

(declare-fun lt!28309 () Unit!1763)

(declare-fun lt!28310 () Unit!1763)

(assert (=> d!6448 (= lt!28309 lt!28310)))

(assert (=> d!6448 (isPrefixOf!0 lt!28296 (_2!1231 lt!28120))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1050 BitStream!1050 BitStream!1050) Unit!1763)

(assert (=> d!6448 (= lt!28310 (lemmaIsPrefixTransitive!0 lt!28296 (_2!1231 lt!28120) (_2!1231 lt!28120)))))

(declare-fun lt!28306 () Unit!1763)

(declare-fun lt!28308 () Unit!1763)

(assert (=> d!6448 (= lt!28306 lt!28308)))

(assert (=> d!6448 (isPrefixOf!0 lt!28296 (_2!1231 lt!28120))))

(assert (=> d!6448 (= lt!28308 (lemmaIsPrefixTransitive!0 lt!28296 thiss!1379 (_2!1231 lt!28120)))))

(declare-fun lt!28304 () Unit!1763)

(declare-fun e!13283 () Unit!1763)

(assert (=> d!6448 (= lt!28304 e!13283)))

(declare-fun c!1421 () Bool)

(assert (=> d!6448 (= c!1421 (not (= (size!608 (buf!911 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!28297 () Unit!1763)

(declare-fun lt!28294 () Unit!1763)

(assert (=> d!6448 (= lt!28297 lt!28294)))

(assert (=> d!6448 (isPrefixOf!0 (_2!1231 lt!28120) (_2!1231 lt!28120))))

(assert (=> d!6448 (= lt!28294 (lemmaIsPrefixRefl!0 (_2!1231 lt!28120)))))

(declare-fun lt!28298 () Unit!1763)

(declare-fun lt!28305 () Unit!1763)

(assert (=> d!6448 (= lt!28298 lt!28305)))

(assert (=> d!6448 (= lt!28305 (lemmaIsPrefixRefl!0 (_2!1231 lt!28120)))))

(declare-fun lt!28303 () Unit!1763)

(declare-fun lt!28300 () Unit!1763)

(assert (=> d!6448 (= lt!28303 lt!28300)))

(assert (=> d!6448 (isPrefixOf!0 lt!28296 lt!28296)))

(assert (=> d!6448 (= lt!28300 (lemmaIsPrefixRefl!0 lt!28296))))

(declare-fun lt!28292 () Unit!1763)

(declare-fun lt!28301 () Unit!1763)

(assert (=> d!6448 (= lt!28292 lt!28301)))

(assert (=> d!6448 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!6448 (= lt!28301 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!6448 (= lt!28296 (BitStream!1051 (buf!911 (_2!1231 lt!28120)) (currentByte!2194 thiss!1379) (currentBit!2189 thiss!1379)))))

(assert (=> d!6448 (isPrefixOf!0 thiss!1379 (_2!1231 lt!28120))))

(assert (=> d!6448 (= (reader!0 thiss!1379 (_2!1231 lt!28120)) lt!28302)))

(declare-fun b!19857 () Bool)

(declare-fun Unit!1767 () Unit!1763)

(assert (=> b!19857 (= e!13283 Unit!1767)))

(declare-fun b!19858 () Bool)

(declare-fun res!17291 () Bool)

(assert (=> b!19858 (=> (not res!17291) (not e!13282))))

(assert (=> b!19858 (= res!17291 (isPrefixOf!0 (_2!1232 lt!28302) (_2!1231 lt!28120)))))

(declare-fun b!19859 () Bool)

(declare-fun res!17289 () Bool)

(assert (=> b!19859 (=> (not res!17289) (not e!13282))))

(assert (=> b!19859 (= res!17289 (isPrefixOf!0 (_1!1232 lt!28302) thiss!1379))))

(declare-fun lt!28293 () (_ BitVec 64))

(declare-fun b!19860 () Bool)

(declare-fun lt!28295 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1050 (_ BitVec 64)) BitStream!1050)

(assert (=> b!19860 (= e!13282 (= (_1!1232 lt!28302) (withMovedBitIndex!0 (_2!1232 lt!28302) (bvsub lt!28295 lt!28293))))))

(assert (=> b!19860 (or (= (bvand lt!28295 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!28293 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!28295 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!28295 lt!28293) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!19860 (= lt!28293 (bitIndex!0 (size!608 (buf!911 (_2!1231 lt!28120))) (currentByte!2194 (_2!1231 lt!28120)) (currentBit!2189 (_2!1231 lt!28120))))))

(assert (=> b!19860 (= lt!28295 (bitIndex!0 (size!608 (buf!911 thiss!1379)) (currentByte!2194 thiss!1379) (currentBit!2189 thiss!1379)))))

(declare-fun b!19861 () Bool)

(declare-fun lt!28311 () Unit!1763)

(assert (=> b!19861 (= e!13283 lt!28311)))

(declare-fun lt!28299 () (_ BitVec 64))

(assert (=> b!19861 (= lt!28299 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!28307 () (_ BitVec 64))

(assert (=> b!19861 (= lt!28307 (bitIndex!0 (size!608 (buf!911 thiss!1379)) (currentByte!2194 thiss!1379) (currentBit!2189 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1429 array!1429 (_ BitVec 64) (_ BitVec 64)) Unit!1763)

(assert (=> b!19861 (= lt!28311 (arrayBitRangesEqSymmetric!0 (buf!911 thiss!1379) (buf!911 (_2!1231 lt!28120)) lt!28299 lt!28307))))

(declare-fun arrayBitRangesEq!0 (array!1429 array!1429 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!19861 (arrayBitRangesEq!0 (buf!911 (_2!1231 lt!28120)) (buf!911 thiss!1379) lt!28299 lt!28307)))

(assert (= (and d!6448 c!1421) b!19861))

(assert (= (and d!6448 (not c!1421)) b!19857))

(assert (= (and d!6448 res!17290) b!19859))

(assert (= (and b!19859 res!17289) b!19858))

(assert (= (and b!19858 res!17291) b!19860))

(declare-fun m!26871 () Bool)

(assert (=> b!19859 m!26871))

(declare-fun m!26875 () Bool)

(assert (=> d!6448 m!26875))

(assert (=> d!6448 m!26803))

(declare-fun m!26879 () Bool)

(assert (=> d!6448 m!26879))

(declare-fun m!26881 () Bool)

(assert (=> d!6448 m!26881))

(assert (=> d!6448 m!26789))

(declare-fun m!26889 () Bool)

(assert (=> d!6448 m!26889))

(assert (=> d!6448 m!26801))

(declare-fun m!26895 () Bool)

(assert (=> d!6448 m!26895))

(declare-fun m!26897 () Bool)

(assert (=> d!6448 m!26897))

(declare-fun m!26901 () Bool)

(assert (=> d!6448 m!26901))

(declare-fun m!26903 () Bool)

(assert (=> d!6448 m!26903))

(assert (=> b!19861 m!26805))

(declare-fun m!26911 () Bool)

(assert (=> b!19861 m!26911))

(declare-fun m!26913 () Bool)

(assert (=> b!19861 m!26913))

(declare-fun m!26917 () Bool)

(assert (=> b!19858 m!26917))

(declare-fun m!26919 () Bool)

(assert (=> b!19860 m!26919))

(declare-fun m!26921 () Bool)

(assert (=> b!19860 m!26921))

(assert (=> b!19860 m!26805))

(assert (=> b!19773 d!6448))

(declare-fun d!6456 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!6456 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!608 (buf!911 (_2!1231 lt!28120)))) ((_ sign_extend 32) (currentByte!2194 thiss!1379)) ((_ sign_extend 32) (currentBit!2189 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!608 (buf!911 (_2!1231 lt!28120)))) ((_ sign_extend 32) (currentByte!2194 thiss!1379)) ((_ sign_extend 32) (currentBit!2189 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!1898 () Bool)

(assert (= bs!1898 d!6456))

(declare-fun m!26927 () Bool)

(assert (=> bs!1898 m!26927))

(assert (=> b!19773 d!6456))

(declare-fun d!6458 () Bool)

(assert (=> d!6458 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!608 (buf!911 thiss!1379))) ((_ sign_extend 32) (currentByte!2194 thiss!1379)) ((_ sign_extend 32) (currentBit!2189 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!608 (buf!911 thiss!1379))) ((_ sign_extend 32) (currentByte!2194 thiss!1379)) ((_ sign_extend 32) (currentBit!2189 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!1900 () Bool)

(assert (= bs!1900 d!6458))

(declare-fun m!26931 () Bool)

(assert (=> bs!1900 m!26931))

(assert (=> b!19772 d!6458))

(declare-fun d!6462 () Bool)

(declare-fun res!17305 () Bool)

(declare-fun e!13293 () Bool)

(assert (=> d!6462 (=> (not res!17305) (not e!13293))))

(assert (=> d!6462 (= res!17305 (= (size!608 (buf!911 thiss!1379)) (size!608 (buf!911 (_2!1231 lt!28120)))))))

(assert (=> d!6462 (= (isPrefixOf!0 thiss!1379 (_2!1231 lt!28120)) e!13293)))

(declare-fun b!19878 () Bool)

(declare-fun res!17306 () Bool)

(assert (=> b!19878 (=> (not res!17306) (not e!13293))))

(assert (=> b!19878 (= res!17306 (bvsle (bitIndex!0 (size!608 (buf!911 thiss!1379)) (currentByte!2194 thiss!1379) (currentBit!2189 thiss!1379)) (bitIndex!0 (size!608 (buf!911 (_2!1231 lt!28120))) (currentByte!2194 (_2!1231 lt!28120)) (currentBit!2189 (_2!1231 lt!28120)))))))

(declare-fun b!19879 () Bool)

(declare-fun e!13292 () Bool)

(assert (=> b!19879 (= e!13293 e!13292)))

(declare-fun res!17304 () Bool)

(assert (=> b!19879 (=> res!17304 e!13292)))

(assert (=> b!19879 (= res!17304 (= (size!608 (buf!911 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!19880 () Bool)

(assert (=> b!19880 (= e!13292 (arrayBitRangesEq!0 (buf!911 thiss!1379) (buf!911 (_2!1231 lt!28120)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!608 (buf!911 thiss!1379)) (currentByte!2194 thiss!1379) (currentBit!2189 thiss!1379))))))

(assert (= (and d!6462 res!17305) b!19878))

(assert (= (and b!19878 res!17306) b!19879))

(assert (= (and b!19879 (not res!17304)) b!19880))

(assert (=> b!19878 m!26805))

(assert (=> b!19878 m!26921))

(assert (=> b!19880 m!26805))

(assert (=> b!19880 m!26805))

(declare-fun m!26963 () Bool)

(assert (=> b!19880 m!26963))

(assert (=> b!19771 d!6462))

(declare-fun d!6468 () Bool)

(assert (=> d!6468 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!608 (buf!911 (_2!1231 lt!28120)))) ((_ sign_extend 32) (currentByte!2194 (_2!1231 lt!28120))) ((_ sign_extend 32) (currentBit!2189 (_2!1231 lt!28120))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!608 (buf!911 (_2!1231 lt!28120)))) ((_ sign_extend 32) (currentByte!2194 (_2!1231 lt!28120))) ((_ sign_extend 32) (currentBit!2189 (_2!1231 lt!28120)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!1902 () Bool)

(assert (= bs!1902 d!6468))

(declare-fun m!26965 () Bool)

(assert (=> bs!1902 m!26965))

(assert (=> b!19771 d!6468))

(declare-fun d!6470 () Bool)

(declare-fun e!13306 () Bool)

(assert (=> d!6470 e!13306))

(declare-fun res!17318 () Bool)

(assert (=> d!6470 (=> (not res!17318) (not e!13306))))

(assert (=> d!6470 (= res!17318 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!28360 () Unit!1763)

(declare-fun choose!27 (BitStream!1050 BitStream!1050 (_ BitVec 64) (_ BitVec 64)) Unit!1763)

(assert (=> d!6470 (= lt!28360 (choose!27 thiss!1379 (_2!1231 lt!28120) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!6470 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!6470 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1231 lt!28120) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!28360)))

(declare-fun b!19900 () Bool)

(assert (=> b!19900 (= e!13306 (validate_offset_bits!1 ((_ sign_extend 32) (size!608 (buf!911 (_2!1231 lt!28120)))) ((_ sign_extend 32) (currentByte!2194 (_2!1231 lt!28120))) ((_ sign_extend 32) (currentBit!2189 (_2!1231 lt!28120))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!6470 res!17318) b!19900))

(declare-fun m!26971 () Bool)

(assert (=> d!6470 m!26971))

(assert (=> b!19900 m!26795))

(assert (=> b!19771 d!6470))

(declare-fun b!19960 () Bool)

(declare-fun e!13343 () Bool)

(declare-datatypes ((tuple2!2308 0))(
  ( (tuple2!2309 (_1!1239 BitStream!1050) (_2!1239 Bool)) )
))
(declare-fun lt!28429 () tuple2!2308)

(declare-fun lt!28428 () tuple2!2292)

(assert (=> b!19960 (= e!13343 (= (bitIndex!0 (size!608 (buf!911 (_1!1239 lt!28429))) (currentByte!2194 (_1!1239 lt!28429)) (currentBit!2189 (_1!1239 lt!28429))) (bitIndex!0 (size!608 (buf!911 (_2!1231 lt!28428))) (currentByte!2194 (_2!1231 lt!28428)) (currentBit!2189 (_2!1231 lt!28428)))))))

(declare-fun b!19961 () Bool)

(declare-fun e!13340 () Bool)

(assert (=> b!19961 (= e!13340 e!13343)))

(declare-fun res!17367 () Bool)

(assert (=> b!19961 (=> (not res!17367) (not e!13343))))

(declare-fun lt!28427 () (_ BitVec 8))

(assert (=> b!19961 (= res!17367 (and (= (_2!1239 lt!28429) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1049 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!28427)) #b00000000000000000000000000000000))) (= (_1!1239 lt!28429) (_2!1231 lt!28428))))))

(declare-datatypes ((tuple2!2310 0))(
  ( (tuple2!2311 (_1!1240 array!1429) (_2!1240 BitStream!1050)) )
))
(declare-fun lt!28432 () tuple2!2310)

(declare-fun lt!28431 () BitStream!1050)

(declare-fun readBits!0 (BitStream!1050 (_ BitVec 64)) tuple2!2310)

(assert (=> b!19961 (= lt!28432 (readBits!0 lt!28431 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!1050) tuple2!2308)

(assert (=> b!19961 (= lt!28429 (readBitPure!0 lt!28431))))

(declare-fun readerFrom!0 (BitStream!1050 (_ BitVec 32) (_ BitVec 32)) BitStream!1050)

(assert (=> b!19961 (= lt!28431 (readerFrom!0 (_2!1231 lt!28428) (currentBit!2189 thiss!1379) (currentByte!2194 thiss!1379)))))

(declare-fun b!19962 () Bool)

(declare-fun res!17366 () Bool)

(declare-fun e!13341 () Bool)

(assert (=> b!19962 (=> (not res!17366) (not e!13341))))

(declare-fun lt!28424 () tuple2!2292)

(assert (=> b!19962 (= res!17366 (isPrefixOf!0 thiss!1379 (_2!1231 lt!28424)))))

(declare-fun b!19963 () Bool)

(declare-fun e!13342 () Bool)

(declare-fun lt!28421 () tuple2!2308)

(assert (=> b!19963 (= e!13342 (= (bitIndex!0 (size!608 (buf!911 (_1!1239 lt!28421))) (currentByte!2194 (_1!1239 lt!28421)) (currentBit!2189 (_1!1239 lt!28421))) (bitIndex!0 (size!608 (buf!911 (_2!1231 lt!28424))) (currentByte!2194 (_2!1231 lt!28424)) (currentBit!2189 (_2!1231 lt!28424)))))))

(declare-fun b!19964 () Bool)

(declare-fun res!17369 () Bool)

(assert (=> b!19964 (=> (not res!17369) (not e!13341))))

(assert (=> b!19964 (= res!17369 (= (bitIndex!0 (size!608 (buf!911 (_2!1231 lt!28424))) (currentByte!2194 (_2!1231 lt!28424)) (currentBit!2189 (_2!1231 lt!28424))) (bvadd (bitIndex!0 (size!608 (buf!911 thiss!1379)) (currentByte!2194 thiss!1379) (currentBit!2189 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!19965 () Bool)

(declare-fun res!17368 () Bool)

(assert (=> b!19965 (=> (not res!17368) (not e!13340))))

(declare-fun lt!28422 () (_ BitVec 64))

(declare-fun lt!28423 () (_ BitVec 64))

(assert (=> b!19965 (= res!17368 (= (bitIndex!0 (size!608 (buf!911 (_2!1231 lt!28428))) (currentByte!2194 (_2!1231 lt!28428)) (currentBit!2189 (_2!1231 lt!28428))) (bvadd lt!28423 lt!28422)))))

(assert (=> b!19965 (or (not (= (bvand lt!28423 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!28422 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!28423 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!28423 lt!28422) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!19965 (= lt!28422 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!19965 (= lt!28423 (bitIndex!0 (size!608 (buf!911 thiss!1379)) (currentByte!2194 thiss!1379) (currentBit!2189 thiss!1379)))))

(declare-fun b!19966 () Bool)

(declare-fun res!17372 () Bool)

(assert (=> b!19966 (=> (not res!17372) (not e!13340))))

(assert (=> b!19966 (= res!17372 (isPrefixOf!0 thiss!1379 (_2!1231 lt!28428)))))

(declare-fun d!6476 () Bool)

(assert (=> d!6476 e!13340))

(declare-fun res!17371 () Bool)

(assert (=> d!6476 (=> (not res!17371) (not e!13340))))

(assert (=> d!6476 (= res!17371 (= (size!608 (buf!911 (_2!1231 lt!28428))) (size!608 (buf!911 thiss!1379))))))

(declare-fun lt!28426 () array!1429)

(assert (=> d!6476 (= lt!28427 (select (arr!1049 lt!28426) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!6476 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!608 lt!28426)))))

(assert (=> d!6476 (= lt!28426 (array!1430 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!28430 () tuple2!2292)

(assert (=> d!6476 (= lt!28428 (tuple2!2293 (_1!1231 lt!28430) (_2!1231 lt!28430)))))

(assert (=> d!6476 (= lt!28430 lt!28424)))

(assert (=> d!6476 e!13341))

(declare-fun res!17373 () Bool)

(assert (=> d!6476 (=> (not res!17373) (not e!13341))))

(assert (=> d!6476 (= res!17373 (= (size!608 (buf!911 thiss!1379)) (size!608 (buf!911 (_2!1231 lt!28424)))))))

(declare-fun lt!28425 () Bool)

(declare-fun appendBit!0 (BitStream!1050 Bool) tuple2!2292)

(assert (=> d!6476 (= lt!28424 (appendBit!0 thiss!1379 lt!28425))))

(assert (=> d!6476 (= lt!28425 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1049 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!6476 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!6476 (= (appendBitFromByte!0 thiss!1379 (select (arr!1049 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!28428)))

(declare-fun b!19967 () Bool)

(assert (=> b!19967 (= e!13341 e!13342)))

(declare-fun res!17370 () Bool)

(assert (=> b!19967 (=> (not res!17370) (not e!13342))))

(assert (=> b!19967 (= res!17370 (and (= (_2!1239 lt!28421) lt!28425) (= (_1!1239 lt!28421) (_2!1231 lt!28424))))))

(assert (=> b!19967 (= lt!28421 (readBitPure!0 (readerFrom!0 (_2!1231 lt!28424) (currentBit!2189 thiss!1379) (currentByte!2194 thiss!1379))))))

(assert (= (and d!6476 res!17373) b!19964))

(assert (= (and b!19964 res!17369) b!19962))

(assert (= (and b!19962 res!17366) b!19967))

(assert (= (and b!19967 res!17370) b!19963))

(assert (= (and d!6476 res!17371) b!19965))

(assert (= (and b!19965 res!17368) b!19966))

(assert (= (and b!19966 res!17372) b!19961))

(assert (= (and b!19961 res!17367) b!19960))

(declare-fun m!26997 () Bool)

(assert (=> b!19961 m!26997))

(declare-fun m!26999 () Bool)

(assert (=> b!19961 m!26999))

(declare-fun m!27001 () Bool)

(assert (=> b!19961 m!27001))

(declare-fun m!27003 () Bool)

(assert (=> b!19962 m!27003))

(declare-fun m!27005 () Bool)

(assert (=> b!19963 m!27005))

(declare-fun m!27007 () Bool)

(assert (=> b!19963 m!27007))

(declare-fun m!27009 () Bool)

(assert (=> d!6476 m!27009))

(declare-fun m!27011 () Bool)

(assert (=> d!6476 m!27011))

(assert (=> d!6476 m!26859))

(assert (=> b!19964 m!27007))

(assert (=> b!19964 m!26805))

(declare-fun m!27013 () Bool)

(assert (=> b!19966 m!27013))

(declare-fun m!27015 () Bool)

(assert (=> b!19967 m!27015))

(assert (=> b!19967 m!27015))

(declare-fun m!27019 () Bool)

(assert (=> b!19967 m!27019))

(declare-fun m!27023 () Bool)

(assert (=> b!19960 m!27023))

(declare-fun m!27027 () Bool)

(assert (=> b!19960 m!27027))

(assert (=> b!19965 m!27027))

(assert (=> b!19965 m!26805))

(assert (=> b!19771 d!6476))

(declare-fun d!6496 () Bool)

(assert (=> d!6496 (= (array_inv!578 (buf!911 thiss!1379)) (bvsge (size!608 (buf!911 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!19775 d!6496))

(declare-fun d!6498 () Bool)

(declare-fun res!17383 () Bool)

(declare-fun e!13349 () Bool)

(assert (=> d!6498 (=> (not res!17383) (not e!13349))))

(assert (=> d!6498 (= res!17383 (= (size!608 (buf!911 thiss!1379)) (size!608 (buf!911 thiss!1379))))))

(assert (=> d!6498 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!13349)))

(declare-fun b!19976 () Bool)

(declare-fun res!17384 () Bool)

(assert (=> b!19976 (=> (not res!17384) (not e!13349))))

(assert (=> b!19976 (= res!17384 (bvsle (bitIndex!0 (size!608 (buf!911 thiss!1379)) (currentByte!2194 thiss!1379) (currentBit!2189 thiss!1379)) (bitIndex!0 (size!608 (buf!911 thiss!1379)) (currentByte!2194 thiss!1379) (currentBit!2189 thiss!1379))))))

(declare-fun b!19977 () Bool)

(declare-fun e!13348 () Bool)

(assert (=> b!19977 (= e!13349 e!13348)))

(declare-fun res!17382 () Bool)

(assert (=> b!19977 (=> res!17382 e!13348)))

(assert (=> b!19977 (= res!17382 (= (size!608 (buf!911 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!19978 () Bool)

(assert (=> b!19978 (= e!13348 (arrayBitRangesEq!0 (buf!911 thiss!1379) (buf!911 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!608 (buf!911 thiss!1379)) (currentByte!2194 thiss!1379) (currentBit!2189 thiss!1379))))))

(assert (= (and d!6498 res!17383) b!19976))

(assert (= (and b!19976 res!17384) b!19977))

(assert (= (and b!19977 (not res!17382)) b!19978))

(assert (=> b!19976 m!26805))

(assert (=> b!19976 m!26805))

(assert (=> b!19978 m!26805))

(assert (=> b!19978 m!26805))

(declare-fun m!27049 () Bool)

(assert (=> b!19978 m!27049))

(assert (=> b!19774 d!6498))

(declare-fun d!6502 () Bool)

(assert (=> d!6502 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!28447 () Unit!1763)

(declare-fun choose!11 (BitStream!1050) Unit!1763)

(assert (=> d!6502 (= lt!28447 (choose!11 thiss!1379))))

(assert (=> d!6502 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!28447)))

(declare-fun bs!1908 () Bool)

(assert (= bs!1908 d!6502))

(assert (=> bs!1908 m!26801))

(declare-fun m!27053 () Bool)

(assert (=> bs!1908 m!27053))

(assert (=> b!19774 d!6502))

(declare-fun d!6508 () Bool)

(declare-fun e!13364 () Bool)

(assert (=> d!6508 e!13364))

(declare-fun res!17412 () Bool)

(assert (=> d!6508 (=> (not res!17412) (not e!13364))))

(declare-fun lt!28501 () (_ BitVec 64))

(declare-fun lt!28503 () (_ BitVec 64))

(declare-fun lt!28504 () (_ BitVec 64))

(assert (=> d!6508 (= res!17412 (= lt!28501 (bvsub lt!28503 lt!28504)))))

(assert (=> d!6508 (or (= (bvand lt!28503 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!28504 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!28503 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!28503 lt!28504) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!6508 (= lt!28504 (remainingBits!0 ((_ sign_extend 32) (size!608 (buf!911 thiss!1379))) ((_ sign_extend 32) (currentByte!2194 thiss!1379)) ((_ sign_extend 32) (currentBit!2189 thiss!1379))))))

(declare-fun lt!28502 () (_ BitVec 64))

(declare-fun lt!28499 () (_ BitVec 64))

(assert (=> d!6508 (= lt!28503 (bvmul lt!28502 lt!28499))))

(assert (=> d!6508 (or (= lt!28502 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!28499 (bvsdiv (bvmul lt!28502 lt!28499) lt!28502)))))

(assert (=> d!6508 (= lt!28499 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!6508 (= lt!28502 ((_ sign_extend 32) (size!608 (buf!911 thiss!1379))))))

(assert (=> d!6508 (= lt!28501 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2194 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2189 thiss!1379))))))

(assert (=> d!6508 (invariant!0 (currentBit!2189 thiss!1379) (currentByte!2194 thiss!1379) (size!608 (buf!911 thiss!1379)))))

(assert (=> d!6508 (= (bitIndex!0 (size!608 (buf!911 thiss!1379)) (currentByte!2194 thiss!1379) (currentBit!2189 thiss!1379)) lt!28501)))

(declare-fun b!20007 () Bool)

(declare-fun res!17413 () Bool)

(assert (=> b!20007 (=> (not res!17413) (not e!13364))))

(assert (=> b!20007 (= res!17413 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!28501))))

(declare-fun b!20008 () Bool)

(declare-fun lt!28500 () (_ BitVec 64))

(assert (=> b!20008 (= e!13364 (bvsle lt!28501 (bvmul lt!28500 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!20008 (or (= lt!28500 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!28500 #b0000000000000000000000000000000000000000000000000000000000001000) lt!28500)))))

(assert (=> b!20008 (= lt!28500 ((_ sign_extend 32) (size!608 (buf!911 thiss!1379))))))

(assert (= (and d!6508 res!17412) b!20007))

(assert (= (and b!20007 res!17413) b!20008))

(assert (=> d!6508 m!26931))

(assert (=> d!6508 m!26841))

(assert (=> b!19774 d!6508))

(check-sat (not b!19964) (not b!19878) (not b!19880) (not b!19978) (not b!19860) (not b!19967) (not b!19960) (not b!19820) (not d!6456) (not d!6434) (not b!19859) (not b!19800) (not b!19861) (not d!6444) (not d!6476) (not b!19976) (not b!19858) (not b!19801) (not b!19961) (not b!19963) (not d!6508) (not d!6448) (not b!19966) (not d!6502) (not d!6458) (not b!19900) (not b!19965) (not b!19802) (not b!19962) (not d!6470) (not d!6468))
