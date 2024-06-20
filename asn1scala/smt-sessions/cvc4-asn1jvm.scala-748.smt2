; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21470 () Bool)

(assert start!21470)

(declare-fun b!108029 () Bool)

(declare-fun res!89036 () Bool)

(declare-fun e!70700 () Bool)

(assert (=> b!108029 (=> (not res!89036) (not e!70700))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!108029 (= res!89036 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!108030 () Bool)

(declare-fun e!70705 () Bool)

(assert (=> b!108030 (= e!70705 e!70700)))

(declare-fun res!89037 () Bool)

(assert (=> b!108030 (=> (not res!89037) (not e!70700))))

(declare-datatypes ((array!4938 0))(
  ( (array!4939 (arr!2840 (Array (_ BitVec 32) (_ BitVec 8))) (size!2247 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3968 0))(
  ( (BitStream!3969 (buf!2635 array!4938) (currentByte!5165 (_ BitVec 32)) (currentBit!5160 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3968)

(declare-fun lt!162273 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!108030 (= res!89037 (validate_offset_bits!1 ((_ sign_extend 32) (size!2247 (buf!2635 thiss!1305))) ((_ sign_extend 32) (currentByte!5165 thiss!1305)) ((_ sign_extend 32) (currentBit!5160 thiss!1305)) lt!162273))))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!108030 (= lt!162273 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!108031 () Bool)

(declare-fun e!70707 () Bool)

(declare-datatypes ((tuple2!8896 0))(
  ( (tuple2!8897 (_1!4705 BitStream!3968) (_2!4705 Bool)) )
))
(declare-fun lt!162278 () tuple2!8896)

(declare-fun lt!162277 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!108031 (= e!70707 (= (bitIndex!0 (size!2247 (buf!2635 (_1!4705 lt!162278))) (currentByte!5165 (_1!4705 lt!162278)) (currentBit!5160 (_1!4705 lt!162278))) lt!162277))))

(declare-fun b!108032 () Bool)

(declare-fun e!70699 () Bool)

(declare-fun array_inv!2049 (array!4938) Bool)

(assert (=> b!108032 (= e!70699 (array_inv!2049 (buf!2635 thiss!1305)))))

(declare-fun b!108033 () Bool)

(declare-fun res!89039 () Bool)

(assert (=> b!108033 (=> (not res!89039) (not e!70700))))

(assert (=> b!108033 (= res!89039 (bvslt i!615 nBits!396))))

(declare-fun b!108034 () Bool)

(declare-fun e!70708 () Bool)

(declare-fun lt!162280 () tuple2!8896)

(declare-fun lt!162281 () tuple2!8896)

(assert (=> b!108034 (= e!70708 (= (_2!4705 lt!162280) (_2!4705 lt!162281)))))

(declare-fun b!108035 () Bool)

(declare-fun e!70703 () Bool)

(declare-fun e!70698 () Bool)

(assert (=> b!108035 (= e!70703 e!70698)))

(declare-fun res!89035 () Bool)

(assert (=> b!108035 (=> (not res!89035) (not e!70698))))

(declare-fun lt!162264 () (_ BitVec 64))

(assert (=> b!108035 (= res!89035 (= lt!162277 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!162264)))))

(declare-datatypes ((Unit!6612 0))(
  ( (Unit!6613) )
))
(declare-datatypes ((tuple2!8898 0))(
  ( (tuple2!8899 (_1!4706 Unit!6612) (_2!4706 BitStream!3968)) )
))
(declare-fun lt!162271 () tuple2!8898)

(assert (=> b!108035 (= lt!162277 (bitIndex!0 (size!2247 (buf!2635 (_2!4706 lt!162271))) (currentByte!5165 (_2!4706 lt!162271)) (currentBit!5160 (_2!4706 lt!162271))))))

(assert (=> b!108035 (= lt!162264 (bitIndex!0 (size!2247 (buf!2635 thiss!1305)) (currentByte!5165 thiss!1305) (currentBit!5160 thiss!1305)))))

(declare-datatypes ((tuple2!8900 0))(
  ( (tuple2!8901 (_1!4707 BitStream!3968) (_2!4707 (_ BitVec 64))) )
))
(declare-fun lt!162274 () tuple2!8900)

(declare-datatypes ((tuple2!8902 0))(
  ( (tuple2!8903 (_1!4708 BitStream!3968) (_2!4708 BitStream!3968)) )
))
(declare-fun lt!162261 () tuple2!8902)

(declare-fun b!108036 () Bool)

(declare-fun lt!162268 () tuple2!8902)

(declare-fun lt!162272 () (_ BitVec 64))

(declare-fun lt!162269 () (_ BitVec 64))

(declare-fun e!70701 () Bool)

(declare-fun lt!162258 () tuple2!8900)

(declare-fun lt!162256 () BitStream!3968)

(assert (=> b!108036 (= e!70701 (and (= lt!162272 (bvsub lt!162269 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!4708 lt!162261) lt!162256)) (and (= (_2!4707 lt!162258) (_2!4707 lt!162274)) (= (_1!4707 lt!162258) (_2!4708 lt!162268))))))))

(declare-fun b!108037 () Bool)

(declare-fun e!70709 () Bool)

(declare-fun lt!162262 () tuple2!8898)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!108037 (= e!70709 (invariant!0 (currentBit!5160 (_2!4706 lt!162262)) (currentByte!5165 (_2!4706 lt!162262)) (size!2247 (buf!2635 (_2!4706 lt!162262)))))))

(declare-fun b!108038 () Bool)

(declare-fun res!89040 () Bool)

(assert (=> b!108038 (=> (not res!89040) (not e!70698))))

(declare-fun isPrefixOf!0 (BitStream!3968 BitStream!3968) Bool)

(assert (=> b!108038 (= res!89040 (isPrefixOf!0 thiss!1305 (_2!4706 lt!162271)))))

(declare-fun b!108039 () Bool)

(assert (=> b!108039 (= e!70698 e!70707)))

(declare-fun res!89038 () Bool)

(assert (=> b!108039 (=> (not res!89038) (not e!70707))))

(declare-fun lt!162257 () Bool)

(assert (=> b!108039 (= res!89038 (and (= (_2!4705 lt!162278) lt!162257) (= (_1!4705 lt!162278) (_2!4706 lt!162271))))))

(declare-fun readBitPure!0 (BitStream!3968) tuple2!8896)

(declare-fun readerFrom!0 (BitStream!3968 (_ BitVec 32) (_ BitVec 32)) BitStream!3968)

(assert (=> b!108039 (= lt!162278 (readBitPure!0 (readerFrom!0 (_2!4706 lt!162271) (currentBit!5160 thiss!1305) (currentByte!5165 thiss!1305))))))

(declare-fun b!108040 () Bool)

(declare-fun e!70702 () Bool)

(assert (=> b!108040 (= e!70702 (invariant!0 (currentBit!5160 thiss!1305) (currentByte!5165 thiss!1305) (size!2247 (buf!2635 (_2!4706 lt!162262)))))))

(declare-fun res!89045 () Bool)

(assert (=> start!21470 (=> (not res!89045) (not e!70705))))

(assert (=> start!21470 (= res!89045 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21470 e!70705))

(assert (=> start!21470 true))

(declare-fun inv!12 (BitStream!3968) Bool)

(assert (=> start!21470 (and (inv!12 thiss!1305) e!70699)))

(declare-fun b!108041 () Bool)

(declare-fun e!70706 () Bool)

(assert (=> b!108041 (= e!70706 e!70709)))

(declare-fun res!89042 () Bool)

(assert (=> b!108041 (=> res!89042 e!70709)))

(assert (=> b!108041 (= res!89042 (or (not (= (_1!4708 lt!162261) lt!162256)) (not (= (size!2247 (buf!2635 thiss!1305)) (size!2247 (buf!2635 (_2!4706 lt!162262)))))))))

(assert (=> b!108041 e!70701))

(declare-fun res!89046 () Bool)

(assert (=> b!108041 (=> (not res!89046) (not e!70701))))

(declare-fun lt!162275 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!3968 (_ BitVec 64)) BitStream!3968)

(assert (=> b!108041 (= res!89046 (= (_1!4708 lt!162261) (withMovedBitIndex!0 (_2!4708 lt!162261) (bvsub lt!162269 lt!162275))))))

(assert (=> b!108041 (= lt!162269 (bitIndex!0 (size!2247 (buf!2635 (_2!4706 lt!162271))) (currentByte!5165 (_2!4706 lt!162271)) (currentBit!5160 (_2!4706 lt!162271))))))

(assert (=> b!108041 (= (_1!4708 lt!162268) (withMovedBitIndex!0 (_2!4708 lt!162268) (bvsub lt!162272 lt!162275)))))

(assert (=> b!108041 (= lt!162275 (bitIndex!0 (size!2247 (buf!2635 (_2!4706 lt!162262))) (currentByte!5165 (_2!4706 lt!162262)) (currentBit!5160 (_2!4706 lt!162262))))))

(assert (=> b!108041 (= lt!162272 (bitIndex!0 (size!2247 (buf!2635 thiss!1305)) (currentByte!5165 thiss!1305) (currentBit!5160 thiss!1305)))))

(declare-fun lt!162254 () tuple2!8900)

(assert (=> b!108041 (and (= (_2!4707 lt!162258) (_2!4707 lt!162254)) (= (_1!4707 lt!162258) (_1!4707 lt!162254)))))

(declare-fun lt!162265 () (_ BitVec 64))

(declare-fun lt!162259 () Unit!6612)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3968 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6612)

(assert (=> b!108041 (= lt!162259 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4708 lt!162268) nBits!396 i!615 lt!162265))))

(declare-fun lt!162279 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3968 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8900)

(assert (=> b!108041 (= lt!162254 (readNLeastSignificantBitsLoopPure!0 lt!162256 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!162279))))

