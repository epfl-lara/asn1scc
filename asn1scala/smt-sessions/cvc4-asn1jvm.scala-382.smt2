; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!9282 () Bool)

(assert start!9282)

(declare-fun b!46272 () Bool)

(declare-fun res!39117 () Bool)

(declare-fun e!30780 () Bool)

(assert (=> b!46272 (=> res!39117 e!30780)))

(declare-datatypes ((array!2288 0))(
  ( (array!2289 (arr!1549 (Array (_ BitVec 32) (_ BitVec 8))) (size!1032 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1802 0))(
  ( (BitStream!1803 (buf!1381 array!2288) (currentByte!2880 (_ BitVec 32)) (currentBit!2875 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!3277 0))(
  ( (Unit!3278) )
))
(declare-datatypes ((tuple2!4496 0))(
  ( (tuple2!4497 (_1!2341 Unit!3277) (_2!2341 BitStream!1802)) )
))
(declare-fun lt!71211 () tuple2!4496)

(declare-fun lt!71223 () tuple2!4496)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!46272 (= res!39117 (not (invariant!0 (currentBit!2875 (_2!2341 lt!71211)) (currentByte!2880 (_2!2341 lt!71211)) (size!1032 (buf!1381 (_2!2341 lt!71223))))))))

(declare-datatypes ((tuple2!4498 0))(
  ( (tuple2!4499 (_1!2342 BitStream!1802) (_2!2342 BitStream!1802)) )
))
(declare-fun lt!71212 () tuple2!4498)

(declare-fun b!46273 () Bool)

(declare-fun lt!71225 () tuple2!4498)

(declare-fun lt!71218 () (_ BitVec 64))

(declare-fun e!30787 () Bool)

(declare-fun bitAt!0 (array!2288 (_ BitVec 64)) Bool)

(assert (=> b!46273 (= e!30787 (= (bitAt!0 (buf!1381 (_1!2342 lt!71212)) lt!71218) (bitAt!0 (buf!1381 (_1!2342 lt!71225)) lt!71218)))))

(declare-fun b!46274 () Bool)

(declare-fun e!30791 () Bool)

(assert (=> b!46274 (= e!30780 e!30791)))

(declare-fun res!39105 () Bool)

(assert (=> b!46274 (=> res!39105 e!30791)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!46274 (= res!39105 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!71227 () (_ BitVec 64))

(declare-datatypes ((List!542 0))(
  ( (Nil!539) (Cons!538 (h!657 Bool) (t!1292 List!542)) )
))
(declare-fun lt!71217 () List!542)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1802 BitStream!1802 (_ BitVec 64)) List!542)

(assert (=> b!46274 (= lt!71217 (bitStreamReadBitsIntoList!0 (_2!2341 lt!71223) (_1!2342 lt!71225) lt!71227))))

(declare-fun lt!71226 () List!542)

(assert (=> b!46274 (= lt!71226 (bitStreamReadBitsIntoList!0 (_2!2341 lt!71223) (_1!2342 lt!71212) (bvsub to!314 i!635)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!46274 (validate_offset_bits!1 ((_ sign_extend 32) (size!1032 (buf!1381 (_2!2341 lt!71223)))) ((_ sign_extend 32) (currentByte!2880 (_2!2341 lt!71211))) ((_ sign_extend 32) (currentBit!2875 (_2!2341 lt!71211))) lt!71227)))

(declare-fun lt!71219 () Unit!3277)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1802 array!2288 (_ BitVec 64)) Unit!3277)

(assert (=> b!46274 (= lt!71219 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2341 lt!71211) (buf!1381 (_2!2341 lt!71223)) lt!71227))))

(declare-fun reader!0 (BitStream!1802 BitStream!1802) tuple2!4498)

(assert (=> b!46274 (= lt!71225 (reader!0 (_2!2341 lt!71211) (_2!2341 lt!71223)))))

(declare-fun thiss!1379 () BitStream!1802)

