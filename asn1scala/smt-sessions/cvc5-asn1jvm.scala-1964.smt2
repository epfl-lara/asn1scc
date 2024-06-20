; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50906 () Bool)

(assert start!50906)

(declare-fun b!238411 () Bool)

(declare-fun res!199283 () Bool)

(declare-fun e!164679 () Bool)

(assert (=> b!238411 (=> (not res!199283) (not e!164679))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238411 (= res!199283 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!238412 () Bool)

(declare-fun res!199279 () Bool)

(assert (=> b!238412 (=> (not res!199279) (not e!164679))))

(assert (=> b!238412 (= res!199279 (not (= nBits!581 i!752)))))

(declare-fun b!238413 () Bool)

(declare-fun e!164680 () Bool)

(assert (=> b!238413 (= e!164680 e!164679)))

(declare-fun res!199282 () Bool)

(assert (=> b!238413 (=> (not res!199282) (not e!164679))))

(declare-datatypes ((array!12712 0))(
  ( (array!12713 (arr!6571 (Array (_ BitVec 32) (_ BitVec 8))) (size!5584 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10132 0))(
  ( (BitStream!10133 (buf!6059 array!12712) (currentByte!11245 (_ BitVec 32)) (currentBit!11240 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10132)

(declare-fun lt!373252 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!238413 (= res!199282 (validate_offset_bits!1 ((_ sign_extend 32) (size!5584 (buf!6059 thiss!1830))) ((_ sign_extend 32) (currentByte!11245 thiss!1830)) ((_ sign_extend 32) (currentBit!11240 thiss!1830)) lt!373252))))

(assert (=> b!238413 (= lt!373252 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(declare-fun b!238414 () Bool)

(declare-fun res!199278 () Bool)

(declare-fun e!164678 () Bool)

(assert (=> b!238414 (=> (not res!199278) (not e!164678))))

(declare-datatypes ((tuple2!20130 0))(
  ( (tuple2!20131 (_1!10969 (_ BitVec 64)) (_2!10969 BitStream!10132)) )
))
(declare-fun lt!373253 () tuple2!20130)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238414 (= res!199278 (= (bitIndex!0 (size!5584 (buf!6059 (_2!10969 lt!373253))) (currentByte!11245 (_2!10969 lt!373253)) (currentBit!11240 (_2!10969 lt!373253))) (bvadd (bitIndex!0 (size!5584 (buf!6059 thiss!1830)) (currentByte!11245 thiss!1830) (currentBit!11240 thiss!1830)) lt!373252)))))

(declare-fun b!238415 () Bool)

(assert (=> b!238415 (= e!164679 e!164678)))

(declare-fun res!199281 () Bool)

(assert (=> b!238415 (=> (not res!199281) (not e!164678))))

(assert (=> b!238415 (= res!199281 (= (buf!6059 (_2!10969 lt!373253)) (buf!6059 thiss!1830)))))

(declare-datatypes ((tuple2!20132 0))(
  ( (tuple2!20133 (_1!10970 Bool) (_2!10970 BitStream!10132)) )
))
(declare-fun lt!373254 () tuple2!20132)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!10132 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!20130)

(assert (=> b!238415 (= lt!373253 (readNLeastSignificantBitsLoop!0 (_2!10970 lt!373254) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!10970 lt!373254) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun readBit!0 (BitStream!10132) tuple2!20132)

(assert (=> b!238415 (= lt!373254 (readBit!0 thiss!1830))))

(declare-fun b!238416 () Bool)

(declare-fun res!199280 () Bool)

(assert (=> b!238416 (=> (not res!199280) (not e!164679))))

(assert (=> b!238416 (= res!199280 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!238417 () Bool)

(assert (=> b!238417 (= e!164678 (and (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand i!752 #b10000000000000000000000000000000))) (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 i!752) #b10000000000000000000000000000000)))))))

(declare-fun b!238418 () Bool)

(declare-fun e!164681 () Bool)

(declare-fun array_inv!5325 (array!12712) Bool)

(assert (=> b!238418 (= e!164681 (array_inv!5325 (buf!6059 thiss!1830)))))

(declare-fun res!199284 () Bool)

(assert (=> start!50906 (=> (not res!199284) (not e!164680))))

(assert (=> start!50906 (= res!199284 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50906 e!164680))

(assert (=> start!50906 true))

(declare-fun inv!12 (BitStream!10132) Bool)

(assert (=> start!50906 (and (inv!12 thiss!1830) e!164681)))

(assert (= (and start!50906 res!199284) b!238413))

(assert (= (and b!238413 res!199282) b!238411))

(assert (= (and b!238411 res!199283) b!238416))

(assert (= (and b!238416 res!199280) b!238412))

(assert (= (and b!238412 res!199279) b!238415))

(assert (= (and b!238415 res!199281) b!238414))

(assert (= (and b!238414 res!199278) b!238417))

(assert (= start!50906 b!238418))

(declare-fun m!360555 () Bool)

(assert (=> b!238416 m!360555))

(declare-fun m!360557 () Bool)

(assert (=> start!50906 m!360557))

(declare-fun m!360559 () Bool)

(assert (=> b!238413 m!360559))

(declare-fun m!360561 () Bool)

(assert (=> b!238418 m!360561))

(declare-fun m!360563 () Bool)

(assert (=> b!238415 m!360563))

(declare-fun m!360565 () Bool)

(assert (=> b!238415 m!360565))

(declare-fun m!360567 () Bool)

(assert (=> b!238414 m!360567))

(declare-fun m!360569 () Bool)

(assert (=> b!238414 m!360569))

(declare-fun m!360571 () Bool)

(assert (=> b!238411 m!360571))

(push 1)

(assert (not b!238418))

(assert (not start!50906))

(assert (not b!238411))

(assert (not b!238414))

(assert (not b!238415))

(assert (not b!238416))

(assert (not b!238413))

(check-sat)

(pop 1)

(push 1)

(check-sat)

