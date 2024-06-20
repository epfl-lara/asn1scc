; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40344 () Bool)

(assert start!40344)

(declare-fun lt!285331 () (_ BitVec 64))

(declare-datatypes ((array!9801 0))(
  ( (array!9802 (arr!5253 (Array (_ BitVec 32) (_ BitVec 8))) (size!4323 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7754 0))(
  ( (BitStream!7755 (buf!4781 array!9801) (currentByte!9021 (_ BitVec 32)) (currentBit!9016 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!16032 0))(
  ( (tuple2!16033 (_1!8661 BitStream!7754) (_2!8661 BitStream!7754)) )
))
(declare-fun lt!285314 () tuple2!16032)

(declare-fun b!185214 () Bool)

(declare-fun e!128255 () Bool)

(declare-fun lt!285315 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!7754 (_ BitVec 64)) BitStream!7754)

(assert (=> b!185214 (= e!128255 (= (_1!8661 lt!285314) (withMovedBitIndex!0 (_2!8661 lt!285314) (bvsub lt!285315 lt!285331))))))

(declare-fun b!185215 () Bool)

(declare-fun res!154149 () Bool)

(declare-fun e!128254 () Bool)

(assert (=> b!185215 (=> res!154149 e!128254)))

(declare-datatypes ((Unit!13260 0))(
  ( (Unit!13261) )
))
(declare-datatypes ((tuple2!16034 0))(
  ( (tuple2!16035 (_1!8662 Unit!13260) (_2!8662 BitStream!7754)) )
))
(declare-fun lt!285322 () tuple2!16034)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!185215 (= res!154149 (not (invariant!0 (currentBit!9016 (_2!8662 lt!285322)) (currentByte!9021 (_2!8662 lt!285322)) (size!4323 (buf!4781 (_2!8662 lt!285322))))))))

(declare-fun b!185216 () Bool)

(declare-fun e!128259 () Bool)

(declare-fun e!128250 () Bool)

(assert (=> b!185216 (= e!128259 e!128250)))

(declare-fun res!154141 () Bool)

(assert (=> b!185216 (=> (not res!154141) (not e!128250))))

(declare-fun lt!285312 () (_ BitVec 64))

(declare-fun lt!285334 () (_ BitVec 64))

(assert (=> b!185216 (= res!154141 (= lt!285312 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!285334)))))

(declare-fun lt!285320 () tuple2!16034)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!185216 (= lt!285312 (bitIndex!0 (size!4323 (buf!4781 (_2!8662 lt!285320))) (currentByte!9021 (_2!8662 lt!285320)) (currentBit!9016 (_2!8662 lt!285320))))))

(declare-fun thiss!1204 () BitStream!7754)

(assert (=> b!185216 (= lt!285334 (bitIndex!0 (size!4323 (buf!4781 thiss!1204)) (currentByte!9021 thiss!1204) (currentBit!9016 thiss!1204)))))

(declare-fun b!185217 () Bool)

(declare-fun e!128248 () Bool)

(assert (=> b!185217 (= e!128250 e!128248)))

(declare-fun res!154150 () Bool)

(assert (=> b!185217 (=> (not res!154150) (not e!128248))))

(declare-datatypes ((tuple2!16036 0))(
  ( (tuple2!16037 (_1!8663 BitStream!7754) (_2!8663 Bool)) )
))
(declare-fun lt!285332 () tuple2!16036)

(declare-fun lt!285313 () Bool)

(assert (=> b!185217 (= res!154150 (and (= (_2!8663 lt!285332) lt!285313) (= (_1!8663 lt!285332) (_2!8662 lt!285320))))))

(declare-fun readBitPure!0 (BitStream!7754) tuple2!16036)

(declare-fun readerFrom!0 (BitStream!7754 (_ BitVec 32) (_ BitVec 32)) BitStream!7754)

(assert (=> b!185217 (= lt!285332 (readBitPure!0 (readerFrom!0 (_2!8662 lt!285320) (currentBit!9016 thiss!1204) (currentByte!9021 thiss!1204))))))

(declare-fun b!185218 () Bool)

(assert (=> b!185218 (= e!128248 (= (bitIndex!0 (size!4323 (buf!4781 (_1!8663 lt!285332))) (currentByte!9021 (_1!8663 lt!285332)) (currentBit!9016 (_1!8663 lt!285332))) lt!285312))))

(declare-fun b!185219 () Bool)

(declare-fun res!154148 () Bool)

(assert (=> b!185219 (=> res!154148 e!128254)))

(declare-fun isPrefixOf!0 (BitStream!7754 BitStream!7754) Bool)

(assert (=> b!185219 (= res!154148 (not (isPrefixOf!0 (_2!8662 lt!285320) (_2!8662 lt!285322))))))

(declare-fun b!185220 () Bool)

(declare-fun e!128253 () Bool)

(declare-fun e!128256 () Bool)

(assert (=> b!185220 (= e!128253 (not e!128256))))

(declare-fun res!154153 () Bool)

(assert (=> b!185220 (=> res!154153 e!128256)))

(declare-fun lt!285321 () (_ BitVec 64))

(assert (=> b!185220 (= res!154153 (not (= lt!285321 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!285315))))))

(assert (=> b!185220 (= lt!285321 (bitIndex!0 (size!4323 (buf!4781 (_2!8662 lt!285320))) (currentByte!9021 (_2!8662 lt!285320)) (currentBit!9016 (_2!8662 lt!285320))))))

(assert (=> b!185220 (= lt!285315 (bitIndex!0 (size!4323 (buf!4781 thiss!1204)) (currentByte!9021 thiss!1204) (currentBit!9016 thiss!1204)))))

(assert (=> b!185220 e!128259))

(declare-fun res!154155 () Bool)

(assert (=> b!185220 (=> (not res!154155) (not e!128259))))

(assert (=> b!185220 (= res!154155 (= (size!4323 (buf!4781 thiss!1204)) (size!4323 (buf!4781 (_2!8662 lt!285320)))))))

(declare-fun appendBit!0 (BitStream!7754 Bool) tuple2!16034)

(assert (=> b!185220 (= lt!285320 (appendBit!0 thiss!1204 lt!285313))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!285325 () (_ BitVec 64))

(assert (=> b!185220 (= lt!285313 (not (= (bvand v!189 lt!285325) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!185220 (= lt!285325 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!185221 () Bool)

(declare-fun e!128258 () Bool)

(assert (=> b!185221 (= e!128254 e!128258)))

(declare-fun res!154140 () Bool)

(assert (=> b!185221 (=> res!154140 e!128258)))

(declare-fun lt!285326 () tuple2!16032)

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!285318 () (_ BitVec 64))

(declare-datatypes ((tuple2!16038 0))(
  ( (tuple2!16039 (_1!8664 BitStream!7754) (_2!8664 (_ BitVec 64))) )
))
(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7754 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16038)

(assert (=> b!185221 (= res!154140 (not (= (_1!8664 (readNBitsLSBFirstsLoopPure!0 (_1!8661 lt!285326) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!285318)) (_2!8661 lt!285326))))))

(declare-fun lt!285329 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!185221 (validate_offset_bits!1 ((_ sign_extend 32) (size!4323 (buf!4781 (_2!8662 lt!285322)))) ((_ sign_extend 32) (currentByte!9021 (_2!8662 lt!285320))) ((_ sign_extend 32) (currentBit!9016 (_2!8662 lt!285320))) lt!285329)))

(declare-fun lt!285330 () Unit!13260)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7754 array!9801 (_ BitVec 64)) Unit!13260)

(assert (=> b!185221 (= lt!285330 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8662 lt!285320) (buf!4781 (_2!8662 lt!285322)) lt!285329))))

