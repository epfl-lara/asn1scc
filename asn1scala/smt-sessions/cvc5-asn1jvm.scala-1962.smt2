; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50894 () Bool)

(assert start!50894)

(declare-fun b!238267 () Bool)

(declare-fun e!164589 () Bool)

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun i!752 () (_ BitVec 32))

(assert (=> b!238267 (= e!164589 (and (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand i!752 #b10000000000000000000000000000000))) (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 i!752) #b10000000000000000000000000000000)))))))

(declare-fun b!238268 () Bool)

(declare-fun res!199153 () Bool)

(assert (=> b!238268 (=> (not res!199153) (not e!164589))))

(declare-datatypes ((array!12700 0))(
  ( (array!12701 (arr!6565 (Array (_ BitVec 32) (_ BitVec 8))) (size!5578 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10120 0))(
  ( (BitStream!10121 (buf!6053 array!12700) (currentByte!11239 (_ BitVec 32)) (currentBit!11234 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10120)

(declare-fun lt!373200 () (_ BitVec 64))

(declare-datatypes ((tuple2!20106 0))(
  ( (tuple2!20107 (_1!10957 (_ BitVec 64)) (_2!10957 BitStream!10120)) )
))
(declare-fun lt!373199 () tuple2!20106)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238268 (= res!199153 (= (bitIndex!0 (size!5578 (buf!6053 (_2!10957 lt!373199))) (currentByte!11239 (_2!10957 lt!373199)) (currentBit!11234 (_2!10957 lt!373199))) (bvadd (bitIndex!0 (size!5578 (buf!6053 thiss!1830)) (currentByte!11239 thiss!1830) (currentBit!11234 thiss!1830)) lt!373200)))))

(declare-fun b!238269 () Bool)

(declare-fun e!164591 () Bool)

(assert (=> b!238269 (= e!164591 e!164589)))

(declare-fun res!199157 () Bool)

(assert (=> b!238269 (=> (not res!199157) (not e!164589))))

(assert (=> b!238269 (= res!199157 (= (buf!6053 (_2!10957 lt!373199)) (buf!6053 thiss!1830)))))

(declare-datatypes ((tuple2!20108 0))(
  ( (tuple2!20109 (_1!10958 Bool) (_2!10958 BitStream!10120)) )
))
(declare-fun lt!373198 () tuple2!20108)

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!10120 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!20106)

(assert (=> b!238269 (= lt!373199 (readNLeastSignificantBitsLoop!0 (_2!10958 lt!373198) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!10958 lt!373198) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun readBit!0 (BitStream!10120) tuple2!20108)

(assert (=> b!238269 (= lt!373198 (readBit!0 thiss!1830))))

(declare-fun b!238271 () Bool)

(declare-fun res!199156 () Bool)

(assert (=> b!238271 (=> (not res!199156) (not e!164591))))

(assert (=> b!238271 (= res!199156 (not (= nBits!581 i!752)))))

(declare-fun b!238272 () Bool)

(declare-fun res!199158 () Bool)

(assert (=> b!238272 (=> (not res!199158) (not e!164591))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238272 (= res!199158 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!238273 () Bool)

(declare-fun e!164587 () Bool)

(declare-fun array_inv!5319 (array!12700) Bool)

(assert (=> b!238273 (= e!164587 (array_inv!5319 (buf!6053 thiss!1830)))))

(declare-fun b!238274 () Bool)

(declare-fun res!199155 () Bool)

(assert (=> b!238274 (=> (not res!199155) (not e!164591))))

(assert (=> b!238274 (= res!199155 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!238270 () Bool)

(declare-fun e!164588 () Bool)

(assert (=> b!238270 (= e!164588 e!164591)))

(declare-fun res!199154 () Bool)

(assert (=> b!238270 (=> (not res!199154) (not e!164591))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!238270 (= res!199154 (validate_offset_bits!1 ((_ sign_extend 32) (size!5578 (buf!6053 thiss!1830))) ((_ sign_extend 32) (currentByte!11239 thiss!1830)) ((_ sign_extend 32) (currentBit!11234 thiss!1830)) lt!373200))))

(assert (=> b!238270 (= lt!373200 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(declare-fun res!199152 () Bool)

(assert (=> start!50894 (=> (not res!199152) (not e!164588))))

(assert (=> start!50894 (= res!199152 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50894 e!164588))

(assert (=> start!50894 true))

(declare-fun inv!12 (BitStream!10120) Bool)

(assert (=> start!50894 (and (inv!12 thiss!1830) e!164587)))

(assert (= (and start!50894 res!199152) b!238270))

(assert (= (and b!238270 res!199154) b!238272))

(assert (= (and b!238272 res!199158) b!238274))

(assert (= (and b!238274 res!199155) b!238271))

(assert (= (and b!238271 res!199156) b!238269))

(assert (= (and b!238269 res!199157) b!238268))

(assert (= (and b!238268 res!199153) b!238267))

(assert (= start!50894 b!238273))

(declare-fun m!360447 () Bool)

(assert (=> b!238273 m!360447))

(declare-fun m!360449 () Bool)

(assert (=> b!238268 m!360449))

(declare-fun m!360451 () Bool)

(assert (=> b!238268 m!360451))

(declare-fun m!360453 () Bool)

(assert (=> b!238274 m!360453))

(declare-fun m!360455 () Bool)

(assert (=> b!238272 m!360455))

(declare-fun m!360457 () Bool)

(assert (=> b!238269 m!360457))

(declare-fun m!360459 () Bool)

(assert (=> b!238269 m!360459))

(declare-fun m!360461 () Bool)

(assert (=> start!50894 m!360461))

(declare-fun m!360463 () Bool)

(assert (=> b!238270 m!360463))

(push 1)

(assert (not b!238270))

(assert (not b!238268))

(assert (not b!238273))

(assert (not b!238272))

(assert (not b!238274))

(assert (not b!238269))

(assert (not start!50894))

(check-sat)

(pop 1)

(push 1)

(check-sat)

