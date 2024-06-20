; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50474 () Bool)

(assert start!50474)

(declare-fun b!236392 () Bool)

(declare-fun res!197585 () Bool)

(declare-fun e!163429 () Bool)

(assert (=> b!236392 (=> (not res!197585) (not e!163429))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236392 (= res!197585 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!236393 () Bool)

(declare-fun e!163433 () Bool)

(declare-datatypes ((array!12532 0))(
  ( (array!12533 (arr!6490 (Array (_ BitVec 32) (_ BitVec 8))) (size!5503 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9970 0))(
  ( (BitStream!9971 (buf!5978 array!12532) (currentByte!11122 (_ BitVec 32)) (currentBit!11117 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!9970)

(declare-fun array_inv!5244 (array!12532) Bool)

(assert (=> b!236393 (= e!163433 (array_inv!5244 (buf!5978 thiss!1830)))))

(declare-fun b!236394 () Bool)

(declare-fun res!197586 () Bool)

(assert (=> b!236394 (=> (not res!197586) (not e!163429))))

(declare-fun i!752 () (_ BitVec 32))

(assert (=> b!236394 (= res!197586 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236395 () Bool)

(declare-fun res!197582 () Bool)

(assert (=> b!236395 (=> (not res!197582) (not e!163429))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!236395 (= res!197582 (validate_offset_bits!1 ((_ sign_extend 32) (size!5503 (buf!5978 thiss!1830))) ((_ sign_extend 32) (currentByte!11122 thiss!1830)) ((_ sign_extend 32) (currentBit!11117 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun res!197583 () Bool)

(assert (=> start!50474 (=> (not res!197583) (not e!163429))))

(assert (=> start!50474 (= res!197583 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50474 e!163429))

(assert (=> start!50474 true))

(declare-fun inv!12 (BitStream!9970) Bool)

(assert (=> start!50474 (and (inv!12 thiss!1830) e!163433)))

(declare-fun b!236396 () Bool)

(declare-fun res!197581 () Bool)

(assert (=> b!236396 (=> (not res!197581) (not e!163429))))

(assert (=> b!236396 (= res!197581 (not (= nBits!581 i!752)))))

(declare-fun e!163430 () Bool)

(declare-datatypes ((tuple2!19940 0))(
  ( (tuple2!19941 (_1!10874 Bool) (_2!10874 BitStream!9970)) )
))
(declare-fun lt!371772 () tuple2!19940)

(declare-fun lt!371771 () (_ BitVec 32))

(declare-fun b!236397 () Bool)

(assert (=> b!236397 (= e!163430 (not (= (bvand (bvor acc!170 (ite (_1!10874 lt!371772) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000)) (onesLSBLong!0 lt!371771)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!236398 () Bool)

(declare-fun e!163431 () Bool)

(assert (=> b!236398 (= e!163429 e!163431)))

(declare-fun res!197584 () Bool)

(assert (=> b!236398 (=> (not res!197584) (not e!163431))))

(assert (=> b!236398 (= res!197584 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!752)) (bvsle (bvadd #b00000000000000000000000000000001 i!752) nBits!581)))))

(declare-fun readBit!0 (BitStream!9970) tuple2!19940)

(assert (=> b!236398 (= lt!371772 (readBit!0 thiss!1830))))

(declare-fun b!236399 () Bool)

(assert (=> b!236399 (= e!163431 e!163430)))

(declare-fun res!197580 () Bool)

(assert (=> b!236399 (=> (not res!197580) (not e!163430))))

(assert (=> b!236399 (= res!197580 (validate_offset_bits!1 ((_ sign_extend 32) (size!5503 (buf!5978 (_2!10874 lt!371772)))) ((_ sign_extend 32) (currentByte!11122 (_2!10874 lt!371772))) ((_ sign_extend 32) (currentBit!11117 (_2!10874 lt!371772))) ((_ sign_extend 32) lt!371771)))))

(assert (=> b!236399 (= lt!371771 (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)))))

(assert (= (and start!50474 res!197583) b!236395))

(assert (= (and b!236395 res!197582) b!236394))

(assert (= (and b!236394 res!197586) b!236392))

(assert (= (and b!236392 res!197585) b!236396))

(assert (= (and b!236396 res!197581) b!236398))

(assert (= (and b!236398 res!197584) b!236399))

(assert (= (and b!236399 res!197580) b!236397))

(assert (= start!50474 b!236393))

(declare-fun m!358941 () Bool)

(assert (=> b!236399 m!358941))

(declare-fun m!358943 () Bool)

(assert (=> b!236395 m!358943))

(declare-fun m!358945 () Bool)

(assert (=> b!236393 m!358945))

(declare-fun m!358947 () Bool)

(assert (=> b!236394 m!358947))

(declare-fun m!358949 () Bool)

(assert (=> start!50474 m!358949))

(declare-fun m!358951 () Bool)

(assert (=> b!236397 m!358951))

(declare-fun m!358953 () Bool)

(assert (=> b!236398 m!358953))

(declare-fun m!358955 () Bool)

(assert (=> b!236392 m!358955))

(push 1)

(assert (not b!236398))

(assert (not start!50474))

(assert (not b!236394))

(assert (not b!236395))

(assert (not b!236399))

(assert (not b!236397))

(assert (not b!236393))

(assert (not b!236392))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!79816 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!79816 (= (inv!12 thiss!1830) (invariant!0 (currentBit!11117 thiss!1830) (currentByte!11122 thiss!1830) (size!5503 (buf!5978 thiss!1830))))))

(declare-fun bs!19928 () Bool)

(assert (= bs!19928 d!79816))

(declare-fun m!359001 () Bool)

(assert (=> bs!19928 m!359001))

(assert (=> start!50474 d!79816))

(declare-fun d!79820 () Bool)

(assert (=> d!79820 (= (onesLSBLong!0 lt!371771) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 lt!371771))))))

(assert (=> b!236397 d!79820))

(declare-fun d!79824 () Bool)

(assert (=> d!79824 (= (onesLSBLong!0 nBits!581) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!581))))))

(assert (=> b!236392 d!79824))

(declare-fun d!79828 () Bool)

(assert (=> d!79828 (= (onesLSBLong!0 (bvsub nBits!581 i!752)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!581 i!752)))))))

(assert (=> b!236394 d!79828))

(declare-fun d!79830 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!79830 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5503 (buf!5978 thiss!1830))) ((_ sign_extend 32) (currentByte!11122 thiss!1830)) ((_ sign_extend 32) (currentBit!11117 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5503 (buf!5978 thiss!1830))) ((_ sign_extend 32) (currentByte!11122 thiss!1830)) ((_ sign_extend 32) (currentBit!11117 thiss!1830))) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun bs!19930 () Bool)

(assert (= bs!19930 d!79830))

(declare-fun m!359005 () Bool)

(assert (=> bs!19930 m!359005))

(assert (=> b!236395 d!79830))

(declare-fun d!79836 () Bool)

(assert (=> d!79836 (= (array_inv!5244 (buf!5978 thiss!1830)) (bvsge (size!5503 (buf!5978 thiss!1830)) #b00000000000000000000000000000000))))

(assert (=> b!236393 d!79836))

(declare-fun d!79838 () Bool)

(declare-fun e!163481 () Bool)

(assert (=> d!79838 e!163481))

(declare-fun res!197634 () Bool)

(assert (=> d!79838 (=> (not res!197634) (not e!163481))))

(declare-datatypes ((Unit!17365 0))(
  ( (Unit!17366) )
))
(declare-datatypes ((tuple2!19948 0))(
  ( (tuple2!19949 (_1!10878 Unit!17365) (_2!10878 BitStream!9970)) )
))
(declare-fun increaseBitIndex!0 (BitStream!9970) tuple2!19948)

(assert (=> d!79838 (= res!197634 (= (buf!5978 (_2!10878 (increaseBitIndex!0 thiss!1830))) (buf!5978 thiss!1830)))))

(declare-fun lt!371823 () Bool)

(assert (=> d!79838 (= lt!371823 (not (= (bvand ((_ sign_extend 24) (select (arr!6490 (buf!5978 thiss!1830)) (currentByte!11122 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11117 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!371820 () tuple2!19940)

(assert (=> d!79838 (= lt!371820 (tuple2!19941 (not (= (bvand ((_ sign_extend 24) (select (arr!6490 (buf!5978 thiss!1830)) (currentByte!11122 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11117 thiss!1830)))) #b00000000000000000000000000000000)) (_2!10878 (increaseBitIndex!0 thiss!1830))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!79838 (validate_offset_bit!0 ((_ sign_extend 32) (size!5503 (buf!5978 thiss!1830))) ((_ sign_extend 32) (currentByte!11122 thiss!1830)) ((_ sign_extend 32) (currentBit!11117 thiss!1830)))))

(assert (=> d!79838 (= (readBit!0 thiss!1830) lt!371820)))

(declare-fun b!236453 () Bool)

(declare-fun lt!371826 () (_ BitVec 64))

(declare-fun lt!371824 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236453 (= e!163481 (= (bitIndex!0 (size!5503 (buf!5978 (_2!10878 (increaseBitIndex!0 thiss!1830)))) (currentByte!11122 (_2!10878 (increaseBitIndex!0 thiss!1830))) (currentBit!11117 (_2!10878 (increaseBitIndex!0 thiss!1830)))) (bvadd lt!371826 lt!371824)))))

(assert (=> b!236453 (or (not (= (bvand lt!371826 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371824 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!371826 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!371826 lt!371824) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!236453 (= lt!371824 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!236453 (= lt!371826 (bitIndex!0 (size!5503 (buf!5978 thiss!1830)) (currentByte!11122 thiss!1830) (currentBit!11117 thiss!1830)))))

(declare-fun lt!371821 () Bool)

(assert (=> b!236453 (= lt!371821 (not (= (bvand ((_ sign_extend 24) (select (arr!6490 (buf!5978 thiss!1830)) (currentByte!11122 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11117 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!371822 () Bool)

(assert (=> b!236453 (= lt!371822 (not (= (bvand ((_ sign_extend 24) (select (arr!6490 (buf!5978 thiss!1830)) (currentByte!11122 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11117 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!371825 () Bool)

(assert (=> b!236453 (= lt!371825 (not (= (bvand ((_ sign_extend 24) (select (arr!6490 (buf!5978 thiss!1830)) (currentByte!11122 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11117 thiss!1830)))) #b00000000000000000000000000000000)))))

(assert (= (and d!79838 res!197634) b!236453))

(declare-fun m!359015 () Bool)

(assert (=> d!79838 m!359015))

(declare-fun m!359017 () Bool)

(assert (=> d!79838 m!359017))

(declare-fun m!359019 () Bool)

(assert (=> d!79838 m!359019))

(declare-fun m!359021 () Bool)

(assert (=> d!79838 m!359021))

(declare-fun m!359023 () Bool)

(assert (=> b!236453 m!359023))

(declare-fun m!359025 () Bool)

(assert (=> b!236453 m!359025))

(assert (=> b!236453 m!359015))

(assert (=> b!236453 m!359017))

(assert (=> b!236453 m!359019))

(assert (=> b!236398 d!79838))

(declare-fun d!79852 () Bool)

(assert (=> d!79852 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5503 (buf!5978 (_2!10874 lt!371772)))) ((_ sign_extend 32) (currentByte!11122 (_2!10874 lt!371772))) ((_ sign_extend 32) (currentBit!11117 (_2!10874 lt!371772))) ((_ sign_extend 32) lt!371771)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5503 (buf!5978 (_2!10874 lt!371772)))) ((_ sign_extend 32) (currentByte!11122 (_2!10874 lt!371772))) ((_ sign_extend 32) (currentBit!11117 (_2!10874 lt!371772)))) ((_ sign_extend 32) lt!371771)))))

(declare-fun bs!19935 () Bool)

(assert (= bs!19935 d!79852))

(declare-fun m!359027 () Bool)

(assert (=> bs!19935 m!359027))

(assert (=> b!236399 d!79852))

(push 1)

(assert (not b!236453))

(assert (not d!79852))

(assert (not d!79830))

(assert (not d!79838))

(assert (not d!79816))

(check-sat)

(pop 1)

(push 1)

(check-sat)