(assert (=> b!185221 (= lt!285329 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!285309 () tuple2!16036)

(declare-fun lt!285323 () (_ BitVec 64))

(assert (=> b!185221 (= lt!285318 (bvor lt!285323 (ite (_2!8663 lt!285309) lt!285325 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!285335 () tuple2!16038)

(assert (=> b!185221 (= lt!285335 (readNBitsLSBFirstsLoopPure!0 (_1!8661 lt!285314) nBits!348 i!590 lt!285323))))

(declare-fun lt!285311 () (_ BitVec 64))

(assert (=> b!185221 (validate_offset_bits!1 ((_ sign_extend 32) (size!4323 (buf!4781 (_2!8662 lt!285322)))) ((_ sign_extend 32) (currentByte!9021 thiss!1204)) ((_ sign_extend 32) (currentBit!9016 thiss!1204)) lt!285311)))

(declare-fun lt!285333 () Unit!13260)

(assert (=> b!185221 (= lt!285333 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4781 (_2!8662 lt!285322)) lt!285311))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!185221 (= lt!285323 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!185221 (= (_2!8663 lt!285309) lt!285313)))

(assert (=> b!185221 (= lt!285309 (readBitPure!0 (_1!8661 lt!285314)))))

(declare-fun reader!0 (BitStream!7754 BitStream!7754) tuple2!16032)

(assert (=> b!185221 (= lt!285326 (reader!0 (_2!8662 lt!285320) (_2!8662 lt!285322)))))

(assert (=> b!185221 (= lt!285314 (reader!0 thiss!1204 (_2!8662 lt!285322)))))

(declare-fun e!128257 () Bool)

(assert (=> b!185221 e!128257))

(declare-fun res!154144 () Bool)

(assert (=> b!185221 (=> (not res!154144) (not e!128257))))

(declare-fun lt!285316 () tuple2!16036)

(declare-fun lt!285324 () tuple2!16036)

(assert (=> b!185221 (= res!154144 (= (bitIndex!0 (size!4323 (buf!4781 (_1!8663 lt!285316))) (currentByte!9021 (_1!8663 lt!285316)) (currentBit!9016 (_1!8663 lt!285316))) (bitIndex!0 (size!4323 (buf!4781 (_1!8663 lt!285324))) (currentByte!9021 (_1!8663 lt!285324)) (currentBit!9016 (_1!8663 lt!285324)))))))

(declare-fun lt!285319 () Unit!13260)

(declare-fun lt!285317 () BitStream!7754)

(declare-fun readBitPrefixLemma!0 (BitStream!7754 BitStream!7754) Unit!13260)

(assert (=> b!185221 (= lt!285319 (readBitPrefixLemma!0 lt!285317 (_2!8662 lt!285322)))))

(assert (=> b!185221 (= lt!285324 (readBitPure!0 (BitStream!7755 (buf!4781 (_2!8662 lt!285322)) (currentByte!9021 thiss!1204) (currentBit!9016 thiss!1204))))))

(assert (=> b!185221 (= lt!285316 (readBitPure!0 lt!285317))))

(declare-fun e!128251 () Bool)

(assert (=> b!185221 e!128251))

(declare-fun res!154143 () Bool)

(assert (=> b!185221 (=> (not res!154143) (not e!128251))))

(assert (=> b!185221 (= res!154143 (invariant!0 (currentBit!9016 thiss!1204) (currentByte!9021 thiss!1204) (size!4323 (buf!4781 (_2!8662 lt!285320)))))))

(assert (=> b!185221 (= lt!285317 (BitStream!7755 (buf!4781 (_2!8662 lt!285320)) (currentByte!9021 thiss!1204) (currentBit!9016 thiss!1204)))))

(declare-fun b!185222 () Bool)

(declare-fun res!154142 () Bool)

(assert (=> b!185222 (=> (not res!154142) (not e!128253))))

(assert (=> b!185222 (= res!154142 (not (= i!590 nBits!348)))))

(declare-fun res!154154 () Bool)

(declare-fun e!128260 () Bool)

(assert (=> start!40344 (=> (not res!154154) (not e!128260))))

(assert (=> start!40344 (= res!154154 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40344 e!128260))

(assert (=> start!40344 true))

(declare-fun e!128252 () Bool)

(declare-fun inv!12 (BitStream!7754) Bool)

(assert (=> start!40344 (and (inv!12 thiss!1204) e!128252)))

(declare-fun b!185223 () Bool)

(declare-fun res!154151 () Bool)

(assert (=> b!185223 (=> res!154151 e!128254)))

(assert (=> b!185223 (= res!154151 (or (not (= (size!4323 (buf!4781 (_2!8662 lt!285322))) (size!4323 (buf!4781 thiss!1204)))) (not (= lt!285331 (bvsub (bvadd lt!285315 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!185224 () Bool)

(assert (=> b!185224 (= e!128256 e!128254)))

(declare-fun res!154138 () Bool)

(assert (=> b!185224 (=> res!154138 e!128254)))

(assert (=> b!185224 (= res!154138 (not (= lt!285331 (bvsub (bvsub (bvadd lt!285321 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!185224 (= lt!285331 (bitIndex!0 (size!4323 (buf!4781 (_2!8662 lt!285322))) (currentByte!9021 (_2!8662 lt!285322)) (currentBit!9016 (_2!8662 lt!285322))))))

(assert (=> b!185224 (isPrefixOf!0 thiss!1204 (_2!8662 lt!285322))))

(declare-fun lt!285327 () Unit!13260)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7754 BitStream!7754 BitStream!7754) Unit!13260)

(assert (=> b!185224 (= lt!285327 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8662 lt!285320) (_2!8662 lt!285322)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7754 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16034)

(assert (=> b!185224 (= lt!285322 (appendBitsLSBFirstLoopTR!0 (_2!8662 lt!285320) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!185225 () Bool)

(declare-fun res!154139 () Bool)

(assert (=> b!185225 (=> (not res!154139) (not e!128250))))

(assert (=> b!185225 (= res!154139 (isPrefixOf!0 thiss!1204 (_2!8662 lt!285320)))))

(declare-fun b!185226 () Bool)

(assert (=> b!185226 (= e!128257 (= (_2!8663 lt!285316) (_2!8663 lt!285324)))))

(declare-fun b!185227 () Bool)

(declare-fun res!154152 () Bool)

(assert (=> b!185227 (=> (not res!154152) (not e!128253))))

(assert (=> b!185227 (= res!154152 (invariant!0 (currentBit!9016 thiss!1204) (currentByte!9021 thiss!1204) (size!4323 (buf!4781 thiss!1204))))))

(declare-fun b!185228 () Bool)

(assert (=> b!185228 (= e!128258 (invariant!0 (currentBit!9016 (_2!8662 lt!285320)) (currentByte!9021 (_2!8662 lt!285320)) (size!4323 (buf!4781 (_2!8662 lt!285320)))))))

(assert (=> b!185228 e!128255))

(declare-fun res!154147 () Bool)

(assert (=> b!185228 (=> (not res!154147) (not e!128255))))

(declare-fun lt!285328 () tuple2!16038)

(assert (=> b!185228 (= res!154147 (and (= (_2!8664 lt!285335) (_2!8664 lt!285328)) (= (_1!8664 lt!285335) (_1!8664 lt!285328))))))

(declare-fun lt!285310 () Unit!13260)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7754 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13260)

(assert (=> b!185228 (= lt!285310 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8661 lt!285314) nBits!348 i!590 lt!285323))))

(assert (=> b!185228 (= lt!285328 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8661 lt!285314) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!285318))))

(declare-fun b!185229 () Bool)

(declare-fun array_inv!4064 (array!9801) Bool)

(assert (=> b!185229 (= e!128252 (array_inv!4064 (buf!4781 thiss!1204)))))

(declare-fun b!185230 () Bool)

(declare-fun res!154146 () Bool)

(assert (=> b!185230 (=> res!154146 e!128254)))

(assert (=> b!185230 (= res!154146 (not (isPrefixOf!0 thiss!1204 (_2!8662 lt!285320))))))

(declare-fun b!185231 () Bool)

(assert (=> b!185231 (= e!128251 (invariant!0 (currentBit!9016 thiss!1204) (currentByte!9021 thiss!1204) (size!4323 (buf!4781 (_2!8662 lt!285322)))))))

(declare-fun b!185232 () Bool)

(assert (=> b!185232 (= e!128260 e!128253)))

(declare-fun res!154145 () Bool)

(assert (=> b!185232 (=> (not res!154145) (not e!128253))))

(assert (=> b!185232 (= res!154145 (validate_offset_bits!1 ((_ sign_extend 32) (size!4323 (buf!4781 thiss!1204))) ((_ sign_extend 32) (currentByte!9021 thiss!1204)) ((_ sign_extend 32) (currentBit!9016 thiss!1204)) lt!285311))))

(assert (=> b!185232 (= lt!285311 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(assert (= (and start!40344 res!154154) b!185232))

(assert (= (and b!185232 res!154145) b!185227))

(assert (= (and b!185227 res!154152) b!185222))

(assert (= (and b!185222 res!154142) b!185220))

(assert (= (and b!185220 res!154155) b!185216))

(assert (= (and b!185216 res!154141) b!185225))

(assert (= (and b!185225 res!154139) b!185217))

(assert (= (and b!185217 res!154150) b!185218))

(assert (= (and b!185220 (not res!154153)) b!185224))

(assert (= (and b!185224 (not res!154138)) b!185215))

(assert (= (and b!185215 (not res!154149)) b!185223))

(assert (= (and b!185223 (not res!154151)) b!185219))

(assert (= (and b!185219 (not res!154148)) b!185230))

(assert (= (and b!185230 (not res!154146)) b!185221))

(assert (= (and b!185221 res!154143) b!185231))

(assert (= (and b!185221 res!154144) b!185226))

(assert (= (and b!185221 (not res!154140)) b!185228))

(assert (= (and b!185228 res!154147) b!185214))

(assert (= start!40344 b!185229))

(declare-fun m!287821 () Bool)

(assert (=> b!185221 m!287821))

(declare-fun m!287823 () Bool)

(assert (=> b!185221 m!287823))

(declare-fun m!287825 () Bool)

(assert (=> b!185221 m!287825))

(declare-fun m!287827 () Bool)

(assert (=> b!185221 m!287827))

(declare-fun m!287829 () Bool)

(assert (=> b!185221 m!287829))

(declare-fun m!287831 () Bool)

(assert (=> b!185221 m!287831))

(declare-fun m!287833 () Bool)

(assert (=> b!185221 m!287833))

(declare-fun m!287835 () Bool)

(assert (=> b!185221 m!287835))

(declare-fun m!287837 () Bool)

(assert (=> b!185221 m!287837))

(declare-fun m!287839 () Bool)

(assert (=> b!185221 m!287839))

(declare-fun m!287841 () Bool)

(assert (=> b!185221 m!287841))

(declare-fun m!287843 () Bool)

(assert (=> b!185221 m!287843))

(declare-fun m!287845 () Bool)

(assert (=> b!185221 m!287845))

(declare-fun m!287847 () Bool)

(assert (=> b!185221 m!287847))

(declare-fun m!287849 () Bool)

(assert (=> b!185221 m!287849))

(declare-fun m!287851 () Bool)

(assert (=> b!185221 m!287851))

(declare-fun m!287853 () Bool)

(assert (=> b!185225 m!287853))

(assert (=> b!185230 m!287853))

(declare-fun m!287855 () Bool)

(assert (=> b!185219 m!287855))

(declare-fun m!287857 () Bool)

(assert (=> b!185224 m!287857))

(declare-fun m!287859 () Bool)

(assert (=> b!185224 m!287859))

(declare-fun m!287861 () Bool)

(assert (=> b!185224 m!287861))

(declare-fun m!287863 () Bool)

(assert (=> b!185224 m!287863))

(declare-fun m!287865 () Bool)

(assert (=> b!185216 m!287865))

(declare-fun m!287867 () Bool)

(assert (=> b!185216 m!287867))

(declare-fun m!287869 () Bool)

(assert (=> b!185232 m!287869))

(declare-fun m!287871 () Bool)

(assert (=> b!185229 m!287871))

(declare-fun m!287873 () Bool)

(assert (=> b!185215 m!287873))

(declare-fun m!287875 () Bool)

(assert (=> b!185227 m!287875))

(declare-fun m!287877 () Bool)

(assert (=> b!185228 m!287877))

(declare-fun m!287879 () Bool)

(assert (=> b!185228 m!287879))

(declare-fun m!287881 () Bool)

(assert (=> b!185228 m!287881))

(assert (=> b!185228 m!287881))

(declare-fun m!287883 () Bool)

(assert (=> b!185228 m!287883))

(declare-fun m!287885 () Bool)

(assert (=> b!185218 m!287885))

(declare-fun m!287887 () Bool)

(assert (=> start!40344 m!287887))

(declare-fun m!287889 () Bool)

(assert (=> b!185217 m!287889))

(assert (=> b!185217 m!287889))

(declare-fun m!287891 () Bool)

(assert (=> b!185217 m!287891))

(declare-fun m!287893 () Bool)

(assert (=> b!185231 m!287893))

(declare-fun m!287895 () Bool)

(assert (=> b!185214 m!287895))

(assert (=> b!185220 m!287865))

(assert (=> b!185220 m!287867))

(declare-fun m!287897 () Bool)

(assert (=> b!185220 m!287897))

(push 1)

(assert (not b!185217))

(assert (not b!185215))

(assert (not b!185216))

(assert (not b!185231))

(assert (not b!185228))

(assert (not b!185221))

(assert (not b!185230))

(assert (not b!185232))

(assert (not b!185219))

(assert (not b!185227))

(assert (not b!185224))

(assert (not b!185214))

(assert (not b!185220))

(assert (not start!40344))

(assert (not b!185218))

(assert (not b!185229))

(assert (not b!185225))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!63889 () Bool)

(declare-fun res!154184 () Bool)

(declare-fun e!128280 () Bool)

(assert (=> d!63889 (=> (not res!154184) (not e!128280))))

(assert (=> d!63889 (= res!154184 (= (size!4323 (buf!4781 thiss!1204)) (size!4323 (buf!4781 (_2!8662 lt!285320)))))))

(assert (=> d!63889 (= (isPrefixOf!0 thiss!1204 (_2!8662 lt!285320)) e!128280)))

(declare-fun b!185260 () Bool)

(declare-fun res!154185 () Bool)

(assert (=> b!185260 (=> (not res!154185) (not e!128280))))

(assert (=> b!185260 (= res!154185 (bvsle (bitIndex!0 (size!4323 (buf!4781 thiss!1204)) (currentByte!9021 thiss!1204) (currentBit!9016 thiss!1204)) (bitIndex!0 (size!4323 (buf!4781 (_2!8662 lt!285320))) (currentByte!9021 (_2!8662 lt!285320)) (currentBit!9016 (_2!8662 lt!285320)))))))

(declare-fun b!185261 () Bool)

(declare-fun e!128279 () Bool)

(assert (=> b!185261 (= e!128280 e!128279)))

(declare-fun res!154183 () Bool)

(assert (=> b!185261 (=> res!154183 e!128279)))

(assert (=> b!185261 (= res!154183 (= (size!4323 (buf!4781 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!185262 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9801 array!9801 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!185262 (= e!128279 (arrayBitRangesEq!0 (buf!4781 thiss!1204) (buf!4781 (_2!8662 lt!285320)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4323 (buf!4781 thiss!1204)) (currentByte!9021 thiss!1204) (currentBit!9016 thiss!1204))))))

(assert (= (and d!63889 res!154184) b!185260))

(assert (= (and b!185260 res!154185) b!185261))

(assert (= (and b!185261 (not res!154183)) b!185262))

(assert (=> b!185260 m!287867))

(assert (=> b!185260 m!287865))

(assert (=> b!185262 m!287867))

(assert (=> b!185262 m!287867))

(declare-fun m!287931 () Bool)

(assert (=> b!185262 m!287931))

(assert (=> b!185225 d!63889))

(declare-fun d!63891 () Bool)

(assert (=> d!63891 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9016 thiss!1204) (currentByte!9021 thiss!1204) (size!4323 (buf!4781 thiss!1204))))))

(declare-fun bs!15908 () Bool)

(assert (= bs!15908 d!63891))

(assert (=> bs!15908 m!287875))

(assert (=> start!40344 d!63891))

(declare-fun d!63893 () Bool)

(assert (=> d!63893 (= (invariant!0 (currentBit!9016 (_2!8662 lt!285322)) (currentByte!9021 (_2!8662 lt!285322)) (size!4323 (buf!4781 (_2!8662 lt!285322)))) (and (bvsge (currentBit!9016 (_2!8662 lt!285322)) #b00000000000000000000000000000000) (bvslt (currentBit!9016 (_2!8662 lt!285322)) #b00000000000000000000000000001000) (bvsge (currentByte!9021 (_2!8662 lt!285322)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9021 (_2!8662 lt!285322)) (size!4323 (buf!4781 (_2!8662 lt!285322)))) (and (= (currentBit!9016 (_2!8662 lt!285322)) #b00000000000000000000000000000000) (= (currentByte!9021 (_2!8662 lt!285322)) (size!4323 (buf!4781 (_2!8662 lt!285322))))))))))

(assert (=> b!185215 d!63893))

(declare-fun d!63895 () Bool)

(declare-fun e!128283 () Bool)

(assert (=> d!63895 e!128283))

(declare-fun res!154190 () Bool)

(assert (=> d!63895 (=> (not res!154190) (not e!128283))))

(declare-fun lt!285405 () (_ BitVec 64))

(declare-fun lt!285407 () (_ BitVec 64))

(declare-fun lt!285408 () (_ BitVec 64))

(assert (=> d!63895 (= res!154190 (= lt!285408 (bvsub lt!285405 lt!285407)))))

(assert (=> d!63895 (or (= (bvand lt!285405 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!285407 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!285405 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!285405 lt!285407) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!63895 (= lt!285407 (remainingBits!0 ((_ sign_extend 32) (size!4323 (buf!4781 (_2!8662 lt!285320)))) ((_ sign_extend 32) (currentByte!9021 (_2!8662 lt!285320))) ((_ sign_extend 32) (currentBit!9016 (_2!8662 lt!285320)))))))

(declare-fun lt!285409 () (_ BitVec 64))

(declare-fun lt!285404 () (_ BitVec 64))

(assert (=> d!63895 (= lt!285405 (bvmul lt!285409 lt!285404))))

(assert (=> d!63895 (or (= lt!285409 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!285404 (bvsdiv (bvmul lt!285409 lt!285404) lt!285409)))))

(assert (=> d!63895 (= lt!285404 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63895 (= lt!285409 ((_ sign_extend 32) (size!4323 (buf!4781 (_2!8662 lt!285320)))))))

(assert (=> d!63895 (= lt!285408 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9021 (_2!8662 lt!285320))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9016 (_2!8662 lt!285320)))))))

(assert (=> d!63895 (invariant!0 (currentBit!9016 (_2!8662 lt!285320)) (currentByte!9021 (_2!8662 lt!285320)) (size!4323 (buf!4781 (_2!8662 lt!285320))))))

(assert (=> d!63895 (= (bitIndex!0 (size!4323 (buf!4781 (_2!8662 lt!285320))) (currentByte!9021 (_2!8662 lt!285320)) (currentBit!9016 (_2!8662 lt!285320))) lt!285408)))

(declare-fun b!185267 () Bool)

(declare-fun res!154191 () Bool)

(assert (=> b!185267 (=> (not res!154191) (not e!128283))))

(assert (=> b!185267 (= res!154191 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!285408))))

(declare-fun b!185268 () Bool)

(declare-fun lt!285406 () (_ BitVec 64))

(assert (=> b!185268 (= e!128283 (bvsle lt!285408 (bvmul lt!285406 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!185268 (or (= lt!285406 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!285406 #b0000000000000000000000000000000000000000000000000000000000001000) lt!285406)))))

(assert (=> b!185268 (= lt!285406 ((_ sign_extend 32) (size!4323 (buf!4781 (_2!8662 lt!285320)))))))

(assert (= (and d!63895 res!154190) b!185267))

(assert (= (and b!185267 res!154191) b!185268))

(declare-fun m!287933 () Bool)

(assert (=> d!63895 m!287933))

(assert (=> d!63895 m!287877))

(assert (=> b!185216 d!63895))

(declare-fun d!63897 () Bool)

(declare-fun e!128284 () Bool)

(assert (=> d!63897 e!128284))

(declare-fun res!154192 () Bool)

(assert (=> d!63897 (=> (not res!154192) (not e!128284))))

(declare-fun lt!285414 () (_ BitVec 64))

(declare-fun lt!285411 () (_ BitVec 64))

(declare-fun lt!285413 () (_ BitVec 64))

(assert (=> d!63897 (= res!154192 (= lt!285414 (bvsub lt!285411 lt!285413)))))

(assert (=> d!63897 (or (= (bvand lt!285411 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!285413 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!285411 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!285411 lt!285413) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63897 (= lt!285413 (remainingBits!0 ((_ sign_extend 32) (size!4323 (buf!4781 thiss!1204))) ((_ sign_extend 32) (currentByte!9021 thiss!1204)) ((_ sign_extend 32) (currentBit!9016 thiss!1204))))))

(declare-fun lt!285415 () (_ BitVec 64))

(declare-fun lt!285410 () (_ BitVec 64))

(assert (=> d!63897 (= lt!285411 (bvmul lt!285415 lt!285410))))

(assert (=> d!63897 (or (= lt!285415 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!285410 (bvsdiv (bvmul lt!285415 lt!285410) lt!285415)))))

(assert (=> d!63897 (= lt!285410 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63897 (= lt!285415 ((_ sign_extend 32) (size!4323 (buf!4781 thiss!1204))))))

(assert (=> d!63897 (= lt!285414 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9021 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9016 thiss!1204))))))

(assert (=> d!63897 (invariant!0 (currentBit!9016 thiss!1204) (currentByte!9021 thiss!1204) (size!4323 (buf!4781 thiss!1204)))))

(assert (=> d!63897 (= (bitIndex!0 (size!4323 (buf!4781 thiss!1204)) (currentByte!9021 thiss!1204) (currentBit!9016 thiss!1204)) lt!285414)))

(declare-fun b!185269 () Bool)

(declare-fun res!154193 () Bool)

(assert (=> b!185269 (=> (not res!154193) (not e!128284))))

(assert (=> b!185269 (= res!154193 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!285414))))

(declare-fun b!185270 () Bool)

(declare-fun lt!285412 () (_ BitVec 64))

(assert (=> b!185270 (= e!128284 (bvsle lt!285414 (bvmul lt!285412 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!185270 (or (= lt!285412 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!285412 #b0000000000000000000000000000000000000000000000000000000000001000) lt!285412)))))

(assert (=> b!185270 (= lt!285412 ((_ sign_extend 32) (size!4323 (buf!4781 thiss!1204))))))

(assert (= (and d!63897 res!154192) b!185269))

(assert (= (and b!185269 res!154193) b!185270))

(declare-fun m!287935 () Bool)

(assert (=> d!63897 m!287935))

(assert (=> d!63897 m!287875))

(assert (=> b!185216 d!63897))

(declare-fun d!63899 () Bool)

(assert (=> d!63899 (= (invariant!0 (currentBit!9016 thiss!1204) (currentByte!9021 thiss!1204) (size!4323 (buf!4781 thiss!1204))) (and (bvsge (currentBit!9016 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9016 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9021 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9021 thiss!1204) (size!4323 (buf!4781 thiss!1204))) (and (= (currentBit!9016 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9021 thiss!1204) (size!4323 (buf!4781 thiss!1204)))))))))

(assert (=> b!185227 d!63899))

(declare-fun d!63901 () Bool)

(declare-datatypes ((tuple2!16044 0))(
  ( (tuple2!16045 (_1!8667 Bool) (_2!8667 BitStream!7754)) )
))
(declare-fun lt!285418 () tuple2!16044)

(declare-fun readBit!0 (BitStream!7754) tuple2!16044)

(assert (=> d!63901 (= lt!285418 (readBit!0 (readerFrom!0 (_2!8662 lt!285320) (currentBit!9016 thiss!1204) (currentByte!9021 thiss!1204))))))

(assert (=> d!63901 (= (readBitPure!0 (readerFrom!0 (_2!8662 lt!285320) (currentBit!9016 thiss!1204) (currentByte!9021 thiss!1204))) (tuple2!16037 (_2!8667 lt!285418) (_1!8667 lt!285418)))))

(declare-fun bs!15909 () Bool)

(assert (= bs!15909 d!63901))

(assert (=> bs!15909 m!287889))

(declare-fun m!287937 () Bool)

(assert (=> bs!15909 m!287937))

(assert (=> b!185217 d!63901))

(declare-fun d!63903 () Bool)

(declare-fun e!128287 () Bool)

(assert (=> d!63903 e!128287))

(declare-fun res!154197 () Bool)

(assert (=> d!63903 (=> (not res!154197) (not e!128287))))

(assert (=> d!63903 (= res!154197 (invariant!0 (currentBit!9016 (_2!8662 lt!285320)) (currentByte!9021 (_2!8662 lt!285320)) (size!4323 (buf!4781 (_2!8662 lt!285320)))))))

(assert (=> d!63903 (= (readerFrom!0 (_2!8662 lt!285320) (currentBit!9016 thiss!1204) (currentByte!9021 thiss!1204)) (BitStream!7755 (buf!4781 (_2!8662 lt!285320)) (currentByte!9021 thiss!1204) (currentBit!9016 thiss!1204)))))

(declare-fun b!185273 () Bool)

(assert (=> b!185273 (= e!128287 (invariant!0 (currentBit!9016 thiss!1204) (currentByte!9021 thiss!1204) (size!4323 (buf!4781 (_2!8662 lt!285320)))))))

(assert (= (and d!63903 res!154197) b!185273))

(assert (=> d!63903 m!287877))

(assert (=> b!185273 m!287845))

(assert (=> b!185217 d!63903))

(declare-fun d!63905 () Bool)

(assert (=> d!63905 (= (invariant!0 (currentBit!9016 (_2!8662 lt!285320)) (currentByte!9021 (_2!8662 lt!285320)) (size!4323 (buf!4781 (_2!8662 lt!285320)))) (and (bvsge (currentBit!9016 (_2!8662 lt!285320)) #b00000000000000000000000000000000) (bvslt (currentBit!9016 (_2!8662 lt!285320)) #b00000000000000000000000000001000) (bvsge (currentByte!9021 (_2!8662 lt!285320)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9021 (_2!8662 lt!285320)) (size!4323 (buf!4781 (_2!8662 lt!285320)))) (and (= (currentBit!9016 (_2!8662 lt!285320)) #b00000000000000000000000000000000) (= (currentByte!9021 (_2!8662 lt!285320)) (size!4323 (buf!4781 (_2!8662 lt!285320))))))))))

(assert (=> b!185228 d!63905))

(declare-fun d!63907 () Bool)

(declare-fun lt!285431 () tuple2!16038)

(declare-fun lt!285436 () tuple2!16038)

(assert (=> d!63907 (and (= (_2!8664 lt!285431) (_2!8664 lt!285436)) (= (_1!8664 lt!285431) (_1!8664 lt!285436)))))

(declare-fun lt!285433 () BitStream!7754)

(declare-fun lt!285434 () Bool)

(declare-fun lt!285432 () Unit!13260)

(declare-fun lt!285435 () (_ BitVec 64))

(declare-fun choose!56 (BitStream!7754 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!16038 tuple2!16038 BitStream!7754 (_ BitVec 64) Bool BitStream!7754 (_ BitVec 64) tuple2!16038 tuple2!16038 BitStream!7754 (_ BitVec 64)) Unit!13260)

(assert (=> d!63907 (= lt!285432 (choose!56 (_1!8661 lt!285314) nBits!348 i!590 lt!285323 lt!285431 (tuple2!16039 (_1!8664 lt!285431) (_2!8664 lt!285431)) (_1!8664 lt!285431) (_2!8664 lt!285431) lt!285434 lt!285433 lt!285435 lt!285436 (tuple2!16039 (_1!8664 lt!285436) (_2!8664 lt!285436)) (_1!8664 lt!285436) (_2!8664 lt!285436)))))

(assert (=> d!63907 (= lt!285436 (readNBitsLSBFirstsLoopPure!0 lt!285433 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!285435))))

(assert (=> d!63907 (= lt!285435 (bvor lt!285323 (ite lt!285434 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63907 (= lt!285433 (withMovedBitIndex!0 (_1!8661 lt!285314) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!63907 (= lt!285434 (_2!8663 (readBitPure!0 (_1!8661 lt!285314))))))

(assert (=> d!63907 (= lt!285431 (readNBitsLSBFirstsLoopPure!0 (_1!8661 lt!285314) nBits!348 i!590 lt!285323))))

(assert (=> d!63907 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8661 lt!285314) nBits!348 i!590 lt!285323) lt!285432)))

(declare-fun bs!15911 () Bool)

(assert (= bs!15911 d!63907))

(assert (=> bs!15911 m!287831))

(assert (=> bs!15911 m!287829))

(assert (=> bs!15911 m!287881))

(declare-fun m!287939 () Bool)

(assert (=> bs!15911 m!287939))

(declare-fun m!287941 () Bool)

(assert (=> bs!15911 m!287941))

(assert (=> b!185228 d!63907))

(declare-fun d!63909 () Bool)

(declare-datatypes ((tuple2!16046 0))(
  ( (tuple2!16047 (_1!8668 (_ BitVec 64)) (_2!8668 BitStream!7754)) )
))
(declare-fun lt!285439 () tuple2!16046)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!7754 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16046)

(assert (=> d!63909 (= lt!285439 (readNBitsLSBFirstsLoop!0 (withMovedBitIndex!0 (_1!8661 lt!285314) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!285318))))

(assert (=> d!63909 (= (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8661 lt!285314) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!285318) (tuple2!16039 (_2!8668 lt!285439) (_1!8668 lt!285439)))))

(declare-fun bs!15912 () Bool)

(assert (= bs!15912 d!63909))

(assert (=> bs!15912 m!287881))

(declare-fun m!287943 () Bool)

(assert (=> bs!15912 m!287943))

(assert (=> b!185228 d!63909))

(declare-fun d!63911 () Bool)

(declare-fun e!128290 () Bool)

(assert (=> d!63911 e!128290))

(declare-fun res!154200 () Bool)

(assert (=> d!63911 (=> (not res!154200) (not e!128290))))

(declare-fun lt!285445 () (_ BitVec 64))

(declare-fun lt!285444 () BitStream!7754)

(assert (=> d!63911 (= res!154200 (= (bvadd lt!285445 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4323 (buf!4781 lt!285444)) (currentByte!9021 lt!285444) (currentBit!9016 lt!285444))))))

(assert (=> d!63911 (or (not (= (bvand lt!285445 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!285445 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!285445 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63911 (= lt!285445 (bitIndex!0 (size!4323 (buf!4781 (_1!8661 lt!285314))) (currentByte!9021 (_1!8661 lt!285314)) (currentBit!9016 (_1!8661 lt!285314))))))

(declare-fun moveBitIndex!0 (BitStream!7754 (_ BitVec 64)) tuple2!16034)

(assert (=> d!63911 (= lt!285444 (_2!8662 (moveBitIndex!0 (_1!8661 lt!285314) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!7754 (_ BitVec 64)) Bool)

(assert (=> d!63911 (moveBitIndexPrecond!0 (_1!8661 lt!285314) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!63911 (= (withMovedBitIndex!0 (_1!8661 lt!285314) #b0000000000000000000000000000000000000000000000000000000000000001) lt!285444)))

(declare-fun b!185276 () Bool)

(assert (=> b!185276 (= e!128290 (= (size!4323 (buf!4781 (_1!8661 lt!285314))) (size!4323 (buf!4781 lt!285444))))))

(assert (= (and d!63911 res!154200) b!185276))

(declare-fun m!287945 () Bool)

(assert (=> d!63911 m!287945))

(declare-fun m!287947 () Bool)

(assert (=> d!63911 m!287947))

(declare-fun m!287949 () Bool)

(assert (=> d!63911 m!287949))

(declare-fun m!287951 () Bool)

(assert (=> d!63911 m!287951))

(assert (=> b!185228 d!63911))

(declare-fun d!63913 () Bool)

(declare-fun e!128291 () Bool)

(assert (=> d!63913 e!128291))

(declare-fun res!154201 () Bool)

(assert (=> d!63913 (=> (not res!154201) (not e!128291))))

(declare-fun lt!285449 () (_ BitVec 64))

(declare-fun lt!285450 () (_ BitVec 64))

(declare-fun lt!285447 () (_ BitVec 64))

(assert (=> d!63913 (= res!154201 (= lt!285450 (bvsub lt!285447 lt!285449)))))

(assert (=> d!63913 (or (= (bvand lt!285447 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!285449 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!285447 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!285447 lt!285449) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63913 (= lt!285449 (remainingBits!0 ((_ sign_extend 32) (size!4323 (buf!4781 (_1!8663 lt!285332)))) ((_ sign_extend 32) (currentByte!9021 (_1!8663 lt!285332))) ((_ sign_extend 32) (currentBit!9016 (_1!8663 lt!285332)))))))

(declare-fun lt!285451 () (_ BitVec 64))

(declare-fun lt!285446 () (_ BitVec 64))

(assert (=> d!63913 (= lt!285447 (bvmul lt!285451 lt!285446))))

(assert (=> d!63913 (or (= lt!285451 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!285446 (bvsdiv (bvmul lt!285451 lt!285446) lt!285451)))))

(assert (=> d!63913 (= lt!285446 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63913 (= lt!285451 ((_ sign_extend 32) (size!4323 (buf!4781 (_1!8663 lt!285332)))))))

(assert (=> d!63913 (= lt!285450 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9021 (_1!8663 lt!285332))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9016 (_1!8663 lt!285332)))))))

(assert (=> d!63913 (invariant!0 (currentBit!9016 (_1!8663 lt!285332)) (currentByte!9021 (_1!8663 lt!285332)) (size!4323 (buf!4781 (_1!8663 lt!285332))))))

(assert (=> d!63913 (= (bitIndex!0 (size!4323 (buf!4781 (_1!8663 lt!285332))) (currentByte!9021 (_1!8663 lt!285332)) (currentBit!9016 (_1!8663 lt!285332))) lt!285450)))

(declare-fun b!185277 () Bool)

(declare-fun res!154202 () Bool)

(assert (=> b!185277 (=> (not res!154202) (not e!128291))))

(assert (=> b!185277 (= res!154202 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!285450))))

(declare-fun b!185278 () Bool)

(declare-fun lt!285448 () (_ BitVec 64))

(assert (=> b!185278 (= e!128291 (bvsle lt!285450 (bvmul lt!285448 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!185278 (or (= lt!285448 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!285448 #b0000000000000000000000000000000000000000000000000000000000001000) lt!285448)))))

(assert (=> b!185278 (= lt!285448 ((_ sign_extend 32) (size!4323 (buf!4781 (_1!8663 lt!285332)))))))

(assert (= (and d!63913 res!154201) b!185277))

(assert (= (and b!185277 res!154202) b!185278))

(declare-fun m!287953 () Bool)

(assert (=> d!63913 m!287953))

(declare-fun m!287955 () Bool)

(assert (=> d!63913 m!287955))

(assert (=> b!185218 d!63913))

(declare-fun d!63915 () Bool)

(assert (=> d!63915 (= (array_inv!4064 (buf!4781 thiss!1204)) (bvsge (size!4323 (buf!4781 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!185229 d!63915))

(declare-fun d!63917 () Bool)

(declare-fun res!154204 () Bool)

(declare-fun e!128293 () Bool)

(assert (=> d!63917 (=> (not res!154204) (not e!128293))))

(assert (=> d!63917 (= res!154204 (= (size!4323 (buf!4781 (_2!8662 lt!285320))) (size!4323 (buf!4781 (_2!8662 lt!285322)))))))

(assert (=> d!63917 (= (isPrefixOf!0 (_2!8662 lt!285320) (_2!8662 lt!285322)) e!128293)))

(declare-fun b!185279 () Bool)

(declare-fun res!154205 () Bool)

(assert (=> b!185279 (=> (not res!154205) (not e!128293))))

(assert (=> b!185279 (= res!154205 (bvsle (bitIndex!0 (size!4323 (buf!4781 (_2!8662 lt!285320))) (currentByte!9021 (_2!8662 lt!285320)) (currentBit!9016 (_2!8662 lt!285320))) (bitIndex!0 (size!4323 (buf!4781 (_2!8662 lt!285322))) (currentByte!9021 (_2!8662 lt!285322)) (currentBit!9016 (_2!8662 lt!285322)))))))

(declare-fun b!185280 () Bool)

(declare-fun e!128292 () Bool)

(assert (=> b!185280 (= e!128293 e!128292)))

(declare-fun res!154203 () Bool)

(assert (=> b!185280 (=> res!154203 e!128292)))

(assert (=> b!185280 (= res!154203 (= (size!4323 (buf!4781 (_2!8662 lt!285320))) #b00000000000000000000000000000000))))

(declare-fun b!185281 () Bool)

(assert (=> b!185281 (= e!128292 (arrayBitRangesEq!0 (buf!4781 (_2!8662 lt!285320)) (buf!4781 (_2!8662 lt!285322)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4323 (buf!4781 (_2!8662 lt!285320))) (currentByte!9021 (_2!8662 lt!285320)) (currentBit!9016 (_2!8662 lt!285320)))))))

(assert (= (and d!63917 res!154204) b!185279))

(assert (= (and b!185279 res!154205) b!185280))

(assert (= (and b!185280 (not res!154203)) b!185281))

(assert (=> b!185279 m!287865))

(assert (=> b!185279 m!287857))

(assert (=> b!185281 m!287865))

(assert (=> b!185281 m!287865))

(declare-fun m!287957 () Bool)

(assert (=> b!185281 m!287957))

(assert (=> b!185219 d!63917))

(assert (=> b!185230 d!63889))

(assert (=> b!185220 d!63895))

(assert (=> b!185220 d!63897))

(declare-fun b!185294 () Bool)

(declare-fun e!128298 () Bool)

(declare-fun lt!285462 () tuple2!16036)

(declare-fun lt!285460 () tuple2!16034)

(assert (=> b!185294 (= e!128298 (= (bitIndex!0 (size!4323 (buf!4781 (_1!8663 lt!285462))) (currentByte!9021 (_1!8663 lt!285462)) (currentBit!9016 (_1!8663 lt!285462))) (bitIndex!0 (size!4323 (buf!4781 (_2!8662 lt!285460))) (currentByte!9021 (_2!8662 lt!285460)) (currentBit!9016 (_2!8662 lt!285460)))))))

(declare-fun b!185293 () Bool)

(declare-fun e!128299 () Bool)

(assert (=> b!185293 (= e!128299 e!128298)))

(declare-fun res!154215 () Bool)

(assert (=> b!185293 (=> (not res!154215) (not e!128298))))

(assert (=> b!185293 (= res!154215 (and (= (_2!8663 lt!285462) lt!285313) (= (_1!8663 lt!285462) (_2!8662 lt!285460))))))

(assert (=> b!185293 (= lt!285462 (readBitPure!0 (readerFrom!0 (_2!8662 lt!285460) (currentBit!9016 thiss!1204) (currentByte!9021 thiss!1204))))))

(declare-fun b!185291 () Bool)

(declare-fun res!154216 () Bool)

(assert (=> b!185291 (=> (not res!154216) (not e!128299))))

(declare-fun lt!285461 () (_ BitVec 64))

(declare-fun lt!285463 () (_ BitVec 64))

(assert (=> b!185291 (= res!154216 (= (bitIndex!0 (size!4323 (buf!4781 (_2!8662 lt!285460))) (currentByte!9021 (_2!8662 lt!285460)) (currentBit!9016 (_2!8662 lt!285460))) (bvadd lt!285461 lt!285463)))))

(assert (=> b!185291 (or (not (= (bvand lt!285461 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!285463 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!285461 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!285461 lt!285463) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!185291 (= lt!285463 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!185291 (= lt!285461 (bitIndex!0 (size!4323 (buf!4781 thiss!1204)) (currentByte!9021 thiss!1204) (currentBit!9016 thiss!1204)))))

(declare-fun d!63919 () Bool)

(assert (=> d!63919 e!128299))

(declare-fun res!154217 () Bool)

(assert (=> d!63919 (=> (not res!154217) (not e!128299))))

(assert (=> d!63919 (= res!154217 (= (size!4323 (buf!4781 thiss!1204)) (size!4323 (buf!4781 (_2!8662 lt!285460)))))))

(declare-fun choose!16 (BitStream!7754 Bool) tuple2!16034)

(assert (=> d!63919 (= lt!285460 (choose!16 thiss!1204 lt!285313))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!63919 (validate_offset_bit!0 ((_ sign_extend 32) (size!4323 (buf!4781 thiss!1204))) ((_ sign_extend 32) (currentByte!9021 thiss!1204)) ((_ sign_extend 32) (currentBit!9016 thiss!1204)))))

(assert (=> d!63919 (= (appendBit!0 thiss!1204 lt!285313) lt!285460)))

(declare-fun b!185292 () Bool)

(declare-fun res!154214 () Bool)

(assert (=> b!185292 (=> (not res!154214) (not e!128299))))

(assert (=> b!185292 (= res!154214 (isPrefixOf!0 thiss!1204 (_2!8662 lt!285460)))))

(assert (= (and d!63919 res!154217) b!185291))

(assert (= (and b!185291 res!154216) b!185292))

(assert (= (and b!185292 res!154214) b!185293))

(assert (= (and b!185293 res!154215) b!185294))

(declare-fun m!287959 () Bool)

(assert (=> b!185294 m!287959))

(declare-fun m!287961 () Bool)

(assert (=> b!185294 m!287961))

(assert (=> b!185291 m!287961))

(assert (=> b!185291 m!287867))

(declare-fun m!287963 () Bool)

(assert (=> b!185292 m!287963))

(declare-fun m!287965 () Bool)

(assert (=> d!63919 m!287965))

(declare-fun m!287967 () Bool)

(assert (=> d!63919 m!287967))

(declare-fun m!287969 () Bool)

(assert (=> b!185293 m!287969))

(assert (=> b!185293 m!287969))

(declare-fun m!287971 () Bool)

(assert (=> b!185293 m!287971))

(assert (=> b!185220 d!63919))

(declare-fun d!63921 () Bool)

(assert (=> d!63921 (= (invariant!0 (currentBit!9016 thiss!1204) (currentByte!9021 thiss!1204) (size!4323 (buf!4781 (_2!8662 lt!285322)))) (and (bvsge (currentBit!9016 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9016 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9021 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9021 thiss!1204) (size!4323 (buf!4781 (_2!8662 lt!285322)))) (and (= (currentBit!9016 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9021 thiss!1204) (size!4323 (buf!4781 (_2!8662 lt!285322))))))))))

(assert (=> b!185231 d!63921))

(declare-fun d!63923 () Bool)

(assert (=> d!63923 (validate_offset_bits!1 ((_ sign_extend 32) (size!4323 (buf!4781 (_2!8662 lt!285322)))) ((_ sign_extend 32) (currentByte!9021 (_2!8662 lt!285320))) ((_ sign_extend 32) (currentBit!9016 (_2!8662 lt!285320))) lt!285329)))

(declare-fun lt!285466 () Unit!13260)

(declare-fun choose!9 (BitStream!7754 array!9801 (_ BitVec 64) BitStream!7754) Unit!13260)

(assert (=> d!63923 (= lt!285466 (choose!9 (_2!8662 lt!285320) (buf!4781 (_2!8662 lt!285322)) lt!285329 (BitStream!7755 (buf!4781 (_2!8662 lt!285322)) (currentByte!9021 (_2!8662 lt!285320)) (currentBit!9016 (_2!8662 lt!285320)))))))

(assert (=> d!63923 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8662 lt!285320) (buf!4781 (_2!8662 lt!285322)) lt!285329) lt!285466)))

(declare-fun bs!15913 () Bool)

(assert (= bs!15913 d!63923))

(assert (=> bs!15913 m!287821))

(declare-fun m!287973 () Bool)

(assert (=> bs!15913 m!287973))

(assert (=> b!185221 d!63923))

(declare-fun d!63925 () Bool)

(assert (=> d!63925 (= (invariant!0 (currentBit!9016 thiss!1204) (currentByte!9021 thiss!1204) (size!4323 (buf!4781 (_2!8662 lt!285320)))) (and (bvsge (currentBit!9016 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9016 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9021 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9021 thiss!1204) (size!4323 (buf!4781 (_2!8662 lt!285320)))) (and (= (currentBit!9016 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9021 thiss!1204) (size!4323 (buf!4781 (_2!8662 lt!285320))))))))))

(assert (=> b!185221 d!63925))

(declare-fun b!185305 () Bool)

(declare-fun res!154226 () Bool)

(declare-fun e!128304 () Bool)

(assert (=> b!185305 (=> (not res!154226) (not e!128304))))

(declare-fun lt!285522 () tuple2!16032)

(assert (=> b!185305 (= res!154226 (isPrefixOf!0 (_1!8661 lt!285522) (_2!8662 lt!285320)))))

(declare-fun b!185306 () Bool)

(declare-fun res!154225 () Bool)

(assert (=> b!185306 (=> (not res!154225) (not e!128304))))

(assert (=> b!185306 (= res!154225 (isPrefixOf!0 (_2!8661 lt!285522) (_2!8662 lt!285322)))))

(declare-fun lt!285516 () (_ BitVec 64))

(declare-fun b!185307 () Bool)

(declare-fun lt!285524 () (_ BitVec 64))

(assert (=> b!185307 (= e!128304 (= (_1!8661 lt!285522) (withMovedBitIndex!0 (_2!8661 lt!285522) (bvsub lt!285524 lt!285516))))))

(assert (=> b!185307 (or (= (bvand lt!285524 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!285516 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!285524 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!285524 lt!285516) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!185307 (= lt!285516 (bitIndex!0 (size!4323 (buf!4781 (_2!8662 lt!285322))) (currentByte!9021 (_2!8662 lt!285322)) (currentBit!9016 (_2!8662 lt!285322))))))

(assert (=> b!185307 (= lt!285524 (bitIndex!0 (size!4323 (buf!4781 (_2!8662 lt!285320))) (currentByte!9021 (_2!8662 lt!285320)) (currentBit!9016 (_2!8662 lt!285320))))))

(declare-fun b!185308 () Bool)

(declare-fun e!128305 () Unit!13260)

(declare-fun Unit!13275 () Unit!13260)

(assert (=> b!185308 (= e!128305 Unit!13275)))

(declare-fun d!63927 () Bool)

(assert (=> d!63927 e!128304))

(declare-fun res!154224 () Bool)

(assert (=> d!63927 (=> (not res!154224) (not e!128304))))

(assert (=> d!63927 (= res!154224 (isPrefixOf!0 (_1!8661 lt!285522) (_2!8661 lt!285522)))))

(declare-fun lt!285511 () BitStream!7754)

(assert (=> d!63927 (= lt!285522 (tuple2!16033 lt!285511 (_2!8662 lt!285322)))))

(declare-fun lt!285526 () Unit!13260)

(declare-fun lt!285525 () Unit!13260)

(assert (=> d!63927 (= lt!285526 lt!285525)))

(assert (=> d!63927 (isPrefixOf!0 lt!285511 (_2!8662 lt!285322))))

(assert (=> d!63927 (= lt!285525 (lemmaIsPrefixTransitive!0 lt!285511 (_2!8662 lt!285322) (_2!8662 lt!285322)))))

(declare-fun lt!285513 () Unit!13260)

(declare-fun lt!285509 () Unit!13260)

(assert (=> d!63927 (= lt!285513 lt!285509)))

(assert (=> d!63927 (isPrefixOf!0 lt!285511 (_2!8662 lt!285322))))

(assert (=> d!63927 (= lt!285509 (lemmaIsPrefixTransitive!0 lt!285511 (_2!8662 lt!285320) (_2!8662 lt!285322)))))

(declare-fun lt!285510 () Unit!13260)

(assert (=> d!63927 (= lt!285510 e!128305)))

(declare-fun c!9459 () Bool)

(assert (=> d!63927 (= c!9459 (not (= (size!4323 (buf!4781 (_2!8662 lt!285320))) #b00000000000000000000000000000000)))))

(declare-fun lt!285523 () Unit!13260)

(declare-fun lt!285512 () Unit!13260)

(assert (=> d!63927 (= lt!285523 lt!285512)))

(assert (=> d!63927 (isPrefixOf!0 (_2!8662 lt!285322) (_2!8662 lt!285322))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7754) Unit!13260)

(assert (=> d!63927 (= lt!285512 (lemmaIsPrefixRefl!0 (_2!8662 lt!285322)))))

(declare-fun lt!285515 () Unit!13260)

(declare-fun lt!285518 () Unit!13260)

(assert (=> d!63927 (= lt!285515 lt!285518)))

(assert (=> d!63927 (= lt!285518 (lemmaIsPrefixRefl!0 (_2!8662 lt!285322)))))

(declare-fun lt!285520 () Unit!13260)

(declare-fun lt!285517 () Unit!13260)

(assert (=> d!63927 (= lt!285520 lt!285517)))

(assert (=> d!63927 (isPrefixOf!0 lt!285511 lt!285511)))

(assert (=> d!63927 (= lt!285517 (lemmaIsPrefixRefl!0 lt!285511))))

(declare-fun lt!285521 () Unit!13260)

(declare-fun lt!285508 () Unit!13260)

(assert (=> d!63927 (= lt!285521 lt!285508)))

(assert (=> d!63927 (isPrefixOf!0 (_2!8662 lt!285320) (_2!8662 lt!285320))))

(assert (=> d!63927 (= lt!285508 (lemmaIsPrefixRefl!0 (_2!8662 lt!285320)))))

(assert (=> d!63927 (= lt!285511 (BitStream!7755 (buf!4781 (_2!8662 lt!285322)) (currentByte!9021 (_2!8662 lt!285320)) (currentBit!9016 (_2!8662 lt!285320))))))

(assert (=> d!63927 (isPrefixOf!0 (_2!8662 lt!285320) (_2!8662 lt!285322))))

(assert (=> d!63927 (= (reader!0 (_2!8662 lt!285320) (_2!8662 lt!285322)) lt!285522)))

(declare-fun b!185309 () Bool)

(declare-fun lt!285519 () Unit!13260)

(assert (=> b!185309 (= e!128305 lt!285519)))

(declare-fun lt!285507 () (_ BitVec 64))

(assert (=> b!185309 (= lt!285507 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!285514 () (_ BitVec 64))

(assert (=> b!185309 (= lt!285514 (bitIndex!0 (size!4323 (buf!4781 (_2!8662 lt!285320))) (currentByte!9021 (_2!8662 lt!285320)) (currentBit!9016 (_2!8662 lt!285320))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9801 array!9801 (_ BitVec 64) (_ BitVec 64)) Unit!13260)

(assert (=> b!185309 (= lt!285519 (arrayBitRangesEqSymmetric!0 (buf!4781 (_2!8662 lt!285320)) (buf!4781 (_2!8662 lt!285322)) lt!285507 lt!285514))))

(assert (=> b!185309 (arrayBitRangesEq!0 (buf!4781 (_2!8662 lt!285322)) (buf!4781 (_2!8662 lt!285320)) lt!285507 lt!285514)))

(assert (= (and d!63927 c!9459) b!185309))

(assert (= (and d!63927 (not c!9459)) b!185308))

(assert (= (and d!63927 res!154224) b!185305))

(assert (= (and b!185305 res!154226) b!185306))

(assert (= (and b!185306 res!154225) b!185307))

(declare-fun m!287975 () Bool)

(assert (=> b!185307 m!287975))

(assert (=> b!185307 m!287857))

(assert (=> b!185307 m!287865))

(declare-fun m!287977 () Bool)

(assert (=> b!185305 m!287977))

(declare-fun m!287979 () Bool)

(assert (=> b!185306 m!287979))

(declare-fun m!287981 () Bool)

(assert (=> d!63927 m!287981))

(declare-fun m!287983 () Bool)

(assert (=> d!63927 m!287983))

(declare-fun m!287985 () Bool)

(assert (=> d!63927 m!287985))

(declare-fun m!287987 () Bool)

(assert (=> d!63927 m!287987))

(declare-fun m!287989 () Bool)

(assert (=> d!63927 m!287989))

(assert (=> d!63927 m!287855))

(declare-fun m!287991 () Bool)

(assert (=> d!63927 m!287991))

(declare-fun m!287993 () Bool)

(assert (=> d!63927 m!287993))

(declare-fun m!287995 () Bool)

(assert (=> d!63927 m!287995))

(declare-fun m!287997 () Bool)

(assert (=> d!63927 m!287997))

(declare-fun m!287999 () Bool)

(assert (=> d!63927 m!287999))

(assert (=> b!185309 m!287865))

(declare-fun m!288001 () Bool)

(assert (=> b!185309 m!288001))

(declare-fun m!288003 () Bool)

(assert (=> b!185309 m!288003))

(assert (=> b!185221 d!63927))

(declare-fun d!63929 () Bool)

(assert (=> d!63929 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4323 (buf!4781 (_2!8662 lt!285322)))) ((_ sign_extend 32) (currentByte!9021 thiss!1204)) ((_ sign_extend 32) (currentBit!9016 thiss!1204)) lt!285311) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4323 (buf!4781 (_2!8662 lt!285322)))) ((_ sign_extend 32) (currentByte!9021 thiss!1204)) ((_ sign_extend 32) (currentBit!9016 thiss!1204))) lt!285311))))

(declare-fun bs!15914 () Bool)

(assert (= bs!15914 d!63929))

(declare-fun m!288005 () Bool)

(assert (=> bs!15914 m!288005))

(assert (=> b!185221 d!63929))

(declare-fun d!63931 () Bool)

(declare-fun lt!285527 () tuple2!16044)

(assert (=> d!63931 (= lt!285527 (readBit!0 lt!285317))))

(assert (=> d!63931 (= (readBitPure!0 lt!285317) (tuple2!16037 (_2!8667 lt!285527) (_1!8667 lt!285527)))))

(declare-fun bs!15915 () Bool)

(assert (= bs!15915 d!63931))

(declare-fun m!288007 () Bool)

(assert (=> bs!15915 m!288007))

(assert (=> b!185221 d!63931))

(declare-fun d!63933 () Bool)

(declare-fun lt!285528 () tuple2!16044)

(assert (=> d!63933 (= lt!285528 (readBit!0 (_1!8661 lt!285314)))))

(assert (=> d!63933 (= (readBitPure!0 (_1!8661 lt!285314)) (tuple2!16037 (_2!8667 lt!285528) (_1!8667 lt!285528)))))

(declare-fun bs!15916 () Bool)

(assert (= bs!15916 d!63933))

(declare-fun m!288009 () Bool)

(assert (=> bs!15916 m!288009))

(assert (=> b!185221 d!63933))

(declare-fun d!63935 () Bool)

(declare-fun e!128306 () Bool)

(assert (=> d!63935 e!128306))

(declare-fun res!154227 () Bool)

(assert (=> d!63935 (=> (not res!154227) (not e!128306))))

(declare-fun lt!285533 () (_ BitVec 64))

(declare-fun lt!285530 () (_ BitVec 64))

(declare-fun lt!285532 () (_ BitVec 64))

(assert (=> d!63935 (= res!154227 (= lt!285533 (bvsub lt!285530 lt!285532)))))

(assert (=> d!63935 (or (= (bvand lt!285530 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!285532 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!285530 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!285530 lt!285532) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63935 (= lt!285532 (remainingBits!0 ((_ sign_extend 32) (size!4323 (buf!4781 (_1!8663 lt!285316)))) ((_ sign_extend 32) (currentByte!9021 (_1!8663 lt!285316))) ((_ sign_extend 32) (currentBit!9016 (_1!8663 lt!285316)))))))

(declare-fun lt!285534 () (_ BitVec 64))

(declare-fun lt!285529 () (_ BitVec 64))

(assert (=> d!63935 (= lt!285530 (bvmul lt!285534 lt!285529))))

(assert (=> d!63935 (or (= lt!285534 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!285529 (bvsdiv (bvmul lt!285534 lt!285529) lt!285534)))))

(assert (=> d!63935 (= lt!285529 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63935 (= lt!285534 ((_ sign_extend 32) (size!4323 (buf!4781 (_1!8663 lt!285316)))))))

(assert (=> d!63935 (= lt!285533 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9021 (_1!8663 lt!285316))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9016 (_1!8663 lt!285316)))))))

(assert (=> d!63935 (invariant!0 (currentBit!9016 (_1!8663 lt!285316)) (currentByte!9021 (_1!8663 lt!285316)) (size!4323 (buf!4781 (_1!8663 lt!285316))))))

(assert (=> d!63935 (= (bitIndex!0 (size!4323 (buf!4781 (_1!8663 lt!285316))) (currentByte!9021 (_1!8663 lt!285316)) (currentBit!9016 (_1!8663 lt!285316))) lt!285533)))

(declare-fun b!185310 () Bool)

(declare-fun res!154228 () Bool)

(assert (=> b!185310 (=> (not res!154228) (not e!128306))))

(assert (=> b!185310 (= res!154228 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!285533))))

(declare-fun b!185311 () Bool)

(declare-fun lt!285531 () (_ BitVec 64))

(assert (=> b!185311 (= e!128306 (bvsle lt!285533 (bvmul lt!285531 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!185311 (or (= lt!285531 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!285531 #b0000000000000000000000000000000000000000000000000000000000001000) lt!285531)))))

(assert (=> b!185311 (= lt!285531 ((_ sign_extend 32) (size!4323 (buf!4781 (_1!8663 lt!285316)))))))

(assert (= (and d!63935 res!154227) b!185310))

(assert (= (and b!185310 res!154228) b!185311))

(declare-fun m!288011 () Bool)

(assert (=> d!63935 m!288011))

(declare-fun m!288013 () Bool)

(assert (=> d!63935 m!288013))

(assert (=> b!185221 d!63935))

(declare-fun d!63937 () Bool)

(declare-fun lt!285535 () tuple2!16044)

(assert (=> d!63937 (= lt!285535 (readBit!0 (BitStream!7755 (buf!4781 (_2!8662 lt!285322)) (currentByte!9021 thiss!1204) (currentBit!9016 thiss!1204))))))

(assert (=> d!63937 (= (readBitPure!0 (BitStream!7755 (buf!4781 (_2!8662 lt!285322)) (currentByte!9021 thiss!1204) (currentBit!9016 thiss!1204))) (tuple2!16037 (_2!8667 lt!285535) (_1!8667 lt!285535)))))

(declare-fun bs!15917 () Bool)

(assert (= bs!15917 d!63937))

(declare-fun m!288015 () Bool)

(assert (=> bs!15917 m!288015))

(assert (=> b!185221 d!63937))

(declare-fun d!63939 () Bool)

(declare-fun lt!285536 () tuple2!16046)

(assert (=> d!63939 (= lt!285536 (readNBitsLSBFirstsLoop!0 (_1!8661 lt!285314) nBits!348 i!590 lt!285323))))

(assert (=> d!63939 (= (readNBitsLSBFirstsLoopPure!0 (_1!8661 lt!285314) nBits!348 i!590 lt!285323) (tuple2!16039 (_2!8668 lt!285536) (_1!8668 lt!285536)))))

(declare-fun bs!15918 () Bool)

(assert (= bs!15918 d!63939))

(declare-fun m!288017 () Bool)

(assert (=> bs!15918 m!288017))

(assert (=> b!185221 d!63939))

(declare-fun d!63941 () Bool)

(assert (=> d!63941 (validate_offset_bits!1 ((_ sign_extend 32) (size!4323 (buf!4781 (_2!8662 lt!285322)))) ((_ sign_extend 32) (currentByte!9021 thiss!1204)) ((_ sign_extend 32) (currentBit!9016 thiss!1204)) lt!285311)))

(declare-fun lt!285537 () Unit!13260)

(assert (=> d!63941 (= lt!285537 (choose!9 thiss!1204 (buf!4781 (_2!8662 lt!285322)) lt!285311 (BitStream!7755 (buf!4781 (_2!8662 lt!285322)) (currentByte!9021 thiss!1204) (currentBit!9016 thiss!1204))))))

(assert (=> d!63941 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4781 (_2!8662 lt!285322)) lt!285311) lt!285537)))

(declare-fun bs!15919 () Bool)

(assert (= bs!15919 d!63941))

(assert (=> bs!15919 m!287825))

(declare-fun m!288019 () Bool)

(assert (=> bs!15919 m!288019))

(assert (=> b!185221 d!63941))

(declare-fun d!63943 () Bool)

(declare-fun e!128307 () Bool)

(assert (=> d!63943 e!128307))

(declare-fun res!154229 () Bool)

(assert (=> d!63943 (=> (not res!154229) (not e!128307))))

(declare-fun lt!285542 () (_ BitVec 64))

(declare-fun lt!285539 () (_ BitVec 64))

(declare-fun lt!285541 () (_ BitVec 64))

(assert (=> d!63943 (= res!154229 (= lt!285542 (bvsub lt!285539 lt!285541)))))

(assert (=> d!63943 (or (= (bvand lt!285539 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!285541 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!285539 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!285539 lt!285541) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63943 (= lt!285541 (remainingBits!0 ((_ sign_extend 32) (size!4323 (buf!4781 (_1!8663 lt!285324)))) ((_ sign_extend 32) (currentByte!9021 (_1!8663 lt!285324))) ((_ sign_extend 32) (currentBit!9016 (_1!8663 lt!285324)))))))

(declare-fun lt!285543 () (_ BitVec 64))

(declare-fun lt!285538 () (_ BitVec 64))

(assert (=> d!63943 (= lt!285539 (bvmul lt!285543 lt!285538))))

(assert (=> d!63943 (or (= lt!285543 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!285538 (bvsdiv (bvmul lt!285543 lt!285538) lt!285543)))))

(assert (=> d!63943 (= lt!285538 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63943 (= lt!285543 ((_ sign_extend 32) (size!4323 (buf!4781 (_1!8663 lt!285324)))))))

(assert (=> d!63943 (= lt!285542 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9021 (_1!8663 lt!285324))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9016 (_1!8663 lt!285324)))))))

(assert (=> d!63943 (invariant!0 (currentBit!9016 (_1!8663 lt!285324)) (currentByte!9021 (_1!8663 lt!285324)) (size!4323 (buf!4781 (_1!8663 lt!285324))))))

(assert (=> d!63943 (= (bitIndex!0 (size!4323 (buf!4781 (_1!8663 lt!285324))) (currentByte!9021 (_1!8663 lt!285324)) (currentBit!9016 (_1!8663 lt!285324))) lt!285542)))

(declare-fun b!185312 () Bool)

(declare-fun res!154230 () Bool)

(assert (=> b!185312 (=> (not res!154230) (not e!128307))))

(assert (=> b!185312 (= res!154230 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!285542))))

(declare-fun b!185313 () Bool)

(declare-fun lt!285540 () (_ BitVec 64))

(assert (=> b!185313 (= e!128307 (bvsle lt!285542 (bvmul lt!285540 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!185313 (or (= lt!285540 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!285540 #b0000000000000000000000000000000000000000000000000000000000001000) lt!285540)))))

(assert (=> b!185313 (= lt!285540 ((_ sign_extend 32) (size!4323 (buf!4781 (_1!8663 lt!285324)))))))

(assert (= (and d!63943 res!154229) b!185312))

(assert (= (and b!185312 res!154230) b!185313))

(declare-fun m!288021 () Bool)

(assert (=> d!63943 m!288021))

(declare-fun m!288023 () Bool)

(assert (=> d!63943 m!288023))

(assert (=> b!185221 d!63943))

(declare-fun b!185314 () Bool)

(declare-fun res!154233 () Bool)

(declare-fun e!128308 () Bool)

(assert (=> b!185314 (=> (not res!154233) (not e!128308))))

(declare-fun lt!285559 () tuple2!16032)

(assert (=> b!185314 (= res!154233 (isPrefixOf!0 (_1!8661 lt!285559) thiss!1204))))

(declare-fun b!185315 () Bool)

(declare-fun res!154232 () Bool)

(assert (=> b!185315 (=> (not res!154232) (not e!128308))))

(assert (=> b!185315 (= res!154232 (isPrefixOf!0 (_2!8661 lt!285559) (_2!8662 lt!285322)))))

(declare-fun lt!285561 () (_ BitVec 64))

(declare-fun b!185316 () Bool)

(declare-fun lt!285553 () (_ BitVec 64))

(assert (=> b!185316 (= e!128308 (= (_1!8661 lt!285559) (withMovedBitIndex!0 (_2!8661 lt!285559) (bvsub lt!285561 lt!285553))))))

(assert (=> b!185316 (or (= (bvand lt!285561 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!285553 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!285561 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!285561 lt!285553) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!185316 (= lt!285553 (bitIndex!0 (size!4323 (buf!4781 (_2!8662 lt!285322))) (currentByte!9021 (_2!8662 lt!285322)) (currentBit!9016 (_2!8662 lt!285322))))))

(assert (=> b!185316 (= lt!285561 (bitIndex!0 (size!4323 (buf!4781 thiss!1204)) (currentByte!9021 thiss!1204) (currentBit!9016 thiss!1204)))))

(declare-fun b!185317 () Bool)

(declare-fun e!128309 () Unit!13260)

(declare-fun Unit!13276 () Unit!13260)

(assert (=> b!185317 (= e!128309 Unit!13276)))

(declare-fun d!63945 () Bool)

(assert (=> d!63945 e!128308))

(declare-fun res!154231 () Bool)

(assert (=> d!63945 (=> (not res!154231) (not e!128308))))

(assert (=> d!63945 (= res!154231 (isPrefixOf!0 (_1!8661 lt!285559) (_2!8661 lt!285559)))))

(declare-fun lt!285548 () BitStream!7754)

(assert (=> d!63945 (= lt!285559 (tuple2!16033 lt!285548 (_2!8662 lt!285322)))))

(declare-fun lt!285563 () Unit!13260)

(declare-fun lt!285562 () Unit!13260)

(assert (=> d!63945 (= lt!285563 lt!285562)))

(assert (=> d!63945 (isPrefixOf!0 lt!285548 (_2!8662 lt!285322))))

(assert (=> d!63945 (= lt!285562 (lemmaIsPrefixTransitive!0 lt!285548 (_2!8662 lt!285322) (_2!8662 lt!285322)))))

(declare-fun lt!285550 () Unit!13260)

(declare-fun lt!285546 () Unit!13260)

(assert (=> d!63945 (= lt!285550 lt!285546)))

(assert (=> d!63945 (isPrefixOf!0 lt!285548 (_2!8662 lt!285322))))

(assert (=> d!63945 (= lt!285546 (lemmaIsPrefixTransitive!0 lt!285548 thiss!1204 (_2!8662 lt!285322)))))

(declare-fun lt!285547 () Unit!13260)

(assert (=> d!63945 (= lt!285547 e!128309)))

(declare-fun c!9460 () Bool)

(assert (=> d!63945 (= c!9460 (not (= (size!4323 (buf!4781 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!285560 () Unit!13260)

(declare-fun lt!285549 () Unit!13260)

(assert (=> d!63945 (= lt!285560 lt!285549)))

(assert (=> d!63945 (isPrefixOf!0 (_2!8662 lt!285322) (_2!8662 lt!285322))))

(assert (=> d!63945 (= lt!285549 (lemmaIsPrefixRefl!0 (_2!8662 lt!285322)))))

(declare-fun lt!285552 () Unit!13260)

(declare-fun lt!285555 () Unit!13260)

(assert (=> d!63945 (= lt!285552 lt!285555)))

(assert (=> d!63945 (= lt!285555 (lemmaIsPrefixRefl!0 (_2!8662 lt!285322)))))

(declare-fun lt!285557 () Unit!13260)

(declare-fun lt!285554 () Unit!13260)

(assert (=> d!63945 (= lt!285557 lt!285554)))

(assert (=> d!63945 (isPrefixOf!0 lt!285548 lt!285548)))

(assert (=> d!63945 (= lt!285554 (lemmaIsPrefixRefl!0 lt!285548))))

(declare-fun lt!285558 () Unit!13260)

(declare-fun lt!285545 () Unit!13260)

(assert (=> d!63945 (= lt!285558 lt!285545)))

(assert (=> d!63945 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!63945 (= lt!285545 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!63945 (= lt!285548 (BitStream!7755 (buf!4781 (_2!8662 lt!285322)) (currentByte!9021 thiss!1204) (currentBit!9016 thiss!1204)))))

(assert (=> d!63945 (isPrefixOf!0 thiss!1204 (_2!8662 lt!285322))))

(assert (=> d!63945 (= (reader!0 thiss!1204 (_2!8662 lt!285322)) lt!285559)))

(declare-fun b!185318 () Bool)

(declare-fun lt!285556 () Unit!13260)

(assert (=> b!185318 (= e!128309 lt!285556)))

(declare-fun lt!285544 () (_ BitVec 64))

(assert (=> b!185318 (= lt!285544 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!285551 () (_ BitVec 64))

(assert (=> b!185318 (= lt!285551 (bitIndex!0 (size!4323 (buf!4781 thiss!1204)) (currentByte!9021 thiss!1204) (currentBit!9016 thiss!1204)))))

(assert (=> b!185318 (= lt!285556 (arrayBitRangesEqSymmetric!0 (buf!4781 thiss!1204) (buf!4781 (_2!8662 lt!285322)) lt!285544 lt!285551))))

(assert (=> b!185318 (arrayBitRangesEq!0 (buf!4781 (_2!8662 lt!285322)) (buf!4781 thiss!1204) lt!285544 lt!285551)))

(assert (= (and d!63945 c!9460) b!185318))

(assert (= (and d!63945 (not c!9460)) b!185317))

(assert (= (and d!63945 res!154231) b!185314))

(assert (= (and b!185314 res!154233) b!185315))

(assert (= (and b!185315 res!154232) b!185316))

(declare-fun m!288025 () Bool)

(assert (=> b!185316 m!288025))

(assert (=> b!185316 m!287857))

(assert (=> b!185316 m!287867))

(declare-fun m!288027 () Bool)

(assert (=> b!185314 m!288027))

(declare-fun m!288029 () Bool)

(assert (=> b!185315 m!288029))

(declare-fun m!288031 () Bool)

(assert (=> d!63945 m!288031))

(declare-fun m!288033 () Bool)

(assert (=> d!63945 m!288033))

(declare-fun m!288035 () Bool)

(assert (=> d!63945 m!288035))

(declare-fun m!288037 () Bool)

(assert (=> d!63945 m!288037))

(declare-fun m!288039 () Bool)

(assert (=> d!63945 m!288039))

(assert (=> d!63945 m!287859))

(assert (=> d!63945 m!287991))

(assert (=> d!63945 m!287993))

(declare-fun m!288041 () Bool)

(assert (=> d!63945 m!288041))

(declare-fun m!288043 () Bool)

(assert (=> d!63945 m!288043))

(declare-fun m!288045 () Bool)

(assert (=> d!63945 m!288045))

(assert (=> b!185318 m!287867))

(declare-fun m!288047 () Bool)

(assert (=> b!185318 m!288047))

(declare-fun m!288049 () Bool)

(assert (=> b!185318 m!288049))

(assert (=> b!185221 d!63945))

(declare-fun d!63947 () Bool)

(declare-fun e!128312 () Bool)

(assert (=> d!63947 e!128312))

(declare-fun res!154236 () Bool)

(assert (=> d!63947 (=> (not res!154236) (not e!128312))))

(declare-fun lt!285575 () tuple2!16036)

(declare-fun lt!285574 () tuple2!16036)

(assert (=> d!63947 (= res!154236 (= (bitIndex!0 (size!4323 (buf!4781 (_1!8663 lt!285575))) (currentByte!9021 (_1!8663 lt!285575)) (currentBit!9016 (_1!8663 lt!285575))) (bitIndex!0 (size!4323 (buf!4781 (_1!8663 lt!285574))) (currentByte!9021 (_1!8663 lt!285574)) (currentBit!9016 (_1!8663 lt!285574)))))))

(declare-fun lt!285573 () BitStream!7754)

(declare-fun lt!285572 () Unit!13260)

(declare-fun choose!50 (BitStream!7754 BitStream!7754 BitStream!7754 tuple2!16036 tuple2!16036 BitStream!7754 Bool tuple2!16036 tuple2!16036 BitStream!7754 Bool) Unit!13260)

(assert (=> d!63947 (= lt!285572 (choose!50 lt!285317 (_2!8662 lt!285322) lt!285573 lt!285575 (tuple2!16037 (_1!8663 lt!285575) (_2!8663 lt!285575)) (_1!8663 lt!285575) (_2!8663 lt!285575) lt!285574 (tuple2!16037 (_1!8663 lt!285574) (_2!8663 lt!285574)) (_1!8663 lt!285574) (_2!8663 lt!285574)))))

(assert (=> d!63947 (= lt!285574 (readBitPure!0 lt!285573))))

(assert (=> d!63947 (= lt!285575 (readBitPure!0 lt!285317))))

(assert (=> d!63947 (= lt!285573 (BitStream!7755 (buf!4781 (_2!8662 lt!285322)) (currentByte!9021 lt!285317) (currentBit!9016 lt!285317)))))

(assert (=> d!63947 (invariant!0 (currentBit!9016 lt!285317) (currentByte!9021 lt!285317) (size!4323 (buf!4781 (_2!8662 lt!285322))))))

(assert (=> d!63947 (= (readBitPrefixLemma!0 lt!285317 (_2!8662 lt!285322)) lt!285572)))

(declare-fun b!185321 () Bool)

(assert (=> b!185321 (= e!128312 (= (_2!8663 lt!285575) (_2!8663 lt!285574)))))

(assert (= (and d!63947 res!154236) b!185321))

(declare-fun m!288051 () Bool)

(assert (=> d!63947 m!288051))

(declare-fun m!288053 () Bool)

(assert (=> d!63947 m!288053))

(declare-fun m!288055 () Bool)

(assert (=> d!63947 m!288055))

(declare-fun m!288057 () Bool)

(assert (=> d!63947 m!288057))

(declare-fun m!288059 () Bool)

(assert (=> d!63947 m!288059))

(assert (=> d!63947 m!287839))

(assert (=> b!185221 d!63947))

(declare-fun d!63949 () Bool)

(declare-fun lt!285576 () tuple2!16046)

(assert (=> d!63949 (= lt!285576 (readNBitsLSBFirstsLoop!0 (_1!8661 lt!285326) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!285318))))

(assert (=> d!63949 (= (readNBitsLSBFirstsLoopPure!0 (_1!8661 lt!285326) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!285318) (tuple2!16039 (_2!8668 lt!285576) (_1!8668 lt!285576)))))

(declare-fun bs!15920 () Bool)

(assert (= bs!15920 d!63949))

(declare-fun m!288061 () Bool)

(assert (=> bs!15920 m!288061))

(assert (=> b!185221 d!63949))

(declare-fun d!63951 () Bool)

(assert (=> d!63951 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4323 (buf!4781 (_2!8662 lt!285322)))) ((_ sign_extend 32) (currentByte!9021 (_2!8662 lt!285320))) ((_ sign_extend 32) (currentBit!9016 (_2!8662 lt!285320))) lt!285329) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4323 (buf!4781 (_2!8662 lt!285322)))) ((_ sign_extend 32) (currentByte!9021 (_2!8662 lt!285320))) ((_ sign_extend 32) (currentBit!9016 (_2!8662 lt!285320)))) lt!285329))))

(declare-fun bs!15921 () Bool)

(assert (= bs!15921 d!63951))

(declare-fun m!288063 () Bool)

(assert (=> bs!15921 m!288063))

(assert (=> b!185221 d!63951))

(declare-fun d!63953 () Bool)

(assert (=> d!63953 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!185221 d!63953))

(declare-fun d!63955 () Bool)

(assert (=> d!63955 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4323 (buf!4781 thiss!1204))) ((_ sign_extend 32) (currentByte!9021 thiss!1204)) ((_ sign_extend 32) (currentBit!9016 thiss!1204)) lt!285311) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4323 (buf!4781 thiss!1204))) ((_ sign_extend 32) (currentByte!9021 thiss!1204)) ((_ sign_extend 32) (currentBit!9016 thiss!1204))) lt!285311))))

(declare-fun bs!15922 () Bool)

(assert (= bs!15922 d!63955))

(assert (=> bs!15922 m!287935))

(assert (=> b!185232 d!63955))

(declare-fun d!63957 () Bool)

(declare-fun e!128313 () Bool)

(assert (=> d!63957 e!128313))

(declare-fun res!154237 () Bool)

(assert (=> d!63957 (=> (not res!154237) (not e!128313))))

(declare-fun lt!285581 () (_ BitVec 64))

(declare-fun lt!285580 () (_ BitVec 64))

(declare-fun lt!285578 () (_ BitVec 64))

(assert (=> d!63957 (= res!154237 (= lt!285581 (bvsub lt!285578 lt!285580)))))

(assert (=> d!63957 (or (= (bvand lt!285578 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!285580 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!285578 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!285578 lt!285580) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63957 (= lt!285580 (remainingBits!0 ((_ sign_extend 32) (size!4323 (buf!4781 (_2!8662 lt!285322)))) ((_ sign_extend 32) (currentByte!9021 (_2!8662 lt!285322))) ((_ sign_extend 32) (currentBit!9016 (_2!8662 lt!285322)))))))

(declare-fun lt!285582 () (_ BitVec 64))

(declare-fun lt!285577 () (_ BitVec 64))

(assert (=> d!63957 (= lt!285578 (bvmul lt!285582 lt!285577))))

(assert (=> d!63957 (or (= lt!285582 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!285577 (bvsdiv (bvmul lt!285582 lt!285577) lt!285582)))))

(assert (=> d!63957 (= lt!285577 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63957 (= lt!285582 ((_ sign_extend 32) (size!4323 (buf!4781 (_2!8662 lt!285322)))))))

(assert (=> d!63957 (= lt!285581 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9021 (_2!8662 lt!285322))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9016 (_2!8662 lt!285322)))))))

(assert (=> d!63957 (invariant!0 (currentBit!9016 (_2!8662 lt!285322)) (currentByte!9021 (_2!8662 lt!285322)) (size!4323 (buf!4781 (_2!8662 lt!285322))))))

(assert (=> d!63957 (= (bitIndex!0 (size!4323 (buf!4781 (_2!8662 lt!285322))) (currentByte!9021 (_2!8662 lt!285322)) (currentBit!9016 (_2!8662 lt!285322))) lt!285581)))

(declare-fun b!185322 () Bool)

(declare-fun res!154238 () Bool)

(assert (=> b!185322 (=> (not res!154238) (not e!128313))))

(assert (=> b!185322 (= res!154238 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!285581))))

(declare-fun b!185323 () Bool)

(declare-fun lt!285579 () (_ BitVec 64))

(assert (=> b!185323 (= e!128313 (bvsle lt!285581 (bvmul lt!285579 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!185323 (or (= lt!285579 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!285579 #b0000000000000000000000000000000000000000000000000000000000001000) lt!285579)))))

(assert (=> b!185323 (= lt!285579 ((_ sign_extend 32) (size!4323 (buf!4781 (_2!8662 lt!285322)))))))

(assert (= (and d!63957 res!154237) b!185322))

(assert (= (and b!185322 res!154238) b!185323))

(declare-fun m!288065 () Bool)

(assert (=> d!63957 m!288065))

(assert (=> d!63957 m!287873))

(assert (=> b!185224 d!63957))

(declare-fun d!63959 () Bool)

(declare-fun res!154240 () Bool)

(declare-fun e!128315 () Bool)

(assert (=> d!63959 (=> (not res!154240) (not e!128315))))

(assert (=> d!63959 (= res!154240 (= (size!4323 (buf!4781 thiss!1204)) (size!4323 (buf!4781 (_2!8662 lt!285322)))))))

(assert (=> d!63959 (= (isPrefixOf!0 thiss!1204 (_2!8662 lt!285322)) e!128315)))

(declare-fun b!185324 () Bool)

(declare-fun res!154241 () Bool)

(assert (=> b!185324 (=> (not res!154241) (not e!128315))))

(assert (=> b!185324 (= res!154241 (bvsle (bitIndex!0 (size!4323 (buf!4781 thiss!1204)) (currentByte!9021 thiss!1204) (currentBit!9016 thiss!1204)) (bitIndex!0 (size!4323 (buf!4781 (_2!8662 lt!285322))) (currentByte!9021 (_2!8662 lt!285322)) (currentBit!9016 (_2!8662 lt!285322)))))))

(declare-fun b!185325 () Bool)

(declare-fun e!128314 () Bool)

(assert (=> b!185325 (= e!128315 e!128314)))

(declare-fun res!154239 () Bool)

(assert (=> b!185325 (=> res!154239 e!128314)))

(assert (=> b!185325 (= res!154239 (= (size!4323 (buf!4781 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!185326 () Bool)

(assert (=> b!185326 (= e!128314 (arrayBitRangesEq!0 (buf!4781 thiss!1204) (buf!4781 (_2!8662 lt!285322)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4323 (buf!4781 thiss!1204)) (currentByte!9021 thiss!1204) (currentBit!9016 thiss!1204))))))

(assert (= (and d!63959 res!154240) b!185324))

(assert (= (and b!185324 res!154241) b!185325))

(assert (= (and b!185325 (not res!154239)) b!185326))

(assert (=> b!185324 m!287867))

(assert (=> b!185324 m!287857))

(assert (=> b!185326 m!287867))

(assert (=> b!185326 m!287867))

(declare-fun m!288067 () Bool)

(assert (=> b!185326 m!288067))

(assert (=> b!185224 d!63959))

(declare-fun d!63961 () Bool)

(assert (=> d!63961 (isPrefixOf!0 thiss!1204 (_2!8662 lt!285322))))

(declare-fun lt!285585 () Unit!13260)

(declare-fun choose!30 (BitStream!7754 BitStream!7754 BitStream!7754) Unit!13260)

(assert (=> d!63961 (= lt!285585 (choose!30 thiss!1204 (_2!8662 lt!285320) (_2!8662 lt!285322)))))

(assert (=> d!63961 (isPrefixOf!0 thiss!1204 (_2!8662 lt!285320))))

(assert (=> d!63961 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8662 lt!285320) (_2!8662 lt!285322)) lt!285585)))

(declare-fun bs!15923 () Bool)

(assert (= bs!15923 d!63961))

(assert (=> bs!15923 m!287859))

(declare-fun m!288069 () Bool)

(assert (=> bs!15923 m!288069))

(assert (=> bs!15923 m!287853))

(assert (=> b!185224 d!63961))

(declare-fun b!185460 () Bool)

(declare-fun e!128390 () Bool)

(declare-fun lt!286038 () tuple2!16038)

(declare-fun lt!286060 () tuple2!16032)

(assert (=> b!185460 (= e!128390 (= (_1!8664 lt!286038) (_2!8661 lt!286060)))))

(declare-fun b!185461 () Bool)

(declare-fun e!128391 () (_ BitVec 64))

(assert (=> b!185461 (= e!128391 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!185462 () Bool)

(declare-fun e!128393 () Bool)

(assert (=> b!185462 (= e!128393 e!128390)))

(declare-fun res!154353 () Bool)

(assert (=> b!185462 (=> (not res!154353) (not e!128390))))

(assert (=> b!185462 (= res!154353 (= (_2!8664 lt!286038) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!185462 (= lt!286038 (readNBitsLSBFirstsLoopPure!0 (_1!8661 lt!286060) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!286036 () Unit!13260)

(declare-fun lt!286055 () Unit!13260)

(assert (=> b!185462 (= lt!286036 lt!286055)))

(declare-fun lt!286053 () tuple2!16034)

(declare-fun lt!286058 () (_ BitVec 64))

(assert (=> b!185462 (validate_offset_bits!1 ((_ sign_extend 32) (size!4323 (buf!4781 (_2!8662 lt!286053)))) ((_ sign_extend 32) (currentByte!9021 (_2!8662 lt!285320))) ((_ sign_extend 32) (currentBit!9016 (_2!8662 lt!285320))) lt!286058)))

(assert (=> b!185462 (= lt!286055 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8662 lt!285320) (buf!4781 (_2!8662 lt!286053)) lt!286058))))

(declare-fun e!128394 () Bool)

(assert (=> b!185462 e!128394))

(declare-fun res!154349 () Bool)

(assert (=> b!185462 (=> (not res!154349) (not e!128394))))

(assert (=> b!185462 (= res!154349 (and (= (size!4323 (buf!4781 (_2!8662 lt!285320))) (size!4323 (buf!4781 (_2!8662 lt!286053)))) (bvsge lt!286058 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!185462 (= lt!286058 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!185462 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!185462 (= lt!286060 (reader!0 (_2!8662 lt!285320) (_2!8662 lt!286053)))))

(declare-fun b!185463 () Bool)

(declare-fun res!154348 () Bool)

(assert (=> b!185463 (=> (not res!154348) (not e!128393))))

(assert (=> b!185463 (= res!154348 (= (size!4323 (buf!4781 (_2!8662 lt!285320))) (size!4323 (buf!4781 (_2!8662 lt!286053)))))))

(declare-fun b!185464 () Bool)

(assert (=> b!185464 (= e!128394 (validate_offset_bits!1 ((_ sign_extend 32) (size!4323 (buf!4781 (_2!8662 lt!285320)))) ((_ sign_extend 32) (currentByte!9021 (_2!8662 lt!285320))) ((_ sign_extend 32) (currentBit!9016 (_2!8662 lt!285320))) lt!286058))))

(declare-fun d!63963 () Bool)

(assert (=> d!63963 e!128393))

(declare-fun res!154347 () Bool)

(assert (=> d!63963 (=> (not res!154347) (not e!128393))))

(assert (=> d!63963 (= res!154347 (invariant!0 (currentBit!9016 (_2!8662 lt!286053)) (currentByte!9021 (_2!8662 lt!286053)) (size!4323 (buf!4781 (_2!8662 lt!286053)))))))

(declare-fun e!128392 () tuple2!16034)

(assert (=> d!63963 (= lt!286053 e!128392)))

(declare-fun c!9475 () Bool)

(assert (=> d!63963 (= c!9475 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!63963 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!63963 (= (appendBitsLSBFirstLoopTR!0 (_2!8662 lt!285320) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!286053)))

(declare-fun b!185465 () Bool)

(declare-fun lt!286045 () tuple2!16034)

(assert (=> b!185465 (= e!128392 (tuple2!16035 (_1!8662 lt!286045) (_2!8662 lt!286045)))))

(declare-fun lt!286039 () Bool)

(assert (=> b!185465 (= lt!286039 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!286021 () tuple2!16034)

(assert (=> b!185465 (= lt!286021 (appendBit!0 (_2!8662 lt!285320) lt!286039))))

(declare-fun res!154356 () Bool)

(assert (=> b!185465 (= res!154356 (= (size!4323 (buf!4781 (_2!8662 lt!285320))) (size!4323 (buf!4781 (_2!8662 lt!286021)))))))

(declare-fun e!128396 () Bool)

(assert (=> b!185465 (=> (not res!154356) (not e!128396))))

(assert (=> b!185465 e!128396))

(declare-fun lt!286012 () tuple2!16034)

(assert (=> b!185465 (= lt!286012 lt!286021)))

(assert (=> b!185465 (= lt!286045 (appendBitsLSBFirstLoopTR!0 (_2!8662 lt!286012) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!286007 () Unit!13260)

(assert (=> b!185465 (= lt!286007 (lemmaIsPrefixTransitive!0 (_2!8662 lt!285320) (_2!8662 lt!286012) (_2!8662 lt!286045)))))

(assert (=> b!185465 (isPrefixOf!0 (_2!8662 lt!285320) (_2!8662 lt!286045))))

(declare-fun lt!286040 () Unit!13260)

(assert (=> b!185465 (= lt!286040 lt!286007)))

(assert (=> b!185465 (invariant!0 (currentBit!9016 (_2!8662 lt!285320)) (currentByte!9021 (_2!8662 lt!285320)) (size!4323 (buf!4781 (_2!8662 lt!286012))))))

(declare-fun lt!286037 () BitStream!7754)

(assert (=> b!185465 (= lt!286037 (BitStream!7755 (buf!4781 (_2!8662 lt!286012)) (currentByte!9021 (_2!8662 lt!285320)) (currentBit!9016 (_2!8662 lt!285320))))))

(assert (=> b!185465 (invariant!0 (currentBit!9016 lt!286037) (currentByte!9021 lt!286037) (size!4323 (buf!4781 (_2!8662 lt!286045))))))

(declare-fun lt!286017 () BitStream!7754)

(assert (=> b!185465 (= lt!286017 (BitStream!7755 (buf!4781 (_2!8662 lt!286045)) (currentByte!9021 lt!286037) (currentBit!9016 lt!286037)))))

(declare-fun lt!286044 () tuple2!16036)

(assert (=> b!185465 (= lt!286044 (readBitPure!0 lt!286037))))

(declare-fun lt!286047 () tuple2!16036)

(assert (=> b!185465 (= lt!286047 (readBitPure!0 lt!286017))))

(declare-fun lt!286026 () Unit!13260)

(assert (=> b!185465 (= lt!286026 (readBitPrefixLemma!0 lt!286037 (_2!8662 lt!286045)))))

(declare-fun res!154350 () Bool)

(assert (=> b!185465 (= res!154350 (= (bitIndex!0 (size!4323 (buf!4781 (_1!8663 lt!286044))) (currentByte!9021 (_1!8663 lt!286044)) (currentBit!9016 (_1!8663 lt!286044))) (bitIndex!0 (size!4323 (buf!4781 (_1!8663 lt!286047))) (currentByte!9021 (_1!8663 lt!286047)) (currentBit!9016 (_1!8663 lt!286047)))))))

(declare-fun e!128397 () Bool)

(assert (=> b!185465 (=> (not res!154350) (not e!128397))))

(assert (=> b!185465 e!128397))

(declare-fun lt!286024 () Unit!13260)

(assert (=> b!185465 (= lt!286024 lt!286026)))

(declare-fun lt!286011 () tuple2!16032)

(assert (=> b!185465 (= lt!286011 (reader!0 (_2!8662 lt!285320) (_2!8662 lt!286045)))))

(declare-fun lt!286033 () tuple2!16032)

(assert (=> b!185465 (= lt!286033 (reader!0 (_2!8662 lt!286012) (_2!8662 lt!286045)))))

(declare-fun lt!286051 () tuple2!16036)

(assert (=> b!185465 (= lt!286051 (readBitPure!0 (_1!8661 lt!286011)))))

(assert (=> b!185465 (= (_2!8663 lt!286051) lt!286039)))

(declare-fun lt!286028 () Unit!13260)

(declare-fun Unit!13277 () Unit!13260)

(assert (=> b!185465 (= lt!286028 Unit!13277)))

(declare-fun lt!286009 () (_ BitVec 64))

(assert (=> b!185465 (= lt!286009 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!286049 () (_ BitVec 64))

(assert (=> b!185465 (= lt!286049 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!286013 () Unit!13260)

(assert (=> b!185465 (= lt!286013 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8662 lt!285320) (buf!4781 (_2!8662 lt!286045)) lt!286049))))

(assert (=> b!185465 (validate_offset_bits!1 ((_ sign_extend 32) (size!4323 (buf!4781 (_2!8662 lt!286045)))) ((_ sign_extend 32) (currentByte!9021 (_2!8662 lt!285320))) ((_ sign_extend 32) (currentBit!9016 (_2!8662 lt!285320))) lt!286049)))

(declare-fun lt!286032 () Unit!13260)

(assert (=> b!185465 (= lt!286032 lt!286013)))

(declare-fun lt!286031 () tuple2!16038)

(assert (=> b!185465 (= lt!286031 (readNBitsLSBFirstsLoopPure!0 (_1!8661 lt!286011) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!286009))))

(declare-fun lt!286018 () (_ BitVec 64))

(assert (=> b!185465 (= lt!286018 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!286061 () Unit!13260)

(assert (=> b!185465 (= lt!286061 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8662 lt!286012) (buf!4781 (_2!8662 lt!286045)) lt!286018))))

(assert (=> b!185465 (validate_offset_bits!1 ((_ sign_extend 32) (size!4323 (buf!4781 (_2!8662 lt!286045)))) ((_ sign_extend 32) (currentByte!9021 (_2!8662 lt!286012))) ((_ sign_extend 32) (currentBit!9016 (_2!8662 lt!286012))) lt!286018)))

(declare-fun lt!286008 () Unit!13260)

(assert (=> b!185465 (= lt!286008 lt!286061)))

(declare-fun lt!286030 () tuple2!16038)

(assert (=> b!185465 (= lt!286030 (readNBitsLSBFirstsLoopPure!0 (_1!8661 lt!286033) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!286009 (ite (_2!8663 lt!286051) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

