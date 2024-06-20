; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50918 () Bool)

(assert start!50918)

(declare-fun res!199407 () Bool)

(declare-fun e!164774 () Bool)

(assert (=> start!50918 (=> (not res!199407) (not e!164774))))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(assert (=> start!50918 (= res!199407 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50918 e!164774))

(assert (=> start!50918 true))

(declare-datatypes ((array!12724 0))(
  ( (array!12725 (arr!6577 (Array (_ BitVec 32) (_ BitVec 8))) (size!5590 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10144 0))(
  ( (BitStream!10145 (buf!6065 array!12724) (currentByte!11251 (_ BitVec 32)) (currentBit!11246 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10144)

(declare-fun e!164773 () Bool)

(declare-fun inv!12 (BitStream!10144) Bool)

(assert (=> start!50918 (and (inv!12 thiss!1830) e!164773)))

(declare-fun lt!373308 () (_ BitVec 64))

(declare-fun e!164771 () Bool)

(declare-fun lt!373310 () (_ BitVec 64))

(declare-fun b!238553 () Bool)

(declare-fun acc!170 () (_ BitVec 64))

(declare-datatypes ((tuple2!20154 0))(
  ( (tuple2!20155 (_1!10981 (_ BitVec 64)) (_2!10981 BitStream!10144)) )
))
(declare-fun lt!373309 () tuple2!20154)

(assert (=> b!238553 (= e!164771 (and (= (bvlshr (_1!10981 lt!373309) lt!373308) (bvlshr acc!170 lt!373308)) (= (bvand (_1!10981 lt!373309) lt!373310) (_1!10981 lt!373309)) (bvslt i!752 nBits!581) (not (= (bvand nBits!581 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))

(declare-fun b!238554 () Bool)

(declare-fun e!164772 () Bool)

(assert (=> b!238554 (= e!164772 e!164771)))

(declare-fun res!199404 () Bool)

(assert (=> b!238554 (=> (not res!199404) (not e!164771))))

(assert (=> b!238554 (= res!199404 (= (buf!6065 (_2!10981 lt!373309)) (buf!6065 thiss!1830)))))

(declare-datatypes ((tuple2!20156 0))(
  ( (tuple2!20157 (_1!10982 Bool) (_2!10982 BitStream!10144)) )
))
(declare-fun lt!373311 () tuple2!20156)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!10144 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!20154)

(assert (=> b!238554 (= lt!373309 (readNLeastSignificantBitsLoop!0 (_2!10982 lt!373311) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!10982 lt!373311) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun readBit!0 (BitStream!10144) tuple2!20156)

(assert (=> b!238554 (= lt!373311 (readBit!0 thiss!1830))))

(declare-fun b!238555 () Bool)

(declare-fun e!164769 () Bool)

(assert (=> b!238555 (= e!164769 e!164772)))

(declare-fun res!199403 () Bool)

(assert (=> b!238555 (=> (not res!199403) (not e!164772))))

(assert (=> b!238555 (= res!199403 (and (= (bvand acc!170 lt!373310) acc!170) (not (= nBits!581 i!752))))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238555 (= lt!373310 (onesLSBLong!0 nBits!581))))

(declare-fun b!238556 () Bool)

(declare-fun array_inv!5331 (array!12724) Bool)

(assert (=> b!238556 (= e!164773 (array_inv!5331 (buf!6065 thiss!1830)))))

(declare-fun b!238557 () Bool)

(declare-fun res!199402 () Bool)

(assert (=> b!238557 (=> (not res!199402) (not e!164769))))

(assert (=> b!238557 (= res!199402 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!238558 () Bool)

(declare-fun res!199405 () Bool)

(assert (=> b!238558 (=> (not res!199405) (not e!164771))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238558 (= res!199405 (= (bitIndex!0 (size!5590 (buf!6065 (_2!10981 lt!373309))) (currentByte!11251 (_2!10981 lt!373309)) (currentBit!11246 (_2!10981 lt!373309))) (bvadd (bitIndex!0 (size!5590 (buf!6065 thiss!1830)) (currentByte!11251 thiss!1830) (currentBit!11246 thiss!1830)) lt!373308)))))

(declare-fun b!238559 () Bool)

(assert (=> b!238559 (= e!164774 e!164769)))

(declare-fun res!199406 () Bool)

(assert (=> b!238559 (=> (not res!199406) (not e!164769))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!238559 (= res!199406 (validate_offset_bits!1 ((_ sign_extend 32) (size!5590 (buf!6065 thiss!1830))) ((_ sign_extend 32) (currentByte!11251 thiss!1830)) ((_ sign_extend 32) (currentBit!11246 thiss!1830)) lt!373308))))

(assert (=> b!238559 (= lt!373308 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(assert (= (and start!50918 res!199407) b!238559))

(assert (= (and b!238559 res!199406) b!238557))

(assert (= (and b!238557 res!199402) b!238555))

(assert (= (and b!238555 res!199403) b!238554))

(assert (= (and b!238554 res!199404) b!238558))

(assert (= (and b!238558 res!199405) b!238553))

(assert (= start!50918 b!238556))

(declare-fun m!360663 () Bool)

(assert (=> b!238559 m!360663))

(declare-fun m!360665 () Bool)

(assert (=> b!238557 m!360665))

(declare-fun m!360667 () Bool)

(assert (=> b!238558 m!360667))

(declare-fun m!360669 () Bool)

(assert (=> b!238558 m!360669))

(declare-fun m!360671 () Bool)

(assert (=> start!50918 m!360671))

(declare-fun m!360673 () Bool)

(assert (=> b!238555 m!360673))

(declare-fun m!360675 () Bool)

(assert (=> b!238556 m!360675))

(declare-fun m!360677 () Bool)

(assert (=> b!238554 m!360677))

(declare-fun m!360679 () Bool)

(assert (=> b!238554 m!360679))

(push 1)

(assert (not b!238556))

(assert (not b!238555))

(assert (not b!238559))

(assert (not b!238554))

(assert (not b!238558))

(assert (not b!238557))

(assert (not start!50918))

(check-sat)

(pop 1)

(push 1)

(check-sat)

