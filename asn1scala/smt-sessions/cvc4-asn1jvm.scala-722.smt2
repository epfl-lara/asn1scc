; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20222 () Bool)

(assert start!20222)

(declare-fun b!101277 () Bool)

(declare-fun res!83205 () Bool)

(declare-fun e!66220 () Bool)

(assert (=> b!101277 (=> (not res!83205) (not e!66220))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!101277 (= res!83205 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!101278 () Bool)

(declare-fun e!66218 () Bool)

(declare-datatypes ((array!4753 0))(
  ( (array!4754 (arr!2762 (Array (_ BitVec 32) (_ BitVec 8))) (size!2169 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3812 0))(
  ( (BitStream!3813 (buf!2526 array!4753) (currentByte!4993 (_ BitVec 32)) (currentBit!4988 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3812)

(declare-fun array_inv!1971 (array!4753) Bool)

(assert (=> b!101278 (= e!66218 (array_inv!1971 (buf!2526 thiss!1305)))))

(declare-fun res!83204 () Bool)

(assert (=> start!20222 (=> (not res!83204) (not e!66220))))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> start!20222 (= res!83204 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20222 e!66220))

(assert (=> start!20222 true))

(declare-fun inv!12 (BitStream!3812) Bool)

(assert (=> start!20222 (and (inv!12 thiss!1305) e!66218)))

(declare-fun b!101279 () Bool)

(declare-fun res!83206 () Bool)

(declare-fun e!66222 () Bool)

(assert (=> b!101279 (=> (not res!83206) (not e!66222))))

(declare-datatypes ((Unit!6210 0))(
  ( (Unit!6211) )
))
(declare-datatypes ((tuple2!8194 0))(
  ( (tuple2!8195 (_1!4352 Unit!6210) (_2!4352 BitStream!3812)) )
))
(declare-fun lt!147037 () tuple2!8194)

(declare-fun isPrefixOf!0 (BitStream!3812 BitStream!3812) Bool)

(assert (=> b!101279 (= res!83206 (isPrefixOf!0 thiss!1305 (_2!4352 lt!147037)))))

(declare-fun b!101280 () Bool)

(declare-fun e!66216 () Bool)

(declare-datatypes ((tuple2!8196 0))(
  ( (tuple2!8197 (_1!4353 BitStream!3812) (_2!4353 Bool)) )
))
(declare-fun lt!147038 () tuple2!8196)

(declare-fun lt!147028 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!101280 (= e!66216 (= (bitIndex!0 (size!2169 (buf!2526 (_1!4353 lt!147038))) (currentByte!4993 (_1!4353 lt!147038)) (currentBit!4988 (_1!4353 lt!147038))) lt!147028))))

(declare-fun b!101281 () Bool)

(declare-fun res!83203 () Bool)

(declare-fun e!66217 () Bool)

(assert (=> b!101281 (=> (not res!83203) (not e!66217))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!101281 (= res!83203 (invariant!0 (currentBit!4988 thiss!1305) (currentByte!4993 thiss!1305) (size!2169 (buf!2526 (_2!4352 lt!147037)))))))

(declare-fun b!101282 () Bool)

(assert (=> b!101282 (= e!66220 (not true))))

(declare-datatypes ((tuple2!8198 0))(
  ( (tuple2!8199 (_1!4354 BitStream!3812) (_2!4354 BitStream!3812)) )
))
(declare-fun lt!147039 () tuple2!8198)

(declare-fun lt!147033 () Bool)

(declare-fun readBitPure!0 (BitStream!3812) tuple2!8196)

(assert (=> b!101282 (= (_2!4353 (readBitPure!0 (_1!4354 lt!147039))) lt!147033)))

(declare-fun lt!147029 () tuple2!8198)

(declare-fun lt!147036 () tuple2!8194)

(declare-fun reader!0 (BitStream!3812 BitStream!3812) tuple2!8198)

(assert (=> b!101282 (= lt!147029 (reader!0 (_2!4352 lt!147037) (_2!4352 lt!147036)))))

(assert (=> b!101282 (= lt!147039 (reader!0 thiss!1305 (_2!4352 lt!147036)))))

(declare-fun e!66215 () Bool)

(assert (=> b!101282 e!66215))

(declare-fun res!83207 () Bool)

(assert (=> b!101282 (=> (not res!83207) (not e!66215))))

(declare-fun lt!147032 () tuple2!8196)

(declare-fun lt!147031 () tuple2!8196)

(assert (=> b!101282 (= res!83207 (= (bitIndex!0 (size!2169 (buf!2526 (_1!4353 lt!147032))) (currentByte!4993 (_1!4353 lt!147032)) (currentBit!4988 (_1!4353 lt!147032))) (bitIndex!0 (size!2169 (buf!2526 (_1!4353 lt!147031))) (currentByte!4993 (_1!4353 lt!147031)) (currentBit!4988 (_1!4353 lt!147031)))))))

(declare-fun lt!147030 () Unit!6210)

(declare-fun lt!147040 () BitStream!3812)

(declare-fun readBitPrefixLemma!0 (BitStream!3812 BitStream!3812) Unit!6210)

(assert (=> b!101282 (= lt!147030 (readBitPrefixLemma!0 lt!147040 (_2!4352 lt!147036)))))

(assert (=> b!101282 (= lt!147031 (readBitPure!0 (BitStream!3813 (buf!2526 (_2!4352 lt!147036)) (currentByte!4993 thiss!1305) (currentBit!4988 thiss!1305))))))

(assert (=> b!101282 (= lt!147032 (readBitPure!0 lt!147040))))

(assert (=> b!101282 (= lt!147040 (BitStream!3813 (buf!2526 (_2!4352 lt!147037)) (currentByte!4993 thiss!1305) (currentBit!4988 thiss!1305)))))

(assert (=> b!101282 e!66217))

(declare-fun res!83208 () Bool)

(assert (=> b!101282 (=> (not res!83208) (not e!66217))))

(assert (=> b!101282 (= res!83208 (isPrefixOf!0 thiss!1305 (_2!4352 lt!147036)))))

(declare-fun lt!147035 () Unit!6210)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3812 BitStream!3812 BitStream!3812) Unit!6210)

(assert (=> b!101282 (= lt!147035 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4352 lt!147037) (_2!4352 lt!147036)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3812 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8194)

(assert (=> b!101282 (= lt!147036 (appendNLeastSignificantBitsLoop!0 (_2!4352 lt!147037) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!66221 () Bool)

(assert (=> b!101282 e!66221))

(declare-fun res!83201 () Bool)

(assert (=> b!101282 (=> (not res!83201) (not e!66221))))

(assert (=> b!101282 (= res!83201 (= (size!2169 (buf!2526 thiss!1305)) (size!2169 (buf!2526 (_2!4352 lt!147037)))))))

(declare-fun appendBit!0 (BitStream!3812 Bool) tuple2!8194)

(assert (=> b!101282 (= lt!147037 (appendBit!0 thiss!1305 lt!147033))))

(assert (=> b!101282 (= lt!147033 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!101283 () Bool)

(assert (=> b!101283 (= e!66217 (invariant!0 (currentBit!4988 thiss!1305) (currentByte!4993 thiss!1305) (size!2169 (buf!2526 (_2!4352 lt!147036)))))))

(declare-fun b!101284 () Bool)

(declare-fun res!83200 () Bool)

(assert (=> b!101284 (=> (not res!83200) (not e!66220))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!101284 (= res!83200 (validate_offset_bits!1 ((_ sign_extend 32) (size!2169 (buf!2526 thiss!1305))) ((_ sign_extend 32) (currentByte!4993 thiss!1305)) ((_ sign_extend 32) (currentBit!4988 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!101285 () Bool)

(declare-fun res!83209 () Bool)

(assert (=> b!101285 (=> (not res!83209) (not e!66220))))

(assert (=> b!101285 (= res!83209 (bvslt i!615 nBits!396))))

(declare-fun b!101286 () Bool)

(assert (=> b!101286 (= e!66215 (= (_2!4353 lt!147032) (_2!4353 lt!147031)))))

(declare-fun b!101287 () Bool)

(assert (=> b!101287 (= e!66221 e!66222)))

(declare-fun res!83210 () Bool)

(assert (=> b!101287 (=> (not res!83210) (not e!66222))))

(declare-fun lt!147034 () (_ BitVec 64))

(assert (=> b!101287 (= res!83210 (= lt!147028 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!147034)))))

(assert (=> b!101287 (= lt!147028 (bitIndex!0 (size!2169 (buf!2526 (_2!4352 lt!147037))) (currentByte!4993 (_2!4352 lt!147037)) (currentBit!4988 (_2!4352 lt!147037))))))

(assert (=> b!101287 (= lt!147034 (bitIndex!0 (size!2169 (buf!2526 thiss!1305)) (currentByte!4993 thiss!1305) (currentBit!4988 thiss!1305)))))

(declare-fun b!101288 () Bool)

(assert (=> b!101288 (= e!66222 e!66216)))

(declare-fun res!83202 () Bool)

(assert (=> b!101288 (=> (not res!83202) (not e!66216))))

(assert (=> b!101288 (= res!83202 (and (= (_2!4353 lt!147038) lt!147033) (= (_1!4353 lt!147038) (_2!4352 lt!147037))))))

(declare-fun readerFrom!0 (BitStream!3812 (_ BitVec 32) (_ BitVec 32)) BitStream!3812)

(assert (=> b!101288 (= lt!147038 (readBitPure!0 (readerFrom!0 (_2!4352 lt!147037) (currentBit!4988 thiss!1305) (currentByte!4993 thiss!1305))))))

(assert (= (and start!20222 res!83204) b!101284))

(assert (= (and b!101284 res!83200) b!101277))

(assert (= (and b!101277 res!83205) b!101285))

(assert (= (and b!101285 res!83209) b!101282))

(assert (= (and b!101282 res!83201) b!101287))

(assert (= (and b!101287 res!83210) b!101279))

(assert (= (and b!101279 res!83206) b!101288))

(assert (= (and b!101288 res!83202) b!101280))

(assert (= (and b!101282 res!83208) b!101281))

(assert (= (and b!101281 res!83203) b!101283))

(assert (= (and b!101282 res!83207) b!101286))

(assert (= start!20222 b!101278))

(declare-fun m!147307 () Bool)

(assert (=> b!101283 m!147307))

(declare-fun m!147309 () Bool)

(assert (=> b!101279 m!147309))

(declare-fun m!147311 () Bool)

(assert (=> b!101287 m!147311))

(declare-fun m!147313 () Bool)

(assert (=> b!101287 m!147313))

(declare-fun m!147315 () Bool)

(assert (=> b!101284 m!147315))

(declare-fun m!147317 () Bool)

(assert (=> b!101281 m!147317))

(declare-fun m!147319 () Bool)

(assert (=> b!101282 m!147319))

(declare-fun m!147321 () Bool)

(assert (=> b!101282 m!147321))

(declare-fun m!147323 () Bool)

(assert (=> b!101282 m!147323))

(declare-fun m!147325 () Bool)

(assert (=> b!101282 m!147325))

(declare-fun m!147327 () Bool)

(assert (=> b!101282 m!147327))

(declare-fun m!147329 () Bool)

(assert (=> b!101282 m!147329))

(declare-fun m!147331 () Bool)

(assert (=> b!101282 m!147331))

(declare-fun m!147333 () Bool)

(assert (=> b!101282 m!147333))

(declare-fun m!147335 () Bool)

(assert (=> b!101282 m!147335))

(declare-fun m!147337 () Bool)

(assert (=> b!101282 m!147337))

(declare-fun m!147339 () Bool)

(assert (=> b!101282 m!147339))

(declare-fun m!147341 () Bool)

(assert (=> b!101282 m!147341))

(declare-fun m!147343 () Bool)

(assert (=> start!20222 m!147343))

(declare-fun m!147345 () Bool)

(assert (=> b!101288 m!147345))

(assert (=> b!101288 m!147345))

(declare-fun m!147347 () Bool)

(assert (=> b!101288 m!147347))

(declare-fun m!147349 () Bool)

(assert (=> b!101278 m!147349))

(declare-fun m!147351 () Bool)

(assert (=> b!101280 m!147351))

(declare-fun m!147353 () Bool)

(assert (=> b!101277 m!147353))

(push 1)

(assert (not b!101288))

(assert (not b!101281))

(assert (not b!101279))

(assert (not b!101283))

(assert (not b!101277))

(assert (not b!101282))

(assert (not start!20222))

(assert (not b!101278))

(assert (not b!101280))

(assert (not b!101287))

(assert (not b!101284))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

