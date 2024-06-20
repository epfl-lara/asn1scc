; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42642 () Bool)

(assert start!42642)

(declare-fun b!201278 () Bool)

(declare-fun e!138061 () Bool)

(declare-datatypes ((array!10224 0))(
  ( (array!10225 (arr!5433 (Array (_ BitVec 32) (_ BitVec 8))) (size!4503 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8114 0))(
  ( (BitStream!8115 (buf!5004 array!10224) (currentByte!9402 (_ BitVec 32)) (currentBit!9397 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8114)

(declare-fun array_inv!4244 (array!10224) Bool)

(assert (=> b!201278 (= e!138061 (array_inv!4244 (buf!5004 thiss!1204)))))

(declare-fun b!201279 () Bool)

(declare-fun e!138062 () Bool)

(declare-fun e!138060 () Bool)

(assert (=> b!201279 (= e!138062 (not e!138060))))

(declare-fun res!168523 () Bool)

(assert (=> b!201279 (=> (not res!168523) (not e!138060))))

(declare-datatypes ((tuple2!17212 0))(
  ( (tuple2!17213 (_1!9257 BitStream!8114) (_2!9257 (_ BitVec 64))) )
))
(declare-fun lt!314046 () tuple2!17212)

(declare-fun v!189 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!201279 (= res!168523 (= (_2!9257 lt!314046) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun i!590 () (_ BitVec 32))

(declare-datatypes ((tuple2!17214 0))(
  ( (tuple2!17215 (_1!9258 BitStream!8114) (_2!9258 BitStream!8114)) )
))
(declare-fun lt!314043 () tuple2!17214)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8114 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17212)

(assert (=> b!201279 (= lt!314046 (readNBitsLSBFirstsLoopPure!0 (_1!9258 lt!314043) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))))))

(declare-datatypes ((Unit!14308 0))(
  ( (Unit!14309) )
))
(declare-fun lt!314042 () Unit!14308)

(declare-fun lt!314045 () (_ BitVec 64))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8114 array!10224 (_ BitVec 64)) Unit!14308)

(assert (=> b!201279 (= lt!314042 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5004 thiss!1204) lt!314045))))

(declare-fun reader!0 (BitStream!8114 BitStream!8114) tuple2!17214)

(assert (=> b!201279 (= lt!314043 (reader!0 thiss!1204 thiss!1204))))

(declare-fun isPrefixOf!0 (BitStream!8114 BitStream!8114) Bool)

(assert (=> b!201279 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-fun lt!314047 () Unit!14308)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8114) Unit!14308)

