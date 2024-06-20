; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49740 () Bool)

(assert start!49740)

(declare-fun b!234520 () Bool)

(declare-fun e!162117 () Bool)

(declare-datatypes ((array!12303 0))(
  ( (array!12304 (arr!6393 (Array (_ BitVec 32) (_ BitVec 8))) (size!5406 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9776 0))(
  ( (BitStream!9777 (buf!5881 array!12303) (currentByte!10942 (_ BitVec 32)) (currentBit!10937 (_ BitVec 32))) )
))
(declare-fun bs!63 () BitStream!9776)

(declare-fun moveBitIndexPrecond!0 (BitStream!9776 (_ BitVec 64)) Bool)

(assert (=> b!234520 (= e!162117 (not (moveBitIndexPrecond!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-datatypes ((tuple2!19696 0))(
  ( (tuple2!19697 (_1!10752 BitStream!9776) (_2!10752 Bool)) )
))
(declare-fun lt!370065 () tuple2!19696)

(declare-fun readBitPure!0 (BitStream!9776) tuple2!19696)

(assert (=> b!234520 (= lt!370065 (readBitPure!0 bs!63))))

(declare-fun nBits!274 () (_ BitVec 32))

(declare-fun acc!118 () (_ BitVec 64))

(declare-fun i!546 () (_ BitVec 32))

(declare-datatypes ((tuple2!19698 0))(
  ( (tuple2!19699 (_1!10753 BitStream!9776) (_2!10753 (_ BitVec 64))) )
))
(declare-fun lt!370064 () tuple2!19698)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!9776 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19698)

(assert (=> b!234520 (= lt!370064 (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118))))

(declare-fun b!234521 () Bool)

(declare-fun res!196136 () Bool)

(assert (=> b!234521 (=> (not res!196136) (not e!162117))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!234521 (= res!196136 (= (bvand acc!118 (onesLSBLong!0 nBits!274)) acc!118))))

(declare-fun b!234522 () Bool)

(declare-fun e!162118 () Bool)

(declare-fun array_inv!5147 (array!12303) Bool)

(assert (=> b!234522 (= e!162118 (array_inv!5147 (buf!5881 bs!63)))))

(declare-fun b!234523 () Bool)

(declare-fun res!196137 () Bool)

(assert (=> b!234523 (=> (not res!196137) (not e!162117))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!234523 (= res!196137 (validate_offset_bits!1 ((_ sign_extend 32) (size!5406 (buf!5881 bs!63))) ((_ sign_extend 32) (currentByte!10942 bs!63)) ((_ sign_extend 32) (currentBit!10937 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun res!196134 () Bool)

(assert (=> start!49740 (=> (not res!196134) (not e!162117))))

(assert (=> start!49740 (= res!196134 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000)))))

(assert (=> start!49740 e!162117))

(assert (=> start!49740 true))

(declare-fun inv!12 (BitStream!9776) Bool)

(assert (=> start!49740 (and (inv!12 bs!63) e!162118)))

(declare-fun b!234524 () Bool)

(declare-fun res!196135 () Bool)

(assert (=> b!234524 (=> (not res!196135) (not e!162117))))

(assert (=> b!234524 (= res!196135 (= (bvand acc!118 (onesLSBLong!0 (bvsub nBits!274 i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!49740 res!196134) b!234523))

(assert (= (and b!234523 res!196137) b!234524))

(assert (= (and b!234524 res!196135) b!234521))

(assert (= (and b!234521 res!196136) b!234520))

(assert (= start!49740 b!234522))

(declare-fun m!357135 () Bool)

(assert (=> b!234520 m!357135))

(declare-fun m!357137 () Bool)

(assert (=> b!234520 m!357137))

(declare-fun m!357139 () Bool)

(assert (=> b!234520 m!357139))

(declare-fun m!357141 () Bool)

(assert (=> b!234523 m!357141))

(declare-fun m!357143 () Bool)

(assert (=> start!49740 m!357143))

(declare-fun m!357145 () Bool)

(assert (=> b!234524 m!357145))

(declare-fun m!357147 () Bool)

(assert (=> b!234521 m!357147))

(declare-fun m!357149 () Bool)

(assert (=> b!234522 m!357149))

(push 1)

(assert (not b!234520))

(assert (not b!234523))

(assert (not b!234524))

(assert (not b!234522))

(assert (not b!234521))

(assert (not start!49740))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!79004 () Bool)

(assert (=> d!79004 (= (onesLSBLong!0 nBits!274) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!274))))))

(assert (=> b!234521 d!79004))

(declare-fun d!79006 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!79006 (= (inv!12 bs!63) (invariant!0 (currentBit!10937 bs!63) (currentByte!10942 bs!63) (size!5406 (buf!5881 bs!63))))))

(declare-fun bs!19705 () Bool)

(assert (= bs!19705 d!79006))

(declare-fun m!357151 () Bool)

(assert (=> bs!19705 m!357151))

(assert (=> start!49740 d!79006))

(declare-fun d!79012 () Bool)

(declare-fun res!196140 () Bool)

(declare-fun e!162122 () Bool)

(assert (=> d!79012 (=> (not res!196140) (not e!162122))))

(assert (=> d!79012 (= res!196140 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!5406 (buf!5881 bs!63)))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5406 (buf!5881 bs!63)))))))))

