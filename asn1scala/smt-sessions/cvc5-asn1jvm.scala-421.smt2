; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10878 () Bool)

(assert start!10878)

(declare-fun b!54167 () Bool)

(declare-fun e!36171 () Bool)

(declare-datatypes ((array!2548 0))(
  ( (array!2549 (arr!1700 (Array (_ BitVec 32) (_ BitVec 8))) (size!1163 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2014 0))(
  ( (BitStream!2015 (buf!1517 array!2548) (currentByte!3090 (_ BitVec 32)) (currentBit!3085 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2014)

(declare-fun array_inv!1066 (array!2548) Bool)

(assert (=> b!54167 (= e!36171 (array_inv!1066 (buf!1517 thiss!1379)))))

(declare-fun b!54168 () Bool)

(declare-fun e!36172 () Bool)

(declare-fun e!36168 () Bool)

(assert (=> b!54168 (= e!36172 e!36168)))

(declare-fun res!45228 () Bool)

(assert (=> b!54168 (=> res!45228 e!36168)))

(declare-datatypes ((Unit!3735 0))(
  ( (Unit!3736) )
))
(declare-datatypes ((tuple2!4938 0))(
  ( (tuple2!4939 (_1!2580 Unit!3735) (_2!2580 BitStream!2014)) )
))
(declare-fun lt!83775 () tuple2!4938)

(declare-fun isPrefixOf!0 (BitStream!2014 BitStream!2014) Bool)

(assert (=> b!54168 (= res!45228 (not (isPrefixOf!0 thiss!1379 (_2!2580 lt!83775))))))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!54168 (validate_offset_bits!1 ((_ sign_extend 32) (size!1163 (buf!1517 (_2!2580 lt!83775)))) ((_ sign_extend 32) (currentByte!3090 (_2!2580 lt!83775))) ((_ sign_extend 32) (currentBit!3085 (_2!2580 lt!83775))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!83779 () Unit!3735)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2014 BitStream!2014 (_ BitVec 64) (_ BitVec 64)) Unit!3735)

(assert (=> b!54168 (= lt!83779 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2580 lt!83775) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2548)

(declare-fun appendBitFromByte!0 (BitStream!2014 (_ BitVec 8) (_ BitVec 32)) tuple2!4938)

(assert (=> b!54168 (= lt!83775 (appendBitFromByte!0 thiss!1379 (select (arr!1700 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!54169 () Bool)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2014 array!2548 (_ BitVec 64) (_ BitVec 64)) tuple2!4938)

(assert (=> b!54169 (= e!36168 (isPrefixOf!0 (_2!2580 lt!83775) (_2!2580 (appendBitsMSBFirstLoop!0 (_2!2580 lt!83775) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))))

(declare-fun e!36173 () Bool)

(assert (=> b!54169 e!36173))

(declare-fun res!45229 () Bool)

(assert (=> b!54169 (=> (not res!45229) (not e!36173))))

(assert (=> b!54169 (= res!45229 (validate_offset_bits!1 ((_ sign_extend 32) (size!1163 (buf!1517 (_2!2580 lt!83775)))) ((_ sign_extend 32) (currentByte!3090 thiss!1379)) ((_ sign_extend 32) (currentBit!3085 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!83778 () Unit!3735)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2014 array!2548 (_ BitVec 64)) Unit!3735)

(assert (=> b!54169 (= lt!83778 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1517 (_2!2580 lt!83775)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!4940 0))(
  ( (tuple2!4941 (_1!2581 BitStream!2014) (_2!2581 BitStream!2014)) )
))
(declare-fun lt!83774 () tuple2!4940)

(declare-fun reader!0 (BitStream!2014 BitStream!2014) tuple2!4940)

(assert (=> b!54169 (= lt!83774 (reader!0 thiss!1379 (_2!2580 lt!83775)))))

(declare-fun b!54170 () Bool)

(declare-datatypes ((List!582 0))(
  ( (Nil!579) (Cons!578 (h!697 Bool) (t!1332 List!582)) )
))
(declare-fun head!401 (List!582) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2014 array!2548 (_ BitVec 64) (_ BitVec 64)) List!582)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2014 BitStream!2014 (_ BitVec 64)) List!582)

(assert (=> b!54170 (= e!36173 (= (head!401 (byteArrayBitContentToList!0 (_2!2580 lt!83775) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!401 (bitStreamReadBitsIntoList!0 (_2!2580 lt!83775) (_1!2581 lt!83774) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun res!45230 () Bool)

(declare-fun e!36169 () Bool)

(assert (=> start!10878 (=> (not res!45230) (not e!36169))))

(assert (=> start!10878 (= res!45230 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1163 srcBuffer!2))))))))

(assert (=> start!10878 e!36169))

(assert (=> start!10878 true))

(assert (=> start!10878 (array_inv!1066 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2014) Bool)

(assert (=> start!10878 (and (inv!12 thiss!1379) e!36171)))

(declare-fun b!54171 () Bool)

(assert (=> b!54171 (= e!36169 (not e!36172))))

(declare-fun res!45231 () Bool)

(assert (=> b!54171 (=> res!45231 e!36172)))

(assert (=> b!54171 (= res!45231 (bvsge i!635 to!314))))

(assert (=> b!54171 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!83777 () Unit!3735)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2014) Unit!3735)

(assert (=> b!54171 (= lt!83777 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!83776 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!54171 (= lt!83776 (bitIndex!0 (size!1163 (buf!1517 thiss!1379)) (currentByte!3090 thiss!1379) (currentBit!3085 thiss!1379)))))

(declare-fun b!54172 () Bool)

(declare-fun res!45227 () Bool)

(assert (=> b!54172 (=> (not res!45227) (not e!36169))))

(assert (=> b!54172 (= res!45227 (validate_offset_bits!1 ((_ sign_extend 32) (size!1163 (buf!1517 thiss!1379))) ((_ sign_extend 32) (currentByte!3090 thiss!1379)) ((_ sign_extend 32) (currentBit!3085 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!10878 res!45230) b!54172))

(assert (= (and b!54172 res!45227) b!54171))

(assert (= (and b!54171 (not res!45231)) b!54168))

(assert (= (and b!54168 (not res!45228)) b!54169))

(assert (= (and b!54169 res!45229) b!54170))

(assert (= start!10878 b!54167))

(declare-fun m!85141 () Bool)

(assert (=> b!54167 m!85141))

(declare-fun m!85143 () Bool)

(assert (=> b!54168 m!85143))

(declare-fun m!85145 () Bool)

(assert (=> b!54168 m!85145))

(declare-fun m!85147 () Bool)

(assert (=> b!54168 m!85147))

(declare-fun m!85149 () Bool)

(assert (=> b!54168 m!85149))

(declare-fun m!85151 () Bool)

(assert (=> b!54168 m!85151))

(assert (=> b!54168 m!85147))

(declare-fun m!85153 () Bool)

(assert (=> b!54172 m!85153))

(declare-fun m!85155 () Bool)

(assert (=> b!54171 m!85155))

(declare-fun m!85157 () Bool)

(assert (=> b!54171 m!85157))

(declare-fun m!85159 () Bool)

(assert (=> b!54171 m!85159))

(declare-fun m!85161 () Bool)

(assert (=> b!54169 m!85161))

(declare-fun m!85163 () Bool)

(assert (=> b!54169 m!85163))

(declare-fun m!85165 () Bool)

(assert (=> b!54169 m!85165))

(declare-fun m!85167 () Bool)

(assert (=> b!54169 m!85167))

(declare-fun m!85169 () Bool)

(assert (=> b!54169 m!85169))

(declare-fun m!85171 () Bool)

(assert (=> b!54170 m!85171))

(assert (=> b!54170 m!85171))

(declare-fun m!85173 () Bool)

(assert (=> b!54170 m!85173))

(declare-fun m!85175 () Bool)

(assert (=> b!54170 m!85175))

(assert (=> b!54170 m!85175))

(declare-fun m!85177 () Bool)

(assert (=> b!54170 m!85177))

(declare-fun m!85179 () Bool)

(assert (=> start!10878 m!85179))

(declare-fun m!85181 () Bool)

(assert (=> start!10878 m!85181))

(push 1)

(assert (not b!54168))

(assert (not b!54172))

(assert (not b!54167))

(assert (not start!10878))

(assert (not b!54171))

(assert (not b!54169))

(assert (not b!54170))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!17274 () Bool)

(assert (=> d!17274 (= (head!401 (byteArrayBitContentToList!0 (_2!2580 lt!83775) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!697 (byteArrayBitContentToList!0 (_2!2580 lt!83775) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!54170 d!17274))

(declare-fun d!17276 () Bool)

(declare-fun c!3825 () Bool)

(assert (=> d!17276 (= c!3825 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!36232 () List!582)

(assert (=> d!17276 (= (byteArrayBitContentToList!0 (_2!2580 lt!83775) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!36232)))

(declare-fun b!54234 () Bool)

(assert (=> b!54234 (= e!36232 Nil!579)))

(declare-fun b!54235 () Bool)

(assert (=> b!54235 (= e!36232 (Cons!578 (not (= (bvand ((_ sign_extend 24) (select (arr!1700 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2580 lt!83775) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!17276 c!3825) b!54234))

(assert (= (and d!17276 (not c!3825)) b!54235))

(assert (=> b!54235 m!85147))

(declare-fun m!85283 () Bool)

(assert (=> b!54235 m!85283))

(declare-fun m!85285 () Bool)

(assert (=> b!54235 m!85285))

(assert (=> b!54170 d!17276))

(declare-fun d!17278 () Bool)

(assert (=> d!17278 (= (head!401 (bitStreamReadBitsIntoList!0 (_2!2580 lt!83775) (_1!2581 lt!83774) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!697 (bitStreamReadBitsIntoList!0 (_2!2580 lt!83775) (_1!2581 lt!83774) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!54170 d!17278))

(declare-fun b!54244 () Bool)

(declare-datatypes ((tuple2!4958 0))(
  ( (tuple2!4959 (_1!2590 List!582) (_2!2590 BitStream!2014)) )
))
(declare-fun e!36237 () tuple2!4958)

(assert (=> b!54244 (= e!36237 (tuple2!4959 Nil!579 (_1!2581 lt!83774)))))

(declare-fun b!54245 () Bool)

(declare-fun lt!83846 () (_ BitVec 64))

(declare-datatypes ((tuple2!4960 0))(
  ( (tuple2!4961 (_1!2591 Bool) (_2!2591 BitStream!2014)) )
))
(declare-fun lt!83848 () tuple2!4960)

(assert (=> b!54245 (= e!36237 (tuple2!4959 (Cons!578 (_1!2591 lt!83848) (bitStreamReadBitsIntoList!0 (_2!2580 lt!83775) (_2!2591 lt!83848) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!83846))) (_2!2591 lt!83848)))))

(declare-fun readBit!0 (BitStream!2014) tuple2!4960)

(assert (=> b!54245 (= lt!83848 (readBit!0 (_1!2581 lt!83774)))))

(assert (=> b!54245 (= lt!83846 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!54246 () Bool)

(declare-fun e!36238 () Bool)

(declare-fun lt!83847 () List!582)

(declare-fun isEmpty!155 (List!582) Bool)

(assert (=> b!54246 (= e!36238 (isEmpty!155 lt!83847))))

(declare-fun d!17280 () Bool)

(assert (=> d!17280 e!36238))

(declare-fun c!3830 () Bool)

(assert (=> d!17280 (= c!3830 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!17280 (= lt!83847 (_1!2590 e!36237))))

(declare-fun c!3831 () Bool)

(assert (=> d!17280 (= c!3831 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!17280 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!17280 (= (bitStreamReadBitsIntoList!0 (_2!2580 lt!83775) (_1!2581 lt!83774) #b0000000000000000000000000000000000000000000000000000000000000001) lt!83847)))

(declare-fun b!54247 () Bool)

(declare-fun length!269 (List!582) Int)

(assert (=> b!54247 (= e!36238 (> (length!269 lt!83847) 0))))

(assert (= (and d!17280 c!3831) b!54244))

(assert (= (and d!17280 (not c!3831)) b!54245))

(assert (= (and d!17280 c!3830) b!54246))

(assert (= (and d!17280 (not c!3830)) b!54247))

(declare-fun m!85287 () Bool)

(assert (=> b!54245 m!85287))

(declare-fun m!85289 () Bool)

(assert (=> b!54245 m!85289))

(declare-fun m!85291 () Bool)

(assert (=> b!54246 m!85291))

(declare-fun m!85293 () Bool)

(assert (=> b!54247 m!85293))

(assert (=> b!54170 d!17280))

(declare-fun d!17282 () Bool)

(assert (=> d!17282 (= (array_inv!1066 srcBuffer!2) (bvsge (size!1163 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!10878 d!17282))

(declare-fun d!17284 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!17284 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3085 thiss!1379) (currentByte!3090 thiss!1379) (size!1163 (buf!1517 thiss!1379))))))

(declare-fun bs!4362 () Bool)

(assert (= bs!4362 d!17284))

(declare-fun m!85295 () Bool)

(assert (=> bs!4362 m!85295))

(assert (=> start!10878 d!17284))

(declare-fun d!17286 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!17286 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1163 (buf!1517 (_2!2580 lt!83775)))) ((_ sign_extend 32) (currentByte!3090 thiss!1379)) ((_ sign_extend 32) (currentBit!3085 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1163 (buf!1517 (_2!2580 lt!83775)))) ((_ sign_extend 32) (currentByte!3090 thiss!1379)) ((_ sign_extend 32) (currentBit!3085 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4363 () Bool)

(assert (= bs!4363 d!17286))

(declare-fun m!85297 () Bool)

(assert (=> bs!4363 m!85297))

(assert (=> b!54169 d!17286))

(declare-fun b!54274 () Bool)

(declare-fun res!45305 () Bool)

(declare-fun e!36253 () Bool)

(assert (=> b!54274 (=> (not res!45305) (not e!36253))))

(declare-fun lt!83931 () tuple2!4940)

(assert (=> b!54274 (= res!45305 (isPrefixOf!0 (_2!2581 lt!83931) (_2!2580 lt!83775)))))

(declare-fun lt!83916 () (_ BitVec 64))

(declare-fun lt!83917 () (_ BitVec 64))

(declare-fun b!54275 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!2014 (_ BitVec 64)) BitStream!2014)

(assert (=> b!54275 (= e!36253 (= (_1!2581 lt!83931) (withMovedBitIndex!0 (_2!2581 lt!83931) (bvsub lt!83916 lt!83917))))))

(assert (=> b!54275 (or (= (bvand lt!83916 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!83917 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!83916 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!83916 lt!83917) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!54275 (= lt!83917 (bitIndex!0 (size!1163 (buf!1517 (_2!2580 lt!83775))) (currentByte!3090 (_2!2580 lt!83775)) (currentBit!3085 (_2!2580 lt!83775))))))

(assert (=> b!54275 (= lt!83916 (bitIndex!0 (size!1163 (buf!1517 thiss!1379)) (currentByte!3090 thiss!1379) (currentBit!3085 thiss!1379)))))

(declare-fun b!54276 () Bool)

(declare-fun e!36254 () Unit!3735)

(declare-fun Unit!3746 () Unit!3735)

(assert (=> b!54276 (= e!36254 Unit!3746)))

(declare-fun b!54277 () Bool)

(declare-fun lt!83920 () Unit!3735)

(assert (=> b!54277 (= e!36254 lt!83920)))

(declare-fun lt!83926 () (_ BitVec 64))

(assert (=> b!54277 (= lt!83926 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!83923 () (_ BitVec 64))

(assert (=> b!54277 (= lt!83923 (bitIndex!0 (size!1163 (buf!1517 thiss!1379)) (currentByte!3090 thiss!1379) (currentBit!3085 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2548 array!2548 (_ BitVec 64) (_ BitVec 64)) Unit!3735)

(assert (=> b!54277 (= lt!83920 (arrayBitRangesEqSymmetric!0 (buf!1517 thiss!1379) (buf!1517 (_2!2580 lt!83775)) lt!83926 lt!83923))))

(declare-fun arrayBitRangesEq!0 (array!2548 array!2548 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!54277 (arrayBitRangesEq!0 (buf!1517 (_2!2580 lt!83775)) (buf!1517 thiss!1379) lt!83926 lt!83923)))

(declare-fun d!17290 () Bool)

(assert (=> d!17290 e!36253))

(declare-fun res!45304 () Bool)

(assert (=> d!17290 (=> (not res!45304) (not e!36253))))

(assert (=> d!17290 (= res!45304 (isPrefixOf!0 (_1!2581 lt!83931) (_2!2581 lt!83931)))))

(declare-fun lt!83914 () BitStream!2014)

(assert (=> d!17290 (= lt!83931 (tuple2!4941 lt!83914 (_2!2580 lt!83775)))))

(declare-fun lt!83919 () Unit!3735)

(declare-fun lt!83922 () Unit!3735)

(assert (=> d!17290 (= lt!83919 lt!83922)))

(assert (=> d!17290 (isPrefixOf!0 lt!83914 (_2!2580 lt!83775))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2014 BitStream!2014 BitStream!2014) Unit!3735)

(assert (=> d!17290 (= lt!83922 (lemmaIsPrefixTransitive!0 lt!83914 (_2!2580 lt!83775) (_2!2580 lt!83775)))))

(declare-fun lt!83913 () Unit!3735)

(declare-fun lt!83930 () Unit!3735)

(assert (=> d!17290 (= lt!83913 lt!83930)))

(assert (=> d!17290 (isPrefixOf!0 lt!83914 (_2!2580 lt!83775))))

(assert (=> d!17290 (= lt!83930 (lemmaIsPrefixTransitive!0 lt!83914 thiss!1379 (_2!2580 lt!83775)))))

(declare-fun lt!83924 () Unit!3735)

(assert (=> d!17290 (= lt!83924 e!36254)))

(declare-fun c!3834 () Bool)

(assert (=> d!17290 (= c!3834 (not (= (size!1163 (buf!1517 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!83929 () Unit!3735)

(declare-fun lt!83915 () Unit!3735)

(assert (=> d!17290 (= lt!83929 lt!83915)))

(assert (=> d!17290 (isPrefixOf!0 (_2!2580 lt!83775) (_2!2580 lt!83775))))

(assert (=> d!17290 (= lt!83915 (lemmaIsPrefixRefl!0 (_2!2580 lt!83775)))))

(declare-fun lt!83918 () Unit!3735)

(declare-fun lt!83927 () Unit!3735)

(assert (=> d!17290 (= lt!83918 lt!83927)))

(assert (=> d!17290 (= lt!83927 (lemmaIsPrefixRefl!0 (_2!2580 lt!83775)))))

(declare-fun lt!83912 () Unit!3735)

(declare-fun lt!83925 () Unit!3735)

(assert (=> d!17290 (= lt!83912 lt!83925)))

(assert (=> d!17290 (isPrefixOf!0 lt!83914 lt!83914)))

(assert (=> d!17290 (= lt!83925 (lemmaIsPrefixRefl!0 lt!83914))))

(declare-fun lt!83921 () Unit!3735)

(declare-fun lt!83928 () Unit!3735)

(assert (=> d!17290 (= lt!83921 lt!83928)))

(assert (=> d!17290 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!17290 (= lt!83928 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!17290 (= lt!83914 (BitStream!2015 (buf!1517 (_2!2580 lt!83775)) (currentByte!3090 thiss!1379) (currentBit!3085 thiss!1379)))))

(assert (=> d!17290 (isPrefixOf!0 thiss!1379 (_2!2580 lt!83775))))

(assert (=> d!17290 (= (reader!0 thiss!1379 (_2!2580 lt!83775)) lt!83931)))

(declare-fun b!54278 () Bool)

(declare-fun res!45306 () Bool)

(assert (=> b!54278 (=> (not res!45306) (not e!36253))))

(assert (=> b!54278 (= res!45306 (isPrefixOf!0 (_1!2581 lt!83931) thiss!1379))))

(assert (= (and d!17290 c!3834) b!54277))

(assert (= (and d!17290 (not c!3834)) b!54276))

(assert (= (and d!17290 res!45304) b!54278))

(assert (= (and b!54278 res!45306) b!54274))

(assert (= (and b!54274 res!45305) b!54275))

(declare-fun m!85307 () Bool)

(assert (=> b!54274 m!85307))

(declare-fun m!85309 () Bool)

(assert (=> b!54278 m!85309))

(declare-fun m!85311 () Bool)

(assert (=> d!17290 m!85311))

(declare-fun m!85313 () Bool)

(assert (=> d!17290 m!85313))

(declare-fun m!85315 () Bool)

(assert (=> d!17290 m!85315))

(assert (=> d!17290 m!85157))

(assert (=> d!17290 m!85145))

(assert (=> d!17290 m!85155))

(declare-fun m!85319 () Bool)

(assert (=> d!17290 m!85319))

(declare-fun m!85321 () Bool)

(assert (=> d!17290 m!85321))

(declare-fun m!85323 () Bool)

(assert (=> d!17290 m!85323))

(declare-fun m!85325 () Bool)

(assert (=> d!17290 m!85325))

(declare-fun m!85329 () Bool)

(assert (=> d!17290 m!85329))

(declare-fun m!85331 () Bool)

(assert (=> b!54275 m!85331))

(declare-fun m!85333 () Bool)

(assert (=> b!54275 m!85333))

(assert (=> b!54275 m!85159))

(assert (=> b!54277 m!85159))

(declare-fun m!85335 () Bool)

(assert (=> b!54277 m!85335))

(declare-fun m!85337 () Bool)

(assert (=> b!54277 m!85337))

(assert (=> b!54169 d!17290))

(declare-fun d!17304 () Bool)

(declare-fun res!45336 () Bool)

(declare-fun e!36270 () Bool)

(assert (=> d!17304 (=> (not res!45336) (not e!36270))))

(assert (=> d!17304 (= res!45336 (= (size!1163 (buf!1517 (_2!2580 lt!83775))) (size!1163 (buf!1517 (_2!2580 (appendBitsMSBFirstLoop!0 (_2!2580 lt!83775) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))))))

(assert (=> d!17304 (= (isPrefixOf!0 (_2!2580 lt!83775) (_2!2580 (appendBitsMSBFirstLoop!0 (_2!2580 lt!83775) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))) e!36270)))

(declare-fun b!54306 () Bool)

(declare-fun res!45335 () Bool)

(assert (=> b!54306 (=> (not res!45335) (not e!36270))))

(assert (=> b!54306 (= res!45335 (bvsle (bitIndex!0 (size!1163 (buf!1517 (_2!2580 lt!83775))) (currentByte!3090 (_2!2580 lt!83775)) (currentBit!3085 (_2!2580 lt!83775))) (bitIndex!0 (size!1163 (buf!1517 (_2!2580 (appendBitsMSBFirstLoop!0 (_2!2580 lt!83775) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314)))) (currentByte!3090 (_2!2580 (appendBitsMSBFirstLoop!0 (_2!2580 lt!83775) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))) (currentBit!3085 (_2!2580 (appendBitsMSBFirstLoop!0 (_2!2580 lt!83775) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))))))

(declare-fun b!54307 () Bool)

(declare-fun e!36271 () Bool)

(assert (=> b!54307 (= e!36270 e!36271)))

(declare-fun res!45334 () Bool)

(assert (=> b!54307 (=> res!45334 e!36271)))

(assert (=> b!54307 (= res!45334 (= (size!1163 (buf!1517 (_2!2580 lt!83775))) #b00000000000000000000000000000000))))

(declare-fun b!54308 () Bool)

(assert (=> b!54308 (= e!36271 (arrayBitRangesEq!0 (buf!1517 (_2!2580 lt!83775)) (buf!1517 (_2!2580 (appendBitsMSBFirstLoop!0 (_2!2580 lt!83775) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1163 (buf!1517 (_2!2580 lt!83775))) (currentByte!3090 (_2!2580 lt!83775)) (currentBit!3085 (_2!2580 lt!83775)))))))

(assert (= (and d!17304 res!45336) b!54306))

(assert (= (and b!54306 res!45335) b!54307))

(assert (= (and b!54307 (not res!45334)) b!54308))

(assert (=> b!54306 m!85333))

(declare-fun m!85341 () Bool)

(assert (=> b!54306 m!85341))

(assert (=> b!54308 m!85333))

(assert (=> b!54308 m!85333))

(declare-fun m!85343 () Bool)

(assert (=> b!54308 m!85343))

(assert (=> b!54169 d!17304))

(declare-fun b!54395 () Bool)

(declare-fun res!45396 () Bool)

(declare-fun e!36313 () Bool)

(assert (=> b!54395 (=> (not res!45396) (not e!36313))))

(declare-fun lt!84205 () tuple2!4938)

(assert (=> b!54395 (= res!45396 (= (size!1163 (buf!1517 (_2!2580 lt!84205))) (size!1163 (buf!1517 (_2!2580 lt!83775)))))))

(declare-fun b!54396 () Bool)

(declare-fun res!45397 () Bool)

(assert (=> b!54396 (=> (not res!45397) (not e!36313))))

(assert (=> b!54396 (= res!45397 (= (size!1163 (buf!1517 (_2!2580 lt!83775))) (size!1163 (buf!1517 (_2!2580 lt!84205)))))))

(declare-fun b!54397 () Bool)

(declare-fun e!36312 () tuple2!4938)

(declare-fun lt!84208 () tuple2!4938)

(declare-fun Unit!3749 () Unit!3735)

(assert (=> b!54397 (= e!36312 (tuple2!4939 Unit!3749 (_2!2580 lt!84208)))))

(declare-fun lt!84167 () tuple2!4938)

(assert (=> b!54397 (= lt!84167 (appendBitFromByte!0 (_2!2580 lt!83775) (select (arr!1700 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!84181 () (_ BitVec 64))

(assert (=> b!54397 (= lt!84181 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!84203 () (_ BitVec 64))

(assert (=> b!54397 (= lt!84203 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!84186 () Unit!3735)

(assert (=> b!54397 (= lt!84186 (validateOffsetBitsIneqLemma!0 (_2!2580 lt!83775) (_2!2580 lt!84167) lt!84181 lt!84203))))

(assert (=> b!54397 (validate_offset_bits!1 ((_ sign_extend 32) (size!1163 (buf!1517 (_2!2580 lt!84167)))) ((_ sign_extend 32) (currentByte!3090 (_2!2580 lt!84167))) ((_ sign_extend 32) (currentBit!3085 (_2!2580 lt!84167))) (bvsub lt!84181 lt!84203))))

(declare-fun lt!84169 () Unit!3735)

(assert (=> b!54397 (= lt!84169 lt!84186)))

(declare-fun lt!84207 () tuple2!4940)

(assert (=> b!54397 (= lt!84207 (reader!0 (_2!2580 lt!83775) (_2!2580 lt!84167)))))

(declare-fun lt!84170 () (_ BitVec 64))

(assert (=> b!54397 (= lt!84170 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!84210 () Unit!3735)

(assert (=> b!54397 (= lt!84210 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2580 lt!83775) (buf!1517 (_2!2580 lt!84167)) lt!84170))))

(assert (=> b!54397 (validate_offset_bits!1 ((_ sign_extend 32) (size!1163 (buf!1517 (_2!2580 lt!84167)))) ((_ sign_extend 32) (currentByte!3090 (_2!2580 lt!83775))) ((_ sign_extend 32) (currentBit!3085 (_2!2580 lt!83775))) lt!84170)))

(declare-fun lt!84187 () Unit!3735)

(assert (=> b!54397 (= lt!84187 lt!84210)))

(assert (=> b!54397 (= (head!401 (byteArrayBitContentToList!0 (_2!2580 lt!84167) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!401 (bitStreamReadBitsIntoList!0 (_2!2580 lt!84167) (_1!2581 lt!84207) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!84196 () Unit!3735)

(declare-fun Unit!3751 () Unit!3735)

(assert (=> b!54397 (= lt!84196 Unit!3751)))

(assert (=> b!54397 (= lt!84208 (appendBitsMSBFirstLoop!0 (_2!2580 lt!84167) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!84178 () Unit!3735)

(assert (=> b!54397 (= lt!84178 (lemmaIsPrefixTransitive!0 (_2!2580 lt!83775) (_2!2580 lt!84167) (_2!2580 lt!84208)))))

(assert (=> b!54397 (isPrefixOf!0 (_2!2580 lt!83775) (_2!2580 lt!84208))))

(declare-fun lt!84194 () Unit!3735)

(assert (=> b!54397 (= lt!84194 lt!84178)))

(assert (=> b!54397 (= (size!1163 (buf!1517 (_2!2580 lt!84208))) (size!1163 (buf!1517 (_2!2580 lt!83775))))))

(declare-fun lt!84168 () Unit!3735)

(declare-fun Unit!3752 () Unit!3735)

(assert (=> b!54397 (= lt!84168 Unit!3752)))

(assert (=> b!54397 (= (bitIndex!0 (size!1163 (buf!1517 (_2!2580 lt!84208))) (currentByte!3090 (_2!2580 lt!84208)) (currentBit!3085 (_2!2580 lt!84208))) (bvsub (bvadd (bitIndex!0 (size!1163 (buf!1517 (_2!2580 lt!83775))) (currentByte!3090 (_2!2580 lt!83775)) (currentBit!3085 (_2!2580 lt!83775))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!84175 () Unit!3735)

(declare-fun Unit!3753 () Unit!3735)

(assert (=> b!54397 (= lt!84175 Unit!3753)))

(assert (=> b!54397 (= (bitIndex!0 (size!1163 (buf!1517 (_2!2580 lt!84208))) (currentByte!3090 (_2!2580 lt!84208)) (currentBit!3085 (_2!2580 lt!84208))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1163 (buf!1517 (_2!2580 lt!84167))) (currentByte!3090 (_2!2580 lt!84167)) (currentBit!3085 (_2!2580 lt!84167))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!84165 () Unit!3735)

(declare-fun Unit!3754 () Unit!3735)

(assert (=> b!54397 (= lt!84165 Unit!3754)))

(declare-fun lt!84195 () tuple2!4940)

(assert (=> b!54397 (= lt!84195 (reader!0 (_2!2580 lt!83775) (_2!2580 lt!84208)))))

(declare-fun lt!84212 () (_ BitVec 64))

(assert (=> b!54397 (= lt!84212 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!84200 () Unit!3735)

(assert (=> b!54397 (= lt!84200 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2580 lt!83775) (buf!1517 (_2!2580 lt!84208)) lt!84212))))

(assert (=> b!54397 (validate_offset_bits!1 ((_ sign_extend 32) (size!1163 (buf!1517 (_2!2580 lt!84208)))) ((_ sign_extend 32) (currentByte!3090 (_2!2580 lt!83775))) ((_ sign_extend 32) (currentBit!3085 (_2!2580 lt!83775))) lt!84212)))

(declare-fun lt!84206 () Unit!3735)

(assert (=> b!54397 (= lt!84206 lt!84200)))

(declare-fun lt!84204 () tuple2!4940)

(declare-fun call!685 () tuple2!4940)

(assert (=> b!54397 (= lt!84204 call!685)))

(declare-fun lt!84199 () (_ BitVec 64))

(assert (=> b!54397 (= lt!84199 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!84182 () Unit!3735)

(assert (=> b!54397 (= lt!84182 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2580 lt!84167) (buf!1517 (_2!2580 lt!84208)) lt!84199))))

(assert (=> b!54397 (validate_offset_bits!1 ((_ sign_extend 32) (size!1163 (buf!1517 (_2!2580 lt!84208)))) ((_ sign_extend 32) (currentByte!3090 (_2!2580 lt!84167))) ((_ sign_extend 32) (currentBit!3085 (_2!2580 lt!84167))) lt!84199)))

(declare-fun lt!84171 () Unit!3735)

(assert (=> b!54397 (= lt!84171 lt!84182)))

(declare-fun lt!84183 () List!582)

(assert (=> b!54397 (= lt!84183 (byteArrayBitContentToList!0 (_2!2580 lt!84208) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!84202 () List!582)

(assert (=> b!54397 (= lt!84202 (byteArrayBitContentToList!0 (_2!2580 lt!84208) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!84173 () List!582)

(assert (=> b!54397 (= lt!84173 (bitStreamReadBitsIntoList!0 (_2!2580 lt!84208) (_1!2581 lt!84195) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!84180 () List!582)

(assert (=> b!54397 (= lt!84180 (bitStreamReadBitsIntoList!0 (_2!2580 lt!84208) (_1!2581 lt!84204) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!84190 () (_ BitVec 64))

(assert (=> b!54397 (= lt!84190 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!84193 () Unit!3735)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2014 BitStream!2014 BitStream!2014 BitStream!2014 (_ BitVec 64) List!582) Unit!3735)

(assert (=> b!54397 (= lt!84193 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2580 lt!84208) (_2!2580 lt!84208) (_1!2581 lt!84195) (_1!2581 lt!84204) lt!84190 lt!84173))))

(declare-fun tail!257 (List!582) List!582)

(assert (=> b!54397 (= (bitStreamReadBitsIntoList!0 (_2!2580 lt!84208) (_1!2581 lt!84204) (bvsub lt!84190 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!257 lt!84173))))

(declare-fun lt!84172 () Unit!3735)

(assert (=> b!54397 (= lt!84172 lt!84193)))

(declare-fun lt!84211 () Unit!3735)

(declare-fun lt!84179 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2548 array!2548 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3735)

(assert (=> b!54397 (= lt!84211 (arrayBitRangesEqImpliesEq!0 (buf!1517 (_2!2580 lt!84167)) (buf!1517 (_2!2580 lt!84208)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!84179 (bitIndex!0 (size!1163 (buf!1517 (_2!2580 lt!84167))) (currentByte!3090 (_2!2580 lt!84167)) (currentBit!3085 (_2!2580 lt!84167)))))))

(declare-fun bitAt!0 (array!2548 (_ BitVec 64)) Bool)

(assert (=> b!54397 (= (bitAt!0 (buf!1517 (_2!2580 lt!84167)) lt!84179) (bitAt!0 (buf!1517 (_2!2580 lt!84208)) lt!84179))))

(declare-fun lt!84174 () Unit!3735)

(assert (=> b!54397 (= lt!84174 lt!84211)))

(declare-fun b!54398 () Bool)

(declare-fun res!45399 () Bool)

(assert (=> b!54398 (=> (not res!45399) (not e!36313))))

(assert (=> b!54398 (= res!45399 (invariant!0 (currentBit!3085 (_2!2580 lt!84205)) (currentByte!3090 (_2!2580 lt!84205)) (size!1163 (buf!1517 (_2!2580 lt!84205)))))))

(declare-fun b!54399 () Bool)

(declare-fun res!45398 () Bool)

(assert (=> b!54399 (=> (not res!45398) (not e!36313))))

(assert (=> b!54399 (= res!45398 (isPrefixOf!0 (_2!2580 lt!83775) (_2!2580 lt!84205)))))

(declare-fun b!54400 () Bool)

(declare-fun e!36314 () Bool)

(declare-fun lt!84176 () (_ BitVec 64))

(assert (=> b!54400 (= e!36314 (validate_offset_bits!1 ((_ sign_extend 32) (size!1163 (buf!1517 (_2!2580 lt!83775)))) ((_ sign_extend 32) (currentByte!3090 (_2!2580 lt!83775))) ((_ sign_extend 32) (currentBit!3085 (_2!2580 lt!83775))) lt!84176))))

(declare-fun b!54401 () Bool)

(declare-fun Unit!3755 () Unit!3735)

(assert (=> b!54401 (= e!36312 (tuple2!4939 Unit!3755 (_2!2580 lt!83775)))))

(assert (=> b!54401 (= (size!1163 (buf!1517 (_2!2580 lt!83775))) (size!1163 (buf!1517 (_2!2580 lt!83775))))))

(declare-fun lt!84166 () Unit!3735)

(declare-fun Unit!3756 () Unit!3735)

(assert (=> b!54401 (= lt!84166 Unit!3756)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2014 array!2548 array!2548 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!4962 0))(
  ( (tuple2!4963 (_1!2592 array!2548) (_2!2592 BitStream!2014)) )
))
(declare-fun readBits!0 (BitStream!2014 (_ BitVec 64)) tuple2!4962)

(assert (=> b!54401 (checkByteArrayBitContent!0 (_2!2580 lt!83775) srcBuffer!2 (_1!2592 (readBits!0 (_1!2581 call!685) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!54402 () Bool)

(declare-fun lt!84197 () tuple2!4940)

(assert (=> b!54402 (= e!36313 (= (bitStreamReadBitsIntoList!0 (_2!2580 lt!84205) (_1!2581 lt!84197) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2580 lt!84205) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!54402 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!54402 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!84177 () Unit!3735)

(declare-fun lt!84184 () Unit!3735)

(assert (=> b!54402 (= lt!84177 lt!84184)))

(assert (=> b!54402 (validate_offset_bits!1 ((_ sign_extend 32) (size!1163 (buf!1517 (_2!2580 lt!84205)))) ((_ sign_extend 32) (currentByte!3090 (_2!2580 lt!83775))) ((_ sign_extend 32) (currentBit!3085 (_2!2580 lt!83775))) lt!84176)))

(assert (=> b!54402 (= lt!84184 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2580 lt!83775) (buf!1517 (_2!2580 lt!84205)) lt!84176))))

(assert (=> b!54402 e!36314))

(declare-fun res!45395 () Bool)

(assert (=> b!54402 (=> (not res!45395) (not e!36314))))

(assert (=> b!54402 (= res!45395 (and (= (size!1163 (buf!1517 (_2!2580 lt!83775))) (size!1163 (buf!1517 (_2!2580 lt!84205)))) (bvsge lt!84176 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!54402 (= lt!84176 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!54402 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!54402 (= lt!84197 (reader!0 (_2!2580 lt!83775) (_2!2580 lt!84205)))))

(declare-fun bm!682 () Bool)

(declare-fun c!3849 () Bool)

(assert (=> bm!682 (= call!685 (reader!0 (ite c!3849 (_2!2580 lt!84167) (_2!2580 lt!83775)) (ite c!3849 (_2!2580 lt!84208) (_2!2580 lt!83775))))))

(declare-fun d!17308 () Bool)

(assert (=> d!17308 e!36313))

(declare-fun res!45394 () Bool)

(assert (=> d!17308 (=> (not res!45394) (not e!36313))))

(declare-fun lt!84209 () (_ BitVec 64))

(assert (=> d!17308 (= res!45394 (= (bitIndex!0 (size!1163 (buf!1517 (_2!2580 lt!84205))) (currentByte!3090 (_2!2580 lt!84205)) (currentBit!3085 (_2!2580 lt!84205))) (bvsub lt!84209 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!17308 (or (= (bvand lt!84209 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!84209 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!84209 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!84185 () (_ BitVec 64))

(assert (=> d!17308 (= lt!84209 (bvadd lt!84185 to!314))))

(assert (=> d!17308 (or (not (= (bvand lt!84185 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!84185 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!84185 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!17308 (= lt!84185 (bitIndex!0 (size!1163 (buf!1517 (_2!2580 lt!83775))) (currentByte!3090 (_2!2580 lt!83775)) (currentBit!3085 (_2!2580 lt!83775))))))

(assert (=> d!17308 (= lt!84205 e!36312)))

(assert (=> d!17308 (= c!3849 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!84201 () Unit!3735)

(declare-fun lt!84198 () Unit!3735)

(assert (=> d!17308 (= lt!84201 lt!84198)))

(assert (=> d!17308 (isPrefixOf!0 (_2!2580 lt!83775) (_2!2580 lt!83775))))

(assert (=> d!17308 (= lt!84198 (lemmaIsPrefixRefl!0 (_2!2580 lt!83775)))))

(assert (=> d!17308 (= lt!84179 (bitIndex!0 (size!1163 (buf!1517 (_2!2580 lt!83775))) (currentByte!3090 (_2!2580 lt!83775)) (currentBit!3085 (_2!2580 lt!83775))))))

(assert (=> d!17308 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!17308 (= (appendBitsMSBFirstLoop!0 (_2!2580 lt!83775) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!84205)))

(assert (= (and d!17308 c!3849) b!54397))

(assert (= (and d!17308 (not c!3849)) b!54401))

(assert (= (or b!54397 b!54401) bm!682))

(assert (= (and d!17308 res!45394) b!54398))

(assert (= (and b!54398 res!45399) b!54396))

(assert (= (and b!54396 res!45397) b!54399))

(assert (= (and b!54399 res!45398) b!54395))

(assert (= (and b!54395 res!45396) b!54402))

(assert (= (and b!54402 res!45395) b!54400))

(declare-fun m!85445 () Bool)

(assert (=> bm!682 m!85445))

(declare-fun m!85447 () Bool)

(assert (=> b!54397 m!85447))

(declare-fun m!85449 () Bool)

(assert (=> b!54397 m!85449))

(declare-fun m!85451 () Bool)

(assert (=> b!54397 m!85451))

(declare-fun m!85453 () Bool)

(assert (=> b!54397 m!85453))

(declare-fun m!85455 () Bool)

(assert (=> b!54397 m!85455))

(declare-fun m!85457 () Bool)

(assert (=> b!54397 m!85457))

(declare-fun m!85459 () Bool)

(assert (=> b!54397 m!85459))

(declare-fun m!85461 () Bool)

(assert (=> b!54397 m!85461))

(declare-fun m!85463 () Bool)

(assert (=> b!54397 m!85463))

(declare-fun m!85465 () Bool)

(assert (=> b!54397 m!85465))

(declare-fun m!85467 () Bool)

(assert (=> b!54397 m!85467))

(declare-fun m!85469 () Bool)

(assert (=> b!54397 m!85469))

(assert (=> b!54397 m!85467))

(declare-fun m!85471 () Bool)

(assert (=> b!54397 m!85471))

(declare-fun m!85473 () Bool)

(assert (=> b!54397 m!85473))

(assert (=> b!54397 m!85333))

(declare-fun m!85475 () Bool)

(assert (=> b!54397 m!85475))

(declare-fun m!85477 () Bool)

(assert (=> b!54397 m!85477))

(declare-fun m!85479 () Bool)

(assert (=> b!54397 m!85479))

(assert (=> b!54397 m!85475))

(declare-fun m!85481 () Bool)

(assert (=> b!54397 m!85481))

(declare-fun m!85483 () Bool)

(assert (=> b!54397 m!85483))

(declare-fun m!85485 () Bool)

(assert (=> b!54397 m!85485))

(assert (=> b!54397 m!85453))

(declare-fun m!85487 () Bool)

(assert (=> b!54397 m!85487))

(assert (=> b!54397 m!85455))

(declare-fun m!85489 () Bool)

(assert (=> b!54397 m!85489))

(declare-fun m!85491 () Bool)

(assert (=> b!54397 m!85491))

(declare-fun m!85493 () Bool)

(assert (=> b!54397 m!85493))

(declare-fun m!85495 () Bool)

(assert (=> b!54397 m!85495))

(declare-fun m!85497 () Bool)

(assert (=> b!54397 m!85497))

(declare-fun m!85499 () Bool)

(assert (=> b!54397 m!85499))

(declare-fun m!85501 () Bool)

(assert (=> b!54397 m!85501))

(declare-fun m!85503 () Bool)

(assert (=> b!54397 m!85503))

(declare-fun m!85505 () Bool)

(assert (=> b!54397 m!85505))

(declare-fun m!85507 () Bool)

(assert (=> b!54397 m!85507))

(declare-fun m!85509 () Bool)

(assert (=> b!54398 m!85509))

(declare-fun m!85511 () Bool)

(assert (=> b!54402 m!85511))

(declare-fun m!85513 () Bool)

(assert (=> b!54402 m!85513))

(declare-fun m!85515 () Bool)

(assert (=> b!54402 m!85515))

(declare-fun m!85517 () Bool)

(assert (=> b!54402 m!85517))

(declare-fun m!85519 () Bool)

(assert (=> b!54402 m!85519))

(declare-fun m!85521 () Bool)

(assert (=> d!17308 m!85521))

(assert (=> d!17308 m!85333))

(assert (=> d!17308 m!85311))

(assert (=> d!17308 m!85319))

(declare-fun m!85523 () Bool)

(assert (=> b!54399 m!85523))

(declare-fun m!85525 () Bool)

(assert (=> b!54401 m!85525))

(declare-fun m!85527 () Bool)

(assert (=> b!54401 m!85527))

(declare-fun m!85529 () Bool)

(assert (=> b!54400 m!85529))

(assert (=> b!54169 d!17308))

(declare-fun d!17334 () Bool)

(assert (=> d!17334 (validate_offset_bits!1 ((_ sign_extend 32) (size!1163 (buf!1517 (_2!2580 lt!83775)))) ((_ sign_extend 32) (currentByte!3090 thiss!1379)) ((_ sign_extend 32) (currentBit!3085 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!84287 () Unit!3735)

(declare-fun choose!9 (BitStream!2014 array!2548 (_ BitVec 64) BitStream!2014) Unit!3735)

(assert (=> d!17334 (= lt!84287 (choose!9 thiss!1379 (buf!1517 (_2!2580 lt!83775)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2015 (buf!1517 (_2!2580 lt!83775)) (currentByte!3090 thiss!1379) (currentBit!3085 thiss!1379))))))

(assert (=> d!17334 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1517 (_2!2580 lt!83775)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!84287)))

(declare-fun bs!4370 () Bool)

(assert (= bs!4370 d!17334))

(assert (=> bs!4370 m!85167))

(declare-fun m!85531 () Bool)

(assert (=> bs!4370 m!85531))

(assert (=> b!54169 d!17334))

(declare-fun d!17336 () Bool)

(assert (=> d!17336 (= (array_inv!1066 (buf!1517 thiss!1379)) (bvsge (size!1163 (buf!1517 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!54167 d!17336))

(declare-fun d!17338 () Bool)

(declare-fun res!45402 () Bool)

(declare-fun e!36317 () Bool)

(assert (=> d!17338 (=> (not res!45402) (not e!36317))))

(assert (=> d!17338 (= res!45402 (= (size!1163 (buf!1517 thiss!1379)) (size!1163 (buf!1517 (_2!2580 lt!83775)))))))

(assert (=> d!17338 (= (isPrefixOf!0 thiss!1379 (_2!2580 lt!83775)) e!36317)))

(declare-fun b!54407 () Bool)

(declare-fun res!45401 () Bool)

(assert (=> b!54407 (=> (not res!45401) (not e!36317))))

(assert (=> b!54407 (= res!45401 (bvsle (bitIndex!0 (size!1163 (buf!1517 thiss!1379)) (currentByte!3090 thiss!1379) (currentBit!3085 thiss!1379)) (bitIndex!0 (size!1163 (buf!1517 (_2!2580 lt!83775))) (currentByte!3090 (_2!2580 lt!83775)) (currentBit!3085 (_2!2580 lt!83775)))))))

(declare-fun b!54408 () Bool)

(declare-fun e!36318 () Bool)

(assert (=> b!54408 (= e!36317 e!36318)))

(declare-fun res!45400 () Bool)

(assert (=> b!54408 (=> res!45400 e!36318)))

(assert (=> b!54408 (= res!45400 (= (size!1163 (buf!1517 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!54409 () Bool)

(assert (=> b!54409 (= e!36318 (arrayBitRangesEq!0 (buf!1517 thiss!1379) (buf!1517 (_2!2580 lt!83775)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1163 (buf!1517 thiss!1379)) (currentByte!3090 thiss!1379) (currentBit!3085 thiss!1379))))))

(assert (= (and d!17338 res!45402) b!54407))

(assert (= (and b!54407 res!45401) b!54408))

(assert (= (and b!54408 (not res!45400)) b!54409))

(assert (=> b!54407 m!85159))

(assert (=> b!54407 m!85333))

(assert (=> b!54409 m!85159))

(assert (=> b!54409 m!85159))

(declare-fun m!85533 () Bool)

(assert (=> b!54409 m!85533))

(assert (=> b!54168 d!17338))

(declare-fun d!17340 () Bool)

(assert (=> d!17340 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1163 (buf!1517 (_2!2580 lt!83775)))) ((_ sign_extend 32) (currentByte!3090 (_2!2580 lt!83775))) ((_ sign_extend 32) (currentBit!3085 (_2!2580 lt!83775))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1163 (buf!1517 (_2!2580 lt!83775)))) ((_ sign_extend 32) (currentByte!3090 (_2!2580 lt!83775))) ((_ sign_extend 32) (currentBit!3085 (_2!2580 lt!83775)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!4371 () Bool)

(assert (= bs!4371 d!17340))

(declare-fun m!85535 () Bool)

(assert (=> bs!4371 m!85535))

(assert (=> b!54168 d!17340))

(declare-fun d!17342 () Bool)

(declare-fun e!36325 () Bool)

(assert (=> d!17342 e!36325))

(declare-fun res!45417 () Bool)

(assert (=> d!17342 (=> (not res!45417) (not e!36325))))

(assert (=> d!17342 (= res!45417 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!84302 () Unit!3735)

(declare-fun choose!27 (BitStream!2014 BitStream!2014 (_ BitVec 64) (_ BitVec 64)) Unit!3735)

(assert (=> d!17342 (= lt!84302 (choose!27 thiss!1379 (_2!2580 lt!83775) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!17342 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!17342 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2580 lt!83775) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!84302)))

(declare-fun b!54424 () Bool)

(assert (=> b!54424 (= e!36325 (validate_offset_bits!1 ((_ sign_extend 32) (size!1163 (buf!1517 (_2!2580 lt!83775)))) ((_ sign_extend 32) (currentByte!3090 (_2!2580 lt!83775))) ((_ sign_extend 32) (currentBit!3085 (_2!2580 lt!83775))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!17342 res!45417) b!54424))

(declare-fun m!85537 () Bool)

(assert (=> d!17342 m!85537))

(assert (=> b!54424 m!85143))

(assert (=> b!54168 d!17342))

(declare-fun b!54468 () Bool)

(declare-fun res!45453 () Bool)

(declare-fun e!36345 () Bool)

(assert (=> b!54468 (=> (not res!45453) (not e!36345))))

(declare-fun lt!84437 () tuple2!4938)

(assert (=> b!54468 (= res!45453 (= (bitIndex!0 (size!1163 (buf!1517 (_2!2580 lt!84437))) (currentByte!3090 (_2!2580 lt!84437)) (currentBit!3085 (_2!2580 lt!84437))) (bvadd (bitIndex!0 (size!1163 (buf!1517 thiss!1379)) (currentByte!3090 thiss!1379) (currentBit!3085 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!54469 () Bool)

(declare-fun e!36347 () Bool)

(declare-fun e!36346 () Bool)

(assert (=> b!54469 (= e!36347 e!36346)))

(declare-fun res!45454 () Bool)

(assert (=> b!54469 (=> (not res!45454) (not e!36346))))

(declare-fun lt!84440 () tuple2!4938)

(declare-fun lt!84435 () (_ BitVec 8))

(declare-datatypes ((tuple2!4964 0))(
  ( (tuple2!4965 (_1!2593 BitStream!2014) (_2!2593 Bool)) )
))
(declare-fun lt!84441 () tuple2!4964)

(assert (=> b!54469 (= res!45454 (and (= (_2!2593 lt!84441) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1700 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!84435)) #b00000000000000000000000000000000))) (= (_1!2593 lt!84441) (_2!2580 lt!84440))))))

(declare-fun lt!84438 () tuple2!4962)

(declare-fun lt!84431 () BitStream!2014)

(assert (=> b!54469 (= lt!84438 (readBits!0 lt!84431 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!2014) tuple2!4964)

(assert (=> b!54469 (= lt!84441 (readBitPure!0 lt!84431))))

(declare-fun readerFrom!0 (BitStream!2014 (_ BitVec 32) (_ BitVec 32)) BitStream!2014)

(assert (=> b!54469 (= lt!84431 (readerFrom!0 (_2!2580 lt!84440) (currentBit!3085 thiss!1379) (currentByte!3090 thiss!1379)))))

(declare-fun d!17344 () Bool)

(assert (=> d!17344 e!36347))

(declare-fun res!45452 () Bool)

(assert (=> d!17344 (=> (not res!45452) (not e!36347))))

(assert (=> d!17344 (= res!45452 (= (size!1163 (buf!1517 (_2!2580 lt!84440))) (size!1163 (buf!1517 thiss!1379))))))

(declare-fun lt!84432 () array!2548)

(assert (=> d!17344 (= lt!84435 (select (arr!1700 lt!84432) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!17344 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1163 lt!84432)))))

(assert (=> d!17344 (= lt!84432 (array!2549 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!84436 () tuple2!4938)

(assert (=> d!17344 (= lt!84440 (tuple2!4939 (_1!2580 lt!84436) (_2!2580 lt!84436)))))

(assert (=> d!17344 (= lt!84436 lt!84437)))

(assert (=> d!17344 e!36345))

(declare-fun res!45459 () Bool)

(assert (=> d!17344 (=> (not res!45459) (not e!36345))))

(assert (=> d!17344 (= res!45459 (= (size!1163 (buf!1517 thiss!1379)) (size!1163 (buf!1517 (_2!2580 lt!84437)))))))

(declare-fun lt!84442 () Bool)

(declare-fun appendBit!0 (BitStream!2014 Bool) tuple2!4938)

(assert (=> d!17344 (= lt!84437 (appendBit!0 thiss!1379 lt!84442))))

(assert (=> d!17344 (= lt!84442 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1700 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!17344 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!17344 (= (appendBitFromByte!0 thiss!1379 (select (arr!1700 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!84440)))

(declare-fun b!54470 () Bool)

(assert (=> b!54470 (= e!36346 (= (bitIndex!0 (size!1163 (buf!1517 (_1!2593 lt!84441))) (currentByte!3090 (_1!2593 lt!84441)) (currentBit!3085 (_1!2593 lt!84441))) (bitIndex!0 (size!1163 (buf!1517 (_2!2580 lt!84440))) (currentByte!3090 (_2!2580 lt!84440)) (currentBit!3085 (_2!2580 lt!84440)))))))

(declare-fun b!54471 () Bool)

(declare-fun res!45458 () Bool)

(assert (=> b!54471 (=> (not res!45458) (not e!36347))))

(declare-fun lt!84439 () (_ BitVec 64))

(declare-fun lt!84433 () (_ BitVec 64))

(assert (=> b!54471 (= res!45458 (= (bitIndex!0 (size!1163 (buf!1517 (_2!2580 lt!84440))) (currentByte!3090 (_2!2580 lt!84440)) (currentBit!3085 (_2!2580 lt!84440))) (bvadd lt!84439 lt!84433)))))

(assert (=> b!54471 (or (not (= (bvand lt!84439 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!84433 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!84439 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!84439 lt!84433) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!54471 (= lt!84433 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!54471 (= lt!84439 (bitIndex!0 (size!1163 (buf!1517 thiss!1379)) (currentByte!3090 thiss!1379) (currentBit!3085 thiss!1379)))))

(declare-fun b!54472 () Bool)

(declare-fun e!36348 () Bool)

(assert (=> b!54472 (= e!36345 e!36348)))

(declare-fun res!45455 () Bool)

(assert (=> b!54472 (=> (not res!45455) (not e!36348))))

(declare-fun lt!84434 () tuple2!4964)

(assert (=> b!54472 (= res!45455 (and (= (_2!2593 lt!84434) lt!84442) (= (_1!2593 lt!84434) (_2!2580 lt!84437))))))

(assert (=> b!54472 (= lt!84434 (readBitPure!0 (readerFrom!0 (_2!2580 lt!84437) (currentBit!3085 thiss!1379) (currentByte!3090 thiss!1379))))))

(declare-fun b!54473 () Bool)

(declare-fun res!45456 () Bool)

(assert (=> b!54473 (=> (not res!45456) (not e!36345))))

(assert (=> b!54473 (= res!45456 (isPrefixOf!0 thiss!1379 (_2!2580 lt!84437)))))

(declare-fun b!54474 () Bool)

(declare-fun res!45457 () Bool)

(assert (=> b!54474 (=> (not res!45457) (not e!36347))))

(assert (=> b!54474 (= res!45457 (isPrefixOf!0 thiss!1379 (_2!2580 lt!84440)))))

(declare-fun b!54475 () Bool)

(assert (=> b!54475 (= e!36348 (= (bitIndex!0 (size!1163 (buf!1517 (_1!2593 lt!84434))) (currentByte!3090 (_1!2593 lt!84434)) (currentBit!3085 (_1!2593 lt!84434))) (bitIndex!0 (size!1163 (buf!1517 (_2!2580 lt!84437))) (currentByte!3090 (_2!2580 lt!84437)) (currentBit!3085 (_2!2580 lt!84437)))))))

(assert (= (and d!17344 res!45459) b!54468))

(assert (= (and b!54468 res!45453) b!54473))

(assert (= (and b!54473 res!45456) b!54472))

(assert (= (and b!54472 res!45455) b!54475))

(assert (= (and d!17344 res!45452) b!54471))

(assert (= (and b!54471 res!45458) b!54474))

(assert (= (and b!54474 res!45457) b!54469))

(assert (= (and b!54469 res!45454) b!54470))

(declare-fun m!85657 () Bool)

(assert (=> b!54468 m!85657))

(assert (=> b!54468 m!85159))

(declare-fun m!85659 () Bool)

(assert (=> b!54470 m!85659))

(declare-fun m!85661 () Bool)

(assert (=> b!54470 m!85661))

(declare-fun m!85663 () Bool)

(assert (=> b!54472 m!85663))

(assert (=> b!54472 m!85663))

(declare-fun m!85665 () Bool)

(assert (=> b!54472 m!85665))

(declare-fun m!85667 () Bool)

(assert (=> d!17344 m!85667))

(declare-fun m!85669 () Bool)

(assert (=> d!17344 m!85669))

(assert (=> d!17344 m!85283))

(assert (=> b!54471 m!85661))

(assert (=> b!54471 m!85159))

(declare-fun m!85671 () Bool)

(assert (=> b!54475 m!85671))

(assert (=> b!54475 m!85657))

(declare-fun m!85673 () Bool)

(assert (=> b!54474 m!85673))

(declare-fun m!85675 () Bool)

(assert (=> b!54469 m!85675))

(declare-fun m!85677 () Bool)

(assert (=> b!54469 m!85677))

(declare-fun m!85679 () Bool)

(assert (=> b!54469 m!85679))

(declare-fun m!85681 () Bool)

(assert (=> b!54473 m!85681))

(assert (=> b!54168 d!17344))

(declare-fun d!17354 () Bool)

(declare-fun res!45462 () Bool)

(declare-fun e!36349 () Bool)

(assert (=> d!17354 (=> (not res!45462) (not e!36349))))

(assert (=> d!17354 (= res!45462 (= (size!1163 (buf!1517 thiss!1379)) (size!1163 (buf!1517 thiss!1379))))))

(assert (=> d!17354 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!36349)))

(declare-fun b!54476 () Bool)

(declare-fun res!45461 () Bool)

(assert (=> b!54476 (=> (not res!45461) (not e!36349))))

(assert (=> b!54476 (= res!45461 (bvsle (bitIndex!0 (size!1163 (buf!1517 thiss!1379)) (currentByte!3090 thiss!1379) (currentBit!3085 thiss!1379)) (bitIndex!0 (size!1163 (buf!1517 thiss!1379)) (currentByte!3090 thiss!1379) (currentBit!3085 thiss!1379))))))

(declare-fun b!54477 () Bool)

(declare-fun e!36350 () Bool)

(assert (=> b!54477 (= e!36349 e!36350)))

(declare-fun res!45460 () Bool)

(assert (=> b!54477 (=> res!45460 e!36350)))

(assert (=> b!54477 (= res!45460 (= (size!1163 (buf!1517 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!54478 () Bool)

(assert (=> b!54478 (= e!36350 (arrayBitRangesEq!0 (buf!1517 thiss!1379) (buf!1517 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1163 (buf!1517 thiss!1379)) (currentByte!3090 thiss!1379) (currentBit!3085 thiss!1379))))))

(assert (= (and d!17354 res!45462) b!54476))

(assert (= (and b!54476 res!45461) b!54477))

(assert (= (and b!54477 (not res!45460)) b!54478))

(assert (=> b!54476 m!85159))

(assert (=> b!54476 m!85159))

(assert (=> b!54478 m!85159))

(assert (=> b!54478 m!85159))

(declare-fun m!85683 () Bool)

(assert (=> b!54478 m!85683))

(assert (=> b!54171 d!17354))

(declare-fun d!17356 () Bool)

(assert (=> d!17356 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!84445 () Unit!3735)

(declare-fun choose!11 (BitStream!2014) Unit!3735)

(assert (=> d!17356 (= lt!84445 (choose!11 thiss!1379))))

(assert (=> d!17356 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!84445)))

(declare-fun bs!4375 () Bool)

(assert (= bs!4375 d!17356))

(assert (=> bs!4375 m!85155))

(declare-fun m!85685 () Bool)

(assert (=> bs!4375 m!85685))

(assert (=> b!54171 d!17356))

(declare-fun d!17358 () Bool)

(declare-fun e!36353 () Bool)

(assert (=> d!17358 e!36353))

(declare-fun res!45468 () Bool)

(assert (=> d!17358 (=> (not res!45468) (not e!36353))))

(declare-fun lt!84460 () (_ BitVec 64))

(declare-fun lt!84463 () (_ BitVec 64))

(declare-fun lt!84462 () (_ BitVec 64))

(assert (=> d!17358 (= res!45468 (= lt!84462 (bvsub lt!84460 lt!84463)))))

(assert (=> d!17358 (or (= (bvand lt!84460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!84463 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!84460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!84460 lt!84463) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!17358 (= lt!84463 (remainingBits!0 ((_ sign_extend 32) (size!1163 (buf!1517 thiss!1379))) ((_ sign_extend 32) (currentByte!3090 thiss!1379)) ((_ sign_extend 32) (currentBit!3085 thiss!1379))))))

(declare-fun lt!84459 () (_ BitVec 64))

(declare-fun lt!84458 () (_ BitVec 64))

(assert (=> d!17358 (= lt!84460 (bvmul lt!84459 lt!84458))))

(assert (=> d!17358 (or (= lt!84459 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!84458 (bvsdiv (bvmul lt!84459 lt!84458) lt!84459)))))

(assert (=> d!17358 (= lt!84458 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!17358 (= lt!84459 ((_ sign_extend 32) (size!1163 (buf!1517 thiss!1379))))))

(assert (=> d!17358 (= lt!84462 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3090 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3085 thiss!1379))))))

(assert (=> d!17358 (invariant!0 (currentBit!3085 thiss!1379) (currentByte!3090 thiss!1379) (size!1163 (buf!1517 thiss!1379)))))

(assert (=> d!17358 (= (bitIndex!0 (size!1163 (buf!1517 thiss!1379)) (currentByte!3090 thiss!1379) (currentBit!3085 thiss!1379)) lt!84462)))

(declare-fun b!54483 () Bool)

(declare-fun res!45467 () Bool)

(assert (=> b!54483 (=> (not res!45467) (not e!36353))))

(assert (=> b!54483 (= res!45467 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!84462))))

(declare-fun b!54484 () Bool)

(declare-fun lt!84461 () (_ BitVec 64))

(assert (=> b!54484 (= e!36353 (bvsle lt!84462 (bvmul lt!84461 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!54484 (or (= lt!84461 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!84461 #b0000000000000000000000000000000000000000000000000000000000001000) lt!84461)))))

(assert (=> b!54484 (= lt!84461 ((_ sign_extend 32) (size!1163 (buf!1517 thiss!1379))))))

(assert (= (and d!17358 res!45468) b!54483))

(assert (= (and b!54483 res!45467) b!54484))

(declare-fun m!85687 () Bool)

(assert (=> d!17358 m!85687))

(assert (=> d!17358 m!85295))

(assert (=> b!54171 d!17358))

(declare-fun d!17360 () Bool)

(assert (=> d!17360 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1163 (buf!1517 thiss!1379))) ((_ sign_extend 32) (currentByte!3090 thiss!1379)) ((_ sign_extend 32) (currentBit!3085 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1163 (buf!1517 thiss!1379))) ((_ sign_extend 32) (currentByte!3090 thiss!1379)) ((_ sign_extend 32) (currentBit!3085 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4376 () Bool)

(assert (= bs!4376 d!17360))

(assert (=> bs!4376 m!85687))

(assert (=> b!54172 d!17360))

(push 1)

(assert (not d!17284))

(assert (not d!17340))

(assert (not b!54401))

(assert (not b!54476))

(assert (not b!54246))

(assert (not b!54235))

(assert (not b!54399))

(assert (not b!54473))

(assert (not b!54407))

(assert (not b!54468))

(assert (not b!54398))

(assert (not d!17286))

(assert (not b!54400))

(assert (not b!54278))

(assert (not b!54475))

(assert (not b!54308))

(assert (not b!54245))

(assert (not b!54470))

(assert (not b!54275))

(assert (not d!17360))

(assert (not b!54424))

(assert (not b!54397))

(assert (not b!54277))

(assert (not b!54306))

(assert (not d!17308))

(assert (not bm!682))

(assert (not b!54472))

(assert (not b!54402))

(assert (not d!17358))

(assert (not d!17334))

(assert (not d!17344))

(assert (not b!54409))

(assert (not b!54469))

(assert (not b!54247))

(assert (not b!54478))

(assert (not d!17290))

(assert (not b!54471))

(assert (not b!54474))

(assert (not b!54274))

(assert (not d!17342))

(assert (not d!17356))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

