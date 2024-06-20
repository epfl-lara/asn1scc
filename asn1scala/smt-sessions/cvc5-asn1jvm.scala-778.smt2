; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22368 () Bool)

(assert start!22368)

(declare-fun b!112970 () Bool)

(declare-fun res!93280 () Bool)

(declare-fun e!74128 () Bool)

(assert (=> b!112970 (=> (not res!93280) (not e!74128))))

(declare-datatypes ((array!5132 0))(
  ( (array!5133 (arr!2925 (Array (_ BitVec 32) (_ BitVec 8))) (size!2332 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4138 0))(
  ( (BitStream!4139 (buf!2740 array!5132) (currentByte!5320 (_ BitVec 32)) (currentBit!5315 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4138)

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!112970 (= res!93280 (validate_offset_bits!1 ((_ sign_extend 32) (size!2332 (buf!2740 thiss!1305))) ((_ sign_extend 32) (currentByte!5320 thiss!1305)) ((_ sign_extend 32) (currentBit!5315 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!112971 () Bool)

(declare-fun res!93276 () Bool)

(assert (=> b!112971 (=> (not res!93276) (not e!74128))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!112971 (= res!93276 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!112972 () Bool)

(declare-fun res!93281 () Bool)

(declare-fun e!74125 () Bool)

(assert (=> b!112972 (=> (not res!93281) (not e!74125))))

(declare-datatypes ((Unit!6931 0))(
  ( (Unit!6932) )
))
(declare-datatypes ((tuple2!9288 0))(
  ( (tuple2!9289 (_1!4906 Unit!6931) (_2!4906 BitStream!4138)) )
))
(declare-fun lt!171833 () tuple2!9288)

(declare-fun isPrefixOf!0 (BitStream!4138 BitStream!4138) Bool)

(assert (=> b!112972 (= res!93281 (isPrefixOf!0 thiss!1305 (_2!4906 lt!171833)))))

(declare-fun b!112973 () Bool)

(declare-fun e!74130 () Bool)

(declare-datatypes ((tuple2!9290 0))(
  ( (tuple2!9291 (_1!4907 BitStream!4138) (_2!4907 Bool)) )
))
(declare-fun lt!171832 () tuple2!9290)

(declare-fun lt!171836 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!112973 (= e!74130 (= (bitIndex!0 (size!2332 (buf!2740 (_1!4907 lt!171832))) (currentByte!5320 (_1!4907 lt!171832)) (currentBit!5315 (_1!4907 lt!171832))) lt!171836))))

(declare-fun res!93275 () Bool)

(assert (=> start!22368 (=> (not res!93275) (not e!74128))))

(assert (=> start!22368 (= res!93275 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22368 e!74128))

(assert (=> start!22368 true))

(declare-fun e!74126 () Bool)

(declare-fun inv!12 (BitStream!4138) Bool)

(assert (=> start!22368 (and (inv!12 thiss!1305) e!74126)))

(declare-fun b!112974 () Bool)

(declare-fun array_inv!2134 (array!5132) Bool)

(assert (=> b!112974 (= e!74126 (array_inv!2134 (buf!2740 thiss!1305)))))

(declare-fun b!112975 () Bool)

(declare-fun res!93277 () Bool)

(assert (=> b!112975 (=> (not res!93277) (not e!74128))))

(assert (=> b!112975 (= res!93277 (bvslt i!615 nBits!396))))

(declare-fun b!112976 () Bool)

(assert (=> b!112976 (= e!74128 (not (or (not (= (bvand i!615 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (= (bvand i!615 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)))))))

(declare-fun e!74129 () Bool)

(assert (=> b!112976 e!74129))

(declare-fun res!93278 () Bool)

(assert (=> b!112976 (=> (not res!93278) (not e!74129))))

(assert (=> b!112976 (= res!93278 (= (size!2332 (buf!2740 thiss!1305)) (size!2332 (buf!2740 (_2!4906 lt!171833)))))))

(declare-fun lt!171834 () Bool)

(declare-fun appendBit!0 (BitStream!4138 Bool) tuple2!9288)

(assert (=> b!112976 (= lt!171833 (appendBit!0 thiss!1305 lt!171834))))

(assert (=> b!112976 (= lt!171834 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!112977 () Bool)

(assert (=> b!112977 (= e!74125 e!74130)))

(declare-fun res!93274 () Bool)

(assert (=> b!112977 (=> (not res!93274) (not e!74130))))

(assert (=> b!112977 (= res!93274 (and (= (_2!4907 lt!171832) lt!171834) (= (_1!4907 lt!171832) (_2!4906 lt!171833))))))

(declare-fun readBitPure!0 (BitStream!4138) tuple2!9290)

(declare-fun readerFrom!0 (BitStream!4138 (_ BitVec 32) (_ BitVec 32)) BitStream!4138)

(assert (=> b!112977 (= lt!171832 (readBitPure!0 (readerFrom!0 (_2!4906 lt!171833) (currentBit!5315 thiss!1305) (currentByte!5320 thiss!1305))))))

(declare-fun b!112978 () Bool)

(assert (=> b!112978 (= e!74129 e!74125)))

(declare-fun res!93279 () Bool)

(assert (=> b!112978 (=> (not res!93279) (not e!74125))))

(declare-fun lt!171835 () (_ BitVec 64))

(assert (=> b!112978 (= res!93279 (= lt!171836 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!171835)))))

(assert (=> b!112978 (= lt!171836 (bitIndex!0 (size!2332 (buf!2740 (_2!4906 lt!171833))) (currentByte!5320 (_2!4906 lt!171833)) (currentBit!5315 (_2!4906 lt!171833))))))

(assert (=> b!112978 (= lt!171835 (bitIndex!0 (size!2332 (buf!2740 thiss!1305)) (currentByte!5320 thiss!1305) (currentBit!5315 thiss!1305)))))

(assert (= (and start!22368 res!93275) b!112970))

(assert (= (and b!112970 res!93280) b!112971))

(assert (= (and b!112971 res!93276) b!112975))

(assert (= (and b!112975 res!93277) b!112976))

(assert (= (and b!112976 res!93278) b!112978))

(assert (= (and b!112978 res!93279) b!112972))

(assert (= (and b!112972 res!93281) b!112977))

(assert (= (and b!112977 res!93274) b!112973))

(assert (= start!22368 b!112974))

(declare-fun m!169027 () Bool)

(assert (=> b!112974 m!169027))

(declare-fun m!169029 () Bool)

(assert (=> b!112977 m!169029))

(assert (=> b!112977 m!169029))

(declare-fun m!169031 () Bool)

(assert (=> b!112977 m!169031))

(declare-fun m!169033 () Bool)

(assert (=> b!112973 m!169033))

(declare-fun m!169035 () Bool)

(assert (=> start!22368 m!169035))

(declare-fun m!169037 () Bool)

(assert (=> b!112972 m!169037))

(declare-fun m!169039 () Bool)

(assert (=> b!112971 m!169039))

(declare-fun m!169041 () Bool)

(assert (=> b!112978 m!169041))

(declare-fun m!169043 () Bool)

(assert (=> b!112978 m!169043))

(declare-fun m!169045 () Bool)

(assert (=> b!112976 m!169045))

(declare-fun m!169047 () Bool)

(assert (=> b!112970 m!169047))

(push 1)

(assert (not b!112977))

(assert (not b!112973))

(assert (not b!112970))

(assert (not b!112972))

(assert (not b!112978))

(assert (not start!22368))

(assert (not b!112971))

(assert (not b!112976))

(assert (not b!112974))

(check-sat)

(pop 1)

(push 1)

(check-sat)

