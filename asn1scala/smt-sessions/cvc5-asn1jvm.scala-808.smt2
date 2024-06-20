; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23678 () Bool)

(assert start!23678)

(declare-fun b!119923 () Bool)

(declare-fun res!99273 () Bool)

(declare-fun e!78559 () Bool)

(assert (=> b!119923 (=> (not res!99273) (not e!78559))))

(declare-datatypes ((array!5348 0))(
  ( (array!5349 (arr!3015 (Array (_ BitVec 32) (_ BitVec 8))) (size!2422 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4318 0))(
  ( (BitStream!4319 (buf!2850 array!5348) (currentByte!5523 (_ BitVec 32)) (currentBit!5518 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4318)

(declare-datatypes ((Unit!7387 0))(
  ( (Unit!7388) )
))
(declare-datatypes ((tuple2!10048 0))(
  ( (tuple2!10049 (_1!5289 Unit!7387) (_2!5289 BitStream!4318)) )
))
(declare-fun lt!186134 () tuple2!10048)

(declare-fun isPrefixOf!0 (BitStream!4318 BitStream!4318) Bool)

(assert (=> b!119923 (= res!99273 (isPrefixOf!0 thiss!1305 (_2!5289 lt!186134)))))

(declare-fun b!119924 () Bool)

(declare-fun e!78558 () Bool)

(declare-datatypes ((tuple2!10050 0))(
  ( (tuple2!10051 (_1!5290 BitStream!4318) (_2!5290 Bool)) )
))
(declare-fun lt!186153 () tuple2!10050)

(declare-fun lt!186144 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!119924 (= e!78558 (= (bitIndex!0 (size!2422 (buf!2850 (_1!5290 lt!186153))) (currentByte!5523 (_1!5290 lt!186153)) (currentBit!5518 (_1!5290 lt!186153))) lt!186144))))

(declare-fun b!119925 () Bool)

(declare-fun res!99271 () Bool)

(declare-fun e!78556 () Bool)

(assert (=> b!119925 (=> (not res!99271) (not e!78556))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!119925 (= res!99271 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun res!99280 () Bool)

(declare-fun e!78564 () Bool)

(assert (=> start!23678 (=> (not res!99280) (not e!78564))))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> start!23678 (= res!99280 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!23678 e!78564))

(assert (=> start!23678 true))

(declare-fun e!78560 () Bool)

(declare-fun inv!12 (BitStream!4318) Bool)

(assert (=> start!23678 (and (inv!12 thiss!1305) e!78560)))

(declare-fun b!119926 () Bool)

(declare-fun e!78561 () Bool)

(declare-fun lt!186132 () tuple2!10050)

(declare-fun lt!186151 () tuple2!10050)

(assert (=> b!119926 (= e!78561 (= (_2!5290 lt!186132) (_2!5290 lt!186151)))))

(declare-fun b!119927 () Bool)

(declare-fun res!99279 () Bool)

(assert (=> b!119927 (=> (not res!99279) (not e!78556))))

(assert (=> b!119927 (= res!99279 (bvslt i!615 nBits!396))))

(declare-fun b!119928 () Bool)

(declare-fun res!99277 () Bool)

(declare-fun e!78555 () Bool)

(assert (=> b!119928 (=> (not res!99277) (not e!78555))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!119928 (= res!99277 (invariant!0 (currentBit!5518 thiss!1305) (currentByte!5523 thiss!1305) (size!2422 (buf!2850 (_2!5289 lt!186134)))))))

(declare-fun lt!186143 () (_ BitVec 64))

(declare-fun b!119929 () Bool)

(declare-datatypes ((tuple2!10052 0))(
  ( (tuple2!10053 (_1!5291 BitStream!4318) (_2!5291 BitStream!4318)) )
))
(declare-fun lt!186137 () tuple2!10052)

(declare-fun e!78563 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!4318 (_ BitVec 64)) BitStream!4318)

(assert (=> b!119929 (= e!78563 (= (_1!5291 lt!186137) (withMovedBitIndex!0 (_2!5291 lt!186137) (bvsub (bitIndex!0 (size!2422 (buf!2850 (_2!5289 lt!186134))) (currentByte!5523 (_2!5289 lt!186134)) (currentBit!5518 (_2!5289 lt!186134))) lt!186143))))))

(declare-fun lt!186146 () tuple2!10052)

(declare-fun lt!186145 () (_ BitVec 64))

(assert (=> b!119929 (= (_1!5291 lt!186146) (withMovedBitIndex!0 (_2!5291 lt!186146) (bvsub lt!186145 lt!186143)))))

(declare-fun lt!186149 () tuple2!10048)

(assert (=> b!119929 (= lt!186143 (bitIndex!0 (size!2422 (buf!2850 (_2!5289 lt!186149))) (currentByte!5523 (_2!5289 lt!186149)) (currentBit!5518 (_2!5289 lt!186149))))))

(assert (=> b!119929 (= lt!186145 (bitIndex!0 (size!2422 (buf!2850 thiss!1305)) (currentByte!5523 thiss!1305) (currentBit!5518 thiss!1305)))))

(declare-datatypes ((tuple2!10054 0))(
  ( (tuple2!10055 (_1!5292 BitStream!4318) (_2!5292 (_ BitVec 64))) )
))
(declare-fun lt!186130 () tuple2!10054)

(declare-fun lt!186131 () tuple2!10054)

(assert (=> b!119929 (and (= (_2!5292 lt!186130) (_2!5292 lt!186131)) (= (_1!5292 lt!186130) (_1!5292 lt!186131)))))

(declare-fun lt!186139 () (_ BitVec 64))

(declare-fun lt!186140 () Unit!7387)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4318 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7387)

(assert (=> b!119929 (= lt!186140 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5291 lt!186146) nBits!396 i!615 lt!186139))))

(declare-fun lt!186136 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4318 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10054)

(assert (=> b!119929 (= lt!186131 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5291 lt!186146) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!186136))))

(declare-fun b!119930 () Bool)

(assert (=> b!119930 (= e!78555 (invariant!0 (currentBit!5518 thiss!1305) (currentByte!5523 thiss!1305) (size!2422 (buf!2850 (_2!5289 lt!186149)))))))

(declare-fun b!119931 () Bool)

(assert (=> b!119931 (= e!78556 (not e!78563))))

(declare-fun res!99281 () Bool)

(assert (=> b!119931 (=> res!99281 e!78563)))

(assert (=> b!119931 (= res!99281 (not (= (_1!5292 (readNLeastSignificantBitsLoopPure!0 (_1!5291 lt!186137) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!186136)) (_2!5291 lt!186137))))))

(declare-fun lt!186135 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!119931 (validate_offset_bits!1 ((_ sign_extend 32) (size!2422 (buf!2850 (_2!5289 lt!186149)))) ((_ sign_extend 32) (currentByte!5523 (_2!5289 lt!186134))) ((_ sign_extend 32) (currentBit!5518 (_2!5289 lt!186134))) lt!186135)))

(declare-fun lt!186141 () Unit!7387)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4318 array!5348 (_ BitVec 64)) Unit!7387)

(assert (=> b!119931 (= lt!186141 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5289 lt!186134) (buf!2850 (_2!5289 lt!186149)) lt!186135))))