(assert (=> b!201279 (= lt!314047 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun b!201280 () Bool)

(assert (=> b!201280 (= e!138060 (= (_1!9257 lt!314046) (_2!9258 lt!314043)))))

(declare-fun b!201281 () Bool)

(declare-fun e!138057 () Bool)

(assert (=> b!201281 (= e!138057 e!138062)))

(declare-fun res!168527 () Bool)

(assert (=> b!201281 (=> (not res!168527) (not e!138062))))

(declare-fun lt!314044 () (_ BitVec 64))

(assert (=> b!201281 (= res!168527 (= lt!314044 (bvsub (bvadd lt!314044 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!201281 (= lt!314044 (bitIndex!0 (size!4503 (buf!5004 thiss!1204)) (currentByte!9402 thiss!1204) (currentBit!9397 thiss!1204)))))

(declare-fun b!201282 () Bool)

(declare-fun e!138059 () Bool)

(assert (=> b!201282 (= e!138059 e!138057)))

(declare-fun res!168528 () Bool)

(assert (=> b!201282 (=> (not res!168528) (not e!138057))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!201282 (= res!168528 (validate_offset_bits!1 ((_ sign_extend 32) (size!4503 (buf!5004 thiss!1204))) ((_ sign_extend 32) (currentByte!9402 thiss!1204)) ((_ sign_extend 32) (currentBit!9397 thiss!1204)) lt!314045))))

(assert (=> b!201282 (= lt!314045 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun res!168524 () Bool)

(assert (=> start!42642 (=> (not res!168524) (not e!138059))))

(assert (=> start!42642 (= res!168524 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42642 e!138059))

(assert (=> start!42642 true))

(declare-fun inv!12 (BitStream!8114) Bool)

(assert (=> start!42642 (and (inv!12 thiss!1204) e!138061)))

(declare-fun b!201283 () Bool)

(declare-fun res!168525 () Bool)

(assert (=> b!201283 (=> (not res!168525) (not e!138057))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!201283 (= res!168525 (invariant!0 (currentBit!9397 thiss!1204) (currentByte!9402 thiss!1204) (size!4503 (buf!5004 thiss!1204))))))

(declare-fun b!201284 () Bool)

(declare-fun res!168526 () Bool)

(assert (=> b!201284 (=> (not res!168526) (not e!138057))))

(assert (=> b!201284 (= res!168526 (= i!590 nBits!348))))

(assert (= (and start!42642 res!168524) b!201282))

(assert (= (and b!201282 res!168528) b!201283))

(assert (= (and b!201283 res!168525) b!201284))

(assert (= (and b!201284 res!168526) b!201281))

(assert (= (and b!201281 res!168527) b!201279))

(assert (= (and b!201279 res!168523) b!201280))

(assert (= start!42642 b!201278))

(declare-fun m!311887 () Bool)

(assert (=> b!201281 m!311887))

(declare-fun m!311889 () Bool)

(assert (=> b!201278 m!311889))

(declare-fun m!311891 () Bool)

(assert (=> b!201282 m!311891))

(declare-fun m!311893 () Bool)

(assert (=> b!201279 m!311893))

(declare-fun m!311895 () Bool)

(assert (=> b!201279 m!311895))

(declare-fun m!311897 () Bool)

(assert (=> b!201279 m!311897))

(declare-fun m!311899 () Bool)

(assert (=> b!201279 m!311899))

(declare-fun m!311901 () Bool)

(assert (=> b!201279 m!311901))

(declare-fun m!311903 () Bool)

(assert (=> b!201279 m!311903))

(declare-fun m!311905 () Bool)

(assert (=> b!201279 m!311905))

(declare-fun m!311907 () Bool)

(assert (=> start!42642 m!311907))

(declare-fun m!311909 () Bool)

(assert (=> b!201283 m!311909))

(push 1)

(assert (not b!201278))

(assert (not b!201279))

(assert (not b!201283))

(assert (not b!201282))

(assert (not start!42642))

(assert (not b!201281))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!68935 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!68935 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4503 (buf!5004 thiss!1204))) ((_ sign_extend 32) (currentByte!9402 thiss!1204)) ((_ sign_extend 32) (currentBit!9397 thiss!1204)) lt!314045) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4503 (buf!5004 thiss!1204))) ((_ sign_extend 32) (currentByte!9402 thiss!1204)) ((_ sign_extend 32) (currentBit!9397 thiss!1204))) lt!314045))))

(declare-fun bs!17008 () Bool)

(assert (= bs!17008 d!68935))

(declare-fun m!311913 () Bool)

(assert (=> bs!17008 m!311913))

(assert (=> b!201282 d!68935))

(declare-fun d!68937 () Bool)

(assert (=> d!68937 (= (invariant!0 (currentBit!9397 thiss!1204) (currentByte!9402 thiss!1204) (size!4503 (buf!5004 thiss!1204))) (and (bvsge (currentBit!9397 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9397 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9402 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9402 thiss!1204) (size!4503 (buf!5004 thiss!1204))) (and (= (currentBit!9397 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9402 thiss!1204) (size!4503 (buf!5004 thiss!1204)))))))))

(assert (=> b!201283 d!68937))

(declare-fun d!68939 () Bool)

(assert (=> d!68939 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9397 thiss!1204) (currentByte!9402 thiss!1204) (size!4503 (buf!5004 thiss!1204))))))

(declare-fun bs!17011 () Bool)

(assert (= bs!17011 d!68939))

(assert (=> bs!17011 m!311909))

