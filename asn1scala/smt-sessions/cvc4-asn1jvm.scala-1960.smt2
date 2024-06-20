; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50844 () Bool)

(assert start!50844)

(declare-fun res!199007 () Bool)

(declare-fun e!164474 () Bool)

(assert (=> start!50844 (=> (not res!199007) (not e!164474))))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(assert (=> start!50844 (= res!199007 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50844 e!164474))

(assert (=> start!50844 true))

(declare-datatypes ((array!12689 0))(
  ( (array!12690 (arr!6561 (Array (_ BitVec 32) (_ BitVec 8))) (size!5574 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10112 0))(
  ( (BitStream!10113 (buf!6049 array!12689) (currentByte!11229 (_ BitVec 32)) (currentBit!11224 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10112)

(declare-fun e!164471 () Bool)

(declare-fun inv!12 (BitStream!10112) Bool)

(assert (=> start!50844 (and (inv!12 thiss!1830) e!164471)))

(declare-fun b!238091 () Bool)

(declare-fun e!164472 () Bool)

(assert (=> b!238091 (= e!164474 e!164472)))

(declare-fun res!199010 () Bool)

(assert (=> b!238091 (=> (not res!199010) (not e!164472))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-datatypes ((tuple2!20078 0))(
  ( (tuple2!20079 (_1!10943 Bool) (_2!10943 BitStream!10112)) )
))
(declare-fun lt!372957 () tuple2!20078)

(declare-datatypes ((tuple2!20080 0))(
  ( (tuple2!20081 (_1!10944 (_ BitVec 64)) (_2!10944 BitStream!10112)) )
))
(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!10112 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!20080)

(assert (=> b!238091 (= res!199010 (= (buf!6049 (_2!10944 (readNLeastSignificantBitsLoop!0 (_2!10943 lt!372957) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!10943 lt!372957) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (buf!6049 thiss!1830)))))

(declare-fun readBit!0 (BitStream!10112) tuple2!20078)

(assert (=> b!238091 (= lt!372957 (readBit!0 thiss!1830))))

(declare-fun b!238092 () Bool)

(declare-fun res!199011 () Bool)

(assert (=> b!238092 (=> (not res!199011) (not e!164474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!238092 (= res!199011 (validate_offset_bits!1 ((_ sign_extend 32) (size!5574 (buf!6049 thiss!1830))) ((_ sign_extend 32) (currentByte!11229 thiss!1830)) ((_ sign_extend 32) (currentBit!11224 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!238093 () Bool)

(declare-fun res!199006 () Bool)

(assert (=> b!238093 (=> (not res!199006) (not e!164474))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238093 (= res!199006 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!238094 () Bool)

(assert (=> b!238094 (= e!164472 (and (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand i!752 #b10000000000000000000000000000000))) (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 i!752) #b10000000000000000000000000000000)))))))

(declare-fun lt!372956 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238094 (= lt!372956 (bitIndex!0 (size!5574 (buf!6049 thiss!1830)) (currentByte!11229 thiss!1830) (currentBit!11224 thiss!1830)))))

(declare-fun b!238095 () Bool)

(declare-fun res!199009 () Bool)

(assert (=> b!238095 (=> (not res!199009) (not e!164474))))

(assert (=> b!238095 (= res!199009 (not (= nBits!581 i!752)))))

(declare-fun b!238096 () Bool)

(declare-fun array_inv!5315 (array!12689) Bool)

(assert (=> b!238096 (= e!164471 (array_inv!5315 (buf!6049 thiss!1830)))))

(declare-fun b!238097 () Bool)

(declare-fun res!199008 () Bool)

(assert (=> b!238097 (=> (not res!199008) (not e!164474))))

(assert (=> b!238097 (= res!199008 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(assert (= (and start!50844 res!199007) b!238092))

(assert (= (and b!238092 res!199011) b!238093))

(assert (= (and b!238093 res!199006) b!238097))

(assert (= (and b!238097 res!199008) b!238095))

(assert (= (and b!238095 res!199009) b!238091))

(assert (= (and b!238091 res!199010) b!238094))

(assert (= start!50844 b!238096))

(declare-fun m!360311 () Bool)

(assert (=> start!50844 m!360311))

(declare-fun m!360313 () Bool)

(assert (=> b!238092 m!360313))

(declare-fun m!360315 () Bool)

(assert (=> b!238094 m!360315))

(declare-fun m!360317 () Bool)

(assert (=> b!238091 m!360317))

(declare-fun m!360319 () Bool)

(assert (=> b!238091 m!360319))

(declare-fun m!360321 () Bool)

(assert (=> b!238093 m!360321))

(declare-fun m!360323 () Bool)

(assert (=> b!238096 m!360323))

(declare-fun m!360325 () Bool)

(assert (=> b!238097 m!360325))

(push 1)

(assert (not start!50844))

(assert (not b!238091))

(assert (not b!238093))

(assert (not b!238096))

(assert (not b!238094))

(assert (not b!238097))

(assert (not b!238092))

(check-sat)

(pop 1)

(push 1)

(check-sat)