(assert (=> b!46274 (validate_offset_bits!1 ((_ sign_extend 32) (size!1032 (buf!1381 (_2!2341 lt!71223)))) ((_ sign_extend 32) (currentByte!2880 thiss!1379)) ((_ sign_extend 32) (currentBit!2875 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!71224 () Unit!3277)

(assert (=> b!46274 (= lt!71224 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1381 (_2!2341 lt!71223)) (bvsub to!314 i!635)))))

(assert (=> b!46274 (= lt!71212 (reader!0 thiss!1379 (_2!2341 lt!71223)))))

(declare-fun b!46275 () Bool)

(declare-fun res!39114 () Bool)

(declare-fun e!30782 () Bool)

(assert (=> b!46275 (=> res!39114 e!30782)))

(assert (=> b!46275 (= res!39114 (not (invariant!0 (currentBit!2875 (_2!2341 lt!71223)) (currentByte!2880 (_2!2341 lt!71223)) (size!1032 (buf!1381 (_2!2341 lt!71223))))))))

(declare-fun b!46276 () Bool)

(declare-fun res!39107 () Bool)

(assert (=> b!46276 (=> res!39107 e!30780)))

(assert (=> b!46276 (= res!39107 (not (invariant!0 (currentBit!2875 (_2!2341 lt!71211)) (currentByte!2880 (_2!2341 lt!71211)) (size!1032 (buf!1381 (_2!2341 lt!71211))))))))

(declare-fun b!46277 () Bool)

(declare-fun e!30786 () Bool)

(declare-fun e!30781 () Bool)

(assert (=> b!46277 (= e!30786 e!30781)))

(declare-fun res!39112 () Bool)

(assert (=> b!46277 (=> res!39112 e!30781)))

(declare-fun isPrefixOf!0 (BitStream!1802 BitStream!1802) Bool)

(assert (=> b!46277 (= res!39112 (not (isPrefixOf!0 thiss!1379 (_2!2341 lt!71211))))))

(assert (=> b!46277 (validate_offset_bits!1 ((_ sign_extend 32) (size!1032 (buf!1381 (_2!2341 lt!71211)))) ((_ sign_extend 32) (currentByte!2880 (_2!2341 lt!71211))) ((_ sign_extend 32) (currentBit!2875 (_2!2341 lt!71211))) lt!71227)))

(assert (=> b!46277 (= lt!71227 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!71214 () Unit!3277)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1802 BitStream!1802 (_ BitVec 64) (_ BitVec 64)) Unit!3277)

(assert (=> b!46277 (= lt!71214 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2341 lt!71211) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2288)

(declare-fun appendBitFromByte!0 (BitStream!1802 (_ BitVec 8) (_ BitVec 32)) tuple2!4496)

(assert (=> b!46277 (= lt!71211 (appendBitFromByte!0 thiss!1379 (select (arr!1549 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!46278 () Bool)

(declare-fun res!39113 () Bool)

(assert (=> b!46278 (=> res!39113 e!30782)))

(assert (=> b!46278 (= res!39113 (not (= (size!1032 (buf!1381 thiss!1379)) (size!1032 (buf!1381 (_2!2341 lt!71223))))))))

(declare-fun b!46279 () Bool)

(declare-fun e!30783 () Bool)

(assert (=> b!46279 (= e!30783 e!30782)))

(declare-fun res!39116 () Bool)

(assert (=> b!46279 (=> res!39116 e!30782)))

(declare-fun lt!71213 () (_ BitVec 64))

(assert (=> b!46279 (= res!39116 (not (= lt!71213 (bvsub (bvadd lt!71218 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!46279 (= lt!71213 (bitIndex!0 (size!1032 (buf!1381 (_2!2341 lt!71223))) (currentByte!2880 (_2!2341 lt!71223)) (currentBit!2875 (_2!2341 lt!71223))))))

(declare-fun b!46280 () Bool)

(assert (=> b!46280 (= e!30791 e!30787)))

(declare-fun res!39115 () Bool)

(assert (=> b!46280 (=> res!39115 e!30787)))

(declare-fun lt!71216 () List!542)

(assert (=> b!46280 (= res!39115 (not (= lt!71216 lt!71217)))))

(assert (=> b!46280 (= lt!71217 lt!71216)))

(declare-fun tail!228 (List!542) List!542)

(assert (=> b!46280 (= lt!71216 (tail!228 lt!71226))))

(declare-fun lt!71221 () Unit!3277)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1802 BitStream!1802 BitStream!1802 BitStream!1802 (_ BitVec 64) List!542) Unit!3277)

(assert (=> b!46280 (= lt!71221 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2341 lt!71223) (_2!2341 lt!71223) (_1!2342 lt!71212) (_1!2342 lt!71225) (bvsub to!314 i!635) lt!71226))))

(declare-fun b!46281 () Bool)

(assert (=> b!46281 (= e!30781 e!30783)))

(declare-fun res!39120 () Bool)

(assert (=> b!46281 (=> res!39120 e!30783)))

(assert (=> b!46281 (= res!39120 (not (isPrefixOf!0 (_2!2341 lt!71211) (_2!2341 lt!71223))))))

(assert (=> b!46281 (isPrefixOf!0 thiss!1379 (_2!2341 lt!71223))))

(declare-fun lt!71210 () Unit!3277)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1802 BitStream!1802 BitStream!1802) Unit!3277)

(assert (=> b!46281 (= lt!71210 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2341 lt!71211) (_2!2341 lt!71223)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1802 array!2288 (_ BitVec 64) (_ BitVec 64)) tuple2!4496)

(assert (=> b!46281 (= lt!71223 (appendBitsMSBFirstLoop!0 (_2!2341 lt!71211) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!30789 () Bool)

(assert (=> b!46281 e!30789))

(declare-fun res!39111 () Bool)

(assert (=> b!46281 (=> (not res!39111) (not e!30789))))

(assert (=> b!46281 (= res!39111 (validate_offset_bits!1 ((_ sign_extend 32) (size!1032 (buf!1381 (_2!2341 lt!71211)))) ((_ sign_extend 32) (currentByte!2880 thiss!1379)) ((_ sign_extend 32) (currentBit!2875 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!71222 () Unit!3277)

(assert (=> b!46281 (= lt!71222 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1381 (_2!2341 lt!71211)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!71220 () tuple2!4498)

(assert (=> b!46281 (= lt!71220 (reader!0 thiss!1379 (_2!2341 lt!71211)))))

(declare-fun b!46282 () Bool)

(declare-fun res!39109 () Bool)

(assert (=> b!46282 (=> res!39109 e!30791)))

(declare-fun length!237 (List!542) Int)

(assert (=> b!46282 (= res!39109 (<= (length!237 lt!71226) 0))))

(declare-fun b!46283 () Bool)

(assert (=> b!46283 (= e!30782 e!30780)))

(declare-fun res!39106 () Bool)

(assert (=> b!46283 (=> res!39106 e!30780)))

(assert (=> b!46283 (= res!39106 (not (= (size!1032 (buf!1381 (_2!2341 lt!71211))) (size!1032 (buf!1381 (_2!2341 lt!71223))))))))

(declare-fun e!30788 () Bool)

(assert (=> b!46283 e!30788))

(declare-fun res!39110 () Bool)

(assert (=> b!46283 (=> (not res!39110) (not e!30788))))

(assert (=> b!46283 (= res!39110 (= (size!1032 (buf!1381 (_2!2341 lt!71223))) (size!1032 (buf!1381 thiss!1379))))))

(declare-fun b!46284 () Bool)

(declare-fun e!30790 () Bool)

(declare-fun array_inv!954 (array!2288) Bool)

(assert (=> b!46284 (= e!30790 (array_inv!954 (buf!1381 thiss!1379)))))

(declare-fun b!46285 () Bool)

(declare-fun head!361 (List!542) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1802 array!2288 (_ BitVec 64) (_ BitVec 64)) List!542)

(assert (=> b!46285 (= e!30789 (= (head!361 (byteArrayBitContentToList!0 (_2!2341 lt!71211) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!361 (bitStreamReadBitsIntoList!0 (_2!2341 lt!71211) (_1!2342 lt!71220) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!46286 () Bool)

(declare-fun res!39108 () Bool)

(declare-fun e!30779 () Bool)

(assert (=> b!46286 (=> (not res!39108) (not e!30779))))

(assert (=> b!46286 (= res!39108 (validate_offset_bits!1 ((_ sign_extend 32) (size!1032 (buf!1381 thiss!1379))) ((_ sign_extend 32) (currentByte!2880 thiss!1379)) ((_ sign_extend 32) (currentBit!2875 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!46288 () Bool)

(assert (=> b!46288 (= e!30788 (= lt!71213 (bvsub (bvsub (bvadd (bitIndex!0 (size!1032 (buf!1381 (_2!2341 lt!71211))) (currentByte!2880 (_2!2341 lt!71211)) (currentBit!2875 (_2!2341 lt!71211))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!46287 () Bool)

(assert (=> b!46287 (= e!30779 (not e!30786))))

(declare-fun res!39118 () Bool)

(assert (=> b!46287 (=> res!39118 e!30786)))

(assert (=> b!46287 (= res!39118 (bvsge i!635 to!314))))

(assert (=> b!46287 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!71215 () Unit!3277)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1802) Unit!3277)

(assert (=> b!46287 (= lt!71215 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!46287 (= lt!71218 (bitIndex!0 (size!1032 (buf!1381 thiss!1379)) (currentByte!2880 thiss!1379) (currentBit!2875 thiss!1379)))))

(declare-fun res!39119 () Bool)

(assert (=> start!9282 (=> (not res!39119) (not e!30779))))

(assert (=> start!9282 (= res!39119 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1032 srcBuffer!2))))))))

(assert (=> start!9282 e!30779))

(assert (=> start!9282 true))

(assert (=> start!9282 (array_inv!954 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1802) Bool)

(assert (=> start!9282 (and (inv!12 thiss!1379) e!30790)))

(assert (= (and start!9282 res!39119) b!46286))

(assert (= (and b!46286 res!39108) b!46287))

(assert (= (and b!46287 (not res!39118)) b!46277))

(assert (= (and b!46277 (not res!39112)) b!46281))

(assert (= (and b!46281 res!39111) b!46285))

(assert (= (and b!46281 (not res!39120)) b!46279))

(assert (= (and b!46279 (not res!39116)) b!46275))

(assert (= (and b!46275 (not res!39114)) b!46278))

(assert (= (and b!46278 (not res!39113)) b!46283))

(assert (= (and b!46283 res!39110) b!46288))

(assert (= (and b!46283 (not res!39106)) b!46276))

(assert (= (and b!46276 (not res!39107)) b!46272))

(assert (= (and b!46272 (not res!39117)) b!46274))

(assert (= (and b!46274 (not res!39105)) b!46282))

(assert (= (and b!46282 (not res!39109)) b!46280))

(assert (= (and b!46280 (not res!39115)) b!46273))

(assert (= start!9282 b!46284))

(declare-fun m!70791 () Bool)

(assert (=> b!46274 m!70791))

(declare-fun m!70793 () Bool)

(assert (=> b!46274 m!70793))

(declare-fun m!70795 () Bool)

(assert (=> b!46274 m!70795))

(declare-fun m!70797 () Bool)

(assert (=> b!46274 m!70797))

(declare-fun m!70799 () Bool)

(assert (=> b!46274 m!70799))

(declare-fun m!70801 () Bool)

(assert (=> b!46274 m!70801))

(declare-fun m!70803 () Bool)

(assert (=> b!46274 m!70803))

(declare-fun m!70805 () Bool)

(assert (=> b!46274 m!70805))

(declare-fun m!70807 () Bool)

(assert (=> b!46276 m!70807))

(declare-fun m!70809 () Bool)

(assert (=> b!46279 m!70809))

(declare-fun m!70811 () Bool)

(assert (=> b!46273 m!70811))

(declare-fun m!70813 () Bool)

(assert (=> b!46273 m!70813))

(declare-fun m!70815 () Bool)

(assert (=> b!46275 m!70815))

(declare-fun m!70817 () Bool)

(assert (=> b!46284 m!70817))

(declare-fun m!70819 () Bool)

(assert (=> b!46287 m!70819))

(declare-fun m!70821 () Bool)

(assert (=> b!46287 m!70821))

(declare-fun m!70823 () Bool)

(assert (=> b!46287 m!70823))

(declare-fun m!70825 () Bool)

(assert (=> b!46285 m!70825))

(assert (=> b!46285 m!70825))

(declare-fun m!70827 () Bool)

(assert (=> b!46285 m!70827))

(declare-fun m!70829 () Bool)

(assert (=> b!46285 m!70829))

(assert (=> b!46285 m!70829))

(declare-fun m!70831 () Bool)

(assert (=> b!46285 m!70831))

(declare-fun m!70833 () Bool)

(assert (=> b!46288 m!70833))

(declare-fun m!70835 () Bool)

(assert (=> b!46277 m!70835))

(declare-fun m!70837 () Bool)

(assert (=> b!46277 m!70837))

(declare-fun m!70839 () Bool)

(assert (=> b!46277 m!70839))

(declare-fun m!70841 () Bool)

(assert (=> b!46277 m!70841))

(assert (=> b!46277 m!70837))

(declare-fun m!70843 () Bool)

(assert (=> b!46277 m!70843))

(declare-fun m!70845 () Bool)

(assert (=> start!9282 m!70845))

(declare-fun m!70847 () Bool)

(assert (=> start!9282 m!70847))

(declare-fun m!70849 () Bool)

(assert (=> b!46282 m!70849))

(declare-fun m!70851 () Bool)

(assert (=> b!46280 m!70851))

(declare-fun m!70853 () Bool)

(assert (=> b!46280 m!70853))

(declare-fun m!70855 () Bool)

(assert (=> b!46272 m!70855))

(declare-fun m!70857 () Bool)

(assert (=> b!46281 m!70857))

(declare-fun m!70859 () Bool)

(assert (=> b!46281 m!70859))

(declare-fun m!70861 () Bool)

(assert (=> b!46281 m!70861))

(declare-fun m!70863 () Bool)

(assert (=> b!46281 m!70863))

(declare-fun m!70865 () Bool)

(assert (=> b!46281 m!70865))

(declare-fun m!70867 () Bool)

(assert (=> b!46281 m!70867))

(declare-fun m!70869 () Bool)

(assert (=> b!46281 m!70869))

(declare-fun m!70871 () Bool)

(assert (=> b!46286 m!70871))

(push 1)

(assert (not b!46277))

(assert (not b!46279))

(assert (not b!46274))

(assert (not b!46272))

(assert (not b!46284))

(assert (not b!46276))

(assert (not b!46285))

(assert (not b!46288))

(assert (not b!46275))

(assert (not start!9282))

(assert (not b!46273))

(assert (not b!46286))

(assert (not b!46280))

(assert (not b!46281))

(assert (not b!46282))

(assert (not b!46287))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!13470 () Bool)

(declare-fun e!30831 () Bool)

(assert (=> d!13470 e!30831))

(declare-fun res!39188 () Bool)

(assert (=> d!13470 (=> (not res!39188) (not e!30831))))

(declare-fun lt!71376 () (_ BitVec 64))

(declare-fun lt!71373 () (_ BitVec 64))

(declare-fun lt!71374 () (_ BitVec 64))

(assert (=> d!13470 (= res!39188 (= lt!71374 (bvsub lt!71376 lt!71373)))))

(assert (=> d!13470 (or (= (bvand lt!71376 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!71373 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!71376 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!71376 lt!71373) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!13470 (= lt!71373 (remainingBits!0 ((_ sign_extend 32) (size!1032 (buf!1381 (_2!2341 lt!71211)))) ((_ sign_extend 32) (currentByte!2880 (_2!2341 lt!71211))) ((_ sign_extend 32) (currentBit!2875 (_2!2341 lt!71211)))))))

(declare-fun lt!71377 () (_ BitVec 64))

(declare-fun lt!71375 () (_ BitVec 64))

(assert (=> d!13470 (= lt!71376 (bvmul lt!71377 lt!71375))))

(assert (=> d!13470 (or (= lt!71377 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!71375 (bvsdiv (bvmul lt!71377 lt!71375) lt!71377)))))

(assert (=> d!13470 (= lt!71375 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!13470 (= lt!71377 ((_ sign_extend 32) (size!1032 (buf!1381 (_2!2341 lt!71211)))))))

(assert (=> d!13470 (= lt!71374 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2880 (_2!2341 lt!71211))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2875 (_2!2341 lt!71211)))))))

(assert (=> d!13470 (invariant!0 (currentBit!2875 (_2!2341 lt!71211)) (currentByte!2880 (_2!2341 lt!71211)) (size!1032 (buf!1381 (_2!2341 lt!71211))))))

(assert (=> d!13470 (= (bitIndex!0 (size!1032 (buf!1381 (_2!2341 lt!71211))) (currentByte!2880 (_2!2341 lt!71211)) (currentBit!2875 (_2!2341 lt!71211))) lt!71374)))

(declare-fun b!46362 () Bool)

(declare-fun res!39187 () Bool)

(assert (=> b!46362 (=> (not res!39187) (not e!30831))))

(assert (=> b!46362 (= res!39187 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!71374))))

(declare-fun b!46363 () Bool)

(declare-fun lt!71372 () (_ BitVec 64))

(assert (=> b!46363 (= e!30831 (bvsle lt!71374 (bvmul lt!71372 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!46363 (or (= lt!71372 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!71372 #b0000000000000000000000000000000000000000000000000000000000001000) lt!71372)))))

(assert (=> b!46363 (= lt!71372 ((_ sign_extend 32) (size!1032 (buf!1381 (_2!2341 lt!71211)))))))

(assert (= (and d!13470 res!39188) b!46362))

(assert (= (and b!46362 res!39187) b!46363))

(declare-fun m!70955 () Bool)

(assert (=> d!13470 m!70955))

(assert (=> d!13470 m!70807))

(assert (=> b!46288 d!13470))

(declare-fun d!13472 () Bool)

(assert (=> d!13472 (= (array_inv!954 srcBuffer!2) (bvsge (size!1032 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!9282 d!13472))

(declare-fun d!13474 () Bool)

(assert (=> d!13474 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2875 thiss!1379) (currentByte!2880 thiss!1379) (size!1032 (buf!1381 thiss!1379))))))

(declare-fun bs!3557 () Bool)

(assert (= bs!3557 d!13474))

(declare-fun m!70957 () Bool)

(assert (=> bs!3557 m!70957))

(assert (=> start!9282 d!13474))

(declare-fun d!13476 () Bool)

(declare-fun res!39203 () Bool)

(declare-fun e!30839 () Bool)

(assert (=> d!13476 (=> (not res!39203) (not e!30839))))

(assert (=> d!13476 (= res!39203 (= (size!1032 (buf!1381 thiss!1379)) (size!1032 (buf!1381 (_2!2341 lt!71211)))))))

(assert (=> d!13476 (= (isPrefixOf!0 thiss!1379 (_2!2341 lt!71211)) e!30839)))

(declare-fun b!46376 () Bool)

(declare-fun res!39202 () Bool)

(assert (=> b!46376 (=> (not res!39202) (not e!30839))))

(assert (=> b!46376 (= res!39202 (bvsle (bitIndex!0 (size!1032 (buf!1381 thiss!1379)) (currentByte!2880 thiss!1379) (currentBit!2875 thiss!1379)) (bitIndex!0 (size!1032 (buf!1381 (_2!2341 lt!71211))) (currentByte!2880 (_2!2341 lt!71211)) (currentBit!2875 (_2!2341 lt!71211)))))))

(declare-fun b!46377 () Bool)

(declare-fun e!30840 () Bool)

(assert (=> b!46377 (= e!30839 e!30840)))

(declare-fun res!39201 () Bool)

(assert (=> b!46377 (=> res!39201 e!30840)))

(assert (=> b!46377 (= res!39201 (= (size!1032 (buf!1381 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!46378 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2288 array!2288 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!46378 (= e!30840 (arrayBitRangesEq!0 (buf!1381 thiss!1379) (buf!1381 (_2!2341 lt!71211)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1032 (buf!1381 thiss!1379)) (currentByte!2880 thiss!1379) (currentBit!2875 thiss!1379))))))

(assert (= (and d!13476 res!39203) b!46376))

(assert (= (and b!46376 res!39202) b!46377))

(assert (= (and b!46377 (not res!39201)) b!46378))

(assert (=> b!46376 m!70823))

(assert (=> b!46376 m!70833))

(assert (=> b!46378 m!70823))

(assert (=> b!46378 m!70823))

(declare-fun m!70961 () Bool)

(assert (=> b!46378 m!70961))

(assert (=> b!46277 d!13476))

(declare-fun d!13482 () Bool)

(assert (=> d!13482 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1032 (buf!1381 (_2!2341 lt!71211)))) ((_ sign_extend 32) (currentByte!2880 (_2!2341 lt!71211))) ((_ sign_extend 32) (currentBit!2875 (_2!2341 lt!71211))) lt!71227) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1032 (buf!1381 (_2!2341 lt!71211)))) ((_ sign_extend 32) (currentByte!2880 (_2!2341 lt!71211))) ((_ sign_extend 32) (currentBit!2875 (_2!2341 lt!71211)))) lt!71227))))

(declare-fun bs!3559 () Bool)

(assert (= bs!3559 d!13482))

(assert (=> bs!3559 m!70955))

(assert (=> b!46277 d!13482))

(declare-fun d!13486 () Bool)

(declare-fun e!30847 () Bool)

(assert (=> d!13486 e!30847))

(declare-fun res!39212 () Bool)

(assert (=> d!13486 (=> (not res!39212) (not e!30847))))

(assert (=> d!13486 (= res!39212 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!71398 () Unit!3277)

(declare-fun choose!27 (BitStream!1802 BitStream!1802 (_ BitVec 64) (_ BitVec 64)) Unit!3277)

(assert (=> d!13486 (= lt!71398 (choose!27 thiss!1379 (_2!2341 lt!71211) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!13486 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!13486 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2341 lt!71211) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!71398)))

(declare-fun b!46387 () Bool)

(assert (=> b!46387 (= e!30847 (validate_offset_bits!1 ((_ sign_extend 32) (size!1032 (buf!1381 (_2!2341 lt!71211)))) ((_ sign_extend 32) (currentByte!2880 (_2!2341 lt!71211))) ((_ sign_extend 32) (currentBit!2875 (_2!2341 lt!71211))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!13486 res!39212) b!46387))

(declare-fun m!70965 () Bool)

(assert (=> d!13486 m!70965))

(declare-fun m!70967 () Bool)

(assert (=> b!46387 m!70967))

(assert (=> b!46277 d!13486))

(declare-fun b!46411 () Bool)

(declare-fun e!30864 () Bool)

(declare-datatypes ((tuple2!4512 0))(
  ( (tuple2!4513 (_1!2349 BitStream!1802) (_2!2349 Bool)) )
))
(declare-fun lt!71426 () tuple2!4512)

(declare-fun lt!71432 () tuple2!4496)

(assert (=> b!46411 (= e!30864 (= (bitIndex!0 (size!1032 (buf!1381 (_1!2349 lt!71426))) (currentByte!2880 (_1!2349 lt!71426)) (currentBit!2875 (_1!2349 lt!71426))) (bitIndex!0 (size!1032 (buf!1381 (_2!2341 lt!71432))) (currentByte!2880 (_2!2341 lt!71432)) (currentBit!2875 (_2!2341 lt!71432)))))))

(declare-fun b!46412 () Bool)

(declare-fun e!30862 () Bool)

(declare-fun e!30863 () Bool)

(assert (=> b!46412 (= e!30862 e!30863)))

(declare-fun res!39241 () Bool)

(assert (=> b!46412 (=> (not res!39241) (not e!30863))))

(declare-fun lt!71433 () Bool)

(declare-fun lt!71429 () tuple2!4496)

(declare-fun lt!71430 () tuple2!4512)

(assert (=> b!46412 (= res!39241 (and (= (_2!2349 lt!71430) lt!71433) (= (_1!2349 lt!71430) (_2!2341 lt!71429))))))

(declare-fun readBitPure!0 (BitStream!1802) tuple2!4512)

(declare-fun readerFrom!0 (BitStream!1802 (_ BitVec 32) (_ BitVec 32)) BitStream!1802)

(assert (=> b!46412 (= lt!71430 (readBitPure!0 (readerFrom!0 (_2!2341 lt!71429) (currentBit!2875 thiss!1379) (currentByte!2880 thiss!1379))))))

(declare-fun b!46413 () Bool)

(assert (=> b!46413 (= e!30863 (= (bitIndex!0 (size!1032 (buf!1381 (_1!2349 lt!71430))) (currentByte!2880 (_1!2349 lt!71430)) (currentBit!2875 (_1!2349 lt!71430))) (bitIndex!0 (size!1032 (buf!1381 (_2!2341 lt!71429))) (currentByte!2880 (_2!2341 lt!71429)) (currentBit!2875 (_2!2341 lt!71429)))))))

(declare-fun b!46414 () Bool)

(declare-fun res!39235 () Bool)

(assert (=> b!46414 (=> (not res!39235) (not e!30862))))

(assert (=> b!46414 (= res!39235 (isPrefixOf!0 thiss!1379 (_2!2341 lt!71429)))))

(declare-fun b!46415 () Bool)

(declare-fun e!30861 () Bool)

(assert (=> b!46415 (= e!30861 e!30864)))

(declare-fun res!39242 () Bool)

(assert (=> b!46415 (=> (not res!39242) (not e!30864))))

(declare-fun lt!71427 () (_ BitVec 8))

(assert (=> b!46415 (= res!39242 (and (= (_2!2349 lt!71426) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1549 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!71427)) #b00000000000000000000000000000000))) (= (_1!2349 lt!71426) (_2!2341 lt!71432))))))

(declare-datatypes ((tuple2!4514 0))(
  ( (tuple2!4515 (_1!2350 array!2288) (_2!2350 BitStream!1802)) )
))
(declare-fun lt!71435 () tuple2!4514)

(declare-fun lt!71428 () BitStream!1802)

(declare-fun readBits!0 (BitStream!1802 (_ BitVec 64)) tuple2!4514)

(assert (=> b!46415 (= lt!71435 (readBits!0 lt!71428 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!46415 (= lt!71426 (readBitPure!0 lt!71428))))

(assert (=> b!46415 (= lt!71428 (readerFrom!0 (_2!2341 lt!71432) (currentBit!2875 thiss!1379) (currentByte!2880 thiss!1379)))))

(declare-fun b!46416 () Bool)

(declare-fun res!39238 () Bool)

(assert (=> b!46416 (=> (not res!39238) (not e!30861))))

(declare-fun lt!71434 () (_ BitVec 64))

(declare-fun lt!71437 () (_ BitVec 64))

(assert (=> b!46416 (= res!39238 (= (bitIndex!0 (size!1032 (buf!1381 (_2!2341 lt!71432))) (currentByte!2880 (_2!2341 lt!71432)) (currentBit!2875 (_2!2341 lt!71432))) (bvadd lt!71437 lt!71434)))))

(assert (=> b!46416 (or (not (= (bvand lt!71437 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!71434 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!71437 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!71437 lt!71434) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!46416 (= lt!71434 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!46416 (= lt!71437 (bitIndex!0 (size!1032 (buf!1381 thiss!1379)) (currentByte!2880 thiss!1379) (currentBit!2875 thiss!1379)))))

(declare-fun d!13488 () Bool)

(assert (=> d!13488 e!30861))

(declare-fun res!39240 () Bool)

(assert (=> d!13488 (=> (not res!39240) (not e!30861))))

(assert (=> d!13488 (= res!39240 (= (size!1032 (buf!1381 (_2!2341 lt!71432))) (size!1032 (buf!1381 thiss!1379))))))

(declare-fun lt!71431 () array!2288)

(assert (=> d!13488 (= lt!71427 (select (arr!1549 lt!71431) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!13488 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1032 lt!71431)))))

(assert (=> d!13488 (= lt!71431 (array!2289 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!71436 () tuple2!4496)

(assert (=> d!13488 (= lt!71432 (tuple2!4497 (_1!2341 lt!71436) (_2!2341 lt!71436)))))

(assert (=> d!13488 (= lt!71436 lt!71429)))

(assert (=> d!13488 e!30862))

(declare-fun res!39237 () Bool)

(assert (=> d!13488 (=> (not res!39237) (not e!30862))))

(assert (=> d!13488 (= res!39237 (= (size!1032 (buf!1381 thiss!1379)) (size!1032 (buf!1381 (_2!2341 lt!71429)))))))

(declare-fun appendBit!0 (BitStream!1802 Bool) tuple2!4496)

(assert (=> d!13488 (= lt!71429 (appendBit!0 thiss!1379 lt!71433))))

(assert (=> d!13488 (= lt!71433 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1549 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!13488 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!13488 (= (appendBitFromByte!0 thiss!1379 (select (arr!1549 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!71432)))

(declare-fun b!46417 () Bool)

(declare-fun res!39239 () Bool)

(assert (=> b!46417 (=> (not res!39239) (not e!30862))))

(assert (=> b!46417 (= res!39239 (= (bitIndex!0 (size!1032 (buf!1381 (_2!2341 lt!71429))) (currentByte!2880 (_2!2341 lt!71429)) (currentBit!2875 (_2!2341 lt!71429))) (bvadd (bitIndex!0 (size!1032 (buf!1381 thiss!1379)) (currentByte!2880 thiss!1379) (currentBit!2875 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!46418 () Bool)

(declare-fun res!39236 () Bool)

(assert (=> b!46418 (=> (not res!39236) (not e!30861))))

(assert (=> b!46418 (= res!39236 (isPrefixOf!0 thiss!1379 (_2!2341 lt!71432)))))

(assert (= (and d!13488 res!39237) b!46417))

(assert (= (and b!46417 res!39239) b!46414))

(assert (= (and b!46414 res!39235) b!46412))

(assert (= (and b!46412 res!39241) b!46413))

(assert (= (and d!13488 res!39240) b!46416))

(assert (= (and b!46416 res!39238) b!46418))

(assert (= (and b!46418 res!39236) b!46415))

(assert (= (and b!46415 res!39242) b!46411))

(declare-fun m!70977 () Bool)

(assert (=> b!46411 m!70977))

(declare-fun m!70979 () Bool)

(assert (=> b!46411 m!70979))

(declare-fun m!70981 () Bool)

(assert (=> b!46414 m!70981))

(assert (=> b!46416 m!70979))

(assert (=> b!46416 m!70823))

(declare-fun m!70983 () Bool)

(assert (=> d!13488 m!70983))

(declare-fun m!70985 () Bool)

(assert (=> d!13488 m!70985))

(declare-fun m!70987 () Bool)

(assert (=> d!13488 m!70987))

(declare-fun m!70989 () Bool)

(assert (=> b!46417 m!70989))

(assert (=> b!46417 m!70823))

(declare-fun m!70991 () Bool)

(assert (=> b!46415 m!70991))

(declare-fun m!70993 () Bool)

(assert (=> b!46415 m!70993))

(declare-fun m!70995 () Bool)

(assert (=> b!46415 m!70995))

(declare-fun m!70997 () Bool)

(assert (=> b!46412 m!70997))

(assert (=> b!46412 m!70997))

(declare-fun m!70999 () Bool)

(assert (=> b!46412 m!70999))

(declare-fun m!71001 () Bool)

(assert (=> b!46418 m!71001))

(declare-fun m!71003 () Bool)

(assert (=> b!46413 m!71003))

(assert (=> b!46413 m!70989))

(assert (=> b!46277 d!13488))

(declare-fun d!13496 () Bool)

(declare-fun e!30865 () Bool)

(assert (=> d!13496 e!30865))

(declare-fun res!39244 () Bool)

(assert (=> d!13496 (=> (not res!39244) (not e!30865))))

(declare-fun lt!71442 () (_ BitVec 64))

(declare-fun lt!71440 () (_ BitVec 64))

(declare-fun lt!71439 () (_ BitVec 64))

(assert (=> d!13496 (= res!39244 (= lt!71440 (bvsub lt!71442 lt!71439)))))

(assert (=> d!13496 (or (= (bvand lt!71442 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!71439 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!71442 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!71442 lt!71439) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!13496 (= lt!71439 (remainingBits!0 ((_ sign_extend 32) (size!1032 (buf!1381 (_2!2341 lt!71223)))) ((_ sign_extend 32) (currentByte!2880 (_2!2341 lt!71223))) ((_ sign_extend 32) (currentBit!2875 (_2!2341 lt!71223)))))))

(declare-fun lt!71443 () (_ BitVec 64))

(declare-fun lt!71441 () (_ BitVec 64))

(assert (=> d!13496 (= lt!71442 (bvmul lt!71443 lt!71441))))

(assert (=> d!13496 (or (= lt!71443 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!71441 (bvsdiv (bvmul lt!71443 lt!71441) lt!71443)))))

(assert (=> d!13496 (= lt!71441 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!13496 (= lt!71443 ((_ sign_extend 32) (size!1032 (buf!1381 (_2!2341 lt!71223)))))))

(assert (=> d!13496 (= lt!71440 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2880 (_2!2341 lt!71223))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2875 (_2!2341 lt!71223)))))))

(assert (=> d!13496 (invariant!0 (currentBit!2875 (_2!2341 lt!71223)) (currentByte!2880 (_2!2341 lt!71223)) (size!1032 (buf!1381 (_2!2341 lt!71223))))))

(assert (=> d!13496 (= (bitIndex!0 (size!1032 (buf!1381 (_2!2341 lt!71223))) (currentByte!2880 (_2!2341 lt!71223)) (currentBit!2875 (_2!2341 lt!71223))) lt!71440)))

(declare-fun b!46419 () Bool)

(declare-fun res!39243 () Bool)

(assert (=> b!46419 (=> (not res!39243) (not e!30865))))

(assert (=> b!46419 (= res!39243 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!71440))))

(declare-fun b!46420 () Bool)

(declare-fun lt!71438 () (_ BitVec 64))

(assert (=> b!46420 (= e!30865 (bvsle lt!71440 (bvmul lt!71438 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!46420 (or (= lt!71438 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!71438 #b0000000000000000000000000000000000000000000000000000000000001000) lt!71438)))))

(assert (=> b!46420 (= lt!71438 ((_ sign_extend 32) (size!1032 (buf!1381 (_2!2341 lt!71223)))))))

(assert (= (and d!13496 res!39244) b!46419))

(assert (= (and b!46419 res!39243) b!46420))

(declare-fun m!71005 () Bool)

(assert (=> d!13496 m!71005))

(assert (=> d!13496 m!70815))

(assert (=> b!46279 d!13496))

(declare-fun d!13498 () Bool)

(assert (=> d!13498 (= (tail!228 lt!71226) (t!1292 lt!71226))))

(assert (=> b!46280 d!13498))

(declare-fun d!13500 () Bool)

(declare-fun e!30868 () Bool)

(assert (=> d!13500 e!30868))

(declare-fun res!39247 () Bool)

(assert (=> d!13500 (=> (not res!39247) (not e!30868))))

(declare-fun lt!71449 () (_ BitVec 64))

(assert (=> d!13500 (= res!39247 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!71449 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!71449) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!13500 (= lt!71449 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!71448 () Unit!3277)

(declare-fun choose!42 (BitStream!1802 BitStream!1802 BitStream!1802 BitStream!1802 (_ BitVec 64) List!542) Unit!3277)

(assert (=> d!13500 (= lt!71448 (choose!42 (_2!2341 lt!71223) (_2!2341 lt!71223) (_1!2342 lt!71212) (_1!2342 lt!71225) (bvsub to!314 i!635) lt!71226))))

(assert (=> d!13500 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!13500 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2341 lt!71223) (_2!2341 lt!71223) (_1!2342 lt!71212) (_1!2342 lt!71225) (bvsub to!314 i!635) lt!71226) lt!71448)))

(declare-fun b!46423 () Bool)

(assert (=> b!46423 (= e!30868 (= (bitStreamReadBitsIntoList!0 (_2!2341 lt!71223) (_1!2342 lt!71225) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!228 lt!71226)))))

(assert (= (and d!13500 res!39247) b!46423))

(declare-fun m!71007 () Bool)

(assert (=> d!13500 m!71007))

(declare-fun m!71009 () Bool)

(assert (=> b!46423 m!71009))

(assert (=> b!46423 m!70851))

(assert (=> b!46280 d!13500))

(declare-fun d!13502 () Bool)

(assert (=> d!13502 (isPrefixOf!0 thiss!1379 (_2!2341 lt!71223))))

(declare-fun lt!71452 () Unit!3277)

(declare-fun choose!30 (BitStream!1802 BitStream!1802 BitStream!1802) Unit!3277)

(assert (=> d!13502 (= lt!71452 (choose!30 thiss!1379 (_2!2341 lt!71211) (_2!2341 lt!71223)))))

(assert (=> d!13502 (isPrefixOf!0 thiss!1379 (_2!2341 lt!71211))))

(assert (=> d!13502 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2341 lt!71211) (_2!2341 lt!71223)) lt!71452)))

(declare-fun bs!3561 () Bool)

(assert (= bs!3561 d!13502))

(assert (=> bs!3561 m!70863))

(declare-fun m!71011 () Bool)

(assert (=> bs!3561 m!71011))

(assert (=> bs!3561 m!70841))

(assert (=> b!46281 d!13502))

(declare-fun d!13504 () Bool)

(assert (=> d!13504 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1032 (buf!1381 (_2!2341 lt!71211)))) ((_ sign_extend 32) (currentByte!2880 thiss!1379)) ((_ sign_extend 32) (currentBit!2875 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1032 (buf!1381 (_2!2341 lt!71211)))) ((_ sign_extend 32) (currentByte!2880 thiss!1379)) ((_ sign_extend 32) (currentBit!2875 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!3562 () Bool)

(assert (= bs!3562 d!13504))

(declare-fun m!71013 () Bool)

(assert (=> bs!3562 m!71013))

(assert (=> b!46281 d!13504))

(declare-fun d!13506 () Bool)

(assert (=> d!13506 (validate_offset_bits!1 ((_ sign_extend 32) (size!1032 (buf!1381 (_2!2341 lt!71211)))) ((_ sign_extend 32) (currentByte!2880 thiss!1379)) ((_ sign_extend 32) (currentBit!2875 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!71455 () Unit!3277)

(declare-fun choose!9 (BitStream!1802 array!2288 (_ BitVec 64) BitStream!1802) Unit!3277)

(assert (=> d!13506 (= lt!71455 (choose!9 thiss!1379 (buf!1381 (_2!2341 lt!71211)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1803 (buf!1381 (_2!2341 lt!71211)) (currentByte!2880 thiss!1379) (currentBit!2875 thiss!1379))))))

(assert (=> d!13506 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1381 (_2!2341 lt!71211)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!71455)))

(declare-fun bs!3563 () Bool)

(assert (= bs!3563 d!13506))

(assert (=> bs!3563 m!70861))

(declare-fun m!71015 () Bool)

(assert (=> bs!3563 m!71015))

(assert (=> b!46281 d!13506))

(declare-fun d!13508 () Bool)

(declare-fun res!39250 () Bool)

(declare-fun e!30869 () Bool)

(assert (=> d!13508 (=> (not res!39250) (not e!30869))))

(assert (=> d!13508 (= res!39250 (= (size!1032 (buf!1381 (_2!2341 lt!71211))) (size!1032 (buf!1381 (_2!2341 lt!71223)))))))

(assert (=> d!13508 (= (isPrefixOf!0 (_2!2341 lt!71211) (_2!2341 lt!71223)) e!30869)))

(declare-fun b!46424 () Bool)

(declare-fun res!39249 () Bool)

(assert (=> b!46424 (=> (not res!39249) (not e!30869))))

(assert (=> b!46424 (= res!39249 (bvsle (bitIndex!0 (size!1032 (buf!1381 (_2!2341 lt!71211))) (currentByte!2880 (_2!2341 lt!71211)) (currentBit!2875 (_2!2341 lt!71211))) (bitIndex!0 (size!1032 (buf!1381 (_2!2341 lt!71223))) (currentByte!2880 (_2!2341 lt!71223)) (currentBit!2875 (_2!2341 lt!71223)))))))

(declare-fun b!46425 () Bool)

(declare-fun e!30870 () Bool)

(assert (=> b!46425 (= e!30869 e!30870)))

(declare-fun res!39248 () Bool)

(assert (=> b!46425 (=> res!39248 e!30870)))

(assert (=> b!46425 (= res!39248 (= (size!1032 (buf!1381 (_2!2341 lt!71211))) #b00000000000000000000000000000000))))

(declare-fun b!46426 () Bool)

(assert (=> b!46426 (= e!30870 (arrayBitRangesEq!0 (buf!1381 (_2!2341 lt!71211)) (buf!1381 (_2!2341 lt!71223)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1032 (buf!1381 (_2!2341 lt!71211))) (currentByte!2880 (_2!2341 lt!71211)) (currentBit!2875 (_2!2341 lt!71211)))))))

(assert (= (and d!13508 res!39250) b!46424))

(assert (= (and b!46424 res!39249) b!46425))

(assert (= (and b!46425 (not res!39248)) b!46426))

(assert (=> b!46424 m!70833))

(assert (=> b!46424 m!70809))

(assert (=> b!46426 m!70833))

(assert (=> b!46426 m!70833))

(declare-fun m!71017 () Bool)

(assert (=> b!46426 m!71017))

(assert (=> b!46281 d!13508))

(declare-fun b!46465 () Bool)

(declare-fun e!30890 () Unit!3277)

(declare-fun Unit!3297 () Unit!3277)

(assert (=> b!46465 (= e!30890 Unit!3297)))

(declare-fun b!46466 () Bool)

(declare-fun lt!71542 () Unit!3277)

(assert (=> b!46466 (= e!30890 lt!71542)))

(declare-fun lt!71543 () (_ BitVec 64))

(assert (=> b!46466 (= lt!71543 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!71533 () (_ BitVec 64))

(assert (=> b!46466 (= lt!71533 (bitIndex!0 (size!1032 (buf!1381 thiss!1379)) (currentByte!2880 thiss!1379) (currentBit!2875 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2288 array!2288 (_ BitVec 64) (_ BitVec 64)) Unit!3277)

(assert (=> b!46466 (= lt!71542 (arrayBitRangesEqSymmetric!0 (buf!1381 thiss!1379) (buf!1381 (_2!2341 lt!71211)) lt!71543 lt!71533))))

(assert (=> b!46466 (arrayBitRangesEq!0 (buf!1381 (_2!2341 lt!71211)) (buf!1381 thiss!1379) lt!71543 lt!71533)))

(declare-fun b!46467 () Bool)

(declare-fun res!39286 () Bool)

(declare-fun e!30889 () Bool)

(assert (=> b!46467 (=> (not res!39286) (not e!30889))))

(declare-fun lt!71532 () tuple2!4498)

(assert (=> b!46467 (= res!39286 (isPrefixOf!0 (_1!2342 lt!71532) thiss!1379))))

(declare-fun lt!71536 () (_ BitVec 64))

(declare-fun lt!71541 () (_ BitVec 64))

(declare-fun b!46468 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!1802 (_ BitVec 64)) BitStream!1802)

(assert (=> b!46468 (= e!30889 (= (_1!2342 lt!71532) (withMovedBitIndex!0 (_2!2342 lt!71532) (bvsub lt!71541 lt!71536))))))

(assert (=> b!46468 (or (= (bvand lt!71541 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!71536 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!71541 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!71541 lt!71536) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!46468 (= lt!71536 (bitIndex!0 (size!1032 (buf!1381 (_2!2341 lt!71211))) (currentByte!2880 (_2!2341 lt!71211)) (currentBit!2875 (_2!2341 lt!71211))))))

(assert (=> b!46468 (= lt!71541 (bitIndex!0 (size!1032 (buf!1381 thiss!1379)) (currentByte!2880 thiss!1379) (currentBit!2875 thiss!1379)))))

(declare-fun d!13510 () Bool)

(assert (=> d!13510 e!30889))

(declare-fun res!39285 () Bool)

(assert (=> d!13510 (=> (not res!39285) (not e!30889))))

(assert (=> d!13510 (= res!39285 (isPrefixOf!0 (_1!2342 lt!71532) (_2!2342 lt!71532)))))

(declare-fun lt!71544 () BitStream!1802)

(assert (=> d!13510 (= lt!71532 (tuple2!4499 lt!71544 (_2!2341 lt!71211)))))

(declare-fun lt!71540 () Unit!3277)

(declare-fun lt!71535 () Unit!3277)

(assert (=> d!13510 (= lt!71540 lt!71535)))

(assert (=> d!13510 (isPrefixOf!0 lt!71544 (_2!2341 lt!71211))))

(assert (=> d!13510 (= lt!71535 (lemmaIsPrefixTransitive!0 lt!71544 (_2!2341 lt!71211) (_2!2341 lt!71211)))))

(declare-fun lt!71549 () Unit!3277)

(declare-fun lt!71534 () Unit!3277)

(assert (=> d!13510 (= lt!71549 lt!71534)))

(assert (=> d!13510 (isPrefixOf!0 lt!71544 (_2!2341 lt!71211))))

(assert (=> d!13510 (= lt!71534 (lemmaIsPrefixTransitive!0 lt!71544 thiss!1379 (_2!2341 lt!71211)))))

(declare-fun lt!71547 () Unit!3277)

(assert (=> d!13510 (= lt!71547 e!30890)))

(declare-fun c!3117 () Bool)

(assert (=> d!13510 (= c!3117 (not (= (size!1032 (buf!1381 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!71546 () Unit!3277)

(declare-fun lt!71538 () Unit!3277)

(assert (=> d!13510 (= lt!71546 lt!71538)))

(assert (=> d!13510 (isPrefixOf!0 (_2!2341 lt!71211) (_2!2341 lt!71211))))

(assert (=> d!13510 (= lt!71538 (lemmaIsPrefixRefl!0 (_2!2341 lt!71211)))))

(declare-fun lt!71551 () Unit!3277)

(declare-fun lt!71548 () Unit!3277)

(assert (=> d!13510 (= lt!71551 lt!71548)))

(assert (=> d!13510 (= lt!71548 (lemmaIsPrefixRefl!0 (_2!2341 lt!71211)))))

(declare-fun lt!71545 () Unit!3277)

(declare-fun lt!71537 () Unit!3277)

(assert (=> d!13510 (= lt!71545 lt!71537)))

(assert (=> d!13510 (isPrefixOf!0 lt!71544 lt!71544)))

(assert (=> d!13510 (= lt!71537 (lemmaIsPrefixRefl!0 lt!71544))))

(declare-fun lt!71550 () Unit!3277)

(declare-fun lt!71539 () Unit!3277)

(assert (=> d!13510 (= lt!71550 lt!71539)))

(assert (=> d!13510 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!13510 (= lt!71539 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!13510 (= lt!71544 (BitStream!1803 (buf!1381 (_2!2341 lt!71211)) (currentByte!2880 thiss!1379) (currentBit!2875 thiss!1379)))))

(assert (=> d!13510 (isPrefixOf!0 thiss!1379 (_2!2341 lt!71211))))

(assert (=> d!13510 (= (reader!0 thiss!1379 (_2!2341 lt!71211)) lt!71532)))

(declare-fun b!46469 () Bool)

(declare-fun res!39284 () Bool)

(assert (=> b!46469 (=> (not res!39284) (not e!30889))))

(assert (=> b!46469 (= res!39284 (isPrefixOf!0 (_2!2342 lt!71532) (_2!2341 lt!71211)))))

(assert (= (and d!13510 c!3117) b!46466))

(assert (= (and d!13510 (not c!3117)) b!46465))

(assert (= (and d!13510 res!39285) b!46467))

(assert (= (and b!46467 res!39286) b!46469))

(assert (= (and b!46469 res!39284) b!46468))

(assert (=> b!46466 m!70823))

(declare-fun m!71051 () Bool)

(assert (=> b!46466 m!71051))

(declare-fun m!71053 () Bool)

(assert (=> b!46466 m!71053))

(declare-fun m!71055 () Bool)

(assert (=> b!46468 m!71055))

(assert (=> b!46468 m!70833))

(assert (=> b!46468 m!70823))

(assert (=> d!13510 m!70841))

(assert (=> d!13510 m!70821))

(declare-fun m!71057 () Bool)

(assert (=> d!13510 m!71057))

(declare-fun m!71059 () Bool)

(assert (=> d!13510 m!71059))

(declare-fun m!71061 () Bool)

(assert (=> d!13510 m!71061))

(declare-fun m!71063 () Bool)

(assert (=> d!13510 m!71063))

(assert (=> d!13510 m!70819))

(declare-fun m!71065 () Bool)

(assert (=> d!13510 m!71065))

(declare-fun m!71067 () Bool)

(assert (=> d!13510 m!71067))

(declare-fun m!71069 () Bool)

(assert (=> d!13510 m!71069))

(declare-fun m!71071 () Bool)

(assert (=> d!13510 m!71071))

(declare-fun m!71073 () Bool)

(assert (=> b!46467 m!71073))

(declare-fun m!71075 () Bool)

(assert (=> b!46469 m!71075))

(assert (=> b!46281 d!13510))

(declare-fun b!46590 () Bool)

(declare-fun e!30944 () tuple2!4496)

(declare-fun lt!72039 () tuple2!4496)

(declare-fun Unit!3298 () Unit!3277)

(assert (=> b!46590 (= e!30944 (tuple2!4497 Unit!3298 (_2!2341 lt!72039)))))

(declare-fun lt!72071 () tuple2!4496)

(assert (=> b!46590 (= lt!72071 (appendBitFromByte!0 (_2!2341 lt!71211) (select (arr!1549 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!72064 () (_ BitVec 64))

(assert (=> b!46590 (= lt!72064 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!72072 () (_ BitVec 64))

(assert (=> b!46590 (= lt!72072 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!72047 () Unit!3277)

(assert (=> b!46590 (= lt!72047 (validateOffsetBitsIneqLemma!0 (_2!2341 lt!71211) (_2!2341 lt!72071) lt!72064 lt!72072))))

(assert (=> b!46590 (validate_offset_bits!1 ((_ sign_extend 32) (size!1032 (buf!1381 (_2!2341 lt!72071)))) ((_ sign_extend 32) (currentByte!2880 (_2!2341 lt!72071))) ((_ sign_extend 32) (currentBit!2875 (_2!2341 lt!72071))) (bvsub lt!72064 lt!72072))))

(declare-fun lt!72067 () Unit!3277)

(assert (=> b!46590 (= lt!72067 lt!72047)))

(declare-fun lt!72079 () tuple2!4498)

(declare-fun call!562 () tuple2!4498)

(assert (=> b!46590 (= lt!72079 call!562)))

(declare-fun lt!72058 () (_ BitVec 64))

(assert (=> b!46590 (= lt!72058 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!72050 () Unit!3277)

(assert (=> b!46590 (= lt!72050 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2341 lt!71211) (buf!1381 (_2!2341 lt!72071)) lt!72058))))

(assert (=> b!46590 (validate_offset_bits!1 ((_ sign_extend 32) (size!1032 (buf!1381 (_2!2341 lt!72071)))) ((_ sign_extend 32) (currentByte!2880 (_2!2341 lt!71211))) ((_ sign_extend 32) (currentBit!2875 (_2!2341 lt!71211))) lt!72058)))

(declare-fun lt!72040 () Unit!3277)

(assert (=> b!46590 (= lt!72040 lt!72050)))

(assert (=> b!46590 (= (head!361 (byteArrayBitContentToList!0 (_2!2341 lt!72071) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!361 (bitStreamReadBitsIntoList!0 (_2!2341 lt!72071) (_1!2342 lt!72079) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!72068 () Unit!3277)

(declare-fun Unit!3299 () Unit!3277)

(assert (=> b!46590 (= lt!72068 Unit!3299)))

(assert (=> b!46590 (= lt!72039 (appendBitsMSBFirstLoop!0 (_2!2341 lt!72071) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!72044 () Unit!3277)

(assert (=> b!46590 (= lt!72044 (lemmaIsPrefixTransitive!0 (_2!2341 lt!71211) (_2!2341 lt!72071) (_2!2341 lt!72039)))))

(assert (=> b!46590 (isPrefixOf!0 (_2!2341 lt!71211) (_2!2341 lt!72039))))

(declare-fun lt!72048 () Unit!3277)

(assert (=> b!46590 (= lt!72048 lt!72044)))

(assert (=> b!46590 (= (size!1032 (buf!1381 (_2!2341 lt!72039))) (size!1032 (buf!1381 (_2!2341 lt!71211))))))

(declare-fun lt!72045 () Unit!3277)

(declare-fun Unit!3300 () Unit!3277)

(assert (=> b!46590 (= lt!72045 Unit!3300)))

(assert (=> b!46590 (= (bitIndex!0 (size!1032 (buf!1381 (_2!2341 lt!72039))) (currentByte!2880 (_2!2341 lt!72039)) (currentBit!2875 (_2!2341 lt!72039))) (bvsub (bvadd (bitIndex!0 (size!1032 (buf!1381 (_2!2341 lt!71211))) (currentByte!2880 (_2!2341 lt!71211)) (currentBit!2875 (_2!2341 lt!71211))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!72059 () Unit!3277)

(declare-fun Unit!3301 () Unit!3277)

(assert (=> b!46590 (= lt!72059 Unit!3301)))

(assert (=> b!46590 (= (bitIndex!0 (size!1032 (buf!1381 (_2!2341 lt!72039))) (currentByte!2880 (_2!2341 lt!72039)) (currentBit!2875 (_2!2341 lt!72039))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1032 (buf!1381 (_2!2341 lt!72071))) (currentByte!2880 (_2!2341 lt!72071)) (currentBit!2875 (_2!2341 lt!72071))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!72041 () Unit!3277)

(declare-fun Unit!3302 () Unit!3277)

(assert (=> b!46590 (= lt!72041 Unit!3302)))

(declare-fun lt!72042 () tuple2!4498)

(assert (=> b!46590 (= lt!72042 (reader!0 (_2!2341 lt!71211) (_2!2341 lt!72039)))))

(declare-fun lt!72069 () (_ BitVec 64))

(assert (=> b!46590 (= lt!72069 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!72076 () Unit!3277)

(assert (=> b!46590 (= lt!72076 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2341 lt!71211) (buf!1381 (_2!2341 lt!72039)) lt!72069))))

(assert (=> b!46590 (validate_offset_bits!1 ((_ sign_extend 32) (size!1032 (buf!1381 (_2!2341 lt!72039)))) ((_ sign_extend 32) (currentByte!2880 (_2!2341 lt!71211))) ((_ sign_extend 32) (currentBit!2875 (_2!2341 lt!71211))) lt!72069)))

(declare-fun lt!72074 () Unit!3277)

(assert (=> b!46590 (= lt!72074 lt!72076)))

(declare-fun lt!72054 () tuple2!4498)

(assert (=> b!46590 (= lt!72054 (reader!0 (_2!2341 lt!72071) (_2!2341 lt!72039)))))

(declare-fun lt!72055 () (_ BitVec 64))

(assert (=> b!46590 (= lt!72055 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!72060 () Unit!3277)

(assert (=> b!46590 (= lt!72060 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2341 lt!72071) (buf!1381 (_2!2341 lt!72039)) lt!72055))))

(assert (=> b!46590 (validate_offset_bits!1 ((_ sign_extend 32) (size!1032 (buf!1381 (_2!2341 lt!72039)))) ((_ sign_extend 32) (currentByte!2880 (_2!2341 lt!72071))) ((_ sign_extend 32) (currentBit!2875 (_2!2341 lt!72071))) lt!72055)))

(declare-fun lt!72081 () Unit!3277)

(assert (=> b!46590 (= lt!72081 lt!72060)))

(declare-fun lt!72061 () List!542)

(assert (=> b!46590 (= lt!72061 (byteArrayBitContentToList!0 (_2!2341 lt!72039) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!72046 () List!542)

(assert (=> b!46590 (= lt!72046 (byteArrayBitContentToList!0 (_2!2341 lt!72039) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!72078 () List!542)

(assert (=> b!46590 (= lt!72078 (bitStreamReadBitsIntoList!0 (_2!2341 lt!72039) (_1!2342 lt!72042) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!72062 () List!542)

(assert (=> b!46590 (= lt!72062 (bitStreamReadBitsIntoList!0 (_2!2341 lt!72039) (_1!2342 lt!72054) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!72049 () (_ BitVec 64))

(assert (=> b!46590 (= lt!72049 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!72073 () Unit!3277)

(assert (=> b!46590 (= lt!72073 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2341 lt!72039) (_2!2341 lt!72039) (_1!2342 lt!72042) (_1!2342 lt!72054) lt!72049 lt!72078))))

(assert (=> b!46590 (= (bitStreamReadBitsIntoList!0 (_2!2341 lt!72039) (_1!2342 lt!72054) (bvsub lt!72049 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!228 lt!72078))))

(declare-fun lt!72043 () Unit!3277)

(assert (=> b!46590 (= lt!72043 lt!72073)))

(declare-fun lt!72070 () Unit!3277)

(declare-fun lt!72056 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2288 array!2288 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3277)

(assert (=> b!46590 (= lt!72070 (arrayBitRangesEqImpliesEq!0 (buf!1381 (_2!2341 lt!72071)) (buf!1381 (_2!2341 lt!72039)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!72056 (bitIndex!0 (size!1032 (buf!1381 (_2!2341 lt!72071))) (currentByte!2880 (_2!2341 lt!72071)) (currentBit!2875 (_2!2341 lt!72071)))))))

(assert (=> b!46590 (= (bitAt!0 (buf!1381 (_2!2341 lt!72071)) lt!72056) (bitAt!0 (buf!1381 (_2!2341 lt!72039)) lt!72056))))

(declare-fun lt!72066 () Unit!3277)

(assert (=> b!46590 (= lt!72066 lt!72070)))

(declare-fun b!46591 () Bool)

(declare-fun res!39359 () Bool)

(declare-fun e!30943 () Bool)

(assert (=> b!46591 (=> (not res!39359) (not e!30943))))

(declare-fun lt!72052 () tuple2!4496)

(assert (=> b!46591 (= res!39359 (= (size!1032 (buf!1381 (_2!2341 lt!71211))) (size!1032 (buf!1381 (_2!2341 lt!72052)))))))

(declare-fun b!46592 () Bool)

(declare-fun res!39360 () Bool)

(assert (=> b!46592 (=> (not res!39360) (not e!30943))))

(assert (=> b!46592 (= res!39360 (= (size!1032 (buf!1381 (_2!2341 lt!72052))) (size!1032 (buf!1381 (_2!2341 lt!71211)))))))

(declare-fun d!13522 () Bool)

(assert (=> d!13522 e!30943))

(declare-fun res!39358 () Bool)

(assert (=> d!13522 (=> (not res!39358) (not e!30943))))

(declare-fun lt!72051 () (_ BitVec 64))

(assert (=> d!13522 (= res!39358 (= (bitIndex!0 (size!1032 (buf!1381 (_2!2341 lt!72052))) (currentByte!2880 (_2!2341 lt!72052)) (currentBit!2875 (_2!2341 lt!72052))) (bvsub lt!72051 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!13522 (or (= (bvand lt!72051 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!72051 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!72051 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!72075 () (_ BitVec 64))

(assert (=> d!13522 (= lt!72051 (bvadd lt!72075 to!314))))

(assert (=> d!13522 (or (not (= (bvand lt!72075 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!72075 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!72075 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!13522 (= lt!72075 (bitIndex!0 (size!1032 (buf!1381 (_2!2341 lt!71211))) (currentByte!2880 (_2!2341 lt!71211)) (currentBit!2875 (_2!2341 lt!71211))))))

(assert (=> d!13522 (= lt!72052 e!30944)))

(declare-fun c!3144 () Bool)

(assert (=> d!13522 (= c!3144 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!72065 () Unit!3277)

(declare-fun lt!72057 () Unit!3277)

(assert (=> d!13522 (= lt!72065 lt!72057)))

(assert (=> d!13522 (isPrefixOf!0 (_2!2341 lt!71211) (_2!2341 lt!71211))))

(assert (=> d!13522 (= lt!72057 (lemmaIsPrefixRefl!0 (_2!2341 lt!71211)))))

(assert (=> d!13522 (= lt!72056 (bitIndex!0 (size!1032 (buf!1381 (_2!2341 lt!71211))) (currentByte!2880 (_2!2341 lt!71211)) (currentBit!2875 (_2!2341 lt!71211))))))

(assert (=> d!13522 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!13522 (= (appendBitsMSBFirstLoop!0 (_2!2341 lt!71211) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!72052)))

(declare-fun b!46593 () Bool)

(declare-fun res!39356 () Bool)

(assert (=> b!46593 (=> (not res!39356) (not e!30943))))

(assert (=> b!46593 (= res!39356 (invariant!0 (currentBit!2875 (_2!2341 lt!72052)) (currentByte!2880 (_2!2341 lt!72052)) (size!1032 (buf!1381 (_2!2341 lt!72052)))))))

(declare-fun b!46594 () Bool)

(declare-fun res!39357 () Bool)

(assert (=> b!46594 (=> (not res!39357) (not e!30943))))

(assert (=> b!46594 (= res!39357 (isPrefixOf!0 (_2!2341 lt!71211) (_2!2341 lt!72052)))))

(declare-fun b!46595 () Bool)

(declare-fun Unit!3304 () Unit!3277)

(assert (=> b!46595 (= e!30944 (tuple2!4497 Unit!3304 (_2!2341 lt!71211)))))

(assert (=> b!46595 (= (size!1032 (buf!1381 (_2!2341 lt!71211))) (size!1032 (buf!1381 (_2!2341 lt!71211))))))

(declare-fun lt!72080 () Unit!3277)

(declare-fun Unit!3305 () Unit!3277)

(assert (=> b!46595 (= lt!72080 Unit!3305)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1802 array!2288 array!2288 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!46595 (checkByteArrayBitContent!0 (_2!2341 lt!71211) srcBuffer!2 (_1!2350 (readBits!0 (_1!2342 call!562) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!46596 () Bool)

(declare-fun e!30942 () Bool)

(declare-fun lt!72063 () (_ BitVec 64))

(assert (=> b!46596 (= e!30942 (validate_offset_bits!1 ((_ sign_extend 32) (size!1032 (buf!1381 (_2!2341 lt!71211)))) ((_ sign_extend 32) (currentByte!2880 (_2!2341 lt!71211))) ((_ sign_extend 32) (currentBit!2875 (_2!2341 lt!71211))) lt!72063))))

(declare-fun b!46597 () Bool)

(declare-fun lt!72038 () tuple2!4498)

(assert (=> b!46597 (= e!30943 (= (bitStreamReadBitsIntoList!0 (_2!2341 lt!72052) (_1!2342 lt!72038) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2341 lt!72052) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!46597 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!46597 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!72077 () Unit!3277)

(declare-fun lt!72053 () Unit!3277)

(assert (=> b!46597 (= lt!72077 lt!72053)))

(assert (=> b!46597 (validate_offset_bits!1 ((_ sign_extend 32) (size!1032 (buf!1381 (_2!2341 lt!72052)))) ((_ sign_extend 32) (currentByte!2880 (_2!2341 lt!71211))) ((_ sign_extend 32) (currentBit!2875 (_2!2341 lt!71211))) lt!72063)))

(assert (=> b!46597 (= lt!72053 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2341 lt!71211) (buf!1381 (_2!2341 lt!72052)) lt!72063))))

(assert (=> b!46597 e!30942))

(declare-fun res!39355 () Bool)

(assert (=> b!46597 (=> (not res!39355) (not e!30942))))

(assert (=> b!46597 (= res!39355 (and (= (size!1032 (buf!1381 (_2!2341 lt!71211))) (size!1032 (buf!1381 (_2!2341 lt!72052)))) (bvsge lt!72063 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!46597 (= lt!72063 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!46597 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!46597 (= lt!72038 (reader!0 (_2!2341 lt!71211) (_2!2341 lt!72052)))))

(declare-fun bm!559 () Bool)

(assert (=> bm!559 (= call!562 (reader!0 (_2!2341 lt!71211) (ite c!3144 (_2!2341 lt!72071) (_2!2341 lt!71211))))))

(assert (= (and d!13522 c!3144) b!46590))

(assert (= (and d!13522 (not c!3144)) b!46595))

(assert (= (or b!46590 b!46595) bm!559))

(assert (= (and d!13522 res!39358) b!46593))

(assert (= (and b!46593 res!39356) b!46591))

(assert (= (and b!46591 res!39359) b!46594))

(assert (= (and b!46594 res!39357) b!46592))

(assert (= (and b!46592 res!39360) b!46597))

(assert (= (and b!46597 res!39355) b!46596))

(declare-fun m!71377 () Bool)

(assert (=> b!46595 m!71377))

(declare-fun m!71379 () Bool)

(assert (=> b!46595 m!71379))

(declare-fun m!71381 () Bool)

(assert (=> b!46597 m!71381))

(declare-fun m!71383 () Bool)

(assert (=> b!46597 m!71383))

(declare-fun m!71385 () Bool)

(assert (=> b!46597 m!71385))

(declare-fun m!71387 () Bool)

(assert (=> b!46597 m!71387))

(declare-fun m!71389 () Bool)

(assert (=> b!46597 m!71389))

(declare-fun m!71391 () Bool)

(assert (=> b!46590 m!71391))

(declare-fun m!71393 () Bool)

(assert (=> b!46590 m!71393))

(declare-fun m!71395 () Bool)

(assert (=> b!46590 m!71395))

(declare-fun m!71397 () Bool)

(assert (=> b!46590 m!71397))

(declare-fun m!71399 () Bool)

(assert (=> b!46590 m!71399))

(declare-fun m!71401 () Bool)

(assert (=> b!46590 m!71401))

(declare-fun m!71403 () Bool)

(assert (=> b!46590 m!71403))

(declare-fun m!71405 () Bool)

(assert (=> b!46590 m!71405))

(declare-fun m!71407 () Bool)

(assert (=> b!46590 m!71407))

(declare-fun m!71409 () Bool)

(assert (=> b!46590 m!71409))

(declare-fun m!71411 () Bool)

(assert (=> b!46590 m!71411))

(declare-fun m!71413 () Bool)

(assert (=> b!46590 m!71413))

(declare-fun m!71415 () Bool)

(assert (=> b!46590 m!71415))

(declare-fun m!71417 () Bool)

(assert (=> b!46590 m!71417))

(declare-fun m!71419 () Bool)

(assert (=> b!46590 m!71419))

(declare-fun m!71421 () Bool)

(assert (=> b!46590 m!71421))

(assert (=> b!46590 m!71397))

(assert (=> b!46590 m!71393))

(declare-fun m!71423 () Bool)

(assert (=> b!46590 m!71423))

(declare-fun m!71425 () Bool)

(assert (=> b!46590 m!71425))

(declare-fun m!71427 () Bool)

(assert (=> b!46590 m!71427))

(declare-fun m!71429 () Bool)

(assert (=> b!46590 m!71429))

(declare-fun m!71431 () Bool)

(assert (=> b!46590 m!71431))

(declare-fun m!71433 () Bool)

(assert (=> b!46590 m!71433))

(declare-fun m!71435 () Bool)

(assert (=> b!46590 m!71435))

(declare-fun m!71437 () Bool)

(assert (=> b!46590 m!71437))

(assert (=> b!46590 m!71411))

(declare-fun m!71439 () Bool)

(assert (=> b!46590 m!71439))

(declare-fun m!71441 () Bool)

(assert (=> b!46590 m!71441))

(assert (=> b!46590 m!71401))

(declare-fun m!71443 () Bool)

(assert (=> b!46590 m!71443))

(declare-fun m!71445 () Bool)

(assert (=> b!46590 m!71445))

(declare-fun m!71447 () Bool)

(assert (=> b!46590 m!71447))

(declare-fun m!71449 () Bool)

(assert (=> b!46590 m!71449))

(assert (=> b!46590 m!70833))

(declare-fun m!71451 () Bool)

(assert (=> b!46590 m!71451))

(declare-fun m!71453 () Bool)

(assert (=> d!13522 m!71453))

(assert (=> d!13522 m!70833))

(assert (=> d!13522 m!71065))

(assert (=> d!13522 m!71069))

(declare-fun m!71455 () Bool)

(assert (=> b!46594 m!71455))

(declare-fun m!71457 () Bool)

(assert (=> bm!559 m!71457))

(declare-fun m!71459 () Bool)

(assert (=> b!46593 m!71459))

(declare-fun m!71461 () Bool)

(assert (=> b!46596 m!71461))

(assert (=> b!46281 d!13522))

(declare-fun d!13586 () Bool)

(declare-fun res!39366 () Bool)

(declare-fun e!30949 () Bool)

(assert (=> d!13586 (=> (not res!39366) (not e!30949))))

(assert (=> d!13586 (= res!39366 (= (size!1032 (buf!1381 thiss!1379)) (size!1032 (buf!1381 (_2!2341 lt!71223)))))))

(assert (=> d!13586 (= (isPrefixOf!0 thiss!1379 (_2!2341 lt!71223)) e!30949)))

(declare-fun b!46605 () Bool)

(declare-fun res!39365 () Bool)

(assert (=> b!46605 (=> (not res!39365) (not e!30949))))

(assert (=> b!46605 (= res!39365 (bvsle (bitIndex!0 (size!1032 (buf!1381 thiss!1379)) (currentByte!2880 thiss!1379) (currentBit!2875 thiss!1379)) (bitIndex!0 (size!1032 (buf!1381 (_2!2341 lt!71223))) (currentByte!2880 (_2!2341 lt!71223)) (currentBit!2875 (_2!2341 lt!71223)))))))

(declare-fun b!46606 () Bool)

(declare-fun e!30950 () Bool)

(assert (=> b!46606 (= e!30949 e!30950)))

(declare-fun res!39364 () Bool)

(assert (=> b!46606 (=> res!39364 e!30950)))

(assert (=> b!46606 (= res!39364 (= (size!1032 (buf!1381 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!46607 () Bool)

(assert (=> b!46607 (= e!30950 (arrayBitRangesEq!0 (buf!1381 thiss!1379) (buf!1381 (_2!2341 lt!71223)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1032 (buf!1381 thiss!1379)) (currentByte!2880 thiss!1379) (currentBit!2875 thiss!1379))))))

(assert (= (and d!13586 res!39366) b!46605))

(assert (= (and b!46605 res!39365) b!46606))

(assert (= (and b!46606 (not res!39364)) b!46607))

(assert (=> b!46605 m!70823))

(assert (=> b!46605 m!70809))

(assert (=> b!46607 m!70823))

(assert (=> b!46607 m!70823))

(declare-fun m!71463 () Bool)

(assert (=> b!46607 m!71463))

(assert (=> b!46281 d!13586))

(declare-fun d!13588 () Bool)

(declare-fun size!1035 (List!542) Int)

(assert (=> d!13588 (= (length!237 lt!71226) (size!1035 lt!71226))))

(declare-fun bs!3576 () Bool)

(assert (= bs!3576 d!13588))

(declare-fun m!71465 () Bool)

(assert (=> bs!3576 m!71465))

(assert (=> b!46282 d!13588))

(declare-fun d!13590 () Bool)

(assert (=> d!13590 (= (invariant!0 (currentBit!2875 (_2!2341 lt!71211)) (currentByte!2880 (_2!2341 lt!71211)) (size!1032 (buf!1381 (_2!2341 lt!71223)))) (and (bvsge (currentBit!2875 (_2!2341 lt!71211)) #b00000000000000000000000000000000) (bvslt (currentBit!2875 (_2!2341 lt!71211)) #b00000000000000000000000000001000) (bvsge (currentByte!2880 (_2!2341 lt!71211)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2880 (_2!2341 lt!71211)) (size!1032 (buf!1381 (_2!2341 lt!71223)))) (and (= (currentBit!2875 (_2!2341 lt!71211)) #b00000000000000000000000000000000) (= (currentByte!2880 (_2!2341 lt!71211)) (size!1032 (buf!1381 (_2!2341 lt!71223))))))))))

(assert (=> b!46272 d!13590))

(declare-fun d!13596 () Bool)

(assert (=> d!13596 (= (array_inv!954 (buf!1381 thiss!1379)) (bvsge (size!1032 (buf!1381 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!46284 d!13596))

(declare-fun d!13598 () Bool)

(assert (=> d!13598 (= (bitAt!0 (buf!1381 (_1!2342 lt!71212)) lt!71218) (not (= (bvand ((_ sign_extend 24) (select (arr!1549 (buf!1381 (_1!2342 lt!71212))) ((_ extract 31 0) (bvsdiv lt!71218 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!71218 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3577 () Bool)

(assert (= bs!3577 d!13598))

(declare-fun m!71469 () Bool)

(assert (=> bs!3577 m!71469))

(declare-fun m!71471 () Bool)

(assert (=> bs!3577 m!71471))

(assert (=> b!46273 d!13598))

(declare-fun d!13600 () Bool)

(assert (=> d!13600 (= (bitAt!0 (buf!1381 (_1!2342 lt!71225)) lt!71218) (not (= (bvand ((_ sign_extend 24) (select (arr!1549 (buf!1381 (_1!2342 lt!71225))) ((_ extract 31 0) (bvsdiv lt!71218 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!71218 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3578 () Bool)

(assert (= bs!3578 d!13600))

(declare-fun m!71473 () Bool)

(assert (=> bs!3578 m!71473))

(assert (=> bs!3578 m!71471))

(assert (=> b!46273 d!13600))

(declare-fun b!46610 () Bool)

(declare-fun e!30953 () Unit!3277)

(declare-fun Unit!3307 () Unit!3277)

(assert (=> b!46610 (= e!30953 Unit!3307)))

(declare-fun b!46611 () Bool)

(declare-fun lt!72093 () Unit!3277)

(assert (=> b!46611 (= e!30953 lt!72093)))

(declare-fun lt!72094 () (_ BitVec 64))

(assert (=> b!46611 (= lt!72094 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72084 () (_ BitVec 64))

(assert (=> b!46611 (= lt!72084 (bitIndex!0 (size!1032 (buf!1381 (_2!2341 lt!71211))) (currentByte!2880 (_2!2341 lt!71211)) (currentBit!2875 (_2!2341 lt!71211))))))

(assert (=> b!46611 (= lt!72093 (arrayBitRangesEqSymmetric!0 (buf!1381 (_2!2341 lt!71211)) (buf!1381 (_2!2341 lt!71223)) lt!72094 lt!72084))))

(assert (=> b!46611 (arrayBitRangesEq!0 (buf!1381 (_2!2341 lt!71223)) (buf!1381 (_2!2341 lt!71211)) lt!72094 lt!72084)))

(declare-fun b!46612 () Bool)

(declare-fun res!39369 () Bool)

(declare-fun e!30952 () Bool)

(assert (=> b!46612 (=> (not res!39369) (not e!30952))))

(declare-fun lt!72083 () tuple2!4498)

(assert (=> b!46612 (= res!39369 (isPrefixOf!0 (_1!2342 lt!72083) (_2!2341 lt!71211)))))

(declare-fun lt!72092 () (_ BitVec 64))

(declare-fun lt!72087 () (_ BitVec 64))

(declare-fun b!46613 () Bool)

(assert (=> b!46613 (= e!30952 (= (_1!2342 lt!72083) (withMovedBitIndex!0 (_2!2342 lt!72083) (bvsub lt!72092 lt!72087))))))

(assert (=> b!46613 (or (= (bvand lt!72092 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!72087 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!72092 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!72092 lt!72087) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!46613 (= lt!72087 (bitIndex!0 (size!1032 (buf!1381 (_2!2341 lt!71223))) (currentByte!2880 (_2!2341 lt!71223)) (currentBit!2875 (_2!2341 lt!71223))))))

(assert (=> b!46613 (= lt!72092 (bitIndex!0 (size!1032 (buf!1381 (_2!2341 lt!71211))) (currentByte!2880 (_2!2341 lt!71211)) (currentBit!2875 (_2!2341 lt!71211))))))

(declare-fun d!13602 () Bool)

(assert (=> d!13602 e!30952))

(declare-fun res!39368 () Bool)

(assert (=> d!13602 (=> (not res!39368) (not e!30952))))

(assert (=> d!13602 (= res!39368 (isPrefixOf!0 (_1!2342 lt!72083) (_2!2342 lt!72083)))))

(declare-fun lt!72095 () BitStream!1802)

(assert (=> d!13602 (= lt!72083 (tuple2!4499 lt!72095 (_2!2341 lt!71223)))))

(declare-fun lt!72091 () Unit!3277)

(declare-fun lt!72086 () Unit!3277)

(assert (=> d!13602 (= lt!72091 lt!72086)))

(assert (=> d!13602 (isPrefixOf!0 lt!72095 (_2!2341 lt!71223))))

(assert (=> d!13602 (= lt!72086 (lemmaIsPrefixTransitive!0 lt!72095 (_2!2341 lt!71223) (_2!2341 lt!71223)))))

(declare-fun lt!72100 () Unit!3277)

(declare-fun lt!72085 () Unit!3277)

(assert (=> d!13602 (= lt!72100 lt!72085)))

(assert (=> d!13602 (isPrefixOf!0 lt!72095 (_2!2341 lt!71223))))

(assert (=> d!13602 (= lt!72085 (lemmaIsPrefixTransitive!0 lt!72095 (_2!2341 lt!71211) (_2!2341 lt!71223)))))

(declare-fun lt!72098 () Unit!3277)

(assert (=> d!13602 (= lt!72098 e!30953)))

(declare-fun c!3148 () Bool)

(assert (=> d!13602 (= c!3148 (not (= (size!1032 (buf!1381 (_2!2341 lt!71211))) #b00000000000000000000000000000000)))))

(declare-fun lt!72097 () Unit!3277)

(declare-fun lt!72089 () Unit!3277)

(assert (=> d!13602 (= lt!72097 lt!72089)))

(assert (=> d!13602 (isPrefixOf!0 (_2!2341 lt!71223) (_2!2341 lt!71223))))

(assert (=> d!13602 (= lt!72089 (lemmaIsPrefixRefl!0 (_2!2341 lt!71223)))))

(declare-fun lt!72102 () Unit!3277)

(declare-fun lt!72099 () Unit!3277)

(assert (=> d!13602 (= lt!72102 lt!72099)))

(assert (=> d!13602 (= lt!72099 (lemmaIsPrefixRefl!0 (_2!2341 lt!71223)))))

(declare-fun lt!72096 () Unit!3277)

(declare-fun lt!72088 () Unit!3277)

(assert (=> d!13602 (= lt!72096 lt!72088)))

(assert (=> d!13602 (isPrefixOf!0 lt!72095 lt!72095)))

(assert (=> d!13602 (= lt!72088 (lemmaIsPrefixRefl!0 lt!72095))))

(declare-fun lt!72101 () Unit!3277)

(declare-fun lt!72090 () Unit!3277)

(assert (=> d!13602 (= lt!72101 lt!72090)))

(assert (=> d!13602 (isPrefixOf!0 (_2!2341 lt!71211) (_2!2341 lt!71211))))

(assert (=> d!13602 (= lt!72090 (lemmaIsPrefixRefl!0 (_2!2341 lt!71211)))))

(assert (=> d!13602 (= lt!72095 (BitStream!1803 (buf!1381 (_2!2341 lt!71223)) (currentByte!2880 (_2!2341 lt!71211)) (currentBit!2875 (_2!2341 lt!71211))))))

(assert (=> d!13602 (isPrefixOf!0 (_2!2341 lt!71211) (_2!2341 lt!71223))))

(assert (=> d!13602 (= (reader!0 (_2!2341 lt!71211) (_2!2341 lt!71223)) lt!72083)))

(declare-fun b!46614 () Bool)

(declare-fun res!39367 () Bool)

(assert (=> b!46614 (=> (not res!39367) (not e!30952))))

(assert (=> b!46614 (= res!39367 (isPrefixOf!0 (_2!2342 lt!72083) (_2!2341 lt!71223)))))

(assert (= (and d!13602 c!3148) b!46611))

(assert (= (and d!13602 (not c!3148)) b!46610))

(assert (= (and d!13602 res!39368) b!46612))

(assert (= (and b!46612 res!39369) b!46614))

(assert (= (and b!46614 res!39367) b!46613))

(assert (=> b!46611 m!70833))

(declare-fun m!71475 () Bool)

(assert (=> b!46611 m!71475))

(declare-fun m!71477 () Bool)

(assert (=> b!46611 m!71477))

(declare-fun m!71479 () Bool)

(assert (=> b!46613 m!71479))

(assert (=> b!46613 m!70809))

(assert (=> b!46613 m!70833))

(assert (=> d!13602 m!70865))

(assert (=> d!13602 m!71069))

(declare-fun m!71481 () Bool)

(assert (=> d!13602 m!71481))

(declare-fun m!71483 () Bool)

(assert (=> d!13602 m!71483))

(declare-fun m!71485 () Bool)

(assert (=> d!13602 m!71485))

(declare-fun m!71487 () Bool)

(assert (=> d!13602 m!71487))

(assert (=> d!13602 m!71065))

(declare-fun m!71489 () Bool)

(assert (=> d!13602 m!71489))

(declare-fun m!71491 () Bool)

(assert (=> d!13602 m!71491))

(declare-fun m!71493 () Bool)

(assert (=> d!13602 m!71493))

(declare-fun m!71495 () Bool)

(assert (=> d!13602 m!71495))

(declare-fun m!71497 () Bool)

(assert (=> b!46612 m!71497))

(declare-fun m!71499 () Bool)

(assert (=> b!46614 m!71499))

(assert (=> b!46274 d!13602))

(declare-fun d!13604 () Bool)

(assert (=> d!13604 (validate_offset_bits!1 ((_ sign_extend 32) (size!1032 (buf!1381 (_2!2341 lt!71223)))) ((_ sign_extend 32) (currentByte!2880 thiss!1379)) ((_ sign_extend 32) (currentBit!2875 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!72105 () Unit!3277)

(assert (=> d!13604 (= lt!72105 (choose!9 thiss!1379 (buf!1381 (_2!2341 lt!71223)) (bvsub to!314 i!635) (BitStream!1803 (buf!1381 (_2!2341 lt!71223)) (currentByte!2880 thiss!1379) (currentBit!2875 thiss!1379))))))

(assert (=> d!13604 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1381 (_2!2341 lt!71223)) (bvsub to!314 i!635)) lt!72105)))

(declare-fun bs!3579 () Bool)

(assert (= bs!3579 d!13604))

(assert (=> bs!3579 m!70801))

(declare-fun m!71501 () Bool)

(assert (=> bs!3579 m!71501))

(assert (=> b!46274 d!13604))

(declare-fun d!13606 () Bool)

(assert (=> d!13606 (validate_offset_bits!1 ((_ sign_extend 32) (size!1032 (buf!1381 (_2!2341 lt!71223)))) ((_ sign_extend 32) (currentByte!2880 (_2!2341 lt!71211))) ((_ sign_extend 32) (currentBit!2875 (_2!2341 lt!71211))) lt!71227)))

(declare-fun lt!72110 () Unit!3277)

(assert (=> d!13606 (= lt!72110 (choose!9 (_2!2341 lt!71211) (buf!1381 (_2!2341 lt!71223)) lt!71227 (BitStream!1803 (buf!1381 (_2!2341 lt!71223)) (currentByte!2880 (_2!2341 lt!71211)) (currentBit!2875 (_2!2341 lt!71211)))))))

(assert (=> d!13606 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2341 lt!71211) (buf!1381 (_2!2341 lt!71223)) lt!71227) lt!72110)))

(declare-fun bs!3580 () Bool)

(assert (= bs!3580 d!13606))

(assert (=> bs!3580 m!70797))

(declare-fun m!71503 () Bool)

(assert (=> bs!3580 m!71503))

(assert (=> b!46274 d!13606))

(declare-fun d!13608 () Bool)

(assert (=> d!13608 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1032 (buf!1381 (_2!2341 lt!71223)))) ((_ sign_extend 32) (currentByte!2880 (_2!2341 lt!71211))) ((_ sign_extend 32) (currentBit!2875 (_2!2341 lt!71211))) lt!71227) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1032 (buf!1381 (_2!2341 lt!71223)))) ((_ sign_extend 32) (currentByte!2880 (_2!2341 lt!71211))) ((_ sign_extend 32) (currentBit!2875 (_2!2341 lt!71211)))) lt!71227))))

(declare-fun bs!3581 () Bool)

(assert (= bs!3581 d!13608))

(declare-fun m!71505 () Bool)

(assert (=> bs!3581 m!71505))

(assert (=> b!46274 d!13608))

(declare-fun lt!72141 () (_ BitVec 64))

(declare-datatypes ((tuple2!4520 0))(
  ( (tuple2!4521 (_1!2353 List!542) (_2!2353 BitStream!1802)) )
))
(declare-fun e!30972 () tuple2!4520)

(declare-datatypes ((tuple2!4522 0))(
  ( (tuple2!4523 (_1!2354 Bool) (_2!2354 BitStream!1802)) )
))
(declare-fun lt!72139 () tuple2!4522)

(declare-fun b!46649 () Bool)

(assert (=> b!46649 (= e!30972 (tuple2!4521 (Cons!538 (_1!2354 lt!72139) (bitStreamReadBitsIntoList!0 (_2!2341 lt!71223) (_2!2354 lt!72139) (bvsub (bvsub to!314 i!635) lt!72141))) (_2!2354 lt!72139)))))

(declare-fun readBit!0 (BitStream!1802) tuple2!4522)

(assert (=> b!46649 (= lt!72139 (readBit!0 (_1!2342 lt!71212)))))

(assert (=> b!46649 (= lt!72141 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!46650 () Bool)

(declare-fun e!30973 () Bool)

(declare-fun lt!72140 () List!542)

(declare-fun isEmpty!136 (List!542) Bool)

(assert (=> b!46650 (= e!30973 (isEmpty!136 lt!72140))))

(declare-fun b!46651 () Bool)

(assert (=> b!46651 (= e!30973 (> (length!237 lt!72140) 0))))

(declare-fun b!46648 () Bool)

(assert (=> b!46648 (= e!30972 (tuple2!4521 Nil!539 (_1!2342 lt!71212)))))

(declare-fun d!13610 () Bool)

(assert (=> d!13610 e!30973))

(declare-fun c!3163 () Bool)

(assert (=> d!13610 (= c!3163 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13610 (= lt!72140 (_1!2353 e!30972))))

(declare-fun c!3164 () Bool)

(assert (=> d!13610 (= c!3164 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13610 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!13610 (= (bitStreamReadBitsIntoList!0 (_2!2341 lt!71223) (_1!2342 lt!71212) (bvsub to!314 i!635)) lt!72140)))

(assert (= (and d!13610 c!3164) b!46648))

(assert (= (and d!13610 (not c!3164)) b!46649))

(assert (= (and d!13610 c!3163) b!46650))

(assert (= (and d!13610 (not c!3163)) b!46651))

(declare-fun m!71541 () Bool)

(assert (=> b!46649 m!71541))

(declare-fun m!71543 () Bool)

(assert (=> b!46649 m!71543))

(declare-fun m!71545 () Bool)

(assert (=> b!46650 m!71545))

(declare-fun m!71547 () Bool)

(assert (=> b!46651 m!71547))

(assert (=> b!46274 d!13610))

(declare-fun e!30974 () tuple2!4520)

(declare-fun lt!72143 () tuple2!4522)

(declare-fun lt!72145 () (_ BitVec 64))

(declare-fun b!46653 () Bool)

(assert (=> b!46653 (= e!30974 (tuple2!4521 (Cons!538 (_1!2354 lt!72143) (bitStreamReadBitsIntoList!0 (_2!2341 lt!71223) (_2!2354 lt!72143) (bvsub lt!71227 lt!72145))) (_2!2354 lt!72143)))))

(assert (=> b!46653 (= lt!72143 (readBit!0 (_1!2342 lt!71225)))))

(assert (=> b!46653 (= lt!72145 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!46654 () Bool)

(declare-fun e!30975 () Bool)

(declare-fun lt!72144 () List!542)

(assert (=> b!46654 (= e!30975 (isEmpty!136 lt!72144))))

(declare-fun b!46655 () Bool)

(assert (=> b!46655 (= e!30975 (> (length!237 lt!72144) 0))))

(declare-fun b!46652 () Bool)

(assert (=> b!46652 (= e!30974 (tuple2!4521 Nil!539 (_1!2342 lt!71225)))))

(declare-fun d!13630 () Bool)

(assert (=> d!13630 e!30975))

(declare-fun c!3165 () Bool)

(assert (=> d!13630 (= c!3165 (= lt!71227 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13630 (= lt!72144 (_1!2353 e!30974))))

(declare-fun c!3166 () Bool)

(assert (=> d!13630 (= c!3166 (= lt!71227 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13630 (bvsge lt!71227 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!13630 (= (bitStreamReadBitsIntoList!0 (_2!2341 lt!71223) (_1!2342 lt!71225) lt!71227) lt!72144)))

(assert (= (and d!13630 c!3166) b!46652))

(assert (= (and d!13630 (not c!3166)) b!46653))

(assert (= (and d!13630 c!3165) b!46654))

(assert (= (and d!13630 (not c!3165)) b!46655))

(declare-fun m!71551 () Bool)

(assert (=> b!46653 m!71551))

(declare-fun m!71553 () Bool)

(assert (=> b!46653 m!71553))

(declare-fun m!71555 () Bool)

(assert (=> b!46654 m!71555))

(declare-fun m!71557 () Bool)

(assert (=> b!46655 m!71557))

(assert (=> b!46274 d!13630))

(declare-fun b!46661 () Bool)

(declare-fun e!30979 () Unit!3277)

(declare-fun Unit!3308 () Unit!3277)

(assert (=> b!46661 (= e!30979 Unit!3308)))

(declare-fun b!46662 () Bool)

(declare-fun lt!72176 () Unit!3277)

(assert (=> b!46662 (= e!30979 lt!72176)))

(declare-fun lt!72177 () (_ BitVec 64))

(assert (=> b!46662 (= lt!72177 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72167 () (_ BitVec 64))

(assert (=> b!46662 (= lt!72167 (bitIndex!0 (size!1032 (buf!1381 thiss!1379)) (currentByte!2880 thiss!1379) (currentBit!2875 thiss!1379)))))

(assert (=> b!46662 (= lt!72176 (arrayBitRangesEqSymmetric!0 (buf!1381 thiss!1379) (buf!1381 (_2!2341 lt!71223)) lt!72177 lt!72167))))

(assert (=> b!46662 (arrayBitRangesEq!0 (buf!1381 (_2!2341 lt!71223)) (buf!1381 thiss!1379) lt!72177 lt!72167)))

(declare-fun b!46663 () Bool)

(declare-fun res!39380 () Bool)

(declare-fun e!30978 () Bool)

(assert (=> b!46663 (=> (not res!39380) (not e!30978))))

(declare-fun lt!72166 () tuple2!4498)

(assert (=> b!46663 (= res!39380 (isPrefixOf!0 (_1!2342 lt!72166) thiss!1379))))

(declare-fun b!46664 () Bool)

(declare-fun lt!72170 () (_ BitVec 64))

(declare-fun lt!72175 () (_ BitVec 64))

(assert (=> b!46664 (= e!30978 (= (_1!2342 lt!72166) (withMovedBitIndex!0 (_2!2342 lt!72166) (bvsub lt!72175 lt!72170))))))

(assert (=> b!46664 (or (= (bvand lt!72175 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!72170 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!72175 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!72175 lt!72170) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!46664 (= lt!72170 (bitIndex!0 (size!1032 (buf!1381 (_2!2341 lt!71223))) (currentByte!2880 (_2!2341 lt!71223)) (currentBit!2875 (_2!2341 lt!71223))))))

(assert (=> b!46664 (= lt!72175 (bitIndex!0 (size!1032 (buf!1381 thiss!1379)) (currentByte!2880 thiss!1379) (currentBit!2875 thiss!1379)))))

(declare-fun d!13634 () Bool)

(assert (=> d!13634 e!30978))

(declare-fun res!39379 () Bool)

(assert (=> d!13634 (=> (not res!39379) (not e!30978))))

(assert (=> d!13634 (= res!39379 (isPrefixOf!0 (_1!2342 lt!72166) (_2!2342 lt!72166)))))

(declare-fun lt!72178 () BitStream!1802)

(assert (=> d!13634 (= lt!72166 (tuple2!4499 lt!72178 (_2!2341 lt!71223)))))

(declare-fun lt!72174 () Unit!3277)

(declare-fun lt!72169 () Unit!3277)

(assert (=> d!13634 (= lt!72174 lt!72169)))

(assert (=> d!13634 (isPrefixOf!0 lt!72178 (_2!2341 lt!71223))))

(assert (=> d!13634 (= lt!72169 (lemmaIsPrefixTransitive!0 lt!72178 (_2!2341 lt!71223) (_2!2341 lt!71223)))))

(declare-fun lt!72183 () Unit!3277)

(declare-fun lt!72168 () Unit!3277)

(assert (=> d!13634 (= lt!72183 lt!72168)))

(assert (=> d!13634 (isPrefixOf!0 lt!72178 (_2!2341 lt!71223))))

(assert (=> d!13634 (= lt!72168 (lemmaIsPrefixTransitive!0 lt!72178 thiss!1379 (_2!2341 lt!71223)))))

(declare-fun lt!72181 () Unit!3277)

(assert (=> d!13634 (= lt!72181 e!30979)))

(declare-fun c!3168 () Bool)

(assert (=> d!13634 (= c!3168 (not (= (size!1032 (buf!1381 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!72180 () Unit!3277)

(declare-fun lt!72172 () Unit!3277)

(assert (=> d!13634 (= lt!72180 lt!72172)))

(assert (=> d!13634 (isPrefixOf!0 (_2!2341 lt!71223) (_2!2341 lt!71223))))

(assert (=> d!13634 (= lt!72172 (lemmaIsPrefixRefl!0 (_2!2341 lt!71223)))))

(declare-fun lt!72185 () Unit!3277)

(declare-fun lt!72182 () Unit!3277)

(assert (=> d!13634 (= lt!72185 lt!72182)))

(assert (=> d!13634 (= lt!72182 (lemmaIsPrefixRefl!0 (_2!2341 lt!71223)))))

(declare-fun lt!72179 () Unit!3277)

(declare-fun lt!72171 () Unit!3277)

(assert (=> d!13634 (= lt!72179 lt!72171)))

(assert (=> d!13634 (isPrefixOf!0 lt!72178 lt!72178)))

(assert (=> d!13634 (= lt!72171 (lemmaIsPrefixRefl!0 lt!72178))))

(declare-fun lt!72184 () Unit!3277)

(declare-fun lt!72173 () Unit!3277)

(assert (=> d!13634 (= lt!72184 lt!72173)))

(assert (=> d!13634 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!13634 (= lt!72173 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!13634 (= lt!72178 (BitStream!1803 (buf!1381 (_2!2341 lt!71223)) (currentByte!2880 thiss!1379) (currentBit!2875 thiss!1379)))))

(assert (=> d!13634 (isPrefixOf!0 thiss!1379 (_2!2341 lt!71223))))

(assert (=> d!13634 (= (reader!0 thiss!1379 (_2!2341 lt!71223)) lt!72166)))

(declare-fun b!46665 () Bool)

(declare-fun res!39378 () Bool)

(assert (=> b!46665 (=> (not res!39378) (not e!30978))))

(assert (=> b!46665 (= res!39378 (isPrefixOf!0 (_2!2342 lt!72166) (_2!2341 lt!71223)))))

(assert (= (and d!13634 c!3168) b!46662))

(assert (= (and d!13634 (not c!3168)) b!46661))

(assert (= (and d!13634 res!39379) b!46663))

(assert (= (and b!46663 res!39380) b!46665))

(assert (= (and b!46665 res!39378) b!46664))

(assert (=> b!46662 m!70823))

(declare-fun m!71577 () Bool)

(assert (=> b!46662 m!71577))

(declare-fun m!71583 () Bool)

(assert (=> b!46662 m!71583))

(declare-fun m!71585 () Bool)

(assert (=> b!46664 m!71585))

(assert (=> b!46664 m!70809))

(assert (=> b!46664 m!70823))

(assert (=> d!13634 m!70863))

(assert (=> d!13634 m!70821))

(declare-fun m!71591 () Bool)

(assert (=> d!13634 m!71591))

(declare-fun m!71593 () Bool)

(assert (=> d!13634 m!71593))

(declare-fun m!71595 () Bool)

(assert (=> d!13634 m!71595))

(declare-fun m!71597 () Bool)

(assert (=> d!13634 m!71597))

(assert (=> d!13634 m!70819))

(assert (=> d!13634 m!71489))

(declare-fun m!71599 () Bool)

(assert (=> d!13634 m!71599))

(assert (=> d!13634 m!71493))

(declare-fun m!71601 () Bool)

(assert (=> d!13634 m!71601))

(declare-fun m!71603 () Bool)

(assert (=> b!46663 m!71603))

(declare-fun m!71605 () Bool)

(assert (=> b!46665 m!71605))

(assert (=> b!46274 d!13634))

(declare-fun d!13638 () Bool)

(assert (=> d!13638 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1032 (buf!1381 (_2!2341 lt!71223)))) ((_ sign_extend 32) (currentByte!2880 thiss!1379)) ((_ sign_extend 32) (currentBit!2875 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1032 (buf!1381 (_2!2341 lt!71223)))) ((_ sign_extend 32) (currentByte!2880 thiss!1379)) ((_ sign_extend 32) (currentBit!2875 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3586 () Bool)

(assert (= bs!3586 d!13638))

(declare-fun m!71607 () Bool)

(assert (=> bs!3586 m!71607))

(assert (=> b!46274 d!13638))

(declare-fun d!13640 () Bool)

(assert (=> d!13640 (= (head!361 (byteArrayBitContentToList!0 (_2!2341 lt!71211) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!657 (byteArrayBitContentToList!0 (_2!2341 lt!71211) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!46285 d!13640))

(declare-fun d!13642 () Bool)

(declare-fun c!3172 () Bool)

(assert (=> d!13642 (= c!3172 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!30986 () List!542)

(assert (=> d!13642 (= (byteArrayBitContentToList!0 (_2!2341 lt!71211) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!30986)))

(declare-fun b!46678 () Bool)

(assert (=> b!46678 (= e!30986 Nil!539)))

(declare-fun b!46679 () Bool)

(assert (=> b!46679 (= e!30986 (Cons!538 (not (= (bvand ((_ sign_extend 24) (select (arr!1549 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2341 lt!71211) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!13642 c!3172) b!46678))

(assert (= (and d!13642 (not c!3172)) b!46679))

(assert (=> b!46679 m!70837))

(assert (=> b!46679 m!70987))

(declare-fun m!71641 () Bool)

(assert (=> b!46679 m!71641))

(assert (=> b!46285 d!13642))

(declare-fun d!13654 () Bool)

(assert (=> d!13654 (= (head!361 (bitStreamReadBitsIntoList!0 (_2!2341 lt!71211) (_1!2342 lt!71220) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!657 (bitStreamReadBitsIntoList!0 (_2!2341 lt!71211) (_1!2342 lt!71220) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!46285 d!13654))

(declare-fun lt!72209 () tuple2!4522)

(declare-fun e!30987 () tuple2!4520)

(declare-fun lt!72211 () (_ BitVec 64))

(declare-fun b!46681 () Bool)

(assert (=> b!46681 (= e!30987 (tuple2!4521 (Cons!538 (_1!2354 lt!72209) (bitStreamReadBitsIntoList!0 (_2!2341 lt!71211) (_2!2354 lt!72209) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!72211))) (_2!2354 lt!72209)))))

(assert (=> b!46681 (= lt!72209 (readBit!0 (_1!2342 lt!71220)))))

(assert (=> b!46681 (= lt!72211 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!46682 () Bool)

(declare-fun e!30988 () Bool)

(declare-fun lt!72210 () List!542)

(assert (=> b!46682 (= e!30988 (isEmpty!136 lt!72210))))

(declare-fun b!46683 () Bool)

(assert (=> b!46683 (= e!30988 (> (length!237 lt!72210) 0))))

(declare-fun b!46680 () Bool)

(assert (=> b!46680 (= e!30987 (tuple2!4521 Nil!539 (_1!2342 lt!71220)))))

(declare-fun d!13656 () Bool)

(assert (=> d!13656 e!30988))

(declare-fun c!3173 () Bool)

(assert (=> d!13656 (= c!3173 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13656 (= lt!72210 (_1!2353 e!30987))))

(declare-fun c!3174 () Bool)

(assert (=> d!13656 (= c!3174 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13656 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!13656 (= (bitStreamReadBitsIntoList!0 (_2!2341 lt!71211) (_1!2342 lt!71220) #b0000000000000000000000000000000000000000000000000000000000000001) lt!72210)))

(assert (= (and d!13656 c!3174) b!46680))

(assert (= (and d!13656 (not c!3174)) b!46681))

(assert (= (and d!13656 c!3173) b!46682))

(assert (= (and d!13656 (not c!3173)) b!46683))

(declare-fun m!71645 () Bool)

(assert (=> b!46681 m!71645))

(declare-fun m!71647 () Bool)

(assert (=> b!46681 m!71647))

(declare-fun m!71649 () Bool)

(assert (=> b!46682 m!71649))

(declare-fun m!71651 () Bool)

(assert (=> b!46683 m!71651))

(assert (=> b!46285 d!13656))

(declare-fun d!13660 () Bool)

(assert (=> d!13660 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1032 (buf!1381 thiss!1379))) ((_ sign_extend 32) (currentByte!2880 thiss!1379)) ((_ sign_extend 32) (currentBit!2875 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1032 (buf!1381 thiss!1379))) ((_ sign_extend 32) (currentByte!2880 thiss!1379)) ((_ sign_extend 32) (currentBit!2875 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3592 () Bool)

(assert (= bs!3592 d!13660))

(declare-fun m!71653 () Bool)

(assert (=> bs!3592 m!71653))

(assert (=> b!46286 d!13660))

(declare-fun d!13662 () Bool)

(assert (=> d!13662 (= (invariant!0 (currentBit!2875 (_2!2341 lt!71223)) (currentByte!2880 (_2!2341 lt!71223)) (size!1032 (buf!1381 (_2!2341 lt!71223)))) (and (bvsge (currentBit!2875 (_2!2341 lt!71223)) #b00000000000000000000000000000000) (bvslt (currentBit!2875 (_2!2341 lt!71223)) #b00000000000000000000000000001000) (bvsge (currentByte!2880 (_2!2341 lt!71223)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2880 (_2!2341 lt!71223)) (size!1032 (buf!1381 (_2!2341 lt!71223)))) (and (= (currentBit!2875 (_2!2341 lt!71223)) #b00000000000000000000000000000000) (= (currentByte!2880 (_2!2341 lt!71223)) (size!1032 (buf!1381 (_2!2341 lt!71223))))))))))

(assert (=> b!46275 d!13662))

(declare-fun d!13664 () Bool)

(assert (=> d!13664 (= (invariant!0 (currentBit!2875 (_2!2341 lt!71211)) (currentByte!2880 (_2!2341 lt!71211)) (size!1032 (buf!1381 (_2!2341 lt!71211)))) (and (bvsge (currentBit!2875 (_2!2341 lt!71211)) #b00000000000000000000000000000000) (bvslt (currentBit!2875 (_2!2341 lt!71211)) #b00000000000000000000000000001000) (bvsge (currentByte!2880 (_2!2341 lt!71211)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2880 (_2!2341 lt!71211)) (size!1032 (buf!1381 (_2!2341 lt!71211)))) (and (= (currentBit!2875 (_2!2341 lt!71211)) #b00000000000000000000000000000000) (= (currentByte!2880 (_2!2341 lt!71211)) (size!1032 (buf!1381 (_2!2341 lt!71211))))))))))

(assert (=> b!46276 d!13664))

(declare-fun d!13666 () Bool)

(declare-fun res!39391 () Bool)

(declare-fun e!30990 () Bool)

(assert (=> d!13666 (=> (not res!39391) (not e!30990))))

(assert (=> d!13666 (= res!39391 (= (size!1032 (buf!1381 thiss!1379)) (size!1032 (buf!1381 thiss!1379))))))

(assert (=> d!13666 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!30990)))

(declare-fun b!46686 () Bool)

(declare-fun res!39390 () Bool)

(assert (=> b!46686 (=> (not res!39390) (not e!30990))))

(assert (=> b!46686 (= res!39390 (bvsle (bitIndex!0 (size!1032 (buf!1381 thiss!1379)) (currentByte!2880 thiss!1379) (currentBit!2875 thiss!1379)) (bitIndex!0 (size!1032 (buf!1381 thiss!1379)) (currentByte!2880 thiss!1379) (currentBit!2875 thiss!1379))))))

(declare-fun b!46687 () Bool)

(declare-fun e!30991 () Bool)

(assert (=> b!46687 (= e!30990 e!30991)))

(declare-fun res!39389 () Bool)

(assert (=> b!46687 (=> res!39389 e!30991)))

(assert (=> b!46687 (= res!39389 (= (size!1032 (buf!1381 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!46688 () Bool)

(assert (=> b!46688 (= e!30991 (arrayBitRangesEq!0 (buf!1381 thiss!1379) (buf!1381 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1032 (buf!1381 thiss!1379)) (currentByte!2880 thiss!1379) (currentBit!2875 thiss!1379))))))

(assert (= (and d!13666 res!39391) b!46686))

(assert (= (and b!46686 res!39390) b!46687))

(assert (= (and b!46687 (not res!39389)) b!46688))

(assert (=> b!46686 m!70823))

(assert (=> b!46686 m!70823))

(assert (=> b!46688 m!70823))

(assert (=> b!46688 m!70823))

(declare-fun m!71655 () Bool)

(assert (=> b!46688 m!71655))

(assert (=> b!46287 d!13666))

(declare-fun d!13668 () Bool)

(assert (=> d!13668 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!72220 () Unit!3277)

(declare-fun choose!11 (BitStream!1802) Unit!3277)

(assert (=> d!13668 (= lt!72220 (choose!11 thiss!1379))))

(assert (=> d!13668 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!72220)))

(declare-fun bs!3594 () Bool)

(assert (= bs!3594 d!13668))

(assert (=> bs!3594 m!70819))

(declare-fun m!71657 () Bool)

(assert (=> bs!3594 m!71657))

(assert (=> b!46287 d!13668))

(declare-fun d!13670 () Bool)

(declare-fun e!30992 () Bool)

(assert (=> d!13670 e!30992))

(declare-fun res!39393 () Bool)

(assert (=> d!13670 (=> (not res!39393) (not e!30992))))

(declare-fun lt!72222 () (_ BitVec 64))

(declare-fun lt!72223 () (_ BitVec 64))

(declare-fun lt!72225 () (_ BitVec 64))

(assert (=> d!13670 (= res!39393 (= lt!72223 (bvsub lt!72225 lt!72222)))))

(assert (=> d!13670 (or (= (bvand lt!72225 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!72222 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!72225 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!72225 lt!72222) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!13670 (= lt!72222 (remainingBits!0 ((_ sign_extend 32) (size!1032 (buf!1381 thiss!1379))) ((_ sign_extend 32) (currentByte!2880 thiss!1379)) ((_ sign_extend 32) (currentBit!2875 thiss!1379))))))

(declare-fun lt!72226 () (_ BitVec 64))

(declare-fun lt!72224 () (_ BitVec 64))

(assert (=> d!13670 (= lt!72225 (bvmul lt!72226 lt!72224))))

(assert (=> d!13670 (or (= lt!72226 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!72224 (bvsdiv (bvmul lt!72226 lt!72224) lt!72226)))))

(assert (=> d!13670 (= lt!72224 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!13670 (= lt!72226 ((_ sign_extend 32) (size!1032 (buf!1381 thiss!1379))))))

(assert (=> d!13670 (= lt!72223 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2880 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2875 thiss!1379))))))

(assert (=> d!13670 (invariant!0 (currentBit!2875 thiss!1379) (currentByte!2880 thiss!1379) (size!1032 (buf!1381 thiss!1379)))))

(assert (=> d!13670 (= (bitIndex!0 (size!1032 (buf!1381 thiss!1379)) (currentByte!2880 thiss!1379) (currentBit!2875 thiss!1379)) lt!72223)))

(declare-fun b!46689 () Bool)

(declare-fun res!39392 () Bool)

(assert (=> b!46689 (=> (not res!39392) (not e!30992))))

(assert (=> b!46689 (= res!39392 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!72223))))

(declare-fun b!46690 () Bool)

(declare-fun lt!72221 () (_ BitVec 64))

(assert (=> b!46690 (= e!30992 (bvsle lt!72223 (bvmul lt!72221 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!46690 (or (= lt!72221 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!72221 #b0000000000000000000000000000000000000000000000000000000000001000) lt!72221)))))

(assert (=> b!46690 (= lt!72221 ((_ sign_extend 32) (size!1032 (buf!1381 thiss!1379))))))

(assert (= (and d!13670 res!39393) b!46689))

(assert (= (and b!46689 res!39392) b!46690))

(assert (=> d!13670 m!71653))

(assert (=> d!13670 m!70957))

(assert (=> b!46287 d!13670))

(push 1)

(assert (not b!46651))

(assert (not d!13522))

(assert (not b!46593))

(assert (not b!46655))

(assert (not b!46683))

(assert (not b!46597))

(assert (not b!46413))

(assert (not d!13506))

(assert (not b!46663))

(assert (not d!13500))

(assert (not d!13602))

(assert (not b!46596))

(assert (not d!13486))

(assert (not b!46590))

(assert (not b!46686))

(assert (not b!46416))

(assert (not b!46688))

(assert (not d!13504))

