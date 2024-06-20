; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22766 () Bool)

(assert start!22766)

(declare-fun b!114926 () Bool)

(declare-fun e!75357 () Bool)

(declare-datatypes ((array!5192 0))(
  ( (array!5193 (arr!2949 (Array (_ BitVec 32) (_ BitVec 8))) (size!2356 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4186 0))(
  ( (BitStream!4187 (buf!2766 array!5192) (currentByte!5385 (_ BitVec 32)) (currentBit!5380 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!9460 0))(
  ( (tuple2!9461 (_1!4995 BitStream!4186) (_2!4995 BitStream!4186)) )
))
(declare-fun lt!175138 () tuple2!9460)

(declare-fun lt!175134 () Bool)

(declare-datatypes ((tuple2!9462 0))(
  ( (tuple2!9463 (_1!4996 BitStream!4186) (_2!4996 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!4186) tuple2!9462)

(assert (=> b!114926 (= e!75357 (not (= (_2!4996 (readBitPure!0 (_1!4995 lt!175138))) lt!175134)))))

(declare-fun lt!175140 () tuple2!9460)

(declare-datatypes ((Unit!7069 0))(
  ( (Unit!7070) )
))
(declare-datatypes ((tuple2!9464 0))(
  ( (tuple2!9465 (_1!4997 Unit!7069) (_2!4997 BitStream!4186)) )
))
(declare-fun lt!175133 () tuple2!9464)

(declare-fun lt!175132 () tuple2!9464)

(declare-fun reader!0 (BitStream!4186 BitStream!4186) tuple2!9460)

(assert (=> b!114926 (= lt!175140 (reader!0 (_2!4997 lt!175133) (_2!4997 lt!175132)))))

(declare-fun thiss!1305 () BitStream!4186)

(assert (=> b!114926 (= lt!175138 (reader!0 thiss!1305 (_2!4997 lt!175132)))))

(declare-fun e!75362 () Bool)

(assert (=> b!114926 e!75362))

(declare-fun res!94955 () Bool)

(assert (=> b!114926 (=> (not res!94955) (not e!75362))))

(declare-fun lt!175136 () tuple2!9462)

(declare-fun lt!175131 () tuple2!9462)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!114926 (= res!94955 (= (bitIndex!0 (size!2356 (buf!2766 (_1!4996 lt!175136))) (currentByte!5385 (_1!4996 lt!175136)) (currentBit!5380 (_1!4996 lt!175136))) (bitIndex!0 (size!2356 (buf!2766 (_1!4996 lt!175131))) (currentByte!5385 (_1!4996 lt!175131)) (currentBit!5380 (_1!4996 lt!175131)))))))

(declare-fun lt!175139 () Unit!7069)

(declare-fun lt!175129 () BitStream!4186)

(declare-fun readBitPrefixLemma!0 (BitStream!4186 BitStream!4186) Unit!7069)

(assert (=> b!114926 (= lt!175139 (readBitPrefixLemma!0 lt!175129 (_2!4997 lt!175132)))))

(assert (=> b!114926 (= lt!175131 (readBitPure!0 (BitStream!4187 (buf!2766 (_2!4997 lt!175132)) (currentByte!5385 thiss!1305) (currentBit!5380 thiss!1305))))))

(assert (=> b!114926 (= lt!175136 (readBitPure!0 lt!175129))))

(assert (=> b!114926 (= lt!175129 (BitStream!4187 (buf!2766 (_2!4997 lt!175133)) (currentByte!5385 thiss!1305) (currentBit!5380 thiss!1305)))))

(declare-fun e!75359 () Bool)

(assert (=> b!114926 e!75359))

(declare-fun res!94954 () Bool)

(assert (=> b!114926 (=> (not res!94954) (not e!75359))))

(declare-fun isPrefixOf!0 (BitStream!4186 BitStream!4186) Bool)

(assert (=> b!114926 (= res!94954 (isPrefixOf!0 thiss!1305 (_2!4997 lt!175132)))))

(declare-fun lt!175137 () Unit!7069)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4186 BitStream!4186 BitStream!4186) Unit!7069)

(assert (=> b!114926 (= lt!175137 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4997 lt!175133) (_2!4997 lt!175132)))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4186 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9464)

(assert (=> b!114926 (= lt!175132 (appendNLeastSignificantBitsLoop!0 (_2!4997 lt!175133) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!75356 () Bool)

(assert (=> b!114926 e!75356))

(declare-fun res!94962 () Bool)

(assert (=> b!114926 (=> (not res!94962) (not e!75356))))

(assert (=> b!114926 (= res!94962 (= (size!2356 (buf!2766 thiss!1305)) (size!2356 (buf!2766 (_2!4997 lt!175133)))))))

(declare-fun appendBit!0 (BitStream!4186 Bool) tuple2!9464)

(assert (=> b!114926 (= lt!175133 (appendBit!0 thiss!1305 lt!175134))))

(assert (=> b!114926 (= lt!175134 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!114927 () Bool)

(assert (=> b!114927 (= e!75362 (= (_2!4996 lt!175136) (_2!4996 lt!175131)))))

(declare-fun b!114928 () Bool)

(declare-fun res!94953 () Bool)

(assert (=> b!114928 (=> (not res!94953) (not e!75357))))

(assert (=> b!114928 (= res!94953 (bvslt i!615 nBits!396))))

(declare-fun b!114929 () Bool)

(declare-fun e!75358 () Bool)

(assert (=> b!114929 (= e!75356 e!75358)))

(declare-fun res!94960 () Bool)

(assert (=> b!114929 (=> (not res!94960) (not e!75358))))

(declare-fun lt!175128 () (_ BitVec 64))

(declare-fun lt!175135 () (_ BitVec 64))

(assert (=> b!114929 (= res!94960 (= lt!175128 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!175135)))))

(assert (=> b!114929 (= lt!175128 (bitIndex!0 (size!2356 (buf!2766 (_2!4997 lt!175133))) (currentByte!5385 (_2!4997 lt!175133)) (currentBit!5380 (_2!4997 lt!175133))))))

(assert (=> b!114929 (= lt!175135 (bitIndex!0 (size!2356 (buf!2766 thiss!1305)) (currentByte!5385 thiss!1305) (currentBit!5380 thiss!1305)))))

(declare-fun b!114930 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!114930 (= e!75359 (invariant!0 (currentBit!5380 thiss!1305) (currentByte!5385 thiss!1305) (size!2356 (buf!2766 (_2!4997 lt!175132)))))))

(declare-fun b!114931 () Bool)

(declare-fun res!94959 () Bool)

(assert (=> b!114931 (=> (not res!94959) (not e!75359))))

(assert (=> b!114931 (= res!94959 (invariant!0 (currentBit!5380 thiss!1305) (currentByte!5385 thiss!1305) (size!2356 (buf!2766 (_2!4997 lt!175133)))))))

(declare-fun b!114932 () Bool)

(declare-fun e!75361 () Bool)

(declare-fun lt!175130 () tuple2!9462)

(assert (=> b!114932 (= e!75361 (= (bitIndex!0 (size!2356 (buf!2766 (_1!4996 lt!175130))) (currentByte!5385 (_1!4996 lt!175130)) (currentBit!5380 (_1!4996 lt!175130))) lt!175128))))

(declare-fun res!94956 () Bool)

(assert (=> start!22766 (=> (not res!94956) (not e!75357))))

(assert (=> start!22766 (= res!94956 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22766 e!75357))

(assert (=> start!22766 true))

(declare-fun e!75360 () Bool)

(declare-fun inv!12 (BitStream!4186) Bool)

(assert (=> start!22766 (and (inv!12 thiss!1305) e!75360)))

(declare-fun b!114933 () Bool)

(declare-fun array_inv!2158 (array!5192) Bool)

(assert (=> b!114933 (= e!75360 (array_inv!2158 (buf!2766 thiss!1305)))))

(declare-fun b!114934 () Bool)

(declare-fun res!94961 () Bool)

(assert (=> b!114934 (=> (not res!94961) (not e!75357))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!114934 (= res!94961 (validate_offset_bits!1 ((_ sign_extend 32) (size!2356 (buf!2766 thiss!1305))) ((_ sign_extend 32) (currentByte!5385 thiss!1305)) ((_ sign_extend 32) (currentBit!5380 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!114935 () Bool)

(declare-fun res!94952 () Bool)

(assert (=> b!114935 (=> (not res!94952) (not e!75357))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!114935 (= res!94952 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!114936 () Bool)

(assert (=> b!114936 (= e!75358 e!75361)))

(declare-fun res!94957 () Bool)

(assert (=> b!114936 (=> (not res!94957) (not e!75361))))

(assert (=> b!114936 (= res!94957 (and (= (_2!4996 lt!175130) lt!175134) (= (_1!4996 lt!175130) (_2!4997 lt!175133))))))

(declare-fun readerFrom!0 (BitStream!4186 (_ BitVec 32) (_ BitVec 32)) BitStream!4186)

(assert (=> b!114936 (= lt!175130 (readBitPure!0 (readerFrom!0 (_2!4997 lt!175133) (currentBit!5380 thiss!1305) (currentByte!5385 thiss!1305))))))

(declare-fun b!114937 () Bool)

(declare-fun res!94958 () Bool)

(assert (=> b!114937 (=> (not res!94958) (not e!75358))))

(assert (=> b!114937 (= res!94958 (isPrefixOf!0 thiss!1305 (_2!4997 lt!175133)))))

(assert (= (and start!22766 res!94956) b!114934))

(assert (= (and b!114934 res!94961) b!114935))

(assert (= (and b!114935 res!94952) b!114928))

(assert (= (and b!114928 res!94953) b!114926))

(assert (= (and b!114926 res!94962) b!114929))

(assert (= (and b!114929 res!94960) b!114937))

(assert (= (and b!114937 res!94958) b!114936))

(assert (= (and b!114936 res!94957) b!114932))

(assert (= (and b!114926 res!94954) b!114931))

(assert (= (and b!114931 res!94959) b!114930))

(assert (= (and b!114926 res!94955) b!114927))

(assert (= start!22766 b!114933))

(declare-fun m!171923 () Bool)

(assert (=> start!22766 m!171923))

(declare-fun m!171925 () Bool)

(assert (=> b!114936 m!171925))

(assert (=> b!114936 m!171925))

(declare-fun m!171927 () Bool)

(assert (=> b!114936 m!171927))

(declare-fun m!171929 () Bool)

(assert (=> b!114929 m!171929))

(declare-fun m!171931 () Bool)

(assert (=> b!114929 m!171931))

(declare-fun m!171933 () Bool)

(assert (=> b!114934 m!171933))

(declare-fun m!171935 () Bool)

(assert (=> b!114926 m!171935))

(declare-fun m!171937 () Bool)

(assert (=> b!114926 m!171937))

(declare-fun m!171939 () Bool)

(assert (=> b!114926 m!171939))

(declare-fun m!171941 () Bool)

(assert (=> b!114926 m!171941))

(declare-fun m!171943 () Bool)

(assert (=> b!114926 m!171943))

(declare-fun m!171945 () Bool)

(assert (=> b!114926 m!171945))

(declare-fun m!171947 () Bool)

(assert (=> b!114926 m!171947))

(declare-fun m!171949 () Bool)

(assert (=> b!114926 m!171949))

(declare-fun m!171951 () Bool)

(assert (=> b!114926 m!171951))

(declare-fun m!171953 () Bool)

(assert (=> b!114926 m!171953))

(declare-fun m!171955 () Bool)

(assert (=> b!114926 m!171955))

(declare-fun m!171957 () Bool)

(assert (=> b!114926 m!171957))

(declare-fun m!171959 () Bool)

(assert (=> b!114932 m!171959))

(declare-fun m!171961 () Bool)

(assert (=> b!114933 m!171961))

(declare-fun m!171963 () Bool)

(assert (=> b!114931 m!171963))

(declare-fun m!171965 () Bool)

(assert (=> b!114935 m!171965))

(declare-fun m!171967 () Bool)

(assert (=> b!114930 m!171967))

(declare-fun m!171969 () Bool)

(assert (=> b!114937 m!171969))

(push 1)

(assert (not start!22766))

(assert (not b!114926))

(assert (not b!114931))

(assert (not b!114934))

(assert (not b!114935))

(assert (not b!114932))

(assert (not b!114936))

(assert (not b!114937))

(assert (not b!114929))

(assert (not b!114930))

(assert (not b!114933))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!37068 () Bool)

(declare-fun e!75428 () Bool)

(assert (=> d!37068 e!75428))

(declare-fun res!95055 () Bool)

(assert (=> d!37068 (=> (not res!95055) (not e!75428))))

(declare-fun lt!175278 () (_ BitVec 64))

(declare-fun lt!175279 () (_ BitVec 64))

(declare-fun lt!175277 () (_ BitVec 64))

(assert (=> d!37068 (= res!95055 (= lt!175278 (bvsub lt!175279 lt!175277)))))

(assert (=> d!37068 (or (= (bvand lt!175279 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!175277 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!175279 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!175279 lt!175277) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!37068 (= lt!175277 (remainingBits!0 ((_ sign_extend 32) (size!2356 (buf!2766 (_2!4997 lt!175133)))) ((_ sign_extend 32) (currentByte!5385 (_2!4997 lt!175133))) ((_ sign_extend 32) (currentBit!5380 (_2!4997 lt!175133)))))))

(declare-fun lt!175276 () (_ BitVec 64))

(declare-fun lt!175281 () (_ BitVec 64))

(assert (=> d!37068 (= lt!175279 (bvmul lt!175276 lt!175281))))

(assert (=> d!37068 (or (= lt!175276 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!175281 (bvsdiv (bvmul lt!175276 lt!175281) lt!175276)))))

(assert (=> d!37068 (= lt!175281 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37068 (= lt!175276 ((_ sign_extend 32) (size!2356 (buf!2766 (_2!4997 lt!175133)))))))

(assert (=> d!37068 (= lt!175278 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5385 (_2!4997 lt!175133))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5380 (_2!4997 lt!175133)))))))

(assert (=> d!37068 (invariant!0 (currentBit!5380 (_2!4997 lt!175133)) (currentByte!5385 (_2!4997 lt!175133)) (size!2356 (buf!2766 (_2!4997 lt!175133))))))

(assert (=> d!37068 (= (bitIndex!0 (size!2356 (buf!2766 (_2!4997 lt!175133))) (currentByte!5385 (_2!4997 lt!175133)) (currentBit!5380 (_2!4997 lt!175133))) lt!175278)))

(declare-fun b!115036 () Bool)

(declare-fun res!95056 () Bool)

(assert (=> b!115036 (=> (not res!95056) (not e!75428))))

(assert (=> b!115036 (= res!95056 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!175278))))

(declare-fun b!115037 () Bool)

(declare-fun lt!175280 () (_ BitVec 64))

(assert (=> b!115037 (= e!75428 (bvsle lt!175278 (bvmul lt!175280 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!115037 (or (= lt!175280 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!175280 #b0000000000000000000000000000000000000000000000000000000000001000) lt!175280)))))

(assert (=> b!115037 (= lt!175280 ((_ sign_extend 32) (size!2356 (buf!2766 (_2!4997 lt!175133)))))))

(assert (= (and d!37068 res!95055) b!115036))

(assert (= (and b!115036 res!95056) b!115037))

(declare-fun m!172099 () Bool)

(assert (=> d!37068 m!172099))

(declare-fun m!172101 () Bool)

(assert (=> d!37068 m!172101))

(assert (=> b!114929 d!37068))

(declare-fun d!37072 () Bool)

(declare-fun e!75429 () Bool)

(assert (=> d!37072 e!75429))

(declare-fun res!95057 () Bool)

(assert (=> d!37072 (=> (not res!95057) (not e!75429))))

(declare-fun lt!175285 () (_ BitVec 64))

(declare-fun lt!175284 () (_ BitVec 64))

(declare-fun lt!175283 () (_ BitVec 64))

(assert (=> d!37072 (= res!95057 (= lt!175284 (bvsub lt!175285 lt!175283)))))

(assert (=> d!37072 (or (= (bvand lt!175285 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!175283 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!175285 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!175285 lt!175283) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37072 (= lt!175283 (remainingBits!0 ((_ sign_extend 32) (size!2356 (buf!2766 thiss!1305))) ((_ sign_extend 32) (currentByte!5385 thiss!1305)) ((_ sign_extend 32) (currentBit!5380 thiss!1305))))))

(declare-fun lt!175282 () (_ BitVec 64))

(declare-fun lt!175287 () (_ BitVec 64))

(assert (=> d!37072 (= lt!175285 (bvmul lt!175282 lt!175287))))

(assert (=> d!37072 (or (= lt!175282 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!175287 (bvsdiv (bvmul lt!175282 lt!175287) lt!175282)))))

(assert (=> d!37072 (= lt!175287 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37072 (= lt!175282 ((_ sign_extend 32) (size!2356 (buf!2766 thiss!1305))))))

(assert (=> d!37072 (= lt!175284 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5385 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5380 thiss!1305))))))

(assert (=> d!37072 (invariant!0 (currentBit!5380 thiss!1305) (currentByte!5385 thiss!1305) (size!2356 (buf!2766 thiss!1305)))))

(assert (=> d!37072 (= (bitIndex!0 (size!2356 (buf!2766 thiss!1305)) (currentByte!5385 thiss!1305) (currentBit!5380 thiss!1305)) lt!175284)))

(declare-fun b!115038 () Bool)

(declare-fun res!95058 () Bool)

(assert (=> b!115038 (=> (not res!95058) (not e!75429))))

(assert (=> b!115038 (= res!95058 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!175284))))

(declare-fun b!115039 () Bool)

(declare-fun lt!175286 () (_ BitVec 64))

(assert (=> b!115039 (= e!75429 (bvsle lt!175284 (bvmul lt!175286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!115039 (or (= lt!175286 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!175286 #b0000000000000000000000000000000000000000000000000000000000001000) lt!175286)))))

(assert (=> b!115039 (= lt!175286 ((_ sign_extend 32) (size!2356 (buf!2766 thiss!1305))))))

(assert (= (and d!37072 res!95057) b!115038))

(assert (= (and b!115038 res!95058) b!115039))

(declare-fun m!172103 () Bool)

(assert (=> d!37072 m!172103))

(declare-fun m!172105 () Bool)

(assert (=> d!37072 m!172105))

(assert (=> b!114929 d!37072))

(declare-fun d!37074 () Bool)

(assert (=> d!37074 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2356 (buf!2766 thiss!1305))) ((_ sign_extend 32) (currentByte!5385 thiss!1305)) ((_ sign_extend 32) (currentBit!5380 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2356 (buf!2766 thiss!1305))) ((_ sign_extend 32) (currentByte!5385 thiss!1305)) ((_ sign_extend 32) (currentBit!5380 thiss!1305))) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun bs!8976 () Bool)

(assert (= bs!8976 d!37074))

(assert (=> bs!8976 m!172103))

(assert (=> b!114934 d!37074))

(declare-fun d!37076 () Bool)

(declare-datatypes ((tuple2!9482 0))(
  ( (tuple2!9483 (_1!5006 Bool) (_2!5006 BitStream!4186)) )
))
(declare-fun lt!175302 () tuple2!9482)

(declare-fun readBit!0 (BitStream!4186) tuple2!9482)

(assert (=> d!37076 (= lt!175302 (readBit!0 (readerFrom!0 (_2!4997 lt!175133) (currentBit!5380 thiss!1305) (currentByte!5385 thiss!1305))))))

(assert (=> d!37076 (= (readBitPure!0 (readerFrom!0 (_2!4997 lt!175133) (currentBit!5380 thiss!1305) (currentByte!5385 thiss!1305))) (tuple2!9463 (_2!5006 lt!175302) (_1!5006 lt!175302)))))

(declare-fun bs!8977 () Bool)

(assert (= bs!8977 d!37076))

(assert (=> bs!8977 m!171925))

(declare-fun m!172107 () Bool)

(assert (=> bs!8977 m!172107))

(assert (=> b!114936 d!37076))

(declare-fun d!37078 () Bool)

(declare-fun e!75435 () Bool)

(assert (=> d!37078 e!75435))

(declare-fun res!95068 () Bool)

(assert (=> d!37078 (=> (not res!95068) (not e!75435))))

(assert (=> d!37078 (= res!95068 (invariant!0 (currentBit!5380 (_2!4997 lt!175133)) (currentByte!5385 (_2!4997 lt!175133)) (size!2356 (buf!2766 (_2!4997 lt!175133)))))))

(assert (=> d!37078 (= (readerFrom!0 (_2!4997 lt!175133) (currentBit!5380 thiss!1305) (currentByte!5385 thiss!1305)) (BitStream!4187 (buf!2766 (_2!4997 lt!175133)) (currentByte!5385 thiss!1305) (currentBit!5380 thiss!1305)))))

(declare-fun b!115048 () Bool)

(assert (=> b!115048 (= e!75435 (invariant!0 (currentBit!5380 thiss!1305) (currentByte!5385 thiss!1305) (size!2356 (buf!2766 (_2!4997 lt!175133)))))))

(assert (= (and d!37078 res!95068) b!115048))

(assert (=> d!37078 m!172101))

(assert (=> b!115048 m!171963))

(assert (=> b!114936 d!37078))

(declare-fun d!37082 () Bool)

(assert (=> d!37082 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!114935 d!37082))

(declare-fun d!37084 () Bool)

(assert (=> d!37084 (= (invariant!0 (currentBit!5380 thiss!1305) (currentByte!5385 thiss!1305) (size!2356 (buf!2766 (_2!4997 lt!175132)))) (and (bvsge (currentBit!5380 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5380 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5385 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5385 thiss!1305) (size!2356 (buf!2766 (_2!4997 lt!175132)))) (and (= (currentBit!5380 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5385 thiss!1305) (size!2356 (buf!2766 (_2!4997 lt!175132))))))))))

(assert (=> b!114930 d!37084))

(declare-fun d!37088 () Bool)

(declare-fun res!95083 () Bool)

(declare-fun e!75444 () Bool)

(assert (=> d!37088 (=> (not res!95083) (not e!75444))))

(assert (=> d!37088 (= res!95083 (= (size!2356 (buf!2766 thiss!1305)) (size!2356 (buf!2766 (_2!4997 lt!175133)))))))

(assert (=> d!37088 (= (isPrefixOf!0 thiss!1305 (_2!4997 lt!175133)) e!75444)))

(declare-fun b!115060 () Bool)

(declare-fun res!95082 () Bool)

(assert (=> b!115060 (=> (not res!95082) (not e!75444))))

(assert (=> b!115060 (= res!95082 (bvsle (bitIndex!0 (size!2356 (buf!2766 thiss!1305)) (currentByte!5385 thiss!1305) (currentBit!5380 thiss!1305)) (bitIndex!0 (size!2356 (buf!2766 (_2!4997 lt!175133))) (currentByte!5385 (_2!4997 lt!175133)) (currentBit!5380 (_2!4997 lt!175133)))))))

(declare-fun b!115061 () Bool)

(declare-fun e!75445 () Bool)

(assert (=> b!115061 (= e!75444 e!75445)))

(declare-fun res!95081 () Bool)

(assert (=> b!115061 (=> res!95081 e!75445)))

(assert (=> b!115061 (= res!95081 (= (size!2356 (buf!2766 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!115062 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5192 array!5192 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!115062 (= e!75445 (arrayBitRangesEq!0 (buf!2766 thiss!1305) (buf!2766 (_2!4997 lt!175133)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2356 (buf!2766 thiss!1305)) (currentByte!5385 thiss!1305) (currentBit!5380 thiss!1305))))))

(assert (= (and d!37088 res!95083) b!115060))

(assert (= (and b!115060 res!95082) b!115061))

(assert (= (and b!115061 (not res!95081)) b!115062))

(assert (=> b!115060 m!171931))

(assert (=> b!115060 m!171929))

(assert (=> b!115062 m!171931))

(assert (=> b!115062 m!171931))

(declare-fun m!172123 () Bool)

(assert (=> b!115062 m!172123))

(assert (=> b!114937 d!37088))

(declare-fun d!37096 () Bool)

(declare-fun e!75446 () Bool)

(assert (=> d!37096 e!75446))

(declare-fun res!95084 () Bool)

(assert (=> d!37096 (=> (not res!95084) (not e!75446))))

(declare-fun lt!175322 () (_ BitVec 64))

(declare-fun lt!175320 () (_ BitVec 64))

(declare-fun lt!175321 () (_ BitVec 64))

(assert (=> d!37096 (= res!95084 (= lt!175321 (bvsub lt!175322 lt!175320)))))

(assert (=> d!37096 (or (= (bvand lt!175322 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!175320 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!175322 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!175322 lt!175320) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37096 (= lt!175320 (remainingBits!0 ((_ sign_extend 32) (size!2356 (buf!2766 (_1!4996 lt!175130)))) ((_ sign_extend 32) (currentByte!5385 (_1!4996 lt!175130))) ((_ sign_extend 32) (currentBit!5380 (_1!4996 lt!175130)))))))

(declare-fun lt!175319 () (_ BitVec 64))

(declare-fun lt!175324 () (_ BitVec 64))

(assert (=> d!37096 (= lt!175322 (bvmul lt!175319 lt!175324))))

(assert (=> d!37096 (or (= lt!175319 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!175324 (bvsdiv (bvmul lt!175319 lt!175324) lt!175319)))))

(assert (=> d!37096 (= lt!175324 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37096 (= lt!175319 ((_ sign_extend 32) (size!2356 (buf!2766 (_1!4996 lt!175130)))))))

(assert (=> d!37096 (= lt!175321 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5385 (_1!4996 lt!175130))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5380 (_1!4996 lt!175130)))))))

(assert (=> d!37096 (invariant!0 (currentBit!5380 (_1!4996 lt!175130)) (currentByte!5385 (_1!4996 lt!175130)) (size!2356 (buf!2766 (_1!4996 lt!175130))))))

(assert (=> d!37096 (= (bitIndex!0 (size!2356 (buf!2766 (_1!4996 lt!175130))) (currentByte!5385 (_1!4996 lt!175130)) (currentBit!5380 (_1!4996 lt!175130))) lt!175321)))

(declare-fun b!115063 () Bool)

(declare-fun res!95085 () Bool)

(assert (=> b!115063 (=> (not res!95085) (not e!75446))))

(assert (=> b!115063 (= res!95085 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!175321))))

(declare-fun b!115064 () Bool)

(declare-fun lt!175323 () (_ BitVec 64))

(assert (=> b!115064 (= e!75446 (bvsle lt!175321 (bvmul lt!175323 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!115064 (or (= lt!175323 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!175323 #b0000000000000000000000000000000000000000000000000000000000001000) lt!175323)))))

(assert (=> b!115064 (= lt!175323 ((_ sign_extend 32) (size!2356 (buf!2766 (_1!4996 lt!175130)))))))

(assert (= (and d!37096 res!95084) b!115063))

(assert (= (and b!115063 res!95085) b!115064))

(declare-fun m!172125 () Bool)

(assert (=> d!37096 m!172125))

(declare-fun m!172127 () Bool)

(assert (=> d!37096 m!172127))

(assert (=> b!114932 d!37096))

(declare-fun d!37098 () Bool)

(assert (=> d!37098 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5380 thiss!1305) (currentByte!5385 thiss!1305) (size!2356 (buf!2766 thiss!1305))))))

(declare-fun bs!8980 () Bool)

(assert (= bs!8980 d!37098))

(assert (=> bs!8980 m!172105))

(assert (=> start!22766 d!37098))

(declare-fun d!37100 () Bool)

(assert (=> d!37100 (= (invariant!0 (currentBit!5380 thiss!1305) (currentByte!5385 thiss!1305) (size!2356 (buf!2766 (_2!4997 lt!175133)))) (and (bvsge (currentBit!5380 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5380 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5385 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5385 thiss!1305) (size!2356 (buf!2766 (_2!4997 lt!175133)))) (and (= (currentBit!5380 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5385 thiss!1305) (size!2356 (buf!2766 (_2!4997 lt!175133))))))))))

(assert (=> b!114931 d!37100))

(declare-fun d!37102 () Bool)

(declare-fun e!75447 () Bool)

(assert (=> d!37102 e!75447))

(declare-fun res!95086 () Bool)

(assert (=> d!37102 (=> (not res!95086) (not e!75447))))

(declare-fun lt!175327 () (_ BitVec 64))

(declare-fun lt!175328 () (_ BitVec 64))

(declare-fun lt!175326 () (_ BitVec 64))

(assert (=> d!37102 (= res!95086 (= lt!175327 (bvsub lt!175328 lt!175326)))))

(assert (=> d!37102 (or (= (bvand lt!175328 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!175326 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!175328 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!175328 lt!175326) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37102 (= lt!175326 (remainingBits!0 ((_ sign_extend 32) (size!2356 (buf!2766 (_1!4996 lt!175136)))) ((_ sign_extend 32) (currentByte!5385 (_1!4996 lt!175136))) ((_ sign_extend 32) (currentBit!5380 (_1!4996 lt!175136)))))))

(declare-fun lt!175325 () (_ BitVec 64))

(declare-fun lt!175330 () (_ BitVec 64))

(assert (=> d!37102 (= lt!175328 (bvmul lt!175325 lt!175330))))

(assert (=> d!37102 (or (= lt!175325 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!175330 (bvsdiv (bvmul lt!175325 lt!175330) lt!175325)))))

(assert (=> d!37102 (= lt!175330 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37102 (= lt!175325 ((_ sign_extend 32) (size!2356 (buf!2766 (_1!4996 lt!175136)))))))

(assert (=> d!37102 (= lt!175327 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5385 (_1!4996 lt!175136))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5380 (_1!4996 lt!175136)))))))

(assert (=> d!37102 (invariant!0 (currentBit!5380 (_1!4996 lt!175136)) (currentByte!5385 (_1!4996 lt!175136)) (size!2356 (buf!2766 (_1!4996 lt!175136))))))

(assert (=> d!37102 (= (bitIndex!0 (size!2356 (buf!2766 (_1!4996 lt!175136))) (currentByte!5385 (_1!4996 lt!175136)) (currentBit!5380 (_1!4996 lt!175136))) lt!175327)))

(declare-fun b!115065 () Bool)

(declare-fun res!95087 () Bool)

(assert (=> b!115065 (=> (not res!95087) (not e!75447))))

(assert (=> b!115065 (= res!95087 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!175327))))

(declare-fun b!115066 () Bool)

(declare-fun lt!175329 () (_ BitVec 64))

(assert (=> b!115066 (= e!75447 (bvsle lt!175327 (bvmul lt!175329 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!115066 (or (= lt!175329 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!175329 #b0000000000000000000000000000000000000000000000000000000000001000) lt!175329)))))

(assert (=> b!115066 (= lt!175329 ((_ sign_extend 32) (size!2356 (buf!2766 (_1!4996 lt!175136)))))))

(assert (= (and d!37102 res!95086) b!115065))

(assert (= (and b!115065 res!95087) b!115066))

(declare-fun m!172129 () Bool)

(assert (=> d!37102 m!172129))

(declare-fun m!172131 () Bool)

(assert (=> d!37102 m!172131))

(assert (=> b!114926 d!37102))

(declare-fun b!115204 () Bool)

(declare-fun e!75522 () Bool)

(declare-fun lt!175773 () tuple2!9462)

(declare-fun lt!175786 () tuple2!9462)

(assert (=> b!115204 (= e!75522 (= (_2!4996 lt!175773) (_2!4996 lt!175786)))))

(declare-fun c!6989 () Bool)

(declare-fun call!1496 () Bool)

(declare-fun lt!175771 () tuple2!9464)

(declare-fun lt!175763 () BitStream!4186)

(declare-fun bm!1493 () Bool)

(assert (=> bm!1493 (= call!1496 (isPrefixOf!0 (ite c!6989 (_2!4997 lt!175133) lt!175763) (ite c!6989 (_2!4997 lt!175771) lt!175763)))))

(declare-fun b!115205 () Bool)

(declare-fun e!75521 () Bool)

(declare-fun lt!175762 () (_ BitVec 64))

(assert (=> b!115205 (= e!75521 (validate_offset_bits!1 ((_ sign_extend 32) (size!2356 (buf!2766 (_2!4997 lt!175133)))) ((_ sign_extend 32) (currentByte!5385 (_2!4997 lt!175133))) ((_ sign_extend 32) (currentBit!5380 (_2!4997 lt!175133))) lt!175762))))

(declare-fun b!115206 () Bool)

(declare-fun lt!175792 () tuple2!9462)

(declare-fun lt!175783 () tuple2!9464)

(assert (=> b!115206 (= lt!175792 (readBitPure!0 (readerFrom!0 (_2!4997 lt!175783) (currentBit!5380 (_2!4997 lt!175133)) (currentByte!5385 (_2!4997 lt!175133)))))))

(declare-fun res!95195 () Bool)

(declare-fun lt!175769 () Bool)

(assert (=> b!115206 (= res!95195 (and (= (_2!4996 lt!175792) lt!175769) (= (_1!4996 lt!175792) (_2!4997 lt!175783))))))

(declare-fun e!75526 () Bool)

(assert (=> b!115206 (=> (not res!95195) (not e!75526))))

(declare-fun e!75525 () Bool)

(assert (=> b!115206 (= e!75525 e!75526)))

(declare-fun lt!175754 () tuple2!9460)

(declare-fun e!75524 () Bool)

(declare-datatypes ((tuple2!9484 0))(
  ( (tuple2!9485 (_1!5007 BitStream!4186) (_2!5007 (_ BitVec 64))) )
))
(declare-fun lt!175759 () tuple2!9484)

(declare-fun b!115207 () Bool)

(assert (=> b!115207 (= e!75524 (and (= (_2!5007 lt!175759) v!199) (= (_1!5007 lt!175759) (_2!4995 lt!175754))))))

(declare-fun lt!175766 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4186 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9484)

(assert (=> b!115207 (= lt!175759 (readNLeastSignificantBitsLoopPure!0 (_1!4995 lt!175754) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!175766))))

(declare-fun lt!175790 () Unit!7069)

(declare-fun lt!175787 () Unit!7069)

(assert (=> b!115207 (= lt!175790 lt!175787)))

(declare-fun lt!175760 () tuple2!9464)

(assert (=> b!115207 (validate_offset_bits!1 ((_ sign_extend 32) (size!2356 (buf!2766 (_2!4997 lt!175760)))) ((_ sign_extend 32) (currentByte!5385 (_2!4997 lt!175133))) ((_ sign_extend 32) (currentBit!5380 (_2!4997 lt!175133))) lt!175762)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4186 array!5192 (_ BitVec 64)) Unit!7069)

(assert (=> b!115207 (= lt!175787 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4997 lt!175133) (buf!2766 (_2!4997 lt!175760)) lt!175762))))

(assert (=> b!115207 e!75521))

(declare-fun res!95192 () Bool)

(assert (=> b!115207 (=> (not res!95192) (not e!75521))))

(assert (=> b!115207 (= res!95192 (and (= (size!2356 (buf!2766 (_2!4997 lt!175133))) (size!2356 (buf!2766 (_2!4997 lt!175760)))) (bvsge lt!175762 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!115207 (= lt!175762 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!115207 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!115207 (= lt!175766 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!115207 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!115207 (= lt!175754 (reader!0 (_2!4997 lt!175133) (_2!4997 lt!175760)))))

(declare-fun d!37104 () Bool)

(assert (=> d!37104 e!75524))

(declare-fun res!95197 () Bool)

(assert (=> d!37104 (=> (not res!95197) (not e!75524))))

(assert (=> d!37104 (= res!95197 (= (size!2356 (buf!2766 (_2!4997 lt!175133))) (size!2356 (buf!2766 (_2!4997 lt!175760)))))))

(declare-fun e!75520 () tuple2!9464)

(assert (=> d!37104 (= lt!175760 e!75520)))

(assert (=> d!37104 (= c!6989 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!37104 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!37104 (= (appendNLeastSignificantBitsLoop!0 (_2!4997 lt!175133) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!175760)))

(declare-fun b!115208 () Bool)

(declare-fun Unit!7083 () Unit!7069)

(assert (=> b!115208 (= e!75520 (tuple2!9465 Unit!7083 (_2!4997 lt!175771)))))

(assert (=> b!115208 (= lt!175769 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!115208 (= lt!175783 (appendBit!0 (_2!4997 lt!175133) lt!175769))))

(declare-fun res!95196 () Bool)

(assert (=> b!115208 (= res!95196 (= (size!2356 (buf!2766 (_2!4997 lt!175133))) (size!2356 (buf!2766 (_2!4997 lt!175783)))))))

(assert (=> b!115208 (=> (not res!95196) (not e!75525))))

(assert (=> b!115208 e!75525))

(declare-fun lt!175767 () tuple2!9464)

(assert (=> b!115208 (= lt!175767 lt!175783)))

(assert (=> b!115208 (= lt!175771 (appendNLeastSignificantBitsLoop!0 (_2!4997 lt!175767) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!175750 () Unit!7069)

(assert (=> b!115208 (= lt!175750 (lemmaIsPrefixTransitive!0 (_2!4997 lt!175133) (_2!4997 lt!175767) (_2!4997 lt!175771)))))

(assert (=> b!115208 call!1496))

(declare-fun lt!175749 () Unit!7069)

(assert (=> b!115208 (= lt!175749 lt!175750)))

(assert (=> b!115208 (invariant!0 (currentBit!5380 (_2!4997 lt!175133)) (currentByte!5385 (_2!4997 lt!175133)) (size!2356 (buf!2766 (_2!4997 lt!175767))))))

(declare-fun lt!175791 () BitStream!4186)

(assert (=> b!115208 (= lt!175791 (BitStream!4187 (buf!2766 (_2!4997 lt!175767)) (currentByte!5385 (_2!4997 lt!175133)) (currentBit!5380 (_2!4997 lt!175133))))))

(assert (=> b!115208 (invariant!0 (currentBit!5380 lt!175791) (currentByte!5385 lt!175791) (size!2356 (buf!2766 (_2!4997 lt!175771))))))

(declare-fun lt!175751 () BitStream!4186)

(assert (=> b!115208 (= lt!175751 (BitStream!4187 (buf!2766 (_2!4997 lt!175771)) (currentByte!5385 lt!175791) (currentBit!5380 lt!175791)))))

(assert (=> b!115208 (= lt!175773 (readBitPure!0 lt!175791))))

(assert (=> b!115208 (= lt!175786 (readBitPure!0 lt!175751))))

(declare-fun lt!175752 () Unit!7069)

(assert (=> b!115208 (= lt!175752 (readBitPrefixLemma!0 lt!175791 (_2!4997 lt!175771)))))

(declare-fun res!95198 () Bool)

(assert (=> b!115208 (= res!95198 (= (bitIndex!0 (size!2356 (buf!2766 (_1!4996 lt!175773))) (currentByte!5385 (_1!4996 lt!175773)) (currentBit!5380 (_1!4996 lt!175773))) (bitIndex!0 (size!2356 (buf!2766 (_1!4996 lt!175786))) (currentByte!5385 (_1!4996 lt!175786)) (currentBit!5380 (_1!4996 lt!175786)))))))

(assert (=> b!115208 (=> (not res!95198) (not e!75522))))

(assert (=> b!115208 e!75522))

(declare-fun lt!175770 () Unit!7069)

(assert (=> b!115208 (= lt!175770 lt!175752)))

(declare-fun lt!175775 () tuple2!9460)

(assert (=> b!115208 (= lt!175775 (reader!0 (_2!4997 lt!175133) (_2!4997 lt!175771)))))

(declare-fun lt!175778 () tuple2!9460)

(assert (=> b!115208 (= lt!175778 (reader!0 (_2!4997 lt!175767) (_2!4997 lt!175771)))))

(declare-fun lt!175782 () tuple2!9462)

(assert (=> b!115208 (= lt!175782 (readBitPure!0 (_1!4995 lt!175775)))))

(assert (=> b!115208 (= (_2!4996 lt!175782) lt!175769)))

(declare-fun lt!175758 () Unit!7069)

(declare-fun Unit!7084 () Unit!7069)

(assert (=> b!115208 (= lt!175758 Unit!7084)))

(declare-fun lt!175776 () (_ BitVec 64))

(assert (=> b!115208 (= lt!175776 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!175768 () (_ BitVec 64))

(assert (=> b!115208 (= lt!175768 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!175772 () Unit!7069)

(assert (=> b!115208 (= lt!175772 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4997 lt!175133) (buf!2766 (_2!4997 lt!175771)) lt!175768))))

(assert (=> b!115208 (validate_offset_bits!1 ((_ sign_extend 32) (size!2356 (buf!2766 (_2!4997 lt!175771)))) ((_ sign_extend 32) (currentByte!5385 (_2!4997 lt!175133))) ((_ sign_extend 32) (currentBit!5380 (_2!4997 lt!175133))) lt!175768)))

(declare-fun lt!175764 () Unit!7069)

(assert (=> b!115208 (= lt!175764 lt!175772)))

(declare-fun lt!175765 () tuple2!9484)

(assert (=> b!115208 (= lt!175765 (readNLeastSignificantBitsLoopPure!0 (_1!4995 lt!175775) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!175776))))

(declare-fun lt!175780 () (_ BitVec 64))

(assert (=> b!115208 (= lt!175780 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!175793 () Unit!7069)

(assert (=> b!115208 (= lt!175793 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4997 lt!175767) (buf!2766 (_2!4997 lt!175771)) lt!175780))))

(assert (=> b!115208 (validate_offset_bits!1 ((_ sign_extend 32) (size!2356 (buf!2766 (_2!4997 lt!175771)))) ((_ sign_extend 32) (currentByte!5385 (_2!4997 lt!175767))) ((_ sign_extend 32) (currentBit!5380 (_2!4997 lt!175767))) lt!175780)))

(declare-fun lt!175781 () Unit!7069)

(assert (=> b!115208 (= lt!175781 lt!175793)))

(declare-fun lt!175756 () tuple2!9484)

(assert (=> b!115208 (= lt!175756 (readNLeastSignificantBitsLoopPure!0 (_1!4995 lt!175778) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!175776 (ite (_2!4996 lt!175782) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!175753 () tuple2!9484)

(assert (=> b!115208 (= lt!175753 (readNLeastSignificantBitsLoopPure!0 (_1!4995 lt!175775) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!175776))))

(declare-fun c!6988 () Bool)

(assert (=> b!115208 (= c!6988 (_2!4996 (readBitPure!0 (_1!4995 lt!175775))))))

(declare-fun lt!175774 () tuple2!9484)

(declare-fun e!75523 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4186 (_ BitVec 64)) BitStream!4186)

(assert (=> b!115208 (= lt!175774 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4995 lt!175775) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!175776 e!75523)))))

(declare-fun lt!175757 () Unit!7069)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4186 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7069)

(assert (=> b!115208 (= lt!175757 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4995 lt!175775) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!175776))))

(assert (=> b!115208 (and (= (_2!5007 lt!175753) (_2!5007 lt!175774)) (= (_1!5007 lt!175753) (_1!5007 lt!175774)))))

(declare-fun lt!175788 () Unit!7069)

(assert (=> b!115208 (= lt!175788 lt!175757)))

(assert (=> b!115208 (= (_1!4995 lt!175775) (withMovedBitIndex!0 (_2!4995 lt!175775) (bvsub (bitIndex!0 (size!2356 (buf!2766 (_2!4997 lt!175133))) (currentByte!5385 (_2!4997 lt!175133)) (currentBit!5380 (_2!4997 lt!175133))) (bitIndex!0 (size!2356 (buf!2766 (_2!4997 lt!175771))) (currentByte!5385 (_2!4997 lt!175771)) (currentBit!5380 (_2!4997 lt!175771))))))))

(declare-fun lt!175777 () Unit!7069)

(declare-fun Unit!7085 () Unit!7069)

(assert (=> b!115208 (= lt!175777 Unit!7085)))

(assert (=> b!115208 (= (_1!4995 lt!175778) (withMovedBitIndex!0 (_2!4995 lt!175778) (bvsub (bitIndex!0 (size!2356 (buf!2766 (_2!4997 lt!175767))) (currentByte!5385 (_2!4997 lt!175767)) (currentBit!5380 (_2!4997 lt!175767))) (bitIndex!0 (size!2356 (buf!2766 (_2!4997 lt!175771))) (currentByte!5385 (_2!4997 lt!175771)) (currentBit!5380 (_2!4997 lt!175771))))))))

(declare-fun lt!175761 () Unit!7069)

(declare-fun Unit!7086 () Unit!7069)

(assert (=> b!115208 (= lt!175761 Unit!7086)))

(assert (=> b!115208 (= (bitIndex!0 (size!2356 (buf!2766 (_2!4997 lt!175133))) (currentByte!5385 (_2!4997 lt!175133)) (currentBit!5380 (_2!4997 lt!175133))) (bvsub (bitIndex!0 (size!2356 (buf!2766 (_2!4997 lt!175767))) (currentByte!5385 (_2!4997 lt!175767)) (currentBit!5380 (_2!4997 lt!175767))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!175779 () Unit!7069)

(declare-fun Unit!7087 () Unit!7069)

(assert (=> b!115208 (= lt!175779 Unit!7087)))

(assert (=> b!115208 (= (_2!5007 lt!175765) (_2!5007 lt!175756))))

(declare-fun lt!175785 () Unit!7069)

(declare-fun Unit!7088 () Unit!7069)

(assert (=> b!115208 (= lt!175785 Unit!7088)))

(assert (=> b!115208 (= (_1!5007 lt!175765) (_2!4995 lt!175775))))

(declare-fun b!115209 () Bool)

(declare-fun res!95194 () Bool)

(assert (=> b!115209 (=> (not res!95194) (not e!75524))))

(declare-fun lt!175789 () (_ BitVec 64))

(declare-fun lt!175755 () (_ BitVec 64))

(assert (=> b!115209 (= res!95194 (= (bitIndex!0 (size!2356 (buf!2766 (_2!4997 lt!175760))) (currentByte!5385 (_2!4997 lt!175760)) (currentBit!5380 (_2!4997 lt!175760))) (bvadd lt!175755 lt!175789)))))

(assert (=> b!115209 (or (not (= (bvand lt!175755 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!175789 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!175755 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!175755 lt!175789) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!115209 (= lt!175789 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!115209 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!115209 (= lt!175755 (bitIndex!0 (size!2356 (buf!2766 (_2!4997 lt!175133))) (currentByte!5385 (_2!4997 lt!175133)) (currentBit!5380 (_2!4997 lt!175133))))))

(declare-fun b!115210 () Bool)

(declare-fun res!95193 () Bool)

(assert (=> b!115210 (= res!95193 (isPrefixOf!0 (_2!4997 lt!175133) (_2!4997 lt!175783)))))

(assert (=> b!115210 (=> (not res!95193) (not e!75525))))

(declare-fun b!115211 () Bool)

(assert (=> b!115211 (= e!75523 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!115212 () Bool)

(assert (=> b!115212 (= e!75526 (= (bitIndex!0 (size!2356 (buf!2766 (_1!4996 lt!175792))) (currentByte!5385 (_1!4996 lt!175792)) (currentBit!5380 (_1!4996 lt!175792))) (bitIndex!0 (size!2356 (buf!2766 (_2!4997 lt!175783))) (currentByte!5385 (_2!4997 lt!175783)) (currentBit!5380 (_2!4997 lt!175783)))))))

(declare-fun b!115213 () Bool)

(declare-fun lt!175784 () Unit!7069)

(assert (=> b!115213 (= e!75520 (tuple2!9465 lt!175784 (_2!4997 lt!175133)))))

(assert (=> b!115213 (= lt!175763 (_2!4997 lt!175133))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4186) Unit!7069)

(assert (=> b!115213 (= lt!175784 (lemmaIsPrefixRefl!0 lt!175763))))

(assert (=> b!115213 call!1496))

(declare-fun b!115214 () Bool)

(declare-fun res!95191 () Bool)

(assert (=> b!115214 (= res!95191 (= (bitIndex!0 (size!2356 (buf!2766 (_2!4997 lt!175783))) (currentByte!5385 (_2!4997 lt!175783)) (currentBit!5380 (_2!4997 lt!175783))) (bvadd (bitIndex!0 (size!2356 (buf!2766 (_2!4997 lt!175133))) (currentByte!5385 (_2!4997 lt!175133)) (currentBit!5380 (_2!4997 lt!175133))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!115214 (=> (not res!95191) (not e!75525))))

(declare-fun b!115215 () Bool)

(assert (=> b!115215 (= e!75523 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!115216 () Bool)

(declare-fun res!95199 () Bool)

(assert (=> b!115216 (=> (not res!95199) (not e!75524))))

(assert (=> b!115216 (= res!95199 (isPrefixOf!0 (_2!4997 lt!175133) (_2!4997 lt!175760)))))

(assert (= (and d!37104 c!6989) b!115208))

(assert (= (and d!37104 (not c!6989)) b!115213))

(assert (= (and b!115208 res!95196) b!115214))

(assert (= (and b!115214 res!95191) b!115210))

(assert (= (and b!115210 res!95193) b!115206))

(assert (= (and b!115206 res!95195) b!115212))

(assert (= (and b!115208 res!95198) b!115204))

(assert (= (and b!115208 c!6988) b!115215))

(assert (= (and b!115208 (not c!6988)) b!115211))

(assert (= (or b!115208 b!115213) bm!1493))

(assert (= (and d!37104 res!95197) b!115209))

(assert (= (and b!115209 res!95194) b!115216))

(assert (= (and b!115216 res!95199) b!115207))

(assert (= (and b!115207 res!95192) b!115205))

(declare-fun m!172359 () Bool)

(assert (=> b!115214 m!172359))

(assert (=> b!115214 m!171929))

(declare-fun m!172361 () Bool)

(assert (=> b!115209 m!172361))

(assert (=> b!115209 m!171929))

(declare-fun m!172363 () Bool)

(assert (=> b!115213 m!172363))

(declare-fun m!172365 () Bool)

(assert (=> b!115206 m!172365))

(assert (=> b!115206 m!172365))

(declare-fun m!172367 () Bool)

(assert (=> b!115206 m!172367))

(declare-fun m!172369 () Bool)

(assert (=> b!115212 m!172369))

(assert (=> b!115212 m!172359))

(declare-fun m!172371 () Bool)

(assert (=> b!115208 m!172371))

(declare-fun m!172373 () Bool)

(assert (=> b!115208 m!172373))

(declare-fun m!172375 () Bool)

(assert (=> b!115208 m!172375))

(declare-fun m!172377 () Bool)

(assert (=> b!115208 m!172377))

(declare-fun m!172379 () Bool)

(assert (=> b!115208 m!172379))

(declare-fun m!172381 () Bool)

(assert (=> b!115208 m!172381))

(declare-fun m!172383 () Bool)

(assert (=> b!115208 m!172383))

(declare-fun m!172385 () Bool)

(assert (=> b!115208 m!172385))

(declare-fun m!172387 () Bool)

(assert (=> b!115208 m!172387))

(declare-fun m!172389 () Bool)

(assert (=> b!115208 m!172389))

(declare-fun m!172391 () Bool)

(assert (=> b!115208 m!172391))

(declare-fun m!172393 () Bool)

(assert (=> b!115208 m!172393))

(assert (=> b!115208 m!172389))

(declare-fun m!172395 () Bool)

(assert (=> b!115208 m!172395))

(declare-fun m!172397 () Bool)

(assert (=> b!115208 m!172397))

(declare-fun m!172399 () Bool)

(assert (=> b!115208 m!172399))

(declare-fun m!172401 () Bool)

(assert (=> b!115208 m!172401))

(declare-fun m!172403 () Bool)

(assert (=> b!115208 m!172403))

(declare-fun m!172405 () Bool)

(assert (=> b!115208 m!172405))

(declare-fun m!172407 () Bool)

(assert (=> b!115208 m!172407))

(declare-fun m!172409 () Bool)

(assert (=> b!115208 m!172409))

(declare-fun m!172411 () Bool)

(assert (=> b!115208 m!172411))

(declare-fun m!172413 () Bool)

(assert (=> b!115208 m!172413))

(declare-fun m!172415 () Bool)

(assert (=> b!115208 m!172415))

(assert (=> b!115208 m!171929))

(declare-fun m!172417 () Bool)

(assert (=> b!115208 m!172417))

(declare-fun m!172419 () Bool)

(assert (=> b!115208 m!172419))

(declare-fun m!172421 () Bool)

(assert (=> b!115208 m!172421))

(declare-fun m!172423 () Bool)

(assert (=> b!115208 m!172423))

(declare-fun m!172425 () Bool)

(assert (=> b!115210 m!172425))

(declare-fun m!172427 () Bool)

(assert (=> bm!1493 m!172427))

(assert (=> b!115207 m!172371))

(declare-fun m!172429 () Bool)

(assert (=> b!115207 m!172429))

(declare-fun m!172431 () Bool)

(assert (=> b!115207 m!172431))

(declare-fun m!172433 () Bool)

(assert (=> b!115207 m!172433))

(declare-fun m!172435 () Bool)

(assert (=> b!115207 m!172435))

(declare-fun m!172437 () Bool)

(assert (=> b!115216 m!172437))

(declare-fun m!172439 () Bool)

(assert (=> b!115205 m!172439))

(assert (=> b!114926 d!37104))

(declare-fun d!37148 () Bool)

(declare-fun e!75529 () Bool)

(assert (=> d!37148 e!75529))

(declare-fun res!95202 () Bool)

(assert (=> d!37148 (=> (not res!95202) (not e!75529))))

(declare-fun lt!175805 () tuple2!9462)

(declare-fun lt!175802 () tuple2!9462)

(assert (=> d!37148 (= res!95202 (= (bitIndex!0 (size!2356 (buf!2766 (_1!4996 lt!175805))) (currentByte!5385 (_1!4996 lt!175805)) (currentBit!5380 (_1!4996 lt!175805))) (bitIndex!0 (size!2356 (buf!2766 (_1!4996 lt!175802))) (currentByte!5385 (_1!4996 lt!175802)) (currentBit!5380 (_1!4996 lt!175802)))))))

(declare-fun lt!175804 () BitStream!4186)

(declare-fun lt!175803 () Unit!7069)

(declare-fun choose!50 (BitStream!4186 BitStream!4186 BitStream!4186 tuple2!9462 tuple2!9462 BitStream!4186 Bool tuple2!9462 tuple2!9462 BitStream!4186 Bool) Unit!7069)

(assert (=> d!37148 (= lt!175803 (choose!50 lt!175129 (_2!4997 lt!175132) lt!175804 lt!175805 (tuple2!9463 (_1!4996 lt!175805) (_2!4996 lt!175805)) (_1!4996 lt!175805) (_2!4996 lt!175805) lt!175802 (tuple2!9463 (_1!4996 lt!175802) (_2!4996 lt!175802)) (_1!4996 lt!175802) (_2!4996 lt!175802)))))

(assert (=> d!37148 (= lt!175802 (readBitPure!0 lt!175804))))

(assert (=> d!37148 (= lt!175805 (readBitPure!0 lt!175129))))

(assert (=> d!37148 (= lt!175804 (BitStream!4187 (buf!2766 (_2!4997 lt!175132)) (currentByte!5385 lt!175129) (currentBit!5380 lt!175129)))))

(assert (=> d!37148 (invariant!0 (currentBit!5380 lt!175129) (currentByte!5385 lt!175129) (size!2356 (buf!2766 (_2!4997 lt!175132))))))

(assert (=> d!37148 (= (readBitPrefixLemma!0 lt!175129 (_2!4997 lt!175132)) lt!175803)))

(declare-fun b!115219 () Bool)

(assert (=> b!115219 (= e!75529 (= (_2!4996 lt!175805) (_2!4996 lt!175802)))))

(assert (= (and d!37148 res!95202) b!115219))

(assert (=> d!37148 m!171943))

(declare-fun m!172441 () Bool)

(assert (=> d!37148 m!172441))

(declare-fun m!172443 () Bool)

(assert (=> d!37148 m!172443))

(declare-fun m!172445 () Bool)

(assert (=> d!37148 m!172445))

(declare-fun m!172447 () Bool)

(assert (=> d!37148 m!172447))

(declare-fun m!172449 () Bool)

(assert (=> d!37148 m!172449))

(assert (=> b!114926 d!37148))

(declare-fun b!115230 () Bool)

(declare-fun e!75534 () Unit!7069)

(declare-fun lt!175865 () Unit!7069)

(assert (=> b!115230 (= e!75534 lt!175865)))

(declare-fun lt!175852 () (_ BitVec 64))

(assert (=> b!115230 (= lt!175852 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!175846 () (_ BitVec 64))

(assert (=> b!115230 (= lt!175846 (bitIndex!0 (size!2356 (buf!2766 (_2!4997 lt!175133))) (currentByte!5385 (_2!4997 lt!175133)) (currentBit!5380 (_2!4997 lt!175133))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5192 array!5192 (_ BitVec 64) (_ BitVec 64)) Unit!7069)

(assert (=> b!115230 (= lt!175865 (arrayBitRangesEqSymmetric!0 (buf!2766 (_2!4997 lt!175133)) (buf!2766 (_2!4997 lt!175132)) lt!175852 lt!175846))))

(assert (=> b!115230 (arrayBitRangesEq!0 (buf!2766 (_2!4997 lt!175132)) (buf!2766 (_2!4997 lt!175133)) lt!175852 lt!175846)))

(declare-fun b!115231 () Bool)

(declare-fun Unit!7089 () Unit!7069)

(assert (=> b!115231 (= e!75534 Unit!7089)))

(declare-fun b!115232 () Bool)

(declare-fun res!95211 () Bool)

(declare-fun e!75535 () Bool)

(assert (=> b!115232 (=> (not res!95211) (not e!75535))))

(declare-fun lt!175863 () tuple2!9460)

(assert (=> b!115232 (= res!95211 (isPrefixOf!0 (_1!4995 lt!175863) (_2!4997 lt!175133)))))

(declare-fun b!115233 () Bool)

(declare-fun res!95210 () Bool)

(assert (=> b!115233 (=> (not res!95210) (not e!75535))))

(assert (=> b!115233 (= res!95210 (isPrefixOf!0 (_2!4995 lt!175863) (_2!4997 lt!175132)))))

(declare-fun lt!175859 () (_ BitVec 64))

(declare-fun lt!175858 () (_ BitVec 64))

(declare-fun b!115234 () Bool)

(assert (=> b!115234 (= e!75535 (= (_1!4995 lt!175863) (withMovedBitIndex!0 (_2!4995 lt!175863) (bvsub lt!175859 lt!175858))))))

(assert (=> b!115234 (or (= (bvand lt!175859 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!175858 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!175859 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!175859 lt!175858) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!115234 (= lt!175858 (bitIndex!0 (size!2356 (buf!2766 (_2!4997 lt!175132))) (currentByte!5385 (_2!4997 lt!175132)) (currentBit!5380 (_2!4997 lt!175132))))))

(assert (=> b!115234 (= lt!175859 (bitIndex!0 (size!2356 (buf!2766 (_2!4997 lt!175133))) (currentByte!5385 (_2!4997 lt!175133)) (currentBit!5380 (_2!4997 lt!175133))))))

(declare-fun d!37150 () Bool)

(assert (=> d!37150 e!75535))

(declare-fun res!95209 () Bool)

(assert (=> d!37150 (=> (not res!95209) (not e!75535))))

(assert (=> d!37150 (= res!95209 (isPrefixOf!0 (_1!4995 lt!175863) (_2!4995 lt!175863)))))

(declare-fun lt!175857 () BitStream!4186)

(assert (=> d!37150 (= lt!175863 (tuple2!9461 lt!175857 (_2!4997 lt!175132)))))

(declare-fun lt!175856 () Unit!7069)

(declare-fun lt!175860 () Unit!7069)

(assert (=> d!37150 (= lt!175856 lt!175860)))

(assert (=> d!37150 (isPrefixOf!0 lt!175857 (_2!4997 lt!175132))))

(assert (=> d!37150 (= lt!175860 (lemmaIsPrefixTransitive!0 lt!175857 (_2!4997 lt!175132) (_2!4997 lt!175132)))))

(declare-fun lt!175847 () Unit!7069)

(declare-fun lt!175861 () Unit!7069)

(assert (=> d!37150 (= lt!175847 lt!175861)))

(assert (=> d!37150 (isPrefixOf!0 lt!175857 (_2!4997 lt!175132))))

(assert (=> d!37150 (= lt!175861 (lemmaIsPrefixTransitive!0 lt!175857 (_2!4997 lt!175133) (_2!4997 lt!175132)))))

(declare-fun lt!175851 () Unit!7069)

(assert (=> d!37150 (= lt!175851 e!75534)))

(declare-fun c!6992 () Bool)

(assert (=> d!37150 (= c!6992 (not (= (size!2356 (buf!2766 (_2!4997 lt!175133))) #b00000000000000000000000000000000)))))

(declare-fun lt!175848 () Unit!7069)

(declare-fun lt!175862 () Unit!7069)

(assert (=> d!37150 (= lt!175848 lt!175862)))

(assert (=> d!37150 (isPrefixOf!0 (_2!4997 lt!175132) (_2!4997 lt!175132))))

(assert (=> d!37150 (= lt!175862 (lemmaIsPrefixRefl!0 (_2!4997 lt!175132)))))

(declare-fun lt!175864 () Unit!7069)

(declare-fun lt!175849 () Unit!7069)

(assert (=> d!37150 (= lt!175864 lt!175849)))

(assert (=> d!37150 (= lt!175849 (lemmaIsPrefixRefl!0 (_2!4997 lt!175132)))))

(declare-fun lt!175855 () Unit!7069)

(declare-fun lt!175853 () Unit!7069)

(assert (=> d!37150 (= lt!175855 lt!175853)))

(assert (=> d!37150 (isPrefixOf!0 lt!175857 lt!175857)))

(assert (=> d!37150 (= lt!175853 (lemmaIsPrefixRefl!0 lt!175857))))

(declare-fun lt!175854 () Unit!7069)

(declare-fun lt!175850 () Unit!7069)

(assert (=> d!37150 (= lt!175854 lt!175850)))

(assert (=> d!37150 (isPrefixOf!0 (_2!4997 lt!175133) (_2!4997 lt!175133))))

(assert (=> d!37150 (= lt!175850 (lemmaIsPrefixRefl!0 (_2!4997 lt!175133)))))

(assert (=> d!37150 (= lt!175857 (BitStream!4187 (buf!2766 (_2!4997 lt!175132)) (currentByte!5385 (_2!4997 lt!175133)) (currentBit!5380 (_2!4997 lt!175133))))))

(assert (=> d!37150 (isPrefixOf!0 (_2!4997 lt!175133) (_2!4997 lt!175132))))

(assert (=> d!37150 (= (reader!0 (_2!4997 lt!175133) (_2!4997 lt!175132)) lt!175863)))

(assert (= (and d!37150 c!6992) b!115230))

(assert (= (and d!37150 (not c!6992)) b!115231))

(assert (= (and d!37150 res!95209) b!115232))

(assert (= (and b!115232 res!95211) b!115233))

(assert (= (and b!115233 res!95210) b!115234))

(declare-fun m!172451 () Bool)

(assert (=> d!37150 m!172451))

(declare-fun m!172453 () Bool)

(assert (=> d!37150 m!172453))

(declare-fun m!172455 () Bool)

(assert (=> d!37150 m!172455))

(declare-fun m!172457 () Bool)

(assert (=> d!37150 m!172457))

(declare-fun m!172459 () Bool)

(assert (=> d!37150 m!172459))

(declare-fun m!172461 () Bool)

(assert (=> d!37150 m!172461))

(declare-fun m!172463 () Bool)

(assert (=> d!37150 m!172463))

(declare-fun m!172465 () Bool)

(assert (=> d!37150 m!172465))

(declare-fun m!172467 () Bool)

(assert (=> d!37150 m!172467))

(declare-fun m!172469 () Bool)

(assert (=> d!37150 m!172469))

(declare-fun m!172471 () Bool)

(assert (=> d!37150 m!172471))

(declare-fun m!172473 () Bool)

(assert (=> b!115233 m!172473))

(assert (=> b!115230 m!171929))

(declare-fun m!172475 () Bool)

(assert (=> b!115230 m!172475))

(declare-fun m!172477 () Bool)

(assert (=> b!115230 m!172477))

(declare-fun m!172479 () Bool)

(assert (=> b!115232 m!172479))

(declare-fun m!172481 () Bool)

(assert (=> b!115234 m!172481))

(declare-fun m!172483 () Bool)

(assert (=> b!115234 m!172483))

(assert (=> b!115234 m!171929))

(assert (=> b!114926 d!37150))

(declare-fun d!37152 () Bool)

(declare-fun e!75553 () Bool)

(assert (=> d!37152 e!75553))

(declare-fun res!95239 () Bool)

(assert (=> d!37152 (=> (not res!95239) (not e!75553))))

(declare-fun lt!175956 () tuple2!9464)

(assert (=> d!37152 (= res!95239 (= (size!2356 (buf!2766 thiss!1305)) (size!2356 (buf!2766 (_2!4997 lt!175956)))))))

(declare-fun choose!16 (BitStream!4186 Bool) tuple2!9464)

(assert (=> d!37152 (= lt!175956 (choose!16 thiss!1305 lt!175134))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!37152 (validate_offset_bit!0 ((_ sign_extend 32) (size!2356 (buf!2766 thiss!1305))) ((_ sign_extend 32) (currentByte!5385 thiss!1305)) ((_ sign_extend 32) (currentBit!5380 thiss!1305)))))

(assert (=> d!37152 (= (appendBit!0 thiss!1305 lt!175134) lt!175956)))

(declare-fun b!115271 () Bool)

(declare-fun e!75552 () Bool)

(declare-fun lt!175957 () tuple2!9462)

(assert (=> b!115271 (= e!75552 (= (bitIndex!0 (size!2356 (buf!2766 (_1!4996 lt!175957))) (currentByte!5385 (_1!4996 lt!175957)) (currentBit!5380 (_1!4996 lt!175957))) (bitIndex!0 (size!2356 (buf!2766 (_2!4997 lt!175956))) (currentByte!5385 (_2!4997 lt!175956)) (currentBit!5380 (_2!4997 lt!175956)))))))

(declare-fun b!115268 () Bool)

(declare-fun res!95237 () Bool)

(assert (=> b!115268 (=> (not res!95237) (not e!75553))))

(declare-fun lt!175954 () (_ BitVec 64))

(declare-fun lt!175955 () (_ BitVec 64))

(assert (=> b!115268 (= res!95237 (= (bitIndex!0 (size!2356 (buf!2766 (_2!4997 lt!175956))) (currentByte!5385 (_2!4997 lt!175956)) (currentBit!5380 (_2!4997 lt!175956))) (bvadd lt!175955 lt!175954)))))

(assert (=> b!115268 (or (not (= (bvand lt!175955 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!175954 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!175955 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!175955 lt!175954) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!115268 (= lt!175954 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!115268 (= lt!175955 (bitIndex!0 (size!2356 (buf!2766 thiss!1305)) (currentByte!5385 thiss!1305) (currentBit!5380 thiss!1305)))))

(declare-fun b!115270 () Bool)

(assert (=> b!115270 (= e!75553 e!75552)))

(declare-fun res!95238 () Bool)

(assert (=> b!115270 (=> (not res!95238) (not e!75552))))

(assert (=> b!115270 (= res!95238 (and (= (_2!4996 lt!175957) lt!175134) (= (_1!4996 lt!175957) (_2!4997 lt!175956))))))

(assert (=> b!115270 (= lt!175957 (readBitPure!0 (readerFrom!0 (_2!4997 lt!175956) (currentBit!5380 thiss!1305) (currentByte!5385 thiss!1305))))))

(declare-fun b!115269 () Bool)

(declare-fun res!95236 () Bool)

(assert (=> b!115269 (=> (not res!95236) (not e!75553))))

(assert (=> b!115269 (= res!95236 (isPrefixOf!0 thiss!1305 (_2!4997 lt!175956)))))

(assert (= (and d!37152 res!95239) b!115268))

(assert (= (and b!115268 res!95237) b!115269))

(assert (= (and b!115269 res!95236) b!115270))

(assert (= (and b!115270 res!95238) b!115271))

(declare-fun m!172485 () Bool)

(assert (=> d!37152 m!172485))

(declare-fun m!172487 () Bool)

(assert (=> d!37152 m!172487))

(declare-fun m!172489 () Bool)

(assert (=> b!115271 m!172489))

(declare-fun m!172491 () Bool)

(assert (=> b!115271 m!172491))

(declare-fun m!172493 () Bool)

(assert (=> b!115270 m!172493))

(assert (=> b!115270 m!172493))

(declare-fun m!172495 () Bool)

(assert (=> b!115270 m!172495))

(assert (=> b!115268 m!172491))

(assert (=> b!115268 m!171931))

(declare-fun m!172497 () Bool)

(assert (=> b!115269 m!172497))

(assert (=> b!114926 d!37152))

(declare-fun d!37154 () Bool)

(declare-fun lt!175968 () tuple2!9482)

(assert (=> d!37154 (= lt!175968 (readBit!0 lt!175129))))

(assert (=> d!37154 (= (readBitPure!0 lt!175129) (tuple2!9463 (_2!5006 lt!175968) (_1!5006 lt!175968)))))

(declare-fun bs!8988 () Bool)

(assert (= bs!8988 d!37154))

(declare-fun m!172499 () Bool)

(assert (=> bs!8988 m!172499))

(assert (=> b!114926 d!37154))

(declare-fun b!115274 () Bool)

(declare-fun e!75556 () Unit!7069)

(declare-fun lt!175988 () Unit!7069)

(assert (=> b!115274 (= e!75556 lt!175988)))

(declare-fun lt!175975 () (_ BitVec 64))

(assert (=> b!115274 (= lt!175975 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!175969 () (_ BitVec 64))

(assert (=> b!115274 (= lt!175969 (bitIndex!0 (size!2356 (buf!2766 thiss!1305)) (currentByte!5385 thiss!1305) (currentBit!5380 thiss!1305)))))

(assert (=> b!115274 (= lt!175988 (arrayBitRangesEqSymmetric!0 (buf!2766 thiss!1305) (buf!2766 (_2!4997 lt!175132)) lt!175975 lt!175969))))

(assert (=> b!115274 (arrayBitRangesEq!0 (buf!2766 (_2!4997 lt!175132)) (buf!2766 thiss!1305) lt!175975 lt!175969)))

(declare-fun b!115275 () Bool)

(declare-fun Unit!7091 () Unit!7069)

(assert (=> b!115275 (= e!75556 Unit!7091)))

(declare-fun b!115276 () Bool)

(declare-fun res!95244 () Bool)

(declare-fun e!75557 () Bool)

(assert (=> b!115276 (=> (not res!95244) (not e!75557))))

(declare-fun lt!175986 () tuple2!9460)

(assert (=> b!115276 (= res!95244 (isPrefixOf!0 (_1!4995 lt!175986) thiss!1305))))

(declare-fun b!115277 () Bool)

(declare-fun res!95243 () Bool)

(assert (=> b!115277 (=> (not res!95243) (not e!75557))))

(assert (=> b!115277 (= res!95243 (isPrefixOf!0 (_2!4995 lt!175986) (_2!4997 lt!175132)))))

(declare-fun b!115278 () Bool)

(declare-fun lt!175981 () (_ BitVec 64))

(declare-fun lt!175982 () (_ BitVec 64))

(assert (=> b!115278 (= e!75557 (= (_1!4995 lt!175986) (withMovedBitIndex!0 (_2!4995 lt!175986) (bvsub lt!175982 lt!175981))))))

(assert (=> b!115278 (or (= (bvand lt!175982 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!175981 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!175982 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!175982 lt!175981) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!115278 (= lt!175981 (bitIndex!0 (size!2356 (buf!2766 (_2!4997 lt!175132))) (currentByte!5385 (_2!4997 lt!175132)) (currentBit!5380 (_2!4997 lt!175132))))))

(assert (=> b!115278 (= lt!175982 (bitIndex!0 (size!2356 (buf!2766 thiss!1305)) (currentByte!5385 thiss!1305) (currentBit!5380 thiss!1305)))))

(declare-fun d!37156 () Bool)

(assert (=> d!37156 e!75557))

(declare-fun res!95242 () Bool)

(assert (=> d!37156 (=> (not res!95242) (not e!75557))))

(assert (=> d!37156 (= res!95242 (isPrefixOf!0 (_1!4995 lt!175986) (_2!4995 lt!175986)))))

(declare-fun lt!175980 () BitStream!4186)

(assert (=> d!37156 (= lt!175986 (tuple2!9461 lt!175980 (_2!4997 lt!175132)))))

(declare-fun lt!175979 () Unit!7069)

(declare-fun lt!175983 () Unit!7069)

(assert (=> d!37156 (= lt!175979 lt!175983)))

(assert (=> d!37156 (isPrefixOf!0 lt!175980 (_2!4997 lt!175132))))

(assert (=> d!37156 (= lt!175983 (lemmaIsPrefixTransitive!0 lt!175980 (_2!4997 lt!175132) (_2!4997 lt!175132)))))

(declare-fun lt!175970 () Unit!7069)

(declare-fun lt!175984 () Unit!7069)

(assert (=> d!37156 (= lt!175970 lt!175984)))

(assert (=> d!37156 (isPrefixOf!0 lt!175980 (_2!4997 lt!175132))))

(assert (=> d!37156 (= lt!175984 (lemmaIsPrefixTransitive!0 lt!175980 thiss!1305 (_2!4997 lt!175132)))))

(declare-fun lt!175974 () Unit!7069)

(assert (=> d!37156 (= lt!175974 e!75556)))

(declare-fun c!6997 () Bool)

(assert (=> d!37156 (= c!6997 (not (= (size!2356 (buf!2766 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!175971 () Unit!7069)

(declare-fun lt!175985 () Unit!7069)

(assert (=> d!37156 (= lt!175971 lt!175985)))

(assert (=> d!37156 (isPrefixOf!0 (_2!4997 lt!175132) (_2!4997 lt!175132))))

(assert (=> d!37156 (= lt!175985 (lemmaIsPrefixRefl!0 (_2!4997 lt!175132)))))

(declare-fun lt!175987 () Unit!7069)

(declare-fun lt!175972 () Unit!7069)

(assert (=> d!37156 (= lt!175987 lt!175972)))

(assert (=> d!37156 (= lt!175972 (lemmaIsPrefixRefl!0 (_2!4997 lt!175132)))))

(declare-fun lt!175978 () Unit!7069)

(declare-fun lt!175976 () Unit!7069)

(assert (=> d!37156 (= lt!175978 lt!175976)))

(assert (=> d!37156 (isPrefixOf!0 lt!175980 lt!175980)))

(assert (=> d!37156 (= lt!175976 (lemmaIsPrefixRefl!0 lt!175980))))

(declare-fun lt!175977 () Unit!7069)

(declare-fun lt!175973 () Unit!7069)

(assert (=> d!37156 (= lt!175977 lt!175973)))

(assert (=> d!37156 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!37156 (= lt!175973 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!37156 (= lt!175980 (BitStream!4187 (buf!2766 (_2!4997 lt!175132)) (currentByte!5385 thiss!1305) (currentBit!5380 thiss!1305)))))

(assert (=> d!37156 (isPrefixOf!0 thiss!1305 (_2!4997 lt!175132))))

(assert (=> d!37156 (= (reader!0 thiss!1305 (_2!4997 lt!175132)) lt!175986)))

(assert (= (and d!37156 c!6997) b!115274))

(assert (= (and d!37156 (not c!6997)) b!115275))

(assert (= (and d!37156 res!95242) b!115276))

(assert (= (and b!115276 res!95244) b!115277))

(assert (= (and b!115277 res!95243) b!115278))

(assert (=> d!37156 m!171951))

(declare-fun m!172501 () Bool)

(assert (=> d!37156 m!172501))

(declare-fun m!172503 () Bool)

(assert (=> d!37156 m!172503))

(declare-fun m!172505 () Bool)

(assert (=> d!37156 m!172505))

(declare-fun m!172507 () Bool)

(assert (=> d!37156 m!172507))

(declare-fun m!172509 () Bool)

(assert (=> d!37156 m!172509))

(assert (=> d!37156 m!172463))

(declare-fun m!172511 () Bool)

(assert (=> d!37156 m!172511))

(declare-fun m!172513 () Bool)

(assert (=> d!37156 m!172513))

(declare-fun m!172515 () Bool)

(assert (=> d!37156 m!172515))

(assert (=> d!37156 m!172471))

(declare-fun m!172517 () Bool)

(assert (=> b!115277 m!172517))

(assert (=> b!115274 m!171931))

(declare-fun m!172519 () Bool)

(assert (=> b!115274 m!172519))

(declare-fun m!172521 () Bool)

(assert (=> b!115274 m!172521))

(declare-fun m!172523 () Bool)

(assert (=> b!115276 m!172523))

(declare-fun m!172525 () Bool)

(assert (=> b!115278 m!172525))

(assert (=> b!115278 m!172483))

(assert (=> b!115278 m!171931))

(assert (=> b!114926 d!37156))

(declare-fun d!37158 () Bool)

(declare-fun lt!175989 () tuple2!9482)

(assert (=> d!37158 (= lt!175989 (readBit!0 (BitStream!4187 (buf!2766 (_2!4997 lt!175132)) (currentByte!5385 thiss!1305) (currentBit!5380 thiss!1305))))))

(assert (=> d!37158 (= (readBitPure!0 (BitStream!4187 (buf!2766 (_2!4997 lt!175132)) (currentByte!5385 thiss!1305) (currentBit!5380 thiss!1305))) (tuple2!9463 (_2!5006 lt!175989) (_1!5006 lt!175989)))))

(declare-fun bs!8989 () Bool)

(assert (= bs!8989 d!37158))

(declare-fun m!172527 () Bool)

(assert (=> bs!8989 m!172527))

(assert (=> b!114926 d!37158))

(declare-fun d!37160 () Bool)

(assert (=> d!37160 (isPrefixOf!0 thiss!1305 (_2!4997 lt!175132))))

(declare-fun lt!175992 () Unit!7069)

(declare-fun choose!30 (BitStream!4186 BitStream!4186 BitStream!4186) Unit!7069)

(assert (=> d!37160 (= lt!175992 (choose!30 thiss!1305 (_2!4997 lt!175133) (_2!4997 lt!175132)))))

(assert (=> d!37160 (isPrefixOf!0 thiss!1305 (_2!4997 lt!175133))))

(assert (=> d!37160 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4997 lt!175133) (_2!4997 lt!175132)) lt!175992)))

(declare-fun bs!8990 () Bool)

(assert (= bs!8990 d!37160))

(assert (=> bs!8990 m!171951))

(declare-fun m!172529 () Bool)

(assert (=> bs!8990 m!172529))

(assert (=> bs!8990 m!171969))

(assert (=> b!114926 d!37160))

(declare-fun d!37162 () Bool)

(declare-fun e!75558 () Bool)

(assert (=> d!37162 e!75558))

(declare-fun res!95245 () Bool)

(assert (=> d!37162 (=> (not res!95245) (not e!75558))))

(declare-fun lt!175994 () (_ BitVec 64))

(declare-fun lt!175995 () (_ BitVec 64))

(declare-fun lt!175996 () (_ BitVec 64))

(assert (=> d!37162 (= res!95245 (= lt!175995 (bvsub lt!175996 lt!175994)))))

(assert (=> d!37162 (or (= (bvand lt!175996 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!175994 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!175996 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!175996 lt!175994) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37162 (= lt!175994 (remainingBits!0 ((_ sign_extend 32) (size!2356 (buf!2766 (_1!4996 lt!175131)))) ((_ sign_extend 32) (currentByte!5385 (_1!4996 lt!175131))) ((_ sign_extend 32) (currentBit!5380 (_1!4996 lt!175131)))))))

(declare-fun lt!175993 () (_ BitVec 64))

(declare-fun lt!175998 () (_ BitVec 64))

(assert (=> d!37162 (= lt!175996 (bvmul lt!175993 lt!175998))))

(assert (=> d!37162 (or (= lt!175993 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!175998 (bvsdiv (bvmul lt!175993 lt!175998) lt!175993)))))

(assert (=> d!37162 (= lt!175998 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37162 (= lt!175993 ((_ sign_extend 32) (size!2356 (buf!2766 (_1!4996 lt!175131)))))))

(assert (=> d!37162 (= lt!175995 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5385 (_1!4996 lt!175131))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5380 (_1!4996 lt!175131)))))))

(assert (=> d!37162 (invariant!0 (currentBit!5380 (_1!4996 lt!175131)) (currentByte!5385 (_1!4996 lt!175131)) (size!2356 (buf!2766 (_1!4996 lt!175131))))))

(assert (=> d!37162 (= (bitIndex!0 (size!2356 (buf!2766 (_1!4996 lt!175131))) (currentByte!5385 (_1!4996 lt!175131)) (currentBit!5380 (_1!4996 lt!175131))) lt!175995)))

(declare-fun b!115279 () Bool)

(declare-fun res!95246 () Bool)

(assert (=> b!115279 (=> (not res!95246) (not e!75558))))

(assert (=> b!115279 (= res!95246 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!175995))))

(declare-fun b!115280 () Bool)

(declare-fun lt!175997 () (_ BitVec 64))

(assert (=> b!115280 (= e!75558 (bvsle lt!175995 (bvmul lt!175997 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!115280 (or (= lt!175997 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!175997 #b0000000000000000000000000000000000000000000000000000000000001000) lt!175997)))))

(assert (=> b!115280 (= lt!175997 ((_ sign_extend 32) (size!2356 (buf!2766 (_1!4996 lt!175131)))))))

(assert (= (and d!37162 res!95245) b!115279))

(assert (= (and b!115279 res!95246) b!115280))

(declare-fun m!172531 () Bool)

(assert (=> d!37162 m!172531))

(declare-fun m!172533 () Bool)

(assert (=> d!37162 m!172533))

(assert (=> b!114926 d!37162))

(declare-fun d!37164 () Bool)

(declare-fun lt!175999 () tuple2!9482)

(assert (=> d!37164 (= lt!175999 (readBit!0 (_1!4995 lt!175138)))))

(assert (=> d!37164 (= (readBitPure!0 (_1!4995 lt!175138)) (tuple2!9463 (_2!5006 lt!175999) (_1!5006 lt!175999)))))

(declare-fun bs!8991 () Bool)

(assert (= bs!8991 d!37164))

(declare-fun m!172535 () Bool)

(assert (=> bs!8991 m!172535))

(assert (=> b!114926 d!37164))

(declare-fun d!37166 () Bool)

(declare-fun res!95249 () Bool)

(declare-fun e!75559 () Bool)

(assert (=> d!37166 (=> (not res!95249) (not e!75559))))

(assert (=> d!37166 (= res!95249 (= (size!2356 (buf!2766 thiss!1305)) (size!2356 (buf!2766 (_2!4997 lt!175132)))))))

(assert (=> d!37166 (= (isPrefixOf!0 thiss!1305 (_2!4997 lt!175132)) e!75559)))

(declare-fun b!115281 () Bool)

(declare-fun res!95248 () Bool)

(assert (=> b!115281 (=> (not res!95248) (not e!75559))))

(assert (=> b!115281 (= res!95248 (bvsle (bitIndex!0 (size!2356 (buf!2766 thiss!1305)) (currentByte!5385 thiss!1305) (currentBit!5380 thiss!1305)) (bitIndex!0 (size!2356 (buf!2766 (_2!4997 lt!175132))) (currentByte!5385 (_2!4997 lt!175132)) (currentBit!5380 (_2!4997 lt!175132)))))))

(declare-fun b!115282 () Bool)

(declare-fun e!75560 () Bool)

(assert (=> b!115282 (= e!75559 e!75560)))

(declare-fun res!95247 () Bool)

(assert (=> b!115282 (=> res!95247 e!75560)))

(assert (=> b!115282 (= res!95247 (= (size!2356 (buf!2766 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!115283 () Bool)

(assert (=> b!115283 (= e!75560 (arrayBitRangesEq!0 (buf!2766 thiss!1305) (buf!2766 (_2!4997 lt!175132)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2356 (buf!2766 thiss!1305)) (currentByte!5385 thiss!1305) (currentBit!5380 thiss!1305))))))

(assert (= (and d!37166 res!95249) b!115281))

(assert (= (and b!115281 res!95248) b!115282))

(assert (= (and b!115282 (not res!95247)) b!115283))

(assert (=> b!115281 m!171931))

(assert (=> b!115281 m!172483))

(assert (=> b!115283 m!171931))

(assert (=> b!115283 m!171931))

(declare-fun m!172537 () Bool)

(assert (=> b!115283 m!172537))

(assert (=> b!114926 d!37166))

(declare-fun d!37168 () Bool)

(assert (=> d!37168 (= (array_inv!2158 (buf!2766 thiss!1305)) (bvsge (size!2356 (buf!2766 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!114933 d!37168))

(push 1)

(assert (not b!115048))

(assert (not b!115209))

(assert (not d!37068))

(assert (not b!115274))

(assert (not d!37072))

(assert (not d!37148))

(assert (not b!115213))

(assert (not b!115232))

(assert (not d!37096))

(assert (not b!115268))

(assert (not b!115060))

(assert (not d!37150))

(assert (not b!115277))

(assert (not b!115212))

(assert (not d!37152))

(assert (not d!37162))

(assert (not d!37076))

(assert (not d!37160))

(assert (not d!37164))

(assert (not b!115234))

(assert (not b!115208))

(assert (not b!115206))

(assert (not b!115269))

(assert (not d!37156))

(assert (not bm!1493))

(assert (not b!115214))

(assert (not d!37102))

(assert (not b!115062))

(assert (not d!37158))

(assert (not b!115276))

(assert (not b!115230))

(assert (not b!115233))

(assert (not b!115216))

(assert (not b!115278))

(assert (not b!115270))

(assert (not d!37074))

(assert (not b!115207))

(assert (not b!115283))

(assert (not b!115205))

(assert (not d!37154))

(assert (not b!115210))

(assert (not b!115271))

(assert (not b!115281))

(assert (not d!37078))

(assert (not d!37098))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

