; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50940 () Bool)

(assert start!50940)

(declare-fun b!238800 () Bool)

(declare-fun res!199622 () Bool)

(declare-fun e!164979 () Bool)

(assert (=> b!238800 (=> res!199622 e!164979)))

(declare-datatypes ((array!12746 0))(
  ( (array!12747 (arr!6588 (Array (_ BitVec 32) (_ BitVec 8))) (size!5601 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10166 0))(
  ( (BitStream!10167 (buf!6076 array!12746) (currentByte!11262 (_ BitVec 32)) (currentBit!11257 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10166)

(declare-fun lt!373441 () (_ BitVec 64))

(declare-datatypes ((tuple2!20202 0))(
  ( (tuple2!20203 (_1!11005 (_ BitVec 64)) (_2!11005 BitStream!10166)) )
))
(declare-fun lt!373440 () tuple2!20202)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238800 (= res!199622 (not (= (bitIndex!0 (size!5601 (buf!6076 (_2!11005 lt!373440))) (currentByte!11262 (_2!11005 lt!373440)) (currentBit!11257 (_2!11005 lt!373440))) (bvadd (bitIndex!0 (size!5601 (buf!6076 thiss!1830)) (currentByte!11262 thiss!1830) (currentBit!11257 thiss!1830)) lt!373441))))))

(declare-fun b!238801 () Bool)

(declare-fun res!199617 () Bool)

(declare-fun e!164976 () Bool)

(assert (=> b!238801 (=> (not res!199617) (not e!164976))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238801 (= res!199617 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!238802 () Bool)

(declare-fun res!199620 () Bool)

(assert (=> b!238802 (=> res!199620 e!164979)))

(declare-fun lt!373443 () (_ BitVec 64))

(assert (=> b!238802 (= res!199620 (or (not (= (bvlshr (_1!11005 lt!373440) lt!373441) (bvlshr acc!170 lt!373441))) (not (= (bvand (_1!11005 lt!373440) lt!373443) (_1!11005 lt!373440)))))))

(declare-fun b!238803 () Bool)

(declare-fun e!164977 () Bool)

(assert (=> b!238803 (= e!164977 e!164976)))

(declare-fun res!199616 () Bool)

(assert (=> b!238803 (=> (not res!199616) (not e!164976))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!238803 (= res!199616 (validate_offset_bits!1 ((_ sign_extend 32) (size!5601 (buf!6076 thiss!1830))) ((_ sign_extend 32) (currentByte!11262 thiss!1830)) ((_ sign_extend 32) (currentBit!11257 thiss!1830)) lt!373441))))

(assert (=> b!238803 (= lt!373441 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(declare-fun b!238804 () Bool)

(declare-fun e!164978 () Bool)

(declare-fun array_inv!5342 (array!12746) Bool)

(assert (=> b!238804 (= e!164978 (array_inv!5342 (buf!6076 thiss!1830)))))

(declare-fun res!199618 () Bool)

(assert (=> start!50940 (=> (not res!199618) (not e!164977))))

(assert (=> start!50940 (= res!199618 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50940 e!164977))

(assert (=> start!50940 true))

(declare-fun inv!12 (BitStream!10166) Bool)

(assert (=> start!50940 (and (inv!12 thiss!1830) e!164978)))

(declare-fun b!238805 () Bool)

(declare-fun e!164975 () Bool)

(assert (=> b!238805 (= e!164976 e!164975)))

(declare-fun res!199623 () Bool)

(assert (=> b!238805 (=> (not res!199623) (not e!164975))))

(assert (=> b!238805 (= res!199623 (and (= (bvand acc!170 lt!373443) acc!170) (not (= nBits!581 i!752))))))

(assert (=> b!238805 (= lt!373443 (onesLSBLong!0 nBits!581))))

(declare-fun b!238806 () Bool)

(declare-fun e!164981 () Bool)

(assert (=> b!238806 (= e!164979 e!164981)))

(declare-fun res!199621 () Bool)

(assert (=> b!238806 (=> (not res!199621) (not e!164981))))

(assert (=> b!238806 (= res!199621 (bvslt i!752 nBits!581))))

(declare-fun b!238807 () Bool)

(assert (=> b!238807 (= e!164975 e!164979)))

(declare-fun res!199619 () Bool)

(assert (=> b!238807 (=> res!199619 e!164979)))

(assert (=> b!238807 (= res!199619 (not (= (buf!6076 (_2!11005 lt!373440)) (buf!6076 thiss!1830))))))

(declare-datatypes ((tuple2!20204 0))(
  ( (tuple2!20205 (_1!11006 Bool) (_2!11006 BitStream!10166)) )
))
(declare-fun lt!373442 () tuple2!20204)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!10166 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!20202)

(assert (=> b!238807 (= lt!373440 (readNLeastSignificantBitsLoop!0 (_2!11006 lt!373442) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!11006 lt!373442) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun readBit!0 (BitStream!10166) tuple2!20204)

(assert (=> b!238807 (= lt!373442 (readBit!0 thiss!1830))))

(declare-fun b!238808 () Bool)

(declare-datatypes ((tuple2!20206 0))(
  ( (tuple2!20207 (_1!11007 BitStream!10166) (_2!11007 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!10166) tuple2!20206)

(assert (=> b!238808 (= e!164981 (not (= (= (bvand (bvlshr (_1!11005 lt!373440) ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!11007 (readBitPure!0 thiss!1830)))))))

(assert (= (and start!50940 res!199618) b!238803))

(assert (= (and b!238803 res!199616) b!238801))

(assert (= (and b!238801 res!199617) b!238805))

(assert (= (and b!238805 res!199623) b!238807))

(assert (= (and b!238807 (not res!199619)) b!238800))

(assert (= (and b!238800 (not res!199622)) b!238802))

(assert (= (and b!238802 (not res!199620)) b!238806))

(assert (= (and b!238806 res!199621) b!238808))

(assert (= start!50940 b!238804))

(declare-fun m!360865 () Bool)

(assert (=> b!238803 m!360865))

(declare-fun m!360867 () Bool)

(assert (=> b!238800 m!360867))

(declare-fun m!360869 () Bool)

(assert (=> b!238800 m!360869))

(declare-fun m!360871 () Bool)

(assert (=> b!238805 m!360871))

(declare-fun m!360873 () Bool)

(assert (=> b!238807 m!360873))

(declare-fun m!360875 () Bool)

(assert (=> b!238807 m!360875))

(declare-fun m!360877 () Bool)

(assert (=> b!238808 m!360877))

(declare-fun m!360879 () Bool)

(assert (=> b!238801 m!360879))

(declare-fun m!360881 () Bool)

(assert (=> b!238804 m!360881))

(declare-fun m!360883 () Bool)

(assert (=> start!50940 m!360883))

(push 1)

(assert (not b!238801))

(assert (not b!238808))

(assert (not start!50940))

(assert (not b!238800))

(assert (not b!238803))

(assert (not b!238804))

(assert (not b!238807))

(assert (not b!238805))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80272 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!80272 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5601 (buf!6076 thiss!1830))) ((_ sign_extend 32) (currentByte!11262 thiss!1830)) ((_ sign_extend 32) (currentBit!11257 thiss!1830)) lt!373441) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5601 (buf!6076 thiss!1830))) ((_ sign_extend 32) (currentByte!11262 thiss!1830)) ((_ sign_extend 32) (currentBit!11257 thiss!1830))) lt!373441))))

(declare-fun bs!20081 () Bool)

(assert (= bs!20081 d!80272))

(declare-fun m!360901 () Bool)

(assert (=> bs!20081 m!360901))

(assert (=> b!238803 d!80272))

(declare-fun d!80274 () Bool)

(declare-fun lt!373524 () tuple2!20204)

(assert (=> d!80274 (= lt!373524 (readBit!0 thiss!1830))))

(assert (=> d!80274 (= (readBitPure!0 thiss!1830) (tuple2!20207 (_2!11006 lt!373524) (_1!11006 lt!373524)))))

(declare-fun bs!20082 () Bool)

(assert (= bs!20082 d!80274))

(assert (=> bs!20082 m!360875))

(assert (=> b!238808 d!80274))

(declare-fun b!238884 () Bool)

(declare-fun res!199685 () Bool)

(declare-fun e!165026 () Bool)

(assert (=> b!238884 (=> (not res!199685) (not e!165026))))

(declare-fun lt!373601 () (_ BitVec 64))

(declare-fun lt!373595 () tuple2!20202)

(declare-fun lt!373600 () (_ BitVec 64))

(assert (=> b!238884 (= res!199685 (= (bvlshr (_1!11005 lt!373595) lt!373600) (bvlshr (bvor acc!170 (ite (_1!11006 lt!373442) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!373601)))))

(assert (=> b!238884 (and (bvsge lt!373601 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!373601 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!238884 (= lt!373601 ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752))))))

(assert (=> b!238884 (or (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)) #b10000000000000000000000000000000)))))

(assert (=> b!238884 (and (bvsge lt!373600 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!373600 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!238884 (= lt!373600 ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752))))))

(assert (=> b!238884 (or (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)) #b10000000000000000000000000000000)))))

(declare-fun b!238885 () Bool)

(declare-fun e!165024 () Bool)

(assert (=> b!238885 (= e!165026 e!165024)))

(declare-fun res!199684 () Bool)

(assert (=> b!238885 (=> res!199684 e!165024)))

(assert (=> b!238885 (= res!199684 (bvsge (bvadd #b00000000000000000000000000000001 i!752) nBits!581))))

(declare-fun b!238886 () Bool)

(declare-fun res!199687 () Bool)

(assert (=> b!238886 (=> (not res!199687) (not e!165026))))

(assert (=> b!238886 (= res!199687 (= (bvand (_1!11005 lt!373595) (onesLSBLong!0 nBits!581)) (_1!11005 lt!373595)))))

(declare-fun b!238887 () Bool)

(declare-fun res!199683 () Bool)

(assert (=> b!238887 (=> (not res!199683) (not e!165026))))

(declare-fun lt!373599 () (_ BitVec 64))

(declare-fun lt!373598 () (_ BitVec 64))

(assert (=> b!238887 (= res!199683 (= (bitIndex!0 (size!5601 (buf!6076 (_2!11005 lt!373595))) (currentByte!11262 (_2!11005 lt!373595)) (currentBit!11257 (_2!11005 lt!373595))) (bvadd lt!373599 lt!373598)))))

(assert (=> b!238887 (or (not (= (bvand lt!373599 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!373598 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!373599 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!373599 lt!373598) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!238887 (= lt!373598 ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752))))))

(assert (=> b!238887 (or (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)) #b10000000000000000000000000000000)))))

(assert (=> b!238887 (= lt!373599 (bitIndex!0 (size!5601 (buf!6076 (_2!11006 lt!373442))) (currentByte!11262 (_2!11006 lt!373442)) (currentBit!11257 (_2!11006 lt!373442))))))

(declare-fun b!238888 () Bool)

(declare-fun e!165025 () tuple2!20202)

(declare-fun lt!373597 () tuple2!20202)

(assert (=> b!238888 (= e!165025 (tuple2!20203 (_1!11005 lt!373597) (_2!11005 lt!373597)))))

(declare-fun lt!373594 () tuple2!20204)

(assert (=> b!238888 (= lt!373594 (readBit!0 (_2!11006 lt!373442)))))

(assert (=> b!238888 (= lt!373597 (readNLeastSignificantBitsLoop!0 (_2!11006 lt!373594) nBits!581 (bvadd #b00000000000000000000000000000001 i!752 #b00000000000000000000000000000001) (bvor (bvor acc!170 (ite (_1!11006 lt!373442) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!11006 lt!373594) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!752)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!80276 () Bool)

(assert (=> d!80276 e!165026))

(declare-fun res!199686 () Bool)

(assert (=> d!80276 (=> (not res!199686) (not e!165026))))

(assert (=> d!80276 (= res!199686 (= (buf!6076 (_2!11005 lt!373595)) (buf!6076 (_2!11006 lt!373442))))))

(assert (=> d!80276 (= lt!373595 e!165025)))

(declare-fun c!11368 () Bool)

(assert (=> d!80276 (= c!11368 (= nBits!581 (bvadd #b00000000000000000000000000000001 i!752)))))

(assert (=> d!80276 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!752)) (bvsle (bvadd #b00000000000000000000000000000001 i!752) nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000))))

(assert (=> d!80276 (= (readNLeastSignificantBitsLoop!0 (_2!11006 lt!373442) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!11006 lt!373442) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!373595)))

(declare-fun b!238889 () Bool)

(declare-fun lt!373602 () (_ BitVec 64))

(assert (=> b!238889 (= e!165024 (= (= (bvand (bvlshr (_1!11005 lt!373595) lt!373602) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!11007 (readBitPure!0 (_2!11006 lt!373442)))))))

(assert (=> b!238889 (and (bvsge lt!373602 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!373602 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!373596 () (_ BitVec 32))

(assert (=> b!238889 (= lt!373602 ((_ sign_extend 32) (bvsub lt!373596 (bvadd #b00000000000000000000000000000001 i!752))))))

(assert (=> b!238889 (or (= (bvand lt!373596 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)) (= (bvand lt!373596 #b10000000000000000000000000000000) (bvand (bvsub lt!373596 (bvadd #b00000000000000000000000000000001 i!752)) #b10000000000000000000000000000000)))))

(assert (=> b!238889 (= lt!373596 (bvsub nBits!581 #b00000000000000000000000000000001))))

(assert (=> b!238889 (or (= (bvand nBits!581 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!238890 () Bool)

(assert (=> b!238890 (= e!165025 (tuple2!20203 (bvor acc!170 (ite (_1!11006 lt!373442) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_2!11006 lt!373442)))))

(assert (= (and d!80276 c!11368) b!238890))

(assert (= (and d!80276 (not c!11368)) b!238888))

(assert (= (and d!80276 res!199686) b!238887))

(assert (= (and b!238887 res!199683) b!238884))

(assert (= (and b!238884 res!199685) b!238886))

(assert (= (and b!238886 res!199687) b!238885))

(assert (= (and b!238885 (not res!199684)) b!238889))

(assert (=> b!238886 m!360871))

(declare-fun m!360933 () Bool)

(assert (=> b!238887 m!360933))

(declare-fun m!360935 () Bool)

(assert (=> b!238887 m!360935))

(declare-fun m!360937 () Bool)

(assert (=> b!238888 m!360937))

(declare-fun m!360939 () Bool)

(assert (=> b!238888 m!360939))

(declare-fun m!360941 () Bool)

(assert (=> b!238889 m!360941))

(assert (=> b!238807 d!80276))

(declare-fun d!80284 () Bool)

(declare-fun e!165037 () Bool)

(assert (=> d!80284 e!165037))

(declare-fun res!199693 () Bool)

(assert (=> d!80284 (=> (not res!199693) (not e!165037))))

(declare-datatypes ((Unit!17405 0))(
  ( (Unit!17406) )
))
(declare-datatypes ((tuple2!20212 0))(
  ( (tuple2!20213 (_1!11010 Unit!17405) (_2!11010 BitStream!10166)) )
))
(declare-fun increaseBitIndex!0 (BitStream!10166) tuple2!20212)

(assert (=> d!80284 (= res!199693 (= (buf!6076 (_2!11010 (increaseBitIndex!0 thiss!1830))) (buf!6076 thiss!1830)))))

(declare-fun lt!373640 () Bool)

(assert (=> d!80284 (= lt!373640 (not (= (bvand ((_ sign_extend 24) (select (arr!6588 (buf!6076 thiss!1830)) (currentByte!11262 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11257 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!373644 () tuple2!20204)

(assert (=> d!80284 (= lt!373644 (tuple2!20205 (not (= (bvand ((_ sign_extend 24) (select (arr!6588 (buf!6076 thiss!1830)) (currentByte!11262 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11257 thiss!1830)))) #b00000000000000000000000000000000)) (_2!11010 (increaseBitIndex!0 thiss!1830))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!80284 (validate_offset_bit!0 ((_ sign_extend 32) (size!5601 (buf!6076 thiss!1830))) ((_ sign_extend 32) (currentByte!11262 thiss!1830)) ((_ sign_extend 32) (currentBit!11257 thiss!1830)))))

(assert (=> d!80284 (= (readBit!0 thiss!1830) lt!373644)))

(declare-fun lt!373641 () (_ BitVec 64))

(declare-fun lt!373638 () (_ BitVec 64))

(declare-fun b!238896 () Bool)

(assert (=> b!238896 (= e!165037 (= (bitIndex!0 (size!5601 (buf!6076 (_2!11010 (increaseBitIndex!0 thiss!1830)))) (currentByte!11262 (_2!11010 (increaseBitIndex!0 thiss!1830))) (currentBit!11257 (_2!11010 (increaseBitIndex!0 thiss!1830)))) (bvadd lt!373638 lt!373641)))))

(assert (=> b!238896 (or (not (= (bvand lt!373638 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!373641 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!373638 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!373638 lt!373641) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!238896 (= lt!373641 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!238896 (= lt!373638 (bitIndex!0 (size!5601 (buf!6076 thiss!1830)) (currentByte!11262 thiss!1830) (currentBit!11257 thiss!1830)))))

(declare-fun lt!373642 () Bool)

(assert (=> b!238896 (= lt!373642 (not (= (bvand ((_ sign_extend 24) (select (arr!6588 (buf!6076 thiss!1830)) (currentByte!11262 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11257 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!373643 () Bool)

(assert (=> b!238896 (= lt!373643 (not (= (bvand ((_ sign_extend 24) (select (arr!6588 (buf!6076 thiss!1830)) (currentByte!11262 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11257 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!373639 () Bool)

(assert (=> b!238896 (= lt!373639 (not (= (bvand ((_ sign_extend 24) (select (arr!6588 (buf!6076 thiss!1830)) (currentByte!11262 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11257 thiss!1830)))) #b00000000000000000000000000000000)))))

(assert (= (and d!80284 res!199693) b!238896))

(declare-fun m!360953 () Bool)

(assert (=> d!80284 m!360953))

(declare-fun m!360955 () Bool)

(assert (=> d!80284 m!360955))

(declare-fun m!360957 () Bool)

(assert (=> d!80284 m!360957))

(declare-fun m!360959 () Bool)

(assert (=> d!80284 m!360959))

(declare-fun m!360961 () Bool)

(assert (=> b!238896 m!360961))

(assert (=> b!238896 m!360955))

(assert (=> b!238896 m!360869))

(assert (=> b!238896 m!360957))

(assert (=> b!238896 m!360953))

(assert (=> b!238807 d!80284))

(declare-fun d!80292 () Bool)

(declare-fun e!165040 () Bool)

(assert (=> d!80292 e!165040))

(declare-fun res!199699 () Bool)

(assert (=> d!80292 (=> (not res!199699) (not e!165040))))

(declare-fun lt!373660 () (_ BitVec 64))

(declare-fun lt!373659 () (_ BitVec 64))

(declare-fun lt!373662 () (_ BitVec 64))

(assert (=> d!80292 (= res!199699 (= lt!373660 (bvsub lt!373659 lt!373662)))))

(assert (=> d!80292 (or (= (bvand lt!373659 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!373662 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!373659 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!373659 lt!373662) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!80292 (= lt!373662 (remainingBits!0 ((_ sign_extend 32) (size!5601 (buf!6076 (_2!11005 lt!373440)))) ((_ sign_extend 32) (currentByte!11262 (_2!11005 lt!373440))) ((_ sign_extend 32) (currentBit!11257 (_2!11005 lt!373440)))))))

(declare-fun lt!373657 () (_ BitVec 64))

(declare-fun lt!373658 () (_ BitVec 64))

(assert (=> d!80292 (= lt!373659 (bvmul lt!373657 lt!373658))))

(assert (=> d!80292 (or (= lt!373657 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!373658 (bvsdiv (bvmul lt!373657 lt!373658) lt!373657)))))

(assert (=> d!80292 (= lt!373658 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!80292 (= lt!373657 ((_ sign_extend 32) (size!5601 (buf!6076 (_2!11005 lt!373440)))))))

(assert (=> d!80292 (= lt!373660 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11262 (_2!11005 lt!373440))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11257 (_2!11005 lt!373440)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80292 (invariant!0 (currentBit!11257 (_2!11005 lt!373440)) (currentByte!11262 (_2!11005 lt!373440)) (size!5601 (buf!6076 (_2!11005 lt!373440))))))

(assert (=> d!80292 (= (bitIndex!0 (size!5601 (buf!6076 (_2!11005 lt!373440))) (currentByte!11262 (_2!11005 lt!373440)) (currentBit!11257 (_2!11005 lt!373440))) lt!373660)))

(declare-fun b!238901 () Bool)

(declare-fun res!199698 () Bool)

(assert (=> b!238901 (=> (not res!199698) (not e!165040))))

(assert (=> b!238901 (= res!199698 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!373660))))

(declare-fun b!238902 () Bool)

(declare-fun lt!373661 () (_ BitVec 64))

(assert (=> b!238902 (= e!165040 (bvsle lt!373660 (bvmul lt!373661 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!238902 (or (= lt!373661 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!373661 #b0000000000000000000000000000000000000000000000000000000000001000) lt!373661)))))

(assert (=> b!238902 (= lt!373661 ((_ sign_extend 32) (size!5601 (buf!6076 (_2!11005 lt!373440)))))))

(assert (= (and d!80292 res!199699) b!238901))

(assert (= (and b!238901 res!199698) b!238902))

(declare-fun m!360963 () Bool)

(assert (=> d!80292 m!360963))

(declare-fun m!360965 () Bool)

(assert (=> d!80292 m!360965))

(assert (=> b!238800 d!80292))

(declare-fun d!80294 () Bool)

(declare-fun e!165041 () Bool)

(assert (=> d!80294 e!165041))

(declare-fun res!199701 () Bool)

(assert (=> d!80294 (=> (not res!199701) (not e!165041))))

(declare-fun lt!373666 () (_ BitVec 64))

(declare-fun lt!373668 () (_ BitVec 64))

(declare-fun lt!373665 () (_ BitVec 64))

(assert (=> d!80294 (= res!199701 (= lt!373666 (bvsub lt!373665 lt!373668)))))

(assert (=> d!80294 (or (= (bvand lt!373665 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!373668 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!373665 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!373665 lt!373668) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!80294 (= lt!373668 (remainingBits!0 ((_ sign_extend 32) (size!5601 (buf!6076 thiss!1830))) ((_ sign_extend 32) (currentByte!11262 thiss!1830)) ((_ sign_extend 32) (currentBit!11257 thiss!1830))))))

(declare-fun lt!373663 () (_ BitVec 64))

(declare-fun lt!373664 () (_ BitVec 64))

(assert (=> d!80294 (= lt!373665 (bvmul lt!373663 lt!373664))))

(assert (=> d!80294 (or (= lt!373663 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!373664 (bvsdiv (bvmul lt!373663 lt!373664) lt!373663)))))

(assert (=> d!80294 (= lt!373664 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!80294 (= lt!373663 ((_ sign_extend 32) (size!5601 (buf!6076 thiss!1830))))))

(assert (=> d!80294 (= lt!373666 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11262 thiss!1830)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11257 thiss!1830))))))

(assert (=> d!80294 (invariant!0 (currentBit!11257 thiss!1830) (currentByte!11262 thiss!1830) (size!5601 (buf!6076 thiss!1830)))))

(assert (=> d!80294 (= (bitIndex!0 (size!5601 (buf!6076 thiss!1830)) (currentByte!11262 thiss!1830) (currentBit!11257 thiss!1830)) lt!373666)))

(declare-fun b!238903 () Bool)

(declare-fun res!199700 () Bool)

(assert (=> b!238903 (=> (not res!199700) (not e!165041))))

(assert (=> b!238903 (= res!199700 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!373666))))

(declare-fun b!238904 () Bool)

(declare-fun lt!373667 () (_ BitVec 64))

(assert (=> b!238904 (= e!165041 (bvsle lt!373666 (bvmul lt!373667 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!238904 (or (= lt!373667 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!373667 #b0000000000000000000000000000000000000000000000000000000000001000) lt!373667)))))

(assert (=> b!238904 (= lt!373667 ((_ sign_extend 32) (size!5601 (buf!6076 thiss!1830))))))

(assert (= (and d!80294 res!199701) b!238903))

(assert (= (and b!238903 res!199700) b!238904))

(assert (=> d!80294 m!360901))

(declare-fun m!360967 () Bool)

(assert (=> d!80294 m!360967))

(assert (=> b!238800 d!80294))

(declare-fun d!80296 () Bool)

(assert (=> d!80296 (= (onesLSBLong!0 (bvsub nBits!581 i!752)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!581 i!752)))))))

(assert (=> b!238801 d!80296))

(declare-fun d!80298 () Bool)

(assert (=> d!80298 (= (inv!12 thiss!1830) (invariant!0 (currentBit!11257 thiss!1830) (currentByte!11262 thiss!1830) (size!5601 (buf!6076 thiss!1830))))))

(declare-fun bs!20086 () Bool)

(assert (= bs!20086 d!80298))

(assert (=> bs!20086 m!360967))

(assert (=> start!50940 d!80298))

(declare-fun d!80300 () Bool)

(assert (=> d!80300 (= (array_inv!5342 (buf!6076 thiss!1830)) (bvsge (size!5601 (buf!6076 thiss!1830)) #b00000000000000000000000000000000))))

(assert (=> b!238804 d!80300))

(declare-fun d!80302 () Bool)

(assert (=> d!80302 (= (onesLSBLong!0 nBits!581) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!581))))))

(assert (=> b!238805 d!80302))

(push 1)

(assert (not d!80292))

(assert (not b!238896))

(assert (not b!238887))

(assert (not b!238886))

(assert (not d!80284))

(assert (not d!80298))

(assert (not d!80294))

(assert (not b!238888))

(assert (not d!80274))

(assert (not d!80272))

(assert (not b!238889))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

