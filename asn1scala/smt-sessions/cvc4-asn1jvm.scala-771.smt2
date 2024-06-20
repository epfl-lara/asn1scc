; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22136 () Bool)

(assert start!22136)

(declare-fun b!111912 () Bool)

(declare-fun e!73444 () Bool)

(declare-datatypes ((array!5094 0))(
  ( (array!5095 (arr!2909 (Array (_ BitVec 32) (_ BitVec 8))) (size!2316 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4106 0))(
  ( (BitStream!4107 (buf!2719 array!5094) (currentByte!5285 (_ BitVec 32)) (currentBit!5280 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4106)

(declare-datatypes ((Unit!6851 0))(
  ( (Unit!6852) )
))
(declare-datatypes ((tuple2!9268 0))(
  ( (tuple2!9269 (_1!4894 Unit!6851) (_2!4894 BitStream!4106)) )
))
(declare-fun lt!169962 () tuple2!9268)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!111912 (= e!73444 (invariant!0 (currentBit!5280 thiss!1305) (currentByte!5285 thiss!1305) (size!2316 (buf!2719 (_2!4894 lt!169962)))))))

(declare-fun b!111913 () Bool)

(declare-fun e!73442 () Bool)

(declare-fun array_inv!2118 (array!5094) Bool)

(assert (=> b!111913 (= e!73442 (array_inv!2118 (buf!2719 thiss!1305)))))

(declare-fun b!111914 () Bool)

(declare-fun e!73443 () Bool)

(declare-fun e!73448 () Bool)

(assert (=> b!111914 (= e!73443 e!73448)))

(declare-fun res!92419 () Bool)

(assert (=> b!111914 (=> (not res!92419) (not e!73448))))

(declare-fun lt!169977 () (_ BitVec 64))

(declare-fun lt!169964 () (_ BitVec 64))

(assert (=> b!111914 (= res!92419 (= lt!169977 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!169964)))))

(declare-fun lt!169956 () tuple2!9268)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!111914 (= lt!169977 (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!169956))) (currentByte!5285 (_2!4894 lt!169956)) (currentBit!5280 (_2!4894 lt!169956))))))

(assert (=> b!111914 (= lt!169964 (bitIndex!0 (size!2316 (buf!2719 thiss!1305)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305)))))

(declare-fun b!111915 () Bool)

(declare-fun e!73446 () Bool)

(declare-datatypes ((tuple2!9270 0))(
  ( (tuple2!9271 (_1!4895 BitStream!4106) (_2!4895 Bool)) )
))
(declare-fun lt!169969 () tuple2!9270)

(declare-fun lt!169981 () tuple2!9270)

(assert (=> b!111915 (= e!73446 (= (_2!4895 lt!169969) (_2!4895 lt!169981)))))

(declare-fun res!92412 () Bool)

(declare-fun e!73451 () Bool)

(assert (=> start!22136 (=> (not res!92412) (not e!73451))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!22136 (= res!92412 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22136 e!73451))

(assert (=> start!22136 true))

(declare-fun inv!12 (BitStream!4106) Bool)

(assert (=> start!22136 (and (inv!12 thiss!1305) e!73442)))

(declare-fun b!111916 () Bool)

(declare-fun e!73445 () Bool)

(assert (=> b!111916 (= e!73448 e!73445)))

(declare-fun res!92417 () Bool)

(assert (=> b!111916 (=> (not res!92417) (not e!73445))))

(declare-fun lt!169959 () Bool)

(declare-fun lt!169974 () tuple2!9270)

(assert (=> b!111916 (= res!92417 (and (= (_2!4895 lt!169974) lt!169959) (= (_1!4895 lt!169974) (_2!4894 lt!169956))))))

(declare-fun readBitPure!0 (BitStream!4106) tuple2!9270)

(declare-fun readerFrom!0 (BitStream!4106 (_ BitVec 32) (_ BitVec 32)) BitStream!4106)

(assert (=> b!111916 (= lt!169974 (readBitPure!0 (readerFrom!0 (_2!4894 lt!169956) (currentBit!5280 thiss!1305) (currentByte!5285 thiss!1305))))))

(declare-fun b!111917 () Bool)

(declare-fun res!92413 () Bool)

(declare-fun e!73449 () Bool)

(assert (=> b!111917 (=> (not res!92413) (not e!73449))))

(assert (=> b!111917 (= res!92413 (bvslt i!615 nBits!396))))

(declare-fun b!111918 () Bool)

(declare-fun e!73450 () Bool)

(assert (=> b!111918 (= e!73449 (not e!73450))))

(declare-fun res!92410 () Bool)

(assert (=> b!111918 (=> res!92410 e!73450)))

(declare-fun lt!169975 () (_ BitVec 64))

(declare-datatypes ((tuple2!9272 0))(
  ( (tuple2!9273 (_1!4896 BitStream!4106) (_2!4896 BitStream!4106)) )
))
(declare-fun lt!169963 () tuple2!9272)

(declare-datatypes ((tuple2!9274 0))(
  ( (tuple2!9275 (_1!4897 BitStream!4106) (_2!4897 (_ BitVec 64))) )
))
(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4106 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9274)

(assert (=> b!111918 (= res!92410 (not (= (_1!4897 (readNLeastSignificantBitsLoopPure!0 (_1!4896 lt!169963) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!169975)) (_2!4896 lt!169963))))))

(declare-fun lt!169965 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!111918 (validate_offset_bits!1 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!169962)))) ((_ sign_extend 32) (currentByte!5285 (_2!4894 lt!169956))) ((_ sign_extend 32) (currentBit!5280 (_2!4894 lt!169956))) lt!169965)))

(declare-fun lt!169976 () Unit!6851)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4106 array!5094 (_ BitVec 64)) Unit!6851)

(assert (=> b!111918 (= lt!169976 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4894 lt!169956) (buf!2719 (_2!4894 lt!169962)) lt!169965))))

(assert (=> b!111918 (= lt!169965 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!169967 () (_ BitVec 64))

(declare-fun lt!169960 () tuple2!9270)

(declare-fun lt!169970 () (_ BitVec 64))

(assert (=> b!111918 (= lt!169975 (bvor lt!169967 (ite (_2!4895 lt!169960) lt!169970 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!169979 () tuple2!9274)

(declare-fun lt!169961 () tuple2!9272)

(assert (=> b!111918 (= lt!169979 (readNLeastSignificantBitsLoopPure!0 (_1!4896 lt!169961) nBits!396 i!615 lt!169967))))

(declare-fun lt!169966 () (_ BitVec 64))

(assert (=> b!111918 (validate_offset_bits!1 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!169962)))) ((_ sign_extend 32) (currentByte!5285 thiss!1305)) ((_ sign_extend 32) (currentBit!5280 thiss!1305)) lt!169966)))

(declare-fun lt!169955 () Unit!6851)

(assert (=> b!111918 (= lt!169955 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2719 (_2!4894 lt!169962)) lt!169966))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!111918 (= lt!169967 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!111918 (= (_2!4895 lt!169960) lt!169959)))

(assert (=> b!111918 (= lt!169960 (readBitPure!0 (_1!4896 lt!169961)))))

(declare-fun reader!0 (BitStream!4106 BitStream!4106) tuple2!9272)

(assert (=> b!111918 (= lt!169963 (reader!0 (_2!4894 lt!169956) (_2!4894 lt!169962)))))

(assert (=> b!111918 (= lt!169961 (reader!0 thiss!1305 (_2!4894 lt!169962)))))

(assert (=> b!111918 e!73446))

(declare-fun res!92421 () Bool)

(assert (=> b!111918 (=> (not res!92421) (not e!73446))))

(assert (=> b!111918 (= res!92421 (= (bitIndex!0 (size!2316 (buf!2719 (_1!4895 lt!169969))) (currentByte!5285 (_1!4895 lt!169969)) (currentBit!5280 (_1!4895 lt!169969))) (bitIndex!0 (size!2316 (buf!2719 (_1!4895 lt!169981))) (currentByte!5285 (_1!4895 lt!169981)) (currentBit!5280 (_1!4895 lt!169981)))))))

(declare-fun lt!169978 () Unit!6851)

(declare-fun lt!169971 () BitStream!4106)

(declare-fun readBitPrefixLemma!0 (BitStream!4106 BitStream!4106) Unit!6851)

(assert (=> b!111918 (= lt!169978 (readBitPrefixLemma!0 lt!169971 (_2!4894 lt!169962)))))

(assert (=> b!111918 (= lt!169981 (readBitPure!0 (BitStream!4107 (buf!2719 (_2!4894 lt!169962)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305))))))

(assert (=> b!111918 (= lt!169969 (readBitPure!0 lt!169971))))

(assert (=> b!111918 (= lt!169971 (BitStream!4107 (buf!2719 (_2!4894 lt!169956)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305)))))

(assert (=> b!111918 e!73444))

(declare-fun res!92411 () Bool)

(assert (=> b!111918 (=> (not res!92411) (not e!73444))))

(declare-fun isPrefixOf!0 (BitStream!4106 BitStream!4106) Bool)

(assert (=> b!111918 (= res!92411 (isPrefixOf!0 thiss!1305 (_2!4894 lt!169962)))))

(declare-fun lt!169972 () Unit!6851)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4106 BitStream!4106 BitStream!4106) Unit!6851)

(assert (=> b!111918 (= lt!169972 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4894 lt!169956) (_2!4894 lt!169962)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4106 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9268)

(assert (=> b!111918 (= lt!169962 (appendNLeastSignificantBitsLoop!0 (_2!4894 lt!169956) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!111918 e!73443))

(declare-fun res!92415 () Bool)

(assert (=> b!111918 (=> (not res!92415) (not e!73443))))

(assert (=> b!111918 (= res!92415 (= (size!2316 (buf!2719 thiss!1305)) (size!2316 (buf!2719 (_2!4894 lt!169956)))))))

(declare-fun appendBit!0 (BitStream!4106 Bool) tuple2!9268)

(assert (=> b!111918 (= lt!169956 (appendBit!0 thiss!1305 lt!169959))))

(assert (=> b!111918 (= lt!169959 (not (= (bvand v!199 lt!169970) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111918 (= lt!169970 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!111919 () Bool)

(assert (=> b!111919 (= e!73445 (= (bitIndex!0 (size!2316 (buf!2719 (_1!4895 lt!169974))) (currentByte!5285 (_1!4895 lt!169974)) (currentBit!5280 (_1!4895 lt!169974))) lt!169977))))

(declare-fun b!111920 () Bool)

(declare-fun res!92422 () Bool)

(assert (=> b!111920 (=> (not res!92422) (not e!73449))))

(assert (=> b!111920 (= res!92422 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!111921 () Bool)

(declare-fun res!92418 () Bool)

(assert (=> b!111921 (=> (not res!92418) (not e!73444))))

(assert (=> b!111921 (= res!92418 (invariant!0 (currentBit!5280 thiss!1305) (currentByte!5285 thiss!1305) (size!2316 (buf!2719 (_2!4894 lt!169956)))))))

(declare-fun b!111922 () Bool)

(assert (=> b!111922 (= e!73451 e!73449)))

(declare-fun res!92420 () Bool)

(assert (=> b!111922 (=> (not res!92420) (not e!73449))))

(assert (=> b!111922 (= res!92420 (validate_offset_bits!1 ((_ sign_extend 32) (size!2316 (buf!2719 thiss!1305))) ((_ sign_extend 32) (currentByte!5285 thiss!1305)) ((_ sign_extend 32) (currentBit!5280 thiss!1305)) lt!169966))))

(assert (=> b!111922 (= lt!169966 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!111923 () Bool)

(declare-fun lt!169982 () BitStream!4106)

(assert (=> b!111923 (= e!73450 (= (_1!4896 lt!169963) lt!169982))))

(declare-fun e!73441 () Bool)

(assert (=> b!111923 e!73441))

(declare-fun res!92416 () Bool)

(assert (=> b!111923 (=> (not res!92416) (not e!73441))))

(declare-fun lt!169968 () (_ BitVec 64))

(declare-fun lt!169973 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4106 (_ BitVec 64)) BitStream!4106)

(assert (=> b!111923 (= res!92416 (= (_1!4896 lt!169963) (withMovedBitIndex!0 (_2!4896 lt!169963) (bvsub lt!169968 lt!169973))))))

(assert (=> b!111923 (= lt!169968 (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!169956))) (currentByte!5285 (_2!4894 lt!169956)) (currentBit!5280 (_2!4894 lt!169956))))))

(declare-fun lt!169958 () (_ BitVec 64))

(assert (=> b!111923 (= (_1!4896 lt!169961) (withMovedBitIndex!0 (_2!4896 lt!169961) (bvsub lt!169958 lt!169973)))))

(assert (=> b!111923 (= lt!169973 (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!169962))) (currentByte!5285 (_2!4894 lt!169962)) (currentBit!5280 (_2!4894 lt!169962))))))

(assert (=> b!111923 (= lt!169958 (bitIndex!0 (size!2316 (buf!2719 thiss!1305)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305)))))

(declare-fun lt!169957 () tuple2!9274)

(assert (=> b!111923 (and (= (_2!4897 lt!169979) (_2!4897 lt!169957)) (= (_1!4897 lt!169979) (_1!4897 lt!169957)))))

(declare-fun lt!169980 () Unit!6851)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4106 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6851)

(assert (=> b!111923 (= lt!169980 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4896 lt!169961) nBits!396 i!615 lt!169967))))

(assert (=> b!111923 (= lt!169957 (readNLeastSignificantBitsLoopPure!0 lt!169982 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!169975))))

(assert (=> b!111923 (= lt!169982 (withMovedBitIndex!0 (_1!4896 lt!169961) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!111924 () Bool)

(declare-fun res!92414 () Bool)

(assert (=> b!111924 (=> (not res!92414) (not e!73448))))

(assert (=> b!111924 (= res!92414 (isPrefixOf!0 thiss!1305 (_2!4894 lt!169956)))))

(declare-fun b!111925 () Bool)

(assert (=> b!111925 (= e!73441 (= lt!169958 (bvsub lt!169968 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and start!22136 res!92412) b!111922))

(assert (= (and b!111922 res!92420) b!111920))

(assert (= (and b!111920 res!92422) b!111917))

(assert (= (and b!111917 res!92413) b!111918))

(assert (= (and b!111918 res!92415) b!111914))

(assert (= (and b!111914 res!92419) b!111924))

(assert (= (and b!111924 res!92414) b!111916))

(assert (= (and b!111916 res!92417) b!111919))

(assert (= (and b!111918 res!92411) b!111921))

(assert (= (and b!111921 res!92418) b!111912))

(assert (= (and b!111918 res!92421) b!111915))

(assert (= (and b!111918 (not res!92410)) b!111923))

(assert (= (and b!111923 res!92416) b!111925))

(assert (= start!22136 b!111913))

(declare-fun m!166929 () Bool)

(assert (=> b!111919 m!166929))

(declare-fun m!166931 () Bool)

(assert (=> b!111918 m!166931))

(declare-fun m!166933 () Bool)

(assert (=> b!111918 m!166933))

(declare-fun m!166935 () Bool)

(assert (=> b!111918 m!166935))

(declare-fun m!166937 () Bool)

(assert (=> b!111918 m!166937))

(declare-fun m!166939 () Bool)

(assert (=> b!111918 m!166939))

(declare-fun m!166941 () Bool)

(assert (=> b!111918 m!166941))

(declare-fun m!166943 () Bool)

(assert (=> b!111918 m!166943))

(declare-fun m!166945 () Bool)

(assert (=> b!111918 m!166945))

(declare-fun m!166947 () Bool)

(assert (=> b!111918 m!166947))

(declare-fun m!166949 () Bool)

(assert (=> b!111918 m!166949))

(declare-fun m!166951 () Bool)

(assert (=> b!111918 m!166951))

(declare-fun m!166953 () Bool)

(assert (=> b!111918 m!166953))

(declare-fun m!166955 () Bool)

(assert (=> b!111918 m!166955))

(declare-fun m!166957 () Bool)

(assert (=> b!111918 m!166957))

(declare-fun m!166959 () Bool)

(assert (=> b!111918 m!166959))

(declare-fun m!166961 () Bool)

(assert (=> b!111918 m!166961))

(declare-fun m!166963 () Bool)

(assert (=> b!111918 m!166963))

(declare-fun m!166965 () Bool)

(assert (=> b!111918 m!166965))

(declare-fun m!166967 () Bool)

(assert (=> b!111918 m!166967))

(declare-fun m!166969 () Bool)

(assert (=> b!111922 m!166969))

(declare-fun m!166971 () Bool)

(assert (=> b!111923 m!166971))

(declare-fun m!166973 () Bool)

(assert (=> b!111923 m!166973))

(declare-fun m!166975 () Bool)

(assert (=> b!111923 m!166975))

(declare-fun m!166977 () Bool)

(assert (=> b!111923 m!166977))

(declare-fun m!166979 () Bool)

(assert (=> b!111923 m!166979))

(declare-fun m!166981 () Bool)

(assert (=> b!111923 m!166981))

(declare-fun m!166983 () Bool)

(assert (=> b!111923 m!166983))

(declare-fun m!166985 () Bool)

(assert (=> b!111923 m!166985))

(declare-fun m!166987 () Bool)

(assert (=> b!111921 m!166987))

(declare-fun m!166989 () Bool)

(assert (=> b!111912 m!166989))

(declare-fun m!166991 () Bool)

(assert (=> start!22136 m!166991))

(declare-fun m!166993 () Bool)

(assert (=> b!111920 m!166993))

(declare-fun m!166995 () Bool)

(assert (=> b!111924 m!166995))

(assert (=> b!111914 m!166973))

(assert (=> b!111914 m!166979))

(declare-fun m!166997 () Bool)

(assert (=> b!111913 m!166997))

(declare-fun m!166999 () Bool)

(assert (=> b!111916 m!166999))

(assert (=> b!111916 m!166999))

(declare-fun m!167001 () Bool)

(assert (=> b!111916 m!167001))

(push 1)

(assert (not start!22136))

(assert (not b!111912))

(assert (not b!111916))

(assert (not b!111913))

(assert (not b!111918))

(assert (not b!111920))

(assert (not b!111921))

(assert (not b!111922))

(assert (not b!111914))

(assert (not b!111923))

(assert (not b!111919))

(assert (not b!111924))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!35676 () Bool)

(assert (=> d!35676 (= (invariant!0 (currentBit!5280 thiss!1305) (currentByte!5285 thiss!1305) (size!2316 (buf!2719 (_2!4894 lt!169956)))) (and (bvsge (currentBit!5280 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5280 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5285 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5285 thiss!1305) (size!2316 (buf!2719 (_2!4894 lt!169956)))) (and (= (currentBit!5280 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5285 thiss!1305) (size!2316 (buf!2719 (_2!4894 lt!169956))))))))))

(assert (=> b!111921 d!35676))

(declare-fun d!35678 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!35678 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2316 (buf!2719 thiss!1305))) ((_ sign_extend 32) (currentByte!5285 thiss!1305)) ((_ sign_extend 32) (currentBit!5280 thiss!1305)) lt!169966) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2316 (buf!2719 thiss!1305))) ((_ sign_extend 32) (currentByte!5285 thiss!1305)) ((_ sign_extend 32) (currentBit!5280 thiss!1305))) lt!169966))))

(declare-fun bs!8701 () Bool)

(assert (= bs!8701 d!35678))

(declare-fun m!167031 () Bool)

(assert (=> bs!8701 m!167031))

(assert (=> b!111922 d!35678))

(declare-fun d!35680 () Bool)

(assert (=> d!35680 (= (invariant!0 (currentBit!5280 thiss!1305) (currentByte!5285 thiss!1305) (size!2316 (buf!2719 (_2!4894 lt!169962)))) (and (bvsge (currentBit!5280 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5280 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5285 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5285 thiss!1305) (size!2316 (buf!2719 (_2!4894 lt!169962)))) (and (= (currentBit!5280 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5285 thiss!1305) (size!2316 (buf!2719 (_2!4894 lt!169962))))))))))

(assert (=> b!111912 d!35680))

(declare-fun d!35682 () Bool)

(declare-fun e!73463 () Bool)

(assert (=> d!35682 e!73463))

(declare-fun res!92443 () Bool)

(assert (=> d!35682 (=> (not res!92443) (not e!73463))))

(declare-fun lt!170045 () (_ BitVec 64))

(declare-fun lt!170050 () (_ BitVec 64))

(declare-fun lt!170049 () (_ BitVec 64))

(assert (=> d!35682 (= res!92443 (= lt!170045 (bvsub lt!170049 lt!170050)))))

(assert (=> d!35682 (or (= (bvand lt!170049 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!170050 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!170049 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!170049 lt!170050) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35682 (= lt!170050 (remainingBits!0 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!169962)))) ((_ sign_extend 32) (currentByte!5285 (_2!4894 lt!169962))) ((_ sign_extend 32) (currentBit!5280 (_2!4894 lt!169962)))))))

(declare-fun lt!170048 () (_ BitVec 64))

(declare-fun lt!170047 () (_ BitVec 64))

(assert (=> d!35682 (= lt!170049 (bvmul lt!170048 lt!170047))))

(assert (=> d!35682 (or (= lt!170048 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!170047 (bvsdiv (bvmul lt!170048 lt!170047) lt!170048)))))

(assert (=> d!35682 (= lt!170047 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35682 (= lt!170048 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!169962)))))))

(assert (=> d!35682 (= lt!170045 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5285 (_2!4894 lt!169962))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5280 (_2!4894 lt!169962)))))))

(assert (=> d!35682 (invariant!0 (currentBit!5280 (_2!4894 lt!169962)) (currentByte!5285 (_2!4894 lt!169962)) (size!2316 (buf!2719 (_2!4894 lt!169962))))))

(assert (=> d!35682 (= (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!169962))) (currentByte!5285 (_2!4894 lt!169962)) (currentBit!5280 (_2!4894 lt!169962))) lt!170045)))

(declare-fun b!111945 () Bool)

(declare-fun res!92444 () Bool)

(assert (=> b!111945 (=> (not res!92444) (not e!73463))))

(assert (=> b!111945 (= res!92444 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!170045))))

(declare-fun b!111946 () Bool)

(declare-fun lt!170046 () (_ BitVec 64))

(assert (=> b!111946 (= e!73463 (bvsle lt!170045 (bvmul lt!170046 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111946 (or (= lt!170046 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!170046 #b0000000000000000000000000000000000000000000000000000000000001000) lt!170046)))))

(assert (=> b!111946 (= lt!170046 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!169962)))))))

(assert (= (and d!35682 res!92443) b!111945))

(assert (= (and b!111945 res!92444) b!111946))

(declare-fun m!167033 () Bool)

(assert (=> d!35682 m!167033))

(declare-fun m!167035 () Bool)

(assert (=> d!35682 m!167035))

(assert (=> b!111923 d!35682))

(declare-fun d!35684 () Bool)

(declare-datatypes ((tuple2!9280 0))(
  ( (tuple2!9281 (_1!4900 (_ BitVec 64)) (_2!4900 BitStream!4106)) )
))
(declare-fun lt!170053 () tuple2!9280)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!4106 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9280)

(assert (=> d!35684 (= lt!170053 (readNLeastSignificantBitsLoop!0 lt!169982 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!169975))))

(assert (=> d!35684 (= (readNLeastSignificantBitsLoopPure!0 lt!169982 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!169975) (tuple2!9275 (_2!4900 lt!170053) (_1!4900 lt!170053)))))

(declare-fun bs!8702 () Bool)

(assert (= bs!8702 d!35684))

(declare-fun m!167037 () Bool)

(assert (=> bs!8702 m!167037))

(assert (=> b!111923 d!35684))

(declare-fun d!35686 () Bool)

(declare-fun e!73466 () Bool)

(assert (=> d!35686 e!73466))

(declare-fun res!92447 () Bool)

(assert (=> d!35686 (=> (not res!92447) (not e!73466))))

(declare-fun lt!170059 () (_ BitVec 64))

(declare-fun lt!170058 () BitStream!4106)

(assert (=> d!35686 (= res!92447 (= (bvadd lt!170059 (bvsub lt!169958 lt!169973)) (bitIndex!0 (size!2316 (buf!2719 lt!170058)) (currentByte!5285 lt!170058) (currentBit!5280 lt!170058))))))

(assert (=> d!35686 (or (not (= (bvand lt!170059 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!169958 lt!169973) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!170059 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!170059 (bvsub lt!169958 lt!169973)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35686 (= lt!170059 (bitIndex!0 (size!2316 (buf!2719 (_2!4896 lt!169961))) (currentByte!5285 (_2!4896 lt!169961)) (currentBit!5280 (_2!4896 lt!169961))))))

(declare-fun moveBitIndex!0 (BitStream!4106 (_ BitVec 64)) tuple2!9268)

(assert (=> d!35686 (= lt!170058 (_2!4894 (moveBitIndex!0 (_2!4896 lt!169961) (bvsub lt!169958 lt!169973))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!4106 (_ BitVec 64)) Bool)

(assert (=> d!35686 (moveBitIndexPrecond!0 (_2!4896 lt!169961) (bvsub lt!169958 lt!169973))))

(assert (=> d!35686 (= (withMovedBitIndex!0 (_2!4896 lt!169961) (bvsub lt!169958 lt!169973)) lt!170058)))

(declare-fun b!111949 () Bool)

(assert (=> b!111949 (= e!73466 (= (size!2316 (buf!2719 (_2!4896 lt!169961))) (size!2316 (buf!2719 lt!170058))))))

(assert (= (and d!35686 res!92447) b!111949))

(declare-fun m!167039 () Bool)

(assert (=> d!35686 m!167039))

(declare-fun m!167041 () Bool)

(assert (=> d!35686 m!167041))

(declare-fun m!167043 () Bool)

(assert (=> d!35686 m!167043))

(declare-fun m!167045 () Bool)

(assert (=> d!35686 m!167045))

(assert (=> b!111923 d!35686))

(declare-fun d!35688 () Bool)

(declare-fun e!73467 () Bool)

(assert (=> d!35688 e!73467))

(declare-fun res!92448 () Bool)

(assert (=> d!35688 (=> (not res!92448) (not e!73467))))

(declare-fun lt!170060 () (_ BitVec 64))

(declare-fun lt!170065 () (_ BitVec 64))

(declare-fun lt!170064 () (_ BitVec 64))

(assert (=> d!35688 (= res!92448 (= lt!170060 (bvsub lt!170064 lt!170065)))))

(assert (=> d!35688 (or (= (bvand lt!170064 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!170065 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!170064 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!170064 lt!170065) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35688 (= lt!170065 (remainingBits!0 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!169956)))) ((_ sign_extend 32) (currentByte!5285 (_2!4894 lt!169956))) ((_ sign_extend 32) (currentBit!5280 (_2!4894 lt!169956)))))))

(declare-fun lt!170063 () (_ BitVec 64))

(declare-fun lt!170062 () (_ BitVec 64))

(assert (=> d!35688 (= lt!170064 (bvmul lt!170063 lt!170062))))

(assert (=> d!35688 (or (= lt!170063 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!170062 (bvsdiv (bvmul lt!170063 lt!170062) lt!170063)))))

(assert (=> d!35688 (= lt!170062 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35688 (= lt!170063 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!169956)))))))

(assert (=> d!35688 (= lt!170060 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5285 (_2!4894 lt!169956))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5280 (_2!4894 lt!169956)))))))

(assert (=> d!35688 (invariant!0 (currentBit!5280 (_2!4894 lt!169956)) (currentByte!5285 (_2!4894 lt!169956)) (size!2316 (buf!2719 (_2!4894 lt!169956))))))

(assert (=> d!35688 (= (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!169956))) (currentByte!5285 (_2!4894 lt!169956)) (currentBit!5280 (_2!4894 lt!169956))) lt!170060)))

(declare-fun b!111950 () Bool)

(declare-fun res!92449 () Bool)

(assert (=> b!111950 (=> (not res!92449) (not e!73467))))

(assert (=> b!111950 (= res!92449 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!170060))))

(declare-fun b!111951 () Bool)

(declare-fun lt!170061 () (_ BitVec 64))

(assert (=> b!111951 (= e!73467 (bvsle lt!170060 (bvmul lt!170061 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111951 (or (= lt!170061 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!170061 #b0000000000000000000000000000000000000000000000000000000000001000) lt!170061)))))

(assert (=> b!111951 (= lt!170061 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!169956)))))))

(assert (= (and d!35688 res!92448) b!111950))

(assert (= (and b!111950 res!92449) b!111951))

(declare-fun m!167047 () Bool)

(assert (=> d!35688 m!167047))

(declare-fun m!167049 () Bool)

(assert (=> d!35688 m!167049))

(assert (=> b!111923 d!35688))

(declare-fun d!35690 () Bool)

(declare-fun lt!170081 () tuple2!9274)

(declare-fun lt!170083 () tuple2!9274)

(assert (=> d!35690 (and (= (_2!4897 lt!170081) (_2!4897 lt!170083)) (= (_1!4897 lt!170081) (_1!4897 lt!170083)))))

(declare-fun lt!170080 () Bool)

(declare-fun lt!170079 () BitStream!4106)

(declare-fun lt!170082 () Unit!6851)

(declare-fun lt!170078 () (_ BitVec 64))

(declare-fun choose!45 (BitStream!4106 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!9274 tuple2!9274 BitStream!4106 (_ BitVec 64) Bool BitStream!4106 (_ BitVec 64) tuple2!9274 tuple2!9274 BitStream!4106 (_ BitVec 64)) Unit!6851)

(assert (=> d!35690 (= lt!170082 (choose!45 (_1!4896 lt!169961) nBits!396 i!615 lt!169967 lt!170081 (tuple2!9275 (_1!4897 lt!170081) (_2!4897 lt!170081)) (_1!4897 lt!170081) (_2!4897 lt!170081) lt!170080 lt!170079 lt!170078 lt!170083 (tuple2!9275 (_1!4897 lt!170083) (_2!4897 lt!170083)) (_1!4897 lt!170083) (_2!4897 lt!170083)))))

(assert (=> d!35690 (= lt!170083 (readNLeastSignificantBitsLoopPure!0 lt!170079 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!170078))))

(assert (=> d!35690 (= lt!170078 (bvor lt!169967 (ite lt!170080 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35690 (= lt!170079 (withMovedBitIndex!0 (_1!4896 lt!169961) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!35690 (= lt!170080 (_2!4895 (readBitPure!0 (_1!4896 lt!169961))))))

(assert (=> d!35690 (= lt!170081 (readNLeastSignificantBitsLoopPure!0 (_1!4896 lt!169961) nBits!396 i!615 lt!169967))))

(assert (=> d!35690 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4896 lt!169961) nBits!396 i!615 lt!169967) lt!170082)))

(declare-fun bs!8704 () Bool)

(assert (= bs!8704 d!35690))

(assert (=> bs!8704 m!166941))

(declare-fun m!167051 () Bool)

(assert (=> bs!8704 m!167051))

(declare-fun m!167053 () Bool)

(assert (=> bs!8704 m!167053))

(assert (=> bs!8704 m!166935))

(assert (=> bs!8704 m!166983))

(assert (=> b!111923 d!35690))

(declare-fun d!35692 () Bool)

(declare-fun e!73468 () Bool)

(assert (=> d!35692 e!73468))

(declare-fun res!92450 () Bool)

(assert (=> d!35692 (=> (not res!92450) (not e!73468))))

(declare-fun lt!170084 () BitStream!4106)

(declare-fun lt!170085 () (_ BitVec 64))

(assert (=> d!35692 (= res!92450 (= (bvadd lt!170085 (bvsub lt!169968 lt!169973)) (bitIndex!0 (size!2316 (buf!2719 lt!170084)) (currentByte!5285 lt!170084) (currentBit!5280 lt!170084))))))

(assert (=> d!35692 (or (not (= (bvand lt!170085 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!169968 lt!169973) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!170085 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!170085 (bvsub lt!169968 lt!169973)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35692 (= lt!170085 (bitIndex!0 (size!2316 (buf!2719 (_2!4896 lt!169963))) (currentByte!5285 (_2!4896 lt!169963)) (currentBit!5280 (_2!4896 lt!169963))))))

(assert (=> d!35692 (= lt!170084 (_2!4894 (moveBitIndex!0 (_2!4896 lt!169963) (bvsub lt!169968 lt!169973))))))

(assert (=> d!35692 (moveBitIndexPrecond!0 (_2!4896 lt!169963) (bvsub lt!169968 lt!169973))))

(assert (=> d!35692 (= (withMovedBitIndex!0 (_2!4896 lt!169963) (bvsub lt!169968 lt!169973)) lt!170084)))

(declare-fun b!111952 () Bool)

(assert (=> b!111952 (= e!73468 (= (size!2316 (buf!2719 (_2!4896 lt!169963))) (size!2316 (buf!2719 lt!170084))))))

(assert (= (and d!35692 res!92450) b!111952))

(declare-fun m!167055 () Bool)

(assert (=> d!35692 m!167055))

(declare-fun m!167057 () Bool)

(assert (=> d!35692 m!167057))

(declare-fun m!167059 () Bool)

(assert (=> d!35692 m!167059))

(declare-fun m!167061 () Bool)

(assert (=> d!35692 m!167061))

(assert (=> b!111923 d!35692))

(declare-fun d!35694 () Bool)

(declare-fun e!73469 () Bool)

(assert (=> d!35694 e!73469))

(declare-fun res!92451 () Bool)

(assert (=> d!35694 (=> (not res!92451) (not e!73469))))

(declare-fun lt!170087 () (_ BitVec 64))

(declare-fun lt!170086 () BitStream!4106)

(assert (=> d!35694 (= res!92451 (= (bvadd lt!170087 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2316 (buf!2719 lt!170086)) (currentByte!5285 lt!170086) (currentBit!5280 lt!170086))))))

(assert (=> d!35694 (or (not (= (bvand lt!170087 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!170087 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!170087 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35694 (= lt!170087 (bitIndex!0 (size!2316 (buf!2719 (_1!4896 lt!169961))) (currentByte!5285 (_1!4896 lt!169961)) (currentBit!5280 (_1!4896 lt!169961))))))

(assert (=> d!35694 (= lt!170086 (_2!4894 (moveBitIndex!0 (_1!4896 lt!169961) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!35694 (moveBitIndexPrecond!0 (_1!4896 lt!169961) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!35694 (= (withMovedBitIndex!0 (_1!4896 lt!169961) #b0000000000000000000000000000000000000000000000000000000000000001) lt!170086)))

(declare-fun b!111953 () Bool)

(assert (=> b!111953 (= e!73469 (= (size!2316 (buf!2719 (_1!4896 lt!169961))) (size!2316 (buf!2719 lt!170086))))))

(assert (= (and d!35694 res!92451) b!111953))

(declare-fun m!167063 () Bool)

(assert (=> d!35694 m!167063))

(declare-fun m!167065 () Bool)

(assert (=> d!35694 m!167065))

(declare-fun m!167067 () Bool)

(assert (=> d!35694 m!167067))

(declare-fun m!167069 () Bool)

(assert (=> d!35694 m!167069))

(assert (=> b!111923 d!35694))

(declare-fun d!35696 () Bool)

(declare-fun e!73470 () Bool)

(assert (=> d!35696 e!73470))

(declare-fun res!92452 () Bool)

(assert (=> d!35696 (=> (not res!92452) (not e!73470))))

(declare-fun lt!170092 () (_ BitVec 64))

(declare-fun lt!170093 () (_ BitVec 64))

(declare-fun lt!170088 () (_ BitVec 64))

(assert (=> d!35696 (= res!92452 (= lt!170088 (bvsub lt!170092 lt!170093)))))

(assert (=> d!35696 (or (= (bvand lt!170092 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!170093 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!170092 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!170092 lt!170093) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35696 (= lt!170093 (remainingBits!0 ((_ sign_extend 32) (size!2316 (buf!2719 thiss!1305))) ((_ sign_extend 32) (currentByte!5285 thiss!1305)) ((_ sign_extend 32) (currentBit!5280 thiss!1305))))))

(declare-fun lt!170091 () (_ BitVec 64))

(declare-fun lt!170090 () (_ BitVec 64))

(assert (=> d!35696 (= lt!170092 (bvmul lt!170091 lt!170090))))

(assert (=> d!35696 (or (= lt!170091 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!170090 (bvsdiv (bvmul lt!170091 lt!170090) lt!170091)))))

(assert (=> d!35696 (= lt!170090 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35696 (= lt!170091 ((_ sign_extend 32) (size!2316 (buf!2719 thiss!1305))))))

(assert (=> d!35696 (= lt!170088 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5285 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5280 thiss!1305))))))

(assert (=> d!35696 (invariant!0 (currentBit!5280 thiss!1305) (currentByte!5285 thiss!1305) (size!2316 (buf!2719 thiss!1305)))))

(assert (=> d!35696 (= (bitIndex!0 (size!2316 (buf!2719 thiss!1305)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305)) lt!170088)))

(declare-fun b!111954 () Bool)

(declare-fun res!92453 () Bool)

(assert (=> b!111954 (=> (not res!92453) (not e!73470))))

(assert (=> b!111954 (= res!92453 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!170088))))

(declare-fun b!111955 () Bool)

(declare-fun lt!170089 () (_ BitVec 64))

(assert (=> b!111955 (= e!73470 (bvsle lt!170088 (bvmul lt!170089 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111955 (or (= lt!170089 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!170089 #b0000000000000000000000000000000000000000000000000000000000001000) lt!170089)))))

(assert (=> b!111955 (= lt!170089 ((_ sign_extend 32) (size!2316 (buf!2719 thiss!1305))))))

(assert (= (and d!35696 res!92452) b!111954))

(assert (= (and b!111954 res!92453) b!111955))

(assert (=> d!35696 m!167031))

(declare-fun m!167071 () Bool)

(assert (=> d!35696 m!167071))

(assert (=> b!111923 d!35696))

(declare-fun d!35698 () Bool)

(assert (=> d!35698 (= (array_inv!2118 (buf!2719 thiss!1305)) (bvsge (size!2316 (buf!2719 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!111913 d!35698))

(declare-fun d!35700 () Bool)

(declare-fun res!92460 () Bool)

(declare-fun e!73475 () Bool)

(assert (=> d!35700 (=> (not res!92460) (not e!73475))))

(assert (=> d!35700 (= res!92460 (= (size!2316 (buf!2719 thiss!1305)) (size!2316 (buf!2719 (_2!4894 lt!169956)))))))

(assert (=> d!35700 (= (isPrefixOf!0 thiss!1305 (_2!4894 lt!169956)) e!73475)))

(declare-fun b!111962 () Bool)

(declare-fun res!92462 () Bool)

(assert (=> b!111962 (=> (not res!92462) (not e!73475))))

(assert (=> b!111962 (= res!92462 (bvsle (bitIndex!0 (size!2316 (buf!2719 thiss!1305)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305)) (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!169956))) (currentByte!5285 (_2!4894 lt!169956)) (currentBit!5280 (_2!4894 lt!169956)))))))

(declare-fun b!111963 () Bool)

(declare-fun e!73476 () Bool)

(assert (=> b!111963 (= e!73475 e!73476)))

(declare-fun res!92461 () Bool)

(assert (=> b!111963 (=> res!92461 e!73476)))

(assert (=> b!111963 (= res!92461 (= (size!2316 (buf!2719 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!111964 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5094 array!5094 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!111964 (= e!73476 (arrayBitRangesEq!0 (buf!2719 thiss!1305) (buf!2719 (_2!4894 lt!169956)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2316 (buf!2719 thiss!1305)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305))))))

(assert (= (and d!35700 res!92460) b!111962))

(assert (= (and b!111962 res!92462) b!111963))

(assert (= (and b!111963 (not res!92461)) b!111964))

(assert (=> b!111962 m!166979))

(assert (=> b!111962 m!166973))

(assert (=> b!111964 m!166979))

(assert (=> b!111964 m!166979))

(declare-fun m!167073 () Bool)

(assert (=> b!111964 m!167073))

(assert (=> b!111924 d!35700))

(assert (=> b!111914 d!35688))

(assert (=> b!111914 d!35696))

(declare-fun d!35702 () Bool)

(declare-datatypes ((tuple2!9282 0))(
  ( (tuple2!9283 (_1!4901 Bool) (_2!4901 BitStream!4106)) )
))
(declare-fun lt!170096 () tuple2!9282)

(declare-fun readBit!0 (BitStream!4106) tuple2!9282)

(assert (=> d!35702 (= lt!170096 (readBit!0 (readerFrom!0 (_2!4894 lt!169956) (currentBit!5280 thiss!1305) (currentByte!5285 thiss!1305))))))

(assert (=> d!35702 (= (readBitPure!0 (readerFrom!0 (_2!4894 lt!169956) (currentBit!5280 thiss!1305) (currentByte!5285 thiss!1305))) (tuple2!9271 (_2!4901 lt!170096) (_1!4901 lt!170096)))))

(declare-fun bs!8705 () Bool)

(assert (= bs!8705 d!35702))

(assert (=> bs!8705 m!166999))

(declare-fun m!167075 () Bool)

(assert (=> bs!8705 m!167075))

(assert (=> b!111916 d!35702))

(declare-fun d!35704 () Bool)

(declare-fun e!73479 () Bool)

(assert (=> d!35704 e!73479))

(declare-fun res!92466 () Bool)

(assert (=> d!35704 (=> (not res!92466) (not e!73479))))

(assert (=> d!35704 (= res!92466 (invariant!0 (currentBit!5280 (_2!4894 lt!169956)) (currentByte!5285 (_2!4894 lt!169956)) (size!2316 (buf!2719 (_2!4894 lt!169956)))))))

(assert (=> d!35704 (= (readerFrom!0 (_2!4894 lt!169956) (currentBit!5280 thiss!1305) (currentByte!5285 thiss!1305)) (BitStream!4107 (buf!2719 (_2!4894 lt!169956)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305)))))

(declare-fun b!111967 () Bool)

(assert (=> b!111967 (= e!73479 (invariant!0 (currentBit!5280 thiss!1305) (currentByte!5285 thiss!1305) (size!2316 (buf!2719 (_2!4894 lt!169956)))))))

(assert (= (and d!35704 res!92466) b!111967))

(assert (=> d!35704 m!167049))

(assert (=> b!111967 m!166987))

(assert (=> b!111916 d!35704))

(declare-fun d!35706 () Bool)

(assert (=> d!35706 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5280 thiss!1305) (currentByte!5285 thiss!1305) (size!2316 (buf!2719 thiss!1305))))))

(declare-fun bs!8706 () Bool)

(assert (= bs!8706 d!35706))

(assert (=> bs!8706 m!167071))

(assert (=> start!22136 d!35706))

(declare-fun d!35708 () Bool)

(assert (=> d!35708 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!111918 d!35708))

(declare-fun d!35710 () Bool)

(assert (=> d!35710 (validate_offset_bits!1 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!169962)))) ((_ sign_extend 32) (currentByte!5285 thiss!1305)) ((_ sign_extend 32) (currentBit!5280 thiss!1305)) lt!169966)))

(declare-fun lt!170099 () Unit!6851)

(declare-fun choose!9 (BitStream!4106 array!5094 (_ BitVec 64) BitStream!4106) Unit!6851)

(assert (=> d!35710 (= lt!170099 (choose!9 thiss!1305 (buf!2719 (_2!4894 lt!169962)) lt!169966 (BitStream!4107 (buf!2719 (_2!4894 lt!169962)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305))))))

(assert (=> d!35710 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2719 (_2!4894 lt!169962)) lt!169966) lt!170099)))

(declare-fun bs!8707 () Bool)

(assert (= bs!8707 d!35710))

(assert (=> bs!8707 m!166959))

(declare-fun m!167077 () Bool)

(assert (=> bs!8707 m!167077))

(assert (=> b!111918 d!35710))

(declare-fun d!35712 () Bool)

(declare-fun lt!170100 () tuple2!9282)

(assert (=> d!35712 (= lt!170100 (readBit!0 (_1!4896 lt!169961)))))

(assert (=> d!35712 (= (readBitPure!0 (_1!4896 lt!169961)) (tuple2!9271 (_2!4901 lt!170100) (_1!4901 lt!170100)))))

(declare-fun bs!8708 () Bool)

(assert (= bs!8708 d!35712))

(declare-fun m!167079 () Bool)

(assert (=> bs!8708 m!167079))

(assert (=> b!111918 d!35712))

(declare-fun d!35714 () Bool)

(declare-fun e!73480 () Bool)

(assert (=> d!35714 e!73480))

(declare-fun res!92467 () Bool)

(assert (=> d!35714 (=> (not res!92467) (not e!73480))))

(declare-fun lt!170101 () (_ BitVec 64))

(declare-fun lt!170105 () (_ BitVec 64))

(declare-fun lt!170106 () (_ BitVec 64))

(assert (=> d!35714 (= res!92467 (= lt!170101 (bvsub lt!170105 lt!170106)))))

(assert (=> d!35714 (or (= (bvand lt!170105 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!170106 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!170105 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!170105 lt!170106) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35714 (= lt!170106 (remainingBits!0 ((_ sign_extend 32) (size!2316 (buf!2719 (_1!4895 lt!169969)))) ((_ sign_extend 32) (currentByte!5285 (_1!4895 lt!169969))) ((_ sign_extend 32) (currentBit!5280 (_1!4895 lt!169969)))))))

(declare-fun lt!170104 () (_ BitVec 64))

(declare-fun lt!170103 () (_ BitVec 64))

(assert (=> d!35714 (= lt!170105 (bvmul lt!170104 lt!170103))))

(assert (=> d!35714 (or (= lt!170104 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!170103 (bvsdiv (bvmul lt!170104 lt!170103) lt!170104)))))

(assert (=> d!35714 (= lt!170103 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35714 (= lt!170104 ((_ sign_extend 32) (size!2316 (buf!2719 (_1!4895 lt!169969)))))))

(assert (=> d!35714 (= lt!170101 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5285 (_1!4895 lt!169969))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5280 (_1!4895 lt!169969)))))))

(assert (=> d!35714 (invariant!0 (currentBit!5280 (_1!4895 lt!169969)) (currentByte!5285 (_1!4895 lt!169969)) (size!2316 (buf!2719 (_1!4895 lt!169969))))))

(assert (=> d!35714 (= (bitIndex!0 (size!2316 (buf!2719 (_1!4895 lt!169969))) (currentByte!5285 (_1!4895 lt!169969)) (currentBit!5280 (_1!4895 lt!169969))) lt!170101)))

(declare-fun b!111968 () Bool)

(declare-fun res!92468 () Bool)

(assert (=> b!111968 (=> (not res!92468) (not e!73480))))

(assert (=> b!111968 (= res!92468 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!170101))))

(declare-fun b!111969 () Bool)

(declare-fun lt!170102 () (_ BitVec 64))

(assert (=> b!111969 (= e!73480 (bvsle lt!170101 (bvmul lt!170102 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111969 (or (= lt!170102 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!170102 #b0000000000000000000000000000000000000000000000000000000000001000) lt!170102)))))

(assert (=> b!111969 (= lt!170102 ((_ sign_extend 32) (size!2316 (buf!2719 (_1!4895 lt!169969)))))))

(assert (= (and d!35714 res!92467) b!111968))

(assert (= (and b!111968 res!92468) b!111969))

(declare-fun m!167081 () Bool)

(assert (=> d!35714 m!167081))

(declare-fun m!167083 () Bool)

(assert (=> d!35714 m!167083))

(assert (=> b!111918 d!35714))

(declare-fun d!35716 () Bool)

(declare-fun lt!170107 () tuple2!9280)

(assert (=> d!35716 (= lt!170107 (readNLeastSignificantBitsLoop!0 (_1!4896 lt!169963) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!169975))))

(assert (=> d!35716 (= (readNLeastSignificantBitsLoopPure!0 (_1!4896 lt!169963) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!169975) (tuple2!9275 (_2!4900 lt!170107) (_1!4900 lt!170107)))))

(declare-fun bs!8709 () Bool)

(assert (= bs!8709 d!35716))

(declare-fun m!167085 () Bool)

(assert (=> bs!8709 m!167085))

(assert (=> b!111918 d!35716))

(declare-fun d!35718 () Bool)

(declare-fun e!73481 () Bool)

(assert (=> d!35718 e!73481))

(declare-fun res!92469 () Bool)

(assert (=> d!35718 (=> (not res!92469) (not e!73481))))

(declare-fun lt!170113 () (_ BitVec 64))

(declare-fun lt!170108 () (_ BitVec 64))

(declare-fun lt!170112 () (_ BitVec 64))

(assert (=> d!35718 (= res!92469 (= lt!170108 (bvsub lt!170112 lt!170113)))))

(assert (=> d!35718 (or (= (bvand lt!170112 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!170113 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!170112 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!170112 lt!170113) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35718 (= lt!170113 (remainingBits!0 ((_ sign_extend 32) (size!2316 (buf!2719 (_1!4895 lt!169981)))) ((_ sign_extend 32) (currentByte!5285 (_1!4895 lt!169981))) ((_ sign_extend 32) (currentBit!5280 (_1!4895 lt!169981)))))))

(declare-fun lt!170111 () (_ BitVec 64))

(declare-fun lt!170110 () (_ BitVec 64))

(assert (=> d!35718 (= lt!170112 (bvmul lt!170111 lt!170110))))

(assert (=> d!35718 (or (= lt!170111 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!170110 (bvsdiv (bvmul lt!170111 lt!170110) lt!170111)))))

(assert (=> d!35718 (= lt!170110 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35718 (= lt!170111 ((_ sign_extend 32) (size!2316 (buf!2719 (_1!4895 lt!169981)))))))

(assert (=> d!35718 (= lt!170108 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5285 (_1!4895 lt!169981))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5280 (_1!4895 lt!169981)))))))

(assert (=> d!35718 (invariant!0 (currentBit!5280 (_1!4895 lt!169981)) (currentByte!5285 (_1!4895 lt!169981)) (size!2316 (buf!2719 (_1!4895 lt!169981))))))

(assert (=> d!35718 (= (bitIndex!0 (size!2316 (buf!2719 (_1!4895 lt!169981))) (currentByte!5285 (_1!4895 lt!169981)) (currentBit!5280 (_1!4895 lt!169981))) lt!170108)))

(declare-fun b!111970 () Bool)

(declare-fun res!92470 () Bool)

(assert (=> b!111970 (=> (not res!92470) (not e!73481))))

(assert (=> b!111970 (= res!92470 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!170108))))

(declare-fun b!111971 () Bool)

(declare-fun lt!170109 () (_ BitVec 64))

(assert (=> b!111971 (= e!73481 (bvsle lt!170108 (bvmul lt!170109 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111971 (or (= lt!170109 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!170109 #b0000000000000000000000000000000000000000000000000000000000001000) lt!170109)))))

(assert (=> b!111971 (= lt!170109 ((_ sign_extend 32) (size!2316 (buf!2719 (_1!4895 lt!169981)))))))

(assert (= (and d!35718 res!92469) b!111970))

(assert (= (and b!111970 res!92470) b!111971))

(declare-fun m!167087 () Bool)

(assert (=> d!35718 m!167087))

(declare-fun m!167089 () Bool)

(assert (=> d!35718 m!167089))

(assert (=> b!111918 d!35718))

(declare-fun d!35720 () Bool)

(declare-fun lt!170114 () tuple2!9282)

(assert (=> d!35720 (= lt!170114 (readBit!0 (BitStream!4107 (buf!2719 (_2!4894 lt!169962)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305))))))

(assert (=> d!35720 (= (readBitPure!0 (BitStream!4107 (buf!2719 (_2!4894 lt!169962)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305))) (tuple2!9271 (_2!4901 lt!170114) (_1!4901 lt!170114)))))

(declare-fun bs!8710 () Bool)

(assert (= bs!8710 d!35720))

(declare-fun m!167091 () Bool)

(assert (=> bs!8710 m!167091))

(assert (=> b!111918 d!35720))

(declare-fun b!111983 () Bool)

(declare-fun res!92478 () Bool)

(declare-fun e!73486 () Bool)

(assert (=> b!111983 (=> (not res!92478) (not e!73486))))

(declare-fun lt!170172 () tuple2!9272)

(assert (=> b!111983 (= res!92478 (isPrefixOf!0 (_1!4896 lt!170172) thiss!1305))))

(declare-fun b!111984 () Bool)

(declare-fun e!73487 () Unit!6851)

(declare-fun Unit!6861 () Unit!6851)

(assert (=> b!111984 (= e!73487 Unit!6861)))

(declare-fun b!111985 () Bool)

(declare-fun lt!170158 () (_ BitVec 64))

(declare-fun lt!170155 () (_ BitVec 64))

(assert (=> b!111985 (= e!73486 (= (_1!4896 lt!170172) (withMovedBitIndex!0 (_2!4896 lt!170172) (bvsub lt!170155 lt!170158))))))

(assert (=> b!111985 (or (= (bvand lt!170155 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!170158 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!170155 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!170155 lt!170158) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111985 (= lt!170158 (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!169962))) (currentByte!5285 (_2!4894 lt!169962)) (currentBit!5280 (_2!4894 lt!169962))))))

(assert (=> b!111985 (= lt!170155 (bitIndex!0 (size!2316 (buf!2719 thiss!1305)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305)))))

(declare-fun b!111986 () Bool)

(declare-fun lt!170157 () Unit!6851)

(assert (=> b!111986 (= e!73487 lt!170157)))

(declare-fun lt!170166 () (_ BitVec 64))

(assert (=> b!111986 (= lt!170166 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!170159 () (_ BitVec 64))

(assert (=> b!111986 (= lt!170159 (bitIndex!0 (size!2316 (buf!2719 thiss!1305)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5094 array!5094 (_ BitVec 64) (_ BitVec 64)) Unit!6851)

(assert (=> b!111986 (= lt!170157 (arrayBitRangesEqSymmetric!0 (buf!2719 thiss!1305) (buf!2719 (_2!4894 lt!169962)) lt!170166 lt!170159))))

(assert (=> b!111986 (arrayBitRangesEq!0 (buf!2719 (_2!4894 lt!169962)) (buf!2719 thiss!1305) lt!170166 lt!170159)))

(declare-fun b!111982 () Bool)

(declare-fun res!92479 () Bool)

(assert (=> b!111982 (=> (not res!92479) (not e!73486))))

(assert (=> b!111982 (= res!92479 (isPrefixOf!0 (_2!4896 lt!170172) (_2!4894 lt!169962)))))

(declare-fun d!35722 () Bool)

(assert (=> d!35722 e!73486))

(declare-fun res!92477 () Bool)

(assert (=> d!35722 (=> (not res!92477) (not e!73486))))

(assert (=> d!35722 (= res!92477 (isPrefixOf!0 (_1!4896 lt!170172) (_2!4896 lt!170172)))))

(declare-fun lt!170163 () BitStream!4106)

(assert (=> d!35722 (= lt!170172 (tuple2!9273 lt!170163 (_2!4894 lt!169962)))))

(declare-fun lt!170173 () Unit!6851)

(declare-fun lt!170174 () Unit!6851)

(assert (=> d!35722 (= lt!170173 lt!170174)))

(assert (=> d!35722 (isPrefixOf!0 lt!170163 (_2!4894 lt!169962))))

(assert (=> d!35722 (= lt!170174 (lemmaIsPrefixTransitive!0 lt!170163 (_2!4894 lt!169962) (_2!4894 lt!169962)))))

(declare-fun lt!170169 () Unit!6851)

(declare-fun lt!170161 () Unit!6851)

(assert (=> d!35722 (= lt!170169 lt!170161)))

(assert (=> d!35722 (isPrefixOf!0 lt!170163 (_2!4894 lt!169962))))

(assert (=> d!35722 (= lt!170161 (lemmaIsPrefixTransitive!0 lt!170163 thiss!1305 (_2!4894 lt!169962)))))

(declare-fun lt!170165 () Unit!6851)

(assert (=> d!35722 (= lt!170165 e!73487)))

(declare-fun c!6806 () Bool)

(assert (=> d!35722 (= c!6806 (not (= (size!2316 (buf!2719 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!170164 () Unit!6851)

(declare-fun lt!170160 () Unit!6851)

(assert (=> d!35722 (= lt!170164 lt!170160)))

(assert (=> d!35722 (isPrefixOf!0 (_2!4894 lt!169962) (_2!4894 lt!169962))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4106) Unit!6851)

(assert (=> d!35722 (= lt!170160 (lemmaIsPrefixRefl!0 (_2!4894 lt!169962)))))

(declare-fun lt!170162 () Unit!6851)

(declare-fun lt!170171 () Unit!6851)

(assert (=> d!35722 (= lt!170162 lt!170171)))

(assert (=> d!35722 (= lt!170171 (lemmaIsPrefixRefl!0 (_2!4894 lt!169962)))))

(declare-fun lt!170168 () Unit!6851)

(declare-fun lt!170167 () Unit!6851)

(assert (=> d!35722 (= lt!170168 lt!170167)))

(assert (=> d!35722 (isPrefixOf!0 lt!170163 lt!170163)))

(assert (=> d!35722 (= lt!170167 (lemmaIsPrefixRefl!0 lt!170163))))

(declare-fun lt!170156 () Unit!6851)

(declare-fun lt!170170 () Unit!6851)

(assert (=> d!35722 (= lt!170156 lt!170170)))

(assert (=> d!35722 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!35722 (= lt!170170 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!35722 (= lt!170163 (BitStream!4107 (buf!2719 (_2!4894 lt!169962)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305)))))

(assert (=> d!35722 (isPrefixOf!0 thiss!1305 (_2!4894 lt!169962))))

(assert (=> d!35722 (= (reader!0 thiss!1305 (_2!4894 lt!169962)) lt!170172)))

(assert (= (and d!35722 c!6806) b!111986))

(assert (= (and d!35722 (not c!6806)) b!111984))

(assert (= (and d!35722 res!92477) b!111983))

(assert (= (and b!111983 res!92478) b!111982))

(assert (= (and b!111982 res!92479) b!111985))

(declare-fun m!167093 () Bool)

(assert (=> d!35722 m!167093))

(assert (=> d!35722 m!166963))

(declare-fun m!167095 () Bool)

(assert (=> d!35722 m!167095))

(declare-fun m!167097 () Bool)

(assert (=> d!35722 m!167097))

(declare-fun m!167099 () Bool)

(assert (=> d!35722 m!167099))

(declare-fun m!167101 () Bool)

(assert (=> d!35722 m!167101))

(declare-fun m!167103 () Bool)

(assert (=> d!35722 m!167103))

(declare-fun m!167105 () Bool)

(assert (=> d!35722 m!167105))

(declare-fun m!167107 () Bool)

(assert (=> d!35722 m!167107))

(declare-fun m!167109 () Bool)

(assert (=> d!35722 m!167109))

(declare-fun m!167111 () Bool)

(assert (=> d!35722 m!167111))

(assert (=> b!111986 m!166979))

(declare-fun m!167113 () Bool)

(assert (=> b!111986 m!167113))

(declare-fun m!167115 () Bool)

(assert (=> b!111986 m!167115))

(declare-fun m!167117 () Bool)

(assert (=> b!111985 m!167117))

(assert (=> b!111985 m!166971))

(assert (=> b!111985 m!166979))

(declare-fun m!167119 () Bool)

(assert (=> b!111983 m!167119))

(declare-fun m!167121 () Bool)

(assert (=> b!111982 m!167121))

(assert (=> b!111918 d!35722))

(declare-fun d!35724 () Bool)

(assert (=> d!35724 (isPrefixOf!0 thiss!1305 (_2!4894 lt!169962))))

(declare-fun lt!170187 () Unit!6851)

(declare-fun choose!30 (BitStream!4106 BitStream!4106 BitStream!4106) Unit!6851)

(assert (=> d!35724 (= lt!170187 (choose!30 thiss!1305 (_2!4894 lt!169956) (_2!4894 lt!169962)))))

(assert (=> d!35724 (isPrefixOf!0 thiss!1305 (_2!4894 lt!169956))))

(assert (=> d!35724 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4894 lt!169956) (_2!4894 lt!169962)) lt!170187)))

(declare-fun bs!8711 () Bool)

(assert (= bs!8711 d!35724))

(assert (=> bs!8711 m!166963))

(declare-fun m!167123 () Bool)

(assert (=> bs!8711 m!167123))

(assert (=> bs!8711 m!166995))

(assert (=> b!111918 d!35724))

(declare-fun d!35726 () Bool)

(declare-fun lt!170188 () tuple2!9282)

(assert (=> d!35726 (= lt!170188 (readBit!0 lt!169971))))

(assert (=> d!35726 (= (readBitPure!0 lt!169971) (tuple2!9271 (_2!4901 lt!170188) (_1!4901 lt!170188)))))

(declare-fun bs!8712 () Bool)

(assert (= bs!8712 d!35726))

(declare-fun m!167125 () Bool)

(assert (=> bs!8712 m!167125))

(assert (=> b!111918 d!35726))

(declare-fun d!35728 () Bool)

(declare-fun lt!170189 () tuple2!9280)

(assert (=> d!35728 (= lt!170189 (readNLeastSignificantBitsLoop!0 (_1!4896 lt!169961) nBits!396 i!615 lt!169967))))

(assert (=> d!35728 (= (readNLeastSignificantBitsLoopPure!0 (_1!4896 lt!169961) nBits!396 i!615 lt!169967) (tuple2!9275 (_2!4900 lt!170189) (_1!4900 lt!170189)))))

(declare-fun bs!8713 () Bool)

(assert (= bs!8713 d!35728))

(declare-fun m!167127 () Bool)

(assert (=> bs!8713 m!167127))

(assert (=> b!111918 d!35728))

(declare-fun d!35730 () Bool)

(assert (=> d!35730 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!169962)))) ((_ sign_extend 32) (currentByte!5285 thiss!1305)) ((_ sign_extend 32) (currentBit!5280 thiss!1305)) lt!169966) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!169962)))) ((_ sign_extend 32) (currentByte!5285 thiss!1305)) ((_ sign_extend 32) (currentBit!5280 thiss!1305))) lt!169966))))

(declare-fun bs!8714 () Bool)

(assert (= bs!8714 d!35730))

(declare-fun m!167129 () Bool)

(assert (=> bs!8714 m!167129))

(assert (=> b!111918 d!35730))

(declare-fun d!35732 () Bool)

(declare-fun e!73500 () Bool)

(assert (=> d!35732 e!73500))

(declare-fun res!92492 () Bool)

(assert (=> d!35732 (=> (not res!92492) (not e!73500))))

(declare-fun lt!170264 () tuple2!9270)

(declare-fun lt!170263 () tuple2!9270)

(assert (=> d!35732 (= res!92492 (= (bitIndex!0 (size!2316 (buf!2719 (_1!4895 lt!170264))) (currentByte!5285 (_1!4895 lt!170264)) (currentBit!5280 (_1!4895 lt!170264))) (bitIndex!0 (size!2316 (buf!2719 (_1!4895 lt!170263))) (currentByte!5285 (_1!4895 lt!170263)) (currentBit!5280 (_1!4895 lt!170263)))))))

(declare-fun lt!170262 () Unit!6851)

(declare-fun lt!170265 () BitStream!4106)

(declare-fun choose!50 (BitStream!4106 BitStream!4106 BitStream!4106 tuple2!9270 tuple2!9270 BitStream!4106 Bool tuple2!9270 tuple2!9270 BitStream!4106 Bool) Unit!6851)

(assert (=> d!35732 (= lt!170262 (choose!50 lt!169971 (_2!4894 lt!169962) lt!170265 lt!170264 (tuple2!9271 (_1!4895 lt!170264) (_2!4895 lt!170264)) (_1!4895 lt!170264) (_2!4895 lt!170264) lt!170263 (tuple2!9271 (_1!4895 lt!170263) (_2!4895 lt!170263)) (_1!4895 lt!170263) (_2!4895 lt!170263)))))

(assert (=> d!35732 (= lt!170263 (readBitPure!0 lt!170265))))

(assert (=> d!35732 (= lt!170264 (readBitPure!0 lt!169971))))

(assert (=> d!35732 (= lt!170265 (BitStream!4107 (buf!2719 (_2!4894 lt!169962)) (currentByte!5285 lt!169971) (currentBit!5280 lt!169971)))))

(assert (=> d!35732 (invariant!0 (currentBit!5280 lt!169971) (currentByte!5285 lt!169971) (size!2316 (buf!2719 (_2!4894 lt!169962))))))

(assert (=> d!35732 (= (readBitPrefixLemma!0 lt!169971 (_2!4894 lt!169962)) lt!170262)))

(declare-fun b!112007 () Bool)

(assert (=> b!112007 (= e!73500 (= (_2!4895 lt!170264) (_2!4895 lt!170263)))))

(assert (= (and d!35732 res!92492) b!112007))

(declare-fun m!167131 () Bool)

(assert (=> d!35732 m!167131))

(declare-fun m!167133 () Bool)

(assert (=> d!35732 m!167133))

(declare-fun m!167135 () Bool)

(assert (=> d!35732 m!167135))

(declare-fun m!167137 () Bool)

(assert (=> d!35732 m!167137))

(declare-fun m!167139 () Bool)

(assert (=> d!35732 m!167139))

(assert (=> d!35732 m!166943))

(assert (=> b!111918 d!35732))

(declare-fun b!112039 () Bool)

(declare-fun res!92521 () Bool)

(declare-fun e!73516 () Bool)

(assert (=> b!112039 (=> (not res!92521) (not e!73516))))

(declare-fun lt!170336 () tuple2!9268)

(assert (=> b!112039 (= res!92521 (isPrefixOf!0 thiss!1305 (_2!4894 lt!170336)))))

(declare-fun d!35734 () Bool)

(assert (=> d!35734 e!73516))

(declare-fun res!92518 () Bool)

(assert (=> d!35734 (=> (not res!92518) (not e!73516))))

(assert (=> d!35734 (= res!92518 (= (size!2316 (buf!2719 thiss!1305)) (size!2316 (buf!2719 (_2!4894 lt!170336)))))))

(declare-fun choose!16 (BitStream!4106 Bool) tuple2!9268)

(assert (=> d!35734 (= lt!170336 (choose!16 thiss!1305 lt!169959))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!35734 (validate_offset_bit!0 ((_ sign_extend 32) (size!2316 (buf!2719 thiss!1305))) ((_ sign_extend 32) (currentByte!5285 thiss!1305)) ((_ sign_extend 32) (currentBit!5280 thiss!1305)))))

(assert (=> d!35734 (= (appendBit!0 thiss!1305 lt!169959) lt!170336)))

(declare-fun b!112040 () Bool)

(declare-fun e!73517 () Bool)

(assert (=> b!112040 (= e!73516 e!73517)))

(declare-fun res!92519 () Bool)

(assert (=> b!112040 (=> (not res!92519) (not e!73517))))

(declare-fun lt!170335 () tuple2!9270)

(assert (=> b!112040 (= res!92519 (and (= (_2!4895 lt!170335) lt!169959) (= (_1!4895 lt!170335) (_2!4894 lt!170336))))))

(assert (=> b!112040 (= lt!170335 (readBitPure!0 (readerFrom!0 (_2!4894 lt!170336) (currentBit!5280 thiss!1305) (currentByte!5285 thiss!1305))))))

(declare-fun b!112041 () Bool)

(assert (=> b!112041 (= e!73517 (= (bitIndex!0 (size!2316 (buf!2719 (_1!4895 lt!170335))) (currentByte!5285 (_1!4895 lt!170335)) (currentBit!5280 (_1!4895 lt!170335))) (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!170336))) (currentByte!5285 (_2!4894 lt!170336)) (currentBit!5280 (_2!4894 lt!170336)))))))

(declare-fun b!112038 () Bool)

(declare-fun res!92520 () Bool)

(assert (=> b!112038 (=> (not res!92520) (not e!73516))))

(declare-fun lt!170338 () (_ BitVec 64))

(declare-fun lt!170337 () (_ BitVec 64))

(assert (=> b!112038 (= res!92520 (= (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!170336))) (currentByte!5285 (_2!4894 lt!170336)) (currentBit!5280 (_2!4894 lt!170336))) (bvadd lt!170338 lt!170337)))))

(assert (=> b!112038 (or (not (= (bvand lt!170338 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!170337 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!170338 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!170338 lt!170337) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112038 (= lt!170337 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!112038 (= lt!170338 (bitIndex!0 (size!2316 (buf!2719 thiss!1305)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305)))))

(assert (= (and d!35734 res!92518) b!112038))

(assert (= (and b!112038 res!92520) b!112039))

(assert (= (and b!112039 res!92521) b!112040))

(assert (= (and b!112040 res!92519) b!112041))

(declare-fun m!167217 () Bool)

(assert (=> b!112039 m!167217))

(declare-fun m!167223 () Bool)

(assert (=> b!112041 m!167223))

(declare-fun m!167227 () Bool)

(assert (=> b!112041 m!167227))

(assert (=> b!112038 m!167227))

(assert (=> b!112038 m!166979))

(declare-fun m!167229 () Bool)

(assert (=> b!112040 m!167229))

(assert (=> b!112040 m!167229))

(declare-fun m!167231 () Bool)

(assert (=> b!112040 m!167231))

(declare-fun m!167233 () Bool)

(assert (=> d!35734 m!167233))

(declare-fun m!167235 () Bool)

(assert (=> d!35734 m!167235))

(assert (=> b!111918 d!35734))

(declare-fun b!112125 () Bool)

(declare-fun e!73567 () Bool)

(declare-fun lt!170579 () tuple2!9270)

(declare-fun lt!170592 () tuple2!9270)

(assert (=> b!112125 (= e!73567 (= (_2!4895 lt!170579) (_2!4895 lt!170592)))))

(declare-fun b!112126 () Bool)

(declare-fun e!73565 () Bool)

(declare-fun lt!170581 () (_ BitVec 64))

(assert (=> b!112126 (= e!73565 (validate_offset_bits!1 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!169956)))) ((_ sign_extend 32) (currentByte!5285 (_2!4894 lt!169956))) ((_ sign_extend 32) (currentBit!5280 (_2!4894 lt!169956))) lt!170581))))

(declare-fun b!112127 () Bool)

(declare-fun res!92588 () Bool)

(declare-fun e!73564 () Bool)

(assert (=> b!112127 (=> (not res!92588) (not e!73564))))

(declare-fun lt!170604 () tuple2!9268)

(assert (=> b!112127 (= res!92588 (isPrefixOf!0 (_2!4894 lt!169956) (_2!4894 lt!170604)))))

(declare-fun b!112128 () Bool)

(declare-fun e!73566 () (_ BitVec 64))

(assert (=> b!112128 (= e!73566 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!112129 () Bool)

(declare-fun lt!170618 () tuple2!9270)

(declare-fun lt!170613 () tuple2!9268)

(assert (=> b!112129 (= lt!170618 (readBitPure!0 (readerFrom!0 (_2!4894 lt!170613) (currentBit!5280 (_2!4894 lt!169956)) (currentByte!5285 (_2!4894 lt!169956)))))))

(declare-fun res!92592 () Bool)

(declare-fun lt!170601 () Bool)

(assert (=> b!112129 (= res!92592 (and (= (_2!4895 lt!170618) lt!170601) (= (_1!4895 lt!170618) (_2!4894 lt!170613))))))

(declare-fun e!73570 () Bool)

(assert (=> b!112129 (=> (not res!92592) (not e!73570))))

(declare-fun e!73569 () Bool)

(assert (=> b!112129 (= e!73569 e!73570)))

(declare-fun d!35742 () Bool)

(assert (=> d!35742 e!73564))

(declare-fun res!92594 () Bool)

(assert (=> d!35742 (=> (not res!92594) (not e!73564))))

(assert (=> d!35742 (= res!92594 (= (size!2316 (buf!2719 (_2!4894 lt!169956))) (size!2316 (buf!2719 (_2!4894 lt!170604)))))))

(declare-fun e!73568 () tuple2!9268)

(assert (=> d!35742 (= lt!170604 e!73568)))

(declare-fun c!6822 () Bool)

(assert (=> d!35742 (= c!6822 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!35742 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!35742 (= (appendNLeastSignificantBitsLoop!0 (_2!4894 lt!169956) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!170604)))

(declare-fun b!112130 () Bool)

(declare-fun res!92591 () Bool)

(assert (=> b!112130 (= res!92591 (= (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!170613))) (currentByte!5285 (_2!4894 lt!170613)) (currentBit!5280 (_2!4894 lt!170613))) (bvadd (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!169956))) (currentByte!5285 (_2!4894 lt!169956)) (currentBit!5280 (_2!4894 lt!169956))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!112130 (=> (not res!92591) (not e!73569))))

(declare-fun b!112131 () Bool)

(assert (=> b!112131 (= e!73570 (= (bitIndex!0 (size!2316 (buf!2719 (_1!4895 lt!170618))) (currentByte!5285 (_1!4895 lt!170618)) (currentBit!5280 (_1!4895 lt!170618))) (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!170613))) (currentByte!5285 (_2!4894 lt!170613)) (currentBit!5280 (_2!4894 lt!170613)))))))

(declare-fun b!112132 () Bool)

(declare-fun lt!170616 () Unit!6851)

(assert (=> b!112132 (= e!73568 (tuple2!9269 lt!170616 (_2!4894 lt!169956)))))

(declare-fun lt!170598 () BitStream!4106)

(assert (=> b!112132 (= lt!170598 (_2!4894 lt!169956))))

(assert (=> b!112132 (= lt!170616 (lemmaIsPrefixRefl!0 lt!170598))))

(declare-fun call!1422 () Bool)

(assert (=> b!112132 call!1422))

(declare-fun lt!170612 () tuple2!9272)

(declare-fun lt!170583 () tuple2!9274)

(declare-fun b!112133 () Bool)

(assert (=> b!112133 (= e!73564 (and (= (_2!4897 lt!170583) v!199) (= (_1!4897 lt!170583) (_2!4896 lt!170612))))))

(declare-fun lt!170595 () (_ BitVec 64))

(assert (=> b!112133 (= lt!170583 (readNLeastSignificantBitsLoopPure!0 (_1!4896 lt!170612) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!170595))))

(declare-fun lt!170588 () Unit!6851)

(declare-fun lt!170585 () Unit!6851)

(assert (=> b!112133 (= lt!170588 lt!170585)))

(assert (=> b!112133 (validate_offset_bits!1 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!170604)))) ((_ sign_extend 32) (currentByte!5285 (_2!4894 lt!169956))) ((_ sign_extend 32) (currentBit!5280 (_2!4894 lt!169956))) lt!170581)))

(assert (=> b!112133 (= lt!170585 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4894 lt!169956) (buf!2719 (_2!4894 lt!170604)) lt!170581))))

(assert (=> b!112133 e!73565))

(declare-fun res!92596 () Bool)

(assert (=> b!112133 (=> (not res!92596) (not e!73565))))

(assert (=> b!112133 (= res!92596 (and (= (size!2316 (buf!2719 (_2!4894 lt!169956))) (size!2316 (buf!2719 (_2!4894 lt!170604)))) (bvsge lt!170581 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112133 (= lt!170581 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!112133 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!112133 (= lt!170595 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!112133 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!112133 (= lt!170612 (reader!0 (_2!4894 lt!169956) (_2!4894 lt!170604)))))

(declare-fun b!112134 () Bool)

(declare-fun res!92595 () Bool)

(assert (=> b!112134 (= res!92595 call!1422)))

(assert (=> b!112134 (=> (not res!92595) (not e!73569))))

(declare-fun b!112135 () Bool)

(assert (=> b!112135 (= e!73566 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun bm!1419 () Bool)

(assert (=> bm!1419 (= call!1422 (isPrefixOf!0 (ite c!6822 (_2!4894 lt!169956) lt!170598) (ite c!6822 (_2!4894 lt!170613) lt!170598)))))

(declare-fun b!112136 () Bool)

(declare-fun lt!170582 () tuple2!9268)

(declare-fun Unit!6862 () Unit!6851)

(assert (=> b!112136 (= e!73568 (tuple2!9269 Unit!6862 (_2!4894 lt!170582)))))

(assert (=> b!112136 (= lt!170601 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112136 (= lt!170613 (appendBit!0 (_2!4894 lt!169956) lt!170601))))

(declare-fun res!92590 () Bool)

(assert (=> b!112136 (= res!92590 (= (size!2316 (buf!2719 (_2!4894 lt!169956))) (size!2316 (buf!2719 (_2!4894 lt!170613)))))))

(assert (=> b!112136 (=> (not res!92590) (not e!73569))))

(assert (=> b!112136 e!73569))

(declare-fun lt!170597 () tuple2!9268)

(assert (=> b!112136 (= lt!170597 lt!170613)))

(assert (=> b!112136 (= lt!170582 (appendNLeastSignificantBitsLoop!0 (_2!4894 lt!170597) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!170591 () Unit!6851)

(assert (=> b!112136 (= lt!170591 (lemmaIsPrefixTransitive!0 (_2!4894 lt!169956) (_2!4894 lt!170597) (_2!4894 lt!170582)))))

(assert (=> b!112136 (isPrefixOf!0 (_2!4894 lt!169956) (_2!4894 lt!170582))))

(declare-fun lt!170586 () Unit!6851)

(assert (=> b!112136 (= lt!170586 lt!170591)))

(assert (=> b!112136 (invariant!0 (currentBit!5280 (_2!4894 lt!169956)) (currentByte!5285 (_2!4894 lt!169956)) (size!2316 (buf!2719 (_2!4894 lt!170597))))))

(declare-fun lt!170615 () BitStream!4106)

(assert (=> b!112136 (= lt!170615 (BitStream!4107 (buf!2719 (_2!4894 lt!170597)) (currentByte!5285 (_2!4894 lt!169956)) (currentBit!5280 (_2!4894 lt!169956))))))

(assert (=> b!112136 (invariant!0 (currentBit!5280 lt!170615) (currentByte!5285 lt!170615) (size!2316 (buf!2719 (_2!4894 lt!170582))))))

(declare-fun lt!170600 () BitStream!4106)

(assert (=> b!112136 (= lt!170600 (BitStream!4107 (buf!2719 (_2!4894 lt!170582)) (currentByte!5285 lt!170615) (currentBit!5280 lt!170615)))))

(assert (=> b!112136 (= lt!170579 (readBitPure!0 lt!170615))))

(assert (=> b!112136 (= lt!170592 (readBitPure!0 lt!170600))))

(declare-fun lt!170599 () Unit!6851)

(assert (=> b!112136 (= lt!170599 (readBitPrefixLemma!0 lt!170615 (_2!4894 lt!170582)))))

(declare-fun res!92593 () Bool)

(assert (=> b!112136 (= res!92593 (= (bitIndex!0 (size!2316 (buf!2719 (_1!4895 lt!170579))) (currentByte!5285 (_1!4895 lt!170579)) (currentBit!5280 (_1!4895 lt!170579))) (bitIndex!0 (size!2316 (buf!2719 (_1!4895 lt!170592))) (currentByte!5285 (_1!4895 lt!170592)) (currentBit!5280 (_1!4895 lt!170592)))))))

(assert (=> b!112136 (=> (not res!92593) (not e!73567))))

(assert (=> b!112136 e!73567))

(declare-fun lt!170577 () Unit!6851)

(assert (=> b!112136 (= lt!170577 lt!170599)))

(declare-fun lt!170589 () tuple2!9272)

(assert (=> b!112136 (= lt!170589 (reader!0 (_2!4894 lt!169956) (_2!4894 lt!170582)))))

(declare-fun lt!170596 () tuple2!9272)

(assert (=> b!112136 (= lt!170596 (reader!0 (_2!4894 lt!170597) (_2!4894 lt!170582)))))

(declare-fun lt!170602 () tuple2!9270)

(assert (=> b!112136 (= lt!170602 (readBitPure!0 (_1!4896 lt!170589)))))

(assert (=> b!112136 (= (_2!4895 lt!170602) lt!170601)))

(declare-fun lt!170605 () Unit!6851)

(declare-fun Unit!6864 () Unit!6851)

(assert (=> b!112136 (= lt!170605 Unit!6864)))

(declare-fun lt!170617 () (_ BitVec 64))

(assert (=> b!112136 (= lt!170617 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!170610 () (_ BitVec 64))

(assert (=> b!112136 (= lt!170610 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!170594 () Unit!6851)

(assert (=> b!112136 (= lt!170594 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4894 lt!169956) (buf!2719 (_2!4894 lt!170582)) lt!170610))))

(assert (=> b!112136 (validate_offset_bits!1 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!170582)))) ((_ sign_extend 32) (currentByte!5285 (_2!4894 lt!169956))) ((_ sign_extend 32) (currentBit!5280 (_2!4894 lt!169956))) lt!170610)))

(declare-fun lt!170587 () Unit!6851)

(assert (=> b!112136 (= lt!170587 lt!170594)))

(declare-fun lt!170611 () tuple2!9274)

(assert (=> b!112136 (= lt!170611 (readNLeastSignificantBitsLoopPure!0 (_1!4896 lt!170589) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!170617))))

(declare-fun lt!170580 () (_ BitVec 64))

(assert (=> b!112136 (= lt!170580 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!170621 () Unit!6851)

(assert (=> b!112136 (= lt!170621 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4894 lt!170597) (buf!2719 (_2!4894 lt!170582)) lt!170580))))

(assert (=> b!112136 (validate_offset_bits!1 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!170582)))) ((_ sign_extend 32) (currentByte!5285 (_2!4894 lt!170597))) ((_ sign_extend 32) (currentBit!5280 (_2!4894 lt!170597))) lt!170580)))

(declare-fun lt!170584 () Unit!6851)

(assert (=> b!112136 (= lt!170584 lt!170621)))

(declare-fun lt!170606 () tuple2!9274)

(assert (=> b!112136 (= lt!170606 (readNLeastSignificantBitsLoopPure!0 (_1!4896 lt!170596) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!170617 (ite (_2!4895 lt!170602) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!170620 () tuple2!9274)

(assert (=> b!112136 (= lt!170620 (readNLeastSignificantBitsLoopPure!0 (_1!4896 lt!170589) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!170617))))

(declare-fun c!6821 () Bool)

(assert (=> b!112136 (= c!6821 (_2!4895 (readBitPure!0 (_1!4896 lt!170589))))))

(declare-fun lt!170608 () tuple2!9274)

(assert (=> b!112136 (= lt!170608 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4896 lt!170589) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!170617 e!73566)))))

(declare-fun lt!170607 () Unit!6851)

(assert (=> b!112136 (= lt!170607 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4896 lt!170589) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!170617))))

(assert (=> b!112136 (and (= (_2!4897 lt!170620) (_2!4897 lt!170608)) (= (_1!4897 lt!170620) (_1!4897 lt!170608)))))

(declare-fun lt!170578 () Unit!6851)

(assert (=> b!112136 (= lt!170578 lt!170607)))

(assert (=> b!112136 (= (_1!4896 lt!170589) (withMovedBitIndex!0 (_2!4896 lt!170589) (bvsub (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!169956))) (currentByte!5285 (_2!4894 lt!169956)) (currentBit!5280 (_2!4894 lt!169956))) (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!170582))) (currentByte!5285 (_2!4894 lt!170582)) (currentBit!5280 (_2!4894 lt!170582))))))))

(declare-fun lt!170593 () Unit!6851)

(declare-fun Unit!6866 () Unit!6851)

(assert (=> b!112136 (= lt!170593 Unit!6866)))

(assert (=> b!112136 (= (_1!4896 lt!170596) (withMovedBitIndex!0 (_2!4896 lt!170596) (bvsub (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!170597))) (currentByte!5285 (_2!4894 lt!170597)) (currentBit!5280 (_2!4894 lt!170597))) (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!170582))) (currentByte!5285 (_2!4894 lt!170582)) (currentBit!5280 (_2!4894 lt!170582))))))))

(declare-fun lt!170590 () Unit!6851)

(declare-fun Unit!6867 () Unit!6851)

(assert (=> b!112136 (= lt!170590 Unit!6867)))

(assert (=> b!112136 (= (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!169956))) (currentByte!5285 (_2!4894 lt!169956)) (currentBit!5280 (_2!4894 lt!169956))) (bvsub (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!170597))) (currentByte!5285 (_2!4894 lt!170597)) (currentBit!5280 (_2!4894 lt!170597))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!170603 () Unit!6851)

(declare-fun Unit!6868 () Unit!6851)

(assert (=> b!112136 (= lt!170603 Unit!6868)))

(assert (=> b!112136 (= (_2!4897 lt!170611) (_2!4897 lt!170606))))

(declare-fun lt!170619 () Unit!6851)

(declare-fun Unit!6869 () Unit!6851)

(assert (=> b!112136 (= lt!170619 Unit!6869)))

(assert (=> b!112136 (= (_1!4897 lt!170611) (_2!4896 lt!170589))))

(declare-fun b!112137 () Bool)

(declare-fun res!92589 () Bool)

(assert (=> b!112137 (=> (not res!92589) (not e!73564))))

(declare-fun lt!170614 () (_ BitVec 64))

(declare-fun lt!170609 () (_ BitVec 64))

(assert (=> b!112137 (= res!92589 (= (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!170604))) (currentByte!5285 (_2!4894 lt!170604)) (currentBit!5280 (_2!4894 lt!170604))) (bvadd lt!170614 lt!170609)))))

(assert (=> b!112137 (or (not (= (bvand lt!170614 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!170609 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!170614 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!170614 lt!170609) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112137 (= lt!170609 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!112137 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!112137 (= lt!170614 (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!169956))) (currentByte!5285 (_2!4894 lt!169956)) (currentBit!5280 (_2!4894 lt!169956))))))

(assert (= (and d!35742 c!6822) b!112136))

(assert (= (and d!35742 (not c!6822)) b!112132))

(assert (= (and b!112136 res!92590) b!112130))

(assert (= (and b!112130 res!92591) b!112134))

(assert (= (and b!112134 res!92595) b!112129))

(assert (= (and b!112129 res!92592) b!112131))

(assert (= (and b!112136 res!92593) b!112125))

(assert (= (and b!112136 c!6821) b!112128))

(assert (= (and b!112136 (not c!6821)) b!112135))

(assert (= (or b!112134 b!112132) bm!1419))

(assert (= (and d!35742 res!92594) b!112137))

(assert (= (and b!112137 res!92589) b!112127))

(assert (= (and b!112127 res!92588) b!112133))

(assert (= (and b!112133 res!92596) b!112126))

(declare-fun m!167371 () Bool)

(assert (=> b!112133 m!167371))

(declare-fun m!167373 () Bool)

(assert (=> b!112133 m!167373))

(declare-fun m!167375 () Bool)

(assert (=> b!112133 m!167375))

(declare-fun m!167377 () Bool)

(assert (=> b!112133 m!167377))

(declare-fun m!167379 () Bool)

(assert (=> b!112133 m!167379))

(declare-fun m!167381 () Bool)

(assert (=> b!112132 m!167381))

(declare-fun m!167383 () Bool)

(assert (=> b!112131 m!167383))

(declare-fun m!167385 () Bool)

(assert (=> b!112131 m!167385))

(declare-fun m!167387 () Bool)

(assert (=> bm!1419 m!167387))

(declare-fun m!167389 () Bool)

(assert (=> b!112137 m!167389))

(assert (=> b!112137 m!166973))

(declare-fun m!167391 () Bool)

(assert (=> b!112129 m!167391))

(assert (=> b!112129 m!167391))

(declare-fun m!167393 () Bool)

(assert (=> b!112129 m!167393))

(declare-fun m!167395 () Bool)

(assert (=> b!112136 m!167395))

(declare-fun m!167397 () Bool)

(assert (=> b!112136 m!167397))

(declare-fun m!167399 () Bool)

(assert (=> b!112136 m!167399))

(declare-fun m!167401 () Bool)

(assert (=> b!112136 m!167401))

(declare-fun m!167403 () Bool)

(assert (=> b!112136 m!167403))

(declare-fun m!167405 () Bool)

(assert (=> b!112136 m!167405))

(declare-fun m!167407 () Bool)

(assert (=> b!112136 m!167407))

(declare-fun m!167409 () Bool)

(assert (=> b!112136 m!167409))

(declare-fun m!167411 () Bool)

(assert (=> b!112136 m!167411))

(declare-fun m!167413 () Bool)

(assert (=> b!112136 m!167413))

(declare-fun m!167415 () Bool)

(assert (=> b!112136 m!167415))

(declare-fun m!167417 () Bool)

(assert (=> b!112136 m!167417))

(declare-fun m!167419 () Bool)

(assert (=> b!112136 m!167419))

(declare-fun m!167421 () Bool)

(assert (=> b!112136 m!167421))

(assert (=> b!112136 m!166973))

(declare-fun m!167423 () Bool)

(assert (=> b!112136 m!167423))

(declare-fun m!167425 () Bool)

(assert (=> b!112136 m!167425))

(declare-fun m!167427 () Bool)

(assert (=> b!112136 m!167427))

(declare-fun m!167429 () Bool)

(assert (=> b!112136 m!167429))

(declare-fun m!167431 () Bool)

(assert (=> b!112136 m!167431))

(declare-fun m!167433 () Bool)

(assert (=> b!112136 m!167433))

(declare-fun m!167435 () Bool)

(assert (=> b!112136 m!167435))

(assert (=> b!112136 m!167373))

(declare-fun m!167437 () Bool)

(assert (=> b!112136 m!167437))

(assert (=> b!112136 m!167401))

(declare-fun m!167439 () Bool)

(assert (=> b!112136 m!167439))

(declare-fun m!167441 () Bool)

(assert (=> b!112136 m!167441))

(declare-fun m!167443 () Bool)

(assert (=> b!112136 m!167443))

(declare-fun m!167445 () Bool)

(assert (=> b!112136 m!167445))

(declare-fun m!167447 () Bool)

(assert (=> b!112136 m!167447))

(declare-fun m!167449 () Bool)

(assert (=> b!112127 m!167449))

(declare-fun m!167451 () Bool)

(assert (=> b!112126 m!167451))

(assert (=> b!112130 m!167385))

(assert (=> b!112130 m!166973))

(assert (=> b!111918 d!35742))

(declare-fun d!35780 () Bool)

(declare-fun res!92605 () Bool)

(declare-fun e!73577 () Bool)

(assert (=> d!35780 (=> (not res!92605) (not e!73577))))

(assert (=> d!35780 (= res!92605 (= (size!2316 (buf!2719 thiss!1305)) (size!2316 (buf!2719 (_2!4894 lt!169962)))))))

(assert (=> d!35780 (= (isPrefixOf!0 thiss!1305 (_2!4894 lt!169962)) e!73577)))

(declare-fun b!112150 () Bool)

(declare-fun res!92607 () Bool)

(assert (=> b!112150 (=> (not res!92607) (not e!73577))))

(assert (=> b!112150 (= res!92607 (bvsle (bitIndex!0 (size!2316 (buf!2719 thiss!1305)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305)) (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!169962))) (currentByte!5285 (_2!4894 lt!169962)) (currentBit!5280 (_2!4894 lt!169962)))))))

(declare-fun b!112151 () Bool)

(declare-fun e!73578 () Bool)

(assert (=> b!112151 (= e!73577 e!73578)))

(declare-fun res!92606 () Bool)

(assert (=> b!112151 (=> res!92606 e!73578)))

(assert (=> b!112151 (= res!92606 (= (size!2316 (buf!2719 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!112152 () Bool)

(assert (=> b!112152 (= e!73578 (arrayBitRangesEq!0 (buf!2719 thiss!1305) (buf!2719 (_2!4894 lt!169962)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2316 (buf!2719 thiss!1305)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305))))))

(assert (= (and d!35780 res!92605) b!112150))

(assert (= (and b!112150 res!92607) b!112151))

(assert (= (and b!112151 (not res!92606)) b!112152))

(assert (=> b!112150 m!166979))

(assert (=> b!112150 m!166971))

(assert (=> b!112152 m!166979))

(assert (=> b!112152 m!166979))

(declare-fun m!167453 () Bool)

(assert (=> b!112152 m!167453))

(assert (=> b!111918 d!35780))

(declare-fun d!35782 () Bool)

(assert (=> d!35782 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!169962)))) ((_ sign_extend 32) (currentByte!5285 (_2!4894 lt!169956))) ((_ sign_extend 32) (currentBit!5280 (_2!4894 lt!169956))) lt!169965) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!169962)))) ((_ sign_extend 32) (currentByte!5285 (_2!4894 lt!169956))) ((_ sign_extend 32) (currentBit!5280 (_2!4894 lt!169956)))) lt!169965))))

(declare-fun bs!8723 () Bool)

(assert (= bs!8723 d!35782))

(declare-fun m!167455 () Bool)

(assert (=> bs!8723 m!167455))

(assert (=> b!111918 d!35782))

(declare-fun b!112154 () Bool)

(declare-fun res!92609 () Bool)

(declare-fun e!73579 () Bool)

(assert (=> b!112154 (=> (not res!92609) (not e!73579))))

(declare-fun lt!170655 () tuple2!9272)

(assert (=> b!112154 (= res!92609 (isPrefixOf!0 (_1!4896 lt!170655) (_2!4894 lt!169956)))))

(declare-fun b!112155 () Bool)

(declare-fun e!73580 () Unit!6851)

(declare-fun Unit!6875 () Unit!6851)

(assert (=> b!112155 (= e!73580 Unit!6875)))

(declare-fun lt!170641 () (_ BitVec 64))

(declare-fun lt!170638 () (_ BitVec 64))

(declare-fun b!112156 () Bool)

(assert (=> b!112156 (= e!73579 (= (_1!4896 lt!170655) (withMovedBitIndex!0 (_2!4896 lt!170655) (bvsub lt!170638 lt!170641))))))

(assert (=> b!112156 (or (= (bvand lt!170638 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!170641 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!170638 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!170638 lt!170641) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112156 (= lt!170641 (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!169962))) (currentByte!5285 (_2!4894 lt!169962)) (currentBit!5280 (_2!4894 lt!169962))))))

(assert (=> b!112156 (= lt!170638 (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!169956))) (currentByte!5285 (_2!4894 lt!169956)) (currentBit!5280 (_2!4894 lt!169956))))))

(declare-fun b!112157 () Bool)

(declare-fun lt!170640 () Unit!6851)

(assert (=> b!112157 (= e!73580 lt!170640)))

(declare-fun lt!170649 () (_ BitVec 64))

(assert (=> b!112157 (= lt!170649 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!170642 () (_ BitVec 64))

(assert (=> b!112157 (= lt!170642 (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!169956))) (currentByte!5285 (_2!4894 lt!169956)) (currentBit!5280 (_2!4894 lt!169956))))))

(assert (=> b!112157 (= lt!170640 (arrayBitRangesEqSymmetric!0 (buf!2719 (_2!4894 lt!169956)) (buf!2719 (_2!4894 lt!169962)) lt!170649 lt!170642))))

(assert (=> b!112157 (arrayBitRangesEq!0 (buf!2719 (_2!4894 lt!169962)) (buf!2719 (_2!4894 lt!169956)) lt!170649 lt!170642)))

(declare-fun b!112153 () Bool)

(declare-fun res!92610 () Bool)

(assert (=> b!112153 (=> (not res!92610) (not e!73579))))

(assert (=> b!112153 (= res!92610 (isPrefixOf!0 (_2!4896 lt!170655) (_2!4894 lt!169962)))))

(declare-fun d!35784 () Bool)

(assert (=> d!35784 e!73579))

(declare-fun res!92608 () Bool)

(assert (=> d!35784 (=> (not res!92608) (not e!73579))))

(assert (=> d!35784 (= res!92608 (isPrefixOf!0 (_1!4896 lt!170655) (_2!4896 lt!170655)))))

(declare-fun lt!170646 () BitStream!4106)

(assert (=> d!35784 (= lt!170655 (tuple2!9273 lt!170646 (_2!4894 lt!169962)))))

(declare-fun lt!170656 () Unit!6851)

(declare-fun lt!170657 () Unit!6851)

(assert (=> d!35784 (= lt!170656 lt!170657)))

(assert (=> d!35784 (isPrefixOf!0 lt!170646 (_2!4894 lt!169962))))

(assert (=> d!35784 (= lt!170657 (lemmaIsPrefixTransitive!0 lt!170646 (_2!4894 lt!169962) (_2!4894 lt!169962)))))

(declare-fun lt!170652 () Unit!6851)

(declare-fun lt!170644 () Unit!6851)

(assert (=> d!35784 (= lt!170652 lt!170644)))

(assert (=> d!35784 (isPrefixOf!0 lt!170646 (_2!4894 lt!169962))))

(assert (=> d!35784 (= lt!170644 (lemmaIsPrefixTransitive!0 lt!170646 (_2!4894 lt!169956) (_2!4894 lt!169962)))))

(declare-fun lt!170648 () Unit!6851)

(assert (=> d!35784 (= lt!170648 e!73580)))

(declare-fun c!6825 () Bool)

(assert (=> d!35784 (= c!6825 (not (= (size!2316 (buf!2719 (_2!4894 lt!169956))) #b00000000000000000000000000000000)))))

(declare-fun lt!170647 () Unit!6851)

(declare-fun lt!170643 () Unit!6851)

(assert (=> d!35784 (= lt!170647 lt!170643)))

(assert (=> d!35784 (isPrefixOf!0 (_2!4894 lt!169962) (_2!4894 lt!169962))))

(assert (=> d!35784 (= lt!170643 (lemmaIsPrefixRefl!0 (_2!4894 lt!169962)))))

(declare-fun lt!170645 () Unit!6851)

(declare-fun lt!170654 () Unit!6851)

(assert (=> d!35784 (= lt!170645 lt!170654)))

(assert (=> d!35784 (= lt!170654 (lemmaIsPrefixRefl!0 (_2!4894 lt!169962)))))

(declare-fun lt!170651 () Unit!6851)

(declare-fun lt!170650 () Unit!6851)

(assert (=> d!35784 (= lt!170651 lt!170650)))

(assert (=> d!35784 (isPrefixOf!0 lt!170646 lt!170646)))

(assert (=> d!35784 (= lt!170650 (lemmaIsPrefixRefl!0 lt!170646))))

(declare-fun lt!170639 () Unit!6851)

(declare-fun lt!170653 () Unit!6851)

(assert (=> d!35784 (= lt!170639 lt!170653)))

(assert (=> d!35784 (isPrefixOf!0 (_2!4894 lt!169956) (_2!4894 lt!169956))))

(assert (=> d!35784 (= lt!170653 (lemmaIsPrefixRefl!0 (_2!4894 lt!169956)))))

(assert (=> d!35784 (= lt!170646 (BitStream!4107 (buf!2719 (_2!4894 lt!169962)) (currentByte!5285 (_2!4894 lt!169956)) (currentBit!5280 (_2!4894 lt!169956))))))

(assert (=> d!35784 (isPrefixOf!0 (_2!4894 lt!169956) (_2!4894 lt!169962))))

(assert (=> d!35784 (= (reader!0 (_2!4894 lt!169956) (_2!4894 lt!169962)) lt!170655)))

(assert (= (and d!35784 c!6825) b!112157))

(assert (= (and d!35784 (not c!6825)) b!112155))

(assert (= (and d!35784 res!92608) b!112154))

(assert (= (and b!112154 res!92609) b!112153))

(assert (= (and b!112153 res!92610) b!112156))

(declare-fun m!167457 () Bool)

(assert (=> d!35784 m!167457))

(declare-fun m!167459 () Bool)

(assert (=> d!35784 m!167459))

(declare-fun m!167461 () Bool)

(assert (=> d!35784 m!167461))

(declare-fun m!167463 () Bool)

(assert (=> d!35784 m!167463))

(assert (=> d!35784 m!167099))

(declare-fun m!167465 () Bool)

(assert (=> d!35784 m!167465))

(declare-fun m!167467 () Bool)

(assert (=> d!35784 m!167467))

(assert (=> d!35784 m!167105))

(declare-fun m!167469 () Bool)

(assert (=> d!35784 m!167469))

(declare-fun m!167471 () Bool)

(assert (=> d!35784 m!167471))

(declare-fun m!167473 () Bool)

(assert (=> d!35784 m!167473))

(assert (=> b!112157 m!166973))

(declare-fun m!167475 () Bool)

(assert (=> b!112157 m!167475))

(declare-fun m!167477 () Bool)

(assert (=> b!112157 m!167477))

(declare-fun m!167479 () Bool)

(assert (=> b!112156 m!167479))

(assert (=> b!112156 m!166971))

(assert (=> b!112156 m!166973))

(declare-fun m!167481 () Bool)

(assert (=> b!112154 m!167481))

(declare-fun m!167483 () Bool)

(assert (=> b!112153 m!167483))

(assert (=> b!111918 d!35784))

(declare-fun d!35786 () Bool)

(assert (=> d!35786 (validate_offset_bits!1 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!169962)))) ((_ sign_extend 32) (currentByte!5285 (_2!4894 lt!169956))) ((_ sign_extend 32) (currentBit!5280 (_2!4894 lt!169956))) lt!169965)))

(declare-fun lt!170674 () Unit!6851)

(assert (=> d!35786 (= lt!170674 (choose!9 (_2!4894 lt!169956) (buf!2719 (_2!4894 lt!169962)) lt!169965 (BitStream!4107 (buf!2719 (_2!4894 lt!169962)) (currentByte!5285 (_2!4894 lt!169956)) (currentBit!5280 (_2!4894 lt!169956)))))))

(assert (=> d!35786 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4894 lt!169956) (buf!2719 (_2!4894 lt!169962)) lt!169965) lt!170674)))

(declare-fun bs!8724 () Bool)

(assert (= bs!8724 d!35786))

(assert (=> bs!8724 m!166967))

(declare-fun m!167485 () Bool)

(assert (=> bs!8724 m!167485))

(assert (=> b!111918 d!35786))

(declare-fun d!35788 () Bool)

(declare-fun e!73583 () Bool)

(assert (=> d!35788 e!73583))

(declare-fun res!92613 () Bool)

(assert (=> d!35788 (=> (not res!92613) (not e!73583))))

(declare-fun lt!170684 () (_ BitVec 64))

(declare-fun lt!170683 () (_ BitVec 64))

(declare-fun lt!170679 () (_ BitVec 64))

(assert (=> d!35788 (= res!92613 (= lt!170679 (bvsub lt!170683 lt!170684)))))

(assert (=> d!35788 (or (= (bvand lt!170683 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!170684 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!170683 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!170683 lt!170684) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35788 (= lt!170684 (remainingBits!0 ((_ sign_extend 32) (size!2316 (buf!2719 (_1!4895 lt!169974)))) ((_ sign_extend 32) (currentByte!5285 (_1!4895 lt!169974))) ((_ sign_extend 32) (currentBit!5280 (_1!4895 lt!169974)))))))

(declare-fun lt!170682 () (_ BitVec 64))

(declare-fun lt!170681 () (_ BitVec 64))

(assert (=> d!35788 (= lt!170683 (bvmul lt!170682 lt!170681))))

(assert (=> d!35788 (or (= lt!170682 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!170681 (bvsdiv (bvmul lt!170682 lt!170681) lt!170682)))))

(assert (=> d!35788 (= lt!170681 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35788 (= lt!170682 ((_ sign_extend 32) (size!2316 (buf!2719 (_1!4895 lt!169974)))))))

(assert (=> d!35788 (= lt!170679 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5285 (_1!4895 lt!169974))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5280 (_1!4895 lt!169974)))))))

(assert (=> d!35788 (invariant!0 (currentBit!5280 (_1!4895 lt!169974)) (currentByte!5285 (_1!4895 lt!169974)) (size!2316 (buf!2719 (_1!4895 lt!169974))))))

(assert (=> d!35788 (= (bitIndex!0 (size!2316 (buf!2719 (_1!4895 lt!169974))) (currentByte!5285 (_1!4895 lt!169974)) (currentBit!5280 (_1!4895 lt!169974))) lt!170679)))

(declare-fun b!112160 () Bool)

(declare-fun res!92614 () Bool)

(assert (=> b!112160 (=> (not res!92614) (not e!73583))))

(assert (=> b!112160 (= res!92614 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!170679))))

(declare-fun b!112161 () Bool)

(declare-fun lt!170680 () (_ BitVec 64))

(assert (=> b!112161 (= e!73583 (bvsle lt!170679 (bvmul lt!170680 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112161 (or (= lt!170680 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!170680 #b0000000000000000000000000000000000000000000000000000000000001000) lt!170680)))))

(assert (=> b!112161 (= lt!170680 ((_ sign_extend 32) (size!2316 (buf!2719 (_1!4895 lt!169974)))))))

(assert (= (and d!35788 res!92613) b!112160))

(assert (= (and b!112160 res!92614) b!112161))

(declare-fun m!167487 () Bool)

(assert (=> d!35788 m!167487))

(declare-fun m!167489 () Bool)

(assert (=> d!35788 m!167489))

(assert (=> b!111919 d!35788))

(declare-fun d!35790 () Bool)

(assert (=> d!35790 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!111920 d!35790))

(push 1)

(assert (not d!35706))

(assert (not d!35696))

(assert (not d!35694))

(assert (not d!35682))

(assert (not d!35690))

(assert (not d!35710))

(assert (not d!35716))

(assert (not d!35784))

(assert (not d!35712))

(assert (not b!112040))

(assert (not d!35686))

(assert (not b!111985))

(assert (not d!35788))

(assert (not b!112157))

(assert (not d!35684))

(assert (not b!112150))

(assert (not d!35734))

(assert (not d!35732))

(assert (not b!112153))

(assert (not b!111964))

(assert (not d!35728))

(assert (not b!112156))

(assert (not b!111967))

(assert (not d!35688))

(assert (not b!112130))

(assert (not b!111982))

(assert (not b!112041))

(assert (not d!35720))

(assert (not b!112132))

(assert (not b!112154))

(assert (not b!111962))

(assert (not b!112126))

(assert (not d!35786))

(assert (not b!112133))

(assert (not b!112131))

(assert (not d!35692))

(assert (not b!112038))

(assert (not b!112129))

(assert (not b!112127))

(assert (not b!111983))

(assert (not b!112137))

(assert (not d!35718))

(assert (not d!35702))

(assert (not b!112039))

(assert (not d!35722))

(assert (not b!112136))

(assert (not d!35726))

(assert (not d!35678))

(assert (not d!35704))

(assert (not d!35782))

(assert (not b!112152))

(assert (not d!35730))

(assert (not d!35714))

(assert (not d!35724))

(assert (not b!111986))

(assert (not bm!1419))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!112273 () Bool)

(declare-fun e!73652 () Bool)

(declare-fun e!73654 () Bool)

(assert (=> b!112273 (= e!73652 e!73654)))

(declare-fun res!92708 () Bool)

(declare-fun call!1428 () Bool)

(assert (=> b!112273 (= res!92708 call!1428)))

(assert (=> b!112273 (=> (not res!92708) (not e!73654))))

(declare-fun b!112274 () Bool)

(declare-fun e!73653 () Bool)

(declare-fun e!73650 () Bool)

(assert (=> b!112274 (= e!73653 e!73650)))

(declare-fun res!92707 () Bool)

(assert (=> b!112274 (=> (not res!92707) (not e!73650))))

(declare-fun e!73655 () Bool)

(assert (=> b!112274 (= res!92707 e!73655)))

(declare-fun res!92710 () Bool)

(assert (=> b!112274 (=> res!92710 e!73655)))

(declare-datatypes ((tuple4!78 0))(
  ( (tuple4!79 (_1!4904 (_ BitVec 32)) (_2!4904 (_ BitVec 32)) (_3!260 (_ BitVec 32)) (_4!39 (_ BitVec 32))) )
))
(declare-fun lt!170988 () tuple4!78)

(assert (=> b!112274 (= res!92710 (bvsge (_1!4904 lt!170988) (_2!4904 lt!170988)))))

(declare-fun lt!170990 () (_ BitVec 32))

(assert (=> b!112274 (= lt!170990 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2316 (buf!2719 thiss!1305)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!170989 () (_ BitVec 32))

(assert (=> b!112274 (= lt!170989 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!78)

(assert (=> b!112274 (= lt!170988 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2316 (buf!2719 thiss!1305)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305))))))

(declare-fun b!112275 () Bool)

(declare-fun res!92706 () Bool)

(assert (=> b!112275 (= res!92706 (= lt!170990 #b00000000000000000000000000000000))))

(declare-fun e!73651 () Bool)

(assert (=> b!112275 (=> res!92706 e!73651)))

(assert (=> b!112275 (= e!73654 e!73651)))

(declare-fun bm!1425 () Bool)

(declare-fun c!6836 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!1425 (= call!1428 (byteRangesEq!0 (select (arr!2909 (buf!2719 thiss!1305)) (_3!260 lt!170988)) (select (arr!2909 (buf!2719 (_2!4894 lt!169956))) (_3!260 lt!170988)) lt!170989 (ite c!6836 lt!170990 #b00000000000000000000000000001000)))))

(declare-fun d!35862 () Bool)

(declare-fun res!92709 () Bool)

(assert (=> d!35862 (=> res!92709 e!73653)))

(assert (=> d!35862 (= res!92709 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2316 (buf!2719 thiss!1305)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305))))))

(assert (=> d!35862 (= (arrayBitRangesEq!0 (buf!2719 thiss!1305) (buf!2719 (_2!4894 lt!169956)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2316 (buf!2719 thiss!1305)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305))) e!73653)))

(declare-fun b!112276 () Bool)

(declare-fun arrayRangesEq!40 (array!5094 array!5094 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!112276 (= e!73655 (arrayRangesEq!40 (buf!2719 thiss!1305) (buf!2719 (_2!4894 lt!169956)) (_1!4904 lt!170988) (_2!4904 lt!170988)))))

(declare-fun b!112277 () Bool)

(assert (=> b!112277 (= e!73652 call!1428)))

(declare-fun b!112278 () Bool)

(assert (=> b!112278 (= e!73650 e!73652)))

(assert (=> b!112278 (= c!6836 (= (_3!260 lt!170988) (_4!39 lt!170988)))))

(declare-fun b!112279 () Bool)

(assert (=> b!112279 (= e!73651 (byteRangesEq!0 (select (arr!2909 (buf!2719 thiss!1305)) (_4!39 lt!170988)) (select (arr!2909 (buf!2719 (_2!4894 lt!169956))) (_4!39 lt!170988)) #b00000000000000000000000000000000 lt!170990))))

(assert (= (and d!35862 (not res!92709)) b!112274))

(assert (= (and b!112274 (not res!92710)) b!112276))

(assert (= (and b!112274 res!92707) b!112278))

(assert (= (and b!112278 c!6836) b!112277))

(assert (= (and b!112278 (not c!6836)) b!112273))

(assert (= (and b!112273 res!92708) b!112275))

(assert (= (and b!112275 (not res!92706)) b!112279))

(assert (= (or b!112277 b!112273) bm!1425))

(assert (=> b!112274 m!166979))

(declare-fun m!167735 () Bool)

(assert (=> b!112274 m!167735))

(declare-fun m!167737 () Bool)

(assert (=> bm!1425 m!167737))

(declare-fun m!167739 () Bool)

(assert (=> bm!1425 m!167739))

(assert (=> bm!1425 m!167737))

(assert (=> bm!1425 m!167739))

(declare-fun m!167741 () Bool)

(assert (=> bm!1425 m!167741))

(declare-fun m!167743 () Bool)

(assert (=> b!112276 m!167743))

(declare-fun m!167745 () Bool)

(assert (=> b!112279 m!167745))

(declare-fun m!167747 () Bool)

(assert (=> b!112279 m!167747))

(assert (=> b!112279 m!167745))

(assert (=> b!112279 m!167747))

(declare-fun m!167749 () Bool)

(assert (=> b!112279 m!167749))

(assert (=> b!111964 d!35862))

(assert (=> b!111964 d!35696))

(declare-fun d!35864 () Bool)

(declare-fun e!73656 () Bool)

(assert (=> d!35864 e!73656))

(declare-fun res!92711 () Bool)

(assert (=> d!35864 (=> (not res!92711) (not e!73656))))

(declare-fun lt!170996 () (_ BitVec 64))

(declare-fun lt!170991 () (_ BitVec 64))

(declare-fun lt!170995 () (_ BitVec 64))

(assert (=> d!35864 (= res!92711 (= lt!170991 (bvsub lt!170995 lt!170996)))))

(assert (=> d!35864 (or (= (bvand lt!170995 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!170996 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!170995 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!170995 lt!170996) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35864 (= lt!170996 (remainingBits!0 ((_ sign_extend 32) (size!2316 (buf!2719 lt!170086))) ((_ sign_extend 32) (currentByte!5285 lt!170086)) ((_ sign_extend 32) (currentBit!5280 lt!170086))))))

(declare-fun lt!170994 () (_ BitVec 64))

(declare-fun lt!170993 () (_ BitVec 64))

(assert (=> d!35864 (= lt!170995 (bvmul lt!170994 lt!170993))))

(assert (=> d!35864 (or (= lt!170994 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!170993 (bvsdiv (bvmul lt!170994 lt!170993) lt!170994)))))

(assert (=> d!35864 (= lt!170993 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35864 (= lt!170994 ((_ sign_extend 32) (size!2316 (buf!2719 lt!170086))))))

(assert (=> d!35864 (= lt!170991 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5285 lt!170086)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5280 lt!170086))))))

(assert (=> d!35864 (invariant!0 (currentBit!5280 lt!170086) (currentByte!5285 lt!170086) (size!2316 (buf!2719 lt!170086)))))

(assert (=> d!35864 (= (bitIndex!0 (size!2316 (buf!2719 lt!170086)) (currentByte!5285 lt!170086) (currentBit!5280 lt!170086)) lt!170991)))

(declare-fun b!112280 () Bool)

(declare-fun res!92712 () Bool)

(assert (=> b!112280 (=> (not res!92712) (not e!73656))))

(assert (=> b!112280 (= res!92712 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!170991))))

(declare-fun b!112281 () Bool)

(declare-fun lt!170992 () (_ BitVec 64))

(assert (=> b!112281 (= e!73656 (bvsle lt!170991 (bvmul lt!170992 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112281 (or (= lt!170992 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!170992 #b0000000000000000000000000000000000000000000000000000000000001000) lt!170992)))))

(assert (=> b!112281 (= lt!170992 ((_ sign_extend 32) (size!2316 (buf!2719 lt!170086))))))

(assert (= (and d!35864 res!92711) b!112280))

(assert (= (and b!112280 res!92712) b!112281))

(declare-fun m!167751 () Bool)

(assert (=> d!35864 m!167751))

(declare-fun m!167753 () Bool)

(assert (=> d!35864 m!167753))

(assert (=> d!35694 d!35864))

(declare-fun d!35866 () Bool)

(declare-fun e!73657 () Bool)

(assert (=> d!35866 e!73657))

(declare-fun res!92713 () Bool)

(assert (=> d!35866 (=> (not res!92713) (not e!73657))))

(declare-fun lt!171001 () (_ BitVec 64))

(declare-fun lt!171002 () (_ BitVec 64))

(declare-fun lt!170997 () (_ BitVec 64))

(assert (=> d!35866 (= res!92713 (= lt!170997 (bvsub lt!171001 lt!171002)))))

(assert (=> d!35866 (or (= (bvand lt!171001 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171002 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!171001 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!171001 lt!171002) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35866 (= lt!171002 (remainingBits!0 ((_ sign_extend 32) (size!2316 (buf!2719 (_1!4896 lt!169961)))) ((_ sign_extend 32) (currentByte!5285 (_1!4896 lt!169961))) ((_ sign_extend 32) (currentBit!5280 (_1!4896 lt!169961)))))))

(declare-fun lt!171000 () (_ BitVec 64))

(declare-fun lt!170999 () (_ BitVec 64))

(assert (=> d!35866 (= lt!171001 (bvmul lt!171000 lt!170999))))

(assert (=> d!35866 (or (= lt!171000 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!170999 (bvsdiv (bvmul lt!171000 lt!170999) lt!171000)))))

(assert (=> d!35866 (= lt!170999 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35866 (= lt!171000 ((_ sign_extend 32) (size!2316 (buf!2719 (_1!4896 lt!169961)))))))

(assert (=> d!35866 (= lt!170997 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5285 (_1!4896 lt!169961))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5280 (_1!4896 lt!169961)))))))

(assert (=> d!35866 (invariant!0 (currentBit!5280 (_1!4896 lt!169961)) (currentByte!5285 (_1!4896 lt!169961)) (size!2316 (buf!2719 (_1!4896 lt!169961))))))

(assert (=> d!35866 (= (bitIndex!0 (size!2316 (buf!2719 (_1!4896 lt!169961))) (currentByte!5285 (_1!4896 lt!169961)) (currentBit!5280 (_1!4896 lt!169961))) lt!170997)))

(declare-fun b!112282 () Bool)

(declare-fun res!92714 () Bool)

(assert (=> b!112282 (=> (not res!92714) (not e!73657))))

(assert (=> b!112282 (= res!92714 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!170997))))

(declare-fun b!112283 () Bool)

(declare-fun lt!170998 () (_ BitVec 64))

(assert (=> b!112283 (= e!73657 (bvsle lt!170997 (bvmul lt!170998 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112283 (or (= lt!170998 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!170998 #b0000000000000000000000000000000000000000000000000000000000001000) lt!170998)))))

(assert (=> b!112283 (= lt!170998 ((_ sign_extend 32) (size!2316 (buf!2719 (_1!4896 lt!169961)))))))

(assert (= (and d!35866 res!92713) b!112282))

(assert (= (and b!112282 res!92714) b!112283))

(declare-fun m!167755 () Bool)

(assert (=> d!35866 m!167755))

(declare-fun m!167757 () Bool)

(assert (=> d!35866 m!167757))

(assert (=> d!35694 d!35866))

(declare-fun d!35868 () Bool)

(declare-fun lt!171017 () (_ BitVec 32))

(assert (=> d!35868 (= lt!171017 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!171016 () (_ BitVec 32))

(assert (=> d!35868 (= lt!171016 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!73662 () Bool)

(assert (=> d!35868 e!73662))

(declare-fun res!92719 () Bool)

(assert (=> d!35868 (=> (not res!92719) (not e!73662))))

(assert (=> d!35868 (= res!92719 (moveBitIndexPrecond!0 (_1!4896 lt!169961) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun Unit!6877 () Unit!6851)

(declare-fun Unit!6878 () Unit!6851)

(declare-fun Unit!6879 () Unit!6851)

(assert (=> d!35868 (= (moveBitIndex!0 (_1!4896 lt!169961) #b0000000000000000000000000000000000000000000000000000000000000001) (ite (bvslt (bvadd (currentBit!5280 (_1!4896 lt!169961)) lt!171017) #b00000000000000000000000000000000) (tuple2!9269 Unit!6877 (BitStream!4107 (buf!2719 (_1!4896 lt!169961)) (bvsub (bvadd (currentByte!5285 (_1!4896 lt!169961)) lt!171016) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!171017 (currentBit!5280 (_1!4896 lt!169961))))) (ite (bvsge (bvadd (currentBit!5280 (_1!4896 lt!169961)) lt!171017) #b00000000000000000000000000001000) (tuple2!9269 Unit!6878 (BitStream!4107 (buf!2719 (_1!4896 lt!169961)) (bvadd (currentByte!5285 (_1!4896 lt!169961)) lt!171016 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!5280 (_1!4896 lt!169961)) lt!171017) #b00000000000000000000000000001000))) (tuple2!9269 Unit!6879 (BitStream!4107 (buf!2719 (_1!4896 lt!169961)) (bvadd (currentByte!5285 (_1!4896 lt!169961)) lt!171016) (bvadd (currentBit!5280 (_1!4896 lt!169961)) lt!171017))))))))

(declare-fun b!112288 () Bool)

(declare-fun e!73663 () Bool)

(assert (=> b!112288 (= e!73662 e!73663)))

(declare-fun res!92720 () Bool)

(assert (=> b!112288 (=> (not res!92720) (not e!73663))))

(declare-fun lt!171018 () (_ BitVec 64))

(declare-fun lt!171015 () tuple2!9268)

(assert (=> b!112288 (= res!92720 (= (bvadd lt!171018 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!171015))) (currentByte!5285 (_2!4894 lt!171015)) (currentBit!5280 (_2!4894 lt!171015)))))))

(assert (=> b!112288 (or (not (= (bvand lt!171018 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!171018 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!171018 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112288 (= lt!171018 (bitIndex!0 (size!2316 (buf!2719 (_1!4896 lt!169961))) (currentByte!5285 (_1!4896 lt!169961)) (currentBit!5280 (_1!4896 lt!169961))))))

(declare-fun lt!171020 () (_ BitVec 32))

(declare-fun lt!171019 () (_ BitVec 32))

(declare-fun Unit!6880 () Unit!6851)

(declare-fun Unit!6881 () Unit!6851)

(declare-fun Unit!6882 () Unit!6851)

(assert (=> b!112288 (= lt!171015 (ite (bvslt (bvadd (currentBit!5280 (_1!4896 lt!169961)) lt!171019) #b00000000000000000000000000000000) (tuple2!9269 Unit!6880 (BitStream!4107 (buf!2719 (_1!4896 lt!169961)) (bvsub (bvadd (currentByte!5285 (_1!4896 lt!169961)) lt!171020) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!171019 (currentBit!5280 (_1!4896 lt!169961))))) (ite (bvsge (bvadd (currentBit!5280 (_1!4896 lt!169961)) lt!171019) #b00000000000000000000000000001000) (tuple2!9269 Unit!6881 (BitStream!4107 (buf!2719 (_1!4896 lt!169961)) (bvadd (currentByte!5285 (_1!4896 lt!169961)) lt!171020 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!5280 (_1!4896 lt!169961)) lt!171019) #b00000000000000000000000000001000))) (tuple2!9269 Unit!6882 (BitStream!4107 (buf!2719 (_1!4896 lt!169961)) (bvadd (currentByte!5285 (_1!4896 lt!169961)) lt!171020) (bvadd (currentBit!5280 (_1!4896 lt!169961)) lt!171019))))))))

(assert (=> b!112288 (= lt!171019 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112288 (= lt!171020 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!112289 () Bool)

(assert (=> b!112289 (= e!73663 (and (= (size!2316 (buf!2719 (_1!4896 lt!169961))) (size!2316 (buf!2719 (_2!4894 lt!171015)))) (= (buf!2719 (_1!4896 lt!169961)) (buf!2719 (_2!4894 lt!171015)))))))

(assert (= (and d!35868 res!92719) b!112288))

(assert (= (and b!112288 res!92720) b!112289))

(assert (=> d!35868 m!167069))

(declare-fun m!167759 () Bool)

(assert (=> b!112288 m!167759))

(assert (=> b!112288 m!167065))

(assert (=> d!35694 d!35868))

(declare-fun d!35872 () Bool)

(declare-fun res!92723 () Bool)

(declare-fun e!73666 () Bool)

(assert (=> d!35872 (=> (not res!92723) (not e!73666))))

(assert (=> d!35872 (= res!92723 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!2316 (buf!2719 (_1!4896 lt!169961))))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2316 (buf!2719 (_1!4896 lt!169961))))))))))

(assert (=> d!35872 (= (moveBitIndexPrecond!0 (_1!4896 lt!169961) #b0000000000000000000000000000000000000000000000000000000000000001) e!73666)))

(declare-fun b!112293 () Bool)

(declare-fun lt!171023 () (_ BitVec 64))

(assert (=> b!112293 (= e!73666 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!171023) (bvsle lt!171023 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2316 (buf!2719 (_1!4896 lt!169961))))))))))

(assert (=> b!112293 (= lt!171023 (bvadd (bitIndex!0 (size!2316 (buf!2719 (_1!4896 lt!169961))) (currentByte!5285 (_1!4896 lt!169961)) (currentBit!5280 (_1!4896 lt!169961))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!35872 res!92723) b!112293))

(assert (=> b!112293 m!167065))

(assert (=> d!35694 d!35872))

(declare-fun d!35874 () Bool)

(declare-fun res!92724 () Bool)

(declare-fun e!73667 () Bool)

(assert (=> d!35874 (=> (not res!92724) (not e!73667))))

(assert (=> d!35874 (= res!92724 (= (size!2316 (buf!2719 (_2!4894 lt!169956))) (size!2316 (buf!2719 (_2!4894 lt!169956)))))))

(assert (=> d!35874 (= (isPrefixOf!0 (_2!4894 lt!169956) (_2!4894 lt!169956)) e!73667)))

(declare-fun b!112294 () Bool)

(declare-fun res!92726 () Bool)

(assert (=> b!112294 (=> (not res!92726) (not e!73667))))

(assert (=> b!112294 (= res!92726 (bvsle (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!169956))) (currentByte!5285 (_2!4894 lt!169956)) (currentBit!5280 (_2!4894 lt!169956))) (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!169956))) (currentByte!5285 (_2!4894 lt!169956)) (currentBit!5280 (_2!4894 lt!169956)))))))

(declare-fun b!112295 () Bool)

(declare-fun e!73668 () Bool)

(assert (=> b!112295 (= e!73667 e!73668)))

(declare-fun res!92725 () Bool)

(assert (=> b!112295 (=> res!92725 e!73668)))

(assert (=> b!112295 (= res!92725 (= (size!2316 (buf!2719 (_2!4894 lt!169956))) #b00000000000000000000000000000000))))

(declare-fun b!112296 () Bool)

(assert (=> b!112296 (= e!73668 (arrayBitRangesEq!0 (buf!2719 (_2!4894 lt!169956)) (buf!2719 (_2!4894 lt!169956)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!169956))) (currentByte!5285 (_2!4894 lt!169956)) (currentBit!5280 (_2!4894 lt!169956)))))))

(assert (= (and d!35874 res!92724) b!112294))

(assert (= (and b!112294 res!92726) b!112295))

(assert (= (and b!112295 (not res!92725)) b!112296))

(assert (=> b!112294 m!166973))

(assert (=> b!112294 m!166973))

(assert (=> b!112296 m!166973))

(assert (=> b!112296 m!166973))

(declare-fun m!167761 () Bool)

(assert (=> b!112296 m!167761))

(assert (=> d!35784 d!35874))

(declare-fun d!35876 () Bool)

(assert (=> d!35876 (isPrefixOf!0 lt!170646 (_2!4894 lt!169962))))

(declare-fun lt!171024 () Unit!6851)

(assert (=> d!35876 (= lt!171024 (choose!30 lt!170646 (_2!4894 lt!169962) (_2!4894 lt!169962)))))

(assert (=> d!35876 (isPrefixOf!0 lt!170646 (_2!4894 lt!169962))))

(assert (=> d!35876 (= (lemmaIsPrefixTransitive!0 lt!170646 (_2!4894 lt!169962) (_2!4894 lt!169962)) lt!171024)))

(declare-fun bs!8741 () Bool)

(assert (= bs!8741 d!35876))

(assert (=> bs!8741 m!167465))

(declare-fun m!167763 () Bool)

(assert (=> bs!8741 m!167763))

(assert (=> bs!8741 m!167465))

(assert (=> d!35784 d!35876))

(declare-fun d!35878 () Bool)

(assert (=> d!35878 (isPrefixOf!0 (_2!4894 lt!169962) (_2!4894 lt!169962))))

(declare-fun lt!171027 () Unit!6851)

(declare-fun choose!11 (BitStream!4106) Unit!6851)

(assert (=> d!35878 (= lt!171027 (choose!11 (_2!4894 lt!169962)))))

(assert (=> d!35878 (= (lemmaIsPrefixRefl!0 (_2!4894 lt!169962)) lt!171027)))

(declare-fun bs!8743 () Bool)

(assert (= bs!8743 d!35878))

(assert (=> bs!8743 m!167105))

(declare-fun m!167765 () Bool)

(assert (=> bs!8743 m!167765))

(assert (=> d!35784 d!35878))

(declare-fun d!35880 () Bool)

(declare-fun res!92727 () Bool)

(declare-fun e!73669 () Bool)

(assert (=> d!35880 (=> (not res!92727) (not e!73669))))

(assert (=> d!35880 (= res!92727 (= (size!2316 (buf!2719 (_1!4896 lt!170655))) (size!2316 (buf!2719 (_2!4896 lt!170655)))))))

(assert (=> d!35880 (= (isPrefixOf!0 (_1!4896 lt!170655) (_2!4896 lt!170655)) e!73669)))

(declare-fun b!112297 () Bool)

(declare-fun res!92729 () Bool)

(assert (=> b!112297 (=> (not res!92729) (not e!73669))))

(assert (=> b!112297 (= res!92729 (bvsle (bitIndex!0 (size!2316 (buf!2719 (_1!4896 lt!170655))) (currentByte!5285 (_1!4896 lt!170655)) (currentBit!5280 (_1!4896 lt!170655))) (bitIndex!0 (size!2316 (buf!2719 (_2!4896 lt!170655))) (currentByte!5285 (_2!4896 lt!170655)) (currentBit!5280 (_2!4896 lt!170655)))))))

(declare-fun b!112298 () Bool)

(declare-fun e!73670 () Bool)

(assert (=> b!112298 (= e!73669 e!73670)))

(declare-fun res!92728 () Bool)

(assert (=> b!112298 (=> res!92728 e!73670)))

(assert (=> b!112298 (= res!92728 (= (size!2316 (buf!2719 (_1!4896 lt!170655))) #b00000000000000000000000000000000))))

(declare-fun b!112299 () Bool)

(assert (=> b!112299 (= e!73670 (arrayBitRangesEq!0 (buf!2719 (_1!4896 lt!170655)) (buf!2719 (_2!4896 lt!170655)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2316 (buf!2719 (_1!4896 lt!170655))) (currentByte!5285 (_1!4896 lt!170655)) (currentBit!5280 (_1!4896 lt!170655)))))))

(assert (= (and d!35880 res!92727) b!112297))

(assert (= (and b!112297 res!92729) b!112298))

(assert (= (and b!112298 (not res!92728)) b!112299))

(declare-fun m!167767 () Bool)

(assert (=> b!112297 m!167767))

(declare-fun m!167769 () Bool)

(assert (=> b!112297 m!167769))

(assert (=> b!112299 m!167767))

(assert (=> b!112299 m!167767))

(declare-fun m!167771 () Bool)

(assert (=> b!112299 m!167771))

(assert (=> d!35784 d!35880))

(declare-fun d!35882 () Bool)

(assert (=> d!35882 (isPrefixOf!0 (_2!4894 lt!169956) (_2!4894 lt!169956))))

(declare-fun lt!171028 () Unit!6851)

(assert (=> d!35882 (= lt!171028 (choose!11 (_2!4894 lt!169956)))))

(assert (=> d!35882 (= (lemmaIsPrefixRefl!0 (_2!4894 lt!169956)) lt!171028)))

(declare-fun bs!8744 () Bool)

(assert (= bs!8744 d!35882))

(assert (=> bs!8744 m!167467))

(declare-fun m!167773 () Bool)

(assert (=> bs!8744 m!167773))

(assert (=> d!35784 d!35882))

(declare-fun d!35884 () Bool)

(assert (=> d!35884 (isPrefixOf!0 lt!170646 (_2!4894 lt!169962))))

(declare-fun lt!171029 () Unit!6851)

(assert (=> d!35884 (= lt!171029 (choose!30 lt!170646 (_2!4894 lt!169956) (_2!4894 lt!169962)))))

(assert (=> d!35884 (isPrefixOf!0 lt!170646 (_2!4894 lt!169956))))

(assert (=> d!35884 (= (lemmaIsPrefixTransitive!0 lt!170646 (_2!4894 lt!169956) (_2!4894 lt!169962)) lt!171029)))

(declare-fun bs!8745 () Bool)

(assert (= bs!8745 d!35884))

(assert (=> bs!8745 m!167465))

(declare-fun m!167775 () Bool)

(assert (=> bs!8745 m!167775))

(declare-fun m!167777 () Bool)

(assert (=> bs!8745 m!167777))

(assert (=> d!35784 d!35884))

(declare-fun d!35886 () Bool)

(declare-fun res!92730 () Bool)

(declare-fun e!73671 () Bool)

(assert (=> d!35886 (=> (not res!92730) (not e!73671))))

(assert (=> d!35886 (= res!92730 (= (size!2316 (buf!2719 (_2!4894 lt!169962))) (size!2316 (buf!2719 (_2!4894 lt!169962)))))))

(assert (=> d!35886 (= (isPrefixOf!0 (_2!4894 lt!169962) (_2!4894 lt!169962)) e!73671)))

(declare-fun b!112300 () Bool)

(declare-fun res!92732 () Bool)

(assert (=> b!112300 (=> (not res!92732) (not e!73671))))

(assert (=> b!112300 (= res!92732 (bvsle (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!169962))) (currentByte!5285 (_2!4894 lt!169962)) (currentBit!5280 (_2!4894 lt!169962))) (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!169962))) (currentByte!5285 (_2!4894 lt!169962)) (currentBit!5280 (_2!4894 lt!169962)))))))

(declare-fun b!112301 () Bool)

(declare-fun e!73672 () Bool)

(assert (=> b!112301 (= e!73671 e!73672)))

(declare-fun res!92731 () Bool)

(assert (=> b!112301 (=> res!92731 e!73672)))

(assert (=> b!112301 (= res!92731 (= (size!2316 (buf!2719 (_2!4894 lt!169962))) #b00000000000000000000000000000000))))

(declare-fun b!112302 () Bool)

(assert (=> b!112302 (= e!73672 (arrayBitRangesEq!0 (buf!2719 (_2!4894 lt!169962)) (buf!2719 (_2!4894 lt!169962)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!169962))) (currentByte!5285 (_2!4894 lt!169962)) (currentBit!5280 (_2!4894 lt!169962)))))))

(assert (= (and d!35886 res!92730) b!112300))

(assert (= (and b!112300 res!92732) b!112301))

(assert (= (and b!112301 (not res!92731)) b!112302))

(assert (=> b!112300 m!166971))

(assert (=> b!112300 m!166971))

(assert (=> b!112302 m!166971))

(assert (=> b!112302 m!166971))

(declare-fun m!167779 () Bool)

(assert (=> b!112302 m!167779))

(assert (=> d!35784 d!35886))

(declare-fun d!35888 () Bool)

(declare-fun res!92733 () Bool)

(declare-fun e!73673 () Bool)

(assert (=> d!35888 (=> (not res!92733) (not e!73673))))

(assert (=> d!35888 (= res!92733 (= (size!2316 (buf!2719 lt!170646)) (size!2316 (buf!2719 lt!170646))))))

(assert (=> d!35888 (= (isPrefixOf!0 lt!170646 lt!170646) e!73673)))

(declare-fun b!112303 () Bool)

(declare-fun res!92735 () Bool)

(assert (=> b!112303 (=> (not res!92735) (not e!73673))))

(assert (=> b!112303 (= res!92735 (bvsle (bitIndex!0 (size!2316 (buf!2719 lt!170646)) (currentByte!5285 lt!170646) (currentBit!5280 lt!170646)) (bitIndex!0 (size!2316 (buf!2719 lt!170646)) (currentByte!5285 lt!170646) (currentBit!5280 lt!170646))))))

(declare-fun b!112304 () Bool)

(declare-fun e!73674 () Bool)

(assert (=> b!112304 (= e!73673 e!73674)))

(declare-fun res!92734 () Bool)

(assert (=> b!112304 (=> res!92734 e!73674)))

(assert (=> b!112304 (= res!92734 (= (size!2316 (buf!2719 lt!170646)) #b00000000000000000000000000000000))))

(declare-fun b!112305 () Bool)

(assert (=> b!112305 (= e!73674 (arrayBitRangesEq!0 (buf!2719 lt!170646) (buf!2719 lt!170646) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2316 (buf!2719 lt!170646)) (currentByte!5285 lt!170646) (currentBit!5280 lt!170646))))))

(assert (= (and d!35888 res!92733) b!112303))

(assert (= (and b!112303 res!92735) b!112304))

(assert (= (and b!112304 (not res!92734)) b!112305))

(declare-fun m!167781 () Bool)

(assert (=> b!112303 m!167781))

(assert (=> b!112303 m!167781))

(assert (=> b!112305 m!167781))

(assert (=> b!112305 m!167781))

(declare-fun m!167783 () Bool)

(assert (=> b!112305 m!167783))

(assert (=> d!35784 d!35888))

(declare-fun d!35890 () Bool)

(declare-fun res!92736 () Bool)

(declare-fun e!73675 () Bool)

(assert (=> d!35890 (=> (not res!92736) (not e!73675))))

(assert (=> d!35890 (= res!92736 (= (size!2316 (buf!2719 (_2!4894 lt!169956))) (size!2316 (buf!2719 (_2!4894 lt!169962)))))))

(assert (=> d!35890 (= (isPrefixOf!0 (_2!4894 lt!169956) (_2!4894 lt!169962)) e!73675)))

(declare-fun b!112306 () Bool)

(declare-fun res!92738 () Bool)

(assert (=> b!112306 (=> (not res!92738) (not e!73675))))

(assert (=> b!112306 (= res!92738 (bvsle (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!169956))) (currentByte!5285 (_2!4894 lt!169956)) (currentBit!5280 (_2!4894 lt!169956))) (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!169962))) (currentByte!5285 (_2!4894 lt!169962)) (currentBit!5280 (_2!4894 lt!169962)))))))

(declare-fun b!112307 () Bool)

(declare-fun e!73676 () Bool)

(assert (=> b!112307 (= e!73675 e!73676)))

(declare-fun res!92737 () Bool)

(assert (=> b!112307 (=> res!92737 e!73676)))

(assert (=> b!112307 (= res!92737 (= (size!2316 (buf!2719 (_2!4894 lt!169956))) #b00000000000000000000000000000000))))

(declare-fun b!112308 () Bool)

(assert (=> b!112308 (= e!73676 (arrayBitRangesEq!0 (buf!2719 (_2!4894 lt!169956)) (buf!2719 (_2!4894 lt!169962)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!169956))) (currentByte!5285 (_2!4894 lt!169956)) (currentBit!5280 (_2!4894 lt!169956)))))))

(assert (= (and d!35890 res!92736) b!112306))

(assert (= (and b!112306 res!92738) b!112307))

(assert (= (and b!112307 (not res!92737)) b!112308))

(assert (=> b!112306 m!166973))

(assert (=> b!112306 m!166971))

(assert (=> b!112308 m!166973))

(assert (=> b!112308 m!166973))

(declare-fun m!167785 () Bool)

(assert (=> b!112308 m!167785))

(assert (=> d!35784 d!35890))

(declare-fun d!35892 () Bool)

(assert (=> d!35892 (isPrefixOf!0 lt!170646 lt!170646)))

(declare-fun lt!171030 () Unit!6851)

(assert (=> d!35892 (= lt!171030 (choose!11 lt!170646))))

(assert (=> d!35892 (= (lemmaIsPrefixRefl!0 lt!170646) lt!171030)))

(declare-fun bs!8746 () Bool)

(assert (= bs!8746 d!35892))

(assert (=> bs!8746 m!167473))

(declare-fun m!167787 () Bool)

(assert (=> bs!8746 m!167787))

(assert (=> d!35784 d!35892))

(declare-fun d!35894 () Bool)

(declare-fun res!92739 () Bool)

(declare-fun e!73677 () Bool)

(assert (=> d!35894 (=> (not res!92739) (not e!73677))))

(assert (=> d!35894 (= res!92739 (= (size!2316 (buf!2719 lt!170646)) (size!2316 (buf!2719 (_2!4894 lt!169962)))))))

(assert (=> d!35894 (= (isPrefixOf!0 lt!170646 (_2!4894 lt!169962)) e!73677)))

(declare-fun b!112309 () Bool)

(declare-fun res!92741 () Bool)

(assert (=> b!112309 (=> (not res!92741) (not e!73677))))

(assert (=> b!112309 (= res!92741 (bvsle (bitIndex!0 (size!2316 (buf!2719 lt!170646)) (currentByte!5285 lt!170646) (currentBit!5280 lt!170646)) (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!169962))) (currentByte!5285 (_2!4894 lt!169962)) (currentBit!5280 (_2!4894 lt!169962)))))))

(declare-fun b!112310 () Bool)

(declare-fun e!73678 () Bool)

(assert (=> b!112310 (= e!73677 e!73678)))

(declare-fun res!92740 () Bool)

(assert (=> b!112310 (=> res!92740 e!73678)))

(assert (=> b!112310 (= res!92740 (= (size!2316 (buf!2719 lt!170646)) #b00000000000000000000000000000000))))

(declare-fun b!112311 () Bool)

(assert (=> b!112311 (= e!73678 (arrayBitRangesEq!0 (buf!2719 lt!170646) (buf!2719 (_2!4894 lt!169962)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2316 (buf!2719 lt!170646)) (currentByte!5285 lt!170646) (currentBit!5280 lt!170646))))))

(assert (= (and d!35894 res!92739) b!112309))

(assert (= (and b!112309 res!92741) b!112310))

(assert (= (and b!112310 (not res!92740)) b!112311))

(assert (=> b!112309 m!167781))

(assert (=> b!112309 m!166971))

(assert (=> b!112311 m!167781))

(assert (=> b!112311 m!167781))

(declare-fun m!167789 () Bool)

(assert (=> b!112311 m!167789))

(assert (=> d!35784 d!35894))

(declare-fun b!112326 () Bool)

(declare-fun e!73686 () tuple2!9280)

(assert (=> b!112326 (= e!73686 (tuple2!9281 lt!169967 (_1!4896 lt!169961)))))

(declare-fun b!112327 () Bool)

(declare-fun e!73685 () Bool)

(declare-fun e!73687 () Bool)

(assert (=> b!112327 (= e!73685 e!73687)))

(declare-fun res!92753 () Bool)

(assert (=> b!112327 (=> res!92753 e!73687)))

(assert (=> b!112327 (= res!92753 (bvsge i!615 nBits!396))))

(declare-fun b!112329 () Bool)

(declare-fun res!92752 () Bool)

(assert (=> b!112329 (=> (not res!92752) (not e!73685))))

(declare-fun lt!171053 () (_ BitVec 64))

(declare-fun lt!171055 () tuple2!9280)

(declare-fun lt!171057 () (_ BitVec 64))

(assert (=> b!112329 (= res!92752 (= (bvlshr (_1!4900 lt!171055) lt!171057) (bvlshr lt!169967 lt!171053)))))

(assert (=> b!112329 (and (bvsge lt!171053 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!171053 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!112329 (= lt!171053 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (=> b!112329 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000)))))

(assert (=> b!112329 (and (bvsge lt!171057 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!171057 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!112329 (= lt!171057 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (=> b!112329 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000)))))

(declare-fun b!112330 () Bool)

(declare-fun res!92754 () Bool)

(assert (=> b!112330 (=> (not res!92754) (not e!73685))))

(assert (=> b!112330 (= res!92754 (= (bvand (_1!4900 lt!171055) (onesLSBLong!0 nBits!396)) (_1!4900 lt!171055)))))

(declare-fun b!112331 () Bool)

(declare-fun lt!171052 () tuple2!9280)

(assert (=> b!112331 (= e!73686 (tuple2!9281 (_1!4900 lt!171052) (_2!4900 lt!171052)))))

(declare-fun lt!171049 () tuple2!9282)

(assert (=> b!112331 (= lt!171049 (readBit!0 (_1!4896 lt!169961)))))

(assert (=> b!112331 (= lt!171052 (readNLeastSignificantBitsLoop!0 (_2!4901 lt!171049) nBits!396 (bvadd i!615 #b00000000000000000000000000000001) (bvor lt!169967 (ite (_1!4901 lt!171049) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!112332 () Bool)

(declare-fun lt!171054 () (_ BitVec 64))

(assert (=> b!112332 (= e!73687 (= (= (bvand (bvlshr (_1!4900 lt!171055) lt!171054) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!4895 (readBitPure!0 (_1!4896 lt!169961)))))))

(assert (=> b!112332 (and (bvsge lt!171054 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!171054 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!171051 () (_ BitVec 32))

(assert (=> b!112332 (= lt!171054 ((_ sign_extend 32) (bvsub lt!171051 i!615)))))

(assert (=> b!112332 (or (= (bvand lt!171051 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand lt!171051 #b10000000000000000000000000000000) (bvand (bvsub lt!171051 i!615) #b10000000000000000000000000000000)))))

(assert (=> b!112332 (= lt!171051 (bvsub nBits!396 #b00000000000000000000000000000001))))

(assert (=> b!112332 (or (= (bvand nBits!396 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!112328 () Bool)

(declare-fun res!92755 () Bool)

(assert (=> b!112328 (=> (not res!92755) (not e!73685))))

(declare-fun lt!171056 () (_ BitVec 64))

(declare-fun lt!171050 () (_ BitVec 64))

(assert (=> b!112328 (= res!92755 (= (bitIndex!0 (size!2316 (buf!2719 (_2!4900 lt!171055))) (currentByte!5285 (_2!4900 lt!171055)) (currentBit!5280 (_2!4900 lt!171055))) (bvadd lt!171050 lt!171056)))))

(assert (=> b!112328 (or (not (= (bvand lt!171050 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171056 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!171050 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!171050 lt!171056) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112328 (= lt!171056 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (=> b!112328 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000)))))

(assert (=> b!112328 (= lt!171050 (bitIndex!0 (size!2316 (buf!2719 (_1!4896 lt!169961))) (currentByte!5285 (_1!4896 lt!169961)) (currentBit!5280 (_1!4896 lt!169961))))))

(declare-fun d!35896 () Bool)

(assert (=> d!35896 e!73685))

(declare-fun res!92756 () Bool)

(assert (=> d!35896 (=> (not res!92756) (not e!73685))))

(assert (=> d!35896 (= res!92756 (= (buf!2719 (_2!4900 lt!171055)) (buf!2719 (_1!4896 lt!169961))))))

(assert (=> d!35896 (= lt!171055 e!73686)))

(declare-fun c!6839 () Bool)

(assert (=> d!35896 (= c!6839 (= nBits!396 i!615))))

(assert (=> d!35896 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!35896 (= (readNLeastSignificantBitsLoop!0 (_1!4896 lt!169961) nBits!396 i!615 lt!169967) lt!171055)))

(assert (= (and d!35896 c!6839) b!112326))

(assert (= (and d!35896 (not c!6839)) b!112331))

(assert (= (and d!35896 res!92756) b!112328))

(assert (= (and b!112328 res!92755) b!112329))

(assert (= (and b!112329 res!92752) b!112330))

(assert (= (and b!112330 res!92754) b!112327))

(assert (= (and b!112327 (not res!92753)) b!112332))

(assert (=> b!112330 m!166993))

(assert (=> b!112331 m!167079))

(declare-fun m!167791 () Bool)

(assert (=> b!112331 m!167791))

(assert (=> b!112332 m!166935))

(declare-fun m!167793 () Bool)

(assert (=> b!112328 m!167793))

(assert (=> b!112328 m!167065))

(assert (=> d!35728 d!35896))

(declare-fun d!35898 () Bool)

(assert (=> d!35898 (= (remainingBits!0 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!169956)))) ((_ sign_extend 32) (currentByte!5285 (_2!4894 lt!169956))) ((_ sign_extend 32) (currentBit!5280 (_2!4894 lt!169956)))) (bvsub (bvmul ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!169956)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5285 (_2!4894 lt!169956))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5280 (_2!4894 lt!169956))))))))

(assert (=> d!35688 d!35898))

(declare-fun d!35900 () Bool)

(assert (=> d!35900 (= (invariant!0 (currentBit!5280 (_2!4894 lt!169956)) (currentByte!5285 (_2!4894 lt!169956)) (size!2316 (buf!2719 (_2!4894 lt!169956)))) (and (bvsge (currentBit!5280 (_2!4894 lt!169956)) #b00000000000000000000000000000000) (bvslt (currentBit!5280 (_2!4894 lt!169956)) #b00000000000000000000000000001000) (bvsge (currentByte!5285 (_2!4894 lt!169956)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5285 (_2!4894 lt!169956)) (size!2316 (buf!2719 (_2!4894 lt!169956)))) (and (= (currentBit!5280 (_2!4894 lt!169956)) #b00000000000000000000000000000000) (= (currentByte!5285 (_2!4894 lt!169956)) (size!2316 (buf!2719 (_2!4894 lt!169956))))))))))

(assert (=> d!35688 d!35900))

(assert (=> d!35724 d!35780))

(declare-fun d!35902 () Bool)

(assert (=> d!35902 (isPrefixOf!0 thiss!1305 (_2!4894 lt!169962))))

(assert (=> d!35902 true))

(declare-fun _$15!180 () Unit!6851)

(assert (=> d!35902 (= (choose!30 thiss!1305 (_2!4894 lt!169956) (_2!4894 lt!169962)) _$15!180)))

(declare-fun bs!8747 () Bool)

(assert (= bs!8747 d!35902))

(assert (=> bs!8747 m!166963))

(assert (=> d!35724 d!35902))

(assert (=> d!35724 d!35700))

(declare-fun d!35904 () Bool)

(declare-fun e!73688 () Bool)

(assert (=> d!35904 e!73688))

(declare-fun res!92757 () Bool)

(assert (=> d!35904 (=> (not res!92757) (not e!73688))))

(declare-fun lt!171062 () (_ BitVec 64))

(declare-fun lt!171058 () (_ BitVec 64))

(declare-fun lt!171063 () (_ BitVec 64))

(assert (=> d!35904 (= res!92757 (= lt!171058 (bvsub lt!171062 lt!171063)))))

(assert (=> d!35904 (or (= (bvand lt!171062 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171063 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!171062 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!171062 lt!171063) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35904 (= lt!171063 (remainingBits!0 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!170604)))) ((_ sign_extend 32) (currentByte!5285 (_2!4894 lt!170604))) ((_ sign_extend 32) (currentBit!5280 (_2!4894 lt!170604)))))))

(declare-fun lt!171061 () (_ BitVec 64))

(declare-fun lt!171060 () (_ BitVec 64))

(assert (=> d!35904 (= lt!171062 (bvmul lt!171061 lt!171060))))

(assert (=> d!35904 (or (= lt!171061 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!171060 (bvsdiv (bvmul lt!171061 lt!171060) lt!171061)))))

(assert (=> d!35904 (= lt!171060 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35904 (= lt!171061 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!170604)))))))

(assert (=> d!35904 (= lt!171058 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5285 (_2!4894 lt!170604))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5280 (_2!4894 lt!170604)))))))

(assert (=> d!35904 (invariant!0 (currentBit!5280 (_2!4894 lt!170604)) (currentByte!5285 (_2!4894 lt!170604)) (size!2316 (buf!2719 (_2!4894 lt!170604))))))

(assert (=> d!35904 (= (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!170604))) (currentByte!5285 (_2!4894 lt!170604)) (currentBit!5280 (_2!4894 lt!170604))) lt!171058)))

(declare-fun b!112333 () Bool)

(declare-fun res!92758 () Bool)

(assert (=> b!112333 (=> (not res!92758) (not e!73688))))

(assert (=> b!112333 (= res!92758 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!171058))))

(declare-fun b!112334 () Bool)

(declare-fun lt!171059 () (_ BitVec 64))

(assert (=> b!112334 (= e!73688 (bvsle lt!171058 (bvmul lt!171059 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112334 (or (= lt!171059 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!171059 #b0000000000000000000000000000000000000000000000000000000000001000) lt!171059)))))

(assert (=> b!112334 (= lt!171059 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!170604)))))))

(assert (= (and d!35904 res!92757) b!112333))

(assert (= (and b!112333 res!92758) b!112334))

(declare-fun m!167795 () Bool)

(assert (=> d!35904 m!167795))

(declare-fun m!167797 () Bool)

(assert (=> d!35904 m!167797))

(assert (=> b!112137 d!35904))

(assert (=> b!112137 d!35688))

(declare-fun d!35906 () Bool)

(declare-fun e!73691 () Bool)

(assert (=> d!35906 e!73691))

(declare-fun res!92761 () Bool)

(assert (=> d!35906 (=> (not res!92761) (not e!73691))))

(declare-fun lt!171071 () tuple2!9270)

(declare-fun lt!171070 () tuple2!9270)

(assert (=> d!35906 (= res!92761 (= (bitIndex!0 (size!2316 (buf!2719 (_1!4895 lt!171071))) (currentByte!5285 (_1!4895 lt!171071)) (currentBit!5280 (_1!4895 lt!171071))) (bitIndex!0 (size!2316 (buf!2719 (_1!4895 lt!171070))) (currentByte!5285 (_1!4895 lt!171070)) (currentBit!5280 (_1!4895 lt!171070)))))))

(declare-fun lt!171072 () BitStream!4106)

(assert (=> d!35906 (= lt!171070 (readBitPure!0 lt!171072))))

(assert (=> d!35906 (= lt!171071 (readBitPure!0 lt!169971))))

(assert (=> d!35906 (= lt!171072 (BitStream!4107 (buf!2719 (_2!4894 lt!169962)) (currentByte!5285 lt!169971) (currentBit!5280 lt!169971)))))

(assert (=> d!35906 (invariant!0 (currentBit!5280 lt!169971) (currentByte!5285 lt!169971) (size!2316 (buf!2719 (_2!4894 lt!169962))))))

(assert (=> d!35906 true))

(declare-fun _$9!54 () Unit!6851)

(assert (=> d!35906 (= (choose!50 lt!169971 (_2!4894 lt!169962) lt!170265 lt!170264 (tuple2!9271 (_1!4895 lt!170264) (_2!4895 lt!170264)) (_1!4895 lt!170264) (_2!4895 lt!170264) lt!170263 (tuple2!9271 (_1!4895 lt!170263) (_2!4895 lt!170263)) (_1!4895 lt!170263) (_2!4895 lt!170263)) _$9!54)))

(declare-fun b!112337 () Bool)

(assert (=> b!112337 (= e!73691 (= (_2!4895 lt!171071) (_2!4895 lt!171070)))))

(assert (= (and d!35906 res!92761) b!112337))

(declare-fun m!167799 () Bool)

(assert (=> d!35906 m!167799))

(declare-fun m!167801 () Bool)

(assert (=> d!35906 m!167801))

(declare-fun m!167803 () Bool)

(assert (=> d!35906 m!167803))

(assert (=> d!35906 m!166943))

(assert (=> d!35906 m!167131))

(assert (=> d!35732 d!35906))

(declare-fun d!35908 () Bool)

(declare-fun lt!171073 () tuple2!9282)

(assert (=> d!35908 (= lt!171073 (readBit!0 lt!170265))))

(assert (=> d!35908 (= (readBitPure!0 lt!170265) (tuple2!9271 (_2!4901 lt!171073) (_1!4901 lt!171073)))))

(declare-fun bs!8748 () Bool)

(assert (= bs!8748 d!35908))

(declare-fun m!167805 () Bool)

(assert (=> bs!8748 m!167805))

(assert (=> d!35732 d!35908))

(declare-fun d!35910 () Bool)

(declare-fun e!73692 () Bool)

(assert (=> d!35910 e!73692))

(declare-fun res!92762 () Bool)

(assert (=> d!35910 (=> (not res!92762) (not e!73692))))

(declare-fun lt!171079 () (_ BitVec 64))

(declare-fun lt!171074 () (_ BitVec 64))

(declare-fun lt!171078 () (_ BitVec 64))

(assert (=> d!35910 (= res!92762 (= lt!171074 (bvsub lt!171078 lt!171079)))))

(assert (=> d!35910 (or (= (bvand lt!171078 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171079 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!171078 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!171078 lt!171079) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35910 (= lt!171079 (remainingBits!0 ((_ sign_extend 32) (size!2316 (buf!2719 (_1!4895 lt!170263)))) ((_ sign_extend 32) (currentByte!5285 (_1!4895 lt!170263))) ((_ sign_extend 32) (currentBit!5280 (_1!4895 lt!170263)))))))

(declare-fun lt!171077 () (_ BitVec 64))

(declare-fun lt!171076 () (_ BitVec 64))

(assert (=> d!35910 (= lt!171078 (bvmul lt!171077 lt!171076))))

(assert (=> d!35910 (or (= lt!171077 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!171076 (bvsdiv (bvmul lt!171077 lt!171076) lt!171077)))))

(assert (=> d!35910 (= lt!171076 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35910 (= lt!171077 ((_ sign_extend 32) (size!2316 (buf!2719 (_1!4895 lt!170263)))))))

(assert (=> d!35910 (= lt!171074 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5285 (_1!4895 lt!170263))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5280 (_1!4895 lt!170263)))))))

(assert (=> d!35910 (invariant!0 (currentBit!5280 (_1!4895 lt!170263)) (currentByte!5285 (_1!4895 lt!170263)) (size!2316 (buf!2719 (_1!4895 lt!170263))))))

(assert (=> d!35910 (= (bitIndex!0 (size!2316 (buf!2719 (_1!4895 lt!170263))) (currentByte!5285 (_1!4895 lt!170263)) (currentBit!5280 (_1!4895 lt!170263))) lt!171074)))

(declare-fun b!112338 () Bool)

(declare-fun res!92763 () Bool)

(assert (=> b!112338 (=> (not res!92763) (not e!73692))))

(assert (=> b!112338 (= res!92763 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!171074))))

(declare-fun b!112339 () Bool)

(declare-fun lt!171075 () (_ BitVec 64))

(assert (=> b!112339 (= e!73692 (bvsle lt!171074 (bvmul lt!171075 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112339 (or (= lt!171075 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!171075 #b0000000000000000000000000000000000000000000000000000000000001000) lt!171075)))))

(assert (=> b!112339 (= lt!171075 ((_ sign_extend 32) (size!2316 (buf!2719 (_1!4895 lt!170263)))))))

(assert (= (and d!35910 res!92762) b!112338))

(assert (= (and b!112338 res!92763) b!112339))

(declare-fun m!167807 () Bool)

(assert (=> d!35910 m!167807))

(declare-fun m!167809 () Bool)

(assert (=> d!35910 m!167809))

(assert (=> d!35732 d!35910))

(declare-fun d!35912 () Bool)

(declare-fun e!73693 () Bool)

(assert (=> d!35912 e!73693))

(declare-fun res!92764 () Bool)

(assert (=> d!35912 (=> (not res!92764) (not e!73693))))

(declare-fun lt!171084 () (_ BitVec 64))

(declare-fun lt!171085 () (_ BitVec 64))

(declare-fun lt!171080 () (_ BitVec 64))

(assert (=> d!35912 (= res!92764 (= lt!171080 (bvsub lt!171084 lt!171085)))))

(assert (=> d!35912 (or (= (bvand lt!171084 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171085 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!171084 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!171084 lt!171085) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35912 (= lt!171085 (remainingBits!0 ((_ sign_extend 32) (size!2316 (buf!2719 (_1!4895 lt!170264)))) ((_ sign_extend 32) (currentByte!5285 (_1!4895 lt!170264))) ((_ sign_extend 32) (currentBit!5280 (_1!4895 lt!170264)))))))

(declare-fun lt!171083 () (_ BitVec 64))

(declare-fun lt!171082 () (_ BitVec 64))

(assert (=> d!35912 (= lt!171084 (bvmul lt!171083 lt!171082))))

(assert (=> d!35912 (or (= lt!171083 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!171082 (bvsdiv (bvmul lt!171083 lt!171082) lt!171083)))))

(assert (=> d!35912 (= lt!171082 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35912 (= lt!171083 ((_ sign_extend 32) (size!2316 (buf!2719 (_1!4895 lt!170264)))))))

(assert (=> d!35912 (= lt!171080 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5285 (_1!4895 lt!170264))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5280 (_1!4895 lt!170264)))))))

(assert (=> d!35912 (invariant!0 (currentBit!5280 (_1!4895 lt!170264)) (currentByte!5285 (_1!4895 lt!170264)) (size!2316 (buf!2719 (_1!4895 lt!170264))))))

(assert (=> d!35912 (= (bitIndex!0 (size!2316 (buf!2719 (_1!4895 lt!170264))) (currentByte!5285 (_1!4895 lt!170264)) (currentBit!5280 (_1!4895 lt!170264))) lt!171080)))

(declare-fun b!112340 () Bool)

(declare-fun res!92765 () Bool)

(assert (=> b!112340 (=> (not res!92765) (not e!73693))))

(assert (=> b!112340 (= res!92765 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!171080))))

(declare-fun b!112341 () Bool)

(declare-fun lt!171081 () (_ BitVec 64))

(assert (=> b!112341 (= e!73693 (bvsle lt!171080 (bvmul lt!171081 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112341 (or (= lt!171081 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!171081 #b0000000000000000000000000000000000000000000000000000000000001000) lt!171081)))))

(assert (=> b!112341 (= lt!171081 ((_ sign_extend 32) (size!2316 (buf!2719 (_1!4895 lt!170264)))))))

(assert (= (and d!35912 res!92764) b!112340))

(assert (= (and b!112340 res!92765) b!112341))

(declare-fun m!167811 () Bool)

(assert (=> d!35912 m!167811))

(declare-fun m!167813 () Bool)

(assert (=> d!35912 m!167813))

(assert (=> d!35732 d!35912))

(declare-fun d!35914 () Bool)

(assert (=> d!35914 (= (invariant!0 (currentBit!5280 lt!169971) (currentByte!5285 lt!169971) (size!2316 (buf!2719 (_2!4894 lt!169962)))) (and (bvsge (currentBit!5280 lt!169971) #b00000000000000000000000000000000) (bvslt (currentBit!5280 lt!169971) #b00000000000000000000000000001000) (bvsge (currentByte!5285 lt!169971) #b00000000000000000000000000000000) (or (bvslt (currentByte!5285 lt!169971) (size!2316 (buf!2719 (_2!4894 lt!169962)))) (and (= (currentBit!5280 lt!169971) #b00000000000000000000000000000000) (= (currentByte!5285 lt!169971) (size!2316 (buf!2719 (_2!4894 lt!169962))))))))))

(assert (=> d!35732 d!35914))

(assert (=> d!35732 d!35726))

(declare-fun b!112342 () Bool)

(declare-fun e!73696 () Bool)

(declare-fun e!73698 () Bool)

(assert (=> b!112342 (= e!73696 e!73698)))

(declare-fun res!92768 () Bool)

(declare-fun call!1429 () Bool)

(assert (=> b!112342 (= res!92768 call!1429)))

(assert (=> b!112342 (=> (not res!92768) (not e!73698))))

(declare-fun b!112343 () Bool)

(declare-fun e!73697 () Bool)

(declare-fun e!73694 () Bool)

(assert (=> b!112343 (= e!73697 e!73694)))

(declare-fun res!92767 () Bool)

(assert (=> b!112343 (=> (not res!92767) (not e!73694))))

(declare-fun e!73699 () Bool)

(assert (=> b!112343 (= res!92767 e!73699)))

(declare-fun res!92770 () Bool)

(assert (=> b!112343 (=> res!92770 e!73699)))

(declare-fun lt!171086 () tuple4!78)

(assert (=> b!112343 (= res!92770 (bvsge (_1!4904 lt!171086) (_2!4904 lt!171086)))))

(declare-fun lt!171088 () (_ BitVec 32))

(assert (=> b!112343 (= lt!171088 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2316 (buf!2719 thiss!1305)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!171087 () (_ BitVec 32))

(assert (=> b!112343 (= lt!171087 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112343 (= lt!171086 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2316 (buf!2719 thiss!1305)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305))))))

(declare-fun b!112344 () Bool)

(declare-fun res!92766 () Bool)

(assert (=> b!112344 (= res!92766 (= lt!171088 #b00000000000000000000000000000000))))

(declare-fun e!73695 () Bool)

(assert (=> b!112344 (=> res!92766 e!73695)))

(assert (=> b!112344 (= e!73698 e!73695)))

(declare-fun c!6840 () Bool)

(declare-fun bm!1426 () Bool)

(assert (=> bm!1426 (= call!1429 (byteRangesEq!0 (select (arr!2909 (buf!2719 thiss!1305)) (_3!260 lt!171086)) (select (arr!2909 (buf!2719 (_2!4894 lt!169962))) (_3!260 lt!171086)) lt!171087 (ite c!6840 lt!171088 #b00000000000000000000000000001000)))))

(declare-fun d!35916 () Bool)

(declare-fun res!92769 () Bool)

(assert (=> d!35916 (=> res!92769 e!73697)))

(assert (=> d!35916 (= res!92769 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2316 (buf!2719 thiss!1305)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305))))))

(assert (=> d!35916 (= (arrayBitRangesEq!0 (buf!2719 thiss!1305) (buf!2719 (_2!4894 lt!169962)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2316 (buf!2719 thiss!1305)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305))) e!73697)))

(declare-fun b!112345 () Bool)

(assert (=> b!112345 (= e!73699 (arrayRangesEq!40 (buf!2719 thiss!1305) (buf!2719 (_2!4894 lt!169962)) (_1!4904 lt!171086) (_2!4904 lt!171086)))))

(declare-fun b!112346 () Bool)

(assert (=> b!112346 (= e!73696 call!1429)))

(declare-fun b!112347 () Bool)

(assert (=> b!112347 (= e!73694 e!73696)))

(assert (=> b!112347 (= c!6840 (= (_3!260 lt!171086) (_4!39 lt!171086)))))

(declare-fun b!112348 () Bool)

(assert (=> b!112348 (= e!73695 (byteRangesEq!0 (select (arr!2909 (buf!2719 thiss!1305)) (_4!39 lt!171086)) (select (arr!2909 (buf!2719 (_2!4894 lt!169962))) (_4!39 lt!171086)) #b00000000000000000000000000000000 lt!171088))))

(assert (= (and d!35916 (not res!92769)) b!112343))

(assert (= (and b!112343 (not res!92770)) b!112345))

(assert (= (and b!112343 res!92767) b!112347))

(assert (= (and b!112347 c!6840) b!112346))

(assert (= (and b!112347 (not c!6840)) b!112342))

(assert (= (and b!112342 res!92768) b!112344))

(assert (= (and b!112344 (not res!92766)) b!112348))

(assert (= (or b!112346 b!112342) bm!1426))

(assert (=> b!112343 m!166979))

(assert (=> b!112343 m!167735))

(declare-fun m!167815 () Bool)

(assert (=> bm!1426 m!167815))

(declare-fun m!167817 () Bool)

(assert (=> bm!1426 m!167817))

(assert (=> bm!1426 m!167815))

(assert (=> bm!1426 m!167817))

(declare-fun m!167819 () Bool)

(assert (=> bm!1426 m!167819))

(declare-fun m!167821 () Bool)

(assert (=> b!112345 m!167821))

(declare-fun m!167823 () Bool)

(assert (=> b!112348 m!167823))

(declare-fun m!167825 () Bool)

(assert (=> b!112348 m!167825))

(assert (=> b!112348 m!167823))

(assert (=> b!112348 m!167825))

(declare-fun m!167827 () Bool)

(assert (=> b!112348 m!167827))

(assert (=> b!112152 d!35916))

(assert (=> b!112152 d!35696))

(assert (=> d!35704 d!35900))

(declare-fun d!35918 () Bool)

(declare-fun e!73700 () Bool)

(assert (=> d!35918 e!73700))

(declare-fun res!92771 () Bool)

(assert (=> d!35918 (=> (not res!92771) (not e!73700))))

(declare-fun lt!171089 () (_ BitVec 64))

(declare-fun lt!171093 () (_ BitVec 64))

(declare-fun lt!171094 () (_ BitVec 64))

(assert (=> d!35918 (= res!92771 (= lt!171089 (bvsub lt!171093 lt!171094)))))

(assert (=> d!35918 (or (= (bvand lt!171093 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171094 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!171093 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!171093 lt!171094) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35918 (= lt!171094 (remainingBits!0 ((_ sign_extend 32) (size!2316 (buf!2719 lt!170058))) ((_ sign_extend 32) (currentByte!5285 lt!170058)) ((_ sign_extend 32) (currentBit!5280 lt!170058))))))

(declare-fun lt!171092 () (_ BitVec 64))

(declare-fun lt!171091 () (_ BitVec 64))

(assert (=> d!35918 (= lt!171093 (bvmul lt!171092 lt!171091))))

(assert (=> d!35918 (or (= lt!171092 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!171091 (bvsdiv (bvmul lt!171092 lt!171091) lt!171092)))))

(assert (=> d!35918 (= lt!171091 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35918 (= lt!171092 ((_ sign_extend 32) (size!2316 (buf!2719 lt!170058))))))

(assert (=> d!35918 (= lt!171089 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5285 lt!170058)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5280 lt!170058))))))

(assert (=> d!35918 (invariant!0 (currentBit!5280 lt!170058) (currentByte!5285 lt!170058) (size!2316 (buf!2719 lt!170058)))))

(assert (=> d!35918 (= (bitIndex!0 (size!2316 (buf!2719 lt!170058)) (currentByte!5285 lt!170058) (currentBit!5280 lt!170058)) lt!171089)))

(declare-fun b!112349 () Bool)

(declare-fun res!92772 () Bool)

(assert (=> b!112349 (=> (not res!92772) (not e!73700))))

(assert (=> b!112349 (= res!92772 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!171089))))

(declare-fun b!112350 () Bool)

(declare-fun lt!171090 () (_ BitVec 64))

(assert (=> b!112350 (= e!73700 (bvsle lt!171089 (bvmul lt!171090 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112350 (or (= lt!171090 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!171090 #b0000000000000000000000000000000000000000000000000000000000001000) lt!171090)))))

(assert (=> b!112350 (= lt!171090 ((_ sign_extend 32) (size!2316 (buf!2719 lt!170058))))))

(assert (= (and d!35918 res!92771) b!112349))

(assert (= (and b!112349 res!92772) b!112350))

(declare-fun m!167829 () Bool)

(assert (=> d!35918 m!167829))

(declare-fun m!167831 () Bool)

(assert (=> d!35918 m!167831))

(assert (=> d!35686 d!35918))

(declare-fun d!35920 () Bool)

(declare-fun e!73701 () Bool)

(assert (=> d!35920 e!73701))

(declare-fun res!92773 () Bool)

(assert (=> d!35920 (=> (not res!92773) (not e!73701))))

(declare-fun lt!171100 () (_ BitVec 64))

(declare-fun lt!171095 () (_ BitVec 64))

(declare-fun lt!171099 () (_ BitVec 64))

(assert (=> d!35920 (= res!92773 (= lt!171095 (bvsub lt!171099 lt!171100)))))

(assert (=> d!35920 (or (= (bvand lt!171099 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171100 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!171099 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!171099 lt!171100) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35920 (= lt!171100 (remainingBits!0 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4896 lt!169961)))) ((_ sign_extend 32) (currentByte!5285 (_2!4896 lt!169961))) ((_ sign_extend 32) (currentBit!5280 (_2!4896 lt!169961)))))))

(declare-fun lt!171098 () (_ BitVec 64))

(declare-fun lt!171097 () (_ BitVec 64))

(assert (=> d!35920 (= lt!171099 (bvmul lt!171098 lt!171097))))

(assert (=> d!35920 (or (= lt!171098 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!171097 (bvsdiv (bvmul lt!171098 lt!171097) lt!171098)))))

(assert (=> d!35920 (= lt!171097 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35920 (= lt!171098 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4896 lt!169961)))))))

(assert (=> d!35920 (= lt!171095 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5285 (_2!4896 lt!169961))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5280 (_2!4896 lt!169961)))))))

(assert (=> d!35920 (invariant!0 (currentBit!5280 (_2!4896 lt!169961)) (currentByte!5285 (_2!4896 lt!169961)) (size!2316 (buf!2719 (_2!4896 lt!169961))))))

(assert (=> d!35920 (= (bitIndex!0 (size!2316 (buf!2719 (_2!4896 lt!169961))) (currentByte!5285 (_2!4896 lt!169961)) (currentBit!5280 (_2!4896 lt!169961))) lt!171095)))

(declare-fun b!112351 () Bool)

(declare-fun res!92774 () Bool)

(assert (=> b!112351 (=> (not res!92774) (not e!73701))))

(assert (=> b!112351 (= res!92774 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!171095))))

(declare-fun b!112352 () Bool)

(declare-fun lt!171096 () (_ BitVec 64))

(assert (=> b!112352 (= e!73701 (bvsle lt!171095 (bvmul lt!171096 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112352 (or (= lt!171096 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!171096 #b0000000000000000000000000000000000000000000000000000000000001000) lt!171096)))))

(assert (=> b!112352 (= lt!171096 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4896 lt!169961)))))))

(assert (= (and d!35920 res!92773) b!112351))

(assert (= (and b!112351 res!92774) b!112352))

(declare-fun m!167833 () Bool)

(assert (=> d!35920 m!167833))

(declare-fun m!167835 () Bool)

(assert (=> d!35920 m!167835))

(assert (=> d!35686 d!35920))

(declare-fun d!35922 () Bool)

(declare-fun lt!171103 () (_ BitVec 32))

(assert (=> d!35922 (= lt!171103 ((_ extract 31 0) (bvsrem (bvsub lt!169958 lt!169973) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!171102 () (_ BitVec 32))

(assert (=> d!35922 (= lt!171102 ((_ extract 31 0) (bvsdiv (bvsub lt!169958 lt!169973) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!73702 () Bool)

(assert (=> d!35922 e!73702))

(declare-fun res!92775 () Bool)

(assert (=> d!35922 (=> (not res!92775) (not e!73702))))

(assert (=> d!35922 (= res!92775 (moveBitIndexPrecond!0 (_2!4896 lt!169961) (bvsub lt!169958 lt!169973)))))

(declare-fun Unit!6883 () Unit!6851)

(declare-fun Unit!6884 () Unit!6851)

(declare-fun Unit!6885 () Unit!6851)

(assert (=> d!35922 (= (moveBitIndex!0 (_2!4896 lt!169961) (bvsub lt!169958 lt!169973)) (ite (bvslt (bvadd (currentBit!5280 (_2!4896 lt!169961)) lt!171103) #b00000000000000000000000000000000) (tuple2!9269 Unit!6883 (BitStream!4107 (buf!2719 (_2!4896 lt!169961)) (bvsub (bvadd (currentByte!5285 (_2!4896 lt!169961)) lt!171102) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!171103 (currentBit!5280 (_2!4896 lt!169961))))) (ite (bvsge (bvadd (currentBit!5280 (_2!4896 lt!169961)) lt!171103) #b00000000000000000000000000001000) (tuple2!9269 Unit!6884 (BitStream!4107 (buf!2719 (_2!4896 lt!169961)) (bvadd (currentByte!5285 (_2!4896 lt!169961)) lt!171102 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!5280 (_2!4896 lt!169961)) lt!171103) #b00000000000000000000000000001000))) (tuple2!9269 Unit!6885 (BitStream!4107 (buf!2719 (_2!4896 lt!169961)) (bvadd (currentByte!5285 (_2!4896 lt!169961)) lt!171102) (bvadd (currentBit!5280 (_2!4896 lt!169961)) lt!171103))))))))

(declare-fun b!112353 () Bool)

(declare-fun e!73703 () Bool)

(assert (=> b!112353 (= e!73702 e!73703)))

(declare-fun res!92776 () Bool)

(assert (=> b!112353 (=> (not res!92776) (not e!73703))))

(declare-fun lt!171101 () tuple2!9268)

(declare-fun lt!171104 () (_ BitVec 64))

(assert (=> b!112353 (= res!92776 (= (bvadd lt!171104 (bvsub lt!169958 lt!169973)) (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!171101))) (currentByte!5285 (_2!4894 lt!171101)) (currentBit!5280 (_2!4894 lt!171101)))))))

(assert (=> b!112353 (or (not (= (bvand lt!171104 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!169958 lt!169973) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!171104 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!171104 (bvsub lt!169958 lt!169973)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112353 (= lt!171104 (bitIndex!0 (size!2316 (buf!2719 (_2!4896 lt!169961))) (currentByte!5285 (_2!4896 lt!169961)) (currentBit!5280 (_2!4896 lt!169961))))))

(declare-fun lt!171105 () (_ BitVec 32))

(declare-fun lt!171106 () (_ BitVec 32))

(declare-fun Unit!6886 () Unit!6851)

(declare-fun Unit!6887 () Unit!6851)

(declare-fun Unit!6888 () Unit!6851)

(assert (=> b!112353 (= lt!171101 (ite (bvslt (bvadd (currentBit!5280 (_2!4896 lt!169961)) lt!171105) #b00000000000000000000000000000000) (tuple2!9269 Unit!6886 (BitStream!4107 (buf!2719 (_2!4896 lt!169961)) (bvsub (bvadd (currentByte!5285 (_2!4896 lt!169961)) lt!171106) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!171105 (currentBit!5280 (_2!4896 lt!169961))))) (ite (bvsge (bvadd (currentBit!5280 (_2!4896 lt!169961)) lt!171105) #b00000000000000000000000000001000) (tuple2!9269 Unit!6887 (BitStream!4107 (buf!2719 (_2!4896 lt!169961)) (bvadd (currentByte!5285 (_2!4896 lt!169961)) lt!171106 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!5280 (_2!4896 lt!169961)) lt!171105) #b00000000000000000000000000001000))) (tuple2!9269 Unit!6888 (BitStream!4107 (buf!2719 (_2!4896 lt!169961)) (bvadd (currentByte!5285 (_2!4896 lt!169961)) lt!171106) (bvadd (currentBit!5280 (_2!4896 lt!169961)) lt!171105))))))))

(assert (=> b!112353 (= lt!171105 ((_ extract 31 0) (bvsrem (bvsub lt!169958 lt!169973) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112353 (= lt!171106 ((_ extract 31 0) (bvsdiv (bvsub lt!169958 lt!169973) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!112354 () Bool)

(assert (=> b!112354 (= e!73703 (and (= (size!2316 (buf!2719 (_2!4896 lt!169961))) (size!2316 (buf!2719 (_2!4894 lt!171101)))) (= (buf!2719 (_2!4896 lt!169961)) (buf!2719 (_2!4894 lt!171101)))))))

(assert (= (and d!35922 res!92775) b!112353))

(assert (= (and b!112353 res!92776) b!112354))

(assert (=> d!35922 m!167045))

(declare-fun m!167837 () Bool)

(assert (=> b!112353 m!167837))

(assert (=> b!112353 m!167041))

(assert (=> d!35686 d!35922))

(declare-fun d!35924 () Bool)

(declare-fun res!92777 () Bool)

(declare-fun e!73704 () Bool)

(assert (=> d!35924 (=> (not res!92777) (not e!73704))))

(assert (=> d!35924 (= res!92777 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4896 lt!169961))))) (bvsub lt!169958 lt!169973)) (bvsle (bvsub lt!169958 lt!169973) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4896 lt!169961))))))))))

(assert (=> d!35924 (= (moveBitIndexPrecond!0 (_2!4896 lt!169961) (bvsub lt!169958 lt!169973)) e!73704)))

(declare-fun b!112355 () Bool)

(declare-fun lt!171107 () (_ BitVec 64))

(assert (=> b!112355 (= e!73704 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!171107) (bvsle lt!171107 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4896 lt!169961))))))))))

(assert (=> b!112355 (= lt!171107 (bvadd (bitIndex!0 (size!2316 (buf!2719 (_2!4896 lt!169961))) (currentByte!5285 (_2!4896 lt!169961)) (currentBit!5280 (_2!4896 lt!169961))) (bvsub lt!169958 lt!169973)))))

(assert (= (and d!35924 res!92777) b!112355))

(assert (=> b!112355 m!167041))

(assert (=> d!35686 d!35924))

(declare-fun d!35926 () Bool)

(assert (=> d!35926 (= (remainingBits!0 ((_ sign_extend 32) (size!2316 (buf!2719 thiss!1305))) ((_ sign_extend 32) (currentByte!5285 thiss!1305)) ((_ sign_extend 32) (currentBit!5280 thiss!1305))) (bvsub (bvmul ((_ sign_extend 32) (size!2316 (buf!2719 thiss!1305))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5285 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5280 thiss!1305)))))))

(assert (=> d!35696 d!35926))

(declare-fun d!35928 () Bool)

(assert (=> d!35928 (= (invariant!0 (currentBit!5280 thiss!1305) (currentByte!5285 thiss!1305) (size!2316 (buf!2719 thiss!1305))) (and (bvsge (currentBit!5280 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5280 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5285 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5285 thiss!1305) (size!2316 (buf!2719 thiss!1305))) (and (= (currentBit!5280 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5285 thiss!1305) (size!2316 (buf!2719 thiss!1305)))))))))

(assert (=> d!35696 d!35928))

(declare-fun d!35930 () Bool)

(declare-fun e!73711 () Bool)

(assert (=> d!35930 e!73711))

(declare-fun res!92780 () Bool)

(assert (=> d!35930 (=> (not res!92780) (not e!73711))))

(declare-fun increaseBitIndex!0 (BitStream!4106) tuple2!9268)

(assert (=> d!35930 (= res!92780 (= (buf!2719 (_2!4894 (increaseBitIndex!0 lt!169971))) (buf!2719 lt!169971)))))

(declare-fun lt!171125 () Bool)

(assert (=> d!35930 (= lt!171125 (not (= (bvand ((_ sign_extend 24) (select (arr!2909 (buf!2719 lt!169971)) (currentByte!5285 lt!169971))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5280 lt!169971)))) #b00000000000000000000000000000000)))))

(declare-fun lt!171124 () tuple2!9282)

(assert (=> d!35930 (= lt!171124 (tuple2!9283 (not (= (bvand ((_ sign_extend 24) (select (arr!2909 (buf!2719 lt!169971)) (currentByte!5285 lt!169971))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5280 lt!169971)))) #b00000000000000000000000000000000)) (_2!4894 (increaseBitIndex!0 lt!169971))))))

(assert (=> d!35930 (validate_offset_bit!0 ((_ sign_extend 32) (size!2316 (buf!2719 lt!169971))) ((_ sign_extend 32) (currentByte!5285 lt!169971)) ((_ sign_extend 32) (currentBit!5280 lt!169971)))))

(assert (=> d!35930 (= (readBit!0 lt!169971) lt!171124)))

(declare-fun b!112358 () Bool)

(declare-fun lt!171123 () (_ BitVec 64))

(declare-fun lt!171128 () (_ BitVec 64))

(assert (=> b!112358 (= e!73711 (= (bitIndex!0 (size!2316 (buf!2719 (_2!4894 (increaseBitIndex!0 lt!169971)))) (currentByte!5285 (_2!4894 (increaseBitIndex!0 lt!169971))) (currentBit!5280 (_2!4894 (increaseBitIndex!0 lt!169971)))) (bvadd lt!171128 lt!171123)))))

(assert (=> b!112358 (or (not (= (bvand lt!171128 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171123 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!171128 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!171128 lt!171123) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112358 (= lt!171123 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!112358 (= lt!171128 (bitIndex!0 (size!2316 (buf!2719 lt!169971)) (currentByte!5285 lt!169971) (currentBit!5280 lt!169971)))))

(declare-fun lt!171122 () Bool)

(assert (=> b!112358 (= lt!171122 (not (= (bvand ((_ sign_extend 24) (select (arr!2909 (buf!2719 lt!169971)) (currentByte!5285 lt!169971))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5280 lt!169971)))) #b00000000000000000000000000000000)))))

(declare-fun lt!171126 () Bool)

(assert (=> b!112358 (= lt!171126 (not (= (bvand ((_ sign_extend 24) (select (arr!2909 (buf!2719 lt!169971)) (currentByte!5285 lt!169971))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5280 lt!169971)))) #b00000000000000000000000000000000)))))

(declare-fun lt!171127 () Bool)

(assert (=> b!112358 (= lt!171127 (not (= (bvand ((_ sign_extend 24) (select (arr!2909 (buf!2719 lt!169971)) (currentByte!5285 lt!169971))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5280 lt!169971)))) #b00000000000000000000000000000000)))))

(assert (= (and d!35930 res!92780) b!112358))

(declare-fun m!167839 () Bool)

(assert (=> d!35930 m!167839))

(declare-fun m!167841 () Bool)

(assert (=> d!35930 m!167841))

(declare-fun m!167843 () Bool)

(assert (=> d!35930 m!167843))

(declare-fun m!167845 () Bool)

(assert (=> d!35930 m!167845))

(declare-fun m!167847 () Bool)

(assert (=> b!112358 m!167847))

(assert (=> b!112358 m!167843))

(assert (=> b!112358 m!167839))

(declare-fun m!167849 () Bool)

(assert (=> b!112358 m!167849))

(assert (=> b!112358 m!167841))

(assert (=> d!35726 d!35930))

(declare-fun d!35932 () Bool)

(declare-fun res!92781 () Bool)

(declare-fun e!73712 () Bool)

(assert (=> d!35932 (=> (not res!92781) (not e!73712))))

(assert (=> d!35932 (= res!92781 (= (size!2316 (buf!2719 (_2!4896 lt!170655))) (size!2316 (buf!2719 (_2!4894 lt!169962)))))))

(assert (=> d!35932 (= (isPrefixOf!0 (_2!4896 lt!170655) (_2!4894 lt!169962)) e!73712)))

(declare-fun b!112359 () Bool)

(declare-fun res!92783 () Bool)

(assert (=> b!112359 (=> (not res!92783) (not e!73712))))

(assert (=> b!112359 (= res!92783 (bvsle (bitIndex!0 (size!2316 (buf!2719 (_2!4896 lt!170655))) (currentByte!5285 (_2!4896 lt!170655)) (currentBit!5280 (_2!4896 lt!170655))) (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!169962))) (currentByte!5285 (_2!4894 lt!169962)) (currentBit!5280 (_2!4894 lt!169962)))))))

(declare-fun b!112360 () Bool)

(declare-fun e!73713 () Bool)

(assert (=> b!112360 (= e!73712 e!73713)))

(declare-fun res!92782 () Bool)

(assert (=> b!112360 (=> res!92782 e!73713)))

(assert (=> b!112360 (= res!92782 (= (size!2316 (buf!2719 (_2!4896 lt!170655))) #b00000000000000000000000000000000))))

(declare-fun b!112361 () Bool)

(assert (=> b!112361 (= e!73713 (arrayBitRangesEq!0 (buf!2719 (_2!4896 lt!170655)) (buf!2719 (_2!4894 lt!169962)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2316 (buf!2719 (_2!4896 lt!170655))) (currentByte!5285 (_2!4896 lt!170655)) (currentBit!5280 (_2!4896 lt!170655)))))))

(assert (= (and d!35932 res!92781) b!112359))

(assert (= (and b!112359 res!92783) b!112360))

(assert (= (and b!112360 (not res!92782)) b!112361))

(assert (=> b!112359 m!167769))

(assert (=> b!112359 m!166971))

(assert (=> b!112361 m!167769))

(assert (=> b!112361 m!167769))

(declare-fun m!167851 () Bool)

(assert (=> b!112361 m!167851))

(assert (=> b!112153 d!35932))

(declare-fun d!35934 () Bool)

(declare-fun lt!171133 () tuple2!9274)

(declare-fun lt!171134 () tuple2!9274)

(assert (=> d!35934 (and (= (_2!4897 lt!171133) (_2!4897 lt!171134)) (= (_1!4897 lt!171133) (_1!4897 lt!171134)))))

(declare-fun e!73716 () (_ BitVec 64))

(assert (=> d!35934 (= lt!171134 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4896 lt!169961) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd i!615 #b00000000000000000000000000000001) (bvor lt!169967 e!73716)))))

(declare-fun c!6843 () Bool)

(assert (=> d!35934 (= c!6843 (_2!4895 (readBitPure!0 (_1!4896 lt!169961))))))

(assert (=> d!35934 (= lt!171133 (readNLeastSignificantBitsLoopPure!0 (_1!4896 lt!169961) nBits!396 i!615 lt!169967))))

(assert (=> d!35934 true))

(declare-fun _$11!41 () Unit!6851)

(assert (=> d!35934 (= (choose!45 (_1!4896 lt!169961) nBits!396 i!615 lt!169967 lt!170081 (tuple2!9275 (_1!4897 lt!170081) (_2!4897 lt!170081)) (_1!4897 lt!170081) (_2!4897 lt!170081) lt!170080 lt!170079 lt!170078 lt!170083 (tuple2!9275 (_1!4897 lt!170083) (_2!4897 lt!170083)) (_1!4897 lt!170083) (_2!4897 lt!170083)) _$11!41)))

(declare-fun b!112366 () Bool)

(assert (=> b!112366 (= e!73716 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!112367 () Bool)

(assert (=> b!112367 (= e!73716 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (= (and d!35934 c!6843) b!112366))

(assert (= (and d!35934 (not c!6843)) b!112367))

(assert (=> d!35934 m!166983))

(assert (=> d!35934 m!166983))

(declare-fun m!167853 () Bool)

(assert (=> d!35934 m!167853))

(assert (=> d!35934 m!166935))

(assert (=> d!35934 m!166941))

(assert (=> d!35690 d!35934))

(declare-fun lt!171135 () tuple2!9280)

(declare-fun d!35936 () Bool)

(assert (=> d!35936 (= lt!171135 (readNLeastSignificantBitsLoop!0 lt!170079 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!170078))))

(assert (=> d!35936 (= (readNLeastSignificantBitsLoopPure!0 lt!170079 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!170078) (tuple2!9275 (_2!4900 lt!171135) (_1!4900 lt!171135)))))

(declare-fun bs!8750 () Bool)

(assert (= bs!8750 d!35936))

(declare-fun m!167855 () Bool)

(assert (=> bs!8750 m!167855))

(assert (=> d!35690 d!35936))

(assert (=> d!35690 d!35712))

(assert (=> d!35690 d!35694))

(assert (=> d!35690 d!35728))

(assert (=> b!111962 d!35696))

(assert (=> b!111962 d!35688))

(declare-fun d!35938 () Bool)

(assert (=> d!35938 (isPrefixOf!0 lt!170598 lt!170598)))

(declare-fun lt!171136 () Unit!6851)

(assert (=> d!35938 (= lt!171136 (choose!11 lt!170598))))

(assert (=> d!35938 (= (lemmaIsPrefixRefl!0 lt!170598) lt!171136)))

(declare-fun bs!8751 () Bool)

(assert (= bs!8751 d!35938))

(declare-fun m!167857 () Bool)

(assert (=> bs!8751 m!167857))

(declare-fun m!167859 () Bool)

(assert (=> bs!8751 m!167859))

(assert (=> b!112132 d!35938))

(declare-fun d!35940 () Bool)

(declare-fun res!92784 () Bool)

(declare-fun e!73717 () Bool)

(assert (=> d!35940 (=> (not res!92784) (not e!73717))))

(assert (=> d!35940 (= res!92784 (= (size!2316 (buf!2719 (_1!4896 lt!170172))) (size!2316 (buf!2719 thiss!1305))))))

(assert (=> d!35940 (= (isPrefixOf!0 (_1!4896 lt!170172) thiss!1305) e!73717)))

(declare-fun b!112368 () Bool)

(declare-fun res!92786 () Bool)

(assert (=> b!112368 (=> (not res!92786) (not e!73717))))

(assert (=> b!112368 (= res!92786 (bvsle (bitIndex!0 (size!2316 (buf!2719 (_1!4896 lt!170172))) (currentByte!5285 (_1!4896 lt!170172)) (currentBit!5280 (_1!4896 lt!170172))) (bitIndex!0 (size!2316 (buf!2719 thiss!1305)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305))))))

(declare-fun b!112369 () Bool)

(declare-fun e!73718 () Bool)

(assert (=> b!112369 (= e!73717 e!73718)))

(declare-fun res!92785 () Bool)

(assert (=> b!112369 (=> res!92785 e!73718)))

(assert (=> b!112369 (= res!92785 (= (size!2316 (buf!2719 (_1!4896 lt!170172))) #b00000000000000000000000000000000))))

(declare-fun b!112370 () Bool)

(assert (=> b!112370 (= e!73718 (arrayBitRangesEq!0 (buf!2719 (_1!4896 lt!170172)) (buf!2719 thiss!1305) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2316 (buf!2719 (_1!4896 lt!170172))) (currentByte!5285 (_1!4896 lt!170172)) (currentBit!5280 (_1!4896 lt!170172)))))))

(assert (= (and d!35940 res!92784) b!112368))

(assert (= (and b!112368 res!92786) b!112369))

(assert (= (and b!112369 (not res!92785)) b!112370))

(declare-fun m!167861 () Bool)

(assert (=> b!112368 m!167861))

(assert (=> b!112368 m!166979))

(assert (=> b!112370 m!167861))

(assert (=> b!112370 m!167861))

(declare-fun m!167863 () Bool)

(assert (=> b!112370 m!167863))

(assert (=> b!111983 d!35940))

(assert (=> d!35706 d!35928))

(declare-fun d!35942 () Bool)

(declare-fun e!73719 () Bool)

(assert (=> d!35942 e!73719))

(declare-fun res!92787 () Bool)

(assert (=> d!35942 (=> (not res!92787) (not e!73719))))

(declare-fun lt!171137 () (_ BitVec 64))

(declare-fun lt!171142 () (_ BitVec 64))

(declare-fun lt!171141 () (_ BitVec 64))

(assert (=> d!35942 (= res!92787 (= lt!171137 (bvsub lt!171141 lt!171142)))))

(assert (=> d!35942 (or (= (bvand lt!171141 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171142 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!171141 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!171141 lt!171142) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35942 (= lt!171142 (remainingBits!0 ((_ sign_extend 32) (size!2316 (buf!2719 (_1!4895 lt!170335)))) ((_ sign_extend 32) (currentByte!5285 (_1!4895 lt!170335))) ((_ sign_extend 32) (currentBit!5280 (_1!4895 lt!170335)))))))

(declare-fun lt!171140 () (_ BitVec 64))

(declare-fun lt!171139 () (_ BitVec 64))

(assert (=> d!35942 (= lt!171141 (bvmul lt!171140 lt!171139))))

(assert (=> d!35942 (or (= lt!171140 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!171139 (bvsdiv (bvmul lt!171140 lt!171139) lt!171140)))))

(assert (=> d!35942 (= lt!171139 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35942 (= lt!171140 ((_ sign_extend 32) (size!2316 (buf!2719 (_1!4895 lt!170335)))))))

(assert (=> d!35942 (= lt!171137 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5285 (_1!4895 lt!170335))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5280 (_1!4895 lt!170335)))))))

(assert (=> d!35942 (invariant!0 (currentBit!5280 (_1!4895 lt!170335)) (currentByte!5285 (_1!4895 lt!170335)) (size!2316 (buf!2719 (_1!4895 lt!170335))))))

(assert (=> d!35942 (= (bitIndex!0 (size!2316 (buf!2719 (_1!4895 lt!170335))) (currentByte!5285 (_1!4895 lt!170335)) (currentBit!5280 (_1!4895 lt!170335))) lt!171137)))

(declare-fun b!112371 () Bool)

(declare-fun res!92788 () Bool)

(assert (=> b!112371 (=> (not res!92788) (not e!73719))))

(assert (=> b!112371 (= res!92788 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!171137))))

(declare-fun b!112372 () Bool)

(declare-fun lt!171138 () (_ BitVec 64))

(assert (=> b!112372 (= e!73719 (bvsle lt!171137 (bvmul lt!171138 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112372 (or (= lt!171138 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!171138 #b0000000000000000000000000000000000000000000000000000000000001000) lt!171138)))))

(assert (=> b!112372 (= lt!171138 ((_ sign_extend 32) (size!2316 (buf!2719 (_1!4895 lt!170335)))))))

(assert (= (and d!35942 res!92787) b!112371))

(assert (= (and b!112371 res!92788) b!112372))

(declare-fun m!167865 () Bool)

(assert (=> d!35942 m!167865))

(declare-fun m!167867 () Bool)

(assert (=> d!35942 m!167867))

(assert (=> b!112041 d!35942))

(declare-fun d!35944 () Bool)

(declare-fun e!73720 () Bool)

(assert (=> d!35944 e!73720))

(declare-fun res!92789 () Bool)

(assert (=> d!35944 (=> (not res!92789) (not e!73720))))

(declare-fun lt!171148 () (_ BitVec 64))

(declare-fun lt!171143 () (_ BitVec 64))

(declare-fun lt!171147 () (_ BitVec 64))

(assert (=> d!35944 (= res!92789 (= lt!171143 (bvsub lt!171147 lt!171148)))))

(assert (=> d!35944 (or (= (bvand lt!171147 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171148 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!171147 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!171147 lt!171148) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35944 (= lt!171148 (remainingBits!0 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!170336)))) ((_ sign_extend 32) (currentByte!5285 (_2!4894 lt!170336))) ((_ sign_extend 32) (currentBit!5280 (_2!4894 lt!170336)))))))

(declare-fun lt!171146 () (_ BitVec 64))

(declare-fun lt!171145 () (_ BitVec 64))

(assert (=> d!35944 (= lt!171147 (bvmul lt!171146 lt!171145))))

(assert (=> d!35944 (or (= lt!171146 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!171145 (bvsdiv (bvmul lt!171146 lt!171145) lt!171146)))))

(assert (=> d!35944 (= lt!171145 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35944 (= lt!171146 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!170336)))))))

(assert (=> d!35944 (= lt!171143 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5285 (_2!4894 lt!170336))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5280 (_2!4894 lt!170336)))))))

(assert (=> d!35944 (invariant!0 (currentBit!5280 (_2!4894 lt!170336)) (currentByte!5285 (_2!4894 lt!170336)) (size!2316 (buf!2719 (_2!4894 lt!170336))))))

(assert (=> d!35944 (= (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!170336))) (currentByte!5285 (_2!4894 lt!170336)) (currentBit!5280 (_2!4894 lt!170336))) lt!171143)))

(declare-fun b!112373 () Bool)

(declare-fun res!92790 () Bool)

(assert (=> b!112373 (=> (not res!92790) (not e!73720))))

(assert (=> b!112373 (= res!92790 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!171143))))

(declare-fun b!112374 () Bool)

(declare-fun lt!171144 () (_ BitVec 64))

(assert (=> b!112374 (= e!73720 (bvsle lt!171143 (bvmul lt!171144 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112374 (or (= lt!171144 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!171144 #b0000000000000000000000000000000000000000000000000000000000001000) lt!171144)))))

(assert (=> b!112374 (= lt!171144 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!170336)))))))

(assert (= (and d!35944 res!92789) b!112373))

(assert (= (and b!112373 res!92790) b!112374))

(declare-fun m!167869 () Bool)

(assert (=> d!35944 m!167869))

(declare-fun m!167871 () Bool)

(assert (=> d!35944 m!167871))

(assert (=> b!112041 d!35944))

(declare-fun d!35946 () Bool)

(declare-fun e!73721 () Bool)

(assert (=> d!35946 e!73721))

(declare-fun res!92791 () Bool)

(assert (=> d!35946 (=> (not res!92791) (not e!73721))))

(declare-fun lt!171154 () (_ BitVec 64))

(declare-fun lt!171149 () (_ BitVec 64))

(declare-fun lt!171153 () (_ BitVec 64))

(assert (=> d!35946 (= res!92791 (= lt!171149 (bvsub lt!171153 lt!171154)))))

(assert (=> d!35946 (or (= (bvand lt!171153 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171154 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!171153 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!171153 lt!171154) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35946 (= lt!171154 (remainingBits!0 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!170613)))) ((_ sign_extend 32) (currentByte!5285 (_2!4894 lt!170613))) ((_ sign_extend 32) (currentBit!5280 (_2!4894 lt!170613)))))))

(declare-fun lt!171152 () (_ BitVec 64))

(declare-fun lt!171151 () (_ BitVec 64))

(assert (=> d!35946 (= lt!171153 (bvmul lt!171152 lt!171151))))

(assert (=> d!35946 (or (= lt!171152 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!171151 (bvsdiv (bvmul lt!171152 lt!171151) lt!171152)))))

(assert (=> d!35946 (= lt!171151 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35946 (= lt!171152 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!170613)))))))

(assert (=> d!35946 (= lt!171149 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5285 (_2!4894 lt!170613))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5280 (_2!4894 lt!170613)))))))

(assert (=> d!35946 (invariant!0 (currentBit!5280 (_2!4894 lt!170613)) (currentByte!5285 (_2!4894 lt!170613)) (size!2316 (buf!2719 (_2!4894 lt!170613))))))

(assert (=> d!35946 (= (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!170613))) (currentByte!5285 (_2!4894 lt!170613)) (currentBit!5280 (_2!4894 lt!170613))) lt!171149)))

(declare-fun b!112375 () Bool)

(declare-fun res!92792 () Bool)

(assert (=> b!112375 (=> (not res!92792) (not e!73721))))

(assert (=> b!112375 (= res!92792 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!171149))))

(declare-fun b!112376 () Bool)

(declare-fun lt!171150 () (_ BitVec 64))

(assert (=> b!112376 (= e!73721 (bvsle lt!171149 (bvmul lt!171150 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112376 (or (= lt!171150 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!171150 #b0000000000000000000000000000000000000000000000000000000000001000) lt!171150)))))

(assert (=> b!112376 (= lt!171150 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!170613)))))))

(assert (= (and d!35946 res!92791) b!112375))

(assert (= (and b!112375 res!92792) b!112376))

(declare-fun m!167873 () Bool)

(assert (=> d!35946 m!167873))

(declare-fun m!167875 () Bool)

(assert (=> d!35946 m!167875))

(assert (=> b!112130 d!35946))

(assert (=> b!112130 d!35688))

(declare-fun d!35948 () Bool)

(declare-fun e!73722 () Bool)

(assert (=> d!35948 e!73722))

(declare-fun res!92793 () Bool)

(assert (=> d!35948 (=> (not res!92793) (not e!73722))))

(declare-fun lt!171155 () BitStream!4106)

(declare-fun lt!171156 () (_ BitVec 64))

(assert (=> d!35948 (= res!92793 (= (bvadd lt!171156 (bvsub lt!170155 lt!170158)) (bitIndex!0 (size!2316 (buf!2719 lt!171155)) (currentByte!5285 lt!171155) (currentBit!5280 lt!171155))))))

(assert (=> d!35948 (or (not (= (bvand lt!171156 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!170155 lt!170158) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!171156 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!171156 (bvsub lt!170155 lt!170158)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35948 (= lt!171156 (bitIndex!0 (size!2316 (buf!2719 (_2!4896 lt!170172))) (currentByte!5285 (_2!4896 lt!170172)) (currentBit!5280 (_2!4896 lt!170172))))))

(assert (=> d!35948 (= lt!171155 (_2!4894 (moveBitIndex!0 (_2!4896 lt!170172) (bvsub lt!170155 lt!170158))))))

(assert (=> d!35948 (moveBitIndexPrecond!0 (_2!4896 lt!170172) (bvsub lt!170155 lt!170158))))

(assert (=> d!35948 (= (withMovedBitIndex!0 (_2!4896 lt!170172) (bvsub lt!170155 lt!170158)) lt!171155)))

(declare-fun b!112377 () Bool)

(assert (=> b!112377 (= e!73722 (= (size!2316 (buf!2719 (_2!4896 lt!170172))) (size!2316 (buf!2719 lt!171155))))))

(assert (= (and d!35948 res!92793) b!112377))

(declare-fun m!167877 () Bool)

(assert (=> d!35948 m!167877))

(declare-fun m!167879 () Bool)

(assert (=> d!35948 m!167879))

(declare-fun m!167881 () Bool)

(assert (=> d!35948 m!167881))

(declare-fun m!167883 () Bool)

(assert (=> d!35948 m!167883))

(assert (=> b!111985 d!35948))

(assert (=> b!111985 d!35682))

(assert (=> b!111985 d!35696))

(declare-fun d!35950 () Bool)

(declare-fun res!92794 () Bool)

(declare-fun e!73723 () Bool)

(assert (=> d!35950 (=> (not res!92794) (not e!73723))))

(assert (=> d!35950 (= res!92794 (= (size!2316 (buf!2719 thiss!1305)) (size!2316 (buf!2719 (_2!4894 lt!170336)))))))

(assert (=> d!35950 (= (isPrefixOf!0 thiss!1305 (_2!4894 lt!170336)) e!73723)))

(declare-fun b!112378 () Bool)

(declare-fun res!92796 () Bool)

(assert (=> b!112378 (=> (not res!92796) (not e!73723))))

(assert (=> b!112378 (= res!92796 (bvsle (bitIndex!0 (size!2316 (buf!2719 thiss!1305)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305)) (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!170336))) (currentByte!5285 (_2!4894 lt!170336)) (currentBit!5280 (_2!4894 lt!170336)))))))

(declare-fun b!112379 () Bool)

(declare-fun e!73724 () Bool)

(assert (=> b!112379 (= e!73723 e!73724)))

(declare-fun res!92795 () Bool)

(assert (=> b!112379 (=> res!92795 e!73724)))

(assert (=> b!112379 (= res!92795 (= (size!2316 (buf!2719 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!112380 () Bool)

(assert (=> b!112380 (= e!73724 (arrayBitRangesEq!0 (buf!2719 thiss!1305) (buf!2719 (_2!4894 lt!170336)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2316 (buf!2719 thiss!1305)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305))))))

(assert (= (and d!35950 res!92794) b!112378))

(assert (= (and b!112378 res!92796) b!112379))

(assert (= (and b!112379 (not res!92795)) b!112380))

(assert (=> b!112378 m!166979))

(assert (=> b!112378 m!167227))

(assert (=> b!112380 m!166979))

(assert (=> b!112380 m!166979))

(declare-fun m!167885 () Bool)

(assert (=> b!112380 m!167885))

(assert (=> b!112039 d!35950))

(declare-fun d!35952 () Bool)

(declare-fun e!73733 () Bool)

(assert (=> d!35952 e!73733))

(declare-fun res!92806 () Bool)

(assert (=> d!35952 (=> (not res!92806) (not e!73733))))

(declare-fun _$19!105 () tuple2!9268)

(assert (=> d!35952 (= res!92806 (= (size!2316 (buf!2719 thiss!1305)) (size!2316 (buf!2719 (_2!4894 _$19!105)))))))

(declare-fun e!73736 () Bool)

(assert (=> d!35952 (and (inv!12 (_2!4894 _$19!105)) e!73736)))

(assert (=> d!35952 (= (choose!16 thiss!1305 lt!169959) _$19!105)))

(declare-fun b!112392 () Bool)

(assert (=> b!112392 (= e!73736 (array_inv!2118 (buf!2719 (_2!4894 _$19!105))))))

(declare-fun b!112393 () Bool)

(declare-fun res!92808 () Bool)

(assert (=> b!112393 (=> (not res!92808) (not e!73733))))

(assert (=> b!112393 (= res!92808 (isPrefixOf!0 thiss!1305 (_2!4894 _$19!105)))))

(declare-fun b!112394 () Bool)

(declare-fun res!92807 () Bool)

(assert (=> b!112394 (=> (not res!92807) (not e!73733))))

(assert (=> b!112394 (= res!92807 (= (bitIndex!0 (size!2316 (buf!2719 (_2!4894 _$19!105))) (currentByte!5285 (_2!4894 _$19!105)) (currentBit!5280 (_2!4894 _$19!105))) (bvadd (bitIndex!0 (size!2316 (buf!2719 thiss!1305)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!112395 () Bool)

(declare-fun e!73735 () Bool)

(assert (=> b!112395 (= e!73733 e!73735)))

(declare-fun res!92805 () Bool)

(assert (=> b!112395 (=> (not res!92805) (not e!73735))))

(declare-fun lt!171159 () tuple2!9270)

(assert (=> b!112395 (= res!92805 (and (= (_2!4895 lt!171159) lt!169959) (= (_1!4895 lt!171159) (_2!4894 _$19!105))))))

(assert (=> b!112395 (= lt!171159 (readBitPure!0 (readerFrom!0 (_2!4894 _$19!105) (currentBit!5280 thiss!1305) (currentByte!5285 thiss!1305))))))

(declare-fun b!112396 () Bool)

(assert (=> b!112396 (= e!73735 (= (bitIndex!0 (size!2316 (buf!2719 (_1!4895 lt!171159))) (currentByte!5285 (_1!4895 lt!171159)) (currentBit!5280 (_1!4895 lt!171159))) (bitIndex!0 (size!2316 (buf!2719 (_2!4894 _$19!105))) (currentByte!5285 (_2!4894 _$19!105)) (currentBit!5280 (_2!4894 _$19!105)))))))

(assert (= d!35952 b!112392))

(assert (= (and d!35952 res!92806) b!112394))

(assert (= (and b!112394 res!92807) b!112393))

(assert (= (and b!112393 res!92808) b!112395))

(assert (= (and b!112395 res!92805) b!112396))

(declare-fun m!167887 () Bool)

(assert (=> b!112395 m!167887))

(assert (=> b!112395 m!167887))

(declare-fun m!167889 () Bool)

(assert (=> b!112395 m!167889))

(declare-fun m!167891 () Bool)

(assert (=> b!112396 m!167891))

(declare-fun m!167893 () Bool)

(assert (=> b!112396 m!167893))

(declare-fun m!167895 () Bool)

(assert (=> b!112392 m!167895))

(assert (=> b!112394 m!167893))

(assert (=> b!112394 m!166979))

(declare-fun m!167897 () Bool)

(assert (=> b!112393 m!167897))

(declare-fun m!167899 () Bool)

(assert (=> d!35952 m!167899))

(assert (=> d!35734 d!35952))

(declare-fun d!35954 () Bool)

(assert (=> d!35954 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!2316 (buf!2719 thiss!1305))) ((_ sign_extend 32) (currentByte!5285 thiss!1305)) ((_ sign_extend 32) (currentBit!5280 thiss!1305))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2316 (buf!2719 thiss!1305))) ((_ sign_extend 32) (currentByte!5285 thiss!1305)) ((_ sign_extend 32) (currentBit!5280 thiss!1305))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!8752 () Bool)

(assert (= bs!8752 d!35954))

(assert (=> bs!8752 m!167031))

(assert (=> d!35734 d!35954))

(declare-fun d!35956 () Bool)

(declare-fun e!73737 () Bool)

(assert (=> d!35956 e!73737))

(declare-fun res!92809 () Bool)

(assert (=> d!35956 (=> (not res!92809) (not e!73737))))

(declare-fun lt!171160 () BitStream!4106)

(declare-fun lt!171161 () (_ BitVec 64))

(assert (=> d!35956 (= res!92809 (= (bvadd lt!171161 (bvsub lt!170638 lt!170641)) (bitIndex!0 (size!2316 (buf!2719 lt!171160)) (currentByte!5285 lt!171160) (currentBit!5280 lt!171160))))))

(assert (=> d!35956 (or (not (= (bvand lt!171161 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!170638 lt!170641) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!171161 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!171161 (bvsub lt!170638 lt!170641)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35956 (= lt!171161 (bitIndex!0 (size!2316 (buf!2719 (_2!4896 lt!170655))) (currentByte!5285 (_2!4896 lt!170655)) (currentBit!5280 (_2!4896 lt!170655))))))

(assert (=> d!35956 (= lt!171160 (_2!4894 (moveBitIndex!0 (_2!4896 lt!170655) (bvsub lt!170638 lt!170641))))))

(assert (=> d!35956 (moveBitIndexPrecond!0 (_2!4896 lt!170655) (bvsub lt!170638 lt!170641))))

(assert (=> d!35956 (= (withMovedBitIndex!0 (_2!4896 lt!170655) (bvsub lt!170638 lt!170641)) lt!171160)))

(declare-fun b!112397 () Bool)

(assert (=> b!112397 (= e!73737 (= (size!2316 (buf!2719 (_2!4896 lt!170655))) (size!2316 (buf!2719 lt!171160))))))

(assert (= (and d!35956 res!92809) b!112397))

(declare-fun m!167901 () Bool)

(assert (=> d!35956 m!167901))

(assert (=> d!35956 m!167769))

(declare-fun m!167903 () Bool)

(assert (=> d!35956 m!167903))

(declare-fun m!167905 () Bool)

(assert (=> d!35956 m!167905))

(assert (=> b!112156 d!35956))

(assert (=> b!112156 d!35682))

(assert (=> b!112156 d!35688))

(declare-fun d!35958 () Bool)

(declare-fun res!92810 () Bool)

(declare-fun e!73738 () Bool)

(assert (=> d!35958 (=> (not res!92810) (not e!73738))))

(assert (=> d!35958 (= res!92810 (= (size!2316 (buf!2719 (ite c!6822 (_2!4894 lt!169956) lt!170598))) (size!2316 (buf!2719 (ite c!6822 (_2!4894 lt!170613) lt!170598)))))))

(assert (=> d!35958 (= (isPrefixOf!0 (ite c!6822 (_2!4894 lt!169956) lt!170598) (ite c!6822 (_2!4894 lt!170613) lt!170598)) e!73738)))

(declare-fun b!112398 () Bool)

(declare-fun res!92812 () Bool)

(assert (=> b!112398 (=> (not res!92812) (not e!73738))))

(assert (=> b!112398 (= res!92812 (bvsle (bitIndex!0 (size!2316 (buf!2719 (ite c!6822 (_2!4894 lt!169956) lt!170598))) (currentByte!5285 (ite c!6822 (_2!4894 lt!169956) lt!170598)) (currentBit!5280 (ite c!6822 (_2!4894 lt!169956) lt!170598))) (bitIndex!0 (size!2316 (buf!2719 (ite c!6822 (_2!4894 lt!170613) lt!170598))) (currentByte!5285 (ite c!6822 (_2!4894 lt!170613) lt!170598)) (currentBit!5280 (ite c!6822 (_2!4894 lt!170613) lt!170598)))))))

(declare-fun b!112399 () Bool)

(declare-fun e!73739 () Bool)

(assert (=> b!112399 (= e!73738 e!73739)))

(declare-fun res!92811 () Bool)

(assert (=> b!112399 (=> res!92811 e!73739)))

(assert (=> b!112399 (= res!92811 (= (size!2316 (buf!2719 (ite c!6822 (_2!4894 lt!169956) lt!170598))) #b00000000000000000000000000000000))))

(declare-fun b!112400 () Bool)

(assert (=> b!112400 (= e!73739 (arrayBitRangesEq!0 (buf!2719 (ite c!6822 (_2!4894 lt!169956) lt!170598)) (buf!2719 (ite c!6822 (_2!4894 lt!170613) lt!170598)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2316 (buf!2719 (ite c!6822 (_2!4894 lt!169956) lt!170598))) (currentByte!5285 (ite c!6822 (_2!4894 lt!169956) lt!170598)) (currentBit!5280 (ite c!6822 (_2!4894 lt!169956) lt!170598)))))))

(assert (= (and d!35958 res!92810) b!112398))

(assert (= (and b!112398 res!92812) b!112399))

(assert (= (and b!112399 (not res!92811)) b!112400))

(declare-fun m!167907 () Bool)

(assert (=> b!112398 m!167907))

(declare-fun m!167909 () Bool)

(assert (=> b!112398 m!167909))

(assert (=> b!112400 m!167907))

(assert (=> b!112400 m!167907))

(declare-fun m!167911 () Bool)

(assert (=> b!112400 m!167911))

(assert (=> bm!1419 d!35958))

(assert (=> b!111967 d!35676))

(assert (=> d!35678 d!35926))

(declare-fun d!35960 () Bool)

(assert (=> d!35960 (= (remainingBits!0 ((_ sign_extend 32) (size!2316 (buf!2719 (_1!4895 lt!169981)))) ((_ sign_extend 32) (currentByte!5285 (_1!4895 lt!169981))) ((_ sign_extend 32) (currentBit!5280 (_1!4895 lt!169981)))) (bvsub (bvmul ((_ sign_extend 32) (size!2316 (buf!2719 (_1!4895 lt!169981)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5285 (_1!4895 lt!169981))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5280 (_1!4895 lt!169981))))))))

(assert (=> d!35718 d!35960))

(declare-fun d!35962 () Bool)

(assert (=> d!35962 (= (invariant!0 (currentBit!5280 (_1!4895 lt!169981)) (currentByte!5285 (_1!4895 lt!169981)) (size!2316 (buf!2719 (_1!4895 lt!169981)))) (and (bvsge (currentBit!5280 (_1!4895 lt!169981)) #b00000000000000000000000000000000) (bvslt (currentBit!5280 (_1!4895 lt!169981)) #b00000000000000000000000000001000) (bvsge (currentByte!5285 (_1!4895 lt!169981)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5285 (_1!4895 lt!169981)) (size!2316 (buf!2719 (_1!4895 lt!169981)))) (and (= (currentBit!5280 (_1!4895 lt!169981)) #b00000000000000000000000000000000) (= (currentByte!5285 (_1!4895 lt!169981)) (size!2316 (buf!2719 (_1!4895 lt!169981))))))))))

(assert (=> d!35718 d!35962))

(assert (=> d!35710 d!35730))

(declare-fun d!35964 () Bool)

(assert (=> d!35964 (validate_offset_bits!1 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!169962)))) ((_ sign_extend 32) (currentByte!5285 thiss!1305)) ((_ sign_extend 32) (currentBit!5280 thiss!1305)) lt!169966)))

(assert (=> d!35964 true))

(declare-fun _$6!248 () Unit!6851)

(assert (=> d!35964 (= (choose!9 thiss!1305 (buf!2719 (_2!4894 lt!169962)) lt!169966 (BitStream!4107 (buf!2719 (_2!4894 lt!169962)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305))) _$6!248)))

(declare-fun bs!8753 () Bool)

(assert (= bs!8753 d!35964))

(assert (=> bs!8753 m!166959))

(assert (=> d!35710 d!35964))

(declare-fun d!35966 () Bool)

(assert (=> d!35966 (= (remainingBits!0 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!169962)))) ((_ sign_extend 32) (currentByte!5285 (_2!4894 lt!169962))) ((_ sign_extend 32) (currentBit!5280 (_2!4894 lt!169962)))) (bvsub (bvmul ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!169962)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5285 (_2!4894 lt!169962))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5280 (_2!4894 lt!169962))))))))

(assert (=> d!35682 d!35966))

(declare-fun d!35968 () Bool)

(assert (=> d!35968 (= (invariant!0 (currentBit!5280 (_2!4894 lt!169962)) (currentByte!5285 (_2!4894 lt!169962)) (size!2316 (buf!2719 (_2!4894 lt!169962)))) (and (bvsge (currentBit!5280 (_2!4894 lt!169962)) #b00000000000000000000000000000000) (bvslt (currentBit!5280 (_2!4894 lt!169962)) #b00000000000000000000000000001000) (bvsge (currentByte!5285 (_2!4894 lt!169962)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5285 (_2!4894 lt!169962)) (size!2316 (buf!2719 (_2!4894 lt!169962)))) (and (= (currentBit!5280 (_2!4894 lt!169962)) #b00000000000000000000000000000000) (= (currentByte!5285 (_2!4894 lt!169962)) (size!2316 (buf!2719 (_2!4894 lt!169962))))))))))

(assert (=> d!35682 d!35968))

(declare-fun d!35970 () Bool)

(declare-fun res!92813 () Bool)

(declare-fun e!73740 () Bool)

(assert (=> d!35970 (=> (not res!92813) (not e!73740))))

(assert (=> d!35970 (= res!92813 (= (size!2316 (buf!2719 lt!170163)) (size!2316 (buf!2719 lt!170163))))))

(assert (=> d!35970 (= (isPrefixOf!0 lt!170163 lt!170163) e!73740)))

(declare-fun b!112401 () Bool)

(declare-fun res!92815 () Bool)

(assert (=> b!112401 (=> (not res!92815) (not e!73740))))

(assert (=> b!112401 (= res!92815 (bvsle (bitIndex!0 (size!2316 (buf!2719 lt!170163)) (currentByte!5285 lt!170163) (currentBit!5280 lt!170163)) (bitIndex!0 (size!2316 (buf!2719 lt!170163)) (currentByte!5285 lt!170163) (currentBit!5280 lt!170163))))))

(declare-fun b!112402 () Bool)

(declare-fun e!73741 () Bool)

(assert (=> b!112402 (= e!73740 e!73741)))

(declare-fun res!92814 () Bool)

(assert (=> b!112402 (=> res!92814 e!73741)))

(assert (=> b!112402 (= res!92814 (= (size!2316 (buf!2719 lt!170163)) #b00000000000000000000000000000000))))

(declare-fun b!112403 () Bool)

(assert (=> b!112403 (= e!73741 (arrayBitRangesEq!0 (buf!2719 lt!170163) (buf!2719 lt!170163) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2316 (buf!2719 lt!170163)) (currentByte!5285 lt!170163) (currentBit!5280 lt!170163))))))

(assert (= (and d!35970 res!92813) b!112401))

(assert (= (and b!112401 res!92815) b!112402))

(assert (= (and b!112402 (not res!92814)) b!112403))

(declare-fun m!167913 () Bool)

(assert (=> b!112401 m!167913))

(assert (=> b!112401 m!167913))

(assert (=> b!112403 m!167913))

(assert (=> b!112403 m!167913))

(declare-fun m!167915 () Bool)

(assert (=> b!112403 m!167915))

(assert (=> d!35722 d!35970))

(assert (=> d!35722 d!35886))

(declare-fun d!35972 () Bool)

(assert (=> d!35972 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-fun lt!171162 () Unit!6851)

(assert (=> d!35972 (= lt!171162 (choose!11 thiss!1305))))

(assert (=> d!35972 (= (lemmaIsPrefixRefl!0 thiss!1305) lt!171162)))

(declare-fun bs!8754 () Bool)

(assert (= bs!8754 d!35972))

(assert (=> bs!8754 m!167103))

(declare-fun m!167917 () Bool)

(assert (=> bs!8754 m!167917))

(assert (=> d!35722 d!35972))

(declare-fun d!35974 () Bool)

(assert (=> d!35974 (isPrefixOf!0 lt!170163 (_2!4894 lt!169962))))

(declare-fun lt!171163 () Unit!6851)

(assert (=> d!35974 (= lt!171163 (choose!30 lt!170163 (_2!4894 lt!169962) (_2!4894 lt!169962)))))

(assert (=> d!35974 (isPrefixOf!0 lt!170163 (_2!4894 lt!169962))))

(assert (=> d!35974 (= (lemmaIsPrefixTransitive!0 lt!170163 (_2!4894 lt!169962) (_2!4894 lt!169962)) lt!171163)))

(declare-fun bs!8755 () Bool)

(assert (= bs!8755 d!35974))

(assert (=> bs!8755 m!167101))

(declare-fun m!167919 () Bool)

(assert (=> bs!8755 m!167919))

(assert (=> bs!8755 m!167101))

(assert (=> d!35722 d!35974))

(assert (=> d!35722 d!35878))

(declare-fun d!35976 () Bool)

(declare-fun res!92816 () Bool)

(declare-fun e!73742 () Bool)

(assert (=> d!35976 (=> (not res!92816) (not e!73742))))

(assert (=> d!35976 (= res!92816 (= (size!2316 (buf!2719 (_1!4896 lt!170172))) (size!2316 (buf!2719 (_2!4896 lt!170172)))))))

(assert (=> d!35976 (= (isPrefixOf!0 (_1!4896 lt!170172) (_2!4896 lt!170172)) e!73742)))

(declare-fun b!112404 () Bool)

(declare-fun res!92818 () Bool)

(assert (=> b!112404 (=> (not res!92818) (not e!73742))))

(assert (=> b!112404 (= res!92818 (bvsle (bitIndex!0 (size!2316 (buf!2719 (_1!4896 lt!170172))) (currentByte!5285 (_1!4896 lt!170172)) (currentBit!5280 (_1!4896 lt!170172))) (bitIndex!0 (size!2316 (buf!2719 (_2!4896 lt!170172))) (currentByte!5285 (_2!4896 lt!170172)) (currentBit!5280 (_2!4896 lt!170172)))))))

(declare-fun b!112405 () Bool)

(declare-fun e!73743 () Bool)

(assert (=> b!112405 (= e!73742 e!73743)))

(declare-fun res!92817 () Bool)

(assert (=> b!112405 (=> res!92817 e!73743)))

(assert (=> b!112405 (= res!92817 (= (size!2316 (buf!2719 (_1!4896 lt!170172))) #b00000000000000000000000000000000))))

(declare-fun b!112406 () Bool)

(assert (=> b!112406 (= e!73743 (arrayBitRangesEq!0 (buf!2719 (_1!4896 lt!170172)) (buf!2719 (_2!4896 lt!170172)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2316 (buf!2719 (_1!4896 lt!170172))) (currentByte!5285 (_1!4896 lt!170172)) (currentBit!5280 (_1!4896 lt!170172)))))))

(assert (= (and d!35976 res!92816) b!112404))

(assert (= (and b!112404 res!92818) b!112405))

(assert (= (and b!112405 (not res!92817)) b!112406))

(assert (=> b!112404 m!167861))

(assert (=> b!112404 m!167879))

(assert (=> b!112406 m!167861))

(assert (=> b!112406 m!167861))

(declare-fun m!167921 () Bool)

(assert (=> b!112406 m!167921))

(assert (=> d!35722 d!35976))

(declare-fun d!35978 () Bool)

(declare-fun res!92819 () Bool)

(declare-fun e!73744 () Bool)

(assert (=> d!35978 (=> (not res!92819) (not e!73744))))

(assert (=> d!35978 (= res!92819 (= (size!2316 (buf!2719 thiss!1305)) (size!2316 (buf!2719 thiss!1305))))))

(assert (=> d!35978 (= (isPrefixOf!0 thiss!1305 thiss!1305) e!73744)))

(declare-fun b!112407 () Bool)

(declare-fun res!92821 () Bool)

(assert (=> b!112407 (=> (not res!92821) (not e!73744))))

(assert (=> b!112407 (= res!92821 (bvsle (bitIndex!0 (size!2316 (buf!2719 thiss!1305)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305)) (bitIndex!0 (size!2316 (buf!2719 thiss!1305)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305))))))

(declare-fun b!112408 () Bool)

(declare-fun e!73745 () Bool)

(assert (=> b!112408 (= e!73744 e!73745)))

(declare-fun res!92820 () Bool)

(assert (=> b!112408 (=> res!92820 e!73745)))

(assert (=> b!112408 (= res!92820 (= (size!2316 (buf!2719 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!112409 () Bool)

(assert (=> b!112409 (= e!73745 (arrayBitRangesEq!0 (buf!2719 thiss!1305) (buf!2719 thiss!1305) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2316 (buf!2719 thiss!1305)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305))))))

(assert (= (and d!35978 res!92819) b!112407))

(assert (= (and b!112407 res!92821) b!112408))

(assert (= (and b!112408 (not res!92820)) b!112409))

(assert (=> b!112407 m!166979))

(assert (=> b!112407 m!166979))

(assert (=> b!112409 m!166979))

(assert (=> b!112409 m!166979))

(declare-fun m!167923 () Bool)

(assert (=> b!112409 m!167923))

(assert (=> d!35722 d!35978))

(declare-fun d!35980 () Bool)

(declare-fun res!92822 () Bool)

(declare-fun e!73746 () Bool)

(assert (=> d!35980 (=> (not res!92822) (not e!73746))))

(assert (=> d!35980 (= res!92822 (= (size!2316 (buf!2719 lt!170163)) (size!2316 (buf!2719 (_2!4894 lt!169962)))))))

(assert (=> d!35980 (= (isPrefixOf!0 lt!170163 (_2!4894 lt!169962)) e!73746)))

(declare-fun b!112410 () Bool)

(declare-fun res!92824 () Bool)

(assert (=> b!112410 (=> (not res!92824) (not e!73746))))

(assert (=> b!112410 (= res!92824 (bvsle (bitIndex!0 (size!2316 (buf!2719 lt!170163)) (currentByte!5285 lt!170163) (currentBit!5280 lt!170163)) (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!169962))) (currentByte!5285 (_2!4894 lt!169962)) (currentBit!5280 (_2!4894 lt!169962)))))))

(declare-fun b!112411 () Bool)

(declare-fun e!73747 () Bool)

(assert (=> b!112411 (= e!73746 e!73747)))

(declare-fun res!92823 () Bool)

(assert (=> b!112411 (=> res!92823 e!73747)))

(assert (=> b!112411 (= res!92823 (= (size!2316 (buf!2719 lt!170163)) #b00000000000000000000000000000000))))

(declare-fun b!112412 () Bool)

(assert (=> b!112412 (= e!73747 (arrayBitRangesEq!0 (buf!2719 lt!170163) (buf!2719 (_2!4894 lt!169962)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2316 (buf!2719 lt!170163)) (currentByte!5285 lt!170163) (currentBit!5280 lt!170163))))))

(assert (= (and d!35980 res!92822) b!112410))

(assert (= (and b!112410 res!92824) b!112411))

(assert (= (and b!112411 (not res!92823)) b!112412))

(assert (=> b!112410 m!167913))

(assert (=> b!112410 m!166971))

(assert (=> b!112412 m!167913))

(assert (=> b!112412 m!167913))

(declare-fun m!167925 () Bool)

(assert (=> b!112412 m!167925))

(assert (=> d!35722 d!35980))

(declare-fun d!35982 () Bool)

(assert (=> d!35982 (isPrefixOf!0 lt!170163 (_2!4894 lt!169962))))

(declare-fun lt!171164 () Unit!6851)

(assert (=> d!35982 (= lt!171164 (choose!30 lt!170163 thiss!1305 (_2!4894 lt!169962)))))

(assert (=> d!35982 (isPrefixOf!0 lt!170163 thiss!1305)))

(assert (=> d!35982 (= (lemmaIsPrefixTransitive!0 lt!170163 thiss!1305 (_2!4894 lt!169962)) lt!171164)))

(declare-fun bs!8756 () Bool)

(assert (= bs!8756 d!35982))

(assert (=> bs!8756 m!167101))

(declare-fun m!167927 () Bool)

(assert (=> bs!8756 m!167927))

(declare-fun m!167929 () Bool)

(assert (=> bs!8756 m!167929))

(assert (=> d!35722 d!35982))

(assert (=> d!35722 d!35780))

(declare-fun d!35984 () Bool)

(assert (=> d!35984 (isPrefixOf!0 lt!170163 lt!170163)))

(declare-fun lt!171165 () Unit!6851)

(assert (=> d!35984 (= lt!171165 (choose!11 lt!170163))))

(assert (=> d!35984 (= (lemmaIsPrefixRefl!0 lt!170163) lt!171165)))

(declare-fun bs!8757 () Bool)

(assert (= bs!8757 d!35984))

(assert (=> bs!8757 m!167111))

(declare-fun m!167931 () Bool)

(assert (=> bs!8757 m!167931))

(assert (=> d!35722 d!35984))

(declare-fun b!112413 () Bool)

(declare-fun e!73749 () tuple2!9280)

(assert (=> b!112413 (= e!73749 (tuple2!9281 lt!169975 lt!169982))))

(declare-fun b!112414 () Bool)

(declare-fun e!73748 () Bool)

(declare-fun e!73750 () Bool)

(assert (=> b!112414 (= e!73748 e!73750)))

(declare-fun res!92826 () Bool)

(assert (=> b!112414 (=> res!92826 e!73750)))

(assert (=> b!112414 (= res!92826 (bvsge (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(declare-fun b!112416 () Bool)

(declare-fun res!92825 () Bool)

(assert (=> b!112416 (=> (not res!92825) (not e!73748))))

(declare-fun lt!171174 () (_ BitVec 64))

(declare-fun lt!171170 () (_ BitVec 64))

(declare-fun lt!171172 () tuple2!9280)

(assert (=> b!112416 (= res!92825 (= (bvlshr (_1!4900 lt!171172) lt!171174) (bvlshr lt!169975 lt!171170)))))

(assert (=> b!112416 (and (bvsge lt!171170 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!171170 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!112416 (= lt!171170 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!112416 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!112416 (and (bvsge lt!171174 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!171174 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!112416 (= lt!171174 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!112416 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(declare-fun b!112417 () Bool)

(declare-fun res!92827 () Bool)

(assert (=> b!112417 (=> (not res!92827) (not e!73748))))

(assert (=> b!112417 (= res!92827 (= (bvand (_1!4900 lt!171172) (onesLSBLong!0 nBits!396)) (_1!4900 lt!171172)))))

(declare-fun b!112418 () Bool)

(declare-fun lt!171169 () tuple2!9280)

(assert (=> b!112418 (= e!73749 (tuple2!9281 (_1!4900 lt!171169) (_2!4900 lt!171169)))))

(declare-fun lt!171166 () tuple2!9282)

(assert (=> b!112418 (= lt!171166 (readBit!0 lt!169982))))

(assert (=> b!112418 (= lt!171169 (readNLeastSignificantBitsLoop!0 (_2!4901 lt!171166) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!169975 (ite (_1!4901 lt!171166) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!112419 () Bool)

(declare-fun lt!171171 () (_ BitVec 64))

(assert (=> b!112419 (= e!73750 (= (= (bvand (bvlshr (_1!4900 lt!171172) lt!171171) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!4895 (readBitPure!0 lt!169982))))))

(assert (=> b!112419 (and (bvsge lt!171171 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!171171 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!171168 () (_ BitVec 32))

(assert (=> b!112419 (= lt!171171 ((_ sign_extend 32) (bvsub lt!171168 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!112419 (or (= (bvand lt!171168 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand lt!171168 #b10000000000000000000000000000000) (bvand (bvsub lt!171168 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!112419 (= lt!171168 (bvsub nBits!396 #b00000000000000000000000000000001))))

(assert (=> b!112419 (or (= (bvand nBits!396 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!112415 () Bool)

(declare-fun res!92828 () Bool)

(assert (=> b!112415 (=> (not res!92828) (not e!73748))))

(declare-fun lt!171167 () (_ BitVec 64))

(declare-fun lt!171173 () (_ BitVec 64))

(assert (=> b!112415 (= res!92828 (= (bitIndex!0 (size!2316 (buf!2719 (_2!4900 lt!171172))) (currentByte!5285 (_2!4900 lt!171172)) (currentBit!5280 (_2!4900 lt!171172))) (bvadd lt!171167 lt!171173)))))

(assert (=> b!112415 (or (not (= (bvand lt!171167 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171173 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!171167 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!171167 lt!171173) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112415 (= lt!171173 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!112415 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!112415 (= lt!171167 (bitIndex!0 (size!2316 (buf!2719 lt!169982)) (currentByte!5285 lt!169982) (currentBit!5280 lt!169982)))))

(declare-fun d!35986 () Bool)

(assert (=> d!35986 e!73748))

(declare-fun res!92829 () Bool)

(assert (=> d!35986 (=> (not res!92829) (not e!73748))))

(assert (=> d!35986 (= res!92829 (= (buf!2719 (_2!4900 lt!171172)) (buf!2719 lt!169982)))))

(assert (=> d!35986 (= lt!171172 e!73749)))

(declare-fun c!6844 () Bool)

(assert (=> d!35986 (= c!6844 (= nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> d!35986 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!35986 (= (readNLeastSignificantBitsLoop!0 lt!169982 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!169975) lt!171172)))

(assert (= (and d!35986 c!6844) b!112413))

(assert (= (and d!35986 (not c!6844)) b!112418))

(assert (= (and d!35986 res!92829) b!112415))

(assert (= (and b!112415 res!92828) b!112416))

(assert (= (and b!112416 res!92825) b!112417))

(assert (= (and b!112417 res!92827) b!112414))

(assert (= (and b!112414 (not res!92826)) b!112419))

(assert (=> b!112417 m!166993))

(declare-fun m!167933 () Bool)

(assert (=> b!112418 m!167933))

(declare-fun m!167935 () Bool)

(assert (=> b!112418 m!167935))

(declare-fun m!167937 () Bool)

(assert (=> b!112419 m!167937))

(declare-fun m!167939 () Bool)

(assert (=> b!112415 m!167939))

(declare-fun m!167941 () Bool)

(assert (=> b!112415 m!167941))

(assert (=> d!35684 d!35986))

(declare-fun b!112420 () Bool)

(declare-fun e!73752 () tuple2!9280)

(assert (=> b!112420 (= e!73752 (tuple2!9281 lt!169975 (_1!4896 lt!169963)))))

(declare-fun b!112421 () Bool)

(declare-fun e!73751 () Bool)

(declare-fun e!73753 () Bool)

(assert (=> b!112421 (= e!73751 e!73753)))

(declare-fun res!92831 () Bool)

(assert (=> b!112421 (=> res!92831 e!73753)))

(assert (=> b!112421 (= res!92831 (bvsge (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(declare-fun b!112423 () Bool)

(declare-fun res!92830 () Bool)

(assert (=> b!112423 (=> (not res!92830) (not e!73751))))

(declare-fun lt!171183 () (_ BitVec 64))

(declare-fun lt!171179 () (_ BitVec 64))

(declare-fun lt!171181 () tuple2!9280)

(assert (=> b!112423 (= res!92830 (= (bvlshr (_1!4900 lt!171181) lt!171183) (bvlshr lt!169975 lt!171179)))))

(assert (=> b!112423 (and (bvsge lt!171179 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!171179 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!112423 (= lt!171179 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!112423 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!112423 (and (bvsge lt!171183 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!171183 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!112423 (= lt!171183 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!112423 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(declare-fun b!112424 () Bool)

(declare-fun res!92832 () Bool)

(assert (=> b!112424 (=> (not res!92832) (not e!73751))))

(assert (=> b!112424 (= res!92832 (= (bvand (_1!4900 lt!171181) (onesLSBLong!0 nBits!396)) (_1!4900 lt!171181)))))

(declare-fun b!112425 () Bool)

(declare-fun lt!171178 () tuple2!9280)

(assert (=> b!112425 (= e!73752 (tuple2!9281 (_1!4900 lt!171178) (_2!4900 lt!171178)))))

(declare-fun lt!171175 () tuple2!9282)

(assert (=> b!112425 (= lt!171175 (readBit!0 (_1!4896 lt!169963)))))

(assert (=> b!112425 (= lt!171178 (readNLeastSignificantBitsLoop!0 (_2!4901 lt!171175) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!169975 (ite (_1!4901 lt!171175) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!112426 () Bool)

(declare-fun lt!171180 () (_ BitVec 64))

(assert (=> b!112426 (= e!73753 (= (= (bvand (bvlshr (_1!4900 lt!171181) lt!171180) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!4895 (readBitPure!0 (_1!4896 lt!169963)))))))

(assert (=> b!112426 (and (bvsge lt!171180 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!171180 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!171177 () (_ BitVec 32))

(assert (=> b!112426 (= lt!171180 ((_ sign_extend 32) (bvsub lt!171177 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!112426 (or (= (bvand lt!171177 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand lt!171177 #b10000000000000000000000000000000) (bvand (bvsub lt!171177 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!112426 (= lt!171177 (bvsub nBits!396 #b00000000000000000000000000000001))))

(assert (=> b!112426 (or (= (bvand nBits!396 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!112422 () Bool)

(declare-fun res!92833 () Bool)

(assert (=> b!112422 (=> (not res!92833) (not e!73751))))

(declare-fun lt!171182 () (_ BitVec 64))

(declare-fun lt!171176 () (_ BitVec 64))

(assert (=> b!112422 (= res!92833 (= (bitIndex!0 (size!2316 (buf!2719 (_2!4900 lt!171181))) (currentByte!5285 (_2!4900 lt!171181)) (currentBit!5280 (_2!4900 lt!171181))) (bvadd lt!171176 lt!171182)))))

(assert (=> b!112422 (or (not (= (bvand lt!171176 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171182 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!171176 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!171176 lt!171182) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112422 (= lt!171182 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!112422 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!112422 (= lt!171176 (bitIndex!0 (size!2316 (buf!2719 (_1!4896 lt!169963))) (currentByte!5285 (_1!4896 lt!169963)) (currentBit!5280 (_1!4896 lt!169963))))))

(declare-fun d!35988 () Bool)

(assert (=> d!35988 e!73751))

(declare-fun res!92834 () Bool)

(assert (=> d!35988 (=> (not res!92834) (not e!73751))))

(assert (=> d!35988 (= res!92834 (= (buf!2719 (_2!4900 lt!171181)) (buf!2719 (_1!4896 lt!169963))))))

(assert (=> d!35988 (= lt!171181 e!73752)))

(declare-fun c!6845 () Bool)

(assert (=> d!35988 (= c!6845 (= nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> d!35988 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!35988 (= (readNLeastSignificantBitsLoop!0 (_1!4896 lt!169963) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!169975) lt!171181)))

(assert (= (and d!35988 c!6845) b!112420))

(assert (= (and d!35988 (not c!6845)) b!112425))

(assert (= (and d!35988 res!92834) b!112422))

(assert (= (and b!112422 res!92833) b!112423))

(assert (= (and b!112423 res!92830) b!112424))

(assert (= (and b!112424 res!92832) b!112421))

(assert (= (and b!112421 (not res!92831)) b!112426))

(assert (=> b!112424 m!166993))

(declare-fun m!167943 () Bool)

(assert (=> b!112425 m!167943))

(declare-fun m!167945 () Bool)

(assert (=> b!112425 m!167945))

(declare-fun m!167947 () Bool)

(assert (=> b!112426 m!167947))

(declare-fun m!167949 () Bool)

(assert (=> b!112422 m!167949))

(declare-fun m!167951 () Bool)

(assert (=> b!112422 m!167951))

(assert (=> d!35716 d!35988))

(declare-fun d!35990 () Bool)

(assert (=> d!35990 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!169956)))) ((_ sign_extend 32) (currentByte!5285 (_2!4894 lt!169956))) ((_ sign_extend 32) (currentBit!5280 (_2!4894 lt!169956))) lt!170581) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!169956)))) ((_ sign_extend 32) (currentByte!5285 (_2!4894 lt!169956))) ((_ sign_extend 32) (currentBit!5280 (_2!4894 lt!169956)))) lt!170581))))

(declare-fun bs!8758 () Bool)

(assert (= bs!8758 d!35990))

(assert (=> bs!8758 m!167047))

(assert (=> b!112126 d!35990))

(declare-fun d!35992 () Bool)

(declare-fun res!92835 () Bool)

(declare-fun e!73754 () Bool)

(assert (=> d!35992 (=> (not res!92835) (not e!73754))))

(assert (=> d!35992 (= res!92835 (= (size!2316 (buf!2719 (_1!4896 lt!170655))) (size!2316 (buf!2719 (_2!4894 lt!169956)))))))

(assert (=> d!35992 (= (isPrefixOf!0 (_1!4896 lt!170655) (_2!4894 lt!169956)) e!73754)))

(declare-fun b!112427 () Bool)

(declare-fun res!92837 () Bool)

(assert (=> b!112427 (=> (not res!92837) (not e!73754))))

(assert (=> b!112427 (= res!92837 (bvsle (bitIndex!0 (size!2316 (buf!2719 (_1!4896 lt!170655))) (currentByte!5285 (_1!4896 lt!170655)) (currentBit!5280 (_1!4896 lt!170655))) (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!169956))) (currentByte!5285 (_2!4894 lt!169956)) (currentBit!5280 (_2!4894 lt!169956)))))))

(declare-fun b!112428 () Bool)

(declare-fun e!73755 () Bool)

(assert (=> b!112428 (= e!73754 e!73755)))

(declare-fun res!92836 () Bool)

(assert (=> b!112428 (=> res!92836 e!73755)))

(assert (=> b!112428 (= res!92836 (= (size!2316 (buf!2719 (_1!4896 lt!170655))) #b00000000000000000000000000000000))))

(declare-fun b!112429 () Bool)

(assert (=> b!112429 (= e!73755 (arrayBitRangesEq!0 (buf!2719 (_1!4896 lt!170655)) (buf!2719 (_2!4894 lt!169956)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2316 (buf!2719 (_1!4896 lt!170655))) (currentByte!5285 (_1!4896 lt!170655)) (currentBit!5280 (_1!4896 lt!170655)))))))

(assert (= (and d!35992 res!92835) b!112427))

(assert (= (and b!112427 res!92837) b!112428))

(assert (= (and b!112428 (not res!92836)) b!112429))

(assert (=> b!112427 m!167767))

(assert (=> b!112427 m!166973))

(assert (=> b!112429 m!167767))

(assert (=> b!112429 m!167767))

(declare-fun m!167953 () Bool)

(assert (=> b!112429 m!167953))

(assert (=> b!112154 d!35992))

(declare-fun d!35994 () Bool)

(declare-fun e!73756 () Bool)

(assert (=> d!35994 e!73756))

(declare-fun res!92838 () Bool)

(assert (=> d!35994 (=> (not res!92838) (not e!73756))))

(assert (=> d!35994 (= res!92838 (= (buf!2719 (_2!4894 (increaseBitIndex!0 (BitStream!4107 (buf!2719 (_2!4894 lt!169962)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305))))) (buf!2719 (BitStream!4107 (buf!2719 (_2!4894 lt!169962)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305)))))))

(declare-fun lt!171187 () Bool)

(assert (=> d!35994 (= lt!171187 (not (= (bvand ((_ sign_extend 24) (select (arr!2909 (buf!2719 (BitStream!4107 (buf!2719 (_2!4894 lt!169962)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305)))) (currentByte!5285 (BitStream!4107 (buf!2719 (_2!4894 lt!169962)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5280 (BitStream!4107 (buf!2719 (_2!4894 lt!169962)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!171186 () tuple2!9282)

(assert (=> d!35994 (= lt!171186 (tuple2!9283 (not (= (bvand ((_ sign_extend 24) (select (arr!2909 (buf!2719 (BitStream!4107 (buf!2719 (_2!4894 lt!169962)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305)))) (currentByte!5285 (BitStream!4107 (buf!2719 (_2!4894 lt!169962)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5280 (BitStream!4107 (buf!2719 (_2!4894 lt!169962)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305)))))) #b00000000000000000000000000000000)) (_2!4894 (increaseBitIndex!0 (BitStream!4107 (buf!2719 (_2!4894 lt!169962)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305))))))))

(assert (=> d!35994 (validate_offset_bit!0 ((_ sign_extend 32) (size!2316 (buf!2719 (BitStream!4107 (buf!2719 (_2!4894 lt!169962)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305))))) ((_ sign_extend 32) (currentByte!5285 (BitStream!4107 (buf!2719 (_2!4894 lt!169962)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305)))) ((_ sign_extend 32) (currentBit!5280 (BitStream!4107 (buf!2719 (_2!4894 lt!169962)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305)))))))

(assert (=> d!35994 (= (readBit!0 (BitStream!4107 (buf!2719 (_2!4894 lt!169962)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305))) lt!171186)))

(declare-fun lt!171190 () (_ BitVec 64))

(declare-fun b!112430 () Bool)

(declare-fun lt!171185 () (_ BitVec 64))

(assert (=> b!112430 (= e!73756 (= (bitIndex!0 (size!2316 (buf!2719 (_2!4894 (increaseBitIndex!0 (BitStream!4107 (buf!2719 (_2!4894 lt!169962)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305)))))) (currentByte!5285 (_2!4894 (increaseBitIndex!0 (BitStream!4107 (buf!2719 (_2!4894 lt!169962)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305))))) (currentBit!5280 (_2!4894 (increaseBitIndex!0 (BitStream!4107 (buf!2719 (_2!4894 lt!169962)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305)))))) (bvadd lt!171190 lt!171185)))))

(assert (=> b!112430 (or (not (= (bvand lt!171190 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171185 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!171190 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!171190 lt!171185) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112430 (= lt!171185 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!112430 (= lt!171190 (bitIndex!0 (size!2316 (buf!2719 (BitStream!4107 (buf!2719 (_2!4894 lt!169962)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305)))) (currentByte!5285 (BitStream!4107 (buf!2719 (_2!4894 lt!169962)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305))) (currentBit!5280 (BitStream!4107 (buf!2719 (_2!4894 lt!169962)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305)))))))

(declare-fun lt!171184 () Bool)

(assert (=> b!112430 (= lt!171184 (not (= (bvand ((_ sign_extend 24) (select (arr!2909 (buf!2719 (BitStream!4107 (buf!2719 (_2!4894 lt!169962)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305)))) (currentByte!5285 (BitStream!4107 (buf!2719 (_2!4894 lt!169962)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5280 (BitStream!4107 (buf!2719 (_2!4894 lt!169962)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!171188 () Bool)

(assert (=> b!112430 (= lt!171188 (not (= (bvand ((_ sign_extend 24) (select (arr!2909 (buf!2719 (BitStream!4107 (buf!2719 (_2!4894 lt!169962)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305)))) (currentByte!5285 (BitStream!4107 (buf!2719 (_2!4894 lt!169962)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5280 (BitStream!4107 (buf!2719 (_2!4894 lt!169962)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!171189 () Bool)

(assert (=> b!112430 (= lt!171189 (not (= (bvand ((_ sign_extend 24) (select (arr!2909 (buf!2719 (BitStream!4107 (buf!2719 (_2!4894 lt!169962)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305)))) (currentByte!5285 (BitStream!4107 (buf!2719 (_2!4894 lt!169962)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5280 (BitStream!4107 (buf!2719 (_2!4894 lt!169962)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!35994 res!92838) b!112430))

(declare-fun m!167955 () Bool)

(assert (=> d!35994 m!167955))

(declare-fun m!167957 () Bool)

(assert (=> d!35994 m!167957))

(declare-fun m!167959 () Bool)

(assert (=> d!35994 m!167959))

(declare-fun m!167961 () Bool)

(assert (=> d!35994 m!167961))

(declare-fun m!167963 () Bool)

(assert (=> b!112430 m!167963))

(assert (=> b!112430 m!167959))

(assert (=> b!112430 m!167955))

(declare-fun m!167965 () Bool)

(assert (=> b!112430 m!167965))

(assert (=> b!112430 m!167957))

(assert (=> d!35720 d!35994))

(assert (=> b!112150 d!35696))

(assert (=> b!112150 d!35682))

(declare-fun d!35996 () Bool)

(assert (=> d!35996 (= (remainingBits!0 ((_ sign_extend 32) (size!2316 (buf!2719 (_1!4895 lt!169974)))) ((_ sign_extend 32) (currentByte!5285 (_1!4895 lt!169974))) ((_ sign_extend 32) (currentBit!5280 (_1!4895 lt!169974)))) (bvsub (bvmul ((_ sign_extend 32) (size!2316 (buf!2719 (_1!4895 lt!169974)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5285 (_1!4895 lt!169974))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5280 (_1!4895 lt!169974))))))))

(assert (=> d!35788 d!35996))

(declare-fun d!35998 () Bool)

(assert (=> d!35998 (= (invariant!0 (currentBit!5280 (_1!4895 lt!169974)) (currentByte!5285 (_1!4895 lt!169974)) (size!2316 (buf!2719 (_1!4895 lt!169974)))) (and (bvsge (currentBit!5280 (_1!4895 lt!169974)) #b00000000000000000000000000000000) (bvslt (currentBit!5280 (_1!4895 lt!169974)) #b00000000000000000000000000001000) (bvsge (currentByte!5285 (_1!4895 lt!169974)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5285 (_1!4895 lt!169974)) (size!2316 (buf!2719 (_1!4895 lt!169974)))) (and (= (currentBit!5280 (_1!4895 lt!169974)) #b00000000000000000000000000000000) (= (currentByte!5285 (_1!4895 lt!169974)) (size!2316 (buf!2719 (_1!4895 lt!169974))))))))))

(assert (=> d!35788 d!35998))

(declare-fun d!36000 () Bool)

(assert (=> d!36000 (= (remainingBits!0 ((_ sign_extend 32) (size!2316 (buf!2719 (_1!4895 lt!169969)))) ((_ sign_extend 32) (currentByte!5285 (_1!4895 lt!169969))) ((_ sign_extend 32) (currentBit!5280 (_1!4895 lt!169969)))) (bvsub (bvmul ((_ sign_extend 32) (size!2316 (buf!2719 (_1!4895 lt!169969)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5285 (_1!4895 lt!169969))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5280 (_1!4895 lt!169969))))))))

(assert (=> d!35714 d!36000))

(declare-fun d!36002 () Bool)

(assert (=> d!36002 (= (invariant!0 (currentBit!5280 (_1!4895 lt!169969)) (currentByte!5285 (_1!4895 lt!169969)) (size!2316 (buf!2719 (_1!4895 lt!169969)))) (and (bvsge (currentBit!5280 (_1!4895 lt!169969)) #b00000000000000000000000000000000) (bvslt (currentBit!5280 (_1!4895 lt!169969)) #b00000000000000000000000000001000) (bvsge (currentByte!5285 (_1!4895 lt!169969)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5285 (_1!4895 lt!169969)) (size!2316 (buf!2719 (_1!4895 lt!169969)))) (and (= (currentBit!5280 (_1!4895 lt!169969)) #b00000000000000000000000000000000) (= (currentByte!5285 (_1!4895 lt!169969)) (size!2316 (buf!2719 (_1!4895 lt!169969))))))))))

(assert (=> d!35714 d!36002))

(declare-fun d!36004 () Bool)

(declare-fun res!92839 () Bool)

(declare-fun e!73757 () Bool)

(assert (=> d!36004 (=> (not res!92839) (not e!73757))))

(assert (=> d!36004 (= res!92839 (= (size!2316 (buf!2719 (_2!4896 lt!170172))) (size!2316 (buf!2719 (_2!4894 lt!169962)))))))

(assert (=> d!36004 (= (isPrefixOf!0 (_2!4896 lt!170172) (_2!4894 lt!169962)) e!73757)))

(declare-fun b!112431 () Bool)

(declare-fun res!92841 () Bool)

(assert (=> b!112431 (=> (not res!92841) (not e!73757))))

(assert (=> b!112431 (= res!92841 (bvsle (bitIndex!0 (size!2316 (buf!2719 (_2!4896 lt!170172))) (currentByte!5285 (_2!4896 lt!170172)) (currentBit!5280 (_2!4896 lt!170172))) (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!169962))) (currentByte!5285 (_2!4894 lt!169962)) (currentBit!5280 (_2!4894 lt!169962)))))))

(declare-fun b!112432 () Bool)

(declare-fun e!73758 () Bool)

(assert (=> b!112432 (= e!73757 e!73758)))

(declare-fun res!92840 () Bool)

(assert (=> b!112432 (=> res!92840 e!73758)))

(assert (=> b!112432 (= res!92840 (= (size!2316 (buf!2719 (_2!4896 lt!170172))) #b00000000000000000000000000000000))))

(declare-fun b!112433 () Bool)

(assert (=> b!112433 (= e!73758 (arrayBitRangesEq!0 (buf!2719 (_2!4896 lt!170172)) (buf!2719 (_2!4894 lt!169962)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2316 (buf!2719 (_2!4896 lt!170172))) (currentByte!5285 (_2!4896 lt!170172)) (currentBit!5280 (_2!4896 lt!170172)))))))

(assert (= (and d!36004 res!92839) b!112431))

(assert (= (and b!112431 res!92841) b!112432))

(assert (= (and b!112432 (not res!92840)) b!112433))

(assert (=> b!112431 m!167879))

(assert (=> b!112431 m!166971))

(assert (=> b!112433 m!167879))

(assert (=> b!112433 m!167879))

(declare-fun m!167967 () Bool)

(assert (=> b!112433 m!167967))

(assert (=> b!111982 d!36004))

(declare-fun d!36006 () Bool)

(declare-fun e!73759 () Bool)

(assert (=> d!36006 e!73759))

(declare-fun res!92842 () Bool)

(assert (=> d!36006 (=> (not res!92842) (not e!73759))))

(declare-fun lt!171191 () (_ BitVec 64))

(declare-fun lt!171195 () (_ BitVec 64))

(declare-fun lt!171196 () (_ BitVec 64))

(assert (=> d!36006 (= res!92842 (= lt!171191 (bvsub lt!171195 lt!171196)))))

(assert (=> d!36006 (or (= (bvand lt!171195 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171196 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!171195 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!171195 lt!171196) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36006 (= lt!171196 (remainingBits!0 ((_ sign_extend 32) (size!2316 (buf!2719 (_1!4895 lt!170618)))) ((_ sign_extend 32) (currentByte!5285 (_1!4895 lt!170618))) ((_ sign_extend 32) (currentBit!5280 (_1!4895 lt!170618)))))))

(declare-fun lt!171194 () (_ BitVec 64))

(declare-fun lt!171193 () (_ BitVec 64))

(assert (=> d!36006 (= lt!171195 (bvmul lt!171194 lt!171193))))

(assert (=> d!36006 (or (= lt!171194 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!171193 (bvsdiv (bvmul lt!171194 lt!171193) lt!171194)))))

(assert (=> d!36006 (= lt!171193 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36006 (= lt!171194 ((_ sign_extend 32) (size!2316 (buf!2719 (_1!4895 lt!170618)))))))

(assert (=> d!36006 (= lt!171191 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5285 (_1!4895 lt!170618))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5280 (_1!4895 lt!170618)))))))

(assert (=> d!36006 (invariant!0 (currentBit!5280 (_1!4895 lt!170618)) (currentByte!5285 (_1!4895 lt!170618)) (size!2316 (buf!2719 (_1!4895 lt!170618))))))

(assert (=> d!36006 (= (bitIndex!0 (size!2316 (buf!2719 (_1!4895 lt!170618))) (currentByte!5285 (_1!4895 lt!170618)) (currentBit!5280 (_1!4895 lt!170618))) lt!171191)))

(declare-fun b!112434 () Bool)

(declare-fun res!92843 () Bool)

(assert (=> b!112434 (=> (not res!92843) (not e!73759))))

(assert (=> b!112434 (= res!92843 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!171191))))

(declare-fun b!112435 () Bool)

(declare-fun lt!171192 () (_ BitVec 64))

(assert (=> b!112435 (= e!73759 (bvsle lt!171191 (bvmul lt!171192 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112435 (or (= lt!171192 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!171192 #b0000000000000000000000000000000000000000000000000000000000001000) lt!171192)))))

(assert (=> b!112435 (= lt!171192 ((_ sign_extend 32) (size!2316 (buf!2719 (_1!4895 lt!170618)))))))

(assert (= (and d!36006 res!92842) b!112434))

(assert (= (and b!112434 res!92843) b!112435))

(declare-fun m!167969 () Bool)

(assert (=> d!36006 m!167969))

(declare-fun m!167971 () Bool)

(assert (=> d!36006 m!167971))

(assert (=> b!112131 d!36006))

(assert (=> b!112131 d!35946))

(declare-fun d!36008 () Bool)

(declare-fun lt!171197 () tuple2!9282)

(assert (=> d!36008 (= lt!171197 (readBit!0 (readerFrom!0 (_2!4894 lt!170336) (currentBit!5280 thiss!1305) (currentByte!5285 thiss!1305))))))

(assert (=> d!36008 (= (readBitPure!0 (readerFrom!0 (_2!4894 lt!170336) (currentBit!5280 thiss!1305) (currentByte!5285 thiss!1305))) (tuple2!9271 (_2!4901 lt!171197) (_1!4901 lt!171197)))))

(declare-fun bs!8759 () Bool)

(assert (= bs!8759 d!36008))

(assert (=> bs!8759 m!167229))

(declare-fun m!167973 () Bool)

(assert (=> bs!8759 m!167973))

(assert (=> b!112040 d!36008))

(declare-fun d!36010 () Bool)

(declare-fun e!73760 () Bool)

(assert (=> d!36010 e!73760))

(declare-fun res!92844 () Bool)

(assert (=> d!36010 (=> (not res!92844) (not e!73760))))

(assert (=> d!36010 (= res!92844 (invariant!0 (currentBit!5280 (_2!4894 lt!170336)) (currentByte!5285 (_2!4894 lt!170336)) (size!2316 (buf!2719 (_2!4894 lt!170336)))))))

(assert (=> d!36010 (= (readerFrom!0 (_2!4894 lt!170336) (currentBit!5280 thiss!1305) (currentByte!5285 thiss!1305)) (BitStream!4107 (buf!2719 (_2!4894 lt!170336)) (currentByte!5285 thiss!1305) (currentBit!5280 thiss!1305)))))

(declare-fun b!112436 () Bool)

(assert (=> b!112436 (= e!73760 (invariant!0 (currentBit!5280 thiss!1305) (currentByte!5285 thiss!1305) (size!2316 (buf!2719 (_2!4894 lt!170336)))))))

(assert (= (and d!36010 res!92844) b!112436))

(assert (=> d!36010 m!167871))

(declare-fun m!167975 () Bool)

(assert (=> b!112436 m!167975))

(assert (=> b!112040 d!36010))

(declare-fun d!36012 () Bool)

(declare-fun lt!171198 () tuple2!9282)

(assert (=> d!36012 (= lt!171198 (readBit!0 (readerFrom!0 (_2!4894 lt!170613) (currentBit!5280 (_2!4894 lt!169956)) (currentByte!5285 (_2!4894 lt!169956)))))))

(assert (=> d!36012 (= (readBitPure!0 (readerFrom!0 (_2!4894 lt!170613) (currentBit!5280 (_2!4894 lt!169956)) (currentByte!5285 (_2!4894 lt!169956)))) (tuple2!9271 (_2!4901 lt!171198) (_1!4901 lt!171198)))))

(declare-fun bs!8760 () Bool)

(assert (= bs!8760 d!36012))

(assert (=> bs!8760 m!167391))

(declare-fun m!167977 () Bool)

(assert (=> bs!8760 m!167977))

(assert (=> b!112129 d!36012))

(declare-fun d!36014 () Bool)

(declare-fun e!73761 () Bool)

(assert (=> d!36014 e!73761))

(declare-fun res!92845 () Bool)

(assert (=> d!36014 (=> (not res!92845) (not e!73761))))

(assert (=> d!36014 (= res!92845 (invariant!0 (currentBit!5280 (_2!4894 lt!170613)) (currentByte!5285 (_2!4894 lt!170613)) (size!2316 (buf!2719 (_2!4894 lt!170613)))))))

(assert (=> d!36014 (= (readerFrom!0 (_2!4894 lt!170613) (currentBit!5280 (_2!4894 lt!169956)) (currentByte!5285 (_2!4894 lt!169956))) (BitStream!4107 (buf!2719 (_2!4894 lt!170613)) (currentByte!5285 (_2!4894 lt!169956)) (currentBit!5280 (_2!4894 lt!169956))))))

(declare-fun b!112437 () Bool)

(assert (=> b!112437 (= e!73761 (invariant!0 (currentBit!5280 (_2!4894 lt!169956)) (currentByte!5285 (_2!4894 lt!169956)) (size!2316 (buf!2719 (_2!4894 lt!170613)))))))

(assert (= (and d!36014 res!92845) b!112437))

(assert (=> d!36014 m!167875))

(declare-fun m!167979 () Bool)

(assert (=> b!112437 m!167979))

(assert (=> b!112129 d!36014))

(assert (=> b!111986 d!35696))

(declare-fun d!36016 () Bool)

(assert (=> d!36016 (arrayBitRangesEq!0 (buf!2719 (_2!4894 lt!169962)) (buf!2719 thiss!1305) lt!170166 lt!170159)))

(declare-fun lt!171201 () Unit!6851)

(declare-fun choose!8 (array!5094 array!5094 (_ BitVec 64) (_ BitVec 64)) Unit!6851)

(assert (=> d!36016 (= lt!171201 (choose!8 (buf!2719 thiss!1305) (buf!2719 (_2!4894 lt!169962)) lt!170166 lt!170159))))

(assert (=> d!36016 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!170166) (bvsle lt!170166 lt!170159))))

(assert (=> d!36016 (= (arrayBitRangesEqSymmetric!0 (buf!2719 thiss!1305) (buf!2719 (_2!4894 lt!169962)) lt!170166 lt!170159) lt!171201)))

(declare-fun bs!8761 () Bool)

(assert (= bs!8761 d!36016))

(assert (=> bs!8761 m!167115))

(declare-fun m!167981 () Bool)

(assert (=> bs!8761 m!167981))

(assert (=> b!111986 d!36016))

(declare-fun b!112438 () Bool)

(declare-fun e!73764 () Bool)

(declare-fun e!73766 () Bool)

(assert (=> b!112438 (= e!73764 e!73766)))

(declare-fun res!92848 () Bool)

(declare-fun call!1430 () Bool)

(assert (=> b!112438 (= res!92848 call!1430)))

(assert (=> b!112438 (=> (not res!92848) (not e!73766))))

(declare-fun b!112439 () Bool)

(declare-fun e!73765 () Bool)

(declare-fun e!73762 () Bool)

(assert (=> b!112439 (= e!73765 e!73762)))

(declare-fun res!92847 () Bool)

(assert (=> b!112439 (=> (not res!92847) (not e!73762))))

(declare-fun e!73767 () Bool)

(assert (=> b!112439 (= res!92847 e!73767)))

(declare-fun res!92850 () Bool)

(assert (=> b!112439 (=> res!92850 e!73767)))

(declare-fun lt!171202 () tuple4!78)

(assert (=> b!112439 (= res!92850 (bvsge (_1!4904 lt!171202) (_2!4904 lt!171202)))))

(declare-fun lt!171204 () (_ BitVec 32))

(assert (=> b!112439 (= lt!171204 ((_ extract 31 0) (bvsrem lt!170159 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!171203 () (_ BitVec 32))

(assert (=> b!112439 (= lt!171203 ((_ extract 31 0) (bvsrem lt!170166 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112439 (= lt!171202 (arrayBitIndices!0 lt!170166 lt!170159))))

(declare-fun b!112440 () Bool)

(declare-fun res!92846 () Bool)

(assert (=> b!112440 (= res!92846 (= lt!171204 #b00000000000000000000000000000000))))

(declare-fun e!73763 () Bool)

(assert (=> b!112440 (=> res!92846 e!73763)))

(assert (=> b!112440 (= e!73766 e!73763)))

(declare-fun bm!1427 () Bool)

(declare-fun c!6846 () Bool)

(assert (=> bm!1427 (= call!1430 (byteRangesEq!0 (select (arr!2909 (buf!2719 (_2!4894 lt!169962))) (_3!260 lt!171202)) (select (arr!2909 (buf!2719 thiss!1305)) (_3!260 lt!171202)) lt!171203 (ite c!6846 lt!171204 #b00000000000000000000000000001000)))))

(declare-fun d!36018 () Bool)

(declare-fun res!92849 () Bool)

(assert (=> d!36018 (=> res!92849 e!73765)))

(assert (=> d!36018 (= res!92849 (bvsge lt!170166 lt!170159))))

(assert (=> d!36018 (= (arrayBitRangesEq!0 (buf!2719 (_2!4894 lt!169962)) (buf!2719 thiss!1305) lt!170166 lt!170159) e!73765)))

(declare-fun b!112441 () Bool)

(assert (=> b!112441 (= e!73767 (arrayRangesEq!40 (buf!2719 (_2!4894 lt!169962)) (buf!2719 thiss!1305) (_1!4904 lt!171202) (_2!4904 lt!171202)))))

(declare-fun b!112442 () Bool)

(assert (=> b!112442 (= e!73764 call!1430)))

(declare-fun b!112443 () Bool)

(assert (=> b!112443 (= e!73762 e!73764)))

(assert (=> b!112443 (= c!6846 (= (_3!260 lt!171202) (_4!39 lt!171202)))))

(declare-fun b!112444 () Bool)

(assert (=> b!112444 (= e!73763 (byteRangesEq!0 (select (arr!2909 (buf!2719 (_2!4894 lt!169962))) (_4!39 lt!171202)) (select (arr!2909 (buf!2719 thiss!1305)) (_4!39 lt!171202)) #b00000000000000000000000000000000 lt!171204))))

(assert (= (and d!36018 (not res!92849)) b!112439))

(assert (= (and b!112439 (not res!92850)) b!112441))

(assert (= (and b!112439 res!92847) b!112443))

(assert (= (and b!112443 c!6846) b!112442))

(assert (= (and b!112443 (not c!6846)) b!112438))

(assert (= (and b!112438 res!92848) b!112440))

(assert (= (and b!112440 (not res!92846)) b!112444))

(assert (= (or b!112442 b!112438) bm!1427))

(declare-fun m!167983 () Bool)

(assert (=> b!112439 m!167983))

(declare-fun m!167985 () Bool)

(assert (=> bm!1427 m!167985))

(declare-fun m!167987 () Bool)

(assert (=> bm!1427 m!167987))

(assert (=> bm!1427 m!167985))

(assert (=> bm!1427 m!167987))

(declare-fun m!167989 () Bool)

(assert (=> bm!1427 m!167989))

(declare-fun m!167991 () Bool)

(assert (=> b!112441 m!167991))

(declare-fun m!167993 () Bool)

(assert (=> b!112444 m!167993))

(declare-fun m!167995 () Bool)

(assert (=> b!112444 m!167995))

(assert (=> b!112444 m!167993))

(assert (=> b!112444 m!167995))

(declare-fun m!167997 () Bool)

(assert (=> b!112444 m!167997))

(assert (=> b!111986 d!36018))

(declare-fun d!36020 () Bool)

(declare-fun e!73768 () Bool)

(assert (=> d!36020 e!73768))

(declare-fun res!92851 () Bool)

(assert (=> d!36020 (=> (not res!92851) (not e!73768))))

(assert (=> d!36020 (= res!92851 (= (buf!2719 (_2!4894 (increaseBitIndex!0 (_1!4896 lt!169961)))) (buf!2719 (_1!4896 lt!169961))))))

(declare-fun lt!171208 () Bool)

(assert (=> d!36020 (= lt!171208 (not (= (bvand ((_ sign_extend 24) (select (arr!2909 (buf!2719 (_1!4896 lt!169961))) (currentByte!5285 (_1!4896 lt!169961)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5280 (_1!4896 lt!169961))))) #b00000000000000000000000000000000)))))

(declare-fun lt!171207 () tuple2!9282)

(assert (=> d!36020 (= lt!171207 (tuple2!9283 (not (= (bvand ((_ sign_extend 24) (select (arr!2909 (buf!2719 (_1!4896 lt!169961))) (currentByte!5285 (_1!4896 lt!169961)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5280 (_1!4896 lt!169961))))) #b00000000000000000000000000000000)) (_2!4894 (increaseBitIndex!0 (_1!4896 lt!169961)))))))

(assert (=> d!36020 (validate_offset_bit!0 ((_ sign_extend 32) (size!2316 (buf!2719 (_1!4896 lt!169961)))) ((_ sign_extend 32) (currentByte!5285 (_1!4896 lt!169961))) ((_ sign_extend 32) (currentBit!5280 (_1!4896 lt!169961))))))

(assert (=> d!36020 (= (readBit!0 (_1!4896 lt!169961)) lt!171207)))

(declare-fun lt!171206 () (_ BitVec 64))

(declare-fun b!112445 () Bool)

(declare-fun lt!171211 () (_ BitVec 64))

(assert (=> b!112445 (= e!73768 (= (bitIndex!0 (size!2316 (buf!2719 (_2!4894 (increaseBitIndex!0 (_1!4896 lt!169961))))) (currentByte!5285 (_2!4894 (increaseBitIndex!0 (_1!4896 lt!169961)))) (currentBit!5280 (_2!4894 (increaseBitIndex!0 (_1!4896 lt!169961))))) (bvadd lt!171211 lt!171206)))))

(assert (=> b!112445 (or (not (= (bvand lt!171211 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171206 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!171211 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!171211 lt!171206) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112445 (= lt!171206 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!112445 (= lt!171211 (bitIndex!0 (size!2316 (buf!2719 (_1!4896 lt!169961))) (currentByte!5285 (_1!4896 lt!169961)) (currentBit!5280 (_1!4896 lt!169961))))))

(declare-fun lt!171205 () Bool)

(assert (=> b!112445 (= lt!171205 (not (= (bvand ((_ sign_extend 24) (select (arr!2909 (buf!2719 (_1!4896 lt!169961))) (currentByte!5285 (_1!4896 lt!169961)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5280 (_1!4896 lt!169961))))) #b00000000000000000000000000000000)))))

(declare-fun lt!171209 () Bool)

(assert (=> b!112445 (= lt!171209 (not (= (bvand ((_ sign_extend 24) (select (arr!2909 (buf!2719 (_1!4896 lt!169961))) (currentByte!5285 (_1!4896 lt!169961)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5280 (_1!4896 lt!169961))))) #b00000000000000000000000000000000)))))

(declare-fun lt!171210 () Bool)

(assert (=> b!112445 (= lt!171210 (not (= (bvand ((_ sign_extend 24) (select (arr!2909 (buf!2719 (_1!4896 lt!169961))) (currentByte!5285 (_1!4896 lt!169961)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5280 (_1!4896 lt!169961))))) #b00000000000000000000000000000000)))))

(assert (= (and d!36020 res!92851) b!112445))

(declare-fun m!167999 () Bool)

(assert (=> d!36020 m!167999))

(declare-fun m!168001 () Bool)

(assert (=> d!36020 m!168001))

(declare-fun m!168003 () Bool)

(assert (=> d!36020 m!168003))

(declare-fun m!168005 () Bool)

(assert (=> d!36020 m!168005))

(assert (=> b!112445 m!167065))

(assert (=> b!112445 m!168003))

(assert (=> b!112445 m!167999))

(declare-fun m!168007 () Bool)

(assert (=> b!112445 m!168007))

(assert (=> b!112445 m!168001))

(assert (=> d!35712 d!36020))

(assert (=> b!112157 d!35688))

(declare-fun d!36022 () Bool)

(assert (=> d!36022 (arrayBitRangesEq!0 (buf!2719 (_2!4894 lt!169962)) (buf!2719 (_2!4894 lt!169956)) lt!170649 lt!170642)))

(declare-fun lt!171212 () Unit!6851)

(assert (=> d!36022 (= lt!171212 (choose!8 (buf!2719 (_2!4894 lt!169956)) (buf!2719 (_2!4894 lt!169962)) lt!170649 lt!170642))))

(assert (=> d!36022 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!170649) (bvsle lt!170649 lt!170642))))

(assert (=> d!36022 (= (arrayBitRangesEqSymmetric!0 (buf!2719 (_2!4894 lt!169956)) (buf!2719 (_2!4894 lt!169962)) lt!170649 lt!170642) lt!171212)))

(declare-fun bs!8762 () Bool)

(assert (= bs!8762 d!36022))

(assert (=> bs!8762 m!167477))

(declare-fun m!168009 () Bool)

(assert (=> bs!8762 m!168009))

(assert (=> b!112157 d!36022))

(declare-fun b!112446 () Bool)

(declare-fun e!73771 () Bool)

(declare-fun e!73773 () Bool)

(assert (=> b!112446 (= e!73771 e!73773)))

(declare-fun res!92854 () Bool)

(declare-fun call!1431 () Bool)

(assert (=> b!112446 (= res!92854 call!1431)))

(assert (=> b!112446 (=> (not res!92854) (not e!73773))))

(declare-fun b!112447 () Bool)

(declare-fun e!73772 () Bool)

(declare-fun e!73769 () Bool)

(assert (=> b!112447 (= e!73772 e!73769)))

(declare-fun res!92853 () Bool)

(assert (=> b!112447 (=> (not res!92853) (not e!73769))))

(declare-fun e!73774 () Bool)

(assert (=> b!112447 (= res!92853 e!73774)))

(declare-fun res!92856 () Bool)

(assert (=> b!112447 (=> res!92856 e!73774)))

(declare-fun lt!171213 () tuple4!78)

(assert (=> b!112447 (= res!92856 (bvsge (_1!4904 lt!171213) (_2!4904 lt!171213)))))

(declare-fun lt!171215 () (_ BitVec 32))

(assert (=> b!112447 (= lt!171215 ((_ extract 31 0) (bvsrem lt!170642 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!171214 () (_ BitVec 32))

(assert (=> b!112447 (= lt!171214 ((_ extract 31 0) (bvsrem lt!170649 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112447 (= lt!171213 (arrayBitIndices!0 lt!170649 lt!170642))))

(declare-fun b!112448 () Bool)

(declare-fun res!92852 () Bool)

(assert (=> b!112448 (= res!92852 (= lt!171215 #b00000000000000000000000000000000))))

(declare-fun e!73770 () Bool)

(assert (=> b!112448 (=> res!92852 e!73770)))

(assert (=> b!112448 (= e!73773 e!73770)))

(declare-fun c!6847 () Bool)

(declare-fun bm!1428 () Bool)

(assert (=> bm!1428 (= call!1431 (byteRangesEq!0 (select (arr!2909 (buf!2719 (_2!4894 lt!169962))) (_3!260 lt!171213)) (select (arr!2909 (buf!2719 (_2!4894 lt!169956))) (_3!260 lt!171213)) lt!171214 (ite c!6847 lt!171215 #b00000000000000000000000000001000)))))

(declare-fun d!36024 () Bool)

(declare-fun res!92855 () Bool)

(assert (=> d!36024 (=> res!92855 e!73772)))

(assert (=> d!36024 (= res!92855 (bvsge lt!170649 lt!170642))))

(assert (=> d!36024 (= (arrayBitRangesEq!0 (buf!2719 (_2!4894 lt!169962)) (buf!2719 (_2!4894 lt!169956)) lt!170649 lt!170642) e!73772)))

(declare-fun b!112449 () Bool)

(assert (=> b!112449 (= e!73774 (arrayRangesEq!40 (buf!2719 (_2!4894 lt!169962)) (buf!2719 (_2!4894 lt!169956)) (_1!4904 lt!171213) (_2!4904 lt!171213)))))

(declare-fun b!112450 () Bool)

(assert (=> b!112450 (= e!73771 call!1431)))

(declare-fun b!112451 () Bool)

(assert (=> b!112451 (= e!73769 e!73771)))

(assert (=> b!112451 (= c!6847 (= (_3!260 lt!171213) (_4!39 lt!171213)))))

(declare-fun b!112452 () Bool)

(assert (=> b!112452 (= e!73770 (byteRangesEq!0 (select (arr!2909 (buf!2719 (_2!4894 lt!169962))) (_4!39 lt!171213)) (select (arr!2909 (buf!2719 (_2!4894 lt!169956))) (_4!39 lt!171213)) #b00000000000000000000000000000000 lt!171215))))

(assert (= (and d!36024 (not res!92855)) b!112447))

(assert (= (and b!112447 (not res!92856)) b!112449))

(assert (= (and b!112447 res!92853) b!112451))

(assert (= (and b!112451 c!6847) b!112450))

(assert (= (and b!112451 (not c!6847)) b!112446))

(assert (= (and b!112446 res!92854) b!112448))

(assert (= (and b!112448 (not res!92852)) b!112452))

(assert (= (or b!112450 b!112446) bm!1428))

(declare-fun m!168011 () Bool)

(assert (=> b!112447 m!168011))

(declare-fun m!168013 () Bool)

(assert (=> bm!1428 m!168013))

(declare-fun m!168015 () Bool)

(assert (=> bm!1428 m!168015))

(assert (=> bm!1428 m!168013))

(assert (=> bm!1428 m!168015))

(declare-fun m!168017 () Bool)

(assert (=> bm!1428 m!168017))

(declare-fun m!168019 () Bool)

(assert (=> b!112449 m!168019))

(declare-fun m!168021 () Bool)

(assert (=> b!112452 m!168021))

(declare-fun m!168023 () Bool)

(assert (=> b!112452 m!168023))

(assert (=> b!112452 m!168021))

(assert (=> b!112452 m!168023))

(declare-fun m!168025 () Bool)

(assert (=> b!112452 m!168025))

(assert (=> b!112157 d!36024))

(assert (=> b!112038 d!35944))

(assert (=> b!112038 d!35696))

(declare-fun d!36026 () Bool)

(declare-fun res!92857 () Bool)

(declare-fun e!73775 () Bool)

(assert (=> d!36026 (=> (not res!92857) (not e!73775))))

(assert (=> d!36026 (= res!92857 (= (size!2316 (buf!2719 (_2!4894 lt!169956))) (size!2316 (buf!2719 (_2!4894 lt!170604)))))))

(assert (=> d!36026 (= (isPrefixOf!0 (_2!4894 lt!169956) (_2!4894 lt!170604)) e!73775)))

(declare-fun b!112453 () Bool)

(declare-fun res!92859 () Bool)

(assert (=> b!112453 (=> (not res!92859) (not e!73775))))

(assert (=> b!112453 (= res!92859 (bvsle (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!169956))) (currentByte!5285 (_2!4894 lt!169956)) (currentBit!5280 (_2!4894 lt!169956))) (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!170604))) (currentByte!5285 (_2!4894 lt!170604)) (currentBit!5280 (_2!4894 lt!170604)))))))

(declare-fun b!112454 () Bool)

(declare-fun e!73776 () Bool)

(assert (=> b!112454 (= e!73775 e!73776)))

(declare-fun res!92858 () Bool)

(assert (=> b!112454 (=> res!92858 e!73776)))

(assert (=> b!112454 (= res!92858 (= (size!2316 (buf!2719 (_2!4894 lt!169956))) #b00000000000000000000000000000000))))

(declare-fun b!112455 () Bool)

(assert (=> b!112455 (= e!73776 (arrayBitRangesEq!0 (buf!2719 (_2!4894 lt!169956)) (buf!2719 (_2!4894 lt!170604)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!169956))) (currentByte!5285 (_2!4894 lt!169956)) (currentBit!5280 (_2!4894 lt!169956)))))))

(assert (= (and d!36026 res!92857) b!112453))

(assert (= (and b!112453 res!92859) b!112454))

(assert (= (and b!112454 (not res!92858)) b!112455))

(assert (=> b!112453 m!166973))

(assert (=> b!112453 m!167389))

(assert (=> b!112455 m!166973))

(assert (=> b!112455 m!166973))

(declare-fun m!168027 () Bool)

(assert (=> b!112455 m!168027))

(assert (=> b!112127 d!36026))

(declare-fun d!36028 () Bool)

(declare-fun e!73777 () Bool)

(assert (=> d!36028 e!73777))

(declare-fun res!92860 () Bool)

(assert (=> d!36028 (=> (not res!92860) (not e!73777))))

(declare-fun lt!171220 () (_ BitVec 64))

(declare-fun lt!171216 () (_ BitVec 64))

(declare-fun lt!171221 () (_ BitVec 64))

(assert (=> d!36028 (= res!92860 (= lt!171216 (bvsub lt!171220 lt!171221)))))

(assert (=> d!36028 (or (= (bvand lt!171220 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171221 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!171220 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!171220 lt!171221) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36028 (= lt!171221 (remainingBits!0 ((_ sign_extend 32) (size!2316 (buf!2719 (_1!4895 lt!170579)))) ((_ sign_extend 32) (currentByte!5285 (_1!4895 lt!170579))) ((_ sign_extend 32) (currentBit!5280 (_1!4895 lt!170579)))))))

(declare-fun lt!171219 () (_ BitVec 64))

(declare-fun lt!171218 () (_ BitVec 64))

(assert (=> d!36028 (= lt!171220 (bvmul lt!171219 lt!171218))))

(assert (=> d!36028 (or (= lt!171219 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!171218 (bvsdiv (bvmul lt!171219 lt!171218) lt!171219)))))

(assert (=> d!36028 (= lt!171218 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36028 (= lt!171219 ((_ sign_extend 32) (size!2316 (buf!2719 (_1!4895 lt!170579)))))))

(assert (=> d!36028 (= lt!171216 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5285 (_1!4895 lt!170579))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5280 (_1!4895 lt!170579)))))))

(assert (=> d!36028 (invariant!0 (currentBit!5280 (_1!4895 lt!170579)) (currentByte!5285 (_1!4895 lt!170579)) (size!2316 (buf!2719 (_1!4895 lt!170579))))))

(assert (=> d!36028 (= (bitIndex!0 (size!2316 (buf!2719 (_1!4895 lt!170579))) (currentByte!5285 (_1!4895 lt!170579)) (currentBit!5280 (_1!4895 lt!170579))) lt!171216)))

(declare-fun b!112456 () Bool)

(declare-fun res!92861 () Bool)

(assert (=> b!112456 (=> (not res!92861) (not e!73777))))

(assert (=> b!112456 (= res!92861 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!171216))))

(declare-fun b!112457 () Bool)

(declare-fun lt!171217 () (_ BitVec 64))

(assert (=> b!112457 (= e!73777 (bvsle lt!171216 (bvmul lt!171217 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112457 (or (= lt!171217 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!171217 #b0000000000000000000000000000000000000000000000000000000000001000) lt!171217)))))

(assert (=> b!112457 (= lt!171217 ((_ sign_extend 32) (size!2316 (buf!2719 (_1!4895 lt!170579)))))))

(assert (= (and d!36028 res!92860) b!112456))

(assert (= (and b!112456 res!92861) b!112457))

(declare-fun m!168029 () Bool)

(assert (=> d!36028 m!168029))

(declare-fun m!168031 () Bool)

(assert (=> d!36028 m!168031))

(assert (=> b!112136 d!36028))

(declare-fun d!36030 () Bool)

(assert (=> d!36030 (isPrefixOf!0 (_2!4894 lt!169956) (_2!4894 lt!170582))))

(declare-fun lt!171222 () Unit!6851)

(assert (=> d!36030 (= lt!171222 (choose!30 (_2!4894 lt!169956) (_2!4894 lt!170597) (_2!4894 lt!170582)))))

(assert (=> d!36030 (isPrefixOf!0 (_2!4894 lt!169956) (_2!4894 lt!170597))))

(assert (=> d!36030 (= (lemmaIsPrefixTransitive!0 (_2!4894 lt!169956) (_2!4894 lt!170597) (_2!4894 lt!170582)) lt!171222)))

(declare-fun bs!8763 () Bool)

(assert (= bs!8763 d!36030))

(assert (=> bs!8763 m!167429))

(declare-fun m!168033 () Bool)

(assert (=> bs!8763 m!168033))

(declare-fun m!168035 () Bool)

(assert (=> bs!8763 m!168035))

(assert (=> b!112136 d!36030))

(declare-fun d!36032 () Bool)

(assert (=> d!36032 (= (invariant!0 (currentBit!5280 lt!170615) (currentByte!5285 lt!170615) (size!2316 (buf!2719 (_2!4894 lt!170582)))) (and (bvsge (currentBit!5280 lt!170615) #b00000000000000000000000000000000) (bvslt (currentBit!5280 lt!170615) #b00000000000000000000000000001000) (bvsge (currentByte!5285 lt!170615) #b00000000000000000000000000000000) (or (bvslt (currentByte!5285 lt!170615) (size!2316 (buf!2719 (_2!4894 lt!170582)))) (and (= (currentBit!5280 lt!170615) #b00000000000000000000000000000000) (= (currentByte!5285 lt!170615) (size!2316 (buf!2719 (_2!4894 lt!170582))))))))))

(assert (=> b!112136 d!36032))

(declare-fun d!36034 () Bool)

(declare-fun e!73778 () Bool)

(assert (=> d!36034 e!73778))

(declare-fun res!92862 () Bool)

(assert (=> d!36034 (=> (not res!92862) (not e!73778))))

(declare-fun lt!171224 () (_ BitVec 64))

(declare-fun lt!171223 () BitStream!4106)

(assert (=> d!36034 (= res!92862 (= (bvadd lt!171224 (bvsub (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!170597))) (currentByte!5285 (_2!4894 lt!170597)) (currentBit!5280 (_2!4894 lt!170597))) (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!170582))) (currentByte!5285 (_2!4894 lt!170582)) (currentBit!5280 (_2!4894 lt!170582))))) (bitIndex!0 (size!2316 (buf!2719 lt!171223)) (currentByte!5285 lt!171223) (currentBit!5280 lt!171223))))))

(assert (=> d!36034 (or (not (= (bvand lt!171224 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!170597))) (currentByte!5285 (_2!4894 lt!170597)) (currentBit!5280 (_2!4894 lt!170597))) (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!170582))) (currentByte!5285 (_2!4894 lt!170582)) (currentBit!5280 (_2!4894 lt!170582)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!171224 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!171224 (bvsub (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!170597))) (currentByte!5285 (_2!4894 lt!170597)) (currentBit!5280 (_2!4894 lt!170597))) (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!170582))) (currentByte!5285 (_2!4894 lt!170582)) (currentBit!5280 (_2!4894 lt!170582))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36034 (= lt!171224 (bitIndex!0 (size!2316 (buf!2719 (_2!4896 lt!170596))) (currentByte!5285 (_2!4896 lt!170596)) (currentBit!5280 (_2!4896 lt!170596))))))

(assert (=> d!36034 (= lt!171223 (_2!4894 (moveBitIndex!0 (_2!4896 lt!170596) (bvsub (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!170597))) (currentByte!5285 (_2!4894 lt!170597)) (currentBit!5280 (_2!4894 lt!170597))) (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!170582))) (currentByte!5285 (_2!4894 lt!170582)) (currentBit!5280 (_2!4894 lt!170582)))))))))

(assert (=> d!36034 (moveBitIndexPrecond!0 (_2!4896 lt!170596) (bvsub (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!170597))) (currentByte!5285 (_2!4894 lt!170597)) (currentBit!5280 (_2!4894 lt!170597))) (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!170582))) (currentByte!5285 (_2!4894 lt!170582)) (currentBit!5280 (_2!4894 lt!170582)))))))

(assert (=> d!36034 (= (withMovedBitIndex!0 (_2!4896 lt!170596) (bvsub (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!170597))) (currentByte!5285 (_2!4894 lt!170597)) (currentBit!5280 (_2!4894 lt!170597))) (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!170582))) (currentByte!5285 (_2!4894 lt!170582)) (currentBit!5280 (_2!4894 lt!170582))))) lt!171223)))

(declare-fun b!112458 () Bool)

(assert (=> b!112458 (= e!73778 (= (size!2316 (buf!2719 (_2!4896 lt!170596))) (size!2316 (buf!2719 lt!171223))))))

(assert (= (and d!36034 res!92862) b!112458))

(declare-fun m!168037 () Bool)

(assert (=> d!36034 m!168037))

(declare-fun m!168039 () Bool)

(assert (=> d!36034 m!168039))

(declare-fun m!168041 () Bool)

(assert (=> d!36034 m!168041))

(declare-fun m!168043 () Bool)

(assert (=> d!36034 m!168043))

(assert (=> b!112136 d!36034))

(declare-fun d!36036 () Bool)

(assert (=> d!36036 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!170582)))) ((_ sign_extend 32) (currentByte!5285 (_2!4894 lt!170597))) ((_ sign_extend 32) (currentBit!5280 (_2!4894 lt!170597))) lt!170580) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!170582)))) ((_ sign_extend 32) (currentByte!5285 (_2!4894 lt!170597))) ((_ sign_extend 32) (currentBit!5280 (_2!4894 lt!170597)))) lt!170580))))

(declare-fun bs!8764 () Bool)

(assert (= bs!8764 d!36036))

(declare-fun m!168045 () Bool)

(assert (=> bs!8764 m!168045))

(assert (=> b!112136 d!36036))

(declare-fun b!112460 () Bool)

(declare-fun res!92866 () Bool)

(declare-fun e!73779 () Bool)

(assert (=> b!112460 (=> (not res!92866) (not e!73779))))

(declare-fun lt!171226 () tuple2!9268)

(assert (=> b!112460 (= res!92866 (isPrefixOf!0 (_2!4894 lt!169956) (_2!4894 lt!171226)))))

(declare-fun d!36038 () Bool)

(assert (=> d!36038 e!73779))

(declare-fun res!92863 () Bool)

(assert (=> d!36038 (=> (not res!92863) (not e!73779))))

(assert (=> d!36038 (= res!92863 (= (size!2316 (buf!2719 (_2!4894 lt!169956))) (size!2316 (buf!2719 (_2!4894 lt!171226)))))))

(assert (=> d!36038 (= lt!171226 (choose!16 (_2!4894 lt!169956) lt!170601))))

(assert (=> d!36038 (validate_offset_bit!0 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!169956)))) ((_ sign_extend 32) (currentByte!5285 (_2!4894 lt!169956))) ((_ sign_extend 32) (currentBit!5280 (_2!4894 lt!169956))))))

(assert (=> d!36038 (= (appendBit!0 (_2!4894 lt!169956) lt!170601) lt!171226)))

(declare-fun b!112461 () Bool)

(declare-fun e!73780 () Bool)

(assert (=> b!112461 (= e!73779 e!73780)))

(declare-fun res!92864 () Bool)

(assert (=> b!112461 (=> (not res!92864) (not e!73780))))

(declare-fun lt!171225 () tuple2!9270)

(assert (=> b!112461 (= res!92864 (and (= (_2!4895 lt!171225) lt!170601) (= (_1!4895 lt!171225) (_2!4894 lt!171226))))))

(assert (=> b!112461 (= lt!171225 (readBitPure!0 (readerFrom!0 (_2!4894 lt!171226) (currentBit!5280 (_2!4894 lt!169956)) (currentByte!5285 (_2!4894 lt!169956)))))))

(declare-fun b!112462 () Bool)

(assert (=> b!112462 (= e!73780 (= (bitIndex!0 (size!2316 (buf!2719 (_1!4895 lt!171225))) (currentByte!5285 (_1!4895 lt!171225)) (currentBit!5280 (_1!4895 lt!171225))) (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!171226))) (currentByte!5285 (_2!4894 lt!171226)) (currentBit!5280 (_2!4894 lt!171226)))))))

(declare-fun b!112459 () Bool)

(declare-fun res!92865 () Bool)

(assert (=> b!112459 (=> (not res!92865) (not e!73779))))

(declare-fun lt!171228 () (_ BitVec 64))

(declare-fun lt!171227 () (_ BitVec 64))

(assert (=> b!112459 (= res!92865 (= (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!171226))) (currentByte!5285 (_2!4894 lt!171226)) (currentBit!5280 (_2!4894 lt!171226))) (bvadd lt!171228 lt!171227)))))

(assert (=> b!112459 (or (not (= (bvand lt!171228 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171227 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!171228 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!171228 lt!171227) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112459 (= lt!171227 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!112459 (= lt!171228 (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!169956))) (currentByte!5285 (_2!4894 lt!169956)) (currentBit!5280 (_2!4894 lt!169956))))))

(assert (= (and d!36038 res!92863) b!112459))

(assert (= (and b!112459 res!92865) b!112460))

(assert (= (and b!112460 res!92866) b!112461))

(assert (= (and b!112461 res!92864) b!112462))

(declare-fun m!168047 () Bool)

(assert (=> b!112460 m!168047))

(declare-fun m!168049 () Bool)

(assert (=> b!112462 m!168049))

(declare-fun m!168051 () Bool)

(assert (=> b!112462 m!168051))

(assert (=> b!112459 m!168051))

(assert (=> b!112459 m!166973))

(declare-fun m!168053 () Bool)

(assert (=> b!112461 m!168053))

(assert (=> b!112461 m!168053))

(declare-fun m!168055 () Bool)

(assert (=> b!112461 m!168055))

(declare-fun m!168057 () Bool)

(assert (=> d!36038 m!168057))

(declare-fun m!168059 () Bool)

(assert (=> d!36038 m!168059))

(assert (=> b!112136 d!36038))

(declare-fun d!36040 () Bool)

(declare-fun e!73781 () Bool)

(assert (=> d!36040 e!73781))

(declare-fun res!92867 () Bool)

(assert (=> d!36040 (=> (not res!92867) (not e!73781))))

(declare-fun lt!171230 () (_ BitVec 64))

(declare-fun lt!171229 () BitStream!4106)

(assert (=> d!36040 (= res!92867 (= (bvadd lt!171230 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2316 (buf!2719 lt!171229)) (currentByte!5285 lt!171229) (currentBit!5280 lt!171229))))))

(assert (=> d!36040 (or (not (= (bvand lt!171230 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!171230 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!171230 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36040 (= lt!171230 (bitIndex!0 (size!2316 (buf!2719 (_1!4896 lt!170589))) (currentByte!5285 (_1!4896 lt!170589)) (currentBit!5280 (_1!4896 lt!170589))))))

(assert (=> d!36040 (= lt!171229 (_2!4894 (moveBitIndex!0 (_1!4896 lt!170589) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!36040 (moveBitIndexPrecond!0 (_1!4896 lt!170589) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!36040 (= (withMovedBitIndex!0 (_1!4896 lt!170589) #b0000000000000000000000000000000000000000000000000000000000000001) lt!171229)))

(declare-fun b!112463 () Bool)

(assert (=> b!112463 (= e!73781 (= (size!2316 (buf!2719 (_1!4896 lt!170589))) (size!2316 (buf!2719 lt!171229))))))

(assert (= (and d!36040 res!92867) b!112463))

(declare-fun m!168061 () Bool)

(assert (=> d!36040 m!168061))

(declare-fun m!168063 () Bool)

(assert (=> d!36040 m!168063))

(declare-fun m!168065 () Bool)

(assert (=> d!36040 m!168065))

(declare-fun m!168067 () Bool)

(assert (=> d!36040 m!168067))

(assert (=> b!112136 d!36040))

(declare-fun d!36042 () Bool)

(declare-fun e!73782 () Bool)

(assert (=> d!36042 e!73782))

(declare-fun res!92868 () Bool)

(assert (=> d!36042 (=> (not res!92868) (not e!73782))))

(declare-fun lt!171233 () tuple2!9270)

(declare-fun lt!171232 () tuple2!9270)

(assert (=> d!36042 (= res!92868 (= (bitIndex!0 (size!2316 (buf!2719 (_1!4895 lt!171233))) (currentByte!5285 (_1!4895 lt!171233)) (currentBit!5280 (_1!4895 lt!171233))) (bitIndex!0 (size!2316 (buf!2719 (_1!4895 lt!171232))) (currentByte!5285 (_1!4895 lt!171232)) (currentBit!5280 (_1!4895 lt!171232)))))))

(declare-fun lt!171231 () Unit!6851)

(declare-fun lt!171234 () BitStream!4106)

(assert (=> d!36042 (= lt!171231 (choose!50 lt!170615 (_2!4894 lt!170582) lt!171234 lt!171233 (tuple2!9271 (_1!4895 lt!171233) (_2!4895 lt!171233)) (_1!4895 lt!171233) (_2!4895 lt!171233) lt!171232 (tuple2!9271 (_1!4895 lt!171232) (_2!4895 lt!171232)) (_1!4895 lt!171232) (_2!4895 lt!171232)))))

(assert (=> d!36042 (= lt!171232 (readBitPure!0 lt!171234))))

(assert (=> d!36042 (= lt!171233 (readBitPure!0 lt!170615))))

(assert (=> d!36042 (= lt!171234 (BitStream!4107 (buf!2719 (_2!4894 lt!170582)) (currentByte!5285 lt!170615) (currentBit!5280 lt!170615)))))

(assert (=> d!36042 (invariant!0 (currentBit!5280 lt!170615) (currentByte!5285 lt!170615) (size!2316 (buf!2719 (_2!4894 lt!170582))))))

(assert (=> d!36042 (= (readBitPrefixLemma!0 lt!170615 (_2!4894 lt!170582)) lt!171231)))

(declare-fun b!112464 () Bool)

(assert (=> b!112464 (= e!73782 (= (_2!4895 lt!171233) (_2!4895 lt!171232)))))

(assert (= (and d!36042 res!92868) b!112464))

(assert (=> d!36042 m!167409))

(declare-fun m!168069 () Bool)

(assert (=> d!36042 m!168069))

(declare-fun m!168071 () Bool)

(assert (=> d!36042 m!168071))

(declare-fun m!168073 () Bool)

(assert (=> d!36042 m!168073))

(declare-fun m!168075 () Bool)

(assert (=> d!36042 m!168075))

(assert (=> d!36042 m!167435))

(assert (=> b!112136 d!36042))

(declare-fun d!36044 () Bool)

(declare-fun lt!171235 () tuple2!9280)

(assert (=> d!36044 (= lt!171235 (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 (_1!4896 lt!170589) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!170617 e!73566)))))

(assert (=> d!36044 (= (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4896 lt!170589) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!170617 e!73566)) (tuple2!9275 (_2!4900 lt!171235) (_1!4900 lt!171235)))))

(declare-fun bs!8765 () Bool)

(assert (= bs!8765 d!36044))

(assert (=> bs!8765 m!167401))

(declare-fun m!168077 () Bool)

(assert (=> bs!8765 m!168077))

(assert (=> b!112136 d!36044))

(declare-fun d!36046 () Bool)

(declare-fun lt!171239 () tuple2!9274)

(declare-fun lt!171241 () tuple2!9274)

(assert (=> d!36046 (and (= (_2!4897 lt!171239) (_2!4897 lt!171241)) (= (_1!4897 lt!171239) (_1!4897 lt!171241)))))

(declare-fun lt!171237 () BitStream!4106)

(declare-fun lt!171240 () Unit!6851)

(declare-fun lt!171238 () Bool)

(declare-fun lt!171236 () (_ BitVec 64))

(assert (=> d!36046 (= lt!171240 (choose!45 (_1!4896 lt!170589) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!170617 lt!171239 (tuple2!9275 (_1!4897 lt!171239) (_2!4897 lt!171239)) (_1!4897 lt!171239) (_2!4897 lt!171239) lt!171238 lt!171237 lt!171236 lt!171241 (tuple2!9275 (_1!4897 lt!171241) (_2!4897 lt!171241)) (_1!4897 lt!171241) (_2!4897 lt!171241)))))

(assert (=> d!36046 (= lt!171241 (readNLeastSignificantBitsLoopPure!0 lt!171237 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!171236))))

(assert (=> d!36046 (= lt!171236 (bvor lt!170617 (ite lt!171238 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36046 (= lt!171237 (withMovedBitIndex!0 (_1!4896 lt!170589) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!36046 (= lt!171238 (_2!4895 (readBitPure!0 (_1!4896 lt!170589))))))

(assert (=> d!36046 (= lt!171239 (readNLeastSignificantBitsLoopPure!0 (_1!4896 lt!170589) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!170617))))

(assert (=> d!36046 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4896 lt!170589) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!170617) lt!171240)))

(declare-fun bs!8766 () Bool)

(assert (= bs!8766 d!36046))

(assert (=> bs!8766 m!167427))

(declare-fun m!168079 () Bool)

(assert (=> bs!8766 m!168079))

(declare-fun m!168081 () Bool)

(assert (=> bs!8766 m!168081))

(assert (=> bs!8766 m!167443))

(assert (=> bs!8766 m!167401))

(assert (=> b!112136 d!36046))

(declare-fun d!36048 () Bool)

(declare-fun lt!171242 () tuple2!9282)

(assert (=> d!36048 (= lt!171242 (readBit!0 (_1!4896 lt!170589)))))

(assert (=> d!36048 (= (readBitPure!0 (_1!4896 lt!170589)) (tuple2!9271 (_2!4901 lt!171242) (_1!4901 lt!171242)))))

(declare-fun bs!8767 () Bool)

(assert (= bs!8767 d!36048))

(declare-fun m!168083 () Bool)

(assert (=> bs!8767 m!168083))

(assert (=> b!112136 d!36048))

(declare-fun d!36050 () Bool)

(assert (=> d!36050 (validate_offset_bits!1 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!170582)))) ((_ sign_extend 32) (currentByte!5285 (_2!4894 lt!170597))) ((_ sign_extend 32) (currentBit!5280 (_2!4894 lt!170597))) lt!170580)))

(declare-fun lt!171243 () Unit!6851)

(assert (=> d!36050 (= lt!171243 (choose!9 (_2!4894 lt!170597) (buf!2719 (_2!4894 lt!170582)) lt!170580 (BitStream!4107 (buf!2719 (_2!4894 lt!170582)) (currentByte!5285 (_2!4894 lt!170597)) (currentBit!5280 (_2!4894 lt!170597)))))))

(assert (=> d!36050 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4894 lt!170597) (buf!2719 (_2!4894 lt!170582)) lt!170580) lt!171243)))

(declare-fun bs!8768 () Bool)

(assert (= bs!8768 d!36050))

(assert (=> bs!8768 m!167447))

(declare-fun m!168085 () Bool)

(assert (=> bs!8768 m!168085))

(assert (=> b!112136 d!36050))

(declare-fun lt!171244 () tuple2!9280)

(declare-fun d!36052 () Bool)

(assert (=> d!36052 (= lt!171244 (readNLeastSignificantBitsLoop!0 (_1!4896 lt!170589) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!170617))))

(assert (=> d!36052 (= (readNLeastSignificantBitsLoopPure!0 (_1!4896 lt!170589) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!170617) (tuple2!9275 (_2!4900 lt!171244) (_1!4900 lt!171244)))))

(declare-fun bs!8769 () Bool)

(assert (= bs!8769 d!36052))

(declare-fun m!168087 () Bool)

(assert (=> bs!8769 m!168087))

(assert (=> b!112136 d!36052))

(declare-fun b!112466 () Bool)

(declare-fun res!92870 () Bool)

(declare-fun e!73783 () Bool)

(assert (=> b!112466 (=> (not res!92870) (not e!73783))))

(declare-fun lt!171262 () tuple2!9272)

(assert (=> b!112466 (= res!92870 (isPrefixOf!0 (_1!4896 lt!171262) (_2!4894 lt!169956)))))

(declare-fun b!112467 () Bool)

(declare-fun e!73784 () Unit!6851)

(declare-fun Unit!6889 () Unit!6851)

(assert (=> b!112467 (= e!73784 Unit!6889)))

(declare-fun lt!171248 () (_ BitVec 64))

(declare-fun b!112468 () Bool)

(declare-fun lt!171245 () (_ BitVec 64))

(assert (=> b!112468 (= e!73783 (= (_1!4896 lt!171262) (withMovedBitIndex!0 (_2!4896 lt!171262) (bvsub lt!171245 lt!171248))))))

(assert (=> b!112468 (or (= (bvand lt!171245 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171248 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!171245 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!171245 lt!171248) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112468 (= lt!171248 (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!170582))) (currentByte!5285 (_2!4894 lt!170582)) (currentBit!5280 (_2!4894 lt!170582))))))

(assert (=> b!112468 (= lt!171245 (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!169956))) (currentByte!5285 (_2!4894 lt!169956)) (currentBit!5280 (_2!4894 lt!169956))))))

(declare-fun b!112469 () Bool)

(declare-fun lt!171247 () Unit!6851)

(assert (=> b!112469 (= e!73784 lt!171247)))

(declare-fun lt!171256 () (_ BitVec 64))

(assert (=> b!112469 (= lt!171256 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!171249 () (_ BitVec 64))

(assert (=> b!112469 (= lt!171249 (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!169956))) (currentByte!5285 (_2!4894 lt!169956)) (currentBit!5280 (_2!4894 lt!169956))))))

(assert (=> b!112469 (= lt!171247 (arrayBitRangesEqSymmetric!0 (buf!2719 (_2!4894 lt!169956)) (buf!2719 (_2!4894 lt!170582)) lt!171256 lt!171249))))

(assert (=> b!112469 (arrayBitRangesEq!0 (buf!2719 (_2!4894 lt!170582)) (buf!2719 (_2!4894 lt!169956)) lt!171256 lt!171249)))

(declare-fun b!112465 () Bool)

(declare-fun res!92871 () Bool)

(assert (=> b!112465 (=> (not res!92871) (not e!73783))))

(assert (=> b!112465 (= res!92871 (isPrefixOf!0 (_2!4896 lt!171262) (_2!4894 lt!170582)))))

(declare-fun d!36054 () Bool)

(assert (=> d!36054 e!73783))

(declare-fun res!92869 () Bool)

(assert (=> d!36054 (=> (not res!92869) (not e!73783))))

(assert (=> d!36054 (= res!92869 (isPrefixOf!0 (_1!4896 lt!171262) (_2!4896 lt!171262)))))

(declare-fun lt!171253 () BitStream!4106)

(assert (=> d!36054 (= lt!171262 (tuple2!9273 lt!171253 (_2!4894 lt!170582)))))

(declare-fun lt!171263 () Unit!6851)

(declare-fun lt!171264 () Unit!6851)

(assert (=> d!36054 (= lt!171263 lt!171264)))

(assert (=> d!36054 (isPrefixOf!0 lt!171253 (_2!4894 lt!170582))))

(assert (=> d!36054 (= lt!171264 (lemmaIsPrefixTransitive!0 lt!171253 (_2!4894 lt!170582) (_2!4894 lt!170582)))))

(declare-fun lt!171259 () Unit!6851)

(declare-fun lt!171251 () Unit!6851)

(assert (=> d!36054 (= lt!171259 lt!171251)))

(assert (=> d!36054 (isPrefixOf!0 lt!171253 (_2!4894 lt!170582))))

(assert (=> d!36054 (= lt!171251 (lemmaIsPrefixTransitive!0 lt!171253 (_2!4894 lt!169956) (_2!4894 lt!170582)))))

(declare-fun lt!171255 () Unit!6851)

(assert (=> d!36054 (= lt!171255 e!73784)))

(declare-fun c!6848 () Bool)

(assert (=> d!36054 (= c!6848 (not (= (size!2316 (buf!2719 (_2!4894 lt!169956))) #b00000000000000000000000000000000)))))

(declare-fun lt!171254 () Unit!6851)

(declare-fun lt!171250 () Unit!6851)

(assert (=> d!36054 (= lt!171254 lt!171250)))

(assert (=> d!36054 (isPrefixOf!0 (_2!4894 lt!170582) (_2!4894 lt!170582))))

(assert (=> d!36054 (= lt!171250 (lemmaIsPrefixRefl!0 (_2!4894 lt!170582)))))

(declare-fun lt!171252 () Unit!6851)

(declare-fun lt!171261 () Unit!6851)

(assert (=> d!36054 (= lt!171252 lt!171261)))

(assert (=> d!36054 (= lt!171261 (lemmaIsPrefixRefl!0 (_2!4894 lt!170582)))))

(declare-fun lt!171258 () Unit!6851)

(declare-fun lt!171257 () Unit!6851)

(assert (=> d!36054 (= lt!171258 lt!171257)))

(assert (=> d!36054 (isPrefixOf!0 lt!171253 lt!171253)))

(assert (=> d!36054 (= lt!171257 (lemmaIsPrefixRefl!0 lt!171253))))

(declare-fun lt!171246 () Unit!6851)

(declare-fun lt!171260 () Unit!6851)

(assert (=> d!36054 (= lt!171246 lt!171260)))

(assert (=> d!36054 (isPrefixOf!0 (_2!4894 lt!169956) (_2!4894 lt!169956))))

(assert (=> d!36054 (= lt!171260 (lemmaIsPrefixRefl!0 (_2!4894 lt!169956)))))

(assert (=> d!36054 (= lt!171253 (BitStream!4107 (buf!2719 (_2!4894 lt!170582)) (currentByte!5285 (_2!4894 lt!169956)) (currentBit!5280 (_2!4894 lt!169956))))))

(assert (=> d!36054 (isPrefixOf!0 (_2!4894 lt!169956) (_2!4894 lt!170582))))

(assert (=> d!36054 (= (reader!0 (_2!4894 lt!169956) (_2!4894 lt!170582)) lt!171262)))

(assert (= (and d!36054 c!6848) b!112469))

(assert (= (and d!36054 (not c!6848)) b!112467))

(assert (= (and d!36054 res!92869) b!112466))

(assert (= (and b!112466 res!92870) b!112465))

(assert (= (and b!112465 res!92871) b!112468))

(declare-fun m!168089 () Bool)

(assert (=> d!36054 m!168089))

(assert (=> d!36054 m!167429))

(declare-fun m!168091 () Bool)

(assert (=> d!36054 m!168091))

(assert (=> d!36054 m!167463))

(declare-fun m!168093 () Bool)

(assert (=> d!36054 m!168093))

(declare-fun m!168095 () Bool)

(assert (=> d!36054 m!168095))

(assert (=> d!36054 m!167467))

(declare-fun m!168097 () Bool)

(assert (=> d!36054 m!168097))

(declare-fun m!168099 () Bool)

(assert (=> d!36054 m!168099))

(declare-fun m!168101 () Bool)

(assert (=> d!36054 m!168101))

(declare-fun m!168103 () Bool)

(assert (=> d!36054 m!168103))

(assert (=> b!112469 m!166973))

(declare-fun m!168105 () Bool)

(assert (=> b!112469 m!168105))

(declare-fun m!168107 () Bool)

(assert (=> b!112469 m!168107))

(declare-fun m!168109 () Bool)

(assert (=> b!112468 m!168109))

(assert (=> b!112468 m!167417))

(assert (=> b!112468 m!166973))

(declare-fun m!168111 () Bool)

(assert (=> b!112466 m!168111))

(declare-fun m!168113 () Bool)

(assert (=> b!112465 m!168113))

(assert (=> b!112136 d!36054))

(declare-fun b!112470 () Bool)

(declare-fun e!73788 () Bool)

(declare-fun lt!171267 () tuple2!9270)

(declare-fun lt!171280 () tuple2!9270)

(assert (=> b!112470 (= e!73788 (= (_2!4895 lt!171267) (_2!4895 lt!171280)))))

(declare-fun b!112471 () Bool)

(declare-fun e!73786 () Bool)

(declare-fun lt!171269 () (_ BitVec 64))

(assert (=> b!112471 (= e!73786 (validate_offset_bits!1 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!170597)))) ((_ sign_extend 32) (currentByte!5285 (_2!4894 lt!170597))) ((_ sign_extend 32) (currentBit!5280 (_2!4894 lt!170597))) lt!171269))))

(declare-fun b!112472 () Bool)

(declare-fun res!92872 () Bool)

(declare-fun e!73785 () Bool)

(assert (=> b!112472 (=> (not res!92872) (not e!73785))))

(declare-fun lt!171292 () tuple2!9268)

(assert (=> b!112472 (= res!92872 (isPrefixOf!0 (_2!4894 lt!170597) (_2!4894 lt!171292)))))

(declare-fun b!112473 () Bool)

(declare-fun e!73787 () (_ BitVec 64))

(assert (=> b!112473 (= e!73787 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))))

(declare-fun b!112474 () Bool)

(declare-fun lt!171306 () tuple2!9270)

(declare-fun lt!171301 () tuple2!9268)

(assert (=> b!112474 (= lt!171306 (readBitPure!0 (readerFrom!0 (_2!4894 lt!171301) (currentBit!5280 (_2!4894 lt!170597)) (currentByte!5285 (_2!4894 lt!170597)))))))

(declare-fun res!92876 () Bool)

(declare-fun lt!171289 () Bool)

(assert (=> b!112474 (= res!92876 (and (= (_2!4895 lt!171306) lt!171289) (= (_1!4895 lt!171306) (_2!4894 lt!171301))))))

(declare-fun e!73791 () Bool)

(assert (=> b!112474 (=> (not res!92876) (not e!73791))))

(declare-fun e!73790 () Bool)

(assert (=> b!112474 (= e!73790 e!73791)))

(declare-fun d!36056 () Bool)

(assert (=> d!36056 e!73785))

(declare-fun res!92878 () Bool)

(assert (=> d!36056 (=> (not res!92878) (not e!73785))))

(assert (=> d!36056 (= res!92878 (= (size!2316 (buf!2719 (_2!4894 lt!170597))) (size!2316 (buf!2719 (_2!4894 lt!171292)))))))

(declare-fun e!73789 () tuple2!9268)

(assert (=> d!36056 (= lt!171292 e!73789)))

(declare-fun c!6850 () Bool)

(assert (=> d!36056 (= c!6850 (bvslt (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) nBits!396))))

(assert (=> d!36056 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!36056 (= (appendNLeastSignificantBitsLoop!0 (_2!4894 lt!170597) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) lt!171292)))

(declare-fun b!112475 () Bool)

(declare-fun res!92875 () Bool)

(assert (=> b!112475 (= res!92875 (= (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!171301))) (currentByte!5285 (_2!4894 lt!171301)) (currentBit!5280 (_2!4894 lt!171301))) (bvadd (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!170597))) (currentByte!5285 (_2!4894 lt!170597)) (currentBit!5280 (_2!4894 lt!170597))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!112475 (=> (not res!92875) (not e!73790))))

(declare-fun b!112476 () Bool)

(assert (=> b!112476 (= e!73791 (= (bitIndex!0 (size!2316 (buf!2719 (_1!4895 lt!171306))) (currentByte!5285 (_1!4895 lt!171306)) (currentBit!5280 (_1!4895 lt!171306))) (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!171301))) (currentByte!5285 (_2!4894 lt!171301)) (currentBit!5280 (_2!4894 lt!171301)))))))

(declare-fun b!112477 () Bool)

(declare-fun lt!171304 () Unit!6851)

(assert (=> b!112477 (= e!73789 (tuple2!9269 lt!171304 (_2!4894 lt!170597)))))

(declare-fun lt!171286 () BitStream!4106)

(assert (=> b!112477 (= lt!171286 (_2!4894 lt!170597))))

(assert (=> b!112477 (= lt!171304 (lemmaIsPrefixRefl!0 lt!171286))))

(declare-fun call!1432 () Bool)

(assert (=> b!112477 call!1432))

(declare-fun b!112478 () Bool)

(declare-fun lt!171271 () tuple2!9274)

(declare-fun lt!171300 () tuple2!9272)

(assert (=> b!112478 (= e!73785 (and (= (_2!4897 lt!171271) v!199) (= (_1!4897 lt!171271) (_2!4896 lt!171300))))))

(declare-fun lt!171283 () (_ BitVec 64))

(assert (=> b!112478 (= lt!171271 (readNLeastSignificantBitsLoopPure!0 (_1!4896 lt!171300) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!171283))))

(declare-fun lt!171276 () Unit!6851)

(declare-fun lt!171273 () Unit!6851)

(assert (=> b!112478 (= lt!171276 lt!171273)))

(assert (=> b!112478 (validate_offset_bits!1 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!171292)))) ((_ sign_extend 32) (currentByte!5285 (_2!4894 lt!170597))) ((_ sign_extend 32) (currentBit!5280 (_2!4894 lt!170597))) lt!171269)))

(assert (=> b!112478 (= lt!171273 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4894 lt!170597) (buf!2719 (_2!4894 lt!171292)) lt!171269))))

(assert (=> b!112478 e!73786))

(declare-fun res!92880 () Bool)

(assert (=> b!112478 (=> (not res!92880) (not e!73786))))

(assert (=> b!112478 (= res!92880 (and (= (size!2316 (buf!2719 (_2!4894 lt!170597))) (size!2316 (buf!2719 (_2!4894 lt!171292)))) (bvsge lt!171269 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112478 (= lt!171269 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))

(assert (=> b!112478 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!112478 (= lt!171283 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))))

(assert (=> b!112478 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!112478 (= lt!171300 (reader!0 (_2!4894 lt!170597) (_2!4894 lt!171292)))))

(declare-fun b!112479 () Bool)

(declare-fun res!92879 () Bool)

(assert (=> b!112479 (= res!92879 call!1432)))

(assert (=> b!112479 (=> (not res!92879) (not e!73790))))

(declare-fun b!112480 () Bool)

(assert (=> b!112480 (= e!73787 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun bm!1429 () Bool)

(assert (=> bm!1429 (= call!1432 (isPrefixOf!0 (ite c!6850 (_2!4894 lt!170597) lt!171286) (ite c!6850 (_2!4894 lt!171301) lt!171286)))))

(declare-fun b!112481 () Bool)

(declare-fun lt!171270 () tuple2!9268)

(declare-fun Unit!6890 () Unit!6851)

(assert (=> b!112481 (= e!73789 (tuple2!9269 Unit!6890 (_2!4894 lt!171270)))))

(assert (=> b!112481 (= lt!171289 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112481 (= lt!171301 (appendBit!0 (_2!4894 lt!170597) lt!171289))))

(declare-fun res!92874 () Bool)

(assert (=> b!112481 (= res!92874 (= (size!2316 (buf!2719 (_2!4894 lt!170597))) (size!2316 (buf!2719 (_2!4894 lt!171301)))))))

(assert (=> b!112481 (=> (not res!92874) (not e!73790))))

(assert (=> b!112481 e!73790))

(declare-fun lt!171285 () tuple2!9268)

(assert (=> b!112481 (= lt!171285 lt!171301)))

(assert (=> b!112481 (= lt!171270 (appendNLeastSignificantBitsLoop!0 (_2!4894 lt!171285) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!171279 () Unit!6851)

(assert (=> b!112481 (= lt!171279 (lemmaIsPrefixTransitive!0 (_2!4894 lt!170597) (_2!4894 lt!171285) (_2!4894 lt!171270)))))

(assert (=> b!112481 (isPrefixOf!0 (_2!4894 lt!170597) (_2!4894 lt!171270))))

(declare-fun lt!171274 () Unit!6851)

(assert (=> b!112481 (= lt!171274 lt!171279)))

(assert (=> b!112481 (invariant!0 (currentBit!5280 (_2!4894 lt!170597)) (currentByte!5285 (_2!4894 lt!170597)) (size!2316 (buf!2719 (_2!4894 lt!171285))))))

(declare-fun lt!171303 () BitStream!4106)

(assert (=> b!112481 (= lt!171303 (BitStream!4107 (buf!2719 (_2!4894 lt!171285)) (currentByte!5285 (_2!4894 lt!170597)) (currentBit!5280 (_2!4894 lt!170597))))))

(assert (=> b!112481 (invariant!0 (currentBit!5280 lt!171303) (currentByte!5285 lt!171303) (size!2316 (buf!2719 (_2!4894 lt!171270))))))

(declare-fun lt!171288 () BitStream!4106)

(assert (=> b!112481 (= lt!171288 (BitStream!4107 (buf!2719 (_2!4894 lt!171270)) (currentByte!5285 lt!171303) (currentBit!5280 lt!171303)))))

(assert (=> b!112481 (= lt!171267 (readBitPure!0 lt!171303))))

(assert (=> b!112481 (= lt!171280 (readBitPure!0 lt!171288))))

(declare-fun lt!171287 () Unit!6851)

(assert (=> b!112481 (= lt!171287 (readBitPrefixLemma!0 lt!171303 (_2!4894 lt!171270)))))

(declare-fun res!92877 () Bool)

(assert (=> b!112481 (= res!92877 (= (bitIndex!0 (size!2316 (buf!2719 (_1!4895 lt!171267))) (currentByte!5285 (_1!4895 lt!171267)) (currentBit!5280 (_1!4895 lt!171267))) (bitIndex!0 (size!2316 (buf!2719 (_1!4895 lt!171280))) (currentByte!5285 (_1!4895 lt!171280)) (currentBit!5280 (_1!4895 lt!171280)))))))

(assert (=> b!112481 (=> (not res!92877) (not e!73788))))

(assert (=> b!112481 e!73788))

(declare-fun lt!171265 () Unit!6851)

(assert (=> b!112481 (= lt!171265 lt!171287)))

(declare-fun lt!171277 () tuple2!9272)

(assert (=> b!112481 (= lt!171277 (reader!0 (_2!4894 lt!170597) (_2!4894 lt!171270)))))

(declare-fun lt!171284 () tuple2!9272)

(assert (=> b!112481 (= lt!171284 (reader!0 (_2!4894 lt!171285) (_2!4894 lt!171270)))))

(declare-fun lt!171290 () tuple2!9270)

(assert (=> b!112481 (= lt!171290 (readBitPure!0 (_1!4896 lt!171277)))))

(assert (=> b!112481 (= (_2!4895 lt!171290) lt!171289)))

(declare-fun lt!171293 () Unit!6851)

(declare-fun Unit!6891 () Unit!6851)

(assert (=> b!112481 (= lt!171293 Unit!6891)))

(declare-fun lt!171305 () (_ BitVec 64))

(assert (=> b!112481 (= lt!171305 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))))

(declare-fun lt!171298 () (_ BitVec 64))

(assert (=> b!112481 (= lt!171298 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))

(declare-fun lt!171282 () Unit!6851)

(assert (=> b!112481 (= lt!171282 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4894 lt!170597) (buf!2719 (_2!4894 lt!171270)) lt!171298))))

(assert (=> b!112481 (validate_offset_bits!1 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!171270)))) ((_ sign_extend 32) (currentByte!5285 (_2!4894 lt!170597))) ((_ sign_extend 32) (currentBit!5280 (_2!4894 lt!170597))) lt!171298)))

(declare-fun lt!171275 () Unit!6851)

(assert (=> b!112481 (= lt!171275 lt!171282)))

(declare-fun lt!171299 () tuple2!9274)

(assert (=> b!112481 (= lt!171299 (readNLeastSignificantBitsLoopPure!0 (_1!4896 lt!171277) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!171305))))

(declare-fun lt!171268 () (_ BitVec 64))

(assert (=> b!112481 (= lt!171268 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))))

(declare-fun lt!171309 () Unit!6851)

(assert (=> b!112481 (= lt!171309 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4894 lt!171285) (buf!2719 (_2!4894 lt!171270)) lt!171268))))

(assert (=> b!112481 (validate_offset_bits!1 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!171270)))) ((_ sign_extend 32) (currentByte!5285 (_2!4894 lt!171285))) ((_ sign_extend 32) (currentBit!5280 (_2!4894 lt!171285))) lt!171268)))

(declare-fun lt!171272 () Unit!6851)

(assert (=> b!112481 (= lt!171272 lt!171309)))

(declare-fun lt!171294 () tuple2!9274)

(assert (=> b!112481 (= lt!171294 (readNLeastSignificantBitsLoopPure!0 (_1!4896 lt!171284) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!171305 (ite (_2!4895 lt!171290) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!171308 () tuple2!9274)

(assert (=> b!112481 (= lt!171308 (readNLeastSignificantBitsLoopPure!0 (_1!4896 lt!171277) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!171305))))

(declare-fun c!6849 () Bool)

(assert (=> b!112481 (= c!6849 (_2!4895 (readBitPure!0 (_1!4896 lt!171277))))))

(declare-fun lt!171296 () tuple2!9274)

(assert (=> b!112481 (= lt!171296 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4896 lt!171277) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!171305 e!73787)))))

(declare-fun lt!171295 () Unit!6851)

(assert (=> b!112481 (= lt!171295 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4896 lt!171277) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!171305))))

(assert (=> b!112481 (and (= (_2!4897 lt!171308) (_2!4897 lt!171296)) (= (_1!4897 lt!171308) (_1!4897 lt!171296)))))

(declare-fun lt!171266 () Unit!6851)

(assert (=> b!112481 (= lt!171266 lt!171295)))

(assert (=> b!112481 (= (_1!4896 lt!171277) (withMovedBitIndex!0 (_2!4896 lt!171277) (bvsub (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!170597))) (currentByte!5285 (_2!4894 lt!170597)) (currentBit!5280 (_2!4894 lt!170597))) (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!171270))) (currentByte!5285 (_2!4894 lt!171270)) (currentBit!5280 (_2!4894 lt!171270))))))))

(declare-fun lt!171281 () Unit!6851)

(declare-fun Unit!6892 () Unit!6851)

(assert (=> b!112481 (= lt!171281 Unit!6892)))

(assert (=> b!112481 (= (_1!4896 lt!171284) (withMovedBitIndex!0 (_2!4896 lt!171284) (bvsub (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!171285))) (currentByte!5285 (_2!4894 lt!171285)) (currentBit!5280 (_2!4894 lt!171285))) (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!171270))) (currentByte!5285 (_2!4894 lt!171270)) (currentBit!5280 (_2!4894 lt!171270))))))))

(declare-fun lt!171278 () Unit!6851)

(declare-fun Unit!6893 () Unit!6851)

(assert (=> b!112481 (= lt!171278 Unit!6893)))

(assert (=> b!112481 (= (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!170597))) (currentByte!5285 (_2!4894 lt!170597)) (currentBit!5280 (_2!4894 lt!170597))) (bvsub (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!171285))) (currentByte!5285 (_2!4894 lt!171285)) (currentBit!5280 (_2!4894 lt!171285))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!171291 () Unit!6851)

(declare-fun Unit!6894 () Unit!6851)

(assert (=> b!112481 (= lt!171291 Unit!6894)))

(assert (=> b!112481 (= (_2!4897 lt!171299) (_2!4897 lt!171294))))

(declare-fun lt!171307 () Unit!6851)

(declare-fun Unit!6895 () Unit!6851)

(assert (=> b!112481 (= lt!171307 Unit!6895)))

(assert (=> b!112481 (= (_1!4897 lt!171299) (_2!4896 lt!171277))))

(declare-fun b!112482 () Bool)

(declare-fun res!92873 () Bool)

(assert (=> b!112482 (=> (not res!92873) (not e!73785))))

(declare-fun lt!171297 () (_ BitVec 64))

(declare-fun lt!171302 () (_ BitVec 64))

(assert (=> b!112482 (= res!92873 (= (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!171292))) (currentByte!5285 (_2!4894 lt!171292)) (currentBit!5280 (_2!4894 lt!171292))) (bvadd lt!171302 lt!171297)))))

(assert (=> b!112482 (or (not (= (bvand lt!171302 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!171302 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!171302 lt!171297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112482 (= lt!171297 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))

(assert (=> b!112482 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!112482 (= lt!171302 (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!170597))) (currentByte!5285 (_2!4894 lt!170597)) (currentBit!5280 (_2!4894 lt!170597))))))

(assert (= (and d!36056 c!6850) b!112481))

(assert (= (and d!36056 (not c!6850)) b!112477))

(assert (= (and b!112481 res!92874) b!112475))

(assert (= (and b!112475 res!92875) b!112479))

(assert (= (and b!112479 res!92879) b!112474))

(assert (= (and b!112474 res!92876) b!112476))

(assert (= (and b!112481 res!92877) b!112470))

(assert (= (and b!112481 c!6849) b!112473))

(assert (= (and b!112481 (not c!6849)) b!112480))

(assert (= (or b!112479 b!112477) bm!1429))

(assert (= (and d!36056 res!92878) b!112482))

(assert (= (and b!112482 res!92873) b!112472))

(assert (= (and b!112472 res!92872) b!112478))

(assert (= (and b!112478 res!92880) b!112471))

(declare-fun m!168115 () Bool)

(assert (=> b!112478 m!168115))

(declare-fun m!168117 () Bool)

(assert (=> b!112478 m!168117))

(declare-fun m!168119 () Bool)

(assert (=> b!112478 m!168119))

(declare-fun m!168121 () Bool)

(assert (=> b!112478 m!168121))

(declare-fun m!168123 () Bool)

(assert (=> b!112478 m!168123))

(declare-fun m!168125 () Bool)

(assert (=> b!112477 m!168125))

(declare-fun m!168127 () Bool)

(assert (=> b!112476 m!168127))

(declare-fun m!168129 () Bool)

(assert (=> b!112476 m!168129))

(declare-fun m!168131 () Bool)

(assert (=> bm!1429 m!168131))

(declare-fun m!168133 () Bool)

(assert (=> b!112482 m!168133))

(assert (=> b!112482 m!167445))

(declare-fun m!168135 () Bool)

(assert (=> b!112474 m!168135))

(assert (=> b!112474 m!168135))

(declare-fun m!168137 () Bool)

(assert (=> b!112474 m!168137))

(declare-fun m!168139 () Bool)

(assert (=> b!112481 m!168139))

(declare-fun m!168141 () Bool)

(assert (=> b!112481 m!168141))

(declare-fun m!168143 () Bool)

(assert (=> b!112481 m!168143))

(declare-fun m!168145 () Bool)

(assert (=> b!112481 m!168145))

(declare-fun m!168147 () Bool)

(assert (=> b!112481 m!168147))

(declare-fun m!168149 () Bool)

(assert (=> b!112481 m!168149))

(declare-fun m!168151 () Bool)

(assert (=> b!112481 m!168151))

(declare-fun m!168153 () Bool)

(assert (=> b!112481 m!168153))

(declare-fun m!168155 () Bool)

(assert (=> b!112481 m!168155))

(declare-fun m!168157 () Bool)

(assert (=> b!112481 m!168157))

(declare-fun m!168159 () Bool)

(assert (=> b!112481 m!168159))

(declare-fun m!168161 () Bool)

(assert (=> b!112481 m!168161))

(declare-fun m!168163 () Bool)

(assert (=> b!112481 m!168163))

(declare-fun m!168165 () Bool)

(assert (=> b!112481 m!168165))

(assert (=> b!112481 m!167445))

(declare-fun m!168167 () Bool)

(assert (=> b!112481 m!168167))

(declare-fun m!168169 () Bool)

(assert (=> b!112481 m!168169))

(declare-fun m!168171 () Bool)

(assert (=> b!112481 m!168171))

(declare-fun m!168173 () Bool)

(assert (=> b!112481 m!168173))

(declare-fun m!168175 () Bool)

(assert (=> b!112481 m!168175))

(declare-fun m!168177 () Bool)

(assert (=> b!112481 m!168177))

(declare-fun m!168179 () Bool)

(assert (=> b!112481 m!168179))

(assert (=> b!112481 m!168117))

(declare-fun m!168181 () Bool)

(assert (=> b!112481 m!168181))

(assert (=> b!112481 m!168145))

(declare-fun m!168183 () Bool)

(assert (=> b!112481 m!168183))

(declare-fun m!168185 () Bool)

(assert (=> b!112481 m!168185))

(declare-fun m!168187 () Bool)

(assert (=> b!112481 m!168187))

(declare-fun m!168189 () Bool)

(assert (=> b!112481 m!168189))

(declare-fun m!168191 () Bool)

(assert (=> b!112481 m!168191))

(declare-fun m!168193 () Bool)

(assert (=> b!112472 m!168193))

(declare-fun m!168195 () Bool)

(assert (=> b!112471 m!168195))

(assert (=> b!112475 m!168129))

(assert (=> b!112475 m!167445))

(assert (=> b!112136 d!36056))

(declare-fun d!36058 () Bool)

(declare-fun res!92881 () Bool)

(declare-fun e!73792 () Bool)

(assert (=> d!36058 (=> (not res!92881) (not e!73792))))

(assert (=> d!36058 (= res!92881 (= (size!2316 (buf!2719 (_2!4894 lt!169956))) (size!2316 (buf!2719 (_2!4894 lt!170582)))))))

(assert (=> d!36058 (= (isPrefixOf!0 (_2!4894 lt!169956) (_2!4894 lt!170582)) e!73792)))

(declare-fun b!112483 () Bool)

(declare-fun res!92883 () Bool)

(assert (=> b!112483 (=> (not res!92883) (not e!73792))))

(assert (=> b!112483 (= res!92883 (bvsle (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!169956))) (currentByte!5285 (_2!4894 lt!169956)) (currentBit!5280 (_2!4894 lt!169956))) (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!170582))) (currentByte!5285 (_2!4894 lt!170582)) (currentBit!5280 (_2!4894 lt!170582)))))))

(declare-fun b!112484 () Bool)

(declare-fun e!73793 () Bool)

(assert (=> b!112484 (= e!73792 e!73793)))

(declare-fun res!92882 () Bool)

(assert (=> b!112484 (=> res!92882 e!73793)))

(assert (=> b!112484 (= res!92882 (= (size!2316 (buf!2719 (_2!4894 lt!169956))) #b00000000000000000000000000000000))))

(declare-fun b!112485 () Bool)

(assert (=> b!112485 (= e!73793 (arrayBitRangesEq!0 (buf!2719 (_2!4894 lt!169956)) (buf!2719 (_2!4894 lt!170582)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!169956))) (currentByte!5285 (_2!4894 lt!169956)) (currentBit!5280 (_2!4894 lt!169956)))))))

(assert (= (and d!36058 res!92881) b!112483))

(assert (= (and b!112483 res!92883) b!112484))

(assert (= (and b!112484 (not res!92882)) b!112485))

(assert (=> b!112483 m!166973))

(assert (=> b!112483 m!167417))

(assert (=> b!112485 m!166973))

(assert (=> b!112485 m!166973))

(declare-fun m!168197 () Bool)

(assert (=> b!112485 m!168197))

(assert (=> b!112136 d!36058))

(declare-fun d!36060 () Bool)

(declare-fun e!73794 () Bool)

(assert (=> d!36060 e!73794))

(declare-fun res!92884 () Bool)

(assert (=> d!36060 (=> (not res!92884) (not e!73794))))

(declare-fun lt!171314 () (_ BitVec 64))

(declare-fun lt!171315 () (_ BitVec 64))

(declare-fun lt!171310 () (_ BitVec 64))

(assert (=> d!36060 (= res!92884 (= lt!171310 (bvsub lt!171314 lt!171315)))))

(assert (=> d!36060 (or (= (bvand lt!171314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171315 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!171314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!171314 lt!171315) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36060 (= lt!171315 (remainingBits!0 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!170597)))) ((_ sign_extend 32) (currentByte!5285 (_2!4894 lt!170597))) ((_ sign_extend 32) (currentBit!5280 (_2!4894 lt!170597)))))))

(declare-fun lt!171313 () (_ BitVec 64))

(declare-fun lt!171312 () (_ BitVec 64))

(assert (=> d!36060 (= lt!171314 (bvmul lt!171313 lt!171312))))

(assert (=> d!36060 (or (= lt!171313 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!171312 (bvsdiv (bvmul lt!171313 lt!171312) lt!171313)))))

(assert (=> d!36060 (= lt!171312 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36060 (= lt!171313 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!170597)))))))

(assert (=> d!36060 (= lt!171310 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5285 (_2!4894 lt!170597))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5280 (_2!4894 lt!170597)))))))

(assert (=> d!36060 (invariant!0 (currentBit!5280 (_2!4894 lt!170597)) (currentByte!5285 (_2!4894 lt!170597)) (size!2316 (buf!2719 (_2!4894 lt!170597))))))

(assert (=> d!36060 (= (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!170597))) (currentByte!5285 (_2!4894 lt!170597)) (currentBit!5280 (_2!4894 lt!170597))) lt!171310)))

(declare-fun b!112486 () Bool)

(declare-fun res!92885 () Bool)

(assert (=> b!112486 (=> (not res!92885) (not e!73794))))

(assert (=> b!112486 (= res!92885 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!171310))))

(declare-fun b!112487 () Bool)

(declare-fun lt!171311 () (_ BitVec 64))

(assert (=> b!112487 (= e!73794 (bvsle lt!171310 (bvmul lt!171311 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112487 (or (= lt!171311 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!171311 #b0000000000000000000000000000000000000000000000000000000000001000) lt!171311)))))

(assert (=> b!112487 (= lt!171311 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!170597)))))))

(assert (= (and d!36060 res!92884) b!112486))

(assert (= (and b!112486 res!92885) b!112487))

(declare-fun m!168199 () Bool)

(assert (=> d!36060 m!168199))

(declare-fun m!168201 () Bool)

(assert (=> d!36060 m!168201))

(assert (=> b!112136 d!36060))

(declare-fun d!36062 () Bool)

(declare-fun e!73795 () Bool)

(assert (=> d!36062 e!73795))

(declare-fun res!92886 () Bool)

(assert (=> d!36062 (=> (not res!92886) (not e!73795))))

(declare-fun lt!171316 () BitStream!4106)

(declare-fun lt!171317 () (_ BitVec 64))

(assert (=> d!36062 (= res!92886 (= (bvadd lt!171317 (bvsub (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!169956))) (currentByte!5285 (_2!4894 lt!169956)) (currentBit!5280 (_2!4894 lt!169956))) (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!170582))) (currentByte!5285 (_2!4894 lt!170582)) (currentBit!5280 (_2!4894 lt!170582))))) (bitIndex!0 (size!2316 (buf!2719 lt!171316)) (currentByte!5285 lt!171316) (currentBit!5280 lt!171316))))))

(assert (=> d!36062 (or (not (= (bvand lt!171317 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!169956))) (currentByte!5285 (_2!4894 lt!169956)) (currentBit!5280 (_2!4894 lt!169956))) (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!170582))) (currentByte!5285 (_2!4894 lt!170582)) (currentBit!5280 (_2!4894 lt!170582)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!171317 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!171317 (bvsub (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!169956))) (currentByte!5285 (_2!4894 lt!169956)) (currentBit!5280 (_2!4894 lt!169956))) (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!170582))) (currentByte!5285 (_2!4894 lt!170582)) (currentBit!5280 (_2!4894 lt!170582))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36062 (= lt!171317 (bitIndex!0 (size!2316 (buf!2719 (_2!4896 lt!170589))) (currentByte!5285 (_2!4896 lt!170589)) (currentBit!5280 (_2!4896 lt!170589))))))

(assert (=> d!36062 (= lt!171316 (_2!4894 (moveBitIndex!0 (_2!4896 lt!170589) (bvsub (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!169956))) (currentByte!5285 (_2!4894 lt!169956)) (currentBit!5280 (_2!4894 lt!169956))) (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!170582))) (currentByte!5285 (_2!4894 lt!170582)) (currentBit!5280 (_2!4894 lt!170582)))))))))

(assert (=> d!36062 (moveBitIndexPrecond!0 (_2!4896 lt!170589) (bvsub (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!169956))) (currentByte!5285 (_2!4894 lt!169956)) (currentBit!5280 (_2!4894 lt!169956))) (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!170582))) (currentByte!5285 (_2!4894 lt!170582)) (currentBit!5280 (_2!4894 lt!170582)))))))

(assert (=> d!36062 (= (withMovedBitIndex!0 (_2!4896 lt!170589) (bvsub (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!169956))) (currentByte!5285 (_2!4894 lt!169956)) (currentBit!5280 (_2!4894 lt!169956))) (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!170582))) (currentByte!5285 (_2!4894 lt!170582)) (currentBit!5280 (_2!4894 lt!170582))))) lt!171316)))

(declare-fun b!112488 () Bool)

(assert (=> b!112488 (= e!73795 (= (size!2316 (buf!2719 (_2!4896 lt!170589))) (size!2316 (buf!2719 lt!171316))))))

(assert (= (and d!36062 res!92886) b!112488))

(declare-fun m!168203 () Bool)

(assert (=> d!36062 m!168203))

(declare-fun m!168205 () Bool)

(assert (=> d!36062 m!168205))

(declare-fun m!168207 () Bool)

(assert (=> d!36062 m!168207))

(declare-fun m!168209 () Bool)

(assert (=> d!36062 m!168209))

(assert (=> b!112136 d!36062))

(declare-fun b!112490 () Bool)

(declare-fun res!92888 () Bool)

(declare-fun e!73796 () Bool)

(assert (=> b!112490 (=> (not res!92888) (not e!73796))))

(declare-fun lt!171335 () tuple2!9272)

(assert (=> b!112490 (= res!92888 (isPrefixOf!0 (_1!4896 lt!171335) (_2!4894 lt!170597)))))

(declare-fun b!112491 () Bool)

(declare-fun e!73797 () Unit!6851)

(declare-fun Unit!6896 () Unit!6851)

(assert (=> b!112491 (= e!73797 Unit!6896)))

(declare-fun lt!171321 () (_ BitVec 64))

(declare-fun b!112492 () Bool)

(declare-fun lt!171318 () (_ BitVec 64))

(assert (=> b!112492 (= e!73796 (= (_1!4896 lt!171335) (withMovedBitIndex!0 (_2!4896 lt!171335) (bvsub lt!171318 lt!171321))))))

(assert (=> b!112492 (or (= (bvand lt!171318 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171321 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!171318 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!171318 lt!171321) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112492 (= lt!171321 (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!170582))) (currentByte!5285 (_2!4894 lt!170582)) (currentBit!5280 (_2!4894 lt!170582))))))

(assert (=> b!112492 (= lt!171318 (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!170597))) (currentByte!5285 (_2!4894 lt!170597)) (currentBit!5280 (_2!4894 lt!170597))))))

(declare-fun b!112493 () Bool)

(declare-fun lt!171320 () Unit!6851)

(assert (=> b!112493 (= e!73797 lt!171320)))

(declare-fun lt!171329 () (_ BitVec 64))

(assert (=> b!112493 (= lt!171329 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!171322 () (_ BitVec 64))

(assert (=> b!112493 (= lt!171322 (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!170597))) (currentByte!5285 (_2!4894 lt!170597)) (currentBit!5280 (_2!4894 lt!170597))))))

(assert (=> b!112493 (= lt!171320 (arrayBitRangesEqSymmetric!0 (buf!2719 (_2!4894 lt!170597)) (buf!2719 (_2!4894 lt!170582)) lt!171329 lt!171322))))

(assert (=> b!112493 (arrayBitRangesEq!0 (buf!2719 (_2!4894 lt!170582)) (buf!2719 (_2!4894 lt!170597)) lt!171329 lt!171322)))

(declare-fun b!112489 () Bool)

(declare-fun res!92889 () Bool)

(assert (=> b!112489 (=> (not res!92889) (not e!73796))))

(assert (=> b!112489 (= res!92889 (isPrefixOf!0 (_2!4896 lt!171335) (_2!4894 lt!170582)))))

(declare-fun d!36064 () Bool)

(assert (=> d!36064 e!73796))

(declare-fun res!92887 () Bool)

(assert (=> d!36064 (=> (not res!92887) (not e!73796))))

(assert (=> d!36064 (= res!92887 (isPrefixOf!0 (_1!4896 lt!171335) (_2!4896 lt!171335)))))

(declare-fun lt!171326 () BitStream!4106)

(assert (=> d!36064 (= lt!171335 (tuple2!9273 lt!171326 (_2!4894 lt!170582)))))

(declare-fun lt!171336 () Unit!6851)

(declare-fun lt!171337 () Unit!6851)

(assert (=> d!36064 (= lt!171336 lt!171337)))

(assert (=> d!36064 (isPrefixOf!0 lt!171326 (_2!4894 lt!170582))))

(assert (=> d!36064 (= lt!171337 (lemmaIsPrefixTransitive!0 lt!171326 (_2!4894 lt!170582) (_2!4894 lt!170582)))))

(declare-fun lt!171332 () Unit!6851)

(declare-fun lt!171324 () Unit!6851)

(assert (=> d!36064 (= lt!171332 lt!171324)))

(assert (=> d!36064 (isPrefixOf!0 lt!171326 (_2!4894 lt!170582))))

(assert (=> d!36064 (= lt!171324 (lemmaIsPrefixTransitive!0 lt!171326 (_2!4894 lt!170597) (_2!4894 lt!170582)))))

(declare-fun lt!171328 () Unit!6851)

(assert (=> d!36064 (= lt!171328 e!73797)))

(declare-fun c!6851 () Bool)

(assert (=> d!36064 (= c!6851 (not (= (size!2316 (buf!2719 (_2!4894 lt!170597))) #b00000000000000000000000000000000)))))

(declare-fun lt!171327 () Unit!6851)

(declare-fun lt!171323 () Unit!6851)

(assert (=> d!36064 (= lt!171327 lt!171323)))

(assert (=> d!36064 (isPrefixOf!0 (_2!4894 lt!170582) (_2!4894 lt!170582))))

(assert (=> d!36064 (= lt!171323 (lemmaIsPrefixRefl!0 (_2!4894 lt!170582)))))

(declare-fun lt!171325 () Unit!6851)

(declare-fun lt!171334 () Unit!6851)

(assert (=> d!36064 (= lt!171325 lt!171334)))

(assert (=> d!36064 (= lt!171334 (lemmaIsPrefixRefl!0 (_2!4894 lt!170582)))))

(declare-fun lt!171331 () Unit!6851)

(declare-fun lt!171330 () Unit!6851)

(assert (=> d!36064 (= lt!171331 lt!171330)))

(assert (=> d!36064 (isPrefixOf!0 lt!171326 lt!171326)))

(assert (=> d!36064 (= lt!171330 (lemmaIsPrefixRefl!0 lt!171326))))

(declare-fun lt!171319 () Unit!6851)

(declare-fun lt!171333 () Unit!6851)

(assert (=> d!36064 (= lt!171319 lt!171333)))

(assert (=> d!36064 (isPrefixOf!0 (_2!4894 lt!170597) (_2!4894 lt!170597))))

(assert (=> d!36064 (= lt!171333 (lemmaIsPrefixRefl!0 (_2!4894 lt!170597)))))

(assert (=> d!36064 (= lt!171326 (BitStream!4107 (buf!2719 (_2!4894 lt!170582)) (currentByte!5285 (_2!4894 lt!170597)) (currentBit!5280 (_2!4894 lt!170597))))))

(assert (=> d!36064 (isPrefixOf!0 (_2!4894 lt!170597) (_2!4894 lt!170582))))

(assert (=> d!36064 (= (reader!0 (_2!4894 lt!170597) (_2!4894 lt!170582)) lt!171335)))

(assert (= (and d!36064 c!6851) b!112493))

(assert (= (and d!36064 (not c!6851)) b!112491))

(assert (= (and d!36064 res!92887) b!112490))

(assert (= (and b!112490 res!92888) b!112489))

(assert (= (and b!112489 res!92889) b!112492))

(declare-fun m!168211 () Bool)

(assert (=> d!36064 m!168211))

(declare-fun m!168213 () Bool)

(assert (=> d!36064 m!168213))

(declare-fun m!168215 () Bool)

(assert (=> d!36064 m!168215))

(declare-fun m!168217 () Bool)

(assert (=> d!36064 m!168217))

(assert (=> d!36064 m!168093))

(declare-fun m!168219 () Bool)

(assert (=> d!36064 m!168219))

(declare-fun m!168221 () Bool)

(assert (=> d!36064 m!168221))

(assert (=> d!36064 m!168097))

(declare-fun m!168223 () Bool)

(assert (=> d!36064 m!168223))

(declare-fun m!168225 () Bool)

(assert (=> d!36064 m!168225))

(declare-fun m!168227 () Bool)

(assert (=> d!36064 m!168227))

(assert (=> b!112493 m!167445))

(declare-fun m!168229 () Bool)

(assert (=> b!112493 m!168229))

(declare-fun m!168231 () Bool)

(assert (=> b!112493 m!168231))

(declare-fun m!168233 () Bool)

(assert (=> b!112492 m!168233))

(assert (=> b!112492 m!167417))

(assert (=> b!112492 m!167445))

(declare-fun m!168235 () Bool)

(assert (=> b!112490 m!168235))

(declare-fun m!168237 () Bool)

(assert (=> b!112489 m!168237))

(assert (=> b!112136 d!36064))

(declare-fun d!36066 () Bool)

(declare-fun lt!171338 () tuple2!9280)

(assert (=> d!36066 (= lt!171338 (readNLeastSignificantBitsLoop!0 (_1!4896 lt!170596) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!170617 (ite (_2!4895 lt!170602) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!36066 (= (readNLeastSignificantBitsLoopPure!0 (_1!4896 lt!170596) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!170617 (ite (_2!4895 lt!170602) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!9275 (_2!4900 lt!171338) (_1!4900 lt!171338)))))

(declare-fun bs!8770 () Bool)

(assert (= bs!8770 d!36066))

(declare-fun m!168239 () Bool)

(assert (=> bs!8770 m!168239))

(assert (=> b!112136 d!36066))

(declare-fun d!36068 () Bool)

(declare-fun e!73798 () Bool)

(assert (=> d!36068 e!73798))

(declare-fun res!92890 () Bool)

(assert (=> d!36068 (=> (not res!92890) (not e!73798))))

(declare-fun lt!171343 () (_ BitVec 64))

(declare-fun lt!171344 () (_ BitVec 64))

(declare-fun lt!171339 () (_ BitVec 64))

(assert (=> d!36068 (= res!92890 (= lt!171339 (bvsub lt!171343 lt!171344)))))

(assert (=> d!36068 (or (= (bvand lt!171343 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171344 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!171343 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!171343 lt!171344) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36068 (= lt!171344 (remainingBits!0 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!170582)))) ((_ sign_extend 32) (currentByte!5285 (_2!4894 lt!170582))) ((_ sign_extend 32) (currentBit!5280 (_2!4894 lt!170582)))))))

(declare-fun lt!171342 () (_ BitVec 64))

(declare-fun lt!171341 () (_ BitVec 64))

(assert (=> d!36068 (= lt!171343 (bvmul lt!171342 lt!171341))))

(assert (=> d!36068 (or (= lt!171342 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!171341 (bvsdiv (bvmul lt!171342 lt!171341) lt!171342)))))

(assert (=> d!36068 (= lt!171341 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36068 (= lt!171342 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!170582)))))))

(assert (=> d!36068 (= lt!171339 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5285 (_2!4894 lt!170582))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5280 (_2!4894 lt!170582)))))))

(assert (=> d!36068 (invariant!0 (currentBit!5280 (_2!4894 lt!170582)) (currentByte!5285 (_2!4894 lt!170582)) (size!2316 (buf!2719 (_2!4894 lt!170582))))))

(assert (=> d!36068 (= (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!170582))) (currentByte!5285 (_2!4894 lt!170582)) (currentBit!5280 (_2!4894 lt!170582))) lt!171339)))

(declare-fun b!112494 () Bool)

(declare-fun res!92891 () Bool)

(assert (=> b!112494 (=> (not res!92891) (not e!73798))))

(assert (=> b!112494 (= res!92891 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!171339))))

(declare-fun b!112495 () Bool)

(declare-fun lt!171340 () (_ BitVec 64))

(assert (=> b!112495 (= e!73798 (bvsle lt!171339 (bvmul lt!171340 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112495 (or (= lt!171340 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!171340 #b0000000000000000000000000000000000000000000000000000000000001000) lt!171340)))))

(assert (=> b!112495 (= lt!171340 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!170582)))))))

(assert (= (and d!36068 res!92890) b!112494))

(assert (= (and b!112494 res!92891) b!112495))

(declare-fun m!168241 () Bool)

(assert (=> d!36068 m!168241))

(declare-fun m!168243 () Bool)

(assert (=> d!36068 m!168243))

(assert (=> b!112136 d!36068))

(declare-fun d!36070 () Bool)

(assert (=> d!36070 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!170582)))) ((_ sign_extend 32) (currentByte!5285 (_2!4894 lt!169956))) ((_ sign_extend 32) (currentBit!5280 (_2!4894 lt!169956))) lt!170610) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!170582)))) ((_ sign_extend 32) (currentByte!5285 (_2!4894 lt!169956))) ((_ sign_extend 32) (currentBit!5280 (_2!4894 lt!169956)))) lt!170610))))

(declare-fun bs!8771 () Bool)

(assert (= bs!8771 d!36070))

(declare-fun m!168245 () Bool)

(assert (=> bs!8771 m!168245))

(assert (=> b!112136 d!36070))

(assert (=> b!112136 d!35688))

(declare-fun d!36072 () Bool)

(assert (=> d!36072 (= (invariant!0 (currentBit!5280 (_2!4894 lt!169956)) (currentByte!5285 (_2!4894 lt!169956)) (size!2316 (buf!2719 (_2!4894 lt!170597)))) (and (bvsge (currentBit!5280 (_2!4894 lt!169956)) #b00000000000000000000000000000000) (bvslt (currentBit!5280 (_2!4894 lt!169956)) #b00000000000000000000000000001000) (bvsge (currentByte!5285 (_2!4894 lt!169956)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5285 (_2!4894 lt!169956)) (size!2316 (buf!2719 (_2!4894 lt!170597)))) (and (= (currentBit!5280 (_2!4894 lt!169956)) #b00000000000000000000000000000000) (= (currentByte!5285 (_2!4894 lt!169956)) (size!2316 (buf!2719 (_2!4894 lt!170597))))))))))

(assert (=> b!112136 d!36072))

(declare-fun d!36074 () Bool)

(declare-fun e!73799 () Bool)

(assert (=> d!36074 e!73799))

(declare-fun res!92892 () Bool)

(assert (=> d!36074 (=> (not res!92892) (not e!73799))))

(declare-fun lt!171350 () (_ BitVec 64))

(declare-fun lt!171349 () (_ BitVec 64))

(declare-fun lt!171345 () (_ BitVec 64))

(assert (=> d!36074 (= res!92892 (= lt!171345 (bvsub lt!171349 lt!171350)))))

(assert (=> d!36074 (or (= (bvand lt!171349 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171350 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!171349 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!171349 lt!171350) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36074 (= lt!171350 (remainingBits!0 ((_ sign_extend 32) (size!2316 (buf!2719 (_1!4895 lt!170592)))) ((_ sign_extend 32) (currentByte!5285 (_1!4895 lt!170592))) ((_ sign_extend 32) (currentBit!5280 (_1!4895 lt!170592)))))))

(declare-fun lt!171348 () (_ BitVec 64))

(declare-fun lt!171347 () (_ BitVec 64))

(assert (=> d!36074 (= lt!171349 (bvmul lt!171348 lt!171347))))

(assert (=> d!36074 (or (= lt!171348 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!171347 (bvsdiv (bvmul lt!171348 lt!171347) lt!171348)))))

(assert (=> d!36074 (= lt!171347 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36074 (= lt!171348 ((_ sign_extend 32) (size!2316 (buf!2719 (_1!4895 lt!170592)))))))

(assert (=> d!36074 (= lt!171345 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5285 (_1!4895 lt!170592))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5280 (_1!4895 lt!170592)))))))

(assert (=> d!36074 (invariant!0 (currentBit!5280 (_1!4895 lt!170592)) (currentByte!5285 (_1!4895 lt!170592)) (size!2316 (buf!2719 (_1!4895 lt!170592))))))

(assert (=> d!36074 (= (bitIndex!0 (size!2316 (buf!2719 (_1!4895 lt!170592))) (currentByte!5285 (_1!4895 lt!170592)) (currentBit!5280 (_1!4895 lt!170592))) lt!171345)))

(declare-fun b!112496 () Bool)

(declare-fun res!92893 () Bool)

(assert (=> b!112496 (=> (not res!92893) (not e!73799))))

(assert (=> b!112496 (= res!92893 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!171345))))

(declare-fun b!112497 () Bool)

(declare-fun lt!171346 () (_ BitVec 64))

(assert (=> b!112497 (= e!73799 (bvsle lt!171345 (bvmul lt!171346 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112497 (or (= lt!171346 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!171346 #b0000000000000000000000000000000000000000000000000000000000001000) lt!171346)))))

(assert (=> b!112497 (= lt!171346 ((_ sign_extend 32) (size!2316 (buf!2719 (_1!4895 lt!170592)))))))

(assert (= (and d!36074 res!92892) b!112496))

(assert (= (and b!112496 res!92893) b!112497))

(declare-fun m!168247 () Bool)

(assert (=> d!36074 m!168247))

(declare-fun m!168249 () Bool)

(assert (=> d!36074 m!168249))

(assert (=> b!112136 d!36074))

(declare-fun d!36076 () Bool)

(assert (=> d!36076 (= (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!112136 d!36076))

(declare-fun d!36078 () Bool)

(declare-fun lt!171351 () tuple2!9282)

(assert (=> d!36078 (= lt!171351 (readBit!0 lt!170615))))

(assert (=> d!36078 (= (readBitPure!0 lt!170615) (tuple2!9271 (_2!4901 lt!171351) (_1!4901 lt!171351)))))

(declare-fun bs!8772 () Bool)

(assert (= bs!8772 d!36078))

(declare-fun m!168251 () Bool)

(assert (=> bs!8772 m!168251))

(assert (=> b!112136 d!36078))

(declare-fun d!36080 () Bool)

(declare-fun lt!171352 () tuple2!9282)

(assert (=> d!36080 (= lt!171352 (readBit!0 lt!170600))))

(assert (=> d!36080 (= (readBitPure!0 lt!170600) (tuple2!9271 (_2!4901 lt!171352) (_1!4901 lt!171352)))))

(declare-fun bs!8773 () Bool)

(assert (= bs!8773 d!36080))

(declare-fun m!168253 () Bool)

(assert (=> bs!8773 m!168253))

(assert (=> b!112136 d!36080))

(declare-fun d!36082 () Bool)

(assert (=> d!36082 (validate_offset_bits!1 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!170582)))) ((_ sign_extend 32) (currentByte!5285 (_2!4894 lt!169956))) ((_ sign_extend 32) (currentBit!5280 (_2!4894 lt!169956))) lt!170610)))

(declare-fun lt!171353 () Unit!6851)

(assert (=> d!36082 (= lt!171353 (choose!9 (_2!4894 lt!169956) (buf!2719 (_2!4894 lt!170582)) lt!170610 (BitStream!4107 (buf!2719 (_2!4894 lt!170582)) (currentByte!5285 (_2!4894 lt!169956)) (currentBit!5280 (_2!4894 lt!169956)))))))

(assert (=> d!36082 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4894 lt!169956) (buf!2719 (_2!4894 lt!170582)) lt!170610) lt!171353)))

(declare-fun bs!8774 () Bool)

(assert (= bs!8774 d!36082))

(assert (=> bs!8774 m!167413))

(declare-fun m!168255 () Bool)

(assert (=> bs!8774 m!168255))

(assert (=> b!112136 d!36082))

(declare-fun d!36084 () Bool)

(declare-fun e!73800 () Bool)

(assert (=> d!36084 e!73800))

(declare-fun res!92894 () Bool)

(assert (=> d!36084 (=> (not res!92894) (not e!73800))))

(assert (=> d!36084 (= res!92894 (= (buf!2719 (_2!4894 (increaseBitIndex!0 (readerFrom!0 (_2!4894 lt!169956) (currentBit!5280 thiss!1305) (currentByte!5285 thiss!1305))))) (buf!2719 (readerFrom!0 (_2!4894 lt!169956) (currentBit!5280 thiss!1305) (currentByte!5285 thiss!1305)))))))

(declare-fun lt!171357 () Bool)

(assert (=> d!36084 (= lt!171357 (not (= (bvand ((_ sign_extend 24) (select (arr!2909 (buf!2719 (readerFrom!0 (_2!4894 lt!169956) (currentBit!5280 thiss!1305) (currentByte!5285 thiss!1305)))) (currentByte!5285 (readerFrom!0 (_2!4894 lt!169956) (currentBit!5280 thiss!1305) (currentByte!5285 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5280 (readerFrom!0 (_2!4894 lt!169956) (currentBit!5280 thiss!1305) (currentByte!5285 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!171356 () tuple2!9282)

(assert (=> d!36084 (= lt!171356 (tuple2!9283 (not (= (bvand ((_ sign_extend 24) (select (arr!2909 (buf!2719 (readerFrom!0 (_2!4894 lt!169956) (currentBit!5280 thiss!1305) (currentByte!5285 thiss!1305)))) (currentByte!5285 (readerFrom!0 (_2!4894 lt!169956) (currentBit!5280 thiss!1305) (currentByte!5285 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5280 (readerFrom!0 (_2!4894 lt!169956) (currentBit!5280 thiss!1305) (currentByte!5285 thiss!1305)))))) #b00000000000000000000000000000000)) (_2!4894 (increaseBitIndex!0 (readerFrom!0 (_2!4894 lt!169956) (currentBit!5280 thiss!1305) (currentByte!5285 thiss!1305))))))))

(assert (=> d!36084 (validate_offset_bit!0 ((_ sign_extend 32) (size!2316 (buf!2719 (readerFrom!0 (_2!4894 lt!169956) (currentBit!5280 thiss!1305) (currentByte!5285 thiss!1305))))) ((_ sign_extend 32) (currentByte!5285 (readerFrom!0 (_2!4894 lt!169956) (currentBit!5280 thiss!1305) (currentByte!5285 thiss!1305)))) ((_ sign_extend 32) (currentBit!5280 (readerFrom!0 (_2!4894 lt!169956) (currentBit!5280 thiss!1305) (currentByte!5285 thiss!1305)))))))

(assert (=> d!36084 (= (readBit!0 (readerFrom!0 (_2!4894 lt!169956) (currentBit!5280 thiss!1305) (currentByte!5285 thiss!1305))) lt!171356)))

(declare-fun b!112498 () Bool)

(declare-fun lt!171355 () (_ BitVec 64))

(declare-fun lt!171360 () (_ BitVec 64))

(assert (=> b!112498 (= e!73800 (= (bitIndex!0 (size!2316 (buf!2719 (_2!4894 (increaseBitIndex!0 (readerFrom!0 (_2!4894 lt!169956) (currentBit!5280 thiss!1305) (currentByte!5285 thiss!1305)))))) (currentByte!5285 (_2!4894 (increaseBitIndex!0 (readerFrom!0 (_2!4894 lt!169956) (currentBit!5280 thiss!1305) (currentByte!5285 thiss!1305))))) (currentBit!5280 (_2!4894 (increaseBitIndex!0 (readerFrom!0 (_2!4894 lt!169956) (currentBit!5280 thiss!1305) (currentByte!5285 thiss!1305)))))) (bvadd lt!171360 lt!171355)))))

(assert (=> b!112498 (or (not (= (bvand lt!171360 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171355 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!171360 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!171360 lt!171355) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112498 (= lt!171355 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!112498 (= lt!171360 (bitIndex!0 (size!2316 (buf!2719 (readerFrom!0 (_2!4894 lt!169956) (currentBit!5280 thiss!1305) (currentByte!5285 thiss!1305)))) (currentByte!5285 (readerFrom!0 (_2!4894 lt!169956) (currentBit!5280 thiss!1305) (currentByte!5285 thiss!1305))) (currentBit!5280 (readerFrom!0 (_2!4894 lt!169956) (currentBit!5280 thiss!1305) (currentByte!5285 thiss!1305)))))))

(declare-fun lt!171354 () Bool)

(assert (=> b!112498 (= lt!171354 (not (= (bvand ((_ sign_extend 24) (select (arr!2909 (buf!2719 (readerFrom!0 (_2!4894 lt!169956) (currentBit!5280 thiss!1305) (currentByte!5285 thiss!1305)))) (currentByte!5285 (readerFrom!0 (_2!4894 lt!169956) (currentBit!5280 thiss!1305) (currentByte!5285 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5280 (readerFrom!0 (_2!4894 lt!169956) (currentBit!5280 thiss!1305) (currentByte!5285 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!171358 () Bool)

(assert (=> b!112498 (= lt!171358 (not (= (bvand ((_ sign_extend 24) (select (arr!2909 (buf!2719 (readerFrom!0 (_2!4894 lt!169956) (currentBit!5280 thiss!1305) (currentByte!5285 thiss!1305)))) (currentByte!5285 (readerFrom!0 (_2!4894 lt!169956) (currentBit!5280 thiss!1305) (currentByte!5285 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5280 (readerFrom!0 (_2!4894 lt!169956) (currentBit!5280 thiss!1305) (currentByte!5285 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!171359 () Bool)

(assert (=> b!112498 (= lt!171359 (not (= (bvand ((_ sign_extend 24) (select (arr!2909 (buf!2719 (readerFrom!0 (_2!4894 lt!169956) (currentBit!5280 thiss!1305) (currentByte!5285 thiss!1305)))) (currentByte!5285 (readerFrom!0 (_2!4894 lt!169956) (currentBit!5280 thiss!1305) (currentByte!5285 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5280 (readerFrom!0 (_2!4894 lt!169956) (currentBit!5280 thiss!1305) (currentByte!5285 thiss!1305)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!36084 res!92894) b!112498))

(assert (=> d!36084 m!166999))

(declare-fun m!168257 () Bool)

(assert (=> d!36084 m!168257))

(declare-fun m!168259 () Bool)

(assert (=> d!36084 m!168259))

(declare-fun m!168261 () Bool)

(assert (=> d!36084 m!168261))

(declare-fun m!168263 () Bool)

(assert (=> d!36084 m!168263))

(declare-fun m!168265 () Bool)

(assert (=> b!112498 m!168265))

(assert (=> b!112498 m!168261))

(assert (=> b!112498 m!166999))

(assert (=> b!112498 m!168257))

(declare-fun m!168267 () Bool)

(assert (=> b!112498 m!168267))

(assert (=> b!112498 m!168259))

(assert (=> d!35702 d!36084))

(assert (=> d!35786 d!35782))

(declare-fun d!36086 () Bool)

(assert (=> d!36086 (validate_offset_bits!1 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!169962)))) ((_ sign_extend 32) (currentByte!5285 (_2!4894 lt!169956))) ((_ sign_extend 32) (currentBit!5280 (_2!4894 lt!169956))) lt!169965)))

(assert (=> d!36086 true))

(declare-fun _$6!249 () Unit!6851)

(assert (=> d!36086 (= (choose!9 (_2!4894 lt!169956) (buf!2719 (_2!4894 lt!169962)) lt!169965 (BitStream!4107 (buf!2719 (_2!4894 lt!169962)) (currentByte!5285 (_2!4894 lt!169956)) (currentBit!5280 (_2!4894 lt!169956)))) _$6!249)))

(declare-fun bs!8775 () Bool)

(assert (= bs!8775 d!36086))

(assert (=> bs!8775 m!166967))

(assert (=> d!35786 d!36086))

(declare-fun d!36088 () Bool)

(assert (=> d!36088 (= (remainingBits!0 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!169962)))) ((_ sign_extend 32) (currentByte!5285 (_2!4894 lt!169956))) ((_ sign_extend 32) (currentBit!5280 (_2!4894 lt!169956)))) (bvsub (bvmul ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!169962)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5285 (_2!4894 lt!169956))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5280 (_2!4894 lt!169956))))))))

(assert (=> d!35782 d!36088))

(declare-fun d!36090 () Bool)

(assert (=> d!36090 (= (remainingBits!0 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!169962)))) ((_ sign_extend 32) (currentByte!5285 thiss!1305)) ((_ sign_extend 32) (currentBit!5280 thiss!1305))) (bvsub (bvmul ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!169962)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5285 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5280 thiss!1305)))))))

(assert (=> d!35730 d!36090))

(declare-fun d!36092 () Bool)

(declare-fun e!73801 () Bool)

(assert (=> d!36092 e!73801))

(declare-fun res!92895 () Bool)

(assert (=> d!36092 (=> (not res!92895) (not e!73801))))

(declare-fun lt!171366 () (_ BitVec 64))

(declare-fun lt!171365 () (_ BitVec 64))

(declare-fun lt!171361 () (_ BitVec 64))

(assert (=> d!36092 (= res!92895 (= lt!171361 (bvsub lt!171365 lt!171366)))))

(assert (=> d!36092 (or (= (bvand lt!171365 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171366 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!171365 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!171365 lt!171366) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36092 (= lt!171366 (remainingBits!0 ((_ sign_extend 32) (size!2316 (buf!2719 lt!170084))) ((_ sign_extend 32) (currentByte!5285 lt!170084)) ((_ sign_extend 32) (currentBit!5280 lt!170084))))))

(declare-fun lt!171364 () (_ BitVec 64))

(declare-fun lt!171363 () (_ BitVec 64))

(assert (=> d!36092 (= lt!171365 (bvmul lt!171364 lt!171363))))

(assert (=> d!36092 (or (= lt!171364 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!171363 (bvsdiv (bvmul lt!171364 lt!171363) lt!171364)))))

(assert (=> d!36092 (= lt!171363 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36092 (= lt!171364 ((_ sign_extend 32) (size!2316 (buf!2719 lt!170084))))))

(assert (=> d!36092 (= lt!171361 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5285 lt!170084)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5280 lt!170084))))))

(assert (=> d!36092 (invariant!0 (currentBit!5280 lt!170084) (currentByte!5285 lt!170084) (size!2316 (buf!2719 lt!170084)))))

(assert (=> d!36092 (= (bitIndex!0 (size!2316 (buf!2719 lt!170084)) (currentByte!5285 lt!170084) (currentBit!5280 lt!170084)) lt!171361)))

(declare-fun b!112499 () Bool)

(declare-fun res!92896 () Bool)

(assert (=> b!112499 (=> (not res!92896) (not e!73801))))

(assert (=> b!112499 (= res!92896 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!171361))))

(declare-fun b!112500 () Bool)

(declare-fun lt!171362 () (_ BitVec 64))

(assert (=> b!112500 (= e!73801 (bvsle lt!171361 (bvmul lt!171362 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112500 (or (= lt!171362 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!171362 #b0000000000000000000000000000000000000000000000000000000000001000) lt!171362)))))

(assert (=> b!112500 (= lt!171362 ((_ sign_extend 32) (size!2316 (buf!2719 lt!170084))))))

(assert (= (and d!36092 res!92895) b!112499))

(assert (= (and b!112499 res!92896) b!112500))

(declare-fun m!168269 () Bool)

(assert (=> d!36092 m!168269))

(declare-fun m!168271 () Bool)

(assert (=> d!36092 m!168271))

(assert (=> d!35692 d!36092))

(declare-fun d!36094 () Bool)

(declare-fun e!73802 () Bool)

(assert (=> d!36094 e!73802))

(declare-fun res!92897 () Bool)

(assert (=> d!36094 (=> (not res!92897) (not e!73802))))

(declare-fun lt!171372 () (_ BitVec 64))

(declare-fun lt!171371 () (_ BitVec 64))

(declare-fun lt!171367 () (_ BitVec 64))

(assert (=> d!36094 (= res!92897 (= lt!171367 (bvsub lt!171371 lt!171372)))))

(assert (=> d!36094 (or (= (bvand lt!171371 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171372 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!171371 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!171371 lt!171372) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36094 (= lt!171372 (remainingBits!0 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4896 lt!169963)))) ((_ sign_extend 32) (currentByte!5285 (_2!4896 lt!169963))) ((_ sign_extend 32) (currentBit!5280 (_2!4896 lt!169963)))))))

(declare-fun lt!171370 () (_ BitVec 64))

(declare-fun lt!171369 () (_ BitVec 64))

(assert (=> d!36094 (= lt!171371 (bvmul lt!171370 lt!171369))))

(assert (=> d!36094 (or (= lt!171370 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!171369 (bvsdiv (bvmul lt!171370 lt!171369) lt!171370)))))

(assert (=> d!36094 (= lt!171369 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36094 (= lt!171370 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4896 lt!169963)))))))

(assert (=> d!36094 (= lt!171367 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5285 (_2!4896 lt!169963))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5280 (_2!4896 lt!169963)))))))

(assert (=> d!36094 (invariant!0 (currentBit!5280 (_2!4896 lt!169963)) (currentByte!5285 (_2!4896 lt!169963)) (size!2316 (buf!2719 (_2!4896 lt!169963))))))

(assert (=> d!36094 (= (bitIndex!0 (size!2316 (buf!2719 (_2!4896 lt!169963))) (currentByte!5285 (_2!4896 lt!169963)) (currentBit!5280 (_2!4896 lt!169963))) lt!171367)))

(declare-fun b!112501 () Bool)

(declare-fun res!92898 () Bool)

(assert (=> b!112501 (=> (not res!92898) (not e!73802))))

(assert (=> b!112501 (= res!92898 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!171367))))

(declare-fun b!112502 () Bool)

(declare-fun lt!171368 () (_ BitVec 64))

(assert (=> b!112502 (= e!73802 (bvsle lt!171367 (bvmul lt!171368 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112502 (or (= lt!171368 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!171368 #b0000000000000000000000000000000000000000000000000000000000001000) lt!171368)))))

(assert (=> b!112502 (= lt!171368 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4896 lt!169963)))))))

(assert (= (and d!36094 res!92897) b!112501))

(assert (= (and b!112501 res!92898) b!112502))

(declare-fun m!168273 () Bool)

(assert (=> d!36094 m!168273))

(declare-fun m!168275 () Bool)

(assert (=> d!36094 m!168275))

(assert (=> d!35692 d!36094))

(declare-fun d!36096 () Bool)

(declare-fun lt!171375 () (_ BitVec 32))

(assert (=> d!36096 (= lt!171375 ((_ extract 31 0) (bvsrem (bvsub lt!169968 lt!169973) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!171374 () (_ BitVec 32))

(assert (=> d!36096 (= lt!171374 ((_ extract 31 0) (bvsdiv (bvsub lt!169968 lt!169973) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!73803 () Bool)

(assert (=> d!36096 e!73803))

(declare-fun res!92899 () Bool)

(assert (=> d!36096 (=> (not res!92899) (not e!73803))))

(assert (=> d!36096 (= res!92899 (moveBitIndexPrecond!0 (_2!4896 lt!169963) (bvsub lt!169968 lt!169973)))))

(declare-fun Unit!6897 () Unit!6851)

(declare-fun Unit!6898 () Unit!6851)

(declare-fun Unit!6899 () Unit!6851)

(assert (=> d!36096 (= (moveBitIndex!0 (_2!4896 lt!169963) (bvsub lt!169968 lt!169973)) (ite (bvslt (bvadd (currentBit!5280 (_2!4896 lt!169963)) lt!171375) #b00000000000000000000000000000000) (tuple2!9269 Unit!6897 (BitStream!4107 (buf!2719 (_2!4896 lt!169963)) (bvsub (bvadd (currentByte!5285 (_2!4896 lt!169963)) lt!171374) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!171375 (currentBit!5280 (_2!4896 lt!169963))))) (ite (bvsge (bvadd (currentBit!5280 (_2!4896 lt!169963)) lt!171375) #b00000000000000000000000000001000) (tuple2!9269 Unit!6898 (BitStream!4107 (buf!2719 (_2!4896 lt!169963)) (bvadd (currentByte!5285 (_2!4896 lt!169963)) lt!171374 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!5280 (_2!4896 lt!169963)) lt!171375) #b00000000000000000000000000001000))) (tuple2!9269 Unit!6899 (BitStream!4107 (buf!2719 (_2!4896 lt!169963)) (bvadd (currentByte!5285 (_2!4896 lt!169963)) lt!171374) (bvadd (currentBit!5280 (_2!4896 lt!169963)) lt!171375))))))))

(declare-fun b!112503 () Bool)

(declare-fun e!73804 () Bool)

(assert (=> b!112503 (= e!73803 e!73804)))

(declare-fun res!92900 () Bool)

(assert (=> b!112503 (=> (not res!92900) (not e!73804))))

(declare-fun lt!171376 () (_ BitVec 64))

(declare-fun lt!171373 () tuple2!9268)

(assert (=> b!112503 (= res!92900 (= (bvadd lt!171376 (bvsub lt!169968 lt!169973)) (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!171373))) (currentByte!5285 (_2!4894 lt!171373)) (currentBit!5280 (_2!4894 lt!171373)))))))

(assert (=> b!112503 (or (not (= (bvand lt!171376 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!169968 lt!169973) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!171376 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!171376 (bvsub lt!169968 lt!169973)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112503 (= lt!171376 (bitIndex!0 (size!2316 (buf!2719 (_2!4896 lt!169963))) (currentByte!5285 (_2!4896 lt!169963)) (currentBit!5280 (_2!4896 lt!169963))))))

(declare-fun lt!171378 () (_ BitVec 32))

(declare-fun lt!171377 () (_ BitVec 32))

(declare-fun Unit!6900 () Unit!6851)

(declare-fun Unit!6901 () Unit!6851)

(declare-fun Unit!6902 () Unit!6851)

(assert (=> b!112503 (= lt!171373 (ite (bvslt (bvadd (currentBit!5280 (_2!4896 lt!169963)) lt!171377) #b00000000000000000000000000000000) (tuple2!9269 Unit!6900 (BitStream!4107 (buf!2719 (_2!4896 lt!169963)) (bvsub (bvadd (currentByte!5285 (_2!4896 lt!169963)) lt!171378) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!171377 (currentBit!5280 (_2!4896 lt!169963))))) (ite (bvsge (bvadd (currentBit!5280 (_2!4896 lt!169963)) lt!171377) #b00000000000000000000000000001000) (tuple2!9269 Unit!6901 (BitStream!4107 (buf!2719 (_2!4896 lt!169963)) (bvadd (currentByte!5285 (_2!4896 lt!169963)) lt!171378 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!5280 (_2!4896 lt!169963)) lt!171377) #b00000000000000000000000000001000))) (tuple2!9269 Unit!6902 (BitStream!4107 (buf!2719 (_2!4896 lt!169963)) (bvadd (currentByte!5285 (_2!4896 lt!169963)) lt!171378) (bvadd (currentBit!5280 (_2!4896 lt!169963)) lt!171377))))))))

(assert (=> b!112503 (= lt!171377 ((_ extract 31 0) (bvsrem (bvsub lt!169968 lt!169973) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112503 (= lt!171378 ((_ extract 31 0) (bvsdiv (bvsub lt!169968 lt!169973) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!112504 () Bool)

(assert (=> b!112504 (= e!73804 (and (= (size!2316 (buf!2719 (_2!4896 lt!169963))) (size!2316 (buf!2719 (_2!4894 lt!171373)))) (= (buf!2719 (_2!4896 lt!169963)) (buf!2719 (_2!4894 lt!171373)))))))

(assert (= (and d!36096 res!92899) b!112503))

(assert (= (and b!112503 res!92900) b!112504))

(assert (=> d!36096 m!167061))

(declare-fun m!168277 () Bool)

(assert (=> b!112503 m!168277))

(assert (=> b!112503 m!167057))

(assert (=> d!35692 d!36096))

(declare-fun d!36098 () Bool)

(declare-fun res!92901 () Bool)

(declare-fun e!73805 () Bool)

(assert (=> d!36098 (=> (not res!92901) (not e!73805))))

(assert (=> d!36098 (= res!92901 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4896 lt!169963))))) (bvsub lt!169968 lt!169973)) (bvsle (bvsub lt!169968 lt!169973) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4896 lt!169963))))))))))

(assert (=> d!36098 (= (moveBitIndexPrecond!0 (_2!4896 lt!169963) (bvsub lt!169968 lt!169973)) e!73805)))

(declare-fun b!112505 () Bool)

(declare-fun lt!171379 () (_ BitVec 64))

(assert (=> b!112505 (= e!73805 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!171379) (bvsle lt!171379 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4896 lt!169963))))))))))

(assert (=> b!112505 (= lt!171379 (bvadd (bitIndex!0 (size!2316 (buf!2719 (_2!4896 lt!169963))) (currentByte!5285 (_2!4896 lt!169963)) (currentBit!5280 (_2!4896 lt!169963))) (bvsub lt!169968 lt!169973)))))

(assert (= (and d!36098 res!92901) b!112505))

(assert (=> b!112505 m!167057))

(assert (=> d!35692 d!36098))

(declare-fun d!36100 () Bool)

(assert (=> d!36100 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!170604)))) ((_ sign_extend 32) (currentByte!5285 (_2!4894 lt!169956))) ((_ sign_extend 32) (currentBit!5280 (_2!4894 lt!169956))) lt!170581) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!170604)))) ((_ sign_extend 32) (currentByte!5285 (_2!4894 lt!169956))) ((_ sign_extend 32) (currentBit!5280 (_2!4894 lt!169956)))) lt!170581))))

(declare-fun bs!8776 () Bool)

(assert (= bs!8776 d!36100))

(declare-fun m!168279 () Bool)

(assert (=> bs!8776 m!168279))

(assert (=> b!112133 d!36100))

(declare-fun b!112507 () Bool)

(declare-fun res!92903 () Bool)

(declare-fun e!73806 () Bool)

(assert (=> b!112507 (=> (not res!92903) (not e!73806))))

(declare-fun lt!171397 () tuple2!9272)

(assert (=> b!112507 (= res!92903 (isPrefixOf!0 (_1!4896 lt!171397) (_2!4894 lt!169956)))))

(declare-fun b!112508 () Bool)

(declare-fun e!73807 () Unit!6851)

(declare-fun Unit!6903 () Unit!6851)

(assert (=> b!112508 (= e!73807 Unit!6903)))

(declare-fun b!112509 () Bool)

(declare-fun lt!171380 () (_ BitVec 64))

(declare-fun lt!171383 () (_ BitVec 64))

(assert (=> b!112509 (= e!73806 (= (_1!4896 lt!171397) (withMovedBitIndex!0 (_2!4896 lt!171397) (bvsub lt!171380 lt!171383))))))

(assert (=> b!112509 (or (= (bvand lt!171380 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!171383 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!171380 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!171380 lt!171383) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112509 (= lt!171383 (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!170604))) (currentByte!5285 (_2!4894 lt!170604)) (currentBit!5280 (_2!4894 lt!170604))))))

(assert (=> b!112509 (= lt!171380 (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!169956))) (currentByte!5285 (_2!4894 lt!169956)) (currentBit!5280 (_2!4894 lt!169956))))))

(declare-fun b!112510 () Bool)

(declare-fun lt!171382 () Unit!6851)

(assert (=> b!112510 (= e!73807 lt!171382)))

(declare-fun lt!171391 () (_ BitVec 64))

(assert (=> b!112510 (= lt!171391 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!171384 () (_ BitVec 64))

(assert (=> b!112510 (= lt!171384 (bitIndex!0 (size!2316 (buf!2719 (_2!4894 lt!169956))) (currentByte!5285 (_2!4894 lt!169956)) (currentBit!5280 (_2!4894 lt!169956))))))

(assert (=> b!112510 (= lt!171382 (arrayBitRangesEqSymmetric!0 (buf!2719 (_2!4894 lt!169956)) (buf!2719 (_2!4894 lt!170604)) lt!171391 lt!171384))))

(assert (=> b!112510 (arrayBitRangesEq!0 (buf!2719 (_2!4894 lt!170604)) (buf!2719 (_2!4894 lt!169956)) lt!171391 lt!171384)))

(declare-fun b!112506 () Bool)

(declare-fun res!92904 () Bool)

(assert (=> b!112506 (=> (not res!92904) (not e!73806))))

(assert (=> b!112506 (= res!92904 (isPrefixOf!0 (_2!4896 lt!171397) (_2!4894 lt!170604)))))

(declare-fun d!36102 () Bool)

(assert (=> d!36102 e!73806))

(declare-fun res!92902 () Bool)

(assert (=> d!36102 (=> (not res!92902) (not e!73806))))

(assert (=> d!36102 (= res!92902 (isPrefixOf!0 (_1!4896 lt!171397) (_2!4896 lt!171397)))))

(declare-fun lt!171388 () BitStream!4106)

(assert (=> d!36102 (= lt!171397 (tuple2!9273 lt!171388 (_2!4894 lt!170604)))))

(declare-fun lt!171398 () Unit!6851)

(declare-fun lt!171399 () Unit!6851)

(assert (=> d!36102 (= lt!171398 lt!171399)))

(assert (=> d!36102 (isPrefixOf!0 lt!171388 (_2!4894 lt!170604))))

(assert (=> d!36102 (= lt!171399 (lemmaIsPrefixTransitive!0 lt!171388 (_2!4894 lt!170604) (_2!4894 lt!170604)))))

(declare-fun lt!171394 () Unit!6851)

(declare-fun lt!171386 () Unit!6851)

(assert (=> d!36102 (= lt!171394 lt!171386)))

(assert (=> d!36102 (isPrefixOf!0 lt!171388 (_2!4894 lt!170604))))

(assert (=> d!36102 (= lt!171386 (lemmaIsPrefixTransitive!0 lt!171388 (_2!4894 lt!169956) (_2!4894 lt!170604)))))

(declare-fun lt!171390 () Unit!6851)

(assert (=> d!36102 (= lt!171390 e!73807)))

(declare-fun c!6852 () Bool)

(assert (=> d!36102 (= c!6852 (not (= (size!2316 (buf!2719 (_2!4894 lt!169956))) #b00000000000000000000000000000000)))))

(declare-fun lt!171389 () Unit!6851)

(declare-fun lt!171385 () Unit!6851)

(assert (=> d!36102 (= lt!171389 lt!171385)))

(assert (=> d!36102 (isPrefixOf!0 (_2!4894 lt!170604) (_2!4894 lt!170604))))

(assert (=> d!36102 (= lt!171385 (lemmaIsPrefixRefl!0 (_2!4894 lt!170604)))))

(declare-fun lt!171387 () Unit!6851)

(declare-fun lt!171396 () Unit!6851)

(assert (=> d!36102 (= lt!171387 lt!171396)))

(assert (=> d!36102 (= lt!171396 (lemmaIsPrefixRefl!0 (_2!4894 lt!170604)))))

(declare-fun lt!171393 () Unit!6851)

(declare-fun lt!171392 () Unit!6851)

(assert (=> d!36102 (= lt!171393 lt!171392)))

(assert (=> d!36102 (isPrefixOf!0 lt!171388 lt!171388)))

(assert (=> d!36102 (= lt!171392 (lemmaIsPrefixRefl!0 lt!171388))))

(declare-fun lt!171381 () Unit!6851)

(declare-fun lt!171395 () Unit!6851)

(assert (=> d!36102 (= lt!171381 lt!171395)))

(assert (=> d!36102 (isPrefixOf!0 (_2!4894 lt!169956) (_2!4894 lt!169956))))

(assert (=> d!36102 (= lt!171395 (lemmaIsPrefixRefl!0 (_2!4894 lt!169956)))))

(assert (=> d!36102 (= lt!171388 (BitStream!4107 (buf!2719 (_2!4894 lt!170604)) (currentByte!5285 (_2!4894 lt!169956)) (currentBit!5280 (_2!4894 lt!169956))))))

(assert (=> d!36102 (isPrefixOf!0 (_2!4894 lt!169956) (_2!4894 lt!170604))))

(assert (=> d!36102 (= (reader!0 (_2!4894 lt!169956) (_2!4894 lt!170604)) lt!171397)))

(assert (= (and d!36102 c!6852) b!112510))

(assert (= (and d!36102 (not c!6852)) b!112508))

(assert (= (and d!36102 res!92902) b!112507))

(assert (= (and b!112507 res!92903) b!112506))

(assert (= (and b!112506 res!92904) b!112509))

(declare-fun m!168281 () Bool)

(assert (=> d!36102 m!168281))

(assert (=> d!36102 m!167449))

(declare-fun m!168283 () Bool)

(assert (=> d!36102 m!168283))

(assert (=> d!36102 m!167463))

(declare-fun m!168285 () Bool)

(assert (=> d!36102 m!168285))

(declare-fun m!168287 () Bool)

(assert (=> d!36102 m!168287))

(assert (=> d!36102 m!167467))

(declare-fun m!168289 () Bool)

(assert (=> d!36102 m!168289))

(declare-fun m!168291 () Bool)

(assert (=> d!36102 m!168291))

(declare-fun m!168293 () Bool)

(assert (=> d!36102 m!168293))

(declare-fun m!168295 () Bool)

(assert (=> d!36102 m!168295))

(assert (=> b!112510 m!166973))

(declare-fun m!168297 () Bool)

(assert (=> b!112510 m!168297))

(declare-fun m!168299 () Bool)

(assert (=> b!112510 m!168299))

(declare-fun m!168301 () Bool)

(assert (=> b!112509 m!168301))

(assert (=> b!112509 m!167389))

(assert (=> b!112509 m!166973))

(declare-fun m!168303 () Bool)

(assert (=> b!112507 m!168303))

(declare-fun m!168305 () Bool)

(assert (=> b!112506 m!168305))

(assert (=> b!112133 d!36102))

(declare-fun lt!171400 () tuple2!9280)

(declare-fun d!36104 () Bool)

(assert (=> d!36104 (= lt!171400 (readNLeastSignificantBitsLoop!0 (_1!4896 lt!170612) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!170595))))

(assert (=> d!36104 (= (readNLeastSignificantBitsLoopPure!0 (_1!4896 lt!170612) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!170595) (tuple2!9275 (_2!4900 lt!171400) (_1!4900 lt!171400)))))

(declare-fun bs!8777 () Bool)

(assert (= bs!8777 d!36104))

(declare-fun m!168307 () Bool)

(assert (=> bs!8777 m!168307))

(assert (=> b!112133 d!36104))

(assert (=> b!112133 d!36076))

(declare-fun d!36106 () Bool)

(assert (=> d!36106 (validate_offset_bits!1 ((_ sign_extend 32) (size!2316 (buf!2719 (_2!4894 lt!170604)))) ((_ sign_extend 32) (currentByte!5285 (_2!4894 lt!169956))) ((_ sign_extend 32) (currentBit!5280 (_2!4894 lt!169956))) lt!170581)))

(declare-fun lt!171401 () Unit!6851)

(assert (=> d!36106 (= lt!171401 (choose!9 (_2!4894 lt!169956) (buf!2719 (_2!4894 lt!170604)) lt!170581 (BitStream!4107 (buf!2719 (_2!4894 lt!170604)) (currentByte!5285 (_2!4894 lt!169956)) (currentBit!5280 (_2!4894 lt!169956)))))))

(assert (=> d!36106 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4894 lt!169956) (buf!2719 (_2!4894 lt!170604)) lt!170581) lt!171401)))

(declare-fun bs!8778 () Bool)

(assert (= bs!8778 d!36106))

(assert (=> bs!8778 m!167379))

(declare-fun m!168309 () Bool)

(assert (=> bs!8778 m!168309))

(assert (=> b!112133 d!36106))

(push 1)

(assert (not b!112452))

(assert (not b!112294))

(assert (not b!112343))

(assert (not b!112403))

(assert (not b!112395))

(assert (not d!35956))

(assert (not b!112445))

(assert (not b!112361))

(assert (not d!36106))

(assert (not b!112471))

(assert (not b!112490))

(assert (not b!112401))

(assert (not d!36070))

(assert (not d!35878))

(assert (not b!112427))

(assert (not b!112418))

(assert (not d!36062))

(assert (not b!112359))

(assert (not b!112355))

(assert (not d!35912))

(assert (not b!112498))

(assert (not bm!1429))

(assert (not d!35876))

(assert (not d!35972))

(assert (not b!112475))

(assert (not b!112311))

(assert (not b!112461))

(assert (not b!112412))

(assert (not d!36092))

(assert (not d!35974))

(assert (not d!35910))

(assert (not b!112489))

(assert (not b!112436))

(assert (not d!35944))

(assert (not d!36038))

(assert (not d!35954))

(assert (not d!35934))

(assert (not d!36086))

(assert (not b!112417))

(assert (not d!36068))

(assert (not d!36022))

(assert (not b!112453))

(assert (not d!36082))

(assert (not b!112299))

(assert (not b!112462))

(assert (not d!36060))

(assert (not d!36034))

(assert (not b!112474))

(assert (not b!112297))

(assert (not b!112409))

(assert (not d!35982))

(assert (not d!35902))

(assert (not d!36104))

(assert (not b!112288))

(assert (not b!112332))

(assert (not b!112468))

(assert (not b!112398))

(assert (not d!35906))

(assert (not b!112276))

(assert (not bm!1428))

(assert (not d!35882))

(assert (not b!112493))

(assert (not bm!1426))

(assert (not d!36100))

(assert (not b!112455))

(assert (not bm!1425))

(assert (not d!36094))

(assert (not d!35918))

(assert (not b!112380))

(assert (not d!36050))

(assert (not d!36052))

(assert (not d!35994))

(assert (not b!112441))

(assert (not b!112415))

(assert (not b!112348))

(assert (not d!35920))

(assert (not d!36046))

(assert (not d!36020))

(assert (not d!35868))

(assert (not b!112447))

(assert (not d!35930))

(assert (not b!112482))

(assert (not d!35938))

(assert (not b!112485))

(assert (not d!36080))

(assert (not b!112300))

(assert (not b!112396))

(assert (not d!36102))

(assert (not b!112302))

(assert (not d!36096))

(assert (not b!112449))

(assert (not b!112469))

(assert (not b!112430))

(assert (not b!112481))

(assert (not d!35936))

(assert (not b!112503))

(assert (not b!112393))

(assert (not d!36030))

(assert (not b!112305))

(assert (not b!112439))

(assert (not b!112309))

(assert (not b!112507))

(assert (not d!36010))

(assert (not b!112431))

(assert (not b!112378))

(assert (not b!112460))

(assert (not b!112279))

(assert (not d!36036))

(assert (not b!112404))

(assert (not b!112330))

(assert (not d!35948))

(assert (not b!112419))

(assert (not b!112492))

(assert (not d!36066))

(assert (not b!112296))

(assert (not b!112505))

(assert (not d!35892))

(assert (not d!35946))

(assert (not b!112406))

(assert (not d!36016))

(assert (not b!112426))

(assert (not d!36040))

(assert (not b!112345))

(assert (not b!112410))

(assert (not b!112429))

(assert (not b!112433))

(assert (not b!112293))

(assert (not d!35884))

(assert (not b!112331))

(assert (not b!112466))

(assert (not d!35952))

(assert (not d!35942))

(assert (not d!36042))

(assert (not d!36054))

(assert (not b!112407))

(assert (not b!112509))

(assert (not d!35908))

(assert (not b!112303))

(assert (not b!112394))

(assert (not b!112274))

(assert (not d!36044))

(assert (not b!112425))

(assert (not b!112392))

(assert (not b!112459))

(assert (not b!112510))

(assert (not b!112444))

(assert (not b!112306))

(assert (not b!112478))

(assert (not b!112472))

(assert (not bm!1427))

(assert (not d!35866))

(assert (not b!112477))

(assert (not d!35904))

(assert (not d!36074))

(assert (not b!112437))

(assert (not b!112328))

(assert (not d!36012))

(assert (not d!36014))

(assert (not d!36028))

(assert (not b!112506))

(assert (not b!112465))

(assert (not d!36078))

(assert (not d!36084))

(assert (not b!112370))

(assert (not b!112353))

(assert (not b!112358))

(assert (not b!112483))

(assert (not d!36064))

(assert (not d!35864))

(assert (not d!36048))

(assert (not b!112400))

(assert (not d!35964))

(assert (not b!112424))

(assert (not b!112476))

(assert (not d!36006))

(assert (not d!35922))

(assert (not b!112422))

(assert (not b!112308))

(assert (not b!112368))

(assert (not d!35984))

(assert (not d!36008))

(assert (not d!35990))

(check-sat)

(pop 1)

(push 1)

(check-sat)

