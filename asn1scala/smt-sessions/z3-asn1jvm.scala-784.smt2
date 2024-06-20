; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22538 () Bool)

(assert start!22538)

(declare-fun b!113973 () Bool)

(declare-fun res!94150 () Bool)

(declare-fun e!74754 () Bool)

(assert (=> b!113973 (=> (not res!94150) (not e!74754))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-datatypes ((array!5176 0))(
  ( (array!5177 (arr!2944 (Array (_ BitVec 32) (_ BitVec 8))) (size!2351 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4176 0))(
  ( (BitStream!4177 (buf!2759 array!5176) (currentByte!5354 (_ BitVec 32)) (currentBit!5349 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4176)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!113973 (= res!94150 (validate_offset_bits!1 ((_ sign_extend 32) (size!2351 (buf!2759 thiss!1305))) ((_ sign_extend 32) (currentByte!5354 thiss!1305)) ((_ sign_extend 32) (currentBit!5349 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!113974 () Bool)

(declare-fun res!94154 () Bool)

(declare-fun e!74753 () Bool)

(assert (=> b!113974 (=> (not res!94154) (not e!74753))))

(declare-datatypes ((Unit!7005 0))(
  ( (Unit!7006) )
))
(declare-datatypes ((tuple2!9400 0))(
  ( (tuple2!9401 (_1!4962 Unit!7005) (_2!4962 BitStream!4176)) )
))
(declare-fun lt!173275 () tuple2!9400)

(declare-fun isPrefixOf!0 (BitStream!4176 BitStream!4176) Bool)

(assert (=> b!113974 (= res!94154 (isPrefixOf!0 thiss!1305 (_2!4962 lt!173275)))))

(declare-fun b!113975 () Bool)

(declare-fun e!74760 () Bool)

(declare-fun array_inv!2153 (array!5176) Bool)

(assert (=> b!113975 (= e!74760 (array_inv!2153 (buf!2759 thiss!1305)))))

(declare-fun res!94155 () Bool)

(assert (=> start!22538 (=> (not res!94155) (not e!74754))))

(assert (=> start!22538 (= res!94155 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22538 e!74754))

(assert (=> start!22538 true))

(declare-fun inv!12 (BitStream!4176) Bool)

(assert (=> start!22538 (and (inv!12 thiss!1305) e!74760)))

(declare-fun b!113976 () Bool)

(declare-fun e!74755 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!113976 (= e!74755 (invariant!0 (currentBit!5349 thiss!1305) (currentByte!5354 thiss!1305) (size!2351 (buf!2759 (_2!4962 lt!173275)))))))

(declare-fun b!113977 () Bool)

(declare-fun e!74756 () Bool)

(assert (=> b!113977 (= e!74756 e!74753)))

(declare-fun res!94148 () Bool)

(assert (=> b!113977 (=> (not res!94148) (not e!74753))))

(declare-fun lt!173273 () (_ BitVec 64))

(declare-fun lt!173272 () (_ BitVec 64))

(assert (=> b!113977 (= res!94148 (= lt!173273 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!173272)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!113977 (= lt!173273 (bitIndex!0 (size!2351 (buf!2759 (_2!4962 lt!173275))) (currentByte!5354 (_2!4962 lt!173275)) (currentBit!5349 (_2!4962 lt!173275))))))

(assert (=> b!113977 (= lt!173272 (bitIndex!0 (size!2351 (buf!2759 thiss!1305)) (currentByte!5354 thiss!1305) (currentBit!5349 thiss!1305)))))

(declare-fun b!113978 () Bool)

(declare-fun res!94151 () Bool)

(assert (=> b!113978 (=> (not res!94151) (not e!74754))))

(assert (=> b!113978 (= res!94151 (bvslt i!615 nBits!396))))

(declare-fun b!113979 () Bool)

(declare-fun e!74759 () Bool)

(assert (=> b!113979 (= e!74754 (not e!74759))))

(declare-fun res!94149 () Bool)

(assert (=> b!113979 (=> res!94149 e!74759)))

(declare-fun lt!173274 () tuple2!9400)

(assert (=> b!113979 (= res!94149 (not (= (size!2351 (buf!2759 (_2!4962 lt!173275))) (size!2351 (buf!2759 (_2!4962 lt!173274))))))))

(assert (=> b!113979 e!74755))

(declare-fun res!94152 () Bool)

(assert (=> b!113979 (=> (not res!94152) (not e!74755))))

(assert (=> b!113979 (= res!94152 (isPrefixOf!0 thiss!1305 (_2!4962 lt!173274)))))

(declare-fun lt!173270 () Unit!7005)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4176 BitStream!4176 BitStream!4176) Unit!7005)

(assert (=> b!113979 (= lt!173270 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4962 lt!173275) (_2!4962 lt!173274)))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4176 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9400)

(assert (=> b!113979 (= lt!173274 (appendNLeastSignificantBitsLoop!0 (_2!4962 lt!173275) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!113979 e!74756))

(declare-fun res!94153 () Bool)

(assert (=> b!113979 (=> (not res!94153) (not e!74756))))

(assert (=> b!113979 (= res!94153 (= (size!2351 (buf!2759 thiss!1305)) (size!2351 (buf!2759 (_2!4962 lt!173275)))))))

(declare-fun lt!173271 () Bool)

(declare-fun appendBit!0 (BitStream!4176 Bool) tuple2!9400)

(assert (=> b!113979 (= lt!173275 (appendBit!0 thiss!1305 lt!173271))))

(assert (=> b!113979 (= lt!173271 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!113980 () Bool)

(declare-fun res!94156 () Bool)

(assert (=> b!113980 (=> (not res!94156) (not e!74754))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!113980 (= res!94156 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!113981 () Bool)

(declare-fun e!74758 () Bool)

(declare-datatypes ((tuple2!9402 0))(
  ( (tuple2!9403 (_1!4963 BitStream!4176) (_2!4963 Bool)) )
))
(declare-fun lt!173276 () tuple2!9402)

(assert (=> b!113981 (= e!74758 (= (bitIndex!0 (size!2351 (buf!2759 (_1!4963 lt!173276))) (currentByte!5354 (_1!4963 lt!173276)) (currentBit!5349 (_1!4963 lt!173276))) lt!173273))))

(declare-fun b!113982 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!113982 (= e!74759 (validate_offset_bit!0 ((_ sign_extend 32) (size!2351 (buf!2759 (_2!4962 lt!173275)))) ((_ sign_extend 32) (currentByte!5354 thiss!1305)) ((_ sign_extend 32) (currentBit!5349 thiss!1305))))))

(declare-fun b!113983 () Bool)

(assert (=> b!113983 (= e!74753 e!74758)))

(declare-fun res!94157 () Bool)

(assert (=> b!113983 (=> (not res!94157) (not e!74758))))

(assert (=> b!113983 (= res!94157 (and (= (_2!4963 lt!173276) lt!173271) (= (_1!4963 lt!173276) (_2!4962 lt!173275))))))

(declare-fun readBitPure!0 (BitStream!4176) tuple2!9402)

(declare-fun readerFrom!0 (BitStream!4176 (_ BitVec 32) (_ BitVec 32)) BitStream!4176)

(assert (=> b!113983 (= lt!173276 (readBitPure!0 (readerFrom!0 (_2!4962 lt!173275) (currentBit!5349 thiss!1305) (currentByte!5354 thiss!1305))))))

(assert (= (and start!22538 res!94155) b!113973))

(assert (= (and b!113973 res!94150) b!113980))

(assert (= (and b!113980 res!94156) b!113978))

(assert (= (and b!113978 res!94151) b!113979))

(assert (= (and b!113979 res!94153) b!113977))

(assert (= (and b!113977 res!94148) b!113974))

(assert (= (and b!113974 res!94154) b!113983))

(assert (= (and b!113983 res!94157) b!113981))

(assert (= (and b!113979 res!94152) b!113976))

(assert (= (and b!113979 (not res!94149)) b!113982))

(assert (= start!22538 b!113975))

(declare-fun m!170223 () Bool)

(assert (=> b!113980 m!170223))

(declare-fun m!170225 () Bool)

(assert (=> b!113973 m!170225))

(declare-fun m!170227 () Bool)

(assert (=> b!113981 m!170227))

(declare-fun m!170229 () Bool)

(assert (=> b!113977 m!170229))

(declare-fun m!170231 () Bool)

(assert (=> b!113977 m!170231))

(declare-fun m!170233 () Bool)

(assert (=> b!113974 m!170233))

(declare-fun m!170235 () Bool)

(assert (=> b!113979 m!170235))

(declare-fun m!170237 () Bool)

(assert (=> b!113979 m!170237))

(declare-fun m!170239 () Bool)

(assert (=> b!113979 m!170239))

(declare-fun m!170241 () Bool)

(assert (=> b!113979 m!170241))

(declare-fun m!170243 () Bool)

(assert (=> b!113982 m!170243))

(declare-fun m!170245 () Bool)

(assert (=> start!22538 m!170245))

(declare-fun m!170247 () Bool)

(assert (=> b!113975 m!170247))

(declare-fun m!170249 () Bool)

(assert (=> b!113983 m!170249))

(assert (=> b!113983 m!170249))

(declare-fun m!170251 () Bool)

(assert (=> b!113983 m!170251))

(declare-fun m!170253 () Bool)

(assert (=> b!113976 m!170253))

(check-sat (not b!113983) (not b!113975) (not b!113980) (not start!22538) (not b!113977) (not b!113973) (not b!113979) (not b!113976) (not b!113982) (not b!113974) (not b!113981))
(check-sat)
(get-model)

(declare-fun d!36578 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!36578 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2351 (buf!2759 thiss!1305))) ((_ sign_extend 32) (currentByte!5354 thiss!1305)) ((_ sign_extend 32) (currentBit!5349 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2351 (buf!2759 thiss!1305))) ((_ sign_extend 32) (currentByte!5354 thiss!1305)) ((_ sign_extend 32) (currentBit!5349 thiss!1305))) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun bs!8886 () Bool)

(assert (= bs!8886 d!36578))

(declare-fun m!170287 () Bool)

(assert (=> bs!8886 m!170287))

(assert (=> b!113973 d!36578))

(declare-fun d!36580 () Bool)

(declare-fun res!94195 () Bool)

(declare-fun e!74789 () Bool)

(assert (=> d!36580 (=> (not res!94195) (not e!74789))))

(assert (=> d!36580 (= res!94195 (= (size!2351 (buf!2759 thiss!1305)) (size!2351 (buf!2759 (_2!4962 lt!173274)))))))

(assert (=> d!36580 (= (isPrefixOf!0 thiss!1305 (_2!4962 lt!173274)) e!74789)))

(declare-fun b!114023 () Bool)

(declare-fun res!94196 () Bool)

(assert (=> b!114023 (=> (not res!94196) (not e!74789))))

(assert (=> b!114023 (= res!94196 (bvsle (bitIndex!0 (size!2351 (buf!2759 thiss!1305)) (currentByte!5354 thiss!1305) (currentBit!5349 thiss!1305)) (bitIndex!0 (size!2351 (buf!2759 (_2!4962 lt!173274))) (currentByte!5354 (_2!4962 lt!173274)) (currentBit!5349 (_2!4962 lt!173274)))))))

(declare-fun b!114024 () Bool)

(declare-fun e!74790 () Bool)

(assert (=> b!114024 (= e!74789 e!74790)))

(declare-fun res!94194 () Bool)

(assert (=> b!114024 (=> res!94194 e!74790)))

(assert (=> b!114024 (= res!94194 (= (size!2351 (buf!2759 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!114025 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5176 array!5176 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!114025 (= e!74790 (arrayBitRangesEq!0 (buf!2759 thiss!1305) (buf!2759 (_2!4962 lt!173274)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2351 (buf!2759 thiss!1305)) (currentByte!5354 thiss!1305) (currentBit!5349 thiss!1305))))))

(assert (= (and d!36580 res!94195) b!114023))

(assert (= (and b!114023 res!94196) b!114024))

(assert (= (and b!114024 (not res!94194)) b!114025))

(assert (=> b!114023 m!170231))

(declare-fun m!170289 () Bool)

(assert (=> b!114023 m!170289))

(assert (=> b!114025 m!170231))

(assert (=> b!114025 m!170231))

(declare-fun m!170291 () Bool)

(assert (=> b!114025 m!170291))

(assert (=> b!113979 d!36580))

(declare-fun d!36582 () Bool)

(assert (=> d!36582 (isPrefixOf!0 thiss!1305 (_2!4962 lt!173274))))

(declare-fun lt!173300 () Unit!7005)

(declare-fun choose!30 (BitStream!4176 BitStream!4176 BitStream!4176) Unit!7005)

(assert (=> d!36582 (= lt!173300 (choose!30 thiss!1305 (_2!4962 lt!173275) (_2!4962 lt!173274)))))

(assert (=> d!36582 (isPrefixOf!0 thiss!1305 (_2!4962 lt!173275))))

(assert (=> d!36582 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4962 lt!173275) (_2!4962 lt!173274)) lt!173300)))

(declare-fun bs!8887 () Bool)

(assert (= bs!8887 d!36582))

(assert (=> bs!8887 m!170235))

(declare-fun m!170293 () Bool)

(assert (=> bs!8887 m!170293))

(assert (=> bs!8887 m!170233))

(assert (=> b!113979 d!36582))

(declare-fun b!114084 () Bool)

(declare-fun e!74830 () Bool)

(declare-fun lt!173441 () (_ BitVec 64))

(assert (=> b!114084 (= e!74830 (validate_offset_bits!1 ((_ sign_extend 32) (size!2351 (buf!2759 (_2!4962 lt!173275)))) ((_ sign_extend 32) (currentByte!5354 (_2!4962 lt!173275))) ((_ sign_extend 32) (currentBit!5349 (_2!4962 lt!173275))) lt!173441))))

(declare-fun b!114085 () Bool)

(declare-fun res!94249 () Bool)

(declare-fun e!74829 () Bool)

(assert (=> b!114085 (=> (not res!94249) (not e!74829))))

(declare-fun lt!173459 () tuple2!9400)

(declare-fun lt!173470 () (_ BitVec 64))

(declare-fun lt!173461 () (_ BitVec 64))

(assert (=> b!114085 (= res!94249 (= (bitIndex!0 (size!2351 (buf!2759 (_2!4962 lt!173459))) (currentByte!5354 (_2!4962 lt!173459)) (currentBit!5349 (_2!4962 lt!173459))) (bvadd lt!173461 lt!173470)))))

(assert (=> b!114085 (or (not (= (bvand lt!173461 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!173470 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!173461 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!173461 lt!173470) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!114085 (= lt!173470 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!114085 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!114085 (= lt!173461 (bitIndex!0 (size!2351 (buf!2759 (_2!4962 lt!173275))) (currentByte!5354 (_2!4962 lt!173275)) (currentBit!5349 (_2!4962 lt!173275))))))

(declare-fun b!114086 () Bool)

(declare-fun e!74833 () Bool)

(declare-fun lt!173431 () tuple2!9402)

(declare-fun lt!173436 () tuple2!9402)

(assert (=> b!114086 (= e!74833 (= (_2!4963 lt!173431) (_2!4963 lt!173436)))))

(declare-fun b!114087 () Bool)

(declare-fun res!94255 () Bool)

(declare-fun lt!173438 () tuple2!9400)

(assert (=> b!114087 (= res!94255 (isPrefixOf!0 (_2!4962 lt!173275) (_2!4962 lt!173438)))))

(declare-fun e!74831 () Bool)

(assert (=> b!114087 (=> (not res!94255) (not e!74831))))

(declare-fun b!114088 () Bool)

(declare-fun e!74832 () tuple2!9400)

(declare-fun lt!173440 () Unit!7005)

(assert (=> b!114088 (= e!74832 (tuple2!9401 lt!173440 (_2!4962 lt!173275)))))

(declare-fun lt!173467 () BitStream!4176)

(assert (=> b!114088 (= lt!173467 (_2!4962 lt!173275))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4176) Unit!7005)

(assert (=> b!114088 (= lt!173440 (lemmaIsPrefixRefl!0 lt!173467))))

(declare-fun call!1460 () Bool)

(assert (=> b!114088 call!1460))

(declare-datatypes ((tuple2!9408 0))(
  ( (tuple2!9409 (_1!4966 BitStream!4176) (_2!4966 (_ BitVec 64))) )
))
(declare-fun lt!173432 () tuple2!9408)

(declare-fun b!114089 () Bool)

(declare-datatypes ((tuple2!9410 0))(
  ( (tuple2!9411 (_1!4967 BitStream!4176) (_2!4967 BitStream!4176)) )
))
(declare-fun lt!173448 () tuple2!9410)

(assert (=> b!114089 (= e!74829 (and (= (_2!4966 lt!173432) v!199) (= (_1!4966 lt!173432) (_2!4967 lt!173448))))))

(declare-fun lt!173457 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4176 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9408)

(assert (=> b!114089 (= lt!173432 (readNLeastSignificantBitsLoopPure!0 (_1!4967 lt!173448) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!173457))))

(declare-fun lt!173439 () Unit!7005)

(declare-fun lt!173429 () Unit!7005)

(assert (=> b!114089 (= lt!173439 lt!173429)))

(assert (=> b!114089 (validate_offset_bits!1 ((_ sign_extend 32) (size!2351 (buf!2759 (_2!4962 lt!173459)))) ((_ sign_extend 32) (currentByte!5354 (_2!4962 lt!173275))) ((_ sign_extend 32) (currentBit!5349 (_2!4962 lt!173275))) lt!173441)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4176 array!5176 (_ BitVec 64)) Unit!7005)

(assert (=> b!114089 (= lt!173429 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4962 lt!173275) (buf!2759 (_2!4962 lt!173459)) lt!173441))))

(assert (=> b!114089 e!74830))

(declare-fun res!94253 () Bool)

(assert (=> b!114089 (=> (not res!94253) (not e!74830))))

(assert (=> b!114089 (= res!94253 (and (= (size!2351 (buf!2759 (_2!4962 lt!173275))) (size!2351 (buf!2759 (_2!4962 lt!173459)))) (bvsge lt!173441 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!114089 (= lt!173441 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!114089 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!114089 (= lt!173457 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!114089 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(declare-fun reader!0 (BitStream!4176 BitStream!4176) tuple2!9410)

(assert (=> b!114089 (= lt!173448 (reader!0 (_2!4962 lt!173275) (_2!4962 lt!173459)))))

(declare-fun b!114090 () Bool)

(declare-fun res!94257 () Bool)

(assert (=> b!114090 (=> (not res!94257) (not e!74829))))

(assert (=> b!114090 (= res!94257 (isPrefixOf!0 (_2!4962 lt!173275) (_2!4962 lt!173459)))))

(declare-fun b!114091 () Bool)

(declare-fun e!74827 () (_ BitVec 64))

(assert (=> b!114091 (= e!74827 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!114092 () Bool)

(assert (=> b!114092 (= e!74827 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun d!36584 () Bool)

(assert (=> d!36584 e!74829))

(declare-fun res!94254 () Bool)

(assert (=> d!36584 (=> (not res!94254) (not e!74829))))

(assert (=> d!36584 (= res!94254 (= (size!2351 (buf!2759 (_2!4962 lt!173275))) (size!2351 (buf!2759 (_2!4962 lt!173459)))))))

(assert (=> d!36584 (= lt!173459 e!74832)))

(declare-fun c!6913 () Bool)

(assert (=> d!36584 (= c!6913 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!36584 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!36584 (= (appendNLeastSignificantBitsLoop!0 (_2!4962 lt!173275) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!173459)))

(declare-fun b!114093 () Bool)

(declare-fun res!94252 () Bool)

(assert (=> b!114093 (= res!94252 (= (bitIndex!0 (size!2351 (buf!2759 (_2!4962 lt!173438))) (currentByte!5354 (_2!4962 lt!173438)) (currentBit!5349 (_2!4962 lt!173438))) (bvadd (bitIndex!0 (size!2351 (buf!2759 (_2!4962 lt!173275))) (currentByte!5354 (_2!4962 lt!173275)) (currentBit!5349 (_2!4962 lt!173275))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!114093 (=> (not res!94252) (not e!74831))))

(declare-fun b!114094 () Bool)

(declare-fun lt!173450 () tuple2!9402)

(assert (=> b!114094 (= lt!173450 (readBitPure!0 (readerFrom!0 (_2!4962 lt!173438) (currentBit!5349 (_2!4962 lt!173275)) (currentByte!5354 (_2!4962 lt!173275)))))))

(declare-fun lt!173468 () Bool)

(declare-fun res!94251 () Bool)

(assert (=> b!114094 (= res!94251 (and (= (_2!4963 lt!173450) lt!173468) (= (_1!4963 lt!173450) (_2!4962 lt!173438))))))

(declare-fun e!74828 () Bool)

(assert (=> b!114094 (=> (not res!94251) (not e!74828))))

(assert (=> b!114094 (= e!74831 e!74828)))

(declare-fun b!114095 () Bool)

(assert (=> b!114095 (= e!74828 (= (bitIndex!0 (size!2351 (buf!2759 (_1!4963 lt!173450))) (currentByte!5354 (_1!4963 lt!173450)) (currentBit!5349 (_1!4963 lt!173450))) (bitIndex!0 (size!2351 (buf!2759 (_2!4962 lt!173438))) (currentByte!5354 (_2!4962 lt!173438)) (currentBit!5349 (_2!4962 lt!173438)))))))

(declare-fun lt!173449 () tuple2!9400)

(declare-fun bm!1457 () Bool)

(assert (=> bm!1457 (= call!1460 (isPrefixOf!0 (ite c!6913 (_2!4962 lt!173275) lt!173467) (ite c!6913 (_2!4962 lt!173449) lt!173467)))))

(declare-fun b!114096 () Bool)

(declare-fun Unit!7009 () Unit!7005)

(assert (=> b!114096 (= e!74832 (tuple2!9401 Unit!7009 (_2!4962 lt!173449)))))

(assert (=> b!114096 (= lt!173468 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!114096 (= lt!173438 (appendBit!0 (_2!4962 lt!173275) lt!173468))))

(declare-fun res!94250 () Bool)

(assert (=> b!114096 (= res!94250 (= (size!2351 (buf!2759 (_2!4962 lt!173275))) (size!2351 (buf!2759 (_2!4962 lt!173438)))))))

(assert (=> b!114096 (=> (not res!94250) (not e!74831))))

(assert (=> b!114096 e!74831))

(declare-fun lt!173454 () tuple2!9400)

(assert (=> b!114096 (= lt!173454 lt!173438)))

(assert (=> b!114096 (= lt!173449 (appendNLeastSignificantBitsLoop!0 (_2!4962 lt!173454) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!173458 () Unit!7005)

(assert (=> b!114096 (= lt!173458 (lemmaIsPrefixTransitive!0 (_2!4962 lt!173275) (_2!4962 lt!173454) (_2!4962 lt!173449)))))

(assert (=> b!114096 call!1460))

(declare-fun lt!173437 () Unit!7005)

(assert (=> b!114096 (= lt!173437 lt!173458)))

(assert (=> b!114096 (invariant!0 (currentBit!5349 (_2!4962 lt!173275)) (currentByte!5354 (_2!4962 lt!173275)) (size!2351 (buf!2759 (_2!4962 lt!173454))))))

(declare-fun lt!173435 () BitStream!4176)

(assert (=> b!114096 (= lt!173435 (BitStream!4177 (buf!2759 (_2!4962 lt!173454)) (currentByte!5354 (_2!4962 lt!173275)) (currentBit!5349 (_2!4962 lt!173275))))))

(assert (=> b!114096 (invariant!0 (currentBit!5349 lt!173435) (currentByte!5354 lt!173435) (size!2351 (buf!2759 (_2!4962 lt!173449))))))

(declare-fun lt!173446 () BitStream!4176)

(assert (=> b!114096 (= lt!173446 (BitStream!4177 (buf!2759 (_2!4962 lt!173449)) (currentByte!5354 lt!173435) (currentBit!5349 lt!173435)))))

(assert (=> b!114096 (= lt!173431 (readBitPure!0 lt!173435))))

(assert (=> b!114096 (= lt!173436 (readBitPure!0 lt!173446))))

(declare-fun lt!173428 () Unit!7005)

(declare-fun readBitPrefixLemma!0 (BitStream!4176 BitStream!4176) Unit!7005)

(assert (=> b!114096 (= lt!173428 (readBitPrefixLemma!0 lt!173435 (_2!4962 lt!173449)))))

(declare-fun res!94256 () Bool)

(assert (=> b!114096 (= res!94256 (= (bitIndex!0 (size!2351 (buf!2759 (_1!4963 lt!173431))) (currentByte!5354 (_1!4963 lt!173431)) (currentBit!5349 (_1!4963 lt!173431))) (bitIndex!0 (size!2351 (buf!2759 (_1!4963 lt!173436))) (currentByte!5354 (_1!4963 lt!173436)) (currentBit!5349 (_1!4963 lt!173436)))))))

(assert (=> b!114096 (=> (not res!94256) (not e!74833))))

(assert (=> b!114096 e!74833))

(declare-fun lt!173466 () Unit!7005)

(assert (=> b!114096 (= lt!173466 lt!173428)))

(declare-fun lt!173463 () tuple2!9410)

(assert (=> b!114096 (= lt!173463 (reader!0 (_2!4962 lt!173275) (_2!4962 lt!173449)))))

(declare-fun lt!173447 () tuple2!9410)

(assert (=> b!114096 (= lt!173447 (reader!0 (_2!4962 lt!173454) (_2!4962 lt!173449)))))

(declare-fun lt!173465 () tuple2!9402)

(assert (=> b!114096 (= lt!173465 (readBitPure!0 (_1!4967 lt!173463)))))

(assert (=> b!114096 (= (_2!4963 lt!173465) lt!173468)))

(declare-fun lt!173462 () Unit!7005)

(declare-fun Unit!7010 () Unit!7005)

(assert (=> b!114096 (= lt!173462 Unit!7010)))

(declare-fun lt!173443 () (_ BitVec 64))

(assert (=> b!114096 (= lt!173443 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!173471 () (_ BitVec 64))

(assert (=> b!114096 (= lt!173471 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!173453 () Unit!7005)

(assert (=> b!114096 (= lt!173453 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4962 lt!173275) (buf!2759 (_2!4962 lt!173449)) lt!173471))))

(assert (=> b!114096 (validate_offset_bits!1 ((_ sign_extend 32) (size!2351 (buf!2759 (_2!4962 lt!173449)))) ((_ sign_extend 32) (currentByte!5354 (_2!4962 lt!173275))) ((_ sign_extend 32) (currentBit!5349 (_2!4962 lt!173275))) lt!173471)))

(declare-fun lt!173433 () Unit!7005)

(assert (=> b!114096 (= lt!173433 lt!173453)))

(declare-fun lt!173442 () tuple2!9408)

(assert (=> b!114096 (= lt!173442 (readNLeastSignificantBitsLoopPure!0 (_1!4967 lt!173463) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!173443))))

(declare-fun lt!173445 () (_ BitVec 64))

(assert (=> b!114096 (= lt!173445 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!173434 () Unit!7005)

(assert (=> b!114096 (= lt!173434 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4962 lt!173454) (buf!2759 (_2!4962 lt!173449)) lt!173445))))

(assert (=> b!114096 (validate_offset_bits!1 ((_ sign_extend 32) (size!2351 (buf!2759 (_2!4962 lt!173449)))) ((_ sign_extend 32) (currentByte!5354 (_2!4962 lt!173454))) ((_ sign_extend 32) (currentBit!5349 (_2!4962 lt!173454))) lt!173445)))

(declare-fun lt!173430 () Unit!7005)

(assert (=> b!114096 (= lt!173430 lt!173434)))

(declare-fun lt!173456 () tuple2!9408)

(assert (=> b!114096 (= lt!173456 (readNLeastSignificantBitsLoopPure!0 (_1!4967 lt!173447) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!173443 (ite (_2!4963 lt!173465) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!173452 () tuple2!9408)

(assert (=> b!114096 (= lt!173452 (readNLeastSignificantBitsLoopPure!0 (_1!4967 lt!173463) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!173443))))

(declare-fun c!6912 () Bool)

(assert (=> b!114096 (= c!6912 (_2!4963 (readBitPure!0 (_1!4967 lt!173463))))))

(declare-fun lt!173444 () tuple2!9408)

(declare-fun withMovedBitIndex!0 (BitStream!4176 (_ BitVec 64)) BitStream!4176)

(assert (=> b!114096 (= lt!173444 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4967 lt!173463) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!173443 e!74827)))))

(declare-fun lt!173455 () Unit!7005)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4176 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7005)

(assert (=> b!114096 (= lt!173455 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4967 lt!173463) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!173443))))

(assert (=> b!114096 (and (= (_2!4966 lt!173452) (_2!4966 lt!173444)) (= (_1!4966 lt!173452) (_1!4966 lt!173444)))))

(declare-fun lt!173460 () Unit!7005)

(assert (=> b!114096 (= lt!173460 lt!173455)))

(assert (=> b!114096 (= (_1!4967 lt!173463) (withMovedBitIndex!0 (_2!4967 lt!173463) (bvsub (bitIndex!0 (size!2351 (buf!2759 (_2!4962 lt!173275))) (currentByte!5354 (_2!4962 lt!173275)) (currentBit!5349 (_2!4962 lt!173275))) (bitIndex!0 (size!2351 (buf!2759 (_2!4962 lt!173449))) (currentByte!5354 (_2!4962 lt!173449)) (currentBit!5349 (_2!4962 lt!173449))))))))

(declare-fun lt!173464 () Unit!7005)

(declare-fun Unit!7011 () Unit!7005)

(assert (=> b!114096 (= lt!173464 Unit!7011)))

(assert (=> b!114096 (= (_1!4967 lt!173447) (withMovedBitIndex!0 (_2!4967 lt!173447) (bvsub (bitIndex!0 (size!2351 (buf!2759 (_2!4962 lt!173454))) (currentByte!5354 (_2!4962 lt!173454)) (currentBit!5349 (_2!4962 lt!173454))) (bitIndex!0 (size!2351 (buf!2759 (_2!4962 lt!173449))) (currentByte!5354 (_2!4962 lt!173449)) (currentBit!5349 (_2!4962 lt!173449))))))))

(declare-fun lt!173469 () Unit!7005)

(declare-fun Unit!7012 () Unit!7005)

(assert (=> b!114096 (= lt!173469 Unit!7012)))

(assert (=> b!114096 (= (bitIndex!0 (size!2351 (buf!2759 (_2!4962 lt!173275))) (currentByte!5354 (_2!4962 lt!173275)) (currentBit!5349 (_2!4962 lt!173275))) (bvsub (bitIndex!0 (size!2351 (buf!2759 (_2!4962 lt!173454))) (currentByte!5354 (_2!4962 lt!173454)) (currentBit!5349 (_2!4962 lt!173454))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!173451 () Unit!7005)

(declare-fun Unit!7013 () Unit!7005)

(assert (=> b!114096 (= lt!173451 Unit!7013)))

(assert (=> b!114096 (= (_2!4966 lt!173442) (_2!4966 lt!173456))))

(declare-fun lt!173427 () Unit!7005)

(declare-fun Unit!7014 () Unit!7005)

(assert (=> b!114096 (= lt!173427 Unit!7014)))

(assert (=> b!114096 (= (_1!4966 lt!173442) (_2!4967 lt!173463))))

(assert (= (and d!36584 c!6913) b!114096))

(assert (= (and d!36584 (not c!6913)) b!114088))

(assert (= (and b!114096 res!94250) b!114093))

(assert (= (and b!114093 res!94252) b!114087))

(assert (= (and b!114087 res!94255) b!114094))

(assert (= (and b!114094 res!94251) b!114095))

(assert (= (and b!114096 res!94256) b!114086))

(assert (= (and b!114096 c!6912) b!114092))

(assert (= (and b!114096 (not c!6912)) b!114091))

(assert (= (or b!114096 b!114088) bm!1457))

(assert (= (and d!36584 res!94254) b!114085))

(assert (= (and b!114085 res!94249) b!114090))

(assert (= (and b!114090 res!94257) b!114089))

(assert (= (and b!114089 res!94253) b!114084))

(declare-fun m!170327 () Bool)

(assert (=> b!114088 m!170327))

(declare-fun m!170329 () Bool)

(assert (=> b!114096 m!170329))

(declare-fun m!170331 () Bool)

(assert (=> b!114096 m!170331))

(declare-fun m!170333 () Bool)

(assert (=> b!114096 m!170333))

(declare-fun m!170335 () Bool)

(assert (=> b!114096 m!170335))

(declare-fun m!170337 () Bool)

(assert (=> b!114096 m!170337))

(declare-fun m!170339 () Bool)

(assert (=> b!114096 m!170339))

(declare-fun m!170341 () Bool)

(assert (=> b!114096 m!170341))

(declare-fun m!170343 () Bool)

(assert (=> b!114096 m!170343))

(declare-fun m!170345 () Bool)

(assert (=> b!114096 m!170345))

(assert (=> b!114096 m!170337))

(declare-fun m!170347 () Bool)

(assert (=> b!114096 m!170347))

(declare-fun m!170349 () Bool)

(assert (=> b!114096 m!170349))

(declare-fun m!170351 () Bool)

(assert (=> b!114096 m!170351))

(declare-fun m!170353 () Bool)

(assert (=> b!114096 m!170353))

(declare-fun m!170355 () Bool)

(assert (=> b!114096 m!170355))

(declare-fun m!170357 () Bool)

(assert (=> b!114096 m!170357))

(declare-fun m!170359 () Bool)

(assert (=> b!114096 m!170359))

(declare-fun m!170361 () Bool)

(assert (=> b!114096 m!170361))

(declare-fun m!170363 () Bool)

(assert (=> b!114096 m!170363))

(declare-fun m!170365 () Bool)

(assert (=> b!114096 m!170365))

(assert (=> b!114096 m!170229))

(declare-fun m!170367 () Bool)

(assert (=> b!114096 m!170367))

(declare-fun m!170369 () Bool)

(assert (=> b!114096 m!170369))

(declare-fun m!170371 () Bool)

(assert (=> b!114096 m!170371))

(declare-fun m!170373 () Bool)

(assert (=> b!114096 m!170373))

(declare-fun m!170375 () Bool)

(assert (=> b!114096 m!170375))

(declare-fun m!170377 () Bool)

(assert (=> b!114096 m!170377))

(declare-fun m!170379 () Bool)

(assert (=> b!114096 m!170379))

(declare-fun m!170381 () Bool)

(assert (=> b!114096 m!170381))

(declare-fun m!170383 () Bool)

(assert (=> b!114094 m!170383))

(assert (=> b!114094 m!170383))

(declare-fun m!170385 () Bool)

(assert (=> b!114094 m!170385))

(declare-fun m!170387 () Bool)

(assert (=> b!114090 m!170387))

(declare-fun m!170389 () Bool)

(assert (=> b!114085 m!170389))

(assert (=> b!114085 m!170229))

(declare-fun m!170391 () Bool)

(assert (=> b!114087 m!170391))

(declare-fun m!170393 () Bool)

(assert (=> b!114095 m!170393))

(declare-fun m!170395 () Bool)

(assert (=> b!114095 m!170395))

(declare-fun m!170397 () Bool)

(assert (=> b!114089 m!170397))

(declare-fun m!170399 () Bool)

(assert (=> b!114089 m!170399))

(declare-fun m!170401 () Bool)

(assert (=> b!114089 m!170401))

(declare-fun m!170403 () Bool)

(assert (=> b!114089 m!170403))

(assert (=> b!114089 m!170349))

(declare-fun m!170405 () Bool)

(assert (=> b!114084 m!170405))

(declare-fun m!170407 () Bool)

(assert (=> bm!1457 m!170407))

(assert (=> b!114093 m!170395))

(assert (=> b!114093 m!170229))

(assert (=> b!113979 d!36584))

(declare-fun b!114109 () Bool)

(declare-fun e!74839 () Bool)

(declare-fun lt!173480 () tuple2!9402)

(declare-fun lt!173482 () tuple2!9400)

(assert (=> b!114109 (= e!74839 (= (bitIndex!0 (size!2351 (buf!2759 (_1!4963 lt!173480))) (currentByte!5354 (_1!4963 lt!173480)) (currentBit!5349 (_1!4963 lt!173480))) (bitIndex!0 (size!2351 (buf!2759 (_2!4962 lt!173482))) (currentByte!5354 (_2!4962 lt!173482)) (currentBit!5349 (_2!4962 lt!173482)))))))

(declare-fun b!114106 () Bool)

(declare-fun res!94269 () Bool)

(declare-fun e!74838 () Bool)

(assert (=> b!114106 (=> (not res!94269) (not e!74838))))

(declare-fun lt!173481 () (_ BitVec 64))

(declare-fun lt!173483 () (_ BitVec 64))

(assert (=> b!114106 (= res!94269 (= (bitIndex!0 (size!2351 (buf!2759 (_2!4962 lt!173482))) (currentByte!5354 (_2!4962 lt!173482)) (currentBit!5349 (_2!4962 lt!173482))) (bvadd lt!173483 lt!173481)))))

(assert (=> b!114106 (or (not (= (bvand lt!173483 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!173481 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!173483 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!173483 lt!173481) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!114106 (= lt!173481 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!114106 (= lt!173483 (bitIndex!0 (size!2351 (buf!2759 thiss!1305)) (currentByte!5354 thiss!1305) (currentBit!5349 thiss!1305)))))

(declare-fun d!36628 () Bool)

(assert (=> d!36628 e!74838))

(declare-fun res!94267 () Bool)

(assert (=> d!36628 (=> (not res!94267) (not e!74838))))

(assert (=> d!36628 (= res!94267 (= (size!2351 (buf!2759 thiss!1305)) (size!2351 (buf!2759 (_2!4962 lt!173482)))))))

(declare-fun choose!16 (BitStream!4176 Bool) tuple2!9400)

(assert (=> d!36628 (= lt!173482 (choose!16 thiss!1305 lt!173271))))

(assert (=> d!36628 (validate_offset_bit!0 ((_ sign_extend 32) (size!2351 (buf!2759 thiss!1305))) ((_ sign_extend 32) (currentByte!5354 thiss!1305)) ((_ sign_extend 32) (currentBit!5349 thiss!1305)))))

(assert (=> d!36628 (= (appendBit!0 thiss!1305 lt!173271) lt!173482)))

(declare-fun b!114108 () Bool)

(assert (=> b!114108 (= e!74838 e!74839)))

(declare-fun res!94268 () Bool)

(assert (=> b!114108 (=> (not res!94268) (not e!74839))))

(assert (=> b!114108 (= res!94268 (and (= (_2!4963 lt!173480) lt!173271) (= (_1!4963 lt!173480) (_2!4962 lt!173482))))))

(assert (=> b!114108 (= lt!173480 (readBitPure!0 (readerFrom!0 (_2!4962 lt!173482) (currentBit!5349 thiss!1305) (currentByte!5354 thiss!1305))))))

(declare-fun b!114107 () Bool)

(declare-fun res!94266 () Bool)

(assert (=> b!114107 (=> (not res!94266) (not e!74838))))

(assert (=> b!114107 (= res!94266 (isPrefixOf!0 thiss!1305 (_2!4962 lt!173482)))))

(assert (= (and d!36628 res!94267) b!114106))

(assert (= (and b!114106 res!94269) b!114107))

(assert (= (and b!114107 res!94266) b!114108))

(assert (= (and b!114108 res!94268) b!114109))

(declare-fun m!170409 () Bool)

(assert (=> b!114109 m!170409))

(declare-fun m!170411 () Bool)

(assert (=> b!114109 m!170411))

(declare-fun m!170413 () Bool)

(assert (=> b!114108 m!170413))

(assert (=> b!114108 m!170413))

(declare-fun m!170415 () Bool)

(assert (=> b!114108 m!170415))

(assert (=> b!114106 m!170411))

(assert (=> b!114106 m!170231))

(declare-fun m!170417 () Bool)

(assert (=> d!36628 m!170417))

(declare-fun m!170419 () Bool)

(assert (=> d!36628 m!170419))

(declare-fun m!170421 () Bool)

(assert (=> b!114107 m!170421))

(assert (=> b!113979 d!36628))

(declare-fun d!36630 () Bool)

(declare-fun res!94271 () Bool)

(declare-fun e!74840 () Bool)

(assert (=> d!36630 (=> (not res!94271) (not e!74840))))

(assert (=> d!36630 (= res!94271 (= (size!2351 (buf!2759 thiss!1305)) (size!2351 (buf!2759 (_2!4962 lt!173275)))))))

(assert (=> d!36630 (= (isPrefixOf!0 thiss!1305 (_2!4962 lt!173275)) e!74840)))

(declare-fun b!114110 () Bool)

(declare-fun res!94272 () Bool)

(assert (=> b!114110 (=> (not res!94272) (not e!74840))))

(assert (=> b!114110 (= res!94272 (bvsle (bitIndex!0 (size!2351 (buf!2759 thiss!1305)) (currentByte!5354 thiss!1305) (currentBit!5349 thiss!1305)) (bitIndex!0 (size!2351 (buf!2759 (_2!4962 lt!173275))) (currentByte!5354 (_2!4962 lt!173275)) (currentBit!5349 (_2!4962 lt!173275)))))))

(declare-fun b!114111 () Bool)

(declare-fun e!74841 () Bool)

(assert (=> b!114111 (= e!74840 e!74841)))

(declare-fun res!94270 () Bool)

(assert (=> b!114111 (=> res!94270 e!74841)))

(assert (=> b!114111 (= res!94270 (= (size!2351 (buf!2759 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!114112 () Bool)

(assert (=> b!114112 (= e!74841 (arrayBitRangesEq!0 (buf!2759 thiss!1305) (buf!2759 (_2!4962 lt!173275)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2351 (buf!2759 thiss!1305)) (currentByte!5354 thiss!1305) (currentBit!5349 thiss!1305))))))

(assert (= (and d!36630 res!94271) b!114110))

(assert (= (and b!114110 res!94272) b!114111))

(assert (= (and b!114111 (not res!94270)) b!114112))

(assert (=> b!114110 m!170231))

(assert (=> b!114110 m!170229))

(assert (=> b!114112 m!170231))

(assert (=> b!114112 m!170231))

(declare-fun m!170423 () Bool)

(assert (=> b!114112 m!170423))

(assert (=> b!113974 d!36630))

(declare-fun d!36632 () Bool)

(assert (=> d!36632 (= (array_inv!2153 (buf!2759 thiss!1305)) (bvsge (size!2351 (buf!2759 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!113975 d!36632))

(declare-fun d!36634 () Bool)

(assert (=> d!36634 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!113980 d!36634))

(declare-fun d!36636 () Bool)

(declare-fun e!74850 () Bool)

(assert (=> d!36636 e!74850))

(declare-fun res!94286 () Bool)

(assert (=> d!36636 (=> (not res!94286) (not e!74850))))

(declare-fun lt!173508 () (_ BitVec 64))

(declare-fun lt!173509 () (_ BitVec 64))

(declare-fun lt!173510 () (_ BitVec 64))

(assert (=> d!36636 (= res!94286 (= lt!173509 (bvsub lt!173510 lt!173508)))))

(assert (=> d!36636 (or (= (bvand lt!173510 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!173508 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!173510 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!173510 lt!173508) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36636 (= lt!173508 (remainingBits!0 ((_ sign_extend 32) (size!2351 (buf!2759 (_1!4963 lt!173276)))) ((_ sign_extend 32) (currentByte!5354 (_1!4963 lt!173276))) ((_ sign_extend 32) (currentBit!5349 (_1!4963 lt!173276)))))))

(declare-fun lt!173506 () (_ BitVec 64))

(declare-fun lt!173511 () (_ BitVec 64))

(assert (=> d!36636 (= lt!173510 (bvmul lt!173506 lt!173511))))

(assert (=> d!36636 (or (= lt!173506 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!173511 (bvsdiv (bvmul lt!173506 lt!173511) lt!173506)))))

(assert (=> d!36636 (= lt!173511 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36636 (= lt!173506 ((_ sign_extend 32) (size!2351 (buf!2759 (_1!4963 lt!173276)))))))

(assert (=> d!36636 (= lt!173509 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5354 (_1!4963 lt!173276))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5349 (_1!4963 lt!173276)))))))

(assert (=> d!36636 (invariant!0 (currentBit!5349 (_1!4963 lt!173276)) (currentByte!5354 (_1!4963 lt!173276)) (size!2351 (buf!2759 (_1!4963 lt!173276))))))

(assert (=> d!36636 (= (bitIndex!0 (size!2351 (buf!2759 (_1!4963 lt!173276))) (currentByte!5354 (_1!4963 lt!173276)) (currentBit!5349 (_1!4963 lt!173276))) lt!173509)))

(declare-fun b!114129 () Bool)

(declare-fun res!94285 () Bool)

(assert (=> b!114129 (=> (not res!94285) (not e!74850))))

(assert (=> b!114129 (= res!94285 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!173509))))

(declare-fun b!114130 () Bool)

(declare-fun lt!173507 () (_ BitVec 64))

(assert (=> b!114130 (= e!74850 (bvsle lt!173509 (bvmul lt!173507 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!114130 (or (= lt!173507 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!173507 #b0000000000000000000000000000000000000000000000000000000000001000) lt!173507)))))

(assert (=> b!114130 (= lt!173507 ((_ sign_extend 32) (size!2351 (buf!2759 (_1!4963 lt!173276)))))))

(assert (= (and d!36636 res!94286) b!114129))

(assert (= (and b!114129 res!94285) b!114130))

(declare-fun m!170425 () Bool)

(assert (=> d!36636 m!170425))

(declare-fun m!170427 () Bool)

(assert (=> d!36636 m!170427))

(assert (=> b!113981 d!36636))

(declare-fun d!36638 () Bool)

(assert (=> d!36638 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5349 thiss!1305) (currentByte!5354 thiss!1305) (size!2351 (buf!2759 thiss!1305))))))

(declare-fun bs!8897 () Bool)

(assert (= bs!8897 d!36638))

(declare-fun m!170429 () Bool)

(assert (=> bs!8897 m!170429))

(assert (=> start!22538 d!36638))

(declare-fun d!36640 () Bool)

(assert (=> d!36640 (= (invariant!0 (currentBit!5349 thiss!1305) (currentByte!5354 thiss!1305) (size!2351 (buf!2759 (_2!4962 lt!173275)))) (and (bvsge (currentBit!5349 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5349 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5354 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5354 thiss!1305) (size!2351 (buf!2759 (_2!4962 lt!173275)))) (and (= (currentBit!5349 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5354 thiss!1305) (size!2351 (buf!2759 (_2!4962 lt!173275))))))))))

(assert (=> b!113976 d!36640))

(declare-fun d!36642 () Bool)

(declare-fun e!74853 () Bool)

(assert (=> d!36642 e!74853))

(declare-fun res!94290 () Bool)

(assert (=> d!36642 (=> (not res!94290) (not e!74853))))

(declare-fun lt!173539 () (_ BitVec 64))

(declare-fun lt!173538 () (_ BitVec 64))

(declare-fun lt!173540 () (_ BitVec 64))

(assert (=> d!36642 (= res!94290 (= lt!173539 (bvsub lt!173540 lt!173538)))))

(assert (=> d!36642 (or (= (bvand lt!173540 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!173538 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!173540 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!173540 lt!173538) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36642 (= lt!173538 (remainingBits!0 ((_ sign_extend 32) (size!2351 (buf!2759 (_2!4962 lt!173275)))) ((_ sign_extend 32) (currentByte!5354 (_2!4962 lt!173275))) ((_ sign_extend 32) (currentBit!5349 (_2!4962 lt!173275)))))))

(declare-fun lt!173536 () (_ BitVec 64))

(declare-fun lt!173541 () (_ BitVec 64))

(assert (=> d!36642 (= lt!173540 (bvmul lt!173536 lt!173541))))

(assert (=> d!36642 (or (= lt!173536 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!173541 (bvsdiv (bvmul lt!173536 lt!173541) lt!173536)))))

(assert (=> d!36642 (= lt!173541 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36642 (= lt!173536 ((_ sign_extend 32) (size!2351 (buf!2759 (_2!4962 lt!173275)))))))

(assert (=> d!36642 (= lt!173539 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5354 (_2!4962 lt!173275))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5349 (_2!4962 lt!173275)))))))

(assert (=> d!36642 (invariant!0 (currentBit!5349 (_2!4962 lt!173275)) (currentByte!5354 (_2!4962 lt!173275)) (size!2351 (buf!2759 (_2!4962 lt!173275))))))

(assert (=> d!36642 (= (bitIndex!0 (size!2351 (buf!2759 (_2!4962 lt!173275))) (currentByte!5354 (_2!4962 lt!173275)) (currentBit!5349 (_2!4962 lt!173275))) lt!173539)))

(declare-fun b!114133 () Bool)

(declare-fun res!94289 () Bool)

(assert (=> b!114133 (=> (not res!94289) (not e!74853))))

(assert (=> b!114133 (= res!94289 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!173539))))

(declare-fun b!114134 () Bool)

(declare-fun lt!173537 () (_ BitVec 64))

(assert (=> b!114134 (= e!74853 (bvsle lt!173539 (bvmul lt!173537 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!114134 (or (= lt!173537 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!173537 #b0000000000000000000000000000000000000000000000000000000000001000) lt!173537)))))

(assert (=> b!114134 (= lt!173537 ((_ sign_extend 32) (size!2351 (buf!2759 (_2!4962 lt!173275)))))))

(assert (= (and d!36642 res!94290) b!114133))

(assert (= (and b!114133 res!94289) b!114134))

(declare-fun m!170431 () Bool)

(assert (=> d!36642 m!170431))

(declare-fun m!170433 () Bool)

(assert (=> d!36642 m!170433))

(assert (=> b!113977 d!36642))

(declare-fun d!36644 () Bool)

(declare-fun e!74854 () Bool)

(assert (=> d!36644 e!74854))

(declare-fun res!94292 () Bool)

(assert (=> d!36644 (=> (not res!94292) (not e!74854))))

(declare-fun lt!173547 () (_ BitVec 64))

(declare-fun lt!173548 () (_ BitVec 64))

(declare-fun lt!173546 () (_ BitVec 64))

(assert (=> d!36644 (= res!94292 (= lt!173547 (bvsub lt!173548 lt!173546)))))

(assert (=> d!36644 (or (= (bvand lt!173548 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!173546 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!173548 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!173548 lt!173546) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36644 (= lt!173546 (remainingBits!0 ((_ sign_extend 32) (size!2351 (buf!2759 thiss!1305))) ((_ sign_extend 32) (currentByte!5354 thiss!1305)) ((_ sign_extend 32) (currentBit!5349 thiss!1305))))))

(declare-fun lt!173544 () (_ BitVec 64))

(declare-fun lt!173549 () (_ BitVec 64))

(assert (=> d!36644 (= lt!173548 (bvmul lt!173544 lt!173549))))

(assert (=> d!36644 (or (= lt!173544 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!173549 (bvsdiv (bvmul lt!173544 lt!173549) lt!173544)))))

(assert (=> d!36644 (= lt!173549 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36644 (= lt!173544 ((_ sign_extend 32) (size!2351 (buf!2759 thiss!1305))))))

(assert (=> d!36644 (= lt!173547 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5354 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5349 thiss!1305))))))

(assert (=> d!36644 (invariant!0 (currentBit!5349 thiss!1305) (currentByte!5354 thiss!1305) (size!2351 (buf!2759 thiss!1305)))))

(assert (=> d!36644 (= (bitIndex!0 (size!2351 (buf!2759 thiss!1305)) (currentByte!5354 thiss!1305) (currentBit!5349 thiss!1305)) lt!173547)))

(declare-fun b!114135 () Bool)

(declare-fun res!94291 () Bool)

(assert (=> b!114135 (=> (not res!94291) (not e!74854))))

(assert (=> b!114135 (= res!94291 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!173547))))

(declare-fun b!114136 () Bool)

(declare-fun lt!173545 () (_ BitVec 64))

(assert (=> b!114136 (= e!74854 (bvsle lt!173547 (bvmul lt!173545 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!114136 (or (= lt!173545 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!173545 #b0000000000000000000000000000000000000000000000000000000000001000) lt!173545)))))

(assert (=> b!114136 (= lt!173545 ((_ sign_extend 32) (size!2351 (buf!2759 thiss!1305))))))

(assert (= (and d!36644 res!94292) b!114135))

(assert (= (and b!114135 res!94291) b!114136))

(assert (=> d!36644 m!170287))

(assert (=> d!36644 m!170429))

(assert (=> b!113977 d!36644))

(declare-fun d!36646 () Bool)

(assert (=> d!36646 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!2351 (buf!2759 (_2!4962 lt!173275)))) ((_ sign_extend 32) (currentByte!5354 thiss!1305)) ((_ sign_extend 32) (currentBit!5349 thiss!1305))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2351 (buf!2759 (_2!4962 lt!173275)))) ((_ sign_extend 32) (currentByte!5354 thiss!1305)) ((_ sign_extend 32) (currentBit!5349 thiss!1305))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!8898 () Bool)

(assert (= bs!8898 d!36646))

(declare-fun m!170435 () Bool)

(assert (=> bs!8898 m!170435))

(assert (=> b!113982 d!36646))

(declare-fun d!36648 () Bool)

(declare-datatypes ((tuple2!9414 0))(
  ( (tuple2!9415 (_1!4969 Bool) (_2!4969 BitStream!4176)) )
))
(declare-fun lt!173590 () tuple2!9414)

(declare-fun readBit!0 (BitStream!4176) tuple2!9414)

(assert (=> d!36648 (= lt!173590 (readBit!0 (readerFrom!0 (_2!4962 lt!173275) (currentBit!5349 thiss!1305) (currentByte!5354 thiss!1305))))))

(assert (=> d!36648 (= (readBitPure!0 (readerFrom!0 (_2!4962 lt!173275) (currentBit!5349 thiss!1305) (currentByte!5354 thiss!1305))) (tuple2!9403 (_2!4969 lt!173590) (_1!4969 lt!173590)))))

(declare-fun bs!8899 () Bool)

(assert (= bs!8899 d!36648))

(assert (=> bs!8899 m!170249))

(declare-fun m!170437 () Bool)

(assert (=> bs!8899 m!170437))

(assert (=> b!113983 d!36648))

(declare-fun d!36650 () Bool)

(declare-fun e!74859 () Bool)

(assert (=> d!36650 e!74859))

(declare-fun res!94296 () Bool)

(assert (=> d!36650 (=> (not res!94296) (not e!74859))))

(assert (=> d!36650 (= res!94296 (invariant!0 (currentBit!5349 (_2!4962 lt!173275)) (currentByte!5354 (_2!4962 lt!173275)) (size!2351 (buf!2759 (_2!4962 lt!173275)))))))

(assert (=> d!36650 (= (readerFrom!0 (_2!4962 lt!173275) (currentBit!5349 thiss!1305) (currentByte!5354 thiss!1305)) (BitStream!4177 (buf!2759 (_2!4962 lt!173275)) (currentByte!5354 thiss!1305) (currentBit!5349 thiss!1305)))))

(declare-fun b!114143 () Bool)

(assert (=> b!114143 (= e!74859 (invariant!0 (currentBit!5349 thiss!1305) (currentByte!5354 thiss!1305) (size!2351 (buf!2759 (_2!4962 lt!173275)))))))

(assert (= (and d!36650 res!94296) b!114143))

(assert (=> d!36650 m!170433))

(assert (=> b!114143 m!170253))

(assert (=> b!113983 d!36650))

(check-sat (not b!114106) (not b!114143) (not b!114096) (not b!114109) (not d!36638) (not d!36578) (not b!114108) (not b!114093) (not bm!1457) (not d!36650) (not b!114088) (not b!114089) (not b!114087) (not b!114085) (not b!114090) (not b!114025) (not d!36628) (not b!114107) (not d!36642) (not d!36636) (not b!114084) (not b!114110) (not b!114023) (not d!36644) (not d!36646) (not d!36648) (not b!114112) (not b!114094) (not b!114095) (not d!36582))
(check-sat)