(assert (=> b!108041 (= lt!162256 (withMovedBitIndex!0 (_1!4708 lt!162268) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!108042 () Bool)

(assert (=> b!108042 (= e!70700 (not e!70706))))

(declare-fun res!89043 () Bool)

(assert (=> b!108042 (=> res!89043 e!70706)))

(assert (=> b!108042 (= res!89043 (not (= (_1!4707 lt!162274) (_2!4708 lt!162261))))))

(assert (=> b!108042 (= lt!162274 (readNLeastSignificantBitsLoopPure!0 (_1!4708 lt!162261) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!162279))))

(declare-fun lt!162267 () (_ BitVec 64))

(assert (=> b!108042 (validate_offset_bits!1 ((_ sign_extend 32) (size!2247 (buf!2635 (_2!4706 lt!162262)))) ((_ sign_extend 32) (currentByte!5165 (_2!4706 lt!162271))) ((_ sign_extend 32) (currentBit!5160 (_2!4706 lt!162271))) lt!162267)))

(declare-fun lt!162255 () Unit!6612)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3968 array!4938 (_ BitVec 64)) Unit!6612)

(assert (=> b!108042 (= lt!162255 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4706 lt!162271) (buf!2635 (_2!4706 lt!162262)) lt!162267))))

(assert (=> b!108042 (= lt!162267 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!162260 () (_ BitVec 64))

(declare-fun lt!162253 () tuple2!8896)

(assert (=> b!108042 (= lt!162279 (bvor lt!162265 (ite (_2!4705 lt!162253) lt!162260 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!108042 (= lt!162258 (readNLeastSignificantBitsLoopPure!0 (_1!4708 lt!162268) nBits!396 i!615 lt!162265))))

(assert (=> b!108042 (validate_offset_bits!1 ((_ sign_extend 32) (size!2247 (buf!2635 (_2!4706 lt!162262)))) ((_ sign_extend 32) (currentByte!5165 thiss!1305)) ((_ sign_extend 32) (currentBit!5160 thiss!1305)) lt!162273)))

(declare-fun lt!162270 () Unit!6612)

(assert (=> b!108042 (= lt!162270 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2635 (_2!4706 lt!162262)) lt!162273))))

(assert (=> b!108042 (= lt!162265 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!108042 (= (_2!4705 lt!162253) lt!162257)))

(assert (=> b!108042 (= lt!162253 (readBitPure!0 (_1!4708 lt!162268)))))

(declare-fun reader!0 (BitStream!3968 BitStream!3968) tuple2!8902)

(assert (=> b!108042 (= lt!162261 (reader!0 (_2!4706 lt!162271) (_2!4706 lt!162262)))))

(assert (=> b!108042 (= lt!162268 (reader!0 thiss!1305 (_2!4706 lt!162262)))))

(assert (=> b!108042 e!70708))

(declare-fun res!89044 () Bool)

(assert (=> b!108042 (=> (not res!89044) (not e!70708))))

(assert (=> b!108042 (= res!89044 (= (bitIndex!0 (size!2247 (buf!2635 (_1!4705 lt!162280))) (currentByte!5165 (_1!4705 lt!162280)) (currentBit!5160 (_1!4705 lt!162280))) (bitIndex!0 (size!2247 (buf!2635 (_1!4705 lt!162281))) (currentByte!5165 (_1!4705 lt!162281)) (currentBit!5160 (_1!4705 lt!162281)))))))

(declare-fun lt!162263 () Unit!6612)

(declare-fun lt!162266 () BitStream!3968)

(declare-fun readBitPrefixLemma!0 (BitStream!3968 BitStream!3968) Unit!6612)

(assert (=> b!108042 (= lt!162263 (readBitPrefixLemma!0 lt!162266 (_2!4706 lt!162262)))))

(assert (=> b!108042 (= lt!162281 (readBitPure!0 (BitStream!3969 (buf!2635 (_2!4706 lt!162262)) (currentByte!5165 thiss!1305) (currentBit!5160 thiss!1305))))))

(assert (=> b!108042 (= lt!162280 (readBitPure!0 lt!162266))))

(assert (=> b!108042 (= lt!162266 (BitStream!3969 (buf!2635 (_2!4706 lt!162271)) (currentByte!5165 thiss!1305) (currentBit!5160 thiss!1305)))))

(assert (=> b!108042 e!70702))

(declare-fun res!89047 () Bool)

(assert (=> b!108042 (=> (not res!89047) (not e!70702))))

(assert (=> b!108042 (= res!89047 (isPrefixOf!0 thiss!1305 (_2!4706 lt!162262)))))

(declare-fun lt!162276 () Unit!6612)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3968 BitStream!3968 BitStream!3968) Unit!6612)

(assert (=> b!108042 (= lt!162276 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4706 lt!162271) (_2!4706 lt!162262)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3968 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8898)

(assert (=> b!108042 (= lt!162262 (appendNLeastSignificantBitsLoop!0 (_2!4706 lt!162271) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!108042 e!70703))

(declare-fun res!89034 () Bool)

(assert (=> b!108042 (=> (not res!89034) (not e!70703))))

(assert (=> b!108042 (= res!89034 (= (size!2247 (buf!2635 thiss!1305)) (size!2247 (buf!2635 (_2!4706 lt!162271)))))))

(declare-fun appendBit!0 (BitStream!3968 Bool) tuple2!8898)

(assert (=> b!108042 (= lt!162271 (appendBit!0 thiss!1305 lt!162257))))

(assert (=> b!108042 (= lt!162257 (not (= (bvand v!199 lt!162260) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!108042 (= lt!162260 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!108043 () Bool)

(declare-fun res!89041 () Bool)

(assert (=> b!108043 (=> (not res!89041) (not e!70702))))

(assert (=> b!108043 (= res!89041 (invariant!0 (currentBit!5160 thiss!1305) (currentByte!5165 thiss!1305) (size!2247 (buf!2635 (_2!4706 lt!162271)))))))

(assert (= (and start!21470 res!89045) b!108030))

(assert (= (and b!108030 res!89037) b!108029))

(assert (= (and b!108029 res!89036) b!108033))

(assert (= (and b!108033 res!89039) b!108042))

(assert (= (and b!108042 res!89034) b!108035))

(assert (= (and b!108035 res!89035) b!108038))

(assert (= (and b!108038 res!89040) b!108039))

(assert (= (and b!108039 res!89038) b!108031))

(assert (= (and b!108042 res!89047) b!108043))

(assert (= (and b!108043 res!89041) b!108040))

(assert (= (and b!108042 res!89044) b!108034))

(assert (= (and b!108042 (not res!89043)) b!108041))

(assert (= (and b!108041 res!89046) b!108036))

(assert (= (and b!108041 (not res!89042)) b!108037))

(assert (= start!21470 b!108032))

(declare-fun m!159847 () Bool)

(assert (=> b!108037 m!159847))

(declare-fun m!159849 () Bool)

(assert (=> b!108039 m!159849))

(assert (=> b!108039 m!159849))

(declare-fun m!159851 () Bool)

(assert (=> b!108039 m!159851))

(declare-fun m!159853 () Bool)

(assert (=> b!108042 m!159853))

(declare-fun m!159855 () Bool)

(assert (=> b!108042 m!159855))

(declare-fun m!159857 () Bool)

(assert (=> b!108042 m!159857))

(declare-fun m!159859 () Bool)

(assert (=> b!108042 m!159859))

(declare-fun m!159861 () Bool)

(assert (=> b!108042 m!159861))

(declare-fun m!159863 () Bool)

(assert (=> b!108042 m!159863))

(declare-fun m!159865 () Bool)

(assert (=> b!108042 m!159865))

(declare-fun m!159867 () Bool)

(assert (=> b!108042 m!159867))

(declare-fun m!159869 () Bool)

(assert (=> b!108042 m!159869))

(declare-fun m!159871 () Bool)

(assert (=> b!108042 m!159871))

(declare-fun m!159873 () Bool)

(assert (=> b!108042 m!159873))

(declare-fun m!159875 () Bool)

(assert (=> b!108042 m!159875))

(declare-fun m!159877 () Bool)

(assert (=> b!108042 m!159877))

(declare-fun m!159879 () Bool)

(assert (=> b!108042 m!159879))

(declare-fun m!159881 () Bool)

(assert (=> b!108042 m!159881))

(declare-fun m!159883 () Bool)

(assert (=> b!108042 m!159883))

(declare-fun m!159885 () Bool)

(assert (=> b!108042 m!159885))

(declare-fun m!159887 () Bool)

(assert (=> b!108042 m!159887))

(declare-fun m!159889 () Bool)

(assert (=> b!108042 m!159889))

(declare-fun m!159891 () Bool)

(assert (=> b!108035 m!159891))

(declare-fun m!159893 () Bool)

(assert (=> b!108035 m!159893))

(declare-fun m!159895 () Bool)

(assert (=> b!108038 m!159895))

(declare-fun m!159897 () Bool)

(assert (=> b!108032 m!159897))

(declare-fun m!159899 () Bool)

(assert (=> b!108040 m!159899))

(declare-fun m!159901 () Bool)

(assert (=> b!108041 m!159901))

(declare-fun m!159903 () Bool)

(assert (=> b!108041 m!159903))

(assert (=> b!108041 m!159893))

(declare-fun m!159905 () Bool)

(assert (=> b!108041 m!159905))

(declare-fun m!159907 () Bool)

(assert (=> b!108041 m!159907))

(assert (=> b!108041 m!159891))

(declare-fun m!159909 () Bool)

(assert (=> b!108041 m!159909))

(declare-fun m!159911 () Bool)

(assert (=> b!108041 m!159911))

(declare-fun m!159913 () Bool)

(assert (=> b!108043 m!159913))

(declare-fun m!159915 () Bool)

(assert (=> b!108029 m!159915))

(declare-fun m!159917 () Bool)

(assert (=> b!108030 m!159917))

(declare-fun m!159919 () Bool)

(assert (=> start!21470 m!159919))

(declare-fun m!159921 () Bool)

(assert (=> b!108031 m!159921))

(push 1)

(assert (not b!108037))

(assert (not b!108038))

(assert (not start!21470))

(assert (not b!108029))

(assert (not b!108039))

(assert (not b!108035))

(assert (not b!108042))

(assert (not b!108031))

(assert (not b!108040))

(assert (not b!108030))

(assert (not b!108041))

(assert (not b!108043))

(assert (not b!108032))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!34198 () Bool)

(declare-fun e!70732 () Bool)

(assert (=> d!34198 e!70732))

(declare-fun res!89087 () Bool)

(assert (=> d!34198 (=> (not res!89087) (not e!70732))))

(declare-fun lt!162351 () (_ BitVec 64))

(declare-fun lt!162350 () BitStream!3968)

(assert (=> d!34198 (= res!89087 (= (bvadd lt!162351 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2247 (buf!2635 lt!162350)) (currentByte!5165 lt!162350) (currentBit!5160 lt!162350))))))

(assert (=> d!34198 (or (not (= (bvand lt!162351 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!162351 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!162351 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34198 (= lt!162351 (bitIndex!0 (size!2247 (buf!2635 (_1!4708 lt!162268))) (currentByte!5165 (_1!4708 lt!162268)) (currentBit!5160 (_1!4708 lt!162268))))))

(declare-fun moveBitIndex!0 (BitStream!3968 (_ BitVec 64)) tuple2!8898)

(assert (=> d!34198 (= lt!162350 (_2!4706 (moveBitIndex!0 (_1!4708 lt!162268) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!3968 (_ BitVec 64)) Bool)

(assert (=> d!34198 (moveBitIndexPrecond!0 (_1!4708 lt!162268) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!34198 (= (withMovedBitIndex!0 (_1!4708 lt!162268) #b0000000000000000000000000000000000000000000000000000000000000001) lt!162350)))

(declare-fun b!108084 () Bool)

(assert (=> b!108084 (= e!70732 (= (size!2247 (buf!2635 (_1!4708 lt!162268))) (size!2247 (buf!2635 lt!162350))))))

(assert (= (and d!34198 res!89087) b!108084))

(declare-fun m!159963 () Bool)

(assert (=> d!34198 m!159963))

(declare-fun m!159965 () Bool)

(assert (=> d!34198 m!159965))

(declare-fun m!159967 () Bool)

(assert (=> d!34198 m!159967))

(declare-fun m!159969 () Bool)

(assert (=> d!34198 m!159969))

(assert (=> b!108041 d!34198))

(declare-fun d!34208 () Bool)

(declare-fun e!70733 () Bool)

(assert (=> d!34208 e!70733))

(declare-fun res!89088 () Bool)

(assert (=> d!34208 (=> (not res!89088) (not e!70733))))

(declare-fun lt!162353 () (_ BitVec 64))

(declare-fun lt!162352 () BitStream!3968)

(assert (=> d!34208 (= res!89088 (= (bvadd lt!162353 (bvsub lt!162269 lt!162275)) (bitIndex!0 (size!2247 (buf!2635 lt!162352)) (currentByte!5165 lt!162352) (currentBit!5160 lt!162352))))))

(assert (=> d!34208 (or (not (= (bvand lt!162353 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!162269 lt!162275) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!162353 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!162353 (bvsub lt!162269 lt!162275)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34208 (= lt!162353 (bitIndex!0 (size!2247 (buf!2635 (_2!4708 lt!162261))) (currentByte!5165 (_2!4708 lt!162261)) (currentBit!5160 (_2!4708 lt!162261))))))

(assert (=> d!34208 (= lt!162352 (_2!4706 (moveBitIndex!0 (_2!4708 lt!162261) (bvsub lt!162269 lt!162275))))))

(assert (=> d!34208 (moveBitIndexPrecond!0 (_2!4708 lt!162261) (bvsub lt!162269 lt!162275))))

(assert (=> d!34208 (= (withMovedBitIndex!0 (_2!4708 lt!162261) (bvsub lt!162269 lt!162275)) lt!162352)))

(declare-fun b!108085 () Bool)

(assert (=> b!108085 (= e!70733 (= (size!2247 (buf!2635 (_2!4708 lt!162261))) (size!2247 (buf!2635 lt!162352))))))

(assert (= (and d!34208 res!89088) b!108085))

(declare-fun m!159971 () Bool)

(assert (=> d!34208 m!159971))

(declare-fun m!159973 () Bool)

(assert (=> d!34208 m!159973))

(declare-fun m!159975 () Bool)

(assert (=> d!34208 m!159975))

(declare-fun m!159977 () Bool)

(assert (=> d!34208 m!159977))

(assert (=> b!108041 d!34208))

(declare-fun d!34210 () Bool)

(declare-fun lt!162366 () tuple2!8900)

(declare-fun lt!162369 () tuple2!8900)

(assert (=> d!34210 (and (= (_2!4707 lt!162366) (_2!4707 lt!162369)) (= (_1!4707 lt!162366) (_1!4707 lt!162369)))))

(declare-fun lt!162368 () (_ BitVec 64))

(declare-fun lt!162371 () Bool)

(declare-fun lt!162367 () Unit!6612)

(declare-fun lt!162370 () BitStream!3968)

(declare-fun choose!45 (BitStream!3968 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!8900 tuple2!8900 BitStream!3968 (_ BitVec 64) Bool BitStream!3968 (_ BitVec 64) tuple2!8900 tuple2!8900 BitStream!3968 (_ BitVec 64)) Unit!6612)

(assert (=> d!34210 (= lt!162367 (choose!45 (_1!4708 lt!162268) nBits!396 i!615 lt!162265 lt!162366 (tuple2!8901 (_1!4707 lt!162366) (_2!4707 lt!162366)) (_1!4707 lt!162366) (_2!4707 lt!162366) lt!162371 lt!162370 lt!162368 lt!162369 (tuple2!8901 (_1!4707 lt!162369) (_2!4707 lt!162369)) (_1!4707 lt!162369) (_2!4707 lt!162369)))))

(assert (=> d!34210 (= lt!162369 (readNLeastSignificantBitsLoopPure!0 lt!162370 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!162368))))

(assert (=> d!34210 (= lt!162368 (bvor lt!162265 (ite lt!162371 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34210 (= lt!162370 (withMovedBitIndex!0 (_1!4708 lt!162268) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!34210 (= lt!162371 (_2!4705 (readBitPure!0 (_1!4708 lt!162268))))))

(assert (=> d!34210 (= lt!162366 (readNLeastSignificantBitsLoopPure!0 (_1!4708 lt!162268) nBits!396 i!615 lt!162265))))

(assert (=> d!34210 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4708 lt!162268) nBits!396 i!615 lt!162265) lt!162367)))

(declare-fun bs!8338 () Bool)

(assert (= bs!8338 d!34210))

(declare-fun m!159979 () Bool)

(assert (=> bs!8338 m!159979))

(declare-fun m!159981 () Bool)

(assert (=> bs!8338 m!159981))

(assert (=> bs!8338 m!159889))

(assert (=> bs!8338 m!159863))

(assert (=> bs!8338 m!159901))

(assert (=> b!108041 d!34210))

(declare-datatypes ((tuple2!8912 0))(
  ( (tuple2!8913 (_1!4713 (_ BitVec 64)) (_2!4713 BitStream!3968)) )
))
(declare-fun lt!162374 () tuple2!8912)

(declare-fun d!34212 () Bool)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!3968 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8912)

(assert (=> d!34212 (= lt!162374 (readNLeastSignificantBitsLoop!0 lt!162256 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!162279))))

(assert (=> d!34212 (= (readNLeastSignificantBitsLoopPure!0 lt!162256 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!162279) (tuple2!8901 (_2!4713 lt!162374) (_1!4713 lt!162374)))))

(declare-fun bs!8339 () Bool)

(assert (= bs!8339 d!34212))

(declare-fun m!159983 () Bool)

(assert (=> bs!8339 m!159983))

(assert (=> b!108041 d!34212))

(declare-fun d!34214 () Bool)

(declare-fun e!70734 () Bool)

(assert (=> d!34214 e!70734))

(declare-fun res!89089 () Bool)

(assert (=> d!34214 (=> (not res!89089) (not e!70734))))

(declare-fun lt!162376 () (_ BitVec 64))

(declare-fun lt!162375 () BitStream!3968)

(assert (=> d!34214 (= res!89089 (= (bvadd lt!162376 (bvsub lt!162272 lt!162275)) (bitIndex!0 (size!2247 (buf!2635 lt!162375)) (currentByte!5165 lt!162375) (currentBit!5160 lt!162375))))))

(assert (=> d!34214 (or (not (= (bvand lt!162376 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!162272 lt!162275) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!162376 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!162376 (bvsub lt!162272 lt!162275)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34214 (= lt!162376 (bitIndex!0 (size!2247 (buf!2635 (_2!4708 lt!162268))) (currentByte!5165 (_2!4708 lt!162268)) (currentBit!5160 (_2!4708 lt!162268))))))

(assert (=> d!34214 (= lt!162375 (_2!4706 (moveBitIndex!0 (_2!4708 lt!162268) (bvsub lt!162272 lt!162275))))))

(assert (=> d!34214 (moveBitIndexPrecond!0 (_2!4708 lt!162268) (bvsub lt!162272 lt!162275))))

(assert (=> d!34214 (= (withMovedBitIndex!0 (_2!4708 lt!162268) (bvsub lt!162272 lt!162275)) lt!162375)))

(declare-fun b!108086 () Bool)

(assert (=> b!108086 (= e!70734 (= (size!2247 (buf!2635 (_2!4708 lt!162268))) (size!2247 (buf!2635 lt!162375))))))

(assert (= (and d!34214 res!89089) b!108086))

(declare-fun m!159985 () Bool)

(assert (=> d!34214 m!159985))

(declare-fun m!159987 () Bool)

(assert (=> d!34214 m!159987))

(declare-fun m!159989 () Bool)

(assert (=> d!34214 m!159989))

(declare-fun m!159991 () Bool)

(assert (=> d!34214 m!159991))

(assert (=> b!108041 d!34214))

(declare-fun d!34216 () Bool)

(declare-fun e!70747 () Bool)

(assert (=> d!34216 e!70747))

(declare-fun res!89109 () Bool)

(assert (=> d!34216 (=> (not res!89109) (not e!70747))))

(declare-fun lt!162451 () (_ BitVec 64))

(declare-fun lt!162452 () (_ BitVec 64))

(declare-fun lt!162449 () (_ BitVec 64))

(assert (=> d!34216 (= res!89109 (= lt!162451 (bvsub lt!162449 lt!162452)))))

(assert (=> d!34216 (or (= (bvand lt!162449 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!162452 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!162449 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!162449 lt!162452) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!34216 (= lt!162452 (remainingBits!0 ((_ sign_extend 32) (size!2247 (buf!2635 (_2!4706 lt!162262)))) ((_ sign_extend 32) (currentByte!5165 (_2!4706 lt!162262))) ((_ sign_extend 32) (currentBit!5160 (_2!4706 lt!162262)))))))

(declare-fun lt!162450 () (_ BitVec 64))

(declare-fun lt!162454 () (_ BitVec 64))

(assert (=> d!34216 (= lt!162449 (bvmul lt!162450 lt!162454))))

(assert (=> d!34216 (or (= lt!162450 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!162454 (bvsdiv (bvmul lt!162450 lt!162454) lt!162450)))))

(assert (=> d!34216 (= lt!162454 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34216 (= lt!162450 ((_ sign_extend 32) (size!2247 (buf!2635 (_2!4706 lt!162262)))))))

(assert (=> d!34216 (= lt!162451 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5165 (_2!4706 lt!162262))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5160 (_2!4706 lt!162262)))))))

(assert (=> d!34216 (invariant!0 (currentBit!5160 (_2!4706 lt!162262)) (currentByte!5165 (_2!4706 lt!162262)) (size!2247 (buf!2635 (_2!4706 lt!162262))))))

(assert (=> d!34216 (= (bitIndex!0 (size!2247 (buf!2635 (_2!4706 lt!162262))) (currentByte!5165 (_2!4706 lt!162262)) (currentBit!5160 (_2!4706 lt!162262))) lt!162451)))

(declare-fun b!108112 () Bool)

(declare-fun res!89110 () Bool)

(assert (=> b!108112 (=> (not res!89110) (not e!70747))))

(assert (=> b!108112 (= res!89110 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!162451))))

(declare-fun b!108113 () Bool)

(declare-fun lt!162453 () (_ BitVec 64))

(assert (=> b!108113 (= e!70747 (bvsle lt!162451 (bvmul lt!162453 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!108113 (or (= lt!162453 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!162453 #b0000000000000000000000000000000000000000000000000000000000001000) lt!162453)))))

(assert (=> b!108113 (= lt!162453 ((_ sign_extend 32) (size!2247 (buf!2635 (_2!4706 lt!162262)))))))

(assert (= (and d!34216 res!89109) b!108112))

(assert (= (and b!108112 res!89110) b!108113))

(declare-fun m!160025 () Bool)

(assert (=> d!34216 m!160025))

(assert (=> d!34216 m!159847))

(assert (=> b!108041 d!34216))

(declare-fun d!34222 () Bool)

(declare-fun e!70750 () Bool)

(assert (=> d!34222 e!70750))

(declare-fun res!89114 () Bool)

(assert (=> d!34222 (=> (not res!89114) (not e!70750))))

(declare-fun lt!162455 () (_ BitVec 64))

(declare-fun lt!162457 () (_ BitVec 64))

(declare-fun lt!162458 () (_ BitVec 64))

(assert (=> d!34222 (= res!89114 (= lt!162457 (bvsub lt!162455 lt!162458)))))

(assert (=> d!34222 (or (= (bvand lt!162455 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!162458 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!162455 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!162455 lt!162458) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34222 (= lt!162458 (remainingBits!0 ((_ sign_extend 32) (size!2247 (buf!2635 (_2!4706 lt!162271)))) ((_ sign_extend 32) (currentByte!5165 (_2!4706 lt!162271))) ((_ sign_extend 32) (currentBit!5160 (_2!4706 lt!162271)))))))

(declare-fun lt!162456 () (_ BitVec 64))

(declare-fun lt!162460 () (_ BitVec 64))

(assert (=> d!34222 (= lt!162455 (bvmul lt!162456 lt!162460))))

(assert (=> d!34222 (or (= lt!162456 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!162460 (bvsdiv (bvmul lt!162456 lt!162460) lt!162456)))))

(assert (=> d!34222 (= lt!162460 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34222 (= lt!162456 ((_ sign_extend 32) (size!2247 (buf!2635 (_2!4706 lt!162271)))))))

(assert (=> d!34222 (= lt!162457 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5165 (_2!4706 lt!162271))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5160 (_2!4706 lt!162271)))))))

(assert (=> d!34222 (invariant!0 (currentBit!5160 (_2!4706 lt!162271)) (currentByte!5165 (_2!4706 lt!162271)) (size!2247 (buf!2635 (_2!4706 lt!162271))))))

(assert (=> d!34222 (= (bitIndex!0 (size!2247 (buf!2635 (_2!4706 lt!162271))) (currentByte!5165 (_2!4706 lt!162271)) (currentBit!5160 (_2!4706 lt!162271))) lt!162457)))

(declare-fun b!108117 () Bool)

(declare-fun res!89115 () Bool)

(assert (=> b!108117 (=> (not res!89115) (not e!70750))))

(assert (=> b!108117 (= res!89115 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!162457))))

(declare-fun b!108118 () Bool)

(declare-fun lt!162459 () (_ BitVec 64))

(assert (=> b!108118 (= e!70750 (bvsle lt!162457 (bvmul lt!162459 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!108118 (or (= lt!162459 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!162459 #b0000000000000000000000000000000000000000000000000000000000001000) lt!162459)))))

(assert (=> b!108118 (= lt!162459 ((_ sign_extend 32) (size!2247 (buf!2635 (_2!4706 lt!162271)))))))

(assert (= (and d!34222 res!89114) b!108117))

(assert (= (and b!108117 res!89115) b!108118))

(declare-fun m!160027 () Bool)

(assert (=> d!34222 m!160027))

(declare-fun m!160029 () Bool)

(assert (=> d!34222 m!160029))

(assert (=> b!108041 d!34222))

(declare-fun d!34224 () Bool)

(declare-fun e!70751 () Bool)

(assert (=> d!34224 e!70751))

(declare-fun res!89116 () Bool)

(assert (=> d!34224 (=> (not res!89116) (not e!70751))))

(declare-fun lt!162463 () (_ BitVec 64))

(declare-fun lt!162464 () (_ BitVec 64))

(declare-fun lt!162461 () (_ BitVec 64))

(assert (=> d!34224 (= res!89116 (= lt!162463 (bvsub lt!162461 lt!162464)))))

(assert (=> d!34224 (or (= (bvand lt!162461 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!162464 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!162461 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!162461 lt!162464) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34224 (= lt!162464 (remainingBits!0 ((_ sign_extend 32) (size!2247 (buf!2635 thiss!1305))) ((_ sign_extend 32) (currentByte!5165 thiss!1305)) ((_ sign_extend 32) (currentBit!5160 thiss!1305))))))

(declare-fun lt!162462 () (_ BitVec 64))

(declare-fun lt!162466 () (_ BitVec 64))

(assert (=> d!34224 (= lt!162461 (bvmul lt!162462 lt!162466))))

(assert (=> d!34224 (or (= lt!162462 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!162466 (bvsdiv (bvmul lt!162462 lt!162466) lt!162462)))))

(assert (=> d!34224 (= lt!162466 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34224 (= lt!162462 ((_ sign_extend 32) (size!2247 (buf!2635 thiss!1305))))))

(assert (=> d!34224 (= lt!162463 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5165 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5160 thiss!1305))))))

(assert (=> d!34224 (invariant!0 (currentBit!5160 thiss!1305) (currentByte!5165 thiss!1305) (size!2247 (buf!2635 thiss!1305)))))

(assert (=> d!34224 (= (bitIndex!0 (size!2247 (buf!2635 thiss!1305)) (currentByte!5165 thiss!1305) (currentBit!5160 thiss!1305)) lt!162463)))

(declare-fun b!108119 () Bool)

(declare-fun res!89117 () Bool)

(assert (=> b!108119 (=> (not res!89117) (not e!70751))))

(assert (=> b!108119 (= res!89117 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!162463))))

(declare-fun b!108120 () Bool)

(declare-fun lt!162465 () (_ BitVec 64))

(assert (=> b!108120 (= e!70751 (bvsle lt!162463 (bvmul lt!162465 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!108120 (or (= lt!162465 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!162465 #b0000000000000000000000000000000000000000000000000000000000001000) lt!162465)))))

(assert (=> b!108120 (= lt!162465 ((_ sign_extend 32) (size!2247 (buf!2635 thiss!1305))))))

(assert (= (and d!34224 res!89116) b!108119))

(assert (= (and b!108119 res!89117) b!108120))

(declare-fun m!160033 () Bool)

(assert (=> d!34224 m!160033))

(declare-fun m!160035 () Bool)

(assert (=> d!34224 m!160035))

(assert (=> b!108041 d!34224))

(declare-fun d!34228 () Bool)

(assert (=> d!34228 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2247 (buf!2635 thiss!1305))) ((_ sign_extend 32) (currentByte!5165 thiss!1305)) ((_ sign_extend 32) (currentBit!5160 thiss!1305)) lt!162273) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2247 (buf!2635 thiss!1305))) ((_ sign_extend 32) (currentByte!5165 thiss!1305)) ((_ sign_extend 32) (currentBit!5160 thiss!1305))) lt!162273))))

(declare-fun bs!8341 () Bool)

(assert (= bs!8341 d!34228))

(assert (=> bs!8341 m!160033))

(assert (=> b!108030 d!34228))

(declare-fun d!34230 () Bool)

(assert (=> d!34230 (= (invariant!0 (currentBit!5160 thiss!1305) (currentByte!5165 thiss!1305) (size!2247 (buf!2635 (_2!4706 lt!162262)))) (and (bvsge (currentBit!5160 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5160 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5165 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5165 thiss!1305) (size!2247 (buf!2635 (_2!4706 lt!162262)))) (and (= (currentBit!5160 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5165 thiss!1305) (size!2247 (buf!2635 (_2!4706 lt!162262))))))))))

(assert (=> b!108040 d!34230))

(declare-fun d!34232 () Bool)

(assert (=> d!34232 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!108029 d!34232))

(declare-fun d!34236 () Bool)

(declare-datatypes ((tuple2!8914 0))(
  ( (tuple2!8915 (_1!4714 Bool) (_2!4714 BitStream!3968)) )
))
(declare-fun lt!162474 () tuple2!8914)

(declare-fun readBit!0 (BitStream!3968) tuple2!8914)

(assert (=> d!34236 (= lt!162474 (readBit!0 (readerFrom!0 (_2!4706 lt!162271) (currentBit!5160 thiss!1305) (currentByte!5165 thiss!1305))))))

(assert (=> d!34236 (= (readBitPure!0 (readerFrom!0 (_2!4706 lt!162271) (currentBit!5160 thiss!1305) (currentByte!5165 thiss!1305))) (tuple2!8897 (_2!4714 lt!162474) (_1!4714 lt!162474)))))

(declare-fun bs!8343 () Bool)

(assert (= bs!8343 d!34236))

(assert (=> bs!8343 m!159849))

(declare-fun m!160039 () Bool)

(assert (=> bs!8343 m!160039))

(assert (=> b!108039 d!34236))

(declare-fun d!34238 () Bool)

(declare-fun e!70754 () Bool)

(assert (=> d!34238 e!70754))

(declare-fun res!89121 () Bool)

(assert (=> d!34238 (=> (not res!89121) (not e!70754))))

(assert (=> d!34238 (= res!89121 (invariant!0 (currentBit!5160 (_2!4706 lt!162271)) (currentByte!5165 (_2!4706 lt!162271)) (size!2247 (buf!2635 (_2!4706 lt!162271)))))))

(assert (=> d!34238 (= (readerFrom!0 (_2!4706 lt!162271) (currentBit!5160 thiss!1305) (currentByte!5165 thiss!1305)) (BitStream!3969 (buf!2635 (_2!4706 lt!162271)) (currentByte!5165 thiss!1305) (currentBit!5160 thiss!1305)))))

(declare-fun b!108123 () Bool)

(assert (=> b!108123 (= e!70754 (invariant!0 (currentBit!5160 thiss!1305) (currentByte!5165 thiss!1305) (size!2247 (buf!2635 (_2!4706 lt!162271)))))))

(assert (= (and d!34238 res!89121) b!108123))

(assert (=> d!34238 m!160029))

(assert (=> b!108123 m!159913))

(assert (=> b!108039 d!34238))

(declare-fun d!34242 () Bool)

(declare-fun res!89128 () Bool)

(declare-fun e!70760 () Bool)

(assert (=> d!34242 (=> (not res!89128) (not e!70760))))

(assert (=> d!34242 (= res!89128 (= (size!2247 (buf!2635 thiss!1305)) (size!2247 (buf!2635 (_2!4706 lt!162271)))))))

(assert (=> d!34242 (= (isPrefixOf!0 thiss!1305 (_2!4706 lt!162271)) e!70760)))

(declare-fun b!108130 () Bool)

(declare-fun res!89129 () Bool)

(assert (=> b!108130 (=> (not res!89129) (not e!70760))))

(assert (=> b!108130 (= res!89129 (bvsle (bitIndex!0 (size!2247 (buf!2635 thiss!1305)) (currentByte!5165 thiss!1305) (currentBit!5160 thiss!1305)) (bitIndex!0 (size!2247 (buf!2635 (_2!4706 lt!162271))) (currentByte!5165 (_2!4706 lt!162271)) (currentBit!5160 (_2!4706 lt!162271)))))))

(declare-fun b!108131 () Bool)

(declare-fun e!70759 () Bool)

(assert (=> b!108131 (= e!70760 e!70759)))

(declare-fun res!89130 () Bool)

(assert (=> b!108131 (=> res!89130 e!70759)))

(assert (=> b!108131 (= res!89130 (= (size!2247 (buf!2635 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!108132 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4938 array!4938 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!108132 (= e!70759 (arrayBitRangesEq!0 (buf!2635 thiss!1305) (buf!2635 (_2!4706 lt!162271)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2247 (buf!2635 thiss!1305)) (currentByte!5165 thiss!1305) (currentBit!5160 thiss!1305))))))

(assert (= (and d!34242 res!89128) b!108130))

(assert (= (and b!108130 res!89129) b!108131))

(assert (= (and b!108131 (not res!89130)) b!108132))

(assert (=> b!108130 m!159893))

(assert (=> b!108130 m!159891))

(assert (=> b!108132 m!159893))

(assert (=> b!108132 m!159893))

(declare-fun m!160043 () Bool)

(assert (=> b!108132 m!160043))

(assert (=> b!108038 d!34242))

(declare-fun d!34244 () Bool)

(assert (=> d!34244 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5160 thiss!1305) (currentByte!5165 thiss!1305) (size!2247 (buf!2635 thiss!1305))))))

(declare-fun bs!8345 () Bool)

(assert (= bs!8345 d!34244))

(assert (=> bs!8345 m!160035))

(assert (=> start!21470 d!34244))

(declare-fun d!34246 () Bool)

(assert (=> d!34246 (= (invariant!0 (currentBit!5160 (_2!4706 lt!162262)) (currentByte!5165 (_2!4706 lt!162262)) (size!2247 (buf!2635 (_2!4706 lt!162262)))) (and (bvsge (currentBit!5160 (_2!4706 lt!162262)) #b00000000000000000000000000000000) (bvslt (currentBit!5160 (_2!4706 lt!162262)) #b00000000000000000000000000001000) (bvsge (currentByte!5165 (_2!4706 lt!162262)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5165 (_2!4706 lt!162262)) (size!2247 (buf!2635 (_2!4706 lt!162262)))) (and (= (currentBit!5160 (_2!4706 lt!162262)) #b00000000000000000000000000000000) (= (currentByte!5165 (_2!4706 lt!162262)) (size!2247 (buf!2635 (_2!4706 lt!162262))))))))))

(assert (=> b!108037 d!34246))

(assert (=> b!108035 d!34222))

(assert (=> b!108035 d!34224))

(declare-fun d!34248 () Bool)

(assert (=> d!34248 (= (invariant!0 (currentBit!5160 thiss!1305) (currentByte!5165 thiss!1305) (size!2247 (buf!2635 (_2!4706 lt!162271)))) (and (bvsge (currentBit!5160 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5160 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5165 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5165 thiss!1305) (size!2247 (buf!2635 (_2!4706 lt!162271)))) (and (= (currentBit!5160 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5165 thiss!1305) (size!2247 (buf!2635 (_2!4706 lt!162271))))))))))

(assert (=> b!108043 d!34248))

(declare-fun d!34250 () Bool)

(assert (=> d!34250 (= (array_inv!2049 (buf!2635 thiss!1305)) (bvsge (size!2247 (buf!2635 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!108032 d!34250))

(declare-fun d!34252 () Bool)

(assert (=> d!34252 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!108042 d!34252))

(declare-fun b!108146 () Bool)

(declare-fun e!70768 () Unit!6612)

(declare-fun lt!162536 () Unit!6612)

(assert (=> b!108146 (= e!70768 lt!162536)))

(declare-fun lt!162548 () (_ BitVec 64))

(assert (=> b!108146 (= lt!162548 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162547 () (_ BitVec 64))

(assert (=> b!108146 (= lt!162547 (bitIndex!0 (size!2247 (buf!2635 (_2!4706 lt!162271))) (currentByte!5165 (_2!4706 lt!162271)) (currentBit!5160 (_2!4706 lt!162271))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!4938 array!4938 (_ BitVec 64) (_ BitVec 64)) Unit!6612)

(assert (=> b!108146 (= lt!162536 (arrayBitRangesEqSymmetric!0 (buf!2635 (_2!4706 lt!162271)) (buf!2635 (_2!4706 lt!162262)) lt!162548 lt!162547))))

(assert (=> b!108146 (arrayBitRangesEq!0 (buf!2635 (_2!4706 lt!162262)) (buf!2635 (_2!4706 lt!162271)) lt!162548 lt!162547)))

(declare-fun b!108147 () Bool)

(declare-fun e!70769 () Bool)

(declare-fun lt!162545 () tuple2!8902)

(declare-fun lt!162530 () (_ BitVec 64))

(declare-fun lt!162546 () (_ BitVec 64))

(assert (=> b!108147 (= e!70769 (= (_1!4708 lt!162545) (withMovedBitIndex!0 (_2!4708 lt!162545) (bvsub lt!162530 lt!162546))))))

(assert (=> b!108147 (or (= (bvand lt!162530 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!162546 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!162530 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!162530 lt!162546) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!108147 (= lt!162546 (bitIndex!0 (size!2247 (buf!2635 (_2!4706 lt!162262))) (currentByte!5165 (_2!4706 lt!162262)) (currentBit!5160 (_2!4706 lt!162262))))))

(assert (=> b!108147 (= lt!162530 (bitIndex!0 (size!2247 (buf!2635 (_2!4706 lt!162271))) (currentByte!5165 (_2!4706 lt!162271)) (currentBit!5160 (_2!4706 lt!162271))))))

(declare-fun b!108148 () Bool)

(declare-fun Unit!6630 () Unit!6612)

(assert (=> b!108148 (= e!70768 Unit!6630)))

(declare-fun b!108149 () Bool)

(declare-fun res!89141 () Bool)

(assert (=> b!108149 (=> (not res!89141) (not e!70769))))

(assert (=> b!108149 (= res!89141 (isPrefixOf!0 (_1!4708 lt!162545) (_2!4706 lt!162271)))))

(declare-fun d!34254 () Bool)

(assert (=> d!34254 e!70769))

(declare-fun res!89142 () Bool)

(assert (=> d!34254 (=> (not res!89142) (not e!70769))))

(assert (=> d!34254 (= res!89142 (isPrefixOf!0 (_1!4708 lt!162545) (_2!4708 lt!162545)))))

(declare-fun lt!162544 () BitStream!3968)

(assert (=> d!34254 (= lt!162545 (tuple2!8903 lt!162544 (_2!4706 lt!162262)))))

(declare-fun lt!162538 () Unit!6612)

(declare-fun lt!162533 () Unit!6612)

(assert (=> d!34254 (= lt!162538 lt!162533)))

(assert (=> d!34254 (isPrefixOf!0 lt!162544 (_2!4706 lt!162262))))

(assert (=> d!34254 (= lt!162533 (lemmaIsPrefixTransitive!0 lt!162544 (_2!4706 lt!162262) (_2!4706 lt!162262)))))

(declare-fun lt!162532 () Unit!6612)

(declare-fun lt!162540 () Unit!6612)

(assert (=> d!34254 (= lt!162532 lt!162540)))

(assert (=> d!34254 (isPrefixOf!0 lt!162544 (_2!4706 lt!162262))))

(assert (=> d!34254 (= lt!162540 (lemmaIsPrefixTransitive!0 lt!162544 (_2!4706 lt!162271) (_2!4706 lt!162262)))))

(declare-fun lt!162534 () Unit!6612)

(assert (=> d!34254 (= lt!162534 e!70768)))

(declare-fun c!6665 () Bool)

(assert (=> d!34254 (= c!6665 (not (= (size!2247 (buf!2635 (_2!4706 lt!162271))) #b00000000000000000000000000000000)))))

(declare-fun lt!162549 () Unit!6612)

(declare-fun lt!162541 () Unit!6612)

(assert (=> d!34254 (= lt!162549 lt!162541)))

(assert (=> d!34254 (isPrefixOf!0 (_2!4706 lt!162262) (_2!4706 lt!162262))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!3968) Unit!6612)

(assert (=> d!34254 (= lt!162541 (lemmaIsPrefixRefl!0 (_2!4706 lt!162262)))))

(declare-fun lt!162539 () Unit!6612)

(declare-fun lt!162542 () Unit!6612)

(assert (=> d!34254 (= lt!162539 lt!162542)))

(assert (=> d!34254 (= lt!162542 (lemmaIsPrefixRefl!0 (_2!4706 lt!162262)))))

(declare-fun lt!162537 () Unit!6612)

(declare-fun lt!162531 () Unit!6612)

(assert (=> d!34254 (= lt!162537 lt!162531)))

(assert (=> d!34254 (isPrefixOf!0 lt!162544 lt!162544)))

(assert (=> d!34254 (= lt!162531 (lemmaIsPrefixRefl!0 lt!162544))))

(declare-fun lt!162543 () Unit!6612)

(declare-fun lt!162535 () Unit!6612)

(assert (=> d!34254 (= lt!162543 lt!162535)))

(assert (=> d!34254 (isPrefixOf!0 (_2!4706 lt!162271) (_2!4706 lt!162271))))

(assert (=> d!34254 (= lt!162535 (lemmaIsPrefixRefl!0 (_2!4706 lt!162271)))))

(assert (=> d!34254 (= lt!162544 (BitStream!3969 (buf!2635 (_2!4706 lt!162262)) (currentByte!5165 (_2!4706 lt!162271)) (currentBit!5160 (_2!4706 lt!162271))))))

(assert (=> d!34254 (isPrefixOf!0 (_2!4706 lt!162271) (_2!4706 lt!162262))))

(assert (=> d!34254 (= (reader!0 (_2!4706 lt!162271) (_2!4706 lt!162262)) lt!162545)))

(declare-fun b!108150 () Bool)

(declare-fun res!89140 () Bool)

(assert (=> b!108150 (=> (not res!89140) (not e!70769))))

(assert (=> b!108150 (= res!89140 (isPrefixOf!0 (_2!4708 lt!162545) (_2!4706 lt!162262)))))

(assert (= (and d!34254 c!6665) b!108146))

(assert (= (and d!34254 (not c!6665)) b!108148))

(assert (= (and d!34254 res!89142) b!108149))

(assert (= (and b!108149 res!89141) b!108150))

(assert (= (and b!108150 res!89140) b!108147))

(assert (=> b!108146 m!159891))

(declare-fun m!160059 () Bool)

(assert (=> b!108146 m!160059))

(declare-fun m!160061 () Bool)

(assert (=> b!108146 m!160061))

(declare-fun m!160063 () Bool)

(assert (=> d!34254 m!160063))

(declare-fun m!160065 () Bool)

(assert (=> d!34254 m!160065))

(declare-fun m!160067 () Bool)

(assert (=> d!34254 m!160067))

(declare-fun m!160069 () Bool)

(assert (=> d!34254 m!160069))

(declare-fun m!160071 () Bool)

(assert (=> d!34254 m!160071))

(declare-fun m!160073 () Bool)

(assert (=> d!34254 m!160073))

(declare-fun m!160075 () Bool)

(assert (=> d!34254 m!160075))

(declare-fun m!160077 () Bool)

(assert (=> d!34254 m!160077))

(declare-fun m!160079 () Bool)

(assert (=> d!34254 m!160079))

(declare-fun m!160081 () Bool)

(assert (=> d!34254 m!160081))

(declare-fun m!160083 () Bool)

(assert (=> d!34254 m!160083))

(declare-fun m!160085 () Bool)

(assert (=> b!108150 m!160085))

(declare-fun m!160087 () Bool)

(assert (=> b!108147 m!160087))

(assert (=> b!108147 m!159907))

(assert (=> b!108147 m!159891))

(declare-fun m!160089 () Bool)

(assert (=> b!108149 m!160089))

(assert (=> b!108042 d!34254))

(declare-fun d!34262 () Bool)

(assert (=> d!34262 (validate_offset_bits!1 ((_ sign_extend 32) (size!2247 (buf!2635 (_2!4706 lt!162262)))) ((_ sign_extend 32) (currentByte!5165 thiss!1305)) ((_ sign_extend 32) (currentBit!5160 thiss!1305)) lt!162273)))

(declare-fun lt!162552 () Unit!6612)

(declare-fun choose!9 (BitStream!3968 array!4938 (_ BitVec 64) BitStream!3968) Unit!6612)

(assert (=> d!34262 (= lt!162552 (choose!9 thiss!1305 (buf!2635 (_2!4706 lt!162262)) lt!162273 (BitStream!3969 (buf!2635 (_2!4706 lt!162262)) (currentByte!5165 thiss!1305) (currentBit!5160 thiss!1305))))))

(assert (=> d!34262 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2635 (_2!4706 lt!162262)) lt!162273) lt!162552)))

(declare-fun bs!8348 () Bool)

(assert (= bs!8348 d!34262))

(assert (=> bs!8348 m!159885))

(declare-fun m!160091 () Bool)

(assert (=> bs!8348 m!160091))

(assert (=> b!108042 d!34262))

(declare-fun d!34264 () Bool)

(assert (=> d!34264 (isPrefixOf!0 thiss!1305 (_2!4706 lt!162262))))

(declare-fun lt!162555 () Unit!6612)

(declare-fun choose!30 (BitStream!3968 BitStream!3968 BitStream!3968) Unit!6612)

(assert (=> d!34264 (= lt!162555 (choose!30 thiss!1305 (_2!4706 lt!162271) (_2!4706 lt!162262)))))

(assert (=> d!34264 (isPrefixOf!0 thiss!1305 (_2!4706 lt!162271))))

(assert (=> d!34264 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4706 lt!162271) (_2!4706 lt!162262)) lt!162555)))

(declare-fun bs!8349 () Bool)

(assert (= bs!8349 d!34264))

(assert (=> bs!8349 m!159883))

(declare-fun m!160093 () Bool)

(assert (=> bs!8349 m!160093))

(assert (=> bs!8349 m!159895))

(assert (=> b!108042 d!34264))

(declare-fun b!108334 () Bool)

(declare-fun res!89286 () Bool)

(declare-fun lt!163177 () tuple2!8898)

(assert (=> b!108334 (= res!89286 (= (bitIndex!0 (size!2247 (buf!2635 (_2!4706 lt!163177))) (currentByte!5165 (_2!4706 lt!163177)) (currentBit!5160 (_2!4706 lt!163177))) (bvadd (bitIndex!0 (size!2247 (buf!2635 (_2!4706 lt!162271))) (currentByte!5165 (_2!4706 lt!162271)) (currentBit!5160 (_2!4706 lt!162271))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!70879 () Bool)

(assert (=> b!108334 (=> (not res!89286) (not e!70879))))

(declare-fun b!108335 () Bool)

(declare-fun e!70877 () (_ BitVec 64))

(assert (=> b!108335 (= e!70877 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!108336 () Bool)

(declare-fun e!70874 () Bool)

(declare-fun lt!163178 () tuple2!8896)

(assert (=> b!108336 (= e!70874 (= (bitIndex!0 (size!2247 (buf!2635 (_1!4705 lt!163178))) (currentByte!5165 (_1!4705 lt!163178)) (currentBit!5160 (_1!4705 lt!163178))) (bitIndex!0 (size!2247 (buf!2635 (_2!4706 lt!163177))) (currentByte!5165 (_2!4706 lt!163177)) (currentBit!5160 (_2!4706 lt!163177)))))))

(declare-fun b!108338 () Bool)

(assert (=> b!108338 (= e!70877 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!108339 () Bool)

(declare-fun e!70878 () Bool)

(declare-fun lt!163175 () tuple2!8896)

(declare-fun lt!163176 () tuple2!8896)

(assert (=> b!108339 (= e!70878 (= (_2!4705 lt!163175) (_2!4705 lt!163176)))))

(declare-fun e!70875 () Bool)

(declare-fun lt!163179 () tuple2!8900)

(declare-fun b!108340 () Bool)

(declare-fun lt!163199 () tuple2!8902)

(assert (=> b!108340 (= e!70875 (and (= (_2!4707 lt!163179) v!199) (= (_1!4707 lt!163179) (_2!4708 lt!163199))))))

(declare-fun lt!163191 () (_ BitVec 64))

(assert (=> b!108340 (= lt!163179 (readNLeastSignificantBitsLoopPure!0 (_1!4708 lt!163199) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!163191))))

(declare-fun lt!163170 () Unit!6612)

(declare-fun lt!163209 () Unit!6612)

(assert (=> b!108340 (= lt!163170 lt!163209)))

(declare-fun lt!163168 () tuple2!8898)

(declare-fun lt!163181 () (_ BitVec 64))

(assert (=> b!108340 (validate_offset_bits!1 ((_ sign_extend 32) (size!2247 (buf!2635 (_2!4706 lt!163168)))) ((_ sign_extend 32) (currentByte!5165 (_2!4706 lt!162271))) ((_ sign_extend 32) (currentBit!5160 (_2!4706 lt!162271))) lt!163181)))

(assert (=> b!108340 (= lt!163209 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4706 lt!162271) (buf!2635 (_2!4706 lt!163168)) lt!163181))))

(declare-fun e!70876 () Bool)

(assert (=> b!108340 e!70876))

(declare-fun res!89290 () Bool)

(assert (=> b!108340 (=> (not res!89290) (not e!70876))))

(assert (=> b!108340 (= res!89290 (and (= (size!2247 (buf!2635 (_2!4706 lt!162271))) (size!2247 (buf!2635 (_2!4706 lt!163168)))) (bvsge lt!163181 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!108340 (= lt!163181 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!108340 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!108340 (= lt!163191 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!108340 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!108340 (= lt!163199 (reader!0 (_2!4706 lt!162271) (_2!4706 lt!163168)))))

(declare-fun b!108341 () Bool)

(declare-fun res!89288 () Bool)

(assert (=> b!108341 (=> (not res!89288) (not e!70875))))

(assert (=> b!108341 (= res!89288 (isPrefixOf!0 (_2!4706 lt!162271) (_2!4706 lt!163168)))))

(declare-fun b!108342 () Bool)

(declare-fun res!89291 () Bool)

(assert (=> b!108342 (=> (not res!89291) (not e!70875))))

(declare-fun lt!163183 () (_ BitVec 64))

(declare-fun lt!163169 () (_ BitVec 64))

(assert (=> b!108342 (= res!89291 (= (bitIndex!0 (size!2247 (buf!2635 (_2!4706 lt!163168))) (currentByte!5165 (_2!4706 lt!163168)) (currentBit!5160 (_2!4706 lt!163168))) (bvadd lt!163169 lt!163183)))))

(assert (=> b!108342 (or (not (= (bvand lt!163169 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!163183 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!163169 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!163169 lt!163183) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!108342 (= lt!163183 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!108342 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!108342 (= lt!163169 (bitIndex!0 (size!2247 (buf!2635 (_2!4706 lt!162271))) (currentByte!5165 (_2!4706 lt!162271)) (currentBit!5160 (_2!4706 lt!162271))))))

(declare-fun b!108343 () Bool)

(assert (=> b!108343 (= lt!163178 (readBitPure!0 (readerFrom!0 (_2!4706 lt!163177) (currentBit!5160 (_2!4706 lt!162271)) (currentByte!5165 (_2!4706 lt!162271)))))))

(declare-fun lt!163185 () Bool)

(declare-fun res!89287 () Bool)

(assert (=> b!108343 (= res!89287 (and (= (_2!4705 lt!163178) lt!163185) (= (_1!4705 lt!163178) (_2!4706 lt!163177))))))

(assert (=> b!108343 (=> (not res!89287) (not e!70874))))

(assert (=> b!108343 (= e!70879 e!70874)))

(declare-fun b!108344 () Bool)

(declare-fun res!89293 () Bool)

(declare-fun call!1377 () Bool)

(assert (=> b!108344 (= res!89293 call!1377)))

(assert (=> b!108344 (=> (not res!89293) (not e!70879))))

(declare-fun b!108345 () Bool)

(declare-fun e!70873 () tuple2!8898)

(declare-fun lt!163211 () tuple2!8898)

(declare-fun Unit!6631 () Unit!6612)

(assert (=> b!108345 (= e!70873 (tuple2!8899 Unit!6631 (_2!4706 lt!163211)))))

(assert (=> b!108345 (= lt!163185 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!108345 (= lt!163177 (appendBit!0 (_2!4706 lt!162271) lt!163185))))

(declare-fun res!89289 () Bool)

(assert (=> b!108345 (= res!89289 (= (size!2247 (buf!2635 (_2!4706 lt!162271))) (size!2247 (buf!2635 (_2!4706 lt!163177)))))))

(assert (=> b!108345 (=> (not res!89289) (not e!70879))))

(assert (=> b!108345 e!70879))

(declare-fun lt!163205 () tuple2!8898)

(assert (=> b!108345 (= lt!163205 lt!163177)))

(assert (=> b!108345 (= lt!163211 (appendNLeastSignificantBitsLoop!0 (_2!4706 lt!163205) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!163187 () Unit!6612)

(assert (=> b!108345 (= lt!163187 (lemmaIsPrefixTransitive!0 (_2!4706 lt!162271) (_2!4706 lt!163205) (_2!4706 lt!163211)))))

(assert (=> b!108345 (isPrefixOf!0 (_2!4706 lt!162271) (_2!4706 lt!163211))))

(declare-fun lt!163184 () Unit!6612)

(assert (=> b!108345 (= lt!163184 lt!163187)))

(assert (=> b!108345 (invariant!0 (currentBit!5160 (_2!4706 lt!162271)) (currentByte!5165 (_2!4706 lt!162271)) (size!2247 (buf!2635 (_2!4706 lt!163205))))))

(declare-fun lt!163203 () BitStream!3968)

(assert (=> b!108345 (= lt!163203 (BitStream!3969 (buf!2635 (_2!4706 lt!163205)) (currentByte!5165 (_2!4706 lt!162271)) (currentBit!5160 (_2!4706 lt!162271))))))

(assert (=> b!108345 (invariant!0 (currentBit!5160 lt!163203) (currentByte!5165 lt!163203) (size!2247 (buf!2635 (_2!4706 lt!163211))))))

(declare-fun lt!163193 () BitStream!3968)

(assert (=> b!108345 (= lt!163193 (BitStream!3969 (buf!2635 (_2!4706 lt!163211)) (currentByte!5165 lt!163203) (currentBit!5160 lt!163203)))))

(assert (=> b!108345 (= lt!163175 (readBitPure!0 lt!163203))))

(assert (=> b!108345 (= lt!163176 (readBitPure!0 lt!163193))))

(declare-fun lt!163190 () Unit!6612)

(assert (=> b!108345 (= lt!163190 (readBitPrefixLemma!0 lt!163203 (_2!4706 lt!163211)))))

(declare-fun res!89285 () Bool)

(assert (=> b!108345 (= res!89285 (= (bitIndex!0 (size!2247 (buf!2635 (_1!4705 lt!163175))) (currentByte!5165 (_1!4705 lt!163175)) (currentBit!5160 (_1!4705 lt!163175))) (bitIndex!0 (size!2247 (buf!2635 (_1!4705 lt!163176))) (currentByte!5165 (_1!4705 lt!163176)) (currentBit!5160 (_1!4705 lt!163176)))))))

(assert (=> b!108345 (=> (not res!89285) (not e!70878))))

(assert (=> b!108345 e!70878))

(declare-fun lt!163200 () Unit!6612)

(assert (=> b!108345 (= lt!163200 lt!163190)))

(declare-fun lt!163182 () tuple2!8902)

(assert (=> b!108345 (= lt!163182 (reader!0 (_2!4706 lt!162271) (_2!4706 lt!163211)))))

(declare-fun lt!163201 () tuple2!8902)

(assert (=> b!108345 (= lt!163201 (reader!0 (_2!4706 lt!163205) (_2!4706 lt!163211)))))

(declare-fun lt!163173 () tuple2!8896)

(assert (=> b!108345 (= lt!163173 (readBitPure!0 (_1!4708 lt!163182)))))

(assert (=> b!108345 (= (_2!4705 lt!163173) lt!163185)))

(declare-fun lt!163196 () Unit!6612)

(declare-fun Unit!6632 () Unit!6612)

(assert (=> b!108345 (= lt!163196 Unit!6632)))

(declare-fun lt!163174 () (_ BitVec 64))

(assert (=> b!108345 (= lt!163174 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!163202 () (_ BitVec 64))

(assert (=> b!108345 (= lt!163202 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!163208 () Unit!6612)

(assert (=> b!108345 (= lt!163208 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4706 lt!162271) (buf!2635 (_2!4706 lt!163211)) lt!163202))))

(assert (=> b!108345 (validate_offset_bits!1 ((_ sign_extend 32) (size!2247 (buf!2635 (_2!4706 lt!163211)))) ((_ sign_extend 32) (currentByte!5165 (_2!4706 lt!162271))) ((_ sign_extend 32) (currentBit!5160 (_2!4706 lt!162271))) lt!163202)))

(declare-fun lt!163198 () Unit!6612)

(assert (=> b!108345 (= lt!163198 lt!163208)))

(declare-fun lt!163212 () tuple2!8900)

(assert (=> b!108345 (= lt!163212 (readNLeastSignificantBitsLoopPure!0 (_1!4708 lt!163182) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!163174))))

(declare-fun lt!163210 () (_ BitVec 64))

(assert (=> b!108345 (= lt!163210 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!163195 () Unit!6612)

(assert (=> b!108345 (= lt!163195 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4706 lt!163205) (buf!2635 (_2!4706 lt!163211)) lt!163210))))

(assert (=> b!108345 (validate_offset_bits!1 ((_ sign_extend 32) (size!2247 (buf!2635 (_2!4706 lt!163211)))) ((_ sign_extend 32) (currentByte!5165 (_2!4706 lt!163205))) ((_ sign_extend 32) (currentBit!5160 (_2!4706 lt!163205))) lt!163210)))

(declare-fun lt!163192 () Unit!6612)

(assert (=> b!108345 (= lt!163192 lt!163195)))

(declare-fun lt!163207 () tuple2!8900)

(assert (=> b!108345 (= lt!163207 (readNLeastSignificantBitsLoopPure!0 (_1!4708 lt!163201) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!163174 (ite (_2!4705 lt!163173) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!163204 () tuple2!8900)

(assert (=> b!108345 (= lt!163204 (readNLeastSignificantBitsLoopPure!0 (_1!4708 lt!163182) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!163174))))

(declare-fun c!6687 () Bool)

(assert (=> b!108345 (= c!6687 (_2!4705 (readBitPure!0 (_1!4708 lt!163182))))))

(declare-fun lt!163188 () tuple2!8900)

(assert (=> b!108345 (= lt!163188 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4708 lt!163182) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!163174 e!70877)))))

(declare-fun lt!163194 () Unit!6612)

(assert (=> b!108345 (= lt!163194 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4708 lt!163182) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!163174))))

(assert (=> b!108345 (and (= (_2!4707 lt!163204) (_2!4707 lt!163188)) (= (_1!4707 lt!163204) (_1!4707 lt!163188)))))

(declare-fun lt!163206 () Unit!6612)

(assert (=> b!108345 (= lt!163206 lt!163194)))

(assert (=> b!108345 (= (_1!4708 lt!163182) (withMovedBitIndex!0 (_2!4708 lt!163182) (bvsub (bitIndex!0 (size!2247 (buf!2635 (_2!4706 lt!162271))) (currentByte!5165 (_2!4706 lt!162271)) (currentBit!5160 (_2!4706 lt!162271))) (bitIndex!0 (size!2247 (buf!2635 (_2!4706 lt!163211))) (currentByte!5165 (_2!4706 lt!163211)) (currentBit!5160 (_2!4706 lt!163211))))))))

(declare-fun lt!163171 () Unit!6612)

(declare-fun Unit!6633 () Unit!6612)

(assert (=> b!108345 (= lt!163171 Unit!6633)))

(assert (=> b!108345 (= (_1!4708 lt!163201) (withMovedBitIndex!0 (_2!4708 lt!163201) (bvsub (bitIndex!0 (size!2247 (buf!2635 (_2!4706 lt!163205))) (currentByte!5165 (_2!4706 lt!163205)) (currentBit!5160 (_2!4706 lt!163205))) (bitIndex!0 (size!2247 (buf!2635 (_2!4706 lt!163211))) (currentByte!5165 (_2!4706 lt!163211)) (currentBit!5160 (_2!4706 lt!163211))))))))

(declare-fun lt!163189 () Unit!6612)

(declare-fun Unit!6634 () Unit!6612)

(assert (=> b!108345 (= lt!163189 Unit!6634)))

(assert (=> b!108345 (= (bitIndex!0 (size!2247 (buf!2635 (_2!4706 lt!162271))) (currentByte!5165 (_2!4706 lt!162271)) (currentBit!5160 (_2!4706 lt!162271))) (bvsub (bitIndex!0 (size!2247 (buf!2635 (_2!4706 lt!163205))) (currentByte!5165 (_2!4706 lt!163205)) (currentBit!5160 (_2!4706 lt!163205))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!163180 () Unit!6612)

(declare-fun Unit!6635 () Unit!6612)

(assert (=> b!108345 (= lt!163180 Unit!6635)))

(assert (=> b!108345 (= (_2!4707 lt!163212) (_2!4707 lt!163207))))

(declare-fun lt!163172 () Unit!6612)

(declare-fun Unit!6636 () Unit!6612)

(assert (=> b!108345 (= lt!163172 Unit!6636)))

(assert (=> b!108345 (= (_1!4707 lt!163212) (_2!4708 lt!163182))))

(declare-fun d!34266 () Bool)

(assert (=> d!34266 e!70875))

(declare-fun res!89292 () Bool)

(assert (=> d!34266 (=> (not res!89292) (not e!70875))))

(assert (=> d!34266 (= res!89292 (= (size!2247 (buf!2635 (_2!4706 lt!162271))) (size!2247 (buf!2635 (_2!4706 lt!163168)))))))

(assert (=> d!34266 (= lt!163168 e!70873)))

(declare-fun c!6688 () Bool)

(assert (=> d!34266 (= c!6688 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!34266 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!34266 (= (appendNLeastSignificantBitsLoop!0 (_2!4706 lt!162271) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!163168)))

(declare-fun b!108337 () Bool)

(declare-fun lt!163186 () Unit!6612)

(assert (=> b!108337 (= e!70873 (tuple2!8899 lt!163186 (_2!4706 lt!162271)))))

(declare-fun lt!163197 () BitStream!3968)

(assert (=> b!108337 (= lt!163197 (_2!4706 lt!162271))))

(assert (=> b!108337 (= lt!163186 (lemmaIsPrefixRefl!0 lt!163197))))

(assert (=> b!108337 call!1377))

(declare-fun b!108346 () Bool)

(assert (=> b!108346 (= e!70876 (validate_offset_bits!1 ((_ sign_extend 32) (size!2247 (buf!2635 (_2!4706 lt!162271)))) ((_ sign_extend 32) (currentByte!5165 (_2!4706 lt!162271))) ((_ sign_extend 32) (currentBit!5160 (_2!4706 lt!162271))) lt!163181))))

(declare-fun bm!1374 () Bool)

(assert (=> bm!1374 (= call!1377 (isPrefixOf!0 (ite c!6688 (_2!4706 lt!162271) lt!163197) (ite c!6688 (_2!4706 lt!163177) lt!163197)))))

(assert (= (and d!34266 c!6688) b!108345))

(assert (= (and d!34266 (not c!6688)) b!108337))

(assert (= (and b!108345 res!89289) b!108334))

(assert (= (and b!108334 res!89286) b!108344))

(assert (= (and b!108344 res!89293) b!108343))

(assert (= (and b!108343 res!89287) b!108336))

(assert (= (and b!108345 res!89285) b!108339))

(assert (= (and b!108345 c!6687) b!108335))

(assert (= (and b!108345 (not c!6687)) b!108338))

(assert (= (or b!108344 b!108337) bm!1374))

(assert (= (and d!34266 res!89292) b!108342))

(assert (= (and b!108342 res!89291) b!108341))

(assert (= (and b!108341 res!89288) b!108340))

(assert (= (and b!108340 res!89290) b!108346))

(declare-fun m!160487 () Bool)

(assert (=> b!108341 m!160487))

(declare-fun m!160489 () Bool)

(assert (=> b!108337 m!160489))

(declare-fun m!160491 () Bool)

(assert (=> b!108340 m!160491))

(declare-fun m!160493 () Bool)

(assert (=> b!108340 m!160493))

(declare-fun m!160495 () Bool)

(assert (=> b!108340 m!160495))

(declare-fun m!160497 () Bool)

(assert (=> b!108340 m!160497))

(declare-fun m!160499 () Bool)

(assert (=> b!108340 m!160499))

(declare-fun m!160501 () Bool)

(assert (=> b!108334 m!160501))

(assert (=> b!108334 m!159891))

(declare-fun m!160503 () Bool)

(assert (=> b!108345 m!160503))

(declare-fun m!160505 () Bool)

(assert (=> b!108345 m!160505))

(declare-fun m!160507 () Bool)

(assert (=> b!108345 m!160507))

(declare-fun m!160509 () Bool)

(assert (=> b!108345 m!160509))

(declare-fun m!160511 () Bool)

(assert (=> b!108345 m!160511))

(declare-fun m!160513 () Bool)

(assert (=> b!108345 m!160513))

(declare-fun m!160515 () Bool)

(assert (=> b!108345 m!160515))

(declare-fun m!160517 () Bool)

(assert (=> b!108345 m!160517))

(declare-fun m!160519 () Bool)

(assert (=> b!108345 m!160519))

(declare-fun m!160521 () Bool)

(assert (=> b!108345 m!160521))

(assert (=> b!108345 m!159891))

(declare-fun m!160523 () Bool)

(assert (=> b!108345 m!160523))

(declare-fun m!160525 () Bool)

(assert (=> b!108345 m!160525))

(declare-fun m!160527 () Bool)

(assert (=> b!108345 m!160527))

(declare-fun m!160529 () Bool)

(assert (=> b!108345 m!160529))

(declare-fun m!160531 () Bool)

