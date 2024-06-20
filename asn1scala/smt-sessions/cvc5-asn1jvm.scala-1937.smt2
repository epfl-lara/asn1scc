; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50510 () Bool)

(assert start!50510)

(declare-fun b!236473 () Bool)

(declare-fun res!197653 () Bool)

(declare-fun e!163501 () Bool)

(assert (=> b!236473 (=> (not res!197653) (not e!163501))))

(declare-datatypes ((array!12541 0))(
  ( (array!12542 (arr!6493 (Array (_ BitVec 32) (_ BitVec 8))) (size!5506 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9976 0))(
  ( (BitStream!9977 (buf!5981 array!12541) (currentByte!11128 (_ BitVec 32)) (currentBit!11123 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!9976)

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!236473 (= res!197653 (validate_offset_bits!1 ((_ sign_extend 32) (size!5506 (buf!5981 thiss!1830))) ((_ sign_extend 32) (currentByte!11128 thiss!1830)) ((_ sign_extend 32) (currentBit!11123 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun res!197656 () Bool)

(assert (=> start!50510 (=> (not res!197656) (not e!163501))))

(assert (=> start!50510 (= res!197656 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50510 e!163501))

(assert (=> start!50510 true))

(declare-fun e!163497 () Bool)

(declare-fun inv!12 (BitStream!9976) Bool)

(assert (=> start!50510 (and (inv!12 thiss!1830) e!163497)))

(declare-fun b!236474 () Bool)

(declare-fun e!163498 () Bool)

(declare-fun lt!371858 () (_ BitVec 64))

(declare-fun lt!371856 () (_ BitVec 64))

(assert (=> b!236474 (= e!163498 (not (= (bvand lt!371858 lt!371856) lt!371858)))))

(declare-fun b!236475 () Bool)

(declare-fun e!163500 () Bool)

(assert (=> b!236475 (= e!163500 e!163498)))

(declare-fun res!197652 () Bool)

(assert (=> b!236475 (=> (not res!197652) (not e!163498))))

(declare-datatypes ((tuple2!19952 0))(
  ( (tuple2!19953 (_1!10880 Bool) (_2!10880 BitStream!9976)) )
))
(declare-fun lt!371859 () tuple2!19952)

(declare-fun lt!371857 () (_ BitVec 32))

(assert (=> b!236475 (= res!197652 (validate_offset_bits!1 ((_ sign_extend 32) (size!5506 (buf!5981 (_2!10880 lt!371859)))) ((_ sign_extend 32) (currentByte!11128 (_2!10880 lt!371859))) ((_ sign_extend 32) (currentBit!11123 (_2!10880 lt!371859))) ((_ sign_extend 32) lt!371857)))))

(assert (=> b!236475 (= lt!371857 (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)))))

(declare-fun b!236476 () Bool)

(declare-fun res!197654 () Bool)

(assert (=> b!236476 (=> (not res!197654) (not e!163501))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236476 (= res!197654 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236477 () Bool)

(declare-fun array_inv!5247 (array!12541) Bool)

(assert (=> b!236477 (= e!163497 (array_inv!5247 (buf!5981 thiss!1830)))))

(declare-fun b!236478 () Bool)

(declare-fun e!163499 () Bool)

(assert (=> b!236478 (= e!163499 e!163500)))

(declare-fun res!197657 () Bool)

(assert (=> b!236478 (=> (not res!197657) (not e!163500))))

(assert (=> b!236478 (= res!197657 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!752)) (bvsle (bvadd #b00000000000000000000000000000001 i!752) nBits!581)))))

(assert (=> b!236478 (= lt!371858 (bvor acc!170 (ite (_1!10880 lt!371859) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBit!0 (BitStream!9976) tuple2!19952)

(assert (=> b!236478 (= lt!371859 (readBit!0 thiss!1830))))

(declare-fun b!236479 () Bool)

(declare-fun res!197658 () Bool)

(assert (=> b!236479 (=> (not res!197658) (not e!163498))))

(assert (=> b!236479 (= res!197658 (= (bvand lt!371858 (onesLSBLong!0 lt!371857)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236480 () Bool)

(assert (=> b!236480 (= e!163501 e!163499)))

(declare-fun res!197655 () Bool)

(assert (=> b!236480 (=> (not res!197655) (not e!163499))))

(assert (=> b!236480 (= res!197655 (and (= (bvand acc!170 lt!371856) acc!170) (not (= nBits!581 i!752))))))

(assert (=> b!236480 (= lt!371856 (onesLSBLong!0 nBits!581))))

(assert (= (and start!50510 res!197656) b!236473))

(assert (= (and b!236473 res!197653) b!236476))

(assert (= (and b!236476 res!197654) b!236480))

(assert (= (and b!236480 res!197655) b!236478))

(assert (= (and b!236478 res!197657) b!236475))

(assert (= (and b!236475 res!197652) b!236479))

(assert (= (and b!236479 res!197658) b!236474))

(assert (= start!50510 b!236477))

(declare-fun m!359043 () Bool)

(assert (=> b!236473 m!359043))

(declare-fun m!359045 () Bool)

(assert (=> b!236477 m!359045))

(declare-fun m!359047 () Bool)

(assert (=> b!236478 m!359047))

(declare-fun m!359049 () Bool)

(assert (=> b!236476 m!359049))

(declare-fun m!359051 () Bool)

(assert (=> start!50510 m!359051))

(declare-fun m!359053 () Bool)

(assert (=> b!236475 m!359053))

(declare-fun m!359055 () Bool)

(assert (=> b!236480 m!359055))

(declare-fun m!359057 () Bool)

(assert (=> b!236479 m!359057))

(push 1)

(assert (not b!236479))

(assert (not b!236476))

(assert (not b!236475))

(assert (not b!236480))

(assert (not b!236473))

(assert (not start!50510))

(assert (not b!236478))

(assert (not b!236477))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!79864 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!79864 (= (inv!12 thiss!1830) (invariant!0 (currentBit!11123 thiss!1830) (currentByte!11128 thiss!1830) (size!5506 (buf!5981 thiss!1830))))))

(declare-fun bs!19940 () Bool)

(assert (= bs!19940 d!79864))

(declare-fun m!359091 () Bool)

(assert (=> bs!19940 m!359091))

(assert (=> start!50510 d!79864))

(declare-fun d!79866 () Bool)

(assert (=> d!79866 (= (onesLSBLong!0 nBits!581) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!581))))))

(assert (=> b!236480 d!79866))

(declare-fun d!79870 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!79870 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5506 (buf!5981 (_2!10880 lt!371859)))) ((_ sign_extend 32) (currentByte!11128 (_2!10880 lt!371859))) ((_ sign_extend 32) (currentBit!11123 (_2!10880 lt!371859))) ((_ sign_extend 32) lt!371857)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5506 (buf!5981 (_2!10880 lt!371859)))) ((_ sign_extend 32) (currentByte!11128 (_2!10880 lt!371859))) ((_ sign_extend 32) (currentBit!11123 (_2!10880 lt!371859)))) ((_ sign_extend 32) lt!371857)))))

(declare-fun bs!19942 () Bool)

(assert (= bs!19942 d!79870))

(declare-fun m!359107 () Bool)

(assert (=> bs!19942 m!359107))

(assert (=> b!236475 d!79870))

(declare-fun d!79876 () Bool)

(declare-fun e!163559 () Bool)

(assert (=> d!79876 e!163559))

(declare-fun res!197709 () Bool)

(assert (=> d!79876 (=> (not res!197709) (not e!163559))))

(declare-datatypes ((Unit!17373 0))(
  ( (Unit!17374) )
))
(declare-datatypes ((tuple2!19962 0))(
  ( (tuple2!19963 (_1!10885 Unit!17373) (_2!10885 BitStream!9976)) )
))
(declare-fun increaseBitIndex!0 (BitStream!9976) tuple2!19962)

(assert (=> d!79876 (= res!197709 (= (buf!5981 (_2!10885 (increaseBitIndex!0 thiss!1830))) (buf!5981 thiss!1830)))))

(declare-fun lt!371944 () Bool)

(assert (=> d!79876 (= lt!371944 (not (= (bvand ((_ sign_extend 24) (select (arr!6493 (buf!5981 thiss!1830)) (currentByte!11128 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11123 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!371943 () tuple2!19952)

(assert (=> d!79876 (= lt!371943 (tuple2!19953 (not (= (bvand ((_ sign_extend 24) (select (arr!6493 (buf!5981 thiss!1830)) (currentByte!11128 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11123 thiss!1830)))) #b00000000000000000000000000000000)) (_2!10885 (increaseBitIndex!0 thiss!1830))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!79876 (validate_offset_bit!0 ((_ sign_extend 32) (size!5506 (buf!5981 thiss!1830))) ((_ sign_extend 32) (currentByte!11128 thiss!1830)) ((_ sign_extend 32) (currentBit!11123 thiss!1830)))))

(assert (=> d!79876 (= (readBit!0 thiss!1830) lt!371943)))

(declare-fun lt!371945 () (_ BitVec 64))

(declare-fun b!236537 () Bool)

(declare-fun lt!371946 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236537 (= e!163559 (= (bitIndex!0 (size!5506 (buf!5981 (_2!10885 (increaseBitIndex!0 thiss!1830)))) (currentByte!11128 (_2!10885 (increaseBitIndex!0 thiss!1830))) (currentBit!11123 (_2!10885 (increaseBitIndex!0 thiss!1830)))) (bvadd lt!371945 lt!371946)))))

(assert (=> b!236537 (or (not (= (bvand lt!371945 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371946 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!371945 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!371945 lt!371946) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!236537 (= lt!371946 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!236537 (= lt!371945 (bitIndex!0 (size!5506 (buf!5981 thiss!1830)) (currentByte!11128 thiss!1830) (currentBit!11123 thiss!1830)))))

(declare-fun lt!371940 () Bool)

(assert (=> b!236537 (= lt!371940 (not (= (bvand ((_ sign_extend 24) (select (arr!6493 (buf!5981 thiss!1830)) (currentByte!11128 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11123 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!371942 () Bool)

(assert (=> b!236537 (= lt!371942 (not (= (bvand ((_ sign_extend 24) (select (arr!6493 (buf!5981 thiss!1830)) (currentByte!11128 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11123 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!371941 () Bool)

(assert (=> b!236537 (= lt!371941 (not (= (bvand ((_ sign_extend 24) (select (arr!6493 (buf!5981 thiss!1830)) (currentByte!11128 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11123 thiss!1830)))) #b00000000000000000000000000000000)))))

(assert (= (and d!79876 res!197709) b!236537))

(declare-fun m!359131 () Bool)

(assert (=> d!79876 m!359131))

(declare-fun m!359133 () Bool)

(assert (=> d!79876 m!359133))

(declare-fun m!359135 () Bool)

(assert (=> d!79876 m!359135))

(declare-fun m!359137 () Bool)

(assert (=> d!79876 m!359137))

(assert (=> b!236537 m!359133))

(declare-fun m!359139 () Bool)

(assert (=> b!236537 m!359139))

(declare-fun m!359141 () Bool)

(assert (=> b!236537 m!359141))

(assert (=> b!236537 m!359131))

(assert (=> b!236537 m!359135))

(assert (=> b!236478 d!79876))

(declare-fun d!79902 () Bool)

(assert (=> d!79902 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5506 (buf!5981 thiss!1830))) ((_ sign_extend 32) (currentByte!11128 thiss!1830)) ((_ sign_extend 32) (currentBit!11123 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5506 (buf!5981 thiss!1830))) ((_ sign_extend 32) (currentByte!11128 thiss!1830)) ((_ sign_extend 32) (currentBit!11123 thiss!1830))) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun bs!19948 () Bool)

(assert (= bs!19948 d!79902))

(declare-fun m!359143 () Bool)

(assert (=> bs!19948 m!359143))

(assert (=> b!236473 d!79902))

(declare-fun d!79904 () Bool)

(assert (=> d!79904 (= (onesLSBLong!0 lt!371857) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 lt!371857))))))

(assert (=> b!236479 d!79904))

(declare-fun d!79906 () Bool)

(assert (=> d!79906 (= (array_inv!5247 (buf!5981 thiss!1830)) (bvsge (size!5506 (buf!5981 thiss!1830)) #b00000000000000000000000000000000))))

(assert (=> b!236477 d!79906))

(declare-fun d!79908 () Bool)

(assert (=> d!79908 (= (onesLSBLong!0 (bvsub nBits!581 i!752)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!581 i!752)))))))

(assert (=> b!236476 d!79908))

(push 1)

(assert (not d!79870))

(assert (not d!79902))

(assert (not d!79864))

(assert (not b!236537))

(assert (not d!79876))

(check-sat)

(pop 1)

(push 1)

(check-sat)