(assert (=> d!79012 (= (moveBitIndexPrecond!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001) e!162122)))

(declare-fun b!234528 () Bool)

(declare-fun lt!370068 () (_ BitVec 64))

(assert (=> b!234528 (= e!162122 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!370068) (bvsle lt!370068 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5406 (buf!5881 bs!63)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!234528 (= lt!370068 (bvadd (bitIndex!0 (size!5406 (buf!5881 bs!63)) (currentByte!10942 bs!63) (currentBit!10937 bs!63)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!79012 res!196140) b!234528))

(declare-fun m!357157 () Bool)

(assert (=> b!234528 m!357157))

(assert (=> b!234520 d!79012))

(declare-fun d!79024 () Bool)

(declare-datatypes ((tuple2!19702 0))(
  ( (tuple2!19703 (_1!10755 Bool) (_2!10755 BitStream!9776)) )
))
(declare-fun lt!370074 () tuple2!19702)

(declare-fun readBit!0 (BitStream!9776) tuple2!19702)

(assert (=> d!79024 (= lt!370074 (readBit!0 bs!63))))

(assert (=> d!79024 (= (readBitPure!0 bs!63) (tuple2!19697 (_2!10755 lt!370074) (_1!10755 lt!370074)))))

(declare-fun bs!19709 () Bool)

(assert (= bs!19709 d!79024))

(declare-fun m!357163 () Bool)

(assert (=> bs!19709 m!357163))

(assert (=> b!234520 d!79024))

(declare-fun d!79034 () Bool)

(declare-datatypes ((tuple2!19706 0))(
  ( (tuple2!19707 (_1!10757 (_ BitVec 64)) (_2!10757 BitStream!9776)) )
))
(declare-fun lt!370080 () tuple2!19706)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!9776 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19706)

(assert (=> d!79034 (= lt!370080 (readNLeastSignificantBitsLoop!0 bs!63 nBits!274 i!546 acc!118))))

(assert (=> d!79034 (= (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118) (tuple2!19699 (_2!10757 lt!370080) (_1!10757 lt!370080)))))

(declare-fun bs!19711 () Bool)

(assert (= bs!19711 d!79034))

(declare-fun m!357167 () Bool)

(assert (=> bs!19711 m!357167))

(assert (=> b!234520 d!79034))

(declare-fun d!79038 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!79038 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5406 (buf!5881 bs!63))) ((_ sign_extend 32) (currentByte!10942 bs!63)) ((_ sign_extend 32) (currentBit!10937 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5406 (buf!5881 bs!63))) ((_ sign_extend 32) (currentByte!10942 bs!63)) ((_ sign_extend 32) (currentBit!10937 bs!63))) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun bs!19712 () Bool)

