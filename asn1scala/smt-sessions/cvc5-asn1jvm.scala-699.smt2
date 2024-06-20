; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19638 () Bool)

(assert start!19638)

(declare-fun b!98026 () Bool)

(declare-fun res!80420 () Bool)

(declare-fun e!64162 () Bool)

(assert (=> b!98026 (=> (not res!80420) (not e!64162))))

(declare-fun v!196 () (_ BitVec 64))

(declare-fun nBits!388 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!98026 (= res!80420 (= (bvand v!196 (onesLSBLong!0 nBits!388)) v!196))))

(declare-fun b!98027 () Bool)

(declare-fun res!80421 () Bool)

(assert (=> b!98027 (=> (not res!80421) (not e!64162))))

(declare-datatypes ((array!4591 0))(
  ( (array!4592 (arr!2691 (Array (_ BitVec 32) (_ BitVec 8))) (size!2098 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3670 0))(
  ( (BitStream!3671 (buf!2449 array!4591) (currentByte!4873 (_ BitVec 32)) (currentBit!4868 (_ BitVec 32))) )
))
(declare-fun thiss!1288 () BitStream!3670)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!98027 (= res!80421 (validate_offset_bits!1 ((_ sign_extend 32) (size!2098 (buf!2449 thiss!1288))) ((_ sign_extend 32) (currentByte!4873 thiss!1288)) ((_ sign_extend 32) (currentBit!4868 thiss!1288)) ((_ sign_extend 32) nBits!388)))))

(declare-fun b!98028 () Bool)

(declare-fun res!80422 () Bool)

(assert (=> b!98028 (=> (not res!80422) (not e!64162))))

(declare-datatypes ((Unit!5987 0))(
  ( (Unit!5988) )
))
(declare-datatypes ((tuple2!7876 0))(
  ( (tuple2!7877 (_1!4190 Unit!5987) (_2!4190 BitStream!3670)) )
))
(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3670 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!7876)

(assert (=> b!98028 (= res!80422 (= (size!2098 (buf!2449 thiss!1288)) (size!2098 (buf!2449 (_2!4190 (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000))))))))

(declare-fun b!98029 () Bool)

(declare-fun e!64164 () Bool)

(declare-fun array_inv!1900 (array!4591) Bool)

(assert (=> b!98029 (= e!64164 (array_inv!1900 (buf!2449 thiss!1288)))))

(declare-fun b!98030 () Bool)

(declare-fun lt!142054 () (_ BitVec 64))

(declare-fun lt!142053 () (_ BitVec 64))

(assert (=> b!98030 (= e!64162 (and (= lt!142053 (bvand ((_ sign_extend 32) nBits!388) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!142053 (bvand (bvadd lt!142054 ((_ sign_extend 32) nBits!388)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!98030 (= lt!142053 (bvand lt!142054 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!98030 (= lt!142054 (bitIndex!0 (size!2098 (buf!2449 thiss!1288)) (currentByte!4873 thiss!1288) (currentBit!4868 thiss!1288)))))

(declare-fun res!80423 () Bool)

(assert (=> start!19638 (=> (not res!80423) (not e!64162))))

(assert (=> start!19638 (= res!80423 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000)))))

(assert (=> start!19638 e!64162))

(assert (=> start!19638 true))

(declare-fun inv!12 (BitStream!3670) Bool)

(assert (=> start!19638 (and (inv!12 thiss!1288) e!64164)))

(assert (= (and start!19638 res!80423) b!98027))

(assert (= (and b!98027 res!80421) b!98026))

(assert (= (and b!98026 res!80420) b!98028))

(assert (= (and b!98028 res!80422) b!98030))

(assert (= start!19638 b!98029))

(declare-fun m!142465 () Bool)

(assert (=> b!98029 m!142465))

(declare-fun m!142467 () Bool)

(assert (=> b!98028 m!142467))

(declare-fun m!142469 () Bool)

(assert (=> b!98027 m!142469))

(declare-fun m!142471 () Bool)

(assert (=> b!98026 m!142471))

(declare-fun m!142473 () Bool)

(assert (=> b!98030 m!142473))

(declare-fun m!142475 () Bool)

(assert (=> start!19638 m!142475))

(push 1)

(assert (not b!98027))

(assert (not b!98029))

(assert (not b!98026))

(assert (not start!19638))

(assert (not b!98028))

(assert (not b!98030))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!30752 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!30752 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2098 (buf!2449 thiss!1288))) ((_ sign_extend 32) (currentByte!4873 thiss!1288)) ((_ sign_extend 32) (currentBit!4868 thiss!1288)) ((_ sign_extend 32) nBits!388)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2098 (buf!2449 thiss!1288))) ((_ sign_extend 32) (currentByte!4873 thiss!1288)) ((_ sign_extend 32) (currentBit!4868 thiss!1288))) ((_ sign_extend 32) nBits!388)))))

