; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50476 () Bool)

(assert start!50476)

(declare-fun lt!371777 () (_ BitVec 32))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun e!163446 () Bool)

(declare-datatypes ((array!12534 0))(
  ( (array!12535 (arr!6491 (Array (_ BitVec 32) (_ BitVec 8))) (size!5504 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9972 0))(
  ( (BitStream!9973 (buf!5979 array!12534) (currentByte!11123 (_ BitVec 32)) (currentBit!11118 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!19942 0))(
  ( (tuple2!19943 (_1!10875 Bool) (_2!10875 BitStream!9972)) )
))
(declare-fun lt!371778 () tuple2!19942)

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun b!236416 () Bool)

(declare-fun i!752 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236416 (= e!163446 (not (= (bvand (bvor acc!170 (ite (_1!10875 lt!371778) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000)) (onesLSBLong!0 lt!371777)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!236417 () Bool)

(declare-fun res!197604 () Bool)

(declare-fun e!163445 () Bool)

(assert (=> b!236417 (=> (not res!197604) (not e!163445))))

(assert (=> b!236417 (= res!197604 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!236419 () Bool)

(declare-fun e!163448 () Bool)

(declare-fun thiss!1830 () BitStream!9972)

(declare-fun array_inv!5245 (array!12534) Bool)

(assert (=> b!236419 (= e!163448 (array_inv!5245 (buf!5979 thiss!1830)))))

(declare-fun b!236420 () Bool)

(declare-fun res!197601 () Bool)

(assert (=> b!236420 (=> (not res!197601) (not e!163445))))

(assert (=> b!236420 (= res!197601 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236421 () Bool)

(declare-fun e!163447 () Bool)

(assert (=> b!236421 (= e!163447 e!163446)))

(declare-fun res!197606 () Bool)

(assert (=> b!236421 (=> (not res!197606) (not e!163446))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!236421 (= res!197606 (validate_offset_bits!1 ((_ sign_extend 32) (size!5504 (buf!5979 (_2!10875 lt!371778)))) ((_ sign_extend 32) (currentByte!11123 (_2!10875 lt!371778))) ((_ sign_extend 32) (currentBit!11118 (_2!10875 lt!371778))) ((_ sign_extend 32) lt!371777)))))

(assert (=> b!236421 (= lt!371777 (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)))))

(declare-fun b!236422 () Bool)

(declare-fun res!197605 () Bool)

(assert (=> b!236422 (=> (not res!197605) (not e!163445))))

(assert (=> b!236422 (= res!197605 (validate_offset_bits!1 ((_ sign_extend 32) (size!5504 (buf!5979 thiss!1830))) ((_ sign_extend 32) (currentByte!11123 thiss!1830)) ((_ sign_extend 32) (currentBit!11118 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!236423 () Bool)

(declare-fun res!197603 () Bool)

(assert (=> b!236423 (=> (not res!197603) (not e!163445))))

(assert (=> b!236423 (= res!197603 (not (= nBits!581 i!752)))))

(declare-fun res!197602 () Bool)

(assert (=> start!50476 (=> (not res!197602) (not e!163445))))

(assert (=> start!50476 (= res!197602 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50476 e!163445))

(assert (=> start!50476 true))

(declare-fun inv!12 (BitStream!9972) Bool)

(assert (=> start!50476 (and (inv!12 thiss!1830) e!163448)))

(declare-fun b!236418 () Bool)

(assert (=> b!236418 (= e!163445 e!163447)))

(declare-fun res!197607 () Bool)

(assert (=> b!236418 (=> (not res!197607) (not e!163447))))

(assert (=> b!236418 (= res!197607 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!752)) (bvsle (bvadd #b00000000000000000000000000000001 i!752) nBits!581)))))

(declare-fun readBit!0 (BitStream!9972) tuple2!19942)

(assert (=> b!236418 (= lt!371778 (readBit!0 thiss!1830))))

(assert (= (and start!50476 res!197602) b!236422))

(assert (= (and b!236422 res!197605) b!236420))

(assert (= (and b!236420 res!197601) b!236417))

(assert (= (and b!236417 res!197604) b!236423))

(assert (= (and b!236423 res!197603) b!236418))

(assert (= (and b!236418 res!197607) b!236421))

(assert (= (and b!236421 res!197606) b!236416))

(assert (= start!50476 b!236419))

(declare-fun m!358957 () Bool)

(assert (=> b!236417 m!358957))

(declare-fun m!358959 () Bool)

(assert (=> b!236421 m!358959))

(declare-fun m!358961 () Bool)

(assert (=> start!50476 m!358961))

(declare-fun m!358963 () Bool)

(assert (=> b!236422 m!358963))

(declare-fun m!358965 () Bool)

(assert (=> b!236416 m!358965))

(declare-fun m!358967 () Bool)

(assert (=> b!236420 m!358967))

(declare-fun m!358969 () Bool)

(assert (=> b!236418 m!358969))

(declare-fun m!358971 () Bool)

(assert (=> b!236419 m!358971))

(check-sat (not b!236419) (not b!236421) (not b!236420) (not b!236418) (not b!236417) (not start!50476) (not b!236416) (not b!236422))
(check-sat)
(get-model)

(declare-fun d!79812 () Bool)

(assert (=> d!79812 (= (array_inv!5245 (buf!5979 thiss!1830)) (bvsge (size!5504 (buf!5979 thiss!1830)) #b00000000000000000000000000000000))))

(assert (=> b!236419 d!79812))

(declare-fun d!79814 () Bool)

(declare-fun e!163470 () Bool)

(assert (=> d!79814 e!163470))

(declare-fun res!197631 () Bool)

(assert (=> d!79814 (=> (not res!197631) (not e!163470))))

(declare-datatypes ((Unit!17363 0))(
  ( (Unit!17364) )
))
(declare-datatypes ((tuple2!19946 0))(
  ( (tuple2!19947 (_1!10877 Unit!17363) (_2!10877 BitStream!9972)) )
))
(declare-fun increaseBitIndex!0 (BitStream!9972) tuple2!19946)

(assert (=> d!79814 (= res!197631 (= (buf!5979 (_2!10877 (increaseBitIndex!0 thiss!1830))) (buf!5979 thiss!1830)))))

(declare-fun lt!371802 () Bool)

(assert (=> d!79814 (= lt!371802 (not (= (bvand ((_ sign_extend 24) (select (arr!6491 (buf!5979 thiss!1830)) (currentByte!11123 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11118 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!371803 () tuple2!19942)

(assert (=> d!79814 (= lt!371803 (tuple2!19943 (not (= (bvand ((_ sign_extend 24) (select (arr!6491 (buf!5979 thiss!1830)) (currentByte!11123 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11118 thiss!1830)))) #b00000000000000000000000000000000)) (_2!10877 (increaseBitIndex!0 thiss!1830))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!79814 (validate_offset_bit!0 ((_ sign_extend 32) (size!5504 (buf!5979 thiss!1830))) ((_ sign_extend 32) (currentByte!11123 thiss!1830)) ((_ sign_extend 32) (currentBit!11118 thiss!1830)))))

(assert (=> d!79814 (= (readBit!0 thiss!1830) lt!371803)))

(declare-fun lt!371801 () (_ BitVec 64))

(declare-fun b!236450 () Bool)

(declare-fun lt!371800 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236450 (= e!163470 (= (bitIndex!0 (size!5504 (buf!5979 (_2!10877 (increaseBitIndex!0 thiss!1830)))) (currentByte!11123 (_2!10877 (increaseBitIndex!0 thiss!1830))) (currentBit!11118 (_2!10877 (increaseBitIndex!0 thiss!1830)))) (bvadd lt!371800 lt!371801)))))

(assert (=> b!236450 (or (not (= (bvand lt!371800 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371801 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!371800 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!371800 lt!371801) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!236450 (= lt!371801 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!236450 (= lt!371800 (bitIndex!0 (size!5504 (buf!5979 thiss!1830)) (currentByte!11123 thiss!1830) (currentBit!11118 thiss!1830)))))

(declare-fun lt!371799 () Bool)

(assert (=> b!236450 (= lt!371799 (not (= (bvand ((_ sign_extend 24) (select (arr!6491 (buf!5979 thiss!1830)) (currentByte!11123 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11118 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!371804 () Bool)

(assert (=> b!236450 (= lt!371804 (not (= (bvand ((_ sign_extend 24) (select (arr!6491 (buf!5979 thiss!1830)) (currentByte!11123 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11118 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!371805 () Bool)

(assert (=> b!236450 (= lt!371805 (not (= (bvand ((_ sign_extend 24) (select (arr!6491 (buf!5979 thiss!1830)) (currentByte!11123 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11118 thiss!1830)))) #b00000000000000000000000000000000)))))

(assert (= (and d!79814 res!197631) b!236450))

(declare-fun m!358989 () Bool)

(assert (=> d!79814 m!358989))

(declare-fun m!358991 () Bool)

(assert (=> d!79814 m!358991))

(declare-fun m!358993 () Bool)

(assert (=> d!79814 m!358993))

(declare-fun m!358995 () Bool)

(assert (=> d!79814 m!358995))

(assert (=> b!236450 m!358993))

(declare-fun m!358997 () Bool)

(assert (=> b!236450 m!358997))

(assert (=> b!236450 m!358989))

(declare-fun m!358999 () Bool)

(assert (=> b!236450 m!358999))

(assert (=> b!236450 m!358991))

(assert (=> b!236418 d!79814))

(declare-fun d!79818 () Bool)

(assert (=> d!79818 (= (onesLSBLong!0 lt!371777) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 lt!371777))))))

(assert (=> b!236416 d!79818))

(declare-fun d!79822 () Bool)

(assert (=> d!79822 (= (onesLSBLong!0 nBits!581) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!581))))))

(assert (=> b!236417 d!79822))

(declare-fun d!79826 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!79826 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5504 (buf!5979 thiss!1830))) ((_ sign_extend 32) (currentByte!11123 thiss!1830)) ((_ sign_extend 32) (currentBit!11118 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5504 (buf!5979 thiss!1830))) ((_ sign_extend 32) (currentByte!11123 thiss!1830)) ((_ sign_extend 32) (currentBit!11118 thiss!1830))) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun bs!19929 () Bool)

(assert (= bs!19929 d!79826))

(declare-fun m!359003 () Bool)

(assert (=> bs!19929 m!359003))

(assert (=> b!236422 d!79826))

(declare-fun d!79832 () Bool)

(assert (=> d!79832 (= (onesLSBLong!0 (bvsub nBits!581 i!752)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!581 i!752)))))))

(assert (=> b!236420 d!79832))

(declare-fun d!79834 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!79834 (= (inv!12 thiss!1830) (invariant!0 (currentBit!11118 thiss!1830) (currentByte!11123 thiss!1830) (size!5504 (buf!5979 thiss!1830))))))

(declare-fun bs!19931 () Bool)

(assert (= bs!19931 d!79834))

(declare-fun m!359007 () Bool)

(assert (=> bs!19931 m!359007))

(assert (=> start!50476 d!79834))

(declare-fun d!79840 () Bool)

(assert (=> d!79840 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5504 (buf!5979 (_2!10875 lt!371778)))) ((_ sign_extend 32) (currentByte!11123 (_2!10875 lt!371778))) ((_ sign_extend 32) (currentBit!11118 (_2!10875 lt!371778))) ((_ sign_extend 32) lt!371777)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5504 (buf!5979 (_2!10875 lt!371778)))) ((_ sign_extend 32) (currentByte!11123 (_2!10875 lt!371778))) ((_ sign_extend 32) (currentBit!11118 (_2!10875 lt!371778)))) ((_ sign_extend 32) lt!371777)))))

(declare-fun bs!19932 () Bool)

(assert (= bs!19932 d!79840))

(declare-fun m!359009 () Bool)

(assert (=> bs!19932 m!359009))

(assert (=> b!236421 d!79840))

(check-sat (not d!79834) (not d!79826) (not b!236450) (not d!79840) (not d!79814))
(check-sat)