(assert (=> b!119931 (= lt!186135 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!186147 () (_ BitVec 64))

(declare-fun lt!186148 () tuple2!10050)

(assert (=> b!119931 (= lt!186136 (bvor lt!186139 (ite (_2!5290 lt!186148) lt!186147 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!119931 (= lt!186130 (readNLeastSignificantBitsLoopPure!0 (_1!5291 lt!186146) nBits!396 i!615 lt!186139))))

(declare-fun lt!186133 () (_ BitVec 64))

(assert (=> b!119931 (validate_offset_bits!1 ((_ sign_extend 32) (size!2422 (buf!2850 (_2!5289 lt!186149)))) ((_ sign_extend 32) (currentByte!5523 thiss!1305)) ((_ sign_extend 32) (currentBit!5518 thiss!1305)) lt!186133)))

(declare-fun lt!186150 () Unit!7387)

(assert (=> b!119931 (= lt!186150 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2850 (_2!5289 lt!186149)) lt!186133))))

(assert (=> b!119931 (= lt!186139 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!186142 () Bool)

(assert (=> b!119931 (= (_2!5290 lt!186148) lt!186142)))

(declare-fun readBitPure!0 (BitStream!4318) tuple2!10050)

(assert (=> b!119931 (= lt!186148 (readBitPure!0 (_1!5291 lt!186146)))))

(declare-fun reader!0 (BitStream!4318 BitStream!4318) tuple2!10052)

(assert (=> b!119931 (= lt!186137 (reader!0 (_2!5289 lt!186134) (_2!5289 lt!186149)))))

(assert (=> b!119931 (= lt!186146 (reader!0 thiss!1305 (_2!5289 lt!186149)))))

(assert (=> b!119931 e!78561))

(declare-fun res!99274 () Bool)

(assert (=> b!119931 (=> (not res!99274) (not e!78561))))

(assert (=> b!119931 (= res!99274 (= (bitIndex!0 (size!2422 (buf!2850 (_1!5290 lt!186132))) (currentByte!5523 (_1!5290 lt!186132)) (currentBit!5518 (_1!5290 lt!186132))) (bitIndex!0 (size!2422 (buf!2850 (_1!5290 lt!186151))) (currentByte!5523 (_1!5290 lt!186151)) (currentBit!5518 (_1!5290 lt!186151)))))))

(declare-fun lt!186128 () Unit!7387)

(declare-fun lt!186152 () BitStream!4318)

(declare-fun readBitPrefixLemma!0 (BitStream!4318 BitStream!4318) Unit!7387)

(assert (=> b!119931 (= lt!186128 (readBitPrefixLemma!0 lt!186152 (_2!5289 lt!186149)))))

(assert (=> b!119931 (= lt!186151 (readBitPure!0 (BitStream!4319 (buf!2850 (_2!5289 lt!186149)) (currentByte!5523 thiss!1305) (currentBit!5518 thiss!1305))))))

(assert (=> b!119931 (= lt!186132 (readBitPure!0 lt!186152))))

(assert (=> b!119931 (= lt!186152 (BitStream!4319 (buf!2850 (_2!5289 lt!186134)) (currentByte!5523 thiss!1305) (currentBit!5518 thiss!1305)))))

(assert (=> b!119931 e!78555))

(declare-fun res!99276 () Bool)

(assert (=> b!119931 (=> (not res!99276) (not e!78555))))

(assert (=> b!119931 (= res!99276 (isPrefixOf!0 thiss!1305 (_2!5289 lt!186149)))))

(declare-fun lt!186138 () Unit!7387)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4318 BitStream!4318 BitStream!4318) Unit!7387)

(assert (=> b!119931 (= lt!186138 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5289 lt!186134) (_2!5289 lt!186149)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4318 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!10048)

(assert (=> b!119931 (= lt!186149 (appendNLeastSignificantBitsLoop!0 (_2!5289 lt!186134) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!78557 () Bool)

(assert (=> b!119931 e!78557))

(declare-fun res!99275 () Bool)

(assert (=> b!119931 (=> (not res!99275) (not e!78557))))

(assert (=> b!119931 (= res!99275 (= (size!2422 (buf!2850 thiss!1305)) (size!2422 (buf!2850 (_2!5289 lt!186134)))))))

(declare-fun appendBit!0 (BitStream!4318 Bool) tuple2!10048)

(assert (=> b!119931 (= lt!186134 (appendBit!0 thiss!1305 lt!186142))))

(assert (=> b!119931 (= lt!186142 (not (= (bvand v!199 lt!186147) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!119931 (= lt!186147 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!119932 () Bool)

(assert (=> b!119932 (= e!78557 e!78559)))

(declare-fun res!99272 () Bool)

(assert (=> b!119932 (=> (not res!99272) (not e!78559))))

(declare-fun lt!186129 () (_ BitVec 64))

(assert (=> b!119932 (= res!99272 (= lt!186144 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!186129)))))

(assert (=> b!119932 (= lt!186144 (bitIndex!0 (size!2422 (buf!2850 (_2!5289 lt!186134))) (currentByte!5523 (_2!5289 lt!186134)) (currentBit!5518 (_2!5289 lt!186134))))))

(assert (=> b!119932 (= lt!186129 (bitIndex!0 (size!2422 (buf!2850 thiss!1305)) (currentByte!5523 thiss!1305) (currentBit!5518 thiss!1305)))))

(declare-fun b!119933 () Bool)

(declare-fun array_inv!2224 (array!5348) Bool)

(assert (=> b!119933 (= e!78560 (array_inv!2224 (buf!2850 thiss!1305)))))

(declare-fun b!119934 () Bool)

(assert (=> b!119934 (= e!78559 e!78558)))

(declare-fun res!99278 () Bool)

(assert (=> b!119934 (=> (not res!99278) (not e!78558))))

(assert (=> b!119934 (= res!99278 (and (= (_2!5290 lt!186153) lt!186142) (= (_1!5290 lt!186153) (_2!5289 lt!186134))))))

(declare-fun readerFrom!0 (BitStream!4318 (_ BitVec 32) (_ BitVec 32)) BitStream!4318)

(assert (=> b!119934 (= lt!186153 (readBitPure!0 (readerFrom!0 (_2!5289 lt!186134) (currentBit!5518 thiss!1305) (currentByte!5523 thiss!1305))))))

(declare-fun b!119935 () Bool)

(assert (=> b!119935 (= e!78564 e!78556)))

(declare-fun res!99282 () Bool)

(assert (=> b!119935 (=> (not res!99282) (not e!78556))))

(assert (=> b!119935 (= res!99282 (validate_offset_bits!1 ((_ sign_extend 32) (size!2422 (buf!2850 thiss!1305))) ((_ sign_extend 32) (currentByte!5523 thiss!1305)) ((_ sign_extend 32) (currentBit!5518 thiss!1305)) lt!186133))))

(assert (=> b!119935 (= lt!186133 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (= (and start!23678 res!99280) b!119935))

(assert (= (and b!119935 res!99282) b!119925))

(assert (= (and b!119925 res!99271) b!119927))

(assert (= (and b!119927 res!99279) b!119931))

(assert (= (and b!119931 res!99275) b!119932))

(assert (= (and b!119932 res!99272) b!119923))

(assert (= (and b!119923 res!99273) b!119934))

(assert (= (and b!119934 res!99278) b!119924))

(assert (= (and b!119931 res!99276) b!119928))

(assert (= (and b!119928 res!99277) b!119930))

(assert (= (and b!119931 res!99274) b!119926))

(assert (= (and b!119931 (not res!99281)) b!119929))

(assert (= start!23678 b!119933))

(declare-fun m!180899 () Bool)

(assert (=> b!119924 m!180899))

(declare-fun m!180901 () Bool)

(assert (=> b!119929 m!180901))

(declare-fun m!180903 () Bool)

(assert (=> b!119929 m!180903))

(declare-fun m!180905 () Bool)

(assert (=> b!119929 m!180905))

(declare-fun m!180907 () Bool)

(assert (=> b!119929 m!180907))

(declare-fun m!180909 () Bool)

(assert (=> b!119929 m!180909))

(declare-fun m!180911 () Bool)

(assert (=> b!119929 m!180911))

(assert (=> b!119929 m!180909))

(declare-fun m!180913 () Bool)

(assert (=> b!119929 m!180913))

(declare-fun m!180915 () Bool)

(assert (=> b!119929 m!180915))

(declare-fun m!180917 () Bool)

(assert (=> b!119925 m!180917))

(declare-fun m!180919 () Bool)

(assert (=> b!119923 m!180919))

(declare-fun m!180921 () Bool)

(assert (=> b!119930 m!180921))

(declare-fun m!180923 () Bool)

(assert (=> start!23678 m!180923))

(declare-fun m!180925 () Bool)

(assert (=> b!119934 m!180925))

(assert (=> b!119934 m!180925))

(declare-fun m!180927 () Bool)

(assert (=> b!119934 m!180927))

(assert (=> b!119932 m!180905))

(assert (=> b!119932 m!180907))

(declare-fun m!180929 () Bool)

(assert (=> b!119931 m!180929))

(declare-fun m!180931 () Bool)

(assert (=> b!119931 m!180931))

(declare-fun m!180933 () Bool)

(assert (=> b!119931 m!180933))

(declare-fun m!180935 () Bool)

(assert (=> b!119931 m!180935))

(declare-fun m!180937 () Bool)

(assert (=> b!119931 m!180937))

(declare-fun m!180939 () Bool)

(assert (=> b!119931 m!180939))

(declare-fun m!180941 () Bool)

(assert (=> b!119931 m!180941))

(declare-fun m!180943 () Bool)

(assert (=> b!119931 m!180943))

(declare-fun m!180945 () Bool)

(assert (=> b!119931 m!180945))

(declare-fun m!180947 () Bool)

(assert (=> b!119931 m!180947))

(declare-fun m!180949 () Bool)

(assert (=> b!119931 m!180949))

(declare-fun m!180951 () Bool)

(assert (=> b!119931 m!180951))

(declare-fun m!180953 () Bool)

(assert (=> b!119931 m!180953))

(declare-fun m!180955 () Bool)

(assert (=> b!119931 m!180955))

(declare-fun m!180957 () Bool)

(assert (=> b!119931 m!180957))

(declare-fun m!180959 () Bool)

(assert (=> b!119931 m!180959))

(declare-fun m!180961 () Bool)

(assert (=> b!119931 m!180961))

(declare-fun m!180963 () Bool)

(assert (=> b!119931 m!180963))

(declare-fun m!180965 () Bool)

(assert (=> b!119931 m!180965))

(declare-fun m!180967 () Bool)

(assert (=> b!119928 m!180967))

(declare-fun m!180969 () Bool)

(assert (=> b!119933 m!180969))

(declare-fun m!180971 () Bool)

(assert (=> b!119935 m!180971))

(push 1)

(assert (not b!119930))

(assert (not start!23678))

(assert (not b!119925))

(assert (not b!119935))

(assert (not b!119923))

(assert (not b!119928))

(assert (not b!119934))

(assert (not b!119929))

(assert (not b!119932))

(assert (not b!119924))

(assert (not b!119933))

(assert (not b!119931))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!38550 () Bool)

(assert (=> d!38550 (= (invariant!0 (currentBit!5518 thiss!1305) (currentByte!5523 thiss!1305) (size!2422 (buf!2850 (_2!5289 lt!186134)))) (and (bvsge (currentBit!5518 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5518 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5523 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5523 thiss!1305) (size!2422 (buf!2850 (_2!5289 lt!186134)))) (and (= (currentBit!5518 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5523 thiss!1305) (size!2422 (buf!2850 (_2!5289 lt!186134))))))))))

(assert (=> b!119928 d!38550))

(declare-fun d!38552 () Bool)

(declare-fun e!78627 () Bool)

(assert (=> d!38552 e!78627))

(declare-fun res!99357 () Bool)

(assert (=> d!38552 (=> (not res!99357) (not e!78627))))

(declare-fun lt!186314 () BitStream!4318)

(declare-fun lt!186315 () (_ BitVec 64))

(assert (=> d!38552 (= res!99357 (= (bvadd lt!186315 (bvsub lt!186145 lt!186143)) (bitIndex!0 (size!2422 (buf!2850 lt!186314)) (currentByte!5523 lt!186314) (currentBit!5518 lt!186314))))))

(assert (=> d!38552 (or (not (= (bvand lt!186315 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!186145 lt!186143) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!186315 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!186315 (bvsub lt!186145 lt!186143)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38552 (= lt!186315 (bitIndex!0 (size!2422 (buf!2850 (_2!5291 lt!186146))) (currentByte!5523 (_2!5291 lt!186146)) (currentBit!5518 (_2!5291 lt!186146))))))

(declare-fun moveBitIndex!0 (BitStream!4318 (_ BitVec 64)) tuple2!10048)

(assert (=> d!38552 (= lt!186314 (_2!5289 (moveBitIndex!0 (_2!5291 lt!186146) (bvsub lt!186145 lt!186143))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!4318 (_ BitVec 64)) Bool)

(assert (=> d!38552 (moveBitIndexPrecond!0 (_2!5291 lt!186146) (bvsub lt!186145 lt!186143))))

(assert (=> d!38552 (= (withMovedBitIndex!0 (_2!5291 lt!186146) (bvsub lt!186145 lt!186143)) lt!186314)))

(declare-fun b!120016 () Bool)

(assert (=> b!120016 (= e!78627 (= (size!2422 (buf!2850 (_2!5291 lt!186146))) (size!2422 (buf!2850 lt!186314))))))

(assert (= (and d!38552 res!99357) b!120016))

(declare-fun m!181121 () Bool)

(assert (=> d!38552 m!181121))

(declare-fun m!181123 () Bool)

(assert (=> d!38552 m!181123))

(declare-fun m!181125 () Bool)

(assert (=> d!38552 m!181125))

(declare-fun m!181127 () Bool)

(assert (=> d!38552 m!181127))

(assert (=> b!119929 d!38552))

(declare-fun d!38554 () Bool)

(declare-fun e!78630 () Bool)

(assert (=> d!38554 e!78630))

(declare-fun res!99363 () Bool)

(assert (=> d!38554 (=> (not res!99363) (not e!78630))))

(declare-fun lt!186332 () (_ BitVec 64))

(declare-fun lt!186330 () (_ BitVec 64))

(declare-fun lt!186328 () (_ BitVec 64))

(assert (=> d!38554 (= res!99363 (= lt!186330 (bvsub lt!186328 lt!186332)))))

(assert (=> d!38554 (or (= (bvand lt!186328 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!186332 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!186328 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!186328 lt!186332) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!38554 (= lt!186332 (remainingBits!0 ((_ sign_extend 32) (size!2422 (buf!2850 (_2!5289 lt!186134)))) ((_ sign_extend 32) (currentByte!5523 (_2!5289 lt!186134))) ((_ sign_extend 32) (currentBit!5518 (_2!5289 lt!186134)))))))

(declare-fun lt!186331 () (_ BitVec 64))

(declare-fun lt!186329 () (_ BitVec 64))

(assert (=> d!38554 (= lt!186328 (bvmul lt!186331 lt!186329))))

(assert (=> d!38554 (or (= lt!186331 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!186329 (bvsdiv (bvmul lt!186331 lt!186329) lt!186331)))))

(assert (=> d!38554 (= lt!186329 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38554 (= lt!186331 ((_ sign_extend 32) (size!2422 (buf!2850 (_2!5289 lt!186134)))))))

(assert (=> d!38554 (= lt!186330 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5523 (_2!5289 lt!186134))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5518 (_2!5289 lt!186134)))))))

(assert (=> d!38554 (invariant!0 (currentBit!5518 (_2!5289 lt!186134)) (currentByte!5523 (_2!5289 lt!186134)) (size!2422 (buf!2850 (_2!5289 lt!186134))))))

(assert (=> d!38554 (= (bitIndex!0 (size!2422 (buf!2850 (_2!5289 lt!186134))) (currentByte!5523 (_2!5289 lt!186134)) (currentBit!5518 (_2!5289 lt!186134))) lt!186330)))

(declare-fun b!120021 () Bool)

(declare-fun res!99362 () Bool)

(assert (=> b!120021 (=> (not res!99362) (not e!78630))))

(assert (=> b!120021 (= res!99362 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!186330))))

(declare-fun b!120022 () Bool)

(declare-fun lt!186333 () (_ BitVec 64))

(assert (=> b!120022 (= e!78630 (bvsle lt!186330 (bvmul lt!186333 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!120022 (or (= lt!186333 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!186333 #b0000000000000000000000000000000000000000000000000000000000001000) lt!186333)))))

(assert (=> b!120022 (= lt!186333 ((_ sign_extend 32) (size!2422 (buf!2850 (_2!5289 lt!186134)))))))

(assert (= (and d!38554 res!99363) b!120021))

(assert (= (and b!120021 res!99362) b!120022))

(declare-fun m!181129 () Bool)

(assert (=> d!38554 m!181129))

(declare-fun m!181131 () Bool)

(assert (=> d!38554 m!181131))

(assert (=> b!119929 d!38554))

(declare-fun d!38556 () Bool)

(declare-fun e!78631 () Bool)

(assert (=> d!38556 e!78631))

(declare-fun res!99364 () Bool)

(assert (=> d!38556 (=> (not res!99364) (not e!78631))))

(declare-fun lt!186335 () (_ BitVec 64))

(declare-fun lt!186334 () BitStream!4318)

(assert (=> d!38556 (= res!99364 (= (bvadd lt!186335 (bvsub (bitIndex!0 (size!2422 (buf!2850 (_2!5289 lt!186134))) (currentByte!5523 (_2!5289 lt!186134)) (currentBit!5518 (_2!5289 lt!186134))) lt!186143)) (bitIndex!0 (size!2422 (buf!2850 lt!186334)) (currentByte!5523 lt!186334) (currentBit!5518 lt!186334))))))

(assert (=> d!38556 (or (not (= (bvand lt!186335 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!2422 (buf!2850 (_2!5289 lt!186134))) (currentByte!5523 (_2!5289 lt!186134)) (currentBit!5518 (_2!5289 lt!186134))) lt!186143) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!186335 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!186335 (bvsub (bitIndex!0 (size!2422 (buf!2850 (_2!5289 lt!186134))) (currentByte!5523 (_2!5289 lt!186134)) (currentBit!5518 (_2!5289 lt!186134))) lt!186143)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38556 (= lt!186335 (bitIndex!0 (size!2422 (buf!2850 (_2!5291 lt!186137))) (currentByte!5523 (_2!5291 lt!186137)) (currentBit!5518 (_2!5291 lt!186137))))))

(assert (=> d!38556 (= lt!186334 (_2!5289 (moveBitIndex!0 (_2!5291 lt!186137) (bvsub (bitIndex!0 (size!2422 (buf!2850 (_2!5289 lt!186134))) (currentByte!5523 (_2!5289 lt!186134)) (currentBit!5518 (_2!5289 lt!186134))) lt!186143))))))

(assert (=> d!38556 (moveBitIndexPrecond!0 (_2!5291 lt!186137) (bvsub (bitIndex!0 (size!2422 (buf!2850 (_2!5289 lt!186134))) (currentByte!5523 (_2!5289 lt!186134)) (currentBit!5518 (_2!5289 lt!186134))) lt!186143))))

(assert (=> d!38556 (= (withMovedBitIndex!0 (_2!5291 lt!186137) (bvsub (bitIndex!0 (size!2422 (buf!2850 (_2!5289 lt!186134))) (currentByte!5523 (_2!5289 lt!186134)) (currentBit!5518 (_2!5289 lt!186134))) lt!186143)) lt!186334)))

(declare-fun b!120023 () Bool)

(assert (=> b!120023 (= e!78631 (= (size!2422 (buf!2850 (_2!5291 lt!186137))) (size!2422 (buf!2850 lt!186334))))))

(assert (= (and d!38556 res!99364) b!120023))

(declare-fun m!181133 () Bool)

(assert (=> d!38556 m!181133))

(declare-fun m!181135 () Bool)

(assert (=> d!38556 m!181135))

(declare-fun m!181137 () Bool)

(assert (=> d!38556 m!181137))

(declare-fun m!181139 () Bool)

(assert (=> d!38556 m!181139))

(assert (=> b!119929 d!38556))

(declare-fun d!38558 () Bool)

(declare-fun e!78632 () Bool)

(assert (=> d!38558 e!78632))

(declare-fun res!99366 () Bool)

(assert (=> d!38558 (=> (not res!99366) (not e!78632))))

(declare-fun lt!186338 () (_ BitVec 64))

(declare-fun lt!186340 () (_ BitVec 64))

(declare-fun lt!186336 () (_ BitVec 64))

(assert (=> d!38558 (= res!99366 (= lt!186338 (bvsub lt!186336 lt!186340)))))

(assert (=> d!38558 (or (= (bvand lt!186336 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!186340 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!186336 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!186336 lt!186340) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38558 (= lt!186340 (remainingBits!0 ((_ sign_extend 32) (size!2422 (buf!2850 (_2!5289 lt!186149)))) ((_ sign_extend 32) (currentByte!5523 (_2!5289 lt!186149))) ((_ sign_extend 32) (currentBit!5518 (_2!5289 lt!186149)))))))

(declare-fun lt!186339 () (_ BitVec 64))

(declare-fun lt!186337 () (_ BitVec 64))

(assert (=> d!38558 (= lt!186336 (bvmul lt!186339 lt!186337))))

(assert (=> d!38558 (or (= lt!186339 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!186337 (bvsdiv (bvmul lt!186339 lt!186337) lt!186339)))))

(assert (=> d!38558 (= lt!186337 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38558 (= lt!186339 ((_ sign_extend 32) (size!2422 (buf!2850 (_2!5289 lt!186149)))))))

(assert (=> d!38558 (= lt!186338 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5523 (_2!5289 lt!186149))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5518 (_2!5289 lt!186149)))))))

(assert (=> d!38558 (invariant!0 (currentBit!5518 (_2!5289 lt!186149)) (currentByte!5523 (_2!5289 lt!186149)) (size!2422 (buf!2850 (_2!5289 lt!186149))))))

(assert (=> d!38558 (= (bitIndex!0 (size!2422 (buf!2850 (_2!5289 lt!186149))) (currentByte!5523 (_2!5289 lt!186149)) (currentBit!5518 (_2!5289 lt!186149))) lt!186338)))

(declare-fun b!120024 () Bool)

(declare-fun res!99365 () Bool)

(assert (=> b!120024 (=> (not res!99365) (not e!78632))))

(assert (=> b!120024 (= res!99365 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!186338))))

(declare-fun b!120025 () Bool)

(declare-fun lt!186341 () (_ BitVec 64))

(assert (=> b!120025 (= e!78632 (bvsle lt!186338 (bvmul lt!186341 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!120025 (or (= lt!186341 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!186341 #b0000000000000000000000000000000000000000000000000000000000001000) lt!186341)))))

(assert (=> b!120025 (= lt!186341 ((_ sign_extend 32) (size!2422 (buf!2850 (_2!5289 lt!186149)))))))

(assert (= (and d!38558 res!99366) b!120024))

(assert (= (and b!120024 res!99365) b!120025))

(declare-fun m!181141 () Bool)

(assert (=> d!38558 m!181141))

(declare-fun m!181143 () Bool)

(assert (=> d!38558 m!181143))

(assert (=> b!119929 d!38558))

(declare-datatypes ((tuple2!10072 0))(
  ( (tuple2!10073 (_1!5301 (_ BitVec 64)) (_2!5301 BitStream!4318)) )
))
(declare-fun lt!186344 () tuple2!10072)

(declare-fun d!38560 () Bool)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!4318 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10072)

(assert (=> d!38560 (= lt!186344 (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 (_1!5291 lt!186146) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!186136))))

(assert (=> d!38560 (= (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5291 lt!186146) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!186136) (tuple2!10055 (_2!5301 lt!186344) (_1!5301 lt!186344)))))

(declare-fun bs!9329 () Bool)

(assert (= bs!9329 d!38560))

(assert (=> bs!9329 m!180909))

(declare-fun m!181145 () Bool)

(assert (=> bs!9329 m!181145))

(assert (=> b!119929 d!38560))

(declare-fun d!38562 () Bool)

(declare-fun e!78633 () Bool)

(assert (=> d!38562 e!78633))

(declare-fun res!99368 () Bool)

(assert (=> d!38562 (=> (not res!99368) (not e!78633))))

(declare-fun lt!186349 () (_ BitVec 64))

(declare-fun lt!186347 () (_ BitVec 64))

(declare-fun lt!186345 () (_ BitVec 64))

(assert (=> d!38562 (= res!99368 (= lt!186347 (bvsub lt!186345 lt!186349)))))

(assert (=> d!38562 (or (= (bvand lt!186345 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!186349 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!186345 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!186345 lt!186349) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38562 (= lt!186349 (remainingBits!0 ((_ sign_extend 32) (size!2422 (buf!2850 thiss!1305))) ((_ sign_extend 32) (currentByte!5523 thiss!1305)) ((_ sign_extend 32) (currentBit!5518 thiss!1305))))))

(declare-fun lt!186348 () (_ BitVec 64))

(declare-fun lt!186346 () (_ BitVec 64))

(assert (=> d!38562 (= lt!186345 (bvmul lt!186348 lt!186346))))

(assert (=> d!38562 (or (= lt!186348 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!186346 (bvsdiv (bvmul lt!186348 lt!186346) lt!186348)))))

(assert (=> d!38562 (= lt!186346 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38562 (= lt!186348 ((_ sign_extend 32) (size!2422 (buf!2850 thiss!1305))))))

(assert (=> d!38562 (= lt!186347 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5523 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5518 thiss!1305))))))

(assert (=> d!38562 (invariant!0 (currentBit!5518 thiss!1305) (currentByte!5523 thiss!1305) (size!2422 (buf!2850 thiss!1305)))))

(assert (=> d!38562 (= (bitIndex!0 (size!2422 (buf!2850 thiss!1305)) (currentByte!5523 thiss!1305) (currentBit!5518 thiss!1305)) lt!186347)))

(declare-fun b!120026 () Bool)

(declare-fun res!99367 () Bool)

(assert (=> b!120026 (=> (not res!99367) (not e!78633))))

(assert (=> b!120026 (= res!99367 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!186347))))

(declare-fun b!120027 () Bool)

(declare-fun lt!186350 () (_ BitVec 64))

(assert (=> b!120027 (= e!78633 (bvsle lt!186347 (bvmul lt!186350 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!120027 (or (= lt!186350 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!186350 #b0000000000000000000000000000000000000000000000000000000000001000) lt!186350)))))

(assert (=> b!120027 (= lt!186350 ((_ sign_extend 32) (size!2422 (buf!2850 thiss!1305))))))

(assert (= (and d!38562 res!99368) b!120026))

(assert (= (and b!120026 res!99367) b!120027))

(declare-fun m!181147 () Bool)

(assert (=> d!38562 m!181147))

(declare-fun m!181149 () Bool)

(assert (=> d!38562 m!181149))

(assert (=> b!119929 d!38562))

(declare-fun d!38564 () Bool)

(declare-fun lt!186368 () tuple2!10054)

(declare-fun lt!186366 () tuple2!10054)

(assert (=> d!38564 (and (= (_2!5292 lt!186368) (_2!5292 lt!186366)) (= (_1!5292 lt!186368) (_1!5292 lt!186366)))))

(declare-fun lt!186367 () BitStream!4318)

(declare-fun lt!186365 () (_ BitVec 64))

(declare-fun lt!186364 () Bool)

(declare-fun lt!186363 () Unit!7387)

(declare-fun choose!45 (BitStream!4318 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!10054 tuple2!10054 BitStream!4318 (_ BitVec 64) Bool BitStream!4318 (_ BitVec 64) tuple2!10054 tuple2!10054 BitStream!4318 (_ BitVec 64)) Unit!7387)

(assert (=> d!38564 (= lt!186363 (choose!45 (_1!5291 lt!186146) nBits!396 i!615 lt!186139 lt!186368 (tuple2!10055 (_1!5292 lt!186368) (_2!5292 lt!186368)) (_1!5292 lt!186368) (_2!5292 lt!186368) lt!186364 lt!186367 lt!186365 lt!186366 (tuple2!10055 (_1!5292 lt!186366) (_2!5292 lt!186366)) (_1!5292 lt!186366) (_2!5292 lt!186366)))))

(assert (=> d!38564 (= lt!186366 (readNLeastSignificantBitsLoopPure!0 lt!186367 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!186365))))

(assert (=> d!38564 (= lt!186365 (bvor lt!186139 (ite lt!186364 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38564 (= lt!186367 (withMovedBitIndex!0 (_1!5291 lt!186146) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!38564 (= lt!186364 (_2!5290 (readBitPure!0 (_1!5291 lt!186146))))))

(assert (=> d!38564 (= lt!186368 (readNLeastSignificantBitsLoopPure!0 (_1!5291 lt!186146) nBits!396 i!615 lt!186139))))

(assert (=> d!38564 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5291 lt!186146) nBits!396 i!615 lt!186139) lt!186363)))

(declare-fun bs!9331 () Bool)

(assert (= bs!9331 d!38564))

(assert (=> bs!9331 m!180943))

(declare-fun m!181151 () Bool)

(assert (=> bs!9331 m!181151))

(assert (=> bs!9331 m!180909))

(assert (=> bs!9331 m!180953))

(declare-fun m!181153 () Bool)

(assert (=> bs!9331 m!181153))

(assert (=> b!119929 d!38564))

(declare-fun d!38566 () Bool)

(declare-fun e!78634 () Bool)

(assert (=> d!38566 e!78634))

(declare-fun res!99369 () Bool)

(assert (=> d!38566 (=> (not res!99369) (not e!78634))))

(declare-fun lt!186370 () (_ BitVec 64))

(declare-fun lt!186369 () BitStream!4318)

(assert (=> d!38566 (= res!99369 (= (bvadd lt!186370 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2422 (buf!2850 lt!186369)) (currentByte!5523 lt!186369) (currentBit!5518 lt!186369))))))

(assert (=> d!38566 (or (not (= (bvand lt!186370 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!186370 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!186370 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38566 (= lt!186370 (bitIndex!0 (size!2422 (buf!2850 (_1!5291 lt!186146))) (currentByte!5523 (_1!5291 lt!186146)) (currentBit!5518 (_1!5291 lt!186146))))))

(assert (=> d!38566 (= lt!186369 (_2!5289 (moveBitIndex!0 (_1!5291 lt!186146) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!38566 (moveBitIndexPrecond!0 (_1!5291 lt!186146) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!38566 (= (withMovedBitIndex!0 (_1!5291 lt!186146) #b0000000000000000000000000000000000000000000000000000000000000001) lt!186369)))

(declare-fun b!120028 () Bool)

(assert (=> b!120028 (= e!78634 (= (size!2422 (buf!2850 (_1!5291 lt!186146))) (size!2422 (buf!2850 lt!186369))))))

(assert (= (and d!38566 res!99369) b!120028))

(declare-fun m!181155 () Bool)

(assert (=> d!38566 m!181155))

(declare-fun m!181157 () Bool)

(assert (=> d!38566 m!181157))

(declare-fun m!181159 () Bool)

(assert (=> d!38566 m!181159))

(declare-fun m!181161 () Bool)

(assert (=> d!38566 m!181161))

(assert (=> b!119929 d!38566))

(declare-fun d!38568 () Bool)

(assert (=> d!38568 (= (invariant!0 (currentBit!5518 thiss!1305) (currentByte!5523 thiss!1305) (size!2422 (buf!2850 (_2!5289 lt!186149)))) (and (bvsge (currentBit!5518 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5518 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5523 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5523 thiss!1305) (size!2422 (buf!2850 (_2!5289 lt!186149)))) (and (= (currentBit!5518 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5523 thiss!1305) (size!2422 (buf!2850 (_2!5289 lt!186149))))))))))

(assert (=> b!119930 d!38568))

(assert (=> b!119932 d!38554))

(assert (=> b!119932 d!38562))

(declare-fun d!38570 () Bool)

(assert (=> d!38570 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!119931 d!38570))

(declare-fun d!38574 () Bool)

(assert (=> d!38574 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2422 (buf!2850 (_2!5289 lt!186149)))) ((_ sign_extend 32) (currentByte!5523 (_2!5289 lt!186134))) ((_ sign_extend 32) (currentBit!5518 (_2!5289 lt!186134))) lt!186135) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2422 (buf!2850 (_2!5289 lt!186149)))) ((_ sign_extend 32) (currentByte!5523 (_2!5289 lt!186134))) ((_ sign_extend 32) (currentBit!5518 (_2!5289 lt!186134)))) lt!186135))))

(declare-fun bs!9333 () Bool)

(assert (= bs!9333 d!38574))

(declare-fun m!181165 () Bool)

(assert (=> bs!9333 m!181165))

(assert (=> b!119931 d!38574))

(declare-fun d!38578 () Bool)

(declare-fun e!78635 () Bool)

(assert (=> d!38578 e!78635))

(declare-fun res!99371 () Bool)

(assert (=> d!38578 (=> (not res!99371) (not e!78635))))

(declare-fun lt!186371 () (_ BitVec 64))

(declare-fun lt!186373 () (_ BitVec 64))

(declare-fun lt!186375 () (_ BitVec 64))

(assert (=> d!38578 (= res!99371 (= lt!186373 (bvsub lt!186371 lt!186375)))))

(assert (=> d!38578 (or (= (bvand lt!186371 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!186375 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!186371 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!186371 lt!186375) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38578 (= lt!186375 (remainingBits!0 ((_ sign_extend 32) (size!2422 (buf!2850 (_1!5290 lt!186151)))) ((_ sign_extend 32) (currentByte!5523 (_1!5290 lt!186151))) ((_ sign_extend 32) (currentBit!5518 (_1!5290 lt!186151)))))))

(declare-fun lt!186374 () (_ BitVec 64))

(declare-fun lt!186372 () (_ BitVec 64))

(assert (=> d!38578 (= lt!186371 (bvmul lt!186374 lt!186372))))

(assert (=> d!38578 (or (= lt!186374 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!186372 (bvsdiv (bvmul lt!186374 lt!186372) lt!186374)))))

(assert (=> d!38578 (= lt!186372 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38578 (= lt!186374 ((_ sign_extend 32) (size!2422 (buf!2850 (_1!5290 lt!186151)))))))

(assert (=> d!38578 (= lt!186373 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5523 (_1!5290 lt!186151))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5518 (_1!5290 lt!186151)))))))

(assert (=> d!38578 (invariant!0 (currentBit!5518 (_1!5290 lt!186151)) (currentByte!5523 (_1!5290 lt!186151)) (size!2422 (buf!2850 (_1!5290 lt!186151))))))

(assert (=> d!38578 (= (bitIndex!0 (size!2422 (buf!2850 (_1!5290 lt!186151))) (currentByte!5523 (_1!5290 lt!186151)) (currentBit!5518 (_1!5290 lt!186151))) lt!186373)))

(declare-fun b!120029 () Bool)

(declare-fun res!99370 () Bool)

(assert (=> b!120029 (=> (not res!99370) (not e!78635))))

(assert (=> b!120029 (= res!99370 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!186373))))

(declare-fun b!120030 () Bool)

(declare-fun lt!186376 () (_ BitVec 64))

(assert (=> b!120030 (= e!78635 (bvsle lt!186373 (bvmul lt!186376 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!120030 (or (= lt!186376 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!186376 #b0000000000000000000000000000000000000000000000000000000000001000) lt!186376)))))

(assert (=> b!120030 (= lt!186376 ((_ sign_extend 32) (size!2422 (buf!2850 (_1!5290 lt!186151)))))))

(assert (= (and d!38578 res!99371) b!120029))

(assert (= (and b!120029 res!99370) b!120030))

(declare-fun m!181167 () Bool)

(assert (=> d!38578 m!181167))

(declare-fun m!181169 () Bool)

(assert (=> d!38578 m!181169))

(assert (=> b!119931 d!38578))

(declare-fun b!120054 () Bool)

(declare-fun res!99395 () Bool)

(declare-fun e!78648 () Bool)

(assert (=> b!120054 (=> (not res!99395) (not e!78648))))

(declare-fun lt!186403 () tuple2!10048)

(assert (=> b!120054 (= res!99395 (isPrefixOf!0 thiss!1305 (_2!5289 lt!186403)))))

(declare-fun b!120053 () Bool)

(declare-fun res!99393 () Bool)

(assert (=> b!120053 (=> (not res!99393) (not e!78648))))

(declare-fun lt!186401 () (_ BitVec 64))

(declare-fun lt!186402 () (_ BitVec 64))

(assert (=> b!120053 (= res!99393 (= (bitIndex!0 (size!2422 (buf!2850 (_2!5289 lt!186403))) (currentByte!5523 (_2!5289 lt!186403)) (currentBit!5518 (_2!5289 lt!186403))) (bvadd lt!186401 lt!186402)))))

(assert (=> b!120053 (or (not (= (bvand lt!186401 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!186402 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!186401 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!186401 lt!186402) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!120053 (= lt!186402 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!120053 (= lt!186401 (bitIndex!0 (size!2422 (buf!2850 thiss!1305)) (currentByte!5523 thiss!1305) (currentBit!5518 thiss!1305)))))

(declare-fun b!120056 () Bool)

(declare-fun e!78649 () Bool)

(declare-fun lt!186400 () tuple2!10050)

(assert (=> b!120056 (= e!78649 (= (bitIndex!0 (size!2422 (buf!2850 (_1!5290 lt!186400))) (currentByte!5523 (_1!5290 lt!186400)) (currentBit!5518 (_1!5290 lt!186400))) (bitIndex!0 (size!2422 (buf!2850 (_2!5289 lt!186403))) (currentByte!5523 (_2!5289 lt!186403)) (currentBit!5518 (_2!5289 lt!186403)))))))

(declare-fun d!38580 () Bool)

(assert (=> d!38580 e!78648))

(declare-fun res!99396 () Bool)

(assert (=> d!38580 (=> (not res!99396) (not e!78648))))

(assert (=> d!38580 (= res!99396 (= (size!2422 (buf!2850 thiss!1305)) (size!2422 (buf!2850 (_2!5289 lt!186403)))))))

(declare-fun choose!16 (BitStream!4318 Bool) tuple2!10048)

(assert (=> d!38580 (= lt!186403 (choose!16 thiss!1305 lt!186142))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!38580 (validate_offset_bit!0 ((_ sign_extend 32) (size!2422 (buf!2850 thiss!1305))) ((_ sign_extend 32) (currentByte!5523 thiss!1305)) ((_ sign_extend 32) (currentBit!5518 thiss!1305)))))

(assert (=> d!38580 (= (appendBit!0 thiss!1305 lt!186142) lt!186403)))

(declare-fun b!120055 () Bool)

(assert (=> b!120055 (= e!78648 e!78649)))

(declare-fun res!99394 () Bool)

(assert (=> b!120055 (=> (not res!99394) (not e!78649))))

(assert (=> b!120055 (= res!99394 (and (= (_2!5290 lt!186400) lt!186142) (= (_1!5290 lt!186400) (_2!5289 lt!186403))))))

(assert (=> b!120055 (= lt!186400 (readBitPure!0 (readerFrom!0 (_2!5289 lt!186403) (currentBit!5518 thiss!1305) (currentByte!5523 thiss!1305))))))

(assert (= (and d!38580 res!99396) b!120053))

(assert (= (and b!120053 res!99393) b!120054))

(assert (= (and b!120054 res!99395) b!120055))

(assert (= (and b!120055 res!99394) b!120056))

(declare-fun m!181175 () Bool)

(assert (=> d!38580 m!181175))

(declare-fun m!181177 () Bool)

(assert (=> d!38580 m!181177))

(declare-fun m!181179 () Bool)

(assert (=> b!120053 m!181179))

(assert (=> b!120053 m!180907))

(declare-fun m!181181 () Bool)

(assert (=> b!120055 m!181181))

(assert (=> b!120055 m!181181))

(declare-fun m!181183 () Bool)

(assert (=> b!120055 m!181183))

(declare-fun m!181185 () Bool)

(assert (=> b!120056 m!181185))

(assert (=> b!120056 m!181179))

(declare-fun m!181187 () Bool)

(assert (=> b!120054 m!181187))

(assert (=> b!119931 d!38580))

(declare-fun b!120169 () Bool)

(declare-fun e!78706 () (_ BitVec 64))

(assert (=> b!120169 (= e!78706 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!120170 () Bool)

(assert (=> b!120170 (= e!78706 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!120171 () Bool)

(declare-fun lt!186750 () tuple2!10054)

(declare-fun lt!186767 () tuple2!10052)

(declare-fun e!78712 () Bool)

(assert (=> b!120171 (= e!78712 (and (= (_2!5292 lt!186750) v!199) (= (_1!5292 lt!186750) (_2!5291 lt!186767))))))

(declare-fun lt!186745 () (_ BitVec 64))

(assert (=> b!120171 (= lt!186750 (readNLeastSignificantBitsLoopPure!0 (_1!5291 lt!186767) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!186745))))

(declare-fun lt!186730 () Unit!7387)

(declare-fun lt!186760 () Unit!7387)

(assert (=> b!120171 (= lt!186730 lt!186760)))

(declare-fun lt!186753 () tuple2!10048)

(declare-fun lt!186731 () (_ BitVec 64))

(assert (=> b!120171 (validate_offset_bits!1 ((_ sign_extend 32) (size!2422 (buf!2850 (_2!5289 lt!186753)))) ((_ sign_extend 32) (currentByte!5523 (_2!5289 lt!186134))) ((_ sign_extend 32) (currentBit!5518 (_2!5289 lt!186134))) lt!186731)))

(assert (=> b!120171 (= lt!186760 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5289 lt!186134) (buf!2850 (_2!5289 lt!186753)) lt!186731))))

(declare-fun e!78710 () Bool)

(assert (=> b!120171 e!78710))

(declare-fun res!99491 () Bool)

(assert (=> b!120171 (=> (not res!99491) (not e!78710))))

(assert (=> b!120171 (= res!99491 (and (= (size!2422 (buf!2850 (_2!5289 lt!186134))) (size!2422 (buf!2850 (_2!5289 lt!186753)))) (bvsge lt!186731 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!120171 (= lt!186731 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!120171 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!120171 (= lt!186745 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!120171 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!120171 (= lt!186767 (reader!0 (_2!5289 lt!186134) (_2!5289 lt!186753)))))

(declare-fun b!120172 () Bool)

(declare-fun res!99493 () Bool)

(declare-fun call!1565 () Bool)

(assert (=> b!120172 (= res!99493 call!1565)))

(declare-fun e!78707 () Bool)

(assert (=> b!120172 (=> (not res!99493) (not e!78707))))

(declare-fun b!120173 () Bool)

(assert (=> b!120173 (= e!78710 (validate_offset_bits!1 ((_ sign_extend 32) (size!2422 (buf!2850 (_2!5289 lt!186134)))) ((_ sign_extend 32) (currentByte!5523 (_2!5289 lt!186134))) ((_ sign_extend 32) (currentBit!5518 (_2!5289 lt!186134))) lt!186731))))

(declare-fun lt!186744 () BitStream!4318)

(declare-fun c!7223 () Bool)

(declare-fun lt!186766 () tuple2!10048)

(declare-fun bm!1562 () Bool)

(assert (=> bm!1562 (= call!1565 (isPrefixOf!0 (ite c!7223 (_2!5289 lt!186134) lt!186744) (ite c!7223 (_2!5289 lt!186766) lt!186744)))))

(declare-fun b!120174 () Bool)

(declare-fun res!99486 () Bool)

(assert (=> b!120174 (= res!99486 (= (bitIndex!0 (size!2422 (buf!2850 (_2!5289 lt!186766))) (currentByte!5523 (_2!5289 lt!186766)) (currentBit!5518 (_2!5289 lt!186766))) (bvadd (bitIndex!0 (size!2422 (buf!2850 (_2!5289 lt!186134))) (currentByte!5523 (_2!5289 lt!186134)) (currentBit!5518 (_2!5289 lt!186134))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!120174 (=> (not res!99486) (not e!78707))))

(declare-fun b!120175 () Bool)

(declare-fun e!78711 () Bool)

(declare-fun lt!186752 () tuple2!10050)

(declare-fun lt!186756 () tuple2!10050)

(assert (=> b!120175 (= e!78711 (= (_2!5290 lt!186752) (_2!5290 lt!186756)))))

(declare-fun b!120176 () Bool)

(declare-fun res!99487 () Bool)

(assert (=> b!120176 (=> (not res!99487) (not e!78712))))

(declare-fun lt!186737 () (_ BitVec 64))

(declare-fun lt!186736 () (_ BitVec 64))

(assert (=> b!120176 (= res!99487 (= (bitIndex!0 (size!2422 (buf!2850 (_2!5289 lt!186753))) (currentByte!5523 (_2!5289 lt!186753)) (currentBit!5518 (_2!5289 lt!186753))) (bvadd lt!186737 lt!186736)))))

(assert (=> b!120176 (or (not (= (bvand lt!186737 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!186736 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!186737 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!186737 lt!186736) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!120176 (= lt!186736 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!120176 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!120176 (= lt!186737 (bitIndex!0 (size!2422 (buf!2850 (_2!5289 lt!186134))) (currentByte!5523 (_2!5289 lt!186134)) (currentBit!5518 (_2!5289 lt!186134))))))

(declare-fun b!120177 () Bool)

(declare-fun e!78708 () Bool)

(declare-fun lt!186769 () tuple2!10050)

(assert (=> b!120177 (= e!78708 (= (bitIndex!0 (size!2422 (buf!2850 (_1!5290 lt!186769))) (currentByte!5523 (_1!5290 lt!186769)) (currentBit!5518 (_1!5290 lt!186769))) (bitIndex!0 (size!2422 (buf!2850 (_2!5289 lt!186766))) (currentByte!5523 (_2!5289 lt!186766)) (currentBit!5518 (_2!5289 lt!186766)))))))

(declare-fun d!38592 () Bool)

(assert (=> d!38592 e!78712))

(declare-fun res!99490 () Bool)

(assert (=> d!38592 (=> (not res!99490) (not e!78712))))

(assert (=> d!38592 (= res!99490 (= (size!2422 (buf!2850 (_2!5289 lt!186134))) (size!2422 (buf!2850 (_2!5289 lt!186753)))))))

(declare-fun e!78709 () tuple2!10048)

(assert (=> d!38592 (= lt!186753 e!78709)))

(assert (=> d!38592 (= c!7223 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!38592 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!38592 (= (appendNLeastSignificantBitsLoop!0 (_2!5289 lt!186134) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!186753)))

(declare-fun b!120178 () Bool)

(assert (=> b!120178 (= lt!186769 (readBitPure!0 (readerFrom!0 (_2!5289 lt!186766) (currentBit!5518 (_2!5289 lt!186134)) (currentByte!5523 (_2!5289 lt!186134)))))))

(declare-fun lt!186746 () Bool)

(declare-fun res!99488 () Bool)

(assert (=> b!120178 (= res!99488 (and (= (_2!5290 lt!186769) lt!186746) (= (_1!5290 lt!186769) (_2!5289 lt!186766))))))

(assert (=> b!120178 (=> (not res!99488) (not e!78708))))

(assert (=> b!120178 (= e!78707 e!78708)))

(declare-fun b!120179 () Bool)

(declare-fun lt!186739 () tuple2!10048)

(declare-fun Unit!7393 () Unit!7387)

(assert (=> b!120179 (= e!78709 (tuple2!10049 Unit!7393 (_2!5289 lt!186739)))))

(assert (=> b!120179 (= lt!186746 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!120179 (= lt!186766 (appendBit!0 (_2!5289 lt!186134) lt!186746))))

(declare-fun res!99485 () Bool)

(assert (=> b!120179 (= res!99485 (= (size!2422 (buf!2850 (_2!5289 lt!186134))) (size!2422 (buf!2850 (_2!5289 lt!186766)))))))

(assert (=> b!120179 (=> (not res!99485) (not e!78707))))

(assert (=> b!120179 e!78707))

(declare-fun lt!186749 () tuple2!10048)

(assert (=> b!120179 (= lt!186749 lt!186766)))

(assert (=> b!120179 (= lt!186739 (appendNLeastSignificantBitsLoop!0 (_2!5289 lt!186749) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!186738 () Unit!7387)

(assert (=> b!120179 (= lt!186738 (lemmaIsPrefixTransitive!0 (_2!5289 lt!186134) (_2!5289 lt!186749) (_2!5289 lt!186739)))))

(assert (=> b!120179 (isPrefixOf!0 (_2!5289 lt!186134) (_2!5289 lt!186739))))

(declare-fun lt!186765 () Unit!7387)

(assert (=> b!120179 (= lt!186765 lt!186738)))

(assert (=> b!120179 (invariant!0 (currentBit!5518 (_2!5289 lt!186134)) (currentByte!5523 (_2!5289 lt!186134)) (size!2422 (buf!2850 (_2!5289 lt!186749))))))

(declare-fun lt!186748 () BitStream!4318)

(assert (=> b!120179 (= lt!186748 (BitStream!4319 (buf!2850 (_2!5289 lt!186749)) (currentByte!5523 (_2!5289 lt!186134)) (currentBit!5518 (_2!5289 lt!186134))))))

(assert (=> b!120179 (invariant!0 (currentBit!5518 lt!186748) (currentByte!5523 lt!186748) (size!2422 (buf!2850 (_2!5289 lt!186739))))))

(declare-fun lt!186732 () BitStream!4318)

(assert (=> b!120179 (= lt!186732 (BitStream!4319 (buf!2850 (_2!5289 lt!186739)) (currentByte!5523 lt!186748) (currentBit!5518 lt!186748)))))

(assert (=> b!120179 (= lt!186752 (readBitPure!0 lt!186748))))

(assert (=> b!120179 (= lt!186756 (readBitPure!0 lt!186732))))

(declare-fun lt!186763 () Unit!7387)

(assert (=> b!120179 (= lt!186763 (readBitPrefixLemma!0 lt!186748 (_2!5289 lt!186739)))))

(declare-fun res!99492 () Bool)

(assert (=> b!120179 (= res!99492 (= (bitIndex!0 (size!2422 (buf!2850 (_1!5290 lt!186752))) (currentByte!5523 (_1!5290 lt!186752)) (currentBit!5518 (_1!5290 lt!186752))) (bitIndex!0 (size!2422 (buf!2850 (_1!5290 lt!186756))) (currentByte!5523 (_1!5290 lt!186756)) (currentBit!5518 (_1!5290 lt!186756)))))))

(assert (=> b!120179 (=> (not res!99492) (not e!78711))))

(assert (=> b!120179 e!78711))

(declare-fun lt!186729 () Unit!7387)

(assert (=> b!120179 (= lt!186729 lt!186763)))

(declare-fun lt!186743 () tuple2!10052)

(assert (=> b!120179 (= lt!186743 (reader!0 (_2!5289 lt!186134) (_2!5289 lt!186739)))))

(declare-fun lt!186761 () tuple2!10052)

(assert (=> b!120179 (= lt!186761 (reader!0 (_2!5289 lt!186749) (_2!5289 lt!186739)))))

(declare-fun lt!186757 () tuple2!10050)

(assert (=> b!120179 (= lt!186757 (readBitPure!0 (_1!5291 lt!186743)))))

(assert (=> b!120179 (= (_2!5290 lt!186757) lt!186746)))

(declare-fun lt!186725 () Unit!7387)

(declare-fun Unit!7394 () Unit!7387)

(assert (=> b!120179 (= lt!186725 Unit!7394)))

(declare-fun lt!186751 () (_ BitVec 64))

(assert (=> b!120179 (= lt!186751 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!186754 () (_ BitVec 64))

(assert (=> b!120179 (= lt!186754 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!186768 () Unit!7387)

(assert (=> b!120179 (= lt!186768 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5289 lt!186134) (buf!2850 (_2!5289 lt!186739)) lt!186754))))

(assert (=> b!120179 (validate_offset_bits!1 ((_ sign_extend 32) (size!2422 (buf!2850 (_2!5289 lt!186739)))) ((_ sign_extend 32) (currentByte!5523 (_2!5289 lt!186134))) ((_ sign_extend 32) (currentBit!5518 (_2!5289 lt!186134))) lt!186754)))

(declare-fun lt!186726 () Unit!7387)

(assert (=> b!120179 (= lt!186726 lt!186768)))

(declare-fun lt!186735 () tuple2!10054)

(assert (=> b!120179 (= lt!186735 (readNLeastSignificantBitsLoopPure!0 (_1!5291 lt!186743) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!186751))))

(declare-fun lt!186727 () (_ BitVec 64))

(assert (=> b!120179 (= lt!186727 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!186734 () Unit!7387)

(assert (=> b!120179 (= lt!186734 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5289 lt!186749) (buf!2850 (_2!5289 lt!186739)) lt!186727))))

(assert (=> b!120179 (validate_offset_bits!1 ((_ sign_extend 32) (size!2422 (buf!2850 (_2!5289 lt!186739)))) ((_ sign_extend 32) (currentByte!5523 (_2!5289 lt!186749))) ((_ sign_extend 32) (currentBit!5518 (_2!5289 lt!186749))) lt!186727)))

(declare-fun lt!186764 () Unit!7387)

(assert (=> b!120179 (= lt!186764 lt!186734)))

(declare-fun lt!186742 () tuple2!10054)

(assert (=> b!120179 (= lt!186742 (readNLeastSignificantBitsLoopPure!0 (_1!5291 lt!186761) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!186751 (ite (_2!5290 lt!186757) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!186747 () tuple2!10054)

(assert (=> b!120179 (= lt!186747 (readNLeastSignificantBitsLoopPure!0 (_1!5291 lt!186743) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!186751))))

(declare-fun c!7222 () Bool)

(assert (=> b!120179 (= c!7222 (_2!5290 (readBitPure!0 (_1!5291 lt!186743))))))

(declare-fun lt!186728 () tuple2!10054)

(assert (=> b!120179 (= lt!186728 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5291 lt!186743) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!186751 e!78706)))))

(declare-fun lt!186733 () Unit!7387)

(assert (=> b!120179 (= lt!186733 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5291 lt!186743) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!186751))))

(assert (=> b!120179 (and (= (_2!5292 lt!186747) (_2!5292 lt!186728)) (= (_1!5292 lt!186747) (_1!5292 lt!186728)))))

(declare-fun lt!186759 () Unit!7387)

(assert (=> b!120179 (= lt!186759 lt!186733)))

(assert (=> b!120179 (= (_1!5291 lt!186743) (withMovedBitIndex!0 (_2!5291 lt!186743) (bvsub (bitIndex!0 (size!2422 (buf!2850 (_2!5289 lt!186134))) (currentByte!5523 (_2!5289 lt!186134)) (currentBit!5518 (_2!5289 lt!186134))) (bitIndex!0 (size!2422 (buf!2850 (_2!5289 lt!186739))) (currentByte!5523 (_2!5289 lt!186739)) (currentBit!5518 (_2!5289 lt!186739))))))))

(declare-fun lt!186740 () Unit!7387)

(declare-fun Unit!7395 () Unit!7387)

(assert (=> b!120179 (= lt!186740 Unit!7395)))

(assert (=> b!120179 (= (_1!5291 lt!186761) (withMovedBitIndex!0 (_2!5291 lt!186761) (bvsub (bitIndex!0 (size!2422 (buf!2850 (_2!5289 lt!186749))) (currentByte!5523 (_2!5289 lt!186749)) (currentBit!5518 (_2!5289 lt!186749))) (bitIndex!0 (size!2422 (buf!2850 (_2!5289 lt!186739))) (currentByte!5523 (_2!5289 lt!186739)) (currentBit!5518 (_2!5289 lt!186739))))))))

(declare-fun lt!186755 () Unit!7387)

(declare-fun Unit!7396 () Unit!7387)

(assert (=> b!120179 (= lt!186755 Unit!7396)))

(assert (=> b!120179 (= (bitIndex!0 (size!2422 (buf!2850 (_2!5289 lt!186134))) (currentByte!5523 (_2!5289 lt!186134)) (currentBit!5518 (_2!5289 lt!186134))) (bvsub (bitIndex!0 (size!2422 (buf!2850 (_2!5289 lt!186749))) (currentByte!5523 (_2!5289 lt!186749)) (currentBit!5518 (_2!5289 lt!186749))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!186758 () Unit!7387)

(declare-fun Unit!7397 () Unit!7387)

(assert (=> b!120179 (= lt!186758 Unit!7397)))

(assert (=> b!120179 (= (_2!5292 lt!186735) (_2!5292 lt!186742))))

(declare-fun lt!186741 () Unit!7387)

(declare-fun Unit!7398 () Unit!7387)

(assert (=> b!120179 (= lt!186741 Unit!7398)))

(assert (=> b!120179 (= (_1!5292 lt!186735) (_2!5291 lt!186743))))

(declare-fun b!120180 () Bool)

(declare-fun lt!186762 () Unit!7387)

(assert (=> b!120180 (= e!78709 (tuple2!10049 lt!186762 (_2!5289 lt!186134)))))

(assert (=> b!120180 (= lt!186744 (_2!5289 lt!186134))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4318) Unit!7387)

(assert (=> b!120180 (= lt!186762 (lemmaIsPrefixRefl!0 lt!186744))))

(assert (=> b!120180 call!1565))

(declare-fun b!120181 () Bool)

(declare-fun res!99489 () Bool)

(assert (=> b!120181 (=> (not res!99489) (not e!78712))))

(assert (=> b!120181 (= res!99489 (isPrefixOf!0 (_2!5289 lt!186134) (_2!5289 lt!186753)))))

(assert (= (and d!38592 c!7223) b!120179))

(assert (= (and d!38592 (not c!7223)) b!120180))

(assert (= (and b!120179 res!99485) b!120174))

(assert (= (and b!120174 res!99486) b!120172))

(assert (= (and b!120172 res!99493) b!120178))

(assert (= (and b!120178 res!99488) b!120177))

(assert (= (and b!120179 res!99492) b!120175))

(assert (= (and b!120179 c!7222) b!120169))

(assert (= (and b!120179 (not c!7222)) b!120170))

(assert (= (or b!120172 b!120180) bm!1562))

(assert (= (and d!38592 res!99490) b!120176))

(assert (= (and b!120176 res!99487) b!120181))

(assert (= (and b!120181 res!99489) b!120171))

(assert (= (and b!120171 res!99491) b!120173))

(declare-fun m!181363 () Bool)

(assert (=> b!120171 m!181363))

(declare-fun m!181365 () Bool)

(assert (=> b!120171 m!181365))

(declare-fun m!181367 () Bool)

(assert (=> b!120171 m!181367))

(declare-fun m!181369 () Bool)

(assert (=> b!120171 m!181369))

(declare-fun m!181371 () Bool)

(assert (=> b!120171 m!181371))

(declare-fun m!181373 () Bool)

(assert (=> b!120173 m!181373))

(declare-fun m!181375 () Bool)

(assert (=> b!120179 m!181375))

(declare-fun m!181377 () Bool)

(assert (=> b!120179 m!181377))

(declare-fun m!181379 () Bool)

(assert (=> b!120179 m!181379))

(declare-fun m!181381 () Bool)

(assert (=> b!120179 m!181381))

(declare-fun m!181383 () Bool)

(assert (=> b!120179 m!181383))

(declare-fun m!181385 () Bool)

(assert (=> b!120179 m!181385))

(declare-fun m!181387 () Bool)

(assert (=> b!120179 m!181387))

(declare-fun m!181389 () Bool)

(assert (=> b!120179 m!181389))

(declare-fun m!181391 () Bool)

(assert (=> b!120179 m!181391))

(declare-fun m!181393 () Bool)

(assert (=> b!120179 m!181393))

(declare-fun m!181395 () Bool)

(assert (=> b!120179 m!181395))

(declare-fun m!181397 () Bool)

(assert (=> b!120179 m!181397))

(declare-fun m!181399 () Bool)

(assert (=> b!120179 m!181399))

(declare-fun m!181401 () Bool)

(assert (=> b!120179 m!181401))

(assert (=> b!120179 m!181383))

(assert (=> b!120179 m!181363))

(declare-fun m!181403 () Bool)

(assert (=> b!120179 m!181403))

(declare-fun m!181405 () Bool)

(assert (=> b!120179 m!181405))

(declare-fun m!181407 () Bool)

(assert (=> b!120179 m!181407))

(declare-fun m!181409 () Bool)

(assert (=> b!120179 m!181409))

(declare-fun m!181411 () Bool)

(assert (=> b!120179 m!181411))

(declare-fun m!181413 () Bool)

(assert (=> b!120179 m!181413))

(declare-fun m!181415 () Bool)

(assert (=> b!120179 m!181415))

(declare-fun m!181417 () Bool)

(assert (=> b!120179 m!181417))

(declare-fun m!181419 () Bool)

(assert (=> b!120179 m!181419))

(declare-fun m!181421 () Bool)

(assert (=> b!120179 m!181421))

(declare-fun m!181423 () Bool)

(assert (=> b!120179 m!181423))

(declare-fun m!181425 () Bool)

(assert (=> b!120179 m!181425))

(assert (=> b!120179 m!180905))

(declare-fun m!181427 () Bool)

(assert (=> b!120179 m!181427))

(declare-fun m!181429 () Bool)

(assert (=> b!120180 m!181429))

(declare-fun m!181431 () Bool)

(assert (=> b!120181 m!181431))

(declare-fun m!181433 () Bool)

(assert (=> bm!1562 m!181433))

(declare-fun m!181435 () Bool)

(assert (=> b!120176 m!181435))

(assert (=> b!120176 m!180905))

(declare-fun m!181437 () Bool)

(assert (=> b!120178 m!181437))

(assert (=> b!120178 m!181437))

(declare-fun m!181439 () Bool)

(assert (=> b!120178 m!181439))

(declare-fun m!181441 () Bool)

(assert (=> b!120177 m!181441))

(declare-fun m!181443 () Bool)

(assert (=> b!120177 m!181443))

(assert (=> b!120174 m!181443))

(assert (=> b!120174 m!180905))

(assert (=> b!119931 d!38592))

(declare-fun d!38654 () Bool)

(declare-fun e!78715 () Bool)

(assert (=> d!38654 e!78715))

(declare-fun res!99496 () Bool)

(assert (=> d!38654 (=> (not res!99496) (not e!78715))))

(declare-fun lt!186780 () tuple2!10050)

(declare-fun lt!186781 () tuple2!10050)

(assert (=> d!38654 (= res!99496 (= (bitIndex!0 (size!2422 (buf!2850 (_1!5290 lt!186780))) (currentByte!5523 (_1!5290 lt!186780)) (currentBit!5518 (_1!5290 lt!186780))) (bitIndex!0 (size!2422 (buf!2850 (_1!5290 lt!186781))) (currentByte!5523 (_1!5290 lt!186781)) (currentBit!5518 (_1!5290 lt!186781)))))))

(declare-fun lt!186779 () Unit!7387)

(declare-fun lt!186778 () BitStream!4318)

(declare-fun choose!50 (BitStream!4318 BitStream!4318 BitStream!4318 tuple2!10050 tuple2!10050 BitStream!4318 Bool tuple2!10050 tuple2!10050 BitStream!4318 Bool) Unit!7387)

(assert (=> d!38654 (= lt!186779 (choose!50 lt!186152 (_2!5289 lt!186149) lt!186778 lt!186780 (tuple2!10051 (_1!5290 lt!186780) (_2!5290 lt!186780)) (_1!5290 lt!186780) (_2!5290 lt!186780) lt!186781 (tuple2!10051 (_1!5290 lt!186781) (_2!5290 lt!186781)) (_1!5290 lt!186781) (_2!5290 lt!186781)))))

(assert (=> d!38654 (= lt!186781 (readBitPure!0 lt!186778))))

(assert (=> d!38654 (= lt!186780 (readBitPure!0 lt!186152))))

(assert (=> d!38654 (= lt!186778 (BitStream!4319 (buf!2850 (_2!5289 lt!186149)) (currentByte!5523 lt!186152) (currentBit!5518 lt!186152)))))

(assert (=> d!38654 (invariant!0 (currentBit!5518 lt!186152) (currentByte!5523 lt!186152) (size!2422 (buf!2850 (_2!5289 lt!186149))))))

(assert (=> d!38654 (= (readBitPrefixLemma!0 lt!186152 (_2!5289 lt!186149)) lt!186779)))

(declare-fun b!120184 () Bool)

(assert (=> b!120184 (= e!78715 (= (_2!5290 lt!186780) (_2!5290 lt!186781)))))

(assert (= (and d!38654 res!99496) b!120184))

(declare-fun m!181445 () Bool)

(assert (=> d!38654 m!181445))

(declare-fun m!181447 () Bool)

(assert (=> d!38654 m!181447))

(declare-fun m!181449 () Bool)

(assert (=> d!38654 m!181449))

(declare-fun m!181451 () Bool)

(assert (=> d!38654 m!181451))

(assert (=> d!38654 m!180955))

(declare-fun m!181453 () Bool)

(assert (=> d!38654 m!181453))

(assert (=> b!119931 d!38654))

(declare-fun d!38656 () Bool)

(declare-fun res!99504 () Bool)

(declare-fun e!78720 () Bool)

(assert (=> d!38656 (=> (not res!99504) (not e!78720))))

(assert (=> d!38656 (= res!99504 (= (size!2422 (buf!2850 thiss!1305)) (size!2422 (buf!2850 (_2!5289 lt!186149)))))))

(assert (=> d!38656 (= (isPrefixOf!0 thiss!1305 (_2!5289 lt!186149)) e!78720)))

(declare-fun b!120191 () Bool)

(declare-fun res!99503 () Bool)

(assert (=> b!120191 (=> (not res!99503) (not e!78720))))

(assert (=> b!120191 (= res!99503 (bvsle (bitIndex!0 (size!2422 (buf!2850 thiss!1305)) (currentByte!5523 thiss!1305) (currentBit!5518 thiss!1305)) (bitIndex!0 (size!2422 (buf!2850 (_2!5289 lt!186149))) (currentByte!5523 (_2!5289 lt!186149)) (currentBit!5518 (_2!5289 lt!186149)))))))

(declare-fun b!120192 () Bool)

(declare-fun e!78721 () Bool)

(assert (=> b!120192 (= e!78720 e!78721)))

(declare-fun res!99505 () Bool)

(assert (=> b!120192 (=> res!99505 e!78721)))

(assert (=> b!120192 (= res!99505 (= (size!2422 (buf!2850 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!120193 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5348 array!5348 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!120193 (= e!78721 (arrayBitRangesEq!0 (buf!2850 thiss!1305) (buf!2850 (_2!5289 lt!186149)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2422 (buf!2850 thiss!1305)) (currentByte!5523 thiss!1305) (currentBit!5518 thiss!1305))))))

(assert (= (and d!38656 res!99504) b!120191))

(assert (= (and b!120191 res!99503) b!120192))

(assert (= (and b!120192 (not res!99505)) b!120193))

(assert (=> b!120191 m!180907))

(assert (=> b!120191 m!180903))

(assert (=> b!120193 m!180907))

(assert (=> b!120193 m!180907))

(declare-fun m!181455 () Bool)

(assert (=> b!120193 m!181455))

(assert (=> b!119931 d!38656))

(declare-fun d!38658 () Bool)

(declare-fun lt!186782 () tuple2!10072)

(assert (=> d!38658 (= lt!186782 (readNLeastSignificantBitsLoop!0 (_1!5291 lt!186146) nBits!396 i!615 lt!186139))))

(assert (=> d!38658 (= (readNLeastSignificantBitsLoopPure!0 (_1!5291 lt!186146) nBits!396 i!615 lt!186139) (tuple2!10055 (_2!5301 lt!186782) (_1!5301 lt!186782)))))

(declare-fun bs!9351 () Bool)

(assert (= bs!9351 d!38658))

(declare-fun m!181457 () Bool)

(assert (=> bs!9351 m!181457))

(assert (=> b!119931 d!38658))

(declare-fun d!38660 () Bool)

(assert (=> d!38660 (validate_offset_bits!1 ((_ sign_extend 32) (size!2422 (buf!2850 (_2!5289 lt!186149)))) ((_ sign_extend 32) (currentByte!5523 thiss!1305)) ((_ sign_extend 32) (currentBit!5518 thiss!1305)) lt!186133)))

(declare-fun lt!186785 () Unit!7387)

(declare-fun choose!9 (BitStream!4318 array!5348 (_ BitVec 64) BitStream!4318) Unit!7387)

(assert (=> d!38660 (= lt!186785 (choose!9 thiss!1305 (buf!2850 (_2!5289 lt!186149)) lt!186133 (BitStream!4319 (buf!2850 (_2!5289 lt!186149)) (currentByte!5523 thiss!1305) (currentBit!5518 thiss!1305))))))

(assert (=> d!38660 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2850 (_2!5289 lt!186149)) lt!186133) lt!186785)))

(declare-fun bs!9352 () Bool)

(assert (= bs!9352 d!38660))

(assert (=> bs!9352 m!180963))

(declare-fun m!181459 () Bool)

(assert (=> bs!9352 m!181459))

(assert (=> b!119931 d!38660))

(declare-fun d!38662 () Bool)

(declare-datatypes ((tuple2!10078 0))(
  ( (tuple2!10079 (_1!5304 Bool) (_2!5304 BitStream!4318)) )
))
(declare-fun lt!186788 () tuple2!10078)

(declare-fun readBit!0 (BitStream!4318) tuple2!10078)

(assert (=> d!38662 (= lt!186788 (readBit!0 lt!186152))))

(assert (=> d!38662 (= (readBitPure!0 lt!186152) (tuple2!10051 (_2!5304 lt!186788) (_1!5304 lt!186788)))))

(declare-fun bs!9353 () Bool)

(assert (= bs!9353 d!38662))

(declare-fun m!181461 () Bool)

(assert (=> bs!9353 m!181461))

(assert (=> b!119931 d!38662))

(declare-fun d!38664 () Bool)

(declare-fun lt!186789 () tuple2!10078)

(assert (=> d!38664 (= lt!186789 (readBit!0 (BitStream!4319 (buf!2850 (_2!5289 lt!186149)) (currentByte!5523 thiss!1305) (currentBit!5518 thiss!1305))))))

(assert (=> d!38664 (= (readBitPure!0 (BitStream!4319 (buf!2850 (_2!5289 lt!186149)) (currentByte!5523 thiss!1305) (currentBit!5518 thiss!1305))) (tuple2!10051 (_2!5304 lt!186789) (_1!5304 lt!186789)))))

(declare-fun bs!9354 () Bool)

(assert (= bs!9354 d!38664))

(declare-fun m!181463 () Bool)

(assert (=> bs!9354 m!181463))

(assert (=> b!119931 d!38664))

(declare-fun d!38666 () Bool)

(assert (=> d!38666 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2422 (buf!2850 (_2!5289 lt!186149)))) ((_ sign_extend 32) (currentByte!5523 thiss!1305)) ((_ sign_extend 32) (currentBit!5518 thiss!1305)) lt!186133) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2422 (buf!2850 (_2!5289 lt!186149)))) ((_ sign_extend 32) (currentByte!5523 thiss!1305)) ((_ sign_extend 32) (currentBit!5518 thiss!1305))) lt!186133))))

(declare-fun bs!9355 () Bool)

(assert (= bs!9355 d!38666))

(declare-fun m!181465 () Bool)

(assert (=> bs!9355 m!181465))

(assert (=> b!119931 d!38666))

(declare-fun b!120230 () Bool)

(declare-fun e!78740 () Unit!7387)

(declare-fun lt!186931 () Unit!7387)

(assert (=> b!120230 (= e!78740 lt!186931)))

(declare-fun lt!186933 () (_ BitVec 64))

(assert (=> b!120230 (= lt!186933 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186929 () (_ BitVec 64))

(assert (=> b!120230 (= lt!186929 (bitIndex!0 (size!2422 (buf!2850 thiss!1305)) (currentByte!5523 thiss!1305) (currentBit!5518 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5348 array!5348 (_ BitVec 64) (_ BitVec 64)) Unit!7387)

(assert (=> b!120230 (= lt!186931 (arrayBitRangesEqSymmetric!0 (buf!2850 thiss!1305) (buf!2850 (_2!5289 lt!186149)) lt!186933 lt!186929))))

(assert (=> b!120230 (arrayBitRangesEq!0 (buf!2850 (_2!5289 lt!186149)) (buf!2850 thiss!1305) lt!186933 lt!186929)))

(declare-fun b!120231 () Bool)

(declare-fun Unit!7400 () Unit!7387)

(assert (=> b!120231 (= e!78740 Unit!7400)))

(declare-fun b!120232 () Bool)

(declare-fun res!99531 () Bool)

(declare-fun e!78741 () Bool)

(assert (=> b!120232 (=> (not res!99531) (not e!78741))))

(declare-fun lt!186938 () tuple2!10052)

(assert (=> b!120232 (= res!99531 (isPrefixOf!0 (_1!5291 lt!186938) thiss!1305))))

(declare-fun b!120233 () Bool)

(declare-fun res!99530 () Bool)

(assert (=> b!120233 (=> (not res!99530) (not e!78741))))

(assert (=> b!120233 (= res!99530 (isPrefixOf!0 (_2!5291 lt!186938) (_2!5289 lt!186149)))))

(declare-fun d!38668 () Bool)

(assert (=> d!38668 e!78741))

(declare-fun res!99532 () Bool)

(assert (=> d!38668 (=> (not res!99532) (not e!78741))))

(assert (=> d!38668 (= res!99532 (isPrefixOf!0 (_1!5291 lt!186938) (_2!5291 lt!186938)))))

(declare-fun lt!186926 () BitStream!4318)

(assert (=> d!38668 (= lt!186938 (tuple2!10053 lt!186926 (_2!5289 lt!186149)))))

(declare-fun lt!186932 () Unit!7387)

(declare-fun lt!186924 () Unit!7387)

(assert (=> d!38668 (= lt!186932 lt!186924)))

(assert (=> d!38668 (isPrefixOf!0 lt!186926 (_2!5289 lt!186149))))

(assert (=> d!38668 (= lt!186924 (lemmaIsPrefixTransitive!0 lt!186926 (_2!5289 lt!186149) (_2!5289 lt!186149)))))

(declare-fun lt!186928 () Unit!7387)

(declare-fun lt!186925 () Unit!7387)

(assert (=> d!38668 (= lt!186928 lt!186925)))

(assert (=> d!38668 (isPrefixOf!0 lt!186926 (_2!5289 lt!186149))))

(assert (=> d!38668 (= lt!186925 (lemmaIsPrefixTransitive!0 lt!186926 thiss!1305 (_2!5289 lt!186149)))))

(declare-fun lt!186936 () Unit!7387)

(assert (=> d!38668 (= lt!186936 e!78740)))

(declare-fun c!7230 () Bool)

(assert (=> d!38668 (= c!7230 (not (= (size!2422 (buf!2850 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!186937 () Unit!7387)

(declare-fun lt!186930 () Unit!7387)

(assert (=> d!38668 (= lt!186937 lt!186930)))

(assert (=> d!38668 (isPrefixOf!0 (_2!5289 lt!186149) (_2!5289 lt!186149))))

(assert (=> d!38668 (= lt!186930 (lemmaIsPrefixRefl!0 (_2!5289 lt!186149)))))

(declare-fun lt!186921 () Unit!7387)

(declare-fun lt!186923 () Unit!7387)

(assert (=> d!38668 (= lt!186921 lt!186923)))

(assert (=> d!38668 (= lt!186923 (lemmaIsPrefixRefl!0 (_2!5289 lt!186149)))))

(declare-fun lt!186927 () Unit!7387)

(declare-fun lt!186935 () Unit!7387)

(assert (=> d!38668 (= lt!186927 lt!186935)))

(assert (=> d!38668 (isPrefixOf!0 lt!186926 lt!186926)))

(assert (=> d!38668 (= lt!186935 (lemmaIsPrefixRefl!0 lt!186926))))

(declare-fun lt!186922 () Unit!7387)

(declare-fun lt!186920 () Unit!7387)

(assert (=> d!38668 (= lt!186922 lt!186920)))

(assert (=> d!38668 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!38668 (= lt!186920 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!38668 (= lt!186926 (BitStream!4319 (buf!2850 (_2!5289 lt!186149)) (currentByte!5523 thiss!1305) (currentBit!5518 thiss!1305)))))

(assert (=> d!38668 (isPrefixOf!0 thiss!1305 (_2!5289 lt!186149))))

(assert (=> d!38668 (= (reader!0 thiss!1305 (_2!5289 lt!186149)) lt!186938)))

(declare-fun b!120234 () Bool)

(declare-fun lt!186934 () (_ BitVec 64))

(declare-fun lt!186939 () (_ BitVec 64))

(assert (=> b!120234 (= e!78741 (= (_1!5291 lt!186938) (withMovedBitIndex!0 (_2!5291 lt!186938) (bvsub lt!186934 lt!186939))))))

(assert (=> b!120234 (or (= (bvand lt!186934 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!186939 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!186934 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!186934 lt!186939) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!120234 (= lt!186939 (bitIndex!0 (size!2422 (buf!2850 (_2!5289 lt!186149))) (currentByte!5523 (_2!5289 lt!186149)) (currentBit!5518 (_2!5289 lt!186149))))))

(assert (=> b!120234 (= lt!186934 (bitIndex!0 (size!2422 (buf!2850 thiss!1305)) (currentByte!5523 thiss!1305) (currentBit!5518 thiss!1305)))))

(assert (= (and d!38668 c!7230) b!120230))

(assert (= (and d!38668 (not c!7230)) b!120231))

(assert (= (and d!38668 res!99532) b!120232))

(assert (= (and b!120232 res!99531) b!120233))

(assert (= (and b!120233 res!99530) b!120234))

(declare-fun m!181467 () Bool)

(assert (=> d!38668 m!181467))

(declare-fun m!181469 () Bool)

(assert (=> d!38668 m!181469))

(declare-fun m!181471 () Bool)

(assert (=> d!38668 m!181471))

(declare-fun m!181473 () Bool)

(assert (=> d!38668 m!181473))

(declare-fun m!181475 () Bool)

(assert (=> d!38668 m!181475))

(declare-fun m!181477 () Bool)

(assert (=> d!38668 m!181477))

(assert (=> d!38668 m!180957))

(declare-fun m!181479 () Bool)

(assert (=> d!38668 m!181479))

(declare-fun m!181481 () Bool)

(assert (=> d!38668 m!181481))

(declare-fun m!181483 () Bool)

(assert (=> d!38668 m!181483))

(declare-fun m!181485 () Bool)

(assert (=> d!38668 m!181485))

(declare-fun m!181487 () Bool)

(assert (=> b!120234 m!181487))

(assert (=> b!120234 m!180903))

(assert (=> b!120234 m!180907))

(declare-fun m!181489 () Bool)

(assert (=> b!120233 m!181489))

(assert (=> b!120230 m!180907))

(declare-fun m!181491 () Bool)

(assert (=> b!120230 m!181491))

(declare-fun m!181493 () Bool)

(assert (=> b!120230 m!181493))

(declare-fun m!181495 () Bool)

(assert (=> b!120232 m!181495))

(assert (=> b!119931 d!38668))

(declare-fun d!38670 () Bool)

(assert (=> d!38670 (isPrefixOf!0 thiss!1305 (_2!5289 lt!186149))))

(declare-fun lt!186942 () Unit!7387)

(declare-fun choose!30 (BitStream!4318 BitStream!4318 BitStream!4318) Unit!7387)

(assert (=> d!38670 (= lt!186942 (choose!30 thiss!1305 (_2!5289 lt!186134) (_2!5289 lt!186149)))))

(assert (=> d!38670 (isPrefixOf!0 thiss!1305 (_2!5289 lt!186134))))

(assert (=> d!38670 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5289 lt!186134) (_2!5289 lt!186149)) lt!186942)))

(declare-fun bs!9356 () Bool)

(assert (= bs!9356 d!38670))

(assert (=> bs!9356 m!180957))

(declare-fun m!181497 () Bool)

(assert (=> bs!9356 m!181497))

(assert (=> bs!9356 m!180919))

(assert (=> b!119931 d!38670))

(declare-fun d!38672 () Bool)

(assert (=> d!38672 (validate_offset_bits!1 ((_ sign_extend 32) (size!2422 (buf!2850 (_2!5289 lt!186149)))) ((_ sign_extend 32) (currentByte!5523 (_2!5289 lt!186134))) ((_ sign_extend 32) (currentBit!5518 (_2!5289 lt!186134))) lt!186135)))

(declare-fun lt!186943 () Unit!7387)

(assert (=> d!38672 (= lt!186943 (choose!9 (_2!5289 lt!186134) (buf!2850 (_2!5289 lt!186149)) lt!186135 (BitStream!4319 (buf!2850 (_2!5289 lt!186149)) (currentByte!5523 (_2!5289 lt!186134)) (currentBit!5518 (_2!5289 lt!186134)))))))

(assert (=> d!38672 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5289 lt!186134) (buf!2850 (_2!5289 lt!186149)) lt!186135) lt!186943)))

(declare-fun bs!9357 () Bool)

(assert (= bs!9357 d!38672))

(assert (=> bs!9357 m!180929))

(declare-fun m!181499 () Bool)

(assert (=> bs!9357 m!181499))

(assert (=> b!119931 d!38672))

(declare-fun d!38674 () Bool)

(declare-fun lt!186944 () tuple2!10078)

(assert (=> d!38674 (= lt!186944 (readBit!0 (_1!5291 lt!186146)))))

(assert (=> d!38674 (= (readBitPure!0 (_1!5291 lt!186146)) (tuple2!10051 (_2!5304 lt!186944) (_1!5304 lt!186944)))))

(declare-fun bs!9358 () Bool)

(assert (= bs!9358 d!38674))

(declare-fun m!181501 () Bool)

(assert (=> bs!9358 m!181501))

(assert (=> b!119931 d!38674))

(declare-fun d!38676 () Bool)

(declare-fun e!78742 () Bool)

(assert (=> d!38676 e!78742))

(declare-fun res!99534 () Bool)

(assert (=> d!38676 (=> (not res!99534) (not e!78742))))

(declare-fun lt!186949 () (_ BitVec 64))

(declare-fun lt!186945 () (_ BitVec 64))

(declare-fun lt!186947 () (_ BitVec 64))

(assert (=> d!38676 (= res!99534 (= lt!186947 (bvsub lt!186945 lt!186949)))))

(assert (=> d!38676 (or (= (bvand lt!186945 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!186949 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!186945 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!186945 lt!186949) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38676 (= lt!186949 (remainingBits!0 ((_ sign_extend 32) (size!2422 (buf!2850 (_1!5290 lt!186132)))) ((_ sign_extend 32) (currentByte!5523 (_1!5290 lt!186132))) ((_ sign_extend 32) (currentBit!5518 (_1!5290 lt!186132)))))))

(declare-fun lt!186948 () (_ BitVec 64))

(declare-fun lt!186946 () (_ BitVec 64))

(assert (=> d!38676 (= lt!186945 (bvmul lt!186948 lt!186946))))

(assert (=> d!38676 (or (= lt!186948 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!186946 (bvsdiv (bvmul lt!186948 lt!186946) lt!186948)))))

(assert (=> d!38676 (= lt!186946 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38676 (= lt!186948 ((_ sign_extend 32) (size!2422 (buf!2850 (_1!5290 lt!186132)))))))

(assert (=> d!38676 (= lt!186947 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5523 (_1!5290 lt!186132))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5518 (_1!5290 lt!186132)))))))

(assert (=> d!38676 (invariant!0 (currentBit!5518 (_1!5290 lt!186132)) (currentByte!5523 (_1!5290 lt!186132)) (size!2422 (buf!2850 (_1!5290 lt!186132))))))

(assert (=> d!38676 (= (bitIndex!0 (size!2422 (buf!2850 (_1!5290 lt!186132))) (currentByte!5523 (_1!5290 lt!186132)) (currentBit!5518 (_1!5290 lt!186132))) lt!186947)))

(declare-fun b!120235 () Bool)

(declare-fun res!99533 () Bool)

(assert (=> b!120235 (=> (not res!99533) (not e!78742))))

(assert (=> b!120235 (= res!99533 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!186947))))

(declare-fun b!120236 () Bool)

(declare-fun lt!186950 () (_ BitVec 64))

(assert (=> b!120236 (= e!78742 (bvsle lt!186947 (bvmul lt!186950 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!120236 (or (= lt!186950 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!186950 #b0000000000000000000000000000000000000000000000000000000000001000) lt!186950)))))

(assert (=> b!120236 (= lt!186950 ((_ sign_extend 32) (size!2422 (buf!2850 (_1!5290 lt!186132)))))))

(assert (= (and d!38676 res!99534) b!120235))

(assert (= (and b!120235 res!99533) b!120236))

(declare-fun m!181503 () Bool)

(assert (=> d!38676 m!181503))

(declare-fun m!181505 () Bool)

(assert (=> d!38676 m!181505))

(assert (=> b!119931 d!38676))

(declare-fun d!38678 () Bool)

(declare-fun lt!186951 () tuple2!10072)

(assert (=> d!38678 (= lt!186951 (readNLeastSignificantBitsLoop!0 (_1!5291 lt!186137) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!186136))))

(assert (=> d!38678 (= (readNLeastSignificantBitsLoopPure!0 (_1!5291 lt!186137) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!186136) (tuple2!10055 (_2!5301 lt!186951) (_1!5301 lt!186951)))))

(declare-fun bs!9359 () Bool)

(assert (= bs!9359 d!38678))

(declare-fun m!181507 () Bool)

(assert (=> bs!9359 m!181507))

(assert (=> b!119931 d!38678))

(declare-fun b!120237 () Bool)

(declare-fun e!78743 () Unit!7387)

(declare-fun lt!186963 () Unit!7387)

(assert (=> b!120237 (= e!78743 lt!186963)))

(declare-fun lt!186965 () (_ BitVec 64))

(assert (=> b!120237 (= lt!186965 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186961 () (_ BitVec 64))

(assert (=> b!120237 (= lt!186961 (bitIndex!0 (size!2422 (buf!2850 (_2!5289 lt!186134))) (currentByte!5523 (_2!5289 lt!186134)) (currentBit!5518 (_2!5289 lt!186134))))))

(assert (=> b!120237 (= lt!186963 (arrayBitRangesEqSymmetric!0 (buf!2850 (_2!5289 lt!186134)) (buf!2850 (_2!5289 lt!186149)) lt!186965 lt!186961))))

(assert (=> b!120237 (arrayBitRangesEq!0 (buf!2850 (_2!5289 lt!186149)) (buf!2850 (_2!5289 lt!186134)) lt!186965 lt!186961)))

(declare-fun b!120238 () Bool)

(declare-fun Unit!7402 () Unit!7387)

(assert (=> b!120238 (= e!78743 Unit!7402)))

(declare-fun b!120239 () Bool)

(declare-fun res!99536 () Bool)

(declare-fun e!78744 () Bool)

(assert (=> b!120239 (=> (not res!99536) (not e!78744))))

(declare-fun lt!186970 () tuple2!10052)

(assert (=> b!120239 (= res!99536 (isPrefixOf!0 (_1!5291 lt!186970) (_2!5289 lt!186134)))))

(declare-fun b!120240 () Bool)

(declare-fun res!99535 () Bool)

(assert (=> b!120240 (=> (not res!99535) (not e!78744))))

(assert (=> b!120240 (= res!99535 (isPrefixOf!0 (_2!5291 lt!186970) (_2!5289 lt!186149)))))

(declare-fun d!38680 () Bool)

(assert (=> d!38680 e!78744))

(declare-fun res!99537 () Bool)

(assert (=> d!38680 (=> (not res!99537) (not e!78744))))

(assert (=> d!38680 (= res!99537 (isPrefixOf!0 (_1!5291 lt!186970) (_2!5291 lt!186970)))))

(declare-fun lt!186958 () BitStream!4318)

(assert (=> d!38680 (= lt!186970 (tuple2!10053 lt!186958 (_2!5289 lt!186149)))))

(declare-fun lt!186964 () Unit!7387)

(declare-fun lt!186956 () Unit!7387)

(assert (=> d!38680 (= lt!186964 lt!186956)))

(assert (=> d!38680 (isPrefixOf!0 lt!186958 (_2!5289 lt!186149))))

(assert (=> d!38680 (= lt!186956 (lemmaIsPrefixTransitive!0 lt!186958 (_2!5289 lt!186149) (_2!5289 lt!186149)))))

(declare-fun lt!186960 () Unit!7387)

(declare-fun lt!186957 () Unit!7387)

(assert (=> d!38680 (= lt!186960 lt!186957)))

(assert (=> d!38680 (isPrefixOf!0 lt!186958 (_2!5289 lt!186149))))

(assert (=> d!38680 (= lt!186957 (lemmaIsPrefixTransitive!0 lt!186958 (_2!5289 lt!186134) (_2!5289 lt!186149)))))

(declare-fun lt!186968 () Unit!7387)

(assert (=> d!38680 (= lt!186968 e!78743)))

(declare-fun c!7231 () Bool)

(assert (=> d!38680 (= c!7231 (not (= (size!2422 (buf!2850 (_2!5289 lt!186134))) #b00000000000000000000000000000000)))))

(declare-fun lt!186969 () Unit!7387)

(declare-fun lt!186962 () Unit!7387)

(assert (=> d!38680 (= lt!186969 lt!186962)))

(assert (=> d!38680 (isPrefixOf!0 (_2!5289 lt!186149) (_2!5289 lt!186149))))

(assert (=> d!38680 (= lt!186962 (lemmaIsPrefixRefl!0 (_2!5289 lt!186149)))))

(declare-fun lt!186953 () Unit!7387)

(declare-fun lt!186955 () Unit!7387)

(assert (=> d!38680 (= lt!186953 lt!186955)))

(assert (=> d!38680 (= lt!186955 (lemmaIsPrefixRefl!0 (_2!5289 lt!186149)))))

(declare-fun lt!186959 () Unit!7387)

(declare-fun lt!186967 () Unit!7387)

(assert (=> d!38680 (= lt!186959 lt!186967)))

(assert (=> d!38680 (isPrefixOf!0 lt!186958 lt!186958)))

(assert (=> d!38680 (= lt!186967 (lemmaIsPrefixRefl!0 lt!186958))))

(declare-fun lt!186954 () Unit!7387)

(declare-fun lt!186952 () Unit!7387)

(assert (=> d!38680 (= lt!186954 lt!186952)))

(assert (=> d!38680 (isPrefixOf!0 (_2!5289 lt!186134) (_2!5289 lt!186134))))

(assert (=> d!38680 (= lt!186952 (lemmaIsPrefixRefl!0 (_2!5289 lt!186134)))))

(assert (=> d!38680 (= lt!186958 (BitStream!4319 (buf!2850 (_2!5289 lt!186149)) (currentByte!5523 (_2!5289 lt!186134)) (currentBit!5518 (_2!5289 lt!186134))))))

(assert (=> d!38680 (isPrefixOf!0 (_2!5289 lt!186134) (_2!5289 lt!186149))))

(assert (=> d!38680 (= (reader!0 (_2!5289 lt!186134) (_2!5289 lt!186149)) lt!186970)))

(declare-fun lt!186971 () (_ BitVec 64))

(declare-fun lt!186966 () (_ BitVec 64))

(declare-fun b!120241 () Bool)

(assert (=> b!120241 (= e!78744 (= (_1!5291 lt!186970) (withMovedBitIndex!0 (_2!5291 lt!186970) (bvsub lt!186966 lt!186971))))))

(assert (=> b!120241 (or (= (bvand lt!186966 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!186971 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!186966 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!186966 lt!186971) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!120241 (= lt!186971 (bitIndex!0 (size!2422 (buf!2850 (_2!5289 lt!186149))) (currentByte!5523 (_2!5289 lt!186149)) (currentBit!5518 (_2!5289 lt!186149))))))

(assert (=> b!120241 (= lt!186966 (bitIndex!0 (size!2422 (buf!2850 (_2!5289 lt!186134))) (currentByte!5523 (_2!5289 lt!186134)) (currentBit!5518 (_2!5289 lt!186134))))))

(assert (= (and d!38680 c!7231) b!120237))

(assert (= (and d!38680 (not c!7231)) b!120238))

(assert (= (and d!38680 res!99537) b!120239))

(assert (= (and b!120239 res!99536) b!120240))

(assert (= (and b!120240 res!99535) b!120241))

(assert (=> d!38680 m!181467))

(declare-fun m!181509 () Bool)

(assert (=> d!38680 m!181509))

(declare-fun m!181511 () Bool)

(assert (=> d!38680 m!181511))

(declare-fun m!181513 () Bool)

(assert (=> d!38680 m!181513))

(declare-fun m!181515 () Bool)

(assert (=> d!38680 m!181515))

(declare-fun m!181517 () Bool)

(assert (=> d!38680 m!181517))

(declare-fun m!181519 () Bool)

(assert (=> d!38680 m!181519))

(declare-fun m!181521 () Bool)

(assert (=> d!38680 m!181521))

(declare-fun m!181523 () Bool)

(assert (=> d!38680 m!181523))

(declare-fun m!181525 () Bool)

(assert (=> d!38680 m!181525))

(assert (=> d!38680 m!181485))

(declare-fun m!181527 () Bool)

(assert (=> b!120241 m!181527))

(assert (=> b!120241 m!180903))

(assert (=> b!120241 m!180905))

(declare-fun m!181529 () Bool)

(assert (=> b!120240 m!181529))

(assert (=> b!120237 m!180905))

(declare-fun m!181531 () Bool)

(assert (=> b!120237 m!181531))

(declare-fun m!181533 () Bool)

(assert (=> b!120237 m!181533))

(declare-fun m!181535 () Bool)

(assert (=> b!120239 m!181535))

(assert (=> b!119931 d!38680))

(declare-fun d!38682 () Bool)

(assert (=> d!38682 (= (array_inv!2224 (buf!2850 thiss!1305)) (bvsge (size!2422 (buf!2850 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!119933 d!38682))

(declare-fun d!38684 () Bool)

(assert (=> d!38684 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5518 thiss!1305) (currentByte!5523 thiss!1305) (size!2422 (buf!2850 thiss!1305))))))

(declare-fun bs!9360 () Bool)

(assert (= bs!9360 d!38684))

(assert (=> bs!9360 m!181149))

(assert (=> start!23678 d!38684))

(declare-fun d!38686 () Bool)

(declare-fun e!78745 () Bool)

(assert (=> d!38686 e!78745))

(declare-fun res!99539 () Bool)

(assert (=> d!38686 (=> (not res!99539) (not e!78745))))

(declare-fun lt!186976 () (_ BitVec 64))

(declare-fun lt!186974 () (_ BitVec 64))

(declare-fun lt!186972 () (_ BitVec 64))

(assert (=> d!38686 (= res!99539 (= lt!186974 (bvsub lt!186972 lt!186976)))))

(assert (=> d!38686 (or (= (bvand lt!186972 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!186976 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!186972 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!186972 lt!186976) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38686 (= lt!186976 (remainingBits!0 ((_ sign_extend 32) (size!2422 (buf!2850 (_1!5290 lt!186153)))) ((_ sign_extend 32) (currentByte!5523 (_1!5290 lt!186153))) ((_ sign_extend 32) (currentBit!5518 (_1!5290 lt!186153)))))))

(declare-fun lt!186975 () (_ BitVec 64))

(declare-fun lt!186973 () (_ BitVec 64))

(assert (=> d!38686 (= lt!186972 (bvmul lt!186975 lt!186973))))

(assert (=> d!38686 (or (= lt!186975 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!186973 (bvsdiv (bvmul lt!186975 lt!186973) lt!186975)))))

(assert (=> d!38686 (= lt!186973 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38686 (= lt!186975 ((_ sign_extend 32) (size!2422 (buf!2850 (_1!5290 lt!186153)))))))

(assert (=> d!38686 (= lt!186974 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5523 (_1!5290 lt!186153))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5518 (_1!5290 lt!186153)))))))

(assert (=> d!38686 (invariant!0 (currentBit!5518 (_1!5290 lt!186153)) (currentByte!5523 (_1!5290 lt!186153)) (size!2422 (buf!2850 (_1!5290 lt!186153))))))

(assert (=> d!38686 (= (bitIndex!0 (size!2422 (buf!2850 (_1!5290 lt!186153))) (currentByte!5523 (_1!5290 lt!186153)) (currentBit!5518 (_1!5290 lt!186153))) lt!186974)))

(declare-fun b!120242 () Bool)

(declare-fun res!99538 () Bool)

(assert (=> b!120242 (=> (not res!99538) (not e!78745))))

(assert (=> b!120242 (= res!99538 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!186974))))

(declare-fun b!120243 () Bool)

(declare-fun lt!186977 () (_ BitVec 64))

(assert (=> b!120243 (= e!78745 (bvsle lt!186974 (bvmul lt!186977 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!120243 (or (= lt!186977 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!186977 #b0000000000000000000000000000000000000000000000000000000000001000) lt!186977)))))

(assert (=> b!120243 (= lt!186977 ((_ sign_extend 32) (size!2422 (buf!2850 (_1!5290 lt!186153)))))))

(assert (= (and d!38686 res!99539) b!120242))

(assert (= (and b!120242 res!99538) b!120243))

(declare-fun m!181537 () Bool)

(assert (=> d!38686 m!181537))

(declare-fun m!181539 () Bool)

(assert (=> d!38686 m!181539))

(assert (=> b!119924 d!38686))

(declare-fun d!38688 () Bool)

(declare-fun lt!186978 () tuple2!10078)

(assert (=> d!38688 (= lt!186978 (readBit!0 (readerFrom!0 (_2!5289 lt!186134) (currentBit!5518 thiss!1305) (currentByte!5523 thiss!1305))))))

(assert (=> d!38688 (= (readBitPure!0 (readerFrom!0 (_2!5289 lt!186134) (currentBit!5518 thiss!1305) (currentByte!5523 thiss!1305))) (tuple2!10051 (_2!5304 lt!186978) (_1!5304 lt!186978)))))

(declare-fun bs!9361 () Bool)

(assert (= bs!9361 d!38688))

(assert (=> bs!9361 m!180925))

(declare-fun m!181541 () Bool)

(assert (=> bs!9361 m!181541))

(assert (=> b!119934 d!38688))

(declare-fun d!38690 () Bool)

(declare-fun e!78748 () Bool)

(assert (=> d!38690 e!78748))

(declare-fun res!99543 () Bool)

(assert (=> d!38690 (=> (not res!99543) (not e!78748))))

(assert (=> d!38690 (= res!99543 (invariant!0 (currentBit!5518 (_2!5289 lt!186134)) (currentByte!5523 (_2!5289 lt!186134)) (size!2422 (buf!2850 (_2!5289 lt!186134)))))))

(assert (=> d!38690 (= (readerFrom!0 (_2!5289 lt!186134) (currentBit!5518 thiss!1305) (currentByte!5523 thiss!1305)) (BitStream!4319 (buf!2850 (_2!5289 lt!186134)) (currentByte!5523 thiss!1305) (currentBit!5518 thiss!1305)))))

(declare-fun b!120246 () Bool)

(assert (=> b!120246 (= e!78748 (invariant!0 (currentBit!5518 thiss!1305) (currentByte!5523 thiss!1305) (size!2422 (buf!2850 (_2!5289 lt!186134)))))))

(assert (= (and d!38690 res!99543) b!120246))

(assert (=> d!38690 m!181131))

(assert (=> b!120246 m!180967))

(assert (=> b!119934 d!38690))

(declare-fun d!38692 () Bool)

(declare-fun res!99554 () Bool)

(declare-fun e!78756 () Bool)

(assert (=> d!38692 (=> (not res!99554) (not e!78756))))

(assert (=> d!38692 (= res!99554 (= (size!2422 (buf!2850 thiss!1305)) (size!2422 (buf!2850 (_2!5289 lt!186134)))))))

(assert (=> d!38692 (= (isPrefixOf!0 thiss!1305 (_2!5289 lt!186134)) e!78756)))

(declare-fun b!120260 () Bool)

(declare-fun res!99553 () Bool)

(assert (=> b!120260 (=> (not res!99553) (not e!78756))))

(assert (=> b!120260 (= res!99553 (bvsle (bitIndex!0 (size!2422 (buf!2850 thiss!1305)) (currentByte!5523 thiss!1305) (currentBit!5518 thiss!1305)) (bitIndex!0 (size!2422 (buf!2850 (_2!5289 lt!186134))) (currentByte!5523 (_2!5289 lt!186134)) (currentBit!5518 (_2!5289 lt!186134)))))))

(declare-fun b!120261 () Bool)

(declare-fun e!78757 () Bool)

(assert (=> b!120261 (= e!78756 e!78757)))

(declare-fun res!99555 () Bool)

(assert (=> b!120261 (=> res!99555 e!78757)))

(assert (=> b!120261 (= res!99555 (= (size!2422 (buf!2850 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!120262 () Bool)

(assert (=> b!120262 (= e!78757 (arrayBitRangesEq!0 (buf!2850 thiss!1305) (buf!2850 (_2!5289 lt!186134)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2422 (buf!2850 thiss!1305)) (currentByte!5523 thiss!1305) (currentBit!5518 thiss!1305))))))

(assert (= (and d!38692 res!99554) b!120260))

(assert (= (and b!120260 res!99553) b!120261))

(assert (= (and b!120261 (not res!99555)) b!120262))

(assert (=> b!120260 m!180907))

(assert (=> b!120260 m!180905))

(assert (=> b!120262 m!180907))

(assert (=> b!120262 m!180907))

(declare-fun m!181543 () Bool)

(assert (=> b!120262 m!181543))

(assert (=> b!119923 d!38692))

(declare-fun d!38694 () Bool)

(assert (=> d!38694 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!119925 d!38694))

(declare-fun d!38696 () Bool)

(assert (=> d!38696 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2422 (buf!2850 thiss!1305))) ((_ sign_extend 32) (currentByte!5523 thiss!1305)) ((_ sign_extend 32) (currentBit!5518 thiss!1305)) lt!186133) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2422 (buf!2850 thiss!1305))) ((_ sign_extend 32) (currentByte!5523 thiss!1305)) ((_ sign_extend 32) (currentBit!5518 thiss!1305))) lt!186133))))

(declare-fun bs!9362 () Bool)

(assert (= bs!9362 d!38696))

(assert (=> bs!9362 m!181147))

(assert (=> b!119935 d!38696))

(push 1)

(assert (not b!120240))

(assert (not b!120260))

(assert (not b!120176))

(assert (not d!38574))

(assert (not d!38688))

(assert (not d!38678))

(assert (not b!120171))

(assert (not b!120174))

(assert (not d!38562))

(assert (not b!120056))

(assert (not b!120230))

(assert (not d!38566))

(assert (not b!120193))

(assert (not b!120191))

(assert (not d!38680))

(assert (not d!38674))

(assert (not d!38696))

(assert (not b!120055))

(assert (not d!38578))

(assert (not b!120239))

(assert (not b!120233))

(assert (not d!38670))

(assert (not b!120234))

(assert (not d!38668))

(assert (not b!120053))

(assert (not b!120054))

(assert (not b!120237))

(assert (not d!38684))

(assert (not d!38564))

(assert (not b!120178))

(assert (not b!120177))

(assert (not d!38558))

(assert (not d!38664))

(assert (not d!38654))

(assert (not d!38658))

(assert (not d!38672))

(assert (not d!38580))

(assert (not bm!1562))

(assert (not b!120179))

(assert (not d!38552))

(assert (not b!120181))

(assert (not d!38554))

(assert (not d!38686))

(assert (not b!120173))

(assert (not b!120232))

(assert (not d!38560))

(assert (not b!120246))

(assert (not d!38676))

(assert (not b!120262))

(assert (not d!38690))

(assert (not b!120241))

(assert (not d!38662))

(assert (not d!38660))

(assert (not b!120180))

(assert (not d!38556))

(assert (not d!38666))

(check-sat)

(pop 1)

(push 1)

(check-sat)