(assert (= bs!19712 d!79038))

(declare-fun m!357169 () Bool)

(assert (=> bs!19712 m!357169))

(assert (=> b!234523 d!79038))

(declare-fun d!79040 () Bool)

(assert (=> d!79040 (= (onesLSBLong!0 (bvsub nBits!274 i!546)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!274 i!546)))))))

(assert (=> b!234524 d!79040))

(declare-fun d!79042 () Bool)

(assert (=> d!79042 (= (array_inv!5147 (buf!5881 bs!63)) (bvsge (size!5406 (buf!5881 bs!63)) #b00000000000000000000000000000000))))

(assert (=> b!234522 d!79042))

(push 1)

(assert (not d!79034))

(assert (not b!234528))

(assert (not d!79024))

(assert (not d!79038))

(assert (not d!79006))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!79058 () Bool)

(assert (=> d!79058 (= (remainingBits!0 ((_ sign_extend 32) (size!5406 (buf!5881 bs!63))) ((_ sign_extend 32) (currentByte!10942 bs!63)) ((_ sign_extend 32) (currentBit!10937 bs!63))) (bvsub (bvmul ((_ sign_extend 32) (size!5406 (buf!5881 bs!63))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10942 bs!63)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10937 bs!63)))))))

(assert (=> d!79038 d!79058))

(declare-fun d!79060 () Bool)

(declare-fun e!162148 () Bool)

(assert (=> d!79060 e!162148))

(declare-fun res!196164 () Bool)

(assert (=> d!79060 (=> (not res!196164) (not e!162148))))

(declare-fun lt!370170 () (_ BitVec 64))

(declare-fun lt!370165 () (_ BitVec 64))

(declare-fun lt!370166 () (_ BitVec 64))

(assert (=> d!79060 (= res!196164 (= lt!370166 (bvsub lt!370165 lt!370170)))))

(assert (=> d!79060 (or (= (bvand lt!370165 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!370170 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!370165 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!370165 lt!370170) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79060 (= lt!370170 (remainingBits!0 ((_ sign_extend 32) (size!5406 (buf!5881 bs!63))) ((_ sign_extend 32) (currentByte!10942 bs!63)) ((_ sign_extend 32) (currentBit!10937 bs!63))))))

(declare-fun lt!370167 () (_ BitVec 64))

(declare-fun lt!370169 () (_ BitVec 64))

(assert (=> d!79060 (= lt!370165 (bvmul lt!370167 lt!370169))))

(assert (=> d!79060 (or (= lt!370167 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!370169 (bvsdiv (bvmul lt!370167 lt!370169) lt!370167)))))

(assert (=> d!79060 (= lt!370169 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!79060 (= lt!370167 ((_ sign_extend 32) (size!5406 (buf!5881 bs!63))))))

(assert (=> d!79060 (= lt!370166 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10942 bs!63)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10937 bs!63))))))

(assert (=> d!79060 (invariant!0 (currentBit!10937 bs!63) (currentByte!10942 bs!63) (size!5406 (buf!5881 bs!63)))))

(assert (=> d!79060 (= (bitIndex!0 (size!5406 (buf!5881 bs!63)) (currentByte!10942 bs!63) (currentBit!10937 bs!63)) lt!370166)))

(declare-fun b!234553 () Bool)

(declare-fun res!196163 () Bool)

(assert (=> b!234553 (=> (not res!196163) (not e!162148))))

(assert (=> b!234553 (= res!196163 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!370166))))

(declare-fun b!234554 () Bool)

(declare-fun lt!370168 () (_ BitVec 64))

