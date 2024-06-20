; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50514 () Bool)

(assert start!50514)

(declare-fun res!197695 () Bool)

(declare-fun e!163537 () Bool)

(assert (=> start!50514 (=> (not res!197695) (not e!163537))))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(assert (=> start!50514 (= res!197695 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50514 e!163537))

(assert (=> start!50514 true))

(declare-datatypes ((array!12545 0))(
  ( (array!12546 (arr!6495 (Array (_ BitVec 32) (_ BitVec 8))) (size!5508 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9980 0))(
  ( (BitStream!9981 (buf!5983 array!12545) (currentByte!11130 (_ BitVec 32)) (currentBit!11125 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!9980)

(declare-fun e!163534 () Bool)

(declare-fun inv!12 (BitStream!9980) Bool)

(assert (=> start!50514 (and (inv!12 thiss!1830) e!163534)))

(declare-fun b!236521 () Bool)

(declare-fun e!163538 () Bool)

(assert (=> b!236521 (= e!163537 e!163538)))

(declare-fun res!197700 () Bool)

(assert (=> b!236521 (=> (not res!197700) (not e!163538))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun lt!371882 () (_ BitVec 64))

(assert (=> b!236521 (= res!197700 (and (= (bvand acc!170 lt!371882) acc!170) (not (= nBits!581 i!752))))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236521 (= lt!371882 (onesLSBLong!0 nBits!581))))

(declare-fun b!236522 () Bool)

(declare-fun res!197698 () Bool)

(declare-fun e!163536 () Bool)

(assert (=> b!236522 (=> (not res!197698) (not e!163536))))

(declare-fun lt!371881 () (_ BitVec 64))

(declare-fun lt!371883 () (_ BitVec 32))

(assert (=> b!236522 (= res!197698 (= (bvand lt!371881 (onesLSBLong!0 lt!371883)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236523 () Bool)

(declare-fun res!197694 () Bool)

(assert (=> b!236523 (=> (not res!197694) (not e!163537))))

(assert (=> b!236523 (= res!197694 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236524 () Bool)

(declare-fun res!197699 () Bool)

(assert (=> b!236524 (=> (not res!197699) (not e!163537))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!236524 (= res!197699 (validate_offset_bits!1 ((_ sign_extend 32) (size!5508 (buf!5983 thiss!1830))) ((_ sign_extend 32) (currentByte!11130 thiss!1830)) ((_ sign_extend 32) (currentBit!11125 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!236525 () Bool)

(assert (=> b!236525 (= e!163536 (not (= (bvand lt!371881 lt!371882) lt!371881)))))

(declare-fun b!236526 () Bool)

(declare-fun array_inv!5249 (array!12545) Bool)

(assert (=> b!236526 (= e!163534 (array_inv!5249 (buf!5983 thiss!1830)))))

(declare-fun b!236527 () Bool)

(declare-fun e!163533 () Bool)

(assert (=> b!236527 (= e!163538 e!163533)))

(declare-fun res!197697 () Bool)

(assert (=> b!236527 (=> (not res!197697) (not e!163533))))

(assert (=> b!236527 (= res!197697 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!752)) (bvsle (bvadd #b00000000000000000000000000000001 i!752) nBits!581)))))

(declare-datatypes ((tuple2!19956 0))(
  ( (tuple2!19957 (_1!10882 Bool) (_2!10882 BitStream!9980)) )
))
(declare-fun lt!371880 () tuple2!19956)

(assert (=> b!236527 (= lt!371881 (bvor acc!170 (ite (_1!10882 lt!371880) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBit!0 (BitStream!9980) tuple2!19956)

(assert (=> b!236527 (= lt!371880 (readBit!0 thiss!1830))))

(declare-fun b!236528 () Bool)

(assert (=> b!236528 (= e!163533 e!163536)))

(declare-fun res!197696 () Bool)

(assert (=> b!236528 (=> (not res!197696) (not e!163536))))

(assert (=> b!236528 (= res!197696 (validate_offset_bits!1 ((_ sign_extend 32) (size!5508 (buf!5983 (_2!10882 lt!371880)))) ((_ sign_extend 32) (currentByte!11130 (_2!10882 lt!371880))) ((_ sign_extend 32) (currentBit!11125 (_2!10882 lt!371880))) ((_ sign_extend 32) lt!371883)))))

(assert (=> b!236528 (= lt!371883 (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)))))

(assert (= (and start!50514 res!197695) b!236524))

(assert (= (and b!236524 res!197699) b!236523))

(assert (= (and b!236523 res!197694) b!236521))

(assert (= (and b!236521 res!197700) b!236527))

(assert (= (and b!236527 res!197697) b!236528))

(assert (= (and b!236528 res!197696) b!236522))

(assert (= (and b!236522 res!197698) b!236525))

(assert (= start!50514 b!236526))

(declare-fun m!359075 () Bool)

(assert (=> b!236521 m!359075))

(declare-fun m!359077 () Bool)

(assert (=> b!236526 m!359077))

(declare-fun m!359079 () Bool)

(assert (=> b!236528 m!359079))

(declare-fun m!359081 () Bool)

(assert (=> b!236527 m!359081))

(declare-fun m!359083 () Bool)

(assert (=> start!50514 m!359083))

(declare-fun m!359085 () Bool)

(assert (=> b!236524 m!359085))

(declare-fun m!359087 () Bool)

(assert (=> b!236522 m!359087))

(declare-fun m!359089 () Bool)

(assert (=> b!236523 m!359089))

(push 1)

(assert (not b!236527))

(assert (not b!236528))

(assert (not b!236522))

(assert (not b!236521))

(assert (not b!236524))

(assert (not b!236523))

(assert (not b!236526))

(assert (not start!50514))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!79886 () Bool)

(declare-fun e!163556 () Bool)

(assert (=> d!79886 e!163556))

(declare-fun res!197706 () Bool)

(assert (=> d!79886 (=> (not res!197706) (not e!163556))))

(declare-datatypes ((Unit!17371 0))(
  ( (Unit!17372) )
))
(declare-datatypes ((tuple2!19960 0))(
  ( (tuple2!19961 (_1!10884 Unit!17371) (_2!10884 BitStream!9980)) )
))
(declare-fun increaseBitIndex!0 (BitStream!9980) tuple2!19960)

(assert (=> d!79886 (= res!197706 (= (buf!5983 (_2!10884 (increaseBitIndex!0 thiss!1830))) (buf!5983 thiss!1830)))))

(declare-fun lt!371925 () Bool)

(assert (=> d!79886 (= lt!371925 (not (= (bvand ((_ sign_extend 24) (select (arr!6495 (buf!5983 thiss!1830)) (currentByte!11130 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11125 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!371920 () tuple2!19956)

(assert (=> d!79886 (= lt!371920 (tuple2!19957 (not (= (bvand ((_ sign_extend 24) (select (arr!6495 (buf!5983 thiss!1830)) (currentByte!11130 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11125 thiss!1830)))) #b00000000000000000000000000000000)) (_2!10884 (increaseBitIndex!0 thiss!1830))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!79886 (validate_offset_bit!0 ((_ sign_extend 32) (size!5508 (buf!5983 thiss!1830))) ((_ sign_extend 32) (currentByte!11130 thiss!1830)) ((_ sign_extend 32) (currentBit!11125 thiss!1830)))))

(assert (=> d!79886 (= (readBit!0 thiss!1830) lt!371920)))

(declare-fun b!236534 () Bool)

(declare-fun lt!371924 () (_ BitVec 64))

(declare-fun lt!371927 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236534 (= e!163556 (= (bitIndex!0 (size!5508 (buf!5983 (_2!10884 (increaseBitIndex!0 thiss!1830)))) (currentByte!11130 (_2!10884 (increaseBitIndex!0 thiss!1830))) (currentBit!11125 (_2!10884 (increaseBitIndex!0 thiss!1830)))) (bvadd lt!371924 lt!371927)))))

(assert (=> b!236534 (or (not (= (bvand lt!371924 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371927 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!371924 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!371924 lt!371927) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!236534 (= lt!371927 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!236534 (= lt!371924 (bitIndex!0 (size!5508 (buf!5983 thiss!1830)) (currentByte!11130 thiss!1830) (currentBit!11125 thiss!1830)))))

(declare-fun lt!371922 () Bool)

(assert (=> b!236534 (= lt!371922 (not (= (bvand ((_ sign_extend 24) (select (arr!6495 (buf!5983 thiss!1830)) (currentByte!11130 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11125 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!371919 () Bool)

(assert (=> b!236534 (= lt!371919 (not (= (bvand ((_ sign_extend 24) (select (arr!6495 (buf!5983 thiss!1830)) (currentByte!11130 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11125 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!371926 () Bool)

(assert (=> b!236534 (= lt!371926 (not (= (bvand ((_ sign_extend 24) (select (arr!6495 (buf!5983 thiss!1830)) (currentByte!11130 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11125 thiss!1830)))) #b00000000000000000000000000000000)))))

(assert (= (and d!79886 res!197706) b!236534))

(declare-fun m!359113 () Bool)

(assert (=> d!79886 m!359113))

(declare-fun m!359115 () Bool)

(assert (=> d!79886 m!359115))

(declare-fun m!359117 () Bool)

(assert (=> d!79886 m!359117))

(declare-fun m!359119 () Bool)

(assert (=> d!79886 m!359119))

(assert (=> b!236534 m!359115))

(assert (=> b!236534 m!359113))

(declare-fun m!359121 () Bool)

(assert (=> b!236534 m!359121))

(assert (=> b!236534 m!359117))

(declare-fun m!359123 () Bool)

(assert (=> b!236534 m!359123))

(assert (=> b!236527 d!79886))

(declare-fun d!79888 () Bool)

(assert (=> d!79888 (= (onesLSBLong!0 lt!371883) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 lt!371883))))))

(assert (=> b!236522 d!79888))

(declare-fun d!79890 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!79890 (= (inv!12 thiss!1830) (invariant!0 (currentBit!11125 thiss!1830) (currentByte!11130 thiss!1830) (size!5508 (buf!5983 thiss!1830))))))

(declare-fun bs!19945 () Bool)

(assert (= bs!19945 d!79890))

(declare-fun m!359125 () Bool)

(assert (=> bs!19945 m!359125))

(assert (=> start!50514 d!79890))

(declare-fun d!79892 () Bool)

(assert (=> d!79892 (= (array_inv!5249 (buf!5983 thiss!1830)) (bvsge (size!5508 (buf!5983 thiss!1830)) #b00000000000000000000000000000000))))

(assert (=> b!236526 d!79892))

(declare-fun d!79894 () Bool)

(assert (=> d!79894 (= (onesLSBLong!0 nBits!581) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!581))))))

(assert (=> b!236521 d!79894))

(declare-fun d!79896 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!79896 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5508 (buf!5983 thiss!1830))) ((_ sign_extend 32) (currentByte!11130 thiss!1830)) ((_ sign_extend 32) (currentBit!11125 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5508 (buf!5983 thiss!1830))) ((_ sign_extend 32) (currentByte!11130 thiss!1830)) ((_ sign_extend 32) (currentBit!11125 thiss!1830))) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun bs!19946 () Bool)

(assert (= bs!19946 d!79896))

(declare-fun m!359127 () Bool)

(assert (=> bs!19946 m!359127))

(assert (=> b!236524 d!79896))

(declare-fun d!79898 () Bool)

(assert (=> d!79898 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5508 (buf!5983 (_2!10882 lt!371880)))) ((_ sign_extend 32) (currentByte!11130 (_2!10882 lt!371880))) ((_ sign_extend 32) (currentBit!11125 (_2!10882 lt!371880))) ((_ sign_extend 32) lt!371883)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5508 (buf!5983 (_2!10882 lt!371880)))) ((_ sign_extend 32) (currentByte!11130 (_2!10882 lt!371880))) ((_ sign_extend 32) (currentBit!11125 (_2!10882 lt!371880)))) ((_ sign_extend 32) lt!371883)))))

(declare-fun bs!19947 () Bool)

(assert (= bs!19947 d!79898))

(declare-fun m!359129 () Bool)

(assert (=> bs!19947 m!359129))

(assert (=> b!236528 d!79898))

(declare-fun d!79900 () Bool)

(assert (=> d!79900 (= (onesLSBLong!0 (bvsub nBits!581 i!752)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!581 i!752)))))))

(assert (=> b!236523 d!79900))

(push 1)

(assert (not b!236534))

(assert (not d!79898))

(assert (not d!79886))

(assert (not d!79896))

(assert (not d!79890))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

