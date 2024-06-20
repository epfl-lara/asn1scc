; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21856 () Bool)

(assert start!21856)

(declare-fun b!110270 () Bool)

(declare-fun res!91028 () Bool)

(declare-fun e!72289 () Bool)

(assert (=> b!110270 (=> (not res!91028) (not e!72289))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110270 (= res!91028 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!110271 () Bool)

(declare-fun e!72291 () Bool)

(assert (=> b!110271 (= e!72289 (not e!72291))))

(declare-fun res!91029 () Bool)

(assert (=> b!110271 (=> res!91029 e!72291)))

(declare-fun lt!167018 () (_ BitVec 64))

(declare-fun lt!167016 () (_ BitVec 64))

(assert (=> b!110271 (= res!91029 (not (= lt!167018 (bvadd lt!167018 lt!167016))))))

(declare-datatypes ((array!5036 0))(
  ( (array!5037 (arr!2883 (Array (_ BitVec 32) (_ BitVec 8))) (size!2290 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4054 0))(
  ( (BitStream!4055 (buf!2684 array!5036) (currentByte!5238 (_ BitVec 32)) (currentBit!5233 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4054)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110271 (= lt!167018 (bitIndex!0 (size!2290 (buf!2684 thiss!1305)) (currentByte!5238 thiss!1305) (currentBit!5233 thiss!1305)))))

(declare-fun isPrefixOf!0 (BitStream!4054 BitStream!4054) Bool)

(assert (=> b!110271 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-datatypes ((Unit!6745 0))(
  ( (Unit!6746) )
))
(declare-fun lt!167017 () Unit!6745)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4054) Unit!6745)

(assert (=> b!110271 (= lt!167017 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun b!110272 () Bool)

(declare-fun e!72290 () Bool)

(declare-fun array_inv!2092 (array!5036) Bool)

(assert (=> b!110272 (= e!72290 (array_inv!2092 (buf!2684 thiss!1305)))))

(declare-fun b!110273 () Bool)

(declare-fun res!91026 () Bool)

(assert (=> b!110273 (=> (not res!91026) (not e!72289))))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!110273 (= res!91026 (bvsge i!615 nBits!396))))

(declare-fun res!91027 () Bool)

(declare-fun e!72292 () Bool)

(assert (=> start!21856 (=> (not res!91027) (not e!72292))))

(assert (=> start!21856 (= res!91027 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21856 e!72292))

(assert (=> start!21856 true))

(declare-fun inv!12 (BitStream!4054) Bool)

(assert (=> start!21856 (and (inv!12 thiss!1305) e!72290)))

(declare-fun b!110274 () Bool)

(assert (=> b!110274 (= e!72291 true)))

(declare-datatypes ((tuple2!9174 0))(
  ( (tuple2!9175 (_1!4844 BitStream!4054) (_2!4844 BitStream!4054)) )
))
(declare-fun lt!167015 () tuple2!9174)

(declare-fun reader!0 (BitStream!4054 BitStream!4054) tuple2!9174)

(assert (=> b!110274 (= lt!167015 (reader!0 thiss!1305 thiss!1305))))

(declare-fun b!110275 () Bool)

(assert (=> b!110275 (= e!72292 e!72289)))

(declare-fun res!91030 () Bool)

(assert (=> b!110275 (=> (not res!91030) (not e!72289))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!110275 (= res!91030 (validate_offset_bits!1 ((_ sign_extend 32) (size!2290 (buf!2684 thiss!1305))) ((_ sign_extend 32) (currentByte!5238 thiss!1305)) ((_ sign_extend 32) (currentBit!5233 thiss!1305)) lt!167016))))

(assert (=> b!110275 (= lt!167016 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (= (and start!21856 res!91027) b!110275))

(assert (= (and b!110275 res!91030) b!110270))

(assert (= (and b!110270 res!91028) b!110273))

(assert (= (and b!110273 res!91026) b!110271))

(assert (= (and b!110271 (not res!91029)) b!110274))

(assert (= start!21856 b!110272))

(declare-fun m!163853 () Bool)

(assert (=> b!110270 m!163853))

(declare-fun m!163855 () Bool)

(assert (=> b!110275 m!163855))

(declare-fun m!163857 () Bool)

(assert (=> b!110271 m!163857))

(declare-fun m!163859 () Bool)

(assert (=> b!110271 m!163859))

(declare-fun m!163861 () Bool)

(assert (=> b!110271 m!163861))

(declare-fun m!163863 () Bool)

(assert (=> b!110272 m!163863))

(declare-fun m!163865 () Bool)

(assert (=> b!110274 m!163865))

(declare-fun m!163867 () Bool)

(assert (=> start!21856 m!163867))

(push 1)

(assert (not b!110271))

(assert (not b!110272))

(assert (not b!110275))

(assert (not start!21856))

(assert (not b!110274))

(assert (not b!110270))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

