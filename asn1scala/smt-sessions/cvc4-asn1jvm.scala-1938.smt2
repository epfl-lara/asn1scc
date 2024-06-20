; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50550 () Bool)

(assert start!50550)

(declare-fun b!236594 () Bool)

(declare-fun res!197758 () Bool)

(declare-fun e!163595 () Bool)

(assert (=> b!236594 (=> (not res!197758) (not e!163595))))

(declare-datatypes ((array!12554 0))(
  ( (array!12555 (arr!6498 (Array (_ BitVec 32) (_ BitVec 8))) (size!5511 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9986 0))(
  ( (BitStream!9987 (buf!5986 array!12554) (currentByte!11136 (_ BitVec 32)) (currentBit!11131 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!9986)

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!236594 (= res!197758 (validate_offset_bits!1 ((_ sign_extend 32) (size!5511 (buf!5986 thiss!1830))) ((_ sign_extend 32) (currentByte!11136 thiss!1830)) ((_ sign_extend 32) (currentBit!11131 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!236595 () Bool)

(declare-fun e!163593 () Bool)

(assert (=> b!236595 (= e!163595 e!163593)))

(declare-fun res!197762 () Bool)

(assert (=> b!236595 (=> (not res!197762) (not e!163593))))

(declare-datatypes ((tuple2!19972 0))(
  ( (tuple2!19973 (_1!10890 (_ BitVec 64)) (_2!10890 BitStream!9986)) )
))
(declare-fun lt!371964 () tuple2!19972)

(assert (=> b!236595 (= res!197762 (= (buf!5986 (_2!10890 lt!371964)) (buf!5986 thiss!1830)))))

(declare-datatypes ((tuple2!19974 0))(
  ( (tuple2!19975 (_1!10891 Bool) (_2!10891 BitStream!9986)) )
))
(declare-fun lt!371963 () tuple2!19974)

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!9986 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19972)

(assert (=> b!236595 (= lt!371964 (readNLeastSignificantBitsLoop!0 (_2!10891 lt!371963) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!10891 lt!371963) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun readBit!0 (BitStream!9986) tuple2!19974)

(assert (=> b!236595 (= lt!371963 (readBit!0 thiss!1830))))

(declare-fun b!236596 () Bool)

(declare-fun res!197759 () Bool)

(assert (=> b!236596 (=> (not res!197759) (not e!163595))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236596 (= res!197759 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!236597 () Bool)

(declare-fun e!163594 () Bool)

(declare-fun array_inv!5252 (array!12554) Bool)

(assert (=> b!236597 (= e!163594 (array_inv!5252 (buf!5986 thiss!1830)))))

(declare-fun b!236598 () Bool)

(declare-fun res!197760 () Bool)

(assert (=> b!236598 (=> (not res!197760) (not e!163595))))

(assert (=> b!236598 (= res!197760 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!197763 () Bool)

(assert (=> start!50550 (=> (not res!197763) (not e!163595))))

(assert (=> start!50550 (= res!197763 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50550 e!163595))

(assert (=> start!50550 true))

(declare-fun inv!12 (BitStream!9986) Bool)

(assert (=> start!50550 (and (inv!12 thiss!1830) e!163594)))

(declare-fun b!236599 () Bool)

(declare-fun res!197761 () Bool)

(assert (=> b!236599 (=> (not res!197761) (not e!163595))))

(assert (=> b!236599 (= res!197761 (not (= nBits!581 i!752)))))

(declare-fun b!236600 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!236600 (= e!163593 (not (invariant!0 (currentBit!11131 (_2!10890 lt!371964)) (currentByte!11136 (_2!10890 lt!371964)) (size!5511 (buf!5986 (_2!10890 lt!371964))))))))

(assert (= (and start!50550 res!197763) b!236594))

(assert (= (and b!236594 res!197758) b!236598))

(assert (= (and b!236598 res!197760) b!236596))

(assert (= (and b!236596 res!197759) b!236599))

(assert (= (and b!236599 res!197761) b!236595))

(assert (= (and b!236595 res!197762) b!236600))

(assert (= start!50550 b!236597))

(declare-fun m!359177 () Bool)

(assert (=> start!50550 m!359177))

(declare-fun m!359179 () Bool)

(assert (=> b!236600 m!359179))

(declare-fun m!359181 () Bool)

(assert (=> b!236598 m!359181))

(declare-fun m!359183 () Bool)

(assert (=> b!236597 m!359183))

(declare-fun m!359185 () Bool)

(assert (=> b!236595 m!359185))

(declare-fun m!359187 () Bool)

(assert (=> b!236595 m!359187))

(declare-fun m!359189 () Bool)

(assert (=> b!236594 m!359189))

(declare-fun m!359191 () Bool)

(assert (=> b!236596 m!359191))

(push 1)

(assert (not b!236597))

(assert (not b!236594))

(assert (not start!50550))

(assert (not b!236598))

(assert (not b!236600))

(assert (not b!236596))

(assert (not b!236595))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!79930 () Bool)

(assert (=> d!79930 (= (onesLSBLong!0 (bvsub nBits!581 i!752)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!581 i!752)))))))

(assert (=> b!236598 d!79930))

(declare-fun d!79932 () Bool)

(assert (=> d!79932 (= (array_inv!5252 (buf!5986 thiss!1830)) (bvsge (size!5511 (buf!5986 thiss!1830)) #b00000000000000000000000000000000))))

(assert (=> b!236597 d!79932))

(declare-fun d!79934 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!79934 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5511 (buf!5986 thiss!1830))) ((_ sign_extend 32) (currentByte!11136 thiss!1830)) ((_ sign_extend 32) (currentBit!11131 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5511 (buf!5986 thiss!1830))) ((_ sign_extend 32) (currentByte!11136 thiss!1830)) ((_ sign_extend 32) (currentBit!11131 thiss!1830))) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun bs!19955 () Bool)

(assert (= bs!19955 d!79934))

(declare-fun m!359199 () Bool)

(assert (=> bs!19955 m!359199))

(assert (=> b!236594 d!79934))

(declare-fun b!236663 () Bool)

(declare-fun e!163636 () tuple2!19972)

(assert (=> b!236663 (= e!163636 (tuple2!19973 (bvor acc!170 (ite (_1!10891 lt!371963) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_2!10891 lt!371963)))))

(declare-fun b!236664 () Bool)

(declare-fun res!197814 () Bool)

(declare-fun e!163635 () Bool)

(assert (=> b!236664 (=> (not res!197814) (not e!163635))))

(declare-fun lt!372085 () tuple2!19972)

(assert (=> b!236664 (= res!197814 (= (bvand (_1!10890 lt!372085) (onesLSBLong!0 nBits!581)) (_1!10890 lt!372085)))))

(declare-fun b!236665 () Bool)

(declare-fun res!197812 () Bool)

(assert (=> b!236665 (=> (not res!197812) (not e!163635))))

(declare-fun lt!372084 () (_ BitVec 64))

(declare-fun lt!372082 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236665 (= res!197812 (= (bitIndex!0 (size!5511 (buf!5986 (_2!10890 lt!372085))) (currentByte!11136 (_2!10890 lt!372085)) (currentBit!11131 (_2!10890 lt!372085))) (bvadd lt!372082 lt!372084)))))

(assert (=> b!236665 (or (not (= (bvand lt!372082 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!372084 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!372082 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!372082 lt!372084) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!236665 (= lt!372084 ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752))))))

(assert (=> b!236665 (or (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)) #b10000000000000000000000000000000)))))

(assert (=> b!236665 (= lt!372082 (bitIndex!0 (size!5511 (buf!5986 (_2!10891 lt!371963))) (currentByte!11136 (_2!10891 lt!371963)) (currentBit!11131 (_2!10891 lt!371963))))))

(declare-fun b!236667 () Bool)

(declare-fun e!163634 () Bool)

(assert (=> b!236667 (= e!163635 e!163634)))

(declare-fun res!197811 () Bool)

(assert (=> b!236667 (=> res!197811 e!163634)))

(assert (=> b!236667 (= res!197811 (bvsge (bvadd #b00000000000000000000000000000001 i!752) nBits!581))))

(declare-fun b!236668 () Bool)

(declare-fun res!197813 () Bool)

(assert (=> b!236668 (=> (not res!197813) (not e!163635))))

(declare-fun lt!372087 () (_ BitVec 64))

(declare-fun lt!372080 () (_ BitVec 64))

(assert (=> b!236668 (= res!197813 (= (bvlshr (_1!10890 lt!372085) lt!372087) (bvlshr (bvor acc!170 (ite (_1!10891 lt!371963) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!372080)))))

(assert (=> b!236668 (and (bvsge lt!372080 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!372080 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!236668 (= lt!372080 ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752))))))

(assert (=> b!236668 (or (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)) #b10000000000000000000000000000000)))))

(assert (=> b!236668 (and (bvsge lt!372087 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!372087 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!236668 (= lt!372087 ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752))))))

(assert (=> b!236668 (or (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)) #b10000000000000000000000000000000)))))

(declare-fun lt!372086 () (_ BitVec 64))

(declare-fun b!236669 () Bool)

(declare-datatypes ((tuple2!19984 0))(
  ( (tuple2!19985 (_1!10896 BitStream!9986) (_2!10896 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!9986) tuple2!19984)

(assert (=> b!236669 (= e!163634 (= (= (bvand (bvlshr (_1!10890 lt!372085) lt!372086) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!10896 (readBitPure!0 (_2!10891 lt!371963)))))))

(assert (=> b!236669 (and (bvsge lt!372086 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!372086 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!372079 () (_ BitVec 32))

(assert (=> b!236669 (= lt!372086 ((_ sign_extend 32) (bvsub lt!372079 (bvadd #b00000000000000000000000000000001 i!752))))))

(assert (=> b!236669 (or (= (bvand lt!372079 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)) (= (bvand lt!372079 #b10000000000000000000000000000000) (bvand (bvsub lt!372079 (bvadd #b00000000000000000000000000000001 i!752)) #b10000000000000000000000000000000)))))

(assert (=> b!236669 (= lt!372079 (bvsub nBits!581 #b00000000000000000000000000000001))))

(assert (=> b!236669 (or (= (bvand nBits!581 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!236666 () Bool)

(declare-fun lt!372081 () tuple2!19972)

(assert (=> b!236666 (= e!163636 (tuple2!19973 (_1!10890 lt!372081) (_2!10890 lt!372081)))))

(declare-fun lt!372083 () tuple2!19974)

(assert (=> b!236666 (= lt!372083 (readBit!0 (_2!10891 lt!371963)))))

(assert (=> b!236666 (= lt!372081 (readNLeastSignificantBitsLoop!0 (_2!10891 lt!372083) nBits!581 (bvadd #b00000000000000000000000000000001 i!752 #b00000000000000000000000000000001) (bvor (bvor acc!170 (ite (_1!10891 lt!371963) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!10891 lt!372083) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!752)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!79936 () Bool)

(assert (=> d!79936 e!163635))

(declare-fun res!197810 () Bool)

(assert (=> d!79936 (=> (not res!197810) (not e!163635))))

(assert (=> d!79936 (= res!197810 (= (buf!5986 (_2!10890 lt!372085)) (buf!5986 (_2!10891 lt!371963))))))

(assert (=> d!79936 (= lt!372085 e!163636)))

(declare-fun c!11329 () Bool)

(assert (=> d!79936 (= c!11329 (= nBits!581 (bvadd #b00000000000000000000000000000001 i!752)))))

(assert (=> d!79936 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!752)) (bvsle (bvadd #b00000000000000000000000000000001 i!752) nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000))))

(assert (=> d!79936 (= (readNLeastSignificantBitsLoop!0 (_2!10891 lt!371963) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!10891 lt!371963) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!372085)))

(assert (= (and d!79936 c!11329) b!236663))

(assert (= (and d!79936 (not c!11329)) b!236666))

(assert (= (and d!79936 res!197810) b!236665))

(assert (= (and b!236665 res!197812) b!236668))

(assert (= (and b!236668 res!197813) b!236664))

(assert (= (and b!236664 res!197814) b!236667))

(assert (= (and b!236667 (not res!197811)) b!236669))

(assert (=> b!236664 m!359191))

(declare-fun m!359247 () Bool)

(assert (=> b!236665 m!359247))

(declare-fun m!359249 () Bool)

(assert (=> b!236665 m!359249))

(declare-fun m!359251 () Bool)

(assert (=> b!236669 m!359251))

(declare-fun m!359253 () Bool)

(assert (=> b!236666 m!359253))

(declare-fun m!359255 () Bool)

(assert (=> b!236666 m!359255))

(assert (=> b!236595 d!79936))

(declare-fun d!79952 () Bool)

(declare-fun e!163643 () Bool)

(assert (=> d!79952 e!163643))

(declare-fun res!197817 () Bool)

(assert (=> d!79952 (=> (not res!197817) (not e!163643))))

(declare-datatypes ((Unit!17379 0))(
  ( (Unit!17380) )
))
(declare-datatypes ((tuple2!19986 0))(
  ( (tuple2!19987 (_1!10897 Unit!17379) (_2!10897 BitStream!9986)) )
))
(declare-fun increaseBitIndex!0 (BitStream!9986) tuple2!19986)

(assert (=> d!79952 (= res!197817 (= (buf!5986 (_2!10897 (increaseBitIndex!0 thiss!1830))) (buf!5986 thiss!1830)))))

(declare-fun lt!372102 () Bool)

(assert (=> d!79952 (= lt!372102 (not (= (bvand ((_ sign_extend 24) (select (arr!6498 (buf!5986 thiss!1830)) (currentByte!11136 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11131 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!372107 () tuple2!19974)

(assert (=> d!79952 (= lt!372107 (tuple2!19975 (not (= (bvand ((_ sign_extend 24) (select (arr!6498 (buf!5986 thiss!1830)) (currentByte!11136 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11131 thiss!1830)))) #b00000000000000000000000000000000)) (_2!10897 (increaseBitIndex!0 thiss!1830))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!79952 (validate_offset_bit!0 ((_ sign_extend 32) (size!5511 (buf!5986 thiss!1830))) ((_ sign_extend 32) (currentByte!11136 thiss!1830)) ((_ sign_extend 32) (currentBit!11131 thiss!1830)))))

(assert (=> d!79952 (= (readBit!0 thiss!1830) lt!372107)))

(declare-fun lt!372108 () (_ BitVec 64))

(declare-fun lt!372105 () (_ BitVec 64))

(declare-fun b!236672 () Bool)

(assert (=> b!236672 (= e!163643 (= (bitIndex!0 (size!5511 (buf!5986 (_2!10897 (increaseBitIndex!0 thiss!1830)))) (currentByte!11136 (_2!10897 (increaseBitIndex!0 thiss!1830))) (currentBit!11131 (_2!10897 (increaseBitIndex!0 thiss!1830)))) (bvadd lt!372105 lt!372108)))))

(assert (=> b!236672 (or (not (= (bvand lt!372105 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!372108 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!372105 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!372105 lt!372108) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!236672 (= lt!372108 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!236672 (= lt!372105 (bitIndex!0 (size!5511 (buf!5986 thiss!1830)) (currentByte!11136 thiss!1830) (currentBit!11131 thiss!1830)))))

(declare-fun lt!372104 () Bool)

(assert (=> b!236672 (= lt!372104 (not (= (bvand ((_ sign_extend 24) (select (arr!6498 (buf!5986 thiss!1830)) (currentByte!11136 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11131 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!372106 () Bool)

(assert (=> b!236672 (= lt!372106 (not (= (bvand ((_ sign_extend 24) (select (arr!6498 (buf!5986 thiss!1830)) (currentByte!11136 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11131 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!372103 () Bool)

(assert (=> b!236672 (= lt!372103 (not (= (bvand ((_ sign_extend 24) (select (arr!6498 (buf!5986 thiss!1830)) (currentByte!11136 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11131 thiss!1830)))) #b00000000000000000000000000000000)))))

(assert (= (and d!79952 res!197817) b!236672))

(declare-fun m!359257 () Bool)

(assert (=> d!79952 m!359257))

(declare-fun m!359259 () Bool)

(assert (=> d!79952 m!359259))

(declare-fun m!359261 () Bool)

(assert (=> d!79952 m!359261))

(declare-fun m!359263 () Bool)

(assert (=> d!79952 m!359263))

(declare-fun m!359265 () Bool)

(assert (=> b!236672 m!359265))

(assert (=> b!236672 m!359257))

(declare-fun m!359267 () Bool)

(assert (=> b!236672 m!359267))

(assert (=> b!236672 m!359259))

(assert (=> b!236672 m!359261))

(assert (=> b!236595 d!79952))

(declare-fun d!79954 () Bool)

(assert (=> d!79954 (= (invariant!0 (currentBit!11131 (_2!10890 lt!371964)) (currentByte!11136 (_2!10890 lt!371964)) (size!5511 (buf!5986 (_2!10890 lt!371964)))) (and (bvsge (currentBit!11131 (_2!10890 lt!371964)) #b00000000000000000000000000000000) (bvslt (currentBit!11131 (_2!10890 lt!371964)) #b00000000000000000000000000001000) (bvsge (currentByte!11136 (_2!10890 lt!371964)) #b00000000000000000000000000000000) (or (bvslt (currentByte!11136 (_2!10890 lt!371964)) (size!5511 (buf!5986 (_2!10890 lt!371964)))) (and (= (currentBit!11131 (_2!10890 lt!371964)) #b00000000000000000000000000000000) (= (currentByte!11136 (_2!10890 lt!371964)) (size!5511 (buf!5986 (_2!10890 lt!371964))))))))))

(assert (=> b!236600 d!79954))

(declare-fun d!79956 () Bool)

(assert (=> d!79956 (= (inv!12 thiss!1830) (invariant!0 (currentBit!11131 thiss!1830) (currentByte!11136 thiss!1830) (size!5511 (buf!5986 thiss!1830))))))

(declare-fun bs!19957 () Bool)

(assert (= bs!19957 d!79956))

(declare-fun m!359269 () Bool)

(assert (=> bs!19957 m!359269))

(assert (=> start!50550 d!79956))

(declare-fun d!79958 () Bool)

(assert (=> d!79958 (= (onesLSBLong!0 nBits!581) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!581))))))

(assert (=> b!236596 d!79958))

(push 1)

(assert (not b!236665))

(assert (not d!79952))

(assert (not d!79956))

(assert (not b!236666))

(assert (not d!79934))

(assert (not b!236669))

(assert (not b!236664))

(assert (not b!236672))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80004 () Bool)

(declare-fun lt!372251 () tuple2!19974)

(assert (=> d!80004 (= lt!372251 (readBit!0 (_2!10891 lt!371963)))))

(assert (=> d!80004 (= (readBitPure!0 (_2!10891 lt!371963)) (tuple2!19985 (_2!10891 lt!372251) (_1!10891 lt!372251)))))

(declare-fun bs!19962 () Bool)

(assert (= bs!19962 d!80004))

(assert (=> bs!19962 m!359253))

(assert (=> b!236669 d!80004))

(declare-fun d!80006 () Bool)

(declare-fun e!163672 () Bool)

(assert (=> d!80006 e!163672))

(declare-fun res!197871 () Bool)

(assert (=> d!80006 (=> (not res!197871) (not e!163672))))

(declare-fun lt!372265 () (_ BitVec 64))

(declare-fun lt!372266 () tuple2!19986)

(declare-fun lt!372262 () (_ BitVec 64))

(assert (=> d!80006 (= res!197871 (= (bvadd lt!372265 lt!372262) (bitIndex!0 (size!5511 (buf!5986 (_2!10897 lt!372266))) (currentByte!11136 (_2!10897 lt!372266)) (currentBit!11131 (_2!10897 lt!372266)))))))

(assert (=> d!80006 (or (not (= (bvand lt!372265 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!372262 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!372265 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!372265 lt!372262) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!80006 (= lt!372262 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!80006 (= lt!372265 (bitIndex!0 (size!5511 (buf!5986 thiss!1830)) (currentByte!11136 thiss!1830) (currentBit!11131 thiss!1830)))))

(declare-fun Unit!17385 () Unit!17379)

(declare-fun Unit!17386 () Unit!17379)

(assert (=> d!80006 (= lt!372266 (ite (bvslt (currentBit!11131 thiss!1830) #b00000000000000000000000000000111) (tuple2!19987 Unit!17385 (BitStream!9987 (buf!5986 thiss!1830) (currentByte!11136 thiss!1830) (bvadd (currentBit!11131 thiss!1830) #b00000000000000000000000000000001))) (tuple2!19987 Unit!17386 (BitStream!9987 (buf!5986 thiss!1830) (bvadd (currentByte!11136 thiss!1830) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!80006 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!5511 (buf!5986 thiss!1830))) ((_ sign_extend 32) (currentByte!11136 thiss!1830)) ((_ sign_extend 32) (currentBit!11131 thiss!1830))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!80006 (= (increaseBitIndex!0 thiss!1830) lt!372266)))

(declare-fun b!236729 () Bool)

(declare-fun res!197870 () Bool)

(assert (=> b!236729 (=> (not res!197870) (not e!163672))))

(declare-fun lt!372263 () (_ BitVec 64))

(declare-fun lt!372264 () (_ BitVec 64))

(assert (=> b!236729 (= res!197870 (= (bvsub lt!372263 lt!372264) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!236729 (or (= (bvand lt!372263 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!372264 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!372263 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!372263 lt!372264) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!236729 (= lt!372264 (remainingBits!0 ((_ sign_extend 32) (size!5511 (buf!5986 (_2!10897 lt!372266)))) ((_ sign_extend 32) (currentByte!11136 (_2!10897 lt!372266))) ((_ sign_extend 32) (currentBit!11131 (_2!10897 lt!372266)))))))

(assert (=> b!236729 (= lt!372263 (remainingBits!0 ((_ sign_extend 32) (size!5511 (buf!5986 thiss!1830))) ((_ sign_extend 32) (currentByte!11136 thiss!1830)) ((_ sign_extend 32) (currentBit!11131 thiss!1830))))))

(declare-fun b!236730 () Bool)

(assert (=> b!236730 (= e!163672 (= (size!5511 (buf!5986 thiss!1830)) (size!5511 (buf!5986 (_2!10897 lt!372266)))))))

(assert (= (and d!80006 res!197871) b!236729))

(assert (= (and b!236729 res!197870) b!236730))

(declare-fun m!359343 () Bool)

(assert (=> d!80006 m!359343))

(assert (=> d!80006 m!359267))

(assert (=> d!80006 m!359199))

(declare-fun m!359345 () Bool)

(assert (=> b!236729 m!359345))

(assert (=> b!236729 m!359199))

(assert (=> d!79952 d!80006))

(declare-fun d!80008 () Bool)

(assert (=> d!80008 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!5511 (buf!5986 thiss!1830))) ((_ sign_extend 32) (currentByte!11136 thiss!1830)) ((_ sign_extend 32) (currentBit!11131 thiss!1830))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5511 (buf!5986 thiss!1830))) ((_ sign_extend 32) (currentByte!11136 thiss!1830)) ((_ sign_extend 32) (currentBit!11131 thiss!1830))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!19963 () Bool)

(assert (= bs!19963 d!80008))

(assert (=> bs!19963 m!359199))

(assert (=> d!79952 d!80008))

(declare-fun d!80010 () Bool)

(declare-fun e!163675 () Bool)

(assert (=> d!80010 e!163675))

(declare-fun res!197876 () Bool)

(assert (=> d!80010 (=> (not res!197876) (not e!163675))))

(declare-fun lt!372282 () (_ BitVec 64))

(declare-fun lt!372284 () (_ BitVec 64))

(declare-fun lt!372281 () (_ BitVec 64))

(assert (=> d!80010 (= res!197876 (= lt!372281 (bvsub lt!372284 lt!372282)))))

(assert (=> d!80010 (or (= (bvand lt!372284 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!372282 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!372284 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!372284 lt!372282) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!80010 (= lt!372282 (remainingBits!0 ((_ sign_extend 32) (size!5511 (buf!5986 (_2!10890 lt!372085)))) ((_ sign_extend 32) (currentByte!11136 (_2!10890 lt!372085))) ((_ sign_extend 32) (currentBit!11131 (_2!10890 lt!372085)))))))

(declare-fun lt!372283 () (_ BitVec 64))

(declare-fun lt!372280 () (_ BitVec 64))

(assert (=> d!80010 (= lt!372284 (bvmul lt!372283 lt!372280))))

(assert (=> d!80010 (or (= lt!372283 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!372280 (bvsdiv (bvmul lt!372283 lt!372280) lt!372283)))))

(assert (=> d!80010 (= lt!372280 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!80010 (= lt!372283 ((_ sign_extend 32) (size!5511 (buf!5986 (_2!10890 lt!372085)))))))

(assert (=> d!80010 (= lt!372281 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11136 (_2!10890 lt!372085))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11131 (_2!10890 lt!372085)))))))

(assert (=> d!80010 (invariant!0 (currentBit!11131 (_2!10890 lt!372085)) (currentByte!11136 (_2!10890 lt!372085)) (size!5511 (buf!5986 (_2!10890 lt!372085))))))

(assert (=> d!80010 (= (bitIndex!0 (size!5511 (buf!5986 (_2!10890 lt!372085))) (currentByte!11136 (_2!10890 lt!372085)) (currentBit!11131 (_2!10890 lt!372085))) lt!372281)))

(declare-fun b!236735 () Bool)

(declare-fun res!197877 () Bool)

(assert (=> b!236735 (=> (not res!197877) (not e!163675))))

(assert (=> b!236735 (= res!197877 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!372281))))

(declare-fun b!236736 () Bool)

(declare-fun lt!372279 () (_ BitVec 64))

(assert (=> b!236736 (= e!163675 (bvsle lt!372281 (bvmul lt!372279 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!236736 (or (= lt!372279 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!372279 #b0000000000000000000000000000000000000000000000000000000000001000) lt!372279)))))

(assert (=> b!236736 (= lt!372279 ((_ sign_extend 32) (size!5511 (buf!5986 (_2!10890 lt!372085)))))))

(assert (= (and d!80010 res!197876) b!236735))

(assert (= (and b!236735 res!197877) b!236736))

(declare-fun m!359347 () Bool)

(assert (=> d!80010 m!359347))

(declare-fun m!359349 () Bool)

(assert (=> d!80010 m!359349))

(assert (=> b!236665 d!80010))

(declare-fun d!80012 () Bool)

(declare-fun e!163676 () Bool)

(assert (=> d!80012 e!163676))

(declare-fun res!197878 () Bool)

(assert (=> d!80012 (=> (not res!197878) (not e!163676))))

(declare-fun lt!372287 () (_ BitVec 64))

(declare-fun lt!372290 () (_ BitVec 64))

(declare-fun lt!372288 () (_ BitVec 64))

(assert (=> d!80012 (= res!197878 (= lt!372287 (bvsub lt!372290 lt!372288)))))

(assert (=> d!80012 (or (= (bvand lt!372290 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!372288 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!372290 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!372290 lt!372288) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!80012 (= lt!372288 (remainingBits!0 ((_ sign_extend 32) (size!5511 (buf!5986 (_2!10891 lt!371963)))) ((_ sign_extend 32) (currentByte!11136 (_2!10891 lt!371963))) ((_ sign_extend 32) (currentBit!11131 (_2!10891 lt!371963)))))))

(declare-fun lt!372289 () (_ BitVec 64))

(declare-fun lt!372286 () (_ BitVec 64))

(assert (=> d!80012 (= lt!372290 (bvmul lt!372289 lt!372286))))

(assert (=> d!80012 (or (= lt!372289 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!372286 (bvsdiv (bvmul lt!372289 lt!372286) lt!372289)))))

(assert (=> d!80012 (= lt!372286 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!80012 (= lt!372289 ((_ sign_extend 32) (size!5511 (buf!5986 (_2!10891 lt!371963)))))))

(assert (=> d!80012 (= lt!372287 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11136 (_2!10891 lt!371963))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11131 (_2!10891 lt!371963)))))))

(assert (=> d!80012 (invariant!0 (currentBit!11131 (_2!10891 lt!371963)) (currentByte!11136 (_2!10891 lt!371963)) (size!5511 (buf!5986 (_2!10891 lt!371963))))))

(assert (=> d!80012 (= (bitIndex!0 (size!5511 (buf!5986 (_2!10891 lt!371963))) (currentByte!11136 (_2!10891 lt!371963)) (currentBit!11131 (_2!10891 lt!371963))) lt!372287)))

(declare-fun b!236737 () Bool)

(declare-fun res!197879 () Bool)

(assert (=> b!236737 (=> (not res!197879) (not e!163676))))

(assert (=> b!236737 (= res!197879 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!372287))))

(declare-fun b!236738 () Bool)

(declare-fun lt!372285 () (_ BitVec 64))

(assert (=> b!236738 (= e!163676 (bvsle lt!372287 (bvmul lt!372285 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!236738 (or (= lt!372285 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!372285 #b0000000000000000000000000000000000000000000000000000000000001000) lt!372285)))))

(assert (=> b!236738 (= lt!372285 ((_ sign_extend 32) (size!5511 (buf!5986 (_2!10891 lt!371963)))))))

(assert (= (and d!80012 res!197878) b!236737))

(assert (= (and b!236737 res!197879) b!236738))

(declare-fun m!359351 () Bool)

(assert (=> d!80012 m!359351))

(declare-fun m!359353 () Bool)

(assert (=> d!80012 m!359353))

(assert (=> b!236665 d!80012))

(declare-fun d!80014 () Bool)

(declare-fun e!163677 () Bool)

(assert (=> d!80014 e!163677))

(declare-fun res!197880 () Bool)

(assert (=> d!80014 (=> (not res!197880) (not e!163677))))

(declare-fun lt!372294 () (_ BitVec 64))

(declare-fun lt!372293 () (_ BitVec 64))

(declare-fun lt!372296 () (_ BitVec 64))

(assert (=> d!80014 (= res!197880 (= lt!372293 (bvsub lt!372296 lt!372294)))))

(assert (=> d!80014 (or (= (bvand lt!372296 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!372294 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!372296 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!372296 lt!372294) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!80014 (= lt!372294 (remainingBits!0 ((_ sign_extend 32) (size!5511 (buf!5986 (_2!10897 (increaseBitIndex!0 thiss!1830))))) ((_ sign_extend 32) (currentByte!11136 (_2!10897 (increaseBitIndex!0 thiss!1830)))) ((_ sign_extend 32) (currentBit!11131 (_2!10897 (increaseBitIndex!0 thiss!1830))))))))

(declare-fun lt!372295 () (_ BitVec 64))

(declare-fun lt!372292 () (_ BitVec 64))

(assert (=> d!80014 (= lt!372296 (bvmul lt!372295 lt!372292))))

(assert (=> d!80014 (or (= lt!372295 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!372292 (bvsdiv (bvmul lt!372295 lt!372292) lt!372295)))))

(assert (=> d!80014 (= lt!372292 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!80014 (= lt!372295 ((_ sign_extend 32) (size!5511 (buf!5986 (_2!10897 (increaseBitIndex!0 thiss!1830))))))))

(assert (=> d!80014 (= lt!372293 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11136 (_2!10897 (increaseBitIndex!0 thiss!1830)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11131 (_2!10897 (increaseBitIndex!0 thiss!1830))))))))

(assert (=> d!80014 (invariant!0 (currentBit!11131 (_2!10897 (increaseBitIndex!0 thiss!1830))) (currentByte!11136 (_2!10897 (increaseBitIndex!0 thiss!1830))) (size!5511 (buf!5986 (_2!10897 (increaseBitIndex!0 thiss!1830)))))))

(assert (=> d!80014 (= (bitIndex!0 (size!5511 (buf!5986 (_2!10897 (increaseBitIndex!0 thiss!1830)))) (currentByte!11136 (_2!10897 (increaseBitIndex!0 thiss!1830))) (currentBit!11131 (_2!10897 (increaseBitIndex!0 thiss!1830)))) lt!372293)))

(declare-fun b!236739 () Bool)

(declare-fun res!197881 () Bool)

(assert (=> b!236739 (=> (not res!197881) (not e!163677))))

(assert (=> b!236739 (= res!197881 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!372293))))

(declare-fun b!236740 () Bool)

(declare-fun lt!372291 () (_ BitVec 64))

(assert (=> b!236740 (= e!163677 (bvsle lt!372293 (bvmul lt!372291 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!236740 (or (= lt!372291 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!372291 #b0000000000000000000000000000000000000000000000000000000000001000) lt!372291)))))

(assert (=> b!236740 (= lt!372291 ((_ sign_extend 32) (size!5511 (buf!5986 (_2!10897 (increaseBitIndex!0 thiss!1830))))))))

(assert (= (and d!80014 res!197880) b!236739))

(assert (= (and b!236739 res!197881) b!236740))

(declare-fun m!359355 () Bool)

(assert (=> d!80014 m!359355))

(declare-fun m!359357 () Bool)

(assert (=> d!80014 m!359357))

(assert (=> b!236672 d!80014))

(assert (=> b!236672 d!80006))

(declare-fun d!80016 () Bool)

(declare-fun e!163678 () Bool)

(assert (=> d!80016 e!163678))

(declare-fun res!197882 () Bool)

(assert (=> d!80016 (=> (not res!197882) (not e!163678))))

(declare-fun lt!372299 () (_ BitVec 64))

(declare-fun lt!372302 () (_ BitVec 64))

(declare-fun lt!372300 () (_ BitVec 64))

(assert (=> d!80016 (= res!197882 (= lt!372299 (bvsub lt!372302 lt!372300)))))

(assert (=> d!80016 (or (= (bvand lt!372302 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!372300 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!372302 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!372302 lt!372300) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!80016 (= lt!372300 (remainingBits!0 ((_ sign_extend 32) (size!5511 (buf!5986 thiss!1830))) ((_ sign_extend 32) (currentByte!11136 thiss!1830)) ((_ sign_extend 32) (currentBit!11131 thiss!1830))))))

(declare-fun lt!372301 () (_ BitVec 64))

(declare-fun lt!372298 () (_ BitVec 64))

(assert (=> d!80016 (= lt!372302 (bvmul lt!372301 lt!372298))))

(assert (=> d!80016 (or (= lt!372301 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!372298 (bvsdiv (bvmul lt!372301 lt!372298) lt!372301)))))

(assert (=> d!80016 (= lt!372298 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!80016 (= lt!372301 ((_ sign_extend 32) (size!5511 (buf!5986 thiss!1830))))))

(assert (=> d!80016 (= lt!372299 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11136 thiss!1830)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11131 thiss!1830))))))

(assert (=> d!80016 (invariant!0 (currentBit!11131 thiss!1830) (currentByte!11136 thiss!1830) (size!5511 (buf!5986 thiss!1830)))))