(assert (=> start!42642 d!68939))

(declare-fun d!68943 () Bool)

(assert (=> d!68943 (= (array_inv!4244 (buf!5004 thiss!1204)) (bvsge (size!4503 (buf!5004 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!201278 d!68943))

(declare-fun d!68945 () Bool)

(assert (=> d!68945 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!201279 d!68945))

(declare-fun d!68947 () Bool)

(assert (=> d!68947 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-fun lt!314056 () Unit!14308)

(declare-fun choose!11 (BitStream!8114) Unit!14308)

(assert (=> d!68947 (= lt!314056 (choose!11 thiss!1204))))

(assert (=> d!68947 (= (lemmaIsPrefixRefl!0 thiss!1204) lt!314056)))

(declare-fun bs!17013 () Bool)

(assert (= bs!17013 d!68947))

(assert (=> bs!17013 m!311899))

(declare-fun m!311917 () Bool)

(assert (=> bs!17013 m!311917))

(assert (=> b!201279 d!68947))

(declare-datatypes ((tuple2!17216 0))(
  ( (tuple2!17217 (_1!9259 (_ BitVec 64)) (_2!9259 BitStream!8114)) )
))
(declare-fun lt!314059 () tuple2!17216)

(declare-fun d!68949 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8114 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17216)

(assert (=> d!68949 (= lt!314059 (readNBitsLSBFirstsLoop!0 (_1!9258 lt!314043) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))))))

(assert (=> d!68949 (= (readNBitsLSBFirstsLoopPure!0 (_1!9258 lt!314043) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))) (tuple2!17213 (_2!9259 lt!314059) (_1!9259 lt!314059)))))

(declare-fun bs!17014 () Bool)

(assert (= bs!17014 d!68949))

(declare-fun m!311919 () Bool)

(assert (=> bs!17014 m!311919))

(assert (=> b!201279 d!68949))

(declare-fun b!201295 () Bool)

(declare-fun res!168535 () Bool)

(declare-fun e!138068 () Bool)

(assert (=> b!201295 (=> (not res!168535) (not e!138068))))

(declare-fun lt!314108 () tuple2!17214)

(assert (=> b!201295 (= res!168535 (isPrefixOf!0 (_2!9258 lt!314108) thiss!1204))))

(declare-fun d!68955 () Bool)

(assert (=> d!68955 e!138068))

(declare-fun res!168536 () Bool)

(assert (=> d!68955 (=> (not res!168536) (not e!138068))))

(assert (=> d!68955 (= res!168536 (isPrefixOf!0 (_1!9258 lt!314108) (_2!9258 lt!314108)))))

(declare-fun lt!314111 () BitStream!8114)

(assert (=> d!68955 (= lt!314108 (tuple2!17215 lt!314111 thiss!1204))))

(declare-fun lt!314124 () Unit!14308)

(declare-fun lt!314116 () Unit!14308)

(assert (=> d!68955 (= lt!314124 lt!314116)))

(assert (=> d!68955 (isPrefixOf!0 lt!314111 thiss!1204)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8114 BitStream!8114 BitStream!8114) Unit!14308)

(assert (=> d!68955 (= lt!314116 (lemmaIsPrefixTransitive!0 lt!314111 thiss!1204 thiss!1204))))

(declare-fun lt!314110 () Unit!14308)

(declare-fun lt!314113 () Unit!14308)

(assert (=> d!68955 (= lt!314110 lt!314113)))

(assert (=> d!68955 (isPrefixOf!0 lt!314111 thiss!1204)))

(assert (=> d!68955 (= lt!314113 (lemmaIsPrefixTransitive!0 lt!314111 thiss!1204 thiss!1204))))

(declare-fun lt!314114 () Unit!14308)

(declare-fun e!138067 () Unit!14308)

(assert (=> d!68955 (= lt!314114 e!138067)))

(declare-fun c!10012 () Bool)

(assert (=> d!68955 (= c!10012 (not (= (size!4503 (buf!5004 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!314125 () Unit!14308)

(declare-fun lt!314117 () Unit!14308)

(assert (=> d!68955 (= lt!314125 lt!314117)))

(assert (=> d!68955 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!68955 (= lt!314117 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun lt!314112 () Unit!14308)

(declare-fun lt!314123 () Unit!14308)

(assert (=> d!68955 (= lt!314112 lt!314123)))

(assert (=> d!68955 (= lt!314123 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun lt!314121 () Unit!14308)

(declare-fun lt!314109 () Unit!14308)

(assert (=> d!68955 (= lt!314121 lt!314109)))

(assert (=> d!68955 (isPrefixOf!0 lt!314111 lt!314111)))

(assert (=> d!68955 (= lt!314109 (lemmaIsPrefixRefl!0 lt!314111))))

(declare-fun lt!314115 () Unit!14308)

(declare-fun lt!314120 () Unit!14308)

(assert (=> d!68955 (= lt!314115 lt!314120)))

(assert (=> d!68955 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!68955 (= lt!314120 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!68955 (= lt!314111 (BitStream!8115 (buf!5004 thiss!1204) (currentByte!9402 thiss!1204) (currentBit!9397 thiss!1204)))))

(assert (=> d!68955 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!68955 (= (reader!0 thiss!1204 thiss!1204) lt!314108)))

(declare-fun lt!314106 () (_ BitVec 64))

(declare-fun b!201296 () Bool)

(declare-fun lt!314119 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!8114 (_ BitVec 64)) BitStream!8114)

(assert (=> b!201296 (= e!138068 (= (_1!9258 lt!314108) (withMovedBitIndex!0 (_2!9258 lt!314108) (bvsub lt!314119 lt!314106))))))

(assert (=> b!201296 (or (= (bvand lt!314119 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!314106 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!314119 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!314119 lt!314106) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!201296 (= lt!314106 (bitIndex!0 (size!4503 (buf!5004 thiss!1204)) (currentByte!9402 thiss!1204) (currentBit!9397 thiss!1204)))))

(assert (=> b!201296 (= lt!314119 (bitIndex!0 (size!4503 (buf!5004 thiss!1204)) (currentByte!9402 thiss!1204) (currentBit!9397 thiss!1204)))))

(declare-fun b!201297 () Bool)

(declare-fun Unit!14310 () Unit!14308)

(assert (=> b!201297 (= e!138067 Unit!14310)))

(declare-fun b!201298 () Bool)

(declare-fun lt!314122 () Unit!14308)

(assert (=> b!201298 (= e!138067 lt!314122)))

(declare-fun lt!314107 () (_ BitVec 64))

(assert (=> b!201298 (= lt!314107 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!314118 () (_ BitVec 64))

(assert (=> b!201298 (= lt!314118 (bitIndex!0 (size!4503 (buf!5004 thiss!1204)) (currentByte!9402 thiss!1204) (currentBit!9397 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!10224 array!10224 (_ BitVec 64) (_ BitVec 64)) Unit!14308)

(assert (=> b!201298 (= lt!314122 (arrayBitRangesEqSymmetric!0 (buf!5004 thiss!1204) (buf!5004 thiss!1204) lt!314107 lt!314118))))

(declare-fun arrayBitRangesEq!0 (array!10224 array!10224 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!201298 (arrayBitRangesEq!0 (buf!5004 thiss!1204) (buf!5004 thiss!1204) lt!314107 lt!314118)))

(declare-fun b!201299 () Bool)

(declare-fun res!168537 () Bool)

(assert (=> b!201299 (=> (not res!168537) (not e!138068))))

(assert (=> b!201299 (= res!168537 (isPrefixOf!0 (_1!9258 lt!314108) thiss!1204))))

(assert (= (and d!68955 c!10012) b!201298))

(assert (= (and d!68955 (not c!10012)) b!201297))

(assert (= (and d!68955 res!168536) b!201299))

(assert (= (and b!201299 res!168537) b!201295))

(assert (= (and b!201295 res!168535) b!201296))

(declare-fun m!311925 () Bool)

(assert (=> b!201295 m!311925))

(declare-fun m!311927 () Bool)

(assert (=> b!201299 m!311927))

(declare-fun m!311929 () Bool)

(assert (=> b!201296 m!311929))

(assert (=> b!201296 m!311887))

(assert (=> b!201296 m!311887))

(assert (=> b!201298 m!311887))

(declare-fun m!311931 () Bool)

(assert (=> b!201298 m!311931))

(declare-fun m!311933 () Bool)

(assert (=> b!201298 m!311933))

(assert (=> d!68955 m!311899))

(declare-fun m!311935 () Bool)

(assert (=> d!68955 m!311935))

(declare-fun m!311937 () Bool)

(assert (=> d!68955 m!311937))

(assert (=> d!68955 m!311935))

(declare-fun m!311939 () Bool)

(assert (=> d!68955 m!311939))

(declare-fun m!311941 () Bool)

(assert (=> d!68955 m!311941))

(assert (=> d!68955 m!311893))

(assert (=> d!68955 m!311899))

(assert (=> d!68955 m!311893))

(assert (=> d!68955 m!311899))

(declare-fun m!311943 () Bool)

(assert (=> d!68955 m!311943))

(assert (=> b!201279 d!68955))

(declare-fun d!68961 () Bool)

(declare-fun res!168545 () Bool)

(declare-fun e!138076 () Bool)

(assert (=> d!68961 (=> (not res!168545) (not e!138076))))

(assert (=> d!68961 (= res!168545 (= (size!4503 (buf!5004 thiss!1204)) (size!4503 (buf!5004 thiss!1204))))))

(assert (=> d!68961 (= (isPrefixOf!0 thiss!1204 thiss!1204) e!138076)))

(declare-fun b!201310 () Bool)

(declare-fun res!168546 () Bool)

(assert (=> b!201310 (=> (not res!168546) (not e!138076))))

(assert (=> b!201310 (= res!168546 (bvsle (bitIndex!0 (size!4503 (buf!5004 thiss!1204)) (currentByte!9402 thiss!1204) (currentBit!9397 thiss!1204)) (bitIndex!0 (size!4503 (buf!5004 thiss!1204)) (currentByte!9402 thiss!1204) (currentBit!9397 thiss!1204))))))

(declare-fun b!201311 () Bool)

(declare-fun e!138075 () Bool)

(assert (=> b!201311 (= e!138076 e!138075)))

(declare-fun res!168544 () Bool)

(assert (=> b!201311 (=> res!168544 e!138075)))

(assert (=> b!201311 (= res!168544 (= (size!4503 (buf!5004 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!201312 () Bool)

(assert (=> b!201312 (= e!138075 (arrayBitRangesEq!0 (buf!5004 thiss!1204) (buf!5004 thiss!1204) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4503 (buf!5004 thiss!1204)) (currentByte!9402 thiss!1204) (currentBit!9397 thiss!1204))))))

(assert (= (and d!68961 res!168545) b!201310))

(assert (= (and b!201310 res!168546) b!201311))

(assert (= (and b!201311 (not res!168544)) b!201312))

(assert (=> b!201310 m!311887))

(assert (=> b!201310 m!311887))

(assert (=> b!201312 m!311887))

(assert (=> b!201312 m!311887))

(declare-fun m!311945 () Bool)

(assert (=> b!201312 m!311945))

(assert (=> b!201279 d!68961))

(declare-fun d!68963 () Bool)

(assert (=> d!68963 (= (onesLSBLong!0 nBits!348) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!348))))))

(assert (=> b!201279 d!68963))

(declare-fun d!68965 () Bool)

(assert (=> d!68965 (validate_offset_bits!1 ((_ sign_extend 32) (size!4503 (buf!5004 thiss!1204))) ((_ sign_extend 32) (currentByte!9402 thiss!1204)) ((_ sign_extend 32) (currentBit!9397 thiss!1204)) lt!314045)))

(declare-fun lt!314168 () Unit!14308)

(declare-fun choose!9 (BitStream!8114 array!10224 (_ BitVec 64) BitStream!8114) Unit!14308)

(assert (=> d!68965 (= lt!314168 (choose!9 thiss!1204 (buf!5004 thiss!1204) lt!314045 (BitStream!8115 (buf!5004 thiss!1204) (currentByte!9402 thiss!1204) (currentBit!9397 thiss!1204))))))

(assert (=> d!68965 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5004 thiss!1204) lt!314045) lt!314168)))

(declare-fun bs!17018 () Bool)

(assert (= bs!17018 d!68965))

(assert (=> bs!17018 m!311891))

(declare-fun m!311947 () Bool)

(assert (=> bs!17018 m!311947))

(assert (=> b!201279 d!68965))

(declare-fun d!68967 () Bool)

(declare-fun e!138083 () Bool)

(assert (=> d!68967 e!138083))

(declare-fun res!168560 () Bool)

(assert (=> d!68967 (=> (not res!168560) (not e!138083))))

(declare-fun lt!314205 () (_ BitVec 64))

(declare-fun lt!314208 () (_ BitVec 64))

(declare-fun lt!314209 () (_ BitVec 64))

(assert (=> d!68967 (= res!168560 (= lt!314209 (bvsub lt!314208 lt!314205)))))

(assert (=> d!68967 (or (= (bvand lt!314208 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!314205 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!314208 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!314208 lt!314205) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68967 (= lt!314205 (remainingBits!0 ((_ sign_extend 32) (size!4503 (buf!5004 thiss!1204))) ((_ sign_extend 32) (currentByte!9402 thiss!1204)) ((_ sign_extend 32) (currentBit!9397 thiss!1204))))))

(declare-fun lt!314207 () (_ BitVec 64))

(declare-fun lt!314206 () (_ BitVec 64))

(assert (=> d!68967 (= lt!314208 (bvmul lt!314207 lt!314206))))

(assert (=> d!68967 (or (= lt!314207 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!314206 (bvsdiv (bvmul lt!314207 lt!314206) lt!314207)))))

(assert (=> d!68967 (= lt!314206 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68967 (= lt!314207 ((_ sign_extend 32) (size!4503 (buf!5004 thiss!1204))))))

(assert (=> d!68967 (= lt!314209 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9402 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9397 thiss!1204))))))

(assert (=> d!68967 (invariant!0 (currentBit!9397 thiss!1204) (currentByte!9402 thiss!1204) (size!4503 (buf!5004 thiss!1204)))))

(assert (=> d!68967 (= (bitIndex!0 (size!4503 (buf!5004 thiss!1204)) (currentByte!9402 thiss!1204) (currentBit!9397 thiss!1204)) lt!314209)))

(declare-fun b!201328 () Bool)

(declare-fun res!168561 () Bool)

(assert (=> b!201328 (=> (not res!168561) (not e!138083))))

(assert (=> b!201328 (= res!168561 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!314209))))

(declare-fun b!201329 () Bool)

(declare-fun lt!314210 () (_ BitVec 64))

(assert (=> b!201329 (= e!138083 (bvsle lt!314209 (bvmul lt!314210 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!201329 (or (= lt!314210 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!314210 #b0000000000000000000000000000000000000000000000000000000000001000) lt!314210)))))

(assert (=> b!201329 (= lt!314210 ((_ sign_extend 32) (size!4503 (buf!5004 thiss!1204))))))

(assert (= (and d!68967 res!168560) b!201328))

(assert (= (and b!201328 res!168561) b!201329))

(assert (=> d!68967 m!311913))

(assert (=> d!68967 m!311909))

(assert (=> b!201281 d!68967))

(push 1)

(assert (not d!68949))

(assert (not b!201310))

(assert (not b!201296))

(assert (not d!68939))

(assert (not d!68965))

(assert (not d!68967))

(assert (not d!68935))

(assert (not b!201298))

(assert (not b!201312))

(assert (not b!201295))

(assert (not b!201299))

(assert (not d!68955))

(assert (not d!68947))

(check-sat)

(pop 1)

(push 1)

(check-sat)

