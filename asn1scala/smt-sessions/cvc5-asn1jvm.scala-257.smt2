; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4960 () Bool)

(assert start!4960)

(declare-fun b!19756 () Bool)

(declare-fun e!13211 () Bool)

(declare-fun e!13213 () Bool)

(assert (=> b!19756 (= e!13211 e!13213)))

(declare-fun res!17245 () Bool)

(assert (=> b!19756 (=> res!17245 e!13213)))

(declare-datatypes ((array!1427 0))(
  ( (array!1428 (arr!1048 (Array (_ BitVec 32) (_ BitVec 8))) (size!607 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1048 0))(
  ( (BitStream!1049 (buf!910 array!1427) (currentByte!2193 (_ BitVec 32)) (currentBit!2188 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1048)

(declare-datatypes ((Unit!1761 0))(
  ( (Unit!1762) )
))
(declare-datatypes ((tuple2!2288 0))(
  ( (tuple2!2289 (_1!1229 Unit!1761) (_2!1229 BitStream!1048)) )
))
(declare-fun lt!28100 () tuple2!2288)

(declare-fun isPrefixOf!0 (BitStream!1048 BitStream!1048) Bool)

(assert (=> b!19756 (= res!17245 (not (isPrefixOf!0 thiss!1379 (_2!1229 lt!28100))))))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!19756 (validate_offset_bits!1 ((_ sign_extend 32) (size!607 (buf!910 (_2!1229 lt!28100)))) ((_ sign_extend 32) (currentByte!2193 (_2!1229 lt!28100))) ((_ sign_extend 32) (currentBit!2188 (_2!1229 lt!28100))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!28104 () Unit!1761)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1048 BitStream!1048 (_ BitVec 64) (_ BitVec 64)) Unit!1761)

(assert (=> b!19756 (= lt!28104 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1229 lt!28100) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1427)

(declare-fun appendBitFromByte!0 (BitStream!1048 (_ BitVec 8) (_ BitVec 32)) tuple2!2288)

(assert (=> b!19756 (= lt!28100 (appendBitFromByte!0 thiss!1379 (select (arr!1048 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!19757 () Bool)

(declare-datatypes ((List!225 0))(
  ( (Nil!222) (Cons!221 (h!340 Bool) (t!975 List!225)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!1048 array!1427 (_ BitVec 64) (_ BitVec 64)) List!225)

(assert (=> b!19757 (= e!13213 (not (= (byteArrayBitContentToList!0 (_2!1229 lt!28100) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) Nil!222)))))

(declare-fun lt!28099 () List!225)

(declare-datatypes ((tuple2!2290 0))(
  ( (tuple2!2291 (_1!1230 BitStream!1048) (_2!1230 BitStream!1048)) )
))
(declare-fun lt!28103 () tuple2!2290)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1048 BitStream!1048 (_ BitVec 64)) List!225)

(assert (=> b!19757 (= lt!28099 (bitStreamReadBitsIntoList!0 (_2!1229 lt!28100) (_1!1230 lt!28103) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!19757 (validate_offset_bits!1 ((_ sign_extend 32) (size!607 (buf!910 (_2!1229 lt!28100)))) ((_ sign_extend 32) (currentByte!2193 thiss!1379)) ((_ sign_extend 32) (currentBit!2188 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!28102 () Unit!1761)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1048 array!1427 (_ BitVec 64)) Unit!1761)

(assert (=> b!19757 (= lt!28102 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!910 (_2!1229 lt!28100)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1048 BitStream!1048) tuple2!2290)

(assert (=> b!19757 (= lt!28103 (reader!0 thiss!1379 (_2!1229 lt!28100)))))

(declare-fun b!19758 () Bool)

(declare-fun res!17246 () Bool)

(declare-fun e!13214 () Bool)

(assert (=> b!19758 (=> (not res!17246) (not e!13214))))

(assert (=> b!19758 (= res!17246 (validate_offset_bits!1 ((_ sign_extend 32) (size!607 (buf!910 thiss!1379))) ((_ sign_extend 32) (currentByte!2193 thiss!1379)) ((_ sign_extend 32) (currentBit!2188 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!19759 () Bool)

(assert (=> b!19759 (= e!13214 (not e!13211))))

(declare-fun res!17244 () Bool)

(assert (=> b!19759 (=> res!17244 e!13211)))

(assert (=> b!19759 (= res!17244 (bvsge i!635 to!314))))

(assert (=> b!19759 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!28105 () Unit!1761)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1048) Unit!1761)

(assert (=> b!19759 (= lt!28105 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!28101 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!19759 (= lt!28101 (bitIndex!0 (size!607 (buf!910 thiss!1379)) (currentByte!2193 thiss!1379) (currentBit!2188 thiss!1379)))))

(declare-fun res!17243 () Bool)

(assert (=> start!4960 (=> (not res!17243) (not e!13214))))

(assert (=> start!4960 (= res!17243 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!607 srcBuffer!2))))))))

(assert (=> start!4960 e!13214))

(assert (=> start!4960 true))

(declare-fun array_inv!577 (array!1427) Bool)

(assert (=> start!4960 (array_inv!577 srcBuffer!2)))

(declare-fun e!13212 () Bool)

(declare-fun inv!12 (BitStream!1048) Bool)

(assert (=> start!4960 (and (inv!12 thiss!1379) e!13212)))

(declare-fun b!19760 () Bool)

(assert (=> b!19760 (= e!13212 (array_inv!577 (buf!910 thiss!1379)))))

(assert (= (and start!4960 res!17243) b!19758))

(assert (= (and b!19758 res!17246) b!19759))

(assert (= (and b!19759 (not res!17244)) b!19756))

(assert (= (and b!19756 (not res!17245)) b!19757))

(assert (= start!4960 b!19760))

(declare-fun m!26739 () Bool)

(assert (=> b!19758 m!26739))

(declare-fun m!26741 () Bool)

(assert (=> b!19756 m!26741))

(declare-fun m!26743 () Bool)

(assert (=> b!19756 m!26743))

(assert (=> b!19756 m!26741))

(declare-fun m!26745 () Bool)

(assert (=> b!19756 m!26745))

(declare-fun m!26747 () Bool)

(assert (=> b!19756 m!26747))

(declare-fun m!26749 () Bool)

(assert (=> b!19756 m!26749))

(declare-fun m!26751 () Bool)

(assert (=> start!4960 m!26751))

(declare-fun m!26753 () Bool)

(assert (=> start!4960 m!26753))

(declare-fun m!26755 () Bool)

(assert (=> b!19757 m!26755))

(declare-fun m!26757 () Bool)

(assert (=> b!19757 m!26757))

(declare-fun m!26759 () Bool)

(assert (=> b!19757 m!26759))

(declare-fun m!26761 () Bool)

(assert (=> b!19757 m!26761))

(declare-fun m!26763 () Bool)

(assert (=> b!19757 m!26763))

(declare-fun m!26765 () Bool)

(assert (=> b!19759 m!26765))

(declare-fun m!26767 () Bool)

(assert (=> b!19759 m!26767))

(declare-fun m!26769 () Bool)

(assert (=> b!19759 m!26769))

(declare-fun m!26771 () Bool)

(assert (=> b!19760 m!26771))

(push 1)

(assert (not b!19757))

(assert (not start!4960))

(assert (not b!19758))

(assert (not b!19759))

(assert (not b!19756))

(assert (not b!19760))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!19818 () Bool)

(declare-fun e!13264 () Bool)

(declare-fun lt!28165 () List!225)

(declare-fun length!44 (List!225) Int)

(assert (=> b!19818 (= e!13264 (> (length!44 lt!28165) 0))))

(declare-fun b!19817 () Bool)

(declare-fun isEmpty!49 (List!225) Bool)

(assert (=> b!19817 (= e!13264 (isEmpty!49 lt!28165))))

(declare-fun b!19815 () Bool)

(declare-datatypes ((tuple2!2302 0))(
  ( (tuple2!2303 (_1!1236 List!225) (_2!1236 BitStream!1048)) )
))
(declare-fun e!13265 () tuple2!2302)

(assert (=> b!19815 (= e!13265 (tuple2!2303 Nil!222 (_1!1230 lt!28103)))))

(declare-fun b!19816 () Bool)

(declare-datatypes ((tuple2!2306 0))(
  ( (tuple2!2307 (_1!1238 Bool) (_2!1238 BitStream!1048)) )
))
(declare-fun lt!28164 () tuple2!2306)

(declare-fun lt!28163 () (_ BitVec 64))

(assert (=> b!19816 (= e!13265 (tuple2!2303 (Cons!221 (_1!1238 lt!28164) (bitStreamReadBitsIntoList!0 (_2!1229 lt!28100) (_2!1238 lt!28164) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!28163))) (_2!1238 lt!28164)))))

(declare-fun readBit!0 (BitStream!1048) tuple2!2306)

(assert (=> b!19816 (= lt!28164 (readBit!0 (_1!1230 lt!28103)))))

(assert (=> b!19816 (= lt!28163 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!6438 () Bool)

(assert (=> d!6438 e!13264))

(declare-fun c!1409 () Bool)

(assert (=> d!6438 (= c!1409 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!6438 (= lt!28165 (_1!1236 e!13265))))

(declare-fun c!1410 () Bool)

(assert (=> d!6438 (= c!1410 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!6438 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!6438 (= (bitStreamReadBitsIntoList!0 (_2!1229 lt!28100) (_1!1230 lt!28103) #b0000000000000000000000000000000000000000000000000000000000000001) lt!28165)))

(assert (= (and d!6438 c!1410) b!19815))

(assert (= (and d!6438 (not c!1410)) b!19816))

(assert (= (and d!6438 c!1409) b!19817))

(assert (= (and d!6438 (not c!1409)) b!19818))

(declare-fun m!26851 () Bool)

(assert (=> b!19818 m!26851))

(declare-fun m!26853 () Bool)

(assert (=> b!19817 m!26853))

(declare-fun m!26855 () Bool)

(assert (=> b!19816 m!26855))

(declare-fun m!26857 () Bool)

(assert (=> b!19816 m!26857))

(assert (=> b!19757 d!6438))

(declare-fun d!6442 () Bool)

(declare-fun c!1414 () Bool)

(assert (=> d!6442 (= c!1414 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!13269 () List!225)

(assert (=> d!6442 (= (byteArrayBitContentToList!0 (_2!1229 lt!28100) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!13269)))

(declare-fun b!19825 () Bool)

(assert (=> b!19825 (= e!13269 Nil!222)))

(declare-fun b!19826 () Bool)

(assert (=> b!19826 (= e!13269 (Cons!221 (not (= (bvand ((_ sign_extend 24) (select (arr!1048 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1229 lt!28100) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!6442 c!1414) b!19825))

(assert (= (and d!6442 (not c!1414)) b!19826))

(assert (=> b!19826 m!26741))

(declare-fun m!26865 () Bool)

(assert (=> b!19826 m!26865))

(declare-fun m!26867 () Bool)

(assert (=> b!19826 m!26867))

(assert (=> b!19757 d!6442))

(declare-fun d!6450 () Bool)

(assert (=> d!6450 (validate_offset_bits!1 ((_ sign_extend 32) (size!607 (buf!910 (_2!1229 lt!28100)))) ((_ sign_extend 32) (currentByte!2193 thiss!1379)) ((_ sign_extend 32) (currentBit!2188 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!28171 () Unit!1761)

(declare-fun choose!9 (BitStream!1048 array!1427 (_ BitVec 64) BitStream!1048) Unit!1761)

(assert (=> d!6450 (= lt!28171 (choose!9 thiss!1379 (buf!910 (_2!1229 lt!28100)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1049 (buf!910 (_2!1229 lt!28100)) (currentByte!2193 thiss!1379) (currentBit!2188 thiss!1379))))))

(assert (=> d!6450 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!910 (_2!1229 lt!28100)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!28171)))

(declare-fun bs!1897 () Bool)

(assert (= bs!1897 d!6450))

(assert (=> bs!1897 m!26763))

(declare-fun m!26869 () Bool)

(assert (=> bs!1897 m!26869))

(assert (=> b!19757 d!6450))

(declare-fun e!13286 () Bool)

(declare-fun lt!28351 () (_ BitVec 64))

(declare-fun b!19868 () Bool)

(declare-fun lt!28345 () (_ BitVec 64))

(declare-fun lt!28341 () tuple2!2290)

(declare-fun withMovedBitIndex!0 (BitStream!1048 (_ BitVec 64)) BitStream!1048)

(assert (=> b!19868 (= e!13286 (= (_1!1230 lt!28341) (withMovedBitIndex!0 (_2!1230 lt!28341) (bvsub lt!28351 lt!28345))))))

(assert (=> b!19868 (or (= (bvand lt!28351 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!28345 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!28351 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!28351 lt!28345) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!19868 (= lt!28345 (bitIndex!0 (size!607 (buf!910 (_2!1229 lt!28100))) (currentByte!2193 (_2!1229 lt!28100)) (currentBit!2188 (_2!1229 lt!28100))))))

(assert (=> b!19868 (= lt!28351 (bitIndex!0 (size!607 (buf!910 thiss!1379)) (currentByte!2193 thiss!1379) (currentBit!2188 thiss!1379)))))

(declare-fun b!19869 () Bool)

(declare-fun res!17296 () Bool)

(assert (=> b!19869 (=> (not res!17296) (not e!13286))))

(assert (=> b!19869 (= res!17296 (isPrefixOf!0 (_1!1230 lt!28341) thiss!1379))))

(declare-fun b!19870 () Bool)

(declare-fun e!13287 () Unit!1761)

(declare-fun lt!28348 () Unit!1761)

(assert (=> b!19870 (= e!13287 lt!28348)))

(declare-fun lt!28336 () (_ BitVec 64))

(assert (=> b!19870 (= lt!28336 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!28347 () (_ BitVec 64))

(assert (=> b!19870 (= lt!28347 (bitIndex!0 (size!607 (buf!910 thiss!1379)) (currentByte!2193 thiss!1379) (currentBit!2188 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1427 array!1427 (_ BitVec 64) (_ BitVec 64)) Unit!1761)

(assert (=> b!19870 (= lt!28348 (arrayBitRangesEqSymmetric!0 (buf!910 thiss!1379) (buf!910 (_2!1229 lt!28100)) lt!28336 lt!28347))))

(declare-fun arrayBitRangesEq!0 (array!1427 array!1427 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!19870 (arrayBitRangesEq!0 (buf!910 (_2!1229 lt!28100)) (buf!910 thiss!1379) lt!28336 lt!28347)))

(declare-fun b!19871 () Bool)

(declare-fun res!17297 () Bool)

(assert (=> b!19871 (=> (not res!17297) (not e!13286))))

(assert (=> b!19871 (= res!17297 (isPrefixOf!0 (_2!1230 lt!28341) (_2!1229 lt!28100)))))

(declare-fun d!6452 () Bool)

(assert (=> d!6452 e!13286))

(declare-fun res!17295 () Bool)

(assert (=> d!6452 (=> (not res!17295) (not e!13286))))

(assert (=> d!6452 (= res!17295 (isPrefixOf!0 (_1!1230 lt!28341) (_2!1230 lt!28341)))))

(declare-fun lt!28333 () BitStream!1048)

(assert (=> d!6452 (= lt!28341 (tuple2!2291 lt!28333 (_2!1229 lt!28100)))))

(declare-fun lt!28342 () Unit!1761)

(declare-fun lt!28334 () Unit!1761)

(assert (=> d!6452 (= lt!28342 lt!28334)))

(assert (=> d!6452 (isPrefixOf!0 lt!28333 (_2!1229 lt!28100))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1048 BitStream!1048 BitStream!1048) Unit!1761)

(assert (=> d!6452 (= lt!28334 (lemmaIsPrefixTransitive!0 lt!28333 (_2!1229 lt!28100) (_2!1229 lt!28100)))))

(declare-fun lt!28339 () Unit!1761)

(declare-fun lt!28335 () Unit!1761)

(assert (=> d!6452 (= lt!28339 lt!28335)))

(assert (=> d!6452 (isPrefixOf!0 lt!28333 (_2!1229 lt!28100))))

(assert (=> d!6452 (= lt!28335 (lemmaIsPrefixTransitive!0 lt!28333 thiss!1379 (_2!1229 lt!28100)))))

(declare-fun lt!28332 () Unit!1761)

(assert (=> d!6452 (= lt!28332 e!13287)))

(declare-fun c!1423 () Bool)

(assert (=> d!6452 (= c!1423 (not (= (size!607 (buf!910 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!28340 () Unit!1761)

(declare-fun lt!28344 () Unit!1761)

(assert (=> d!6452 (= lt!28340 lt!28344)))

(assert (=> d!6452 (isPrefixOf!0 (_2!1229 lt!28100) (_2!1229 lt!28100))))

(assert (=> d!6452 (= lt!28344 (lemmaIsPrefixRefl!0 (_2!1229 lt!28100)))))

(declare-fun lt!28346 () Unit!1761)

(declare-fun lt!28350 () Unit!1761)

(assert (=> d!6452 (= lt!28346 lt!28350)))

(assert (=> d!6452 (= lt!28350 (lemmaIsPrefixRefl!0 (_2!1229 lt!28100)))))

(declare-fun lt!28338 () Unit!1761)

(declare-fun lt!28337 () Unit!1761)

(assert (=> d!6452 (= lt!28338 lt!28337)))

(assert (=> d!6452 (isPrefixOf!0 lt!28333 lt!28333)))

(assert (=> d!6452 (= lt!28337 (lemmaIsPrefixRefl!0 lt!28333))))

(declare-fun lt!28343 () Unit!1761)

(declare-fun lt!28349 () Unit!1761)

(assert (=> d!6452 (= lt!28343 lt!28349)))

(assert (=> d!6452 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!6452 (= lt!28349 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!6452 (= lt!28333 (BitStream!1049 (buf!910 (_2!1229 lt!28100)) (currentByte!2193 thiss!1379) (currentBit!2188 thiss!1379)))))

(assert (=> d!6452 (isPrefixOf!0 thiss!1379 (_2!1229 lt!28100))))

(assert (=> d!6452 (= (reader!0 thiss!1379 (_2!1229 lt!28100)) lt!28341)))

(declare-fun b!19867 () Bool)

(declare-fun Unit!1768 () Unit!1761)

(assert (=> b!19867 (= e!13287 Unit!1768)))

(assert (= (and d!6452 c!1423) b!19870))

(assert (= (and d!6452 (not c!1423)) b!19867))

(assert (= (and d!6452 res!17295) b!19869))

(assert (= (and b!19869 res!17296) b!19871))

(assert (= (and b!19871 res!17297) b!19868))

(declare-fun m!26933 () Bool)

(assert (=> b!19868 m!26933))

(declare-fun m!26935 () Bool)

(assert (=> b!19868 m!26935))

(assert (=> b!19868 m!26769))

(assert (=> b!19870 m!26769))

(declare-fun m!26937 () Bool)

(assert (=> b!19870 m!26937))

(declare-fun m!26939 () Bool)

(assert (=> b!19870 m!26939))

(declare-fun m!26941 () Bool)

(assert (=> b!19869 m!26941))

(declare-fun m!26943 () Bool)

(assert (=> d!6452 m!26943))

(declare-fun m!26945 () Bool)

(assert (=> d!6452 m!26945))

(declare-fun m!26947 () Bool)

(assert (=> d!6452 m!26947))

(declare-fun m!26949 () Bool)

(assert (=> d!6452 m!26949))

(declare-fun m!26951 () Bool)

(assert (=> d!6452 m!26951))

(declare-fun m!26953 () Bool)

(assert (=> d!6452 m!26953))

(declare-fun m!26955 () Bool)

(assert (=> d!6452 m!26955))

(assert (=> d!6452 m!26767))

(assert (=> d!6452 m!26765))

(assert (=> d!6452 m!26743))

(declare-fun m!26957 () Bool)

(assert (=> d!6452 m!26957))

(declare-fun m!26959 () Bool)

(assert (=> b!19871 m!26959))

(assert (=> b!19757 d!6452))

(declare-fun d!6464 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!6464 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!607 (buf!910 (_2!1229 lt!28100)))) ((_ sign_extend 32) (currentByte!2193 thiss!1379)) ((_ sign_extend 32) (currentBit!2188 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!607 (buf!910 (_2!1229 lt!28100)))) ((_ sign_extend 32) (currentByte!2193 thiss!1379)) ((_ sign_extend 32) (currentBit!2188 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!1901 () Bool)

(assert (= bs!1901 d!6464))

(declare-fun m!26961 () Bool)

(assert (=> bs!1901 m!26961))

(assert (=> b!19757 d!6464))

(declare-fun d!6466 () Bool)

(declare-fun res!17313 () Bool)

(declare-fun e!13299 () Bool)

(assert (=> d!6466 (=> (not res!17313) (not e!13299))))

(assert (=> d!6466 (= res!17313 (= (size!607 (buf!910 thiss!1379)) (size!607 (buf!910 (_2!1229 lt!28100)))))))

(assert (=> d!6466 (= (isPrefixOf!0 thiss!1379 (_2!1229 lt!28100)) e!13299)))

(declare-fun b!19887 () Bool)

(declare-fun res!17315 () Bool)

(assert (=> b!19887 (=> (not res!17315) (not e!13299))))

(assert (=> b!19887 (= res!17315 (bvsle (bitIndex!0 (size!607 (buf!910 thiss!1379)) (currentByte!2193 thiss!1379) (currentBit!2188 thiss!1379)) (bitIndex!0 (size!607 (buf!910 (_2!1229 lt!28100))) (currentByte!2193 (_2!1229 lt!28100)) (currentBit!2188 (_2!1229 lt!28100)))))))

(declare-fun b!19888 () Bool)

(declare-fun e!13298 () Bool)

(assert (=> b!19888 (= e!13299 e!13298)))

(declare-fun res!17314 () Bool)

(assert (=> b!19888 (=> res!17314 e!13298)))

(assert (=> b!19888 (= res!17314 (= (size!607 (buf!910 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!19889 () Bool)

(assert (=> b!19889 (= e!13298 (arrayBitRangesEq!0 (buf!910 thiss!1379) (buf!910 (_2!1229 lt!28100)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!607 (buf!910 thiss!1379)) (currentByte!2193 thiss!1379) (currentBit!2188 thiss!1379))))))

(assert (= (and d!6466 res!17313) b!19887))

(assert (= (and b!19887 res!17315) b!19888))

(assert (= (and b!19888 (not res!17314)) b!19889))

(assert (=> b!19887 m!26769))

(assert (=> b!19887 m!26935))

(assert (=> b!19889 m!26769))

(assert (=> b!19889 m!26769))

(declare-fun m!26967 () Bool)

(assert (=> b!19889 m!26967))

(assert (=> b!19756 d!6466))

(declare-fun d!6472 () Bool)

(assert (=> d!6472 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!607 (buf!910 (_2!1229 lt!28100)))) ((_ sign_extend 32) (currentByte!2193 (_2!1229 lt!28100))) ((_ sign_extend 32) (currentBit!2188 (_2!1229 lt!28100))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!607 (buf!910 (_2!1229 lt!28100)))) ((_ sign_extend 32) (currentByte!2193 (_2!1229 lt!28100))) ((_ sign_extend 32) (currentBit!2188 (_2!1229 lt!28100)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!1903 () Bool)

(assert (= bs!1903 d!6472))

(declare-fun m!26969 () Bool)

(assert (=> bs!1903 m!26969))

(assert (=> b!19756 d!6472))

(declare-fun d!6474 () Bool)

(declare-fun e!13311 () Bool)

(assert (=> d!6474 e!13311))

(declare-fun res!17321 () Bool)

(assert (=> d!6474 (=> (not res!17321) (not e!13311))))

(assert (=> d!6474 (= res!17321 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!28366 () Unit!1761)

(declare-fun choose!27 (BitStream!1048 BitStream!1048 (_ BitVec 64) (_ BitVec 64)) Unit!1761)

(assert (=> d!6474 (= lt!28366 (choose!27 thiss!1379 (_2!1229 lt!28100) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!6474 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!6474 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1229 lt!28100) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!28366)))

(declare-fun b!19907 () Bool)

(assert (=> b!19907 (= e!13311 (validate_offset_bits!1 ((_ sign_extend 32) (size!607 (buf!910 (_2!1229 lt!28100)))) ((_ sign_extend 32) (currentByte!2193 (_2!1229 lt!28100))) ((_ sign_extend 32) (currentBit!2188 (_2!1229 lt!28100))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!6474 res!17321) b!19907))

(declare-fun m!26981 () Bool)

(assert (=> d!6474 m!26981))

(assert (=> b!19907 m!26749))

(assert (=> b!19756 d!6474))

(declare-fun d!6480 () Bool)

(declare-fun e!13344 () Bool)

(assert (=> d!6480 e!13344))

(declare-fun res!17379 () Bool)

(assert (=> d!6480 (=> (not res!17379) (not e!13344))))

(declare-fun lt!28440 () tuple2!2288)

(assert (=> d!6480 (= res!17379 (= (size!607 (buf!910 (_2!1229 lt!28440))) (size!607 (buf!910 thiss!1379))))))

(declare-fun lt!28436 () (_ BitVec 8))

(declare-fun lt!28438 () array!1427)

(assert (=> d!6480 (= lt!28436 (select (arr!1048 lt!28438) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!6480 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!607 lt!28438)))))

(assert (=> d!6480 (= lt!28438 (array!1428 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!28443 () tuple2!2288)

(assert (=> d!6480 (= lt!28440 (tuple2!2289 (_1!1229 lt!28443) (_2!1229 lt!28443)))))

(declare-fun lt!28441 () tuple2!2288)

(assert (=> d!6480 (= lt!28443 lt!28441)))

(declare-fun e!13347 () Bool)

(assert (=> d!6480 e!13347))

(declare-fun res!17374 () Bool)

(assert (=> d!6480 (=> (not res!17374) (not e!13347))))

(assert (=> d!6480 (= res!17374 (= (size!607 (buf!910 thiss!1379)) (size!607 (buf!910 (_2!1229 lt!28441)))))))

(declare-fun lt!28433 () Bool)

(declare-fun appendBit!0 (BitStream!1048 Bool) tuple2!2288)

(assert (=> d!6480 (= lt!28441 (appendBit!0 thiss!1379 lt!28433))))

(assert (=> d!6480 (= lt!28433 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1048 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!6480 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!6480 (= (appendBitFromByte!0 thiss!1379 (select (arr!1048 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!28440)))

(declare-fun b!19968 () Bool)

(declare-fun e!13345 () Bool)

(assert (=> b!19968 (= e!13347 e!13345)))

(declare-fun res!17377 () Bool)

(assert (=> b!19968 (=> (not res!17377) (not e!13345))))

(declare-datatypes ((tuple2!2312 0))(
  ( (tuple2!2313 (_1!1241 BitStream!1048) (_2!1241 Bool)) )
))
(declare-fun lt!28442 () tuple2!2312)

(assert (=> b!19968 (= res!17377 (and (= (_2!1241 lt!28442) lt!28433) (= (_1!1241 lt!28442) (_2!1229 lt!28441))))))

(declare-fun readBitPure!0 (BitStream!1048) tuple2!2312)

(declare-fun readerFrom!0 (BitStream!1048 (_ BitVec 32) (_ BitVec 32)) BitStream!1048)

(assert (=> b!19968 (= lt!28442 (readBitPure!0 (readerFrom!0 (_2!1229 lt!28441) (currentBit!2188 thiss!1379) (currentByte!2193 thiss!1379))))))

(declare-fun b!19969 () Bool)

(declare-fun res!17378 () Bool)

(assert (=> b!19969 (=> (not res!17378) (not e!13347))))

(assert (=> b!19969 (= res!17378 (isPrefixOf!0 thiss!1379 (_2!1229 lt!28441)))))

(declare-fun b!19970 () Bool)

(declare-fun res!17376 () Bool)

(assert (=> b!19970 (=> (not res!17376) (not e!13344))))

(assert (=> b!19970 (= res!17376 (isPrefixOf!0 thiss!1379 (_2!1229 lt!28440)))))

(declare-fun b!19971 () Bool)

(declare-fun e!13346 () Bool)

(assert (=> b!19971 (= e!13344 e!13346)))

(declare-fun res!17380 () Bool)

(assert (=> b!19971 (=> (not res!17380) (not e!13346))))

(declare-fun lt!28434 () tuple2!2312)

(assert (=> b!19971 (= res!17380 (and (= (_2!1241 lt!28434) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1048 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!28436)) #b00000000000000000000000000000000))) (= (_1!1241 lt!28434) (_2!1229 lt!28440))))))

(declare-datatypes ((tuple2!2316 0))(
  ( (tuple2!2317 (_1!1243 array!1427) (_2!1243 BitStream!1048)) )
))
(declare-fun lt!28444 () tuple2!2316)

(declare-fun lt!28435 () BitStream!1048)

(declare-fun readBits!0 (BitStream!1048 (_ BitVec 64)) tuple2!2316)

(assert (=> b!19971 (= lt!28444 (readBits!0 lt!28435 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!19971 (= lt!28434 (readBitPure!0 lt!28435))))

(assert (=> b!19971 (= lt!28435 (readerFrom!0 (_2!1229 lt!28440) (currentBit!2188 thiss!1379) (currentByte!2193 thiss!1379)))))

(declare-fun b!19972 () Bool)

(declare-fun res!17375 () Bool)

(assert (=> b!19972 (=> (not res!17375) (not e!13347))))

(assert (=> b!19972 (= res!17375 (= (bitIndex!0 (size!607 (buf!910 (_2!1229 lt!28441))) (currentByte!2193 (_2!1229 lt!28441)) (currentBit!2188 (_2!1229 lt!28441))) (bvadd (bitIndex!0 (size!607 (buf!910 thiss!1379)) (currentByte!2193 thiss!1379) (currentBit!2188 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!19973 () Bool)

(assert (=> b!19973 (= e!13345 (= (bitIndex!0 (size!607 (buf!910 (_1!1241 lt!28442))) (currentByte!2193 (_1!1241 lt!28442)) (currentBit!2188 (_1!1241 lt!28442))) (bitIndex!0 (size!607 (buf!910 (_2!1229 lt!28441))) (currentByte!2193 (_2!1229 lt!28441)) (currentBit!2188 (_2!1229 lt!28441)))))))

(declare-fun b!19974 () Bool)

(assert (=> b!19974 (= e!13346 (= (bitIndex!0 (size!607 (buf!910 (_1!1241 lt!28434))) (currentByte!2193 (_1!1241 lt!28434)) (currentBit!2188 (_1!1241 lt!28434))) (bitIndex!0 (size!607 (buf!910 (_2!1229 lt!28440))) (currentByte!2193 (_2!1229 lt!28440)) (currentBit!2188 (_2!1229 lt!28440)))))))

(declare-fun b!19975 () Bool)

(declare-fun res!17381 () Bool)

(assert (=> b!19975 (=> (not res!17381) (not e!13344))))

(declare-fun lt!28437 () (_ BitVec 64))

(declare-fun lt!28439 () (_ BitVec 64))

(assert (=> b!19975 (= res!17381 (= (bitIndex!0 (size!607 (buf!910 (_2!1229 lt!28440))) (currentByte!2193 (_2!1229 lt!28440)) (currentBit!2188 (_2!1229 lt!28440))) (bvadd lt!28439 lt!28437)))))

(assert (=> b!19975 (or (not (= (bvand lt!28439 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!28437 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!28439 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!28439 lt!28437) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!19975 (= lt!28437 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!19975 (= lt!28439 (bitIndex!0 (size!607 (buf!910 thiss!1379)) (currentByte!2193 thiss!1379) (currentBit!2188 thiss!1379)))))

(assert (= (and d!6480 res!17374) b!19972))

(assert (= (and b!19972 res!17375) b!19969))

(assert (= (and b!19969 res!17378) b!19968))

(assert (= (and b!19968 res!17377) b!19973))

(assert (= (and d!6480 res!17379) b!19975))

(assert (= (and b!19975 res!17381) b!19970))

(assert (= (and b!19970 res!17376) b!19971))

(assert (= (and b!19971 res!17380) b!19974))

(declare-fun m!27017 () Bool)

(assert (=> b!19974 m!27017))

(declare-fun m!27021 () Bool)

(assert (=> b!19974 m!27021))

(declare-fun m!27025 () Bool)

(assert (=> b!19972 m!27025))

(assert (=> b!19972 m!26769))

(declare-fun m!27029 () Bool)

(assert (=> d!6480 m!27029))

(declare-fun m!27031 () Bool)

(assert (=> d!6480 m!27031))

(assert (=> d!6480 m!26865))

(declare-fun m!27033 () Bool)

(assert (=> b!19969 m!27033))

(declare-fun m!27035 () Bool)

(assert (=> b!19970 m!27035))

(declare-fun m!27037 () Bool)

(assert (=> b!19968 m!27037))

(assert (=> b!19968 m!27037))

(declare-fun m!27039 () Bool)

(assert (=> b!19968 m!27039))

(declare-fun m!27041 () Bool)

(assert (=> b!19973 m!27041))

(assert (=> b!19973 m!27025))

(assert (=> b!19975 m!27021))

(assert (=> b!19975 m!26769))

(declare-fun m!27043 () Bool)

(assert (=> b!19971 m!27043))

(declare-fun m!27045 () Bool)

(assert (=> b!19971 m!27045))

(declare-fun m!27047 () Bool)

(assert (=> b!19971 m!27047))

(assert (=> b!19756 d!6480))

(declare-fun d!6500 () Bool)

(assert (=> d!6500 (= (array_inv!577 (buf!910 thiss!1379)) (bvsge (size!607 (buf!910 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!19760 d!6500))

(declare-fun d!6504 () Bool)

(declare-fun res!17385 () Bool)

(declare-fun e!13351 () Bool)

(assert (=> d!6504 (=> (not res!17385) (not e!13351))))

(assert (=> d!6504 (= res!17385 (= (size!607 (buf!910 thiss!1379)) (size!607 (buf!910 thiss!1379))))))

(assert (=> d!6504 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!13351)))

(declare-fun b!19979 () Bool)

(declare-fun res!17387 () Bool)

(assert (=> b!19979 (=> (not res!17387) (not e!13351))))

(assert (=> b!19979 (= res!17387 (bvsle (bitIndex!0 (size!607 (buf!910 thiss!1379)) (currentByte!2193 thiss!1379) (currentBit!2188 thiss!1379)) (bitIndex!0 (size!607 (buf!910 thiss!1379)) (currentByte!2193 thiss!1379) (currentBit!2188 thiss!1379))))))

(declare-fun b!19980 () Bool)

(declare-fun e!13350 () Bool)

(assert (=> b!19980 (= e!13351 e!13350)))

(declare-fun res!17386 () Bool)

(assert (=> b!19980 (=> res!17386 e!13350)))

(assert (=> b!19980 (= res!17386 (= (size!607 (buf!910 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!19981 () Bool)

(assert (=> b!19981 (= e!13350 (arrayBitRangesEq!0 (buf!910 thiss!1379) (buf!910 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!607 (buf!910 thiss!1379)) (currentByte!2193 thiss!1379) (currentBit!2188 thiss!1379))))))

(assert (= (and d!6504 res!17385) b!19979))

(assert (= (and b!19979 res!17387) b!19980))

(assert (= (and b!19980 (not res!17386)) b!19981))

(assert (=> b!19979 m!26769))

(assert (=> b!19979 m!26769))

(assert (=> b!19981 m!26769))

(assert (=> b!19981 m!26769))

(declare-fun m!27051 () Bool)

(assert (=> b!19981 m!27051))

(assert (=> b!19759 d!6504))

(declare-fun d!6506 () Bool)

(assert (=> d!6506 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!28450 () Unit!1761)

(declare-fun choose!11 (BitStream!1048) Unit!1761)

(assert (=> d!6506 (= lt!28450 (choose!11 thiss!1379))))

(assert (=> d!6506 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!28450)))

(declare-fun bs!1910 () Bool)

(assert (= bs!1910 d!6506))

(assert (=> bs!1910 m!26765))

(declare-fun m!27055 () Bool)

(assert (=> bs!1910 m!27055))

(assert (=> b!19759 d!6506))

(declare-fun d!6510 () Bool)

(declare-fun e!13365 () Bool)

(assert (=> d!6510 e!13365))

(declare-fun res!17415 () Bool)

(assert (=> d!6510 (=> (not res!17415) (not e!13365))))

(declare-fun lt!28510 () (_ BitVec 64))

(declare-fun lt!28508 () (_ BitVec 64))

(declare-fun lt!28509 () (_ BitVec 64))

(assert (=> d!6510 (= res!17415 (= lt!28510 (bvsub lt!28508 lt!28509)))))

(assert (=> d!6510 (or (= (bvand lt!28508 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!28509 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!28508 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!28508 lt!28509) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!6510 (= lt!28509 (remainingBits!0 ((_ sign_extend 32) (size!607 (buf!910 thiss!1379))) ((_ sign_extend 32) (currentByte!2193 thiss!1379)) ((_ sign_extend 32) (currentBit!2188 thiss!1379))))))

(declare-fun lt!28505 () (_ BitVec 64))

(declare-fun lt!28507 () (_ BitVec 64))

(assert (=> d!6510 (= lt!28508 (bvmul lt!28505 lt!28507))))

(assert (=> d!6510 (or (= lt!28505 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!28507 (bvsdiv (bvmul lt!28505 lt!28507) lt!28505)))))

(assert (=> d!6510 (= lt!28507 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!6510 (= lt!28505 ((_ sign_extend 32) (size!607 (buf!910 thiss!1379))))))

(assert (=> d!6510 (= lt!28510 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2193 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2188 thiss!1379))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!6510 (invariant!0 (currentBit!2188 thiss!1379) (currentByte!2193 thiss!1379) (size!607 (buf!910 thiss!1379)))))

(assert (=> d!6510 (= (bitIndex!0 (size!607 (buf!910 thiss!1379)) (currentByte!2193 thiss!1379) (currentBit!2188 thiss!1379)) lt!28510)))

(declare-fun b!20009 () Bool)

(declare-fun res!17414 () Bool)

(assert (=> b!20009 (=> (not res!17414) (not e!13365))))

(assert (=> b!20009 (= res!17414 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!28510))))

(declare-fun b!20010 () Bool)

(declare-fun lt!28506 () (_ BitVec 64))

(assert (=> b!20010 (= e!13365 (bvsle lt!28510 (bvmul lt!28506 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!20010 (or (= lt!28506 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!28506 #b0000000000000000000000000000000000000000000000000000000000001000) lt!28506)))))

(assert (=> b!20010 (= lt!28506 ((_ sign_extend 32) (size!607 (buf!910 thiss!1379))))))

(assert (= (and d!6510 res!17415) b!20009))

(assert (= (and b!20009 res!17414) b!20010))

(declare-fun m!27057 () Bool)

(assert (=> d!6510 m!27057))

(declare-fun m!27059 () Bool)

(assert (=> d!6510 m!27059))

(assert (=> b!19759 d!6510))

(declare-fun d!6512 () Bool)

(assert (=> d!6512 (= (array_inv!577 srcBuffer!2) (bvsge (size!607 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!4960 d!6512))

(declare-fun d!6514 () Bool)

(assert (=> d!6514 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2188 thiss!1379) (currentByte!2193 thiss!1379) (size!607 (buf!910 thiss!1379))))))

(declare-fun bs!1911 () Bool)

(assert (= bs!1911 d!6514))

(assert (=> bs!1911 m!27059))

(assert (=> start!4960 d!6514))

(declare-fun d!6516 () Bool)

(assert (=> d!6516 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!607 (buf!910 thiss!1379))) ((_ sign_extend 32) (currentByte!2193 thiss!1379)) ((_ sign_extend 32) (currentBit!2188 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!607 (buf!910 thiss!1379))) ((_ sign_extend 32) (currentByte!2193 thiss!1379)) ((_ sign_extend 32) (currentBit!2188 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!1912 () Bool)

(assert (= bs!1912 d!6516))

(assert (=> bs!1912 m!27057))

(assert (=> b!19758 d!6516))

(push 1)

(assert (not b!19868))

(assert (not b!19887))

(assert (not b!19974))

(assert (not d!6514))

(assert (not b!19981))

(assert (not b!19970))

(assert (not b!19972))

(assert (not d!6480))

(assert (not d!6510))

(assert (not b!19975))

(assert (not b!19871))

(assert (not d!6464))

(assert (not d!6472))

(assert (not b!19968))

(assert (not b!19979))

(assert (not b!19818))

(assert (not b!19870))

(assert (not b!19889))

(assert (not b!19971))

(assert (not d!6452))

(assert (not d!6450))

(assert (not b!19907))

(assert (not b!19826))

(assert (not b!19973))

(assert (not d!6474))

(assert (not b!19816))

(assert (not d!6506))

(assert (not d!6516))

(assert (not b!19817))

(assert (not b!19969))

(assert (not b!19869))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

