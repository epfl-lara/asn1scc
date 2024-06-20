; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50408 () Bool)

(assert start!50408)

(declare-fun b!236276 () Bool)

(declare-fun res!197477 () Bool)

(declare-fun e!163349 () Bool)

(assert (=> b!236276 (=> (not res!197477) (not e!163349))))

(declare-datatypes ((array!12523 0))(
  ( (array!12524 (arr!6487 (Array (_ BitVec 32) (_ BitVec 8))) (size!5500 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9964 0))(
  ( (BitStream!9965 (buf!5975 array!12523) (currentByte!11104 (_ BitVec 32)) (currentBit!11099 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!9964)

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!236276 (= res!197477 (validate_offset_bits!1 ((_ sign_extend 32) (size!5500 (buf!5975 thiss!1830))) ((_ sign_extend 32) (currentByte!11104 thiss!1830)) ((_ sign_extend 32) (currentBit!11099 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun res!197478 () Bool)

(assert (=> start!50408 (=> (not res!197478) (not e!163349))))

(assert (=> start!50408 (= res!197478 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50408 e!163349))

(assert (=> start!50408 true))

(declare-fun e!163351 () Bool)

(declare-fun inv!12 (BitStream!9964) Bool)

(assert (=> start!50408 (and (inv!12 thiss!1830) e!163351)))

(declare-fun b!236277 () Bool)

(declare-fun e!163350 () Bool)

(assert (=> b!236277 (= e!163349 e!163350)))

(declare-fun res!197473 () Bool)

(assert (=> b!236277 (=> (not res!197473) (not e!163350))))

(assert (=> b!236277 (= res!197473 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!752)) (bvsle (bvadd #b00000000000000000000000000000001 i!752) nBits!581)))))

(declare-datatypes ((tuple2!19928 0))(
  ( (tuple2!19929 (_1!10868 Bool) (_2!10868 BitStream!9964)) )
))
(declare-fun lt!371580 () tuple2!19928)

(declare-fun readBit!0 (BitStream!9964) tuple2!19928)

(assert (=> b!236277 (= lt!371580 (readBit!0 thiss!1830))))

(declare-fun b!236278 () Bool)

(declare-fun array_inv!5241 (array!12523) Bool)

(assert (=> b!236278 (= e!163351 (array_inv!5241 (buf!5975 thiss!1830)))))

(declare-fun b!236279 () Bool)

(assert (=> b!236279 (= e!163350 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!5500 (buf!5975 (_2!10868 lt!371580)))) ((_ sign_extend 32) (currentByte!11104 (_2!10868 lt!371580))) ((_ sign_extend 32) (currentBit!11099 (_2!10868 lt!371580))) ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752))))))))

(declare-fun b!236280 () Bool)

(declare-fun res!197476 () Bool)

(assert (=> b!236280 (=> (not res!197476) (not e!163349))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236280 (= res!197476 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!236281 () Bool)

(declare-fun res!197475 () Bool)

(assert (=> b!236281 (=> (not res!197475) (not e!163349))))

(assert (=> b!236281 (= res!197475 (not (= nBits!581 i!752)))))

(declare-fun b!236282 () Bool)

(declare-fun res!197474 () Bool)

(assert (=> b!236282 (=> (not res!197474) (not e!163349))))

(assert (=> b!236282 (= res!197474 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!50408 res!197478) b!236276))

(assert (= (and b!236276 res!197477) b!236282))

(assert (= (and b!236282 res!197474) b!236280))

(assert (= (and b!236280 res!197476) b!236281))

(assert (= (and b!236281 res!197475) b!236277))

(assert (= (and b!236277 res!197473) b!236279))

(assert (= start!50408 b!236278))

(declare-fun m!358821 () Bool)

(assert (=> b!236280 m!358821))

(declare-fun m!358823 () Bool)

(assert (=> b!236279 m!358823))

(declare-fun m!358825 () Bool)

(assert (=> b!236277 m!358825))

(declare-fun m!358827 () Bool)

(assert (=> b!236278 m!358827))

(declare-fun m!358829 () Bool)

(assert (=> b!236282 m!358829))

(declare-fun m!358831 () Bool)

(assert (=> b!236276 m!358831))

(declare-fun m!358833 () Bool)

(assert (=> start!50408 m!358833))

(push 1)

(assert (not b!236278))

(assert (not b!236280))

(assert (not b!236277))

(assert (not b!236282))

(assert (not start!50408))

(assert (not b!236279))

(assert (not b!236276))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!79726 () Bool)

(assert (=> d!79726 (= (array_inv!5241 (buf!5975 thiss!1830)) (bvsge (size!5500 (buf!5975 thiss!1830)) #b00000000000000000000000000000000))))

(assert (=> b!236278 d!79726))

(declare-fun d!79728 () Bool)

(declare-fun e!163389 () Bool)

(assert (=> d!79728 e!163389))

(declare-fun res!197519 () Bool)

(assert (=> d!79728 (=> (not res!197519) (not e!163389))))

(declare-datatypes ((Unit!17351 0))(
  ( (Unit!17352) )
))
(declare-datatypes ((tuple2!19934 0))(
  ( (tuple2!19935 (_1!10871 Unit!17351) (_2!10871 BitStream!9964)) )
))
(declare-fun increaseBitIndex!0 (BitStream!9964) tuple2!19934)

(assert (=> d!79728 (= res!197519 (= (buf!5975 (_2!10871 (increaseBitIndex!0 thiss!1830))) (buf!5975 thiss!1830)))))

(declare-fun lt!371613 () Bool)

(assert (=> d!79728 (= lt!371613 (not (= (bvand ((_ sign_extend 24) (select (arr!6487 (buf!5975 thiss!1830)) (currentByte!11104 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11099 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!371618 () tuple2!19928)

(assert (=> d!79728 (= lt!371618 (tuple2!19929 (not (= (bvand ((_ sign_extend 24) (select (arr!6487 (buf!5975 thiss!1830)) (currentByte!11104 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11099 thiss!1830)))) #b00000000000000000000000000000000)) (_2!10871 (increaseBitIndex!0 thiss!1830))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!79728 (validate_offset_bit!0 ((_ sign_extend 32) (size!5500 (buf!5975 thiss!1830))) ((_ sign_extend 32) (currentByte!11104 thiss!1830)) ((_ sign_extend 32) (currentBit!11099 thiss!1830)))))

(assert (=> d!79728 (= (readBit!0 thiss!1830) lt!371618)))

(declare-fun lt!371614 () (_ BitVec 64))

(declare-fun b!236329 () Bool)

(declare-fun lt!371617 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236329 (= e!163389 (= (bitIndex!0 (size!5500 (buf!5975 (_2!10871 (increaseBitIndex!0 thiss!1830)))) (currentByte!11104 (_2!10871 (increaseBitIndex!0 thiss!1830))) (currentBit!11099 (_2!10871 (increaseBitIndex!0 thiss!1830)))) (bvadd lt!371614 lt!371617)))))

(assert (=> b!236329 (or (not (= (bvand lt!371614 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371617 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!371614 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!371614 lt!371617) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!236329 (= lt!371617 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!236329 (= lt!371614 (bitIndex!0 (size!5500 (buf!5975 thiss!1830)) (currentByte!11104 thiss!1830) (currentBit!11099 thiss!1830)))))

(declare-fun lt!371616 () Bool)

(assert (=> b!236329 (= lt!371616 (not (= (bvand ((_ sign_extend 24) (select (arr!6487 (buf!5975 thiss!1830)) (currentByte!11104 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11099 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!371615 () Bool)

(assert (=> b!236329 (= lt!371615 (not (= (bvand ((_ sign_extend 24) (select (arr!6487 (buf!5975 thiss!1830)) (currentByte!11104 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11099 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!371619 () Bool)

(assert (=> b!236329 (= lt!371619 (not (= (bvand ((_ sign_extend 24) (select (arr!6487 (buf!5975 thiss!1830)) (currentByte!11104 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11099 thiss!1830)))) #b00000000000000000000000000000000)))))

(assert (= (and d!79728 res!197519) b!236329))

(declare-fun m!358867 () Bool)

(assert (=> d!79728 m!358867))

(declare-fun m!358869 () Bool)

(assert (=> d!79728 m!358869))

(declare-fun m!358871 () Bool)

(assert (=> d!79728 m!358871))

(declare-fun m!358873 () Bool)

(assert (=> d!79728 m!358873))

(declare-fun m!358875 () Bool)

(assert (=> b!236329 m!358875))

(assert (=> b!236329 m!358869))

(assert (=> b!236329 m!358867))

(declare-fun m!358877 () Bool)

(assert (=> b!236329 m!358877))

(assert (=> b!236329 m!358871))

(assert (=> b!236277 d!79728))

(declare-fun d!79740 () Bool)

(assert (=> d!79740 (= (onesLSBLong!0 (bvsub nBits!581 i!752)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!581 i!752)))))))

(assert (=> b!236282 d!79740))

(declare-fun d!79742 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!79742 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5500 (buf!5975 thiss!1830))) ((_ sign_extend 32) (currentByte!11104 thiss!1830)) ((_ sign_extend 32) (currentBit!11099 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5500 (buf!5975 thiss!1830))) ((_ sign_extend 32) (currentByte!11104 thiss!1830)) ((_ sign_extend 32) (currentBit!11099 thiss!1830))) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun bs!19915 () Bool)

(assert (= bs!19915 d!79742))

(declare-fun m!358879 () Bool)

(assert (=> bs!19915 m!358879))

(assert (=> b!236276 d!79742))

(declare-fun d!79744 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!79744 (= (inv!12 thiss!1830) (invariant!0 (currentBit!11099 thiss!1830) (currentByte!11104 thiss!1830) (size!5500 (buf!5975 thiss!1830))))))

(declare-fun bs!19916 () Bool)

(assert (= bs!19916 d!79744))

(declare-fun m!358881 () Bool)

(assert (=> bs!19916 m!358881))

(assert (=> start!50408 d!79744))

(declare-fun d!79746 () Bool)

(assert (=> d!79746 (= (onesLSBLong!0 nBits!581) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!581))))))

(assert (=> b!236280 d!79746))

(declare-fun d!79748 () Bool)

(assert (=> d!79748 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5500 (buf!5975 (_2!10868 lt!371580)))) ((_ sign_extend 32) (currentByte!11104 (_2!10868 lt!371580))) ((_ sign_extend 32) (currentBit!11099 (_2!10868 lt!371580))) ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5500 (buf!5975 (_2!10868 lt!371580)))) ((_ sign_extend 32) (currentByte!11104 (_2!10868 lt!371580))) ((_ sign_extend 32) (currentBit!11099 (_2!10868 lt!371580)))) ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)))))))

(declare-fun bs!19917 () Bool)

(assert (= bs!19917 d!79748))

(declare-fun m!358883 () Bool)

(assert (=> bs!19917 m!358883))

(assert (=> b!236279 d!79748))

(push 1)

(assert (not d!79748))

(assert (not d!79742))

(assert (not d!79744))

(assert (not b!236329))

(assert (not d!79728))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!79774 () Bool)

(assert (=> d!79774 (= (invariant!0 (currentBit!11099 thiss!1830) (currentByte!11104 thiss!1830) (size!5500 (buf!5975 thiss!1830))) (and (bvsge (currentBit!11099 thiss!1830) #b00000000000000000000000000000000) (bvslt (currentBit!11099 thiss!1830) #b00000000000000000000000000001000) (bvsge (currentByte!11104 thiss!1830) #b00000000000000000000000000000000) (or (bvslt (currentByte!11104 thiss!1830) (size!5500 (buf!5975 thiss!1830))) (and (= (currentBit!11099 thiss!1830) #b00000000000000000000000000000000) (= (currentByte!11104 thiss!1830) (size!5500 (buf!5975 thiss!1830)))))))))

(assert (=> d!79744 d!79774))

(declare-fun d!79776 () Bool)

(declare-fun e!163407 () Bool)

(assert (=> d!79776 e!163407))

(declare-fun res!197543 () Bool)

(assert (=> d!79776 (=> (not res!197543) (not e!163407))))

(declare-fun lt!371700 () (_ BitVec 64))

(declare-fun lt!371703 () tuple2!19934)

(declare-fun lt!371699 () (_ BitVec 64))

(assert (=> d!79776 (= res!197543 (= (bvadd lt!371700 lt!371699) (bitIndex!0 (size!5500 (buf!5975 (_2!10871 lt!371703))) (currentByte!11104 (_2!10871 lt!371703)) (currentBit!11099 (_2!10871 lt!371703)))))))

(assert (=> d!79776 (or (not (= (bvand lt!371700 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371699 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!371700 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!371700 lt!371699) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79776 (= lt!371699 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!79776 (= lt!371700 (bitIndex!0 (size!5500 (buf!5975 thiss!1830)) (currentByte!11104 thiss!1830) (currentBit!11099 thiss!1830)))))

(declare-fun Unit!17359 () Unit!17351)

(declare-fun Unit!17360 () Unit!17351)

(assert (=> d!79776 (= lt!371703 (ite (bvslt (currentBit!11099 thiss!1830) #b00000000000000000000000000000111) (tuple2!19935 Unit!17359 (BitStream!9965 (buf!5975 thiss!1830) (currentByte!11104 thiss!1830) (bvadd (currentBit!11099 thiss!1830) #b00000000000000000000000000000001))) (tuple2!19935 Unit!17360 (BitStream!9965 (buf!5975 thiss!1830) (bvadd (currentByte!11104 thiss!1830) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!79776 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!5500 (buf!5975 thiss!1830))) ((_ sign_extend 32) (currentByte!11104 thiss!1830)) ((_ sign_extend 32) (currentBit!11099 thiss!1830))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!79776 (= (increaseBitIndex!0 thiss!1830) lt!371703)))

(declare-fun b!236352 () Bool)

(declare-fun res!197542 () Bool)

(assert (=> b!236352 (=> (not res!197542) (not e!163407))))

(declare-fun lt!371701 () (_ BitVec 64))

(declare-fun lt!371702 () (_ BitVec 64))

(assert (=> b!236352 (= res!197542 (= (bvsub lt!371701 lt!371702) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!236352 (or (= (bvand lt!371701 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371702 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!371701 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!371701 lt!371702) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!236352 (= lt!371702 (remainingBits!0 ((_ sign_extend 32) (size!5500 (buf!5975 (_2!10871 lt!371703)))) ((_ sign_extend 32) (currentByte!11104 (_2!10871 lt!371703))) ((_ sign_extend 32) (currentBit!11099 (_2!10871 lt!371703)))))))

(assert (=> b!236352 (= lt!371701 (remainingBits!0 ((_ sign_extend 32) (size!5500 (buf!5975 thiss!1830))) ((_ sign_extend 32) (currentByte!11104 thiss!1830)) ((_ sign_extend 32) (currentBit!11099 thiss!1830))))))

(declare-fun b!236353 () Bool)

(assert (=> b!236353 (= e!163407 (= (size!5500 (buf!5975 thiss!1830)) (size!5500 (buf!5975 (_2!10871 lt!371703)))))))

(assert (= (and d!79776 res!197543) b!236352))

(assert (= (and b!236352 res!197542) b!236353))

(declare-fun m!358925 () Bool)

(assert (=> d!79776 m!358925))

(assert (=> d!79776 m!358875))

(assert (=> d!79776 m!358879))

(declare-fun m!358927 () Bool)

(assert (=> b!236352 m!358927))

(assert (=> b!236352 m!358879))

(assert (=> d!79728 d!79776))

(declare-fun d!79786 () Bool)

(assert (=> d!79786 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!5500 (buf!5975 thiss!1830))) ((_ sign_extend 32) (currentByte!11104 thiss!1830)) ((_ sign_extend 32) (currentBit!11099 thiss!1830))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5500 (buf!5975 thiss!1830))) ((_ sign_extend 32) (currentByte!11104 thiss!1830)) ((_ sign_extend 32) (currentBit!11099 thiss!1830))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!19923 () Bool)

(assert (= bs!19923 d!79786))

(assert (=> bs!19923 m!358879))

(assert (=> d!79728 d!79786))

(declare-fun d!79788 () Bool)

(assert (=> d!79788 (= (remainingBits!0 ((_ sign_extend 32) (size!5500 (buf!5975 thiss!1830))) ((_ sign_extend 32) (currentByte!11104 thiss!1830)) ((_ sign_extend 32) (currentBit!11099 thiss!1830))) (bvsub (bvmul ((_ sign_extend 32) (size!5500 (buf!5975 thiss!1830))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11104 thiss!1830)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11099 thiss!1830)))))))

(assert (=> d!79742 d!79788))

(declare-fun d!79790 () Bool)

(assert (=> d!79790 (= (remainingBits!0 ((_ sign_extend 32) (size!5500 (buf!5975 (_2!10868 lt!371580)))) ((_ sign_extend 32) (currentByte!11104 (_2!10868 lt!371580))) ((_ sign_extend 32) (currentBit!11099 (_2!10868 lt!371580)))) (bvsub (bvmul ((_ sign_extend 32) (size!5500 (buf!5975 (_2!10868 lt!371580)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11104 (_2!10868 lt!371580))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11099 (_2!10868 lt!371580))))))))

(assert (=> d!79748 d!79790))

(declare-fun d!79792 () Bool)

(declare-fun e!163410 () Bool)

(assert (=> d!79792 e!163410))

(declare-fun res!197548 () Bool)

(assert (=> d!79792 (=> (not res!197548) (not e!163410))))

(declare-fun lt!371721 () (_ BitVec 64))

(declare-fun lt!371717 () (_ BitVec 64))

(declare-fun lt!371718 () (_ BitVec 64))

(assert (=> d!79792 (= res!197548 (= lt!371717 (bvsub lt!371721 lt!371718)))))

(assert (=> d!79792 (or (= (bvand lt!371721 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371718 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!371721 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!371721 lt!371718) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79792 (= lt!371718 (remainingBits!0 ((_ sign_extend 32) (size!5500 (buf!5975 (_2!10871 (increaseBitIndex!0 thiss!1830))))) ((_ sign_extend 32) (currentByte!11104 (_2!10871 (increaseBitIndex!0 thiss!1830)))) ((_ sign_extend 32) (currentBit!11099 (_2!10871 (increaseBitIndex!0 thiss!1830))))))))

(declare-fun lt!371720 () (_ BitVec 64))

(declare-fun lt!371719 () (_ BitVec 64))

(assert (=> d!79792 (= lt!371721 (bvmul lt!371720 lt!371719))))

(assert (=> d!79792 (or (= lt!371720 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!371719 (bvsdiv (bvmul lt!371720 lt!371719) lt!371720)))))

(assert (=> d!79792 (= lt!371719 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!79792 (= lt!371720 ((_ sign_extend 32) (size!5500 (buf!5975 (_2!10871 (increaseBitIndex!0 thiss!1830))))))))

(assert (=> d!79792 (= lt!371717 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11104 (_2!10871 (increaseBitIndex!0 thiss!1830)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11099 (_2!10871 (increaseBitIndex!0 thiss!1830))))))))

(assert (=> d!79792 (invariant!0 (currentBit!11099 (_2!10871 (increaseBitIndex!0 thiss!1830))) (currentByte!11104 (_2!10871 (increaseBitIndex!0 thiss!1830))) (size!5500 (buf!5975 (_2!10871 (increaseBitIndex!0 thiss!1830)))))))

(assert (=> d!79792 (= (bitIndex!0 (size!5500 (buf!5975 (_2!10871 (increaseBitIndex!0 thiss!1830)))) (currentByte!11104 (_2!10871 (increaseBitIndex!0 thiss!1830))) (currentBit!11099 (_2!10871 (increaseBitIndex!0 thiss!1830)))) lt!371717)))

(declare-fun b!236358 () Bool)

(declare-fun res!197549 () Bool)

(assert (=> b!236358 (=> (not res!197549) (not e!163410))))

(assert (=> b!236358 (= res!197549 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!371717))))

(declare-fun b!236359 () Bool)

(declare-fun lt!371716 () (_ BitVec 64))

(assert (=> b!236359 (= e!163410 (bvsle lt!371717 (bvmul lt!371716 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!236359 (or (= lt!371716 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!371716 #b0000000000000000000000000000000000000000000000000000000000001000) lt!371716)))))

(assert (=> b!236359 (= lt!371716 ((_ sign_extend 32) (size!5500 (buf!5975 (_2!10871 (increaseBitIndex!0 thiss!1830))))))))

(assert (= (and d!79792 res!197548) b!236358))

(assert (= (and b!236358 res!197549) b!236359))

(declare-fun m!358929 () Bool)

(assert (=> d!79792 m!358929))

(declare-fun m!358931 () Bool)

(assert (=> d!79792 m!358931))

(assert (=> b!236329 d!79792))

(assert (=> b!236329 d!79776))

(declare-fun d!79794 () Bool)

(declare-fun e!163411 () Bool)

(assert (=> d!79794 e!163411))

(declare-fun res!197550 () Bool)

(assert (=> d!79794 (=> (not res!197550) (not e!163411))))

(declare-fun lt!371723 () (_ BitVec 64))

(declare-fun lt!371724 () (_ BitVec 64))

(declare-fun lt!371727 () (_ BitVec 64))

(assert (=> d!79794 (= res!197550 (= lt!371723 (bvsub lt!371727 lt!371724)))))

(assert (=> d!79794 (or (= (bvand lt!371727 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371724 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!371727 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!371727 lt!371724) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79794 (= lt!371724 (remainingBits!0 ((_ sign_extend 32) (size!5500 (buf!5975 thiss!1830))) ((_ sign_extend 32) (currentByte!11104 thiss!1830)) ((_ sign_extend 32) (currentBit!11099 thiss!1830))))))

(declare-fun lt!371726 () (_ BitVec 64))

(declare-fun lt!371725 () (_ BitVec 64))

(assert (=> d!79794 (= lt!371727 (bvmul lt!371726 lt!371725))))

(assert (=> d!79794 (or (= lt!371726 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!371725 (bvsdiv (bvmul lt!371726 lt!371725) lt!371726)))))

(assert (=> d!79794 (= lt!371725 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!79794 (= lt!371726 ((_ sign_extend 32) (size!5500 (buf!5975 thiss!1830))))))

(assert (=> d!79794 (= lt!371723 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11104 thiss!1830)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11099 thiss!1830))))))

(assert (=> d!79794 (invariant!0 (currentBit!11099 thiss!1830) (currentByte!11104 thiss!1830) (size!5500 (buf!5975 thiss!1830)))))

(assert (=> d!79794 (= (bitIndex!0 (size!5500 (buf!5975 thiss!1830)) (currentByte!11104 thiss!1830) (currentBit!11099 thiss!1830)) lt!371723)))

(declare-fun b!236360 () Bool)

(declare-fun res!197551 () Bool)

(assert (=> b!236360 (=> (not res!197551) (not e!163411))))

(assert (=> b!236360 (= res!197551 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!371723))))

(declare-fun b!236361 () Bool)

(declare-fun lt!371722 () (_ BitVec 64))

(assert (=> b!236361 (= e!163411 (bvsle lt!371723 (bvmul lt!371722 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!236361 (or (= lt!371722 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!371722 #b0000000000000000000000000000000000000000000000000000000000001000) lt!371722)))))

(assert (=> b!236361 (= lt!371722 ((_ sign_extend 32) (size!5500 (buf!5975 thiss!1830))))))

(assert (= (and d!79794 res!197550) b!236360))

(assert (= (and b!236360 res!197551) b!236361))

(assert (=> d!79794 m!358879))

(assert (=> d!79794 m!358881))

(assert (=> b!236329 d!79794))

(push 1)

(assert (not d!79786))

(assert (not d!79792))

(assert (not d!79794))

(assert (not b!236352))

(assert (not d!79776))

(check-sat)

(pop 1)

(push 1)

(check-sat)

