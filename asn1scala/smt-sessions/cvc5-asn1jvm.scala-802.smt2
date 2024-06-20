; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23222 () Bool)

(assert start!23222)

(declare-fun b!117913 () Bool)

(declare-fun e!77298 () Bool)

(declare-datatypes ((array!5300 0))(
  ( (array!5301 (arr!2997 (Array (_ BitVec 32) (_ BitVec 8))) (size!2404 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4282 0))(
  ( (BitStream!4283 (buf!2820 array!5300) (currentByte!5469 (_ BitVec 32)) (currentBit!5464 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!9856 0))(
  ( (tuple2!9857 (_1!5193 BitStream!4282) (_2!5193 BitStream!4282)) )
))
(declare-fun lt!180957 () tuple2!9856)

(declare-fun lt!180960 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!117913 (= e!77298 (validate_offset_bits!1 ((_ sign_extend 32) (size!2404 (buf!2820 (_1!5193 lt!180957)))) ((_ sign_extend 32) (currentByte!5469 (_1!5193 lt!180957))) ((_ sign_extend 32) (currentBit!5464 (_1!5193 lt!180957))) lt!180960))))

(declare-fun b!117914 () Bool)

(declare-fun res!97555 () Bool)

(declare-fun e!77301 () Bool)

(assert (=> b!117914 (=> (not res!97555) (not e!77301))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!117914 (= res!97555 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!117915 () Bool)

(declare-fun e!77293 () Bool)

(declare-fun thiss!1305 () BitStream!4282)

(declare-fun array_inv!2206 (array!5300) Bool)

(assert (=> b!117915 (= e!77293 (array_inv!2206 (buf!2820 thiss!1305)))))

(declare-fun b!117916 () Bool)

(declare-fun e!77299 () Bool)

(declare-fun e!77300 () Bool)

(assert (=> b!117916 (= e!77299 e!77300)))

(declare-fun res!97563 () Bool)

(assert (=> b!117916 (=> (not res!97563) (not e!77300))))

(declare-datatypes ((tuple2!9858 0))(
  ( (tuple2!9859 (_1!5194 BitStream!4282) (_2!5194 Bool)) )
))
(declare-fun lt!180953 () tuple2!9858)

(declare-fun lt!180949 () Bool)

(declare-datatypes ((Unit!7255 0))(
  ( (Unit!7256) )
))
(declare-datatypes ((tuple2!9860 0))(
  ( (tuple2!9861 (_1!5195 Unit!7255) (_2!5195 BitStream!4282)) )
))
(declare-fun lt!180963 () tuple2!9860)

(assert (=> b!117916 (= res!97563 (and (= (_2!5194 lt!180953) lt!180949) (= (_1!5194 lt!180953) (_2!5195 lt!180963))))))

(declare-fun readBitPure!0 (BitStream!4282) tuple2!9858)

(declare-fun readerFrom!0 (BitStream!4282 (_ BitVec 32) (_ BitVec 32)) BitStream!4282)

(assert (=> b!117916 (= lt!180953 (readBitPure!0 (readerFrom!0 (_2!5195 lt!180963) (currentBit!5464 thiss!1305) (currentByte!5469 thiss!1305))))))

(declare-fun b!117917 () Bool)

(declare-fun res!97560 () Bool)

(assert (=> b!117917 (=> (not res!97560) (not e!77299))))

(declare-fun isPrefixOf!0 (BitStream!4282 BitStream!4282) Bool)

(assert (=> b!117917 (= res!97560 (isPrefixOf!0 thiss!1305 (_2!5195 lt!180963)))))

(declare-fun b!117918 () Bool)

(declare-fun e!77297 () Bool)

(assert (=> b!117918 (= e!77297 e!77299)))

(declare-fun res!97566 () Bool)

(assert (=> b!117918 (=> (not res!97566) (not e!77299))))

(declare-fun lt!180951 () (_ BitVec 64))

(declare-fun lt!180952 () (_ BitVec 64))

(assert (=> b!117918 (= res!97566 (= lt!180951 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!180952)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!117918 (= lt!180951 (bitIndex!0 (size!2404 (buf!2820 (_2!5195 lt!180963))) (currentByte!5469 (_2!5195 lt!180963)) (currentBit!5464 (_2!5195 lt!180963))))))

(assert (=> b!117918 (= lt!180952 (bitIndex!0 (size!2404 (buf!2820 thiss!1305)) (currentByte!5469 thiss!1305) (currentBit!5464 thiss!1305)))))

(declare-fun res!97556 () Bool)

(declare-fun e!77295 () Bool)

(assert (=> start!23222 (=> (not res!97556) (not e!77295))))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> start!23222 (= res!97556 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!23222 e!77295))

(assert (=> start!23222 true))

(declare-fun inv!12 (BitStream!4282) Bool)

(assert (=> start!23222 (and (inv!12 thiss!1305) e!77293)))

(declare-fun b!117919 () Bool)

(assert (=> b!117919 (= e!77300 (= (bitIndex!0 (size!2404 (buf!2820 (_1!5194 lt!180953))) (currentByte!5469 (_1!5194 lt!180953)) (currentBit!5464 (_1!5194 lt!180953))) lt!180951))))

(declare-fun b!117920 () Bool)

(declare-fun res!97562 () Bool)

(declare-fun e!77294 () Bool)

(assert (=> b!117920 (=> (not res!97562) (not e!77294))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!117920 (= res!97562 (invariant!0 (currentBit!5464 thiss!1305) (currentByte!5469 thiss!1305) (size!2404 (buf!2820 (_2!5195 lt!180963)))))))

(declare-fun b!117921 () Bool)

(assert (=> b!117921 (= e!77301 (not e!77298))))

(declare-fun res!97558 () Bool)

(assert (=> b!117921 (=> res!97558 e!77298)))

(declare-fun lt!180962 () tuple2!9858)

(declare-fun lt!180959 () tuple2!9856)

(declare-fun lt!180956 () (_ BitVec 64))

(declare-fun lt!180965 () (_ BitVec 64))

(declare-datatypes ((tuple2!9862 0))(
  ( (tuple2!9863 (_1!5196 BitStream!4282) (_2!5196 (_ BitVec 64))) )
))
(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4282 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9862)

(assert (=> b!117921 (= res!97558 (not (= (_1!5196 (readNLeastSignificantBitsLoopPure!0 (_1!5193 lt!180959) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) (bvor lt!180956 (ite (_2!5194 lt!180962) lt!180965 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5193 lt!180959))))))

(declare-fun lt!180958 () tuple2!9860)

(declare-fun lt!180964 () (_ BitVec 64))

(assert (=> b!117921 (validate_offset_bits!1 ((_ sign_extend 32) (size!2404 (buf!2820 (_2!5195 lt!180958)))) ((_ sign_extend 32) (currentByte!5469 (_2!5195 lt!180963))) ((_ sign_extend 32) (currentBit!5464 (_2!5195 lt!180963))) lt!180964)))

(declare-fun lt!180950 () Unit!7255)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4282 array!5300 (_ BitVec 64)) Unit!7255)

(assert (=> b!117921 (= lt!180950 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5195 lt!180963) (buf!2820 (_2!5195 lt!180958)) lt!180964))))

(assert (=> b!117921 (= lt!180964 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!180955 () tuple2!9862)

(assert (=> b!117921 (= lt!180955 (readNLeastSignificantBitsLoopPure!0 (_1!5193 lt!180957) nBits!396 i!615 lt!180956))))

(assert (=> b!117921 (validate_offset_bits!1 ((_ sign_extend 32) (size!2404 (buf!2820 (_2!5195 lt!180958)))) ((_ sign_extend 32) (currentByte!5469 thiss!1305)) ((_ sign_extend 32) (currentBit!5464 thiss!1305)) lt!180960)))

(declare-fun lt!180961 () Unit!7255)

(assert (=> b!117921 (= lt!180961 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2820 (_2!5195 lt!180958)) lt!180960))))

(assert (=> b!117921 (= lt!180956 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!117921 (= (_2!5194 lt!180962) lt!180949)))

(assert (=> b!117921 (= lt!180962 (readBitPure!0 (_1!5193 lt!180957)))))

(declare-fun reader!0 (BitStream!4282 BitStream!4282) tuple2!9856)

(assert (=> b!117921 (= lt!180959 (reader!0 (_2!5195 lt!180963) (_2!5195 lt!180958)))))

(assert (=> b!117921 (= lt!180957 (reader!0 thiss!1305 (_2!5195 lt!180958)))))

(declare-fun e!77292 () Bool)

(assert (=> b!117921 e!77292))

(declare-fun res!97564 () Bool)

(assert (=> b!117921 (=> (not res!97564) (not e!77292))))

(declare-fun lt!180966 () tuple2!9858)

(declare-fun lt!180946 () tuple2!9858)

(assert (=> b!117921 (= res!97564 (= (bitIndex!0 (size!2404 (buf!2820 (_1!5194 lt!180966))) (currentByte!5469 (_1!5194 lt!180966)) (currentBit!5464 (_1!5194 lt!180966))) (bitIndex!0 (size!2404 (buf!2820 (_1!5194 lt!180946))) (currentByte!5469 (_1!5194 lt!180946)) (currentBit!5464 (_1!5194 lt!180946)))))))

(declare-fun lt!180948 () Unit!7255)

(declare-fun lt!180947 () BitStream!4282)

(declare-fun readBitPrefixLemma!0 (BitStream!4282 BitStream!4282) Unit!7255)

(assert (=> b!117921 (= lt!180948 (readBitPrefixLemma!0 lt!180947 (_2!5195 lt!180958)))))

(assert (=> b!117921 (= lt!180946 (readBitPure!0 (BitStream!4283 (buf!2820 (_2!5195 lt!180958)) (currentByte!5469 thiss!1305) (currentBit!5464 thiss!1305))))))

(assert (=> b!117921 (= lt!180966 (readBitPure!0 lt!180947))))

(assert (=> b!117921 (= lt!180947 (BitStream!4283 (buf!2820 (_2!5195 lt!180963)) (currentByte!5469 thiss!1305) (currentBit!5464 thiss!1305)))))

(assert (=> b!117921 e!77294))

(declare-fun res!97559 () Bool)

(assert (=> b!117921 (=> (not res!97559) (not e!77294))))

(assert (=> b!117921 (= res!97559 (isPrefixOf!0 thiss!1305 (_2!5195 lt!180958)))))

(declare-fun lt!180954 () Unit!7255)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4282 BitStream!4282 BitStream!4282) Unit!7255)

(assert (=> b!117921 (= lt!180954 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5195 lt!180963) (_2!5195 lt!180958)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4282 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9860)

(assert (=> b!117921 (= lt!180958 (appendNLeastSignificantBitsLoop!0 (_2!5195 lt!180963) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!117921 e!77297))

(declare-fun res!97561 () Bool)

(assert (=> b!117921 (=> (not res!97561) (not e!77297))))

(assert (=> b!117921 (= res!97561 (= (size!2404 (buf!2820 thiss!1305)) (size!2404 (buf!2820 (_2!5195 lt!180963)))))))

(declare-fun appendBit!0 (BitStream!4282 Bool) tuple2!9860)

(assert (=> b!117921 (= lt!180963 (appendBit!0 thiss!1305 lt!180949))))

(assert (=> b!117921 (= lt!180949 (not (= (bvand v!199 lt!180965) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!117921 (= lt!180965 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!117922 () Bool)

(declare-fun res!97565 () Bool)

(assert (=> b!117922 (=> (not res!97565) (not e!77301))))

(assert (=> b!117922 (= res!97565 (bvslt i!615 nBits!396))))

(declare-fun b!117923 () Bool)

(assert (=> b!117923 (= e!77294 (invariant!0 (currentBit!5464 thiss!1305) (currentByte!5469 thiss!1305) (size!2404 (buf!2820 (_2!5195 lt!180958)))))))

(declare-fun b!117924 () Bool)

(assert (=> b!117924 (= e!77292 (= (_2!5194 lt!180966) (_2!5194 lt!180946)))))

(declare-fun b!117925 () Bool)

(assert (=> b!117925 (= e!77295 e!77301)))

(declare-fun res!97557 () Bool)

(assert (=> b!117925 (=> (not res!97557) (not e!77301))))

(assert (=> b!117925 (= res!97557 (validate_offset_bits!1 ((_ sign_extend 32) (size!2404 (buf!2820 thiss!1305))) ((_ sign_extend 32) (currentByte!5469 thiss!1305)) ((_ sign_extend 32) (currentBit!5464 thiss!1305)) lt!180960))))

(assert (=> b!117925 (= lt!180960 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (= (and start!23222 res!97556) b!117925))

(assert (= (and b!117925 res!97557) b!117914))

(assert (= (and b!117914 res!97555) b!117922))

(assert (= (and b!117922 res!97565) b!117921))

(assert (= (and b!117921 res!97561) b!117918))

(assert (= (and b!117918 res!97566) b!117917))

(assert (= (and b!117917 res!97560) b!117916))

(assert (= (and b!117916 res!97563) b!117919))

(assert (= (and b!117921 res!97559) b!117920))

(assert (= (and b!117920 res!97562) b!117923))

(assert (= (and b!117921 res!97564) b!117924))

(assert (= (and b!117921 (not res!97558)) b!117913))

(assert (= start!23222 b!117915))

(declare-fun m!176939 () Bool)

(assert (=> b!117925 m!176939))

(declare-fun m!176941 () Bool)

(assert (=> b!117920 m!176941))

(declare-fun m!176943 () Bool)

(assert (=> b!117923 m!176943))

(declare-fun m!176945 () Bool)

(assert (=> start!23222 m!176945))

(declare-fun m!176947 () Bool)

(assert (=> b!117918 m!176947))

(declare-fun m!176949 () Bool)

(assert (=> b!117918 m!176949))

(declare-fun m!176951 () Bool)

(assert (=> b!117916 m!176951))

(assert (=> b!117916 m!176951))

(declare-fun m!176953 () Bool)

(assert (=> b!117916 m!176953))

(declare-fun m!176955 () Bool)

(assert (=> b!117919 m!176955))

(declare-fun m!176957 () Bool)

(assert (=> b!117914 m!176957))

(declare-fun m!176959 () Bool)

(assert (=> b!117915 m!176959))

(declare-fun m!176961 () Bool)

(assert (=> b!117913 m!176961))

(declare-fun m!176963 () Bool)

(assert (=> b!117917 m!176963))

(declare-fun m!176965 () Bool)

(assert (=> b!117921 m!176965))

(declare-fun m!176967 () Bool)

(assert (=> b!117921 m!176967))

(declare-fun m!176969 () Bool)

(assert (=> b!117921 m!176969))

(declare-fun m!176971 () Bool)

(assert (=> b!117921 m!176971))

(declare-fun m!176973 () Bool)

(assert (=> b!117921 m!176973))

(declare-fun m!176975 () Bool)

(assert (=> b!117921 m!176975))

(declare-fun m!176977 () Bool)

(assert (=> b!117921 m!176977))

(declare-fun m!176979 () Bool)

(assert (=> b!117921 m!176979))

(declare-fun m!176981 () Bool)

(assert (=> b!117921 m!176981))

(declare-fun m!176983 () Bool)

(assert (=> b!117921 m!176983))

(declare-fun m!176985 () Bool)

(assert (=> b!117921 m!176985))

(declare-fun m!176987 () Bool)

(assert (=> b!117921 m!176987))

(declare-fun m!176989 () Bool)

(assert (=> b!117921 m!176989))

(declare-fun m!176991 () Bool)

(assert (=> b!117921 m!176991))

(declare-fun m!176993 () Bool)

(assert (=> b!117921 m!176993))

(declare-fun m!176995 () Bool)

(assert (=> b!117921 m!176995))

(declare-fun m!176997 () Bool)

(assert (=> b!117921 m!176997))

(declare-fun m!176999 () Bool)

(assert (=> b!117921 m!176999))

(declare-fun m!177001 () Bool)

(assert (=> b!117921 m!177001))

(push 1)

(assert (not b!117923))

(assert (not b!117921))

(assert (not b!117915))

(assert (not b!117913))

(assert (not b!117920))

(assert (not start!23222))

(assert (not b!117916))

(assert (not b!117917))

(assert (not b!117925))

(assert (not b!117919))

(assert (not b!117914))

(assert (not b!117918))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!37748 () Bool)

(declare-datatypes ((tuple2!9884 0))(
  ( (tuple2!9885 (_1!5207 Bool) (_2!5207 BitStream!4282)) )
))
(declare-fun lt!181235 () tuple2!9884)

(declare-fun readBit!0 (BitStream!4282) tuple2!9884)

(assert (=> d!37748 (= lt!181235 (readBit!0 (readerFrom!0 (_2!5195 lt!180963) (currentBit!5464 thiss!1305) (currentByte!5469 thiss!1305))))))

(assert (=> d!37748 (= (readBitPure!0 (readerFrom!0 (_2!5195 lt!180963) (currentBit!5464 thiss!1305) (currentByte!5469 thiss!1305))) (tuple2!9859 (_2!5207 lt!181235) (_1!5207 lt!181235)))))

(declare-fun bs!9133 () Bool)

(assert (= bs!9133 d!37748))

(assert (=> bs!9133 m!176951))

(declare-fun m!177209 () Bool)

(assert (=> bs!9133 m!177209))

(assert (=> b!117916 d!37748))

(declare-fun d!37754 () Bool)

(declare-fun e!77391 () Bool)

(assert (=> d!37754 e!77391))

(declare-fun res!97685 () Bool)

(assert (=> d!37754 (=> (not res!97685) (not e!77391))))

(assert (=> d!37754 (= res!97685 (invariant!0 (currentBit!5464 (_2!5195 lt!180963)) (currentByte!5469 (_2!5195 lt!180963)) (size!2404 (buf!2820 (_2!5195 lt!180963)))))))

(assert (=> d!37754 (= (readerFrom!0 (_2!5195 lt!180963) (currentBit!5464 thiss!1305) (currentByte!5469 thiss!1305)) (BitStream!4283 (buf!2820 (_2!5195 lt!180963)) (currentByte!5469 thiss!1305) (currentBit!5464 thiss!1305)))))

(declare-fun b!118054 () Bool)

(assert (=> b!118054 (= e!77391 (invariant!0 (currentBit!5464 thiss!1305) (currentByte!5469 thiss!1305) (size!2404 (buf!2820 (_2!5195 lt!180963)))))))

(assert (= (and d!37754 res!97685) b!118054))

(declare-fun m!177213 () Bool)

(assert (=> d!37754 m!177213))

(assert (=> b!118054 m!176941))

(assert (=> b!117916 d!37754))

(declare-fun d!37758 () Bool)

(assert (=> d!37758 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5464 thiss!1305) (currentByte!5469 thiss!1305) (size!2404 (buf!2820 thiss!1305))))))

(declare-fun bs!9135 () Bool)

(assert (= bs!9135 d!37758))

(declare-fun m!177215 () Bool)

(assert (=> bs!9135 m!177215))

(assert (=> start!23222 d!37758))

(declare-fun d!37760 () Bool)

(declare-fun res!97698 () Bool)

(declare-fun e!77401 () Bool)

(assert (=> d!37760 (=> (not res!97698) (not e!77401))))

(assert (=> d!37760 (= res!97698 (= (size!2404 (buf!2820 thiss!1305)) (size!2404 (buf!2820 (_2!5195 lt!180963)))))))

(assert (=> d!37760 (= (isPrefixOf!0 thiss!1305 (_2!5195 lt!180963)) e!77401)))

(declare-fun b!118066 () Bool)

(declare-fun res!97699 () Bool)

(assert (=> b!118066 (=> (not res!97699) (not e!77401))))

(assert (=> b!118066 (= res!97699 (bvsle (bitIndex!0 (size!2404 (buf!2820 thiss!1305)) (currentByte!5469 thiss!1305) (currentBit!5464 thiss!1305)) (bitIndex!0 (size!2404 (buf!2820 (_2!5195 lt!180963))) (currentByte!5469 (_2!5195 lt!180963)) (currentBit!5464 (_2!5195 lt!180963)))))))

(declare-fun b!118067 () Bool)

(declare-fun e!77400 () Bool)

(assert (=> b!118067 (= e!77401 e!77400)))

(declare-fun res!97700 () Bool)

(assert (=> b!118067 (=> res!97700 e!77400)))

(assert (=> b!118067 (= res!97700 (= (size!2404 (buf!2820 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!118068 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5300 array!5300 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!118068 (= e!77400 (arrayBitRangesEq!0 (buf!2820 thiss!1305) (buf!2820 (_2!5195 lt!180963)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2404 (buf!2820 thiss!1305)) (currentByte!5469 thiss!1305) (currentBit!5464 thiss!1305))))))

(assert (= (and d!37760 res!97698) b!118066))

(assert (= (and b!118066 res!97699) b!118067))

(assert (= (and b!118067 (not res!97700)) b!118068))

(assert (=> b!118066 m!176949))

(assert (=> b!118066 m!176947))

(assert (=> b!118068 m!176949))

(assert (=> b!118068 m!176949))

(declare-fun m!177221 () Bool)

(assert (=> b!118068 m!177221))

(assert (=> b!117917 d!37760))

(declare-fun d!37774 () Bool)

(declare-fun e!77410 () Bool)

(assert (=> d!37774 e!77410))

(declare-fun res!97715 () Bool)

(assert (=> d!37774 (=> (not res!97715) (not e!77410))))

(declare-fun lt!181260 () (_ BitVec 64))

(declare-fun lt!181263 () (_ BitVec 64))

(declare-fun lt!181265 () (_ BitVec 64))

(assert (=> d!37774 (= res!97715 (= lt!181260 (bvsub lt!181263 lt!181265)))))

(assert (=> d!37774 (or (= (bvand lt!181263 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!181265 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!181263 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!181263 lt!181265) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!37774 (= lt!181265 (remainingBits!0 ((_ sign_extend 32) (size!2404 (buf!2820 (_1!5194 lt!180953)))) ((_ sign_extend 32) (currentByte!5469 (_1!5194 lt!180953))) ((_ sign_extend 32) (currentBit!5464 (_1!5194 lt!180953)))))))

(declare-fun lt!181264 () (_ BitVec 64))

(declare-fun lt!181262 () (_ BitVec 64))

(assert (=> d!37774 (= lt!181263 (bvmul lt!181264 lt!181262))))

(assert (=> d!37774 (or (= lt!181264 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!181262 (bvsdiv (bvmul lt!181264 lt!181262) lt!181264)))))

(assert (=> d!37774 (= lt!181262 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37774 (= lt!181264 ((_ sign_extend 32) (size!2404 (buf!2820 (_1!5194 lt!180953)))))))

(assert (=> d!37774 (= lt!181260 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5469 (_1!5194 lt!180953))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5464 (_1!5194 lt!180953)))))))

(assert (=> d!37774 (invariant!0 (currentBit!5464 (_1!5194 lt!180953)) (currentByte!5469 (_1!5194 lt!180953)) (size!2404 (buf!2820 (_1!5194 lt!180953))))))

(assert (=> d!37774 (= (bitIndex!0 (size!2404 (buf!2820 (_1!5194 lt!180953))) (currentByte!5469 (_1!5194 lt!180953)) (currentBit!5464 (_1!5194 lt!180953))) lt!181260)))

(declare-fun b!118082 () Bool)

(declare-fun res!97714 () Bool)

(assert (=> b!118082 (=> (not res!97714) (not e!77410))))

(assert (=> b!118082 (= res!97714 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!181260))))

(declare-fun b!118083 () Bool)

(declare-fun lt!181261 () (_ BitVec 64))

(assert (=> b!118083 (= e!77410 (bvsle lt!181260 (bvmul lt!181261 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!118083 (or (= lt!181261 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!181261 #b0000000000000000000000000000000000000000000000000000000000001000) lt!181261)))))

(assert (=> b!118083 (= lt!181261 ((_ sign_extend 32) (size!2404 (buf!2820 (_1!5194 lt!180953)))))))

(assert (= (and d!37774 res!97715) b!118082))

(assert (= (and b!118082 res!97714) b!118083))

(declare-fun m!177229 () Bool)

(assert (=> d!37774 m!177229))

(declare-fun m!177231 () Bool)

(assert (=> d!37774 m!177231))

(assert (=> b!117919 d!37774))

(declare-fun d!37780 () Bool)

(declare-fun e!77411 () Bool)

(assert (=> d!37780 e!77411))

(declare-fun res!97717 () Bool)

(assert (=> d!37780 (=> (not res!97717) (not e!77411))))

(declare-fun lt!181271 () (_ BitVec 64))

(declare-fun lt!181266 () (_ BitVec 64))

(declare-fun lt!181269 () (_ BitVec 64))

(assert (=> d!37780 (= res!97717 (= lt!181266 (bvsub lt!181269 lt!181271)))))

(assert (=> d!37780 (or (= (bvand lt!181269 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!181271 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!181269 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!181269 lt!181271) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37780 (= lt!181271 (remainingBits!0 ((_ sign_extend 32) (size!2404 (buf!2820 (_2!5195 lt!180963)))) ((_ sign_extend 32) (currentByte!5469 (_2!5195 lt!180963))) ((_ sign_extend 32) (currentBit!5464 (_2!5195 lt!180963)))))))

(declare-fun lt!181270 () (_ BitVec 64))

(declare-fun lt!181268 () (_ BitVec 64))

(assert (=> d!37780 (= lt!181269 (bvmul lt!181270 lt!181268))))

(assert (=> d!37780 (or (= lt!181270 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!181268 (bvsdiv (bvmul lt!181270 lt!181268) lt!181270)))))

(assert (=> d!37780 (= lt!181268 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37780 (= lt!181270 ((_ sign_extend 32) (size!2404 (buf!2820 (_2!5195 lt!180963)))))))

(assert (=> d!37780 (= lt!181266 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5469 (_2!5195 lt!180963))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5464 (_2!5195 lt!180963)))))))

(assert (=> d!37780 (invariant!0 (currentBit!5464 (_2!5195 lt!180963)) (currentByte!5469 (_2!5195 lt!180963)) (size!2404 (buf!2820 (_2!5195 lt!180963))))))

(assert (=> d!37780 (= (bitIndex!0 (size!2404 (buf!2820 (_2!5195 lt!180963))) (currentByte!5469 (_2!5195 lt!180963)) (currentBit!5464 (_2!5195 lt!180963))) lt!181266)))

(declare-fun b!118084 () Bool)

(declare-fun res!97716 () Bool)

(assert (=> b!118084 (=> (not res!97716) (not e!77411))))

(assert (=> b!118084 (= res!97716 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!181266))))

(declare-fun b!118085 () Bool)

(declare-fun lt!181267 () (_ BitVec 64))

(assert (=> b!118085 (= e!77411 (bvsle lt!181266 (bvmul lt!181267 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!118085 (or (= lt!181267 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!181267 #b0000000000000000000000000000000000000000000000000000000000001000) lt!181267)))))

(assert (=> b!118085 (= lt!181267 ((_ sign_extend 32) (size!2404 (buf!2820 (_2!5195 lt!180963)))))))

(assert (= (and d!37780 res!97717) b!118084))

(assert (= (and b!118084 res!97716) b!118085))

(declare-fun m!177233 () Bool)

(assert (=> d!37780 m!177233))

(assert (=> d!37780 m!177213))

(assert (=> b!117918 d!37780))

(declare-fun d!37782 () Bool)

(declare-fun e!77412 () Bool)

(assert (=> d!37782 e!77412))

(declare-fun res!97719 () Bool)

(assert (=> d!37782 (=> (not res!97719) (not e!77412))))

(declare-fun lt!181272 () (_ BitVec 64))

(declare-fun lt!181275 () (_ BitVec 64))

(declare-fun lt!181277 () (_ BitVec 64))

(assert (=> d!37782 (= res!97719 (= lt!181272 (bvsub lt!181275 lt!181277)))))

(assert (=> d!37782 (or (= (bvand lt!181275 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!181277 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!181275 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!181275 lt!181277) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37782 (= lt!181277 (remainingBits!0 ((_ sign_extend 32) (size!2404 (buf!2820 thiss!1305))) ((_ sign_extend 32) (currentByte!5469 thiss!1305)) ((_ sign_extend 32) (currentBit!5464 thiss!1305))))))

(declare-fun lt!181276 () (_ BitVec 64))

(declare-fun lt!181274 () (_ BitVec 64))

(assert (=> d!37782 (= lt!181275 (bvmul lt!181276 lt!181274))))

(assert (=> d!37782 (or (= lt!181276 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!181274 (bvsdiv (bvmul lt!181276 lt!181274) lt!181276)))))

(assert (=> d!37782 (= lt!181274 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37782 (= lt!181276 ((_ sign_extend 32) (size!2404 (buf!2820 thiss!1305))))))

(assert (=> d!37782 (= lt!181272 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5469 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5464 thiss!1305))))))

(assert (=> d!37782 (invariant!0 (currentBit!5464 thiss!1305) (currentByte!5469 thiss!1305) (size!2404 (buf!2820 thiss!1305)))))

(assert (=> d!37782 (= (bitIndex!0 (size!2404 (buf!2820 thiss!1305)) (currentByte!5469 thiss!1305) (currentBit!5464 thiss!1305)) lt!181272)))

(declare-fun b!118086 () Bool)

(declare-fun res!97718 () Bool)

(assert (=> b!118086 (=> (not res!97718) (not e!77412))))

(assert (=> b!118086 (= res!97718 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!181272))))

(declare-fun b!118087 () Bool)

(declare-fun lt!181273 () (_ BitVec 64))

(assert (=> b!118087 (= e!77412 (bvsle lt!181272 (bvmul lt!181273 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!118087 (or (= lt!181273 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!181273 #b0000000000000000000000000000000000000000000000000000000000001000) lt!181273)))))

(assert (=> b!118087 (= lt!181273 ((_ sign_extend 32) (size!2404 (buf!2820 thiss!1305))))))

(assert (= (and d!37782 res!97719) b!118086))

(assert (= (and b!118086 res!97718) b!118087))

(declare-fun m!177235 () Bool)

(assert (=> d!37782 m!177235))

(assert (=> d!37782 m!177215))

(assert (=> b!117918 d!37782))

(declare-fun d!37784 () Bool)

(assert (=> d!37784 (= (invariant!0 (currentBit!5464 thiss!1305) (currentByte!5469 thiss!1305) (size!2404 (buf!2820 (_2!5195 lt!180963)))) (and (bvsge (currentBit!5464 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5464 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5469 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5469 thiss!1305) (size!2404 (buf!2820 (_2!5195 lt!180963)))) (and (= (currentBit!5464 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5469 thiss!1305) (size!2404 (buf!2820 (_2!5195 lt!180963))))))))))

(assert (=> b!117920 d!37784))

(declare-fun d!37786 () Bool)

(assert (=> d!37786 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!117921 d!37786))

(declare-fun d!37788 () Bool)

(declare-fun lt!181278 () tuple2!9884)

(assert (=> d!37788 (= lt!181278 (readBit!0 lt!180947))))

(assert (=> d!37788 (= (readBitPure!0 lt!180947) (tuple2!9859 (_2!5207 lt!181278) (_1!5207 lt!181278)))))

(declare-fun bs!9139 () Bool)

(assert (= bs!9139 d!37788))

(declare-fun m!177237 () Bool)

(assert (=> bs!9139 m!177237))

(assert (=> b!117921 d!37788))

(declare-datatypes ((tuple2!9888 0))(
  ( (tuple2!9889 (_1!5209 (_ BitVec 64)) (_2!5209 BitStream!4282)) )
))
(declare-fun lt!181281 () tuple2!9888)

(declare-fun d!37790 () Bool)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!4282 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9888)

(assert (=> d!37790 (= lt!181281 (readNLeastSignificantBitsLoop!0 (_1!5193 lt!180959) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) (bvor lt!180956 (ite (_2!5194 lt!180962) lt!180965 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!37790 (= (readNLeastSignificantBitsLoopPure!0 (_1!5193 lt!180959) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) (bvor lt!180956 (ite (_2!5194 lt!180962) lt!180965 #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!9863 (_2!5209 lt!181281) (_1!5209 lt!181281)))))

(declare-fun bs!9140 () Bool)

(assert (= bs!9140 d!37790))

(declare-fun m!177239 () Bool)

(assert (=> bs!9140 m!177239))

(assert (=> b!117921 d!37790))

(declare-fun b!118113 () Bool)

(declare-fun e!77424 () Bool)

(declare-fun lt!181310 () tuple2!9858)

(declare-fun lt!181309 () tuple2!9860)

(assert (=> b!118113 (= e!77424 (= (bitIndex!0 (size!2404 (buf!2820 (_1!5194 lt!181310))) (currentByte!5469 (_1!5194 lt!181310)) (currentBit!5464 (_1!5194 lt!181310))) (bitIndex!0 (size!2404 (buf!2820 (_2!5195 lt!181309))) (currentByte!5469 (_2!5195 lt!181309)) (currentBit!5464 (_2!5195 lt!181309)))))))

(declare-fun b!118112 () Bool)

(declare-fun e!77423 () Bool)

(assert (=> b!118112 (= e!77423 e!77424)))

(declare-fun res!97741 () Bool)

(assert (=> b!118112 (=> (not res!97741) (not e!77424))))

(assert (=> b!118112 (= res!97741 (and (= (_2!5194 lt!181310) lt!180949) (= (_1!5194 lt!181310) (_2!5195 lt!181309))))))

(assert (=> b!118112 (= lt!181310 (readBitPure!0 (readerFrom!0 (_2!5195 lt!181309) (currentBit!5464 thiss!1305) (currentByte!5469 thiss!1305))))))

(declare-fun b!118111 () Bool)

(declare-fun res!97742 () Bool)

(assert (=> b!118111 (=> (not res!97742) (not e!77423))))

(assert (=> b!118111 (= res!97742 (isPrefixOf!0 thiss!1305 (_2!5195 lt!181309)))))

(declare-fun b!118110 () Bool)

(declare-fun res!97740 () Bool)

(assert (=> b!118110 (=> (not res!97740) (not e!77423))))

(declare-fun lt!181307 () (_ BitVec 64))

(declare-fun lt!181308 () (_ BitVec 64))

(assert (=> b!118110 (= res!97740 (= (bitIndex!0 (size!2404 (buf!2820 (_2!5195 lt!181309))) (currentByte!5469 (_2!5195 lt!181309)) (currentBit!5464 (_2!5195 lt!181309))) (bvadd lt!181307 lt!181308)))))

(assert (=> b!118110 (or (not (= (bvand lt!181307 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!181308 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!181307 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!181307 lt!181308) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!118110 (= lt!181308 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!118110 (= lt!181307 (bitIndex!0 (size!2404 (buf!2820 thiss!1305)) (currentByte!5469 thiss!1305) (currentBit!5464 thiss!1305)))))

(declare-fun d!37792 () Bool)

(assert (=> d!37792 e!77423))

(declare-fun res!97743 () Bool)

(assert (=> d!37792 (=> (not res!97743) (not e!77423))))

(assert (=> d!37792 (= res!97743 (= (size!2404 (buf!2820 thiss!1305)) (size!2404 (buf!2820 (_2!5195 lt!181309)))))))

(declare-fun choose!16 (BitStream!4282 Bool) tuple2!9860)

(assert (=> d!37792 (= lt!181309 (choose!16 thiss!1305 lt!180949))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!37792 (validate_offset_bit!0 ((_ sign_extend 32) (size!2404 (buf!2820 thiss!1305))) ((_ sign_extend 32) (currentByte!5469 thiss!1305)) ((_ sign_extend 32) (currentBit!5464 thiss!1305)))))

(assert (=> d!37792 (= (appendBit!0 thiss!1305 lt!180949) lt!181309)))

(assert (= (and d!37792 res!97743) b!118110))

(assert (= (and b!118110 res!97740) b!118111))

(assert (= (and b!118111 res!97742) b!118112))

(assert (= (and b!118112 res!97741) b!118113))

(declare-fun m!177261 () Bool)

(assert (=> b!118112 m!177261))

(assert (=> b!118112 m!177261))

(declare-fun m!177263 () Bool)

(assert (=> b!118112 m!177263))

(declare-fun m!177265 () Bool)

(assert (=> b!118110 m!177265))

(assert (=> b!118110 m!176949))

(declare-fun m!177267 () Bool)

(assert (=> b!118113 m!177267))

(assert (=> b!118113 m!177265))

(declare-fun m!177269 () Bool)

(assert (=> d!37792 m!177269))

(declare-fun m!177271 () Bool)

(assert (=> d!37792 m!177271))

(declare-fun m!177273 () Bool)

(assert (=> b!118111 m!177273))

(assert (=> b!117921 d!37792))

(declare-fun d!37802 () Bool)

(declare-fun e!77425 () Bool)

(assert (=> d!37802 e!77425))

(declare-fun res!97745 () Bool)

(assert (=> d!37802 (=> (not res!97745) (not e!77425))))

(declare-fun lt!181314 () (_ BitVec 64))

(declare-fun lt!181316 () (_ BitVec 64))

(declare-fun lt!181311 () (_ BitVec 64))

(assert (=> d!37802 (= res!97745 (= lt!181311 (bvsub lt!181314 lt!181316)))))

(assert (=> d!37802 (or (= (bvand lt!181314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!181316 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!181314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!181314 lt!181316) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37802 (= lt!181316 (remainingBits!0 ((_ sign_extend 32) (size!2404 (buf!2820 (_1!5194 lt!180966)))) ((_ sign_extend 32) (currentByte!5469 (_1!5194 lt!180966))) ((_ sign_extend 32) (currentBit!5464 (_1!5194 lt!180966)))))))

(declare-fun lt!181315 () (_ BitVec 64))

(declare-fun lt!181313 () (_ BitVec 64))

(assert (=> d!37802 (= lt!181314 (bvmul lt!181315 lt!181313))))

(assert (=> d!37802 (or (= lt!181315 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!181313 (bvsdiv (bvmul lt!181315 lt!181313) lt!181315)))))

(assert (=> d!37802 (= lt!181313 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37802 (= lt!181315 ((_ sign_extend 32) (size!2404 (buf!2820 (_1!5194 lt!180966)))))))

(assert (=> d!37802 (= lt!181311 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5469 (_1!5194 lt!180966))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5464 (_1!5194 lt!180966)))))))

(assert (=> d!37802 (invariant!0 (currentBit!5464 (_1!5194 lt!180966)) (currentByte!5469 (_1!5194 lt!180966)) (size!2404 (buf!2820 (_1!5194 lt!180966))))))

(assert (=> d!37802 (= (bitIndex!0 (size!2404 (buf!2820 (_1!5194 lt!180966))) (currentByte!5469 (_1!5194 lt!180966)) (currentBit!5464 (_1!5194 lt!180966))) lt!181311)))

(declare-fun b!118114 () Bool)

(declare-fun res!97744 () Bool)

(assert (=> b!118114 (=> (not res!97744) (not e!77425))))

(assert (=> b!118114 (= res!97744 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!181311))))

(declare-fun b!118115 () Bool)

(declare-fun lt!181312 () (_ BitVec 64))

(assert (=> b!118115 (= e!77425 (bvsle lt!181311 (bvmul lt!181312 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!118115 (or (= lt!181312 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!181312 #b0000000000000000000000000000000000000000000000000000000000001000) lt!181312)))))

(assert (=> b!118115 (= lt!181312 ((_ sign_extend 32) (size!2404 (buf!2820 (_1!5194 lt!180966)))))))

(assert (= (and d!37802 res!97745) b!118114))

(assert (= (and b!118114 res!97744) b!118115))

(declare-fun m!177275 () Bool)

(assert (=> d!37802 m!177275))

(declare-fun m!177277 () Bool)

(assert (=> d!37802 m!177277))

(assert (=> b!117921 d!37802))

(declare-fun d!37804 () Bool)

(declare-fun lt!181317 () tuple2!9884)

(assert (=> d!37804 (= lt!181317 (readBit!0 (_1!5193 lt!180957)))))

(assert (=> d!37804 (= (readBitPure!0 (_1!5193 lt!180957)) (tuple2!9859 (_2!5207 lt!181317) (_1!5207 lt!181317)))))

(declare-fun bs!9144 () Bool)

(assert (= bs!9144 d!37804))

(declare-fun m!177279 () Bool)

(assert (=> bs!9144 m!177279))

(assert (=> b!117921 d!37804))

(declare-fun d!37806 () Bool)

(declare-fun e!77426 () Bool)

(assert (=> d!37806 e!77426))

(declare-fun res!97747 () Bool)

(assert (=> d!37806 (=> (not res!97747) (not e!77426))))

(declare-fun lt!181323 () (_ BitVec 64))

(declare-fun lt!181321 () (_ BitVec 64))

(declare-fun lt!181318 () (_ BitVec 64))

(assert (=> d!37806 (= res!97747 (= lt!181318 (bvsub lt!181321 lt!181323)))))

(assert (=> d!37806 (or (= (bvand lt!181321 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!181323 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!181321 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!181321 lt!181323) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37806 (= lt!181323 (remainingBits!0 ((_ sign_extend 32) (size!2404 (buf!2820 (_1!5194 lt!180946)))) ((_ sign_extend 32) (currentByte!5469 (_1!5194 lt!180946))) ((_ sign_extend 32) (currentBit!5464 (_1!5194 lt!180946)))))))

(declare-fun lt!181322 () (_ BitVec 64))

(declare-fun lt!181320 () (_ BitVec 64))

(assert (=> d!37806 (= lt!181321 (bvmul lt!181322 lt!181320))))

(assert (=> d!37806 (or (= lt!181322 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!181320 (bvsdiv (bvmul lt!181322 lt!181320) lt!181322)))))

(assert (=> d!37806 (= lt!181320 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37806 (= lt!181322 ((_ sign_extend 32) (size!2404 (buf!2820 (_1!5194 lt!180946)))))))

(assert (=> d!37806 (= lt!181318 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5469 (_1!5194 lt!180946))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5464 (_1!5194 lt!180946)))))))

(assert (=> d!37806 (invariant!0 (currentBit!5464 (_1!5194 lt!180946)) (currentByte!5469 (_1!5194 lt!180946)) (size!2404 (buf!2820 (_1!5194 lt!180946))))))

(assert (=> d!37806 (= (bitIndex!0 (size!2404 (buf!2820 (_1!5194 lt!180946))) (currentByte!5469 (_1!5194 lt!180946)) (currentBit!5464 (_1!5194 lt!180946))) lt!181318)))

(declare-fun b!118116 () Bool)

(declare-fun res!97746 () Bool)

(assert (=> b!118116 (=> (not res!97746) (not e!77426))))

(assert (=> b!118116 (= res!97746 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!181318))))

(declare-fun b!118117 () Bool)

(declare-fun lt!181319 () (_ BitVec 64))

(assert (=> b!118117 (= e!77426 (bvsle lt!181318 (bvmul lt!181319 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!118117 (or (= lt!181319 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!181319 #b0000000000000000000000000000000000000000000000000000000000001000) lt!181319)))))

(assert (=> b!118117 (= lt!181319 ((_ sign_extend 32) (size!2404 (buf!2820 (_1!5194 lt!180946)))))))

(assert (= (and d!37806 res!97747) b!118116))

(assert (= (and b!118116 res!97746) b!118117))

(declare-fun m!177281 () Bool)

(assert (=> d!37806 m!177281))

(declare-fun m!177283 () Bool)

(assert (=> d!37806 m!177283))

(assert (=> b!117921 d!37806))

(declare-fun d!37808 () Bool)

(assert (=> d!37808 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2404 (buf!2820 (_2!5195 lt!180958)))) ((_ sign_extend 32) (currentByte!5469 (_2!5195 lt!180963))) ((_ sign_extend 32) (currentBit!5464 (_2!5195 lt!180963))) lt!180964) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2404 (buf!2820 (_2!5195 lt!180958)))) ((_ sign_extend 32) (currentByte!5469 (_2!5195 lt!180963))) ((_ sign_extend 32) (currentBit!5464 (_2!5195 lt!180963)))) lt!180964))))

(declare-fun bs!9145 () Bool)

(assert (= bs!9145 d!37808))

(declare-fun m!177285 () Bool)

(assert (=> bs!9145 m!177285))

(assert (=> b!117921 d!37808))

(declare-fun d!37810 () Bool)

(declare-fun e!77429 () Bool)

(assert (=> d!37810 e!77429))

(declare-fun res!97750 () Bool)

(assert (=> d!37810 (=> (not res!97750) (not e!77429))))

(declare-fun lt!181333 () tuple2!9858)

(declare-fun lt!181335 () tuple2!9858)

(assert (=> d!37810 (= res!97750 (= (bitIndex!0 (size!2404 (buf!2820 (_1!5194 lt!181333))) (currentByte!5469 (_1!5194 lt!181333)) (currentBit!5464 (_1!5194 lt!181333))) (bitIndex!0 (size!2404 (buf!2820 (_1!5194 lt!181335))) (currentByte!5469 (_1!5194 lt!181335)) (currentBit!5464 (_1!5194 lt!181335)))))))

(declare-fun lt!181332 () BitStream!4282)

(declare-fun lt!181334 () Unit!7255)

(declare-fun choose!50 (BitStream!4282 BitStream!4282 BitStream!4282 tuple2!9858 tuple2!9858 BitStream!4282 Bool tuple2!9858 tuple2!9858 BitStream!4282 Bool) Unit!7255)

(assert (=> d!37810 (= lt!181334 (choose!50 lt!180947 (_2!5195 lt!180958) lt!181332 lt!181333 (tuple2!9859 (_1!5194 lt!181333) (_2!5194 lt!181333)) (_1!5194 lt!181333) (_2!5194 lt!181333) lt!181335 (tuple2!9859 (_1!5194 lt!181335) (_2!5194 lt!181335)) (_1!5194 lt!181335) (_2!5194 lt!181335)))))

(assert (=> d!37810 (= lt!181335 (readBitPure!0 lt!181332))))

(assert (=> d!37810 (= lt!181333 (readBitPure!0 lt!180947))))

(assert (=> d!37810 (= lt!181332 (BitStream!4283 (buf!2820 (_2!5195 lt!180958)) (currentByte!5469 lt!180947) (currentBit!5464 lt!180947)))))

(assert (=> d!37810 (invariant!0 (currentBit!5464 lt!180947) (currentByte!5469 lt!180947) (size!2404 (buf!2820 (_2!5195 lt!180958))))))

(assert (=> d!37810 (= (readBitPrefixLemma!0 lt!180947 (_2!5195 lt!180958)) lt!181334)))

(declare-fun b!118120 () Bool)

(assert (=> b!118120 (= e!77429 (= (_2!5194 lt!181333) (_2!5194 lt!181335)))))

(assert (= (and d!37810 res!97750) b!118120))

(declare-fun m!177287 () Bool)

(assert (=> d!37810 m!177287))

(declare-fun m!177289 () Bool)

(assert (=> d!37810 m!177289))

(declare-fun m!177291 () Bool)

(assert (=> d!37810 m!177291))

(declare-fun m!177293 () Bool)

(assert (=> d!37810 m!177293))

(assert (=> d!37810 m!176989))

(declare-fun m!177295 () Bool)

(assert (=> d!37810 m!177295))

(assert (=> b!117921 d!37810))

(declare-fun d!37812 () Bool)

(declare-fun res!97751 () Bool)

(declare-fun e!77431 () Bool)

(assert (=> d!37812 (=> (not res!97751) (not e!77431))))

(assert (=> d!37812 (= res!97751 (= (size!2404 (buf!2820 thiss!1305)) (size!2404 (buf!2820 (_2!5195 lt!180958)))))))

(assert (=> d!37812 (= (isPrefixOf!0 thiss!1305 (_2!5195 lt!180958)) e!77431)))

(declare-fun b!118121 () Bool)

(declare-fun res!97752 () Bool)

(assert (=> b!118121 (=> (not res!97752) (not e!77431))))

(assert (=> b!118121 (= res!97752 (bvsle (bitIndex!0 (size!2404 (buf!2820 thiss!1305)) (currentByte!5469 thiss!1305) (currentBit!5464 thiss!1305)) (bitIndex!0 (size!2404 (buf!2820 (_2!5195 lt!180958))) (currentByte!5469 (_2!5195 lt!180958)) (currentBit!5464 (_2!5195 lt!180958)))))))

(declare-fun b!118122 () Bool)

(declare-fun e!77430 () Bool)

(assert (=> b!118122 (= e!77431 e!77430)))

(declare-fun res!97753 () Bool)

(assert (=> b!118122 (=> res!97753 e!77430)))

(assert (=> b!118122 (= res!97753 (= (size!2404 (buf!2820 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!118123 () Bool)

(assert (=> b!118123 (= e!77430 (arrayBitRangesEq!0 (buf!2820 thiss!1305) (buf!2820 (_2!5195 lt!180958)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2404 (buf!2820 thiss!1305)) (currentByte!5469 thiss!1305) (currentBit!5464 thiss!1305))))))

(assert (= (and d!37812 res!97751) b!118121))

(assert (= (and b!118121 res!97752) b!118122))

(assert (= (and b!118122 (not res!97753)) b!118123))

(assert (=> b!118121 m!176949))

(declare-fun m!177297 () Bool)

(assert (=> b!118121 m!177297))

(assert (=> b!118123 m!176949))

(assert (=> b!118123 m!176949))

(declare-fun m!177299 () Bool)

(assert (=> b!118123 m!177299))

(assert (=> b!117921 d!37812))

(declare-fun b!118149 () Bool)

(declare-fun e!77442 () Unit!7255)

(declare-fun Unit!7269 () Unit!7255)

(assert (=> b!118149 (= e!77442 Unit!7269)))

(declare-fun b!118150 () Bool)

(declare-fun res!97771 () Bool)

(declare-fun e!77443 () Bool)

(assert (=> b!118150 (=> (not res!97771) (not e!77443))))

(declare-fun lt!181440 () tuple2!9856)

(assert (=> b!118150 (= res!97771 (isPrefixOf!0 (_2!5193 lt!181440) (_2!5195 lt!180958)))))

(declare-fun b!118151 () Bool)

(declare-fun lt!181436 () (_ BitVec 64))

(declare-fun lt!181437 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4282 (_ BitVec 64)) BitStream!4282)

(assert (=> b!118151 (= e!77443 (= (_1!5193 lt!181440) (withMovedBitIndex!0 (_2!5193 lt!181440) (bvsub lt!181437 lt!181436))))))

(assert (=> b!118151 (or (= (bvand lt!181437 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!181436 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!181437 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!181437 lt!181436) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!118151 (= lt!181436 (bitIndex!0 (size!2404 (buf!2820 (_2!5195 lt!180958))) (currentByte!5469 (_2!5195 lt!180958)) (currentBit!5464 (_2!5195 lt!180958))))))

(assert (=> b!118151 (= lt!181437 (bitIndex!0 (size!2404 (buf!2820 thiss!1305)) (currentByte!5469 thiss!1305) (currentBit!5464 thiss!1305)))))

(declare-fun b!118152 () Bool)

(declare-fun res!97769 () Bool)

(assert (=> b!118152 (=> (not res!97769) (not e!77443))))

(assert (=> b!118152 (= res!97769 (isPrefixOf!0 (_1!5193 lt!181440) thiss!1305))))

(declare-fun d!37814 () Bool)

(assert (=> d!37814 e!77443))

(declare-fun res!97770 () Bool)

(assert (=> d!37814 (=> (not res!97770) (not e!77443))))

(assert (=> d!37814 (= res!97770 (isPrefixOf!0 (_1!5193 lt!181440) (_2!5193 lt!181440)))))

(declare-fun lt!181441 () BitStream!4282)

(assert (=> d!37814 (= lt!181440 (tuple2!9857 lt!181441 (_2!5195 lt!180958)))))

(declare-fun lt!181454 () Unit!7255)

(declare-fun lt!181447 () Unit!7255)

(assert (=> d!37814 (= lt!181454 lt!181447)))

(assert (=> d!37814 (isPrefixOf!0 lt!181441 (_2!5195 lt!180958))))

(assert (=> d!37814 (= lt!181447 (lemmaIsPrefixTransitive!0 lt!181441 (_2!5195 lt!180958) (_2!5195 lt!180958)))))

(declare-fun lt!181445 () Unit!7255)

(declare-fun lt!181452 () Unit!7255)

(assert (=> d!37814 (= lt!181445 lt!181452)))

(assert (=> d!37814 (isPrefixOf!0 lt!181441 (_2!5195 lt!180958))))

(assert (=> d!37814 (= lt!181452 (lemmaIsPrefixTransitive!0 lt!181441 thiss!1305 (_2!5195 lt!180958)))))

(declare-fun lt!181448 () Unit!7255)

(assert (=> d!37814 (= lt!181448 e!77442)))

(declare-fun c!7099 () Bool)

(assert (=> d!37814 (= c!7099 (not (= (size!2404 (buf!2820 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!181446 () Unit!7255)

(declare-fun lt!181450 () Unit!7255)

(assert (=> d!37814 (= lt!181446 lt!181450)))

(assert (=> d!37814 (isPrefixOf!0 (_2!5195 lt!180958) (_2!5195 lt!180958))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4282) Unit!7255)

(assert (=> d!37814 (= lt!181450 (lemmaIsPrefixRefl!0 (_2!5195 lt!180958)))))

(declare-fun lt!181439 () Unit!7255)

(declare-fun lt!181449 () Unit!7255)

(assert (=> d!37814 (= lt!181439 lt!181449)))

(assert (=> d!37814 (= lt!181449 (lemmaIsPrefixRefl!0 (_2!5195 lt!180958)))))

(declare-fun lt!181438 () Unit!7255)

(declare-fun lt!181455 () Unit!7255)

(assert (=> d!37814 (= lt!181438 lt!181455)))

(assert (=> d!37814 (isPrefixOf!0 lt!181441 lt!181441)))

(assert (=> d!37814 (= lt!181455 (lemmaIsPrefixRefl!0 lt!181441))))

(declare-fun lt!181444 () Unit!7255)

(declare-fun lt!181453 () Unit!7255)

(assert (=> d!37814 (= lt!181444 lt!181453)))

(assert (=> d!37814 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!37814 (= lt!181453 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!37814 (= lt!181441 (BitStream!4283 (buf!2820 (_2!5195 lt!180958)) (currentByte!5469 thiss!1305) (currentBit!5464 thiss!1305)))))

(assert (=> d!37814 (isPrefixOf!0 thiss!1305 (_2!5195 lt!180958))))

(assert (=> d!37814 (= (reader!0 thiss!1305 (_2!5195 lt!180958)) lt!181440)))

(declare-fun b!118153 () Bool)

(declare-fun lt!181443 () Unit!7255)

(assert (=> b!118153 (= e!77442 lt!181443)))

(declare-fun lt!181442 () (_ BitVec 64))

(assert (=> b!118153 (= lt!181442 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!181451 () (_ BitVec 64))

(assert (=> b!118153 (= lt!181451 (bitIndex!0 (size!2404 (buf!2820 thiss!1305)) (currentByte!5469 thiss!1305) (currentBit!5464 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5300 array!5300 (_ BitVec 64) (_ BitVec 64)) Unit!7255)

(assert (=> b!118153 (= lt!181443 (arrayBitRangesEqSymmetric!0 (buf!2820 thiss!1305) (buf!2820 (_2!5195 lt!180958)) lt!181442 lt!181451))))

(assert (=> b!118153 (arrayBitRangesEq!0 (buf!2820 (_2!5195 lt!180958)) (buf!2820 thiss!1305) lt!181442 lt!181451)))

(assert (= (and d!37814 c!7099) b!118153))

(assert (= (and d!37814 (not c!7099)) b!118149))

(assert (= (and d!37814 res!97770) b!118152))

(assert (= (and b!118152 res!97769) b!118150))

(assert (= (and b!118150 res!97771) b!118151))

(declare-fun m!177331 () Bool)

(assert (=> b!118151 m!177331))

(assert (=> b!118151 m!177297))

(assert (=> b!118151 m!176949))

(declare-fun m!177333 () Bool)

(assert (=> b!118152 m!177333))

(declare-fun m!177335 () Bool)

(assert (=> d!37814 m!177335))

(declare-fun m!177337 () Bool)

(assert (=> d!37814 m!177337))

(declare-fun m!177339 () Bool)

(assert (=> d!37814 m!177339))

(declare-fun m!177341 () Bool)

(assert (=> d!37814 m!177341))

(declare-fun m!177343 () Bool)

(assert (=> d!37814 m!177343))

(declare-fun m!177345 () Bool)

(assert (=> d!37814 m!177345))

(declare-fun m!177347 () Bool)

(assert (=> d!37814 m!177347))

(declare-fun m!177349 () Bool)

(assert (=> d!37814 m!177349))

(assert (=> d!37814 m!176971))

(declare-fun m!177351 () Bool)

(assert (=> d!37814 m!177351))

(declare-fun m!177353 () Bool)

(assert (=> d!37814 m!177353))

(assert (=> b!118153 m!176949))

(declare-fun m!177355 () Bool)

(assert (=> b!118153 m!177355))

(declare-fun m!177357 () Bool)

(assert (=> b!118153 m!177357))

(declare-fun m!177359 () Bool)

(assert (=> b!118150 m!177359))

(assert (=> b!117921 d!37814))

(declare-fun d!37818 () Bool)

(assert (=> d!37818 (isPrefixOf!0 thiss!1305 (_2!5195 lt!180958))))

(declare-fun lt!181458 () Unit!7255)

(declare-fun choose!30 (BitStream!4282 BitStream!4282 BitStream!4282) Unit!7255)

(assert (=> d!37818 (= lt!181458 (choose!30 thiss!1305 (_2!5195 lt!180963) (_2!5195 lt!180958)))))

(assert (=> d!37818 (isPrefixOf!0 thiss!1305 (_2!5195 lt!180963))))

(assert (=> d!37818 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5195 lt!180963) (_2!5195 lt!180958)) lt!181458)))

(declare-fun bs!9146 () Bool)

(assert (= bs!9146 d!37818))

(assert (=> bs!9146 m!176971))

(declare-fun m!177361 () Bool)

(assert (=> bs!9146 m!177361))

(assert (=> bs!9146 m!176963))

(assert (=> b!117921 d!37818))

(declare-fun d!37820 () Bool)

(declare-fun lt!181459 () tuple2!9884)

(assert (=> d!37820 (= lt!181459 (readBit!0 (BitStream!4283 (buf!2820 (_2!5195 lt!180958)) (currentByte!5469 thiss!1305) (currentBit!5464 thiss!1305))))))

(assert (=> d!37820 (= (readBitPure!0 (BitStream!4283 (buf!2820 (_2!5195 lt!180958)) (currentByte!5469 thiss!1305) (currentBit!5464 thiss!1305))) (tuple2!9859 (_2!5207 lt!181459) (_1!5207 lt!181459)))))

(declare-fun bs!9147 () Bool)

(assert (= bs!9147 d!37820))

(declare-fun m!177363 () Bool)

(assert (=> bs!9147 m!177363))

(assert (=> b!117921 d!37820))

(declare-fun lt!181460 () tuple2!9888)

(declare-fun d!37822 () Bool)

(assert (=> d!37822 (= lt!181460 (readNLeastSignificantBitsLoop!0 (_1!5193 lt!180957) nBits!396 i!615 lt!180956))))

(assert (=> d!37822 (= (readNLeastSignificantBitsLoopPure!0 (_1!5193 lt!180957) nBits!396 i!615 lt!180956) (tuple2!9863 (_2!5209 lt!181460) (_1!5209 lt!181460)))))

(declare-fun bs!9148 () Bool)

(assert (= bs!9148 d!37822))

(declare-fun m!177365 () Bool)

(assert (=> bs!9148 m!177365))

(assert (=> b!117921 d!37822))

(declare-fun d!37824 () Bool)

(assert (=> d!37824 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2404 (buf!2820 (_2!5195 lt!180958)))) ((_ sign_extend 32) (currentByte!5469 thiss!1305)) ((_ sign_extend 32) (currentBit!5464 thiss!1305)) lt!180960) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2404 (buf!2820 (_2!5195 lt!180958)))) ((_ sign_extend 32) (currentByte!5469 thiss!1305)) ((_ sign_extend 32) (currentBit!5464 thiss!1305))) lt!180960))))

(declare-fun bs!9149 () Bool)

(assert (= bs!9149 d!37824))

(declare-fun m!177367 () Bool)

(assert (=> bs!9149 m!177367))

(assert (=> b!117921 d!37824))

(declare-fun b!118154 () Bool)

(declare-fun e!77444 () Unit!7255)

(declare-fun Unit!7271 () Unit!7255)

(assert (=> b!118154 (= e!77444 Unit!7271)))

(declare-fun b!118155 () Bool)

(declare-fun res!97774 () Bool)

(declare-fun e!77445 () Bool)

(assert (=> b!118155 (=> (not res!97774) (not e!77445))))

(declare-fun lt!181465 () tuple2!9856)

(assert (=> b!118155 (= res!97774 (isPrefixOf!0 (_2!5193 lt!181465) (_2!5195 lt!180958)))))

(declare-fun b!118156 () Bool)

(declare-fun lt!181462 () (_ BitVec 64))

(declare-fun lt!181461 () (_ BitVec 64))

(assert (=> b!118156 (= e!77445 (= (_1!5193 lt!181465) (withMovedBitIndex!0 (_2!5193 lt!181465) (bvsub lt!181462 lt!181461))))))

(assert (=> b!118156 (or (= (bvand lt!181462 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!181461 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!181462 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!181462 lt!181461) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!118156 (= lt!181461 (bitIndex!0 (size!2404 (buf!2820 (_2!5195 lt!180958))) (currentByte!5469 (_2!5195 lt!180958)) (currentBit!5464 (_2!5195 lt!180958))))))

(assert (=> b!118156 (= lt!181462 (bitIndex!0 (size!2404 (buf!2820 (_2!5195 lt!180963))) (currentByte!5469 (_2!5195 lt!180963)) (currentBit!5464 (_2!5195 lt!180963))))))

(declare-fun b!118157 () Bool)

(declare-fun res!97772 () Bool)

(assert (=> b!118157 (=> (not res!97772) (not e!77445))))

(assert (=> b!118157 (= res!97772 (isPrefixOf!0 (_1!5193 lt!181465) (_2!5195 lt!180963)))))

(declare-fun d!37826 () Bool)

(assert (=> d!37826 e!77445))

(declare-fun res!97773 () Bool)

(assert (=> d!37826 (=> (not res!97773) (not e!77445))))

(assert (=> d!37826 (= res!97773 (isPrefixOf!0 (_1!5193 lt!181465) (_2!5193 lt!181465)))))

(declare-fun lt!181466 () BitStream!4282)

(assert (=> d!37826 (= lt!181465 (tuple2!9857 lt!181466 (_2!5195 lt!180958)))))

(declare-fun lt!181479 () Unit!7255)

(declare-fun lt!181472 () Unit!7255)

(assert (=> d!37826 (= lt!181479 lt!181472)))

(assert (=> d!37826 (isPrefixOf!0 lt!181466 (_2!5195 lt!180958))))

(assert (=> d!37826 (= lt!181472 (lemmaIsPrefixTransitive!0 lt!181466 (_2!5195 lt!180958) (_2!5195 lt!180958)))))

(declare-fun lt!181470 () Unit!7255)

(declare-fun lt!181477 () Unit!7255)

(assert (=> d!37826 (= lt!181470 lt!181477)))

(assert (=> d!37826 (isPrefixOf!0 lt!181466 (_2!5195 lt!180958))))

(assert (=> d!37826 (= lt!181477 (lemmaIsPrefixTransitive!0 lt!181466 (_2!5195 lt!180963) (_2!5195 lt!180958)))))

(declare-fun lt!181473 () Unit!7255)

(assert (=> d!37826 (= lt!181473 e!77444)))

(declare-fun c!7100 () Bool)

(assert (=> d!37826 (= c!7100 (not (= (size!2404 (buf!2820 (_2!5195 lt!180963))) #b00000000000000000000000000000000)))))

(declare-fun lt!181471 () Unit!7255)

(declare-fun lt!181475 () Unit!7255)

(assert (=> d!37826 (= lt!181471 lt!181475)))

(assert (=> d!37826 (isPrefixOf!0 (_2!5195 lt!180958) (_2!5195 lt!180958))))

(assert (=> d!37826 (= lt!181475 (lemmaIsPrefixRefl!0 (_2!5195 lt!180958)))))

(declare-fun lt!181464 () Unit!7255)

(declare-fun lt!181474 () Unit!7255)

(assert (=> d!37826 (= lt!181464 lt!181474)))

(assert (=> d!37826 (= lt!181474 (lemmaIsPrefixRefl!0 (_2!5195 lt!180958)))))

(declare-fun lt!181463 () Unit!7255)

(declare-fun lt!181480 () Unit!7255)

(assert (=> d!37826 (= lt!181463 lt!181480)))

(assert (=> d!37826 (isPrefixOf!0 lt!181466 lt!181466)))

(assert (=> d!37826 (= lt!181480 (lemmaIsPrefixRefl!0 lt!181466))))

(declare-fun lt!181469 () Unit!7255)

(declare-fun lt!181478 () Unit!7255)

(assert (=> d!37826 (= lt!181469 lt!181478)))

(assert (=> d!37826 (isPrefixOf!0 (_2!5195 lt!180963) (_2!5195 lt!180963))))

(assert (=> d!37826 (= lt!181478 (lemmaIsPrefixRefl!0 (_2!5195 lt!180963)))))

(assert (=> d!37826 (= lt!181466 (BitStream!4283 (buf!2820 (_2!5195 lt!180958)) (currentByte!5469 (_2!5195 lt!180963)) (currentBit!5464 (_2!5195 lt!180963))))))

(assert (=> d!37826 (isPrefixOf!0 (_2!5195 lt!180963) (_2!5195 lt!180958))))

(assert (=> d!37826 (= (reader!0 (_2!5195 lt!180963) (_2!5195 lt!180958)) lt!181465)))

(declare-fun b!118158 () Bool)

(declare-fun lt!181468 () Unit!7255)

(assert (=> b!118158 (= e!77444 lt!181468)))

(declare-fun lt!181467 () (_ BitVec 64))

(assert (=> b!118158 (= lt!181467 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!181476 () (_ BitVec 64))

(assert (=> b!118158 (= lt!181476 (bitIndex!0 (size!2404 (buf!2820 (_2!5195 lt!180963))) (currentByte!5469 (_2!5195 lt!180963)) (currentBit!5464 (_2!5195 lt!180963))))))

(assert (=> b!118158 (= lt!181468 (arrayBitRangesEqSymmetric!0 (buf!2820 (_2!5195 lt!180963)) (buf!2820 (_2!5195 lt!180958)) lt!181467 lt!181476))))

(assert (=> b!118158 (arrayBitRangesEq!0 (buf!2820 (_2!5195 lt!180958)) (buf!2820 (_2!5195 lt!180963)) lt!181467 lt!181476)))

(assert (= (and d!37826 c!7100) b!118158))

(assert (= (and d!37826 (not c!7100)) b!118154))

(assert (= (and d!37826 res!97773) b!118157))

(assert (= (and b!118157 res!97772) b!118155))

(assert (= (and b!118155 res!97774) b!118156))

(declare-fun m!177369 () Bool)

(assert (=> b!118156 m!177369))

(assert (=> b!118156 m!177297))

(assert (=> b!118156 m!176947))

(declare-fun m!177371 () Bool)

(assert (=> b!118157 m!177371))

(declare-fun m!177373 () Bool)

(assert (=> d!37826 m!177373))

(declare-fun m!177375 () Bool)

(assert (=> d!37826 m!177375))

(declare-fun m!177377 () Bool)

(assert (=> d!37826 m!177377))

(declare-fun m!177379 () Bool)

(assert (=> d!37826 m!177379))

(declare-fun m!177381 () Bool)

(assert (=> d!37826 m!177381))

(declare-fun m!177383 () Bool)

(assert (=> d!37826 m!177383))

(assert (=> d!37826 m!177347))

(assert (=> d!37826 m!177349))

(declare-fun m!177385 () Bool)

(assert (=> d!37826 m!177385))

(declare-fun m!177387 () Bool)

(assert (=> d!37826 m!177387))

(declare-fun m!177389 () Bool)

(assert (=> d!37826 m!177389))

(assert (=> b!118158 m!176947))

(declare-fun m!177391 () Bool)

(assert (=> b!118158 m!177391))

(declare-fun m!177393 () Bool)

(assert (=> b!118158 m!177393))

(declare-fun m!177395 () Bool)

(assert (=> b!118155 m!177395))

(assert (=> b!117921 d!37826))

(declare-fun b!118295 () Bool)

(declare-fun e!77523 () Bool)

(declare-fun lt!181958 () tuple2!9858)

(declare-fun lt!181933 () tuple2!9860)

(assert (=> b!118295 (= e!77523 (= (bitIndex!0 (size!2404 (buf!2820 (_1!5194 lt!181958))) (currentByte!5469 (_1!5194 lt!181958)) (currentBit!5464 (_1!5194 lt!181958))) (bitIndex!0 (size!2404 (buf!2820 (_2!5195 lt!181933))) (currentByte!5469 (_2!5195 lt!181933)) (currentBit!5464 (_2!5195 lt!181933)))))))

(declare-fun b!118296 () Bool)

(declare-fun res!97878 () Bool)

(declare-fun e!77522 () Bool)

(assert (=> b!118296 (=> (not res!97878) (not e!77522))))

(declare-fun lt!181955 () tuple2!9860)

(declare-fun lt!181936 () (_ BitVec 64))

(declare-fun lt!181948 () (_ BitVec 64))

(assert (=> b!118296 (= res!97878 (= (bitIndex!0 (size!2404 (buf!2820 (_2!5195 lt!181955))) (currentByte!5469 (_2!5195 lt!181955)) (currentBit!5464 (_2!5195 lt!181955))) (bvadd lt!181936 lt!181948)))))

(assert (=> b!118296 (or (not (= (bvand lt!181936 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!181948 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!181936 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!181936 lt!181948) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!118296 (= lt!181948 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!118296 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!118296 (= lt!181936 (bitIndex!0 (size!2404 (buf!2820 (_2!5195 lt!180963))) (currentByte!5469 (_2!5195 lt!180963)) (currentBit!5464 (_2!5195 lt!180963))))))

(declare-fun b!118297 () Bool)

(declare-fun res!97882 () Bool)

(declare-fun call!1535 () Bool)

(assert (=> b!118297 (= res!97882 call!1535)))

(declare-fun e!77521 () Bool)

(assert (=> b!118297 (=> (not res!97882) (not e!77521))))

(declare-fun b!118298 () Bool)

(assert (=> b!118298 (= lt!181958 (readBitPure!0 (readerFrom!0 (_2!5195 lt!181933) (currentBit!5464 (_2!5195 lt!180963)) (currentByte!5469 (_2!5195 lt!180963)))))))

(declare-fun lt!181946 () Bool)

(declare-fun res!97883 () Bool)

(assert (=> b!118298 (= res!97883 (and (= (_2!5194 lt!181958) lt!181946) (= (_1!5194 lt!181958) (_2!5195 lt!181933))))))

(assert (=> b!118298 (=> (not res!97883) (not e!77523))))

(assert (=> b!118298 (= e!77521 e!77523)))

(declare-fun b!118299 () Bool)

(declare-fun e!77520 () tuple2!9860)

(declare-fun lt!181942 () tuple2!9860)

(declare-fun Unit!7272 () Unit!7255)

(assert (=> b!118299 (= e!77520 (tuple2!9861 Unit!7272 (_2!5195 lt!181942)))))

(assert (=> b!118299 (= lt!181946 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!118299 (= lt!181933 (appendBit!0 (_2!5195 lt!180963) lt!181946))))

(declare-fun res!97877 () Bool)

(assert (=> b!118299 (= res!97877 (= (size!2404 (buf!2820 (_2!5195 lt!180963))) (size!2404 (buf!2820 (_2!5195 lt!181933)))))))

(assert (=> b!118299 (=> (not res!97877) (not e!77521))))

(assert (=> b!118299 e!77521))

(declare-fun lt!181953 () tuple2!9860)

(assert (=> b!118299 (= lt!181953 lt!181933)))

(assert (=> b!118299 (= lt!181942 (appendNLeastSignificantBitsLoop!0 (_2!5195 lt!181953) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!181959 () Unit!7255)

(assert (=> b!118299 (= lt!181959 (lemmaIsPrefixTransitive!0 (_2!5195 lt!180963) (_2!5195 lt!181953) (_2!5195 lt!181942)))))

(assert (=> b!118299 (isPrefixOf!0 (_2!5195 lt!180963) (_2!5195 lt!181942))))

(declare-fun lt!181952 () Unit!7255)

(assert (=> b!118299 (= lt!181952 lt!181959)))

(assert (=> b!118299 (invariant!0 (currentBit!5464 (_2!5195 lt!180963)) (currentByte!5469 (_2!5195 lt!180963)) (size!2404 (buf!2820 (_2!5195 lt!181953))))))

(declare-fun lt!181938 () BitStream!4282)

(assert (=> b!118299 (= lt!181938 (BitStream!4283 (buf!2820 (_2!5195 lt!181953)) (currentByte!5469 (_2!5195 lt!180963)) (currentBit!5464 (_2!5195 lt!180963))))))

(assert (=> b!118299 (invariant!0 (currentBit!5464 lt!181938) (currentByte!5469 lt!181938) (size!2404 (buf!2820 (_2!5195 lt!181942))))))

(declare-fun lt!181954 () BitStream!4282)

(assert (=> b!118299 (= lt!181954 (BitStream!4283 (buf!2820 (_2!5195 lt!181942)) (currentByte!5469 lt!181938) (currentBit!5464 lt!181938)))))

(declare-fun lt!181924 () tuple2!9858)

(assert (=> b!118299 (= lt!181924 (readBitPure!0 lt!181938))))

(declare-fun lt!181934 () tuple2!9858)

(assert (=> b!118299 (= lt!181934 (readBitPure!0 lt!181954))))

(declare-fun lt!181918 () Unit!7255)

(assert (=> b!118299 (= lt!181918 (readBitPrefixLemma!0 lt!181938 (_2!5195 lt!181942)))))

(declare-fun res!97879 () Bool)

(assert (=> b!118299 (= res!97879 (= (bitIndex!0 (size!2404 (buf!2820 (_1!5194 lt!181924))) (currentByte!5469 (_1!5194 lt!181924)) (currentBit!5464 (_1!5194 lt!181924))) (bitIndex!0 (size!2404 (buf!2820 (_1!5194 lt!181934))) (currentByte!5469 (_1!5194 lt!181934)) (currentBit!5464 (_1!5194 lt!181934)))))))

(declare-fun e!77524 () Bool)

(assert (=> b!118299 (=> (not res!97879) (not e!77524))))

(assert (=> b!118299 e!77524))

(declare-fun lt!181916 () Unit!7255)

(assert (=> b!118299 (= lt!181916 lt!181918)))

(declare-fun lt!181932 () tuple2!9856)

(assert (=> b!118299 (= lt!181932 (reader!0 (_2!5195 lt!180963) (_2!5195 lt!181942)))))

(declare-fun lt!181919 () tuple2!9856)

(assert (=> b!118299 (= lt!181919 (reader!0 (_2!5195 lt!181953) (_2!5195 lt!181942)))))

(declare-fun lt!181937 () tuple2!9858)

(assert (=> b!118299 (= lt!181937 (readBitPure!0 (_1!5193 lt!181932)))))

(assert (=> b!118299 (= (_2!5194 lt!181937) lt!181946)))

(declare-fun lt!181928 () Unit!7255)

(declare-fun Unit!7273 () Unit!7255)

(assert (=> b!118299 (= lt!181928 Unit!7273)))

(declare-fun lt!181935 () (_ BitVec 64))

(assert (=> b!118299 (= lt!181935 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!181941 () (_ BitVec 64))

(assert (=> b!118299 (= lt!181941 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!181950 () Unit!7255)

(assert (=> b!118299 (= lt!181950 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5195 lt!180963) (buf!2820 (_2!5195 lt!181942)) lt!181941))))

(assert (=> b!118299 (validate_offset_bits!1 ((_ sign_extend 32) (size!2404 (buf!2820 (_2!5195 lt!181942)))) ((_ sign_extend 32) (currentByte!5469 (_2!5195 lt!180963))) ((_ sign_extend 32) (currentBit!5464 (_2!5195 lt!180963))) lt!181941)))

(declare-fun lt!181956 () Unit!7255)

(assert (=> b!118299 (= lt!181956 lt!181950)))

(declare-fun lt!181921 () tuple2!9862)

(assert (=> b!118299 (= lt!181921 (readNLeastSignificantBitsLoopPure!0 (_1!5193 lt!181932) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!181935))))

(declare-fun lt!181940 () (_ BitVec 64))

(assert (=> b!118299 (= lt!181940 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!181923 () Unit!7255)

(assert (=> b!118299 (= lt!181923 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5195 lt!181953) (buf!2820 (_2!5195 lt!181942)) lt!181940))))

(assert (=> b!118299 (validate_offset_bits!1 ((_ sign_extend 32) (size!2404 (buf!2820 (_2!5195 lt!181942)))) ((_ sign_extend 32) (currentByte!5469 (_2!5195 lt!181953))) ((_ sign_extend 32) (currentBit!5464 (_2!5195 lt!181953))) lt!181940)))

(declare-fun lt!181944 () Unit!7255)

(assert (=> b!118299 (= lt!181944 lt!181923)))

(declare-fun lt!181925 () tuple2!9862)

(assert (=> b!118299 (= lt!181925 (readNLeastSignificantBitsLoopPure!0 (_1!5193 lt!181919) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!181935 (ite (_2!5194 lt!181937) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!181947 () tuple2!9862)

(assert (=> b!118299 (= lt!181947 (readNLeastSignificantBitsLoopPure!0 (_1!5193 lt!181932) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!181935))))

(declare-fun c!7118 () Bool)

(assert (=> b!118299 (= c!7118 (_2!5194 (readBitPure!0 (_1!5193 lt!181932))))))

(declare-fun lt!181926 () tuple2!9862)

(declare-fun e!77519 () (_ BitVec 64))

(assert (=> b!118299 (= lt!181926 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5193 lt!181932) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!181935 e!77519)))))

(declare-fun lt!181949 () Unit!7255)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4282 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7255)

(assert (=> b!118299 (= lt!181949 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5193 lt!181932) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!181935))))

(assert (=> b!118299 (and (= (_2!5196 lt!181947) (_2!5196 lt!181926)) (= (_1!5196 lt!181947) (_1!5196 lt!181926)))))

(declare-fun lt!181939 () Unit!7255)

(assert (=> b!118299 (= lt!181939 lt!181949)))

(assert (=> b!118299 (= (_1!5193 lt!181932) (withMovedBitIndex!0 (_2!5193 lt!181932) (bvsub (bitIndex!0 (size!2404 (buf!2820 (_2!5195 lt!180963))) (currentByte!5469 (_2!5195 lt!180963)) (currentBit!5464 (_2!5195 lt!180963))) (bitIndex!0 (size!2404 (buf!2820 (_2!5195 lt!181942))) (currentByte!5469 (_2!5195 lt!181942)) (currentBit!5464 (_2!5195 lt!181942))))))))

(declare-fun lt!181929 () Unit!7255)

(declare-fun Unit!7274 () Unit!7255)

(assert (=> b!118299 (= lt!181929 Unit!7274)))

(assert (=> b!118299 (= (_1!5193 lt!181919) (withMovedBitIndex!0 (_2!5193 lt!181919) (bvsub (bitIndex!0 (size!2404 (buf!2820 (_2!5195 lt!181953))) (currentByte!5469 (_2!5195 lt!181953)) (currentBit!5464 (_2!5195 lt!181953))) (bitIndex!0 (size!2404 (buf!2820 (_2!5195 lt!181942))) (currentByte!5469 (_2!5195 lt!181942)) (currentBit!5464 (_2!5195 lt!181942))))))))

(declare-fun lt!181920 () Unit!7255)

(declare-fun Unit!7275 () Unit!7255)

(assert (=> b!118299 (= lt!181920 Unit!7275)))

(assert (=> b!118299 (= (bitIndex!0 (size!2404 (buf!2820 (_2!5195 lt!180963))) (currentByte!5469 (_2!5195 lt!180963)) (currentBit!5464 (_2!5195 lt!180963))) (bvsub (bitIndex!0 (size!2404 (buf!2820 (_2!5195 lt!181953))) (currentByte!5469 (_2!5195 lt!181953)) (currentBit!5464 (_2!5195 lt!181953))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!181957 () Unit!7255)

(declare-fun Unit!7276 () Unit!7255)

(assert (=> b!118299 (= lt!181957 Unit!7276)))

(assert (=> b!118299 (= (_2!5196 lt!181921) (_2!5196 lt!181925))))

(declare-fun lt!181927 () Unit!7255)

(declare-fun Unit!7277 () Unit!7255)

(assert (=> b!118299 (= lt!181927 Unit!7277)))

(assert (=> b!118299 (= (_1!5196 lt!181921) (_2!5193 lt!181932))))

(declare-fun lt!181922 () tuple2!9856)

(declare-fun b!118300 () Bool)

(declare-fun lt!181945 () tuple2!9862)

(assert (=> b!118300 (= e!77522 (and (= (_2!5196 lt!181945) v!199) (= (_1!5196 lt!181945) (_2!5193 lt!181922))))))

(declare-fun lt!181930 () (_ BitVec 64))

(assert (=> b!118300 (= lt!181945 (readNLeastSignificantBitsLoopPure!0 (_1!5193 lt!181922) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!181930))))

(declare-fun lt!181943 () Unit!7255)

(declare-fun lt!181931 () Unit!7255)

(assert (=> b!118300 (= lt!181943 lt!181931)))

(declare-fun lt!181951 () (_ BitVec 64))

(assert (=> b!118300 (validate_offset_bits!1 ((_ sign_extend 32) (size!2404 (buf!2820 (_2!5195 lt!181955)))) ((_ sign_extend 32) (currentByte!5469 (_2!5195 lt!180963))) ((_ sign_extend 32) (currentBit!5464 (_2!5195 lt!180963))) lt!181951)))

(assert (=> b!118300 (= lt!181931 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5195 lt!180963) (buf!2820 (_2!5195 lt!181955)) lt!181951))))

(declare-fun e!77525 () Bool)

(assert (=> b!118300 e!77525))

(declare-fun res!97881 () Bool)

(assert (=> b!118300 (=> (not res!97881) (not e!77525))))

(assert (=> b!118300 (= res!97881 (and (= (size!2404 (buf!2820 (_2!5195 lt!180963))) (size!2404 (buf!2820 (_2!5195 lt!181955)))) (bvsge lt!181951 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!118300 (= lt!181951 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!118300 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!118300 (= lt!181930 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!118300 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!118300 (= lt!181922 (reader!0 (_2!5195 lt!180963) (_2!5195 lt!181955)))))

(declare-fun d!37828 () Bool)

(assert (=> d!37828 e!77522))

(declare-fun res!97884 () Bool)

(assert (=> d!37828 (=> (not res!97884) (not e!77522))))

(assert (=> d!37828 (= res!97884 (= (size!2404 (buf!2820 (_2!5195 lt!180963))) (size!2404 (buf!2820 (_2!5195 lt!181955)))))))

(assert (=> d!37828 (= lt!181955 e!77520)))

(declare-fun c!7119 () Bool)

(assert (=> d!37828 (= c!7119 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!37828 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!37828 (= (appendNLeastSignificantBitsLoop!0 (_2!5195 lt!180963) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!181955)))

(declare-fun bm!1532 () Bool)

(declare-fun lt!181960 () BitStream!4282)

(assert (=> bm!1532 (= call!1535 (isPrefixOf!0 (ite c!7119 (_2!5195 lt!180963) lt!181960) (ite c!7119 (_2!5195 lt!181933) lt!181960)))))

(declare-fun b!118301 () Bool)

(assert (=> b!118301 (= e!77525 (validate_offset_bits!1 ((_ sign_extend 32) (size!2404 (buf!2820 (_2!5195 lt!180963)))) ((_ sign_extend 32) (currentByte!5469 (_2!5195 lt!180963))) ((_ sign_extend 32) (currentBit!5464 (_2!5195 lt!180963))) lt!181951))))

(declare-fun b!118302 () Bool)

(assert (=> b!118302 (= e!77519 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!118303 () Bool)

(assert (=> b!118303 (= e!77524 (= (_2!5194 lt!181924) (_2!5194 lt!181934)))))

(declare-fun b!118304 () Bool)

(declare-fun res!97880 () Bool)

(assert (=> b!118304 (=> (not res!97880) (not e!77522))))

(assert (=> b!118304 (= res!97880 (isPrefixOf!0 (_2!5195 lt!180963) (_2!5195 lt!181955)))))

(declare-fun b!118305 () Bool)

(assert (=> b!118305 (= e!77519 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!118306 () Bool)

(declare-fun lt!181917 () Unit!7255)

(assert (=> b!118306 (= e!77520 (tuple2!9861 lt!181917 (_2!5195 lt!180963)))))

(assert (=> b!118306 (= lt!181960 (_2!5195 lt!180963))))

(assert (=> b!118306 (= lt!181917 (lemmaIsPrefixRefl!0 lt!181960))))

(assert (=> b!118306 call!1535))

(declare-fun b!118307 () Bool)

(declare-fun res!97876 () Bool)

(assert (=> b!118307 (= res!97876 (= (bitIndex!0 (size!2404 (buf!2820 (_2!5195 lt!181933))) (currentByte!5469 (_2!5195 lt!181933)) (currentBit!5464 (_2!5195 lt!181933))) (bvadd (bitIndex!0 (size!2404 (buf!2820 (_2!5195 lt!180963))) (currentByte!5469 (_2!5195 lt!180963)) (currentBit!5464 (_2!5195 lt!180963))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!118307 (=> (not res!97876) (not e!77521))))

(assert (= (and d!37828 c!7119) b!118299))

(assert (= (and d!37828 (not c!7119)) b!118306))

(assert (= (and b!118299 res!97877) b!118307))

(assert (= (and b!118307 res!97876) b!118297))

(assert (= (and b!118297 res!97882) b!118298))

(assert (= (and b!118298 res!97883) b!118295))

(assert (= (and b!118299 res!97879) b!118303))

(assert (= (and b!118299 c!7118) b!118302))

(assert (= (and b!118299 (not c!7118)) b!118305))

(assert (= (or b!118297 b!118306) bm!1532))

(assert (= (and d!37828 res!97884) b!118296))

(assert (= (and b!118296 res!97878) b!118304))

(assert (= (and b!118304 res!97880) b!118300))

(assert (= (and b!118300 res!97881) b!118301))

(declare-fun m!177681 () Bool)

(assert (=> b!118298 m!177681))

(assert (=> b!118298 m!177681))

(declare-fun m!177685 () Bool)

(assert (=> b!118298 m!177685))

(declare-fun m!177687 () Bool)

(assert (=> b!118299 m!177687))

(declare-fun m!177689 () Bool)

(assert (=> b!118299 m!177689))

(declare-fun m!177691 () Bool)

(assert (=> b!118299 m!177691))

(declare-fun m!177693 () Bool)

(assert (=> b!118299 m!177693))

(declare-fun m!177697 () Bool)

(assert (=> b!118299 m!177697))

(declare-fun m!177699 () Bool)

(assert (=> b!118299 m!177699))

(declare-fun m!177701 () Bool)

(assert (=> b!118299 m!177701))

(declare-fun m!177703 () Bool)

(assert (=> b!118299 m!177703))

(declare-fun m!177705 () Bool)

(assert (=> b!118299 m!177705))

(declare-fun m!177707 () Bool)

(assert (=> b!118299 m!177707))

(declare-fun m!177709 () Bool)

(assert (=> b!118299 m!177709))

(declare-fun m!177711 () Bool)

(assert (=> b!118299 m!177711))

(declare-fun m!177713 () Bool)

(assert (=> b!118299 m!177713))

(assert (=> b!118299 m!176947))

(declare-fun m!177715 () Bool)

(assert (=> b!118299 m!177715))

(declare-fun m!177717 () Bool)

(assert (=> b!118299 m!177717))

(declare-fun m!177719 () Bool)

(assert (=> b!118299 m!177719))

(declare-fun m!177721 () Bool)

(assert (=> b!118299 m!177721))

(assert (=> b!118299 m!177699))

(declare-fun m!177723 () Bool)

(assert (=> b!118299 m!177723))

(declare-fun m!177725 () Bool)

(assert (=> b!118299 m!177725))

(declare-fun m!177727 () Bool)

(assert (=> b!118299 m!177727))

(declare-fun m!177729 () Bool)

(assert (=> b!118299 m!177729))

(declare-fun m!177731 () Bool)

(assert (=> b!118299 m!177731))

(declare-fun m!177733 () Bool)

(assert (=> b!118299 m!177733))

(declare-fun m!177735 () Bool)

(assert (=> b!118299 m!177735))

(declare-fun m!177737 () Bool)

(assert (=> b!118299 m!177737))

(declare-fun m!177739 () Bool)

(assert (=> b!118299 m!177739))

(declare-fun m!177741 () Bool)

(assert (=> b!118299 m!177741))

(declare-fun m!177743 () Bool)

(assert (=> b!118299 m!177743))

(declare-fun m!177745 () Bool)

(assert (=> b!118306 m!177745))

(declare-fun m!177747 () Bool)

(assert (=> b!118295 m!177747))

(declare-fun m!177749 () Bool)

(assert (=> b!118295 m!177749))

(declare-fun m!177751 () Bool)

(assert (=> b!118301 m!177751))

(declare-fun m!177753 () Bool)

(assert (=> b!118296 m!177753))

(assert (=> b!118296 m!176947))

(declare-fun m!177755 () Bool)

(assert (=> b!118304 m!177755))

(assert (=> b!118300 m!177709))

(declare-fun m!177757 () Bool)

(assert (=> b!118300 m!177757))

(declare-fun m!177759 () Bool)

(assert (=> b!118300 m!177759))

(declare-fun m!177761 () Bool)

(assert (=> b!118300 m!177761))

(declare-fun m!177763 () Bool)

(assert (=> b!118300 m!177763))

(declare-fun m!177765 () Bool)

(assert (=> bm!1532 m!177765))

(assert (=> b!118307 m!177749))

(assert (=> b!118307 m!176947))

(assert (=> b!117921 d!37828))

(declare-fun d!37882 () Bool)

(assert (=> d!37882 (validate_offset_bits!1 ((_ sign_extend 32) (size!2404 (buf!2820 (_2!5195 lt!180958)))) ((_ sign_extend 32) (currentByte!5469 thiss!1305)) ((_ sign_extend 32) (currentBit!5464 thiss!1305)) lt!180960)))

(declare-fun lt!181985 () Unit!7255)

(declare-fun choose!9 (BitStream!4282 array!5300 (_ BitVec 64) BitStream!4282) Unit!7255)

(assert (=> d!37882 (= lt!181985 (choose!9 thiss!1305 (buf!2820 (_2!5195 lt!180958)) lt!180960 (BitStream!4283 (buf!2820 (_2!5195 lt!180958)) (currentByte!5469 thiss!1305) (currentBit!5464 thiss!1305))))))

(assert (=> d!37882 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2820 (_2!5195 lt!180958)) lt!180960) lt!181985)))

(declare-fun bs!9163 () Bool)

(assert (= bs!9163 d!37882))

(assert (=> bs!9163 m!176979))

(declare-fun m!177767 () Bool)

(assert (=> bs!9163 m!177767))

(assert (=> b!117921 d!37882))

(declare-fun d!37884 () Bool)

(assert (=> d!37884 (validate_offset_bits!1 ((_ sign_extend 32) (size!2404 (buf!2820 (_2!5195 lt!180958)))) ((_ sign_extend 32) (currentByte!5469 (_2!5195 lt!180963))) ((_ sign_extend 32) (currentBit!5464 (_2!5195 lt!180963))) lt!180964)))

(declare-fun lt!181986 () Unit!7255)

(assert (=> d!37884 (= lt!181986 (choose!9 (_2!5195 lt!180963) (buf!2820 (_2!5195 lt!180958)) lt!180964 (BitStream!4283 (buf!2820 (_2!5195 lt!180958)) (currentByte!5469 (_2!5195 lt!180963)) (currentBit!5464 (_2!5195 lt!180963)))))))

(assert (=> d!37884 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5195 lt!180963) (buf!2820 (_2!5195 lt!180958)) lt!180964) lt!181986)))

(declare-fun bs!9164 () Bool)

(assert (= bs!9164 d!37884))

(assert (=> bs!9164 m!176967))

(declare-fun m!177769 () Bool)

(assert (=> bs!9164 m!177769))

(assert (=> b!117921 d!37884))

(declare-fun d!37886 () Bool)

(assert (=> d!37886 (= (invariant!0 (currentBit!5464 thiss!1305) (currentByte!5469 thiss!1305) (size!2404 (buf!2820 (_2!5195 lt!180958)))) (and (bvsge (currentBit!5464 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5464 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5469 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5469 thiss!1305) (size!2404 (buf!2820 (_2!5195 lt!180958)))) (and (= (currentBit!5464 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5469 thiss!1305) (size!2404 (buf!2820 (_2!5195 lt!180958))))))))))

(assert (=> b!117923 d!37886))

(declare-fun d!37888 () Bool)

(assert (=> d!37888 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2404 (buf!2820 (_1!5193 lt!180957)))) ((_ sign_extend 32) (currentByte!5469 (_1!5193 lt!180957))) ((_ sign_extend 32) (currentBit!5464 (_1!5193 lt!180957))) lt!180960) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2404 (buf!2820 (_1!5193 lt!180957)))) ((_ sign_extend 32) (currentByte!5469 (_1!5193 lt!180957))) ((_ sign_extend 32) (currentBit!5464 (_1!5193 lt!180957)))) lt!180960))))

(declare-fun bs!9165 () Bool)

(assert (= bs!9165 d!37888))

(declare-fun m!177771 () Bool)

(assert (=> bs!9165 m!177771))

(assert (=> b!117913 d!37888))

(declare-fun d!37890 () Bool)

(assert (=> d!37890 (= (array_inv!2206 (buf!2820 thiss!1305)) (bvsge (size!2404 (buf!2820 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!117915 d!37890))

(declare-fun d!37892 () Bool)

(assert (=> d!37892 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2404 (buf!2820 thiss!1305))) ((_ sign_extend 32) (currentByte!5469 thiss!1305)) ((_ sign_extend 32) (currentBit!5464 thiss!1305)) lt!180960) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2404 (buf!2820 thiss!1305))) ((_ sign_extend 32) (currentByte!5469 thiss!1305)) ((_ sign_extend 32) (currentBit!5464 thiss!1305))) lt!180960))))

(declare-fun bs!9166 () Bool)

(assert (= bs!9166 d!37892))

(assert (=> bs!9166 m!177235))

(assert (=> b!117925 d!37892))

(declare-fun d!37894 () Bool)

(assert (=> d!37894 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!117914 d!37894))

(push 1)

(assert (not b!118150))

(assert (not d!37774))

(assert (not d!37882))

(assert (not bm!1532))

(assert (not b!118054))

(assert (not d!37814))

(assert (not b!118299))

(assert (not d!37788))

(assert (not b!118304))

(assert (not d!37892))

(assert (not d!37780))

(assert (not d!37810))

(assert (not b!118298))

(assert (not b!118155))

(assert (not d!37822))

(assert (not b!118121))

(assert (not d!37792))

(assert (not b!118068))

(assert (not b!118158))

(assert (not d!37820))

(assert (not b!118153))

(assert (not d!37754))

(assert (not b!118110))

(assert (not b!118151))

(assert (not b!118295))

(assert (not d!37888))

(assert (not b!118157))

(assert (not d!37804))

(assert (not d!37782))

(assert (not d!37758))

(assert (not b!118301))

(assert (not d!37826))

(assert (not b!118112))

(assert (not d!37818))

(assert (not b!118300))

(assert (not b!118123))

(assert (not d!37802))

(assert (not b!118306))

(assert (not b!118307))

(assert (not b!118152))

(assert (not d!37884))

(assert (not b!118066))

(assert (not d!37824))

(assert (not d!37790))

(assert (not b!118113))

(assert (not b!118296))

(assert (not d!37806))

(assert (not b!118111))

(assert (not b!118156))

(assert (not d!37748))

(assert (not d!37808))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

