; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22372 () Bool)

(assert start!22372)

(declare-fun b!113024 () Bool)

(declare-fun e!74161 () Bool)

(declare-datatypes ((array!5136 0))(
  ( (array!5137 (arr!2927 (Array (_ BitVec 32) (_ BitVec 8))) (size!2334 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4142 0))(
  ( (BitStream!4143 (buf!2742 array!5136) (currentByte!5322 (_ BitVec 32)) (currentBit!5317 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4142)

(declare-fun array_inv!2136 (array!5136) Bool)

(assert (=> b!113024 (= e!74161 (array_inv!2136 (buf!2742 thiss!1305)))))

(declare-fun b!113025 () Bool)

(declare-fun e!74166 () Bool)

(declare-fun e!74162 () Bool)

(assert (=> b!113025 (= e!74166 e!74162)))

(declare-fun res!93324 () Bool)

(assert (=> b!113025 (=> (not res!93324) (not e!74162))))

(declare-fun lt!171865 () Bool)

(declare-datatypes ((tuple2!9296 0))(
  ( (tuple2!9297 (_1!4910 BitStream!4142) (_2!4910 Bool)) )
))
(declare-fun lt!171863 () tuple2!9296)

(declare-datatypes ((Unit!6935 0))(
  ( (Unit!6936) )
))
(declare-datatypes ((tuple2!9298 0))(
  ( (tuple2!9299 (_1!4911 Unit!6935) (_2!4911 BitStream!4142)) )
))
(declare-fun lt!171866 () tuple2!9298)

(assert (=> b!113025 (= res!93324 (and (= (_2!4910 lt!171863) lt!171865) (= (_1!4910 lt!171863) (_2!4911 lt!171866))))))

(declare-fun readBitPure!0 (BitStream!4142) tuple2!9296)

(declare-fun readerFrom!0 (BitStream!4142 (_ BitVec 32) (_ BitVec 32)) BitStream!4142)

(assert (=> b!113025 (= lt!171863 (readBitPure!0 (readerFrom!0 (_2!4911 lt!171866) (currentBit!5317 thiss!1305) (currentByte!5322 thiss!1305))))))

(declare-fun b!113026 () Bool)

(declare-fun lt!171864 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!113026 (= e!74162 (= (bitIndex!0 (size!2334 (buf!2742 (_1!4910 lt!171863))) (currentByte!5322 (_1!4910 lt!171863)) (currentBit!5317 (_1!4910 lt!171863))) lt!171864))))

(declare-fun res!93326 () Bool)

(declare-fun e!74163 () Bool)

(assert (=> start!22372 (=> (not res!93326) (not e!74163))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!22372 (= res!93326 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22372 e!74163))

(assert (=> start!22372 true))

(declare-fun inv!12 (BitStream!4142) Bool)

(assert (=> start!22372 (and (inv!12 thiss!1305) e!74161)))

(declare-fun b!113027 () Bool)

(declare-fun e!74164 () Bool)

(assert (=> b!113027 (= e!74164 e!74166)))

(declare-fun res!93329 () Bool)

(assert (=> b!113027 (=> (not res!93329) (not e!74166))))

(declare-fun lt!171862 () (_ BitVec 64))

(assert (=> b!113027 (= res!93329 (= lt!171864 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!171862)))))

(assert (=> b!113027 (= lt!171864 (bitIndex!0 (size!2334 (buf!2742 (_2!4911 lt!171866))) (currentByte!5322 (_2!4911 lt!171866)) (currentBit!5317 (_2!4911 lt!171866))))))

(assert (=> b!113027 (= lt!171862 (bitIndex!0 (size!2334 (buf!2742 thiss!1305)) (currentByte!5322 thiss!1305) (currentBit!5317 thiss!1305)))))

(declare-fun b!113028 () Bool)

(assert (=> b!113028 (= e!74163 (not (or (not (= (bvand i!615 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (= (bvand i!615 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)))))))

(assert (=> b!113028 e!74164))

(declare-fun res!93327 () Bool)

(assert (=> b!113028 (=> (not res!93327) (not e!74164))))

(assert (=> b!113028 (= res!93327 (= (size!2334 (buf!2742 thiss!1305)) (size!2334 (buf!2742 (_2!4911 lt!171866)))))))

(declare-fun appendBit!0 (BitStream!4142 Bool) tuple2!9298)

(assert (=> b!113028 (= lt!171866 (appendBit!0 thiss!1305 lt!171865))))

(declare-fun v!199 () (_ BitVec 64))

(assert (=> b!113028 (= lt!171865 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!113029 () Bool)

(declare-fun res!93325 () Bool)

(assert (=> b!113029 (=> (not res!93325) (not e!74163))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!113029 (= res!93325 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!113030 () Bool)

(declare-fun res!93322 () Bool)

(assert (=> b!113030 (=> (not res!93322) (not e!74166))))

(declare-fun isPrefixOf!0 (BitStream!4142 BitStream!4142) Bool)

(assert (=> b!113030 (= res!93322 (isPrefixOf!0 thiss!1305 (_2!4911 lt!171866)))))

(declare-fun b!113031 () Bool)

(declare-fun res!93323 () Bool)

(assert (=> b!113031 (=> (not res!93323) (not e!74163))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!113031 (= res!93323 (validate_offset_bits!1 ((_ sign_extend 32) (size!2334 (buf!2742 thiss!1305))) ((_ sign_extend 32) (currentByte!5322 thiss!1305)) ((_ sign_extend 32) (currentBit!5317 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!113032 () Bool)

(declare-fun res!93328 () Bool)

(assert (=> b!113032 (=> (not res!93328) (not e!74163))))

(assert (=> b!113032 (= res!93328 (bvslt i!615 nBits!396))))

(assert (= (and start!22372 res!93326) b!113031))

(assert (= (and b!113031 res!93323) b!113029))

(assert (= (and b!113029 res!93325) b!113032))

(assert (= (and b!113032 res!93328) b!113028))

(assert (= (and b!113028 res!93327) b!113027))

(assert (= (and b!113027 res!93329) b!113030))

(assert (= (and b!113030 res!93322) b!113025))

(assert (= (and b!113025 res!93324) b!113026))

(assert (= start!22372 b!113024))

(declare-fun m!169071 () Bool)

(assert (=> b!113029 m!169071))

(declare-fun m!169073 () Bool)

(assert (=> b!113028 m!169073))

(declare-fun m!169075 () Bool)

(assert (=> b!113027 m!169075))

(declare-fun m!169077 () Bool)

(assert (=> b!113027 m!169077))

(declare-fun m!169079 () Bool)

(assert (=> b!113030 m!169079))

(declare-fun m!169081 () Bool)

(assert (=> b!113025 m!169081))

(assert (=> b!113025 m!169081))

(declare-fun m!169083 () Bool)

(assert (=> b!113025 m!169083))

(declare-fun m!169085 () Bool)

(assert (=> start!22372 m!169085))

(declare-fun m!169087 () Bool)

(assert (=> b!113024 m!169087))

(declare-fun m!169089 () Bool)

(assert (=> b!113026 m!169089))

(declare-fun m!169091 () Bool)

(assert (=> b!113031 m!169091))

(push 1)

(assert (not b!113025))

(assert (not b!113031))

(assert (not start!22372))

(assert (not b!113024))

(assert (not b!113029))

(assert (not b!113030))

(assert (not b!113028))

(assert (not b!113026))

(assert (not b!113027))

(check-sat)

(pop 1)

(push 1)

(check-sat)