(declare-fun bs!7529 () Bool)

(assert (= bs!7529 d!30752))

(declare-fun m!142501 () Bool)

(assert (=> bs!7529 m!142501))

(assert (=> b!98027 d!30752))

(declare-fun d!30754 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!30754 (= (inv!12 thiss!1288) (invariant!0 (currentBit!4868 thiss!1288) (currentByte!4873 thiss!1288) (size!2098 (buf!2449 thiss!1288))))))

(declare-fun bs!7530 () Bool)

(assert (= bs!7530 d!30754))

(declare-fun m!142503 () Bool)

(assert (=> bs!7530 m!142503))

(assert (=> start!19638 d!30754))

(declare-fun d!30756 () Bool)

(assert (=> d!30756 (= (onesLSBLong!0 nBits!388) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!388))))))

(assert (=> b!98026 d!30756))

(declare-fun d!30758 () Bool)

(assert (=> d!30758 (= (array_inv!1900 (buf!2449 thiss!1288)) (bvsge (size!2098 (buf!2449 thiss!1288)) #b00000000000000000000000000000000))))

(assert (=> b!98029 d!30758))

(declare-fun d!30760 () Bool)

(declare-fun e!64188 () Bool)

(assert (=> d!30760 e!64188))

(declare-fun res!80458 () Bool)

(assert (=> d!30760 (=> (not res!80458) (not e!64188))))

(declare-fun lt!142102 () (_ BitVec 64))

(declare-fun lt!142098 () (_ BitVec 64))

(declare-fun lt!142097 () (_ BitVec 64))

(assert (=> d!30760 (= res!80458 (= lt!142098 (bvsub lt!142102 lt!142097)))))

(assert (=> d!30760 (or (= (bvand lt!142102 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!142097 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!142102 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!142102 lt!142097) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30760 (= lt!142097 (remainingBits!0 ((_ sign_extend 32) (size!2098 (buf!2449 thiss!1288))) ((_ sign_extend 32) (currentByte!4873 thiss!1288)) ((_ sign_extend 32) (currentBit!4868 thiss!1288))))))

(declare-fun lt!142100 () (_ BitVec 64))

(declare-fun lt!142101 () (_ BitVec 64))

(assert (=> d!30760 (= lt!142102 (bvmul lt!142100 lt!142101))))

(assert (=> d!30760 (or (= lt!142100 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!142101 (bvsdiv (bvmul lt!142100 lt!142101) lt!142100)))))

(assert (=> d!30760 (= lt!142101 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!30760 (= lt!142100 ((_ sign_extend 32) (size!2098 (buf!2449 thiss!1288))))))

(assert (=> d!30760 (= lt!142098 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4873 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4868 thiss!1288))))))

(assert (=> d!30760 (invariant!0 (currentBit!4868 thiss!1288) (currentByte!4873 thiss!1288) (size!2098 (buf!2449 thiss!1288)))))

(assert (=> d!30760 (= (bitIndex!0 (size!2098 (buf!2449 thiss!1288)) (currentByte!4873 thiss!1288) (currentBit!4868 thiss!1288)) lt!142098)))

(declare-fun b!98071 () Bool)

(declare-fun res!80459 () Bool)

(assert (=> b!98071 (=> (not res!80459) (not e!64188))))

(assert (=> b!98071 (= res!80459 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!142098))))

(declare-fun b!98072 () Bool)

(declare-fun lt!142099 () (_ BitVec 64))

(assert (=> b!98072 (= e!64188 (bvsle lt!142098 (bvmul lt!142099 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!98072 (or (= lt!142099 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!142099 #b0000000000000000000000000000000000000000000000000000000000001000) lt!142099)))))

(assert (=> b!98072 (= lt!142099 ((_ sign_extend 32) (size!2098 (buf!2449 thiss!1288))))))

(assert (= (and d!30760 res!80458) b!98071))

(assert (= (and b!98071 res!80459) b!98072))

(assert (=> d!30760 m!142501))

(assert (=> d!30760 m!142503))

(assert (=> b!98030 d!30760))

(declare-fun b!98144 () Bool)

(declare-fun e!64227 () Bool)

(declare-fun lt!142364 () (_ BitVec 64))

(assert (=> b!98144 (= e!64227 (validate_offset_bits!1 ((_ sign_extend 32) (size!2098 (buf!2449 thiss!1288))) ((_ sign_extend 32) (currentByte!4873 thiss!1288)) ((_ sign_extend 32) (currentBit!4868 thiss!1288)) lt!142364))))

(declare-fun b!98145 () Bool)

(declare-fun e!64229 () Bool)

(declare-datatypes ((tuple2!7888 0))(
  ( (tuple2!7889 (_1!4196 BitStream!3670) (_2!4196 Bool)) )
))
(declare-fun lt!142362 () tuple2!7888)

(declare-fun lt!142348 () tuple2!7876)

(assert (=> b!98145 (= e!64229 (= (bitIndex!0 (size!2098 (buf!2449 (_1!4196 lt!142362))) (currentByte!4873 (_1!4196 lt!142362)) (currentBit!4868 (_1!4196 lt!142362))) (bitIndex!0 (size!2098 (buf!2449 (_2!4190 lt!142348))) (currentByte!4873 (_2!4190 lt!142348)) (currentBit!4868 (_2!4190 lt!142348)))))))

(declare-fun d!30766 () Bool)

(declare-fun e!64233 () Bool)

(assert (=> d!30766 e!64233))

(declare-fun res!80518 () Bool)

(assert (=> d!30766 (=> (not res!80518) (not e!64233))))

(declare-fun lt!142350 () tuple2!7876)

(assert (=> d!30766 (= res!80518 (= (size!2098 (buf!2449 thiss!1288)) (size!2098 (buf!2449 (_2!4190 lt!142350)))))))

(declare-fun e!64231 () tuple2!7876)

(assert (=> d!30766 (= lt!142350 e!64231)))

(declare-fun c!6208 () Bool)

(assert (=> d!30766 (= c!6208 (bvslt #b00000000000000000000000000000000 nBits!388))))

(assert (=> d!30766 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 nBits!388) (bvsle nBits!388 #b00000000000000000000000001000000))))

(assert (=> d!30766 (= (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000) lt!142350)))

(declare-fun b!98146 () Bool)

(declare-datatypes ((tuple2!7890 0))(
  ( (tuple2!7891 (_1!4197 BitStream!3670) (_2!4197 (_ BitVec 64))) )
))
(declare-fun lt!142379 () tuple2!7890)

(declare-datatypes ((tuple2!7892 0))(
  ( (tuple2!7893 (_1!4198 BitStream!3670) (_2!4198 BitStream!3670)) )
))
(declare-fun lt!142373 () tuple2!7892)

(assert (=> b!98146 (= e!64233 (and (= (_2!4197 lt!142379) v!196) (= (_1!4197 lt!142379) (_2!4198 lt!142373))))))

(declare-fun lt!142351 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3670 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!7890)

(assert (=> b!98146 (= lt!142379 (readNLeastSignificantBitsLoopPure!0 (_1!4198 lt!142373) nBits!388 #b00000000000000000000000000000000 lt!142351))))

(declare-fun lt!142349 () Unit!5987)

(declare-fun lt!142385 () Unit!5987)

(assert (=> b!98146 (= lt!142349 lt!142385)))

(assert (=> b!98146 (validate_offset_bits!1 ((_ sign_extend 32) (size!2098 (buf!2449 (_2!4190 lt!142350)))) ((_ sign_extend 32) (currentByte!4873 thiss!1288)) ((_ sign_extend 32) (currentBit!4868 thiss!1288)) lt!142364)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3670 array!4591 (_ BitVec 64)) Unit!5987)

(assert (=> b!98146 (= lt!142385 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1288 (buf!2449 (_2!4190 lt!142350)) lt!142364))))

(assert (=> b!98146 e!64227))

(declare-fun res!80517 () Bool)

(assert (=> b!98146 (=> (not res!80517) (not e!64227))))

(assert (=> b!98146 (= res!80517 (and (= (size!2098 (buf!2449 thiss!1288)) (size!2098 (buf!2449 (_2!4190 lt!142350)))) (bvsge lt!142364 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!98146 (= lt!142364 ((_ sign_extend 32) (bvsub nBits!388 #b00000000000000000000000000000000)))))

(assert (=> b!98146 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!98146 (= lt!142351 (bvand v!196 (bvnot (onesLSBLong!0 (bvsub nBits!388 #b00000000000000000000000000000000)))))))

(assert (=> b!98146 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(declare-fun reader!0 (BitStream!3670 BitStream!3670) tuple2!7892)

(assert (=> b!98146 (= lt!142373 (reader!0 thiss!1288 (_2!4190 lt!142350)))))

(declare-fun b!98147 () Bool)

(declare-fun res!80511 () Bool)

(assert (=> b!98147 (=> (not res!80511) (not e!64233))))

(declare-fun isPrefixOf!0 (BitStream!3670 BitStream!3670) Bool)

(assert (=> b!98147 (= res!80511 (isPrefixOf!0 thiss!1288 (_2!4190 lt!142350)))))

(declare-fun lt!142380 () BitStream!3670)

(declare-fun bm!1216 () Bool)

(declare-fun call!1219 () Bool)

(assert (=> bm!1216 (= call!1219 (isPrefixOf!0 (ite c!6208 thiss!1288 lt!142380) (ite c!6208 (_2!4190 lt!142348) lt!142380)))))

(declare-fun b!98148 () Bool)

(declare-fun e!64232 () (_ BitVec 64))

(assert (=> b!98148 (= e!64232 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!98149 () Bool)

(declare-fun res!80514 () Bool)

(assert (=> b!98149 (= res!80514 (= (bitIndex!0 (size!2098 (buf!2449 (_2!4190 lt!142348))) (currentByte!4873 (_2!4190 lt!142348)) (currentBit!4868 (_2!4190 lt!142348))) (bvadd (bitIndex!0 (size!2098 (buf!2449 thiss!1288)) (currentByte!4873 thiss!1288) (currentBit!4868 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!64230 () Bool)

(assert (=> b!98149 (=> (not res!80514) (not e!64230))))

(declare-fun b!98150 () Bool)

(declare-fun lt!142359 () Unit!5987)

(assert (=> b!98150 (= e!64231 (tuple2!7877 lt!142359 thiss!1288))))

(assert (=> b!98150 (= lt!142380 thiss!1288)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!3670) Unit!5987)

(assert (=> b!98150 (= lt!142359 (lemmaIsPrefixRefl!0 lt!142380))))

(assert (=> b!98150 call!1219))

(declare-fun b!98151 () Bool)

(declare-fun res!80515 () Bool)

(assert (=> b!98151 (=> (not res!80515) (not e!64233))))

(declare-fun lt!142346 () (_ BitVec 64))

(declare-fun lt!142387 () (_ BitVec 64))

(assert (=> b!98151 (= res!80515 (= (bitIndex!0 (size!2098 (buf!2449 (_2!4190 lt!142350))) (currentByte!4873 (_2!4190 lt!142350)) (currentBit!4868 (_2!4190 lt!142350))) (bvadd lt!142346 lt!142387)))))

(assert (=> b!98151 (or (not (= (bvand lt!142346 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!142387 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!142346 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!142346 lt!142387) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!98151 (= lt!142387 ((_ sign_extend 32) (bvsub nBits!388 #b00000000000000000000000000000000)))))

(assert (=> b!98151 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!98151 (= lt!142346 (bitIndex!0 (size!2098 (buf!2449 thiss!1288)) (currentByte!4873 thiss!1288) (currentBit!4868 thiss!1288)))))

(declare-fun b!98152 () Bool)

(assert (=> b!98152 (= e!64232 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!98153 () Bool)

(declare-fun e!64228 () Bool)

(declare-fun lt!142376 () tuple2!7888)

(declare-fun lt!142378 () tuple2!7888)

(assert (=> b!98153 (= e!64228 (= (_2!4196 lt!142376) (_2!4196 lt!142378)))))

(declare-fun b!98154 () Bool)

(declare-fun lt!142371 () tuple2!7876)

(declare-fun Unit!5995 () Unit!5987)

(assert (=> b!98154 (= e!64231 (tuple2!7877 Unit!5995 (_2!4190 lt!142371)))))

(declare-fun lt!142355 () Bool)

(assert (=> b!98154 (= lt!142355 (not (= (bvand v!196 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun appendBit!0 (BitStream!3670 Bool) tuple2!7876)

(assert (=> b!98154 (= lt!142348 (appendBit!0 thiss!1288 lt!142355))))

(declare-fun res!80516 () Bool)

(assert (=> b!98154 (= res!80516 (= (size!2098 (buf!2449 thiss!1288)) (size!2098 (buf!2449 (_2!4190 lt!142348)))))))

(assert (=> b!98154 (=> (not res!80516) (not e!64230))))

(assert (=> b!98154 e!64230))

(declare-fun lt!142352 () tuple2!7876)

(assert (=> b!98154 (= lt!142352 lt!142348)))

(assert (=> b!98154 (= lt!142371 (appendNLeastSignificantBitsLoop!0 (_2!4190 lt!142352) v!196 nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!142366 () Unit!5987)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3670 BitStream!3670 BitStream!3670) Unit!5987)

(assert (=> b!98154 (= lt!142366 (lemmaIsPrefixTransitive!0 thiss!1288 (_2!4190 lt!142352) (_2!4190 lt!142371)))))

(assert (=> b!98154 (isPrefixOf!0 thiss!1288 (_2!4190 lt!142371))))

(declare-fun lt!142360 () Unit!5987)

(assert (=> b!98154 (= lt!142360 lt!142366)))

(assert (=> b!98154 (invariant!0 (currentBit!4868 thiss!1288) (currentByte!4873 thiss!1288) (size!2098 (buf!2449 (_2!4190 lt!142352))))))

(declare-fun lt!142390 () BitStream!3670)

(assert (=> b!98154 (= lt!142390 (BitStream!3671 (buf!2449 (_2!4190 lt!142352)) (currentByte!4873 thiss!1288) (currentBit!4868 thiss!1288)))))

(assert (=> b!98154 (invariant!0 (currentBit!4868 lt!142390) (currentByte!4873 lt!142390) (size!2098 (buf!2449 (_2!4190 lt!142371))))))

(declare-fun lt!142356 () BitStream!3670)

(assert (=> b!98154 (= lt!142356 (BitStream!3671 (buf!2449 (_2!4190 lt!142371)) (currentByte!4873 lt!142390) (currentBit!4868 lt!142390)))))

(declare-fun readBitPure!0 (BitStream!3670) tuple2!7888)

(assert (=> b!98154 (= lt!142376 (readBitPure!0 lt!142390))))

(assert (=> b!98154 (= lt!142378 (readBitPure!0 lt!142356))))

(declare-fun lt!142353 () Unit!5987)

(declare-fun readBitPrefixLemma!0 (BitStream!3670 BitStream!3670) Unit!5987)

(assert (=> b!98154 (= lt!142353 (readBitPrefixLemma!0 lt!142390 (_2!4190 lt!142371)))))

(declare-fun res!80513 () Bool)

(assert (=> b!98154 (= res!80513 (= (bitIndex!0 (size!2098 (buf!2449 (_1!4196 lt!142376))) (currentByte!4873 (_1!4196 lt!142376)) (currentBit!4868 (_1!4196 lt!142376))) (bitIndex!0 (size!2098 (buf!2449 (_1!4196 lt!142378))) (currentByte!4873 (_1!4196 lt!142378)) (currentBit!4868 (_1!4196 lt!142378)))))))

(assert (=> b!98154 (=> (not res!80513) (not e!64228))))

(assert (=> b!98154 e!64228))

(declare-fun lt!142372 () Unit!5987)

(assert (=> b!98154 (= lt!142372 lt!142353)))

(declare-fun lt!142384 () tuple2!7892)

(assert (=> b!98154 (= lt!142384 (reader!0 thiss!1288 (_2!4190 lt!142371)))))

(declare-fun lt!142381 () tuple2!7892)

(assert (=> b!98154 (= lt!142381 (reader!0 (_2!4190 lt!142352) (_2!4190 lt!142371)))))

(declare-fun lt!142363 () tuple2!7888)

(assert (=> b!98154 (= lt!142363 (readBitPure!0 (_1!4198 lt!142384)))))

(assert (=> b!98154 (= (_2!4196 lt!142363) lt!142355)))

(declare-fun lt!142358 () Unit!5987)

(declare-fun Unit!6000 () Unit!5987)

(assert (=> b!98154 (= lt!142358 Unit!6000)))

(declare-fun lt!142383 () (_ BitVec 64))

(assert (=> b!98154 (= lt!142383 (bvand v!196 (bvnot (onesLSBLong!0 (bvsub nBits!388 #b00000000000000000000000000000000)))))))

(declare-fun lt!142365 () (_ BitVec 64))

(assert (=> b!98154 (= lt!142365 ((_ sign_extend 32) (bvsub nBits!388 #b00000000000000000000000000000000)))))

(declare-fun lt!142367 () Unit!5987)

(assert (=> b!98154 (= lt!142367 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1288 (buf!2449 (_2!4190 lt!142371)) lt!142365))))

(assert (=> b!98154 (validate_offset_bits!1 ((_ sign_extend 32) (size!2098 (buf!2449 (_2!4190 lt!142371)))) ((_ sign_extend 32) (currentByte!4873 thiss!1288)) ((_ sign_extend 32) (currentBit!4868 thiss!1288)) lt!142365)))

(declare-fun lt!142357 () Unit!5987)

(assert (=> b!98154 (= lt!142357 lt!142367)))

(declare-fun lt!142374 () tuple2!7890)

(assert (=> b!98154 (= lt!142374 (readNLeastSignificantBitsLoopPure!0 (_1!4198 lt!142384) nBits!388 #b00000000000000000000000000000000 lt!142383))))

(declare-fun lt!142382 () (_ BitVec 64))

(assert (=> b!98154 (= lt!142382 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000000) #b00000000000000000000000000000001)))))

(declare-fun lt!142370 () Unit!5987)

(assert (=> b!98154 (= lt!142370 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4190 lt!142352) (buf!2449 (_2!4190 lt!142371)) lt!142382))))

(assert (=> b!98154 (validate_offset_bits!1 ((_ sign_extend 32) (size!2098 (buf!2449 (_2!4190 lt!142371)))) ((_ sign_extend 32) (currentByte!4873 (_2!4190 lt!142352))) ((_ sign_extend 32) (currentBit!4868 (_2!4190 lt!142352))) lt!142382)))

(declare-fun lt!142377 () Unit!5987)

(assert (=> b!98154 (= lt!142377 lt!142370)))

(declare-fun lt!142388 () tuple2!7890)

(assert (=> b!98154 (= lt!142388 (readNLeastSignificantBitsLoopPure!0 (_1!4198 lt!142381) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!142383 (ite (_2!4196 lt!142363) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!142347 () tuple2!7890)

(assert (=> b!98154 (= lt!142347 (readNLeastSignificantBitsLoopPure!0 (_1!4198 lt!142384) nBits!388 #b00000000000000000000000000000000 lt!142383))))

(declare-fun c!6209 () Bool)

(assert (=> b!98154 (= c!6209 (_2!4196 (readBitPure!0 (_1!4198 lt!142384))))))

(declare-fun lt!142386 () tuple2!7890)

(declare-fun withMovedBitIndex!0 (BitStream!3670 (_ BitVec 64)) BitStream!3670)

(assert (=> b!98154 (= lt!142386 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4198 lt!142384) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!142383 e!64232)))))

(declare-fun lt!142375 () Unit!5987)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3670 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!5987)

(assert (=> b!98154 (= lt!142375 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4198 lt!142384) nBits!388 #b00000000000000000000000000000000 lt!142383))))

(assert (=> b!98154 (and (= (_2!4197 lt!142347) (_2!4197 lt!142386)) (= (_1!4197 lt!142347) (_1!4197 lt!142386)))))

(declare-fun lt!142361 () Unit!5987)

(assert (=> b!98154 (= lt!142361 lt!142375)))

(assert (=> b!98154 (= (_1!4198 lt!142384) (withMovedBitIndex!0 (_2!4198 lt!142384) (bvsub (bitIndex!0 (size!2098 (buf!2449 thiss!1288)) (currentByte!4873 thiss!1288) (currentBit!4868 thiss!1288)) (bitIndex!0 (size!2098 (buf!2449 (_2!4190 lt!142371))) (currentByte!4873 (_2!4190 lt!142371)) (currentBit!4868 (_2!4190 lt!142371))))))))

(declare-fun lt!142369 () Unit!5987)

(declare-fun Unit!6001 () Unit!5987)

(assert (=> b!98154 (= lt!142369 Unit!6001)))

(assert (=> b!98154 (= (_1!4198 lt!142381) (withMovedBitIndex!0 (_2!4198 lt!142381) (bvsub (bitIndex!0 (size!2098 (buf!2449 (_2!4190 lt!142352))) (currentByte!4873 (_2!4190 lt!142352)) (currentBit!4868 (_2!4190 lt!142352))) (bitIndex!0 (size!2098 (buf!2449 (_2!4190 lt!142371))) (currentByte!4873 (_2!4190 lt!142371)) (currentBit!4868 (_2!4190 lt!142371))))))))

(declare-fun lt!142354 () Unit!5987)

(declare-fun Unit!6002 () Unit!5987)

(assert (=> b!98154 (= lt!142354 Unit!6002)))

(assert (=> b!98154 (= (bitIndex!0 (size!2098 (buf!2449 thiss!1288)) (currentByte!4873 thiss!1288) (currentBit!4868 thiss!1288)) (bvsub (bitIndex!0 (size!2098 (buf!2449 (_2!4190 lt!142352))) (currentByte!4873 (_2!4190 lt!142352)) (currentBit!4868 (_2!4190 lt!142352))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!142389 () Unit!5987)

(declare-fun Unit!6003 () Unit!5987)

(assert (=> b!98154 (= lt!142389 Unit!6003)))

(assert (=> b!98154 (= (_2!4197 lt!142374) (_2!4197 lt!142388))))

(declare-fun lt!142368 () Unit!5987)

(declare-fun Unit!6004 () Unit!5987)

(assert (=> b!98154 (= lt!142368 Unit!6004)))

(assert (=> b!98154 (= (_1!4197 lt!142374) (_2!4198 lt!142384))))

(declare-fun b!98155 () Bool)

(declare-fun readerFrom!0 (BitStream!3670 (_ BitVec 32) (_ BitVec 32)) BitStream!3670)

(assert (=> b!98155 (= lt!142362 (readBitPure!0 (readerFrom!0 (_2!4190 lt!142348) (currentBit!4868 thiss!1288) (currentByte!4873 thiss!1288))))))

(declare-fun res!80519 () Bool)

(assert (=> b!98155 (= res!80519 (and (= (_2!4196 lt!142362) lt!142355) (= (_1!4196 lt!142362) (_2!4190 lt!142348))))))

(assert (=> b!98155 (=> (not res!80519) (not e!64229))))

(assert (=> b!98155 (= e!64230 e!64229)))

(declare-fun b!98156 () Bool)

(declare-fun res!80512 () Bool)

(assert (=> b!98156 (= res!80512 call!1219)))

(assert (=> b!98156 (=> (not res!80512) (not e!64230))))

(assert (= (and d!30766 c!6208) b!98154))

(assert (= (and d!30766 (not c!6208)) b!98150))

(assert (= (and b!98154 res!80516) b!98149))

(assert (= (and b!98149 res!80514) b!98156))

(assert (= (and b!98156 res!80512) b!98155))

(assert (= (and b!98155 res!80519) b!98145))

(assert (= (and b!98154 res!80513) b!98153))

(assert (= (and b!98154 c!6209) b!98152))

(assert (= (and b!98154 (not c!6209)) b!98148))

(assert (= (or b!98156 b!98150) bm!1216))

(assert (= (and d!30766 res!80518) b!98151))

(assert (= (and b!98151 res!80515) b!98147))

(assert (= (and b!98147 res!80511) b!98146))

(assert (= (and b!98146 res!80517) b!98144))

(declare-fun m!142595 () Bool)

(assert (=> b!98154 m!142595))

(declare-fun m!142597 () Bool)

(assert (=> b!98154 m!142597))

(declare-fun m!142599 () Bool)

(assert (=> b!98154 m!142599))

(declare-fun m!142601 () Bool)

(assert (=> b!98154 m!142601))

(declare-fun m!142603 () Bool)

(assert (=> b!98154 m!142603))

(declare-fun m!142605 () Bool)

(assert (=> b!98154 m!142605))

(declare-fun m!142607 () Bool)

(assert (=> b!98154 m!142607))

(declare-fun m!142609 () Bool)

(assert (=> b!98154 m!142609))

(declare-fun m!142611 () Bool)

(assert (=> b!98154 m!142611))

(declare-fun m!142613 () Bool)

(assert (=> b!98154 m!142613))

(declare-fun m!142615 () Bool)

(assert (=> b!98154 m!142615))

(declare-fun m!142617 () Bool)

(assert (=> b!98154 m!142617))

(declare-fun m!142619 () Bool)

(assert (=> b!98154 m!142619))

(declare-fun m!142621 () Bool)

(assert (=> b!98154 m!142621))

(declare-fun m!142623 () Bool)

(assert (=> b!98154 m!142623))

(declare-fun m!142625 () Bool)

(assert (=> b!98154 m!142625))

(declare-fun m!142627 () Bool)

(assert (=> b!98154 m!142627))

(declare-fun m!142629 () Bool)

(assert (=> b!98154 m!142629))

(declare-fun m!142631 () Bool)

(assert (=> b!98154 m!142631))

(assert (=> b!98154 m!142473))

(assert (=> b!98154 m!142597))

(declare-fun m!142633 () Bool)

(assert (=> b!98154 m!142633))

(declare-fun m!142635 () Bool)

(assert (=> b!98154 m!142635))

(declare-fun m!142637 () Bool)

(assert (=> b!98154 m!142637))

(declare-fun m!142639 () Bool)

(assert (=> b!98154 m!142639))

(declare-fun m!142641 () Bool)

(assert (=> b!98154 m!142641))

(declare-fun m!142643 () Bool)

(assert (=> b!98154 m!142643))

(declare-fun m!142645 () Bool)

(assert (=> b!98154 m!142645))

(declare-fun m!142647 () Bool)

(assert (=> b!98154 m!142647))

(declare-fun m!142649 () Bool)

(assert (=> b!98154 m!142649))

(assert (=> b!98146 m!142627))

(declare-fun m!142651 () Bool)

(assert (=> b!98146 m!142651))

(declare-fun m!142653 () Bool)

(assert (=> b!98146 m!142653))

(declare-fun m!142655 () Bool)

(assert (=> b!98146 m!142655))

(declare-fun m!142657 () Bool)

(assert (=> b!98146 m!142657))

(declare-fun m!142659 () Bool)

(assert (=> b!98149 m!142659))

(assert (=> b!98149 m!142473))

(declare-fun m!142661 () Bool)

(assert (=> b!98144 m!142661))

(declare-fun m!142663 () Bool)

(assert (=> bm!1216 m!142663))

(declare-fun m!142665 () Bool)

(assert (=> b!98151 m!142665))

(assert (=> b!98151 m!142473))

(declare-fun m!142667 () Bool)

(assert (=> b!98147 m!142667))

(declare-fun m!142669 () Bool)

(assert (=> b!98150 m!142669))

(declare-fun m!142671 () Bool)

(assert (=> b!98155 m!142671))

(assert (=> b!98155 m!142671))

(declare-fun m!142673 () Bool)

(assert (=> b!98155 m!142673))

(declare-fun m!142675 () Bool)

(assert (=> b!98145 m!142675))

(assert (=> b!98145 m!142659))

(assert (=> b!98028 d!30766))

(push 1)

(assert (not b!98150))

(assert (not d!30752))

(assert (not bm!1216))

(assert (not b!98154))

(assert (not b!98144))

(assert (not b!98147))

(assert (not b!98151))

(assert (not d!30754))

(assert (not b!98145))

(assert (not b!98146))

(assert (not d!30760))

(assert (not b!98149))

(assert (not b!98155))

(check-sat)

(pop 1)

(push 1)

(check-sat)