(assert (=> b!234554 (= e!162148 (bvsle lt!370166 (bvmul lt!370168 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!234554 (or (= lt!370168 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!370168 #b0000000000000000000000000000000000000000000000000000000000001000) lt!370168)))))

(assert (=> b!234554 (= lt!370168 ((_ sign_extend 32) (size!5406 (buf!5881 bs!63))))))

(assert (= (and d!79060 res!196164) b!234553))

(assert (= (and b!234553 res!196163) b!234554))

(assert (=> d!79060 m!357169))

(assert (=> d!79060 m!357151))

(assert (=> b!234528 d!79060))

(declare-fun b!234596 () Bool)

(declare-fun res!196198 () Bool)

(declare-fun e!162168 () Bool)

(assert (=> b!234596 (=> (not res!196198) (not e!162168))))

(declare-fun lt!370242 () tuple2!19706)

(assert (=> b!234596 (= res!196198 (= (bvand (_1!10757 lt!370242) (onesLSBLong!0 nBits!274)) (_1!10757 lt!370242)))))

(declare-fun b!234597 () Bool)

(declare-fun lt!370241 () (_ BitVec 64))

(declare-fun e!162169 () Bool)

(assert (=> b!234597 (= e!162169 (= (= (bvand (bvlshr (_1!10757 lt!370242) lt!370241) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!10752 (readBitPure!0 bs!63))))))

(assert (=> b!234597 (and (bvsge lt!370241 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!370241 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!370239 () (_ BitVec 32))

(assert (=> b!234597 (= lt!370241 ((_ sign_extend 32) (bvsub lt!370239 i!546)))))

(assert (=> b!234597 (or (= (bvand lt!370239 #b10000000000000000000000000000000) (bvand i!546 #b10000000000000000000000000000000)) (= (bvand lt!370239 #b10000000000000000000000000000000) (bvand (bvsub lt!370239 i!546) #b10000000000000000000000000000000)))))

(assert (=> b!234597 (= lt!370239 (bvsub nBits!274 #b00000000000000000000000000000001))))

(assert (=> b!234597 (or (= (bvand nBits!274 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!234598 () Bool)

(declare-fun e!162167 () tuple2!19706)

(assert (=> b!234598 (= e!162167 (tuple2!19707 acc!118 bs!63))))

(declare-fun b!234599 () Bool)

(declare-fun res!196197 () Bool)

(assert (=> b!234599 (=> (not res!196197) (not e!162168))))

(declare-fun lt!370238 () (_ BitVec 64))

(declare-fun lt!370234 () (_ BitVec 64))

(assert (=> b!234599 (= res!196197 (= (bvlshr (_1!10757 lt!370242) lt!370238) (bvlshr acc!118 lt!370234)))))

(assert (=> b!234599 (and (bvsge lt!370234 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!370234 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!234599 (= lt!370234 ((_ sign_extend 32) (bvsub nBits!274 i!546)))))

(assert (=> b!234599 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand i!546 #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 i!546) #b10000000000000000000000000000000)))))

(assert (=> b!234599 (and (bvsge lt!370238 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!370238 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!234599 (= lt!370238 ((_ sign_extend 32) (bvsub nBits!274 i!546)))))

(assert (=> b!234599 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand i!546 #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 i!546) #b10000000000000000000000000000000)))))

(declare-fun d!79068 () Bool)

(assert (=> d!79068 e!162168))

(declare-fun res!196196 () Bool)

(assert (=> d!79068 (=> (not res!196196) (not e!162168))))

(assert (=> d!79068 (= res!196196 (= (buf!5881 (_2!10757 lt!370242)) (buf!5881 bs!63)))))

(assert (=> d!79068 (= lt!370242 e!162167)))

(declare-fun c!11263 () Bool)

(assert (=> d!79068 (= c!11263 (= nBits!274 i!546))))

(assert (=> d!79068 (and (bvsle #b00000000000000000000000000000000 i!546) (bvsle i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000))))

(assert (=> d!79068 (= (readNLeastSignificantBitsLoop!0 bs!63 nBits!274 i!546 acc!118) lt!370242)))

(declare-fun b!234600 () Bool)

(declare-fun lt!370237 () tuple2!19706)

(assert (=> b!234600 (= e!162167 (tuple2!19707 (_1!10757 lt!370237) (_2!10757 lt!370237)))))

(declare-fun lt!370236 () tuple2!19702)

(assert (=> b!234600 (= lt!370236 (readBit!0 bs!63))))

(assert (=> b!234600 (= lt!370237 (readNLeastSignificantBitsLoop!0 (_2!10755 lt!370236) nBits!274 (bvadd i!546 #b00000000000000000000000000000001) (bvor acc!118 (ite (_1!10755 lt!370236) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!234601 () Bool)

(declare-fun res!196199 () Bool)

(assert (=> b!234601 (=> (not res!196199) (not e!162168))))

(declare-fun lt!370235 () (_ BitVec 64))

(declare-fun lt!370240 () (_ BitVec 64))

(assert (=> b!234601 (= res!196199 (= (bitIndex!0 (size!5406 (buf!5881 (_2!10757 lt!370242))) (currentByte!10942 (_2!10757 lt!370242)) (currentBit!10937 (_2!10757 lt!370242))) (bvadd lt!370240 lt!370235)))))

(assert (=> b!234601 (or (not (= (bvand lt!370240 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!370235 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!370240 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!370240 lt!370235) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!234601 (= lt!370235 ((_ sign_extend 32) (bvsub nBits!274 i!546)))))

(assert (=> b!234601 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand i!546 #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 i!546) #b10000000000000000000000000000000)))))

(assert (=> b!234601 (= lt!370240 (bitIndex!0 (size!5406 (buf!5881 bs!63)) (currentByte!10942 bs!63) (currentBit!10937 bs!63)))))

(declare-fun b!234602 () Bool)

(assert (=> b!234602 (= e!162168 e!162169)))

(declare-fun res!196200 () Bool)

(assert (=> b!234602 (=> res!196200 e!162169)))

(assert (=> b!234602 (= res!196200 (bvsge i!546 nBits!274))))

(assert (= (and d!79068 c!11263) b!234598))

(assert (= (and d!79068 (not c!11263)) b!234600))

(assert (= (and d!79068 res!196196) b!234601))

(assert (= (and b!234601 res!196199) b!234599))

(assert (= (and b!234599 res!196197) b!234596))

(assert (= (and b!234596 res!196198) b!234602))

(assert (= (and b!234602 (not res!196200)) b!234597))

(assert (=> b!234596 m!357147))

(assert (=> b!234597 m!357137))

(assert (=> b!234600 m!357163))

(declare-fun m!357205 () Bool)

(assert (=> b!234600 m!357205))

(declare-fun m!357207 () Bool)

(assert (=> b!234601 m!357207))

(assert (=> b!234601 m!357157))

(assert (=> d!79034 d!79068))

(declare-fun d!79078 () Bool)

(assert (=> d!79078 (= (invariant!0 (currentBit!10937 bs!63) (currentByte!10942 bs!63) (size!5406 (buf!5881 bs!63))) (and (bvsge (currentBit!10937 bs!63) #b00000000000000000000000000000000) (bvslt (currentBit!10937 bs!63) #b00000000000000000000000000001000) (bvsge (currentByte!10942 bs!63) #b00000000000000000000000000000000) (or (bvslt (currentByte!10942 bs!63) (size!5406 (buf!5881 bs!63))) (and (= (currentBit!10937 bs!63) #b00000000000000000000000000000000) (= (currentByte!10942 bs!63) (size!5406 (buf!5881 bs!63)))))))))

(assert (=> d!79006 d!79078))

(declare-fun d!79080 () Bool)

(declare-fun e!162185 () Bool)

(assert (=> d!79080 e!162185))

(declare-fun res!196218 () Bool)

(assert (=> d!79080 (=> (not res!196218) (not e!162185))))

(declare-datatypes ((Unit!17283 0))(
  ( (Unit!17284) )
))
(declare-datatypes ((tuple2!19716 0))(
  ( (tuple2!19717 (_1!10762 Unit!17283) (_2!10762 BitStream!9776)) )
))
(declare-fun increaseBitIndex!0 (BitStream!9776) tuple2!19716)

(assert (=> d!79080 (= res!196218 (= (buf!5881 (_2!10762 (increaseBitIndex!0 bs!63))) (buf!5881 bs!63)))))

(declare-fun lt!370286 () Bool)

(assert (=> d!79080 (= lt!370286 (not (= (bvand ((_ sign_extend 24) (select (arr!6393 (buf!5881 bs!63)) (currentByte!10942 bs!63))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!10937 bs!63)))) #b00000000000000000000000000000000)))))

(declare-fun lt!370287 () tuple2!19702)

(assert (=> d!79080 (= lt!370287 (tuple2!19703 (not (= (bvand ((_ sign_extend 24) (select (arr!6393 (buf!5881 bs!63)) (currentByte!10942 bs!63))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!10937 bs!63)))) #b00000000000000000000000000000000)) (_2!10762 (increaseBitIndex!0 bs!63))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!79080 (validate_offset_bit!0 ((_ sign_extend 32) (size!5406 (buf!5881 bs!63))) ((_ sign_extend 32) (currentByte!10942 bs!63)) ((_ sign_extend 32) (currentBit!10937 bs!63)))))

(assert (=> d!79080 (= (readBit!0 bs!63) lt!370287)))

(declare-fun b!234626 () Bool)

(declare-fun lt!370288 () (_ BitVec 64))

(declare-fun lt!370290 () (_ BitVec 64))

(assert (=> b!234626 (= e!162185 (= (bitIndex!0 (size!5406 (buf!5881 (_2!10762 (increaseBitIndex!0 bs!63)))) (currentByte!10942 (_2!10762 (increaseBitIndex!0 bs!63))) (currentBit!10937 (_2!10762 (increaseBitIndex!0 bs!63)))) (bvadd lt!370288 lt!370290)))))

(assert (=> b!234626 (or (not (= (bvand lt!370288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!370290 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!370288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!370288 lt!370290) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!234626 (= lt!370290 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!234626 (= lt!370288 (bitIndex!0 (size!5406 (buf!5881 bs!63)) (currentByte!10942 bs!63) (currentBit!10937 bs!63)))))

(declare-fun lt!370284 () Bool)

(assert (=> b!234626 (= lt!370284 (not (= (bvand ((_ sign_extend 24) (select (arr!6393 (buf!5881 bs!63)) (currentByte!10942 bs!63))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!10937 bs!63)))) #b00000000000000000000000000000000)))))

(declare-fun lt!370285 () Bool)

(assert (=> b!234626 (= lt!370285 (not (= (bvand ((_ sign_extend 24) (select (arr!6393 (buf!5881 bs!63)) (currentByte!10942 bs!63))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!10937 bs!63)))) #b00000000000000000000000000000000)))))

(declare-fun lt!370289 () Bool)

(assert (=> b!234626 (= lt!370289 (not (= (bvand ((_ sign_extend 24) (select (arr!6393 (buf!5881 bs!63)) (currentByte!10942 bs!63))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!10937 bs!63)))) #b00000000000000000000000000000000)))))

(assert (= (and d!79080 res!196218) b!234626))

(declare-fun m!357213 () Bool)

(assert (=> d!79080 m!357213))

(declare-fun m!357215 () Bool)

(assert (=> d!79080 m!357215))

(declare-fun m!357217 () Bool)

(assert (=> d!79080 m!357217))

(declare-fun m!357219 () Bool)

(assert (=> d!79080 m!357219))

(assert (=> b!234626 m!357213))

(assert (=> b!234626 m!357217))

(assert (=> b!234626 m!357215))

(assert (=> b!234626 m!357157))

(declare-fun m!357221 () Bool)

(assert (=> b!234626 m!357221))

(assert (=> d!79024 d!79080))

(push 1)

(assert (not d!79060))

(assert (not d!79080))

(assert (not b!234626))

(assert (not b!234596))

(assert (not b!234597))

(assert (not b!234601))

(assert (not b!234600))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

