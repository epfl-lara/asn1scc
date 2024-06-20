; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50904 () Bool)

(assert start!50904)

(declare-fun b!238387 () Bool)

(declare-fun res!199260 () Bool)

(declare-fun e!164666 () Bool)

(assert (=> b!238387 (=> (not res!199260) (not e!164666))))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun i!752 () (_ BitVec 32))

(assert (=> b!238387 (= res!199260 (not (= nBits!581 i!752)))))

(declare-fun b!238389 () Bool)

(declare-fun e!164663 () Bool)

(assert (=> b!238389 (= e!164666 e!164663)))

(declare-fun res!199263 () Bool)

(assert (=> b!238389 (=> (not res!199263) (not e!164663))))

(declare-datatypes ((array!12710 0))(
  ( (array!12711 (arr!6570 (Array (_ BitVec 32) (_ BitVec 8))) (size!5583 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10130 0))(
  ( (BitStream!10131 (buf!6058 array!12710) (currentByte!11244 (_ BitVec 32)) (currentBit!11239 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!20126 0))(
  ( (tuple2!20127 (_1!10967 (_ BitVec 64)) (_2!10967 BitStream!10130)) )
))
(declare-fun lt!373244 () tuple2!20126)

(declare-fun thiss!1830 () BitStream!10130)

(assert (=> b!238389 (= res!199263 (= (buf!6058 (_2!10967 lt!373244)) (buf!6058 thiss!1830)))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-datatypes ((tuple2!20128 0))(
  ( (tuple2!20129 (_1!10968 Bool) (_2!10968 BitStream!10130)) )
))
(declare-fun lt!373245 () tuple2!20128)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!10130 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!20126)

(assert (=> b!238389 (= lt!373244 (readNLeastSignificantBitsLoop!0 (_2!10968 lt!373245) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!10968 lt!373245) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun readBit!0 (BitStream!10130) tuple2!20128)

(assert (=> b!238389 (= lt!373245 (readBit!0 thiss!1830))))

(declare-fun b!238390 () Bool)

(declare-fun e!164664 () Bool)

(declare-fun array_inv!5324 (array!12710) Bool)

(assert (=> b!238390 (= e!164664 (array_inv!5324 (buf!6058 thiss!1830)))))

(declare-fun b!238391 () Bool)

(declare-fun e!164665 () Bool)

(assert (=> b!238391 (= e!164665 e!164666)))

(declare-fun res!199261 () Bool)

(assert (=> b!238391 (=> (not res!199261) (not e!164666))))

(declare-fun lt!373243 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!238391 (= res!199261 (validate_offset_bits!1 ((_ sign_extend 32) (size!5583 (buf!6058 thiss!1830))) ((_ sign_extend 32) (currentByte!11244 thiss!1830)) ((_ sign_extend 32) (currentBit!11239 thiss!1830)) lt!373243))))

(assert (=> b!238391 (= lt!373243 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(declare-fun b!238388 () Bool)

(assert (=> b!238388 (= e!164663 (or (bvslt lt!373243 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt lt!373243 #b0000000000000000000000000000000000000000000000000000000001000000)))))

(declare-fun res!199257 () Bool)

(assert (=> start!50904 (=> (not res!199257) (not e!164665))))

(assert (=> start!50904 (= res!199257 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50904 e!164665))

(assert (=> start!50904 true))

(declare-fun inv!12 (BitStream!10130) Bool)

(assert (=> start!50904 (and (inv!12 thiss!1830) e!164664)))

(declare-fun b!238392 () Bool)

(declare-fun res!199259 () Bool)

(assert (=> b!238392 (=> (not res!199259) (not e!164666))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238392 (= res!199259 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!238393 () Bool)

(declare-fun res!199262 () Bool)

(assert (=> b!238393 (=> (not res!199262) (not e!164663))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238393 (= res!199262 (= (bitIndex!0 (size!5583 (buf!6058 (_2!10967 lt!373244))) (currentByte!11244 (_2!10967 lt!373244)) (currentBit!11239 (_2!10967 lt!373244))) (bvadd (bitIndex!0 (size!5583 (buf!6058 thiss!1830)) (currentByte!11244 thiss!1830) (currentBit!11239 thiss!1830)) lt!373243)))))

(declare-fun b!238394 () Bool)

(declare-fun res!199258 () Bool)

(assert (=> b!238394 (=> (not res!199258) (not e!164666))))

(assert (=> b!238394 (= res!199258 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!50904 res!199257) b!238391))

(assert (= (and b!238391 res!199261) b!238394))

(assert (= (and b!238394 res!199258) b!238392))

(assert (= (and b!238392 res!199259) b!238387))

(assert (= (and b!238387 res!199260) b!238389))

(assert (= (and b!238389 res!199263) b!238393))

(assert (= (and b!238393 res!199262) b!238388))

(assert (= start!50904 b!238390))

(declare-fun m!360537 () Bool)

(assert (=> b!238394 m!360537))

(declare-fun m!360539 () Bool)

(assert (=> b!238391 m!360539))

(declare-fun m!360541 () Bool)

(assert (=> b!238389 m!360541))

(declare-fun m!360543 () Bool)

(assert (=> b!238389 m!360543))

(declare-fun m!360545 () Bool)

(assert (=> b!238392 m!360545))

(declare-fun m!360547 () Bool)

(assert (=> b!238393 m!360547))

(declare-fun m!360549 () Bool)

(assert (=> b!238393 m!360549))

(declare-fun m!360551 () Bool)

(assert (=> start!50904 m!360551))

(declare-fun m!360553 () Bool)

(assert (=> b!238390 m!360553))

(push 1)

(assert (not b!238392))

(assert (not b!238390))

(assert (not b!238393))

(assert (not start!50904))

(assert (not b!238389))

(assert (not b!238394))

(assert (not b!238391))

(check-sat)

(pop 1)

(push 1)

(check-sat)

